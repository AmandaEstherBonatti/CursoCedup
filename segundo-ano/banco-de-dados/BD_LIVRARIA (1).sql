CREATE DATABASE  IF NOT EXISTS `BD_LIVRARIA` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `BD_LIVRARIA`;
-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: BD_LIVRARIA
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `TB_ASSUNTO`
--

DROP TABLE IF EXISTS `TB_ASSUNTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TB_ASSUNTO` (
  `SiglaAssunto` char(1) NOT NULL,
  `NomeAssunto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SiglaAssunto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_ASSUNTO`
--

LOCK TABLES `TB_ASSUNTO` WRITE;
/*!40000 ALTER TABLE `TB_ASSUNTO` DISABLE KEYS */;
INSERT INTO `TB_ASSUNTO` VALUES ('B','BANCO DE DADOS'),('P','PROGRAMAÇÃO'),('R','REDES DE COMPUTADORES'),('S','SISTEMAS OPERACIONAIS');
/*!40000 ALTER TABLE `TB_ASSUNTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_AUTOR`
--

DROP TABLE IF EXISTS `TB_AUTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TB_AUTOR` (
  `Matricula` int(11) NOT NULL,
  `NomeAutor` varchar(45) DEFAULT NULL,
  `SobrenomeAutor` varchar(45) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  PRIMARY KEY (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_AUTOR`
--

LOCK TABLES `TB_AUTOR` WRITE;
/*!40000 ALTER TABLE `TB_AUTOR` DISABLE KEYS */;
INSERT INTO `TB_AUTOR` VALUES (1,'MARCELO','MEDEIROS','M','1988-10-01'),(2,'ANA PAULA','BERLIM','F','1996-05-15'),(3,'LUCAS','SILVA','M','1990-11-25'),(4,'CAROLINE','SILVA','F','1995-03-25'),(5,'DJALMA','MEDEIROS','M','1980-02-11'),(6,'ARTHUR','PAES','M','1987-02-11'),(7,'EDUARDA','MEDINA','F','1990-05-14');
/*!40000 ALTER TABLE `TB_AUTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_EDITORA`
--

DROP TABLE IF EXISTS `TB_EDITORA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TB_EDITORA` (
  `CodigoEditora` int(11) NOT NULL,
  `NomeEditora` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CodigoEditora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_EDITORA`
--

LOCK TABLES `TB_EDITORA` WRITE;
/*!40000 ALTER TABLE `TB_EDITORA` DISABLE KEYS */;
INSERT INTO `TB_EDITORA` VALUES (1,'MIRANDELA EDITORA'),(2,'EDITORA VIA NORTE'),(3,'EDITORA ILHAS TIJUCAS'),(4,'MARIA JOSÉ EDITORA');
/*!40000 ALTER TABLE `TB_EDITORA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_LIVRO`
--

DROP TABLE IF EXISTS `TB_LIVRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TB_LIVRO` (
  `CodigoLivro` int(11) NOT NULL,
  `Titulo` varchar(45) DEFAULT NULL,
  `Preco` double(10,2) DEFAULT NULL,
  `Lancamento` date DEFAULT NULL,
  `FKSiglaAssunto` char(1) NOT NULL,
  `FKCodigoEditora` int(11) NOT NULL,
  PRIMARY KEY (`CodigoLivro`),
  KEY `FKTB_ASSUNTO_idx` (`FKSiglaAssunto`),
  KEY `FKTB_EDITORA1_idx` (`FKCodigoEditora`),
  CONSTRAINT `FKTB_ASSUNTO` FOREIGN KEY (`FKSiglaAssunto`) REFERENCES `TB_ASSUNTO` (`SiglaAssunto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKTB_EDITORA1` FOREIGN KEY (`FKCodigoEditora`) REFERENCES `TB_EDITORA` (`CodigoEditora`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LIVRO`
--

LOCK TABLES `TB_LIVRO` WRITE;
/*!40000 ALTER TABLE `TB_LIVRO` DISABLE KEYS */;
INSERT INTO `TB_LIVRO` VALUES (1,'BANCO DE DADOS PARA WEB',31.20,'1999-01-10','B',1),(2,'PROGRAMANDO NA LINGUAGEM C',30.00,'1997-10-01','P',1),(3,'PROGRAMANDO NA LINGUAGEM C++',111.50,'1998-11-01','P',3),(4,'BANCO DE DADOS NA BIOINFORMÁTICA',48.00,'1998-11-01','B',2),(5,'REDES DE COMPUTADORES',42.00,'1996-09-01','R',2);
/*!40000 ALTER TABLE `TB_LIVRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_LIVRO_AUTOR`
--

DROP TABLE IF EXISTS `TB_LIVRO_AUTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TB_LIVRO_AUTOR` (
  `FKCodigoLivro` int(11) NOT NULL,
  `FKMatricula` int(11) NOT NULL,
  PRIMARY KEY (`FKCodigoLivro`,`FKMatricula`),
  KEY `FKTB_AUTOR1_idx` (`FKMatricula`),
  KEY `FKTB_LIVRO1_idx` (`FKCodigoLivro`),
  CONSTRAINT `FKTB_AUTOR1` FOREIGN KEY (`FKMatricula`) REFERENCES `TB_AUTOR` (`Matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKTB_LIVRO1` FOREIGN KEY (`FKCodigoLivro`) REFERENCES `TB_LIVRO` (`CodigoLivro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LIVRO_AUTOR`
--

LOCK TABLES `TB_LIVRO_AUTOR` WRITE;
/*!40000 ALTER TABLE `TB_LIVRO_AUTOR` DISABLE KEYS */;
INSERT INTO `TB_LIVRO_AUTOR` VALUES (1,1),(2,1),(3,1),(5,1),(2,2),(1,3),(4,3),(3,4),(3,5),(4,6),(1,7),(5,7);
/*!40000 ALTER TABLE `TB_LIVRO_AUTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'BD_LIVRARIA'
--

--
-- Dumping routines for database 'BD_LIVRARIA'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-23 18:08:40
