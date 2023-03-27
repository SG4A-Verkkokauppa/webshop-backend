<?php
require_once "../inc/functions.php";
require_once "../inc/headers.php";
// Tuotteiden näyttäminen tuoteryhmän perusteella:

$url = $_SERVER['REQUEST_URI'];
$parameters = explode('/', $url);
$tuoteryhma_id = $parameters[3];

//$tuoteryhma_id = $parameters[3];

//print_r($url);
//print_r($parameters);
//print $tuoteryhma_id;


try {
    $db = openDb();
    $sql = "select * from Tuoteryhma where tuoteryhma_id = $tuoteryhma_id";
    $query = $db->query($sql);
    $category=$query->fetch(PDO::FETCH_ASSOC);

    $sql ="select * from Tuotteet where tuoteryhma_id = $tuoteryhma_id";
    $query = $db->query($sql);
    $products = $query->fetchAll(PDO::FETCH_ASSOC);

    header('HTTP/1.1 200 OK');
    echo json_encode(array(
        "category" => $category['tuoteryhma_nimi'],
        "products" => $products
    ));
}
catch(PDOException $pdoex) {
    returnError($pdoex);
}