-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Restaurant App
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Restaurant App
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Restaurant App` DEFAULT CHARACTER SET utf8 ;
USE `Restaurant App` ;

-- -----------------------------------------------------
-- Table `Restaurant App`.` Customer Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurant App`.` Customer Country` (
  `CountryID` INT NOT NULL AUTO_INCREMENT,
  `Country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CountryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurant App`.`Customer City`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurant App`.`Customer City` (
  `CityID` INT NOT NULL AUTO_INCREMENT,
  `City` VARCHAR(45) NOT NULL,
  `State` CHAR(2) NOT NULL,
  `PostalCode` CHAR(10) NOT NULL,
  `CountryID` INT NOT NULL,
  PRIMARY KEY (`CityID`),
  INDEX `CountryID_idx` (`CountryID` ASC) VISIBLE,
  CONSTRAINT `CountryID`
    FOREIGN KEY (`CountryID`)
    REFERENCES `Restaurant App`.` Customer Country` (`CountryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurant App`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurant App`.`Customer` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `Customer Name` VARCHAR(45) NOT NULL,
  `Address1` VARCHAR(150) NOT NULL,
  `Address2` VARCHAR(45) NULL,
  `CityID` INT NOT NULL,
  `Phone Number` VARCHAR(45) NOT NULL,
  `E-mail` INT NOT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `CityID_idx` (`CityID` ASC) VISIBLE,
  CONSTRAINT `CityID`
    FOREIGN KEY (`CityID`)
    REFERENCES `Restaurant App`.`Customer City` (`CityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurant App`.`Restaurant Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurant App`.`Restaurant Country` (
  `CountryID` INT NOT NULL AUTO_INCREMENT,
  `Country` VARCHAR(45) NOT NULL,
  `Restaurant Countrycol` VARCHAR(45) NULL,
  PRIMARY KEY (`CountryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurant App`.`Restaurant City`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurant App`.`Restaurant City` (
  `CityID` INT NOT NULL AUTO_INCREMENT,
  `City` VARCHAR(50) NOT NULL,
  `PostalCode` CHAR(10) NOT NULL,
  `CountryID` INT NOT NULL,
  PRIMARY KEY (`CityID`),
  INDEX `CountryID_idx` (`CountryID` ASC) VISIBLE,
  CONSTRAINT `CountryID`
    FOREIGN KEY (`CountryID`)
    REFERENCES `Restaurant App`.`Restaurant Country` (`CountryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurant App`.`Restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurant App`.`Restaurant` (
  `RestaurantID` INT NOT NULL AUTO_INCREMENT,
  `RestaurantName` VARCHAR(50) NOT NULL,
  `Address1` VARCHAR(150) NOT NULL,
  `Address2` VARCHAR(45) NULL,
  `CityID` INT NOT NULL,
  `PhoneNumber` CHAR(10) NOT NULL,
  `E-mail` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`RestaurantID`),
  CONSTRAINT `CityID`
    FOREIGN KEY ()
    REFERENCES `Restaurant App`.`Restaurant City` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurant App`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurant App`.`Payment` (
  `PaymentID` INT NOT NULL AUTO_INCREMENT,
  `Payment_Type` VARCHAR(25) NOT NULL,
  `CustomerID` INT NOT NULL,
  `RestaurantID` INT NOT NULL,
  `SubscriptionID` INT NOT NULL,
  PRIMARY KEY (`PaymentID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `RestaurantID_idx` (`RestaurantID` ASC) VISIBLE,
  INDEX `SubscriptionID_idx` (`SubscriptionID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Restaurant App`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RestaurantID`
    FOREIGN KEY (`RestaurantID`)
    REFERENCES `Restaurant App`.`Restaurant` (`RestaurantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SubscriptionID`
    FOREIGN KEY (`SubscriptionID`)
    REFERENCES `Restaurant App`.`Subscription` (`SubscriptionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Restaurant App`.`Subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Restaurant App`.`Subscription` (
  `SubscriptionID` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` INT NOT NULL,
  `Subscription` INT NOT NULL,
  `PaymentID` INT NOT NULL,
  `RestaurantID` INT NOT NULL,
  PRIMARY KEY (`SubscriptionID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `RestaurantID_idx` (`RestaurantID` ASC) VISIBLE,
  INDEX `PaymentID_idx` (`PaymentID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Restaurant App`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RestaurantID`
    FOREIGN KEY (`RestaurantID`)
    REFERENCES `Restaurant App`.`Restaurant` (`RestaurantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PaymentID`
    FOREIGN KEY (`PaymentID`)
    REFERENCES `Restaurant App`.`Payment` (`PaymentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
