<?php
require_once '../PHP/config.php';
require_once '../PHP/classes.php';

// Créer le gestionnaire d'articles
$articleManager = new ArticleManager();

// Récupérer tous les articles
$articles = $articleManager->getAll();
$articlesEpingles = $articleManager->getEpingles();
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
                <li><a href="Actualites.php" class="nav-link">Actualités</a></li>
                <li><a href="NosActivites.php" class="nav-link">Nos activités</a></li>
                <li><a href="NosPhotos.php" class="nav-link">Nos photos</a></li>
                <li><a href="Contact.html" class="nav-link">Contact</a></li>
            </ul>
        </div>
    </nav>

    <canvas id="space"></canvas>

    <!-- Contenu principal -->
    <main class="main-content">
        <h1>Actualités</h1>

        <?php if (!empty($articlesEpingles)): ?>
        <section class="articles-epingles">
            <h2>📌 À la une</h2>
            <div class="articles-grid-featured">
                <?php foreach ($articlesEpingles as $article): ?>
                <article class="article-card featured">
                    <div class="article-header">
                        <span class="article-badge">Épinglé</span>
                        <span class="article-date"><?= htmlspecialchars($article->getDateFormatee()) ?></span>
                    </div>
                    <h3><?= htmlspecialchars($article->getTitre()) ?></h3>
                    <p class="article-extrait"><?= htmlspecialchars($article->getExtrait(200)) ?></p>
                    <a href="article.php?slug=<?= urlencode($article->getSlug()) ?>" class="btn-lire-plus">
                        Lire la suite →
                    </a>
                </article>
                <?php endforeach; ?>
            </div>
        </section>
        <?php endif; ?>

        <section class="tous-articles">
            <h2>Toutes les actualités</h2>
            <div class="articles-grid">
                <?php if (!empty($articles)): ?>
                    <?php foreach ($articles as $article): ?>
                    <article class="article-card">
                        <div class="article-meta">
                            <span class="article-date">
                                📅 <?= htmlspecialchars($article->getDateFormatee()) ?>
                            </span>
                        </div>
                        <h3><?= htmlspecialchars($article->getTitre()) ?></h3>
                        <p class="article-extrait">
                            <?= htmlspecialchars($article->getExtrait(150)) ?>
                        </p>
                        <a href="article.php?slug=<?= urlencode($article->getSlug()) ?>" class="btn-lire-plus">
                            Lire la suite
                        </a>
                    </article>
                    <?php endforeach; ?>
                <?php else: ?>
                    <p class="no-articles">Aucune actualité pour le moment.</p>
                <?php endif; ?>
            </div>
        </section>
    </main>

    <!-- Footer -->
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
                    <li><a href="Actualites.php">Actualités</a></li>
                    <li><a href="NosActivites.php">Nos activités</a></li>
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
                <a href="www.youtube.com/@orionastronomieduvelay1744" class="social-link" aria-label="YouTube">
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