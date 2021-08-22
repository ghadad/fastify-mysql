-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ebill_system
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ebill_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ebill_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ebill_system` ;

-- -----------------------------------------------------
-- Table `ebill_system`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ebill_system`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(25) NOT NULL,
  `password` VARCHAR(94) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `phone_no` VARCHAR(15) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `dob` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ebill_system`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ebill_system`.`admin` (
  `admin_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`admin_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `admin_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ebill_system`.`user` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ebill_system`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ebill_system`.`customer` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `customer_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ebill_system`.`user` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ebill_system`.`meter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ebill_system`.`meter` (
  `meter_id` VARCHAR(10) NOT NULL,
  `meter_total_unit` INT(11) NOT NULL,
  `maintenance_cost` INT(11) NOT NULL,
  `customer_id` INT(11) NOT NULL,
  PRIMARY KEY (`meter_id`),
  INDEX `customer_id` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `meter_ibfk_1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ebill_system`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ebill_system`.`bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ebill_system`.`bill` (
  `bill_id` INT(11) NOT NULL AUTO_INCREMENT,
  `meter_id` VARCHAR(10) NOT NULL,
  `total_bill` INT(11) NOT NULL,
  `overdues` INT(11) NOT NULL DEFAULT NULL,
  `due_date` VARCHAR(45) NOT NULL,
  `meter_unit` INT(11) NOT NULL,
  `month` ENUM('JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC') NOT NULL,
  `year` INT(11) NOT NULL,
  `status` ENUM('Paid', 'Queue', 'Overdue') NOT NULL,
  PRIMARY KEY (`bill_id`),
  INDEX `meter_id` (`meter_id` ASC) VISIBLE,
  CONSTRAINT `bill_ibfk_1`
    FOREIGN KEY (`meter_id`)
    REFERENCES `ebill_system`.`meter` (`meter_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ebill_system`.`log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ebill_system`.`log` (
  `log_id` INT(11) NOT NULL AUTO_INCREMENT,
  `log` VARCHAR(255) NOT NULL,
  `customer_id` INT(11) NOT NULL,
  PRIMARY KEY (`log_id`),
  INDEX `customer_id` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `log_ibfk_1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ebill_system`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ebill_system`.`suggestion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ebill_system`.`suggestion` (
  `suggest_id` INT(11) NOT NULL AUTO_INCREMENT,
  `suggest_subject` VARCHAR(25) NOT NULL,
  `suggestions` VARCHAR(255) NOT NULL,
  `customer_id` INT(11) NOT NULL,
  PRIMARY KEY (`suggest_id`),
  INDEX `customer_id` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `suggestion_ibfk_1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ebill_system`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ebill_system`.`wallet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ebill_system`.`wallet` (
  `wallet_id` INT(11) NOT NULL AUTO_INCREMENT,
  `wallet_amount` INT(11) NOT NULL,
  `customer_id` INT(11) NOT NULL,
  PRIMARY KEY (`wallet_id`),
  INDEX `customer_id` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `wallet_ibfk_1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ebill_system`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `ebill_system` ;

-- -----------------------------------------------------
-- Placeholder table for view `ebill_system`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ebill_system`.`invoice` (`total_bill` INT, `meter_unit` INT, `month` INT, `meter_id` INT, `customer_id` INT, `user_id` INT, `user_name` INT);

-- -----------------------------------------------------
-- View `ebill_system`.`invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebill_system`.`invoice`;
USE `ebill_system`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ebill_system`.`invoice` AS select `ebill_system`.`bill`.`total_bill` AS `total_bill`,`ebill_system`.`bill`.`meter_unit` AS `meter_unit`,`ebill_system`.`bill`.`month` AS `month`,`ebill_system`.`meter`.`meter_id` AS `meter_id`,`ebill_system`.`customer`.`customer_id` AS `customer_id`,`ebill_system`.`user`.`user_id` AS `user_id`,`ebill_system`.`user`.`user_name` AS `user_name` from (((`ebill_system`.`user` join `ebill_system`.`customer` on((`ebill_system`.`customer`.`user_id` = `ebill_system`.`user`.`user_id`))) join `ebill_system`.`meter` on((`ebill_system`.`meter`.`customer_id` = `ebill_system`.`customer`.`customer_id`))) join `ebill_system`.`bill` on((`ebill_system`.`bill`.`meter_id` = `ebill_system`.`meter`.`meter_id`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
- הנדסת קדימה של MySQL Workbench SET @OLD_UNIQUE_CHECKS = @@ UNIQUE_CHECKS, UNIQUE_CHECKS = 0; SET @OLD_FOREIGN_KEY_CHECKS = @@ FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0; SET @OLD_SQL_MODE = @@ SQL_MODE, SQL_MODE = 'ONLY_FULL_GROUP_BY, STRICT_TRANS_TABLES, NO_ZERO_IN_DATE, NO_ZERO_DATE, ERROR_FOR_DIVISION_BY_ZERO, NO_ENGINE_S; ------------------------------------------------- ----- - סכמה ebill_system ------------------------------------------------- ----- ------------------------------------------------- ----- - סכמה ebill_system ------------------------------------------------- ----- צור סכימה אם לא קיים `ebill_system` סט תקן סטנדרטי utf8mb4 COLLATE utf8mb4_0900_ai_ci; שימוש ב- 'ebill_system'; ------------------------------------------------- ----- - טבלה `ebill_system`.` user` ------------------------------------------------- ----- צור טבלה אם היא לא קיימת 'ebill_system`.`user` ( `user_id` INT (11) NOT NULL AUTO_INCREMENT, 'שם משתמש' VARCHAR (25) NOT NULL, `סיסמא` VARCHAR (94) NOT NULL, `מייל` VARCHAR (50) NOT NULL, `phone_no` VARCHAR (15) NOT NULL, `כתובת` VARCHAR (50) NOT NULL, `dob` VARCHAR (10) NOT NULL, מפתח ראשוני ('user_id')) ENGINE = InnoDB AUTO_INCREMENT = 3 ערכת תווים ברירת מחדל = utf8mb4 COLLATE = utf8mb4_0900_ai_ci; ------------------------------------------------- ----- - טבלה `ebill_system`.`admin` ------------------------------------------------- ----- צור טבלה אם לא קיים `ebill_system`.`admin` ( `admin_id` INT (11) NOT NULL AUTO_INCREMENT, `user_id` INT (11) NOT NULL, מפתח ראשוני ('admin_id'), INDEX `user_id` (` user_id` ASC) גלוי, CONSTRAINT `admin_ibfk_1` מפתח זר ('user_id') הפניות `ebill_system`.`user` (` user_id`)) ENGINE = InnoDB AUTO_INCREMENT = 2 ערכת תווים ברירת מחדל = utf8mb4 COLLATE = utf8mb4_0900_ai_ci; ------------------------------------------------- ----- - טבלה `ebill_system` .`לקוח` ------------------------------------------------- ----- צור טבלה אם היא לא קיימת `ebill_system`.` Customer` ( `customer_id` INT (11) NOT NULL AUTO_INCREMENT, `user_id` INT (11) NOT NULL, מפתח ראשוני ('לקוח_זהות'), INDEX `user_id` (` user_id` ASC) גלוי, CONSTRAINT `customer_ibfk_1` מפתח זר ('user_id') הפניות `ebill_system`.`user` (` user_id`)) ENGINE = InnoDB AUTO_INCREMENT = 2 ערכת תווים ברירת מחדל = utf8mb4 COLLATE = utf8mb4_0900_ai_ci; ------------------------------------------------- ----- - טבלה `ebill_system`.`meter` ------------------------------------------------- ----- צור טבלה אם לא קיים 'ebill_system`.`meter` ( `meter_id` VARCHAR (10) NOT NULL, `meter_total_unit` INT (11) NOT NULL, `maintenance_cost` INT (11) NOT NULL, `customer_id` INT (11) NOT NULL, מפתח ראשוני (`meter_id`), INDEX `customer_id` (` customer_id` ASC) גלוי, CONSTRAINT `meter_ibfk_1` מפתח זר (`customer_id`) הפניות `ebill_system`.` Customer` (`customer_id`) על מחיקת CASCADE עדכון CASCADE) ENGINE = InnoDB ערכת תווים ברירת מחדל = utf8mb4 COLLATE = utf8mb4_0900_ai_ci; ------------------------------------------------- ----- - טבלה `ebill_system`.` bill` ------------------------------------------------- ----- צור טבלה אם לא קיים `ebill_system`.` bill` ( `bill_id` INT (11) NOT NULL AUTO_INCREMENT, `meter_id` VARCHAR (10) NOT NULL, `total_bill` INT (11) NOT NULL, `overdues` INT (11) NOT NULL DEFAULT NULL, `due_date` VARCHAR (45) NOT NULL, `meter_unit` INT (11) NOT NULL, "חודש" ENUM ('JAN', 'FEB', 'MAR', 'APR', 'May', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', ' DEC ') NOT NULL, `year` INT (11) NOT NULL, 'status' ENUM ('בתשלום', 'תור', 'איחור') NOT NULL, מפתח ראשוני (`חשבון_זהות`), INDEX `meter_id` (` meter_id` ASC) גלוי, CONSTRAINT `bill_ibfk_1` מפתח זר (`meter_id`) הפניות `ebill_system`.`meter` (` meter_id`) עדכון CASCADE) ENGINE = InnoDB AUTO_INCREMENT = 2 ערכת תווים ברירת מחדל = utf8mb4 COLLATE = utf8mb4_0900_ai_ci; ------------------------------------------------- ----- - טבלה `ebill_system`.`log ' ------------------------------------------------- ----- צור טבלה אם לא קיים `ebill_system`.` log` ( `log_id` INT (11) NOT NULL AUTO_INCREMENT, `log` VARCHAR (255) NOT NULL, `customer_id` INT (11) NOT NULL, מפתח ראשוני (`log_id`), INDEX `customer_id` (` customer_id` ASC) גלוי, CONSTRAINT `log_ibfk_1` מפתח זר (`customer_id`) הפניות `ebill_system`.` Customer` (`customer_id`) על מחיקת CASCADE עדכון CASCADE) ENGINE = InnoDB ערכת תווים ברירת מחדל = utf8mb4 COLLATE = utf8mb4_0900_ai_ci; ------------------------------------------------- ----- - טבלה `ebill_system`.` הצעה` ------------------------------------------------- ----- צור טבלה אם היא לא קיימת `ebill_system`.` suggestion` ( `suggest_id` INT (11) NOT NULL AUTO_INCREMENT, `suggest_subject` VARCHAR (25) NOT NULL, `הצעות` VARCHAR (255) NOT NULL, `customer_id` INT (11) NOT NULL, מפתח ראשוני (`suggest_id`), INDEX `customer_id` (` customer_id` ASC) גלוי, CONSTRAINT `suggestion_ibfk_1` מפתח זר (`customer_id`) הפניות `ebill_system`.` Customer` (`customer_id`) על מחיקת CASCADE עדכון CASCADE) ENGINE = InnoDB ערכת תווים ברירת מחדל = utf8mb4 COLLATE = utf8mb4_0900_ai_ci; ------------------------------------------------- ----- - טבלה `מערכת ebill_system`.` ארנק ' ------------------------------------------------- ----- צור טבלה אם היא לא קיימת `ebill_system`.`wallet` ( `wallet_id` INT (11) NOT NULL AUTO_INCREMENT, `wallet_amount` INT (11) NOT NULL, `customer_id` INT (11) NOT NULL, מפתח ראשוני (`wallet_id`), INDEX `customer_id` (` customer_id` ASC) גלוי, CONSTRAINT `wallet_ibfk_1` מפתח זר (`customer_id`) הפניות `ebill_system`.` Customer` (`customer_id`) על מחיקת CASCADE עדכון CASCADE) ENGINE = InnoDB ערכת תווים ברירת מחדל = utf8mb4 COLLATE = utf8mb4_0900_ai_ci; שימוש ב- 'ebill_system'; ------------------------------------------------- ----- - טבלת מצייני מיקום לצפייה `ebill_system`. חשבונית ------------------------------------------------- ----- צור טבלה אם לא קיים `ebill_system`.`vice '(` total_bill` INT, `meter_unit` INT,` month` INT, `meter_id` INT,` customer_id` INT, `user_id` INT,` user_name` INT); ------------------------------------------------- ----- - הצג `ebill_system`.` חשבונית` ------------------------------------------------- ----- להפיל טבלה אם קיים `ebill_system`.`vovoice`; שימוש ב- 'ebill_system'; צור או החלף אלגוריתם = DEFINER בלתי מוגדר = `root`@` localhost` תצוגת מגדיר אבטחת SQL אבטחת `ebill_system`. `.`מeter_unit` AS` meter_unit`, `ebill_system`.`bill`.`month` AS` month`, `ebill_system`.`meter`.`meter_id` AS` meter_id`, `ebill_system`.` customer '. `customer_id` AS` customer_id`, `ebill_system`.`user`.`user_id` AS` user_id`, `ebill_system`.`user`.`user_name` AS` user_name` from (((`ebill_system`.`user` הצטרף ל'ebill_system`.`customer` ב- ((`ebill_system`.`customer`.`user_id` =` ebill_system`.`user`.`user_id`))) הצטרף ל- ebill_system`.`meter` ב- ((`ebill_system `.`meter`.`customer_id` =` ebill_system`.`customer`.`customer_id`))) הצטרף ל- `ebill_system`.`bill` ב- ((` ebill_system`.`bill`.`meter_id` = `ebill_system` .`מטר`.`מטר_יד`))); SET SQL_MODE =@OLD_SQL_MODE; SET FOREIGN_KEY_CHECKS =@OLD_FOREIGN_KEY_CHECKS; SET UNIQUE_CHECKS =@OLD_UNIQUE_CHECKS;