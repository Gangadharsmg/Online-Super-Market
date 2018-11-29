-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2018 at 05:23 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `total` (OUT `total` INT)  NO SQL
    DETERMINISTIC
select sum(tax) INTO total from cart$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `c_id` int(11) NOT NULL,
  `c_u_id` int(11) NOT NULL,
  `c_p_id` int(11) NOT NULL,
  `c_name` varchar(100) NOT NULL,
  `c_image` varchar(100) NOT NULL,
  `c_price` int(11) NOT NULL,
  `tax` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`c_id`, `c_u_id`, `c_p_id`, `c_name`, `c_image`, `c_price`, `tax`) VALUES
(1, 1, 25, 'Dark fantasy biscuit - (75g)', 'images/24.jpg', 20, 19),
(2, 1, 20, 'Mysore sandal soap - (75g)', 'images/42.jpg', 35, 33.25),
(3, 1, 25, 'Dark fantasy biscuit - (75g)', 'images/24.jpg', 20, 19);

--
-- Triggers `cart`
--
DELIMITER $$
CREATE TRIGGER `tax` BEFORE INSERT ON `cart` FOR EACH ROW set new.tax=(new.c_price-(new.c_price*0.05))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `username`, `email`, `mobile`, `message`) VALUES
(1, 'Gangadhar', 'gangadhar.smg24@gmai', '9483845366', 'Thank you');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacktbl`
--

CREATE TABLE `feedbacktbl` (
  `f_id` int(11) NOT NULL,
  `fullname` varchar(20) NOT NULL,
  `feedback` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedbacktbl`
--

INSERT INTO `feedbacktbl` (`f_id`, `fullname`, `feedback`) VALUES
(1, 'Gangadhar', 'One of the best ecommerce website, easy to use'),
(2, 'Bharath', 'Very good , thank you'),
(3, 'Pooja', 'Nice one'),
(4, 'Harshith', 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ord_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `fullname` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `pincode` int(6) NOT NULL,
  `city` varchar(15) NOT NULL,
  `state` varchar(15) NOT NULL,
  `mobile` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ord_id`, `p_id`, `fullname`, `address`, `pincode`, `city`, `state`, `mobile`) VALUES
(1, 1, 'Gangadhar', 'Sagaranahalli', 572226, 'Tumkur', 'Karnataka', '+919483845'),
(2, 1, 'Gangadhar', 'Sagaranahalli', 572226, 'Tumkur', 'Karnataka', '+919483845366'),
(3, 12, 'Bharath', 'Tumkur', 572221, 'Tumkur', 'Karnataka', '+919413321446'),
(4, 12, 'Bharath', 'Tumkur', 572221, 'Tumkur', 'Karnataka', '+919413321446');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_image` varchar(500) NOT NULL,
  `p_price` int(11) NOT NULL,
  `p_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`p_id`, `p_name`, `p_image`, `p_price`, `p_type`) VALUES
(1, 'Nandini pure cow ghee - (500ml)', 'images/45.jpg', 222, 'Headphone'),
(2, 'Aashirvad wheat flour - (5KG)', 'images/46.jpg', 240, 'Headphone'),
(3, 'Everest garam masala - (50g)', 'images/47.jpg', 40, 'Headphone'),
(4, 'MTR puliogare powder - (200g)', 'images/48.jpg', 72, 'Headphone'),
(5, 'MTR rasam powder - (200g)', 'images/49.jpg', 77, 'Headphone'),
(6, 'Fortune sunlite refined sunflower oil - (910g)', 'images/50.jpg', 99, 'Headphone'),
(7, 'Saffola gold edible oil - (5 ltr)', 'images/51.jpg', 649, 'Headphone'),
(8, 'Sunpure refined oil - (1 ltr)', 'images/52.jpg', 96, 'Headphone'),
(9, 'India gate basmati rice - (5kg)', 'images/53.jpg', 425, 'Headphone'),
(10, 'Sunsilk stunning shine black - (180ml)', 'images/32.jpg', 72, 'Tshirt'),
(11, 'Pantene hair fall control - (1 L)', 'images/33.jpg', 420, 'Tshirt'),
(12, 'Dove hair fall rescue conditioner - (180ml)', 'images/34.jpg', 135, 'Tshirt'),
(13, 'Head and Shoulders cool menthol - (180ml)', 'images/35.jpg', 490, 'Tshirt'),
(14, 'Dettol hand wash - (750ml)', 'images/37.jpg', 90, 'Tshirt'),
(15, 'Treseme smooth and shine - (180ml)', 'images/36.jpg', 90, 'Tshirt'),
(16, 'Lifebuoy handwash - (185ml)', 'images/38.jpg', 46, 'Tshirt'),
(17, 'Himalaya neem face wash - (100ml)', 'images/39.jpg', 113, 'Tshirt'),
(18, 'Garnier men oil clear face wash - (100g)', 'images/40.jpg', 142, 'Tshirt'),
(19, 'Nivea men all in one face wash - (50g)', 'images/41.jpg', 75, 'Tshirt'),
(20, 'Mysore sandal soap - (75g)', 'images/42.jpg', 35, 'Tshirt'),
(21, 'Maggi nutri-licious atta noodles - (300g)', 'images/20.jpg', 75, 'Watches'),
(22, 'Sunfeast yippee Noodles - (280g)', 'images/21.jpg', 45, 'Watches'),
(23, 'MTR vermicelli - (165g)', 'images/22.jpg', 20, 'Watches'),
(24, 'Bambino vermicelli - (400g)', 'images/23.jpg', 37, 'Watches'),
(25, 'Dark fantasy biscuit - (75g)', 'images/24.jpg', 20, 'Watches'),
(26, 'Oreo biscuit - (120g)', 'images/26.jpg', 28, 'Watches'),
(27, 'Cadbury dairy milk - (13g)', 'images/27.jpg', 10, 'Watches'),
(28, 'Cadbury dairy milk silk - (150g)', 'images/28.jpg', 60, 'Watches'),
(29, 'Britania bourbon - (120g)', 'images/25.jpg', 20, 'Watches'),
(30, 'Pears pure and gentle - (75g)', 'images/43.jpg', 40, 'Tshirt'),
(31, 'Dove cream beauty bathing bar - (75g)', 'images/44.jpg', 42, 'Tshirt'),
(32, 'Maggi ketchup bottle - (500g)', 'images/30.jpg', 90, 'Watches'),
(33, 'Kissan mixed fruit jam - (200g)', 'images/31.jpg', 55, 'Watches');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `email` varchar(25) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `mobile`, `email`, `address`) VALUES
(1, 'Gangadhar', 'guru', '9483845366', 'gangadhar.smg24@gmail.com', 'Sagaranahalli'),
(2, 'ghj', 'fhgjfgghk', '+915467897568', 'fgh@gmail.com', 'fghjk');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `c_u_id` (`c_u_id`),
  ADD KEY `c_p_id` (`c_p_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `feedbacktbl`
--
ALTER TABLE `feedbacktbl`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ord_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `feedbacktbl`
--
ALTER TABLE `feedbacktbl`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ord_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `c_u_id` FOREIGN KEY (`c_u_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `p_u_id` FOREIGN KEY (`c_p_id`) REFERENCES `products` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `c_id` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `o_p_id` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
