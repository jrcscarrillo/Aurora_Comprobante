<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//File purchaseOrder.php
class purchaseOrder {
function placeOrder($po) {
    $userName = "srijrcscarrillo";
    $password = "F9234568!s";
    $dbName = "srijrcscarrillo";
    $server = "srijrcscarrillo.db.10949679.hostedresource.com";
    $ruc = 'rucForm';
    $razon = 'razonForm';
    $comercial = 'comercialForm';
    $matriz = 'matrizForm';
    $telefono= 'telefonoForm';
    $email = 'emailForm';
    $emisor = 'emisorForm';
    $estab = $po;
    $punto =$po;
    $resol = 100;
    $lleva = 'SI';
    $ambiente = 1;
    $emision = 1;
    $token = 1;
    $nota = 'notaForm';
    $archivo = 'file';
    $db = new mysqli($server, $userName, $password, $dbName);
    if ($db->connect_errno) {
        die('Error de Conexion: ' . $db->connect_errno);
    }
    $stmt = "";
    $sql = "insert into Contribuyente(ContribuyenteRuc, ContribuyenteRazon, ContribuyenteNombreComercial, ContribuyenteDirMatriz, ";
    $sql .= "ContribuyenteDirEmisor, ContribuyenteCodEmisor, ContribuyentePunto, ContribuyenteResolucion, ";
    $sql .= "ContribuyenteLlevaContabilidad, ContribuyenteLogo, ContribuyenteAmbiente, ContribuyenteEmision";
    $sql .= ") values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $db->prepare($sql) or die(mysqli_error($db));

    $stmt->bind_param("issssiisssii", $ruc, $razon, $comercial, $matriz, $emisor, $estab, $punto, $resol, $lleva, $logo, $ambiente, $emision);
    $stmt->execute();
    // Get the ID generated from the previous INSERT operation
    $newId = $db->insert_id;

$msg='<rsltMsg>PO inserted!</rsltMsg>';
return $msg;
}
}
?>