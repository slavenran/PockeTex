<?php

include_once '../../database/Database.php';
include_once '../../models/Users.php';

$database = new Database();
$db = $database->connect();

$data = json_decode(file_get_contents("php://input"));

$user = new Users($db);


$user->username = $data->username;
$user->email = $data->email;
$user->readmsgs = $data->readmsgs;
$user->id = $data->id;

if($user->update()) {
    echo json_encode(
        array('message' => 'User Updated')
    );
} else {
    echo json_encode(
        array('message' => 'User Not Updated')
    );
}

?>