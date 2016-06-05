CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administration_contacts`
--

DROP TABLE IF EXISTS `administration_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administration_contacts` (
  `category` varchar(45) NOT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administration_contacts`
--

LOCK TABLES `administration_contacts` WRITE;
/*!40000 ALTER TABLE `administration_contacts` DISABLE KEYS */;
INSERT INTO `administration_contacts` VALUES ('Деканат','[  \n            {  \n               \"name\":\"доц. д-р Евгения Димитрова Великова\",\n               \"job\":\"Декан\",\n			   \"contactData\":  \n				  {  \n					 \"phone\":\"123456\",\n					 \"email\":\"asd@asd.asd\",  \n					 \"room\":\"333\",\n					 \"time\":\"11:00-15:30\"\n				  }\n            },\n			{  \n               \"name\":\"доц.  д-р  Калин Георгиев\",\n               \"job\":\"Заместник-декан по учебната дейност - бакалвърски програми\",\n			   \"contactData\":  \n				  {  \n					 \"phone\":\"123456789\",\n					 \"email\":\"qwe@asd.asd\",  \n					 \"room\":\"111\",\n					 \"time\":\"10:00-12:30\"\n				  }\n            }\n			]'),('Инспектори','[ \n            {  \n               \"name\":\"Росица Банкова\",\n               \"job\":\"главен инспектор\",\n			   \"contactData\":  \n				  {  \n					 \"phone\":\"123456\",\n					 \"email\":\"asd@asd.asd\",  \n					 \"room\":\"333\",\n					 \"time\":\"11:00-15:30\"\n				  }\n            },\n			{  \n               \"name\":\"Виолета Иванова\",\n               \"job\":\"административен секретар\",\n			   \"contactData\":  \n				  {  \n					 \"phone\":\"123456789\",\n					 \"email\":\"qwe@asd.asd\",  \n					 \"room\":\"111\",\n					 \"time\":\"10:00-12:30\"\n				  }\n            }\n			]');
/*!40000 ALTER TABLE `administration_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allowed_course`
--

DROP TABLE IF EXISTS `allowed_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allowed_course` (
  `course_id` int(11) NOT NULL,
  `program_id` int(11) DEFAULT NULL,
  `min_grade` int(11) DEFAULT NULL,
  KEY `p_id_idx` (`program_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `allowed_course_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `allowed_course_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allowed_course`
--

LOCK TABLES `allowed_course` WRITE;
/*!40000 ALTER TABLE `allowed_course` DISABLE KEYS */;
INSERT INTO `allowed_course` VALUES (2,1,1),(2,2,1),(1,NULL,1),(3,2,1),(6,1,2),(7,1,2);
/*!40000 ALTER TABLE `allowed_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `abbreviation` varchar(15) NOT NULL,
  `description` text,
  `flg_elective` varchar(2) DEFAULT 'N',
  `category` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `credits` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Увод в програмирането','УП','описание на Увод в програмирането','N','ЯКН','лекция',4.5),(2,'Функционален анализ','ФА','описание на ФА','Y','М','упражнение',7),(3,'Изборна1','ИЗБ','описание на ИЗБ','Y','М','лекция',5.5),(4,'Упражнение1','УПР','описание на УПР','N','ОКН','упражнение',5),(5,'Практикум1','ПРАК','описание на ПРАК','N','ПМ','практикум',6),(6,'Изборна2 Изборна2 Изборна2 Изборна2','ИЗБ2','Утвърдил: …………………..\n /Декан ФМИ/\nУтвърден от Факултетен съвет\nс протокол № 12 / 16.12.2013\nСОФИЙСКИ УНИВЕРСИТЕТ “СВ. КЛИМЕНТ ОХРИДСКИ”\nФакултет по Математика и Информатика\nСпециалност /и/: Приложна математика; Математика ; Информатика , Инф.\nСистеми , Комп. Науки , Софт. Инж.\nУЧЕБНА ПРОГРАМА\nДисциплина: Увод в статистиката\nИзбираема дисциплина\nПреподавател: доц. Марусия Божкова\nАсистент: ас. Деница Григорова\nУчебна заетост Форма Хорариум\nАудиторна\nзаетост\nЛекции 30\nСеминарни упражнения 30\nПрактически упражнения (хоспетиране)\nОбща аудиторна заетост 60\nИзвънаудиторна\nзаетост\nПодготовка на домашни работи 30\nКонтролни работи и подготовка за тях 30\nУчебен проект\nСамостоятелна работа в библиотека или с интернет\nресурси\nДоклад/Презентация\nПодготовка за изпит 30\nОбща извънаудиторна заетост 90\nОБЩА ЗАЕТОСТ 150\nКредити аудиторна заетост 2\nКредити извънаудиторна заетост 3\nОБЩО ЕСТК 5\nВ 5 2 2\n2\n№ Формиране на оценката по дисциплината1 % от оценката\n1. Контролни работи 60\n2. Участие в час\n3. Домашни работи\n4. Учебен проект\n5. Тестова проверка\n6. Текуша самостоятелна работа /контролно\n7. Workshops {информационно търсене и\nколективно обсъждане на доклади и реферати)\n8.\n9.\n10.\n11. Изпит – практика (решаване на задачи) 40\n12. Изпит - теория\nАнотация на учебната дисциплина:\nЦелта на курса е да запознае студентите с основните методи на вероятностите и\nстатистиката и преди всичко да развие ефективни умения за общуване на базата\nна статистическите методи на оценяване, проверка на хипотези и регресионен\nанализ. С придобитите знания се цели: Да се стимулира формирането на критично\nмислене, където статистическото знание е необходимо за разкриване на\nдоказателства; Да се наблегне на правилното използване на статистическите\nметоди при анализ на големи обеми от данни; Да се представят примери,\nотнасящи се до други области (икономика, техника, социология, политически\nнауки и др.).\nПредварителни изисквания:\nИзискват се курсове по диференциално и интегрално смятане. Предназначен е за\nбакалаври 1 курс.\nОчаквани резултати:\nСтудентите ще се запознаят с основни понятия, идеи и математически резултати,\nна които се базира съвременната математическата статистика. Очаква се\nстудентите да придобият практически умения за решаване на задачи с реални\nданни от различни области.\n\n1 В зависимост от спецификата на учебната дисциплина и изискванията на преподавателя е\nвъзможно да се добавят необходимите форми, или да се премахнат ненужните. \n3\nУчебно съдържание\n№ Тема: Хорариум\n1 Графични методи за описание на данни 3\n2 Описание на данни чрез числови характеристики 3\n3 Вероятности и вероятностни разпределения 3\n4. Дискретни разпределения 3\n5. Нормално разпределение и други непрекъснати\nразпределения.\n3\n6. Извадкови разпределения 3\n7. Оценяване при достатъчно големи по обем извадки 3\n8. Проверка на хипотези при достатъчно големи по обем извадки 3\n9. Статистически изводи при малки по обем извадки 3\n10. Линейна регресия и корелация 3\nКонспект за изпит\n№ Въпрос\n1 Графични методи за описание на данни: хистограма, диаграми и др.\n2 Описание на данни чрез числови характеристики: мерки за централната тенденция и\nразсейването, стандартно отклонение и др.\n3 Вероятности и вероятностни разпределения: събития, условна вероятност и\nнезависимост. Събиране на вероятности\n4. Случайни величини – очакване, дисперсия и стандартно отклонение.\n5. Някои по-важни дискретни разпределения – биномно, Поасоново, хипергеометрично\nи връзки между тях.\n6. Непрекъснати разпределения – нормално, равномерно, експоненциално\nразпределения.\n7. Извадкови разпределения и статистики. Средно на популацията и медиана.\nЦентрална гранична теорема.\n8. Статистически изводи при достатъчно големи по обем извадки. Видове\nстатистически оценки- точкови и интервални.\n9. Оценки на популационното средно, дисперсия и стандартно отклонение – точкови и\nдоверителни интервали. Оценяване на разлика между две средни.\n10. Проверка на хипотези при достатъчно големи по обем извадки- проверка на\nхипотези относно средното на популацията и разлика между две популационни\nсредни.\n11. Статистически изводи при малки по обем извадки за популационното средно,\nразлика между две средни. Доверителни интервали. Статистически изводи при\nмалки по обем извадки за дисперсията на популацията. Сравняване на две\nдисперсии.\n12. Линейна регресия и корелация. Линейни вероятностни модели. Метод на най-\nмалките квадрати.\n4\nБиблиография\nОсновна:\n1. Димитров, Б. и Н. Янев (1990). Теория на вероятностите и математическа\nстатистика. София: Университетско издателство “Св. Кл. Охридски”.\n2. W. Mendenhall, R. Beaver, B. Beaver, Introduction to Probability and Statistics, 11th\ned., Thompson Learning Inc., Brooks/Cole, 2003.\n3. R. Hogg, A.Kreig, Introduction to Mathematical Statistics, 5th ed., Prentice Hall, Inc.,\nEnglewood Clifs, NJ, 1995.\nДопълнителна:\nДата: 4.06.2013 г. Съставил: М. Божкова\nПрието на катедрен съвет на 27.05.2013 г, Протокол №13.','Y','ОКН','упражнение',6.5),(7,'Изборна3','ИЗБ3','описание на ИЗБ3','Y','ЯКН','практикум',8),(8,'Изборна4','ИЗБ4','описание на ИЗБ3','Y','ОКН','упражнение',3),(9,'Изборна5','ИЗБ5','описание на ИЗБ3','Y','ЯКН','практикум',9),(10,'Изборна6','ИЗБ6','описание на ИЗБ3','Y','ОКН','лекция',6);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_schedule`
--

DROP TABLE IF EXISTS `course_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_schedule` (
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
  KEY `course_id` (`course_id`),
  KEY `lecturer_id` (`lecturer_id`),
  KEY `semester_id` (`semester_id`),
  KEY `room_id` (`room_id`),
  KEY `program_id` (`program_id`),
  CONSTRAINT `course_schedule_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `course_schedule_ibfk_2` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `course_schedule_ibfk_3` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `course_schedule_ibfk_4` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `course_schedule_ibfk_5` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_schedule`
--

LOCK TABLES `course_schedule` WRITE;
/*!40000 ALTER TABLE `course_schedule` DISABLE KEYS */;
INSERT INTO `course_schedule` VALUES (1,'lecturer1',1,1,NULL,1,3,'09:00:00','11:00:00',1),(2,'lecturer1',2,1,NULL,2,4,'10:00:00','14:00:00',1),(4,'lecturer1',1,1,NULL,1,5,'11:00:00','14:00:00',1),(5,'lecturer1',1,1,NULL,1,1,'11:00:00','14:00:00',1),(3,'lecturer1',NULL,NULL,NULL,2,3,'12:00:00','17:00:00',2),(6,'lecturer1',NULL,NULL,NULL,2,5,'08:00:00','16:00:00',2),(6,'lecturer1',NULL,NULL,NULL,2,1,'11:00:00','16:00:00',2),(2,'lecturer1',2,NULL,NULL,2,7,'10:00:00','14:00:00',NULL);
/*!40000 ALTER TABLE `course_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum` (
  `prog_id` int(11) NOT NULL,
  `data` text,
  KEY `prog_id_idx` (`prog_id`),
  CONSTRAINT `curriculum_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `program` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (1,'{  \n   \"grades\":[  \n      {  \n         \"id\":\"1\",\n         \"semesters\":[  \n            {  \n               \"id\":\"leten\",\n               \"courses\":[  \n                  {  \n                     \"name\":\"UP\",\n                     \"hours\":\"0+3+3\",\n                     \"credits\":\"5.5\"\n                  },\n                  {  \n                     \"name\":\"OOP\",\n                     \"hours\":\"2+1+3\",\n                     \"credits\":\"7\"\n                  }\n               ]\n            },\n            {  \n               \"id\":\"zimen\",\n               \"courses\":[  \n                  {  \n                     \"name\":\"UP2\",\n                     \"hours\":\"0+3+2\",\n                     \"credits\":\"2\"\n                  },\n                  {  \n                     \"name\":\"OOP2\",\n                     \"hours\":\"2+1+2\",\n                     \"credits\":\"3\"\n                  }\n               ]\n            }\n         ]\n      },\n      {  \n         \"id\":\"2\",\n         \"semesters\":[  \n            {  \n               \"id\":\"leten\",\n               \"courses\":[  \n                  {  \n                     \"name\":\"UP3\",\n                     \"hours\":\"3+3+3\",\n                     \"credits\":\"3.5\"\n                  },\n                  {  \n                     \"name\":\"OOP3\",\n                     \"hours\":\"3+1+3\",\n                     \"credits\":\"6\"\n                  }\n               ]\n            },\n            {  \n               \"id\":\"zimen\",\n               \"courses\":[  \n                  {  \n                     \"name\":\"UP4\",\n                     \"hours\":\"4+3+2\",\n                     \"credits\":\"4\"\n                  },\n                  {  \n                     \"name\":\"OOP4\",\n                     \"hours\":\"4+1+2\",\n                     \"credits\":\"5\"\n                  }\n               ]\n            }\n         ]\n      }\n   ]\n}'),(2,'{  \n   \"grades\":[  \n      {  \n         \"id\":\"1\",\n         \"semesters\":[  \n            {  \n               \"id\":\"leten\",\n               \"courses\":[  \n                  {  \n                     \"name\":\"KN_UP\",\n                     \"hours\":\"0+3+3\",\n                     \"credits\":\"5.5\"\n                  },\n                  {  \n                     \"name\":\"KN_OOP\",\n                     \"hours\":\"2+1+3\",\n                     \"credits\":\"7\"\n                  }\n               ]\n            },\n            {  \n               \"id\":\"zimen\",\n               \"courses\":[  \n                  {  \n                     \"name\":\"KN_UP2\",\n                     \"hours\":\"0+3+2\",\n                     \"credits\":\"2\"\n                  },\n                  {  \n                     \"name\":\"KN_OOP2\",\n                     \"hours\":\"2+1+2\",\n                     \"credits\":\"3\"\n                  }\n               ]\n            }\n         ]\n      },\n      {  \n         \"id\":\"2\",\n         \"semesters\":[  \n            {  \n               \"id\":\"leten\",\n               \"courses\":[  \n                  {  \n                     \"name\":\"KN_UP3\",\n                     \"hours\":\"3+3+3\",\n                     \"credits\":\"3.5\"\n                  },\n                  {  \n                     \"name\":\"KN_OOP3\",\n                     \"hours\":\"3+1+3\",\n                     \"credits\":\"6\"\n                  }\n               ]\n            },\n            {  \n               \"id\":\"zimen\",\n               \"courses\":[  \n                  {  \n                     \"name\":\"KN_UP4\",\n                     \"hours\":\"4+3+2\",\n                     \"credits\":\"4\"\n                  },\n                  {  \n                     \"name\":\"KN_OOP4\",\n                     \"hours\":\"4+1+2\",\n                     \"credits\":\"5\"\n                  }\n               ]\n            }\n         ]\n      }\n   ]\n}');
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elective_course`
--

DROP TABLE IF EXISTS `elective_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elective_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `lecturer_id` varchar(45) DEFAULT NULL,
  `semester_id` int(11) NOT NULL,
  `hours` varchar(45) DEFAULT NULL,
  `max_spaces` int(11) DEFAULT NULL,
  `taken_spaces` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id_idx` (`course_id`),
  KEY `lect_id_idx` (`lecturer_id`),
  KEY `semester_id_idx` (`semester_id`),
  CONSTRAINT `elective_course_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `elective_course_ibfk_2` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `elective_course_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elective_course`
--

LOCK TABLES `elective_course` WRITE;
/*!40000 ALTER TABLE `elective_course` DISABLE KEYS */;
INSERT INTO `elective_course` VALUES (1,2,'lecturer2',2,'2+2+2',50,9),(2,3,'lecturer1',2,'3+2+1',100,100),(3,6,'lecturer1',2,'3+3+3',75,74),(4,7,'lecturer1',2,'3+0+3',75,0),(5,8,'lecturer1',2,'2+3+3',75,0),(6,9,'lecturer1',2,'1+3+0',75,0),(7,10,'lecturer1',2,'4+3+0',75,0);
/*!40000 ALTER TABLE `elective_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electives_campaign`
--

DROP TABLE IF EXISTS `electives_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `electives_campaign` (
  `id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sem_id_idx` (`semester_id`),
  CONSTRAINT `electives_campaign_ibfk_1` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electives_campaign`
--

LOCK TABLES `electives_campaign` WRITE;
/*!40000 ALTER TABLE `electives_campaign` DISABLE KEYS */;
INSERT INTO `electives_campaign` VALUES (1,'2016-03-22 00:00:00','2016-04-18 00:00:00','2016-04-20 00:00:00',1),(2,'2016-04-21 00:00:00','2016-07-01 00:00:00','2016-07-03 00:00:00',2);
/*!40000 ALTER TABLE `electives_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolled_course`
--

DROP TABLE IF EXISTS `enrolled_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolled_course` (
  `student_id` varchar(45) NOT NULL,
  `course_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  KEY `course_id_idx` (`course_id`),
  KEY `semester_id_idx` (`semester_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `enrolled_course_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `enrolled_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `enrolled_course_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_course`
--

LOCK TABLES `enrolled_course` WRITE;
/*!40000 ALTER TABLE `enrolled_course` DISABLE KEYS */;
INSERT INTO `enrolled_course` VALUES ('student1',2,1),('student1',3,1),('student1',2,2);
/*!40000 ALTER TABLE `enrolled_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
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
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (2,'EVE2','event2','descr2','2016-04-03','11:30:00','12:00:00',NULL),(5,'EVE5','event5','descr5','2016-05-02','14:00:00','18:30:00',2),(10,'abbr5','title 5','descccc\n','2016-08-15','14:26:00','21:30:00',2),(11,'abbr01','title01','desccc','2016-07-14','09:40:00','10:43:00',2),(12,'abbr02','title02','ghggg','2016-09-15','10:42:00','14:38:00',2),(18,'ev-test','ev-test','2016-09-30','2016-09-30','10:31:00','10:36:00',NULL),(20,'abbr','title','','2016-05-25','11:39:00','15:39:00',NULL),(21,'vv','xx','gg','2016-05-25','11:59:00','15:07:00',NULL),(22,'1234567890','qwertyuiop qwertyuo qwe','ggggvgb f d d d d  d dbjcd djd djd dhd djx dhd d','2016-05-25','13:27:00','18:27:00',NULL);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecturer` (
  `user_id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `contacts` text,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `lecturer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES ('lecturer1','доц. д-р Милен Петров','Софтуерни технологии','{  \r          \"phone\":\"123456\",\r          \"email\":\"asd@asd.asd\",  \r 		 \"room\":\"333\",\r          \"time\":\"11:00-15:30\"\r       }'),('lecturer2','доц. д-р Милен Петров2','Софтуерни технологии','{  \r          \"phone\":\"123456789\",\r          \"email\":\"qwe@asd.asd\",  \r 		 \"room\":\"111\",\r          \"time\":\"10:00-12:30\"\r       }'),('lecturer3','проф. д-р Красен Стефанов','Информационни технологии',' {  \r          \"phone\":\"987654\",\r          \"email\":\"zxc@asd.asd\",  \r 		 \"room\":\"222\",\r          \"time\":\"12:00-14:30\"\r       }');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `text` text,
  `image` varchar(45) DEFAULT NULL,
  `creation_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (2,'title2','Драги колеги,\nВ периода 17.07-24.07.2016 г. ФМИ ще бъде домакин на 30-тата Седмица по моделиране на Европейския консорциум за математика в индустрията (ЕКМИ). Това е престижен международен форум, на който студентите имат възможност да работят интензивно в продължение на една седмица в малки интернационални групи под ръководството на 10-15 преподаватели от водещи европейски университети по проекти, чиито теми са свързани с приложенията на математиката в индустрията, информационните технологии, биотехнологиите и др. Подробна информация за събитието, както и част от проектите, по които ще се работи, можете да откриете на уебсайта на Седмицата по моделиране ecmimw2016.fmi.uni-sofia.bg\nСтудентите от ФМИ, желаещи да вземат участие в събитието, трябва да изпратят на имейл адрес ecmimw2016@fmi.uni-sofia.bg следните документи в срок до 15.05.2016 г.:\nCV\nМотивационно писмо\nСправка за успех от следването до този момент\nПрепоръка от преподавател (незадължително)\nЩе бъдат избрани до 12 участници от ФМИ, които трябва да са със статут на бакалаври поне в трети курс, магистри или докторанти към летния семестър на учебната 2015/2016 година.\nУчастниците в Седмицата по моделиране на ЕКМИ ще получат по 3 ECTS кредита.\nДопълнителна информация можете да получите на имейл адрес ecmimw2016@fmi.uni-sofia.bg \nОт Организационния комитет','large2.jpg','2016-04-03 18:22:20'),(6,'title6','text6','large6.jpg','2016-04-03 18:22:20'),(8,'t8','text8','News_12_LargeImage425297619.jpg','2016-04-28 18:36:03'),(10,'news02','news02 text',NULL,'2016-04-28 18:40:02'),(11,'news02','news02 text',NULL,'2016-04-28 18:40:50'),(12,'news03','news03 text','News_13_LargeImage-1469167147.jpg','2016-04-28 18:43:36'),(13,'news04','news04 text',NULL,'2016-04-28 18:46:07'),(14,'qwe','qwerty','asdf.jpg','2016-04-28 18:47:13'),(15,'news07','news 07','News_15_LargeImage-714823661.jpg','2016-04-28 18:51:08'),(16,'ggg','vgfddf','News_16_LargeImage-714823661.jpg','2016-04-29 09:29:06'),(17,'eve','eveto','News_17_LargeImage-714823661.jpg','2016-04-29 09:58:22'),(22,'news1','news description1','News_22_LargeImage2010143710.jpg','2016-05-04 17:39:56'),(23,'news2','news2 \nsome\n\ndescription \nmultiline ','News_23_LargeImage2010143710.jpg','2016-05-04 17:47:49'),(27,'news3 no image','',NULL,'2016-05-04 17:52:49'),(28,'news 001','text',NULL,'2016-05-22 15:38:10'),(29,'news 001','text',NULL,'2016-05-22 15:38:25'),(30,'news 001','text',NULL,'2016-05-22 15:39:25'),(31,'news 001','text',NULL,'2016-05-22 15:41:56'),(32,'news 001','text',NULL,'2016-05-22 15:42:58'),(33,'news 001','text',NULL,'2016-05-22 15:44:05'),(34,'news 001','text',NULL,'2016-05-22 15:45:30'),(35,'news 001','text',NULL,'2016-05-22 15:46:05'),(36,'news 001','text',NULL,'2016-05-22 15:47:02'),(39,'news 003','text',NULL,'2016-05-22 15:48:48'),(40,'news 003','text',NULL,'2016-05-22 15:49:26'),(41,'news 003','text',NULL,'2016-05-22 15:49:29'),(43,'news 004','text',NULL,'2016-05-22 15:49:40'),(45,'news 005','sgjz','News_45_LargeImage-714823661.jpg','2016-05-22 16:00:01'),(47,'some very random tittle that will take some','Факултетът по математика и информатика на Софийски университет „Св. Климент Охридски“ има удоволствието, да Ви покани, да посетите кратък курс по Анализ на оцеляването (Survival analysis) в периода 18-20 юли 2016 г. Лекторите са Лаура Антолини (доц. по медицинска статистистика) и Давиде Бернаскони (постдокторант) от Университета Милано-Бикока, Милано, Италия.Факултетът по математика и информатика на Софийски университет „Св. Климент Охридски“ има удоволствието, да Ви покани, да посетите кратък курс по Анализ на оцеляването (Survival analysis) в периода 18-20 юли 2016 г. Лекторите са Лаура Антолини (доц. по медицинска статистистика) и Давиде Бернаскони (постдокторант) от Университета Милано-Бикока, Милано, Италия.Факултетът по математика и информатика на Софийски университет „Св. Климент Охридски“ има удоволствието, да Ви покани, да посетите кратък курс по Анализ на оцеляването (Survival analysis) в периода 18-20 юли 2016 г. Лекторите са Лаура Антолини (доц. по медицинска статистистика) и Давиде Бернаскони (постдокторант) от Университета Милано-Бикока, Милано, Италия.Факултетът по математика и информатика на Софийски университет „Св. Климент Охридски“ има удоволствието, да Ви покани, да посетите кратък курс по Анализ на оцеляването (Survival analysis) в периода 18-20 юли 2016 г. Лекторите са Лаура Антолини (доц. по медицинска статистистика) и Давиде Бернаскони (постдокторант) от Университета Милано-Бикока, Милано, Италия.','News_47_LargeImage-714823661.jpg','2016-05-22 16:51:12'),(49,'some very random tittle that will take some','x',NULL,'2016-05-23 15:35:47'),(50,'ddd','dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd,ddddddddff',NULL,'2016-05-27 10:28:33'),(51,'hhehdbdb','ehdhrhdh',NULL,'2016-05-27 10:33:37'),(52,'hrhrhd','hrdhhdhd','News_52_LargeImage16541165.jpg','2016-05-27 10:33:57'),(54,'tgg','gvhh\nffgg','News_54_LargeImage16541165.jpg','2016-05-31 19:53:43');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'Софтуерно инженерство','описание на СИ'),(2,'Компютърни науки','описание на КН');
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` int(11) DEFAULT NULL,
  `building` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,101,'ФМИ'),(2,210,'ХФ');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (1,'летен 2015/2016','2016-02-22 00:00:00','2016-06-10 00:00:00'),(2,'зимен 2016/2017','2016-10-01 00:00:00','2017-02-25 00:00:00');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` varchar(32) NOT NULL,
  `faculty_number` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `prog_id` int(11) NOT NULL,
  `flow` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `prog_id_idx` (`prog_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `program` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `user` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('student1',333,'Евелина','Димитрова',1,NULL,1,1),('student2',444,'Евелина','Димитрова',1,NULL,1,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(32) NOT NULL,
  `password` varchar(100) NOT NULL,
  `key` varchar(45) DEFAULT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'NONE',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin1','6bd9fd77f7cc4501aef3cf8246a97ff14e426a65','81cf6be3','ADMN'),('eve_test','69ae06fbb6a20fe0482e50a79248f38a6d838877','44c028d9','LECT'),('lecturer1','69ae06fbb6a20fe0482e50a79248f38a6d838877','44c028d9','LECT'),('lecturer_test','af9b8107a7bcbbd1103e457f892bd586dc2d632e','1a2a4a45','LECT'),('lecturer_test1','55306791eb5945fad41618fa1f9cb176cca4bc1f','fd630b6b','LECT'),('student1','94518cd254953c65dba0062fb76ed3f7793a8d20','89cb12e1','STUD'),('student2','94518cd254953c65dba0062fb76ed3f7793a8d20','89cb12e1','STUD'),('test_user','c920fa612bca005e8996b66f4f2821e8146ee3ce','9a33879b','STUD'),('user123','eb42d3c782dc1fe0714a71aaa46d12256accaf59','3d5e3d8d','STUD'),('user123456','d1a9f380a8ae7435da9967c06e458de7b0f132a2','fa849cdb','STUD');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddEvent`(IN evAbbr VARCHAR(15), evTitle VARCHAR(45), evDescr VARCHAR(225), evDate DATE, 
								   evStartTime TIME, evEndTime TIME, evRoom INT)
BEGIN
	INSERT INTO `mydb`.`event` (`abbreviation`, `title`, `description`, `date`, `start_time`, `end_time`, `room_id`) 
	VALUES (evAbbr, evTitle, evDescr, evDate, evStartTime, evEndTime, evRoom);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddNews`(IN newsTitle VARCHAR(45), newsText TEXT)
BEGIN
    INSERT INTO `mydb`.`news` (`title`, `text`, `creation_datetime`) 
    VALUES (newsTitle, newsText, (SELECT sysdate()));
    
    SELECT * FROM `mydb`.`news` WHERE `id` = last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNewsImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddNewsImage`(IN newsId INT, newsImage VARCHAR(45))
BEGIN
	UPDATE `mydb`.`news` SET `image`= ifnull(newsImage, "") WHERE `id`= newsId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AuthenticateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AuthenticateUser`(IN `userId` VARCHAR(32))
BEGIN
	SELECT u.`username`, u.`password`, u.`key`, u.`role`
    FROM user u
    WHERE u.`username` = userID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelCourse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CancelCourse`(IN userId VARCHAR(32), courseId INT)
BEGIN
	DELETE FROM `mydb`.`enrolled_course`
    WHERE `student_id` = userId
    AND `course_id` = courseId
    AND `semester_id` = (SELECT max(id) FROM semester);  
    
    UPDATE `mydb`.`elective_course` SET `taken_spaces`=`taken_spaces` - 1
    WHERE `course_id` = courseId
    AND `semester_id` = (SELECT max(id) FROM semester);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CreateUser`(IN `userId` VARCHAR(32), `pass` VARCHAR(100), `hashKey` VARCHAR(32), `userRole` VARCHAR(10))
BEGIN
	INSERT INTO `user`(`username`, `password`, `key`, `role`)
    VALUES (userId, pass, hashKey, userRole);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DeleteEvent`(IN eventId INT)
BEGIN
	DELETE FROM `mydb`.`event`
    WHERE `id` = eventId;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteNews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DeleteNews`(IN newsId INT)
BEGIN
    DELETE FROM `mydb`.`news`
    WHERE `id` = newsId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EnrollCourse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `EnrollCourse`(IN userId VARCHAR(32), courseId INT)
BEGIN
	INSERT INTO `mydb`.`enrolled_course` (`student_id`, `course_id`, `semester_id`)
    VALUES (userId, courseId, (SELECT max(id) FROM semester));
    
    UPDATE `mydb`.`elective_course` SET `taken_spaces`=`taken_spaces` + 1
    WHERE `course_id` = courseId
    AND `semester_id` = (SELECT max(id) FROM semester);  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAdministrationContacts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetAdministrationContacts`()
BEGIN
	SELECT ac.`category`, ac.`data`
    FROM administration_contacts ac;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCurrentSemester` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetCurrentSemester`()
BEGIN
	SELECT id
    FROM semester s
    WHERE SYSDATE() BETWEEN s.`start_date` AND s.`end_date`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetElectiveCourses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetElectiveCourses`(IN userId VARCHAR(32))
BEGIN
	DECLARE progId INT;
    DECLARE usrGrade INT;
    DECLARE semId INT;
    DECLARE closeDate DATE;
    DECLARE isClosed BOOL;
    
    SET progId = (SELECT prog_id FROM student WHERE student_id = userId);  
    SET usrGrade = (SELECT grade FROM student WHERE student_id = userId);
    -- Get current semester
 	SET semId = (SELECT max(id) FROM semester);
    
    SET closeDate = (SELECT close_date
    FROM electives_campaign
    WHERE semester_id  = (SELECT max(id) FROM semester));
    
    SET isClosed = closeDate < sysdate();

	SELECT 
    *
FROM
    (SELECT 
        c.`id`,
            c.`name`,
            c.`description`,
            c.`category`,
            c.`credits`,
            l.`name` AS lecturer,
            ec.`hours`,
            IFNULL(ac_program.`min_grade`, 0) AS min_grade,
            CASE
                WHEN ec.`max_spaces` - ec.`taken_spaces` > 0 THEN 'true'
                ELSE 'false'
            END AS has_free_spaces,
            CASE
                WHEN ac_program.`course_id` IS NOT NULL THEN 'true'
                ELSE 'false'
            END AS is_for_my_program,
            CASE
                WHEN ac_program_grade.`course_id` IS NOT NULL THEN 'true'
                ELSE 'false'
            END AS is_for_my_grade,
            CASE
                WHEN enrolled.`course_id` IS NOT NULL THEN 'true'
                ELSE 'false'
            END AS is_enrolled,
            temp.result
    FROM
        elective_course ec
    JOIN course c ON ec.`course_id` = c.`id`
    JOIN lecturer l ON ec.`lecturer_id` = l.`user_id`
    LEFT OUTER JOIN (SELECT 
        *
    FROM
        allowed_course ac
    WHERE
        ac.`program_id` = progId) AS ac_program ON ec.`course_id` = ac_program.`course_id`
    LEFT OUTER JOIN (SELECT 
        *
    FROM
        allowed_course ac
    WHERE
        ac.`program_id` = progId
            AND ac.`min_grade` <= usrGrade) AS ac_program_grade ON ec.`course_id` = ac_program_grade.`course_id`
    LEFT OUTER JOIN (SELECT 
        *
    FROM
        enrolled_course enc
    WHERE
        enc.`student_id` = userId
            AND enc.`semester_id` = semId) AS enrolled ON ec.`course_id` = enrolled.`course_id`
    LEFT OUTER JOIN (SELECT 
        info.course_id,
            info.semester_id,
            GROUP_CONCAT(CONCAT(info.weekDay, ' ', info.courseTime, ' ', info.location)
                SEPARATOR '
                                ') AS result
    FROM
        (SELECT 
        CASE
                WHEN cs.`week_day` = 1 THEN 'понеделник'
                WHEN cs.`week_day` = 2 THEN 'вторник'
                WHEN cs.`week_day` = 3 THEN 'сряда'
                WHEN cs.`week_day` = 4 THEN 'четвъртък'
                WHEN cs.`week_day` = 5 THEN 'петък'
                WHEN cs.`week_day` = 6 THEN 'събота'
                WHEN cs.`week_day` = 7 THEN 'неделя'
                WHEN cs.`week_day` = 0 THEN 'неделя'
                ELSE 'NONE'
            END AS weekDay,
            CONCAT(cs.`start_time`, '-', cs.`end_time`) AS courseTime,
            IFNULL(CONCAT(r.`room_number`, '/', r.`building`), '') AS location,
            cs.course_id,
            cs.semester_id
    FROM
        course_schedule cs
    LEFT OUTER JOIN room r ON cs.`room_id` = r.`id`) AS info
    GROUP BY info.course_id , info.semester_id) AS temp ON ec.`course_id` = temp.`course_id`
        AND ec.`semester_id` = temp.`semester_id`
    WHERE
        ec.`semester_id` = semId) as t
WHERE
    t.is_enrolled = IF(isClosed, 'true', t.is_enrolled);
            
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetElectivesCampaign` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetElectivesCampaign`()
BEGIN
	SELECT *
    FROM electives_campaign
    WHERE semester_id  = (SELECT max(id) FROM semester);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetEvents`()
BEGIN
	SELECT e.`id`, e.`abbreviation`, e.`title` as name, e.`description` as description,
    e.`date` as event_date, e.`start_time` as start_time, e.`end_time` as end_time, 
    concat(r.`room_number`, '/', r.`building`) as location, 'EVENT' as type_code
    FROM event e
    LEFT OUTER JOIN room r
    ON e.`room_id` = r.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLecturerSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetLecturerSchedule`(IN `userID` VARCHAR(32))
BEGIN
	SELECT cs.`week_day`, cs.`start_time`, cs.`end_time`, c.`abbreviation`, 
		   c.`name`, c.`flg_elective`,
           concat(r.`room_number`, '/', r.`building`) as location, p.`name` as program,
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
    LEFT OUTER JOIN program p
    ON cs.`program_id` = p.`id`
    JOIN semester sem
    ON cs.`semester_id` = sem.`id`
	WHERE cs.`lecturer_id` = userID
    AND cs.`semester_id` = (SELECT s.`id` FROM semester s WHERE SYSDATE() BETWEEN s.`start_date` AND s.`end_date`);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLecturersContacts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetLecturersContacts`()
BEGIN
	SELECT l.`name`, l.`department`, l.`contacts`
    FROM lecturer l;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetNews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetNews`(IN newsID INT, chunkSize INT, fullContent VARCHAR(1))
BEGIN
	DECLARE news_id INT;
    SET news_id = ifnull(newsID, (SELECT MAX(id)+1 FROM news));
    
    SELECT n.`id`, n.`title`, IF (fullContent = 'Y', n.`image`, null) as image, n.`creation_datetime`  
    FROM news n
    WHERE n.`id` < news_id
    ORDER BY n.`id` desc
    LIMIT chunkSize;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetNewsDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetNewsDetail`(IN newsID INT, fullContent VARCHAR(1))
BEGIN
	SELECT n.`id`, n.`title`,n.`text`,IF (fullContent = 'Y', n.`image`, null) as image, n.`creation_datetime`
    FROM news n
    WHERE n.`id` = newsID
    ORDER BY n.`id` desc;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRooms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetRooms`()
BEGIN
	SELECT r.`id`, concat(r.`room_number`, '/', r.`building`) as location
    FROM room r;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetStudentPlan`(IN userId VARCHAR(32))
BEGIN
	SELECT c.`data`
    FROM curriculum c
    JOIN student s
    ON c.`prog_id` = s.`prog_id`
    WHERE s.`student_id` = userId;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetStudentSchedule`(IN `userID` VARCHAR(32))
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
    AND cs.`semester_id` = (SELECT s.`id` FROM semester s WHERE SYSDATE() BETWEEN s.`start_date` AND s.`end_date`)
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
    AND ec.`semester_id` = cs.`semester_id`
	JOIN room r
    ON cs.`room_id` = r.`id`
    JOIN lecturer l
    ON cs.`lecturer_id` = l.`user_id`
    WHERE ec.`student_id` = userID
	AND ec.`semester_id` = (SELECT s.`id` FROM semester s WHERE SYSDATE() BETWEEN s.`start_date` AND s.`end_date`);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-05 10:48:51
