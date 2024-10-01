-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 18. Jun 2024 um 17:20
-- Server-Version: 10.4.24-MariaDB
-- PHP-Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `Liga`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Ort`
--

CREATE TABLE `Ort` (
  `PLZ` int(11) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Ort`
--

INSERT INTO `Ort` (`PLZ`, `Name`) VALUES
(6114, 'Halle an der Saale'),
(10178, 'Berlin'),
(18069, 'Rostock'),
(21035, 'Hamburg'),
(50672, 'Koeln'),
(80331, 'Muenchen');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Spiele`
--

CREATE TABLE `Spiele` (
  `Spiel_ID` int(11) NOT NULL,
  `Verein1_ID` int(11) NOT NULL,
  `Verein2_ID` int(11) NOT NULL,
  `Tore_Verein1` int(11) DEFAULT 0,
  `Tore_Verein2` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Spiele`
--

INSERT INTO `Spiele` (`Spiel_ID`, `Verein1_ID`, `Verein2_ID`, `Tore_Verein1`, `Tore_Verein2`) VALUES
(1, 1, 3, NULL, NULL),
(2, 6, 3, NULL, NULL),
(3, 4, 3, NULL, NULL),
(4, 2, 3, NULL, NULL),
(5, 5, 3, NULL, NULL),
(6, 3, 1, NULL, NULL),
(7, 6, 1, NULL, NULL),
(8, 4, 1, NULL, NULL),
(9, 2, 1, NULL, NULL),
(10, 5, 1, NULL, NULL),
(11, 3, 6, NULL, NULL),
(12, 1, 6, NULL, NULL),
(13, 4, 6, NULL, NULL),
(14, 2, 6, NULL, NULL),
(15, 5, 6, NULL, NULL),
(16, 3, 4, NULL, NULL),
(17, 1, 4, NULL, NULL),
(18, 6, 4, NULL, NULL),
(19, 2, 4, NULL, NULL),
(20, 5, 4, NULL, NULL),
(21, 3, 2, NULL, NULL),
(22, 1, 2, NULL, NULL),
(23, 6, 2, NULL, NULL),
(24, 4, 2, NULL, NULL),
(25, 5, 2, NULL, NULL),
(26, 3, 5, NULL, NULL),
(27, 1, 5, NULL, NULL),
(28, 6, 5, NULL, NULL),
(29, 4, 5, NULL, NULL),
(30, 2, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Spieler`
--

CREATE TABLE `Spieler` (
  `Spieler_ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Vorname` text NOT NULL,
  `Vereins_ID` int(11) NOT NULL,
  `Spieler_PLZ` int(11) NOT NULL,
  `Tore` int(11) NOT NULL,
  `Tore_gesamt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Tabelle`
--

CREATE TABLE `Tabelle` (
  `Tabelle_ID` int(11) NOT NULL,
  `Vereins_ID` int(11) NOT NULL,
  `Punkte` int(11) DEFAULT NULL,
  `Siege` int(11) DEFAULT NULL,
  `Niederlagen` int(11) DEFAULT NULL,
  `Platz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Tabelle`
--

INSERT INTO `Tabelle` (`Tabelle_ID`, `Vereins_ID`, `Punkte`, `Siege`, `Niederlagen`, `Platz`) VALUES
(1, 3, 0, 0, 0, 0),
(2, 1, 0, 0, 0, 0),
(3, 6, 0, 0, 0, 0),
(4, 4, 0, 0, 0, 0),
(5, 2, 0, 0, 0, 0),
(6, 5, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Vereine`
--

CREATE TABLE `Vereine` (
  `VereinsID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Verein_PLZ` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Vereine`
--

INSERT INTO `Vereine` (`VereinsID`, `Name`, `Verein_PLZ`) VALUES
(1, 'SV Berlin', 10178),
(2, 'SV Koeln', 50672),
(3, 'SV Halle', 6114),
(4, 'SV Hamburg', 21035),
(5, 'SV Muenchen', 80331),
(6, 'SV Rostock', 18069);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Ort`
--
ALTER TABLE `Ort`
  ADD PRIMARY KEY (`PLZ`);

--
-- Indizes für die Tabelle `Spiele`
--
ALTER TABLE `Spiele`
  ADD PRIMARY KEY (`Spiel_ID`),
  ADD KEY `Verein1_ID` (`Verein1_ID`),
  ADD KEY `Verein2_ID` (`Verein2_ID`);

--
-- Indizes für die Tabelle `Spieler`
--
ALTER TABLE `Spieler`
  ADD KEY `Spieler_PLZ` (`Spieler_PLZ`),
  ADD KEY `Vereins_ID` (`Vereins_ID`);


INSERT INTO `Spieler` (`Spieler_ID`, `Name`, `Vorname`, `Vereins_ID`, `Spieler_PLZ`, `Tore`, `Tore_gesamt`) VALUES
(1, 'Mueller', 'Thomas', 1, 10178, 5, 50),
(2, 'Schmidt', 'Manuel', 1, 10178, 3, 30),
 
(3, 'Schneider', 'Peter', 2, 50672, 2, 20),
(4, 'Klein', 'Frank', 2, 50672, 4, 40),
 
(5, 'Mayer', 'Lukas', 3, 6114, 1, 15),
(6, 'Fischer', 'Stefan', 3, 6114, 6, 60),
 
(7, 'Weber', 'Hans', 4, 21035, 2, 25),
(8, 'Lehmann', 'Jan', 4, 21035, 4, 45),
 
(9, 'Walter', 'Max', 5, 80331, 3, 35),
(10, 'Hoffmann', 'Karl', 5, 80331, 5, 55),
 
(11, 'Koenig', 'Paul', 6, 18069, 1, 10),
(12, 'Bauer', 'Tim', 6, 18069, 7, 70);
--
-- Indizes für die Tabelle `Tabelle`
--
ALTER TABLE `Tabelle`
  ADD PRIMARY KEY (`Tabelle_ID`),
  ADD KEY `Vereins_ID` (`Vereins_ID`);

--
-- Indizes für die Tabelle `Vereine`
--
ALTER TABLE `Vereine`
  ADD PRIMARY KEY (`VereinsID`),
  ADD KEY `Verein_PLZ` (`Verein_PLZ`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Spiele`
--
ALTER TABLE `Spiele`
  MODIFY `Spiel_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT für Tabelle `Tabelle`
--
ALTER TABLE `Tabelle`
  MODIFY `Tabelle_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Spiele`
--
ALTER TABLE `Spiele`
  ADD CONSTRAINT `Spiele_ibfk_1` FOREIGN KEY (`Verein1_ID`) REFERENCES `Vereine` (`VereinsID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Spiele_ibfk_2` FOREIGN KEY (`Verein2_ID`) REFERENCES `Vereine` (`VereinsID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Spieler`
--
ALTER TABLE `Spieler`
  ADD CONSTRAINT `Spieler_ibfk_1` FOREIGN KEY (`Vereins_ID`) REFERENCES `Vereine` (`VereinsID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Spieler_ibfk_2` FOREIGN KEY (`Spieler_PLZ`) REFERENCES `Ort` (`PLZ`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Tabelle`
--
ALTER TABLE `Tabelle`
  ADD CONSTRAINT `Tabelle_ibfk_1` FOREIGN KEY (`Vereins_ID`) REFERENCES `Vereine` (`VereinsID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Vereine`
--
ALTER TABLE `Vereine`
  ADD CONSTRAINT `Vereine_ibfk_1` FOREIGN KEY (`Verein_PLZ`) REFERENCES `Ort` (`PLZ`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
