-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 30, 2025 at 06:06 PM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `capycooks`
--

-- --------------------------------------------------------

--
-- Table structure for table `recipeCard`
--

CREATE TABLE `recipeCard` (
  `idrecipe` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `cuisine` varchar(45) NOT NULL,
  `servings` int NOT NULL,
  `time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `recipeCard`
--

INSERT INTO `recipeCard` (`idrecipe`, `name`, `cuisine`, `servings`, `time`) VALUES
(10, 'Pepsi Peter', 'British', 60, 40),
(12, 'Kairo’s Flame', 'Fusion', 1, 30),
(18, 'Gyeranbap', 'Korean', 1, 30),
(19, 'I love flowers', 'Korea', 1, 30),
(21, 'Pizzahut', 'American', 2, 70);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `email`, `password`) VALUES
(1, 'mrwong@gmail.com', '$2y$10$x6eXFDUDRqwDwAndHUWhmOwtE5wMKsio7fYhzCbyb4qNAH9ntbhoW'),
(4, 'mrjones@gmail.com', '$2y$10$yVZfju8zSW59uAHEywRy3.iFcTG52vDajrDOg9jp8euNGD49SeR9.'),
(5, 'mschua@gmail.com', '$2y$10$XsZKsMworQMhgTA0m1G7hOGoLFk.bnKX0tsciDXAgyn.651BmTDSq'),
(6, 'nga@gmail.com', '$2y$10$maoVQyutcCc7Z5kFxkKf6OC5FWYjVuZb2uKqpiOg3niypxNqc9h0i'),
(7, 'kruegerloriel@gmail.com', '$2y$10$tqjODaafEPaVqveVINQdxevAffrpsD8LZdXQ4HmraM9WSQCG/10HK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `recipeCard`
--
ALTER TABLE `recipeCard`
  ADD PRIMARY KEY (`idrecipe`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `recipeCard`
--
ALTER TABLE `recipeCard`
  MODIFY `idrecipe` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
