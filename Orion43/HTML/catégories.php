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

$backgrounds = [
    1  => 'lune_001.jpg',
    2  => 'soleil_001.png',
    3  => 'mars_001.png',
    4  => 'jupiter_002.jpg',
    5  => 'saturne_002.jpg',
    6  => 'nebuleuse_001.jpg',
    8  => 'nebuleuse_anulaire.jpg',
    9  => 'galaxie_001.jpg',
    10 => 'amas_globulaire_001.jpg',
    11 => 'cometes_001.jpg',

    12 => 'voie_lactee_001.jpg',
    13 => 'circumpolaire_001.jpg',
    14 => 'arc_en_ciel_001.jpg',
    15 => 'nuage_irise_001.jpg',
    16 => 'etoiles_001.jpg',
    17 => 'conjonction_001.jpg',
    18 => 'coucher_soleil_001.jpg',
    19 => 'grands_champ_001.jpg',

    20 => 'time_lapse_001.gif',
    21 => 'spectro_001.jpg'
];

if (isset($map[$type])) {
    $ids = implode(',', $map[$type]);

    $sql = "SELECT categorie_id, nom, slug
            FROM categorie_photo
            WHERE categorie_id IN ($ids)
            ORDER BY nom";

    $categories = $db->getObjects($sql, 'Categorie');
}

?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Orion 43 - <?= strtoupper(htmlspecialchars($type ?? '')) ?></title>
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/stylenosphotos.css">
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

    <main class="main-content">
        <h1><?= strtoupper(htmlspecialchars($type ?? '')) ?></h1>

    <?php foreach ($categories as $cat):
        $id = $cat->getId();
        $bg = $backgrounds[$id] ?? 'default.jpg';
    ?>
        <a href="sous-catégorie.php?categorie=<?= $id ?>"
           class="category-card"
           style="background-image: url('../Image/categories/<?= $bg ?>');">

            <div class="overlay"></div>

            <span class="category-title">
                <?= htmlspecialchars($cat->getNom()) ?>
            </span>
        </a>
    <?php endforeach; ?>
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
</body>
</html>