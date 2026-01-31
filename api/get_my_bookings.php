<?php
require 'db.php';

$google_id = $_GET['google_id'] ?? '';

if (!$google_id) {
    echo json_encode([]);
    exit;
}

$sql = "SELECT 
            b.booking_id, b.start_date, b.end_date, b.total_price, b.status,
            c.brand, c.model, c.image_path,
            a.city_name
        FROM bookings b
        JOIN users u ON b.user_id = u.user_id
        JOIN cars c ON b.car_id = c.car_id
        JOIN agencies a ON c.agency_id = a.agency_id
        WHERE u.google_id = :gid
        ORDER BY b.start_date DESC";

try {
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':gid', $google_id);
    $stmt->execute();
    $bookings = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode($bookings);
} catch(PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>