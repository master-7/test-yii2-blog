-- MySQL Script generated by MySQL Workbench
-- Сб. 26 сент. 2015 09:27:07
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema test-yii2-blog
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `test-yii2-blog` ;

-- -----------------------------------------------------
-- Schema test-yii2-blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test-yii2-blog` DEFAULT CHARACTER SET utf8 ;
USE `test-yii2-blog` ;

-- -----------------------------------------------------
-- Table `test-yii2-blog`.`blg_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test-yii2-blog`.`blg_user` ;

CREATE TABLE IF NOT EXISTS `test-yii2-blog`.`blg_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(128) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `salt` VARCHAR(255) NOT NULL,
  `access_token` VARCHAR(255) NULL DEFAULT NULL,
  `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test-yii2-blog`.`blg_blog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test-yii2-blog`.`blg_blog` ;

CREATE TABLE IF NOT EXISTS `test-yii2-blog`.`blg_blog` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `article` TEXT NOT NULL,
  `create_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_blg_blog_1_idx` (`user_id` ASC),
  CONSTRAINT `fk_blg_blog_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `test-yii2-blog`.`blg_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test-yii2-blog`.`blg_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test-yii2-blog`.`blg_comment` ;

CREATE TABLE IF NOT EXISTS `test-yii2-blog`.`blg_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `blog_id` INT NOT NULL,
  `comment` VARCHAR(255) NOT NULL,
  `create_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_blg_comment_1_idx` (`user_id` ASC),
  CONSTRAINT `fk_blg_comment_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `test-yii2-blog`.`blg_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;