<?php

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Method: DELETE');
header('Access-Control-Allow-Headers: Access-Control-Allow-Origin, Content-Type, Access-Control-Allow-Method, Authorization, X-Requested-With');

include_once '../../database/Database.php';
include_once '../../models/Users.php';

$cid = $_GET['cid'];
$id = $_GET['id'];

$database = new Database();
$db = $database->connect();

$user = new Users($db);

$user->cid = $cid;
$user->id = $id;

if($user->remove_from_cart()) {
    echo json_encode(
        array('message' => 'Removed')
    );
} else {
    echo json_encode(
        array('message' => 'Error')
    );
}

