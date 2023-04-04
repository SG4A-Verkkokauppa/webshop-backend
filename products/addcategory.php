<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$name = filter_var($input->name, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

try{
    $db = openDb();
    $sql = "INSERT INTO Tuoteryhma (tuoteryhma_nimi) VALUES ('$name')";
    executeInsert($db, $sql);
    $data = array('tuoteryhma_id' => $db->lastInsertId(),'tuoteryhma_nimi' => $name);
    print json_encode($data);
}
catch (PDOException $pdoex) {
    returnError($pdoex);
}