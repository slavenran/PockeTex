<?php

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

include_once '../../database/Database.php';
include_once '../../models/Users.php';

$database = new Database();
$db = $database->connect();

$user = new Users($db);

$user->id = isset($_GET['id']) ? $_GET['id'] : die();

$user->read_single();

$arrMan = array(
    'id' => $user->id,
    'username' => $user->username,
    'password' => $user->password,
    'email' => $user->email,
    'imageurl' => $user->imageurl,
    'readmsgs' => $user->readmsgs
);

print_r(json_encode($arrMan));

?>