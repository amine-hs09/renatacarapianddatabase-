<?php
require 'db.php';

$sql = "SELECT cars.*, agencies.city_name, agencies.latitude, agencies.longitude 
        FROM cars 
        JOIN agencies ON cars.agency_id = agencies.agency_id";

try {
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $cars = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($cars);
} catch(PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>