SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema srijrcscarrillo
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `srijrcscarrillo` ;
CREATE SCHEMA IF NOT EXISTS `srijrcscarrillo` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `srijrcscarrillo` ;

-- -----------------------------------------------------
-- Table `srijrcscarrillo`.`invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srijrcscarrillo`.`invoice` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srijrcscarrillo`.`invoice` (
	TxnID varchar(255) NULL,
	TimeCreated varchar(255) NULL,
	TimeModified varchar(255) NULL,
	EditSequence varchar(255) NULL,
	TxnNumber int NULL,
	CustomerRef_ListID varchar(255) NULL,
	CustomerRef_FullName varchar(255) NULL,
	ClassRef_ListID varchar(255) NULL,
	ClassRef_FullName varchar(255) NULL,
	ARAccountRef_ListID varchar(255) NULL,
	ARAccountRef_FullName varchar(255) NULL,
	TemplateRef_ListID varchar(255) NULL,
	TemplateRef_FullName varchar(255) NULL,
	TxnDate datetime NULL,
	RefNumber varchar(255) NULL,
	BillAddress_Addr1 varchar(255) NULL,
	BillAddress_Addr2 varchar(255) NULL,
	BillAddress_Addr3 varchar(255) NULL,
	BillAddress_Addr4 varchar(255) NULL,
	BillAddress_Addr5 varchar(255) NULL,
	BillAddress_City varchar(255) NULL,
	BillAddress_State varchar(255) NULL,
	BillAddress_PostalCode varchar(255) NULL,
	BillAddress_Country varchar(255) NULL,
	BillAddress_Note varchar(255) NULL,
	ShipAddress_Addr1 varchar(255) NULL,
	ShipAddress_Addr2 varchar(255) NULL,
	ShipAddress_Addr3 varchar(255) NULL,
	ShipAddress_Addr4 varchar(255) NULL,
	ShipAddress_Addr5 varchar(255) NULL,
	ShipAddress_City varchar(255) NULL,
	ShipAddress_State varchar(255) NULL,
	ShipAddress_PostalCode varchar(255) NULL,
	ShipAddress_Country varchar(255) NULL,
	ShipAddress_Note varchar(255) NULL,
	IsPending bit NULL,
	IsFinanceCharge bit NULL,
	PONumber varchar(255) NULL,
	TermsRef_ListID varchar(255) NULL,
	TermsRef_FullName varchar(255) NULL,
	DueDate datetime NULL,
	SalesRepRef_ListID varchar(255) NULL,
	SalesRepRef_FullName varchar(255) NULL,
	FOB varchar(255) NULL,
	ShipDate datetime NULL,
	ShipMethodRef_ListID varchar(255) NULL,
	ShipMethodRef_FullName varchar(255) NULL,
	Subtotal float NULL,
	ItemSalesTaxRef_ListID varchar(255) NULL,
	ItemSalesTaxRef_FullName varchar(255) NULL,
	SalesTaxPercentage varchar(255) NULL,
	SalesTaxTotal float NULL,
	AppliedAmount float NULL,
	BalanceRemaining float NULL,
	CurrencyRef_ListID varchar(255) NULL,
	CurrencyRef_FullName varchar(255) NULL,
	ExchangeRate float NULL,
	BalanceRemainingInHomeCurrency float NULL,
	Memo varchar(255) NULL,
	IsPaid bit NULL,
	CustomerMsgRef_ListID varchar(255) NULL,
	CustomerMsgRef_FullName varchar(255) NULL,
	IsToBePrinted bit NULL,
	IsToBeEmailed bit NULL,
	IsTaxIncluded bit NULL,
	CustomerSalesTaxCodeRef_ListID varchar(255) NULL,
	CustomerSalesTaxCodeRef_FullName varchar(255) NULL,
	SuggestedDiscountAmount float NULL,
	SuggestedDiscountDate datetime NULL,
	Other varchar(255) NULL,
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
	Status varchar(10) NULL,
PRIMARY KEY (`TxnID`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srijrcscarrillo`.`Facturas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srijrcscarrillo`.`Facturas` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srijrcscarrillo`.`Facturas` (
  `idFacturas` INT NOT NULL,
  `FacturasAmbiente` VARCHAR(1) NULL,
  `FacturasTipoEmision` VARCHAR(1) NULL,
  `FacturasRazon` VARCHAR(300) NULL,
  `FacturasComercial` VARCHAR(300) NULL,
  `FacturasRuc` INT NULL,
  `FacturasClaveAcceso` VARCHAR(45) NULL,
  `FacturasEstab` VARCHAR(45) NULL,
  `FacturasCodDoc` VARCHAR(2) NULL,
  `FacturasPunto` VARCHAR(3) NULL,
  `FacturasSq` INT NULL,
  `FacturasDirMatriz` VARCHAR(300) NULL,
  `FacturasFechaEmision` DATE NULL,
  `FacturasDirEstab` VARCHAR(300) NULL,
  `FacturasContEsp` VARCHAR(2) NULL,
  `FacturasLlevaContab` VARCHAR(2) NULL,
  `FacturasTipoId` INT NULL,
  `FacturasNroId` INT NULL,
  `FacturasGuia` VARCHAR(45) NULL,
  `FacturasRazonComprador` VARCHAR(300) NULL,
  `FacturasTotalImpto` DECIMAL(11,2) NULL,
  `FacturasPropina` DECIMAL(11,2) NULL,
  `FacturasImporteTotal` DECIMAL(11,2) NULL,
  `FacturasMoneda` VARCHAR(1) NULL,
  `idComprobantes` INT NULL,
  `IDKEY` varchar(255) NULL,
  PRIMARY KEY (`idFacturas`, `IDKEY`),
  CONSTRAINT `fk_Facturas_invoice1`
    FOREIGN KEY (`IDKEY`)
    REFERENCES `srijrcscarrillo`.`invoice` (`TxnID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Facturas_invoice1_idx` ON `srijrcscarrillo`.`Facturas` (`IDKEY` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srijrcscarrillo`.`Comprobantes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srijrcscarrillo`.`Comprobantes` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srijrcscarrillo`.`Comprobantes` (
  `idComprobantes` INT NOT NULL,
  `ComprobantesNumero` INT NULL,
  `ComprobantesRazon` VARCHAR(300) NULL,
  `ComprobantesID` INT NULL,
  `ComprobantesFechaEmision` DATE NULL,
  `ComprobantesGuia` INT NULL COMMENT 'ComprobantesGuia Solo se utiliza en las facturas',
  `ComprobantesFacturaModificaTipo` INT NULL,
  `ComprobantesFacturaModificaNumero` INT NULL,
  `ComprobantesFacRetModificaTipo` INT NULL,
  `ComprobantesFacRetModificaNumero` INT NULL,
  `ComprobantesEjercicio` INT NULL,
  `ComprobantesCodigo` INT NULL,
  `ComprobantesVerificador` INT NULL,
  `Facturas_idFacturas` INT NOT NULL,
  PRIMARY KEY (`idComprobantes`),
  CONSTRAINT `fk_Comprobantes_Facturas1`
    FOREIGN KEY (`Facturas_idFacturas`)
    REFERENCES `srijrcscarrillo`.`Facturas` (`idFacturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Comprobantes_Facturas1_idx` ON `srijrcscarrillo`.`Comprobantes` (`Facturas_idFacturas` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srijrcscarrillo`.`Solicitados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srijrcscarrillo`.`Solicitados` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srijrcscarrillo`.`Solicitados` (
  `idSolicitados` INT NULL,
  `SolicitadosFechaEmision` DATE NULL,
  `SolicitadosRUC` INT NULL,
  `SolicitadosAmbiente` INT NULL,
  `SolicitadosSerie` INT NULL,
  `SolicitadosNumeroComprobante` INT ZEROFILL NULL,
  `SolicitadosCodigoDelSRI` INT NULL,
  `SolicitadosEmision` INT NULL,
  `SolicitadosAutoVerificador` INT NULL COMMENT 'Esta es la tabla de todos los comprobantes que ya tienen asignados un codigo numerico asignado por el SRI, mas el digito autoverificador, calculado en modulo 11.',
  `Comprobantes_idComprobantes` INT NOT NULL,
  PRIMARY KEY (`idSolicitados`, `Comprobantes_idComprobantes`),
  CONSTRAINT `fk_Solicitados_Comprobantes1`
    FOREIGN KEY (`Comprobantes_idComprobantes`)
    REFERENCES `srijrcscarrillo`.`Comprobantes` (`idComprobantes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Solicitados_Comprobantes1_idx` ON `srijrcscarrillo`.`Solicitados` (`Comprobantes_idComprobantes` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srijrcscarrillo`.`Autorizados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srijrcscarrillo`.`Autorizados` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srijrcscarrillo`.`Autorizados` (
  `idAutorizados` INT NOT NULL AUTO_INCREMENT,
  `AutorizadosFechaHora` DATETIME NULL,
  `AutorizadosRUC` INT NULL,
  `AutorizadosCodigo` INT NULL,
  `AutorizadosAdvertencia` VARCHAR(300) NULL,
  `Comprobantes_idComprobantes` INT NOT NULL,
  PRIMARY KEY (`idAutorizados`, `Comprobantes_idComprobantes`),
  CONSTRAINT `fk_Autorizados_Comprobantes1`
    FOREIGN KEY (`Comprobantes_idComprobantes`)
    REFERENCES `srijrcscarrillo`.`Comprobantes` (`idComprobantes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Autorizados_Comprobantes1_idx` ON `srijrcscarrillo`.`Autorizados` (`Comprobantes_idComprobantes` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srijrcscarrillo`.`ComprobantesHistoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srijrcscarrillo`.`ComprobantesHistoria` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srijrcscarrillo`.`ComprobantesHistoria` (
  `idHistoria` INT NOT NULL AUTO_INCREMENT,
  `HistoriaEstado` VARCHAR(45) NULL,
  `HistoriaMensaje` VARCHAR(45) NULL COMMENT 'En esta tabla se guardara la historia del estado de los comprobantes, se podra acceder a todas las instancias del comprobante',
  `HistoriaFechaEvento` DATE NULL,
  `Comprobantes_idComprobantes` INT NOT NULL,
  PRIMARY KEY (`idHistoria`, `Comprobantes_idComprobantes`),
  CONSTRAINT `fk_ComprobantesHistoria_Comprobantes1`
    FOREIGN KEY (`Comprobantes_idComprobantes`)
    REFERENCES `srijrcscarrillo`.`Comprobantes` (`idComprobantes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_ComprobantesHistoria_Comprobantes1_idx` ON `srijrcscarrillo`.`ComprobantesHistoria` (`Comprobantes_idComprobantes` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srijrcscarrillo`.`Contribuyente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srijrcscarrillo`.`Contribuyente` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srijrcscarrillo`.`Contribuyente` (
  `idContribuyente` INT NOT NULL AUTO_INCREMENT,
  `ContribuyenteRUC` BIGINT(13) NULL,
  `ContribuyenteRazon` VARCHAR(300) NULL,
  `ContribuyenteNombreComercial` VARCHAR(300) NULL,
  `ContribuyenteDirMatriz` VARCHAR(300) NULL,
  `ContribuyenteDirEmisor` VARCHAR(300) NULL,
  `ContribuyenteCodEmisor` INT(3) UNSIGNED ZEROFILL NULL,
  `ContribuyentePunto` INT(3) UNSIGNED ZEROFILL NULL,
  `ContribuyenteResolucion` INT(5) NULL,
  `ContribuyenteLlevaContabilidad` VARCHAR(2) NULL,
  `ContribuyenteLogo` LONGBLOB NULL,
  `ContribuyenteAmbiente` INT(1) NULL,
  `ContribuyenteEmision` INT(1) NULL,
  PRIMARY KEY (`idContribuyente`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `id_estab_emision` ON `srijrcscarrillo`.`Contribuyente` (`ContribuyenteCodEmisor` ASC, `ContribuyentePunto` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srijrcscarrillo`.`Guias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srijrcscarrillo`.`Guias` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srijrcscarrillo`.`Guias` (
  `idGuias` INT NOT NULL,
  `GuiasNumero` INT NULL,
  `GuiasRazon` VARCHAR(300) NULL,
  `GuiasID` INT NULL,
  `GuiasPartida` VARCHAR(300) NULL,
  `GuiasDestino` VARCHAR(300) NULL COMMENT 'Esta es la direccion del punto de destino',
  `GuiasRazonTransportista` VARCHAR(300) NULL,
  `GuiasTrasnportistaID` INT NULL,
  `GuiasPlaca` VARCHAR(20) NULL,
  `GuiasMercaderia` VARCHAR(300) NULL,
  `GuiasCantidad` DECIMAL(13,2) NULL,
  `GuiasMotivo` VARCHAR(300) NULL,
  `GuiasFactura` INT NULL COMMENT 'Con este campo se establece la relacion con la factura que se esta utilizando para esta guia de remision',
  `GuiasDeclaracion` INT NULL,
  `GuiasInicioTransporte` DATE NULL,
  `GuiasFinTransporte` DATE NULL,
  `GuiasRuta` VARCHAR(300) NULL,
  `GuiasEstablecimientoDestino` INT NULL,
  `GuiasCodigo` INT NULL,
  `GuiasVerificador` INT NULL,
  PRIMARY KEY (`idGuias`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srijrcscarrillo`.`Impuestos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srijrcscarrillo`.`Impuestos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srijrcscarrillo`.`Impuestos` (
  `idImpuestos` INT NOT NULL,
  `ImpuestosTipoDoc` VARCHAR(2) NULL,
  `ImpuestosNumeroDoc` INT NULL,
  `ImpuestosCodigo` INT NULL,
  `ImpuestosPorcentaje` INT NULL,
  `ImpuestosTarifa` INT NULL,
  `ImpuestosBaseImponible` DECIMAL(11,2) NULL,
  `ImpuestosValor` DECIMAL(11,2) NULL,
  `ImpuestosIdFacturas` INT NULL,
  `Facturas_idFacturas` INT NOT NULL,
  PRIMARY KEY (`idImpuestos`, `Facturas_idFacturas`),
  CONSTRAINT `fk_Impuestos_Facturas`
    FOREIGN KEY (`Facturas_idFacturas`)
    REFERENCES `srijrcscarrillo`.`Facturas` (`idFacturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Impuestos_Facturas_idx` ON `srijrcscarrillo`.`Impuestos` (`Facturas_idFacturas` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srijrcscarrillo`.`FacturaDetalle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srijrcscarrillo`.`FacturaDetalle` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srijrcscarrillo`.`FacturaDetalle` (
  `idFacturaDetalle` INT NOT NULL,
  `FacturaDetalleCodigo` VARCHAR(45) NULL,
  `FacturaDetalleAuxiliar` VARCHAR(45) NULL,
  `FacturaDetalleDescripcion` VARCHAR(300) NULL,
  `FacturaDetallePrecioUnitario` DECIMAL(11,2) NULL,
  `FacturaDetalleCantidad` DECIMAL(11,2) NULL,
  `FacturaDetallePrecioTotal` DECIMAL(11,2) NULL,
  `FacturaDetalleDescuento` DECIMAL(11,2) NULL,
  `FacturaDetalleCodImpto` INT NULL,
  `FacturaDetallePorcentaje` INT NULL,
  `FacturaDetalleBaseImponible` DECIMAL(11,2) NULL,
  `FacturaDetalleValor` DECIMAL(11,2) NULL,
  `FacturaDetalleTarifa` INT NULL,
  `FacturaDetalleIdFactura` INT NULL,
  `Facturas_idFacturas` INT NOT NULL,
  PRIMARY KEY (`idFacturaDetalle`, `Facturas_idFacturas`),
  CONSTRAINT `fk_FacturaDetalle_Facturas1`
    FOREIGN KEY (`Facturas_idFacturas`)
    REFERENCES `srijrcscarrillo`.`Facturas` (`idFacturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_FacturaDetalle_Facturas1_idx` ON `srijrcscarrillo`.`FacturaDetalle` (`Facturas_idFacturas` ASC);

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
    FOREIGN KEY (`IDKEY`)
    REFERENCES `srijrcscarrillo`.`invoice` (`TxnID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;