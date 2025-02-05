<?php
header('Content-Type: application/json');
include "koneksi.php";

$query = isset($_POST['query']) ? $_POST['query'] : '';

$sql = "SELECT * FROM produk WHERE nama LIKE '%$query%'";

$result = $koneksi->query($sql);

$searchResults = [];

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $searchResults[] = $row;
    }
}

echo json_encode($searchResults);

$koneksi->close();
?>
