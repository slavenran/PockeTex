<?php
session_start();

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');


include_once '../../database/Database.php';
include_once '../../models/PhoneComments.php';

$phone_id = $_GET['phone_id'];

$database = new Database();
$db = $database->connect();

$comments = new PhoneComments($db);

$comments->phone_id = $phone_id;

$result = $comments->read();
$num = $result->rowCount();
if ($num > 0) {
    $arrayCom = array();
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        $arrayItem = array(
            'id' => $row['id'],
            'text' => $row['text'],
            'user_id' => $row['user_id'],
            'phone_id' => $row['phone_id'],
            'username' => $row['username'],
            'imageurl' => $row['imageurl']
//            'session_username' => $_SESSION['username']
        );
        array_push($arrayCom, $arrayItem);
    }
    echo json_encode($arrayCom);
}

?>