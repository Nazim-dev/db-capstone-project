-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`customers` (
  `custID` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `phone` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`custID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`staff` (
  `staffID` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `salary` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`address` (
  `addressID` INT NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `county` VARCHAR(45) NOT NULL,
  `zipcode` VARCHAR(45) NULL,
  PRIMARY KEY (`addressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menu` (
  `menuID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `price` VARCHAR(45) NULL,
  PRIMARY KEY (`menuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`orders` (
  `orderID` INT NOT NULL,
  `custID` INT NULL,
  `menuID` INT NULL,
  `date` DATE NULL,
  `quantity` VARCHAR(45) NULL,
  `price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`orderID`),
  INDEX `custID_idx` (`custID` ASC) VISIBLE,
  INDEX `menuID_idx` (`menuID` ASC) VISIBLE,
  CONSTRAINT `custID`
    FOREIGN KEY (`custID`)
    REFERENCES `dbcapstone`.`customers` (`custID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menuID`
    FOREIGN KEY (`menuID`)
    REFERENCES `dbcapstone`.`menu` (`menuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`tables`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`tables` (
  `tableNo` INT NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tableNo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`bookings` (
  `bookingID` INT NOT NULL,
  `staffID` INT NOT NULL,
  `orderID` INT NOT NULL,
  `date` DATE NOT NULL,
  `tableNo` INT NOT NULL,
  PRIMARY KEY (`bookingID`),
  INDEX `staffID_idx` (`staffID` ASC) VISIBLE,
  INDEX `orderID_idx` (`orderID` ASC) VISIBLE,
  INDEX `tableNo_idx` (`tableNo` ASC) VISIBLE,
  CONSTRAINT `staffID`
    FOREIGN KEY (`staffID`)
    REFERENCES `dbcapstone`.`staff` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `orderID`
    FOREIGN KEY (`orderID`)
    REFERENCES `dbcapstone`.`orders` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tableNo`
    FOREIGN KEY (`tableNo`)
    REFERENCES `dbcapstone`.`tables` (`tableNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`delivery` (
  `deliveryID` INT NOT NULL,
  `addressID` INT NOT NULL,
  `orderID` INT NOT NULL,
  `date` DATE NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`deliveryID`),
  INDEX `addressID_idx` (`addressID` ASC) VISIBLE,
  INDEX `orderID_idx` (`orderID` ASC) VISIBLE,
  CONSTRAINT `addressID`
    FOREIGN KEY (`addressID`)
    REFERENCES `dbcapstone`.`address` (`addressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_ID`
    FOREIGN KEY (`orderID`)
    REFERENCES `dbcapstone`.`orders` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
