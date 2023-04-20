<?php

require_once '../inc/functions.php';
require_once '../inc/headers.php';

$body = file_get_contents("php://input");
$input = json_decode($body);

$fname = filter_var($input->etunimi,FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$lname = filter_var($input->sukunimi,FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$address = filter_var($input->toimitusosoite,FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$zip = filter_var($input->postinumero,FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$city = filter_var($input->postitoimipaikka,FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$cart = $input->cart;

try{
    $db = openDb();
    $db->beginTransaction();

    $sql = "INSERT INTO Asiakas (etunimi, sukunimi, osoite, postinumero, postitoimipaikka) values('".
        filter_var($fname,FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','".
        filter_var($lname,FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','".
        filter_var($address,FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','".
        filter_var($zip,FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','".
        filter_var($city,FILTER_SANITIZE_FULL_SPECIAL_CHARS)
        . "')";

    $customer_id = executeInsert($db,$sql);

    $sql = "INSERT INTO Tilaus (asiakas_id) values ($customer_id)";
    $order_id = executeInsert($db,$sql);

    foreach ($cart as $product) {
        $sql = "INSERT INTO Tilausrivi (tilaus_id, tuotteen_id) values ("
        .

            $order_id . "," .
            $product->id
        .")";
        executeInsert($db,$sql);
    }

$db->commit();


header('HTTP/1.1 200 OK');
$data = array('asiakas_id' => $customer_id);
echo json_encode($data);
}

catch (PDOException $pdoex) {
    $db->rollback();
    returnError($pdoex);
}