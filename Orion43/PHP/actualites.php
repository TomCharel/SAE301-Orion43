<?php
include("bdd.php");

// On récupère tous les articles de la base de données
$actuvariable = $pdo->query("SELECT * FROM article ORDER BY article_id DESC")->fetchAll();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="cssarcticle.css">
    <title>Nos dernières actualités</title>
</head>
<body>
    <header>
        <div id="logoclicable">
            <button><img src="image/logo" alt="Logo"></button>
        </div>
        <nav>
            <ul class="nav-lien">
                <li><a href="accueil.php">Accueil</a></li>
                <li><a href="actualites.php">Actualités</a></li>
                <li><a href="nos-actualites.php">Nos Actualités</a></li>
                <li><a href="nos-photos.php">Nos photos</a></li>
                <li><a href="contact.php">Contact</a></li>
            </ul>
            <button>Bouton</button>
        </nav>
        <h1>Nos dernières actualités</h1>
    </header>
    
    <main>
        <?php
            foreach($actuvariable as $lava){
            echo $lava["titre"] ."<br>" ;
            echo $lava["date_publication"] ."<br>" ;
            echo $lava["contenu"] ."<br>" ;
            }
        ?>
    </main>
    
    <footer>
        <div id="logoclicable">
            <button><img src="image/logo" alt="Logo"></button>
        </div>
        <nav>
            <ul class="nav-lien">
                <li><a href="accueil.php">Accueil</a></li>
                <li><a href="actualites.php">Actualités</a></li>
                <li><a href="nos-actualites.php">Nos Actualités</a></li>
                <li><a href="nos-photos.php">Nos photos</a></li>
                <li><a href="contact.php">Contact</a></li>
            </ul>
        </nav>
        <div id="logosocial">
            <input type="search">
            <button><img src="image/logoreseaux" alt="Réseaux sociaux"></button>
        </div>
        <div class="paprase">
            <p>2024 Relume. All rights reserved</p>
            <p>Privacy Policy</p>
            <p>Terms of Service</p>
            <p>Cookies Settings</p>
        </div>
    </footer>
</body>
</html>