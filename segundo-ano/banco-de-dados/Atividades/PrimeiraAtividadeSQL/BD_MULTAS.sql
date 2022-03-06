-- -----------------------------------------------------
-- Schema BD_MULTAS
-- -----------------------------------------------------
#Criando o banco de dados e as suas tabelas, já com as chaves primarias e estrangeiras;
#Seguindo as tabelas apresentadas anteriormente;
USE `BD_MULTAS`  ;
-- -----------------------------------------------------
-- Table `BD_MULTAS`.`TB_VEICULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_MULTAS`.`TB_VEICULO` (
  `IDVeiculo` INT(5) NOT NULL unique,
  `Renavam` INT(10) NOT NULL unique,
  `Cor` varchar(45) NOT NULL,
  `Modelo` varchar(45) NOT NULL,
  `QuantidadeInfracoes` INT(5) NOT NULL, 
  PRIMARY KEY (`IDVeiculo`)
);
-- -----------------------------------------------------
-- Table `BD_MULTAS`.`TB_CONDUTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_MULTAS`.`TB_CONDUTOR` (
  `IDCondutor` INT(5)  NOT NULL unique,
  `NomeCondutor` varchar(45) NOT NULL,
  `Idade` INT(5) NOT NULL,
  `Sexo` char(1) NOT NULL,
  PRIMARY KEY (`IDCondutor`)
  );
-- -----------------------------------------------------
-- Table `BD_MULTAS`.`TB_INFRACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_MULTAS`.`TB_INFRACAO` (
  `IDInfracao` INT(5) NOT NULL,
  `DataInfracao` datetime NOT NULL,
  `Descricao` text(255) NOT NULL,
  `FKIDVeiculo` INT(5) NOT NULL,
  `FKIDCondutor` INT(5) NOT NULL,
  PRIMARY KEY (`IDInfracao`),
  CONSTRAINT `FKTB_VEICULO`
    FOREIGN KEY (`FKIDVeiculo`)
    REFERENCES `TB_VEICULO` (`IDVeiculo`),
  CONSTRAINT `FKTB_CONDUTOR`
    FOREIGN KEY (`FKIDCondutor`)
    REFERENCES `TB_CONDUTOR` (`IDCondutor`)
);


