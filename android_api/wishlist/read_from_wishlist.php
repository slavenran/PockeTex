<?php

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

include_once '../../database/Database.php';
include_once '../../models/Users.php';

$database = new Database();
$db = $database->connect();

$wishPhones = new Users($db);

$wishPhones->id = isset($_GET['id']) ? $_GET['id'] : die();

$isWished = "";

$result = $wishPhones->read_wishlist();
$num = $result->rowCount();
if ($num > 0) {
    $arrayCom = array();
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {

        $sql3 = "SELECT round(avg(rating), 1) as 'averageRat' FROM `ratings` WHERE phones_id_rating = " . $row['id'];
        $ratings = $db->prepare($sql3);
        $ratings->execute();
        $rowR = $ratings->fetch(PDO::FETCH_ASSOC);
        $averageRat = "";
        if($rowR['averageRat'] != null) {
            $averageRat = $rowR['averageRat'];
        } else {
            $averageRat = "No ratings";
        }

        $sqlUserRating = "SELECT rating FROM `ratings` WHERE phones_id_rating = ". $row['id'] ." AND users_id_rating = '$wishPhones->id'";
        $ratingsUser = $db->prepare($sqlUserRating);
        $ratingsUser->execute();
        $rowRU = $ratingsUser->fetch(PDO::FETCH_ASSOC);
        $userRat = "";
        if($rowRU['rating'] != null) {
            $userRat = $rowRU['rating'];
        } else {
            $userRat = 0;
        }

        $sqlBena = "SELECT count(w.phones_id_wishlist) from wishlist w WHERE w.users_id_wishlist = '$wishPhones->id' and w.phones_id_wishlist = " . $row['id'] . " GROUP BY w.phones_id_wishlist";
        $wished = $db->prepare($sqlBena);
        $wished->execute();
        $isItWished = $wished->fetch(PDO::FETCH_ASSOC);
        if($isItWished != 0) {
            $isWished = "wished";
        } else {
            $isWished = "notWished";
        }

        $arrayItem = array(
            'name' => $row['name'],
            'model' => $row['model'],
            'year' => $row['year'],
            'image' => $row['image'],
            'storage' => $row['storage'],
            'resolution' => $row['resolution'],
            'cost' => $row['cost'],
            'description'=> $row['description'],
            'averageRating' => $averageRat,
            'userRating' => $userRat,
            'isWished' => $isWished,
            'id' => $row['id']
        );
        array_push($arrayCom, $arrayItem);
    }
    echo json_encode($arrayCom);
}