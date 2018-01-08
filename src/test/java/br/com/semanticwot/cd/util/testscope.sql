INSERT INTO `casadocodigoexercicio`.`SystemUser_Role`
(`SystemUser_login`,
`roles_name`)
VALUES
('admin@gmail.com',
'ROLE_ADMIN');

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pswotcloud
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pswotcloud
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pswotcloud` DEFAULT CHARACTER SET latin1 ;
USE `pswotcloud` ;

-- -----------------------------------------------------
-- Table `pswotcloud`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pswotcloud`.`Role` (
  `name` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `pswotcloud`.`SystemUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pswotcloud`.`SystemUser` (
  `name` VARCHAR(250) NULL DEFAULT NULL,
  `password` VARCHAR(250) NULL DEFAULT NULL,
  `login` VARCHAR(250) NOT NULL,
  `ip` VARCHAR(45) NULL DEFAULT NULL,
  `port` INT(11) NULL DEFAULT NULL,
  `perfilstatus` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`login`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `pswotcloud`.`SwotApplication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pswotcloud`.`SwotApplication` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `releaseDate` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(250) NULL DEFAULT NULL,
  `SystemUser_login` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`, `SystemUser_login`),
  INDEX `fk_SwotApplication_SystemUser_idx` (`SystemUser_login` ASC),
  CONSTRAINT `fk_SwotApplication_SystemUser`
    FOREIGN KEY (`SystemUser_login`)
    REFERENCES `pswotcloud`.`SystemUser` (`login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `pswotcloud`.`SystemUser_Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pswotcloud`.`SystemUser_Role` (
  `SystemUser_login` VARCHAR(250) NOT NULL,
  `roles_name` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`SystemUser_login`, `roles_name`),
  INDEX `fk_SystemUser_has_Role_Role1_idx` (`roles_name` ASC),
  INDEX `fk_SystemUser_has_Role_SystemUser1_idx` (`SystemUser_login` ASC),
  CONSTRAINT `fk_SystemUser_has_Role_SystemUser1`
    FOREIGN KEY (`SystemUser_login`)
    REFERENCES `pswotcloud`.`SystemUser` (`login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SystemUser_has_Role_Role1`
    FOREIGN KEY (`roles_name`)
    REFERENCES `pswotcloud`.`Role` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

