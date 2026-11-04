CREATE DATABASE  IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cinema
-- ------------------------------------------------------
-- Server version	9.7.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'bfe46706-8603-11f1-a737-d0c1b57f6121:1-153';

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `data_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ana Silva','12345678901','2000-05-12','2026-10-28 09:13:00'),(2,'Bruno Santos','23456789012','1998-08-20','2026-10-28 09:13:00'),(3,'Carla Oliveira','34567890123','2002-01-15','2026-10-28 09:13:00'),(4,'Diego Costa','45678901234','1995-11-30','2026-10-28 09:13:00'),(5,'Eduarda Lima','56789012345','2001-07-08','2026-10-28 09:13:00');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email` (
  `id_email` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `tipo` enum('particular','comercial') DEFAULT NULL,
  `dominio` varchar(20) DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_email`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1,'ana@gmail.com','particular','gmail.com',1),(2,'bruno@gmail.com','particular','gmail.com',2),(3,'carla@outlook.com','particular','outlook.com',3),(4,'diego@empresa.com','comercial','empresa.com',4),(5,'eduarda@hotmail.com','particular','hotmail.com',5);
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filmes`
--

DROP TABLE IF EXISTS `filmes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filmes` (
  `id_filme` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `classificacao` varchar(10) NOT NULL,
  `duracao` int NOT NULL,
  `data_lancamento` date NOT NULL,
  PRIMARY KEY (`id_filme`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filmes`
--

LOCK TABLES `filmes` WRITE;
/*!40000 ALTER TABLE `filmes` DISABLE KEYS */;
INSERT INTO `filmes` VALUES (1,'Interestelar','Ficção','10 anos',169,'2014-11-06'),(2,'Shrek','Animacao','Livre',90,'2001-06-22'),(3,'Vingadores Ultimato','Ação','12 anos',181,'2019-04-25'),(4,'Procurando Nemo','Animação','Livre',100,'2003-07-04'),(5,'Como eu era antes de você','Romance','12 anos',110,'2016-06-16');
/*!40000 ALTER TABLE `filmes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fone`
--

DROP TABLE IF EXISTS `fone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fone` (
  `id_fone` int NOT NULL AUTO_INCREMENT,
  `ddd` char(3) NOT NULL,
  `numero` char(9) NOT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_fone`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `fone_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fone`
--

LOCK TABLES `fone` WRITE;
/*!40000 ALTER TABLE `fone` DISABLE KEYS */;
INSERT INTO `fone` VALUES (1,'011','912345678',1),(2,'011','923456789',2),(3,'011','934567890',3),(4,'021','945678901',4),(5,'011','956789012',5);
/*!40000 ALTER TABLE `fone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingressos`
--

DROP TABLE IF EXISTS `ingressos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingressos` (
  `id_ingresso` int NOT NULL AUTO_INCREMENT,
  `assento` varchar(10) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_compra` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('vendido','cancelado') NOT NULL,
  `id_sessao` int NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_ingresso`),
  UNIQUE KEY `id_sessao` (`id_sessao`,`assento`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `ingressos_ibfk_1` FOREIGN KEY (`id_sessao`) REFERENCES `sessoes` (`id_sessao`),
  CONSTRAINT `ingressos_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingressos`
--

LOCK TABLES `ingressos` WRITE;
/*!40000 ALTER TABLE `ingressos` DISABLE KEYS */;
INSERT INTO `ingressos` VALUES (1,'H01',20.00,'2026-10-28 10:03:11','vendido',1,1),(2,'J12',20.00,'2026-10-28 10:03:11','vendido',1,2),(3,'B01',25.00,'2026-10-28 10:03:11','vendido',2,3),(4,'C12',30.00,'2026-10-28 10:03:11','vendido',3,4),(5,'D10',22.00,'2026-10-28 10:03:11','cancelado',4,5),(6,'E01',28.00,'2026-10-28 10:03:11','vendido',5,1),(7,'A06',20.00,'2026-10-28 10:03:11','vendido',1,3),(8,'K02',25.00,'2026-10-28 10:03:11','cancelado',2,2);
/*!40000 ALTER TABLE `ingressos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salas`
--

DROP TABLE IF EXISTS `salas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salas` (
  `id_sala` int NOT NULL AUTO_INCREMENT,
  `numero_sala` int NOT NULL,
  `capacidade` int NOT NULL,
  `tipo` enum('2D','3D','IMAX','VIP') NOT NULL,
  PRIMARY KEY (`id_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salas`
--

LOCK TABLES `salas` WRITE;
/*!40000 ALTER TABLE `salas` DISABLE KEYS */;
INSERT INTO `salas` VALUES (1,10,100,'2D'),(2,9,80,'3D'),(3,5,150,'IMAX'),(4,8,60,'VIP'),(5,3,120,'2D');
/*!40000 ALTER TABLE `salas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessoes`
--

DROP TABLE IF EXISTS `sessoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessoes` (
  `id_sessao` int NOT NULL AUTO_INCREMENT,
  `data_hora` datetime NOT NULL,
  `idioma` enum('Dublado','Legendado','Original') NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `id_filme` int NOT NULL,
  `id_sala` int NOT NULL,
  PRIMARY KEY (`id_sessao`),
  KEY `id_filme` (`id_filme`),
  KEY `id_sala` (`id_sala`),
  CONSTRAINT `sessoes_ibfk_1` FOREIGN KEY (`id_filme`) REFERENCES `filmes` (`id_filme`),
  CONSTRAINT `sessoes_ibfk_2` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessoes`
--

LOCK TABLES `sessoes` WRITE;
/*!40000 ALTER TABLE `sessoes` DISABLE KEYS */;
INSERT INTO `sessoes` VALUES (1,'2026-10-29 14:00:00','Dublado',20.00,1,1),(2,'2026-10-29 16:00:00','Legendado',25.00,2,2),(3,'2026-10-29 18:00:00','Dublado',30.00,3,3),(4,'2026-10-30 15:00:00','Original',22.00,4,4),(5,'2026-10-30 20:00:00','Legendado',28.00,5,5);
/*!40000 ALTER TABLE `sessoes` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-04  7:53:55
