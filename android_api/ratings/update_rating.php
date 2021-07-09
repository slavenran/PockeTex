<?php

include_once '../../database/Database.php';
include_once '../../models/Ratings.php';

$database = new Database();
$db = $database->connect();

$data = json_decode(file_get_contents("php://input"));

$ratingClass = new Ratings($db);

$user_id = $data->userId;
$phone_id = $data->phoneId;
$rating = $data->rating;

$ratingClass->rating = $rating;
$ratingClass->users_id_rating = $user_id;
$ratingClass->phones_id_rating = $phone_id;

if($ratingClass->update_rating()) {
    echo json_encode(
        array('message' => 'Rating Updated')
    );
} else {
    echo json_encode(
        array('message' => 'Rating Update Error')
    );
}

?>