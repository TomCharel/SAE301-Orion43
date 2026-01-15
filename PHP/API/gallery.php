<?php
require_once '../config/database.php';

header('Content-Type: application/json');

$stmt = $pdo->query("SELECT * FROM gallery ORDER BY created_at DESC");
echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
