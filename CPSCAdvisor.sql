-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: CPSCAdvisor
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advisor` (
  `advisor_id` int(11) NOT NULL AUTO_INCREMENT,
  `advisor_user_name` varchar(25) NOT NULL,
  `advisor_last_name` varchar(25) NOT NULL,
  `advisor_first_name` varchar(25) NOT NULL,
  `advisor_password` varchar(25) NOT NULL,
  PRIMARY KEY (`advisor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisor`
--

LOCK TABLES `advisor` WRITE;
/*!40000 ALTER TABLE `advisor` DISABLE KEYS */;
INSERT INTO `advisor` VALUES (1,'anewalt','Anewalt','Karen','bananas'),(2,'stephen','Davies','Stephen','bananas'),(3,'finlayson','Finlayson','Ian','bananas'),(4,'polack','Polack','Jennifer','bananas'),(5,'marshall','Marshall','Andrew','bananas'),(6,'raz','Zacharski','Ron','bananas'),(7,'admin01','Admin','Admin',SHA2('CpscIsNumber1');
/*!40000 ALTER TABLE `advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_number` varchar(25) NOT NULL,
  `course_name` varchar(25) NOT NULL,
  `course_description` varchar(250) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'cpsc430','Software Design','We play games to learn about team problem solving.'),(2,'cpsc105','Problem solving with Data','Introduces relational databases as a common problem-solving tool for business, scientific, and personal applications. Covers issues of information representation, abstraction, redundancy and inconsistency. Introduces database schema design based on t'),(3,'cpsc109','Introduction to Modeling ','This course introduces students to the concepts of modeling and simulation as tools for solving problems in the sciences.  Students will be introduced to several modeling and simulation tools and will learn how to decompose problems so they can be re'),(4,'cpsc110','Introduction to Computer ','This course provides a foundation in computer science for a student who does not have prior programming experience. It provides sufficient support to permit a student to continue in the major program. Topics include an introduction to the algorithm a'),(5,'cpsc125','Introduction to Discrete ','Designed to prepare beginning Computer Science majors for advanced study by emphasizing the components of Discrete Mathematics especially related to Computer Science. An introduction to topics which may include number systems, logic, methods of proof'),(6,'cpsc220','Computer Science I','Continued coverage of disciplined problem-solving and algorithmic development including emphasis on procedural and data abstraction. Topics include elementary data structures such as arrays, files, and classes. The notions of data modeling and the li'),(7,'cpsc270','Introductory Special Topi','Lecture or seminar class dealing with a topic accessible without extensive Computer Science experience. Most recently this has included topics such as JavaScript Programming. May be repeated for credit with a change in topic.'),(8,'cpsc302','Computer Ethics','An examination of issues and events related to ethics, professional conduct and social responsibility as they apply to the field of Computer Science. Includes study of ethical responsibilities and behaviors appropriate for computer scientists.'),(9,'cpsc305','Computer Systems and Arch','This course examines the basic operation of computing systems. It takes a bottom-up approach covering each major component of such systems including hardware, logic circuit design, CPU instruction sets, assemblers, and compilers. Students will gain e'),(10,'cpsc320','Statistics for Computer S','A calculus-based mathematical statistics course with special emphasis on applications in Computer Science. Topics include probability, mass/density functions, discrete/continuous random variables, and general data analysis using a statistical softwar'),(11,'cpsc326','Theoretical Foundations o','Emphasis will be on structures and concepts relating to the theory of computation and the different types of theoretical machines that are mathematical models for actual physical processes. Topics may include automata theory, Turing machine theory, f'),(12,'cpsc350','Applications of Databases','Presents logical database modeling and design, emphasizing the construction and analysis of relational schemas. Covers semantics, integrity constraints, functional dependencies, and table normalization. Practical use of relational algebraic operators'),(13,'cpsc370','Special Topics','Lecture or seminar class dealing with a topic accessible after completing Computer Science II—Data Structures. Most recently this has included topics such as Game Programming with DirectX. May be repeated for credit with a change in topic.'),(14,'cpsc401','Organization of Programmi','A course in programming language construction and design emphasizing the run-time behavior of programs. Alternative implementations of programming language constructs are considered. Techniques for language definition may also be discussed.'),(15,'cpsc405','Operating Systems and Arc','This course examines the abstractions above the hardware that make a computer usable to both programmers and users. These abstractions include concurrent programming, virtual addressing, transactions, and virtualization. Many of these abstractions ar'),(16,'cpsc410','Database Principles and D','Information structures for external storage, file processing, and information retrieval. Introduction to database systems, including design, normalization, dependency and concurrency theory. Models for representing data and relations among data eleme'),(17,'cpsc415','Artificial Intelligence','A survey of current artificial intelligence topics including informed search, knowledge representation, knowledge-based systems, and machine learning. Other topics such as image processing, robotics, and language processing, may also be covered. Arti'),(18,'cpsc419','Data Mining','Practical knowledge of data mining and information retrieval. Students will examine the theoretical foundations of a variety of techniques, gain experience with these techniques using open source software, and learn how to apply them to real-world pr'),(19,'cpsc420','Simulation Techniques','An investigation of computer simulation techniques in the modeling of various systems. Includes an examination of various types of simulations including discrete event, Monte Carlo, and continuous time.'),(20,'cpsc425','Parallel Processing','Introduces massive parallelism, shared-memory strategies, and message passing approaches. Other topics are synchronization, parallel algorithm development, performance measurements, degradation, granularity, interconnection networks, and processor co'),(22,'cpsc440','Game Programming','Students will design, develop, and implement computer games that involve real-time, event-driven, and multimedia programming techniques. Students learn the history of computer games and the elements of video game design and architecture.'),(23,'cpsc444','Three Dimensional Compute','The study of three-dimensional modeling involving the use of light, color, texture, and transformation; visible-surface detection; parallel and perspective projections; clipping algorithms.'),(24,'cpsc448','Advanced Web Application ','An examination and application of contemporary software technologies focused on providing Web-based services and applications. Students work in teams to design and develop leading-edge projects. In the recent past this has included developing advance'),(25,'cpsc470','Special Topics','Treatment of selected topics in Computer Science. Most recently this has included topics such as E-Commerce and Programming with AJAX. May be repeated for credit with a change in topic.'),(26,'cpsc230','Computer Science II','Prerequisite:Grade of C or better in CPSC 220.  Continued study of data modeling and incorporation of abstract data types including linked lists, stacks, queues, heaps, trees, and graphs. Study of advanced sorting and searching techniques. Provides e'),(27,'cpsc310','Computer Information Syst','This course introduces the student to the use and implications of information technology in the business environment. This course covers such topics as data management, networks, analysis and design, computer hardware and software, decision support s'),(28,'cpsc330','Object-Oriented Analysis ','Theory and practice of the object-oriented software development paradigm. Focus is on major design principles such as abstraction, encapsulation, inheritance, polymorphism, aggregation, and visibility. Modeling notations for capturing and critiquing ');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `magic_id` int(11) NOT NULL,
  `student_last_name` varchar(25) NOT NULL,
  `student_first_name` varchar(25) NOT NULL,
  `student_year` int(11) NOT NULL,
  `student_graduation_semester` varchar(25) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,1,'radoye','douglas',2015,'Spring'),(8,2084,'test1.b','test1.a',2015,'summer');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_advisor`
--

DROP TABLE IF EXISTS `student_advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_advisor` (
  `student_id` int(11) NOT NULL,
  `advisor_id` int(11) NOT NULL,
  KEY `student_id` (`student_id`),
  KEY `advisor_id` (`advisor_id`),
  CONSTRAINT `student_advisor_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `student_advisor_ibfk_2` FOREIGN KEY (`advisor_id`) REFERENCES `advisor` (`advisor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_advisor`
--

LOCK TABLES `student_advisor` WRITE;
/*!40000 ALTER TABLE `student_advisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_course` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `student_course_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `student_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_needed`
--

DROP TABLE IF EXISTS `student_needed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_needed` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `student_needed_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `student_needed_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_needed`
--

LOCK TABLES `student_needed` WRITE;
/*!40000 ALTER TABLE `student_needed` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_needed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_taken`
--

DROP TABLE IF EXISTS `student_taken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_taken` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `student_taken_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `student_taken_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_taken`
--

LOCK TABLES `student_taken` WRITE;
/*!40000 ALTER TABLE `student_taken` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_taken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_track`
--

DROP TABLE IF EXISTS `student_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_track` (
  `student_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  KEY `student_id` (`student_id`),
  KEY `track_id` (`track_id`),
  CONSTRAINT `student_track_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `student_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_track`
--

LOCK TABLES `student_track` WRITE;
/*!40000 ALTER TABLE `student_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_wanted`
--

DROP TABLE IF EXISTS `student_wanted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_wanted` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `student_wanted_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `student_wanted_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_wanted`
--

LOCK TABLES `student_wanted` WRITE;
/*!40000 ALTER TABLE `student_wanted` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_wanted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track`
--

DROP TABLE IF EXISTS `track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track` (
  `track_id` int(11) NOT NULL AUTO_INCREMENT,
  `track_name` varchar(25) NOT NULL,
  PRIMARY KEY (`track_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track`
--

LOCK TABLES `track` WRITE;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
INSERT INTO `track` VALUES (1,'Traditional'),(2,'CIS'),(3,'GIS');
/*!40000 ALTER TABLE `track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_course`
--

DROP TABLE IF EXISTS `track_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_course` (
  `track_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  KEY `track_id` (`track_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `track_course_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`),
  CONSTRAINT `track_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_course`
--

LOCK TABLES `track_course` WRITE;
/*!40000 ALTER TABLE `track_course` DISABLE KEYS */;
INSERT INTO `track_course` VALUES (1,6),(1,9),(1,11),(1,12),(1,15),(1,1),(2,6),(2,12),(2,1),(3,6),(3,12),(1,26),(2,26),(3,26),(1,28),(2,28),(3,28),(2,27);
/*!40000 ALTER TABLE `track_course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-16 22:05:48
