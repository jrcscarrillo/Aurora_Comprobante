<?php
$message = "No ha llegado Mensajes";
if(isset($_COOKIE['Errores'])) {
    $mensaje = $_COOKIE['Errores'];
}
require ('paraContinuar.html');
echo '<script type="text/javascript">'.
        "$(document).ready(function(){".
        "$('#mensaje').text($mensaje);".
        "})".
        "</script>";