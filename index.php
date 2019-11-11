<?php

session_start();

if (!isset($_SESSION["user"])) {
    require_once "./mvc/Bridge.php";
    $myApp = new App();
} else {
    echo "Login";
}

?>