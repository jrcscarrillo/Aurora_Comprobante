<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
try {
$wsdl = "https://celcer.sri.gob.ec/comprobantes-electronicos-ws/RecepcionComprobantes?wsdl";    
} catch (SoapFault $exc) {
    echo $exc->faultstring();
}

$handle = fopen("loteFacturas.xml", "r");
$po= fread($handle, filesize("loteFacturas.xml"));
fclose($handle);
$client = new SoapClient($wsdl);
print_r($client->__getTypes());
try {
print_r($client->ValidarComprobante($po));
}
catch (SoapFault $exp) {
print $exp->getMessage();
}
