<?php

/* 
 * Autor:   Juan Carrillo
 * Fecha:   Junio 22 2014
 * Proyecto: Comprobantes Electronicos
 */
session_start();

if ($_SESSION['carrillosteam'] == 'carrillosteam') {
    var_dump($_SESSION);
    require 'paraMensajes.html';
    echo '<script type="text/javascript">'.
        "$(document).ready(function(){".
        "$('#mensaje').html('usuario previamente logeado');".
        "})".
        "</script>";
        exit();
}

include 'conectaBaseDatos.php';
echo 'Con Get \n\n';
var_dump($_GET);
echo '\nCon Post \n\n';
var_dump($_POST);
if (isset($_POST['email'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];
    $flagDB = loginUsuario($email, $password);
    exit();
} else {
    require 'paraContinuar.html';
    echo '<script type="text/javascript">'.
        "$(document).ready(function(){".
        "$('#mensaje').html('No ha ingresado datos');".
        "})".
        "</script>"; 
        exit();
}
function loginUsuario($email, $password) {
    var_dump($GLOBALS);

        $passencriptada = hash(sha256, $password);
    
        $db = db_connect();
        $sql = "select * from Usuarios where UsuariosEmail=? and UsuariosPassword=?";
        $stmt = $db->prepare($sql) or die(mysqli_error($db));
        $stmt->bind_param("ss", $email, $passencriptada);
        $stmt->bind_result($wk_id, $wk_email, $wk_pass, $wk_habilita, $wk_nombre, $wk_apellido, $wk_estado);
        $existe = $stmt->execute();
        var_dump($wk_id, $email, $password);
        if ($stmt->fetch()){
            $flag = TRUE;
            if ($wk_habilita == 1) {
                require 'paraContinuar.html';
                echo '<script type="text/javascript">'.
                        "$(document).ready(function(){".
                        "$('#mensaje').html('El usuario ha ingresado saisfactoriamente');".
                        "})".
                        "</script>";
                $_SESSION['carrillosteam'] = 'carrillosteam';
                $_SESSION['nombre'] = $wk_nombre;
                $_SESSION['apellido'] = $wk_apellido;
                $_SESSION['email'] = $wk_email;
                
            } else {
                require 'paraContinuar.html';
                echo '<script type="text/javascript">'.
                        "$(document).ready(function(){".
                        "$('#mensaje').html('Usuario registrado pero no esta habilitado. Contactarse con el administrador');".
                        "})".
                        "</script>";
                }
        } else {
            require 'paraMensajes.html';
            echo '<script type="text/javascript">'.
                    "$(document).ready(function(){".
                    "$('#mensaje').html('Usuario no existe');".
                    "})".
                    "</script>";
        }
        $stmt->close();
        $db->close();

}