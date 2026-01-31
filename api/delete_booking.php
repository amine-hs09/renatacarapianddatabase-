<?php
require 'db.php';

$data = json_decode(file_get_contents("php://input"));

if (!isset($data->booking_id)) {
    echo json_encode(["error" => "No booking ID provided"]);
    exit;
}

$sql = "DELETE FROM bookings WHERE booking_id = :bid";

try {
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':bid', $data->booking_id);
    $stmt->execute();
    
    echo json_encode(["success" => true]);
} catch(PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>