<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$url = $_SERVER['REQUEST_URI'];
$parameters = explode('/', $url);
$pharase = $parameters[3];


try {
    $db = openDb();
    $sql = "select * from Tuoteryhma where tuotteen_nimi like '%phrase%'";
    selectAsJson($db,$sql);
}
catch(PDOException $pdoex) {
    returnError($pdoex);
}