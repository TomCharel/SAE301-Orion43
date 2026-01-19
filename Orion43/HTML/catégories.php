<?php
include_once '../PHP/classe_objet/database.php';
include_once '../PHP/classe_objet/Classe_Categorie.php';

$db = Database::getInstance();

$type = $_GET['type'] ?? null;
$categories = [];

$map = [
    'astronomie' => [1,2,3,4,5,6,8,9,10,11],
    'paysages'   => [12,13,14,15,16,17,18,19],
    'techniques' => [20,21]
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
    <title>Sous-catégories</title>
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../css/stylenosphotos.css">
</head>
<body>
 <!-- Navigation -->
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
                <li><a href="Actualites.html" class="nav-link">Actualités</a></li>
                <li><a href="NosActivites.html" class="nav-link">Nos activités</a></li>
                <li><a href="NosPhotos.html" class="nav-link">Nos photos</a></li>
                <li><a href="Contact.html" class="nav-link">Contact</a></li>
            </ul>
        </div>
    </nav>

<body>
    <canvas id="space"></canvas>
<h1>
    <?= strtoupper(htmlspecialchars($type)) ?>
</h1>

<main class="main-content">
<div class="categories-grid">
<?php foreach ($categories as $cat): ?>
    <a class="category-card"
       href="sous-catégorie.php?categorie=<?= $cat->getId() ?>">

        <span class="category-title">
            <?= htmlspecialchars($cat->getNom()) ?>
        </span>

        <img
            src="../Image/categories/<?= htmlspecialchars($cat->getSlug()) ?>.jpg"
            alt="<?= htmlspecialchars($cat->getNom()) ?>">
    </a>
<?php endforeach; ?>
</div>

    </div>

</main>

</body>

  <!-- Script pour le fond étoilé -->
<script type="module" src="../JS/EtoileFond.js"></script>
 <!-- Footer -->
    <footer class="footer">
        <!-- Première ligne du footer -->
        <div class="footer-top">
            <div class="footer-top-left">
                <a href="Index.html" class="footer-logo">
                    <img src="../Image/CharteGraphique/logo blanc.png" alt="Orion 43 Logo">
                </a>
            </div>
            <div class="footer-top-center">
                <ul class="footer-nav">
                    <li><a href="Index.html">Accueil</a></li>
                    <li><a href="Actualites.html">Actualités</a></li>
                    <li><a href="NosActivites.html">Nos activités</a></li>
                    <li><a href="NosPhotos.html">Nos photos</a></li>
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
                <a href="www.youtube.com/@orionastronomieduvelay1744" class="social-link" aria-label="YouTube">
                    <img src="../Image/LogoRS/youtube.svg" alt="YouTube">
                </a>
            </div>
        </div>

        <!-- Deuxième ligne du footer -->
        <div class="footer-bottom">
            <p class="footer-copyright">&copy; 2024 Orion 43. Tous droits réservés.</p>
            <ul class="footer-legal-links">
                <li><a href="#">Politique de confidentialité</a></li>
                <li><a href="#">Conditions d'utilisation</a></li>
            </ul>
        </div>
    </footer>
</html>
