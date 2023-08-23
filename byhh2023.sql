-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-08-23 04:47:00
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
(1, '系统分类', 0, 0, 255, 1);

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
  `zipcode` varchar(20) DEFAULT '',
  `phone_tel` varchar(60) DEFAULT '',
  `phone_mob` varchar(20) DEFAULT '',
  `defaddr` tinyint(3) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_address`
--

INSERT INTO `swd_address` (`addr_id`, `userid`, `consignee`, `region_id`, `region_name`, `address`, `signature`, `zipcode`, `phone_tel`, `phone_mob`, `defaddr`) VALUES
(1, 4, '博艺花卉客服', 284, '湖北省 武汉', '汉正街华贸2号楼1-81号', NULL, '', '', '15210723548', 1),
(2, 3, '博艺花卉客服', 284, '湖北省 武汉', '汉正街华贸2号楼1-81号', '郭惠', '', '', '13476299284', 1),
(3, 5, '玖续服饰', 284, '湖北省 武汉', '云尚5C、050号', '维多利纺织', '', '', '', 0),
(4, 2, '博艺花卉客服', 284, '湖北省 武汉', '汉正街华贸二号楼1-81号', NULL, '', '', '13479269284', 1);

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
(4, '开店协议', 1, 0, '', '<p>\r\n	使用本公司服务所须遵守的条款和条件。<br />\r\n<br />\r\n1.用户资格<br />\r\n本公司的服务仅向适用法律下能够签订具有法律约束力的合同的个人提供并仅由其使用。在不限制前述规定的前提下，本公司的服务不向18周岁以下或被临时或无限期中止的用户提供。如您不合资格，请勿使用本公司的服务。此外，您的帐户（包括信用评价）和用户名不得向其他方转让或出售。另外，本公司保留根据其意愿中止或终止您的帐户的权利。<br />\r\n<br />\r\n2.您的资料（包括但不限于所添加的任何商品）不得：<br />\r\n*具有欺诈性、虚假、不准确或具误导性；<br />\r\n*侵犯任何第三方著作权、专利权、商标权、商业秘密或其他专有权利或发表权或隐私权；<br />\r\n*违反任何适用的法律或法规（包括但不限于有关出口管制、消费者保护、不正当竞争、刑法、反歧视或贸易惯例/公平贸易法律的法律或法规）；<br />\r\n*有侮辱或者诽谤他人，侵害他人合法权益的内容；<br />\r\n*有淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的内容；<br />\r\n*包含可能破坏、改变、删除、不利影响、秘密截取、未经授权而接触或征用任何系统、数据或个人资料的任何病毒、特洛依木马、蠕虫、定时炸弹、删除蝇、复活节彩蛋、间谍软件或其他电脑程序；<br />\r\n<br />\r\n3.违约<br />\r\n如发生以下情形，本公司可能限制您的活动、立即删除您的商品、向本公司社区发出有关您的行为的警告、发出警告通知、暂时中止、无限期地中止或终止您的用户资格及拒绝向您提供服务：<br />\r\n(a)您违反本协议或纳入本协议的文件；<br />\r\n(b)本公司无法核证或验证您向本公司提供的任何资料；<br />\r\n(c)本公司相信您的行为可能对您、本公司用户或本公司造成损失或法律责任。<br />\r\n<br />\r\n4.责任限制<br />\r\n本公司、本公司的关联公司和相关实体或本公司的供应商在任何情况下均不就因本公司的网站、本公司的服务或本协议而产生或与之有关的利润损失或任何特别、间接或后果性的损害（无论以何种方式产生，包括疏忽）承担任何责任。您同意您就您自身行为之合法性单独承担责任。您同意，本公司和本公司的所有关联公司和相关实体对本公司用户的行为的合法性及产生的任何结果不承担责任。<br />\r\n<br />\r\n5.无代理关系<br />\r\n用户和本公司是独立的合同方，本协议无意建立也没有创立任何代理、合伙、合营、雇员与雇主或特许经营关系。本公司也不对任何用户及其网上交易行为做出明示或默许的推荐、承诺或担保。<br />\r\n<br />\r\n6.一般规定<br />\r\n本协议在所有方面均受中华人民共和国法律管辖。本协议的规定是可分割的，如本协议任何规定被裁定为无效或不可执行，该规定可被删除而其余条款应予以执行。\r\n</p>', 255, 1, 1542755700);

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
(1, 'fiyta', 'data/files/mall/brand/15.jpg', '', 0, 255, 1, 0, 1, '女装', 'F', ''),
(2, '珂兰钻石', 'data/files/mall/brand/16.jpg', '', 0, 255, 1, 0, 1, '女装', 'K', ''),
(3, 'Zippo', 'data/files/mall/brand/17.png', '', 0, 255, 1, 0, 1, '女装', 'Z', ''),
(4, 'kiplinq', 'data/files/mall/brand/18.png', '', 0, 255, 1, 0, 1, '女装', 'K', ''),
(5, 'ochirly', 'data/files/mall/brand/19.jpg', '', 0, 255, 1, 0, 1, '女装', 'O', ''),
(6, '劲霸', 'data/files/mall/brand/20.png', '', 0, 255, 1, 0, 1, '女装', 'J', ''),
(7, '古今', 'data/files/mall/brand/21.jpg', '', 0, 255, 1, 0, 1, '女装', 'G', ''),
(8, '百丽', 'data/files/mall/brand/22.jpg', '', 0, 255, 1, 0, 1, '女装', 'B', ''),
(9, '杰克', 'data/files/mall/brand/23.jpg', '', 0, 255, 1, 0, 1, '男装', 'J', ''),
(10, 'COACH', 'data/files/mall/brand/24.jpg', '', 0, 255, 1, 0, 1, '男装', 'C', ''),
(11, '海尔', 'data/files/mall/brand/25.jpg', '', 0, 255, 1, 0, 1, '', 'H', ''),
(12, '乐视', 'data/files/mall/brand/26.jpg', '', 0, 255, 1, 0, 1, '', 'L', ''),
(13, '康佳', 'data/files/mall/brand/27.jpg', '', 0, 255, 1, 0, 1, '', 'K', ''),
(14, '三星', 'data/files/mall/brand/28.jpg', '', 0, 255, 1, 0, 1, '', 'S', ''),
(15, 'SONY', 'data/files/mall/brand/29.jpg', '', 0, 255, 1, 0, 1, '', 'S', ''),
(16, '东芝', 'data/files/mall/brand/30.jpg', '', 0, 255, 1, 0, 1, '', 'D', ''),
(17, '小米', 'data/files/mall/brand/31.jpg', 'data/files/mall/brand/17/brand_image.jpg', 0, 4, 1, 0, 1, '', 'X', 'Xiaomi/小米 小米电视4A 43英寸 青春版高清wifi智能电视40 50'),
(18, '飞利浦', 'data/files/mall/brand/32.jpg', 'data/files/mall/brand/18/brand_image.png', 0, 3, 1, 0, 1, '', 'F', ''),
(19, '海信', 'data/files/mall/brand/33.jpg', 'data/files/mall/brand/19/brand_image.jpg', 0, 2, 1, 0, 1, '', 'H', '海信电视国际知名品牌'),
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
(5, 4, 2, 1, '三星（SAMSUNG）UA55MUF30ZJXXZ 55英寸 4K超高清 智能网络 液晶平板电视 黑色', 1, '', '2999.00', 1, 'data/files/store_2/goods/20181121161206467.jpg', 0, '49de8d294fbc2e9eba10beddb7af00b2', NULL),
(8, 3, 2, 41, '【绿植】绿宝', 64, '', '260.00', 1, 'data/files/store_2/goods/20230816140705675.jpg.thumb.jpg', 1, '3716b3ed0795ff92c20ec35550b56da9', 0);

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
(427, 2559, 6),
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
(426, 2558, 6),
(425, 2559, 7),
(421, 2559, 10),
(248, 2558, 11),
(424, 2558, 7),
(422, 2558, 8),
(420, 2558, 10),
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
(389, 2559, 58),
(388, 2558, 58),
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
(438, 2555, 66),
(439, 2556, 66),
(440, 2555, 67),
(441, 2556, 67),
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
(458, 2555, 74),
(459, 2556, 74),
(463, 2556, 75),
(462, 2555, 75),
(464, 2555, 76),
(465, 2556, 76),
(466, 2555, 77),
(467, 2556, 77),
(468, 2555, 78),
(469, 2556, 78),
(485, 2556, 79),
(484, 2555, 79),
(472, 2555, 80),
(473, 2556, 80),
(477, 2556, 81),
(476, 2555, 81),
(478, 2555, 82),
(479, 2556, 82),
(489, 2556, 83),
(488, 2555, 83),
(482, 2555, 84),
(483, 2556, 84);

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
(3, 2, '618活动', '18.00', 1, 1617004800, 1640966399, '88.00', 1, NULL, 999, 999, 1);

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
(1, 2, '1691388635@qq.com', '25f9e794323b453885f5181f1b624d0b', '0.00', '0.00', '0.00', 'seller', 'ON', 1691388635, 1691388635),
(2, 4, '15210723549', '25f9e794323b453885f5181f1b624d0b', '0.00', '0.00', '0.00', 'gh2023', 'ON', 1691391478, 1691391478),
(3, 5, '1691392527@qq.com', '25f9e794323b453885f5181f1b624d0b', '0.00', '0.00', '0.00', 'wdlfz2023', 'ON', 1691392527, 1691392527),
(4, 3, '1691392533@qq.com', '25f9e794323b453885f5181f1b624d0b', '0.00', '0.00', '0.00', 'buyer', 'ON', 1691392533, 1691392533);

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
(1, '20230807151533832120', '', '', '16913925338196992', 'ORDER', 5, 2, '3009.00', 'PENDING', NULL, 0, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 三星（SAMSUNG）UA55MUF30ZJXXZ 55英寸 4K超高清 智能网络 液晶平板电视 黑色', '', '', 1691392533, NULL, NULL),
(2, '20230807153042138973', '', '', '16913934426786202', 'ORDER', 5, 2, '18998.00', 'PENDING', NULL, 0, 'SHOPPING', 'SHIELD', 'outlay', '', '', '支付 - 索尼（SONY）KD-55A8F 55英寸 OLED 4K HDR安卓7.0智能电视（黑色）等多件', '', '', 1691393442, NULL, NULL);

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
(2, 0, '绿植、鲜花盆', 0, 3, 5, 1, '', ''),
(21, 0, '绿植、盆栽', 0, 0, 1, 1, '', ''),
(22, 0, '大号盆栽', 21, 0, 255, 1, '', ''),
(1313, 0, '小号盆栽', 21, 0, 255, 1, '', ''),
(62, 0, '花篮', 63, 0, 255, 1, '', ''),
(63, 0, '鲜花、花材', 0, 2, 3, 1, '', ''),
(64, 0, '手捧花', 63, 0, 255, 1, '', ''),
(65, 0, '鲜花', 63, 0, 255, 1, '', ''),
(2578, 0, '中号瓷盆', 2, 0, 255, 1, NULL, NULL),
(1212, 0, '大号瓷盆', 2, 0, 255, 1, '', ''),
(1234, 0, '包装纸', 2542, 0, 255, 1, '', ''),
(1272, 0, '卡片', 2542, 0, 255, 1, '', ''),
(1273, 0, '丝带', 2542, 0, 255, 1, '', ''),
(1274, 0, '其他消耗品', 2542, 0, 255, 1, '', ''),
(1235, 0, '999系列', 64, 0, 255, 1, '', ''),
(1282, 0, '99系列', 64, 0, 255, 1, '', ''),
(1283, 0, '33系列', 64, 0, 255, 1, '', ''),
(1236, 0, '白玫瑰', 65, 0, 255, 1, '', ''),
(1288, 0, '香槟', 65, 0, 255, 1, '', ''),
(1289, 0, '红玫瑰', 65, 0, 255, 1, '', ''),
(1290, 0, '扶郎', 65, 0, 255, 1, '', ''),
(1284, 0, '11系列', 64, 0, 255, 1, '', ''),
(1285, 0, '热销', 64, 0, 255, 1, '', ''),
(1286, 0, '新品', 64, 0, 255, 1, '', ''),
(1287, 0, '活动', 64, 0, 255, 1, '', ''),
(1291, 0, '桔梗', 65, 0, 255, 1, '', ''),
(1292, 0, '小菊', 65, 0, 255, 1, '', ''),
(1293, 0, '百合', 65, 0, 255, 1, '', ''),
(1294, 0, '其他', 65, 0, 255, 1, '', ''),
(1304, 0, '中号盆栽', 21, 0, 255, 1, '', ''),
(2577, 2, '鲜花', 2558, 0, 255, 1, NULL, NULL),
(1353, 0, '其他', 21, 0, 255, 1, '', ''),
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
(2587, 0, '盆栽花', 63, 0, 255, 1, NULL, NULL),
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
(2542, 0, '花材', 63, 0, 255, 1, '', ''),
(2579, 0, '小号瓷盆', 2, 0, 255, 1, NULL, NULL),
(2555, 2, '绿植', 0, 0, 255, 1, '', ''),
(2556, 2, '大号盆栽', 2555, 0, 255, 1, '', ''),
(2557, 2, '中号盆栽', 2555, 0, 255, 1, '', ''),
(2558, 2, '鲜花', 0, 0, 255, 1, '', ''),
(2559, 2, '花篮', 2558, 0, 255, 1, '', ''),
(2560, 2, '手捧花', 2558, 0, 255, 1, '', ''),
(2571, 2, '小号盆栽', 2555, 0, 255, 1, NULL, NULL),
(2572, 2, '盆', 0, 0, 255, 1, NULL, NULL),
(2573, 2, '瓷盆', 2572, 0, 255, 1, NULL, NULL),
(2574, 2, '塑料盆', 2572, 0, 255, 1, NULL, NULL),
(2575, 2, '玻璃瓶', 2572, 0, 255, 1, NULL, NULL),
(2576, 2, '花材', 2558, 0, 255, 1, NULL, NULL);

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
(83, 2, 'material', '【绿植】幸福树', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695940, 1692698237, 126, 'data/files/store_2/goods/20230822171855630.png.thumb.png', NULL, 1, '600.00', '0.00', '', 1),
(84, 2, 'material', '【绿植】金钱树', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692697875, 1692697875, 127, 'data/files/store_2/goods/20230822175110176.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(42, 2, 'material', '【开业花篮】蓝色+绣球+大飞燕款', '', NULL, 2585, '鲜花、花材	花篮	绿色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692425512, 1692520514, 85, 'data/files/store_2/goods/20230820163512392.jpg.thumb.jpg', NULL, 1, '300.00', '0.00', '', 1),
(43, 2, 'material', '【开业花篮】绿色+绣球款', '', NULL, 2585, '鲜花、花材	花篮	绿色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692504027, 1692520497, 86, 'data/files/store_2/goods/20230820163452303.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(44, 2, 'material', '【开业花篮】橙色+向日葵款', '', NULL, 2580, '鲜花、花材	花篮	橙色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692504118, 1692520467, 87, 'data/files/store_2/goods/20230820163424847.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(45, 2, 'material', '【开业花篮】橙色+向日葵+气球款', '', NULL, 2581, '鲜花、花材	花篮	蓝色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692504201, 1692520438, 88, 'data/files/store_2/goods/20230820163355480.png.thumb.png', NULL, 1, '288.00', '0.00', '', 1),
(47, 2, 'material', '【开业花篮】橙色+气球款', '', NULL, 2580, '鲜花、花材	花篮	橙色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692505201, 1692520401, 90, 'data/files/store_2/goods/20230820163315888.jpg.thumb.jpg', NULL, 1, '230.00', '0.00', '', 1),
(48, 2, 'material', '【开业花篮】红色+红扶郎+百合款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692505248, 1692521114, 91, 'data/files/store_2/goods/20230820163253695.jpg.thumb.jpg', NULL, 1, '230.00', '0.00', '', 1),
(49, 2, 'material', '【开业花篮】红色+大麦款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692505327, 1692520354, 92, 'data/files/store_2/goods/20230820163231543.jpg.thumb.jpg', NULL, 1, '150.00', '0.00', '', 1),
(50, 2, 'material', '【开业花篮】红色+大麦+满天星款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692505381, 1692520333, 93, 'data/files/store_2/goods/20230820163210408.jpg.thumb.jpg', NULL, 1, '180.00', '0.00', '', 1),
(51, 2, 'material', '【开业花篮】红色款+20红玫+红豆款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692505519, 1692521072, 94, 'data/files/store_2/goods/20230820163134314.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(52, 2, 'material', '【开业花篮】红色+扇子款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692507238, 1692520222, 95, 'data/files/store_2/goods/20230820163017580.jpg.thumb.jpg', NULL, 1, '300.00', '0.00', '', 1),
(6, 2, 'material', '【开业花篮】蓝色+绣球+蝴蝶兰款', '', NULL, 2581, '鲜花、花材	花篮	蓝色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1542761845, 1692520661, 6, 'data/files/store_2/goods/20230820163738317.jpg.thumb.jpg', NULL, 1, '688.00', '0.00', '', 1),
(46, 2, 'material', '【开业花篮】橙色+百合款', '', NULL, 2580, '鲜花、花材	花篮	橙色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692504478, 1692520420, 89, 'data/files/store_2/goods/20230820163335872.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(7, 2, 'material', '【开业花篮】蓝色+3株绣球款', '', NULL, 2581, '鲜花、花材	花篮	蓝色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1542761989, 1692520644, 7, 'data/files/store_2/goods/20230820163720658.jpg.thumb.jpg', NULL, 1, '380.00', '0.00', '', 1),
(82, 2, 'material', '【绿植】富贵竹', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695827, 1692695827, 125, 'data/files/store_2/goods/20230822171701600.jpg.thumb.jpg', NULL, 1, '480.00', '0.00', '', 1),
(8, 2, 'material', '【开业花篮】蓝色+2株绣球款', '', NULL, 2583, '鲜花、花材	花篮	粉色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1542762532, 1692520625, 8, 'data/files/store_2/goods/20230820163702147.png.thumb.png', NULL, 1, '360.00', '0.00', '', 1),
(81, 2, 'material', '【绿植】红掌', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695757, 1692695764, 124, 'data/files/store_2/goods/20230822171554165.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(79, 2, 'material', '【绿植】百合竹', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695655, 1692697910, 122, 'data/files/store_2/goods/20230822171409819.jpg.thumb.jpg', NULL, 1, '580.00', '0.00', '', 1),
(80, 2, 'material', '【绿植】竹', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695692, 1692695692, 123, 'data/files/store_2/goods/20230822171447383.jpg.thumb.jpg', NULL, 1, '480.00', '0.00', '', 1),
(10, 2, 'material', '【开业花篮】蓝色+1株绣球款', '', NULL, 2581, '鲜花、花材	花篮	蓝色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1542778238, 1692520568, 10, 'data/files/store_2/goods/20230820163605738.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(78, 2, 'material', '【绿植】太空铁', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695570, 1692695570, 121, 'data/files/store_2/goods/20230822171243862.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(76, 2, 'material', '【绿植】龙血树+多头+中号', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695332, 1692695332, 119, 'data/files/store_2/goods/20230822170842971.jpg.thumb.jpg', NULL, 1, '680.00', '0.00', '', 1),
(77, 2, 'material', '【绿植】摇钱树', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692695490, 1692695490, 120, 'data/files/store_2/goods/20230822171124479.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(73, 2, 'material', '【绿植】千年木', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692693886, 1692697973, 116, 'data/files/store_2/goods/20230822175242642.jpg.thumb.jpg', NULL, 1, '680.00', '0.00', '', 1),
(74, 2, 'material', '【绿植】虎皮兰', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692694070, 1692694070, 117, 'data/files/store_2/goods/20230822164739160.jpg.thumb.jpg', NULL, 1, '300.00', '0.00', '', 1),
(75, 2, 'material', '【绿植】龙血树+多头+大号', '', NULL, 22, '绿植、盆栽	大号盆栽', '', 0, '', '', 1, 0, NULL, 1692695153, 1692695203, 118, 'data/files/store_2/goods/20230822170435898.jpg.thumb.jpg', NULL, 1, '880.00', '0.00', '', 1),
(72, 2, 'material', '【绿植】绿宝', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692693770, 1692693770, 115, 'data/files/store_2/goods/20230822164241342.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(71, 2, 'material', '【绿植】鸭掌木', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692693635, 1692693635, 114, 'data/files/store_2/goods/20230822164029261.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(70, 2, 'material', '【绿植】绿萝柱', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692693496, 1692693496, 113, 'data/files/store_2/goods/20230822163809876.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(69, 2, 'material', '【绿植】天堂鸟+6株', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692693147, 1692693147, 112, 'data/files/store_2/goods/20230822163222218.jpg.thumb.jpg', NULL, 1, '420.00', '0.00', '', 1),
(53, 2, 'material', '【开业花篮】红色+红扶郎+玫瑰款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692507488, 1692520206, 96, 'data/files/store_2/goods/20230820163000298.jpg.thumb.jpg', NULL, 1, '230.00', '0.00', '', 1),
(54, 2, 'material', '【开业花篮】红色+扶郎混搭款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692512735, 1692520017, 97, 'data/files/store_2/goods/20230820162651830.png.thumb.png', NULL, 1, '200.00', '0.00', '', 1),
(55, 2, 'material', '【开业花篮】粉色+百合款', '', NULL, 2583, '鲜花、花材	花篮	粉色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519277, 1692520176, 98, 'data/files/store_2/goods/20230820162934601.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(56, 2, 'material', '【开业花篮】粉色+百合+气球款', '', NULL, 2583, '鲜花、花材	花篮	粉色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519395, 1692520161, 99, 'data/files/store_2/goods/20230820162918116.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(57, 2, 'material', '【开业花篮】粉色+向日葵款', '', NULL, 2583, '鲜花、花材	花篮	粉色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519446, 1692520148, 100, 'data/files/store_2/goods/20230820162905371.png.thumb.png', NULL, 1, '280.00', '0.00', '', 1),
(58, 2, 'material', '【开业花篮】粉色+绣球款', '', NULL, 2583, '鲜花、花材	花篮	粉色系', '', 0, '', '', 1, 0, NULL, 1692519480, 1692520133, 101, 'data/files/store_2/goods/20230820162850882.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(59, 2, 'material', '【开业花篮】粉色+扶郎款', '', NULL, 2583, '鲜花、花材	花篮	粉色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519529, 1692520116, 102, 'data/files/store_2/goods/20230820162833704.jpg.thumb.jpg', NULL, 1, '180.00', '0.00', '', 1),
(60, 2, 'material', '【开业花篮】香槟色+满天星款', '', NULL, 2586, '鲜花、花材	花篮	香槟系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519717, 1692520091, 103, 'data/files/store_2/goods/20230820162807226.jpg.thumb.jpg', NULL, 1, '200.00', '0.00', '', 1),
(61, 2, 'material', '【开业花篮】香槟色+向日葵款', '', NULL, 2586, '鲜花、花材	花篮	香槟系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519757, 1692520079, 104, 'data/files/store_2/goods/20230820162756624.jpg.thumb.jpg', NULL, 1, '288.00', '0.00', '', 1),
(62, 2, 'material', '【开业花篮】紫色+百合款', '', NULL, 2584, '鲜花、花材	花篮	紫色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519850, 1692520062, 105, 'data/files/store_2/goods/20230820162739715.png.thumb.png', NULL, 1, '280.00', '0.00', '', 1),
(63, 2, 'material', '【开业花篮】紫色+绣球款', '', NULL, 2584, '鲜花、花材	花篮	紫色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692519886, 1692520049, 106, 'data/files/store_2/goods/20230820162720730.jpg.thumb.jpg', NULL, 1, '280.00', '0.00', '', 1),
(64, 2, 'material', '【开业花篮】红色+红扶郎款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692687316, 1692687316, 107, 'data/files/store_2/goods/20230822145507332.jpg.thumb.jpg', NULL, 1, '160.00', '0.00', '', 1),
(65, 2, 'material', '【开业花篮】红色+金扶郎款', '', NULL, 2582, '鲜花、花材	花篮	红色系', '博艺花卉', 0, '', '', 1, 0, NULL, 1692687416, 1692687416, 108, NULL, NULL, 1, '160.00', '0.00', '', 1),
(66, 2, 'material', '【绿植】发财树+单株', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692692876, 1692692876, 109, 'data/files/store_2/goods/20230822162749566.jpg.thumb.jpg', NULL, 1, '260.00', '0.00', '', 1),
(67, 2, 'material', '【绿植】发财树+步步高', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692692930, 1692692930, 110, 'data/files/store_2/goods/20230822162842363.jpg.thumb.jpg', NULL, 1, '460.00', '0.00', '', 1),
(68, 2, 'material', '【绿植】天堂鸟+8株', '', NULL, 22, '绿植、盆栽	大号盆栽', '博艺花卉', 0, '', '', 1, 0, NULL, 1692693107, 1692693228, 111, 'data/files/store_2/goods/20230822163344199.jpg.thumb.jpg', NULL, 1, '480.00', '0.00', '', 1);

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
(153, 67, 'data/files/store_2/goods/20230822162842363.jpg', 'data/files/store_2/goods/20230822162842363.jpg.thumb.jpg', 1, 182),
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
(173, 84, 'data/files/store_2/goods/20230822175110176.jpg', 'data/files/store_2/goods/20230822175110176.jpg.thumb.jpg', 1, 202);

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
(127, 84, '', '', '280.00', '0.00', 10000, '', '', 1),
(126, 83, '', '', '600.00', '0.00', 0, '', '', 1),
(125, 82, '', '', '480.00', '0.00', 10000, '', '', 1),
(6, 6, '', '', '688.00', '0.00', 10000, '1000000000006', '', 1),
(7, 7, '', '', '380.00', '0.00', 10000, '1000000000007', '', 1),
(8, 8, '', '', '360.00', '0.00', 10000, '1000000000008', '', 1),
(9, 9, '', '', '120.00', '0.00', 10000, '1000000000008', '', 1),
(10, 10, '', '', '280.00', '0.00', 10000, '1000000000009', '', 1),
(124, 81, '', '', '280.00', '0.00', 10000, '', '', 1),
(123, 80, '', '', '480.00', '0.00', 10000, '', '', 1),
(122, 79, '', '', '580.00', '0.00', 10000, '', '', 1),
(121, 78, '', '', '280.00', '0.00', 10000, '', '', 1),
(120, 77, '', '', '280.00', '0.00', 10000, '', '', 1),
(119, 76, '', '', '680.00', '0.00', 0, '', '', 1),
(118, 75, '', '', '880.00', '0.00', 10000, '', '', 1),
(85, 42, '', '', '300.00', '0.00', 10000, '', '', 1),
(86, 43, '', '', '280.00', '0.00', 10000, '', '', 1),
(87, 44, '', '', '280.00', '0.00', 10000, '', '', 1),
(88, 45, '', '', '288.00', '0.00', 10000, '', '', 1),
(89, 46, '', '', '280.00', '0.00', 10000, '', '', 1),
(90, 47, '', '', '230.00', '0.00', 10000, '', '', 1),
(91, 48, '', '', '230.00', '0.00', 10000, '', '', 1),
(92, 49, '', '', '150.00', '0.00', 10000, '', '', 1),
(93, 50, '', '', '180.00', '0.00', 10000, '', '', 1),
(94, 51, '', '', '280.00', '0.00', 10000, '', '', 1),
(95, 52, '', '', '300.00', '0.00', 10000, '', '', 1),
(96, 53, '', '', '230.00', '0.00', 10000, '', '', 1),
(97, 54, '', '', '200.00', '0.00', 10000, '', '', 1),
(98, 55, '', '', '280.00', '0.00', 10000, '', '', 1),
(99, 56, '', '', '288.00', '0.00', 10000, '', '', 1),
(100, 57, '', '', '280.00', '0.00', 10000, '', '', 1),
(101, 58, '', '', '280.00', '0.00', 10000, '', '', 1),
(102, 59, '', '', '180.00', '0.00', 10000, '', '', 1),
(103, 60, '', '', '200.00', '0.00', 10000, '', '', 1),
(104, 61, '', '', '288.00', '0.00', 10000, '', '', 1),
(105, 62, '', '', '280.00', '0.00', 10000, '', '', 1),
(106, 63, '', '', '280.00', '0.00', 10000, '', '', 1),
(107, 64, '', '', '160.00', '0.00', 10000, '', '', 1),
(108, 65, '', '', '160.00', '0.00', 10000, '', '', 1),
(109, 66, '', '', '260.00', '0.00', 10000, '', '', 1),
(110, 67, '', '', '460.00', '0.00', 10000, '', '', 1),
(111, 68, '', '', '480.00', '0.00', 10000, '', '', 1),
(112, 69, '', '', '420.00', '0.00', 10000, '', '', 1),
(113, 70, '', '', '260.00', '0.00', 10000, '', '', 1),
(114, 71, '', '', '260.00', '0.00', 10000, '', '', 1),
(115, 72, '', '', '280.00', '0.00', 10000, '', '', 1),
(116, 73, '', '', '680.00', '0.00', 10000, '', '', 1),
(117, 74, '', '', '300.00', '0.00', 10000, '', '', 1);

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
(6, 2, 0, 0, 0, 0),
(7, 2, 0, 0, 0, 0),
(11, 2, 0, 0, 0, 0),
(14, 2, 0, 0, 0, 0),
(8, 6, 0, 0, 0, 0),
(10, 4, 0, 0, 0, 0),
(42, 4, 0, 0, 0, 0),
(44, 2, 0, 0, 0, 0),
(47, 4, 0, 0, 0, 0),
(48, 6, 0, 0, 0, 0),
(58, 2, 0, 0, 0, 0),
(46, 4, 0, 0, 0, 0),
(62, 2, 0, 0, 0, 0);

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
(4, '50.00'),
(5, '50.00');

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
(2, 5, 0, '', '50.00', '50.00', 'register_has_integral', 'finished', '', 1691392527);

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
(4, 'middle', '手捧鲜花', 'search/goods.html?cate_id=64', 3, 1, 0, 0),
(5, 'middle', '室内小盆栽', 'http://shopwind.byhh.com/search/goods.html?cate_id=1313', 4, 1, 0, 0),
(6, 'middle', '积分商城', 'integral/index.html', 255, 1, 0, 0),
(7, 'middle', '限时促销', 'limitbuy/index.html', 255, 1, 0, 0),
(8, 'middle', '花艺培训', 'brand/index.html', 255, 1, 0, 0);

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
(1, '16913925338196992', 'material', 'normal', 2, '博艺花卉', 5, 'wdlfz2023', '', 11, 1691392533, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '2999.00', '0.00', '3009.00', 0, NULL, '0.00', '0.00', 0, '', 0, 0, '', 0, NULL, '0.00', 0),
(2, '16913934426786202', 'material', 'normal', 2, '博艺花卉', 5, 'wdlfz2023', '', 11, 1691393442, NULL, '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '18978.00', '0.00', '18998.00', 0, NULL, '0.00', '0.00', 0, '', 0, 0, '', 0, NULL, '0.00', 0);

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
  `zipcode` varchar(20) DEFAULT '',
  `phone_tel` varchar(60) DEFAULT '',
  `phone_mob` varchar(20) DEFAULT '',
  `shipping_name` varchar(100) DEFAULT NULL,
  `shipping_fee` decimal(10,2) DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `swd_order_extm`
--

INSERT INTO `swd_order_extm` (`order_id`, `consignee`, `region_id`, `region_name`, `address`, `signature`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_name`, `shipping_fee`) VALUES
(1, '玖续服饰', 284, '湖北省 武汉', '云尚5C、050号', '维多利纺织', '', '', '', '快递', '10.00'),
(2, '玖续服饰', 284, '湖北省 武汉', '云尚5C、050号', '维多利纺织', '', '', '', '快递', '20.00');

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
(1, 1, 1, '三星（SAMSUNG）UA55MUF30ZJXXZ 55英寸 4K超高清 智能网络 液晶平板电视 黑色', 1, '', '2999.00', 1, 'http://shopwind.byhh.com/data/files/store_2/goods/20181121161206467.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(2, 2, 2, '索尼（SONY）KD-55A8F 55英寸 OLED 4K HDR安卓7.0智能电视（黑色）', 2, '', '12999.00', 1, 'http://shopwind.byhh.com/data/files/store_2/goods/20181121162709932.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(3, 2, 26, '【以旧换新 门店现货】Samsung/三星 Galaxy S9 SM-G9600曲屏手机', 26, '', '5499.00', 1, 'http://shopwind.byhh.com/data/files/store_2/goods/20181121224125388.jpg', 0, '', 1, NULL, NULL, '', '', 0, ''),
(4, 2, 27, '【发财树】单株', 27, '', '480.00', 1, 'http://shopwind.byhh.com/data/system/default_goods_image.jpg', 0, '', 1, NULL, NULL, '', '', 0, '');

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
(3, 'payment', 'cod', '货到付款', '货到付款', '开通城市: 请在“可货到付款地区”项中设置', '', 1);

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
(83, 84, 'exclusive', 2, '', 0, 1692697875);

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

-- --------------------------------------------------------

--
-- 表的结构 `swd_recommend_goods`
--

CREATE TABLE `swd_recommend_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `recom_id` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
(1, '系统默认', 100, 50, '0', 0, '测试用户请选择“默认等级”，可以立即开通', 'default|default', 'default|default', 255),
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
(2, '博艺花卉', '郭惠', '1234567890', 284, '  湖北省	武汉', '汉正街华贸二号楼1-81号', '', '13476299284', 1, 'personal', 0, '', '0.00', '0.00', NULL, 1, '', 1542757210, 1924991999, 'autonym', 255, 1, 'default', '', 'data/files/store_2/other/store_logo.png', '', '', '', '', '', '[{\"url\":\"data\\/files\\/store_2\\/swiper\\/swiper_1.jpg\",\"link\":\"https:\\/\\/www.shopwind.net\"},{\"url\":\"data\\/files\\/store_2\\/swiper\\/swiper_2.jpg\",\"link\":\"\"},{\"url\":\"data\\/files\\/store_2\\/swiper\\/swiper_3.jpg\",\"link\":\"\"}]', '', '', 15);

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
(202, 2, 'jpg', 412649, '微信图片_20230819183213_1.jpg', 'data/files/store_2/goods/20230822175110176.jpg', 1692697870, 2, 84, '');

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
(1, 'admin', '', '', '$2y$13$UJTcYuaRSNl.xriXNycEmueS.9DApXTRiS9.riet7Q2OWIyo81yuG', '', NULL, 0, '', '', '', '', 1691384292, 1692425963, 1692425964, '127.0.0.1', 5, 1, NULL, NULL, 0, 0, ''),
(2, 'seller', '', '', '$2y$13$cFZiBKonrs9jr6tucl2axezpg4xf7k1dQ11qDT2sfGJ3c7dU3V6aK', '', NULL, 0, '', '', '', '', 1691384295, 1692687187, 1692687187, '127.0.0.1', 4, 1, NULL, NULL, 0, 0, 'y34xInnSbxuW2glT4EPeY7ANwRBofp9R'),
(3, 'buyer', '', '', '$2y$13$nvB7/gH5o9C1qfo7ZwuAo.AJrrrAYlmh.0gz.RphoTN5iKHAitq4e', '', NULL, 0, '', '', '', '', 1691384295, 1692166806, 1692166807, '127.0.0.1', 3, 1, NULL, NULL, 0, 0, 'uTwCnRs4ww2TRwvpdjMhs0_MzITyePu5'),
(4, 'gh2023', '', '', '$2y$13$wENfONtm6Y.eIQMSxPofwucvpV26Z3T2gMbv2sSWtGKCD2fuebQ2i', '', '郭惠', 0, '', '', '15210723549', '', 1691391477, 1691391703, 1691391704, '127.0.0.1', 2, 1, NULL, NULL, 0, 0, 'I-9wQByxbGRG_d2__ozFjK7A6tqX0BI-'),
(5, 'wdlfz2023', '', '', '$2y$13$pDgnUDF54hUXd5UbKnlWLeEzvDPqBDklhedcZIHMEIfyaJfgIHI56', '', '维多利纺织', 0, '', '', '', '', 1691392526, 1691392526, 1691392526, '127.0.0.1', 1, 1, NULL, NULL, 0, 0, 'mJCEEK7lrXq6KZcnSR7TGCZe1oNrjpur');

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
(5, 1, 'admin', 'backend', '127.0.0.1', NULL, 1692425964);

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
  MODIFY `cate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `swd_address`
--
ALTER TABLE `swd_address`
  MODIFY `addr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `article_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `rec_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `swd_cashcard`
--
ALTER TABLE `swd_cashcard`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_category_goods`
--
ALTER TABLE `swd_category_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=490;

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
  MODIFY `coupon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `swd_delivery_template`
--
ALTER TABLE `swd_delivery_template`
  MODIFY `template_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `swd_deposit_account`
--
ALTER TABLE `swd_deposit_account`
  MODIFY `account_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `swd_deposit_recharge`
--
ALTER TABLE `swd_deposit_recharge`
  MODIFY `recharge_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_deposit_record`
--
ALTER TABLE `swd_deposit_record`
  MODIFY `record_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `trade_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `cate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2588;

--
-- 使用表AUTO_INCREMENT `swd_goods`
--
ALTER TABLE `swd_goods`
  MODIFY `goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- 使用表AUTO_INCREMENT `swd_goods_image`
--
ALTER TABLE `swd_goods_image`
  MODIFY `image_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

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
  MODIFY `spec_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- 使用表AUTO_INCREMENT `swd_guideshop`
--
ALTER TABLE `swd_guideshop`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_integral_log`
--
ALTER TABLE `swd_integral_log`
  MODIFY `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `msg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `nav_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `swd_order`
--
ALTER TABLE `swd_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `swd_order_goods`
--
ALTER TABLE `swd_order_goods`
  MODIFY `rec_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `swd_order_log`
--
ALTER TABLE `swd_order_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_partner`
--
ALTER TABLE `swd_partner`
  MODIFY `partner_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_plugin`
--
ALTER TABLE `swd_plugin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `swd_promotool_item`
--
ALTER TABLE `swd_promotool_item`
  MODIFY `piid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- 使用表AUTO_INCREMENT `swd_promotool_setting`
--
ALTER TABLE `swd_promotool_setting`
  MODIFY `psid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_recommend`
--
ALTER TABLE `swd_recommend`
  MODIFY `recom_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_recommend_goods`
--
ALTER TABLE `swd_recommend_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_refund`
--
ALTER TABLE `swd_refund`
  MODIFY `refund_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `swd_refund_message`
--
ALTER TABLE `swd_refund_message`
  MODIFY `rm_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- 使用表AUTO_INCREMENT `swd_user`
--
ALTER TABLE `swd_user`
  MODIFY `userid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `swd_user_enter`
--
ALTER TABLE `swd_user_enter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
