-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: sportsleagueproject
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
-- Table structure for table `EQUIPMENT_AVAILABLE`
--

DROP TABLE IF EXISTS `EQUIPMENT_AVAILABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EQUIPMENT_AVAILABLE` (
  `idEQUIPMENT_AVAILABLE` int(11) NOT NULL,
  `facility` int(11) NOT NULL,
  `equipmentType` int(11) NOT NULL,
  `quantityAvailable` int(11) NOT NULL,
  PRIMARY KEY (`idEQUIPMENT_AVAILABLE`),
  KEY `fk_facility_idx` (`facility`),
  KEY `fk_equipmentType_idx` (`equipmentType`),
  CONSTRAINT `fk_equipmentType` FOREIGN KEY (`equipmentType`) REFERENCES `equipment_type` (`idequipment_type`),
  CONSTRAINT `fk_facility` FOREIGN KEY (`facility`) REFERENCES `facility` (`idfacility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EQUIPMENT_AVAILABLE`
--

LOCK TABLES `EQUIPMENT_AVAILABLE` WRITE;
/*!40000 ALTER TABLE `EQUIPMENT_AVAILABLE` DISABLE KEYS */;
INSERT INTO `EQUIPMENT_AVAILABLE` VALUES (1,1,1,4),(2,1,2,2),(3,2,1,4),(4,2,2,2),(5,3,1,4),(6,3,2,2);
/*!40000 ALTER TABLE `EQUIPMENT_AVAILABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EQUIPMENT_TYPE`
--

DROP TABLE IF EXISTS `EQUIPMENT_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EQUIPMENT_TYPE` (
  `idEQUIPMENT_TYPE` int(11) NOT NULL,
  `equipmentName` varchar(45) NOT NULL,
  `equipmentDescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEQUIPMENT_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EQUIPMENT_TYPE`
--

LOCK TABLES `EQUIPMENT_TYPE` WRITE;
/*!40000 ALTER TABLE `EQUIPMENT_TYPE` DISABLE KEYS */;
INSERT INTO `EQUIPMENT_TYPE` VALUES (1,'Basketball','The Ball!'),(2,'Scorer\'s Table','table to set at center court');
/*!40000 ALTER TABLE `EQUIPMENT_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `FACILITY` VALUES (1,'The Center','123 Fake St.',NULL,NULL,'WA',NULL,4),(2,'Champion\'s Court','420 Blaze Dr.',NULL,NULL,'WA',NULL,2),(3,'Globo Gym','1 Winner Cr.',NULL,NULL,'WA',NULL,3);
/*!40000 ALTER TABLE `FACILITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATCH_TEAM`
--

DROP TABLE IF EXISTS `MATCH_TEAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MATCH_TEAM` (
  `idMATCH_TEAM` int(11) NOT NULL,
  `match` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  PRIMARY KEY (`idMATCH_TEAM`),
  KEY `fk_match_idx` (`match`),
  KEY `fk_team/match` (`team`),
  CONSTRAINT `fk_match` FOREIGN KEY (`match`) REFERENCES `matches` (`idmatches`),
  CONSTRAINT `fk_team/match` FOREIGN KEY (`team`) REFERENCES `team` (`idteam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Linking table between match and team. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATCH_TEAM`
--

LOCK TABLES `MATCH_TEAM` WRITE;
/*!40000 ALTER TABLE `MATCH_TEAM` DISABLE KEYS */;
INSERT INTO `MATCH_TEAM` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,3,1),(6,3,3),(7,4,2),(8,4,4),(9,5,1),(10,5,4),(11,6,2),(12,6,3);
/*!40000 ALTER TABLE `MATCH_TEAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATCHES`
--

DROP TABLE IF EXISTS `MATCHES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MATCHES` (
  `idMATCHES` int(11) NOT NULL,
  `season` int(11) NOT NULL,
  `matchdateTimeStart` datetime NOT NULL COMMENT 'The date and time that the match will take place. ',
  `facility` int(11) NOT NULL,
  `matchDateTimeEnd` datetime NOT NULL,
  PRIMARY KEY (`idMATCHES`),
  KEY `fk_league_idx` (`season`),
  KEY `fk_location_idx` (`facility`),
  CONSTRAINT `fk_league` FOREIGN KEY (`season`) REFERENCES `season` (`idseason`),
  CONSTRAINT `fk_location` FOREIGN KEY (`facility`) REFERENCES `facility` (`idfacility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Schedule of regular season games to precede playoff games. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATCHES`
--

LOCK TABLES `MATCHES` WRITE;
/*!40000 ALTER TABLE `MATCHES` DISABLE KEYS */;
INSERT INTO `MATCHES` VALUES (1,1,'2018-11-11 15:00:00',1,'2018-11-11 15:59:59'),(2,1,'2018-11-11 15:00:00',1,'2018-11-11 15:59:59'),(3,1,'2018-11-11 16:00:00',1,'2018-11-11 16:59:59'),(4,1,'2018-11-11 16:00:00',1,'2018-11-11 16:59:59'),(5,1,'2018-11-11 17:00:00',1,'2018-11-11 17:59:59'),(6,1,'2018-11-11 17:00:00',1,'2018-11-11 17:59:59');
/*!40000 ALTER TABLE `MATCHES` ENABLE KEYS */;
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
INSERT INTO `PLAYER` VALUES (1,'Jim','Johnston','R','1992-01-01','M','Jim@fake.com','509','9953000'),(2,'Tyler','Phinley',NULL,'1990-04-25','M','Johhnny420@getBlazed.io',NULL,NULL),(3,'Henry','Yalles',NULL,'1990-04-26','M','YalleBunchHoes@aol.net',NULL,NULL),(4,'Chris','Handa','F','1990-04-20','M','DefinitelyRealEmail@fake.com',NULL,NULL),(5,'Alex','Courts',NULL,'1992-01-20','M','johan@fake.com',NULL,NULL),(6,'Ross','Szott',NULL,'1990-03-20','M','tayquan@fake.com',NULL,NULL),(7,'Michael','Schutts','G','1990-01-20','M','poop@fake.com',NULL,NULL),(8,'Andrew','Pryhuber',NULL,'1993-01-20','M','JoeShmoe@MoesBar.org',NULL,NULL),(9,'David','Crane',NULL,'1990-06-20','M','Krusty@Horror.org',NULL,NULL),(10,'Cody','Johnston',NULL,'1994-01-20','M','Pinhead@fake.com',NULL,NULL),(11,'Bryan','Cohen','','1990-01-29','M','ThisGuy@email.com','206',''),(12,'Greg','Cousins','','1990-05-05','M','DuDuDuDuDuel@Kaiba.net','206',''),(13,'Charles','Schwabb','','1990-12-26','M','Connor@CharlesSchwab.eu','206',''),(14,'John','Cloner','','1990-08-17','M','jimyjimmerson@uw.edu','206',''),(15,'Tayquan','Gerrard','','1990-07-19','M','email@email.com','',''),(16,'Kyle','Defoe','','1990-08-10','M','CarlShizlak@moc.com','',''),(17,'Mitchell','Sturridge','','1990-05-10','M','HomerJaySimpson@Simpsons.stillOn','',''),(18,'Mason','Blechin','','1990-05-22','M','Barney@TowTruckDrunk.com','',''),(19,'Tyson','Chandler','','1990-05-12','M','PowerPF@Suns.net','',''),(20,'Kirk','Handa','','1990-08-31','M','TigerWoods@PGA.com','','');
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
  `matchTeam` int(11) NOT NULL COMMENT 'Inidividual player statistics for any particular match will go here. ',
  `player` int(11) NOT NULL,
  `played_in_game` varchar(1) DEFAULT NULL,
  `pts` int(11) DEFAULT NULL,
  `FGM` int(11) DEFAULT NULL,
  `FGA` int(11) DEFAULT NULL,
  `3PM` int(11) DEFAULT NULL,
  `FTM` int(11) DEFAULT NULL,
  `FTA` int(11) DEFAULT NULL,
  `OFF_REB` int(11) DEFAULT NULL,
  `DEF_REB` int(11) DEFAULT NULL,
  `AST` int(11) DEFAULT NULL,
  `TOV` int(11) DEFAULT NULL,
  `STL` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPLAYER_PERFORMANCE`),
  KEY `fk_match_team_idx` (`matchTeam`),
  KEY `fk_player/performance` (`player`),
  CONSTRAINT `fk_match_team` FOREIGN KEY (`matchTeam`) REFERENCES `match_team` (`idmatch_team`),
  CONSTRAINT `fk_player/performance` FOREIGN KEY (`player`) REFERENCES `player` (`idplayer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Describes an individual player''s performance in a match. Any relevant statistics can go here. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER_PERFORMANCE`
--

LOCK TABLES `PLAYER_PERFORMANCE` WRITE;
/*!40000 ALTER TABLE `PLAYER_PERFORMANCE` DISABLE KEYS */;
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
  CONSTRAINT `fk_player` FOREIGN KEY (`player`) REFERENCES `player` (`idplayer`),
  CONSTRAINT `fk_team` FOREIGN KEY (`team`) REFERENCES `team` (`idteam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Linking table between player and team since one player may be on many teams, and each team has many players. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER_TEAM`
--

LOCK TABLES `PLAYER_TEAM` WRITE;
/*!40000 ALTER TABLE `PLAYER_TEAM` DISABLE KEYS */;
INSERT INTO `PLAYER_TEAM` VALUES (1,1,1,'2018-10-12'),(2,2,1,'2018-09-10'),(3,3,1,'2018-09-15'),(4,4,1,'2018-09-18'),(5,5,1,'2018-09-13'),(6,6,2,'2018-09-15'),(7,7,2,'2018-10-12'),(8,8,2,'2018-10-11'),(9,9,2,'2018-09-17'),(10,10,2,'2018-09-18'),(11,11,3,'2018-10-12'),(12,12,3,'2018-09-20'),(13,13,3,'2018-09-21'),(14,14,3,'2018-09-15'),(15,15,3,'2018-10-12'),(16,16,4,'2018-09-15'),(17,17,4,'2018-09-18'),(18,18,4,'2018-10-12'),(19,19,4,'2018-10-13'),(20,20,4,'2018-09-15');
/*!40000 ALTER TABLE `PLAYER_TEAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REFEREE_MATCH`
--

DROP TABLE IF EXISTS `REFEREE_MATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `REFEREE_MATCH` (
  `REFEREE_MATCH` int(11) NOT NULL,
  `match` int(11) NOT NULL,
  `referee` int(11) NOT NULL,
  PRIMARY KEY (`REFEREE_MATCH`),
  KEY `fk_referee_idx` (`referee`),
  KEY `fk_match/ref` (`match`),
  CONSTRAINT `fk_match/ref` FOREIGN KEY (`match`) REFERENCES `matches` (`idmatches`),
  CONSTRAINT `fk_referee` FOREIGN KEY (`referee`) REFERENCES `staff` (`idstaff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REFEREE_MATCH`
--

LOCK TABLES `REFEREE_MATCH` WRITE;
/*!40000 ALTER TABLE `REFEREE_MATCH` DISABLE KEYS */;
INSERT INTO `REFEREE_MATCH` VALUES (1,1,1),(2,2,3),(3,3,1),(4,4,3),(5,5,1),(6,6,3);
/*!40000 ALTER TABLE `REFEREE_MATCH` ENABLE KEYS */;
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
  PRIMARY KEY (`idSEASON`),
  KEY `fk_genderCategory_idx` (`seasonType`),
  KEY `fk_seasonAdministrator_idx` (`seasonAdministrator`),
  CONSTRAINT `fk_genderCategory` FOREIGN KEY (`seasonType`) REFERENCES `season_type` (`idseason_type`),
  CONSTRAINT `fk_seasonAdministrator` FOREIGN KEY (`seasonAdministrator`) REFERENCES `staff` (`idstaff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEASON`
--

LOCK TABLES `SEASON` WRITE;
/*!40000 ALTER TABLE `SEASON` DISABLE KEYS */;
INSERT INTO `SEASON` VALUES (1,2,2,4,8,5,10),(2,4,2,4,8,5,10);
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
INSERT INTO `SEASON_TYPE` VALUES (1,'Pro','Designed for players who have played organized basketball many times'),(2,'Intermediate','Designed for players who have played organized basketball on occassion'),(3,'Casual','Deisgned for players who have never played organized basketball');
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
  CONSTRAINT `fk_role` FOREIGN KEY (`role`) REFERENCES `staff_role` (`idstaff_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAFF`
--

LOCK TABLES `STAFF` WRITE;
/*!40000 ALTER TABLE `STAFF` DISABLE KEYS */;
INSERT INTO `STAFF` VALUES (1,'John','Len',NULL,1),(2,'Paul','Cart',NULL,2),(3,'Ringo','Rats',NULL,1),(4,'George','Harr',NULL,2);
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
INSERT INTO `STAFF_ROLE` VALUES (1,'Referee','Officiates games'),(2,'Admin','Administers League formation, scheduling, etc.');
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
  PRIMARY KEY (`idTEAM`),
  KEY `fk_teamCaptain_idx` (`teamCaptain`),
  CONSTRAINT `fk_teamCaptain` FOREIGN KEY (`teamCaptain`) REFERENCES `player` (`idplayer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEAM`
--

LOCK TABLES `TEAM` WRITE;
/*!40000 ALTER TABLE `TEAM` DISABLE KEYS */;
INSERT INTO `TEAM` VALUES (1,'Mongooses',1),(2,'Giants',2),(3,'Timbers',3),(4,'Sounders',4),(5,'Sonics',5),(6,'Capitals',6),(7,'Ravens',7),(8,'Falcons',8),(9,'Hawks',9),(10,'Bulls',10);
/*!40000 ALTER TABLE `TEAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEAM_PERFORMANCE`
--

DROP TABLE IF EXISTS `TEAM_PERFORMANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TEAM_PERFORMANCE` (
  `idTEAM_PERFORMANCE` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `match_team` int(11) NOT NULL,
  PRIMARY KEY (`idTEAM_PERFORMANCE`),
  KEY `fk_TEAM_MATCH_OUTCOME_MATCH_TEAM1_idx` (`match_team`),
  CONSTRAINT `fk_TEAM_MATCH_OUTCOME_MATCH_TEAM1` FOREIGN KEY (`match_team`) REFERENCES `match_team` (`idmatch_team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Describes the outcome of a match played by a team (including any team-level statistics). \nTable included to avoid use of nulls in MATCH_TEAM. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEAM_PERFORMANCE`
--

LOCK TABLES `TEAM_PERFORMANCE` WRITE;
/*!40000 ALTER TABLE `TEAM_PERFORMANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEAM_PERFORMANCE` ENABLE KEYS */;
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
  `league` int(11) NOT NULL,
  PRIMARY KEY (`idTEAM_SEASON`),
  KEY `fk_TEAM_LEAGUE_TEAM1_idx` (`team`),
  KEY `fk_TEAM_LEAGUE_LEAGUE1_idx` (`league`),
  CONSTRAINT `fk_TEAM_LEAGUE_LEAGUE1` FOREIGN KEY (`league`) REFERENCES `season` (`idseason`),
  CONSTRAINT `fk_TEAM_LEAGUE_TEAM1` FOREIGN KEY (`team`) REFERENCES `team` (`idteam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Linking table between league and team (a team may be in many leagues, and a league has many teams). ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEAM_SEASON`
--

LOCK TABLES `TEAM_SEASON` WRITE;
/*!40000 ALTER TABLE `TEAM_SEASON` DISABLE KEYS */;
INSERT INTO `TEAM_SEASON` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1);
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

-- Dump completed on 2018-11-18 23:41:56
