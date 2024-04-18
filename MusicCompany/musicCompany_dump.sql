-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: music_company
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `release_date` date DEFAULT NULL,
  `album_name` varchar(30) NOT NULL,
  `no_of_play` int DEFAULT NULL,
  `record_label_id` int DEFAULT NULL,
  `song_id` int DEFAULT NULL,
  `singer_id` int DEFAULT NULL,
  `composer_id` int DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `fk` (`record_label_id`),
  KEY `addfk` (`song_id`),
  KEY `fki` (`singer_id`),
  KEY `Fkid` (`composer_id`),
  CONSTRAINT `addfk` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`),
  CONSTRAINT `fk` FOREIGN KEY (`record_label_id`) REFERENCES `record_label` (`record_label_id`),
  CONSTRAINT `fki` FOREIGN KEY (`singer_id`) REFERENCES `singer` (`singer_id`),
  CONSTRAINT `Fkid` FOREIGN KEY (`composer_id`) REFERENCES `composer` (`composer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'2023-01-01','Album 1',100,1004,1,1001,2001),(2,'2023-02-15','Album 2',150,1005,2,1002,2002),(4,'2023-04-10','Album 4',180,1006,4,1004,2004),(5,'2023-05-25','Album 5',220,1007,5,1005,2005),(6,'2023-06-30','Album 6',190,1008,6,1006,2006),(7,'2023-07-15','Album 7',160,1009,7,1007,2007),(8,'2023-08-20','Album 8',130,1010,8,1008,2008),(9,'2023-09-05','Album 9',240,1011,9,1009,2009),(10,'2023-10-10','Album 10',170,1012,10,1010,2010);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composer`
--

DROP TABLE IF EXISTS `composer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composer` (
  `composer_id` int NOT NULL AUTO_INCREMENT,
  `composer_name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `composer_scale` varchar(50) NOT NULL,
  `composer_genre` varchar(50) NOT NULL,
  PRIMARY KEY (`composer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composer`
--

LOCK TABLES `composer` WRITE;
/*!40000 ALTER TABLE `composer` DISABLE KEYS */;
INSERT INTO `composer` VALUES (2001,'Michael Johnson','Male','updated_contact_info','Tenor','Pop'),(2002,'Emily Smith','Female','9876543210','Soprano','Rock'),(2003,'Michael Brown','Male','5551234567','Baritone','Jazz'),(2004,'Sophia Williams','Female','1112223333','Mezzo-soprano','R&B'),(2005,'David Lee','Male','4445556666','Bass','Hip Hop'),(2006,'John Smith','Male','9999999999','Tenor','Classical'),(2007,'Emma Davis','Female','8888888888','Mezzo-soprano','Folk'),(2008,'Andrew Johnson','Male','5555555555','Tenor','Country'),(2009,'Olivia Adams','Female','6666666666','Soprano','Indie'),(2010,'William Taylor','Male','7777777777','Baritone','Electronic');
/*!40000 ALTER TABLE `composer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `composergenreview`
--

DROP TABLE IF EXISTS `composergenreview`;
/*!50001 DROP VIEW IF EXISTS `composergenreview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `composergenreview` AS SELECT 
 1 AS `composer_id`,
 1 AS `composer_name`,
 1 AS `gender`,
 1 AS `contact`,
 1 AS `composer_scale`,
 1 AS `composer_genre`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `composes`
--

DROP TABLE IF EXISTS `composes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composes` (
  `song_id` int DEFAULT NULL,
  `composer_id` int DEFAULT NULL,
  KEY `song_id` (`song_id`),
  KEY `composer_id` (`composer_id`),
  CONSTRAINT `composes_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`),
  CONSTRAINT `composes_ibfk_2` FOREIGN KEY (`composer_id`) REFERENCES `composer` (`composer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composes`
--

LOCK TABLES `composes` WRITE;
/*!40000 ALTER TABLE `composes` DISABLE KEYS */;
INSERT INTO `composes` VALUES (1,2001),(2,2002),(3,2003),(4,2004),(5,2005),(6,2006),(7,2007),(8,2008),(9,2009),(10,2010);
/*!40000 ALTER TABLE `composes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contain`
--

DROP TABLE IF EXISTS `contain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contain` (
  `song_id` int DEFAULT NULL,
  `album_id` int DEFAULT NULL,
  KEY `album_id` (`album_id`),
  KEY `song_id` (`song_id`),
  CONSTRAINT `contain_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  CONSTRAINT `contain_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contain`
--

LOCK TABLES `contain` WRITE;
/*!40000 ALTER TABLE `contain` DISABLE KEYS */;
INSERT INTO `contain` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `contain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has` (
  `record_label_id` int DEFAULT NULL,
  `album_id` int DEFAULT NULL,
  KEY `record_label_id` (`record_label_id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `has_ibfk_1` FOREIGN KEY (`record_label_id`) REFERENCES `record_label` (`record_label_id`),
  CONSTRAINT `has_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has`
--

LOCK TABLES `has` WRITE;
/*!40000 ALTER TABLE `has` DISABLE KEYS */;
INSERT INTO `has` VALUES (1004,1),(1005,2),(1013,3),(1006,4),(1007,5),(1008,6),(1009,7),(1010,8),(1011,9),(1012,10);
/*!40000 ALTER TABLE `has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `popular_songs`
--

DROP TABLE IF EXISTS `popular_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `popular_songs` (
  `song_id` int NOT NULL,
  `is_popular` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`song_id`),
  CONSTRAINT `popular_songs_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popular_songs`
--

LOCK TABLES `popular_songs` WRITE;
/*!40000 ALTER TABLE `popular_songs` DISABLE KEYS */;
/*!40000 ALTER TABLE `popular_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_label`
--

DROP TABLE IF EXISTS `record_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record_label` (
  `record_label_id` int NOT NULL AUTO_INCREMENT,
  `record_label_nane` varchar(30) NOT NULL,
  `no_of_awards` int DEFAULT NULL,
  `no_of_songs` int NOT NULL,
  PRIMARY KEY (`record_label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_label`
--

LOCK TABLES `record_label` WRITE;
/*!40000 ALTER TABLE `record_label` DISABLE KEYS */;
INSERT INTO `record_label` VALUES (1004,'EMI Music',15,301),(1005,'Capitol Records',12,250),(1006,'Republic Records',10,200),(1007,'Atlantic Records',8,180),(1008,'Interscope Records',7,170),(1009,'Columbia Records',6,160),(1010,'Island Records',5,150),(1011,'Def Jam Recordings',4,140),(1012,'RCA Records',3,130),(1013,'Virgin Records',2,120);
/*!40000 ALTER TABLE `record_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `singer`
--

DROP TABLE IF EXISTS `singer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `singer` (
  `singer_id` int NOT NULL AUTO_INCREMENT,
  `singer_name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `singer_scale` varchar(50) NOT NULL,
  `singer_genre` varchar(50) NOT NULL,
  PRIMARY KEY (`singer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `singer`
--

LOCK TABLES `singer` WRITE;
/*!40000 ALTER TABLE `singer` DISABLE KEYS */;
INSERT INTO `singer` VALUES (1001,'John Smith','Male','5555555555','Tenor','Pop'),(1002,'Emily Johnson','Female','9876543210','Soprano','Rock'),(1003,'Michael Brown','Male','5551234567','Baritone','Jazz'),(1004,'Sophia Williams','Female','1112223333','Mezzo-soprano','R&B'),(1005,'David Lee','Male','4445556666','Bass','Hip Hop'),(1006,'Jennifer White','Female','9998887777','Soprano','Classical'),(1007,'Robert Johnson','Male','3339995555','Tenor','Country'),(1008,'Emma Davis','Female','7774443333','Mezzo-soprano','Folk'),(1009,'Matthew Wilson','Male','6662228888','Baritone','Blues'),(1010,'Olivia Martinez','Female','2227778888','Soprano','Indie'),(1011,'Rachel Green','Female','1234567890','Soprano','Pop');
/*!40000 ALTER TABLE `singer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_play_history`
--

DROP TABLE IF EXISTS `song_play_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_play_history` (
  `play_id` int NOT NULL AUTO_INCREMENT,
  `song_id` int DEFAULT NULL,
  `play_date` date DEFAULT NULL,
  PRIMARY KEY (`play_id`),
  KEY `song_id` (`song_id`),
  CONSTRAINT `song_play_history_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_play_history`
--

LOCK TABLES `song_play_history` WRITE;
/*!40000 ALTER TABLE `song_play_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `song_play_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdatePopularSongs` AFTER INSERT ON `song_play_history` FOR EACH ROW BEGIN
    DECLARE song_plays INT;
    DECLARE song_id_val INT;

    
    SELECT NEW.song_id, COUNT(*) INTO song_id_val, song_plays
    FROM song_play_history
    WHERE song_id = NEW.song_id;

    
    IF song_plays >= 200 THEN
        
        UPDATE popular_songs
        SET is_popular = 1
        WHERE song_id = song_id_val;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `songalbumsingerview`
--

DROP TABLE IF EXISTS `songalbumsingerview`;
/*!50001 DROP VIEW IF EXISTS `songalbumsingerview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `songalbumsingerview` AS SELECT 
 1 AS `song_id`,
 1 AS `song_name`,
 1 AS `genre`,
 1 AS `album_name`,
 1 AS `release_date`,
 1 AS `singer_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `song_id` int NOT NULL AUTO_INCREMENT,
  `release_date` date DEFAULT NULL,
  `song_name` varchar(30) NOT NULL,
  `genre` varchar(30) NOT NULL,
  `no_of_plays` int DEFAULT NULL,
  `singer_id` int DEFAULT NULL,
  `album_id` int DEFAULT NULL,
  `composer_id` int DEFAULT NULL,
  PRIMARY KEY (`song_id`),
  KEY `adding_fk` (`singer_id`),
  KEY `add_fk` (`album_id`),
  KEY `addedfk` (`composer_id`),
  CONSTRAINT `add_fk` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  CONSTRAINT `addedfk` FOREIGN KEY (`composer_id`) REFERENCES `composer` (`composer_id`),
  CONSTRAINT `adding_fk` FOREIGN KEY (`singer_id`) REFERENCES `singer` (`singer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (2,'2022-01-02','Song 2','Rock',160,1004,2,2005),(3,'2022-01-03','Song 3','Hip Hop',130,1006,3,2001),(4,'2022-01-04','Song 4','Electronic',90,1003,4,2003),(5,'2022-01-05','Song 5','Jazz',210,1001,5,2001),(6,'2022-01-06','Song 6','Blues',100,1007,6,2006),(7,'2022-01-07','Song 7','Country',120,1008,7,2005),(8,'2022-01-08','Song 8','Classical',140,1002,8,2010),(9,'2022-01-09','Song 9','R&B',180,1010,9,2009),(10,'2022-01-10','Song 10','Reggae',150,1005,10,2008),(11,'2024-04-01','New Song','Classical',60,1001,1,2001);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateSongCount` AFTER INSERT ON `songs` FOR EACH ROW BEGIN
    DECLARE label_id INT;
    DECLARE song_count INT;

    SELECT record_label_id INTO label_id
    FROM album
    WHERE album_id = NEW.album_id;

    SELECT no_of_songs INTO song_count
    FROM record_label
    WHERE record_label_id = label_id;

    SET song_count = song_count + 1;

    UPDATE record_label
    SET no_of_songs = song_count
    WHERE record_label_id = label_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sungs`
--

DROP TABLE IF EXISTS `sungs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sungs` (
  `singer_id` int DEFAULT NULL,
  `song_id` int DEFAULT NULL,
  KEY `singer_id` (`singer_id`),
  KEY `song_id` (`song_id`),
  CONSTRAINT `sungs_ibfk_1` FOREIGN KEY (`singer_id`) REFERENCES `singer` (`singer_id`),
  CONSTRAINT `sungs_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sungs`
--

LOCK TABLES `sungs` WRITE;
/*!40000 ALTER TABLE `sungs` DISABLE KEYS */;
INSERT INTO `sungs` VALUES (1001,1),(1002,2),(1003,3),(1004,4),(1005,5),(1006,6),(1007,7),(1008,8),(1009,9),(1010,10);
/*!40000 ALTER TABLE `sungs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `composergenreview`
--

/*!50001 DROP VIEW IF EXISTS `composergenreview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `composergenreview` AS select `c`.`composer_id` AS `composer_id`,`c`.`composer_name` AS `composer_name`,`c`.`gender` AS `gender`,`c`.`contact` AS `contact`,`c`.`composer_scale` AS `composer_scale`,`c`.`composer_genre` AS `composer_genre` from `composer` `c` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `songalbumsingerview`
--

/*!50001 DROP VIEW IF EXISTS `songalbumsingerview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `songalbumsingerview` AS select `s`.`song_id` AS `song_id`,`s`.`song_name` AS `song_name`,`s`.`genre` AS `genre`,`a`.`album_name` AS `album_name`,`a`.`release_date` AS `release_date`,`si`.`singer_name` AS `singer_name` from ((`songs` `s` join `album` `a` on((`s`.`album_id` = `a`.`album_id`))) join `singer` `si` on((`s`.`singer_id` = `si`.`singer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-18 19:50:18
