CREATE DATABASE library_management_system;
USE library_management_system;

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `Author_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  PRIMARY KEY (`Author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13729 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `Isbn` char(20) NOT NULL DEFAULT '0000000000',
  `Title` varchar(500) NOT NULL,
  `No_of_copies` int(11) NOT NULL DEFAULT '5',
  PRIMARY KEY (`Isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `book_authors`;
CREATE TABLE IF NOT EXISTS `book_authors` (
  `Author_id` int(20) NOT NULL AUTO_INCREMENT,
  `Isbn` char(20) NOT NULL DEFAULT '0000000000',
  PRIMARY KEY (`Author_id`,`Isbn`),
  KEY `fk_book_authors_isbn` (`Isbn`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `borrower`;
CREATE TABLE IF NOT EXISTS `borrower` (
  `Card_no` int(10) NOT NULL AUTO_INCREMENT,
  `Ssn` char(11) NOT NULL,
  `Fname` varchar(16) NOT NULL,
  `Lname` varchar(16) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` varchar(64) DEFAULT NULL,
  `City` varchar(16) DEFAULT NULL,
  `State` varchar(16) DEFAULT NULL,
  `Phone` char(14) DEFAULT NULL,
  PRIMARY KEY (`Card_no`)
) ENGINE=MyISAM AUTO_INCREMENT=1005 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `book_loans`;
CREATE TABLE IF NOT EXISTS `book_loans` (
  `Loan_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Book_id` varchar(20) NOT NULL,
  `Card_no` char(20) NOT NULL,
  `Date_out` date DEFAULT NULL,
  `Due_date` date DEFAULT NULL,
  `Date_in` date DEFAULT NULL,
  PRIMARY KEY (`Loan_id`),
  KEY `fk_book_loans_card_no` (`Card_no`),
  KEY `Book_id` (`Book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `fines`;
CREATE TABLE IF NOT EXISTS `fines` (
  `Loan_id` int(10) UNSIGNED NOT NULL,
  `Fine_amt` decimal(10,2) NOT NULL,
  `Paid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Loan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `library_branch`;
CREATE TABLE IF NOT EXISTS `library_branch` (
  `Branch_id` tinyint(1) UNSIGNED NOT NULL,
  `Branch_name` varchar(32) NOT NULL,
  `Address` varchar(64) NOT NULL,
  PRIMARY KEY (`Branch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `book_copies`;
CREATE TABLE IF NOT EXISTS `book_copies` (
  `Book_id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Isbn` char(20) NOT NULL DEFAULT '0000000000',
  `Branch_id` tinyint(1) UNSIGNED NOT NULL,
  `No_of_Copies` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`Book_id`),
  KEY `pk_book_copies_isbn` (`Isbn`),
  KEY `pk_book_copies_branch_id` (`Branch_id`)
) ENGINE=MyISAM AUTO_INCREMENT=125001 DEFAULT CHARSET=latin1;


ALTER TABLE `book_loans`
  ADD CONSTRAINT `fk_book_loans_book_id` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Isbn`);
COMMIT;