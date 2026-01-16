<?php
require_once '../PHP/config/bdd.php';

header('Content-Type: application/json');

try {
    // Récupérer les événements futurs avec les places disponibles
    $stmt = $pdo->query("
        SELECT 
            e.evenement_id,
            e.titre,
            e.description,
            e.date_event,
            e.max_places,
            COALESCE(SUM(r.nb_places), 0) as places_reservees,
            (e.max_places - COALESCE(SUM(r.nb_places), 0)) as places_disponibles
        FROM evenement e
        LEFT JOIN reservation r ON e.evenement_id = r.evenement_id
        WHERE e.date_event > NOW()
        GROUP BY e.evenement_id
        HAVING places_disponibles > 0
        ORDER BY e.date_event ASC
    ");
    
    $evenements = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode(['success' => true, 'evenements' => $evenements]);
    
} catch (PDOException $e) {
    error_log("Erreur récupération événements: " . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Erreur lors de la récupération des événements']);
}
