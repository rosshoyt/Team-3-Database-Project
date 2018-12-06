CREATE DATABASE  IF NOT EXISTS `basketballleagueproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `basketballleagueproject`;
-- MySQL dump 10.13  Distrib 8.0.13, for Linux (x86_64)
--
-- Host: localhost    Database: sportsleagueproject
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `FACILITY`
--

DROP TABLE IF EXISTS `FACILITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `FACILITY` (
  `idFACILITY` int(11) NOT NULL,
  `facilityName` varchar(100) DEFAULT NULL,
  `addressLine1` varchar(45) DEFAULT NULL,
  `addressLine2` varchar(45) DEFAULT NULL,
  `addressLine3` varchar(45) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `postalCode` varchar(5) DEFAULT NULL,
  `numCourts` int(11) NOT NULL COMMENT 'Number of basketball courts that thisfacility has. ',
  PRIMARY KEY (`idFACILITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACILITY`
--

LOCK TABLES `FACILITY` WRITE;
/*!40000 ALTER TABLE `FACILITY` DISABLE KEYS */;
INSERT INTO `FACILITY` VALUES (1,'Seattle Sporting Center','305 Harrison Ave','Seattle',NULL,'WA','98105',4);
/*!40000 ALTER TABLE `FACILITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GAME`
--

DROP TABLE IF EXISTS `GAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `GAME` (
  `idGAME` int(11) NOT NULL,
  `season` int(11) NOT NULL,
  `facility` int(11) NOT NULL,
  `matchdateTimeStart` datetime NOT NULL COMMENT 'The date and time that the match will take place. ',
  `matchDateTimeEnd` datetime NOT NULL,
  PRIMARY KEY (`idGAME`),
  KEY `fk_league_idx` (`season`),
  KEY `fk_location_idx` (`facility`),
  CONSTRAINT `fk_league` FOREIGN KEY (`season`) REFERENCES `SEASON` (`idseason`),
  CONSTRAINT `fk_location` FOREIGN KEY (`facility`) REFERENCES `FACILITY` (`idfacility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Schedule of regular season games to precede playoff games. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GAME`
--

LOCK TABLES `GAME` WRITE;
/*!40000 ALTER TABLE `GAME` DISABLE KEYS */;
INSERT INTO `GAME` VALUES (1,1,1,'2018-11-21 19:00:00','2018-11-21 21:30:00'),(2,1,1,'2018-11-21 19:00:00','2018-11-21 21:30:00'),(3,1,1,'2018-11-21 19:00:00','2018-11-21 21:30:00'),(4,1,1,'2018-11-28 19:00:00','2018-11-28 21:30:00'),(5,1,1,'2018-11-28 19:00:00','2018-11-28 21:30:00'),(6,1,1,'2018-11-28 19:00:00','2018-11-28 21:30:00'),(7,1,1,'2018-12-05 19:00:00','2018-12-05 21:30:00'),(8,1,1,'2018-12-05 19:00:00','2018-12-05 21:30:00'),(9,1,1,'2018-12-05 19:00:00','2018-12-05 21:30:00'),(10,1,1,'2018-12-12 19:00:00','2018-12-12 21:30:00'),(11,1,1,'2018-12-12 19:00:00','2018-12-12 21:30:00'),(12,1,1,'2018-12-12 19:00:00','2018-12-12 21:30:00'),(13,1,1,'2018-12-19 19:00:00','2018-12-19 21:30:00'),(14,1,1,'2018-12-19 19:00:00','2018-12-19 21:30:00'),(15,1,1,'2018-12-19 19:00:00','2018-12-19 21:30:00'),(16,4,1,'2019-01-02 19:00:00','2019-01-02 21:30:00'),(17,4,1,'2019-01-02 19:00:00','2019-01-02 21:30:00'),(18,4,1,'2019-01-02 19:00:00','2019-01-02 21:30:00'),(19,4,1,'2019-01-09 19:00:00','2019-01-09 21:30:00'),(20,4,1,'2019-01-09 19:00:00','2019-01-09 21:30:00'),(21,4,1,'2019-01-09 19:00:00','2019-01-09 21:30:00'),(22,4,1,'2019-01-16 19:00:00','2019-01-16 21:30:00'),(23,4,1,'2019-01-16 19:00:00','2019-01-16 21:30:00'),(24,4,1,'2019-01-16 19:00:00','2019-01-16 21:30:00'),(25,4,1,'2019-01-23 19:00:00','2019-01-23 21:30:00'),(26,4,1,'2019-01-23 19:00:00','2019-01-23 21:30:00'),(27,4,1,'2019-01-23 19:00:00','2019-01-23 21:30:00'),(28,4,1,'2019-01-30 19:00:00','2019-01-30 21:30:00'),(29,4,1,'2019-01-30 19:00:00','2019-01-30 21:30:00'),(30,4,1,'2019-01-30 19:00:00','2019-01-30 21:30:00');
/*!40000 ALTER TABLE `GAME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GAME_TEAM`
--

DROP TABLE IF EXISTS `GAME_TEAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `GAME_TEAM` (
  `idMATCH_TEAM` int(11) NOT NULL,
  `match` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `score` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMATCH_TEAM`),
  KEY `fk_MATCH_TEAM_1_idx` (`match`),
  KEY `fk_MATCH_TEAM_2_idx` (`team`),
  CONSTRAINT `fk_MATCH_TEAM_1` FOREIGN KEY (`match`) REFERENCES `GAME` (`idgame`),
  CONSTRAINT `fk_MATCH_TEAM_2` FOREIGN KEY (`team`) REFERENCES `TEAM` (`idteam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GAME_TEAM`
--

LOCK TABLES `GAME_TEAM` WRITE;
/*!40000 ALTER TABLE `GAME_TEAM` DISABLE KEYS */;
INSERT INTO `GAME_TEAM` VALUES (1,1,1,'110'),(2,1,6,'87'),(3,2,2,'93'),(4,2,5,'98'),(5,3,3,'123'),(6,3,4,'111'),(7,4,1,'78'),(8,4,5,'110'),(9,5,6,'102'),(10,5,4,'99'),(11,6,2,'96'),(12,6,3,'97'),(13,7,1,'75'),(14,7,4,'78'),(15,8,5,'87'),(16,8,3,'102'),(17,9,6,'63'),(18,9,2,'126'),(19,10,1,'82'),(20,10,3,'88'),(21,11,4,'88'),(22,11,2,'70'),(23,12,5,'120'),(24,12,6,'90'),(25,13,1,'115'),(26,13,2,'107'),(27,14,3,'92'),(28,14,6,'97'),(29,15,4,'97'),(30,15,5,'102'),(31,16,1,NULL),(32,16,8,NULL),(33,17,2,NULL),(34,17,7,NULL),(35,18,3,NULL),(36,18,4,NULL),(37,19,1,NULL),(38,19,7,NULL),(39,20,8,NULL),(40,20,4,NULL),(41,21,2,NULL),(42,21,3,NULL),(43,22,1,NULL),(44,22,4,NULL),(45,23,7,NULL),(46,23,3,NULL),(47,24,8,NULL),(48,24,2,NULL),(49,25,1,NULL),(50,25,3,NULL),(51,26,4,NULL),(52,26,2,NULL),(53,27,7,NULL),(54,27,8,NULL),(55,28,1,NULL),(56,28,2,NULL),(57,29,3,NULL),(58,29,8,NULL),(59,30,4,NULL),(60,30,7,NULL);
/*!40000 ALTER TABLE `GAME_TEAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYER`
--

DROP TABLE IF EXISTS `PLAYER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PLAYER` (
  `idPLAYER` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `middleInitial` varchar(45) DEFAULT NULL,
  `dateOfBirth` date NOT NULL,
  `sex` varchar(1) NOT NULL,
  `email` varchar(90) NOT NULL,
  `areaCode` varchar(3) DEFAULT NULL,
  `phoneNumber` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`idPLAYER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER`
--

LOCK TABLES `PLAYER` WRITE;
/*!40000 ALTER TABLE `PLAYER` DISABLE KEYS */;
INSERT INTO `PLAYER` VALUES (1,' Javier',' Rodriguez','','1985-06-22','M',' javrod@gmail.com','',NULL),(2,' David',' George',' H','1990-03-12','M',' davidg@hotmail.com',' ',NULL),(3,' Eric',' Dubbury',' B','1992-12-21','M',' edubbury@gmail.com','',NULL),(4,' Abraham',' Lincoln','','1970-04-12','M',' abelinc@yahoo.com','',NULL),(5,' Teddy',' Roosevelt','','1990-01-23','M',' teddyR@gmail.com','',NULL),(6,' Claude',' Gordon','','1972-10-13','M',' clodgordon@gmail.com','',NULL),(7,' Davis',' Adams','','1992-10-10','M',' davisadams12@gmail.com','',NULL),(8,' Fred',' Kuczmarski','','1958-07-14','M',' fredkyahoo.com',' ',NULL),(9,' William',' Sherman',' T','1988-01-15','M',' willyTShe@gmail.com',' ',NULL),(10,' Ulysses',' Grant',' S','1977-05-27','M',' USGroxx@gmail.com',' ',NULL),(11,' Bill',' Clinton','','1968-09-05','M',' billyC@yahoo.com','',NULL),(12,' Seth','Macfarlane','','1978-12-29','M',' sethmac@gmail.com','',NULL),(13,' Donald',' Knuth','','1966-03-18','M',' donk@yahoo.com','',NULL),(14,' Alan',' Turing','','1975-08-08','M',' turingmachine1@gmail.com','',NULL),(15,' Bill',' Gates','','1955-11-13','M',' windowsguy@gmail.com','',NULL),(16,' Steve',' Jobs','','1957-04-22','M',' appleguy@gmail.com',' ',NULL),(17,' Ryan',' Gosling','','1982-03-30','M',' imRyanGosling@gmail.com','',NULL),(18,' Tom',' Hanks','','1959-10-08','M',' otmshank@yahoo.com','',NULL),(19,' Ryan',' Secrest',' ','1987-06-19','M',' ','',NULL),(20,' Thomas',' Morse','','1981-08-04','M',' beepboop@yahoo.com','',NULL),(21,' Niel',' Armstrong','','1969-07-09','M',' lunarmodule@nasa.com',' ',NULL),(22,' George',' Patton','','1973-09-28','M',' thegeneral@gmail.com','',NULL),(23,' Michael',' Jordan','','1980-01-01','M',' mj@yahoo.com',' ',NULL),(24,' Lebron',' James','','1985-02-28','M',' lebronjameyjames@gmail.com',' ',NULL),(25,' Eric',' Cartman','','1998-05-12','M',' ericc@gmail.com',' ',NULL),(26,' Melissa',' Nealy','','1994-03-28','F',' mellisaN@yahoo.com',' ',NULL),(27,' Linda',' Anderson','','1969-05-10','F',' lindahanderson@gmail.com',' ',NULL),(28,' Amelia',' Earheart','','1982-04-09','F',' flygirlfly@gmail.com',' ',NULL),(29,' Grace',' Hopper','','1970-10-02','F',' computernerd@gmail.com',' ',NULL),(30,' Emily',' Haines','','1992-07-22','F',' emilyhaines@gmail.com',' ',NULL),(31,' Veronica',' Muller','','1965-10-10','F',' veronicam@yahoo.com','',NULL),(32,' Kerry',' Parker','','1978-12-20','F',' kerryparker@yahoo.com','',NULL),(33,' Sarah',' Ocher','','1981-09-22','F',' saraOcher@gmail.com','',NULL),(34,' Melinda',' Gates','','1980-05-19','F',' melindaG@gmail.com',' ',NULL),(35,' Eleanor',' Roosevelt','','1975-02-15','F',' eroosevelt@gmail.com','',NULL),(36,' Margaret',' Thatcher','','1980-06-06','F',' ironlade@yahoo.com','',NULL),(37,' Natalie',' Portman','','1975-08-08','F',' natalietheactress@gmail.com','',NULL),(38,' Kelly',' Stevens','','1962-03-06','F',' kellys@yahoo.com',' ',NULL),(39,' Rebecca',' Herivel','','1985-12-13','F',' rebeccah@gmail.com','',NULL),(40,' Christine',' James','','1981-07-01','F',' ChristineJ@yahoo.com',' ',NULL);
/*!40000 ALTER TABLE `PLAYER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYER_PERFORMANCE`
--

DROP TABLE IF EXISTS `PLAYER_PERFORMANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PLAYER_PERFORMANCE` (
  `idPLAYER_PERFORMANCE` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `team_match` int(11) NOT NULL,
  `playedInGame` varchar(1) DEFAULT NULL,
  `pts` int(11) DEFAULT NULL,
  `FGM` int(11) DEFAULT NULL,
  `FGA` int(11) DEFAULT NULL,
  `ThreePointersMade` int(11) DEFAULT NULL,
  `FTM` int(11) DEFAULT NULL,
  `FTA` int(11) DEFAULT NULL,
  `OFF_REB` int(11) DEFAULT NULL,
  `DEF_REB` int(11) DEFAULT NULL,
  `AST` int(11) DEFAULT NULL,
  `TOV` int(11) DEFAULT NULL,
  `STL` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPLAYER_PERFORMANCE`),
  KEY `fk_PLAYER_PERFORMANCE_1_idx` (`team_match`),
  KEY `fk_PLAYER_PERFORMANCE_2_idx` (`player`),
  CONSTRAINT `fk_PLAYER_PERFORMANCE_1` FOREIGN KEY (`team_match`) REFERENCES `GAME_TEAM` (`idmatch_team`),
  CONSTRAINT `fk_PLAYER_PERFORMANCE_2` FOREIGN KEY (`player`) REFERENCES `PLAYER` (`idplayer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER_PERFORMANCE`
--

LOCK TABLES `PLAYER_PERFORMANCE` WRITE;
/*!40000 ALTER TABLE `PLAYER_PERFORMANCE` DISABLE KEYS */;
INSERT INTO `PLAYER_PERFORMANCE` VALUES (1,16,1,'Y',30,7,10,5,5,6,1,6,5,3,5),(2,16,7,'Y',35,10,15,5,1,7,8,3,2,2,2),(3,16,13,'Y',28,11,18,3,3,5,4,5,6,3,4),(4,16,19,'Y',36,10,14,6,7,7,2,7,4,3,2),(5,16,25,'Y',40,13,13,6,4,6,2,6,4,2,2);
/*!40000 ALTER TABLE `PLAYER_PERFORMANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYER_TEAM`
--

DROP TABLE IF EXISTS `PLAYER_TEAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PLAYER_TEAM` (
  `idPLAYER_TEAM` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `joinDate` date DEFAULT NULL COMMENT 'Date player joined this team. ',
  PRIMARY KEY (`idPLAYER_TEAM`),
  KEY `fk_player_idx` (`player`),
  KEY `fk_team_idx` (`team`),
  CONSTRAINT `fk_player` FOREIGN KEY (`player`) REFERENCES `PLAYER` (`idplayer`),
  CONSTRAINT `fk_team` FOREIGN KEY (`team`) REFERENCES `TEAM` (`idteam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Linking table between player and team since one player may be on many teams, and each team has many players. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER_TEAM`
--

LOCK TABLES `PLAYER_TEAM` WRITE;
/*!40000 ALTER TABLE `PLAYER_TEAM` DISABLE KEYS */;
INSERT INTO `PLAYER_TEAM` VALUES (1,8,1,NULL),(2,36,1,NULL),(3,16,1,NULL),(4,17,1,NULL),(5,26,1,NULL),(6,1,1,NULL),(7,2,2,NULL),(8,37,2,NULL),(9,14,2,NULL),(10,21,2,NULL),(11,28,2,NULL),(12,3,3,NULL),(13,6,3,NULL),(14,9,3,NULL),(15,22,3,NULL),(16,35,3,NULL),(17,4,4,NULL),(18,20,4,NULL),(19,24,4,NULL),(20,31,4,NULL),(21,32,4,NULL),(22,39,5,NULL),(23,5,5,NULL),(24,10,5,NULL),(25,11,5,NULL),(26,12,5,NULL),(27,40,6,NULL),(28,38,6,NULL),(29,13,6,NULL),(30,30,6,NULL),(31,29,6,NULL),(32,34,6,NULL),(33,33,5,NULL),(34,27,5,NULL),(35,25,4,NULL),(36,23,4,NULL),(37,19,3,NULL),(38,18,3,NULL),(39,15,2,NULL),(40,7,2,NULL),(41,39,7,NULL),(42,5,7,NULL),(43,10,7,NULL),(44,11,7,NULL),(45,12,7,NULL),(46,40,8,NULL),(47,38,8,NULL),(48,34,8,NULL),(49,30,8,NULL),(50,30,8,NULL);
/*!40000 ALTER TABLE `PLAYER_TEAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEASON`
--

DROP TABLE IF EXISTS `SEASON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SEASON` (
  `idSEASON` int(11) NOT NULL,
  `seasonAdministrator` int(11) NOT NULL,
  `seasonType` int(11) NOT NULL,
  `minTeams` int(11) NOT NULL,
  `maxTeams` int(11) NOT NULL,
  `minTeamSize` int(11) NOT NULL,
  `maxTeamSize` int(11) NOT NULL,
  `seasonName` varchar(200) NOT NULL,
  PRIMARY KEY (`idSEASON`),
  KEY `fk_genderCategory_idx` (`seasonType`),
  KEY `fk_seasonAdministrator_idx` (`seasonAdministrator`),
  CONSTRAINT `fk_genderCategory` FOREIGN KEY (`seasonType`) REFERENCES `SEASON_TYPE` (`idseason_type`),
  CONSTRAINT `fk_seasonAdministrator` FOREIGN KEY (`seasonAdministrator`) REFERENCES `STAFF` (`idstaff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEASON`
--

LOCK TABLES `SEASON` WRITE;
/*!40000 ALTER TABLE `SEASON` DISABLE KEYS */;
INSERT INTO `SEASON` VALUES (1,1,4,6,12,5,10,'Late-Fall Open Soft-core'),(2,2,5,6,12,5,10,'Early Winter Men\'s Mid-core'),(3,3,6,6,12,5,10,'Early Winter Women\'s Mid-core'),(4,1,4,6,12,5,10,'Early Winter Open Soft-core ');
/*!40000 ALTER TABLE `SEASON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEASON_TYPE`
--

DROP TABLE IF EXISTS `SEASON_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SEASON_TYPE` (
  `idSEASON_TYPE` int(11) NOT NULL,
  `seasonTypeName` varchar(45) NOT NULL COMMENT 'Name of the gender category. ',
  `seasonTypeDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idSEASON_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Look-up table of parameters that describe season (gender\nparameters, skill level parameters, age parameters, etc). ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEASON_TYPE`
--

LOCK TABLES `SEASON_TYPE` WRITE;
/*!40000 ALTER TABLE `SEASON_TYPE` DISABLE KEYS */;
INSERT INTO `SEASON_TYPE` VALUES (2,'Women\'s Soft-core','Women\'s league of beginner level play.'),(3,'Co-ed Soft-core','Co-ed league of beginner level play. '),(4,'Open Soft-core','Non-gender-restrictive league of beginner level play. '),(5,'Men\'s Mid-core','Men\'s league of intermediate level play. '),(6,'Women\'s Mid-core','Women\'s league of intermediate level play. '),(7,'Co-ed Mid-core','Co-ed league of intermediate level play. '),(8,'Open Mid-core','Non-gender-restrictive league of intermediate level play. ');
/*!40000 ALTER TABLE `SEASON_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAFF`
--

DROP TABLE IF EXISTS `STAFF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `STAFF` (
  `idSTAFF` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `middleInitial` varchar(1) DEFAULT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`idSTAFF`),
  KEY `fk_role_idx` (`role`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role`) REFERENCES `STAFF_ROLE` (`idstaff_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAFF`
--

LOCK TABLES `STAFF` WRITE;
/*!40000 ALTER TABLE `STAFF` DISABLE KEYS */;
INSERT INTO `STAFF` VALUES (1,' Sonny',' Rollins','',1),(2,' Wynton',' Marsalis','',1),(3,' Bill',' Watrous','',1);
/*!40000 ALTER TABLE `STAFF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAFF_ROLE`
--

DROP TABLE IF EXISTS `STAFF_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `STAFF_ROLE` (
  `idSTAFF_ROLE` int(11) NOT NULL,
  `roleName` varchar(45) NOT NULL,
  `roleDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idSTAFF_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lookup table that describes the roles of different staff types. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAFF_ROLE`
--

LOCK TABLES `STAFF_ROLE` WRITE;
/*!40000 ALTER TABLE `STAFF_ROLE` DISABLE KEYS */;
INSERT INTO `STAFF_ROLE` VALUES (1,'Admin','Responsible for administrating league. '),(2,'Referee','Referees games. ');
/*!40000 ALTER TABLE `STAFF_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEAM`
--

DROP TABLE IF EXISTS `TEAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TEAM` (
  `idTEAM` int(11) NOT NULL,
  `teamName` varchar(80) DEFAULT NULL,
  `teamCaptain` int(11) DEFAULT NULL,
  `isCommunityTeam` tinyint(4) DEFAULT NULL COMMENT 'A ''community team'' is a team made up of people who signed up for the league individually. A\ncommunity team exists for one season only and then disbands (in other words, cannot be \nassigned to another season). ',
  PRIMARY KEY (`idTEAM`),
  KEY `fk_teamCaptain_idx` (`teamCaptain`),
  CONSTRAINT `fk_teamCaptain` FOREIGN KEY (`teamCaptain`) REFERENCES `PLAYER` (`idplayer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEAM`
--

LOCK TABLES `TEAM` WRITE;
/*!40000 ALTER TABLE `TEAM` DISABLE KEYS */;
INSERT INTO `TEAM` VALUES (1,'Daggers',1,0),(2,'Hard Core Ballers',2,0),(3,'BasketWeavers',3,0),(4,'Bouncy Buckaroos',4,0),(5,'Community Team1 Late Fall Open Soft-core',39,1),(6,'Community Team2 Late Fall Open Soft-core',40,1),(7,'On Point',39,0),(8,'Masters of the Court',40,0),(9,'Community Team1 Early Winter Open Soft-core',NULL,1),(10,'Community Team2 Early Winter Open Soft-core',NULL,1);
/*!40000 ALTER TABLE `TEAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEAM_SEASON`
--

DROP TABLE IF EXISTS `TEAM_SEASON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TEAM_SEASON` (
  `idTEAM_SEASON` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `season` int(11) NOT NULL,
  PRIMARY KEY (`idTEAM_SEASON`),
  KEY `fk_TEAM_LEAGUE_TEAM1_idx` (`team`),
  KEY `fk_TEAM_LEAGUE_LEAGUE1_idx` (`season`),
  CONSTRAINT `fk_TEAM_LEAGUE_LEAGUE1` FOREIGN KEY (`season`) REFERENCES `SEASON` (`idseason`),
  CONSTRAINT `fk_TEAM_LEAGUE_TEAM1` FOREIGN KEY (`team`) REFERENCES `TEAM` (`idteam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Linking table between league and team (a team may be in many leagues, and a league has many teams). ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEAM_SEASON`
--

LOCK TABLES `TEAM_SEASON` WRITE;
/*!40000 ALTER TABLE `TEAM_SEASON` DISABLE KEYS */;
INSERT INTO `TEAM_SEASON` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,1,4),(8,2,4),(9,3,4),(10,4,4),(11,7,4),(12,8,4),(13,9,4),(14,10,4);
/*!40000 ALTER TABLE `TEAM_SEASON` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-19 18:53:07
