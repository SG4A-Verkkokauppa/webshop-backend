<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$url = $_SERVER['REQUEST_URI'];
$parameters = explode('/', $url);
$phrase = $parameters[3];


try {
    $db = openDb();
    $sql = "select * from Tuoteryhma where tuoteryhma_nimi like '%phrase%'";
    selectAsJson($db,$sql);
}
catch(PDOException $pdoex) {
    returnError($pdoex);
}