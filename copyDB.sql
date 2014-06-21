-- -----------------------------------------------------
-- Schema sricopia  
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sricopia` ;
CREATE SCHEMA IF NOT EXISTS `sricopia` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `sricopia` ;

CREATE TABLE IF NOT EXISTS `sricopia`.`Contribuyente` LIKE `srijrcscarrillo`.`Contribuyente`;

INSERT INTO `sricopia`.`Contribuyente` SELECT * FROM `srijrcscarrillo`.`Contribuyente`;
