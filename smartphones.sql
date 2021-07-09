-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2020 at 05:32 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartphones`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `phones_id_cart` int(11) NOT NULL,
  `users_id_cart` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `phones_id_cart`, `users_id_cart`) VALUES
(88, 6, 10),
(1, 9, 1),
(2, 10, 1),
(92, 17, 10),
(93, 17, 10),
(94, 20, 10);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `text` varchar(127) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `text`, `users_id`) VALUES
(5, 'I love A10! Really!', 10),
(6, 'What do you think about J7?', 2),
(12, 'Which one, 2016 or 2017?', 10),
(13, 'Hello, you still there, ******?', 10),
(32, 'Keep in mind, no profanity!', 1),
(36, 'Hi, you know any minecraft pirate servers I can play fortnite on XD ???', 15),
(37, 'Hmmm, that is kinda out of topic, right?', 10),
(42, 'Hemloo', 10),
(43, 'Anyone online? ', 10),
(60, 'This app is never gonna get updated huh? ', 18),
(62, 'Yes it is', 1),
(63, 'Well I don\'t see many improvements in here', 10),
(64, 'It\'s mostly half functional', 10);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` int(11) NOT NULL,
  `name` varchar(127) NOT NULL,
  `country` varchar(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`, `country`) VALUES
(1, 'Samsung', 'South Korea'),
(2, 'Lenovo', 'China'),
(3, 'Huawei', 'China'),
(4, 'Sony', 'Japan'),
(5, 'Nokia', 'Finland'),
(7, 'Honor', 'China');

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `id` int(11) NOT NULL,
  `model` varchar(127) NOT NULL,
  `year` int(4) NOT NULL,
  `image` varchar(127) DEFAULT 'ic_mobile.png',
  `description` varchar(127) NOT NULL,
  `resolution` varchar(127) NOT NULL,
  `storage` varchar(127) NOT NULL,
  `cost` varchar(127) NOT NULL,
  `manufacturer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phones`
--

INSERT INTO `phones` (`id`, `model`, `year`, `image`, `description`, `resolution`, `storage`, `cost`, `manufacturer_id`) VALUES
(1, 'J7 (2016)', 2016, 'samsung_galaxy_j7_2016.jpg', '', '', '', '0', 1),
(2, 'K3 Note', 2015, 'lenovo_k3_note.jpg', '', '', '', '0', 2),
(4, 'P20', 2018, 'huawei_p20.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1600x900', '64GB', '200', 3),
(5, 'Galaxy J5 Prime', 2016, 'ic_mobile.png', '', '', '', '0', 1),
(6, 'Note7', 2016, 'samsung_galaxy_note7.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1600x900', '64GB', '200', 1),
(7, 'Galaxy S7 Active', 2016, 'ic_mobile.png', '', '', '', '0', 1),
(9, 'Galaxy S7 Edge', 2016, 'ic_mobile.png', '', '', '', '0', 1),
(10, 'Galaxy A7 (2016)', 2016, 'ic_mobile.png', '', '', '', '0', 1),
(11, 'Galaxy Fold', 2019, 'ic_mobile.png', '', '', '', '0', 1),
(12, 'Galaxy A5 (2017)', 2017, 'ic_mobile.png', '', '', '', '0', 1),
(13, 'Z3', 2015, 'sony_xperia_z3.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1280x720', '64GB', '150', 4),
(14, 'Galaxy View2', 2019, 'ic_mobile.png', '', '', '', '0', 1),
(15, 'Galaxy A2 Core', 2019, 'ic_mobile.png', '', '', '', '0', 1),
(16, 'Galaxy A80', 2019, 'ic_mobile.png', '', '', '', '0', 1),
(17, 'Xperia Z5 Compact', 2015, 'sony_z5_compact.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1280x720', '32GB', '200', 4),
(18, 'Xperia M5', 2015, 'sony_xperia_m5.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1280x720', '32GB', '170', 4),
(19, 'Xperia Z3+', 2015, 'sony_xperia_z3_plus.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1280x720', '32GB', '130', 4),
(20, 'Xperia XZ', 2016, 'sony_xperia_xz.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1280x720', '64GB', '300', 4),
(21, 'Xperia XZ1', 2017, 'sony_xperia_xz1_ofic.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1280x720', '64GB', '390', 4),
(22, 'Xperia XZ1 Compact', 2017, 'sony_xperia_xz1_compact.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1280x720', '64GB', '340', 4),
(23, 'Xperia XZ2', 2018, 'sony_xperia_xz2.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1920x1080', '1128GB', '490', 4),
(24, 'Xperia XZ2 Compact', 2018, 'sony_xperia_xz2_compact.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1920x1080', '128GB', '420', 4),
(25, 'Xperia 10', 2019, 'sony_xperia_10.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1920x1080', '128GB', '600', 4),
(26, 'Xperia 1', 2019, 'sony_xperia_1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1920x1080', '128GB', '550', 4),
(27, 'Xperia 10 Plus', 2019, 'sony_xperia_10_plus.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1920x1080', '128GB', '650', 4),
(28, 'P30', 2019, 'huawei_p30.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1600x900', '64GB', '200', 3),
(29, 'P30 Pro', 2019, 'huawei_p30_pro.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1600x900', '64GB', '200', 3),
(30, 'Mate 20', 2018, 'huawei_mate_20.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1600x900', '64GB', '200', 3),
(31, 'Mate 20 X', 2018, 'huawei_mate_20x.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1600x900', '64GB', '200', 3),
(32, 'Mate 20 Pro', 2018, 'huawei_mate_20_pro_1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1600x900', '64GB', '200', 3),
(33, 'Mate 10', 2017, 'huawei_mate10.jpg', '', '', '', '0', 3),
(34, '', 2017, 'huawei_mate10_pro.jpg', '', '', '', '0', 3),
(35, 'P10', 2017, 'huawei_p10.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1600x900', '64GB', '200', 3),
(36, 'P10 Plus', 2017, 'huawei_p10_plus_r1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '1600x900', '64GB', '200', 3);

-- --------------------------------------------------------

--
-- Table structure for table `phone_comments`
--

CREATE TABLE `phone_comments` (
  `id` int(11) NOT NULL,
  `text` varchar(127) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phone_comments`
--

INSERT INTO `phone_comments` (`id`, `text`, `user_id`, `phone_id`) VALUES
(1, 'Test 1 test 2', 1, 1),
(2, 'this is a super test', 10, 1),
(3, 'Nothing wrong with me', 10, 1),
(4, 'Zbhsdfhcj', 10, 13),
(6, 'Sorry my cat stepped on my keyboard ', 10, 13);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `rating` int(1) NOT NULL,
  `phones_id_rating` int(11) NOT NULL,
  `users_id_rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `rating`, `phones_id_rating`, `users_id_rating`) VALUES
(3, 5, 1, 2),
(4, 3, 1, 10),
(8, 5, 2, 10),
(9, 4, 13, 10),
(10, 3, 4, 10),
(13, 3, 13, 15),
(14, 5, 4, 15),
(15, 4, 2, 15),
(17, 2, 10, 10),
(18, 5, 17, 10),
(19, 4, 32, 10),
(21, 3, 9, 10),
(29, 3, 7, 10),
(30, 3, 6, 10),
(31, 2, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(127) NOT NULL,
  `password` varchar(127) NOT NULL,
  `email` varchar(127) NOT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `readmsgs` int(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `imageurl`, `readmsgs`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', 'profile.png', 13),
(2, 'Joestar', 'joestar123', 'josephjoestar@gmail.com', NULL, 0),
(10, 'user', 'user', 'user123@gmail.com', 'user.png', 13),
(15, 'Dood', 'dood', 'dood@gmail.com', NULL, 0),
(16, 'Delete Me', 'delete', 'delete@gmail.com', NULL, 0),
(18, 'Testooo', 'test', 'test@gmail.com', NULL, 0),
(19, 'newTest', 'toasty123', 'testinator@gmail.com', NULL, 0),
(29, 'Macak Tosa', 'misevimjau', 'macak@gmail.com', NULL, 0),
(39, 'hashisgood', '35e5d160921d131d9114f1b4ee5f9d55', 'hashbad@gmail.com', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_phones`
--

CREATE TABLE `user_phones` (
  `id` int(11) NOT NULL,
  `model` varchar(127) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(127) NOT NULL DEFAULT 'ic_mobile.png',
  `description` varchar(127) NOT NULL,
  `cost` varchar(127) NOT NULL,
  `phone_number` varchar(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_phones`
--

INSERT INTO `user_phones` (`id`, `model`, `user_id`, `image`, `description`, `cost`, `phone_number`) VALUES
(1, 'Samsung Galaxy S8', 2, 'ic_mobile.png', 'User for 6 months, in perfect shape, only a small scratch on the back.', '290', '+38268656712'),
(5, 'Sony', 1, 'ic_mobile.png', 'Udxhajis', '22', '228282');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `phones_id_wishlist` int(11) NOT NULL,
  `users_id_wishlist` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `phones_id_wishlist`, `users_id_wishlist`) VALUES
(60, 1, 10),
(53, 2, 10),
(3, 5, 1),
(58, 6, 10),
(2, 7, 1),
(4, 9, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phones_id_cart` (`phones_id_cart`,`users_id_cart`),
  ADD KEY `users_id_cart` (`users_id_cart`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manufacturer_id` (`manufacturer_id`);

--
-- Indexes for table `phone_comments`
--
ALTER TABLE `phone_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone_id` (`phone_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phones_id_rating` (`phones_id_rating`),
  ADD KEY `users_id_rating` (`users_id_rating`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_phones`
--
ALTER TABLE `user_phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phones_id_wishlist` (`phones_id_wishlist`,`users_id_wishlist`),
  ADD KEY `users_id_wishlist` (`users_id_wishlist`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `phone_comments`
--
ALTER TABLE `phone_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `user_phones`
--
ALTER TABLE `user_phones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`phones_id_cart`) REFERENCES `phones` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`users_id_cart`) REFERENCES `users` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `phones`
--
ALTER TABLE `phones`
  ADD CONSTRAINT `phones_ibfk_1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`);

--
-- Constraints for table `phone_comments`
--
ALTER TABLE `phone_comments`
  ADD CONSTRAINT `phone_comments_ibfk_1` FOREIGN KEY (`phone_id`) REFERENCES `phones` (`id`),
  ADD CONSTRAINT `phone_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`phones_id_rating`) REFERENCES `phones` (`id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`users_id_rating`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_phones`
--
ALTER TABLE `user_phones`
  ADD CONSTRAINT `user_phones_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`phones_id_wishlist`) REFERENCES `phones` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`users_id_wishlist`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
