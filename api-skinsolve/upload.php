<?php
// Koneksi ke database
$host = 'localhost';
$dbname = 'skinsolve'; // Ganti dengan nama database Anda
$username = 'root'; // Ganti dengan username database Anda
$password = ''; // Ganti dengan password database Anda

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Error: Could not connect. " . $e->getMessage());
}

// Memeriksa apakah request POST sudah diterima
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Mendapatkan data dari form
    $id_user = $_POST['id_user'];
    $tanggal_upload = date('Y-m-d H:i:s'); // Mendapatkan waktu saat ini
    
    // Memeriksa apakah file gambar ada
    if (isset($_FILES['gambar_makanan']['name'])) {
        $file_name = $_FILES['gambar_makanan']['name'];
        $file_tmp = $_FILES['gambar_makanan']['tmp_name'];
        $upload_directory = 'images/';
        
        // Membuat folder 'images' jika belum ada
        if (!is_dir($upload_directory)) {
            mkdir($upload_directory, 0777, true);
        }

        // Menyimpan file gambar
        $file_path = $upload_directory . basename($file_name);
        if (move_uploaded_file($file_tmp, $file_path)) {
            // Menyimpan data ke database
            $sql = "INSERT INTO skin_progres_makanan (gambar_makanan, tanggal_upload, id_user) VALUES (:gambar_makanan, :tanggal_upload, :id_user)";
            $stmt = $pdo->prepare($sql);
            
            // Mengikat nilai parameter
            $stmt->bindParam(':gambar_makanan', $file_name);
            $stmt->bindParam(':tanggal_upload', $tanggal_upload);
            $stmt->bindParam(':id_user', $id_user);
            
            if ($stmt->execute()) {
                $response = array('status' => 'success', 'message' => 'Gambar berhasil diupload');
            } else {
                $response = array('status' => 'error', 'message' => 'Gagal menyimpan ke database');
            }
        } else {
            $response = array('status' => 'error', 'message' => 'Gagal mengupload gambar');
        }
    } else {
        $response = array('status' => 'error', 'message' => 'Tidak ada file yang diupload');
    }
    
    // Mengirim response JSON
    echo json_encode($response);
}
?>