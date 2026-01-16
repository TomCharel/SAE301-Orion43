<?php
session_start();

// Identifiants admin (à sécuriser davantage en production)
define('ADMIN_USERNAME', 'admin');
define('ADMIN_PASSWORD', password_hash('orion43_admin', PASSWORD_DEFAULT));

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'] ?? 'admin';
    $password = $_POST['password'] ?? 'admin';
    
    if ($username === ADMIN_USERNAME && password_verify($password, ADMIN_PASSWORD)) {
        $_SESSION['admin_logged_in'] = true;
        header('Location: admin.php');
        exit;
    } else {
        $error = 'Identifiants incorrects';
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion Admin - Orion 43</title>
     <link rel="stylesheet" href="../CSS/login.css">
</head>
<body>
    <div class="login-container">
        <h1>Admin Orion 43</h1>
        
        <?php if ($error): ?>
            <div class="error"><?= htmlspecialchars($error) ?></div>
        <?php endif; ?>
        
        <form method="POST">
            <div class="form-group">
                <label for="username">Nom d'utilisateur</label>
                <input type="text" id="username" name="username" required>
            </div>
            
            <div class="form-group">
                <label for="password">Mot de passe</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <button type="submit">Se connecter</button>
        </form>
    </div>
</body>
</html>