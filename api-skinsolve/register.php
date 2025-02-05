<?php
header("Content-Type: application/json");

// Koneksi ke database
include 'koneksi.php';

// Mengambil data dari request
$name = $_POST['nama'];
$email = $_POST['email'];
$password = $_POST['password'];

// Validasi input
if (empty($name) || empty($email) || empty($password)) {
    echo json_encode(array("status" => "error", "message" => "All fields are required"));
    exit;
}

// Hash password
// $hashed_password = password_hash($password, PASSWORD_BCRYPT);

// Cek apakah email sudah terdaftar
$check_email = $koneksi->prepare("SELECT id FROM users WHERE email = ?");
$check_email->bind_param("s", $email);
$check_email->execute();
$check_email->store_result();

if ($check_email->num_rows > 0) {
    echo json_encode(array("status" => "error", "message" => "Email already exists"));
    exit;
}

// Insert data ke database
$stmt = $koneksi->prepare("INSERT INTO users (nama, email, password) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $name, $email, $password);

if ($stmt->execute()) {
    echo json_encode(array("status" => "success", "message" => "User registered successfully"));
} else {
    echo json_encode(array("status" => "error", "message" => "Error: " . $stmt->error));
}

$stmt->close();
$koneksi->close();
?>
