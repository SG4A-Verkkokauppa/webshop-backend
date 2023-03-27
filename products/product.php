<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$uri = parse_url(filter_input(INPUT_SERVER,'PATH_INFO'),PHP_URL_PATH);
$parameters = explode('/',$uri);
$tuotteen_id = $parameters[1];

try {
  $db = openDb();
  selectRowAsJson($db,"select * from Tuotteet where tuotteen_id = $tuotteen_id");
}
catch (PDOException $pdoex) {
  returnError($pdoex);
}