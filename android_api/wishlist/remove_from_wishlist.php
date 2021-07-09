<?php

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Method: DELETE');
header('Access-Control-Allow-Headers: Access-Control-Allow-Origin, Content-Type, Access-Control-Allow-Method, Authorization, X-Requested-With');

include_once '../../database/Database.php';
include_once '../../models/Users.php';

$model = $_GET['model'];
$id = $_GET['id'];

$database = new Database();
$db = $database->connect();

$user = new Users($db);

$sql = "SELECT * FROM phones WHERE model = ? LIMIT 0,1";

$stmt = $db->prepare($sql);
$stmt->bindParam(1, $model);
$stmt->execute();

$row = $stmt->fetch(PDO::FETCH_ASSOC);

$phoneId = $row['id'];

$user->phone_id = $phoneId;
$user->id = $id;

if($user->remove_from_wishlist()) {
    echo json_encode(
        array('message' => 'Removed')
    );
} else {
    echo json_encode(
        array('message' => 'Error')
    );
}

