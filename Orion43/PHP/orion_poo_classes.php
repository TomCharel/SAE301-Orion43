<?php
/**
 * ORION 43 - CLASSES POO
 * Programmation Orientée Objet pour la gestion des Activités et Actualités
 * Niveau 3 : Plusieurs classes avec connexion à la base de données
 */

// ====================================
// CLASSE DE BASE : Database
// ====================================
class Database {
    private $connection;
    private static $instance = null;
    
    private function __construct() {
        try {
            $this->connection = new PDO(
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
    }
    
    // Singleton pattern
    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }
    
    public function getConnection() {
        return $this->connection;
    }
    
    public function query($sql, $params = []) {
        $stmt = $this->connection->prepare($sql);
        $stmt->execute($params);
        return $stmt;
    }
    
    public function fetchAll($sql, $params = []) {
        return $this->query($sql, $params)->fetchAll();
    }
    
    public function fetchOne($sql, $params = []) {
        return $this->query($sql, $params)->fetch();
    }
}


// ====================================
// CLASSE : Article (pour les actualités)
// ====================================
class Article {
    private $article_id;
    private $titre;
    private $slug;
    private $contenu;
    private $date_publication;
    private $epingle;
    private $db;
    
    public function __construct($data = null) {
        $this->db = Database::getInstance();
        
        if ($data) {
            $this->hydrate($data);
        }
    }
    
    // Hydratation de l'objet
    private function hydrate($data) {
        $this->article_id = $data['article_id'] ?? null;
        $this->titre = $data['titre'] ?? '';
        $this->slug = $data['slug'] ?? '';
        $this->contenu = $data['contenu'] ?? '';
        $this->date_publication = $data['date_publication'] ?? date('Y-m-d H:i:s');
        $this->epingle = $data['epingle'] ?? 0;
    }
    
    // Getters
    public function getId() { return $this->article_id; }
    public function getTitre() { return $this->titre; }
    public function getSlug() { return $this->slug; }
    public function getContenu() { return $this->contenu; }
    public function getDatePublication() { return $this->date_publication; }
    public function isEpingle() { return (bool)$this->epingle; }
    
    // Setters
    public function setTitre($titre) { $this->titre = $titre; }
    public function setContenu($contenu) { $this->contenu = $contenu; }
    public function setEpingle($epingle) { $this->epingle = $epingle; }
    
    // Générer un slug à partir du titre
    public function generateSlug() {
        $slug = strtolower($this->titre);
        $slug = preg_replace('/[^a-z0-9]+/', '-', $slug);
        $slug = trim($slug, '-');
        $this->slug = $slug;
        return $slug;
    }
    
    // Sauvegarder l'article
    public function save() {
        if (empty($this->slug)) {
            $this->generateSlug();
        }
        
        if ($this->article_id) {
            return $this->update();
        } else {
            return $this->insert();
        }
    }
    
    private function insert() {
        $sql = "INSERT INTO article (titre, slug, contenu, date_publication, epingle) 
                VALUES (:titre, :slug, :contenu, :date_publication, :epingle)";
        
        $params = [
            ':titre' => $this->titre,
            ':slug' => $this->slug,
            ':contenu' => $this->contenu,
            ':date_publication' => $this->date_publication,
            ':epingle' => $this->epingle
        ];
        
        $this->db->query($sql, $params);
        $this->article_id = $this->db->getConnection()->lastInsertId();
        return true;
    }
    
    private function update() {
        $sql = "UPDATE article 
                SET titre = :titre, slug = :slug, contenu = :contenu, 
                    date_publication = :date_publication, epingle = :epingle 
                WHERE article_id = :id";
        
        $params = [
            ':titre' => $this->titre,
            ':slug' => $this->slug,
            ':contenu' => $this->contenu,
            ':date_publication' => $this->date_publication,
            ':epingle' => $this->epingle,
            ':id' => $this->article_id
        ];
        
        $this->db->query($sql, $params);
        return true;
    }
    
    // Supprimer l'article
    public function delete() {
        if (!$this->article_id) return false;
        
        $sql = "DELETE FROM article WHERE article_id = :id";
        $this->db->query($sql, [':id' => $this->article_id]);
        return true;
    }
    
    // Obtenir l'extrait de l'article
    public function getExtrait($longueur = 150) {
        $extrait = strip_tags($this->contenu);
        if (strlen($extrait) > $longueur) {
            $extrait = substr($extrait, 0, $longueur) . '...';
        }
        return $extrait;
    }
    
    // Formater la date
    public function getDateFormatee() {
        $date = new DateTime($this->date_publication);
        return $date->format('d/m/Y');
    }
}


// ====================================
// CLASSE : ArticleManager (Gestion des articles)
// ====================================
class ArticleManager {
    private $db;
    
    public function __construct() {
        $this->db = Database::getInstance();
    }
    
    // Récupérer tous les articles
    public function getAll($limit = null) {
        $sql = "SELECT * FROM article ORDER BY date_publication DESC";
        if ($limit) {
            $sql .= " LIMIT " . intval($limit);
        }
        
        $results = $this->db->fetchAll($sql);
        $articles = [];
        
        foreach ($results as $data) {
            $articles[] = new Article($data);
        }
        
        return $articles;
    }
    
    // Récupérer un article par ID
    public function getById($id) {
        $sql = "SELECT * FROM article WHERE article_id = :id";
        $data = $this->db->fetchOne($sql, [':id' => $id]);
        
        return $data ? new Article($data) : null;
    }
    
    // Récupérer un article par slug
    public function getBySlug($slug) {
        $sql = "SELECT * FROM article WHERE slug = :slug";
        $data = $this->db->fetchOne($sql, [':slug' => $slug]);
        
        return $data ? new Article($data) : null;
    }
    
    // Récupérer les articles épinglés
    public function getEpingles() {
        $sql = "SELECT * FROM article WHERE epingle = 1 ORDER BY date_publication DESC";
        $results = $this->db->fetchAll($sql);
        $articles = [];
        
        foreach ($results as $data) {
            $articles[] = new Article($data);
        }
        
        return $articles;
    }
    
    // Rechercher des articles
    public function search($terme) {
        $sql = "SELECT * FROM article 
                WHERE titre LIKE :terme OR contenu LIKE :terme 
                ORDER BY date_publication DESC";
        
        $results = $this->db->fetchAll($sql, [':terme' => "%$terme%"]);
        $articles = [];
        
        foreach ($results as $data) {
            $articles[] = new Article($data);
        }
        
        return $articles;
    }
    
    // Compter les articles
    public function count() {
        $sql = "SELECT COUNT(*) as total FROM article";
        $result = $this->db->fetchOne($sql);
        return $result['total'];
    }
}


// ====================================
// CLASSE : Evenement (pour les activités)
// ====================================
class Evenement {
    private $evenement_id;
    private $titre;
    private $description;
    private $date_event;
    private $max_places;
    private $db;
    
    public function __construct($data = null) {
        $this->db = Database::getInstance();
        
        if ($data) {
            $this->hydrate($data);
        }
    }
    
    private function hydrate($data) {
        $this->evenement_id = $data['evenement_id'] ?? null;
        $this->titre = $data['titre'] ?? '';
        $this->description = $data['description'] ?? '';
        $this->date_event = $data['date_event'] ?? date('Y-m-d H:i:s');
        $this->max_places = $data['max_places'] ?? 30;
    }
    
    // Getters
    public function getId() { return $this->evenement_id; }
    public function getTitre() { return $this->titre; }
    public function getDescription() { return $this->description; }
    public function getDateEvent() { return $this->date_event; }
    public function getMaxPlaces() { return $this->max_places; }
    
    // Setters
    public function setTitre($titre) { $this->titre = $titre; }
    public function setDescription($desc) { $this->description = $desc; }
    public function setDateEvent($date) { $this->date_event = $date; }
    public function setMaxPlaces($max) { $this->max_places = $max; }
    
    // Sauvegarder l'événement
    public function save() {
        if ($this->evenement_id) {
            return $this->update();
        } else {
            return $this->insert();
        }
    }
    
    private function insert() {
        $sql = "INSERT INTO evenement (titre, description, date_event, max_places) 
                VALUES (:titre, :description, :date_event, :max_places)";
        
        $params = [
            ':titre' => $this->titre,
            ':description' => $this->description,
            ':date_event' => $this->date_event,
            ':max_places' => $this->max_places
        ];
        
        $this->db->query($sql, $params);
        $this->evenement_id = $this->db->getConnection()->lastInsertId();
        return true;
    }
    
    private function update() {
        $sql = "UPDATE evenement 
                SET titre = :titre, description = :description, 
                    date_event = :date_event, max_places = :max_places 
                WHERE evenement_id = :id";
        
        $params = [
            ':titre' => $this->titre,
            ':description' => $this->description,
            ':date_event' => $this->date_event,
            ':max_places' => $this->max_places,
            ':id' => $this->evenement_id
        ];
        
        $this->db->query($sql, $params);
        return true;
    }
    
    public function delete() {
        if (!$this->evenement_id) return false;
        
        $sql = "DELETE FROM evenement WHERE evenement_id = :id";
        $this->db->query($sql, [':id' => $this->evenement_id]);
        return true;
    }
    
    // Vérifier si l'événement est passé
    public function isPasse() {
        return strtotime($this->date_event) < time();
    }
    
    // Obtenir le nombre de places réservées
    public function getPlacesReservees() {
        $sql = "SELECT COALESCE(SUM(nb_places), 0) as total 
                FROM reservation WHERE evenement_id = :id";
        $result = $this->db->fetchOne($sql, [':id' => $this->evenement_id]);
        return $result['total'];
    }
    
    // Obtenir le nombre de places disponibles
    public function getPlacesDisponibles() {
        return $this->max_places - $this->getPlacesReservees();
    }
    
    // Vérifier si l'événement est complet
    public function isComplet() {
        return $this->getPlacesDisponibles() <= 0;
    }
    
    // Formater la date
    public function getDateFormatee() {
        $date = new DateTime($this->date_event);
        setlocale(LC_TIME, 'fr_FR.UTF-8');
        return strftime('%A %d %B %Y à %H:%M', $date->getTimestamp());
    }
}


// ====================================
// CLASSE : EvenementManager
// ====================================
class EvenementManager {
    private $db;
    
    public function __construct() {
        $this->db = Database::getInstance();
    }
    
    public function getAll() {
        $sql = "SELECT * FROM evenement ORDER BY date_event ASC";
        $results = $this->db->fetchAll($sql);
        $evenements = [];
        
        foreach ($results as $data) {
            $evenements[] = new Evenement($data);
        }
        
        return $evenements;
    }
    
    public function getById($id) {
        $sql = "SELECT * FROM evenement WHERE evenement_id = :id";
        $data = $this->db->fetchOne($sql, [':id' => $id]);
        
        return $data ? new Evenement($data) : null;
    }
    
    // Récupérer les événements à venir
    public function getAVenir() {
        $sql = "SELECT * FROM evenement 
                WHERE date_event > NOW() 
                ORDER BY date_event ASC";
        $results = $this->db->fetchAll($sql);
        $evenements = [];
        
        foreach ($results as $data) {
            $evenements[] = new Evenement($data);
        }
        
        return $evenements;
    }
    
    // Récupérer les événements passés
    public function getPasses() {
        $sql = "SELECT * FROM evenement 
                WHERE date_event < NOW() 
                ORDER BY date_event DESC";
        $results = $this->db->fetchAll($sql);
        $evenements = [];
        
        foreach ($results as $data) {
            $evenements[] = new Evenement($data);
        }
        
        return $evenements;
    }
    
    public function count() {
        $sql = "SELECT COUNT(*) as total FROM evenement";
        $result = $this->db->fetchOne($sql);
        return $result['total'];
    }
}


// ====================================
// CLASSE : Reservation
// ====================================
class Reservation {
    private $reservation_id;
    private $nom;
    private $email;
    private $telephone;
    private $nb_places;
    private $date_reservation;
    private $evenement_id;
    private $db;
    
    public function __construct($data = null) {
        $this->db = Database::getInstance();
        
        if ($data) {
            $this->hydrate($data);
        }
    }
    
    private function hydrate($data) {
        $this->reservation_id = $data['reservation_id'] ?? null;
        $this->nom = $data['nom'] ?? '';
        $this->email = $data['email'] ?? '';
        $this->telephone = $data['telephone'] ?? '';
        $this->nb_places = $data['nb_places'] ?? 1;
        $this->date_reservation = $data['date_reservation'] ?? date('Y-m-d H:i:s');
        $this->evenement_id = $data['evenement_id'] ?? null;
    }
    
    // Getters
    public function getId() { return $this->reservation_id; }
    public function getNom() { return $this->nom; }
    public function getEmail() { return $this->email; }
    public function getTelephone() { return $this->telephone; }
    public function getNbPlaces() { return $this->nb_places; }
    public function getEvenementId() { return $this->evenement_id; }
    
    // Setters
    public function setNom($nom) { $this->nom = $nom; }
    public function setEmail($email) { $this->email = $email; }
    public function setTelephone($tel) { $this->telephone = $tel; }
    public function setNbPlaces($nb) { $this->nb_places = $nb; }
    public function setEvenementId($id) { $this->evenement_id = $id; }
    
    // Valider les données
    public function valider() {
        $erreurs = [];
        
        if (empty($this->nom)) {
            $erreurs[] = "Le nom est obligatoire";
        }
        
        if (!filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
            $erreurs[] = "Email invalide";
        }
        
        if ($this->nb_places < 1) {
            $erreurs[] = "Le nombre de places doit être au moins 1";
        }
        
        return $erreurs;
    }
    
    // Sauvegarder la réservation
    public function save() {
        $erreurs = $this->valider();
        if (!empty($erreurs)) {
            return ['success' => false, 'erreurs' => $erreurs];
        }
        
        // Vérifier les places disponibles
        $evenement = (new EvenementManager())->getById($this->evenement_id);
        if ($evenement->getPlacesDisponibles() < $this->nb_places) {
            return ['success' => false, 'erreurs' => ['Places insuffisantes']];
        }
        
        $sql = "INSERT INTO reservation (nom, email, telephone, nb_places, evenement_id, date_reservation) 
                VALUES (:nom, :email, :telephone, :nb_places, :evenement_id, :date_reservation)";
        
        $params = [
            ':nom' => $this->nom,
            ':email' => $this->email,
            ':telephone' => $this->telephone,
            ':nb_places' => $this->nb_places,
            ':evenement_id' => $this->evenement_id,
            ':date_reservation' => $this->date_reservation
        ];
        
        $this->db->query($sql, $params);
        $this->reservation_id = $this->db->getConnection()->lastInsertId();
        
        return ['success' => true, 'reservation_id' => $this->reservation_id];
    }
}


// ====================================
// CLASSE : ReservationManager
// ====================================
class ReservationManager {
    private $db;
    
    public function __construct() {
        $this->db = Database::getInstance();
    }
    
    public function getByEvenement($evenement_id) {
        $sql = "SELECT * FROM reservation WHERE evenement_id = :id ORDER BY date_reservation DESC";
        $results = $this->db->fetchAll($sql, [':id' => $evenement_id]);
        $reservations = [];
        
        foreach ($results as $data) {
            $reservations[] = new Reservation($data);
        }
        
        return $reservations;
    }
}
?>