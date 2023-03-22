<?php
require_once "../inc/functions.php";
require_once "../inc/headers.php";
// Tuotteiden näyttäminen tuoteryhmän perusteella:

$uri = parse_url(filter_input(INPUT_SERVER,'PATH_INFO'),PHP_URL_PATH);
$parameters = explode('/', $uri);
$tuoteryhma_id = $parameters[7]; // Koodi toimii jos tästä poistaa parameters ja laittaa pelkän seiskan.

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