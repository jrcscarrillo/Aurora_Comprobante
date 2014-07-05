<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

session_start();
include './include/mensajes.php';
if ($_SESSION['carrillosteam'] == 'carrillosteam') {
    
    /*
     *  Se controla que en la sesion este presente el usuario con la autorizacion
     *  y tambien que haya seleccionado el contribuyente que facturara
     */
    if (isset($_SESSION['establecimiento']) and isset($_SESSION['puntoemision'])) {
        require ('selecFactura.html');
        exit();
    } else {
        require ('selecContribuyente.html');
        exit();
    }
} else {
    $pasaerr = "'*** ERROR Usuario no ha ingresado al sistema'";
    mensajea($pasaerr);
    exit();
}