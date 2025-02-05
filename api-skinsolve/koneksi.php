<?php
    $server = "localhost";
    $username = "root";
    $password = "";
    $database = "skinsolve";
    $koneksi = mysqli_connect($server, $username, $password, $database);
    
    if (mysqli_connect_errno()) {
        echo "Gagal koneksi dengan database";
    }
?>