<?php
include '../PHP/classe_objet/database.php';

$pdo = Database::getInstance()->pdo;

// Paramètres de tri
$tri = isset($_GET['tri']) ? $_GET['tri'] : 'recent';

// Construction de la requête
$query = "SELECT * FROM article";

// Tri
switch($tri) {
    case 'ancien':
        $query .= " ORDER BY date_publication ASC";
        break;
    case 'titre_az':
        $query .= " ORDER BY titre ASC";
        break;
    case 'titre_za':
        $query .= " ORDER BY titre DESC";
        break;
    case 'recent':
    default:
        $query .= " ORDER BY date_publication DESC";
        break;
}

// Exécution
$articles = $pdo->query($query)->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orion 43 - Actualités</title>
    <link rel="apple-touch-icon" sizes="180x180" href="../Image/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../Image/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../Image/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="../Image/favicon_io/site.webmanifest">
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/actualites.css">
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

    <header class="header-img SG">
        <h1>Nos dernières actualités</h1>
    </header>
    
    <main class="actualites-section">
        <!-- Filtres et tri -->
        <div class="actualites-filters">
            <div class="sort-buttons">
                <span class="sort-label">Trier par :</span>
                <a href="?tri=recent" class="sort-btn <?= $tri === 'recent' ? 'active' : '' ?>">
                    Date (Récent)
                </a>
                <a href="?tri=ancien" class="sort-btn <?= $tri === 'ancien' ? 'active' : '' ?>">
                    Date (Ancien)
                </a>
                <a href="?tri=titre_az" class="sort-btn <?= $tri === 'titre_az' ? 'active' : '' ?>">
                    Titre (A-Z)
                </a>
                <a href="?tri=titre_za" class="sort-btn <?= $tri === 'titre_za' ? 'active' : '' ?>">
                    Titre (Z-A)
                </a>
            </div>
        </div>

        <div class="actualites-grid">
            <?php foreach($articles as $article): ?>
            <article class="actualite-card">
                <div class="actualite-image">
                    <?php if (!empty($article["photo"])): ?>
                        <?php if (strpos($article["photo"], 'http') !== false): ?>
                            <iframe src="<?= htmlspecialchars($article["photo"]) ?>" frameborder="0" allowfullscreen></iframe>
                        <?php else: ?>
                            <img src="../<?= htmlspecialchars($article["photo"]) ?>" alt="<?= htmlspecialchars($article["titre"]) ?>">
                        <?php endif; ?>
                    <?php else: ?>
                        <img src="../Image/imageAccueil/APropos.jpg" alt="<?= htmlspecialchars($article["titre"]) ?>">
                    <?php endif; ?>
                </div>
                <div class="actualite-content">
                    <h3><?= htmlspecialchars($article["titre"]) ?></h3>
                    <p class="actualite-date"><?= htmlspecialchars($article["date_publication"]) ?></p>
                    <p class="actualite-description">
                        <?= htmlspecialchars(substr($article["contenu"], 0, 150)) ?>...
                    </p>
                    <a href="#" class="read-more">En savoir plus <span>›</span></a>
                </div>
            </article>
            <?php endforeach; ?>
        </div>
    </main>

    <canvas id="space"></canvas>
    
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

        <!-- Deuxième ligne du footer -->
        <div class="footer-bottom">
            <p class="footer-copyright">&copy; 2024 Orion 43. Tous droits réservés.</p>
            <ul class="footer-legal-links">
                <li><a href="#">Politique de confidentialité</a></li>
                <li><a href="#">Conditions d'utilisation</a></li>
            </ul>
        </div>
    </footer>

    <!-- Script pour le fond étoilé -->
    <script type="module" src="../JS/EtoileFond.js"></script>

    <!-- Script pour mettre en évidence le lien actif de la navigation -->
    <script src="../JS/ActiveNavLink.js"></script>
</body>
</html>