<?php

include_once '../../database/Database.php';
include_once '../../models/Comments.php';

$database = new Database();
$db = $database->connect();

$data = json_decode(file_get_contents("php://input"));

$commentModel = new Comments($db);

$comment = $data->text;
$userId = $data->users_id;

$commentModel->text = $comment;
$commentModel->users_id = $userId;

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