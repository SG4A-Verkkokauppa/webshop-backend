<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';
// Tuoteryhmien näyttäminen:

try {
    $db= openDb();
    selectAsJson($db, 'select * from testi');
}
catch (PDOException $pdoex){
    returnError($pdoex);
}