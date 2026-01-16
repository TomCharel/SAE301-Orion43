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

// Récupérer les photos récentes
$stmt = $pdo->query("
    SELECT p.*, c.nom as categorie_nom 
    FROM photo p 
    LEFT JOIN categorie_photo c ON p.categorie_id = c.categorie_id 
    ORDER BY p.photo_id DESC 
    LIMIT 10
");
$recentPhotos = $stmt->fetchAll();
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