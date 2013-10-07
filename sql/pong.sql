-- phpMyAdmin SQL Dump
-- version 3.4.10.2
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 04, 2013 at 09:25 PM
-- Server version: 5.5.33
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pong`
--

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

CREATE TABLE IF NOT EXISTS `help` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `onderwerp` tinytext NOT NULL,
  `uitleg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='De help bij Pong.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nieuws`
--

CREATE TABLE IF NOT EXISTS `nieuws` (
  `datum` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `item` text NOT NULL,
  PRIMARY KEY (`datum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Nieuwsitems voor de pongsite.';

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE IF NOT EXISTS `scores` (
  `mens` text NOT NULL,
  `ai` text NOT NULL,
  `score` tinytext NOT NULL,
  `niveau` tinytext NOT NULL,
  `tijd` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tijd`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='De scores van spelers.';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
