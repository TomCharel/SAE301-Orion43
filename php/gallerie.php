<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

/***********************
 * CONFIGURATION DB
 ***********************/
$host = "localhost";
$dbname = "testsae2";
$user = "root";
$pass = "";

/***********************
 * CONNEXION PDO
 ***********************/
try {
  $pdo = new PDO(
    "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
    $user,
    $pass,
    [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
  );
} catch (PDOException $e) {
  die("Erreur connexion DB : " . $e->getMessage());
}

$sql = "SELECT * FROM projets ORDER BY date_projet DESC";
$stmt = $pdo->query($sql);
$projets = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Portfolio</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="grid">

<?php if (count($projets) === 0): ?>
  <p class="empty">Aucun projet trouvé.</p>
<?php endif; ?>

<?php foreach ($projets as $p): ?>
  <div class="card <?= htmlspecialchars($p['taille']) ?>">

    <img src="<?= htmlspecialchars($p['image']) ?>" alt="">

    <div class="overlay">
      <h3><?= htmlspecialchars($p['titre']) ?></h3>
      <p><?= htmlspecialchars($p['description']) ?></p>
      <span><?= date('d/m/Y', strtotime($p['date_projet'])) ?></span>
    </div>

  </div>
<?php endforeach; ?>

</div>

</body>
</html>