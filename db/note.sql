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
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `mydb`.`lecture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lecture` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `description` TEXT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_start` DATE NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_class_category_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_class_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type_person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`type_person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `slug` VARCHAR(5) NOT NULL,
  `description` TEXT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(50) NOT NULL,
  `lastname` VARCHAR(50) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `type_person_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_person_type_person1_idx` (`type_person_id` ASC) VISIBLE,
  CONSTRAINT `fk_person_type_person1`
    FOREIGN KEY (`type_person_id`)
    REFERENCES `mydb`.`type_person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`promotion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`semester`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`semester` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`grade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NULL,
  `result` DECIMAL(1,1) NOT NULL,
  `weight` DECIMAL(3,2) NOT NULL,
  `date` DATE NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `semester_id` INT NOT NULL,
  `promotion_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `teacher_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exam_semester1_idx` (`semester_id` ASC) VISIBLE,
  INDEX `fk_exam_academic_year1_idx` (`promotion_id` ASC) VISIBLE,
  INDEX `fk_grade_person1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_grade_person2_idx` (`teacher_id` ASC) VISIBLE,
  CONSTRAINT `fk_exam_semester`
    FOREIGN KEY (`semester_id`)
    REFERENCES `mydb`.`semester` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exam_promotion`
    FOREIGN KEY (`promotion_id`)
    REFERENCES `mydb`.`promotion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grade_person1`
    FOREIGN KEY (`student_id`)
    REFERENCES `mydb`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grade_person2`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `mydb`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`person_promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`person_promotion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `promotion_id` INT NOT NULL,
  `person_id` INT NOT NULL,
  INDEX `fk_person_has_academic_year_academic_year1_idx` (`promotion_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_person_promotion_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_promotion_promotion`
    FOREIGN KEY (`promotion_id`)
    REFERENCES `mydb`.`promotion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_person_promotion_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `mydb`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lecture_grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lecture_grade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lecture_id` INT NOT NULL,
  `grade_id` INT NOT NULL,
  INDEX `fk_class_has_exam_exam1_idx` (`grade_id` ASC) VISIBLE,
  INDEX `fk_class_has_exam_class1_idx` (`lecture_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_lecture_grade_lecture`
    FOREIGN KEY (`lecture_id`)
    REFERENCES `mydb`.`lecture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecture_grade_grade`
    FOREIGN KEY (`grade_id`)
    REFERENCES `mydb`.`grade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lecture_promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lecture_promotion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lecture_id` INT NOT NULL,
  `promotion_id` INT NOT NULL,
  `semester_id` INT NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_person_has_class_class1_idx` (`lecture_id` ASC) VISIBLE,
  INDEX `fk_person_has_class_academic_year1_idx` (`promotion_id` ASC) VISIBLE,
  INDEX `fk_lecture_promotion_semester1_idx` (`semester_id` ASC) VISIBLE,
  INDEX `fk_lecture_promotion_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_lecture_promotion_class`
    FOREIGN KEY (`lecture_id`)
    REFERENCES `mydb`.`lecture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecture_promotion_promotion`
    FOREIGN KEY (`promotion_id`)
    REFERENCES `mydb`.`promotion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecture_promotion_semester1`
    FOREIGN KEY (`semester_id`)
    REFERENCES `mydb`.`semester` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecture_promotion_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `mydb`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
