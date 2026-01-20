<?php
require_once '../PHP/classe_objet/database.php';
require_once '../PHP/classe_objet/Photo.php';
require_once '../PHP/classe_objet/Categorie.php';

$db = Database::getInstance();
$categorie_id = $_GET['categorie'] ?? null;

if (!$categorie_id) {
    die('Catégorie manquante');
}

// Si c'est une requête AJAX pour charger les photos
if (isset($_GET['ajax']) && $_GET['ajax'] === '1') {
    header('Content-Type: application/json');
    
    $sql = "SELECT photo_id, url, titre, infos_techniques, date_prise
            FROM photo
            WHERE categorie_id = :id
            ORDER BY photo_id DESC";
    
    $photos = $db->getObjects($sql, 'Photo', [':id' => $categorie_id]);
    
    $result = [];
    foreach ($photos as $photo) {
        $result[] = [
            'url' => $photo->getUrl(),
            'titre' => $photo->getTitre(),
            'infos_techniques' => $photo->getInfosTechniques(),
            'date_prise' => $photo->getDate()
        ];
    }
    
    echo json_encode($result);
    exit;
}

// Récupération du nom de catégorie
$sqlCat = "SELECT categorie_id, nom FROM categorie_photo WHERE categorie_id = :id";
$categorie = $db->getObjects($sqlCat, 'Categorie', [':id' => $categorie_id]);
$nomCategorie = !empty($categorie) ? $categorie[0]->getNom() : 'Galerie';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orion 43 - <?= htmlspecialchars($nomCategorie) ?></title>
    <link rel="stylesheet" href="../CSS/stylenosphotos.css">
    <link rel="stylesheet" href="../CSS/style.css">
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <a href="Index.html" class="logo">
                <img src="../Image/CharteGraphique/logo blanc.png" alt="Orion 43 Logo">
            </a>
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="nav-menu">
                <li><a href="Index.html" class="nav-link">Accueil</a></li>
                <li><a href="actualites_poo.php" class="nav-link">Actualités</a></li>
                <li><a href="nosActivites_poo.php" class="nav-link">Nos activités</a></li>
                <li><a href="NosPhotos.php" class="nav-link">Nos photos</a></li>
                <li><a href="Contact.html">Contact</a></li>
            </ul>
        </div>
    </nav>

    <canvas id="space"></canvas>

    <main class="main-content">
        <h1><?= htmlspecialchars($nomCategorie) ?></h1>

        <div id="photos-container">
            <div class="loading">Chargement des photos...</div>
        </div>
    </main>

    <footer class="footer">
        <div class="footer-top">
            <div class="footer-top-left">
                <a href="Index.html" class="footer-logo">
                    <img src="../Image/CharteGraphique/logo blanc.png" alt="Orion 43 Logo">
                </a>
            </div>
            <div class="footer-top-center">
                <ul class="footer-nav">
                    <li><a href="Index.html">Accueil</a></li>
                    <li><a href="actualites_poo.php">Actualités</a></li>
                    <li><a href="nosActivites_poo.php">Nos activités</a></li>
                    <li><a href="NosPhotos.php">Nos photos</a></li>
                    <li><a href="Contact.html">Contact</a></li>
                </ul>
            </div>
            <div class="footer-top-right">
                <a href="https://www.facebook.com/43orion/" class="social-link" aria-label="Facebook">
                    <img src="../Image/LogoRS/facebook.svg" alt="Facebook">
                </a>
                <a href="https://x.com/43Orion" class="social-link" aria-label="X">
                    <img src="../Image/LogoRS/x.svg" alt="X">
                </a>
                <a href="https://www.youtube.com/@orionastronomieduvelay1744" class="social-link" aria-label="YouTube">
                    <img src="../Image/LogoRS/youtube.svg" alt="YouTube">
                </a>
            </div>
        </div>
        <div class="footer-bottom">
            <p class="footer-copyright">&copy; 2024 Orion 43. Tous droits réservés.</p>
            <ul class="footer-legal-links">
                <li><a href="#">Politique de confidentialité</a></li>
                <li><a href="#">Conditions d'utilisation</a></li>
            </ul>
        </div>
    </footer>

    <script type="module" src="../JS/EtoileFond.js"></script>
    <script>
        // Fonction pour formater la date
        function formatDate(dateStr) {
            if (!dateStr || dateStr === '0000-00-00') return 'Date inconnue';
            const date = new Date(dateStr);
            return date.toLocaleDateString('fr-FR');
        }

        // Chargement des photos via AJAX
        function loadPhotos() {
            const categorieId = <?= json_encode($categorie_id) ?>;
            const container = document.getElementById('photos-container');

            fetch(`?categorie=${categorieId}&ajax=1`)
                .then(response => {
                    if (!response.ok) throw new Error('Erreur réseau');
                    return response.json();
                })
                .then(photos => {
                    if (photos.length === 0) {
                        container.innerHTML = '<p style="text-align: center; padding: 2rem;">Aucune photo dans cette catégorie.</p>';
                        return;
                    }

                    const grid = document.createElement('div');
                    grid.className = 'grid';

                    photos.forEach(photo => {
                        const card = document.createElement('div');
                        card.className = 'card';

                        const img = document.createElement('img');
                        img.src = '../' + photo.url;
                        img.alt = photo.titre || 'Photo astronomie';
                        img.onerror = function() {
                            this.src = '../Image/placeholder.jpg';
                        };

                        const overlay = document.createElement('div');
                        overlay.className = 'overlay';

                        const titre = document.createElement('p');
                        titre.textContent = photo.titre || 'Sans titre';

                        const infos = document.createElement('p');
                        infos.textContent = photo.infos_techniques || '';

                        const date = document.createElement('p');
                        date.textContent = formatDate(photo.date_prise);

                        overlay.appendChild(titre);
                        if (photo.infos_techniques) overlay.appendChild(infos);
                        overlay.appendChild(date);

                        card.appendChild(img);
                        card.appendChild(overlay);
                        grid.appendChild(card);
                    });

                    container.innerHTML = '';
                    container.appendChild(grid);
                })
                .catch(error => {
                    console.error('Erreur:', error);
                    container.innerHTML = '<p style="text-align: center; padding: 2rem; color: red;">Erreur lors du chargement des photos.</p>';
                });
        }

        // Charger les photos au chargement de la page
        document.addEventListener('DOMContentLoaded', loadPhotos);

        // Menu hamburger
        const hamburger = document.querySelector('.hamburger');
        const navMenu = document.querySelector('.nav-menu');

        hamburger.addEventListener('click', () => {
            navMenu.classList.toggle('active');
            hamburger.classList.toggle('active');
        });

        const navLinks = document.querySelectorAll('.nav-link');
        navLinks.forEach(link => {
            link.addEventListener('click', () => {
                navMenu.classList.remove('active');
                hamburger.classList.remove('active');
            });
        });
    </script>
</body>
</html>