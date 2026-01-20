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
    
    $limit = intval($_GET['limit'] ?? 12);
    $offset = intval($_GET['offset'] ?? 0);
    
    $sql = "SELECT photo_id, url, titre, infos_techniques, date_prise
            FROM photo
            WHERE categorie_id = :id
            ORDER BY photo_id DESC
            LIMIT :limit OFFSET :offset";
    
    $stmt = $db->pdo->prepare($sql);
    $stmt->bindValue(':id', $categorie_id, PDO::PARAM_INT);
    $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();
    $photos = $stmt->fetchAll(PDO::FETCH_CLASS, 'Photo');
    
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
            <a href="Index.php" class="logo">
                <img src="../Image/CharteGraphique/logo blanc.png" alt="Orion 43 Logo">
            </a>
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="nav-menu">
                <li><a href="Index.php" class="nav-link">Accueil</a></li>
                <li><a href="actualites.php" class="nav-link">Actualités</a></li>
                <li class="nav-item">
                    <a href="NosActivites.html" class="nav-link">Nos activités</a>
                    <div class="dropdown-menu">
                        <a href="activiteslien/astrophotographie.html">Astrophotographie</a>
                        <a href="activiteslien/conferences.html">Conférences</a>
                        <a href="activiteslien/jeuneorion.html">Jeune Orion</a>
                        <a href="activiteslien/observation.html">Observation</a>
                        <a href="activiteslien/observationsolaire.html">Observation Solaire</a>
                        <a href="activiteslien/soireepublique.html">Soirée Publique</a>
                        <a href="activiteslien/spectrologie.html">Spectrologie</a>
                    </div>
                </li>
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
        
        <button id="load-more-btn" style="display:none; margin: 30px auto; padding: 12px 30px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 16px;">
            Charger plus de photos
        </button>
    </main>

    <footer class="footer">
        <div class="footer-top">
            <div class="footer-top-left">
                <a href="Index.php" class="footer-logo">
                    <img src="../Image/CharteGraphique/logo blanc.png" alt="Orion 43 Logo">
                </a>
            </div>
            <div class="footer-top-center">
                <ul class="footer-nav">
                    <li><a href="Index.php">Accueil</a></li>
                    <li><a href="actualites.php">Actualités</a></li>
                    <li><a href="NosActivites.html">Nos activités</a></li>
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
    <script src="../JS/ActiveNavLink.js"></script>
    <script>
        // Fonction pour formater la date
        function formatDate(dateStr) {
            if (!dateStr || dateStr === '0000-00-00') return 'Date inconnue';
            const date = new Date(dateStr);
            return date.toLocaleDateString('fr-FR');
        }

        // Constantes pour la pagination
        const PHOTOS_PAR_PAGE = 12;
        let photosActuelles = 0;
        let toutesPhotosChargees = false;

        // Chargement des photos via AJAX
        function loadPhotos(append = false) {
            const categorieId = <?= json_encode($categorie_id) ?>;
            const container = document.getElementById('photos-container');
            const loadMoreBtn = document.getElementById('load-more-btn');
            
            console.log('Chargement des photos pour la catégorie:', categorieId);

            fetch(`sous-catégorie.php?categorie=${categorieId}&ajax=1&offset=${photosActuelles}&limit=${PHOTOS_PAR_PAGE}`)
                .then(response => {
                    console.log('Réponse:', response.status);
                    if (!response.ok) throw new Error('Erreur réseau: ' + response.status);
                    return response.json();
                })
                .then(photos => {
                    // Si c'est le premier chargement et pas d'append
                    if (!append) {
                        container.innerHTML = '';
                    }
                    
                    if (photos.length === 0) {
                        if (photosActuelles === 0) {
                            container.innerHTML = '<p style="text-align: center; padding: 2rem;">Aucune photo dans cette catégorie.</p>';
                        }
                        toutesPhotosChargees = true;
                        loadMoreBtn.style.display = 'none';
                        return;
                    }

                    const grid = append ? container.querySelector('.grid') : document.createElement('div');
                    if (!append) {
                        grid.className = 'grid';
                    }

                    photos.forEach(photo => {
                        const card = document.createElement('div');
                        card.className = 'card';

                        const img = document.createElement('img');
                        // Construire le chemin correctement
                        let imagePath = photo.url;
                        console.log('URL brute de la BD:', imagePath);
                        
                        // Supprimer le préfixe "images/" s'il existe
                        if (imagePath.startsWith('images/')) {
                            imagePath = imagePath.substring(7); // Enlever "images/"
                        }
                        
                        // Ajouter le chemin relatif
                        imagePath = '../Image/' + imagePath;
                        
                        console.log('Chemin final:', imagePath);
                        
                        img.src = imagePath;
                        img.alt = photo.titre || 'Photo astronomie';
                        
                        // Gestion des erreurs - ne charger qu'une fois
                        let errorAttempted = false;
                        img.onerror = function() {
                            if (!errorAttempted) {
                                errorAttempted = true;
                                console.warn('Image non trouvée:', imagePath);
                                this.src = '../Image/ImageSite/logo/logo.png'; // Fallback simple
                            }
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

                    if (!append) {
                        container.appendChild(grid);
                    }
                    
                    // Mettre à jour le compteur
                    photosActuelles += photos.length;
                    
                    // Afficher le bouton si moins de photos que demandé (toutes chargées)
                    if (photos.length < PHOTOS_PAR_PAGE) {
                        toutesPhotosChargees = true;
                        loadMoreBtn.style.display = 'none';
                    } else {
                        loadMoreBtn.style.display = 'block';
                    }
                })
                .catch(error => {
                    console.error('Erreur:', error);
                    container.innerHTML = '<p style="text-align: center; padding: 2rem; color: red;">Erreur lors du chargement des photos.</p>';
                });
        }

        // Charger les photos au chargement de la page
        document.addEventListener('DOMContentLoaded', () => {
            loadPhotos(false);
            
            // Event listener pour le bouton "Charger plus"
            const loadMoreBtn = document.getElementById('load-more-btn');
            loadMoreBtn.addEventListener('click', () => {
                loadMoreBtn.disabled = true;
                loadMoreBtn.textContent = 'Chargement...';
                loadPhotos(true);
                loadMoreBtn.disabled = false;
                loadMoreBtn.textContent = 'Charger plus de photos';
            });
        });

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