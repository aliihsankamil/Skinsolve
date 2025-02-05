<?php
// Database connection
$host = 'localhost';
$dbname = 'skinsolve';
$username = 'root'; // Replace with your MySQL username
$password = ''; // Replace with your MySQL password

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    exit();
}

// Prefix URL untuk gambar
$base_url = 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/';

// Check if it's a POST request
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get the data from the request
    $userId = $_POST['id'];
    $nama = $_POST['nama'];
    $email = $_POST['email'];
    $jenis_kelamin = $_POST['jenis_kelamin'];
    $tanggal_lahir = $_POST['tanggal_lahir'];

    // Check if an image is uploaded
    $gambar_profil = null;
    if (isset($_FILES['gambar_profil']) && $_FILES['gambar_profil']['error'] == 0) {
        $targetDir = "images/";
        $fileName = time() . "_" . basename($_FILES["gambar_profil"]["name"]);
        $targetFilePath = $targetDir . $fileName;

        // Move uploaded file to target directory
        if (move_uploaded_file($_FILES["gambar_profil"]["tmp_name"], $targetFilePath)) {
            // Tambahkan prefix URL ke nama gambar
            $gambar_profil = $base_url . $fileName;
        }
    }

    // Update query
    $sql = "UPDATE users SET nama = :nama, email = :email, jenis_kelamin = :jenis_kelamin, tanggal_lahir = :tanggal_lahir";
    if ($gambar_profil) {
        $sql .= ", gambar_profil = :gambar_profil";
    }
    $sql .= " WHERE id = :id";

    try {
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':id', $userId, PDO::PARAM_INT);
        $stmt->bindParam(':nama', $nama, PDO::PARAM_STR);
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        $stmt->bindParam(':jenis_kelamin', $jenis_kelamin, PDO::PARAM_STR);
        $stmt->bindParam(':tanggal_lahir', $tanggal_lahir, PDO::PARAM_STR);
        if ($gambar_profil) {
            $stmt->bindParam(':gambar_profil', $gambar_profil, PDO::PARAM_STR);
        }

        if ($stmt->execute()) {
            echo json_encode(['status' => 'success', 'message' => 'Profile updated']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to update profile']);
        }
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
?>
