-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 30, 2025 at 06:11 PM
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
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `idbook` int NOT NULL,
  `title` varchar(75) NOT NULL,
  `author` varchar(75) NOT NULL,
  `publishedDate` date NOT NULL,
  `category_idcategory` int NOT NULL,
  `availability` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`idbook`, `title`, `author`, `publishedDate`, `category_idcategory`, `availability`) VALUES
(1, 'Discourses and Selected Writings', 'Epictetus', '2008-11-28', 1, 0),
(2, 'Colorless Tsukuru Tazaki', 'Murakami', '2013-04-12', 3, 1),
(3, 'A Court of Thorns and Roses', 'Sarah J. Maas', '2015-05-05', 4, 1),
(7, 'Pepsi Lovers', 'Anson Wong', '1998-05-09', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `idcategory` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`idcategory`, `name`, `description`) VALUES
(1, 'philosophy', 'Ancient Stoic texts'),
(2, 'fiction', 'Not Real'),
(3, 'magical realism', 'fantasty in a realistic tone'),
(4, 'fantasy', 'crazy shit');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `email`, `password`) VALUES
(1, 'test@gmail.com', 'qwerty1234'),
(2, 'meow@gmail.com', '$2y$10$U0aPtpV5/3dXzMxBNZ988unoxWVX4DM2GpBwP2gx9sput.TGP4kwm'),
(3, 'meow@gmail.com', '$2y$10$MU8dthLVAvogdQ78ZeaO.O3eYWaSk8XxInSKJxL7ZqdUJqzkyfVMe'),
(4, 'boom@gmail.com', '$2y$10$XlCv026R8GFnhLLgPKqYeebVMOtkgduDfmYS5UznC.D1hVY8eBj3O'),
(5, 'shayla@gmail.com', '$2y$10$1nOk7bL7eA6p63NkGtoVGemEXI7CfbdYJDxk.bjeCsj9iRxdR/L0O');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`idbook`),
  ADD KEY `fk_book_category_idx` (`category_idcategory`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idcategory`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `idbook` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `idcategory` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_book_category` FOREIGN KEY (`category_idcategory`) REFERENCES `category` (`idcategory`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
