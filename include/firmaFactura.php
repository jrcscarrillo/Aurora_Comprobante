<?php

/*
 * Autor:   Juan Carrillo
 * Fecha:   Julio 2 2014
 * Proyecto: Comprobantes Electronicos
 */
session_start();
include 'conectaBaseDatos.php';
//var_dump($GLOBALS);
/*
 *      1. Revisar que la sesion tenga seleccionado al contribuyente
 *      2. Revisar que se hayan seleccionados las fechas para procesar
 */
if (!isset($_SESSION['establecimiento']) or !isset($_SESSION['puntoemision'])) {
    require 'paraMensajes.html';
    echo '<script type="text/javascript">'.
        "$(document).ready(function(){".
        "$('#mensaje').text('*** ERROR No tiene seleccionado emisor');".
        "})".
        "</script>";
        exit();
}
if (isset($_GET['start'])) {
    $fechaFin = $_GET['finish'];
    $fechaInicio = $_GET['start'];
    $archivo = $_GET['archivo'];
    $inicioDB = strtotime($fechaInicio);
    $finDB = strtotime($fechaFin);
//    echo "Fecha con strtotime : " . $inicioDB;
    $fechaInicio = date('Y-m-d H:i:s', $inicioDB);
    $fechaFin = date('Y-m-d H:i:s', $finDB);
//    echo "Fecha con date : " . $inicio;
   
    firmaFactura($fechaInicio, $fechaFin, $archivo);
    require 'paraContinuar.html';
    echo '<script type="text/javascript">'.
        "$(document).ready(function(){".
        "$('#mensaje').text('--- Facturas firnadas satisfactoriamente ---');".
        "})".
        "</script>";
        exit();
} else {
    require 'paraMensajes.html';
    echo '<script type="text/javascript">'.
        "$(document).ready(function(){".
        "$('#mensaje').text('*** ERROR No ha seleccionado fechas de proceso');".
        "})".
        "</script>";
        exit();
}

function firmaFactura($fechaInicio, $fechaFin, $archivo) {
    $db = db_connect();
    if ($db->connect_errno) {
        die('Error de Conexion: ' . $db->connect_errno);
    }
    $stmt = "";
    $sql = "select TxnID, TxnNumber, CustomerRef_FullName, CustomField10 from invoice where CustomField10=?";
    $stmt = $db->prepare($sql) or die(mysqli_error($db));
    $selec = "SELECCIONADA";
    $stmt->bind_param("s", $selec);
    $flag = FALSE;
    $existe = $stmt->execute();
    $stmt->bind_result($db_id, $db_numero, $db_cliente, $db_estado);        /* fetch values */
    $doc = new DOMDocument();
    $doc->formatOutput = TRUE;
    $root = $doc->createElement('Facturas');
    $factura = $doc->createElement('factura');
    while ($stmt->fetch()) {
        $flag = TRUE;
  
//        echo "Si encontro al " . $db_cliente . " que tiene la factura " . $db_numero . "\n";

        $db_infoTributaria = "";
        $infoTributaria = $doc->createElement('infoTributaria', $db_infoTributaria);

        $db_ambiente = "";
        $ambiente = $doc->createElement('ambiente', $db_ambiente);
        $db_tipoEmision = "";
        $tipoEmision = $doc->createElement('tipoEmision', $db_tipoEmision);
        $db_razonSocial = "";
        $razonSocial = $doc->createElement('razonSocial', $db_razonSocial);
        $db_nombreComercial = "";
        $nombreComercial = $doc->createElement('nombreComercial', $db_nombreComercial);
        $db_ruc = "";
        $ruc = $doc->createElement('ruc', $db_ruc);
        $db_claveAcceso = "";
        $claveAcceso = $doc->createElement('claveAcceso', $db_claveAcceso);
        $db_codDoc = "";
        $codDoc = $doc->createElement('codDoc', $db_codDoc);
        $db_estab = "";
        $estab = $doc->createElement('estab', $db_estab);
        $db_ptoEmi = "";
        $ptoEmi = $doc->createElement('ptoEmi', $db_ptoEmi);
        $db_secuencial = "";
        $secuencial = $doc->createElement('secuencial', $db_secuencial);
        $db_dirMatriz = "";
        $dirMatriz = $doc->createElement('dirMatriz', $db_dirMatriz);
        $db_codigo = "";
        $codigo = $doc->createElement('codigo', $db_codigo);

        $infoTributaria->appendChild($ambiente);
        $infoTributaria->appendChild($codigo);
        $infoTributaria->appendChild($razonSocial);
        $infoTributaria->appendChild($nombreComercial);
        $infoTributaria->appendChild($ruc);
        $infoTributaria->appendChild($claveAcceso);
        $infoTributaria->appendChild($codDoc);
        $infoTributaria->appendChild($estab);
        $infoTributaria->appendChild($ptoEmi);
        $infoTributaria->appendChild($secuencial);
        $infoTributaria->appendChild($dirMatriz);
        $infoTributaria->appendChild($codigo);


        $db_infoFactura = "";
        $infoFactura = $doc->createElement('infoFactura', $db_infoFactura);

        $db_fechaEmision = "";
        $fechaEmision = $doc->createElement('fechaEmision', $db_fechaEmision);
        $db_dirEstablecimiento = "";
        $dirEstablecimiento = $doc->createElement('dirEstablecimiento', $db_dirEstablecimiento);
        $db_contribuyenteEspecial = "";
        $contribuyenteEspecial = $doc->createElement('contribuyenteEspecial', $db_contribuyenteEspecial);
        $db_obligadoContabilidad = "";
        $obligadoContabilidad = $doc->createElement('obligadoContabilidad', $db_obligadoContabilidad);
        $db_tipoIdentificacionComprador = "";
        $tipoIdentificacionComprador = $doc->createElement('tipoIdentificacionComprador', $db_tipoIdentificacionComprador);
        $db_razonSocialComprador = "";
        $razonSocialComprador = $doc->createElement('razonSocialComprador', $db_razonSocialComprador);
        $db_identificacionComprador = "";
        $identificacionComprador = $doc->createElement('identificacionComprador', $db_identificacionComprador);
        $db_totalSinImpuestos = "";
        $totalSinImpuestos = $doc->createElement('totalSinImpuestos', $db_totalSinImpuestos);
        $db_totalDescuento = "";
        $totalDescuento = $doc->createElement('totalDescuento', $db_totalDescuento);
        $db_totalConImpuestos = "";
        $totalConImpuestos = $doc->createElement('totalConImpuestos', $db_totalConImpuestos);

        /*
          Una factura puede tener mas de un impuesto
         */
        $db_totalImpuesto = "";
        $totalImpuesto = $doc->createElement('totalImpuesto', $db_totalImpuesto);

        $codigo = $doc->createElement('codigo', $db_codigo);

        $db_codigoPorcentaje = "";
        $codigoPorcentaje = $doc->createElement('codigoPorcentaje', $db_codigoPorcentaje);

        $db_baseImponible = "";
        $baseImponible = $doc->createElement('baseImponible', $db_baseImponible);

        $db_valor = "";
        $valor = $doc->createElement('valor', $db_valor);

        $totalImpuesto->appendChild($codigo);
        $totalImpuesto->appendChild($codigoPorcentaje);
        $totalImpuesto->appendChild($baseImponible);
        $totalImpuesto->appendChild($valor);

        $totalConImpuestos->appendChild($totalImpuesto);

        $db_propina = "";
        $propina = $doc->createElement('propina', $db_propina);
        $db_importeTotal = "";
        $importeTotal = $doc->createElement('importeTotal', $db_importeTotal);
        $db_moneda = "";
        $moneda = $doc->createElement('moneda', $db_moneda);

        $infoFactura->appendChild($fechaEmision);
        $infoFactura->appendChild($dirEstablecimiento);
        $infoFactura->appendChild($contribuyenteEspecial);
        $infoFactura->appendChild($obligadoContabilidad);
        $infoFactura->appendChild($tipoIdentificacionComprador);
        $infoFactura->appendChild($razonSocialComprador);
        $infoFactura->appendChild($identificacionComprador);
        $infoFactura->appendChild($totalSinImpuestos);
        $infoFactura->appendChild($totalDescuento);
        $infoFactura->appendChild($totalConImpuestos);
        $infoFactura->appendChild($propina);
        $infoFactura->appendChild($importeTotal);
        $infoFactura->appendChild($moneda);

        $db_detalles = "";
        $detalles = $doc->createElement('detalles', $db_detalles);

        /*
          Esto es por cada producto
         */

        $db_detalle = "";
        $detalle = $doc->createElement('detalle', $db_detalle);

        $db_codigoPrincipal = "";
        $codigoPrincipal = $doc->createElement('codigoPrincipal', $db_codigoPrincipal);
        $db_descripcion = "";
        $descripcion = $doc->createElement('descripcion', $db_descripcion);
        $db_cantidad = "";
        $cantidad = $doc->createElement('cantidad', $db_cantidad);
        $db_precioUnitario = "";
        $precioUnitario = $doc->createElement('precioUnitario', $db_precioUnitario);
        $db_descuento = "";
        $descuento = $doc->createElement('descuento', $db_descuento);
        $db_precioTotalSinImpuesto = "";
        $precioTotalSinImpuesto = $doc->createElement('precioTotalSinImpuesto', $db_precioTotalSinImpuesto);

        $db_impuestos = "";
        $impuestos = $doc->createElement('impuestos', $db_impuestos);

        /*
          Puede haber mas de un impuesto por el mismo producto
         */
        $db_impuesto = "";
        $impuesto = $doc->createElement('impuesto', $db_impuesto);

        $codigo = $doc->createElement('codigo', $db_codigo);
        $codigoPorcentaje = $doc->createElement('codigoPorcentaje', $db_codigoPorcentaje);
        $db_tarifa = "";
        $tarifa = $doc->createElement('tarifa', $db_tarifa);
        $baseImponible = $doc->createElement('baseImponible', $db_baseImponible);
        $valor = $doc->createElement('valor', $db_valor);
        $impuesto->appendChild($codigo);
        $impuesto->appendChild($codigoPorcentaje);
        $impuesto->appendChild($tarifa);
        $impuesto->appendChild($baseImponible);
        $impuesto->appendChild($valor);

        $impuestos->appendChild($impuesto);

        $detalle->appendChild($codigoPrincipal);
        $detalle->appendChild($descripcion);
        $detalle->appendChild($cantidad);
        $detalle->appendChild($precioUnitario);
        $detalle->appendChild($descuento);
        $detalle->appendChild($precioTotalSinImpuesto);
        $detalle->appendChild($impuestos);

        $detalles->appendChild($detalle);

        $db_infoAdicional = "";
        $infoAdicional = $doc->createElement('infoAdicional', $db_infoAdicional);

        $db_campoAdicional = "";
        $campoAdicional = $doc->createElement('campoAdicional', $db_campoAdicional);
        $campoAdicionalATTR = $doc->createElement('nombre');
        $campoAdicionalATTR->value = "Direccion";
        $campoAdicional->appendChild($campoAdicionalATTR);

        $campoAdicional = $doc->createElement('campoAdicional', $db_campoAdicional);
        $campoAdicionalATTR = $doc->createElement('Email');
        $campoAdicionalATTR->value = "jrcscarrillo@gmail.com";
        $campoAdicional->appendChild($campoAdicionalATTR);

        $factura->appendChild($infoAdicional);
        $factura->appendChild($detalles);
        $factura->appendChild($infoFactura);
        $factura->appendChild($infoTributaria);

        $root->appendChild($factura);
    }
    $doc->appendChild($root);
    $doc->save("../tmp/$archivo");
    /* close statement */
    $stmt->close();
    $db->close();
}
