-- -----------------------------------------------------
-- Schema BD_MULTAS
-- -----------------------------------------------------
CREATE DATABASE `_______________` ;
USE `_______________`  ;
-- -----------------------------------------------------
-- Table `BD_MULTAS`.`TB_VEICULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_MULTAS`.`______________` (
  `IDVeiculo` ___________  __________ ,
  `Renavam` INT(10) __________  ___________,
  `____________` VARCHAR(45) NOT NULL,
  `Modelo` __________________,
  `QuantidadeInfracoes`  ____________ _________, 
  PRIMARY KEY (`_______________`)
);
-- -----------------------------------------------------
-- Table `BD_MULTAS`.`TB_CONDUTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `________________`.`_______________` (
  `______________` INT(5)  ___________,
  `NomeCondutor` ______________ NOT NULL,
  `____________` INT(5) NOT NULL,
  `Sexo` ______________ NOT NULL,
  PRIMARY KEY (`IDCondutor`)
  );
-- -----------------------------------------------------
-- Table `BD_MULTAS`.`TB_INFRACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `________________`.`TB_INFRACAO` (
  `_____________` INT(5) __________,
  `DataInfracao` ____________ NOT NULL,
  `Descricao` ___________ NOT NULL,
  `___________` INT(5) NOT NULL,
  `FKIDCondutor` INT(5) _____________,
  PRIMARY KEY (`IDInfracao`),
  CONSTRAINT `FKTB_VEICULO`
    FOREIGN KEY (`FKIDVeiculo`)
    REFERENCES `________________` (`______________`),
  CONSTRAINT `FKTB_CONDUTOR`
    FOREIGN KEY (`_____________`)
    REFERENCES `________________` (`IDCondutor`)
);

