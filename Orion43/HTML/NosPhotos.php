<?php
require_once '../PHP/classe_objet/database.php';
require_once '../PHP/classe_objet/Categorie.php';

$db = Database::getInstance();
$type = $_GET['type'] ?? null;
$categories = [];

$map = [
    'astronomie' => [1,2,3,4,5,6,8,9,10,11],
    'paysages'   => [12,13,14,15,16,17,18,19],
    'techniques' => [20,21]
];

if ($type && isset($map[$type])) {
    $ids = implode(',', $map[$type]);
    $sql = "SELECT categorie_id, nom FROM categorie_photo WHERE categorie_id IN ($ids) ORDER BY nom";
    $categories = $db->getObjects($sql, 'Categorie');
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orion 43 - Nos photos</title>
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/stylenosphotos.css">
</head>
<body>
    <!-- Navigation -->
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
                <li><a href="Contact.html" class="nav-link">Contact</a></li>
            </ul>
        </div>
    </nav>

    <canvas id="space"></canvas>
    Nos Photos
    <div class="page">
        <a href="catégories.php?type=astronomie" class="bande astronomie">
            <strong>ASTRONOMIE</strong>
        </a>

        <a href="catégories.php?type=paysages" class="bande paysages">
            <strong>PAYSAGES ET CIEL</strong>
        </a>

        <a href="catégories.php?type=techniques" class="bande techniques">
            <strong>TECHNIQUES</strong>
        </a>
    </div>

    <?php if ($type && !empty($categories)): ?>
    <div class="categories-container">
        <h2><?= strtoupper(htmlspecialchars($type)) ?></h2>
        <div class="categories-grid">
            <?php foreach ($categories as $cat): ?>
            <a class="category-card" href="sous-categorie.php?categorie=<?= $cat->getId() ?>">
                <span class="category-title"><?= htmlspecialchars($cat->getNom()) ?></span>
            </a>
            <?php endforeach; ?>
        </div>
    </div>
    <?php endif; ?>

    <!-- Footer -->
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