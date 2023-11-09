-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`gamer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gamer` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`games` (
  `idgames` INT NOT NULL,
  `gamer_id` INT NOT NULL,
  PRIMARY KEY (`idgames`),
  UNIQUE INDEX `idgames_UNIQUE` (`idgames` ASC) VISIBLE,
  INDEX `fk_games_gamer_idx` (`gamer_id` ASC) VISIBLE,
  CONSTRAINT `fk_games_gamer`
    FOREIGN KEY (`gamer_id`)
    REFERENCES `mydb`.`gamer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`achievements` (
  `idachievements` INT NOT NULL,
  `games_idgames` INT NOT NULL,
  PRIMARY KEY (`idachievements`),
  UNIQUE INDEX `idachievements_UNIQUE` (`idachievements` ASC) VISIBLE,
  INDEX `fk_achievements_games1_idx` (`games_idgames` ASC) VISIBLE,
  CONSTRAINT `fk_achievements_games1`
    FOREIGN KEY (`games_idgames`)
    REFERENCES `mydb`.`games` (`idgames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gamer_has_achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gamer_has_achievements` (
  `gamer_id` INT NOT NULL,
  `achievements_idachievements` INT NOT NULL,
  PRIMARY KEY (`gamer_id`, `achievements_idachievements`),
  INDEX `fk_gamer_has_achievements_achievements1_idx` (`achievements_idachievements` ASC) VISIBLE,
  INDEX `fk_gamer_has_achievements_gamer1_idx` (`gamer_id` ASC) VISIBLE,
  CONSTRAINT `fk_gamer_has_achievements_gamer1`
    FOREIGN KEY (`gamer_id`)
    REFERENCES `mydb`.`gamer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gamer_has_achievements_achievements1`
    FOREIGN KEY (`achievements_idachievements`)
    REFERENCES `mydb`.`achievements` (`idachievements`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
