-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-08-01 23:11:52
-- 服务器版本： 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `www`
--
CREATE DATABASE IF NOT EXISTS `www` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `www`;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_action`
--

DROP TABLE IF EXISTS `ocenter_action`;
CREATE TABLE IF NOT EXISTS `ocenter_action` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '修改时间',
  `module` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11000 DEFAULT CHARSET=utf8 COMMENT='系统行为表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ocenter_action`
--

INSERT INTO `ocenter_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`, `module`) VALUES
(1, 'reg', '用户注册', '用户注册', '', '', 1, 1, 1426070545, ''),
(2, 'input_password', '输入密码', '记录输入密码的次数。', '', '', 1, 1, 1426122119, ''),
(3, 'user_login', '用户登录', '积分+10，每天一次', 'a:1:{i:0;a:5:{s:5:\"table\";s:6:\"member\";s:5:\"field\";s:1:\"1\";s:4:\"rule\";s:2:\"10\";s:5:\"cycle\";s:2:\"24\";s:3:\"max\";s:1:\"1\";}}', '[user|get_nickname]在[time|time_format]登录了账号', 1, 1, 1428397656, ''),
(4, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988, ''),
(7, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301, ''),
(8, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392, ''),
(10001, 'add_weibo', '发布微博', '新增微博', 'a:1:{i:0;a:5:{s:5:\"table\";s:6:\"member\";s:5:\"field\";s:1:\"1\";s:4:\"rule\";s:2:\"+1\";s:5:\"cycle\";s:2:\"24\";s:3:\"max\";s:2:\"10\";}}', '[user|get_nickname]在[time|time_format]发布了新微博：[record|intval]', 1, 1, 1437116716, 'Weibo'),
(10002, 'add_weibo_comment', '添加微博评论', '添加微博评论', 'a:1:{i:0;a:5:{s:5:\"table\";s:6:\"member\";s:5:\"field\";s:1:\"1\";s:4:\"rule\";s:2:\"+1\";s:5:\"cycle\";s:2:\"24\";s:3:\"max\";s:2:\"10\";}}', '[user|get_nickname]在[time|time_format]添加了微博评论：[record|intval]', 1, 1, 1437116734, 'Weibo'),
(10003, 'del_weibo_comment', '删除微博评论', '删除微博评论', '', '[user|get_nickname]在[time|time_format]删除了微博评论：[record|intval]', 1, 1, 1428399164, 'Weibo'),
(10004, 'del_weibo', '删除微博', '删除微博', '', '[user|get_nickname]在[time|time_format]删除了微博：[record|intval]', 1, 1, 1428461334, 'Weibo'),
(10005, 'set_weibo_top', '置顶微博', '置顶微博', '', '[user|get_nickname]在[time|time_format]置顶了微博：[record|intval]', 1, 1, 1428399164, 'Weibo'),
(10006, 'set_weibo_down', '取消置顶微博', '取消置顶微博', '', '[user|get_nickname]在[time|time_format]取消置顶了微博：[record|intval]', 1, 1, 1428462983, 'Weibo');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_action_limit`
--

DROP TABLE IF EXISTS `ocenter_action_limit`;
CREATE TABLE IF NOT EXISTS `ocenter_action_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `frequency` int(11) NOT NULL,
  `time_number` int(11) NOT NULL,
  `time_unit` varchar(50) NOT NULL,
  `punish` text NOT NULL,
  `if_message` tinyint(4) NOT NULL,
  `message_content` text NOT NULL,
  `action_list` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `module` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_action_limit`
--

INSERT INTO `ocenter_action_limit` (`id`, `title`, `name`, `frequency`, `time_number`, `time_unit`, `punish`, `if_message`, `message_content`, `action_list`, `status`, `create_time`, `module`) VALUES
(1, 'reg', '注册限制', 1, 1, 'minute', 'warning', 0, '', '[reg]', 1, 0, ''),
(2, 'input_password', '输密码', 3, 1, 'minute', 'warning', 0, '', '[input_password]', 1, 0, ''),
(3, 'add_weibo', '新增微博', 1, 10, 'second', 'warning', 0, '', '[add_weibo]', 1, 0, 'Weibo'),
(4, 'add_weibo_comment', '添加微博评论', 1, 10, 'second', 'warning', 0, '', '[add_weibo_comment]', 1, 0, 'Weibo');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_action_log`
--

DROP TABLE IF EXISTS `ocenter_action_log`;
CREATE TABLE IF NOT EXISTS `ocenter_action_log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='行为日志表' ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `ocenter_action_log`
--

INSERT INTO `ocenter_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 3, 1, 0, 'member', 1, 'admin在2018-06-04 19:32登录了账号【积分：+10分】', 1, 1528111937),
(2, 3, 1, 0, 'member', 1, 'admin在2018-06-04 19:32登录了账号', 1, 1528111938),
(3, 3, 1, 0, 'member', 1, 'admin在2018-06-04 19:32登录了账号', 1, 1528111939),
(4, 3, 1, 0, 'member', 1, 'admin在2018-06-04 19:32登录了账号', 1, 1528111939),
(5, 3, 1, 0, 'member', 1, 'admin在2018-06-04 19:32登录了账号', 1, 1528111940),
(6, 3, 1, 0, 'member', 1, 'admin在2018-06-04 19:55登录了账号', 1, 1528113353),
(7, 3, 1, 0, 'member', 1, 'admin在2018-06-04 23:12登录了账号', 1, 1528125121),
(8, 3, 1, 0, 'member', 1, 'admin在2018-06-04 23:22登录了账号', 1, 1528125773),
(9, 3, 1, 0, 'member', 1, 'admin在2018-06-05 00:17登录了账号', 1, 1528129039),
(10, 3, 1, 0, 'member', 1, 'admin在2018-06-05 11:01登录了账号', 1, 1528167701),
(11, 3, 1, 0, 'member', 1, 'admin在2018-06-05 11:16登录了账号', 1, 1528168591),
(12, 1, 1, 0, 'ucenter_member', 1, '操作url：/opensns/index.php?s=/ucenter/member/register.html', 1, 1528722914),
(13, 1, 1, 0, 'ucenter_member', 1, '操作url：/opensns/index.php?s=/ucenter/member/register.html', 1, 1528722914),
(14, 3, 100, 0, 'member', 100, 'zsl在2018-06-11 21:15登录了账号', 1, 1528722914),
(15, 3, 100, 0, 'member', 100, 'zsl在2018-06-11 21:15登录了账号', 1, 1528722914),
(16, 2, 100, 0, 'ucenter_member', 100, '操作url：/opensns/index.php?s=/ucenter/member/login.html', 1, 1530625425),
(17, 3, 1, 0, 'member', 1, 'admin在2018-07-03 21:44登录了账号【积分：+10分】', 1, 1530625480),
(18, 10001, 1, 0, 'weibo', 1, 'admin在2018-07-03 21:47发布了新微博：1【积分：+1分】', 1, 1530625646),
(19, 1, 1, 0, 'ucenter_member', 1, '操作url：/opensns/index.php?s=/ucenter/member/register.html', 1, 1530625756),
(20, 3, 102, 0, 'member', 102, 'zsl1996在2018-07-03 21:49登录了账号【积分：+10分】', 1, 1530625757),
(21, 10002, 102, 0, 'weibo_comment', 1, 'zsl1996在2018-07-03 21:50添加了微博评论：1【积分：+1分】', 1, 1530625801),
(22, 3, 1, 0, 'member', 1, 'admin在2018-07-03 21:51登录了账号', 1, 1530625890),
(23, 3, 1, 0, 'member', 1, '大数据实验室在2018-07-03 22:36登录了账号', 1, 1530628595),
(24, 3, 1, 0, 'member', 1, '大数据实验室在2018-07-27 16:59登录了账号【积分：+10分】', 1, 1532681966),
(25, 1, 1, 0, 'ucenter_member', 1, '操作url：/opensns/index.php?s=/ucenter/member/register.html', 1, 1532684283),
(26, 3, 103, 0, 'member', 103, 'kkk在2018-07-27 17:38登录了账号【积分：+10分】', 1, 1532684283),
(27, 3, 1, 0, 'member', 1, '大数据实验室在2018-07-27 17:44登录了账号', 1, 1532684667),
(28, 3, 1, 0, 'member', 1, '大数据实验室在2018-07-27 20:59登录了账号', 1, 1532696351),
(29, 3, 1, 0, 'member', 1, '大数据实验室在2018-07-27 21:56登录了账号', 1, 1532699781),
(30, 1, 1, 0, 'ucenter_member', 1, '操作url：/opensns/index.php?s=/ucenter/member/register.html', 1, 1532700251),
(31, 3, 104, 0, 'member', 104, 'zsl19960523在2018-07-27 22:04登录了账号【积分：+10分】', 1, 1532700252),
(32, 1, 1, 0, 'ucenter_member', 1, '操作url：/opensns/index.php?s=/ucenter/member/register.html', 1, 1532702229),
(33, 3, 105, 0, 'member', 105, 'zslq在2018-07-27 22:37登录了账号【积分：+10分】', 1, 1532702229),
(34, 10001, 105, 0, 'weibo', 2, 'MSRA、在2018-07-27 23:20发布了新微博：2【积分：+1分】', 1, 1532704833),
(35, 10002, 105, 0, 'weibo_comment', 2, 'MSRA、在2018-07-27 23:21添加了微博评论：2【积分：+1分】', 1, 1532704880),
(36, 1, 1, 0, 'ucenter_member', 1, '操作url：/opensns/index.php?s=/ucenter/member/register.html', 1, 1532743149),
(37, 3, 106, 0, 'member', 106, 'zzz在2018-07-28 09:59登录了账号【积分：+10分】', 1, 1532743150),
(38, 10001, 106, 0, 'weibo', 3, 'zzz在2018-07-28 10:27发布了新微博：3【积分：+1分】', 1, 1532744862),
(39, 10002, 106, 0, 'weibo_comment', 3, 'zzz在2018-07-28 10:28添加了微博评论：3【积分：+1分】', 1, 1532744895),
(40, 1, 1, 0, 'ucenter_member', 1, '操作url：/opensns/index.php?s=/ucenter/member/register.html', 1, 1532744977),
(41, 3, 107, 0, 'member', 107, 'zzzz在2018-07-28 10:29登录了账号【积分：+10分】', 1, 1532744977),
(42, 10002, 107, 0, 'weibo_comment', 4, 'zzzz在2018-07-28 10:30添加了微博评论：4【积分：+1分】', 1, 1532745031),
(43, 1, 1, 0, 'ucenter_member', 1, '操作url：/opensns/index.php?s=/ucenter/member/register.html', 1, 1532747044),
(44, 3, 108, 0, 'member', 108, 'zslzsl在2018-07-28 11:04登录了账号【积分：+10分】', 1, 1532747044),
(45, 3, 108, 0, 'member', 108, '讯飞语音在2018-07-28 11:05登录了账号', 1, 1532747137),
(46, 10001, 108, 0, 'weibo', 4, '讯飞语音在2018-07-28 11:13发布了新微博：4【积分：+1分】', 1, 1532747631),
(47, 10002, 108, 0, 'weibo_comment', 5, '讯飞语音在2018-07-28 11:14添加了微博评论：5【积分：+1分】', 1, 1532747663),
(48, 3, 108, 0, 'member', 108, '讯飞语音在2018-07-28 15:45登录了账号', 1, 1532763916),
(49, 3, 108, 0, 'member', 108, '讯飞语音在2018-07-28 15:55登录了账号', 1, 1532764517),
(50, 10001, 108, 0, 'weibo', 5, '讯飞语音在2018-07-28 16:04发布了新微博：5【积分：+1分】', 1, 1532765068),
(51, 10002, 108, 0, 'weibo_comment', 6, '讯飞语音在2018-07-28 16:04添加了微博评论：6【积分：+1分】', 1, 1532765090),
(52, 10002, 108, 0, 'weibo_comment', 7, '讯飞语音在2018-07-28 16:05添加了微博评论：7【积分：+1分】', 1, 1532765156),
(53, 10001, 108, 0, 'weibo', 6, '讯飞语音在2018-07-28 16:06发布了新微博：6【积分：+1分】', 1, 1532765197),
(54, 10002, 108, 0, 'weibo_comment', 8, '讯飞语音在2018-07-28 16:06添加了微博评论：8【积分：+1分】', 1, 1532765214),
(55, 1, 1, 0, 'ucenter_member', 1, '操作url：/opensns/index.php?s=/ucenter/member/register.html', 1, 1532765715),
(56, 3, 109, 0, 'member', 109, 'zzzzzzz在2018-07-28 16:15登录了账号【积分：+10分】', 1, 1532765715),
(57, 10002, 109, 0, 'weibo_comment', 9, 'zzzzzzz在2018-07-28 16:15添加了微博评论：9【积分：+1分】', 1, 1532765755),
(58, 10001, 109, 0, 'weibo', 7, 'zzzzzzz在2018-07-28 16:16发布了新微博：7【积分：+1分】', 1, 1532765770),
(59, 3, 108, 0, 'member', 108, '讯飞语音在2018-07-28 16:16登录了账号', 1, 1532765788),
(60, 10001, 108, 0, 'weibo', 8, '讯飞语音在2018-07-28 16:33发布了新微博：8【积分：+1分】', 1, 1532766791),
(61, 3, 108, 0, 'member', 108, '讯飞语音在2018-07-30 04:42登录了账号【积分：+10分】', 1, 1532896928),
(62, 3, 108, 0, 'member', 108, '讯飞语音在2018-07-31 17:01登录了账号【积分：+10分】', 1, 1533027691),
(63, 3, 108, 0, 'member', 108, '讯飞语音在2018-08-01 13:30登录了账号', 1, 1533101451);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_addons`
--

DROP TABLE IF EXISTS `ocenter_addons`;
CREATE TABLE IF NOT EXISTS `ocenter_addons` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='插件表';

--
-- 转存表中的数据 `ocenter_addons`
--

INSERT INTO `ocenter_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(7, 'CheckIn', '签到', '签到插件', 1, '{\"random\":\"1\"}', 'xjw129xjt(肖骏涛)', '0.1', 1432791968, 0),
(8, 'Support', '赞', '赞的功能', 1, 'null', '嘉兴想天信息科技有限公司', '0.1', 1432792013, 0),
(9, 'SuperLinks', '合作单位', '合作单位', 1, '{\"random\":\"1\"}', '苏南 newsn.net', '0.1', 1432792019, 1),
(10, 'Report', '举报后台', '可举报不法数据', 1, '{\"meta\":\"\"}', '想天科技xuminwei', '0.1', 1432792026, 1),
(11, 'LocalComment', '本地评论', '本地评论插件，不依赖社会化评论平台', 1, '{\"can_guest_comment\":\"0\"}', 'caipeichao', '0.1', 1432792035, 0),
(12, 'ChinaCity', '中国省市区三级联动', '每个系统都需要的一个中国省市区三级联动插件。想天-駿濤修改，将镇级地区移除', 1, 'null', 'i友街', '2.0', 1432792040, 0),
(13, 'Recommend', '推荐关注', '可选择多种方法推荐用户', 1, '{\"howToRecommend\":\"1\",\"howManyRecommend\":\"1\",\"recommendUser\":\"1\"}', '嘉兴想天信息科技有限公司', '0.1', 1432792055, 1),
(14, 'SyncLogin', '同步登陆', '同步登陆', 1, '{\"type\":null,\"meta\":\"\",\"bind\":\"0\",\"QqKEY\":\"\",\"QqSecret\":\"\",\"SinaKEY\":\"\",\"SinaSecret\":\"\",\"WeixinKEY\":\"\",\"WeixinSecret\":\"\"}', 'xjw129xjt', '0.1', 1432792112, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_adv`
--

DROP TABLE IF EXISTS `ocenter_adv`;
CREATE TABLE IF NOT EXISTS `ocenter_adv` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告名称',
  `pos_id` int(11) NOT NULL COMMENT '广告位置',
  `data` text NOT NULL COMMENT '图片地址',
  `click_count` int(11) NOT NULL COMMENT '点击量',
  `url` varchar(500) NOT NULL COMMENT '链接地址',
  `sort` int(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '开始时间',
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) UNSIGNED DEFAULT '0' COMMENT '结束时间',
  `target` varchar(20) DEFAULT '_blank',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='广告表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_adv_pos`
--

DROP TABLE IF EXISTS `ocenter_adv_pos`;
CREATE TABLE IF NOT EXISTS `ocenter_adv_pos` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL,
  `title` char(80) NOT NULL DEFAULT '' COMMENT '广告位置名称',
  `path` varchar(100) NOT NULL COMMENT '所在路径 模块/控制器/方法',
  `type` int(11) UNSIGNED NOT NULL DEFAULT '1' COMMENT '广告位类型 \r\n1.单图\r\n2.多图\r\n3.文字链接\r\n4.代码',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `data` varchar(500) NOT NULL COMMENT '额外的数据',
  `width` char(20) NOT NULL DEFAULT '' COMMENT '广告位置宽度',
  `height` char(20) NOT NULL DEFAULT '' COMMENT '广告位置高度',
  `margin` varchar(50) NOT NULL COMMENT '边缘',
  `padding` varchar(50) NOT NULL COMMENT '留白',
  `theme` varchar(50) NOT NULL DEFAULT 'all' COMMENT '适用主题，默认为all，通用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='广告位置表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ocenter_adv_pos`
--

INSERT INTO `ocenter_adv_pos` (`id`, `name`, `title`, `path`, `type`, `status`, `data`, `width`, `height`, `margin`, `padding`, `theme`) VALUES
(1, 'right_below_all', '右侧底部广告', 'Weibo/Index/index', 1, 1, '0', '280px', '100px', '', '', 'all'),
(2, 'below_checkrank', '签到下方广告', 'Weibo/Index/index', 1, 1, '0', '280px', '100px', '0 0 10px 0', '', 'all'),
(3, 'filter_right', '过滤右方', 'Weibo/Index/index', 3, 1, '0', '300px', '30px', '', '', 'all'),
(10, 'below_post_content', '帖子主题下方广告1', 'Forum/Index/index', 1, 1, '0', '680px', '100px', '', '', 'all'),
(11, 'below_post_content', '论坛帖子主题下方广告', 'Forum/Index/detail', 1, 1, '', '680px', '100px', '', '', 'all'),
(4, 'below_self_info', '个人资料下方', 'Weibo/Index/index', 1, 1, '', '280px', '100px', '0 0 10px 0', '', 'all'),
(5, 'index_top', '资讯首页顶部广告', 'News/Index/index', 2, 1, '', '738px', '240px', '', '', 'all'),
(6, 'index_bottom_top', '资讯首页右侧最底部广告', 'News/Index/index', 1, 1, '', '360px', '120px', '10px 0 0 0', '', 'all'),
(9, 'slider', '首页轮播图', 'Home/Index/index', 2, 1, '{\"style\":1}', '1120px', '300px', '0 0 15px 0', '', 'all'),
(7, 'index_right_top', '资讯首页右侧最顶部广告', 'News/Index/index', 1, 1, '[]', '360px', '120px', '0 0 10px 0', '', 'all'),
(8, 'below_article_content', '资讯文章内容下方广告', 'News/Index/detail', 1, 1, '', '690px', '100px', '', '', 'all');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_announce`
--

DROP TABLE IF EXISTS `ocenter_announce`;
CREATE TABLE IF NOT EXISTS `ocenter_announce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `is_force` tinyint(4) NOT NULL COMMENT '是否强制推送',
  `content` text NOT NULL,
  `link` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `arrive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公告表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_announce_arrive`
--

DROP TABLE IF EXISTS `ocenter_announce_arrive`;
CREATE TABLE IF NOT EXISTS `ocenter_announce_arrive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `announce_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公告确认记录';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_attachment`
--

DROP TABLE IF EXISTS `ocenter_attachment`;
CREATE TABLE IF NOT EXISTS `ocenter_attachment` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_attest`
--

DROP TABLE IF EXISTS `ocenter_attest`;
CREATE TABLE IF NOT EXISTS `ocenter_attest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `attest_type_id` int(11) NOT NULL COMMENT '认证类型id',
  `child_type` varchar(25) NOT NULL COMMENT '认证称号',
  `company_name` varchar(250) NOT NULL COMMENT '公司名',
  `name` varchar(50) NOT NULL COMMENT '真实姓名',
  `id_num` varchar(25) NOT NULL COMMENT '身份证号码',
  `phone` varchar(25) NOT NULL COMMENT '联系方式',
  `image_type` varchar(50) NOT NULL COMMENT '证件类型',
  `prove_image` varchar(100) NOT NULL COMMENT '企业证明、组织证明材料图片ids',
  `image` varchar(100) NOT NULL COMMENT '身份证正反面照ids',
  `other_image` varchar(100) NOT NULL COMMENT '手持身份证或其他证明材料',
  `info` text NOT NULL COMMENT '认证补充',
  `reason` varchar(200) NOT NULL COMMENT '认证失败原因',
  `status` tinyint(4) NOT NULL COMMENT '认证状态',
  `create_time` int(11) NOT NULL COMMENT '发起认证时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='认证表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_attest_type`
--

DROP TABLE IF EXISTS `ocenter_attest_type`;
CREATE TABLE IF NOT EXISTS `ocenter_attest_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL COMMENT '认证类型标识',
  `title` varchar(25) NOT NULL COMMENT '标题',
  `logo` int(11) NOT NULL COMMENT '图标',
  `privilege` varchar(25) NOT NULL COMMENT '特权标识，1：专属认证图标；2：优先推荐；3：各类特权',
  `conditions` varchar(200) NOT NULL COMMENT '条件，avatar：1；phone：1；follow：30；fans：30；friends：2',
  `fields` text NOT NULL COMMENT '字段配置',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `description` text NOT NULL COMMENT '认证说明',
  `tips` varchar(200) NOT NULL COMMENT '认证小提示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='认证类型';

--
-- 转存表中的数据 `ocenter_attest_type`
--

INSERT INTO `ocenter_attest_type` (`id`, `name`, `title`, `logo`, `privilege`, `conditions`, `fields`, `status`, `description`, `tips`) VALUES
(1, 'personal', '社团认证', 0, '1,2,3', 'avatar:1|phone:0|follow:0|fans:0|friends:0', 'child_type:1|child_type_option:linux协会,科大网红，体育达人|company_name:0|name:1|id_num:1|phone:1|image_type:1|image_type_option:身份证，驾驶证|prove_image:0|image:1|other_image:2|other_image_tip:请上传手持身份证高清正面照|info:2', 1, '<p><span style=\"color: rgb(255, 0, 0);line-height:30px;\">请详细阅读本说明</span></p><p>1.信息必须真实</p><p>2.证件必须清晰可见</p><p>3.信息必须真实</p><p>4.信息必须真实</p><p>5.信息必须真实</p>', '为科大各社团提供认证服务'),
(2, 'organization', '实验室认证', 0, '1,2,3', 'avatar:1|phone:1|follow:30|fans:30|friends:2', 'child_type:1|child_type_option:实验室认证，学校认证|company_name:1|name:2|id_num:2|phone:1|image_type:1|image_type_option:组织机构代码证|prove_image:1|image:0|other_image:2|other_image_tip:请上传代表人的个人身份证、手持身份证高清正面照和其他证明材料|info:2', 1, '<p style=\"white-space: normal;\"><span style=\"color: rgb(255, 0, 0); line-height: 30px;\">请详细阅读本说明</span></p><p style=\"white-space: normal;\">1.信息必须真实</p><p style=\"white-space: normal;\">2.证件必须清晰可见</p><p style=\"white-space: normal;\">3.信息必须真实</p><p style=\"white-space: normal;\">4.信息必须真实</p><p style=\"white-space: normal;\">5.信息必须真实</p><p><br/></p>', '为各实验室提供认证服务'),
(3, 'company', '企业认证', 0, '1,2,3', 'avatar:1|phone:1|follow:50|fans:30|friends:5', 'child_type:1|child_type_option:BAT，网易，小型初创企业，微型企业|company_name:1|name:2|id_num:2|phone:1|image_type:1|image_type_option:组织机构代码证|prove_image:1|image:0|other_image:2|other_image_tip:请上传其他证明材料|info:2', 1, '<p style=\"white-space: normal;\"><span style=\"color: rgb(255, 0, 0); line-height: 30px;\">请详细阅读本说明</span></p><p style=\"white-space: normal;\">1.信息必须真实</p><p style=\"white-space: normal;\">2.证件必须清晰可见</p><p style=\"white-space: normal;\">3.信息必须真实</p><p style=\"white-space: normal;\">4.信息必须真实</p><p style=\"white-space: normal;\">5.信息必须真实</p><p><br/></p>', '为各种寻求人才或者技术帮助的企业提供认证服务');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_auth_extend`
--

DROP TABLE IF EXISTS `ocenter_auth_extend`;
CREATE TABLE IF NOT EXISTS `ocenter_auth_extend` (
  `group_id` mediumint(10) UNSIGNED NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) UNSIGNED NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组与分类的对应关系表';

--
-- 转存表中的数据 `ocenter_auth_extend`
--

INSERT INTO `ocenter_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_auth_group`
--

DROP TABLE IF EXISTS `ocenter_auth_group`;
CREATE TABLE IF NOT EXISTS `ocenter_auth_group` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '权限组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '权限组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限组状态：为1正常，为0禁用,-1为删除',
  `rules` text NOT NULL COMMENT '权限组拥有的规则id，多个规则 , 隔开',
  `end_time` int(11) NOT NULL DEFAULT '2000000000' COMMENT '有效期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_auth_group`
--

INSERT INTO `ocenter_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`, `end_time`) VALUES
(1, 'admin', 1, '普通用户', '', 1, ',338,340,341,344', 2000000000),
(2, 'admin', 1, 'VIP', '', 1, ',338,340,341,344', 2000000000);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_auth_group_access`
--

DROP TABLE IF EXISTS `ocenter_auth_group_access`;
CREATE TABLE IF NOT EXISTS `ocenter_auth_group_access` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) UNSIGNED NOT NULL COMMENT '权限组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_auth_group_access`
--

INSERT INTO `ocenter_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_auth_rule`
--

DROP TABLE IF EXISTS `ocenter_auth_rule`;
CREATE TABLE IF NOT EXISTS `ocenter_auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_auth_rule`
--

INSERT INTO `ocenter_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/mydocument', '资讯', -1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '插件', -1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', -1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', -1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', -1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', -1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', -1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', -1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', -1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', -1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', -1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', -1, ''),
(17, 'admin', 1, 'Admin/article/index', '文档列表', -1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', -1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存权限组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', -1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', -1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', -1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', -1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', -1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', -1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', -1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', -1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', -1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', -1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', -1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', -1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', -1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', -1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', -1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', -1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', -1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存权限组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', -1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', -1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', -1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', -1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', -1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', -1, ''),
(217, 'admin', 1, 'Admin/Forum/forum', '板块管理', -1, ''),
(218, 'admin', 1, 'Admin/Forum/post', '帖子管理', -1, ''),
(219, 'admin', 1, 'Admin/Forum/editForum', '编辑／发表帖子', -1, ''),
(220, 'admin', 1, 'Admin/Forum/editPost', 'edit pots', -1, ''),
(221, 'admin', 2, 'Admin//Admin/Forum/index', '讨论区', -1, ''),
(222, 'admin', 2, 'Admin//Admin/Weibo/index', '微博', -1, ''),
(223, 'admin', 1, 'Admin/Forum/sortForum', '排序', -1, ''),
(224, 'admin', 1, 'Admin/SEO/editRule', '新增、编辑', 1, ''),
(225, 'admin', 1, 'Admin/SEO/sortRule', '排序', 1, ''),
(226, 'admin', 1, 'Admin/SEO/index', 'SEO规则管理', 1, ''),
(227, 'admin', 1, 'Admin/Forum/editReply', '新增 编辑', -1, ''),
(228, 'admin', 1, 'Admin/Weibo/editComment', '编辑回复', 1, ''),
(229, 'admin', 1, 'Admin/Weibo/editWeibo', '编辑微博', 1, ''),
(230, 'admin', 1, 'Admin/SEO/ruleTrash', 'SEO规则回收站', 1, ''),
(231, 'admin', 1, 'Admin/Rank/userList', '查看用户', 1, ''),
(232, 'admin', 1, 'Admin/Rank/userRankList', '用户头衔列表', 1, ''),
(233, 'admin', 1, 'Admin/Rank/userAddRank', '关联新头衔', 1, ''),
(234, 'admin', 1, 'Admin/Rank/userChangeRank', '编辑头衔关联', 1, ''),
(235, 'admin', 1, 'Admin/Issue/add', '编辑专辑', -1, ''),
(236, 'admin', 1, 'Admin/Issue/issue', '专辑管理', -1, ''),
(237, 'admin', 1, 'Admin/Issue/operate', '专辑操作', -1, ''),
(238, 'admin', 1, 'Admin/Weibo/weibo', '微博管理', 1, ''),
(239, 'admin', 1, 'Admin/Rank/index', '头衔列表', 1, ''),
(240, 'admin', 1, 'Admin/Forum/forumTrash', '板块回收站', -1, ''),
(241, 'admin', 1, 'Admin/Weibo/weiboTrash', '微博回收站', 1, ''),
(242, 'admin', 1, 'Admin/Rank/editRank', '添加头衔', 1, ''),
(243, 'admin', 1, 'Admin/Weibo/comment', '回复管理', 1, ''),
(244, 'admin', 1, 'Admin/Forum/postTrash', '帖子回收站', -1, ''),
(245, 'admin', 1, 'Admin/Weibo/commentTrash', '回复回收站', 1, ''),
(246, 'admin', 1, 'Admin/Issue/issueTrash', '专辑回收站', -1, ''),
(247, 'admin', 1, 'Admin//Admin/Forum/reply', '回复管理', -1, ''),
(248, 'admin', 1, 'Admin/Forum/replyTrash', '回复回收站', -1, ''),
(249, 'admin', 2, 'Admin/Forum/index', '贴吧', -1, ''),
(250, 'admin', 2, 'Admin/Weibo/weibo', '微博', 1, ''),
(251, 'admin', 2, 'Admin/SEO/index', 'SEO', -1, ''),
(252, 'admin', 2, 'Admin/Rank/index', '头衔', -1, ''),
(253, 'admin', 2, 'Admin/Issue/issue', '专辑', -1, ''),
(254, 'admin', 1, 'Admin/Issue/contents', '内容管理', -1, ''),
(255, 'admin', 1, 'Admin/User/profile', '扩展资料', 1, ''),
(256, 'admin', 1, 'Admin/User/editProfile', '添加、编辑分组', 1, ''),
(257, 'admin', 1, 'Admin/User/sortProfile', '分组排序', 1, ''),
(258, 'admin', 1, 'Admin/User/field', '字段列表', 1, ''),
(259, 'admin', 1, 'Admin/User/editFieldSetting', '添加、编辑字段', 1, ''),
(260, 'admin', 1, 'Admin/User/sortField', '字段排序', 1, ''),
(261, 'admin', 1, 'Admin/Update/quick', '全部补丁', 1, ''),
(262, 'admin', 1, 'Admin/Update/addpack', '新增补丁', 1, ''),
(263, 'admin', 1, 'Admin/User/expandinfo_select', '用户扩展资料列表', 1, ''),
(264, 'admin', 1, 'Admin/User/expandinfo_details', '扩展资料详情', 1, ''),
(265, 'admin', 1, 'Admin/Shop/shopLog', '商城信息记录', -1, ''),
(266, 'admin', 1, 'Admin/Shop/setStatus', '商品分类状态设置', -1, ''),
(267, 'admin', 1, 'Admin/Shop/setGoodsStatus', '商品状态设置', -1, ''),
(268, 'admin', 1, 'Admin/Shop/operate', '商品分类操作', -1, ''),
(269, 'admin', 1, 'Admin/Shop/add', '商品分类添加', -1, ''),
(270, 'admin', 1, 'Admin/Shop/goodsEdit', '添加、编辑商品', -1, ''),
(271, 'admin', 1, 'Admin/Shop/hotSellConfig', '热销商品阀值配置', -1, ''),
(272, 'admin', 1, 'Admin/Shop/setNew', '设置新品', -1, ''),
(273, 'admin', 1, 'Admin/EventType/index', '活动分类管理', -1, ''),
(274, 'admin', 1, 'Admin/Event/event', '内容管理', -1, ''),
(275, 'admin', 1, 'Admin/EventType/eventTypeTrash', '活动分类回收站', -1, ''),
(276, 'admin', 1, 'Admin/Event/verify', '内容审核', -1, ''),
(277, 'admin', 1, 'Admin/Event/contentTrash', '内容回收站', -1, ''),
(278, 'admin', 1, 'Admin/Rank/rankVerify', '待审核用户头衔', 1, ''),
(279, 'admin', 1, 'Admin/Rank/rankVerifyFailure', '被驳回的头衔申请', 1, ''),
(280, 'admin', 1, 'Admin/Weibo/config', '微博设置', 1, ''),
(281, 'admin', 1, 'Admin/Issue/verify', '内容审核', -1, ''),
(282, 'admin', 1, 'Admin/Shop/goodsList', '商品列表', -1, ''),
(283, 'admin', 1, 'Admin/Shop/shopCategory', '商品分类配置', -1, ''),
(284, 'admin', 1, 'Admin/Shop/categoryTrash', '商品分类回收站', -1, ''),
(285, 'admin', 1, 'Admin/Shop/verify', '待发货交易', -1, ''),
(286, 'admin', 1, 'Admin/Issue/contentTrash', '内容回收站', -1, ''),
(287, 'admin', 1, 'Admin/Shop/goodsBuySuccess', '交易成功记录', -1, ''),
(288, 'admin', 1, 'Admin/Shop/goodsTrash', '商品回收站', -1, ''),
(289, 'admin', 1, 'Admin/Shop/toxMoneyConfig', '货币配置', -1, ''),
(290, 'admin', 2, 'Admin/Shop/shopCategory', '商城', -1, ''),
(291, 'admin', 2, 'Admin/EventType/index', '活动', -1, ''),
(340, 'Weibo', 1, 'Weibo/Index/doSend', '发微博', 1, ''),
(297, 'Home', 1, 'deleteLocalComment', '删除本地评论', 1, ''),
(306, 'Issue', 1, 'addIssueContent', '专辑投稿权限', 1, ''),
(307, 'Issue', 1, 'editIssueContent', '编辑专辑内容（管理）', 1, ''),
(339, 'Weibo', 1, 'Weibo/Index/doDelWeibo', '删除微博(管理)', 1, ''),
(338, 'Weibo', 1, 'Weibo/Index/doSendRepost', '转发微博', 1, ''),
(313, 'admin', 1, 'Admin/module/install', '模块安装', 1, ''),
(315, 'admin', 1, 'Admin/module/lists', '模块管理', 1, ''),
(316, 'admin', 1, 'Admin/module/uninstall', '卸载模块', 1, ''),
(317, 'admin', 1, 'Admin/AuthManager/addNode', '新增权限节点', 1, ''),
(318, 'admin', 1, 'Admin/AuthManager/accessUser', '前台权限管理', 1, ''),
(319, 'admin', 1, 'Admin/User/changeGroup', '转移权限组', 1, ''),
(320, 'admin', 1, 'Admin/AuthManager/deleteNode', '删除权限节点', 1, ''),
(321, 'admin', 1, 'Admin/Issue/config', '专辑设置', -1, ''),
(322, 'admin', 2, 'Admin/module/lists', '云平台', -1, ''),
(341, 'Weibo', 1, 'Weibo/Index/doComment', '评论微博', 1, ''),
(342, 'Weibo', 1, 'Weibo/Index/doDelComment', '删除评论微博(管理)', 1, ''),
(343, 'Weibo', 1, 'Weibo/Index/setTop', '微博置顶(管理)', 1, ''),
(344, 'Weibo', 1, 'Weibo/Topic/beAdmin', '抢先成为话题主持人', 1, ''),
(345, 'Weibo', 1, 'Weibo/Topic/editTopic', '管理话题(管理)', 1, ''),
(346, 'admin', 1, 'Admin/UserConfig/index', '用户注册配置', 1, ''),
(347, 'admin', 1, 'Admin/User/scoreList', '积分类型列表', 1, ''),
(348, 'admin', 1, 'Admin/user/editScoreType', '新增/编辑类型', 1, ''),
(349, 'admin', 1, 'Admin/user/recharge', '充值积分', 1, ''),
(350, 'admin', 1, 'Admin/Authorize/ssoSetting', '单点登录配置', 1, ''),
(351, 'admin', 1, 'Admin/Authorize/ssolist', '应用列表', 1, ''),
(352, 'admin', 1, 'Admin/authorize/editssoapp', '新增/编辑应用', 1, ''),
(353, 'admin', 1, 'Admin/ActionLimit/limitList', '行为限制列表', 1, ''),
(354, 'admin', 1, 'Admin/ActionLimit/editLimit', '新增/编辑行为限制', 1, ''),
(355, 'admin', 1, 'Admin/Role/index', '角色列表', 1, ''),
(356, 'admin', 1, 'Admin/Role/editRole', '编辑角色', 1, ''),
(357, 'admin', 1, 'Admin/Role/setStatus', '启用、禁用、删除角色', 1, ''),
(358, 'admin', 1, 'Admin/Role/sort', '角色排序', 1, ''),
(359, 'admin', 1, 'Admin/Role/configScore', '默认积分配置', 1, ''),
(360, 'admin', 1, 'Admin/Role/configAuth', '默认权限配置', 1, ''),
(361, 'admin', 1, 'Admin/Role/configAvatar', '默认头像配置', 1, ''),
(362, 'admin', 1, 'Admin/Role/configRank', '默认头衔配置', 1, ''),
(363, 'admin', 1, 'Admin/Role/configField', '默认字段管理', 1, ''),
(364, 'admin', 1, 'Admin/Role/group', '角色分组', 1, ''),
(365, 'admin', 1, 'Admin/Role/editGroup', '编辑分组', 1, ''),
(366, 'admin', 1, 'Admin/Role/deleteGroup', '删除分组', 1, ''),
(367, 'admin', 1, 'Admin/Role/config', '角色基本信息配置', 1, ''),
(368, 'admin', 1, 'Admin/Role/userList', '用户列表', 1, ''),
(369, 'admin', 1, 'Admin/Role/setUserStatus', '设置用户状态', 1, ''),
(370, 'admin', 1, 'Admin/Role/setUserAudit', '审核用户', 1, ''),
(371, 'admin', 1, 'Admin/Role/changeRole', '迁移用户', 1, ''),
(372, 'admin', 1, 'Admin/Role/uploadPicture', '上传默认头像', 1, ''),
(373, 'admin', 1, 'Admin/Invite/index', '类型管理', 1, ''),
(374, 'admin', 1, 'Admin/Invite/invite', '邀请码管理', 1, ''),
(375, 'admin', 1, 'Admin/Invite/config', '基础配置', 1, ''),
(376, 'admin', 1, 'Admin/Invite/buyLog', '兑换记录', 1, ''),
(377, 'admin', 1, 'Admin/Invite/inviteLog', '邀请记录', 1, ''),
(378, 'admin', 1, 'Admin/Invite/userInfo', '用户信息', 1, ''),
(379, 'admin', 1, 'Admin/Invite/edit', '编辑邀请注册类型', 1, ''),
(380, 'admin', 1, 'Admin/Invite/setStatus', '删除邀请', 1, ''),
(381, 'admin', 1, 'Admin/Invite/delete', '删除邀请码', 1, ''),
(382, 'admin', 1, 'Admin/Invite/createCode', '生成邀请码', 1, ''),
(383, 'admin', 1, 'Admin/Invite/deleteTrue', '删除无用邀请码', 1, ''),
(384, 'admin', 1, 'Admin/Invite/cvs', '导出cvs', 1, ''),
(385, 'admin', 1, 'Admin/Invite/editUserInfo', '用户信息编辑', 1, ''),
(386, 'admin', 1, 'Admin/Action/remove', '删除日志', 1, ''),
(387, 'admin', 1, 'Admin/Action/clear', '清空日志', 1, ''),
(388, 'admin', 1, 'Admin/User/setTypeStatus', '设置积分状态', 1, ''),
(389, 'admin', 1, 'Admin/User/delType', '删除积分类型', 1, ''),
(390, 'admin', 1, 'Admin/User/getNickname', '充值积分', 1, ''),
(391, 'admin', 1, 'Admin/Menu/del', '删除菜单', 1, ''),
(392, 'admin', 1, 'Admin/Menu/toogleDev', '设置开发者模式可见', 1, ''),
(393, 'admin', 1, 'Admin/Menu/toogleHide', '设置显示隐藏', 1, ''),
(394, 'admin', 1, 'Admin/ActionLimit/setLimitStatus', '行为限制启用、禁用、删除', 1, ''),
(395, 'admin', 1, 'Admin/SEO/setRuleStatus', '启用、禁用、删除、回收站还原', 1, ''),
(396, 'admin', 1, 'Admin/SEO/doClear', '回收站彻底删除', 1, ''),
(397, 'admin', 1, 'Admin/Role/initUnhaveUser', '初始化无角色用户', 1, ''),
(398, 'admin', 1, 'Admin/Addons/delHook', '删除钩子', 1, ''),
(399, 'admin', 1, 'Admin/Update/usePack', '使用补丁', 1, ''),
(400, 'admin', 1, 'Admin/Update/view', '查看补丁', 1, ''),
(401, 'admin', 1, 'Admin/Update/delPack', '删除补丁', 1, ''),
(402, 'admin', 1, 'Admin/UserTag/userTag', '标签列表', 1, ''),
(403, 'admin', 1, 'Admin/UserTag/add', '添加分类、标签', 1, ''),
(404, 'admin', 1, 'Admin/UserTag/setStatus', '设置分类、标签状态', 1, ''),
(405, 'admin', 1, 'Admin/UserTag/tagTrash', '分类、标签回收站', 1, ''),
(406, 'admin', 1, 'Admin/UserTag/userTagClear', '测底删除回收站内容', 1, ''),
(407, 'admin', 1, 'Admin/role/configusertag', '可拥有标签配置', 1, ''),
(408, 'admin', 1, 'Admin/Module/edit', '编辑模块', 1, ''),
(409, 'admin', 1, 'Admin/Config/website', '网站信息', 1, ''),
(410, 'admin', 1, 'Admin/Theme/setTheme', '使用主题', 1, ''),
(411, 'admin', 1, 'Admin/Theme/lookTheme', '查看主题', 1, ''),
(412, 'admin', 1, 'Admin/Theme/packageDownload', '主题打包下载', 1, ''),
(413, 'admin', 1, 'Admin/Theme/delete', '卸载删除主题', 1, ''),
(414, 'admin', 1, 'Admin/Theme/add', '上传安装主题', 1, ''),
(415, 'admin', 2, 'Admin/Home/config', '网站主页', 1, ''),
(416, 'admin', 1, 'Admin/Home/config', '基本设置', 1, ''),
(417, 'admin', 1, 'Admin/Weibo/topic', '话题管理', 1, ''),
(418, 'admin', 1, 'Admin/Weibo/setWeiboTop', '置顶微博', 1, ''),
(419, 'admin', 1, 'Admin/Weibo/setWeiboStatus', '设置微博状态', 1, ''),
(420, 'admin', 1, 'Admin/Weibo/setCommentStatus', '设置微博评论状态', 1, ''),
(421, 'admin', 1, 'Admin/Weibo/setTopicTop', '设置置顶话题', 1, ''),
(422, 'admin', 1, 'Admin/Weibo/delTopic', '删除话题', 1, ''),
(423, 'admin', 1, 'Admin/People/config', '基本设置', 1, ''),
(424, 'admin', 1, 'Admin/Cloud/index', '云市场', 1, ''),
(425, 'admin', 2, 'Admin/authorize/ssoSetting', '授权', 1, ''),
(426, 'admin', 2, 'Admin/Role/index', '角色', 1, ''),
(427, 'admin', 1, 'Admin/Theme/tpls', '主题管理', 1, ''),
(428, 'admin', 2, 'Admin/ActionLimit/limitList', '安全', 1, ''),
(429, 'admin', 2, 'Admin/Cloud/index', '云市场', 1, ''),
(430, 'admin', 2, 'Admin/People/config', '会员展示', 1, ''),
(431, 'admin', 1, 'Admin/Index/index', '后台入口', 1, ''),
(432, 'Ucenter', 1, 'Ucenter/Attest/apply', '申请认证', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_avatar`
--

DROP TABLE IF EXISTS `ocenter_avatar`;
CREATE TABLE IF NOT EXISTS `ocenter_avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `path` varchar(200) NOT NULL,
  `driver` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_temp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_avatar`
--

INSERT INTO `ocenter_avatar` (`id`, `uid`, `path`, `driver`, `create_time`, `status`, `is_temp`) VALUES
(1, 105, '/105/5b5b35b54c472.jpg', 'local', 1532704188, 1, 0),
(2, 108, '/108/5b5bdefe12f66.jpg', 'local', 1532747521, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_channel`
--

DROP TABLE IF EXISTS `ocenter_channel`;
CREATE TABLE IF NOT EXISTS `ocenter_channel` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  `color` varchar(30) NOT NULL,
  `band_color` varchar(30) NOT NULL,
  `band_text` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `image` int(11) NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_channel`
--

INSERT INTO `ocenter_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`, `color`, `band_color`, `band_text`, `icon`, `image`, `remark`) VALUES
(1, 0, '首页', 'Home/Index/index', 1, 0, 0, 1, 0, '#000000', '#000000', '', 'home', 0, ''),
(2, 0, '信息发布', 'Weibo/index/index', 2, 0, 0, 1, 0, '#000000', '#000000', '', 'quote-left', 0, ''),
(3, 0, '热门实验室', 'People/index/index', 3, 0, 0, 1, 0, '#000000', '#000000', '', 'group', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_checkin`
--

DROP TABLE IF EXISTS `ocenter_checkin`;
CREATE TABLE IF NOT EXISTS `ocenter_checkin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_config`
--

DROP TABLE IF EXISTS `ocenter_config`;
CREATE TABLE IF NOT EXISTS `ocenter_config` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(500) NOT NULL COMMENT '配置说明',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_config`
--

INSERT INTO `ocenter_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(100, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 11),
(101, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举\r\n8:多选框', 8),
(102, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:邮件', 15),
(103, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 17),
(104, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 20),
(105, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 24),
(107, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 13),
(108, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/Backup', 16),
(109, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 18),
(110, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 22),
(111, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 25),
(112, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式，部分后台功能必须在开发者模式下才生效，重新设置后清空缓存生效', 1383105995, 1383291877, 1, '0', 26),
(113, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 2),
(114, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 3),
(115, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 27),
(116, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 7),
(117, 'MAIL_TYPE', 4, '邮件类型', 5, '1:SMTP 模块发送\r\n2:mail() 函数发送', '如果您选择了采用服务器内置的 Mail 服务，您不需要填写下面的内容', 1388332882, 1388931416, 1, '1', 0),
(118, 'MAIL_SMTP_HOST', 1, 'SMTP 服务器', 5, '', 'SMTP服务器', 1388332932, 1388332932, 1, '', 0),
(119, 'MAIL_SMTP_PORT', 0, 'SMTP服务器端口', 5, '', '默认25', 1388332975, 1388332975, 1, '25', 0),
(120, 'MAIL_SMTP_USER', 1, 'SMTP服务器用户名', 5, '', '填写完整用户名', 1388333010, 1388333010, 1, '', 0),
(121, 'MAIL_SMTP_PASS', 6, 'SMTP服务器密码', 5, '', '填写您的密码', 1388333057, 1389187088, 1, '', 0),
(122, 'MAIL_USER_PASS', 5, '密码找回模板', 0, '', '支持HTML代码', 1388583989, 1388672614, 1, '密码找回111223333555111', 0),
(123, 'PIC_FILE_PATH', 1, '图片文件保存根目录', 4, '', '图片文件保存根目录./目录/', 1388673255, 1388673255, 1, './Uploads/', 0),
(124, 'COUNT_DAY', 0, '后台首页统计用户增长天数', 0, '', '默认统计最近半个月的用户数增长情况', 1420791945, 1420876261, 1, '7', 0),
(125, 'MAIL_USER_REG', 5, '注册邮件模板', 3, '', '支持HTML代码', 1388337307, 1389532335, 1, '<a href=\"http://www.opensns.cn\" target=\"_blank\">点击进入</a><span style=\"color:#E53333;\">当您收到这封邮件，表明您已注册成功，以上为您的用户名和密码。。。。祝您生活愉快····</span>', 55),
(126, 'USER_NAME_BAOLIU', 1, '保留用户名和昵称', 3, '', '禁止注册用户名和昵称，包含这些即无法注册,用\" , \"号隔开，用户只能是英文，下划线_，数字等', 1388845937, 1388845937, 1, '管理员,测试,admin,垃圾', 0),
(128, 'VERIFY_OPEN', 8, '验证码配置', 4, 'reg:注册显示\r\nlogin:登陆显示\r\nreset:密码重置', '验证码配置', 1388500332, 1405561711, 1, '', 0),
(129, 'VERIFY_TYPE', 4, '验证码类型', 4, '1:中文\r\n2:英文\r\n3:数字\r\n4:英文+数字', '验证码类型', 1388500873, 1405561731, 1, '4', 0),
(130, 'NO_BODY_TLE', 2, '空白说明', 2, '', '空白说明', 1392216444, 1392981305, 1, '呵呵，暂时没有内容哦！！', 0),
(131, 'USER_RESPASS', 5, '密码找回模板', 3, '', '密码找回文本', 1396191234, 1396191234, 1, '<span style=\"color:#009900;\">请点击以下链接找回密码，如无反应，请将链接地址复制到浏览器中打开(下次登录前有效)</span>', 0),
(132, 'COUNT_CODE', 2, '统计代码', 1, '', '用于统计网站访问量的第三方代码，推荐CNZZ统计', 1403058890, 1403058890, 1, '', 12),
(134, 'URL_MODEL', 4, 'URL模式', 4, '2:REWRITE模式(开启伪静态)\r\n3:兼容模式', '选择Rewrite模式则开启伪静态，在开启伪静态之前需要先<a href=\"http://v2.opensns.cn/index.php?s=/news/index/detail/id/128.html\" target=\"_blank\">设置伪静态</a>或者阅读/Rewrite/readme.txt中的说明，默认建议开启兼容模式', 1421027546, 1421027676, 1, '3', 0),
(135, 'DEFUALT_HOME_URL', 1, '登录前首页Url', 1, '', '支持形如weibo/index/index的ThinkPhp路由写法，支持普通的url写法，不填则显示默认聚合首页', 1417509438, 1427340006, 1, '', 1),
(136, 'AUTO_UPDATE', 4, '自动更新提示', 1, '0:关闭,1:开启', '关闭后，后台将不显示更新提示', 1433731153, 1433731348, 1, '1', 2),
(137, 'WEB_SITE_CLOSE_HINT', 2, '关站提示文字', 1, '', '站点关闭后的提示文字。', 1433731248, 1433731287, 1, '网站正在更新维护，请稍候再试。', 4),
(138, 'SESSION_PREFIX', 1, '网站前台session前缀', 1, '', '当多个网站在同一个根域名下请保证每个网站的前缀不同', 1436923664, 1436923664, 1, 'opensns', 20),
(139, 'COOKIE_PREFIX', 1, '网站前台cookie前缀', 1, '', '当多个网站在同一个根域名下请保证每个网站的前缀不同', 1436923664, 1436923664, 1, 'opensns_', 21),
(140, 'MAIL_SMTP_CE', 1, '邮件发送测试', 5, '', '填写测试邮件地址', 1388334529, 1388584028, 1, '', 11),
(141, 'LOST_LONG', 0, '用户流失标准（天）', 0, '', '', 1469414315, 1469414315, 1, '30', 0),
(142, 'MAIL_VERIFY_TYPE', 4, 'SMTP验证方式', 5, '1:无\r\n2:ssl\r\n3:tls', 'SMTP验证方式', 1388332882, 1388931416, 1, '1', 0),
(1000, '_USERCONFIG_REG_SWITCH', 0, '', 0, '', '', 1427094903, 1427094903, 1, 'email', 0),
(1001, '_CONFIG_WEB_SITE_NAME', 0, '', 0, '', '', 1427339647, 1427339647, 1, '中科大面向本科是实验室信息平台', 0),
(1002, '_CONFIG_ICP', 0, '', 0, '', '', 1427339647, 1427339647, 1, '', 0),
(1003, '_CONFIG_LOGO', 0, '', 0, '', '', 1427339647, 1427339647, 1, '', 0),
(1004, '_CONFIG_QRCODE', 0, '', 0, '', '', 1427339647, 1427339647, 1, '', 0),
(1005, '_CONFIG_ABOUT_US', 0, '', 0, '', '', 1427339647, 1427339647, 1, '<p>&nbsp; 我系渣渣辉倾力打造<br>2018软件工程</p>', 0),
(1006, '_CONFIG_SUBSCRIB_US', 0, '', 0, '', '', 1427339647, 1427339647, 1, '<p>业务QQ：2392587229</p><p>联系地址：</p><p>联系电话：18654149030', 0),
(1007, '_CONFIG_COPY_RIGHT', 0, '', 0, '', '', 1427339647, 1427339647, 1, '<p>Copyright ©2017-2018\"https://www.cnblogs.com/tanwan-proj/\" target=\"_blank\">我系渣渣辉', 0),
(1008, '_HOME_LOGO', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1009, '_HOME_ENTER_URL', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1010, '_HOME_BLOCK', 0, '', 0, '', '', 1432791820, 1432791820, 1, '[{\"data-id\":\"disable\",\"title\":\"禁用\",\"items\":[]},{\"data-id\":\"enable\",\"title\":\"启用\",\"items\":[{\"data-id\":\"slider\",\"title\":\"轮播\"},{\"data-id\":\"Weibo\",\"title\":\"微博\"},{\"data-id\":\"People\",\"title\":\"会员展示\"}]}]', 0),
(1011, '_HOME_PIC1', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1012, '_HOME_URL1', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1013, '_HOME_TITLE1', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1014, '_HOME_PIC2', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1015, '_HOME_URL2', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1016, '_HOME_TITLE2', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1017, '_HOME_PIC3', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1018, '_HOME_URL3', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1019, '_HOME_TITLE3', 0, '', 0, '', '', 1432791820, 1432791820, 1, '', 0),
(1020, '_CONFIG_COMPANY', 0, '', 0, '', '', 1427339647, 1427339647, 1, '<a href=\"https://www.cnblogs.com/tanwan-proj/\" target=\"_blank\"><p><i class=\"icon icon-user\"></i>加入我们</p></a><p><i class=\"icon icon-phone-sign\"></i>18654149030</p><p><i class=\"icon icon-envelope-alt\"></i>zsl1996@mail.ustc.edu.cn</p>', 0),
(1021, '_CONFIG_QRCODE_BOTTOM', 0, '', 0, '', '', 1484102844, 1484102844, 1, '', 0),
(1022, '_USERCONFIG_UCENTER_KANBAN', 0, '', 0, '', '', 1501048026, 1501048026, 1, '[{\"data-id\":\"disable\",\"title\":\"\\u7981\\u7528\",\"items\":[{\"data-id\":\"Weibo\",\"title\":\"\\u5fae\\u535a\"}]},{\"data-id\":\"enable\",\"title\":\"\\u542f\\u7528\",\"items\":[{\"data-id\":\"follow\",\"title\":\"TA\\u7684\\u5173\\u6ce8\\/\\u7c89\\u4e1d\"},{\"data-id\":\"info\",\"title\":\"\\u8d44\\u6599\"},{\"data-id\":\"rank_title\",\"title\":\"\\u5934\\u8854\"},{\"data-id\":\"topic_list\",\"title\":\"\\u5173\\u6ce8\\u7684\\u8bdd\\u9898\"}]}]', 0),
(10009, '_CONFIG_FIRST_USER_RUN', 0, '', 0, '', '', 1533101452, 1533101452, 1, '2018-08-01', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_count_active`
--

DROP TABLE IF EXISTS `ocenter_count_active`;
CREATE TABLE IF NOT EXISTS `ocenter_count_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL COMMENT '类型:''day'',''week'',''month''',
  `date` int(11) NOT NULL,
  `num` int(11) NOT NULL COMMENT '活跃人数',
  `total` int(11) NOT NULL COMMENT '总人数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='活跃统计表';

--
-- 转存表中的数据 `ocenter_count_active`
--

INSERT INTO `ocenter_count_active` (`id`, `type`, `date`, `num`, `total`) VALUES
(1, 'day', 1527955200, 0, 0),
(2, 'day', 1528041600, 1, 0),
(3, 'day', 1528473600, 0, 0),
(4, 'week', 1527955207, 1, 0),
(5, 'day', 1528560000, 0, 0),
(6, 'day', 1530460800, 0, 0),
(7, 'day', 1532534400, 0, 0),
(8, 'day', 1532620800, 4, 0),
(9, 'day', 1532793600, 0, 0),
(10, 'day', 1532880000, 1, 0),
(11, 'day', 1532966400, 1, 0),
(12, 'month', 1530374430, 9, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_count_lost`
--

DROP TABLE IF EXISTS `ocenter_count_lost`;
CREATE TABLE IF NOT EXISTS `ocenter_count_lost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_num` int(11) NOT NULL COMMENT '用户总数',
  `new_lost` int(11) NOT NULL COMMENT '新增流失用户数',
  `date` int(11) NOT NULL COMMENT '日期，时间戳形式',
  `lost_num` int(11) NOT NULL COMMENT '流失用户数',
  `rate` decimal(6,4) NOT NULL COMMENT '比率0~1之间，小数点四位的小数',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户流失率统计';

--
-- 转存表中的数据 `ocenter_count_lost`
--

INSERT INTO `ocenter_count_lost` (`id`, `user_num`, `new_lost`, `date`, `lost_num`, `rate`, `create_time`) VALUES
(1, 1, 0, 1527955200, 0, '0.0000', 1528111907),
(2, 1, 0, 1528041600, 0, '0.0000', 1528128056),
(3, 1, 0, 1528473600, 0, '0.0000', 1528609219),
(4, 1, 0, 1528560000, 0, '0.0000', 1528718796),
(5, 3, 0, 1530460800, 1, '0.3333', 1530601540),
(6, 4, 0, 1532534400, 2, '0.5000', 1532681707),
(7, 7, 0, 1532620800, 2, '0.2857', 1532743044),
(8, 11, 0, 1532793600, 2, '0.1818', 1532896930),
(9, 11, 0, 1532880000, 2, '0.1818', 1533027691),
(10, 11, 0, 1532966400, 2, '0.1818', 1533101452);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_count_remain`
--

DROP TABLE IF EXISTS `ocenter_count_remain`;
CREATE TABLE IF NOT EXISTS `ocenter_count_remain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL COMMENT '日期',
  `day1_num` int(11) NOT NULL COMMENT '第一天登录人数',
  `day2_num` int(11) NOT NULL COMMENT '第二天登录人数',
  `day3_num` int(11) NOT NULL,
  `day4_num` int(11) NOT NULL,
  `day5_num` int(11) NOT NULL,
  `day6_num` int(11) NOT NULL,
  `day7_num` int(11) NOT NULL,
  `day8_num` int(11) NOT NULL,
  `reg_num` int(11) NOT NULL COMMENT '当天注册人数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='留存率统计表';

--
-- 转存表中的数据 `ocenter_count_remain`
--

INSERT INTO `ocenter_count_remain` (`id`, `date`, `day1_num`, `day2_num`, `day3_num`, `day4_num`, `day5_num`, `day6_num`, `day7_num`, `day8_num`, `reg_num`) VALUES
(1, 1527868800, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 1527782400, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1527696000, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 1527609600, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 1527523200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1527436800, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 1527350400, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 1527264000, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 1527955200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 1528387200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 1528300800, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 1528214400, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 1528128000, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 1528041600, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(15, 1528473600, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 1530374400, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 1530288000, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 1530201600, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 1530115200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 1530028800, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 1529942400, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 1529856000, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 1529769600, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 1532448000, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 1532361600, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 1532275200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 1532188800, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 1532102400, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 1532016000, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 1531929600, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 1531843200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(32, 1532534400, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, 1532707200, 0, 1, 1, 0, 0, 0, 0, 0, 4),
(34, 1532620800, 0, 0, 0, 0, 0, 0, 0, 0, 3),
(35, 1532793600, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(36, 1532880000, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_district`
--

DROP TABLE IF EXISTS `ocenter_district`;
CREATE TABLE IF NOT EXISTS `ocenter_district` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `upid` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=910007 DEFAULT CHARSET=utf8 COMMENT='中国省市区乡镇数据表';

--
-- 转存表中的数据 `ocenter_district`
--

INSERT INTO `ocenter_district` (`id`, `name`, `level`, `upid`) VALUES
(110000, '信息学院', 1, 0),
(120000, '物理学院', 1, 0),
(130000, '生物学院', 1, 0),
(140000, '化学学院', 1, 0),
(150000, '计算机学院', 1, 0),
(210000, '工程学院', 1, 0),
(110100, '大数据', 2, 110000),
(110200, '计算机视觉', 2, 110000),
(120100, '自然语言处理', 2, 110000),
(120200, '通信', 2, 110000),
(130100, '光学', 2, 120000),
(130200, '固体物理', 2, 120000),
(130300, '量子物理', 2, 120000),
(130400, '脑科学', 2, 130000),
(130500, '生物医学工程', 2, 130000),
(130600, '信息安全', 2, 150000),
(130800, '软件工程', 2, 150000),
(210500, '机械工程', 2, 210000),
(810001, '计算机体系结构', 2, 150000),
(820001, '信息安全', 2, 110000),
(710001, '大规模集成电路', 2, 110000),
(710003, '生物化学', 2, 140000);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_expression`
--

DROP TABLE IF EXISTS `ocenter_expression`;
CREATE TABLE IF NOT EXISTS `ocenter_expression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `path` varchar(200) NOT NULL,
  `driver` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `expression_pkg_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_expression_pkg`
--

DROP TABLE IF EXISTS `ocenter_expression_pkg`;
CREATE TABLE IF NOT EXISTS `ocenter_expression_pkg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pkg_title` varchar(50) NOT NULL,
  `pkg_name` varchar(50) NOT NULL,
  `path` varchar(200) NOT NULL,
  `driver` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_field`
--

DROP TABLE IF EXISTS `ocenter_field`;
CREATE TABLE IF NOT EXISTS `ocenter_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_data` varchar(1000) NOT NULL,
  `createTime` int(11) NOT NULL,
  `changeTime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_field`
--

INSERT INTO `ocenter_field` (`id`, `role_id`, `uid`, `field_id`, `field_data`, `createTime`, `changeTime`) VALUES
(1, 1, 105, 3, 'Python', 1532702262, 1532702262),
(2, 1, 105, 4, '是', 1532702262, 1532702262),
(3, 1, 105, 5, 'djiaokdam', 1532702262, 1532702262),
(4, 1, 106, 3, 'C++', 1532744772, 1532744772),
(5, 1, 106, 4, '是', 1532744772, 1532744772),
(6, 1, 106, 5, '。。。。', 1532744772, 1532744772),
(7, 1, 108, 3, 'php', 1532763954, 1532764569),
(8, 1, 108, 4, '是', 1532763954, 1532764569),
(9, 1, 108, 5, 'NLP', 1532763954, 1532764569);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_field_group`
--

DROP TABLE IF EXISTS `ocenter_field_group`;
CREATE TABLE IF NOT EXISTS `ocenter_field_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_field_group`
--

INSERT INTO `ocenter_field_group` (`id`, `profile_name`, `status`, `createTime`, `sort`, `visiable`) VALUES
(1, '个人资料', 1, 1403847366, 0, 1),
(2, '个人简历', 1, 1423537648, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_field_setting`
--

DROP TABLE IF EXISTS `ocenter_field_setting`;
CREATE TABLE IF NOT EXISTS `ocenter_field_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(25) NOT NULL,
  `profile_group_id` int(11) NOT NULL,
  `visiable` tinyint(4) NOT NULL DEFAULT '1',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL,
  `form_type` varchar(25) NOT NULL,
  `form_default_value` varchar(200) NOT NULL,
  `validation` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` int(11) NOT NULL,
  `child_form_type` varchar(25) NOT NULL,
  `input_tips` varchar(100) NOT NULL COMMENT '输入提示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_field_setting`
--

INSERT INTO `ocenter_field_setting` (`id`, `field_name`, `profile_group_id`, `visiable`, `required`, `sort`, `form_type`, `form_default_value`, `validation`, `status`, `createTime`, `child_form_type`, `input_tips`) VALUES
(1, 'qq', 1, 1, 1, 0, 'input', '', '', 1, 1409045825, 'string', ''),
(2, '生日', 1, 1, 1, 0, 'time', '', '', 1, 1423537409, '', ''),
(3, '擅长计算机语言', 2, 1, 1, 0, 'select', 'C|Java|C++|Python|php|object c|ruby|无', '', 1, 1423537693, '', ''),
(4, '近期是否希望承担项目', 2, 1, 1, 0, 'radio', '是|否', '', 1, 1423537733, '', ''),
(5, '研究经历', 2, 1, 1, 0, 'textarea', '', '', 1, 1423537770, '', '请简单介绍自己做过的的项目');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_file`
--

DROP TABLE IF EXISTS `ocenter_file`;
CREATE TABLE IF NOT EXISTS `ocenter_file` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` varchar(100) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` varchar(255) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '上传时间',
  `driver` varchar(50) NOT NULL,
  `download_num` int(11) NOT NULL DEFAULT '0' COMMENT '下载数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_follow`
--

DROP TABLE IF EXISTS `ocenter_follow`;
CREATE TABLE IF NOT EXISTS `ocenter_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `follow_who` int(11) NOT NULL COMMENT '关注谁',
  `who_follow` int(11) NOT NULL COMMENT '谁关注',
  `create_time` int(11) NOT NULL,
  `alias` varchar(40) NOT NULL COMMENT '备注',
  `group_id` int(11) NOT NULL COMMENT '分组ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='关注表';

--
-- 转存表中的数据 `ocenter_follow`
--

INSERT INTO `ocenter_follow` (`id`, `follow_who`, `who_follow`, `create_time`, `alias`, `group_id`) VALUES
(2, 105, 106, 1532744867, '', 0),
(3, 1, 106, 1532744871, '', 0),
(7, 1, 108, 1532765592, '', 0),
(6, 104, 108, 1532765550, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_hooks`
--

DROP TABLE IF EXISTS `ocenter_hooks`;
CREATE TABLE IF NOT EXISTS `ocenter_hooks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_hooks`
--

INSERT INTO `ocenter_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES
(38, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, ''),
(39, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'SuperLinks'),
(40, 'adminEditor', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin'),
(41, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SyncLogin,DevTeam,SystemInfo,LocalComment'),
(42, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, ''),
(43, 'app_begin', '应用开始', 2, 1384481614, 'Iswaf'),
(44, 'checkIn', '签到', 1, 1395371353, 'CheckIn'),
(46, 'support', '赞', 1, 1398264759, 'Support'),
(47, 'localComment', '本地评论插件', 1, 1399440321, 'LocalComment'),
(48, 'weiboType', '微博类型', 1, 1409121894, ''),
(49, 'repost', '转发钩子', 1, 1403668286, ''),
(50, 'syncLogin', '第三方登陆位置', 1, 1403700579, 'SyncLogin'),
(51, 'syncMeta', '第三方登陆meta接口', 1, 1403700633, 'SyncLogin'),
(52, 'J_China_City', '每个系统都需要的一个中国省市区三级联动插件。', 1, 1403841931, 'ChinaCity'),
(54, 'imageSlider', '图片轮播钩子', 1, 1407144022, ''),
(55, 'friendLink', '友情链接插件', 1, 1407156413, 'SuperLinks'),
(56, 'beforeSendWeibo', '在发微博之前预处理微博', 2, 1408084504, 'InsertFile'),
(57, 'beforeSendRepost', '转发微博前的预处理钩子', 2, 1408085689, ''),
(58, 'parseWeiboContent', '解析微博内容钩子', 2, 1409121261, ''),
(59, 'userConfig', '用户配置页面钩子', 1, 1417137557, 'SyncLogin'),
(60, 'weiboSide', '微博侧边钩子', 1, 1417063425, 'Retopic,Recommend'),
(61, 'personalMenus', '顶部导航栏个人下拉菜单', 1, 1417146501, ''),
(62, 'dealPicture', '上传图片处理', 2, 1417139975, ''),
(63, 'ucenterSideMenu', '用户中心左侧菜单', 1, 1417161205, ''),
(64, 'afterTop', '顶部导航之后的钩子，调用公告等', 1, 1429671392, ''),
(65, 'report', '举报钩子', 1, 1429511732, 'Report'),
(66, 'handleAction', '行为的额外操作', 2, 1433300260, 'CheckIn'),
(67, 'uploadDriver', '附件图片上传引擎', 2, 1435306269, ''),
(68, 'sms', '短信插件钩子', 2, 1437382105, ''),
(69, 'filterHtmlContent', '渲染富文本', 2, 1441951420, ''),
(70, 'parseContent', '解析内容', 2, 1445828128, 'Sensitive'),
(71, 'tool', '返回顶部，右下角工具栏', 1, 1445828128, ''),
(72, 'homeIndex', '网站首页', 2, 1445828128, '');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_iexpression`
--

DROP TABLE IF EXISTS `ocenter_iexpression`;
CREATE TABLE IF NOT EXISTS `ocenter_iexpression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(200) NOT NULL,
  `driver` varchar(50) NOT NULL,
  `md5` varchar(32) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_iexpression_link`
--

DROP TABLE IF EXISTS `ocenter_iexpression_link`;
CREATE TABLE IF NOT EXISTS `ocenter_iexpression_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iexpression_id` int(11) NOT NULL,
  `uid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_invite`
--

DROP TABLE IF EXISTS `ocenter_invite`;
CREATE TABLE IF NOT EXISTS `ocenter_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `code` varchar(25) NOT NULL COMMENT '邀请码',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `can_num` int(10) NOT NULL COMMENT '可以注册用户（含升级）',
  `already_num` int(10) NOT NULL COMMENT '已经注册用户（含升级）',
  `end_time` int(11) NOT NULL COMMENT '有效期至',
  `status` tinyint(2) NOT NULL COMMENT '0：已用完，1：还可注册，2：用户取消邀请，-1：管理员删除',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='邀请码表';

--
-- 转存表中的数据 `ocenter_invite`
--

INSERT INTO `ocenter_invite` (`id`, `invite_type`, `code`, `uid`, `can_num`, `already_num`, `end_time`, `status`, `create_time`) VALUES
(1, 1, 'M9TR2PPaHWY', 1, 100000, 0, 1818494575, 1, 1502961774),
(2, 1, 'PBkjssMPb3U', 100, 100000, 0, 1844342115, 1, 1528722914),
(3, 1, '3II6GDwRUzQ', 100, 100000, 0, 1844342115, 1, 1528722914),
(4, 1, 'S6EvcwTvdNU', 102, 100000, 0, 1846244957, 1, 1530625757),
(5, 1, 'MAVmCpQJwou', 103, 100000, 0, 1848303483, 1, 1532684283),
(6, 1, 'x3VRaBfsosL', 104, 100000, 0, 1848319452, 1, 1532700252),
(7, 1, 'yoiwNRxUycW', 105, 100000, 0, 1848321429, 1, 1532702229),
(8, 1, 'gF85uJYFxVc', 106, 100000, 0, 1848362350, 1, 1532743150),
(9, 1, 'TP8qCSgtcYy', 107, 100000, 0, 1848364178, 1, 1532744977),
(10, 1, 'd4rajomJhAH', 108, 100000, 0, 1848366244, 1, 1532747044),
(11, 1, 'o2S1xIrrJK7', 109, 100000, 0, 1848384915, 1, 1532765715);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_invite_buy_log`
--

DROP TABLE IF EXISTS `ocenter_invite_buy_log`;
CREATE TABLE IF NOT EXISTS `ocenter_invite_buy_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(10) NOT NULL COMMENT '可邀请名额',
  `content` varchar(200) NOT NULL COMMENT '记录信息',
  `create_time` int(11) NOT NULL COMMENT '创建时间（做频率用）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户购买邀请名额记录';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_invite_log`
--

DROP TABLE IF EXISTS `ocenter_invite_log`;
CREATE TABLE IF NOT EXISTS `ocenter_invite_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `inviter_id` int(11) NOT NULL COMMENT '邀请人id',
  `invite_id` int(11) NOT NULL COMMENT '邀请码id',
  `content` varchar(200) NOT NULL COMMENT '记录内容',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请注册成功记录表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_invite_type`
--

DROP TABLE IF EXISTS `ocenter_invite_type`;
CREATE TABLE IF NOT EXISTS `ocenter_invite_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `title` varchar(25) NOT NULL COMMENT '标题',
  `length` int(10) NOT NULL DEFAULT '11' COMMENT '验证码长度',
  `time` varchar(50) NOT NULL COMMENT '有效时长，带单位的时间',
  `cycle_num` int(10) NOT NULL COMMENT '周期内可购买个数',
  `cycle_time` varchar(50) NOT NULL COMMENT '周期时长，带单位的时间',
  `roles` varchar(50) NOT NULL COMMENT '绑定角色ids',
  `auth_groups` varchar(50) NOT NULL COMMENT '允许购买的权限组ids',
  `pay_score` int(10) NOT NULL COMMENT '购买消耗积分',
  `pay_score_type` int(11) NOT NULL COMMENT '购买消耗积分类型',
  `income_score` int(10) NOT NULL COMMENT '每邀请成功一个用户，邀请者增加积分',
  `income_score_type` int(11) NOT NULL COMMENT '邀请成功后增加积分类型id',
  `is_follow` tinyint(2) NOT NULL COMMENT '邀请成功后是否互相关注',
  `status` tinyint(2) NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='邀请注册码类型表';

--
-- 转存表中的数据 `ocenter_invite_type`
--

INSERT INTO `ocenter_invite_type` (`id`, `title`, `length`, `time`, `cycle_num`, `cycle_time`, `roles`, `auth_groups`, `pay_score`, `pay_score_type`, `income_score`, `income_score_type`, `is_follow`, `status`, `create_time`, `update_time`) VALUES
(1, '系统默认邀请码', 11, '10 year', 1, '1 second', '[1]', '[1],[2]', 0, 1, 0, 1, 1, 1, 1466749163, 1471247871);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_invite_user_info`
--

DROP TABLE IF EXISTS `ocenter_invite_user_info`;
CREATE TABLE IF NOT EXISTS `ocenter_invite_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY',
  `invite_type` int(11) NOT NULL COMMENT '邀请类型id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `num` int(11) NOT NULL COMMENT '可邀请名额',
  `already_num` int(11) NOT NULL COMMENT '已邀请名额',
  `success_num` int(11) NOT NULL COMMENT '成功邀请名额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请注册用户信息';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_local_comment`
--

DROP TABLE IF EXISTS `ocenter_local_comment`;
CREATE TABLE IF NOT EXISTS `ocenter_local_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `app` text NOT NULL,
  `mod` text NOT NULL,
  `row_id` int(11) NOT NULL,
  `parse` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `create_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `area` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_member`
--

DROP TABLE IF EXISTS `ocenter_member`;
CREATE TABLE IF NOT EXISTS `ocenter_member` (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `login` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `last_login_role` int(11) NOT NULL,
  `show_role` int(11) NOT NULL COMMENT '个人主页显示角色',
  `signature` text NOT NULL,
  `pos_province` int(11) NOT NULL,
  `pos_city` int(11) NOT NULL,
  `pos_district` int(11) NOT NULL,
  `pos_community` int(11) NOT NULL,
  `score1` double DEFAULT '0' COMMENT '用户积分',
  `score2` double DEFAULT '0' COMMENT 'score2',
  `score3` double DEFAULT '0' COMMENT 'score3',
  `score4` double DEFAULT '0' COMMENT 'score4',
  `con_check` int(11) NOT NULL DEFAULT '0',
  `total_check` int(11) NOT NULL DEFAULT '0',
  `fans` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `session_id` varchar(225) NOT NULL,
  `alive_line` int(11) NOT NULL DEFAULT '0' COMMENT '用户禁用时间至该值',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`),
  KEY `name` (`nickname`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='会员表';

--
-- 转存表中的数据 `ocenter_member`
--

INSERT INTO `ocenter_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `last_login_role`, `show_role`, `signature`, `pos_province`, `pos_city`, `pos_district`, `pos_community`, `score1`, `score2`, `score3`, `score4`, `con_check`, `total_check`, `fans`, `session_id`, `alive_line`) VALUES
(1, '大数据实验室', 0, '0000-00-00', '', 19, 0, 1528111895, 0, 1532699781, 1, 1, 1, '欢迎对数据挖掘，数据分析感兴趣的同学联系我', 110000, 110100, 0, 0, 31, 0, 0, 0, 0, 0, 2, 'itdmj7r0k2nhuhktgv3t28q7t7', 0),
(100, 'zsl', 0, '0000-00-00', '', 2, 0, 1528722914, 0, 1528722914, 1, 1, 1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'l5qum0b3sf0m9bpoumn36uk6u6', 0),
(101, 'zsl', 0, '0000-00-00', '', 0, 0, 1528722914, 0, 0, 1, 0, 1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(102, 'zsl1996', 0, '0000-00-00', '', 1, 0, 1530625756, 0, 1530625757, 1, 1, 1, '', 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 'b8ut5vj99tepmfqv62pdt6a993', 0),
(103, 'kkk', 0, '0000-00-00', '', 1, 0, 1532684283, 0, 1532684283, 1, 1, 1, '', 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 'ej164old2fc3m69svv9ojvk9f7', 0),
(104, 'zsl19960523', 0, '0000-00-00', '', 1, 0, 1532700251, 0, 1532700252, 1, 1, 1, '', 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 1, 'itdmj7r0k2nhuhktgv3t28q7t7', 0),
(105, 'MSRA', 1, '0000-00-00', '', 1, 0, 1532702229, 0, 1532702229, 1, 1, 1, '联培开始，有意从事CV，NLP等领域的优秀本科生请私信我简历', 110000, 120100, 0, 0, 12, 0, 0, 0, 0, 0, 1, 'mc112ja3oq8uio07pe1cefqii3', 0),
(106, 'zzz', 0, '0000-00-00', '', 1, 0, 1532743149, 0, 1532743150, 1, 1, 1, '寻求实验室', 110000, 110100, 0, 0, 12, 0, 0, 0, 0, 0, 0, '5i4gm4jakuclkrr7ep0r73fst5', 0),
(107, 'zzzz', 0, '0000-00-00', '', 1, 0, 1532744977, 0, 1532744977, 1, 1, 1, '', 150000, 130800, 0, 0, 11, 0, 0, 0, 0, 0, 0, '5i4gm4jakuclkrr7ep0r73fst5', 0),
(108, '讯飞语音', 2, '0000-00-00', '', 8, 0, 1532747044, 0, 1533101451, 1, 1, 1, '招收对NLP感兴趣的同学', 120000, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 'b6q2e4qjff63s7t8037fpf90c5', 0),
(109, 'zzzzzzz', 0, '0000-00-00', '', 1, 0, 1532765715, 0, 1532765715, 1, 1, 1, '', 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, '571998rtd4oba604m66uter8j2', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_menu`
--

DROP TABLE IF EXISTS `ocenter_menu`;
CREATE TABLE IF NOT EXISTS `ocenter_menu` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `icon` varchar(20) NOT NULL COMMENT '导航图标',
  `module` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=10018 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_menu`
--

INSERT INTO `ocenter_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `icon`, `module`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0, 'home', ''),
(2, '用户与身份', 0, 2, 'User/index', 0, '', '', 0, 'user', ''),
(3, '用户信息', 2, 2, 'User/index', 0, '', '用户配置', 0, '', ''),
(4, '积分规则', 197, 3, 'User/action', 0, '', '行为与积分', 0, '', ''),
(5, '新增用户行为', 4, 0, 'User/addaction', 0, '', '', 0, '', ''),
(6, '编辑用户行为', 4, 0, 'User/editaction', 0, '', '', 0, '', ''),
(7, '保存用户行为', 4, 0, 'User/saveAction', 0, '\"用户->用户行为\"保存编辑和新增的用户行为', '', 0, '', ''),
(8, '变更行为状态', 4, 0, 'User/setStatus', 0, '\"用户->用户行为\"中的启用,禁用和删除权限', '', 0, '', ''),
(9, '禁用会员', 4, 0, 'User/changeStatus?method=forbidUser', 0, '\"用户->用户信息\"中的禁用', '', 0, '', ''),
(10, '启用会员', 4, 0, 'User/changeStatus?method=resumeUser', 0, '\"用户->用户信息\"中的启用', '', 0, '', ''),
(11, '删除会员', 4, 0, 'User/changeStatus?method=deleteUser', 0, '\"用户->用户信息\"中的删除', '', 0, '', ''),
(12, '权限组管理', 2, 5, 'AuthManager/index', 0, '', '用户配置', 0, '', ''),
(13, '删除', 12, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除权限组', '', 1, '', ''),
(14, '禁用', 12, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用权限组', '', 1, '', ''),
(15, '恢复', 12, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的权限组', '', 1, '', ''),
(16, '新增', 12, 0, 'AuthManager/createGroup', 0, '创建新的权限组', '', 1, '', ''),
(17, '编辑', 12, 0, 'AuthManager/editGroup', 0, '编辑权限组名称和描述', '', 1, '', ''),
(18, '保存权限组', 12, 0, 'AuthManager/writeGroup', 0, '新增和编辑权限组的\"保存\"按钮', '', 0, '', ''),
(19, '授权', 12, 0, 'AuthManager/group', 0, '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属权限组', '', 0, '', ''),
(20, '访问授权', 12, 0, 'AuthManager/access', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', 0, '', ''),
(21, '成员授权', 12, 0, 'AuthManager/user', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', 0, '', ''),
(22, '解除授权', 12, 0, 'AuthManager/removeFromGroup', 0, '\"成员授权\"列表页内的解除授权操作按钮', '', 0, '', ''),
(23, '保存成员授权', 12, 0, 'AuthManager/addToGroup', 0, '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', 0, '', ''),
(24, '分类授权', 12, 0, 'AuthManager/category', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', 0, '', ''),
(25, '保存分类授权', 12, 0, 'AuthManager/addToCategory', 0, '\"分类授权\"页面的\"保存\"按钮', '', 0, '', ''),
(26, '模型授权', 12, 0, 'AuthManager/modelauth', 0, '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', 0, '', ''),
(27, '保存模型授权', 12, 0, 'AuthManager/addToModel', 0, '\"分类授权\"页面的\"保存\"按钮', '', 0, '', ''),
(28, '新增权限节点', 12, 0, 'AuthManager/addNode', 1, '', '', 1, '', ''),
(29, '前台权限管理', 12, 0, 'AuthManager/accessUser', 1, '', '权限管理', 0, '', ''),
(30, '删除权限节点', 12, 0, 'AuthManager/deleteNode', 1, '', '', 1, '', ''),
(31, '行为日志', 197, 4, 'Action/actionlog', 0, '', '行为与积分', 0, '', ''),
(32, '查看行为日志', 31, 0, 'action/edit', 1, '', '', 0, '', ''),
(33, '修改密码', 2, 3, 'User/updatePassword', 1, '', '', 0, '', ''),
(34, '修改昵称', 2, 4, 'User/updateNickname', 1, '', '', 0, '', ''),
(35, '查看用户', 2, 1, 'Rank/userList', 0, '', '头衔管理', 0, '', ''),
(36, '用户头衔列表', 35, 0, 'Rank/userRankList', 1, '', '', 0, '', ''),
(37, '关联新头衔', 35, 0, 'Rank/userAddRank', 1, '', '', 0, '', ''),
(38, '编辑头衔关联', 35, 0, 'Rank/userChangeRank', 1, '', '', 0, '', ''),
(39, '扩展资料', 2, 3, 'User/profile', 0, '', '标签与资料', 0, '', ''),
(40, '添加、编辑分组', 39, 0, 'Admin/User/editProfile', 0, '', '', 0, '', ''),
(41, '分组排序', 39, 0, 'Admin/User/sortProfile', 0, '', '', 0, '', ''),
(42, '字段列表', 39, 0, 'Admin/User/field', 0, '', '', 0, '', ''),
(43, '添加、编辑字段', 39, 0, 'Admin/User/editFieldSetting', 0, '', '', 0, '', ''),
(44, '字段排序', 39, 0, 'Admin/User/sortField', 0, '', '', 0, '', ''),
(45, '用户扩展资料列表', 2, 7, 'User/expandinfo_select', 0, '', '标签与资料', 0, '', ''),
(46, '扩展资料详情', 45, 0, 'User/expandinfo_details', 0, '', '', 0, '', ''),
(47, '待审核用户头衔', 2, 2, 'Rank/rankVerify', 0, '', '头衔管理', 0, '', ''),
(48, '被驳回的头衔申请', 2, 3, 'Rank/rankVerifyFailure', 0, '', '头衔管理', 0, '', ''),
(49, '转移权限组', 2, 7, 'User/changeGroup', 1, '批量转移权限组', '', 0, '', ''),
(50, '基础配置', 2, 1, 'UserConfig/index', 0, '', '用户配置', 0, '', ''),
(51, '积分类型', 197, 1, 'User/scoreList', 0, '', '行为与积分', 0, '', ''),
(52, '新增/编辑类型', 197, 2, 'User/editScoreType', 1, '', '行为与积分', 0, '', ''),
(53, '充值积分', 197, 5, 'User/recharge', 1, '', '', 0, '用户管理', ''),
(54, '头衔列表', 2, 6, 'Rank/index', 0, '', '头衔管理', 0, '', ''),
(55, '添加头衔', 54, 2, 'Rank/editRank', 1, '', '头衔管理', 0, '', ''),
(57, '插件管理', 105, 4, 'Addons/index', 0, '', '本地', 0, '', ''),
(58, '钩子管理', 57, 2, 'Addons/hooks', 0, '', '本地', 0, '', ''),
(59, '创建', 57, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0, '', ''),
(60, '检测创建', 57, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0, '', ''),
(61, '预览', 57, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0, '', ''),
(62, '快速生成插件', 57, 0, 'Addons/build', 0, '开始生成插件结构', '', 0, '', ''),
(64, '设置', 57, 0, 'Addons/config', 0, '设置插件配置', '', 0, '', ''),
(65, '禁用', 57, 0, 'Addons/disable', 0, '禁用插件', '', 0, '', ''),
(66, '启用', 57, 0, 'Addons/enable', 0, '启用插件', '', 0, '', ''),
(67, '安装', 57, 0, 'Addons/install', 0, '安装插件', '', 0, '', ''),
(68, '卸载', 57, 0, 'Addons/uninstall', 0, '卸载插件', '', 0, '', ''),
(69, '更新配置', 57, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0, '', ''),
(70, '插件后台列表', 57, 0, 'Addons/adminList', 0, '', '', 0, '', ''),
(71, 'URL方式访问插件', 57, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0, '', ''),
(72, '新增钩子', 58, 0, 'Addons/addHook', 0, '', '', 0, '', ''),
(73, '编辑钩子', 58, 0, 'Addons/edithook', 0, '', '', 0, '', ''),
(74, '系统', 0, 7, 'Config/group', 0, '', '', 0, 'windows', ''),
(75, '网站设置', 74, 1, 'Config/group', 0, '', '网站设置', 0, '', ''),
(76, '配置管理', 74, 7, 'Config/index', 0, '', '网站设置', 0, '', ''),
(77, '编辑', 76, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0, '', ''),
(78, '删除', 76, 0, 'Config/del', 0, '删除配置', '', 0, '', ''),
(79, '新增', 76, 0, 'Config/add', 0, '新增配置', '', 0, '', ''),
(80, '保存', 76, 0, 'Config/save', 0, '保存配置', '', 0, '', ''),
(81, '排序', 76, 0, 'Config/sort', 1, '', '', 0, '', ''),
(82, '后台菜单管理', 74, 6, 'Menu/index', 0, '', '导航管理', 1, '', ''),
(83, '新增', 82, 0, 'Menu/add', 0, '', '系统设置', 0, '', ''),
(84, '编辑', 82, 0, 'Menu/edit', 0, '', '', 0, '', ''),
(85, '导入', 82, 0, 'Menu/import', 0, '', '', 0, '', ''),
(86, '排序', 82, 0, 'Menu/sort', 1, '', '', 0, '', ''),
(87, '顶部导航', 74, 3, 'Channel/index', 0, '', '导航管理', 0, '', ''),
(88, '新增', 87, 0, 'Channel/add', 0, '', '', 0, '', ''),
(89, '编辑', 87, 0, 'Channel/edit', 0, '', '', 0, '', ''),
(90, '删除', 87, 0, 'Channel/del', 0, '', '', 0, '', ''),
(91, '排序', 87, 0, 'Channel/sort', 1, '', '', 0, '', ''),
(92, '备份数据库', 74, 8, 'Database/index?type=export', 0, '', '网站数据管理', 0, '', ''),
(93, '备份', 92, 0, 'Database/export', 0, '备份数据库', '', 0, '', ''),
(94, '优化表', 92, 0, 'Database/optimize', 0, '优化数据表', '', 0, '', ''),
(95, '修复表', 92, 0, 'Database/repair', 0, '修复数据表', '', 0, '', ''),
(96, '还原数据库', 74, 9, 'Database/index?type=import', 0, '', '网站数据管理', 0, '', ''),
(97, '恢复', 96, 0, 'Database/import', 0, '数据库恢复', '', 0, '', ''),
(98, '删除', 96, 0, 'Database/del', 0, '删除备份文件', '', 0, '', ''),
(99, 'SEO规则管理', 197, 8, 'SEO/index', 0, '', 'SEO管理', 0, '', ''),
(100, '新增、编辑', 99, 0, 'SEO/editRule', 0, '', '', 0, '', ''),
(101, '排序', 99, 0, 'SEO/sortRule', 1, '', '', 0, '', ''),
(102, 'SEO规则回收站', 197, 9, 'SEO/ruleTrash', 0, '', 'SEO管理', 0, '', ''),
(103, '全部补丁', 74, 16, 'Update/quick', 1, '', '升级补丁', 0, '', ''),
(104, '新增补丁', 74, 15, 'Update/addpack', 1, '', '升级补丁', 0, '', ''),
(105, '扩展', 0, 11, 'Cloud/index', 0, '', '', 0, 'cloud', ''),
(106, '模块安装', 105, 3, 'module/install', 1, '', '本地', 0, '', ''),
(107, '模块管理', 105, 5, 'module/lists', 0, '', '本地', 0, '', ''),
(108, '卸载模块', 105, 7, 'module/uninstall', 1, '', '本地', 0, '', ''),
(109, '授权', 0, 6, 'authorize/ssoSetting', 0, '', '', 1, 'lock', ''),
(110, '单点登录配置', 109, 0, 'Authorize/ssoSetting', 0, '', '单点登录', 1, '', ''),
(111, '应用列表', 109, 0, 'Authorize/ssolist', 0, '', '单点登录', 1, '', ''),
(112, '新增/编辑应用', 109, 0, 'authorize/editssoapp', 1, '', '单点登录', 1, '', ''),
(114, '用户行为', 197, 6, 'ActionLimit/limitList', 0, '', '行为与积分', 0, '', ''),
(115, '新增/编辑行为限制', 197, 7, 'ActionLimit/editLimit', 1, '', '行为与积分', 0, '', ''),
(117, '身份列表', 2, 1, 'Role/index', 0, '', '身份管理', 0, '', ''),
(118, '编辑身份', 2, 2, 'Role/editRole', 1, '', '身份管理', 0, '', ''),
(119, '启用、禁用、删除身份', 2, 3, 'Role/setStatus', 1, '', '身份管理', 0, '', ''),
(120, '身份排序', 2, 4, 'Role/sort', 1, '', '身份管理', 0, '', ''),
(121, '默认积分配置', 117, 0, 'Role/configScore', 1, '', '', 0, '', ''),
(122, '默认权限配置', 117, 0, 'Role/configAuth', 1, '', '', 0, '', ''),
(123, '默认头像配置', 117, 0, 'Role/configAvatar', 1, '', '', 0, '', ''),
(124, '默认头衔配置', 117, 0, 'Role/configRank', 1, '', '', 0, '', ''),
(125, '默认字段管理', 117, 0, 'Role/configField', 1, '', '', 0, '', ''),
(126, '身份分组', 2, 5, 'Role/group', 0, '', '身份管理', 0, '', ''),
(127, '编辑分组', 126, 0, 'Role/editGroup', 1, '', '', 0, '', ''),
(128, '删除分组', 126, 0, 'Role/deleteGroup', 1, '', '', 0, '', ''),
(129, '身份基本信息配置', 2, 6, 'Role/config', 1, '', '身份管理', 0, '', ''),
(130, '用户身份归属列表', 2, 7, 'Role/userList', 0, '', '身份管理', 0, '', ''),
(131, '设置用户状态', 130, 0, 'Role/setUserStatus', 1, '', '', 0, '', ''),
(132, '审核用户', 130, 0, 'Role/setUserAudit', 1, '', '', 0, '', ''),
(133, '迁移用户', 130, 0, 'Role/changeRole', 1, '', '', 0, '', ''),
(134, '上传默认头像', 123, 0, 'Role/uploadPicture', 1, '', '', 0, '', ''),
(135, '邀请码类型', 197, 8, 'Invite/index', 0, '', '邀请注册管理', 0, '', ''),
(136, '邀请码管理', 197, 9, 'Invite/invite', 0, '', '邀请注册管理', 0, '', ''),
(138, '兑换记录', 197, 11, 'Invite/buyLog', 0, '', '邀请注册管理', 0, '', ''),
(139, '用户邀请记录', 197, 12, 'Invite/inviteLog', 0, '', '邀请注册管理', 0, '', ''),
(140, '邀请码列表', 197, 13, 'Invite/userInfo', 0, '', '邀请注册管理', 0, '', ''),
(141, '编辑邀请注册类型', 135, 0, 'Invite/edit', 1, '', '', 0, '', ''),
(142, '删除邀请', 135, 0, 'Invite/setStatus', 1, '', '', 0, '', ''),
(143, '删除邀请码', 136, 0, 'Invite/delete', 1, '', '', 0, '', ''),
(144, '生成邀请码', 136, 0, 'Invite/createCode', 1, '', '', 0, '', ''),
(145, '删除无用邀请码', 136, 0, 'Invite/deleteTrue', 1, '', '', 0, '', ''),
(146, '导出cvs', 136, 0, 'Invite/cvs', 1, '', '', 0, '', ''),
(147, '用户信息编辑', 140, 0, 'Invite/editUserInfo', 1, '', '', 0, '', ''),
(148, '删除日志', 31, 0, 'Action/remove', 1, '', '', 0, '', ''),
(149, '清空日志', 31, 0, 'Action/clear', 1, '', '', 0, '', ''),
(150, '设置积分状态', 51, 0, 'User/setTypeStatus', 1, '', '', 0, '', ''),
(151, '删除积分类型', 51, 0, 'User/delType', 1, '', '', 0, '', ''),
(152, '充值积分-获取用户昵称', 53, 0, 'User/getNickname', 1, '', '', 0, '', ''),
(153, '删除菜单', 82, 0, 'Menu/del', 1, '', '', 0, '', ''),
(154, '设置开发者模式可见', 82, 0, 'Menu/toogleDev', 1, '', '', 0, '', ''),
(155, '设置显示隐藏', 82, 0, 'Menu/toogleHide', 1, '', '', 0, '', ''),
(156, '行为限制启用、禁用、删除', 114, 0, 'ActionLimit/setLimitStatus', 1, '', '', 0, '', ''),
(157, '启用、禁用、删除、回收站还原', 99, 0, 'SEO/setRuleStatus', 1, '', '', 0, '', ''),
(158, '回收站彻底删除', 102, 0, 'SEO/doClear', 1, '', '', 0, '', ''),
(159, '初始化无角色用户', 130, 0, 'Role/initUnhaveUser', 1, '', '', 0, '', ''),
(160, '删除钩子', 58, 0, 'Addons/delHook', 0, '', '', 0, '', ''),
(161, '使用补丁', 103, 0, 'Update/usePack', 1, '', '', 0, '', ''),
(162, '查看补丁', 103, 0, 'Update/view', 1, '', '', 0, '', ''),
(163, '删除补丁', 103, 0, 'Update/delPack', 1, '', '', 0, '', ''),
(164, '用户标签列表', 2, 4, 'UserTag/userTag', 0, '', '标签与资料', 0, '', ''),
(165, '添加分类、标签', 164, 0, 'UserTag/add', 1, '', '', 0, '', ''),
(166, '设置分类、标签状态', 164, 0, 'UserTag/setStatus', 1, '', '', 0, '', ''),
(167, '分类、标签回收站', 164, 0, 'UserTag/tagTrash', 1, '', '', 0, '', ''),
(168, '测底删除回收站内容', 164, 0, 'UserTag/userTagClear', 1, '', '', 0, '', ''),
(169, '可拥有标签配置', 2, 14, 'role/configusertag', 1, '', '标签与资料', 0, '', ''),
(170, '编辑模块', 107, 0, 'Module/edit', 1, '', '模块管理', 0, '', ''),
(171, '网站信息', 74, 2, 'Config/website', 0, '', '网站设置', 0, '', ''),
(172, '主题管理', 105, 6, 'Theme/tpls', 0, '', '本地', 0, '', ''),
(173, '使用主题', 105, 8, 'Theme/setTheme', 1, '', '本地', 0, '', ''),
(174, '查看主题', 105, 9, 'Theme/lookTheme', 1, '', '本地', 0, '', ''),
(175, '主题打包下载', 105, 10, 'Theme/packageDownload', 1, '', '本地', 0, '', ''),
(176, '卸载删除主题', 105, 11, 'Theme/delete', 1, '', '本地', 0, '', ''),
(177, '上传安装主题', 105, 12, 'Theme/add', 1, '', '本地', 0, '', ''),
(178, '云市场', 105, 1, 'Cloud/index', 0, '', '云市场', 0, '', ''),
(197, '运营', 0, 4, 'Super_links/index', 0, '', '', 0, 'laptop', ''),
(198, '群发消息用户列表', 74, 99, 'message/userList', 0, '', '群发消息', 0, '', ''),
(199, '群发消息', 197, 5, 'message/sendMessage', 1, '', '群发消息', 0, '', ''),
(200, '在线安装', 178, 0, 'Cloud/install', 1, '', '', 0, '', ''),
(201, '重置用户密码', 3, 0, 'User/initpass', 1, '', '', 0, '', ''),
(202, '自动升级', 105, 2, 'Cloud/update', 0, '', '云市场', 0, '', ''),
(203, '获取版本信息', 202, 0, 'Cloud/version', 1, '', '', 0, '', ''),
(204, '获取文件列表', 202, 0, 'Cloud/getFileList', 1, '', '', 0, '', ''),
(205, '比较本地文件', 202, 0, 'Cloud/compare', 1, '', '', 0, '', ''),
(206, '覆盖文件', 202, 0, 'Cloud/cover', 1, '', '', 0, '', ''),
(207, '更新数据库', 202, 0, 'Cloud/updb', 1, '', '', 0, '', ''),
(208, '更新完成', 202, 0, 'Cloud/finish', 1, '', '', 0, '', ''),
(209, '表情设置', 197, 4, 'Expression/index', 0, '', '表情管理', 0, '', ''),
(210, '添加表情包', 197, 5, 'Expression/add', 1, '', '表情管理', 0, '', ''),
(211, '表情包列表', 197, 6, 'Expression/package', 0, '', '表情管理', 0, '', ''),
(212, '表情列表', 197, 7, 'Expression/expressionList', 1, '', '表情管理', 0, '', ''),
(213, '删除表情包', 197, 8, 'Expression/delPackage', 1, '', '表情管理', 0, '', ''),
(214, '编辑表情包', 197, 9, 'Expression/editPackage', 1, '', '表情管理', 0, '', ''),
(215, '删除表情', 197, 10, 'Expression/delExpression', 1, '', '表情管理', 0, '', ''),
(216, '上传表情包', 197, 11, 'Expression/upload', 1, '', '表情管理', 0, '', ''),
(217, '用户头衔审核', 47, 2, 'Rank/setVerifyStatus', 1, '', '头衔管理', 0, '', ''),
(218, '获取扩展升级列表', 106, 0, 'Cloud/getVersionList', 1, '', '', 0, '', ''),
(219, '自动升级', 178, 0, 'Cloud/updateGoods', 1, '', '', 0, '', ''),
(220, '自动升级1-获取文件列表', 178, 0, 'Cloud/Updating1', 1, '', '', 0, '', ''),
(221, '自动升级2-比较文件', 178, 0, 'Cloud/Updating2', 1, '', '', 0, '', ''),
(222, '自动升级3-升级代码', 178, 0, 'Cloud/updating3', 1, '', '', 0, '', ''),
(223, '自动升级4-导入数据库', 178, 0, 'Cloud/updating4', 1, '', '', 0, '', ''),
(224, '自动升级5-重置版本号', 178, 0, 'Cloud/updating5', 1, '', '', 0, '', ''),
(225, '广告位', 197, 0, 'Adv/pos', 0, '', '广告配置', 0, '', ''),
(226, '广告管理', 197, 0, 'Adv/adv', 0, '', '广告配置', 0, '', ''),
(227, '新增广告', 226, 0, 'Adv/editAdv', 1, '', '', 0, '', ''),
(228, '编辑广告位', 225, 0, 'Adv/editPos', 1, '', '', 0, '', ''),
(229, '设置广告位状态', 225, 0, 'Adv/setPosStatus', 1, '', '', 0, '', ''),
(230, '广告排期', 226, 0, 'Adv/schedule', 1, '', '', 0, '', ''),
(231, '用户导航', 74, 0, 'Channel/user', 0, '', '导航管理', 0, '', 'Core'),
(232, '积分日志', 197, 0, 'Action/scoreLog', 0, '', '行为与积分', 0, '', ''),
(233, '仪表盘', 1, 1, 'Index/index', 0, '', '系统首页', 0, '', ''),
(234, '数据概览', 1, 2, 'Index/stats', 0, '', '系统首页', 0, '', ''),
(235, '公告列表', 197, 0, 'Announce/announceList', 0, '', '友链与公告', 0, '', ''),
(236, '发布公告', 197, 0, 'Announce/add', 0, '', '友链与公告', 0, '', ''),
(237, '设置公告状态', 235, 0, 'Announce/setStatus', 1, '', '公告管理', 0, '', ''),
(238, '公告送达情况', 235, 0, 'Announce/arrive', 1, '', '公告管理', 0, '', ''),
(239, '会话列表', 74, 0, 'Message/messageSessionList', 0, '', '消息管理', 0, '', ''),
(240, '会话模板', 74, 0, 'Message/messageTplList', 0, '', '消息管理', 0, '', ''),
(241, '刷新会话列表', 74, 0, 'Message/sessionRefresh', 1, '', '消息管理', 0, '', ''),
(242, '刷新会话模板列表', 74, 0, 'Message/tplRefresh', 1, '', '消息管理', 0, '', ''),
(243, '计划任务列表', 74, 99, 'admin/schedule/scheduleList', 0, '', '计划任务', 0, '', ''),
(244, '新增/编辑计划任务', 243, 0, 'Schedule/editSchedule', 1, '', '计划任务', 0, '', ''),
(245, '运行/停止计划任务', 243, 0, 'admin/schedule/run', 1, '', '计划任务', 0, '', ''),
(246, '查看日志', 243, 0, 'Schedule/showLog', 1, '', '计划任务', 0, '', ''),
(247, '清空日志', 243, 0, 'admin/schedule/clearLog', 1, '', '计划任务', 0, '', ''),
(248, '重启计划任务', 243, 0, 'Schedule/reRun', 1, '', '计划任务', 0, '', ''),
(249, '设置计划任务状态', 243, 0, 'Schedule/setScheduleStatus', 1, '', '计划任务', 0, '', ''),
(250, '网站统计', 1, 3, 'Count/index', 0, '', '数据统计', 0, '', ''),
(251, '流失率统计', 1, 4, 'Count/lost', 0, '', '数据统计', 0, '', ''),
(252, '留存率统计', 1, 5, 'Count/remain', 0, '', '数据统计', 0, '', ''),
(253, '充值用户统计', 1, 6, 'Count/consumption', 0, '', '数据统计', 0, '', ''),
(254, '活跃用户统计', 1, 7, 'Count/active', 0, '', '数据统计', 0, '', ''),
(255, '设置活跃度绑定的行为', 1, 0, 'Count/setActiveAction', 1, '', '数据统计', 0, '', ''),
(256, '在线用户列表', 1, 8, 'Count/nowUserList', 0, '', '数据统计', 0, '', ''),
(257, '下线在线用户', 1, 0, 'Count/downUser', 1, '', '数据统计', 0, '', ''),
(258, '会话设置', 74, 0, 'Message/config', 0, '', '消息管理', 0, '', ''),
(259, '频道编辑', 87, 0, 'Channel/customEdit', 0, '', '', 0, '', ''),
(260, '添加', 233, 0, 'Index/addTo', 0, '', '', 0, '', ''),
(261, '删除', 233, 0, 'Index/delTile', 0, '', '', 0, '', ''),
(262, '修改', 233, 0, 'Index/setTile', 0, '', '', 0, '', ''),
(263, '友情链接', 197, 0, 'SuperLinks/index', 0, '', '友链与公告', 0, '', ''),
(264, '图片水印设置', 197, 0, 'Picture/config', 0, '', '图片管理', 0, '', ''),
(265, '上传水印图片', 264, 0, 'Picture/uploadWater', 1, '', '图片管理', 0, '', ''),
(266, '图片列表', 197, 0, 'Picture/pictureList', 0, '', '图片管理', 0, '', ''),
(267, '设置图片状态、删除图片', 266, 0, 'Picture/setStatus', 1, '', '图片管理', 0, '', ''),
(268, '敏感词列表', 197, 0, 'Sensitive/index', 0, '', '敏感词', 0, '', ''),
(269, '敏感词设置', 197, 0, 'Sensitive/config', 0, '', '敏感词', 0, '', ''),
(270, '批量添加', 197, 0, 'Sensitive/addMore', 0, '', '敏感词', 0, '', ''),
(271, '新增、编辑敏感词', 268, 0, 'Sensitive/edit', 1, '', '', 0, '', ''),
(272, '设置敏感词状态', 268, 0, 'Sensitive/setStatus', 1, '', '', 0, '', ''),
(273, '自定义表情列表', 197, 0, 'Expression/iexpressionList', 0, '', '表情管理', 0, '', ''),
(274, '允许身份访问', 1, 0, 'Role/moduleRole', 0, '', '模块权限', 0, '', ''),
(275, '认证类型', 2, 0, 'Attest/attestTypes', 0, '', '认证管理', 0, '', 'Ucenter'),
(276, '认证条件设置', 275, 0, 'Attest/setCondition', 1, '', '认证管理', 0, '', 'Ucenter'),
(277, '认证字段管理', 275, 0, 'Attest/setFields', 1, '', '认证管理', 0, '', 'Ucenter'),
(278, '编辑认证类型', 275, 0, 'Attest/editType', 1, '', '认证管理', 0, '', 'Ucenter'),
(279, '认证用户列表', 2, 0, 'Attest/attestList', 0, '', '认证管理', 0, '', ''),
(280, '设置认证状态', 279, 0, 'Attest/setAttestStatus', 1, '', '认证管理', 0, '', ''),
(281, '微信绑定', 2, 0, 'User/bindwechat', 0, '', '用户配置', 0, '', ''),
(282, '短信日志', 197, 4, 'Action/smslog', 0, '', '行为与积分', 0, '', ''),
(283, '编辑器配置', 74, 7, 'EditorTool/config', 0, '', '系统设置', 0, '', ''),
(284, 'MarkDown配置', 74, 7, 'MarkDown/config', 0, '', '系统设置', 0, '', ''),
(285, '消息模板', 74, 0, 'Message/listMessageEvent', 0, '', '消息管理', 0, '', ''),
(10000, '网站主页', 0, 0, 'Home/config', 1, '', '', 0, 'home', 'Home'),
(10001, '基本设置', 10000, 0, 'Home/config', 0, '', '设置', 0, '', 'Home'),
(10002, '微博', 0, 8, 'Weibo/weibo', 1, '', '', 0, '', 'Weibo'),
(10003, '微博管理', 10002, 1, 'Weibo/weibo', 0, '', '微博', 0, '', 'Weibo'),
(10004, '回复管理', 10002, 3, 'Weibo/comment', 0, '', '回复', 0, '', 'Weibo'),
(10005, '编辑微博', 10002, 0, 'Weibo/editWeibo', 1, '', '', 0, '', 'Weibo'),
(10006, '编辑回复', 10002, 0, 'Weibo/editComment', 1, '', '', 0, '', 'Weibo'),
(10007, '微博回收站', 10002, 2, 'Weibo/weiboTrash', 0, '', '微博', 0, '', 'Weibo'),
(10008, '回复回收站', 10002, 4, 'Weibo/commentTrash', 0, '', '回复', 0, '', 'Weibo'),
(10009, '微博设置', 10002, 0, 'Weibo/config', 0, '微博的基本配置', '设置', 0, '', 'Weibo'),
(10010, '话题管理', 10002, 0, 'Weibo/topic', 0, '微博的话题', '话题管理', 0, '', 'Weibo'),
(10011, '置顶微博', 10002, 0, 'Weibo/setWeiboTop', 1, '', '', 0, '', 'Weibo'),
(10012, '设置微博状态', 10002, 0, 'Weibo/setWeiboStatus', 1, '', '', 0, '', 'Weibo'),
(10013, '设置微博评论状态', 10002, 0, 'Weibo/setCommentStatus', 1, '', '', 0, '', 'Weibo'),
(10014, '设置置顶话题', 10002, 0, 'Weibo/setTopicTop', 1, '', '', 0, '', 'Weibo'),
(10015, '删除话题', 10002, 0, 'Weibo/delTopic', 1, '', '', 0, '', 'Weibo'),
(10016, '会员展示', 0, 22, 'People/config', 1, '', '', 0, '', 'People'),
(10017, '基本设置', 10016, 0, 'People/config', 0, '', '配置', 0, '', 'People');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_message`
--

DROP TABLE IF EXISTS `ocenter_message`;
CREATE TABLE IF NOT EXISTS `ocenter_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `from_uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `last_toast` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` varchar(25) NOT NULL COMMENT '消息类型',
  `tpl` varchar(100) NOT NULL COMMENT '消息模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='消息表';

--
-- 转存表中的数据 `ocenter_message`
--

INSERT INTO `ocenter_message` (`id`, `content_id`, `from_uid`, `to_uid`, `create_time`, `is_read`, `last_toast`, `status`, `type`, `tpl`) VALUES
(1, 7, 102, 1, 1530625801, 1, 1530625892, 1, 'Weibo', 'Common_comment'),
(2, 12, 104, 1, 1532701852, 0, 0, 1, 'Ucenter', ''),
(3, 15, 104, 1, 1532701857, 0, 0, 1, 'Ucenter', ''),
(4, 16, 104, 1, 1532701858, 0, 0, 1, 'Ucenter', ''),
(5, 25, 106, 105, 1532744069, 0, 0, 1, 'Ucenter', ''),
(6, 32, 106, 105, 1532744867, 0, 0, 1, 'Ucenter', ''),
(7, 33, 106, 105, 1532744869, 0, 0, 1, 'Ucenter', ''),
(8, 36, 106, 1, 1532744871, 0, 0, 1, 'Ucenter', ''),
(9, 37, 106, 105, 1532744895, 0, 0, 1, 'Weibo', 'Common_comment'),
(10, 42, 107, 106, 1532745005, 0, 0, 1, 'Ucenter', ''),
(11, 45, 107, 105, 1532745032, 0, 0, 1, 'Weibo', 'Common_comment'),
(12, 48, 107, 106, 1532745032, 0, 0, 1, 'Weibo', 'Common_comment'),
(13, 57, 108, 106, 1532747638, 0, 0, 1, 'Ucenter', ''),
(14, 58, 108, 105, 1532747640, 0, 0, 1, 'Ucenter', ''),
(15, 59, 108, 105, 1532747663, 0, 0, 1, 'Weibo', 'Common_comment'),
(16, 64, 108, 1, 1532747668, 0, 0, 1, 'Ucenter', ''),
(17, 75, 108, 106, 1532765147, 0, 0, 1, 'Ucenter', ''),
(18, 78, 108, 105, 1532765148, 0, 0, 1, 'Ucenter', ''),
(19, 81, 108, 105, 1532765156, 0, 0, 1, 'Weibo', 'Common_comment'),
(20, 96, 108, 106, 1532765548, 0, 0, 1, 'Ucenter', ''),
(21, 97, 108, 105, 1532765549, 0, 0, 1, 'Ucenter', ''),
(22, 98, 108, 104, 1532765550, 0, 0, 1, 'Ucenter', ''),
(23, 99, 108, 1, 1532765593, 0, 0, 1, 'Ucenter', ''),
(24, 100, 109, 108, 1532765755, 1, 1532765761, 1, 'Weibo', 'Common_comment'),
(25, 107, 109, 108, 1532765770, 1, 1532765771, 1, 'Weibo', 'Common_comment'),
(26, 108, 109, 108, 1532765777, 1, 1532765781, 1, 'Ucenter', ''),
(27, 113, 108, 105, 1532766791, 0, 0, 1, 'Weibo', 'Common_comment');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_message_content`
--

DROP TABLE IF EXISTS `ocenter_message_content`;
CREATE TABLE IF NOT EXISTS `ocenter_message_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(100) NOT NULL,
  `args` text NOT NULL,
  `type` varchar(25) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_message_content`
--

INSERT INTO `ocenter_message_content` (`id`, `from_id`, `title`, `content`, `url`, `args`, `type`, `create_time`, `status`) VALUES
(1, 1, 'admin@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'Weibo/Index/weiboDetail', '{\"id\":1}', 'Common_mobile', 1530625646, 1),
(2, 1, 'admin@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'Weibo/Index/weiboDetail', '{\"id\":1}', 'Common_email', 1530625646, 1),
(3, 1, 'admin赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'weibo/index/weibodetail', '{\"id\":\"1\"}', 'Common_mobile', 1530625653, 1),
(4, 1, 'admin赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'weibo/index/weibodetail', '{\"id\":\"1\"}', 'Common_email', 1530625653, 1),
(5, 1, 'admin赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'weibo/index/weibodetail', '{\"id\":\"1\"}', 'Common_mobile', 1530625654, 1),
(6, 1, 'admin赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'weibo/index/weibodetail', '{\"id\":\"1\"}', 'Common_email', 1530625654, 1),
(7, 102, '评论消息', '{\"keyword1\":\"\\u5bf9GPA\\u6709\\u8981\\u6c42\\u5417\\uff1f\\u7269\\u7406\\u5b66\\u9662\\u53ef\\u4e0d\\u53ef\\u4ee5\\u53c2\\u52a0\\uff1f\\u8c22\\u8c22\\u8001\\u5e08\\u3002\",\"keyword2\":\"\\u8bc4\\u8bba\\u6211\\u7684\\u52a8\\u6001\\uff1a\",\"keyword3\":\"\\u5927\\u6570\\u636e\\u5206\\u6790\\u5b9e\\u9a8c\\u5ba4\\u62db\\u6536\\u4f18\\u79c0\\u7684\\u672c\\u79d1\\u751f\\u8fdb\\u5b9e\\u9a8c\\u5ba4\\u53c2\\u89c2\\uff0c\\u6709\\u610f\\u8005\\u53ef\\u79c1\\u4fe1\\u6211\\uff0c\\u8bf7\\u9644\\u4e2a\\u4eba\\u57fa\\u672c\\u4fe1\\u606f\\uff01\"}', 'Weibo/Index/weiboDetail', '{\"id\":1}', 'Weibo', 1530625801, 1),
(8, 102, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'Weibo/Index/weiboDetail', '{\"id\":1}', 'Common_mobile', 1530625801, 1),
(9, 102, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'Weibo/Index/weiboDetail', '{\"id\":1}', 'Common_email', 1530625801, 1),
(10, 102, 'zsl1996@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'Weibo/Index/weiboDetail', '{\"id\":1}', 'Common_mobile', 1530625801, 1),
(11, 102, 'zsl1996@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'Weibo/Index/weiboDetail', '{\"id\":1}', 'Common_email', 1530625801, 1),
(12, 104, 'zsl19960523赞了您', '有人赞了您的微博，快去看看吧^……^！', 'weibo/index/weibodetail', '{\"id\":\"1\"}', 'Ucenter', 1532701852, 1),
(13, 104, 'zsl19960523赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'weibo/index/weibodetail', '{\"id\":\"1\"}', 'Common_mobile', 1532701852, 1),
(14, 104, 'zsl19960523赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'weibo/index/weibodetail', '{\"id\":\"1\"}', 'Common_email', 1532701852, 1),
(15, 104, '粉丝数增加', 'zsl19960523 关注了你。', 'Ucenter/Index/index', '{\"uid\":\"104\"}', 'Ucenter', 1532701857, 1),
(16, 104, '粉丝数减少', 'zsl19960523 取消了对你的关注。', 'Ucenter/Index/index', '{\"uid\":\"104\"}', 'Ucenter', 1532701858, 1),
(17, 105, 'MSRA、@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_mobile', 1532704833, 1),
(18, 105, 'MSRA、@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_email', 1532704833, 1),
(19, 105, 'MSRA、赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'weibo/index/weibodetail', '{\"id\":\"2\"}', 'Common_mobile', 1532704837, 1),
(20, 105, 'MSRA、赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'weibo/index/weibodetail', '{\"id\":\"2\"}', 'Common_email', 1532704837, 1),
(21, 105, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_mobile', 1532704880, 1),
(22, 105, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_email', 1532704880, 1),
(23, 105, 'MSRA、@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_mobile', 1532704880, 1),
(24, 105, 'MSRA、@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_email', 1532704880, 1),
(25, 106, 'zzz赞了您', '有人赞了您的微博，快去看看吧^……^！', 'weibo/index/weibodetail', '{\"id\":\"2\"}', 'Ucenter', 1532744069, 1),
(26, 106, 'zzz赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'weibo/index/weibodetail', '{\"id\":\"2\"}', 'Common_mobile', 1532744069, 1),
(27, 106, 'zzz赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'weibo/index/weibodetail', '{\"id\":\"2\"}', 'Common_email', 1532744069, 1),
(28, 106, 'zzz@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/3.html', 'Weibo/Index/weiboDetail', '{\"id\":3}', 'Common_mobile', 1532744862, 1),
(29, 106, 'zzz@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/3.html', 'Weibo/Index/weiboDetail', '{\"id\":3}', 'Common_email', 1532744862, 1),
(30, 106, 'zzz赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/3.html', 'weibo/index/weibodetail', '{\"id\":\"3\"}', 'Common_mobile', 1532744865, 1),
(31, 106, 'zzz赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/3.html', 'weibo/index/weibodetail', '{\"id\":\"3\"}', 'Common_email', 1532744865, 1),
(32, 106, '粉丝数增加', 'zzz 关注了你。', 'Ucenter/Index/index', '{\"uid\":\"106\"}', 'Ucenter', 1532744867, 1),
(33, 106, 'zzz赞了您', '有人赞了您的微博，快去看看吧^……^！', 'weibo/index/weibodetail', '{\"id\":\"2\"}', 'Ucenter', 1532744869, 1),
(34, 106, 'zzz赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'weibo/index/weibodetail', '{\"id\":\"2\"}', 'Common_mobile', 1532744869, 1),
(35, 106, 'zzz赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'weibo/index/weibodetail', '{\"id\":\"2\"}', 'Common_email', 1532744869, 1),
(36, 106, '粉丝数增加', 'zzz 关注了你。', 'Ucenter/Index/index', '{\"uid\":\"106\"}', 'Ucenter', 1532744871, 1),
(37, 106, '评论消息', '{\"keyword1\":\"\\u6750\\u6599\\u53d1\\u81f3\\u60a8\\u90ae\\u7bb1\\uff0c\\u8c22\\u8c22\",\"keyword2\":\"\\u8bc4\\u8bba\\u6211\\u7684\\u52a8\\u6001\\uff1a\",\"keyword3\":\"MSRA\\u8054\\u57f9\\u9879\\u76ee\\u5f00\\u59cb\\u5566\\uff0c\\u5feb\\u6765\\u62a5\\u540d\\u554a\"}', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Weibo', 1532744895, 1),
(38, 106, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_mobile', 1532744895, 1),
(39, 106, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_email', 1532744895, 1),
(40, 106, 'zzz@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_mobile', 1532744895, 1),
(41, 106, 'zzz@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_email', 1532744895, 1),
(42, 107, 'zzzz赞了您', '有人赞了您的微博，快去看看吧^……^！', 'weibo/index/weibodetail', '{\"id\":\"3\"}', 'Ucenter', 1532745005, 1),
(43, 107, 'zzzz赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/3.html', 'weibo/index/weibodetail', '{\"id\":\"3\"}', 'Common_mobile', 1532745005, 1),
(44, 107, 'zzzz赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/3.html', 'weibo/index/weibodetail', '{\"id\":\"3\"}', 'Common_email', 1532745005, 1),
(45, 107, '评论消息', '{\"keyword1\":\"\\u56de\\u590d@zzz\\uff1a\\u672c\\u5b9e\\u9a8c\\u5ba4\\u62db\\u4eba\",\"keyword2\":\"\\u8bc4\\u8bba\\u6211\\u7684\\u52a8\\u6001\\uff1a\",\"keyword3\":\"MSRA\\u8054\\u57f9\\u9879\\u76ee\\u5f00\\u59cb\\u5566\\uff0c\\u5feb\\u6765\\u62a5\\u540d\\u554a\"}', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Weibo', 1532745031, 1),
(46, 107, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_mobile', 1532745032, 1),
(47, 107, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_email', 1532745032, 1),
(48, 107, '评论消息', '{\"keyword1\":\"\\u56de\\u590d@zzz\\uff1a\\u672c\\u5b9e\\u9a8c\\u5ba4\\u62db\\u4eba\",\"keyword2\":\"\\u8bc4\\u8bba\\u6211\\u7684\\u52a8\\u6001\\uff1a\",\"keyword3\":\"MSRA\\u8054\\u57f9\\u9879\\u76ee\\u5f00\\u59cb\\u5566\\uff0c\\u5feb\\u6765\\u62a5\\u540d\\u554a\"}', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Weibo', 1532745032, 1),
(49, 107, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_mobile', 1532745032, 1),
(50, 107, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_email', 1532745032, 1),
(51, 107, 'zzzz@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_mobile', 1532745032, 1),
(52, 107, 'zzzz@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_email', 1532745032, 1),
(53, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/4.html', 'Weibo/Index/weiboDetail', '{\"id\":4}', 'Common_mobile', 1532747631, 1),
(54, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/4.html', 'Weibo/Index/weiboDetail', '{\"id\":4}', 'Common_email', 1532747631, 1),
(55, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/4.html', 'weibo/index/weibodetail', '{\"id\":\"4\"}', 'Common_mobile', 1532747633, 1),
(56, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/4.html', 'weibo/index/weibodetail', '{\"id\":\"4\"}', 'Common_email', 1532747633, 1),
(57, 108, '粉丝数增加', '讯飞语音 关注了你。', 'Ucenter/Index/index', '{\"uid\":\"108\"}', 'Ucenter', 1532747638, 1),
(58, 108, '粉丝数增加', '讯飞语音 关注了你。', 'Ucenter/Index/index', '{\"uid\":\"108\"}', 'Ucenter', 1532747640, 1),
(59, 108, '评论消息', '{\"keyword1\":\"\\u56de\\u590d@MSRA\\u3001\\uff1a\\u53ef\\u4ee5\\u4e86\\u89e3\\u4e0b\\u6211\\u4eec\\u5b9e\\u9a8c\\u5ba4\",\"keyword2\":\"\\u8bc4\\u8bba\\u6211\\u7684\\u52a8\\u6001\\uff1a\",\"keyword3\":\"MSRA\\u8054\\u57f9\\u9879\\u76ee\\u5f00\\u59cb\\u5566\\uff0c\\u5feb\\u6765\\u62a5\\u540d\\u554a\"}', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Weibo', 1532747663, 1),
(60, 108, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_mobile', 1532747663, 1),
(61, 108, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_email', 1532747663, 1),
(62, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_mobile', 1532747663, 1),
(63, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_email', 1532747663, 1),
(64, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！', 'weibo/index/weibodetail', '{\"id\":\"1\"}', 'Ucenter', 1532747668, 1),
(65, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'weibo/index/weibodetail', '{\"id\":\"1\"}', 'Common_mobile', 1532747668, 1),
(66, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/1.html', 'weibo/index/weibodetail', '{\"id\":\"1\"}', 'Common_email', 1532747668, 1),
(67, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/5.html', 'Weibo/Index/weiboDetail', '{\"id\":5}', 'Common_mobile', 1532765069, 1),
(68, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/5.html', 'Weibo/Index/weiboDetail', '{\"id\":5}', 'Common_email', 1532765069, 1),
(69, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/5.html', 'weibo/index/weibodetail', '{\"id\":\"5\"}', 'Common_mobile', 1532765072, 1),
(70, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/5.html', 'weibo/index/weibodetail', '{\"id\":\"5\"}', 'Common_email', 1532765072, 1),
(71, 108, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/5.html', 'Weibo/Index/weiboDetail', '{\"id\":5}', 'Common_mobile', 1532765091, 1),
(72, 108, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/5.html', 'Weibo/Index/weiboDetail', '{\"id\":5}', 'Common_email', 1532765091, 1),
(73, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/5.html', 'Weibo/Index/weiboDetail', '{\"id\":5}', 'Common_mobile', 1532765091, 1),
(74, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/5.html', 'Weibo/Index/weiboDetail', '{\"id\":5}', 'Common_email', 1532765091, 1),
(75, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！', 'weibo/index/weibodetail', '{\"id\":\"3\"}', 'Ucenter', 1532765147, 1),
(76, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/3.html', 'weibo/index/weibodetail', '{\"id\":\"3\"}', 'Common_mobile', 1532765147, 1),
(77, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/3.html', 'weibo/index/weibodetail', '{\"id\":\"3\"}', 'Common_email', 1532765147, 1),
(78, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！', 'weibo/index/weibodetail', '{\"id\":\"2\"}', 'Ucenter', 1532765148, 1),
(79, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'weibo/index/weibodetail', '{\"id\":\"2\"}', 'Common_mobile', 1532765148, 1),
(80, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'weibo/index/weibodetail', '{\"id\":\"2\"}', 'Common_email', 1532765148, 1),
(81, 108, '评论消息', '{\"keyword1\":\"\\u56de\\u590d@MSRA\\u3001\\uff1a\\u597d\\u7684\",\"keyword2\":\"\\u8bc4\\u8bba\\u6211\\u7684\\u52a8\\u6001\\uff1a\",\"keyword3\":\"MSRA\\u8054\\u57f9\\u9879\\u76ee\\u5f00\\u59cb\\u5566\\uff0c\\u5feb\\u6765\\u62a5\\u540d\\u554a\"}', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Weibo', 1532765156, 1),
(82, 108, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_mobile', 1532765156, 1),
(83, 108, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_email', 1532765156, 1),
(84, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_mobile', 1532765156, 1),
(85, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/2.html', 'Weibo/Index/weiboDetail', '{\"id\":2}', 'Common_email', 1532765156, 1),
(86, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/6.html', 'Weibo/Index/weiboDetail', '{\"id\":6}', 'Common_mobile', 1532765198, 1),
(87, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/6.html', 'Weibo/Index/weiboDetail', '{\"id\":6}', 'Common_email', 1532765198, 1),
(88, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/6.html', 'weibo/index/weibodetail', '{\"id\":\"6\"}', 'Common_mobile', 1532765201, 1),
(89, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/6.html', 'weibo/index/weibodetail', '{\"id\":\"6\"}', 'Common_email', 1532765201, 1),
(90, 108, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/6.html', 'Weibo/Index/weiboDetail', '{\"id\":6}', 'Common_mobile', 1532765214, 1),
(91, 108, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/6.html', 'Weibo/Index/weiboDetail', '{\"id\":6}', 'Common_email', 1532765214, 1),
(92, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/6.html', 'Weibo/Index/weiboDetail', '{\"id\":6}', 'Common_mobile', 1532765214, 1),
(93, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/6.html', 'Weibo/Index/weiboDetail', '{\"id\":6}', 'Common_email', 1532765214, 1),
(94, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/8.html', 'weibo/index/weibodetail', '{\"id\":\"8\"}', 'Common_mobile', 1532765217, 1),
(95, 108, '讯飞语音赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/8.html', 'weibo/index/weibodetail', '{\"id\":\"8\"}', 'Common_email', 1532765217, 1),
(96, 108, '粉丝数减少', '讯飞语音 取消了对你的关注。', 'Ucenter/Index/index', '{\"uid\":\"108\"}', 'Ucenter', 1532765548, 1),
(97, 108, '粉丝数减少', '讯飞语音 取消了对你的关注。', 'Ucenter/Index/index', '{\"uid\":\"108\"}', 'Ucenter', 1532765549, 1),
(98, 108, '粉丝数增加', '讯飞语音 关注了你。', 'Ucenter/Index/index', '{\"uid\":\"108\"}', 'Ucenter', 1532765550, 1),
(99, 108, '粉丝数增加', '讯飞语音 关注了你。', 'Ucenter/Index/index', '{\"uid\":\"108\"}', 'Ucenter', 1532765593, 1),
(100, 109, '评论消息', '{\"keyword1\":\"\\u6211\\u53ef\\u4ee5\\u5417\\uff1f\\uff1f\",\"keyword2\":\"\\u8bc4\\u8bba\\u6211\\u7684\\u52a8\\u6001\\uff1a\",\"keyword3\":\"\\u8baf\\u98de\\u62db\\u4eba\\u5566\"}', 'Weibo/Index/weiboDetail', '{\"id\":4}', 'Weibo', 1532765755, 1),
(101, 109, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/4.html', 'Weibo/Index/weiboDetail', '{\"id\":4}', 'Common_mobile', 1532765755, 1),
(102, 109, '评论消息', '您的微博被评论，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/4.html', 'Weibo/Index/weiboDetail', '{\"id\":4}', 'Common_email', 1532765755, 1),
(103, 109, 'zzzzzzz@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/4.html', 'Weibo/Index/weiboDetail', '{\"id\":4}', 'Common_mobile', 1532765755, 1),
(104, 109, 'zzzzzzz@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/4.html', 'Weibo/Index/weiboDetail', '{\"id\":4}', 'Common_email', 1532765755, 1),
(105, 109, 'zzzzzzz@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/7.html', 'Weibo/Index/weiboDetail', '{\"id\":7}', 'Common_mobile', 1532765770, 1),
(106, 109, 'zzzzzzz@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/7.html', 'Weibo/Index/weiboDetail', '{\"id\":7}', 'Common_email', 1532765770, 1),
(107, 109, '转发提醒', '{\"keyword1\":\"\\u5927\\u5bb6\\u770b\\u4e00\\u770b\",\"keyword2\":\"\\u8f6c\\u53d1\\u4e86\\u4f60\\u7684\\u5fae\\u535a\\uff1a\",\"keyword3\":\"\\u62db\\u6ee1\\u4e86\\uff01\"}', 'Weibo/Index/weiboDetail', '{\"id\":7}', 'Weibo', 1532765770, 1),
(108, 109, 'zzzzzzz赞了您', '有人赞了您的微博，快去看看吧^……^！', 'weibo/index/weibodetail', '{\"id\":\"6\"}', 'Ucenter', 1532765777, 1),
(109, 109, 'zzzzzzz赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/6.html', 'weibo/index/weibodetail', '{\"id\":\"6\"}', 'Common_mobile', 1532765777, 1),
(110, 109, 'zzzzzzz赞了您', '有人赞了您的微博，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/6.html', 'weibo/index/weibodetail', '{\"id\":\"6\"}', 'Common_email', 1532765777, 1),
(111, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/8.html', 'Weibo/Index/weiboDetail', '{\"id\":8}', 'Common_mobile', 1532766791, 1),
(112, 108, '讯飞语音@了您', '有人@了您，快去看看吧^……^！http://localhost/opensns/index.php?s=/weibo/index/weibodetail/id/8.html', 'Weibo/Index/weiboDetail', '{\"id\":8}', 'Common_email', 1532766791, 1),
(113, 108, '转发提醒', '{\"keyword1\":\"MSRA\\u62db\\u4eba\\u5566\",\"keyword2\":\"\\u8f6c\\u53d1\\u4e86\\u4f60\\u7684\\u5fae\\u535a\\uff1a\",\"keyword3\":\"MSRA\\u8054\\u57f9\\u9879\\u76ee\\u5f00\\u59cb\\u5566\\uff0c\\u5feb\\u6765\\u62a5\\u540d\\u554a\"}', 'Weibo/Index/weiboDetail', '{\"id\":8}', 'Weibo', 1532766791, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_message_event`
--

DROP TABLE IF EXISTS `ocenter_message_event`;
CREATE TABLE IF NOT EXISTS `ocenter_message_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL COMMENT '事件唯一标识',
  `title` varchar(25) NOT NULL,
  `status` int(2) NOT NULL,
  `zhannei` int(2) NOT NULL COMMENT '站内消息',
  `sms` int(2) NOT NULL COMMENT '短信',
  `email` int(2) NOT NULL COMMENT '电子邮件',
  `weixin` int(2) NOT NULL COMMENT '微信公众号消息',
  `app` int(2) NOT NULL COMMENT 'APP推送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='消息事件';

--
-- 转存表中的数据 `ocenter_message_event`
--

INSERT INTO `ocenter_message_event` (`id`, `name`, `title`, `status`, `zhannei`, `sms`, `email`, `weixin`, `app`) VALUES
(1, 'weibo_zan', '动态被点赞', 1, 1, 1, 1, 0, 0),
(2, 'weibo_comment', '动态被评论', 1, 1, 1, 1, 0, 0),
(3, 'weibo_aite', '动态被@', 1, 1, 1, 1, 0, 0),
(4, 'weibo_repost', '动态被转发', 1, 1, 1, 1, 0, 0),
(5, 'weibo_share', '动态被分享', 1, 1, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_message_old`
--

DROP TABLE IF EXISTS `ocenter_message_old`;
CREATE TABLE IF NOT EXISTS `ocenter_message_old` (
  `id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `from_uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `last_toast` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` varchar(25) NOT NULL COMMENT '消息类型',
  `tpl` varchar(100) NOT NULL COMMENT '消息模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_message_template`
--

DROP TABLE IF EXISTS `ocenter_message_template`;
CREATE TABLE IF NOT EXISTS `ocenter_message_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL COMMENT '事件id',
  `status` int(2) NOT NULL,
  `zhannei` text NOT NULL COMMENT '站内消息模板',
  `sms` text NOT NULL COMMENT '短信模板',
  `email` text NOT NULL COMMENT '电子邮件模板',
  `weixin` text NOT NULL COMMENT '微信公众号消息模板',
  `app` text NOT NULL COMMENT 'APP推送模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_message_template`
--

INSERT INTO `ocenter_message_template` (`id`, `event_id`, `status`, `zhannei`, `sms`, `email`, `weixin`, `app`) VALUES
(1, 1, 1, '<p>有人赞了您的微博，快去看看吧^……^！</p>', '<p>有人赞了您的微博，快去看看吧^……^！</p>', '<p>有人赞了您的微博，快去看看吧^……^！</p>', '', ''),
(2, 2, 1, '<p>您的微博被评论，快去看看吧^……^！</p>', '<p>您的微博被评论，快去看看吧^……^！</p>', '<p>您的微博被评论，快去看看吧^……^！</p>', '', ''),
(3, 3, 1, '<p>有人@了您，快去看看吧^……^！</p>', '<p>有人@了您，快去看看吧^……^！</p>', '<p>有人@了您，快去看看吧^……^！</p>', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_message_type`
--

DROP TABLE IF EXISTS `ocenter_message_type`;
CREATE TABLE IF NOT EXISTS `ocenter_message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `type` varchar(25) NOT NULL COMMENT '消息类型',
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户消息类型表';

--
-- 转存表中的数据 `ocenter_message_type`
--

INSERT INTO `ocenter_message_type` (`id`, `uid`, `type`, `status`) VALUES
(1, 1, 'Common_mobile', 1),
(2, 1, 'Common_email', 1),
(3, 1, 'Weibo', 1),
(4, 1, 'Ucenter', 1),
(5, 105, 'Common_mobile', 1),
(6, 105, 'Common_email', 1),
(7, 105, 'Ucenter', 1),
(8, 106, 'Common_mobile', 1),
(9, 106, 'Common_email', 1),
(10, 105, 'Weibo', 1),
(11, 106, 'Ucenter', 1),
(12, 106, 'Weibo', 1),
(13, 108, 'Common_mobile', 1),
(14, 108, 'Common_email', 1),
(15, 104, 'Ucenter', 1),
(16, 108, 'Weibo', 1),
(17, 108, 'Ucenter', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_module`
--

DROP TABLE IF EXISTS `ocenter_module`;
CREATE TABLE IF NOT EXISTS `ocenter_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '模块名',
  `alias` varchar(30) NOT NULL COMMENT '中文名',
  `version` varchar(20) NOT NULL COMMENT '版本号',
  `is_com` tinyint(4) NOT NULL COMMENT '是否商业版',
  `show_nav` tinyint(4) NOT NULL COMMENT '是否显示在导航栏中',
  `summary` varchar(200) NOT NULL COMMENT '简介',
  `developer` varchar(50) NOT NULL COMMENT '开发者',
  `website` varchar(200) NOT NULL COMMENT '网址',
  `entry` varchar(50) NOT NULL COMMENT '前台入口',
  `is_setup` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否已安装',
  `sort` int(11) NOT NULL COMMENT '模块排序',
  `icon` varchar(20) NOT NULL,
  `can_uninstall` tinyint(4) NOT NULL,
  `admin_entry` varchar(50) NOT NULL,
  `menu_hide` tinyint(4) NOT NULL DEFAULT '0' COMMENT '后台入口隐藏',
  `auth_role` varchar(200) NOT NULL COMMENT '允许访问角色，为空表示非登录也能访问',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `name_2` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='模块管理表';

--
-- 转存表中的数据 `ocenter_module`
--

INSERT INTO `ocenter_module` (`id`, `name`, `alias`, `version`, `is_com`, `show_nav`, `summary`, `developer`, `website`, `entry`, `is_setup`, `sort`, `icon`, `can_uninstall`, `admin_entry`, `menu_hide`, `auth_role`) VALUES
(1, 'Home', '网站主页', '2.0.0', 0, 1, '首页模块，主要用于展示网站内容', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Home/index/index', 1, 0, 'home', 1, 'Admin/Home/config', 0, ''),
(2, 'Ucenter', '用户中心', '2.0.0', 0, 1, '用户中心模块，系统核心模块', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Ucenter/index/index', 1, 0, 'user', 0, 'Admin/User/index', 0, ''),
(3, 'People', '会员展示', '2.0.0', 0, 1, '会员展示模块，可以用于会员的查找', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'People/index/index', 1, 0, 'group', 1, 'People/config', 0, ''),
(4, 'Weibo', '微博', '2.0.0', 0, 1, '微博模块，用户可以发布微博', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', 'Weibo/index/index', 1, 0, 'quote-left', 1, 'Admin/Weibo/weibo', 0, ''),
(12, 'Core', '系统公共模块', '2.1.0', 0, 0, '系统核心模块，必不可少，负责核心的处理。', '嘉兴想天信息科技有限公司', 'http://www.ourstu.com', '', 1, 0, 'globe', 0, '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_picture`
--

DROP TABLE IF EXISTS `ocenter_picture`;
CREATE TABLE IF NOT EXISTS `ocenter_picture` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `type` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_rank`
--

DROP TABLE IF EXISTS `ocenter_rank`;
CREATE TABLE IF NOT EXISTS `ocenter_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '上传者id',
  `title` varchar(50) NOT NULL,
  `logo` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `types` tinyint(2) NOT NULL DEFAULT '1' COMMENT '前台是否可申请',
  `label_content` varchar(10) NOT NULL COMMENT '文字头衔内容',
  `label_color` varchar(10) NOT NULL COMMENT '文字颜色',
  `label_bg` varchar(10) NOT NULL COMMENT 'label背景色',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_rank_user`
--

DROP TABLE IF EXISTS `ocenter_rank_user`;
CREATE TABLE IF NOT EXISTS `ocenter_rank_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `is_show` tinyint(4) NOT NULL COMMENT '是否显示在昵称右侧（必须有图片才可）',
  `create_time` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_register`
--

DROP TABLE IF EXISTS `ocenter_register`;
CREATE TABLE IF NOT EXISTS `ocenter_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `from` char(50) NOT NULL COMMENT '注册终端',
  `type` char(50) NOT NULL COMMENT '注册方式',
  `status` int(4) NOT NULL COMMENT '注册状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='注册终端和方式统计';

--
-- 转存表中的数据 `ocenter_register`
--

INSERT INTO `ocenter_register` (`id`, `uid`, `from`, `type`, `status`) VALUES
(1, -8, 'pc', 'email', 1),
(2, -8, 'pc', 'email', 1),
(3, -8, 'pc', 'email', 1),
(4, -8, 'pc', 'email', 1),
(5, -8, 'pc', 'email', 1),
(6, -8, 'pc', 'email', 1),
(7, -8, 'pc', 'email', 1),
(8, -8, 'pc', 'email', 1),
(9, -8, 'pc', 'email', 1),
(10, -8, 'pc', 'email', 1),
(11, -8, 'pc', 'email', 1),
(12, -8, 'pc', 'email', 1),
(13, -8, 'pc', 'email', 1),
(14, -8, 'pc', 'email', 1),
(15, -8, 'pc', 'email', 1),
(16, -8, 'pc', 'email', 1),
(17, -8, 'pc', 'email', 1),
(18, -8, 'pc', 'email', 1),
(19, -8, 'pc', 'email', 1),
(20, -8, 'pc', 'email', 1),
(21, -8, 'pc', 'email', 1),
(22, -8, 'pc', 'email', 1),
(23, -8, 'pc', 'email', 1),
(24, -8, 'pc', 'email', 1),
(25, -8, 'pc', 'email', 1),
(26, -8, 'pc', 'email', 1),
(27, 100, 'pc', 'email', 1),
(28, 101, 'pc', 'email', 1),
(29, 102, 'pc', 'email', 1),
(30, -30, 'pc', 'email', 1),
(31, 103, 'pc', 'email', 1),
(32, 104, 'pc', 'email', 1),
(33, 105, 'pc', 'email', 1),
(34, -30, 'pc', 'email', 1),
(35, 106, 'pc', 'email', 1),
(36, 107, 'pc', 'email', 1),
(37, -30, 'pc', 'email', 1),
(38, 108, 'pc', 'email', 1),
(39, 109, 'pc', 'email', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_report`
--

DROP TABLE IF EXISTS `ocenter_report`;
CREATE TABLE IF NOT EXISTS `ocenter_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) NOT NULL,
  `uid` int(11) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `data` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `updata_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `handle_status` tinyint(4) NOT NULL,
  `handle_result` text NOT NULL,
  `handle_uid` int(11) NOT NULL,
  `handle_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_role`
--

DROP TABLE IF EXISTS `ocenter_role`;
CREATE TABLE IF NOT EXISTS `ocenter_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '角色组id',
  `name` varchar(25) NOT NULL COMMENT '英文标识',
  `title` varchar(25) NOT NULL COMMENT '中文标题',
  `description` varchar(500) NOT NULL COMMENT '描述',
  `user_groups` varchar(200) NOT NULL COMMENT '默认权限组ids',
  `invite` tinyint(4) NOT NULL COMMENT '预留字段(类型：是否需要邀请注册等)',
  `audit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要审核',
  `sort` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

--
-- 转存表中的数据 `ocenter_role`
--

INSERT INTO `ocenter_role` (`id`, `group_id`, `name`, `title`, `description`, `user_groups`, `invite`, `audit`, `sort`, `status`, `create_time`, `update_time`) VALUES
(1, 0, 'default', '普通用户', '普通用户', '1', 0, 0, 0, 1, 1528111895, 1528111895);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_role_config`
--

DROP TABLE IF EXISTS `ocenter_role_config`;
CREATE TABLE IF NOT EXISTS `ocenter_role_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL COMMENT '标识',
  `category` varchar(25) NOT NULL COMMENT '归类标识',
  `value` text NOT NULL COMMENT '配置值',
  `data` text NOT NULL COMMENT '该配置的其它值',
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色配置表';

--
-- 转存表中的数据 `ocenter_role_config`
--

INSERT INTO `ocenter_role_config` (`id`, `role_id`, `name`, `category`, `value`, `data`, `update_time`) VALUES
(1, 1, 'user_tag', '', '2,3', '', 1476755028),
(2, 1, 'expend_field', 'expend_field', '1,2,3,4,5,6,7', '', 1476755034),
(3, 1, 'register_expend_field', 'expend_field', '1,2,3,4,5,6,7', '', 1476755110);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_role_group`
--

DROP TABLE IF EXISTS `ocenter_role_group`;
CREATE TABLE IF NOT EXISTS `ocenter_role_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色分组';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_schedule`
--

DROP TABLE IF EXISTS `ocenter_schedule`;
CREATE TABLE IF NOT EXISTS `ocenter_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` varchar(100) NOT NULL,
  `args` varchar(500) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `type_value` varchar(200) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `intro` varchar(500) NOT NULL,
  `lever` int(11) NOT NULL COMMENT '优先级',
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_schedule`
--

INSERT INTO `ocenter_schedule` (`id`, `method`, `args`, `type`, `type_value`, `start_time`, `end_time`, `intro`, `lever`, `status`, `create_time`) VALUES
(1, 'Admin/Count->dayCount', '', 3, 'Daily=01:00', 1469167215, 2147483647, '执行了数据统计', 0, 0, 1469167281);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_score_log`
--

DROP TABLE IF EXISTS `ocenter_score_log`;
CREATE TABLE IF NOT EXISTS `ocenter_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `value` double NOT NULL,
  `finally_value` double NOT NULL,
  `create_time` int(11) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `model` varchar(20) NOT NULL,
  `record_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_score_log`
--

INSERT INTO `ocenter_score_log` (`id`, `uid`, `ip`, `type`, `action`, `value`, `finally_value`, `create_time`, `remark`, `model`, `record_id`) VALUES
(1, 1, 0, 1, 'inc', 10, 10, 1528111938, 'admin在2018-06-04 19:32登录了账号【积分：+10分】', 'member', 1),
(2, 1, 0, 1, 'inc', 10, 20, 1530625481, 'admin在2018-07-03 21:44登录了账号【积分：+10分】', 'member', 1),
(3, 1, 0, 1, 'inc', 1, 21, 1530625646, 'admin在2018-07-03 21:47发布了新微博：1【积分：+1分】', 'weibo', 1),
(4, 102, 0, 1, 'inc', 10, 10, 1530625757, 'zsl1996在2018-07-03 21:49登录了账号【积分：+10分】', 'member', 102),
(5, 102, 0, 1, 'inc', 1, 11, 1530625801, 'zsl1996在2018-07-03 21:50添加了微博评论：1【积分：+1分】', 'weibo_comment', 1),
(6, 1, 0, 1, 'inc', 10, 31, 1532681966, '大数据实验室在2018-07-27 16:59登录了账号【积分：+10分】', 'member', 1),
(7, 103, 0, 1, 'inc', 10, 10, 1532684283, 'kkk在2018-07-27 17:38登录了账号【积分：+10分】', 'member', 103),
(8, 104, 0, 1, 'inc', 10, 10, 1532700252, 'zsl19960523在2018-07-27 22:04登录了账号【积分：+10分】', 'member', 104),
(9, 105, 0, 1, 'inc', 10, 10, 1532702229, 'zslq在2018-07-27 22:37登录了账号【积分：+10分】', 'member', 105),
(10, 105, 0, 1, 'inc', 1, 11, 1532704833, 'MSRA、在2018-07-27 23:20发布了新微博：2【积分：+1分】', 'weibo', 2),
(11, 105, 0, 1, 'inc', 1, 12, 1532704880, 'MSRA、在2018-07-27 23:21添加了微博评论：2【积分：+1分】', 'weibo_comment', 2),
(12, 106, 0, 1, 'inc', 10, 10, 1532743150, 'zzz在2018-07-28 09:59登录了账号【积分：+10分】', 'member', 106),
(13, 106, 0, 1, 'inc', 1, 11, 1532744862, 'zzz在2018-07-28 10:27发布了新微博：3【积分：+1分】', 'weibo', 3),
(14, 106, 0, 1, 'inc', 1, 12, 1532744895, 'zzz在2018-07-28 10:28添加了微博评论：3【积分：+1分】', 'weibo_comment', 3),
(15, 107, 0, 1, 'inc', 10, 10, 1532744978, 'zzzz在2018-07-28 10:29登录了账号【积分：+10分】', 'member', 107),
(16, 107, 0, 1, 'inc', 1, 11, 1532745031, 'zzzz在2018-07-28 10:30添加了微博评论：4【积分：+1分】', 'weibo_comment', 4),
(17, 108, 0, 1, 'inc', 10, 10, 1532747044, 'zslzsl在2018-07-28 11:04登录了账号【积分：+10分】', 'member', 108),
(18, 108, 0, 1, 'inc', 1, 11, 1532747631, '讯飞语音在2018-07-28 11:13发布了新微博：4【积分：+1分】', 'weibo', 4),
(19, 108, 0, 1, 'inc', 1, 12, 1532747663, '讯飞语音在2018-07-28 11:14添加了微博评论：5【积分：+1分】', 'weibo_comment', 5),
(20, 108, 0, 1, 'inc', 1, 13, 1532765069, '讯飞语音在2018-07-28 16:04发布了新微博：5【积分：+1分】', 'weibo', 5),
(21, 108, 0, 1, 'inc', 1, 14, 1532765091, '讯飞语音在2018-07-28 16:04添加了微博评论：6【积分：+1分】', 'weibo_comment', 6),
(22, 108, 0, 1, 'inc', 1, 15, 1532765156, '讯飞语音在2018-07-28 16:05添加了微博评论：7【积分：+1分】', 'weibo_comment', 7),
(23, 108, 0, 1, 'inc', 1, 16, 1532765198, '讯飞语音在2018-07-28 16:06发布了新微博：6【积分：+1分】', 'weibo', 6),
(24, 108, 0, 1, 'inc', 1, 17, 1532765214, '讯飞语音在2018-07-28 16:06添加了微博评论：8【积分：+1分】', 'weibo_comment', 8),
(25, 109, 0, 1, 'inc', 10, 10, 1532765716, 'zzzzzzz在2018-07-28 16:15登录了账号【积分：+10分】', 'member', 109),
(26, 109, 0, 1, 'inc', 1, 11, 1532765755, 'zzzzzzz在2018-07-28 16:15添加了微博评论：9【积分：+1分】', 'weibo_comment', 9),
(27, 109, 0, 1, 'inc', 1, 12, 1532765770, 'zzzzzzz在2018-07-28 16:16发布了新微博：7【积分：+1分】', 'weibo', 7),
(28, 108, 0, 1, 'inc', 1, 18, 1532766791, '讯飞语音在2018-07-28 16:33发布了新微博：8【积分：+1分】', 'weibo', 8),
(29, 108, 0, 1, 'inc', 10, 28, 1532896931, '讯飞语音在2018-07-30 04:42登录了账号【积分：+10分】', 'member', 108),
(30, 108, 0, 1, 'inc', 10, 38, 1533027692, '讯飞语音在2018-07-31 17:01登录了账号【积分：+10分】', 'member', 108);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_send_sms_log`
--

DROP TABLE IF EXISTS `ocenter_send_sms_log`;
CREATE TABLE IF NOT EXISTS `ocenter_send_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(15) NOT NULL,
  `content` text NOT NULL COMMENT '发送信息',
  `return` text NOT NULL COMMENT '接口返回数据',
  `type` varchar(32) NOT NULL COMMENT '判别发送客户端类型',
  `status` tinyint(3) NOT NULL DEFAULT '1',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_sensitive`
--

DROP TABLE IF EXISTS `ocenter_sensitive`;
CREATE TABLE IF NOT EXISTS `ocenter_sensitive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_seo_rule`
--

DROP TABLE IF EXISTS `ocenter_seo_rule`;
CREATE TABLE IF NOT EXISTS `ocenter_seo_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `app` varchar(40) NOT NULL,
  `controller` varchar(40) NOT NULL,
  `action` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `seo_keywords` text NOT NULL,
  `seo_description` text NOT NULL,
  `seo_title` text NOT NULL,
  `sort` int(11) NOT NULL,
  `summary` varchar(500) NOT NULL COMMENT 'seo变量介绍',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_seo_rule`
--

INSERT INTO `ocenter_seo_rule` (`id`, `title`, `app`, `controller`, `action`, `status`, `seo_keywords`, `seo_description`, `seo_title`, `sort`, `summary`) VALUES
(1000, '整站标题', '', '', '', 1, '', '', '', 7, '-'),
(1001, '用户中心', 'Ucenter', 'index', 'index', 1, '{$user_info.username|text}的个人主页', '{$user_info.username|text}的个人主页', '{$user_info.nickname|op_t}的个人主页', 3, '-'),
(1002, '网站首页', 'Home', 'Index', 'index', 1, '', '', '', 0, '-'),
(1003, '积分商城首页', 'Shop', 'Index', 'index', 1, '', '', '', 0, '-'),
(1004, '商品列表', 'Shop', 'Index', 'goods', 1, '', '', '', 0, 'category_name：当前分类名\nchild_category_name：子分类名'),
(1005, '商品详情', 'Shop', 'Index', 'goodsdetail', 1, '', '', '', 0, 'content：商品变量集\n   content.goods_name 商品名\n   content.goods_introduct 商品简介\n   content.goods_detail 商品详情'),
(1006, '活动主页', 'Event', 'Index', 'index', 1, '', '', '', 0, '-'),
(1007, '活动详情', 'Event', 'Index', 'detail', 1, '', '', '', 0, 'content：活动变量集\n   content.title 活动名称\n   content.type.title 活动分类名\n   content.user.nickname 发起人昵称\n   content.address 活动地点\n   content.limitCount 人数限制'),
(1008, '活动成员', 'Event', 'Index', 'member', 1, '', '', '', 0, '-'),
(1009, '专辑首页', 'Issue', 'Index', 'index', 1, '', '', '', 0, '-'),
(1010, '专辑详情', 'Issue', 'Index', 'issuecontentdetail', 1, '', '', '', 0, 'content：专辑内容变量集\n   content.user.nickname 内容发布者昵称\n   content.user.signature 内容发布者签名\n   content.url 内容的Url\n   content.title 内容标题\n   content.create_time|friendlyDate 发布时间\n   content.update_time|friendlyDate 更新时间'),
(1011, '论坛主页', 'Forum', 'Index', 'index', 1, '', '', '', 0, '-'),
(1012, '某个版块的帖子列表', 'Forum', 'Index', 'forum', 1, '', '', '', 0, 'forum：版块变量集\n   forum.description 版块描述\n   forum.title 版块名称\n   forum.topic_count 主题数\n   forum.total_count 帖子数'),
(1013, '帖子详情', 'Forum', 'Index', 'detail', 1, '', '', '', 0, 'post：帖子变量集\n   post.title 帖子标题\n   post.content 帖子详情\n   post.forum.title 帖子所在版块标题\n   '),
(1014, '搜索帖子', 'Forum', 'Index', 'search', 1, '', '', '', 0, 'keywords：搜索的关键词，2.4.0以后版本提供'),
(1015, '随便看看', 'Forum', 'Index', 'look', 1, '', '', '', 0, '-'),
(1016, '全部版块', 'Forum', 'Index', 'lists', 1, '', '', '', 0, '-'),
(1017, '资讯首页/某个分类下的文章列表', 'News', 'Index', 'index', 1, '', '', '', 0, 'now_category.title 当前分类的名称'),
(1018, '某篇文章的内容页', 'News', 'Index', 'detail', 1, '', '', '', 0, 'now_category.title 当前分类的名称\ninfo：文章变量集\n   info.title 文章标题\n   info.description 文章摘要\n   info.source 文章来源\n   info.detail.content 文章内容\nauthor.nickname 作者昵称\nauthor.signature 作者签名\n   '),
(1019, '微博首页', 'Weibo', 'Index', 'index', 1, '{$MODULE_ALIAS}', '{$MODULE_ALIAS}首页', '{$MODULE_ALIAS}-{$website_name}', 0, 'title：我关注的、热门微博、全站关注'),
(1020, '某条微博的详情页', 'Weibo', 'Index', 'weibodetail', 1, '{$weibo.title|text},{$website_name},{$MODULE_ALIAS}', '{$weibo.content|text}', '{$weibo.content|text}——{$MODULE_ALIAS}', 0, 'weibo:微博变量集\n   weibo.user.nickname 发布者昵称\n   weibo.content 微博内容'),
(1021, '微博搜索页面', 'Weibo', 'Index', 'search', 1, '', '', '', 0, 'search_keywords：搜索关键词'),
(1022, '热门话题列表', 'Weibo', 'Topic', 'topic', 1, '', '', '', 0, '-'),
(1023, '某个话题的话题页', 'Weibo', 'Topic', 'index', 1, '', '', '', 0, 'topic：话题变量集\n   topic.name 话题名称\nhost：话题主持人变量集\n   host.nickname 主持人昵称'),
(1024, '自动跳转到我的群组', 'Group', 'Index', 'index', 1, '', '', '', 0, '-'),
(1025, '全部群组', 'Group', 'Index', 'groups', 1, '', '', '', 0, '-'),
(1026, '我的群组-帖子列表', 'Group', 'Index', 'my', 1, '', '', '', 0, '-'),
(1027, '我的群组-全部关注的群组列表', 'Group', 'Index', 'mygroup', 1, '', '', '', 0, '-'),
(1028, '某个群组的帖子列表页面', 'Group', 'Index', 'group', 1, '', '', '', 0, 'search_key：如果查找帖子，则是关键词\ngroup：群组变量集\n   group.title 群组标题\n   group.user.nickname 创始人昵称\n   group.member_count 群组人数'),
(1029, '某篇帖子的内容页', 'Group', 'Index', 'detail', 1, '', '', '', 0, 'group：群组变量集\n   group.title 群组标题\n   group.user.nickname 创始人昵称\n   group.member_count 群组人数\npost：帖子变量集\n   post.title 帖子标题\n   post.content 帖子内容'),
(1030, '创建群组', 'Group', 'Index', 'create', 1, '', '', '', 0, '-'),
(1031, '发现', 'Group', 'Index', 'discover', 1, '', '', '', 0, '-'),
(1032, '精选', 'Group', 'Index', 'select', 1, '', '', '', 0, '-'),
(1033, '找人首页', 'People', 'Index', 'index', 1, '{$MODULE_ALIAS}', '{$MODULE_ALIAS}', '{$MODULE_ALIAS}', 0, '-'),
(1034, '微店首页', 'Store', 'Index', 'index', 1, '', '', '', 0, '-'),
(1035, '某个分类下的商品列表页', 'Store', 'Index', 'li', 1, '', '', '', 0, 'type：当前分类变量集\n   type.title 分类名称'),
(1036, '搜索商品列表页', 'Store', 'Index', 'search', 1, '', '', '', 0, 'searchKey：搜索关键词'),
(1037, '单个商品的详情页', 'Store', 'Index', 'info', 1, '', '', '', 0, 'info：商品变量集\n   info.title 商品标题\n   info.des 商品描述\n   info.shop：店铺变量集\n       info.shop.title 店铺名称\n       info.shop.summary 店铺简介\n       info.shop.position 店铺所在地\n       info.shop.user.nickname 店主昵称'),
(1038, '店铺街', 'Store', 'Index', 'lists', 1, '', '', '', 0, '-'),
(1039, '某个店铺的首页', 'Store', 'Shop', 'detail', 1, '', '', '', 0, 'shop：店铺变量集\n   shop.title 店铺名称\n   shop.summary 店铺简介\n   shop.position 店铺所在地\n   shop.user.nickname 店主昵称'),
(1040, '某个店铺下的商品列表页', 'Store', 'Shop', 'goods', 1, '', '', '', 0, 'shop：店铺变量集\n   shop.title 店铺名称\n   shop.summary 店铺简介\n   shop.position 店铺所在地\n   shop.user.nickname 店主昵称'),
(1041, '分类信息首页', 'Cat', 'Index', 'index', 1, '', '', '', 0, '-'),
(1042, '某个模型下的列表页', 'Cat', 'Index', 'li', 1, '', '', '', 0, 'entity：当前模型变量集\n   entity.alias 模型名'),
(1043, '某条信息的详情页', 'Cat', 'Index', 'info', 1, '', '', '', 0, 'entity：当前模型变量集\n   entity.alias 模型名\ninfo：当前信息\n   info.title 信息名称\nuser.nickname 发布者昵称'),
(1044, '待回答页面', 'Question', 'Index', 'waitanswer', 1, '', '', '', 0, '-'),
(1045, '热门问题', 'Question', 'Index', 'goodquestion', 1, '', '', '', 0, '-'),
(1046, '我的回答', 'Question', 'Index', 'myquestion', 1, '', '', '', 0, '-'),
(1047, '全部问题', 'Question', 'Index', 'questions', 1, '', '', '', 0, '-'),
(1048, '详情', 'Question', 'Index', 'detail', 1, '', '', '', 0, 'question：问题变量集\n   question.title 问题标题\n   question.description 问题描述\n   question.answer_num 回答数\nbest_answer：最佳回答\n   best_answer.content 最佳答案内容');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_session`
--

DROP TABLE IF EXISTS `ocenter_session`;
CREATE TABLE IF NOT EXISTS `ocenter_session` (
  `session_id` varchar(225) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` text NOT NULL,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_session`
--

INSERT INTO `ocenter_session` (`session_id`, `session_expire`, `session_data`) VALUES
('b6q2e4qjff63s7t8037fpf90c5', 1533103715, 'opensns|a:3:{s:9:\"user_auth\";a:5:{s:3:\"uid\";s:3:\"108\";s:8:\"username\";s:0:\"\";s:15:\"last_login_time\";s:10:\"1533027691\";s:7:\"role_id\";s:1:\"1\";s:5:\"audit\";s:1:\"1\";}s:14:\"user_auth_sign\";s:40:\"572dd6efd5fc3edac27b53aafba60a7c34bde368\";s:15:\"_AUTH_LIST_1081\";a:4:{i:0;s:24:\"weibo/index/dosendrepost\";i:1;s:18:\"weibo/index/dosend\";i:2;s:21:\"weibo/index/docomment\";i:3;s:19:\"weibo/topic/beadmin\";}}');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_sso_app`
--

DROP TABLE IF EXISTS `ocenter_sso_app`;
CREATE TABLE IF NOT EXISTS `ocenter_sso_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `config` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_super_links`
--

DROP TABLE IF EXISTS `ocenter_super_links`;
CREATE TABLE IF NOT EXISTS `ocenter_super_links` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '类别（1：图片，2：普通）',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '站点名称',
  `cover_id` int(10) NOT NULL COMMENT '图片ID',
  `link` char(140) NOT NULL DEFAULT '' COMMENT '链接地址',
  `level` int(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '优先级',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常）',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='友情连接表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_support`
--

DROP TABLE IF EXISTS `ocenter_support`;
CREATE TABLE IF NOT EXISTS `ocenter_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appname` varchar(20) NOT NULL COMMENT '应用名',
  `row` int(11) NOT NULL COMMENT '应用标识',
  `uid` int(11) NOT NULL COMMENT '用户',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `table` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='支持的表';

--
-- 转存表中的数据 `ocenter_support`
--

INSERT INTO `ocenter_support` (`id`, `appname`, `row`, `uid`, `create_time`, `table`) VALUES
(2, 'Weibo', 1, 1, 1530625654, 'weibo'),
(3, 'Weibo', 1, 104, 1532701852, 'weibo'),
(4, 'Weibo', 2, 105, 1532704837, 'weibo'),
(6, 'Weibo', 3, 106, 1532744865, 'weibo'),
(7, 'Weibo', 2, 106, 1532744869, 'weibo'),
(8, 'Weibo', 3, 107, 1532745005, 'weibo_comment'),
(9, 'Weibo', 4, 108, 1532747633, 'weibo'),
(10, 'Weibo', 1, 108, 1532747668, 'weibo'),
(11, 'Weibo', 5, 108, 1532765072, 'weibo'),
(12, 'Weibo', 3, 108, 1532765147, 'weibo_comment'),
(13, 'Weibo', 2, 108, 1532765148, 'weibo_comment'),
(14, 'Weibo', 6, 108, 1532765201, 'weibo'),
(15, 'Weibo', 8, 108, 1532765217, 'weibo_comment'),
(16, 'Weibo', 6, 109, 1532765777, 'weibo');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_sync_login`
--

DROP TABLE IF EXISTS `ocenter_sync_login`;
CREATE TABLE IF NOT EXISTS `ocenter_sync_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type_uid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `oauth_token` varchar(255) NOT NULL,
  `oauth_token_secret` varchar(255) NOT NULL,
  `is_sync` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_talk`
--

DROP TABLE IF EXISTS `ocenter_talk`;
CREATE TABLE IF NOT EXISTS `ocenter_talk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `uids` varchar(100) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会话表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_talk_message`
--

DROP TABLE IF EXISTS `ocenter_talk_message`;
CREATE TABLE IF NOT EXISTS `ocenter_talk_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `uid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `talk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='聊天消息表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_talk_message_push`
--

DROP TABLE IF EXISTS `ocenter_talk_message_push`;
CREATE TABLE IF NOT EXISTS `ocenter_talk_message_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `source_id` int(11) NOT NULL COMMENT '来源消息id',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL,
  `talk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='状态，0为未提示，1为未点击，-1为已点击';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_talk_push`
--

DROP TABLE IF EXISTS `ocenter_talk_push`;
CREATE TABLE IF NOT EXISTS `ocenter_talk_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '接收推送的用户id',
  `source_id` int(11) NOT NULL COMMENT '来源id',
  `create_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态，0为未提示，1为未点击，-1为已点击',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='对话推送表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_tile`
--

DROP TABLE IF EXISTS `ocenter_tile`;
CREATE TABLE IF NOT EXISTS `ocenter_tile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '父页面id',
  `icon` varchar(20) NOT NULL COMMENT '图标',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(11) NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `title_vo` varchar(50) NOT NULL COMMENT '父页面标题',
  `url` varchar(255) NOT NULL COMMENT '路径',
  `url_vo` varchar(255) NOT NULL COMMENT '父页面路径',
  `tile_bg` varchar(10) NOT NULL COMMENT '块颜色(背景)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='常用操作';

--
-- 转存表中的数据 `ocenter_tile`
--

INSERT INTO `ocenter_tile` (`id`, `aid`, `icon`, `sort`, `status`, `title`, `title_vo`, `url`, `url_vo`, `tile_bg`) VALUES
(1, 3, 'direction', 1, 1, '用户管理', '用户', 'User/index', 'User/index', '#1ba1e2');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_ucenter_admin`
--

DROP TABLE IF EXISTS `ocenter_ucenter_admin`;
CREATE TABLE IF NOT EXISTS `ocenter_ucenter_admin` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_ucenter_member`
--

DROP TABLE IF EXISTS `ocenter_ucenter_member`;
CREATE TABLE IF NOT EXISTS `ocenter_ucenter_member` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(32) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  `type` tinyint(4) NOT NULL COMMENT '1为用户名注册，2为邮箱注册，3为手机注册',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `ocenter_ucenter_member`
--

INSERT INTO `ocenter_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`, `type`) VALUES
(1, 'admin', 'a39e1898916e00b3aba1a5b3b5290997', 'zsl1996@mail.ustc.esu.cn', '', 1528111895, 0, 1532681966, 0, 1528111895, 1, 1),
(100, '', 'a39e1898916e00b3aba1a5b3b5290997', 'zsl1996@mail.ustc.edu.cn', '', 1528722914, 0, 1528722914, 0, 1528722914, 1, 2),
(101, '', 'a39e1898916e00b3aba1a5b3b5290997', 'zsl1996@mail.ustc.edu.cn', '', 1528722914, 0, 0, 0, 1528722914, 1, 2),
(102, '', 'a39e1898916e00b3aba1a5b3b5290997', '1996@mail.ustc.esu.cn', '', 1530625756, 0, 1530625756, 0, 1530625756, 1, 2),
(103, '', 'cc98bb6e79d9b4fda9f391e8f68d5462', '123@mail.cn', '', 1532684283, 0, 1532684283, 0, 1532684283, 1, 2),
(104, '', 'a39e1898916e00b3aba1a5b3b5290997', 'zsl@mail.cn', '', 1532700251, 0, 1532700251, 0, 1532700251, 1, 2),
(105, '', 'f35083e4909786c75cc2bb49dfa1dd34', 'zsl@123.cn', '', 1532702229, 0, 1532702229, 0, 1532702229, 1, 2),
(106, '', 'a39e1898916e00b3aba1a5b3b5290997', 'zsl1996@qq.com', '', 1532743149, 0, 1532743149, 0, 1532743149, 1, 2),
(107, '', 'a39e1898916e00b3aba1a5b3b5290997', 'msra@qq.com', '', 1532744977, 0, 1532744977, 0, 1532744977, 1, 2),
(108, '', 'a39e1898916e00b3aba1a5b3b5290997', 'zsl1996@mail.cn', '', 1532747044, 0, 1532765788, 0, 1532747044, 1, 2),
(109, '', 'a39e1898916e00b3aba1a5b3b5290997', 'zsl1996@mail.ustc.com', '', 1532765715, 0, 1532765715, 0, 1532765715, 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_ucenter_score_type`
--

DROP TABLE IF EXISTS `ocenter_ucenter_score_type`;
CREATE TABLE IF NOT EXISTS `ocenter_ucenter_score_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `type_value` int(11) NOT NULL,
  `type_key` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_ucenter_score_type`
--

INSERT INTO `ocenter_ucenter_score_type` (`id`, `title`, `status`, `unit`, `type_value`, `type_key`) VALUES
(1, '积分', 1, '分', 0, 0),
(2, '威望', 1, '点', 0, 0),
(3, '贡献', 1, '元', 0, 0),
(4, '余额', 1, '点', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_ucenter_setting`
--

DROP TABLE IF EXISTS `ocenter_ucenter_setting`;
CREATE TABLE IF NOT EXISTS `ocenter_ucenter_setting` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_ucenter_short`
--

DROP TABLE IF EXISTS `ocenter_ucenter_short`;
CREATE TABLE IF NOT EXISTS `ocenter_ucenter_short` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `short` varchar(25) NOT NULL COMMENT '个性域名',
  `can_change_num` int(11) NOT NULL COMMENT '可修改次数，备用字段，用户商业或任务获得',
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户个性域名';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_ucenter_user_link`
--

DROP TABLE IF EXISTS `ocenter_ucenter_user_link`;
CREATE TABLE IF NOT EXISTS `ocenter_ucenter_user_link` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uc_uid` int(11) NOT NULL,
  `uc_username` varchar(50) NOT NULL,
  `uc_email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_url`
--

DROP TABLE IF EXISTS `ocenter_url`;
CREATE TABLE IF NOT EXISTS `ocenter_url` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_user_config`
--

DROP TABLE IF EXISTS `ocenter_user_config`;
CREATE TABLE IF NOT EXISTS `ocenter_user_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `model` varchar(30) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户配置信息表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_user_nav`
--

DROP TABLE IF EXISTS `ocenter_user_nav`;
CREATE TABLE IF NOT EXISTS `ocenter_user_nav` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  `color` varchar(30) NOT NULL,
  `band_color` varchar(30) NOT NULL,
  `band_text` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_user_nav`
--

INSERT INTO `ocenter_user_nav` (`id`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`, `color`, `band_color`, `band_text`, `icon`) VALUES
(1, '个人主页', 'ucenter/Index/index', 0, 0, 0, 1, 0, '', '', '', ''),
(2, '消息中心', 'ucenter/message/message', 0, 0, 0, 1, 0, '', '', '', ''),
(3, '我的收藏', 'ucenter/Collection/index', 0, 0, 0, 1, 0, '', '', '', ''),
(4, '我的头衔', 'ucenter/Index/rank', 0, 0, 0, 1, 0, '', '', '', ''),
(5, '申请认证', 'ucenter/attest/process/go_index/1', 0, 0, 0, 1, 0, '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_user_role`
--

DROP TABLE IF EXISTS `ocenter_user_role`;
CREATE TABLE IF NOT EXISTS `ocenter_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '2：未审核，1:启用，0：禁用，-1：删除',
  `step` varchar(50) NOT NULL COMMENT '记录当前执行步骤',
  `init` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否初始化',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户角色关联';

--
-- 转存表中的数据 `ocenter_user_role`
--

INSERT INTO `ocenter_user_role` (`id`, `uid`, `role_id`, `status`, `step`, `init`) VALUES
(1, 1, 1, 1, 'finish', 1),
(2, 101, 1, 1, 'start', 1),
(3, 100, 1, 1, 'finish', 1),
(4, 102, 1, 1, 'finish', 1),
(5, 103, 1, 1, 'finish', 1),
(6, 104, 1, 1, 'finish', 1),
(7, 105, 1, 1, 'finish', 1),
(8, 106, 1, 1, 'finish', 1),
(9, 107, 1, 1, 'finish', 1),
(10, 108, 1, 1, 'finish', 1),
(11, 109, 1, 1, 'finish', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_user_tag`
--

DROP TABLE IF EXISTS `ocenter_user_tag`;
CREATE TABLE IF NOT EXISTS `ocenter_user_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` tinyint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='标签分类表';

--
-- 转存表中的数据 `ocenter_user_tag`
--

INSERT INTO `ocenter_user_tag` (`id`, `title`, `status`, `pid`, `sort`) VALUES
(1, '默认', 1, 0, 0),
(2, '实验室', 1, 1, 0),
(3, '学生', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_user_tag_link`
--

DROP TABLE IF EXISTS `ocenter_user_tag_link`;
CREATE TABLE IF NOT EXISTS `ocenter_user_tag_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tags` varchar(200) NOT NULL COMMENT '标签ids',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户标签关联表';

--
-- 转存表中的数据 `ocenter_user_tag_link`
--

INSERT INTO `ocenter_user_tag_link` (`id`, `uid`, `tags`) VALUES
(1, 108, '[2]');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_user_token`
--

DROP TABLE IF EXISTS `ocenter_user_token`;
CREATE TABLE IF NOT EXISTS `ocenter_user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_user_token`
--

INSERT INTO `ocenter_user_token` (`id`, `uid`, `token`, `time`) VALUES
(1, 1, 'GlA5JToMSEUPmVn7cyqe6fp08CYaOtKWIhzbF3di', 1528111938),
(2, 108, 'ckpB4ZYHqdU2PsAQaD39rJ7XjEOwuC61SeKMRtx0', 1532747137);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_verify`
--

DROP TABLE IF EXISTS `ocenter_verify`;
CREATE TABLE IF NOT EXISTS `ocenter_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `account` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `verify` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_version`
--

DROP TABLE IF EXISTS `ocenter_version`;
CREATE TABLE IF NOT EXISTS `ocenter_version` (
  `title` varchar(50) NOT NULL COMMENT '版本名',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `update_time` int(11) NOT NULL COMMENT '更新的时间',
  `log` text NOT NULL COMMENT '更新日志',
  `url` varchar(150) NOT NULL COMMENT '链接到的远程文章',
  `number` int(11) NOT NULL COMMENT '序列号，一般用日期数字标示',
  `name` varchar(50) NOT NULL COMMENT '版本号',
  `is_current` tinyint(4) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `id` (`number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自动更新表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_weibo`
--

DROP TABLE IF EXISTS `ocenter_weibo`;
CREATE TABLE IF NOT EXISTS `ocenter_weibo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_top` tinyint(4) NOT NULL,
  `type` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `repost_count` int(11) NOT NULL,
  `from` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_weibo`
--

INSERT INTO `ocenter_weibo` (`id`, `uid`, `content`, `create_time`, `comment_count`, `status`, `is_top`, `type`, `data`, `repost_count`, `from`) VALUES
(1, 1, '大数据分析实验室招收优秀的本科生进实验室参观，有意者可私信我，请附个人基本信息！', 1530625646, 1, 1, 0, 'feed', 'a:0:{}', 0, ''),
(2, 105, 'MSRA联培项目开始啦，快来报名啊', 1532704833, 5, 1, 0, 'feed', 'a:0:{}', 1, ''),
(3, 106, '寻求实验室', 1532744862, 0, 1, 0, 'feed', 'a:0:{}', 0, ''),
(4, 108, '讯飞招人啦', 1532747631, 1, 1, 0, 'feed', 'a:0:{}', 0, ''),
(5, 108, '招满了！', 1532765068, 1, 1, 0, 'feed', 'a:0:{}', 1, ''),
(6, 108, '合肥招人[aoman]', 1532765197, 1, 1, 0, 'feed', 'a:0:{}', 0, ''),
(7, 109, '大家看一看', 1532765770, 0, 1, 0, 'repost', 'a:2:{s:6:\"source\";N;s:8:\"sourceId\";i:5;}', 0, ''),
(8, 108, 'MSRA招人啦', 1532766791, 0, 1, 0, 'repost', 'a:2:{s:6:\"source\";N;s:8:\"sourceId\";i:2;}', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_weibo_cache`
--

DROP TABLE IF EXISTS `ocenter_weibo_cache`;
CREATE TABLE IF NOT EXISTS `ocenter_weibo_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weibo_id` int(11) NOT NULL,
  `groups` varchar(100) NOT NULL,
  `cache_html` text NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `weibo_id` (`weibo_id`),
  KEY `groups` (`groups`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微博html缓存表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_weibo_comment`
--

DROP TABLE IF EXISTS `ocenter_weibo_comment`;
CREATE TABLE IF NOT EXISTS `ocenter_weibo_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `weibo_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `to_comment_id` int(11) NOT NULL,
  `support_down` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ocenter_weibo_comment`
--

INSERT INTO `ocenter_weibo_comment` (`id`, `uid`, `weibo_id`, `content`, `create_time`, `status`, `to_comment_id`, `support_down`) VALUES
(1, 102, 1, '对GPA有要求吗？物理学院可不可以参加？谢谢老师。', 1530625801, 1, 0, 2),
(2, 105, 2, '关注我获取最新动态，有意者请私信我简历！', 1532704880, 1, 0, 2),
(3, 106, 2, '材料发至您邮箱，谢谢', 1532744895, 1, 0, 2),
(4, 107, 2, '回复/nb@zzz/nb：本实验室招人', 1532745031, 1, 0, 1),
(5, 108, 2, '回复/nb@MSRA、/nb：可以了解下我们实验室', 1532747663, 1, 0, 1),
(6, 108, 5, '下次再会', 1532765090, 1, 0, 2),
(7, 108, 2, '回复/nb@MSRA、/nb：好的', 1532765156, 1, 0, 0),
(8, 108, 6, '欢迎科大学子', 1532765214, 1, 0, 1),
(9, 109, 4, '我可以吗？？', 1532765755, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_weibo_top`
--

DROP TABLE IF EXISTS `ocenter_weibo_top`;
CREATE TABLE IF NOT EXISTS `ocenter_weibo_top` (
  `weibo_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL COMMENT '置顶标题',
  `dead_time` int(11) NOT NULL COMMENT '过期日期',
  `type` varchar(32) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`weibo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='置顶微博表';

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_weibo_topic`
--

DROP TABLE IF EXISTS `ocenter_weibo_topic`;
CREATE TABLE IF NOT EXISTS `ocenter_weibo_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '话题名',
  `logo` varchar(255) NOT NULL DEFAULT '/topicavatar.jpg' COMMENT '话题logo',
  `intro` varchar(255) NOT NULL COMMENT '导语',
  `qrcode` varchar(255) NOT NULL COMMENT '二维码',
  `uadmin` int(11) NOT NULL DEFAULT '0' COMMENT '话题管理   默认无',
  `read_count` int(11) NOT NULL DEFAULT '0' COMMENT '阅读',
  `is_top` tinyint(4) NOT NULL,
  `weibo_num` int(11) NOT NULL DEFAULT '0' COMMENT '微博数',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_weibo_topic_follow`
--

DROP TABLE IF EXISTS `ocenter_weibo_topic_follow`;
CREATE TABLE IF NOT EXISTS `ocenter_weibo_topic_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ocenter_weibo_topic_link`
--

DROP TABLE IF EXISTS `ocenter_weibo_topic_link`;
CREATE TABLE IF NOT EXISTS `ocenter_weibo_topic_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weibo_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_top` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='话题、微博关联表';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
