<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$url = $_SERVER['REQUEST_URI'];
$parameters = explode('/', $url);
$phrase = $parameters[3];
//print_r($phrase);
//print_r($parameters);
try {
    $db = openDb();
    $sql = "select * from Tuotteet where tuotteen_nimi like '%$phrase%'";
    selectAsJson($db,$sql);
}
catch(PDOException $pdoex) {
    returnError($pdoex);
}