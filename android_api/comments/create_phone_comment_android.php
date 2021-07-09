<?php

include_once '../../database/Database.php';
include_once '../../models/PhoneComments.php';

$database = new Database();
$db = $database->connect();

$data = json_decode(file_get_contents("php://input"));

$commentModel = new PhoneComments($db);

$comment = $data->text;
$userId = $data->users_id;
$phoneId = $data->phone_id;

$commentModel->text = $comment;
$commentModel->user_id = $userId;
$commentModel->phone_id = $phoneId;

if($commentModel->create()) {
    echo json_encode(
        array('message' => 'Comment Created')
    );
} else {
    echo json_encode(
        array('message' => 'Comment Not Created')
    );
}

?>