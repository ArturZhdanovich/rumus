-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 06 2014 г., 08:37
-- Версия сервера: 5.1.69-cll-lve
-- Версия PHP: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `rumusby_DPQFnwjMf`
--

-- --------------------------------------------------------

--
-- Структура таблицы `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `address`
--

INSERT INTO `address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `company_id`, `tax_id`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`) VALUES
(1, 1, 'Дмитрий, Федорович', 'Романовский', '', '', '', 'а/я 58', '', 'Витебск', '210009', 20, 343),
(2, 2, 'Артур', 'Жданович', '', '', '', 'лазо', '', 'витебск', '11111', 20, 343),
(3, 3, 'Нюта', 'Симакова', '', '', '', 'ул Октябрьская 30 кв 66', '', 'Гомель ', '247120', 20, 338),
(4, 4, 'Светлана Валерьевна', 'Радион', '', '', '', 'Гродненская область', '', 'Волковыск', '231900', 20, 340),
(5, 5, 'Лидия Валерьевна', 'Музыка', '', '', '', 'ул.Шоссейная, д.13', '', 'Кричев', '213491', 20, 341),
(6, 6, 'Вероника Николаевна', 'Артемова', '', '', '', 'ул. королева,  18-28', '', 'Могилёв', '212033', 20, 341);

-- --------------------------------------------------------

--
-- Структура таблицы `affiliate`
--

CREATE TABLE IF NOT EXISTS `affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `affiliate`
--

INSERT INTO `affiliate` (`affiliate_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `company`, `website`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `code`, `commission`, `tax`, `payment`, `cheque`, `paypal`, `bank_name`, `bank_branch_number`, `bank_swift_code`, `bank_account_name`, `bank_account_number`, `ip`, `status`, `approved`, `date_added`) VALUES
(1, 'Дмитрий, Федорович', 'Романовский', 'Dmitriy_r_f@mail.ru', '375292181075', '', '601c4917741eaea3ce75df7819a7213059e6345f', 'c2b89b052', 'Rumus', '', 'а/я 58', 'а/я 58', 'Витебск', '210009', 20, 343, '52ce471aa0bc3', '5.00', '', 'cheque', '', '', '', '', '', '', '', '', 1, 1, '2014-01-09 01:52:10');

-- --------------------------------------------------------

--
-- Структура таблицы `affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `attribute`
--

CREATE TABLE IF NOT EXISTS `attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_description`
--

CREATE TABLE IF NOT EXISTS `attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_group`
--

CREATE TABLE IF NOT EXISTS `attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `banner`
--

INSERT INTO `banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'На главной', 1),
(8, 'Производители', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `banner_image`
--

CREATE TABLE IF NOT EXISTS `banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=134 ;

--
-- Дамп данных таблицы `banner_image`
--

INSERT INTO `banner_image` (`banner_image_id`, `banner_id`, `link`, `image`) VALUES
(77, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'data/demo/hp_banner.jpg'),
(133, 7, 'http://rumus.by/women/', 'data/1.jpg'),
(130, 7, 'http://rumus.by/bag/', 'data/3.jpg'),
(131, 7, 'http://rumus.by/men/', 'data/2.jpg'),
(98, 8, 'http://rumus.by/eva_style', 'data/im/eva_style.png'),
(95, 8, 'http://rumus.by/dress_code', 'data/im/dress_code.png'),
(96, 8, 'http://rumus.by/gepur', 'data/im/gepur.png'),
(97, 8, 'http://rumus.by/%20larionoff', 'data/im/larionoff.png'),
(132, 7, 'http://rumus.by/accessories/', 'data/4.jpg'),
(129, 7, 'http://rumus.by/bijouterie/', 'data/5.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `banner_image_description`
--

CREATE TABLE IF NOT EXISTS `banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `banner_image_description`
--

INSERT INTO `banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(133, 1, 7, 'women'),
(77, 1, 6, 'HP Banner'),
(97, 1, 8, 'Larionoff'),
(96, 1, 8, 'Gepur'),
(95, 1, 8, 'Dress Code'),
(132, 1, 7, 'accessories'),
(131, 1, 7, 'men'),
(98, 1, 8, 'Eva Style'),
(130, 1, 7, 'bag'),
(129, 1, 7, 'bijouterie');

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98 ;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, 'data/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2014-02-05 01:25:01'),
(18, 'data/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2014-01-12 09:29:56'),
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2014-01-12 09:30:43'),
(57, '', 0, 1, 2, 4, 1, '2011-04-26 08:53:16', '2014-02-07 03:55:41'),
(77, 'data/ic/m_пальто.jpg', 18, 0, 1, 0, 1, '2014-01-10 08:52:59', '2014-02-03 01:48:54'),
(46, 'data/ic/m_свитера.jpg', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2014-02-10 06:49:40'),
(73, 'data/ic/m_жилетки.jpg', 18, 0, 1, 0, 1, '2013-12-30 12:22:20', '2014-02-03 01:47:55'),
(74, 'data/ic/m_байки.jpg', 18, 0, 1, 0, 1, '2013-12-30 12:22:56', '2014-01-30 06:31:04'),
(75, 'data/ic/m_футболки.jpg', 18, 0, 1, 0, 1, '2013-12-30 12:24:12', '2014-02-03 01:39:32'),
(59, 'data/ic/w_шорты.jpg', 1, 0, 1, 0, 1, '2013-12-30 12:03:51', '2014-01-30 06:39:54'),
(60, 'data/ic/w_кофты.jpg', 1, 0, 1, 0, 1, '2013-12-30 12:04:30', '2014-01-30 06:34:52'),
(62, 'data/ic/w_топы.jpg', 1, 0, 1, 0, 1, '2013-12-30 12:06:06', '2014-01-31 02:24:58'),
(63, 'data/ic/w_юбки.jpg', 1, 0, 1, 0, 1, '2013-12-30 12:06:39', '2014-01-30 06:41:56'),
(79, 'data/ic/m_рубашки.jpg', 18, 0, 1, 0, 1, '2014-01-10 09:00:07', '2014-01-30 06:32:42'),
(66, 'data/ic/w_толстовки.jpg', 1, 0, 1, 0, 1, '2013-12-30 12:13:05', '2014-01-31 02:25:56'),
(67, 'data/ic/a_шапки.jpg', 57, 0, 1, 0, 1, '2013-12-30 12:13:44', '2014-02-10 06:56:20'),
(26, 'data/ic/w_платья.jpg', 1, 0, 0, 1, 1, '2009-01-31 01:55:14', '2014-01-30 06:36:43'),
(27, 'data/ic/w_блузы.jpg', 1, 0, 0, 2, 1, '2009-01-31 01:55:34', '2014-01-31 02:28:34'),
(28, 'data/ic/b_дорожные_сумки.jpg', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2014-02-11 05:52:47'),
(32, 'data/ic/b_клатчи.jpg', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2014-02-11 05:52:10'),
(68, 'data/ic/aw_ремени.jpg', 57, 0, 1, 0, 1, '2013-12-30 12:17:40', '2014-02-03 02:16:15'),
(78, 'data/ic/m_пиджак.jpg', 18, 0, 1, 0, 1, '2014-01-10 08:54:59', '2014-02-03 01:50:03'),
(76, '', 0, 1, 1, 5, 1, '2014-01-03 08:22:45', '2014-02-10 06:25:22'),
(72, 'data/ic/aw_часы.jpg', 57, 0, 1, 0, 1, '2013-12-30 12:18:54', '2014-02-03 02:17:13'),
(82, 'data/ic/w_жакеты.jpg', 1, 0, 1, 0, 1, '2014-01-30 06:35:40', '2014-02-04 01:57:23'),
(80, 'data/ic/b_портфели.jpg', 25, 0, 1, 0, 1, '2014-01-12 09:46:14', '2014-02-11 05:51:32'),
(81, 'data/ic/m_штаны.jpg', 18, 0, 1, 0, 1, '2014-01-17 00:33:35', '2014-01-30 06:33:30'),
(83, 'data/ic/am_часы.jpg', 57, 0, 1, 0, 1, '2014-02-03 02:17:54', '2014-02-03 02:17:54'),
(84, 'data/ic/am_ремени.jpg', 57, 0, 1, 0, 1, '2014-02-03 02:18:43', '2014-02-03 02:20:38'),
(86, 'data/ic/b_наплечные_сумки.jpg', 25, 0, 1, 0, 1, '2014-02-06 04:30:23', '2014-02-12 00:43:51'),
(87, 'data/ic/b_хобо.jpg', 25, 0, 1, 0, 1, '2014-02-06 04:31:15', '2014-02-12 00:43:10'),
(88, 'data/ic/bm_классическая.jpg', 25, 0, 1, 0, 1, '2014-02-06 04:32:58', '2014-02-11 05:53:30'),
(89, 'data/ic/b_тоут.jpg', 25, 0, 1, 0, 1, '2014-02-06 04:33:40', '2014-02-11 05:48:00'),
(90, 'data/ic/j_заколки-и-резинки.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:47:09', '2014-02-15 08:04:54'),
(91, 'data/ic/j_сережки.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:54:20', '2014-02-10 06:51:19'),
(92, 'data/ic/j_бусы-и-колье.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:57:55', '2014-02-10 06:52:56'),
(93, 'data/ic/j_кольца.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:58:08', '2014-02-10 13:26:58'),
(94, 'data/ic/j_браслеты.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:58:27', '2014-02-15 08:03:52'),
(95, 'data/ic/j_подвески.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:58:43', '2014-02-15 08:05:30'),
(96, 'data/ic/j_броши.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:58:51', '2014-02-15 08:04:15'),
(97, 'data/ic/w_нижнее-белье.jpg', 1, 0, 1, 0, 1, '2014-02-10 03:57:41', '2014-02-10 06:45:45');

-- --------------------------------------------------------

--
-- Структура таблицы `category_description`
--

CREATE TABLE IF NOT EXISTS `category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category_description`
--

INSERT INTO `category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`) VALUES
(77, 1, 'Пальто и куртки', '', '', '', '', ''),
(76, 1, 'Бижутерия', '', '', '', '', ''),
(32, 1, 'Клачи', '', '', '', '', ''),
(28, 1, 'Дорожные сумки', '', '', '', '', ''),
(27, 1, 'Рубашки и блузы', '', '', '', '', ''),
(67, 1, 'Шапки и шарфики', '', '', '', '', ''),
(26, 1, 'Платья', '', '', '', '', ''),
(66, 1, 'Худи и толстовки', '', '', '', '', ''),
(78, 1, 'Пиджаки', '', '', '', '', ''),
(63, 1, 'Юбки', '', '', '', '', ''),
(60, 1, 'Кофты', '', '', '', '', ''),
(68, 1, 'Женские ремни', '', '', '', '', ''),
(62, 1, 'Футболки и топы', '', '', '', '', ''),
(59, 1, 'Шорты и бриджи', '', '', '', '', ''),
(75, 1, 'Футболки', '', '', '', '', ''),
(74, 1, 'Байки', '', '', '', '', ''),
(46, 1, 'Свитера и кардиганы', '', '', '', '', ''),
(73, 1, 'Жилетки', '', '', '', '', ''),
(18, 1, 'Мужская одежда', '&lt;p&gt;Мужчина должен выглядеть стильно. И это уже не нонсенс, а жизненная необходимость. Многие мужчины стали всерьез задумываться о своем внешнем виде, однако где же купить стильную и модную одежду? В рубрике «мужская одежда» ― вы найдете вещи высокого качества на все случаи жизни, которые комфортны, элегантны и практичны. Благодаря широчайшему размерному ряду, каждый мужчина сможет найти здесь костюмы и рубашки будто сшитые специально для него.&lt;/p&gt;\r\n', 'В рубрике «мужская одежда» ― вы найдете вещи высокого качества на все случаи жизни, которые комфортны, элегантны и практичны.', 'Мужская одежда Байки Жилетки Пиджаки Футболки Кардиганы Пальто', 'Мужская одежда', 'Мужская одежда'),
(25, 1, 'Сумки', '&lt;p&gt;Мы рады приветствовать вас на страницах нашего каталога. Здесь вы найдете самые стильные и недорогие модели на все случаи жизни. Обилие цветовых решений и разнообразных дизайнерских приёмов позволяют подобрать сумку любому покупателю. Подберите себе классическую или молодежную сумку по цене, доступной вашему бюджету. Мы готовы предложить самые смелые и беспроигрышные варианты для вашего гардероба. Сумки из замши&amp;nbsp;и текстиля, клатчи и универсальные модели через плечо – выбирайте и заказывайте прямо сейчас! Насладитесь удобным и профессиональным сервисом от интернет магазина «Rumus».&lt;/p&gt;\r\n', 'Сумки из замши и текстиля, клатчи и универсальные модели через плечо – выбирайте и заказывайте прямо сейчас!', 'Сумки Клатчи Портфели', 'Сумки', 'Сумки'),
(79, 1, 'Рубашки', '', '', '', '', ''),
(57, 1, 'Аксессуары', '&lt;p&gt;Наш интернет магазин уделяет пристальное внимание самым мелким деталям, что делает каждую коллекцию идеальной для самодостаточных, решительных, энергичных современных людей с высокими запросами. Кроме того, сочетание качества и цены на одежду и аксессуары &amp;nbsp;в нашем магазине покажется оптимальным любому практичному человеку. Модные и дизайнерские акссесуары помогут Вам подчеркнуть свой неповторимый стиль, придадут Вашему внешнему виду изысканность и утонченность, выгодно выделят Вас из толпы, сохранив индивидуальность Вашего характера.&lt;/p&gt;\r\n', ' Модные и дизайнерские аксессуары.', 'Аксессуары Бижутерия Ремни Часы Шапки Шарфы', 'Аксессуары', 'Аксессуары'),
(1, 1, 'Женская одежда', '&lt;p&gt;«В гардеробе каждой женщины должно быть маленькое черное платье». Это утверждение Коко Шанель знает, пожалуй, каждая модница. Но ведь в одном платье далеко не уйдешь, да и аппетиты у современных женщин не ограничиваются одной лишь вещью в гардеробе. Перед началом каждой новой поры года модницы ломают головы и стаптывают не одни каблуки, прежде чем найти то, что ее действительно устроит, а именно качественную, стильную, желательно недорогую одежду. Однако, походы по магазинам отнимают много сил и времени. В рубрике «Женская одежда» Вы найдёте множество новых стильных, модных и невероятно красивых вещей от нижнего белья до верхней одежды, для того, чтобы всегда выглядеть на все сто!&lt;/p&gt;\r\n', 'Много новых стильных, модных и очень красивых вещей от нижнего белья до верхней одежды для современных девушек.', 'Женская одежда Платья Кофты Футболки Жакеты Юбки Толстовки', 'Женская одежда', 'Женская одежда'),
(80, 1, 'Портфели', '', '', 'Портфели', 'Портфели', 'Портфели'),
(81, 1, 'Штаны', '', '', 'Штаны', 'Штаны', 'Штаны'),
(82, 1, 'Жакеты', '', '', '', '', ''),
(72, 1, 'Женские часы', '', '', '', '', ''),
(83, 1, 'Мужские часы', '', '', '', '', ''),
(84, 1, 'Мужские ремни', '', '', '', '', ''),
(86, 1, 'Наплечные сумки', '', '', '', '', ''),
(88, 1, 'Классические сумки', '&lt;p&gt;Сумка с плоским дном и двойными короткими ручками. Может быть любых размеров.&lt;/p&gt;\r\n', '', '', '', ''),
(89, 1, 'Тоут', '', '', '', '', ''),
(90, 1, 'Заколки и Резинки', '', '', '', '', ''),
(91, 1, 'Серьги и Каффы', '', '', '', '', ''),
(92, 1, 'Бусы и колье', '', '', '', '', ''),
(93, 1, 'Кольца', '', '', '', '', ''),
(94, 1, 'Браслеты', '', '', '', '', ''),
(95, 1, 'Подвески', '', '', '', '', ''),
(96, 1, 'Броши', '', '', '', '', ''),
(97, 1, 'Нижнее белье и купальники', '', '', '', '', ''),
(87, 1, 'Хобо', '&lt;p&gt;Эта наплечная сумка мешковатой формы с короткой цепочкой в качестве ремешка является общепринятым стандартом в богемной среде.&lt;/p&gt;\r\n', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `category_filter`
--

CREATE TABLE IF NOT EXISTS `category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `category_path`
--

CREATE TABLE IF NOT EXISTS `category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category_path`
--

INSERT INTO `category_path` (`category_id`, `path_id`, `level`) VALUES
(1, 1, 0),
(59, 59, 1),
(59, 1, 0),
(60, 60, 1),
(60, 1, 0),
(83, 83, 1),
(83, 57, 0),
(62, 62, 1),
(62, 1, 0),
(63, 63, 1),
(63, 1, 0),
(84, 57, 0),
(84, 84, 1),
(66, 66, 1),
(66, 1, 0),
(67, 67, 1),
(67, 57, 0),
(26, 26, 1),
(26, 1, 0),
(27, 27, 1),
(27, 1, 0),
(18, 18, 0),
(77, 18, 0),
(77, 77, 1),
(46, 46, 1),
(46, 18, 0),
(73, 73, 1),
(73, 18, 0),
(74, 74, 1),
(74, 18, 0),
(75, 75, 1),
(75, 18, 0),
(25, 25, 0),
(28, 28, 1),
(28, 25, 0),
(81, 18, 0),
(81, 81, 1),
(82, 1, 0),
(82, 82, 1),
(80, 80, 1),
(80, 25, 0),
(32, 32, 1),
(32, 25, 0),
(57, 57, 0),
(68, 68, 1),
(68, 57, 0),
(79, 18, 0),
(79, 79, 1),
(90, 76, 0),
(76, 76, 0),
(78, 78, 1),
(78, 18, 0),
(72, 72, 1),
(72, 57, 0),
(86, 25, 0),
(86, 86, 1),
(87, 25, 0),
(87, 87, 1),
(88, 25, 0),
(88, 88, 1),
(89, 25, 0),
(89, 89, 1),
(90, 90, 1),
(91, 76, 0),
(91, 91, 1),
(92, 76, 0),
(92, 92, 1),
(93, 76, 0),
(93, 93, 1),
(94, 76, 0),
(94, 94, 1),
(95, 76, 0),
(95, 95, 1),
(96, 96, 1),
(96, 76, 0),
(97, 1, 0),
(97, 97, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `category_to_layout`
--

CREATE TABLE IF NOT EXISTS `category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `category_to_store`
--

CREATE TABLE IF NOT EXISTS `category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category_to_store`
--

INSERT INTO `category_to_store` (`category_id`, `store_id`) VALUES
(1, 0),
(18, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(32, 0),
(46, 0),
(57, 0),
(59, 0),
(60, 0),
(62, 0),
(63, 0),
(66, 0),
(67, 0),
(68, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `control_unit`
--

CREATE TABLE IF NOT EXISTS `control_unit` (
  `control_unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`control_unit_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `control_unit`
--

INSERT INTO `control_unit` (`control_unit_id`, `name`, `image`, `link`, `status`, `sort_order`) VALUES
(9, 'Модули доставки', 'data/icon/shipping.png', 'extension/shipping', 1, 4),
(10, 'Настройки', 'data/icon/settings.png', 'setting/store', 1, 13),
(7, 'Модули', 'data/icon/modules.png', 'extension/module', 1, 3),
(8, 'Модули оплаты', 'data/icon/payment.png', 'extension/payment', 1, 5),
(11, 'Товары', 'data/icon/products.png', 'catalog/product', 1, 1),
(12, 'Категории', 'data/icon/category.png', 'catalog/category', 1, 2),
(13, 'Покупатели', 'data/icon/customers.png', 'sale/customer', 1, 7),
(14, 'Заказы', 'data/icon/orders.png', 'sale/order', 1, 6),
(15, 'Языки', 'data/icon/language.png', 'localisation/language', 1, 8),
(16, 'Валюты', 'data/icon/currency.png', 'localisation/currency', 1, 9),
(17, 'Резервирование', 'data/icon/backup_restore.png', 'tool/backup', 1, 11),
(18, 'Производители', 'data/icon/brand.png', 'catalog/manufacturer', 1, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=252 ;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(20, 'Беларусь', 'BY', 'BLR', '', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `coupon`
--

CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% скидка', '1010', 'P', '10.0000', 0, 0, '0.0000', '2011-01-01', '2012-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(7, '-5% скидка', '555', 'P', '5.0000', 1, 1, '200000.0000', '2014-01-04', '2014-07-01', 1, '1', 1, '2014-01-04 13:52:50'),
(6, '-10000 скидка', '10000', 'F', '10000.0000', 1, 1, '100000.0000', '1970-11-01', '2020-11-01', 100000, '10000', 1, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Структура таблицы `coupon_category`
--

CREATE TABLE IF NOT EXISTS `coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `coupon_history`
--

CREATE TABLE IF NOT EXISTS `coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `coupon_product`
--

CREATE TABLE IF NOT EXISTS `coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Рубль', 'BYR', '', ' р.', '0', 10000.00000000, 1, '2014-01-15 03:48:29'),
(2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2014-01-15 12:44:25');

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`customer_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `customer_group_id`, `ip`, `status`, `approved`, `token`, `date_added`) VALUES
(1, 0, 'Дмитрий, Федорович', 'Романовский', 'Dmitriy_r_f@mail.ru', '+375292181075', '', 'dace4bfd90a9b00e42ad1787630cac293e154e1c', '78ff25d6d', 'a:1:{i:73;i:1;}', 'a:0:{}', 0, 1, 1, '109.126.132.83', 1, 1, '', '2014-01-09 01:48:40'),
(2, 0, 'Артур', 'Жданович', 'zhdanovich_artur@mail.ru', '8129882', '', '3fc39de0aa2ec17de94d7a3e8ebc3c32c74c71b3', '21c9ae425', 'a:0:{}', '', 0, 2, 1, '86.57.183.238', 1, 1, '', '2014-01-13 00:19:57'),
(3, 0, 'Нюта', 'Симакова', '221evgen221@mail.ru', '375256183931', '', 'e06dd8e1497316fba258c40b00a23d5e1c659629', '4be39b50f', 'a:0:{}', '', 0, 3, 1, '46.191.126.205', 1, 1, '', '2014-01-21 06:57:16'),
(4, 0, 'Светлана Валерьевна', 'Радион', 'swetkara@mail.ru', '80259758978', '', '4451802be1639c28edb7354546260044fee1f3db', '91d217425', 'a:0:{}', '', 0, 4, 1, '37.45.177.242', 1, 1, '', '2014-01-25 04:16:32'),
(5, 0, 'Лидия Валерьевна', 'Музыка', 'lida.muzyka@yandex.by', '+375297465813', '', '5d1a19c54da6b9fc1dd6694cb9c435206befc313', '44de18e6e', 'a:0:{}', 'a:1:{i:0;s:2:"80";}', 1, 5, 1, '82.145.216.125', 1, 1, '', '2014-02-06 02:48:22'),
(6, 0, 'Вероника Николаевна', 'Артемова', 'v_malvina@mail.ru', '+375297496609', '', 'e05c9e8faeb862822ce53cd0273b89861f2293ab', 'ba3d4122d', 'a:0:{}', '', 0, 6, 1, '178.168.248.83', 1, 1, '', '2014-02-10 05:24:56');

-- --------------------------------------------------------

--
-- Структура таблицы `customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `customer_field`
--

CREATE TABLE IF NOT EXISTS `customer_field` (
  `customer_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `customer_group`
--

CREATE TABLE IF NOT EXISTS `customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `approval`, `company_id_display`, `company_id_required`, `tax_id_display`, `tax_id_required`, `sort_order`) VALUES
(1, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `customer_group_description`
--

CREATE TABLE IF NOT EXISTS `customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `customer_group_description`
--

INSERT INTO `customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Покупатели', 'Группа покупателей');

-- --------------------------------------------------------

--
-- Структура таблицы `customer_history`
--

CREATE TABLE IF NOT EXISTS `customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `customer_ip`
--

CREATE TABLE IF NOT EXISTS `customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Дамп данных таблицы `customer_ip`
--

INSERT INTO `customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '46.191.4.14', '2014-01-09 01:48:40'),
(2, 1, '46.191.27.87', '2014-01-10 06:29:36'),
(3, 1, '178.124.206.199', '2014-01-10 14:44:28'),
(4, 1, '178.126.207.58', '2014-01-11 11:46:54'),
(5, 1, '178.126.74.102', '2014-01-12 14:00:30'),
(6, 2, '86.57.183.238', '2014-01-13 00:19:58'),
(7, 1, '5.100.194.169', '2014-01-13 04:21:35'),
(8, 1, '93.84.191.68', '2014-01-13 11:58:20'),
(9, 1, '46.191.6.40', '2014-01-14 00:52:59'),
(10, 1, '5.100.197.241', '2014-01-15 03:27:07'),
(11, 1, '86.57.136.5', '2014-01-15 10:58:48'),
(12, 1, '46.191.7.227', '2014-01-16 01:10:06'),
(13, 1, '5.100.194.227', '2014-01-17 02:26:05'),
(14, 1, '178.126.129.42', '2014-01-17 15:17:14'),
(15, 1, '37.212.117.21', '2014-01-18 02:08:29'),
(16, 1, '37.212.20.229', '2014-01-18 12:42:39'),
(17, 3, '46.191.126.205', '2014-01-21 06:57:17'),
(18, 1, '109.126.131.22', '2014-01-22 02:02:43'),
(19, 4, '37.45.177.242', '2014-01-25 04:16:33'),
(20, 5, '82.145.208.165', '2014-02-06 02:48:22'),
(21, 6, '178.168.248.83', '2014-02-10 05:24:56'),
(22, 5, '82.145.217.184', '2014-02-13 16:08:41'),
(23, 5, '82.145.209.178', '2014-02-15 12:47:51'),
(24, 5, '82.145.208.74', '2014-02-17 02:41:35'),
(25, 1, '109.126.132.83', '2014-02-19 02:31:06'),
(26, 5, '82.145.217.253', '2014-02-19 06:16:03'),
(27, 5, '82.145.216.125', '2014-02-24 12:49:11');

-- --------------------------------------------------------

--
-- Структура таблицы `customer_online`
--

CREATE TABLE IF NOT EXISTS `customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `customer_reward`
--

CREATE TABLE IF NOT EXISTS `customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `customer_transaction`
--

CREATE TABLE IF NOT EXISTS `customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `custom_field`
--

CREATE TABLE IF NOT EXISTS `custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `custom_field_description`
--

CREATE TABLE IF NOT EXISTS `custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `custom_field_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `custom_field_to_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `custom_field_value`
--

CREATE TABLE IF NOT EXISTS `custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `download`
--

CREATE TABLE IF NOT EXISTS `download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `download_description`
--

CREATE TABLE IF NOT EXISTS `download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `extension`
--

CREATE TABLE IF NOT EXISTS `extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=454 ;

--
-- Дамп данных таблицы `extension`
--

INSERT INTO `extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(451, 'module', 'supermenu'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(449, 'module', 'news_category'),
(411, 'module', 'affiliate'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(427, 'module', 'featured'),
(428, 'module', 'slideshow'),
(429, 'module', 'product_stickers'),
(430, 'module', 'quick_view'),
(431, 'module', 'quick_registration'),
(432, 'module', 'vk'),
(433, 'module', 'special'),
(434, 'module', 'latest'),
(435, 'module', 'information'),
(440, 'module', 'amazonmenu'),
(437, 'module', 'bestseller'),
(439, 'module', 'callback'),
(441, 'feed', 'google_sitemap'),
(442, 'feed', 'google_base'),
(443, 'module', 'lastview'),
(446, 'payment', 'pp_standard'),
(452, 'module', 'filterpro'),
(453, 'module', 'needlessimage');

-- --------------------------------------------------------

--
-- Структура таблицы `filter`
--

CREATE TABLE IF NOT EXISTS `filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Структура таблицы `filter_description`
--

CREATE TABLE IF NOT EXISTS `filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `filter_group`
--

CREATE TABLE IF NOT EXISTS `filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Структура таблицы `filter_group_description`
--

CREATE TABLE IF NOT EXISTS `filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `geo_zone`
--

CREATE TABLE IF NOT EXISTS `geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Структура таблицы `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `top` int(1) NOT NULL DEFAULT '0',
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `information`
--

INSERT INTO `information` (`information_id`, `top`, `bottom`, `sort_order`, `status`) VALUES
(3, 0, 1, 5, 1),
(4, 0, 1, 1, 1),
(5, 0, 1, 6, 1),
(6, 0, 1, 2, 1),
(7, 0, 1, 4, 1),
(8, 0, 1, 3, 1),
(9, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `information_description`
--

CREATE TABLE IF NOT EXISTS `information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `information_description`
--

INSERT INTO `information_description` (`information_id`, `language_id`, `title`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`) VALUES
(6, 1, 'Информация о доставке', '&lt;p&gt;Интернет-магазин RUMUS осуществляет бесплатную доставку по всей Беларуссии!&lt;/p&gt;\r\n\r\n&lt;p&gt;Сроки доставки&lt;br /&gt;\r\nСрок доставки заказа: 35 - 60 дней&lt;br /&gt;\r\nСроки доставки указаны с момента подтверждения заказа оператором. Товары, размещенные на сайте, имеют разные сроки доставки.&lt;br /&gt;\r\nПодробнее о сроках доставки вы можете узнать написав или позвонив нам.&lt;/p&gt;\r\n\r\n&lt;p&gt;Срок доставки в крупные города Беларуси — от 3 до 5 дней.&lt;br /&gt;\r\nСрок доставки в отдаленные населенные пункты — до 10 дней.&lt;/p&gt;\r\n', '', 'Доставка', 'Информация о доставке', 'Информация о доставке'),
(5, 1, 'Сотрудничество', '&lt;p&gt;Приглашаем к сотрудничеству!&lt;/p&gt;\r\n\r\n&lt;p&gt;Уважаемые поставщики и производители одежды! Интернет-магазин rumus.by приглашает к сотрудничеству! &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Наша компания заинтересована в расширении ассортимента и нацелена на долгосрочное и плодотворное сотрудничество. Мы с радостью рассмотрим Ваши коммерческие предложения.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-family: arial, ''helvetica neue'', ''nimbus sans l'', freesans, sans-serif; line-height: normal;&quot;&gt;Мы постоянно расширяем ассортимент товаров и&amp;nbsp;направлений и&amp;nbsp;приглашаем к&amp;nbsp;сотрудничеству производителей одежды, обуви и&amp;nbsp;аксессуаров.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;С нашей стороны гарантируем:&amp;nbsp;&lt;br /&gt;\r\nвыполнение договорных обязательств;&lt;br /&gt;\r\nхорошие перспективы и регулярные закупки;&lt;br /&gt;\r\nширокие рекламные и маркетинговые возможности нашего интернет-магазина;&lt;/p&gt;\r\n\r\n&lt;p&gt;Мы очень ценим:&amp;nbsp;&lt;br /&gt;\r\nсвоевременную и постоянную рассылку актуального прайс-листа;&lt;br /&gt;\r\nпредоставление каталогов и консультаций по товару;&lt;br /&gt;\r\nсовместное продвижение модельного ряда или бренда;&lt;br /&gt;\r\n&amp;nbsp;&amp;nbsp;&lt;br /&gt;\r\nСвяжитесь с нами по электронной почте&amp;nbsp;&lt;br /&gt;\r\nrumus.by@mail.ru или по телефону.&lt;/p&gt;\r\n', '', '', '', ''),
(7, 1, 'Способы оплаты', '&lt;p style=&quot;font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 13px; line-height: 1.6em;&quot;&gt;Оплачивать товары в rumus.by можно следующими способами: &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Оплата при получении:&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp;-оплата производится при получении на почте. Для этого необходимо предъявить документ удостоверяющий личность получателя и заполненную квитанцию с указанием серии и номера документа, дату выдачи документа и орган выдавший документ.&lt;br /&gt;\r\nЗа перевод денег&amp;nbsp;почта взимает комиссию в размере 3%.&lt;/p&gt;\r\n\r\n&lt;p&gt;-Наличный расчет. Вы расплачиваетесь с курьером, когда тот передает Вам заказ. Доступно не для всех городов.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;font-size: 13px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color:#000000;&quot;&gt;&lt;span style=&quot;font-size: 22px;&quot;&gt;&lt;strong&gt;Желаем приятных покупок!&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', '', '', '', ''),
(3, 1, 'Публичная оферта', '&lt;p&gt;В соответствии со ст. 396 Гражданского кодекса Республики Беларусь публичный договор является одним из видов договоров, в соответствии с которым одна сторона принимает на себя обязательство по оказанию услуг в отношении неопределенного круга лиц, обратившихся с запросом на предоставление данных услуг.&lt;br /&gt;\r\nПубличный договор не требует оформления на бумаге и его последующего подписания сторонами, обладает юридической силой в силу совершения сторонами определенных действий, указывающих на их волеизъявление вступить в договорные отношения.&lt;br /&gt;\r\nПубликация (размещение) текста публичного договора на сайте интернет-магазина http://rumus.by является публичным предложением (офертой), адресованным широкому кругу лиц с целью оказания определенных видов услуг (п. 2. ст. 407 Гражданского Кодекса Республики Беларусь).&lt;br /&gt;\r\nФактом, подтверждающим заключение публичного договора со стороны потребителя услуг, является оформление им заявки на предоставление услуг и их последующая оплата (п. 3 ст. 408 Гражданского кодекса Республики Беларусь).&lt;br /&gt;\r\nПубличный договор, совершенный в вышеописанном порядке, считается заключенным в простой письменной форме (п.п. 2-3 ст. 404 и п. 3 ст.408 Гражданского кодекса Республики Беларусь), и соответственно не требует оформления на бумаге и обладает полной юридической силой.&lt;/p&gt;\r\n\r\n&lt;p&gt;Публичный договор розничной купли-продажи интернет-магазина rumus.by:&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\nRumus (ИП Романовский Д.Ф.), именуемый в дальнейшем «Продавец» с одной стороны, и, гражданин (гражданка) именуемый (-ая) в дальнейшем «Покупатель», с другой стороны, заключили настоящий договор о нижеследующем:&lt;/p&gt;\r\n\r\n&lt;p&gt;. ОБЩИЕ ПОЛОЖЕНИЯ&lt;br /&gt;\r\n1.1. В данном договоре используются следующие термины:&lt;br /&gt;\r\nПокупатель (потребитель) – физическое лицо, имеющее намерение заказать или приобрести, либо заказывающее, приобретающее или использующее товар исключительно для личных, семейных, домашних и иных нужд, не связанных с осуществлением предпринимательской деятельности;&lt;br /&gt;\r\nПродавец – &amp;nbsp;Rumus (ИП Романовский Д.Ф.);&lt;br /&gt;\r\nИнтернет-магазин – сайт http://rumus.by, содержащий информацию о товарах и о продавце, позволяющий осуществить выбор, заказ и (или) приобретение товара;&lt;br /&gt;\r\nТовар – конкретный вид одежды и другие товары, выбранные покупателем по образцам, размещенным на сайте http://rumus.by.&lt;br /&gt;\r\nЗаказ – перечень из одного или нескольких наименований (позиций) Товара, объединенных одним номером Заказа, содержащий информацию о наименовании Товара, его количестве, производителе (производителях) Товара, сроке (сроках) поставки Товара, месте назначения поставки Товара, цене на Товар, стоимости доставки и &amp;nbsp;прочих условиях поставки и оплаты.&lt;br /&gt;\r\n1.2. &amp;nbsp;Настоящий Договор, размещенный на используемом Продавцом в Интернете сайте по адресу www.rumus.by, является Публичной офертой и содержит все условия организации купли-продажи дистанционным способом (т.е. через Интернет-магазин). Отсутствие подписанного между сторонами экземпляра Договора на бумажном носителе, с проставлением подписей сторон, в случае размещения заказа и проведения по нему фактической оплаты Покупателем, не является основанием считать настоящий Договор не заключенным.&lt;br /&gt;\r\n1.3. В случае принятия условий настоящего Договора (т.е. публичной оферты Интернет-магазина), гражданин (гражданка), производящий акцепт оферты, становится Покупателем. Акцептом является факт заказа Товара на условиях настоящего Договора, что считается равносильным заключению Договора на условиях, изложенных в оферте (п.3 ст. 408 ГК РБ).&lt;br /&gt;\r\n1.4. Покупатель приобретает товар для личных, бытовых, семейных, домашних и иных нужд, не связанных с осуществлением предпринимательской деятельности.&lt;br /&gt;\r\n1.5. Каждая Сторона гарантирует другой Стороне, что обладает соответствующим правом и достаточным объемом дееспособности, а равно всеми иными правами и полномочиями, необходимыми для заключения и исполнения настоящего Договора.&lt;br /&gt;\r\n1.6. Покупатель несёт ответственность за содержание и достоверность информации, предоставленной при размещении Заказа либо при осуществлении регистрации.&lt;br /&gt;\r\n1.7. Продавец собирает и обрабатывает персональные данные Покупателей (а именно: фамилия, имя, отчество Покупателя; адрес доставки; контактные телефоны) в целях:&lt;br /&gt;\r\n- выполнения условий настоящего Договора;&lt;br /&gt;\r\n- доставки Покупателю заказанного Товара.&lt;br /&gt;\r\nОсуществляя Заказ Товара на Интернет-сайте, Покупатель дает согласие на сбор и обработку персональных данных о себе в целях осуществления доставки заказанного Товара и исполнения условий настоящего договора. При сборе и обработке персональных данных Покупателей Продавец не преследует иных целей, кроме установленных в п. 1.6. настоящего договора.&lt;br /&gt;\r\n1.8. Продавец обязуется: соблюдать конфиденциальность в отношении персональных данных Покупателей; не допускать попытки несанкционированного использования персональных данных Покупателей третьими лицами; исключить доступ к персональным данным Покупателей, лиц, не имеющих непосредственного отношения к исполнению Заказов, за исключением лиц, имеющих права доступа к данной информации в соответствии с законодательством.&lt;br /&gt;\r\n1.9. Продавец оставляет за собой право вносить изменения в настоящий Договор и информацию на сайте в одностороннем порядке, в связи с чем, Покупатель обязуется на момент обращения к Продавцу с заказом на товар учитывать возможные изменения.&lt;br /&gt;\r\nИзменения и/или дополнения, вносимые в настоящий Договор, вступают в силу в день их опубликования в Интернет-магазине.&lt;br /&gt;\r\nИзменения и/или дополнения, вносимые в настоящий Договор в связи с изменением действующего законодательства, вступают в силу одновременно с вступлением в силу изменений в данных актах законодательства.&lt;br /&gt;\r\n1.10. До покупателя доведено, что Продавцом &amp;nbsp;является Индивидуальный предприниматель Романовский Дмитрий Федорович, УНП 290846360, государственная регистрация от 11. 11. 2013 &amp;nbsp;года Администрацией Бобруйского РИК. Режим работы интернет-магазина: круглосуточно, без выходных. Дата регистрации интернет-магазина в торговом реестре РБ: 20. 12. 2013 года Бобруйским &amp;nbsp;районным исполнительным комитетом. Адрес для почтовых отправлений и корреспонденции: &amp;nbsp;210 009, г. Витебск, а/я 58.&lt;br /&gt;\r\n1.11. Отношения в сфере розничной купли-продажи, помимо данного договора, регулируются Гражданским кодексом Республики Беларусь; Законом Республики Беларусь от 9 января 2002 г. № 90-З «О защите прав потребителей»; Законом Республики Беларусь от 28 июля 2003 года № 231-З «О торговле», постановлением Совета Министров Республики Беларусь от 15 января 2009 г. № 31 «Об утверждении Правил осуществления розничной торговли по образцам»; постановлением Совета Министров Республики Беларусь от 7 апреля 2004 г. № 384 «Об утверждении Правил осуществления розничной торговли отдельными видами товаров и общественного питания»; постановлением Совета Министров Республики Беларусь от 14 июня 2002 г. № 778 «О мерах по реализации Закона Республики Беларусь «О защите прав потребителей».&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n2. ПРЕДМЕТ ДОГОВОРА&lt;br /&gt;\r\n2.1. Продавец продает, а Покупатель,на условиях настоящего Договора,покупает товар согласно Заказу.&lt;br /&gt;\r\n2.2. Заказ является неотъемлемой частью Договора.&lt;br /&gt;\r\n2.3. Заказ исполняется после подтверждения заказа Покупателем. В зависимости от способа оплаты исполнение Заказа производится либо в тот же день, либо в следующий рабочий день.&lt;br /&gt;\r\n2.4. Факт оформления заказа Покупателем является безоговорочным фактом принятия Покупателем условий данного Договора. Покупатель, приобретший товар в Интернет-магазине Продавца (оформивший заказ товара), рассматривается как лицо, вступившее с Продавцом в отношения на условиях настоящего Договора.&lt;br /&gt;\r\n2.5. При оформлении Заказа Продавцом и Покупателем определяются уникальные условия купли-продажи по каждой отдельной позиции Товара, как-то: наименование, количество, производитель, срок поставки, цена.&lt;br /&gt;\r\n2.6. Заказ считается исполненным в момент фактической передачи Товара Покупателю на основании выданного Продавцом товарного чека на определенный Товар под роспись Покупателя либо его надлежаще уполномоченного представителя.&lt;br /&gt;\r\n2.7. Товар приобретается Покупателем для собственных нужд.&lt;br /&gt;\r\n2.8. По исполнении Заказа обязательства Продавца перед Покупателем считаются выполненными.&lt;br /&gt;\r\n2.9. Право собственности на Товар и связанные с ним риски переходит от Продавца к Покупателю в момент передачи Товара.&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n3. ПРАВА И ОБЯЗАННОСТИ СТОРОН&lt;br /&gt;\r\n3.1. Продавец обязан:&lt;br /&gt;\r\n3.1.1. Продать Товар в соответствии с условиями Заказа.&lt;br /&gt;\r\n3.1.2. Гарантировать соответствие качества Товара требованиям качества для аналогичных Товаров на территории Республики Беларусь. Обеспечить гарантийные обязательства в соответствии с условиями настоящего Договора.&lt;br /&gt;\r\n3.1.3. В случае изменения цены Товара в ходе исполнения Продавцом Заказа Покупателя, согласовать такие изменения с Покупателем.&lt;br /&gt;\r\n3.2. Продавец имеет право:&lt;br /&gt;\r\n3.2.1. Не приступать к исполнению Заказа, в случае отсутствия всей необходимой контактной информацией о Покупателе.&lt;br /&gt;\r\n3.2.2. Не принимать возврат Товара в случае: продажии товара по акции или с предоставлением скидки, порчи Товара, отсутствия упаковки, использования товара покупателем не по прямому назначению, а также в случае неправильного хранения и/или транспортировки, неправильной упаковкой изделия, присланного покупателем.&lt;br /&gt;\r\n3.2.3. В случае несогласия Покупателя с изменением цен, отказаться от исполнения Заказа, предложить аналогичный Товар другого производителя, изменить сроки поставки Товара.&lt;br /&gt;\r\n3.3. Покупатель обязан:&lt;br /&gt;\r\n3.3.1. Предоставлять при оформлении Заказа точное наименование требуемого Товара. В случае самостоятельного заказа, без консультаций с менеджерами Продавца, нести ответственность за подбор Товара, размер и цвет Товара.&lt;br /&gt;\r\n3.3.2. Оплачивать Товар, согласно Заказу, по указанной в нем цене.&lt;br /&gt;\r\n3.3.3. Принять Товар в соответствии с условиями настоящего Договора.&lt;br /&gt;\r\n3.3.4. При получении Товара убедиться в том, что Товар поставлен в целой упаковке, в неповрежденном виде с этикетками (вкладышами).&lt;br /&gt;\r\n3.3.4. До момента заключения Договора ознакомиться с содержанием и условиями Договора, ценами на Товар, предлагаемыми Продавцом в Интернет-магазине www.rumus.by.&lt;br /&gt;\r\n3.3.5 Сообщить все необходимые данные, однозначно идентифицирующие его как покупателя, и достаточные для доставки Покупателю оплаченного им Товара: фамилия, имя, отчество (на русском языке); фактический адрес доставки; почтовый адрес места жительства (включая индекс); адрес электронной почты; контактные телефоны и иную информацию, указанную в регистрационной форме.&lt;br /&gt;\r\n3.3.6. Не использовать товар, заказанный на интернет-сайте, в предпринимательских целях.&lt;br /&gt;\r\n3.3.7. В случае платной доставки товара возместить Продавцу расходы, связанные с его доставкой.&lt;br /&gt;\r\n3.4. Покупатель имеет право:&lt;br /&gt;\r\n3.4.1. Потребовать возврата предоплаты в случае невозможности исполнения Продавцом условий Заказа.&lt;/p&gt;\r\n\r\n&lt;p&gt;4. ДОСТАВКА ТОВАРОВ&lt;br /&gt;\r\n4.1. Доставка Товара Покупателю осуществляется в сроки устно согласованные Сторонами при подтверждении заказа сотрудником Продавца и условиях изложенных в Правилах продажи, либо в сроки указанные при оформлении заказа (при выборе способа доставки) через корзину магазина. Если не оговорено иное сроки доставки указаны в п. 4.5. настоящего Договора.&lt;br /&gt;\r\n4.2. Перед поставкой заказанного Клиентом товара Продавец имеет право потребовать от Клиента 100% предоплаты заказанного товара. Продавец имеет право отказать Клиенту в доставке товара при отсутствии такой оплаты.&lt;br /&gt;\r\n4.3. Продавец имеет право установить Покупателю ограничения на резервирование Товара.&lt;br /&gt;\r\n4.4. Продавец вправе ограничить одновременно доставляемый Клиенту Товар на срок не более 10 дней.&lt;br /&gt;\r\n4.5. Срок доставки заказа: 35 - 60 дней. Сроки доставки указаны с момента подтверждения заказа оператором.&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n5. ЦЕНА И ПОРЯДОК ОПЛАТЫ&lt;br /&gt;\r\n5.1. Общая цена Заказа формируется из суммы цен каждого из наименований Товара, определяемых в соответствии с условиями Заказа.&lt;br /&gt;\r\n5.2. Цены указываются в белорусских рублях.&lt;br /&gt;\r\n5.3. Цены на Товар определяются Продавцом в одностороннем бесспорном порядке и указываются на страницах интернет-магазина, расположенного по интернет-адресу: http://rumus.by.&lt;br /&gt;\r\n5.4. Оплата Товара производится Покупателем в белорусских рублях.&lt;br /&gt;\r\n5.5. Форма оплаты Заказа: а) наличная – курьеру Продавца; б) безналичная – на расчетный счет Продавца, указанный на страницах интернет-магазина, оплата на почте наложенного платежа.&lt;br /&gt;\r\n5.6 Оплачивать товары в rumus.by можно следующими способами: &amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\nа) оплата при получении;&lt;br /&gt;\r\nб) плата производится при получении на почте. Для этого необходимо предъявить документ удостоверяющий личность получателя и заполненную квитанцию с указанием серии и номера документа, дату выдачи документа и орган выдавший документ. За перевод денег, почта взимает комиссию в размере 3%.&lt;br /&gt;\r\nв) оплата электронными деньгами EasyPay. При оформлении в корзине выберите форму оплаты EasyPay, введите номер кошелька и Вам будет выставлен счет на оплату.&lt;br /&gt;\r\nг) оплата электронными деньгами WebMoney (WMB). При оформлении в корзине выберите форму оплаты WebMoney. Расчет электронными деньгами WebMoney осуществляется посредством платежной системы ЕРИП.&lt;br /&gt;\r\nд) оплата банковской картой Visa, Mastercard. Оплатить пластиковой картой могут пользователи, у которых активирована данная услуга и интернет-банкинг.&lt;br /&gt;\r\nе) оплата в ближайшей кассе, банкомате, инфокиоске. При оплате через кассу Вам не нужно заполнять квитанции, достаточно лишь сообщить кассиру, что Вы оплачиваете заказ через систему ЕРИП, получатель платежа – интернет-магазин rumus.by, и назвать номер. При оплате через банкомат и инфокиоск необходимо следовать инструкциям банков, которые предоставляют данную услугу или инструкциям платежной системы ЕРИП.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;6. КАЧЕСТВО ТОВАРА&lt;br /&gt;\r\n6.1. Продавец предоставляет Покупателю Товар, соответствующий по качеству выбранной Покупателем категории. Качество Товара (за исключением скрытых производственных дефектов) устанавливается Покупателем в порядке визуального осмотра Товара при его получении.&lt;br /&gt;\r\n6.2. В случае возникновения разногласий относительно качества товара каждая из Сторон имеет право на проведение независимой экспертизы. Затраты на проведение экспертизы несет Сторона, по чьей инициотиве проводится экспертиза.&lt;/p&gt;\r\n\r\n&lt;p&gt;7. ГАРАНТИЙНЫЕ ОБЯЗАТЕЛЬСТВА&lt;br /&gt;\r\n7.1. Устанавливаемый Продавцом гарантийный срок указан в карточке каждого из товаров и начинает действовать с момента фактической передачи Товара Покупателю, а в случае, если день доставки Товара определить невозможно, этот срок исчисляется со дня заключения договора.&lt;br /&gt;\r\n7.2. Причины для возврата по ошибке интернет-магазина rumus.by:&lt;br /&gt;\r\nа) неправильная комплектация заказа;&lt;br /&gt;\r\nб) неправильные размер, фасон, цвет, длина и т.п.&lt;br /&gt;\r\n7.3. Возврат денежных средств Клиенту осуществляется в течение 10 календарных дней с момента фактического получения товара Продавцом. Доставка товара Продацу осуществляется за счет клиента. При отправке почтой (Покупатель оплачивает почтовые услуги самостоятельно), пересылка осуществляется обычной доставкой. Достака наложенным платежем не принимается, и задержит получение денег до двух месяцев.&lt;br /&gt;\r\n7.4. Качественные товары, не подлежащие обмену и возврату, указаны в Перечне, утвержденном Советом Министров Республики Беларусь от 14 июня 2002 года № 778.&lt;br /&gt;\r\n7.5 Срок возврата товара ограничен двумя неделями, со дня получения товара. Обращаем Ваше внимание на то, что Требование потребителя об обмене либо возврате товара подлежит удовлетворению, если Товар не был в употреблении, сохранены его потребительские свойства и имеются доказательства приобретения его у данного продавца.&lt;br /&gt;\r\n(Ст. 28 З-на РБ О ЗПП).&lt;/p&gt;\r\n\r\n&lt;p&gt;8. ОТВЕТСТВЕННОСТЬ СТОРОН&lt;br /&gt;\r\n8.1. Стороны несут ответственность за исполнение обязательств по настоящему Договору в соответствии с законодательством Республики Беларусь.&lt;br /&gt;\r\n8.2. Стороны освобождаются от ответственности за полное или частичное неисполнение своих обязательств, если неисполнение является следствием таких непреодолимых обстоятельств как: война или военные действия, землетрясение, наводнение, пожар и другие стихийные бедствия, акты или действия органов государственной власти, изменение таможенных правил, ограничения импорта и экспорта, возникших независимо от воли Сторон после заключения настоящего Договора. Сторона, которая не может исполнить своих обязательств, незамедлительно извещает об этом другую Сторону и предоставляет документы, подтверждающие наличие таких обстоятельств, выданные уполномоченными на то органами.&lt;br /&gt;\r\n8.3. &amp;nbsp;Вся текстовая информация и графические изображения, размещенные на сайте интернет–магазина www.rumus.by имеют законного правообладателя. Не правомерное использование указанной информации и изображений преследуется в соответствии с действующим законодательством Республики Беларусь.&lt;br /&gt;\r\n8.4. Все информационные материалы, представленные на интернет-сайте www.rumus.by,носят справочный характер и не могут в полной мере передавать достоверную информацию об определенных свойствах и характеристиках Товара, таких как: оттенок и структура ткани, форма, упаковка. В случае возникновения у Покупателя вопросов, касающихся свойств и характеристик Товара, перед размещением Заказа ему необходимо обратиться за консультацией к Продавцу по указанным в настоящем договоре телефонам или послать запрос на адрес электронной почты mail@rumus.by либо воспользоваться формой «Обратной связи».&lt;br /&gt;\r\n8.5. Стоимость и условия доставки Заказа Покупатель уточняет на интернет-сайте Продавца или по телефонам: +375 29 2181075, &amp;nbsp;+375 29 1381075.&lt;br /&gt;\r\n8.6. В случае получения некачественного, некомплектного Товара либо несоответствия полученного Товара заказанному, Покупатель должен составить акт в произвольной форме. В акте должна быть отражена следующая информация:&lt;br /&gt;\r\n- фамилия, имя, отчество Покупателя, сотрудника отделения почтовой связи, адрес места жительства Покупателя и местонахождения почтового отделения связи;&lt;br /&gt;\r\n- перечень полученного Товара, его комплектность;&lt;br /&gt;\r\n- факты повреждения Товара, видимые недостатки;&lt;br /&gt;\r\n- другая информация.&lt;br /&gt;\r\nАкт подписывается Покупателем, сотрудником почтового отделения либо представителем Продавца при получении Товара.&lt;br /&gt;\r\n8.7. В случае невыполнения условий п.п. 8.6, 3.3.4, 3.3.5 настоящего договора претензии Покупателя по внешнему виду Товара и его коплектности не принимаются.&lt;br /&gt;\r\n8.8. Претензии по приобретенному Товару могут быть направлены на электронный адрес: mail@rumus.by.&lt;br /&gt;\r\n8.9. Продавец не несет ответственности за действия или бездействия сотрудников РУП «Белпочта» и почтовых служб страны назначения; за убытки Покупателя, возникшие в результате допущенных ошибок при заполнении формы Заказа или при регистрации; в результате неправомерных действий третьих лиц, а также за ненадлежащее использование Покупателем Товаров, заказанных на интернет-сайте Продавца.&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n9. РАЗРЕШЕНИЕ СПОРОВ&lt;br /&gt;\r\n9.1. Стороны примут все меры к разрешению споров и разногласий, которые могут возникнуть при исполнении обязательств по Договору или в связи с этим, путем переговоров.&lt;br /&gt;\r\n9.2. В случае не достижения согласия в ходе переговоров, споры будут разрешаться в судебном порядке в соответствии с действующим законодательством Республики Беларусь по месту нахождения Продавца.&lt;br /&gt;\r\nПокупатель до предъявления иска в суд обязан при наличии у него претензии направить ее на юридический адрес Покупателя либо на адрес электронной почты mail@rumus.by с обоснованием причин и подтверждающих документов. Продавец обязан рассмотреть полученную претензию и направить Покупателю на его электронный или фактический адрес мотивированный ответ в течение 14 дней с момента получения претензии.&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n10. АВТОРСКИЕ ПРАВА&lt;br /&gt;\r\n10.1. Вся текстовая информация и графические изображения, размещенные на интернет-сайте www.rumus.by, являются собственностью Продавца.&lt;br /&gt;\r\n10.2. В случае размещения информации и/или изображения, взятого с ресурса www.rumus.by, размещение ссылки на ресурс обязательно.&lt;/p&gt;\r\n\r\n&lt;p&gt;11. ЗАКЛЮЧИТЕЛЬНЫЕ УСЛОВИЯ&lt;br /&gt;\r\n11.1. Договор вступает в силу с момента оформления заказа на сайте Интернет-магазина 3 ст. 408 Гражданского кодекса Республики Беларусь.&lt;br /&gt;\r\n11.2. Требования Покупателя, связанные с расторжением договора, устранением нарушений его условий, недостатками товара, возмещением убытков, передаются Продавцу в письменной форме с приложением необходимых документов, обосновывающих эти требования (документ, удостоверяющий факт покупки в отношении товаров, на которые установлены гарантийные сроки а также документы, подтверждающие недостатки товара и убытки, причиненные Покупателю в связи с ненадлежащим качеством товара).&lt;/p&gt;\r\n', '', '', '', ''),
(8, 1, 'Контакты', '&lt;div id=&quot;contact_left&quot;&gt;\r\n&lt;p&gt;Телефоны:&amp;nbsp;&lt;br /&gt;\r\n+37529 218 10 75 МТС&lt;br /&gt;\r\n+37529 138 10 75 VELCOM&lt;/p&gt;\r\n\r\n&lt;p&gt;email:&amp;nbsp;&lt;br /&gt;\r\n&lt;a href=&quot;mailto:mail@rumus.by&quot; style=&quot;line-height: 1.6em;&quot;&gt;mail@rumus.by&lt;/a&gt;&lt;/p&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div id=&quot;clock&quot;&gt;&lt;object data=&quot;http://agitki.ru/_ld/8/848_flash_clock.swf&quot; height=&quot;167&quot; type=&quot;application/x-shockwave-flash&quot; width=&quot;167&quot;&gt;&lt;param name=&quot;movie&quot; value=&quot;http://agitki.ru/_ld/8/848_flash_clock.swf&quot; /&gt;&lt;param name=&quot;wmode&quot; value=&quot;transparent&quot; /&gt;&lt;param name=&quot;flashvars&quot; value=&quot;&amp;amp;in_title=Ваш текст&amp;amp;&quot; /&gt;&lt;/object&gt;&lt;/div&gt;\r\n', '', 'Контактная информация', 'Контактная информация', 'Контактная информация'),
(4, 1, 'О нас', '&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: arial, sans-serif; font-size: small; line-height: 16px;&quot;&gt;Мечта&amp;nbsp;&lt;/span&gt;rumus.by =):&lt;/p&gt;\r\n\r\n&lt;p&gt;Мы стремимся сделать доступной для всех жителей Беларуси максимально широкий ассортимент качественной одежды, для заказа через интернет, предоставляем удобный сервис подбора товара.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Для нас очень важен комфорт покупателей, мы стараемся быстро реагировать на все запросы и пожелания, постоянно работаем над улучшением наших сервисов и служб и всегда открыты для продуктивных предложений.&lt;/p&gt;\r\n\r\n&lt;p&gt;Всех посетителей магазина ждут различные регулярные акции и сезонные распродажи. Постоянные покупатели, совершившие покупки на сумму от 800 000 руб., получают специальную скидку в размере 5%.&lt;/p&gt;\r\n', '', '', '', ''),
(9, 1, 'Зашита покупателя', '&lt;p&gt;Возврат осуществляется и из-за ошибки со стороны Продавца.&lt;br /&gt;\r\nПричины для возврата по ошибке интернет-магазина rumus.by, в дальнейшем именуемого «Продавец»:&lt;br /&gt;\r\nнеправильная комплектация заказа;&lt;br /&gt;\r\nнеправильные размер, фасон, цвет, длина и т.п;&lt;/p&gt;\r\n\r\n&lt;p&gt;Возврат денежных средств Клиенту осуществляется в течение 10 календарных дней с момента фактического получения товара Продавцом.&lt;br /&gt;\r\nДоставка товара Продацу осуществляется за счет клиента.&lt;br /&gt;\r\nПри отправке почтой (Покупатель оплачивает почтовые услуги самостоятельно),пересылка осуществляется обычной доставкой. Достака наложенным платежем не принимается, и задержит получение денег до двух месяцев.&lt;/p&gt;\r\n\r\n&lt;p&gt;Качественные товары, не подлежащие обмену и возврату, указаны в Перечне, утвержденном Советом Министров Республики Беларусь от 14 июня 2002 года № 778.&lt;/p&gt;\r\n\r\n&lt;p&gt;Срок возврата товара ограничен двумя неделями, со дня получения товара.&lt;/p&gt;\r\n\r\n&lt;p&gt;Обращаем Ваше внимание на то, что Требование потребителя об обмене либо возврате товара подлежит удовлетворению, если Товар не был в употреблении, сохранены его потребительские свойства и имеются доказательства приобретения его у данного продавца.&lt;br /&gt;\r\n(Ст. 28 З-на РБ О ЗПП).&lt;/p&gt;\r\n', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `information_to_layout`
--

CREATE TABLE IF NOT EXISTS `information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `information_to_store`
--

CREATE TABLE IF NOT EXISTS `information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `information_to_store`
--

INSERT INTO `information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `language`
--

INSERT INTO `language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`) VALUES
(1, 'Russian', 'ru', 'ru_RU.UTF-8,ru_RU,russian', 'ru.png', 'russian', 'russian', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `layout`
--

CREATE TABLE IF NOT EXISTS `layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `layout`
--

INSERT INTO `layout` (`layout_id`, `name`) VALUES
(1, 'Главная'),
(2, 'Страница товара'),
(3, 'Категории'),
(4, 'По умолчанию'),
(5, 'Производители'),
(6, 'Личный кабинет'),
(7, 'Оформление заказа'),
(8, 'Обратная связь'),
(9, 'Карта сайта'),
(10, 'Партнерская программа'),
(11, 'Информация'),
(12, 'FilterPro');

-- --------------------------------------------------------

--
-- Структура таблицы `layout_route`
--

CREATE TABLE IF NOT EXISTS `layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Дамп данных таблицы `layout_route`
--

INSERT INTO `layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(30, 6, 0, 'account'),
(17, 10, 0, 'affiliate/'),
(29, 3, 0, 'product/category'),
(26, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(22, 5, 0, 'product/manufacturer'),
(23, 7, 0, 'checkout/'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(33, 12, 0, 'product/filter');

-- --------------------------------------------------------

--
-- Структура таблицы `length_class`
--

CREATE TABLE IF NOT EXISTS `length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `length_class`
--

INSERT INTO `length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000');

-- --------------------------------------------------------

--
-- Структура таблицы `length_class_description`
--

CREATE TABLE IF NOT EXISTS `length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `length_class_description`
--

INSERT INTO `length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Сантиметр', 'см'),
(2, 1, 'Миллиметр', 'мм');

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'Dress Code', 'data/im/dress_code.png', 0),
(7, ' Larionoff', 'data/im/larionoff.png', 0),
(8, 'Gepur', 'data/im/gepur.png', 0),
(9, 'Eva style', 'data/im/eva_style.png', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturer_description`
--

CREATE TABLE IF NOT EXISTS `manufacturer_description` (
  `manufacturer_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `manufacturer_description`
--

INSERT INTO `manufacturer_description` (`manufacturer_id`, `language_id`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`) VALUES
(5, 1, '', '', '', '', ''),
(7, 1, '', '', '', '', ''),
(8, 1, '', '', '', '', ''),
(9, 1, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `manufacturer_to_store`
--

INSERT INTO `manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(7, 0),
(8, 0),
(9, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `needlessimage_dir`
--

CREATE TABLE IF NOT EXISTS `needlessimage_dir` (
  `directory_id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`directory_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `needlessimage_view`
--
CREATE TABLE IF NOT EXISTS `needlessimage_view` (
`image` text
);
-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_available` datetime NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `news_comments` int(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`news_id`, `image`, `sort_order`, `status`, `date_available`, `date_added`, `date_modified`, `news_comments`, `viewed`) VALUES
(1, '', 1, 1, '2014-02-06 00:00:00', '2014-02-06 05:30:26', '2014-02-07 02:36:32', 0, 27),
(2, '', 1, 1, '2014-02-06 00:00:00', '2014-02-06 06:56:47', '2014-02-06 07:13:10', 0, 14),
(3, '', 1, 1, '2014-02-07 00:00:00', '2014-02-07 00:58:37', '2014-02-07 02:40:41', 0, 12),
(4, '', 1, 1, '2014-02-07 00:00:00', '2014-02-07 01:06:52', '2014-02-07 01:09:41', 0, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `news_category`
--

CREATE TABLE IF NOT EXISTS `news_category` (
  `news_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`news_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `news_category`
--

INSERT INTO `news_category` (`news_category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, '', 0, 0, 1, 0, 1, '2014-02-06 05:34:03', '2014-02-10 01:49:34'),
(2, '', 0, 0, 1, 0, 1, '2014-02-06 07:08:52', '2014-02-10 01:54:25'),
(3, '', 0, 0, 1, 0, 1, '2014-02-07 01:11:57', '2014-02-07 02:06:43');

-- --------------------------------------------------------

--
-- Структура таблицы `news_category_description`
--

CREATE TABLE IF NOT EXISTS `news_category_description` (
  `news_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  PRIMARY KEY (`news_category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news_category_description`
--

INSERT INTO `news_category_description` (`news_category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`) VALUES
(1, 1, 'Виды и фасоны одежды', '', '', '', '', ''),
(2, 1, 'Помощь в выборе одежды', '', '', '', '', ''),
(3, 1, 'Перевод размеров', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `news_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `news_category_to_layout` (
  `news_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`news_category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `news_category_to_store`
--

CREATE TABLE IF NOT EXISTS `news_category_to_store` (
  `news_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`news_category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news_category_to_store`
--

INSERT INTO `news_category_to_store` (`news_category_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `news_comments`
--

CREATE TABLE IF NOT EXISTS `news_comments` (
  `news_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`news_comment_id`),
  KEY `news_id` (`news_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `news_description`
--

CREATE TABLE IF NOT EXISTS `news_description` (
  `news_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`news_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news_description`
--

INSERT INTO `news_description` (`news_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`, `tag`) VALUES
(1, 1, ' Виды мужских сумок', '&lt;div style=&quot;margin: 0px; padding: 0px; color: rgb(77, 82, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 17px; text-align: justify;&quot;&gt;\r\n&lt;div style=&quot;margin: 0px; padding: 0px; color: rgb(77, 82, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 17px; text-align: justify;&quot;&gt;\r\n&lt;p&gt;Современный мужчина идет в ногу со временем и тоже подвержен влиянию моды. Каждый новый сезон дизайнеры радуют нас необычными решениями в выборе стиля и дизайна сумок. Портные умудряются превратить обычный каждодневный аксессуар в запоминающийся элемент образа, тем не менее не лишая изделие вместительности и надежности. Потому, как, только удобными и практичными товарами интересуются и обращают внимание мужчины. Разговаривая о надежности, то в этой ценовой категории окажутся незаменимыми кожаные-планшеты или как их еще называют сумки на плечо. Она удобна для перевозки деловых бумаг и малогабаритных предметов, кожаный планшет не имеет ручки, а значит руки остаются свободными. Размер «почтальонcкой» сумки может быть различным и маленькие компактные на 3 л и большие объемные до 20 л.&lt;/p&gt;\r\n\r\n&lt;p&gt;Во внешнем дизайне изделий все чаще можно встретить узорную строчку шва, строчка может быть расположена даже с лицевой части материала и на первый взгляд может показаться некрасивой и грубой. Очень часто в модных коллекциях мужских сумок встречаютя ремешки из плетеной кожи, хромированные металлические заклёпки и необычная фурнитура причудливых форм.&lt;/p&gt;\r\n\r\n&lt;p&gt;Темные и полутемные тона фактуры в моде всегда. Как всегда в почете черный цвет — это нестареющая классика, черная кожа выгодно выделяет и подчеркивает красоту практически любой сумки. Коричневые оттенки смотрятся очень ярко и лаконично, а вот коньячные цвета очень выгодно смотрятся на фоне других мужских сумок. Стоит отметить, что и коричневые оттенки влились во всю гамму постоянных, классических цветов. Не традиционный серый цвет становится все более популярным. Сумка из кожи серого цвета будет сочетатся и с классическим мужским костюмом, и с обычной повседневной одеждой.&lt;/p&gt;\r\n\r\n&lt;p&gt;Сумка давно перестала быть сугубо женским атрибутом. Кончено, многие мужчины по привычке носят ключи, кошелек, телефон в карманах, но большинство нуждается в более удобном вместилище для бумаг, книг и прочих вещей. Кроме того, удобный портфель или кейс - элемент дресс-кода. Сумка мужская в отличие от женской имеет сдержанный дизайн, поэтому пригодна для деловых встреч.&lt;br /&gt;\r\nВ гардеробе может быть несколько сумок на все случаи жизни. Сумки для разных возрастных групп могут сильно отличаться: согласитесь, что бизнесмен с молодежной сумкой через плечо будет выглядеть несолидно, а подросток со &quot;взрослым&quot; портфелем - неуместно. Поэтому в выборе сумки нужно руководствоваться прежде всего общим стилем и потребностями.&amp;nbsp;&lt;br /&gt;\r\nВсего можно выделить несколько групп, на которые делятся мужские сумки.&lt;/p&gt;\r\n\r\n&lt;p&gt;Портфели и кейсы&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;портфель Tony Perotti&quot; src=&quot;http://www.kvalito.ru/data/stat/610008_color2_1.JPG&quot; style=&quot;height: 246px; width: 250px;&quot; /&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;img src=&quot;http://www.kvalito.ru/data/vasari/j2033_58_1.jpg&quot; style=&quot;height: 250px; width: 250px;&quot; /&gt;&lt;br /&gt;\r\nЭто наиболее старый вид сумок для мужчин, их носили еще наши отцы и деды. Именно с этого типа и началось понятие «мужская сумка». Тогда портфель представлял собой прямоугольное изделие с жесткими углами, больше похожее на коробку.&lt;br /&gt;\r\nОднако современные портфели шагнули далеко вперед и совсем не похожи на жесткого и угловатого предка. Сегодня это практичная сумка, имеющая классическую форму без острых углов с множеством карманов с ручкой и наплечным ремнем. Большие изменение претерпели и запирающие устройства. Можно даже найти портфели и кейсы с кодовым замком.&lt;br /&gt;\r\nРазумеется, такие сумки предназначены в первую очередь для деловых людей и являются необходимой частью образа. &amp;nbsp;Дизайнеры тщательно работают над внешней и внутренней формой, благодаря чему портфели не только презентабельны, но и очень удобны: многочисленные отделения и карманы позволяют без проблем носить бумаги, не допуская их смятия или повреждения. Носят портфели только с деловой формой одежды (костюмы, плащи, пальто).&lt;br /&gt;\r\nПри выборе портфеля нужно прежде всего обращать внимание на материал. Лучше всего натуральная кожа, и не только потому, что такие изделия выглядят лучше: портфель из кожзаменителя или ткани не выдержит эксплуатации и потеряет внешний вид уже через пару месяцев.&lt;br /&gt;\r\nВажно, чтобы ручка была также выполнена из кожи. Пластмасса под действием веса может растрескаться, кроме того, она плохо крепится к сумке.&lt;br /&gt;\r\nДля большей влагостойкости некоторые производители используют слой ламинации, но по стандартам его толщина не превышает трети толщины кожи.&lt;br /&gt;\r\nХорошая сумка для делового человека должна быть вместительной: бумаги и папки распространенного формата А4 в такой портфель помещаются без труда. Лучше, если внутри будет несколько отделений, чтобы сортировать бумаги.&lt;br /&gt;\r\nНасчет цвета сомнений быть не может: черный портфель идеально подойдет почти к любому костюму. Вообще, в мужской моде соблюдается то же правило, что и в женской: сумка по цвету сочетается с обувью. Однако если в гардеробе несколько пар ботинок или туфель, причем разных оттенков, универсальный черный станет лучшим вариантом. Решить проблему совместимости с костюмом помогут дополнительные аксессуары, например, ремень того же черного оттенка.&lt;/p&gt;\r\n\r\n&lt;p&gt;Тоут &quot;Tote bag&quot;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://www.kvalito.ru/data/stat/tote.jpg&quot; style=&quot;height: 260px; width: 250px;&quot; /&gt;&lt;img src=&quot;https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ1WonZI2tkd4WnAgdSfVF0Z--qPjh9qluljvZ1tis9a04v7m0i&quot; style=&quot;height: 250px; width: 250px;&quot; /&gt;&lt;br /&gt;\r\nСумку-тоут, вообще говоря, можно отнести к самым новым веяниям моды. Они оказались очень востребованы, и не успели мы привыкнуть к женским сумкам-тоутам, как дизайнеры сразу предложили нам мужские. До недавнего времени такую модель носили только женщины, но сейчас она стала уместной частью мужского гардероба.&lt;br /&gt;\r\nДословно английское название означает &quot;большая сумка&quot;. Внешне она напоминает мешок и изначально предназначалась для покупок. Отсюда ее форма и удобство: сумка оснащена толстыми ручками, достаточно длинными, чтобы носить ее не только в руках, но и на плече. Минимум отделки, материал (кожа или ткань) и цвет (обычно темный) придают ей строгий, полуофициальный вид, благодаря чему tote можно брать на работу или деловые встречи. Однако она относится к менее строгому стилю.&lt;/p&gt;\r\n\r\n&lt;p&gt;«Сумка туриста» &amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://www.kvalito.ru/data/stat/cam.jpg&quot; style=&quot;height: 250px; width: 250px;&quot; /&gt;&lt;br /&gt;\r\nВ зарубежной моде эта сумка носит название «Camera bag», то есть сумка для фотокамеры. Мы ее условно называем «сумкой туриста». По сути, эта небольшая сумка – аналог мессенджера. Она мягкая, удобная, с множеством карманов. В ней можно переносить множество документов, ключей и прочей мелочи, что, согласитесь, удобно не только для туристов. Носить ее, как и мессенджер, можно практически с чем угодно.&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\n&quot;Мессенджер&quot;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQnRkjYyyeFwIlx8QgyQNF8z1UF7eTfVx7KmMw7d0ZDXISaeyMG&quot; style=&quot;height: 206px; width: 250px;&quot; /&gt;&lt;br /&gt;\r\nСлово &quot;messenger&quot; переводится с английского как &quot;посыльный&quot;. В России такие сумки известны как &quot;сумка через плечо&quot;: вместительная, с длинным ремнем, который перекидывают через плечо. Сейчас они популярны у молодежи благодаря демократичному внешнему виду. Для повседневного ношения лучшего варианта просто не найти.&lt;br /&gt;\r\nЧаще всего такие сумки выполнены из текстиля, благодаря чему стоят совсем недорого. Это еще одна причина их популярности у молодежи. Но есть и более дорогие и стильные модели из замши или кожи.&lt;br /&gt;\r\nСегодня она является представителем классического стиля «casual». В принципе, этот тип сумок очень похож на «сумку туриста», но выполнен он в более свободном стиле. Такие сумки больше всего полюбились студентам, которые стремятся заменить ими не очень модный рюкзак.&amp;nbsp;&lt;br /&gt;\r\nПри выборе такой сумки нельзя забывать об удобстве, лучше всего попробовать, как сумка будет висеть на плече. Чтобы снизить давление на плечевой пояс, нужно выбирать сумку с широким ремнем.&amp;nbsp;&lt;br /&gt;\r\nФорма и материал не позволяют использовать такую модель сумок в деловой сфере, она пригодна исключительно для повседневного ношения.&lt;/p&gt;\r\n\r\n&lt;p&gt;Кожаный-планшет&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNE_Op8qjQfK6YaKMPqn9mqDYMWADXSoaSVKBqsNgrsPMWlzrnEA&quot; style=&quot;height: 250px; width: 250px;&quot; /&gt;&lt;br /&gt;\r\nВнешне кожаный планшет очень похожа на &quot;мессенджер&quot;, но имеет не горизонтальный, а вертикальный формат. Носят ее также на плече. Но формат такой сумки для мужчин меньше, чем у &quot;мессенджера&quot; или портфеля, потому в ней помещается сравнительно небольшое количество вещей. Однако такая сумка имеет уникальный стиль и свободно сочетается с повседневной одеждой или деловым костюмом.&lt;/p&gt;\r\n\r\n&lt;p&gt;Барсетка&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT_SnibWEyU2cE1VJ3CdLPHSs2wadWDRC9oWE-5m7JTHaDrT4yftw&quot; style=&quot;height: 194px; width: 250px;&quot; /&gt;&lt;br /&gt;\r\nБарсетка - аналог женского клатча, небольшая сумочка, которую носят в руках. В нее можно положить лишь малое количество вещей, необходимый минимум, поэтому она подходит для тех, кто привык ходить налегке. Как и планшет, барсетка отлично подходит для деловых встреч и повседневного использования.&lt;/p&gt;\r\n\r\n&lt;p&gt;Дорожная сумка керриол (carryall) или холдол (holdall)&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBhQSERQUEhQUFBQUFBQXFBYUFRUXFxQVFRQVFxUUFRQXHCYfFxkkGRQVHy8gIycpLCwsFR4xNTAqNSYrLCkBCQoKDgwOGA8PGikkHBwpKSkpLCkpLCwsLCwqLS0qLCksNCwpLCksLCwpKSkpLCksKSwsLCkpKS0sKSksKSkpLP/AABEIAMQBAgMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAAAgMEBQcBBgj/xABOEAABAwIBBQsGCQkHBQAAAAABAAIDBBEhBRIxUXEGBxMiQWFygZGxsiNTkqHB0RQVMjNCQ1JzkxckVGKCotLT4RhEY4PCw/AIFqOz8f/EABkBAQADAQEAAAAAAAAAAAAAAAABAgMEBf/EACsRAAICAAUDAwQCAwAAAAAAAAABAhEDBBQhMRJBURMiYTIzgZHw8SNCof/aAAwDAQACEQMRAD8A3FCEIAQhCAEIQgBCEIAQhCAEIQgBCEIAQvIbpN8SKnzmx5r3N0uJtG06rjF55h2rKsv77MzyQJH2OgNPBtOxreM4dZWEsdXUVb+DeOC2reyPoO66vlaTdpUaTE4jW5jj6y1WWRd81zT9Jp/w5HsI6r5p6wVX1ZrmH/S3owfEj6XQs13Ob5Tn2x4ccrSAycDW0Diy+or32S8qx1EYkicHNOHO08rXDSDzFaQxYz4Mp4UockxCELUzBCEIAQhCAEIQgBCEIAQhCAEIQgBCEIAQhCAEIQgBCEIAQhCAEIQgBZxu/wB29r08BJxzXlt857ibcGy3PgdZw2+l3b5f+DU5zTaSS7WawPpO6ge0heP3rdz4mkdWSi4Y4sgB0Z1uPJtF7DadS5cWTnL04/k6cOKjH1JfgTkDeldPmy5QcRytgYbZo1PdyHmbjzrQck7maamHkIIoz9prBnHpPPGd1lWaF0RgoKkYSm5O2csqbLe4yjqxaop4nn7ebmyDZI2zh1FXSFYqYbu03tZMnA1NK58tOzF4PzsA+3do47Bym2cOXOFyHNy+69zHidnGNhw7Romj5XW0CQXvfn1E321zQRY4g6QsA3W5A+K8pBsYtTVN3wjkY76cWy5NhqdzLkx8L/eHKOrBxb9kuGb1R1bZY2yMOc17Q5pHKCLhPLwe9hlXCWmJwZ5SL7t54w6nEH9te8W+FPripGGJDok4ghCFoUBCEIAQhCAEIQgBCEIAQhCAEIQgBCEIAQhCAEIQgBCEIAQkPma3SQNpA71V5Y3QRRQyObIwvDTmtD2klxwbgDfSQqykoq2SotukZZvn5d4SdwB4jLsbsbfOPWc7sC1Lchk8QUNPGBYiJhd0nDOd+84rBt1cbnEtaC52aQABcnQCe8rdcn7oqZkEQdUQtIjYCHSMBBzRgRfSuPKyTuT5Z15mLVRXCLxCpn7sqIaaqDqkae5N/wDfVD+kxdp9y7OuPk5el+C9QqF27qiH95jOy57gls3bUR/vMXWbd4UepHyh0S8Mu1ne/jkrhMniUDj08rHtO3ikdZzV6sbsqL9Kh/EavPb4uW6efJ80cU0b3uMea1jgSbSsJw2AqJTjT3LRhK1seP3FZUDJ6Se/Fk8m7oygWvsLmHqW1L593OUT/gBa7B8WYdINsXAaOYNWtUG+FRmKMyzsZIWNL2uzhZ1uMNFtN1y5aai5Rb77HTmIOXTKu256hCqqfdXSSfIqYT/mNHqJVjDUtfi1zXD9Ug9y7U0zjpocQhCkgEIQgBCEIAQhCAEIQgBCE3NO1gLnuDWjSXEADaSgHElzwASSABpJ5F5LK++RDHcQgzO1jis9I4nqHWvDZX3R1FUfKOIbyMbg0dXLtN1y4mahDjdnTh5acudkaFlbfApobhruFcOSPEdb9HZdeUrN9Cd3zbGMGwuPaTb1Ly4pHLrqRcE83iS42O2OVgvkuDu6rHfXW2MYP9KS/dfWH693VmjuCpxAl8AVg8eflmqwYeESpt0tS7TPL6bh3KK/KUztMsh/bd70kwI4Oyo8ST5Zf04rhEGqJviSdqutzWR3vOfa7BiTbRbQOs9yrYqXhp4or2z5GNvqznBvtU/LlRW8K9lPG4U8b3sia14AzGOLQbHSTbl1rSKtWyjdOkUWWmO4Um2DQSSdRNuvEhUM1dc2XqJaCoqY5WTxOiENPPPnusS50bQGNBB5S7G/IDzLxeRYc43K2jCo2yjlcqRa0kROm6tGQpyCnsNCcAWDkapEctI5EglTeCTb41WyaK6eO+ISoKzkPapXAKJUQhp2q2zI4PU5DBEUx0tcxuOmzr4NJ14XsvPZeoHMGcRYfRNsCDqOjA96mbpW1EFoYG50QiZILG3Ge3jl19Li5rjqsQomTY5c0tndcyfVgZzGx8r5L6XY8Vo0ZtyRgtVHpM1LqRT0VyVewAjQ62w2Kp4ow2V7Wm7Q9wadGc0OIa63JcWNudX1K0WUTtMmKTJlPuhqY/k1Eo5s9xHYcFPh3w61n12d0mMPsuqd7Ey6JVWLNcNkvCg+Ueug316kfKZE79lw7nexXOT99uMm00TmfrMOcPRNj3rNsxBatI5rEXczeWw32N5yXl6CpF4ZWv1gGzhtacR2KwXzm0EEFpLSNBaSCNhXpckb4tXBYOdwzdUmJtzPGPbddcM6n9SOWeUa+lmzoXi8mb6dNJYStfC7luM9vU5uPqXrKGvjmYHxOD2nlHdzFdkcSM/pZyyhKPKJCEIVyhR7r8rOghbmHNfLLHE12HFz7kux1NaVm+UaOZziZZHyWOlzi62y5XsN9Z9qSM6qhh/ckXksl5Tz2WOJXmZp3Ovg9HKqoWQ/g9kpjAToU+VmNxglRUY5dvMuSjr6iIG6gm5Y1btpgBdIlhwUOJPUUxhQIipwgUtlKLKvQT1FM8kKPK5XM1IMVXT0tlVxotdkKncY5GStsXROa8A6CWkOF7cmCs6LLcha1xzQTja2GOJsL67qFLHxTsT9NFaNvRHsV43TM5JWRt1e6SdkbQzNe6ds0BDg4ANezjEHDjDNGsLz2RskcG0Z2JVxlODPlpxq4d3YGNHiUltNZXnN0kRCCTbGeDXWwJ9JYFmkaAIxZIfApTY7pTY0aIKySFRpoLiyuXRBNPgUUSQ48rPmbK2oIcb5ps23FDBmt4o5j2qBkShY1znte9xsBmuc4hrb8mdzgDrU2CKxk6Y8DVAidwczhoBHqL2H3rfqbdeTHpSV+CsqaYsqX2+TnXH7Vj7Vf0slwoWVowHjnA9Vx7E/k8FRJ2rLJUywzUZgTgbrQFkaEYxoDFK4NdbGlEWRuATgpwVIEaTNfUrqJWxcGTgSMdJVtvd7o+DrnU5PElsANTg27T14jrVFJV2CqKWo4GtjmGniOv0HH2WW2A+mVmGMuqNH0ihNxyBwDhoIBGw4ri9g8o8fvsj8xb9+zwvWZZLkIWjb709qaFv2pr9kb/es4o3ryc0/8h6eVXsPRCW4HMu/Dc0442VYJDfSnozcrGzei3iqs7To1J2SQZqgwEWCdfKpIO3UmLEKKRiE8H2G1QBxygVDNKmsOCYnIUNFkysmbhbmUx8QDWj9VqYmGCk1MmjYO5EqQb3KxzPLx80Ux7ZIx7E7KE2w+XHNAf3pnfwJxxUT7EwGHtSGqQQmnR2VC5JgIXZCmYnJwtUkHAuPjwulMbilyHBSCuij+c6bfA1VWXYCGOeOSOX1NLh4VfRswf0h4WpjJzhLI5pYHC+ba187TfZe4/5putpJ+DN/S0UOW5Acwjb1OAcFMyW1TMpRMBxYOKSACNAUUVbWyZttLWuGrEAHR+sHf00Jytibp7k+REZSQbp1rcFSibO3unWutpCYM4CjT1d1KIZLNQNSZmrORQTUpDnXUkHaiZV2UG/NPH0Xlp2PFx62etSZAuspy9pYMSSM3pBwIHs61rh8lJ8G8ZCqfzWDH6mLwNQpVBk1scUbDpYxjfRaB7EL1knR5LPB780mFK3nlPYGD2leDonr1+/FVEzwMtYMY5wOvPcAcNQzB2nVj4ynK8nM74jPUy320XCkROFlEheDp1JzOtoWKZsT2FLNQAq5s3Ol5ymxRMjdc6U6SNagiRdEvOliiVwuorjnqIZSlcNgligqZLDrHeF2eXHs7lCrZcB0meIInlxO1L2HcXSuvO7mgj9cs39E+7BV+TZLzy4/VQj1yn2qa83KTETrZEp0RKSApDAqlrGeASm4Lj6oJl1WoJsktKbncmDUpiWdCBxlRYScxB/cCVkGIgh3Lxn25TYEjuHb21c09mzbWeE+5X1A0t13DCO1o9i27foy7/srsrTuI+Tg57tXeOTG6p53WMD9eew9RDm+I9in18xDLXwv3f8A1QspM/M2u+zM31tf/wA6laJDLMTiyakq1XwVF2hJc5ZlyQ+pTL5U0Su5qA4XpbHpOYkoB691LyTUmOVjxpY9rvRIPsUFrk+02Dje1muN9VmnFa4fJnPg+i4JQ9rXDQ5ocNhFwheW3N1LjR0xIuTTw4g4HybcRcXttQvVs8qjx2+3VMdVsYL8JHE3PBGGa9zywg8p4rr9S8jELL32/BRNzqeQDjuD2uOtrC0tB2F7vSXgWrysyv8AIz08v9tE6CUJySVQWlPtcuc6Bxr06JVH4NdCgD5kXQ9MBKaUskk5y5wmCZcUWSySNXSfJ6bPEEp78VHrPlM+8Z4guucp7Fe53J0nl5vu4e5x9qseGVNQv8vN0YfAphlxUz5/REeCwbKEzUVeGCjmTBMPeqFhwS3TocorXJwyKQPOemXPSHPXC9QCHJJd0o5mesEKJlHdVVRmzHNAsdDBe1v1r6lOgYHOlv8A4fc5IloGkOv9l3hK6IySasycbTPMjdPO4cZ2cNRa3vABVy7LD5IGxlrQM5r8Lk3DXAadHykxT5IYY24fRHcpIo1rKceyM4xfdnKWSykZ6aZBZLDFi6NULanWR30JMUasIYrKrZI3HSGyHUansfZNSyhQCtkp7J2lY03zzZtjnHU36R7LpMj7lKmi8m9o0ljh2tIW2GtzLE4NiyFlRvwWDg4yWcDFmHHFuY3NPZZCjblaUsoaRpNy2mgbhfkiaNS4vUVUeWys34NFLtl/21n4jwutE34I/J051PeO1rfcs8gJtzLzM19xnpZb6EIaMU9HpSmp34MuZnQIJuVwhOEAJslRRNjjSlXTWcguQkcc5NPnTbnJl7koWNVU3Gj+8Z4k4XKLM7jM+8Z4lIctK2RS9yPSu8vNsi/9YUrOUOmHl5ejF4FMck1v+hF7HDIkF66Qkuaq0TYphTrkwxPKKJGwVwvXSxccEoWM0juPL/l9zk5O/B3Rf4SmaUYybWdx96XMOK7oP8BWle5fgr2Yiib5NnRHcnLJqiHEbsCccofIXAvBcLEloTzVAEA2UuOZNNgulCOyhkjjpLBRpKi6VImAMVaKsq2PRAaUirnzWOceRpPYNCcjCTVUJlbwYIBktGCdAL3BoJ5uMuqHNHPPg+hKaIBjQ1oaA1oDRazQALNGzQhPsFgBqCF6J51ng990+Qg+8d4FmkD8FpG+627KfVnS322Zb2rNm4LzMyrmelln7CSx+KU+otgmo3JDlzUdFjvCoumQE4ClCxQcuOlXbpshRRNnC5NuSkh5VqIsjS/KZ02eIKUSok+lvTb4gpb2rStil7kWA/nEnQj8KmSBQ4vn3c7I/wDUPYprlWa3EeBm66ghdaFUscDU7ZcASyVBI0Sm5CluKbcpoixqjGMnSb6m/wBUuoHEf0H+EpFCcZOmPCE7V/Nv6Du4rSvcit7DNL8huwJTik0/yRsSiqtEphdLBTNktpSibHOEKXwxTKLKtE2Kc9DUmyAFZKirZJjKmUEYM0QOjhYsdXlGlV7CrXIcBkqYWDllZ4hdbQ5Mp8G8IXbIXqHmHj99GnDqMO5WStPpAtPeOxZRDFcFatvpz2o2t+3K0djXH2BZbBgvNzT956GW+kAy2CS4gJckqjOcuWmdVodDl0uTAculymmRaFukSDIkkJJU0RY4XJDkArhVqII9QdHSb3hTH6TtUKrGGHIpzziVativciX8sfu2eJ6mgqE753awepzvepgGCiQiJchq6WroCoy6C649yQCb/wDMEpxQCAkvSgEmQ4KyIGKE4P6f+lqcrD5N/Rt2kBIovku6bvYPYu1p4h580fvD3LStynYTDoSrrjBglAKjLI5ZdCXmpBaqknSk3QV1rUAByVnIDCjgygEB+pex3s2A1zL8jXkbc33XXkRCvR737nNr4LfacDsLHA+paYT96M8Vexm4IQheqeYUW7Hc98Mp8xpAe1wey+gkAggnkuCfUshyxkieAnhYnMA5SMOpwuCt7VVlnczDVfOtJ2GywxMGM3fc2hjSgqR8+HLEXLI3tXPjiHzje1bDNvPUDvov9L+iYO8nk/7MnpD3KmnRfUPwZH8cwedb60r43h84ztC1U7xmT9UnpD3Lv5DMn6pPS/op06Gofgyn42i84z0gujKcXnGekPetUdvF5PPnfTHuSDvDZP1z/iD3KNOvJOpfgy/4wi84z0m+9IdlSL7bPSC1EbweT/tVH4g/hS27xVCNElUNkjP4FGn+SdT8GO1OVWEHNJdh9EE+xSfjuOwu62AvcHTbH1rXPyI0fnqz8Vn8tOfkYpPO1X4kf8tPQf8AP6Hrr+f2Ys/LDDK0g3GaQSAcONcXw2qzZlOMj5besgd61f8AIxSedqvxGeyNJk3kqF2l9Sf8xn8Ch5exqEjLDlKPzkfpt96T8dQjTKzqN+5am3eMydyic7ZfcE6N5PJvm3/iH3KdMvJGpfgyQ5dg8631+5J+OID9aztWsv3jcmn6Eg2P/om/yE5O/wAYbHj+FTpojUvwZQ7LEPnWekFHmy1HbBwOwE9y1128TQ8klS3ZI32sQN4yk8/WfiRfylGnJ1Bj1DlmMMxcAS5xscLXcbeqyKvLMebg8HjDR1rZTvJ0vJUVfpQn/aSXbyNN+kVP/g/lKfRd2PXVGSU+UI3aHt7QpTXjkK0mbeFpXaaio620574kx/Z7o/P1HZD7I1XT/JOoXgz+65de+P8A08Un6RUdkX8KT/Z3pf0ifsj9yab5I1PweDBCOFHMvef2d6X9Im9Fi5/Z4pv0iTrY33ppvkan4PC/CgNLmjaQhtWCbBzTsIK0ODeEpm/XPv0G+9WEG87C365/oj3ppkNS/B4PIe5+aqkzI2i9rkuIaANes9S1bcluHZR8dx4SYi2d9Fo5Q0e3uT2RNxcVM8Pa5xI0XXoVrh4EYO+5lPGlJUCEIW5iCEIQAhCEAIQhACEIQAhCEAIQhACEIQAhCEAIQhACEIQAhCEAIQhACEIQAhCEAIQhACEIQAhCEB//2Q==&quot; style=&quot;height: 190px; width: 250px;&quot; /&gt;&lt;br /&gt;\r\nЭта сумка предназначена больше для путешествий или командировок, но может использоваться и на обычной прогулке. Они постепенно вытесняют чемоданы, так как более удобны для путешествия. Отличительная особенность таких сумок - вместительность. Дизайнеры работают над тем, чтобы легкость и удобство таких сумок никак не отражались на их прочности.&amp;nbsp;&lt;br /&gt;\r\nДорожные сумки не имеют четко выраженной стилистической принадлежности и хорошо сочетаются с деловым костюмом или простой одеждой.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: left;&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', '', '', '', '', ''),
(2, 1, 'Выбор сумки для путешествий', '&lt;p&gt;&amp;nbsp;&amp;nbsp; &amp;nbsp;В этой статье речь идет о сумках для перевозки багажа во время путешествий. Условно их можно разделим&amp;nbsp;на рюкзаки, чемоданы на колесах, дорожные сумки.Сначало надо представлять для какой поездки она будет использоваться.&lt;br /&gt;\r\n&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp;Начнем с рюкзака. Этот вариант подойдет для активного непродолжительного отдыха. Много вещей в него не положишь, но он не занимает руки и удобен в использовании.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://www.kvalito.ru/data/Aswood/Ashwood_bags/DJ-82_01.jpg&quot; style=&quot;height: 150px; width: 200px;&quot; /&gt;​&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;Чемодан на колесах – это выбор стильных и солидных людей. Он очень вместителен и подойдет для длительной командировки или отдыха. При этом он будет отличным дополнением Вашего делового облика.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://www.kvalito.ru/data/Aswood/Ashwood_bags/89150_black_1.jpg&quot; style=&quot;height: 200px; width: 200px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;Как разновидность чемодана на колесах можно упомянуть портплед. Командировки бывают разными, многим требуется, чтобы в запасе был хорошо сохранившийся после поездки костюм. Портплед поможет Вам быть на высоте все время: во время встречи в аэропорту Вы будете выглядеть стильно и уверенно, а после заезда в отель уже через считанные минуты сможете отправиться на переговоры в свежем костюме.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://www.kvalito.ru/data/Aswood/Ashwood_bags/63421_cognac_1_big.jpg&quot; style=&quot;height: 269px; width: 200px;&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp; &amp;nbsp;Мужские дорожные сумки, или как их называют иначе «holdall», сегодня стали очень популярными. Большая вместительная сумка стала атрибутом делового стиля &amp;nbsp;современного мужчины во время поездки. Но, мужские дорожные сумки&amp;nbsp;используются и для путешествий и&amp;nbsp;уикендов.&amp;nbsp;Дорожная сумка подойдет практически для любой поездки. Ее можно взять с собой в салон самолета, поезда или багажник автомобиля. Она может быть рзного размера.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://www.kvalito.ru/data/Aswood/Ashwood_bags/89154_Brown_01.jpg&quot; style=&quot;height: 200px; width: 200px;&quot; /&gt;&lt;/p&gt;\r\n', '', '', '', '', ''),
(3, 1, 'Типы кошельков', '&lt;p&gt;Кошелек – это один из&amp;nbsp;древнейших аксессуаров, который носит с собой человек. Сегодня это уже и не аксессуар как таковой, а совершенно необходимая вещь. Практически каждый человек постоянно носит его с собой. Кошелек появился тогда же, когда и первые деньги, то есть почти с зарождения цивилизации.&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Человечество постоянно развивалось и менялось на протяжении веков, и кошелек проходил этот путь вместе с человечеством. Сегодня доступны разные варианты кошельков, от небольшого и популярного бумажника до более крупных кошельков. Вот&amp;nbsp;как сегодня классифицируются кошельки.&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;1. &amp;nbsp; &amp;nbsp; Бумажник&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://www.kvalito.ru/data/vasari/men_wal_2/P_1121_01_03_1.jpg&quot; style=&quot;height: 172px; width: 250px;&quot; /&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Форма, которую мы называем «бумажником» носит название «American Billford», то есть американский бумажник. А поскольку мы так привыкли к его форме, целесообразней называть его просто «классическим кошельком».&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Итак, классический кошелек – это наиболее популярная и знакомая нам форма. Обычно это кожаное изделие, которое можно сложить два-три раза, чтобы он поместилось в карман брюк. Эта форма появилась в конце 1950-х годов и дошла до наших дней без существенных изменений.&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;2. &amp;nbsp; &amp;nbsp; Нагрудный кошелек&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;img src=&quot;http://www.kvalito.ru/data/vasari/woman_wal_2/P_4163_01_03_1.jpg&quot; style=&quot;height: 250px; width: 250px;&quot; /&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Ближайший сосед классической формы по классификации – это нагрудный кошелек. Он отличается тем, что купюры в нем помещаются без складывания. По сути своей размером. Этот кошелек слишком большой чтобы носить его в карманах брюк, поэтому обычно он находится в нагрудном кармане костюма или портфеле. Отсюда и его название.&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Смотрится нагрудный кошелек солидно, и его извлечение из нагрудного кармана выглядит весьма эффектно. С другой стороны, если он затерялся где-то в Вашем портфеле, и Вы начинаете его спешно искать, когда он необходим, это, согласитесь, уже не так солидно. Нагрудный кошелек – это выбор спокойного, уверенного мужчины… с объемными карманами. &amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;3. &amp;nbsp; &amp;nbsp; Кошелек путешественника&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;img src=&quot;http://www.kvalito.ru/data/vasari/men_port_vasari/P_4250_09_01_1.jpg&quot; style=&quot;height: 250px; width: 250px;&quot; /&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Кошелек путешественника – это еще более объемный родственник классической формы. В него помещаются деньги, пластиковые карты, паспорт, водительское удостоверение и много другой мелочи. Он большой уже не только для карманов брюк, но и для карманов пиджака, поэтому находится обычно в сумке.&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Он действительно полезен в путешествиях, когда все необходимые документы аккуратно собраны в одном месте.&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;4. &amp;nbsp; &amp;nbsp; Кошелек на молнии&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;img src=&quot;http://www.kvalito.ru/data/vasari/woman_wal_2/K_4369_09_09_1.jpg&quot; style=&quot;height: 250px; width: 250px;&quot; /&gt;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Кошелек на молнии очень похож на женскую косметичку. Отличие только в наличии внутренних карманов для купюр. Границы между кошельком и сумкой постепенно стираются понятиями косметичка и клатч. Но сегодня кошелек на молнии приобретает все большую популярность у дизайнеров и модниц.&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;В общем, это оправдано. Это удобно, стильно, красиво и практично. Еще не клатч, но уже и не кошелек.&lt;br /&gt;\r\n&amp;nbsp;&lt;/p&gt;\r\n', '', '', '', '', ''),
(4, 1, 'Как подобрать сумочку', '&lt;p&gt;При выборе новой сумочки всегда возникает вопрос: «Подойдет ли моей фигуре эта сумка?». Ответ на этот вопрос действительно крайне важен, именно от него зависит наш выбор, особенно, если мы делаем его в интернет магазине, где нет возможности осуществить примерку.&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Эта статья ставит своей целью сделать вопрос выбора более понятным для Вас. Так давайте разберемся, какие именно типы женских сумок подходят Вашей фигуре.&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp;1. &amp;nbsp; &amp;nbsp; Высокий рост, худое телосложение&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Для этого типа фигуры подходят сумки типа хобо, небольшие и объемные. Старайтесь избегать сумок с длинным ремешком, они делают Вас визуально еще выше. Основное правило для данного типа фигуры: сумка должна быть широкой, объемной, но не длинной.&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; Кстати, клатчи также отлично подходят для Вас.&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;2. &amp;nbsp; &amp;nbsp; Низкий рост и худое телосложение&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; В прошлом сезоне, когда сумки большого размера были очень актуальны, все старались пополнить и свой гардероб подобной сумкой. Надеюсь, что Вы не поддались этой «провокации». Для Вас эти сумки не подходят, они делают Вас визуально еще меньше. В новом сезоне &amp;nbsp;мода на большие сумки прошла, и наступило Ваше время. Не выбирайте сумки с длинным ремешком, а в остальном ограничений нет, любые женские сумки Вам подходят.&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;3. &amp;nbsp; &amp;nbsp; Пышное телосложение&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp;Модные тенденции прошлого сезона идеально соответствовали Вашему телосложению, сумки большого и среднего размера подходят Вам, причем необходимо выбирать сумку с наиболее четкой формой. Бесформенные мешки Вам не подходят. Единственное правило: не выбирайте слишком маленькие сумки и бесформенные сумки.&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp;Посмотрев на эти рекомендации, мы можем сформулировать общее простое правило для подбора сумки по Вашей фигуре: Форма сумки должна быть противоположностью Вашей фигуры. При худом телосложении выбор должен пасть на объемные сумки пышных форм, не обязательно большого размера, разумеется, а при пышном телосложении – на сумку с четкой формой, но обязательно не слишком маленькую.&lt;br /&gt;\r\n&amp;nbsp;&lt;br /&gt;\r\n&amp;nbsp; &amp;nbsp; &amp;nbsp;Особенно помните, что соответствие сумки Вашей фигуре гораздо важнее любых модных трендов. Конечно же, не стоит при этом забывать, что цвет сумки должен соответствовать цвету Вашей одежды, и сама сумка должна подходить тому месту, в которое Вы направляетесь. Вряд ли имеет смысл идти в театр с огромной сумкой-мешком.&lt;/p&gt;\r\n', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `news_image`
--

CREATE TABLE IF NOT EXISTS `news_image` (
  `news_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `news_relateds`
--

CREATE TABLE IF NOT EXISTS `news_relateds` (
  `news_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `news_related_articles`
--

CREATE TABLE IF NOT EXISTS `news_related_articles` (
  `news_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `news_to_layout`
--

CREATE TABLE IF NOT EXISTS `news_to_layout` (
  `news_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `news_to_news_category`
--

CREATE TABLE IF NOT EXISTS `news_to_news_category` (
  `news_id` int(11) NOT NULL,
  `news_category_id` int(11) NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`,`news_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news_to_news_category`
--

INSERT INTO `news_to_news_category` (`news_id`, `news_category_id`, `main_category`) VALUES
(1, 1, 1),
(2, 1, 0),
(2, 2, 1),
(3, 1, 1),
(4, 2, 1),
(4, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `news_to_store`
--

CREATE TABLE IF NOT EXISTS `news_to_store` (
  `news_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news_to_store`
--

INSERT INTO `news_to_store` (`news_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `option`
--

CREATE TABLE IF NOT EXISTS `option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `option`
--

INSERT INTO `option` (`option_id`, `type`, `sort_order`) VALUES
(13, 'select', 0),
(15, 'select', 2),
(18, 'select', 0),
(11, 'select', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `option_description`
--

CREATE TABLE IF NOT EXISTS `option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `option_description`
--

INSERT INTO `option_description` (`option_id`, `language_id`, `name`) VALUES
(13, 1, 'Цвет'),
(15, 1, 'Размер обуви'),
(18, 1, 'Размер (буквы)'),
(11, 1, 'Размер');

-- --------------------------------------------------------

--
-- Структура таблицы `option_value`
--

CREATE TABLE IF NOT EXISTS `option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- Дамп данных таблицы `option_value`
--

INSERT INTO `option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(109, 13, 'no_image.jpg', 0),
(86, 15, 'no_image.jpg', 8),
(60, 13, 'no_image.jpg', 0),
(67, 13, 'no_image.jpg', 0),
(85, 15, 'no_image.jpg', 7),
(84, 15, 'no_image.jpg', 6),
(69, 11, 'no_image.jpg', 1),
(70, 11, 'no_image.jpg', 2),
(71, 11, 'no_image.jpg', 3),
(73, 11, 'no_image.jpg', 5),
(66, 13, 'no_image.jpg', 0),
(99, 13, 'no_image.jpg', 0),
(65, 13, 'no_image.jpg', 0),
(59, 13, 'no_image.jpg', 0),
(51, 13, 'no_image.jpg', 0),
(54, 13, 'no_image.jpg', 0),
(61, 13, 'no_image.jpg', 0),
(53, 13, 'no_image.jpg', 0),
(52, 13, 'no_image.jpg', 0),
(57, 13, 'no_image.jpg', 0),
(56, 13, 'no_image.jpg', 0),
(62, 13, 'no_image.jpg', 0),
(63, 13, 'no_image.jpg', 0),
(72, 11, 'no_image.jpg', 4),
(74, 11, 'no_image.jpg', 6),
(81, 15, 'no_image.jpg', 3),
(83, 15, 'no_image.jpg', 5),
(80, 15, 'no_image.jpg', 2),
(77, 15, 'no_image.jpg', 1),
(82, 15, 'no_image.jpg', 4),
(87, 15, 'no_image.jpg', 9),
(88, 15, 'no_image.jpg', 10),
(89, 15, 'no_image.jpg', 11),
(90, 15, '', 12),
(91, 15, '', 13),
(92, 15, '', 14),
(93, 15, '', 15),
(94, 15, '', 16),
(95, 15, '', 17),
(96, 15, '', 18),
(97, 15, '', 19),
(68, 13, 'no_image.jpg', 0),
(55, 13, 'no_image.jpg', 0),
(98, 13, 'no_image.jpg', 0),
(101, 18, 'no_image.jpg', 1),
(102, 18, '', 0),
(103, 18, '', 0),
(104, 18, '', 0),
(105, 18, '', 0),
(106, 18, '', 0),
(107, 18, '', 0),
(100, 13, 'no_image.jpg', 0),
(108, 13, 'no_image.jpg', 0),
(64, 13, 'no_image.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `option_value_description`
--

CREATE TABLE IF NOT EXISTS `option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `option_value_description`
--

INSERT INTO `option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(109, 1, 13, 'Темно коричневый'),
(60, 1, 13, 'Оранжевый'),
(66, 1, 13, 'Серебристый'),
(67, 1, 13, 'Темно синий'),
(99, 1, 13, 'Светло коричневый'),
(69, 1, 11, '40'),
(70, 1, 11, '42'),
(71, 1, 11, '44'),
(73, 1, 11, '48'),
(72, 1, 11, '46'),
(55, 1, 13, 'Коричневый'),
(74, 1, 11, '50'),
(65, 1, 13, 'Золотистый'),
(59, 1, 13, 'Красный'),
(51, 1, 13, 'Белый'),
(57, 1, 13, 'Зеленый'),
(52, 1, 13, 'Розовый'),
(53, 1, 13, 'Синий'),
(61, 1, 13, 'Желтый'),
(89, 1, 15, '40'),
(88, 1, 15, '39'),
(87, 1, 15, '38'),
(86, 1, 15, '37'),
(85, 1, 15, '36'),
(84, 1, 15, '35'),
(83, 1, 15, '34'),
(81, 1, 15, '32'),
(80, 1, 15, '31'),
(77, 1, 15, '30'),
(82, 1, 15, '33'),
(90, 1, 15, '41'),
(91, 1, 15, '42'),
(92, 1, 15, '43'),
(93, 1, 15, '44'),
(94, 1, 15, '45'),
(95, 1, 15, '46'),
(96, 1, 15, '47'),
(97, 1, 15, '48'),
(54, 1, 13, 'Голубой'),
(56, 1, 13, 'Бежевый'),
(62, 1, 13, 'Фиолетовый'),
(68, 1, 13, 'Бирюзовый'),
(63, 1, 13, 'Серый'),
(101, 1, 18, 'XXS'),
(102, 1, 18, 'XS'),
(103, 1, 18, 'S'),
(104, 1, 18, 'M'),
(105, 1, 18, 'L'),
(106, 1, 18, 'XL'),
(107, 1, 18, 'XXL'),
(98, 1, 13, 'Салатовый'),
(100, 1, 13, 'Коралловый'),
(108, 1, 13, 'Хаки'),
(64, 1, 13, 'Черный');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_company_id`, `payment_tax_id`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(9, 0, 'INV-2013-00', 0, 'Интернет магазин rumus.by', 'http://rumus.by/', 1, 1, 'Дмитрий, Федорович', 'Романовский', 'Dmitriy_r_f@mail.ru', '+375292181075', '', 'Дмитрий, Федорович', 'Романовский', '', '', '', 'а/я 58', '', 'Витебск', '210009', 'Беларусь', 20, 'Витебск', 343, '', 'PayPal', 'pp_standard', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '0.0100', 0, 0, '0.0000', 1, 2, 'USD', '1.00000000', '46.191.7.227', '', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2014-01-16 03:27:17', '2014-01-16 03:27:17'),
(5, 0, 'INV-2013-00', 0, 'Интернет магазин rumus.by', 'http://rumus.by/', 0, 1, 'qwer', 'qwer', 'qwer@mail.ru', '15432345', '', 'qwer', 'qwer', '', '', '', '2144', '', '2145', '534543', 'Беларусь', 20, 'Гродно', 340, '', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '21.5000', 0, 0, '0.0000', 1, 2, 'USD', '1.00000000', '86.57.183.238', '', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2014-01-15 04:26:15', '2014-01-15 04:26:15'),
(6, 0, 'INV-2013-00', 0, 'Интернет магазин rumus.by', 'http://rumus.by/', 0, 1, 'hjhjhj', 'hjhjhj', 'hjhj@mail.ru', '34564356', '', 'hjhjhj', 'hjhjhj', '', '', '', '34564356', '', '4356', '3456', 'Беларусь', 20, 'Гродно', 340, '', 'PayPal', 'pp_standard', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '15.0000', 0, 0, '0.0000', 1, 2, 'USD', '1.00000000', '86.57.183.238', '', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2014-01-16 03:10:08', '2014-01-16 03:10:08'),
(7, 0, 'INV-2013-00', 0, 'Интернет магазин rumus.by', 'http://rumus.by/', 1, 1, 'Дмитрий, Федорович', 'Романовский', 'Dmitriy_r_f@mail.ru', '+375292181075', '', 'Дмитрий, Федорович', 'Романовский', '', '', '', 'а/я 58', '', 'Витебск', '210009', 'Беларусь', 20, 'Витебск', 343, '', 'PayPal', 'pp_standard', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '21.0000', 0, 0, '0.0000', 1, 2, 'USD', '1.00000000', '46.191.7.227', '', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2014-01-16 03:16:28', '2014-01-16 03:16:28'),
(8, 0, 'INV-2013-00', 0, 'Интернет магазин rumus.by', 'http://rumus.by/', 1, 1, 'Дмитрий, Федорович', 'Романовский', 'Dmitriy_r_f@mail.ru', '+375292181075', '', 'Дмитрий, Федорович', 'Романовский', '', '', '', 'а/я 58', '', 'Витебск', '210009', 'Беларусь', 20, 'Витебск', 343, '', 'PayPal', 'pp_standard', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '21.0100', 0, 0, '0.0000', 1, 2, 'USD', '1.00000000', '46.191.7.227', '', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2014-01-16 03:26:39', '2014-01-16 03:26:39'),
(10, 0, 'INV-2013-00', 0, 'Интернет магазин rumus.by', 'http://rumus.by/', 0, 1, 'Светлана Валерьевна', 'Радион', 'swetkara@mail.ru', '80259758978', '', 'Светлана Валерьевна', 'Радион', '', '', '', 'Гродненская область', '', 'Волковыск', '231900', 'Беларусь', 20, 'Гродно', 340, '', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '30.0000', 0, 0, '0.0000', 1, 2, 'USD', '1.00000000', '37.45.177.242', '', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.76 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2014-01-25 04:07:57', '2014-01-25 04:07:57'),
(40, 0, 'INV-2013-00', 0, 'Интернет магазин rumus.by', 'http://rumus.by/', 2, 1, 'Артур', 'Жданович', 'zhdanovich_artur@mail.ru', '8129882', '', 'Артур', 'Жданович', '', '', '', 'лазо', '', 'витебск', '11111', 'Беларусь', 20, 'Витебская область', 343, '', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '40.0000', 0, 0, '0.0000', 1, 2, 'USD', '1.00000000', '86.57.183.238', '', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2014-02-19 02:40:11', '2014-02-19 02:40:11'),
(20, 0, 'INV-2013-00', 0, 'Интернет магазин rumus.by', 'http://rumus.by/', 2, 1, 'Артур', 'Жданович', 'zhdanovich_artur@mail.ru', '8129882', '', 'Артур', 'Жданович', '', '', '', 'лазо', '', 'витебск', '11111', 'Беларусь', 20, 'Витебск', 343, '', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '20.0000', 0, 0, '0.0000', 1, 2, 'USD', '1.00000000', '86.57.183.238', '', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2014-02-19 00:32:04', '2014-02-19 00:32:04');

-- --------------------------------------------------------

--
-- Структура таблицы `order_download`
--

CREATE TABLE IF NOT EXISTS `order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `order_field`
--

CREATE TABLE IF NOT EXISTS `order_field` (
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `order_fraud`
--

CREATE TABLE IF NOT EXISTS `order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `order_history`
--

CREATE TABLE IF NOT EXISTS `order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- Структура таблицы `order_option`
--

CREATE TABLE IF NOT EXISTS `order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Дамп данных таблицы `order_option`
--

INSERT INTO `order_option` (`order_option_id`, `order_id`, `order_product_id`, `product_option_id`, `product_option_value_id`, `name`, `value`, `type`) VALUES
(8, 5, 5, 227, 17, 'Размер', '42', 'select'),
(9, 7, 7, 235, 46, 'Размер', '44', 'select'),
(10, 8, 8, 235, 46, 'Размер', '44', 'select');

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE IF NOT EXISTS `order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(5, 5, 50, 'Софья', 'Платье', 1, '21.5000', '21.5000', '0.0000', 0),
(6, 6, 51, 'Полония', 'Платье', 1, '15.0000', '15.0000', '0.0000', 0),
(7, 7, 58, 'Герда', 'Платье', 1, '21.0000', '21.0000', '0.0000', 0),
(8, 8, 58, 'Герда', 'Платье', 1, '21.0000', '21.0000', '0.0000', 0),
(9, 8, 53, 'Резиночка', 'Резинка', 1, '0.0100', '0.0100', '0.0000', 0),
(10, 9, 53, 'Резиночка', 'Резинка', 1, '0.0100', '0.0100', '0.0000', 0),
(11, 10, 51, 'Полония', 'Платье', 2, '15.0000', '30.0000', '0.0000', 0),
(41, 40, 73, 'Party Dress', 'Платье', 2, '20.0000', '40.0000', '0.0000', 0),
(21, 20, 73, 'Party Dress', 'Платье', 1, '20.0000', '20.0000', '0.0000', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `order_status`
--

CREATE TABLE IF NOT EXISTS `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `order_status`
--

INSERT INTO `order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'В обработке'),
(3, 1, 'Доставлено'),
(7, 1, 'Отменено'),
(5, 1, 'Сделка завершена'),
(8, 1, 'Возврат'),
(9, 1, 'Отмена и аннулирование'),
(10, 1, 'Неудавшийся'),
(11, 1, 'Возмещенный'),
(12, 1, 'Полностью измененный'),
(13, 1, 'Полный возврат'),
(1, 1, 'Ожидание'),
(16, 1, 'Утративший силу'),
(15, 1, 'Обработанный'),
(14, 1, 'Истекший');

-- --------------------------------------------------------

--
-- Структура таблицы `order_total`
--

CREATE TABLE IF NOT EXISTS `order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=113 ;

--
-- Дамп данных таблицы `order_total`
--

INSERT INTO `order_total` (`order_total_id`, `order_id`, `code`, `title`, `text`, `value`, `sort_order`) VALUES
(9, 5, 'sub_total', 'Сумма', '215000 р.', '21.5000', 1),
(10, 5, 'total', 'Итого', '215000 р.', '21.5000', 9),
(11, 6, 'sub_total', 'Сумма', '150000 р.', '15.0000', 1),
(12, 6, 'total', 'Итого', '150000 р.', '15.0000', 9),
(13, 7, 'sub_total', 'Сумма', '210000 р.', '21.0000', 1),
(14, 7, 'total', 'Итого', '210000 р.', '21.0000', 9),
(15, 8, 'sub_total', 'Сумма', '210100 р.', '21.0100', 1),
(16, 8, 'total', 'Итого', '210100 р.', '21.0100', 9),
(17, 9, 'sub_total', 'Сумма', '100 р.', '0.0100', 1),
(18, 9, 'total', 'Итого', '100 р.', '0.0100', 9),
(19, 10, 'sub_total', 'Сумма', '300000 р.', '30.0000', 1),
(20, 10, 'total', 'Итого', '300000 р.', '30.0000', 9),
(79, 40, 'sub_total', 'Сумма', '400000 р.', '40.0000', 1),
(80, 40, 'total', 'Итого', '400000 р.', '40.0000', 9),
(39, 20, 'sub_total', 'Сумма', '200000 р.', '20.0000', 1),
(40, 20, 'total', 'Итого', '200000 р.', '20.0000', 9);

-- --------------------------------------------------------

--
-- Структура таблицы `order_voucher`
--

CREATE TABLE IF NOT EXISTS `order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `parsemx_donors`
--

CREATE TABLE IF NOT EXISTS `parsemx_donors` (
  `donor_id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `autorun` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `missing` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `active_tasks` int(11) DEFAULT '0',
  `done_tasks` int(11) DEFAULT '0',
  `total_entities` int(11) DEFAULT '0',
  `total_files` int(11) DEFAULT '0',
  `check_url` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `proxy` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`donor_id`),
  KEY `state` (`state`),
  KEY `host` (`host`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Структура таблицы `parsemx_entities`
--

CREATE TABLE IF NOT EXISTS `parsemx_entities` (
  `entity_id` int(11) NOT NULL AUTO_INCREMENT,
  `platform_id` int(11) DEFAULT NULL,
  `ins_id` int(11) DEFAULT NULL,
  `donor_id` int(11) DEFAULT NULL,
  `url` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `entity` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `ourl` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `platform_id` (`platform_id`),
  KEY `ins_id` (`ins_id`),
  KEY `url` (`url`(255)),
  KEY `donor_id` (`donor_id`),
  KEY `status` (`status`),
  KEY `entity` (`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `parsemx_info`
--

CREATE TABLE IF NOT EXISTS `parsemx_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) DEFAULT NULL,
  `tag` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `info` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`info_id`),
  KEY `tag` (`tag`),
  KEY `donor_id` (`donor_id`),
  KEY `id` (`id`),
  KEY `info` (`info`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `parsemx_ins`
--

CREATE TABLE IF NOT EXISTS `parsemx_ins` (
  `ins_id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(6000) COLLATE utf8_bin DEFAULT NULL,
  `categories` varchar(128) COLLATE utf8_bin DEFAULT '',
  `manufacturer` int(11) DEFAULT '0',
  `price` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ins_id`),
  KEY `donor_id` (`donor_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Структура таблицы `parsemx_links`
--

CREATE TABLE IF NOT EXISTS `parsemx_links` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) DEFAULT NULL,
  `ins_id` int(11) DEFAULT NULL,
  `url` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `ins_id` (`ins_id`),
  KEY `donor_id` (`donor_id`),
  KEY `url` (`url`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `parsemx_tasks`
--

CREATE TABLE IF NOT EXISTS `parsemx_tasks` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `ins_id` int(11) DEFAULT NULL,
  `donor_id` int(11) DEFAULT NULL,
  `z_order` int(11) DEFAULT '0',
  `url` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `entity` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `info` int(11) DEFAULT NULL,
  `info2` int(11) DEFAULT NULL,
  `info3` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `ins_id` (`ins_id`),
  KEY `donor_id` (`donor_id`),
  KEY `url` (`url`(255)),
  KEY `entity` (`entity`),
  KEY `z_order` (`z_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `parsemx_translate`
--

CREATE TABLE IF NOT EXISTS `parsemx_translate` (
  `translate_id` int(11) NOT NULL AUTO_INCREMENT,
  `text_id` int(11) DEFAULT NULL,
  `lang` varchar(3) DEFAULT NULL,
  `text` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`translate_id`),
  KEY `text_id` (`text_id`),
  KEY `lang` (`lang`),
  KEY `text` (`text`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121 ;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `date_added`, `date_modified`, `viewed`) VALUES
(81, 'Сережки', '', '', '', '', '', '', 'Ali Mother''s Day Gift ! Fashion Elegant Hot Sale Black Leaf Shape Rhinestone Gold Color Alloy Drop Earrings', 1, 8, 'data/products/3_aliexpress/5_jewerly/7_catkins/1.jpg', 0, 1, '6.0000', 0, 0, '2014-02-14', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-15 14:01:01', '0000-00-00 00:00:00', 9),
(80, 'Клатч', '', '', '', '', '', '', 'Womens Girls Envelope PU Leather Clutch HandBag Purse Wallet Totes Card Case Bag', 1, 8, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/1.jpg', 0, 1, '9.0000', 0, 0, '2014-02-09', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-10 13:53:31', '2014-02-10 14:12:00', 41),
(78, 'Платье', '', '', '', '', '', '', 'http://www.ebay.com/itm/Women-Sexy-Party-Summer-Short-sleeve-Elasticized-Waist-Mini-Chiffon-Dress-ER99/111177122498?rt=nc', 1, 8, 'data/products/2_ebay/1_women/101_dress/1/4.JPG', 0, 1, '18.0000', 0, 0, '2014-02-09', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-10 04:18:07', '2014-02-10 04:44:20', 28),
(72, 'Платье', '', '', '', '', '', '', 'http://www.ebay.com/itm/Women-Sexy-Elegant-Slim-Long-lace-Gown-Evening-Cocktail-Casual-Party-Dress/301065764774?_trksid=p2050601', 1, 8, 'data/products/2_ebay/1_women/101_dress/1/1.JPG', 0, 1, '40.0000', 0, 0, '2014-02-09', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-10 00:07:16', '2014-02-10 04:45:29', 33),
(73, 'Платье', '', '', '', '', '', '', '', 17, 7, 'data/products/2_ebay/1_women/101_dress/1/2.jpg', 0, 1, '20.0000', 0, 0, '2014-02-09', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-10 00:28:22', '2014-02-21 01:36:00', 89),
(74, 'Блуза', '', '', '', '', '', '', 'http://www.ebay.com/itm/New-Korean-Womens-Lace-Long-Sleeve-Chiffon-Shirt-Blouse-Tops-S-M-L-XL-/360791281149?pt=US_CSA_WC_Shirts_', 1, 8, 'data/products/2_ebay/1_women/103_jackets/1/2.jpg', 0, 1, '25.0000', 0, 0, '2014-02-09', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-10 02:54:32', '2014-02-10 04:45:50', 22),
(75, 'Блуза', '', '', '', '', '', '', 'http://www.ebay.com/itm/New-Fashion-Women-s-Stars-Leopard-Printed-Shirt-Chiffon-Long-sleeved-Blouse-Top-/400493187159?pt=US_CSA_', 1, 8, 'data/products/2_ebay/1_women/103_jackets/1/4.jpg', 0, 1, '18.0000', 0, 0, '2014-02-09', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-10 03:21:40', '2014-02-10 13:35:50', 32),
(76, 'Блуза', '', '', '', '', '', '', 'http://www.ebay.com/itm/New-Sexy-Women-Rivet-Chiffon-Sleeveless-T-Shirt-Blouse-Stand-Collar-Vest-Tops-/271226118381?pt=US_CSA_WC', 1, 8, 'data/products/2_ebay/1_women/103_jackets/1/6.jpg', 0, 1, '20.0000', 0, 0, '2014-02-09', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-10 03:33:22', '2014-02-10 04:43:54', 19),
(77, 'Купальник', '', '', '', '', '', '', 'http://www.ebay.com/itm/Sexy-Bowknot-Lingerie-Bikini-Set-Halter-Women-Swimsuit-Swimwear-Blue-Pink-ER99-/121180157099?pt=US_CSA_W', 1, 5, 'data/products/2_ebay/1_women/104_nizhnee_bele/1/1.jpg', 0, 1, '11.0000', 0, 0, '2014-02-09', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-10 04:14:34', '2014-02-24 00:52:12', 38),
(82, 'Клатч', '', '', '', '', '', '', 'Ali 2013 new fashion wallet for the womens purse wallet long section style PU leather wallet card bag', 1, 8, 'data/products/3_aliexpress/3_bag/7_clutch/1.jpg', 0, 1, '23.0000', 0, 0, '2014-02-15', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-16 04:35:09', '0000-00-00 00:00:00', 17),
(83, 'Клатч', '', '', '', '', '', '', 'Womens Lady Handbag Satchel Messenger Cross Body Purse Totes Bags Shoulder #5350', 1, 8, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Womens Lady Handbag Satchel Messenger Cross Body Purse Totes Bags Shoulder 5350.JPG', 0, 1, '13.0000', 0, 0, '2014-02-15', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-16 06:13:22', '2014-02-16 06:13:50', 17),
(84, 'Клатч', '', '', '', '', '', '', 'Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag', 1, 8, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 5$.JPG', 0, 1, '12.0000', 0, 0, '2014-02-15', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-16 06:49:49', '0000-00-00 00:00:00', 18),
(85, 'Сумка', '', '', '', '', '', '', 'Sweet Ladies Candy Color Bowknot Shoulder Bag Cross-body Handbag PU Leather Hot', 1, 8, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/Sweet Ladies Candy Color Bowknot Shoulder Bag Cross-body Handbag PU Leather Hot 23$ 1.jpg', 0, 1, '47.0000', 0, 0, '2014-02-15', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-16 07:13:40', '2014-02-16 07:49:31', 29),
(86, 'Сумка', '', '', '', '', '', '', 'Women Bow-knot Handbag Satchel Bag Tote Cross Body Shoulder Bags Candy Colors', 1, 8, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/sl00382.jpg', 0, 1, '34.0000', 0, 0, '2014-02-15', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-16 08:31:34', '0000-00-00 00:00:00', 12),
(87, 'Сумка', '', '', '', '', '', '', 'Fashionable Bowknot Woman Lady handbag PU Shoulderbag Cross Body Color', 1, 8, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/q4.jpg', 0, 1, '45.0000', 0, 0, '2014-02-16', '0.00000000', 1, '29.00000000', '8.00000000', '19.00000000', 1, 1, 1, 1, 1, '2014-02-17 02:07:16', '0000-00-00 00:00:00', 10),
(88, 'Сумка', '', '', '', '', '', '', 'Women''s Butterfly Vintage PU Leather Handbag Shoulder Tote Bow-Knot New', 1, 8, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/b7.jpg', 0, 1, '47.0000', 0, 0, '2014-02-16', '700.00000000', 1, '32.00000000', '12.00000000', '24.00000000', 1, 0, 1, 1, 1, '2014-02-17 02:23:58', '2014-02-17 03:30:48', 21),
(89, 'Сумка', '', '', '', '', '', '', 'Fashion Bowknot Korea Style Womens PU Leather Handbag Tote Shoulder Bag ', 1, 8, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a4.JPG', 0, 1, '46.0000', 0, 0, '2014-02-16', '0.00000000', 1, '29.00000000', '9.00000000', '23.00000000', 1, 1, 1, 1, 1, '2014-02-17 03:08:01', '2014-02-17 03:30:29', 11),
(90, 'Сумка', '', '', '', '', '', '', 'NEW Fashion Women Bowknot Shoulder Messenger Bag Satchel Handbag Purses Lock Fa', 1, 8, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a12.jpg', 0, 1, '45.0000', 0, 0, '2014-02-16', '0.00000000', 1, '29.00000000', '8.00000000', '19.00000000', 1, 1, 1, 1, 1, '2014-02-17 03:29:50', '0000-00-00 00:00:00', 9),
(91, 'Сумка', '', '', '', '', '', '', 'Lady Fashion Retro Messenger PU Leather Bags Handbag Shoulder Bag Women Totes', 1, 8, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/e3.JPG', 0, 1, '47.0000', 0, 0, '2014-02-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-17 03:46:49', '0000-00-00 00:00:00', 11),
(92, 'Сумка', '', '', '', '', '', '', 'Women Faux Leather Drawstring Hobo Crossbody Messenger Shoulder Bag Purse', 1, 8, 'data/products/2_ebay/3_bag/2_shoulder bag/2014_02_19_1/z1.jpg', 0, 1, '31.0000', 0, 0, '2014-02-18', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-19 01:19:44', '2014-02-19 01:20:52', 11),
(93, 'Сумка', '', '', '', '', '', '', 'Korean Women PU Leather Hobo Tote Shoulder Bag CrossBody Messenger Handbag Purse', 1, 8, 'data/products/2_ebay/3_bag/5_hobo_bag/2014_02_19_1/z5.jpg', 0, 1, '36.0000', 0, 0, '2014-02-18', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-19 02:14:30', '2014-02-19 08:27:49', 11),
(94, 'Клатч', '', '', '', '', '', '', 'Women Fashion mini Shoulder Bag Quilting Chain Cross Body Korean Ladies Handbag', 1, 8, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/d2.jpg', 0, 1, '36.0000', 0, 0, '2014-02-18', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-19 09:00:21', '0000-00-00 00:00:00', 15),
(97, 'Мини сумочка', '', '', '', '', '', '', 'NEW Fashion Paillette Mine Lovely Mini Handbag Shoulders Package Womens Purses ', 1, 8, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/a6.jpg', 0, 1, '19.0000', 0, 0, '2014-02-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-21 07:58:34', '2014-02-21 08:07:06', 16),
(96, 'Клатч', '', '', '', '', '', '', 'NEW Fashion Purses Women Candy Color Faux Leather Mini Crossbody Shoulder Bag S', 1, 8, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/c1.JPG', 0, 1, '34.0000', 0, 0, '2014-02-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-20 01:34:38', '2014-02-20 11:51:09', 20),
(98, 'Мини сумочка', '', '', '', '', '', '', 'NEW Fashion Paillette Mine Lovely Mini Handbag Shoulders Package Womens Purses ', 1, 8, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/a7.jpg', 0, 1, '19.0000', 0, 0, '2014-02-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-21 08:14:05', '0000-00-00 00:00:00', 9),
(99, 'Мини сумочка', '', '', '', '', '', '', 'NEW Fashion Paillette Mine Lovely Mini Handbag Shoulders Package Womens Purses ', 1, 8, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/aa1.jpg', 0, 1, '19.0000', 0, 0, '2014-02-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-21 08:14:16', '2014-02-21 08:16:51', 11),
(100, 'Блуза', '', '', '', '', '', '', '', 1, 8, 'data/products/2_ebay/1_women/103_jackets/1/11.jpg', 0, 1, '19.0000', 0, 0, '2014-02-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-22 08:36:35', '2014-02-23 03:16:11', 12),
(101, 'Браслет', '', '', '', '', '', '', 'black multilayer bracelet', 1, 8, 'data/products/2_ebay/4_bijouterie/1_braslety/2014_02_23_1/1.jpg', 0, 1, '6.0000', 0, 0, '2014-02-22', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-23 03:31:52', '2014-02-23 03:32:47', 10),
(103, 'Организатор', '', '', '', '', '', '', '', 1, 8, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z1.JPG', 0, 1, '11.0000', 0, 0, '2014-02-26', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-27 07:38:13', '0000-00-00 00:00:00', 4),
(104, 'Багажная сумка', '', '', '', '', '', '', 'New Mens Womens Portable Folding Business Travel Tote Shoulder Zipper Hand Bag', 1, 8, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/x1.jpg', 0, 1, '21.0000', 0, 0, '2014-02-26', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-27 07:53:02', '2014-02-27 07:53:35', 3),
(105, 'Сумка-портфель', '', '', '', '', '', '', '3 Women/Lady Travel Easy to Carry 3-Way Bag Backpack Shoulder Bag Crossbody', 1, 8, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/m2.jpg', 0, 1, '22.0000', 0, 0, '2014-02-26', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-02-27 08:16:20', '0000-00-00 00:00:00', 4),
(106, 'Рюкзак', '', '', '', '', '', '', 'Womens Travel Bags Canvas Backpack Book Casual Schoolbag Rucksack Satchel 2Color', 1, 8, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/z2.jpg', 0, 1, '23.0000', 0, 0, '2014-02-26', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-27 08:27:06', '0000-00-00 00:00:00', 9),
(107, 'Рюкзак', '', '', '', '', '', '', 'Popular Women Cute Panda Face Casual Canvas Backpack Handbag Travel Bag', 1, 8, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/w3.jpg', 0, 1, '23.0000', 0, 0, '2014-02-26', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-27 08:38:27', '0000-00-00 00:00:00', 9),
(108, 'Рюкзак', '', '', '', '', '', '', 'Women''s Mustache Backpack Travelling Bag Canvas School Book Rucksack 7 Colors', 1, 8, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/x1.JPG', 0, 1, '23.0000', 0, 0, '2014-02-26', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-27 08:56:10', '0000-00-00 00:00:00', 3),
(109, 'Портфель', '', '', '', '', '', '', 'Fashion Women Backpack Sweet Canvas Travel Bookbag School Bags Leisure Rucksack', 1, 8, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/m1.JPG', 0, 1, '24.0000', 0, 0, '2014-02-26', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-27 09:12:29', '2014-02-27 14:19:28', 11),
(110, 'Рюкзак', '', '', '', '', '', '', 'Women''s Bookbag TRAVEL Rucksack School Bag Satchel Canvas Backpack 6 Colors NEW', 1, 8, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/n1.JPG', 0, 1, '25.0000', 0, 0, '2014-02-26', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-27 14:35:40', '2014-02-27 15:06:20', 12),
(111, 'Рюкзак', '', '', '', '', '', '', 'Hot Women''s Duck 3-D Kids Teenage SchoolBag Canvas Backpack Travel Satchel Bag', 1, 8, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/e7.jpg', 0, 1, '31.0000', 0, 0, '2014-02-27', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-27 15:44:07', '0000-00-00 00:00:00', 6),
(112, 'Рюкзак', '', '', '', '', '', '', 'Pinky Color Women Backpack Bags Campus Student Book Travel Bags 9 Colors US-WB', 1, 8, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/d6.jpg', 0, 1, '29.0000', 0, 0, '2014-02-27', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-02-27 15:56:05', '2014-02-27 16:00:31', 9),
(115, 'Портфель', '', '', '', '', '', '', 'Girls Women Fashion Canvas Mustache Travel Schoolbag Bookbag Backpack Campus Bag', 1, 8, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/x1.JPG', 0, 1, '34.0000', 0, 0, '2014-02-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-03-01 13:59:16', '0000-00-00 00:00:00', 10),
(114, 'Рюкзак', '', '', '', '', '', '', 'Girls Canvas Backpack Rucksack Ladies School Shoulder Bag Shopper Hiking Bookbag', 1, 8, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/z2.jpg', 0, 1, '23.0000', 0, 0, '2014-02-28', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-03-01 10:06:05', '0000-00-00 00:00:00', 4),
(116, 'Рюкзак', '', '', '', '', '', '', 'Fashion Women Lady Men Handbag Bookbag fox Backpack Campus School Travel Bag', 1, 8, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/w3.jpg', 0, 1, '35.9000', 0, 0, '2014-03-01', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-03-01 16:19:08', '0000-00-00 00:00:00', 6),
(117, 'Платья', '', '', '', '', '', '', 'Fashion Women Long Sleeve Lace Floral Chiffon BodyCon Casual Party Evening Dress', 1, 8, 'data/products/2_e/1_women/8_dress/2014_03_04_1/z2.JPG', 0, 1, '25.0000', 0, 0, '2014-03-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-03-04 06:17:34', '0000-00-00 00:00:00', 5),
(118, 'Платье', '', '', '', '', '', '', 'Womens Ladies Chiffon Ruffle Neck Sleeveless Evening Ball Gown Long Maxi Dress', 1, 8, 'data/products/2_e/1_women/8_dress/2014_03_04_1/x7.JPG', 0, 1, '34.0000', 0, 0, '2014-03-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, '2014-03-04 07:25:26', '0000-00-00 00:00:00', 1),
(119, 'Платье', '', '', '', '', '', '', 'New Retro Flower Print Sexy Womens Sleeveless Slim Chiffon Dress Mini Dress B94', 1, 8, 'data/products/2_e/1_women/8_dress/2014_03_04_1/w3.JPG', 0, 1, '19.0000', 0, 0, '2014-03-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-03-04 08:07:39', '0000-00-00 00:00:00', 1),
(120, 'Платье', '', '', '', '', '', '', 'Women''s Sexy Lace Slim Bodycon Mini Dress Backless Party Cocktail Evening Dress', 1, 8, 'data/products/2_e/1_women/8_dress/2014_03_04_1/q1.jpg', 0, 1, '28.0000', 0, 0, '2014-03-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-03-04 08:54:31', '0000-00-00 00:00:00', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `product_attribute`
--

CREATE TABLE IF NOT EXISTS `product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `product_description`
--

CREATE TABLE IF NOT EXISTS `product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_description`
--

INSERT INTO `product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `seo_title`, `seo_h1`, `tag`) VALUES
(108, 1, 'Портфель с усами', '&lt;p&gt;Размер: 43 х 31 см (В * Ш)&lt;/p&gt;\r\n', '', '', 'Портфель с усами', '', ''),
(109, 1, 'Портфель с двумя полосами', '&lt;p&gt;Размер: 31 см х 12 см х 43 см&lt;/p&gt;\r\n', '', '', 'Портфель с двумя полосами', '', ''),
(99, 1, 'Мини сумочка ', '&lt;p&gt;Длина 15 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 12 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 11 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', 'Мини сумочка ', '', ''),
(100, 1, 'Vintage Long Sleeve', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.069999694824219px;&quot;&gt;Размер S:&amp;nbsp;Бюст 92 см |&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11.111111640930176px; line-height: 15.069999694824219px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11.111111640930176px; line-height: 15.069999694824219px;&quot;&gt;Плечи 37&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11.111111640930176px; line-height: 15.069999694824219px;&quot;&gt;&amp;nbsp;см |&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.069999694824219px;&quot;&gt;&amp;nbsp;Рукава 57 см | Длинна 63&lt;/span&gt;&lt;/p&gt;\r\n', '', '', '', '', ''),
(101, 1, 'Multilayer bracelet', '&lt;p&gt;Длинна браслета 18-26 См&lt;/p&gt;\r\n', '', '', '', '', ''),
(103, 1, 'Сумка организатор', '&lt;p&gt;Размер: 30 х 18,5 х 8,5 (см)&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: нейлон&lt;/p&gt;\r\n', '', '', 'Сумка организатор', '', ''),
(104, 1, 'Сумка для чемодана', '&lt;p&gt;Размер: 40 см х 16 см х 28 см&lt;/p&gt;\r\n\r\n&lt;p&gt;В сложенном состоянии: 20 см х 14 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: полиэстер&lt;/p&gt;\r\n', '', '', 'Сумка для чемодана', '', ''),
(105, 1, 'Сумка-портфель', '&lt;p&gt;Размер: (Д х Ш) 54 * 27см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: полиэстер&lt;/p&gt;\r\n', '', '', 'Сумка-портфель', '', ''),
(106, 1, 'Мини портфель', '&lt;p&gt;Размер: 34 * 35см (В * Ш)&lt;/p&gt;\r\n', '', '', 'Мини портфель', '', ''),
(107, 1, 'Портфель панда', '&lt;p&gt;Длина 37см&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 47см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: ткань&lt;/p&gt;\r\n', '', '', 'Портфель панда', '', ''),
(85, 1, 'Женская сумка с бантиком', '&lt;p&gt;Ширина 29 м&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 22 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 12 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Длина ремешка 122 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', 'Женская сумка с бантиком', '', ''),
(86, 1, 'Сумка с бантом', '&lt;p&gt;Ширина 24 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Выстота 19 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 10 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусстеенная кожа.&lt;/p&gt;\r\n', '', '', 'Сумка с бантом', '', ''),
(87, 1, 'Сумочка с бантиком', '&lt;p&gt;Длина: 29см&lt;/p&gt;\r\n\r\n&lt;p&gt;Нижняя ширина: 8 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота: 19,5 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', 'Сумочка с бантиком', '', ''),
(88, 1, 'Стильная сумка с бантиком', '&lt;p&gt;Длина 32 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 24 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 12 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Длина ремешка 124 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', 'Стильная сумка с бантиком', '', ''),
(89, 1, 'Сумка с бантиком', '&lt;p&gt;Длина 29&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 23&lt;/p&gt;\r\n\r\n&lt;p&gt;Ширина 9&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', '', '', ''),
(90, 1, 'Сумка с бантиком, без замков', '&lt;p&gt;Ширина 29 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 19 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 8 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', 'Сумка с бантиком, без замков', '', ''),
(91, 1, 'Ретро сумка', '&lt;p&gt;Ширина 35&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 22&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 17&lt;/p&gt;\r\n\r\n&lt;p&gt;Длина ремешка 125 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', 'Ретро сумка', '', ''),
(92, 1, 'Сумка-мешок', '&lt;p&gt;Высота 28 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Ширина 11 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 8 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', 'Сумка-мешок', '', ''),
(93, 1, 'Сумка с внутренними ручками', '&lt;p&gt;Длина 31 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 33 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 11 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', 'Сумка с внутренними ручками', '', ''),
(94, 1, 'Клатч с универсальным ремешком', '&lt;p&gt;Длина 26 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 15 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 8 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', 'Клатч с универсальным ремешком', '', ''),
(97, 1, 'Мини сумочка с блестками', '&lt;p&gt;Ширина 15 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 12 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 11 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', 'Мини сумочка с блестками', '', ''),
(96, 1, 'Клатч-сумочка', '&lt;p&gt;Длина 22 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 18 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 7,5 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n\r\n&lt;p&gt;Длина ремешка: 130см&lt;/p&gt;\r\n', '', '', 'Клатч-сумочка', '', 'Клатч, сумка'),
(98, 1, 'Мини сумочка ', '&lt;p&gt;Длина 15 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 12 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 11 см&lt;/p&gt;\r\n', '', '', 'Мини сумочка ', '', ''),
(72, 1, 'Elegant Slim', '', '', '', '', '', ''),
(80, 1, 'PU Leather Clutch HandBag', '', '', '', '', '', ''),
(73, 1, 'Party Dress', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.069999694824219px;&quot;&gt;Бюст 85-95&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.069999694824219px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.069999694824219px;&quot;&gt;Талия 70 - 75&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.069999694824219px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.069999694824219px;&quot;&gt;Бедра 80 - 100&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.069999694824219px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.069999694824219px;&quot;&gt;Длина 81&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.069999694824219px;&quot; /&gt;\r\n&lt;span style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial, verdana, sans-serif, ''Lucida Sans''; font-size: 11px; line-height: 15.069999694824219px;&quot;&gt;Рукава 58&amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n', '', '', '', '', ''),
(74, 1, 'Chiffon Blouse', '', '', '', '', '', ''),
(75, 1, 'Stars Printed Blouse', '', '', '', '', '', ''),
(76, 1, 'T-Shirt Blouse', '', '', '', '', '', ''),
(77, 1, 'Bikini Blue &amp; Pink', '', '', '', '', '', ''),
(78, 1, 'Summer Short-sleeve Dress', '', '', '', '', '', ''),
(81, 1, 'Сережки черный лист', '', '', '', '', '', ''),
(82, 1, 'Женский кошелек-клатч', '&lt;p&gt;Длина 19&amp;nbsp;см&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 10 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 2,5 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', '', 'Женский кошелек-клатч', 'Клатч, сумка'),
(83, 1, 'Женский клатч-мешочек', '&lt;p&gt;Длина 19 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 13 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', 'Женский клатч-мешочек', '', ''),
(84, 1, 'Женский клатч на цепочке', '&lt;p&gt;Ширина 29 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Высота 18 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 2 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Длина цепочки 100 см&lt;/p&gt;\r\n', '', '', 'Женский клатч на цепочке', '', ''),
(110, 1, 'Женский рюкзак', '&lt;p&gt;Высота 44 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Ширина 31 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 12 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: ткань&lt;/p&gt;\r\n\r\n&lt;p&gt;Комбинации цветов(Рюкзак-внешний кормашек):&lt;/p&gt;\r\n\r\n&lt;p&gt;Кораловый - Желтый&lt;/p&gt;\r\n\r\n&lt;p&gt;Кофейный - Зеленый&lt;/p&gt;\r\n\r\n&lt;p&gt;Черный - Красный&lt;/p&gt;\r\n\r\n&lt;p&gt;Зеленый - Желтый&lt;/p&gt;\r\n\r\n&lt;p&gt;Темно-зеленый - Желтый&lt;/p&gt;\r\n\r\n&lt;p&gt;Черно-зеленый - Кофейный&lt;/p&gt;\r\n', '', '', 'Женский рюкзак', '', ''),
(111, 1, 'Рюкзак-3D Утенок', '&lt;p&gt;Высота 37 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Ширина: 28 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 12 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: ткань&lt;/p&gt;\r\n', '', '', 'Рюкзак-3D Утенок', '', ''),
(112, 1, 'Рюкзаки разных расцветок', '&lt;p&gt;Высота 39 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Ширина 26 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 14 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: ткань&lt;/p&gt;\r\n', '', '', 'Рюкзаки разных расцветок', '', ''),
(114, 1, 'Рюкзак с пуговицами', 'Высота: 37 см\r\nШирина: 22 см\r\nТолщина: 14 см', '', '', 'Рюкзак с пуговицами', '', ''),
(115, 1, 'Портфель с очками и усами', '&lt;p&gt;Высота: 40 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Ширина: 27 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина: 12 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Длина ремня: 40 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Ширина ремня: 4,5 см&lt;/p&gt;\r\n', '', '', 'Портфель с очками и усами', '', ''),
(116, 1, 'Рюкзак-лиса', '&lt;p&gt;Высота 42 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Ширина 17 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Толщина 12 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&lt;/p&gt;\r\n', '', '', 'Рюкзак-лиса', '', ''),
(117, 1, 'Платье с длинным рукавом и кружевом', '&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width: 500px;&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Размер:&lt;/td&gt;\r\n			&lt;td&gt;S&lt;/td&gt;\r\n			&lt;td&gt;M&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Длина:&lt;/td&gt;\r\n			&lt;td&gt;75 см&lt;/td&gt;\r\n			&lt;td&gt;76 см&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Бюст:&lt;/td&gt;\r\n			&lt;td&gt;88 см&lt;/td&gt;\r\n			&lt;td&gt;94 см&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Талия:&lt;/td&gt;\r\n			&lt;td&gt;74 см&lt;/td&gt;\r\n			&lt;td&gt;78 см&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Рукав:&lt;/td&gt;\r\n			&lt;td&gt;56 см&lt;/td&gt;\r\n			&lt;td&gt;57см&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Плечи:&lt;/td&gt;\r\n			&lt;td&gt;34 см&lt;/td&gt;\r\n			&lt;td&gt;35 см&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;Материалы: шифон + кружево;&lt;/p&gt;\r\n', '', '', 'Платье с длинным рукавом и кружевом', '', ''),
(118, 1, 'Длинное платье', '&lt;p&gt;Бюст: 113 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Длина: 152 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материалы: шифон&lt;/p&gt;\r\n', '', '', 'Длинное платье', '', ''),
(119, 1, 'Красочное платье', '&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width: 500px;&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;Размер&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;S&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;M&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;L&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;Плечи&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;30 см&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;31см&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;32 см&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;Бюст&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Arial; line-height: normal;&quot;&gt;76-92 см&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Arial; line-height: normal;&quot;&gt;80-94 см&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Arial; line-height: normal;&quot;&gt;82-96 см&lt;/span&gt;&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;Бюдра&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;78 см&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;80 см&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;92 см&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;Длина&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;80 см&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;81 см&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;82 см&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;Материал: шифон&lt;/p&gt;\r\n', '', '', 'Красочное платье', '', ''),
(120, 1, 'Платье с кружевным вырезом', '&lt;table border=&quot;1&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width: 500px;&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Ра&lt;span style=&quot;font-size:14px;&quot;&gt;змер&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;S&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;M&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;L&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;XL&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;XXL&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;Бюст,см&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;78&amp;nbsp;&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;82&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;86&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;90&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;94&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;Талия,см&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;66&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;70&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;74&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;78&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;82&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;Бедра,см&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;82&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;86&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;90&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;94&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;98&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;Длина,см&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;93&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;94&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;95&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;96&lt;/span&gt;&lt;/td&gt;\r\n			&lt;td&gt;&lt;span style=&quot;font-size:14px;&quot;&gt;97&lt;/span&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Материал: 67% хлопок, 30% полиэстер, 3% эластан&lt;/span&gt;&lt;/p&gt;\r\n', '', '', 'Платье с кружевным вырезом', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `product_discount`
--

CREATE TABLE IF NOT EXISTS `product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=456 ;

-- --------------------------------------------------------

--
-- Структура таблицы `product_filter`
--

CREATE TABLE IF NOT EXISTS `product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3047 ;

--
-- Дамп данных таблицы `product_image`
--

INSERT INTO `product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2675, 81, 'data/products/3_aliexpress/5_jewerly/7_catkins/2.jpg', 0),
(2674, 81, 'data/products/3_aliexpress/5_jewerly/7_catkins/1.jpg', 0),
(2670, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/11.jpg', 0),
(2669, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/10.jpg', 0),
(2668, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/9.jpg', 0),
(2667, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/8.jpg', 0),
(2666, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/6.jpg', 0),
(2665, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/5.jpg', 0),
(2662, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/15.jpg', 0),
(2663, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/14.jpg', 0),
(2664, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/7.jpg', 0),
(2661, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/4.jpg', 0),
(2660, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/12.jpg', 0),
(2659, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/13.jpg', 0),
(2658, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/3.jpg', 0),
(2657, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/1.jpg', 0),
(2656, 80, 'data/products/2_ebay/3_bag/7_clutch/2014_02_10_1/2.jpg', 0),
(2887, 77, 'data/products/2_ebay/1_women/104_nizhnee_bele/1/1.jpg', 0),
(2609, 76, 'data/products/2_ebay/1_women/103_jackets/1/9.jpg', 0),
(2608, 76, 'data/products/2_ebay/1_women/103_jackets/1/8.jpg', 0),
(2607, 76, 'data/products/2_ebay/1_women/103_jackets/1/7.jpg', 0),
(2614, 72, 'data/products/2_ebay/1_women/101_dress/1/12.jpg', 0),
(2613, 72, 'data/products/2_ebay/1_women/101_dress/1/13.jpg', 0),
(2612, 72, 'data/products/2_ebay/1_women/101_dress/1/14.jpg', 0),
(2852, 73, 'data/products/2_ebay/1_women/101_dress/1/3.jpg', 0),
(2622, 75, 'data/products/2_ebay/1_women/103_jackets/1/5.jpg', 0),
(2618, 74, 'data/products/2_ebay/1_women/103_jackets/1/3.jpg', 0),
(2617, 74, 'data/products/2_ebay/1_women/103_jackets/1/1.JPG', 0),
(2676, 81, 'data/products/3_aliexpress/5_jewerly/7_catkins/3.jpg', 0),
(2677, 82, 'data/products/3_aliexpress/3_bag/7_clutch/10.jpg', 0),
(2678, 82, 'data/products/3_aliexpress/3_bag/7_clutch/3.jpg', 0),
(2679, 82, 'data/products/3_aliexpress/3_bag/7_clutch/3.jpg', 0),
(2680, 82, 'data/products/3_aliexpress/3_bag/7_clutch/4.jpg', 0),
(2681, 82, 'data/products/3_aliexpress/3_bag/7_clutch/11.jpg', 0),
(2682, 82, 'data/products/3_aliexpress/3_bag/7_clutch/5.jpg', 0),
(2683, 82, 'data/products/3_aliexpress/3_bag/7_clutch/6.jpg', 0),
(2684, 82, 'data/products/3_aliexpress/3_bag/7_clutch/7.jpg', 0),
(2685, 82, 'data/products/3_aliexpress/3_bag/7_clutch/8.jpg', 0),
(2686, 82, 'data/products/3_aliexpress/3_bag/7_clutch/9.jpg', 0),
(2700, 83, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Womens Lady Handbag Satchel Messenger Cross Body Purse Totes Bags Shoulder 5350 8.jpg', 0),
(2699, 83, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Womens Lady Handbag Satchel Messenger Cross Body Purse Totes Bags Shoulder 5350 6.jpg', 0),
(2698, 83, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Womens Lady Handbag Satchel Messenger Cross Body Purse Totes Bags Shoulder 2.jpg', 0),
(2697, 83, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Womens Lady Handbag Satchel Messenger Cross Body Purse Totes Bags Shoulder 5350 3.jpg', 0),
(2696, 83, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Womens Lady Handbag Satchel Messenger Cross Body Purse Totes Bags Shoulder 1.jpg', 0),
(2695, 83, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Womens Lady Handbag Satchel Messenger Cross Body Purse Totes Bags Shoulder 5350 4.jpg', 0),
(2694, 83, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Womens Lady Handbag Satchel Messenger Cross Body Purse Totes Bags Shoulder 5350.JPG', 0),
(2701, 84, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 1.jpg', 0),
(2702, 84, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 2.jpg', 0),
(2703, 84, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 3.jpg', 0),
(2704, 84, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 15.jpg', 0),
(2705, 84, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 13.jpg', 0),
(2706, 84, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 8.jpg', 0),
(2707, 84, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 12.jpg', 0),
(2708, 84, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 6.jpg', 0),
(2709, 84, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 5.jpg', 0),
(2710, 84, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 7.jpg', 0),
(2711, 84, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 10.jpg', 0),
(2712, 84, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 9.jpg', 0),
(2713, 84, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/Lady Women’s Envelope Baguette Clutch Chain Purse Wristlet Bag Shoulder Handbag 5$.JPG', 0),
(2737, 85, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/Ladies Candy Color Bowknot Shoulder Bag Cross-body Handbag  23$.JPG', 0),
(2735, 85, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/Sweet Ladies Candy Color Bowknot Shoulder Bag Cross-body Handbag PU Leather Hot 2.jpg', 0),
(2736, 85, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/Ladies Candy Color Bowknot Shoulder Bag Cross-body Handbag 23$.JPG', 0),
(2734, 85, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/Sweet Ladies Candy Color Bowknot Shoulder Bag Cross-body Handbag PU Leather Hot 23$ 1.jpg', 0),
(2733, 85, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/Sweet Ladies Candy Color Bowknot Shoulder Bag Cross-body Handbag PU Leather Hot 23$ 2.jpg', 0),
(2732, 85, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/Sweet Ladies Candy Color Bowknot Shoulder Bag Cross-body Handbag PU Leather Hot 23$ 5.jpg', 0),
(2730, 85, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/Sweet Ladies Candy Color Bowknot Shoulder Bag Cross-body Handbag PU Leather Hot 24$ 4.jpg', 0),
(2731, 85, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/Sweet Ladies Candy Color Bowknot Shoulder Bag Cross-body Handbag PU Leather Hot 23$.jpg', 0),
(2738, 86, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/sl00382.jpg', 0),
(2739, 86, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/Women Bow-knot Handbag Satchel Bag Tote Cross Body Shoulder Bags Candy Colors 18$.jpg', 0),
(2740, 86, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/Women Bow-knot Handbag Satchel Bag Tote Cross Body Shoulder Bags Candy Colors 18$ 2.JPG', 0),
(2741, 86, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/Women Bow-knot Handbag Satchel Bag Tote Cross Body Shoulder Bags Candy Colors 18$ 5.jpg', 0),
(2742, 86, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/Women Bow-knot Handbag Satchel Bag Tote Cross Body Shoulder Bags Candy Colors 18$ 3.JPG', 0),
(2743, 86, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/2.jpg', 0),
(2744, 86, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/3.jpg', 0),
(2745, 86, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/4.jpg', 0),
(2746, 86, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/5.jpg', 0),
(2747, 87, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/q4.jpg', 0),
(2748, 87, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/q3.jpg', 0),
(2749, 87, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/q5.jpg', 0),
(2750, 87, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/q6.jpg', 0),
(2751, 87, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/q1.jpg', 0),
(2752, 87, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/q2.jpg', 0),
(2785, 88, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/b1.jpg', 0),
(2784, 88, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/b2.jpg', 0),
(2783, 88, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/b3.jpg', 0),
(2782, 88, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/b4.jpg', 0),
(2781, 88, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/b5.jpg', 0),
(2780, 88, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/b6.jpg', 0),
(2779, 88, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/b7.jpg', 0),
(2778, 89, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a1.JPG', 0),
(2777, 89, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a6.JPG', 0),
(2776, 89, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a2.JPG', 0),
(2775, 89, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a3.JPG', 0),
(2774, 89, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a4.JPG', 0),
(2773, 89, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a5.JPG', 0),
(2766, 90, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a14.jpg', 0),
(2767, 90, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a8.jpg', 0),
(2768, 90, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a9.jpg', 0),
(2769, 90, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a10.jpg', 0),
(2770, 90, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a13.jpg', 0),
(2771, 90, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a12.jpg', 0),
(2772, 90, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/a7.JPG', 0),
(2786, 91, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/e4.jpg', 0),
(2787, 91, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/e5.jpg', 0),
(2788, 91, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/e6.jpg', 0),
(2789, 91, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/e1.jpg', 0),
(2790, 91, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/e2.jpg', 0),
(2791, 91, 'data/products/2_ebay/3_bag/1_classic_bag/2014_02_16_1/e3.JPG', 0),
(2799, 92, 'data/products/2_ebay/3_bag/2_shoulder bag/2014_02_19_1/z4.jpg', 0),
(2798, 92, 'data/products/2_ebay/3_bag/2_shoulder bag/2014_02_19_1/z3.jpg', 0),
(2797, 92, 'data/products/2_ebay/3_bag/2_shoulder bag/2014_02_19_1/z1.jpg', 0),
(2796, 92, 'data/products/2_ebay/3_bag/2_shoulder bag/2014_02_19_1/z2.jpg', 0),
(2813, 93, 'data/products/2_ebay/3_bag/5_hobo_bag/2014_02_19_1/z2.jpg', 0),
(2812, 93, 'data/products/2_ebay/3_bag/5_hobo_bag/2014_02_19_1/z8.jpg', 0),
(2811, 93, 'data/products/2_ebay/3_bag/5_hobo_bag/2014_02_19_1/z7.jpg', 0),
(2810, 93, 'data/products/2_ebay/3_bag/5_hobo_bag/2014_02_19_1/z6.jpg', 0),
(2809, 93, 'data/products/2_ebay/3_bag/5_hobo_bag/2014_02_19_1/z5.jpg', 0),
(2808, 93, 'data/products/2_ebay/3_bag/5_hobo_bag/2014_02_19_1/z4.jpg', 0),
(2807, 93, 'data/products/2_ebay/3_bag/5_hobo_bag/2014_02_19_1/z3.jpg', 0),
(2814, 94, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/d1.jpg', 0),
(2815, 94, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/d2.jpg', 0),
(2816, 94, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/d10.jpg', 0),
(2817, 94, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/d9.jpg', 0),
(2818, 94, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/d3.jpg', 0),
(2819, 94, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/d4.jpg', 0),
(2820, 94, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/d5.jpg', 0),
(2821, 94, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/d6.JPG', 0),
(2822, 94, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/d8.jpg', 0),
(2823, 94, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/d7.jpg', 0),
(2866, 97, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/aa2.jpg', 0),
(2865, 97, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/a1.JPG', 0),
(2864, 97, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/a5.jpg', 0),
(2863, 97, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/a4.jpg', 0),
(2851, 96, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/c8.jpg', 0),
(2850, 96, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/c7.jpg', 0),
(2849, 96, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/c11.jpg', 0),
(2848, 96, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/c10.jpg', 6),
(2847, 96, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/c1.JPG', 0),
(2846, 96, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/c6.jpg', 5),
(2845, 96, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/c5.jpg', 4),
(2844, 96, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/c4.jpg', 3),
(2843, 96, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/c3.jpg', 2),
(2842, 96, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/c2.jpg', 1),
(2862, 97, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/a6.jpg', 0),
(2861, 97, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/a2.jpg', 0),
(2860, 97, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/a3.jpg', 0),
(2867, 97, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/aa3.jpg', 0),
(2868, 98, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/a7.jpg', 0),
(2869, 98, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/a8.jpg', 0),
(2873, 99, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/aa1.jpg', 0),
(2872, 99, 'data/products/2_ebay/3_bag/7_clutch/2014_02_16_1/a9.jpg', 0),
(2879, 100, 'data/products/2_ebay/1_women/103_jackets/1/11.jpg', 0),
(2878, 100, 'data/products/2_ebay/1_women/103_jackets/1/12.jpg', 0),
(2883, 101, 'data/products/2_ebay/4_bijouterie/1_braslety/2014_02_23_1/2.jpg', 0),
(2882, 101, 'data/products/2_ebay/4_bijouterie/1_braslety/2014_02_23_1/1.jpg', 0),
(2886, 77, 'data/products/2_ebay/1_women/104_nizhnee_bele/1/2.jpg', 0),
(2888, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z1.JPG', 0),
(2889, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z04.jpg', 0),
(2890, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z01.JPG', 0),
(2891, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z03.jpg', 0),
(2892, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z2.JPG', 0),
(2893, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z02.jpg', 0),
(2894, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/zz1.JPG', 0),
(2895, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z3.JPG', 0),
(2896, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z4.JPG', 0),
(2897, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z5.JPG', 0),
(2898, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z6.JPG', 0),
(2899, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z7.JPG', 0),
(2900, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z8.JPG', 0),
(2901, 103, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/z9.JPG', 0),
(2915, 104, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/x7.jpg', 0),
(2914, 104, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/x6.jpg', 0),
(2913, 104, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/x5.jpg', 0),
(2912, 104, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/x4.jpg', 0),
(2911, 104, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/x3.jpg', 0),
(2910, 104, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/x2.jpg', 0),
(2909, 104, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/x1.jpg', 0),
(2916, 105, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/m2.jpg', 1),
(2917, 105, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/m3.jpg', 2),
(2918, 105, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/m4.jpg', 3),
(2919, 105, 'data/products/2_ebay/3_bag/6_traveling_bag/2014_02_27_1/m1.jpg', 4),
(2920, 106, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/z1.JPG', 0),
(2921, 106, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/z2.jpg', 0),
(2922, 106, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/z3.jpg', 0),
(2923, 106, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/z4.jpg', 0),
(2924, 106, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/z5.jpg', 0),
(2925, 106, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/z6.jpg', 0),
(2926, 107, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/w1.JPG', 0),
(2927, 107, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/w2.jpg', 0),
(2928, 107, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/w3.jpg', 0),
(2929, 107, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/w4.jpg', 0),
(2930, 108, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/x1.JPG', 0),
(2931, 108, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/x3.jpg', 0),
(2932, 108, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/x4.jpg', 0),
(2933, 108, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/xx1.jpg', 0),
(2934, 108, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/x6.jpg', 0),
(2935, 108, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/x7.jpg', 0),
(2936, 108, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/x8.jpg', 0),
(2937, 108, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/x9.jpg', 0),
(2938, 108, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/x5.jpg', 0),
(2939, 108, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/x2.jpg', 0),
(2969, 109, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/m1.JPG', 0),
(2968, 109, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/m2.jpg', 0),
(2967, 109, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/m3.jpg', 0),
(2966, 109, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/m4.jpg', 0),
(2965, 109, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/m5.jpg', 0),
(2964, 109, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/m6.jpg', 0),
(2963, 109, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/m7.jpg', 0),
(2962, 109, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/m8.jpg', 0),
(2961, 109, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/m9.jpg', 0),
(2960, 109, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/mm1.jpg', 0),
(2983, 110, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/r6.jpg', 5),
(2982, 110, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/r5.jpg', 2),
(2981, 110, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/r4.jpg', 7),
(2980, 110, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/r3.jpg', 3),
(2979, 110, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/r2.jpg', 6),
(2978, 110, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/r1.jpg', 4),
(2977, 110, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/n1.JPG', 1),
(2984, 111, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/e1.jpg', 0),
(2985, 111, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/e2.jpg', 0),
(2986, 111, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/e3.jpg', 0),
(2987, 111, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/e4.jpg', 0),
(2988, 111, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/e5.jpg', 0),
(2989, 111, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/e6.JPG', 0),
(2990, 111, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/e7.jpg', 0),
(3001, 112, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/dd3.jpg', 0),
(3000, 112, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/dd2.jpg', 0),
(2999, 112, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/dd1.jpg', 0),
(2998, 112, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/d6.jpg', 0),
(2997, 112, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/d1.JPG', 0),
(3002, 112, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/dd4.jpg', 0),
(3003, 112, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/dd5.jpg', 0),
(3004, 112, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/dd6.jpg', 0),
(3005, 112, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/dd7.jpg', 0),
(3006, 112, 'data/products/2_ebay/3_bag/3_briefcase/2014_02_27_1/dd8.jpg', 0),
(3007, 114, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/z6.jpg', 0),
(3008, 114, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/z5.jpg', 0),
(3009, 114, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/z4.jpg', 4),
(3010, 114, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/z3.jpg', 1),
(3011, 114, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/z2.jpg', 2),
(3012, 114, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/z1.jpg', 3),
(3013, 115, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/x1.JPG', 0),
(3014, 115, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/x2.jpg', 0),
(3015, 115, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/xx1.jpg', 0),
(3016, 115, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/xx22.jpg', 0),
(3017, 115, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/xx11.jpg', 0),
(3018, 115, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/xx33.jpg', 0),
(3019, 116, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/w1.jpg', 0),
(3020, 116, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/w2.jpg', 0),
(3021, 116, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/w3.jpg', 0),
(3022, 116, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/w4.jpg', 0),
(3023, 116, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/w6.jpg', 0),
(3024, 116, 'data/products/2_e/3_bag/3_briefcase/2014_03_01_1/w7.jpg', 0),
(3025, 117, 'data/products/2_e/1_women/8_dress/2014_03_04_1/z2.JPG', 0),
(3026, 117, 'data/products/2_e/1_women/8_dress/2014_03_04_1/z3.jpg', 0),
(3027, 117, 'data/products/2_e/1_women/8_dress/2014_03_04_1/z4.jpg', 0),
(3028, 117, 'data/products/2_e/1_women/8_dress/2014_03_04_1/z5.jpg', 0),
(3029, 117, 'data/products/2_e/1_women/8_dress/2014_03_04_1/z6.jpg', 0),
(3030, 118, 'data/products/2_e/1_women/8_dress/2014_03_04_1/x7.JPG', 0),
(3031, 118, 'data/products/2_e/1_women/8_dress/2014_03_04_1/x8.jpg', 0),
(3032, 118, 'data/products/2_e/1_women/8_dress/2014_03_04_1/x1.jpg', 0),
(3033, 118, 'data/products/2_e/1_women/8_dress/2014_03_04_1/x9.jpg', 0),
(3034, 118, 'data/products/2_e/1_women/8_dress/2014_03_04_1/x3.jpg', 0),
(3035, 118, 'data/products/2_e/1_women/8_dress/2014_03_04_1/x5.jpg', 0),
(3036, 118, 'data/products/2_e/1_women/8_dress/2014_03_04_1/x4.jpg', 0),
(3037, 118, 'data/products/2_e/1_women/8_dress/2014_03_04_1/x2.jpg', 0),
(3038, 118, 'data/products/2_e/1_women/8_dress/2014_03_04_1/x10.jpg', 0),
(3039, 119, 'data/products/2_e/1_women/8_dress/2014_03_04_1/w3.JPG', 0),
(3040, 119, 'data/products/2_e/1_women/8_dress/2014_03_04_1/w2.jpg', 0),
(3041, 119, 'data/products/2_e/1_women/8_dress/2014_03_04_1/w1.jpg', 0),
(3042, 120, 'data/products/2_e/1_women/8_dress/2014_03_04_1/q1.jpg', 0),
(3043, 120, 'data/products/2_e/1_women/8_dress/2014_03_04_1/q2.jpg', 0),
(3044, 120, 'data/products/2_e/1_women/8_dress/2014_03_04_1/q5.jpg', 0),
(3045, 120, 'data/products/2_e/1_women/8_dress/2014_03_04_1/q3.jpg', 0),
(3046, 120, 'data/products/2_e/1_women/8_dress/2014_03_04_1/q4.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `product_option`
--

CREATE TABLE IF NOT EXISTS `product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=291 ;

--
-- Дамп данных таблицы `product_option`
--

INSERT INTO `product_option` (`product_option_id`, `product_id`, `option_id`, `option_value`, `required`) VALUES
(251, 78, 11, '', 1),
(249, 77, 11, '', 1),
(246, 75, 11, '', 1),
(248, 76, 11, '', 1),
(247, 76, 13, '', 1),
(241, 72, 13, '', 1),
(242, 72, 11, '', 1),
(243, 74, 11, '', 1),
(252, 80, 13, '', 1),
(253, 81, 13, '', 1),
(254, 82, 13, '', 1),
(255, 83, 13, '', 1),
(256, 84, 13, '', 1),
(257, 85, 13, '', 1),
(258, 86, 13, '', 1),
(259, 87, 13, '', 1),
(260, 88, 13, '', 1),
(261, 89, 13, '', 1),
(262, 90, 13, '', 1),
(263, 91, 13, '', 1),
(264, 92, 13, '', 1),
(265, 93, 13, '', 1),
(266, 94, 13, '', 1),
(269, 97, 13, '', 1),
(268, 96, 13, '', 1),
(270, 98, 13, '', 1),
(271, 99, 13, '', 1),
(272, 100, 18, '', 1),
(274, 103, 13, '', 1),
(275, 104, 13, '', 1),
(276, 105, 13, '', 1),
(277, 106, 13, '', 1),
(278, 108, 13, '', 1),
(279, 109, 13, '', 1),
(280, 110, 13, '', 1),
(281, 110, 13, '', 0),
(282, 112, 13, '', 1),
(283, 114, 13, '', 1),
(284, 115, 13, '', 1),
(285, 116, 13, '', 1),
(286, 117, 13, '', 1),
(287, 117, 18, '', 1),
(288, 118, 13, '', 1),
(289, 119, 18, '', 1),
(290, 120, 18, '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_option_value`
--

CREATE TABLE IF NOT EXISTS `product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`),
  KEY `option_value_id` (`option_value_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=258 ;

--
-- Дамп данных таблицы `product_option_value`
--

INSERT INTO `product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(112, 254, 82, 13, 61, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(111, 254, 82, 13, 60, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(110, 253, 81, 13, 51, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(95, 251, 78, 11, 69, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(96, 251, 78, 11, 70, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(109, 253, 81, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(91, 249, 77, 11, 70, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(92, 249, 77, 11, 71, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(90, 249, 77, 11, 69, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(89, 248, 76, 11, 72, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(87, 248, 76, 11, 70, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(88, 248, 76, 11, 71, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(98, 252, 80, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(97, 252, 80, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(99, 252, 80, 13, 67, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(100, 252, 80, 13, 57, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(101, 252, 80, 13, 68, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(102, 252, 80, 13, 51, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(103, 252, 80, 13, 60, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(104, 252, 80, 13, 53, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(105, 252, 80, 13, 55, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(106, 252, 80, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(107, 252, 80, 13, 54, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(108, 252, 80, 13, 99, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(85, 247, 76, 13, 53, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(83, 247, 76, 13, 56, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(84, 247, 76, 13, 64, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(86, 247, 76, 13, 52, 0, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(80, 246, 75, 11, 70, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(81, 246, 75, 11, 71, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(82, 246, 75, 11, 72, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(66, 241, 72, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(65, 241, 72, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(69, 242, 72, 11, 72, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(68, 242, 72, 11, 71, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(67, 242, 72, 11, 70, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(73, 243, 74, 11, 73, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(72, 243, 74, 11, 72, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(71, 243, 74, 11, 71, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(70, 243, 74, 11, 70, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(113, 254, 82, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(114, 254, 82, 13, 57, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(115, 254, 82, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(116, 254, 82, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(117, 254, 82, 13, 54, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(118, 254, 82, 13, 53, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(124, 255, 83, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(123, 255, 83, 13, 53, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(122, 255, 83, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(121, 255, 83, 13, 51, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(120, 255, 83, 13, 57, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(119, 255, 83, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(125, 256, 84, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(126, 256, 84, 13, 51, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(127, 256, 84, 13, 56, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(128, 256, 84, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(129, 256, 84, 13, 60, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(130, 256, 84, 13, 61, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(131, 256, 84, 13, 54, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(132, 256, 84, 13, 68, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(133, 256, 84, 13, 55, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(134, 256, 84, 13, 57, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(141, 257, 85, 13, 68, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(135, 257, 85, 13, 56, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(136, 257, 85, 13, 61, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(137, 257, 85, 13, 60, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(139, 257, 85, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(138, 257, 85, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(140, 257, 85, 13, 55, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(142, 258, 86, 13, 68, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(143, 258, 86, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(144, 258, 86, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(145, 258, 86, 13, 60, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(146, 258, 86, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(147, 258, 86, 13, 99, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(148, 259, 87, 13, 62, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(149, 259, 87, 13, 60, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(150, 259, 87, 13, 51, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(152, 260, 88, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(151, 260, 88, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(154, 261, 89, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(153, 261, 89, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(155, 262, 90, 13, 60, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(156, 262, 90, 13, 99, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(157, 262, 90, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(158, 263, 91, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(159, 263, 91, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(161, 264, 92, 13, 55, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(160, 264, 92, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(164, 265, 93, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(163, 265, 93, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(162, 265, 93, 13, 55, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(165, 266, 94, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(166, 266, 94, 13, 51, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(167, 266, 94, 13, 56, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(168, 266, 94, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(179, 269, 97, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(180, 269, 97, 13, 61, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(181, 269, 97, 13, 54, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(182, 269, 97, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(183, 269, 97, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(178, 268, 96, 13, 61, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(177, 268, 96, 13, 60, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(176, 268, 96, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(175, 268, 96, 13, 57, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(174, 268, 96, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(184, 270, 98, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(185, 270, 98, 13, 55, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(186, 271, 99, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(187, 271, 99, 13, 55, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(188, 272, 100, 18, 103, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(192, 274, 103, 13, 60, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(191, 274, 103, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(193, 274, 103, 13, 54, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(194, 274, 103, 13, 62, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(195, 274, 103, 13, 57, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(196, 274, 103, 13, 63, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(198, 275, 104, 13, 53, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(197, 275, 104, 13, 57, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(199, 276, 105, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(200, 276, 105, 13, 53, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(201, 276, 105, 13, 57, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(202, 277, 106, 13, 60, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(203, 277, 106, 13, 57, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(204, 278, 108, 13, 61, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(205, 278, 108, 13, 53, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(206, 278, 108, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(207, 278, 108, 13, 60, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(208, 278, 108, 13, 100, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(209, 278, 108, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(210, 279, 109, 13, 61, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(211, 279, 109, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(212, 279, 109, 13, 68, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(213, 279, 109, 13, 100, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(214, 279, 109, 13, 57, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(215, 279, 109, 13, 55, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(219, 281, 110, 13, 57, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(216, 280, 110, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(217, 280, 110, 13, 61, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(218, 281, 110, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(220, 281, 110, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(221, 280, 110, 13, 57, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(222, 280, 110, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(230, 282, 112, 13, 51, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(229, 282, 112, 13, 99, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(228, 282, 112, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(227, 282, 112, 13, 54, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(226, 282, 112, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(225, 282, 112, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(224, 282, 112, 13, 57, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(223, 282, 112, 13, 61, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(231, 283, 114, 13, 59, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(232, 283, 114, 13, 56, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(233, 283, 114, 13, 55, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(234, 284, 115, 13, 61, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(235, 284, 115, 13, 98, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(236, 284, 115, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(237, 284, 115, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(238, 284, 115, 13, 54, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(239, 285, 116, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(240, 285, 116, 13, 99, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(241, 285, 116, 13, 63, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(242, 285, 116, 13, 55, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(243, 286, 117, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(244, 286, 117, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(245, 287, 117, 18, 103, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(246, 287, 117, 18, 104, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(247, 288, 118, 13, 52, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(248, 288, 118, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(249, 288, 118, 13, 108, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(250, 289, 119, 18, 103, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(251, 289, 119, 18, 104, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(252, 289, 119, 18, 105, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(253, 290, 120, 18, 103, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(254, 290, 120, 18, 104, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(255, 290, 120, 18, 105, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(256, 290, 120, 18, 106, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+'),
(257, 290, 120, 18, 107, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+');

-- --------------------------------------------------------

--
-- Структура таблицы `product_related`
--

CREATE TABLE IF NOT EXISTS `product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_related`
--

INSERT INTO `product_related` (`product_id`, `related_id`) VALUES
(74, 75),
(74, 100),
(75, 74),
(75, 100),
(76, 100),
(80, 82),
(80, 83),
(80, 84),
(80, 94),
(80, 97),
(82, 80),
(82, 83),
(82, 84),
(82, 94),
(82, 96),
(83, 80),
(83, 82),
(83, 84),
(83, 94),
(84, 80),
(84, 82),
(84, 83),
(84, 94),
(84, 96),
(85, 86),
(85, 88),
(85, 89),
(85, 90),
(86, 85),
(86, 88),
(86, 89),
(86, 91),
(87, 88),
(87, 89),
(87, 90),
(87, 91),
(88, 85),
(88, 86),
(88, 87),
(88, 89),
(88, 90),
(89, 85),
(89, 86),
(89, 87),
(89, 88),
(89, 90),
(89, 91),
(90, 85),
(90, 87),
(90, 88),
(90, 89),
(90, 91),
(91, 86),
(91, 87),
(91, 89),
(91, 90),
(91, 92),
(92, 91),
(92, 93),
(93, 92),
(94, 80),
(94, 82),
(94, 83),
(94, 84),
(96, 82),
(96, 84),
(96, 97),
(96, 98),
(96, 99),
(97, 80),
(97, 96),
(97, 98),
(97, 99),
(98, 96),
(98, 97),
(99, 96),
(99, 97),
(100, 74),
(100, 75),
(100, 76),
(103, 104),
(103, 105),
(104, 103),
(104, 105),
(105, 103),
(105, 104),
(106, 107),
(106, 108),
(106, 109),
(107, 106),
(107, 111),
(107, 116),
(108, 106),
(108, 109),
(108, 115),
(108, 116),
(109, 106),
(109, 108),
(109, 112),
(109, 115),
(110, 112),
(111, 107),
(111, 115),
(111, 116),
(112, 109),
(112, 110),
(112, 115),
(114, 115),
(115, 108),
(115, 109),
(115, 111),
(115, 112),
(115, 114),
(115, 116),
(116, 107),
(116, 108),
(116, 111),
(116, 115);

-- --------------------------------------------------------

--
-- Структура таблицы `product_reward`
--

CREATE TABLE IF NOT EXISTS `product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=759 ;

--
-- Дамп данных таблицы `product_reward`
--

INSERT INTO `product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(694, 83, 1, 0),
(691, 81, 1, 0),
(678, 74, 1, 0),
(695, 84, 1, 0),
(715, 73, 1, 0),
(692, 82, 1, 0),
(687, 80, 1, 0),
(683, 75, 1, 0),
(676, 72, 1, 0),
(673, 78, 1, 0),
(672, 76, 1, 0),
(730, 77, 1, 0),
(698, 85, 1, 0),
(699, 86, 1, 0),
(700, 87, 1, 0),
(705, 88, 1, 0),
(704, 89, 1, 0),
(703, 90, 1, 0),
(706, 91, 1, 0),
(708, 92, 1, 0),
(710, 93, 1, 0),
(711, 94, 1, 0),
(717, 97, 1, 0),
(714, 96, 1, 0),
(718, 98, 1, 0),
(721, 99, 1, 0),
(725, 100, 1, 0),
(727, 101, 1, 0),
(731, 103, 1, 0),
(733, 104, 1, 0),
(734, 105, 1, 0),
(735, 106, 1, 0),
(736, 107, 1, 0),
(737, 108, 1, 0),
(740, 109, 1, 0),
(745, 110, 1, 0),
(746, 111, 1, 0),
(748, 112, 1, 0),
(752, 114, 1, 0),
(753, 115, 1, 0),
(754, 116, 1, 0),
(755, 117, 1, 0),
(756, 118, 1, 0),
(757, 119, 1, 0),
(758, 120, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `product_special`
--

CREATE TABLE IF NOT EXISTS `product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=457 ;

-- --------------------------------------------------------

--
-- Структура таблицы `product_to_category`
--

CREATE TABLE IF NOT EXISTS `product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_to_category`
--

INSERT INTO `product_to_category` (`product_id`, `category_id`, `main_category`) VALUES
(83, 32, 0),
(83, 25, 1),
(81, 91, 1),
(81, 76, 0),
(84, 32, 1),
(84, 25, 0),
(73, 1, 0),
(73, 26, 1),
(82, 25, 0),
(82, 32, 1),
(80, 32, 1),
(80, 25, 0),
(75, 27, 1),
(75, 1, 0),
(72, 1, 0),
(72, 26, 1),
(78, 26, 0),
(78, 1, 1),
(74, 1, 0),
(74, 27, 1),
(76, 1, 0),
(76, 27, 1),
(77, 97, 1),
(77, 1, 0),
(85, 25, 0),
(85, 88, 1),
(86, 25, 0),
(86, 88, 1),
(87, 25, 0),
(87, 88, 1),
(88, 88, 1),
(88, 25, 0),
(89, 88, 1),
(89, 25, 0),
(90, 25, 0),
(90, 88, 1),
(91, 25, 0),
(91, 88, 1),
(92, 86, 1),
(92, 25, 0),
(93, 87, 1),
(93, 25, 0),
(94, 25, 0),
(94, 32, 1),
(97, 25, 0),
(97, 32, 1),
(96, 32, 1),
(96, 25, 0),
(98, 25, 0),
(98, 32, 1),
(99, 25, 0),
(99, 32, 1),
(100, 27, 1),
(100, 1, 0),
(101, 94, 1),
(101, 76, 0),
(103, 28, 1),
(103, 25, 0),
(104, 28, 1),
(104, 25, 0),
(105, 25, 0),
(105, 28, 1),
(106, 25, 0),
(106, 80, 1),
(107, 25, 0),
(107, 80, 1),
(108, 25, 0),
(108, 80, 1),
(109, 25, 0),
(109, 80, 1),
(110, 80, 1),
(110, 25, 0),
(111, 25, 0),
(111, 80, 1),
(112, 80, 1),
(112, 25, 0),
(114, 25, 0),
(114, 80, 1),
(115, 25, 0),
(115, 80, 1),
(116, 25, 0),
(116, 80, 1),
(117, 1, 0),
(117, 26, 1),
(118, 1, 0),
(118, 26, 1),
(119, 1, 0),
(119, 26, 1),
(120, 1, 0),
(120, 26, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_to_download`
--

CREATE TABLE IF NOT EXISTS `product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `product_to_layout`
--

CREATE TABLE IF NOT EXISTS `product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `product_to_store`
--

CREATE TABLE IF NOT EXISTS `product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_to_store`
--

INSERT INTO `product_to_store` (`product_id`, `store_id`) VALUES
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(114, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `return`
--

CREATE TABLE IF NOT EXISTS `return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `return_action`
--

CREATE TABLE IF NOT EXISTS `return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `return_action`
--

INSERT INTO `return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Возвращается'),
(2, 1, 'Выдан в кредит'),
(3, 1, 'Отправлена замена');

-- --------------------------------------------------------

--
-- Структура таблицы `return_history`
--

CREATE TABLE IF NOT EXISTS `return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `return_reason`
--

CREATE TABLE IF NOT EXISTS `return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `return_reason`
--

INSERT INTO `return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Сломан при доставке'),
(2, 1, 'Отправлен не по адресу'),
(3, 1, 'Ошибочный заказ'),
(4, 1, 'Неисправен, пожалуйста, укажите детали'),
(5, 1, 'Другое, пожалуйста, укажите детали');

-- --------------------------------------------------------

--
-- Структура таблицы `return_status`
--

CREATE TABLE IF NOT EXISTS `return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `return_status`
--

INSERT INTO `return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'В обработке'),
(3, 1, 'Выполнен'),
(2, 1, 'В ожидании товара');

-- --------------------------------------------------------

--
-- Структура таблицы `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Структура таблицы `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12164 ;

--
-- Дамп данных таблицы `setting`
--

INSERT INTO `setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(11972, 0, 'config', 'config_review_quick_edit', '1', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(11150, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(11971, 0, 'config', 'config_information_quick_edit', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(11974, 0, 'config', 'config_buttons_apply', '1', 0),
(11973, 0, 'config', 'config_clicking_image', '1', 0),
(11701, 0, 'carousel', 'carousel_module', 'a:1:{i:0;a:9:{s:9:"banner_id";s:1:"8";s:5:"limit";s:1:"4";s:6:"scroll";s:1:"2";s:5:"width";s:2:"80";s:6:"height";s:2:"80";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"8";}}', 1),
(11144, 0, 'credit', 'credit_sort_order', '7', 0),
(11143, 0, 'credit', 'credit_status', '0', 0),
(11756, 0, 'amazonmenu', 'amazonmenu_titles1', '', 0),
(11757, 0, 'amazonmenu', 'amazonmenu_header', '0', 0),
(11775, 0, 'featured', 'featured_product', '73', 0),
(11776, 0, 'featured', 'featured_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"8";s:11:"image_width";s:3:"220";s:12:"image_height";s:3:"220";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(11774, 0, 'featured', 'product', 'part', 0),
(11253, 0, 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(11763, 0, 'amazonmenu', 'amazonmenu_directory', '0', 0),
(11764, 0, 'amazonmenu', 'amazonmenu_module', 'a:3:{i:0;a:6:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:8:"toplimit";s:1:"5";s:8:"botlimit";s:1:"5";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:1;a:6:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:8:"toplimit";s:1:"5";s:8:"botlimit";s:1:"5";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:2;a:6:{s:9:"layout_id";s:1:"1";s:8:"position";s:11:"column_left";s:8:"toplimit";s:1:"5";s:8:"botlimit";s:1:"5";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(9732, 0, 'callback', 'callback_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"1";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(10934, 0, 'google_sitemap', 'google_sitemap_status', '1', 0),
(11762, 0, 'amazonmenu', 'amazonmenu_sprite_links', '0', 0),
(11761, 0, 'amazonmenu', 'amazonmenu_thumb_height', '425', 0),
(11760, 0, 'amazonmenu', 'amazonmenu_thumb_width', '425', 0),
(11970, 0, 'config', 'config_filter_quick_edit', '1', 0),
(11955, 0, 'config', 'config_seo_url_include_path', '1', 0),
(11968, 0, 'config', 'config_attributes_quick_edit', '1', 0),
(11969, 0, 'config', 'config_options_quick_edit', '1', 0),
(11967, 0, 'config', 'config_google_analytics', '&lt;script&gt;\r\n  (function(i,s,o,g,r,a,m){i[''GoogleAnalyticsObject'']=r;i[r]=i[r]||function(){\r\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\r\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\r\n  })(window,document,''script'',''//www.google-analytics.com/analytics.js'',''ga'');\r\n\r\n  ga(''create'', ''UA-46944758-1'', ''rumus.by'');\r\n  ga(''send'', ''pageview'');\r\n\r\n&lt;/script&gt;', 0),
(11966, 0, 'config', 'config_error_filename', 'error.txt', 0),
(11965, 0, 'config', 'config_error_log', '1', 0),
(11964, 0, 'config', 'config_error_display', '0', 0),
(11963, 0, 'config', 'config_compression', '0', 0),
(11962, 0, 'config', 'config_encryption', '5fmrnukvozgyc63pedsqh2tjx749bi ', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(11149, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(11148, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(11961, 0, 'config', 'config_password', '1', 0),
(11960, 0, 'config', 'config_maintenance', '0', 0),
(11959, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', 0),
(11958, 0, 'config', 'config_file_extension_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', 0),
(11957, 0, 'config', 'config_image_file_size', '300000', 0),
(11956, 0, 'config', 'config_seo_url_postfix', '', 0),
(11954, 0, 'config', 'config_seo_url_type', 'seo_pro', 0),
(11953, 0, 'config', 'config_seo_url', '1', 0),
(11948, 0, 'config', 'config_fraud_score', '', 0),
(11949, 0, 'config', 'config_fraud_status_id', '2', 0),
(11950, 0, 'config', 'config_secure', '0', 0),
(11951, 0, 'config', 'config_shared', '0', 0),
(11952, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(11772, 0, 'slideshow', 'slideshow_module', 'a:1:{i:0;a:7:{s:9:"banner_id";s:1:"7";s:5:"width";s:3:"730";s:6:"height";s:3:"300";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(109, 0, 'banner', 'banner_module', 'a:1:{i:0;a:8:{s:9:"banner_id";s:1:"6";s:5:"width";s:3:"182";s:6:"height";s:3:"182";s:11:"resize_type";s:7:"default";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(11947, 0, 'config', 'config_fraud_key', '', 0),
(11946, 0, 'config', 'config_fraud_detection', '0', 0),
(11945, 0, 'config', 'config_alert_emails', 'zhdanovich_artur@mail.ru', 0),
(11941, 0, 'config', 'config_smtp_timeout', '5', 0),
(11942, 0, 'config', 'config_alert_mail', '1', 0),
(11943, 0, 'config', 'config_account_mail', '0', 0),
(11944, 0, 'config', 'config_review_mail', '0', 0),
(11940, 0, 'config', 'config_smtp_port', '25', 0),
(11939, 0, 'config', 'config_smtp_password', '', 0),
(11938, 0, 'config', 'config_smtp_username', '', 0),
(11937, 0, 'config', 'config_smtp_host', '', 0),
(11936, 0, 'config', 'config_mail_parameter', '', 0),
(11934, 0, 'config', 'config_ftp_status', '0', 0),
(11935, 0, 'config', 'config_mail_protocol', 'mail', 0),
(11933, 0, 'config', 'config_ftp_root', '', 0),
(11932, 0, 'config', 'config_ftp_password', '', 0),
(11931, 0, 'config', 'config_ftp_username', '', 0),
(11930, 0, 'config', 'config_ftp_port', '21', 0),
(11929, 0, 'config', 'config_ftp_host', 'rumus.by', 0),
(11928, 0, 'config', 'config_image_cart_height', '47', 0),
(11927, 0, 'config', 'config_image_cart_width', '47', 0),
(11926, 0, 'config', 'config_image_wishlist_height', '47', 0),
(11925, 0, 'config', 'config_image_wishlist_width', '47', 0),
(11924, 0, 'config', 'config_image_compare_height', '90', 0),
(11923, 0, 'config', 'config_image_compare_width', '90', 0),
(11922, 0, 'config', 'config_image_related_height', '200', 0),
(11921, 0, 'config', 'config_image_related_width', '200', 0),
(11920, 0, 'config', 'config_image_additional_height', '74', 0),
(11919, 0, 'config', 'config_image_additional_width', '74', 0),
(11918, 0, 'config', 'config_image_product_height', '200', 0),
(11917, 0, 'config', 'config_image_product_width', '200', 0),
(11916, 0, 'config', 'config_image_popup_height', '500', 0),
(11915, 0, 'config', 'config_image_popup_width', '500', 0),
(11914, 0, 'config', 'config_image_thumb_height', '220', 0),
(11913, 0, 'config', 'config_image_thumb_width', '220', 0),
(11912, 0, 'config', 'config_image_subcategory_height', '200', 0),
(11911, 0, 'config', 'config_image_subcategory_width', '200', 0),
(11910, 0, 'config', 'config_image_category_height', '220', 0),
(11907, 0, 'config', 'config_logo', 'data/logo.png', 0),
(11909, 0, 'config', 'config_image_category_width', '220', 0),
(11908, 0, 'config', 'config_icon', 'data/favicon.png', 0),
(11906, 0, 'config', 'config_quick_news_design', '1', 0),
(11905, 0, 'config', 'config_quick_news_stores', '1', 0),
(332, 0, 'generator_categories', 'config_categories_template', '[category_name]', 0),
(333, 0, 'generator_categories', 'config_template_meta_h1_categories', '[categories_names]', 0),
(334, 0, 'generator_categories', 'config_template_meta_title_categories', '[categories_names]', 0),
(335, 0, 'generator_categories', 'config_template_meta_keywords_categories', '[categories_names], [store_name]', 0),
(336, 0, 'generator_categories', 'config_template_meta_description_categories', '[categories_names], [description]', 0),
(337, 0, 'generator_products', 'config_template_seo_url_products', '[product_name]', 0),
(338, 0, 'generator_products', 'config_meta_keywords_products', '[product_name], [model_name], [manufacturer_name], [categories_names]', 0),
(339, 0, 'generator_products', 'config_template_tags_products', '[product_name], [model_name], [manufacturer_name], [categories_names]', 0),
(340, 0, 'generator_products', 'config_template_meta_h1_products', '[product_name], [model_name], [manufacturer_name], [categories_names]', 0),
(341, 0, 'generator_products', 'config_template_meta_title_products', '[product_name], [model_name], [manufacturer_name], [categories_names]', 0),
(342, 0, 'generator_products', 'config_template_meta_description_products', '[product_name], [model_name], [description], [manufacturer_name], [categories_names]', 0),
(343, 0, 'generator_manufacturers', 'config_template_seo_url_manufacturers', '[manufacturer_name]', 0),
(344, 0, 'generator_manufacturers', 'config_template_meta_h1_manufacturers', '[manufacturer_name]', 0),
(345, 0, 'generator_manufacturers', 'config_template_meta_title_manufacturers', '[manufacturer_name]', 0),
(346, 0, 'generator_manufacturers', 'config_template_meta_keywords_manufacturers', '[manufacturer_name], [store_name]', 0),
(347, 0, 'generator_manufacturers', 'config_template_meta_description_manufacturers', '[manufacturer_name], [description]', 0),
(348, 0, 'generator_information', 'config_template_seo_url_informations', '[information_title]', 0),
(349, 0, 'generator_information', 'config_template_meta_h1_informations', '[information_title]', 0),
(350, 0, 'generator_information', 'config_template_meta_title_informations', '[information_title]', 0),
(351, 0, 'generator_information', 'config_template_meta_keywords_informations', '[information_title], [store_name]', 0),
(352, 0, 'generator_information', 'config_template_meta_description_informations', '[information_title], [description]', 0),
(353, 0, 'generator_news_categories', 'config_news_categories_template', '[news_category_name]', 0),
(354, 0, 'generator_news_categories', 'config_template_meta_h1_news_categories', '[news_category_name]', 0),
(355, 0, 'generator_news_categories', 'config_template_meta_title_news_categories', '[news_category_name]', 0),
(356, 0, 'generator_news_categories', 'config_template_meta_keywords_news_categories', '[news_category_name], [store_name]', 0),
(357, 0, 'generator_news_categories', 'config_template_meta_description_news_categories', '[news_category_name], [description]', 0),
(358, 0, 'generator_news', 'config_template_seo_url_news', '[news_name]', 0),
(359, 0, 'generator_news', 'config_template_meta_h1_news', '[news_name], [news_category_name]', 0),
(360, 0, 'generator_news', 'config_template_meta_title_news', '[news_name], [news_category_name]', 0),
(361, 0, 'generator_news', 'config_template_meta_keywords_news', '[news_name], [news_category_name], [store_name]', 0),
(362, 0, 'generator_news', 'config_template_tags_news', '[news_name], [news_category_name], [store_name]', 0),
(363, 0, 'generator_news', 'config_template_meta_description_news', '[news_name], [news_category_name], [store_name], [description]', 0),
(12155, 0, 'product_stickers', 'config_sticker_new_news_related_product', '1', 0),
(12116, 0, 'product_stickers', 'config_limit_days_new_product', '4', 0),
(12117, 0, 'product_stickers', 'config_limit_viewed_popular_product', '30', 0),
(12118, 0, 'product_stickers', 'config_sticker_special_module_bestseller', '1', 0),
(12119, 0, 'product_stickers', 'config_sticker_new_module_bestseller', '1', 0),
(12120, 0, 'product_stickers', 'config_sticker_popular_module_bestseller', '1', 0),
(12121, 0, 'product_stickers', 'config_sticker_special_module_featured', '1', 0),
(12122, 0, 'product_stickers', 'config_sticker_new_module_featured', '1', 0),
(12123, 0, 'product_stickers', 'config_sticker_popular_module_featured', '1', 0),
(12124, 0, 'product_stickers', 'config_sticker_special_module_latest', '1', 0),
(12125, 0, 'product_stickers', 'config_sticker_new_module_latest', '1', 0),
(12154, 0, 'product_stickers', 'config_sticker_special_news_related_product', '1', 0),
(12153, 0, 'product_stickers', 'config_sticker_popular_quick_view_related', '1', 0),
(12151, 0, 'product_stickers', 'config_sticker_special_quick_view_related', '1', 0),
(12152, 0, 'product_stickers', 'config_sticker_new_quick_view_related', '1', 0),
(12150, 0, 'product_stickers', 'config_sticker_popular_quick_view', '1', 0),
(12149, 0, 'product_stickers', 'config_sticker_new_quick_view', '1', 0),
(12148, 0, 'product_stickers', 'config_sticker_special_quick_view', '1', 0),
(12147, 0, 'product_stickers', 'config_sticker_popular_special', '1', 0),
(12146, 0, 'product_stickers', 'config_sticker_new_special', '1', 0),
(12145, 0, 'product_stickers', 'config_sticker_special_special', '1', 0),
(12144, 0, 'product_stickers', 'config_sticker_popular_search', '1', 0),
(12143, 0, 'product_stickers', 'config_sticker_new_search', '1', 0),
(12142, 0, 'product_stickers', 'config_sticker_special_search', '1', 0),
(12141, 0, 'product_stickers', 'config_sticker_popular_product_related', '1', 0),
(12140, 0, 'product_stickers', 'config_sticker_new_product_related', '1', 0),
(405, 0, 'quick_view', 'config_quick_view_bestseller', '1', 0),
(406, 0, 'quick_view', 'config_quick_view_featured', '1', 0),
(407, 0, 'quick_view', 'config_quick_view_latest', '1', 0),
(408, 0, 'quick_view', 'config_quick_view_special', '1', 0),
(409, 0, 'quick_view', 'config_quick_view_categories', '1', 0),
(410, 0, 'quick_view', 'config_quick_view_manufacturers', '1', 0),
(411, 0, 'quick_view', 'config_quick_view_search', '1', 0),
(412, 0, 'quick_view', 'config_quick_view_list_special', '1', 0),
(416, 0, 'quick_registration', 'config_quick_registration_checkout', '1', 0),
(417, 0, 'quick_registration', 'config_customer_groups_quick_registration_checkout', '0', 0),
(418, 0, 'quick_registration', 'config_first_quick_registration_checkout', '1', 0),
(419, 0, 'quick_registration', 'config_last_quick_registration_checkout', '1', 0),
(420, 0, 'quick_registration', 'config_telephone_quick_registration_checkout', '1', 0),
(421, 0, 'quick_registration', 'config_fax_quick_registration_checkout', '0', 0),
(422, 0, 'quick_registration', 'config_company_quick_registration_checkout', '0', 0),
(423, 0, 'quick_registration', 'config_address_1_quick_registration_checkout', '1', 0),
(424, 0, 'quick_registration', 'config_address_2_quick_registration_checkout', '0', 0),
(425, 0, 'quick_registration', 'config_city_quick_registration_checkout', '1', 0),
(426, 0, 'quick_registration', 'config_post_code_quick_registration_checkout', '1', 0),
(427, 0, 'quick_registration', 'config_country_quick_registration_checkout', '1', 0),
(428, 0, 'quick_registration', 'config_subscribe_quick_registration_checkout', '0', 0),
(11899, 0, 'config', 'config_quick_news_date_sort', '1', 0),
(11767, 0, 'vk', 'vk_module', 'a:2:{i:0;a:8:{s:11:"image_width";s:3:"210";s:12:"image_height";s:3:"200";s:4:"mode";s:1:"1";s:5:"vk_id";s:8:"44702020";s:9:"layout_id";s:1:"6";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:1;a:8:{s:11:"image_width";s:3:"210";s:12:"image_height";s:3:"400";s:4:"mode";s:1:"2";s:5:"vk_id";s:8:"44702020";s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(11904, 0, 'config', 'config_news_category_design', '1', 0),
(11902, 0, 'config', 'config_news_category_stores', '1', 0),
(11903, 0, 'config', 'config_quick_news_images', '1', 0),
(11773, 0, 'latest', 'latest_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"8";s:11:"image_width";s:3:"220";s:12:"image_height";s:3:"220";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"5";}}', 1),
(11733, 0, 'bestseller', 'bestseller_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"5";s:11:"image_width";s:3:"220";s:12:"image_height";s:3:"220";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"5";}}', 1),
(11901, 0, 'config', 'config_quick_news_related', '1', 0),
(11900, 0, 'config', 'config_news_category_image', '1', 0),
(12139, 0, 'product_stickers', 'config_sticker_special_product_related', '1', 0),
(12138, 0, 'product_stickers', 'config_sticker_popular_product', '1', 0),
(12137, 0, 'product_stickers', 'config_sticker_new_product', '1', 0),
(12136, 0, 'product_stickers', 'config_sticker_special_product', '1', 0),
(12135, 0, 'product_stickers', 'config_sticker_popular_manufacturer', '1', 0),
(12134, 0, 'product_stickers', 'config_sticker_new_manufacturer', '1', 0),
(12133, 0, 'product_stickers', 'config_sticker_special_manufacturer', '1', 0),
(11897, 0, 'config', 'config_news_category', '1', 0),
(11898, 0, 'config', 'config_news_category_parent', '1', 0),
(9731, 0, 'callback', 'callback_message', '1', 0),
(11896, 0, 'config', 'config_news_category_general_data', '1', 0),
(11895, 0, 'config', 'config_news_general_data', '1', 0),
(9730, 0, 'callback', 'callback_theme', '1', 0),
(9728, 0, 'callback', 'callback_phone_mask', '+999(99) 999-99-99', 0),
(9729, 0, 'callback', 'callback_other_emails', '', 0),
(11894, 0, 'config', 'config_news_category_all_buttons', '1', 0),
(11893, 0, 'config', 'config_news_all_buttons', '1', 0),
(11892, 0, 'config', 'config_image_news_additional_height', '168', 0),
(11891, 0, 'config', 'config_image_news_additional_width', '168', 0),
(11890, 0, 'config', 'config_image_news_related_height', '198', 0),
(11889, 0, 'config', 'config_image_news_related_width', '198', 0),
(11888, 0, 'config', 'config_image_news_height', '220', 0),
(11887, 0, 'config', 'config_image_news_width', '220', 0),
(11886, 0, 'config', 'config_image_news_popup_height', '500', 0),
(11885, 0, 'config', 'config_image_news_popup_width', '500', 0),
(11884, 0, 'config', 'config_image_news_thumb_height', '228', 0),
(11883, 0, 'config', 'config_image_news_thumb_width', '228', 0),
(11882, 0, 'config', 'config_image_news_sub_category_height', '160', 0),
(11881, 0, 'config', 'config_image_news_sub_category_width', '160', 0),
(11880, 0, 'config', 'config_image_news_category_height', '220', 0),
(11879, 0, 'config', 'config_image_news_category_width', '220', 0),
(11878, 0, 'config', 'config_limit_news_comments', '5', 0),
(11877, 0, 'config', 'config_news_comments_mail', '1', 0),
(11874, 0, 'config', 'config_sub_news_category_description_limit', '100', 0),
(11873, 0, 'config', 'config_news_grid_description_limit', '200', 0),
(11876, 0, 'config', 'config_guest_news_comment', '0', 0),
(11875, 0, 'config', 'config_news_count', '0', 0),
(11871, 0, 'config', 'config_search_news', 'bottom', 0),
(11872, 0, 'config', 'config_news_description_limit', '300', 0),
(11870, 0, 'config', 'config_view_news_subcategory', 'images', 0),
(11869, 0, 'config', 'config_news_side_menu', 'top', 0),
(11868, 0, 'config', 'config_news_top_menu', 'none', 0),
(11867, 0, 'config', 'config_news_sort_order', 'DESC', 0),
(11866, 0, 'config', 'config_manufacturer_image_top_menu', '0', 0),
(11865, 0, 'config', 'config_manufacturer_top_menu', 'top_menu', 0),
(11864, 0, 'config', 'config_manufacturer_quick_edit', '0', 0),
(11863, 0, 'config', 'config_category_design', '1', 0),
(11862, 0, 'config', 'config_category_stores', '1', 0),
(11861, 0, 'config', 'config_category_image', '1', 0),
(11859, 0, 'config', 'config_category_parent', '1', 0),
(11860, 0, 'config', 'config_category_filter', '1', 0),
(11858, 0, 'config', 'config_category_general_data', '1', 0),
(11857, 0, 'config', 'config_sub_category_description_limit', '150', 0),
(11856, 0, 'config', 'config_view_subcategory', 'images', 0),
(11855, 0, 'config', 'config_product_count', '0', 0),
(11854, 0, 'config', 'config_category_quick_edit', '0', 0),
(11853, 0, 'config', 'config_quick_design', '1', 0),
(11852, 0, 'config', 'config_quick_reward_points', '1', 0),
(11851, 0, 'config', 'config_quick_downloads', '1', 0),
(11850, 0, 'config', 'config_quick_stores', '1', 0),
(11849, 0, 'config', 'config_quick_images', '1', 0),
(11848, 0, 'config', 'config_quick_discount', '1', 0),
(11847, 0, 'config', 'config_quick_special', '1', 0),
(11846, 0, 'config', 'config_quick_options', '1', 0),
(11845, 0, 'config', 'config_quick_attribute', '1', 0),
(11844, 0, 'config', 'config_quick_date_sort', '1', 0),
(11843, 0, 'config', 'config_quick_weight', '1', 0),
(11842, 0, 'config', 'config_quick_dimension', '1', 0),
(11841, 0, 'config', 'config_quick_subtract', '1', 0),
(11840, 0, 'config', 'config_quick_minimum', '1', 0),
(11839, 0, 'config', 'config_quick_tax_class', '1', 0),
(11838, 0, 'config', 'config_quick_code', '1', 0),
(11837, 0, 'config', 'config_quick_related', '1', 0),
(11836, 0, 'config', 'config_quick_filter', '1', 0),
(11835, 0, 'config', 'config_manufacturer_categories', '1', 0),
(11834, 0, 'config', 'config_general_data', '1', 0),
(11833, 0, 'config', 'config_quick_all_buttons', '1', 0),
(11832, 0, 'config', 'config_display_weight', '0', 0),
(11831, 0, 'config', 'config_zoom_images_product', '1', 0),
(11828, 0, 'config', 'config_review_status', '1', 0),
(11829, 0, 'config', 'config_guest_review', '0', 0),
(11830, 0, 'config', 'config_download', '0', 0),
(11827, 0, 'config', 'config_product_quick_edit', '1', 0),
(11826, 0, 'config', 'config_return_status_id', '2', 0),
(11825, 0, 'config', 'config_return_id', '3', 0),
(11824, 0, 'config', 'config_commission', '5', 0),
(11823, 0, 'config', 'config_affiliate_id', '5', 0),
(11822, 0, 'config', 'config_stock_status_id', '8', 0),
(11820, 0, 'config', 'config_stock_warning', '0', 0),
(11821, 0, 'config', 'config_stock_checkout', '1', 0),
(11819, 0, 'config', 'config_stock_display', '0', 0),
(11818, 0, 'config', 'config_complete_status_id', '5', 0),
(11817, 0, 'config', 'config_order_status_id', '1', 0),
(11816, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(11815, 0, 'config', 'config_order_edit', '100', 0),
(11814, 0, 'config', 'config_checkout_id', '0', 0),
(11813, 0, 'config', 'config_guest_checkout', '1', 0),
(11812, 0, 'config', 'config_cart_weight', '0', 0),
(11811, 0, 'config', 'config_account_id', '0', 0),
(11807, 0, 'config', 'config_customer_online', '0', 0),
(11808, 0, 'config', 'config_customer_group_id', '1', 0),
(11810, 0, 'config', 'config_customer_price', '0', 0),
(11809, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(11806, 0, 'config', 'config_tax_customer', 'shipping', 0),
(11805, 0, 'config', 'config_tax_default', 'shipping', 0),
(11804, 0, 'config', 'config_vat', '0', 0),
(11803, 0, 'config', 'config_tax', '0', 0),
(11802, 0, 'config', 'config_voucher_max', '300000', 0),
(11801, 0, 'config', 'config_voucher_min', '10000', 0),
(11800, 0, 'config', 'config_admin_limit', '1000', 0),
(11799, 0, 'config', 'config_grid_description_limit', '200', 0),
(11798, 0, 'config', 'config_list_description_limit', '400', 0),
(11797, 0, 'config', 'config_catalog_limit', '15', 0),
(11796, 0, 'config', 'config_weight_class_id', '1', 0),
(11795, 0, 'config', 'config_length_class_id', '1', 0),
(11794, 0, 'config', 'config_currency_auto', '0', 0),
(11793, 0, 'config', 'config_currency', 'USD', 0),
(11792, 0, 'config', 'config_admin_language', 'ru', 0),
(11791, 0, 'config', 'config_language', 'ru', 0),
(11790, 0, 'config', 'config_zone_id', '339', 0),
(11789, 0, 'config', 'config_country_id', '20', 0),
(11788, 0, 'config', 'config_layout_id', '4', 0),
(11787, 0, 'config', 'config_template', 'default', 0),
(11786, 0, 'config', 'config_meta_description', 'Интернет магазин одежды rumus.by осуществляет продажу одежды аксессуаров по доступным ценам. У нас бесплатная доставка по  Беларуси!', 0),
(11783, 0, 'config', 'config_fax', '', 0),
(11784, 0, 'config', 'config_contacts_display', 'header_footer', 0),
(11785, 0, 'config', 'config_title', 'rumus.by - Магазин одежды и аксессуаров.', 0),
(11782, 0, 'config', 'config_mobile_telephone', '+375(29) 138-10-75', 0),
(11781, 0, 'config', 'config_telephone', '+375(29) 218-10-75', 0),
(11779, 0, 'config', 'config_address', '', 0),
(11780, 0, 'config', 'config_email', 'mail@rumus.by', 0),
(11778, 0, 'config', 'config_owner', 'ИП Романовский Д. Ф.', 0),
(9727, 0, 'callback', 'callback_email', 'mail@rumus.by', 0),
(9726, 0, 'callback', 'callback_title_ru', 'Заказать звонок', 0),
(11777, 0, 'config', 'config_name', 'Интернет магазин rumus.by', 0),
(10935, 0, 'google_base', 'google_base_status', '1', 0),
(11255, 0, 'lastview', 'lastview_module', 'a:3:{i:0;a:7:{s:5:"limit";s:1:"1";s:11:"image_width";s:3:"160";s:12:"image_height";s:3:"160";s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"4";}i:1;a:7:{s:5:"limit";s:1:"5";s:11:"image_width";s:3:"160";s:12:"image_height";s:3:"160";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"4";}i:2;a:7:{s:5:"limit";s:1:"5";s:11:"image_width";s:3:"160";s:12:"image_height";s:3:"160";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"4";}}', 1),
(11252, 0, 'pp_standard', 'pp_standard_sort_order', '2', 0),
(11251, 0, 'pp_standard', 'pp_standard_status', '0', 0),
(11250, 0, 'pp_standard', 'pp_standard_geo_zone_id', '0', 0),
(11249, 0, 'pp_standard', 'pp_standard_voided_status_id', '2', 0),
(11248, 0, 'pp_standard', 'pp_standard_reversed_status_id', '2', 0),
(11246, 0, 'pp_standard', 'pp_standard_processed_status_id', '2', 0),
(11247, 0, 'pp_standard', 'pp_standard_refunded_status_id', '2', 0),
(11245, 0, 'pp_standard', 'pp_standard_pending_status_id', '2', 0),
(11244, 0, 'pp_standard', 'pp_standard_failed_status_id', '2', 0),
(11243, 0, 'pp_standard', 'pp_standard_expired_status_id', '2', 0),
(11242, 0, 'pp_standard', 'pp_standard_denied_status_id', '2', 0),
(11241, 0, 'pp_standard', 'pp_standard_completed_status_id', '2', 0),
(11240, 0, 'pp_standard', 'pp_standard_canceled_reversal_status_id', '2', 0),
(11239, 0, 'pp_standard', 'pp_standard_total', '0.01', 0),
(11238, 0, 'pp_standard', 'pp_standard_debug', '0', 0),
(11237, 0, 'pp_standard', 'pp_standard_transaction', '1', 0),
(11236, 0, 'pp_standard', 'pp_standard_test', '0', 0),
(11235, 0, 'pp_standard', 'pp_standard_email', 'dmitriy_r_f@mail.ru', 0),
(12132, 0, 'product_stickers', 'config_sticker_popular_categories', '1', 0),
(12130, 0, 'product_stickers', 'config_sticker_special_categories', '1', 0),
(12131, 0, 'product_stickers', 'config_sticker_new_categories', '1', 0),
(12129, 0, 'product_stickers', 'config_sticker_popular_module_special', '1', 0),
(12128, 0, 'product_stickers', 'config_sticker_new_module_special', '1', 0),
(12127, 0, 'product_stickers', 'config_sticker_special_module_special', '1', 0),
(11759, 0, 'amazonmenu', 'amazonmenu_box', '1', 0),
(11758, 0, 'amazonmenu', 'amazonmenu_icon', '0', 0),
(11768, 0, 'news_category', 'news_category_module', 'a:3:{i:0;a:10:{s:5:"limit";s:2:"10";s:8:"image_on";s:1:"1";s:11:"image_width";s:3:"200";s:12:"image_height";s:3:"200";s:10:"name_limit";s:2:"25";s:17:"description_limit";s:3:"150";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:1;a:10:{s:5:"limit";s:2:"10";s:8:"image_on";s:1:"1";s:11:"image_width";s:3:"200";s:12:"image_height";s:3:"200";s:10:"name_limit";s:2:"25";s:17:"description_limit";s:3:"150";s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:2;a:10:{s:5:"limit";s:2:"10";s:8:"image_on";s:1:"1";s:11:"image_width";s:3:"200";s:12:"image_height";s:3:"200";s:10:"name_limit";s:2:"25";s:17:"description_limit";s:3:"150";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(11975, 0, 'config', 'config_quick_search', '1', 0),
(11976, 0, 'config', 'config_copyright', '1', 0),
(12126, 0, 'product_stickers', 'config_sticker_popular_module_latest', '1', 0),
(12071, 0, 'supermenu', 'supermenu_image_width', '120', 0),
(12072, 0, 'supermenu', 'supermenu_image_height', '120', 0),
(12073, 0, 'supermenu', 'supermenu_item', 'a:5:{i:0;a:14:{s:4:"type";s:3:"cat";s:4:"view";s:1:"0";s:11:"category_id";s:1:"1";s:14:"information_id";s:1:"9";s:10:"customname";a:1:{i:1;s:0:"";}s:9:"customurl";a:1:{i:1;s:0:"";}s:6:"addurl";a:1:{i:1;s:0:"";}s:5:"image";a:1:{i:1;s:0:"";}s:7:"tlcolor";s:0:"";s:7:"tlstyle";s:0:"";s:5:"chtml";s:1:"0";s:6:"cchtml";s:5:"area1";s:6:"dwidth";s:0:"";s:6:"iwidth";s:0:"";}i:1;a:14:{s:4:"type";s:3:"cat";s:4:"view";s:1:"0";s:11:"category_id";s:2:"18";s:14:"information_id";s:1:"9";s:10:"customname";a:1:{i:1;s:0:"";}s:9:"customurl";a:1:{i:1;s:0:"";}s:6:"addurl";a:1:{i:1;s:0:"";}s:5:"image";a:1:{i:1;s:0:"";}s:7:"tlcolor";s:0:"";s:7:"tlstyle";s:0:"";s:5:"chtml";s:1:"0";s:6:"cchtml";s:5:"area1";s:6:"dwidth";s:0:"";s:6:"iwidth";s:0:"";}i:2;a:14:{s:4:"type";s:3:"cat";s:4:"view";s:1:"0";s:11:"category_id";s:2:"25";s:14:"information_id";s:1:"9";s:10:"customname";a:1:{i:1;s:0:"";}s:9:"customurl";a:1:{i:1;s:0:"";}s:6:"addurl";a:1:{i:1;s:0:"";}s:5:"image";a:1:{i:1;s:0:"";}s:7:"tlcolor";s:0:"";s:7:"tlstyle";s:0:"";s:5:"chtml";s:1:"0";s:6:"cchtml";s:5:"area1";s:6:"dwidth";s:0:"";s:6:"iwidth";s:0:"";}i:3;a:14:{s:4:"type";s:3:"cat";s:4:"view";s:1:"0";s:11:"category_id";s:2:"76";s:14:"information_id";s:1:"9";s:10:"customname";a:1:{i:1;s:0:"";}s:9:"customurl";a:1:{i:1;s:0:"";}s:6:"addurl";a:1:{i:1;s:0:"";}s:5:"image";a:1:{i:1;s:0:"";}s:7:"tlcolor";s:0:"";s:7:"tlstyle";s:0:"";s:5:"chtml";s:1:"0";s:6:"cchtml";s:5:"area1";s:6:"dwidth";s:0:"";s:6:"iwidth";s:0:"";}i:4;a:14:{s:4:"type";s:3:"cat";s:4:"view";s:1:"0";s:11:"category_id";s:2:"57";s:14:"information_id";s:1:"9";s:10:"customname";a:1:{i:1;s:0:"";}s:9:"customurl";a:1:{i:1;s:0:"";}s:6:"addurl";a:1:{i:1;s:0:"";}s:5:"image";a:1:{i:1;s:0:"";}s:7:"tlcolor";s:0:"";s:7:"tlstyle";s:0:"";s:5:"chtml";s:1:"0";s:6:"cchtml";s:5:"area1";s:6:"dwidth";s:0:"";s:6:"iwidth";s:0:"";}}', 1),
(12067, 0, 'supermenu', 'supermenu_settings_status', '0', 0),
(12068, 0, 'supermenu', 'supermenu_settings', 'a:7:{s:2:"bg";s:0:"";s:3:"tlc";s:0:"";s:3:"dbg";s:0:"";s:3:"slc";s:0:"";s:4:"slbg";s:0:"";s:5:"slbgh";s:0:"";s:4:"thlc";s:0:"";}', 1),
(12069, 0, 'supermenu', 'supermenu_more_title', 'a:1:{i:1;s:0:"";}', 1),
(12070, 0, 'supermenu', 'supermenu_more', 'a:41:{i:0;s:2:"57";i:1;s:2:"68";i:2;s:2:"72";i:3;s:2:"84";i:4;s:2:"83";i:5;s:2:"67";i:6;s:2:"76";i:7;s:2:"94";i:8;s:2:"96";i:9;s:2:"92";i:10;s:2:"90";i:11;s:2:"93";i:12;s:2:"95";i:13;s:2:"91";i:14;s:1:"1";i:15;s:2:"82";i:16;s:2:"60";i:17;s:2:"97";i:18;s:2:"26";i:19;s:2:"27";i:20;s:2:"62";i:21;s:2:"66";i:22;s:2:"59";i:23;s:2:"63";i:24;s:2:"18";i:25;s:2:"74";i:26;s:2:"73";i:27;s:2:"77";i:28;s:2:"78";i:29;s:2:"79";i:30;s:2:"46";i:31;s:2:"75";i:32;s:2:"81";i:33;s:2:"25";i:34;s:2:"28";i:35;s:2:"88";i:36;s:2:"32";i:37;s:2:"86";i:38;s:2:"80";i:39;s:2:"89";i:40;s:2:"87";}', 1),
(12074, 0, 'supermenu', 'supermenu_htmlarea', 'a:1:{i:1;a:8:{s:5:"area1";s:41:"&lt;p&gt;Insert custom code 1&lt;/p&gt;\r\n";s:5:"area2";s:41:"&lt;p&gt;Insert custom code 2&lt;/p&gt;\r\n";s:5:"area3";s:41:"&lt;p&gt;Insert custom code 3&lt;/p&gt;\r\n";s:5:"area4";s:41:"&lt;p&gt;Insert custom code 4&lt;/p&gt;\r\n";s:5:"area5";s:41:"&lt;p&gt;Insert custom code 5&lt;/p&gt;\r\n";s:5:"area6";s:41:"&lt;p&gt;Insert custom code 6&lt;/p&gt;\r\n";s:5:"area7";s:41:"&lt;p&gt;Insert custom code 7&lt;/p&gt;\r\n";s:5:"area8";s:41:"&lt;p&gt;Insert custom code 8&lt;/p&gt;\r\n";}}', 1),
(12156, 0, 'product_stickers', 'config_sticker_popular_news_related_product', '1', 0),
(12161, 0, 'filterpro', 'filterpro_setting', 'a:16:{s:12:"price_slider";s:1:"1";s:20:"display_manufacturer";s:4:"none";s:18:"display_categories";s:4:"none";s:12:"display_tags";s:4:"none";s:17:"display_option_11";s:4:"none";s:17:"display_option_18";s:4:"none";s:17:"display_option_15";s:4:"none";s:17:"display_option_13";s:4:"none";s:14:"attr_delimeter";s:1:":";s:3:"tax";s:1:"0";s:11:"option_mode";s:2:"or";s:14:"attribute_mode";s:2:"or";s:20:"attribute_value_mode";s:2:"or";s:10:"attr_group";s:1:"0";s:19:"filterpro_container";s:15:".product-{view}";s:19:"filterpro_afterload";s:0:"";}', 1),
(12162, 0, 'filterpro', 'filterpro_module', 'a:1:{i:0;a:5:{s:4:"type";s:1:"0";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(12163, 0, 'needlessimage', 'needlessimage_version', '1.1', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `sprites`
--

CREATE TABLE IF NOT EXISTS `sprites` (
  `sprites_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `image_size` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sprites_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `sprites`
--

INSERT INTO `sprites` (`sprites_id`, `status`, `image`, `image_size`, `sort_order`) VALUES
(1, 1, 'data/menu/bg_m.png', 0, 2),
(2, 1, 'data/menu/bg_w.png', 0, 1),
(3, 1, 'data/menu/bg_b.png', 0, 3),
(4, 1, 'data/menu/bg_a.png', 0, 4),
(5, 1, 'data/menu/bg_j.png', 0, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `sprites_description`
--

CREATE TABLE IF NOT EXISTS `sprites_description` (
  `sprites_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`sprites_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `sprites_description`
--

INSERT INTO `sprites_description` (`sprites_id`, `language_id`, `title`, `meta_description`, `description`) VALUES
(1, 1, 'men', '', 'none'),
(2, 1, 'women', '', 'none'),
(3, 1, 'bags', '', 'none'),
(4, 1, 'accessories', '', 'none'),
(5, 1, 'bijouterie', '', 'none');

-- --------------------------------------------------------

--
-- Структура таблицы `sprites_to_store`
--

CREATE TABLE IF NOT EXISTS `sprites_to_store` (
  `sprites_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`sprites_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `sprites_to_store`
--

INSERT INTO `sprites_to_store` (`sprites_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `stock_status`
--

CREATE TABLE IF NOT EXISTS `stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `stock_status`
--

INSERT INTO `stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'Есть в наличии'),
(8, 1, 'Предзаказ'),
(5, 1, 'Нет в наличии'),
(6, 1, 'Ожидание 2-3 дня');

-- --------------------------------------------------------

--
-- Структура таблицы `store`
--

CREATE TABLE IF NOT EXISTS `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `tax_class`
--

CREATE TABLE IF NOT EXISTS `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Структура таблицы `tax_rate`
--

CREATE TABLE IF NOT EXISTS `tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

-- --------------------------------------------------------

--
-- Структура таблицы `tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tax_rule`
--

CREATE TABLE IF NOT EXISTS `tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

-- --------------------------------------------------------

--
-- Структура таблицы `url_alias`
--

CREATE TABLE IF NOT EXISTS `url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1411 ;

--
-- Дамп данных таблицы `url_alias`
--

INSERT INTO `url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(1192, 'category_id=72', 'clock'),
(1162, 'manufacturer_id=8', 'gepur'),
(1380, 'information_id=4', 'about-us'),
(1310, 'category_id=76', 'bijouterie'),
(774, 'common/home', ''),
(775, 'checkout/cart', 'cart'),
(776, 'checkout/checkout', 'checkout'),
(777, 'account/register', 'account-register'),
(778, 'account/login', 'account-login'),
(779, 'account/forgotten', 'account-forgotten'),
(780, 'account/account', 'account'),
(781, 'account/edit', 'account-edit'),
(782, 'account/password', 'account-password'),
(783, 'account/address', 'account-address'),
(784, 'account/wishlist', 'wishlist'),
(785, 'account/order', 'order-history'),
(786, 'account/download', 'account-download'),
(787, 'account/return', 'account-return'),
(788, 'account/transaction', 'account-transaction'),
(789, 'account/newsletter', 'account-newsletter'),
(790, 'account/reward', 'account-reward'),
(791, 'account/logout', 'account-logout'),
(792, 'information/contact', 'contact'),
(793, 'information/sitemap', 'sitemap'),
(794, 'product/manufacturer', 'brands'),
(795, 'account/voucher', 'account-voucher'),
(796, 'product/special', 'product-special'),
(797, 'affiliate/login', 'affiliate-login'),
(798, 'affiliate/register', 'affiliate-register'),
(799, 'affiliate/success', 'affiliate-success'),
(800, 'account/success', 'account-success'),
(801, 'affiliate/account', 'affiliate-account'),
(802, 'affiliate/edit', 'affiliate-edit'),
(803, 'affiliate/password', 'affiliate-password'),
(804, 'affiliate/payment', 'affiliate-payment'),
(805, 'affiliate/tracking', 'affiliate-tracking'),
(806, 'affiliate/transaction', 'affiliate-transaction'),
(807, 'affiliate/logout', 'affiliate-logout'),
(808, 'affiliate/forgotten', 'affiliate-forgotten'),
(809, 'product/compare', 'product-compare'),
(810, 'account/quick_registration', 'account-register'),
(811, 'checkout/quick_checkout', 'checkout'),
(1330, 'category_id=32', 'klachi'),
(1161, 'manufacturer_id=9', 'eva_style'),
(1158, 'manufacturer_id=7', ' larionoff'),
(1160, 'manufacturer_id=5', 'dress_code'),
(1186, 'category_id=77', 'men-jackets'),
(1191, 'category_id=68', 'strap'),
(1198, 'category_id=82', 'pidzhaki'),
(1187, 'category_id=78', 'men-jackets'),
(1170, 'category_id=60', 'women-sweatshirts'),
(1331, 'category_id=28', 'women-women_handbags'),
(1180, 'category_id=27', 'women-jackets'),
(1172, 'category_id=26', 'women-dress'),
(1179, 'category_id=66', 'women-smock'),
(1317, 'category_id=67', 'caps'),
(1176, 'category_id=63', 'women-skirts'),
(1177, 'category_id=62', 'women-tshirts'),
(1193, 'category_id=83', 'muzhskie-chasy'),
(1175, 'category_id=59', 'women-shorts'),
(1183, 'category_id=75', 'men-tshirts'),
(1165, 'category_id=74', 'men-stories'),
(1313, 'category_id=46', 'men-cardigans'),
(1185, 'category_id=73', 'men-waistcoats'),
(1237, 'category_id=57', 'accessories'),
(1068, 'category_id=25', 'bag'),
(1067, 'category_id=18', 'men'),
(1202, 'category_id=1', 'women'),
(1010, 'information_id=5', 'cooperation'),
(1146, 'information_id=6', 'informaciya-o-dostavke'),
(1379, 'information_id=7', 'oplata'),
(1130, 'information_id=8', 'contacts'),
(1381, 'information_id=3', 'oferta'),
(1167, 'category_id=79', 'men-shirts'),
(1335, 'category_id=86', 'naplechnye-sumki'),
(1340, 'product_id=81', 'serezhki-chernyy-list'),
(1329, 'category_id=80', 'portfolios'),
(1332, 'category_id=88', 'klassicheskie-sumki'),
(1334, 'category_id=87', 'hobo'),
(1196, 'category_id=84', 'muzhskie-remni'),
(1304, 'product_id=74', 'chiffon-blouse'),
(1168, 'category_id=81', 'men-trousers'),
(1150, 'information_id=9', 'buyer-protection'),
(1327, 'category_id=89', 'sumki-tout'),
(1235, 'news_id=1', 'vidy-muzhskih-sumok'),
(1266, 'news_category_id=1', 'articles'),
(1226, 'news_id=2', 'vybor-sumki-dlya-puteshestviy'),
(1267, 'news_category_id=2', 'pomoshch-v-vybore-veshchi'),
(1236, 'news_id=3', 'tipy-koshelkov'),
(1232, 'news_id=4', 'kak-podobrat-sumochku'),
(1234, 'news_category_id=3', 'perevod-razmerov'),
(1338, 'category_id=90', 'zakolki-i-rezinki'),
(1314, 'category_id=91', 'sergi-i-kaffy'),
(1316, 'category_id=92', 'busy-i-kole'),
(1318, 'category_id=93', 'kolca'),
(1336, 'category_id=94', 'braslety'),
(1339, 'category_id=95', 'podveski'),
(1337, 'category_id=96', 'broshi'),
(1302, 'product_id=72', 'elegant-slim'),
(1364, 'product_id=73', 'party-dress'),
(1319, 'product_id=75', 'stars-printed-blouse'),
(1298, 'product_id=76', 't-shirt-blouse'),
(1312, 'category_id=97', 'nizhnee-bele-i-kupalniki'),
(1382, 'product_id=77', 'bikini-blue-pink'),
(1299, 'product_id=78', 'summer-short-sleeve-dress'),
(1323, 'product_id=80', 'pu-leather-clutch-handbag'),
(1341, 'product_id=82', 'zhenskiy-koshelek-klatch'),
(1343, 'product_id=83', 'zhenskiy-klatch-meshochek'),
(1344, 'product_id=84', 'zhenskiy-klatch-na-cepochke'),
(1347, 'product_id=85', 'zhenskaya-sumka-s-bantikom'),
(1348, 'product_id=86', 'sumka-s-bantom'),
(1349, 'product_id=87', 'sumochka-s-bantikom'),
(1354, 'product_id=88', 'stilnaya-sumka-s-bantikom'),
(1353, 'product_id=89', 'sumka-s-bantikom'),
(1352, 'product_id=90', 'sumka-s-bantikom-bez-zamkov'),
(1355, 'product_id=91', 'retro-sumka'),
(1357, 'product_id=92', 'sumka-meshok'),
(1359, 'product_id=93', 'sumka-s-vnutrennimi-ruchkami'),
(1360, 'product_id=94', 'klatch-s-universalnym-remeshkom'),
(1363, 'product_id=96', 'klatch-sumochka-1'),
(1366, 'product_id=97', 'mini-sumochka-s-blestkami'),
(1367, 'product_id=98', 'mini-sumochka'),
(1370, 'product_id=99', 'mini-sumochka-2'),
(1374, 'product_id=100', 'vintage-long-sleeve'),
(1376, 'product_id=101', 'multilayer-bracelet'),
(1383, 'product_id=103', 'sumka-organizator'),
(1385, 'product_id=104', 'sumka-dlya-chemodana'),
(1386, 'product_id=105', 'sumka-portfel'),
(1387, 'product_id=106', 'mini-portfel'),
(1388, 'product_id=107', 'portfel-panda'),
(1389, 'product_id=108', 'portfel-s-usami'),
(1392, 'product_id=109', 'portfel-s-dvumya-polosami'),
(1397, 'product_id=110', 'zhenskiy-ryukzak'),
(1398, 'product_id=111', 'ryukzak-3d-utenok'),
(1400, 'product_id=112', 'ryukzaki-raznyh-rascvetok'),
(1404, 'product_id=114', 'ryukzak-s-pugovicami'),
(1405, 'product_id=115', 'portfel-s-ochkami-i-usami'),
(1406, 'product_id=116', 'ryukzak-lisa'),
(1407, 'product_id=117', 'plate-s-dlinnym-rukavom-i-kruzhevom'),
(1408, 'product_id=118', 'dlinnoe-plate'),
(1409, 'product_id=119', 'krasochnoe-plate'),
(1410, 'product_id=120', 'plate-s-kruzhevnym-vyrezom');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'Dwg.5fUzkV*qx@8', '1c53910624b8ad56bf4083a4339aaba20edc843a', 'c476ad65f', '12345', '12345', 'zhdanovich_artur@mail.ru', '', '86.57.183.238', 1, '2013-12-13 13:21:59'),
(2, 11, 'admin', '1a779c27b453635503dd72e16372f3523ae2a554', 'fdaaa2d9b', '12345', '12345', 'mail.rumus.by', '', '46.191.3.61', 1, '2014-01-08 01:39:19');

-- --------------------------------------------------------

--
-- Структура таблицы `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `user_group`
--

INSERT INTO `user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Главный администратор', 'a:2:{s:6:"access";a:164:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:29:"catalog/attribute_group_quick";i:3;s:23:"catalog/attribute_quick";i:4;s:16:"catalog/category";i:5;s:22:"catalog/category_quick";i:6;s:16:"catalog/download";i:7;s:14:"catalog/filter";i:8;s:20:"catalog/filter_quick";i:9;s:19:"catalog/information";i:10;s:25:"catalog/information_quick";i:11;s:20:"catalog/manufacturer";i:12;s:26:"catalog/manufacturer_quick";i:13;s:12:"catalog/news";i:14;s:21:"catalog/news_category";i:15;s:20:"catalog/news_comment";i:16;s:14:"catalog/option";i:17;s:20:"catalog/option_quick";i:18;s:15:"catalog/product";i:19;s:21:"catalog/product_quick";i:20;s:14:"catalog/review";i:21;s:20:"catalog/review_quick";i:22;s:15:"catalog/sitemap";i:23;s:18:"common/filemanager";i:24;s:13:"design/banner";i:25;s:13:"design/layout";i:26;s:14:"extension/feed";i:27;s:16:"extension/module";i:28;s:17:"extension/payment";i:29;s:18:"extension/shipping";i:30;s:15:"extension/total";i:31;s:19:"extension/vk_export";i:32;s:16:"feed/google_base";i:33;s:19:"feed/google_sitemap";i:34;s:20:"localisation/country";i:35;s:21:"localisation/currency";i:36;s:21:"localisation/geo_zone";i:37;s:21:"localisation/language";i:38;s:25:"localisation/length_class";i:39;s:25:"localisation/order_status";i:40;s:26:"localisation/return_action";i:41;s:26:"localisation/return_reason";i:42;s:26:"localisation/return_status";i:43;s:25:"localisation/stock_status";i:44;s:22:"localisation/tax_class";i:45;s:21:"localisation/tax_rate";i:46;s:25:"localisation/weight_class";i:47;s:17:"localisation/zone";i:48;s:14:"module/account";i:49;s:16:"module/affiliate";i:50;s:17:"module/amazonmenu";i:51;s:13:"module/banner";i:52;s:17:"module/bestseller";i:53;s:15:"module/callback";i:54;s:15:"module/carousel";i:55;s:15:"module/category";i:56;s:15:"module/featured";i:57;s:13:"module/filter";i:58;s:16:"module/filterpro";i:59;s:18:"module/google_talk";i:60;s:18:"module/information";i:61;s:15:"module/lastview";i:62;s:13:"module/latest";i:63;s:20:"module/needlessimage";i:64;s:20:"module/news_category";i:65;s:20:"module/news_featured";i:66;s:18:"module/news_latest";i:67;s:23:"module/product_stickers";i:68;s:25:"module/quick_registration";i:69;s:17:"module/quick_view";i:70;s:16:"module/slideshow";i:71;s:14:"module/special";i:72;s:12:"module/store";i:73;s:16:"module/supermenu";i:74;s:9:"module/vk";i:75;s:16:"module/vk_export";i:76;s:14:"module/welcome";i:77;s:24:"payment/authorizenet_aim";i:78;s:21:"payment/bank_transfer";i:79;s:14:"payment/cheque";i:80;s:11:"payment/cod";i:81;s:21:"payment/free_checkout";i:82;s:18:"payment/interkassa";i:83;s:22:"payment/klarna_account";i:84;s:22:"payment/klarna_invoice";i:85;s:14:"payment/liqpay";i:86;s:20:"payment/moneybookers";i:87;s:14:"payment/nochex";i:88;s:13:"payment/onpay";i:89;s:15:"payment/pay2pay";i:90;s:15:"payment/paymate";i:91;s:16:"payment/paypoint";i:92;s:13:"payment/payza";i:93;s:26:"payment/perpetual_payments";i:94;s:14:"payment/pp_pro";i:95;s:17:"payment/pp_pro_uk";i:96;s:19:"payment/pp_standard";i:97;s:12:"payment/qiwi";i:98;s:17:"payment/robokassa";i:99;s:15:"payment/sagepay";i:100;s:22:"payment/sagepay_direct";i:101;s:18:"payment/sagepay_us";i:102;s:25:"payment/sberbank_transfer";i:103;s:19:"payment/twocheckout";i:104;s:28:"payment/web_payment_software";i:105;s:20:"payment/webmoney_wme";i:106;s:20:"payment/webmoney_wmr";i:107;s:20:"payment/webmoney_wmu";i:108;s:20:"payment/webmoney_wmz";i:109;s:16:"payment/worldpay";i:110;s:27:"report/affiliate_commission";i:111;s:22:"report/customer_credit";i:112;s:22:"report/customer_online";i:113;s:21:"report/customer_order";i:114;s:22:"report/customer_reward";i:115;s:24:"report/product_purchased";i:116;s:21:"report/product_viewed";i:117;s:18:"report/sale_coupon";i:118;s:17:"report/sale_order";i:119;s:18:"report/sale_return";i:120;s:20:"report/sale_shipping";i:121;s:15:"report/sale_tax";i:122;s:14:"sale/affiliate";i:123;s:12:"sale/contact";i:124;s:11:"sale/coupon";i:125;s:13:"sale/customer";i:126;s:20:"sale/customer_ban_ip";i:127;s:19:"sale/customer_group";i:128;s:10:"sale/order";i:129;s:11:"sale/return";i:130;s:12:"sale/voucher";i:131;s:18:"sale/voucher_theme";i:132;s:15:"setting/setting";i:133;s:13:"setting/store";i:134;s:16:"shipping/auspost";i:135;s:17:"shipping/citylink";i:136;s:14:"shipping/fedex";i:137;s:13:"shipping/flat";i:138;s:13:"shipping/free";i:139;s:13:"shipping/item";i:140;s:23:"shipping/parcelforce_48";i:141;s:15:"shipping/pickup";i:142;s:19:"shipping/royal_mail";i:143;s:12:"shipping/ups";i:144;s:13:"shipping/usps";i:145;s:15:"shipping/weight";i:146;s:11:"tool/backup";i:147;s:17:"tool/control_unit";i:148;s:14:"tool/error_log";i:149;s:11:"tool/export";i:150;s:16:"tool/seo_manager";i:151;s:12:"total/coupon";i:152;s:12:"total/credit";i:153;s:14:"total/handling";i:154;s:16:"total/klarna_fee";i:155;s:19:"total/low_order_fee";i:156;s:12:"total/reward";i:157;s:14:"total/shipping";i:158;s:15:"total/sub_total";i:159;s:9:"total/tax";i:160;s:11:"total/total";i:161;s:13:"total/voucher";i:162;s:9:"user/user";i:163;s:20:"user/user_permission";}s:6:"modify";a:164:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:29:"catalog/attribute_group_quick";i:3;s:23:"catalog/attribute_quick";i:4;s:16:"catalog/category";i:5;s:22:"catalog/category_quick";i:6;s:16:"catalog/download";i:7;s:14:"catalog/filter";i:8;s:20:"catalog/filter_quick";i:9;s:19:"catalog/information";i:10;s:25:"catalog/information_quick";i:11;s:20:"catalog/manufacturer";i:12;s:26:"catalog/manufacturer_quick";i:13;s:12:"catalog/news";i:14;s:21:"catalog/news_category";i:15;s:20:"catalog/news_comment";i:16;s:14:"catalog/option";i:17;s:20:"catalog/option_quick";i:18;s:15:"catalog/product";i:19;s:21:"catalog/product_quick";i:20;s:14:"catalog/review";i:21;s:20:"catalog/review_quick";i:22;s:15:"catalog/sitemap";i:23;s:18:"common/filemanager";i:24;s:13:"design/banner";i:25;s:13:"design/layout";i:26;s:14:"extension/feed";i:27;s:16:"extension/module";i:28;s:17:"extension/payment";i:29;s:18:"extension/shipping";i:30;s:15:"extension/total";i:31;s:19:"extension/vk_export";i:32;s:16:"feed/google_base";i:33;s:19:"feed/google_sitemap";i:34;s:20:"localisation/country";i:35;s:21:"localisation/currency";i:36;s:21:"localisation/geo_zone";i:37;s:21:"localisation/language";i:38;s:25:"localisation/length_class";i:39;s:25:"localisation/order_status";i:40;s:26:"localisation/return_action";i:41;s:26:"localisation/return_reason";i:42;s:26:"localisation/return_status";i:43;s:25:"localisation/stock_status";i:44;s:22:"localisation/tax_class";i:45;s:21:"localisation/tax_rate";i:46;s:25:"localisation/weight_class";i:47;s:17:"localisation/zone";i:48;s:14:"module/account";i:49;s:16:"module/affiliate";i:50;s:17:"module/amazonmenu";i:51;s:13:"module/banner";i:52;s:17:"module/bestseller";i:53;s:15:"module/callback";i:54;s:15:"module/carousel";i:55;s:15:"module/category";i:56;s:15:"module/featured";i:57;s:13:"module/filter";i:58;s:16:"module/filterpro";i:59;s:18:"module/google_talk";i:60;s:18:"module/information";i:61;s:15:"module/lastview";i:62;s:13:"module/latest";i:63;s:20:"module/needlessimage";i:64;s:20:"module/news_category";i:65;s:20:"module/news_featured";i:66;s:18:"module/news_latest";i:67;s:23:"module/product_stickers";i:68;s:25:"module/quick_registration";i:69;s:17:"module/quick_view";i:70;s:16:"module/slideshow";i:71;s:14:"module/special";i:72;s:12:"module/store";i:73;s:16:"module/supermenu";i:74;s:9:"module/vk";i:75;s:16:"module/vk_export";i:76;s:14:"module/welcome";i:77;s:24:"payment/authorizenet_aim";i:78;s:21:"payment/bank_transfer";i:79;s:14:"payment/cheque";i:80;s:11:"payment/cod";i:81;s:21:"payment/free_checkout";i:82;s:18:"payment/interkassa";i:83;s:22:"payment/klarna_account";i:84;s:22:"payment/klarna_invoice";i:85;s:14:"payment/liqpay";i:86;s:20:"payment/moneybookers";i:87;s:14:"payment/nochex";i:88;s:13:"payment/onpay";i:89;s:15:"payment/pay2pay";i:90;s:15:"payment/paymate";i:91;s:16:"payment/paypoint";i:92;s:13:"payment/payza";i:93;s:26:"payment/perpetual_payments";i:94;s:14:"payment/pp_pro";i:95;s:17:"payment/pp_pro_uk";i:96;s:19:"payment/pp_standard";i:97;s:12:"payment/qiwi";i:98;s:17:"payment/robokassa";i:99;s:15:"payment/sagepay";i:100;s:22:"payment/sagepay_direct";i:101;s:18:"payment/sagepay_us";i:102;s:25:"payment/sberbank_transfer";i:103;s:19:"payment/twocheckout";i:104;s:28:"payment/web_payment_software";i:105;s:20:"payment/webmoney_wme";i:106;s:20:"payment/webmoney_wmr";i:107;s:20:"payment/webmoney_wmu";i:108;s:20:"payment/webmoney_wmz";i:109;s:16:"payment/worldpay";i:110;s:27:"report/affiliate_commission";i:111;s:22:"report/customer_credit";i:112;s:22:"report/customer_online";i:113;s:21:"report/customer_order";i:114;s:22:"report/customer_reward";i:115;s:24:"report/product_purchased";i:116;s:21:"report/product_viewed";i:117;s:18:"report/sale_coupon";i:118;s:17:"report/sale_order";i:119;s:18:"report/sale_return";i:120;s:20:"report/sale_shipping";i:121;s:15:"report/sale_tax";i:122;s:14:"sale/affiliate";i:123;s:12:"sale/contact";i:124;s:11:"sale/coupon";i:125;s:13:"sale/customer";i:126;s:20:"sale/customer_ban_ip";i:127;s:19:"sale/customer_group";i:128;s:10:"sale/order";i:129;s:11:"sale/return";i:130;s:12:"sale/voucher";i:131;s:18:"sale/voucher_theme";i:132;s:15:"setting/setting";i:133;s:13:"setting/store";i:134;s:16:"shipping/auspost";i:135;s:17:"shipping/citylink";i:136;s:14:"shipping/fedex";i:137;s:13:"shipping/flat";i:138;s:13:"shipping/free";i:139;s:13:"shipping/item";i:140;s:23:"shipping/parcelforce_48";i:141;s:15:"shipping/pickup";i:142;s:19:"shipping/royal_mail";i:143;s:12:"shipping/ups";i:144;s:13:"shipping/usps";i:145;s:15:"shipping/weight";i:146;s:11:"tool/backup";i:147;s:17:"tool/control_unit";i:148;s:14:"tool/error_log";i:149;s:11:"tool/export";i:150;s:16:"tool/seo_manager";i:151;s:12:"total/coupon";i:152;s:12:"total/credit";i:153;s:14:"total/handling";i:154;s:16:"total/klarna_fee";i:155;s:19:"total/low_order_fee";i:156;s:12:"total/reward";i:157;s:14:"total/shipping";i:158;s:15:"total/sub_total";i:159;s:9:"total/tax";i:160;s:11:"total/total";i:161;s:13:"total/voucher";i:162;s:9:"user/user";i:163;s:20:"user/user_permission";}}'),
(10, 'Демонстрация', ''),
(11, 'менеджер', 'a:2:{s:6:"access";a:113:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:29:"catalog/attribute_group_quick";i:3;s:23:"catalog/attribute_quick";i:4;s:16:"catalog/category";i:5;s:22:"catalog/category_quick";i:6;s:16:"catalog/download";i:7;s:14:"catalog/filter";i:8;s:20:"catalog/filter_quick";i:9;s:19:"catalog/information";i:10;s:25:"catalog/information_quick";i:11;s:20:"catalog/manufacturer";i:12;s:26:"catalog/manufacturer_quick";i:13;s:12:"catalog/news";i:14;s:21:"catalog/news_category";i:15;s:20:"catalog/news_comment";i:16;s:14:"catalog/option";i:17;s:20:"catalog/option_quick";i:18;s:15:"catalog/product";i:19;s:21:"catalog/product_quick";i:20;s:14:"catalog/review";i:21;s:20:"catalog/review_quick";i:22;s:18:"common/filemanager";i:23;s:14:"extension/feed";i:24;s:16:"extension/module";i:25;s:17:"extension/payment";i:26;s:18:"extension/shipping";i:27;s:15:"extension/total";i:28;s:24:"payment/authorizenet_aim";i:29;s:21:"payment/bank_transfer";i:30;s:14:"payment/cheque";i:31;s:11:"payment/cod";i:32;s:21:"payment/free_checkout";i:33;s:18:"payment/interkassa";i:34;s:22:"payment/klarna_account";i:35;s:22:"payment/klarna_invoice";i:36;s:14:"payment/liqpay";i:37;s:20:"payment/moneybookers";i:38;s:14:"payment/nochex";i:39;s:13:"payment/onpay";i:40;s:15:"payment/pay2pay";i:41;s:15:"payment/paymate";i:42;s:16:"payment/paypoint";i:43;s:13:"payment/payza";i:44;s:26:"payment/perpetual_payments";i:45;s:14:"payment/pp_pro";i:46;s:17:"payment/pp_pro_uk";i:47;s:19:"payment/pp_standard";i:48;s:12:"payment/qiwi";i:49;s:17:"payment/robokassa";i:50;s:15:"payment/sagepay";i:51;s:22:"payment/sagepay_direct";i:52;s:18:"payment/sagepay_us";i:53;s:25:"payment/sberbank_transfer";i:54;s:19:"payment/twocheckout";i:55;s:28:"payment/web_payment_software";i:56;s:20:"payment/webmoney_wme";i:57;s:20:"payment/webmoney_wmr";i:58;s:20:"payment/webmoney_wmu";i:59;s:20:"payment/webmoney_wmz";i:60;s:16:"payment/worldpay";i:61;s:27:"report/affiliate_commission";i:62;s:22:"report/customer_credit";i:63;s:22:"report/customer_online";i:64;s:21:"report/customer_order";i:65;s:22:"report/customer_reward";i:66;s:24:"report/product_purchased";i:67;s:21:"report/product_viewed";i:68;s:18:"report/sale_coupon";i:69;s:17:"report/sale_order";i:70;s:18:"report/sale_return";i:71;s:20:"report/sale_shipping";i:72;s:15:"report/sale_tax";i:73;s:14:"sale/affiliate";i:74;s:12:"sale/contact";i:75;s:11:"sale/coupon";i:76;s:13:"sale/customer";i:77;s:20:"sale/customer_ban_ip";i:78;s:19:"sale/customer_group";i:79;s:10:"sale/order";i:80;s:11:"sale/return";i:81;s:12:"sale/voucher";i:82;s:18:"sale/voucher_theme";i:83;s:15:"setting/setting";i:84;s:13:"setting/store";i:85;s:16:"shipping/auspost";i:86;s:17:"shipping/citylink";i:87;s:14:"shipping/fedex";i:88;s:13:"shipping/flat";i:89;s:13:"shipping/free";i:90;s:13:"shipping/item";i:91;s:23:"shipping/parcelforce_48";i:92;s:15:"shipping/pickup";i:93;s:19:"shipping/royal_mail";i:94;s:12:"shipping/ups";i:95;s:13:"shipping/usps";i:96;s:15:"shipping/weight";i:97;s:11:"tool/backup";i:98;s:17:"tool/control_unit";i:99;s:14:"tool/error_log";i:100;s:11:"tool/export";i:101;s:16:"tool/seo_manager";i:102;s:12:"total/coupon";i:103;s:12:"total/credit";i:104;s:14:"total/handling";i:105;s:16:"total/klarna_fee";i:106;s:19:"total/low_order_fee";i:107;s:12:"total/reward";i:108;s:14:"total/shipping";i:109;s:15:"total/sub_total";i:110;s:9:"total/tax";i:111;s:11:"total/total";i:112;s:13:"total/voucher";}s:6:"modify";a:75:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:29:"catalog/attribute_group_quick";i:3;s:23:"catalog/attribute_quick";i:4;s:16:"catalog/category";i:5;s:22:"catalog/category_quick";i:6;s:16:"catalog/download";i:7;s:14:"catalog/filter";i:8;s:20:"catalog/filter_quick";i:9;s:19:"catalog/information";i:10;s:25:"catalog/information_quick";i:11;s:20:"catalog/manufacturer";i:12;s:26:"catalog/manufacturer_quick";i:13;s:12:"catalog/news";i:14;s:21:"catalog/news_category";i:15;s:20:"catalog/news_comment";i:16;s:14:"catalog/option";i:17;s:20:"catalog/option_quick";i:18;s:15:"catalog/product";i:19;s:21:"catalog/product_quick";i:20;s:14:"catalog/review";i:21;s:20:"catalog/review_quick";i:22;s:18:"common/filemanager";i:23;s:14:"extension/feed";i:24;s:16:"extension/module";i:25;s:17:"extension/payment";i:26;s:18:"extension/shipping";i:27;s:15:"extension/total";i:28;s:27:"report/affiliate_commission";i:29;s:22:"report/customer_credit";i:30;s:22:"report/customer_online";i:31;s:21:"report/customer_order";i:32;s:22:"report/customer_reward";i:33;s:24:"report/product_purchased";i:34;s:21:"report/product_viewed";i:35;s:18:"report/sale_coupon";i:36;s:17:"report/sale_order";i:37;s:18:"report/sale_return";i:38;s:20:"report/sale_shipping";i:39;s:15:"report/sale_tax";i:40;s:14:"sale/affiliate";i:41;s:12:"sale/contact";i:42;s:11:"sale/coupon";i:43;s:13:"sale/customer";i:44;s:20:"sale/customer_ban_ip";i:45;s:19:"sale/customer_group";i:46;s:10:"sale/order";i:47;s:11:"sale/return";i:48;s:12:"sale/voucher";i:49;s:18:"sale/voucher_theme";i:50;s:15:"setting/setting";i:51;s:13:"setting/store";i:52;s:16:"shipping/auspost";i:53;s:17:"shipping/citylink";i:54;s:14:"shipping/fedex";i:55;s:13:"shipping/flat";i:56;s:13:"shipping/free";i:57;s:13:"shipping/item";i:58;s:23:"shipping/parcelforce_48";i:59;s:15:"shipping/pickup";i:60;s:19:"shipping/royal_mail";i:61;s:12:"shipping/ups";i:62;s:13:"shipping/usps";i:63;s:15:"shipping/weight";i:64;s:12:"total/coupon";i:65;s:12:"total/credit";i:66;s:14:"total/handling";i:67;s:16:"total/klarna_fee";i:68;s:19:"total/low_order_fee";i:69;s:12:"total/reward";i:70;s:14:"total/shipping";i:71;s:15:"total/sub_total";i:72;s:9:"total/tax";i:73;s:11:"total/total";i:74;s:13:"total/voucher";}}');

-- --------------------------------------------------------

--
-- Структура таблицы `voucher`
--

CREATE TABLE IF NOT EXISTS `voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `voucher_history`
--

CREATE TABLE IF NOT EXISTS `voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `voucher_theme`
--

CREATE TABLE IF NOT EXISTS `voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `voucher_theme`
--

INSERT INTO `voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'data/demo/canon_eos_5d_2.jpg'),
(7, 'data/demo/gift-voucher-birthday.jpg'),
(6, 'data/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `voucher_theme_description`
--

INSERT INTO `voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Новый год'),
(7, 1, 'День рождения'),
(8, 1, 'Общий');

-- --------------------------------------------------------

--
-- Структура таблицы `weight_class`
--

CREATE TABLE IF NOT EXISTS `weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `weight_class`
--

INSERT INTO `weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000');

-- --------------------------------------------------------

--
-- Структура таблицы `weight_class_description`
--

CREATE TABLE IF NOT EXISTS `weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `weight_class_description`
--

INSERT INTO `weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Килограммы', 'кг'),
(2, 1, 'Граммы', 'г');

-- --------------------------------------------------------

--
-- Структура таблицы `zone`
--

CREATE TABLE IF NOT EXISTS `zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4036 ;

--
-- Дамп данных таблицы `zone`
--

INSERT INTO `zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(337, 20, 'Брестсая область', 'BR', 1),
(338, 20, 'Гомельская область', 'HO', 1),
(339, 20, 'Минск', 'HM', 1),
(340, 20, 'Гродненская область', 'HR', 1),
(341, 20, 'Могилевская область', 'MA', 1),
(342, 20, 'Минская область', 'MI', 1),
(343, 20, 'Витебская область', 'VI', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

-- --------------------------------------------------------

--
-- Структура для представления `needlessimage_view`
--
DROP TABLE IF EXISTS `needlessimage_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`rumusby_ZwptxEvT`@`localhost` SQL SECURITY DEFINER VIEW `needlessimage_view` AS select distinct `banner_image`.`image` AS `image` from `banner_image` where (`banner_image`.`image` like 'data/%') union select distinct `category`.`image` AS `image` from `category` where (`category`.`image` like 'data/%') union select distinct `download`.`filename` AS `image` from `download` where (`download`.`filename` like 'data/%') union select distinct `manufacturer`.`image` AS `image` from `manufacturer` where (`manufacturer`.`image` like 'data/%') union select distinct `option_value`.`image` AS `image` from `option_value` where (`option_value`.`image` like 'data/%') union select distinct `order_download`.`filename` AS `image` from `order_download` where (`order_download`.`filename` like 'data/%') union select distinct `product`.`image` AS `image` from `product` where (`product`.`image` like 'data/%') union select distinct `product_image`.`image` AS `image` from `product_image` where (`product_image`.`image` like 'data/%') union select distinct `setting`.`value` AS `image` from `setting` where (`setting`.`value` like 'data/%') union select distinct `voucher_theme`.`image` AS `image` from `voucher_theme` where (`voucher_theme`.`image` like 'data/%');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
