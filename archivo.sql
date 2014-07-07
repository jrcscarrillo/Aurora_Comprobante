-- -----------------------------------------------------
-- Schema srijrcscarrillo
-- -----------------------------------------------------
USE `srijrcscarrillo` ;

-- -----------------------------------------------------
-- Table `srijrcscarrillo`.`Archivo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `srijrcscarrillo`.`Archivo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `srijrcscarrillo`.`Archivo` (
	idArchivo INT NOT NULL,
	ArchivoNombre varchar(255) NOT NULL,
	ArchivoGenerado DATE NULL,
	ArchivoDescargado DATE NULL,
	ArchivoProcesado DATE NULL,
	ArchivoStatus varchar(10) NULL,
PRIMARY KEY (`idArchivo`))
ENGINE = InnoDB;