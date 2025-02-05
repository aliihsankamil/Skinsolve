<?php
include 'koneksi.php';

$user_id = $_POST["user_id"];
$skin_type_id = $_POST["skin_type_id"];

// Cek apakah user sudah memiliki jenis kulit
$query_check = "SELECT * FROM user_tipe_skin WHERE id_user = ?";
$stmt_check = $koneksi->prepare($query_check);
$stmt_check->bind_param("i", $user_id);
$stmt_check->execute();
$result = $stmt_check->get_result();

if ($result->num_rows > 0) {
    // Jika sudah ada, lakukan update
    $query_update = "UPDATE user_tipe_skin SET id_tipe_skin = ? WHERE id_user = ?";
    $stmt_update = $koneksi->prepare($query_update);
    $stmt_update->bind_param("ii", $skin_type_id, $user_id);
    
    if ($stmt_update->execute()) {
        echo json_encode(array(
            'response' => true,
            'message' => 'Skin type updated successfully'
        ));
    } else {
        echo json_encode(array(
            'response' => false,
            'message' => 'Failed to update skin type'
        ));
    }
} else {
    // Jika belum ada, lakukan insert
    $query_insert = "INSERT INTO user_tipe_skin (id_user, id_tipe_skin) VALUES (?, ?)";
    $stmt_insert = $koneksi->prepare($query_insert);
    $stmt_insert->bind_param("ii", $user_id, $skin_type_id);
    
    if ($stmt_insert->execute()) {
        echo json_encode(array(
            'response' => true,
            'message' => 'Skin type selected successfully'
        ));
    } else {
        echo json_encode(array(
            'response' => false,
            'message' => 'Failed to select skin type'
        ));
    }
}

header('Content-Type: application/json');
?>
