USE `srijrcscarrillo` ;

-- -----------------------------------------------------
-- Table `srijrcscarrillo`.`invoice`
-- -----------------------------------------------------
SHOW WARNINGS;
INSERT INTO `srijrcscarrillo`.`invoice` (TxnID, TxnNumber, CustomerRef_ListID, CustomerRef_FullName, TxnDate, RefNumber, FOB, Subtotal, SalesTaxTotal, BalanceRemaining) VALUES(1, 1, 1, "Juan Carrillo", CURDATE(), 1, 'salio del puerto', 12300.23, 1230.33, 12300.23);