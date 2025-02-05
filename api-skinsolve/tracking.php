<?php
header("Content-Type: application/json; charset=UTF-8");

$host = "localhost"; // Ubah sesuai dengan konfigurasi server Anda
$db_name = "skinsolve";
$username = "root"; // Ubah sesuai dengan username database Anda
$password = ""; // Ubah sesuai dengan password database Anda

$conn = new mysqli($host, $username, $password, $db_name);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$id_user = $_POST['id_user'];

$arr_tgl = [];

// query tanggal progres wajah
$query_skin_tgl = "SELECT * FROM skin_progres_wajah WHERE id_user = ? GROUP BY tanggal_upload ORDER BY tanggal_upload DESC";
$stmt_skin_tgl = $conn->prepare($query_skin_tgl);
$stmt_skin_tgl->bind_param("i", $id_user);
$stmt_skin_tgl->execute();
$result_skin_tgl = $stmt_skin_tgl->get_result()->fetch_all();

foreach ($result_skin_tgl as $key => $value) { 
    array_push($arr_tgl, $value[2]);
}


// query tanggal progres wajah
$query_food_tgl = "SELECT * FROM skin_progres_makanan WHERE id_user = ? GROUP BY tanggal_upload ORDER BY tanggal_upload DESC";
$stmt_food_tgl = $conn->prepare($query_food_tgl);
$stmt_food_tgl->bind_param("i", $id_user);
$stmt_food_tgl->execute();
$result_food_tgl = $stmt_food_tgl->get_result()->fetch_all();

foreach ($result_food_tgl as $key => $value) { 
    if (!in_array($value[2], $arr_tgl)) {
        array_push($arr_tgl, $value[2]);
    }
}

$data = [];

arsort($arr_tgl);

foreach ($arr_tgl as $key => $value) {
    $tgl = $value;
    // Query untuk mendapatkan progres wajah
    $query_skin = "SELECT * FROM skin_progres_wajah WHERE id_user = ? AND tanggal_upload = '$tgl'";
    $stmt_skin = $conn->prepare($query_skin);
    $stmt_skin->bind_param("i", $id_user);
    $stmt_skin->execute();
    $result_skin = $stmt_skin->get_result()->fetch_all(MYSQLI_ASSOC);

    // Query untuk mendapatkan progres makanan
    $query_food = "SELECT * FROM skin_progres_makanan WHERE id_user = ? AND tanggal_upload = '$tgl'";
    $stmt_food = $conn->prepare($query_food);
    $stmt_food->bind_param("i", $id_user);
    $stmt_food->execute();
    $result_food = $stmt_food->get_result()->fetch_all(MYSQLI_ASSOC);

    $dt['tanggal'] = $tgl;
    $dt['skin_progress'] = $result_skin;
    $dt['food_progress'] = $result_food;

    array_push($data, $dt);
}

// if (in_array('banana', $fruits)) {
//     echo "Banana exists in the array.";
// }







// $skin_progress = [];
// while ($row = $result_skin->fetch_assoc()) {
//     $skin_progress[] = $row;
// }



// $food_progress = [];
// while ($row = $result_food->fetch_assoc()) {
//     $food_progress[] = $row;
// }

// Gabungkan hasil ke dalam satu respons
$response = [
    "status" => "success",
    "data" => $data,
];

echo json_encode($response);

$conn->close();
?>
