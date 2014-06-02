SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema srifirmas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `srifirmas` ;
CREATE SCHEMA IF NOT EXISTS `srifirmas` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `srifirmas` ;

-- -----------------------------------------------------
-- Table `srifirmas`.`invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srifirmas`.`invoice` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srifirmas`.`invoice` (
  `TxnID` INT NOT NULL,
  PRIMARY KEY (`TxnID`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srifirmas`.`Facturas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srifirmas`.`Facturas` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srifirmas`.`Facturas` (
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
  `invoice_TxnID` INT NOT NULL,
  PRIMARY KEY (`idFacturas`, `invoice_TxnID`),
  CONSTRAINT `fk_Facturas_invoice1`
    FOREIGN KEY (`invoice_TxnID`)
    REFERENCES `srifirmas`.`invoice` (`TxnID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Facturas_invoice1_idx` ON `srifirmas`.`Facturas` (`invoice_TxnID` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srifirmas`.`Comprobantes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srifirmas`.`Comprobantes` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srifirmas`.`Comprobantes` (
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
    REFERENCES `srifirmas`.`Facturas` (`idFacturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Comprobantes_Facturas1_idx` ON `srifirmas`.`Comprobantes` (`Facturas_idFacturas` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srifirmas`.`Solicitados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srifirmas`.`Solicitados` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srifirmas`.`Solicitados` (
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
    REFERENCES `srifirmas`.`Comprobantes` (`idComprobantes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Solicitados_Comprobantes1_idx` ON `srifirmas`.`Solicitados` (`Comprobantes_idComprobantes` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srifirmas`.`Autorizados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srifirmas`.`Autorizados` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srifirmas`.`Autorizados` (
  `idAutorizados` INT NOT NULL AUTO_INCREMENT,
  `AutorizadosFechaHora` DATETIME NULL,
  `AutorizadosRUC` INT NULL,
  `AutorizadosCodigo` INT NULL,
  `AutorizadosAdvertencia` VARCHAR(300) NULL,
  `Comprobantes_idComprobantes` INT NOT NULL,
  PRIMARY KEY (`idAutorizados`, `Comprobantes_idComprobantes`),
  CONSTRAINT `fk_Autorizados_Comprobantes1`
    FOREIGN KEY (`Comprobantes_idComprobantes`)
    REFERENCES `srifirmas`.`Comprobantes` (`idComprobantes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Autorizados_Comprobantes1_idx` ON `srifirmas`.`Autorizados` (`Comprobantes_idComprobantes` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srifirmas`.`ComprobantesHistoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srifirmas`.`ComprobantesHistoria` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srifirmas`.`ComprobantesHistoria` (
  `idHistoria` INT NOT NULL AUTO_INCREMENT,
  `HistoriaEstado` VARCHAR(45) NULL,
  `HistoriaMensaje` VARCHAR(45) NULL COMMENT 'En esta tabla se guardara la historia del estado de los comprobantes, se podra acceder a todas las instancias del comprobante',
  `HistoriaFechaEvento` DATE NULL,
  `Comprobantes_idComprobantes` INT NOT NULL,
  PRIMARY KEY (`idHistoria`, `Comprobantes_idComprobantes`),
  CONSTRAINT `fk_ComprobantesHistoria_Comprobantes1`
    FOREIGN KEY (`Comprobantes_idComprobantes`)
    REFERENCES `srifirmas`.`Comprobantes` (`idComprobantes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_ComprobantesHistoria_Comprobantes1_idx` ON `srifirmas`.`ComprobantesHistoria` (`Comprobantes_idComprobantes` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srifirmas`.`Contribuyente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srifirmas`.`Contribuyente` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srifirmas`.`Contribuyente` (
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
CREATE INDEX `id_estab_emision` ON `srifirmas`.`Contribuyente` (`ContribuyenteCodEmisor` ASC, `ContribuyentePunto` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srifirmas`.`Guias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srifirmas`.`Guias` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srifirmas`.`Guias` (
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
-- Table `srifirmas`.`Impuestos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srifirmas`.`Impuestos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srifirmas`.`Impuestos` (
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
    REFERENCES `srifirmas`.`Facturas` (`idFacturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Impuestos_Facturas_idx` ON `srifirmas`.`Impuestos` (`Facturas_idFacturas` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srifirmas`.`FacturaDetalle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srifirmas`.`FacturaDetalle` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srifirmas`.`FacturaDetalle` (
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
    REFERENCES `srifirmas`.`Facturas` (`idFacturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_FacturaDetalle_Facturas1_idx` ON `srifirmas`.`FacturaDetalle` (`Facturas_idFacturas` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `srifirmas`.`invoiceline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srifirmas`.`invoiceline` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srifirmas`.`invoiceline` (
  `TxnLineID` INT NOT NULL,
  `invoice_TxnID` INT NOT NULL,
  PRIMARY KEY (`TxnLineID`),
  CONSTRAINT `fk_invoiceline_invoice1`
    FOREIGN KEY (`invoice_TxnID`)
    REFERENCES `srifirmas`.`invoice` (`TxnID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_invoiceline_invoice1_idx` ON `srifirmas`.`invoiceline` (`invoice_TxnID` ASC);


SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;