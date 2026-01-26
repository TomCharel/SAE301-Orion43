<?php
require_once '../PHP/config.php';
require_once '../PHP/orion_poo_classes.php';

// Créer le gestionnaire d'événements
$evenementManager = new EvenementManager();

// Récupérer les événements à venir
$evenementsAVenir = $evenementManager->getAVenir();

// Traitement du formulaire de réservation
$messageReservation = '';
$typeMessage = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['reserver'])) {
    $reservation = new Reservation();
    $reservation->setNom($_POST['nom'] ?? '');
    $reservation->setEmail($_POST['email'] ?? '');
    $reservation->setTelephone($_POST['telephone'] ?? '');
    $reservation->setNbPlaces($_POST['nb_places'] ?? 1);
    $reservation->setEvenementId($_POST['evenement_id'] ?? 0);
    
    $resultat = $reservation->save();
    
    if ($resultat['success']) {
        $messageReservation = "Votre réservation a été enregistrée avec succès ! Vous recevrez une confirmation par email.";
        $typeMessage = 'success';
    } else {
        $messageReservation = "Erreur : " . implode(', ', $resultat['erreurs']);
        $typeMessage = 'error';
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orion 43 - Nos activités</title>
    <link rel="apple-touch-icon" sizes="180x180" href="../Image/favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../Image/favicon_io/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../Image/favicon_io/favicon-16x16.png">
    <link rel="manifest" href="../Image/favicon_io/site.webmanifest">
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/activites.css">
    <!-- Leaflet CSS -->
    <link
    rel="stylesheet"
    href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
    />
    <!-- Leaflet JS -->
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

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
                <li><a href="nosactivites_poo.php" class="nav-link">Nos activités</a></li>
                <li><a href="NosPhotos.php" class="nav-link">Nos photos</a></li>
                <li><a href="Contact.html" class="nav-link">Contact</a></li>
            </ul>
        </div>
    </nav>

    <canvas id="space"></canvas>

    <main class="main-content">
        <header class="header-img SG">
            <h1>Nos activités</h1>
        </header>

        <section class="intro SG">
            <p>
                L'une des missions du club est de partager la connaissance et la passion de l'astronomie avec le plus grand nombre. À ce titre, le club propose des soirées d'observation gratuites et ouvertes au public une fois par mois, d'avril à juin puis de septembre à octobre.
                Ces observations peuvent être annulées le jour même si les conditions météorologiques ne permettent pas d'observer. L'information est alors mise à jour sur notre site internet à partir de 16h le jour de l'observation.
                Pendant la période estivale, en juillet et août, l'observatoire est ouvert au public une fois par semaine. Les animations sont accessibles à tous, conseillées à partir de 7 ans.
            </p>
        </section>

        <section class="api-section">

            <h2> Prochaine éclipse solaire</h2>
                <div id="eclipse-countdown">
                Chargement du compte à rebours...
                </div>

           <h2>🌙 Carte météo nocturne</h2>
            <div id="night-map" style="height: 400px; border-radius: 10px;"></div>

</section>

<script src="../JS/eclipseCountdown.js"></script>
<script src="../JS/nightWeather.js"></script>


        <!-- NOUVEAU : Widget Météo Nocturne -->
        <section class="widgets-container">
            <div id="night-weather"></div>
        </section>

        <!-- NOUVEAU : Affichage des événements avec POO -->
        <?php if (!empty($evenementsAVenir)): ?>
        <section class="evenements-prochains SG">
            <h2>Prochains événements</h2>
            <div class="evenements-liste">
                <?php foreach ($evenementsAVenir as $evenement): ?>
                <div class="evenement-card">
                    <h3><?= htmlspecialchars($evenement->getTitre()) ?></h3>
                    <p class="evenement-info">
                         <?= htmlspecialchars($evenement->getDateFormatee()) ?>
                    </p>
                    <p><?= htmlspecialchars($evenement->getDescription()) ?></p>
                    <p class="places-info <?= $evenement->isComplet() ? 'complet' : 'disponible' ?>">
                        <?php if ($evenement->isComplet()): ?>
                             Complet
                        <?php else: ?>
                            ✓ Places disponibles : <?= $evenement->getPlacesDisponibles() ?> / <?= $evenement->getMaxPlaces() ?>
                        <?php endif; ?>
                    </p>
                </div>
                <?php endforeach; ?>
            </div>
        </section>
        <?php endif; ?>

        <section class="reservation SG">
            <div class="form-container SG">
                <h2>Réserver votre place pour les observations publiques</h2>
                
                <?php if ($messageReservation): ?>
                <div class="message-reservation <?= $typeMessage ?>">
                    <?= htmlspecialchars($messageReservation) ?>
                </div>
                <?php endif; ?>

                <form class="form-SG" method="POST" aria-label="Formulaire de réservation">
                    <label>Nom *
                        <input type="text" name="nom" placeholder="Votre nom" required>
                    </label>
                    
                    <label>Email *
                        <input type="email" name="email" placeholder="votre@exemple.com" required>
                    </label>
                    
                    <label>Téléphone
                        <input type="tel" name="telephone" placeholder="06 XX XX XX XX">
                    </label>
                    
                    <label>Nombre de places *
                        <input type="number" name="nb_places" min="1" max="10" value="1" required>
                    </label>
                    
                    <label>Événement *
                        <select name="evenement_id" required>
                            <option value="">Choisir un événement</option>
                            <?php foreach ($evenementsAVenir as $evt): ?>
                                <?php if (!$evt->isComplet()): ?>
                                <option value="<?= $evt->getId() ?>">
                                    <?= htmlspecialchars($evt->getTitre()) ?> - <?= htmlspecialchars($evt->getDateFormatee()) ?>
                                </option>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        </select>
                    </label>
                    
                    <button type="submit" name="reserver" class="btn-primary">Réserver</button>
                    <div class="form-note">Vous recevrez une confirmation par email.</div>
                </form>
            </div>

            <div class="img-container SG">
                <img src="../Image/ImagesactivitÃ©s/P1140678.jpg" alt="Observatoire">
            </div>
        </section>

        <section class="description SG">
            <p>En été, les soirées se déroulent en deux temps. La première partie est consacrée à la visite des coupoles et des installations, ainsi qu'à des ateliers en plein air : observation du Soleil, cadrans solaires, géorama Soleil-Terre-Lune, pôle gravité, maquettes du système solaire et d'astronautique. La soirée se poursuit par une conférence parmi deux thèmes proposés.</p>
            <p>La seconde partie, si les conditions météorologiques le permettent, débute par une observation du ciel à l'œil nu, guidée au laser et commentée par un membre du club Orion. Elle est suivie d'observations aux différents télescopes, dont celui de la coupole.</p>
            <p>Les animations et conférences sont maintenues même en cas de mauvais temps ; seule la partie observation peut être annulée.</p>
            <p class="tarifs">Tarifs : Adultes : <strong>5 €</strong> · Moins de 18 ans : <strong>gratuit</strong> · Nuits des Étoiles : <strong>gratuit</strong></p>
            <p>Le club organise également des événements exceptionnels à l'occasion de phénomènes astronomiques majeurs tels que les éclipses ou les transits de Mercure et de Vénus devant le Soleil.</p>
            <p>Une tenue chaude (anorak, bonnet, etc.) est vivement conseillée : même en été, les nuits peuvent être fraîches à 1 000 mètres d'altitude. L'utilisation d'une lampe à lumière rouge est recommandée afin de ne pas éblouir les autres participants et de préserver la vision nocturne.</p>
        </section>

        <section class="galerie SG">
            <div class="carte SG">
                <img src="../Image/ImagesactivitÃ©s/P1100493.jpg" alt="Astrophotographie">
                <h3>Astrophotographie</h3>
            </div>
            <div class="carte SG">
                <img src="../Image/ImagesactivitÃ©s/photo-C8.jpg" alt="Observation">
                <h3>Observation</h3>
            </div>
            <div class="carte SG">
                <img src="../Image/ImagesactivitÃ©s/maquette-fusÃ©es.jpg" alt="Orion Jeune">
                <h3>Orion Jeune</h3>
            </div>
        </section>

        <section class="galerie SG">
            <div class="carte SG">
                <img src="../Image/ImagesactivitÃ©s/observation solaire.png" alt="Observation solaire">
                <h3>Observation solaire</h3>
            </div>
            <div class="carte SG">
                <img src="../Image/ImagesactivitÃ©s/soireepubliques.jpg" alt="Soirées publiques">
                <h3>Soirées publiques</h3>
            </div>
            <div class="carte SG">
                <img src="../Image/ImagesactivitÃ©s/Conferences.jpg" alt="Conférences">
                <h3>Conférences</h3>
            </div>
        </section>

        <section class="conference SG">
            <h4>Conférences</h4>
            <p>
                Afin de partager leurs connaissances et leur passion, les membres d'Orion organisent régulièrement des conférences grand public sur des thèmes variés tels que le Système solaire, les grands télescopes, les exoplanètes et bien d'autres sujets liés à l'astronomie et à l'astronautique.<br><br>
                Ces conférences sont proposées lors des animations publiques estivales, en juillet et août. D'autres conférences sont également organisées à l'occasion d'événements astronomiques particuliers, comme les éclipses ou les transits de Mercure.<br><br>
                Retrouvez également certaines de nos conférences en ligne sur notre chaîne YouTube.
            </p>
        </section>

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
                    <li><a href="Actualites.php">Actualités</a></li>
                    <li><a href="NosActivites.php">Nos activités</a></li>
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

        <div class="footer-bottom">
            <p class="footer-copyright">&copy; 2024 Orion 43. Tous droits réservés.</p>
            <ul class="footer-legal-links">
                <li><a href="#">Politique de confidentialité</a></li>
                <li><a href="#">Conditions d'utilisation</a></li>
            </ul>
        </div>
    </footer>

    <script type="module" src="../JS/EtoileFond.js"></script>
    <script src="../JS/orion-api.js"></script>

    <script>
        const hamburger = document.querySelector('.hamburger');
        const navMenu = document.querySelector('.nav-menu');

        hamburger.addEventListener('click', () => {
            navMenu.classList.toggle('active');
            hamburger.classList.toggle('active');
        });

        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', () => {
                navMenu.classList.remove('active');
                hamburger.classList.remove('active');
            });
        });
    </script>
</body>
</html>