<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$url = $_SERVER['REQUEST_URI'];
$parameters = explode('/', $url);
$tuotteen_id = $parameters[3];

try {
  $db = openDb();
  selectRowAsJson($db,"select * from Tuotteet where tuotteen_id = $tuotteen_id");
}
catch (PDOException $pdoex) {
  returnError($pdoex);
}