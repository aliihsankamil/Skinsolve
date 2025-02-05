<?php
// Koneksi database
include 'koneksi.php';

$email = $_POST["post_email"];
$password = $_POST["post_password"];

$query = "SELECT * from users where email='$email' AND password='$password'";
$obj_query = mysqli_query($koneksi, $query);
$data = mysqli_fetch_assoc($obj_query);

if ($data) {
    echo json_encode(
        array(
            'response' => true,
            'payload' => array(
                "id" => $data["id"],
                "nama" => $data["nama"],
                "email" => $data["email"],
                "jenis_kelamin" => $data["jenis_kelamin"],
                "tanggal_lahir" => $data["tanggal_lahir"],
                "gambar_profil" => $data["gambar_profil"]
            )
        )
    );
} else {
    echo json_encode(
        array(
            'response' => false,
            'payload' => null
        )
    );
}

header('Content-Type: application/json');

?>