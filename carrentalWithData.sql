-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 05. Sep 2017 um 15:52
-- Server-Version: 10.1.26-MariaDB
-- PHP-Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AddInvoice`
--

CREATE TABLE `AddInvoice` (
  `addinvoiceID` int(11) NOT NULL,
  `checkid` int(11) NOT NULL,
  `charges` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `AddInvoice`
--

INSERT INTO `AddInvoice` (`addinvoiceID`, `checkid`, `charges`) VALUES
(1, 1, 50);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Car`
--

CREATE TABLE `Car` (
  `carid` int(11) NOT NULL,
  `locationid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `producer` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `fuel` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Car`
--

INSERT INTO `Car` (`carid`, `locationid`, `model`, `producer`, `year`, `fuel`) VALUES
(1, 1, 'tank', 'Hammer', 2017, 'petrol'),
(2, 2, 'racing car', 'porsche 911', 2005, 'diesel'),
(3, 3, 'family van', 'touran', 1999, 'petrol'),
(4, 4, 'limousine', 'vw golf', 2016, 'diesel'),
(5, 5, 'electro car', 'fiat 500', 2009, 'electro');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `CarCheck`
--

CREATE TABLE `CarCheck` (
  `checkid` int(11) NOT NULL,
  `returnid` int(11) NOT NULL,
  `description` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `CarCheck`
--

INSERT INTO `CarCheck` (`checkid`, `returnid`, `description`) VALUES
(1, 1, 'tank was not full'),
(2, 2, 'all okay'),
(3, 3, 'all okay'),
(4, 4, 'all okay'),
(5, 5, 'all okay');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Customer`
--

CREATE TABLE `Customer` (
  `userid` int(11) NOT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Customer`
--

INSERT INTO `Customer` (`userid`, `firstName`, `lastName`, `address`, `email`) VALUES
(1, 'Gregor', 'Mosthammer', 'Kellerberg 7', 'g.mosthammer@gmail.com'),
(2, 'Cecilia', 'Tanzer', 'Ferrogasse 12', 'cecilia.tanzer@yahoo.de'),
(3, 'Mathias', 'Böhler', 'Lassalle Straße 23', 'm.beohler@web.de'),
(4, 'Florian', 'Mach', 'Lava Gasse 4', 'mach2@gmx.at'),
(5, 'Thomas', 'Mandorfer', 'Pilgramgasse 72', 't.mandorfer@yahoo.de');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Invoice`
--

CREATE TABLE `Invoice` (
  `invoiceid` int(11) NOT NULL,
  `resid` int(11) NOT NULL,
  `paymentstatus` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Invoice`
--

INSERT INTO `Invoice` (`invoiceid`, `resid`, `paymentstatus`) VALUES
(1, 1, 'not paid'),
(2, 2, 'paid'),
(3, 3, 'paid'),
(4, 4, 'paid'),
(5, 5, 'paid');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Location`
--

CREATE TABLE `Location` (
  `locationid` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Location`
--

INSERT INTO `Location` (`locationid`, `address`) VALUES
(1, 'Hauptstraße 1'),
(2, 'Ringstraße 2'),
(3, 'Ottakringerstraße 3'),
(4, 'Am Hügel 4'),
(5, 'Baum Allee 5');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PickupCar`
--

CREATE TABLE `PickupCar` (
  `pickupid` int(11) NOT NULL,
  `locationid` int(11) NOT NULL,
  `invoiceid` int(11) NOT NULL,
  `timeDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `PickupCar`
--

INSERT INTO `PickupCar` (`pickupid`, `locationid`, `invoiceid`, `timeDate`) VALUES
(1, 1, 1, '2017-09-03'),
(2, 2, 2, '2017-08-30'),
(3, 3, 3, '2017-08-25'),
(4, 4, 4, '2017-09-01'),
(5, 5, 5, '2017-08-22');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Reservation`
--

CREATE TABLE `Reservation` (
  `resid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `carid` int(11) NOT NULL,
  `locationid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `Reservation`
--

INSERT INTO `Reservation` (`resid`, `userid`, `carid`, `locationid`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ReturnCar`
--

CREATE TABLE `ReturnCar` (
  `returnid` int(11) NOT NULL,
  `pickupid` int(11) NOT NULL,
  `locationid` int(11) NOT NULL,
  `timeDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ReturnCar`
--

INSERT INTO `ReturnCar` (`returnid`, `pickupid`, `locationid`, `timeDate`) VALUES
(1, 1, 5, '2017-09-07'),
(2, 2, 3, '2017-09-08'),
(3, 3, 1, '2017-09-11'),
(4, 4, 4, '2017-09-09'),
(5, 5, 2, '2017-09-14');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `AddInvoice`
--
ALTER TABLE `AddInvoice`
  ADD PRIMARY KEY (`addinvoiceID`),
  ADD KEY `checkid` (`checkid`);

--
-- Indizes für die Tabelle `Car`
--
ALTER TABLE `Car`
  ADD PRIMARY KEY (`carid`),
  ADD KEY `locationid` (`locationid`);

--
-- Indizes für die Tabelle `CarCheck`
--
ALTER TABLE `CarCheck`
  ADD PRIMARY KEY (`checkid`),
  ADD KEY `returnid` (`returnid`);

--
-- Indizes für die Tabelle `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`userid`);

--
-- Indizes für die Tabelle `Invoice`
--
ALTER TABLE `Invoice`
  ADD PRIMARY KEY (`invoiceid`),
  ADD KEY `resid` (`resid`);

--
-- Indizes für die Tabelle `Location`
--
ALTER TABLE `Location`
  ADD PRIMARY KEY (`locationid`);

--
-- Indizes für die Tabelle `PickupCar`
--
ALTER TABLE `PickupCar`
  ADD PRIMARY KEY (`pickupid`),
  ADD KEY `locationid` (`locationid`),
  ADD KEY `invoiceid` (`invoiceid`);

--
-- Indizes für die Tabelle `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`resid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `carid` (`carid`),
  ADD KEY `locationid` (`locationid`);

--
-- Indizes für die Tabelle `ReturnCar`
--
ALTER TABLE `ReturnCar`
  ADD PRIMARY KEY (`returnid`),
  ADD KEY `locationid` (`locationid`),
  ADD KEY `pickupid` (`pickupid`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `AddInvoice`
--
ALTER TABLE `AddInvoice`
  MODIFY `addinvoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `AddInvoice`
--
ALTER TABLE `AddInvoice`
  ADD CONSTRAINT `AddInvoice_ibfk_1` FOREIGN KEY (`checkid`) REFERENCES `CarCheck` (`checkid`);

--
-- Constraints der Tabelle `Car`
--
ALTER TABLE `Car`
  ADD CONSTRAINT `Car_ibfk_1` FOREIGN KEY (`locationid`) REFERENCES `Location` (`locationid`);

--
-- Constraints der Tabelle `CarCheck`
--
ALTER TABLE `CarCheck`
  ADD CONSTRAINT `CarCheck_ibfk_1` FOREIGN KEY (`returnid`) REFERENCES `ReturnCar` (`returnid`);

--
-- Constraints der Tabelle `Invoice`
--
ALTER TABLE `Invoice`
  ADD CONSTRAINT `Invoice_ibfk_1` FOREIGN KEY (`resid`) REFERENCES `Reservation` (`resid`);

--
-- Constraints der Tabelle `PickupCar`
--
ALTER TABLE `PickupCar`
  ADD CONSTRAINT `PickupCar_ibfk_1` FOREIGN KEY (`locationid`) REFERENCES `Location` (`locationid`),
  ADD CONSTRAINT `PickupCar_ibfk_2` FOREIGN KEY (`invoiceid`) REFERENCES `Invoice` (`invoiceid`);

--
-- Constraints der Tabelle `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `Customer` (`userid`),
  ADD CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`carid`) REFERENCES `Car` (`carid`),
  ADD CONSTRAINT `Reservation_ibfk_3` FOREIGN KEY (`locationid`) REFERENCES `Location` (`locationid`);

--
-- Constraints der Tabelle `ReturnCar`
--
ALTER TABLE `ReturnCar`
  ADD CONSTRAINT `ReturnCar_ibfk_1` FOREIGN KEY (`locationid`) REFERENCES `Location` (`locationid`),
  ADD CONSTRAINT `ReturnCar_ibfk_2` FOREIGN KEY (`pickupid`) REFERENCES `PickupCar` (`pickupid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
