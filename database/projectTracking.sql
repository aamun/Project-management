SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `Proyect_tracking` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `Proyect_tracking` ;

-- -----------------------------------------------------
-- Table `Proyect_tracking`.`proyects`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Proyect_tracking`.`proyects` (
  `idProyect` INT NOT NULL AUTO_INCREMENT ,
  `proyect` VARCHAR(255) NULL ,
  `overview` TEXT NULL ,
  `idProyectParent` INT NULL ,
  PRIMARY KEY (`idProyect`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyect_tracking`.`milestones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Proyect_tracking`.`milestones` (
  `idMilestone` INT NOT NULL AUTO_INCREMENT ,
  `milestone` VARCHAR(255) NULL ,
  `overview` TEXT NULL ,
  `idProyect` INT NOT NULL ,
  `idMilestoneParent` INT NULL ,
  PRIMARY KEY (`idMilestone`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyect_tracking`.`status`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Proyect_tracking`.`status` (
  `idStatus` INT NOT NULL AUTO_INCREMENT ,
  `status` VARCHAR(255) NULL ,
  PRIMARY KEY (`idStatus`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyect_tracking`.`priorities`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Proyect_tracking`.`priorities` (
  `idPriority` INT NOT NULL AUTO_INCREMENT ,
  `priority` VARCHAR(45) NULL ,
  PRIMARY KEY (`idPriority`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyect_tracking`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Proyect_tracking`.`users` (
  `idUser` INT NOT NULL ,
  `user` VARCHAR(255) NULL ,
  `password` VARCHAR(255) NULL ,
  `email` VARCHAR(255) NULL ,
  PRIMARY KEY (`idUser`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyect_tracking`.`versions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Proyect_tracking`.`versions` (
  `idVersion` INT NOT NULL AUTO_INCREMENT ,
  `version` VARCHAR(45) NULL ,
  `idProyect` INT NOT NULL ,
  PRIMARY KEY (`idVersion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyect_tracking`.`issues`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Proyect_tracking`.`issues` (
  `idIssue` INT NOT NULL AUTO_INCREMENT ,
  `issue` VARCHAR(255) NULL ,
  `description` TEXT NULL ,
  `created` DATE NULL ,
  `updated` DATE NULL ,
  `startDate` DATE NULL ,
  `dueDate` DATE NULL ,
  `doneProcentual` INT NULL ,
  `idProyect` INT NOT NULL ,
  `idStatus` INT NOT NULL ,
  `idPriority` INT NOT NULL ,
  `idUserCreator` INT NOT NULL ,
  `idMilestone` INT NULL ,
  `idUserAssignee` INT NULL ,
  `idVersion` INT NULL ,
  `idIssueParent` INT NULL ,
  PRIMARY KEY (`idIssue`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyect_tracking`.`ideas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Proyect_tracking`.`ideas` (
  `idIdea` INT NOT NULL AUTO_INCREMENT ,
  `idea` VARCHAR(255) NULL ,
  `description` TEXT NULL ,
  `idProyect` INT NOT NULL ,
  PRIMARY KEY (`idIdea`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyect_tracking`.`opinions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Proyect_tracking`.`opinions` (
  `idOpinion` INT NOT NULL ,
  `opinion` TEXT NULL ,
  `dictum` TINYINT(1)  NULL ,
  `idIdea` INT NOT NULL ,
  `idUser` INT NOT NULL ,
  PRIMARY KEY (`idOpinion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyect_tracking`.`members`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Proyect_tracking`.`members` (
  `idMember` INT NOT NULL AUTO_INCREMENT ,
  `idProyect` INT NOT NULL ,
  `idUser` INT NOT NULL ,
  PRIMARY KEY (`idMember`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
