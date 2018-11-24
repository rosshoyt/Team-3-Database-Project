-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sportsleagueproject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sportsleagueproject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sportsleagueproject` ;
USE `sportsleagueproject` ;

-- -----------------------------------------------------
-- Table `sportsleagueproject`.`PLAYER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`PLAYER` (
  `idPLAYER` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `middleInitial` VARCHAR(45) NULL,
  `dateOfBirth` DATE NOT NULL,
  `sex` VARCHAR(1) NOT NULL,
  `email` VARCHAR(90) NOT NULL,
  `areaCode` VARCHAR(3) NULL,
  `phoneNumber` VARCHAR(7) NULL,
  PRIMARY KEY (`idPLAYER`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`TEAM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`TEAM` (
  `idTEAM` INT NOT NULL,
  `teamName` VARCHAR(80) NULL,
  `teamCaptain` INT NULL,
  PRIMARY KEY (`idTEAM`),
  INDEX `fk_teamCaptain_idx` (`teamCaptain` ASC) VISIBLE,
  CONSTRAINT `fk_teamCaptain`
    FOREIGN KEY (`teamCaptain`)
    REFERENCES `sportsleagueproject`.`PLAYER` (`idPLAYER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`PLAYER_TEAM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`PLAYER_TEAM` (
  `idPLAYER_TEAM` INT NOT NULL,
  `player` INT NOT NULL,
  `team` INT NOT NULL,
  `joinDate` DATE NULL COMMENT 'Date player joined this team. ',
  PRIMARY KEY (`idPLAYER_TEAM`),
  INDEX `fk_player_idx` (`player` ASC) VISIBLE,
  INDEX `fk_team_idx` (`team` ASC) VISIBLE,
  CONSTRAINT `fk_player`
    FOREIGN KEY (`player`)
    REFERENCES `sportsleagueproject`.`PLAYER` (`idPLAYER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_team`
    FOREIGN KEY (`team`)
    REFERENCES `sportsleagueproject`.`TEAM` (`idTEAM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Linking table between player and team since one player may be on many teams, and each team has many players. ';


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`SEASON_TYPE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`SEASON_TYPE` (
  `idSEASON_TYPE` INT NOT NULL,
  `seasonTypeName` VARCHAR(45) NOT NULL COMMENT 'Name of the gender category. ',
  `seasonTypeDescription` VARCHAR(200) NULL,
  PRIMARY KEY (`idSEASON_TYPE`))
ENGINE = InnoDB
COMMENT = 'Look-up table of parameters that describe season (gender\nparameters, skill level parameters, age parameters, etc). ';


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`STAFF_ROLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`STAFF_ROLE` (
  `idSTAFF_ROLE` INT NOT NULL,
  `roleName` VARCHAR(45) NOT NULL,
  `roleDescription` VARCHAR(200) NULL,
  PRIMARY KEY (`idSTAFF_ROLE`))
ENGINE = InnoDB
COMMENT = 'Lookup table that describes the roles of different staff types. ';


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`STAFF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`STAFF` (
  `idSTAFF` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `middleInitial` VARCHAR(1) NULL,
  `role` INT NOT NULL,
  PRIMARY KEY (`idSTAFF`),
  INDEX `fk_role_idx` (`role` ASC) VISIBLE,
  CONSTRAINT `fk_role`
    FOREIGN KEY (`role`)
    REFERENCES `sportsleagueproject`.`STAFF_ROLE` (`idSTAFF_ROLE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`SEASON`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`SEASON` (
  `idSEASON` INT NOT NULL,
  `seasonAdministrator` INT NOT NULL,
  `seasonType` INT NOT NULL,
  `minTeams` INT NOT NULL,
  `maxTeams` INT NOT NULL,
  `minTeamSize` INT NOT NULL,
  `maxTeamSize` INT NOT NULL,
  PRIMARY KEY (`idSEASON`),
  INDEX `fk_genderCategory_idx` (`seasonType` ASC) VISIBLE,
  INDEX `fk_seasonAdministrator_idx` (`seasonAdministrator` ASC) VISIBLE,
  CONSTRAINT `fk_genderCategory`
    FOREIGN KEY (`seasonType`)
    REFERENCES `sportsleagueproject`.`SEASON_TYPE` (`idSEASON_TYPE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seasonAdministrator`
    FOREIGN KEY (`seasonAdministrator`)
    REFERENCES `sportsleagueproject`.`STAFF` (`idSTAFF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`FACILITY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`FACILITY` (
  `idFACILITY` INT NOT NULL,
  `facilityName` VARCHAR(100) NULL,
  `addressLine1` VARCHAR(45) NULL,
  `addressLine2` VARCHAR(45) NULL,
  `addressLine3` VARCHAR(45) NULL,
  `state` VARCHAR(2) NULL,
  `postalCode` VARCHAR(5) NULL,
  `numCourts` INT NOT NULL COMMENT 'Number of basketball courts that thisfacility has. ',
  PRIMARY KEY (`idFACILITY`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`MATCH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`MATCH` (
  `idMATCHES` INT NOT NULL,
  `season` INT NOT NULL,
  `matchdateTimeStart` DATETIME NOT NULL COMMENT 'The date and time that the match will take place. ',
  `facility` INT NOT NULL,
  `matchDateTimeEnd` DATETIME NOT NULL,
  PRIMARY KEY (`idMATCHES`),
  INDEX `fk_league_idx` (`season` ASC) VISIBLE,
  INDEX `fk_location_idx` (`facility` ASC) VISIBLE,
  CONSTRAINT `fk_league`
    FOREIGN KEY (`season`)
    REFERENCES `sportsleagueproject`.`SEASON` (`idSEASON`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location`
    FOREIGN KEY (`facility`)
    REFERENCES `sportsleagueproject`.`FACILITY` (`idFACILITY`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Schedule of regular season games to precede playoff games. ';


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`TEAM_SEASON`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`TEAM_SEASON` (
  `idTEAM_SEASON` INT NOT NULL,
  `team` INT NOT NULL,
  `league` INT NOT NULL,
  PRIMARY KEY (`idTEAM_SEASON`),
  INDEX `fk_TEAM_LEAGUE_TEAM1_idx` (`team` ASC) VISIBLE,
  INDEX `fk_TEAM_LEAGUE_LEAGUE1_idx` (`league` ASC) VISIBLE,
  CONSTRAINT `fk_TEAM_LEAGUE_TEAM1`
    FOREIGN KEY (`team`)
    REFERENCES `sportsleagueproject`.`TEAM` (`idTEAM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TEAM_LEAGUE_LEAGUE1`
    FOREIGN KEY (`league`)
    REFERENCES `sportsleagueproject`.`SEASON` (`idSEASON`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Linking table between league and team (a team may be in many leagues, and a league has many teams). ';


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`MATCH_TEAM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`MATCH_TEAM` (
  `idMATCH_TEAM` INT NOT NULL,
  `match` INT NOT NULL,
  `team` INT NOT NULL,
  PRIMARY KEY (`idMATCH_TEAM`),
  INDEX `fk_match_idx` (`match` ASC) VISIBLE,
  INDEX `fk_team_idx` (`team` ASC) VISIBLE,
  CONSTRAINT `fk_match`
    FOREIGN KEY (`match`)
    REFERENCES `sportsleagueproject`.`MATCH` (`idMATCHES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_team`
    FOREIGN KEY (`team`)
    REFERENCES `sportsleagueproject`.`TEAM` (`idTEAM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Linking table between match and team. ';


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`TEAM_PERFORMANCE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`TEAM_PERFORMANCE` (
  `idTEAM_PERFORMANCE` INT NOT NULL,
  `score` INT NOT NULL,
  `match_team` INT NOT NULL,
  PRIMARY KEY (`idTEAM_PERFORMANCE`),
  INDEX `fk_TEAM_MATCH_OUTCOME_MATCH_TEAM1_idx` (`match_team` ASC) VISIBLE,
  CONSTRAINT `fk_TEAM_MATCH_OUTCOME_MATCH_TEAM1`
    FOREIGN KEY (`match_team`)
    REFERENCES `sportsleagueproject`.`MATCH_TEAM` (`idMATCH_TEAM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Describes the outcome of a match played by a team (including any team-level statistics). \nTable included to avoid use of nulls in MATCH_TEAM. ';


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`PLAYER_PERFORMANCE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`PLAYER_PERFORMANCE` (
  `idPLAYER_PERFORMANCE` INT NOT NULL,
  `matchTeam` INT NOT NULL COMMENT 'Inidividual player statistics for any particular match will go here. ',
  `player` INT NOT NULL,
  `played_in_game` VARCHAR(1) NULL,
  `pts` INT NULL,
  `FGM` INT NULL,
  `FGA` INT NULL,
  `3PM` INT NULL,
  `FTM` INT NULL,
  `FTA` INT NULL,
  `OFF_REB` INT NULL,
  `DEF_REB` INT NULL,
  `AST` INT NULL,
  `TOV` INT NULL,
  `STL` INT NULL,
  PRIMARY KEY (`idPLAYER_PERFORMANCE`),
  INDEX `fk_player_idx` (`player` ASC) VISIBLE,
  INDEX `fk_match_team_idx` (`matchTeam` ASC) VISIBLE,
  CONSTRAINT `fk_player`
    FOREIGN KEY (`player`)
    REFERENCES `sportsleagueproject`.`PLAYER` (`idPLAYER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_match_team`
    FOREIGN KEY (`matchTeam`)
    REFERENCES `sportsleagueproject`.`MATCH_TEAM` (`idMATCH_TEAM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Describes an individual player\'s performance in a match. Any relevant statistics can go here. ';


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`REFEREE_MATCH`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`REFEREE_MATCH` (
  `REFEREE_MATCH` INT NOT NULL,
  `match` INT NOT NULL,
  `referee` INT NOT NULL,
  PRIMARY KEY (`REFEREE_MATCH`),
  INDEX `fk_match_idx` (`match` ASC) VISIBLE,
  INDEX `fk_referee_idx` (`referee` ASC) VISIBLE,
  CONSTRAINT `fk_match`
    FOREIGN KEY (`match`)
    REFERENCES `sportsleagueproject`.`MATCH` (`idMATCHES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_referee`
    FOREIGN KEY (`referee`)
    REFERENCES `sportsleagueproject`.`STAFF` (`idSTAFF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`EQUIPMENT_TYPE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`EQUIPMENT_TYPE` (
  `idEQUIPMENT_TYPE` INT NOT NULL,
  `equipmentName` VARCHAR(45) NOT NULL,
  `equipmentDescription` VARCHAR(45) NULL,
  PRIMARY KEY (`idEQUIPMENT_TYPE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sportsleagueproject`.`EQUIPMENT_AVAILABLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sportsleagueproject`.`EQUIPMENT_AVAILABLE` (
  `idEQUIPMENT_AVAILABLE` INT NOT NULL,
  `facility` INT NOT NULL,
  `equipmentType` INT NOT NULL,
  `quantityAvailable` INT NOT NULL,
  PRIMARY KEY (`idEQUIPMENT_AVAILABLE`),
  INDEX `fk_facility_idx` (`facility` ASC) VISIBLE,
  INDEX `fk_equipmentType_idx` (`equipmentType` ASC) VISIBLE,
  CONSTRAINT `fk_facility`
    FOREIGN KEY (`facility`)
    REFERENCES `sportsleagueproject`.`FACILITY` (`idFACILITY`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipmentType`
    FOREIGN KEY (`equipmentType`)
    REFERENCES `sportsleagueproject`.`EQUIPMENT_TYPE` (`idEQUIPMENT_TYPE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
