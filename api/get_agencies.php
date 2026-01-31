<?php
require 'db.php';

$sql = "SELECT * FROM agencies";

try {
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $agencies = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($agencies);
} catch(PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>