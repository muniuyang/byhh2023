-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-10-20 06:48:51
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `byhh2023`
--

-- --------------------------------------------------------

--
-- 表的结构 `swd_address_delivery`
--

CREATE TABLE `swd_address_delivery` (
  `delivery_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) NOT NULL,
  `amount` int(10) NOT NULL DEFAULT '0',
  `book_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_address_delivery`
--

INSERT INTO `swd_address_delivery` (`delivery_id`, `order_id`, `amount`, `book_id`) VALUES
(1, 60, 20, 1),
(2, 73, 10, 1),
(3, 81, 10, 1),
(74, 84, 10, 2),
(75, 83, 20, 1),
(76, 82, 10, 2),
(77, 35, 10, 3),
(78, 74, 10, 4);

--
-- 转储表的索引
--

--
-- 表的索引 `swd_address_delivery`
--
ALTER TABLE `swd_address_delivery`
  ADD PRIMARY KEY (`delivery_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `swd_address_delivery`
--
ALTER TABLE `swd_address_delivery`
  MODIFY `delivery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
