<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

try {
    $db = openDb();
    $sql ="select * from Tuotteet";
    $query = $db->query($sql);
    $products = $query->fetchAll(PDO::FETCH_ASSOC);

    header('HTTP/1.1 200 OK');
    echo json_encode(array(
        "Tuotteet" => $products
    ));
}
catch(PDOException $pdoex) {
    returnError($pdoex);
}