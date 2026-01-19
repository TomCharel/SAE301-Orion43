<?php
session_start();
require_once 'config.php';

// Vérifier la connexion admin
if (!isset($_SESSION['admin_logged_in'])) {
    header('Location: login.php');
    exit;
}

// Récupérer les catégories
$stmt = $pdo->query("SELECT categorie_id, nom FROM categorie_photo ORDER BY nom");
$categories = $stmt->fetchAll();

// Traitement de l'upload
$message = '';
$messageType = '';

// Gestion des événements
$messageEvent = '';
$messageTypeEvent = '';

// Supprimer un événement
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'delete_event') {
    $evenement_id = (int)($_POST['evenement_id'] ?? 0);
    
    if ($evenement_id > 0) {
        try {
            $stmt = $pdo->prepare("DELETE FROM evenement WHERE evenement_id = ?");
            $stmt->execute([$evenement_id]);
            $messageEvent = "Événement supprimé avec succès !";
            $messageTypeEvent = "success";
        } catch (Exception $e) {
            $messageEvent = "Erreur lors de la suppression : " . $e->getMessage();
            $messageTypeEvent = "error";
        }
    }
}

// Ajouter un événement
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'add_event') {
    $titre = trim($_POST['titre_event'] ?? '');
    $description = trim($_POST['description_event'] ?? '');
    $date_event = $_POST['date_event'] ?? '';
    $max_places = (int)($_POST['max_places'] ?? 0);
    
    if (empty($titre)) {
        $messageEvent = "Le titre de l'événement est obligatoire";
        $messageTypeEvent = "error";
    } elseif (empty($date_event)) {
        $messageEvent = "La date de l'événement est obligatoire";
        $messageTypeEvent = "error";
    } elseif ($max_places <= 0) {
        $messageEvent = "Le nombre de places doit être supérieur à 0";
        $messageTypeEvent = "error";
    } else {
        try {
            $stmt = $pdo->prepare("
                INSERT INTO evenement (titre, description, date_event, max_places)
                VALUES (?, ?, ?, ?)
            ");
            $stmt->execute([$titre, $description ?: null, $date_event, $max_places]);
            $messageEvent = "Événement ajouté avec succès !";
            $messageTypeEvent = "success";
        } catch (Exception $e) {
            $messageEvent = "Erreur lors de l'ajout : " . $e->getMessage();
            $messageTypeEvent = "error";
        }
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['photo'])) {
    $titre = trim($_POST['titre'] ?? '');
    $description = trim($_POST['description'] ?? '');
    $infos_techniques = trim($_POST['infos_techniques'] ?? '');
    $date_prise = $_POST['date_prise'] ?? null;
    $categorie_id = (int)($_POST['categorie_id'] ?? 0);
    
    // Validation
    if (empty($titre)) {
        $message = "Le titre est obligatoire";
        $messageType = "error";
    } elseif ($categorie_id === 0) {
        $message = "Veuillez sélectionner une catégorie";
        $messageType = "error";
    } elseif ($_FILES['photo']['error'] === UPLOAD_ERR_OK) {
        $file = $_FILES['photo'];
        $fileName = $file['name'];
        $fileTmpName = $file['tmp_name'];
        $fileSize = $file['size'];
        $fileExt = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
        
        // Vérifications
        if (!in_array($fileExt, ALLOWED_EXTENSIONS)) {
            $message = "Format de fichier non autorisé. Formats acceptés : " . implode(', ', ALLOWED_EXTENSIONS);
            $messageType = "error";
        } elseif ($fileSize > MAX_FILE_SIZE) {
            $message = "Le fichier est trop volumineux (max 5 MB)";
            $messageType = "error";
        } else {
            // Obtenir le nom de la catégorie pour créer le sous-dossier
            $stmt = $pdo->prepare("SELECT nom FROM categorie_photo WHERE categorie_id = ?");
            $stmt->execute([$categorie_id]);
            $categorie = $stmt->fetch();
            
            if ($categorie) {
                // Créer le sous-dossier si nécessaire
                $categoryFolder = UPLOAD_DIR . strtolower(str_replace(' ', '_', $categorie['nom'])) . '/';
                if (!is_dir($categoryFolder)) {
                    mkdir($categoryFolder, 0755, true);
                }
                
                // Générer un nom de fichier unique
                $newFileName = uniqid() . '_' . preg_replace('/[^a-zA-Z0-9._-]/', '', $fileName);
                $destination = $categoryFolder . $newFileName;
                
                if (move_uploaded_file($fileTmpName, $destination)) {
                    // Chemin relatif pour la base de données
                    $relativePath = 'images/NosPhotos/' . strtolower(str_replace(' ', '_', $categorie['nom'])) . '/' . $newFileName;
                    
                    // Insérer dans la base de données
                    $stmt = $pdo->prepare("
                        INSERT INTO photo (url, titre, description, infos_techniques, date_prise, categorie_id)
                        VALUES (?, ?, ?, ?, ?, ?)
                    ");
                    
                    $success = $stmt->execute([
                        $relativePath,
                        $titre,
                        $description ?: null,
                        $infos_techniques ?: null,
                        $date_prise ?: null,
                        $categorie_id
                    ]);
                    
                    if ($success) {
                        $message = "Photo ajoutée avec succès !";
                        $messageType = "success";
                    } else {
                        $message = "Erreur lors de l'enregistrement dans la base de données";
                        $messageType = "error";
                    }
                } else {
                    $message = "Erreur lors du téléchargement du fichier";
                    $messageType = "error";
                }
            } else {
                $message = "Catégorie introuvable";
                $messageType = "error";
            }
        }
    } else {
        $message = "Aucun fichier uploadé ou erreur de téléchargement";
        $messageType = "error";
    }
}

// Récupérer tous les événements
$stmt = $pdo->query("
    SELECT 
        evenement_id,
        titre,
        description,
        date_event,
        max_places,
        COALESCE((SELECT SUM(nb_places) FROM reservation WHERE evenement_id = e.evenement_id), 0) as places_reservees
    FROM evenement e
    ORDER BY e.date_event DESC
");
$allEvenements = $stmt->fetchAll();

// Récupérer les photos récentes
$stmt = $pdo->query("
    SELECT p.*, c.nom as categorie_nom 
    FROM photo p 
    LEFT JOIN categorie_photo c ON p.categorie_id = c.categorie_id 
    ORDER BY p.photo_id DESC 
    LIMIT 10
");
$recentPhotos = $stmt->fetchAll();

// Récupérer les réservations récentes avec les informations des événements
$stmt = $pdo->query("
    SELECT 
        r.reservation_id,
        r.nom,
        r.email,
        r.telephone,
        r.nb_places,
        r.date_reservation,
        e.titre as evenement_titre,
        e.date_event,
        e.max_places,
        (SELECT COALESCE(SUM(nb_places), 0) FROM reservation WHERE evenement_id = e.evenement_id) as total_reservations
    FROM reservation r
    INNER JOIN evenement e ON r.evenement_id = e.evenement_id
    ORDER BY r.date_reservation DESC
");
$reservations = $stmt->fetchAll();

// Récupérer les statistiques par événement
$stmt = $pdo->query("
    SELECT 
        e.evenement_id,
        e.titre,
        e.date_event,
        e.max_places,
        COALESCE(SUM(r.nb_places), 0) as places_reservees,
        COUNT(DISTINCT r.reservation_id) as nb_reservations
    FROM evenement e
    LEFT JOIN reservation r ON e.evenement_id = r.evenement_id
    WHERE e.date_event > NOW()
    GROUP BY e.evenement_id
    ORDER BY e.date_event ASC
");
$evenementsStats = $stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administration - Orion 43</title>
    <link rel="stylesheet" href="../CSS/admin.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Administration Orion 43</h1>
            <a href="logout.php" class="logout-btn">Déconnexion</a>
        </header>
        
        <div class="upload-section">
            <h2>Ajouter une nouvelle photo</h2>
            
            <?php if ($message): ?>
                <div class="message <?= $messageType ?>">
                    <?= htmlspecialchars($message) ?>
                </div>
            <?php endif; ?>
            
            <form method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="photo">Photo *</label>
                    <input type="file" id="photo" name="photo" accept="image/*" required>
                </div>
                
                <div class="form-group">
                    <label for="titre">Titre *</label>
                    <input type="text" id="titre" name="titre" required>
                </div>
                
                <div class="form-group">
                    <label for="categorie_id">Catégorie *</label>
                    <select id="categorie_id" name="categorie_id" required>
                        <option value="">Sélectionner une catégorie</option>
                        <?php foreach ($categories as $cat): ?>
                            <option value="<?= $cat['categorie_id'] ?>">
                                <?= htmlspecialchars($cat['nom']) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="infos_techniques">Informations techniques</label>
                    <textarea id="infos_techniques" name="infos_techniques"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="date_prise">Date de prise de vue</label>
                    <input type="date" id="date_prise" name="date_prise">
                </div>
                
                <button type="submit">Ajouter la photo</button>
            </form>
        </div>
        
        <div class="reservations-section">
            <h2>Gestion des événements et réservations</h2>
            
            <!-- Gestion des événements -->
            <div class="events-management">
                <h3>Ajouter un nouvel événement</h3>
                
                <?php if ($messageEvent): ?>
                    <div class="message <?= $messageTypeEvent ?>">
                        <?= htmlspecialchars($messageEvent) ?>
                    </div>
                <?php endif; ?>
                
                <form method="POST" class="event-form">
                    <input type="hidden" name="action" value="add_event">
                    
                    <div class="form-group">
                        <label for="titre_event">Titre *</label>
                        <input type="text" id="titre_event" name="titre_event" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="description_event">Description</label>
                        <textarea id="description_event" name="description_event" rows="3"></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label for="date_event">Date et heure *</label>
                        <input type="datetime-local" id="date_event" name="date_event" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="max_places">Nombre de places *</label>
                        <input type="number" id="max_places" name="max_places" min="1" required>
                    </div>
                    
                    <button type="submit">Ajouter l'événement</button>
                </form>
            </div>
            
            <!-- Liste des événements avec possibilité de suppression -->
            <div class="events-list">
                <h3>Événements existants</h3>
                <?php if (count($allEvenements) > 0): ?>
                    <table class="stats-table">
                        <thead>
                            <tr>
                                <th>Titre</th>
                                <th>Date</th>
                                <th>Description</th>
                                <th>Places</th>
                                <th>Réservées</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($allEvenements as $evt): ?>
                                <?php 
                                    $dateFormatted = date('d/m/Y H:i', strtotime($evt['date_event']));
                                    $placesDisponibles = $evt['max_places'] - $evt['places_reservees'];
                                ?>
                                <tr>
                                    <td><?= htmlspecialchars($evt['titre']) ?></td>
                                    <td><?= $dateFormatted ?></td>
                                    <td><?= htmlspecialchars(substr($evt['description'] ?? '', 0, 50)) ?></td>
                                    <td><?= $evt['max_places'] ?></td>
                                    <td><?= $evt['places_reservees'] ?> / <?= $evt['max_places'] ?></td>
                                    <td>
                                        <form method="POST" style="display:inline;">
                                            <input type="hidden" name="action" value="delete_event">
                                            <input type="hidden" name="evenement_id" value="<?= $evt['evenement_id'] ?>">
                                            <button type="submit" class="btn-delete" onclick="return confirm('Êtes-vous sûr ?')">Supprimer</button>
                                        </form>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php else: ?>
                    <p class="no-data">Aucun événement</p>
                <?php endif; ?>
            </div>
            
            <hr>
            <h2>Gestion des réservations</h2>
            
            <!-- Statistiques par événement -->
            <div class="events-stats">
                <h3>Événements à venir</h3>
                <?php if (count($evenementsStats) > 0): ?>
                    <table class="stats-table">
                        <thead>
                            <tr>
                                <th>Événement</th>
                                <th>Date</th>
                                <th>Réservations</th>
                                <th>Places réservées</th>
                                <th>Taux de remplissage</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($evenementsStats as $stat): ?>
                                <?php 
                                    $taux = ($stat['max_places'] > 0) 
                                        ? round(($stat['places_reservees'] / $stat['max_places']) * 100) 
                                        : 0;
                                    $dateFormatted = date('d/m/Y H:i', strtotime($stat['date_event']));
                                ?>
                                <tr>
                                    <td><?= htmlspecialchars($stat['titre']) ?></td>
                                    <td><?= $dateFormatted ?></td>
                                    <td><?= $stat['nb_reservations'] ?></td>
                                    <td><?= $stat['places_reservees'] ?> / <?= $stat['max_places'] ?></td>
                                    <td>
                                        <div class="progress-bar">
                                            <div class="progress-fill" style="width: <?= $taux ?>%"></div>
                                            <span><?= $taux ?>%</span>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php else: ?>
                    <p class="no-data">Aucun événement à venir</p>
                <?php endif; ?>
            </div>
            
            <!-- Liste des réservations -->
            <div class="reservations-list">
                <h3>Dernières réservations</h3>
                <?php if (count($reservations) > 0): ?>
                    <table class="reservations-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom</th>
                                <th>Email</th>
                                <th>Téléphone</th>
                                <th>Événement</th>
                                <th>Date événement</th>
                                <th>Places</th>
                                <th>Date réservation</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($reservations as $resa): ?>
                                <?php 
                                    $dateEvent = date('d/m/Y H:i', strtotime($resa['date_event']));
                                    $dateResa = date('d/m/Y H:i', strtotime($resa['date_reservation']));
                                ?>
                                <tr>
                                    <td>#<?= $resa['reservation_id'] ?></td>
                                    <td><?= htmlspecialchars($resa['nom']) ?></td>
                                    <td><?= htmlspecialchars($resa['email']) ?></td>
                                    <td><?= htmlspecialchars($resa['telephone']) ?></td>
                                    <td><?= htmlspecialchars($resa['evenement_titre']) ?></td>
                                    <td><?= $dateEvent ?></td>
                                    <td><?= $resa['nb_places'] ?></td>
                                    <td><?= $dateResa ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php else: ?>
                    <p class="no-data">Aucune réservation pour le moment</p>
                <?php endif; ?>
            </div>
        </div>
        
        <div class="recent-photos">
            <h2>Photos récemment ajoutées</h2>
            <div class="photos-grid">
                <?php foreach ($recentPhotos as $photo): ?>
                    <div class="photo-card">
                        <img src="../<?= htmlspecialchars($photo['url']) ?>" 
                             alt="<?= htmlspecialchars($photo['titre']) ?>"
                             onerror="this.src='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 width=%22200%22 height=%22150%22%3E%3Crect fill=%22%23333%22 width=%22200%22 height=%22150%22/%3E%3Ctext fill=%22%23666%22 x=%2250%25%22 y=%2250%25%22 text-anchor=%22middle%22 dy=%22.3em%22%3EImage non disponible%3C/text%3E%3C/svg%3E'">
                        <div class="photo-info">
                            <div class="photo-title"><?= htmlspecialchars($photo['titre']) ?></div>
                            <div class="photo-category"><?= htmlspecialchars($photo['categorie_nom']) ?></div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</body>
</html>