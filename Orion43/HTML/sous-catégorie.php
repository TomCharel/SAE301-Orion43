<?php
include_once '../PHP/classe_objet/database.php';
include_once '../PHP/classe_objet/Photo.php';
include_once '../PHP/classe_objet/Classe_Categorie.php';

$db = Database::getInstance();

$categorie_id = $_GET['categorie'] ?? null;
if (!$categorie_id) die('Catégorie manquante');

$sql = "SELECT photo_id, url, titre, infos_techniques, date_prise
        FROM photo
        WHERE categorie_id = :id
        ORDER BY photo_id DESC";

$photos = $db->getObjects($sql, 'Photo', [
    ':id' => $categorie_id
]);

/* 🔹 Nom de la sous-catégorie */
$sqlCat = "SELECT categorie_id, nom, slug
           FROM categorie_photo
           WHERE categorie_id = :id";

$categorie = $db->getObjects($sqlCat, 'Categorie', [
    ':id' => $categorie_id
]);

$nomCategorie = !empty($categorie)
    ? $categorie[0]->getNom()
    : 'Galerie';

?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Photos</title>
        <link rel="stylesheet" href="../css/styleNosPhotos.css">
    <link rel="stylesheet" href="../css/style.css">
    <style>
       
    </style>
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
<main class="main-content">
        <canvas id="space"></canvas>
<h1>
    <?= htmlspecialchars($nomCategorie) ?>
</h1>

    <div class="grid">
    <?php if (empty($photos)): ?>
        <p>Aucune photo dans cette catégorie.</p>
    <?php else: ?>
        <?php foreach ($photos as $photo): ?>
    <div class="card">
        <img src="/page_nos_photos/<?= htmlspecialchars($photo->getUrl()) ?>">
        <div class="overlay">
            <p><?= htmlspecialchars($photo->getTitre()) ?></p>
            <p><?= htmlspecialchars($photo->getInfosTechniques()) ?></p>
            <p><?= date('d/m/Y', strtotime($photo->getDate())) ?></p>
        </div>
    </div>
<?php endforeach; ?>

    <?php endif; ?>
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
