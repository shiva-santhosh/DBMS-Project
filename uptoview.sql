-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cdc
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB-1:10.4.12+maria~bionic-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Achievment`
--

DROP TABLE IF EXISTS `Achievment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Achievment` (
  `Name` varchar(100) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `Roll_Number` varchar(20) NOT NULL,
  PRIMARY KEY (`Name`,`Roll_Number`),
  KEY `FKAchievment935627` (`Roll_Number`),
  CONSTRAINT `FKAchievment935627` FOREIGN KEY (`Roll_Number`) REFERENCES `Student` (`Roll_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Achievment`
--

LOCK TABLES `Achievment` WRITE;
/*!40000 ALTER TABLE `Achievment` DISABLE KEYS */;
INSERT INTO `Achievment` VALUES ('Best Web portal','best dbms project in the class','111701050'),('Code Jam','got seleceted in world finals','111701021'),('ICPC','got all india 1st ramk','111701028'),('State Player in Badminton','secured state 2nd in badminton','111701021');
/*!40000 ALTER TABLE `Achievment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Application`
--

DROP TABLE IF EXISTS `Application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Application` (
  `ApplicationID` varchar(100) NOT NULL,
  `JobDesignation` varchar(100) NOT NULL,
  `TypeOfOffer` varchar(100) NOT NULL,
  `NatureOfProfile` varchar(100) NOT NULL,
  `NumberOfOffers` varchar(100) NOT NULL,
  `JobDescription` varchar(100) DEFAULT NULL,
  `DateFloated` date NOT NULL,
  `PPTMaterial` blob DEFAULT NULL,
  `LastDateForApply` date NOT NULL,
  `CTC` int(11) DEFAULT NULL,
  `Stipend` int(11) DEFAULT NULL,
  `JobDescriptionPdf` int(11) DEFAULT NULL,
  `CompanyID` varchar(10) NOT NULL,
  PRIMARY KEY (`ApplicationID`,`CompanyID`),
  KEY `FKApplicatio377765` (`CompanyID`),
  CONSTRAINT `FKApplicatio377765` FOREIGN KEY (`CompanyID`) REFERENCES `Company` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Application`
--

LOCK TABLES `Application` WRITE;
/*!40000 ALTER TABLE `Application` DISABLE KEYS */;
INSERT INTO `Application` VALUES ('AS1456','MTS','FT','Software','5',NULL,'2020-01-08',NULL,'2020-01-18',2000000,NULL,NULL,'1'),('G1201','SDE INTERN','Intern','Software','3',NULL,'2020-01-10',NULL,'2000-01-20',100000,NULL,NULL,'2'),('RP1201','SDE INTERN','Intern','Software','2',NULL,'2020-01-10',NULL,'2020-01-30',40000,NULL,NULL,'3');
/*!40000 ALTER TABLE `Application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Apply`
--

DROP TABLE IF EXISTS `Apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Apply` (
  `Roll_Number` varchar(20) NOT NULL,
  `ApplicationID` varchar(100) NOT NULL,
  `CompanyID` varchar(10) NOT NULL,
  `DateApplied` date NOT NULL,
  `Verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`Roll_Number`,`ApplicationID`,`CompanyID`),
  KEY `FKApply852663` (`ApplicationID`,`CompanyID`),
  CONSTRAINT `FKApply852663` FOREIGN KEY (`ApplicationID`, `CompanyID`) REFERENCES `Application` (`ApplicationID`, `CompanyID`),
  CONSTRAINT `FKApply99118` FOREIGN KEY (`Roll_Number`) REFERENCES `Student` (`Roll_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Apply`
--

LOCK TABLES `Apply` WRITE;
/*!40000 ALTER TABLE `Apply` DISABLE KEYS */;
INSERT INTO `Apply` VALUES ('111701021','G1201','2','2020-01-14',1),('111701028','AS1456','1','2020-01-13',1),('111701028','RP1201','3','2020-01-16',0),('111701050','G1201','2','2020-01-16',1),('121701052','G1201','2','2020-01-13',0),('131701031','G1201','2','2020-01-16',0);
/*!40000 ALTER TABLE `Apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CDCCordinator`
--

DROP TABLE IF EXISTS `CDCCordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CDCCordinator` (
  `CDCID` varchar(100) NOT NULL,
  `E-mail` varchar(100) NOT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `Name` varchar(100) NOT NULL,
  `TPOID` int(11) NOT NULL,
  PRIMARY KEY (`CDCID`,`TPOID`),
  KEY `FKCDCCordina165540` (`TPOID`),
  CONSTRAINT `FKCDCCordina165540` FOREIGN KEY (`TPOID`) REFERENCES `TPO` (`TPOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CDCCordinator`
--

LOCK TABLES `CDCCordinator` WRITE;
/*!40000 ALTER TABLE `CDCCordinator` DISABLE KEYS */;
INSERT INTO `CDCCordinator` VALUES ('1','abhinav@gmail.com','8078448244','abhinav',1),('2','balu@gmail.com','9045221105','balu',2);
/*!40000 ALTER TABLE `CDCCordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CDCLogin`
--

DROP TABLE IF EXISTS `CDCLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CDCLogin` (
  `E-mail` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `CDCID` varchar(100) NOT NULL,
  `CDCCordinatorTPOID` int(11) NOT NULL,
  PRIMARY KEY (`CDCID`,`CDCCordinatorTPOID`),
  CONSTRAINT `FKCDCLogin924006` FOREIGN KEY (`CDCID`, `CDCCordinatorTPOID`) REFERENCES `CDCCordinator` (`CDCID`, `TPOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CDCLogin`
--

LOCK TABLES `CDCLogin` WRITE;
/*!40000 ALTER TABLE `CDCLogin` DISABLE KEYS */;
INSERT INTO `CDCLogin` VALUES ('cor@gmail.com','131234','1',1);
/*!40000 ALTER TABLE `CDCLogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Company` (
  `Name` varchar(100) NOT NULL,
  `E-mail` varchar(100) NOT NULL,
  `State` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `StreetNumber` varchar(100) DEFAULT NULL,
  `StreetName` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `PinCode` varchar(20) DEFAULT NULL,
  `DateOfRegistration` date NOT NULL,
  `Website` varchar(100) DEFAULT NULL,
  `CompanyID` varchar(10) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `Logo` blob DEFAULT NULL,
  `Verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
INSERT INTO `Company` VALUES ('Arista Networks','arista@gmail.com','Karnatka','Bangalore',NULL,NULL,'040123',NULL,'2016-01-20',NULL,'1',NULL,NULL,1),('Google','google@gmail.com','Telangana','Hyderabad',NULL,NULL,'040134',NULL,'2016-05-20',NULL,'2',NULL,NULL,0),('Rupeek Fintech','rupeek@gmail.com','Karnatak','Bangalore',NULL,NULL,'030123',NULL,'2016-03-10',NULL,'3',NULL,NULL,0);
/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompanyLogin`
--

DROP TABLE IF EXISTS `CompanyLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompanyLogin` (
  `Password` varchar(100) NOT NULL,
  `E-mail` varchar(100) NOT NULL,
  `CompanyID` varchar(10) NOT NULL,
  PRIMARY KEY (`CompanyID`),
  CONSTRAINT `FKCompanyLog159312` FOREIGN KEY (`CompanyID`) REFERENCES `Company` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyLogin`
--

LOCK TABLES `CompanyLogin` WRITE;
/*!40000 ALTER TABLE `CompanyLogin` DISABLE KEYS */;
INSERT INTO `CompanyLogin` VALUES ('123456','hr@gmail.com','1');
/*!40000 ALTER TABLE `CompanyLogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Eductation`
--

DROP TABLE IF EXISTS `Eductation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Eductation` (
  `Semester1` float NOT NULL,
  `Semester2` float NOT NULL,
  `Semester3` float DEFAULT NULL,
  `Semester4` float DEFAULT NULL,
  `Semester5` float DEFAULT NULL,
  `Semester6` float DEFAULT NULL,
  `Semester7` float DEFAULT NULL,
  `Semester8` float DEFAULT NULL,
  `XPercentage` float NOT NULL,
  `XIIPercentage` float NOT NULL,
  `CGPA` float NOT NULL,
  `XSchoolName` varchar(100) NOT NULL,
  `XIIClg_Name` varchar(100) NOT NULL,
  `Roll_Number` varchar(20) NOT NULL,
  PRIMARY KEY (`Roll_Number`),
  CONSTRAINT `FKEductation676071` FOREIGN KEY (`Roll_Number`) REFERENCES `Student` (`Roll_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Eductation`
--

LOCK TABLES `Eductation` WRITE;
/*!40000 ALTER TABLE `Eductation` DISABLE KEYS */;
INSERT INTO `Eductation` VALUES (8.05,8.32,8.64,8.48,8.64,NULL,NULL,NULL,95,98,8.43,'GMR CHINMAYA','CHAITANYA','111701021'),(8.1,8.5,9,8.8,8.8,NULL,NULL,NULL,93,97,8.6,'JNV SKZR','SVJC','111701028'),(7,7,7,7,7,NULL,NULL,NULL,80,90,7,'JNV KARIMNAGAR','CHAITANYA','111701050'),(8,8,8,8,8,NULL,NULL,NULL,90,96,8,'JNV SKZR','SVJC','121701053');
/*!40000 ALTER TABLE `Eductation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ElectiveCourses`
--

DROP TABLE IF EXISTS `ElectiveCourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ElectiveCourses` (
  `Course_Name` varchar(100) NOT NULL,
  `Roll_Number` varchar(20) NOT NULL,
  PRIMARY KEY (`Course_Name`,`Roll_Number`),
  KEY `FKElectiveCo629724` (`Roll_Number`),
  CONSTRAINT `FKElectiveCo629724` FOREIGN KEY (`Roll_Number`) REFERENCES `Student` (`Roll_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ElectiveCourses`
--

LOCK TABLES `ElectiveCourses` WRITE;
/*!40000 ALTER TABLE `ElectiveCourses` DISABLE KEYS */;
INSERT INTO `ElectiveCourses` VALUES ('Cryptography','111701028'),('Deep learning','111701021'),('ML','111701021'),('Reinforcement Learning','111701021');
/*!40000 ALTER TABLE `ElectiveCourses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EligibleDepartment`
--

DROP TABLE IF EXISTS `EligibleDepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EligibleDepartment` (
  `Year` year(4) NOT NULL,
  `DeptName` varchar(100) NOT NULL,
  `CGPA` float DEFAULT NULL,
  `ApplicationID` varchar(100) NOT NULL,
  `CompanyID` varchar(10) NOT NULL,
  PRIMARY KEY (`ApplicationID`,`CompanyID`,`DeptName`,`Year`),
  CONSTRAINT `FKEligibleDe696407` FOREIGN KEY (`ApplicationID`, `CompanyID`) REFERENCES `Application` (`ApplicationID`, `CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EligibleDepartment`
--

LOCK TABLES `EligibleDepartment` WRITE;
/*!40000 ALTER TABLE `EligibleDepartment` DISABLE KEYS */;
INSERT INTO `EligibleDepartment` VALUES (2017,'CSE',8,'AS1456','1'),(2017,'CSE',7,'RP1201','3'),(2017,'EE',7.5,'RP1201','3');
/*!40000 ALTER TABLE `EligibleDepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Experience`
--

DROP TABLE IF EXISTS `Experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Experience` (
  `Title` varchar(100) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Roll_Number` varchar(20) NOT NULL,
  PRIMARY KEY (`Title`,`Roll_Number`),
  KEY `FKExperience449448` (`Roll_Number`),
  CONSTRAINT `FKExperience449448` FOREIGN KEY (`Roll_Number`) REFERENCES `Student` (`Roll_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Experience`
--

LOCK TABLES `Experience` WRITE;
/*!40000 ALTER TABLE `Experience` DISABLE KEYS */;
INSERT INTO `Experience` VALUES ('Intern at TImnken','Has completed  ','2019-04-12','2019-06-19','121701052'),('Software intern at Rupeek','Has completed the project','2019-04-12','2019-05-19','111701021'),('Summer Intern at Timken','Has completed the internship','2019-04-12','2019-06-19','111701028');
/*!40000 ALTER TABLE `Experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExtraCurricularActivities`
--

DROP TABLE IF EXISTS `ExtraCurricularActivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExtraCurricularActivities` (
  `Name` varchar(100) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `Roll_Number` varchar(20) NOT NULL,
  PRIMARY KEY (`Name`,`Roll_Number`),
  KEY `FKExtraCurri108517` (`Roll_Number`),
  CONSTRAINT `FKExtraCurri108517` FOREIGN KEY (`Roll_Number`) REFERENCES `Student` (`Roll_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExtraCurricularActivities`
--

LOCK TABLES `ExtraCurricularActivities` WRITE;
/*!40000 ALTER TABLE `ExtraCurricularActivities` DISABLE KEYS */;
INSERT INTO `ExtraCurricularActivities` VALUES ('ncc','participated in ncc for 2 months','121701051'),('nss','particpated in national social service','121701051'),('sports','Chess,Table Tennis','111701021');
/*!40000 ALTER TABLE `ExtraCurricularActivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Offered`
--

DROP TABLE IF EXISTS `Offered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Offered` (
  `DateOffered` date NOT NULL,
  `Roll_Number` varchar(20) NOT NULL,
  `ApplicationID` varchar(100) NOT NULL,
  `CompanyID` varchar(10) NOT NULL,
  PRIMARY KEY (`Roll_Number`,`ApplicationID`,`CompanyID`),
  CONSTRAINT `FKOffered21203` FOREIGN KEY (`Roll_Number`, `ApplicationID`, `CompanyID`) REFERENCES `Apply` (`Roll_Number`, `ApplicationID`, `CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Offered`
--

LOCK TABLES `Offered` WRITE;
/*!40000 ALTER TABLE `Offered` DISABLE KEYS */;
INSERT INTO `Offered` VALUES ('2020-02-10','111701021','G1201','2'),('2020-02-10','111701028','RP1201','3'),('2020-02-10','131701031','G1201','2');
/*!40000 ALTER TABLE `Offered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POR`
--

DROP TABLE IF EXISTS `POR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POR` (
  `PostName` varchar(100) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `Roll_Number` varchar(20) NOT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`PostName`,`Roll_Number`),
  KEY `FKPOR701907` (`Roll_Number`),
  CONSTRAINT `FKPOR701907` FOREIGN KEY (`Roll_Number`) REFERENCES `Student` (`Roll_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POR`
--

LOCK TABLES `POR` WRITE;
/*!40000 ALTER TABLE `POR` DISABLE KEYS */;
INSERT INTO `POR` VALUES ('Coding club Head','Head at Coding Club in IIt palakkad','111701028','2019-02-20','2020-02-20'),('Hostel Secretary','HS at IIT palakkad','111701028','2019-02-20','2020-02-20'),('Mess Secretary','MS at IIT palakkad','111701021','2019-02-20','2020-02-20'),('Volley Ball Secretary',NULL,'121701052','2019-02-20','2020-02-20');
/*!40000 ALTER TABLE `POR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `Title` varchar(100) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `Roll_Number` varchar(20) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  PRIMARY KEY (`Title`,`Roll_Number`),
  KEY `FKProject5154` (`Roll_Number`),
  CONSTRAINT `FKProject5154` FOREIGN KEY (`Roll_Number`) REFERENCES `Student` (`Roll_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES ('android','Has implemented weather app','111701021','2019-02-03','2019-06-21'),('DBMS','has implemented web portal','111701028','2019-02-04','2019-04-02'),('ML','has implemented ml algoritm to predict ','121701051','2019-02-01','2019-04-01');
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recruiter`
--

DROP TABLE IF EXISTS `Recruiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recruiter` (
  `Name` varchar(100) NOT NULL,
  `Designation` varchar(100) NOT NULL,
  `ContactNumber` varchar(100) NOT NULL,
  `E-mail` varchar(100) NOT NULL,
  `CompanyID` varchar(10) NOT NULL,
  PRIMARY KEY (`CompanyID`),
  CONSTRAINT `FKRecruiter156434` FOREIGN KEY (`CompanyID`) REFERENCES `Company` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recruiter`
--

LOCK TABLES `Recruiter` WRITE;
/*!40000 ALTER TABLE `Recruiter` DISABLE KEYS */;
INSERT INTO `Recruiter` VALUES ('Sravya','HR','9191912134','sravya@gmail.com','1'),('Anita','HR','9999999999','anita@gmail.com','2'),('Sravan','HR','8978978979','sravan@gmail.com','3');
/*!40000 ALTER TABLE `Recruiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `Roll_Number` varchar(20) NOT NULL,
  `First_Name` varchar(20) NOT NULL,
  `Last_Name` varchar(20) NOT NULL,
  `Date_of_Birth` date NOT NULL,
  `Department` varchar(30) NOT NULL,
  `E-mail` varchar(30) NOT NULL,
  `Year_of_Admission` year(4) NOT NULL,
  `City` varchar(30) NOT NULL,
  `State` varchar(30) NOT NULL,
  `House_Number` varchar(30) NOT NULL,
  `PinCode` varchar(30) NOT NULL,
  `Street_Number` varchar(30) DEFAULT NULL,
  `Nationality` varchar(30) NOT NULL,
  `JeeRank` varchar(10) NOT NULL,
  `Photo` blob DEFAULT NULL,
  `Age` varchar(30) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `PhoneNumber` varchar(30) NOT NULL,
  `Verified` tinyint(1) NOT NULL DEFAULT 0,
  `StreeName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Roll_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='\n ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('111701021','Pandravisam','Shiva Santhosh','1999-09-20','CSE','111701021@smail.iitpkd.ac.in',2017,'Hyderabad','Telangana','145-b','501505','Jubliee Hills','India','8000',NULL,'20','Male','8078448244',1,NULL),('111701028','Sirpa','Sahul','1999-12-25','CSE','111701028@smail.iitpkd.ac.in',2017,'Asifabad','Telangana','3-556','504293','RajeevNagar','India','3396',NULL,'20','Male','7981260303',1,NULL),('111701050','Vihari','Desala','2000-09-19','CSE','111701050@smail.iitpkd.ac.in',2017,'Guntur','Andhra Pradesh','1729-b','509010','Nallakunta','India','7090',NULL,'19','Female','8080808080',0,NULL),('121701051','Nishitha','Solanki','2000-01-20','EE','121701051@smail.iitpkd.ac.in',2017,'Asifabad','Telangana','25-b','504293','VidyaNagar','India','50000',NULL,'21','Female','7979797979',0,NULL),('121701052','Sravan','Avidapudu','1999-11-20','EE','121701052@smail.iitpkd.ac.in',2017,'Asifabad','Telangana','220-b','504293','Bala Nagar','India','2000',NULL,'20','Male','9842429842',0,NULL),('121701053','Vosa','Hansith','1999-07-14','EE','121701053@smail.iitpkd.ac.in',2017,'Asifabad','Telangana','110-b','555012','Ambedkra Nagar','India','3000',NULL,'20','Male','9393939393',0,NULL),('131701031','Archana','Mucha','2000-01-05','ME','131701031@smail.iitpkd.ac.in',2017,'Asifabad','Telangana','220-b','555121',NULL,'India','1000',NULL,'20','Female','9876543210',1,NULL),('141701050','Sidam','Saikiran','1999-01-25','CE','141701050@smail.iitpkd.ac.in',2017,'Adilabad','Telangana','300-b','504280',NULL,'India','2000',NULL,'20','Male','8912343456',0,NULL);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentLogin`
--

DROP TABLE IF EXISTS `StudentLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentLogin` (
  `Password` varchar(100) DEFAULT NULL,
  `Roll_Number` varchar(20) NOT NULL,
  PRIMARY KEY (`Roll_Number`),
  CONSTRAINT `FKStudentLog482862` FOREIGN KEY (`Roll_Number`) REFERENCES `Student` (`Roll_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentLogin`
--

LOCK TABLES `StudentLogin` WRITE;
/*!40000 ALTER TABLE `StudentLogin` DISABLE KEYS */;
INSERT INTO `StudentLogin` VALUES ('PAss)456','111701021'),('Pass#451','111701028'),('PASST678','111701050'),('ajfbsahf','131701031');
/*!40000 ALTER TABLE `StudentLogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TPO`
--

DROP TABLE IF EXISTS `TPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TPO` (
  `TPOID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TPOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TPO`
--

LOCK TABLES `TPO` WRITE;
/*!40000 ALTER TABLE `TPO` DISABLE KEYS */;
INSERT INTO `TPO` VALUES (1,'santhosh','8078450954','s@gmail.com'),(2,'Dasan','8421842184','dasan@gmail.com');
/*!40000 ALTER TABLE `TPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TechnicalSkill`
--

DROP TABLE IF EXISTS `TechnicalSkill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TechnicalSkill` (
  `Heading` varchar(100) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `Roll_Number` varchar(20) NOT NULL,
  PRIMARY KEY (`Heading`,`Roll_Number`),
  KEY `FKTechnicalS463471` (`Roll_Number`),
  CONSTRAINT `FKTechnicalS463471` FOREIGN KEY (`Roll_Number`) REFERENCES `Student` (`Roll_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TechnicalSkill`
--

LOCK TABLES `TechnicalSkill` WRITE;
/*!40000 ALTER TABLE `TechnicalSkill` DISABLE KEYS */;
INSERT INTO `TechnicalSkill` VALUES ('DBMS','MongoDB,SQL','111701021'),('Deep learning','Can implement dl models in python','121701053'),('Languages','Java','111701021'),('languages known','C++,C,Java','111701028');
/*!40000 ALTER TABLE `TechnicalSkill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TpoLogin`
--

DROP TABLE IF EXISTS `TpoLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TpoLogin` (
  `Password` varchar(100) NOT NULL,
  `E-mail` varchar(100) NOT NULL,
  `TPOID` int(11) NOT NULL,
  PRIMARY KEY (`TPOID`),
  CONSTRAINT `FKTpoLogin967720` FOREIGN KEY (`TPOID`) REFERENCES `TPO` (`TPOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TpoLogin`
--

LOCK TABLES `TpoLogin` WRITE;
/*!40000 ALTER TABLE `TpoLogin` DISABLE KEYS */;
INSERT INTO `TpoLogin` VALUES ('123445','tpo@gmail.com',1);
/*!40000 ALTER TABLE `TpoLogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TrainingWorkshop`
--

DROP TABLE IF EXISTS `TrainingWorkshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TrainingWorkshop` (
  `NameOfWorkshop` varchar(100) NOT NULL,
  `Start date` date DEFAULT NULL,
  `Roll_Number` varchar(20) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `End date` date DEFAULT NULL,
  PRIMARY KEY (`NameOfWorkshop`,`Roll_Number`),
  KEY `FKTrainingWo47185` (`Roll_Number`),
  CONSTRAINT `FKTrainingWo47185` FOREIGN KEY (`Roll_Number`) REFERENCES `Student` (`Roll_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TrainingWorkshop`
--

LOCK TABLES `TrainingWorkshop` WRITE;
/*!40000 ALTER TABLE `TrainingWorkshop` DISABLE KEYS */;
INSERT INTO `TrainingWorkshop` VALUES ('AI Workshop','2019-12-10','121701053','learn basics of AI','2019-12-21'),('Cyber Security','2020-01-21','111701021','learned how to design cyber safe systems','2020-02-01'),('Ethical Hacking','2020-01-21','111701028','Learned Hacking','2020-02-06');
/*!40000 ALTER TABLE `TrainingWorkshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `application_details`
--

DROP TABLE IF EXISTS `application_details`;
/*!50001 DROP VIEW IF EXISTS `application_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `application_details` (
  `ApplicationID` tinyint NOT NULL,
  `CompanyID` tinyint NOT NULL,
  `JobDesignation` tinyint NOT NULL,
  `TypeOfOffer` tinyint NOT NULL,
  `NatureOfProfile` tinyint NOT NULL,
  `NumberOfOffers` tinyint NOT NULL,
  `JobDescription` tinyint NOT NULL,
  `DateFloated` tinyint NOT NULL,
  `PPTMaterial` tinyint NOT NULL,
  `LastDateForApply` tinyint NOT NULL,
  `CTC` tinyint NOT NULL,
  `Stipend` tinyint NOT NULL,
  `JobDescriptionPdf` tinyint NOT NULL,
  `Year` tinyint NOT NULL,
  `DeptName` tinyint NOT NULL,
  `CGPA` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `apply_details`
--

DROP TABLE IF EXISTS `apply_details`;
/*!50001 DROP VIEW IF EXISTS `apply_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `apply_details` (
  `Roll_Number` tinyint NOT NULL,
  `ApplicationID` tinyint NOT NULL,
  `CompanyID` tinyint NOT NULL,
  `DateApplied` tinyint NOT NULL,
  `Verified` tinyint NOT NULL,
  `DateOffered` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `company_details`
--

DROP TABLE IF EXISTS `company_details`;
/*!50001 DROP VIEW IF EXISTS `company_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `company_details` (
  `Name` tinyint NOT NULL,
  `E-mail` tinyint NOT NULL,
  `CompanyID` tinyint NOT NULL,
  `State` tinyint NOT NULL,
  `City` tinyint NOT NULL,
  `StreetNumber` tinyint NOT NULL,
  `StreetName` tinyint NOT NULL,
  `PhoneNumber` tinyint NOT NULL,
  `PinCode` tinyint NOT NULL,
  `DateOfRegistration` tinyint NOT NULL,
  `Website` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `Logo` tinyint NOT NULL,
  `Verified` tinyint NOT NULL,
  `Designation` tinyint NOT NULL,
  `ContactNumber` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `student_achievment`
--

DROP TABLE IF EXISTS `student_achievment`;
/*!50001 DROP VIEW IF EXISTS `student_achievment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_achievment` (
  `Name` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `Roll_Number` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `student_details`
--

DROP TABLE IF EXISTS `student_details`;
/*!50001 DROP VIEW IF EXISTS `student_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_details` (
  `Roll_Number` tinyint NOT NULL,
  `First_Name` tinyint NOT NULL,
  `Last_Name` tinyint NOT NULL,
  `Date_of_Birth` tinyint NOT NULL,
  `Department` tinyint NOT NULL,
  `E-mail` tinyint NOT NULL,
  `Year_of_Admission` tinyint NOT NULL,
  `City` tinyint NOT NULL,
  `State` tinyint NOT NULL,
  `House_Number` tinyint NOT NULL,
  `PinCode` tinyint NOT NULL,
  `Street_Number` tinyint NOT NULL,
  `Nationality` tinyint NOT NULL,
  `JeeRank` tinyint NOT NULL,
  `Photo` tinyint NOT NULL,
  `Age` tinyint NOT NULL,
  `Gender` tinyint NOT NULL,
  `PhoneNumber` tinyint NOT NULL,
  `Verified` tinyint NOT NULL,
  `StreeName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `student_edcation`
--

DROP TABLE IF EXISTS `student_edcation`;
/*!50001 DROP VIEW IF EXISTS `student_edcation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_edcation` (
  `Semester1` tinyint NOT NULL,
  `Semester2` tinyint NOT NULL,
  `Semester3` tinyint NOT NULL,
  `Semester4` tinyint NOT NULL,
  `Semester5` tinyint NOT NULL,
  `Semester6` tinyint NOT NULL,
  `Semester7` tinyint NOT NULL,
  `Semester8` tinyint NOT NULL,
  `XPercentage` tinyint NOT NULL,
  `XIIPercentage` tinyint NOT NULL,
  `CGPA` tinyint NOT NULL,
  `XSchoolName` tinyint NOT NULL,
  `XIIClg_Name` tinyint NOT NULL,
  `Roll_Number` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `student_elective`
--

DROP TABLE IF EXISTS `student_elective`;
/*!50001 DROP VIEW IF EXISTS `student_elective`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_elective` (
  `Course_Name` tinyint NOT NULL,
  `Roll_Number` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `student_experience`
--

DROP TABLE IF EXISTS `student_experience`;
/*!50001 DROP VIEW IF EXISTS `student_experience`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_experience` (
  `Title` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `StartDate` tinyint NOT NULL,
  `EndDate` tinyint NOT NULL,
  `Roll_Number` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `student_extra`
--

DROP TABLE IF EXISTS `student_extra`;
/*!50001 DROP VIEW IF EXISTS `student_extra`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_extra` (
  `Name` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `Roll_Number` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `student_por`
--

DROP TABLE IF EXISTS `student_por`;
/*!50001 DROP VIEW IF EXISTS `student_por`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_por` (
  `PostName` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `Roll_Number` tinyint NOT NULL,
  `StartDate` tinyint NOT NULL,
  `EndDate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `student_project`
--

DROP TABLE IF EXISTS `student_project`;
/*!50001 DROP VIEW IF EXISTS `student_project`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_project` (
  `Title` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `Roll_Number` tinyint NOT NULL,
  `StartDate` tinyint NOT NULL,
  `EndDate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `student_technical`
--

DROP TABLE IF EXISTS `student_technical`;
/*!50001 DROP VIEW IF EXISTS `student_technical`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_technical` (
  `Heading` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `Roll_Number` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `student_traning`
--

DROP TABLE IF EXISTS `student_traning`;
/*!50001 DROP VIEW IF EXISTS `student_traning`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_traning` (
  `NameOfWorkshop` tinyint NOT NULL,
  `Start date` tinyint NOT NULL,
  `Roll_Number` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `End date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `application_details`
--

/*!50001 DROP TABLE IF EXISTS `application_details`*/;
/*!50001 DROP VIEW IF EXISTS `application_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `application_details` AS select `Application`.`ApplicationID` AS `ApplicationID`,`Application`.`CompanyID` AS `CompanyID`,`Application`.`JobDesignation` AS `JobDesignation`,`Application`.`TypeOfOffer` AS `TypeOfOffer`,`Application`.`NatureOfProfile` AS `NatureOfProfile`,`Application`.`NumberOfOffers` AS `NumberOfOffers`,`Application`.`JobDescription` AS `JobDescription`,`Application`.`DateFloated` AS `DateFloated`,`Application`.`PPTMaterial` AS `PPTMaterial`,`Application`.`LastDateForApply` AS `LastDateForApply`,`Application`.`CTC` AS `CTC`,`Application`.`Stipend` AS `Stipend`,`Application`.`JobDescriptionPdf` AS `JobDescriptionPdf`,`EligibleDepartment`.`Year` AS `Year`,`EligibleDepartment`.`DeptName` AS `DeptName`,`EligibleDepartment`.`CGPA` AS `CGPA` from (`Application` join `EligibleDepartment` on(`Application`.`ApplicationID` = `EligibleDepartment`.`ApplicationID` and `Application`.`CompanyID` = `EligibleDepartment`.`CompanyID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `apply_details`
--

/*!50001 DROP TABLE IF EXISTS `apply_details`*/;
/*!50001 DROP VIEW IF EXISTS `apply_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `apply_details` AS select `Apply`.`Roll_Number` AS `Roll_Number`,`Apply`.`ApplicationID` AS `ApplicationID`,`Apply`.`CompanyID` AS `CompanyID`,`Apply`.`DateApplied` AS `DateApplied`,`Apply`.`Verified` AS `Verified`,`Offered`.`DateOffered` AS `DateOffered` from (`Apply` join `Offered` on(`Apply`.`Roll_Number` = `Offered`.`Roll_Number` and `Apply`.`ApplicationID` = `Offered`.`ApplicationID` and `Apply`.`CompanyID` = `Offered`.`CompanyID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `company_details`
--

/*!50001 DROP TABLE IF EXISTS `company_details`*/;
/*!50001 DROP VIEW IF EXISTS `company_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `company_details` AS select `Company`.`Name` AS `Name`,`Company`.`E-mail` AS `E-mail`,`Company`.`CompanyID` AS `CompanyID`,`Company`.`State` AS `State`,`Company`.`City` AS `City`,`Company`.`StreetNumber` AS `StreetNumber`,`Company`.`StreetName` AS `StreetName`,`Company`.`PhoneNumber` AS `PhoneNumber`,`Company`.`PinCode` AS `PinCode`,`Company`.`DateOfRegistration` AS `DateOfRegistration`,`Company`.`Website` AS `Website`,`Company`.`Description` AS `Description`,`Company`.`Logo` AS `Logo`,`Company`.`Verified` AS `Verified`,`Recruiter`.`Designation` AS `Designation`,`Recruiter`.`ContactNumber` AS `ContactNumber` from (`Company` join `Recruiter` on(`Company`.`Name` = `Recruiter`.`Name` and `Company`.`E-mail` = `Recruiter`.`E-mail` and `Company`.`CompanyID` = `Recruiter`.`CompanyID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_achievment`
--

/*!50001 DROP TABLE IF EXISTS `student_achievment`*/;
/*!50001 DROP VIEW IF EXISTS `student_achievment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_achievment` AS select `Achievment`.`Name` AS `Name`,`Achievment`.`Description` AS `Description`,`Achievment`.`Roll_Number` AS `Roll_Number` from `Achievment` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_details`
--

/*!50001 DROP TABLE IF EXISTS `student_details`*/;
/*!50001 DROP VIEW IF EXISTS `student_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_details` AS select `Student`.`Roll_Number` AS `Roll_Number`,`Student`.`First_Name` AS `First_Name`,`Student`.`Last_Name` AS `Last_Name`,`Student`.`Date_of_Birth` AS `Date_of_Birth`,`Student`.`Department` AS `Department`,`Student`.`E-mail` AS `E-mail`,`Student`.`Year_of_Admission` AS `Year_of_Admission`,`Student`.`City` AS `City`,`Student`.`State` AS `State`,`Student`.`House_Number` AS `House_Number`,`Student`.`PinCode` AS `PinCode`,`Student`.`Street_Number` AS `Street_Number`,`Student`.`Nationality` AS `Nationality`,`Student`.`JeeRank` AS `JeeRank`,`Student`.`Photo` AS `Photo`,`Student`.`Age` AS `Age`,`Student`.`Gender` AS `Gender`,`Student`.`PhoneNumber` AS `PhoneNumber`,`Student`.`Verified` AS `Verified`,`Student`.`StreeName` AS `StreeName` from `Student` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_edcation`
--

/*!50001 DROP TABLE IF EXISTS `student_edcation`*/;
/*!50001 DROP VIEW IF EXISTS `student_edcation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_edcation` AS select `Eductation`.`Semester1` AS `Semester1`,`Eductation`.`Semester2` AS `Semester2`,`Eductation`.`Semester3` AS `Semester3`,`Eductation`.`Semester4` AS `Semester4`,`Eductation`.`Semester5` AS `Semester5`,`Eductation`.`Semester6` AS `Semester6`,`Eductation`.`Semester7` AS `Semester7`,`Eductation`.`Semester8` AS `Semester8`,`Eductation`.`XPercentage` AS `XPercentage`,`Eductation`.`XIIPercentage` AS `XIIPercentage`,`Eductation`.`CGPA` AS `CGPA`,`Eductation`.`XSchoolName` AS `XSchoolName`,`Eductation`.`XIIClg_Name` AS `XIIClg_Name`,`Eductation`.`Roll_Number` AS `Roll_Number` from `Eductation` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_elective`
--

/*!50001 DROP TABLE IF EXISTS `student_elective`*/;
/*!50001 DROP VIEW IF EXISTS `student_elective`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_elective` AS select `ElectiveCourses`.`Course_Name` AS `Course_Name`,`ElectiveCourses`.`Roll_Number` AS `Roll_Number` from `ElectiveCourses` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_experience`
--

/*!50001 DROP TABLE IF EXISTS `student_experience`*/;
/*!50001 DROP VIEW IF EXISTS `student_experience`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_experience` AS select `Experience`.`Title` AS `Title`,`Experience`.`Description` AS `Description`,`Experience`.`StartDate` AS `StartDate`,`Experience`.`EndDate` AS `EndDate`,`Experience`.`Roll_Number` AS `Roll_Number` from `Experience` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_extra`
--

/*!50001 DROP TABLE IF EXISTS `student_extra`*/;
/*!50001 DROP VIEW IF EXISTS `student_extra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_extra` AS select `ExtraCurricularActivities`.`Name` AS `Name`,`ExtraCurricularActivities`.`Description` AS `Description`,`ExtraCurricularActivities`.`Roll_Number` AS `Roll_Number` from `ExtraCurricularActivities` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_por`
--

/*!50001 DROP TABLE IF EXISTS `student_por`*/;
/*!50001 DROP VIEW IF EXISTS `student_por`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_por` AS select `POR`.`PostName` AS `PostName`,`POR`.`Description` AS `Description`,`POR`.`Roll_Number` AS `Roll_Number`,`POR`.`StartDate` AS `StartDate`,`POR`.`EndDate` AS `EndDate` from `POR` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_project`
--

/*!50001 DROP TABLE IF EXISTS `student_project`*/;
/*!50001 DROP VIEW IF EXISTS `student_project`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_project` AS select `Project`.`Title` AS `Title`,`Project`.`Description` AS `Description`,`Project`.`Roll_Number` AS `Roll_Number`,`Project`.`StartDate` AS `StartDate`,`Project`.`EndDate` AS `EndDate` from `Project` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_technical`
--

/*!50001 DROP TABLE IF EXISTS `student_technical`*/;
/*!50001 DROP VIEW IF EXISTS `student_technical`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_technical` AS select `TechnicalSkill`.`Heading` AS `Heading`,`TechnicalSkill`.`Description` AS `Description`,`TechnicalSkill`.`Roll_Number` AS `Roll_Number` from `TechnicalSkill` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_traning`
--

/*!50001 DROP TABLE IF EXISTS `student_traning`*/;
/*!50001 DROP VIEW IF EXISTS `student_traning`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_traning` AS select `TrainingWorkshop`.`NameOfWorkshop` AS `NameOfWorkshop`,`TrainingWorkshop`.`Start date` AS `Start date`,`TrainingWorkshop`.`Roll_Number` AS `Roll_Number`,`TrainingWorkshop`.`Description` AS `Description`,`TrainingWorkshop`.`End date` AS `End date` from `TrainingWorkshop` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-17 23:05:17
