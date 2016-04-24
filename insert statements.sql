INSERT INTO `mydb`.`course` (`name`, `abbreviation`, `description`, `flg_elective`, `category`, `type`, `credits`) 
VALUES	('Увод в програмирането', 'УП', 'описание на Увод в програмирането', 'N', 'ЯКН', 'лекция', '4.5'),
		('Функционален анализ', 'ФА', 'описание на ФА', 'Y', 'М', 'упражнение', '7'),
		('Изборна1', 'ИЗБ', 'описание на ИЗБ', 'Y', 'М', 'лекция', '5.5'),
		('Упражнение1', 'УПР', 'описание на УПР', 'N', 'ОКН', 'упражнение', '5'),
		('Практикум1', 'ПРАК', 'описание на ПРАК', 'N', 'ПМ', 'практикум', '6');

		
INSERT INTO `mydb`.`user` (`username`, `password`) 
VALUES 	('lecturer1', 'l1'),
		('lecturer2', 'l2'),
		('student1', 's1'),
		('student2', 's2');

INSERT INTO `mydb`.`lecturer` (`user_id`, `name`, `department`, `telephone_number`) 
VALUES 	('lecturer1', 'Милен Петров', 'Софтуерни технологии', '0123456789'),
		('lecturer2', 'Милен Петров2', 'Софтуерни технологии', '9876543210');


INSERT INTO `mydb`.`program` (`name`, `description`) 
VALUES ('Софтуерно инженерство', 'описание на СИ'),
	   ('Компютърни науки', 'описание на КН');	

INSERT INTO `mydb`.`room` (`room_number`, `building`) 
VALUES 	('101', 'ФМИ'),
		('210', 'ХФ');

INSERT INTO `mydb`.`student` (`student_id`, `faculty_number`, `first_name`, `last_name`, `prog_id`, `group`) 
VALUES 	('student1', '333', 'Евелина', 'Димитрова', (SELECT `id` FROM `mydb`.`program` WHERE `name` like 'Софтуерно инженерство'), '1'),
		('student2', '444', 'Евелина', 'Димитрова', (SELECT `id` FROM `mydb`.`program` WHERE `name` like 'Софтуерно инженерство'), '1');
		
INSERT INTO `mydb`.`semester` (`name`, `start_date`, `end_date`) 
VALUES 	('летен 2015/2016', '2016-02-22 00:00:00', '2016-06-10 00:00:00'),
		('зимен 2016/2017', '2016-10-01 00:00:00', '2017-02-25 00:00:00');


INSERT INTO `mydb`.`course_schedule` (`course_id`, `lecturer_id`, `program_id`, `group`, `semester_id`, `week_day`, `start_time`, `end_time`, `room_id`) 
VALUES 	((SELECT `id` FROM `mydb`.`course` WHERE `name` like 'Увод в програмирането'), 'lecturer1', (SELECT `id` FROM `mydb`.`program` WHERE `name` like 'Софтуерно инженерство'), '1', (SELECT `id` FROM `mydb`.`semester` WHERE `name` like 'летен 2015/2016'), '3', '09:00', '11:00', (SELECT `id` FROM `mydb`.`room` WHERE `room_number` = '101')),
		((SELECT `id` FROM `mydb`.`course` WHERE `name` like 'Функционален анализ'), 'lecturer1', (SELECT `id` FROM `mydb`.`program` WHERE `name` like 'Софтуерно инженерство'), '1', (SELECT `id` FROM `mydb`.`semester` WHERE `name` like 'летен 2015/2016'), '4', '10:00', '14:00', (SELECT `id` FROM `mydb`.`room` WHERE `room_number` = '101')),
		((SELECT `id` FROM `mydb`.`course` WHERE `name` like 'Изборна1'), 'lecturer1', (SELECT `id` FROM `mydb`.`program` WHERE `name` like 'Софтуерно инженерство'), '1', (SELECT `id` FROM `mydb`.`semester` WHERE `name` like 'летен 2015/2016'), '1', '10:00', '13:30', (SELECT `id` FROM `mydb`.`room` WHERE `room_number` = '101')),
		((SELECT `id` FROM `mydb`.`course` WHERE `name` like 'Упражнение1'), 'lecturer1', (SELECT `id` FROM `mydb`.`program` WHERE `name` like 'Софтуерно инженерство'), '1', (SELECT `id` FROM `mydb`.`semester` WHERE `name` like 'летен 2015/2016'), '5', '11:00', '14:00', (SELECT `id` FROM `mydb`.`room` WHERE `room_number` = '101')),
		((SELECT `id` FROM `mydb`.`course` WHERE `name` like 'Практикум1'), 'lecturer1', (SELECT `id` FROM `mydb`.`program` WHERE `name` like 'Софтуерно инженерство'), '1', (SELECT `id` FROM `mydb`.`semester` WHERE `name` like 'летен 2015/2016'), '1', '11:00', '14:00', (SELECT `id` FROM `mydb`.`room` WHERE `room_number` = '101'));



INSERT INTO `mydb`.`curriculum` (`prog_id`, `data`) VALUES ((SELECT `id` FROM `mydb`.`program` WHERE `name` like 'Софтуерно инженерство'), '{  
   "grades":[  
      {  
         "id":"1",
         "semesters":[  
            {  
               "id":"leten",
               "courses":[  
                  {  
                     "name":"UP",
                     "hours":"0+3+3",
                     "credits":"5.5"
                  },
                  {  
                     "name":"OOP",
                     "hours":"2+1+3",
                     "credits":"7"
                  }
               ]
            },
            {  
               "id":"zimen",
               "courses":[  
                  {  
                     "name":"UP2",
                     "hours":"0+3+2",
                     "credits":"2"
                  },
                  {  
                     "name":"OOP2",
                     "hours":"2+1+2",
                     "credits":"3"
                  }
               ]
            }
         ]
      },
      {  
         "id":"2",
         "semesters":[  
            {  
               "id":"leten",
               "courses":[  
                  {  
                     "name":"UP3",
                     "hours":"3+3+3",
                     "credits":"3.5"
                  },
                  {  
                     "name":"OOP3",
                     "hours":"3+1+3",
                     "credits":"6"
                  }
               ]
            },
            {  
               "id":"zimen",
               "courses":[  
                  {  
                     "name":"UP4",
                     "hours":"4+3+2",
                     "credits":"4"
                  },
                  {  
                     "name":"OOP4",
                     "hours":"4+1+2",
                     "credits":"5"
                  }
               ]
            }
         ]
      }
   ]
}');

INSERT INTO `mydb`.`curriculum` (`prog_id`, `data`) VALUES ((SELECT `id` FROM `mydb`.`program` WHERE `name` like 'Компютърни науки'), '{  
   "grades":[  
      {  
         "id":"1",
         "semesters":[  
            {  
               "id":"leten",
               "courses":[  
                  {  
                     "name":"KN_UP",
                     "hours":"0+3+3",
                     "credits":"5.5"
                  },
                  {  
                     "name":"KN_OOP",
                     "hours":"2+1+3",
                     "credits":"7"
                  }
               ]
            },
            {  
               "id":"zimen",
               "courses":[  
                  {  
                     "name":"KN_UP2",
                     "hours":"0+3+2",
                     "credits":"2"
                  },
                  {  
                     "name":"KN_OOP2",
                     "hours":"2+1+2",
                     "credits":"3"
                  }
               ]
            }
         ]
      },
      {  
         "id":"2",
         "semesters":[  
            {  
               "id":"leten",
               "courses":[  
                  {  
                     "name":"KN_UP3",
                     "hours":"3+3+3",
                     "credits":"3.5"
                  },
                  {  
                     "name":"KN_OOP3",
                     "hours":"3+1+3",
                     "credits":"6"
                  }
               ]
            },
            {  
               "id":"zimen",
               "courses":[  
                  {  
                     "name":"KN_UP4",
                     "hours":"4+3+2",
                     "credits":"4"
                  },
                  {  
                     "name":"KN_OOP4",
                     "hours":"4+1+2",
                     "credits":"5"
                  }
               ]
            }
         ]
      }
   ]
}');


INSERT INTO `mydb`.`elective_course` (`course_id`, `lecturer_id`, `hours`, `max_spaces`, `taken_spaces`)
VALUES 	((SELECT `id` FROM `mydb`.`course` WHERE `name` like 'Функционален анализ'), 'lecturer2', '2+2+2', '50', '0'),
		((SELECT `id` FROM `mydb`.`course` WHERE `name` like 'Изборна1'), 'lecturer1', '3+2+1', '100', '0');

INSERT INTO `mydb`.`electives_campaign` (`id`, `start_date`, `close_date`, `end_date`, `semester_id`) 
VALUES ('1', '2016-03-22', '2016-04-18', '2016-04-20', (SELECT `id` FROM `mydb`.`semester` WHERE `name` like 'летен 2015/2016'));


INSERT INTO `mydb`.`allowed_course` (`course_id`, `program_id`, `min_grade`) 
VALUES 	((SELECT `id` FROM `mydb`.`course` WHERE `name` like 'Функционален анализ'), (SELECT `id` FROM `mydb`.`program` WHERE `name` like 'Софтуерно инженерство'), '1'),
		((SELECT `id` FROM `mydb`.`course` WHERE `name` like 'Функционален анализ'), (SELECT `id` FROM `mydb`.`program` WHERE `name` like 'Компютърни науки'), '2');

INSERT INTO `mydb`.`event` (`abbreviation`, `title`, `description`, `date`, `start_time`, `end_time`, `room_id`) 
VALUES ('EVE1', 'event1', 'descr1', '2016-04-02', '10:00:00', '11:30:00', (SELECT `id` FROM `mydb`.`room` WHERE `room_number` = '101'));

INSERT INTO `mydb`.`event` (`abbreviation`, `title`, `description`, `date`, `start_time`, `end_time`) 
VALUES ('EVE2', 'event2', 'descr2', '2016-04-03', '11:30:00', '12:00:00');


INSERT INTO `mydb`.`enrolled_course` (`student_id`, `course_id`, `semester_id`) 
VALUES 	('student1', ((SELECT `id` FROM `mydb`.`course` WHERE `name` like 'Функционален анализ')), (SELECT `id` FROM `mydb`.`semester` WHERE `name` like 'летен 2015/2016')),
		('student1', ((SELECT `id` FROM `mydb`.`course` WHERE `name` like 'Изборна1')), (SELECT `id` FROM `mydb`.`semester` WHERE `name` like 'летен 2015/2016'));


INSERT INTO `mydb`.`news` (`title`, `text`, `img_small`, `img_large`, `creation_datetime`) 
VALUES 	('title1', 'text1', 'small1.jpg', 'large1.jpg', '2016-04-03 18:22:20'),
		('title2', 'Драги колеги,
В периода 17.07-24.07.2016 г. ФМИ ще бъде домакин на 30-тата Седмица по моделиране на Европейския консорциум за математика в индустрията (ЕКМИ). Това е престижен международен форум, на който студентите имат възможност да работят интензивно в продължение на една седмица в малки интернационални групи под ръководството на 10-15 преподаватели от водещи европейски университети по проекти, чиито теми са свързани с приложенията на математиката в индустрията, информационните технологии, биотехнологиите и др. Подробна информация за събитието, както и част от проектите, по които ще се работи, можете да откриете на уебсайта на Седмицата по моделиране ecmimw2016.fmi.uni-sofia.bg
Студентите от ФМИ, желаещи да вземат участие в събитието, трябва да изпратят на имейл адрес ecmimw2016@fmi.uni-sofia.bg следните документи в срок до 15.05.2016 г.:
CV
Мотивационно писмо
Справка за успех от следването до този момент
Препоръка от преподавател (незадължително)
Ще бъдат избрани до 12 участници от ФМИ, които трябва да са със статут на бакалаври поне в трети курс, магистри или докторанти към летния семестър на учебната 2015/2016 година.
Участниците в Седмицата по моделиране на ЕКМИ ще получат по 3 ECTS кредита.
Допълнителна информация можете да получите на имейл адрес ecmimw2016@fmi.uni-sofia.bg 
От Организационния комитет', 'small2.jpg', 'large2.jpg', '2016-04-03 18:22:20'),
		('title3', 'text3', 'small3.jpg', 'large3.jpg', '2016-04-03 18:22:20'),
		('title4', 'text4', 'small4.jpg', 'large4.jpg', '2016-04-03 18:22:20'),
		('title5', 'text5', 'small5.jpg', 'large5.jpg', '2016-04-03 18:22:20'),
		('title6', 'text6', 'small6.jpg', 'large6.jpg', '2016-04-03 18:22:20');
