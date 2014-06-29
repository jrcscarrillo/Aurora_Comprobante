<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
session_start();
if (!isset($_SESSION['carrillosteam'])) {
    require ('login.html');
}
require ('paraMensajes.html');
echo '<script type="text/javascript">'.
        "$(document).ready(function(){".
        "$('#mensaje').html('usuario previamente logeado');".
        "})".
        "</script>";
