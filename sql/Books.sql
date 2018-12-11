/*SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO"; */
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Library`
--
/*CREATE DATABASE `Library` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;*/
USE `Library`; 

-- --------------------------------------------------------

--
-- Table structure for table `Books`
--
---am adaugat o variabila categorie
CREATE TABLE IF NOT EXISTS `Books` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  --`id_category` samllint(5),
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `category` varchar(50),
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  FOREIGN KEY (`id_category`) Categories (`id`),
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
---AM STERS Categories
CREATE TABLE IF NOT EXISTS `Categories` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
    `createdAt` timestamp,
  `updatedAt` timestamp,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


-- --------------------------------------------------------

--


CREATE TABLE IF NOT EXISTS `Details` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `language` varchar(30) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `price` double(2,2),
  `link` varchar(80),
  `isAvailable` tinyint(1),
  `createdAt` timestamp,
  `updatedAt` timestamp,
  `id_book` samllint(5),
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  FOREIGN KEY (`id_book`) Books (`id`),
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `FavoriteBooks` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
    `rating` double(2,2),
  `id_book` samllint(5),
  `createdAt` timestamp,
  `updatedAt` timestamp,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  FOREIGN KEY (`id_book`) Books (`id`),
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
