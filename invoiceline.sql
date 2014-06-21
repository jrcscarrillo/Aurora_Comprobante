SHOW WARNINGS;
USE `srijrcscarrillo` ;

-- -----------------------------------------------------
-- Table `srijrcscarrillo`.`invoiceline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srijrcscarrillo`.`invoiceline` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srijrcscarrillo`.`invoiceline` (
	TxnLineID varchar(255) NULL,
	ItemRef_ListID varchar(255) NULL,
	ItemRef_FullName varchar(255) NULL,
	Descuento varchar(255) NULL,
	Quantity varchar(255) NULL,
	UnitOfMeasure varchar(255) NULL,
	OverrideUOMSetRef_ListID varchar(255) NULL,
	OverrideUOMSetRef_FullName varchar(255) NULL,
	Rate varchar(255) NULL,
	RatePercent varchar(255) NULL,
	ClassRef_ListID varchar(255) NULL,
	ClassRef_FullName varchar(255) NULL,
	Amount float NULL,
	InventorySiteRef_ListID varchar(255) NULL,
	InventorySiteRef_FullName varchar(255) NULL,
	InventorySiteLocationRef_ListID varchar(255) NULL,
	InventorySiteLocationRef_FullName varchar(255) NULL,
	SerialNumber varchar(255) NULL,
	LotNumber varchar(255) NULL,
	ServiceDate datetime NULL,
	SalesTaxCodeRef_ListID varchar(255) NULL,
	SalesTaxCodeRef_FullName varchar(255) NULL,
	Other1 varchar(255) NULL,
	Other2 varchar(255) NULL,
	LinkedTxnID varchar(255) NULL,
	LinkedTxnLineID varchar(255) NULL,
	CustomField1 varchar(50) NULL,
	CustomField2 varchar(50) NULL,
	CustomField3 varchar(50) NULL,
	CustomField4 varchar(50) NULL,
	CustomField5 varchar(50) NULL,
	CustomField6 varchar(50) NULL,
	CustomField7 varchar(50) NULL,
	CustomField8 varchar(50) NULL,
	CustomField9 varchar(50) NULL,
	CustomField10 varchar(50) NULL,
	CustomField11 varchar(50) NULL,
	CustomField12 varchar(50) NULL,
	CustomField13 varchar(50) NULL,
	CustomField14 varchar(50) NULL,
	CustomField15 varchar(50) NULL,
	IDKEY varchar(255) NULL,
	GroupIDKEY varchar(255) NULL,
  PRIMARY KEY (`TxnLineID`),
  CONSTRAINT `fk_invoiceline_invoice1`
    FOREIGN KEY (`invoice_TxnID`)
    REFERENCES `srijrcscarrillo`.`invoice` (`TxnID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
