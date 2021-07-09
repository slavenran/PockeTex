<?php

include_once '../../database/Database.php';
include_once '../../models/Users.php';

$database = new Database();
$db = $database->connect();

$data = json_decode(file_get_contents("php://input"));

$wishPhones = new Users($db);

$userId = $data->id;
$model = $data->model;

$sql = "SELECT * FROM phones WHERE model = ? LIMIT 0,1";

$stmt = $db->prepare($sql);
$stmt->bindParam(1, $model);
$stmt->execute();

$row = $stmt->fetch(PDO::FETCH_ASSOC);

$phoneId = $row['id'];

$wishPhones->id = $userId;
$wishPhones->phone_id = $phoneId;

if($wishPhones->add_to_wishlist()) {
    echo json_encode(
        array('message' => 'Added to wishlist')
    );
} else {
    echo json_encode(
        array('message' => 'Failed to add to wishlist')
    );
}
