-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2024 at 05:15 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rapimoneydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `dni` int(11) NOT NULL,
  `nombres` text NOT NULL,
  `apellidos` text NOT NULL,
  `fecha_nacimiento` text DEFAULT NULL,
  `celular` text DEFAULT NULL,
  `correo` text DEFAULT NULL,
  `banco` text DEFAULT NULL,
  `numero_cci` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`dni`, `nombres`, `apellidos`, `fecha_nacimiento`, `celular`, `correo`, `banco`, `numero_cci`) VALUES
(12345678, 'Eduardo', 'Romero', '02/02/1950', '9816273568', 'eduardo@gmail.com', 'BCP', '1672893649'),
(14524368, 'Richard', 'Tuesta', '05/02/2002', '961725366', 'richard@gmail.com', 'BCP', '162756453'),
(15263542, 'Sebastian', 'Romero', '07/05/2003', '986453415', 'sebastian@gmail.com', 'BBVA', '15263545678'),
(15263846, 'Raquel', 'Altamirano', '06/07/1999', '981526456', 'raquel@gmail.com', 'BBVA', '1625256341'),
(16235467, 'Beto', 'Lopez', '07/03/1987', '987654236', 'beto@gmail.com', 'BCP', '12567384657'),
(16772282, 'Monica', 'Romero', '06/08/1967', '987654321', 'Monica@gmail.com', 'BCP', '16724536789'),
(17625345, 'Bubblr', 'Romero', '05/06/2001', '986523456', 'bub@gmail.com', 'BBVA', '1234567997'),
(72451624, 'Juan', 'Iwasaki', '02/02/1999', '9716524371', 'juan@gmail.com', 'BBVA', '16273494729'),
(74294862, 'Maricarmen', 'López Romero', '03/06/2002', '970657087', 'lopezromeromaricarmen03@gmail.com', 'BCP', '123456789'),
(74444399, 'Valentina', 'Ronan', '04/05/1999', '987654321', 'valentina@gmail.com', 'BCP', '567123456'),
(76156452, 'Mariana', 'Tuesta', '05/05/1999', '9876123456', 'mariana@gmail.com', 'BBVA', '162738490'),
(76543123, 'Cecilia', 'Torres', '06/08/2001', '987651243', 'ceci@gmail.com', 'BCP', '1234567890'),
(76546765, 'Daniel', 'Torres', '03/04/2002', '9816273645', 'dani@gmail.com', 'BBVA', '16273846154'),
(78564321, 'Mario', 'Torres', '06/12/2001', '987654342', 'mario@gmail.com', 'BCP', '1627356810'),
(734565423, 'Sthefany', 'Delgado', '07/07/2003', '987654321', 'sthefany@gmail.com', 'BCP', '16253647165'),
(765423561, 'Arturo', 'Bustamente', '07/03/1999', '98765416284', 'arturo@gmail.com', 'BBVA', '16273864976'),
(1638451729, 'Luis', 'Rodriguez', '05/05/2001', '987623543', 'luis@gmail.com', 'BBVA', '16273994628'),
(1782354671, 'Carlos', 'Perez', '05/08/2001', '9861725378', 'carlos@gmail.com', 'BBVA', '152638492716'),
(2147483647, 'Maria', 'Camacho', '01/01/1999', '9716283647', 'maria@gmail.com', 'BBVA', '16283547291');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `usuario` text NOT NULL,
  `contrasenia` text NOT NULL,
  `estado` char(1) NOT NULL,
  `dni` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `usuario`, `contrasenia`, `estado`, `dni`) VALUES
(1, 'Mari', '123456789', '1', 74294862),
(2, 'Monica200', 'bubble', '1', 16772282);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`dni`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `dni` (`dni`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `cliente` (`dni`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
