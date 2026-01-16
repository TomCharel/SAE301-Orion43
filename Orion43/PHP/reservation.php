<?php
session_start();
require_once 'config/bdd.php';

header('Content-Type: application/json');

// Vérifier que c'est une requête POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Méthode non autorisée']);
    exit;
}

// Récupérer les données du formulaire
$nom = trim($_POST['nom'] ?? '');
$email = trim($_POST['email'] ?? '');
$telephone = trim($_POST['telephone'] ?? '');
$nb_places = (int)($_POST['nb_places'] ?? 1);
$evenement_id = (int)($_POST['evenement_id'] ?? 0);

// Validation des données
if (empty($nom)) {
    echo json_encode(['success' => false, 'message' => 'Le nom est obligatoire']);
    exit;
}

if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(['success' => false, 'message' => 'Email invalide']);
    exit;
}

if (empty($telephone)) {
    echo json_encode(['success' => false, 'message' => 'Le téléphone est obligatoire']);
    exit;
}

if ($nb_places < 1 || $nb_places > 10) {
    echo json_encode(['success' => false, 'message' => 'Le nombre de places doit être entre 1 et 10']);
    exit;
}

if ($evenement_id === 0) {
    echo json_encode(['success' => false, 'message' => 'Veuillez sélectionner un événement']);
    exit;
}

try {
    // Vérifier que l'événement existe et n'est pas complet
    $stmt = $pdo->prepare("
        SELECT e.titre, e.date_event, e.max_places,
               COALESCE(SUM(r.nb_places), 0) as places_reservees
        FROM evenement e
        LEFT JOIN reservation r ON e.evenement_id = r.evenement_id
        WHERE e.evenement_id = ?
        GROUP BY e.evenement_id
    ");
    $stmt->execute([$evenement_id]);
    $evenement = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$evenement) {
        echo json_encode(['success' => false, 'message' => 'Événement introuvable']);
        exit;
    }
    
    // Vérifier les places disponibles
    $places_disponibles = $evenement['max_places'] - $evenement['places_reservees'];
    if ($places_disponibles < $nb_places) {
        echo json_encode([
            'success' => false, 
            'message' => "Désolé, il ne reste que $places_disponibles place(s) disponible(s) pour cet événement"
        ]);
        exit;
    }
    
    // Vérifier que la personne n'a pas déjà réservé pour cet événement
    $stmt = $pdo->prepare("
        SELECT COUNT(*) FROM reservation 
        WHERE email = ? AND evenement_id = ?
    ");
    $stmt->execute([$email, $evenement_id]);
    $already_reserved = $stmt->fetchColumn();
    
    if ($already_reserved > 0) {
        echo json_encode([
            'success' => false, 
            'message' => 'Vous avez déjà effectué une réservation pour cet événement'
        ]);
        exit;
    }
    
    // Insérer la réservation
    $stmt = $pdo->prepare("
        INSERT INTO reservation (nom, email, telephone, nb_places, evenement_id)
        VALUES (?, ?, ?, ?, ?)
    ");
    
    $success = $stmt->execute([
        $nom,
        $email,
        $telephone,
        $nb_places,
        $evenement_id
    ]);
    
    if ($success) {
        echo json_encode([
            'success' => true,
            'message' => "Réservation confirmée ! Vous recevrez un email de confirmation à l'adresse : $email"
        ]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Erreur lors de la réservation']);
    }
    
} catch (PDOException $e) {
    error_log("Erreur réservation: " . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Erreur technique, veuillez réessayer']);
}
