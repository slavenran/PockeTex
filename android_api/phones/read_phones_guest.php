<?php

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

include_once '../../database/Database.php';
include_once '../../models/Manufacturers.php';

$database = new Database();
$db = $database->connect();

$manufacturer = new Manufacturers($db);

if(!isset($_POST['id']) && !isset($_POST['model'])) {
    $sql2 = "SELECT m.name, p.model, p.year, p.image, p.storage, p.resolution, p.cost, p.description, p.id FROM phones p, manufacturers m WHERE m.id = p.manufacturer_id";
    $stmt = $db->prepare($sql2);
    $stmt->execute();

    $output = array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
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

        $outputItem = array(
            'id' => $row['id'],
            'name' => $row['name'],
            'model' => $row['model'],
            'year' => $row['year'],
            'image' => $row['image'],
            'storage' => $row['storage'],
            'resolution' => $row['resolution'],
            'cost' => $row['cost'],
            'description'=> $row['description'],
            'averageRating' => $averageRat
        );
        array_push($output, $outputItem);
    }

    echo json_encode($output);
//    echo json_encode(array('message' => "Nothing"));
    die();
}