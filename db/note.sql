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
-- Table `mydb`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`class` (
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
-- Table `mydb`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_student_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `mydb`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
-- Table `mydb`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`teacher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `person_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_student_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `mydb`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`exam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`exam` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NULL,
  `result` DECIMAL(1,1) NOT NULL,
  `percentage` DECIMAL(2,2) NOT NULL,
  `date` DATE NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `semester_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `teacher_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exam_semester1_idx` (`semester_id` ASC) VISIBLE,
  INDEX `fk_exam_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_exam_teacher1_idx` (`teacher_id` ASC) VISIBLE,
  CONSTRAINT `fk_exam_semester`
    FOREIGN KEY (`semester_id`)
    REFERENCES `mydb`.`semester` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exam_student`
    FOREIGN KEY (`student_id`)
    REFERENCES `mydb`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exam_teacher`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `mydb`.`teacher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`academic_year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`academic_year` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exam_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_academic_year_exam1_idx` (`exam_id` ASC) VISIBLE,
  CONSTRAINT `fk_academic_year_exam`
    FOREIGN KEY (`exam_id`)
    REFERENCES `mydb`.`exam` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`person_academic_year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`person_academic_year` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `academic_year_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  INDEX `fk_person_has_academic_year_academic_year1_idx` (`academic_year_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_person_academic_year_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_academic_year_academic_year`
    FOREIGN KEY (`academic_year_id`)
    REFERENCES `mydb`.`academic_year` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_academic_year_student`
    FOREIGN KEY (`student_id`)
    REFERENCES `mydb`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`class_exam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`class_exam` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `class_id` INT NOT NULL,
  `exam_id` INT NOT NULL,
  INDEX `fk_class_has_exam_exam1_idx` (`exam_id` ASC) VISIBLE,
  INDEX `fk_class_has_exam_class1_idx` (`class_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_class_exam_class`
    FOREIGN KEY (`class_id`)
    REFERENCES `mydb`.`class` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_exam_exam`
    FOREIGN KEY (`exam_id`)
    REFERENCES `mydb`.`exam` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`class_academic_year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`class_academic_year` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `class_id` INT NOT NULL,
  `academic_year_id` INT NOT NULL,
  `semester_id` INT NOT NULL,
  `teacher_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_person_has_class_class1_idx` (`class_id` ASC) VISIBLE,
  INDEX `fk_person_has_class_academic_year1_idx` (`academic_year_id` ASC) VISIBLE,
  INDEX `fk_person_has_class_semester1_idx` (`semester_id` ASC) VISIBLE,
  INDEX `fk_person_has_class_teacher1_idx` (`teacher_id` ASC) VISIBLE,
  CONSTRAINT `fk_class_academic_year_class`
    FOREIGN KEY (`class_id`)
    REFERENCES `mydb`.`class` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_academic_year_academic_year`
    FOREIGN KEY (`academic_year_id`)
    REFERENCES `mydb`.`academic_year` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_academic_year_semester`
    FOREIGN KEY (`semester_id`)
    REFERENCES `mydb`.`semester` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_academic_year_teacher`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `mydb`.`teacher` (`id`)
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
