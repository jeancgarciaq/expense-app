-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 15, 2020 at 04:10 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expense-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `color` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `color`) VALUES
(null, 'comida', '#DE1F59'),
(null 'hogar', '#DE1FAA'),
(null, 'ropa', '#B01FDE'),
(null, 'Juegos', '#681FDE'),
(null, 'Viajes', '#1FAADE');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `category_id` int(5) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `date` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `title`, `category_id`, `amount`, `date`, `id_user`) VALUES
(null, 'prueba', 3, 12.40, '2020-03-21', 5),
(null, 'starbucks', 1, 60.00, '2020-03-21', 5),
(null, 'Regalo de cumpleaños mamá', 2, 1200.00, '2020-03-22', 5),
(null, 'Nintendo Switch', 4, 4600.00, '2020-03-26', 5),
(null, 'Viaje a Nueva York', 5, 20000.00, '2020-01-25', 5),
(null, 'Chocolates Ferrero', 1, 140.00, '2020-03-27', 5),
(null, 'sdsdsd', 1, 2323.00, '2020-04-03', 5),
(null, 'sadas', 1, 232.00, '2020-04-03', 5),
(null, 'sadas', 3, 11.00, '2020-04-03', 5),
(null, 'sdsd', 5, 23.00, '2020-04-03', 5),
(null, 'sdsd', 5, 23.00, '2020-04-03', 5),
(null, 'Chilis', 1, 300.00, '2020-01-01', 5),
(null, 'juego de Halo', 4, 1100.00, '2020-04-04', 5),
(null, 'Uñas', 3, 200.00, '2020-04-09', 6),
(null, 'pastillas para la tos', 2, 21.00, '2020-06-06', 5),
(null, 'Ropa nueva', 3, 300.00, '2020-06-04', 5),
(null, 'juego Nintendo', 2, 200.00, '2020-07-12', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL,
  `budget` float(10,2) NOT NULL,
  `photo` varchar(300) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `budget`, `photo`, `name`) VALUES
(NULL, 'marcos', '$2y$10$0aOmd1LTFHtBLCEtDrJgy.xxs7FArnOlzHXLrviwP85LWS.XbxsNO', 'user', 100.00, 'd8eb8c58160f13143d4c6ef11c34b57a.png', 'Marcos Rivas'),
(NULL, 'lena', '$2y$10$C/MX.IRvzrNuMyo4pk5uU.bCD20hSWChoCM1bp4n3kEzO2TYamSI.', 'user', 16000.00, '', 'Lenis'),
(NULL, 'omar', '$2y$10$2YzZ9yzk2rSLbcbfBGkcIuWZ1HzjcNT8lTcgeidTiYbq2yzcNVxuq', 'user', 20000.00, '', 'El Pozos');

--
-- Indexes for dumped tables
--

-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD KEY `id_user_expense` (`id_user`),
  ADD KEY `id_category_expense` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `id_category_expense` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `id_user_expense` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
