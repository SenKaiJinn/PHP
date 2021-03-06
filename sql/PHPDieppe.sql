-- MySQL Script generated by MySQL Workbench
-- Thu Apr  5 15:31:11 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PHPDieppe
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PHPDieppe
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PHPDieppe` DEFAULT CHARACTER SET utf8 ;
USE `PHPDieppe` ;

-- -----------------------------------------------------
-- Table `PHPDieppe`.`T_ROLES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`T_ROLES` (
  `ID_ROLE` INT NOT NULL AUTO_INCREMENT,
  `ROLLABEL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_ROLE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PHPDieppe`.`T_USERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`T_USERS` (
  `ID_USER` INT NOT NULL AUTO_INCREMENT,
  `USERNAME` VARCHAR(45) NOT NULL,
  `USERFIRSTNAME` VARCHAR(80) NULL,
  `USEMAIL` VARCHAR(160) NOT NULL,
  `USEPASSWORD` CHAR(40) NOT NULL,
  `ID_ROLE` INT NOT NULL,
  PRIMARY KEY (`ID_USER`, `ID_ROLE`),
  INDEX `fk_T_USERS_T_ROLES_idx` (`ID_ROLE` ASC),
  CONSTRAINT `fk_T_USERS_T_ROLES`
    FOREIGN KEY (`ID_ROLE`)
    REFERENCES `PHPDieppe`.`T_ROLES` (`ID_ROLE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PHPDieppe`.`T_ARTICLES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`T_ARTICLES` (
  `ID_ARTICLE` INT NOT NULL AUTO_INCREMENT,
  `ARTITLE` VARCHAR(200) NOT NULL,
  `ARTCHAPO` VARCHAR(45) NULL,
  `ARTCONTENT` TEXT NOT NULL,
  `ARTDATETIME` DATETIME NULL,
  `T_USERS_ID_USER` INT NOT NULL,
  `T_USERS_ID_ROLE` INT NOT NULL,
  PRIMARY KEY (`ID_ARTICLE`, `T_USERS_ID_USER`, `T_USERS_ID_ROLE`),
  INDEX `fk_T_ARTICLES_T_USERS1_idx` (`T_USERS_ID_USER` ASC, `T_USERS_ID_ROLE` ASC),
  CONSTRAINT `fk_T_ARTICLES_T_USERS1`
    FOREIGN KEY (`T_USERS_ID_USER` , `T_USERS_ID_ROLE`)
    REFERENCES `PHPDieppe`.`T_USERS` (`ID_USER` , `ID_ROLE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PHPDieppe`.`T_CATEGORIES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`T_CATEGORIES` (
  `ID_CATEGORIE` INT NOT NULL AUTO_INCREMENT,
  `CATLABEL` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PHPDieppe`.`T_ARTICLES_has_T_CATEGORIES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`T_ARTICLES_has_T_CATEGORIES` (
  `T_ARTICLES_ID_ARTICLE` INT NOT NULL,
  `T_ARTICLES_T_USERS_ID_USER` INT NOT NULL,
  `T_ARTICLES_T_USERS_ID_ROLE` INT NOT NULL,
  `T_CATEGORIES_ID_CATEGORIE` INT NOT NULL,
  PRIMARY KEY (`T_ARTICLES_ID_ARTICLE`, `T_ARTICLES_T_USERS_ID_USER`, `T_ARTICLES_T_USERS_ID_ROLE`, `T_CATEGORIES_ID_CATEGORIE`),
  INDEX `fk_T_ARTICLES_has_T_CATEGORIES_T_CATEGORIES1_idx` (`T_CATEGORIES_ID_CATEGORIE` ASC),
  INDEX `fk_T_ARTICLES_has_T_CATEGORIES_T_ARTICLES1_idx` (`T_ARTICLES_ID_ARTICLE` ASC, `T_ARTICLES_T_USERS_ID_USER` ASC, `T_ARTICLES_T_USERS_ID_ROLE` ASC),
  CONSTRAINT `fk_T_ARTICLES_has_T_CATEGORIES_T_ARTICLES1`
    FOREIGN KEY (`T_ARTICLES_ID_ARTICLE` , `T_ARTICLES_T_USERS_ID_USER` , `T_ARTICLES_T_USERS_ID_ROLE`)
    REFERENCES `PHPDieppe`.`T_ARTICLES` (`ID_ARTICLE` , `T_USERS_ID_USER` , `T_USERS_ID_ROLE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_ARTICLES_has_T_CATEGORIES_T_CATEGORIES1`
    FOREIGN KEY (`T_CATEGORIES_ID_CATEGORIE`)
    REFERENCES `PHPDieppe`.`T_CATEGORIES` (`ID_CATEGORIE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
