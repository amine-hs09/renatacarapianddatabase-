<?php
require 'db.php';

$data = json_decode(file_get_contents("php://input"));

if (!isset($data->google_id) || !isset($data->car_id) || !isset($data->start_date) || !isset($data->end_date)) {
    echo json_encode(["error" => "Missing data. Received: " . print_r($data, true)]);
    exit();
}

$checkUser = $conn->prepare("SELECT user_id FROM users WHERE google_id = :gid");
$checkUser->bindParam(':gid', $data->google_id);
$checkUser->execute();
$userRow = $checkUser->fetch(PDO::FETCH_ASSOC);

if ($userRow) {
    $real_user_id = $userRow['user_id'];
} else {
    $insertUser = $conn->prepare("INSERT INTO users (google_id, email, full_name) VALUES (:gid, :email, :name)");
    $insertUser->bindParam(':gid', $data->google_id);
    $insertUser->bindParam(':email', $data->email);
    $insertUser->bindParam(':name', $data->full_name);
    
    if($insertUser->execute()) {
        $real_user_id = $conn->lastInsertId();
    } else {
        echo json_encode(["error" => "Could not create user"]);
        exit();
    }
}

$sql = "INSERT INTO bookings (user_id, car_id, start_date, end_date, total_price) 
        VALUES (:uid, :cid, :start, :end, :price)";

try {
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':uid', $real_user_id);
    $stmt->bindParam(':cid', $data->car_id);
    $stmt->bindParam(':start', $data->start_date);
    $stmt->bindParam(':end', $data->end_date);
    $stmt->bindParam(':price', $data->total_price);
    
    $stmt->execute();
    
    echo json_encode(["success" => true, "booking_id" => $conn->lastInsertId()]);
} catch(PDOException $e) {
    echo json_encode(["error" => "SQL Error: " . $e->getMessage()]);
}
?>