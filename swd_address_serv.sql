-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-10-15 04:49:21
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
-- 表的结构 `swd_address_serv`
--

CREATE TABLE `swd_address_serv` (
  `sid` int(10) UNSIGNED NOT NULL,
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `region_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `region_name` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(20) DEFAULT '',
  `phone_tel` varchar(60) DEFAULT '',
  `phone_mob` varchar(20) DEFAULT '',
  `defaddr` tinyint(3) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_address_serv`
--

INSERT INTO `swd_address_serv` (`sid`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `defaddr`) VALUES
(1, '时尚战果', 284, '湖北省 武汉', '蓝宝石3F6-1号', '', '', '', 0),
(2, '铭杨烟酒', 284, '湖北省 武汉', '银座后面上破', '', '', '', 0),
(3, '时尚战果服饰', 284, '湖北省 武汉', '蓝宝石3F6-1号', '', '', '', 0),
(4, '欧派·金果果', 284, '湖北省 武汉', '金正茂B区4楼15-17号', '', '', '', 0),
(5, '雲尚海潮传媒有限公司', 284, '湖北省 武汉', '云尚3号楼1716，负责人电话18668384999', '', '', '', 0),
(6, '天龙纺织', 284, '湖北省 武汉', '银座S-29', '', '', '', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
