<?php
include("config/bdd.php");

// On récupère tous les articles de la base de données
$actuvariable = $pdo->query("SELECT * FROM article ORDER BY article_id Asc")->fetchAll();
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
    <link rel="stylesheet" href="../CSS/actualiter.css">
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
                <li><a href="../HTML/Index.html" class="nav-link">Accueil</a></li>
                <li><a href="actualites.php" class="nav-link">Actualités</a></li>
                <li><a href="../HTML/NosActivites.html" class="nav-link">Nos activités</a></li>
                <li><a href="../HTML/NosPhotos.html" class="nav-link">Nos photos</a></li>
                <li><a href="../HTML/Contact.html" class="nav-link">Contact</a></li>
            </ul>
        </div>
    </nav>
        <h1>Nos dernières actualités</h1>
    </header>
    
    <main>
        <div class="item">
        <?php
            foreach($actuvariable as $lava){
                echo "<div class='article-card'>";
                if (strpos($lava["photo"], 'http') !== false) {
                    echo "<iframe src='".$lava["photo"]."' frameborder='0' allowfullscreen></iframe>";
                } else {
                    echo "<img alt='article' src='../".$lava["photo"]."' />";
                }
            echo $lava["titre"] ."<br>" ;
            echo $lava["date_publication"] ."<br>" ;
            echo $lava["contenu"] ."<br>" ;
            }
        ?>
        </div>
    </main>
    
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
</body>
</html>