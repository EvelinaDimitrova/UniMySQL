-- GetStudentSchedule

DELIMITER $$

DROP PROCEDURE IF EXISTS `mydb`.`GetStudentSchedule` $$
CREATE PROCEDURE `mydb`.`GetStudentSchedule` (IN `userID` VARCHAR(32))

BEGIN
-- Get mandatory courses
	SELECT cs.`week_day`, cs.`start_time`, cs.`end_time`, c.`abbreviation`, 
		   c.`name`, c.`flg_elective`,
           concat(r.`room_number`, '/', r.`building`) as location, l.`name` as lecturer,
           sem.`start_date`, sem.`end_date`, c.`type`as type_name,
           CASE WHEN c.`type` = 'лекция' THEN 'LECT'
				WHEN c.`type` = 'упражнение' THEN 'EXER'
                WHEN c.`type` = 'практикум' THEN 'PRACT'
				ELSE 'NONE' END as type_code
    FROM course_schedule cs
    JOIN course c
	ON cs.`course_id` = c.`id`
    JOIN room r
    ON cs.`room_id` = r.`id`
    JOIN lecturer l
    ON cs.`lecturer_id` = l.`user_id`
    JOIN student s
    ON cs.`program_id` = s.`prog_id`
    JOIN semester sem
    ON cs.`semester_id` = sem.`id`
	AND COALESCE(ifnull(cs.`flow`, 0), ifnull( s.`flow`, 0)) = ifnull( s.`flow`, 0)
    AND COALESCE(ifnull(cs.`group`, 0), ifnull( s.`group`, 0)) = ifnull( s.`group`, 0)
	WHERE s.`student_id` = userID
    UNION 
-- Get enrolled elective courses	
    SELECT 
		cs.`week_day`, cs.`start_time`, cs.`end_time`, c.`abbreviation`, 
 		c.`name`, c.`flg_elective`,
        concat(r.`room_number`, '/', r.`building`) as location,l.`name` as lecturer,
		sem.`start_date`, sem.`end_date`, c.`type`as type_name, 'ELECT' as type_code
	FROM enrolled_course ec
    JOIN course c
    ON ec.`course_id` = c.`id`
    JOIN semester sem
    ON ec.`semester_id` = sem.`id`
    JOIN course_schedule cs
    ON ec.`course_id` = cs.`course_id`
	JOIN room r
    ON cs.`room_id` = r.`id`
    JOIN lecturer l
    ON cs.`lecturer_id` = l.`user_id`
    WHERE ec.`student_id` = userID;
    
END $$

DELIMITER ;



-- AuthenticateUser

DELIMITER //

DROP PROCEDURE IF EXISTS `mydb`.`AuthenticateUser` //
CREATE PROCEDURE `mydb`.`AuthenticateUser` (IN `userID` VARCHAR(32), `pass` VARCHAR(32))
BEGIN
	SELECT u.`username`,
    CASE WHEN s.student_id is not null THEN 'STUD'
		 WHEN l.user_id is not null THEN 'LECT'
         ELSE 'NONE' END as role
    FROM user u
    LEFT JOIN student s
    ON u.username = s.student_id
	LEFT JOIN lecturer l
    ON u.username = l.user_id
    WHERE u.username = userID
    AND u.password = pass;
END //

DELIMITER ;


-- GetEvents

DELIMITER //

DROP PROCEDURE IF EXISTS `mydb`.`GetEvents` //
CREATE PROCEDURE `mydb`.`GetEvents`()

BEGIN
	SELECT e.`abbreviation` as abbr, e.`title` as name, e.`description` as description,
    e.`date` as event_date, e.`start_time` as start_time, e.`end_time` as end_time, 
    concat(r.`room_number`, '/', r.`building`) as location, 'EVENT' as type_code
    FROM event e
    JOIN room r
    ON e.`room_id` = r.`id`;
END //

DELIMITER ;

-- GetNewsDetail

DELIMITER //

DROP PROCEDURE IF EXISTS `mydb`.`GetNewsDetail` //
CREATE PROCEDURE `mydb`.`GetNewsDetail`(IN newsID INT)

BEGIN
	SELECT n.`id`, n.`title`,n.`text`, n.`img_large` as image, n.`creation_datetime`
    FROM news n
    WHERE n.`id` = newsID
    ORDER BY n.`id` desc;
    
END //

DELIMITER ;



-- GetNews

DELIMITER //

DROP PROCEDURE IF EXISTS `mydb`.`GetNews` //
CREATE PROCEDURE `mydb`.`GetNews`(IN newsID INT, chunkSize INT)

BEGIN
	DECLARE news_id INT;
    SET news_id = ifnull(newsID, (SELECT MAX(id) FROM news));
    
    SELECT n.`id`, n.`title`, n.`img_small` as image, n.`creation_datetime`
    FROM news n
    WHERE n.`id` < news_id
    ORDER BY n.`id` desc
    LIMIT chunkSize;
    
END //

DELIMITER ;


-- GetStudentPlan

DELIMITER //

DROP PROCEDURE IF EXISTS `mydb`.`GetStudentPlan` //
CREATE PROCEDURE `mydb`.`GetStudentPlan`(IN userId VARCHAR(32))
BEGIN
	SELECT c.`data`
    FROM curriculum c
    JOIN student s
    ON c.`prog_id` = s.`prog_id`
    WHERE s.`student_id` = userId;  
END //

DELIMITER ;

