<?php

//header('Access-Control-Allow-Origin: *');
//header('Content-Type: application/json');
//header('Access-Control-Allow-Methods: POST');
//header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once '../../database/Database.php';
$database = new Database();
$db = $database->connect();

$data = json_decode(file_get_contents("php://input"));

$error = false;
$username = $data->username;
$username = htmlspecialchars(strip_tags($username));

$email = $data->email;
$email = htmlspecialchars(strip_tags($email));

$password = $data->password;
$password = htmlspecialchars(strip_tags($password));

if (empty($username)) {
    $error = true;
    echo json_encode(
        array('message' => 'Please enter your username.')
    );
    die();
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $error = true;
    echo json_encode(
        array('message' => 'Please enter a valid email.')
    );
    die();
}
if (empty($password)) {
    $error = true;
    echo json_encode(
        array('message' => 'Please enter your password.')
    );
    die();
}

if(strlen($password) < 6) {
    $error = true;
    echo json_encode(
        array('message' => 'Password must contain at least 6 characters.')
    );
    die();
}

//$password = md5($password);

if (!$error) {
    $sqlCheck = "SELECT * FROM users WHERE username = '$username'";
    $check = $db->prepare($sqlCheck);
    $check->execute();
    $data = $check->rowCount();

    if ($data == 0) {
        $sql = "INSERT INTO users(username, password, email)
                VALUES ('$username', '$password', '$email')";
        $stmt = $db->prepare($sql);
        if ($stmt->execute()) {
            echo json_encode(
                array('message' => 'Successfully registered!')
            );
        }
    } else {
        echo json_encode(
            array('message' => 'User already exists!')
        );
    }
}
