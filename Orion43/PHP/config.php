<?php
// Configuration de la base de données
define('DB_HOST', 'localhost');
define('DB_NAME', 'orion43');
define('DB_USER', 'root');
define('DB_PASS', '');

// Configuration des uploads
define('UPLOAD_DIR', '../images/NosPhotos/');
define('MAX_FILE_SIZE', 5242880); // 5 MB
define('ALLOWED_EXTENSIONS', ['jpg', 'jpeg', 'png', 'gif', 'tif', 'tiff']);

// Connexion à la base de données
try {
    $pdo = new PDO(
        "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=utf8mb4",
        DB_USER,
        DB_PASS,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

//POO
class Database {
    private $connection;
    
    public function __construct($host, $user, $password, $database) {
        $this->connection = new mysqli($host, $user, $password, $database);
    }
    
    public function query($sql) {
        return $this->connection->query($sql);
    }
}
?>