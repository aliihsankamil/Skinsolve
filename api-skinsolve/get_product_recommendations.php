<?php
header('Content-Type: application/json');
require 'koneksi.php'; // Include your database connection

$user_id = $_POST['user_id'];

// Ambil tipe kulit user dari tabel user_tipe_skin
$query = "SELECT id_tipe_skin FROM user_tipe_skin WHERE id_user = ?";
$stmt = $koneksi->prepare($query);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$stmt->bind_result($id_tipe_skin);
$stmt->fetch();
$stmt->close();

// Ambil produk yang sesuai dengan tipe kulit
$query = "SELECT produk.nama, produk.brand, produk.tipe, produk.komposisi, produk.gambar
          FROM produk
          INNER JOIN produk_tipe_skin ON produk.id = produk_tipe_skin.id_produk
          WHERE produk_tipe_skin.id_tipe_skin = ?";
$stmt = $koneksi->prepare($query);
$stmt->bind_param("i", $id_tipe_skin);
$stmt->execute();
$result = $stmt->get_result();

$products = array();
while($row = $result->fetch_assoc()) {
    $products[] = $row;
}

echo json_encode($products);
?>
