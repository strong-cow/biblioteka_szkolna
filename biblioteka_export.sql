# ************************************************************
# Sequel Ace SQL dump
# Version 20044
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.5.10-MariaDB-1:10.5.10+maria~bionic)
# Database: biblioteka
# Generation Time: 2022-12-25 19:44:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ksiazki
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ksiazki`;

CREATE TABLE `ksiazki` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tytul` varchar(64) DEFAULT NULL,
  `autor` varchar(64) DEFAULT NULL,
  `data_wydania` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `ksiazki` WRITE;
/*!40000 ALTER TABLE `ksiazki` DISABLE KEYS */;

INSERT INTO `ksiazki` (`id`, `tytul`, `autor`, `data_wydania`)
VALUES
	(1,'Lalka','prus','2023-01-01'),
	(2,'Mały Książe','albert','1999-12-31'),
	(3,'Start','with','2012-12-12'),
	(4,'Pan raczy żartować Panie Feynam!','Richard P. Feynam','2002-01-01'),
	(5,'Katarynka','Bolesław Prus','1930-01-01');

/*!40000 ALTER TABLE `ksiazki` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table uczniowie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `uczniowie`;

CREATE TABLE `uczniowie` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `imie` varchar(64) DEFAULT NULL,
  `nazwisko` varchar(64) DEFAULT NULL,
  `klasa` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `uczniowie` WRITE;
/*!40000 ALTER TABLE `uczniowie` DISABLE KEYS */;

INSERT INTO `uczniowie` (`id`, `imie`, `nazwisko`, `klasa`)
VALUES
	(1,'maciek','krowa','5a'),
	(2,'kacper','miałczek','5a'),
	(3,'brat','ali','4a'),
	(4,'maciek','nowak','4a'),
	(5,'ala','strugaru','1a'),
	(6,'zbigniew','bomba','4a');

/*!40000 ALTER TABLE `uczniowie` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wypozyczenia
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wypozyczenia`;

CREATE TABLE `wypozyczenia` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uczniowie_id` int(11) unsigned NOT NULL,
  `ksiazki_id` int(10) unsigned NOT NULL,
  `data_wypozyczenia` datetime NOT NULL,
  `data_zwrotu` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uczniowie_id_2` (`uczniowie_id`,`ksiazki_id`),
  KEY `ksiazki_id` (`ksiazki_id`),
  KEY `uczniowie_id` (`uczniowie_id`),
  CONSTRAINT `r01` FOREIGN KEY (`ksiazki_id`) REFERENCES `ksiazki` (`id`),
  CONSTRAINT `r02` FOREIGN KEY (`uczniowie_id`) REFERENCES `uczniowie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `wypozyczenia` WRITE;
/*!40000 ALTER TABLE `wypozyczenia` DISABLE KEYS */;

INSERT INTO `wypozyczenia` (`id`, `uczniowie_id`, `ksiazki_id`, `data_wypozyczenia`, `data_zwrotu`)
VALUES
	(9,5,1,'2022-12-01 12:25:25','2023-01-02 12:12:59'),
	(15,5,2,'2022-12-01 12:25:25',NULL),
	(16,2,3,'2022-11-24 11:19:59',NULL),
	(17,1,5,'2022-12-25 19:43:08',NULL),
	(18,4,4,'2022-12-21 13:00:00','2022-12-21 13:05:00');

/*!40000 ALTER TABLE `wypozyczenia` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
