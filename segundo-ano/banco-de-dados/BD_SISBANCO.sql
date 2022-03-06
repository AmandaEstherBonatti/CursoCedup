-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: sistb_banco
-- ------------------------------------------------------
-- Server version	5.5.42

create database bd_sisbanco;

use bd_sisbanco;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_agencia`
--

DROP TABLE IF EXISTS `tb_agencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_agencia` (
  `idtb_agencia` int(11) NOT NULL AUTO_INCREMENT,
  `nomeagencia` varchar(45) DEFAULT NULL,
  `FK_idtb_banco` int(11) NOT NULL,
  PRIMARY KEY (`idtb_agencia`),
  KEY `fk_tb_agencia_tb_banco_idx` (`FK_idtb_banco`),
  CONSTRAINT `fk_tb_agencia_tb_banco` FOREIGN KEY (`FK_idtb_banco`) REFERENCES `tb_banco` (`idtb_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_agencia`
--

LOCK TABLES `tb_agencia` WRITE;
/*!40000 ALTER TABLE `tb_agencia` DISABLE KEYS */;
INSERT INTO `tb_agencia` VALUES (1,'Centro',1),(2,'Garcia',1),(3,'Escola Agrícola',1),(4,'Centro',2),(5,'Salto',2),(6,'Garcia',2),(7,'Escola Agrícola',2),(8,'Centro',3),(9,'Velha',3);
/*!40000 ALTER TABLE `tb_agencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_banco`
--

DROP TABLE IF EXISTS `tb_banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_banco` (
  `idtb_banco` int(11) NOT NULL AUTO_INCREMENT,
  `nometb_banco` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtb_banco`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_banco`
--

LOCK TABLES `tb_banco` WRITE;
/*!40000 ALTER TABLE `tb_banco` DISABLE KEYS */;
INSERT INTO `tb_banco` VALUES (1,'tb_banco Do Brasil'),(2,'Caixa Econômica'),(3,'Itaú');
/*!40000 ALTER TABLE `tb_banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente` (
  `idtb_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nomecliente` varchar(45) DEFAULT NULL,
  `sobrenomecliente` varchar(45) default null,
  PRIMARY KEY (`idtb_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,'Carlos','Antunes'),(2,'Ceslo','Enoc'),(3,'Elias','Santos'),
	(4,'Brenda','Do Carmo'),(5,'Paulo','Kuster'),(6,'José','Santos'),(7,'Antônio','Nicolodi'),
	(8,'Carla','Dias'),(9,'Maria','Silva'),(10,'Ana','Bernardes');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_conta`
--

DROP TABLE IF EXISTS `tb_conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_conta` (
  `numtb_conta` int(11) NOT NULL,
  `FK_idtb_agencia` int(11) NOT NULL,
  `FK_idtb_cliente` int(11) NOT NULL,
  PRIMARY KEY (`numtb_conta`,`FK_idtb_agencia`),
  KEY `fk_tb_conta_tb_agencia1_idx` (`FK_idtb_agencia`),
  KEY `fk_tb_conta_tb_cliente1_idx` (`FK_idtb_cliente`),
  CONSTRAINT `fk_tb_conta_tb_agencia1` FOREIGN KEY (`FK_idtb_agencia`) REFERENCES `tb_agencia` (`idtb_agencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_conta_tb_cliente1` FOREIGN KEY (`FK_idtb_cliente`) REFERENCES `tb_cliente` (`idtb_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_conta`
--

LOCK TABLES `tb_conta` WRITE;
/*!40000 ALTER TABLE `tb_conta` DISABLE KEYS */;
INSERT INTO `tb_conta` VALUES (111,1,1),(111,4,1),(114,2,2),(115,3,2),(112,1,3),(115,5,3),(112,4,4),(116,5,4),(112,7,5),(113,1,6),(113,2,7),(117,6,8),(120,9,8),(118,6,9),(119,8,10);
/*!40000 ALTER TABLE `tb_conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_operacao`
--

DROP TABLE IF EXISTS `tb_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_operacao` (
  `idtb_operacao` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double DEFAULT NULL,
  `dataop` datetime DEFAULT NULL,
  `FK_numtb_conta` int(11) NOT NULL,
  `FK_idtb_agencia` int(11) NOT NULL,
  `FK_idtb_tipo_operacao` int(11) NOT NULL,
  PRIMARY KEY (`idtb_operacao`),
  KEY `fk_tb_operacao_tb_conta1_idx` (`FK_numtb_conta`,`FK_idtb_agencia`),
  KEY `fk_tb_operacao_tb_tipo_operacao1_idx` (`FK_idtb_tipo_operacao`),
  CONSTRAINT `fk_tb_operacao_tb_conta1` FOREIGN KEY (`FK_numtb_conta`, `FK_idtb_agencia`) REFERENCES `tb_conta` (`numtb_conta`, `FK_idtb_agencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_operacao_tb_tipo_operacao1` FOREIGN KEY (`FK_idtb_tipo_operacao`) REFERENCES `tb_tipo_operacao` (`idtb_tipo_operacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_operacao`
--

LOCK TABLES `tb_operacao` WRITE;
/*!40000 ALTER TABLE `tb_operacao` DISABLE KEYS */;
INSERT INTO `tb_operacao` VALUES (1,300,'2015-10-26 15:31:48',111,1,1),(2,300,'2015-10-26 15:32:10',111,1,1),(3,120,'2015-10-26 15:35:27',111,4,1),(4,500,'2015-10-28 11:11:38',113,2,1),(5,500,'2015-10-28 11:11:39',113,2,1),(6,50,'2015-10-29 11:11:39',111,1,2),(7,100,'2015-10-29 11:11:39',111,1,2),(8,100,'2015-10-29 11:11:39',111,1,1),(9,100,'2015-11-04 11:11:22',111,1,2),(10,100,'2015-11-04 11:12:05',113,2,2),(11,50,'2015-11-04 11:21:54',113,2,2),(12,500,'2015-11-04 13:56:06',113,2,1),(13,300,'2015-11-04 19:17:20',111,4,1);
/*!40000 ALTER TABLE `tb_operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_operacao`
--

DROP TABLE IF EXISTS `tb_tipo_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tipo_operacao` (
  `idtb_tipo_operacao` int(11) NOT NULL AUTO_INCREMENT,
  `nometb_operacao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtb_tipo_operacao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_operacao`
--

LOCK TABLES `tb_tipo_operacao` WRITE;
/*!40000 ALTER TABLE `tb_tipo_operacao` DISABLE KEYS */;
INSERT INTO `tb_tipo_operacao` VALUES (1,'Depósito'),(2,'Saque');
/*!40000 ALTER TABLE `tb_tipo_operacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-08 13:40:05
