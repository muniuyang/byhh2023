-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-11-12 03:51:13
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
-- 表的结构 `swd_acategory`
--

CREATE TABLE `swd_acategory` (
  `cate_id` int(10) UNSIGNED NOT NULL,
  `cate_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `store_id` int(10) DEFAULT '0',
  `sort_order` tinyint(3) UNSIGNED DEFAULT '255',
  `if_show` int(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_acategory`
--

INSERT INTO `swd_acategory` (`cate_id`, `cate_name`, `parent_id`, `store_id`, `sort_order`, `if_show`) VALUES
(1, '系统分类', 0, 0, 255, 1),
(2, '场地布置', 1, 0, 255, 1),
(3, '花艺培训', 1, 0, 255, 1);

-- --------------------------------------------------------

--
-- 表的结构 `swd_address`
--

CREATE TABLE `swd_address` (
  `addr_id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `region_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `region_name` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `signature` varchar(60) DEFAULT ' ',
  `subscriber` varchar(60) DEFAULT '',
  `zipcode` varchar(20) DEFAULT '',
  `phone_tel` varchar(60) DEFAULT '',
  `phone_mob` varchar(20) DEFAULT '',
  `defaddr` tinyint(3) DEFAULT '0',
  `book_id` int(10) DEFAULT '0',
  `book_amount` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_address`
--

INSERT INTO `swd_address` (`addr_id`, `userid`, `consignee`, `region_id`, `region_name`, `address`, `signature`, `subscriber`, `zipcode`, `phone_tel`, `phone_mob`, `defaddr`, `book_id`, `book_amount`) VALUES
(35, 5, '时尚战果服饰', 284, '湖北省 武汉', '蓝宝石3F6-1号', '佰汇馆 老曾', '杰仕轩扬', '', '', '', 0, 0, 0),
(34, 5, '欧派·金果果', 284, '湖北省 武汉', '金正茂B区4楼15-17号', '匿名', '散单零售', '', '', '', 0, 0, 0),
(46, 59, '雲尚海潮传媒有限公司', 284, '湖北省 武汉', '云尚3号楼1716，负责人电话18668384999', '吴涛', '吴涛', '', '', '', 1, 0, 0),
(85, 74, '胡志红肉制品有限公司', 284, '湖北省 武汉', '胡志红肉制品有限公司', '田传义', '田传义', '', '', '', 1, 0, 0),
(86, 5, '胡女士', 284, '湖北省 武汉', '江岸区中山大道1505号（黄浦路地铁口A口）', '匿名', '散单零售', '', '', '13971230110', 0, 0, 0),
(87, 5, '阿彪名品', 284, '湖北省 武汉', '全新街A-26', '王建华', '散单零售', '', '', '', 0, 1, 10),
(56, 5, '天龙纺织', 284, '湖北省 武汉', '银座S-29', '万宝纺织', '万宝纺织', '', '', '', 0, 0, 0),
(82, 72, '集上', 284, '湖北省 武汉', '云尚A馆，19F，1910号', '振宇俊男', '振宇俊男', '', '', '', 1, 0, 0),
(84, 5, '对位品诺', 284, '湖北省 武汉', '老三镇2楼2310号', '匿名', '散单零售', '', '', '', 0, 0, 0),
(88, 75, '幺爷', 284, '湖北省 武汉', '蓝宝石1楼15号', '鉴航纺织', '鉴航纺织', '', '', '', 1, 0, 10),
(89, 5, '西部牛仔旺', 284, '湖北省 武汉', '老三镇2F', '匿名', '西部牛仔旺', '', '', '', 0, 1, 10),
(90, 76, '周工', 284, '湖北省 武汉', '云尚3号楼3616', '周工', '周工', '', '', '', 1, 2, 10),
(91, 77, '别书慧', 284, '湖北省 武汉', '明月宾馆', '孙雪晴', '孙雪晴', '', '', '', 1, 1, 10),
(92, 5, '吴伟年', 284, '湖北省 武汉', '自提', '博弈花卉', '郭惠', '', '', '', 0, 0, 10),
(93, 5, '尚裁国际', 284, '湖北省 武汉', '红宝石3F，22-1号', '补发', '郭惠', '', '', '', 0, 0, 10),
(94, 83, '婷婷', 284, '湖北省 武汉', '晴川大道世贸52+沿江商业栋1层18号', '嫂子', 'wx~美好向往', '', '', '18207155955', 1, 1, 10),
(95, 5, '武汉威帆宜家装饰', 284, '湖北省 武汉', '云尚3号楼3616', '博艺花卉', '郭惠', '', '', '', 0, 1, 10),
(96, 5, '匿名', 284, '湖北省 武汉', '自提', '匿名', '散单零售', '', '', '', 0, 0, 10),
(97, 84, '小媚', 284, '湖北省 武汉', '银座S1-28', '明明', '明明', '', '', '', 1, 0, 10),
(98, 4, '刘大姐', 284, '湖北省 武汉', '流通前巷50号', '匿名', '匿名', '', '', '', 0, 0, 10),
(99, 4, '刘华', 284, '湖北省 武汉', '自提', '郑芳', '匿名', '', '', '', 0, 0, 10),
(100, 4, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', '', '', '', 0, 0, 0),
(101, 85, '匿名', 284, '湖北省 武汉', '金座1楼18号', '魏芳', '魏芳', '', '', '', 1, 0, 10),
(102, 4, '匿名', 284, '湖北省 武汉', '红宝石2楼47号', '匿名', '匿名', '', '', '', 0, 0, 10),
(103, 86, '林记', 284, '湖北省 武汉', '品牌4号门', '盛先生', '盛先生', '', '', '13307168900', 1, 0, 10),
(104, 4, '陈', 284, '湖北省 武汉', '品牌高雄路1楼1106', '匿名', '匿名', '', '', '18627177711', 0, 0, 10),
(105, 4, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', '', '', '', 1, 0, 10),
(106, 87, '娜姐', 284, '湖北省 武汉', '盘龙城', '程静', '程静', '', '', '', 1, 2, 10),
(107, 5, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', '', '', '13163298652', 0, 0, 10),
(108, 5, '新儿', 284, '湖北省 武汉', '送老三镇三楼3702~靓丽阳光', '匿名', '匿名', '', '', '', 0, 0, 10),
(109, 5, '桃', 284, '湖北省 武汉', '送红宝石3F34', '匿名', '匿名', '', '', '', 0, 0, 10),
(110, 5, '妈妈', 284, '湖北省 武汉', '金正茂b区', '女儿', '匿名', '', '', '', 0, 0, 10),
(111, 5, '金女士', 284, '湖北省 武汉', '金昌', '匿名', '匿名', '', '', '', 0, 0, 10),
(112, 5, '匿名', 284, '湖北省 武汉', '新味都', '匿名', '匿名', '', '', '', 0, 1, 10),
(113, 88, '芳', 284, '湖北省 武汉', '老三镇2F、2511号', '匿名', '祥盛布行~李思', '', '', '', 1, 0, 10),
(114, 5, '散客', 284, '湖北省 武汉', '自提', '匿名', '匿名', '', '', '', 0, 0, 0),
(115, 90, '老婆', 284, '湖北省 武汉', '银座外围S21号德丰纺织', '爱你的老公', '德丰纺织', '', '', '', 1, 0, 10),
(116, 5, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', '', '', '', 0, 0, 0),
(117, 91, '小姨', 284, '湖北省 武汉', '自提', '匿名', '侄女', '', '', '', 1, 0, 0),
(118, 92, '海华毛绒', 284, '湖北省 武汉', '金昌外围', '海华毛绒', '海华毛绒', '', '', '', 1, 0, 10);

-- --------------------------------------------------------

--
-- 表的结构 `swd_address_book`
--

CREATE TABLE `swd_address_book` (
  `book_id` int(10) UNSIGNED NOT NULL,
  `consignee` varchar(30) NOT NULL,
  `phone_mob` varchar(20) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_address_book`
--

INSERT INTO `swd_address_book` (`book_id`, `consignee`, `phone_mob`) VALUES
(1, '程进', '15210723549'),
(2, '三轮张', '13871304841'),
(3, '欧阳师傅', '15102723749'),
(4, '摩的张', '15337132147'),
(5, '邓春香', '15171880392');

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
(78, 74, 10, 4),
(79, 85, 10, 1),
(80, 86, 10, 0),
(81, 87, 10, 1),
(82, 88, 10, 2),
(83, 89, 10, 2),
(84, 90, 10, 1),
(85, 91, 10, 2),
(86, 92, 10, 2),
(87, 93, 10, 2),
(88, 94, 10, 2),
(89, 95, 10, 2),
(90, 96, 10, 2),
(91, 97, 10, 0),
(92, 98, 20, 1),
(93, 99, 10, 1),
(94, 100, 10, 1),
(95, 101, 10, 0),
(96, 102, 10, 0),
(97, 103, 10, 0),
(98, 104, 10, 0),
(99, 105, 10, 0),
(100, 106, 10, 0),
(101, 107, 0, 0),
(102, 108, 10, 0),
(103, 109, 10, 0),
(104, 110, 10, 0),
(105, 111, 10, 0),
(106, 112, 10, 0),
(107, 113, 10, 0),
(108, 114, 10, 1),
(109, 115, 10, 0),
(110, 116, 10, 0),
(111, 117, 10, 0),
(112, 118, 10, 0),
(113, 119, 10, 0),
(114, 120, 10, 0),
(115, 121, 10, 0),
(116, 122, 10, 0),
(117, 123, 10, 0),
(118, 124, 10, 0),
(119, 125, 10, 0),
(120, 126, 10, 0),
(121, 127, 10, 0),
(122, 128, 10, 0),
(123, 129, 10, 1),
(124, 130, 10, 0),
(125, 131, 10, 1),
(126, 132, 10, 0),
(127, 133, 0, 0),
(128, 134, 10, 0),
(129, 135, 0, 0),
(130, 136, 0, 0),
(131, 137, 10, 0);

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
(6, '天龙纺织', 284, '湖北省 武汉', '银座S-29', '', '', '', 0),
(7, '王利芳', 284, '湖北省 武汉', '小商品~北厅~402号', '', '', '15527388907', 1),
(8, '秋女士', 284, '湖北省 武汉', '江通批发市场3门C11', '', '', '', 1),
(9, '匿名', 284, '湖北省 武汉', '自提', '', '', '', 1),
(10, '陳先森', 284, '湖北省 武汉', '蓝宝石4F、17号', '', ' ', '', 0),
(11, '黑木吉', 284, '湖北省 武汉', '老三镇2F、2206号', '', '', '', 0),
(12, '欧豪·東芳', 284, '湖北省 武汉', '老三镇2F、2511号', '', '', '', 0),
(13, '杉线谱服饰', 284, '湖北省 武汉', '金座3F、45号', '', '', '', 0),
(14, '集上', 284, '湖北省 武汉', '云尚A馆，19F，1910号', '', '', '', 0),
(15, '对位品诺', 284, '湖北省 武汉', '老三镇2楼2310号', '', '', '', 1),
(16, '胡志红肉制品有限公司', 284, '湖北省 武汉', '胡志红肉制品有限公司', '', '', '', 1),
(17, '胡女士', 284, '湖北省 武汉', '江岸区中山大道1505号（黄浦路地铁口A口）', '', '', '13971230110', 1),
(18, '阿彪名品', 284, '湖北省 武汉', '全新街A-26', '', '', '', 1),
(19, '幺爷', 284, '湖北省 武汉', '蓝宝石1楼15号', '', '', '', 1),
(20, '西部牛仔旺', 284, '湖北省 武汉', '老三镇2F', '', '', '', 1),
(21, '周工', 284, '湖北省 武汉', '云尚3号楼3616', '', '', '', 1),
(22, '别书慧', 284, '湖北省 武汉', '明月宾馆', '', '', '', 1),
(23, '吴伟年', 284, '湖北省 武汉', '自提', '', '', '', 1),
(24, '尚裁国际', 284, '湖北省 武汉', '红宝石3F，22-1号', '', '', '', 1),
(25, '匿名', 284, '湖北省 武汉', '晴川大道世贸52+沿江商业栋1层18号', '', '', '18207155955', 1),
(26, '武汉威帆宜家装饰', 284, '湖北省 武汉', '云尚3号楼3616', '', '', '', 1),
(27, '匿名', 284, '湖北省 武汉', '', '', '', '', 1),
(28, '小媚', 284, '湖北省 武汉', '银座S1-28', '', '', '', 1),
(29, '刘大姐', 284, '湖北省 武汉', '流通前巷50号', '', '', '', 1),
(30, '刘华', 284, '湖北省 武汉', '自提', '', '', '', 1),
(31, '匿名', 284, '湖北省 武汉', '金座1楼18号', '', '', '', 1),
(32, '匿名', 284, '湖北省 武汉', '红宝石2楼47号', '', '', '', 1),
(33, '林记', 284, '湖北省 武汉', '品牌4号门', '', '', '13307168900', 1),
(34, '陈', 284, '湖北省 武汉', '品牌高雄路1楼1106', '', '', '18627177711', 1),
(35, '六号线', 284, '湖北省 武汉', '红宝石2楼', '', '', '', 1),
(36, '娜姐', 284, '湖北省 武汉', '盘龙城', '', '', '', 1),
(37, '匿名', 284, '湖北省 武汉', '泳帽社区永寿门702', '', '', '13163298652', 1),
(38, '新儿', 284, '湖北省 武汉', '送老三镇三楼3702~靓丽阳光', '', '', '', 1),
(39, '桃', 284, '湖北省 武汉', '送红宝石3F34', '', '', '', 1),
(40, '妈妈', 284, '湖北省 武汉', '金正茂b区', '', '', '', 1),
(41, '金女士', 284, '湖北省 武汉', '金昌', '', '', '', 1),
(42, '匿名', 284, '湖北省 武汉', '新味都', '', '', '', 1),
(43, '芳', 284, '湖北省 武汉', '老三镇2F、2511号', '', '', '', 1),
(44, '散客', 284, '湖北省 武汉', '自提', '', '', '', 1),
(45, '老婆', 284, '湖北省 武汉', '银座外围S21号德丰纺织', '', '', '', 1),
(46, '小姨', 284, '湖北省 武汉', '自提', '', '', '', 1),
(47, '海华毛绒', 284, '湖北省 武汉', '金昌外围', '', '', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `swd_appbuylog`
--

CREATE TABLE `swd_appbuylog` (
  `bid` int(11) UNSIGNED NOT NULL,
  `orderId` varchar(20) NOT NULL,
  `appid` varchar(20) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `period` int(11) DEFAULT '0',
  `amount` decimal(10,2) DEFAULT '0.00',
  `status` tinyint(3) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `pay_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_appmarket`
--

CREATE TABLE `swd_appmarket` (
  `aid` int(11) UNSIGNED NOT NULL,
  `appid` varchar(20) NOT NULL,
  `title` varchar(100) DEFAULT '',
  `summary` varchar(255) DEFAULT NULL,
  `category` int(11) DEFAULT '0',
  `description` text,
  `logo` varchar(200) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `sales` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_apprenewal`
--

CREATE TABLE `swd_apprenewal` (
  `rid` int(11) UNSIGNED NOT NULL,
  `appid` varchar(20) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `add_time` int(11) UNSIGNED DEFAULT NULL,
  `expired` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_article`
--

CREATE TABLE `swd_article` (
  `article_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT '',
  `cate_id` int(10) DEFAULT '0',
  `store_id` int(10) UNSIGNED DEFAULT '0',
  `link` varchar(255) DEFAULT NULL,
  `description` text,
  `sort_order` tinyint(3) UNSIGNED DEFAULT '255',
  `if_show` tinyint(3) UNSIGNED DEFAULT '1',
  `add_time` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_article`
--

INSERT INTO `swd_article` (`article_id`, `title`, `cate_id`, `store_id`, `link`, `description`, `sort_order`, `if_show`, `add_time`) VALUES
(1, '用户服务协议', 1, 0, '', '<p>\r\n	<span>特别提醒用户认真阅读本《用户服务协议》(下称《协议》) 中各条款。除非您接受本《协议》条款，否则您无权使用本网站提供的相关服务。您的使用行为将视为对本《协议》的接受，并同意接受本《协议》各项条款的约束。 </span><br />\r\n<br />\r\n<strong><span>一、定义</span></strong> \r\n</p>\r\n<p>\r\n	<strong><span><br />\r\n</span></strong> \r\n</p>\r\n<ol>\r\n	<li>\r\n		<span>\"用户\"指符合本协议所规定的条件，同意遵守本网站各种规则、条款（包括但不限于本协议），并使用本网站的个人或机构。</span> \r\n	</li>\r\n	<li>\r\n		<span>\"卖家\"是指在本网站上出售物品的用户。\"买家\"是指在本网站购买物品的用户。</span> \r\n	</li>\r\n	<li>\r\n		<span>\"成交\"指买家根据卖家所刊登的交易要求，在特定时间内提出最优的交易条件，因而取得依其提出的条件购买该交易物品的权利。</span><br />\r\n	</li>\r\n</ol>\r\n<p>\r\n	<strong><span><br />\r\n</span></strong> \r\n</p>\r\n<p>\r\n	<strong><span>二、用户资格</span></strong> \r\n</p>\r\n<p>\r\n	<strong><span></span></strong> <br />\r\n<span> 只有符合下列条件之一的人员或实体才能申请成为本网站用户，可以使用本网站的服务。</span> \r\n</p>\r\n<ol>\r\n	<li>\r\n		<span>年满十八岁，并具有民事权利能力和民事行为能力的自然人；</span> \r\n	</li>\r\n	<li>\r\n		<span>未满十八岁，但监护人（包括但不仅限于父母）予以书面同意的自然人；</span> \r\n	</li>\r\n	<li>\r\n		<span>根据中国法律或设立地法律、法规和/或规章成立并合法存在的公司、企事业单位、社团组织和其他组织。</span><br />\r\n	</li>\r\n</ol>\r\n<p>\r\n	<span> 无民事行为能力人、限制民事行为能力人以及无经营或特定经营资格的组织不当注册为本网站用户或超过其民事权利或行为能力范围从事交易的，其与本网站之间的协议自始无效，本网站一经发现，有权立即注销该用户，并追究其使用本网站\"服务\"的一切法律责任。</span> <br />\r\n<strong><span><br />\r\n</span></strong> \r\n</p>\r\n<p>\r\n	<strong><span>三.用户的权利和义务</span></strong> \r\n</p>\r\n<p>\r\n	<strong><span><br />\r\n</span></strong> \r\n</p>\r\n<ol>\r\n	<li>\r\n		<span>用户有权根据本协议的规定及本网站发布的相关规则，利用本网站网上交易平台登录物品、发布交易信息、查询物品信息、购买物品、与其他用户订立物品买卖合同、在本网站社区发帖、参加本网站的有关活动及有权享受本网站提供的其他的有关资讯及信息服务。</span> \r\n	</li>\r\n	<li>\r\n		<span>用户有权根据需要更改密码和交易密码。用户应对以该用户名进行的所有活动和事件负全部责任。</span> \r\n	</li>\r\n	<li>\r\n		<span>用户有义务确保向本网站提供的任何资料、注册信息真实准确，包括但不限于真实姓名、身份证号、联系电话、地址、邮政编码等。保证本网站及其他用户可以通过上述联系方式与自己进行联系。同时，用户也有义务在相关资料实际变更时及时更新有关注册资料。</span> \r\n	</li>\r\n	<li>\r\n		<span>用户不得以任何形式擅自转让或授权他人使用自己在本网站的用户帐号。</span> \r\n	</li>\r\n	<li>\r\n		<span>用户有义务确保在本网站网上交易平台上登录物品、发布的交易信息真实、准确，无误导性。</span> \r\n	</li>\r\n	<li>\r\n		<span>用户不得在本网站网上交易平台买卖国家禁止销售的或限制销售的物品、不得买卖侵犯他人知识产权或其他合法权益的物品，也不得买卖违背社会公共利益或公共道德的物品。</span> \r\n	</li>\r\n	<li>\r\n		<span>用户不得在本网站发布各类违法或违规信息。包括但不限于物品信息、交易信息、社区帖子、物品留言，店铺留言，评价内容等。</span> \r\n	</li>\r\n	<li>\r\n		<span>用户在本网站交易中应当遵守诚实信用原则，不得以干预或操纵物品价格等不正当竞争方式扰乱网上交易秩序，不得从事与网上交易无关的不当行为，不得在交易平台上发布任何违法信息。</span> \r\n	</li>\r\n	<li>\r\n		<span>用户不应采取不正当手段（包括但不限于虚假交易、互换好评等方式）提高自身或他人信用度，或采用不正当手段恶意评价其他用户，降低其他用户信用度。</span> \r\n	</li>\r\n	<li>\r\n		<span>用户承诺自己在使用本网站网上交易平台实施的所有行为遵守国家法律、法规和本网站的相关规定以及各种社会公共利益或公共道德。对于任何法律后果的发生，用户将以自己的名义独立承担所有相应的法律责任。</span> \r\n	</li>\r\n	<li>\r\n		<span>用户在本网站网上交易过程中如与其他用户因交易产生纠纷，可以请求本网站从中予以协调。用户如发现其他用户有违法或违反本协议的行为，可以向本网站举报。如用户因网上交易与其他用户产生诉讼的，用户有权通过司法部门要求本网站提供相关资料。</span> \r\n	</li>\r\n	<li>\r\n		<span>用户应自行承担因交易产生的相关费用，并依法纳税。</span> \r\n	</li>\r\n	<li>\r\n		<span>未经本网站书面允许，用户不得将本网站资料以及在交易平台上所展示的任何信息以复制、修改、翻译等形式制作衍生作品、分发或公开展示。</span> \r\n	</li>\r\n	<li>\r\n		<span>用户同意接收来自本网站的信息，包括但不限于活动信息、交易信息、促销信息等。</span><br />\r\n	</li>\r\n</ol>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong><span>四、 本网站的权利和义务</span></strong>\r\n</p>\r\n<p>\r\n	<strong><span><br />\r\n</span></strong> \r\n</p>\r\n<ol>\r\n	<li>\r\n		<span>本网站不是传统意义上的\"拍卖商\"，仅为用户提供一个信息交流、进行物品买卖的平台，充当买卖双方之间的交流媒介，而非买主或卖主的代理商、合伙  人、雇员或雇主等经营关系人。公布在本网站上的交易物品是用户自行上传进行交易的物品，并非本网站所有。对于用户刊登物品、提供的信息或参与竞标的过程，  本网站均不加以监视或控制，亦不介入物品的交易过程，包括运送、付款、退款、瑕疵担保及其它交易事项，且不承担因交易物品存在品质、权利上的瑕疵以及交易  方履行交易协议的能力而产生的任何责任，对于出现在拍卖上的物品品质、安全性或合法性，本网站均不予保证。</span> \r\n	</li>\r\n	<li>\r\n		<span>本网站有义务在现有技术水平的基础上努力确保整个网上交易平台的正常运行，尽力避免服务中断或将中断时间限制在最短时间内，保证用户网上交易活动的顺利进行。</span> \r\n	</li>\r\n	<li>\r\n		<span>本网站有义务对用户在注册使用本网站网上交易平台中所遇到的问题及反映的情况及时作出回复。</span> \r\n	</li>\r\n	<li>\r\n		<span>本网站有权对用户的注册资料进行查阅，对存在任何问题或怀疑的注册资料，本网站有权发出通知询问用户并要求用户做出解释、改正，或直接做出处罚、删除等处理。</span> \r\n	</li>\r\n	<li>\r\n		<span>用  户因在本网站网上交易与其他用户产生纠纷的，用户通过司法部门或行政部门依照法定程序要求本网站提供相关资料，本网站将积极配合并提供有关资料；用户将纠  纷告知本网站，或本网站知悉纠纷情况的，经审核后，本网站有权通过电子邮件及电话联系向纠纷双方了解纠纷情况，并将所了解的情况通过电子邮件互相通知对  方。</span> \r\n	</li>\r\n	<li>\r\n		<span>因网上交易平台的特殊性，本网站没有义务对所有用户的注册资料、所有的交易行为以及与交易有关的其他事项进行事先审查，但如发生以下情形，本网站有权限制用户的活动、向用户核实有关资料、发出警告通知、暂时中止、无限期地中止及拒绝向该用户提供服务：</span> \r\n		<ul>\r\n			<li>\r\n				<span>用户违反本协议或因被提及而纳入本协议的文件；</span> \r\n			</li>\r\n			<li>\r\n				<span>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据，而本网站无法联系到该用户核证或验证该用户向本网站提供的任何资料；</span> \r\n			</li>\r\n			<li>\r\n				<span>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据。本网站以普通非专业交易者的知识水平标准对相关内容进行判别，可以明显认为这些内容或行为可能对本网站用户或本网站造成财务损失或法律责任。</span> \r\n			</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<span>在反网络欺诈行动中，本着保护广大用户利益的原则，当用户举报自己交易可能存在欺诈而产生交易争议时，本网站有权通过表面判断暂时冻结相关用户账号，并有权核对当事人身份资料及要求提供交易相关证明材料。</span> \r\n	</li>\r\n	<li>\r\n		<span>根据国家法律法规、本协议的内容和本网站所掌握的事实依据，可以认定用户存在违法或违反本协议行为以及在本网站交易平台上的其他不当行为，本网站有权在本网站交易平台及所在网站上以网络发布形式公布用户的违法行为，并有权随时作出删除相关信息，而无须征得用户的同意。</span> \r\n	</li>\r\n	<li>\r\n		<span>本  网站有权在不通知用户的前提下删除或采取其他限制性措施处理下列信息：包括但不限于以规避费用为目的；以炒作信用为目的；存在欺诈等恶意或虚假内容；与网  上交易无关或不是以交易为目的；存在恶意竞价或其他试图扰乱正常交易秩序因素；该信息违反公共利益或可能严重损害本网站和其他用户合法利益的。</span> \r\n	</li>\r\n	<li>\r\n		<span>用  户授予本网站独家的、全球通用的、永久的、免费的信息许可使用权利，本网站有权对该权利进行再授权，依此授权本网站有权(全部或部份地)  使用、复制、修订、改写、发布、翻译、分发、执行和展示用户公示于网站的各类信息或制作其派生作品，以现在已知或日后开发的任何形式、媒体或技术，将上述  信息纳入其他作品内。</span> \r\n	</li>\r\n</ol>\r\n<p>\r\n	<br />\r\n<strong><span>五、服务的中断和终止</span></strong>\r\n</p>\r\n<p>\r\n	<strong><span><br />\r\n</span></strong> \r\n</p>\r\n<ol>\r\n	<li>\r\n		<span>在  本网站未向用户收取相关服务费用的情况下，本网站可自行全权决定以任何理由  (包括但不限于本网站认为用户已违反本协议的字面意义和精神，或用户在超过180天内未登录本网站等)  终止对用户的服务，并不再保存用户在本网站的全部资料（包括但不限于用户信息、商品信息、交易信息等）。同时本网站可自行全权决定，在发出通知或不发出通  知的情况下，随时停止提供全部或部分服务。服务终止后，本网站没有义务为用户保留原用户资料或与之相关的任何信息，或转发任何未曾阅读或发送的信息给用户  或第三方。此外，本网站不就终止对用户的服务而对用户或任何第三方承担任何责任。</span> \r\n	</li>\r\n	<li>\r\n		<span>如用户向本网站提出注销本网站注册用户身份，需经本网站审核同意，由本网站注销该注册用户，用户即解除与本网站的协议关系，但本网站仍保留下列权利：</span> \r\n		<ul>\r\n			<li>\r\n				<span>用户注销后，本网站有权保留该用户的资料,包括但不限于以前的用户资料、店铺资料、商品资料和交易记录等。</span> \r\n			</li>\r\n			<li>\r\n				<span>用户注销后，如用户在注销前在本网站交易平台上存在违法行为或违反本协议的行为，本网站仍可行使本协议所规定的权利。</span> \r\n			</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<span>如存在下列情况，本网站可以通过注销用户的方式终止服务：</span> \r\n		<ul>\r\n			<li>\r\n				<span>在用户违反本协议相关规定时，本网站有权终止向该用户提供服务。本网站将在中断服务时通知用户。但如该用户在被本网站终止提供服务后，再一次直接或间接或以他人名义注册为本网站用户的，本网站有权再次单方面终止为该用户提供服务；</span> \r\n			</li>\r\n			<li>\r\n				<span>一旦本网站发现用户注册资料中主要内容是虚假的，本网站有权随时终止为该用户提供服务；</span> \r\n			</li>\r\n			<li>\r\n				<span>本协议终止或更新时，用户未确认新的协议的。</span> \r\n			</li>\r\n			<li>\r\n				<span>其它本网站认为需终止服务的情况。</span> \r\n			</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<span>因用户违反相关法律法规或者违反本协议规定等原因而致使本网站中断、终止对用户服务的，对于服务中断、终止之前用户交易行为依下列原则处理：</span> \r\n		<ul>\r\n			<li>\r\n				<span>本网站有权决定是否在中断、终止对用户服务前将用户被中断或终止服务的情况和原因通知用户交易关系方，包括但不限于对该交易有意向但尚未达成交易的用户,参与该交易竞价的用户，已达成交易要约用户。</span> \r\n			</li>\r\n			<li>\r\n				<span>服务中断、终止之前，用户已经上传至本网站的物品尚未交易或交易尚未完成的，本网站有权在中断、终止服务的同时删除此项物品的相关信息。</span> \r\n			</li>\r\n			<li>\r\n				<span>服务中断、终止之前，用户已经就其他用户出售的具体物品作出要约，但交易尚未结束，本网站有权在中断或终止服务的同时删除该用户的相关要约和信息。</span> \r\n			</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<span>本网站若因用户的行为（包括但不限于刊登的商品、在本网站社区发帖等）侵害了第三方的权利或违反了相关规定，而受到第三方的追偿或受到主管机关的处分时，用户应赔偿本网站因此所产生的一切损失及费用。</span> \r\n	</li>\r\n	<li>\r\n		<span>对违反相关法律法规或者违反本协议规定，且情节严重的用户，本网站有权终止该用户的其它服务。</span> \r\n	</li>\r\n</ol>\r\n<p>\r\n	<br />\r\n<br />\r\n<strong><span>六、协议的修订</span></strong>\r\n</p>\r\n<p>\r\n	<strong><span></span></strong><br />\r\n<br />\r\n<span> 本协议可由本网站随时修订，并将修订后的协议公告于本网站之上，修订后的条款内容自公告时起生效，并成为本协议的一部分。用户若在本协议修改之后，仍继续使用本网站，则视为用户接受和自愿遵守修订后的协议。本网站行使修改或中断服务时，不需对任何第三方负责。</span><br />\r\n<br />\r\n<strong><span>七、 本网站的责任范围 </span></strong><br />\r\n<br />\r\n<span> 当用户接受该协议时，用户应明确了解并同意∶</span> \r\n</p>\r\n<ol>\r\n	<li>\r\n		<span>是否经由本网站下载或取得任何资料，由用户自行考虑、衡量并且自负风险，因下载任何资料而导致用户电脑系统的任何损坏或资料流失，用户应负完全责任。</span> \r\n	</li>\r\n	<li>\r\n		<span>用户经由本网站取得的建议和资讯，无论其形式或表现，绝不构成本协议未明示规定的任何保证。</span> \r\n	</li>\r\n	<li>\r\n		<span>基于以下原因而造成的利润、商誉、使用、资料损失或其它无形损失，本网站不承担任何直接、间接、附带、特别、衍生性或惩罚性赔偿（即使本网站已被告知前款赔偿的可能性）：</span> \r\n		<ul>\r\n			<li>\r\n				<span>本网站的使用或无法使用。</span> \r\n			</li>\r\n			<li>\r\n				<span>经由或通过本网站购买或取得的任何物品，或接收之信息，或进行交易所随之产生的替代物品及服务的购买成本。</span> \r\n			</li>\r\n			<li>\r\n				<span>用户的传输或资料遭到未获授权的存取或变更。</span> \r\n			</li>\r\n			<li>\r\n				<span>本网站中任何第三方之声明或行为。</span> \r\n			</li>\r\n			<li>\r\n				<span>本网站其它相关事宜。</span> \r\n			</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		<span>本网站只是为用户提供一个交易的平台，对于用户所刊登的交易物品的合法性、真实性及其品质，以及用户履行交易的能力等，本网站一律不负任何担保责任。用户如果因使用本网站，或因购买刊登于本网站的任何物品，而受有损害时，本网站不负任何补偿或赔偿责任。</span> \r\n	</li>\r\n	<li>\r\n		<span>本  网站提供与其它互联网上的网站或资源的链接，用户可能会因此连结至其它运营商经营的网站，但不表示本网站与这些运营商有任何关系。其它运营商经营的网站均  由各经营者自行负责，不属于本网站控制及负责范围之内。对于存在或来源于此类网站或资源的任何内容、广告、产品或其它资料，本网站亦不予保证或负责。因使  用或依赖任何此类网站或资源发布的或经由此类网站或资源获得的任何内容、物品或服务所产生的任何损害或损失，本网站不负任何直接或间接的责任。</span><br />\r\n	</li>\r\n</ol>\r\n<p>\r\n	<strong><span><br />\r\n</span></strong>\r\n</p>\r\n<p>\r\n	<strong><span>八、不可抗力</span></strong><br />\r\n<br />\r\n<span> 因不可抗力或者其他意外事件，使得本协议的履行不可能、不必要或者无意义的，双方均不承担责任。本合同所称之不可抗力意指不能预见、不能避免并不能克服的  客观情况，包括但不限于战争、台风、水灾、火灾、雷击或地震、罢工、暴动、法定疾病、黑客攻击、网络病毒、电信部门技术管制、政府行为或任何其它自然或人  为造成的灾难等客观情况。</span><br />\r\n<span></span><br />\r\n<strong><span>九、争议解决方式</span></strong>\r\n</p>\r\n<p>\r\n	<strong><span><br />\r\n</span></strong> \r\n</p>\r\n<ol>\r\n	<li>\r\n		<span>本协议及其修订本的有效性、履行和与本协议及其修订本效力有关的所有事宜，将受中华人民共和国法律管辖，任何争议仅适用中华人民共和国法律。</span> \r\n	</li>\r\n	<li>\r\n		<span>因  使用本网站服务所引起与本网站的任何争议，均应提交深圳仲裁委员会按照该会届时有效的仲裁规则进行仲裁。相关争议应单独仲裁，不得与任何其它方的争议在任  何仲裁中合并处理，该仲裁裁决是终局，对各方均有约束力。如果所涉及的争议不适于仲裁解决，用户同意一切争议由人民法院管辖。</span> \r\n	</li>\r\n</ol>', 255, 1, 1542755329),
(2, '什么是实名认证', 1, 0, '', '<p>\r\n	<strong>什么是实名认证？</strong>\r\n</p>\r\n<p>\r\n	“认证店铺”服务是一项对店主身份真实性识别服务。店主可以通过站内PM、电话或管理员EMail的方式 联系并申请该项认证。经过管理员审核确认了店主的真实身份，就可以开通该项认证。\r\n</p>\r\n<p>\r\n	通过该认证，可以说明店主身份的真实有效性，为买家在网络交易的过程中提供一定的信心和保证。\r\n</p>\r\n<p>\r\n	<strong>认证申请的方式：</strong>\r\n</p>\r\n<p>\r\n	Email：XXXX@XX.com\r\n</p>\r\n<p>\r\n	管理员：XXXXXX\r\n</p>', 255, 1, 1542755606),
(3, '什么是实体店铺认证', 1, 0, '', '<p>\r\n	<strong>什么是实体店铺认证？</strong>\r\n</p>\r\n<p>\r\n	“认证店铺”服务是一项对店主身份真实性识别服务。店主可以通过站内PM、电话或管理员EMail的方式 联系并申请该项认证。经过管理员审核确认了店主的真实身份，就可以开通该项认证。\r\n</p>\r\n<p>\r\n	通过该认证，可以说明店主身份的真实有效性，为买家在网络交易的过程中提供一定的信心和保证。\r\n</p>\r\n<p>\r\n	<strong>认证申请的方式：</strong>\r\n</p>\r\n<p>\r\n	Email：XXXX@XX.com\r\n</p>\r\n<p>\r\n	管理员：XXXXXX\r\n</p>', 255, 1, 1542755637),
(4, '开店协议', 1, 0, '', '<p>\r\n	使用本公司服务所须遵守的条款和条件。<br />\r\n<br />\r\n1.用户资格<br />\r\n本公司的服务仅向适用法律下能够签订具有法律约束力的合同的个人提供并仅由其使用。在不限制前述规定的前提下，本公司的服务不向18周岁以下或被临时或无限期中止的用户提供。如您不合资格，请勿使用本公司的服务。此外，您的帐户（包括信用评价）和用户名不得向其他方转让或出售。另外，本公司保留根据其意愿中止或终止您的帐户的权利。<br />\r\n<br />\r\n2.您的资料（包括但不限于所添加的任何商品）不得：<br />\r\n*具有欺诈性、虚假、不准确或具误导性；<br />\r\n*侵犯任何第三方著作权、专利权、商标权、商业秘密或其他专有权利或发表权或隐私权；<br />\r\n*违反任何适用的法律或法规（包括但不限于有关出口管制、消费者保护、不正当竞争、刑法、反歧视或贸易惯例/公平贸易法律的法律或法规）；<br />\r\n*有侮辱或者诽谤他人，侵害他人合法权益的内容；<br />\r\n*有淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的内容；<br />\r\n*包含可能破坏、改变、删除、不利影响、秘密截取、未经授权而接触或征用任何系统、数据或个人资料的任何病毒、特洛依木马、蠕虫、定时炸弹、删除蝇、复活节彩蛋、间谍软件或其他电脑程序；<br />\r\n<br />\r\n3.违约<br />\r\n如发生以下情形，本公司可能限制您的活动、立即删除您的商品、向本公司社区发出有关您的行为的警告、发出警告通知、暂时中止、无限期地中止或终止您的用户资格及拒绝向您提供服务：<br />\r\n(a)您违反本协议或纳入本协议的文件；<br />\r\n(b)本公司无法核证或验证您向本公司提供的任何资料；<br />\r\n(c)本公司相信您的行为可能对您、本公司用户或本公司造成损失或法律责任。<br />\r\n<br />\r\n4.责任限制<br />\r\n本公司、本公司的关联公司和相关实体或本公司的供应商在任何情况下均不就因本公司的网站、本公司的服务或本协议而产生或与之有关的利润损失或任何特别、间接或后果性的损害（无论以何种方式产生，包括疏忽）承担任何责任。您同意您就您自身行为之合法性单独承担责任。您同意，本公司和本公司的所有关联公司和相关实体对本公司用户的行为的合法性及产生的任何结果不承担责任。<br />\r\n<br />\r\n5.无代理关系<br />\r\n用户和本公司是独立的合同方，本协议无意建立也没有创立任何代理、合伙、合营、雇员与雇主或特许经营关系。本公司也不对任何用户及其网上交易行为做出明示或默许的推荐、承诺或担保。<br />\r\n<br />\r\n6.一般规定<br />\r\n本协议在所有方面均受中华人民共和国法律管辖。本协议的规定是可分割的，如本协议任何规定被裁定为无效或不可执行，该规定可被删除而其余条款应予以执行。\r\n</p>', 255, 1, 1542755700),
(5, '婚房布置', 2, 0, '', '<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914092244938.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914092244402.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914092244274.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914092244294.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914092244484.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914092244603.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914092244373.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 255, 1, 1694654587),
(6, '年会场地布置', 2, 0, '', '<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914110853926.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914110854938.jpg\" alt=\"\" width=\"1000\" height=\"825\" title=\"\" align=\"\" />\r\n</p>', 255, 1, 1694661017),
(7, '开业场地布置', 2, 0, '', '<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914111101934.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914111101112.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" />', 255, 1, 1694661114),
(8, '开业场地布置', 2, 0, '', '<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914111606175.jpg\" alt=\"\" width=\"1000\" height=\"1334\" title=\"\" align=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914111606300.jpg\" alt=\"\" width=\"1000\" height=\"1334\" title=\"\" align=\"\" />\r\n</p>', 255, 1, 1694661457),
(9, '开业场地布置', 2, 0, '', '<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914111831494.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914111830981.jpg\" alt=\"\" width=\"1000\" height=\"1334\" title=\"\" align=\"\" />\r\n</p>\r\n<p>\r\n</p>', 255, 1, 1694661567),
(10, '社区职工~花艺培训', 3, 0, '', '<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112031501.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112031581.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112031340.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112031876.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" />', 255, 1, 1694661678),
(11, '武大教师~花艺培训', 3, 0, '', '<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112236331.jpg\" alt=\"微信图片_20230609212901.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112236737.jpg\" alt=\"微信图片_20230609212907.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112236177.jpg\" alt=\"微信图片_20230609212921.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112236102.jpg\" alt=\"微信图片_20230609212839.jpg\" />', 255, 1, 1694661781),
(12, '社区职工居民~花艺培训', 3, 0, '', '<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112403390.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112401500.jpg\" alt=\"\" width=\"1000\" height=\"750\" title=\"\" align=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112402807.jpg\" alt=\"\" width=\"1000\" height=\"1334\" title=\"\" align=\"\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112402394.jpg\" alt=\"\" width=\"1000\" height=\"1334\" title=\"\" align=\"\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112402950.jpg\" alt=\"\" width=\"1000\" height=\"1334\" title=\"\" align=\"\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112402168.jpg\" alt=\"\" width=\"1000\" height=\"1334\" title=\"\" align=\"\" />\r\n</p>', 255, 1, 1694661963),
(13, '武汉大学~教职工花艺培训', 3, 0, '', '<img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112631835.jpg\" alt=\"\" width=\"1000\" height=\"749\" title=\"\" align=\"\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112631182.jpg\" alt=\"\" width=\"1000\" height=\"1333\" title=\"\" align=\"\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112631633.jpg\" alt=\"\" width=\"1000\" height=\"1333\" title=\"\" align=\"\" /><img src=\"http://shopwind.byhh.com/data/files/mall/article/20230914112631227.jpg\" alt=\"\" width=\"1000\" height=\"1333\" title=\"\" align=\"\" />', 255, 1, 1694662076),
(14, '婚房布置', 2, 0, '', '<img src=\"http://www.byhh.com/data/files/mall/article/20231002095437781.jpg\" alt=\"微信图片_20231002095348.jpg\" /><img src=\"http://www.byhh.com/data/files/mall/article/20231002095437557.jpg\" alt=\"微信图片_20231002095313.jpg\" /><img src=\"http://www.byhh.com/data/files/mall/article/20231002095437730.jpg\" alt=\"微信图片_20231002095353.jpg\" /><img src=\"http://www.byhh.com/data/files/mall/article/20231002095437841.jpg\" alt=\"微信图片_20231002095404.jpg\" /><img src=\"http://www.byhh.com/data/files/mall/article/20231002095437639.jpg\" alt=\"微信图片_20231002095411.jpg\" /><img src=\"http://www.byhh.com/data/files/mall/article/20231002095437455.jpg\" alt=\"微信图片_20231002095420.jpg\" />', 255, 1, 1696211692),
(15, '婚房布置', 2, 0, '', '<img src=\"http://www.byhh.com/data/files/mall/article/20231002095623832.jpg\" alt=\"微信图片_20231002095515.jpg\" /><img src=\"http://www.byhh.com/data/files/mall/article/20231002095623836.jpg\" alt=\"微信图片_20231002095531.jpg\" /><img src=\"http://www.byhh.com/data/files/mall/article/20231002095623295.jpg\" alt=\"微信图片_20231002095535.jpg\" /><img src=\"http://www.byhh.com/data/files/mall/article/20231002095623997.jpg\" alt=\"微信图片_20231002095539.jpg\" /><img src=\"http://www.byhh.com/data/files/mall/article/20231002095623282.png\" alt=\"微信图片_20231002095606.png\" />', 255, 1, 1696211789);

-- --------------------------------------------------------

--
-- 表的结构 `swd_bank`
--

CREATE TABLE `swd_bank` (
  `bid` int(11) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bank_name` varchar(100) NOT NULL,
  `short_name` varchar(20) DEFAULT NULL,
  `account_name` varchar(20) DEFAULT '',
  `open_bank` varchar(100) DEFAULT NULL,
  `type` varchar(10) DEFAULT 'debit',
  `num` varchar(50) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_bind`
--

CREATE TABLE `swd_bind` (
  `id` int(11) UNSIGNED NOT NULL,
  `unionid` varchar(255) NOT NULL,
  `openid` varchar(255) DEFAULT '',
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `code` varchar(50) DEFAULT '',
  `token` varchar(255) DEFAULT '',
  `nickname` varchar(60) DEFAULT '',
  `enabled` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_brand`
--

CREATE TABLE `swd_brand` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(100) DEFAULT '',
  `brand_logo` varchar(255) DEFAULT NULL,
  `brand_image` varchar(255) DEFAULT NULL,
  `cate_id` int(11) DEFAULT '0',
  `sort_order` tinyint(3) UNSIGNED DEFAULT '255',
  `recommended` tinyint(3) UNSIGNED DEFAULT '0',
  `store_id` int(10) UNSIGNED DEFAULT '0',
  `if_show` tinyint(2) UNSIGNED DEFAULT '1',
  `tag` varchar(100) DEFAULT '',
  `letter` varchar(10) DEFAULT '',
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_brand`
--

INSERT INTO `swd_brand` (`brand_id`, `brand_name`, `brand_logo`, `brand_image`, `cate_id`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag`, `letter`, `description`) VALUES
(1, 'fiyta', 'data/files/mall/brand/15.jpg', '', 0, 255, 0, 0, 0, '女装', 'F', ''),
(2, '珂兰钻石', 'data/files/mall/brand/16.jpg', '', 0, 255, 0, 0, 0, '女装', 'K', ''),
(3, 'Zippo', 'data/files/mall/brand/17.png', '', 0, 255, 0, 0, 0, '女装', 'Z', ''),
(4, 'kiplinq', 'data/files/mall/brand/18.png', '', 0, 255, 0, 0, 0, '女装', 'K', ''),
(5, 'ochirly', 'data/files/mall/brand/19.jpg', '', 0, 255, 0, 0, 0, '女装', 'O', ''),
(6, '劲霸', 'data/files/mall/brand/20.png', '', 0, 255, 0, 0, 0, '女装', 'J', ''),
(7, '古今', 'data/files/mall/brand/21.jpg', '', 0, 255, 0, 0, 0, '女装', 'G', ''),
(8, '百丽', 'data/files/mall/brand/22.jpg', '', 0, 255, 0, 0, 0, '女装', 'B', ''),
(9, '杰克', 'data/files/mall/brand/23.jpg', '', 0, 255, 0, 0, 0, '男装', 'J', ''),
(10, 'COACH', 'data/files/mall/brand/24.jpg', '', 0, 255, 0, 0, 0, '男装', 'C', ''),
(11, '海尔', 'data/files/mall/brand/25.jpg', '', 0, 255, 0, 0, 0, '', 'H', ''),
(12, '乐视', 'data/files/mall/brand/26.jpg', '', 0, 255, 0, 0, 0, '', 'L', ''),
(13, '康佳', 'data/files/mall/brand/27.jpg', '', 0, 255, 0, 0, 0, '', 'K', ''),
(14, '三星', 'data/files/mall/brand/28.jpg', '', 0, 255, 0, 0, 0, '', 'S', ''),
(15, 'SONY', 'data/files/mall/brand/29.jpg', '', 0, 255, 0, 0, 0, '', 'S', ''),
(16, '东芝', 'data/files/mall/brand/30.jpg', '', 0, 255, 0, 0, 0, '', 'D', ''),
(17, '小米', 'data/files/mall/brand/31.jpg', 'data/files/mall/brand/17/brand_image.jpg', 0, 4, 0, 0, 0, '', 'X', 'Xiaomi/小米 小米电视4A 43英寸 青春版高清wifi智能电视40 50'),
(18, '飞利浦', 'data/files/mall/brand/32.jpg', 'data/files/mall/brand/18/brand_image.png', 0, 3, 0, 0, 0, '', 'F', ''),
(19, '海信', 'data/files/mall/brand/33.jpg', 'data/files/mall/brand/19/brand_image.jpg', 0, 2, 0, 0, 0, '', 'H', '海信电视国际知名品牌'),
(20, '博艺花卉', 'data/files/mall/brand/20/brand_logo.png', 'data/files/mall/brand/20/brand_image.jpg', 0, 1, 1, 0, 1, '', 'B', '美的全球知名家电品牌');

-- --------------------------------------------------------

--
-- 表的结构 `swd_cart`
--

CREATE TABLE `swd_cart` (
  `rec_id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `goods_name` varchar(255) DEFAULT '',
  `spec_id` int(10) UNSIGNED DEFAULT '0',
  `specification` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) UNSIGNED DEFAULT '0.00',
  `quantity` int(10) UNSIGNED DEFAULT '1',
  `goods_image` varchar(255) DEFAULT NULL,
  `selected` tinyint(1) UNSIGNED DEFAULT '0',
  `product_id` varchar(32) DEFAULT '',
  `invalid` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_cart`
--

INSERT INTO `swd_cart` (`rec_id`, `userid`, `store_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `selected`, `product_id`, `invalid`) VALUES
(64, 4, 2, 311, '【花束】抱抱桶~52朵粉雪杉玫瑰', 354, '', '380.00', 1, 'data/files/store_2/goods/20231003173031903.jpg.thumb.jpg', 0, 'abf28665420a0568934035c667cecf8a', NULL),
(61, 4, 2, 306, '【鲜花】混搭系列', 349, '', '188.00', 1, 'data/files/store_2/goods/20231002161348957.jpg.thumb.jpg', 0, '80b1cfa7198da1cdc7b424328a269979', NULL),
(162, 5, 2, 198, '【鲜花】小花束', 241, '', '35.00', 1, 'data/files/store_2/goods/20230912144511561.jpg.thumb.jpg', 0, 'ea26d874ff7468786f19c49a792c3c5d', NULL),
(125, 5, 2, 338, '【绿植】滴水观音~盆栽', 383, '', '488.00', 1, 'data/files/store_2/goods/20231024144224646.jpg.thumb.jpg', 0, 'e48110356f4a94408f8c4a10bd043ae8', NULL),
(68, 4, 2, 114, '【花束】向日葵混搭系列', 157, '', '260.00', 1, 'data/files/store_2/goods/20230906132606251.jpg.thumb.jpg', 0, '8e22932748edf1b0a96900cd37dcce3e', NULL),
(129, 5, 2, 317, '【花束】混搭~曼塔乌梅子酱~紫霞仙子~橙色系', 360, '', '288.00', 1, 'data/files/store_2/goods/20231015161452348.jpg.thumb.jpg', 0, 'a5c472fc9096c137ae9df46591d38d14', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `swd_cashcard`
--

CREATE TABLE `swd_cashcard` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `cardNo` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `useId` int(11) UNSIGNED DEFAULT '0',
  `printed` int(1) UNSIGNED DEFAULT '0',
  `add_time` int(11) DEFAULT NULL,
  `active_time` int(11) DEFAULT NULL,
  `expire_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_category_goods`
--

CREATE TABLE `swd_category_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `cate_id` int(10) UNSIGNED DEFAULT '0',
  `goods_id` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_category_goods`
--

INSERT INTO `swd_category_goods` (`id`, `cate_id`, `goods_id`) VALUES
(1, 2555, 9),
(77, 2559, 1),
(257, 2559, 2),
(73, 2559, 4),
(79, 2559, 5),
(1032, 2559, 6),
(237, 2556, 17),
(223, 2556, 18),
(217, 2556, 19),
(83, 2559, 25),
(216, 2555, 19),
(82, 2558, 25),
(13, 2557, 9),
(187, 2556, 27),
(186, 2555, 27),
(249, 2559, 11),
(423, 2559, 8),
(241, 2556, 12),
(236, 2555, 17),
(222, 2555, 18),
(76, 2558, 1),
(256, 2558, 2),
(72, 2558, 4),
(78, 2558, 5),
(1031, 2558, 6),
(425, 2559, 7),
(491, 2559, 10),
(248, 2558, 11),
(424, 2558, 7),
(422, 2558, 8),
(490, 2558, 10),
(84, 2558, 24),
(85, 2559, 24),
(117, 2559, 26),
(116, 2558, 26),
(119, 2559, 23),
(118, 2558, 23),
(153, 2559, 22),
(152, 2558, 22),
(123, 2559, 21),
(122, 2558, 21),
(125, 2559, 3),
(124, 2558, 3),
(227, 2556, 16),
(226, 2555, 16),
(98, 2555, 15),
(99, 2556, 15),
(102, 2555, 14),
(103, 2556, 14),
(171, 2556, 13),
(170, 2555, 13),
(185, 2556, 28),
(184, 2555, 28),
(197, 2556, 20),
(196, 2555, 20),
(245, 2556, 29),
(244, 2555, 29),
(193, 2556, 30),
(192, 2555, 30),
(189, 2557, 31),
(188, 2555, 31),
(235, 2556, 32),
(234, 2555, 32),
(136, 2555, 33),
(137, 2557, 33),
(233, 2556, 34),
(232, 2555, 34),
(140, 2555, 35),
(141, 2556, 35),
(142, 2555, 36),
(143, 2556, 36),
(231, 2556, 37),
(230, 2555, 37),
(243, 2556, 38),
(242, 2555, 38),
(148, 2555, 39),
(149, 2556, 39),
(229, 2556, 41),
(228, 2555, 41),
(240, 2555, 12),
(417, 2559, 43),
(416, 2558, 43),
(415, 2559, 44),
(414, 2558, 44),
(413, 2559, 45),
(412, 2558, 45),
(419, 2559, 42),
(418, 2558, 42),
(411, 2559, 46),
(410, 2558, 46),
(409, 2559, 47),
(408, 2558, 47),
(433, 2559, 48),
(432, 2558, 48),
(405, 2559, 49),
(404, 2558, 49),
(403, 2559, 50),
(402, 2558, 50),
(431, 2559, 51),
(430, 2558, 51),
(399, 2559, 52),
(398, 2558, 52),
(397, 2559, 53),
(396, 2558, 53),
(377, 2559, 54),
(376, 2558, 54),
(395, 2559, 55),
(394, 2558, 55),
(393, 2559, 56),
(392, 2558, 56),
(391, 2559, 57),
(390, 2558, 57),
(1532, 2559, 58),
(1531, 2558, 58),
(387, 2559, 59),
(386, 2558, 59),
(385, 2559, 60),
(384, 2558, 60),
(383, 2559, 61),
(382, 2558, 61),
(381, 2559, 62),
(380, 2558, 62),
(379, 2559, 63),
(378, 2558, 63),
(434, 2558, 64),
(435, 2559, 64),
(436, 2558, 65),
(437, 2559, 65),
(1016, 2556, 66),
(1015, 2555, 66),
(1580, 2556, 67),
(1579, 2555, 67),
(447, 2556, 68),
(446, 2555, 68),
(444, 2555, 69),
(445, 2556, 69),
(448, 2555, 70),
(449, 2556, 70),
(450, 2555, 71),
(451, 2556, 71),
(452, 2555, 72),
(453, 2556, 72),
(487, 2556, 73),
(486, 2555, 73),
(937, 2557, 74),
(936, 2555, 74),
(1534, 2556, 75),
(1533, 2555, 75),
(1562, 2556, 76),
(1561, 2555, 76),
(466, 2555, 77),
(467, 2556, 77),
(468, 2555, 78),
(469, 2556, 78),
(485, 2556, 79),
(484, 2555, 79),
(472, 2555, 80),
(473, 2556, 80),
(939, 2557, 81),
(938, 2555, 81),
(478, 2555, 82),
(479, 2556, 82),
(976, 2556, 83),
(975, 2555, 83),
(935, 2557, 84),
(934, 2555, 84),
(492, 2558, 85),
(493, 2577, 85),
(494, 2558, 86),
(495, 2577, 86),
(501, 2577, 87),
(500, 2558, 87),
(498, 2558, 88),
(499, 2577, 88),
(502, 2558, 89),
(503, 2577, 89),
(504, 2558, 90),
(505, 2577, 90),
(506, 2558, 91),
(507, 2577, 91),
(508, 2558, 92),
(509, 2577, 92),
(510, 2558, 93),
(511, 2577, 93),
(515, 2577, 94),
(514, 2558, 94),
(1427, 2577, 95),
(1426, 2558, 95),
(819, 2577, 96),
(818, 2558, 96),
(825, 2577, 97),
(824, 2558, 97),
(823, 2577, 98),
(822, 2558, 98),
(526, 2558, 99),
(527, 2577, 99),
(528, 2558, 100),
(529, 2577, 100),
(530, 2558, 101),
(531, 2577, 101),
(532, 2558, 102),
(533, 2577, 102),
(534, 2558, 103),
(535, 2577, 103),
(536, 2558, 104),
(537, 2577, 104),
(538, 2558, 105),
(539, 2577, 105),
(1480, 2623, 313),
(1486, 2636, 319),
(1485, 2572, 319),
(1620, 2571, 320),
(1619, 2555, 320),
(968, 2605, 261),
(546, 2558, 109),
(547, 2577, 109),
(1425, 2577, 110),
(1424, 2558, 110),
(1551, 2637, 328),
(1550, 2573, 328),
(1622, 2644, 339),
(1592, 2628, 302),
(1386, 2573, 309),
(1645, 2573, 308),
(1437, 2572, 304),
(1366, 2627, 305),
(1660, 2654, 348),
(1364, 2627, 303),
(1590, 2557, 338),
(1274, 2560, 119),
(1423, 2573, 199),
(1392, 2573, 200),
(1554, 2637, 325),
(1273, 2558, 119),
(1621, 2572, 339),
(1555, 2618, 329),
(1589, 2555, 338),
(1393, 2573, 111),
(1624, 2573, 342),
(1623, 2572, 342),
(1395, 2573, 114),
(1633, 2573, 115),
(1641, 2573, 318),
(1640, 2572, 318),
(1643, 2573, 317),
(1642, 2572, 317),
(1462, 2626, 316),
(1461, 2572, 316),
(1476, 2634, 315),
(1475, 2572, 315),
(1438, 2627, 304),
(1436, 2605, 132),
(1435, 2605, 131),
(1434, 2605, 130),
(1433, 2605, 129),
(1432, 2605, 128),
(1431, 2605, 127),
(1430, 2605, 126),
(1429, 2605, 125),
(1428, 2605, 124),
(600, 2555, 133),
(601, 2571, 133),
(602, 2555, 134),
(603, 2571, 134),
(604, 2555, 135),
(605, 2571, 135),
(606, 2555, 136),
(607, 2571, 136),
(608, 2555, 138),
(609, 2571, 138),
(963, 2571, 139),
(962, 2555, 139),
(612, 2555, 140),
(613, 2571, 140),
(614, 2555, 141),
(615, 2571, 141),
(616, 2558, 142),
(617, 2577, 142),
(618, 2558, 143),
(619, 2577, 143),
(620, 2558, 144),
(621, 2577, 144),
(622, 2558, 145),
(623, 2577, 145),
(624, 2558, 146),
(625, 2577, 146),
(626, 2558, 147),
(627, 2577, 147),
(628, 2558, 148),
(629, 2577, 148),
(630, 2558, 149),
(631, 2577, 149),
(632, 2558, 150),
(633, 2577, 150),
(634, 2558, 151),
(635, 2577, 151),
(636, 2558, 152),
(637, 2577, 152),
(638, 2558, 153),
(639, 2577, 153),
(640, 2558, 154),
(641, 2577, 154),
(642, 2558, 155),
(643, 2577, 155),
(644, 2558, 156),
(645, 2577, 156),
(646, 2558, 157),
(647, 2577, 157),
(648, 2558, 158),
(649, 2577, 158),
(650, 2558, 159),
(651, 2577, 159),
(652, 2558, 160),
(653, 2577, 160),
(654, 2558, 161),
(655, 2577, 161),
(656, 2558, 162),
(657, 2577, 162),
(658, 2558, 163),
(659, 2577, 163),
(660, 2558, 164),
(661, 2577, 164),
(662, 2558, 165),
(663, 2577, 165),
(664, 2558, 166),
(665, 2577, 166),
(666, 2558, 167),
(667, 2577, 167),
(668, 2558, 168),
(669, 2577, 168),
(670, 2558, 169),
(671, 2577, 169),
(672, 2558, 170),
(673, 2577, 170),
(674, 2558, 171),
(675, 2577, 171),
(676, 2558, 172),
(677, 2577, 172),
(1479, 2618, 313),
(1422, 2635, 178),
(1421, 2635, 177),
(1420, 2635, 176),
(1419, 2635, 175),
(1418, 2635, 174),
(1417, 2635, 173),
(1508, 2630, 271),
(1520, 2634, 324),
(1519, 2628, 324),
(1518, 2572, 324),
(1517, 2619, 323),
(1516, 2618, 323),
(1616, 2571, 322),
(1615, 2555, 322),
(1528, 2571, 321),
(1527, 2555, 321),
(1416, 2635, 188),
(1415, 2635, 187),
(1414, 2635, 186),
(1413, 2635, 185),
(1412, 2635, 184),
(1411, 2635, 183),
(1410, 2635, 182),
(1409, 2635, 181),
(1408, 2635, 180),
(1407, 2635, 179),
(1549, 2572, 328),
(1630, 2573, 327),
(1629, 2572, 327),
(1524, 2638, 326),
(1523, 2572, 326),
(1553, 2573, 325),
(1552, 2572, 325),
(1512, 2634, 272),
(1511, 2628, 272),
(1509, 2634, 271),
(1406, 2635, 198),
(1405, 2635, 197),
(1404, 2635, 196),
(1403, 2635, 195),
(1402, 2635, 194),
(1401, 2635, 193),
(1400, 2635, 192),
(1399, 2635, 191),
(1398, 2635, 190),
(1397, 2635, 189),
(1390, 2573, 123),
(1389, 2573, 121),
(1388, 2573, 120),
(1387, 2573, 117),
(784, 2571, 209),
(783, 2555, 209),
(1586, 2605, 337),
(1584, 2556, 336),
(1614, 2571, 333),
(1613, 2555, 333),
(1566, 2556, 332),
(1565, 2555, 332),
(1618, 2556, 331),
(1617, 2555, 331),
(1610, 2571, 341),
(1609, 2555, 341),
(1356, 2575, 207),
(1355, 2575, 118),
(926, 2576, 228),
(1651, 2573, 344),
(1650, 2572, 344),
(785, 2555, 210),
(786, 2571, 210),
(787, 2555, 211),
(788, 2571, 211),
(789, 2555, 212),
(790, 2571, 212),
(791, 2555, 213),
(792, 2571, 213),
(793, 2555, 214),
(794, 2571, 214),
(967, 2571, 261),
(944, 2605, 260),
(943, 2571, 260),
(972, 2571, 259),
(971, 2555, 259),
(940, 2605, 81),
(933, 2571, 221),
(932, 2571, 220),
(931, 2571, 219),
(930, 2571, 218),
(929, 2571, 217),
(928, 2571, 216),
(927, 2571, 215),
(1362, 2574, 268),
(1361, 2574, 222),
(1354, 2634, 312),
(1529, 2634, 311),
(820, 2558, 224),
(821, 2577, 224),
(826, 2558, 225),
(827, 2577, 225),
(828, 2558, 226),
(829, 2577, 226),
(830, 2558, 227),
(831, 2577, 227),
(925, 2576, 107),
(924, 2576, 106),
(961, 2571, 265),
(960, 2555, 265),
(959, 2571, 264),
(958, 2555, 264),
(957, 2571, 263),
(956, 2555, 263),
(966, 2555, 261),
(949, 2605, 262),
(948, 2571, 262),
(947, 2555, 262),
(914, 2576, 229),
(915, 2576, 230),
(916, 2576, 231),
(917, 2576, 232),
(1530, 2576, 233),
(919, 2576, 234),
(920, 2576, 235),
(921, 2576, 236),
(922, 2576, 237),
(923, 2576, 238),
(1360, 2574, 202),
(1359, 2574, 201),
(1558, 2559, 267),
(1557, 2558, 267),
(974, 2556, 266),
(973, 2555, 266),
(901, 2577, 244),
(900, 2577, 243),
(899, 2577, 242),
(898, 2577, 241),
(897, 2577, 240),
(896, 2577, 239),
(868, 2558, 245),
(869, 2577, 245),
(870, 2558, 246),
(871, 2577, 246),
(872, 2558, 247),
(873, 2577, 247),
(874, 2558, 248),
(875, 2577, 248),
(876, 2558, 249),
(877, 2577, 249),
(878, 2558, 250),
(879, 2577, 250),
(880, 2558, 251),
(881, 2577, 251),
(882, 2558, 252),
(883, 2577, 252),
(884, 2558, 253),
(885, 2577, 253),
(886, 2558, 254),
(887, 2577, 254),
(888, 2558, 255),
(889, 2577, 255),
(890, 2558, 256),
(891, 2577, 256),
(892, 2558, 257),
(893, 2577, 257),
(894, 2558, 258),
(895, 2577, 258),
(1358, 2574, 116),
(1357, 2574, 112),
(1297, 2560, 270),
(1296, 2558, 270),
(1352, 2634, 310),
(1510, 2572, 272),
(1659, 2558, 348),
(1657, 2628, 347),
(1653, 2573, 343),
(1652, 2572, 343),
(1052, 2560, 274),
(1051, 2558, 274),
(1026, 2559, 275),
(1025, 2558, 275),
(1309, 2560, 276),
(1308, 2558, 276),
(1307, 2560, 277),
(1306, 2558, 277),
(1305, 2560, 278),
(1304, 2558, 278),
(1237, 2560, 279),
(1236, 2558, 279),
(1033, 2558, 280),
(1034, 2559, 280),
(1035, 2558, 281),
(1036, 2559, 281),
(1040, 2559, 282),
(1039, 2558, 282),
(1041, 2558, 283),
(1042, 2559, 283),
(1043, 2558, 284),
(1044, 2577, 284),
(1045, 2558, 285),
(1046, 2577, 285),
(1047, 2558, 286),
(1048, 2577, 286),
(1049, 2558, 287),
(1050, 2577, 287),
(1656, 2572, 347),
(1655, 2573, 345),
(1345, 2571, 314),
(1344, 2555, 314),
(1346, 2634, 122),
(1347, 2634, 206),
(1654, 2572, 345),
(1367, 2628, 288),
(1583, 2555, 336),
(1582, 2556, 335),
(1581, 2555, 335),
(1376, 2630, 301),
(1368, 2628, 291),
(1369, 2628, 294),
(1075, 2558, 295),
(1076, 2560, 295),
(1077, 2558, 296),
(1078, 2560, 296),
(1079, 2558, 297),
(1080, 2560, 297),
(1560, 2559, 330),
(1559, 2558, 330),
(1570, 2571, 334),
(1569, 2555, 334),
(1378, 2632, 300),
(1377, 2632, 299),
(1375, 2630, 293),
(1374, 2630, 292),
(1591, 2572, 302),
(1507, 2572, 271),
(1384, 2573, 307),
(1383, 2573, 306),
(1382, 2573, 298),
(1381, 2573, 205),
(1380, 2573, 204),
(1644, 2573, 203),
(1585, 2555, 337),
(1363, 2574, 269),
(1349, 2634, 223),
(1348, 2634, 208),
(1371, 2629, 273),
(1372, 2629, 289),
(1373, 2629, 290),
(1602, 2605, 340),
(1478, 2559, 313),
(1477, 2558, 313),
(1394, 2573, 113);

-- --------------------------------------------------------

--
-- 表的结构 `swd_category_store`
--

CREATE TABLE `swd_category_store` (
  `id` int(11) UNSIGNED NOT NULL,
  `cate_id` int(10) UNSIGNED DEFAULT '0',
  `store_id` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_category_store`
--

INSERT INTO `swd_category_store` (`id`, `cate_id`, `store_id`) VALUES
(1, 63, 2);

-- --------------------------------------------------------

--
-- 表的结构 `swd_cate_pvs`
--

CREATE TABLE `swd_cate_pvs` (
  `cate_id` int(11) NOT NULL,
  `pvs` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_channel`
--

CREATE TABLE `swd_channel` (
  `id` int(11) UNSIGNED NOT NULL,
  `cid` varchar(20) DEFAULT '',
  `title` varchar(50) DEFAULT '',
  `style` int(11) DEFAULT '1',
  `cate_id` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `add_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_channel`
--

INSERT INTO `swd_channel` (`id`, `cid`, `title`, `style`, `cate_id`, `status`, `add_time`) VALUES
(1, '154318705971', '品牌女装', 1, 0, 1, 1617045952),
(2, '154318852528', '电器城', 2, 0, 1, 1617045962);

-- --------------------------------------------------------

--
-- 表的结构 `swd_cod`
--

CREATE TABLE `swd_cod` (
  `store_id` int(10) NOT NULL,
  `regions` text,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_cod`
--

INSERT INTO `swd_cod` (`store_id`, `regions`, `status`) VALUES
(2, 'a:1:{i:284;s:16:\"湖北省	武汉\";}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `swd_collect`
--

CREATE TABLE `swd_collect` (
  `id` int(11) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(10) DEFAULT 'goods',
  `item_id` int(10) UNSIGNED DEFAULT '0',
  `keyword` varchar(60) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_collect`
--

INSERT INTO `swd_collect` (`id`, `userid`, `type`, `item_id`, `keyword`, `add_time`) VALUES
(1, 2, 'store', 2, '', 1692521806);

-- --------------------------------------------------------

--
-- 表的结构 `swd_congratulations`
--

CREATE TABLE `swd_congratulations` (
  `addr_id` int(10) NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_congratulations`
--

INSERT INTO `swd_congratulations` (`addr_id`, `content`) VALUES
(41, '祝您，生日快乐，有钱，有爱，无忧，无虑！\r\n凌青云啸九天哥，凤凰振翅，光芒万丈！\r\n乘长风破万里浪，直挂云帆，如愿以偿！'),
(42, '生日快乐，暴富！暴美！暴顺利！\r\n未来眼里是阳光，笑里是坦荡，所求皆所愿，永远年轻漂亮！'),
(43, '成长不期而遇，生日如约而至，愿以后的日子里不将就，也不辜负此生平安喜乐，生日快乐！'),
(44, '“愿所有的梦想都实现 ，所有的希望都如愿 ，所有的付出都兑现”生日快乐！'),
(45, '“愿所有的梦想都实现 ，所有的希望都如愿 ，所有的付出都兑现”生日快乐！'),
(46, '开业大吉,生意兴隆!'),
(47, '烛光闪闪，快乐幸福，生日快乐，心想事成，幸运之日，吉祥之日，愿愿顺心，事事如意，祝君生日快乐，开心幸福！'),
(48, '生日快乐！祝您身体健康，平平安安，事事顺利'),
(49, '生日快乐!祝您开心幸福，心想事成，万事如意'),
(50, '开业大吉，生意兴隆'),
(52, '刘霞姐生日快乐，爱你哦！'),
(53, '生日快乐'),
(54, '雷小姐；生日快乐'),
(77, '生日快乐'),
(78, '生日快乐'),
(79, '生日快乐,暴富暴美！'),
(84, '祝我们的开心果财色双收，愿你岁岁平安，岁岁有我们。'),
(86, '祝：天下，最美的仙女，生日快乐，早日暴富。'),
(88, '祝幺爷生日快乐!身体健康！万事顺心如意!年年十八!            静静'),
(89, '美女生日快乐，永远18岁'),
(93, '开业大吉,爆款连连'),
(94, '祝美婷婷，暴瘦暴美暴富，生日快乐！永远幸福！'),
(97, '祝你生日快乐，祝你天天快乐！祝你从早上起床快乐到晚上进被窝'),
(98, '祝刘大姐生日快乐'),
(99, '祝刘女士生日快乐'),
(104, '恭喜这位过生日的女孩，又可爱了一岁'),
(105, '生日快乐'),
(108, '愿你再创辉煌！  愿你顺心如意！  愿你健康快乐每一天！'),
(109, '你是上天的宠儿！ 你是销售战神！你是福星走到哪里你旺到哪里。'),
(111, '一句问候，一句祝福，一切如愿，一生幸福，一世平安，所有好运围绕在您身边，祝您生日快乐！'),
(113, '生日快乐，笑口常开。\r\n是姐妹心中永远的太阳花！！！'),
(116, '祝公主生日快乐');

-- --------------------------------------------------------

--
-- 表的结构 `swd_coupon`
--

CREATE TABLE `swd_coupon` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED DEFAULT '0',
  `coupon_name` varchar(100) DEFAULT '',
  `coupon_value` decimal(10,2) UNSIGNED DEFAULT '0.00',
  `use_times` int(10) UNSIGNED DEFAULT '0',
  `start_time` int(10) UNSIGNED DEFAULT NULL,
  `end_time` int(10) UNSIGNED DEFAULT NULL,
  `min_amount` decimal(10,2) UNSIGNED DEFAULT '0.00',
  `available` int(11) DEFAULT '1',
  `image` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT '0',
  `surplus` int(11) DEFAULT '0',
  `clickreceive` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_coupon`
--

INSERT INTO `swd_coupon` (`coupon_id`, `store_id`, `coupon_name`, `coupon_value`, `use_times`, `start_time`, `end_time`, `min_amount`, `available`, `image`, `total`, `surplus`, `clickreceive`) VALUES
(1, 2, '新春大促', '10.00', 1, 1617004800, 1640966399, '100.00', 1, NULL, 1000, 1000, 1),
(2, 2, '年中大促', '5.00', 1, 1617004800, 1640966399, '50.00', 1, NULL, 999, 999, 1),
(3, 2, '618活动', '18.00', 1, 1617004800, 1640966399, '88.00', 1, NULL, 999, 999, 1),
(4, 2, '新用户优惠券', '10.00', 1, 1693872000, 1861919999, '300.00', 1, NULL, 100000, 100000, 1);

-- --------------------------------------------------------

--
-- 表的结构 `swd_coupon_sn`
--

CREATE TABLE `swd_coupon_sn` (
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `coupon_sn` varchar(20) NOT NULL DEFAULT '',
  `coupon_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `remain_times` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_delivery_template`
--

CREATE TABLE `swd_delivery_template` (
  `template_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT '',
  `store_id` int(10) DEFAULT '0',
  `types` text,
  `dests` text,
  `start_standards` text,
  `start_fees` text,
  `add_standards` text,
  `add_fees` text,
  `created` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_delivery_template`
--

INSERT INTO `swd_delivery_template` (`template_id`, `name`, `store_id`, `types`, `dests`, `start_standards`, `start_fees`, `add_standards`, `add_fees`, `created`) VALUES
(1, '默认运费', 2, 'express;ems;post', '0;0;0', '1;1;1', '10;10;10', '1;1;1', '5;5;5', 1542757210),
(2, '2公里内', 2, 'express;ems;post', '0,284;0,284;0,284', '1,1;1,1;1,1', '10,10;10,10;10,10', '1,1;1,1;1,1', '5,5;5,5;5,5', 1691388417);

-- --------------------------------------------------------

--
-- 表的结构 `swd_deposit_account`
--

CREATE TABLE `swd_deposit_account` (
  `account_id` int(11) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `account` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT '',
  `money` decimal(10,2) DEFAULT '0.00',
  `frozen` decimal(10,2) DEFAULT '0.00',
  `nodrawal` decimal(10,2) DEFAULT '0.00',
  `real_name` varchar(30) DEFAULT NULL,
  `pay_status` varchar(3) DEFAULT 'off',
  `add_time` int(11) DEFAULT NULL,
  `last_update` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_deposit_account`
--

INSERT INTO `swd_deposit_account` (`account_id`, `userid`, `account`, `password`, `money`, `frozen`, `nodrawal`, `real_name`, `pay_status`, `add_time`, `last_update`) VALUES
(48, 42, '1695691677@qq.com', '25f9e794323b453885f5181f1b624d0b', '79998820.00', '0.00', '0.00', '杰仕轩扬', 'ON', 1695691677, 1695691677),
(49, 43, '1695694719@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999740.00', '0.00', '0.00', '天龙纺织', 'ON', 1695694719, 1695694719),
(47, 41, '1695690778@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999780.00', '0.00', '0.00', '龙腾置业', 'ON', 1695690778, 1695690778),
(4, 7, '1695633154@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999054.00', '0.00', '0.00', '到店访客', 'ON', 1695633154, 1695633154),
(3, 6, '1695632007@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999220.00', '0.00', '0.00', '默宾服饰', 'ON', 1695632007, 1695632007),
(2, 5, '453115621@qq.com', '25f9e794323b453885f5181f1b624d0b', '998748.00', '0.00', '0.00', '开业零售', 'ON', 1695458549, 1695458549),
(1, 4, '453115621@qq.com', '25f9e794323b453885f5181f1b624d0b', '994753.00', '0.00', '0.00', '散单零售', 'ON', 1695458549, 1695458549),
(50, 2, '1695702366@qq.com', '25f9e794323b453885f5181f1b624d0b', '80021136.00', '0.00', '0.00', '博艺花卉', 'ON', 1695702366, 1695702366),
(51, 44, '1695704080@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999850.00', '0.00', '0.00', '西部牛仔旺', 'ON', 1695704080, 1695704080),
(52, 45, '1695704114@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '维多利纺织', 'ON', 1695704114, 1695704114),
(53, 46, '1695704464@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '羽丰羽绒', 'ON', 1695704464, 1695704464),
(54, 47, '1695704487@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '羽丰羽绒', 'ON', 1695704487, 1695704487),
(55, 48, '1695704565@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '天龙纸塑包装', 'ON', 1695704565, 1695704565),
(56, 49, '1695704575@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '恒隆纺织', 'ON', 1695704575, 1695704575),
(57, 50, '1695704585@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '欧洲大街', 'ON', 1695704585, 1695704585),
(58, 51, '1695704594@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '骏鑫辅料', 'ON', 1695704594, 1695704594),
(59, 52, '1695704604@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '锋尚隆布行', 'ON', 1695704604, 1695704604),
(60, 53, '1695704612@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '卡迪卡菲', 'ON', 1695704612, 1695704612),
(61, 54, '1695704620@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999710.00', '0.00', '0.00', '万宝纺织', 'ON', 1695704620, 1695704620),
(62, 55, '1695704629@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '博雅琦', 'ON', 1695704629, 1695704629),
(63, 56, '1695704636@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '谷岸', 'ON', 1695704636, 1695704636),
(64, 57, '1695709864@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '吴伟年', 'ON', 1695709864, 1695709864),
(65, 58, '18327277170', '25f9e794323b453885f5181f1b624d0b', '79998320.00', '0.00', '0.00', '中云物流邹旭', 'ON', 1695870836, 1695870836),
(66, 59, '1696646782@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '吴涛', 'ON', 1696646782, 1696646782),
(67, 60, '1696648976@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '依铭服饰', 'ON', 1696648976, 1696648976),
(68, 61, '15377623826', '25f9e794323b453885f5181f1b624d0b', '79999780.00', '0.00', '0.00', '德丰~肖丹', 'ON', 1696910255, 1696910255),
(69, 62, '1697177105@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '丽丽', 'ON', 1697177105, 1697177105),
(70, 63, '1697340771@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '诺信纺织', 'ON', 1697340771, 1697340771),
(71, 64, '1697341044@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '叁易服饰', 'ON', 1697341044, 1697341044),
(72, 65, '1697341320@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '维多利纺织-彪', 'ON', 1697341320, 1697341320),
(73, 66, '1697359477@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999740.00', '0.00', '0.00', 'QKK服饰', 'ON', 1697359477, 1697359477),
(74, 67, '1697417527@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '杰仕轩扬~涛哥', 'ON', 1697417527, 1697417527),
(75, 68, '1697417643@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '聖甲~英子', 'ON', 1697417643, 1697417643),
(76, 69, '1697422302@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999702.00', '0.00', '0.00', '杨雨甜', 'ON', 1697422302, 1697422302),
(77, 70, '1697425387@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999780.00', '0.00', '0.00', '杉线谱服饰~阿丁', 'ON', 1697425387, 1697425387),
(78, 71, '1697436724@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '大通毛绒', 'ON', 1697436724, 1697436724),
(79, 72, '1697606863@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '振宇俊男', 'ON', 1697606863, 1697606863),
(80, 73, '1697623249@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '骏鑫辅料-李拓', 'ON', 1697623249, 1697623249),
(81, 74, '1697766311@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999840.00', '0.00', '0.00', '田传义', 'ON', 1697766311, 1697766311),
(82, 75, '1697854475@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999850.00', '0.00', '0.00', '鉴航纺织', 'ON', 1697854475, 1697854475),
(83, 76, '1698023796@qq.com', '25f9e794323b453885f5181f1b624d0b', '79998180.00', '0.00', '0.00', '周工', 'ON', 1698023796, 1698023796),
(84, 77, '1698053917@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999870.00', '0.00', '0.00', '孙雪晴', 'ON', 1698053917, 1698053917),
(85, 78, '1698122230@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999885.00', '0.00', '0.00', '郭惠', 'ON', 1698122230, 1698122230),
(86, 79, '1698122238@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '程进', 'ON', 1698122238, 1698122238),
(87, 80, '1698130063@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999502.00', '0.00', '0.00', '补发', 'ON', 1698130063, 1698130063),
(88, 81, '1698130583@qq.com', '25f9e794323b453885f5181f1b624d0b', '79995094.00', '0.00', '0.00', '匿名', 'ON', 1698130583, 1698130583),
(89, 82, '1698134052@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '白旺旺', 'ON', 1698134052, 1698134052),
(90, 83, '18207155955', '25f9e794323b453885f5181f1b624d0b', '79999650.00', '0.00', '0.00', 'wx~美好向往', 'ON', 1698134973, 1698134973),
(91, 84, '1698289267@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999740.00', '0.00', '0.00', '明明', 'ON', 1698289267, 1698289267),
(92, 85, '1698485364@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999880.00', '0.00', '0.00', '魏芳', 'ON', 1698485364, 1698485364),
(93, 86, '13307168900', '25f9e794323b453885f5181f1b624d0b', '79999850.00', '0.00', '0.00', '盛先生', 'ON', 1698719422, 1698719422),
(94, 87, '1699063583@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999710.00', '0.00', '0.00', '程静', 'ON', 1699063583, 1699063583),
(95, 88, '1699493547@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '祥盛布行~李思', 'ON', 1699493547, 1699493547),
(96, 89, '1699498540@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '云尚韩国馆', 'ON', 1699498540, 1699498540),
(97, 90, '1699604811@qq.com', '25f9e794323b453885f5181f1b624d0b', '79999650.00', '0.00', '0.00', '德丰纺织', 'ON', 1699604811, 1699604811),
(98, 91, '1699695760@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '侄女', 'ON', 1699695760, 1699695760),
(99, 92, '1699760743@qq.com', '25f9e794323b453885f5181f1b624d0b', '80000000.00', '0.00', '0.00', '海华毛绒', 'ON', 1699760743, 1699760743);

-- --------------------------------------------------------

--
-- 表的结构 `swd_deposit_recharge`
--

CREATE TABLE `swd_deposit_recharge` (
  `recharge_id` int(11) UNSIGNED NOT NULL,
  `orderId` varchar(30) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `examine` varchar(100) DEFAULT '',
  `is_online` int(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_deposit_recharge`
--

INSERT INTO `swd_deposit_recharge` (`recharge_id`, `orderId`, `userid`, `examine`, `is_online`) VALUES
(12, '215725030854', 4, '系统管理员', 1);

-- --------------------------------------------------------

--
-- 表的结构 `swd_deposit_record`
--

CREATE TABLE `swd_deposit_record` (
  `record_id` int(11) UNSIGNED NOT NULL,
  `tradeNo` varchar(30) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(10,2) DEFAULT '0.00' COMMENT '收支金额',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '账户余额',
  `flow` varchar(10) DEFAULT 'outlay' COMMENT '收支',
  `tradeType` varchar(20) DEFAULT 'PAY' COMMENT '交易类型',
  `tradeTypeName` varchar(20) DEFAULT '在线支付' COMMENT '交易类型名称',
  `name` varchar(100) DEFAULT '' COMMENT '名称',
  `remark` varchar(255) DEFAULT '' COMMENT '备注'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_deposit_record`
--

INSERT INTO `swd_deposit_record` (`record_id`, `tradeNo`, `userid`, `amount`, `balance`, `flow`, `tradeType`, `tradeTypeName`, `name`, `remark`) VALUES
(25, '20230926101839804477', 2, '260.00', '80000260.00', 'income', 'PAY', '在线支付', '', ''),
(24, '20230926101839804477', 43, '260.00', '79999740.00', 'outlay', 'PAY', '在线支付', '', ''),
(23, '20230926091258471232', 41, '220.00', '79999780.00', 'outlay', 'PAY', '在线支付', '', ''),
(22, '20230926092757041861', 42, '460.00', '79999080.00', 'outlay', 'PAY', '在线支付', '', ''),
(21, '20230926092855816692', 42, '460.00', '79999540.00', 'outlay', 'PAY', '在线支付', '', ''),
(20, '20230925180708806385', 7, '298.00', '79999054.00', 'outlay', 'PAY', '在线支付', '', ''),
(19, '20230925174822159116', 7, '298.00', '79999352.00', 'outlay', 'PAY', '在线支付', '', ''),
(18, '20230925171234047253', 7, '350.00', '79999650.00', 'outlay', 'PAY', '在线支付', '', ''),
(26, '20230926092855816692', 2, '460.00', '80000720.00', 'income', 'PAY', '在线支付', '', ''),
(27, '20230926092757041861', 2, '460.00', '80001180.00', 'income', 'PAY', '在线支付', '', ''),
(28, '20230926091258471232', 2, '220.00', '80001400.00', 'income', 'PAY', '在线支付', '', ''),
(29, '20230925180708806385', 2, '268.00', '80001668.00', 'income', 'PAY', '在线支付', '', ''),
(30, '20230925174822159116', 2, '220.00', '80001888.00', 'income', 'PAY', '在线支付', '', ''),
(31, '20230925171234047253', 2, '350.00', '80002238.00', 'income', 'PAY', '在线支付', '', ''),
(32, '20230925164945243221', 6, '260.00', '79999740.00', 'outlay', 'PAY', '在线支付', '', ''),
(33, '20230925165327421059', 6, '260.00', '79999480.00', 'outlay', 'PAY', '在线支付', '', ''),
(34, '20230925165546124250', 6, '260.00', '79999220.00', 'outlay', 'PAY', '在线支付', '', ''),
(35, '20230927092052225713', 42, '260.00', '79998820.00', 'outlay', 'PAY', '在线支付', '', ''),
(36, '20231006165214774752', 5, '278.00', '999722.00', 'outlay', 'PAY', '在线支付', '', ''),
(37, '20231006164346016617', 4, '298.00', '999702.00', 'outlay', 'PAY', '在线支付', '', ''),
(38, '20231003174316469835', 4, '290.00', '999412.00', 'outlay', 'PAY', '在线支付', '', ''),
(39, '20231002112527542969', 5, '298.00', '999424.00', 'outlay', 'PAY', '在线支付', '', ''),
(40, '20231003173734875541', 4, '390.00', '999022.00', 'outlay', 'PAY', '在线支付', '', ''),
(41, '20231002112055878543', 5, '398.00', '999026.00', 'outlay', 'PAY', '在线支付', '', ''),
(42, '20230930132215744409', 5, '278.00', '998748.00', 'outlay', 'PAY', '在线支付', '', ''),
(43, '20230928111356885509', 58, '1680.00', '79998320.00', 'outlay', 'PAY', '在线支付', '', ''),
(44, '20231008092136418233', 4, '300.00', '998722.00', 'outlay', 'PAY', '在线支付', '', ''),
(45, '20231007143201901646', 4, '780.00', '997942.00', 'outlay', 'PAY', '在线支付', '', ''),
(46, '20231009091944729537', 4, '150.00', '997792.00', 'outlay', 'PAY', '在线支付', '', ''),
(47, '20230927092052225713', 2, '260.00', '80002498.00', 'income', 'PAY', '在线支付', '', ''),
(48, '20231002112055878543', 2, '398.00', '80002896.00', 'income', 'PAY', '在线支付', '', ''),
(49, '20231003174316469835', 2, '290.00', '80003186.00', 'income', 'PAY', '在线支付', '', ''),
(50, '20231006164346016617', 2, '298.00', '80003484.00', 'income', 'PAY', '在线支付', '', ''),
(51, '20231002112527542969', 2, '298.00', '80003782.00', 'income', 'PAY', '在线支付', '', ''),
(52, '20231003173734875541', 2, '390.00', '80004172.00', 'income', 'PAY', '在线支付', '', ''),
(53, '20230928111356885509', 2, '1680.00', '80005852.00', 'income', 'PAY', '在线支付', '', ''),
(54, '20230930132215744409', 2, '278.00', '80006130.00', 'income', 'PAY', '在线支付', '', ''),
(55, '20231006165214774752', 2, '278.00', '80006408.00', 'income', 'PAY', '在线支付', '', ''),
(56, '20231008092136418233', 2, '300.00', '80006708.00', 'income', 'PAY', '在线支付', '', ''),
(57, '20231009091944729537', 2, '150.00', '80006858.00', 'income', 'PAY', '在线支付', '', ''),
(58, '20230925165546124250', 2, '260.00', '80007118.00', 'income', 'PAY', '在线支付', '', ''),
(59, '20230925164945243221', 2, '260.00', '80007378.00', 'income', 'PAY', '在线支付', '', ''),
(60, '20230925165327421059', 2, '260.00', '80007638.00', 'income', 'PAY', '在线支付', '', ''),
(61, '20231009101005818080', 4, '100.00', '997692.00', 'outlay', 'PAY', '在线支付', '', ''),
(62, '20231009101005818080', 2, '100.00', '80007738.00', 'income', 'PAY', '在线支付', '', ''),
(63, '20231010172543288479', 4, '150.00', '997542.00', 'outlay', 'PAY', '在线支付', '', ''),
(64, '20231010115736927264', 61, '220.00', '79999780.00', 'outlay', 'PAY', '在线支付', '', ''),
(65, '20231007143201901646', 2, '780.00', '80008518.00', 'income', 'PAY', '在线支付', '', ''),
(66, '20231010172543288479', 2, '150.00', '80008668.00', 'income', 'PAY', '在线支付', '', ''),
(67, '20231010115736927264', 2, '220.00', '80008888.00', 'income', 'PAY', '在线支付', '', ''),
(68, '20231009151000443165', 4, '1.00', '997541.00', 'outlay', 'PAY', '在线支付', '', ''),
(69, '20231009151000443165', 2, '1.00', '80008889.00', 'income', 'PAY', '在线支付', '', ''),
(70, '20231012163151077070', 4, '150.00', '997391.00', 'outlay', 'PAY', '在线支付', '', ''),
(71, '20231013162603037466', 54, '290.00', '79999710.00', 'outlay', 'PAY', '在线支付', '', ''),
(72, '20231013162603037466', 2, '200.00', '80009089.00', 'income', 'PAY', '在线支付', '', ''),
(73, '20231012163151077070', 2, '150.00', '80009239.00', 'income', 'PAY', '在线支付', '', ''),
(74, '20231015164437109251', 66, '260.00', '79999740.00', 'outlay', 'PAY', '在线支付', '', ''),
(75, '20231015164437109251', 2, '260.00', '80009499.00', 'income', 'PAY', '在线支付', '', ''),
(76, '20231016101142588958', 69, '298.00', '79999702.00', 'outlay', 'PAY', '在线支付', '', ''),
(77, '20231016095508239417', 4, '150.00', '997241.00', 'outlay', 'PAY', '在线支付', '', ''),
(78, '20231016095508239417', 2, '150.00', '80009649.00', 'income', 'PAY', '在线支付', '', ''),
(79, '20231016101142588958', 2, '298.00', '80009947.00', 'income', 'PAY', '在线支付', '', ''),
(80, '20231017144604806912', 4, '70.00', '997171.00', 'outlay', 'PAY', '在线支付', '', ''),
(81, '20231017144628489036', 4, '20.00', '997151.00', 'outlay', 'PAY', '在线支付', '', ''),
(82, '20231017144637318105', 4, '10.00', '997141.00', 'outlay', 'PAY', '在线支付', '', ''),
(83, '20231017144637318105', 2, '10.00', '80009957.00', 'income', 'PAY', '在线支付', '', ''),
(84, '20231017144628489036', 2, '20.00', '80009977.00', 'income', 'PAY', '在线支付', '', ''),
(85, '20231017144604806912', 2, '70.00', '80010047.00', 'income', 'PAY', '在线支付', '', ''),
(86, '20231016110308224208', 70, '220.00', '79999780.00', 'outlay', 'PAY', '在线支付', '', ''),
(87, '20231016110308224208', 2, '220.00', '80010267.00', 'income', 'PAY', '在线支付', '', ''),
(88, '20231019103149011588', 4, '450.00', '996691.00', 'outlay', 'PAY', '在线支付', '', ''),
(89, '20231019103149011588', 2, '450.00', '80010717.00', 'income', 'PAY', '在线支付', '', ''),
(90, '20231020094511869975', 74, '160.00', '79999840.00', 'outlay', 'PAY', '在线支付', '', ''),
(91, '20231020095316941393', 4, '890.00', '995801.00', 'outlay', 'PAY', '在线支付', '', ''),
(92, '20231020095316941393', 2, '120.00', '80010837.00', 'income', 'PAY', '在线支付', '', ''),
(93, '20231020094511869975', 2, '160.00', '80010997.00', 'income', 'PAY', '在线支付', '', ''),
(94, '20231020125019404743', 4, '150.00', '995651.00', 'outlay', 'PAY', '在线支付', '', ''),
(95, '20231020125019404743', 2, '150.00', '80011147.00', 'income', 'PAY', '在线支付', '', ''),
(96, '20231020161514382039', 4, '158.00', '995493.00', 'outlay', 'PAY', '在线支付', '', ''),
(97, '20231020161514382039', 2, '158.00', '80011305.00', 'income', 'PAY', '在线支付', '', ''),
(98, '20231021104707338250', 44, '150.00', '79999850.00', 'outlay', 'PAY', '在线支付', '', ''),
(99, '20231021101436433750', 75, '150.00', '79999850.00', 'outlay', 'PAY', '在线支付', '', ''),
(100, '20231021104707338250', 2, '150.00', '80011455.00', 'income', 'PAY', '在线支付', '', ''),
(101, '20231021101436433750', 2, '150.00', '80011605.00', 'income', 'PAY', '在线支付', '', ''),
(102, '20231024093403517324', 78, '490.00', '79999510.00', 'outlay', 'PAY', '在线支付', '', ''),
(103, '20231023091800997140', 78, '430.00', '79999080.00', 'outlay', 'PAY', '在线支付', '', ''),
(104, '20231024094944311105', 76, '260.00', '79998820.00', 'outlay', 'PAY', '在线支付', '', ''),
(105, '20231024093517251584', 76, '60.00', '79998760.00', 'outlay', 'PAY', '在线支付', '', ''),
(106, '20231024093420582113', 76, '30.00', '79998730.00', 'outlay', 'PAY', '在线支付', '', ''),
(107, '20231024093411661644', 76, '30.00', '79998700.00', 'outlay', 'PAY', '在线支付', '', ''),
(108, '20231024093353249564', 76, '260.00', '79998440.00', 'outlay', 'PAY', '在线支付', '', ''),
(109, '20231023173838446414', 77, '130.00', '79999870.00', 'outlay', 'PAY', '在线支付', '', ''),
(110, '20231023091637431290', 76, '260.00', '79998180.00', 'outlay', 'PAY', '在线支付', '', ''),
(111, '20231024094944311105', 76, '260.00', '80011865.00', 'income', 'PAY', '在线支付', '', ''),
(112, '20231024093517251584', 2, '60.00', '80011925.00', 'income', 'PAY', '在线支付', '', ''),
(113, '20231024093411661644', 2, '30.00', '80011955.00', 'income', 'PAY', '在线支付', '', ''),
(114, '20231024093420582113', 2, '30.00', '80011985.00', 'income', 'PAY', '在线支付', '', ''),
(115, '20231024093403517324', 2, '490.00', '80012475.00', 'income', 'PAY', '在线支付', '', ''),
(116, '20231024093353249564', 2, '260.00', '80012735.00', 'income', 'PAY', '在线支付', '', ''),
(117, '20231023173838446414', 2, '130.00', '80012865.00', 'income', 'PAY', '在线支付', '', ''),
(118, '20231023091800997140', 2, '430.00', '80013295.00', 'income', 'PAY', '在线支付', '', ''),
(119, '20231023091637431290', 2, '260.00', '80013555.00', 'income', 'PAY', '在线支付', '', ''),
(120, '20231024131131722133', 78, '55.00', '79999945.00', 'outlay', 'PAY', '在线支付', '', ''),
(121, '20231024131131722133', 2, '55.00', '80013610.00', 'income', 'PAY', '在线支付', '', ''),
(122, '20231013134526321430', 4, '350.00', '995143.00', 'outlay', 'PAY', '在线支付', '', ''),
(123, '20231013134526321430', 2, '350.00', '80013960.00', 'income', 'PAY', '在线支付', '', ''),
(124, '20231024160933262181', 83, '350.00', '79999650.00', 'outlay', 'PAY', '在线支付', '', ''),
(125, '20231024144727032368', 80, '498.00', '79999502.00', 'outlay', 'PAY', '在线支付', '', ''),
(126, '20231024174844089048', 78, '60.00', '79999885.00', 'outlay', 'PAY', '在线支付', '', ''),
(127, '20231024190246061519', 4, '130.00', '995013.00', 'outlay', 'PAY', '在线支付', '', ''),
(128, '20231024190237826622', 4, '130.00', '994883.00', 'outlay', 'PAY', '在线支付', '', ''),
(129, '20231024190139922686', 4, '130.00', '994753.00', 'outlay', 'PAY', '在线支付', '', ''),
(130, '20231024190237826622', 2, '130.00', '80014090.00', 'income', 'PAY', '在线支付', '', ''),
(131, '20231024190246061519', 2, '130.00', '80014220.00', 'income', 'PAY', '在线支付', '', ''),
(132, '20231024190139922686', 2, '130.00', '80014350.00', 'income', 'PAY', '在线支付', '', ''),
(133, '20231024174844089048', 2, '60.00', '80014410.00', 'income', 'PAY', '在线支付', '', ''),
(134, '20231024160933262181', 2, '350.00', '80014760.00', 'income', 'PAY', '在线支付', '', ''),
(135, '20231024144727032368', 2, '498.00', '80015258.00', 'income', 'PAY', '在线支付', '', ''),
(136, '20231027162954499662', 81, '150.00', '79999850.00', 'outlay', 'PAY', '在线支付', '', ''),
(137, '20231027171128525248', 81, '150.00', '79999700.00', 'outlay', 'PAY', '在线支付', '', ''),
(138, '20231031103022588217', 86, '150.00', '79999850.00', 'outlay', 'PAY', '在线支付', '', ''),
(139, '20231031113149509954', 81, '350.00', '79999350.00', 'outlay', 'PAY', '在线支付', '', ''),
(140, '20231031113149509954', 2, '350.00', '80015608.00', 'income', 'PAY', '在线支付', '', ''),
(141, '20231031103022588217', 2, '150.00', '80015758.00', 'income', 'PAY', '在线支付', '', ''),
(142, '20231027171128525248', 2, '150.00', '80015908.00', 'income', 'PAY', '在线支付', '', ''),
(143, '20231027162954499662', 2, '150.00', '80016058.00', 'income', 'PAY', '在线支付', '', ''),
(144, '20231104101426749993', 81, '120.00', '79999230.00', 'outlay', 'PAY', '在线支付', '', ''),
(145, '20231104101410231452', 81, '120.00', '79999110.00', 'outlay', 'PAY', '在线支付', '', ''),
(146, '20231104101341116546', 81, '120.00', '79998990.00', 'outlay', 'PAY', '在线支付', '', ''),
(147, '20231104101426749993', 2, '120.00', '80016178.00', 'income', 'PAY', '在线支付', '', ''),
(148, '20231104101410231452', 2, '120.00', '80016298.00', 'income', 'PAY', '在线支付', '', ''),
(149, '20231104101341116546', 2, '120.00', '80016418.00', 'income', 'PAY', '在线支付', '', ''),
(150, '20231104102234629402', 81, '15.00', '79998975.00', 'outlay', 'PAY', '在线支付', '', ''),
(151, '20231104102234629402', 2, '15.00', '80016433.00', 'income', 'PAY', '在线支付', '', ''),
(152, '20231105151806284205', 81, '35.00', '79998940.00', 'outlay', 'PAY', '在线支付', '', ''),
(153, '20231105151806284205', 2, '35.00', '80016468.00', 'income', 'PAY', '在线支付', '', ''),
(154, '20231104100624156226', 87, '290.00', '79999710.00', 'outlay', 'PAY', '在线支付', '', ''),
(155, '20231101162518706661', 81, '350.00', '79998590.00', 'outlay', 'PAY', '在线支付', '', ''),
(156, '20231104101209414829', 81, '150.00', '79998440.00', 'outlay', 'PAY', '在线支付', '', ''),
(157, '20231104101251206287', 81, '160.00', '79998280.00', 'outlay', 'PAY', '在线支付', '', ''),
(158, '20231104101322922247', 81, '160.00', '79998120.00', 'outlay', 'PAY', '在线支付', '', ''),
(159, '20231104115409471663', 81, '450.00', '79997670.00', 'outlay', 'PAY', '在线支付', '', ''),
(160, '20231104115147965046', 81, '300.00', '79997370.00', 'outlay', 'PAY', '在线支付', '', ''),
(161, '20231028173141582591', 81, '120.00', '79997250.00', 'outlay', 'PAY', '在线支付', '', ''),
(162, '20231104100812567788', 81, '600.00', '79996650.00', 'outlay', 'PAY', '在线支付', '', ''),
(163, '20231103223412279313', 81, '600.00', '79996050.00', 'outlay', 'PAY', '在线支付', '', ''),
(164, '20231026110107546393', 84, '260.00', '79999740.00', 'outlay', 'PAY', '在线支付', '', ''),
(165, '20231028172614399210', 81, '120.00', '79995930.00', 'outlay', 'PAY', '在线支付', '', ''),
(166, '20231028172924748623', 85, '120.00', '79999880.00', 'outlay', 'PAY', '在线支付', '', ''),
(167, '20231104115409471663', 2, '450.00', '80016918.00', 'income', 'PAY', '在线支付', '', ''),
(168, '20231104115147965046', 2, '300.00', '80017218.00', 'income', 'PAY', '在线支付', '', ''),
(169, '20231104101322922247', 2, '160.00', '80017378.00', 'income', 'PAY', '在线支付', '', ''),
(170, '20231104101251206287', 2, '160.00', '80017538.00', 'income', 'PAY', '在线支付', '', ''),
(171, '20231104101209414829', 2, '150.00', '80017688.00', 'income', 'PAY', '在线支付', '', ''),
(172, '20231104100812567788', 2, '600.00', '80018288.00', 'income', 'PAY', '在线支付', '', ''),
(173, '20231104100624156226', 2, '290.00', '80018578.00', 'income', 'PAY', '在线支付', '', ''),
(174, '20231103223412279313', 2, '600.00', '80019178.00', 'income', 'PAY', '在线支付', '', ''),
(175, '20231101162518706661', 2, '350.00', '80019528.00', 'income', 'PAY', '在线支付', '', ''),
(176, '20231026110107546393', 2, '260.00', '80019788.00', 'income', 'PAY', '在线支付', '', ''),
(177, '20231028172614399210', 2, '120.00', '80019908.00', 'income', 'PAY', '在线支付', '', ''),
(178, '20231028172924748623', 2, '120.00', '80020028.00', 'income', 'PAY', '在线支付', '', ''),
(179, '20231028173141582591', 2, '120.00', '80020148.00', 'income', 'PAY', '在线支付', '', ''),
(180, '20231106115842613576', 81, '138.00', '79995792.00', 'outlay', 'PAY', '在线支付', '', ''),
(181, '20231106115842613576', 2, '138.00', '80020286.00', 'income', 'PAY', '在线支付', '', ''),
(182, '20231108165918836845', 81, '298.00', '79995494.00', 'outlay', 'PAY', '在线支付', '', ''),
(183, '20231107095325375531', 81, '260.00', '79995234.00', 'outlay', 'PAY', '在线支付', '', ''),
(184, '20231110094255422261', 81, '80.00', '79995154.00', 'outlay', 'PAY', '在线支付', '', ''),
(185, '20231111084436027296', 81, '60.00', '79995094.00', 'outlay', 'PAY', '在线支付', '', ''),
(186, '20231110162651113503', 90, '350.00', '79999650.00', 'outlay', 'PAY', '在线支付', '', ''),
(187, '20231108165918836845', 2, '100.00', '80020386.00', 'income', 'PAY', '在线支付', '', ''),
(188, '20231107095325375531', 2, '260.00', '80020646.00', 'income', 'PAY', '在线支付', '', ''),
(189, '20231110094255422261', 2, '80.00', '80020726.00', 'income', 'PAY', '在线支付', '', ''),
(190, '20231110162651113503', 2, '350.00', '80021076.00', 'income', 'PAY', '在线支付', '', ''),
(191, '20231111084436027296', 2, '60.00', '80021136.00', 'income', 'PAY', '在线支付', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `swd_deposit_refund`
--

CREATE TABLE `swd_deposit_refund` (
  `refund_id` int(11) UNSIGNED NOT NULL,
  `record_id` int(11) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(10,2) DEFAULT '0.00',
  `status` varchar(30) DEFAULT '',
  `remark` varchar(255) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_deposit_setting`
--

CREATE TABLE `swd_deposit_setting` (
  `setting_id` int(11) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `trade_rate` decimal(10,3) DEFAULT '0.000' COMMENT '交易手续费',
  `transfer_rate` decimal(10,3) DEFAULT '0.000' COMMENT '转账手续费',
  `regive_rate` decimal(10,3) DEFAULT '0.000' COMMENT '充值赠送金额比率',
  `guider_rate` decimal(10,3) DEFAULT '0.000' COMMENT '团长返佣比率'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_deposit_setting`
--

INSERT INTO `swd_deposit_setting` (`setting_id`, `userid`, `trade_rate`, `transfer_rate`, `regive_rate`, `guider_rate`) VALUES
(1, 0, '0.000', '0.000', '0.000', '0.000');

-- --------------------------------------------------------

--
-- 表的结构 `swd_deposit_trade`
--

CREATE TABLE `swd_deposit_trade` (
  `trade_id` int(11) UNSIGNED NOT NULL,
  `tradeNo` varchar(32) NOT NULL COMMENT '支付交易号',
  `outTradeNo` varchar(32) DEFAULT '' COMMENT '第三方支付接口的交易号',
  `payTradeNo` varchar(32) DEFAULT '' COMMENT '第三方支付接口的商户订单号',
  `bizOrderId` varchar(32) DEFAULT '' COMMENT '商户订单号',
  `bizIdentity` varchar(20) DEFAULT '' COMMENT '商户交易类型识别号',
  `buyer_id` int(11) NOT NULL COMMENT '交易买家',
  `seller_id` int(11) NOT NULL COMMENT '交易卖家',
  `amount` decimal(10,2) DEFAULT '0.00' COMMENT '交易金额',
  `status` varchar(30) DEFAULT '',
  `payment_code` varchar(20) DEFAULT NULL COMMENT '支付方式代号',
  `pay_alter` int(11) DEFAULT '0' COMMENT '支付方式变更标记',
  `tradeCat` varchar(20) DEFAULT NULL COMMENT '交易分类',
  `payType` varchar(20) DEFAULT NULL COMMENT '支付类型(担保即时)',
  `flow` varchar(10) DEFAULT 'outlay' COMMENT '资金流向',
  `fundchannel` varchar(20) DEFAULT '' COMMENT '资金渠道',
  `payTerminal` varchar(10) DEFAULT '' COMMENT '支付终端',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '交易标题',
  `buyer_remark` varchar(255) DEFAULT '' COMMENT '买家备注',
  `seller_remark` varchar(255) DEFAULT '' COMMENT '卖家备注',
  `add_time` int(11) DEFAULT NULL,
  `pay_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_deposit_trade`
--

INSERT INTO `swd_deposit_trade` (`trade_id`, `tradeNo`, `outTradeNo`, `payTradeNo`, `bizOrderId`, `bizIdentity`, `buyer_id`, `seller_id`, `amount`, `status`, `payment_code`, `pay_alter`, `tradeCat`, `payType`, `flow`, `fundchannel`, `payTerminal`, `title`, `buyer_remark`, `seller_remark`, `add_time`, `pay_time`, `end_time`) VALUES
(95, '20231006165214774752', '', '20231006165219042510', '16960511956194042', 'ORDER', 5, 2, '278.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【鲜花】花束', '', '', 1696582334, 1696582339, 1696814550),
(94, '20231006164346016617', '', '20231006165219042510', '16965818269577892', 'ORDER', 4, 2, '298.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】99朵系列', '', '', 1696581826, 1696582339, 1696814454),
(93, '20231003174316469835', '', '20231006165219042510', '16963261968097102', 'ORDER', 4, 2, '290.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】抱抱桶-卡布奇诺+小熊', '', '', 1696326196, 1696582339, 1696814448),
(91, '20231002112527542969', '', '20231006165219042510', '16962171272810932', 'ORDER', 5, 2, '298.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】花束-99多红玫', '', '', 1696217127, 1696582339, 1696814461),
(92, '20231003173734875541', '', '20231006165219042510', '16963258543550882', 'ORDER', 4, 2, '390.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】曼塔乌梅子酱-52朵', '', '', 1696325854, 1696582339, 1696814468),
(90, '20231002112055878543', '', '20231006165219042510', '16962168555494052', 'ORDER', 5, 2, '398.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【鲜花】红玫瑰-99朵', '', '', 1696216855, 1696582339, 1696814437),
(89, '20230930132215744409', '', '20231006165219042510', '16960513359149352', 'ORDER', 5, 2, '278.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【鲜花】花束', '', '', 1696051335, 1696582339, 1696814541),
(88, '20230928111356885509', '', '20231006165219042510', '16958708358271032', 'ORDER', 58, 2, '1680.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】香烟1916-鲜花', '', '', 1695870835, 1696582339, 1696814534),
(86, '20230926101839804477', '', '20230926114357079284', '16956947181368562', 'ORDER', 43, 2, '260.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花篮】橙色+向日葵款', '', '', 1695694719, 1695699837, 1695702366),
(87, '20230927092052225713', '', '20231006165144626088', '16957776525689972', 'ORDER', 42, 2, '260.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花篮】香槟色+向日葵款', '', '', 1695777652, 1696582304, 1696814429),
(85, '20230926092855816692', '', '20230926095403339090', '16956917350712052', 'ORDER', 42, 2, '460.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】发财树+步步高', '', '', 1695691735, 1695693243, 1695702658),
(84, '20230926092757041861', '', '20230926095418373094', '16956916765396582', 'ORDER', 42, 2, '460.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】发财树+步步高', '', '', 1695691677, 1695693258, 1695702663),
(83, '20230926091258471232', '', '20230926095450306143', '16956907787031702', 'ORDER', 41, 2, '220.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花篮】绿色系列-百合+香槟', '', '', 1695690778, 1695693290, 1695702668),
(80, '20230925171234047253', '', '20230925174406495263', '16956331543511092', 'ORDER', 7, 2, '350.00', 'SUCCESS', 'deposit', 0, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】抱抱桶-99朵粉雪杉', '', '', 1695633154, 1695635046, 1695702703),
(81, '20230925174822159116', '', '20230925174828028064', '16956353014866692', 'ORDER', 7, 2, '220.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】手捧花-99多红玫', '', '', 1695635302, 1695635308, 1695702691),
(82, '20230925180708806385', '', '20230925180716405445', '16956364281412802', 'ORDER', 7, 2, '268.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】抱抱桶-乌梅子酱-33朵曼塔', '', '', 1695636428, 1695636436, 1695702674),
(77, '20230925164945243221', '', '20231006164948684903', '16956317843984132', 'ORDER', 6, 2, '260.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【开业花篮】橙色+向日葵款', '', '', 1695631785, 1696582188, 1696814741),
(78, '20230925165327421059', '', '20231006164948684903', '16956320065524932', 'ORDER', 6, 2, '260.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【开业花篮】橙色+向日葵款', '', '', 1695632007, 1696582188, 1696814750),
(79, '20230925165546124250', '', '20231006164948684903', '16956321468719702', 'ORDER', 6, 2, '260.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【开业花篮】橙色+向日葵款', '', '', 1695632146, 1696582188, 1696814732),
(96, '20231007103847906453', '', '', '16966463272513772', 'ORDER', 82, 2, '300.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【开业花篮】高档系列8005', '', '', 1696646327, NULL, NULL),
(97, '20231007104622376741', '', '20231009092251956149', '16966467829542192', 'ORDER', 59, 2, '300.00', 'SUCCESS', 'cod', 1, 'SHOPPING', 'COD', 'outlay', '货到付款', '', '支付 - 【开业花篮】高档系列8005', '', '', 1696646782, NULL, 1696814594),
(98, '20231007143201901646', '', '20231008093138476668', '16966603217526672', 'ORDER', 4, 2, '780.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】曼塔玫瑰系列-199朵', '', '', 1696660321, 1696728698, 1696930173),
(99, '20231008092136418233', '', '20231008093056672792', '16967280968458682', 'ORDER', 4, 2, '300.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭等多件', '', '', 1696728096, 1696728656, 1696814651),
(100, '20231009091437619719', '', '', '16968140776915192', 'ORDER', 45, 2, '240.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【绿植】磐石松', '', '', 1696814077, NULL, NULL),
(101, '20231009091944729537', '', '20231009091955516711', '16966594545283322', 'ORDER', 4, 2, '150.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】向日葵混搭系列', '', '', 1696814384, 1696814395, 1696814677),
(102, '20231009101005818080', '', '20231009101048304756', '16968164502985572', 'ORDER', 4, 2, '100.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', '', '', 1696817405, 1696817448, 1696817464),
(103, '20231009151000443165', '', '20231010173029309109', '16968354009181032', 'ORDER', 4, 2, '1.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~百合~白玫瑰系列', '', '', 1696835400, 1696930229, 1696930241),
(104, '20231010115736927264', '', '20231010172838463409', '16969102558040482', 'ORDER', 61, 2, '220.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】抱抱桶~粉雪山玫瑰~52朵', '', '', 1696910256, 1696930118, 1696930195),
(105, '20231010172543288479', '', '20231010172610772693', '16969299434532242', 'ORDER', 4, 2, '150.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【鲜花】人民币~混搭~香槟黄玫瑰', '', '', 1696929943, 1696929970, 1696930190),
(106, '20231012163151077070', '', '20231013135146169279', '16970995116856292', 'ORDER', 4, 2, '150.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】小香风~卡布基诺混搭系列', '', '', 1697099511, 1697176306, 1697341239),
(107, '20231013134526321430', '', '20231024174420125881', '16971759259144472', 'ORDER', 4, 2, '350.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】红玫瑰~99朵等多件', '', '', 1697175926, 1698140660, 1698140748),
(108, '20231013140505371190', '', '20231013140521247270', '16971771044226702', 'ORDER', 62, 2, '298.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【花束】混搭~百合~白玫瑰系列', '', '', 1697177105, NULL, NULL),
(109, '20231013162603037466', '', '20231013162619684120', '16971855638826902', 'ORDER', 54, 2, '200.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【开业花篮】紫色+绣球款', '', '', 1697185563, 1697185579, 1697341218),
(110, '20231015113251867555', '', '', '16973407704386052', 'ORDER', 63, 2, '280.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【开业花篮】蓝色+1株绣球款', '', '', 1697340771, NULL, NULL),
(111, '20231015113724714498', '', '', '16973410434083232', 'ORDER', 64, 2, '260.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【开业花篮】橙色+向日葵款', '', '', 1697341044, NULL, NULL),
(112, '20231015113904052760', '', '', '16973411446360382', 'ORDER', 64, 2, '260.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【开业花篮】橙色+向日葵款', '', '', 1697341144, NULL, NULL),
(113, '20231015114200902962', '', '', '16973413199624032', 'ORDER', 65, 2, '260.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【开业花篮】橙色+向日葵款', '', '', 1697341320, NULL, NULL),
(114, '20231015164437109251', '', '20231015171210328388', '16973594777846932', 'ORDER', 66, 2, '260.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【开业花篮】橙色+向日葵款', '', '', 1697359477, 1697361130, 1697418515),
(115, '20231016085207412038', '', '', '16974175265436422', 'ORDER', 67, 2, '260.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【花篮】橙色~向日葵款', '', '', 1697417527, NULL, NULL),
(116, '20231016085404925348', '', '', '16974176432168572', 'ORDER', 68, 2, '260.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【花篮】橙色~向日葵款', '', '', 1697417644, NULL, NULL),
(117, '20231016095508239417', '', '20231016111223576427', '16974213088832952', 'ORDER', 4, 2, '150.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】小香风~卡布基诺混搭系列', '', '', 1697421308, 1697425943, 1697431180),
(118, '20231016101142588958', '', '20231016110603221566', '16974223021382872', 'ORDER', 69, 2, '226.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】小香风~卡布基诺混搭系列', '', '', 1697422302, 1697425563, 1697437734),
(119, '20231016110308224208', '', '20231017155041726300', '16974253874216802', 'ORDER', 70, 2, '220.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花篮】橙色~向日葵款', '', '', 1697425388, 1697529041, 1697529055),
(120, '20231017144604806912', '', '20231017144833177114', '16975251647677662', 'ORDER', 4, 2, '70.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】发财树~小盆栽', '', '', 1697525164, 1697525313, 1697527119),
(121, '20231017144628489036', '', '20231017144851308409', '16975251883827992', 'ORDER', 4, 2, '20.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】鸭掌木~小盆栽', '', '', 1697525188, 1697525331, 1697526995),
(122, '20231017144637318105', '', '20231017144901611268', '16975251975384082', 'ORDER', 4, 2, '10.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】铜钱草~小盆栽', '', '', 1697525197, 1697525341, 1697526957),
(123, '20231018132743556031', '', '', '16976068636577452', 'ORDER', 72, 2, '260.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【花篮】粉色~百合款', '', '', 1697606863, NULL, NULL),
(124, '20231018180049081605', '', '', '16976232487671932', 'ORDER', 73, 2, '220.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【花篮】红色款~20红玫~红豆款', '', '', 1697623249, NULL, NULL),
(125, '20231019103149011588', '', '20231019103237635574', '16976827098720702', 'ORDER', 4, 2, '450.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】抱抱桶~混搭~紫玫瑰~粉雪山~康乃馨~郁金香~99朵', '', '', 1697682709, 1697682757, 1697697615),
(126, '20231020094511869975', '', '20231020094519627347', '16977663103773442', 'ORDER', 74, 2, '160.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花篮】红色~大麦款', '', '', 1697766311, 1697766319, 1697778662),
(127, '20231020095316941393', '', '20231020095325679863', '16977667965635182', 'ORDER', 4, 2, '120.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】彩票系列~混搭~绣球~百合~桔梗', '', '', 1697766796, 1697766805, 1697778651),
(128, '20231020125019404743', '', '20231020131114269487', '16977774197670762', 'ORDER', 4, 2, '150.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花篮】红色~大麦款', '', '', 1697777419, 1697778674, 1697782047),
(129, '20231020161514382039', '', '20231020163149536100', '16977897130617282', 'ORDER', 4, 2, '158.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~橙芭比~香槟玫瑰~向日葵~橙色系', '', '', 1697789714, 1697790709, 1697790717),
(130, '20231021101436433750', '', '20231021163515133374', '16978544759566612', 'ORDER', 75, 2, '150.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', '', '', 1697854476, 1697877315, 1697877336),
(131, '20231021104707338250', '', '20231021163505983411', '16978564279311502', 'ORDER', 44, 2, '150.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', '', '', 1697856427, 1697877305, 1697877330),
(132, '20231023091637431290', '', '20231024114236146350', '16980237963396282', 'ORDER', 76, 2, '260.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】发财树~步步高', '', '', 1698023797, 1698118956, 1698119060),
(133, '20231023091800997140', '', '20231024113247475138', '16980238806324512', 'ORDER', 78, 2, '430.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】龙血树~多头~中号', '', '', 1698023880, 1698118367, 1698119056),
(134, '20231023173838446414', '', '20231024114228972068', '16980539173056092', 'ORDER', 77, 2, '130.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】蓝色系~混搭~绣球~百合~桔梗', '', '', 1698053918, 1698118948, 1698119051),
(135, '20231024093353249564', '', '20231024114221801855', '16981112338243632', 'ORDER', 76, 2, '260.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】鸭掌木~盆栽', '', '', 1698111233, 1698118941, 1698119047),
(136, '20231024093403517324', '', '20231024113231075636', '16981112436626192', 'ORDER', 78, 2, '490.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】橡皮树~', '', '', 1698111243, 1698118351, 1698119043),
(137, '20231024093411661644', '', '20231024114212851567', '16981112519244572', 'ORDER', 76, 2, '30.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】铜钱草~水培型', '', '', 1698111251, 1698118932, 1698119034),
(138, '20231024093420582113', '', '20231024114205344380', '16981112598528382', 'ORDER', 76, 2, '30.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】小绿植~茶桌摆件', '', '', 1698111260, 1698118925, 1698119039),
(139, '20231024093517251584', '', '20231024114157496773', '16981113175595062', 'ORDER', 76, 2, '60.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】待定', '', '', 1698111317, 1698118917, 1698119030),
(140, '20231024094944311105', '', '20231024114150444408', '16981121846831962', 'ORDER', 76, 2, '260.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】龙血树~款式A002', '', '', 1698112184, 1698118910, 1698119026),
(141, '20231024131131722133', '', '20231024131837239318', '16981242911746482', 'ORDER', 78, 2, '55.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】玫瑰花~小盆栽', '', '', 1698124291, 1698124717, 1698124727),
(142, '20231024144727032368', '', '20231024174921318459', '16981300473275772', 'ORDER', 80, 2, '498.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】滴水观音~盆栽', '', '', 1698130047, 1698140961, 1698145474),
(143, '20231024160933262181', '', '20231024174636648135', '16981349733547512', 'ORDER', 83, 2, '350.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】戴安娜玫瑰系列~199朵', '', '', 1698134973, 1698140796, 1698145470),
(144, '20231024174844089048', '', '20231024174929448105', '16981409246630212', 'ORDER', 78, 2, '60.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】待定', '', '', 1698140924, 1698140969, 1698145465),
(145, '20231024190139922686', '', '20231024190333478744', '16981452998599692', 'ORDER', 4, 2, '130.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~橙芭比~香槟玫瑰~向日葵~橙色系', '', '', 1698145299, 1698145413, 1698145461),
(146, '20231024190237826622', '', '20231024190325695255', '16981453577955912', 'ORDER', 4, 2, '130.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭', '', '', 1698145357, 1698145405, 1698145447),
(147, '20231024190246061519', '', '20231024190317392129', '16981453662198632', 'ORDER', 4, 2, '130.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~爱莎玫瑰', '', '', 1698145366, 1698145397, 1698145456),
(148, '20231026110107546393', '', '20231105152801979702', '16982892674389592', 'ORDER', 84, 2, '260.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】抱抱桶~粉雪山玫瑰~52朵~粉色系', '', '', 1698289267, 1699169281, 1699169412),
(149, '20231027162954499662', '', '20231027171715786303', '16983953940431282', 'ORDER', 81, 2, '150.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~紫色系', '', '', 1698395394, 1698398235, 1699064489),
(150, '20231027171128525248', '', '20231027172044067558', '16983978886279312', 'ORDER', 81, 2, '150.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~紫色系', '', '', 1698397888, 1698398444, 1699064481),
(151, '20231028172614399210', '', '20231105152812792475', '16984851747041162', 'ORDER', 81, 2, '120.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【鲜花】人民币~混搭~香槟黄玫瑰', '', '', 1698485174, 1699169292, 1699169418),
(152, '20231028172924748623', '', '20231105152823929872', '16984853643789952', 'ORDER', 85, 2, '120.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】蓝色系~混搭~绣球~百合~桔梗', '', '', 1698485365, 1699169303, 1699169424),
(153, '20231028173141582591', '', '20231105152734031698', '16984855009363032', 'ORDER', 81, 2, '120.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', '', '', 1698485501, 1699169254, 1699169431),
(154, '20231031103022588217', '', '20231031103630531679', '16987194216233432', 'ORDER', 86, 2, '150.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花篮】红色~大麦款', '', '', 1698719422, 1698719790, 1699064466),
(155, '20231031113149509954', '', '20231031113456569158', '16987231095368922', 'ORDER', 81, 2, '350.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】99朵系列', '', '', 1698723109, 1698723296, 1699064279),
(156, '20231101162518706661', '', '20231105152629118800', '16988271186729092', 'ORDER', 81, 2, '350.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】红玫瑰~99朵', '', '', 1698827118, 1699169189, 1699169388),
(157, '20231103223412279313', '', '20231105152748929618', '16990220527721502', 'ORDER', 81, 2, '600.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【鲜花】红玫瑰~299朵', '', '', 1699022052, 1699169268, 1699169383),
(158, '20231104100624156226', '', '20231105152558029236', '16990635830666832', 'ORDER', 87, 2, '290.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】冬青~小盆栽', '', '', 1699063584, 1699169158, 1699169377),
(159, '20231104100812567788', '', '20231105152741235607', '16990636923295182', 'ORDER', 81, 2, '600.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【鲜花】红玫瑰~299朵', '', '', 1699063692, 1699169261, 1699169373),
(160, '20231104101209414829', '', '20231105152642513881', '16990639295258192', 'ORDER', 81, 2, '150.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~向日葵~红色系', '', '', 1699063929, 1699169202, 1699169369),
(161, '20231104101251206287', '', '20231105152649603901', '16990639717972042', 'ORDER', 81, 2, '160.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', '', '', 1699063971, 1699169209, 1699169364),
(162, '20231104101322922247', '', '20231105152656746450', '16990640023348062', 'ORDER', 81, 2, '160.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~百合~爱莎玫瑰~粉色系', '', '', 1699064002, 1699169216, 1699169360),
(163, '20231104101341116546', '', '20231104102456363811', '16990640213775972', 'ORDER', 81, 2, '120.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】蓝色系~混搭~绣球~百合~桔梗', '', '', 1699064021, 1699064696, 1699064722),
(164, '20231104101410231452', '', '20231104102343618122', '16990640503121622', 'ORDER', 81, 2, '120.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~向日葵~香槟玫瑰', '', '', 1699064050, 1699064623, 1699064718),
(165, '20231104101426749993', '', '20231104102335231989', '16990640665584402', 'ORDER', 81, 2, '120.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~紫色系', '', '', 1699064066, 1699064615, 1699064713),
(166, '20231104102234629402', '', '20231104102535709037', '16990645544952652', 'ORDER', 81, 2, '15.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】多肉~小盆栽', '', '', 1699064554, 1699064735, 1699064744),
(167, '20231104115147965046', '', '20231105152722207321', '16990699075441132', 'ORDER', 81, 2, '300.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】红玫瑰~99朵', '', '', 1699069908, 1699169242, 1699169329),
(168, '20231104115409471663', '', '20231105152715047542', '16990700496993882', 'ORDER', 81, 2, '450.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】抱抱桶~混搭~紫玫瑰~粉雪山~康乃馨~郁金香~99朵', '', '', 1699070049, 1699169235, 1699169325),
(169, '20231105151806284205', '', '20231105152000806322', '16991686864028052', 'ORDER', 81, 2, '35.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~手打花', '', '', 1699168686, 1699168800, 1699168810),
(170, '20231106115842613576', '', '20231106115855701419', '16992431228568582', 'ORDER', 81, 2, '138.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】白玫瑰~百合~银叶~混搭~蓝色系', '', '', 1699243122, 1699243135, 1699243143),
(171, '20231107095325375531', '', '20231108170341029954', '16993220057315012', 'ORDER', 81, 2, '260.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【绿植】冬青~小盆栽', '', '', 1699322005, 1699434221, 1699674350),
(172, '20231108165918836845', '', '20231108170059226032', '16994339587112962', 'ORDER', 81, 2, '100.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】混搭~橙芭比~香槟玫瑰~向日葵~橙色系', '', '', 1699433958, 1699434059, 1699674345),
(173, '20231109090333295286', '', '', '16994918138723102', 'ORDER', 89, 2, '165.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', '', '', 1699491813, NULL, NULL),
(174, '20231109091111949098', '', '', '16994922715666602', 'ORDER', 89, 2, '165.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【花束】混搭-鲜花搭配', '', '', 1699492271, NULL, NULL),
(175, '20231109092348461962', '', '', '16994930281949172', 'ORDER', 81, 2, '150.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', '', '', 1699493028, NULL, NULL),
(176, '20231109093227422928', '', '', '16994935471394602', 'ORDER', 88, 2, '400.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【花束】抱抱桶~混搭~紫玫瑰~粉雪山~康乃馨~郁金香~99朵', '', '', 1699493547, NULL, NULL),
(177, '20231110094255422261', '', '20231110094432163877', '16995805757921732', 'ORDER', 81, 2, '80.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【鲜花】白玫瑰', '', '', 1699580575, 1699580672, 1699674356),
(178, '20231110162651113503', '', '20231111114516887892', '16996048115868232', 'ORDER', 90, 2, '350.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】红玫瑰~99朵系列', '', '', 1699604811, 1699674316, 1699674360),
(179, '20231111084436027296', '', '20231111114453026656', '16996634763033892', 'ORDER', 81, 2, '60.00', 'SUCCESS', 'deposit', 1, 'SHOPPING', 'SHIELD', 'outlay', '预存款', '', '支付 - 【花束】小香风~混搭~卡布基诺系列', '', '', 1699663476, 1699674293, 1699674365),
(180, '20231111174240358698', '', '20231111174315405729', '16996957605955502', 'ORDER', 91, 2, '40.00', 'SUBMITTED', 'cod', 1, 'SHOPPING', 'COD', 'outlay', '货到付款', '', '支付 - 【鲜花】小花束', '', '', 1699695760, NULL, NULL),
(181, '20231112114543686181', '', '', '16997607439730132', 'ORDER', 92, 2, '190.00', 'PENDING', NULL, 1, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 【鲜花】插瓶花~混搭', '', '', 1699760743, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `swd_deposit_withdraw`
--

CREATE TABLE `swd_deposit_withdraw` (
  `draw_id` int(11) UNSIGNED NOT NULL,
  `orderId` varchar(30) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `card_info` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_distribute`
--

CREATE TABLE `swd_distribute` (
  `id` int(11) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(10,2) DEFAULT '0.00',
  `layer1` decimal(10,2) DEFAULT '0.00',
  `layer2` decimal(10,2) DEFAULT '0.00',
  `layer3` decimal(10,2) DEFAULT '0.00',
  `goods` decimal(10,2) DEFAULT '0.00',
  `store` decimal(10,2) DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_distribute_items`
--

CREATE TABLE `swd_distribute_items` (
  `diid` int(11) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT '',
  `created` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_distribute_merchant`
--

CREATE TABLE `swd_distribute_merchant` (
  `dmid` int(11) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(60) DEFAULT '',
  `parent_id` int(11) DEFAULT '0',
  `phone_mob` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `logo` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_distribute_order`
--

CREATE TABLE `swd_distribute_order` (
  `doid` int(11) UNSIGNED NOT NULL,
  `rec_id` int(11) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tradeNo` varchar(32) NOT NULL,
  `order_sn` varchar(20) DEFAULT '',
  `money` decimal(10,2) DEFAULT '0.00',
  `layer` int(11) DEFAULT '1',
  `ratio` decimal(10,2) DEFAULT '0.00',
  `type` varchar(20) DEFAULT '',
  `created` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_distribute_setting`
--

CREATE TABLE `swd_distribute_setting` (
  `dsid` int(11) UNSIGNED NOT NULL,
  `type` varchar(20) DEFAULT '',
  `item_id` int(11) DEFAULT '0',
  `ratio1` decimal(10,2) DEFAULT '0.00',
  `ratio2` decimal(10,2) DEFAULT '0.00',
  `ratio3` decimal(10,2) DEFAULT '0.00',
  `enabled` int(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_flagstore`
--

CREATE TABLE `swd_flagstore` (
  `fid` int(255) UNSIGNED NOT NULL,
  `brand_id` int(10) DEFAULT '0',
  `keyword` varchar(20) DEFAULT '',
  `cate_id` int(11) DEFAULT '0',
  `store_id` int(10) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT '255'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_friend`
--

CREATE TABLE `swd_friend` (
  `id` int(11) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `friend_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `add_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_gcategory`
--

CREATE TABLE `swd_gcategory` (
  `cate_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED DEFAULT '0',
  `cate_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `groupid` int(11) DEFAULT '0',
  `sort_order` tinyint(3) UNSIGNED DEFAULT '255',
  `if_show` tinyint(3) UNSIGNED DEFAULT '1',
  `image` varchar(255) DEFAULT NULL,
  `ad` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_gcategory`
--

INSERT INTO `swd_gcategory` (`cate_id`, `store_id`, `cate_name`, `parent_id`, `groupid`, `sort_order`, `if_show`, `image`, `ad`) VALUES
(2, 0, '塑料、瓷盆系列', 0, 3, 5, 1, '', ''),
(21, 0, '绿植系列', 0, 0, 1, 1, '', ''),
(22, 0, '大型绿植', 21, 0, 255, 1, '', ''),
(1313, 0, '小型绿植', 21, 0, 255, 1, '', ''),
(62, 0, '花篮', 63, 0, 255, 1, '', ''),
(63, 0, '鲜花系列', 0, 2, 3, 1, '', ''),
(64, 0, '花束', 63, 0, 255, 1, '', ''),
(65, 0, '鲜花', 63, 0, 255, 1, '', ''),
(2578, 0, '中号瓷盆', 2, 0, 255, 1, NULL, NULL),
(1212, 0, '大号瓷盆', 2, 0, 255, 1, '', ''),
(2615, 0, '混搭系列', 64, 0, 254, 1, NULL, NULL),
(2614, 0, '11朵系列', 64, 0, 220, 1, NULL, NULL),
(2613, 0, '19朵系列', 64, 0, 225, 1, NULL, NULL),
(2612, 0, '520朵系列', 64, 0, 215, 1, NULL, NULL),
(1235, 0, '母亲节系列', 64, 0, 255, 1, '', ''),
(1282, 0, '52朵系列', 64, 0, 230, 1, '', ''),
(1283, 0, '99朵系列', 64, 0, 235, 1, '', ''),
(1236, 0, '玫瑰系列', 65, 0, 255, 1, '', ''),
(1288, 0, '小菊系列', 65, 0, 255, 1, '', ''),
(1289, 0, '百合系列', 65, 0, 255, 1, '', ''),
(1290, 0, '桔梗系列', 65, 0, 255, 1, '', ''),
(2603, 0, '组合型绿植', 21, 0, 255, 1, NULL, NULL),
(2604, 2, '组合型绿植', 2555, 0, 255, 1, NULL, NULL),
(2605, 2, '开花型绿植', 2555, 0, 255, 1, NULL, NULL),
(1284, 0, '香烟系列', 64, 0, 255, 1, '', ''),
(1285, 0, '人民币系列', 64, 0, 255, 1, '', ''),
(1286, 0, '新品', 64, 0, 255, 1, '', ''),
(1287, 0, '活动', 64, 0, 255, 1, '', ''),
(1291, 0, '扶郎系列', 65, 0, 255, 1, '', ''),
(1292, 0, '绣球系列', 65, 0, 255, 1, '', ''),
(1293, 0, '向日葵系列', 65, 0, 255, 1, '', ''),
(1294, 0, '蝴蝶兰系列', 65, 0, 255, 1, '', ''),
(1304, 0, '中型绿植', 21, 0, 255, 1, '', ''),
(2577, 2, '玫瑰系列', 2558, 0, 255, 1, NULL, NULL),
(2598, 0, '包装纸', 2597, 0, 255, 1, NULL, NULL),
(1353, 0, '开花型绿植', 21, 0, 255, 1, '', ''),
(1501, 0, '床品套件', 1513, 0, 255, 1, '', ''),
(1502, 0, '被子', 1513, 0, 255, 1, '', ''),
(1503, 0, '枕芯', 1513, 0, 255, 1, '', ''),
(1504, 0, '蚊帐', 1513, 0, 255, 1, '', ''),
(1505, 0, '凉席', 1513, 0, 255, 1, '', ''),
(1506, 0, '毛巾浴巾', 1513, 0, 255, 1, '', ''),
(1507, 0, '床单被罩', 1513, 0, 255, 1, '', ''),
(1508, 0, '床垫/床褥', 1513, 0, 255, 1, '', ''),
(1509, 0, '毯子', 1513, 0, 255, 1, '', ''),
(1510, 0, '抱枕靠垫', 1513, 0, 255, 1, '', ''),
(1511, 0, '窗帘/窗纱', 1513, 0, 255, 1, '', ''),
(1512, 0, '电热毯', 1513, 0, 255, 1, '', ''),
(1513, 0, '布艺软饰', 1513, 0, 255, 1, '', ''),
(2602, 0, '卡片', 2597, 0, 255, 1, NULL, NULL),
(2601, 0, '礼盒', 2597, 0, 255, 1, NULL, NULL),
(2600, 0, '剪刀', 2597, 0, 255, 1, NULL, NULL),
(2599, 0, '胶带', 2597, 0, 255, 1, NULL, NULL),
(2595, 0, '小香风', 64, 0, 255, 1, NULL, NULL),
(2593, 0, '礼盒系列', 64, 0, 250, 1, NULL, NULL),
(2592, 0, '其他', 65, 0, 255, 1, NULL, NULL),
(2594, 0, '抱抱桶系列', 64, 0, 245, 1, NULL, NULL),
(2591, 0, '其他', 63, 0, 255, 1, NULL, NULL),
(2590, 0, '小花束', 64, 0, 245, 1, NULL, NULL),
(2589, 0, '配花', 65, 0, 255, 1, NULL, NULL),
(2588, 0, '康乃馨系列', 65, 0, 255, 1, NULL, NULL),
(2609, 0, '33朵系列', 64, 0, 240, 1, NULL, NULL),
(2597, 0, '资材', 0, 0, 255, 1, NULL, NULL),
(2587, 0, '配花', 63, 0, 255, 1, NULL, NULL),
(2586, 0, '香槟系', 62, 0, 255, 1, NULL, NULL),
(2585, 0, '绿色系', 62, 0, 255, 1, NULL, NULL),
(2584, 0, '紫色系', 62, 0, 255, 1, NULL, NULL),
(2583, 0, '粉色系', 62, 0, 255, 1, NULL, NULL),
(2582, 0, '红色系', 62, 0, 255, 1, NULL, NULL),
(1631, 0, '内裤', 1631, 0, 255, 1, '', ''),
(2581, 0, '蓝色系', 62, 0, 255, 1, NULL, NULL),
(2580, 0, '橙色系', 62, 0, 255, 1, NULL, NULL),
(1634, 0, '塑身美体', 1631, 0, 255, 1, '', ''),
(1635, 0, '文胸套装', 1631, 0, 255, 1, '', ''),
(1636, 0, '情侣睡衣', 1631, 0, 255, 1, '', ''),
(1637, 0, '吊带/背心', 1631, 0, 255, 1, '', ''),
(1638, 0, '少女文胸', 1631, 0, 255, 1, '', ''),
(2654, 2, '插瓶花', 0, 0, 255, 1, NULL, NULL),
(2653, 0, '插瓶花', 63, 0, 255, 1, NULL, NULL),
(2652, 0, '橙色系', 2615, 0, 255, 1, NULL, NULL),
(2651, 0, '红色系', 2615, 0, 255, 1, NULL, NULL),
(2650, 0, '香槟系', 2615, 0, 255, 1, NULL, NULL),
(2649, 0, '蓝色系', 2615, 0, 255, 1, NULL, NULL),
(2648, 0, '黑色系', 2615, 0, 255, 1, NULL, NULL),
(2647, 0, '紫色系', 2615, 0, 255, 1, NULL, NULL),
(2646, 0, '粉色系', 2615, 0, 255, 1, NULL, NULL),
(2645, 0, '手打花', 64, 0, 255, 1, NULL, NULL),
(2644, 2, '229朵系列', 2572, 0, 255, 1, NULL, NULL),
(2643, 0, '299朵系列', 64, 0, 255, 1, NULL, NULL),
(2642, 2, '桌花', 2618, 0, 255, 1, NULL, NULL),
(2641, 2, '高档系列', 2618, 0, 255, 1, NULL, NULL),
(2640, 0, '零食系列', 64, 0, 255, 1, NULL, NULL),
(2639, 0, '彩票系列', 64, 0, 255, 1, NULL, NULL),
(2638, 2, '水果零食系列', 2572, 0, 255, 1, NULL, NULL),
(2637, 2, '彩票系列', 2572, 0, 255, 1, NULL, NULL),
(2636, 2, '香烟系列', 2572, 0, 255, 1, NULL, NULL),
(2635, 2, '小花束', 2572, 0, 255, 1, NULL, NULL),
(2634, 2, '抱抱桶系列', 2572, 0, 255, 1, NULL, NULL),
(2633, 2, '520朵系列', 2572, 0, 255, 1, NULL, NULL),
(2632, 2, '11朵系列', 2572, 0, 255, 1, NULL, NULL),
(2631, 2, '13朵系列', 2572, 0, 255, 1, NULL, NULL),
(2630, 2, '33朵系列', 2572, 0, 255, 1, NULL, NULL),
(2629, 2, '52朵系列', 2572, 0, 255, 1, NULL, NULL),
(2628, 2, '99朵系列', 2572, 0, 255, 1, NULL, NULL),
(2627, 2, '199朵系列', 2572, 0, 255, 1, NULL, NULL),
(2626, 2, '人民币系列', 2572, 0, 255, 1, NULL, NULL),
(2625, 2, '香槟系', 2618, 0, 255, 1, NULL, NULL),
(2624, 2, '绿色系', 2618, 0, 255, 1, NULL, NULL),
(2623, 2, '紫色系', 2618, 0, 255, 1, NULL, NULL),
(2622, 2, '橙色系', 2618, 0, 255, 1, NULL, NULL),
(2621, 2, '蓝色系', 2618, 0, 255, 1, NULL, NULL),
(2620, 2, '粉色系', 2618, 0, 255, 1, NULL, NULL),
(2619, 2, '红色系', 2618, 0, 255, 1, NULL, NULL),
(2618, 2, '花篮', 0, 0, 255, 1, NULL, NULL),
(2616, 0, '999多系列', 64, 0, 210, 1, NULL, NULL),
(2617, 0, '199朵系列', 64, 0, 255, 1, NULL, NULL),
(2606, 0, '场地花', 63, 0, 255, 1, NULL, NULL),
(2607, 0, '讲台花', 2606, 0, 255, 1, NULL, NULL),
(2608, 0, '桌花', 2606, 0, 255, 1, NULL, NULL),
(2610, 0, '高档系列', 62, 0, 255, 1, NULL, NULL),
(2611, 0, '郁金香系列', 65, 0, 255, 1, NULL, NULL),
(2579, 0, '小号瓷盆', 2, 0, 255, 1, NULL, NULL),
(2555, 2, '绿植', 0, 0, 255, 1, '', ''),
(2556, 2, '大型绿植', 2555, 0, 255, 1, '', ''),
(2557, 2, '中型绿植', 2555, 0, 255, 1, '', ''),
(2558, 2, '鲜花', 0, 0, 255, 1, '', ''),
(2559, 2, '花篮', 2558, 0, 255, 1, '', ''),
(2560, 2, '花束', 2558, 0, 255, 1, '', ''),
(2571, 2, '小型绿植', 2555, 0, 255, 1, NULL, NULL),
(2572, 2, '花束', 0, 0, 255, 1, NULL, NULL),
(2573, 2, '混搭', 2572, 0, 255, 1, NULL, NULL),
(2574, 2, '小香风', 2572, 0, 255, 1, NULL, NULL),
(2575, 2, '礼盒系列', 2572, 0, 255, 1, NULL, NULL),
(2576, 2, '配花', 2558, 0, 255, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `swd_goods`
--

CREATE TABLE `swd_goods` (
  `goods_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(10) DEFAULT 'material',
  `goods_name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `content` text,
  `cate_id` int(10) UNSIGNED DEFAULT '0',
  `cate_name` varchar(255) DEFAULT '',
  `brand` varchar(100) DEFAULT '',
  `spec_qty` tinyint(4) UNSIGNED DEFAULT '0',
  `spec_name_1` varchar(60) DEFAULT '',
  `spec_name_2` varchar(60) DEFAULT '',
  `if_show` tinyint(3) UNSIGNED DEFAULT '1',
  `closed` tinyint(3) UNSIGNED DEFAULT '0',
  `close_reason` varchar(255) DEFAULT NULL,
  `add_time` int(10) UNSIGNED DEFAULT NULL,
  `last_update` int(10) UNSIGNED DEFAULT NULL,
  `default_spec` int(11) UNSIGNED DEFAULT '0',
  `default_image` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `recommended` tinyint(4) UNSIGNED DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00',
  `mkprice` decimal(10,2) DEFAULT '0.00',
  `tags` varchar(102) DEFAULT '',
  `dt_id` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_goods`
--

INSERT INTO `swd_goods` (`goods_id`, `store_id`, `type`, `goods_name`, `description`, `content`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `video`, `recommended`, `price`, `mkprice`, `tags`, `dt_id`) VALUES
(83, 2, 'material', '【绿植】幸福树', '', NULL, 22, '绿植系列	大型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695940, 1694831710, 126, 'data/files/store_2/goods/20230822171855630.png.thumb.png', NULL, 1, '600.00', '0.00', '', 1),
(84, 2, 'material', '【绿植】金钱树', '', NULL, 1304, '绿植系列	中型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1692697875, 1694745953, 127, 'data/files/store_2/goods/20230822175110176.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(85, 2, 'material', '【鲜花】白玫瑰', '', NULL, 1236, '鲜花、花材	鲜花	白玫瑰', '博艺花卉', 0, '', '', 1, 0, NULL, 1693925526, 1693925526, 128, 'data/files/store_2/goods/20230905225155151.jpg.thumb.jpg', NULL, 1, '5.00', '0.00', '', 1),
(42, 2, 'material', '【花篮】蓝色~绣球~大飞燕款', '', NULL, 2585, '鲜花、花材	花篮	绿色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692425512, 1692520514, 85, 'data/files/store_2/goods/20230820163512392.jpg.thumb.jpg', NULL, 1, '300.00', '0.00', '', 1),
(43, 2, 'material', '【花篮】绿色~绣球款', '', NULL, 2585, '鲜花、花材	花篮	绿色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692504027, 1692520497, 86, 'data/files/store_2/goods/20230820163452303.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(44, 2, 'material', '【花篮】橙色~向日葵款', '', NULL, 2580, '鲜花、花材	花篮	橙色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692504118, 1692520467, 87, 'data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(45, 2, 'material', '【花篮】橙色~向日葵~气球款', '', NULL, 2581, '鲜花、花材	花篮	蓝色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692504201, 1692520438, 88, 'data/files/store_2/goods/20230820163355480.png.thumb.png', NULL, 1, '288.00', '0.00', '', 1),
(47, 2, 'material', '【花篮】橙色~气球款', '', NULL, 2580, '鲜花、花材	花篮	橙色系', '博艺花卉', 0, '', '', 1, 0, '', 1692505201, 1692520401, 90, 'data/files/store_2/goods/20230820163315888.jpg.thumb.jpg', NULL, 1, '230.00', '0.00', '', 1),
(48, 2, 'material', '【花篮】红色~红扶郎~百合款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692505248, 1692521114, 91, 'data/files/store_2/goods/20230820163253695.jpg.thumb.jpg', NULL, 1, '230.00', '0.00', '', 1),
(49, 2, 'material', '【花篮】红色~大麦款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692505327, 1692520354, 92, 'data/files/store_2/goods/20230820163231543.jpg.thumb.jpg', NULL, 1, '150.00', '0.00', '', 1),
(50, 2, 'material', '【花篮】红色~大麦~满天星款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692505381, 1692520333, 93, 'data/files/store_2/goods/20230820163210408.jpg.thumb.jpg', NULL, 1, '180.00', '0.00', '', 1),
(51, 2, 'material', '【花篮】红色款~20红玫~红豆款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692505519, 1692521072, 94, 'data/files/store_2/goods/20230820163134314.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(52, 2, 'material', '【花篮】红色~扇子款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692507238, 1692520222, 95, 'data/files/store_2/goods/20230820163017580.jpg.thumb.jpg', NULL, 1, '300.00', '0.00', '', 1),
(6, 2, 'material', '【花篮】蓝色~绣球~蝴蝶兰款', '', NULL, 2610, '鲜花系列	花篮	高档系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1542761845, 1695697913, 6, 'data/files/store_2/goods/20230820163738317.jpg.thumb.jpg', NULL, 1, '688.00', '0.00', '', 1),
(46, 2, 'material', '【花篮】橙色~百合款', '', NULL, 2580, '鲜花、花材	花篮	橙色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692504478, 1692520420, 89, 'data/files/store_2/goods/20230820163335872.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(7, 2, 'material', '【花篮】蓝色~3株绣球款', '', NULL, 2581, '鲜花、花材	花篮	蓝色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1542761989, 1692520644, 7, 'data/files/store_2/goods/20230820163720658.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(82, 2, 'material', '【绿植】富贵竹', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695827, 1692695827, 125, 'data/files/store_2/goods/20230822171701600.jpg.thumb.jpg', NULL, 1, '480.00', '0.00', '', 1),
(8, 2, 'material', '【花篮】蓝色~2株绣球款', '', NULL, 2583, '鲜花、花材	花篮	粉色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1542762532, 1692520625, 8, 'data/files/store_2/goods/20230820163702147.png.thumb.png', NULL, 1, '360.00', '0.00', '', 1),
(81, 2, 'material', '【绿植】红掌', '', NULL, 1353, '绿植系列	开花型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695757, 1694746148, 124, 'data/files/store_2/goods/20230822171554165.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(79, 2, 'material', '【绿植】百合竹', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695655, 1692697910, 122, 'data/files/store_2/goods/20230822171409819.jpg.thumb.jpg', NULL, 1, '580.00', '0.00', '', 1),
(80, 2, 'material', '【绿植】竹', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695692, 1692695692, 123, 'data/files/store_2/goods/20230822171447383.jpg.thumb.jpg', NULL, 1, '480.00', '0.00', '', 1),
(10, 2, 'material', '【花篮】蓝色~1株绣球款', '', NULL, 2581, '鲜花、花材	花篮	蓝色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1542778238, 1693924415, 10, 'data/files/store_2/goods/20230820163605738.jpg.thumb.jpg', NULL, 1, '320.00', '0.00', '', 1),
(78, 2, 'material', '【绿植】太空铁', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695570, 1692695570, 121, 'data/files/store_2/goods/20230822171243862.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(76, 2, 'material', '【绿植】龙血树~多头~中号', '', NULL, 22, '绿植系列	大型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695332, 1698023873, 119, 'data/files/store_2/goods/20230822170842971.jpg.thumb.jpg', NULL, 1, '680.00', '0.00', '', 1),
(77, 2, 'material', '【绿植】摇钱树', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695490, 1692695490, 120, 'data/files/store_2/goods/20230822171124479.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(73, 2, 'material', '【绿植】千年木', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692693886, 1692697973, 116, 'data/files/store_2/goods/20230822175242642.jpg.thumb.jpg', NULL, 1, '680.00', '0.00', '', 1),
(74, 2, 'material', '【绿植】虎皮兰', '', NULL, 1304, '绿植系列	中型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1692694070, 1694745978, 117, 'data/files/store_2/goods/20230822164739160.jpg.thumb.jpg', NULL, 1, '300.00', '0.00', '', 1),
(75, 2, 'material', '【绿植】龙血树~多头~大号', '', NULL, 22, '绿植系列	大型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695153, 1697699193, 118, 'data/files/store_2/goods/20230822170435898.jpg.thumb.jpg', NULL, 1, '880.00', '0.00', '', 1),
(72, 2, 'material', '【绿植】绿宝', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692693770, 1692693770, 115, 'data/files/store_2/goods/20230822164241342.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(71, 2, 'material', '【绿植】鸭掌木', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692693635, 1692693635, 114, 'data/files/store_2/goods/20230822164029261.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(70, 2, 'material', '【绿植】绿萝柱', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692693496, 1692693496, 113, 'data/files/store_2/goods/20230822163809876.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(69, 2, 'material', '【绿植】天堂鸟~6株', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692693147, 1692693147, 112, 'data/files/store_2/goods/20230822163222218.jpg.thumb.jpg', NULL, 1, '420.00', '0.00', '', 1),
(53, 2, 'material', '【花篮】红色~红扶郎~玫瑰款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692507488, 1692520206, 96, 'data/files/store_2/goods/20230820163000298.jpg.thumb.jpg', NULL, 1, '230.00', '0.00', '', 1),
(54, 2, 'material', '【花篮】红色~扶郎混搭款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692512735, 1692520017, 97, 'data/files/store_2/goods/20230820162651830.png.thumb.png', NULL, 1, '200.00', '0.00', '', 1),
(55, 2, 'material', '【花篮】粉色~百合款', '', NULL, 2583, '鲜花、花材	花篮	粉色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519277, 1692520176, 98, 'data/files/store_2/goods/20230820162934601.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(56, 2, 'material', '【花篮】粉色~百合~气球款', '', NULL, 2583, '鲜花、花材	花篮	粉色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519395, 1692520161, 99, 'data/files/store_2/goods/20230820162918116.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(57, 2, 'material', '【花篮】粉色~向日葵款', '', NULL, 2583, '鲜花、花材	花篮	粉色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519446, 1692520148, 100, 'data/files/store_2/goods/20230820162905371.png.thumb.png', NULL, 1, '280.00', '0.00', '', 1),
(58, 2, 'material', '【花篮】粉色~绣球款', '', NULL, 2583, '鲜花系列	花篮	粉色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519480, 1697699002, 101, 'data/files/store_2/goods/20230820162850882.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(59, 2, 'material', '【花篮】粉色~扶郎款', '', NULL, 2583, '鲜花、花材	花篮	粉色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519529, 1692520116, 102, 'data/files/store_2/goods/20230820162833704.jpg.thumb.jpg', NULL, 1, '180.00', '0.00', '', 1),
(60, 2, 'material', '【花篮】香槟色~满天星款', '', NULL, 2586, '鲜花、花材	花篮	香槟系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519717, 1692520091, 103, 'data/files/store_2/goods/20230820162807226.jpg.thumb.jpg', NULL, 1, '200.00', '0.00', '', 1),
(61, 2, 'material', '【花篮】香槟色~向日葵款', '', NULL, 2586, '鲜花、花材	花篮	香槟系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519757, 1692520079, 104, 'data/files/store_2/goods/20230820162756624.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(62, 2, 'material', '【花篮】紫色~百合款', '', NULL, 2584, '鲜花、花材	花篮	紫色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519850, 1692520062, 105, 'data/files/store_2/goods/20230820162739715.png.thumb.png', NULL, 1, '280.00', '0.00', '', 1),
(63, 2, 'material', '【花篮】紫色~绣球款', '', NULL, 2584, '鲜花、花材	花篮	紫色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519886, 1692520049, 106, 'data/files/store_2/goods/20230820162720730.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(64, 2, 'material', '【花篮】红色~红扶郎款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692687316, 1692687316, 107, 'data/files/store_2/goods/20230822145507332.jpg.thumb.jpg', NULL, 1, '160.00', '0.00', '', 1),
(65, 2, 'material', '【花篮】红色~金扶郎款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692687416, 1692687416, 108, NULL, NULL, 1, '160.00', '0.00', '', 1),
(66, 2, 'material', '【绿植】发财树~单株', '', NULL, 22, '绿植系列	大型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1692692876, 1695692709, 109, 'data/files/store_2/goods/20230822162749566.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(67, 2, 'material', '【绿植】发财树~步步高', '', NULL, 22, '绿植系列	大型绿植', '博艺花卉', 2, '规格', '盆', 1, 0, NULL, 1692692930, 1698111832, 379, 'data/files/store_2/goods/20231024094011545.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(68, 2, 'material', '【绿植】天堂鸟~8株', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692693107, 1692693228, 111, 'data/files/store_2/goods/20230822163344199.jpg.thumb.jpg', NULL, 1, '480.00', '0.00', '', 1),
(86, 2, 'material', '【鲜花】红玫瑰', '', NULL, 1236, '鲜花、花材	鲜花	白玫瑰', '博艺花卉', 0, '', '', 1, 0, NULL, 1693925575, 1693925575, 129, 'data/files/store_2/goods/20230905225241659.jpg.thumb.jpg', NULL, 1, '5.00', '0.00', '', 1),
(87, 2, 'material', '【鲜花】香槟', '', NULL, 1236, '鲜花、花材	鲜花	玫瑰系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693925614, 1693925685, 130, 'data/files/store_2/goods/20230905225443648.jpg.thumb.jpg', NULL, 1, '5.00', '0.00', '', 1),
(88, 2, 'material', '【鲜花】黄玫瑰', '', NULL, 1236, '鲜花、花材	鲜花	白玫瑰', '博艺花卉', 0, '', '', 1, 0, NULL, 1693925661, 1693925661, 131, 'data/files/store_2/goods/20230905225415848.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(89, 2, 'material', '【鲜花】卡布奇诺', '', NULL, 1236, '鲜花、花材	鲜花	白玫瑰', '博艺花卉', 0, '', '', 1, 0, NULL, 1693925825, 1693925825, 132, 'data/files/store_2/goods/20230905225659608.jpg.thumb.jpg', NULL, 1, '5.00', '0.00', '', 1),
(90, 2, 'material', '【鲜花】紫玫瑰', '', NULL, 1236, '鲜花、花材	鲜花	白玫瑰', '博艺花卉', 0, '', '', 1, 0, NULL, 1693925869, 1693925869, 133, 'data/files/store_2/goods/20230905225742483.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(91, 2, 'material', '【鲜花】猪小姐', '', NULL, 1236, '鲜花、花材	鲜花	白玫瑰', '博艺花卉', 0, '', '', 1, 0, NULL, 1693925939, 1693925939, 134, 'data/files/store_2/goods/20230905225852790.jpg.thumb.jpg', NULL, 1, '5.00', '0.00', '', 1),
(92, 2, 'material', '【鲜花】粉雪山', '', NULL, 1236, '鲜花、花材	鲜花	白玫瑰', '博艺花卉', 0, '', '', 1, 0, NULL, 1693925986, 1693925986, 135, 'data/files/store_2/goods/20230905225940225.jpg.thumb.jpg', NULL, 1, '5.00', '0.00', '', 1),
(93, 2, 'material', '【鲜花】粉荔枝', '', NULL, 1236, '鲜花、花材	鲜花	白玫瑰', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926050, 1693926050, 136, 'data/files/store_2/goods/20230905230044822.jpg.thumb.jpg', NULL, 1, '5.00', '0.00', '', 1),
(94, 2, 'material', '【鲜花】卡布奇诺2', '', NULL, 1236, '鲜花、花材	鲜花	玫瑰系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926108, 1693926115, 137, 'data/files/store_2/goods/20230905230145245.jpg.thumb.jpg', NULL, 1, '5.00', '0.00', '', 1),
(95, 2, 'material', '【鲜花】粉紫~海洋之心', '', NULL, 1236, '鲜花系列	鲜花	玫瑰系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926157, 1696901150, 138, 'data/files/store_2/goods/20230905230231893.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(96, 2, 'material', '【配材】红豆', '', NULL, 2589, '鲜花、花材	鲜花	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926228, 1694655058, 139, 'data/files/store_2/goods/20230905230342868.jpg.thumb.jpg', NULL, 1, '20.00', '0.00', '', 1),
(97, 2, 'material', '【配材】尤加利', '', NULL, 2589, '鲜花、花材	鲜花	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926278, 1694658138, 140, 'data/files/store_2/goods/20230905230421786.jpg.thumb.jpg', NULL, 1, '20.00', '0.00', '', 1),
(98, 2, 'material', '【配材】银叶', '', NULL, 2589, '鲜花、花材	鲜花	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926335, 1694658116, 141, 'data/files/store_2/goods/20230905230528613.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(99, 2, 'material', '【鲜花】橙色多头玫', '', NULL, 1236, '鲜花、花材	鲜花	白玫瑰', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926518, 1693926518, 142, 'data/files/store_2/goods/20230905230818991.jpg.thumb.jpg', NULL, 1, '59.00', '0.00', '', 1),
(100, 2, 'material', '【鲜花】白色多头玫', '', NULL, 1236, '鲜花、花材	鲜花	白玫瑰', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926561, 1693926561, 143, 'data/files/store_2/goods/20230905230914272.jpg.thumb.jpg', NULL, 1, '58.00', '0.00', '', 1),
(101, 2, 'material', '【鲜花】红色扶郎', '', NULL, 1291, '鲜花、花材	鲜花	扶郎系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926668, 1693926668, 144, 'data/files/store_2/goods/20230905231102967.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(102, 2, 'material', '【鲜花】蓝色绣球', '', NULL, 1292, '鲜花、花材	鲜花	绣球系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926706, 1693926706, 145, 'data/files/store_2/goods/20230905231140907.jpg.thumb.jpg', NULL, 1, '30.00', '0.00', '', 1),
(103, 2, 'material', '【鲜花】小号向日葵', '', NULL, 1293, '鲜花、花材	鲜花	向日葵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926750, 1693926750, 146, 'data/files/store_2/goods/20230905231225186.jpg.thumb.jpg', NULL, 1, '20.00', '0.00', '', 1),
(104, 2, 'material', '【鲜花】大号向日葵', '', NULL, 1293, '鲜花、花材	鲜花	向日葵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926784, 1693926784, 147, 'data/files/store_2/goods/20230905231258376.jpg.thumb.jpg', NULL, 1, '30.00', '0.00', '', 1),
(105, 2, 'material', '【鲜花】金色扶郎', '', NULL, 1291, '鲜花、花材	鲜花	扶郎系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926829, 1693926829, 148, 'data/files/store_2/goods/20230905231342932.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(106, 2, 'material', '【鲜花】荷花', '', NULL, 2587, '鲜花系列	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926929, 1693979397, 149, 'data/files/store_2/goods/20230905231523287.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(107, 2, 'material', '【鲜花】莲蓬', '', NULL, 2587, '鲜花系列	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1693926960, 1693979372, 150, 'data/files/store_2/goods/20230905231555579.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(108, 2, 'material', '【鲜花】待定', '', NULL, 2589, '鲜花、花材	鲜花	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1693927019, 1693979343, 151, 'data/files/store_2/goods/20230905231652463.jpg.thumb.jpg', NULL, 1, '38.00', '0.00', '', 1),
(109, 2, 'material', '【鲜花】粉色小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693927057, 1693927057, 152, 'data/files/store_2/goods/20230905231732325.jpg.thumb.jpg', NULL, 1, '65.00', '0.00', '', 1),
(110, 2, 'material', '【鲜花】洋甘菊', '', NULL, 1288, '鲜花系列	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693927093, 1696901084, 153, 'data/files/store_2/goods/20230905231807933.jpg.thumb.jpg', NULL, 1, '65.00', '0.00', '', 1),
(111, 2, 'material', '【花束】混搭~百合~爱莎玫瑰~粉色系', '', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693977852, 1696738732, 154, 'data/files/store_2/goods/20230906132404473.jpg.thumb.jpg', NULL, 1, '268.00', '0.00', '', 1),
(112, 2, 'material', '【花束】小香风~混搭~紫色系', '', NULL, 2595, '鲜花系列	花束	小旋风', '博艺花卉', 0, '', '', 1, 0, NULL, 1693977907, 1696738632, 155, 'data/files/store_2/goods/20230906132501628.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(113, 2, 'material', '【花束】混搭~红玫瑰~卡布奇洛玫瑰~黑色系', '', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693977937, 1696738593, 156, 'data/files/store_2/goods/20230906132531188.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(114, 2, 'material', '【花束】混搭~向日葵~香槟玫瑰', '', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693977972, 1696738537, 157, 'data/files/store_2/goods/20230906132606251.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(115, 2, 'material', '【花束】混搭~向日葵~红色系', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231105155042184.jpg\" alt=\"1-1.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20231105155042242.jpg\" alt=\"1-2.jpg\" />', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693978010, 1699170659, 158, 'data/files/store_2/goods/20231105155032799.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(116, 2, 'material', '【花束】小香风~混搭系列', '', NULL, 2595, '鲜花系列	花束	小旋风', '博艺花卉', 0, '', '', 1, 0, NULL, 1693978041, 1696738464, 159, 'data/files/store_2/goods/20230906132714191.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(117, 2, 'material', '【花束】混搭', '', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693978094, 1696229585, 160, 'data/files/store_2/goods/20230906132809114.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(118, 2, 'material', '【花束】礼盒~竹篮子~系列', '', NULL, 2593, '鲜花系列	花束	礼盒系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693978141, 1696738444, 161, 'data/files/store_2/goods/20230906132843770.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(119, 2, 'material', '【花束】小旋风~混搭~粉色系', '', NULL, 2595, '鲜花系列	花束	小旋风', '博艺花卉', 0, '', '', 1, 0, NULL, 1693978189, 1696738391, 162, 'data/files/store_2/goods/20230906132943470.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(120, 2, 'material', '【花束】混搭', '', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693978219, 1696229574, 163, 'data/files/store_2/goods/20230906133013290.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(121, 2, 'material', '【花束】混搭', '', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693978262, 1696229565, 164, 'data/files/store_2/goods/20230906133056204.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(122, 2, 'material', '【花束】抱抱桶~混搭~系列', '', NULL, 2594, '鲜花系列	花束	抱抱桶系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693978290, 1696738351, 165, 'data/files/store_2/goods/20230906133123797.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(123, 2, 'material', '【花束】混搭~蓝色系', '', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1693978455, 1696738318, 166, 'data/files/store_2/goods/20230906133408536.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(124, 2, 'material', '【鲜花】蝴蝶兰', '', NULL, 1353, '绿植系列	开花型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979010, 1693979010, 167, 'data/files/store_2/goods/20230906134322284.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(125, 2, 'material', '【鲜花】蝴蝶兰', '', NULL, 1353, '绿植系列	开花型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979054, 1693979054, 168, 'data/files/store_2/goods/20230906134407471.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(126, 2, 'material', '【鲜花】蝴蝶兰', '', NULL, 1353, '绿植系列	开花型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979091, 1693979091, 169, 'data/files/store_2/goods/20230906134444198.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(127, 2, 'material', '【鲜花】蝴蝶兰', '', NULL, 1353, '绿植系列	开花型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979140, 1693979140, 170, 'data/files/store_2/goods/20230906134533521.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(128, 2, 'material', '【鲜花】蝴蝶兰', '', NULL, 1353, '绿植系列	开花型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979171, 1693979171, 171, 'data/files/store_2/goods/20230906134604649.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(129, 2, 'material', '【鲜花】蝴蝶兰', '', NULL, 1353, '绿植系列	开花型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979206, 1693979206, 172, 'data/files/store_2/goods/20230906134640579.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(130, 2, 'material', '【鲜花】蝴蝶兰', '', NULL, 1353, '绿植系列	开花型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979236, 1693979236, 173, 'data/files/store_2/goods/20230906134710465.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(131, 2, 'material', '【鲜花】蝴蝶兰', '', NULL, 1353, '绿植系列	开花型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979267, 1693979267, 174, 'data/files/store_2/goods/20230906134739749.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(132, 2, 'material', '【鲜花】蝴蝶兰', '', NULL, 1353, '绿植系列	开花型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979293, 1693979293, 175, 'data/files/store_2/goods/20230906134807674.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(133, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979594, 1693979594, 176, 'data/files/store_2/goods/20230906135307943.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(134, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979621, 1693979621, 177, 'data/files/store_2/goods/20230906135334486.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(135, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979652, 1693979652, 178, 'data/files/store_2/goods/20230906135404776.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(136, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979677, 1693979677, 179, 'data/files/store_2/goods/20230906135431715.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(137, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979721, 1693979721, 180, 'data/files/store_2/goods/20230906135506605.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(138, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979785, 1693979785, 181, 'data/files/store_2/goods/20230906135620621.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(139, 2, 'material', '【绿植】鸿运当头', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979815, 1694746837, 182, 'data/files/store_2/goods/20230912161934651.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(140, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979850, 1693979850, 183, 'data/files/store_2/goods/20230906135723249.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(141, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1693979883, 1693979883, 184, 'data/files/store_2/goods/20230906135756606.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(142, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694497318, 1694497318, 185, 'data/files/store_2/goods/20230912134146790.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(143, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694497393, 1694497393, 186, 'data/files/store_2/goods/20230912134307959.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(144, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694497453, 1694497453, 187, 'data/files/store_2/goods/20230912134406907.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(145, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694497490, 1694497490, 188, 'data/files/store_2/goods/20230912134444599.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(146, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694497525, 1694497525, 189, 'data/files/store_2/goods/20230912134520533.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(147, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694497563, 1694497563, 190, 'data/files/store_2/goods/20230912134557383.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(148, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694497602, 1694497602, 191, 'data/files/store_2/goods/20230912134637795.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(149, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694497638, 1694497638, 192, 'data/files/store_2/goods/20230912134712892.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(150, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694497676, 1694497676, 193, 'data/files/store_2/goods/20230912134750593.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(151, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694497721, 1694497721, 194, 'data/files/store_2/goods/20230912134835768.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(152, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694497772, 1694497772, 195, 'data/files/store_2/goods/20230912134920290.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(153, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694497836, 1694497836, 196, 'data/files/store_2/goods/20230912135030883.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(154, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694497969, 1694497969, 197, 'data/files/store_2/goods/20230912135244690.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(155, 2, 'material', '【鲜花】康乃馨', '', NULL, 2588, '鲜花、花材	鲜花	康乃馨系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498029, 1694498029, 198, 'data/files/store_2/goods/20230912135344276.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(156, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498208, 1694498208, 199, 'data/files/store_2/goods/20230912135643567.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(157, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498256, 1694498256, 200, 'data/files/store_2/goods/20230912135727364.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(158, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498296, 1694498296, 201, 'data/files/store_2/goods/20230912135809446.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(159, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498340, 1694498340, 202, 'data/files/store_2/goods/20230912135854607.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(160, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498381, 1694498381, 203, 'data/files/store_2/goods/20230912135935893.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(161, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498417, 1694498417, 204, 'data/files/store_2/goods/20230912140012467.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(162, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498455, 1694498455, 205, 'data/files/store_2/goods/20230912140049428.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(163, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498492, 1694498492, 206, 'data/files/store_2/goods/20230912140127490.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(164, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498524, 1694498524, 207, 'data/files/store_2/goods/20230912140158461.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(165, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498559, 1694498559, 208, 'data/files/store_2/goods/20230912140234474.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(166, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498597, 1694498597, 209, 'data/files/store_2/goods/20230912140310203.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(167, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498645, 1694498645, 210, 'data/files/store_2/goods/20230912140359105.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(168, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498679, 1694498679, 211, 'data/files/store_2/goods/20230912140432478.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(169, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498745, 1694498745, 212, 'data/files/store_2/goods/20230912140539152.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(170, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498797, 1694498797, 213, 'data/files/store_2/goods/20230912140632926.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(171, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498866, 1694498866, 214, 'data/files/store_2/goods/20230912140741904.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(172, 2, 'material', '【鲜花】小菊', '', NULL, 1288, '鲜花、花材	鲜花	小菊系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694498931, 1694498931, 215, 'data/files/store_2/goods/20230912140846551.jpg.thumb.jpg', NULL, 1, '10.00', '0.00', '', 1),
(173, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500136, 1694500136, 216, 'data/files/store_2/goods/20230912142850691.jpg.thumb.jpg', NULL, 1, '39.00', '0.00', '', 1),
(174, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500175, 1694500175, 217, 'data/files/store_2/goods/20230912142924247.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(175, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500207, 1694500207, 218, 'data/files/store_2/goods/20230912143000269.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(176, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500235, 1694500235, 219, 'data/files/store_2/goods/20230912143030605.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(177, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500261, 1694500261, 220, 'data/files/store_2/goods/20230912143056843.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(178, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500289, 1694500320, 221, 'data/files/store_2/goods/20230912143158201.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(179, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500355, 1694500355, 222, 'data/files/store_2/goods/20230912143228987.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(180, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500390, 1694500390, 223, 'data/files/store_2/goods/20230912143259633.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(181, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500422, 1694500422, 224, 'data/files/store_2/goods/20230912143337904.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(182, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500452, 1694500452, 225, 'data/files/store_2/goods/20230912143407389.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(183, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500487, 1694500487, 226, 'data/files/store_2/goods/20230912143442477.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(184, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500520, 1694500520, 227, 'data/files/store_2/goods/20230912143514250.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(185, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500555, 1694500555, 228, 'data/files/store_2/goods/20230912143550941.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(186, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500593, 1694500593, 229, 'data/files/store_2/goods/20230912143628126.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(187, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500630, 1694500655, 230, 'data/files/store_2/goods/20230912143732198.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(188, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500693, 1694500693, 231, 'data/files/store_2/goods/20230912143808711.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(189, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500729, 1694500729, 232, 'data/files/store_2/goods/20230912143843698.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(190, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500804, 1694500804, 233, 'data/files/store_2/goods/20230912143959657.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(191, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500836, 1694500836, 234, 'data/files/store_2/goods/20230912144031439.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(192, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500865, 1694500865, 235, 'data/files/store_2/goods/20230912144100588.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(193, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500939, 1694500939, 236, 'data/files/store_2/goods/20230912144214770.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(194, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694500971, 1694500971, 237, 'data/files/store_2/goods/20230912144246158.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(195, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694501000, 1694501000, 238, 'data/files/store_2/goods/20230912144315530.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(196, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694501043, 1694501043, 239, 'data/files/store_2/goods/20230912144358166.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(197, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694501078, 1694501078, 240, 'data/files/store_2/goods/20230912144433729.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(198, 2, 'material', '【鲜花】小花束', '', NULL, 2590, '鲜花系列	花束	小花束', '博艺花卉', 0, '', '', 1, 0, NULL, 1694501117, 1694501117, 241, 'data/files/store_2/goods/20230912144511561.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(199, 2, 'material', '【花束】混搭~荷花~莲子~绿色系', '', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694501178, 1696816156, 242, 'data/files/store_2/goods/20230912144613577.jpg.thumb.jpg', NULL, 1, '268.00', '0.00', '', 1),
(200, 2, 'material', '【花束】混搭~向日葵', '', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694501220, 1696738221, 243, 'data/files/store_2/goods/20230912144652184.jpg.thumb.jpg', NULL, 1, '268.00', '0.00', '', 1),
(201, 2, 'material', '【花束】小香风~混搭~卡布基诺系列', '', NULL, 2595, '鲜花系列	花束	小旋风', '博艺花卉', 0, '', '', 1, 0, NULL, 1694501249, 1696738200, 244, 'data/files/store_2/goods/20230912144723314.jpg.thumb.jpg', NULL, 1, '268.00', '0.00', '', 1),
(202, 2, 'material', '【花束】小香风~混搭~橙色系', '', NULL, 2595, '鲜花系列	花束	小旋风', '博艺花卉', 0, '', '', 1, 0, NULL, 1694501280, 1696738165, 245, 'data/files/store_2/goods/20230912144755360.jpg.thumb.jpg', NULL, 1, '268.00', '0.00', '', 1),
(203, 2, 'material', '【花束】混搭~紫色系', '', NULL, 2647, '鲜花系列	花束	混搭系列	紫色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1694501313, 1699171593, 246, 'data/files/store_2/goods/20230912144828953.jpg.thumb.jpg', NULL, 1, '268.00', '0.00', '', 1),
(204, 2, 'material', '【花束】混搭~白玫瑰', '', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694501354, 1696738080, 247, 'data/files/store_2/goods/20230912144908920.jpg.thumb.jpg', NULL, 1, '268.00', '0.00', '', 1),
(205, 2, 'material', '【花束】混搭~爱莎玫瑰', '', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694501385, 1696738054, 248, 'data/files/store_2/goods/20230912144939534.jpg.thumb.jpg', NULL, 1, '268.00', '0.00', '', 1),
(206, 2, 'material', '【花束】抱抱桶~黑骑士', '', NULL, 2594, '鲜花系列	花束	抱抱桶系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694501410, 1696738035, 249, 'data/files/store_2/goods/20230912145005385.jpg.thumb.jpg', NULL, 1, '268.00', '0.00', '', 1),
(207, 2, 'material', '【花束】礼盒~零食系列', '<p>\r\n	<img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230912151946124.jpg\" alt=\"微信图片_20230912151614.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230912151946831.jpg\" alt=\"微信图片_20230912151613.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230912151945553.jpg\" alt=\"微信图片_20230912151621.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230912151944278.jpg\" alt=\"微信图片_20230912151604.jpg\" /> \r\n</p>', NULL, 2593, '鲜花系列	花束	礼盒系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694503195, 1696738881, 250, 'data/files/store_2/goods/20230912151927939.jpg.thumb.jpg', NULL, 1, '120.00', '0.00', '', 1),
(208, 2, 'material', '【鲜花】抱抱桶~红玫瑰~气球~52朵', '<img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230912160430816.jpg\" alt=\"微信图片_20230912160256.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230912160429339.jpg\" alt=\"微信图片_20230912160304.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230912160429165.jpg\" alt=\"微信图片_20230912160250.jpg\" />', NULL, 2594, '鲜花系列	花束	抱抱桶系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694505889, 1696738001, 251, 'data/files/store_2/goods/20230912160417438.jpg.thumb.jpg', NULL, 1, '328.00', '0.00', '', 1),
(209, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1694506820, 1694506820, 252, 'data/files/store_2/goods/20230912162013635.jpg.thumb.jpg', NULL, 1, '58.00', '0.00', '', 1),
(210, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1694506851, 1694506851, 253, 'data/files/store_2/goods/20230912162045391.jpg.thumb.jpg', NULL, 1, '58.00', '0.00', '', 1),
(211, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1694506880, 1694506880, 254, 'data/files/store_2/goods/20230912162114176.jpg.thumb.jpg', NULL, 1, '58.00', '0.00', '', 1),
(212, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1694506912, 1694506912, 255, 'data/files/store_2/goods/20230912162146434.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(213, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1694506942, 1694506942, 256, 'data/files/store_2/goods/20230912162215624.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(214, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植、盆栽	小号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1694506970, 1694506970, 257, 'data/files/store_2/goods/20230912162244648.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(215, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694506997, 1694506997, 258, 'data/files/store_2/goods/20230912162313130.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(216, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694507025, 1694507025, 259, 'data/files/store_2/goods/20230912162339569.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(217, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694507052, 1694507052, 260, 'data/files/store_2/goods/20230912162406246.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(218, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694507080, 1694507080, 261, 'data/files/store_2/goods/20230912162435121.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(219, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694507105, 1694507105, 262, 'data/files/store_2/goods/20230912162500135.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(220, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694507133, 1694507133, 263, 'data/files/store_2/goods/20230912162528608.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(221, 2, 'material', '【绿植】待定', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694507159, 1694507159, 264, 'data/files/store_2/goods/20230912162554813.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(222, 2, 'material', '【鲜花】小香风~卡布奇诺', '<img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230914083628464.jpg\" alt=\"微信图片_20230914083229.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230914083629140.jpg\" alt=\"微信图片_20230914083358.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230914083629821.jpg\" alt=\"微信图片_20230914083345.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230914083630796.jpg\" alt=\"微信图片_20230914083352.jpg\" />', NULL, 2595, '鲜花系列	花束	小旋风', '博艺花卉', 0, '', '', 1, 0, NULL, 1694651802, 1694652506, 265, 'data/files/store_2/goods/20230914083605623.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(223, 2, 'material', '【鲜花】抱抱桶~曼塔玫瑰乌梅子酱~33朵', '<img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230914083844539.jpg\" alt=\"微信图片_20230914083404.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230914083844469.jpg\" alt=\"微信图片_20230914083410.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230914083844913.jpg\" alt=\"微信图片_20230914083422.jpg\" /><img src=\"http://shopwind.byhh.com/data/files/store_2/goods/20230914083845415.jpg\" alt=\"微信图片_20230914083416.jpg\" />', NULL, 2594, '鲜花系列	花束	抱抱桶系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694651933, 1696737954, 266, 'data/files/store_2/goods/20230914083834924.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(224, 2, 'material', '【配材】绿豆', '', NULL, 2589, '鲜花、花材	鲜花	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658047, 1694658047, 267, 'data/files/store_2/goods/20230914102039526.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(225, 2, 'material', '【鲜花】桔梗', '', NULL, 1290, '鲜花、花材	鲜花	桔梗系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658207, 1694658207, 268, 'data/files/store_2/goods/20230914102320961.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(226, 2, 'material', '【鲜花】桔梗', '', NULL, 1290, '鲜花、花材	鲜花	桔梗系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658248, 1694658248, 269, 'data/files/store_2/goods/20230914102402247.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(227, 2, 'material', '【鲜花】桔梗', '', NULL, 1290, '鲜花、花材	鲜花	桔梗系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658281, 1694658281, 270, 'data/files/store_2/goods/20230914102433103.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(228, 2, 'material', '【配花】', '', NULL, 2587, '鲜花系列	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658411, 1694742342, 271, 'data/files/store_2/goods/20230914102638598.jpg.thumb.jpg', NULL, 1, '46.00', '0.00', '', 1),
(229, 2, 'material', '【鲜花】配花', '', NULL, 2587, '鲜花系列	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658454, 1694658454, 272, 'data/files/store_2/goods/20230914102725861.jpg.thumb.jpg', NULL, 1, '45.00', '0.00', '', 1),
(230, 2, 'material', '【鲜花】配花', '', NULL, 2587, '鲜花系列	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658498, 1694658498, 273, 'data/files/store_2/goods/20230914102813622.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(231, 2, 'material', '【鲜花】配花', '', NULL, 2587, '鲜花系列	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658548, 1694658548, 274, 'data/files/store_2/goods/20230914102902794.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(232, 2, 'material', '【鲜花】配花', '', NULL, 2587, '鲜花系列	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658587, 1694658612, 275, 'data/files/store_2/goods/20230914103010480.jpg.thumb.jpg', NULL, 1, '45.00', '0.00', '', 1),
(233, 2, 'material', '【鲜花】配花', '', NULL, 2587, '鲜花系列	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658654, 1697698973, 276, 'data/files/store_2/goods/20230914103049920.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(234, 2, 'material', '【鲜花】配花', '', NULL, 2587, '鲜花系列	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658686, 1694658686, 277, 'data/files/store_2/goods/20230914103121428.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(235, 2, 'material', '【鲜花】配花', '', NULL, 2587, '鲜花系列	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658733, 1694658733, 278, 'data/files/store_2/goods/20230914103200942.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(236, 2, 'material', '【鲜花】配花', '', NULL, 2587, '鲜花系列	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658762, 1694658762, 279, 'data/files/store_2/goods/20230914103237717.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(237, 2, 'material', '【鲜花】配花', '', NULL, 2587, '鲜花系列	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658821, 1694658821, 280, 'data/files/store_2/goods/20230914103335144.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(238, 2, 'material', '【鲜花】配花', '', NULL, 2587, '鲜花系列	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658860, 1694658860, 281, 'data/files/store_2/goods/20230914103414143.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(239, 2, 'material', '【鲜花】配花', '', NULL, 2589, '鲜花、花材	鲜花	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658901, 1694658901, 282, 'data/files/store_2/goods/20230914103455984.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(240, 2, 'material', '【鲜花】配花', '', NULL, 2589, '鲜花、花材	鲜花	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694658966, 1694658966, 283, 'data/files/store_2/goods/20230914103600764.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(241, 2, 'material', '【鲜花】配花', '', NULL, 2589, '鲜花、花材	鲜花	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659001, 1694659001, 284, 'data/files/store_2/goods/20230914103636377.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(242, 2, 'material', '【鲜花】配花', '', NULL, 2589, '鲜花、花材	鲜花	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659043, 1694659043, 285, 'data/files/store_2/goods/20230914103718483.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(243, 2, 'material', '【鲜花】配花', '', NULL, 2589, '鲜花、花材	鲜花	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659098, 1694659098, 286, 'data/files/store_2/goods/20230914103813891.jpg.thumb.jpg', NULL, 1, '46.00', '0.00', '', 1),
(244, 2, 'material', '【鲜花】配花', '', NULL, 2589, '鲜花、花材	鲜花	配花', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659157, 1694659157, 287, 'data/files/store_2/goods/20230914103912121.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(245, 2, 'material', '【鲜花】百合', '', NULL, 1289, '鲜花、花材	鲜花	百合系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659324, 1694659324, 288, 'data/files/store_2/goods/20230914104157577.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(246, 2, 'material', '【鲜花】百合', '', NULL, 1289, '鲜花、花材	鲜花	百合系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659356, 1694659356, 289, 'data/files/store_2/goods/20230914104231238.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(247, 2, 'material', '【鲜花】百合', '', NULL, 1289, '鲜花、花材	鲜花	百合系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659393, 1694659393, 290, 'data/files/store_2/goods/20230914104307736.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(248, 2, 'material', '【鲜花】百合', '', NULL, 1289, '鲜花、花材	鲜花	百合系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659422, 1694659422, 291, 'data/files/store_2/goods/20230914104336674.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(249, 2, 'material', '【鲜花】多头玫', '', NULL, 1236, '鲜花、花材	鲜花	玫瑰系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659538, 1694659538, 292, 'data/files/store_2/goods/20230914104533945.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(250, 2, 'material', '【鲜花】多头玫', '', NULL, 1236, '鲜花、花材	鲜花	玫瑰系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659577, 1694659577, 293, 'data/files/store_2/goods/20230914104612930.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(251, 2, 'material', '【鲜花】多头玫', '', NULL, 1236, '鲜花、花材	鲜花	玫瑰系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659603, 1694659603, 294, 'data/files/store_2/goods/20230914104637823.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(252, 2, 'material', '【鲜花】多头玫', '', NULL, 1236, '鲜花、花材	鲜花	玫瑰系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659640, 1694659640, 295, 'data/files/store_2/goods/20230914104714989.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(253, 2, 'material', '【鲜花】多头玫', '', NULL, 1236, '鲜花、花材	鲜花	玫瑰系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659667, 1694659667, 296, 'data/files/store_2/goods/20230914104742838.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(254, 2, 'material', '【鲜花】多头玫', '', NULL, 1236, '鲜花、花材	鲜花	玫瑰系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694659693, 1694659693, 297, 'data/files/store_2/goods/20230914104808586.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(255, 2, 'material', '【鲜花】扶郎', '', NULL, 1291, '鲜花、花材	鲜花	扶郎系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694660281, 1694660281, 298, 'data/files/store_2/goods/20230914105756410.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(256, 2, 'material', '【鲜花】扶郎', '', NULL, 1291, '鲜花、花材	鲜花	扶郎系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694660315, 1694660315, 299, 'data/files/store_2/goods/20230914105830442.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(257, 2, 'material', '【鲜花】扶郎', '', NULL, 1291, '鲜花、花材	鲜花	扶郎系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694660344, 1694660344, 300, 'data/files/store_2/goods/20230914105859583.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1);
INSERT INTO `swd_goods` (`goods_id`, `store_id`, `type`, `goods_name`, `description`, `content`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `video`, `recommended`, `price`, `mkprice`, `tags`, `dt_id`) VALUES
(258, 2, 'material', '【鲜花】扶郎', '', NULL, 1291, '鲜花、花材	鲜花	扶郎系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1694660373, 1694660373, 301, 'data/files/store_2/goods/20230914105928362.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(259, 2, 'material', '【绿植】小绿萝', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694746298, 1694747146, 302, 'data/files/store_2/goods/20230915110200190.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(260, 2, 'material', '【绿植】白掌', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694746399, 1694746399, 303, 'data/files/store_2/goods/20230915105311185.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(261, 2, 'material', '【绿植】天堂鸟', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694746431, 1694746994, 304, 'data/files/store_2/goods/20230915110305785.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(262, 2, 'material', '【绿植】吉利红', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694746502, 1694746502, 305, 'data/files/store_2/goods/20230915105454461.png.thumb.png', NULL, 1, '68.00', '0.00', '', 1),
(263, 2, 'material', '【绿植】如意皇后', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694746605, 1694746612, 306, 'data/files/store_2/goods/20230915105637425.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(264, 2, 'material', '【绿植】彩叶芋', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694746664, 1694746664, 307, 'data/files/store_2/goods/20230915105738522.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(265, 2, 'material', '【绿植】芦荟', '', NULL, 1313, '绿植系列	小型植物', '博艺花卉', 0, '', '', 1, 0, NULL, 1694746717, 1694746717, 308, 'data/files/store_2/goods/20230915105831915.png.thumb.png', NULL, 1, '68.00', '0.00', '', 1),
(266, 2, 'material', '【绿植】红叶', '', NULL, 22, '绿植系列	大型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1694828553, 1694828553, 309, 'data/files/store_2/goods/20230916094227669.jpg.thumb.jpg', NULL, 1, '680.00', '0.00', '', 1),
(267, 2, 'material', '【鲜花】桌花系列001', '', NULL, 2607, '鲜花系列	场地花	讲台花', '博艺花卉', 0, '', '', 1, 0, NULL, 1695439921, 1697791261, 310, 'data/files/store_2/goods/20230923113140304.jpg.thumb.jpg', NULL, 1, '680.00', '0.00', '', 1),
(268, 2, 'material', '【花束】小香风~粉雪山', '', NULL, 2595, '鲜花系列	花束	小旋风', '博艺花卉', 0, '', '', 1, 0, NULL, 1695449960, 1696738851, 311, 'data/files/store_2/goods/20230923152648845.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(269, 2, 'material', '【花束】小香风~卡布基诺混搭系列', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20230923162125172.jpg\" alt=\"卡布-多头玫.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20230923162125287.jpg\" alt=\"卡布-多头玫1.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20230923162125499.jpg\" alt=\"卡布-多头玫2.jpg\" />', NULL, 2595, '鲜花系列	花束	小旋风', '博艺花卉', 0, '', '', 1, 0, NULL, 1695457168, 1696738838, 312, 'data/files/store_2/goods/20230923162203793.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(270, 2, 'material', '【花束】人民币~向日葵综合', '', NULL, 1285, '鲜花系列	花束	人民币系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1695630500, 1696738866, 313, 'data/files/store_2/goods/20230925162814523.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(271, 2, 'material', '【花束】抱抱桶~曼塔乌梅子酱~33朵', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20230925164114535.jpg\" alt=\"6-1.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20230925164114600.jpg\" alt=\"6-2.jpg\" />', NULL, 2594, '鲜花系列	花束	抱抱桶系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1695630990, 1697676130, 314, 'data/files/store_2/goods/20230925163616972.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(272, 2, 'material', '【花束】抱抱桶~粉雪山玫瑰~99朵', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20230925163734516.jpg\" alt=\"3-2.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20230925163735953.jpg\" alt=\"3-3.jpg\" />', NULL, 2594, '鲜花系列	花束	抱抱桶系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1695631063, 1697676154, 315, 'data/files/store_2/goods/20230925163723746.jpg.thumb.jpg', NULL, 1, '388.00', '0.00', '', 1),
(273, 2, 'material', '【花束】红玫瑰~52朵', '', NULL, 1282, '鲜花系列	花束	52朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1695635230, 1696738769, 316, 'data/files/store_2/goods/20230926110807430.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(276, 2, 'material', '【花束】人民币~鲜花搭配系列', '', NULL, 1285, '鲜花系列	花束	人民币系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1695697339, 1696738958, 319, 'data/files/store_2/goods/20230926110212183.png.thumb.png', NULL, 1, '288.00', '0.00', '', 1),
(274, 2, 'material', '【花束】戴安娜玫瑰~520朵', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231002095106944.jpg\" alt=\"1-1.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20231002095106220.jpg\" alt=\"1-2.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20231002095106951.jpg\" alt=\"1-3.jpg\" />', NULL, 2612, '鲜花系列	花束	520朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1695690466, 1696211475, 317, 'data/files/store_2/goods/20231002095101221.jpg.thumb.jpg', NULL, 1, '1880.00', '0.00', '', 1),
(275, 2, 'material', '【花篮】绿色系列~百合~香槟', '', NULL, 2585, '鲜花系列	花篮	绿色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1695690661, 1695697666, 318, 'data/files/store_2/goods/20230926110744947.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(277, 2, 'material', '【花束】人民币系列~鲜花搭配', '', NULL, 1285, '鲜花系列	花束	人民币系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1695697392, 1696738945, 320, 'data/files/store_2/goods/20230926110306719.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(278, 2, 'material', '【花束】人民币~鲜花搭配系列', '', NULL, 1285, '鲜花系列	花束	人民币系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1695697429, 1696738930, 321, 'data/files/store_2/goods/20230926110342616.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(279, 2, 'material', '【花束】人民币~鲜花搭配系列', '', NULL, 1285, '鲜花系列	花束	人民币系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1695697477, 1696737705, 322, 'data/files/store_2/goods/20230926110432535.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(280, 2, 'material', '【花篮】花海', '', NULL, 2610, '鲜花系列	花篮	高档系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1695697979, 1695697979, 323, 'data/files/store_2/goods/20230926111253309.jpg.thumb.jpg', NULL, 1, '1188.00', '0.00', '', 1),
(281, 2, 'material', '【花篮】红红火火', '', NULL, 2610, '鲜花系列	花篮	高档系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1695698030, 1695698030, 324, 'data/files/store_2/goods/20230926111340335.png.thumb.png', NULL, 1, '688.00', '0.00', '', 1),
(282, 2, 'material', '【花篮】花海', '', NULL, 2610, '鲜花系列	花篮	高档系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1695698189, 1695698199, 325, 'data/files/store_2/goods/20230926111624688.jpg.thumb.jpg', NULL, 1, '1888.00', '0.00', '', 1),
(283, 2, 'material', '【花篮】高档系列~', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231002093426943.jpg\" alt=\"微信图片_20231002093345.jpg\" />', NULL, 2610, '鲜花系列	花篮	高档系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696210473, 1696210473, 326, 'data/files/store_2/goods/20231002093419177.jpg.thumb.jpg', NULL, 1, '460.00', '0.00', '', 1),
(284, 2, 'material', '【鲜花】郁金香', '', NULL, 2611, '鲜花系列	鲜花	郁金香系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696210734, 1696210734, 327, 'data/files/store_2/goods/20231002093817782.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(285, 2, 'material', '【鲜花】郁金香', '', NULL, 2611, '鲜花系列	鲜花	郁金香系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696210778, 1696210778, 328, 'data/files/store_2/goods/20231002093927585.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(286, 2, 'material', '【鲜花】郁金香', '', NULL, 2611, '鲜花系列	鲜花	郁金香系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696210870, 1696210870, 329, 'data/files/store_2/goods/20231002094004430.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(287, 2, 'material', '【鲜花】郁金香', '', NULL, 2611, '鲜花系列	鲜花	郁金香系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696210904, 1696210904, 330, 'data/files/store_2/goods/20231002094137360.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(288, 2, 'material', '【花束】红玫瑰~99朵', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231002145822791.jpg\" alt=\"微信图片_20231002111655.jpg\" />', NULL, 1283, '鲜花系列	花束	99朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696216727, 1696738912, 331, 'data/files/store_2/goods/20231002111859825.jpg.thumb.jpg', NULL, 1, '388.00', '0.00', '', 1),
(289, 2, 'material', '【花束】红玫瑰~52朵', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231002151055691.jpg\" alt=\"微信图片_20231002150950.jpg\" />', NULL, 1282, '鲜花系列	花束	52朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696216935, 1696738898, 332, 'data/files/store_2/goods/20231002151048828.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(290, 2, 'material', '【鲜花】52朵系列', '', NULL, 1282, '鲜花系列	花束	52朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696217872, 1696217872, 333, NULL, NULL, 1, '288.00', '0.00', '', 1),
(291, 2, 'material', '【花束】99朵系列', '', NULL, 1283, '鲜花系列	花束	99朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696217914, 1696234057, 334, 'data/files/store_2/goods/20231002160734221.jpg.thumb.jpg', NULL, 1, '388.00', '0.00', '', 1),
(292, 2, 'material', '【花束】33朵系列', '', NULL, 2609, '鲜花系列	花束	33朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696217961, 1696217961, 335, NULL, NULL, 1, '238.00', '0.00', '', 1),
(293, 2, 'material', '【花束】33朵系列', '', NULL, 2609, '鲜花系列	花束	33朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696218013, 1696218019, 336, NULL, NULL, 1, '238.00', '0.00', '', 1),
(294, 2, 'material', '【花束】99朵系列', '', NULL, 1283, '鲜花系列	花束	99朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696218072, 1696218133, 337, NULL, NULL, 1, '388.00', '0.00', '', 1),
(295, 2, 'material', '【花束】19朵系列', '', NULL, 2613, '鲜花系列	花束	19朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696218332, 1696218332, 338, NULL, NULL, 1, '188.00', '0.00', '', 1),
(296, 2, 'material', '【花束】19朵系列', '', NULL, 2613, '鲜花系列	花束	19朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696218358, 1696218358, 339, NULL, NULL, 1, '168.00', '0.00', '', 1),
(297, 2, 'material', '【花束】19朵系列', '', NULL, 2613, '鲜花系列	花束	19朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696218382, 1696218382, 340, NULL, NULL, 1, '168.00', '0.00', '', 1),
(298, 2, 'material', '【花束】混搭~红玫瑰~11朵', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231008120053890.jpg\" alt=\"微信图片_20231002101652.jpg\" />', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696218415, 1696756277, 341, 'data/files/store_2/goods/20231002145641403.jpg.thumb.jpg', NULL, 1, '128.00', '0.00', '', 1),
(299, 2, 'material', '【花束】11朵系列', '', NULL, 2614, '鲜花系列	花束	11朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696218441, 1696218441, 342, NULL, NULL, 1, '128.00', '0.00', '', 1),
(300, 2, 'material', '【花束】11朵系列', '', NULL, 2614, '鲜花系列	花束	11朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696228061, 1696228061, 343, NULL, NULL, 1, '128.00', '0.00', '', 1),
(301, 2, 'material', '【花束】33朵系列', '', NULL, 2609, '鲜花系列	花束	33朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696228118, 1696228118, 344, NULL, NULL, 1, '288.00', '0.00', '', 1),
(302, 2, 'material', '【花束】戴安娜玫瑰系列~气球~99朵系列', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231024190802782.jpg\" alt=\"微信图片_20231024190702.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20231024190802560.jpg\" alt=\"微信图片_20231024190725.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20231024190803391.jpg\" alt=\"微信图片_20231024190731.jpg\" />', NULL, 1283, '鲜花系列	花束	99朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696228152, 1698145722, 345, 'data/files/store_2/goods/20231024190752256.jpg.thumb.jpg', NULL, 1, '388.00', '0.00', '', 1),
(303, 2, 'material', '【花束】戴安娜玫瑰系列~199朵', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231002151751771.jpg\" alt=\"微信图片_20230926104423.jpg\" />', NULL, 2617, '鲜花系列	花束	199朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696230416, 1696739084, 346, 'data/files/store_2/goods/20231002151740424.jpg.thumb.jpg', NULL, 1, '488.00', '0.00', '', 1),
(304, 2, 'material', '【花束】曼塔玫瑰~199朵', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231010095730872.jpg\" alt=\"1.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20231010095731894.jpg\" alt=\"1-2.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20231010095730461.jpg\" alt=\"1-1.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20231010095730811.jpg\" alt=\"1-3.jpg\" />', NULL, 2617, '鲜花系列	花束	199朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696230471, 1696903065, 347, 'data/files/store_2/goods/20231010095722520.jpg.thumb.jpg', NULL, 1, '788.00', '0.00', '', 1),
(305, 2, 'material', '【花束】199朵系列', '', NULL, 2617, '鲜花系列	花束	199朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696230498, 1696660260, 348, NULL, NULL, 1, '788.00', '0.00', '', 1),
(306, 2, 'material', '【花束】混搭~弗洛伊德系列', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231008115844311.jpg\" alt=\"微信图片_20231002161101.jpg\" />', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696234433, 1696739057, 349, 'data/files/store_2/goods/20231002161348957.jpg.thumb.jpg', NULL, 1, '188.00', '0.00', '', 1),
(307, 2, 'material', '【花束】混搭01', '', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696234556, 1696234556, 350, NULL, NULL, 1, '288.00', '0.00', '', 1),
(308, 2, 'material', '【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231008100442728.jpg\" alt=\"微信图片_20231008095918.jpg\" />', NULL, 2647, '鲜花系列	花束	混搭系列	紫色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1696234579, 1699171677, 351, 'data/files/store_2/goods/20231008100436875.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(309, 2, 'material', '【花束】混搭~百合~白玫瑰系列', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231008115714493.jpg\" alt=\"微信图片_20231008100125.jpg\" />', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696234601, 1696739023, 352, 'data/files/store_2/goods/20231008100208597.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(310, 2, 'material', '【花束】抱抱桶~混搭~卡布奇诺~小熊款', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231003174421205.jpg\" alt=\"微信图片_20231003172609.jpg\" />', NULL, 2594, '鲜花系列	花束	抱抱桶系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696300212, 1696739007, 353, 'data/files/store_2/goods/20231003173055801.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(311, 2, 'material', '【花束】抱抱桶~粉雪山玫瑰~52朵', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231003173037848.jpg\" alt=\"52朵粉雪杉抱抱桶.jpg\" />', NULL, 2594, '鲜花系列	花束	抱抱桶系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696325444, 1697698933, 354, 'data/files/store_2/goods/20231003173031903.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(312, 2, 'material', '【花束】抱抱桶~乌梅子酱~52朵曼塔玫瑰', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231003173230569.jpg\" alt=\"52朵曼塔乌梅子酱.jpg\" />', NULL, 2594, '鲜花系列	花束	抱抱桶系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696325557, 1696326474, 355, 'data/files/store_2/goods/20231003173225223.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(314, 2, 'material', '【绿植】澳洲杉', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231009091240625.jpg\" alt=\"微信图片_20231009091213.jpg\" />', NULL, 1313, '绿植系列	小型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1696813975, 1696815076, 357, 'data/files/store_2/goods/20231009091251563.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(319, 2, 'material', '【花束】香烟系列~混搭~百合~白玫瑰', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231016122307236.jpg\" alt=\"微信图片_20231016122226.jpg\" />', NULL, 1284, '鲜花系列	花束	香烟系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1697430196, 1697430547, 362, 'data/files/store_2/goods/20231016122256634.jpg.thumb.jpg', NULL, 1, '268.00', '0.00', '', 1),
(313, 2, 'material', '【花篮】高档系列8005~紫色系', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231007120828482.jpg\" alt=\"微信图片_20231007120738.jpg\" />', NULL, 2610, '鲜花系列	花篮	高档系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696646163, 1697358177, 356, 'data/files/store_2/goods/20231007120822127.jpg.thumb.jpg', NULL, 1, '580.00', '0.00', '', 1),
(315, 2, 'material', '【花束】抱抱桶~粉雪山玫瑰~52朵~粉色系', '', NULL, 2594, '鲜花系列	花束	抱抱桶系列', '博艺花卉', 0, '', '', 1, 0, '', 1696909886, 1697358121, 358, 'data/files/store_2/goods/20231010122846565.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(316, 2, 'material', '【鲜花】人民币~混搭~香槟黄玫瑰', '', NULL, 1285, '鲜花系列	花束	人民币系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1696929785, 1696929785, 359, 'data/files/store_2/goods/20231010172255386.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(317, 2, 'material', '【花束】混搭~曼塔乌梅子酱~紫霞仙子~橙色系', '', NULL, 2647, '鲜花系列	花束	混搭系列	紫色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1697357702, 1699171547, 360, 'data/files/store_2/goods/20231015161452348.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(318, 2, 'material', '【花束】混搭~橙芭比~香槟玫瑰~向日葵~橙色系', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231105160331983.jpg\" alt=\"微信图片_20231105154133.jpg\" />', NULL, 2652, '鲜花系列	花束	混搭系列	橙色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1697357780, 1699171418, 361, 'data/files/store_2/goods/20231015161614998.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(320, 2, 'material', '【绿植】发财树~小盆栽', '', NULL, 1313, '绿植系列	小型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1697524981, 1699066951, 363, 'data/files/store_2/goods/20231104110223787.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(321, 2, 'material', '【绿植】鸭掌木~小盆栽', '', NULL, 1313, '绿植系列	小型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1697525016, 1697698919, 364, NULL, NULL, 1, '68.00', '0.00', '', 1),
(322, 2, 'material', '【绿植】铜钱草~小盆栽~水培型', '', NULL, 1313, '绿植系列	小型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1697525107, 1699066655, 365, 'data/files/store_2/goods/20231104105439588.jpg.thumb.jpg', NULL, 1, '115.00', '0.00', '', 1),
(323, 2, 'material', '【花篮】红色款~红玫瑰~多头玫瑰', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231019085253391.jpg\" alt=\"微信图片_20231019085215.jpg\" />', NULL, 2582, '鲜花系列	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1697623439, 1697676777, 366, 'data/files/store_2/goods/20231019085245917.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(324, 2, 'material', '【花束】抱抱桶~混搭~紫玫瑰~粉雪山~康乃馨~郁金香~99朵', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231019095344937.jpg\" alt=\"99朵混搭.jpg\" />', NULL, 2594, '鲜花系列	花束	抱抱桶系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1697676072, 1697680431, 367, 'data/files/store_2/goods/20231019095337390.jpg.thumb.jpg', NULL, 1, '580.00', '0.00', '', 1),
(325, 2, 'material', '【花束】彩票系列~混搭~绣球~百合~桔梗', '', NULL, 2639, '鲜花系列	花束	彩票系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1697698816, 1697766536, 368, 'data/files/store_2/goods/20231020094843941.jpg.thumb.jpg', NULL, 1, '880.00', '0.00', '', 1),
(326, 2, 'material', '【花束】零食系列~混搭~', '', NULL, 2640, '鲜花系列	花束	零食系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1697698886, 1697698886, 369, NULL, NULL, 1, '480.00', '0.00', '', 1),
(327, 2, 'material', '【花束】绣球~百合~桔梗~混搭~蓝色系', '', NULL, 2615, '鲜花系列	花束	混搭系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1697704515, 1699170370, 370, 'data/files/store_2/goods/20231019163506594.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(328, 2, 'material', '【花束】彩票系列~混搭', '', NULL, 2639, '鲜花系列	花束	彩票系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1697704631, 1697704774, 371, NULL, NULL, 1, '588.00', '0.00', '', 1),
(329, 2, 'material', '【花篮】高档系列003', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231020163500286.jpg\" alt=\"微信图片_20231020163430.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20231020163501253.jpg\" alt=\"微信图片_20231020163435.jpg\" />', NULL, 2610, '鲜花系列	花篮	高档系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1697790920, 1697790920, 372, 'data/files/store_2/goods/20231020163455536.jpg.thumb.jpg', NULL, 1, '580.00', '0.00', '', 1),
(330, 2, 'material', '【鲜花】桌花系列002', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231020163940373.jpg\" alt=\"微信图片_20231020163830.jpg\" />', NULL, 2608, '鲜花系列	场地花	桌花', '博艺花卉', 0, '', '', 1, 0, NULL, 1697791194, 1697791273, 373, 'data/files/store_2/goods/20231020163933407.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(331, 2, 'material', '【绿植】鸭掌木~盆栽', '', NULL, 22, '绿植系列	大型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1698110934, 1699066930, 374, 'data/files/store_2/goods/20231104110206212.jpg.thumb.jpg', NULL, 1, '480.00', '0.00', '', 1),
(332, 2, 'material', '【绿植】橡皮树~', '', NULL, 22, '绿植系列	大型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1698111023, 1698111023, 375, 'data/files/store_2/goods/20231024093016180.jpg.thumb.jpg', NULL, 1, '480.00', '0.00', '', 1),
(333, 2, 'material', '【绿植】待定~水培型', '', NULL, 1313, '绿植系列	小型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1698111081, 1699066518, 376, 'data/files/store_2/goods/20231024093114151.jpg.thumb.jpg', NULL, 1, '128.00', '0.00', '', 1),
(334, 2, 'material', '【绿植】小绿植~茶桌摆件', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231024093303374.jpg\" alt=\"微信图片_20231024092821.jpg\" />', NULL, 1313, '绿植系列	小型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1698111189, 1698111189, 377, 'data/files/store_2/goods/20231024093254451.jpg.thumb.jpg', NULL, 1, '68.00', '0.00', '', 1),
(335, 2, 'material', '【绿植】龙血树~款式A002', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231024094752883.jpg\" alt=\"微信图片_20231024092711.jpg\" />', NULL, 22, '绿植系列	大型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1698112083, 1698112083, 380, 'data/files/store_2/goods/20231024094745537.jpg.thumb.jpg', NULL, 1, '480.00', '0.00', '', 1),
(336, 2, 'material', '【绿植】龙血树~款式A003', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231024094919127.jpg\" alt=\"微信图片_20231024092809.jpg\" />', NULL, 22, '绿植系列	大型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1698112166, 1698112166, 381, 'data/files/store_2/goods/20231024094911992.jpg.thumb.jpg', NULL, 1, '480.00', '0.00', '', 1),
(337, 2, 'material', '【绿植】玫瑰花~小盆栽', '', NULL, 1353, '绿植系列	开花型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1698124245, 1698124245, 382, NULL, NULL, 1, '45.00', '0.00', '', 1),
(338, 2, 'material', '【绿植】滴水观音~盆栽', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231024144238482.jpg\" alt=\"微信图片_20231024144216.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20231024144238265.jpg\" alt=\"微信图片_20231024144231.jpg\" />', NULL, 1304, '绿植系列	中型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1698129767, 1698129896, 383, 'data/files/store_2/goods/20231024144224646.jpg.thumb.jpg', NULL, 1, '488.00', '0.00', '', 1),
(339, 2, 'material', '【鲜花】红玫瑰系列~299朵', '', NULL, 2643, '鲜花系列	花束	299朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1699022018, 1699073413, 384, 'data/files/store_2/goods/20231104104000646.jpg.thumb.jpg', NULL, 1, '1180.00', '0.00', '', 1),
(340, 2, 'material', '【绿植】冬青~小盆栽', '', NULL, 1353, '绿植系列	开花型绿植', '博艺花卉', 0, '', '', 1, 0, NULL, 1699063458, 1699065684, 385, 'data/files/store_2/goods/20231104104120166.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(341, 2, 'material', '【绿植】多肉~小盆栽', '', NULL, 1313, '绿植系列	小型绿植', '', 2, '名称', '盆', 1, 0, NULL, 1699064541, 1699066154, 387, 'data/files/store_2/goods/20231104104911332.jpg.thumb.jpg', NULL, 1, '35.00', '0.00', '', 1),
(342, 2, 'material', '【花束】混搭~手打花', '', NULL, 2645, '鲜花系列	花束	手打花', '博艺花卉', 0, '', '', 1, 0, NULL, 1699168651, 1699168651, 389, NULL, NULL, 1, '68.00', '0.00', '', 1),
(343, 2, 'material', '【花束】百合~戴安娜~银叶~混搭~粉色系', '<img src=\"http://www.byhh.com/data/files/store_2/goods/20231106114548529.jpg\" alt=\"微信图片_20231106114343.jpg\" /><img src=\"http://www.byhh.com/data/files/store_2/goods/20231105154507805.jpg\" alt=\"微信图片_20231002101418.jpg\" />', NULL, 2646, '鲜花系列	花束	混搭系列	粉色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1699170316, 1699242380, 390, 'data/files/store_2/goods/20231106114610185.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(344, 2, 'material', '【花束】白玫瑰~百合~银叶~混搭~蓝色系', '', NULL, 2649, '鲜花系列	花束	混搭系列	蓝色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1699170475, 1699242274, 391, 'data/files/store_2/goods/20231106114419319.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(345, 2, 'material', '【花束】混搭-鲜花搭配', '', NULL, 2647, '鲜花系列	花束	混搭系列	紫色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1699492053, 1699492053, 392, NULL, NULL, 1, '288.00', '0.00', '', 1),
(346, 2, 'material', '【花束】红玫瑰~爱心礼盒~52朵系列', '', NULL, 2593, '鲜花系列	花束	礼盒系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1699600018, 1699600018, 393, NULL, NULL, 1, '388.00', '0.00', '', 1),
(347, 2, 'material', '【花束】红玫瑰~99朵系列', '', NULL, 1283, '鲜花系列	花束	99朵系列', '博艺花卉', 0, '', '', 1, 0, NULL, 1699604661, 1699604661, 394, NULL, NULL, 1, '488.00', '0.00', '', 1),
(348, 2, 'material', '【鲜花】插瓶花~混搭', '', NULL, 2653, '鲜花系列	插瓶花', '博艺花卉', 0, '', '', 1, 0, NULL, 1699760641, 1699760674, 395, 'data/files/store_2/goods/20231112114302158.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `swd_goods_image`
--

CREATE TABLE `swd_goods_image` (
  `image_id` int(10) UNSIGNED NOT NULL,
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `image_url` varchar(255) NOT NULL DEFAULT '',
  `thumbnail` varchar(255) DEFAULT '',
  `sort_order` tinyint(4) UNSIGNED DEFAULT '0',
  `file_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_goods_image`
--

INSERT INTO `swd_goods_image` (`image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id`) VALUES
(164, 76, 'data/files/store_2/goods/20230822170842971.jpg', 'data/files/store_2/goods/20230822170842971.jpg.thumb.jpg', 1, 193),
(163, 75, 'data/files/store_2/goods/20230822170435898.jpg', 'data/files/store_2/goods/20230822170435898.jpg.thumb.jpg', 1, 192),
(162, 74, 'data/files/store_2/goods/20230822164739160.jpg', 'data/files/store_2/goods/20230822164739160.jpg.thumb.jpg', 1, 191),
(174, 73, 'data/files/store_2/goods/20230822175242642.jpg', 'data/files/store_2/goods/20230822175242642.jpg.thumb.jpg', 1, 203),
(157, 68, 'data/files/store_2/goods/20230822163344199.jpg', 'data/files/store_2/goods/20230822163344199.jpg.thumb.jpg', 1, 186),
(156, 69, 'data/files/store_2/goods/20230822163222218.jpg', 'data/files/store_2/goods/20230822163222218.jpg.thumb.jpg', 1, 185),
(158, 70, 'data/files/store_2/goods/20230822163809876.jpg', 'data/files/store_2/goods/20230822163809876.jpg.thumb.jpg', 1, 187),
(159, 71, 'data/files/store_2/goods/20230822164029261.jpg', 'data/files/store_2/goods/20230822164029261.jpg.thumb.jpg', 1, 188),
(160, 72, 'data/files/store_2/goods/20230822164241342.jpg', 'data/files/store_2/goods/20230822164241342.jpg.thumb.jpg', 1, 189),
(153, 67, 'data/files/store_2/goods/20230822162842363.jpg', 'data/files/store_2/goods/20230822162842363.jpg.thumb.jpg', 255, 182),
(152, 66, 'data/files/store_2/goods/20230822162749566.jpg', 'data/files/store_2/goods/20230822162749566.jpg.thumb.jpg', 1, 181),
(130, 57, 'data/files/store_2/goods/20230820162905371.png', 'data/files/store_2/goods/20230820162905371.png.thumb.png', 1, 159),
(131, 56, 'data/files/store_2/goods/20230820162918116.jpg', 'data/files/store_2/goods/20230820162918116.jpg.thumb.jpg', 1, 160),
(132, 55, 'data/files/store_2/goods/20230820162934601.jpg', 'data/files/store_2/goods/20230820162934601.jpg.thumb.jpg', 1, 161),
(133, 53, 'data/files/store_2/goods/20230820163000298.jpg', 'data/files/store_2/goods/20230820163000298.jpg.thumb.jpg', 1, 162),
(129, 58, 'data/files/store_2/goods/20230820162850882.jpg', 'data/files/store_2/goods/20230820162850882.jpg.thumb.jpg', 1, 158),
(128, 59, 'data/files/store_2/goods/20230820162833704.jpg', 'data/files/store_2/goods/20230820162833704.jpg.thumb.jpg', 1, 157),
(127, 60, 'data/files/store_2/goods/20230820162807226.jpg', 'data/files/store_2/goods/20230820162807226.jpg.thumb.jpg', 1, 156),
(126, 61, 'data/files/store_2/goods/20230820162756624.jpg', 'data/files/store_2/goods/20230820162756624.jpg.thumb.jpg', 1, 155),
(125, 62, 'data/files/store_2/goods/20230820162739715.png', 'data/files/store_2/goods/20230820162739715.png.thumb.png', 1, 154),
(123, 54, 'data/files/store_2/goods/20230820162651830.png', 'data/files/store_2/goods/20230820162651830.png.thumb.png', 1, 152),
(134, 52, 'data/files/store_2/goods/20230820163017580.jpg', 'data/files/store_2/goods/20230820163017580.jpg.thumb.jpg', 1, 163),
(150, 6, 'data/files/store_2/goods/20230820163738317.jpg', 'data/files/store_2/goods/20230820163738317.jpg.thumb.jpg', 1, 179),
(124, 63, 'data/files/store_2/goods/20230820162720730.jpg', 'data/files/store_2/goods/20230820162720730.jpg.thumb.jpg', 1, 153),
(147, 10, 'data/files/store_2/goods/20230820163605738.jpg', 'data/files/store_2/goods/20230820163605738.jpg.thumb.jpg', 1, 176),
(144, 43, 'data/files/store_2/goods/20230820163452303.jpg', 'data/files/store_2/goods/20230820163452303.jpg.thumb.jpg', 1, 173),
(148, 8, 'data/files/store_2/goods/20230820163702147.png', 'data/files/store_2/goods/20230820163702147.png.thumb.png', 1, 177),
(149, 7, 'data/files/store_2/goods/20230820163720658.jpg', 'data/files/store_2/goods/20230820163720658.jpg.thumb.jpg', 1, 178),
(145, 42, 'data/files/store_2/goods/20230820163512392.jpg', 'data/files/store_2/goods/20230820163512392.jpg.thumb.jpg', 1, 174),
(151, 64, 'data/files/store_2/goods/20230822145507332.jpg', 'data/files/store_2/goods/20230822145507332.jpg.thumb.jpg', 1, 180),
(143, 44, 'data/files/store_2/goods/20230820163424847.jpg', 'data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', 1, 172),
(142, 45, 'data/files/store_2/goods/20230820163355480.png', 'data/files/store_2/goods/20230820163355480.png.thumb.png', 1, 171),
(141, 46, 'data/files/store_2/goods/20230820163335872.jpg', 'data/files/store_2/goods/20230820163335872.jpg.thumb.jpg', 1, 170),
(139, 48, 'data/files/store_2/goods/20230820163253695.jpg', 'data/files/store_2/goods/20230820163253695.jpg.thumb.jpg', 1, 168),
(138, 49, 'data/files/store_2/goods/20230820163231543.jpg', 'data/files/store_2/goods/20230820163231543.jpg.thumb.jpg', 1, 167),
(137, 50, 'data/files/store_2/goods/20230820163210408.jpg', 'data/files/store_2/goods/20230820163210408.jpg.thumb.jpg', 1, 166),
(136, 51, 'data/files/store_2/goods/20230820163134314.jpg', 'data/files/store_2/goods/20230820163134314.jpg.thumb.jpg', 1, 165),
(140, 47, 'data/files/store_2/goods/20230820163315888.jpg', 'data/files/store_2/goods/20230820163315888.jpg.thumb.jpg', 1, 169),
(165, 77, 'data/files/store_2/goods/20230822171124479.jpg', 'data/files/store_2/goods/20230822171124479.jpg.thumb.jpg', 1, 194),
(166, 78, 'data/files/store_2/goods/20230822171243862.jpg', 'data/files/store_2/goods/20230822171243862.jpg.thumb.jpg', 1, 195),
(167, 79, 'data/files/store_2/goods/20230822171409819.jpg', 'data/files/store_2/goods/20230822171409819.jpg.thumb.jpg', 1, 196),
(168, 80, 'data/files/store_2/goods/20230822171447383.jpg', 'data/files/store_2/goods/20230822171447383.jpg.thumb.jpg', 1, 197),
(169, 81, 'data/files/store_2/goods/20230822171554165.jpg', 'data/files/store_2/goods/20230822171554165.jpg.thumb.jpg', 1, 198),
(170, 82, 'data/files/store_2/goods/20230822171701600.jpg', 'data/files/store_2/goods/20230822171701600.jpg.thumb.jpg', 1, 199),
(172, 83, 'data/files/store_2/goods/20230822171855630.png', 'data/files/store_2/goods/20230822171855630.png.thumb.png', 1, 201),
(173, 84, 'data/files/store_2/goods/20230822175110176.jpg', 'data/files/store_2/goods/20230822175110176.jpg.thumb.jpg', 1, 202),
(175, 85, 'data/files/store_2/goods/20230905225155151.jpg', 'data/files/store_2/goods/20230905225155151.jpg.thumb.jpg', 1, 204),
(176, 86, 'data/files/store_2/goods/20230905225241659.jpg', 'data/files/store_2/goods/20230905225241659.jpg.thumb.jpg', 1, 205),
(177, 88, 'data/files/store_2/goods/20230905225415848.jpg', 'data/files/store_2/goods/20230905225415848.jpg.thumb.jpg', 1, 206),
(178, 87, 'data/files/store_2/goods/20230905225443648.jpg', 'data/files/store_2/goods/20230905225443648.jpg.thumb.jpg', 1, 207),
(179, 89, 'data/files/store_2/goods/20230905225659608.jpg', 'data/files/store_2/goods/20230905225659608.jpg.thumb.jpg', 1, 208),
(180, 90, 'data/files/store_2/goods/20230905225742483.jpg', 'data/files/store_2/goods/20230905225742483.jpg.thumb.jpg', 1, 209),
(181, 91, 'data/files/store_2/goods/20230905225852790.jpg', 'data/files/store_2/goods/20230905225852790.jpg.thumb.jpg', 1, 210),
(182, 92, 'data/files/store_2/goods/20230905225940225.jpg', 'data/files/store_2/goods/20230905225940225.jpg.thumb.jpg', 1, 211),
(183, 93, 'data/files/store_2/goods/20230905230044822.jpg', 'data/files/store_2/goods/20230905230044822.jpg.thumb.jpg', 1, 212),
(184, 94, 'data/files/store_2/goods/20230905230145245.jpg', 'data/files/store_2/goods/20230905230145245.jpg.thumb.jpg', 1, 213),
(185, 95, 'data/files/store_2/goods/20230905230231893.jpg', 'data/files/store_2/goods/20230905230231893.jpg.thumb.jpg', 1, 214),
(186, 96, 'data/files/store_2/goods/20230905230342868.jpg', 'data/files/store_2/goods/20230905230342868.jpg.thumb.jpg', 1, 215),
(187, 97, 'data/files/store_2/goods/20230905230421786.jpg', 'data/files/store_2/goods/20230905230421786.jpg.thumb.jpg', 1, 216),
(188, 98, 'data/files/store_2/goods/20230905230528613.jpg', 'data/files/store_2/goods/20230905230528613.jpg.thumb.jpg', 1, 217),
(189, 0, 'data/files/store_2/goods/20230905230750469.jpg', 'data/files/store_2/goods/20230905230750469.jpg.thumb.jpg', 255, 218),
(190, 99, 'data/files/store_2/goods/20230905230818991.jpg', 'data/files/store_2/goods/20230905230818991.jpg.thumb.jpg', 1, 219),
(191, 100, 'data/files/store_2/goods/20230905230914272.jpg', 'data/files/store_2/goods/20230905230914272.jpg.thumb.jpg', 1, 220),
(192, 101, 'data/files/store_2/goods/20230905231102967.jpg', 'data/files/store_2/goods/20230905231102967.jpg.thumb.jpg', 1, 221),
(193, 102, 'data/files/store_2/goods/20230905231140907.jpg', 'data/files/store_2/goods/20230905231140907.jpg.thumb.jpg', 1, 222),
(194, 103, 'data/files/store_2/goods/20230905231225186.jpg', 'data/files/store_2/goods/20230905231225186.jpg.thumb.jpg', 1, 223),
(195, 104, 'data/files/store_2/goods/20230905231258376.jpg', 'data/files/store_2/goods/20230905231258376.jpg.thumb.jpg', 1, 224),
(196, 105, 'data/files/store_2/goods/20230905231342932.jpg', 'data/files/store_2/goods/20230905231342932.jpg.thumb.jpg', 1, 225),
(197, 106, 'data/files/store_2/goods/20230905231523287.jpg', 'data/files/store_2/goods/20230905231523287.jpg.thumb.jpg', 1, 226),
(198, 107, 'data/files/store_2/goods/20230905231555579.jpg', 'data/files/store_2/goods/20230905231555579.jpg.thumb.jpg', 1, 227),
(199, 108, 'data/files/store_2/goods/20230905231652463.jpg', 'data/files/store_2/goods/20230905231652463.jpg.thumb.jpg', 1, 228),
(200, 109, 'data/files/store_2/goods/20230905231732325.jpg', 'data/files/store_2/goods/20230905231732325.jpg.thumb.jpg', 1, 229),
(201, 110, 'data/files/store_2/goods/20230905231807933.jpg', 'data/files/store_2/goods/20230905231807933.jpg.thumb.jpg', 1, 230),
(202, 111, 'data/files/store_2/goods/20230906132404473.jpg', 'data/files/store_2/goods/20230906132404473.jpg.thumb.jpg', 1, 231),
(203, 112, 'data/files/store_2/goods/20230906132501628.jpg', 'data/files/store_2/goods/20230906132501628.jpg.thumb.jpg', 1, 232),
(204, 113, 'data/files/store_2/goods/20230906132531188.jpg', 'data/files/store_2/goods/20230906132531188.jpg.thumb.jpg', 1, 233),
(205, 114, 'data/files/store_2/goods/20230906132606251.jpg', 'data/files/store_2/goods/20230906132606251.jpg.thumb.jpg', 1, 234),
(434, 115, 'data/files/store_2/goods/20231105155032799.jpg', 'data/files/store_2/goods/20231105155032799.jpg.thumb.jpg', 1, 631),
(207, 116, 'data/files/store_2/goods/20230906132714191.jpg', 'data/files/store_2/goods/20230906132714191.jpg.thumb.jpg', 1, 236),
(208, 117, 'data/files/store_2/goods/20230906132809114.jpg', 'data/files/store_2/goods/20230906132809114.jpg.thumb.jpg', 1, 237),
(209, 118, 'data/files/store_2/goods/20230906132843770.jpg', 'data/files/store_2/goods/20230906132843770.jpg.thumb.jpg', 1, 238),
(210, 119, 'data/files/store_2/goods/20230906132943470.jpg', 'data/files/store_2/goods/20230906132943470.jpg.thumb.jpg', 1, 239),
(211, 120, 'data/files/store_2/goods/20230906133013290.jpg', 'data/files/store_2/goods/20230906133013290.jpg.thumb.jpg', 1, 240),
(212, 121, 'data/files/store_2/goods/20230906133056204.jpg', 'data/files/store_2/goods/20230906133056204.jpg.thumb.jpg', 1, 241),
(404, 314, 'data/files/store_2/goods/20231009091251563.jpg', 'data/files/store_2/goods/20231009091251563.jpg.thumb.jpg', 1, 580),
(214, 123, 'data/files/store_2/goods/20230906133408536.jpg', 'data/files/store_2/goods/20230906133408536.jpg.thumb.jpg', 1, 243),
(215, 124, 'data/files/store_2/goods/20230906134322284.jpg', 'data/files/store_2/goods/20230906134322284.jpg.thumb.jpg', 1, 244),
(216, 125, 'data/files/store_2/goods/20230906134407471.jpg', 'data/files/store_2/goods/20230906134407471.jpg.thumb.jpg', 1, 245),
(217, 126, 'data/files/store_2/goods/20230906134444198.jpg', 'data/files/store_2/goods/20230906134444198.jpg.thumb.jpg', 1, 246),
(218, 127, 'data/files/store_2/goods/20230906134533521.jpg', 'data/files/store_2/goods/20230906134533521.jpg.thumb.jpg', 1, 247),
(219, 128, 'data/files/store_2/goods/20230906134604649.jpg', 'data/files/store_2/goods/20230906134604649.jpg.thumb.jpg', 1, 248),
(220, 129, 'data/files/store_2/goods/20230906134640579.jpg', 'data/files/store_2/goods/20230906134640579.jpg.thumb.jpg', 1, 249),
(221, 130, 'data/files/store_2/goods/20230906134710465.jpg', 'data/files/store_2/goods/20230906134710465.jpg.thumb.jpg', 1, 250),
(222, 131, 'data/files/store_2/goods/20230906134739749.jpg', 'data/files/store_2/goods/20230906134739749.jpg.thumb.jpg', 1, 251),
(223, 132, 'data/files/store_2/goods/20230906134807674.jpg', 'data/files/store_2/goods/20230906134807674.jpg.thumb.jpg', 1, 252),
(224, 133, 'data/files/store_2/goods/20230906135307943.jpg', 'data/files/store_2/goods/20230906135307943.jpg.thumb.jpg', 1, 253),
(225, 134, 'data/files/store_2/goods/20230906135334486.jpg', 'data/files/store_2/goods/20230906135334486.jpg.thumb.jpg', 1, 254),
(226, 135, 'data/files/store_2/goods/20230906135404776.jpg', 'data/files/store_2/goods/20230906135404776.jpg.thumb.jpg', 1, 255),
(227, 136, 'data/files/store_2/goods/20230906135431715.jpg', 'data/files/store_2/goods/20230906135431715.jpg.thumb.jpg', 1, 256),
(228, 137, 'data/files/store_2/goods/20230906135506605.jpg', 'data/files/store_2/goods/20230906135506605.jpg.thumb.jpg', 1, 257),
(229, 138, 'data/files/store_2/goods/20230906135620621.jpg', 'data/files/store_2/goods/20230906135620621.jpg.thumb.jpg', 1, 258),
(230, 140, 'data/files/store_2/goods/20230906135723249.jpg', 'data/files/store_2/goods/20230906135723249.jpg.thumb.jpg', 1, 259),
(231, 141, 'data/files/store_2/goods/20230906135756606.jpg', 'data/files/store_2/goods/20230906135756606.jpg.thumb.jpg', 1, 260),
(232, 142, 'data/files/store_2/goods/20230912134146790.jpg', 'data/files/store_2/goods/20230912134146790.jpg.thumb.jpg', 1, 261),
(233, 143, 'data/files/store_2/goods/20230912134307959.jpg', 'data/files/store_2/goods/20230912134307959.jpg.thumb.jpg', 1, 262),
(234, 144, 'data/files/store_2/goods/20230912134406907.jpg', 'data/files/store_2/goods/20230912134406907.jpg.thumb.jpg', 1, 263),
(235, 145, 'data/files/store_2/goods/20230912134444599.jpg', 'data/files/store_2/goods/20230912134444599.jpg.thumb.jpg', 1, 264),
(236, 146, 'data/files/store_2/goods/20230912134520533.jpg', 'data/files/store_2/goods/20230912134520533.jpg.thumb.jpg', 1, 265),
(237, 147, 'data/files/store_2/goods/20230912134557383.jpg', 'data/files/store_2/goods/20230912134557383.jpg.thumb.jpg', 1, 266),
(238, 148, 'data/files/store_2/goods/20230912134637795.jpg', 'data/files/store_2/goods/20230912134637795.jpg.thumb.jpg', 1, 267),
(239, 149, 'data/files/store_2/goods/20230912134712892.jpg', 'data/files/store_2/goods/20230912134712892.jpg.thumb.jpg', 1, 268),
(240, 150, 'data/files/store_2/goods/20230912134750593.jpg', 'data/files/store_2/goods/20230912134750593.jpg.thumb.jpg', 1, 269),
(241, 151, 'data/files/store_2/goods/20230912134835768.jpg', 'data/files/store_2/goods/20230912134835768.jpg.thumb.jpg', 1, 270),
(242, 152, 'data/files/store_2/goods/20230912134920290.jpg', 'data/files/store_2/goods/20230912134920290.jpg.thumb.jpg', 1, 271),
(243, 153, 'data/files/store_2/goods/20230912135030883.jpg', 'data/files/store_2/goods/20230912135030883.jpg.thumb.jpg', 1, 272),
(244, 154, 'data/files/store_2/goods/20230912135244690.jpg', 'data/files/store_2/goods/20230912135244690.jpg.thumb.jpg', 1, 273),
(245, 155, 'data/files/store_2/goods/20230912135344276.jpg', 'data/files/store_2/goods/20230912135344276.jpg.thumb.jpg', 1, 274),
(246, 156, 'data/files/store_2/goods/20230912135643567.jpg', 'data/files/store_2/goods/20230912135643567.jpg.thumb.jpg', 1, 275),
(247, 157, 'data/files/store_2/goods/20230912135727364.jpg', 'data/files/store_2/goods/20230912135727364.jpg.thumb.jpg', 1, 276),
(248, 158, 'data/files/store_2/goods/20230912135809446.jpg', 'data/files/store_2/goods/20230912135809446.jpg.thumb.jpg', 1, 277),
(249, 159, 'data/files/store_2/goods/20230912135854607.jpg', 'data/files/store_2/goods/20230912135854607.jpg.thumb.jpg', 1, 278),
(250, 160, 'data/files/store_2/goods/20230912135935893.jpg', 'data/files/store_2/goods/20230912135935893.jpg.thumb.jpg', 1, 279),
(251, 161, 'data/files/store_2/goods/20230912140012467.jpg', 'data/files/store_2/goods/20230912140012467.jpg.thumb.jpg', 1, 280),
(252, 162, 'data/files/store_2/goods/20230912140049428.jpg', 'data/files/store_2/goods/20230912140049428.jpg.thumb.jpg', 1, 281),
(253, 163, 'data/files/store_2/goods/20230912140127490.jpg', 'data/files/store_2/goods/20230912140127490.jpg.thumb.jpg', 1, 282),
(254, 164, 'data/files/store_2/goods/20230912140158461.jpg', 'data/files/store_2/goods/20230912140158461.jpg.thumb.jpg', 1, 283),
(255, 165, 'data/files/store_2/goods/20230912140234474.jpg', 'data/files/store_2/goods/20230912140234474.jpg.thumb.jpg', 1, 284),
(256, 166, 'data/files/store_2/goods/20230912140310203.jpg', 'data/files/store_2/goods/20230912140310203.jpg.thumb.jpg', 1, 285),
(257, 167, 'data/files/store_2/goods/20230912140359105.jpg', 'data/files/store_2/goods/20230912140359105.jpg.thumb.jpg', 1, 286),
(258, 168, 'data/files/store_2/goods/20230912140432478.jpg', 'data/files/store_2/goods/20230912140432478.jpg.thumb.jpg', 1, 287),
(259, 169, 'data/files/store_2/goods/20230912140539152.jpg', 'data/files/store_2/goods/20230912140539152.jpg.thumb.jpg', 1, 288),
(260, 170, 'data/files/store_2/goods/20230912140632926.jpg', 'data/files/store_2/goods/20230912140632926.jpg.thumb.jpg', 1, 289),
(261, 171, 'data/files/store_2/goods/20230912140741904.jpg', 'data/files/store_2/goods/20230912140741904.jpg.thumb.jpg', 1, 290),
(262, 172, 'data/files/store_2/goods/20230912140846551.jpg', 'data/files/store_2/goods/20230912140846551.jpg.thumb.jpg', 1, 291),
(263, 173, 'data/files/store_2/goods/20230912142850691.jpg', 'data/files/store_2/goods/20230912142850691.jpg.thumb.jpg', 1, 292),
(264, 174, 'data/files/store_2/goods/20230912142924247.jpg', 'data/files/store_2/goods/20230912142924247.jpg.thumb.jpg', 1, 293),
(265, 175, 'data/files/store_2/goods/20230912143000269.jpg', 'data/files/store_2/goods/20230912143000269.jpg.thumb.jpg', 1, 294),
(266, 176, 'data/files/store_2/goods/20230912143030605.jpg', 'data/files/store_2/goods/20230912143030605.jpg.thumb.jpg', 1, 295),
(267, 177, 'data/files/store_2/goods/20230912143056843.jpg', 'data/files/store_2/goods/20230912143056843.jpg.thumb.jpg', 1, 296),
(270, 179, 'data/files/store_2/goods/20230912143228987.jpg', 'data/files/store_2/goods/20230912143228987.jpg.thumb.jpg', 1, 299),
(269, 178, 'data/files/store_2/goods/20230912143158201.jpg', 'data/files/store_2/goods/20230912143158201.jpg.thumb.jpg', 1, 298),
(271, 180, 'data/files/store_2/goods/20230912143259633.jpg', 'data/files/store_2/goods/20230912143259633.jpg.thumb.jpg', 1, 300),
(272, 181, 'data/files/store_2/goods/20230912143337904.jpg', 'data/files/store_2/goods/20230912143337904.jpg.thumb.jpg', 1, 301),
(273, 182, 'data/files/store_2/goods/20230912143407389.jpg', 'data/files/store_2/goods/20230912143407389.jpg.thumb.jpg', 1, 302),
(274, 183, 'data/files/store_2/goods/20230912143442477.jpg', 'data/files/store_2/goods/20230912143442477.jpg.thumb.jpg', 1, 303),
(275, 184, 'data/files/store_2/goods/20230912143514250.jpg', 'data/files/store_2/goods/20230912143514250.jpg.thumb.jpg', 1, 304),
(276, 185, 'data/files/store_2/goods/20230912143550941.jpg', 'data/files/store_2/goods/20230912143550941.jpg.thumb.jpg', 1, 305),
(277, 186, 'data/files/store_2/goods/20230912143628126.jpg', 'data/files/store_2/goods/20230912143628126.jpg.thumb.jpg', 1, 306),
(280, 188, 'data/files/store_2/goods/20230912143808711.jpg', 'data/files/store_2/goods/20230912143808711.jpg.thumb.jpg', 1, 309),
(279, 187, 'data/files/store_2/goods/20230912143732198.jpg', 'data/files/store_2/goods/20230912143732198.jpg.thumb.jpg', 1, 308),
(281, 189, 'data/files/store_2/goods/20230912143843698.jpg', 'data/files/store_2/goods/20230912143843698.jpg.thumb.jpg', 1, 310),
(282, 190, 'data/files/store_2/goods/20230912143959657.jpg', 'data/files/store_2/goods/20230912143959657.jpg.thumb.jpg', 1, 311),
(283, 191, 'data/files/store_2/goods/20230912144031439.jpg', 'data/files/store_2/goods/20230912144031439.jpg.thumb.jpg', 1, 312),
(284, 192, 'data/files/store_2/goods/20230912144100588.jpg', 'data/files/store_2/goods/20230912144100588.jpg.thumb.jpg', 1, 313),
(285, 193, 'data/files/store_2/goods/20230912144214770.jpg', 'data/files/store_2/goods/20230912144214770.jpg.thumb.jpg', 1, 314),
(286, 194, 'data/files/store_2/goods/20230912144246158.jpg', 'data/files/store_2/goods/20230912144246158.jpg.thumb.jpg', 1, 315),
(287, 195, 'data/files/store_2/goods/20230912144315530.jpg', 'data/files/store_2/goods/20230912144315530.jpg.thumb.jpg', 1, 316),
(288, 196, 'data/files/store_2/goods/20230912144358166.jpg', 'data/files/store_2/goods/20230912144358166.jpg.thumb.jpg', 1, 317),
(289, 197, 'data/files/store_2/goods/20230912144433729.jpg', 'data/files/store_2/goods/20230912144433729.jpg.thumb.jpg', 1, 318),
(290, 198, 'data/files/store_2/goods/20230912144511561.jpg', 'data/files/store_2/goods/20230912144511561.jpg.thumb.jpg', 1, 319),
(291, 199, 'data/files/store_2/goods/20230912144613577.jpg', 'data/files/store_2/goods/20230912144613577.jpg.thumb.jpg', 1, 320),
(292, 200, 'data/files/store_2/goods/20230912144652184.jpg', 'data/files/store_2/goods/20230912144652184.jpg.thumb.jpg', 1, 321),
(293, 201, 'data/files/store_2/goods/20230912144723314.jpg', 'data/files/store_2/goods/20230912144723314.jpg.thumb.jpg', 1, 322),
(294, 202, 'data/files/store_2/goods/20230912144755360.jpg', 'data/files/store_2/goods/20230912144755360.jpg.thumb.jpg', 1, 323),
(295, 203, 'data/files/store_2/goods/20230912144828953.jpg', 'data/files/store_2/goods/20230912144828953.jpg.thumb.jpg', 1, 324),
(296, 204, 'data/files/store_2/goods/20230912144908920.jpg', 'data/files/store_2/goods/20230912144908920.jpg.thumb.jpg', 1, 325),
(297, 205, 'data/files/store_2/goods/20230912144939534.jpg', 'data/files/store_2/goods/20230912144939534.jpg.thumb.jpg', 1, 326),
(298, 206, 'data/files/store_2/goods/20230912145005385.jpg', 'data/files/store_2/goods/20230912145005385.jpg.thumb.jpg', 1, 327),
(299, 207, 'data/files/store_2/goods/20230912151927939.jpg', 'data/files/store_2/goods/20230912151927939.jpg.thumb.jpg', 1, 328),
(300, 208, 'data/files/store_2/goods/20230912160417438.jpg', 'data/files/store_2/goods/20230912160417438.jpg.thumb.jpg', 1, 335),
(301, 139, 'data/files/store_2/goods/20230912161934651.jpg', 'data/files/store_2/goods/20230912161934651.jpg.thumb.jpg', 1, 340),
(302, 209, 'data/files/store_2/goods/20230912162013635.jpg', 'data/files/store_2/goods/20230912162013635.jpg.thumb.jpg', 1, 341),
(303, 210, 'data/files/store_2/goods/20230912162045391.jpg', 'data/files/store_2/goods/20230912162045391.jpg.thumb.jpg', 1, 342),
(304, 211, 'data/files/store_2/goods/20230912162114176.jpg', 'data/files/store_2/goods/20230912162114176.jpg.thumb.jpg', 1, 343),
(305, 212, 'data/files/store_2/goods/20230912162146434.jpg', 'data/files/store_2/goods/20230912162146434.jpg.thumb.jpg', 1, 344),
(306, 213, 'data/files/store_2/goods/20230912162215624.jpg', 'data/files/store_2/goods/20230912162215624.jpg.thumb.jpg', 1, 345),
(307, 214, 'data/files/store_2/goods/20230912162244648.jpg', 'data/files/store_2/goods/20230912162244648.jpg.thumb.jpg', 1, 346),
(308, 215, 'data/files/store_2/goods/20230912162313130.jpg', 'data/files/store_2/goods/20230912162313130.jpg.thumb.jpg', 1, 347),
(309, 216, 'data/files/store_2/goods/20230912162339569.jpg', 'data/files/store_2/goods/20230912162339569.jpg.thumb.jpg', 1, 348),
(310, 217, 'data/files/store_2/goods/20230912162406246.jpg', 'data/files/store_2/goods/20230912162406246.jpg.thumb.jpg', 1, 349),
(311, 218, 'data/files/store_2/goods/20230912162435121.jpg', 'data/files/store_2/goods/20230912162435121.jpg.thumb.jpg', 1, 350),
(312, 219, 'data/files/store_2/goods/20230912162500135.jpg', 'data/files/store_2/goods/20230912162500135.jpg.thumb.jpg', 1, 351),
(313, 220, 'data/files/store_2/goods/20230912162528608.jpg', 'data/files/store_2/goods/20230912162528608.jpg.thumb.jpg', 1, 352),
(314, 221, 'data/files/store_2/goods/20230912162554813.jpg', 'data/files/store_2/goods/20230912162554813.jpg.thumb.jpg', 1, 353),
(315, 222, 'data/files/store_2/goods/20230914083605623.jpg', 'data/files/store_2/goods/20230914083605623.jpg.thumb.jpg', 1, 354),
(316, 222, 'data/files/store_2/goods/20230914083619251.jpg', 'data/files/store_2/goods/20230914083619251.jpg.thumb.jpg', 255, 355),
(317, 223, 'data/files/store_2/goods/20230914083822175.jpg', 'data/files/store_2/goods/20230914083822175.jpg.thumb.jpg', 255, 360),
(318, 223, 'data/files/store_2/goods/20230914083834924.jpg', 'data/files/store_2/goods/20230914083834924.jpg.thumb.jpg', 1, 361),
(319, 0, 'data/files/store_2/goods/20230914093329394.jpg', 'data/files/store_2/goods/20230914093329394.jpg.thumb.jpg', 255, 376),
(320, 224, 'data/files/store_2/goods/20230914102039526.jpg', 'data/files/store_2/goods/20230914102039526.jpg.thumb.jpg', 1, 377),
(321, 225, 'data/files/store_2/goods/20230914102320961.jpg', 'data/files/store_2/goods/20230914102320961.jpg.thumb.jpg', 1, 378),
(322, 226, 'data/files/store_2/goods/20230914102402247.jpg', 'data/files/store_2/goods/20230914102402247.jpg.thumb.jpg', 1, 379),
(323, 227, 'data/files/store_2/goods/20230914102433103.jpg', 'data/files/store_2/goods/20230914102433103.jpg.thumb.jpg', 1, 380),
(324, 228, 'data/files/store_2/goods/20230914102638598.jpg', 'data/files/store_2/goods/20230914102638598.jpg.thumb.jpg', 1, 381),
(325, 229, 'data/files/store_2/goods/20230914102725861.jpg', 'data/files/store_2/goods/20230914102725861.jpg.thumb.jpg', 1, 382),
(326, 230, 'data/files/store_2/goods/20230914102813622.jpg', 'data/files/store_2/goods/20230914102813622.jpg.thumb.jpg', 1, 383),
(327, 231, 'data/files/store_2/goods/20230914102902794.jpg', 'data/files/store_2/goods/20230914102902794.jpg.thumb.jpg', 1, 384),
(330, 233, 'data/files/store_2/goods/20230914103049920.jpg', 'data/files/store_2/goods/20230914103049920.jpg.thumb.jpg', 1, 387),
(329, 232, 'data/files/store_2/goods/20230914103010480.jpg', 'data/files/store_2/goods/20230914103010480.jpg.thumb.jpg', 1, 386),
(331, 234, 'data/files/store_2/goods/20230914103121428.jpg', 'data/files/store_2/goods/20230914103121428.jpg.thumb.jpg', 1, 388),
(332, 235, 'data/files/store_2/goods/20230914103200942.jpg', 'data/files/store_2/goods/20230914103200942.jpg.thumb.jpg', 1, 389),
(333, 236, 'data/files/store_2/goods/20230914103237717.jpg', 'data/files/store_2/goods/20230914103237717.jpg.thumb.jpg', 1, 390),
(334, 237, 'data/files/store_2/goods/20230914103335144.jpg', 'data/files/store_2/goods/20230914103335144.jpg.thumb.jpg', 1, 391),
(335, 238, 'data/files/store_2/goods/20230914103414143.jpg', 'data/files/store_2/goods/20230914103414143.jpg.thumb.jpg', 1, 392),
(336, 239, 'data/files/store_2/goods/20230914103455984.jpg', 'data/files/store_2/goods/20230914103455984.jpg.thumb.jpg', 1, 393),
(337, 240, 'data/files/store_2/goods/20230914103600764.jpg', 'data/files/store_2/goods/20230914103600764.jpg.thumb.jpg', 1, 394),
(338, 241, 'data/files/store_2/goods/20230914103636377.jpg', 'data/files/store_2/goods/20230914103636377.jpg.thumb.jpg', 1, 395),
(339, 242, 'data/files/store_2/goods/20230914103718483.jpg', 'data/files/store_2/goods/20230914103718483.jpg.thumb.jpg', 1, 396),
(340, 243, 'data/files/store_2/goods/20230914103813891.jpg', 'data/files/store_2/goods/20230914103813891.jpg.thumb.jpg', 1, 397),
(341, 244, 'data/files/store_2/goods/20230914103912121.jpg', 'data/files/store_2/goods/20230914103912121.jpg.thumb.jpg', 1, 398),
(342, 245, 'data/files/store_2/goods/20230914104157577.jpg', 'data/files/store_2/goods/20230914104157577.jpg.thumb.jpg', 1, 399),
(343, 246, 'data/files/store_2/goods/20230914104231238.jpg', 'data/files/store_2/goods/20230914104231238.jpg.thumb.jpg', 1, 400),
(344, 247, 'data/files/store_2/goods/20230914104307736.jpg', 'data/files/store_2/goods/20230914104307736.jpg.thumb.jpg', 1, 401),
(345, 248, 'data/files/store_2/goods/20230914104336674.jpg', 'data/files/store_2/goods/20230914104336674.jpg.thumb.jpg', 1, 402),
(346, 249, 'data/files/store_2/goods/20230914104533945.jpg', 'data/files/store_2/goods/20230914104533945.jpg.thumb.jpg', 1, 403),
(347, 250, 'data/files/store_2/goods/20230914104612930.jpg', 'data/files/store_2/goods/20230914104612930.jpg.thumb.jpg', 1, 404),
(348, 251, 'data/files/store_2/goods/20230914104637823.jpg', 'data/files/store_2/goods/20230914104637823.jpg.thumb.jpg', 1, 405),
(349, 252, 'data/files/store_2/goods/20230914104714989.jpg', 'data/files/store_2/goods/20230914104714989.jpg.thumb.jpg', 1, 406),
(350, 253, 'data/files/store_2/goods/20230914104742838.jpg', 'data/files/store_2/goods/20230914104742838.jpg.thumb.jpg', 1, 407),
(351, 254, 'data/files/store_2/goods/20230914104808586.jpg', 'data/files/store_2/goods/20230914104808586.jpg.thumb.jpg', 1, 408),
(352, 255, 'data/files/store_2/goods/20230914105756410.jpg', 'data/files/store_2/goods/20230914105756410.jpg.thumb.jpg', 1, 409),
(353, 256, 'data/files/store_2/goods/20230914105830442.jpg', 'data/files/store_2/goods/20230914105830442.jpg.thumb.jpg', 1, 410),
(354, 257, 'data/files/store_2/goods/20230914105859583.jpg', 'data/files/store_2/goods/20230914105859583.jpg.thumb.jpg', 1, 411),
(355, 258, 'data/files/store_2/goods/20230914105928362.jpg', 'data/files/store_2/goods/20230914105928362.jpg.thumb.jpg', 1, 412),
(365, 266, 'data/files/store_2/goods/20230916094227669.jpg', 'data/files/store_2/goods/20230916094227669.jpg.thumb.jpg', 1, 494),
(357, 260, 'data/files/store_2/goods/20230915105311185.jpg', 'data/files/store_2/goods/20230915105311185.jpg.thumb.jpg', 1, 486),
(364, 261, 'data/files/store_2/goods/20230915110305785.jpg', 'data/files/store_2/goods/20230915110305785.jpg.thumb.jpg', 1, 493),
(359, 262, 'data/files/store_2/goods/20230915105454461.png', 'data/files/store_2/goods/20230915105454461.png.thumb.png', 1, 488),
(360, 263, 'data/files/store_2/goods/20230915105637425.jpg', 'data/files/store_2/goods/20230915105637425.jpg.thumb.jpg', 1, 489),
(361, 264, 'data/files/store_2/goods/20230915105738522.jpg', 'data/files/store_2/goods/20230915105738522.jpg.thumb.jpg', 1, 490),
(362, 265, 'data/files/store_2/goods/20230915105831915.png', 'data/files/store_2/goods/20230915105831915.png.thumb.png', 1, 491),
(363, 259, 'data/files/store_2/goods/20230915110200190.jpg', 'data/files/store_2/goods/20230915110200190.jpg.thumb.jpg', 1, 492),
(366, 267, 'data/files/store_2/goods/20230923113140304.jpg', 'data/files/store_2/goods/20230923113140304.jpg.thumb.jpg', 1, 495),
(367, 268, 'data/files/store_2/goods/20230923141913673.jpg', 'data/files/store_2/goods/20230923141913673.jpg.thumb.jpg', 255, 496),
(368, 268, 'data/files/store_2/goods/20230923152648845.jpg', 'data/files/store_2/goods/20230923152648845.jpg.thumb.jpg', 1, 497),
(369, 269, 'data/files/store_2/goods/20230923161922324.jpg', 'data/files/store_2/goods/20230923161922324.jpg.thumb.jpg', 255, 498),
(370, 269, 'data/files/store_2/goods/20230923162203793.jpg', 'data/files/store_2/goods/20230923162203793.jpg.thumb.jpg', 1, 502),
(371, 270, 'data/files/store_2/goods/20230925162814523.jpg', 'data/files/store_2/goods/20230925162814523.jpg.thumb.jpg', 1, 503),
(372, 271, 'data/files/store_2/goods/20230925163616972.jpg', 'data/files/store_2/goods/20230925163616972.jpg.thumb.jpg', 1, 504),
(373, 271, 'data/files/store_2/goods/20230925163622707.jpg', 'data/files/store_2/goods/20230925163622707.jpg.thumb.jpg', 255, 505),
(374, 272, 'data/files/store_2/goods/20230925163723746.jpg', 'data/files/store_2/goods/20230925163723746.jpg.thumb.jpg', 1, 506),
(375, 276, 'data/files/store_2/goods/20230926110212183.png', 'data/files/store_2/goods/20230926110212183.png.thumb.png', 1, 512),
(376, 277, 'data/files/store_2/goods/20230926110306719.jpg', 'data/files/store_2/goods/20230926110306719.jpg.thumb.jpg', 1, 513),
(377, 278, 'data/files/store_2/goods/20230926110342616.jpg', 'data/files/store_2/goods/20230926110342616.jpg.thumb.jpg', 1, 514),
(378, 279, 'data/files/store_2/goods/20230926110432535.jpg', 'data/files/store_2/goods/20230926110432535.jpg.thumb.jpg', 1, 515),
(379, 275, 'data/files/store_2/goods/20230926110744947.jpg', 'data/files/store_2/goods/20230926110744947.jpg.thumb.jpg', 1, 516),
(380, 273, 'data/files/store_2/goods/20230926110807430.jpg', 'data/files/store_2/goods/20230926110807430.jpg.thumb.jpg', 1, 517),
(381, 280, 'data/files/store_2/goods/20230926111253309.jpg', 'data/files/store_2/goods/20230926111253309.jpg.thumb.jpg', 1, 518),
(382, 281, 'data/files/store_2/goods/20230926111340335.png', 'data/files/store_2/goods/20230926111340335.png.thumb.png', 1, 519),
(383, 282, 'data/files/store_2/goods/20230926111624688.jpg', 'data/files/store_2/goods/20230926111624688.jpg.thumb.jpg', 1, 520),
(384, 283, 'data/files/store_2/goods/20231002093419177.jpg', 'data/files/store_2/goods/20231002093419177.jpg.thumb.jpg', 1, 521),
(385, 284, 'data/files/store_2/goods/20231002093817782.jpg', 'data/files/store_2/goods/20231002093817782.jpg.thumb.jpg', 1, 523),
(387, 285, 'data/files/store_2/goods/20231002093927585.jpg', 'data/files/store_2/goods/20231002093927585.jpg.thumb.jpg', 1, 529),
(388, 286, 'data/files/store_2/goods/20231002094004430.jpg', 'data/files/store_2/goods/20231002094004430.jpg.thumb.jpg', 1, 534),
(389, 287, 'data/files/store_2/goods/20231002094137360.jpg', 'data/files/store_2/goods/20231002094137360.jpg.thumb.jpg', 1, 539),
(390, 274, 'data/files/store_2/goods/20231002095101221.jpg', 'data/files/store_2/goods/20231002095101221.jpg.thumb.jpg', 1, 540),
(391, 288, 'data/files/store_2/goods/20231002111859825.jpg', 'data/files/store_2/goods/20231002111859825.jpg.thumb.jpg', 1, 555),
(392, 298, 'data/files/store_2/goods/20231002145641403.jpg', 'data/files/store_2/goods/20231002145641403.jpg.thumb.jpg', 1, 556),
(393, 289, 'data/files/store_2/goods/20231002151048828.jpg', 'data/files/store_2/goods/20231002151048828.jpg.thumb.jpg', 1, 558),
(394, 303, 'data/files/store_2/goods/20231002151740424.jpg', 'data/files/store_2/goods/20231002151740424.jpg.thumb.jpg', 1, 560),
(396, 291, 'data/files/store_2/goods/20231002160734221.jpg', 'data/files/store_2/goods/20231002160734221.jpg.thumb.jpg', 1, 563),
(397, 306, 'data/files/store_2/goods/20231002161348957.jpg', 'data/files/store_2/goods/20231002161348957.jpg.thumb.jpg', 1, 564),
(398, 311, 'data/files/store_2/goods/20231003173031903.jpg', 'data/files/store_2/goods/20231003173031903.jpg.thumb.jpg', 1, 565),
(399, 310, 'data/files/store_2/goods/20231003173055801.jpg', 'data/files/store_2/goods/20231003173055801.jpg.thumb.jpg', 1, 567),
(400, 312, 'data/files/store_2/goods/20231003173225223.jpg', 'data/files/store_2/goods/20231003173225223.jpg.thumb.jpg', 1, 568),
(401, 313, 'data/files/store_2/goods/20231007120822127.jpg', 'data/files/store_2/goods/20231007120822127.jpg.thumb.jpg', 1, 571),
(402, 309, 'data/files/store_2/goods/20231008100208597.jpg', 'data/files/store_2/goods/20231008100208597.jpg.thumb.jpg', 1, 573),
(403, 308, 'data/files/store_2/goods/20231008100436875.jpg', 'data/files/store_2/goods/20231008100436875.jpg.thumb.jpg', 1, 574),
(405, 304, 'data/files/store_2/goods/20231010095722520.jpg', 'data/files/store_2/goods/20231010095722520.jpg.thumb.jpg', 1, 581),
(406, 315, 'data/files/store_2/goods/20231010122846565.jpg', 'data/files/store_2/goods/20231010122846565.jpg.thumb.jpg', 1, 586),
(407, 316, 'data/files/store_2/goods/20231010172255386.jpg', 'data/files/store_2/goods/20231010172255386.jpg.thumb.jpg', 1, 587),
(408, 317, 'data/files/store_2/goods/20231015161452348.jpg', 'data/files/store_2/goods/20231015161452348.jpg.thumb.jpg', 1, 588),
(409, 318, 'data/files/store_2/goods/20231015161614998.jpg', 'data/files/store_2/goods/20231015161614998.jpg.thumb.jpg', 1, 589),
(410, 319, 'data/files/store_2/goods/20231016122256634.jpg', 'data/files/store_2/goods/20231016122256634.jpg.thumb.jpg', 1, 590),
(411, 323, 'data/files/store_2/goods/20231019085245917.jpg', 'data/files/store_2/goods/20231019085245917.jpg.thumb.jpg', 1, 592),
(412, 324, 'data/files/store_2/goods/20231019095337390.jpg', 'data/files/store_2/goods/20231019095337390.jpg.thumb.jpg', 1, 594),
(413, 327, 'data/files/store_2/goods/20231019163506594.jpg', 'data/files/store_2/goods/20231019163506594.jpg.thumb.jpg', 1, 596),
(414, 325, 'data/files/store_2/goods/20231020094843941.jpg', 'data/files/store_2/goods/20231020094843941.jpg.thumb.jpg', 1, 597),
(415, 329, 'data/files/store_2/goods/20231020163455536.jpg', 'data/files/store_2/goods/20231020163455536.jpg.thumb.jpg', 1, 598),
(416, 330, 'data/files/store_2/goods/20231020163933407.jpg', 'data/files/store_2/goods/20231020163933407.jpg.thumb.jpg', 1, 602),
(430, 331, 'data/files/store_2/goods/20231104110206212.jpg', 'data/files/store_2/goods/20231104110206212.jpg.thumb.jpg', 1, 625),
(418, 332, 'data/files/store_2/goods/20231024093016180.jpg', 'data/files/store_2/goods/20231024093016180.jpg.thumb.jpg', 1, 605),
(431, 320, 'data/files/store_2/goods/20231104110223787.jpg', 'data/files/store_2/goods/20231104110223787.jpg.thumb.jpg', 1, 626),
(420, 334, 'data/files/store_2/goods/20231024093254451.jpg', 'data/files/store_2/goods/20231024093254451.jpg.thumb.jpg', 1, 607),
(421, 67, 'data/files/store_2/goods/20231024094011545.jpg', 'data/files/store_2/goods/20231024094011545.jpg.thumb.jpg', 1, 609),
(422, 335, 'data/files/store_2/goods/20231024094745537.jpg', 'data/files/store_2/goods/20231024094745537.jpg.thumb.jpg', 1, 610),
(423, 336, 'data/files/store_2/goods/20231024094911992.jpg', 'data/files/store_2/goods/20231024094911992.jpg.thumb.jpg', 1, 612),
(424, 338, 'data/files/store_2/goods/20231024144224646.jpg', 'data/files/store_2/goods/20231024144224646.jpg.thumb.jpg', 1, 614),
(425, 302, 'data/files/store_2/goods/20231024190752256.jpg', 'data/files/store_2/goods/20231024190752256.jpg.thumb.jpg', 1, 617),
(426, 339, 'data/files/store_2/goods/20231104104000646.jpg', 'data/files/store_2/goods/20231104104000646.jpg.thumb.jpg', 1, 621),
(427, 340, 'data/files/store_2/goods/20231104104120166.jpg', 'data/files/store_2/goods/20231104104120166.jpg.thumb.jpg', 1, 622),
(428, 341, 'data/files/store_2/goods/20231104104911332.jpg', 'data/files/store_2/goods/20231104104911332.jpg.thumb.jpg', 1, 623),
(429, 322, 'data/files/store_2/goods/20231104105439588.jpg', 'data/files/store_2/goods/20231104105439588.jpg.thumb.jpg', 1, 624),
(438, 343, 'data/files/store_2/goods/20231106114610185.jpg', 'data/files/store_2/goods/20231106114610185.jpg.thumb.jpg', 1, 641),
(437, 343, 'data/files/store_2/goods/20231106114539487.jpg', 'data/files/store_2/goods/20231106114539487.jpg.thumb.jpg', 255, 639),
(435, 344, 'data/files/store_2/goods/20231106114419319.jpg', 'data/files/store_2/goods/20231106114419319.jpg.thumb.jpg', 1, 636),
(439, 348, 'data/files/store_2/goods/20231112114302158.jpg', 'data/files/store_2/goods/20231112114302158.jpg.thumb.jpg', 1, 642);

-- --------------------------------------------------------

--
-- 表的结构 `swd_goods_integral`
--

CREATE TABLE `swd_goods_integral` (
  `goods_id` int(10) NOT NULL,
  `max_exchange` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_goods_integral`
--

INSERT INTO `swd_goods_integral` (`goods_id`, `max_exchange`) VALUES
(1, 80),
(2, 10),
(3, 10),
(4, 10),
(5, 10),
(6, 10),
(7, 10),
(8, 10),
(10, 10),
(11, 10),
(12, 10),
(13, 10),
(14, 10),
(15, 10),
(16, 10),
(17, 10),
(18, 10),
(19, 10),
(21, 10),
(27, 10);

-- --------------------------------------------------------

--
-- 表的结构 `swd_goods_prop`
--

CREATE TABLE `swd_goods_prop` (
  `pid` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `ptype` varchar(20) DEFAULT 'select',
  `is_color` int(1) DEFAULT '0',
  `status` int(1) DEFAULT '1',
  `sort_order` int(11) DEFAULT '255'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_goods_prop_value`
--

CREATE TABLE `swd_goods_prop_value` (
  `vid` int(11) UNSIGNED NOT NULL,
  `pid` int(11) DEFAULT '0',
  `pvalue` varchar(255) DEFAULT '',
  `color` varchar(255) DEFAULT '',
  `status` int(1) DEFAULT '1',
  `sort_order` int(11) DEFAULT '255'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_goods_pvs`
--

CREATE TABLE `swd_goods_pvs` (
  `goods_id` int(10) NOT NULL,
  `pvs` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_goods_qa`
--

CREATE TABLE `swd_goods_qa` (
  `ques_id` int(10) UNSIGNED NOT NULL,
  `question_content` varchar(255) DEFAULT '',
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `store_id` int(10) UNSIGNED DEFAULT '0',
  `email` varchar(60) DEFAULT '',
  `item_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `item_name` varchar(255) DEFAULT '',
  `reply_content` varchar(255) DEFAULT '',
  `time_post` int(10) UNSIGNED DEFAULT NULL,
  `time_reply` int(10) UNSIGNED DEFAULT NULL,
  `if_new` tinyint(3) UNSIGNED DEFAULT '1',
  `type` varchar(10) DEFAULT 'goods'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_goods_spec`
--

CREATE TABLE `swd_goods_spec` (
  `spec_id` int(10) UNSIGNED NOT NULL,
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `spec_1` varchar(60) DEFAULT '',
  `spec_2` varchar(60) DEFAULT '',
  `price` decimal(10,2) DEFAULT '0.00',
  `mkprice` decimal(10,2) DEFAULT '0.00',
  `stock` int(11) DEFAULT '0',
  `sku` varchar(60) DEFAULT '',
  `spec_image` varchar(255) DEFAULT NULL,
  `sort_order` tinyint(3) UNSIGNED DEFAULT '255'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_goods_spec`
--

INSERT INTO `swd_goods_spec` (`spec_id`, `goods_id`, `spec_1`, `spec_2`, `price`, `mkprice`, `stock`, `sku`, `spec_image`, `sort_order`) VALUES
(134, 91, '', '', '5.00', '0.00', 10000, '', '', 1),
(127, 84, '', '', '280.00', '0.00', 9999, '', '', 1),
(126, 83, '', '', '600.00', '0.00', 9990, '', '', 1),
(125, 82, '', '', '480.00', '0.00', 10000, '', '', 1),
(6, 6, '', '', '688.00', '0.00', 10000, '1000000000006', '', 1),
(7, 7, '', '', '380.00', '0.00', 10000, '1000000000007', '', 1),
(8, 8, '', '', '360.00', '0.00', 10000, '1000000000008', '', 1),
(9, 9, '', '', '120.00', '0.00', 10000, '1000000000008', '', 1),
(10, 10, '', '', '320.00', '0.00', 9999, '1000000000009', '', 1),
(168, 125, '', '', '380.00', '0.00', 10000, '', '', 1),
(167, 124, '', '', '380.00', '0.00', 10000, '', '', 1),
(166, 123, '', '', '260.00', '0.00', 10000, '', '', 1),
(165, 122, '', '', '288.00', '0.00', 10000, '', '', 1),
(164, 121, '', '', '260.00', '0.00', 9999, '', '', 1),
(163, 120, '', '', '260.00', '0.00', 10000, '', '', 1),
(162, 119, '', '', '288.00', '0.00', 10000, '', '', 1),
(161, 118, '', '', '260.00', '0.00', 10000, '', '', 1),
(158, 115, '', '', '260.00', '0.00', 9999, '', '', 1),
(159, 116, '', '', '260.00', '0.00', 10000, '', '', 1),
(160, 117, '', '', '260.00', '0.00', 10000, '', '', 1),
(128, 85, '', '', '5.00', '0.00', 9997, '', '', 1),
(129, 86, '', '', '5.00', '0.00', 10000, '', '', 1),
(130, 87, '', '', '5.00', '0.00', 10000, '', '', 1),
(131, 88, '', '', '10.00', '0.00', 10000, '', '', 1),
(132, 89, '', '', '5.00', '0.00', 10000, '', '', 1),
(133, 90, '', '', '10.00', '0.00', 10000, '', '', 1),
(156, 113, '', '', '260.00', '0.00', 10000, '', '', 1),
(157, 114, '', '', '260.00', '0.00', 9999, '', '', 1),
(154, 111, '', '', '268.00', '0.00', 9999, '', '', 1),
(155, 112, '', '', '260.00', '0.00', 10000, '', '', 1),
(153, 110, '', '', '65.00', '0.00', 10000, '', '', 1),
(152, 109, '', '', '65.00', '0.00', 10000, '', '', 1),
(151, 108, '', '', '38.00', '0.00', 10000, '', '', 1),
(135, 92, '', '', '5.00', '0.00', 10000, '', '', 1),
(136, 93, '', '', '5.00', '0.00', 10000, '', '', 1),
(137, 94, '', '', '5.00', '0.00', 10000, '', '', 1),
(138, 95, '', '', '10.00', '0.00', 10000, '', '', 1),
(139, 96, '', '', '20.00', '0.00', 10000, '', '', 1),
(140, 97, '', '', '20.00', '0.00', 10000, '', '', 1),
(141, 98, '', '', '35.00', '0.00', 10000, '', '', 1),
(142, 99, '', '', '59.00', '0.00', 10000, '', '', 1),
(143, 100, '', '', '58.00', '0.00', 10000, '', '', 1),
(144, 101, '', '', '10.00', '0.00', 10000, '', '', 1),
(145, 102, '', '', '30.00', '0.00', 10000, '', '', 1),
(146, 103, '', '', '20.00', '0.00', 10000, '', '', 1),
(147, 104, '', '', '30.00', '0.00', 10000, '', '', 1),
(148, 105, '', '', '10.00', '0.00', 10000, '', '', 1),
(149, 106, '', '', '10.00', '0.00', 10000, '', '', 1),
(150, 107, '', '', '10.00', '0.00', 10000, '', '', 1),
(124, 81, '', '', '280.00', '0.00', 10000, '', '', 1),
(123, 80, '', '', '480.00', '0.00', 10000, '', '', 1),
(122, 79, '', '', '580.00', '0.00', 10000, '', '', 1),
(121, 78, '', '', '280.00', '0.00', 10000, '', '', 1),
(120, 77, '', '', '280.00', '0.00', 10000, '', '', 1),
(119, 76, '', '', '680.00', '0.00', 9999, '', '', 1),
(118, 75, '', '', '880.00', '0.00', 10000, '', '', 1),
(85, 42, '', '', '300.00', '0.00', 9998, '', '', 1),
(86, 43, '', '', '280.00', '0.00', 10000, '', '', 1),
(87, 44, '', '', '280.00', '0.00', 9989, '', '', 1),
(88, 45, '', '', '288.00', '0.00', 10000, '', '', 1),
(89, 46, '', '', '280.00', '0.00', 10000, '', '', 1),
(90, 47, '', '', '230.00', '0.00', 9999, '', '', 1),
(91, 48, '', '', '230.00', '0.00', 10000, '', '', 1),
(92, 49, '', '', '150.00', '0.00', 9997, '', '', 1),
(93, 50, '', '', '180.00', '0.00', 10000, '', '', 1),
(94, 51, '', '', '280.00', '0.00', 9999, '', '', 1),
(95, 52, '', '', '300.00', '0.00', 10000, '', '', 1),
(96, 53, '', '', '230.00', '0.00', 10000, '', '', 1),
(97, 54, '', '', '200.00', '0.00', 10000, '', '', 1),
(98, 55, '', '', '280.00', '0.00', 9999, '', '', 1),
(99, 56, '', '', '288.00', '0.00', 10000, '', '', 1),
(100, 57, '', '', '280.00', '0.00', 10000, '', '', 1),
(101, 58, '', '', '280.00', '0.00', 10000, '', '', 1),
(102, 59, '', '', '180.00', '0.00', 10000, '', '', 1),
(103, 60, '', '', '200.00', '0.00', 10000, '', '', 1),
(104, 61, '', '', '288.00', '0.00', 9999, '', '', 1),
(105, 62, '', '', '280.00', '0.00', 10000, '', '', 1),
(106, 63, '', '', '280.00', '0.00', 9999, '', '', 1),
(107, 64, '', '', '160.00', '0.00', 9995, '', '', 1),
(108, 65, '', '', '160.00', '0.00', 9974, '', '', 1),
(109, 66, '', '', '288.00', '0.00', 10000, '', '', 1),
(378, 67, '双棵', '带盆', '460.00', '0.00', 10000, '', 'http://www.byhh.com/data/files/store_2/spec/20231024093953780.jpg', 1),
(111, 68, '', '', '480.00', '0.00', 10000, '', '', 1),
(112, 69, '', '', '420.00', '0.00', 10000, '', '', 1),
(113, 70, '', '', '260.00', '0.00', 10000, '', '', 1),
(114, 71, '', '', '260.00', '0.00', 10000, '', '', 1),
(115, 72, '', '', '280.00', '0.00', 10000, '', '', 1),
(116, 73, '', '', '680.00', '0.00', 10000, '', '', 1),
(117, 74, '', '', '300.00', '0.00', 10000, '', '', 1),
(169, 126, '', '', '380.00', '0.00', 10000, '', '', 1),
(170, 127, '', '', '380.00', '0.00', 10000, '', '', 1),
(171, 128, '', '', '380.00', '0.00', 10000, '', '', 1),
(172, 129, '', '', '380.00', '0.00', 10000, '', '', 1),
(173, 130, '', '', '380.00', '0.00', 10000, '', '', 1),
(174, 131, '', '', '380.00', '0.00', 10000, '', '', 1),
(175, 132, '', '', '380.00', '0.00', 10000, '', '', 1),
(176, 133, '', '', '260.00', '0.00', 10000, '', '', 1),
(177, 134, '', '', '260.00', '0.00', 10000, '', '', 1),
(178, 135, '', '', '260.00', '0.00', 10000, '', '', 1),
(179, 136, '', '', '260.00', '0.00', 9999, '', '', 1),
(180, 137, '', '', '260.00', '0.00', 10000, '', '', 1),
(181, 138, '', '', '260.00', '0.00', 10000, '', '', 1),
(182, 139, '', '', '68.00', '0.00', 10000, '', '', 1),
(183, 140, '', '', '260.00', '0.00', 10000, '', '', 1),
(184, 141, '', '', '260.00', '0.00', 10000, '', '', 1),
(185, 142, '', '', '10.00', '0.00', 10000, '', '', 1),
(186, 143, '', '', '10.00', '0.00', 10000, '', '', 1),
(187, 144, '', '', '10.00', '0.00', 10000, '', '', 1),
(188, 145, '', '', '10.00', '0.00', 10000, '', '', 1),
(189, 146, '', '', '10.00', '0.00', 10000, '', '', 1),
(190, 147, '', '', '10.00', '0.00', 10000, '', '', 1),
(191, 148, '', '', '10.00', '0.00', 10000, '', '', 1),
(192, 149, '', '', '10.00', '0.00', 10000, '', '', 1),
(193, 150, '', '', '10.00', '0.00', 10000, '', '', 1),
(194, 151, '', '', '10.00', '0.00', 10000, '', '', 1),
(195, 152, '', '', '10.00', '0.00', 10000, '', '', 1),
(196, 153, '', '', '10.00', '0.00', 10000, '', '', 1),
(197, 154, '', '', '10.00', '0.00', 10000, '', '', 1),
(198, 155, '', '', '10.00', '0.00', 10000, '', '', 1),
(199, 156, '', '', '10.00', '0.00', 10000, '', '', 1),
(200, 157, '', '', '10.00', '0.00', 10000, '', '', 1),
(201, 158, '', '', '10.00', '0.00', 10000, '', '', 1),
(202, 159, '', '', '10.00', '0.00', 10000, '', '', 1),
(203, 160, '', '', '10.00', '0.00', 10000, '', '', 1),
(204, 161, '', '', '10.00', '0.00', 10000, '', '', 1),
(205, 162, '', '', '10.00', '0.00', 10000, '', '', 1),
(206, 163, '', '', '10.00', '0.00', 10000, '', '', 1),
(207, 164, '', '', '10.00', '0.00', 10000, '', '', 1),
(208, 165, '', '', '10.00', '0.00', 10000, '', '', 1),
(209, 166, '', '', '10.00', '0.00', 10000, '', '', 1),
(210, 167, '', '', '10.00', '0.00', 10000, '', '', 1),
(211, 168, '', '', '10.00', '0.00', 10000, '', '', 1),
(212, 169, '', '', '10.00', '0.00', 10000, '', '', 1),
(213, 170, '', '', '10.00', '0.00', 10000, '', '', 1),
(214, 171, '', '', '10.00', '0.00', 10000, '', '', 1),
(215, 172, '', '', '10.00', '0.00', 10000, '', '', 1),
(216, 173, '', '', '39.00', '0.00', 10000, '', '', 1),
(217, 174, '', '', '35.00', '0.00', 10000, '', '', 1),
(218, 175, '', '', '35.00', '0.00', 10000, '', '', 1),
(219, 176, '', '', '35.00', '0.00', 10000, '', '', 1),
(220, 177, '', '', '35.00', '0.00', 10000, '', '', 1),
(221, 178, '', '', '35.00', '0.00', 10000, '', '', 1),
(222, 179, '', '', '35.00', '0.00', 10000, '', '', 1),
(223, 180, '', '', '35.00', '0.00', 10000, '', '', 1),
(224, 181, '', '', '35.00', '0.00', 10000, '', '', 1),
(225, 182, '', '', '35.00', '0.00', 10000, '', '', 1),
(226, 183, '', '', '35.00', '0.00', 10000, '', '', 1),
(227, 184, '', '', '35.00', '0.00', 10000, '', '', 1),
(228, 185, '', '', '35.00', '0.00', 10000, '', '', 1),
(229, 186, '', '', '35.00', '0.00', 10000, '', '', 1),
(230, 187, '', '', '35.00', '0.00', 10000, '', '', 1),
(231, 188, '', '', '35.00', '0.00', 10000, '', '', 1),
(232, 189, '', '', '35.00', '0.00', 10000, '', '', 1),
(233, 190, '', '', '35.00', '0.00', 10000, '', '', 1),
(234, 191, '', '', '35.00', '0.00', 10000, '', '', 1),
(235, 192, '', '', '35.00', '0.00', 10000, '', '', 1),
(236, 193, '', '', '35.00', '0.00', 9999, '', '', 1),
(237, 194, '', '', '35.00', '0.00', 10000, '', '', 1),
(238, 195, '', '', '35.00', '0.00', 10000, '', '', 1),
(239, 196, '', '', '35.00', '0.00', 10000, '', '', 1),
(240, 197, '', '', '35.00', '0.00', 10000, '', '', 1),
(241, 198, '', '', '35.00', '0.00', 10000, '', '', 1),
(242, 199, '', '', '268.00', '0.00', 10000, '', '', 1),
(243, 200, '', '', '268.00', '0.00', 10000, '', '', 1),
(244, 201, '', '', '268.00', '0.00', 9999, '', '', 1),
(245, 202, '', '', '268.00', '0.00', 10000, '', '', 1),
(246, 203, '', '', '268.00', '0.00', 9995, '', '', 1),
(247, 204, '', '', '268.00', '0.00', 9999, '', '', 1),
(248, 205, '', '', '268.00', '0.00', 9998, '', '', 1),
(249, 206, '', '', '268.00', '0.00', 10000, '', '', 1),
(250, 207, '', '', '120.00', '0.00', 10000, '', '', 1),
(251, 208, '', '', '328.00', '0.00', 10000, '', '', 1),
(252, 209, '', '', '58.00', '0.00', 10000, '', '', 1),
(253, 210, '', '', '58.00', '0.00', 10000, '', '', 1),
(254, 211, '', '', '58.00', '0.00', 10000, '', '', 1),
(255, 212, '', '', '68.00', '0.00', 10000, '', '', 1),
(256, 213, '', '', '68.00', '0.00', 10000, '', '', 1),
(257, 214, '', '', '68.00', '0.00', 10000, '', '', 1),
(258, 215, '', '', '68.00', '0.00', 10000, '', '', 1),
(259, 216, '', '', '68.00', '0.00', 10000, '', '', 1),
(260, 217, '', '', '68.00', '0.00', 9999, '', '', 1),
(261, 218, '', '', '68.00', '0.00', 10000, '', '', 1),
(262, 219, '', '', '68.00', '0.00', 10000, '', '', 1),
(263, 220, '', '', '68.00', '0.00', 10000, '', '', 1),
(264, 221, '', '', '68.00', '0.00', 10000, '', '', 1),
(265, 222, '', '', '288.00', '0.00', 10000, '', '', 1),
(266, 223, '', '', '288.00', '0.00', 9998, '', '', 1),
(267, 224, '', '', '35.00', '0.00', 10000, '', '', 1),
(268, 225, '', '', '68.00', '0.00', 10000, '', '', 1),
(269, 226, '', '', '68.00', '0.00', 10000, '', '', 1),
(270, 227, '', '', '68.00', '0.00', 10000, '', '', 1),
(271, 228, '', '', '46.00', '0.00', 10000, '', '', 1),
(272, 229, '', '', '45.00', '0.00', 10000, '', '', 1),
(273, 230, '', '', '35.00', '0.00', 10000, '', '', 1),
(274, 231, '', '', '35.00', '0.00', 10000, '', '', 1),
(275, 232, '', '', '45.00', '0.00', 10000, '', '', 1),
(276, 233, '', '', '35.00', '0.00', 10000, '', '', 1),
(277, 234, '', '', '35.00', '0.00', 10000, '', '', 1),
(278, 235, '', '', '35.00', '0.00', 10000, '', '', 1),
(279, 236, '', '', '35.00', '0.00', 10000, '', '', 1),
(280, 237, '', '', '35.00', '0.00', 10000, '', '', 1),
(281, 238, '', '', '35.00', '0.00', 10000, '', '', 1),
(282, 239, '', '', '35.00', '0.00', 10000, '', '', 1),
(283, 240, '', '', '35.00', '0.00', 10000, '', '', 1),
(284, 241, '', '', '35.00', '0.00', 10000, '', '', 1),
(285, 242, '', '', '35.00', '0.00', 10000, '', '', 1),
(286, 243, '', '', '46.00', '0.00', 10000, '', '', 1),
(287, 244, '', '', '68.00', '0.00', 10000, '', '', 1),
(288, 245, '', '', '68.00', '0.00', 10000, '', '', 1),
(289, 246, '', '', '68.00', '0.00', 10000, '', '', 1),
(290, 247, '', '', '68.00', '0.00', 10000, '', '', 1),
(291, 248, '', '', '68.00', '0.00', 10000, '', '', 1),
(292, 249, '', '', '68.00', '0.00', 10000, '', '', 1),
(293, 250, '', '', '68.00', '0.00', 10000, '', '', 1),
(294, 251, '', '', '68.00', '0.00', 10000, '', '', 1),
(295, 252, '', '', '68.00', '0.00', 10000, '', '', 1),
(296, 253, '', '', '68.00', '0.00', 10000, '', '', 1),
(297, 254, '', '', '68.00', '0.00', 10000, '', '', 1),
(298, 255, '', '', '35.00', '0.00', 10000, '', '', 1),
(299, 256, '', '', '35.00', '0.00', 10000, '', '', 1),
(300, 257, '', '', '35.00', '0.00', 10000, '', '', 1),
(301, 258, '', '', '35.00', '0.00', 10000, '', '', 1),
(302, 259, '', '', '68.00', '0.00', 10000, '', '', 1),
(303, 260, '', '', '68.00', '0.00', 10000, '', '', 1),
(304, 261, '', '', '68.00', '0.00', 10000, '', '', 1),
(305, 262, '', '', '68.00', '0.00', 10000, '', '', 1),
(306, 263, '', '', '68.00', '0.00', 10000, '', '', 1),
(307, 264, '', '', '68.00', '0.00', 10000, '', '', 1),
(308, 265, '', '', '68.00', '0.00', 10000, '', '', 1),
(309, 266, '', '', '680.00', '0.00', 9998, '', '', 1),
(310, 267, '', '', '680.00', '0.00', 10000, '', '', 1),
(311, 268, '', '', '288.00', '0.00', 9996, '', '', 1),
(312, 269, '', '', '288.00', '0.00', 9996, '', '', 1),
(313, 270, '', '', '288.00', '0.00', 10000, '', '', 1),
(314, 271, '', '', '288.00', '0.00', 9999, '', '', 1),
(315, 272, '', '', '388.00', '0.00', 9999, '', '', 1),
(316, 273, '', '', '288.00', '0.00', 9998, '', '', 1),
(317, 274, '', '', '1880.00', '0.00', 9999, '', '', 1),
(318, 275, '', '', '288.00', '0.00', 9999, '', '', 1),
(319, 276, '', '', '288.00', '0.00', 10000, '', '', 1),
(320, 277, '', '', '288.00', '0.00', 10000, '', '', 1),
(321, 278, '', '', '288.00', '0.00', 10000, '', '', 1),
(322, 279, '', '', '288.00', '0.00', 10000, '', '', 1),
(323, 280, '', '', '1188.00', '0.00', 10000, '', '', 1),
(324, 281, '', '', '688.00', '0.00', 10000, '', '', 1),
(325, 282, '', '', '1888.00', '0.00', 10000, '', '', 1),
(326, 283, '', '', '460.00', '0.00', 10000, '', '', 1),
(327, 284, '', '', '68.00', '0.00', 10000, '', '', 1),
(328, 285, '', '', '68.00', '0.00', 10000, '', '', 1),
(329, 286, '', '', '68.00', '0.00', 10000, '', '', 1),
(330, 287, '', '', '68.00', '0.00', 10000, '', '', 1),
(331, 288, '', '', '388.00', '0.00', 9997, '', '', 1),
(332, 289, '', '', '288.00', '0.00', 10000, '', '', 1),
(333, 290, '', '', '288.00', '0.00', 10000, '', '', 1),
(334, 291, '', '', '388.00', '0.00', 9999, '', '', 1),
(335, 292, '', '', '238.00', '0.00', 10000, '', '', 1),
(336, 293, '', '', '238.00', '0.00', 10000, '', '', 1),
(337, 294, '', '', '388.00', '0.00', 10000, '', '', 1),
(338, 295, '', '', '188.00', '0.00', 10000, '', '', 1),
(339, 296, '', '', '168.00', '0.00', 10000, '', '', 1),
(340, 297, '', '', '168.00', '0.00', 10000, '', '', 1),
(341, 298, '', '', '128.00', '0.00', 10000, '', '', 1),
(342, 299, '', '', '128.00', '0.00', 10000, '', '', 1),
(343, 300, '', '', '128.00', '0.00', 10000, '', '', 1),
(344, 301, '', '', '288.00', '0.00', 10000, '', '', 1),
(345, 302, '', '', '388.00', '0.00', 9999, '', '', 1),
(346, 303, '', '', '488.00', '0.00', 9999, '', '', 1),
(347, 304, '', '', '788.00', '0.00', 9999, '', '', 1),
(348, 305, '', '', '788.00', '0.00', 10000, '', '', 1),
(349, 306, '', '', '188.00', '0.00', 10000, '', '', 1),
(350, 307, '', '', '288.00', '0.00', 10000, '', '', 1),
(351, 308, '', '', '288.00', '0.00', 9994, '', '', 1),
(352, 309, '', '', '288.00', '0.00', 9999, '', '', 1),
(353, 310, '', '', '280.00', '0.00', 9999, '', '', 1),
(354, 311, '', '', '380.00', '0.00', 10000, '', '', 1),
(355, 312, '', '', '380.00', '0.00', 9999, '', '', 1),
(356, 313, '', '', '580.00', '0.00', 9998, '', '', 1),
(357, 314, '', '', '260.00', '0.00', 9999, '', '', 1),
(358, 315, '', '', '260.00', '0.00', 9998, '', '', 1),
(359, 316, '', '', '288.00', '0.00', 9998, '', '', 1),
(360, 317, '', '', '288.00', '0.00', 10000, '', '', 1),
(361, 318, '', '', '288.00', '0.00', 9997, '', '', 1),
(362, 319, '', '', '268.00', '0.00', 10000, '', '', 1),
(363, 320, '', '', '68.00', '0.00', 9998, '', '', 1),
(364, 321, '', '', '68.00', '0.00', 9999, '', '', 1),
(365, 322, '', '', '115.00', '0.00', 9999, '', '', 1),
(366, 323, '', '', '260.00', '0.00', 10000, '', '', 1),
(367, 324, '', '', '580.00', '0.00', 9997, '', '', 1),
(368, 325, '', '', '880.00', '0.00', 9999, '', '', 1),
(369, 326, '', '', '480.00', '0.00', 10000, '', '', 1),
(370, 327, '', '', '288.00', '0.00', 9997, '', '', 1),
(371, 328, '', '', '588.00', '0.00', 10000, '', '', 1),
(372, 329, '', '', '580.00', '0.00', 10000, '', '', 1),
(373, 330, '', '', '380.00', '0.00', 10000, '', '', 1),
(374, 331, '', '', '480.00', '0.00', 9999, '', '', 1),
(375, 332, '', '', '480.00', '0.00', 9999, '', '', 1),
(376, 333, '', '', '128.00', '0.00', 9999, '', '', 1),
(377, 334, '', '', '68.00', '0.00', 9999, '', '', 1),
(379, 67, '单棵', '带盆', '260.00', '0.00', 10000, '', 'http://www.byhh.com/data/files/store_2/spec/20231024093958705.jpg', 0),
(380, 335, '', '', '480.00', '0.00', 9999, '', '', 1),
(381, 336, '', '', '480.00', '0.00', 10000, '', '', 1),
(382, 337, '', '', '45.00', '0.00', 9999, '', '', 1),
(383, 338, '', '', '488.00', '0.00', 9999, '', '', 1),
(384, 339, '', '', '1180.00', '0.00', 9998, '', '', 1),
(385, 340, '', '', '380.00', '0.00', 9998, '', '', 1),
(387, 341, '多肉', '无盆', '35.00', '0.00', 10000, '', '', 0),
(388, 341, '多肉', '带盆', '65.00', '0.00', 10000, '', '', 1),
(389, 342, '', '', '68.00', '0.00', 9999, '', '', 1),
(390, 343, '', '', '288.00', '0.00', 10000, '', '', 1),
(391, 344, '', '', '288.00', '0.00', 9999, '', '', 1),
(392, 345, '', '', '288.00', '0.00', 9999, '', '', 1),
(393, 346, '', '', '388.00', '0.00', 10000, '', '', 1),
(394, 347, '', '', '488.00', '0.00', 9999, '', '', 1),
(395, 348, '', '', '288.00', '0.00', 9999, '', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `swd_goods_statistics`
--

CREATE TABLE `swd_goods_statistics` (
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `views` int(10) UNSIGNED DEFAULT '0',
  `collects` int(10) UNSIGNED DEFAULT '0',
  `orders` int(10) UNSIGNED DEFAULT '0',
  `sales` int(10) UNSIGNED DEFAULT '0',
  `comments` int(11) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_goods_statistics`
--

INSERT INTO `swd_goods_statistics` (`goods_id`, `views`, `collects`, `orders`, `sales`, `comments`) VALUES
(2, 20, 0, 1, 0, 0),
(26, 10, 0, 1, 0, 0),
(27, 8, 0, 1, 0, 0),
(1, 8, 0, 1, 0, 0),
(13, 6, 0, 0, 0, 0),
(29, 4, 0, 0, 0, 0),
(20, 6, 0, 0, 0, 0),
(19, 24, 0, 0, 0, 0),
(18, 2, 0, 0, 0, 0),
(16, 2, 0, 0, 0, 0),
(41, 4, 0, 0, 0, 0),
(31, 6, 0, 0, 0, 0),
(6, 6, 0, 0, 0, 0),
(7, 2, 0, 0, 0, 0),
(11, 2, 0, 0, 0, 0),
(14, 2, 0, 0, 0, 0),
(8, 6, 0, 0, 0, 0),
(10, 12, 0, 1, 0, 0),
(42, 12, 0, 2, 0, 0),
(44, 40, 0, 11, 6, 1),
(47, 8, 0, 1, 0, 0),
(48, 6, 0, 0, 0, 0),
(58, 2, 0, 0, 0, 0),
(46, 4, 0, 0, 0, 0),
(62, 2, 0, 0, 0, 0),
(65, 100, 0, 29, 1, 1),
(64, 22, 0, 6, 2, 1),
(87, 2, 0, 0, 0, 0),
(123, 8, 0, 0, 0, 0),
(84, 16, 0, 1, 0, 0),
(124, 2, 0, 0, 0, 0),
(207, 14, 0, 0, 0, 0),
(208, 4, 0, 0, 0, 0),
(121, 10, 0, 1, 1, 1),
(182, 2, 0, 0, 0, 0),
(222, 8, 0, 0, 0, 0),
(223, 16, 0, 2, 0, 0),
(199, 4, 0, 0, 0, 0),
(85, 22, 0, 3, 1, 1),
(139, 2, 0, 0, 0, 0),
(259, 2, 0, 0, 0, 0),
(83, 32, 0, 10, 0, 0),
(67, 30, 0, 3, 3, 1),
(76, 14, 0, 1, 1, 1),
(79, 6, 0, 0, 0, 0),
(69, 4, 0, 0, 0, 0),
(266, 14, 0, 3, 0, 0),
(54, 2, 0, 0, 0, 0),
(51, 6, 0, 1, 0, 0),
(81, 2, 0, 0, 0, 0),
(75, 4, 0, 0, 0, 0),
(264, 2, 0, 0, 0, 0),
(198, 6, 0, 0, 0, 0),
(56, 2, 0, 0, 0, 0),
(268, 12, 0, 4, 0, 0),
(269, 24, 0, 4, 2, 1),
(205, 6, 0, 2, 1, 1),
(272, 8, 0, 1, 1, 1),
(271, 12, 0, 1, 1, 1),
(273, 18, 0, 2, 2, 1),
(275, 6, 0, 1, 1, 1),
(282, 2, 0, 0, 0, 0),
(281, 2, 0, 0, 0, 0),
(61, 4, 0, 1, 1, 1),
(274, 8, 0, 1, 1, 1),
(278, 4, 0, 0, 0, 0),
(203, 26, 0, 5, 6, 1),
(288, 16, 0, 4, 4, 1),
(122, 8, 0, 0, 0, 0),
(289, 4, 0, 0, 0, 0),
(306, 12, 0, 0, 0, 0),
(201, 8, 0, 1, 1, 1),
(310, 5, 0, 1, 1, 1),
(312, 6, 0, 1, 1, 1),
(302, 4, 0, 1, 1, 1),
(114, 12, 0, 1, 2, 1),
(301, 2, 0, 0, 0, 0),
(267, 4, 0, 0, 0, 0),
(309, 26, 0, 3, 2, 1),
(311, 8, 0, 0, 1, 1),
(313, 16, 0, 2, 1, 1),
(304, 12, 0, 1, 1, 1),
(204, 4, 0, 1, 1, 1),
(206, 2, 0, 0, 0, 0),
(202, 2, 0, 0, 0, 0),
(200, 2, 0, 0, 0, 0),
(287, 2, 0, 0, 0, 0),
(119, 2, 0, 0, 0, 0),
(118, 2, 0, 0, 0, 0),
(113, 4, 0, 0, 0, 0),
(112, 4, 0, 0, 0, 0),
(111, 6, 0, 1, 1, 1),
(298, 4, 0, 0, 0, 0),
(314, 2, 0, 1, 0, 0),
(308, 32, 0, 6, 5, 1),
(315, 26, 0, 2, 1, 1),
(316, 22, 0, 2, 2, 1),
(116, 2, 0, 0, 0, 0),
(115, 4, 0, 1, 1, 1),
(63, 4, 0, 1, 1, 1),
(317, 12, 0, 0, 0, 0),
(319, 6, 0, 0, 0, 0),
(318, 8, 0, 3, 4, 1),
(320, 2, 0, 1, 2, 1),
(321, 2, 0, 1, 1, 0),
(322, 6, 0, 1, 1, 1),
(55, 4, 0, 1, 0, 0),
(323, 20, 0, 0, 0, 0),
(324, 30, 0, 3, 2, 1),
(325, 6, 0, 1, 1, 1),
(326, 2, 0, 0, 0, 0),
(49, 10, 0, 3, 3, 1),
(330, 2, 0, 0, 0, 0),
(327, 8, 0, 3, 3, 1),
(331, 4, 0, 1, 1, 1),
(332, 2, 0, 1, 1, 1),
(333, 4, 0, 1, 1, 1),
(334, 4, 0, 1, 1, 1),
(217, 2, 0, 1, 1, 1),
(335, 2, 0, 1, 1, 1),
(336, 4, 0, 0, 0, 0),
(337, 2, 0, 1, 1, 1),
(338, 12, 0, 1, 1, 1),
(303, 6, 0, 1, 1, 1),
(136, 2, 0, 1, 1, 1),
(277, 2, 0, 0, 0, 0),
(291, 4, 0, 1, 1, 1),
(329, 2, 0, 0, 0, 0),
(299, 2, 0, 0, 0, 0),
(339, 6, 0, 2, 2, 1),
(340, 8, 0, 2, 2, 1),
(341, 8, 0, 1, 1, 1),
(342, 2, 0, 1, 1, 1),
(344, 4, 0, 1, 1, 1),
(343, 2, 0, 0, 0, 0),
(345, 4, 0, 1, 0, 0),
(347, 2, 0, 1, 1, 1),
(193, 2, 0, 1, 0, 0),
(348, 4, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `swd_guideshop`
--

CREATE TABLE `swd_guideshop` (
  `id` int(11) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `owner` varchar(50) NOT NULL DEFAULT '',
  `phone_mob` varchar(20) NOT NULL DEFAULT '',
  `region_id` int(11) UNSIGNED DEFAULT '0',
  `region_name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `banner` varchar(255) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT '',
  `latitude` varchar(20) DEFAULT '',
  `created` int(11) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `inviter` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_integral`
--

CREATE TABLE `swd_integral` (
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(10,2) DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_integral`
--

INSERT INTO `swd_integral` (`userid`, `amount`) VALUES
(2, '0.00'),
(4, '477.10'),
(5, '171.20'),
(6, '125.00'),
(7, '130.80'),
(8, '50.00'),
(9, '50.00'),
(10, '50.00'),
(11, '50.00'),
(12, '50.00'),
(13, '50.00'),
(14, '50.00'),
(15, '50.00'),
(3, '0.00'),
(16, '50.00'),
(17, '50.00'),
(18, '50.00'),
(19, '66.00'),
(20, '50.00'),
(21, '50.00'),
(22, '50.00'),
(23, '50.00'),
(24, '50.00'),
(25, '50.00'),
(26, '50.00'),
(27, '50.00'),
(28, '50.00'),
(29, '82.00'),
(30, '50.00'),
(31, '100.00'),
(32, '50.00'),
(33, '50.00'),
(35, '50.00'),
(36, '50.00'),
(37, '50.00'),
(38, '50.00'),
(39, '50.00'),
(40, '50.00'),
(41, '71.00'),
(42, '165.00'),
(43, '75.00'),
(44, '64.00'),
(45, '50.00'),
(46, '50.00'),
(47, '50.00'),
(48, '50.00'),
(49, '50.00'),
(50, '50.00'),
(51, '50.00'),
(52, '50.00'),
(53, '50.00'),
(54, '69.00'),
(55, '50.00'),
(56, '50.00'),
(57, '50.00'),
(58, '217.00'),
(59, '87.00'),
(60, '50.00'),
(61, '71.00'),
(62, '50.00'),
(63, '50.00'),
(64, '50.00'),
(65, '50.00'),
(66, '75.00'),
(67, '50.00'),
(68, '50.00'),
(69, '78.80'),
(70, '71.00'),
(71, '50.00'),
(1, '0.00'),
(72, '50.00'),
(73, '50.00'),
(74, '65.00'),
(75, '64.00'),
(76, '224.00'),
(77, '62.00'),
(78, '59.50'),
(79, '50.00'),
(80, '98.80'),
(81, '497.80'),
(82, '50.00'),
(83, '84.00'),
(84, '75.00'),
(85, '61.00'),
(86, '64.00'),
(87, '78.00'),
(88, '50.00'),
(89, '50.00'),
(90, '84.00'),
(91, '50.00'),
(92, '50.00');

-- --------------------------------------------------------

--
-- 表的结构 `swd_integral_log`
--

CREATE TABLE `swd_integral_log` (
  `log_id` int(11) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `order_id` int(10) NOT NULL DEFAULT '0',
  `order_sn` varchar(20) DEFAULT '',
  `changes` decimal(25,2) DEFAULT '0.00',
  `balance` decimal(25,2) DEFAULT '0.00',
  `type` varchar(50) DEFAULT '',
  `state` varchar(50) DEFAULT '',
  `flag` varchar(255) DEFAULT '',
  `add_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_integral_log`
--

INSERT INTO `swd_integral_log` (`log_id`, `userid`, `order_id`, `order_sn`, `changes`, `balance`, `type`, `state`, `flag`, `add_time`) VALUES
(1, 4, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1691391478),
(2, 5, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1691392527),
(3, 6, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1692768504),
(4, 7, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1692771447),
(5, 8, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1692771462),
(6, 9, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1692771546),
(7, 10, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1692771589),
(8, 11, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1692773425),
(9, 12, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1692773962),
(10, 13, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693234697),
(11, 14, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693234844),
(12, 15, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693235823),
(13, 16, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693236951),
(14, 17, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693239262),
(15, 18, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693239588),
(16, 19, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693240874),
(17, 19, 13, '16933295528245262', '16.00', '66.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16933295528245262]', 1693331488),
(18, 20, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693332323),
(19, 21, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693333067),
(20, 22, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693334330),
(21, 23, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693334467),
(22, 24, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693334808),
(23, 25, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693334937),
(24, 26, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693334982),
(25, 27, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693335050),
(26, 28, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693335320),
(27, 29, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693335653),
(28, 29, 30, '16933356532944902', '16.00', '66.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16933356532944902]', 1693335738),
(29, 29, 31, '16933357968275642', '16.00', '82.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16933357968275642]', 1693335815),
(30, 30, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1693344677),
(31, 31, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1694399893),
(32, 31, 0, '', '50.00', '100.00', 'register_has_integral', 'finished', '', 1694851414),
(33, 32, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695448915),
(34, 33, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695449979),
(35, 35, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695519358),
(36, 36, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695622616),
(37, 37, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695623073),
(38, 38, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695631785),
(39, 39, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695632007),
(40, 40, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695633154),
(41, 41, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695690778),
(42, 42, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695691677),
(43, 43, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695694719),
(44, 43, 42, '16956947181368562', '25.00', '75.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16956947181368562]', 1695702366),
(45, 42, 41, '16956917350712052', '45.00', '95.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16956917350712052]', 1695702658),
(46, 42, 40, '16956916765396582', '45.00', '140.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16956916765396582]', 1695702663),
(47, 41, 39, '16956907787031702', '21.00', '71.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16956907787031702]', 1695702668),
(48, 7, 38, '16956364281412802', '25.80', '75.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16956364281412802]', 1695702674),
(49, 7, 37, '16956353014866692', '21.00', '96.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16956353014866692]', 1695702691),
(50, 7, 36, '16956331543511092', '34.00', '130.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16956331543511092]', 1695702703),
(51, 44, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695704080),
(52, 45, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695704114),
(53, 46, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695704464),
(54, 47, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695704487),
(55, 48, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695704565),
(56, 49, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695704575),
(57, 50, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695704585),
(58, 51, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695704594),
(59, 52, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695704604),
(60, 53, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695704612),
(61, 54, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695704620),
(62, 55, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695704629),
(63, 56, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695704636),
(64, 57, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695709864),
(65, 58, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1695870836),
(66, 59, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1696646782),
(67, 60, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1696648976),
(68, 42, 43, '16957776525689972', '25.00', '165.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16957776525689972]', 1696814429),
(69, 5, 47, '16962168555494052', '38.80', '88.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16962168555494052]', 1696814437),
(70, 4, 50, '16963261968097102', '28.00', '78.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16963261968097102]', 1696814448),
(71, 4, 51, '16965818269577892', '28.80', '106.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16965818269577892]', 1696814454),
(72, 5, 48, '16962171272810932', '28.80', '117.60', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16962171272810932]', 1696814461),
(73, 4, 49, '16963258543550882', '38.00', '144.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16963258543550882]', 1696814468),
(74, 58, 44, '16958708358271032', '167.00', '217.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16958708358271032]', 1696814534),
(75, 5, 46, '16960513359149352', '26.80', '144.40', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16960513359149352]', 1696814541),
(76, 5, 45, '16960511956194042', '26.80', '171.20', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16960511956194042]', 1696814550),
(77, 59, 53, '16966467829542192', '37.00', '87.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16966467829542192]', 1696814594),
(78, 4, 56, '16967280968458682', '28.50', '173.30', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16967280968458682]', 1696814651),
(79, 4, 54, '16966594545283322', '15.00', '188.30', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16966594545283322]', 1696814677),
(80, 6, 35, '16956321468719702', '25.00', '75.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16956321468719702]', 1696814732),
(81, 6, 33, '16956317843984132', '25.00', '100.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16956317843984132]', 1696814741),
(82, 6, 34, '16956320065524932', '25.00', '125.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16956320065524932]', 1696814750),
(83, 4, 58, '16968164502985572', '10.00', '198.30', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16968164502985572]', 1696817464),
(84, 61, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1696910255),
(85, 4, 55, '16966603217526672', '77.00', '275.30', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16966603217526672]', 1696930173),
(86, 4, 61, '16969299434532242', '14.00', '289.30', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16969299434532242]', 1696930190),
(87, 61, 60, '16969102558040482', '21.00', '71.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16969102558040482]', 1696930195),
(88, 62, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697177105),
(89, 63, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697340771),
(90, 64, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697341044),
(91, 54, 65, '16971855638826902', '19.00', '69.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16971855638826902]', 1697341218),
(92, 4, 62, '16970995116856292', '14.00', '303.30', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16970995116856292]', 1697341239),
(93, 65, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697341320),
(94, 66, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697359477),
(95, 67, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697417527),
(96, 68, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697417643),
(97, 66, 70, '16973594777846932', '25.00', '75.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16973594777846932]', 1697418515),
(98, 69, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697422302),
(99, 70, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697425387),
(100, 4, 73, '16974213088832952', '14.00', '317.30', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16974213088832952]', 1697431180),
(101, 71, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697436724),
(102, 69, 74, '16974223021382872', '28.80', '78.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16974223021382872]', 1697437734),
(103, 4, 77, '16975251883827992', '1.00', '318.30', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16975251883827992]', 1697526995),
(104, 4, 76, '16975251647677662', '5.50', '323.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16975251647677662]', 1697527119),
(105, 70, 75, '16974253874216802', '21.00', '71.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16974253874216802]', 1697529055),
(106, 72, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697606863),
(107, 73, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697623249),
(108, 4, 81, '16976827098720702', '44.00', '367.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16976827098720702]', 1697697615),
(109, 74, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697766311),
(110, 4, 83, '16977667965635182', '11.00', '378.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16977667965635182]', 1697778651),
(111, 74, 82, '16977663103773442', '15.00', '65.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16977663103773442]', 1697778662),
(112, 4, 84, '16977774197670762', '14.00', '392.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16977774197670762]', 1697782047),
(113, 4, 85, '16977897130617282', '14.80', '407.60', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16977897130617282]', 1697790717),
(114, 75, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1697854475),
(115, 44, 87, '16978564279311502', '14.00', '64.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16978564279311502]', 1697877330),
(116, 75, 86, '16978544759566612', '14.00', '64.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16978544759566612]', 1697877336),
(117, 76, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1698023796),
(118, 77, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1698053917),
(119, 76, 96, '16981121846831962', '25.00', '75.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16981121846831962]', 1698119026),
(120, 76, 95, '16981113175595062', '5.00', '80.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16981113175595062]', 1698119030),
(121, 76, 93, '16981112519244572', '2.00', '82.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16981112519244572]', 1698119034),
(122, 76, 94, '16981112598528382', '2.00', '84.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16981112598528382]', 1698119039),
(123, 76, 92, '16981112436626192', '48.00', '132.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16981112436626192]', 1698119043),
(124, 76, 91, '16981112338243632', '25.00', '157.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16981112338243632]', 1698119047),
(125, 77, 90, '16980539173056092', '12.00', '62.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16980539173056092]', 1698119051),
(126, 76, 89, '16980238806324512', '42.00', '199.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16980238806324512]', 1698119056),
(127, 76, 88, '16980237963396282', '25.00', '224.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16980237963396282]', 1698119060),
(128, 78, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1698122230),
(129, 79, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1698122238),
(130, 78, 97, '16981242911746482', '4.50', '54.50', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16981242911746482]', 1698124727),
(131, 80, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1698130063),
(132, 81, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1698130583),
(133, 82, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1698134052),
(134, 83, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1698134973),
(135, 4, 63, '16971759259144472', '33.50', '441.10', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16971759259144472]', 1698140748),
(136, 4, 102, '16981453577955912', '12.00', '453.10', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16981453577955912]', 1698145447),
(137, 4, 103, '16981453662198632', '12.00', '465.10', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16981453662198632]', 1698145456),
(138, 4, 101, '16981452998599692', '12.00', '477.10', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16981452998599692]', 1698145461),
(139, 78, 100, '16981409246630212', '5.00', '59.50', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16981409246630212]', 1698145465),
(140, 83, 99, '16981349733547512', '34.00', '84.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16981349733547512]', 1698145470),
(141, 80, 98, '16981300473275772', '48.80', '98.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16981300473275772]', 1698145474),
(142, 84, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1698289267),
(143, 85, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1698485364),
(144, 86, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1698719422),
(145, 87, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1699063583),
(146, 81, 111, '16987231095368922', '34.00', '84.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16987231095368922]', 1699064279),
(147, 86, 110, '16987194216233432', '14.00', '64.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16987194216233432]', 1699064466),
(148, 81, 106, '16983978886279312', '14.00', '98.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16983978886279312]', 1699064481),
(149, 81, 105, '16983953940431282', '14.00', '112.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16983953940431282]', 1699064489),
(150, 81, 121, '16990640665584402', '11.00', '123.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16990640665584402]', 1699064713),
(151, 81, 120, '16990640503121622', '11.00', '134.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16990640503121622]', 1699064718),
(152, 81, 119, '16990640213775972', '11.00', '145.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16990640213775972]', 1699064722),
(153, 81, 122, '16990645544952652', '0.50', '145.50', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16990645544952652]', 1699064744),
(154, 81, 125, '16991686864028052', '2.50', '148.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16991686864028052]', 1699168810),
(155, 81, 124, '16990700496993882', '44.00', '192.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16990700496993882]', 1699169325),
(156, 81, 123, '16990699075441132', '29.00', '221.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16990699075441132]', 1699169329),
(157, 81, 118, '16990640023348062', '15.00', '236.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16990640023348062]', 1699169360),
(158, 81, 117, '16990639717972042', '15.00', '251.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16990639717972042]', 1699169364),
(159, 81, 116, '16990639295258192', '14.00', '265.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16990639295258192]', 1699169369),
(160, 81, 115, '16990636923295182', '59.00', '324.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16990636923295182]', 1699169373),
(161, 87, 114, '16990635830666832', '28.00', '78.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16990635830666832]', 1699169377),
(162, 81, 113, '16990220527721502', '59.00', '383.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16990220527721502]', 1699169383),
(163, 81, 112, '16988271186729092', '34.00', '417.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16988271186729092]', 1699169388),
(164, 84, 104, '16982892674389592', '25.00', '75.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16982892674389592]', 1699169412),
(165, 81, 107, '16984851747041162', '11.00', '428.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16984851747041162]', 1699169418),
(166, 85, 108, '16984853643789952', '11.00', '61.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16984853643789952]', 1699169424),
(167, 81, 109, '16984855009363032', '11.00', '439.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16984855009363032]', 1699169431),
(168, 81, 126, '16992431228568582', '12.80', '451.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16992431228568582]', 1699243143),
(169, 88, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1699493547),
(170, 89, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1699498540),
(171, 90, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1699604811),
(172, 81, 128, '16994339587112962', '9.00', '460.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16994339587112962]', 1699674345),
(173, 81, 127, '16993220057315012', '25.00', '485.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16993220057315012]', 1699674350),
(174, 81, 133, '16995805757921732', '7.00', '492.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16995805757921732]', 1699674356),
(175, 90, 134, '16996048115868232', '34.00', '84.00', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16996048115868232]', 1699674360),
(176, 81, 135, '16996634763033892', '5.00', '497.80', 'buying_has_integral', 'finished', '买家使用积分抵扣货款，订单号[16996634763033892]', 1699674365),
(177, 91, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1699695760),
(178, 92, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1699760743);

-- --------------------------------------------------------

--
-- 表的结构 `swd_integral_setting`
--

CREATE TABLE `swd_integral_setting` (
  `setting_id` int(11) UNSIGNED NOT NULL,
  `rate` decimal(10,2) DEFAULT '0.00',
  `register` decimal(10,0) DEFAULT '0',
  `signin` decimal(10,0) DEFAULT '0',
  `openshop` decimal(10,0) DEFAULT '0',
  `buygoods` text,
  `enabled` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_integral_setting`
--

INSERT INTO `swd_integral_setting` (`setting_id`, `rate`, `register`, `signin`, `openshop`, `buygoods`, `enabled`) VALUES
(1, '1.00', '50', '10', '100', 'a:2:{i:1;s:3:\"0.1\";i:2;s:3:\"0.2\";}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `swd_limitbuy`
--

CREATE TABLE `swd_limitbuy` (
  `id` int(11) UNSIGNED NOT NULL,
  `goods_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT '',
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `store_id` int(10) DEFAULT '0',
  `rules` text,
  `image` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_limitbuy`
--

INSERT INTO `swd_limitbuy` (`id`, `goods_id`, `title`, `summary`, `start_time`, `end_time`, `store_id`, `rules`, `image`) VALUES
(1, 26, '春节大促', '', 1617065980, 1640966399, 2, 'a:1:{i:26;a:2:{s:5:\"price\";s:1:\"9\";s:8:\"pro_type\";s:8:\"discount\";}}', NULL),
(2, 25, '春节大促', '', 1617066017, 1640966399, 2, 'a:1:{i:25;a:2:{s:5:\"price\";s:1:\"9\";s:8:\"pro_type\";s:8:\"discount\";}}', NULL),
(3, 15, '年中大促', '', 1617066289, 1640966399, 2, 'a:1:{i:15;a:2:{s:5:\"price\";s:1:\"6\";s:8:\"pro_type\";s:8:\"discount\";}}', NULL),
(4, 14, '年中大促', '', 1617066326, 1640966399, 2, 'a:1:{i:14;a:2:{s:5:\"price\";s:1:\"6\";s:8:\"pro_type\";s:8:\"discount\";}}', NULL),
(5, 12, '春节大促', '', 1617066422, 1640966399, 2, 'a:1:{i:12;a:2:{s:5:\"price\";s:1:\"8\";s:8:\"pro_type\";s:8:\"discount\";}}', NULL),
(6, 17, '春节大促', '', 1617066451, 1640966399, 2, 'a:1:{i:17;a:2:{s:5:\"price\";s:1:\"7\";s:8:\"pro_type\";s:8:\"discount\";}}', NULL),
(7, 18, '春节大促', '', 1617066481, 1640966399, 2, 'a:1:{i:18;a:2:{s:5:\"price\";s:1:\"8\";s:8:\"pro_type\";s:8:\"discount\";}}', NULL),
(8, 20, '春节大促', '', 1617066504, 1640966399, 2, 'a:1:{i:20;a:2:{s:5:\"price\";s:1:\"5\";s:8:\"pro_type\";s:8:\"discount\";}}', NULL),
(9, 42, '开业推荐', '的', 1692399382, 1692658582, 2, 'a:1:{i:85;a:2:{s:5:\"price\";s:2:\"10\";s:8:\"pro_type\";s:5:\"price\";}}', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `swd_meal`
--

CREATE TABLE `swd_meal` (
  `meal_id` int(11) UNSIGNED NOT NULL,
  `store_id` int(10) NOT NULL,
  `title` varchar(255) DEFAULT '',
  `price` decimal(10,2) DEFAULT '0.00',
  `keyword` varchar(255) DEFAULT '',
  `description` text,
  `status` int(1) DEFAULT '1',
  `created` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_meal_goods`
--

CREATE TABLE `swd_meal_goods` (
  `mg_id` int(11) UNSIGNED NOT NULL,
  `meal_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_message`
--

CREATE TABLE `swd_message` (
  `msg_id` int(10) UNSIGNED NOT NULL,
  `from_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `to_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT '',
  `content` text,
  `add_time` int(10) UNSIGNED DEFAULT NULL,
  `last_update` int(10) UNSIGNED DEFAULT NULL,
  `new` tinyint(3) UNSIGNED DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `status` tinyint(3) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_message`
--

INSERT INTO `swd_message` (`msg_id`, `from_id`, `to_id`, `title`, `content`, `add_time`, `last_update`, `new`, `parent_id`, `status`) VALUES
(1, 3, 29, '', '但是发生的', 1693335772, 1693335772, 1, 0, 3);

-- --------------------------------------------------------

--
-- 表的结构 `swd_msg`
--

CREATE TABLE `swd_msg` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `num` int(10) UNSIGNED DEFAULT '0',
  `functions` varchar(255) DEFAULT NULL,
  `state` tinyint(3) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_msg_log`
--

CREATE TABLE `swd_msg_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `receiver` varchar(20) NOT NULL DEFAULT '',
  `verifycode` int(10) UNSIGNED DEFAULT NULL,
  `codekey` varchar(32) NOT NULL DEFAULT '',
  `content` text,
  `quantity` int(10) DEFAULT '0',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(3) DEFAULT '0',
  `message` varchar(100) DEFAULT NULL,
  `add_time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_msg_template`
--

CREATE TABLE `swd_msg_template` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(30) NOT NULL,
  `scene` varchar(50) NOT NULL,
  `signName` varchar(50) NOT NULL,
  `templateId` varchar(40) NOT NULL,
  `content` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_navigation`
--

CREATE TABLE `swd_navigation` (
  `nav_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) DEFAULT 'middle',
  `title` varchar(60) NOT NULL DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `sort_order` tinyint(3) UNSIGNED DEFAULT '255',
  `if_show` int(1) DEFAULT '1',
  `open_new` tinyint(3) UNSIGNED DEFAULT '0',
  `hot` tinyint(3) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_navigation`
--

INSERT INTO `swd_navigation` (`nav_id`, `type`, `title`, `link`, `sort_order`, `if_show`, `open_new`, `hot`) VALUES
(1, 'middle', '开业花篮', 'search/goods.html?cate_id=62', 1, 1, 0, 0),
(2, 'middle', '开业绿植', 'search/goods.html?cate_id=21', 2, 1, 0, 0),
(3, 'middle', '领券中心', 'coupon/index.html', 255, 1, 0, 0),
(4, 'middle', '花束', 'search/goods.html?cate_id=64', 3, 1, 0, 0),
(5, 'middle', '小盆栽', 'search/goods.html?cate_id=1313', 4, 1, 0, 0),
(6, 'middle', '积分商城', 'integral/index.html', 255, 1, 0, 0),
(7, 'middle', '限时促销', 'limitbuy/index.html', 255, 0, 0, 0),
(8, 'middle', '品牌', 'brand/index.html', 255, 0, 0, 0),
(9, 'middle', '鲜花', 'search/goods.html?cate_id=65', 5, 1, 0, 0),
(10, 'middle', '花艺培训', 'article/index.html?cate_id=3', 255, 1, 0, 0),
(11, 'middle', '场地布置', 'article/index.html?cate_id=2', 255, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `swd_order`
--

CREATE TABLE `swd_order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `gtype` varchar(10) DEFAULT 'material',
  `otype` varchar(10) DEFAULT 'normal',
  `seller_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `seller_name` varchar(100) DEFAULT NULL,
  `buyer_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `buyer_name` varchar(100) DEFAULT NULL,
  `buyer_email` varchar(60) DEFAULT '',
  `status` tinyint(3) UNSIGNED DEFAULT '0',
  `add_time` int(10) UNSIGNED DEFAULT NULL,
  `payment_name` varchar(100) DEFAULT NULL,
  `payment_code` varchar(20) DEFAULT '',
  `out_trade_sn` varchar(20) DEFAULT '',
  `pay_time` int(10) UNSIGNED DEFAULT NULL,
  `pay_message` varchar(255) DEFAULT '',
  `ship_time` int(10) UNSIGNED DEFAULT NULL,
  `express_code` varchar(20) DEFAULT NULL,
  `express_no` varchar(50) DEFAULT NULL,
  `express_comkey` varchar(30) DEFAULT NULL,
  `express_company` varchar(50) DEFAULT NULL,
  `finished_time` int(10) UNSIGNED DEFAULT NULL,
  `goods_amount` decimal(10,2) UNSIGNED DEFAULT '0.00',
  `discount` decimal(10,2) UNSIGNED DEFAULT '0.00',
  `order_amount` decimal(10,2) UNSIGNED DEFAULT '0.00',
  `evaluation_status` tinyint(1) UNSIGNED DEFAULT '0',
  `evaluation_time` int(10) UNSIGNED DEFAULT NULL,
  `service_evaluation` decimal(10,2) DEFAULT '0.00',
  `shipped_evaluation` decimal(10,2) DEFAULT '0.00',
  `anonymous` tinyint(3) UNSIGNED DEFAULT '0',
  `postscript` varchar(255) DEFAULT '',
  `pay_alter` tinyint(1) UNSIGNED DEFAULT '0',
  `flag` int(1) DEFAULT '0',
  `memo` varchar(255) DEFAULT '',
  `checkout` int(1) DEFAULT '0',
  `checkout_time` int(11) DEFAULT NULL,
  `adjust_amount` decimal(10,2) DEFAULT '0.00',
  `guider_id` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_order`
--

INSERT INTO `swd_order` (`order_id`, `order_sn`, `gtype`, `otype`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `express_code`, `express_no`, `express_comkey`, `express_company`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `service_evaluation`, `shipped_evaluation`, `anonymous`, `postscript`, `pay_alter`, `flag`, `memo`, `checkout`, `checkout_time`, `adjust_amount`, `guider_id`) VALUES
(45, '16960511956194042', 'material', 'normal', 2, '博艺花卉', 5, '开业零售', '', 40, 1696051195, '预存款', 'deposit', '', 1696582339, '', 1696582394, NULL, '1111', NULL, NULL, 1696814550, '268.00', '0.00', '278.00', 1, 1696814552, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '0.00', 0),
(44, '16958708358271032', 'material', 'normal', 2, '博艺花卉', 58, '中云物流邹旭', '', 40, 1695870835, '预存款', 'deposit', '', 1696582339, '', 1696582399, NULL, '1111', NULL, NULL, 1696814534, '288.00', '0.00', '1680.00', 1, 1696814535, '5.00', '5.00', 0, '祝您，生日快乐，有钱，有爱，无忧，无虑！\r\n凌青云啸九天哥，凤凰振翅，光芒万丈！\r\n乘长风破万里浪，直挂云帆，如愿以偿！', 1, 0, '', 0, NULL, '1382.00', 0),
(43, '16957776525689972', 'material', 'normal', 2, '博艺花卉', 42, '杰仕轩扬', '', 40, 1695777652, '预存款', 'deposit', '', 1696582304, '', 1696582404, NULL, '1111', NULL, NULL, 1696814429, '288.00', '0.00', '260.00', 1, 1696814431, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-38.00', 0),
(41, '16956917350712052', 'material', 'normal', 2, '博艺花卉', 42, '杰仕轩扬', '', 40, 1695691735, '预存款', 'deposit', '', 1695693243, '', 1695702631, NULL, '5456346346', NULL, NULL, 1695702658, '488.00', '0.00', '460.00', 1, 1695702659, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-38.00', 0),
(42, '16956947181368562', 'material', 'normal', 2, '博艺花卉', 43, '天龙纺织', '', 40, 1695694718, '预存款', 'deposit', '', 1695699837, '', 1695702253, NULL, '5456346346', NULL, NULL, 1695702366, '280.00', '0.00', '260.00', 1, 1695702369, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(40, '16956916765396582', 'material', 'normal', 2, '博艺花卉', 42, '杰仕轩扬', '', 40, 1695691676, '预存款', 'deposit', '', 1695693258, '', 1695702644, NULL, '5456346346', NULL, NULL, 1695702663, '488.00', '0.00', '460.00', 1, 1695702664, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-38.00', 0),
(39, '16956907787031702', 'material', 'normal', 2, '博艺花卉', 41, '龙腾置业', '', 40, 1695690778, '预存款', 'deposit', '', 1695693290, '', 1695702639, NULL, '5456346346', NULL, NULL, 1695702668, '288.00', '0.00', '220.00', 1, 1695702669, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-78.00', 0),
(38, '16956364281412802', 'material', 'normal', 2, '博艺花卉', 7, '到店访客', '', 40, 1695636428, '预存款', 'deposit', '', 1695636436, '', 1695636624, NULL, '10000022', NULL, NULL, 1695702674, '288.00', '0.00', '268.00', 1, 1695702676, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(37, '16956353014866692', 'material', 'normal', 2, '博艺花卉', 57, '到店访客', '', 40, 1695635301, '预存款', 'deposit', '', 1695635308, '', 1695636173, NULL, '10000020', NULL, NULL, 1695702691, '288.00', '0.00', '220.00', 1, 1695702693, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-78.00', 0),
(33, '16956317843984132', 'material', 'normal', 2, '博艺花卉', 6, '默宾服饰', '', 40, 1695631784, '预存款', 'deposit', '', 1696582188, '', 1696582426, NULL, '111', NULL, NULL, 1696814741, '280.00', '0.00', '260.00', 1, 1696814742, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(34, '16956320065524932', 'material', 'normal', 2, '博艺花卉', 6, '默宾服饰', '', 40, 1695632006, '预存款', 'deposit', '', 1696582188, '', 1696582415, NULL, '111', NULL, NULL, 1696814750, '280.00', '0.00', '260.00', 1, 1696814751, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(35, '16956321468719702', 'material', 'normal', 2, '博艺花卉', 6, '默宾服饰', '', 40, 1695632146, '预存款', 'deposit', '', 1696582188, '', 1696582410, NULL, '111', NULL, NULL, 1696814732, '280.00', '0.00', '260.00', 1, 1696814734, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(36, '16956331543511092', 'material', 'normal', 2, '博艺花卉', 57, '到店访客', '', 40, 1695633154, '预存款', 'deposit', '', 1695635046, '', 1695636183, NULL, '10000021', NULL, NULL, 1695702703, '388.00', '0.00', '350.00', 1, 1695702705, '5.00', '5.00', 0, '', 0, 0, '', 0, NULL, '-48.00', 0),
(46, '16960513359149352', 'material', 'normal', 2, '博艺花卉', 5, '开业零售', '', 40, 1696051335, '预存款', 'deposit', '', 1696582339, '', 1696582387, NULL, '1111', NULL, NULL, 1696814541, '268.00', '0.00', '278.00', 1, 1696814542, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '0.00', 0),
(47, '16962168555494052', 'material', 'normal', 2, '博艺花卉', 5, '开业零售', '', 40, 1696216855, '预存款', 'deposit', '', 1696582339, '', 1696582382, NULL, '11111', NULL, NULL, 1696814437, '388.00', '0.00', '398.00', 1, 1696814438, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '0.00', 0),
(48, '16962171272810932', 'material', 'normal', 2, '博艺花卉', 5, '开业零售', '', 40, 1696217127, '预存款', 'deposit', '', 1696582339, '', 1696582377, NULL, '1111', NULL, NULL, 1696814461, '288.00', '0.00', '298.00', 1, 1696814462, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '0.00', 0),
(49, '16963258543550882', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1696325854, '预存款', 'deposit', '', 1696582339, '', 1696582367, NULL, '111', NULL, NULL, 1696814468, '380.00', '0.00', '390.00', 1, 1696814469, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '0.00', 0),
(50, '16963261968097102', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1696326196, '预存款', 'deposit', '', 1696582339, '', 1696582362, NULL, '1111', NULL, NULL, 1696814448, '280.00', '0.00', '290.00', 1, 1696814449, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '0.00', 0),
(51, '16965818269577892', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1696581826, '预存款', 'deposit', '', 1696582339, '', 1696582356, NULL, '111', NULL, NULL, 1696814454, '288.00', '0.00', '298.00', 1, 1696814455, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '0.00', 0),
(52, '16966463272513772', 'material', 'normal', 2, '博艺花卉', 82, '白旺旺', '', 11, 1696646327, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '580.00', '0.00', '300.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-290.00', 0),
(53, '16966467829542192', 'material', 'normal', 2, '博艺花卉', 59, '吴涛', '', 40, 1696646782, '货到付款', 'cod', '', NULL, '', 1696814584, NULL, '1111', NULL, NULL, 1696814594, '580.00', '0.00', '300.00', 1, 1696814595, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-290.00', 0),
(54, '16966594545283322', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1696659454, '预存款', 'deposit', '', 1696814395, '', 1696814672, NULL, '1111', NULL, NULL, 1696814677, '260.00', '0.00', '150.00', 1, 1696814679, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-110.00', 0),
(55, '16966603217526672', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1696660321, '预存款', 'deposit', '', 1696728698, '', 1696930163, NULL, '1111', NULL, NULL, 1696930173, '788.00', '0.00', '780.00', 1, 1696930175, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-18.00', 0),
(56, '16967280968458682', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1696728096, '预存款', 'deposit', '', 1696728656, '', 1696814648, NULL, '111', NULL, NULL, 1696814651, '536.00', '0.00', '300.00', 1, 1696814653, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-251.00', 0),
(57, '16968140776915192', 'material', 'normal', 2, '博艺花卉', 45, '维多利纺织', '', 11, 1696814077, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '260.00', '0.00', '240.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(58, '16968164502985572', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1696816450, '预存款', 'deposit', '', 1696817448, '', 1696817462, NULL, '11', NULL, NULL, 1696817464, '288.00', '0.00', '100.00', 1, 1696817466, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-188.00', 0),
(59, '16968354009181032', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1696835400, '预存款', 'deposit', '', 1696930229, '', 1696930238, NULL, '1111', NULL, NULL, 1696930241, '288.00', '0.00', '1.00', 1, 1696930243, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-297.00', 0),
(60, '16969102558040482', 'material', 'normal', 2, '博艺花卉', 61, '德丰~肖丹', '', 40, 1696910255, '预存款', 'deposit', '', 1696930118, '', 1696930184, NULL, '1111', NULL, NULL, 1696930195, '260.00', '0.00', '220.00', 1, 1696930196, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-50.00', 0),
(61, '16969299434532242', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1696929943, '预存款', 'deposit', '', 1696929970, '', 1696930187, NULL, '1111', NULL, NULL, 1696930190, '288.00', '0.00', '150.00', 1, 1696930192, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-148.00', 0),
(62, '16970995116856292', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1697099511, '预存款', 'deposit', '', 1697176306, '', 1697341234, NULL, '1111', NULL, NULL, 1697341239, '288.00', '0.00', '150.00', 1, 1697341241, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-148.00', 0),
(63, '16971759259144472', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1697175925, '预存款', 'deposit', '', 1698140660, '', 1698140741, NULL, '1111', NULL, NULL, 1698140748, '676.00', '0.00', '350.00', 1, 1698140749, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-341.00', 0),
(64, '16971771044226702', 'material', 'normal', 2, '博艺花卉', 62, '史丽丽', '', 11, 1697177104, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '288.00', '0.00', '298.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '0.00', 0),
(65, '16971855638826902', 'material', 'normal', 2, '博艺花卉', 54, '万宝纺织', '', 40, 1697185563, '预存款', 'deposit', '', 1697185579, '', 1697341213, NULL, '1111', NULL, NULL, 1697341218, '280.00', '0.00', '200.00', 1, 1697341220, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-90.00', 0),
(66, '16973407704386052', 'material', 'normal', 2, '博艺花卉', 63, '诺信纺织', '', 11, 1697340770, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '320.00', '0.00', '280.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-50.00', 0),
(67, '16973410434083232', 'material', 'normal', 2, '博艺花卉', 64, '叁易服饰', '', 11, 1697341043, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '280.00', '0.00', '260.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(68, '16973411446360382', 'material', 'normal', 2, '博艺花卉', 64, '叁易服饰', '', 11, 1697341144, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '280.00', '0.00', '260.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(69, '16973413199624032', 'material', 'normal', 2, '博艺花卉', 65, '维多利纺织-彪', '', 11, 1697341319, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '280.00', '0.00', '260.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(70, '16973594777846932', 'material', 'normal', 2, '博艺花卉', 66, 'QKK服饰', '', 40, 1697359477, '预存款', 'deposit', '', 1697361130, '', 1697418511, NULL, '1111', NULL, NULL, 1697418515, '280.00', '0.00', '260.00', 1, 1697418517, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(71, '16974175265436422', 'material', 'normal', 2, '博艺花卉', 67, '杰仕轩扬~涛哥', '', 11, 1697417526, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '280.00', '0.00', '260.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(72, '16974176432168572', 'material', 'normal', 2, '博艺花卉', 68, '聖甲~英子', '', 11, 1697417643, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '280.00', '0.00', '260.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(73, '16974213088832952', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1697421308, '预存款', 'deposit', '', 1697425943, '', 1697431173, NULL, '1111', NULL, NULL, 1697431180, '288.00', '0.00', '150.00', 1, 1697431181, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-148.00', 0),
(74, '16974223021382872', 'material', 'normal', 2, '博艺花卉', 69, '杨雨甜', '', 40, 1697422302, '预存款', 'deposit', '', 1697425563, '', 1697425585, NULL, '1111', NULL, NULL, 1697437734, '288.00', '0.00', '226.00', 1, 1697437735, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-72.00', 0),
(75, '16974253874216802', 'material', 'normal', 2, '博艺花卉', 70, '杉线谱服饰~阿丁', '', 40, 1697425387, '预存款', 'deposit', '', 1697529041, '', 1697529051, NULL, '1111', NULL, NULL, 1697529055, '280.00', '0.00', '220.00', 1, 1697529057, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-70.00', 0),
(76, '16975251647677662', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1697525164, '预存款', 'deposit', '', 1697525313, '', 1697527116, NULL, '1111', NULL, NULL, 1697527119, '136.00', '0.00', '70.00', 1, 1697527121, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-81.00', 0),
(77, '16975251883827992', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1697525188, '预存款', 'deposit', '', 1697525331, '', 1697526838, NULL, '1111', NULL, NULL, 1697526995, '68.00', '0.00', '20.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-58.00', 0),
(78, '16975251975384082', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1697525197, '预存款', 'deposit', '', 1697525341, '', 1697526411, NULL, '1111', NULL, NULL, 1697526957, '35.00', '0.00', '10.00', 1, 1697526959, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-35.00', 0),
(79, '16976068636577452', 'material', 'normal', 2, '博艺花卉', 72, '振宇俊男', '', 11, 1697606863, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '280.00', '0.00', '260.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(80, '16976232487671932', 'material', 'normal', 2, '博艺花卉', 73, '骏鑫辅料-李拓', '', 11, 1697623248, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '260.00', '0.00', '220.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-70.00', 0),
(81, '16976827098720702', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1697682709, '预存款', 'deposit', '', 1697682757, '', 1697697612, NULL, '1111', NULL, NULL, 1697697615, '580.00', '0.00', '450.00', 1, 1697697617, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-140.00', 0),
(82, '16977663103773442', 'material', 'normal', 2, '博艺花卉', 74, '田传义', '', 40, 1697766310, '预存款', 'deposit', '', 1697766319, '', 1697778659, NULL, '1111', NULL, NULL, 1697778662, '150.00', '0.00', '160.00', 1, 1697778665, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '0.00', 0),
(83, '16977667965635182', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1697766796, '预存款', 'deposit', '', 1697766805, '', 1697778649, NULL, '1111', NULL, NULL, 1697778651, '880.00', '0.00', '120.00', 1, 1697778652, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-770.00', 0),
(84, '16977774197670762', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1697777419, '预存款', 'deposit', '', 1697778674, '', 1697782044, NULL, '1111', NULL, NULL, 1697782047, '150.00', '0.00', '150.00', 1, 1697782048, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-10.00', 0),
(85, '16977897130617282', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1697789713, '预存款', 'deposit', '', 1697790709, '', 1697790714, NULL, '1111', NULL, NULL, 1697790717, '288.00', '0.00', '158.00', 1, 1697790718, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-140.00', 0),
(86, '16978544759566612', 'material', 'normal', 2, '博艺花卉', 75, '鉴航纺织', '', 40, 1697854475, '预存款', 'deposit', '', 1697877315, '', 1697877328, NULL, '1111', NULL, NULL, 1697877336, '288.00', '0.00', '150.00', 1, 1697877338, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-148.00', 0),
(87, '16978564279311502', 'material', 'normal', 2, '博艺花卉', 44, '西部牛仔旺', '', 40, 1697856427, '预存款', 'deposit', '', 1697877305, '', 1697877324, NULL, '1111', NULL, NULL, 1697877330, '288.00', '0.00', '150.00', 1, 1697877332, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-148.00', 0),
(88, '16980237963396282', 'material', 'normal', 2, '博艺花卉', 76, '周工', '', 40, 1698023796, '预存款', 'deposit', '', 1698118956, '', 1698119023, NULL, '1111', NULL, NULL, 1698119060, '488.00', '0.00', '260.00', 1, 1698119062, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-238.00', 0),
(89, '16980238806324512', 'material', 'normal', 2, '博艺花卉', 78, '郭惠', '', 40, 1698023880, '预存款', 'deposit', '', 1698118367, '', 1698119017, NULL, '1111', NULL, NULL, 1698119056, '680.00', '0.00', '430.00', 1, 1698119057, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-260.00', 0),
(90, '16980539173056092', 'material', 'normal', 2, '博艺花卉', 77, '孙雪晴', '', 40, 1698053917, '预存款', 'deposit', '', 1698118948, '', 1698119014, NULL, '1111', NULL, NULL, 1698119051, '288.00', '0.00', '130.00', 1, 1698119053, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-168.00', 0),
(91, '16981112338243632', 'material', 'normal', 2, '博艺花卉', 76, '周工', '', 40, 1698111233, '预存款', 'deposit', '', 1698118941, '', 1698119010, NULL, '1111', NULL, NULL, 1698119047, '480.00', '0.00', '260.00', 1, 1698119048, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-230.00', 0),
(92, '16981112436626192', 'material', 'normal', 2, '博艺花卉', 78, '郭惠', '', 40, 1698111243, '预存款', 'deposit', '', 1698118351, '', 1698119007, NULL, '1111', NULL, NULL, 1698119043, '480.00', '0.00', '490.00', 1, 1698119044, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '0.00', 0),
(93, '16981112519244572', 'material', 'normal', 2, '博艺花卉', 76, '周工', '', 40, 1698111251, '预存款', 'deposit', '', 1698118932, '', 1698119003, NULL, '1111', NULL, NULL, 1698119034, '115.00', '0.00', '30.00', 1, 1698119035, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-108.00', 0),
(94, '16981112598528382', 'material', 'normal', 2, '博艺花卉', 76, '周工', '', 40, 1698111259, '预存款', 'deposit', '', 1698118925, '', 1698119000, NULL, '1111', NULL, NULL, 1698119039, '68.00', '0.00', '30.00', 1, 1698119040, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-48.00', 0),
(95, '16981113175595062', 'material', 'normal', 2, '博艺花卉', 76, '周工', '', 40, 1698111317, '预存款', 'deposit', '', 1698118917, '', 1698118997, NULL, '1111', NULL, NULL, 1698119030, '68.00', '0.00', '60.00', 1, 1698119032, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-18.00', 0),
(96, '16981121846831962', 'material', 'normal', 2, '博艺花卉', 76, '周工', '', 40, 1698112184, '预存款', 'deposit', '', 1698118910, '', 1698118993, NULL, '1111', NULL, NULL, 1698119026, '480.00', '0.00', '260.00', 1, 1698119027, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-230.00', 0),
(97, '16981242911746482', 'material', 'normal', 2, '博艺花卉', 78, '郭惠', '', 40, 1698124291, '预存款', 'deposit', '', 1698124717, '', 1698124724, NULL, '1111', NULL, NULL, 1698124727, '45.00', '0.00', '55.00', 1, 1698124729, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '0.00', 0),
(98, '16981300473275772', 'material', 'normal', 2, '博艺花卉', 80, '补发', '', 40, 1698130047, '预存款', 'deposit', '', 1698140961, '', 1698145431, NULL, '1111', NULL, NULL, 1698145474, '488.00', '0.00', '498.00', 1, 1698145475, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '0.00', 0),
(99, '16981349733547512', 'material', 'normal', 2, '博艺花卉', 83, 'wx~美好向往', '', 40, 1698134973, '预存款', 'deposit', '', 1698140796, '', 1698145434, NULL, '1111', NULL, NULL, 1698145470, '288.00', '0.00', '350.00', 1, 1698145471, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-148.00', 0),
(100, '16981409246630212', 'material', 'normal', 2, '博艺花卉', 78, '郭惠', '', 40, 1698140924, '预存款', 'deposit', '', 1698140969, '', 1698145437, NULL, '1111', NULL, NULL, 1698145465, '260.00', '0.00', '60.00', 1, 1698145466, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-210.00', 0),
(101, '16981452998599692', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1698145299, '预存款', 'deposit', '', 1698145413, '', 1698145441, NULL, '1111', NULL, NULL, 1698145461, '288.00', '0.00', '130.00', 1, 1698145462, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-168.00', 0),
(102, '16981453577955912', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1698145357, '预存款', 'deposit', '', 1698145405, '', 1698145444, NULL, '1111', NULL, NULL, 1698145447, '260.00', '0.00', '130.00', 1, 1698145448, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-140.00', 0),
(103, '16981453662198632', 'material', 'normal', 2, '博艺花卉', 4, '散单零售', '453115621@qq.com', 40, 1698145366, '预存款', 'deposit', '', 1698145397, '', 1698145453, NULL, '1111', NULL, NULL, 1698145456, '268.00', '0.00', '130.00', 1, 1698145457, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-148.00', 0),
(104, '16982892674389592', 'material', 'normal', 2, '博艺花卉', 84, '明明', '', 40, 1698289267, '预存款', 'deposit', '', 1699169281, '', 1699169315, NULL, '1111', NULL, NULL, 1699169412, '260.00', '0.00', '260.00', 1, 1699169413, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-10.00', 0),
(105, '16983953940431282', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1698395394, '预存款', 'deposit', '', 1698398235, '', 1699064463, NULL, '111', NULL, NULL, 1699064489, '268.00', '0.00', '150.00', 1, 1699064490, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-128.00', 0),
(106, '16983978886279312', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1698397888, '预存款', 'deposit', '', 1698398444, '', 1699064475, NULL, '1111', NULL, NULL, 1699064481, '268.00', '0.00', '150.00', 1, 1699064482, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-128.00', 0),
(107, '16984851747041162', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1698485174, '预存款', 'deposit', '', 1699169292, '', 1699169408, NULL, '1111', NULL, NULL, 1699169418, '288.00', '0.00', '120.00', 1, 1699169419, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-178.00', 0),
(108, '16984853643789952', 'material', 'normal', 2, '博艺花卉', 85, '魏芳', '', 40, 1698485364, '预存款', 'deposit', '', 1699169303, '', 1699169403, NULL, '1111', NULL, NULL, 1699169424, '288.00', '0.00', '120.00', 1, 1699169426, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-178.00', 0),
(109, '16984855009363032', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1698485500, '预存款', 'deposit', '', 1699169254, '', 1699169398, NULL, '1111', NULL, NULL, 1699169431, '288.00', '0.00', '120.00', 1, 1699169432, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-178.00', 0),
(110, '16987194216233432', 'material', 'normal', 2, '博艺花卉', 86, '盛先生', '', 40, 1698719421, '预存款', 'deposit', '', 1698719790, '', 1699064287, NULL, '1111', NULL, NULL, 1699064466, '150.00', '0.00', '150.00', 1, 1699064467, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-10.00', 0),
(111, '16987231095368922', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1698723109, '预存款', 'deposit', '', 1698723296, '', 1699064273, NULL, '1111', NULL, NULL, 1699064279, '388.00', '0.00', '350.00', 1, 1699064282, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-48.00', 0),
(112, '16988271186729092', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1698827118, '预存款', 'deposit', '', 1699169189, '', 1699169357, NULL, '1111', NULL, NULL, 1699169388, '388.00', '0.00', '350.00', 1, 1699169389, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-48.00', 0),
(113, '16990220527721502', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699022052, '预存款', 'deposit', '', 1699169268, '', 1699169353, NULL, '1111', NULL, NULL, 1699169383, '780.00', '0.00', '600.00', 1, 1699169384, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-190.00', 0),
(114, '16990635830666832', 'material', 'normal', 2, '博艺花卉', 87, '程静', '', 40, 1699063583, '预存款', 'deposit', '', 1699169158, '', 1699169350, NULL, '1111', NULL, NULL, 1699169377, '380.00', '0.00', '290.00', 1, 1699169379, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-100.00', 0),
(115, '16990636923295182', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699063692, '预存款', 'deposit', '', 1699169261, '', 1699169347, NULL, '1111', NULL, NULL, 1699169373, '780.00', '0.00', '600.00', 1, 1699169374, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-190.00', 0),
(116, '16990639295258192', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699063929, '预存款', 'deposit', '', 1699169202, '', 1699169343, NULL, '1111', NULL, NULL, 1699169369, '260.00', '0.00', '150.00', 1, 1699169370, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-120.00', 0),
(117, '16990639717972042', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699063971, '预存款', 'deposit', '', 1699169209, '', 1699169340, NULL, '1111', NULL, NULL, 1699169364, '288.00', '0.00', '160.00', 1, 1699169365, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-138.00', 0),
(118, '16990640023348062', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699064002, '预存款', 'deposit', '', 1699169216, '', 1699169336, NULL, '1111', NULL, NULL, 1699169360, '268.00', '0.00', '160.00', 1, 1699169361, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-118.00', 0),
(119, '16990640213775972', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699064021, '预存款', 'deposit', '', 1699064696, '', 1699064711, NULL, '1111', NULL, NULL, 1699064722, '288.00', '0.00', '120.00', 1, 1699064723, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-178.00', 0),
(120, '16990640503121622', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699064050, '预存款', 'deposit', '', 1699064623, '', 1699064708, NULL, '1111', NULL, NULL, 1699064718, '260.00', '0.00', '120.00', 1, 1699064719, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-150.00', 0),
(121, '16990640665584402', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699064066, '预存款', 'deposit', '', 1699064615, '', 1699064705, NULL, '1111', NULL, NULL, 1699064713, '268.00', '0.00', '120.00', 1, 1699064715, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-158.00', 0),
(122, '16990645544952652', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699064554, '预存款', 'deposit', '', 1699064735, '', 1699064741, NULL, '1111', NULL, NULL, 1699064744, '35.00', '0.00', '15.00', 1, 1699064746, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-30.00', 0),
(123, '16990699075441132', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699069907, '预存款', 'deposit', '', 1699169242, '', 1699169323, NULL, '1111', NULL, NULL, 1699169329, '388.00', '0.00', '300.00', 1, 1699169331, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-98.00', 0),
(124, '16990700496993882', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699070049, '预存款', 'deposit', '', 1699169235, '', 1699169319, NULL, '1111', NULL, NULL, 1699169325, '580.00', '0.00', '450.00', 1, 1699169326, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-140.00', 0),
(125, '16991686864028052', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699168686, '预存款', 'deposit', '', 1699168800, '', 1699168807, NULL, '1111', NULL, NULL, 1699168810, '68.00', '0.00', '35.00', 1, 1699168812, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-43.00', 0),
(126, '16992431228568582', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699243122, '预存款', 'deposit', '', 1699243135, '', 1699243140, NULL, '1111', NULL, NULL, 1699243143, '288.00', '0.00', '138.00', 1, 1699243145, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-160.00', 0),
(127, '16993220057315012', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699322005, '预存款', 'deposit', '', 1699434221, '', 1699674341, NULL, '1111', NULL, NULL, 1699674350, '380.00', '0.00', '260.00', 1, 1699674351, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-130.00', 0),
(128, '16994339587112962', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699433958, '预存款', 'deposit', '', 1699434059, '', 1699674337, NULL, '1111', NULL, NULL, 1699674345, '288.00', '0.00', '100.00', 1, 1699674346, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-198.00', 0),
(129, '16994918138723102', 'material', 'normal', 2, '博艺花卉', 89, '云尚韩国馆', '', 11, 1699491813, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '288.00', '0.00', '165.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-133.00', 0),
(130, '16994922715666602', 'material', 'normal', 2, '博艺花卉', 89, '云尚韩国馆', '', 11, 1699492271, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '288.00', '0.00', '165.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-133.00', 0),
(131, '16994930281949172', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 11, 1699493028, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '288.00', '0.00', '150.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-148.00', 0),
(132, '16994935471394602', 'material', 'normal', 2, '博艺花卉', 88, '祥盛布行~李思', '', 11, 1699493547, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '580.00', '0.00', '400.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-190.00', 0),
(133, '16995805757921732', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699580575, '预存款', 'deposit', '', 1699580672, '', 1699674331, NULL, '1111', NULL, NULL, 1699674356, '5.00', '0.00', '80.00', 1, 1699674357, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '65.00', 0),
(134, '16996048115868232', 'material', 'normal', 2, '博艺花卉', 90, '德丰纺织', '', 40, 1699604811, '预存款', 'deposit', '', 1699674316, '', 1699674327, NULL, '1111', NULL, NULL, 1699674360, '488.00', '0.00', '350.00', 1, 1699674362, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-148.00', 0),
(135, '16996634763033892', 'material', 'normal', 2, '博艺花卉', 81, '匿名', '', 40, 1699663476, '预存款', 'deposit', '', 1699674293, '', 1699674323, NULL, '1111', NULL, NULL, 1699674365, '268.00', '0.00', '60.00', 1, 1699674367, '5.00', '5.00', 0, '', 1, 0, '', 0, NULL, '-218.00', 0),
(136, '16996957605955502', 'material', 'normal', 2, '博艺花卉', 91, '侄女', '', 10, 1699695760, '货到付款', 'cod', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '35.00', '0.00', '40.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-5.00', 0),
(137, '16997607439730132', 'material', 'normal', 2, '博艺花卉', 92, '海华毛绒', '', 11, 1699760743, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '288.00', '0.00', '190.00', 0, NULL, '0.00', '0.00', 0, '', 1, 0, '', 0, NULL, '-108.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `swd_order_extm`
--

CREATE TABLE `swd_order_extm` (
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `region_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `region_name` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `signature` varchar(60) DEFAULT ' ',
  `subscriber` varchar(60) DEFAULT '',
  `content` text,
  `zipcode` varchar(20) DEFAULT '',
  `phone_tel` varchar(60) DEFAULT '',
  `phone_mob` varchar(20) DEFAULT '',
  `shipping_name` varchar(100) DEFAULT NULL,
  `shipping_fee` decimal(10,2) DEFAULT '0.00',
  `what_day` varchar(30) DEFAULT NULL,
  `book_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_order_extm`
--

INSERT INTO `swd_order_extm` (`order_id`, `consignee`, `region_id`, `region_name`, `address`, `signature`, `subscriber`, `content`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_name`, `shipping_fee`, `what_day`, `book_id`) VALUES
(44, '林方', 284, '湖北省 武汉', '江汉路伙伴市场集财里55号', '匿名', '中云物流邹旭', '祝您，生日快乐，有钱，有爱，无忧，无虑！ 凌青云啸九天哥，凤凰振翅，光芒万丈！ 乘长风破万里浪，直挂云帆，如愿以偿', '', '', '18327277170', '快递', '10.00', '', 0),
(43, '时尚战果服饰', 284, '湖北省 武汉', '蓝宝石3F6-1号', '1+7服饰', '大伟1+7', '', '', '', '', '快递', '10.00', '开业', 0),
(42, '铭杨烟酒', 284, '湖北省 武汉', '银座后面上破', '陈泽亮', '天龙纺织', '', '', '', '', '快递', '10.00', '开业', 0),
(41, '时尚战果服饰', 284, '湖北省 武汉', '蓝宝石3F6-1号', '佰汇馆 老曾', '杰仕轩扬', '', '', '', '', '快递', '10.00', '开业', 0),
(40, '时尚战果服饰', 284, '湖北省 武汉', '蓝宝石3F6-1号', '杰仕轩扬 涛哥', '杰仕轩扬', '', '', '', '', '快递', '10.00', '开业', 0),
(39, '时尚战果服饰', 284, '湖北省 武汉', '蓝宝石3F6-1号', '龙腾置业', '龙腾置业', '', '', '', '', '快递', '10.00', '开业', 0),
(38, '散单零售', 284, '湖北省 武汉', '自提', '匿名', '到店访客', '', '', '', '', '快递', '10.00', '', 0),
(37, '散单零售', 284, '湖北省 武汉', '自提', '吴年伟', '吴年伟', '', '', '', '', '快递', '10.00', '生日', 0),
(36, '欧派·金果果', 284, '湖北省 武汉', '金正茂B区4楼15-17号', '阿盛', '吴年伟', '', '', '', '', '快递', '10.00', '', 0),
(35, '铭杨烟酒', 284, '湖北省 武汉', '银座后面上破', 'D社服饰', '默宾服饰', '', '', '', '', '快递', '10.00', '开业', 0),
(34, '铭杨烟酒', 284, '湖北省 武汉', '银座后面上破', '默宾服饰', '默宾服饰', '', '', '', '', '快递', '10.00', '开业', 0),
(33, '铭杨烟酒', 284, '湖北省 武汉', '银座后面上破', 'HK服饰', '默宾服饰', '', '', '', '', '快递', '10.00', '开业', 0),
(46, '桃子', 284, '湖北省 武汉', '钻石座5楼501(单链反应)', '君哥', '开业零售', '祝您，生日快乐，有钱，有爱，无忧，无虑！\r\n凌青云啸九天哥，凤凰振翅，光芒万丈！\r\n乘长风破万里浪，直挂云帆，如愿以偿！', '', '', '18607103082', '快递', '10.00', '', 0),
(47, '老婆', 284, '湖北省 武汉', '红宝石2楼62号', '老公', '开业零售', '生日快乐，暴富！暴美！暴顺利！\r\n未来眼里是阳光，笑里是坦荡，所求皆所愿，永远年轻漂亮！', '', '', '', '快递', '10.00', '', 0),
(48, '亲爱的', 284, '湖北省 武汉', '红宝石2楼62号', '代菲', '开业零售', '今日女主角 永远18岁\r\n愿以后幸运多一点 生日快乐', '', '', '', '快递', '10.00', '', 0),
(50, '亲爱的', 284, '湖北省 武汉', '金正茂', '彭亚', '散单零售', '“愿所有的梦想都实现 ，所有的希望都如愿 ，所有的付出都兑现”生日快乐！', '', '', '', '快递', '10.00', '', 0),
(45, '匿名', 0, '匿名', '到店自提', '匿名', '开业零售', '', '', '', '', NULL, '10.00', '', 0),
(49, '亲爱的', 284, '湖北省 武汉', '金正茂', '王婷', '散单零售', '成长不期而遇，生日如约而至，愿以后的日子里不将就，也不辜负此生平安喜乐，生日快乐！', '', '', '', '快递', '10.00', '', 0),
(51, '郭慧', 284, '湖北省 武汉', '自提', '维多利防止', '散单零售', '“愿所有的梦想都实现 ，所有的希望都如愿 ，所有的付出都兑现”生日快乐！', '', '', '', '快递', '10.00', '', 0),
(52, '雲尚海潮传媒有限公司', 284, '湖北省 武汉', '云尚3号楼1716', '依铭服饰', '白旺旺', '开业大吉,生意兴隆!', '', '', '18668384999', '快递', '10.00', '开业', 0),
(53, '雲尚海潮传媒有限公司', 284, '湖北省 武汉', '云尚3号楼1716，负责人电话18668384999', '吴涛', '吴涛', '开业大吉,生意兴隆!', '', '', '', '快递', '10.00', '开业', 0),
(54, '美女', 0, '', '小商品市场二楼', '匿名', '散单零售', '', '', '', '', NULL, '0.00', NULL, 0),
(55, '老婆(杨柳)', 284, '湖北省 武汉', '金座三楼138号，旭东裤行', '老公', '散单零售', '烛光闪闪，快乐幸福，生日快乐，心想事成，幸运之日，吉祥之日，愿愿顺心，事事如意，祝君生日快乐，开心幸福！', '', '', '13733445815', '快递', '10.00', '生日', 0),
(56, '姑妈', 284, '湖北省 武汉', '大夹街', '思思', '散单零售', '生日快乐!祝您开心幸福，心想事成，万事如意', '', '', '', '快递', '15.00', '生日', 0),
(57, '波莱斯邦', 284, '湖北省 武汉', '云尚3号楼32楼', '维多利纺织', '维多利纺织', '开业大吉，生意兴隆', '', '', '', '快递', '10.00', '开业', 0),
(58, '匿名', 0, '', '到店自提', '匿名', '散单零售', '', '', '', '', NULL, '0.00', '生日', 0),
(59, '匿名', 284, '湖北省 武汉', '到店自提', '匿名', '散单零售', NULL, '', '', '', '快递', '10.00', NULL, 0),
(60, '刘霞姐', 284, '湖北省 武汉', '金座1F65号', '丹丹', '德丰~肖丹', '刘霞姐生日快乐，爱你哦！', '', '', '15377623826', '快递', '10.00', '生日', 0),
(61, '妈妈', 284, '湖北省 武汉', '品牌2楼深圳路2281号', '匿名', '散单零售', '生日快乐', '', '', '', '快递', '10.00', NULL, 0),
(62, '雷小姐', 284, '湖北省 武汉', '红宝石2楼47号', '匿名', '散单零售', '雷小姐；生日快乐', '', '', '', '快递', '10.00', NULL, 0),
(63, '雷小姐', 284, '湖北省 武汉', '红宝石2楼47号', '匿名', '散单零售', '雷小姐；生日快乐', '', '', '', '快递', '15.00', NULL, 0),
(64, '布行', 284, '湖北省 武汉', '红宝石外围', '依铭服饰', '史丽丽', NULL, '', '', '', '快递', '10.00', NULL, 0),
(65, '天龙纺织', 284, '湖北省 武汉', '银座S-29', '万宝纺织', '万宝纺织', '', '', '', '', '快递', '10.00', '开业', 0),
(66, '天龙纺织', 284, '湖北省 武汉', '银座S-29', '诺信纺织', '诺信纺织', '', '', '', '', '快递', '10.00', '开业', 0),
(67, '天龙纺织', 284, '湖北省 武汉', '银座S-29', '叁易服饰', '叁易服饰', '', '', '', '', '快递', '10.00', '开业', 0),
(68, '天龙纺织', 284, '湖北省 武汉', '银座S-29', '浪迪刘毅', '叁易服饰', '', '', '', '', '快递', '10.00', '开业', 0),
(69, '天龙纺织', 284, '湖北省 武汉', '银座S-29', '维多利纺织', '维多利纺织-彪', '', '', '', '', '快递', '10.00', '开业', 0),
(70, '天龙纺织', 284, '湖北省 武汉', '银座S-29', 'QKK服饰', 'QKK服饰', '', '', '', '', '快递', '10.00', '开业', 0),
(71, '天龙纺织', 284, '湖北省 武汉', '银座S-29', '杰仕轩扬', NULL, '', '', '', '', '快递', '10.00', '开业', 0),
(72, '天龙纺织', 284, '湖北省 武汉', '银座S-29', '聖甲', '聖甲~英子', '', '', '', '', '快递', '10.00', '开业', 0),
(73, '王利芳', 284, '湖北省 武汉', '小商品~北厅~402号', '闺蜜', '散单零售', '生日快乐', '', '', '15527388907', '快递', '10.00', '生日', 0),
(74, '秋女士', 284, '湖北省 武汉', '江通批发市场3门C11', '甜甜', '杨雨甜', '生日快乐,暴富暴美！', '', '', '', '快递', '10.00', '生日', 0),
(75, '天龙纺织', 284, '湖北省 武汉', '银座S-29', '杉线谱服饰', '杉线谱服饰~阿丁', '', '', '', '', '快递', '10.00', '开业', 0),
(76, '匿名', 284, '湖北省 武汉', '自提', '匿名', '散单零售', NULL, '', '', '', '快递', '15.00', NULL, 0),
(77, '匿名', 284, '湖北省 武汉', '自提', '匿名', '散单零售', NULL, '', '', '', '快递', '10.00', NULL, 0),
(78, '匿名', 284, '湖北省 武汉', '自提', '匿名', '散单零售', NULL, '', '', '', '快递', '10.00', NULL, 0),
(79, '集上', 284, '湖北省 武汉', '云尚A馆，19F，1910号', '振宇俊男', '振宇俊男', '', '', '', '', '快递', '10.00', '开业', 0),
(80, '集上', 284, '湖北省 武汉', '云尚A馆，19F，1910号', '骏鑫辅料', '骏鑫辅料-李拓', NULL, '', '', '', '快递', '10.00', NULL, 0),
(81, '对位品诺', 284, '湖北省 武汉', '老三镇2楼2310号1', '匿名', '散单零售', '祝我们的开心果财色双收，愿你岁岁平安，岁岁有我们。', '', '', '', '快递', '10.00', '生日', 0),
(82, '胡志红肉制品有限公司', 284, '湖北省 武汉', '胡志红肉制品有限公司', '田传义', '田传义', NULL, '', '', '', '快递', '10.00', '开业', 0),
(83, '胡女士', 284, '湖北省 武汉', '江岸区中山大道1505号（黄浦路地铁口A口）', '匿名', '散单零售', '祝：天下，最美的仙女，生日快乐，早日暴富。', '', '', '13971230110', '快递', '10.00', '生日', 0),
(84, '阿彪名品', 284, '湖北省 武汉', '全新街A-26', '王建华', '散单零售', NULL, '', '', '', '快递', '10.00', '开业', 0),
(85, '匿名', 284, '湖北省 武汉', '自提', '匿名', '散单零售', '', '', '', '', '快递', '10.00', '生日', 0),
(86, '幺爷', 284, '湖北省 武汉', '蓝宝石1楼15号', '静静', '鉴航纺织', '祝幺爷生日快乐!身体健康！万事顺心如意!年年十八!', '', '', '', '快递', '10.00', '生日', 0),
(87, '西部牛仔旺', 284, '湖北省 武汉', '老三镇2F', '匿名', '西部牛仔旺', '美女生日快乐，永远18岁', '', '', '', '快递', '10.00', '生日', 0),
(88, '武汉威帆宜家装饰', 284, '湖北省 武汉', '云尚3号楼3616', '周工', '周工', '', '', '', '', '快递', '10.00', '开业', 0),
(89, '武汉威帆宜家装饰', 284, '湖北省 武汉', '云尚3号楼3616', '博艺花卉', '郭惠', '', '', '', '', '快递', '10.00', '开业', 0),
(90, '别书慧', 284, '湖北省 武汉', '明月宾馆', '孙雪晴', '孙雪晴', NULL, '', '', '', '快递', '10.00', '生日', 0),
(91, '武汉威帆宜家装饰', 284, '湖北省 武汉', '云尚3号楼3616', '周工', '周工', '', '', '', '', '快递', '10.00', '开业', 0),
(92, '武汉威帆宜家装饰', 284, '湖北省 武汉', '云尚3号楼3616', '博艺花卉', '郭惠', '', '', '', '', '快递', '10.00', '开业', 0),
(93, '武汉威帆宜家装饰', 284, '湖北省 武汉', '云尚3号楼3616', '周工', '周工', '', '', '', '', '快递', '10.00', '开业', 0),
(94, '武汉威帆宜家装饰', 284, '湖北省 武汉', '云尚3号楼3616', '周工', '周工', '', '', '', '', '快递', '10.00', '开业', 0),
(95, '武汉威帆宜家装饰', 284, '湖北省 武汉', '云尚3号楼3616', '周工', '周工', '', '', '', '', '快递', '10.00', '开业', 0),
(96, '武汉威帆宜家装饰', 284, '湖北省 武汉', '云尚3号楼3616', '周工', '周工', '', '', '', '', '快递', '10.00', '', 0),
(97, '吴伟年', 284, '湖北省 武汉', '自提', '博艺花卉', '郭惠', '', '', '', '', '快递', '10.00', '', 0),
(98, '尚裁国际', 284, '湖北省 武汉', '红宝石3F，22-1号', '博艺花卉', '补发', '', '', '', '', '快递', '10.00', '', 0),
(99, '婷婷', 284, '湖北省 武汉', '晴川大道世贸52+沿江商业栋1层18号', '嫂子', 'wx~美好向往', '祝美婷婷，暴瘦暴美暴富，生日快乐！永远幸福！', '', '', '18207155955', '快递', '10.00', NULL, 0),
(100, '武汉威帆宜家装饰', 284, '湖北省 武汉', '云尚3号楼3616', '博艺花卉', '郭惠', NULL, '', '', '', '快递', '10.00', NULL, 0),
(101, '匿名', 284, '湖北省 武汉', '自提', '匿名', '散单零售', NULL, '', '', '', '快递', '10.00', NULL, 0),
(102, '匿名', 284, '湖北省 武汉', '自提', '匿名', '散单零售', NULL, '', '', '', '快递', '10.00', NULL, 0),
(103, '匿名', 284, '湖北省 武汉', '自提', '匿名', '散单零售', NULL, '', '', '', '快递', '10.00', NULL, 0),
(104, '小媚', 284, '湖北省 武汉', '银座S1-28', '明明', '明明', '祝你生日快乐，祝你天天快乐！祝你从早上起床快乐到晚上进被窝', '', '', '', '快递', '10.00', NULL, 0),
(105, '刘大姐', 284, '湖北省 武汉', '流通前巷50号', '匿名', '匿名', '祝刘大姐生日快乐', '', '', '', '快递', '10.00', NULL, 0),
(106, '刘华', 284, '湖北省 武汉', '自提', '郑芳', '匿名', '祝刘女士生日快乐', '', '', '', '快递', '10.00', NULL, 0),
(107, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', NULL, '', '', '', '快递', '10.00', NULL, 0),
(108, '匿名', 284, '湖北省 武汉', '金座1楼18号', '魏芳', '魏芳', NULL, '', '', '', '快递', '10.00', NULL, 0),
(109, '匿名', 284, '湖北省 武汉', '红宝石2楼47号', '匿名', '匿名', NULL, '', '', '', '快递', '10.00', NULL, 0),
(110, '林记', 284, '湖北省 武汉', '品牌4号门', '盛先生', '盛先生', NULL, '', '', '13307168900', '快递', '10.00', NULL, 0),
(111, '陈', 284, '湖北省 武汉', '品牌高雄路1楼1106', '匿名', '匿名', '恭喜这位过生日的女孩，又可爱了一岁', '', '', '18627177711', '快递', '10.00', NULL, 0),
(112, '六号线', 284, '湖北省 武汉', '红宝石2楼', '匿名', '匿名', '生日快乐', '', '', '', '快递', '10.00', NULL, 0),
(113, '匿名', 284, '湖北省 武汉', '武胜路万信摩登会馆1910号', '匿名', '匿名', '不负遇见，心存感激，所欲皆温柔，努力皆有果！', '', '', '15002737683', '快递', '10.00', '生日', 0),
(114, '娜姐', 284, '湖北省 武汉', '盘龙城', '程静', '程静', NULL, '', '', '', '快递', '10.00', NULL, 0),
(115, '熊玲', 284, '湖北省 武汉', '泳帽社区永寿门702', '匿名', '匿名', '', '', '', '13163298652', '快递', '10.00', '', 0),
(116, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', '', '', '', '13163298652', '快递', '10.00', '', 0),
(117, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', '生日快乐', '', '', '', '快递', '10.00', NULL, 0),
(118, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', '生日快乐', '', '', '', '快递', '10.00', NULL, 0),
(119, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', '生日快乐', '', '', '', '快递', '10.00', NULL, 0),
(120, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', '生日快乐', '', '', '', '快递', '10.00', NULL, 0),
(121, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', '生日快乐', '', '', '', '快递', '10.00', NULL, 0),
(122, '德乐服饰', 284, '湖北省 武汉', '自提', '匿名', '嫂子', '生日快乐', '', '', '', '快递', '10.00', '', 0),
(123, '新儿', 284, '湖北省 武汉', '送老三镇三楼3702~靓丽阳光', '匿名', '匿名', '愿你再创辉煌！  愿你顺心如意！  愿你健康快乐每一天！', '', '', '', '快递', '10.00', NULL, 0),
(124, '桃', 284, '湖北省 武汉', '送红宝石3F34', '匿名', '匿名', '你是上天的宠儿！ 你是销售战神！你是福星走到哪里你旺到哪里。', '', '', '', '快递', '10.00', NULL, 0),
(125, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', '', '', '', '', '快递', '10.00', '', 0),
(126, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', NULL, '', '', '13163298652', '快递', '10.00', NULL, 0),
(127, '桃', 284, '湖北省 武汉', '送红宝石3F34', '匿名', '匿名', '你是上天的宠儿！ 你是销售战神！你是福星走到哪里你旺到哪里。', '', '', '', '快递', '10.00', NULL, 0),
(128, '桃', 284, '湖北省 武汉', '送红宝石3F34', '匿名', '匿名', '', '', '', '', '快递', '10.00', '', 0),
(129, '妈妈', 284, '湖北省 武汉', '金正茂3B-20号金雅源服饰', '女儿', '韩国馆', '小时候最想做的事是快快长大，而长大后最想做的是希望你慢慢变老，祝你生日快乐，身体健康，青春永驻！', '', '', '', '快递', '10.00', '生日', 0),
(130, '金女士', 284, '湖北省 武汉', '金昌布匹市场C区C1-15号俊刚毛绒', '匿名', '韩国馆', '一句问候，一句祝福，一切如愿，一生幸福，一世平安，所有好运围绕在您身边，祝您生日快乐！', '', '', '', '快递', '10.00', '', 0),
(131, '匿名', 284, '湖北省 武汉', '新味都', '匿名', '匿名', NULL, '', '', '', '快递', '10.00', NULL, 0),
(132, '芳', 284, '湖北省 武汉', '红宝石外围扶梯口左边', '匿名', '祥盛布行~李思', '生日快乐，笑口常开。\r\n是姐妹心中永远的太阳花！！！', '', '', '', '快递', '10.00', '', 0),
(133, '散客', 284, '湖北省 武汉', '自提', '匿名', '匿名', NULL, '', '', '', '快递', '10.00', NULL, 0),
(134, '老婆', 284, '湖北省 武汉', '银座外围S21号德丰纺织', '爱你的老公', '德丰纺织', '感谢你，与我同甘共苦，相濡以沫。在这十年里，只有我知道你受过多少的难为，吃过多少的苦，也只有你才不会嫌弃我贫穷、寒酸，因为你爱着我，我也爱着你。', '', '', '', '快递', '10.00', '', 0),
(135, '匿名', 284, '湖北省 武汉', '自提', '匿名', '匿名', '祝公主生日快乐', '', '', '', '快递', '10.00', NULL, 0),
(136, '小姨', 284, '湖北省 武汉', '自提', '匿名', '侄女', '', '', '', '', '快递', '10.00', '', 0),
(137, '海华毛绒', 284, '湖北省 武汉', '金昌外围', '海华毛绒', '海华毛绒', NULL, '', '', '', '快递', '10.00', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `swd_order_goods`
--

CREATE TABLE `swd_order_goods` (
  `rec_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `goods_name` varchar(255) DEFAULT '',
  `spec_id` int(10) UNSIGNED DEFAULT '0',
  `specification` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) UNSIGNED DEFAULT '0.00',
  `quantity` int(10) UNSIGNED DEFAULT '1',
  `goods_image` varchar(255) DEFAULT NULL,
  `evaluation` tinyint(1) UNSIGNED DEFAULT '0',
  `comment` varchar(255) DEFAULT '',
  `is_valid` tinyint(1) UNSIGNED DEFAULT '1',
  `reply_comment` text,
  `reply_time` int(11) DEFAULT NULL,
  `inviteType` varchar(20) DEFAULT '',
  `inviteRatio` varchar(255) DEFAULT '',
  `inviteUid` int(11) DEFAULT '0',
  `status` varchar(50) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_order_goods`
--

INSERT INTO `swd_order_goods` (`rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `is_valid`, `reply_comment`, `reply_time`, `inviteType`, `inviteRatio`, `inviteUid`, `status`) VALUES
(87, 50, 310, '【花束】抱抱桶~卡布奇诺~小熊', 353, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231003173055801.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(86, 49, 312, '【花束】曼塔乌梅子酱~52朵', 355, '', '380.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231003173225223.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(85, 48, 273, '【花束】红玫瑰~52朵', 316, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230926110807430.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(84, 47, 288, '【花束】红玫瑰~99朵', 331, '', '388.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231002111859825.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(83, 46, 203, '【花束】花束', 246, '', '268.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230912144828953.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(82, 45, 203, '【花束】花束', 246, '', '268.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230912144828953.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(81, 44, 274, '【花束】戴安娜玫瑰~520朵', 317, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231002095101221.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(80, 43, 61, '【花篮】香槟色~向日葵款', 104, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820162756624.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(79, 42, 44, '【花篮】橙色~向日葵款', 87, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(78, 41, 67, '【绿植】发财树~步步高', 110, '', '488.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231024094011545.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(77, 40, 67, '【绿植】发财树~步步高', 110, '', '488.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231024094011545.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(76, 39, 275, '【花篮】绿色系列~百合~香槟', 318, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230926110744947.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(75, 38, 271, '【花束】抱抱桶~乌梅子酱~33朵曼塔', 314, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230925163616972.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(74, 37, 273, '【花束】手捧花~99多红玫', 316, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230926110807430.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(73, 36, 272, '【花束】抱抱桶~99朵粉雪杉', 315, '', '388.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230925163723746.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(72, 35, 44, '【花篮】橙色~向日葵款', 87, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(71, 34, 44, '【花篮】橙色~向日葵款', 87, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(70, 33, 44, '【花篮】橙色~向日葵款', 87, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(88, 51, 302, '【花束】99朵系列', 345, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231024190752256.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(89, 52, 313, '【花篮】高档系列8005', 356, '', '580.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231007120822127.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(90, 53, 313, '【花篮】高档系列8005', 356, '', '580.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231007120822127.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(91, 54, 114, '【花束】向日葵混搭系列', 157, '', '260.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230906132606251.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(92, 55, 304, '【花束】曼塔玫瑰系列~199朵', 347, '', '788.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231010095722520.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(93, 56, 204, '【花束】混搭', 247, '', '268.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230912144908920.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(94, 56, 203, '【花束】混搭', 246, '', '268.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230912144828953.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(95, 57, 314, '【绿植】澳洲杉', 357, '', '260.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231009091251563.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(96, 58, 308, '【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', 351, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231008100436875.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(97, 59, 309, '【花束】混搭~百合~白玫瑰系列', 352, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231008100208597.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(98, 60, 311, '【花束】抱抱桶~粉雪山玫瑰~52朵', 358, '', '260.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231003173031903.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(99, 61, 316, '【鲜花】人民币~混搭~香槟黄玫瑰', 359, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231010172255386.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(100, 62, 269, '【花束】小香风~卡布基诺混搭系列', 312, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230923162203793.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(101, 63, 288, '【花束】红玫瑰~99朵', 331, '', '388.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231002111859825.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(102, 63, 309, '【花束】混搭~百合~白玫瑰系列', 352, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231008100208597.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(103, 64, 319, '【花束】香烟系列~混搭~百合~白玫瑰', 352, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231016122256634.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(104, 65, 63, '【花篮】紫色~绣球款', 106, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820162720730.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(105, 66, 10, '【花篮】蓝色~1株绣球款', 10, '', '320.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163605738.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(106, 67, 44, '【花篮】橙色~向日葵款', 87, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(107, 68, 44, '【花篮】橙色~向日葵款', 87, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(110, 71, 44, '【花篮】橙色~向日葵款', 87, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(108, 69, 44, '【花篮】橙色~向日葵款', 87, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(109, 70, 44, '【花篮】橙色~向日葵款', 87, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(111, 72, 44, '【花篮】橙色~向日葵款', 87, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(112, 73, 318, '【花束】混搭~橙芭比~香槟玫瑰~向日葵~橙色系', 312, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231015161614998.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(113, 74, 269, '【花束】小香风~卡布基诺混搭系列', 312, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230923162203793.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(114, 75, 44, '【花篮】橙色~向日葵款', 87, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(115, 76, 320, '【绿植】发财树~小盆栽', 363, '', '68.00', 2, 'http://www.byhh.com/data/files/store_2/goods/20231104110223787.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(116, 77, 321, '【绿植】鸭掌木~小盆栽', 364, '', '68.00', 1, 'http://www.byhh.com/data/system/default_goods_image.jpg', 0, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(117, 78, 322, '【绿植】铜钱草~小盆栽', 365, '', '35.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231104105439588.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(118, 79, 55, '【花篮】粉色~百合款', 98, '', '280.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820162934601.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(119, 80, 323, '【花篮】红色款~红玫瑰~多头玫瑰', 366, '', '260.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231019085245917.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(120, 81, 324, '【花束】抱抱桶~混搭~紫玫瑰~粉雪山~康乃馨~郁金香~99朵', 367, '', '580.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231019095337390.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(121, 82, 49, '【花篮】红色~大麦款', 92, '', '150.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163231543.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(122, 83, 325, '【花束】彩票系列~混搭~绣球~百合~桔梗', 368, '', '880.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231020094843941.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(123, 84, 49, '【花篮】红色~大麦款', 92, '', '150.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163231543.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(124, 85, 318, '【花束】混搭~橙芭比~香槟玫瑰~向日葵~橙色系', 361, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231015161614998.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(125, 86, 308, '【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', 351, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231008100436875.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(126, 87, 308, '【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', 351, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231008100436875.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(127, 88, 67, '【绿植】发财树~步步高', 110, '', '488.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231024094011545.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(128, 89, 76, '【绿植】龙血树~多头~中号', 119, '', '680.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230822170842971.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(129, 90, 327, '【花束】蓝色系~混搭~绣球~百合~桔梗', 370, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231019163506594.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(130, 91, 331, '【绿植】鸭掌木~盆栽', 374, '', '480.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231104110206212.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(131, 92, 332, '【绿植】橡皮树~', 375, '', '480.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231024093016180.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(132, 93, 322, '【绿植】铜钱草~小盆栽~水培型', 365, '', '115.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231104105439588.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(133, 94, 334, '【绿植】小绿植~茶桌摆件', 377, '', '68.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231024093254451.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(134, 95, 217, '【绿植】待定', 260, '', '68.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230912162406246.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(135, 96, 335, '【绿植】龙血树~款式A002', 380, '', '480.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231024094745537.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(136, 97, 337, '【绿植】玫瑰花~小盆栽', 382, '', '45.00', 1, 'http://www.byhh.com/data/system/default_goods_image.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(137, 98, 338, '【绿植】滴水观音~盆栽', 383, '', '488.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231024144224646.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(138, 99, 302, '【花束】99朵系列', 345, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231024190752256.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(139, 100, 136, '【绿植】待定', 179, '', '260.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230906135431715.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(140, 101, 318, '【花束】混搭~橙芭比~香槟玫瑰~向日葵~橙色系', 361, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231015161614998.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(141, 102, 121, '【花束】混搭', 164, '', '260.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230906133056204.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(142, 103, 205, '【花束】混搭~爱莎玫瑰', 248, '', '268.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230912144939534.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(143, 104, 315, '【花束】抱抱桶~粉雪山玫瑰~52朵~粉色系', 358, '', '260.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231010122846565.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(144, 105, 203, '【花束】混搭~紫色系', 246, '', '268.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230912144828953.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(145, 106, 203, '【花束】混搭~紫色系', 246, '', '268.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230912144828953.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(146, 107, 316, '【鲜花】人民币~混搭~香槟黄玫瑰', 359, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231010172255386.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(147, 108, 327, '【花束】蓝色系~混搭~绣球~百合~桔梗', 370, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231019163506594.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(148, 109, 308, '【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', 351, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231008100436875.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(149, 110, 49, '【花篮】红色~大麦款', 92, '', '150.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230820163231543.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(150, 111, 291, '【花束】99朵系列', 334, '', '388.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231002160734221.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(151, 112, 288, '【花束】红玫瑰~99朵', 331, '', '388.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231002111859825.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(152, 113, 339, '【鲜花】红玫瑰~299朵', 384, '', '780.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231104104000646.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(153, 114, 340, '【绿植】冬青~小盆栽', 385, '', '380.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231104104120166.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(154, 115, 339, '【鲜花】红玫瑰~299朵', 384, '', '780.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231104104000646.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(155, 116, 115, '【花束】混搭~向日葵~红色系', 158, '', '260.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231105155032799.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(156, 117, 308, '【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', 351, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231008100436875.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(157, 118, 111, '【花束】混搭~百合~爱莎玫瑰~粉色系', 154, '', '268.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230906132404473.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(158, 119, 327, '【花束】蓝色系~混搭~绣球~百合~桔梗', 370, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231019163506594.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(159, 120, 114, '【花束】混搭~向日葵~香槟玫瑰', 157, '', '260.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230906132606251.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(160, 121, 203, '【花束】混搭~紫色系', 246, '', '268.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230912144828953.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(161, 122, 341, '【绿植】多肉~小盆栽', 386, '', '35.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231104104911332.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(162, 123, 288, '【花束】红玫瑰~99朵', 331, '', '388.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231002111859825.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(163, 124, 324, '【花束】抱抱桶~混搭~紫玫瑰~粉雪山~康乃馨~郁金香~99朵', 367, '', '580.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231019095337390.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(164, 125, 342, '【花束】混搭~手打花', 389, '', '68.00', 1, 'http://www.byhh.com/data/system/default_goods_image.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(165, 126, 344, '【花束】白玫瑰~百合~银叶~混搭~蓝色系', 391, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231106114419319.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(166, 127, 340, '【绿植】冬青~小盆栽', 385, '', '380.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231104104120166.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(167, 128, 318, '【花束】混搭~橙芭比~香槟玫瑰~向日葵~橙色系', 361, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231015161614998.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(168, 129, 308, '【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', 351, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231008100436875.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(169, 130, 345, '【花束】混搭-鲜花搭配', 392, '', '288.00', 1, 'http://www.byhh.com/data/system/default_goods_image.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(170, 131, 308, '【花束】混搭~粉雪山~海洋之心~紫霞仙子玫瑰系列', 351, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231008100436875.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(171, 132, 324, '【花束】抱抱桶~混搭~紫玫瑰~粉雪山~康乃馨~郁金香~99朵', 367, '', '580.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231019095337390.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(172, 133, 85, '【鲜花】白玫瑰', 128, '', '5.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230905225155151.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(173, 134, 347, '【花束】红玫瑰~99朵系列', 394, '', '488.00', 1, 'http://www.byhh.com/data/system/default_goods_image.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(174, 135, 201, '【花束】小香风~混搭~卡布基诺系列', 244, '', '268.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230912144723314.jpg.thumb.jpg', 5, '', 1, NULL, NULL, '', '', 0, 'SUCCESS'),
(175, 136, 193, '【鲜花】小花束', 236, '', '35.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20230912144214770.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(176, 137, 348, '【鲜花】插瓶花~混搭', 395, '', '288.00', 1, 'http://www.byhh.com/data/files/store_2/goods/20231112114302158.jpg.thumb.jpg', 0, '', 1, NULL, NULL, '', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `swd_order_integral`
--

CREATE TABLE `swd_order_integral` (
  `order_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `frozen_integral` decimal(10,2) DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_order_log`
--

CREATE TABLE `swd_order_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `operator` varchar(60) DEFAULT '',
  `order_status` varchar(60) DEFAULT '',
  `changed_status` varchar(60) DEFAULT '',
  `remark` varchar(255) DEFAULT NULL,
  `log_time` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_order_log`
--

INSERT INTO `swd_order_log` (`log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time`) VALUES
(50, 39, '龙腾置业', '交易关闭', '交易关闭', NULL, 1695691786),
(49, 40, '杰仕轩扬', '交易关闭', '交易关闭', NULL, 1695691760),
(48, 41, '杰仕轩扬', '交易关闭', '交易关闭', NULL, 1695691749),
(46, 38, '到店访客', '交易关闭', '交易关闭', NULL, 1695636603),
(47, 38, '博艺花卉', '等待卖家发货', '卖家已发货', '程进', 1695636624),
(45, 36, '博艺花卉', '等待卖家发货', '卖家已发货', '程进', 1695636183),
(44, 37, '博艺花卉', '等待卖家发货', '卖家已发货', '程进', 1695636173),
(43, 37, '到店访客', '交易关闭', '交易关闭', NULL, 1695636120),
(40, 34, '默宾服饰', '交易关闭', '交易关闭', NULL, 1695632172),
(41, 33, '默宾服饰', '交易关闭', '交易关闭', NULL, 1695632181),
(42, 36, '匿名', '交易关闭', '交易关闭', NULL, 1695633168),
(39, 35, '默宾服饰', '交易关闭', '交易关闭', NULL, 1695632159),
(51, 41, '杰仕轩扬', '交易关闭', '交易关闭', NULL, 1695692947),
(52, 40, '杰仕轩扬', '交易关闭', '交易关闭', NULL, 1695692956),
(53, 42, '天龙纺织', '交易关闭', '交易关闭', NULL, 1695694753),
(54, 42, '天龙纺织', '等待卖家发货', '卖家已发货', '待定', 1695702253),
(55, 42, '天龙纺织', '卖家已发货', '交易完成', '买家确认收货', 1695702366),
(56, 41, '杰仕轩扬', '等待卖家发货', '卖家已发货', '', 1695702631),
(57, 39, '龙腾置业', '等待卖家发货', '卖家已发货', '', 1695702639),
(58, 40, '杰仕轩扬', '等待卖家发货', '卖家已发货', '', 1695702644),
(59, 41, '杰仕轩扬', '卖家已发货', '交易完成', '买家确认收货', 1695702658),
(60, 40, '杰仕轩扬', '卖家已发货', '交易完成', '买家确认收货', 1695702663),
(61, 39, '龙腾置业', '卖家已发货', '交易完成', '买家确认收货', 1695702668),
(62, 38, '到店访客', '卖家已发货', '交易完成', '买家确认收货', 1695702674),
(63, 37, '到店访客', '卖家已发货', '交易完成', '买家确认收货', 1695702691),
(64, 36, '到店访客', '卖家已发货', '交易完成', '买家确认收货', 1695702703),
(65, 43, '杰仕轩扬', '交易关闭', '交易关闭', NULL, 1695777768),
(66, 44, '中云物流邹旭', '交易关闭', '交易关闭', NULL, 1695870863),
(67, 44, '中云物流邹旭', '交易关闭', '交易关闭', NULL, 1696050849),
(68, 51, '散单零售', '等待卖家发货', '卖家已发货', '', 1696582356),
(69, 50, '散单零售', '等待卖家发货', '卖家已发货', '', 1696582362),
(70, 49, '散单零售', '等待卖家发货', '卖家已发货', '', 1696582367),
(71, 48, '开业零售', '等待卖家发货', '卖家已发货', '', 1696582377),
(72, 47, '开业零售', '等待卖家发货', '卖家已发货', '', 1696582382),
(73, 46, '开业零售', '等待卖家发货', '卖家已发货', '', 1696582387),
(74, 45, '开业零售', '等待卖家发货', '卖家已发货', '', 1696582394),
(75, 44, '中云物流邹旭', '等待卖家发货', '卖家已发货', '', 1696582399),
(76, 43, '杰仕轩扬', '等待卖家发货', '卖家已发货', '', 1696582404),
(77, 35, '默宾服饰', '等待卖家发货', '卖家已发货', '', 1696582410),
(78, 34, '默宾服饰', '等待卖家发货', '卖家已发货', '', 1696582415),
(79, 33, '默宾服饰', '等待卖家发货', '卖家已发货', '', 1696582426),
(80, 52, '开业零售', '交易关闭', '交易关闭', NULL, 1696646360),
(81, 53, '吴涛', '交易关闭', '交易关闭', NULL, 1696646793),
(82, 54, '散单零售', '交易关闭', '交易关闭', NULL, 1696659747),
(83, 55, '散单零售', '交易关闭', '交易关闭', NULL, 1696660336),
(84, 56, '散单零售', '交易关闭', '交易关闭', NULL, 1696728138),
(85, 57, '维多利纺织', '交易关闭', '交易关闭', NULL, 1696814087),
(86, 43, '杰仕轩扬', '卖家已发货', '交易完成', '买家确认收货', 1696814429),
(87, 47, '开业零售', '卖家已发货', '交易完成', '买家确认收货', 1696814437),
(88, 50, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1696814448),
(89, 51, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1696814454),
(90, 48, '开业零售', '卖家已发货', '交易完成', '买家确认收货', 1696814461),
(91, 49, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1696814468),
(92, 44, '中云物流邹旭', '卖家已发货', '交易完成', '买家确认收货', 1696814534),
(93, 46, '开业零售', '卖家已发货', '交易完成', '买家确认收货', 1696814541),
(94, 45, '开业零售', '卖家已发货', '交易完成', '买家确认收货', 1696814550),
(95, 53, '吴涛', '等待卖家发货', '卖家已发货', '', 1696814584),
(96, 53, '吴涛', '卖家已发货', '交易完成', '买家确认收货', 1696814594),
(97, 53, '吴涛', '交易关闭', '交易关闭', NULL, 1696814626),
(98, 56, '散单零售', '等待卖家发货', '卖家已发货', '', 1696814648),
(99, 56, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1696814651),
(100, 54, '散单零售', '等待卖家发货', '卖家已发货', '', 1696814672),
(101, 54, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1696814677),
(102, 35, '默宾服饰', '卖家已发货', '交易完成', '买家确认收货', 1696814732),
(103, 33, '默宾服饰', '卖家已发货', '交易完成', '买家确认收货', 1696814741),
(104, 34, '默宾服饰', '卖家已发货', '交易完成', '买家确认收货', 1696814750),
(105, 58, '散单零售', '交易关闭', '交易关闭', NULL, 1696817414),
(106, 58, '散单零售', '等待卖家发货', '卖家已发货', '', 1696817462),
(107, 58, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1696817465),
(108, 52, '依铭服饰', '交易关闭', '交易关闭', NULL, 1696817662),
(109, 60, '德丰~肖丹', '交易关闭', '交易关闭', NULL, 1696910265),
(110, 61, '散单零售', '交易关闭', '交易关闭', NULL, 1696929958),
(111, 55, '散单零售', '等待卖家发货', '卖家已发货', '', 1696930163),
(112, 55, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1696930173),
(113, 60, '德丰~肖丹', '等待卖家发货', '卖家已发货', '', 1696930184),
(114, 61, '散单零售', '等待卖家发货', '卖家已发货', '', 1696930187),
(115, 61, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1696930190),
(116, 60, '德丰~肖丹', '卖家已发货', '交易完成', '买家确认收货', 1696930195),
(117, 59, '散单零售', '交易关闭', '交易关闭', NULL, 1696930212),
(118, 59, '散单零售', '交易关闭', '交易关闭', NULL, 1696930219),
(119, 59, '散单零售', '等待卖家发货', '卖家已发货', '', 1696930238),
(120, 59, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1696930241),
(121, 62, '散单零售', '交易关闭', '交易关闭', NULL, 1697099555),
(122, 63, '散单零售', '交易关闭', '交易关闭', NULL, 1697176044),
(123, 65, '万宝纺织', '交易关闭', '交易关闭', NULL, 1697185612),
(124, 64, '丽丽', '等待卖家发货', '交易关闭', '改选其他商品', 1697186110),
(125, 63, '散单零售', '等待买家付款', '交易关闭', '改选其他商品', 1697186124),
(126, 66, '诺信纺织', '交易关闭', '交易关闭', NULL, 1697340788),
(127, 67, '叁易服饰', '交易关闭', '交易关闭', NULL, 1697341060),
(128, 68, '叁易服饰', '交易关闭', '交易关闭', NULL, 1697341160),
(129, 65, '万宝纺织', '等待卖家发货', '卖家已发货', '', 1697341213),
(130, 65, '万宝纺织', '卖家已发货', '交易完成', '买家确认收货', 1697341218),
(131, 62, '散单零售', '等待卖家发货', '卖家已发货', '', 1697341234),
(132, 62, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1697341239),
(133, 69, '维多利纺织-彪', '交易关闭', '交易关闭', NULL, 1697341335),
(134, 70, 'QKK服饰', '交易关闭', '交易关闭', NULL, 1697359494),
(135, 71, '杰仕轩扬~涛哥', '交易关闭', '交易关闭', NULL, 1697417537),
(136, 72, '聖甲~英子', '交易关闭', '交易关闭', NULL, 1697417653),
(137, 70, 'QKK服饰', '等待卖家发货', '卖家已发货', '', 1697418511),
(138, 70, 'QKK服饰', '卖家已发货', '交易完成', '买家确认收货', 1697418515),
(139, 74, '杨雨甜', '交易关闭', '交易关闭', NULL, 1697425230),
(140, 74, '杨雨甜', '交易关闭', '交易关闭', NULL, 1697425244),
(141, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697425396),
(142, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697425438),
(143, 74, '杨雨甜', '等待卖家发货', '卖家已发货', '', 1697425585),
(144, 73, '散单零售', '交易关闭', '交易关闭', NULL, 1697425639),
(145, 64, '丽丽', '交易关闭', '交易关闭', NULL, 1697430529),
(146, 73, '散单零售', '等待卖家发货', '卖家已发货', '', 1697431173),
(147, 73, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1697431180),
(148, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697435634),
(149, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697435667),
(150, 74, '杨雨甜', '交易关闭', '交易关闭', NULL, 1697435675),
(151, 74, '杨雨甜', '交易关闭', '交易关闭', NULL, 1697435681),
(152, 74, '杨雨甜', '交易关闭', '交易关闭', NULL, 1697435694),
(153, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697435768),
(154, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697435782),
(155, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697435819),
(156, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697435841),
(157, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697435852),
(158, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697435864),
(159, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697435870),
(160, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697435881),
(161, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697436315),
(162, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697436543),
(163, 74, '杨雨甜', '卖家已发货', '交易完成', '买家确认收货', 1697437734),
(164, 74, '杨雨甜', '交易关闭', '交易关闭', NULL, 1697437967),
(165, 75, '杉线谱服饰~阿丁', '交易关闭', '交易关闭', NULL, 1697522173),
(166, 78, '散单零售', '交易关闭', '交易关闭', NULL, 1697525269),
(167, 77, '散单零售', '交易关闭', '交易关闭', NULL, 1697525272),
(168, 76, '散单零售', '交易关闭', '交易关闭', NULL, 1697525277),
(169, 77, '散单零售', '交易关闭', '交易关闭', NULL, 1697525285),
(170, 76, '散单零售', '交易关闭', '交易关闭', NULL, 1697525289),
(171, 78, '散单零售', '交易关闭', '交易关闭', NULL, 1697525296),
(172, 77, '散单零售', '交易关闭', '交易关闭', NULL, 1697525300),
(173, 78, '散单零售', '等待卖家发货', '卖家已发货', '', 1697526411),
(174, 77, '散单零售', '等待卖家发货', '卖家已发货', '', 1697526838),
(175, 78, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1697526957),
(176, 77, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1697526995),
(177, 76, '散单零售', '等待卖家发货', '卖家已发货', '', 1697527116),
(178, 76, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1697527119),
(179, 75, '杉线谱服饰~阿丁', '等待卖家发货', '卖家已发货', '', 1697529051),
(180, 75, '杉线谱服饰~阿丁', '卖家已发货', '交易完成', '买家确认收货', 1697529055),
(181, 79, '振宇俊男', '交易关闭', '交易关闭', NULL, 1697606884),
(182, 80, '骏鑫辅料-李拓', '交易关闭', '交易关闭', NULL, 1697623507),
(183, 81, '散单零售', '交易关闭', '交易关闭', NULL, 1697682733),
(184, 81, '散单零售', '等待卖家发货', '卖家已发货', '', 1697697612),
(185, 81, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1697697615),
(186, 81, '散单零售', '交易关闭', '交易关闭', NULL, 1697700952),
(187, 78, '散单零售', '交易关闭', '交易关闭', NULL, 1697700954),
(188, 78, '散单零售', '交易关闭', '交易关闭', NULL, 1697700957),
(189, 81, '散单零售', '交易关闭', '交易关闭', NULL, 1697700965),
(190, 83, '散单零售', '交易关闭', '交易关闭', NULL, 1697766814),
(191, 84, '散单零售', '交易关闭', '交易关闭', NULL, 1697777431),
(192, 83, '散单零售', '等待卖家发货', '卖家已发货', '', 1697778649),
(193, 83, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1697778651),
(194, 82, '田传义', '等待卖家发货', '卖家已发货', '', 1697778659),
(195, 82, '田传义', '卖家已发货', '交易完成', '买家确认收货', 1697778662),
(196, 84, '散单零售', '等待卖家发货', '卖家已发货', '', 1697782044),
(197, 84, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1697782047),
(198, 85, '散单零售', '交易关闭', '交易关闭', NULL, 1697790693),
(199, 85, '散单零售', '等待卖家发货', '卖家已发货', '', 1697790714),
(200, 85, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1697790717),
(201, 86, '鉴航纺织', '交易关闭', '交易关闭', NULL, 1697854654),
(202, 87, '西部牛仔旺', '交易关闭', '交易关闭', NULL, 1697856433),
(203, 87, '西部牛仔旺', '等待卖家发货', '卖家已发货', '', 1697877324),
(204, 86, '鉴航纺织', '等待卖家发货', '卖家已发货', '', 1697877328),
(205, 87, '西部牛仔旺', '卖家已发货', '交易完成', '买家确认收货', 1697877330),
(206, 86, '鉴航纺织', '卖家已发货', '交易完成', '买家确认收货', 1697877336),
(207, 90, '孙雪晴', '交易关闭', '交易关闭', NULL, 1698111342),
(208, 88, '周工', '交易关闭', '交易关闭', NULL, 1698111959),
(209, 89, '博艺花卉', '交易关闭', '交易关闭', NULL, 1698111968),
(210, 88, '周工', '交易关闭', '交易关闭', NULL, 1698118197),
(211, 89, '周工', '交易关闭', '交易关闭', NULL, 1698118208),
(212, 91, '周工', '交易关闭', '交易关闭', NULL, 1698118218),
(213, 89, '周工', '交易关闭', '交易关闭', NULL, 1698118224),
(214, 90, '孙雪晴', '交易关闭', '交易关闭', NULL, 1698118225),
(215, 92, '博艺花卉', '交易关闭', '交易关闭', NULL, 1698118237),
(216, 92, '周工', '交易关闭', '交易关闭', NULL, 1698118244),
(217, 89, '周工', '交易关闭', '交易关闭', NULL, 1698118297),
(218, 92, '周工', '交易关闭', '交易关闭', NULL, 1698118305),
(219, 93, '周工', '交易关闭', '交易关闭', NULL, 1698118306),
(220, 92, '周工', '交易关闭', '交易关闭', NULL, 1698118307),
(221, 93, '周工', '交易关闭', '交易关闭', NULL, 1698118314),
(222, 94, '周工', '交易关闭', '交易关闭', NULL, 1698118323),
(223, 95, '周工', '交易关闭', '交易关闭', NULL, 1698118327),
(224, 96, '周工', '交易关闭', '交易关闭', NULL, 1698118327),
(225, 95, '周工', '交易关闭', '交易关闭', NULL, 1698118329),
(226, 96, '周工', '交易关闭', '交易关闭', NULL, 1698118335),
(227, 89, '周工', '交易关闭', '交易关闭', NULL, 1698118714),
(228, 92, '周工', '交易关闭', '交易关闭', NULL, 1698118716),
(229, 96, '周工', '交易关闭', '交易关闭', NULL, 1698118787),
(230, 94, '周工', '交易关闭', '交易关闭', NULL, 1698118798),
(231, 93, '周工', '交易关闭', '交易关闭', NULL, 1698118799),
(232, 95, '周工', '交易关闭', '交易关闭', NULL, 1698118800),
(233, 94, '周工', '交易关闭', '交易关闭', NULL, 1698118800),
(234, 96, '周工', '交易关闭', '交易关闭', NULL, 1698118844),
(235, 95, '周工', '交易关闭', '交易关闭', NULL, 1698118867),
(236, 95, '周工', '交易关闭', '交易关闭', NULL, 1698118876),
(237, 94, '周工', '交易关闭', '交易关闭', NULL, 1698118877),
(238, 95, '周工', '交易关闭', '交易关闭', NULL, 1698118892),
(239, 94, '周工', '交易关闭', '交易关闭', NULL, 1698118895),
(240, 93, '周工', '交易关闭', '交易关闭', NULL, 1698118901),
(241, 92, '周工', '交易关闭', '交易关闭', NULL, 1698118976),
(242, 92, '周工', '交易关闭', '交易关闭', NULL, 1698118979),
(243, 96, '周工', '等待卖家发货', '卖家已发货', '', 1698118993),
(244, 95, '周工', '等待卖家发货', '卖家已发货', '', 1698118997),
(245, 94, '周工', '等待卖家发货', '卖家已发货', '', 1698119000),
(246, 93, '周工', '等待卖家发货', '卖家已发货', '', 1698119003),
(247, 92, '周工', '等待卖家发货', '卖家已发货', '', 1698119007),
(248, 91, '周工', '等待卖家发货', '卖家已发货', '', 1698119010),
(249, 90, '孙雪晴', '等待卖家发货', '卖家已发货', '', 1698119014),
(250, 89, '周工', '等待卖家发货', '卖家已发货', '', 1698119017),
(251, 88, '周工', '等待卖家发货', '卖家已发货', '', 1698119023),
(252, 96, '周工', '卖家已发货', '交易完成', '买家确认收货', 1698119026),
(253, 95, '周工', '卖家已发货', '交易完成', '买家确认收货', 1698119030),
(254, 93, '周工', '卖家已发货', '交易完成', '买家确认收货', 1698119034),
(255, 94, '周工', '卖家已发货', '交易完成', '买家确认收货', 1698119039),
(256, 92, '周工', '卖家已发货', '交易完成', '买家确认收货', 1698119043),
(257, 91, '周工', '卖家已发货', '交易完成', '买家确认收货', 1698119047),
(258, 90, '孙雪晴', '卖家已发货', '交易完成', '买家确认收货', 1698119051),
(259, 89, '周工', '卖家已发货', '交易完成', '买家确认收货', 1698119056),
(260, 88, '周工', '卖家已发货', '交易完成', '买家确认收货', 1698119060),
(261, 97, '郭惠', '交易关闭', '交易关闭', NULL, 1698124297),
(262, 97, '郭惠', '等待卖家发货', '卖家已发货', '', 1698124724),
(263, 97, '郭惠', '卖家已发货', '交易完成', '买家确认收货', 1698124727),
(264, 91, '周工', '交易关闭', '交易关闭', NULL, 1698125101),
(265, 86, '鉴航纺织', '交易关闭', '交易关闭', NULL, 1698125102),
(266, 99, 'wx~美好向往', '交易关闭', '交易关闭', NULL, 1698134982),
(267, 64, '史丽丽', '交易关闭', '交易关闭', NULL, 1698136394),
(268, 63, '散单零售', '等待卖家发货', '卖家已发货', '', 1698140741),
(269, 63, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1698140748),
(270, 100, '郭惠', '交易关闭', '交易关闭', NULL, 1698140930),
(271, 103, '散单零售', '交易关闭', '交易关闭', NULL, 1698145372),
(272, 102, '散单零售', '交易关闭', '交易关闭', NULL, 1698145376),
(273, 101, '散单零售', '交易关闭', '交易关闭', NULL, 1698145379),
(274, 101, '散单零售', '交易关闭', '交易关闭', NULL, 1698145384),
(275, 102, '散单零售', '交易关闭', '交易关闭', NULL, 1698145387),
(276, 103, '散单零售', '交易关闭', '交易关闭', NULL, 1698145389),
(277, 98, '补发', '等待卖家发货', '卖家已发货', '', 1698145431),
(278, 99, 'wx~美好向往', '等待卖家发货', '卖家已发货', '', 1698145434),
(279, 100, '郭惠', '等待卖家发货', '卖家已发货', '', 1698145437),
(280, 101, '散单零售', '等待卖家发货', '卖家已发货', '', 1698145441),
(281, 102, '散单零售', '等待卖家发货', '卖家已发货', '', 1698145444),
(282, 102, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1698145447),
(283, 103, '散单零售', '等待卖家发货', '卖家已发货', '', 1698145453),
(284, 103, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1698145456),
(285, 101, '散单零售', '卖家已发货', '交易完成', '买家确认收货', 1698145461),
(286, 100, '郭惠', '卖家已发货', '交易完成', '买家确认收货', 1698145465),
(287, 99, 'wx~美好向往', '卖家已发货', '交易完成', '买家确认收货', 1698145470),
(288, 98, '补发', '卖家已发货', '交易完成', '买家确认收货', 1698145474),
(289, 105, '匿名', '交易关闭', '交易关闭', NULL, 1698395579),
(290, 106, '匿名', '交易关闭', '交易关闭', NULL, 1698398381),
(291, 110, '盛先生', '交易关闭', '交易关闭', NULL, 1698719768),
(292, 111, '匿名', '交易关闭', '交易关闭', NULL, 1698723140),
(293, 111, '匿名', '交易关闭', '交易关闭', NULL, 1698723161),
(294, 112, '匿名', '交易关闭', '交易关闭', NULL, 1698827135),
(295, 112, '匿名', '交易关闭', '交易关闭', NULL, 1698827149),
(296, 112, '匿名', '交易关闭', '交易关闭', NULL, 1698827185),
(297, 114, '程静', '交易关闭', '交易关闭', NULL, 1699063593),
(298, 115, '匿名', '交易关闭', '交易关闭', NULL, 1699063708),
(299, 113, '匿名', '交易关闭', '交易关闭', NULL, 1699063710),
(300, 121, '匿名', '交易关闭', '交易关闭', NULL, 1699064075),
(301, 120, '匿名', '交易关闭', '交易关闭', NULL, 1699064077),
(302, 111, '匿名', '等待卖家发货', '卖家已发货', '', 1699064273),
(303, 111, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699064279),
(304, 110, '盛先生', '等待卖家发货', '卖家已发货', '', 1699064287),
(305, 105, '匿名', '等待卖家发货', '卖家已发货', '', 1699064463),
(306, 110, '盛先生', '卖家已发货', '交易完成', '买家确认收货', 1699064466),
(307, 106, '匿名', '等待卖家发货', '卖家已发货', '', 1699064475),
(308, 106, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699064481),
(309, 105, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699064489),
(310, 122, '匿名', '交易关闭', '交易关闭', NULL, 1699064560),
(311, 119, '匿名', '交易关闭', '交易关闭', NULL, 1699064688),
(312, 121, '匿名', '等待卖家发货', '卖家已发货', '', 1699064705),
(313, 120, '匿名', '等待卖家发货', '卖家已发货', '', 1699064708),
(314, 119, '匿名', '等待卖家发货', '卖家已发货', '', 1699064711),
(315, 121, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699064713),
(316, 120, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699064718),
(317, 119, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699064722),
(318, 122, '匿名', '等待卖家发货', '卖家已发货', '', 1699064741),
(319, 122, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699064744),
(320, 125, '匿名', '交易关闭', '交易关闭', NULL, 1699168792),
(321, 125, '匿名', '等待卖家发货', '卖家已发货', '', 1699168807),
(322, 125, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699168810),
(323, 124, '匿名', '交易关闭', '交易关闭', NULL, 1699168863),
(324, 123, '匿名', '交易关闭', '交易关闭', NULL, 1699168866),
(325, 104, '明明', '交易关闭', '交易关闭', NULL, 1699169039),
(326, 109, '匿名', '交易关闭', '交易关闭', NULL, 1699169065),
(327, 108, '魏芳', '交易关闭', '交易关闭', NULL, 1699169068),
(328, 107, '匿名', '交易关闭', '交易关闭', NULL, 1699169071),
(329, 106, '匿名', '交易关闭', '交易关闭', NULL, 1699169073),
(330, 116, '匿名', '交易关闭', '交易关闭', NULL, 1699169107),
(331, 117, '匿名', '交易关闭', '交易关闭', NULL, 1699169112),
(332, 118, '匿名', '交易关闭', '交易关闭', NULL, 1699169115),
(333, 118, '匿名', '交易关闭', '交易关闭', NULL, 1699169120),
(334, 117, '匿名', '交易关闭', '交易关闭', NULL, 1699169125),
(335, 118, '匿名', '交易关闭', '交易关闭', NULL, 1699169128),
(336, 104, '明明', '等待卖家发货', '卖家已发货', '', 1699169315),
(337, 124, '匿名', '等待卖家发货', '卖家已发货', '', 1699169319),
(338, 123, '匿名', '等待卖家发货', '卖家已发货', '', 1699169323),
(339, 124, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699169325),
(340, 123, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699169329),
(341, 118, '匿名', '等待卖家发货', '卖家已发货', '', 1699169336),
(342, 117, '匿名', '等待卖家发货', '卖家已发货', '', 1699169340),
(343, 116, '匿名', '等待卖家发货', '卖家已发货', '', 1699169343),
(344, 115, '匿名', '等待卖家发货', '卖家已发货', '', 1699169347),
(345, 114, '程静', '等待卖家发货', '卖家已发货', '', 1699169350),
(346, 113, '匿名', '等待卖家发货', '卖家已发货', '', 1699169353),
(347, 112, '匿名', '等待卖家发货', '卖家已发货', '', 1699169357),
(348, 118, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699169360),
(349, 117, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699169364),
(350, 116, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699169369),
(351, 115, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699169373),
(352, 114, '程静', '卖家已发货', '交易完成', '买家确认收货', 1699169377),
(353, 113, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699169383),
(354, 112, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699169388),
(355, 109, '匿名', '等待卖家发货', '卖家已发货', '', 1699169398),
(356, 108, '魏芳', '等待卖家发货', '卖家已发货', '', 1699169403),
(357, 107, '匿名', '等待卖家发货', '卖家已发货', '', 1699169408),
(358, 104, '明明', '卖家已发货', '交易完成', '买家确认收货', 1699169412),
(359, 107, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699169418),
(360, 108, '魏芳', '卖家已发货', '交易完成', '买家确认收货', 1699169424),
(361, 109, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699169431),
(362, 126, '匿名', '交易关闭', '交易关闭', NULL, 1699243127),
(363, 126, '匿名', '等待卖家发货', '卖家已发货', '', 1699243140),
(364, 126, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699243143),
(365, 127, '匿名', '交易关闭', '交易关闭', NULL, 1699322050),
(366, 128, '匿名', '交易关闭', '交易关闭', NULL, 1699434073),
(367, 128, '匿名', '交易关闭', '交易关闭', NULL, 1699434090),
(368, 129, '匿名', '交易关闭', '交易关闭', NULL, 1699491844),
(369, 131, '匿名', '交易关闭', '交易关闭', NULL, 1699493033),
(370, 130, '匿名', '交易关闭', '交易关闭', NULL, 1699493040),
(371, 132, '祥盛布行~李思', '交易关闭', '交易关闭', NULL, 1699493552),
(372, 130, '匿名', '交易关闭', '交易关闭', NULL, 1699498387),
(373, 133, '匿名', '交易关闭', '交易关闭', NULL, 1699580636),
(374, 133, '匿名', '交易关闭', '交易关闭', NULL, 1699589648),
(375, 134, '德丰纺织', '交易关闭', '交易关闭', NULL, 1699604817),
(376, 135, '匿名', '交易关闭', '交易关闭', NULL, 1699663492),
(377, 135, '匿名', '等待卖家发货', '卖家已发货', '', 1699674323),
(378, 134, '德丰纺织', '等待卖家发货', '卖家已发货', '', 1699674327),
(379, 133, '匿名', '等待卖家发货', '卖家已发货', '', 1699674331),
(380, 128, '匿名', '等待卖家发货', '卖家已发货', '', 1699674337),
(381, 127, '匿名', '等待卖家发货', '卖家已发货', '', 1699674341),
(382, 128, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699674345),
(383, 127, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699674350),
(384, 133, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699674356),
(385, 134, '德丰纺织', '卖家已发货', '交易完成', '买家确认收货', 1699674360),
(386, 135, '匿名', '卖家已发货', '交易完成', '买家确认收货', 1699674365),
(387, 136, '侄女', '交易关闭', '交易关闭', NULL, 1699695777),
(388, 137, '海华毛绒', '交易关闭', '交易关闭', NULL, 1699760748);

-- --------------------------------------------------------

--
-- 表的结构 `swd_order_paystatus`
--

CREATE TABLE `swd_order_paystatus` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `pay_status` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_partner`
--

CREATE TABLE `swd_partner` (
  `partner_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED DEFAULT '0',
  `title` varchar(100) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `logo` varchar(255) DEFAULT NULL,
  `sort_order` tinyint(3) UNSIGNED DEFAULT '255',
  `if_show` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_plugin`
--

CREATE TABLE `swd_plugin` (
  `id` int(10) UNSIGNED NOT NULL,
  `instance` varchar(20) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `subname` varchar(50) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `enabled` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_plugin`
--

INSERT INTO `swd_plugin` (`id`, `instance`, `code`, `name`, `subname`, `desc`, `config`, `enabled`) VALUES
(2, 'payment', 'deposit', '预存款', '预存款', '预存款是您在网站上的虚拟资金帐户', '', 1),
(3, 'payment', 'cod', '货到付款', '货到付款', '开通城市: 请在“可货到付款地区”项中设置', '', 1),
(4, 'payment', 'alipay', '支付宝', '支付宝', '支付宝网站(www.alipay.com) 是国内先进的网上支付平台', 'a:5:{s:5:\"appId\";s:0:\"\";s:12:\"rsaPublicKey\";s:0:\"\";s:13:\"rsaPrivateKey\";s:0:\"\";s:18:\"alipayrsaPublicKey\";s:0:\"\";s:8:\"signType\";s:4:\"RSA2\";}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `swd_promotool_item`
--

CREATE TABLE `swd_promotool_item` (
  `piid` int(11) UNSIGNED NOT NULL,
  `goods_id` int(10) NOT NULL,
  `appid` varchar(20) NOT NULL,
  `store_id` int(10) DEFAULT '0',
  `config` text,
  `status` int(1) DEFAULT '1',
  `add_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_promotool_item`
--

INSERT INTO `swd_promotool_item` (`piid`, `goods_id`, `appid`, `store_id`, `config`, `status`, `add_time`) VALUES
(1, 26, 'exclusive', 2, '', 0, 1691388468),
(2, 27, 'exclusive', 2, '', 1, 1691390786),
(3, 20, 'exclusive', 2, '', 0, 1691395227),
(4, 18, 'exclusive', 2, '', 0, 1691549544),
(5, 17, 'exclusive', 2, '', 0, 1691549750),
(6, 19, 'exclusive', 2, '', 0, 1691550548),
(7, 12, 'exclusive', 2, '', 0, 1691550690),
(8, 8, 'exclusive', 2, '', 0, 1691578294),
(9, 7, 'exclusive', 2, '', 0, 1691578346),
(10, 11, 'exclusive', 2, '', 0, 1691578489),
(11, 10, 'exclusive', 2, '', 0, 1691578622),
(12, 6, 'exclusive', 2, '', 0, 1691578762),
(13, 5, 'exclusive', 2, '', 0, 1691578831),
(14, 4, 'exclusive', 2, '', 0, 1691579049),
(15, 2, 'exclusive', 2, '', 0, 1691579242),
(16, 1, 'exclusive', 2, '', 0, 1691579326),
(17, 25, 'exclusive', 2, '', 0, 1691579483),
(18, 24, 'exclusive', 2, '', 0, 1691579536),
(19, 23, 'exclusive', 2, '', 0, 1691579666),
(20, 22, 'exclusive', 2, '', 0, 1691579756),
(21, 21, 'exclusive', 2, '', 0, 1691579816),
(22, 3, 'exclusive', 2, '', 0, 1691579998),
(23, 16, 'exclusive', 2, '', 0, 1691720088),
(24, 15, 'exclusive', 2, '', 0, 1691720240),
(25, 14, 'exclusive', 2, '', 0, 1691720580),
(26, 13, 'exclusive', 2, '', 0, 1691720651),
(27, 28, 'exclusive', 2, '', 1, 1691720756),
(28, 29, 'exclusive', 2, '', 1, 1692153765),
(29, 30, 'exclusive', 2, '', 1, 1692153972),
(30, 31, 'exclusive', 2, '', 1, 1692154098),
(31, 32, 'exclusive', 2, '', 1, 1692154148),
(32, 33, 'exclusive', 2, '', 1, 1692154208),
(33, 34, 'exclusive', 2, '', 1, 1692154323),
(34, 35, 'exclusive', 2, '', 1, 1692154359),
(35, 36, 'exclusive', 2, '', 1, 1692154406),
(36, 37, 'exclusive', 2, '', 1, 1692154445),
(37, 38, 'exclusive', 2, '', 1, 1692154525),
(38, 39, 'exclusive', 2, '', 1, 1692155425),
(39, 40, 'exclusive', 2, '', 1, 1692155543),
(40, 41, 'exclusive', 2, '', 1, 1692156147),
(41, 42, 'exclusive', 2, '', 0, 1692425512),
(42, 43, 'exclusive', 2, '', 0, 1692504027),
(43, 44, 'exclusive', 2, '', 0, 1692504118),
(44, 45, 'exclusive', 2, '', 0, 1692504201),
(45, 46, 'exclusive', 2, '', 0, 1692504478),
(46, 47, 'exclusive', 2, '', 0, 1692505201),
(47, 48, 'exclusive', 2, '', 0, 1692505248),
(48, 49, 'exclusive', 2, '', 0, 1692505327),
(49, 50, 'exclusive', 2, '', 0, 1692505381),
(50, 51, 'exclusive', 2, '', 0, 1692505519),
(51, 52, 'exclusive', 2, '', 0, 1692507238),
(52, 53, 'exclusive', 2, '', 0, 1692507488),
(53, 54, 'exclusive', 2, '', 0, 1692512735),
(54, 55, 'exclusive', 2, '', 0, 1692519277),
(55, 56, 'exclusive', 2, '', 0, 1692519395),
(56, 57, 'exclusive', 2, '', 0, 1692519446),
(57, 58, 'exclusive', 2, '', 0, 1692519480),
(58, 59, 'exclusive', 2, '', 0, 1692519529),
(59, 60, 'exclusive', 2, '', 0, 1692519717),
(60, 61, 'exclusive', 2, '', 0, 1692519757),
(61, 62, 'exclusive', 2, '', 0, 1692519850),
(62, 63, 'exclusive', 2, '', 0, 1692519886),
(63, 64, 'exclusive', 2, '', 0, 1692687316),
(64, 65, 'exclusive', 2, '', 0, 1692687416),
(65, 66, 'exclusive', 2, '', 0, 1692692876),
(66, 67, 'exclusive', 2, '', 0, 1692692930),
(67, 68, 'exclusive', 2, '', 0, 1692693107),
(68, 69, 'exclusive', 2, '', 0, 1692693147),
(69, 70, 'exclusive', 2, '', 0, 1692693496),
(70, 71, 'exclusive', 2, '', 0, 1692693635),
(71, 72, 'exclusive', 2, '', 0, 1692693770),
(72, 73, 'exclusive', 2, '', 0, 1692693886),
(73, 74, 'exclusive', 2, '', 0, 1692694070),
(74, 75, 'exclusive', 2, '', 0, 1692695153),
(75, 76, 'exclusive', 2, '', 0, 1692695332),
(76, 77, 'exclusive', 2, '', 0, 1692695490),
(77, 78, 'exclusive', 2, '', 0, 1692695570),
(78, 79, 'exclusive', 2, '', 0, 1692695655),
(79, 80, 'exclusive', 2, '', 0, 1692695692),
(80, 81, 'exclusive', 2, '', 0, 1692695758),
(81, 82, 'exclusive', 2, '', 0, 1692695827),
(82, 83, 'exclusive', 2, '', 0, 1692695940),
(83, 84, 'exclusive', 2, '', 0, 1692697875),
(84, 85, 'exclusive', 2, '', 0, 1693925526),
(85, 86, 'exclusive', 2, '', 0, 1693925575),
(86, 87, 'exclusive', 2, '', 0, 1693925614),
(87, 88, 'exclusive', 2, '', 0, 1693925661),
(88, 89, 'exclusive', 2, '', 0, 1693925825),
(89, 90, 'exclusive', 2, '', 0, 1693925869),
(90, 91, 'exclusive', 2, '', 0, 1693925939),
(91, 92, 'exclusive', 2, '', 0, 1693925986),
(92, 93, 'exclusive', 2, '', 0, 1693926050),
(93, 94, 'exclusive', 2, '', 0, 1693926108),
(94, 95, 'exclusive', 2, '', 0, 1693926157),
(95, 96, 'exclusive', 2, '', 0, 1693926228),
(96, 97, 'exclusive', 2, '', 0, 1693926278),
(97, 98, 'exclusive', 2, '', 0, 1693926335),
(98, 99, 'exclusive', 2, '', 0, 1693926518),
(99, 100, 'exclusive', 2, '', 0, 1693926561),
(100, 101, 'exclusive', 2, '', 0, 1693926668),
(101, 102, 'exclusive', 2, '', 0, 1693926706),
(102, 103, 'exclusive', 2, '', 0, 1693926750),
(103, 104, 'exclusive', 2, '', 0, 1693926784),
(104, 105, 'exclusive', 2, '', 0, 1693926829),
(105, 106, 'exclusive', 2, '', 0, 1693926929),
(106, 107, 'exclusive', 2, '', 0, 1693926960),
(107, 108, 'exclusive', 2, '', 0, 1693927019),
(108, 109, 'exclusive', 2, '', 0, 1693927057),
(109, 110, 'exclusive', 2, '', 0, 1693927093),
(110, 111, 'exclusive', 2, '', 0, 1693977852),
(111, 112, 'exclusive', 2, '', 0, 1693977907),
(112, 113, 'exclusive', 2, '', 0, 1693977937),
(113, 114, 'exclusive', 2, '', 0, 1693977972),
(114, 115, 'exclusive', 2, '', 0, 1693978010),
(115, 116, 'exclusive', 2, '', 0, 1693978041),
(116, 117, 'exclusive', 2, '', 0, 1693978094),
(117, 118, 'exclusive', 2, '', 0, 1693978141),
(118, 119, 'exclusive', 2, '', 0, 1693978189),
(119, 120, 'exclusive', 2, '', 0, 1693978219),
(120, 121, 'exclusive', 2, '', 0, 1693978262),
(121, 122, 'exclusive', 2, '', 0, 1693978290),
(122, 123, 'exclusive', 2, '', 0, 1693978455),
(123, 124, 'exclusive', 2, '', 0, 1693979010),
(124, 125, 'exclusive', 2, '', 0, 1693979054),
(125, 126, 'exclusive', 2, '', 0, 1693979091),
(126, 127, 'exclusive', 2, '', 0, 1693979140),
(127, 128, 'exclusive', 2, '', 0, 1693979171),
(128, 129, 'exclusive', 2, '', 0, 1693979206),
(129, 130, 'exclusive', 2, '', 0, 1693979236),
(130, 131, 'exclusive', 2, '', 0, 1693979267),
(131, 132, 'exclusive', 2, '', 0, 1693979293),
(132, 133, 'exclusive', 2, '', 0, 1693979594),
(133, 134, 'exclusive', 2, '', 0, 1693979621),
(134, 135, 'exclusive', 2, '', 0, 1693979652),
(135, 136, 'exclusive', 2, '', 0, 1693979677),
(136, 137, 'exclusive', 2, '', 0, 1693979721),
(137, 138, 'exclusive', 2, '', 0, 1693979785),
(138, 139, 'exclusive', 2, '', 0, 1693979815),
(139, 140, 'exclusive', 2, '', 0, 1693979850),
(140, 141, 'exclusive', 2, '', 0, 1693979883),
(141, 142, 'exclusive', 2, '', 0, 1694497318),
(142, 143, 'exclusive', 2, '', 0, 1694497393),
(143, 144, 'exclusive', 2, '', 0, 1694497453),
(144, 145, 'exclusive', 2, '', 0, 1694497490),
(145, 146, 'exclusive', 2, '', 0, 1694497525),
(146, 147, 'exclusive', 2, '', 0, 1694497563),
(147, 148, 'exclusive', 2, '', 0, 1694497602),
(148, 149, 'exclusive', 2, '', 0, 1694497638),
(149, 150, 'exclusive', 2, '', 0, 1694497676),
(150, 151, 'exclusive', 2, '', 0, 1694497721),
(151, 152, 'exclusive', 2, '', 0, 1694497772),
(152, 153, 'exclusive', 2, '', 0, 1694497836),
(153, 154, 'exclusive', 2, '', 0, 1694497969),
(154, 155, 'exclusive', 2, '', 0, 1694498029),
(155, 156, 'exclusive', 2, '', 0, 1694498208),
(156, 157, 'exclusive', 2, '', 0, 1694498256),
(157, 158, 'exclusive', 2, '', 0, 1694498296),
(158, 159, 'exclusive', 2, '', 0, 1694498340),
(159, 160, 'exclusive', 2, '', 0, 1694498381),
(160, 161, 'exclusive', 2, '', 0, 1694498417),
(161, 162, 'exclusive', 2, '', 0, 1694498455),
(162, 163, 'exclusive', 2, '', 0, 1694498492),
(163, 164, 'exclusive', 2, '', 0, 1694498524),
(164, 165, 'exclusive', 2, '', 0, 1694498559),
(165, 166, 'exclusive', 2, '', 0, 1694498597),
(166, 167, 'exclusive', 2, '', 0, 1694498645),
(167, 168, 'exclusive', 2, '', 0, 1694498679),
(168, 169, 'exclusive', 2, '', 0, 1694498745),
(169, 170, 'exclusive', 2, '', 0, 1694498797),
(170, 171, 'exclusive', 2, '', 0, 1694498866),
(171, 172, 'exclusive', 2, '', 0, 1694498931),
(172, 173, 'exclusive', 2, '', 0, 1694500136),
(173, 174, 'exclusive', 2, '', 0, 1694500175),
(174, 175, 'exclusive', 2, '', 0, 1694500207),
(175, 176, 'exclusive', 2, '', 0, 1694500235),
(176, 177, 'exclusive', 2, '', 0, 1694500261),
(177, 178, 'exclusive', 2, '', 0, 1694500289),
(178, 179, 'exclusive', 2, '', 0, 1694500355),
(179, 180, 'exclusive', 2, '', 0, 1694500390),
(180, 181, 'exclusive', 2, '', 0, 1694500422),
(181, 182, 'exclusive', 2, '', 0, 1694500452),
(182, 183, 'exclusive', 2, '', 0, 1694500487),
(183, 184, 'exclusive', 2, '', 0, 1694500520),
(184, 185, 'exclusive', 2, '', 0, 1694500555),
(185, 186, 'exclusive', 2, '', 0, 1694500593),
(186, 187, 'exclusive', 2, '', 0, 1694500630),
(187, 188, 'exclusive', 2, '', 0, 1694500693),
(188, 189, 'exclusive', 2, '', 0, 1694500729),
(189, 190, 'exclusive', 2, '', 0, 1694500804),
(190, 191, 'exclusive', 2, '', 0, 1694500836),
(191, 192, 'exclusive', 2, '', 0, 1694500865),
(192, 193, 'exclusive', 2, '', 0, 1694500939),
(193, 194, 'exclusive', 2, '', 0, 1694500971),
(194, 195, 'exclusive', 2, '', 0, 1694501000),
(195, 196, 'exclusive', 2, '', 0, 1694501043),
(196, 197, 'exclusive', 2, '', 0, 1694501078),
(197, 198, 'exclusive', 2, '', 0, 1694501117),
(198, 199, 'exclusive', 2, '', 0, 1694501178),
(199, 200, 'exclusive', 2, '', 0, 1694501220),
(200, 201, 'exclusive', 2, '', 0, 1694501249),
(201, 202, 'exclusive', 2, '', 0, 1694501280),
(202, 203, 'exclusive', 2, '', 0, 1694501313),
(203, 204, 'exclusive', 2, '', 0, 1694501354),
(204, 205, 'exclusive', 2, '', 0, 1694501385),
(205, 206, 'exclusive', 2, '', 0, 1694501410),
(206, 207, 'exclusive', 2, '', 0, 1694503195),
(207, 208, 'exclusive', 2, '', 0, 1694505889),
(208, 209, 'exclusive', 2, '', 0, 1694506820),
(209, 210, 'exclusive', 2, '', 1, 1694506851),
(210, 211, 'exclusive', 2, '', 0, 1694506880),
(211, 212, 'exclusive', 2, '', 0, 1694506912),
(212, 213, 'exclusive', 2, '', 0, 1694506942),
(213, 214, 'exclusive', 2, '', 0, 1694506970),
(214, 215, 'exclusive', 2, '', 0, 1694506997),
(215, 216, 'exclusive', 2, '', 0, 1694507025),
(216, 217, 'exclusive', 2, '', 0, 1694507052),
(217, 218, 'exclusive', 2, '', 0, 1694507080),
(218, 219, 'exclusive', 2, '', 0, 1694507105),
(219, 220, 'exclusive', 2, '', 0, 1694507133),
(220, 221, 'exclusive', 2, '', 0, 1694507159),
(221, 222, 'exclusive', 2, '', 0, 1694651802),
(222, 223, 'exclusive', 2, '', 0, 1694651933),
(223, 224, 'exclusive', 2, '', 0, 1694658047),
(224, 225, 'exclusive', 2, '', 0, 1694658207),
(225, 226, 'exclusive', 2, '', 0, 1694658248),
(226, 227, 'exclusive', 2, '', 0, 1694658281),
(227, 228, 'exclusive', 2, '', 0, 1694658411),
(228, 229, 'exclusive', 2, '', 0, 1694658454),
(229, 230, 'exclusive', 2, '', 0, 1694658498),
(230, 231, 'exclusive', 2, '', 0, 1694658548),
(231, 232, 'exclusive', 2, '', 0, 1694658587),
(232, 233, 'exclusive', 2, '', 0, 1694658654),
(233, 234, 'exclusive', 2, '', 0, 1694658686),
(234, 235, 'exclusive', 2, '', 0, 1694658733),
(235, 236, 'exclusive', 2, '', 0, 1694658762),
(236, 237, 'exclusive', 2, '', 0, 1694658821),
(237, 238, 'exclusive', 2, '', 0, 1694658860),
(238, 239, 'exclusive', 2, '', 0, 1694658901),
(239, 240, 'exclusive', 2, '', 0, 1694658966),
(240, 241, 'exclusive', 2, '', 0, 1694659001),
(241, 242, 'exclusive', 2, '', 0, 1694659043),
(242, 243, 'exclusive', 2, '', 0, 1694659098),
(243, 244, 'exclusive', 2, '', 0, 1694659157),
(244, 245, 'exclusive', 2, '', 0, 1694659324),
(245, 246, 'exclusive', 2, '', 0, 1694659357),
(246, 247, 'exclusive', 2, '', 0, 1694659393),
(247, 248, 'exclusive', 2, '', 0, 1694659422),
(248, 249, 'exclusive', 2, '', 0, 1694659538),
(249, 250, 'exclusive', 2, '', 0, 1694659577),
(250, 251, 'exclusive', 2, '', 0, 1694659603),
(251, 252, 'exclusive', 2, '', 0, 1694659640),
(252, 253, 'exclusive', 2, '', 0, 1694659667),
(253, 254, 'exclusive', 2, '', 0, 1694659693),
(254, 255, 'exclusive', 2, '', 0, 1694660281),
(255, 256, 'exclusive', 2, '', 0, 1694660315),
(256, 257, 'exclusive', 2, '', 0, 1694660344),
(257, 258, 'exclusive', 2, '', 0, 1694660373),
(258, 259, 'exclusive', 2, '', 0, 1694746299),
(259, 260, 'exclusive', 2, '', 0, 1694746399),
(260, 261, 'exclusive', 2, '', 0, 1694746431),
(261, 262, 'exclusive', 2, '', 0, 1694746502),
(262, 263, 'exclusive', 2, '', 0, 1694746605),
(263, 264, 'exclusive', 2, '', 0, 1694746664),
(264, 265, 'exclusive', 2, '', 0, 1694746717),
(265, 266, 'exclusive', 2, '', 0, 1694828553),
(266, 267, 'exclusive', 2, '', 0, 1695439921),
(267, 268, 'exclusive', 2, '', 0, 1695449960),
(268, 269, 'exclusive', 2, '', 0, 1695457168),
(269, 270, 'exclusive', 2, '', 0, 1695630500),
(270, 271, 'exclusive', 2, '', 0, 1695630990),
(271, 272, 'exclusive', 2, '', 0, 1695631063),
(272, 273, 'exclusive', 2, '', 0, 1695635230),
(273, 274, 'exclusive', 2, '', 0, 1695690466),
(274, 275, 'exclusive', 2, '', 0, 1695690661),
(275, 276, 'exclusive', 2, '', 0, 1695697339),
(276, 277, 'exclusive', 2, '', 0, 1695697392),
(277, 278, 'exclusive', 2, '', 0, 1695697429),
(278, 279, 'exclusive', 2, '', 0, 1695697477),
(279, 280, 'exclusive', 2, '', 0, 1695697979),
(280, 281, 'exclusive', 2, '', 0, 1695698030),
(281, 282, 'exclusive', 2, '', 0, 1695698189),
(282, 283, 'exclusive', 2, '', 0, 1696210473),
(283, 284, 'exclusive', 2, '', 0, 1696210734),
(284, 285, 'exclusive', 2, '', 0, 1696210778),
(285, 286, 'exclusive', 2, '', 0, 1696210870),
(286, 287, 'exclusive', 2, '', 0, 1696210904),
(287, 288, 'exclusive', 2, '', 0, 1696216727),
(288, 289, 'exclusive', 2, '', 0, 1696216935),
(289, 290, 'exclusive', 2, '', 0, 1696217872),
(290, 291, 'exclusive', 2, '', 0, 1696217914),
(291, 292, 'exclusive', 2, '', 0, 1696217961),
(292, 293, 'exclusive', 2, '', 0, 1696218013),
(293, 294, 'exclusive', 2, '', 0, 1696218072),
(294, 295, 'exclusive', 2, '', 0, 1696218332),
(295, 296, 'exclusive', 2, '', 0, 1696218358),
(296, 297, 'exclusive', 2, '', 0, 1696218382),
(297, 298, 'exclusive', 2, '', 0, 1696218415),
(298, 299, 'exclusive', 2, '', 0, 1696218441),
(299, 300, 'exclusive', 2, '', 0, 1696228061),
(300, 301, 'exclusive', 2, '', 0, 1696228118),
(301, 302, 'exclusive', 2, '', 0, 1696228152),
(302, 303, 'exclusive', 2, '', 0, 1696230416),
(303, 304, 'exclusive', 2, '', 0, 1696230471),
(304, 305, 'exclusive', 2, '', 0, 1696230498),
(305, 306, 'exclusive', 2, '', 0, 1696234433),
(306, 307, 'exclusive', 2, '', 0, 1696234556),
(307, 308, 'exclusive', 2, '', 0, 1696234579),
(308, 309, 'exclusive', 2, '', 0, 1696234601),
(309, 310, 'exclusive', 2, '', 0, 1696300212),
(310, 311, 'exclusive', 2, '', 0, 1696325444),
(311, 312, 'exclusive', 2, '', 0, 1696325557),
(312, 313, 'exclusive', 2, '', 0, 1696646163),
(313, 314, 'exclusive', 2, '', 0, 1696813975),
(314, 315, 'exclusive', 2, '', 0, 1696909886),
(315, 316, 'exclusive', 2, '', 1, 1696929785),
(316, 317, 'exclusive', 2, '', 0, 1697357702),
(317, 318, 'exclusive', 2, '', 0, 1697357781),
(318, 319, 'exclusive', 2, '', 0, 1697430196),
(319, 320, 'exclusive', 2, '', 0, 1697524981),
(320, 321, 'exclusive', 2, '', 0, 1697525016),
(321, 322, 'exclusive', 2, '', 0, 1697525107),
(322, 323, 'exclusive', 2, '', 0, 1697623439),
(323, 324, 'exclusive', 2, '', 0, 1697676072),
(324, 325, 'exclusive', 2, '', 0, 1697698816),
(325, 326, 'exclusive', 2, '', 0, 1697698886),
(326, 327, 'exclusive', 2, '', 0, 1697704515),
(327, 328, 'exclusive', 2, '', 0, 1697704631),
(328, 329, 'exclusive', 2, '', 0, 1697790920),
(329, 330, 'exclusive', 2, '', 0, 1697791194),
(330, 331, 'exclusive', 2, '', 0, 1698110934),
(331, 332, 'exclusive', 2, '', 0, 1698111023),
(332, 333, 'exclusive', 2, '', 0, 1698111081),
(333, 334, 'exclusive', 2, '', 0, 1698111189),
(334, 335, 'exclusive', 2, '', 0, 1698112083),
(335, 336, 'exclusive', 2, '', 0, 1698112166),
(336, 337, 'exclusive', 2, '', 0, 1698124245),
(337, 338, 'exclusive', 2, '', 0, 1698129767),
(338, 339, 'exclusive', 2, '', 0, 1699022018),
(339, 340, 'exclusive', 2, '', 0, 1699063458),
(340, 341, 'exclusive', 2, '', 0, 1699064541),
(341, 342, 'exclusive', 2, '', 0, 1699168651),
(342, 343, 'exclusive', 2, '', 0, 1699170316),
(343, 344, 'exclusive', 2, '', 0, 1699170475),
(344, 345, 'exclusive', 2, '', 0, 1699492053),
(345, 346, 'exclusive', 2, '', 0, 1699600018),
(346, 347, 'exclusive', 2, '', 0, 1699604661),
(347, 348, 'exclusive', 2, '', 0, 1699760641);

-- --------------------------------------------------------

--
-- 表的结构 `swd_promotool_setting`
--

CREATE TABLE `swd_promotool_setting` (
  `psid` int(11) UNSIGNED NOT NULL,
  `appid` varchar(20) NOT NULL,
  `store_id` int(10) DEFAULT '0',
  `rules` text,
  `status` tinyint(1) DEFAULT '0',
  `add_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_recommend`
--

CREATE TABLE `swd_recommend` (
  `recom_id` int(10) UNSIGNED NOT NULL,
  `recom_name` varchar(100) NOT NULL DEFAULT '',
  `store_id` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_recommend`
--

INSERT INTO `swd_recommend` (`recom_id`, `recom_name`, `store_id`) VALUES
(1, '橙色系', 0),
(2, '粉色系', 0),
(3, '红色系', 0),
(4, '蓝色系', 0),
(5, '紫色系', 0),
(6, '大号绿植', 0),
(7, '中号绿植', 0),
(8, '小号绿植', 0),
(9, '其他绿植', 0),
(10, '小型花束', 0),
(11, '鲜花', 0);

-- --------------------------------------------------------

--
-- 表的结构 `swd_recommend_goods`
--

CREATE TABLE `swd_recommend_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `recom_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_recommend_goods`
--

INSERT INTO `swd_recommend_goods` (`id`, `goods_id`, `recom_id`) VALUES
(1, 42, 4),
(2, 10, 4),
(3, 8, 4),
(4, 7, 4),
(5, 6, 4),
(6, 65, 3),
(7, 64, 3),
(8, 54, 3),
(9, 53, 3),
(10, 52, 3),
(11, 51, 3),
(12, 50, 3),
(13, 49, 3),
(14, 48, 3),
(15, 45, 1),
(16, 44, 1),
(17, 59, 2),
(18, 58, 2),
(19, 57, 2),
(20, 56, 2),
(21, 55, 2),
(22, 63, 5),
(23, 62, 5),
(24, 84, 6),
(25, 83, 6),
(26, 82, 6),
(27, 81, 6),
(28, 79, 6),
(29, 78, 6),
(30, 75, 6),
(31, 73, 6),
(32, 72, 6),
(33, 70, 6),
(34, 68, 6),
(35, 67, 6),
(72, 172, 11),
(71, 248, 11),
(70, 249, 11),
(69, 189, 10),
(40, 176, 10),
(60, 198, 10),
(61, 197, 10),
(62, 196, 10),
(68, 190, 10),
(67, 191, 10),
(66, 192, 10),
(65, 193, 10),
(64, 194, 10),
(63, 195, 10),
(50, 265, 8),
(51, 264, 8),
(52, 263, 8),
(53, 262, 8),
(54, 261, 8),
(55, 260, 8),
(56, 259, 8),
(57, 221, 8),
(58, 220, 8),
(59, 219, 8),
(73, 155, 11),
(74, 132, 11),
(75, 103, 11),
(76, 93, 11),
(77, 92, 11),
(78, 89, 11),
(79, 87, 11),
(80, 86, 11),
(81, 85, 11);

-- --------------------------------------------------------

--
-- 表的结构 `swd_refund`
--

CREATE TABLE `swd_refund` (
  `refund_id` int(11) UNSIGNED NOT NULL,
  `tradeNo` varchar(30) NOT NULL,
  `refund_sn` varchar(30) NOT NULL,
  `title` varchar(255) DEFAULT '',
  `refund_reason` varchar(50) DEFAULT '',
  `refund_desc` varchar(255) DEFAULT '',
  `total_fee` decimal(10,2) DEFAULT '0.00',
  `goods_fee` decimal(10,2) DEFAULT '0.00',
  `shipping_fee` decimal(10,2) DEFAULT '0.00',
  `refund_total_fee` decimal(10,2) DEFAULT '0.00',
  `refund_goods_fee` decimal(10,2) DEFAULT '0.00',
  `refund_shipping_fee` decimal(10,2) DEFAULT '0.00',
  `buyer_id` int(10) NOT NULL,
  `seller_id` int(10) NOT NULL,
  `status` varchar(100) DEFAULT '',
  `shipped` int(11) DEFAULT '0',
  `intervene` int(1) DEFAULT '0',
  `created` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_refund_message`
--

CREATE TABLE `swd_refund_message` (
  `rm_id` int(11) UNSIGNED NOT NULL,
  `owner_id` int(11) NOT NULL,
  `owner_role` varchar(10) DEFAULT '',
  `refund_id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_refund_message`
--

INSERT INTO `swd_refund_message` (`rm_id`, `owner_id`, `owner_role`, `refund_id`, `content`, `image`, `created`) VALUES
(1, 3, 'buyer', 1, '买家修改了退款申请，退款金额修改为：160元，退运费金额：0元，收货情况修改为：未收到货，需要退款，退款原因修改为：未按约定时间发货，退款说明修改为：不想要了', NULL, 1693340812),
(2, 2, 'seller', 1, '卖家（博艺花卉）已经同意了退款申请，退款成功！', NULL, 1693340850);

-- --------------------------------------------------------

--
-- 表的结构 `swd_region`
--

CREATE TABLE `swd_region` (
  `region_id` int(10) UNSIGNED NOT NULL,
  `region_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `sort_order` tinyint(3) UNSIGNED DEFAULT '255',
  `if_show` int(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_region`
--

INSERT INTO `swd_region` (`region_id`, `region_name`, `parent_id`, `sort_order`, `if_show`) VALUES
(2, '北京', 0, 1, 1),
(3, '北京市', 2, 255, 1),
(4, '东城', 3, 255, 1),
(5, '西城', 3, 255, 1),
(6, '崇文', 3, 255, 1),
(7, '宣武', 3, 255, 1),
(8, '朝阳', 3, 255, 1),
(9, '海淀', 3, 255, 1),
(10, '丰台', 3, 255, 1),
(11, '石景山', 3, 255, 1),
(12, '门头沟', 3, 255, 1),
(13, '房山', 3, 255, 1),
(14, '通州', 3, 255, 1),
(15, '顺义', 3, 255, 1),
(16, '大兴', 3, 255, 1),
(17, '昌平', 3, 255, 1),
(18, '平谷', 3, 255, 1),
(19, '怀柔', 3, 255, 1),
(20, '延庆', 3, 255, 1),
(21, '密云', 3, 255, 1),
(22, '天津市', 476, 255, 1),
(23, '和平区', 22, 255, 1),
(24, '河东区', 22, 255, 1),
(25, '河西区', 22, 255, 1),
(26, '南开区', 22, 255, 1),
(27, '河北区', 22, 255, 1),
(28, '红桥区', 22, 255, 1),
(29, '塘沽区', 22, 255, 1),
(30, '汉沽区', 22, 255, 1),
(31, '大港区', 22, 255, 1),
(32, '西青区', 22, 255, 1),
(33, '东丽区', 22, 255, 1),
(34, '津南区', 22, 255, 1),
(35, '北辰区', 22, 255, 1),
(36, '武清区', 22, 255, 1),
(37, '宝坻区', 22, 255, 1),
(38, '静海县', 22, 255, 1),
(39, '宁河县', 22, 255, 1),
(40, '蓟县', 22, 255, 1),
(41, '上海市', 474, 255, 1),
(42, '浦东新区', 41, 255, 1),
(43, '徐汇区', 41, 255, 1),
(44, '长宁区', 41, 255, 1),
(45, '普陀区', 41, 255, 1),
(46, '闸北区', 41, 255, 1),
(47, '虹口区', 41, 255, 1),
(48, '杨浦区', 41, 255, 1),
(49, '黄浦区', 41, 255, 1),
(50, '卢湾区', 41, 255, 1),
(51, '静安区', 41, 255, 1),
(52, '宝山区', 41, 255, 1),
(53, '闵行区', 41, 255, 1),
(54, '嘉定区', 41, 255, 1),
(55, '金山区', 41, 255, 1),
(56, '松江区', 41, 255, 1),
(57, '青浦区', 41, 255, 1),
(58, '崇明县', 41, 255, 1),
(59, '奉贤区', 41, 255, 1),
(60, '南汇区', 41, 255, 1),
(61, '重庆市', 475, 255, 1),
(62, '渝中', 61, 255, 1),
(63, '大渡口', 61, 255, 1),
(64, '江北', 61, 255, 1),
(65, '沙坪坝', 61, 255, 1),
(66, '九龙坡', 61, 255, 1),
(67, '南岸', 61, 255, 1),
(68, '北碚', 61, 255, 1),
(69, '渝北', 61, 255, 1),
(70, '巴南', 61, 255, 1),
(71, '北部新区', 61, 255, 1),
(72, '经开区', 61, 255, 1),
(73, '万盛', 61, 255, 1),
(74, '双桥', 61, 255, 1),
(75, '綦江', 61, 255, 1),
(76, '潼南', 61, 255, 1),
(77, '铜梁', 61, 255, 1),
(78, '大足', 61, 255, 1),
(79, '荣昌', 61, 255, 1),
(80, '璧山', 61, 255, 1),
(81, '江津', 61, 255, 1),
(82, '合川', 61, 255, 1),
(83, '永川', 61, 255, 1),
(84, '南川', 61, 255, 1),
(85, '万州', 61, 255, 1),
(86, '涪陵', 61, 255, 1),
(87, '黔江', 61, 255, 1),
(88, '长寿', 61, 255, 1),
(89, '梁平', 61, 255, 1),
(90, '城口', 61, 255, 1),
(91, '丰都', 61, 255, 1),
(92, '垫江', 61, 255, 1),
(93, '武隆', 61, 255, 1),
(94, '忠县', 61, 255, 1),
(95, '开县', 61, 255, 1),
(96, '云阳', 61, 255, 1),
(97, '奉节', 61, 255, 1),
(98, '巫山', 61, 255, 1),
(99, '巫溪', 61, 255, 1),
(100, '石柱', 61, 255, 1),
(101, '秀山', 61, 255, 1),
(102, '酉阳', 61, 255, 1),
(103, '彭水', 61, 255, 1),
(104, '河北省', 0, 255, 1),
(105, '石家庄', 104, 255, 1),
(106, '衡水', 104, 255, 1),
(107, '唐山', 104, 255, 1),
(108, '秦皇岛', 104, 255, 1),
(109, '张家口', 104, 255, 1),
(110, '承德', 104, 255, 1),
(111, '邯郸', 104, 255, 1),
(112, '沧州', 104, 255, 1),
(113, '邢台', 104, 255, 1),
(114, '保定', 104, 255, 1),
(115, '廊坊', 104, 255, 1),
(116, '山西省', 0, 255, 1),
(117, '太原市', 116, 255, 1),
(118, '大同市', 116, 255, 1),
(119, '朔州市', 116, 255, 1),
(120, '忻州市', 116, 255, 1),
(121, '长治市', 116, 255, 1),
(122, '阳泉市', 116, 255, 1),
(123, '晋中市', 116, 255, 1),
(124, '吕梁市', 116, 255, 1),
(125, '晋城市', 116, 255, 1),
(126, '临汾市', 116, 255, 1),
(127, '运城市', 116, 255, 1),
(128, '辽宁省', 0, 255, 1),
(129, '沈阳', 128, 255, 1),
(130, '大连', 128, 255, 1),
(131, '鞍山', 128, 255, 1),
(132, '抚顺', 128, 255, 1),
(133, '本溪', 128, 255, 1),
(134, '丹东', 128, 255, 1),
(135, '锦州', 128, 255, 1),
(136, '营口', 128, 255, 1),
(137, '阜新', 128, 255, 1),
(138, '辽阳', 128, 255, 1),
(139, '铁岭', 128, 255, 1),
(140, '朝阳', 128, 255, 1),
(141, '盘锦', 128, 255, 1),
(142, '葫芦岛', 128, 255, 1),
(143, '吉林省', 0, 255, 1),
(144, '长春市', 143, 255, 1),
(145, '吉林市', 143, 255, 1),
(146, '四平市', 143, 255, 1),
(147, '辽源市', 143, 255, 1),
(148, '通化市', 143, 255, 1),
(149, '白山市', 143, 255, 1),
(150, '松原市', 143, 255, 1),
(151, '白城市', 143, 255, 1),
(152, '延边州', 143, 255, 1),
(153, '黑龙江省', 0, 255, 1),
(154, '哈尔滨', 153, 255, 1),
(155, '齐齐哈尔', 153, 255, 1),
(156, '牡丹江', 153, 255, 1),
(157, '佳木斯', 153, 255, 1),
(158, '大庆', 153, 255, 1),
(159, '鸡西', 153, 255, 1),
(160, '伊春', 153, 255, 1),
(161, '双鸭山', 153, 255, 1),
(162, '七台河', 153, 255, 1),
(163, '鹤岗', 153, 255, 1),
(164, '黑河', 153, 255, 1),
(165, '绥化', 153, 255, 1),
(166, '大兴安岭', 153, 255, 1),
(167, '内蒙古自治区', 0, 255, 1),
(168, '呼和浩特市', 167, 255, 1),
(169, '包头市', 167, 255, 1),
(170, '乌海市', 167, 255, 1),
(171, '赤峰市', 167, 255, 1),
(172, '通辽市', 167, 255, 1),
(173, '鄂尔多斯市', 167, 255, 1),
(174, '呼伦贝尔市', 167, 255, 1),
(175, '巴彦淖尔市', 167, 255, 1),
(176, '乌兰察布市', 167, 255, 1),
(177, '锡林郭勒盟', 167, 255, 1),
(178, '兴安盟', 167, 255, 1),
(179, '阿拉善盟', 167, 255, 1),
(180, '江苏省', 0, 255, 1),
(181, '南京', 180, 255, 1),
(182, '苏州', 180, 255, 1),
(183, '无锡', 180, 255, 1),
(184, '常州', 180, 255, 1),
(185, '扬州', 180, 255, 1),
(186, '南通', 180, 255, 1),
(187, '镇江', 180, 255, 1),
(188, '泰州', 180, 255, 1),
(189, '淮安', 180, 255, 1),
(190, '徐州', 180, 255, 1),
(191, '盐城', 180, 255, 1),
(192, '宿迁', 180, 255, 1),
(193, '连云港', 180, 255, 1),
(194, '浙江省', 0, 255, 1),
(195, '杭州', 194, 255, 1),
(196, '宁波', 194, 255, 1),
(197, '温州', 194, 255, 1),
(198, '嘉兴', 194, 255, 1),
(199, '湖州', 194, 255, 1),
(200, '绍兴', 194, 255, 1),
(201, '金华', 194, 255, 1),
(202, '衢州', 194, 255, 1),
(203, '舟山', 194, 255, 1),
(204, '台州', 194, 255, 1),
(205, '丽水', 194, 255, 1),
(206, '安徽省', 0, 255, 1),
(207, '淮北市', 206, 255, 1),
(208, '合肥市', 206, 255, 1),
(209, '六安市', 206, 255, 1),
(210, '亳州市', 206, 255, 1),
(211, '宿州市', 206, 255, 1),
(212, '阜阳市', 206, 255, 1),
(213, '蚌埠市', 206, 255, 1),
(214, '淮南市', 206, 255, 1),
(215, '滁州市', 206, 255, 1),
(216, '巢湖市', 206, 255, 1),
(217, '芜湖市', 206, 255, 1),
(218, '马鞍山', 206, 255, 1),
(219, '安庆市', 206, 255, 1),
(220, '池州市', 206, 255, 1),
(221, '铜陵市', 206, 255, 1),
(222, '宣城市', 206, 255, 1),
(223, '黄山市', 206, 255, 1),
(224, '福建省', 0, 255, 1),
(225, '福州市', 224, 255, 1),
(226, '厦门市', 224, 255, 1),
(227, '莆田市', 224, 255, 1),
(228, '三明市', 224, 255, 1),
(229, '泉州市', 224, 255, 1),
(230, '漳州市', 224, 255, 1),
(231, '南平市', 224, 255, 1),
(232, '龙岩市', 224, 255, 1),
(233, '宁德市', 224, 255, 1),
(234, '江西省', 0, 255, 1),
(235, '南昌市', 234, 255, 1),
(236, '景德镇市', 234, 255, 1),
(237, '萍乡市', 234, 255, 1),
(238, '九江市', 234, 255, 1),
(239, '新余市', 234, 255, 1),
(240, '鹰潭市', 234, 255, 1),
(241, '赣州市', 234, 255, 1),
(242, '吉安市', 234, 255, 1),
(243, '宜春市', 234, 255, 1),
(244, '抚州市', 234, 255, 1),
(245, '上饶市', 234, 255, 1),
(246, '山东省', 0, 255, 1),
(247, '济南', 246, 255, 1),
(248, '青岛', 246, 255, 1),
(249, '淄博', 246, 255, 1),
(250, '泰安', 246, 255, 1),
(251, '济宁', 246, 255, 1),
(252, '德州', 246, 255, 1),
(253, '日照', 246, 255, 1),
(254, '潍坊', 246, 255, 1),
(255, '枣庄', 246, 255, 1),
(256, '临沂', 246, 255, 1),
(257, '莱芜', 246, 255, 1),
(258, '滨州', 246, 255, 1),
(259, '聊城', 246, 255, 1),
(260, '菏泽', 246, 255, 1),
(261, '烟台', 246, 255, 1),
(262, '威海', 246, 255, 1),
(263, '东营', 246, 255, 1),
(264, '河南省', 0, 255, 1),
(265, '郑州市', 264, 255, 1),
(266, '洛阳市', 264, 255, 1),
(267, '开封市', 264, 255, 1),
(268, '平顶山市', 264, 255, 1),
(269, '南阳市', 264, 255, 1),
(270, '焦作市', 264, 255, 1),
(271, '信阳市', 264, 255, 1),
(272, '济源市', 264, 255, 1),
(273, '周口市', 264, 255, 1),
(274, '安阳市', 264, 255, 1),
(275, '驻马店市', 264, 255, 1),
(276, '新乡市', 264, 255, 1),
(277, '鹤壁市', 264, 255, 1),
(278, '商丘市', 264, 255, 1),
(279, '漯河市', 264, 255, 1),
(280, '许昌市', 264, 255, 1),
(281, '三门峡市', 264, 255, 1),
(282, '濮阳市', 264, 255, 1),
(283, '湖北省', 0, 255, 1),
(284, '武汉', 283, 255, 1),
(285, '宜昌', 283, 255, 1),
(286, '荆州', 283, 255, 1),
(287, '十堰', 283, 255, 1),
(288, '襄樊', 283, 255, 1),
(289, '黄石', 283, 255, 1),
(290, '黄冈', 283, 255, 1),
(291, '恩施', 283, 255, 1),
(292, '荆门', 283, 255, 1),
(293, '咸宁', 283, 255, 1),
(294, '孝感', 283, 255, 1),
(295, '鄂州', 283, 255, 1),
(296, '天门', 283, 255, 1),
(297, '仙桃', 283, 255, 1),
(298, '随州', 283, 255, 1),
(299, '潜江', 283, 255, 1),
(300, '神农架', 283, 255, 1),
(301, '湖南省', 0, 255, 1),
(302, '长沙市', 301, 255, 1),
(303, '株洲市', 301, 255, 1),
(304, '湘潭市', 301, 255, 1),
(305, '邵阳市', 301, 255, 1),
(306, '吉首市', 301, 255, 1),
(307, '岳阳市', 301, 255, 1),
(308, '娄底市', 301, 255, 1),
(309, '怀化市', 301, 255, 1),
(310, '永州市', 301, 255, 1),
(311, '郴州市', 301, 255, 1),
(312, '常德市', 301, 255, 1),
(313, '衡阳市', 301, 255, 1),
(314, '益阳市', 301, 255, 1),
(315, '张家界', 301, 255, 1),
(316, '湘西州', 301, 255, 1),
(317, '广东省', 0, 255, 1),
(318, '广州', 317, 255, 1),
(319, '深圳', 317, 255, 1),
(320, '珠海', 317, 255, 1),
(321, '汕头', 317, 255, 1),
(322, '佛山', 317, 255, 1),
(323, '东莞', 317, 255, 1),
(324, '中山', 317, 255, 1),
(325, '江门', 317, 255, 1),
(326, '惠州', 317, 255, 1),
(327, '肇庆', 317, 255, 1),
(328, '阳江', 317, 255, 1),
(329, '韶关', 317, 255, 1),
(330, '河源', 317, 255, 1),
(331, '梅州', 317, 255, 1),
(332, '清远', 317, 255, 1),
(333, '云浮', 317, 255, 1),
(334, '茂名', 317, 255, 1),
(335, '汕尾', 317, 255, 1),
(336, '揭阳', 317, 255, 1),
(337, '潮州', 317, 255, 1),
(338, '湛江', 317, 255, 1),
(339, '海南省', 0, 255, 1),
(340, '海口市', 339, 255, 1),
(341, '三亚市', 339, 255, 1),
(342, '广西壮族自治区', 0, 255, 1),
(343, '南宁', 342, 255, 1),
(344, '柳州', 342, 255, 1),
(345, '桂林', 342, 255, 1),
(346, '梧州', 342, 255, 1),
(347, '北海', 342, 255, 1),
(348, '防城港', 342, 255, 1),
(349, '钦州', 342, 255, 1),
(350, '贵港', 342, 255, 1),
(351, '玉林', 342, 255, 1),
(352, '百色', 342, 255, 1),
(353, '贺州', 342, 255, 1),
(354, '河池', 342, 255, 1),
(355, '来宾', 342, 255, 1),
(356, '崇左', 342, 255, 1),
(357, '四川省', 0, 255, 1),
(358, '成都', 357, 255, 1),
(359, '自贡', 357, 255, 1),
(360, '攀枝花', 357, 255, 1),
(361, '泸州', 357, 255, 1),
(362, '德阳', 357, 255, 1),
(363, '绵阳', 357, 255, 1),
(364, '广元', 357, 255, 1),
(365, '遂宁', 357, 255, 1),
(366, '内江', 357, 255, 1),
(367, '资阳', 357, 255, 1),
(368, '乐山', 357, 255, 1),
(369, '眉山', 357, 255, 1),
(370, '南充', 357, 255, 1),
(371, '宜宾', 357, 255, 1),
(372, '广安', 357, 255, 1),
(373, '达州', 357, 255, 1),
(374, '巴中', 357, 255, 1),
(375, '雅安', 357, 255, 1),
(376, '阿坝', 357, 255, 1),
(377, '甘孜', 357, 255, 1),
(378, '凉山', 357, 255, 1),
(379, '贵州省', 0, 255, 1),
(380, '贵阳市', 379, 255, 1),
(381, '遵义市', 379, 255, 1),
(382, '安顺市', 379, 255, 1),
(383, '六盘水市', 379, 255, 1),
(384, '毕节地区', 379, 255, 1),
(385, '铜仁地区', 379, 255, 1),
(386, '黔东南州', 379, 255, 1),
(387, '黔南州', 379, 255, 1),
(388, '黔西南州', 379, 255, 1),
(389, '云南省', 0, 255, 1),
(390, '昆明市', 389, 255, 1),
(391, '曲靖市', 389, 255, 1),
(392, '红河哈尼族彝族自治州', 389, 255, 1),
(393, '昭通市', 389, 255, 1),
(394, '玉溪市', 389, 255, 1),
(395, '德宏傣族景颇族自治州', 389, 255, 1),
(396, '丽江市', 389, 255, 1),
(397, '迪庆藏族自治州', 389, 255, 1),
(398, '文山壮族苗族自治州', 389, 255, 1),
(399, '思茅市', 389, 255, 1),
(400, '大理白族自治州', 389, 255, 1),
(401, '怒江傈僳族自治州', 389, 255, 1),
(402, '保山市', 389, 255, 1),
(403, '楚雄彝族自治州', 389, 255, 1),
(404, '西双版纳傣族自治州', 389, 255, 1),
(405, '临沧市', 389, 255, 1),
(406, '西藏自治区', 0, 255, 1),
(407, '拉萨', 406, 255, 1),
(408, '日喀则', 406, 255, 1),
(409, '林芝', 406, 255, 1),
(410, '山南', 406, 255, 1),
(411, '那曲', 406, 255, 1),
(412, '昌都', 406, 255, 1),
(413, '阿里', 406, 255, 1),
(414, '陕西省', 0, 255, 1),
(415, '西安市', 414, 255, 1),
(416, '铜川市', 414, 255, 1),
(417, '宝鸡市', 414, 255, 1),
(418, '咸阳市', 414, 255, 1),
(419, '渭南市', 414, 255, 1),
(420, '延安市', 414, 255, 1),
(421, '汉中市', 414, 255, 1),
(422, '榆林市', 414, 255, 1),
(423, '安康市', 414, 255, 1),
(424, '商洛市', 414, 255, 1),
(425, '甘肃省', 0, 255, 1),
(426, '兰州市', 425, 255, 1),
(427, '嘉峪关', 425, 255, 1),
(428, '金昌市', 425, 255, 1),
(429, '白银市', 425, 255, 1),
(430, '天水市', 425, 255, 1),
(431, '酒泉市', 425, 255, 1),
(432, '张掖市', 425, 255, 1),
(433, '武威市', 425, 255, 1),
(434, '定西市', 425, 255, 1),
(435, '陇南市', 425, 255, 1),
(436, '平凉市', 425, 255, 1),
(437, '庆阳市', 425, 255, 1),
(438, '临夏州', 425, 255, 1),
(439, '甘南州', 425, 255, 1),
(440, '青海省', 0, 255, 1),
(441, '西宁市', 440, 255, 1),
(442, '海东行署', 440, 255, 1),
(443, '海北藏族自治州', 440, 255, 1),
(444, '海南藏族自治州', 440, 255, 1),
(445, '海西州', 440, 255, 1),
(446, '黄南藏族自治州', 440, 255, 1),
(447, '玉树藏族自治州', 440, 255, 1),
(448, '果洛藏族自治州', 440, 255, 1),
(449, '宁夏回族自治区', 0, 255, 1),
(450, '银川市', 449, 255, 1),
(451, '石嘴山市', 449, 255, 1),
(452, '吴忠市', 449, 255, 1),
(453, '固原市', 449, 255, 1),
(454, '中卫市', 449, 255, 1),
(455, '新疆维吾尔自治区', 0, 255, 1),
(456, '伊犁哈萨克自治州', 455, 255, 1),
(457, '乌鲁木齐市', 455, 255, 1),
(458, '昌吉回族自治州', 455, 255, 1),
(459, '石河子市', 455, 255, 1),
(460, '克拉玛依市', 455, 255, 1),
(461, '阿勒泰地区', 455, 255, 1),
(462, '博尔塔拉蒙古自治州', 455, 255, 1),
(463, '塔城地区', 455, 255, 1),
(464, '和田地区', 455, 255, 1),
(465, '克孜勒苏克尔克孜自治州', 455, 255, 1),
(466, '喀什地区', 455, 255, 1),
(467, '阿克苏地区', 455, 255, 1),
(468, '巴音郭楞蒙古自治州', 455, 255, 1),
(469, '吐鲁番地区', 455, 255, 1),
(470, '哈密地区', 455, 255, 1),
(471, '五家渠市', 455, 255, 1),
(472, '阿拉尔市', 455, 255, 1),
(473, '图木舒克市', 455, 255, 1),
(474, '上海', 0, 3, 1),
(475, '重庆', 0, 4, 1),
(476, '天津', 0, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `swd_report`
--

CREATE TABLE `swd_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '举报人ID',
  `store_id` int(10) DEFAULT NULL COMMENT '被举报店铺ID',
  `goods_id` int(10) DEFAULT NULL COMMENT '被举报商品ID',
  `content` varchar(255) DEFAULT NULL COMMENT '举报内容',
  `images` text,
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `status` int(3) DEFAULT NULL COMMENT '状态',
  `examine` varchar(20) DEFAULT NULL COMMENT '审核员',
  `verify` varchar(255) DEFAULT NULL COMMENT '审核说明'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_scategory`
--

CREATE TABLE `swd_scategory` (
  `cate_id` int(10) UNSIGNED NOT NULL,
  `cate_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) UNSIGNED DEFAULT '0',
  `sort_order` tinyint(3) UNSIGNED DEFAULT '255',
  `if_show` int(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_scategory`
--

INSERT INTO `swd_scategory` (`cate_id`, `cate_name`, `parent_id`, `sort_order`, `if_show`) VALUES
(1, '服装', 0, 255, 1),
(2, '女装/女士精品', 1, 255, 1),
(3, '男装', 1, 255, 1),
(4, '女鞋', 1, 255, 1),
(5, '流行男鞋', 1, 255, 1),
(6, '运动鞋', 1, 255, 1),
(7, '女士内衣/男士内衣/家居服', 1, 255, 1),
(8, '箱包皮具/热销女包/男包', 1, 255, 1),
(9, '运动服/运动包/颈环配件', 1, 255, 1),
(10, '服饰配件/皮带/帽子/围巾', 1, 255, 1),
(11, '手机/数码/办公/家电', 0, 255, 1),
(12, '手机', 11, 255, 1),
(13, '国货精品手机', 11, 255, 1),
(14, '笔记本电脑', 11, 255, 1),
(15, '电脑硬件/台式整机/网络设备', 11, 255, 1),
(16, 'MP3/MP4/iPod/录音笔', 11, 255, 1),
(17, '数码相机/摄像机/图形冲印', 11, 255, 1),
(18, '3C数码配件市场', 11, 255, 1),
(19, '网络服务/电脑软件', 11, 255, 1),
(20, '闪存卡/U盘/移动存储', 11, 255, 1),
(21, '电玩/配件/游戏/攻略', 11, 255, 1),
(22, '办公设备/文具/耗材', 11, 255, 1),
(23, '影音电器', 11, 255, 1),
(24, '美容护肤/个人护理', 0, 255, 1),
(25, '美容护肤/美体/精油', 24, 255, 1),
(26, '彩妆/香水/美发/工具', 24, 255, 1),
(27, '个人护理/保健/按摩器材', 24, 255, 1),
(28, '家居/母婴/食品', 0, 255, 1),
(29, '居家日用/厨房餐饮/卫浴洗浴', 28, 255, 1),
(30, '时尚家饰/工艺品/十字绣', 28, 255, 1),
(31, '家具/家具定制/宜家代购', 28, 255, 1),
(32, '家纺/床品/地毯/布艺', 28, 255, 1),
(33, '装潢/灯具/五金/安防/卫浴', 28, 255, 1),
(34, '保健食品', 28, 255, 1),
(35, '食品/茶叶/零食/特产', 28, 255, 1),
(36, '奶粉/尿片/母婴用品', 28, 255, 1),
(37, '益智玩具/童车/童床/书包', 28, 255, 1),
(38, '童装/童鞋/孕妇装', 28, 255, 1),
(39, '宠物/宠物食品及用品', 28, 255, 1),
(40, '厨房电器', 28, 255, 1),
(41, '生活电器', 28, 255, 1),
(42, '文体/汽车', 0, 255, 1),
(43, '书籍/杂志/报纸', 42, 255, 1),
(44, '音乐/影视/明星/乐器', 42, 255, 1),
(45, '运动/瑜伽/健身/球迷用品', 42, 255, 1),
(46, '户外/登山/野营/涉水', 42, 255, 1),
(47, '汽车/配件/改装/摩托/自行车', 42, 255, 1),
(48, '珠宝/首饰', 0, 255, 1),
(49, '饰品/流行首饰/时尚饰品', 48, 255, 1),
(50, '珠宝/钻石/翡翠/黄金', 48, 255, 1),
(51, '品牌手表/流行手表', 48, 255, 1),
(52, '收藏/爱好', 0, 255, 1),
(53, '古董/邮币/字画/收藏', 52, 255, 1),
(54, '玩具/模型/娃娃/人偶', 52, 255, 1),
(55, 'ZIPPO/瑞士军刀/眼镜', 52, 255, 1),
(56, '游戏/话费', 0, 255, 1),
(57, '腾讯QQ专区', 56, 255, 1),
(58, '网游装备/游戏币/帐号/代练', 56, 255, 1),
(59, '网络游戏点卡', 56, 255, 1),
(60, '移动/联通/小灵通充值中心', 56, 255, 1),
(61, 'IP卡/网络电话/手机号码', 56, 255, 1),
(62, '生活服务', 0, 255, 1),
(63, '鲜花/绿植/场地布置', 62, 255, 1),
(64, '网店装修/物流快递/图片存储', 62, 255, 1),
(65, '鲜花速递/蛋糕配送/园艺花艺', 62, 255, 1),
(66, '演出/旅游/吃喝玩乐折扣券', 62, 255, 1);

-- --------------------------------------------------------

--
-- 表的结构 `swd_sgrade`
--

CREATE TABLE `swd_sgrade` (
  `grade_id` int(10) UNSIGNED NOT NULL,
  `grade_name` varchar(60) NOT NULL DEFAULT '',
  `goods_limit` int(10) UNSIGNED DEFAULT '0',
  `space_limit` int(10) UNSIGNED DEFAULT '0',
  `charge` varchar(100) DEFAULT '',
  `need_confirm` tinyint(3) UNSIGNED DEFAULT '0',
  `description` varchar(255) DEFAULT '',
  `skins` varchar(255) DEFAULT '',
  `wap_skins` varchar(255) DEFAULT '',
  `sort_order` tinyint(4) UNSIGNED DEFAULT '255'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_sgrade`
--

INSERT INTO `swd_sgrade` (`grade_id`, `grade_name`, `goods_limit`, `space_limit`, `charge`, `need_confirm`, `description`, `skins`, `wap_skins`, `sort_order`) VALUES
(1, '系统默认', 1000, 500, '0', 0, '测试用户请选择“默认等级”，可以立即开通', 'default|default', 'default|default', 255),
(2, '认证店铺', 2000, 2000, '0', 1, '申请时需要上传身份证和营业执照', 'default|default', 'default|default', 255);

-- --------------------------------------------------------

--
-- 表的结构 `swd_sgrade_integral`
--

CREATE TABLE `swd_sgrade_integral` (
  `id` int(10) UNSIGNED NOT NULL,
  `sgrade_id` int(10) NOT NULL DEFAULT '0',
  `buy_integral` decimal(10,2) DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_store`
--

CREATE TABLE `swd_store` (
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `store_name` varchar(100) NOT NULL DEFAULT '',
  `owner_name` varchar(60) DEFAULT '',
  `identity_card` varchar(60) DEFAULT '',
  `region_id` int(10) UNSIGNED DEFAULT NULL,
  `region_name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT '',
  `zipcode` varchar(20) DEFAULT '',
  `tel` varchar(60) DEFAULT '',
  `sgrade` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `stype` varchar(20) NOT NULL DEFAULT 'personal',
  `joinway` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `apply_remark` varchar(255) DEFAULT '',
  `credit_value` decimal(10,2) UNSIGNED DEFAULT '0.00',
  `praise_rate` decimal(10,2) UNSIGNED DEFAULT '0.00',
  `domain` varchar(255) DEFAULT NULL,
  `state` tinyint(3) UNSIGNED DEFAULT '0',
  `close_reason` varchar(255) DEFAULT '',
  `add_time` int(10) UNSIGNED DEFAULT NULL,
  `end_time` int(10) UNSIGNED DEFAULT '0',
  `certification` varchar(255) DEFAULT NULL,
  `sort_order` int(10) UNSIGNED DEFAULT '255',
  `recommended` tinyint(4) DEFAULT '0',
  `theme` varchar(60) DEFAULT '',
  `store_banner` varchar(255) DEFAULT NULL,
  `store_logo` varchar(255) DEFAULT NULL,
  `description` text,
  `identity_front` varchar(255) DEFAULT '',
  `identity_back` varchar(255) DEFAULT '',
  `business_license` varchar(255) DEFAULT '',
  `im_qq` varchar(60) DEFAULT '',
  `swiper` text,
  `longitude` varchar(20) DEFAULT '',
  `latitude` varchar(20) DEFAULT '',
  `zoom` int(10) DEFAULT '15'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_store`
--

INSERT INTO `swd_store` (`store_id`, `store_name`, `owner_name`, `identity_card`, `region_id`, `region_name`, `address`, `zipcode`, `tel`, `sgrade`, `stype`, `joinway`, `apply_remark`, `credit_value`, `praise_rate`, `domain`, `state`, `close_reason`, `add_time`, `end_time`, `certification`, `sort_order`, `recommended`, `theme`, `store_banner`, `store_logo`, `description`, `identity_front`, `identity_back`, `business_license`, `im_qq`, `swiper`, `longitude`, `latitude`, `zoom`) VALUES
(2, '博艺花卉', '郭惠', '1234567890', 284, '  湖北省	武汉', '汉正街华贸二号楼1-81号', '', '13476299284', 1, 'personal', 0, '', '92.00', '100.00', NULL, 1, '', 1542757210, 1924991999, 'autonym', 255, 1, 'default', 'data/files/store_2/other/store_banner.png', 'data/files/store_2/other/store_logo.png', '', '', '', '', '', '[{\"url\":\"data\\/files\\/store_2\\/swiper\\/swiper_1.jpg\",\"link\":\"\"},{\"url\":\"data\\/files\\/store_2\\/swiper\\/swiper_2.jpg\",\"link\":\"\"},{\"url\":\"data\\/files\\/store_2\\/swiper\\/swiper_3.jpg\",\"link\":\"\"}]', '', '', 15);

-- --------------------------------------------------------

--
-- 表的结构 `swd_teambuy`
--

CREATE TABLE `swd_teambuy` (
  `id` int(11) UNSIGNED NOT NULL,
  `goods_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(3) NOT NULL DEFAULT '1',
  `store_id` int(10) DEFAULT '0',
  `people` int(10) UNSIGNED NOT NULL DEFAULT '2',
  `specs` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_teambuy`
--

INSERT INTO `swd_teambuy` (`id`, `goods_id`, `title`, `status`, `store_id`, `people`, `specs`) VALUES
(1, 24, 'twopeople', 1, 2, 2, 'a:1:{i:24;a:2:{s:5:\"price\";s:1:\"8\";s:4:\"type\";s:8:\"discount\";}}'),
(2, 22, 'twopeople', 1, 2, 3, 'a:1:{i:22;a:2:{s:5:\"price\";s:1:\"7\";s:4:\"type\";s:8:\"discount\";}}'),
(3, 12, 'twopeople', 1, 2, 2, 'a:1:{i:12;a:2:{s:5:\"price\";s:3:\"8.9\";s:4:\"type\";s:8:\"discount\";}}'),
(4, 17, 'twopeople', 1, 2, 2, 'a:1:{i:17;a:2:{s:5:\"price\";s:1:\"7\";s:4:\"type\";s:8:\"discount\";}}'),
(5, 13, 'twopeople', 1, 2, 2, 'a:1:{i:13;a:2:{s:5:\"price\";s:3:\"8.4\";s:4:\"type\";s:8:\"discount\";}}'),
(6, 16, 'twopeople', 1, 2, 3, 'a:1:{i:16;a:2:{s:5:\"price\";s:1:\"9\";s:4:\"type\";s:8:\"discount\";}}');

-- --------------------------------------------------------

--
-- 表的结构 `swd_teambuy_log`
--

CREATE TABLE `swd_teambuy_log` (
  `logid` int(11) UNSIGNED NOT NULL,
  `tbid` int(10) UNSIGNED DEFAULT '0',
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `teamid` varchar(32) NOT NULL DEFAULT '',
  `leader` tinyint(3) UNSIGNED DEFAULT '0',
  `people` int(10) UNSIGNED NOT NULL DEFAULT '2',
  `status` tinyint(3) UNSIGNED DEFAULT '0',
  `created` int(11) UNSIGNED NOT NULL,
  `expired` int(11) UNSIGNED NOT NULL,
  `pay_time` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_uploaded_file`
--

CREATE TABLE `swd_uploaded_file` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED DEFAULT '0',
  `file_type` varchar(60) DEFAULT '',
  `file_size` int(10) UNSIGNED DEFAULT '0',
  `file_name` varchar(255) DEFAULT '',
  `file_path` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) UNSIGNED DEFAULT NULL,
  `belong` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `item_id` int(10) UNSIGNED DEFAULT '0',
  `link_url` varchar(50) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_uploaded_file`
--

INSERT INTO `swd_uploaded_file` (`file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id`, `link_url`) VALUES
(187, 2, 'jpg', 393834, '微信图片_20230816120647.jpg', 'data/files/store_2/goods/20230822163809876.jpg', 1692693489, 2, 70, ''),
(188, 2, 'jpg', 439035, '微信图片_20230819183206.jpg', 'data/files/store_2/goods/20230822164029261.jpg', 1692693629, 2, 71, ''),
(189, 2, 'jpg', 568889, '微信图片_20230816121126.jpg', 'data/files/store_2/goods/20230822164241342.jpg', 1692693761, 2, 72, ''),
(203, 2, 'jpg', 319287, '微信图片_20230816120640.jpg', 'data/files/store_2/goods/20230822175242642.jpg', 1692697962, 2, 73, ''),
(191, 2, 'jpg', 485755, '微信图片_20230816120502.jpg', 'data/files/store_2/goods/20230822164739160.jpg', 1692694059, 2, 74, ''),
(192, 2, 'jpg', 520423, '微信图片_20230819183212.jpg', 'data/files/store_2/goods/20230822170435898.jpg', 1692695075, 2, 75, ''),
(193, 2, 'jpg', 433125, '微信图片_20230819183207_1.jpg', 'data/files/store_2/goods/20230822170842971.jpg', 1692695322, 2, 76, ''),
(194, 2, 'jpg', 465696, '微信图片_20230611082529.jpg', 'data/files/store_2/goods/20230822171124479.jpg', 1692695484, 2, 77, ''),
(195, 2, 'jpg', 454956, '微信图片_20230816120619.jpg', 'data/files/store_2/goods/20230822171243862.jpg', 1692695563, 2, 78, ''),
(196, 2, 'jpg', 704728, '微信图片_20230816120634.jpg', 'data/files/store_2/goods/20230822171409819.jpg', 1692695649, 2, 79, ''),
(197, 2, 'jpg', 650737, '微信图片_20230610124130.jpg', 'data/files/store_2/goods/20230822171447383.jpg', 1692695687, 2, 80, ''),
(198, 2, 'jpg', 521860, '微信图片_20230816120654.jpg', 'data/files/store_2/goods/20230822171554165.jpg', 1692695754, 2, 81, ''),
(199, 2, 'jpg', 540946, '微信图片_20230817061609.jpg', 'data/files/store_2/goods/20230822171701600.jpg', 1692695821, 2, 82, ''),
(201, 2, 'png', 1331929, '微信图片_20230822171837.png', 'data/files/store_2/goods/20230822171855630.png', 1692695935, 2, 83, ''),
(166, 2, 'jpg', 413462, '微信图片_20230816130646.jpg', 'data/files/store_2/goods/20230820163210408.jpg', 1692520330, 2, 50, ''),
(165, 2, 'jpg', 352213, '微信图片_20230819183219.jpg', 'data/files/store_2/goods/20230820163134314.jpg', 1692520294, 2, 51, ''),
(169, 2, 'jpg', 343932, '微信图片_20230808174209.jpg', 'data/files/store_2/goods/20230820163315888.jpg', 1692520395, 2, 47, ''),
(163, 2, 'jpg', 375285, '微信图片_20230610123849.jpg', 'data/files/store_2/goods/20230820163017580.jpg', 1692520217, 2, 52, ''),
(179, 2, 'jpg', 312594, '680.jpg', 'data/files/store_2/goods/20230820163738317.jpg', 1692520658, 2, 6, ''),
(152, 2, 'png', 1319559, '微信图片_20230820142518.png', 'data/files/store_2/goods/20230820162651830.png', 1692520011, 2, 54, ''),
(154, 2, 'png', 1268633, '微信图片_20230820125953.png', 'data/files/store_2/goods/20230820162739715.png', 1692520059, 2, 62, ''),
(155, 2, 'jpg', 291204, '微信图片_20230819183213.jpg', 'data/files/store_2/goods/20230820162756624.jpg', 1692520076, 2, 61, ''),
(156, 2, 'jpg', 345765, '微信图片_20230819183216.jpg', 'data/files/store_2/goods/20230820162807226.jpg', 1692520087, 2, 60, ''),
(157, 2, 'jpg', 420908, '微信图片_20230820124138.jpg', 'data/files/store_2/goods/20230820162833704.jpg', 1692520113, 2, 59, ''),
(158, 2, 'jpg', 328215, '微信图片_20230820131021.jpg', 'data/files/store_2/goods/20230820162850882.jpg', 1692520130, 2, 58, ''),
(159, 2, 'png', 1270862, '微信图片_20230820142849.png', 'data/files/store_2/goods/20230820162905371.png', 1692520145, 2, 57, ''),
(160, 2, 'jpg', 171254, '微信图片_20230610123830.jpg', 'data/files/store_2/goods/20230820162918116.jpg', 1692520158, 2, 56, ''),
(161, 2, 'jpg', 303857, '微信图片_20230610123909.jpg', 'data/files/store_2/goods/20230820162934601.jpg', 1692520174, 2, 55, ''),
(162, 2, 'jpg', 364140, '微信图片_20230816121844.jpg', 'data/files/store_2/goods/20230820163000298.jpg', 1692520200, 2, 53, ''),
(182, 2, 'jpg', 196830, '微信图片_20230610124114.jpg', 'data/files/store_2/goods/20230822162842363.jpg', 1692692922, 2, 67, ''),
(186, 2, 'jpg', 394182, '微信图片_20230819183215_1.jpg', 'data/files/store_2/goods/20230822163344199.jpg', 1692693224, 2, 68, ''),
(185, 2, 'jpg', 390008, '微信图片_20230610124049.jpg', 'data/files/store_2/goods/20230822163222218.jpg', 1692693142, 2, 69, ''),
(98, 2, 'jpg', 393834, '微信图片_20230816120647.jpg', 'data/files/store_2/goods/20230816120916442.jpg', 1692158956, 2, 13, ''),
(100, 2, 'jpg', 900773, '微信图片_20230816121854.jpg', 'data/files/store_2/goods/20230816122008877.jpg', 1692159608, 2, 2, ''),
(101, 2, 'jpg', 364140, '微信图片_20230816121844.jpg', 'data/files/store_2/goods/20230816122104135.jpg', 1692159664, 2, 2, ''),
(118, 2, 'jpg', 540946, '微信图片_20230817061609.jpg', 'data/files/store_2/goods/20230817090255613.jpg', 1692234175, 2, 17, ''),
(103, 2, 'jpg', 769472, '微信图片_20230611082529.jpg', 'data/files/store_2/goods/20230816123517445.jpg', 1692160517, 2, 28, ''),
(104, 2, 'jpg', 485755, '微信图片_20230816120502.jpg', 'data/files/store_2/goods/20230816123603924.jpg', 1692160563, 2, 27, ''),
(105, 2, 'jpg', 521860, '微信图片_20230816120654.jpg', 'data/files/store_2/goods/20230816123620252.jpg', 1692160580, 2, 31, ''),
(106, 2, 'jpg', 454956, '微信图片_20230816120619.jpg', 'data/files/store_2/goods/20230816123641687.jpg', 1692160601, 2, 29, ''),
(99, 2, 'jpg', 407632, '微信图片_20230816121850.jpg', 'data/files/store_2/goods/20230816122003617.jpg', 1692159603, 2, 2, ''),
(89, 2, 'jpg', 369053, '微信图片_20230610123905.jpg', 'data/files/store_2/goods/20230816114816328.jpg', 1692157696, 2, 22, ''),
(176, 2, 'jpg', 333793, '280.jpg', 'data/files/store_2/goods/20230820163605738.jpg', 1692520565, 2, 10, ''),
(92, 2, 'jpg', 375285, '微信图片_20230610123849.jpg', 'data/files/store_2/goods/20230816115129601.jpg', 1692157889, 2, 11, ''),
(177, 2, 'png', 1251197, '360.png', 'data/files/store_2/goods/20230820163702147.png', 1692520622, 2, 8, ''),
(178, 2, 'jpg', 185719, '380.jpg', 'data/files/store_2/goods/20230820163720658.jpg', 1692520640, 2, 7, ''),
(153, 2, 'jpg', 369053, '微信图片_20230610123905.jpg', 'data/files/store_2/goods/20230820162720730.jpg', 1692520040, 2, 63, ''),
(96, 2, 'jpg', 453855, '微信图片_20230816120519.jpg', 'data/files/store_2/goods/20230816120748708.jpg', 1692158868, 2, 2, ''),
(112, 2, 'jpg', 422559, '微信图片_20230816120626.jpg', 'data/files/store_2/goods/20230816130524384.jpg', 1692162324, 2, 18, ''),
(107, 2, 'jpg', 500684, '微信图片_20230816120601.jpg', 'data/files/store_2/goods/20230816123725614.jpg', 1692160645, 2, 30, ''),
(168, 2, 'jpg', 453855, '微信图片_20230816120519.jpg', 'data/files/store_2/goods/20230820163253695.jpg', 1692520373, 2, 48, ''),
(167, 2, 'jpg', 299554, '微信图片_20230819183217.jpg', 'data/files/store_2/goods/20230820163231543.jpg', 1692520351, 2, 49, ''),
(108, 2, 'jpg', 303959, '微信图片_20230610124120.jpg', 'data/files/store_2/goods/20230816124525994.jpg', 1692161125, 2, 20, ''),
(109, 2, 'jpg', 503674, '微信图片_20230816124041.jpg', 'data/files/store_2/goods/20230816124525130.jpg', 1692161125, 2, 20, ''),
(110, 2, 'jpg', 196830, '微信图片_20230610124114.jpg', 'data/files/store_2/goods/20230816125053258.jpg', 1692161453, 2, 19, ''),
(111, 2, 'jpg', 493999, '微信图片_20230610124143.jpg', 'data/files/store_2/goods/20230816125053922.jpg', 1692161453, 2, 19, ''),
(113, 2, 'jpg', 319287, '微信图片_20230816120640.jpg', 'data/files/store_2/goods/20230816140604645.jpg', 1692165964, 2, 16, ''),
(114, 2, 'jpg', 568889, '微信图片_20230816121126.jpg', 'data/files/store_2/goods/20230816140705675.jpg', 1692166025, 2, 41, ''),
(115, 2, 'jpg', 457482, '微信图片_20230816140301.jpg', 'data/files/store_2/goods/20230816140813564.jpg', 1692166093, 2, 37, ''),
(116, 2, 'jpg', 704728, '微信图片_20230816120634.jpg', 'data/files/store_2/goods/20230816140848363.jpg', 1692166128, 2, 34, ''),
(117, 2, 'jpg', 695581, '微信图片_20230610124152.jpg', 'data/files/store_2/goods/20230816141057654.jpg', 1692166257, 2, 32, ''),
(119, 2, 'jpg', 271044, '微信图片_20230817184816.jpg', 'data/files/store_2/goods/20230819114534978.jpg', 1692416734, 2, 12, ''),
(120, 2, 'jpg', 130316, '微信图片_20230819115039.jpg', 'data/files/store_2/goods/20230819115134902.jpg', 1692417094, 2, 38, ''),
(174, 2, 'jpg', 333115, '300.jpg', 'data/files/store_2/goods/20230820163512392.jpg', 1692520512, 2, 42, ''),
(180, 2, 'jpg', 407632, '微信图片_20230816121850.jpg', 'data/files/store_2/goods/20230822145507332.jpg', 1692687307, 2, 64, ''),
(172, 2, 'jpg', 369477, '1-1.jpg', 'data/files/store_2/goods/20230820163424847.jpg', 1692520464, 2, 44, ''),
(171, 2, 'png', 1155251, '1-2.png', 'data/files/store_2/goods/20230820163355480.png', 1692520435, 2, 45, ''),
(173, 2, 'jpg', 351397, '260.jpg', 'data/files/store_2/goods/20230820163452303.jpg', 1692520492, 2, 43, ''),
(181, 2, 'jpg', 493999, '微信图片_20230610124143.jpg', 'data/files/store_2/goods/20230822162749566.jpg', 1692692869, 2, 66, ''),
(170, 2, 'jpg', 708332, '微信图片_20230610123915.jpg', 'data/files/store_2/goods/20230820163335872.jpg', 1692520415, 2, 46, ''),
(202, 2, 'jpg', 412649, '微信图片_20230819183213_1.jpg', 'data/files/store_2/goods/20230822175110176.jpg', 1692697870, 2, 84, ''),
(204, 2, 'jpg', 163831, '微信图片_202308221801141.jpg', 'data/files/store_2/goods/20230905225155151.jpg', 1693925515, 2, 85, ''),
(205, 2, 'jpg', 158403, '微信图片_202308221801142.jpg', 'data/files/store_2/goods/20230905225241659.jpg', 1693925561, 2, 86, ''),
(206, 2, 'jpg', 211695, '微信图片_20230822180122.jpg', 'data/files/store_2/goods/20230905225415848.jpg', 1693925655, 2, 88, ''),
(207, 2, 'jpg', 187735, '微信图片_20230822180116.jpg', 'data/files/store_2/goods/20230905225443648.jpg', 1693925683, 2, 87, ''),
(208, 2, 'jpg', 228504, '微信图片_202308221801221.jpg', 'data/files/store_2/goods/20230905225659608.jpg', 1693925819, 2, 89, ''),
(209, 2, 'jpg', 222094, '微信图片_202308221801212.jpg', 'data/files/store_2/goods/20230905225742483.jpg', 1693925862, 2, 90, ''),
(210, 2, 'jpg', 232268, '微信图片_202308221801202.jpg', 'data/files/store_2/goods/20230905225852790.jpg', 1693925932, 2, 91, ''),
(211, 2, 'jpg', 206137, '微信图片_202308221801201.jpg', 'data/files/store_2/goods/20230905225940225.jpg', 1693925980, 2, 92, ''),
(212, 2, 'jpg', 195738, '微信图片_202308221801161.jpg', 'data/files/store_2/goods/20230905230044822.jpg', 1693926044, 2, 93, ''),
(213, 2, 'jpg', 217274, '微信图片_202308221801181.jpg', 'data/files/store_2/goods/20230905230145245.jpg', 1693926105, 2, 94, ''),
(214, 2, 'jpg', 170784, '微信图片_202308221801182.jpg', 'data/files/store_2/goods/20230905230231893.jpg', 1693926151, 2, 95, ''),
(215, 2, 'jpg', 253612, '微信图片_202308221801171.jpg', 'data/files/store_2/goods/20230905230342868.jpg', 1693926222, 2, 96, ''),
(216, 2, 'jpg', 308891, '微信图片_202308221801162.jpg', 'data/files/store_2/goods/20230905230421786.jpg', 1693926261, 2, 97, ''),
(217, 2, 'jpg', 225036, '微信图片_202308221801151.jpg', 'data/files/store_2/goods/20230905230528613.jpg', 1693926328, 2, 98, ''),
(218, 2, 'jpg', 240799, '微信图片_20230822180120.jpg', 'data/files/store_2/goods/20230905230750469.jpg', 1693926470, 2, 99, ''),
(219, 2, 'jpg', 240799, '微信图片_20230822180120.jpg', 'data/files/store_2/goods/20230905230818991.jpg', 1693926498, 2, 99, ''),
(220, 2, 'jpg', 202576, '微信图片_202308221801192.jpg', 'data/files/store_2/goods/20230905230914272.jpg', 1693926554, 2, 100, ''),
(221, 2, 'jpg', 243713, '微信图片_202308221801172.jpg', 'data/files/store_2/goods/20230905231102967.jpg', 1693926662, 2, 101, ''),
(222, 2, 'jpg', 253947, '微信图片_20230822180115.jpg', 'data/files/store_2/goods/20230905231140907.jpg', 1693926700, 2, 102, ''),
(223, 2, 'jpg', 254645, '微信图片_20230822180119.jpg', 'data/files/store_2/goods/20230905231225186.jpg', 1693926745, 2, 103, ''),
(224, 2, 'jpg', 220887, '微信图片_202308221801191.jpg', 'data/files/store_2/goods/20230905231258376.jpg', 1693926778, 2, 104, ''),
(225, 2, 'jpg', 295808, '微信图片_20230822180118.jpg', 'data/files/store_2/goods/20230905231342932.jpg', 1693926822, 2, 105, ''),
(226, 2, 'jpg', 156555, '微信图片_20230822180113.jpg', 'data/files/store_2/goods/20230905231523287.jpg', 1693926923, 2, 106, ''),
(227, 2, 'jpg', 164898, '微信图片_20230822180024.jpg', 'data/files/store_2/goods/20230905231555579.jpg', 1693926955, 2, 107, ''),
(228, 2, 'jpg', 237602, '微信图片_20230822180121.jpg', 'data/files/store_2/goods/20230905231652463.jpg', 1693927012, 2, 108, ''),
(229, 2, 'jpg', 235617, '微信图片_202308221801143.jpg', 'data/files/store_2/goods/20230905231732325.jpg', 1693927052, 2, 109, ''),
(230, 2, 'jpg', 299353, '微信图片_20230822180117.jpg', 'data/files/store_2/goods/20230905231807933.jpg', 1693927087, 2, 110, ''),
(231, 2, 'jpg', 266817, '微信图片_20230611085426.jpg', 'data/files/store_2/goods/20230906132404473.jpg', 1693977844, 2, 111, ''),
(232, 2, 'jpg', 307627, '微信图片_20230611085404.jpg', 'data/files/store_2/goods/20230906132501628.jpg', 1693977901, 2, 112, ''),
(233, 2, 'jpg', 372024, '微信图片_20230611085423.jpg', 'data/files/store_2/goods/20230906132531188.jpg', 1693977931, 2, 113, ''),
(234, 2, 'jpg', 388049, '微信图片_20230611085459.jpg', 'data/files/store_2/goods/20230906132606251.jpg', 1693977966, 2, 114, ''),
(631, 2, 'jpg', 319312, '1-1.jpg', 'data/files/store_2/goods/20231105155032799.jpg', 1699170632, 2, 115, ''),
(236, 2, 'jpg', 400053, '微信图片_20230611085507.jpg', 'data/files/store_2/goods/20230906132714191.jpg', 1693978034, 2, 116, ''),
(237, 2, 'jpg', 541054, '微信图片_20230611085452.jpg', 'data/files/store_2/goods/20230906132809114.jpg', 1693978089, 2, 117, ''),
(238, 2, 'jpg', 476923, '微信图片_20230611085544.jpg', 'data/files/store_2/goods/20230906132843770.jpg', 1693978123, 2, 118, ''),
(239, 2, 'jpg', 332970, '微信图片_20230611085533.jpg', 'data/files/store_2/goods/20230906132943470.jpg', 1693978183, 2, 119, ''),
(240, 2, 'jpg', 293821, '微信图片_20230611085520.jpg', 'data/files/store_2/goods/20230906133013290.jpg', 1693978213, 2, 120, ''),
(241, 2, 'jpg', 340943, '微信图片_20230611085516.jpg', 'data/files/store_2/goods/20230906133056204.jpg', 1693978256, 2, 121, ''),
(576, 2, 'jpg', 421118, '微信图片_20231008100125.jpg', 'data/files/store_2/goods/20231008115714493.jpg', 1696737434, 2, 309, ''),
(243, 2, 'jpg', 492177, '微信图片_20230611085605.jpg', 'data/files/store_2/goods/20230906133408536.jpg', 1693978448, 2, 123, ''),
(244, 2, 'jpg', 325340, '微信图片_202309061341031.jpg', 'data/files/store_2/goods/20230906134322284.jpg', 1693979002, 2, 124, ''),
(245, 2, 'jpg', 332825, '微信图片_202309061341023.jpg', 'data/files/store_2/goods/20230906134407471.jpg', 1693979047, 2, 125, ''),
(246, 2, 'jpg', 301486, '微信图片_202309061341021.jpg', 'data/files/store_2/goods/20230906134444198.jpg', 1693979084, 2, 126, ''),
(247, 2, 'jpg', 343758, '微信图片_202309061341012.jpg', 'data/files/store_2/goods/20230906134533521.jpg', 1693979133, 2, 127, ''),
(248, 2, 'jpg', 298372, '微信图片_202309061341011.jpg', 'data/files/store_2/goods/20230906134604649.jpg', 1693979164, 2, 128, ''),
(249, 2, 'jpg', 382398, '微信图片_20230906134103.jpg', 'data/files/store_2/goods/20230906134640579.jpg', 1693979200, 2, 129, ''),
(250, 2, 'jpg', 345891, '微信图片_20230906134102.jpg', 'data/files/store_2/goods/20230906134710465.jpg', 1693979230, 2, 130, ''),
(251, 2, 'jpg', 283145, '微信图片_20230906134101.jpg', 'data/files/store_2/goods/20230906134739749.jpg', 1693979259, 2, 131, ''),
(252, 2, 'jpg', 289285, '微信图片_20230906134039.jpg', 'data/files/store_2/goods/20230906134807674.jpg', 1693979287, 2, 132, ''),
(253, 2, 'jpg', 254739, '微信图片_20230906135154.jpg', 'data/files/store_2/goods/20230906135307943.jpg', 1693979587, 2, 133, ''),
(254, 2, 'jpg', 249295, '微信图片_20230906135227.jpg', 'data/files/store_2/goods/20230906135334486.jpg', 1693979614, 2, 134, ''),
(255, 2, 'jpg', 396522, '微信图片_20230906135228.jpg', 'data/files/store_2/goods/20230906135404776.jpg', 1693979644, 2, 135, ''),
(256, 2, 'jpg', 340341, '微信图片_20230906135229.jpg', 'data/files/store_2/goods/20230906135431715.jpg', 1693979671, 2, 136, ''),
(257, 2, 'jpg', 342661, '微信图片_20230906135230.jpg', 'data/files/store_2/goods/20230906135506605.jpg', 1693979706, 2, 137, ''),
(258, 2, 'jpg', 277009, '微信图片_20230906135231.jpg', 'data/files/store_2/goods/20230906135620621.jpg', 1693979780, 2, 138, ''),
(259, 2, 'jpg', 277369, '微信图片_20230906135232.jpg', 'data/files/store_2/goods/20230906135723249.jpg', 1693979843, 2, 140, ''),
(260, 2, 'jpg', 410283, '微信图片_202309061352271.jpg', 'data/files/store_2/goods/20230906135756606.jpg', 1693979876, 2, 141, ''),
(261, 2, 'jpg', 303283, '微信图片_20230912134000.jpg', 'data/files/store_2/goods/20230912134146790.jpg', 1694497306, 2, 142, ''),
(262, 2, 'jpg', 202173, '微信图片_20230912134102.jpg', 'data/files/store_2/goods/20230912134307959.jpg', 1694497387, 2, 143, ''),
(263, 2, 'jpg', 278604, '微信图片_20230912134348.jpg', 'data/files/store_2/goods/20230912134406907.jpg', 1694497446, 2, 144, ''),
(264, 2, 'jpg', 219788, '微信图片_20230912134435.jpg', 'data/files/store_2/goods/20230912134444599.jpg', 1694497484, 2, 145, ''),
(265, 2, 'jpg', 247354, '微信图片_20230912134510.jpg', 'data/files/store_2/goods/20230912134520533.jpg', 1694497520, 2, 146, ''),
(266, 2, 'jpg', 269438, '微信图片_20230912134516.jpg', 'data/files/store_2/goods/20230912134557383.jpg', 1694497557, 2, 147, ''),
(267, 2, 'jpg', 259613, '微信图片_20230912134517.jpg', 'data/files/store_2/goods/20230912134637795.jpg', 1694497597, 2, 148, ''),
(268, 2, 'jpg', 194879, '微信图片_20230912134517_1.jpg', 'data/files/store_2/goods/20230912134712892.jpg', 1694497632, 2, 149, ''),
(269, 2, 'jpg', 280597, '微信图片_20230912134517_2.jpg', 'data/files/store_2/goods/20230912134750593.jpg', 1694497670, 2, 150, ''),
(270, 2, 'jpg', 234294, '微信图片_20230912134518.jpg', 'data/files/store_2/goods/20230912134835768.jpg', 1694497715, 2, 151, ''),
(271, 2, 'jpg', 244083, '微信图片_20230912134518_1.jpg', 'data/files/store_2/goods/20230912134920290.jpg', 1694497760, 2, 152, ''),
(272, 2, 'jpg', 375065, '微信图片_20230912134518_2.jpg', 'data/files/store_2/goods/20230912135030883.jpg', 1694497830, 2, 153, ''),
(273, 2, 'jpg', 359300, '微信图片_20230912134519_1.jpg', 'data/files/store_2/goods/20230912135244690.jpg', 1694497964, 2, 154, ''),
(274, 2, 'jpg', 209733, '微信图片_20230912134520.jpg', 'data/files/store_2/goods/20230912135344276.jpg', 1694498024, 2, 155, ''),
(275, 2, 'jpg', 285783, '微信图片_20230912135631.jpg', 'data/files/store_2/goods/20230912135643567.jpg', 1694498203, 2, 156, ''),
(276, 2, 'jpg', 229361, '微信图片_20230912135719.jpg', 'data/files/store_2/goods/20230912135727364.jpg', 1694498247, 2, 157, ''),
(277, 2, 'jpg', 378466, '微信图片_20230912135801.jpg', 'data/files/store_2/goods/20230912135809446.jpg', 1694498289, 2, 158, ''),
(278, 2, 'jpg', 331055, '微信图片_20230912135842.jpg', 'data/files/store_2/goods/20230912135854607.jpg', 1694498334, 2, 159, ''),
(279, 2, 'jpg', 296692, '微信图片_20230912135918.jpg', 'data/files/store_2/goods/20230912135935893.jpg', 1694498375, 2, 160, ''),
(280, 2, 'jpg', 231764, '微信图片_20230912140003.jpg', 'data/files/store_2/goods/20230912140012467.jpg', 1694498412, 2, 161, ''),
(281, 2, 'jpg', 279673, '微信图片_20230912140041.jpg', 'data/files/store_2/goods/20230912140049428.jpg', 1694498449, 2, 162, ''),
(282, 2, 'jpg', 289806, '微信图片_20230912140118.jpg', 'data/files/store_2/goods/20230912140127490.jpg', 1694498487, 2, 163, ''),
(283, 2, 'jpg', 287704, '微信图片_20230912140150.jpg', 'data/files/store_2/goods/20230912140158461.jpg', 1694498518, 2, 164, ''),
(284, 2, 'jpg', 269901, '微信图片_20230912140225.jpg', 'data/files/store_2/goods/20230912140234474.jpg', 1694498554, 2, 165, ''),
(285, 2, 'jpg', 243888, '微信图片_20230912140302.jpg', 'data/files/store_2/goods/20230912140310203.jpg', 1694498590, 2, 166, ''),
(286, 2, 'jpg', 260755, '微信图片_20230912140351.jpg', 'data/files/store_2/goods/20230912140359105.jpg', 1694498639, 2, 167, ''),
(287, 2, 'jpg', 371310, '微信图片_20230912140418.jpg', 'data/files/store_2/goods/20230912140432478.jpg', 1694498672, 2, 168, ''),
(288, 2, 'jpg', 295389, '微信图片_20230912140419.jpg', 'data/files/store_2/goods/20230912140539152.jpg', 1694498739, 2, 169, ''),
(289, 2, 'jpg', 325753, '微信图片_20230912140419_1.jpg', 'data/files/store_2/goods/20230912140632926.jpg', 1694498792, 2, 170, ''),
(290, 2, 'jpg', 314367, '微信图片_20230912140420.jpg', 'data/files/store_2/goods/20230912140741904.jpg', 1694498861, 2, 171, ''),
(291, 2, 'jpg', 315611, '微信图片_20230912140421.jpg', 'data/files/store_2/goods/20230912140846551.jpg', 1694498926, 2, 172, ''),
(292, 2, 'jpg', 294663, '微信图片_20230912142711.jpg', 'data/files/store_2/goods/20230912142850691.jpg', 1694500130, 2, 173, ''),
(293, 2, 'jpg', 272651, '微信图片_20230912142707.jpg', 'data/files/store_2/goods/20230912142924247.jpg', 1694500164, 2, 174, ''),
(294, 2, 'jpg', 296144, '微信图片_20230912142703.jpg', 'data/files/store_2/goods/20230912143000269.jpg', 1694500200, 2, 175, ''),
(295, 2, 'jpg', 289960, '微信图片_20230912142659.jpg', 'data/files/store_2/goods/20230912143030605.jpg', 1694500230, 2, 176, ''),
(296, 2, 'jpg', 311692, '微信图片_20230912142655.jpg', 'data/files/store_2/goods/20230912143056843.jpg', 1694500256, 2, 177, ''),
(298, 2, 'jpg', 322737, '微信图片_20230912142652.jpg', 'data/files/store_2/goods/20230912143158201.jpg', 1694500318, 2, 178, ''),
(299, 2, 'jpg', 253031, '微信图片_20230912142648.jpg', 'data/files/store_2/goods/20230912143228987.jpg', 1694500348, 2, 179, ''),
(300, 2, 'jpg', 218430, '微信图片_20230912142644.jpg', 'data/files/store_2/goods/20230912143259633.jpg', 1694500379, 2, 180, ''),
(301, 2, 'jpg', 242295, '微信图片_20230912142640.jpg', 'data/files/store_2/goods/20230912143337904.jpg', 1694500417, 2, 181, ''),
(302, 2, 'jpg', 263130, '微信图片_20230912142636.jpg', 'data/files/store_2/goods/20230912143407389.jpg', 1694500447, 2, 182, ''),
(303, 2, 'jpg', 273610, '微信图片_20230912142632.jpg', 'data/files/store_2/goods/20230912143442477.jpg', 1694500482, 2, 183, ''),
(304, 2, 'jpg', 255861, '微信图片_20230912142628.jpg', 'data/files/store_2/goods/20230912143514250.jpg', 1694500514, 2, 184, ''),
(305, 2, 'jpg', 256785, '微信图片_20230912142624.jpg', 'data/files/store_2/goods/20230912143550941.jpg', 1694500550, 2, 185, ''),
(306, 2, 'jpg', 312719, '微信图片_20230912142620.jpg', 'data/files/store_2/goods/20230912143628126.jpg', 1694500588, 2, 186, ''),
(308, 2, 'jpg', 286392, '微信图片_20230912142613.jpg', 'data/files/store_2/goods/20230912143732198.jpg', 1694500652, 2, 187, ''),
(309, 2, 'jpg', 300262, '微信图片_20230912142609.jpg', 'data/files/store_2/goods/20230912143808711.jpg', 1694500688, 2, 188, ''),
(310, 2, 'jpg', 296945, '微信图片_20230912142605.jpg', 'data/files/store_2/goods/20230912143843698.jpg', 1694500723, 2, 189, ''),
(311, 2, 'jpg', 313284, '微信图片_20230912142601.jpg', 'data/files/store_2/goods/20230912143959657.jpg', 1694500799, 2, 190, ''),
(312, 2, 'jpg', 294715, '微信图片_20230912142558.jpg', 'data/files/store_2/goods/20230912144031439.jpg', 1694500831, 2, 191, ''),
(313, 2, 'jpg', 312297, '微信图片_20230912142553.jpg', 'data/files/store_2/goods/20230912144100588.jpg', 1694500860, 2, 192, ''),
(314, 2, 'jpg', 225093, '微信图片_20230912142550.jpg', 'data/files/store_2/goods/20230912144214770.jpg', 1694500934, 2, 193, ''),
(315, 2, 'jpg', 210440, '微信图片_20230912142545.jpg', 'data/files/store_2/goods/20230912144246158.jpg', 1694500966, 2, 194, ''),
(316, 2, 'jpg', 230184, '微信图片_20230912142540.jpg', 'data/files/store_2/goods/20230912144315530.jpg', 1694500995, 2, 195, ''),
(317, 2, 'jpg', 230370, '微信图片_20230912142535.jpg', 'data/files/store_2/goods/20230912144358166.jpg', 1694501038, 2, 196, ''),
(318, 2, 'jpg', 196796, '微信图片_20230912142530.jpg', 'data/files/store_2/goods/20230912144433729.jpg', 1694501073, 2, 197, ''),
(319, 2, 'jpg', 230500, '微信图片_20230912142526.jpg', 'data/files/store_2/goods/20230912144511561.jpg', 1694501111, 2, 198, ''),
(320, 2, 'jpg', 361987, '微信图片_20230912142520.jpg', 'data/files/store_2/goods/20230912144613577.jpg', 1694501173, 2, 199, ''),
(321, 2, 'jpg', 294125, '微信图片_20230912142515.jpg', 'data/files/store_2/goods/20230912144652184.jpg', 1694501212, 2, 200, ''),
(322, 2, 'jpg', 238900, '微信图片_20230912142510.jpg', 'data/files/store_2/goods/20230912144723314.jpg', 1694501243, 2, 201, ''),
(323, 2, 'jpg', 261240, '微信图片_20230912142505.jpg', 'data/files/store_2/goods/20230912144755360.jpg', 1694501275, 2, 202, ''),
(324, 2, 'jpg', 319230, '微信图片_20230912142445.jpg', 'data/files/store_2/goods/20230912144828953.jpg', 1694501308, 2, 203, ''),
(325, 2, 'jpg', 298179, '微信图片_20230912142441.jpg', 'data/files/store_2/goods/20230912144908920.jpg', 1694501348, 2, 204, ''),
(326, 2, 'jpg', 288055, '微信图片_20230912142436.jpg', 'data/files/store_2/goods/20230912144939534.jpg', 1694501379, 2, 205, ''),
(327, 2, 'jpg', 330352, '微信图片_20230912142342.jpg', 'data/files/store_2/goods/20230912145005385.jpg', 1694501405, 2, 206, ''),
(328, 2, 'jpg', 238974, '微信图片_20230912151613.jpg', 'data/files/store_2/goods/20230912151927939.jpg', 1694503167, 2, 207, ''),
(329, 2, 'jpg', 224841, '微信图片_20230912151604.jpg', 'data/files/store_2/goods/20230912151944278.jpg', 1694503184, 2, 207, ''),
(330, 2, 'jpg', 284782, '微信图片_20230912151621.jpg', 'data/files/store_2/goods/20230912151945553.jpg', 1694503185, 2, 207, ''),
(331, 2, 'jpg', 243356, '微信图片_20230912151625.jpg', 'data/files/store_2/goods/20230912151945872.jpg', 1694503185, 2, 207, ''),
(332, 2, 'jpg', 234287, '微信图片_20230912151630.jpg', 'data/files/store_2/goods/20230912151945341.jpg', 1694503185, 2, 207, ''),
(333, 2, 'jpg', 238974, '微信图片_20230912151613.jpg', 'data/files/store_2/goods/20230912151946831.jpg', 1694503186, 2, 207, ''),
(334, 2, 'jpg', 289905, '微信图片_20230912151614.jpg', 'data/files/store_2/goods/20230912151946124.jpg', 1694503186, 2, 207, ''),
(335, 2, 'jpg', 237323, '微信图片_20230912160304.jpg', 'data/files/store_2/goods/20230912160417438.jpg', 1694505857, 2, 208, ''),
(336, 2, 'jpg', 261244, '微信图片_20230912160242.jpg', 'data/files/store_2/goods/20230912160429129.jpg', 1694505869, 2, 208, ''),
(337, 2, 'jpg', 257212, '微信图片_20230912160250.jpg', 'data/files/store_2/goods/20230912160429165.jpg', 1694505869, 2, 208, ''),
(338, 2, 'jpg', 237323, '微信图片_20230912160304.jpg', 'data/files/store_2/goods/20230912160429339.jpg', 1694505869, 2, 208, ''),
(339, 2, 'jpg', 343195, '微信图片_20230912160256.jpg', 'data/files/store_2/goods/20230912160430816.jpg', 1694505870, 2, 208, ''),
(340, 2, 'jpg', 342661, '微信图片_20230906135230.jpg', 'data/files/store_2/goods/20230912161934651.jpg', 1694506774, 2, 139, ''),
(341, 2, 'jpg', 428637, '微信图片_202309061352281.jpg', 'data/files/store_2/goods/20230912162013635.jpg', 1694506813, 2, 209, ''),
(342, 2, 'jpg', 393244, '微信图片_202309061352282.jpg', 'data/files/store_2/goods/20230912162045391.jpg', 1694506845, 2, 210, ''),
(343, 2, 'jpg', 250628, '微信图片_202309061352283.jpg', 'data/files/store_2/goods/20230912162114176.jpg', 1694506874, 2, 211, ''),
(344, 2, 'jpg', 237603, '微信图片_202309061352291.jpg', 'data/files/store_2/goods/20230912162146434.jpg', 1694506906, 2, 212, ''),
(345, 2, 'jpg', 274126, '微信图片_202309061352292.jpg', 'data/files/store_2/goods/20230912162215624.jpg', 1694506935, 2, 213, ''),
(346, 2, 'jpg', 359480, '微信图片_202309061352293.jpg', 'data/files/store_2/goods/20230912162244648.jpg', 1694506964, 2, 214, ''),
(347, 2, 'jpg', 375349, '微信图片_202309061352301.jpg', 'data/files/store_2/goods/20230912162313130.jpg', 1694506993, 2, 215, ''),
(348, 2, 'jpg', 318170, '微信图片_202309061352302.jpg', 'data/files/store_2/goods/20230912162339569.jpg', 1694507019, 2, 216, ''),
(349, 2, 'jpg', 410627, '微信图片_202309061352311.jpg', 'data/files/store_2/goods/20230912162406246.jpg', 1694507046, 2, 217, ''),
(350, 2, 'jpg', 252342, '微信图片_202309061352312.jpg', 'data/files/store_2/goods/20230912162435121.jpg', 1694507075, 2, 218, ''),
(351, 2, 'jpg', 290641, '微信图片_202309061352313.jpg', 'data/files/store_2/goods/20230912162500135.jpg', 1694507100, 2, 219, ''),
(352, 2, 'jpg', 336813, '微信图片_202309061352321.jpg', 'data/files/store_2/goods/20230912162528608.jpg', 1694507128, 2, 220, ''),
(353, 2, 'jpg', 287324, '微信图片_202309061352322.jpg', 'data/files/store_2/goods/20230912162554813.jpg', 1694507154, 2, 221, ''),
(354, 2, 'jpg', 207392, '微信图片_20230914083358.jpg', 'data/files/store_2/goods/20230914083605623.jpg', 1694651765, 2, 222, ''),
(355, 2, 'jpg', 246525, '微信图片_20230914083229.jpg', 'data/files/store_2/goods/20230914083619251.jpg', 1694651779, 2, 222, ''),
(356, 2, 'jpg', 246525, '微信图片_20230914083229.jpg', 'data/files/store_2/goods/20230914083628464.jpg', 1694651788, 2, 222, ''),
(357, 2, 'jpg', 207392, '微信图片_20230914083358.jpg', 'data/files/store_2/goods/20230914083629140.jpg', 1694651789, 2, 222, ''),
(358, 2, 'jpg', 260762, '微信图片_20230914083345.jpg', 'data/files/store_2/goods/20230914083629821.jpg', 1694651789, 2, 222, ''),
(359, 2, 'jpg', 384620, '微信图片_20230914083352.jpg', 'data/files/store_2/goods/20230914083630796.jpg', 1694651790, 2, 222, ''),
(360, 2, 'jpg', 448724, '微信图片_20230914083404.jpg', 'data/files/store_2/goods/20230914083822175.jpg', 1694651902, 2, 223, ''),
(361, 2, 'jpg', 331860, '微信图片_20230914083422.jpg', 'data/files/store_2/goods/20230914083834924.jpg', 1694651914, 2, 223, ''),
(362, 2, 'jpg', 448724, '微信图片_20230914083404.jpg', 'data/files/store_2/goods/20230914083844539.jpg', 1694651924, 2, 223, ''),
(363, 2, 'jpg', 346473, '微信图片_20230914083410.jpg', 'data/files/store_2/goods/20230914083844469.jpg', 1694651924, 2, 223, ''),
(364, 2, 'jpg', 331860, '微信图片_20230914083422.jpg', 'data/files/store_2/goods/20230914083844913.jpg', 1694651924, 2, 223, ''),
(365, 2, 'jpg', 433806, '微信图片_20230914083416.jpg', 'data/files/store_2/goods/20230914083845415.jpg', 1694651925, 2, 223, ''),
(366, 0, 'jpg', 280239, '微信图片_20230611091946.jpg', 'data/files/mall/article/20230914092244938.jpg', 1694654564, 1, 5, ''),
(367, 0, 'jpg', 272263, '微信图片_202306110919461.jpg', 'data/files/mall/article/20230914092244478.jpg', 1694654564, 1, 5, ''),
(368, 0, 'jpg', 285849, '微信图片_202306110919463.jpg', 'data/files/mall/article/20230914092244274.jpg', 1694654564, 1, 5, ''),
(369, 0, 'jpg', 304368, '微信图片_202306110919464.jpg', 'data/files/mall/article/20230914092244484.jpg', 1694654564, 1, 5, ''),
(370, 0, 'jpg', 271157, '微信图片_202306110919465.jpg', 'data/files/mall/article/20230914092244294.jpg', 1694654564, 1, 5, ''),
(371, 0, 'jpg', 275546, '微信图片_202306110919466.jpg', 'data/files/mall/article/20230914092244373.jpg', 1694654564, 1, 5, ''),
(372, 0, 'jpg', 298907, '微信图片_202306110919467.jpg', 'data/files/mall/article/20230914092244402.jpg', 1694654564, 1, 5, ''),
(373, 0, 'jpg', 355961, '微信图片_202306110919468.jpg', 'data/files/mall/article/20230914092244927.jpg', 1694654564, 1, 5, ''),
(374, 0, 'jpg', 218269, '微信图片_202306110919469.jpg', 'data/files/mall/article/20230914092244603.jpg', 1694654564, 1, 5, ''),
(375, 0, 'jpg', 346800, '微信图片_202306110919462.jpg', 'data/files/mall/article/20230914092245271.jpg', 1694654565, 1, 5, ''),
(376, 2, 'jpg', 235617, '微信图片_202308221801143.jpg', 'data/files/store_2/goods/20230914093329394.jpg', 1694655209, 2, 224, ''),
(377, 2, 'jpg', 276117, '微信图片_20230914095234.jpg', 'data/files/store_2/goods/20230914102039526.jpg', 1694658039, 2, 224, ''),
(378, 2, 'jpg', 272372, '微信图片_20230914095230.jpg', 'data/files/store_2/goods/20230914102320961.jpg', 1694658200, 2, 225, ''),
(379, 2, 'jpg', 274665, '微信图片_20230914095229_2.jpg', 'data/files/store_2/goods/20230914102402247.jpg', 1694658242, 2, 226, ''),
(380, 2, 'jpg', 162086, '微信图片_20230914095230_1.jpg', 'data/files/store_2/goods/20230914102433103.jpg', 1694658273, 2, 227, ''),
(381, 2, 'jpg', 487740, '微信图片_20230914095212.jpg', 'data/files/store_2/goods/20230914102638598.jpg', 1694658398, 2, 228, ''),
(382, 2, 'jpg', 508943, '微信图片_20230914095231_2.jpg', 'data/files/store_2/goods/20230914102725861.jpg', 1694658445, 2, 229, ''),
(383, 2, 'jpg', 313212, '微信图片_20230914095216_1.jpg', 'data/files/store_2/goods/20230914102813622.jpg', 1694658493, 2, 230, ''),
(384, 2, 'jpg', 215369, '微信图片_20230914095232.jpg', 'data/files/store_2/goods/20230914102902794.jpg', 1694658542, 2, 231, ''),
(386, 2, 'jpg', 347568, '微信图片_20230914095232_1.jpg', 'data/files/store_2/goods/20230914103010480.jpg', 1694658610, 2, 232, ''),
(387, 2, 'jpg', 438237, '微信图片_20230914095215_2.jpg', 'data/files/store_2/goods/20230914103049920.jpg', 1694658649, 2, 233, ''),
(388, 2, 'jpg', 426992, '微信图片_20230914095231_1.jpg', 'data/files/store_2/goods/20230914103121428.jpg', 1694658681, 2, 234, ''),
(389, 2, 'jpg', 355679, '微信图片_20230914095216_2.jpg', 'data/files/store_2/goods/20230914103200942.jpg', 1694658720, 2, 235, ''),
(390, 2, 'jpg', 377999, '微信图片_20230914095217_1.jpg', 'data/files/store_2/goods/20230914103237717.jpg', 1694658757, 2, 236, ''),
(391, 2, 'jpg', 379928, '微信图片_20230914095232_2.jpg', 'data/files/store_2/goods/20230914103335144.jpg', 1694658815, 2, 237, ''),
(392, 2, 'jpg', 227420, '微信图片_20230914095219.jpg', 'data/files/store_2/goods/20230914103414143.jpg', 1694658854, 2, 238, ''),
(393, 2, 'jpg', 269349, '微信图片_20230914095228_2.jpg', 'data/files/store_2/goods/20230914103455984.jpg', 1694658895, 2, 239, ''),
(394, 2, 'jpg', 280799, '微信图片_20230914095225.jpg', 'data/files/store_2/goods/20230914103600764.jpg', 1694658960, 2, 240, ''),
(395, 2, 'jpg', 325626, '微信图片_20230914095225_1.jpg', 'data/files/store_2/goods/20230914103636377.jpg', 1694658996, 2, 241, ''),
(396, 2, 'jpg', 306875, '微信图片_20230914095225_2.jpg', 'data/files/store_2/goods/20230914103718483.jpg', 1694659038, 2, 242, ''),
(397, 2, 'jpg', 249232, '微信图片_20230914095226_1.jpg', 'data/files/store_2/goods/20230914103813891.jpg', 1694659093, 2, 243, ''),
(398, 2, 'jpg', 264841, '微信图片_20230914095215_1.jpg', 'data/files/store_2/goods/20230914103912121.jpg', 1694659152, 2, 244, ''),
(399, 2, 'jpg', 245088, '微信图片_20230914095217_2.jpg', 'data/files/store_2/goods/20230914104157577.jpg', 1694659317, 2, 245, ''),
(400, 2, 'jpg', 259617, '微信图片_20230914095235_1.jpg', 'data/files/store_2/goods/20230914104231238.jpg', 1694659351, 2, 246, ''),
(401, 2, 'jpg', 238719, '微信图片_20230914095235_2.jpg', 'data/files/store_2/goods/20230914104307736.jpg', 1694659387, 2, 247, ''),
(402, 2, 'jpg', 313844, '微信图片_20230914095236.jpg', 'data/files/store_2/goods/20230914104336674.jpg', 1694659416, 2, 248, ''),
(403, 2, 'jpg', 258116, '微信图片_20230914095212_2.jpg', 'data/files/store_2/goods/20230914104533945.jpg', 1694659533, 2, 249, ''),
(404, 2, 'jpg', 249664, '微信图片_20230914095213.jpg', 'data/files/store_2/goods/20230914104612930.jpg', 1694659572, 2, 250, ''),
(405, 2, 'jpg', 324454, '微信图片_20230914095213_1.jpg', 'data/files/store_2/goods/20230914104637823.jpg', 1694659597, 2, 251, ''),
(406, 2, 'jpg', 269178, '微信图片_20230914095214_2.jpg', 'data/files/store_2/goods/20230914104714989.jpg', 1694659634, 2, 252, ''),
(407, 2, 'jpg', 213868, '微信图片_20230914095214.jpg', 'data/files/store_2/goods/20230914104742838.jpg', 1694659662, 2, 253, ''),
(408, 2, 'jpg', 263449, '微信图片_20230914095213_2.jpg', 'data/files/store_2/goods/20230914104808586.jpg', 1694659688, 2, 254, ''),
(409, 2, 'jpg', 329465, '微信图片_20230914105629.jpg', 'data/files/store_2/goods/20230914105756410.jpg', 1694660276, 2, 255, ''),
(410, 2, 'jpg', 284322, '微信图片_20230914105640.jpg', 'data/files/store_2/goods/20230914105830442.jpg', 1694660310, 2, 256, ''),
(411, 2, 'jpg', 259699, '微信图片_20230914105648.jpg', 'data/files/store_2/goods/20230914105859583.jpg', 1694660339, 2, 257, ''),
(412, 2, 'jpg', 272993, '微信图片_20230914105654.jpg', 'data/files/store_2/goods/20230914105928362.jpg', 1694660368, 2, 258, ''),
(413, 0, 'jpg', 315637, '气球拱门.jpg', 'data/files/mall/article/20230914110853926.jpg', 1694660933, 1, 6, ''),
(414, 0, 'jpg', 210281, '微信图片_20230609212558.jpg', 'data/files/mall/article/20230914110853380.jpg', 1694660933, 1, 6, ''),
(415, 0, 'jpg', 261741, '微信图片_20230609212606.jpg', 'data/files/mall/article/20230914110853745.jpg', 1694660933, 1, 6, ''),
(416, 0, 'jpg', 197082, '微信图片_20230609212615.jpg', 'data/files/mall/article/20230914110853789.jpg', 1694660933, 1, 6, ''),
(417, 0, 'jpg', 313579, '微信图片_20230609212622.jpg', 'data/files/mall/article/20230914110853523.jpg', 1694660933, 1, 6, ''),
(418, 0, 'jpg', 250508, '微信图片_20230609212634.jpg', 'data/files/mall/article/20230914110853737.jpg', 1694660933, 1, 6, ''),
(419, 0, 'jpg', 232939, '微信图片_20230609212647.jpg', 'data/files/mall/article/20230914110854526.jpg', 1694660934, 1, 6, ''),
(420, 0, 'jpg', 205135, '微信图片_20230609212716.jpg', 'data/files/mall/article/20230914110854666.jpg', 1694660934, 1, 6, ''),
(421, 0, 'jpg', 325580, '微信图片_20230609212721.jpg', 'data/files/mall/article/20230914110854493.jpg', 1694660934, 1, 6, ''),
(422, 0, 'jpg', 194115, '微信图片_20230609212727.jpg', 'data/files/mall/article/20230914110854885.jpg', 1694660934, 1, 6, ''),
(423, 0, 'jpg', 250508, '微信图片_20230609212733.jpg', 'data/files/mall/article/20230914110854938.jpg', 1694660934, 1, 6, ''),
(424, 0, 'jpg', 205135, '微信图片_20230609212748.jpg', 'data/files/mall/article/20230914110854952.jpg', 1694660934, 1, 6, ''),
(425, 0, 'jpg', 343990, '气球拱门.jpg', 'data/files/mall/article/20230914111101649.jpg', 1694661061, 1, 7, ''),
(426, 0, 'jpg', 317463, '微信图片_20230611093036.jpg', 'data/files/mall/article/20230914111101112.jpg', 1694661061, 1, 7, ''),
(427, 0, 'jpg', 353938, '微信图片_202306110930361.jpg', 'data/files/mall/article/20230914111101934.jpg', 1694661061, 1, 7, ''),
(428, 0, 'jpg', 352765, '微信图片_202306110930362.jpg', 'data/files/mall/article/20230914111102621.jpg', 1694661062, 1, 7, ''),
(429, 0, 'jpg', 363429, '微信图片_202306110930363.jpg', 'data/files/mall/article/20230914111102904.jpg', 1694661062, 1, 7, ''),
(430, 0, 'jpg', 365496, '微信图片_202306110930364.jpg', 'data/files/mall/article/20230914111102726.jpg', 1694661062, 1, 7, ''),
(431, 0, 'jpg', 361030, '微信图片_202306110930365.jpg', 'data/files/mall/article/20230914111102628.jpg', 1694661062, 1, 7, ''),
(432, 0, 'jpg', 343990, '微信图片_202306110930366.jpg', 'data/files/mall/article/20230914111102253.jpg', 1694661062, 1, 7, ''),
(433, 0, 'jpg', 166302, '微信图片_20230914111459.jpg', 'data/files/mall/article/20230914111606613.jpg', 1694661366, 1, 8, ''),
(434, 0, 'jpg', 216548, '微信图片_20230914111517.jpg', 'data/files/mall/article/20230914111606175.jpg', 1694661366, 1, 8, ''),
(435, 0, 'jpg', 207145, '微信图片_20230914111522.jpg', 'data/files/mall/article/20230914111606743.jpg', 1694661366, 1, 8, ''),
(436, 0, 'jpg', 238427, '微信图片_20230914111526.jpg', 'data/files/mall/article/20230914111606300.jpg', 1694661366, 1, 8, ''),
(437, 0, 'jpg', 390287, '微信图片_20230914111421.jpg', 'data/files/mall/article/20230914111830981.jpg', 1694661510, 1, 9, ''),
(438, 0, 'jpg', 382527, '微信图片_20230914111443.jpg', 'data/files/mall/article/20230914111830757.jpg', 1694661510, 1, 9, ''),
(439, 0, 'jpg', 419689, '微信图片_20230914111448.jpg', 'data/files/mall/article/20230914111831387.jpg', 1694661511, 1, 9, ''),
(440, 0, 'jpg', 427256, '微信图片_20230914111452.jpg', 'data/files/mall/article/20230914111831494.jpg', 1694661511, 1, 9, ''),
(441, 0, 'jpg', 268556, '微信图片_20230609212801.jpg', 'data/files/mall/article/20230914112031501.jpg', 1694661631, 1, 10, ''),
(442, 0, 'jpg', 328849, '微信图片_20230609212826.jpg', 'data/files/mall/article/20230914112031581.jpg', 1694661631, 1, 10, ''),
(443, 0, 'jpg', 329338, '微信图片_20230609212829.jpg', 'data/files/mall/article/20230914112031340.jpg', 1694661631, 1, 10, ''),
(444, 0, 'jpg', 291414, '微信图片_20230609212833.jpg', 'data/files/mall/article/20230914112031876.jpg', 1694661631, 1, 10, ''),
(446, 0, 'jpg', 514662, '微信图片_20230609212839.jpg', 'data/files/mall/article/20230914112236102.jpg', 1694661756, 1, 11, ''),
(447, 0, 'jpg', 276711, '微信图片_20230609212853.jpg', 'data/files/mall/article/20230914112236492.jpg', 1694661756, 1, 11, ''),
(448, 0, 'jpg', 321343, '微信图片_20230609212901.jpg', 'data/files/mall/article/20230914112236331.jpg', 1694661756, 1, 11, ''),
(449, 0, 'jpg', 276012, '微信图片_20230609212907.jpg', 'data/files/mall/article/20230914112236737.jpg', 1694661756, 1, 11, ''),
(450, 0, 'jpg', 268212, '微信图片_20230609212910.jpg', 'data/files/mall/article/20230914112236405.jpg', 1694661756, 1, 11, ''),
(451, 0, 'jpg', 258743, '微信图片_20230609212921.jpg', 'data/files/mall/article/20230914112236177.jpg', 1694661756, 1, 11, ''),
(452, 0, 'jpg', 466866, '微信图片_20230611091906.jpg', 'data/files/mall/article/20230914112401500.jpg', 1694661841, 1, 12, ''),
(453, 0, 'jpg', 398982, '微信图片_202306110919061.jpg', 'data/files/mall/article/20230914112401648.jpg', 1694661841, 1, 12, ''),
(454, 0, 'jpg', 405473, '微信图片_202306110919062.jpg', 'data/files/mall/article/20230914112401625.jpg', 1694661841, 1, 12, ''),
(455, 0, 'jpg', 335556, '微信图片_202306110919063.jpg', 'data/files/mall/article/20230914112401475.jpg', 1694661841, 1, 12, ''),
(456, 0, 'jpg', 475738, '微信图片_202306110919064.jpg', 'data/files/mall/article/20230914112401401.jpg', 1694661841, 1, 12, ''),
(457, 0, 'jpg', 379887, '微信图片_202306110919065.jpg', 'data/files/mall/article/20230914112401245.jpg', 1694661841, 1, 12, ''),
(458, 0, 'jpg', 294103, '微信图片_202306110919066.jpg', 'data/files/mall/article/20230914112402109.jpg', 1694661842, 1, 12, ''),
(459, 0, 'jpg', 372332, '微信图片_202306110919067.jpg', 'data/files/mall/article/20230914112402123.jpg', 1694661842, 1, 12, ''),
(460, 0, 'jpg', 428083, '微信图片_202306110919068.jpg', 'data/files/mall/article/20230914112402586.jpg', 1694661842, 1, 12, ''),
(461, 0, 'jpg', 399478, '微信图片_202306110919069.jpg', 'data/files/mall/article/20230914112402302.jpg', 1694661842, 1, 12, ''),
(462, 0, 'jpg', 482724, '微信图片_2023061109190610.jpg', 'data/files/mall/article/20230914112402394.jpg', 1694661842, 1, 12, ''),
(463, 0, 'jpg', 400538, '微信图片_2023061109190611.jpg', 'data/files/mall/article/20230914112402807.jpg', 1694661842, 1, 12, ''),
(464, 0, 'jpg', 473101, '微信图片_2023061109190612.jpg', 'data/files/mall/article/20230914112402544.jpg', 1694661842, 1, 12, ''),
(465, 0, 'jpg', 427733, '微信图片_2023061109190613.jpg', 'data/files/mall/article/20230914112402864.jpg', 1694661842, 1, 12, ''),
(466, 0, 'jpg', 316492, '微信图片_2023061109190614.jpg', 'data/files/mall/article/20230914112402761.jpg', 1694661842, 1, 12, ''),
(467, 0, 'jpg', 347057, '微信图片_2023061109190615.jpg', 'data/files/mall/article/20230914112402293.jpg', 1694661842, 1, 12, ''),
(468, 0, 'jpg', 362895, '微信图片_2023061109190617.jpg', 'data/files/mall/article/20230914112402168.jpg', 1694661842, 1, 12, ''),
(469, 0, 'jpg', 375532, '微信图片_2023061109190618.jpg', 'data/files/mall/article/20230914112402774.jpg', 1694661842, 1, 12, ''),
(470, 0, 'jpg', 316935, '微信图片_2023061109190619.jpg', 'data/files/mall/article/20230914112402950.jpg', 1694661842, 1, 12, ''),
(471, 0, 'jpg', 343452, '微信图片_2023061109190620.jpg', 'data/files/mall/article/20230914112403131.jpg', 1694661843, 1, 12, ''),
(472, 0, 'jpg', 322548, '微信图片_2023061109190621.jpg', 'data/files/mall/article/20230914112403407.jpg', 1694661843, 1, 12, ''),
(473, 0, 'jpg', 332218, '微信图片_2023061109190622.jpg', 'data/files/mall/article/20230914112403540.jpg', 1694661843, 1, 12, ''),
(474, 0, 'jpg', 354685, '微信图片_2023061109190623.jpg', 'data/files/mall/article/20230914112403877.jpg', 1694661843, 1, 12, ''),
(475, 0, 'jpg', 370662, '微信图片_2023061109190624.jpg', 'data/files/mall/article/20230914112403390.jpg', 1694661843, 1, 12, ''),
(476, 0, 'jpg', 339185, '微信图片_2023061109190616.jpg', 'data/files/mall/article/20230914112403148.jpg', 1694661843, 1, 12, ''),
(477, 0, 'jpg', 257920, '微信图片_20230822162406.jpg', 'data/files/mall/article/20230914112631977.jpg', 1694661991, 1, 13, ''),
(478, 0, 'jpg', 427459, '微信图片_20230822162424.jpg', 'data/files/mall/article/20230914112631835.jpg', 1694661991, 1, 13, ''),
(479, 0, 'jpg', 363517, '微信图片_20230822162440.jpg', 'data/files/mall/article/20230914112631722.jpg', 1694661991, 1, 13, ''),
(480, 0, 'jpg', 266293, '微信图片_20230822162447.jpg', 'data/files/mall/article/20230914112631227.jpg', 1694661991, 1, 13, ''),
(481, 0, 'jpg', 258480, '微信图片_20230822162453.jpg', 'data/files/mall/article/20230914112631578.jpg', 1694661991, 1, 13, ''),
(482, 0, 'jpg', 372220, '微信图片_20230822162459.jpg', 'data/files/mall/article/20230914112631633.jpg', 1694661991, 1, 13, ''),
(483, 0, 'jpg', 369361, '微信图片_20230822162504.jpg', 'data/files/mall/article/20230914112631182.jpg', 1694661991, 1, 13, ''),
(484, 0, 'jpg', 344591, '微信图片_20230822162431.jpg', 'data/files/mall/article/20230914112632849.jpg', 1694661992, 1, 13, ''),
(494, 2, 'jpg', 213557, '微信图片_20230916094121.jpg', 'data/files/store_2/goods/20230916094227669.jpg', 1694828547, 2, 266, ''),
(486, 2, 'jpg', 46799, '白掌8元.jpg', 'data/files/store_2/goods/20230915105311185.jpg', 1694746391, 2, 260, ''),
(493, 2, 'jpg', 34628, '天堂鸟12元.jpg', 'data/files/store_2/goods/20230915110305785.jpg', 1694746985, 2, 261, ''),
(488, 2, 'png', 493820, '吉利红8元.png', 'data/files/store_2/goods/20230915105454461.png', 1694746494, 2, 262, ''),
(489, 2, 'jpg', 60304, '如意皇后8元.jpg', 'data/files/store_2/goods/20230915105637425.jpg', 1694746597, 2, 263, ''),
(490, 2, 'jpg', 287563, '彩叶芋10元.jpg', 'data/files/store_2/goods/20230915105738522.jpg', 1694746658, 2, 264, ''),
(491, 2, 'png', 145264, '芦荟12元.png', 'data/files/store_2/goods/20230915105831915.png', 1694746711, 2, 265, ''),
(492, 2, 'jpg', 276816, '小绿萝4元.jpg', 'data/files/store_2/goods/20230915110200190.jpg', 1694746920, 2, 259, ''),
(495, 2, 'jpg', 342782, '微信图片_20230923102030.jpg', 'data/files/store_2/goods/20230923113140304.jpg', 1695439900, 2, 267, ''),
(496, 2, 'jpg', 363203, '粉雪山.jpg', 'data/files/store_2/goods/20230923141913673.jpg', 1695449953, 2, 268, ''),
(497, 2, 'jpg', 229884, '微信图片_20230923152559.jpg', 'data/files/store_2/goods/20230923152648845.jpg', 1695454008, 2, 268, ''),
(498, 2, 'jpg', 413953, '卡布-多头玫.jpg', 'data/files/store_2/goods/20230923161922324.jpg', 1695457162, 2, 269, ''),
(499, 2, 'jpg', 371682, '卡布-多头玫.jpg', 'data/files/store_2/goods/20230923162125172.jpg', 1695457285, 2, 269, ''),
(500, 2, 'jpg', 353394, '卡布-多头玫1.jpg', 'data/files/store_2/goods/20230923162125287.jpg', 1695457285, 2, 269, ''),
(501, 2, 'jpg', 469015, '卡布-多头玫2.jpg', 'data/files/store_2/goods/20230923162125499.jpg', 1695457285, 2, 269, ''),
(502, 2, 'jpg', 371682, '卡布-多头玫.jpg', 'data/files/store_2/goods/20230923162203793.jpg', 1695457323, 2, 269, ''),
(503, 2, 'jpg', 1014538, '人民币-向日葵.jpg', 'data/files/store_2/goods/20230925162814523.jpg', 1695630494, 2, 270, ''),
(504, 2, 'jpg', 293663, '6-1.jpg', 'data/files/store_2/goods/20230925163616972.jpg', 1695630976, 2, 271, ''),
(505, 2, 'jpg', 298698, '6-2.jpg', 'data/files/store_2/goods/20230925163622707.jpg', 1695630982, 2, 271, ''),
(506, 2, 'jpg', 313486, '3-1.jpg', 'data/files/store_2/goods/20230925163723746.jpg', 1695631043, 2, 272, ''),
(507, 2, 'jpg', 313486, '3-1.jpg', 'data/files/store_2/goods/20230925163734743.jpg', 1695631054, 2, 272, ''),
(508, 2, 'jpg', 320808, '3-2.jpg', 'data/files/store_2/goods/20230925163734516.jpg', 1695631054, 2, 272, ''),
(509, 2, 'jpg', 527775, '3-3.jpg', 'data/files/store_2/goods/20230925163735953.jpg', 1695631055, 2, 272, ''),
(510, 2, 'jpg', 293663, '6-1.jpg', 'data/files/store_2/goods/20230925164114535.jpg', 1695631274, 2, 271, ''),
(511, 2, 'jpg', 298698, '6-2.jpg', 'data/files/store_2/goods/20230925164114600.jpg', 1695631274, 2, 271, ''),
(512, 2, 'png', 323162, '微信图片_20230926104621.png', 'data/files/store_2/goods/20230926110212183.png', 1695697332, 2, 276, ''),
(513, 2, 'jpg', 931947, '微信图片_20230926104422.jpg', 'data/files/store_2/goods/20230926110306719.jpg', 1695697386, 2, 277, ''),
(514, 2, 'jpg', 1014538, '人民币-向日葵.jpg', 'data/files/store_2/goods/20230926110342616.jpg', 1695697422, 2, 278, ''),
(515, 2, 'jpg', 756586, '微信图片_20230926104421.jpg', 'data/files/store_2/goods/20230926110432535.jpg', 1695697472, 2, 279, ''),
(516, 2, 'jpg', 392899, '微信图片_20230926110701.jpg', 'data/files/store_2/goods/20230926110744947.jpg', 1695697664, 2, 275, ''),
(517, 2, 'jpg', 202923, '微信图片_20230926104328.jpg', 'data/files/store_2/goods/20230926110807430.jpg', 1695697687, 2, 273, ''),
(518, 2, 'jpg', 730389, '微信图片_20230926104355.jpg', 'data/files/store_2/goods/20230926111253309.jpg', 1695697973, 2, 280, ''),
(519, 2, 'png', 728236, '微信图片_20230926105506.png', 'data/files/store_2/goods/20230926111340335.png', 1695698020, 2, 281, ''),
(520, 2, 'jpg', 608936, '微信图片_20230926111540.jpg', 'data/files/store_2/goods/20230926111624688.jpg', 1695698184, 2, 282, ''),
(521, 2, 'jpg', 421569, '微信图片_20231002093345.jpg', 'data/files/store_2/goods/20231002093419177.jpg', 1696210459, 2, 283, ''),
(522, 2, 'jpg', 421569, '微信图片_20231002093345.jpg', 'data/files/store_2/goods/20231002093426943.jpg', 1696210466, 2, 283, ''),
(523, 2, 'jpg', 295504, '微信图片_20231002093736.jpg', 'data/files/store_2/goods/20231002093817782.jpg', 1696210697, 2, 284, ''),
(524, 2, 'jpg', 196764, '微信图片_20231002093712.jpg', 'data/files/store_2/goods/20231002093823722.jpg', 1696210703, 2, 284, ''),
(525, 2, 'jpg', 295504, '微信图片_20231002093736.jpg', 'data/files/store_2/goods/20231002093823338.jpg', 1696210703, 2, 284, ''),
(526, 2, 'jpg', 246262, '微信图片_20231002093741.jpg', 'data/files/store_2/goods/20231002093823179.jpg', 1696210703, 2, 284, ''),
(527, 2, 'jpg', 271836, '微信图片_20231002093745.jpg', 'data/files/store_2/goods/20231002093823816.jpg', 1696210703, 2, 284, ''),
(529, 2, 'jpg', 196764, '微信图片_20231002093712.jpg', 'data/files/store_2/goods/20231002093927585.jpg', 1696210767, 2, 285, ''),
(530, 2, 'jpg', 196764, '微信图片_20231002093712.jpg', 'data/files/store_2/goods/20231002093932342.jpg', 1696210772, 2, 285, ''),
(531, 2, 'jpg', 295504, '微信图片_20231002093736.jpg', 'data/files/store_2/goods/20231002093932111.jpg', 1696210772, 2, 285, ''),
(532, 2, 'jpg', 246262, '微信图片_20231002093741.jpg', 'data/files/store_2/goods/20231002093932163.jpg', 1696210772, 2, 285, ''),
(533, 2, 'jpg', 271836, '微信图片_20231002093745.jpg', 'data/files/store_2/goods/20231002093932695.jpg', 1696210772, 2, 285, ''),
(534, 2, 'jpg', 246262, '微信图片_20231002093741.jpg', 'data/files/store_2/goods/20231002094004430.jpg', 1696210804, 2, 286, ''),
(535, 2, 'jpg', 196764, '微信图片_20231002093712.jpg', 'data/files/store_2/goods/20231002094107570.jpg', 1696210867, 2, 286, ''),
(536, 2, 'jpg', 295504, '微信图片_20231002093736.jpg', 'data/files/store_2/goods/20231002094108910.jpg', 1696210868, 2, 286, ''),
(537, 2, 'jpg', 246262, '微信图片_20231002093741.jpg', 'data/files/store_2/goods/20231002094108662.jpg', 1696210868, 2, 286, ''),
(538, 2, 'jpg', 271836, '微信图片_20231002093745.jpg', 'data/files/store_2/goods/20231002094108933.jpg', 1696210868, 2, 286, ''),
(539, 2, 'jpg', 271836, '微信图片_20231002093745.jpg', 'data/files/store_2/goods/20231002094137360.jpg', 1696210897, 2, 287, ''),
(540, 2, 'jpg', 349304, '1-1.jpg', 'data/files/store_2/goods/20231002095101221.jpg', 1696211461, 2, 274, ''),
(541, 2, 'jpg', 349304, '1-1.jpg', 'data/files/store_2/goods/20231002095106944.jpg', 1696211466, 2, 274, ''),
(542, 2, 'jpg', 541677, '1-2.jpg', 'data/files/store_2/goods/20231002095106220.jpg', 1696211466, 2, 274, ''),
(543, 2, 'jpg', 393839, '1-3.jpg', 'data/files/store_2/goods/20231002095106951.jpg', 1696211466, 2, 274, ''),
(544, 0, 'jpg', 503501, '微信图片_20231002095348.jpg', 'data/files/mall/article/20231002095437781.jpg', 1696211677, 1, 14, ''),
(545, 0, 'jpg', 490939, '微信图片_20231002095313.jpg', 'data/files/mall/article/20231002095437557.jpg', 1696211677, 1, 14, ''),
(546, 0, 'jpg', 509070, '微信图片_20231002095353.jpg', 'data/files/mall/article/20231002095437730.jpg', 1696211677, 1, 14, '');
INSERT INTO `swd_uploaded_file` (`file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id`, `link_url`) VALUES
(547, 0, 'jpg', 619847, '微信图片_20231002095404.jpg', 'data/files/mall/article/20231002095437841.jpg', 1696211677, 1, 14, ''),
(548, 0, 'jpg', 609195, '微信图片_20231002095411.jpg', 'data/files/mall/article/20231002095437639.jpg', 1696211677, 1, 14, ''),
(549, 0, 'jpg', 403130, '微信图片_20231002095420.jpg', 'data/files/mall/article/20231002095437455.jpg', 1696211677, 1, 14, ''),
(550, 0, 'jpg', 319326, '微信图片_20231002095515.jpg', 'data/files/mall/article/20231002095623832.jpg', 1696211783, 1, 15, ''),
(551, 0, 'jpg', 383218, '微信图片_20231002095531.jpg', 'data/files/mall/article/20231002095623836.jpg', 1696211783, 1, 15, ''),
(552, 0, 'jpg', 254326, '微信图片_20231002095535.jpg', 'data/files/mall/article/20231002095623295.jpg', 1696211783, 1, 15, ''),
(553, 0, 'jpg', 340233, '微信图片_20231002095539.jpg', 'data/files/mall/article/20231002095623997.jpg', 1696211783, 1, 15, ''),
(554, 0, 'png', 323079, '微信图片_20231002095606.png', 'data/files/mall/article/20231002095623282.png', 1696211783, 1, 15, ''),
(555, 2, 'jpg', 349526, '微信图片_20231002111655.jpg', 'data/files/store_2/goods/20231002111859825.jpg', 1696216739, 2, 288, ''),
(556, 2, 'jpg', 345488, '微信图片_20231002145614.jpg', 'data/files/store_2/goods/20231002145641403.jpg', 1696229801, 2, 298, ''),
(557, 2, 'jpg', 349526, '微信图片_20231002111655.jpg', 'data/files/store_2/goods/20231002145822791.jpg', 1696229902, 2, 288, ''),
(558, 2, 'jpg', 250466, '微信图片_20231002150950.jpg', 'data/files/store_2/goods/20231002151048828.jpg', 1696230648, 2, 289, ''),
(559, 2, 'jpg', 250466, '微信图片_20231002150950.jpg', 'data/files/store_2/goods/20231002151055691.jpg', 1696230655, 2, 289, ''),
(560, 2, 'jpg', 391503, '微信图片_20230926104423.jpg', 'data/files/store_2/goods/20231002151740424.jpg', 1696231060, 2, 303, ''),
(561, 2, 'jpg', 391503, '微信图片_20230926104423.jpg', 'data/files/store_2/goods/20231002151751771.jpg', 1696231071, 2, 303, ''),
(563, 2, 'jpg', 380267, '微信图片_20231002152440.jpg', 'data/files/store_2/goods/20231002160734221.jpg', 1696234054, 2, 291, ''),
(564, 2, 'jpg', 337763, '微信图片_20231002161101.jpg', 'data/files/store_2/goods/20231002161348957.jpg', 1696234428, 2, 306, ''),
(565, 2, 'jpg', 399768, '52朵粉雪杉抱抱桶.jpg', 'data/files/store_2/goods/20231003173031903.jpg', 1696325431, 2, 311, ''),
(566, 2, 'jpg', 399768, '52朵粉雪杉抱抱桶.jpg', 'data/files/store_2/goods/20231003173037848.jpg', 1696325437, 2, 311, ''),
(567, 2, 'jpg', 423827, '微信图片_20231003172609.jpg', 'data/files/store_2/goods/20231003173055801.jpg', 1696325455, 2, 310, ''),
(568, 2, 'jpg', 388489, '52朵曼塔乌梅子酱.jpg', 'data/files/store_2/goods/20231003173225223.jpg', 1696325545, 2, 312, ''),
(569, 2, 'jpg', 388489, '52朵曼塔乌梅子酱.jpg', 'data/files/store_2/goods/20231003173230569.jpg', 1696325550, 2, 312, ''),
(570, 2, 'jpg', 423827, '微信图片_20231003172609.jpg', 'data/files/store_2/goods/20231003174421205.jpg', 1696326261, 2, 310, ''),
(571, 2, 'jpg', 549410, '微信图片_20231007120738.jpg', 'data/files/store_2/goods/20231007120822127.jpg', 1696651702, 2, 313, ''),
(572, 2, 'jpg', 549410, '微信图片_20231007120738.jpg', 'data/files/store_2/goods/20231007120828482.jpg', 1696651708, 2, 313, ''),
(573, 2, 'jpg', 421118, '微信图片_20231008100125.jpg', 'data/files/store_2/goods/20231008100208597.jpg', 1696730528, 2, 309, ''),
(574, 2, 'jpg', 426813, '微信图片_20231008095918.jpg', 'data/files/store_2/goods/20231008100436875.jpg', 1696730676, 2, 308, ''),
(575, 2, 'jpg', 426813, '微信图片_20231008095918.jpg', 'data/files/store_2/goods/20231008100442728.jpg', 1696730682, 2, 308, ''),
(577, 2, 'jpg', 337763, '微信图片_20231002161101.jpg', 'data/files/store_2/goods/20231008115844311.jpg', 1696737524, 2, 306, ''),
(578, 2, 'jpg', 328341, '微信图片_20231002101652.jpg', 'data/files/store_2/goods/20231008120053890.jpg', 1696737653, 2, 298, ''),
(579, 2, 'jpg', 404146, '微信图片_20231009091213.jpg', 'data/files/store_2/goods/20231009091240625.jpg', 1696813960, 2, 314, ''),
(580, 2, 'jpg', 404146, '微信图片_20231009091213.jpg', 'data/files/store_2/goods/20231009091251563.jpg', 1696813971, 2, 314, ''),
(581, 2, 'jpg', 355410, '1.jpg', 'data/files/store_2/goods/20231010095722520.jpg', 1696903042, 2, 304, ''),
(582, 2, 'jpg', 355410, '1.jpg', 'data/files/store_2/goods/20231010095730872.jpg', 1696903050, 2, 304, ''),
(583, 2, 'jpg', 366459, '1-1.jpg', 'data/files/store_2/goods/20231010095730461.jpg', 1696903050, 2, 304, ''),
(584, 2, 'jpg', 351051, '1-3.jpg', 'data/files/store_2/goods/20231010095730811.jpg', 1696903050, 2, 304, ''),
(585, 2, 'jpg', 392422, '1-2.jpg', 'data/files/store_2/goods/20231010095731894.jpg', 1696903051, 2, 304, ''),
(586, 2, 'jpg', 399768, '52朵粉雪杉抱抱桶.jpg', 'data/files/store_2/goods/20231010122846565.jpg', 1696912126, 2, 315, ''),
(587, 2, 'jpg', 312692, '4.jpg', 'data/files/store_2/goods/20231010172255386.jpg', 1696929775, 2, 316, ''),
(588, 2, 'jpg', 276710, '微信图片_20231015161422.jpg', 'data/files/store_2/goods/20231015161452348.jpg', 1697357692, 2, 317, ''),
(589, 2, 'jpg', 274603, '微信图片_20231015161436.jpg', 'data/files/store_2/goods/20231015161614998.jpg', 1697357774, 2, 318, ''),
(590, 2, 'jpg', 255958, '微信图片_20231016122226.jpg', 'data/files/store_2/goods/20231016122256634.jpg', 1697430176, 2, 319, ''),
(591, 2, 'jpg', 255958, '微信图片_20231016122226.jpg', 'data/files/store_2/goods/20231016122307236.jpg', 1697430187, 2, 319, ''),
(592, 2, 'jpg', 418130, '微信图片_20231019085215.jpg', 'data/files/store_2/goods/20231019085245917.jpg', 1697676765, 2, 323, ''),
(593, 2, 'jpg', 418130, '微信图片_20231019085215.jpg', 'data/files/store_2/goods/20231019085253391.jpg', 1697676773, 2, 323, ''),
(594, 2, 'jpg', 249150, '99朵混搭.jpg', 'data/files/store_2/goods/20231019095337390.jpg', 1697680417, 2, 324, ''),
(595, 2, 'jpg', 249150, '99朵混搭.jpg', 'data/files/store_2/goods/20231019095344937.jpg', 1697680424, 2, 324, ''),
(596, 2, 'jpg', 245209, '微信图片_20231019163305.jpg', 'data/files/store_2/goods/20231019163506594.jpg', 1697704506, 2, 327, ''),
(597, 2, 'jpg', 300330, '微信图片_20231020094752.jpg', 'data/files/store_2/goods/20231020094843941.jpg', 1697766523, 2, 325, ''),
(598, 2, 'jpg', 592281, '微信图片_20231020163345.jpg', 'data/files/store_2/goods/20231020163455536.jpg', 1697790895, 2, 329, ''),
(599, 2, 'jpg', 592281, '微信图片_20231020163345.jpg', 'data/files/store_2/goods/20231020163500439.jpg', 1697790900, 2, 329, ''),
(600, 2, 'jpg', 444976, '微信图片_20231020163430.jpg', 'data/files/store_2/goods/20231020163500286.jpg', 1697790901, 2, 329, ''),
(601, 2, 'jpg', 526452, '微信图片_20231020163435.jpg', 'data/files/store_2/goods/20231020163501253.jpg', 1697790901, 2, 329, ''),
(602, 2, 'jpg', 374949, '微信图片_20231020163830.jpg', 'data/files/store_2/goods/20231020163933407.jpg', 1697791173, 2, 330, ''),
(603, 2, 'jpg', 374949, '微信图片_20231020163830.jpg', 'data/files/store_2/goods/20231020163940373.jpg', 1697791180, 2, 330, ''),
(625, 2, 'jpg', 282522, '微信图片_20231104110121.jpg', 'data/files/store_2/goods/20231104110206212.jpg', 1699066926, 2, 331, ''),
(605, 2, 'jpg', 228960, '微信图片_20231024092814.jpg', 'data/files/store_2/goods/20231024093016180.jpg', 1698111016, 2, 332, ''),
(626, 2, 'jpg', 340871, '微信图片_20231104110129.jpg', 'data/files/store_2/goods/20231104110223787.jpg', 1699066943, 2, 320, ''),
(607, 2, 'jpg', 364138, '微信图片_20231024092821.jpg', 'data/files/store_2/goods/20231024093254451.jpg', 1698111174, 2, 334, ''),
(608, 2, 'jpg', 364138, '微信图片_20231024092821.jpg', 'data/files/store_2/goods/20231024093303374.jpg', 1698111183, 2, 334, ''),
(609, 2, 'jpg', 282829, '微信图片_20231024092803.jpg', 'data/files/store_2/goods/20231024094011545.jpg', 1698111611, 2, 67, ''),
(610, 2, 'jpg', 446831, '微信图片_20231024092711.jpg', 'data/files/store_2/goods/20231024094745537.jpg', 1698112065, 2, 335, ''),
(611, 2, 'jpg', 446831, '微信图片_20231024092711.jpg', 'data/files/store_2/goods/20231024094752883.jpg', 1698112072, 2, 335, ''),
(612, 2, 'jpg', 274051, '微信图片_20231024092809.jpg', 'data/files/store_2/goods/20231024094911992.jpg', 1698112151, 2, 336, ''),
(613, 2, 'jpg', 274051, '微信图片_20231024092809.jpg', 'data/files/store_2/goods/20231024094919127.jpg', 1698112159, 2, 336, ''),
(614, 2, 'jpg', 277258, '微信图片_20231024144216.jpg', 'data/files/store_2/goods/20231024144224646.jpg', 1698129744, 2, 338, ''),
(615, 2, 'jpg', 277258, '微信图片_20231024144216.jpg', 'data/files/store_2/goods/20231024144238482.jpg', 1698129758, 2, 338, ''),
(616, 2, 'jpg', 296414, '微信图片_20231024144231.jpg', 'data/files/store_2/goods/20231024144238265.jpg', 1698129758, 2, 338, ''),
(617, 2, 'jpg', 336211, '微信图片_20231024190702.jpg', 'data/files/store_2/goods/20231024190752256.jpg', 1698145672, 2, 302, ''),
(618, 2, 'jpg', 336211, '微信图片_20231024190702.jpg', 'data/files/store_2/goods/20231024190802782.jpg', 1698145682, 2, 302, ''),
(619, 2, 'jpg', 352833, '微信图片_20231024190725.jpg', 'data/files/store_2/goods/20231024190802560.jpg', 1698145682, 2, 302, ''),
(620, 2, 'jpg', 600807, '微信图片_20231024190731.jpg', 'data/files/store_2/goods/20231024190803391.jpg', 1698145683, 2, 302, ''),
(621, 2, 'jpg', 405992, '微信图片_20231104103904.jpg', 'data/files/store_2/goods/20231104104000646.jpg', 1699065600, 2, 339, ''),
(622, 2, 'jpg', 368259, '微信图片_20231104104049.jpg', 'data/files/store_2/goods/20231104104120166.jpg', 1699065680, 2, 340, ''),
(623, 2, 'jpg', 240965, '微信图片_20231104104828.jpg', 'data/files/store_2/goods/20231104104911332.jpg', 1699066151, 2, 341, ''),
(624, 2, 'jpg', 383299, '微信图片_20231104105347.jpg', 'data/files/store_2/goods/20231104105439588.jpg', 1699066479, 2, 322, ''),
(639, 2, 'jpg', 467914, '微信图片_20231106114343.jpg', 'data/files/store_2/goods/20231106114539487.jpg', 1699242339, 2, 343, ''),
(628, 2, 'jpg', 244741, '微信图片_20231002101418.jpg', 'data/files/store_2/goods/20231105154507805.jpg', 1699170307, 2, 343, ''),
(636, 2, 'jpg', 464939, '微信图片_20231106114348.jpg', 'data/files/store_2/goods/20231106114419319.jpg', 1699242259, 2, 344, ''),
(637, 2, 'jpg', 464939, '微信图片_20231106114348.jpg', 'data/files/store_2/goods/20231106114431563.jpg', 1699242272, 2, 344, ''),
(632, 2, 'jpg', 319312, '1-1.jpg', 'data/files/store_2/goods/20231105155042184.jpg', 1699170642, 2, 115, ''),
(633, 2, 'jpg', 291339, '1-2.jpg', 'data/files/store_2/goods/20231105155042242.jpg', 1699170642, 2, 115, ''),
(634, 2, 'jpg', 310289, '微信图片_20231105154133.jpg', 'data/files/store_2/goods/20231105160331983.jpg', 1699171411, 2, 318, ''),
(640, 2, 'jpg', 467914, '微信图片_20231106114343.jpg', 'data/files/store_2/goods/20231106114548529.jpg', 1699242348, 2, 343, ''),
(641, 2, 'jpg', 244741, '微信图片_20231002101418.jpg', 'data/files/store_2/goods/20231106114610185.jpg', 1699242370, 2, 343, ''),
(642, 2, 'jpg', 271259, '微信图片_20231112113944.jpg', 'data/files/store_2/goods/20231112114302158.jpg', 1699760582, 2, 348, '');

-- --------------------------------------------------------

--
-- 表的结构 `swd_user`
--

CREATE TABLE `swd_user` (
  `userid` int(10) UNSIGNED NOT NULL,
  `username` varchar(60) NOT NULL DEFAULT '',
  `nickname` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `password_reset_token` varchar(255) DEFAULT '',
  `real_name` varchar(60) DEFAULT NULL,
  `gender` tinyint(3) UNSIGNED DEFAULT '0',
  `birthday` varchar(50) NOT NULL DEFAULT '',
  `phone_tel` varchar(60) NOT NULL DEFAULT '',
  `phone_mob` varchar(20) NOT NULL DEFAULT '',
  `im_qq` varchar(60) NOT NULL DEFAULT '',
  `create_time` int(10) UNSIGNED DEFAULT NULL,
  `update_time` int(10) UNSIGNED DEFAULT NULL,
  `last_login` int(10) UNSIGNED DEFAULT NULL,
  `last_ip` varchar(15) DEFAULT NULL,
  `logins` int(10) UNSIGNED DEFAULT '0',
  `ugrade` tinyint(3) UNSIGNED DEFAULT '1',
  `portrait` varchar(255) DEFAULT NULL,
  `activation` varchar(60) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  `imforbid` int(1) DEFAULT '0',
  `auth_key` varchar(255) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_user`
--

INSERT INTO `swd_user` (`userid`, `username`, `nickname`, `email`, `password`, `password_reset_token`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `create_time`, `update_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `activation`, `locked`, `imforbid`, `auth_key`) VALUES
(1, '系统管理员', '', '', '$2y$13$nvB7/gH5o9C1qfo7ZwuAo.AJrrrAYlmh.0gz.RphoTN5iKHAitq4e', '', '系统管理员', 0, '', '', '', '', 1691384292, 1699760441, 1699760441, '127.0.0.1', 37, 1, NULL, NULL, 0, 0, ''),
(2, '博艺花卉', '', '', '$2y$13$cFZiBKonrs9jr6tucl2axezpg4xf7k1dQ11qDT2sfGJ3c7dU3V6aK', '', '博艺花卉', 0, '', '', '', '', 1691384295, 1699760415, 1699760416, '127.0.0.1', 53, 1, NULL, NULL, 0, 0, 'y34xInnSbxuW2glT4EPeY7ANwRBofp9R'),
(3, '博艺管理', '', '', '$2y$13$nvB7/gH5o9C1qfo7ZwuAo.AJrrrAYlmh.0gz.RphoTN5iKHAitq4e', '', '博艺管理', 0, '', '', '', '', 1691384295, 1695439709, 1695439709, '127.0.0.1', 16, 1, NULL, NULL, 0, 0, 'uTwCnRs4ww2TRwvpdjMhs0_MzITyePu5'),
(4, '散单零售', '', '453115621@qq.com', '$2y$13$nvB7/gH5o9C1qfo7ZwuAo.AJrrrAYlmh.0gz.RphoTN5iKHAitq4e', '', '散单零售', 0, '', '', '13479269284', '', 1694399893, 1698827222, 1698827222, '127.0.0.1', 53, 1, 'data/system/default_user_portrait.gif', NULL, 0, 0, '6B5G7oudeoC5sRR3b6FsczEAtWgn8lBY'),
(5, '开业零售', '', '', '$2y$13$nvB7/gH5o9C1qfo7ZwuAo.AJrrrAYlmh.0gz.RphoTN5iKHAitq4e', '', '开业零售', 0, '', '', '', '', 1693344676, 1699695665, 1699695666, '127.0.0.1', 91, 1, NULL, NULL, 0, 0, '3Cv7syctW_v_faPuYpjetP0YTjhOMs6b'),
(42, '杰仕轩扬', '', '', '$2y$13$HVG1s7aleXRP2arKWCzOYu3.u4Je4CBTHs75Fz/YTEuMFZlIUNLo.', '', '杰仕轩扬', 0, '', '', '', '', 1695691676, 1695691676, 1695691676, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'g4432H7FmEei-ID_vidozVHkGIGMaxbo'),
(43, '天龙纺织', '', '', '$2y$13$gysFL/R0M9PmnuIOBPLdLuKSU3J2Hmlm1ETCifqcIfJw7cVYEagS.', '', '天龙纺织', 0, '', '', '', '', 1695694718, 1695694718, 1695694718, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'qPzJnQY5Yju2M7xvvkbqbCz3FnotRvkq'),
(41, '龙腾置业', '', '', '$2y$13$uNgLsQTxCXiwlk.rdUHuY.R9g4Ahw4n8SdOhHwWNHQq.cbuqDrXue', '', '龙腾置业', 0, '', '', '', '', 1695690778, 1695690778, 1695690778, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'GtzsPStHhqZTlhFPzLJWH18hy34C9f_u'),
(6, '默宾服饰', '', '', '$2y$13$8vV/zNXgEtoHK3Nf.gEuluDcsCJ7l3Ejq2TctUBON0C0cqRcz0Ba.', '', '默宾服饰', 0, '', '', '', '', 1695632006, 1695632006, 1695632006, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, '2nUoZV52nlFHFCsZ2wCu8ZvUYtAZdkns'),
(7, '到店访客', '', '', '$2y$13$hPCoL/Lour9LzQrneDW6YO0/jYmAWhhSib.I0u.oNeix7g8KJdrra', '', '到店访客', 0, '', '', '', '', 1695633154, 1695633154, 1695633154, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'ZfM1CgL9pJ4BkCF2AIOrpTtrdLRvfT1C'),
(44, '西部牛仔旺', '', '', '$2y$13$z4F8FNZUglP8dQYI78n.4.3kfHTTZmDRLOPJX/Y7dMGCzG0XZY/yK', '', '西部牛仔旺', 0, '', '', '', '', 1695704080, 1695704080, 1695704080, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, '1YLpL_QC7Y54D-8N8cQM0HF_ezkaFosk'),
(45, '维多利纺织', '', '', '$2y$13$.QqvVD1t9jtGPQLXwuafwuSi6HgJfCZXEFZucvH7MAuJGzBaNOtAm', '', '维多利纺织', 0, '', '', '', '', 1695704114, 1695704114, 1695704114, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'ZzN6fkU-mDCzd4E2BS9uHd3MLhpc0fkO'),
(46, '睿峰服饰包装', '', '', '$2y$13$coSMiR3sJqgNY29mDb9aw.fLHPsEKCk7neuPK7lFa7Vt4y52UKrPS', '', '睿峰服饰包装', 0, '', '', '', '', 1695704464, 1695704464, 1695704464, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'MKOEHixEV08FdAv87abLtD64DhEbDkQZ'),
(47, '羽丰羽绒', '', '', '$2y$13$p8lEwW4jN6vEcelNyIbF5.PRfwCCyv0MEY.ZgsplQvvW4jTxZG.n6', '', '羽丰羽绒', 0, '', '', '', '', 1695704487, 1695704487, 1695704487, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, '6dkc57yARnBm5_mO4mp05U1sYHKaJd-B'),
(48, '天龙纸塑包装', '', '', '$2y$13$5M06EbDvWfRU5gTmhq.27.LF0IqDzKAx4cOyH.dilxY3MzW3PkqO6', '', '天龙纸塑包装', 0, '', '', '', '', 1695704564, 1695704564, 1695704564, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'PmLSH-66wswflpjxvu_OdusjDvvkudIv'),
(49, '恒隆纺织', '', '', '$2y$13$O4iDJgQ2pKfIfc7ayUwV8.bPGSmLbLZxzwnfo6wWIOQTMPx.QobQS', '', '恒隆纺织', 0, '', '', '', '', 1695704574, 1695704574, 1695704574, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'N00zZVWS54NF5D2-AN0VXqbS2ZV24Psj'),
(50, '欧洲大街', '', '', '$2y$13$XAhqpURDuN2hu9KfUEv5NOaKeKgcntOUCRhqKkHcLkn1ARltKr5Rq', '', '欧洲大街', 0, '', '', '', '', 1695704584, 1695704584, 1695704584, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'sRq4AumFC40csWYKZSP3p9jxZWTKhWhC'),
(51, '骏鑫辅料', '', '', '$2y$13$eHVJKcQ4XPY5mQPV99db5u55i.0SgbALZAtiehMFhH1FsbR.RLdha', '', '骏鑫辅料', 0, '', '', '', '', 1695704594, 1695704594, 1695704594, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'C3HTStjBLEcgWmpL-fJyprAeQvvQ_EVQ'),
(52, '锋尚隆布行', '', '', '$2y$13$K4q4DkYuie6RTQM/GVMl0eyDRSjzPr.fy4lYGm93qyO50zBnOt1Gm', '', '锋尚隆布行', 0, '', '', '', '', 1695704603, 1695704603, 1695704603, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'NBT3IRr_aDlsRcgMHEixIaa2eQP-Arwg'),
(53, '卡迪卡菲', '', '', '$2y$13$Ek7jorb2m2nn8BeWPdGWDulKu926TDNbWwcIALZXkbJAVWSq.SDRi', '', '卡迪卡菲', 0, '', '', '', '', 1695704611, 1695704611, 1695704611, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'CdeOw4iGzRttREq8nOcmJH5-PIH7ijUp'),
(54, '万宝纺织', '', '', '$2y$13$DHu4ADCvcgj5JpzuY/q4Le/lZrq27ClYYQfvGxDQrj86gKiR16mt.', '', '万宝纺织', 0, '', '', '', '', 1695704620, 1695704620, 1695704620, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, '-j4-8JoADES2Bk1XRS_efJeF2IUxsCxc'),
(55, '博雅琦', '', '', '$2y$13$ahdW1eCW9qo0PetRUaAUZ.NQ.yI2OfpnPU5tJ9cic9QfICCAjFAXe', '', '博雅琦', 0, '', '', '', '', 1695704628, 1695704628, 1695704628, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, '5rmMIexS7uRmeo-Od0haD4CPg2EFvdaF'),
(56, '谷岸', '', '', '$2y$13$NPOfX6FYqg4ESpSLMyZXMOdwJHot08QpekhuxZx3NJpoOa.vQGU4K', '', '谷岸', 0, '', '', '', '', 1695704636, 1695704636, 1695704636, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'HA11O4IjM8k9dawVY50GSD2bwN8qRFIR'),
(57, '吴伟年', '', '', '$2y$13$t08YA4FMBBiE8hLsS.Uwfu8EcqOSZahdxRo/q6HnUlXPW4IiIuk86', '', '吴伟年', 0, '', '', '', '', 1695709864, 1695709864, 1695709864, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'fnNJs_dR-niLHsyJ7M7EiUEQb-Wej_FL'),
(58, '中云物流邹旭', '', '', '$2y$13$iZ.FCk1oyp6we4mkn7C5luQIvEajHaxCYNGVgDpimNVwfhtBGoCiW', '', '中云物流邹旭', 0, '', '', '18327277170', '', 1695870835, 1695870835, 1695870835, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'zXFgS9oJC-zuTjLjdaGhxpN3N41NMXAU'),
(59, '吴涛', '', '', '$2y$13$/6TL1XcfQPAMSrFf74B0R.DTmLX0Mo5sViyziO524PDw41sYIANym', '', '吴涛', 0, '', '', '', '', 1696646782, 1696646782, 1696646782, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, '0FE1IlTB05t4GFpytVIse3EFBCUXhbu0'),
(60, '依铭服饰', '', '', '$2y$13$GbchsmHhKGyLCHURoU4xYu0dpyCcqxRKL.EyrvNwVy7wJ5ugfHhPu', '', '依铭服饰', 0, '', '', '', '', 1696648976, 1696648976, 1696648976, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'ddJERF0rpC4uCGkVFL8X4TwZaVGFuq8j'),
(61, '德丰~肖丹', '', '', '$2y$13$Qkol.W4/IdvpokaptCQn/OxL7rh.gOEyP4nH0NtMgZIhxgM.WnelG', '', '德丰~肖丹', 0, '', '', '15377623826', '', 1696910255, 1696910255, 1696910255, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 't_qr-gLqZq0pHfQ2HpKdDvgAM3S8nTqH'),
(62, '史丽丽', '', '', '$2y$13$xZtB1OpuJ.mzf0TXL11Y/uUgcFraldWUewrBzmKaaSoVf8tovLaGO', '', '史丽丽', 0, '', '', '', '', 1697177104, 1697177104, 1697177104, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'h-iSYDL7PqDziyp1wIjhqabraw66_OWn'),
(63, '诺信纺织', '', '', '$2y$13$PvUfPEP7grOi71CDo10Z0.6tA4kf0vGCe9dHVMjDp1n3sU00HzgsS', '', '诺信纺织', 0, '', '', '', '', 1697340770, 1697340770, 1697340770, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'F-Z_0MK34qCmTSXW8clPixLaoberB24z'),
(64, '叁易服饰', '', '', '$2y$13$Xx7x92o2zYrCR4gZ6IxiGe3FKmx1.KoewJarfhdAgB3XFfQD4YbAi', '', '叁易服饰', 0, '', '', '', '', 1697341043, 1697341043, 1697341043, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'zg7toPhHigRhA8iNATIq_E_G2aOEP2Hl'),
(65, '维多利纺织~彪', '', '', '$2y$13$bMqDbBTbTYdgQ3jzdpxSl.N2KV33Ut9gWkwPT7nNotYGTAtafkrEa', '', '维多利纺织~彪', 0, '', '', '', '', 1697341320, 1697341320, 1697341320, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 's7WJ46jTKzZfgBXNNKNb46m1DIJXBzvO'),
(66, 'QKK服饰', '', '', '$2y$13$WvH8GnIH1rJsJ0QJMCj7U.wq9UnY0Hx8o4C1grWqC2aMfQsZcLkmu', '', 'QKK服饰', 0, '', '', '', '', 1697359477, 1697359477, 1697359477, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'uQAe_FMQH35s1zemfWz31SvQagkKnQCA'),
(67, '杰仕轩扬~涛哥', '', '', '$2y$13$i9VdyprfaXoW9ao5mMcW3O0RutgVIlLeG2Ww9OuCmX29znU0yHoCy', '', '杰仕轩扬~涛哥', 0, '', '', '', '', 1697417526, 1697417526, 1697417526, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'tdI9eafzAvKxx1o1JCHXJquLleUMhIEC'),
(68, '聖甲~英子', '', '', '$2y$13$JPx66dTxcZPcc4KgK38gOetLAAdlfNFfF.oIvkW8hndU586RpqgAW', '', '聖甲~英子', 0, '', '', '', '', 1697417643, 1697417643, 1697417643, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'nL0mN_fRC7v_QfYhLz38NYl6udBNnUeM'),
(69, '杨雨甜', '', '', '$2y$13$mKrCaQkzxiw9LDtjrTYoW.iVjtuKvUnEx9khE7BOU00nia9.lw3i6', '', '杨雨甜', 0, '', '', '', '', 1697422302, 1697422302, 1697422302, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'sOGuIBPSwFxFf0w4QYDjWKi_XGAHx5n2'),
(70, '杉线谱服饰~阿丁', '', '', '$2y$13$d4YvMsbiNpW6bWfLSxvXBupxzdk7RXMBPPa1qFPpkR3nxrYuzlvTK', '', '杉线谱服饰~阿丁', 0, '', '', '', '', 1697425387, 1697425387, 1697425387, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, '12ijenuhrkn8_qXuXJ8L1N5ALbKlkfrA'),
(71, '大通毛绒', '', '', '$2y$13$N13G1Ugye0rL5rePklUI.eO1vNa.T4WgUKGmVcD97q2WmzvZnK1oe', '', '大通毛绒', 0, '', '', '', '', 1697436723, 1697436723, 1697436723, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'qicCUwXL844b9c4mVDenUsjukiQY3c6g'),
(72, '振宇俊男', '', '', '$2y$13$A8uNvdrsKf0IJjoFeH/FyuFwIYShGF6dj5iVueu2gr4ROahtmgnV6', '', '振宇俊男', 0, '', '', '', '', 1697606863, 1697606863, 1697606863, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'trHhOHmaA7CKNO_mWQtnv3vwYnRuEdfs'),
(73, '骏鑫辅料-李拓', '', '', '$2y$13$iiv4RVzSFFR307GvL.qE/OyfLzlperbM8/WMuLvBWnEkfkGfOPRim', '', '骏鑫辅料-李拓', 0, '', '', '', '', 1697623248, 1697623248, 1697623248, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'YadN0N6x4cyzDc2mBmHRz29VXsByf7j5'),
(74, '田传义', '', '', '$2y$13$Cc3i60Uw531LYpc4Aq5v9u0t/F/Wsegvd5maTu829lf7QKz5BA9fy', '', '田传义', 0, '', '', '', '', 1697766310, 1697766310, 1697766310, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'qgfqDWXbZOv4iAxQqqUC6N3lvMpO1yvr'),
(75, '鉴航纺织', '', '', '$2y$13$DTrrLNouufYUj316e8Dc5uqGdHB9zxqTOlpxwlxbvop6VRxPlRmNe', '', '鉴航纺织', 0, '', '', '', '', 1697854475, 1697854475, 1697854475, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, '_A76Oz8z2NkngBOJN_PHvNEVfERkWmrX'),
(76, '周工', '', '', '$2y$13$FnxkWl15x5JStQ6gEEtMZexHUMsLpR1WmeDkyu0joTo/tfWAJ2sJa', '', '周工', 0, '', '', '', '', 1698023796, 1698023796, 1698023796, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'bc-CYFw7R7apob1eIyjFUEQZ6caHVtSD'),
(77, '孙雪晴', '', '', '$2y$13$TUq4oKF1rKXionKQr2j91exn.791kFTtUsT1AL7/s9PRkBRVq7ZmG', '', '孙雪晴', 0, '', '', '', '', 1698053917, 1698053917, 1698053917, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'qGAek6GPeakXzQ1StKsa1VMxQtmwHk1p'),
(78, '郭惠', '', '', '$2y$13$rdW7/aXi6ohEdWa/qVL1Iu/.xCQVAliMazVgd97ywImr3Y4DwaLlK', '', '郭惠', 0, '', '', '', '', 1698122229, 1698122229, 1698122229, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'RSMp4L1NXHUgXcOirovvT-YW6fGh8hbg'),
(79, '程进', '', '', '$2y$13$2xFR1o3MKvJDdlq2qRDaIejd6gdIKaZWoGmpyh.MWJ.2.udmuq3GO', '', '程进', 0, '', '', '', '', 1698122237, 1698122237, 1698122237, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'hQgFQ3ge7JQ8CqsHdpYi3KnZGfP-RE-s'),
(80, '补发', '', '', '$2y$13$TZ4CaVKqEZo6rw5l7CkOYuV8NVpEQbrbGSRkDSwp79870GwFA.t8q', '', '补发', 0, '', '', '', '', 1698130063, 1698130063, 1698130063, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'VL6b7PrZTymegU3zzI9av4KcZB1pAjCu'),
(81, '匿名', '', '', '$2y$13$diaVg.pyTFxytxRO0oBZ1.DsRTL9fXORTW/3X8Bug/pY3rwY7BJhW', '', '匿名', 0, '', '', '', '', 1698130583, 1698130583, 1698130583, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'k0FSoF06Q1kGRcnQinzw43MCv982pnmK'),
(82, '白旺旺', '', '', '$2y$13$yq8BpxROPWkfX2KuVnATceCnnWKWF5gmKysCkfOI77X7g9Uc0Ev7y', '', '白旺旺', 0, '', '', '', '', 1698134052, 1698134052, 1698134052, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, '3MVVSw73ZmCkqEhp4NynIaucad2h4arE'),
(83, 'wx~美好向往', '', '', '$2y$13$lHL.mpznB2UvPwlPL.M6F.6ICXurucyj3VfVx0danvwSfaJlVplqu', '', 'wx~美好向往', 0, '', '', '18207155955', '', 1698134973, 1698134973, 1698134973, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'sYOcriJq8l5D87bLFNax39vOUMjLySCJ'),
(84, '明明', '', '', '$2y$13$Je7xIsnpcvuOG.t4juLjMeypP8R1uNrFpwmC/DHbHFwwU2U9qCwQC', '', '明明', 0, '', '', '', '', 1698289267, 1698289267, 1698289267, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'sQv5jfrCPDK-1W9gSrzFcpmEcwf5cp0p'),
(85, '魏芳', '', '', '$2y$13$5h68tzXIcLxOXqMYpukCpeQG7HZQj7SN7cka5kCAyTx0FFbkSpPLG', '', '魏芳', 0, '', '', '', '', 1698485364, 1698485364, 1698485364, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, '4fPZMwModT1kQJwjqI77vFg_SsGXhsDW'),
(86, '盛先生', '', '', '$2y$13$tHm8kDB79y7nZ8jpuoeG9uJZkf8S1OPAmj/n8HPTJVvgqsfAVL41C', '', '盛先生', 0, '', '', '13307168900', '', 1698719421, 1698719421, 1698719421, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, '2-ZHVjn6cnq6g9uaGtFUBYfm_Hi5H8R7'),
(87, '程静', '', '', '$2y$13$L4EyteH9U5VpI8jM7VcgHOBUXcWrCQ2eMfTLRkDCSGJOJGm8Kcnnm', '', '程静', 0, '', '', '', '', 1699063583, 1699063583, 1699063583, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'XxC561ajxcFBYekhQpyp1eF1FbXov_Gi'),
(88, '祥盛布行~李思', '', '', '$2y$13$ZlDW7STwkq/5KR7eWtT.veCoJmEEAoBW8RgHNyflVTG9Xl9/X3KyC', '', '祥盛布行~李思', 0, '', '', '', '', 1699493547, 1699493547, 1699493547, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'DaLBBbmeLzqxGB3oWQGgt8iFFmHrNub7'),
(89, '韩国馆', '', '', '$2y$13$jA64pHX2MSFffwM8ikOPkOR3t0owPNopQS1GIQPCzPuRnDPA1OYXe', '', '韩国馆', 0, '', '', '', '', 1699498539, 1699498539, 1699498539, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'phCKxJqhKvKm4VJ5ysdnLa33ovP3UyQT'),
(90, '德丰纺织', '', '', '$2y$13$GIBC2ruSsHmsc7BNzf7JN.I6At9X2LJphxFBCOkaD/.jTPHLrZGPi', '', '德丰纺织', 0, '', '', '', '', 1699604811, 1699604811, 1699604811, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'GS5E1hw_COMGtGyeGY6tR8l6Dnd7yf6p'),
(91, '侄女', '', '', '$2y$13$EE5jwSzZ8bA0rP8WT.3RHuX.I61F9oYqYm8QEO6HPvc.Mg1KxFmYW', '', '侄女', 0, '', '', '', '', 1699695760, 1699695760, 1699695760, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'JsfFl0E6Mf2-wylcIfr20UVKXLFnyGxc'),
(92, '海华毛绒', '', '', '$2y$13$cu/Ir5F5MkBkcMrrWP9MyO.FKv0aZdTVGn/hjwONlkov2x1dIPe.i', '', '海华毛绒', 0, '', '', '', '', 1699760743, 1699760743, 1699760743, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'pmKMKLtbFdfNf_EzcSMdgjV9WOYGfLuT');

-- --------------------------------------------------------

--
-- 表的结构 `swd_user_bill`
--

CREATE TABLE `swd_user_bill` (
  `id` int(10) NOT NULL,
  `userid` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_user_bill`
--

INSERT INTO `swd_user_bill` (`id`, `userid`) VALUES
(1, 6),
(2, 44),
(3, 45),
(4, 46),
(5, 47),
(6, 48),
(7, 49),
(8, 50),
(9, 51),
(10, 52),
(11, 53),
(12, 54),
(13, 55),
(14, 56),
(15, 57),
(16, 65),
(17, 71);

-- --------------------------------------------------------

--
-- 表的结构 `swd_user_enter`
--

CREATE TABLE `swd_user_enter` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  `scene` varchar(20) DEFAULT '',
  `ip` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_user_enter`
--

INSERT INTO `swd_user_enter` (`id`, `userid`, `username`, `scene`, `ip`, `address`, `add_time`) VALUES
(1, 1, 'admin', 'backend', '127.0.0.1', NULL, 1691384334),
(2, 1, 'admin', 'backend', '127.0.0.1', NULL, 1691393928),
(3, 1, 'admin', 'backend', '127.0.0.1', NULL, 1692146372),
(4, 1, 'admin', 'backend', '127.0.0.1', NULL, 1692417853),
(5, 1, 'admin', 'backend', '127.0.0.1', NULL, 1692425964),
(6, 1, 'admin', 'backend', '127.0.0.1', NULL, 1693327782),
(7, 1, 'admin', 'backend', '127.0.0.1', NULL, 1693924470),
(8, 1, 'admin', 'backend', '127.0.0.1', NULL, 1693977426),
(9, 1, 'admin', 'backend', '127.0.0.1', NULL, 1694496703),
(10, 1, 'admin', 'backend', '127.0.0.1', NULL, 1694653370),
(11, 1, 'admin', 'backend', '127.0.0.1', NULL, 1694660452),
(12, 1, 'admin', 'backend', '127.0.0.1', NULL, 1694736562),
(13, 1, 'admin', 'backend', '127.0.0.1', NULL, 1694742491),
(14, 1, 'admin', 'backend', '127.0.0.1', NULL, 1694851685),
(15, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1695362482),
(16, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1695435352),
(17, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1695450434),
(18, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1695457722),
(19, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1695462170),
(20, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1695537206),
(21, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1695690337),
(22, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1695697027),
(23, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1695708528),
(24, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1696210535),
(25, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1696238086),
(26, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1696756548),
(27, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1696817499),
(28, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1696900747),
(29, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1697430048),
(30, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1697528717),
(31, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1697698671),
(32, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1699065242),
(33, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1699170812),
(34, 1, '系统管理员', 'backend', '127.0.0.1', NULL, 1699760441);

-- --------------------------------------------------------

--
-- 表的结构 `swd_user_priv`
--

CREATE TABLE `swd_user_priv` (
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `privs` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_user_priv`
--

INSERT INTO `swd_user_priv` (`userid`, `store_id`, `privs`) VALUES
(1, 0, 'all'),
(2, 2, 'all');

-- --------------------------------------------------------

--
-- 表的结构 `swd_user_token`
--

CREATE TABLE `swd_user_token` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `token` varchar(100) NOT NULL DEFAULT '',
  `expire_time` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_webim_log`
--

CREATE TABLE `swd_webim_log` (
  `logid` int(10) UNSIGNED NOT NULL,
  `fromid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fromName` varchar(100) NOT NULL DEFAULT '',
  `toid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `toName` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `content` varchar(255) DEFAULT '',
  `formatContent` varchar(255) DEFAULT '',
  `unread` int(10) UNSIGNED DEFAULT '0',
  `add_time` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_webim_online`
--

CREATE TABLE `swd_webim_online` (
  `onid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `client_id` varchar(100) DEFAULT '',
  `lasttime` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_weixin_menu`
--

CREATE TABLE `swd_weixin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int(10) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL,
  `sort_order` tinyint(3) UNSIGNED DEFAULT '255',
  `link` varchar(255) DEFAULT NULL,
  `reply_id` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_weixin_reply`
--

CREATE TABLE `swd_weixin_reply` (
  `reply_id` int(11) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '回复类型0文字1图文',
  `action` varchar(20) DEFAULT NULL COMMENT '回复命令 关注、消息、关键字',
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `rule_name` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` text,
  `add_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_weixin_setting`
--

CREATE TABLE `swd_weixin_setting` (
  `id` int(11) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `code` varchar(30) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `token` varchar(255) DEFAULT '',
  `appid` varchar(255) DEFAULT NULL,
  `appsecret` varchar(255) DEFAULT NULL,
  `if_valid` tinyint(1) UNSIGNED DEFAULT '0',
  `autologin` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `swd_wholesale`
--

CREATE TABLE `swd_wholesale` (
  `id` int(11) UNSIGNED NOT NULL,
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `store_id` int(10) UNSIGNED DEFAULT '0',
  `price` decimal(10,2) UNSIGNED DEFAULT '0.00',
  `quantity` int(10) UNSIGNED DEFAULT '1',
  `closed` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_wholesale`
--

INSERT INTO `swd_wholesale` (`id`, `goods_id`, `store_id`, `price`, `quantity`, `closed`) VALUES
(9, 64, 2, '138.00', 30, 0),
(8, 64, 2, '148.00', 20, 0),
(7, 64, 2, '158.00', 10, 0);

--
-- 转储表的索引
--

--
-- 表的索引 `swd_acategory`
--
ALTER TABLE `swd_acategory`
  ADD PRIMARY KEY (`cate_id`);

--
-- 表的索引 `swd_address`
--
ALTER TABLE `swd_address`
  ADD PRIMARY KEY (`addr_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `region_id` (`region_id`);

--
-- 表的索引 `swd_address_book`
--
ALTER TABLE `swd_address_book`
  ADD PRIMARY KEY (`book_id`);

--
-- 表的索引 `swd_address_delivery`
--
ALTER TABLE `swd_address_delivery`
  ADD PRIMARY KEY (`delivery_id`);

--
-- 表的索引 `swd_address_serv`
--
ALTER TABLE `swd_address_serv`
  ADD PRIMARY KEY (`sid`);

--
-- 表的索引 `swd_appbuylog`
--
ALTER TABLE `swd_appbuylog`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `bid` (`bid`),
  ADD KEY `orderId` (`orderId`);

--
-- 表的索引 `swd_appmarket`
--
ALTER TABLE `swd_appmarket`
  ADD PRIMARY KEY (`aid`);

--
-- 表的索引 `swd_apprenewal`
--
ALTER TABLE `swd_apprenewal`
  ADD PRIMARY KEY (`rid`);

--
-- 表的索引 `swd_article`
--
ALTER TABLE `swd_article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `cate_id` (`cate_id`);

--
-- 表的索引 `swd_bank`
--
ALTER TABLE `swd_bank`
  ADD PRIMARY KEY (`bid`);

--
-- 表的索引 `swd_bind`
--
ALTER TABLE `swd_bind`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_brand`
--
ALTER TABLE `swd_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- 表的索引 `swd_cart`
--
ALTER TABLE `swd_cart`
  ADD PRIMARY KEY (`rec_id`),
  ADD KEY `userid` (`userid`);

--
-- 表的索引 `swd_cashcard`
--
ALTER TABLE `swd_cashcard`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_category_goods`
--
ALTER TABLE `swd_category_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cate_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- 表的索引 `swd_category_store`
--
ALTER TABLE `swd_category_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cate_id`),
  ADD KEY `store_id` (`store_id`);

--
-- 表的索引 `swd_cate_pvs`
--
ALTER TABLE `swd_cate_pvs`
  ADD PRIMARY KEY (`cate_id`);

--
-- 表的索引 `swd_channel`
--
ALTER TABLE `swd_channel`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_cod`
--
ALTER TABLE `swd_cod`
  ADD PRIMARY KEY (`store_id`);

--
-- 表的索引 `swd_collect`
--
ALTER TABLE `swd_collect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `type` (`type`);

--
-- 表的索引 `swd_congratulations`
--
ALTER TABLE `swd_congratulations`
  ADD PRIMARY KEY (`addr_id`);

--
-- 表的索引 `swd_coupon`
--
ALTER TABLE `swd_coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD KEY `store_id` (`store_id`);

--
-- 表的索引 `swd_coupon_sn`
--
ALTER TABLE `swd_coupon_sn`
  ADD PRIMARY KEY (`coupon_sn`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- 表的索引 `swd_delivery_template`
--
ALTER TABLE `swd_delivery_template`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `store_id` (`store_id`);

--
-- 表的索引 `swd_deposit_account`
--
ALTER TABLE `swd_deposit_account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `account` (`account`);

--
-- 表的索引 `swd_deposit_recharge`
--
ALTER TABLE `swd_deposit_recharge`
  ADD PRIMARY KEY (`recharge_id`),
  ADD KEY `orderId` (`orderId`),
  ADD KEY `userid` (`userid`);

--
-- 表的索引 `swd_deposit_record`
--
ALTER TABLE `swd_deposit_record`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `tradeNo` (`tradeNo`),
  ADD KEY `userid` (`userid`);

--
-- 表的索引 `swd_deposit_refund`
--
ALTER TABLE `swd_deposit_refund`
  ADD PRIMARY KEY (`refund_id`),
  ADD KEY `record_id` (`record_id`);

--
-- 表的索引 `swd_deposit_setting`
--
ALTER TABLE `swd_deposit_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- 表的索引 `swd_deposit_trade`
--
ALTER TABLE `swd_deposit_trade`
  ADD PRIMARY KEY (`trade_id`),
  ADD KEY `tradeNo` (`tradeNo`),
  ADD KEY `bizOrderId` (`bizOrderId`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `payTradeNo` (`payTradeNo`);

--
-- 表的索引 `swd_deposit_withdraw`
--
ALTER TABLE `swd_deposit_withdraw`
  ADD PRIMARY KEY (`draw_id`),
  ADD KEY `orderId` (`orderId`),
  ADD KEY `userid` (`userid`);

--
-- 表的索引 `swd_distribute`
--
ALTER TABLE `swd_distribute`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_distribute_items`
--
ALTER TABLE `swd_distribute_items`
  ADD PRIMARY KEY (`diid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `item_id` (`item_id`);

--
-- 表的索引 `swd_distribute_merchant`
--
ALTER TABLE `swd_distribute_merchant`
  ADD PRIMARY KEY (`dmid`);

--
-- 表的索引 `swd_distribute_order`
--
ALTER TABLE `swd_distribute_order`
  ADD PRIMARY KEY (`doid`),
  ADD KEY `rec_id` (`rec_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `order_sn` (`order_sn`);

--
-- 表的索引 `swd_distribute_setting`
--
ALTER TABLE `swd_distribute_setting`
  ADD PRIMARY KEY (`dsid`);

--
-- 表的索引 `swd_flagstore`
--
ALTER TABLE `swd_flagstore`
  ADD PRIMARY KEY (`fid`);

--
-- 表的索引 `swd_friend`
--
ALTER TABLE `swd_friend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `friend_id` (`friend_id`);

--
-- 表的索引 `swd_gcategory`
--
ALTER TABLE `swd_gcategory`
  ADD PRIMARY KEY (`cate_id`);

--
-- 表的索引 `swd_goods`
--
ALTER TABLE `swd_goods`
  ADD PRIMARY KEY (`goods_id`),
  ADD KEY `store_id` (`store_id`);

--
-- 表的索引 `swd_goods_image`
--
ALTER TABLE `swd_goods_image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- 表的索引 `swd_goods_integral`
--
ALTER TABLE `swd_goods_integral`
  ADD PRIMARY KEY (`goods_id`);

--
-- 表的索引 `swd_goods_prop`
--
ALTER TABLE `swd_goods_prop`
  ADD PRIMARY KEY (`pid`);

--
-- 表的索引 `swd_goods_prop_value`
--
ALTER TABLE `swd_goods_prop_value`
  ADD PRIMARY KEY (`vid`);

--
-- 表的索引 `swd_goods_pvs`
--
ALTER TABLE `swd_goods_pvs`
  ADD PRIMARY KEY (`goods_id`);

--
-- 表的索引 `swd_goods_qa`
--
ALTER TABLE `swd_goods_qa`
  ADD PRIMARY KEY (`ques_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `goods_id` (`item_id`),
  ADD KEY `store_id` (`store_id`);

--
-- 表的索引 `swd_goods_spec`
--
ALTER TABLE `swd_goods_spec`
  ADD PRIMARY KEY (`spec_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- 表的索引 `swd_goods_statistics`
--
ALTER TABLE `swd_goods_statistics`
  ADD PRIMARY KEY (`goods_id`);

--
-- 表的索引 `swd_guideshop`
--
ALTER TABLE `swd_guideshop`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_integral`
--
ALTER TABLE `swd_integral`
  ADD PRIMARY KEY (`userid`);

--
-- 表的索引 `swd_integral_log`
--
ALTER TABLE `swd_integral_log`
  ADD PRIMARY KEY (`log_id`);

--
-- 表的索引 `swd_integral_setting`
--
ALTER TABLE `swd_integral_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- 表的索引 `swd_limitbuy`
--
ALTER TABLE `swd_limitbuy`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_meal`
--
ALTER TABLE `swd_meal`
  ADD PRIMARY KEY (`meal_id`);

--
-- 表的索引 `swd_meal_goods`
--
ALTER TABLE `swd_meal_goods`
  ADD PRIMARY KEY (`mg_id`);

--
-- 表的索引 `swd_message`
--
ALTER TABLE `swd_message`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `to_id` (`to_id`);

--
-- 表的索引 `swd_msg`
--
ALTER TABLE `swd_msg`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_msg_log`
--
ALTER TABLE `swd_msg_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_msg_template`
--
ALTER TABLE `swd_msg_template`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_navigation`
--
ALTER TABLE `swd_navigation`
  ADD PRIMARY KEY (`nav_id`);

--
-- 表的索引 `swd_order`
--
ALTER TABLE `swd_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_sn` (`order_sn`);

--
-- 表的索引 `swd_order_extm`
--
ALTER TABLE `swd_order_extm`
  ADD PRIMARY KEY (`order_id`);

--
-- 表的索引 `swd_order_goods`
--
ALTER TABLE `swd_order_goods`
  ADD PRIMARY KEY (`rec_id`),
  ADD KEY `order_id` (`order_id`,`goods_id`);

--
-- 表的索引 `swd_order_integral`
--
ALTER TABLE `swd_order_integral`
  ADD PRIMARY KEY (`order_id`);

--
-- 表的索引 `swd_order_log`
--
ALTER TABLE `swd_order_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 表的索引 `swd_partner`
--
ALTER TABLE `swd_partner`
  ADD PRIMARY KEY (`partner_id`),
  ADD KEY `store_id` (`store_id`);

--
-- 表的索引 `swd_plugin`
--
ALTER TABLE `swd_plugin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_promotool_item`
--
ALTER TABLE `swd_promotool_item`
  ADD PRIMARY KEY (`piid`);

--
-- 表的索引 `swd_promotool_setting`
--
ALTER TABLE `swd_promotool_setting`
  ADD PRIMARY KEY (`psid`);

--
-- 表的索引 `swd_recommend`
--
ALTER TABLE `swd_recommend`
  ADD PRIMARY KEY (`recom_id`),
  ADD KEY `store_id` (`store_id`);

--
-- 表的索引 `swd_recommend_goods`
--
ALTER TABLE `swd_recommend_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- 表的索引 `swd_refund`
--
ALTER TABLE `swd_refund`
  ADD PRIMARY KEY (`refund_id`);

--
-- 表的索引 `swd_refund_message`
--
ALTER TABLE `swd_refund_message`
  ADD PRIMARY KEY (`rm_id`);

--
-- 表的索引 `swd_region`
--
ALTER TABLE `swd_region`
  ADD PRIMARY KEY (`region_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- 表的索引 `swd_report`
--
ALTER TABLE `swd_report`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_scategory`
--
ALTER TABLE `swd_scategory`
  ADD PRIMARY KEY (`cate_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- 表的索引 `swd_sgrade`
--
ALTER TABLE `swd_sgrade`
  ADD PRIMARY KEY (`grade_id`);

--
-- 表的索引 `swd_sgrade_integral`
--
ALTER TABLE `swd_sgrade_integral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sgrade_id` (`sgrade_id`);

--
-- 表的索引 `swd_store`
--
ALTER TABLE `swd_store`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `store_name` (`store_name`);

--
-- 表的索引 `swd_teambuy`
--
ALTER TABLE `swd_teambuy`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_teambuy_log`
--
ALTER TABLE `swd_teambuy_log`
  ADD PRIMARY KEY (`logid`);

--
-- 表的索引 `swd_uploaded_file`
--
ALTER TABLE `swd_uploaded_file`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `store_id` (`store_id`);

--
-- 表的索引 `swd_user`
--
ALTER TABLE `swd_user`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `username` (`username`),
  ADD KEY `phone_mob` (`phone_mob`);

--
-- 表的索引 `swd_user_bill`
--
ALTER TABLE `swd_user_bill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- 表的索引 `swd_user_enter`
--
ALTER TABLE `swd_user_enter`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_user_priv`
--
ALTER TABLE `swd_user_priv`
  ADD PRIMARY KEY (`userid`,`store_id`);

--
-- 表的索引 `swd_user_token`
--
ALTER TABLE `swd_user_token`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_webim_log`
--
ALTER TABLE `swd_webim_log`
  ADD PRIMARY KEY (`logid`);

--
-- 表的索引 `swd_webim_online`
--
ALTER TABLE `swd_webim_online`
  ADD PRIMARY KEY (`onid`);

--
-- 表的索引 `swd_weixin_menu`
--
ALTER TABLE `swd_weixin_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_weixin_reply`
--
ALTER TABLE `swd_weixin_reply`
  ADD PRIMARY KEY (`reply_id`);

--
-- 表的索引 `swd_weixin_setting`
--
ALTER TABLE `swd_weixin_setting`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `swd_wholesale`
--
ALTER TABLE `swd_wholesale`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `swd_acategory`
--
ALTER TABLE `swd_acategory`
  MODIFY `cate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `swd_address`
--
ALTER TABLE `swd_address`
  MODIFY `addr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- 使用表AUTO_INCREMENT `swd_address_book`
--
ALTER TABLE `swd_address_book`
  MODIFY `book_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `swd_address_delivery`
--
ALTER TABLE `swd_address_delivery`
  MODIFY `delivery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- 使用表AUTO_INCREMENT `swd_address_serv`
--
ALTER TABLE `swd_address_serv`
  MODIFY `sid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- 使用表AUTO_INCREMENT `swd_appbuylog`
--
ALTER TABLE `swd_appbuylog`
  MODIFY `bid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_appmarket`
--
ALTER TABLE `swd_appmarket`
  MODIFY `aid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_apprenewal`
--
ALTER TABLE `swd_apprenewal`
  MODIFY `rid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_article`
--
ALTER TABLE `swd_article`
  MODIFY `article_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `swd_bank`
--
ALTER TABLE `swd_bank`
  MODIFY `bid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_bind`
--
ALTER TABLE `swd_bind`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_brand`
--
ALTER TABLE `swd_brand`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `swd_cart`
--
ALTER TABLE `swd_cart`
  MODIFY `rec_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- 使用表AUTO_INCREMENT `swd_cashcard`
--
ALTER TABLE `swd_cashcard`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_category_goods`
--
ALTER TABLE `swd_category_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1661;

--
-- 使用表AUTO_INCREMENT `swd_category_store`
--
ALTER TABLE `swd_category_store`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `swd_channel`
--
ALTER TABLE `swd_channel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `swd_collect`
--
ALTER TABLE `swd_collect`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `swd_coupon`
--
ALTER TABLE `swd_coupon`
  MODIFY `coupon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `swd_delivery_template`
--
ALTER TABLE `swd_delivery_template`
  MODIFY `template_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `swd_deposit_account`
--
ALTER TABLE `swd_deposit_account`
  MODIFY `account_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- 使用表AUTO_INCREMENT `swd_deposit_recharge`
--
ALTER TABLE `swd_deposit_recharge`
  MODIFY `recharge_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `swd_deposit_record`
--
ALTER TABLE `swd_deposit_record`
  MODIFY `record_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- 使用表AUTO_INCREMENT `swd_deposit_refund`
--
ALTER TABLE `swd_deposit_refund`
  MODIFY `refund_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_deposit_setting`
--
ALTER TABLE `swd_deposit_setting`
  MODIFY `setting_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `swd_deposit_trade`
--
ALTER TABLE `swd_deposit_trade`
  MODIFY `trade_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- 使用表AUTO_INCREMENT `swd_deposit_withdraw`
--
ALTER TABLE `swd_deposit_withdraw`
  MODIFY `draw_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_distribute`
--
ALTER TABLE `swd_distribute`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_distribute_items`
--
ALTER TABLE `swd_distribute_items`
  MODIFY `diid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_distribute_merchant`
--
ALTER TABLE `swd_distribute_merchant`
  MODIFY `dmid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_distribute_order`
--
ALTER TABLE `swd_distribute_order`
  MODIFY `doid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_distribute_setting`
--
ALTER TABLE `swd_distribute_setting`
  MODIFY `dsid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_flagstore`
--
ALTER TABLE `swd_flagstore`
  MODIFY `fid` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_friend`
--
ALTER TABLE `swd_friend`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_gcategory`
--
ALTER TABLE `swd_gcategory`
  MODIFY `cate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2655;

--
-- 使用表AUTO_INCREMENT `swd_goods`
--
ALTER TABLE `swd_goods`
  MODIFY `goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- 使用表AUTO_INCREMENT `swd_goods_image`
--
ALTER TABLE `swd_goods_image`
  MODIFY `image_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=440;

--
-- 使用表AUTO_INCREMENT `swd_goods_prop`
--
ALTER TABLE `swd_goods_prop`
  MODIFY `pid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_goods_prop_value`
--
ALTER TABLE `swd_goods_prop_value`
  MODIFY `vid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_goods_qa`
--
ALTER TABLE `swd_goods_qa`
  MODIFY `ques_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_goods_spec`
--
ALTER TABLE `swd_goods_spec`
  MODIFY `spec_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;

--
-- 使用表AUTO_INCREMENT `swd_guideshop`
--
ALTER TABLE `swd_guideshop`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_integral_log`
--
ALTER TABLE `swd_integral_log`
  MODIFY `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- 使用表AUTO_INCREMENT `swd_integral_setting`
--
ALTER TABLE `swd_integral_setting`
  MODIFY `setting_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `swd_limitbuy`
--
ALTER TABLE `swd_limitbuy`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `swd_meal`
--
ALTER TABLE `swd_meal`
  MODIFY `meal_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_meal_goods`
--
ALTER TABLE `swd_meal_goods`
  MODIFY `mg_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_message`
--
ALTER TABLE `swd_message`
  MODIFY `msg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `swd_msg`
--
ALTER TABLE `swd_msg`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_msg_log`
--
ALTER TABLE `swd_msg_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_msg_template`
--
ALTER TABLE `swd_msg_template`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_navigation`
--
ALTER TABLE `swd_navigation`
  MODIFY `nav_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `swd_order`
--
ALTER TABLE `swd_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- 使用表AUTO_INCREMENT `swd_order_goods`
--
ALTER TABLE `swd_order_goods`
  MODIFY `rec_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- 使用表AUTO_INCREMENT `swd_order_log`
--
ALTER TABLE `swd_order_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- 使用表AUTO_INCREMENT `swd_partner`
--
ALTER TABLE `swd_partner`
  MODIFY `partner_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_plugin`
--
ALTER TABLE `swd_plugin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `swd_promotool_item`
--
ALTER TABLE `swd_promotool_item`
  MODIFY `piid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

--
-- 使用表AUTO_INCREMENT `swd_promotool_setting`
--
ALTER TABLE `swd_promotool_setting`
  MODIFY `psid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_recommend`
--
ALTER TABLE `swd_recommend`
  MODIFY `recom_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `swd_recommend_goods`
--
ALTER TABLE `swd_recommend_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- 使用表AUTO_INCREMENT `swd_refund`
--
ALTER TABLE `swd_refund`
  MODIFY `refund_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `swd_refund_message`
--
ALTER TABLE `swd_refund_message`
  MODIFY `rm_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `swd_region`
--
ALTER TABLE `swd_region`
  MODIFY `region_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=477;

--
-- 使用表AUTO_INCREMENT `swd_report`
--
ALTER TABLE `swd_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_scategory`
--
ALTER TABLE `swd_scategory`
  MODIFY `cate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- 使用表AUTO_INCREMENT `swd_sgrade`
--
ALTER TABLE `swd_sgrade`
  MODIFY `grade_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `swd_sgrade_integral`
--
ALTER TABLE `swd_sgrade_integral`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_teambuy`
--
ALTER TABLE `swd_teambuy`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `swd_teambuy_log`
--
ALTER TABLE `swd_teambuy_log`
  MODIFY `logid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_uploaded_file`
--
ALTER TABLE `swd_uploaded_file`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=643;

--
-- 使用表AUTO_INCREMENT `swd_user`
--
ALTER TABLE `swd_user`
  MODIFY `userid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- 使用表AUTO_INCREMENT `swd_user_bill`
--
ALTER TABLE `swd_user_bill`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `swd_user_enter`
--
ALTER TABLE `swd_user_enter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- 使用表AUTO_INCREMENT `swd_user_token`
--
ALTER TABLE `swd_user_token`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_webim_log`
--
ALTER TABLE `swd_webim_log`
  MODIFY `logid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_webim_online`
--
ALTER TABLE `swd_webim_online`
  MODIFY `onid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_weixin_menu`
--
ALTER TABLE `swd_weixin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_weixin_reply`
--
ALTER TABLE `swd_weixin_reply`
  MODIFY `reply_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_weixin_setting`
--
ALTER TABLE `swd_weixin_setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_wholesale`
--
ALTER TABLE `swd_wholesale`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
