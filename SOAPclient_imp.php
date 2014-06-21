<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$wsdl = "http://localhost/Aurora/po_imp.wsdl";
$handle = fopen("purchaseOrder.xml", "r");
$po= fread($handle, filesize("purchaseOrder.xml"));
fclose($handle);
$client = new SoapClient($wsdl);
try {
print $result=$client->placeOrder($po);
}
catch (SoapFault $exp) {
print $exp->getMessage();
}