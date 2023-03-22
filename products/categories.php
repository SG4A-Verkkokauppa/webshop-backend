<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';
// Tuoteryhmien näyttäminen:

try {
    $db= openDb();
    selectAsJson($db, 'select * from Tuoteryhma');
}
catch (PDOException $pdoex){
    returnError($pdoex);
}