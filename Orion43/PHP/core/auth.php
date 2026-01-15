<?php
session_start();

function isLogged() {
    if (!isset($_SESSION['user'])) {
        header('Location: login.php');
        exit;
    }
}
