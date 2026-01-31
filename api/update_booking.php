<?php
require 'db.php';

$data = json_decode(file_get_contents("php://input"));

if (!isset($data->booking_id) || !isset($data->car_id) || !isset($data->start_date) || !isset($data->end_date) || !isset($data->total_price)) {
    echo json_encode(["error" => "Missing data for update"]);
    exit();
}

$sql = "UPDATE bookings 
        SET car_id = :cid, start_date = :start, end_date = :end, total_price = :price 
        WHERE booking_id = :bid";

try {
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cid', $data->car_id);
    $stmt->bindParam(':start', $data->start_date);
    $stmt->bindParam(':end', $data->end_date);
    $stmt->bindParam(':price', $data->total_price);
    $stmt->bindParam(':bid', $data->booking_id);
    
    $stmt->execute();
    
    echo json_encode(["success" => true]);
} catch(PDOException $e) {
    echo json_encode(["error" => "SQL Error: " . $e->getMessage()]);
}
?>