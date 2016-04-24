CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- Table `course`

CREATE TABLE IF NOT EXISTS `mydb`.`course` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `abbreviation` VARCHAR(15) NOT NULL,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  `flg_elective` VARCHAR(2) NULL DEFAULT 'N',
  `category` VARCHAR(45) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `credits` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- Table `user`

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB 
DEFAULT CHARACTER SET = utf8;


-- Table `lecturer`

CREATE TABLE IF NOT EXISTS `mydb`.`lecturer` (
  `user_id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `telephone_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT
  FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`username`) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION
) ENGINE=InnoDB 
DEFAULT CHARACTER SET = utf8;


-- Table `room`

CREATE TABLE IF NOT EXISTS `mydb`.`room` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `room_number` INT(11) NULL DEFAULT NULL,
  `building` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- Table `semester`

CREATE TABLE IF NOT EXISTS `mydb`.`semester` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `start_date` DATETIME NULL DEFAULT NULL,
  `end_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- Table `program`

CREATE TABLE IF NOT EXISTS `mydb`.`program` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- Table `course_schedule`

CREATE TABLE IF NOT EXISTS `mydb`.`course_schedule` (
  `course_id` int(11) NOT NULL,
  `lecturer_id` varchar(32) NOT NULL,
  `program_id` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `flow` int(11) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `week_day` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  KEY (`course_id`),
  KEY (`lecturer_id`),
  KEY (`semester_id`),
  KEY (`room_id`),
  KEY (`program_id`),
  CONSTRAINT 
  FOREIGN KEY (`course_id`) 
  REFERENCES `course` (`id`) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION,
  CONSTRAINT
  FOREIGN KEY (`lecturer_id`) 
  REFERENCES `lecturer` (`user_id`) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION,
  CONSTRAINT
  FOREIGN KEY (`program_id`) 
  REFERENCES `program` (`id`) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION,
  CONSTRAINT 
  FOREIGN KEY (`room_id`) 
  REFERENCES `room` (`id`) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION,
  CONSTRAINT 
  FOREIGN KEY (`semester_id`) 
  REFERENCES `semester` (`id`) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION
) ENGINE=InnoDB 
DEFAULT CHARACTER SET = utf8;



-- Table `student`

CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `student_id` varchar(32) NOT NULL,
  `faculty_number` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `prog_id` int(11) NOT NULL,
  `flow` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `prog_id_idx` (`prog_id`),
  CONSTRAINT 
  FOREIGN KEY (`prog_id`) 
  REFERENCES `program` (`id`) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION,
  CONSTRAINT
  FOREIGN KEY (`student_id`) 
  REFERENCES `user` (`username`) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION
) ENGINE=InnoDB 
DEFAULT CHARACTER SET = utf8;



-- Table `enrolled_course`

CREATE TABLE IF NOT EXISTS `mydb`.`enrolled_course` (
  `student_id` VARCHAR(45) NOT NULL,
  `course_id` INT NOT NULL,
  `semester_id` INT NOT NULL,
  INDEX `course_id_idx` (`course_id` ASC),
  INDEX `semester_id_idx` (`semester_id` ASC),
  CONSTRAINT
    FOREIGN KEY (`student_id`)
    REFERENCES `mydb`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT
    FOREIGN KEY (`semester_id`)
    REFERENCES `mydb`.`semester` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Table `news`

CREATE TABLE IF NOT EXISTS `mydb`.`news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `img_small` varchar(45) DEFAULT NULL,
  `img_large` varchar(45) DEFAULT NULL,
  `creation_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB 
AUTO_INCREMENT=1 
DEFAULT CHARACTER SET = utf8;



-- Table `curriculum`

CREATE TABLE IF NOT EXISTS `mydb`.`curriculum` (
  `prog_id` INT NOT NULL,
  `data` TEXT NULL,
  INDEX `prog_id_idx` (`prog_id` ASC),
  CONSTRAINT
    FOREIGN KEY (`prog_id`)
    REFERENCES `mydb`.`program` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- TABLE `elective_course`

CREATE TABLE IF NOT EXISTS `mydb`.`elective_course` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `course_id` INT NULL,
  `lecturer_id` VARCHAR(45) NULL,
  `hours` VARCHAR(45) NULL,
  `max_spaces` INT NULL,
  `taken_spaces` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `course_id_idx` (`course_id` ASC),
  INDEX `lect_id_idx` (`lecturer_id` ASC),
  CONSTRAINT
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT
    FOREIGN KEY (`lecturer_id`)
    REFERENCES `mydb`.`lecturer` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- Table `electives_campaign`

CREATE TABLE IF NOT EXISTS `mydb`.`electives_campaign` (
  `id` INT NOT NULL,
  `start_date` DATE NULL,
  `close_date` DATE NULL,
  `end_date` DATE NULL,
  `semester_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `sem_id_idx` (`semester_id` ASC),
  CONSTRAINT
    FOREIGN KEY (`semester_id`)
    REFERENCES `mydb`.`semester` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- Table `allowed_course`

CREATE TABLE IF NOT EXISTS `mydb`.`allowed_course` (
  `course_id` INT NOT NULL,
  `program_id` INT NULL,
  `min_grade` INT NULL,
  INDEX `p_id_idx` (`program_id` ASC),
  CONSTRAINT
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT
    FOREIGN KEY (`program_id`)
    REFERENCES `mydb`.`program` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- Table `event`

CREATE TABLE IF NOT EXISTS `mydb`.`event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abbreviation` varchar(15) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(225) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT
  FOREIGN KEY (`room_id`) 
  REFERENCES `room` (`id`) 
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION
) ENGINE=InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


