CREATE DATABASE  IF NOT EXISTS `testmagang` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testmagang`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: testmagang
-- ------------------------------------------------------
-- Server version	8.0.39

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

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mahasiswa` (
  `NIM` char(6) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Alamat` longtext,
  `Jurusan` varchar(100) NOT NULL,
  `Umur` int NOT NULL,
  PRIMARY KEY (`NIM`),
  UNIQUE KEY `NIM_UNIQUE` (`NIM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES ('123456','John','Jl. Merdeka No. 1','Teknik Informatika',21),('234567','Alice','Jl. Gatot Subroto','Sistem Informasi',23),('345678','Bob','Jl. Sudirman No. 5','Teknik Informatika',20),('456789','Cindy','Jl. Pahlawan No. 2','Manajemen',22),('567890','David','Jl. Diponegoro No. 3','Teknik Elektro',25),('678901','Emily','Jl. Cendrawasih No. 4','Manajemen',24),('789012','Frank','Jl. Ahmad Yani No. 6','Teknik Informatika',19);
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mata_kuliah`
--

DROP TABLE IF EXISTS `mata_kuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mata_kuliah` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Mata_Kuliah` varchar(50) NOT NULL,
  `NIM` char(6) NOT NULL,
  `Nilai` int NOT NULL,
  `Dosen_Pengajar` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `nim_idx` (`NIM`),
  CONSTRAINT `nim` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mata_kuliah`
--

LOCK TABLES `mata_kuliah` WRITE;
/*!40000 ALTER TABLE `mata_kuliah` DISABLE KEYS */;
INSERT INTO `mata_kuliah` VALUES (1,'Pemrograman Web','123456',85,'Pak Budi'),(2,'Basis Data','234567',70,'Ibu Ani'),(3,'Jaringan Komputer','345678',75,'Pak Dodi'),(4,'Sistem Operasi','123456',90,'Pak Budi'),(5,'Manajemen Proyek','456789',80,'Ibu Desi'),(6,'Bahasa Inggris','567890',85,'Ibu Eka'),(7,'Statistika','678901',75,'Pak Farhan'),(8,'Algoritma','789012',65,'Pak Galih'),(9,'Pemrograman Java','123456',95,'Pak Budi');
/*!40000 ALTER TABLE `mata_kuliah` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-12 19:37:03
