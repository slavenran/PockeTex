<?php

include_once '../../database/Database.php';
include_once '../../models/UserPhones.php';

$database = new Database();
$db = $database->connect();

$data = json_decode(file_get_contents("php://input"));

$phone = new UserPhones($db);

$model = $data->model;
$user_id = $data->userId;
$image = $data->image;
$description = $data->description;
$cost = $data->cost;
$phone_number = $data->phoneNumber;


if($model == "" || $cost == "" || $phone_number == "") {
    echo json_encode(
        array('message' => 'Please Enter Credentials')
    );
    die();
}

$phone->model = $model;
$phone->user_id = $user_id;
$phone->image = $image;
$phone->description = $description;
$phone->cost = $cost;
$phone->phone_number = $phone_number;

if($phone->create()) {
    echo json_encode(
        array('message' => 'Phone Created')
    );
} else {
    echo json_encode(
        array('message' => 'Phone Not Created')
    );
}

?>