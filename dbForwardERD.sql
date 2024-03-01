-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_college
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_college
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_college` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `db_college` ;

-- -----------------------------------------------------
-- Table `db_college`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_college`.`department` (
  `DEPT_CODE` VARCHAR(10) NOT NULL,
  `DEPT_NAME` VARCHAR(30) NULL DEFAULT NULL,
  `EMP_NUM` INT NULL DEFAULT NULL,
  `DEPT_ADDRESS` VARCHAR(20) NULL DEFAULT NULL,
  `DEPT_EXTENSION` VARCHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`DEPT_CODE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_college`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_college`.`course` (
  `CRS_CODE` VARCHAR(10) NOT NULL,
  `DEPT_CODE` VARCHAR(10) NOT NULL,
  `CRS_DESCRIPTION` VARCHAR(35) NULL DEFAULT NULL,
  `CRS_CREDIT` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`CRS_CODE`, `DEPT_CODE`),
  INDEX `fk_course_department1_idx` (`DEPT_CODE` ASC) VISIBLE,
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`DEPT_CODE`)
    REFERENCES `db_college`.`department` (`DEPT_CODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_college`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_college`.`class` (
  `CLASS_CODE` VARCHAR(5) NOT NULL,
  `CRS_CODE` VARCHAR(10) NOT NULL,
  `CLASS_SECTION` VARCHAR(2) NULL DEFAULT NULL,
  `CLASS_TIME` VARCHAR(20) NULL DEFAULT NULL,
  `ROOM_CODE` VARCHAR(8) NULL DEFAULT NULL,
  `PROF_NUM` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`CLASS_CODE`, `CRS_CODE`),
  INDEX `fk_class_course1_idx` (`CRS_CODE` ASC) VISIBLE,
  CONSTRAINT `fk_class_course1`
    FOREIGN KEY (`CRS_CODE`)
    REFERENCES `db_college`.`course` (`CRS_CODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_college`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_college`.`employee` (
  `EMP_NUM` INT NOT NULL,
  `EMP_LNAME` VARCHAR(15) NULL DEFAULT NULL,
  `EMP_FNAME` VARCHAR(12) NULL DEFAULT NULL,
  `EMP_INITIAL` VARCHAR(1) NULL DEFAULT NULL,
  `EMP_JOBCODE` VARCHAR(5) NULL DEFAULT NULL,
  `EMP_HIREDATE` DATETIME NULL DEFAULT NULL,
  `EMP_DOB` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`EMP_NUM`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_college`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_college`.`professor` (
  `PROF_NUM` INT NOT NULL AUTO_INCREMENT,
  `EMP_NUM` INT NOT NULL,
  `DEPT_CODE` VARCHAR(10) NOT NULL,
  `PROF_OFFICE` VARCHAR(50) NULL DEFAULT NULL,
  `PROF_EXTENSION` VARCHAR(4) NULL DEFAULT NULL,
  `PROF_HIGH_DEGREE` VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`PROF_NUM`, `EMP_NUM`, `DEPT_CODE`),
  INDEX `fk_professor_department_idx` (`DEPT_CODE` ASC) VISIBLE,
  INDEX `fk_professor_employee1_idx` (`EMP_NUM` ASC) VISIBLE,
  CONSTRAINT `fk_professor_department`
    FOREIGN KEY (`DEPT_CODE`)
    REFERENCES `db_college`.`department` (`DEPT_CODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_employee1`
    FOREIGN KEY (`EMP_NUM`)
    REFERENCES `db_college`.`employee` (`EMP_NUM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_college`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_college`.`student` (
  `STU_NUM` INT NOT NULL,
  `STU_LNAME` VARCHAR(15) NULL DEFAULT NULL,
  `STU_FNAME` VARCHAR(15) NULL DEFAULT NULL,
  `STU_INIT` VARCHAR(1) NULL DEFAULT NULL,
  `STU_DOB` DATETIME NULL DEFAULT NULL,
  `STU_HRS` INT NULL DEFAULT NULL,
  `STU_CLASS` VARCHAR(2) NULL DEFAULT NULL,
  `STU_GPA` FLOAT NULL DEFAULT NULL,
  `STU_TRANSFER` DECIMAL(10,0) NULL DEFAULT NULL,
  `DEPT_CODE` VARCHAR(10) NOT NULL,
  `STU_PHONE` VARCHAR(4) NULL DEFAULT NULL,
  `PROF_NUM` INT NULL DEFAULT NULL,
  PRIMARY KEY (`STU_NUM`, `DEPT_CODE`),
  INDEX `fk_student_department1_idx` (`DEPT_CODE` ASC) VISIBLE,
  CONSTRAINT `fk_student_department1`
    FOREIGN KEY (`DEPT_CODE`)
    REFERENCES `db_college`.`department` (`DEPT_CODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
