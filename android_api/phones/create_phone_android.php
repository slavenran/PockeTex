<?php

include_once '../../database/Database.php';
include_once '../../models/Phones.php';

$database = new Database();
$db = $database->connect();

$data = json_decode(file_get_contents("php://input"));

$phone = new Phones($db);

$model = $data->model;
$year = $data->modelYear;
$manuId = $data->manuId;


if($model == "" || $year == "") {
    echo json_encode(
        array('message' => 'Please Enter Credentials')
    );
    die();
}

$phone->model = $model;
$phone->year = $year;
$phone->manufacturer_id = $manuId;

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