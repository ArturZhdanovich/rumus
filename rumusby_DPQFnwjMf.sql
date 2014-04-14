-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 14 2014 г., 14:20
-- Версия сервера: 5.5.35-log
-- Версия PHP: 5.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `rumus`
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `address`
--

INSERT INTO `address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `company_id`, `tax_id`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`) VALUES
(1, 1, 'Дмитрий, Федорович', 'Романовский', '', '', '', 'а/я 58', '', 'Витебск', '210009', 20, 343),
(3, 3, 'Нюта', 'Симакова', '', '', '', 'ул Октябрьская 30 кв 66', '', 'Гомель ', '247120', 20, 338),
(4, 4, 'Светлана Валерьевна', 'Радион', '', '', '', 'Гродненская область', '', 'Волковыск', '231900', 20, 340),
(5, 5, 'Лидия Валерьевна', 'Музыка', '', '', '', 'ул.Шоссейная, д.13', '', 'Кричев', '213491', 20, 341),
(6, 6, 'Вероника Николаевна', 'Артемова', '', '', '', 'ул. королева,  18-28', '', 'Могилёв', '212033', 20, 341),
(2, 2, 'Артур Витальевич', 'Жданович', '', '', '', 'ул. Лазо д.10 корп.2 кв. 41', '', 'Витебск', '210033', 20, 343),
(7, 7, 'татьяна', 'чернявская', '', '', '', 'ул.Зыгина,2а,кв.1', '', 'полоцк', '211413', 20, 343);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=139 ;

--
-- Дамп данных таблицы `banner_image`
--

INSERT INTO `banner_image` (`banner_image_id`, `banner_id`, `link`, `image`) VALUES
(77, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'data/demo/hp_banner.jpg'),
(138, 7, 'http://rumus.by/bijouterie/', 'data/5.jpg'),
(137, 7, 'http://rumus.by/accessories/', 'data/4.jpg'),
(98, 8, 'http://rumus.by/eva_style', 'data/im/eva_style.png'),
(95, 8, 'http://rumus.by/dress_code', 'data/im/dress_code.png'),
(96, 8, 'http://rumus.by/gepur', 'data/im/gepur.png'),
(97, 8, 'http://rumus.by/%20larionoff', 'data/im/larionoff.png'),
(136, 7, 'http://rumus.by/men/', 'data/2.jpg'),
(134, 7, 'http://rumus.by/women/', 'data/1.jpg'),
(135, 7, 'http://rumus.by/bag/', 'data/3.jpg');

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
(138, 1, 7, 'bijouterie'),
(77, 1, 6, 'HP Banner'),
(97, 1, 8, 'Larionoff'),
(96, 1, 8, 'Gepur'),
(95, 1, 8, 'Dress Code'),
(137, 1, 7, 'accessories'),
(136, 1, 7, 'men'),
(98, 1, 8, 'Eva Style'),
(135, 1, 7, 'bag'),
(134, 1, 7, 'women');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;

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
(59, 'data/ic/w_шорты.jpg', 1, 0, 1, 0, 1, '2013-12-30 12:03:51', '2014-03-26 14:43:28'),
(60, 'data/ic/w_кофты.jpg', 1, 0, 1, 0, 1, '2013-12-30 12:04:30', '2014-03-26 14:46:40'),
(62, 'data/ic/w_топы.jpg', 1, 0, 1, 0, 1, '2013-12-30 12:06:06', '2014-01-31 02:24:58'),
(63, 'data/ic/w_юбки.jpg', 1, 0, 1, 0, 1, '2013-12-30 12:06:39', '2014-01-30 06:41:56'),
(79, 'data/ic/m_рубашки.jpg', 18, 0, 1, 0, 1, '2014-01-10 09:00:07', '2014-01-30 06:32:42'),
(66, 'data/ic/w_толстовки.jpg', 1, 0, 1, 0, 1, '2013-12-30 12:13:05', '2014-04-10 05:04:59'),
(67, 'data/ic/a_шапки.jpg', 57, 0, 1, 0, 1, '2013-12-30 12:13:44', '2014-02-10 06:56:20'),
(26, 'data/ic/w_платья.jpg', 1, 0, 0, 1, 1, '2009-01-31 01:55:14', '2014-01-30 06:36:43'),
(27, 'data/ic/w_блузы.jpg', 1, 0, 0, 2, 1, '2009-01-31 01:55:34', '2014-01-31 02:28:34'),
(28, 'data/ic/b_дорожные_сумки.jpg', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2014-02-11 05:52:47'),
(32, 'data/ic/b_клатчи.jpg', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2014-03-21 13:29:43'),
(68, 'data/ic/aw_ремени.jpg', 57, 0, 1, 0, 1, '2013-12-30 12:17:40', '2014-02-03 02:16:15'),
(78, 'data/ic/m_пиджак.jpg', 18, 0, 1, 0, 1, '2014-01-10 08:54:59', '2014-02-03 01:50:03'),
(76, '', 0, 1, 1, 5, 1, '2014-01-03 08:22:45', '2014-02-10 06:25:22'),
(72, 'data/ic/aw_часы.jpg', 57, 0, 1, 0, 1, '2013-12-30 12:18:54', '2014-02-03 02:17:13'),
(82, 'data/ic/w_жакеты.jpg', 1, 0, 1, 0, 1, '2014-01-30 06:35:40', '2014-02-04 01:57:23'),
(80, 'data/ic/b_портфели.jpg', 25, 0, 1, 0, 1, '2014-01-12 09:46:14', '2014-03-21 13:47:47'),
(81, 'data/ic/m_штаны.jpg', 18, 0, 1, 0, 1, '2014-01-17 00:33:35', '2014-03-22 15:13:58'),
(83, 'data/ic/am_часы.jpg', 57, 0, 1, 0, 1, '2014-02-03 02:17:54', '2014-02-03 02:17:54'),
(84, 'data/ic/am_ремени.jpg', 57, 0, 1, 0, 1, '2014-02-03 02:18:43', '2014-02-03 02:20:38'),
(88, 'data/ic/bm_классическая.jpg', 25, 0, 1, 0, 1, '2014-02-06 04:32:58', '2014-03-21 13:26:45'),
(90, 'data/ic/j_заколки-и-резинки.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:47:09', '2014-02-15 08:04:54'),
(91, 'data/ic/j_сережки.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:54:20', '2014-02-10 06:51:19'),
(92, 'data/ic/j_бусы-и-колье.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:57:55', '2014-02-10 06:52:56'),
(93, 'data/ic/j_кольца.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:58:08', '2014-02-10 13:26:58'),
(94, 'data/ic/j_браслеты.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:58:27', '2014-02-15 08:03:52'),
(95, 'data/ic/j_подвески.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:58:43', '2014-02-15 08:05:30'),
(96, 'data/ic/j_броши.jpg', 76, 0, 1, 0, 1, '2014-02-07 04:58:51', '2014-02-15 08:04:15'),
(97, 'data/ic/w_нижнее-белье.jpg', 1, 0, 1, 0, 1, '2014-02-10 03:57:41', '2014-02-10 06:45:45'),
(101, 'data/ic/b_мужские_сумки.jpg', 25, 0, 1, 0, 1, '2014-03-21 13:34:57', '2014-03-22 15:20:42'),
(102, 'data/ic/b_кошельки.jpg', 25, 0, 1, 0, 1, '2014-03-21 13:41:11', '2014-03-22 15:23:06');

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
(32, 1, 'Клатчи', '', '', '', '', ''),
(28, 1, 'Дорожные сумки', '', '', '', '', ''),
(27, 1, 'Рубашки и блузы', '', '', '', '', ''),
(67, 1, 'Шапки и шарфики', '', '', '', '', ''),
(26, 1, 'Платья', '', '', '', '', ''),
(66, 1, 'Байки и толстовки', '', '', '', '', ''),
(78, 1, 'Пиджаки', '', '', '', '', ''),
(63, 1, 'Юбки', '', '', '', '', ''),
(60, 1, 'Кофты и туники', '', '', '', '', ''),
(68, 1, 'Женские ремни', '', '', '', '', ''),
(62, 1, 'Футболки и топы', '', '', '', '', ''),
(59, 1, 'Шорты и брюки', '', 'Шорты и брюки', 'Шорты и брюки', 'Шорты и брюки', 'Шорты и брюки'),
(75, 1, 'Футболки', '', '', '', '', ''),
(74, 1, 'Байки', '', '', '', '', ''),
(46, 1, 'Свитера и кардиганы', '', '', '', '', ''),
(73, 1, 'Жилетки', '', '', '', '', ''),
(18, 1, 'Мужская одежда', '&lt;p&gt;Мужчина должен выглядеть стильно. И это уже не нонсенс, а жизненная необходимость. Многие мужчины стали всерьез задумываться о своем внешнем виде, однако где же купить стильную и модную одежду? В рубрике «мужская одежда» ― вы найдете вещи высокого качества на все случаи жизни, которые комфортны, элегантны и практичны. Благодаря широчайшему размерному ряду, каждый мужчина сможет найти здесь костюмы и рубашки будто сшитые специально для него.&lt;/p&gt;\r\n', 'В рубрике «мужская одежда» ― вы найдете вещи высокого качества на все случаи жизни, которые комфортны, элегантны и практичны.', 'Мужская одежда Байки Жилетки Пиджаки Футболки Кардиганы Пальто', 'Мужская одежда', 'Мужская одежда'),
(25, 1, 'Сумки', '&lt;p&gt;Мы рады приветствовать вас на страницах нашего каталога. Здесь вы найдете самые стильные и недорогие модели на все случаи жизни. Обилие цветовых решений и разнообразных дизайнерских приёмов позволяют подобрать сумку любому покупателю. Подберите себе классическую или молодежную сумку по цене, доступной вашему бюджету. Мы готовы предложить самые смелые и беспроигрышные варианты для вашего гардероба. Сумки из замши&amp;nbsp;и текстиля, клатчи и универсальные модели через плечо – выбирайте и заказывайте прямо сейчас! Насладитесь удобным и профессиональным сервисом от интернет магазина «Rumus».&lt;/p&gt;\r\n', 'Сумки из замши и текстиля, клатчи и универсальные модели через плечо – выбирайте и заказывайте прямо сейчас!', 'Сумки Клатчи Портфели', 'Сумки', 'Сумки'),
(79, 1, 'Рубашки', '', '', '', '', ''),
(57, 1, 'Аксессуары', '&lt;p&gt;Наш интернет магазин уделяет пристальное внимание самым мелким деталям, что делает каждую коллекцию идеальной для самодостаточных, решительных, энергичных современных людей с высокими запросами. Кроме того, сочетание качества и цены на одежду и аксессуары &amp;nbsp;в нашем магазине покажется оптимальным любому практичному человеку. Модные и дизайнерские акссесуары помогут Вам подчеркнуть свой неповторимый стиль, придадут Вашему внешнему виду изысканность и утонченность, выгодно выделят Вас из толпы, сохранив индивидуальность Вашего характера.&lt;/p&gt;\r\n', ' Модные и дизайнерские аксессуары.', 'Аксессуары Бижутерия Ремни Часы Шапки Шарфы', 'Аксессуары', 'Аксессуары'),
(1, 1, 'Женская одежда', '&lt;p&gt;«В гардеробе каждой женщины должно быть маленькое черное платье». Это утверждение Коко Шанель знает, пожалуй, каждая модница. Но ведь в одном платье далеко не уйдешь, да и аппетиты у современных женщин не ограничиваются одной лишь вещью в гардеробе. Перед началом каждой новой поры года модницы ломают головы и стаптывают не одни каблуки, прежде чем найти то, что ее действительно устроит, а именно качественную, стильную, желательно недорогую одежду. Однако, походы по магазинам отнимают много сил и времени. В рубрике «Женская одежда» Вы найдёте множество новых стильных, модных и невероятно красивых вещей от нижнего белья до верхней одежды, для того, чтобы всегда выглядеть на все сто!&lt;/p&gt;\r\n', 'Много новых стильных, модных и очень красивых вещей от нижнего белья до верхней одежды для современных девушек.', 'Женская одежда Платья Кофты Футболки Жакеты Юбки Толстовки', 'Женская одежда', 'Женская одежда'),
(80, 1, 'Рюкзаки', '', '', 'Рюкзаки', 'Рюкзаки', 'Рюкзаки'),
(81, 1, 'Брюки', '', '', 'Брюки', 'Брюки', 'Брюки'),
(82, 1, 'Жакеты', '', '', '', '', ''),
(72, 1, 'Женские часы', '', '', '', '', ''),
(83, 1, 'Мужские часы', '', '', '', '', ''),
(84, 1, 'Мужские ремни', '', '', '', '', ''),
(102, 1, 'Кошельки', '', '', '', 'Кошельки', ''),
(88, 1, 'Женские сумки', '&lt;p&gt;Сумка с плоским дном и двойными короткими ручками. Может быть любых размеров.&lt;/p&gt;\r\n', '', '', '', ''),
(90, 1, 'Заколки и Резинки', '', '', '', '', ''),
(91, 1, 'Серьги и Каффы', '', '', '', '', ''),
(92, 1, 'Бусы и колье', '', '', '', '', ''),
(93, 1, 'Кольца', '', '', '', '', ''),
(94, 1, 'Браслеты', '', '', '', '', ''),
(95, 1, 'Подвески', '', '', '', '', ''),
(96, 1, 'Броши', '', '', '', '', ''),
(97, 1, 'Нижнее белье и купальники', '', '', '', '', ''),
(101, 1, 'Мужские сумки', '', '', '', 'Мужские сумки', '');

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
(102, 102, 1),
(102, 25, 0),
(101, 101, 1),
(101, 25, 0),
(88, 25, 0),
(88, 88, 1),
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
(88, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(101, 0),
(102, 0);

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
(16, 'Валюты', 'data/icon/currency.png', 'localisation/currency', 1, 9),
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`customer_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `customer_group_id`, `ip`, `status`, `approved`, `token`, `date_added`) VALUES
(1, 0, 'Дмитрий, Федорович', 'Романовский', 'Dmitriy_r_f@mail.ru', '+375292181075', '', 'dace4bfd90a9b00e42ad1787630cac293e154e1c', '78ff25d6d', 'a:1:{i:73;i:1;}', 'a:0:{}', 0, 1, 1, '109.126.132.83', 1, 1, '', '2014-01-09 01:48:40'),
(2, 0, 'Артур Витальевич', 'Жданович', 'zhdanovich_artur@mail.ru', '8129882', '', '3fc39de0aa2ec17de94d7a3e8ebc3c32c74c71b3', '21c9ae425', 'a:1:{s:37:"1366:YToxOntpOjMyODtzOjM6IjM2NCI7fQ==";i:1;}', '', 0, 2, 1, '86.57.183.238', 1, 1, '', '2014-01-13 00:19:57'),
(3, 0, 'Нюта', 'Симакова', '221evgen221@mail.ru', '375256183931', '', 'e06dd8e1497316fba258c40b00a23d5e1c659629', '4be39b50f', 'a:0:{}', '', 0, 3, 1, '46.191.126.205', 1, 1, '', '2014-01-21 06:57:16'),
(4, 0, 'Светлана Валерьевна', 'Радион', 'swetkara@mail.ru', '80259758978', '', 'fb31c55025fdfb6e34c81d0e92d3592123071c06', '02aae8d46', 'a:0:{}', '', 0, 4, 1, '86.57.198.124', 1, 1, '', '2014-01-25 04:16:32'),
(5, 0, 'Лидия Валерьевна', 'Музыка', 'lida.muzyka@yandex.by', '+375297465813', '', '5d1a19c54da6b9fc1dd6694cb9c435206befc313', '44de18e6e', 'a:0:{}', 'a:1:{i:0;s:2:"80";}', 1, 5, 1, '82.145.218.205', 1, 1, '', '2014-02-06 02:48:22'),
(6, 0, 'Вероника Николаевна', 'Артемова', 'v_malvina@mail.ru', '+375297496609', '', 'e05c9e8faeb862822ce53cd0273b89861f2293ab', 'ba3d4122d', 'a:0:{}', '', 0, 6, 1, '178.168.248.83', 1, 1, '', '2014-02-10 05:24:56'),
(7, 0, 'татьяна', 'чернявская', 'tchernyavskaya@bk.ru', '80295127610', '', '9a2b97a694341515a3cd05a6a1633f679c7604a3', '47923f11c', 'a:0:{}', '', 0, 7, 1, '176.60.161.123', 1, 1, '', '2014-03-26 14:09:26');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

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
(27, 5, '82.145.216.125', '2014-02-24 12:49:11'),
(28, 5, '82.145.216.45', '2014-03-06 15:25:03'),
(29, 4, '86.57.198.124', '2014-03-18 14:57:55'),
(30, 7, '176.60.161.123', '2014-03-26 14:09:27'),
(31, 5, '82.145.218.205', '2014-04-01 14:16:12');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=464 ;

--
-- Дамп данных таблицы `extension`
--

INSERT INTO `extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(451, 'module', 'supermenu'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(459, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(449, 'module', 'news_category'),
(411, 'module', 'affiliate'),
(454, 'module', 'vk_export'),
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
(463, 'module', 'needlessimage'),
(455, 'module', 'russian_post_blanks'),
(458, 'module', 'google_talk'),
(460, 'module', 'banner');

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
(4, 1, 'О нас', '&lt;p&gt;&lt;span style=&quot;color: rgb(68, 68, 68); font-family: arial, sans-serif; font-size: small; line-height: 16px;&quot;&gt;Мечта&amp;nbsp;&lt;/span&gt;rumus.by =):&lt;/p&gt;\r\n\r\n&lt;p&gt;Мы стремимся сделать доступной для всех жителей Беларуси максимально широкий ассортимент качественной одежды, для заказа через интернет, предоставляем удобный сервис подбора товара.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;Для нас очень важен комфорт покупателей, мы стараемся быстро реагировать на все запросы и пожелания, постоянно работаем над улучшением наших сервисов и служб и всегда открыты для продуктивных предложений.&lt;/p&gt;\r\n\r\n&lt;p&gt;Всех посетителей магазина ждут различные регулярные акции и сезонные распродажи. Постоянные покупатели, совершившие покупки на сумму от 800 000 руб., получают специальную скидку в размере 5%.&lt;/p&gt;\r\n', '', '', '', ''),
(9, 1, 'Зашита покупателя', '&lt;p&gt;Возврат осуществляется и из-за ошибки со стороны Продавца.&lt;br /&gt;\r\nПричины для возврата по ошибке интернет-магазина rumus.by, в дальнейшем именуемого «Продавец»:&lt;br /&gt;\r\nнеправильная комплектация заказа;&lt;br /&gt;\r\nнеправильные размер, фасон, цвет, длина и т.п;&lt;/p&gt;\r\n\r\n&lt;p&gt;Возврат денежных средств Клиенту осуществляется в течение 10 календарных дней с момента фактического получения товара Продавцом.&lt;br /&gt;\r\nДоставка товара Продацу осуществляется за счет клиента.&lt;br /&gt;\r\nПри отправке почтой (Покупатель оплачивает почтовые услуги самостоятельно),пересылка осуществляется обычной доставкой. Достака наложенным платежем не принимается, и задержит получение денег до двух месяцев.&lt;/p&gt;\r\n\r\n&lt;p&gt;Качественные товары, не подлежащие обмену и возврату, указаны в Перечне, утвержденном Советом Министров Республики Беларусь от 14 июня 2002 года № 778.&lt;/p&gt;\r\n\r\n&lt;p&gt;Срок возврата товара ограничен двумя неделями, со дня получения товара.&lt;/p&gt;\r\n\r\n&lt;p&gt;Обращаем Ваше внимание на то, что Требование потребителя об обмене либо возврате товара подлежит удовлетворению, если Товар не был в употреблении, сохранены его потребительские свойства и имеются доказательства приобретения его у данного продавца.&lt;br /&gt;\r\n(Ст. 28 З-на РБ О ЗПП).&lt;/p&gt;\r\n', '', '', '', ''),
(8, 1, 'Контакты', '&lt;div id=&quot;contact_left&quot;&gt;\r\n&lt;p&gt;Телефоны:&amp;nbsp;&lt;br /&gt;\r\n+37529 218 10 75 МТС&lt;br /&gt;\r\n+37529 138 10 75 VELCOM&lt;/p&gt;\r\n\r\n&lt;p&gt;email:&amp;nbsp;&lt;br /&gt;\r\n&lt;a href=&quot;mailto:mail@rumus.by&quot; style=&quot;line-height: 1.6em;&quot;&gt;mail@rumus.by&lt;/a&gt;&lt;/p&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div id=&quot;clock&quot;&gt;&lt;object data=&quot;http://agitki.ru/_ld/8/848_flash_clock.swf&quot; height=&quot;167&quot; type=&quot;application/x-shockwave-flash&quot; width=&quot;167&quot;&gt;&lt;param name=&quot;movie&quot; value=&quot;http://agitki.ru/_ld/8/848_flash_clock.swf&quot; /&gt;&lt;param name=&quot;wmode&quot; value=&quot;transparent&quot; /&gt;&lt;param name=&quot;flashvars&quot; value=&quot;&amp;amp;in_title=Ваш текст&amp;amp;&quot; /&gt;&lt;/object&gt;&lt;/div&gt;\r\n', '', 'Контактная информация', 'Контактная информация', 'Контактная информация');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'Dress Code', 'data/im/dress_code.png', 0),
(7, ' Larionoff', 'data/im/larionoff.png', 0),
(8, 'Gepur', 'data/im/gepur.png', 0),
(9, 'Eva style', 'data/im/eva_style.png', 0),
(11, 'SK House', '', 0);

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
(9, 1, '', '', '', '', ''),
(11, 1, '', 'SK House', 'SK House', 'SK House', 'SK House');

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
(9, 0),
(11, 0);

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
(1, '', 1, 1, '2014-02-06 00:00:00', '2014-02-06 05:30:26', '2014-02-07 02:36:32', 0, 35),
(2, '', 1, 1, '2014-02-06 00:00:00', '2014-02-06 06:56:47', '2014-02-06 07:13:10', 0, 20),
(3, 'data/ic/P_1121_01_03_1.jpg', 1, 1, '2014-02-07 00:00:00', '2014-02-07 00:58:37', '2014-03-21 05:03:01', 0, 19),
(4, '', 1, 1, '2014-02-07 00:00:00', '2014-02-07 01:06:52', '2014-02-07 01:09:41', 0, 18);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `option`
--

INSERT INTO `option` (`option_id`, `type`, `sort_order`) VALUES
(13, 'select', 0),
(15, 'select', 2),
(18, 'select', 0),
(19, 'select', 0),
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
(18, 1, 'Международный размер'),
(19, 1, 'Модель'),
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=124 ;

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
(74, 11, 'no_image.jpg', 6),
(72, 11, 'no_image.jpg', 4),
(73, 11, 'no_image.jpg', 5),
(71, 11, 'no_image.jpg', 3),
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
(70, 11, 'no_image.jpg', 2),
(69, 11, 'no_image.jpg', 1),
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
(103, 18, 'no_image.jpg', 3),
(104, 18, 'no_image.jpg', 4),
(106, 18, 'no_image.jpg', 6),
(100, 13, 'no_image.jpg', 0),
(108, 13, 'no_image.jpg', 0),
(64, 13, 'no_image.jpg', 0),
(105, 18, 'no_image.jpg', 5),
(107, 18, 'no_image.jpg', 7),
(102, 18, 'no_image.jpg', 2),
(101, 18, 'no_image.jpg', 1),
(112, 19, 'no_image.jpg', 3),
(111, 19, 'no_image.jpg', 2),
(110, 19, 'no_image.jpg', 1),
(113, 19, 'no_image.jpg', 4),
(114, 19, 'no_image.jpg', 5),
(115, 19, 'no_image.jpg', 6),
(116, 19, 'no_image.jpg', 7),
(117, 19, 'no_image.jpg', 8),
(118, 19, 'no_image.jpg', 9),
(119, 11, '', 7),
(120, 11, '', 8),
(121, 11, '', 9),
(122, 11, '', 10),
(123, 11, '', 11);

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
(118, 1, 19, '9'),
(117, 1, 19, '8'),
(109, 1, 13, 'Темно коричневый'),
(60, 1, 13, 'Оранжевый'),
(66, 1, 13, 'Серебристый'),
(67, 1, 13, 'Темно синий'),
(99, 1, 13, 'Светло коричневый'),
(74, 1, 11, '50'),
(72, 1, 11, '46'),
(73, 1, 11, '48'),
(71, 1, 11, '44'),
(70, 1, 11, '42'),
(55, 1, 13, 'Коричневый'),
(69, 1, 11, '40'),
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
(104, 1, 18, 'M'),
(106, 1, 18, 'XL'),
(105, 1, 18, 'L'),
(103, 1, 18, 'S'),
(102, 1, 18, 'XS'),
(107, 1, 18, 'XXL'),
(101, 1, 18, 'XXS'),
(98, 1, 13, 'Салатовый'),
(100, 1, 13, 'Коралловый'),
(108, 1, 13, 'Хаки'),
(64, 1, 13, 'Черный'),
(116, 1, 19, '7'),
(115, 1, 19, '6'),
(114, 1, 19, '5'),
(113, 1, 19, '4'),
(112, 1, 19, '3'),
(111, 1, 19, '2'),
(110, 1, 19, '1'),
(119, 1, 11, 'универсальный'),
(120, 1, 11, '40-42'),
(121, 1, 11, '42-44'),
(122, 1, 11, '44-46'),
(123, 1, 11, '46-48');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

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
(59, 0, 'INV-2013-00', 0, 'Интернет магазин rumus.by', 'http://rumus.by/', 7, 1, 'татьяна', 'чернявская', 'tchernyavskaya@bk.ru', '80295127610', '', 'татьяна', 'чернявская', '', '', '', 'ул.Зыгина,2а,кв.1', '', 'полоцк', '211413', 'Беларусь', 20, 'Витебская область', 343, '', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', 0, '', 0, '', '', '', '', '34.0000', 10, 0, '0.0000', 1, 2, 'USD', '1.00000000', '176.60.161.123', '', 'Opera/9.80 (Windows NT 6.1; Win64; x64) Presto/2.12.388 Version/12.16', 'ru,ru-RU;q=0.9,en;q=0.8', '2014-03-26 14:09:39', '2014-03-31 08:00:08'),
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Дамп данных таблицы `order_history`
--

INSERT INTO `order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(51, 59, 1, 1, '', '2014-03-26 14:09:48'),
(52, 59, 2, 0, '', '2014-03-26 14:37:32'),
(56, 59, 10, 1, '', '2014-03-31 08:00:08');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Дамп данных таблицы `order_option`
--

INSERT INTO `order_option` (`order_option_id`, `order_id`, `order_product_id`, `product_option_id`, `product_option_value_id`, `name`, `value`, `type`) VALUES
(8, 5, 5, 227, 17, 'Размер', '42', 'select'),
(9, 7, 7, 235, 46, 'Размер', '44', 'select'),
(10, 8, 8, 235, 46, 'Размер', '44', 'select'),
(18, 59, 60, 288, 249, 'Цвет', 'Хаки', 'select');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

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
(60, 59, 118, 'Длинное платье', 'Платье', 1, '34.0000', '34.0000', '0.0000', 0),
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

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
(14, 1, 'Истекший'),
(17, 1, 'В процессе доставки');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

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
(118, 59, 'total', 'Итого', '340000 р.', '34.0000', 9),
(117, 59, 'sub_total', 'Сумма', '340000 р.', '34.0000', 1),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `parsemx_donors`
--

INSERT INTO `parsemx_donors` (`donor_id`, `host`, `autorun`, `missing`, `state`, `active_tasks`, `done_tasks`, `total_entities`, `total_files`, `check_url`, `proxy`) VALUES
(2, 'stores.ebay.com', '0', '', 0, 0, 140, 112, 9956, 'http://www.ebay.com/itm/Sexy-Womens-Sleeveless-Stretch-Bodycon-Crew-Neck-Mini-Dress-Slim-Vest-Club-6586-/310676478833?pt=US_CSA_WC_Dresses&amp;var=&amp;hash=item8e12879bf7', ''),
(3, 'moonar.ebay.com', '0', '', 0, 0, 60, 859, 33902, 'http://www.ebay.com/itm/Celebrity-Womens-Vintage-CROCO-Doctor-Tote-Shoulder-Bag-Handbag-Messenger-Purse-/181124812059?pt=US_CSA_WH_Handbags&amp;var=&amp;hash=item2a2be14d1b', ''),
(6, 'brand-shop.net.ua', '0', 'none', 0, 0, 591, 578, 2772, 'http://brand-shop.net.ua/p34663413-stilnoe-molodezhnoe-plate.html', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2219 ;

--
-- Дамп данных таблицы `parsemx_entities`
--

INSERT INTO `parsemx_entities` (`entity_id`, `platform_id`, `ins_id`, `donor_id`, `url`, `entity`, `status`, `ourl`) VALUES
(403, 523, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCharming-OL-Square-V-neck-Decorated-Buttons-Womens-Formal-Career-Pencil-Dresses-%2F350962570240%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem9067b205ab', 'product', 0, 'http://www.ebay.com/itm/Charming-OL-Square-V-neck-Decorated-Buttons-Womens-Formal-Career-Pencil-Dresses-/350962570240?pt=US_CSA_WC_Dresses&var=&hash=item9067b205ab'),
(404, 524, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FChic-Hollow-Out-Pullover-V-Neck-Rhombus-Womens-Sweater-Knitwear-Knit-Tops-Grey-%2F350935393206%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem9066722b3e', 'product', 0, 'http://www.ebay.com/itm/Chic-Hollow-Out-Pullover-V-Neck-Rhombus-Womens-Sweater-Knitwear-Knit-Tops-Grey-/350935393206?pt=US_CSA_WC_Sweaters&var=&hash=item9066722b3e'),
(405, 525, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStylish-Tiger-Print-Womens-Sleeveless-Mini-Dress-Sundress-Cami-Top-Stretch-6738-%2F351009910949%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem9069ea7783', 'product', 0, 'http://www.ebay.com/itm/Stylish-Tiger-Print-Womens-Sleeveless-Mini-Dress-Sundress-Cami-Top-Stretch-6738-/351009910949?pt=US_CSA_WC_Dresses&var=&hash=item9069ea7783'),
(406, 526, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Girl-Crew-Neck-Long-Sleeve-Stretch-Womens-Mini-Dress-Flouncing-Hem-Pleats-%2F141202916586%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem6682341582', 'product', 0, 'http://www.ebay.com/itm/Sweet-Girl-Crew-Neck-Long-Sleeve-Stretch-Womens-Mini-Dress-Flouncing-Hem-Pleats-/141202916586?pt=US_CSA_WC_Dresses&var=&hash=item6682341582'),
(407, 527, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMulticolor-Crew-Neck-Long-Sleeve-Womens-Knitted-Sweater-Jumper-Knitwear-Stretch-%2F141202861139%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem6682320005', 'product', 0, 'http://www.ebay.com/itm/Multicolor-Crew-Neck-Long-Sleeve-Womens-Knitted-Sweater-Jumper-Knitwear-Stretch-/141202861139?pt=US_CSA_WC_Sweaters&var=&hash=item6682320005'),
(408, 528, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGreen-Backless-Strapless-Womens-Corset-Mini-Dress-Pleated-Flouncing-Hem-Stretch-%2F141202011123%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem66821a54fe', 'product', 0, 'http://www.ebay.com/itm/Green-Backless-Strapless-Womens-Corset-Mini-Dress-Pleated-Flouncing-Hem-Stretch-/141202011123?pt=US_CSA_WC_Dresses&var=&hash=item66821a54fe'),
(409, 529, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLeopard-High-Neck-Floral-Lace-Mesh-Patchwork-Womens-Asymmetric-Shirt-Blouse-Tops-%2F141200742332%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem6681f8f025', 'product', 0, 'http://www.ebay.com/itm/Leopard-High-Neck-Floral-Lace-Mesh-Patchwork-Womens-Asymmetric-Shirt-Blouse-Tops-/141200742332?pt=US_CSA_WC_Shirts_Tops&var=&hash=item6681f8f025'),
(410, 530, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWhite-Black-Color-Blocking-Hip-wrapped-Womens-Mini-Dress-Stretch-Bodycon-Casual-%2F351007665128%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem9069d1ea62', 'product', 0, 'http://www.ebay.com/itm/White-Black-Color-Blocking-Hip-wrapped-Womens-Mini-Dress-Stretch-Bodycon-Casual-/351007665128?pt=US_CSA_WC_Dresses&var=&hash=item9069d1ea62'),
(411, 531, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSquare-V-neck-Beltloop-Peplum-Womens-Formal-Career-Pencil-Dress-Slit-Hem-Zipper-%2F141197918746%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem6681b31374', 'product', 0, 'http://www.ebay.com/itm/Square-V-neck-Beltloop-Peplum-Womens-Formal-Career-Pencil-Dress-Slit-Hem-Zipper-/141197918746?pt=US_CSA_WC_Dresses&var=&hash=item6681b31374'),
(412, 532, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGraceful-OL-Crew-Neck-Cap-Sleeve-Womens-Career-Formal-Pencil-Dresses-Zipper-Slit-%2F141142489175%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem667f7ee638', 'product', 0, 'http://www.ebay.com/itm/Graceful-OL-Crew-Neck-Cap-Sleeve-Womens-Career-Formal-Pencil-Dresses-Zipper-Slit-/141142489175?pt=US_CSA_WC_Dresses&var=&hash=item667f7ee638'),
(413, 533, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCharming-Color-Blocking-Hip-wrapped-Bodycon-Womens-Career-Formal-Pencil-Dresses-%2F310824085398%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e1457de8f', 'product', 0, 'http://www.ebay.com/itm/Charming-Color-Blocking-Hip-wrapped-Bodycon-Womens-Career-Formal-Pencil-Dresses-/310824085398?pt=US_CSA_WC_Dresses&var=&hash=item8e1457de8f'),
(414, 534, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Flouncing-Stand-Collar-Womens-Full-Length-Maxi-Dress-Evening-Cut-out-6661-%2F271223670868%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem84c081bde7', 'product', 0, 'http://www.ebay.com/itm/Korean-Flouncing-Stand-Collar-Womens-Full-Length-Maxi-Dress-Evening-Cut-out-6661-/271223670868?pt=US_CSA_WC_Dresses&var=&hash=item84c081bde7'),
(415, 535, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FClassic-Half-Sleeve-Color-Blocking-Womens-Career-Formal-Pencil-Midi-Dress-6987-%2F310743675628%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e135f3b1e', 'product', 0, 'http://www.ebay.com/itm/Classic-Half-Sleeve-Color-Blocking-Womens-Career-Formal-Pencil-Midi-Dress-6987-/310743675628?pt=US_CSA_WC_Dresses&var=&hash=item8e135f3b1e'),
(416, 536, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FColor-Blocking-Wear-Work-Womens-Career-Formal-Pencil-Midi-Dress-Bodycon-6998-%2F310748830996%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e136bd5d7', 'product', 0, 'http://www.ebay.com/itm/Color-Blocking-Wear-Work-Womens-Career-Formal-Pencil-Midi-Dress-Bodycon-6998-/310748830996?pt=US_CSA_WC_Dresses&var=&hash=item8e136bd5d7'),
(417, 537, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCap-Sleeve-Keyhole-Color-Blocking-Womens-Wiggle-Pencil-Midi-Dress-Bodycon-7018-%2F271279837787%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem84c1d9dc40', 'product', 0, 'http://www.ebay.com/itm/Cap-Sleeve-Keyhole-Color-Blocking-Womens-Wiggle-Pencil-Midi-Dress-Bodycon-7018-/271279837787?pt=US_CSA_WC_Dresses&var=&hash=item84c1d9dc40'),
(418, 538, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Floral-Print-Stretchy-Womens-Cocktail-Party-Wiggle-Pencil-Dress-7051-%2F310758276368%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e137fe2e9', 'product', 0, 'http://www.ebay.com/itm/Celebrity-Floral-Print-Stretchy-Womens-Cocktail-Party-Wiggle-Pencil-Dress-7051-/310758276368?pt=US_CSA_WC_Dresses&var=&hash=item8e137fe2e9'),
(419, 539, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGrey-Slit-Neckline-Short-Sleeve-Womens-Formal-Career-Pencil-Dress-Zipper-Lined-%2F141144738337%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem667f99fc05', 'product', 0, 'http://www.ebay.com/itm/Grey-Slit-Neckline-Short-Sleeve-Womens-Formal-Career-Pencil-Dress-Zipper-Lined-/141144738337?pt=US_CSA_WC_Dresses&var=&hash=item667f99fc05'),
(420, 540, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCute-Zip-up-Panda-Ears-Womens-Hoodie-Outwear-Kigurumi-Sweat-Sweatshirt-Tops-7055-%2F141077991450%3Fpt%3DUS_Womens_Sweats_Hoodies%26var%3D%26hash%3Ditem667cedebb1', 'product', 0, 'http://www.ebay.com/itm/Cute-Zip-up-Panda-Ears-Womens-Hoodie-Outwear-Kigurumi-Sweat-Sweatshirt-Tops-7055-/141077991450?pt=US_Womens_Sweats_Hoodies&var=&hash=item667cedebb1'),
(421, 541, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLovely-Panda-Detachable-Tail-Zip-Up-Womens-Hoodie-Outwear-Kigurumi-Sweats-Pocket-%2F141120621886%3Fpt%3DUS_Womens_Sweats_Hoodies%26var%3D%26hash%3Ditem667ea630af', 'product', 0, 'http://www.ebay.com/itm/Lovely-Panda-Detachable-Tail-Zip-Up-Womens-Hoodie-Outwear-Kigurumi-Sweats-Pocket-/141120621886?pt=US_Womens_Sweats_Hoodies&var=&hash=item667ea630af'),
(566, 686, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Wedding-Prom-Ball-Gowns-Halter-Long-Cocktail-Bridesmaid-Party-Ceremony-Dress-%2F190717220104%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c67a1d508', 'product', 2, 'http://www.ebay.com/itm/New-Wedding-Prom-Ball-Gowns-Halter-Long-Cocktail-Bridesmaid-Party-Ceremony-Dress-/190717220104?pt=UK_Women_s_Dresses&var=&hash=item2c67a1d508'),
(567, 687, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FProm-Formal-Party-Mermaid-Sequins-Beads-Wedding-Feast-Gowns-Strapless-long-Dress-%2F180949586046%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a216f907e', 'product', 2, 'http://www.ebay.com/itm/Prom-Formal-Party-Mermaid-Sequins-Beads-Wedding-Feast-Gowns-Strapless-long-Dress-/180949586046?pt=US_CSA_WC_Dresses&var=&hash=item2a216f907e'),
(568, 688, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Halter-Beads-Formal-Wedding-Party-Ball-Gowns-Evening-Cocktail-Chiffon-Dress-%2F350885427373%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51b266b8ad', 'product', 2, 'http://www.ebay.com/itm/Sexy-Halter-Beads-Formal-Wedding-Party-Ball-Gowns-Evening-Cocktail-Chiffon-Dress-/350885427373?pt=US_CSA_WC_Dresses&var=&hash=item51b266b8ad'),
(569, 689, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FProm-Ball-Gowns-Party-Asymmetric-Long-tail-Chiffon-cocktail-Dress-UK-SIze-8-20-%2F180931929076%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2a206223f4', 'product', 2, 'http://www.ebay.com/itm/Prom-Ball-Gowns-Party-Asymmetric-Long-tail-Chiffon-cocktail-Dress-UK-SIze-8-20-/180931929076?pt=UK_Women_s_Dresses&var=&hash=item2a206223f4'),
(570, 690, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCharming-Formal-Wedding-Evening-Prom-Ball-Gowns-One-Shoulder-Flower-Long-Dress-%2F181105264835%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2ab708c3', 'product', 2, 'http://www.ebay.com/itm/Charming-Formal-Wedding-Evening-Prom-Ball-Gowns-One-Shoulder-Flower-Long-Dress-/181105264835?pt=US_CSA_WC_Dresses&var=&hash=item2a2ab708c3'),
(571, 691, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FProm-Gown-Bridesmaid-Wedding-Strapless-Cocktail-Long-Bead-Ball-Party-Dress-Green-%2F190702090792%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c66bafa28', 'product', 2, 'http://www.ebay.com/itm/Prom-Gown-Bridesmaid-Wedding-Strapless-Cocktail-Long-Bead-Ball-Party-Dress-Green-/190702090792?pt=US_CSA_WC_Dresses&var=&hash=item2c66bafa28'),
(572, 692, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFormelle-longue-Robe-de-mariee-bal-Parti-soiree-Cocktail-demoiselle-dhonneur-%2F181235956374%3Fpt%3DFR_YO_Vetements_Femmes_Mariage%26var%3D%26hash%3Ditem2a32813a96', 'product', 2, 'http://www.ebay.com/itm/Formelle-longue-Robe-de-mariee-bal-Parti-soiree-Cocktail-demoiselle-dhonneur-/181235956374?pt=FR_YO_Vetements_Femmes_Mariage&var=&hash=item2a32813a96'),
(573, 693, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWedding-Bridal-Prom-Gowns-Evening-Ball-Backless-Dresses-Uk-Size-8-10-12-14-16-18-%2F180930986621%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2a2053c27d', 'product', 2, 'http://www.ebay.com/itm/Wedding-Bridal-Prom-Gowns-Evening-Ball-Backless-Dresses-Uk-Size-8-10-12-14-16-18-/180930986621?pt=UK_Women_s_Dresses&var=&hash=item2a2053c27d'),
(574, 694, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FProm-Gowns-Wedding-Party-Ball-Cocktail-Long-Dress-Stock-Uk-Size-8-10-12-14-16-18-%2F190704198628%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c66db23e4', 'product', 2, 'http://www.ebay.com/itm/Prom-Gowns-Wedding-Party-Ball-Cocktail-Long-Dress-Stock-Uk-Size-8-10-12-14-16-18-/190704198628?pt=UK_Women_s_Dresses&var=&hash=item2c66db23e4'),
(575, 695, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWhite-Bridal-Wedding-Prom-Gown-Evening-Ball-Party-Dress-Uk-Size-8-10-12-14-16-18-%2F190706818130%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c67031c52', 'product', 2, 'http://www.ebay.com/itm/White-Bridal-Wedding-Prom-Gown-Evening-Ball-Party-Dress-Uk-Size-8-10-12-14-16-18-/190706818130?pt=UK_Women_s_Dresses&var=&hash=item2c67031c52'),
(576, 696, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FProm-Gowns-Evening-Party-Ball-Wedding-Dresses-Stock-Size-UK-6-8-10-12-14-16-18-%2F190694052321%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c664051e1', 'product', 2, 'http://www.ebay.com/itm/Prom-Gowns-Evening-Party-Ball-Wedding-Dresses-Stock-Size-UK-6-8-10-12-14-16-18-/190694052321?pt=UK_Women_s_Dresses&var=&hash=item2c664051e1'),
(577, 697, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Lady-A-Line-Evening-Prom-Ball-Gown-Party-Mermaid-Ceremony-One-Shoulder-Dress-%2F170897216484%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem27ca4493e4', 'product', 2, 'http://www.ebay.com/itm/New-Lady-A-Line-Evening-Prom-Ball-Gown-Party-Mermaid-Ceremony-One-Shoulder-Dress-/170897216484?pt=UK_Women_s_Dresses&var=&hash=item27ca4493e4'),
(579, 699, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Long-Sequins-Gold-Tulle-Bridesmaid-Prom-Party-Ball-Cocktail-Evening-Dresses-%2F350946356876%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51b6086e8c', 'product', 2, 'http://www.ebay.com/itm/Sexy-Long-Sequins-Gold-Tulle-Bridesmaid-Prom-Party-Ball-Cocktail-Evening-Dresses-/350946356876?pt=US_CSA_WC_Dresses&var=&hash=item51b6086e8c'),
(580, 700, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FProm-Gowns-Strapless-Cocktail-wedding-Ball-Evening-Party-Dress-Size-UK-6-22-%2F180930320733%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2a2049995d', 'product', 2, 'http://www.ebay.com/itm/Prom-Gowns-Strapless-Cocktail-wedding-Ball-Evening-Party-Dress-Size-UK-6-22-/180930320733?pt=UK_Women_s_Dresses&var=&hash=item2a2049995d'),
(581, 701, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FProm-Gowns-Evening-Party-Ball-Wedding-Dresses-Stock-Size-UK-6-8-10-12-14-16-18-%2F170864597288%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem27c852d928', 'product', 2, 'http://www.ebay.com/itm/Prom-Gowns-Evening-Party-Ball-Wedding-Dresses-Stock-Size-UK-6-8-10-12-14-16-18-/170864597288?pt=UK_Women_s_Dresses&var=&hash=item27c852d928'),
(582, 702, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWedding-Bridal-Bridesmaid-Party-Cocktail-Prom-Ball-Gown-Evening-Beads-Long-Dress-%2F181173902176%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2ece5b60', 'product', 2, 'http://www.ebay.com/itm/Wedding-Bridal-Bridesmaid-Party-Cocktail-Prom-Ball-Gown-Evening-Beads-Long-Dress-/181173902176?pt=US_CSA_WC_Dresses&var=&hash=item2a2ece5b60'),
(584, 704, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FOne-shoulder-Floral-Wedding-Gowns-Ball-Prom-cocktail-Bridesmaid-Long-Party-Dress-%2F350591463725%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem51a0e1312d', 'product', 2, 'http://www.ebay.com/itm/One-shoulder-Floral-Wedding-Gowns-Ball-Prom-cocktail-Bridesmaid-Long-Party-Dress-/350591463725?pt=UK_Women_s_Dresses&var=&hash=item51a0e1312d'),
(585, 705, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Women-Sexy-Embroidery-Flora-Sheer-Organza-Deep-V-Neck-Formal-Party-Dress-%2F201036309849%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2eceb2a559', 'product', 2, 'http://www.ebay.com/itm/Elegant-Women-Sexy-Embroidery-Flora-Sheer-Organza-Deep-V-Neck-Formal-Party-Dress-/201036309849?pt=US_CSA_WC_Dresses&var=&hash=item2eceb2a559'),
(586, 706, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBlack-Prom-Ball-Gowns-Evening-Party-pleated-wedding-Dress-Cocktail-Stock-8-Size-%2F180927649726%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2020d7be', 'product', 2, 'http://www.ebay.com/itm/Black-Prom-Ball-Gowns-Evening-Party-pleated-wedding-Dress-Cocktail-Stock-8-Size-/180927649726?pt=US_CSA_WC_Dresses&var=&hash=item2a2020d7be'),
(587, 707, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FProm-Party-Evening-Cocktail-Ball-Gowns-Women-Chiffon-long-Strapless-Beads-Dress-%2F350831706850%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51af3302e2', 'product', 2, 'http://www.ebay.com/itm/Prom-Party-Evening-Cocktail-Ball-Gowns-Women-Chiffon-long-Strapless-Beads-Dress-/350831706850?pt=US_CSA_WC_Dresses&var=&hash=item51af3302e2'),
(588, 708, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FProm-Wedding-Formal-Gowns-Ball-Party-Cocktail-Applique-Long-Dress-Size-US-4-12-%2F180999299642%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2466223a', 'product', 2, 'http://www.ebay.com/itm/Prom-Wedding-Formal-Gowns-Ball-Party-Cocktail-Applique-Long-Dress-Size-US-4-12-/180999299642?pt=US_CSA_WC_Dresses&var=&hash=item2a2466223a'),
(589, 709, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%23', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html#'),
(590, 710, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fsch%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3FLH_BIN%3D1%26rt%3Dnc%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_rss%3D1%26_rssstore%3D1%26_sc%3D1%26_sop%3D15%26_stpos%3D%26gbr%3D1', 'product', 0, 'http://www.ebay.com/sch/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_rss=1&_rssstore=1&_sc=1&_sop=15&_stpos=&gbr=1'),
(591, 711, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3FLH_BIN%3D1%26rt%3Dnc%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m14.l1581%26gbr%3D1%26_pgn%3D6', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1581&gbr=1&_pgn=6'),
(592, 712, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3FLH_BIN%3D1%26rt%3Dnc%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m14.l1513%26gbr%3D1%26_pgn%3D8', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1513&gbr=1&_pgn=8'),
(593, 713, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3FLH_BIN%3D1%26rt%3Dnc%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m14.l1513%26gbr%3D1%26_pgn%3D7', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1513&gbr=1&_pgn=7'),
(594, 714, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3FLH_BIN%3D1%26rt%3Dnc%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m14.l1513%26gbr%3D1%26_pgn%3D6', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1513&gbr=1&_pgn=6'),
(595, 715, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3FLH_BIN%3D1%26rt%3Dnc%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m14.l1513%26gbr%3D1%26_pgn%3D4', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1513&gbr=1&_pgn=4'),
(596, 716, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3FLH_BIN%3D1%26rt%3Dnc%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m14.l1513%26gbr%3D1%26_pgn%3D3', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1513&gbr=1&_pgn=3'),
(597, 717, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3FLH_BIN%3D1%26rt%3Dnc%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m14.l1513%26gbr%3D1%26_pgn%3D2', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1513&gbr=1&_pgn=2'),
(598, 718, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3FLH_BIN%3D1%26rt%3Dnc%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m14.l1581%26gbr%3D1%26_pgn%3D4', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1581&gbr=1&_pgn=4'),
(599, 719, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-Sexy-Wild-Slim-Cool-Leopard-Faux-Twinset-One-Piece-Mini-Dresses-Sexy-%2F141193221700%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem20dfc59644', 'product', 0, 'http://www.ebay.com/itm/New-Women-Sexy-Wild-Slim-Cool-Leopard-Faux-Twinset-One-Piece-Mini-Dresses-Sexy-/141193221700?pt=US_CSA_WC_Dresses&hash=item20dfc59644'),
(600, 720, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Blacks-See-through-Tulle-Sleeveless-Sexy-Cocktail-Party-Mini-Dress-4180-%2F141190133882%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem20df96787a', 'product', 0, 'http://www.ebay.com/itm/Womens-Blacks-See-through-Tulle-Sleeveless-Sexy-Cocktail-Party-Mini-Dress-4180-/141190133882?pt=US_CSA_WC_Dresses&hash=item20df96787a'),
(601, 721, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Sexy-See-through-Long-Sleeve-Lace-Tunic-Peplum-Mini-Dresses-Casual-4463-%2F140973656823%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem20d2af4af7', 'product', 0, 'http://www.ebay.com/itm/Women-Sexy-See-through-Long-Sleeve-Lace-Tunic-Peplum-Mini-Dresses-Casual-4463-/140973656823?pt=US_CSA_WC_Dresses&hash=item20d2af4af7'),
(602, 722, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-See-through-Lace-Princess-3-4-Sleeves-Short-Mini-Dress-Lining-Casual-0784-%2F140973145191%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem20d2a77c67', 'product', 0, 'http://www.ebay.com/itm/Womens-See-through-Lace-Princess-3-4-Sleeves-Short-Mini-Dress-Lining-Casual-0784-/140973145191?pt=US_CSA_WC_Dresses&hash=item20d2a77c67'),
(603, 723, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FEmpire-Waist-Short-Smock-Dresses-Cross-Strap-Scoop-1116-%2F140719172461%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem20c3842b6d', 'product', 0, 'http://www.ebay.com/itm/Empire-Waist-Short-Smock-Dresses-Cross-Strap-Scoop-1116-/140719172461?pt=US_CSA_WC_Dresses&hash=item20c3842b6d'),
(604, 724, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCasual-Women-Knit-Sweater-Mini-Dress-Sleeveless-Stripes-Trendy-Color-Block-4781-%2F141188713422%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem6681484c80', 'product', 0, 'http://www.ebay.com/itm/Casual-Women-Knit-Sweater-Mini-Dress-Sleeveless-Stripes-Trendy-Color-Block-4781-/141188713422?pt=US_CSA_WC_Dresses&var=&hash=item6681484c80'),
(605, 725, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2012-Women-Sleeveless-Chiffon-Stretch-Asymmetric-Design-Mini-Short-Dress-4470-%2F350992365194%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem51b8c6768a', 'product', 0, 'http://www.ebay.com/itm/2012-Women-Sleeveless-Chiffon-Stretch-Asymmetric-Design-Mini-Short-Dress-4470-/350992365194?pt=US_CSA_WC_Dresses&hash=item51b8c6768a'),
(606, 726, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2012-Womens-Color-Unique-Graceful-Fitted-Tight-Off-Shoulder-Clubwear-Mini-Dress-%2F310869258070%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem4861406f56', 'product', 0, 'http://www.ebay.com/itm/2012-Womens-Color-Unique-Graceful-Fitted-Tight-Off-Shoulder-Clubwear-Mini-Dress-/310869258070?pt=US_CSA_WC_Dresses&hash=item4861406f56'),
(607, 727, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FEmbellished-Straps-Open-Back-Mesh-Patchwork-Womens-Cocktail-Club-Dress-Stretch-%2F351016571815%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem906a2b6975', 'product', 0, 'http://www.ebay.com/itm/Embellished-Straps-Open-Back-Mesh-Patchwork-Womens-Cocktail-Club-Dress-Stretch-/351016571815?pt=US_CSA_WC_Dresses&var=&hash=item906a2b6975'),
(608, 728, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBatwing-Sleeve-Hip-wrapped-Houndstooth-Womens-T-shirt-Tops-Tee-Mini-Dress-6971-%2F351015991082%3Fpt%3DUS_Womens_Tshirts%26var%3D%26hash%3Ditem906a255417', 'product', 0, 'http://www.ebay.com/itm/Batwing-Sleeve-Hip-wrapped-Houndstooth-Womens-T-shirt-Tops-Tee-Mini-Dress-6971-/351015991082?pt=US_Womens_Tshirts&var=&hash=item906a255417'),
(609, 729, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSheer-Mesh-Patchwork-Bowtie-Vertical-Pleating-Womens-Peplum-Mini-Dresses-Stretch-%2F351015657518%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem906a214d4e', 'product', 0, 'http://www.ebay.com/itm/Sheer-Mesh-Patchwork-Bowtie-Vertical-Pleating-Womens-Peplum-Mini-Dresses-Stretch-/351015657518?pt=US_CSA_WC_Dresses&var=&hash=item906a214d4e'),
(610, 730, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FPullover-Badge-Womens-Sportwear-Hooded-Dress-Mini-Long-Top-T-shirt-Pocket-7027-%2F351003014906%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem9069a6f9c0', 'product', 0, 'http://www.ebay.com/itm/Pullover-Badge-Womens-Sportwear-Hooded-Dress-Mini-Long-Top-T-shirt-Pocket-7027-/351003014906?pt=US_CSA_WC_Dresses&var=&hash=item9069a6f9c0'),
(611, 731, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Womens-Sexy-Mini-Dress-Asymmetric-One-Shoulder-Cocktail-Party-Pleat-4793-%2F351001809823%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem9069983627', 'product', 0, 'http://www.ebay.com/itm/Elegant-Womens-Sexy-Mini-Dress-Asymmetric-One-Shoulder-Cocktail-Party-Pleat-4793-/351001809823?pt=US_CSA_WC_Dresses&var=&hash=item9069983627'),
(612, 732, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Polka-Dot-Womens-Splicing-Short-Sleeve-Tunic-Dress-Princess-Casual-6783-%2F351001380655%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem9069942f2d', 'product', 0, 'http://www.ebay.com/itm/Korean-Polka-Dot-Womens-Splicing-Short-Sleeve-Tunic-Dress-Princess-Casual-6783-/351001380655?pt=US_CSA_WC_Dresses&var=&hash=item9069942f2d'),
(613, 733, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Boat-Neck-Off-Shoulder-Womens-Hip-wrapped-Exposed-Zipper-Mini-Dress-Stretch-%2F350999415468%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem906983b2ea', 'product', 0, 'http://www.ebay.com/itm/Sexy-Boat-Neck-Off-Shoulder-Womens-Hip-wrapped-Exposed-Zipper-Mini-Dress-Stretch-/350999415468?pt=US_CSA_WC_Dresses&var=&hash=item906983b2ea'),
(614, 734, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-Trendy-Patchwork-See-through-Lace-Mini-Dresses-Peplum-Flouncing-6237-%2F350997494765%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem90697449e8', 'product', 0, 'http://www.ebay.com/itm/Sexy-Womens-Trendy-Patchwork-See-through-Lace-Mini-Dresses-Peplum-Flouncing-6237-/350997494765?pt=US_CSA_WC_Dresses&var=&hash=item90697449e8'),
(615, 735, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Sleeveless-Womens-Side-Drawstring-Stretch-Bodycon-Midi-Dress-Asymmetirc-6982-%2F350995618759%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem9069637e80', 'product', 0, 'http://www.ebay.com/itm/New-Sleeveless-Womens-Side-Drawstring-Stretch-Bodycon-Midi-Dress-Asymmetirc-6982-/350995618759?pt=US_CSA_WC_Dresses&var=&hash=item9069637e80'),
(616, 736, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCasual-Women-Short-Sleeve-Mini-Dress-Faux-Twinset-OL-Style-Two-Tones-Peplum-4989-%2F350995355352%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem906960dc51', 'product', 0, 'http://www.ebay.com/itm/Casual-Women-Short-Sleeve-Mini-Dress-Faux-Twinset-OL-Style-Two-Tones-Peplum-4989-/350995355352?pt=US_CSA_WC_Dresses&var=&hash=item906960dc51'),
(617, 737, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCasual-Cute-Women-Mini-Skirts-Skorts-Solid-Short-Pants-Flouncing-Hot-Summer-4703-%2F350994684774%3Fpt%3DUS_CSA_WC_Skirts%26var%3D%26hash%3Ditem906959be46', 'product', 0, 'http://www.ebay.com/itm/Casual-Cute-Women-Mini-Skirts-Skorts-Solid-Short-Pants-Flouncing-Hot-Summer-4703-/350994684774?pt=US_CSA_WC_Skirts&var=&hash=item906959be46'),
(618, 738, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCocktail-Party-Womens-Sexy-Backless-Crossed-Strap-Sleeveless-Mini-Dresses-6143-%2F350992721952%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem906945b61b', 'product', 0, 'http://www.ebay.com/itm/Cocktail-Party-Womens-Sexy-Backless-Crossed-Strap-Sleeveless-Mini-Dresses-6143-/350992721952?pt=US_CSA_WC_Dresses&var=&hash=item906945b61b'),
(619, 739, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Turndown-Collar-Sleeveless-Floral-Pleated-Tunic-Womens-Mini-Dress-Casual-%2F350979474740%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem90689e39d4', 'product', 0, 'http://www.ebay.com/itm/Sweet-Turndown-Collar-Sleeveless-Floral-Pleated-Tunic-Womens-Mini-Dress-Casual-/350979474740?pt=US_CSA_WC_Dresses&var=&hash=item90689e39d4'),
(620, 740, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSleeveless-Houndstooth-Polka-Dot-Zebra-Stripe-Womens-Flared-Micro-Mini-Dress-Top-%2F350964978773%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem9067d67969', 'product', 0, 'http://www.ebay.com/itm/Sleeveless-Houndstooth-Polka-Dot-Zebra-Stripe-Womens-Flared-Micro-Mini-Dress-Top-/350964978773?pt=US_CSA_WC_Dresses&var=&hash=item9067d67969'),
(621, 741, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCute-Peter-Pan-Collar-Green-Dot-Long-Sleeve-Womens-Shift-Mini-Dress-Tops-Buttons-%2F350960483824%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem906795cd20', 'product', 0, 'http://www.ebay.com/itm/Cute-Peter-Pan-Collar-Green-Dot-Long-Sleeve-Womens-Shift-Mini-Dress-Tops-Buttons-/350960483824?pt=US_CSA_WC_Dresses&var=&hash=item906795cd20'),
(622, 742, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWhite-Black-Striped-High-Waist-Womens-Full-Length-Maxi-Skirt-Long-Dress-Stretch-%2F350940613094%3Fpt%3DUS_CSA_WC_Skirts%26var%3D%26hash%3Ditem9066a66a36', 'product', 0, 'http://www.ebay.com/itm/White-Black-Striped-High-Waist-Womens-Full-Length-Maxi-Skirt-Long-Dress-Stretch-/350940613094?pt=US_CSA_WC_Skirts&var=&hash=item9066a66a36'),
(623, 743, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Cut-out-Waist-Crew-Neck-Long-Sleeve-Womens-Formal-Career-Pencil-Dress-Black-%2F310887033986%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e155b4ed4', 'product', 0, 'http://www.ebay.com/itm/Sexy-Cut-out-Waist-Crew-Neck-Long-Sleeve-Womens-Formal-Career-Pencil-Dress-Black-/310887033986?pt=US_CSA_WC_Dresses&var=&hash=item8e155b4ed4'),
(624, 744, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStylish-Crew-Neck-Striped-Womens-Stretch-Bodycon-Asymmetric-Long-Dress-Irregular-%2F310885288666%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e15531237', 'product', 0, 'http://www.ebay.com/itm/Stylish-Crew-Neck-Striped-Womens-Stretch-Bodycon-Asymmetric-Long-Dress-Irregular-/310885288666?pt=US_CSA_WC_Dresses&var=&hash=item8e15531237'),
(625, 745, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Leopard-Hip-wrapped-See-through-Lace-Patchwork-Womens-Mini-Dress-Tops-7047-%2F310881685119%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e153ee3af', 'product', 0, 'http://www.ebay.com/itm/Sexy-Leopard-Hip-wrapped-See-through-Lace-Patchwork-Womens-Mini-Dress-Tops-7047-/310881685119?pt=US_CSA_WC_Dresses&var=&hash=item8e153ee3af'),
(626, 746, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLovely-Cat-Long-Sleeve-Elastic-Waist-Womens-Chiffon-Mini-Dresses-Removable-Belt-%2F310881518417%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e153e070a', 'product', 0, 'http://www.ebay.com/itm/Lovely-Cat-Long-Sleeve-Elastic-Waist-Womens-Chiffon-Mini-Dresses-Removable-Belt-/310881518417?pt=US_CSA_WC_Dresses&var=&hash=item8e153e070a'),
(627, 747, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Strapless-Long-Blacks-Dress-Stylish-Womens-Maxi-Allover-Tulle-Bandeau-6399-%2F310880448558%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e153a77f1', 'product', 0, 'http://www.ebay.com/itm/Sexy-Strapless-Long-Blacks-Dress-Stylish-Womens-Maxi-Allover-Tulle-Bandeau-6399-/310880448558?pt=US_CSA_WC_Dresses&var=&hash=item8e153a77f1'),
(628, 748, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Lace-Embroidery-Womens-Crew-Neck-Long-Sleeve-Shift-Mini-Dresses-Tops-6809-%2F310879678715%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e1536e466', 'product', 0, 'http://www.ebay.com/itm/Korean-Lace-Embroidery-Womens-Crew-Neck-Long-Sleeve-Shift-Mini-Dresses-Tops-6809-/310879678715?pt=US_CSA_WC_Dresses&var=&hash=item8e1536e466'),
(629, 749, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FUnique-Netted-Strap-Mini-Dresses-Sexy-Womens-Cocktail-Party-Solids-Backless-6308-%2F310879433879%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e15357cd0', 'product', 0, 'http://www.ebay.com/itm/Unique-Netted-Strap-Mini-Dresses-Sexy-Womens-Cocktail-Party-Solids-Backless-6308-/310879433879?pt=US_CSA_WC_Dresses&var=&hash=item8e15357cd0'),
(630, 750, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FTrendy-Boat-Neck-Off-shoulder-Bowtie-Womens-Stretch-Mini-Dresses-Sundress-6804-%2F310878906909%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e1531cd94', 'product', 0, 'http://www.ebay.com/itm/Trendy-Boat-Neck-Off-shoulder-Bowtie-Womens-Stretch-Mini-Dresses-Sundress-6804-/310878906909?pt=US_CSA_WC_Dresses&var=&hash=item8e1531cd94'),
(631, 751, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCharming-Sexy-Women-Mini-Dress-Keyhole-Wrapped-V-shaped-Sleeveless-Cocktail-6183-%2F310878352131%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e152e99d6', 'product', 0, 'http://www.ebay.com/itm/Charming-Sexy-Women-Mini-Dress-Keyhole-Wrapped-V-shaped-Sleeveless-Cocktail-6183-/310878352131?pt=US_CSA_WC_Dresses&var=&hash=item8e152e99d6'),
(632, 752, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFloral-Lace-Patchwork-Cut-out-Hip-wrapped-Womens-Stretch-Bodycon-Mini-Dress-Club-%2F310873964289%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e1516aaa5', 'product', 0, 'http://www.ebay.com/itm/Floral-Lace-Patchwork-Cut-out-Hip-wrapped-Womens-Stretch-Bodycon-Mini-Dress-Club-/310873964289?pt=US_CSA_WC_Dresses&var=&hash=item8e1516aaa5'),
(633, 753, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FTrendy-Crew-Neck-Hip-wrapped-Ruched-Womens-Color-Blocking-Mini-Dresses-Stretch-%2F310873544873%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e1514a2c4', 'product', 0, 'http://www.ebay.com/itm/Trendy-Crew-Neck-Hip-wrapped-Ruched-Womens-Color-Blocking-Mini-Dresses-Stretch-/310873544873?pt=US_CSA_WC_Dresses&var=&hash=item8e1514a2c4'),
(634, 754, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGorgeous-Flower-Scoop-Neck-Hip-wrapped-Womens-Knit-Mini-Dresses-Stretch-Bodycon-%2F310831392622%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e14769e8c', 'product', 0, 'http://www.ebay.com/itm/Gorgeous-Flower-Scoop-Neck-Hip-wrapped-Womens-Knit-Mini-Dresses-Stretch-Bodycon-/310831392622?pt=US_CSA_WC_Dresses&var=&hash=item8e14769e8c'),
(635, 755, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FDecorated-Double-Breasted-Pullover-Lapel-Striped-Womens-Formal-Mini-Dress-7118-%2F310775861143%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e13b252af', 'product', 0, 'http://www.ebay.com/itm/Decorated-Double-Breasted-Pullover-Lapel-Striped-Womens-Formal-Mini-Dress-7118-/310775861143?pt=US_CSA_WC_Dresses&var=&hash=item8e13b252af'),
(636, 756, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Womens-Sweet-Frills-Flouncing-Neckline-Backless-Party-Club-Fitted-Mini-Dress-%2F310755783207%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e13784f1b', 'product', 0, 'http://www.ebay.com/itm/New-Womens-Sweet-Frills-Flouncing-Neckline-Backless-Party-Club-Fitted-Mini-Dress-/310755783207?pt=US_CSA_WC_Dresses&var=&hash=item8e13784f1b'),
(637, 757, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Long-Sleeve-Lace-Splicing-Womens-Shift-Mini-Dress-Top-Casual-Solid-6873-%2F310723061472%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e132b76a6', 'product', 0, 'http://www.ebay.com/itm/Korean-Long-Sleeve-Lace-Splicing-Womens-Shift-Mini-Dress-Top-Casual-Solid-6873-/310723061472?pt=US_CSA_WC_Dresses&var=&hash=item8e132b76a6'),
(638, 758, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FShiny-Rhinestone-Womens-Sleeveless-Tunic-Mini-Dress-Self-tie-Straps-Cut-out-6675-%2F310692239494%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e12bdc829', 'product', 0, 'http://www.ebay.com/itm/Shiny-Rhinestone-Womens-Sleeveless-Tunic-Mini-Dress-Self-tie-Straps-Cut-out-6675-/310692239494?pt=US_CSA_WC_Dresses&var=&hash=item8e12bdc829'),
(639, 759, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Casual-Twinset-Floral-Sleeveless-Mini-Dress-Lace-Vest-Outerwear-Tops-6528-%2F310669250943%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e1266ac75', 'product', 0, 'http://www.ebay.com/itm/Womens-Casual-Twinset-Floral-Sleeveless-Mini-Dress-Lace-Vest-Outerwear-Tops-6528-/310669250943?pt=US_CSA_WC_Dresses&var=&hash=item8e1266ac75'),
(640, 760, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Stylish-Asymmetric-One-Shoulder-Mini-Dress-Solid-Cocktail-Party-Draped-6291-%2F310669219929%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e12661ffc', 'product', 0, 'http://www.ebay.com/itm/Sexy-Stylish-Asymmetric-One-Shoulder-Mini-Dress-Solid-Cocktail-Party-Draped-6291-/310669219929?pt=US_CSA_WC_Dresses&var=&hash=item8e12661ffc'),
(641, 761, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Casual-Chiffon-Color-Blocking-Flouncing-Sleeveless-Shift-Mini-Dress-6506-%2F310667401561%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e12554e23', 'product', 0, 'http://www.ebay.com/itm/Womens-Casual-Chiffon-Color-Blocking-Flouncing-Sleeveless-Shift-Mini-Dress-6506-/310667401561?pt=US_CSA_WC_Dresses&var=&hash=item8e12554e23'),
(642, 762, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Women-Back-Tie-Flouncing-Sleeveless-Stretch-Summer-Mini-Dress-Solid-Party-%2F310661153083%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e12256742', 'product', 0, 'http://www.ebay.com/itm/Korean-Women-Back-Tie-Flouncing-Sleeveless-Stretch-Summer-Mini-Dress-Solid-Party-/310661153083?pt=US_CSA_WC_Dresses&var=&hash=item8e12256742'),
(643, 763, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGraceful-Patchwork-Chiffon-Blouse-Mini-Dress-OL-Style-Business-Mini-Dress-Button-%2F310559662491%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e110c97ae', 'product', 0, 'http://www.ebay.com/itm/Graceful-Patchwork-Chiffon-Blouse-Mini-Dress-OL-Style-Business-Mini-Dress-Button-/310559662491?pt=US_CSA_WC_Dresses&var=&hash=item8e110c97ae'),
(644, 764, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Queen-Beading-Pearl-Low-Cut-Sleeveless-Backless-Cocktail-Party-Mini-Dress-%2F310367694553%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e09aa95ba', 'product', 0, 'http://www.ebay.com/itm/Womens-Queen-Beading-Pearl-Low-Cut-Sleeveless-Backless-Cocktail-Party-Mini-Dress-/310367694553?pt=US_CSA_WC_Dresses&var=&hash=item8e09aa95ba'),
(645, 765, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FDeep-V-neck-Halter-Backless-Clubwear-Spliced-Mini-Dress-%2F310320868747%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem8e088b5294', 'product', 0, 'http://www.ebay.com/itm/Deep-V-neck-Halter-Backless-Clubwear-Spliced-Mini-Dress-/310320868747?pt=US_CSA_WC_Dresses&var=&hash=item8e088b5294'),
(646, 766, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFabulous-Womens-Sleeveless-Turndown-Collar-Shirt-Dress-Mini-Color-Blocking-6713-%2F271230834723%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem84c0ab0dac', 'product', 0, 'http://www.ebay.com/itm/Fabulous-Womens-Sleeveless-Turndown-Collar-Shirt-Dress-Mini-Color-Blocking-6713-/271230834723?pt=US_CSA_WC_Dresses&var=&hash=item84c0ab0dac'),
(647, 767, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.htmljavascript%3Avoid%280%29', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.htmljavascript:void(0)'),
(648, 768, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&gbr=1'),
(649, 769, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.htmljavascript%3A%3B', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.htmljavascript:;'),
(650, 770, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3Frt%3Dnc%26LH_SaleItems%3D1%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m309%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?rt=nc&LH_SaleItems=1&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m309&gbr=1'),
(651, 771, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3Frt%3Dnc%26LH_Auction%3D1%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m309%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?rt=nc&LH_Auction=1&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m309&gbr=1'),
(652, 772, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3Frt%3Dnc%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m309%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m309&gbr=1'),
(653, 773, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%27%2Bhost%2B%27%2Fss.php%3Ftype%3Ditm%26pos%3D%27%2Bpos%2B%27%26id%3D%27%2Bebayid%2B%27%26no%3D%27%2Bno%2B%27', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html''+host+''/ss.php?type=itm&pos=''+pos+''&id=''+ebayid+''&no=''+no+'''),
(654, 774, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3FLH_BIN%3D1%26rt%3Dnc%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D1%26_stpos%3D%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=1&_stpos=&gbr=1'),
(655, 775, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3FLH_BIN%3D1%26rt%3Dnc%26_dmd%3D1%26_fcid%3D22%26_fsub%3D909987010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_dmd=1&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&gbr=1'),
(656, 776, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D909987010%26_lns%3D2%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&_fcid=22&_fsub=909987010&_lns=2&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(657, 777, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FOther-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D1%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Other-/_i.html?LH_BIN=1&_fcid=22&_fsub=1&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(658, 778, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FMultiple-Sizes-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D3784886010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Multiple-Sizes-/_i.html?LH_BIN=1&_fcid=22&_fsub=3784886010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(659, 779, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FMixed-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D912811010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Mixed-/_i.html?LH_BIN=1&_fcid=22&_fsub=912811010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(660, 780, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FStuds-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D911998010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Studs-/_i.html?LH_BIN=1&_fcid=22&_fsub=911998010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(661, 781, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FAccessories-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D911975010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Accessories-/_i.html?LH_BIN=1&_fcid=22&_fsub=911975010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(662, 782, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FMens-Fashion-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D910355010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Mens-Fashion-/_i.html?LH_BIN=1&_fcid=22&_fsub=910355010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(663, 783, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FSkirt-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D5876104010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Skirt-/_i.html?LH_BIN=1&_fcid=22&_fsub=5876104010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(664, 784, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FCoats-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D1192287010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Coats-/_i.html?LH_BIN=1&_fcid=22&_fsub=1192287010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(665, 785, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FSuits-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D914828010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Suits-/_i.html?LH_BIN=1&_fcid=22&_fsub=914828010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(666, 786, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FJackets-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D1047861010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Jackets-/_i.html?LH_BIN=1&_fcid=22&_fsub=1047861010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(667, 787, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FOuterwear-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D913062010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Outerwear-/_i.html?LH_BIN=1&_fcid=22&_fsub=913062010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(668, 788, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FHoodies-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D911922010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Hoodies-/_i.html?LH_BIN=1&_fcid=22&_fsub=911922010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(669, 789, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FSweaters-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D911921010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Sweaters-/_i.html?LH_BIN=1&_fcid=22&_fsub=911921010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(670, 790, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FSocks-Leg-Warmers-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D910351010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Socks-Leg-Warmers-/_i.html?LH_BIN=1&_fcid=22&_fsub=910351010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(671, 791, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FPants-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D910350010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Pants-/_i.html?LH_BIN=1&_fcid=22&_fsub=910350010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(672, 792, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FTops-Shirts-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D910349010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Tops-Shirts-/_i.html?LH_BIN=1&_fcid=22&_fsub=910349010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1');
INSERT INTO `parsemx_entities` (`entity_id`, `platform_id`, `ins_id`, `donor_id`, `url`, `entity`, `status`, `ourl`) VALUES
(673, 793, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FLadies-Fashion-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D911871010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Ladies-Fashion-/_i.html?LH_BIN=1&_fcid=22&_fsub=911871010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(674, 794, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FNew-Arrivals-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D918514010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26_trksid%3Dp4634.c0.m322%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/New-Arrivals-/_i.html?LH_BIN=1&_fcid=22&_fsub=918514010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(675, 795, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FLadies-Fashion-%2F_i.html%3FLH_BIN%3D1%26_fcid%3D22%26_fsub%3D911871010%26_localstpos%3D%26_sc%3D1%26_sid%3D818890740%26_sop%3D15%26_stpos%3D%26gbr%3D1', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Ladies-Fashion-/_i.html?LH_BIN=1&_fcid=22&_fsub=911871010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&gbr=1'),
(676, 796, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store'),
(677, 797, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2F', 'product', 0, 'http://stores.ebay.com/'),
(678, 798, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fsch%2Febayadvsearch%2F%3Frt%3Dnc', 'product', 0, 'http://www.ebay.com/sch/ebayadvsearch/?rt=nc'),
(679, 799, 2, 2, 'http%3A%2F%2Fwww.ebay.com%2Fsch%2Fallcategories%2Fall-categories%3F_trksid%3Dm570.l3694', 'product', 0, 'http://www.ebay.com/sch/allcategories/all-categories?_trksid=m570.l3694'),
(680, 800, 2, 2, 'http%3A%2F%2Fwww.ebay.com', 'product', 0, 'http://www.ebay.com'),
(681, 801, 2, 2, 'http%3A%2F%2Fstores.ebay.com%2FAdas-Korea-Fashion-Store%2FDresses-%2F_i.html%23mainContent', 'product', 0, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html#mainContent'),
(682, 802, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-One-Off-Shoulder-Formal-Gown-Mini-Slim-Dress-Evening-Party-Folding-Sleeve-%2F170840701883%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c6e63bbb', 'product', 2, 'http://www.ebay.com/itm/Girls-One-Off-Shoulder-Formal-Gown-Mini-Slim-Dress-Evening-Party-Folding-Sleeve-/170840701883?pt=US_CSA_WC_Dresses&var=&hash=item27c6e63bbb'),
(683, 803, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFormal-Bridesmaids-Bridal-Prom-Evening-Ball-Gowns-Cocktail-Party-Long-Maxi-Dress-%2F190868649180%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c70a874dc', 'product', 2, 'http://www.ebay.com/itm/Formal-Bridesmaids-Bridal-Prom-Evening-Ball-Gowns-Cocktail-Party-Long-Maxi-Dress-/190868649180?pt=US_CSA_WC_Dresses&var=&hash=item2c70a874dc'),
(684, 804, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFormal-Women-Wedding-Bridesmaid-Cocktail-Evening-Party-Prom-Gown-Ball-Long-Dress-%2F190850437190%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6f929046', 'product', 2, 'http://www.ebay.com/itm/Formal-Women-Wedding-Bridesmaid-Cocktail-Evening-Party-Prom-Gown-Ball-Long-Dress-/190850437190?pt=US_CSA_WC_Dresses&var=&hash=item2c6f929046'),
(685, 805, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBall-Evening-Party-prom-Gowns-Cocktail-Long-Strapless-Dress-US-size-6-8-10-12-14-%2F180931818091%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2060726b', 'product', 2, 'http://www.ebay.com/itm/Ball-Evening-Party-prom-Gowns-Cocktail-Long-Strapless-Dress-US-size-6-8-10-12-14-/180931818091?pt=US_CSA_WC_Dresses&var=&hash=item2a2060726b'),
(686, 806, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FOff-Shoulder-Prom-Ball-Gowns-Strapless-Long-Chiffon-Evening-Party-Cocktail-Dress-%2F180953976630%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a21b28f36', 'product', 2, 'http://www.ebay.com/itm/Off-Shoulder-Prom-Ball-Gowns-Strapless-Long-Chiffon-Evening-Party-Cocktail-Dress-/180953976630?pt=US_CSA_WC_Dresses&var=&hash=item2a21b28f36'),
(687, 807, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Formal-Prom-Gowns-Banquet-Sequins-Ball-Cocktail-Evening-Party-Long-Dresses-%2F181111482594%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2b15e8e2', 'product', 2, 'http://www.ebay.com/itm/Sexy-Formal-Prom-Gowns-Banquet-Sequins-Ball-Cocktail-Evening-Party-Long-Dresses-/181111482594?pt=US_CSA_WC_Dresses&var=&hash=item2a2b15e8e2'),
(688, 808, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWhites-Prom-Ball-Gowns-Evening-Party-Strapless-Asymmetric-Tail-Dress-US-7-Size-%2F180931809260%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a20604fec', 'product', 2, 'http://www.ebay.com/itm/Whites-Prom-Ball-Gowns-Evening-Party-Strapless-Asymmetric-Tail-Dress-US-7-Size-/180931809260?pt=US_CSA_WC_Dresses&var=&hash=item2a20604fec'),
(689, 809, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStock-Prom-Gown-Party-Long-Ball-Cocktail-Women-Dress-Blue-Wedding-US-Size-6-16-%2F180931789611%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2060032b', 'product', 2, 'http://www.ebay.com/itm/Stock-Prom-Gown-Party-Long-Ball-Cocktail-Women-Dress-Blue-Wedding-US-Size-6-16-/180931789611?pt=US_CSA_WC_Dresses&var=&hash=item2a2060032b'),
(690, 810, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Evening-Party-Formal-Bridesmaids-Prom-Ball-Gowns-Cocktail-Long-Maxi-Dress-%2F190881853988%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c7171f224', 'product', 2, 'http://www.ebay.com/itm/Womens-Evening-Party-Formal-Bridesmaids-Prom-Ball-Gowns-Cocktail-Long-Maxi-Dress-/190881853988?pt=US_CSA_WC_Dresses&var=&hash=item2c7171f224'),
(691, 811, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Women-Lace-Pierced-Chic-Backless-Formal-Gown-Dress-Evening-Party-Coctail-%2F190677471674%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c654351ba', 'product', 2, 'http://www.ebay.com/itm/Elegant-Women-Lace-Pierced-Chic-Backless-Formal-Gown-Dress-Evening-Party-Coctail-/190677471674?pt=US_CSA_WC_Dresses&var=&hash=item2c654351ba'),
(692, 812, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-V-Back-Bodycon-Mini-Slim-Ball-Formal-Gowns-Evening-party-cocktail-Dress-%2F190723231463%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c67fd8ee7', 'product', 2, 'http://www.ebay.com/itm/Womens-V-Back-Bodycon-Mini-Slim-Ball-Formal-Gowns-Evening-party-cocktail-Dress-/190723231463?pt=US_CSA_WC_Dresses&var=&hash=item2c67fd8ee7'),
(693, 813, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Floral-one-Shoulder-Chiffon-Long-Slim-Dress-Prom-Ball-Evening-Party-Gown-%2F170880128755%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c93fd6f3', 'product', 2, 'http://www.ebay.com/itm/Womens-Floral-one-Shoulder-Chiffon-Long-Slim-Dress-Prom-Ball-Evening-Party-Gown-/170880128755?pt=US_CSA_WC_Dresses&var=&hash=item27c93fd6f3'),
(694, 814, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSparking-Prom-Ball-Gowns-Evening-party-Pageant-Long-Beads-Bridesmaid-Wed-Dresses-%2F180971698316%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a22c0f88c', 'product', 2, 'http://www.ebay.com/itm/Sparking-Prom-Ball-Gowns-Evening-party-Pageant-Long-Beads-Bridesmaid-Wed-Dresses-/180971698316?pt=US_CSA_WC_Dresses&var=&hash=item2a22c0f88c'),
(695, 815, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Robe-de-mariee-mariage-soiree-Parti-Bal-cocktail-demoiselle-dhonneur-32-42-%2F350940850182%3Fpt%3DFR_V%25C3%25AAtements_pour_femmes%26var%3D%26hash%3Ditem51b5b46806', 'product', 2, 'http://www.ebay.com/itm/Sexy-Robe-de-mariee-mariage-soiree-Parti-Bal-cocktail-demoiselle-dhonneur-32-42-/350940850182?pt=FR_V%C3%AAtements_pour_femmes&var=&hash=item51b5b46806'),
(696, 816, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMother-Bridal-Prom-Ball-Gown-Evening-Party-Cocktail-Long-Dress-Plus-Size-2-18-%2F190817646373%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6d9e3725', 'product', 2, 'http://www.ebay.com/itm/Mother-Bridal-Prom-Ball-Gown-Evening-Party-Cocktail-Long-Dress-Plus-Size-2-18-/190817646373?pt=US_CSA_WC_Dresses&var=&hash=item2c6d9e3725'),
(697, 817, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWedding-Evening-Party-Cocktail-Prom-Ball-Gowns-Long-Slim-Strapless-Womens-Dress-%2F190707519962%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c670dd1da', 'product', 2, 'http://www.ebay.com/itm/Wedding-Evening-Party-Cocktail-Prom-Ball-Gowns-Long-Slim-Strapless-Womens-Dress-/190707519962?pt=UK_Women_s_Dresses&var=&hash=item2c670dd1da'),
(698, 818, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStock-Cocktail-Evening-Wedding-Formal-Gowns-Party-Ball-Prom-Bridesmaid-Dresses-%2F180938939796%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2a20cd1d94', 'product', 2, 'http://www.ebay.com/itm/Stock-Cocktail-Evening-Wedding-Formal-Gowns-Party-Ball-Prom-Bridesmaid-Dresses-/180938939796?pt=UK_Women_s_Dresses&var=&hash=item2a20cd1d94'),
(699, 819, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-V-Neck-Formal-Bridesmaid-Bridal-Cocktail-Party-Prom-Evening-Gown-Long-Dress-%2F190956272172%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c75e17a2c', 'product', 2, 'http://www.ebay.com/itm/Sexy-V-Neck-Formal-Bridesmaid-Bridal-Cocktail-Party-Prom-Evening-Gown-Long-Dress-/190956272172?pt=US_CSA_WC_Dresses&var=&hash=item2c75e17a2c'),
(700, 820, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBall-Prom-Bridal-Gowns-Evening-Party-Cocktail-Wedding-Straight-Strapless-Dress-%2F190707946115%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c67145283', 'product', 2, 'http://www.ebay.com/itm/Ball-Prom-Bridal-Gowns-Evening-Party-Cocktail-Wedding-Straight-Strapless-Dress-/190707946115?pt=UK_Women_s_Dresses&var=&hash=item2c67145283'),
(701, 821, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-Robe-de-mariee-mariage-soiree-partie-bal-Cocktail-Ceremonie-34-36-38-40-42-%2F190926185923%3Fpt%3DFR_YO_Vetements_Femmes_Mariage%26var%3D%26hash%3Ditem2c741665c3', 'product', 2, 'http://www.ebay.com/itm/2013-Robe-de-mariee-mariage-soiree-partie-bal-Cocktail-Ceremonie-34-36-38-40-42-/190926185923?pt=FR_YO_Vetements_Femmes_Mariage&var=&hash=item2c741665c3'),
(702, 822, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBlack-Peacock-Formal-Bridal-Prom-Ball-Gowns-Evening-Party-Cocktail-Mini-Dress-%2F190933136685%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c7480752d', 'product', 2, 'http://www.ebay.com/itm/Black-Peacock-Formal-Bridal-Prom-Ball-Gowns-Evening-Party-Cocktail-Mini-Dress-/190933136685?pt=US_CSA_WC_Dresses&var=&hash=item2c7480752d'),
(703, 823, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FChic-Women-Fashion-Collarless-Double-Breasted-Slim-Coat-Outwear-Jacket-OL-Career-%2F181060256776%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2a28084408', 'product', 2, 'http://www.ebay.com/itm/Chic-Women-Fashion-Collarless-Double-Breasted-Slim-Coat-Outwear-Jacket-OL-Career-/181060256776?pt=US_CSA_WC_Outerwear&var=&hash=item2a28084408'),
(704, 824, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Double-Breasted-Wool-Long-Trench-Warm-Slim-Jacket-Coats-Overcoat-Outwear-%2F190867289891%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2c7093b723', 'product', 2, 'http://www.ebay.com/itm/Womens-Double-Breasted-Wool-Long-Trench-Warm-Slim-Jacket-Coats-Overcoat-Outwear-/190867289891?pt=US_CSA_WC_Outerwear&var=&hash=item2c7093b723'),
(705, 825, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Poncho-Unique-Button-Hood-Winter-Loose-Coat-Jacket-Outerwear-Cape-Princess-%2F180763478975%3Fpt%3DUS_CSA_WC_Outerwear%26hash%3Ditem2a1657cbbf', 'product', 2, 'http://www.ebay.com/itm/Women-Poncho-Unique-Button-Hood-Winter-Loose-Coat-Jacket-Outerwear-Cape-Princess-/180763478975?pt=US_CSA_WC_Outerwear&hash=item2a1657cbbf'),
(706, 826, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Ball-Prom-Bridal-Gowns-Evening-Party-Cocktail-Wed-Dress-Size-4-6-8-10-12-14-%2F170886004727%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c9997ff7', 'product', 2, 'http://www.ebay.com/itm/New-Ball-Prom-Bridal-Gowns-Evening-Party-Cocktail-Wed-Dress-Size-4-6-8-10-12-14-/170886004727?pt=US_CSA_WC_Dresses&var=&hash=item27c9997ff7'),
(707, 827, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Mini-Short-Dress-Wedding-Bridesmaid-Prom-Gowns-Ball-Cocktail-Evening-Party-%2F350753779621%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51aa8defa5', 'product', 2, 'http://www.ebay.com/itm/Sexy-Mini-Short-Dress-Wedding-Bridesmaid-Prom-Gowns-Ball-Cocktail-Evening-Party-/350753779621?pt=US_CSA_WC_Dresses&var=&hash=item51aa8defa5'),
(709, 829, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBlack-Peacock-Embroidery-Sequins-Prom-Ball-Gown-Party-Cocktail-Bridal-Mini-Dress-%2F190862134929%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c70450e91', 'product', 2, 'http://www.ebay.com/itm/Black-Peacock-Embroidery-Sequins-Prom-Ball-Gown-Party-Cocktail-Bridal-Mini-Dress-/190862134929?pt=US_CSA_WC_Dresses&var=&hash=item2c70450e91'),
(710, 830, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFall-Winter-Womens-Long-Sleeve-Basic-Warm-Jacket-Top-Coat-Slim-Overcoat-Hooded-%2F190716500206%3Fpt%3DUK_Women_s_Coats_Jackets%26var%3D%26hash%3Ditem2c6796d8ee', 'product', 2, 'http://www.ebay.com/itm/Fall-Winter-Womens-Long-Sleeve-Basic-Warm-Jacket-Top-Coat-Slim-Overcoat-Hooded-/190716500206?pt=UK_Women_s_Coats_Jackets&var=&hash=item2c6796d8ee'),
(711, 831, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Womens-Prom-Ball-party-Long-Split-Backless-Vest-Dress-Cocktail-Dresses-%2F170880125301%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c93fc975', 'product', 2, 'http://www.ebay.com/itm/Elegant-Womens-Prom-Ball-party-Long-Split-Backless-Vest-Dress-Cocktail-Dresses-/170880125301?pt=US_CSA_WC_Dresses&var=&hash=item27c93fc975'),
(712, 832, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFall-Winter-Womens-Long-Sleeve-Basic-Warm-Jacket-Top-Coat-Slim-Overcoat-Hoodie-%2F180956070973%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2a21d2843d', 'product', 2, 'http://www.ebay.com/itm/Fall-Winter-Womens-Long-Sleeve-Basic-Warm-Jacket-Top-Coat-Slim-Overcoat-Hoodie-/180956070973?pt=US_CSA_WC_Outerwear&var=&hash=item2a21d2843d'),
(713, 833, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStrapless-Formal-Wedding-Bridesmaid-Prom-Gown-Evening-Party-Cocktail-Short-Dress-%2F181191795999%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2fdf651f', 'product', 2, 'http://www.ebay.com/itm/Strapless-Formal-Wedding-Bridesmaid-Prom-Gown-Evening-Party-Cocktail-Short-Dress-/181191795999?pt=US_CSA_WC_Dresses&var=&hash=item2a2fdf651f'),
(714, 834, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Loose-Batwing-Cape-Poncho-Tweed-Hoodie-Outwear-Jacket-Coat-Wrap-Clothes-%2F170735123137%3Fpt%3DUS_CSA_WC_Outerwear%26hash%3Ditem27c09b3ac1', 'product', 2, 'http://www.ebay.com/itm/Women-Loose-Batwing-Cape-Poncho-Tweed-Hoodie-Outwear-Jacket-Coat-Wrap-Clothes-/170735123137?pt=US_CSA_WC_Outerwear&hash=item27c09b3ac1'),
(715, 835, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHOT-Luxury-Womens-Slim-Double-Breasted-Coat-Wool-Jacket-Winter-Outwear-4-Colors-%2F180758985992%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2a16133d08', 'product', 2, 'http://www.ebay.com/itm/HOT-Luxury-Womens-Slim-Double-Breasted-Coat-Wool-Jacket-Winter-Outwear-4-Colors-/180758985992?pt=US_CSA_WC_Outerwear&var=&hash=item2a16133d08'),
(716, 836, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWinter-Chic-Fashion-Loose-Windbreaker-Women-Outwear-Coat-Jacket-Overcoat-Casual-%2F350689575972%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem51a6ba4424', 'product', 2, 'http://www.ebay.com/itm/Winter-Chic-Fashion-Loose-Windbreaker-Women-Outwear-Coat-Jacket-Overcoat-Casual-/350689575972?pt=US_CSA_WC_Outerwear&var=&hash=item51a6ba4424'),
(717, 837, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFormal-Bridesmaid-Evening-Party-Gown-Ball-Prom-Cocktail-Mini-Dress-US-Size-4-16-%2F350808520323%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51add13683', 'product', 2, 'http://www.ebay.com/itm/Formal-Bridesmaid-Evening-Party-Gown-Ball-Prom-Cocktail-Mini-Dress-US-Size-4-16-/350808520323?pt=US_CSA_WC_Dresses&var=&hash=item51add13683'),
(718, 838, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-V-neck-Beaded-Slim-Mini-Vest-Dress-Ball-Gowns-Party-Cocktail-Bridesmaid-%2F170896769860%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27ca3dc344', 'product', 2, 'http://www.ebay.com/itm/Womens-V-neck-Beaded-Slim-Mini-Vest-Dress-Ball-Gowns-Party-Cocktail-Bridesmaid-/170896769860?pt=US_CSA_WC_Dresses&var=&hash=item27ca3dc344'),
(719, 839, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-Formal-Wedding-Bridal-Prom-Gowns-Evening-Party-Cocktail-Long-Dresses-%2F350999359000%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51b9312e18', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-Formal-Wedding-Bridal-Prom-Gowns-Evening-Party-Cocktail-Long-Dresses-/350999359000?pt=US_CSA_WC_Dresses&var=&hash=item51b9312e18'),
(720, 840, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Bridemaid-Wedding-Evening-Party-Prom-Ball-Gowns-Halter-Short-Dress-US-4-16-%2F190851392741%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6fa124e5', 'product', 2, 'http://www.ebay.com/itm/Sexy-Bridemaid-Wedding-Evening-Party-Prom-Ball-Gowns-Halter-Short-Dress-US-4-16-/190851392741?pt=US_CSA_WC_Dresses&var=&hash=item2c6fa124e5'),
(721, 841, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWhite-Elegant-Wedding-Bride-Bridesmaid-Bridal-Ball-Prom-Gown-Party-Dress-6-size-%2F180968176862%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a228b3cde', 'product', 2, 'http://www.ebay.com/itm/White-Elegant-Wedding-Bride-Bridesmaid-Bridal-Ball-Prom-Gown-Party-Dress-6-size-/180968176862?pt=US_CSA_WC_Dresses&var=&hash=item2a228b3cde'),
(722, 842, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FUS-Stock-Formal-Bridesmaid-Gowns-Prom-Ball-Evening-Chiffon-Birthday-Party-Dress-%2F181239654132%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a32b9a6f4', 'product', 2, 'http://www.ebay.com/itm/US-Stock-Formal-Bridesmaid-Gowns-Prom-Ball-Evening-Chiffon-Birthday-Party-Dress-/181239654132?pt=US_CSA_WC_Dresses&var=&hash=item2a32b9a6f4'),
(723, 843, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Formal-Bridal-Ball-Prom-Gowns-Club-Cocktail-Evening-Party-Short-Mini-Dress-%2F190817626156%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6d9de82c', 'product', 2, 'http://www.ebay.com/itm/Sweet-Formal-Bridal-Ball-Prom-Gowns-Club-Cocktail-Evening-Party-Short-Mini-Dress-/190817626156?pt=US_CSA_WC_Dresses&var=&hash=item2c6d9de82c'),
(724, 844, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Womens-Chiffon-Beaded-Pleated-Lotus-Leaf-Mini-Dress-Prom-Party-Cocktail-%2F190847319749%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6f62fec5', 'product', 2, 'http://www.ebay.com/itm/Sweet-Womens-Chiffon-Beaded-Pleated-Lotus-Leaf-Mini-Dress-Prom-Party-Cocktail-/190847319749?pt=US_CSA_WC_Dresses&var=&hash=item2c6f62fec5'),
(725, 845, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Woolen-Blend-Long-Trench-Surcoat-Coat-Outerwear-Warmer-Overcoats-Jacket-Wrap-%2F180761735494%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2a163d3146', 'product', 2, 'http://www.ebay.com/itm/Hot-Woolen-Blend-Long-Trench-Surcoat-Coat-Outerwear-Warmer-Overcoats-Jacket-Wrap-/180761735494?pt=US_CSA_WC_Outerwear&var=&hash=item2a163d3146'),
(726, 846, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FProm-Beaded-Bridal-Bridesmaid-Gowns-Ball-Cocktail-Evening-Party-Short-Mini-Dress-%2F181256276021%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a33b74835', 'product', 2, 'http://www.ebay.com/itm/Prom-Beaded-Bridal-Bridesmaid-Gowns-Ball-Cocktail-Evening-Party-Short-Mini-Dress-/181256276021?pt=US_CSA_WC_Dresses&var=&hash=item2a33b74835'),
(727, 847, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Women-Thicken-Warm-Winter-Hooded-Parka-Overcoat-Long-Jacket-Coat-Outerwer-%2F350839350377%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem51afa7a469', 'product', 2, 'http://www.ebay.com/itm/Korean-Women-Thicken-Warm-Winter-Hooded-Parka-Overcoat-Long-Jacket-Coat-Outerwer-/350839350377?pt=US_CSA_WC_Outerwear&var=&hash=item51afa7a469'),
(728, 848, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLadies-Casual-Windbreaker-Wind-Tops-Coat-Slim-Long-Jackets-Overcoat-Moto-Outwear-%2F190714413665%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2c67770261', 'product', 2, 'http://www.ebay.com/itm/Ladies-Casual-Windbreaker-Wind-Tops-Coat-Slim-Long-Jackets-Overcoat-Moto-Outwear-/190714413665?pt=US_CSA_WC_Outerwear&var=&hash=item2c67770261'),
(729, 849, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Casual-Windbreaker-Wind-Tops-Coat-Slim-Long-Jackets-Overcoat-Moto-Outwear-%2F170896324417%3Fpt%3DUK_Women_s_Coats_Jackets%26var%3D%26hash%3Ditem27ca36f741', 'product', 2, 'http://www.ebay.com/itm/Womens-Casual-Windbreaker-Wind-Tops-Coat-Slim-Long-Jackets-Overcoat-Moto-Outwear-/170896324417?pt=UK_Women_s_Coats_Jackets&var=&hash=item27ca36f741'),
(730, 850, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Western-Suits-Top-Coat-Business-Lapel-Casual-Jackt-Outwear-Dress-Blazer-%2F180904553332%3Fpt%3DUS_CSA_WC_Suits%26var%3D%26hash%3Ditem2a1ec06b74', 'product', 2, 'http://www.ebay.com/itm/Womens-Western-Suits-Top-Coat-Business-Lapel-Casual-Jackt-Outwear-Dress-Blazer-/180904553332?pt=US_CSA_WC_Suits&var=&hash=item2a1ec06b74'),
(731, 851, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Bridesmaid-Prom-Ball-Gown-Cocktail-Evening-Party-Mini-Dress-Plus-Size-4-18-%2F200995694633%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2ecc46e829', 'product', 2, 'http://www.ebay.com/itm/Sweet-Bridesmaid-Prom-Ball-Gown-Cocktail-Evening-Party-Mini-Dress-Plus-Size-4-18-/200995694633?pt=US_CSA_WC_Dresses&var=&hash=item2ecc46e829'),
(732, 852, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-Double-Bre-asted-Batwing-Cape-Wool-Poncho-Coat-Jacket-%2F170732856149%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem27c078a355', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womens-Double-Bre-asted-Batwing-Cape-Wool-Poncho-Coat-Jacket-/170732856149?pt=US_CSA_WC_Outerwear&var=&hash=item27c078a355'),
(733, 853, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirl-Off-Shoulder-Strapless-Fomal-Gown-Dress-Evening-Party-Bridmaid-Wedding-%2F180885501594%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a1d9db69a', 'product', 2, 'http://www.ebay.com/itm/Girl-Off-Shoulder-Strapless-Fomal-Gown-Dress-Evening-Party-Bridmaid-Wedding-/180885501594?pt=US_CSA_WC_Dresses&var=&hash=item2a1d9db69a'),
(734, 854, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FParticular-Design-Girls-Sequins-Sleeveless-Cocktail-Ball-Party-Sexy-Mini-Dress-%2F190685111810%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c65b7e602', 'product', 2, 'http://www.ebay.com/itm/Particular-Design-Girls-Sequins-Sleeveless-Cocktail-Ball-Party-Sexy-Mini-Dress-/190685111810?pt=UK_Women_s_Dresses&var=&hash=item2c65b7e602'),
(735, 855, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-Casual-Sports-Suits-Tops-Jacket-Hoodie-Hooded-Tracksuits-Trousers-%2F181148836915%3Fpt%3DUS_Womens_Sweats_Hoodies%26var%3D%26hash%3Ditem2a2d4fe433', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womens-Casual-Sports-Suits-Tops-Jacket-Hoodie-Hooded-Tracksuits-Trousers-/181148836915?pt=US_Womens_Sweats_Hoodies&var=&hash=item2a2d4fe433'),
(736, 856, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Round-Neck-Knit-Sweater-Tops-Lace-Hem-Mini-Keep-Warm-Dresses-Fall-Winter-%2F170869377904%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem27c89bcb70', 'product', 2, 'http://www.ebay.com/itm/Women-Round-Neck-Knit-Sweater-Tops-Lace-Hem-Mini-Keep-Warm-Dresses-Fall-Winter-/170869377904?pt=US_CSA_WC_Dresses&hash=item27c89bcb70'),
(737, 857, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirl-Snow-Pattern-Denim-Skinny-straight-Jean-Long-Pant-Winter-Slim-Warm-Trousers-%2F170869338441%3Fpt%3DUS_CSA_WC_Jeans%26var%3D%26hash%3Ditem27c89b3149', 'product', 2, 'http://www.ebay.com/itm/Girl-Snow-Pattern-Denim-Skinny-straight-Jean-Long-Pant-Winter-Slim-Warm-Trousers-/170869338441?pt=US_CSA_WC_Jeans&var=&hash=item27c89b3149'),
(738, 858, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLadies-Fall-Winter-Demin-Jean-Warm-Long-Skinny-Fit-Leg-Wear-Pants-Slim-Trousers-%2F180917171944%3Fpt%3DUK_Women_s_Jeans%26var%3D%26hash%3Ditem2a1f80f6e8', 'product', 2, 'http://www.ebay.com/itm/Ladies-Fall-Winter-Demin-Jean-Warm-Long-Skinny-Fit-Leg-Wear-Pants-Slim-Trousers-/180917171944?pt=UK_Women_s_Jeans&var=&hash=item2a1f80f6e8'),
(739, 859, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F3PCS-Women-Casual-Sports-Hoodies-Top-Vest-Pants-Sweat-Suit-Tracksuit-Outwear-%2F201007075067%3Fpt%3DUS_Womens_Sweats_Hoodies%26var%3D%26hash%3Ditem2eccf48efb', 'product', 2, 'http://www.ebay.com/itm/3PCS-Women-Casual-Sports-Hoodies-Top-Vest-Pants-Sweat-Suit-Tracksuit-Outwear-/201007075067?pt=US_Womens_Sweats_Hoodies&var=&hash=item2eccf48efb'),
(740, 860, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBridal-Beads-Strapless-formal-Evening-Party-Gowns-Mini-Dresses-Ball-Cocktail-Wed-%2F170895278607%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27ca27020f', 'product', 2, 'http://www.ebay.com/itm/Bridal-Beads-Strapless-formal-Evening-Party-Gowns-Mini-Dresses-Ball-Cocktail-Wed-/170895278607?pt=US_CSA_WC_Dresses&var=&hash=item27ca27020f'),
(741, 861, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-Casual-Beads-Collarless-Long-Sleeve-Denim-Jean-Jacket-Short-Coat-%2F190825813120%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2c6e1ad480', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womens-Casual-Beads-Collarless-Long-Sleeve-Denim-Jean-Jacket-Short-Coat-/190825813120?pt=US_CSA_WC_Outerwear&var=&hash=item2c6e1ad480'),
(742, 862, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Western-Suit-Tops-Coat-Causal-Jackets-Formal-Career-Ladies-Slim-Overcoat-%2F170895829349%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem27ca2f6965', 'product', 2, 'http://www.ebay.com/itm/Womens-Western-Suit-Tops-Coat-Causal-Jackets-Formal-Career-Ladies-Slim-Overcoat-/170895829349?pt=US_CSA_WC_Outerwear&var=&hash=item27ca2f6965'),
(743, 863, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-OL-Lady-Cowl-Neck-Knitwear-Long-Sweater-Dress-Slim-Casual-Office-Career-%2F190783009399%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6b8db277', 'product', 2, 'http://www.ebay.com/itm/Fashion-OL-Lady-Cowl-Neck-Knitwear-Long-Sweater-Dress-Slim-Casual-Office-Career-/190783009399?pt=US_CSA_WC_Dresses&var=&hash=item2c6b8db277'),
(744, 864, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Zebra-Stripe-Batwing-Sleeve-Crew-Neck-Loose-Thick-Knitted-Sweater-Pullover-%2F190874075078%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem2c70fb3fc6', 'product', 2, 'http://www.ebay.com/itm/Women-Zebra-Stripe-Batwing-Sleeve-Crew-Neck-Loose-Thick-Knitted-Sweater-Pullover-/190874075078?pt=US_CSA_WC_Sweaters&var=&hash=item2c70fb3fc6'),
(745, 865, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Strapless-Bridesmaid-Wedding-Prom-Ball-Gowns-Cocktail-Party-Chiffon-Dress-%2F181306616768%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a36b76bc0', 'product', 2, 'http://www.ebay.com/itm/Womens-Strapless-Bridesmaid-Wedding-Prom-Ball-Gowns-Cocktail-Party-Chiffon-Dress-/181306616768?pt=US_CSA_WC_Dresses&var=&hash=item2a36b76bc0'),
(746, 866, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGraceful-Girl-Round-Neck-Vogue-Chic-Chiffon-Mini-Pleated-Ruffle-Dress-Petticoat-%2F170851986284%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c7926b6c', 'product', 2, 'http://www.ebay.com/itm/Graceful-Girl-Round-Neck-Vogue-Chic-Chiffon-Mini-Pleated-Ruffle-Dress-Petticoat-/170851986284?pt=US_CSA_WC_Dresses&var=&hash=item27c7926b6c'),
(747, 867, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Girls-White-Embroidary-Flower-Stitch-Chiffon-Sundress-Slim-Dress-Free-Belt-%2F181123452863%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2bcc8fbf', 'product', 2, 'http://www.ebay.com/itm/Sweet-Girls-White-Embroidary-Flower-Stitch-Chiffon-Sundress-Slim-Dress-Free-Belt-/181123452863?pt=US_CSA_WC_Dresses&var=&hash=item2a2bcc8fbf'),
(748, 868, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCasual-Mandarin-Collar-Sleeveless-Slim-Women-Full-Dress-Stretchy-Pleated-Summer-%2F180919464668%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2a1fa3f2dc', 'product', 2, 'http://www.ebay.com/itm/Casual-Mandarin-Collar-Sleeveless-Slim-Women-Full-Dress-Stretchy-Pleated-Summer-/180919464668?pt=UK_Women_s_Dresses&var=&hash=item2a1fa3f2dc'),
(749, 869, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebraty-Wool-Blend-V-neck-Shoulder-Mark-Loose-Kint-Mini-Fit-Dress-Sweater-%2F170865386474%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c85ee3ea', 'product', 2, 'http://www.ebay.com/itm/Celebraty-Wool-Blend-V-neck-Shoulder-Mark-Loose-Kint-Mini-Fit-Dress-Sweater-/170865386474?pt=US_CSA_WC_Dresses&var=&hash=item27c85ee3ea'),
(750, 870, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Women-Chiffon-Square-Collar-Rivet-Studio-T-Shirts-Tops-Career-Blouse-%2F170844325931%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem27c71d882b', 'product', 2, 'http://www.ebay.com/itm/Elegant-Women-Chiffon-Square-Collar-Rivet-Studio-T-Shirts-Tops-Career-Blouse-/170844325931?pt=US_CSA_WC_Shirts_Tops&var=&hash=item27c71d882b'),
(751, 871, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2014-Sexy-Women-Butterfly-Print-Hollow-Embroidered-Lace-Evening-Party-Mini-Dress-%2F181302172240%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a36739a50', 'product', 2, 'http://www.ebay.com/itm/2014-Sexy-Women-Butterfly-Print-Hollow-Embroidered-Lace-Evening-Party-Mini-Dress-/181302172240?pt=US_CSA_WC_Dresses&var=&hash=item2a36739a50'),
(752, 872, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Womens-Casual-Backless-High-Waist-Crew-Neck-Fitted-Pleated-Mini-Dress-Skirt-%2F181148297287%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2d47a847', 'product', 2, 'http://www.ebay.com/itm/Hot-Womens-Casual-Backless-High-Waist-Crew-Neck-Fitted-Pleated-Mini-Dress-Skirt-/181148297287?pt=US_CSA_WC_Dresses&var=&hash=item2a2d47a847'),
(753, 873, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Chiffon-Bohemian-Prom-Party-Ball-Cocktail-Pleated-Long-Maxi-Belted-Dress-%2F190872607522%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c70e4db22', 'product', 2, 'http://www.ebay.com/itm/Womens-Chiffon-Bohemian-Prom-Party-Ball-Cocktail-Pleated-Long-Maxi-Belted-Dress-/190872607522?pt=US_CSA_WC_Dresses&var=&hash=item2c70e4db22'),
(754, 874, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Rabbit-Pattern-Hooded-Sweater-Stripes-Warm-Hoodies-Long-Sweats-Casual-%2F181058592255%3Fpt%3DUS_Womens_Sweats_Hoodies%26hash%3Ditem2a27eeddff', 'product', 2, 'http://www.ebay.com/itm/Womens-Rabbit-Pattern-Hooded-Sweater-Stripes-Warm-Hoodies-Long-Sweats-Casual-/181058592255?pt=US_Womens_Sweats_Hoodies&hash=item2a27eeddff'),
(755, 875, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLadies-Fall-Winter-Demin-Jean-Warm-Long-Skinny-Fit-Leg-Wear-Pants-Slim-Trousers-%2F180915783652%3Fpt%3DUS_CSA_WC_Jeans%26var%3D%26hash%3Ditem2a1f6bc7e4', 'product', 2, 'http://www.ebay.com/itm/Ladies-Fall-Winter-Demin-Jean-Warm-Long-Skinny-Fit-Leg-Wear-Pants-Slim-Trousers-/180915783652?pt=US_CSA_WC_Jeans&var=&hash=item2a1f6bc7e4'),
(756, 876, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCasual-Mandarin-Collar-Sleeveless-Slim-Women-Full-Dress-Stretchy-Pleated-Summer-%2F180889600251%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a1ddc40fb', 'product', 2, 'http://www.ebay.com/itm/Casual-Mandarin-Collar-Sleeveless-Slim-Women-Full-Dress-Stretchy-Pleated-Summer-/180889600251?pt=US_CSA_WC_Dresses&var=&hash=item2a1ddc40fb'),
(757, 877, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2014-Sexy-Womens-Deep-V-Neck-Career-Party-Club-Evening-Bodycon-Pencil-Slim-Dress-%2F201038547902%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2eced4cbbe', 'product', 2, 'http://www.ebay.com/itm/2014-Sexy-Womens-Deep-V-Neck-Career-Party-Club-Evening-Bodycon-Pencil-Slim-Dress-/201038547902?pt=US_CSA_WC_Dresses&var=&hash=item2eced4cbbe'),
(758, 878, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Western-Suits-Tops-Coat-Causal-Jackets-Formal-Career-Ladies-Slim-Overcoat-%2F180952757486%3Fpt%3DUK_Women_s_Coats_Jackets%26var%3D%26hash%3Ditem2a219ff4ee', 'product', 2, 'http://www.ebay.com/itm/Womens-Western-Suits-Tops-Coat-Causal-Jackets-Formal-Career-Ladies-Slim-Overcoat-/180952757486?pt=UK_Women_s_Coats_Jackets&var=&hash=item2a219ff4ee'),
(759, 879, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Deer-Pattern-Sleeveless-Vest-Skirt-Chiffon-Sundress-Slim-Mini-Party-Dress-%2F181122951410%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2a2bc4e8f2', 'product', 2, 'http://www.ebay.com/itm/Womens-Deer-Pattern-Sleeveless-Vest-Skirt-Chiffon-Sundress-Slim-Mini-Party-Dress-/181122951410?pt=UK_Women_s_Dresses&var=&hash=item2a2bc4e8f2'),
(760, 880, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-Sexy-Vintage-Lady-Long-Sleeve-Backless-Beads-Sequins-Mini-Dress-Party-Club-%2F350769060282%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem51ab7719ba', 'product', 2, 'http://www.ebay.com/itm/2013-Sexy-Vintage-Lady-Long-Sleeve-Backless-Beads-Sequins-Mini-Dress-Party-Club-/350769060282?pt=UK_Women_s_Dresses&var=&hash=item51ab7719ba'),
(761, 881, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Girls-Zipper-Hoodie-Overcoat-Outerwear-Sweatshirt-Jacket-Coat-Top-Clothes-%2F180761718650%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2a163cef7a', 'product', 2, 'http://www.ebay.com/itm/Women-Girls-Zipper-Hoodie-Overcoat-Outerwear-Sweatshirt-Jacket-Coat-Top-Clothes-/180761718650?pt=US_CSA_WC_Outerwear&var=&hash=item2a163cef7a'),
(762, 882, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Career-OL-Ladies-Long-Sleeve-Tunic-Pencil-Mini-Slim-Casual-Dresses-Free-Belt-%2F170898934318%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem27ca5eca2e', 'product', 2, 'http://www.ebay.com/itm/Hot-Career-OL-Ladies-Long-Sleeve-Tunic-Pencil-Mini-Slim-Casual-Dresses-Free-Belt-/170898934318?pt=UK_Women_s_Dresses&var=&hash=item27ca5eca2e'),
(763, 883, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Girls-Winter-Thicken-Warn-Faux-Fur-Hoodie-Long-Slim-Coat-Outerwear-Jacket-%2F350858134776%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem51b0c644f8', 'product', 2, 'http://www.ebay.com/itm/Womens-Girls-Winter-Thicken-Warn-Faux-Fur-Hoodie-Long-Slim-Coat-Outerwear-Jacket-/350858134776?pt=US_CSA_WC_Outerwear&var=&hash=item51b0c644f8'),
(764, 884, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Women-OL-Lady-Round-Neck-Batwing-Sleeve-Sundress-Mini-Dress-Free-Belt-%2F350838045560%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51af93bb78', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Women-OL-Lady-Round-Neck-Batwing-Sleeve-Sundress-Mini-Dress-Free-Belt-/350838045560?pt=US_CSA_WC_Dresses&var=&hash=item51af93bb78'),
(765, 885, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Girls-Casual-Summer-White-Lace-Flora-Waist-Slim-Jumpsuits-Rompers-Shorts-%2F181123432424%3Fpt%3DUK_Women_s_Jumpsuits_Playsuits%26var%3D%26hash%3Ditem2a2bcc3fe8', 'product', 2, 'http://www.ebay.com/itm/Sweet-Girls-Casual-Summer-White-Lace-Flora-Waist-Slim-Jumpsuits-Rompers-Shorts-/181123432424?pt=UK_Women_s_Jumpsuits_Playsuits&var=&hash=item2a2bcc3fe8'),
(766, 886, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Rivets-Punk-Strapless-Wrapped-Chest-Tube-Peplum-Club-Party-Mini-Dress-%2F201020363084%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2ecdbf514c', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Rivets-Punk-Strapless-Wrapped-Chest-Tube-Peplum-Club-Party-Mini-Dress-/201020363084?pt=UK_Women_s_Dresses&var=&hash=item2ecdbf514c'),
(767, 887, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F1PCS-Halter-Tie-Hollow-Out-Padded-Bra-Monokini-Bikini-Beach-Swimwear-Swimsuits-%2F190816391301%3Fpt%3DUK_Women_s_Swimwear%26var%3D%26hash%3Ditem2c6d8b1085', 'product', 2, 'http://www.ebay.com/itm/1PCS-Halter-Tie-Hollow-Out-Padded-Bra-Monokini-Bikini-Beach-Swimwear-Swimsuits-/190816391301?pt=UK_Women_s_Swimwear&var=&hash=item2c6d8b1085'),
(768, 888, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Deer-Pattern-Sleeveless-Vest-Skirt-Chiffon-Sundress-Slim-Mini-Party-Dress-%2F350769106580%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51ab77ce94', 'product', 2, 'http://www.ebay.com/itm/Womens-Deer-Pattern-Sleeveless-Vest-Skirt-Chiffon-Sundress-Slim-Mini-Party-Dress-/350769106580?pt=US_CSA_WC_Dresses&var=&hash=item51ab77ce94'),
(769, 889, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFall-Winter-Ladies-Crewneck-Bowknot-mini-Slim-Career-Pleated-Dress-Casual-Party-%2F190716503478%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6796e5b6', 'product', 2, 'http://www.ebay.com/itm/Fall-Winter-Ladies-Crewneck-Bowknot-mini-Slim-Career-Pleated-Dress-Casual-Party-/190716503478?pt=US_CSA_WC_Dresses&var=&hash=item2c6796e5b6'),
(770, 890, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-Doll-Collar-Slim-Career-Work-Wear-Fit-T-shirt-Tops-Casual-Business-Blouse-%2F170868236525%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem27c88a60ed', 'product', 2, 'http://www.ebay.com/itm/Girls-Doll-Collar-Slim-Career-Work-Wear-Fit-T-shirt-Tops-Casual-Business-Blouse-/170868236525?pt=UK_Women_s_Tops_Shirts&var=&hash=item27c88a60ed'),
(771, 891, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHigh-Quality-Chiffon-Girls-Collarless-Sheer-Soft-Jumpsuit-Romper-Cargo-Long-Pant-%2F190685524979%3Fpt%3DUS_Womens_Jumpsuits_Rompers%26var%3D%26hash%3Ditem2c65be33f3', 'product', 2, 'http://www.ebay.com/itm/High-Quality-Chiffon-Girls-Collarless-Sheer-Soft-Jumpsuit-Romper-Cargo-Long-Pant-/190685524979?pt=US_Womens_Jumpsuits_Rompers&var=&hash=item2c65be33f3'),
(772, 892, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFree-Belt-Western-Chic-Lady-Floral-Woolen-Sleeveless-Waist-Slim-Mini-Dress-Party-%2F181122890844%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2bc3fc5c', 'product', 2, 'http://www.ebay.com/itm/Free-Belt-Western-Chic-Lady-Floral-Woolen-Sleeveless-Waist-Slim-Mini-Dress-Party-/181122890844?pt=US_CSA_WC_Dresses&var=&hash=item2a2bc3fc5c'),
(773, 893, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-Sexy-Vintage-Lady-Long-Sleeve-Backless-Beads-Sequins-Mini-Dress-Party-Club-%2F190825831246%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6e1b1b4e', 'product', 2, 'http://www.ebay.com/itm/2013-Sexy-Vintage-Lady-Long-Sleeve-Backless-Beads-Sequins-Mini-Dress-Party-Club-/190825831246?pt=US_CSA_WC_Dresses&var=&hash=item2c6e1b1b4e'),
(774, 894, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FZip-Back-Color-Block-Stripe-Mini-Slim-Pencil-Tunic-Womens-Cocktail-Career-Dress-%2F170881221219%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem27c9508263', 'product', 2, 'http://www.ebay.com/itm/Zip-Back-Color-Block-Stripe-Mini-Slim-Pencil-Tunic-Womens-Cocktail-Career-Dress-/170881221219?pt=UK_Women_s_Dresses&var=&hash=item27c9508263'),
(775, 895, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Color-Block-Slim-Mini-Sleeveless-Cross-Strappy-Dress-Cocktail-Club-Party-%2F180906217432%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a1ed9cfd8', 'product', 2, 'http://www.ebay.com/itm/Women-Color-Block-Slim-Mini-Sleeveless-Cross-Strappy-Dress-Cocktail-Club-Party-/180906217432?pt=US_CSA_WC_Dresses&var=&hash=item2a1ed9cfd8'),
(776, 896, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-OL-Lady-Career-Round-Neck-Sleeveless-Irregular-Mini-Dress-Club-Party-Belt-%2F181112639651%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2b2790a3', 'product', 2, 'http://www.ebay.com/itm/Womens-OL-Lady-Career-Round-Neck-Sleeveless-Irregular-Mini-Dress-Club-Party-Belt-/181112639651?pt=US_CSA_WC_Dresses&var=&hash=item2a2b2790a3'),
(777, 897, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Girl-Thicken-Hoodie-Coat-Outerwear-Jacket-Winter-6-Colors-%2F180761684978%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2a163c6bf2', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-Girl-Thicken-Hoodie-Coat-Outerwear-Jacket-Winter-6-Colors-/180761684978?pt=US_CSA_WC_Outerwear&var=&hash=item2a163c6bf2'),
(778, 898, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirl-Chiifon-Mid-Calf-Folded-Wave-Stripe-Pleated-Asymmetrical-Hem-Dress-Sundress-%2F190682940353%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6596c3c1', 'product', 2, 'http://www.ebay.com/itm/Girl-Chiifon-Mid-Calf-Folded-Wave-Stripe-Pleated-Asymmetrical-Hem-Dress-Sundress-/190682940353?pt=US_CSA_WC_Dresses&var=&hash=item2c6596c3c1'),
(779, 899, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBlack-Stylish-Women-Haltered-Deep-V-neck-Backless-Wid-leg-Pants-Jumpsuit-Long-%2F170811609526%3Fpt%3DUS_Womens_Jumpsuits_Rompers%26hash%3Ditem27c52a51b6', 'product', 2, 'http://www.ebay.com/itm/Black-Stylish-Women-Haltered-Deep-V-neck-Backless-Wid-leg-Pants-Jumpsuit-Long-/170811609526?pt=US_Womens_Jumpsuits_Rompers&hash=item27c52a51b6'),
(780, 900, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Sell-Women-Sequin-Pete-Pan-Collar-Slim-waist-Mini-Pleated-long-Sleeve-Dress-%2F190781415831%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6b756197', 'product', 2, 'http://www.ebay.com/itm/Hot-Sell-Women-Sequin-Pete-Pan-Collar-Slim-waist-Mini-Pleated-long-Sleeve-Dress-/190781415831?pt=US_CSA_WC_Dresses&var=&hash=item2c6b756197'),
(781, 901, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Femmes-Robe-de-soiree-party-bal-moulante-longue-dentelle-de-Split-Side-Slim-%2F201025444481%3Fpt%3DFR_V%25C3%25AAtements_pour_femmes%26var%3D%26hash%3Ditem2ece0cda81', 'product', 2, 'http://www.ebay.com/itm/Sexy-Femmes-Robe-de-soiree-party-bal-moulante-longue-dentelle-de-Split-Side-Slim-/201025444481?pt=FR_V%C3%AAtements_pour_femmes&var=&hash=item2ece0cda81'),
(782, 902, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2-pcs-Sexy-Bra-Push-Up-Roxy-Bikinis-Swimwear-Swimsuit-Beach-Summer-Size-S-M-L-%2F170867077782%3Fpt%3DUK_Women_s_Swimwear%26var%3D%26hash%3Ditem27c878b296', 'product', 2, 'http://www.ebay.com/itm/2-pcs-Sexy-Bra-Push-Up-Roxy-Bikinis-Swimwear-Swimsuit-Beach-Summer-Size-S-M-L-/170867077782?pt=UK_Women_s_Swimwear&var=&hash=item27c878b296'),
(783, 903, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Rivets-Punk-Strapless-Wrapped-Chest-Tube-Peplum-Club-Party-Mini-Dress-%2F350959101055%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51b6cae47f', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Rivets-Punk-Strapless-Wrapped-Chest-Tube-Peplum-Club-Party-Mini-Dress-/350959101055?pt=US_CSA_WC_Dresses&var=&hash=item51b6cae47f'),
(784, 904, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Career-OL-Ladies-Long-Sleeve-Tunic-Pencil-Mini-Slim-Casual-Dresses-Free-Belt-%2F170898534052%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27ca58aea4', 'product', 2, 'http://www.ebay.com/itm/New-Career-OL-Ladies-Long-Sleeve-Tunic-Pencil-Mini-Slim-Casual-Dresses-Free-Belt-/170898534052?pt=US_CSA_WC_Dresses&var=&hash=item27ca58aea4'),
(785, 905, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Girls-Casual-Summer-White-Lace-Flora-Waist-Slim-Jumpsuits-Rompers-Shorts-%2F190826225278%3Fpt%3DUS_Womens_Jumpsuits_Rompers%26var%3D%26hash%3Ditem2c6e211e7e', 'product', 2, 'http://www.ebay.com/itm/Sweet-Girls-Casual-Summer-White-Lace-Flora-Waist-Slim-Jumpsuits-Rompers-Shorts-/190826225278?pt=US_Womens_Jumpsuits_Rompers&var=&hash=item2c6e211e7e'),
(786, 906, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2012-Trendy-Girls-Chic-Double-V-Neck-Sequins-Drape-Pleated-Above-Knee-Dress-%2F180895011624%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a1e2ed328', 'product', 2, 'http://www.ebay.com/itm/2012-Trendy-Girls-Chic-Double-V-Neck-Sequins-Drape-Pleated-Above-Knee-Dress-/180895011624?pt=US_CSA_WC_Dresses&var=&hash=item2a1e2ed328'),
(787, 907, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FPersonalized-Tee-Punk-Skull-Fringes-Girls-Loose-Stretchy-Tshirt-Ball-Top-Blouse-%2F190692792885%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem2c662d1a35', 'product', 2, 'http://www.ebay.com/itm/Personalized-Tee-Punk-Skull-Fringes-Girls-Loose-Stretchy-Tshirt-Ball-Top-Blouse-/190692792885?pt=UK_Women_s_Tops_Shirts&var=&hash=item2c662d1a35'),
(788, 908, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBoHo-Ladies-Pretty-Romantic-Holiday-Bohemian-Spaghetti-Dress-Flouncing-Tiered-%2F170847552238%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem27c74ec2ee', 'product', 2, 'http://www.ebay.com/itm/BoHo-Ladies-Pretty-Romantic-Holiday-Bohemian-Spaghetti-Dress-Flouncing-Tiered-/170847552238?pt=UK_Women_s_Dresses&var=&hash=item27c74ec2ee'),
(789, 909, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-Doll-Collar-Slim-Career-Work-Wear-Fit-T-shirt-Tops-Casual-Business-Blouse-%2F180914962072%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a1f5f3e98', 'product', 2, 'http://www.ebay.com/itm/Girls-Doll-Collar-Slim-Career-Work-Wear-Fit-T-shirt-Tops-Casual-Business-Blouse-/180914962072?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a1f5f3e98'),
(790, 910, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Girls-Pretty-Romantic-Holiday-Bohemian-Spaghetti-Dress-Flouncing-Tiered-%2F190682553303%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6590dbd7', 'product', 2, 'http://www.ebay.com/itm/New-Girls-Pretty-Romantic-Holiday-Bohemian-Spaghetti-Dress-Flouncing-Tiered-/190682553303?pt=US_CSA_WC_Dresses&var=&hash=item2c6590dbd7'),
(791, 911, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Loose-Drape-Slim-Waist-Personalized-Tee-V-Neck-Blouse-Casual-T-shirt-Tops-%2F190693643527%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2c663a1507', 'product', 2, 'http://www.ebay.com/itm/Women-Loose-Drape-Slim-Waist-Personalized-Tee-V-Neck-Blouse-Casual-T-shirt-Tops-/190693643527?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2c663a1507'),
(792, 912, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNoble-Lady-Bowknot-Backless-Off-Shoulder-Strapless-Formal-Cocktail-Evening-Party-%2F190681097808%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem2c657aa650', 'product', 2, 'http://www.ebay.com/itm/Noble-Lady-Bowknot-Backless-Off-Shoulder-Strapless-Formal-Cocktail-Evening-Party-/190681097808?pt=US_CSA_WC_Dresses&hash=item2c657aa650'),
(793, 913, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSwimwear-Girl-Chiffon-Wraps-Chest-Halter-Super-Mini-Tiered-Cake-SwimDress-Beach-%2F170852993308%3Fpt%3DUK_Women_s_Swimwear%26var%3D%26hash%3Ditem27c7a1c91c', 'product', 2, 'http://www.ebay.com/itm/Swimwear-Girl-Chiffon-Wraps-Chest-Halter-Super-Mini-Tiered-Cake-SwimDress-Beach-/170852993308?pt=UK_Women_s_Swimwear&var=&hash=item27c7a1c91c'),
(794, 914, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F3-Pcs-Korean-Women-Beach-Sexy-Bikini-Swimwear-Swimsuit-Dots-Dress-With-Pad-Beach-%2F180897406371%3Fpt%3DUK_Women_s_Swimwear%26var%3D%26hash%3Ditem2a1e535da3', 'product', 2, 'http://www.ebay.com/itm/3-Pcs-Korean-Women-Beach-Sexy-Bikini-Swimwear-Swimsuit-Dots-Dress-With-Pad-Beach-/180897406371?pt=UK_Women_s_Swimwear&var=&hash=item2a1e535da3'),
(795, 915, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FPregnant-Women-Elegant-Chiffon-Loose-Stretch-Maternity-Mini-Dress-Plus-Size-Tops-%2F350816599907%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51ae4c7f63', 'product', 2, 'http://www.ebay.com/itm/Pregnant-Women-Elegant-Chiffon-Loose-Stretch-Maternity-Mini-Dress-Plus-Size-Tops-/350816599907?pt=US_CSA_WC_Dresses&var=&hash=item51ae4c7f63'),
(796, 916, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2PCS-Women-Lady-Peony-Flora-Padded-Push-Up-Bikini-Beach-Swimwear-Swimsuits-S-M-L-%2F190816382782%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2c6d8aef3e', 'product', 2, 'http://www.ebay.com/itm/2PCS-Women-Lady-Peony-Flora-Padded-Push-Up-Bikini-Beach-Swimwear-Swimsuits-S-M-L-/190816382782?pt=US_CSA_WC_Swimwear&var=&hash=item2c6d8aef3e'),
(797, 917, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FParticular-Design-Hollow-Side-Bowknot-Girl-Jean-Pants-Skinny-Denim-Trousers-%2F180891818097%3Fpt%3DUS_CSA_WC_Pants%26var%3D%26hash%3Ditem2a1dfe1871', 'product', 2, 'http://www.ebay.com/itm/Particular-Design-Hollow-Side-Bowknot-Girl-Jean-Pants-Skinny-Denim-Trousers-/180891818097?pt=US_CSA_WC_Pants&var=&hash=item2a1dfe1871'),
(798, 918, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVictoria-Girls-2-Pcs-Bikini-Halter-Pad-Bra-Swimsuit-Swimwear-Shorts-With-Buckle-%2F180897436372%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2a1e53d2d4', 'product', 2, 'http://www.ebay.com/itm/Victoria-Girls-2-Pcs-Bikini-Halter-Pad-Bra-Swimsuit-Swimwear-Shorts-With-Buckle-/180897436372?pt=US_CSA_WC_Swimwear&var=&hash=item2a1e53d2d4'),
(799, 919, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2Fhot-Korean-Ladies-Slim-Windbreak-Wind-Casual-Coat-OutCoat-Long-Jacket-OutWear-%2F180911232480%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2a1f2655e0', 'product', 2, 'http://www.ebay.com/itm/hot-Korean-Ladies-Slim-Windbreak-Wind-Casual-Coat-OutCoat-Long-Jacket-OutWear-/180911232480?pt=US_CSA_WC_Outerwear&var=&hash=item2a1f2655e0'),
(800, 920, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Chiffon-Floral-Collar-Long-Sleeve-Bodycont-Slim-Flounce-Pleated-Mini-Dress-%2F190781746095%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6b7a6baf', 'product', 2, 'http://www.ebay.com/itm/Women-Chiffon-Floral-Collar-Long-Sleeve-Bodycont-Slim-Flounce-Pleated-Mini-Dress-/190781746095?pt=US_CSA_WC_Dresses&var=&hash=item2c6b7a6baf'),
(801, 921, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-color-Block-Stripe-Crewneck-mini-Slim-Pencil-Tunic-Fit-Dresses-casual-%2F170873761091%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c8dead43', 'product', 2, 'http://www.ebay.com/itm/New-Women-color-Block-Stripe-Crewneck-mini-Slim-Pencil-Tunic-Fit-Dresses-casual-/170873761091?pt=US_CSA_WC_Dresses&var=&hash=item27c8dead43'),
(802, 922, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Girls-Chiffon-Pleated-Retro-Long-Maxi-Dress-Elastic-Waist-Skirt-7-colors-%2F350796880944%3Fpt%3DUS_CSA_WC_Skirts%26var%3D%26hash%3Ditem51ad1f9c30', 'product', 2, 'http://www.ebay.com/itm/Womens-Girls-Chiffon-Pleated-Retro-Long-Maxi-Dress-Elastic-Waist-Skirt-7-colors-/350796880944?pt=US_CSA_WC_Skirts&var=&hash=item51ad1f9c30'),
(803, 923, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Slim-Cotton-Zipper-Hoodie-Sweatshirt-Jacket-Coat-Top-Clothes-%2F170735129178%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem27c09b525a', 'product', 2, 'http://www.ebay.com/itm/Women-Slim-Cotton-Zipper-Hoodie-Sweatshirt-Jacket-Coat-Top-Clothes-/170735129178?pt=US_CSA_WC_Outerwear&var=&hash=item27c09b525a'),
(804, 924, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLady-Hoodie-Hollow-Out-Knitwear-Cardigan-Knit-Sweater-Coat-Jacket-Hooded-outwear-%2F181058572249%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem2a27ee8fd9', 'product', 2, 'http://www.ebay.com/itm/Lady-Hoodie-Hollow-Out-Knitwear-Cardigan-Knit-Sweater-Coat-Jacket-Hooded-outwear-/181058572249?pt=US_CSA_WC_Sweaters&var=&hash=item2a27ee8fd9');
INSERT INTO `parsemx_entities` (`entity_id`, `platform_id`, `ins_id`, `donor_id`, `url`, `entity`, `status`, `ourl`) VALUES
(805, 925, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FPersonalized-Tee-Punk-Skull-Fringes-Girls-Loose-Stretchy-Tshirt-Ball-Top-Blouse-%2F190692566652%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2c6629a67c', 'product', 2, 'http://www.ebay.com/itm/Personalized-Tee-Punk-Skull-Fringes-Girls-Loose-Stretchy-Tshirt-Ball-Top-Blouse-/190692566652?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2c6629a67c'),
(806, 926, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBoho-Style-Girl-Halter-Beads-Collar-Slim-Full-Length-backless-Casual-Beach-Dress-%2F190696988436%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c666d1f14', 'product', 2, 'http://www.ebay.com/itm/Boho-Style-Girl-Halter-Beads-Collar-Slim-Full-Length-backless-Casual-Beach-Dress-/190696988436?pt=UK_Women_s_Dresses&var=&hash=item2c666d1f14'),
(807, 927, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirl-Bowkont-Crewneck-Hight-Waist-Tube-Tunic-Slim-mini-Career-Dresses-Size-S-M-L-%2F170862612408%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c8348fb8', 'product', 2, 'http://www.ebay.com/itm/Girl-Bowkont-Crewneck-Hight-Waist-Tube-Tunic-Slim-mini-Career-Dresses-Size-S-M-L-/170862612408?pt=US_CSA_WC_Dresses&var=&hash=item27c8348fb8'),
(808, 928, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F3-Pcs-Korean-Women-Beach-Sexy-Bikini-Swimwear-Swimsuit-Dots-Dress-With-Pad-Beach-%2F170852970973%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem27c7a171dd', 'product', 2, 'http://www.ebay.com/itm/3-Pcs-Korean-Women-Beach-Sexy-Bikini-Swimwear-Swimsuit-Dots-Dress-With-Pad-Beach-/170852970973?pt=US_CSA_WC_Swimwear&var=&hash=item27c7a171dd'),
(809, 929, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Girl-Women-Flower-Peter-Pan-Collar-3-4-Sleeve-Casual-Slim-Mini-Dress-Black-%2F181115264796%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2b4f9f1c', 'product', 2, 'http://www.ebay.com/itm/Sweet-Girl-Women-Flower-Peter-Pan-Collar-3-4-Sleeve-Casual-Slim-Mini-Dress-Black-/181115264796?pt=US_CSA_WC_Dresses&var=&hash=item2a2b4f9f1c'),
(810, 930, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2012-Hot-Women-Haren-Style-Casual-Skinny-Pants-long-Relaxed-Career-GirlsTrousers-%2F170865341287%3Fpt%3DUK_Women_s_Trousers%26var%3D%26hash%3Ditem27c85e3367', 'product', 2, 'http://www.ebay.com/itm/2012-Hot-Women-Haren-Style-Casual-Skinny-Pants-long-Relaxed-Career-GirlsTrousers-/170865341287?pt=UK_Women_s_Trousers&var=&hash=item27c85e3367'),
(811, 931, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-Retro-Sequin-Paillette-Jean-Denim-Personalized-Waistcoat-Coat-Vest-Jackets-%2F180919437468%3Fpt%3DUK_Women_s_Coats_Jackets%26var%3D%26hash%3Ditem2a1fa3889c', 'product', 2, 'http://www.ebay.com/itm/Girls-Retro-Sequin-Paillette-Jean-Denim-Personalized-Waistcoat-Coat-Vest-Jackets-/180919437468?pt=UK_Women_s_Coats_Jackets&var=&hash=item2a1fa3889c'),
(812, 932, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Sweet-Peter-Pan-Collar-Tunic-Pleated-Skirt-Slim-Dress-Sundress-Free-Belt-%2F181175000761%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2edf1eb9', 'product', 2, 'http://www.ebay.com/itm/Women-Sweet-Peter-Pan-Collar-Tunic-Pleated-Skirt-Slim-Dress-Sundress-Free-Belt-/181175000761?pt=US_CSA_WC_Dresses&var=&hash=item2a2edf1eb9'),
(813, 933, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLadies-Crewneck-Bowknot-mini-Slim-Career-Pleated-Dress-Casual-Party-Fall-Winter-%2F170898931797%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem27ca5ec055', 'product', 2, 'http://www.ebay.com/itm/Ladies-Crewneck-Bowknot-mini-Slim-Career-Pleated-Dress-Casual-Party-Fall-Winter-/170898931797?pt=UK_Women_s_Dresses&var=&hash=item27ca5ec055'),
(814, 934, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FProm-Girl-Embroidery-Sequin-Mesh-Tunic-Layer-Hem-Ruffle-Chffion-Dress-Party-ball-%2F170860246730%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem27c81076ca', 'product', 2, 'http://www.ebay.com/itm/Prom-Girl-Embroidery-Sequin-Mesh-Tunic-Layer-Hem-Ruffle-Chffion-Dress-Party-ball-/170860246730?pt=US_CSA_WC_Dresses&hash=item27c81076ca'),
(815, 935, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-OL-Ladies-Puff-Long-Sleeve-Crewneck-Mini-Career-Dresses-Free-Slim-Belt-Party-%2F181055098558%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a27b98ebe', 'product', 2, 'http://www.ebay.com/itm/New-OL-Ladies-Puff-Long-Sleeve-Crewneck-Mini-Career-Dresses-Free-Slim-Belt-Party-/181055098558?pt=US_CSA_WC_Dresses&var=&hash=item2a27b98ebe'),
(816, 936, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSwimwear-Girl-Chiffon-Wraps-Chest-Halter-Super-Mini-Tiered-Cake-SwimDress-Beach-%2F190686170209%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2c65c80c61', 'product', 2, 'http://www.ebay.com/itm/Swimwear-Girl-Chiffon-Wraps-Chest-Halter-Super-Mini-Tiered-Cake-SwimDress-Beach-/190686170209?pt=US_CSA_WC_Swimwear&var=&hash=item2c65c80c61'),
(817, 937, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCute-Girls-Stylish-Knit-T-Shirt-Sewn-Together-Wraps-Hip-Mini-Tops-Casual-Bouse-%2F180895019824%3Fpt%3DUS_Womens_Tshirts%26var%3D%26hash%3Ditem2a1e2ef330', 'product', 2, 'http://www.ebay.com/itm/Cute-Girls-Stylish-Knit-T-Shirt-Sewn-Together-Wraps-Hip-Mini-Tops-Casual-Bouse-/180895019824?pt=US_Womens_Tshirts&var=&hash=item2a1e2ef330'),
(818, 938, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Women-Chiffon-Floral-Sleeveless-Evening-Cocktail-Party-Beach-Maxi-Dress-%2F350823058389%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem51aeaf0bd5', 'product', 2, 'http://www.ebay.com/itm/Elegant-Women-Chiffon-Floral-Sleeveless-Evening-Cocktail-Party-Beach-Maxi-Dress-/350823058389?pt=US_CSA_WC_Dresses&hash=item51aeaf0bd5'),
(819, 939, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Ladies-Black-Padded-Bra-Strap-Bikini-Swimsuit-Swimwear-Beachwear-Size-S-M-L-%2F350748863879%3Fpt%3DUK_Women_s_Swimwear%26var%3D%26hash%3Ditem51aa42ed87', 'product', 2, 'http://www.ebay.com/itm/Sexy-Ladies-Black-Padded-Bra-Strap-Bikini-Swimsuit-Swimwear-Beachwear-Size-S-M-L-/350748863879?pt=UK_Women_s_Swimwear&var=&hash=item51aa42ed87'),
(820, 940, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-Sweatsuit-Hoodies-Sweater-Jackets-Coat-Long-Pants-Sport-Climb-Suits-%2F180904044922%3Fpt%3DUS_CSA_WC_Suits%26var%3D%26hash%3Ditem2a1eb8a97a', 'product', 2, 'http://www.ebay.com/itm/New-Women-Sweatsuit-Hoodies-Sweater-Jackets-Coat-Long-Pants-Sport-Climb-Suits-/180904044922?pt=US_CSA_WC_Suits&var=&hash=item2a1eb8a97a'),
(821, 941, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Round-Neck-Batwing-Long-Sleeve-OL-T-shirt-Dress-Tops-Blouse-Casual-%2F181060272988%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2808835c', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-Round-Neck-Batwing-Long-Sleeve-OL-T-shirt-Dress-Tops-Blouse-Casual-/181060272988?pt=US_CSA_WC_Dresses&var=&hash=item2a2808835c'),
(822, 942, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCool-Sexy-Women-Punk-PU-Leather-Deep-V-Neck-Bare-Back-Tank-Vest-Tops-Shirt-Black-%2F190842939728%3Fpt%3DUS_CSA_WC_Vests%26var%3D%26hash%3Ditem2c6f202950', 'product', 2, 'http://www.ebay.com/itm/Cool-Sexy-Women-Punk-PU-Leather-Deep-V-Neck-Bare-Back-Tank-Vest-Tops-Shirt-Black-/190842939728?pt=US_CSA_WC_Vests&var=&hash=item2c6f202950'),
(823, 943, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Deep-V-Neck-Mini-Slim-Dress-Wihte-Stripe-Club-Long-Sleeve-Casual-Dresses-%2F190710417976%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem2c673a0a38', 'product', 2, 'http://www.ebay.com/itm/Womens-Deep-V-Neck-Mini-Slim-Dress-Wihte-Stripe-Club-Long-Sleeve-Casual-Dresses-/190710417976?pt=US_CSA_WC_Dresses&hash=item2c673a0a38'),
(824, 944, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F1PCS-Halter-Tie-Hollow-Out-Padded-Bra-Monokini-Bikini-Beach-Swimwear-Swimsuits-%2F181109692364%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2a2afa97cc', 'product', 2, 'http://www.ebay.com/itm/1PCS-Halter-Tie-Hollow-Out-Padded-Bra-Monokini-Bikini-Beach-Swimwear-Swimsuits-/181109692364?pt=US_CSA_WC_Swimwear&var=&hash=item2a2afa97cc'),
(825, 945, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Womens-Collared-Drape-Mini-Slim-Fitted-Ruchels-Cocktail-Party-Elastic-Dress-%2F190705401816%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c66ed7fd8', 'product', 2, 'http://www.ebay.com/itm/New-Womens-Collared-Drape-Mini-Slim-Fitted-Ruchels-Cocktail-Party-Elastic-Dress-/190705401816?pt=UK_Women_s_Dresses&var=&hash=item2c66ed7fd8'),
(826, 946, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Sell-Korean-Women-Puff-Sleeve-Chiffon-Bouffant-Double-layer-Shirt-Dress-Tops-%2F170845387517%3Fpt%3DUS_CSA_WC_Shirts_Tops%26hash%3Ditem27c72dbafd', 'product', 2, 'http://www.ebay.com/itm/Hot-Sell-Korean-Women-Puff-Sleeve-Chiffon-Bouffant-Double-layer-Shirt-Dress-Tops-/170845387517?pt=US_CSA_WC_Shirts_Tops&hash=item27c72dbafd'),
(827, 947, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FOLGirl-Collarless-Bowknot-Short-Coat-Jacket-Casual-Women-Western-Top-suit-Smocks-%2F181058563129%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2a27ee6c39', 'product', 2, 'http://www.ebay.com/itm/OLGirl-Collarless-Bowknot-Short-Coat-Jacket-Casual-Women-Western-Top-suit-Smocks-/181058563129?pt=US_CSA_WC_Outerwear&var=&hash=item2a27ee6c39'),
(828, 948, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Sleeveless-Color-Block-Bodycon-Waist-Slim-Mini-Dress-Cocktail-Club-Party-%2F190823799848%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6dfc1c28', 'product', 2, 'http://www.ebay.com/itm/Women-Sleeveless-Color-Block-Bodycon-Waist-Slim-Mini-Dress-Cocktail-Club-Party-/190823799848?pt=US_CSA_WC_Dresses&var=&hash=item2c6dfc1c28'),
(829, 949, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHOt-Sexy-Womens-3-4-Sleeve-Ladies-V-neck-Mini-Slim-Lace-Pencil-Dresses-Clubwear-%2F180920723331%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a1fb72783', 'product', 2, 'http://www.ebay.com/itm/HOt-Sexy-Womens-3-4-Sleeve-Ladies-V-neck-Mini-Slim-Lace-Pencil-Dresses-Clubwear-/180920723331?pt=US_CSA_WC_Dresses&var=&hash=item2a1fb72783'),
(830, 950, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSuper-Hot-Women-Paded-Bikini-Monokini-Beach-Swimwear-Swimsuit-Size-S-M-L-1-Piece-%2F181112010173%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2a2b1df5bd', 'product', 2, 'http://www.ebay.com/itm/Super-Hot-Women-Paded-Bikini-Monokini-Beach-Swimwear-Swimsuit-Size-S-M-L-1-Piece-/181112010173?pt=US_CSA_WC_Swimwear&var=&hash=item2a2b1df5bd'),
(831, 951, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Ladies-Pete-Pan-Doll-Collar-Slim-Hight-Waist-Pencil-Mini-Casual-Work-Dress-%2F170865377556%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c85ec114', 'product', 2, 'http://www.ebay.com/itm/New-Ladies-Pete-Pan-Doll-Collar-Slim-Hight-Waist-Pencil-Mini-Casual-Work-Dress-/170865377556?pt=US_CSA_WC_Dresses&var=&hash=item27c85ec114'),
(832, 952, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-Sexy-Red-Backless-Halter-Paded-Bra-Monokini-Bikini-Beach-Swimwear-Swimsuits-%2F181111998902%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2a2b1dc9b6', 'product', 2, 'http://www.ebay.com/itm/2013-Sexy-Red-Backless-Halter-Paded-Bra-Monokini-Bikini-Beach-Swimwear-Swimsuits-/181111998902?pt=US_CSA_WC_Swimwear&var=&hash=item2a2b1dc9b6'),
(833, 953, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Chiffon-V-Neck-Long-Sleeve-Floral-Waist-Slim-Mini-Dress-Casual-Summer-%2F181118909540%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2b873c64', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Chiffon-V-Neck-Long-Sleeve-Floral-Waist-Slim-Mini-Dress-Casual-Summer-/181118909540?pt=US_CSA_WC_Dresses&var=&hash=item2a2b873c64'),
(834, 954, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLadies-Long-Sleeve-One-button-Front-Slim-Tops-Blazer-jacket-Career-Suits-Coat-%2F190711359924%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2c674869b4', 'product', 2, 'http://www.ebay.com/itm/Ladies-Long-Sleeve-One-button-Front-Slim-Tops-Blazer-jacket-Career-Suits-Coat-/190711359924?pt=US_CSA_WC_Outerwear&var=&hash=item2c674869b4'),
(835, 955, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-V-Neck-Batwing-Sleeve-Pocket-Loose-Long-Knit-Cardigan-Coat-Sweater-Tops-%2F181181229626%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem2a2f3e2a3a', 'product', 2, 'http://www.ebay.com/itm/Women-V-Neck-Batwing-Sleeve-Pocket-Loose-Long-Knit-Cardigan-Coat-Sweater-Tops-/181181229626?pt=US_CSA_WC_Sweaters&var=&hash=item2a2f3e2a3a'),
(836, 956, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FParty-Prom-Lady-Boho-Butterfly-Chiffon-One-Shoulder-Tiered-Puff-Mini-Wave-Dr-%2F190698486497%3Fpt%3DUK_Women_s_Dresses%26hash%3Ditem2c6683fae1', 'product', 2, 'http://www.ebay.com/itm/Party-Prom-Lady-Boho-Butterfly-Chiffon-One-Shoulder-Tiered-Puff-Mini-Wave-Dr-/190698486497?pt=UK_Women_s_Dresses&hash=item2c6683fae1'),
(837, 957, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F1pcs-Hot-women-V-neck-Monokini-Pleated-Padded-Bra-Bikini-Beach-Swimwear-Swimsuit-%2F181109677620%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2a2afa5e34', 'product', 2, 'http://www.ebay.com/itm/1pcs-Hot-women-V-neck-Monokini-Pleated-Padded-Bra-Bikini-Beach-Swimwear-Swimsuit-/181109677620?pt=US_CSA_WC_Swimwear&var=&hash=item2a2afa5e34'),
(838, 958, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FChic-Womens-OL-See-Through-Butterfly-Print-Long-Sleeve-Chiffon-Shirt-Tops-Blouse-%2F350788408325%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem51ac9e5405', 'product', 2, 'http://www.ebay.com/itm/Chic-Womens-OL-See-Through-Butterfly-Print-Long-Sleeve-Chiffon-Shirt-Tops-Blouse-/350788408325?pt=US_CSA_WC_Shirts_Tops&var=&hash=item51ac9e5405'),
(839, 959, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Stripe-Draped-Collar-Knitted-Open-Cardigan-Wraps-Coat-Blouse-Tops-Sweater-%2F350839375169%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem51afa80541', 'product', 2, 'http://www.ebay.com/itm/Women-Stripe-Draped-Collar-Knitted-Open-Cardigan-Wraps-Coat-Blouse-Tops-Sweater-/350839375169?pt=US_CSA_WC_Sweaters&var=&hash=item51afa80541'),
(840, 960, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-Elegant-Womens-Vintage-Sleeveless-Round-Neck-Boho-Chiffon-Maxi-Long-Dress-%2F190846756019%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6f5a64b3', 'product', 2, 'http://www.ebay.com/itm/2013-Elegant-Womens-Vintage-Sleeveless-Round-Neck-Boho-Chiffon-Maxi-Long-Dress-/190846756019?pt=US_CSA_WC_Dresses&var=&hash=item2c6f5a64b3'),
(841, 961, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Career-Women-Stretch-Mini-Drape-Mini-Slim-Fitted-Ruchels-Cocktail-Dress-%2F170873781270%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c8defc16', 'product', 2, 'http://www.ebay.com/itm/Elegant-Career-Women-Stretch-Mini-Drape-Mini-Slim-Fitted-Ruchels-Cocktail-Dress-/170873781270?pt=US_CSA_WC_Dresses&var=&hash=item27c8defc16'),
(842, 962, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FPersonalized-Women-Punk-Frayed-Denim-Sleeveless-Vest-Coat-Jean-Jacket-Waistcoat-%2F350823023446%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem51aeae8356', 'product', 2, 'http://www.ebay.com/itm/Personalized-Women-Punk-Frayed-Denim-Sleeveless-Vest-Coat-Jean-Jacket-Waistcoat-/350823023446?pt=US_CSA_WC_Outerwear&var=&hash=item51aeae8356'),
(843, 963, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Oversized-Asymmetric-Batwing-Knit-Shirt-Jumper-Loose-Sweater-Cardigan-Top-%2F181183040760%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem2a2f59ccf8', 'product', 2, 'http://www.ebay.com/itm/Womens-Oversized-Asymmetric-Batwing-Knit-Shirt-Jumper-Loose-Sweater-Cardigan-Top-/181183040760?pt=US_CSA_WC_Sweaters&var=&hash=item2a2f59ccf8'),
(844, 964, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FChic-Girl-Turtleneck-Career-Business-Polka-dot-tiered-T-shirt-Tops-Casual-Blouse-%2F170867143531%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem27c879b36b', 'product', 2, 'http://www.ebay.com/itm/Chic-Girl-Turtleneck-Career-Business-Polka-dot-tiered-T-shirt-Tops-Casual-Blouse-/170867143531?pt=US_CSA_WC_Shirts_Tops&var=&hash=item27c879b36b'),
(845, 965, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2012-Hot-Women-Haren-Style-Casual-Skinny-Pants-long-Relaxed-Career-GirlsTrousers-%2F180911823468%3Fpt%3DUS_CSA_WC_Pants%26var%3D%26hash%3Ditem2a1f2f5a6c', 'product', 2, 'http://www.ebay.com/itm/2012-Hot-Women-Haren-Style-Casual-Skinny-Pants-long-Relaxed-Career-GirlsTrousers-/180911823468?pt=US_CSA_WC_Pants&var=&hash=item2a1f2f5a6c'),
(846, 966, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-WOMEN-SEXY-3-4-SLEEVE-ROUND-NECK-LACE-SLIM-COCKTAIL-PARTY-MINI-BELT-DRESS-%2F190868707299%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c70a957e3', 'product', 2, 'http://www.ebay.com/itm/2013-WOMEN-SEXY-3-4-SLEEVE-ROUND-NECK-LACE-SLIM-COCKTAIL-PARTY-MINI-BELT-DRESS-/190868707299?pt=US_CSA_WC_Dresses&var=&hash=item2c70a957e3'),
(847, 967, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Style-Tee-Women-Face-Print-Big-Loose-T-shirts-Casual-Blouses-Batwing-Sle-%2F170862996515%3Fpt%3DUK_Women_s_T_Shirts%26var%3D%26hash%3Ditem27c83a6c23', 'product', 2, 'http://www.ebay.com/itm/Korean-Style-Tee-Women-Face-Print-Big-Loose-T-shirts-Casual-Blouses-Batwing-Sle-/170862996515?pt=UK_Women_s_T_Shirts&var=&hash=item27c83a6c23'),
(848, 968, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-V-neck-Mid-sleeve-Retro-Tunic-Mini-Slim-Lace-Dress-Party-Clubwear-%2F350768999540%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem51ab762c74', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-V-neck-Mid-sleeve-Retro-Tunic-Mini-Slim-Lace-Dress-Party-Clubwear-/350768999540?pt=UK_Women_s_Dresses&var=&hash=item51ab762c74'),
(849, 969, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Women-Doll-Collar-Rabbit-Print-Short-Sleeve-Empire-Waist-Slim-Mini-Dress-%2F190859594276%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c701e4a24', 'product', 2, 'http://www.ebay.com/itm/Sweet-Women-Doll-Collar-Rabbit-Print-Short-Sleeve-Empire-Waist-Slim-Mini-Dress-/190859594276?pt=US_CSA_WC_Dresses&var=&hash=item2c701e4a24'),
(850, 970, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Ladies-Black-Padded-Bra-Strap-Bikini-Swimsuit-Swimwear-Beachwear-Size-S-M-L-%2F181108509289%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2a2ae88a69', 'product', 2, 'http://www.ebay.com/itm/Sexy-Ladies-Black-Padded-Bra-Strap-Bikini-Swimsuit-Swimwear-Beachwear-Size-S-M-L-/181108509289?pt=US_CSA_WC_Swimwear&var=&hash=item2a2ae88a69'),
(851, 971, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-V-neck-Mid-sleeve-Retro-Tunic-Mini-Slim-Lace-Dress-Party-Clubwear-%2F350768997703%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51ab762547', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-V-neck-Mid-sleeve-Retro-Tunic-Mini-Slim-Lace-Dress-Party-Clubwear-/350768997703?pt=US_CSA_WC_Dresses&var=&hash=item51ab762547'),
(852, 972, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Korean-Sweet-Women-Chiffon-Cute-Mini-Dress-Casual-Sleeveless-Free-Satin-Belt-%2F190668670030%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c64bd044e', 'product', 2, 'http://www.ebay.com/itm/New-Korean-Sweet-Women-Chiffon-Cute-Mini-Dress-Casual-Sleeveless-Free-Satin-Belt-/190668670030?pt=UK_Women_s_Dresses&var=&hash=item2c64bd044e'),
(853, 973, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Women-Casual-Long-Sleeve-Knitted-Round-Neck-Loose-Sweater-Pullover-Tops-%2F350846778482%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem51b018fc72', 'product', 2, 'http://www.ebay.com/itm/Vintage-Women-Casual-Long-Sleeve-Knitted-Round-Neck-Loose-Sweater-Pullover-Tops-/350846778482?pt=US_CSA_WC_Sweaters&var=&hash=item51b018fc72'),
(854, 974, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBoho-Style-Girl-Halter-Beads-Collar-Slim-Full-Length-backless-Casual-Beach-Dress-%2F170868828878%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c8936ace', 'product', 2, 'http://www.ebay.com/itm/Boho-Style-Girl-Halter-Beads-Collar-Slim-Full-Length-backless-Casual-Beach-Dress-/170868828878?pt=US_CSA_WC_Dresses&var=&hash=item27c8936ace'),
(855, 975, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Black-Flora-Backless-Bodycon-Party-Club-Cocktail-Mini-Slim-Lace-Dress-%2F181112588096%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2b26c740', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Black-Flora-Backless-Bodycon-Party-Club-Cocktail-Mini-Slim-Lace-Dress-/181112588096?pt=US_CSA_WC_Dresses&var=&hash=item2a2b26c740'),
(856, 976, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWestern-Stlye-Womens-OL-lady-Casual-V-neck-Long-Sleeve-Chiffon-Shirt-Tops-Blouse-%2F350757839105%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem51aacbe101', 'product', 2, 'http://www.ebay.com/itm/Western-Stlye-Womens-OL-lady-Casual-V-neck-Long-Sleeve-Chiffon-Shirt-Tops-Blouse-/350757839105?pt=US_CSA_WC_Shirts_Tops&var=&hash=item51aacbe101'),
(857, 977, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Sex-Women-Ladies-V-neck-Mini-Slim-Lace-Dress-Clubwear-3-4-Sleeve-%2F190668947252%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c64c13f34', 'product', 2, 'http://www.ebay.com/itm/New-Sex-Women-Ladies-V-neck-Mini-Slim-Lace-Dress-Clubwear-3-4-Sleeve-/190668947252?pt=UK_Women_s_Dresses&var=&hash=item2c64c13f34'),
(858, 978, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFree-Belt-Batwing-Long-Sleeve-Zip-Front-Mini-Pleated-Women-Corsage-Dress-Career-%2F350617601981%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51a27007bd', 'product', 2, 'http://www.ebay.com/itm/Free-Belt-Batwing-Long-Sleeve-Zip-Front-Mini-Pleated-Women-Corsage-Dress-Career-/350617601981?pt=US_CSA_WC_Dresses&var=&hash=item51a27007bd'),
(859, 979, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FParty-Prom-Lady-Boho-Butterfly-Chiffon-One-Shoulder-Tiered-Puff-Mini-Wave-Dr-%2F190682937819%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem2c6596b9db', 'product', 2, 'http://www.ebay.com/itm/Party-Prom-Lady-Boho-Butterfly-Chiffon-One-Shoulder-Tiered-Puff-Mini-Wave-Dr-/190682937819?pt=US_CSA_WC_Dresses&hash=item2c6596b9db'),
(860, 980, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-Girls-Vogue-PU-Leather-High-Waist-Skater-Flared-Pleated-Mini-Skirt-%2F181285371396%3Fpt%3DUS_CSA_WC_Skirts%26var%3D%26hash%3Ditem2a35733e04', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-Girls-Vogue-PU-Leather-High-Waist-Skater-Flared-Pleated-Mini-Skirt-/181285371396?pt=US_CSA_WC_Skirts&var=&hash=item2a35733e04'),
(861, 981, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-Retro-Sequin-Paillette-Jean-Denim-Personalized-Waistcoat-Coat-Vest-Jackets-%2F190683689935%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2c65a233cf', 'product', 2, 'http://www.ebay.com/itm/Girls-Retro-Sequin-Paillette-Jean-Denim-Personalized-Waistcoat-Coat-Vest-Jackets-/190683689935?pt=US_CSA_WC_Outerwear&var=&hash=item2c65a233cf'),
(862, 982, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFall-Winter-Womens-High-Neck-knit-Sweater-Floral-Print-Long-Tops-t-Shirt-Blouse-%2F180943200796%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem2a210e221c', 'product', 2, 'http://www.ebay.com/itm/Fall-Winter-Womens-High-Neck-knit-Sweater-Floral-Print-Long-Tops-t-Shirt-Blouse-/180943200796?pt=US_CSA_WC_Sweaters&var=&hash=item2a210e221c'),
(863, 983, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBoho-Summer-Womens-Color-Block-Chiffon-Long-Pleated-Stripe-Sleeveless-Dress-%2F190700789349%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem2c66a71e65', 'product', 2, 'http://www.ebay.com/itm/Boho-Summer-Womens-Color-Block-Chiffon-Long-Pleated-Stripe-Sleeveless-Dress-/190700789349?pt=US_CSA_WC_Dresses&hash=item2c66a71e65'),
(864, 984, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Korean-Ladies-Mandarin-Collar-Career-T-Shirts-Tops-Slim-Waist-Blouse-%2F170846869934%3Fpt%3DUS_Womens_Tshirts%26var%3D%26hash%3Ditem27c74459ae', 'product', 2, 'http://www.ebay.com/itm/Fashion-Korean-Ladies-Mandarin-Collar-Career-T-Shirts-Tops-Slim-Waist-Blouse-/170846869934?pt=US_Womens_Tshirts&var=&hash=item27c74459ae'),
(865, 985, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLaides-Hollow-Stripe-Monokini-Swimsuit-Sexy-Bikini-Swimdress-Beach-Swimwear-%2F170853012561%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem27c7a21451', 'product', 2, 'http://www.ebay.com/itm/Laides-Hollow-Stripe-Monokini-Swimsuit-Sexy-Bikini-Swimdress-Beach-Swimwear-/170853012561?pt=US_CSA_WC_Swimwear&var=&hash=item27c7a21451'),
(866, 986, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Womens-Ladies-Sleeveless-Evening-Party-Bodycon-Pencil-Slim-Midi-Dress-%2F350976549125%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51b7d52105', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Womens-Ladies-Sleeveless-Evening-Party-Bodycon-Pencil-Slim-Midi-Dress-/350976549125?pt=US_CSA_WC_Dresses&var=&hash=item51b7d52105'),
(867, 987, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-U-Neck-Asymmetrical-Evening-Party-Cocktail-Swallow-Tail-Dress-Backless-%2F190690945926%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem2c6610eb86', 'product', 2, 'http://www.ebay.com/itm/Womens-U-Neck-Asymmetrical-Evening-Party-Cocktail-Swallow-Tail-Dress-Backless-/190690945926?pt=US_CSA_WC_Dresses&hash=item2c6610eb86'),
(868, 988, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweat-Girl-Cute-Rabbit-Ears-Fluffy-Balls-Warm-Hoody-Top-Coat-Long-Outwear-Hoodie-%2F181105085350%3Fpt%3DUS_Womens_Sweats_Hoodies%26var%3D%26hash%3Ditem2a2ab44ba6', 'product', 2, 'http://www.ebay.com/itm/Sweat-Girl-Cute-Rabbit-Ears-Fluffy-Balls-Warm-Hoody-Top-Coat-Long-Outwear-Hoodie-/181105085350?pt=US_Womens_Sweats_Hoodies&var=&hash=item2a2ab44ba6'),
(869, 989, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-New-Womens-Chiffon-Bustier-Party-Long-Leopard-Slim-Strapless-Dress-Cocktail-%2F190714005627%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6770c87b', 'product', 2, 'http://www.ebay.com/itm/Hot-New-Womens-Chiffon-Bustier-Party-Long-Leopard-Slim-Strapless-Dress-Cocktail-/190714005627?pt=US_CSA_WC_Dresses&var=&hash=item2c6770c87b'),
(870, 990, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FChic-Girl-Turtleneck-Career-Business-Polka-dot-tiered-T-shirt-Tops-Casual-Blouse-%2F190696981022%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem2c666d021e', 'product', 2, 'http://www.ebay.com/itm/Chic-Girl-Turtleneck-Career-Business-Polka-dot-tiered-T-shirt-Tops-Casual-Blouse-/190696981022?pt=UK_Women_s_Tops_Shirts&var=&hash=item2c666d021e'),
(871, 991, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-Collarless-Tops-Western-suits-Long-Sleeve-Slim-Coat-Jackets-Casual-Career-%2F170895833620%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem27ca2f7a14', 'product', 2, 'http://www.ebay.com/itm/Girls-Collarless-Tops-Western-suits-Long-Sleeve-Slim-Coat-Jackets-Casual-Career-/170895833620?pt=US_CSA_WC_Outerwear&var=&hash=item27ca2f7a14'),
(872, 992, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWarm-Women-Smocked-Sweater-Cardigan-Wraps-Tops-Coat-OutCoat-Fitted-Knit-Jackets-%2F180917299121%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem2a1f82e7b1', 'product', 2, 'http://www.ebay.com/itm/Warm-Women-Smocked-Sweater-Cardigan-Wraps-Tops-Coat-OutCoat-Fitted-Knit-Jackets-/180917299121?pt=US_CSA_WC_Sweaters&var=&hash=item2a1f82e7b1'),
(873, 993, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FProm-Deep-V-Bead-Cross-Back-Evening-Party-Formal-Gown-A-line-Long-Dress-Cocltail-%2F190690272841%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6606a649', 'product', 2, 'http://www.ebay.com/itm/Prom-Deep-V-Bead-Cross-Back-Evening-Party-Formal-Gown-A-line-Long-Dress-Cocltail-/190690272841?pt=US_CSA_WC_Dresses&var=&hash=item2c6606a649'),
(874, 994, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Fashion-Women-Party-Clubwear-Cocktail-Zipper-Back-Mini-Dress-E0222-%2F180798363784%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem2a186c1888', 'product', 2, 'http://www.ebay.com/itm/Sexy-Fashion-Women-Party-Clubwear-Cocktail-Zipper-Back-Mini-Dress-E0222-/180798363784?pt=US_CSA_WC_Dresses&hash=item2a186c1888'),
(875, 995, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Women-Sexy-Career-Lapel-Jersey-Stretch-Pleated-Pencil-Bodycon-Mini-Dress-%2F201024448973%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2ecdfda9cd', 'product', 2, 'http://www.ebay.com/itm/Elegant-Women-Sexy-Career-Lapel-Jersey-Stretch-Pleated-Pencil-Bodycon-Mini-Dress-/201024448973?pt=UK_Women_s_Dresses&var=&hash=item2ecdfda9cd'),
(876, 996, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Womens-Chiffon-Off-Shoulder-Halter-Block-Color-Pleated-Slim-Mini-Dress-%2F181149367151%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2d57fb6f', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Womens-Chiffon-Off-Shoulder-Halter-Block-Color-Pleated-Slim-Mini-Dress-/181149367151?pt=US_CSA_WC_Dresses&var=&hash=item2a2d57fb6f'),
(877, 997, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Lady-Crewneck-Loose-Draped-Chiffon-T-Shirt-Batwing-Sleeve-Career-Tops-Blouse-%2F181034037473%3Fpt%3DUS_Womens_Tshirts%26var%3D%26hash%3Ditem2a267830e1', 'product', 2, 'http://www.ebay.com/itm/New-Lady-Crewneck-Loose-Draped-Chiffon-T-Shirt-Batwing-Sleeve-Career-Tops-Blouse-/181034037473?pt=US_Womens_Tshirts&var=&hash=item2a267830e1'),
(878, 998, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-V-Neck-Pencil-Mini-Slim-Lace-Evening-Cocktail-Club-Party-Dress-S-M-L-%2F181175041017%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2edfbbf9', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-V-Neck-Pencil-Mini-Slim-Lace-Evening-Cocktail-Club-Party-Dress-S-M-L-/181175041017?pt=US_CSA_WC_Dresses&var=&hash=item2a2edfbbf9'),
(879, 999, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Womens-Lace-Floral-Round-Neck-Long-Sleeve-Slim-Mini-Dress-Tops-T-shirts-%2F181149444622%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem2a2d592a0e', 'product', 2, 'http://www.ebay.com/itm/Korean-Womens-Lace-Floral-Round-Neck-Long-Sleeve-Slim-Mini-Dress-Tops-T-shirts-/181149444622?pt=US_CSA_WC_Dresses&hash=item2a2d592a0e'),
(880, 1000, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Women-Girl-V-Neck-Chiffon-Floral-Polka-Dot-Puff-Sleeve-Pleated-Mini-Dress-%2F190847795461%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6f6a4105', 'product', 2, 'http://www.ebay.com/itm/Korean-Women-Girl-V-Neck-Chiffon-Floral-Polka-Dot-Puff-Sleeve-Pleated-Mini-Dress-/190847795461?pt=US_CSA_WC_Dresses&var=&hash=item2c6f6a4105'),
(881, 1001, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Polka-Dots-Harem-Fitted-Pants-Cropped-Trousers-Casual-Free-Chiffon-Belt-%2F180962627220%3Fpt%3DUK_Women_s_Shorts%26var%3D%26hash%3Ditem2a22368e94', 'product', 2, 'http://www.ebay.com/itm/Womens-Polka-Dots-Harem-Fitted-Pants-Cropped-Trousers-Casual-Free-Chiffon-Belt-/180962627220?pt=UK_Women_s_Shorts&var=&hash=item2a22368e94'),
(882, 1002, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Women-Epaulet-Long-Sleeve-Stand-up-Collar-Double-Breasted-Coat-Short-Jacket-%2F350823103222%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem51aeafbaf6', 'product', 2, 'http://www.ebay.com/itm/Hot-Women-Epaulet-Long-Sleeve-Stand-up-Collar-Double-Breasted-Coat-Short-Jacket-/350823103222?pt=US_CSA_WC_Outerwear&var=&hash=item51aeafbaf6'),
(883, 1003, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Sex-Women-Ladies-V-neck-Mini-Slim-Lace-Dress-Clubwear-3-4-Sleeve-%2F180858366845%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a1bffab7d', 'product', 2, 'http://www.ebay.com/itm/Fashion-Sex-Women-Ladies-V-neck-Mini-Slim-Lace-Dress-Clubwear-3-4-Sleeve-/180858366845?pt=US_CSA_WC_Dresses&var=&hash=item2a1bffab7d'),
(884, 1004, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Mesh-Backless-See-Through-Formal-Party-Cocktail-Bodycon-Slim-Dress-%2F190888128960%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c71d1b1c0', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Mesh-Backless-See-Through-Formal-Party-Cocktail-Bodycon-Slim-Dress-/190888128960?pt=US_CSA_WC_Dresses&var=&hash=item2c71d1b1c0'),
(885, 1005, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLadies-Deep-V-Back-Halter-Long-Princess-Dress-Sexy-Sundress-Cocktail-%2F170827898581%3Fpt%3DUK_Women_s_Dresses%26hash%3Ditem27c622ded5', 'product', 2, 'http://www.ebay.com/itm/Ladies-Deep-V-Back-Halter-Long-Princess-Dress-Sexy-Sundress-Cocktail-/170827898581?pt=UK_Women_s_Dresses&hash=item27c622ded5'),
(886, 1006, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2012-Summer-Vogue-Chiffon-Hollow-Collarless-Girl-Tee-T-Shirt-Casual-Tops-Blouse-%2F190694416206%3Fpt%3DUS_Womens_Tshirts%26var%3D%26hash%3Ditem2c6645df4e', 'product', 2, 'http://www.ebay.com/itm/2012-Summer-Vogue-Chiffon-Hollow-Collarless-Girl-Tee-T-Shirt-Casual-Tops-Blouse-/190694416206?pt=US_Womens_Tshirts&var=&hash=item2c6645df4e'),
(887, 1007, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2-Pcs-Victoria-Girl-Swimwear-Swimsuit-with-Bra-Paded-Bikini-Sundress-Underwear-%2F170852996387%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem27c7a1d523', 'product', 2, 'http://www.ebay.com/itm/2-Pcs-Victoria-Girl-Swimwear-Swimsuit-with-Bra-Paded-Bikini-Sundress-Underwear-/170852996387?pt=US_CSA_WC_Swimwear&var=&hash=item27c7a1d523'),
(888, 1008, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-U-Neck-Asymmetrical-Evening-Party-Cocktail-Swallow-Tail-Dress-Backless-%2F180909473585%3Fpt%3DUK_Women_s_Dresses%26hash%3Ditem2a1f0b7f31', 'product', 2, 'http://www.ebay.com/itm/Womens-U-Neck-Asymmetrical-Evening-Party-Cocktail-Swallow-Tail-Dress-Backless-/180909473585?pt=UK_Women_s_Dresses&hash=item2a1f0b7f31'),
(889, 1009, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBoho-Summer-Womens-Color-Block-Chiffon-Long-Pleated-Stripe-Sleeveless-Dress-%2F190693996755%3Fpt%3DUK_Women_s_Dresses%26hash%3Ditem2c663f78d3', 'product', 2, 'http://www.ebay.com/itm/Boho-Summer-Womens-Color-Block-Chiffon-Long-Pleated-Stripe-Sleeveless-Dress-/190693996755?pt=UK_Women_s_Dresses&hash=item2c663f78d3'),
(890, 1010, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Half-Sleeve-Chiffon-Colorful-Shiver-Mini-Pleated-Ruffle-Dress-Free-Belt-%2F170848056525%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c75674cd', 'product', 2, 'http://www.ebay.com/itm/Women-Half-Sleeve-Chiffon-Colorful-Shiver-Mini-Pleated-Ruffle-Dress-Free-Belt-/170848056525?pt=US_CSA_WC_Dresses&var=&hash=item27c75674cd'),
(891, 1011, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGaGa-Women-Sexy-Punk-Metallic-Spike-Studs-Rivet-Tassels-Bra-Dance-Party-Club-Pub-%2F190868226161%3Fpt%3DUS_CSA_WC_Intimates%26var%3D%26hash%3Ditem2c70a20071', 'product', 2, 'http://www.ebay.com/itm/GaGa-Women-Sexy-Punk-Metallic-Spike-Studs-Rivet-Tassels-Bra-Dance-Party-Club-Pub-/190868226161?pt=US_CSA_WC_Intimates&var=&hash=item2c70a20071'),
(892, 1012, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Girls-Beach-Summer-U-Neck-Chiffon-Loose-Vest-Mini-Dress-Swimwear-Holiday-%2F190688486308%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2c65eb63a4', 'product', 2, 'http://www.ebay.com/itm/New-Girls-Beach-Summer-U-Neck-Chiffon-Loose-Vest-Mini-Dress-Swimwear-Holiday-/190688486308?pt=US_CSA_WC_Swimwear&var=&hash=item2c65eb63a4'),
(893, 1013, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweat-Girl-Cute-Rabbit-Ears-Fluffy-Balls-Warm-Hoody-Top-Coat-Long-Outwear-Hoodie-%2F181105089978%3Fpt%3DUK_Women_s_Hoodies_Sweats%26var%3D%26hash%3Ditem2a2ab45dba', 'product', 2, 'http://www.ebay.com/itm/Sweat-Girl-Cute-Rabbit-Ears-Fluffy-Balls-Warm-Hoody-Top-Coat-Long-Outwear-Hoodie-/181105089978?pt=UK_Women_s_Hoodies_Sweats&var=&hash=item2a2ab45dba'),
(894, 1014, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-Girls-Casual-Owl-Print-Round-Neck-Long-Sleeve-T-shirt-Blouse-Tops-%2F181285397902%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a3573a58e', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womens-Girls-Casual-Owl-Print-Round-Neck-Long-Sleeve-T-shirt-Blouse-Tops-/181285397902?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a3573a58e'),
(895, 1015, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-Lace-See-through-Slim-Bodycon-Long-Maxi-Cocktail-Evening-Party-Dress-%2F201007479969%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2eccfabca1', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-Lace-See-through-Slim-Bodycon-Long-Maxi-Cocktail-Evening-Party-Dress-/201007479969?pt=US_CSA_WC_Dresses&var=&hash=item2eccfabca1'),
(896, 1016, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Korean-Ladies-Knit-Sewn-Together-Wraps-Hip-SlimT-Shirts-Tops-Bouse-Casual-%2F190685106955%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c65b7d30b', 'product', 2, 'http://www.ebay.com/itm/Hot-Korean-Ladies-Knit-Sewn-Together-Wraps-Hip-SlimT-Shirts-Tops-Bouse-Casual-/190685106955?pt=UK_Women_s_Dresses&var=&hash=item2c65b7d30b'),
(897, 1017, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2012-New-Girls-Harem-Casual-Long-Slim-Pants-Career-straight-Leg-Skinny-Trousers-%2F190696315566%3Fpt%3DUS_CSA_WC_Pants%26var%3D%26hash%3Ditem2c6662daae', 'product', 2, 'http://www.ebay.com/itm/2012-New-Girls-Harem-Casual-Long-Slim-Pants-Career-straight-Leg-Skinny-Trousers-/190696315566?pt=US_CSA_WC_Pants&var=&hash=item2c6662daae'),
(898, 1018, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Girls-Casual-Satin-Flouncing-Sleeveless-Waisted-Mini-Dress-Sundress-Belt-%2F350803628697%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51ad869299', 'product', 2, 'http://www.ebay.com/itm/Sweet-Girls-Casual-Satin-Flouncing-Sleeveless-Waisted-Mini-Dress-Sundress-Belt-/350803628697?pt=US_CSA_WC_Dresses&var=&hash=item51ad869299'),
(899, 1019, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FChic-Womens-Sleeveless-Vest-Pleat-Skirt-Chiffon-Casual-Green-Dress-Evening-Party-%2F190825853872%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6e1b73b0', 'product', 2, 'http://www.ebay.com/itm/Chic-Womens-Sleeveless-Vest-Pleat-Skirt-Chiffon-Casual-Green-Dress-Evening-Party-/190825853872?pt=US_CSA_WC_Dresses&var=&hash=item2c6e1b73b0'),
(900, 1020, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Womens-Sexy-V-neck-Lace-Slim-Pencil-Fit-Cocktail-Club-Party-Mini-Dress-%2F350794609147%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51acfcf1fb', 'product', 2, 'http://www.ebay.com/itm/Elegant-Womens-Sexy-V-neck-Lace-Slim-Pencil-Fit-Cocktail-Club-Party-Mini-Dress-/350794609147?pt=US_CSA_WC_Dresses&var=&hash=item51acfcf1fb'),
(901, 1021, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2012-Korean-Personalized-Y-neck-Pockets-Cardingan-Coat-Knit-Tops-Sweater-Jacket-%2F170870928450%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem27c8b37442', 'product', 2, 'http://www.ebay.com/itm/2012-Korean-Personalized-Y-neck-Pockets-Cardingan-Coat-Knit-Tops-Sweater-Jacket-/170870928450?pt=UK_Women_s_Tops_Shirts&var=&hash=item27c8b37442'),
(902, 1022, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirl-Mesh-Transparent-Knee-length-Pencil-Bodycon-Fit-Cocktail-Dress-us-S-M-L-XL-%2F190691702494%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c661c76de', 'product', 2, 'http://www.ebay.com/itm/Girl-Mesh-Transparent-Knee-length-Pencil-Bodycon-Fit-Cocktail-Dress-us-S-M-L-XL-/190691702494?pt=UK_Women_s_Dresses&var=&hash=item2c661c76de'),
(903, 1023, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Korean-Women-Girls-Pensil-Long-Harem-Pants-Leopard-Casual-Skinny-Trousers-%2F170827883480%3Fpt%3DUK_Women_s_Trousers%26var%3D%26hash%3Ditem27c622a3d8', 'product', 2, 'http://www.ebay.com/itm/New-Korean-Women-Girls-Pensil-Long-Harem-Pants-Leopard-Casual-Skinny-Trousers-/170827883480?pt=UK_Women_s_Trousers&var=&hash=item27c622a3d8'),
(904, 1024, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirl-Mesh-Transparent-Knee-length-Pencil-Bodycon-Fit-Cocktail-Dress-us-S-M-L-XL-%2F180907803958%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a1ef20536', 'product', 2, 'http://www.ebay.com/itm/Girl-Mesh-Transparent-Knee-length-Pencil-Bodycon-Fit-Cocktail-Dress-us-S-M-L-XL-/180907803958?pt=US_CSA_WC_Dresses&var=&hash=item2a1ef20536'),
(905, 1025, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2012-New-Girls-Harem-Casual-Long-Slim-Pants-Career-straight-Leg-Skinny-Trousers-%2F180917171040%3Fpt%3DUK_Women_s_Trousers%26var%3D%26hash%3Ditem2a1f80f360', 'product', 2, 'http://www.ebay.com/itm/2012-New-Girls-Harem-Casual-Long-Slim-Pants-Career-straight-Leg-Skinny-Trousers-/180917171040?pt=UK_Women_s_Trousers&var=&hash=item2a1f80f360'),
(906, 1026, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Sexy-Women-Ladies-V-neck-Mini-Slim-Lace-Dress-Clubwear-3-4-Sleeve-%2F190665705553%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c648fc851', 'product', 2, 'http://www.ebay.com/itm/New-Sexy-Women-Ladies-V-neck-Mini-Slim-Lace-Dress-Clubwear-3-4-Sleeve-/190665705553?pt=US_CSA_WC_Dresses&var=&hash=item2c648fc851'),
(907, 1027, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Style-Tee-Women-Face-Print-Big-Loose-T-shirts-Casual-Blouses-Batwing-Sle-%2F180910057183%3Fpt%3DUS_Womens_Tshirts%26var%3D%26hash%3Ditem2a1f1466df', 'product', 2, 'http://www.ebay.com/itm/Korean-Style-Tee-Women-Face-Print-Big-Loose-T-shirts-Casual-Blouses-Batwing-Sle-/180910057183?pt=US_Womens_Tshirts&var=&hash=item2a1f1466df'),
(908, 1028, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F3-Pcs-Hot-Girl-Charming-Halter-Strip-Bra-Bikini-Swimwear-Swimsuit-Spa-Size-S-M-%2F190688481585%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2c65eb5131', 'product', 2, 'http://www.ebay.com/itm/3-Pcs-Hot-Girl-Charming-Halter-Strip-Bra-Bikini-Swimwear-Swimsuit-Spa-Size-S-M-/190688481585?pt=US_CSA_WC_Swimwear&var=&hash=item2c65eb5131'),
(909, 1029, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2pcs-Sexy-Back-Cross-Push-Up-Padded-Bra-Bikini-Swimwear-Swimsuit-Beachwear-S-M-L-%2F350750490360%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem51aa5bbef8', 'product', 2, 'http://www.ebay.com/itm/2pcs-Sexy-Back-Cross-Push-Up-Padded-Bra-Bikini-Swimwear-Swimsuit-Beachwear-S-M-L-/350750490360?pt=US_CSA_WC_Swimwear&var=&hash=item51aa5bbef8'),
(910, 1030, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Summer-Chiffon-Mint-Green-Pleated-Sleeveless-Vest-Dress-Skirt-Formal-Party-%2F190853901698%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6fc76d82', 'product', 2, 'http://www.ebay.com/itm/Women-Summer-Chiffon-Mint-Green-Pleated-Sleeveless-Vest-Dress-Skirt-Formal-Party-/190853901698?pt=US_CSA_WC_Dresses&var=&hash=item2c6fc76d82'),
(911, 1031, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-Girls-Casual-Owl-Print-Round-Neck-Long-Sleeve-T-shirt-Blouse-Tops-%2F181265429474%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a3442f3e2', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womens-Girls-Casual-Owl-Print-Round-Neck-Long-Sleeve-T-shirt-Blouse-Tops-/181265429474?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a3442f3e2'),
(912, 1032, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2-Pcs-Girl-Lace-Petticoat-vest-Dress-Crewneck-Fit-T-shirt-Smocked-top-Blouse-%2F180911250624%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a1f269cc0', 'product', 2, 'http://www.ebay.com/itm/2-Pcs-Girl-Lace-Petticoat-vest-Dress-Crewneck-Fit-T-shirt-Smocked-top-Blouse-/180911250624?pt=US_CSA_WC_Dresses&var=&hash=item2a1f269cc0'),
(913, 1033, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-OL-Career-Chiffon-Asymmetric-Sleeveless-Bodycon-Shirts-Tops-Blouse-Belt-%2F181112608194%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a2b2715c2', 'product', 2, 'http://www.ebay.com/itm/Women-OL-Career-Chiffon-Asymmetric-Sleeveless-Bodycon-Shirts-Tops-Blouse-Belt-/181112608194?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a2b2715c2'),
(914, 1034, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Womens-Fashion-Chiffon-Pleated-Bow-Sleeveless-Shoulder-Beads-Vest-Dress-%2F350976559311%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51b7d548cf', 'product', 2, 'http://www.ebay.com/itm/Korean-Womens-Fashion-Chiffon-Pleated-Bow-Sleeveless-Shoulder-Beads-Vest-Dress-/350976559311?pt=US_CSA_WC_Dresses&var=&hash=item51b7d548cf'),
(915, 1035, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2-pcs-Hot-Women-Chic-Tunic-Loose-Slim-Mini-Button-Puff-Dress-Casual-Tank-Vest-%2F170862515315%3Fpt%3DUK_Women_s_Dresses%26hash%3Ditem27c8331473', 'product', 2, 'http://www.ebay.com/itm/2-pcs-Hot-Women-Chic-Tunic-Loose-Slim-Mini-Button-Puff-Dress-Casual-Tank-Vest-/170862515315?pt=UK_Women_s_Dresses&hash=item27c8331473'),
(916, 1036, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Women-Lady-Chiffon-Lace-Sleeveless-Vest-Skirt-Dress-Free-Blet-Summer-Party-%2F190820305778%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6dc6cb72', 'product', 2, 'http://www.ebay.com/itm/Sweet-Women-Lady-Chiffon-Lace-Sleeveless-Vest-Skirt-Dress-Free-Blet-Summer-Party-/190820305778?pt=US_CSA_WC_Dresses&var=&hash=item2c6dc6cb72'),
(917, 1037, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Sexy-Women-Lace-Backless-Sleeveless-Slim-Mini-Dress-Cocktail-Evening-Party-%2F181085038520%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2a298267b8', 'product', 2, 'http://www.ebay.com/itm/Hot-Sexy-Women-Lace-Backless-Sleeveless-Slim-Mini-Dress-Cocktail-Evening-Party-/181085038520?pt=UK_Women_s_Dresses&var=&hash=item2a298267b8'),
(918, 1038, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-Deep-V-Backless-Sleeveless-Slim-Long-Maxi-Dress-Sundress-Beach-Club-%2F350803658634%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem51ad87078a', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-Deep-V-Backless-Sleeveless-Slim-Long-Maxi-Dress-Sundress-Beach-Club-/350803658634?pt=US_CSA_WC_Dresses&hash=item51ad87078a'),
(919, 1039, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-V-Neck-Knit-Pocket-Sweater-Pullover-Jumper-Shirt-Blouse-Coat-Top-7-Colors-%2F181183066384%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a2f5a3110', 'product', 2, 'http://www.ebay.com/itm/Women-V-Neck-Knit-Pocket-Sweater-Pullover-Jumper-Shirt-Blouse-Coat-Top-7-Colors-/181183066384?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a2f5a3110'),
(920, 1040, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Sexy-PU-Leather-Patchwork-Footless-Shiny-Leggings-Pants-Tights-Stocking-%2F201038574936%3Fpt%3DUS_Womens_Leggings%26var%3D%26hash%3Ditem2eced53558', 'product', 2, 'http://www.ebay.com/itm/Womens-Sexy-PU-Leather-Patchwork-Footless-Shiny-Leggings-Pants-Tights-Stocking-/201038574936?pt=US_Womens_Leggings&var=&hash=item2eced53558'),
(921, 1041, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Vintage-Sweet-Women-Chiffon-Slim-Mini-Dress-Casual-Bat-Shirt-Cap-Sleeves-%2F170827433812%3Fpt%3DUK_Women_s_Dresses%26hash%3Ditem27c61bc754', 'product', 2, 'http://www.ebay.com/itm/Fashion-Vintage-Sweet-Women-Chiffon-Slim-Mini-Dress-Casual-Bat-Shirt-Cap-Sleeves-/170827433812?pt=UK_Women_s_Dresses&hash=item27c61bc754'),
(922, 1042, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-Fashion-Classic-Cap-Sleeve-Slim-Waistcoat-Top-Shrug-Vest-Jacket-Career-%2F180884702007%3Fpt%3DUS_CSA_WC_Vests%26var%3D%26hash%3Ditem2a1d918337', 'product', 2, 'http://www.ebay.com/itm/Girls-Fashion-Classic-Cap-Sleeve-Slim-Waistcoat-Top-Shrug-Vest-Jacket-Career-/180884702007?pt=US_CSA_WC_Vests&var=&hash=item2a1d918337'),
(923, 1043, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Sweet-Girls-Double-breasted-Crew-Neck-Mini-Sheer-Mesh-Ruffle-Slim-Belt-Dress-%2F170858651750%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c7f82066', 'product', 2, 'http://www.ebay.com/itm/New-Sweet-Girls-Double-breasted-Crew-Neck-Mini-Sheer-Mesh-Ruffle-Slim-Belt-Dress-/170858651750?pt=US_CSA_WC_Dresses&var=&hash=item27c7f82066'),
(924, 1044, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Floral-Spaghetti-Chiffon-Mini-Pleated-Backless-Wrap-Chest-Dress-Skirts-%2F190696985215%3Fpt%3DUK_Women_s_Dresses%26hash%3Ditem2c666d127f', 'product', 2, 'http://www.ebay.com/itm/Womens-Floral-Spaghetti-Chiffon-Mini-Pleated-Backless-Wrap-Chest-Dress-Skirts-/190696985215?pt=UK_Women_s_Dresses&hash=item2c666d127f'),
(925, 1045, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Womens-Hobo-Flower-Print-Stitching-Sleeveless-High-Waist-Slim-Dress-Sundress-%2F190847345646%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem2c6f6363ee', 'product', 2, 'http://www.ebay.com/itm/New-Womens-Hobo-Flower-Print-Stitching-Sleeveless-High-Waist-Slim-Dress-Sundress-/190847345646?pt=US_CSA_WC_Dresses&hash=item2c6f6363ee'),
(926, 1046, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Color-Block-Boho-Pleated-Stripe-Sleeveless-Chiffon-Beach-Long-Maxi-Dress-%2F350982976131%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem51b8373283', 'product', 2, 'http://www.ebay.com/itm/Womens-Color-Block-Boho-Pleated-Stripe-Sleeveless-Chiffon-Beach-Long-Maxi-Dress-/350982976131?pt=US_CSA_WC_Dresses&hash=item51b8373283'),
(927, 1047, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-Chiffon-Long-Sleeve-Collarless-Tunic-T-Shirts-Tops-Casual-Career-Blouse-%2F190686265411%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem2c65c98043', 'product', 2, 'http://www.ebay.com/itm/Girls-Chiffon-Long-Sleeve-Collarless-Tunic-T-Shirts-Tops-Casual-Career-Blouse-/190686265411?pt=UK_Women_s_Tops_Shirts&var=&hash=item2c65c98043'),
(928, 1048, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Boho-Style-Chiffon-Halter-Strapless-Long-Maxi-Dress-Evening-Party-Chic-%2F190677779194%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c654802fa', 'product', 2, 'http://www.ebay.com/itm/Women-Boho-Style-Chiffon-Halter-Strapless-Long-Maxi-Dress-Evening-Party-Chic-/190677779194?pt=US_CSA_WC_Dresses&var=&hash=item2c654802fa'),
(929, 1049, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-OL-Lady-Career-Long-Sleeve-Button-Down-Fit-Slim-Waisted-Blouse-Tops-Shirts-%2F181143855422%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem2a2d03e13e', 'product', 2, 'http://www.ebay.com/itm/Women-OL-Lady-Career-Long-Sleeve-Button-Down-Fit-Slim-Waisted-Blouse-Tops-Shirts-/181143855422?pt=UK_Women_s_Tops_Shirts&var=&hash=item2a2d03e13e'),
(930, 1050, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Korean-Women-Hot-leopard-Hoodie-Warm-Outcoat-Winter-jackets-Long-Sleeve-Coat-%2F180911655625%3Fpt%3DUK_Women_s_Coats_Jackets%26var%3D%26hash%3Ditem2a1f2ccac9', 'product', 2, 'http://www.ebay.com/itm/New-Korean-Women-Hot-leopard-Hoodie-Warm-Outcoat-Winter-jackets-Long-Sleeve-Coat-/180911655625?pt=UK_Women_s_Coats_Jackets&var=&hash=item2a1f2ccac9'),
(931, 1051, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Women-Sexy-Career-Lapel-Jersey-Stretch-Pleated-Pencil-Bodycon-Mini-Dress-%2F201024446122%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2ecdfd9eaa', 'product', 2, 'http://www.ebay.com/itm/Elegant-Women-Sexy-Career-Lapel-Jersey-Stretch-Pleated-Pencil-Bodycon-Mini-Dress-/201024446122?pt=US_CSA_WC_Dresses&var=&hash=item2ecdfd9eaa'),
(932, 1052, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBlack-Woman-Casual-Lace-Slim-High-Waist-Mini-Pleated-Vest-Sleeveless-Dress-s-m-%2F180921570641%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a1fc41551', 'product', 2, 'http://www.ebay.com/itm/Black-Woman-Casual-Lace-Slim-High-Waist-Mini-Pleated-Vest-Sleeveless-Dress-s-m-/180921570641?pt=US_CSA_WC_Dresses&var=&hash=item2a1fc41551');
INSERT INTO `parsemx_entities` (`entity_id`, `platform_id`, `ins_id`, `donor_id`, `url`, `entity`, `status`, `ourl`) VALUES
(933, 1053, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F3-Colors-Casual-Long-Sleeve-Round-Neck-Knit-Sweaters-Womens-Smocked-Tops-Blouse-%2F180968083821%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem2a2289d16d', 'product', 2, 'http://www.ebay.com/itm/3-Colors-Casual-Long-Sleeve-Round-Neck-Knit-Sweaters-Womens-Smocked-Tops-Blouse-/180968083821?pt=US_CSA_WC_Sweaters&var=&hash=item2a2289d16d'),
(934, 1054, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Mesh-See-through-Sheer-Bodycon-Club-Party-Evening-Cocktail-Mini-Dress-%2F181285357705%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a35730889', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Mesh-See-through-Sheer-Bodycon-Club-Party-Evening-Cocktail-Mini-Dress-/181285357705?pt=US_CSA_WC_Dresses&var=&hash=item2a35730889'),
(935, 1055, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2-pcs-Women-Sexy-Short-Tops-Smocked-T-shirt-Mini-Stripe-Slim-Club-Casual-Dress-%2F180916486297%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem2a1f768099', 'product', 2, 'http://www.ebay.com/itm/2-pcs-Women-Sexy-Short-Tops-Smocked-T-shirt-Mini-Stripe-Slim-Club-Casual-Dress-/180916486297?pt=US_CSA_WC_Dresses&hash=item2a1f768099'),
(936, 1056, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Womens-High-Waisted-Stretch-Bodycon-Slim-Pencil-Wrap-Skirts-Dress-Belt-%2F190841147722%3Fpt%3DUS_CSA_WC_Skirts%26var%3D%26hash%3Ditem2c6f04d14a', 'product', 2, 'http://www.ebay.com/itm/Elegant-Womens-High-Waisted-Stretch-Bodycon-Slim-Pencil-Wrap-Skirts-Dress-Belt-/190841147722?pt=US_CSA_WC_Skirts&var=&hash=item2c6f04d14a'),
(937, 1057, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Tunic-Loose-Long-Cotton-Blend-Wraps-Hip-T-Shirt-Tops-Casual-Blouse-%2F170851972656%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem27c7923630', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-Tunic-Loose-Long-Cotton-Blend-Wraps-Hip-T-Shirt-Tops-Casual-Blouse-/170851972656?pt=US_CSA_WC_Shirts_Tops&var=&hash=item27c7923630'),
(938, 1058, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Sexy-Elegant-Pleated-One-Shoulder-Cocktail-Party-Slim-Mini-Dress-Clubwear-%2F181165797542%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2e52b0a6', 'product', 2, 'http://www.ebay.com/itm/Women-Sexy-Elegant-Pleated-One-Shoulder-Cocktail-Party-Slim-Mini-Dress-Clubwear-/181165797542?pt=US_CSA_WC_Dresses&var=&hash=item2a2e52b0a6'),
(939, 1059, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FChic-Womens-Sleeveless-Vest-Pleat-Skirt-Chiffon-Casual-Green-Dress-Evening-Party-%2F190825854409%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c6e1b75c9', 'product', 2, 'http://www.ebay.com/itm/Chic-Womens-Sleeveless-Vest-Pleat-Skirt-Chiffon-Casual-Green-Dress-Evening-Party-/190825854409?pt=UK_Women_s_Dresses&var=&hash=item2c6e1b75c9'),
(940, 1060, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Short-Sleeve-Sheer-Lace-Slim-Mini-Pencil-Club-Casual-Career-Tunic-Dress-%2F170865334573%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c85e192d', 'product', 2, 'http://www.ebay.com/itm/Womens-Short-Sleeve-Sheer-Lace-Slim-Mini-Pencil-Club-Casual-Career-Tunic-Dress-/170865334573?pt=US_CSA_WC_Dresses&var=&hash=item27c85e192d'),
(941, 1061, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-KOREA-Fashion-Womens-Autum-Grid-Knitting-Top-Long-Coat-Jacket-3-colors-%2F170759136560%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem27c209a530', 'product', 2, 'http://www.ebay.com/itm/New-KOREA-Fashion-Womens-Autum-Grid-Knitting-Top-Long-Coat-Jacket-3-colors-/170759136560?pt=US_CSA_WC_Outerwear&var=&hash=item27c209a530'),
(942, 1062, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-New-Style-Girls-Long-Pencil-Harem-Pants-Leopard-Casual-Skinny-Trousers-%2F180890244575%3Fpt%3DUS_CSA_WC_Pants%26var%3D%26hash%3Ditem2a1de615df', 'product', 2, 'http://www.ebay.com/itm/Women-New-Style-Girls-Long-Pencil-Harem-Pants-Leopard-Casual-Skinny-Trousers-/180890244575?pt=US_CSA_WC_Pants&var=&hash=item2a1de615df'),
(943, 1063, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Girls-Batwing-Hook-Flower-Mesh-Loose-Knit-Smocked-T-Shirt-Tops-Blouses-%2F180907926517%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem2a1ef3e3f5', 'product', 2, 'http://www.ebay.com/itm/Vintage-Girls-Batwing-Hook-Flower-Mesh-Loose-Knit-Smocked-T-Shirt-Tops-Blouses-/180907926517?pt=UK_Women_s_Tops_Shirts&var=&hash=item2a1ef3e3f5'),
(944, 1064, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-Girl-Preppy-V-Neck-Button-Stripes-Knitted-Cardigan-Sweater-Outwear-Top-%2F181181212267%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem2a2f3de66b', 'product', 2, 'http://www.ebay.com/itm/New-Women-Girl-Preppy-V-Neck-Button-Stripes-Knitted-Cardigan-Sweater-Outwear-Top-/181181212267?pt=US_CSA_WC_Sweaters&var=&hash=item2a2f3de66b'),
(945, 1065, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Tunic-Loose-Long-Cotton-Blend-Wraps-Hip-T-Shirt-Tops-Casual-Blouse-%2F180896629068%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem2a1e47814c', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-Tunic-Loose-Long-Cotton-Blend-Wraps-Hip-T-Shirt-Tops-Casual-Blouse-/180896629068?pt=UK_Women_s_Tops_Shirts&var=&hash=item2a1e47814c'),
(946, 1066, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Sexy-Women-Lace-Backless-Sleeveless-Slim-Mini-Dress-Cocktail-Evening-Party-%2F190800925304%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem2c6c9f1278', 'product', 2, 'http://www.ebay.com/itm/Hot-Sexy-Women-Lace-Backless-Sleeveless-Slim-Mini-Dress-Cocktail-Evening-Party-/190800925304?pt=US_CSA_WC_Dresses&hash=item2c6c9f1278'),
(947, 1067, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Womens-Vintage-Flower-Bird-Plant-Print-Short-Sleeve-Mini-Dress-S-M-L-%2F201007067951%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2eccf4732f', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Womens-Vintage-Flower-Bird-Plant-Print-Short-Sleeve-Mini-Dress-S-M-L-/201007067951?pt=US_CSA_WC_Dresses&var=&hash=item2eccf4732f'),
(948, 1068, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Summer-Black-White-Stripes-Zebra-Chiffon-Long-Sleeve-Shirt-Tops-Blouse-%2F350794567283%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem51acfc4e73', 'product', 2, 'http://www.ebay.com/itm/Womens-Summer-Black-White-Stripes-Zebra-Chiffon-Long-Sleeve-Shirt-Tops-Blouse-/350794567283?pt=US_CSA_WC_Shirts_Tops&var=&hash=item51acfc4e73'),
(949, 1069, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Polka-Dots-Harem-Fitted-Pants-Cropped-Trousers-Casual-Free-Chiffon-Belt-%2F181059096386%3Fpt%3DUS_CSA_WC_Pants%26var%3D%26hash%3Ditem2a27f68f42', 'product', 2, 'http://www.ebay.com/itm/Womens-Polka-Dots-Harem-Fitted-Pants-Cropped-Trousers-Casual-Free-Chiffon-Belt-/181059096386?pt=US_CSA_WC_Pants&var=&hash=item2a27f68f42'),
(950, 1070, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBrand-New-Womens-Long-Sleeve-Sexy-Loose-batwing-sleeve-Hip-zip-slim-sexy-Dress-%2F350609203374%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem51a1efe0ae', 'product', 2, 'http://www.ebay.com/itm/Brand-New-Womens-Long-Sleeve-Sexy-Loose-batwing-sleeve-Hip-zip-slim-sexy-Dress-/350609203374?pt=US_CSA_WC_Dresses&hash=item51a1efe0ae'),
(951, 1071, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Women-Lady-Push-up-Padded-Bikini-Swimsuit-Swimwear-Bathing-Suit-Size-S-M-L-%2F181108522815%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2a2ae8bf3f', 'product', 2, 'http://www.ebay.com/itm/Hot-Women-Lady-Push-up-Padded-Bikini-Swimsuit-Swimwear-Bathing-Suit-Size-S-M-L-/181108522815?pt=US_CSA_WC_Swimwear&var=&hash=item2a2ae8bf3f'),
(952, 1072, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-Zipper-Lace-Stitching-Flower-Sleeveless-Slim-Jumpsuits-Rompers-Shorts-%2F181179913889%3Fpt%3DUS_Womens_Jumpsuits_Rompers%26var%3D%26hash%3Ditem2a2f2a16a1', 'product', 2, 'http://www.ebay.com/itm/New-Women-Zipper-Lace-Stitching-Flower-Sleeveless-Slim-Jumpsuits-Rompers-Shorts-/181179913889?pt=US_Womens_Jumpsuits_Rompers&var=&hash=item2a2f2a16a1'),
(953, 1073, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2012-Korean-Persinalized-Y-neck-Pockets-Cardingan-Coat-Knit-Tops-Sweater-Jacket-%2F180886706055%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a1db01787', 'product', 2, 'http://www.ebay.com/itm/2012-Korean-Persinalized-Y-neck-Pockets-Cardingan-Coat-Knit-Tops-Sweater-Jacket-/180886706055?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a1db01787'),
(954, 1074, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2-Pcs-Girl-Lace-Petticoat-vest-Dress-Crewneck-Fit-T-shirt-Smocked-top-Blouse-%2F170864551253%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem27c8522555', 'product', 2, 'http://www.ebay.com/itm/2-Pcs-Girl-Lace-Petticoat-vest-Dress-Crewneck-Fit-T-shirt-Smocked-top-Blouse-/170864551253?pt=UK_Women_s_Dresses&var=&hash=item27c8522555'),
(955, 1075, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2-PCS-Women-Floral-Off-Shoulder-Braces-Mini-Dress-Cardigan-T-shirt-Tops-Blouse-%2F350804875863%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem51ad999a57', 'product', 2, 'http://www.ebay.com/itm/2-PCS-Women-Floral-Off-Shoulder-Braces-Mini-Dress-Cardigan-T-shirt-Tops-Blouse-/350804875863?pt=US_CSA_WC_Dresses&hash=item51ad999a57'),
(956, 1076, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Style-Women-Personalized-Puff-Sleeve-Loose-Shirts-Ruffle-Tops-Casual-Blouse-%2F190696670794%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem2c6668464a', 'product', 2, 'http://www.ebay.com/itm/New-Style-Women-Personalized-Puff-Sleeve-Loose-Shirts-Ruffle-Tops-Casual-Blouse-/190696670794?pt=UK_Women_s_Tops_Shirts&var=&hash=item2c6668464a'),
(957, 1077, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Trendy-Slim-Fit-Empire-Waist-Pleated-Midi-One-Piece-Dress-Sleeveless-%2F190668644997%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c64bca285', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Trendy-Slim-Fit-Empire-Waist-Pleated-Midi-One-Piece-Dress-Sleeveless-/190668644997?pt=UK_Women_s_Dresses&var=&hash=item2c64bca285'),
(958, 1078, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Summer-Black-White-Stripes-Zebra-Chiffon-Long-Sleeve-Shirt-Tops-Blouse-%2F181140261323%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem2a2ccd09cb', 'product', 2, 'http://www.ebay.com/itm/Womens-Summer-Black-White-Stripes-Zebra-Chiffon-Long-Sleeve-Shirt-Tops-Blouse-/181140261323?pt=UK_Women_s_Tops_Shirts&var=&hash=item2a2ccd09cb'),
(959, 1079, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Round-Neck-Sleeveless-Hollow-Out-Waist-Pleated-Sundress-Slim-Mini-Dress-%2F181115270344%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2b4fb4c8', 'product', 2, 'http://www.ebay.com/itm/Womens-Round-Neck-Sleeveless-Hollow-Out-Waist-Pleated-Sundress-Slim-Mini-Dress-/181115270344?pt=US_CSA_WC_Dresses&var=&hash=item2a2b4fb4c8'),
(960, 1080, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNEW-Girl-Punk-Long-Faux-Leather-T-Shirts-Bottoming-Blouse-Dress-Shirt-%2F170827437865%3Fpt%3DUK_Women_s_T_Shirts%26hash%3Ditem27c61bd729', 'product', 2, 'http://www.ebay.com/itm/NEW-Girl-Punk-Long-Faux-Leather-T-Shirts-Bottoming-Blouse-Dress-Shirt-/170827437865?pt=UK_Women_s_T_Shirts&hash=item27c61bd729'),
(961, 1081, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Girls-Batwing-Hook-Flower-Mesh-Loose-Knit-Smocked-T-Shirt-Tops-Blouses-%2F180907861239%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a1ef2e4f7', 'product', 2, 'http://www.ebay.com/itm/Vintage-Girls-Batwing-Hook-Flower-Mesh-Loose-Knit-Smocked-T-Shirt-Tops-Blouses-/180907861239?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a1ef2e4f7'),
(962, 1082, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-OL-Lady-Career-Long-Sleeve-Button-Down-Fit-Slim-Waisted-Blouse-Tops-Shirts-%2F181143853880%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a2d03db38', 'product', 2, 'http://www.ebay.com/itm/Women-OL-Lady-Career-Long-Sleeve-Button-Down-Fit-Slim-Waisted-Blouse-Tops-Shirts-/181143853880?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a2d03db38'),
(963, 1083, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Casual-High-Waisted-Crimping-Oversize-Boyfriend-Jeans-Shorts-Pants-%2F190871286055%3Fpt%3DUS_CSA_WC_Shorts%26var%3D%26hash%3Ditem2c70d0b127', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Casual-High-Waisted-Crimping-Oversize-Boyfriend-Jeans-Shorts-Pants-/190871286055?pt=US_CSA_WC_Shorts&var=&hash=item2c70d0b127'),
(964, 1084, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-OL-Lady-Bow-Sleeveless-Slim-Career-Cocktail-Party-Pencil-Mini-Dress-%2F201007061660%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2eccf45a9c', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-OL-Lady-Bow-Sleeveless-Slim-Career-Cocktail-Party-Pencil-Mini-Dress-/201007061660?pt=US_CSA_WC_Dresses&var=&hash=item2eccf45a9c'),
(965, 1085, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Halter-Strap-Padded-Bra-Bikini-Swimsuit-Swimwear-Beachwear-S-M-L-3-Colors-%2F181109595637%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2a2af91df5', 'product', 2, 'http://www.ebay.com/itm/Sexy-Halter-Strap-Padded-Bra-Bikini-Swimsuit-Swimwear-Beachwear-S-M-L-3-Colors-/181109595637?pt=US_CSA_WC_Swimwear&var=&hash=item2a2af91df5'),
(966, 1086, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Floral-Spaghetti-Chiffon-Mini-Pleated-Backless-Wrap-Chest-Dress-Skirts-%2F170868312363%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem27c88b892b', 'product', 2, 'http://www.ebay.com/itm/Womens-Floral-Spaghetti-Chiffon-Mini-Pleated-Backless-Wrap-Chest-Dress-Skirts-/170868312363?pt=US_CSA_WC_Dresses&hash=item27c88b892b'),
(967, 1087, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Rhinestone-Open-Sleeve-Strappy-Stretch-Top-Mini-Dress-Party-Clubwear-%2F190874036540%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c70faa93c', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Rhinestone-Open-Sleeve-Strappy-Stretch-Top-Mini-Dress-Party-Clubwear-/190874036540?pt=US_CSA_WC_Dresses&var=&hash=item2c70faa93c'),
(968, 1088, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Ladys-Tassel-PAD-Bandeau-Fringe-Top-Bikini-Bottom-Beach-Swimsuit-Swimwear-%2F181137983211%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2a2caa46eb', 'product', 2, 'http://www.ebay.com/itm/Sexy-Ladys-Tassel-PAD-Bandeau-Fringe-Top-Bikini-Bottom-Beach-Swimsuit-Swimwear-/181137983211?pt=US_CSA_WC_Swimwear&var=&hash=item2a2caa46eb'),
(969, 1089, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Casual-Long-Harem-Pants-Cropped-Hip-Hop-Trousers-Skinny-Leggings-Size-S-%2F170856988876%3Fpt%3DUS_CSA_WC_Pants%26var%3D%26hash%3Ditem27c7dec0cc', 'product', 2, 'http://www.ebay.com/itm/Women-Casual-Long-Harem-Pants-Cropped-Hip-Hop-Trousers-Skinny-Leggings-Size-S-/170856988876?pt=US_CSA_WC_Pants&var=&hash=item27c7dec0cc'),
(970, 1090, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirl-One-Shoulder-Bridesmaid-Evening-Party-Wedding-Ball-Gown-Mini-Cocktail-Dress-%2F180915778270%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a1f6bb2de', 'product', 2, 'http://www.ebay.com/itm/Girl-One-Shoulder-Bridesmaid-Evening-Party-Wedding-Ball-Gown-Mini-Cocktail-Dress-/180915778270?pt=US_CSA_WC_Dresses&var=&hash=item2a1f6bb2de'),
(971, 1091, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Korean-Women-Hot-leopard-Hoodie-Warm-Outcoat-Winter-jackets-Long-Sleeve-Coat-%2F190693667798%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2c663a73d6', 'product', 2, 'http://www.ebay.com/itm/New-Korean-Women-Hot-leopard-Hoodie-Warm-Outcoat-Winter-jackets-Long-Sleeve-Coat-/190693667798?pt=US_CSA_WC_Outerwear&var=&hash=item2c663a73d6'),
(972, 1092, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Tops-Lingerie-Lace-Up-Corsets-Bustiers-Waist-Shape-8-Patterns-S-M-L-XL-2XL-%2F170899454154%3Fpt%3DUS_Corsets_Bustiers%26var%3D%26hash%3Ditem27ca66b8ca', 'product', 2, 'http://www.ebay.com/itm/Women-Tops-Lingerie-Lace-Up-Corsets-Bustiers-Waist-Shape-8-Patterns-S-M-L-XL-2XL-/170899454154?pt=US_Corsets_Bustiers&var=&hash=item27ca66b8ca'),
(973, 1093, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLady-Shrug-Shouler-3-4-Sleeve-Career-Tops-Western-Suit-Blazer-Short-Coat-Jacket-%2F180894270894%3Fpt%3DUK_Women_s_Coats_Jackets%26var%3D%26hash%3Ditem2a1e2385ae', 'product', 2, 'http://www.ebay.com/itm/Lady-Shrug-Shouler-3-4-Sleeve-Career-Tops-Western-Suit-Blazer-Short-Coat-Jacket-/180894270894?pt=UK_Women_s_Coats_Jackets&var=&hash=item2a1e2385ae'),
(974, 1094, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Ladies-V-Neck-Thin-Crochet-Knitted-Cardigan-Sweater-Coat-Blouse-Shirt-Top-%2F181181179454%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem2a2f3d663e', 'product', 2, 'http://www.ebay.com/itm/Women-Ladies-V-Neck-Thin-Crochet-Knitted-Cardigan-Sweater-Coat-Blouse-Shirt-Top-/181181179454?pt=US_CSA_WC_Sweaters&var=&hash=item2a2f3d663e'),
(975, 1095, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2-Pcs-Girls-Beach-Halter-Bra-Beard-Shorts-Mini-Bikini-Swimwear-Swimsuit-Beach-%2F180898886776%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2a1e69f478', 'product', 2, 'http://www.ebay.com/itm/2-Pcs-Girls-Beach-Halter-Bra-Beard-Shorts-Mini-Bikini-Swimwear-Swimsuit-Beach-/180898886776?pt=US_CSA_WC_Swimwear&var=&hash=item2a1e69f478'),
(976, 1096, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Pleated-One-Shoulder-Clubwear-Cocktail-Party-Evening-Slim-Mini-Dress-%2F350959845504%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51b6d64080', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Pleated-One-Shoulder-Clubwear-Cocktail-Party-Evening-Slim-Mini-Dress-/350959845504?pt=US_CSA_WC_Dresses&var=&hash=item51b6d64080'),
(977, 1097, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Girl-Leopard-Kimono-Pajamas-Sleepwear-Dress-Bowknot-Belt-Sleepwear-G-string-%2F181232259994%3Fpt%3DUS_CSA_WC_Sleepwear_Robes%26hash%3Ditem2a3248d39a', 'product', 2, 'http://www.ebay.com/itm/Sexy-Girl-Leopard-Kimono-Pajamas-Sleepwear-Dress-Bowknot-Belt-Sleepwear-G-string-/181232259994?pt=US_CSA_WC_Sleepwear_Robes&hash=item2a3248d39a'),
(978, 1098, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2-pcs-Hot-Women-Chic-Tunic-Loose-Slim-Mini-Button-Puff-Dress-Casual-Tank-Vest-%2F170859163269%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem27c7ffee85', 'product', 2, 'http://www.ebay.com/itm/2-pcs-Hot-Women-Chic-Tunic-Loose-Slim-Mini-Button-Puff-Dress-Casual-Tank-Vest-/170859163269?pt=US_CSA_WC_Dresses&hash=item27c7ffee85'),
(979, 1099, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-OL-Womens-Short-Slim-Coats-Cardigan-Top-BlouseSuit-Casual-Outwear-outcoat-%2F181058667955%3Fpt%3DUS_CSA_WC_Outerwear%26var%3D%26hash%3Ditem2a27f005b3', 'product', 2, 'http://www.ebay.com/itm/New-OL-Womens-Short-Slim-Coats-Cardigan-Top-BlouseSuit-Casual-Outwear-outcoat-/181058667955?pt=US_CSA_WC_Outerwear&var=&hash=item2a27f005b3'),
(980, 1100, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Womens-OL-Career-Embroidery-Bowknot-Neck-Blouse-Tops-Long-Sleeve-T-Shirts-%2F190818501255%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2c6dab4287', 'product', 2, 'http://www.ebay.com/itm/Retro-Womens-OL-Career-Embroidery-Bowknot-Neck-Blouse-Tops-Long-Sleeve-T-Shirts-/190818501255?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2c6dab4287'),
(981, 1101, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Ladies-Lace-Standing-Collar-Top-T-Shirt-Long-Sleeve-Blouse-Casual-%2F170829580540%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem27c63c88fc', 'product', 2, 'http://www.ebay.com/itm/Korean-Ladies-Lace-Standing-Collar-Top-T-Shirt-Long-Sleeve-Blouse-Casual-/170829580540?pt=US_CSA_WC_Shirts_Tops&var=&hash=item27c63c88fc'),
(982, 1102, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-Womens-Vintage-Classic-Totem-Prints-Long-Sleeve-Back-Zip-Shirt-Blouse-Tops-%2F350769006261%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem51ab7646b5', 'product', 2, 'http://www.ebay.com/itm/2013-Womens-Vintage-Classic-Totem-Prints-Long-Sleeve-Back-Zip-Shirt-Blouse-Tops-/350769006261?pt=UK_Women_s_Tops_Shirts&var=&hash=item51ab7646b5'),
(983, 1103, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Womens-Office-OL-Lady-Career-Casual-Button-Down-Bowknot-Shirt-Blouse-Tops-%2F201024436771%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem2ecdfd7a23', 'product', 2, 'http://www.ebay.com/itm/Korean-Womens-Office-OL-Lady-Career-Casual-Button-Down-Bowknot-Shirt-Blouse-Tops-/201024436771?pt=UK_Women_s_Tops_Shirts&var=&hash=item2ecdfd7a23'),
(984, 1104, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Fashion-Ladies-Loose-Top-T-Shirts-Free-Vest-Batwing-sleeve-Casual-%2F190668963803%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem2c64c17fdb', 'product', 2, 'http://www.ebay.com/itm/New-Fashion-Ladies-Loose-Top-T-Shirts-Free-Vest-Batwing-sleeve-Casual-/190668963803?pt=UK_Women_s_Tops_Shirts&var=&hash=item2c64c17fdb'),
(985, 1105, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Cross-Paillette-Batwing-Sleeve-Loose-Plus-Size-T-Shirt-Tops-Blouse-%2F201016852202%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2ecd89beea', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-Cross-Paillette-Batwing-Sleeve-Loose-Plus-Size-T-Shirt-Tops-Blouse-/201016852202?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2ecd89beea'),
(986, 1106, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirl-2-Pcs-Charm-Halter-Push-Up-Bikinis-Swimsuit-Swimsuits-Holyday-Bra-Size-S-M-%2F170867078337%3Fpt%3DUK_Women_s_Swimwear%26var%3D%26hash%3Ditem27c878b4c1', 'product', 2, 'http://www.ebay.com/itm/Girl-2-Pcs-Charm-Halter-Push-Up-Bikinis-Swimsuit-Swimsuits-Holyday-Bra-Size-S-M-/170867078337?pt=UK_Women_s_Swimwear&var=&hash=item27c878b4c1'),
(987, 1107, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Fashion-Girl-Lace-Tops-Floral-T-Shirt-Blouse-Sleeveless-Casual-Career-Shirts-%2F190706797236%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem2c6702cab4', 'product', 2, 'http://www.ebay.com/itm/New-Fashion-Girl-Lace-Tops-Floral-T-Shirt-Blouse-Sleeveless-Casual-Career-Shirts-/190706797236?pt=UK_Women_s_Tops_Shirts&var=&hash=item2c6702cab4'),
(988, 1108, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-Sheer-See-Through-Camouflage-Chiffon-Long-Sleeve-Shirt-Tops-Blouse-%2F350794659022%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem51acfdb4ce', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-Sheer-See-Through-Camouflage-Chiffon-Long-Sleeve-Shirt-Tops-Blouse-/350794659022?pt=UK_Women_s_Tops_Shirts&var=&hash=item51acfdb4ce'),
(989, 1109, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-Punk-PU-Leather-Shrug-Long-Slim-T-Shirts-Blouse-Tops-Mini-Dress-Clubwear-%2F350804862723%3Fpt%3DUS_Womens_Tshirts%26hash%3Ditem51ad996703', 'product', 2, 'http://www.ebay.com/itm/Girls-Punk-PU-Leather-Shrug-Long-Slim-T-Shirts-Blouse-Tops-Mini-Dress-Clubwear-/350804862723?pt=US_Womens_Tshirts&hash=item51ad996703'),
(990, 1110, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHight-Qualty-Bow-Tie-Lotus-Leaf-Womens-T-Shirts-Soft-Slim-Waist-Tops-Blouse-%2F190680341816%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2c656f1d38', 'product', 2, 'http://www.ebay.com/itm/Hight-Qualty-Bow-Tie-Lotus-Leaf-Womens-T-Shirts-Soft-Slim-Waist-Tops-Blouse-/190680341816?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2c656f1d38'),
(991, 1111, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirl-Long-Sleeve-Shrug-Shoulder-Mini-Slim-Fit-club-Dress-Bag-hip-Irregular-Hem-%2F181055104296%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a27b9a528', 'product', 2, 'http://www.ebay.com/itm/Girl-Long-Sleeve-Shrug-Shoulder-Mini-Slim-Fit-club-Dress-Bag-hip-Irregular-Hem-/181055104296?pt=US_CSA_WC_Dresses&var=&hash=item2a27b9a528'),
(992, 1112, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-Womens-Vintage-Classic-Totem-Prints-Long-Sleeve-Back-Zip-Shirt-Blouse-Tops-%2F190825811909%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2c6e1acfc5', 'product', 2, 'http://www.ebay.com/itm/2013-Womens-Vintage-Classic-Totem-Prints-Long-Sleeve-Back-Zip-Shirt-Blouse-Tops-/190825811909?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2c6e1acfc5'),
(993, 1113, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirl-2-Pcs-Charm-Halter-Push-Up-Bikinis-Swimsuit-Swimsuits-Holyday-Bra-Size-S-M-%2F180902047993%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2a1e9a30f9', 'product', 2, 'http://www.ebay.com/itm/Girl-2-Pcs-Charm-Halter-Push-Up-Bikinis-Swimsuit-Swimsuits-Holyday-Bra-Size-S-M-/180902047993?pt=US_CSA_WC_Swimwear&var=&hash=item2a1e9a30f9'),
(994, 1114, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Hollow-Bare-Shoulder-Crew-Neck-Loose-Chiffon-T-Shirt-Casual-Tops-Blouse-%2F170848719477%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem27c7609275', 'product', 2, 'http://www.ebay.com/itm/Korean-Hollow-Bare-Shoulder-Crew-Neck-Loose-Chiffon-T-Shirt-Casual-Tops-Blouse-/170848719477?pt=US_CSA_WC_Shirts_Tops&var=&hash=item27c7609275'),
(995, 1115, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FChic-Girl-Turtleneck-Career-Business-Polka-dot-tiered-T-shirt-Tops-Casual-Blouse-%2F350686777427%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem51a68f9053', 'product', 2, 'http://www.ebay.com/itm/Chic-Girl-Turtleneck-Career-Business-Polka-dot-tiered-T-shirt-Tops-Casual-Blouse-/350686777427?pt=US_CSA_WC_Shirts_Tops&var=&hash=item51a68f9053'),
(996, 1116, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Chiffon-Long-Sleeve-Collarless-See-through-Shirts-Tops-Blouses-Casual-%2F180897497163%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a1e54c04b', 'product', 2, 'http://www.ebay.com/itm/Womens-Chiffon-Long-Sleeve-Collarless-See-through-Shirts-Tops-Blouses-Casual-/180897497163?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a1e54c04b'),
(997, 1117, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Ultra-thin-Jelly-Color-Crew-Neck-Knit-Jumper-Sweater-Pullover-Tops-%2F181183052841%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem2a2f59fc29', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Ultra-thin-Jelly-Color-Crew-Neck-Knit-Jumper-Sweater-Pullover-Tops-/181183052841?pt=US_CSA_WC_Sweaters&var=&hash=item2a2f59fc29'),
(998, 1118, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Girls-Long-Sleeve-Stripes-Cardigan-Coats-Tops-Outwear-Smocked-Blouse-Casual-%2F181059062150%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a27f60986', 'product', 2, 'http://www.ebay.com/itm/New-Girls-Long-Sleeve-Stripes-Cardigan-Coats-Tops-Outwear-Smocked-Blouse-Casual-/181059062150?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a27f60986'),
(999, 1119, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNEW-Korea-Women-Ruff-Neckline-T-shirt-Long-Sleeve-Tops-Western-2-Colors-Fashion-%2F180792885568%3Fpt%3DUS_Womens_Tshirts%26var%3D%26hash%3Ditem2a18188140', 'product', 2, 'http://www.ebay.com/itm/NEW-Korea-Women-Ruff-Neckline-T-shirt-Long-Sleeve-Tops-Western-2-Colors-Fashion-/180792885568?pt=US_Womens_Tshirts&var=&hash=item2a18188140'),
(1000, 1120, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorea-Style-Womens-Long-Sleeve-Cotton-tops-dress-Hoodie-coat-%2F180759379560%3Fpt%3DUS_Womens_Sweats_Hoodies%26hash%3Ditem2a16193e68', 'product', 2, 'http://www.ebay.com/itm/Korea-Style-Womens-Long-Sleeve-Cotton-tops-dress-Hoodie-coat-/180759379560?pt=US_Womens_Sweats_Hoodies&hash=item2a16193e68'),
(1001, 1121, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Style-Women-Personalized-Puff-Sleeve-Loose-Shirts-Ruffle-Tops-Casual-Blouse-%2F180896145111%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a1e401ed7', 'product', 2, 'http://www.ebay.com/itm/New-Style-Women-Personalized-Puff-Sleeve-Loose-Shirts-Ruffle-Tops-Casual-Blouse-/180896145111?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a1e401ed7'),
(1002, 1122, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Crewneck-Deep-V-Lace-Cocktail-Party-Long-Sleeve-One-piece-Mini-Slim-Dress-%2F180961301800%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a22225528', 'product', 2, 'http://www.ebay.com/itm/Women-Crewneck-Deep-V-Lace-Cocktail-Party-Long-Sleeve-One-piece-Mini-Slim-Dress-/180961301800?pt=US_CSA_WC_Dresses&var=&hash=item2a22225528'),
(1003, 1123, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-Sheer-See-Through-Camouflage-Chiffon-Long-Sleeve-Shirt-Tops-Blouse-%2F190839453164%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2c6eeaf5ec', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-Sheer-See-Through-Camouflage-Chiffon-Long-Sleeve-Shirt-Tops-Blouse-/190839453164?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2c6eeaf5ec'),
(1004, 1124, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Boat-Neck-Sleeveless-Floral-Waist-Slim-Chiffon-Mini-Dress-Skirt-Summer-%2F181122884318%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a2bc3e2de', 'product', 2, 'http://www.ebay.com/itm/Womens-Boat-Neck-Sleeveless-Floral-Waist-Slim-Chiffon-Mini-Dress-Skirt-Summer-/181122884318?pt=US_CSA_WC_Dresses&var=&hash=item2a2bc3e2de'),
(1005, 1125, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorea-New-SnakeSkin-Chiffon-Lantern-Puff-Sleeve-Stitching-fitted-shirt-blouse-%2F180884533967%3Fpt%3DUS_CSA_WC_Shirts_Tops%26hash%3Ditem2a1d8ef2cf', 'product', 2, 'http://www.ebay.com/itm/Korea-New-SnakeSkin-Chiffon-Lantern-Puff-Sleeve-Stitching-fitted-shirt-blouse-/180884533967?pt=US_CSA_WC_Shirts_Tops&hash=item2a1d8ef2cf'),
(1006, 1126, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-New-Sexy-Korea-Women-Long-Sleeve-Casual-Mini-Dress-%2F190640336563%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c630caeb3', 'product', 2, 'http://www.ebay.com/itm/Fashion-New-Sexy-Korea-Women-Long-Sleeve-Casual-Mini-Dress-/190640336563?pt=US_CSA_WC_Dresses&var=&hash=item2c630caeb3'),
(1007, 1127, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLadies-Kimono-Sleeve-Loose-Tee-T-Shirt-Drape-Front-Tops-Casual-Smocked-Blouses-%2F190690981837%3Fpt%3DUS_Womens_Tshirts%26var%3D%26hash%3Ditem2c661177cd', 'product', 2, 'http://www.ebay.com/itm/Ladies-Kimono-Sleeve-Loose-Tee-T-Shirt-Drape-Front-Tops-Casual-Smocked-Blouses-/190690981837?pt=US_Womens_Tshirts&var=&hash=item2c661177cd'),
(1008, 1128, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FChic-Women-Ladies-Summer-Casual-Floral-Print-Leggings-Tights-Capri-Pencil-Pants-%2F181165879355%3Fpt%3DUS_Womens_Leggings%26var%3D%26hash%3Ditem2a2e53f03b', 'product', 2, 'http://www.ebay.com/itm/Chic-Women-Ladies-Summer-Casual-Floral-Print-Leggings-Tights-Capri-Pencil-Pants-/181165879355?pt=US_Womens_Leggings&var=&hash=item2a2e53f03b'),
(1009, 1129, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Chic-Womens-OL-Ladies-Casual-Floral-Chiffon-Long-Sleeve-Shirt-Tops-Blouse-%2F181115255636%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a2b4f7b54', 'product', 2, 'http://www.ebay.com/itm/Retro-Chic-Womens-OL-Ladies-Casual-Floral-Chiffon-Long-Sleeve-Shirt-Tops-Blouse-/181115255636?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a2b4f7b54'),
(1010, 1130, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNEW-WHITe-Lady-One-Off-Shoulder-Asymmetric-Mini-Dress-Lace-Hollow-Long-Sleeve-%2F170826236197%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem27c6098125', 'product', 2, 'http://www.ebay.com/itm/NEW-WHITe-Lady-One-Off-Shoulder-Asymmetric-Mini-Dress-Lace-Hollow-Long-Sleeve-/170826236197?pt=US_CSA_WC_Dresses&hash=item27c6098125'),
(1011, 1131, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-Bowknot-Chiffon-Round-neck-Casual-Slim-Pleated-Tunic-Mini-Dress-%2F170863973785%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c8495599', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womens-Bowknot-Chiffon-Round-neck-Casual-Slim-Pleated-Tunic-Mini-Dress-/170863973785?pt=US_CSA_WC_Dresses&var=&hash=item27c8495599'),
(1012, 1132, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-leopard-Halter-Top-Tie-Side-Strap-Push-up-Bikini-Swimsuit-Swimwear-S-M-L-%2F350748888546%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem51aa434de2', 'product', 2, 'http://www.ebay.com/itm/Sexy-leopard-Halter-Top-Tie-Side-Strap-Push-up-Bikini-Swimsuit-Swimwear-S-M-L-/350748888546?pt=US_CSA_WC_Swimwear&var=&hash=item51aa434de2'),
(1013, 1133, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2Pcs-Girl-Star-Hollow-Shoulder-Chiffon-Top-T-Shirts-Blouse-Long-Dress-Peticoat-%2F190691346757%3Fpt%3DUS_Womens_Tshirts%26var%3D%26hash%3Ditem2c66170945', 'product', 2, 'http://www.ebay.com/itm/2Pcs-Girl-Star-Hollow-Shoulder-Chiffon-Top-T-Shirts-Blouse-Long-Dress-Peticoat-/190691346757?pt=US_Womens_Tshirts&var=&hash=item2c66170945'),
(1014, 1134, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-Floral-Drawstring-Colloar-long-Sleeve-Career-T-Shirts-Womens-Tops-Blouse-%2F181057984089%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a27e59659', 'product', 2, 'http://www.ebay.com/itm/Girls-Floral-Drawstring-Colloar-long-Sleeve-Career-T-Shirts-Womens-Tops-Blouse-/181057984089?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a27e59659'),
(1015, 1135, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Womens-Girls-Casual-Dog-Print-Long-Sleeve-V-Neck-Chiffon-Shirt-Tops-Blouse-%2F190842982243%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2c6f20cf63', 'product', 2, 'http://www.ebay.com/itm/Sweet-Womens-Girls-Casual-Dog-Print-Long-Sleeve-V-Neck-Chiffon-Shirt-Tops-Blouse-/190842982243?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2c6f20cf63'),
(1016, 1136, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStock-Ladies-Batwing-Crewneck-Color-Block-Loose-Tee-T-shirts-Top-Casual-Blouse-%2F170860819690%3Fpt%3DUS_Womens_Tshirts%26var%3D%26hash%3Ditem27c81934ea', 'product', 2, 'http://www.ebay.com/itm/Stock-Ladies-Batwing-Crewneck-Color-Block-Loose-Tee-T-shirts-Top-Casual-Blouse-/170860819690?pt=US_Womens_Tshirts&var=&hash=item27c81934ea'),
(1017, 1137, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Women-Color-Block-Chiffon-Long-Sleeve-Button-Down-OL-Shirt-Tops-Blouse-%2F190823806049%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem2c6dfc3461', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Women-Color-Block-Chiffon-Long-Sleeve-Button-Down-OL-Shirt-Tops-Blouse-/190823806049?pt=UK_Women_s_Tops_Shirts&var=&hash=item2c6dfc3461'),
(1018, 1138, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBoho-Retro-Womens-totem-pattern-Dress-Mini-Sleeve-Summer-Club-Hot-Dance-Dresses-%2F170889916792%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c9d53178', 'product', 2, 'http://www.ebay.com/itm/Boho-Retro-Womens-totem-pattern-Dress-Mini-Sleeve-Summer-Club-Hot-Dance-Dresses-/170889916792?pt=US_CSA_WC_Dresses&var=&hash=item27c9d53178'),
(1019, 1139, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-One-Shoulder-Sheer-Mini-Tiered-Dress-Pleated-Skirt-Evening-Party-%2F170827893234%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem27c622c9f2', 'product', 2, 'http://www.ebay.com/itm/Women-One-Shoulder-Sheer-Mini-Tiered-Dress-Pleated-Skirt-Evening-Party-/170827893234?pt=UK_Women_s_Dresses&var=&hash=item27c622c9f2'),
(1020, 1140, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-V-Neck-Hot-Women-Halter-Jumpsuits-Bikini-Swimwear-Swimdress-Backless-Beach-%2F170854204346%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem27c7b443ba', 'product', 2, 'http://www.ebay.com/itm/Sexy-V-Neck-Hot-Women-Halter-Jumpsuits-Bikini-Swimwear-Swimdress-Backless-Beach-/170854204346?pt=US_CSA_WC_Swimwear&var=&hash=item27c7b443ba'),
(1021, 1141, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-V-neck-Wide-Stripe-Batwing-Sleeve-Blouse-Shoulder-Stripe-Sweater-Top-Shirt-%2F180760057745%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a16239791', 'product', 2, 'http://www.ebay.com/itm/Women-V-neck-Wide-Stripe-Batwing-Sleeve-Blouse-Shoulder-Stripe-Sweater-Top-Shirt-/180760057745?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a16239791'),
(1022, 1142, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-Lady-Summer-Sleeveless-Crew-Neck-Sundress-Mini-Casual-Party-Dress-%2F350839276460%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51afa683ac', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womens-Lady-Summer-Sleeveless-Crew-Neck-Sundress-Mini-Casual-Party-Dress-/350839276460?pt=US_CSA_WC_Dresses&var=&hash=item51afa683ac'),
(1023, 1143, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Ladies-One-Off-Shoulder-Asymmetric-Mini-Dress-Lace-Hollow-Long-Sleeve-%2F170827898041%3Fpt%3DUK_Women_s_Dresses%26hash%3Ditem27c622dcb9', 'product', 2, 'http://www.ebay.com/itm/Korean-Ladies-One-Off-Shoulder-Asymmetric-Mini-Dress-Lace-Hollow-Long-Sleeve-/170827898041?pt=UK_Women_s_Dresses&hash=item27c622dcb9'),
(1024, 1144, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Charm-Ladies-Halter-V-Neck-Swimsuits-Bikini-Swimwear-Summer-Beach-Size-S-M-L-%2F190687013243%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2c65d4e97b', 'product', 2, 'http://www.ebay.com/itm/Hot-Charm-Ladies-Halter-V-Neck-Swimsuits-Bikini-Swimwear-Summer-Beach-Size-S-M-L-/190687013243?pt=US_CSA_WC_Swimwear&var=&hash=item2c65d4e97b'),
(1025, 1145, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Sew-Together-Mini-club-Cocktail-Party-Dresses-Long-T-Shirt-Slim-Top-Blouse-%2F180920195318%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a1faf18f6', 'product', 2, 'http://www.ebay.com/itm/Women-Sew-Together-Mini-club-Cocktail-Party-Dresses-Long-T-Shirt-Slim-Top-Blouse-/180920195318?pt=US_CSA_WC_Dresses&var=&hash=item2a1faf18f6'),
(1026, 1146, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCharm-Deep-V-Neck-Women-Sheer-Lace-Shrink-Waist-Slim-Mini-Casual-Pleated-Dress-%2F180904750627%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem2a1ec36e23', 'product', 2, 'http://www.ebay.com/itm/Charm-Deep-V-Neck-Women-Sheer-Lace-Shrink-Waist-Slim-Mini-Casual-Pleated-Dress-/180904750627?pt=US_CSA_WC_Dresses&hash=item2a1ec36e23'),
(1027, 1147, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2Pcs-Sexy-Women-Girl-Bandeau-Padded-Bra-Low-Rise-Bikini-Swimwear-Swimsuit-Gift-%2F181154088229%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2a2da00525', 'product', 2, 'http://www.ebay.com/itm/2Pcs-Sexy-Women-Girl-Bandeau-Padded-Bra-Low-Rise-Bikini-Swimwear-Swimsuit-Gift-/181154088229?pt=US_CSA_WC_Swimwear&var=&hash=item2a2da00525'),
(1028, 1148, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2014-Women-High-Waist-Slim-Haren-Elastic-Cropped-Skinny-Pants-Trousers-Free-Belt-%2F201024418150%3Fpt%3DUK_Women_s_Trousers%26var%3D%26hash%3Ditem2ecdfd3166', 'product', 2, 'http://www.ebay.com/itm/2014-Women-High-Waist-Slim-Haren-Elastic-Cropped-Skinny-Pants-Trousers-Free-Belt-/201024418150?pt=UK_Women_s_Trousers&var=&hash=item2ecdfd3166'),
(1029, 1149, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Sexy-Womens-Sheer-Thongs-V-G-String-Panties-Lingerie-Underpants-Underwear-%2F190695545006%3Fpt%3DUK_Women_s_Lingerie%26var%3D%26hash%3Ditem2c665718ae', 'product', 2, 'http://www.ebay.com/itm/Hot-Sexy-Womens-Sheer-Thongs-V-G-String-Panties-Lingerie-Underpants-Underwear-/190695545006?pt=UK_Women_s_Lingerie&var=&hash=item2c665718ae'),
(1030, 1150, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Lady-Bikini-Charm-Tights-PantyHose-Sheer-Rayon-Stocking-Skinny-Club-Legging-%2F180910074133%3Fpt%3DUK_Hosiery_Socks%26var%3D%26hash%3Ditem2a1f14a915', 'product', 2, 'http://www.ebay.com/itm/Sexy-Lady-Bikini-Charm-Tights-PantyHose-Sheer-Rayon-Stocking-Skinny-Club-Legging-/180910074133?pt=UK_Hosiery_Socks&var=&hash=item2a1f14a915'),
(1031, 1151, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Sexy-Womens-Sheer-Thongs-V-G-String-Panties-Lingerie-Underpants-Underwear-%2F170867006937%3Fpt%3DUS_Women_s_Panties%26var%3D%26hash%3Ditem27c8779dd9', 'product', 2, 'http://www.ebay.com/itm/Hot-Sexy-Womens-Sheer-Thongs-V-G-String-Panties-Lingerie-Underpants-Underwear-/170867006937?pt=US_Women_s_Panties&var=&hash=item27c8779dd9'),
(1032, 1152, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-Sheer-Fishnet-Ultrathin-Lace-Mesh-Silk-Top-Thigh-High-Socks-Stocking-%2F190836830937%3Fpt%3DUS_CSA_WC_Hosiery_Socks%26var%3D%26hash%3Ditem2c6ec2f2d9', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-Sheer-Fishnet-Ultrathin-Lace-Mesh-Silk-Top-Thigh-High-Socks-Stocking-/190836830937?pt=US_CSA_WC_Hosiery_Socks&var=&hash=item2c6ec2f2d9'),
(1033, 1153, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Hot-Girls-Prevent-Exposed-Lace-Wrapped-Chest-Elastic-Underwear-Bra-2-color-%2F190680330474%3Fpt%3DUS_CSA_WC_Intimates%26var%3D%26hash%3Ditem2c656ef0ea', 'product', 2, 'http://www.ebay.com/itm/Sexy-Hot-Girls-Prevent-Exposed-Lace-Wrapped-Chest-Elastic-Underwear-Bra-2-color-/190680330474?pt=US_CSA_WC_Intimates&var=&hash=item2c656ef0ea'),
(1034, 1154, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Winter-Thick-Warm-Slim-Stretch-Footed-Tights-Leggings-Pantyhose-Stockings-%2F201020376369%3Fpt%3DUK_Women_s_Leggins%26var%3D%26hash%3Ditem2ecdbf8531', 'product', 2, 'http://www.ebay.com/itm/Womens-Winter-Thick-Warm-Slim-Stretch-Footed-Tights-Leggings-Pantyhose-Stockings-/201020376369?pt=UK_Women_s_Leggins&var=&hash=item2ecdbf8531'),
(1035, 1155, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Leopard-Lingerie-BabyDoll-Underwear-Sleepwear-Nightwear-G-string-%2F350823697486%3Fpt%3DLH_DefaultDomain_0%26hash%3Ditem51aeb8cc4e', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Leopard-Lingerie-BabyDoll-Underwear-Sleepwear-Nightwear-G-string-/350823697486?pt=LH_DefaultDomain_0&hash=item51aeb8cc4e'),
(1036, 1156, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Girls-Reusable-Breast-Round-Nipple-Cover-Push-Up-Silicon-Pad-Pasties-Shape-%2F170868297139%3Fpt%3DUS_CSA_WC_Intimates%26hash%3Ditem27c88b4db3', 'product', 2, 'http://www.ebay.com/itm/Sexy-Girls-Reusable-Breast-Round-Nipple-Cover-Push-Up-Silicon-Pad-Pasties-Shape-/170868297139?pt=US_CSA_WC_Intimates&hash=item27c88b4db3'),
(1037, 1157, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBlack-Sexy-Women-Sheer-Open-Crotch-Pantyhose-Lingerie-Tights-Stockings-Leggings-%2F350823723144%3Fpt%3DUS_CSA_WC_Hosiery_Socks%26hash%3Ditem51aeb93088', 'product', 2, 'http://www.ebay.com/itm/Black-Sexy-Women-Sheer-Open-Crotch-Pantyhose-Lingerie-Tights-Stockings-Leggings-/350823723144?pt=US_CSA_WC_Hosiery_Socks&hash=item51aeb93088'),
(1038, 1158, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Mesh-Bodysuit-Fishnet-Crotch-Body-Stocking-Lingerie-Harnesses-Sleepwear-%2F181165917882%3Fpt%3DLH_DefaultDomain_0%26hash%3Ditem2a2e5486ba', 'product', 2, 'http://www.ebay.com/itm/Women-Mesh-Bodysuit-Fishnet-Crotch-Body-Stocking-Lingerie-Harnesses-Sleepwear-/181165917882?pt=LH_DefaultDomain_0&hash=item2a2e5486ba'),
(1039, 1159, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Sheer-Halter-Bow-Babydoll-Lingerie-NightDress-Sleepwear-Underwear-G-string-%2F190845580469%3Fpt%3DLH_DefaultDomain_0%26var%3D%26hash%3Ditem2c6f4874b5', 'product', 2, 'http://www.ebay.com/itm/Women-Sheer-Halter-Bow-Babydoll-Lingerie-NightDress-Sleepwear-Underwear-G-string-/190845580469?pt=LH_DefaultDomain_0&var=&hash=item2c6f4874b5'),
(1040, 1160, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-lingerie-Mesh-Fishnet-Open-Crotch-Body-Stocking-Bodysuit-Underwear-%2F350823681632%3Fpt%3DLH_DefaultDomain_0%26hash%3Ditem51aeb88e60', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-lingerie-Mesh-Fishnet-Open-Crotch-Body-Stocking-Bodysuit-Underwear-/350823681632?pt=LH_DefaultDomain_0&hash=item51aeb88e60'),
(1041, 1161, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Black-Fishnet-Mesh-Open-Crotch-Pantyhose-Tights-Lingerie-Stockings-%2F350823728320%3Fpt%3DUS_CSA_WC_Hosiery_Socks%26hash%3Ditem51aeb944c0', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Black-Fishnet-Mesh-Open-Crotch-Pantyhose-Tights-Lingerie-Stockings-/350823728320?pt=US_CSA_WC_Hosiery_Socks&hash=item51aeb944c0'),
(1042, 1162, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Lady-Sheer-Babydoll-Lingerie-NightDress-Sleepwear-Underwear-G-string-%2F350823146109%3Fpt%3DUS_CSA_WC_Sleepwear_Robes%26var%3D%26hash%3Ditem51aeb0627d', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Lady-Sheer-Babydoll-Lingerie-NightDress-Sleepwear-Underwear-G-string-/350823146109?pt=US_CSA_WC_Sleepwear_Robes&var=&hash=item51aeb0627d'),
(1043, 1163, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Ladies-Casual-Slim-Mini-Tunic-Stretchy-Fitted-Elastic-Skirts-Wraps-Hip-%2F190714710111%3Fpt%3DUK_Women_s_Skirts%26var%3D%26hash%3Ditem2c677b885f', 'product', 2, 'http://www.ebay.com/itm/Fashion-Ladies-Casual-Slim-Mini-Tunic-Stretchy-Fitted-Elastic-Skirts-Wraps-Hip-/190714710111?pt=UK_Women_s_Skirts&var=&hash=item2c677b885f'),
(1044, 1164, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Winter-Thick-Warm-Slim-Stretch-Footed-Tights-Leggings-Pantyhose-Stockings-%2F350959002653%3Fpt%3DUS_CSA_WC_Hosiery_Socks%26var%3D%26hash%3Ditem51b6c9641d', 'product', 2, 'http://www.ebay.com/itm/Womens-Winter-Thick-Warm-Slim-Stretch-Footed-Tights-Leggings-Pantyhose-Stockings-/350959002653?pt=US_CSA_WC_Hosiery_Socks&var=&hash=item51b6c9641d'),
(1045, 1165, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Chiffon-Colorful-HOBO-Cover-UP-Sarong-Skirt-Dress-Scarf-Swimwear-Beachwear-%2F350804197870%3Fpt%3DUS_CSA_WC_Swimwear%26hash%3Ditem51ad8f41ee', 'product', 2, 'http://www.ebay.com/itm/Women-Chiffon-Colorful-HOBO-Cover-UP-Sarong-Skirt-Dress-Scarf-Swimwear-Beachwear-/350804197870?pt=US_CSA_WC_Swimwear&hash=item51ad8f41ee'),
(1046, 1166, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSummer-Womens-Deep-U-Neck-Backless-Mini-Sleeveless-Slim-Vest-Tops-Casual-Blouse-%2F170881348316%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem27c95272dc', 'product', 2, 'http://www.ebay.com/itm/Summer-Womens-Deep-U-Neck-Backless-Mini-Sleeveless-Slim-Vest-Tops-Casual-Blouse-/170881348316?pt=UK_Women_s_Tops_Shirts&var=&hash=item27c95272dc'),
(1047, 1167, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-Colorful-Chiffon-Beach-Cover-Up-Shirt-Dress-Sarong-Swimwear-Swimsuit-%2F350804195555%3Fpt%3DUS_CSA_WC_Swimwear%26hash%3Ditem51ad8f38e3', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-Colorful-Chiffon-Beach-Cover-Up-Shirt-Dress-Sarong-Swimwear-Swimsuit-/350804195555?pt=US_CSA_WC_Swimwear&hash=item51ad8f38e3'),
(1048, 1168, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Girl-Deep-U-Neck-Backless-Casual-Slim-Long-Vest-Tops-Blouses-Clubwear-%2F200994773234%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2ecc38d8f2', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Girl-Deep-U-Neck-Backless-Casual-Slim-Long-Vest-Tops-Blouses-Clubwear-/200994773234?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2ecc38d8f2'),
(1049, 1169, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHOt-Womens-Deep-U-Neck-Backless-Sleeveless-Slim-Long-Vest-Tops-Casual-Blouses-%2F180932340688%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2a20686bd0', 'product', 2, 'http://www.ebay.com/itm/HOt-Womens-Deep-U-Neck-Backless-Sleeveless-Slim-Long-Vest-Tops-Casual-Blouses-/180932340688?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2a20686bd0'),
(1050, 1170, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Womens-Skinny-Cargo-Harem-Casual-Pants-Cropped-Capris-Long-Fited-Trousers-%2F190690978718%3Fpt%3DUS_CSA_WC_Pants%26var%3D%26hash%3Ditem2c66116b9e', 'product', 2, 'http://www.ebay.com/itm/Hot-Womens-Skinny-Cargo-Harem-Casual-Pants-Cropped-Capris-Long-Fited-Trousers-/190690978718?pt=US_CSA_WC_Pants&var=&hash=item2c66116b9e'),
(1051, 1171, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Summer-Solid-Batwing-Short-Sleeve-Tops-Overall-Loose-Blouse-T-Shirt-Shirt-%2F190872638721%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2c70e55501', 'product', 2, 'http://www.ebay.com/itm/Women-Summer-Solid-Batwing-Short-Sleeve-Tops-Overall-Loose-Blouse-T-Shirt-Shirt-/190872638721?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2c70e55501'),
(1052, 1172, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSeamless-Comfy-Racerback-Sports-Running-Fitness-Yoga-Bra-Exercise-Walk-Vest-Tops-%2F350789237383%3Fpt%3DUS_CSA_WC_Intimates%26var%3D%26hash%3Ditem51acaafa87', 'product', 2, 'http://www.ebay.com/itm/Seamless-Comfy-Racerback-Sports-Running-Fitness-Yoga-Bra-Exercise-Walk-Vest-Tops-/350789237383?pt=US_CSA_WC_Intimates&var=&hash=item51acaafa87'),
(1053, 1173, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-Colorful-Floral-Print-Slim-Cropped-Pants-Stretch-Trousers-Fit-leggings-%2F180906285523%3Fpt%3DUS_Womens_Leggings%26hash%3Ditem2a1edad9d3', 'product', 2, 'http://www.ebay.com/itm/New-Women-Colorful-Floral-Print-Slim-Cropped-Pants-Stretch-Trousers-Fit-leggings-/180906285523?pt=US_Womens_Leggings&hash=item2a1edad9d3'),
(1054, 1174, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSeamless-Racerback-Workout-Tranning-Sports-Running-Gym-Yoga-Bra-Padded-Vest-Tops-%2F181137410143%3Fpt%3DUS_CSA_WC_Intimates%26var%3D%26hash%3Ditem2a2ca1885f', 'product', 2, 'http://www.ebay.com/itm/Seamless-Racerback-Workout-Tranning-Sports-Running-Gym-Yoga-Bra-Padded-Vest-Tops-/181137410143?pt=US_CSA_WC_Intimates&var=&hash=item2a2ca1885f'),
(1055, 1175, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Womens-Shorts-A-Line-S-Body-Mini-Elastic-Skirts-Casual-Career-Club-Stetchy-%2F170896264090%3Fpt%3DUS_CSA_WC_Skirts%26var%3D%26hash%3Ditem27ca360b9a', 'product', 2, 'http://www.ebay.com/itm/New-Womens-Shorts-A-Line-S-Body-Mini-Elastic-Skirts-Casual-Career-Club-Stetchy-/170896264090?pt=US_CSA_WC_Skirts&var=&hash=item27ca360b9a'),
(1056, 1176, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Lace-bath-Robes-Sleepwear-Sexy-halter-Dress-Underwear-Chemise-Lingerie-%2F170867100239%3Fpt%3DUK_Women_s_Nightwear%26var%3D%26hash%3Ditem27c8790a4f', 'product', 2, 'http://www.ebay.com/itm/Womens-Lace-bath-Robes-Sleepwear-Sexy-halter-Dress-Underwear-Chemise-Lingerie-/170867100239?pt=UK_Women_s_Nightwear&var=&hash=item27c8790a4f'),
(1057, 1177, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Girls-Mini-Camisole-Slim-Strander-Vest-Sleeveless-Fit-Dress-Casual-ClubWear-%2F180911244587%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a1f26852b', 'product', 2, 'http://www.ebay.com/itm/New-Girls-Mini-Camisole-Slim-Strander-Vest-Sleeveless-Fit-Dress-Casual-ClubWear-/180911244587?pt=US_CSA_WC_Dresses&var=&hash=item2a1f26852b'),
(1058, 1178, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Girl-Plain-Spaghetti-Racer-Back-Long-T-Shirt-Tank-Top-Cami-Vest-Dress-%2F350834677669%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem51af6057a5', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Girl-Plain-Spaghetti-Racer-Back-Long-T-Shirt-Tank-Top-Cami-Vest-Dress-/350834677669?pt=US_CSA_WC_Shirts_Tops&var=&hash=item51af6057a5'),
(1059, 1179, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-Leapard-Strap-Sleeveless-Slim-Vest-T-Shirt-Underwear-Tops-Clubwear-%2F350803654347%3Fpt%3DUS_CSA_WC_Shirts_Tops%26hash%3Ditem51ad86f6cb', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-Leapard-Strap-Sleeveless-Slim-Vest-T-Shirt-Underwear-Tops-Clubwear-/350803654347?pt=US_CSA_WC_Shirts_Tops&hash=item51ad86f6cb'),
(1060, 1180, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Vintage-Skull-Skeleton-Bone-Stretchy-Tights-Skinny-Leggings-Pantyhose-%2F181285386744%3Fpt%3DUS_Womens_Leggings%26hash%3Ditem2a357379f8', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Vintage-Skull-Skeleton-Bone-Stretchy-Tights-Skinny-Leggings-Pantyhose-/181285386744?pt=US_Womens_Leggings&hash=item2a357379f8');
INSERT INTO `parsemx_entities` (`entity_id`, `platform_id`, `ins_id`, `donor_id`, `url`, `entity`, `status`, `ourl`) VALUES
(1061, 1181, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Lady-Slimming-Band-Belt-Breathable-Body-Waist-Slim-Shaper-Girdle-Shapewear-%2F190881422292%3Fpt%3DUS_Shapewear%26hash%3Ditem2c716b5bd4', 'product', 2, 'http://www.ebay.com/itm/Women-Lady-Slimming-Band-Belt-Breathable-Body-Waist-Slim-Shaper-Girdle-Shapewear-/190881422292?pt=US_Shapewear&hash=item2c716b5bd4'),
(1062, 1182, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Lingerie-Nightdress-Nightwear-Bathrobe-Sleepwear-Pajamas-ROBE-Gown-G-string-%2F181137421607%3Fpt%3DUS_CSA_WC_Sleepwear_Robes%26var%3D%26hash%3Ditem2a2ca1b527', 'product', 2, 'http://www.ebay.com/itm/Sexy-Lingerie-Nightdress-Nightwear-Bathrobe-Sleepwear-Pajamas-ROBE-Gown-G-string-/181137421607?pt=US_CSA_WC_Sleepwear_Robes&var=&hash=item2a2ca1b527'),
(1063, 1183, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Woman-V-Neck-Adjustable-Strap-Padded-Seamless-Bra-Camisole-Tank-Tops-Camis-%2F190882356350%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2c71799c7e', 'product', 2, 'http://www.ebay.com/itm/Sexy-Woman-V-Neck-Adjustable-Strap-Padded-Seamless-Bra-Camisole-Tank-Tops-Camis-/190882356350?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2c71799c7e'),
(1064, 1184, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Copped-Ankle-length-Skinny-Pants-Elastic-Fited-Leggings-Trousers-%2F170860265371%3Fpt%3DUS_Womens_Leggings%26var%3D%26hash%3Ditem27c810bf9b', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-Copped-Ankle-length-Skinny-Pants-Elastic-Fited-Leggings-Trousers-/170860265371?pt=US_Womens_Leggings&var=&hash=item27c810bf9b'),
(1065, 1185, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Sexy-Women-Leapard-Slim-Vest-Shirt-Wildless-Underwear-Tops-Clubwear-%2F180866044259%3Fpt%3DUK_Women_s_Tops_Shirts%26hash%3Ditem2a1c74d163', 'product', 2, 'http://www.ebay.com/itm/New-Sexy-Women-Leapard-Slim-Vest-Shirt-Wildless-Underwear-Tops-Clubwear-/180866044259?pt=UK_Women_s_Tops_Shirts&hash=item2a1c74d163'),
(1066, 1186, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Satin-Lace-Lingerie-kimono-Bathrobe-Sleepwear-Pajamas-ROBE-Gowns-G-string-%2F350790735271%3Fpt%3DUS_CSA_WC_Sleepwear_Robes%26var%3D%26hash%3Ditem51acc1d5a7', 'product', 2, 'http://www.ebay.com/itm/Sexy-Satin-Lace-Lingerie-kimono-Bathrobe-Sleepwear-Pajamas-ROBE-Gowns-G-string-/350790735271?pt=US_CSA_WC_Sleepwear_Robes&var=&hash=item51acc1d5a7'),
(1067, 1187, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Cropped-Ankle-length-Skinny-Pants-Elastic-Fited-Leggings-Trousers-%2F170862499036%3Fpt%3DUK_Women_s_Leggins%26var%3D%26hash%3Ditem27c832d4dc', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-Cropped-Ankle-length-Skinny-Pants-Elastic-Fited-Leggings-Trousers-/170862499036?pt=UK_Women_s_Leggins&var=&hash=item27c832d4dc'),
(1068, 1188, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F6-COLORS-Sweet-Girls-Women-Lace-Halter-Mini-Shirt-Tiered-Top-Blouse-Sleeveless-%2F170826902974%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem27c613adbe', 'product', 2, 'http://www.ebay.com/itm/6-COLORS-Sweet-Girls-Women-Lace-Halter-Mini-Shirt-Tiered-Top-Blouse-Sleeveless-/170826902974?pt=US_CSA_WC_Shirts_Tops&var=&hash=item27c613adbe'),
(1069, 1189, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Lips-Print-Short-Baci-Plain-Stretch-T-Shirts-Loose-Tops-Blouse-Sundress-%2F190689923609%3Fpt%3DUS_Womens_Tshirts%26var%3D%26hash%3Ditem2c66015219', 'product', 2, 'http://www.ebay.com/itm/Women-Lips-Print-Short-Baci-Plain-Stretch-T-Shirts-Loose-Tops-Blouse-Sundress-/190689923609?pt=US_Womens_Tshirts&var=&hash=item2c66015219'),
(1070, 1190, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-MATTE-PU-Leather-Punk-Fitted-Tight-Mini-Pencil-Skirt-Dress-Clubwear-%2F190834282278%3Fpt%3DUS_CSA_WC_Skirts%26var%3D%26hash%3Ditem2c6e9c0f26', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-MATTE-PU-Leather-Punk-Fitted-Tight-Mini-Pencil-Skirt-Dress-Clubwear-/190834282278?pt=US_CSA_WC_Skirts&var=&hash=item2c6e9c0f26'),
(1071, 1191, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNWT-Women-Lace-Casual-Vest-Tank-Tops-T-Shirts-Blouse-Petticoat-Sleeveless-Career-%2F180972273747%3Fpt%3DUS_CSA_WC_Shirts_Tops%26hash%3Ditem2a22c9c053', 'product', 2, 'http://www.ebay.com/itm/NWT-Women-Lace-Casual-Vest-Tank-Tops-T-Shirts-Blouse-Petticoat-Sleeveless-Career-/180972273747?pt=US_CSA_WC_Shirts_Tops&hash=item2a22c9c053'),
(1072, 1192, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2-ways-Wear-Girls-Mesh-Sheer-Long-Skirt-Strapless-mini-Casual-Pleated-Dress-%2F180912402490%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a1f38303a', 'product', 2, 'http://www.ebay.com/itm/2-ways-Wear-Girls-Mesh-Sheer-Long-Skirt-Strapless-mini-Casual-Pleated-Dress-/180912402490?pt=US_CSA_WC_Dresses&var=&hash=item2a1f38303a'),
(1073, 1193, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Lady-Pajamas-Back-Slit-Sleepwear-Mini-Dress-Robe-Babydoll-Underwear-G-string-%2F350790819426%3Fpt%3DUS_CSA_WC_Sleepwear_Robes%26hash%3Ditem51acc31e62', 'product', 2, 'http://www.ebay.com/itm/Hot-Lady-Pajamas-Back-Slit-Sleepwear-Mini-Dress-Robe-Babydoll-Underwear-G-string-/350790819426?pt=US_CSA_WC_Sleepwear_Robes&hash=item51acc31e62'),
(1074, 1194, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Lace-bath-Robes-Sleepwear-Sexy-halter-Dress-Underwear-Chemise-Lingerie-%2F190695495129%3Fpt%3DUS_CSA_WC_Sleepwear_Robes%26var%3D%26hash%3Ditem2c665655d9', 'product', 2, 'http://www.ebay.com/itm/Womens-Lace-bath-Robes-Sleepwear-Sexy-halter-Dress-Underwear-Chemise-Lingerie-/190695495129?pt=US_CSA_WC_Sleepwear_Robes&var=&hash=item2c665655d9'),
(1075, 1195, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSummer-Korea-Cute-Girl-Batwing-Sleeve-Loose-Basic-Tee-Casual-T-shirts-Top-Blouse-%2F180911083009%3Fpt%3DUS_Womens_Tshirts%26var%3D%26hash%3Ditem2a1f240e01', 'product', 2, 'http://www.ebay.com/itm/Summer-Korea-Cute-Girl-Batwing-Sleeve-Loose-Basic-Tee-Casual-T-shirts-Top-Blouse-/180911083009?pt=US_Womens_Tshirts&var=&hash=item2a1f240e01'),
(1076, 1196, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-Western-Womens-Vintage-Casual-Long-Sleeve-Red-Lips-Print-Shirt-Blouse-Tops-%2F350769004364%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem51ab763f4c', 'product', 2, 'http://www.ebay.com/itm/2013-Western-Womens-Vintage-Casual-Long-Sleeve-Red-Lips-Print-Shirt-Blouse-Tops-/350769004364?pt=UK_Women_s_Tops_Shirts&var=&hash=item51ab763f4c'),
(1077, 1197, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLady-Puff-Sleeve-Cardigan-Knitted-Tops-Sweater-Outwear-Smock-Coat-Jackets-Fall-%2F190710414085%3Fpt%3DUS_CSA_WC_Sweaters%26var%3D%26hash%3Ditem2c6739fb05', 'product', 2, 'http://www.ebay.com/itm/Lady-Puff-Sleeve-Cardigan-Knitted-Tops-Sweater-Outwear-Smock-Coat-Jackets-Fall-/190710414085?pt=US_CSA_WC_Sweaters&var=&hash=item2c6739fb05'),
(1078, 1198, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Shirt-Mandarin-Collar-Casual-Tops-Blouse-career-Formal-Slim-Waist-Shirts-%2F190710730130%3Fpt%3DUS_CSA_WC_Shirts_Tops%26var%3D%26hash%3Ditem2c673ecd92', 'product', 2, 'http://www.ebay.com/itm/Womens-Shirt-Mandarin-Collar-Casual-Tops-Blouse-career-Formal-Slim-Waist-Shirts-/190710730130?pt=US_CSA_WC_Shirts_Tops&var=&hash=item2c673ecd92'),
(1079, 1199, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Womens-Halter-Tie-Metal-Push-UP-Padded-Bikini-Swimsuit-Swimwear-Beach-Wear-%2F350750630200%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem51aa5de138', 'product', 2, 'http://www.ebay.com/itm/Hot-Womens-Halter-Tie-Metal-Push-UP-Padded-Bikini-Swimsuit-Swimwear-Beach-Wear-/350750630200?pt=US_CSA_WC_Swimwear&var=&hash=item51aa5de138'),
(1080, 1200, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-V-neck-Slim-Mini-Tunic-laies-Dresses-Club-Party-Cocktail-Dress-%2F170884209041%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c97e1991', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womens-V-neck-Slim-Mini-Tunic-laies-Dresses-Club-Party-Cocktail-Dress-/170884209041?pt=US_CSA_WC_Dresses&var=&hash=item27c97e1991'),
(1081, 1201, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Women-OL-Lady-Beads-Flounce-Puff-Short-Sleeve-Fit-Slim-Shirt-Tops-Blouse-%2F190842923090%3Fpt%3DUK_Women_s_Tops_Shirts%26var%3D%26hash%3Ditem2c6f1fe852', 'product', 2, 'http://www.ebay.com/itm/Elegant-Women-OL-Lady-Beads-Flounce-Puff-Short-Sleeve-Fit-Slim-Shirt-Tops-Blouse-/190842923090?pt=UK_Women_s_Tops_Shirts&var=&hash=item2c6f1fe852'),
(1082, 1202, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Ladies-Summer-Personal-Punk-Skull-Pattern-Loose-Casual-Cargo-Club-Dress-%2F170860828338%3Fpt%3DUS_CSA_WC_Dresses%26hash%3Ditem27c81956b2', 'product', 2, 'http://www.ebay.com/itm/Elegant-Ladies-Summer-Personal-Punk-Skull-Pattern-Loose-Casual-Cargo-Club-Dress-/170860828338?pt=US_CSA_WC_Dresses&hash=item27c81956b2'),
(1083, 1203, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Korea-Fashion-Women-Leopard-Blouse-Long-Coat-Outwear-Full-Sleeves-Dress-%2F170814926430%3Fpt%3DUS_CSA_WC_Outerwear%26hash%3Ditem27c55cee5e', 'product', 2, 'http://www.ebay.com/itm/New-Korea-Fashion-Women-Leopard-Blouse-Long-Coat-Outwear-Full-Sleeves-Dress-/170814926430?pt=US_CSA_WC_Outerwear&hash=item27c55cee5e'),
(1084, 1204, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Korea-Fashion-Women-Leopard-Blouse-Long-Coat-Outwear-Full-Sleeves-Dress-%2F190668669069%3Fpt%3DUK_Women_s_Coats_Jackets%26hash%3Ditem2c64bd008d', 'product', 2, 'http://www.ebay.com/itm/New-Korea-Fashion-Women-Leopard-Blouse-Long-Coat-Outwear-Full-Sleeves-Dress-/190668669069?pt=UK_Women_s_Coats_Jackets&hash=item2c64bd008d'),
(1085, 1205, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Strench-Slim-Fitted-Bowknot-Off-Shoulder-Long-Mini-Dress-Clubwear-%2F190657962651%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c6419a29b', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Strench-Slim-Fitted-Bowknot-Off-Shoulder-Long-Mini-Dress-Clubwear-/190657962651?pt=US_CSA_WC_Dresses&var=&hash=item2c6419a29b'),
(1086, 1206, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Ladies-Summer-Personal-Punk-Skull-Pattern-Loose-Casual-Cargo-Club-Dress-%2F180907739944%3Fpt%3DUK_Women_s_Dresses%26hash%3Ditem2a1ef10b28', 'product', 2, 'http://www.ebay.com/itm/Elegant-Ladies-Summer-Personal-Punk-Skull-Pattern-Loose-Casual-Cargo-Club-Dress-/180907739944?pt=UK_Women_s_Dresses&hash=item2a1ef10b28'),
(1087, 1207, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Summer-Women-Crewneck-Chiffon-Stich-Pleated-Mini-Relaxed-Dress-free-Necklace-%2F190691676825%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c661c1299', 'product', 2, 'http://www.ebay.com/itm/New-Summer-Women-Crewneck-Chiffon-Stich-Pleated-Mini-Relaxed-Dress-free-Necklace-/190691676825?pt=US_CSA_WC_Dresses&var=&hash=item2c661c1299'),
(1088, 1208, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Girl-One-Bowkot-Shoulder-Chiffon-Pleated-Mini-Dress-Casul-School-Free-Belt-%2F190684463309%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c65ae00cd', 'product', 2, 'http://www.ebay.com/itm/Sweet-Girl-One-Bowkot-Shoulder-Chiffon-Pleated-Mini-Dress-Casul-School-Free-Belt-/190684463309?pt=US_CSA_WC_Dresses&var=&hash=item2c65ae00cd'),
(1089, 1209, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Sexy-Women-Halter-Wraps-Chest-Bra-Jumpsuit-Bikini-Swimdress-Swimwear-Beach-%2F180898889112%3Fpt%3DUS_CSA_WC_Swimwear%26var%3D%26hash%3Ditem2a1e69fd98', 'product', 2, 'http://www.ebay.com/itm/Hot-Sexy-Women-Halter-Wraps-Chest-Bra-Jumpsuit-Bikini-Swimdress-Swimwear-Beach-/180898889112?pt=US_CSA_WC_Swimwear&var=&hash=item2a1e69fd98'),
(1092, 1212, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Womens-Vintage-CROCO-Doctor-Tote-Shoulder-Bag-Handbag-Messenger-Purse-%2F181124812059%3Fpt%3DUS_CSA_WH_Handbags%26amp%3Bamp%3Bvar%3D%26amp%3Bamp%3Bhash%3Ditem2a2be14d1b', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Womens-Vintage-CROCO-Doctor-Tote-Shoulder-Bag-Handbag-Messenger-Purse-/181124812059?pt=US_CSA_WH_Handbags&amp;amp;var=&amp;amp;hash=item2a2be14d1b'),
(1093, 1213, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSummer-Canvas-Lady-Backpacks-Climb-Mountain-Shoulder-bags-colorful-Travel-Purses-%2F190696657689%3Fpt%3DUK_Women_s_Handbags%26hash%3Ditem2c66681319', 'product', 2, 'http://www.ebay.com/itm/Summer-Canvas-Lady-Backpacks-Climb-Mountain-Shoulder-bags-colorful-Travel-Purses-/190696657689?pt=UK_Women_s_Handbags&hash=item2c66681319'),
(1094, 1214, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegent-Womens-OL-PU-Leather-Chain-Clip-Tote-Handbag-Shoulder-Bag-Messenger-%2F181136962899%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2c9ab553', 'product', 2, 'http://www.ebay.com/itm/Elegent-Womens-OL-PU-Leather-Chain-Clip-Tote-Handbag-Shoulder-Bag-Messenger-/181136962899?pt=US_CSA_WH_Handbags&var=&hash=item2a2c9ab553'),
(1095, 1215, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Croco-Faux-Leather-Rivests-Totes-Shoulder-Bag-Satchel-Purses-Zip-handbags-%2F180915606532%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a1f691404', 'product', 2, 'http://www.ebay.com/itm/Women-Croco-Faux-Leather-Rivests-Totes-Shoulder-Bag-Satchel-Purses-Zip-handbags-/180915606532?pt=US_CSA_WH_Handbags&hash=item2a1f691404'),
(1096, 1216, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FDesigner-Ladies-Faux-Leather-Hobo-Clutch-Shoulder-Purse-Handbag-Totes-Bag-%2F180740713310%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a14fc6b5e', 'product', 2, 'http://www.ebay.com/itm/Designer-Ladies-Faux-Leather-Hobo-Clutch-Shoulder-Purse-Handbag-Totes-Bag-/180740713310?pt=US_CSA_WH_Handbags&var=&hash=item2a14fc6b5e'),
(1097, 1217, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Womens-Fasion-PU-Leather-Tote-Shoulder-Bag-Tube-Messenger-Handbag-Purse-%2F351002628126%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51b963101e', 'product', 2, 'http://www.ebay.com/itm/Korean-Womens-Fasion-PU-Leather-Tote-Shoulder-Bag-Tube-Messenger-Handbag-Purse-/351002628126?pt=US_CSA_WH_Handbags&var=&hash=item51b963101e'),
(1098, 1218, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Fashion-Womens-Handbags-Ladies-Purses-Shoulder-Bags-Tote-PU-Leather-Satchel-%2F170709073398%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27bf0dbdf6', 'product', 2, 'http://www.ebay.com/itm/New-Fashion-Womens-Handbags-Ladies-Purses-Shoulder-Bags-Tote-PU-Leather-Satchel-/170709073398?pt=US_CSA_WH_Handbags&var=&hash=item27bf0dbdf6'),
(1099, 1219, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNEW-Style-Lady-PU-Leather-Messenger-Satchel-Shoulder-Purse-Handbag-Tote-Bag-%2F180798299997%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a186b1f5d', 'product', 2, 'http://www.ebay.com/itm/NEW-Style-Lady-PU-Leather-Messenger-Satchel-Shoulder-Purse-Handbag-Tote-Bag-/180798299997?pt=US_CSA_WH_Handbags&hash=item2a186b1f5d'),
(1100, 1220, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womem-Vintage-Retro-Messenger-Purse-Handbag-Shoulder-Bag-Moonar-%2F170797067497%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27c44c6ce9', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womem-Vintage-Retro-Messenger-Purse-Handbag-Shoulder-Bag-Moonar-/170797067497?pt=US_CSA_WH_Handbags&hash=item27c44c6ce9'),
(1101, 1221, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-OL-Ladies-PU-Leather-Casual-Tote-Shoulder-Bag-Handbag-Messenger-Shopper-%2F190830570992%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c6e636df0', 'product', 2, 'http://www.ebay.com/itm/Womens-OL-Ladies-PU-Leather-Casual-Tote-Shoulder-Bag-Handbag-Messenger-Shopper-/190830570992?pt=US_CSA_WH_Handbags&var=&hash=item2c6e636df0'),
(1102, 1222, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLadies-PU-Leather-Snakeskin-Small-Totes-Shoulder-Bag-Handbag-Cute-Purse-Sling-%2F190695533881%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2c6656ed39', 'product', 2, 'http://www.ebay.com/itm/Ladies-PU-Leather-Snakeskin-Small-Totes-Shoulder-Bag-Handbag-Cute-Purse-Sling-/190695533881?pt=UK_Women_s_Handbags&var=&hash=item2c6656ed39'),
(1103, 1223, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Women-OL-Lady-PU-Leather-Casual-Tote-Shoulder-Bag-Handbag-Messenger-Purse-%2F350779718057%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem51ac19b9a9', 'product', 2, 'http://www.ebay.com/itm/Korean-Women-OL-Lady-PU-Leather-Casual-Tote-Shoulder-Bag-Handbag-Messenger-Purse-/350779718057?pt=UK_Women_s_Handbags&var=&hash=item51ac19b9a9'),
(1104, 1224, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-PU-Leather-shoulder-handbag-bag-B097-%2F170719455338%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27bfac286a', 'product', 2, 'http://www.ebay.com/itm/Womens-PU-Leather-shoulder-handbag-bag-B097-/170719455338?pt=US_CSA_WH_Handbags&hash=item27bfac286a'),
(1105, 1225, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintga-Womens-UK-Flag-PU-Leather-Casual-Tote-Handbag-Shoulder-Bag-Purse-Shopper-%2F350788488317%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem51ac9f8c7d', 'product', 2, 'http://www.ebay.com/itm/Vintga-Womens-UK-Flag-PU-Leather-Casual-Tote-Handbag-Shoulder-Bag-Purse-Shopper-/350788488317?pt=US_CSA_WH_Handbags&hash=item51ac9f8c7d'),
(1106, 1226, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWestern-Womens-OL-Lady-PU-Leather-Leopard-Casual-Tote-Shoulder-Bag-Handbag-Purse-%2F350793806445%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem51acf0b26d', 'product', 2, 'http://www.ebay.com/itm/Western-Womens-OL-Lady-PU-Leather-Leopard-Casual-Tote-Shoulder-Bag-Handbag-Purse-/350793806445?pt=US_CSA_WH_Handbags&hash=item51acf0b26d'),
(1107, 1227, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Style-Women-Messenger-Satchel-Shoulder-Purse-Handbag-Tote-Bag-%2F180771493158%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a16d21526', 'product', 2, 'http://www.ebay.com/itm/Vintage-Style-Women-Messenger-Satchel-Shoulder-Purse-Handbag-Tote-Bag-/180771493158?pt=US_CSA_WH_Handbags&var=&hash=item2a16d21526'),
(1108, 1228, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Elegant-OL-Lady-Women-Bow-Handbag-Purse-Totes-Satchel-Moonar-B266-%2F190650532843%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c63a843eb', 'product', 2, 'http://www.ebay.com/itm/Fashion-Elegant-OL-Lady-Women-Bow-Handbag-Purse-Totes-Satchel-Moonar-B266-/190650532843?pt=US_CSA_WH_Handbags&var=&hash=item2c63a843eb'),
(1109, 1229, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Womens-Faux-Leather-Sling-Bucket-Shoulder-Bag-Tote-Handbag-Messenger-Purse-%2F190845114737%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c6f415971', 'product', 2, 'http://www.ebay.com/itm/Retro-Womens-Faux-Leather-Sling-Bucket-Shoulder-Bag-Tote-Handbag-Messenger-Purse-/190845114737?pt=US_CSA_WH_Handbags&var=&hash=item2c6f415971'),
(1110, 1230, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Celebrity-Girl-Faux-Leather-Handbag-Tote-Shoulder-Bags-Casual-Career-Purse-%2F170864111060%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c84b6dd4', 'product', 2, 'http://www.ebay.com/itm/Hot-Celebrity-Girl-Faux-Leather-Handbag-Tote-Shoulder-Bags-Casual-Career-Purse-/170864111060?pt=US_CSA_WH_Handbags&var=&hash=item27c84b6dd4'),
(1111, 1231, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNewest-Ladies-Rivet-Punk-Skull-Shoulder-Sling-Bag-Small-Messenger-Handbag-Purses-%2F170868790944%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem27c892d6a0', 'product', 2, 'http://www.ebay.com/itm/Newest-Ladies-Rivet-Punk-Skull-Shoulder-Sling-Bag-Small-Messenger-Handbag-Purses-/170868790944?pt=UK_Women_s_Handbags&var=&hash=item27c892d6a0'),
(1112, 1232, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNEW-Arrival-Korean-style-women-PU-leather-handbag-Satchel-bag-tote-bag-3-COLORS-%2F170797028734%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c44bd57e', 'product', 2, 'http://www.ebay.com/itm/NEW-Arrival-Korean-style-women-PU-leather-handbag-Satchel-bag-tote-bag-3-COLORS-/170797028734?pt=US_CSA_WH_Handbags&var=&hash=item27c44bd57e'),
(1113, 1233, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLuxury-Beads-Chain-Women-Lady-Purse-Handbag-Totes-Bag-%2F170721233265%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27bfc74971', 'product', 2, 'http://www.ebay.com/itm/Luxury-Beads-Chain-Women-Lady-Purse-Handbag-Totes-Bag-/170721233265?pt=US_CSA_WH_Handbags&var=&hash=item27bfc74971'),
(1114, 1234, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Leopard-Print-PU-Leather-Purse-Handbag-Shoulder-Bag-Tote-%2F170722172481%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27bfd59e41', 'product', 2, 'http://www.ebay.com/itm/Fashion-Leopard-Print-PU-Leather-Purse-Handbag-Shoulder-Bag-Tote-/170722172481?pt=US_CSA_WH_Handbags&hash=item27bfd59e41'),
(1115, 1235, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLadies-Leopard-Book-Bag-Backpack-Schoolbag-Handbag-Purse-Trip-Shoulder-Knapsack-%2F350602272973%3Fpt%3DUS_CSA_MWA_Backpacks%26hash%3Ditem51a18620cd', 'product', 2, 'http://www.ebay.com/itm/Ladies-Leopard-Book-Bag-Backpack-Schoolbag-Handbag-Purse-Trip-Shoulder-Knapsack-/350602272973?pt=US_CSA_MWA_Backpacks&hash=item51a18620cd'),
(1116, 1236, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Horse-Fur-Clutch-Shoulder-Purse-Handbag-Sling-Envelope-Evening-Bag-%2F170741159997%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27c0f7583d', 'product', 2, 'http://www.ebay.com/itm/Women-Horse-Fur-Clutch-Shoulder-Purse-Handbag-Sling-Envelope-Evening-Bag-/170741159997?pt=US_CSA_WH_Handbags&hash=item27c0f7583d'),
(1117, 1237, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegent-Womens-PU-Leather-Flower-Print-Tote-Shoulder-Bag-Handbag-Messenger-Purse-%2F350788429410%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem51ac9ea662', 'product', 2, 'http://www.ebay.com/itm/Elegent-Womens-PU-Leather-Flower-Print-Tote-Shoulder-Bag-Handbag-Messenger-Purse-/350788429410?pt=US_CSA_WH_Handbags&hash=item51ac9ea662'),
(1118, 1238, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-PU-Leather-Messenger-Satchel-Shoulder-Purse-Handbag-Tote-Bag-%2F180767070691%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a168e99e3', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-PU-Leather-Messenger-Satchel-Shoulder-Purse-Handbag-Tote-Bag-/180767070691?pt=US_CSA_WH_Handbags&var=&hash=item2a168e99e3'),
(1119, 1239, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirl-Faux-leather-Black-Leopard-Backpack-Knapsack-Shoulder-Book-Travel-Trip-Bags-%2F170899468316%3Fpt%3DUK_Women_s_Handbags%26hash%3Ditem27ca66f01c', 'product', 2, 'http://www.ebay.com/itm/Girl-Faux-leather-Black-Leopard-Backpack-Knapsack-Shoulder-Book-Travel-Trip-Bags-/170899468316?pt=UK_Women_s_Handbags&hash=item27ca66f01c'),
(1120, 1240, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FPU-Leather-Women-Purse-Handbag-Shoulder-Totes-Bag-Zipper-Lock-%2F170697799274%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27be61b66a', 'product', 2, 'http://www.ebay.com/itm/PU-Leather-Women-Purse-Handbag-Shoulder-Totes-Bag-Zipper-Lock-/170697799274?pt=US_CSA_WH_Handbags&var=&hash=item27be61b66a'),
(1121, 1241, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2Pcs-Cute-Panda-Canvas-Backpack-Book-SchoolBag-Casual-Shoulder-Bag-Handbag-Purse-%2F350594709804%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem51a112b92c', 'product', 2, 'http://www.ebay.com/itm/2Pcs-Cute-Panda-Canvas-Backpack-Book-SchoolBag-Casual-Shoulder-Bag-Handbag-Purse-/350594709804?pt=US_CSA_WH_Handbags&hash=item51a112b92c'),
(1122, 1242, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFree-Shipping-Women-Faux-Fur-Messenger-Satchel-Shoulder-Purse-Handbag-Tote-Bag-%2F170739503008%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c0de0fa0', 'product', 2, 'http://www.ebay.com/itm/Free-Shipping-Women-Faux-Fur-Messenger-Satchel-Shoulder-Purse-Handbag-Tote-Bag-/170739503008?pt=US_CSA_WH_Handbags&var=&hash=item27c0de0fa0'),
(1123, 1243, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Celebrity-Girl-Faux-Leather-Handbag-Tote-Shoulder-Bags-Casual-Career-Purse-%2F190694010424%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2c663fae38', 'product', 2, 'http://www.ebay.com/itm/Hot-Celebrity-Girl-Faux-Leather-Handbag-Tote-Shoulder-Bags-Casual-Career-Purse-/190694010424?pt=UK_Women_s_Handbags&var=&hash=item2c663fae38'),
(1124, 1244, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWestern-Hot-Gossip-Girl-Punk-Skull-PU-Leather-Women-Backpack-Shoulders-Book-Bag-%2F190678984203%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2c655a660b', 'product', 2, 'http://www.ebay.com/itm/Western-Hot-Gossip-Girl-Punk-Skull-PU-Leather-Women-Backpack-Shoulders-Book-Bag-/190678984203?pt=US_CSA_WH_Handbags&hash=item2c655a660b'),
(1125, 1245, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGossip-Girl-Punk-Skull-PU-Leather-Women-Backpack-Shoulders-Book-Bag-School-HOT-%2F170798420818%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27c4611352', 'product', 2, 'http://www.ebay.com/itm/Gossip-Girl-Punk-Skull-PU-Leather-Women-Backpack-Shoulders-Book-Bag-School-HOT-/170798420818?pt=US_CSA_WH_Handbags&hash=item27c4611352'),
(1126, 1246, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVogue-Girls-PU-Leather-Rivet-Chain-Messenger-Shoulder-bags-Totes-Handbag-Purses-%2F170868248844%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem27c88a910c', 'product', 2, 'http://www.ebay.com/itm/Vogue-Girls-PU-Leather-Rivet-Chain-Messenger-Shoulder-bags-Totes-Handbag-Purses-/170868248844?pt=UK_Women_s_Handbags&var=&hash=item27c88a910c'),
(1127, 1247, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNWT-Womens-Messager-bag-Shoulder-Satchel-BAG-Tote-%2F180720617420%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a13c9c7cc', 'product', 2, 'http://www.ebay.com/itm/NWT-Womens-Messager-bag-Shoulder-Satchel-BAG-Tote-/180720617420?pt=US_CSA_WH_Handbags&var=&hash=item2a13c9c7cc'),
(1128, 1248, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Faux-Leather-Retro-Purse-Handbag-Shoulder-Bag-%2F180718160049%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a13a448b1', 'product', 2, 'http://www.ebay.com/itm/Women-Faux-Leather-Retro-Purse-Handbag-Shoulder-Bag-/180718160049?pt=US_CSA_WH_Handbags&var=&hash=item2a13a448b1'),
(1129, 1249, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2-ways-Use-Womens-Button-Embellish-Shoulder-Bags-handbag-Backpack-Casual-Purse-%2F190729232628%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c685920f4', 'product', 2, 'http://www.ebay.com/itm/2-ways-Use-Womens-Button-Embellish-Shoulder-Bags-handbag-Backpack-Casual-Purse-/190729232628?pt=US_CSA_WH_Handbags&var=&hash=item2c685920f4'),
(1130, 1250, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNWT-Retro-Vintage-Ladies-Kisslock-Shoulder-Purse-Handbag-Totes-Bag-B161-Free-S-H-%2F170747964660%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27c15f2cf4', 'product', 2, 'http://www.ebay.com/itm/NWT-Retro-Vintage-Ladies-Kisslock-Shoulder-Purse-Handbag-Totes-Bag-B161-Free-S-H-/170747964660?pt=US_CSA_WH_Handbags&hash=item27c15f2cf4'),
(1131, 1251, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLady-Faux-leather-Black-Leopard-Backpack-Knapsack-Shoulder-Book-Travel-Trip-Bags-%2F190717202423%3Fpt%3DUS_CSA_MWA_Backpacks%26hash%3Ditem2c67a18ff7', 'product', 2, 'http://www.ebay.com/itm/Lady-Faux-leather-Black-Leopard-Backpack-Knapsack-Shoulder-Book-Travel-Trip-Bags-/190717202423?pt=US_CSA_MWA_Backpacks&hash=item2c67a18ff7'),
(1132, 1252, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-Girls-PU-Leather-Totes-Handbag-Shouler-Bag-Messenger-Crossbody-Satchel-%2F181323752555%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2a37bce46b', 'product', 2, 'http://www.ebay.com/itm/New-Women-Girls-PU-Leather-Totes-Handbag-Shouler-Bag-Messenger-Crossbody-Satchel-/181323752555?pt=UK_Women_s_Handbags&var=&hash=item2a37bce46b'),
(1133, 1253, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2012-New-Fashion-Women-Punk-Skull-Rivet-Vogue-Shoulder-Handbag-Purse-Tote-HOBO-%2F170812884932%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27c53dc7c4', 'product', 2, 'http://www.ebay.com/itm/2012-New-Fashion-Women-Punk-Skull-Rivet-Vogue-Shoulder-Handbag-Purse-Tote-HOBO-/170812884932?pt=US_CSA_WH_Handbags&hash=item27c53dc7c4'),
(1134, 1254, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Style-Lady-Totes-Faux-Leather-Handbag-Shoulder-Bag-%2F180726733530%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a14271ada', 'product', 2, 'http://www.ebay.com/itm/Korean-Style-Lady-Totes-Faux-Leather-Handbag-Shoulder-Bag-/180726733530?pt=US_CSA_WH_Handbags&var=&hash=item2a14271ada'),
(1135, 1255, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Korean-Style-Lady-Hobo-PU-leather-handbag-shoulder-Bag-2032-%2F170722995097%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27bfe22b99', 'product', 2, 'http://www.ebay.com/itm/New-Korean-Style-Lady-Hobo-PU-leather-handbag-shoulder-Bag-2032-/170722995097?pt=US_CSA_WH_Handbags&var=&hash=item27bfe22b99'),
(1136, 1256, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-Rivet-Chain-Punk-Tube-Handbag-Shoulder-Big-Bags-Tassels-Purse-Tote-%2F180906348527%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a1edbcfef', 'product', 2, 'http://www.ebay.com/itm/New-Women-Rivet-Chain-Punk-Tube-Handbag-Shoulder-Big-Bags-Tassels-Purse-Tote-/180906348527?pt=US_CSA_WH_Handbags&hash=item2a1edbcfef'),
(1137, 1257, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMen-Women-Vintage-Durable-Canvas-Shoulder-Purse-Tote-Shopper-Cross-Body-Handbag-%2F190782575615%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2c6b8713ff', 'product', 2, 'http://www.ebay.com/itm/Men-Women-Vintage-Durable-Canvas-Shoulder-Purse-Tote-Shopper-Cross-Body-Handbag-/190782575615?pt=US_CSA_WH_Handbags&hash=item2c6b8713ff'),
(1138, 1258, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Punk-Tassel-Fringe-Women-handbag-Shoulder-Bag-%2F170690480006%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27bdf20786', 'product', 2, 'http://www.ebay.com/itm/Fashion-Punk-Tassel-Fringe-Women-handbag-Shoulder-Bag-/170690480006?pt=US_CSA_WH_Handbags&var=&hash=item27bdf20786'),
(1139, 1259, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Faux-Leather-handbag-chain-shoulder-bag-Casual-tote-Sling-Purse-zip-bags-%2F190711434461%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c67498cdd', 'product', 2, 'http://www.ebay.com/itm/Women-Faux-Leather-handbag-chain-shoulder-bag-Casual-tote-Sling-Purse-zip-bags-/190711434461?pt=US_CSA_WH_Handbags&var=&hash=item2c67498cdd'),
(1140, 1260, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSuper-Stars-Womens-Girls-PU-Leather-Retro-Tassel-Hobo-Handbag-Cluth-Shoulder-Bag-%2F350801707824%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51ad694330', 'product', 2, 'http://www.ebay.com/itm/Super-Stars-Womens-Girls-PU-Leather-Retro-Tassel-Hobo-Handbag-Cluth-Shoulder-Bag-/350801707824?pt=US_CSA_WH_Handbags&var=&hash=item51ad694330'),
(1141, 1261, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWestern-Womens-Rivet-PU-Leather-Casual-Totes-Shoulder-Bag-Handbag-Purse-Black-%2F190845108953%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2c6f4142d9', 'product', 2, 'http://www.ebay.com/itm/Western-Womens-Rivet-PU-Leather-Casual-Totes-Shoulder-Bag-Handbag-Purse-Black-/190845108953?pt=US_CSA_WH_Handbags&hash=item2c6f4142d9'),
(1142, 1262, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSummer-Canvas-Lady-Backpacks-Climb-Mountain-Shoulder-bags-colorful-Travel-Purses-%2F180915717553%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a1f6ac5b1', 'product', 2, 'http://www.ebay.com/itm/Summer-Canvas-Lady-Backpacks-Climb-Mountain-Shoulder-bags-colorful-Travel-Purses-/180915717553?pt=US_CSA_WH_Handbags&hash=item2a1f6ac5b1'),
(1143, 1263, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Womens-Totes-Shoulder-Bag-Casual-Buckle-Crossbody-Handbag-Purse-Messenger-%2F190717206646%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2c67a1a076', 'product', 2, 'http://www.ebay.com/itm/Retro-Womens-Totes-Shoulder-Bag-Casual-Buckle-Crossbody-Handbag-Purse-Messenger-/190717206646?pt=UK_Women_s_Handbags&var=&hash=item2c67a1a076'),
(1144, 1264, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Ladies-Faux-Leather-Messenger-Satchel-Hobo-Shoulder-Handbag-Totes-Bag-%2F170710731010%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27bf270902', 'product', 2, 'http://www.ebay.com/itm/Vintage-Ladies-Faux-Leather-Messenger-Satchel-Hobo-Shoulder-Handbag-Totes-Bag-/170710731010?pt=US_CSA_WH_Handbags&var=&hash=item27bf270902'),
(1145, 1265, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Vintage-Women-Lace-Clutch-Shoulder-Purse-Handbag-Tote-Bag-Boston-Moonar-%2F180830061274%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a1a4fc2da', 'product', 2, 'http://www.ebay.com/itm/Fashion-Vintage-Women-Lace-Clutch-Shoulder-Purse-Handbag-Tote-Bag-Boston-Moonar-/180830061274?pt=US_CSA_WH_Handbags&var=&hash=item2a1a4fc2da'),
(1146, 1266, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Vintage-Ladies-Shoulder-Purse-Handbag-Totes-Bag-%2F180743887059%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a152cd8d3', 'product', 2, 'http://www.ebay.com/itm/Retro-Vintage-Ladies-Shoulder-Purse-Handbag-Totes-Bag-/180743887059?pt=US_CSA_WH_Handbags&hash=item2a152cd8d3'),
(1147, 1267, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNWT-Womens-Rivet-Baguette-Totes-Bags-Shoulder-Faux-Leather-Handbag-Tassel-Purse-%2F350624299978%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51a2d63bca', 'product', 2, 'http://www.ebay.com/itm/NWT-Womens-Rivet-Baguette-Totes-Bags-Shoulder-Faux-Leather-Handbag-Tassel-Purse-/350624299978?pt=US_CSA_WH_Handbags&var=&hash=item51a2d63bca'),
(1148, 1268, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNEW-Grip-Printed-Women-Satchel-Shoulder-Purse-Handbag-Tote-Motorcycle-Bag-Moonar-%2F170732423788%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27c0720a6c', 'product', 2, 'http://www.ebay.com/itm/NEW-Grip-Printed-Women-Satchel-Shoulder-Purse-Handbag-Tote-Motorcycle-Bag-Moonar-/170732423788?pt=US_CSA_WH_Handbags&hash=item27c0720a6c'),
(1149, 1269, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Croco-PU-Leather-Crossbody-Messenger-Shoulder-Handbag-Purse-Moonar-%2F190654109395%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c63ded6d3', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-Croco-PU-Leather-Crossbody-Messenger-Shoulder-Handbag-Purse-Moonar-/190654109395?pt=US_CSA_WH_Handbags&var=&hash=item2c63ded6d3'),
(1150, 1270, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FPU-Leather-Hobo-Clutch-Purse-Shoulder-Handbag-Totes-Bag-Women-%2F180725482082%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a14140262', 'product', 2, 'http://www.ebay.com/itm/PU-Leather-Hobo-Clutch-Purse-Shoulder-Handbag-Totes-Bag-Women-/180725482082?pt=US_CSA_WH_Handbags&var=&hash=item2a14140262'),
(1151, 1271, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Ladies-Bride-Evening-Clutch-Buckle-Chain-Sequins-Shoulder-Bag-Handbag-Purses-%2F190722409675%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c67f104cb', 'product', 2, 'http://www.ebay.com/itm/New-Ladies-Bride-Evening-Clutch-Buckle-Chain-Sequins-Shoulder-Bag-Handbag-Purses-/190722409675?pt=US_CSA_WH_Handbags&var=&hash=item2c67f104cb'),
(1152, 1272, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Womens-PU-Leather-Rivet-Hobo-Tote-Handbag-Shoulder-Bag-Messenger-Crossbody-%2F181136915999%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2c99fe1f', 'product', 2, 'http://www.ebay.com/itm/Retro-Womens-PU-Leather-Rivet-Hobo-Tote-Handbag-Shoulder-Bag-Messenger-Crossbody-/181136915999?pt=US_CSA_WH_Handbags&var=&hash=item2a2c99fe1f'),
(1153, 1273, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Ladies-Faux-Leather-Messenger-Satchel-Hobo-Shoulder-Handbag-Totes-Bag-%2F190643798043%3Fpt%3DUK_Women_s_Handbags%26hash%3Ditem2c6341801b', 'product', 2, 'http://www.ebay.com/itm/Vintage-Ladies-Faux-Leather-Messenger-Satchel-Hobo-Shoulder-Handbag-Totes-Bag-/190643798043?pt=UK_Women_s_Handbags&hash=item2c6341801b'),
(1154, 1274, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-HIT-Color-PU-Leather-Hobo-Satchel-Clutch-Handbag-Bag-Moonar-Large-%2F190649662082%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2c639afa82', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-HIT-Color-PU-Leather-Hobo-Satchel-Clutch-Handbag-Bag-Moonar-Large-/190649662082?pt=US_CSA_WH_Handbags&hash=item2c639afa82'),
(1155, 1275, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNewest-Ladies-Rivet-Punk-Skull-Shoulder-Sling-Bag-Small-Messenger-Handbag-Purses-%2F170854802255%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c7bd634f', 'product', 2, 'http://www.ebay.com/itm/Newest-Ladies-Rivet-Punk-Skull-Shoulder-Sling-Bag-Small-Messenger-Handbag-Purses-/170854802255?pt=US_CSA_WH_Handbags&var=&hash=item27c7bd634f'),
(1156, 1276, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHOT-Free-SHipping-Punk-Tassel-Fringe-Women-handbag-Shoulder-Bag-PurseBlack-Brown-%2F170700855935%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27be905a7f', 'product', 2, 'http://www.ebay.com/itm/HOT-Free-SHipping-Punk-Tassel-Fringe-Women-handbag-Shoulder-Bag-PurseBlack-Brown-/170700855935?pt=US_CSA_WH_Handbags&var=&hash=item27be905a7f'),
(1157, 1277, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2-Ways-NEW-Korea-Women-Checked-Plaids-Tote-Shoulder-Bag-Messsenger-Handbag-Purse-%2F190782584187%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c6b87357b', 'product', 2, 'http://www.ebay.com/itm/2-Ways-NEW-Korea-Women-Checked-Plaids-Tote-Shoulder-Bag-Messsenger-Handbag-Purse-/190782584187?pt=US_CSA_WH_Handbags&var=&hash=item2c6b87357b'),
(1158, 1278, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorea-Style-Womens-Mens-PU-Leather-Grid-Casual-Purse-Handbag-Shoulder-Bag-Purse-%2F350801748240%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51ad69e110', 'product', 2, 'http://www.ebay.com/itm/Korea-Style-Womens-Mens-PU-Leather-Grid-Casual-Purse-Handbag-Shoulder-Bag-Purse-/350801748240?pt=US_CSA_WH_Handbags&var=&hash=item51ad69e110'),
(1159, 1279, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Tassel-PU-Leather-Satchel-Handbag-Shoulder-Bag-Totes-Large-Moonar-C022-%2F170735615824%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c0a2bf50', 'product', 2, 'http://www.ebay.com/itm/Women-Tassel-PU-Leather-Satchel-Handbag-Shoulder-Bag-Totes-Large-Moonar-C022-/170735615824?pt=US_CSA_WH_Handbags&var=&hash=item27c0a2bf50'),
(1160, 1280, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Canvas-Buckle-Backpack-Bucksack-Travel-Climb-Shoulder-Book-Bag-Schoolbag-%2F350802378264%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem51ad737e18', 'product', 2, 'http://www.ebay.com/itm/Womens-Canvas-Buckle-Backpack-Bucksack-Travel-Climb-Shoulder-Book-Bag-Schoolbag-/350802378264?pt=US_CSA_MWA_Backpacks&var=&hash=item51ad737e18'),
(1161, 1281, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-PU-Leather-Women-Hobo-Clutch-Purse-Handbag-Shoulder-Totes-Bag-%2F170702826582%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27beae6c56', 'product', 2, 'http://www.ebay.com/itm/Women-PU-Leather-Women-Hobo-Clutch-Purse-Handbag-Shoulder-Totes-Bag-/170702826582?pt=US_CSA_WH_Handbags&var=&hash=item27beae6c56'),
(1162, 1282, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Lady-Women-Lady-Fuax-Leather-leopard-Shoulder-Handbag-Purse-HOBO-2-Color-%2F190655550482%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c63f4d412', 'product', 2, 'http://www.ebay.com/itm/Fashion-Lady-Women-Lady-Fuax-Leather-leopard-Shoulder-Handbag-Purse-HOBO-2-Color-/190655550482?pt=US_CSA_WH_Handbags&var=&hash=item2c63f4d412'),
(1163, 1283, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-PU-Leather-Retro-Clutch-Handbag-Shoulder-Bag-Tote-%2F170692056842%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27be0a170a', 'product', 2, 'http://www.ebay.com/itm/Women-PU-Leather-Retro-Clutch-Handbag-Shoulder-Bag-Tote-/170692056842?pt=US_CSA_WH_Handbags&var=&hash=item27be0a170a'),
(1164, 1284, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGossip-Girl-Celebrity-PU-Leather-Satchel-Totes-shoulder-handbag-bag-Moonar-%2F170748489350%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27c1672e86', 'product', 2, 'http://www.ebay.com/itm/Gossip-Girl-Celebrity-PU-Leather-Satchel-Totes-shoulder-handbag-bag-Moonar-/170748489350?pt=US_CSA_WH_Handbags&hash=item27c1672e86'),
(1165, 1285, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Girls-PU-Leather-Tote-Backpack-School-Shoulder-Bag-Book-Bag-Handbag-Purse-%2F350802435429%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51ad745d65', 'product', 2, 'http://www.ebay.com/itm/Korean-Girls-PU-Leather-Tote-Backpack-School-Shoulder-Bag-Book-Bag-Handbag-Purse-/350802435429?pt=US_CSA_WH_Handbags&var=&hash=item51ad745d65'),
(1166, 1286, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-Girls-PU-Leather-Totes-Handbag-Shouler-Bag-Messenger-Crossbody-Satchel-%2F350999274359%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51b92fe377', 'product', 2, 'http://www.ebay.com/itm/New-Women-Girls-PU-Leather-Totes-Handbag-Shouler-Bag-Messenger-Crossbody-Satchel-/350999274359?pt=US_CSA_WH_Handbags&var=&hash=item51b92fe377'),
(1167, 1287, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-DESIGNER-Satchel-HANDBAG-HOBO-PURSE-TOTE-BAG-Black-Brown-%2F170709514326%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27bf147856', 'product', 2, 'http://www.ebay.com/itm/Fashion-DESIGNER-Satchel-HANDBAG-HOBO-PURSE-TOTE-BAG-Black-Brown-/170709514326?pt=US_CSA_WH_Handbags&hash=item27bf147856'),
(1168, 1288, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-PU-Leather-Snakeskin-Clutch-Sling-Shoulder-Bag-Handbag-Purse-Evening-Party-%2F181158384146%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2de19212', 'product', 2, 'http://www.ebay.com/itm/Women-PU-Leather-Snakeskin-Clutch-Sling-Shoulder-Bag-Handbag-Purse-Evening-Party-/181158384146?pt=US_CSA_WH_Handbags&var=&hash=item2a2de19212'),
(1169, 1289, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Women-Lace-Clutch-Shoulder-Purse-Handbag-Tote-Bag-Boston-Moonar-3-Colors-%2F170790256836%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c3e480c4', 'product', 2, 'http://www.ebay.com/itm/Sexy-Women-Lace-Clutch-Shoulder-Purse-Handbag-Tote-Bag-Boston-Moonar-3-Colors-/170790256836?pt=US_CSA_WH_Handbags&var=&hash=item27c3e480c4'),
(1170, 1290, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFaux-Leather-Girls-Shoulder-Sling-Bags-Handbag-Weekend-Purse-Twist-Lock-Closure-%2F170861268286%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c8200d3e', 'product', 2, 'http://www.ebay.com/itm/Faux-Leather-Girls-Shoulder-Sling-Bags-Handbag-Weekend-Purse-Twist-Lock-Closure-/170861268286?pt=US_CSA_WH_Handbags&var=&hash=item27c8200d3e'),
(1171, 1291, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-Men-Travel-Canvas-Backpacks-Shoulder-Bags-Schoolbag-Handbag-Knapsack-Purse-%2F350591396274%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem51a0e029b2', 'product', 2, 'http://www.ebay.com/itm/Girls-Men-Travel-Canvas-Backpacks-Shoulder-Bags-Schoolbag-Handbag-Knapsack-Purse-/350591396274?pt=US_CSA_MWA_Backpacks&var=&hash=item51a0e029b2'),
(1172, 1292, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-PU-Leather-Pattern-Large-Capcity-Shoulder-Tote-Bags-handbag-Shopper-Purse-%2F190691672930%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c661c0362', 'product', 2, 'http://www.ebay.com/itm/Women-PU-Leather-Pattern-Large-Capcity-Shoulder-Tote-Bags-handbag-Shopper-Purse-/190691672930?pt=US_CSA_WH_Handbags&var=&hash=item2c661c0362'),
(1173, 1293, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Cute-Hores-Print-PU-Leather-Women-Shoulder-Bags-Handbag-Tote-Messenger-Purse-%2F190691669088%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c661bf460', 'product', 2, 'http://www.ebay.com/itm/New-Cute-Hores-Print-PU-Leather-Women-Shoulder-Bags-Handbag-Tote-Messenger-Purse-/190691669088?pt=US_CSA_WH_Handbags&var=&hash=item2c661bf460'),
(1174, 1294, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FDesigner-Belt-Tied-Cross-Scrub-Women-Clutch-Purse-Handbag-Totes-Bag-Shoulder-%2F180737780614%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a14cfab86', 'product', 2, 'http://www.ebay.com/itm/Designer-Belt-Tied-Cross-Scrub-Women-Clutch-Purse-Handbag-Totes-Bag-Shoulder-/180737780614?pt=US_CSA_WH_Handbags&var=&hash=item2a14cfab86'),
(1175, 1295, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLuxury-OL-Lady-Womens-Crocodile-Pattern-Hobo-Handbag-Totes-Bags-Faux-Leather-%2F180999143478%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2463c036', 'product', 2, 'http://www.ebay.com/itm/Luxury-OL-Lady-Womens-Crocodile-Pattern-Hobo-Handbag-Totes-Bags-Faux-Leather-/180999143478?pt=US_CSA_WH_Handbags&var=&hash=item2a2463c036'),
(1176, 1296, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Womens-Faux-Leather-Totes-Shoulder-Bags-Handbag-Career-Purse-Baguette-%2F170895303229%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27ca27623d', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Womens-Faux-Leather-Totes-Shoulder-Bags-Handbag-Career-Purse-Baguette-/170895303229?pt=US_CSA_WH_Handbags&hash=item27ca27623d'),
(1177, 1297, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2012-Fashion-Lady-Women-HIT-Colors-Canvas-Shoulder-Handbag-Totes-HOBO-Blue-Khaki-%2F190655543284%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c63f4b7f4', 'product', 2, 'http://www.ebay.com/itm/2012-Fashion-Lady-Women-HIT-Colors-Canvas-Shoulder-Handbag-Totes-HOBO-Blue-Khaki-/190655543284?pt=US_CSA_WH_Handbags&var=&hash=item2c63f4b7f4'),
(1178, 1298, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Women-PU-Leather-Tote-Clutch-Purse-Handbag-Shoulder-Bag-Shopper-Free-Ship-%2F181146338567%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a2d29c507', 'product', 2, 'http://www.ebay.com/itm/Korean-Women-PU-Leather-Tote-Clutch-Purse-Handbag-Shoulder-Bag-Shopper-Free-Ship-/181146338567?pt=US_CSA_WH_Handbags&hash=item2a2d29c507'),
(1179, 1299, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNWT-Womens-Rivet-Baguette-Totes-Bags-Shoulder-PU-Leather-Handbag-Tassel-Purse-%2F181058524089%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a27edd3b9', 'product', 2, 'http://www.ebay.com/itm/NWT-Womens-Rivet-Baguette-Totes-Bags-Shoulder-PU-Leather-Handbag-Tassel-Purse-/181058524089?pt=US_CSA_WH_Handbags&var=&hash=item2a27edd3b9'),
(1180, 1300, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNEW-Celebrity-Belts-Tied-Design-Women-Clutch-Purse-Handbag-Totes-Bag-Satchel-HOT-%2F190637394700%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c62dfcb0c', 'product', 2, 'http://www.ebay.com/itm/NEW-Celebrity-Belts-Tied-Design-Women-Clutch-Purse-Handbag-Totes-Bag-Satchel-HOT-/190637394700?pt=US_CSA_WH_Handbags&var=&hash=item2c62dfcb0c'),
(1181, 1301, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Womens-OL-Ladies-Beige-Embroidered-Casual-Totes-Shoulder-Bag-Handbag-Purse-%2F350788421010%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51ac9e8592', 'product', 2, 'http://www.ebay.com/itm/Retro-Womens-OL-Ladies-Beige-Embroidered-Casual-Totes-Shoulder-Bag-Handbag-Purse-/350788421010?pt=US_CSA_WH_Handbags&var=&hash=item51ac9e8592'),
(1182, 1302, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGrey-Korean-Women-PU-Leather-Hobo-Tote-Shoulder-Bag-Handbag-Bags-Purse-Messenger-%2F190881936535%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2c71733497', 'product', 2, 'http://www.ebay.com/itm/Grey-Korean-Women-PU-Leather-Hobo-Tote-Shoulder-Bag-Handbag-Bags-Purse-Messenger-/190881936535?pt=US_CSA_WH_Handbags&hash=item2c71733497'),
(1183, 1303, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLady-Camera-Pattern-Sew-Pu-Leather-Tube-Shopper-Tote-Shoulder-Bag-Handbag-Purse-%2F180907843524%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a1ef29fc4', 'product', 2, 'http://www.ebay.com/itm/Lady-Camera-Pattern-Sew-Pu-Leather-Tube-Shopper-Tote-Shoulder-Bag-Handbag-Purse-/180907843524?pt=US_CSA_WH_Handbags&var=&hash=item2a1ef29fc4'),
(1184, 1304, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Designer-Lady-PU-leather-handbag-Satchel-shoulder-Bag-clutch-Purses-4-Colors-%2F190801880410%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2c6cada55a', 'product', 2, 'http://www.ebay.com/itm/New-Designer-Lady-PU-leather-handbag-Satchel-shoulder-Bag-clutch-Purses-4-Colors-/190801880410?pt=UK_Women_s_Handbags&var=&hash=item2c6cada55a'),
(1185, 1305, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-PU-Leather-Tote-Handbag-Travelling-Sports-Outdoor-Cross-body-Shoulder-Bag-%2F350815224772%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem51ae3783c4', 'product', 2, 'http://www.ebay.com/itm/Women-PU-Leather-Tote-Handbag-Travelling-Sports-Outdoor-Cross-body-Shoulder-Bag-/350815224772?pt=US_CSA_WH_Handbags&hash=item51ae3783c4'),
(1186, 1306, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Womens-PU-Leather-Large-Tote-Handbag-Shoulder-Bag-Messenger-Free-Card-Bag-%2F181146349220%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2d29eea4', 'product', 2, 'http://www.ebay.com/itm/New-Womens-PU-Leather-Large-Tote-Handbag-Shoulder-Bag-Messenger-Free-Card-Bag-/181146349220?pt=US_CSA_WH_Handbags&var=&hash=item2a2d29eea4'),
(1187, 1307, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Cute-Duck-Mouth-Girls-BookBags-Backpack-Shoulder-Bags-SchoolBags-Knapsack-%2F350602291736%3Fpt%3DUS_CSA_MWA_Backpacks%26hash%3Ditem51a1866a18', 'product', 2, 'http://www.ebay.com/itm/New-Cute-Duck-Mouth-Girls-BookBags-Backpack-Shoulder-Bags-SchoolBags-Knapsack-/350602291736?pt=US_CSA_MWA_Backpacks&hash=item51a1866a18'),
(1188, 1308, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-Faux-Leather-Tote-Shoulder-Bag-Ladies-Handbag-Big-Bags-Purses-Casual-%2F190707571643%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c670e9bbb', 'product', 2, 'http://www.ebay.com/itm/New-Women-Faux-Leather-Tote-Shoulder-Bag-Ladies-Handbag-Big-Bags-Purses-Casual-/190707571643?pt=US_CSA_WH_Handbags&var=&hash=item2c670e9bbb'),
(1189, 1309, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FJapan-Girl-Fox-Pattern-Faux-Leather-Book-Backpack-Travel-Schoolbag-Knapsack-Bags-%2F170899460615%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem27ca66d207', 'product', 2, 'http://www.ebay.com/itm/Japan-Girl-Fox-Pattern-Faux-Leather-Book-Backpack-Travel-Schoolbag-Knapsack-Bags-/170899460615?pt=US_CSA_MWA_Backpacks&var=&hash=item27ca66d207'),
(1190, 1310, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Girls-PU-Leather-Totes-Backpack-Handbag-Shoulder-Bag-Travel-Bag-Rucksack-%2F190845095251%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c6f410d53', 'product', 2, 'http://www.ebay.com/itm/Womens-Girls-PU-Leather-Totes-Backpack-Handbag-Shoulder-Bag-Travel-Bag-Rucksack-/190845095251?pt=US_CSA_WH_Handbags&var=&hash=item2c6f410d53'),
(1191, 1311, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Designer-Lady-PU-leather-handbag-Satchel-shoulder-Bag-clutch-Purses-4-Colors-%2F181086529465%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a299927b9', 'product', 2, 'http://www.ebay.com/itm/New-Designer-Lady-PU-leather-handbag-Satchel-shoulder-Bag-clutch-Purses-4-Colors-/181086529465?pt=US_CSA_WH_Handbags&var=&hash=item2a299927b9'),
(1192, 1312, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirl-Pu-Leather-Evening-Snakeskin-Party-Cluth-handbag-Chain-Shoulder-Bag-Purse-%2F170864576812%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem27c852892c', 'product', 2, 'http://www.ebay.com/itm/Girl-Pu-Leather-Evening-Snakeskin-Party-Cluth-handbag-Chain-Shoulder-Bag-Purse-/170864576812?pt=UK_Women_s_Handbags&var=&hash=item27c852892c');
INSERT INTO `parsemx_entities` (`entity_id`, `platform_id`, `ins_id`, `donor_id`, `url`, `entity`, `status`, `ourl`) VALUES
(1193, 1313, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Womens-PU-Leather-Casual-Handbag-Shoulder-Bag-Messenger-CrossBody-Purses-%2F350801090948%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51ad5fd984', 'product', 2, 'http://www.ebay.com/itm/Vintage-Womens-PU-Leather-Casual-Handbag-Shoulder-Bag-Messenger-CrossBody-Purses-/350801090948?pt=US_CSA_WH_Handbags&var=&hash=item51ad5fd984'),
(1194, 1314, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-GYM-Nylon-Duffle-Tote-Travel-Handbag-Luggage-Shoulder-Bags-Sports-Man-Trip-%2F170894022019%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27ca13d583', 'product', 2, 'http://www.ebay.com/itm/Mens-GYM-Nylon-Duffle-Tote-Travel-Handbag-Luggage-Shoulder-Bags-Sports-Man-Trip-/170894022019?pt=US_CSA_WH_Handbags&hash=item27ca13d583'),
(1195, 1315, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FOversize-Leopard-Print-Faux-Leather-Large-Handbag-Shoulder-Bag-Envelope-Clutch-%2F170774792251%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27c2f8883b', 'product', 2, 'http://www.ebay.com/itm/Oversize-Leopard-Print-Faux-Leather-Large-Handbag-Shoulder-Bag-Envelope-Clutch-/170774792251?pt=US_CSA_WH_Handbags&hash=item27c2f8883b'),
(1196, 1316, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Ladies-Fringe-Faux-Leather-Shoulder-Bags-Casual-Handbags-Messenger-Purses-%2F180967457881%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a22804459', 'product', 2, 'http://www.ebay.com/itm/Korean-Ladies-Fringe-Faux-Leather-Shoulder-Bags-Casual-Handbags-Messenger-Purses-/180967457881?pt=US_CSA_WH_Handbags&var=&hash=item2a22804459'),
(1197, 1317, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-OL-Womens-Sling-Shoulder-Bags-Totes-Handbag-Casual-Purses-Zipper-closed-%2F170895296288%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27ca274720', 'product', 2, 'http://www.ebay.com/itm/Fashion-OL-Womens-Sling-Shoulder-Bags-Totes-Handbag-Casual-Purses-Zipper-closed-/170895296288?pt=US_CSA_WH_Handbags&var=&hash=item27ca274720'),
(1198, 1318, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Lady-Vintage-Soft-PU-Leather-Tote-Shoulder-Bag-Handbag-Messenger-Shopper-%2F350772118693%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51aba5c4a5', 'product', 2, 'http://www.ebay.com/itm/Fashion-Lady-Vintage-Soft-PU-Leather-Tote-Shoulder-Bag-Handbag-Messenger-Shopper-/350772118693?pt=US_CSA_WH_Handbags&var=&hash=item51aba5c4a5'),
(1199, 1319, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Crossbody-Handbag-Purse-Bag-Shoulder-Evening-Mini-Moonar-7-Colors-%2F170802163910%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c49a30c6', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-Crossbody-Handbag-Purse-Bag-Shoulder-Evening-Mini-Moonar-7-Colors-/170802163910?pt=US_CSA_WH_Handbags&var=&hash=item27c49a30c6'),
(1200, 1320, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FUnisex-Lady-Canvas-Shoulder-Handbag-Purse-Totes-Bag-Satchel-Multi-Pockets-Travel-%2F350605987390%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51a1bece3e', 'product', 2, 'http://www.ebay.com/itm/Unisex-Lady-Canvas-Shoulder-Handbag-Purse-Totes-Bag-Satchel-Multi-Pockets-Travel-/350605987390?pt=US_CSA_WH_Handbags&var=&hash=item51a1bece3e'),
(1201, 1321, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FUnisex-Lady-Canvas-Shoulder-Handbag-Purse-Totes-Bag-Satchel-Multi-Pockets-Travel-%2F350606166456%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem51a1c189b8', 'product', 2, 'http://www.ebay.com/itm/Unisex-Lady-Canvas-Shoulder-Handbag-Purse-Totes-Bag-Satchel-Multi-Pockets-Travel-/350606166456?pt=UK_Women_s_Handbags&var=&hash=item51a1c189b8'),
(1202, 1322, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-Canvas-Backpack-Rucksack-Handbag-Shoulders-Bag-School-%2F180725396077%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a1412b26d', 'product', 2, 'http://www.ebay.com/itm/Girls-Canvas-Backpack-Rucksack-Handbag-Shoulders-Bag-School-/180725396077?pt=US_CSA_WH_Handbags&hash=item2a1412b26d'),
(1203, 1323, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Women-PU-Leather-Canvas-Backpack-Knapsack-Rucksack-Travel-Book-SchoolBag-%2F181146942155%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem2a2d32facb', 'product', 2, 'http://www.ebay.com/itm/Vintage-Women-PU-Leather-Canvas-Backpack-Knapsack-Rucksack-Travel-Book-SchoolBag-/181146942155?pt=US_CSA_MWA_Backpacks&var=&hash=item2a2d32facb'),
(1204, 1324, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Women-PU-Leather-Hobo-Tote-Shoulder-Bag-CrossBody-Messenger-Handbag-Purse-%2F350835377316%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51af6b04a4', 'product', 2, 'http://www.ebay.com/itm/Korean-Women-PU-Leather-Hobo-Tote-Shoulder-Bag-CrossBody-Messenger-Handbag-Purse-/350835377316?pt=US_CSA_WH_Handbags&var=&hash=item51af6b04a4'),
(1205, 1325, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Uk-USA-Flags-Casual-Backpack-SchoolBag-Book-Shoulder-Bag-Knapsack-Pack-%2F190714018877%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem2c6770fc3d', 'product', 2, 'http://www.ebay.com/itm/Womens-Uk-USA-Flags-Casual-Backpack-SchoolBag-Book-Shoulder-Bag-Knapsack-Pack-/190714018877?pt=US_CSA_MWA_Backpacks&var=&hash=item2c6770fc3d'),
(1206, 1326, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Arrival-2012-Womem-Rivet-Punk-Messenger-Purse-Handbag-Shoulder-Bag-B249-%2F180835760544%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a1aa6b9a0', 'product', 2, 'http://www.ebay.com/itm/New-Arrival-2012-Womem-Rivet-Punk-Messenger-Purse-Handbag-Shoulder-Bag-B249-/180835760544?pt=US_CSA_WH_Handbags&var=&hash=item2a1aa6b9a0'),
(1207, 1327, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Women-PU-leather-Rivet-Tote-Shoulder-Bag-Cosmetic-Handbag-Purse-Crossbody-%2F350792388500%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem51acdb0f94', 'product', 2, 'http://www.ebay.com/itm/Korean-Women-PU-leather-Rivet-Tote-Shoulder-Bag-Cosmetic-Handbag-Purse-Crossbody-/350792388500?pt=US_CSA_WH_Handbags&hash=item51acdb0f94'),
(1208, 1328, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Rivet-Punk-PU-Leather-Envelope-Clutch-Tote-Handbag-Shoulder-Bag-Messenger-%2F181138483108%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2cb1e7a4', 'product', 2, 'http://www.ebay.com/itm/Womens-Rivet-Punk-PU-Leather-Envelope-Clutch-Tote-Handbag-Shoulder-Bag-Messenger-/181138483108?pt=US_CSA_WH_Handbags&var=&hash=item2a2cb1e7a4'),
(1209, 1329, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Womens-Black-Brown-PU-Leather-Tassel-Shoulder-Bag-Handbag-Messenger-Purse-%2F190845067131%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c6f409f7b', 'product', 2, 'http://www.ebay.com/itm/Retro-Womens-Black-Brown-PU-Leather-Tassel-Shoulder-Bag-Handbag-Messenger-Purse-/190845067131?pt=US_CSA_WH_Handbags&var=&hash=item2c6f409f7b'),
(1210, 1330, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Faux-Leather-Paint-Hobo-Clutch-Purse-Handbag-Shoulder-Totes-Bag-Black-%2F180734872230%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a14a34aa6', 'product', 2, 'http://www.ebay.com/itm/Women-Faux-Leather-Paint-Hobo-Clutch-Purse-Handbag-Shoulder-Totes-Bag-Black-/180734872230?pt=US_CSA_WH_Handbags&hash=item2a14a34aa6'),
(1211, 1331, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Womens-Stylish-Casual-Totes-Handbag-Shoulder-Bags-Messenger-Cross-Body-Purse-%2F350779737324%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51ac1a04ec', 'product', 2, 'http://www.ebay.com/itm/New-Womens-Stylish-Casual-Totes-Handbag-Shoulder-Bags-Messenger-Cross-Body-Purse-/350779737324?pt=US_CSA_WH_Handbags&var=&hash=item51ac1a04ec'),
(1212, 1332, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FPunk-Womens-UK-Flag-PU-Leather-Rivet-Totes-Purse-Handbag-Shoulder-Bag-Card-Bag-%2F350801758575%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem51ad6a096f', 'product', 2, 'http://www.ebay.com/itm/Punk-Womens-UK-Flag-PU-Leather-Rivet-Totes-Purse-Handbag-Shoulder-Bag-Card-Bag-/350801758575?pt=US_CSA_WH_Handbags&hash=item51ad6a096f'),
(1213, 1333, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Womens-Stylish-Casual-Totes-Handbag-Shoulder-Bags-Messenger-Cross-Body-Purse-%2F190830581608%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2c6e639768', 'product', 2, 'http://www.ebay.com/itm/New-Womens-Stylish-Casual-Totes-Handbag-Shoulder-Bags-Messenger-Cross-Body-Purse-/190830581608?pt=UK_Women_s_Handbags&var=&hash=item2c6e639768'),
(1214, 1334, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMen-And-Girl-Canvas-Korean-Handbag-Shoulder-School-Bag-Backpacks-Travel-Purse-%2F190696660116%3Fpt%3DUK_Women_s_Handbags%26hash%3Ditem2c66681c94', 'product', 2, 'http://www.ebay.com/itm/Men-And-Girl-Canvas-Korean-Handbag-Shoulder-School-Bag-Backpacks-Travel-Purse-/190696660116?pt=UK_Women_s_Handbags&hash=item2c66681c94'),
(1215, 1335, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-PU-Leather-Backpacks-Purse-Handbag-Shoulders-Satchel-Bag-2-ways-%2F190712563491%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem2c675ac723', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womens-PU-Leather-Backpacks-Purse-Handbag-Shoulders-Satchel-Bag-2-ways-/190712563491?pt=US_CSA_MWA_Backpacks&var=&hash=item2c675ac723'),
(1216, 1336, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Canvas-Backpacks-Schoolbag-Book-Bags-Handbag-Womens-Shoulder-GYM-Knapsack-%2F170893596675%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem27ca0d5803', 'product', 2, 'http://www.ebay.com/itm/Mens-Canvas-Backpacks-Schoolbag-Book-Bags-Handbag-Womens-Shoulder-GYM-Knapsack-/170893596675?pt=US_CSA_MWA_Backpacks&var=&hash=item27ca0d5803'),
(1217, 1337, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-style-fold-women-s-fashion-leather-handbag-shoulder-bag-tote-bag-hot-%2F170752238796%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27c1a064cc', 'product', 2, 'http://www.ebay.com/itm/Korean-style-fold-women-s-fashion-leather-handbag-shoulder-bag-tote-bag-hot-/170752238796?pt=US_CSA_WH_Handbags&hash=item27c1a064cc'),
(1218, 1338, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-Faux-leather-Clutch-Handbag-Shoulder-Tote-Bag-Girl-Satchel-Purse-%2F190712571065%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2c675ae4b9', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womens-Faux-leather-Clutch-Handbag-Shoulder-Tote-Bag-Girl-Satchel-Purse-/190712571065?pt=US_CSA_WH_Handbags&hash=item2c675ae4b9'),
(1219, 1339, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-style-Lady-Hobo-PU-leather-handbag-Shoulder-Bag-Black-Brown-Wine-%2F180808694459%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a1909babb', 'product', 2, 'http://www.ebay.com/itm/Korean-style-Lady-Hobo-PU-leather-handbag-Shoulder-Bag-Black-Brown-Wine-/180808694459?pt=US_CSA_WH_Handbags&var=&hash=item2a1909babb'),
(1220, 1340, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Canvas-Big-Schoolbag-Travel-Knapsack-Shoulder-Book-Bags-Backpack-Rucksack-%2F350801020875%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem51ad5ec7cb', 'product', 2, 'http://www.ebay.com/itm/Womens-Canvas-Big-Schoolbag-Travel-Knapsack-Shoulder-Book-Bags-Backpack-Rucksack-/350801020875?pt=US_CSA_MWA_Backpacks&var=&hash=item51ad5ec7cb'),
(1221, 1341, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Faux-Leather-Tassels-Hobo-Clutch-Purse-Handbag-Shoulder-Totes-Bag-%2F170700825736%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27be8fe488', 'product', 2, 'http://www.ebay.com/itm/Women-Faux-Leather-Tassels-Hobo-Clutch-Purse-Handbag-Shoulder-Totes-Bag-/170700825736?pt=US_CSA_WH_Handbags&var=&hash=item27be8fe488'),
(1222, 1342, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNWT-Women-Faux-Leather-Paint-Hobo-Clutch-Purse-Handbag-Shoulder-Totes-Bag-Black-%2F170714817524%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27bf6563f4', 'product', 2, 'http://www.ebay.com/itm/NWT-Women-Faux-Leather-Paint-Hobo-Clutch-Purse-Handbag-Shoulder-Totes-Bag-Black-/170714817524?pt=US_CSA_WH_Handbags&var=&hash=item27bf6563f4'),
(1223, 1343, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMen-And-Girl-Canvas-Korean-Handbag-Shoulder-School-Bag-Backpacks-Travel-Purse-%2F190687983137%3Fpt%3DUS_CSA_MWA_Backpacks%26hash%3Ditem2c65e3b621', 'product', 2, 'http://www.ebay.com/itm/Men-And-Girl-Canvas-Korean-Handbag-Shoulder-School-Bag-Backpacks-Travel-Purse-/190687983137?pt=US_CSA_MWA_Backpacks&hash=item2c65e3b621'),
(1224, 1344, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNational-Pattern-Ladies-Small-Clutch-Coin-Purse-Wallet-Handbag-knit-Cosmetic-Bag-%2F180974219932%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a22e7729c', 'product', 2, 'http://www.ebay.com/itm/National-Pattern-Ladies-Small-Clutch-Coin-Purse-Wallet-Handbag-knit-Cosmetic-Bag-/180974219932?pt=US_CSA_WH_Handbags&var=&hash=item2a22e7729c'),
(1225, 1345, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Small-Women-National-Owl-Key-Coin-Mobile-Wallet-Cartoon-Clutch-Bags-Handbags-%2F190726686965%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c683248f5', 'product', 2, 'http://www.ebay.com/itm/Hot-Small-Women-National-Owl-Key-Coin-Mobile-Wallet-Cartoon-Clutch-Bags-Handbags-/190726686965?pt=US_CSA_WH_Handbags&var=&hash=item2c683248f5'),
(1226, 1346, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSmall-new-Womens-Checked-Messenger-Shoulder-Bag-Handbag-Purse-Zipper-Shopper-%2F350687469981%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51a69a219d', 'product', 2, 'http://www.ebay.com/itm/Small-new-Womens-Checked-Messenger-Shoulder-Bag-Handbag-Purse-Zipper-Shopper-/350687469981?pt=US_CSA_WH_Handbags&var=&hash=item51a69a219d'),
(1227, 1347, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSmall-New-Lady-Make-Up-Cosmetic-Pouch-Bag-Clutch-Cell-Phone-Handbag-Casual-Purse-%2F181058061066%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a27e6c30a', 'product', 2, 'http://www.ebay.com/itm/Small-New-Lady-Make-Up-Cosmetic-Pouch-Bag-Clutch-Cell-Phone-Handbag-Casual-Purse-/181058061066?pt=US_CSA_WH_Handbags&var=&hash=item2a27e6c30a'),
(1228, 1348, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Fashion-Women-Girl-Casual-Canvas-Cross-body-shoulder-bag-Handbag-Shoppers-%2F350722054252%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51a8a9d86c', 'product', 2, 'http://www.ebay.com/itm/New-Fashion-Women-Girl-Casual-Canvas-Cross-body-shoulder-bag-Handbag-Shoppers-/350722054252?pt=US_CSA_WH_Handbags&var=&hash=item51a8a9d86c'),
(1229, 1349, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMultifunctional-Clutch-Wallet-Purse-Phone-Case-for-iPhone-4-4S-5-5S-Galaxy-S2-S3-%2F190923254022%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c73e9a906', 'product', 2, 'http://www.ebay.com/itm/Multifunctional-Clutch-Wallet-Purse-Phone-Case-for-iPhone-4-4S-5-5S-Galaxy-S2-S3-/190923254022?pt=US_CSA_WH_Handbags&var=&hash=item2c73e9a906'),
(1230, 1350, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FEnvelope-Clutch-Card-Wallet-Purse-Phone-Case-for-iPhone-4-4S-5-5S-Galaxy-S2-S3-%2F350905546012%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51b399b51c', 'product', 2, 'http://www.ebay.com/itm/Envelope-Clutch-Card-Wallet-Purse-Phone-Case-for-iPhone-4-4S-5-5S-Galaxy-S2-S3-/350905546012?pt=US_CSA_WH_Handbags&var=&hash=item51b399b51c'),
(1231, 1351, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Womens-Big-Canvas-Shoulder-Bags-Totes-Femal-Shopping-Handbags-Zipper-Purses-%2F180990066594%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a23d93fa2', 'product', 2, 'http://www.ebay.com/itm/New-Womens-Big-Canvas-Shoulder-Bags-Totes-Femal-Shopping-Handbags-Zipper-Purses-/180990066594?pt=US_CSA_WH_Handbags&var=&hash=item2a23d93fa2'),
(1232, 1352, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCute-Girl-PU-Leather-Rose-Clutch-Small-Shoulder-Bag-Evening-Party-Handbag-Wallet-%2F181144551419%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2d0e7ffb', 'product', 2, 'http://www.ebay.com/itm/Cute-Girl-PU-Leather-Rose-Clutch-Small-Shoulder-Bag-Evening-Party-Handbag-Wallet-/181144551419?pt=US_CSA_WH_Handbags&var=&hash=item2a2d0e7ffb'),
(1233, 1353, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Sequins-Womens-Cosmetic-Clutchs-Handbags-Evening-Party-Bags-Purse-zip-Close-%2F170899469188%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem27ca66f384', 'product', 2, 'http://www.ebay.com/itm/New-Sequins-Womens-Cosmetic-Clutchs-Handbags-Evening-Party-Bags-Purse-zip-Close-/170899469188?pt=UK_Women_s_Handbags&var=&hash=item27ca66f384'),
(1234, 1354, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Style-Faux-Leather-Rivet-Lady-Girls-Clutch-Purse-Wallet-Bag-%2F170731593656%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27c0655fb8', 'product', 2, 'http://www.ebay.com/itm/Korean-Style-Faux-Leather-Rivet-Lady-Girls-Clutch-Purse-Wallet-Bag-/170731593656?pt=US_CSA_WH_Handbags&hash=item27c0655fb8'),
(1235, 1355, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FPreschool-Kids-Owl-Ethnic-Bag-Colorful-Stitch-Boys-Backpack-Children-Purse-Gift-%2F190719725130%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem2c67c80e4a', 'product', 2, 'http://www.ebay.com/itm/Preschool-Kids-Owl-Ethnic-Bag-Colorful-Stitch-Boys-Backpack-Children-Purse-Gift-/190719725130?pt=US_CSA_MWA_Backpacks&var=&hash=item2c67c80e4a'),
(1236, 1356, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Sequins-Womens-Cosmetic-Clutchs-Handbag-Evening-Party-Bags-Purse-zip-Close-%2F180957577485%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a21e9810d', 'product', 2, 'http://www.ebay.com/itm/New-Sequins-Womens-Cosmetic-Clutchs-Handbag-Evening-Party-Bags-Purse-zip-Close-/180957577485?pt=US_CSA_WH_Handbags&var=&hash=item2a21e9810d'),
(1237, 1357, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Girl-Small-Clutch-Evening-Party-Bags-Shoulders-Handbags-Cosmetic-Purses-%2F180915746094%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a1f6b352e', 'product', 2, 'http://www.ebay.com/itm/Fashion-Girl-Small-Clutch-Evening-Party-Bags-Shoulders-Handbags-Cosmetic-Purses-/180915746094?pt=US_CSA_WH_Handbags&var=&hash=item2a1f6b352e'),
(1238, 1358, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2Fwomen-Faux-Leather-Messenger-bags-Handbag-Shoulder-Tote-Bag-Party-Cosmetic-Chain-%2F170887722615%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem27c9b3b677', 'product', 2, 'http://www.ebay.com/itm/women-Faux-Leather-Messenger-bags-Handbag-Shoulder-Tote-Bag-Party-Cosmetic-Chain-/170887722615?pt=UK_Women_s_Handbags&var=&hash=item27c9b3b677'),
(1239, 1359, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Stripe-Womens-Totes-Canvas-Shoulder-Bag-Gym-Travel-Duffle-Handbags-Purse-%2F350602235491%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51a1858e63', 'product', 2, 'http://www.ebay.com/itm/Korean-Stripe-Womens-Totes-Canvas-Shoulder-Bag-Gym-Travel-Duffle-Handbags-Purse-/350602235491?pt=US_CSA_WH_Handbags&var=&hash=item51a1858e63'),
(1240, 1360, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Womens-PU-Leather-Watered-Clutch-Shoulder-Bags-Handbag-Wallet-Purse-5-Colors-%2F190845611415%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c6f48ed97', 'product', 2, 'http://www.ebay.com/itm/New-Womens-PU-Leather-Watered-Clutch-Shoulder-Bags-Handbag-Wallet-Purse-5-Colors-/190845611415?pt=US_CSA_WH_Handbags&var=&hash=item2c6f48ed97'),
(1241, 1361, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Womens-Canvas-Stripe-Totes-Shoulder-Bag-Gym-Travel-Duffle-Handbags-Purse-%2F350847592427%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51b02567eb', 'product', 2, 'http://www.ebay.com/itm/Korean-Womens-Canvas-Stripe-Totes-Shoulder-Bag-Gym-Travel-Duffle-Handbags-Purse-/350847592427?pt=US_CSA_WH_Handbags&var=&hash=item51b02567eb'),
(1242, 1362, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHOT-Sale-Lady-Purse-Shoulder-Clutch-Evening-Bag-Snakeskin-Party-5-Colors-Free-SH-%2F170746204082%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c1444fb2', 'product', 2, 'http://www.ebay.com/itm/HOT-Sale-Lady-Purse-Shoulder-Clutch-Evening-Bag-Snakeskin-Party-5-Colors-Free-SH-/170746204082?pt=US_CSA_WH_Handbags&var=&hash=item27c1444fb2'),
(1243, 1363, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCute-Girls-PU-Leather-Small-Sling-Shoulder-Bag-CrossBody-Messenger-Purse-Summer-%2F350801797758%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51ad6aa27e', 'product', 2, 'http://www.ebay.com/itm/Cute-Girls-PU-Leather-Small-Sling-Shoulder-Bag-CrossBody-Messenger-Purse-Summer-/350801797758?pt=US_CSA_WH_Handbags&var=&hash=item51ad6aa27e'),
(1244, 1364, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Ladies-Bowknot-Shoulder-chain-Handbags-Evening-Party-Gowns-Banquet-Bag-Purse-%2F190722878966%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c67f82df6', 'product', 2, 'http://www.ebay.com/itm/New-Ladies-Bowknot-Shoulder-chain-Handbags-Evening-Party-Gowns-Banquet-Bag-Purse-/190722878966?pt=US_CSA_WH_Handbags&var=&hash=item2c67f82df6'),
(1245, 1365, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Womens-PU-Leather-Chain-Small-Tote-Shoulder-Bag-Handbag-Purse-Evening-Party-%2F181135821141%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2c894955', 'product', 2, 'http://www.ebay.com/itm/New-Womens-PU-Leather-Chain-Small-Tote-Shoulder-Bag-Handbag-Purse-Evening-Party-/181135821141?pt=US_CSA_WH_Handbags&var=&hash=item2a2c894955'),
(1246, 1366, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Lady-Purse-Shoulder-Clutch-Evening-Bag-Snakeskin-5-Colors-%2F180772450662%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a16e0b166', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-Lady-Purse-Shoulder-Clutch-Evening-Bag-Snakeskin-5-Colors-/180772450662?pt=US_CSA_WH_Handbags&var=&hash=item2a16e0b166'),
(1247, 1367, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCasual-Womens-Clutch-Shoulder-Bag-Cross-Body-Handbag-Phone-Coin-Key-Purse-Summer-%2F190837688056%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c6ed006f8', 'product', 2, 'http://www.ebay.com/itm/Casual-Womens-Clutch-Shoulder-Bag-Cross-Body-Handbag-Phone-Coin-Key-Purse-Summer-/190837688056?pt=US_CSA_WH_Handbags&var=&hash=item2c6ed006f8'),
(1248, 1368, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Girl-Small-Clutch-Evening-Party-Bags-Shoulders-Handbags-Cosmetic-Purses-%2F180916422158%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2a1f75860e', 'product', 2, 'http://www.ebay.com/itm/Fashion-Girl-Small-Clutch-Evening-Party-Bags-Shoulders-Handbags-Cosmetic-Purses-/180916422158?pt=UK_Women_s_Handbags&var=&hash=item2a1f75860e'),
(1249, 1369, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-Butterfly-Clutch-Chain-Purse-HandBag-Shoulder-Bag-Evening-Party-%2F170790400205%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27c3e6b0cd', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womens-Butterfly-Clutch-Chain-Purse-HandBag-Shoulder-Bag-Evening-Party-/170790400205?pt=US_CSA_WH_Handbags&hash=item27c3e6b0cd'),
(1250, 1370, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Girls-Canvas-Colorful-Striped-Casual-Tote-Sling-Shoulder-Bag-Handbags-Purse-%2F350802368802%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51ad735922', 'product', 2, 'http://www.ebay.com/itm/New-Girls-Canvas-Colorful-Striped-Casual-Tote-Sling-Shoulder-Bag-Handbags-Purse-/350802368802?pt=US_CSA_WH_Handbags&var=&hash=item51ad735922'),
(1251, 1371, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCasual-Womens-Ladies-Canvas-Backpack-Shoulder-Bags-Schoolbags-Travel-BookBag-%2F181058530141%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem2a27edeb5d', 'product', 2, 'http://www.ebay.com/itm/Casual-Womens-Ladies-Canvas-Backpack-Shoulder-Bags-Schoolbags-Travel-BookBag-/181058530141?pt=US_CSA_MWA_Backpacks&var=&hash=item2a27edeb5d'),
(1252, 1372, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Wedding-Party-Evening-Chain-Shoulder-Bags-Clutch-Buckle-Purses-Handbags-%2F190722876275%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c67f82373', 'product', 2, 'http://www.ebay.com/itm/Womens-Wedding-Party-Evening-Chain-Shoulder-Bags-Clutch-Buckle-Purses-Handbags-/190722876275?pt=US_CSA_WH_Handbags&var=&hash=item2c67f82373'),
(1253, 1373, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Lady-Snake-Skin-Pattern-Women-Carry-Shoulder-Handbag-Purse-Evening-Bag-%2F180837949013%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a1ac81e55', 'product', 2, 'http://www.ebay.com/itm/Fashion-Lady-Snake-Skin-Pattern-Women-Carry-Shoulder-Handbag-Purse-Evening-Bag-/180837949013?pt=US_CSA_WH_Handbags&hash=item2a1ac81e55'),
(1254, 1374, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-Faux-Leather-Small-Messenger-Buckle-Crossbody-Shoulder-Bags-Handbag-Purse-%2F190726727852%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c6832e8ac', 'product', 2, 'http://www.ebay.com/itm/Girls-Faux-Leather-Small-Messenger-Buckle-Crossbody-Shoulder-Bags-Handbag-Purse-/190726727852?pt=US_CSA_WH_Handbags&var=&hash=item2c6832e8ac'),
(1255, 1375, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStock-Colorful-Stripe-Canvas-Large-Shoulder-Totes-Bag-Shop-handbag-Casual-Purse-%2F350602232729%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51a1858399', 'product', 2, 'http://www.ebay.com/itm/Stock-Colorful-Stripe-Canvas-Large-Shoulder-Totes-Bag-Shop-handbag-Casual-Purse-/350602232729?pt=US_CSA_WH_Handbags&var=&hash=item51a1858399'),
(1256, 1376, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F3-Colors-Womens-Canvas-Color-Block-Hobo-Shoulder-Bag-Handbag-Purse-Crossbody-%2F181146935007%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2d32dedf', 'product', 2, 'http://www.ebay.com/itm/3-Colors-Womens-Canvas-Color-Block-Hobo-Shoulder-Bag-Handbag-Purse-Crossbody-/181146935007?pt=US_CSA_WH_Handbags&var=&hash=item2a2d32dedf'),
(1257, 1377, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Womens-Striped-Totes-Shopper-Shoulder-handbags-Canvas-Casual-Sling-Purses-%2F180959106844%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a2200d71c', 'product', 2, 'http://www.ebay.com/itm/Korean-Womens-Striped-Totes-Shopper-Shoulder-handbags-Canvas-Casual-Sling-Purses-/180959106844?pt=US_CSA_WH_Handbags&hash=item2a2200d71c'),
(1258, 1378, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNEW-Fashion-Women-8-Colors-Envelope-Clutch-Purse-Handbag-Shoulder-Hand-Tote-Bag-%2F170814393675%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c554cd4b', 'product', 2, 'http://www.ebay.com/itm/NEW-Fashion-Women-8-Colors-Envelope-Clutch-Purse-Handbag-Shoulder-Hand-Tote-Bag-/170814393675?pt=US_CSA_WH_Handbags&var=&hash=item27c554cd4b'),
(1259, 1379, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCute-Fashion-Women-Faux-Leather-Fox-Baguette-Shoulder-Handbag-Purse-Sling-Bag-%2F180850876562%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a1b8d6092', 'product', 2, 'http://www.ebay.com/itm/Cute-Fashion-Women-Faux-Leather-Fox-Baguette-Shoulder-Handbag-Purse-Sling-Bag-/180850876562?pt=US_CSA_WH_Handbags&hash=item2a1b8d6092'),
(1260, 1380, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Fashion-Flower-Mesh-Sheer-Pu-Leather-Tote-Shoulder-Bags-HandBag-Beach-Purses-%2F170861263135%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c81ff91f', 'product', 2, 'http://www.ebay.com/itm/New-Fashion-Flower-Mesh-Sheer-Pu-Leather-Tote-Shoulder-Bags-HandBag-Beach-Purses-/170861263135?pt=US_CSA_WH_Handbags&var=&hash=item27c81ff91f'),
(1261, 1381, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Girls-Faux-Leather-Snakeskin-Envelope-Clutch-Shoulder-Bag-Briefcase-Handbag-%2F170868166928%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c8895110', 'product', 2, 'http://www.ebay.com/itm/New-Girls-Faux-Leather-Snakeskin-Envelope-Clutch-Shoulder-Bag-Briefcase-Handbag-/170868166928?pt=US_CSA_WH_Handbags&var=&hash=item27c8895110'),
(1262, 1382, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FChic-Womens-Leopard-Sequins-Handbag-Tote-Messenger-Shoulder-Bag-Crossbody-Purse-%2F350863913496%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem51b11e7218', 'product', 2, 'http://www.ebay.com/itm/Chic-Womens-Leopard-Sequins-Handbag-Tote-Messenger-Shoulder-Bag-Crossbody-Purse-/350863913496?pt=US_CSA_WH_Handbags&hash=item51b11e7218'),
(1263, 1383, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Canvas-PU-Leather-Handbag-Shoulder-Bag-Totes-Hobo-Black-Red-Green-%2F180730188174%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a145bd18e', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-Canvas-PU-Leather-Handbag-Shoulder-Bag-Totes-Hobo-Black-Red-Green-/180730188174?pt=US_CSA_WH_Handbags&var=&hash=item2a145bd18e'),
(1264, 1384, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweet-Girls-Womens-Vintage-Engraving-Flower-Tote-Shoulder-Bag-Handbag-Messenger-%2F181138518243%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2cb270e3', 'product', 2, 'http://www.ebay.com/itm/Sweet-Girls-Womens-Vintage-Engraving-Flower-Tote-Shoulder-Bag-Handbag-Messenger-/181138518243?pt=US_CSA_WH_Handbags&var=&hash=item2a2cb270e3'),
(1265, 1385, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Sell-Ladies-Hasp-Nylon-Totes-Handbags-Casual-Shoulder-Bag-Purse-Shop-Career-%2F181058064616%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a27e6d0e8', 'product', 2, 'http://www.ebay.com/itm/Hot-Sell-Ladies-Hasp-Nylon-Totes-Handbags-Casual-Shoulder-Bag-Purse-Shop-Career-/181058064616?pt=US_CSA_WH_Handbags&var=&hash=item2a27e6d0e8'),
(1266, 1386, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Soft-PU-Leather-Tassels-Hobo-Clutch-Purse-Handbag-Shoulder-Totes-Bag-%2F180728596316%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a1443875c', 'product', 2, 'http://www.ebay.com/itm/Women-Soft-PU-Leather-Tassels-Hobo-Clutch-Purse-Handbag-Shoulder-Totes-Bag-/180728596316?pt=US_CSA_WH_Handbags&var=&hash=item2a1443875c'),
(1267, 1387, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegent-Womens-OL-PU-Leather-Knitted-Weave-Tote-Shoulder-Bag-Hobo-Handbag-Purse-%2F190837324785%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c6eca7bf1', 'product', 2, 'http://www.ebay.com/itm/Elegent-Womens-OL-PU-Leather-Knitted-Weave-Tote-Shoulder-Bag-Hobo-Handbag-Purse-/190837324785?pt=US_CSA_WH_Handbags&var=&hash=item2c6eca7bf1'),
(1268, 1388, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F3-Color-Korea-Style-Hobo-PU-Leather-Purse-Handbag-Shoulder-Bag-Women-%2F170700833611%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27be90034b', 'product', 2, 'http://www.ebay.com/itm/3-Color-Korea-Style-Hobo-PU-Leather-Purse-Handbag-Shoulder-Bag-Women-/170700833611?pt=US_CSA_WH_Handbags&var=&hash=item27be90034b'),
(1269, 1389, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-Cute-Magic-Cube-Bag-Totes-Handbag-Purse-Cosmetic-Makeup-Bag-Gift-%2F350801701327%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem51ad6929cf', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womens-Cute-Magic-Cube-Bag-Totes-Handbag-Purse-Cosmetic-Makeup-Bag-Gift-/350801701327?pt=US_CSA_WH_Handbags&hash=item51ad6929cf'),
(1270, 1390, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Womens-Evening-Cosmetic-Bags-Floral-Party-Clutch-Totes-Handbags-Purses-%2F190722871292%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c67f80ffc', 'product', 2, 'http://www.ebay.com/itm/Korean-Womens-Evening-Cosmetic-Bags-Floral-Party-Clutch-Totes-Handbags-Purses-/190722871292?pt=US_CSA_WH_Handbags&var=&hash=item2c67f80ffc'),
(1271, 1391, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Faux-Fur-Shoulder-Totes-Bags-Ladies-Handbag-Purses-casual-Stitch-Pocket-%2F180967357418%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a227ebbea', 'product', 2, 'http://www.ebay.com/itm/Womens-Faux-Fur-Shoulder-Totes-Bags-Ladies-Handbag-Purses-casual-Stitch-Pocket-/180967357418?pt=US_CSA_WH_Handbags&var=&hash=item2a227ebbea'),
(1272, 1392, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Women-Casual-Soft-Quilting-Twist-Lock-Tote-Shoulder-Bag-Handbag-Messenger-%2F181138503438%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a2cb2370e', 'product', 2, 'http://www.ebay.com/itm/Korean-Women-Casual-Soft-Quilting-Twist-Lock-Tote-Shoulder-Bag-Handbag-Messenger-/181138503438?pt=US_CSA_WH_Handbags&hash=item2a2cb2370e'),
(1273, 1393, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Korea-Simple-Style-PU-leather-Clutch-Handbag-Bag-Totes-Purse-%2F170703221372%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27beb4727c', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-Korea-Simple-Style-PU-leather-Clutch-Handbag-Bag-Totes-Purse-/170703221372?pt=US_CSA_WH_Handbags&var=&hash=item27beb4727c'),
(1274, 1394, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHOT-Sale-Designer-Womem-Vintage-Messenger-Purse-Handbag-Moonar-B251-%2F190649715266%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c639bca42', 'product', 2, 'http://www.ebay.com/itm/HOT-Sale-Designer-Womem-Vintage-Messenger-Purse-Handbag-Moonar-B251-/190649715266?pt=US_CSA_WH_Handbags&var=&hash=item2c639bca42'),
(1275, 1395, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Womens-Wedding-Party-Evening-Flora-Clutch-Buckle-HandBag-Cosmetic-Purse-%2F351005659153%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem51b9915011', 'product', 2, 'http://www.ebay.com/itm/Elegant-Womens-Wedding-Party-Evening-Flora-Clutch-Buckle-HandBag-Cosmetic-Purse-/351005659153?pt=UK_Women_s_Handbags&var=&hash=item51b9915011'),
(1276, 1396, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-PU-Leather-Chain-Cluth-CrossBody-Shoulder-Bag-Handbag-Purse-Evening-Party-%2F190845608251%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c6f48e13b', 'product', 2, 'http://www.ebay.com/itm/Womens-PU-Leather-Chain-Cluth-CrossBody-Shoulder-Bag-Handbag-Purse-Evening-Party-/190845608251?pt=US_CSA_WH_Handbags&var=&hash=item2c6f48e13b'),
(1277, 1397, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Fashion-Linen-Tote-Shoulder-Bag-Handbag-%2F180701806902%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a12aac136', 'product', 2, 'http://www.ebay.com/itm/Women-Fashion-Linen-Tote-Shoulder-Bag-Handbag-/180701806902?pt=US_CSA_WH_Handbags&hash=item2a12aac136'),
(1278, 1398, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirls-Canvas-Backpack-Runsack-Handbag-Shoulders-Bag-School-%2F180744428272%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a15351af0', 'product', 2, 'http://www.ebay.com/itm/Girls-Canvas-Backpack-Runsack-Handbag-Shoulders-Bag-School-/180744428272?pt=US_CSA_WH_Handbags&var=&hash=item2a15351af0'),
(1279, 1399, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Faux-Leather-Shoulder-Bags-Uk-Flag-handbag-Casual-Purse-Messenger-bag-%2F170891394302%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27c9ebbcfe', 'product', 2, 'http://www.ebay.com/itm/Womens-Faux-Leather-Shoulder-Bags-Uk-Flag-handbag-Casual-Purse-Messenger-bag-/170891394302?pt=US_CSA_WH_Handbags&hash=item27c9ebbcfe'),
(1280, 1400, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Croco-Lady-Tote-PU-leather-handbag-Shoulder-Purse-Bag-Black-Brown-Wine-%2F190677443240%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c6542e2a8', 'product', 2, 'http://www.ebay.com/itm/Korean-Croco-Lady-Tote-PU-leather-handbag-Shoulder-Purse-Bag-Black-Brown-Wine-/190677443240?pt=US_CSA_WH_Handbags&var=&hash=item2c6542e2a8'),
(1281, 1401, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Womens-Girls-PU-Leather-Totem-Hobo-Bucket-Handbag-Tote-Shoulder-Bag-Purse-%2F350801772434%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51ad6a3f92', 'product', 2, 'http://www.ebay.com/itm/Korean-Womens-Girls-PU-Leather-Totem-Hobo-Bucket-Handbag-Tote-Shoulder-Bag-Purse-/350801772434?pt=US_CSA_WH_Handbags&var=&hash=item51ad6a3f92'),
(1282, 1402, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Womens-Handbag-Satchel-Messenger-Cross-Body-Sholuder-Bag-Tote-Shoppers-Purse-%2F190881863691%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c7172180b', 'product', 2, 'http://www.ebay.com/itm/New-Womens-Handbag-Satchel-Messenger-Cross-Body-Sholuder-Bag-Tote-Shoppers-Purse-/190881863691?pt=US_CSA_WH_Handbags&var=&hash=item2c7172180b'),
(1283, 1403, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2-ways-Use-Womens-Button-Embellish-Shoulder-Bags-handbag-Backpack-Casual-Purse-%2F180978759419%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2a232cb6fb', 'product', 2, 'http://www.ebay.com/itm/2-ways-Use-Womens-Button-Embellish-Shoulder-Bags-handbag-Backpack-Casual-Purse-/180978759419?pt=UK_Women_s_Handbags&var=&hash=item2a232cb6fb'),
(1284, 1404, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Croco-Faux-Leather-Rivests-Totes-Shoulder-Bag-Satchel-Purses-Zip-handbags-%2F170868248240%3Fpt%3DUK_Women_s_Handbags%26hash%3Ditem27c88a8eb0', 'product', 2, 'http://www.ebay.com/itm/Women-Croco-Faux-Leather-Rivests-Totes-Shoulder-Bag-Satchel-Purses-Zip-handbags-/170868248240?pt=UK_Women_s_Handbags&hash=item27c88a8eb0'),
(1285, 1405, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGirl-Large-Pu-Leather-Rivet-Shoulder-Bags-tote-Satchels-Bag-Handbag-casual-Purse-%2F190711435848%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c67499248', 'product', 2, 'http://www.ebay.com/itm/Girl-Large-Pu-Leather-Rivet-Shoulder-Bags-tote-Satchels-Bag-Handbag-casual-Purse-/190711435848?pt=US_CSA_WH_Handbags&var=&hash=item2c67499248'),
(1286, 1406, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Womens-Ladies-Sequins-Bling-Tiger-Leopard-Tote-Shoulder-Bag-Handbag-Purse-%2F181129956139%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2c2fcb2b', 'product', 2, 'http://www.ebay.com/itm/Retro-Womens-Ladies-Sequins-Bling-Tiger-Leopard-Tote-Shoulder-Bag-Handbag-Purse-/181129956139?pt=US_CSA_WH_Handbags&var=&hash=item2a2c2fcb2b'),
(1287, 1407, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-PU-Leather-Motorcycle-Totes-Purse-Handbag-Shoulder-Bag-Shopper-%2F350801739313%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51ad69be31', 'product', 2, 'http://www.ebay.com/itm/Fashion-Womens-PU-Leather-Motorcycle-Totes-Purse-Handbag-Shoulder-Bag-Shopper-/350801739313?pt=US_CSA_WH_Handbags&var=&hash=item51ad69be31'),
(1288, 1408, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FPunk-Skull-Stud-Rivet-Chain-PU-Leather-Tote-Handbag-CrossBody-Shoulder-Bag-Black-%2F190845070100%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2c6f40ab14', 'product', 2, 'http://www.ebay.com/itm/Punk-Skull-Stud-Rivet-Chain-PU-Leather-Tote-Handbag-CrossBody-Shoulder-Bag-Black-/190845070100?pt=US_CSA_WH_Handbags&hash=item2c6f40ab14'),
(1289, 1409, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVogue-Girls-PU-Leather-Rivet-Chain-Messenger-Shoulder-bags-Totes-Handbag-Purses-%2F180915604558%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a1f690c4e', 'product', 2, 'http://www.ebay.com/itm/Vogue-Girls-PU-Leather-Rivet-Chain-Messenger-Shoulder-bags-Totes-Handbag-Purses-/180915604558?pt=US_CSA_WH_Handbags&var=&hash=item2a1f690c4e'),
(1290, 1410, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Girls-Star-Flag-Print-Satchel-Tote-Handbag-Purses-Shoulder-Bags-Briefcase-%2F190687034592%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2c65d53ce0', 'product', 2, 'http://www.ebay.com/itm/Korean-Girls-Star-Flag-Print-Satchel-Tote-Handbag-Purses-Shoulder-Bags-Briefcase-/190687034592?pt=US_CSA_WH_Handbags&hash=item2c65d53ce0'),
(1291, 1411, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-OL-Lady-Suede-Stitch-PU-Leather-Tote-Handbag-Shoulder-Bag-Messenger-Purse-%2F350772231690%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51aba77e0a', 'product', 2, 'http://www.ebay.com/itm/Womens-OL-Lady-Suede-Stitch-PU-Leather-Tote-Handbag-Shoulder-Bag-Messenger-Purse-/350772231690?pt=US_CSA_WH_Handbags&var=&hash=item51aba77e0a'),
(1292, 1412, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWestern-Style-Ladies-Faux-Leather-Tote-Shoulder-Bags-Girl-Handbag-Purse-Khaki-Be-%2F180914406007%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2a1f56c277', 'product', 2, 'http://www.ebay.com/itm/Western-Style-Ladies-Faux-Leather-Tote-Shoulder-Bags-Girl-Handbag-Purse-Khaki-Be-/180914406007?pt=UK_Women_s_Handbags&var=&hash=item2a1f56c277'),
(1293, 1413, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Girls-Star-Flag-Print-Satchel-Tote-Handbag-Purses-Shoulder-Bags-Briefcase-%2F170868787638%3Fpt%3DUK_Women_s_Handbags%26hash%3Ditem27c892c9b6', 'product', 2, 'http://www.ebay.com/itm/Korean-Girls-Star-Flag-Print-Satchel-Tote-Handbag-Purses-Shoulder-Bags-Briefcase-/170868787638?pt=UK_Women_s_Handbags&hash=item27c892c9b6'),
(1294, 1414, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2012-Korean-style-women-PU-leather-handbag-Satchel-Purse-bag-tote-Black-Orange-%2F180837034349%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a1aba296d', 'product', 2, 'http://www.ebay.com/itm/2012-Korean-style-women-PU-leather-handbag-Satchel-Purse-bag-tote-Black-Orange-/180837034349?pt=US_CSA_WH_Handbags&var=&hash=item2a1aba296d'),
(1295, 1415, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCool-Womens-Punk-Rivet-Handbag-Shoulder-Bag-Tote-Crossbody-Purse-Messenger-Black-%2F190837640543%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2c6ecf4d5f', 'product', 2, 'http://www.ebay.com/itm/Cool-Womens-Punk-Rivet-Handbag-Shoulder-Bag-Tote-Crossbody-Purse-Messenger-Black-/190837640543?pt=US_CSA_WH_Handbags&hash=item2c6ecf4d5f'),
(1296, 1416, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNWT-Womens-PU-Leather-Quilting-Tote-Shoulder-Bag-Handbag-Purse-Shopper-3-Colors-%2F181129911914%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2c2f1e6a', 'product', 2, 'http://www.ebay.com/itm/NWT-Womens-PU-Leather-Quilting-Tote-Shoulder-Bag-Handbag-Purse-Shopper-3-Colors-/181129911914?pt=US_CSA_WH_Handbags&var=&hash=item2a2c2f1e6a'),
(1297, 1417, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FDesigner-Women-Faux-Leather-Hobo-Clutch-Shoulder-Purse-Handbag-Totes-Bag-%2F170714575433%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27bf61b249', 'product', 2, 'http://www.ebay.com/itm/Designer-Women-Faux-Leather-Hobo-Clutch-Shoulder-Purse-Handbag-Totes-Bag-/170714575433?pt=US_CSA_WH_Handbags&var=&hash=item27bf61b249'),
(1298, 1418, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Womens-Leopard-Hobo-Tote-Handbag-Shoulder-Bag-Messenger-Purse-4-Colors-%2F350790013794%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51acb6d362', 'product', 2, 'http://www.ebay.com/itm/Korean-Womens-Leopard-Hobo-Tote-Handbag-Shoulder-Bag-Messenger-Purse-4-Colors-/350790013794?pt=US_CSA_WH_Handbags&var=&hash=item51acb6d362'),
(1299, 1419, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNWT-Korean-Lady-Suede-Chain-Tote-Shoulder-Bag-Handbag-Free-Phone-Coins-Purse-Bag-%2F181124910927%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2be2cf4f', 'product', 2, 'http://www.ebay.com/itm/NWT-Korean-Lady-Suede-Chain-Tote-Shoulder-Bag-Handbag-Free-Phone-Coins-Purse-Bag-/181124910927?pt=US_CSA_WH_Handbags&var=&hash=item2a2be2cf4f'),
(1300, 1420, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Womens-Fasion-PU-Leather-Tote-Shoulder-Bag-Tube-Messenger-Handbag-Purse-%2F181326992695%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2a37ee5537', 'product', 2, 'http://www.ebay.com/itm/Korean-Womens-Fasion-PU-Leather-Tote-Shoulder-Bag-Tube-Messenger-Handbag-Purse-/181326992695?pt=UK_Women_s_Handbags&var=&hash=item2a37ee5537'),
(1301, 1421, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBlack-Celebrity-CROCO-Women-Batwing-Satchel-Shoulder-Purse-Handbag-Tote-Bag-%2F180767272530%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2a1691ae52', 'product', 2, 'http://www.ebay.com/itm/Black-Celebrity-CROCO-Women-Batwing-Satchel-Shoulder-Purse-Handbag-Tote-Bag-/180767272530?pt=US_CSA_WH_Handbags&hash=item2a1691ae52'),
(1302, 1422, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Women-PU-Leather-Quilting-Thread-Totes-Shoulder-Bag-Messenger-Handbag-%2F181168171324%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2e76e93c', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Women-PU-Leather-Quilting-Thread-Totes-Shoulder-Bag-Messenger-Handbag-/181168171324?pt=US_CSA_WH_Handbags&var=&hash=item2a2e76e93c'),
(1303, 1423, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLadys-New-Retro-Satchel-PU-Leather-Tote-Handbag-Shoulder-Bag-Purses-Zip-Closure-%2F180898927415%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a1e6a9337', 'product', 2, 'http://www.ebay.com/itm/Ladys-New-Retro-Satchel-PU-Leather-Tote-Handbag-Shoulder-Bag-Purses-Zip-Closure-/180898927415?pt=US_CSA_WH_Handbags&var=&hash=item2a1e6a9337'),
(1304, 1424, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Womens-Ladies-Sequins-Bling-Tiger-Leopard-Tote-Shoulder-Bag-Handbag-Purse-%2F350779694526%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem51ac195dbe', 'product', 2, 'http://www.ebay.com/itm/Retro-Womens-Ladies-Sequins-Bling-Tiger-Leopard-Tote-Shoulder-Bag-Handbag-Purse-/350779694526?pt=UK_Women_s_Handbags&var=&hash=item51ac195dbe'),
(1305, 1425, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Womens-Casual-Totes-Hobo-Shoulder-Bags-Career-Handbags-Fringe-Purse-2-colors-%2F180974246237%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a22e7d95d', 'product', 2, 'http://www.ebay.com/itm/Hot-Womens-Casual-Totes-Hobo-Shoulder-Bags-Career-Handbags-Fringe-Purse-2-colors-/180974246237?pt=US_CSA_WH_Handbags&var=&hash=item2a22e7d95d'),
(1306, 1426, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FDesigner-Vintage-Pu-Leather-Women-Hobo-Satchel-Shoulder-Purse-Handbag-Tote-Bag-%2F190647680139%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c637cbc8b', 'product', 2, 'http://www.ebay.com/itm/Designer-Vintage-Pu-Leather-Women-Hobo-Satchel-Shoulder-Purse-Handbag-Tote-Bag-/190647680139?pt=US_CSA_WH_Handbags&var=&hash=item2c637cbc8b'),
(1307, 1427, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Lady-Snakeskin-pattern-Messenger-Satchel-Shoulder-Purse-Handbag-Tote-Bag-%2F170759790028%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem27c2139dcc', 'product', 2, 'http://www.ebay.com/itm/Women-Lady-Snakeskin-pattern-Messenger-Satchel-Shoulder-Purse-Handbag-Tote-Bag-/170759790028?pt=US_CSA_WH_Handbags&hash=item27c2139dcc'),
(1308, 1428, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Lady-Women-PU-Leather-Satchel-Shoulder-Handbag-Purse-Tote-Colorful-Bag-%2F170809105601%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c5041cc1', 'product', 2, 'http://www.ebay.com/itm/Fashion-Lady-Women-PU-Leather-Satchel-Shoulder-Handbag-Purse-Tote-Colorful-Bag-/170809105601?pt=US_CSA_WH_Handbags&var=&hash=item27c5041cc1'),
(1309, 1429, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Womens-PU-Leather-Tassel-Fringe-Satchel-Tote-Shopper-Shoulder-Bag-Handbag-%2F350802389614%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51ad73aa6e', 'product', 2, 'http://www.ebay.com/itm/Korean-Womens-PU-Leather-Tassel-Fringe-Satchel-Tote-Shopper-Shoulder-Bag-Handbag-/350802389614?pt=US_CSA_WH_Handbags&var=&hash=item51ad73aa6e'),
(1310, 1430, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Retro-Ladies-Punk-Skull-Tube-Handbag-Shoulder-Tassels-Purse-Tote-Big-Bag-%2F180898979909%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a1e6b6045', 'product', 2, 'http://www.ebay.com/itm/Vintage-Retro-Ladies-Punk-Skull-Tube-Handbag-Shoulder-Tassels-Purse-Tote-Big-Bag-/180898979909?pt=US_CSA_WH_Handbags&var=&hash=item2a1e6b6045'),
(1311, 1431, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Women-Lady-CROCO-PU-Leather-Career-Tote-Shoulder-Bag-Messenger-Handbag-%2F190816847216%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c6d920570', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Women-Lady-CROCO-PU-Leather-Career-Tote-Shoulder-Bag-Messenger-Handbag-/190816847216?pt=US_CSA_WH_Handbags&var=&hash=item2c6d920570'),
(1312, 1432, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Women-Lady-Tote-Shoulder-Bag-Handbag-Messenger-Crossbody-Shopper-Purse-%2F350815207358%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51ae373fbe', 'product', 2, 'http://www.ebay.com/itm/Vintage-Women-Lady-Tote-Shoulder-Bag-Handbag-Messenger-Crossbody-Shopper-Purse-/350815207358?pt=US_CSA_WH_Handbags&var=&hash=item51ae373fbe'),
(1313, 1433, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNoble-Women-Faux-Leather-Tote-Satchel-Shoulder-Bag-HandBag-Zip-Purses-Casual-%2F170868787321%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem27c892c879', 'product', 2, 'http://www.ebay.com/itm/Noble-Women-Faux-Leather-Tote-Satchel-Shoulder-Bag-HandBag-Zip-Purses-Casual-/170868787321?pt=UK_Women_s_Handbags&var=&hash=item27c892c879'),
(1314, 1434, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-Girl-OL-Vintage-PU-Leather-Tote-Messenger-Shoulder-Bag-Handbag-Purse-%2F350751440100%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51aa6a3ce4', 'product', 2, 'http://www.ebay.com/itm/New-Women-Girl-OL-Vintage-PU-Leather-Tote-Messenger-Shoulder-Bag-Handbag-Purse-/350751440100?pt=US_CSA_WH_Handbags&var=&hash=item51aa6a3ce4'),
(1315, 1435, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-PU-Leather-Quilting-Vintage-Tote-Shoulder-Bag-Handbag-Messenger-Purse-%2F190830501223%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2c6e625d67', 'product', 2, 'http://www.ebay.com/itm/New-Women-PU-Leather-Quilting-Vintage-Tote-Shoulder-Bag-Handbag-Messenger-Purse-/190830501223?pt=US_CSA_WH_Handbags&hash=item2c6e625d67'),
(1316, 1436, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-PU-Leather-Snakeskin-Crocodile-Pattern-Shoulder-Handbag-Purse-HOBO-bag-%2F170812998281%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem27c53f8289', 'product', 2, 'http://www.ebay.com/itm/Women-PU-Leather-Snakeskin-Crocodile-Pattern-Shoulder-Handbag-Purse-HOBO-bag-/170812998281?pt=UK_Women_s_Handbags&var=&hash=item27c53f8289'),
(1317, 1437, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNoble-Women-Faux-Leather-Tote-Satchel-Shoulder-Bag-HandBag-Zip-Purses-Casual-%2F170854229155%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27c7b4a4a3', 'product', 2, 'http://www.ebay.com/itm/Noble-Women-Faux-Leather-Tote-Satchel-Shoulder-Bag-HandBag-Zip-Purses-Casual-/170854229155?pt=US_CSA_WH_Handbags&var=&hash=item27c7b4a4a3'),
(1318, 1438, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-OL-Lady-Suede-Stitch-PU-Leather-Tote-Handbag-Shoulder-Bag-Messenger-Purse-%2F190827122551%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2c6e2ecf77', 'product', 2, 'http://www.ebay.com/itm/Womens-OL-Lady-Suede-Stitch-PU-Leather-Tote-Handbag-Shoulder-Bag-Messenger-Purse-/190827122551?pt=UK_Women_s_Handbags&var=&hash=item2c6e2ecf77'),
(1319, 1439, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNEW-Fashion-Vintage-OL-LADY-Women-PU-Leather-Shoulder-Handbag-Purse-Totes-2-Colo-%2F190657586173%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2c6413e3fd', 'product', 2, 'http://www.ebay.com/itm/NEW-Fashion-Vintage-OL-LADY-Women-PU-Leather-Shoulder-Handbag-Purse-Totes-2-Colo-/190657586173?pt=US_CSA_WH_Handbags&var=&hash=item2c6413e3fd'),
(1320, 1440, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FDesigner-Faux-Leather-Women-Hobo-Clutch-Handbag-Shoulder-Totes-Bag-Exquisite-%2F170707432651%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem27bef4b4cb', 'product', 2, 'http://www.ebay.com/itm/Designer-Faux-Leather-Women-Hobo-Clutch-Handbag-Shoulder-Totes-Bag-Exquisite-/170707432651?pt=US_CSA_WH_Handbags&var=&hash=item27bef4b4cb'),
(1321, 1441, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Lady-PU-Leather-Totes-Handbag-Shoulder-Bag-Crossbody-Satchel-Purse-%2F181172830691%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2ebe01e3', 'product', 2, 'http://www.ebay.com/itm/Fashion-Women-Lady-PU-Leather-Totes-Handbag-Shoulder-Bag-Crossbody-Satchel-Purse-/181172830691?pt=US_CSA_WH_Handbags&var=&hash=item2a2ebe01e3');
INSERT INTO `parsemx_entities` (`entity_id`, `platform_id`, `ins_id`, `donor_id`, `url`, `entity`, `status`, `ourl`) VALUES
(1322, 1442, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Womens-Vintage-CROCO-Doctor-Tote-Shoulder-Bag-Handbag-Messenger-Purse-%2F181124812059%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2be14d1b', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Womens-Vintage-CROCO-Doctor-Tote-Shoulder-Bag-Handbag-Messenger-Purse-/181124812059?pt=US_CSA_WH_Handbags&var=&hash=item2a2be14d1b'),
(1323, 1443, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGenuine-Real-Leather-OL-Lady-Hobo-Tassels-Cross-Body-Shoulder-Bag-Handbag-Purse-%2F350751290964%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51aa67f654', 'product', 2, 'http://www.ebay.com/itm/Genuine-Real-Leather-OL-Lady-Hobo-Tassels-Cross-Body-Shoulder-Bag-Handbag-Purse-/350751290964?pt=US_CSA_WH_Handbags&var=&hash=item51aa67f654'),
(1324, 1444, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Womens-OL-Celebrity-Leather-Clutch-Totes-Large-Handbag-Shoulder-Bag-Pusre-%2F350792349082%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51acda759a', 'product', 2, 'http://www.ebay.com/itm/Retro-Womens-OL-Celebrity-Leather-Clutch-Totes-Large-Handbag-Shoulder-Bag-Pusre-/350792349082?pt=US_CSA_WH_Handbags&var=&hash=item51acda759a'),
(1325, 1445, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Womens-Vintage-CROCO-Doctor-Tote-Shoulder-Bag-Handbag-Messenger-Purse-%2F201040103746%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2eceec8942', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Womens-Vintage-CROCO-Doctor-Tote-Shoulder-Bag-Handbag-Messenger-Purse-/201040103746?pt=UK_Women_s_Handbags&var=&hash=item2eceec8942'),
(1326, 1446, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Womens-OL-Lady-Leather-Bowknot-Tote-Shoulder-Bag-Messenger-Handbag-Purse-%2F181306590957%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a36b706ed', 'product', 2, 'http://www.ebay.com/itm/Elegant-Womens-OL-Lady-Leather-Bowknot-Tote-Shoulder-Bag-Messenger-Handbag-Purse-/181306590957?pt=US_CSA_WH_Handbags&var=&hash=item2a36b706ed'),
(1327, 1447, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorea-Women-Lady-Girl-Leather-CROCO-Tote-Hobo-Shoulder-Bag-Handbag-Purse-3Colors-%2F181110303612%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2b03eb7c', 'product', 2, 'http://www.ebay.com/itm/Korea-Women-Lady-Girl-Leather-CROCO-Tote-Hobo-Shoulder-Bag-Handbag-Purse-3Colors-/181110303612?pt=US_CSA_WH_Handbags&var=&hash=item2a2b03eb7c'),
(1328, 1448, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGenuine-Real-Leather-OL-Lady-Hobo-Tassels-Cross-Body-Shoulder-Bag-Handbag-Purse-%2F181110219272%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2a2b02a208', 'product', 2, 'http://www.ebay.com/itm/Genuine-Real-Leather-OL-Lady-Hobo-Tassels-Cross-Body-Shoulder-Bag-Handbag-Purse-/181110219272?pt=UK_Women_s_Handbags&var=&hash=item2a2b02a208'),
(1329, 1449, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Womens-Ladies-OL-Leather-Bowknot-Tote-Sling-Shoulder-Bag-Messenger-Handbag-%2F350751416880%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51aa69e230', 'product', 2, 'http://www.ebay.com/itm/Retro-Womens-Ladies-OL-Leather-Bowknot-Tote-Sling-Shoulder-Bag-Messenger-Handbag-/350751416880?pt=US_CSA_WH_Handbags&var=&hash=item51aa69e230'),
(1330, 1450, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGenuine-Real-Leather-Women-Vintage-Tote-Shoulder-Bag-CrossBody-Handbag-Messenger-%2F350980811158%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51b8162996', 'product', 2, 'http://www.ebay.com/itm/Genuine-Real-Leather-Women-Vintage-Tote-Shoulder-Bag-CrossBody-Handbag-Messenger-/350980811158?pt=US_CSA_WH_Handbags&var=&hash=item51b8162996'),
(1331, 1451, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWestern-Womens-Retro-OL-Leather-Hobo-Tote-Handbag-Shoulder-Bag-Messenger-Purse-%2F181136926589%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2c9a277d', 'product', 2, 'http://www.ebay.com/itm/Western-Womens-Retro-OL-Leather-Hobo-Tote-Handbag-Shoulder-Bag-Messenger-Purse-/181136926589?pt=US_CSA_WH_Handbags&var=&hash=item2a2c9a277d'),
(1332, 1452, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Celebrity-Womens-Real-Leather-Shoulder-Bags-Handbags-Casual-Tote-OL-Purse-%2F190726737394%3Fpt%3DUS_CSA_WH_Handbags%26hash%3Ditem2c68330df2', 'product', 2, 'http://www.ebay.com/itm/Retro-Celebrity-Womens-Real-Leather-Shoulder-Bags-Handbags-Casual-Tote-OL-Purse-/190726737394?pt=US_CSA_WH_Handbags&hash=item2c68330df2'),
(1333, 1453, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Womens-OL-Lady-Leather-Bowknot-Tote-Shoulder-Bag-Messenger-Handbag-Purse-%2F350980828619%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem51b8166dcb', 'product', 2, 'http://www.ebay.com/itm/Elegant-Womens-OL-Lady-Leather-Bowknot-Tote-Shoulder-Bag-Messenger-Handbag-Purse-/350980828619?pt=UK_Women_s_Handbags&var=&hash=item51b8166dcb'),
(1334, 1454, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Women-Leather-Durable-Handbags-Totes-Shoulder-Bag-Gift-Purse-Messenger-%2F350802414151%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51ad740a47', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Women-Leather-Durable-Handbags-Totes-Shoulder-Bag-Gift-Purse-Messenger-/350802414151?pt=US_CSA_WH_Handbags&var=&hash=item51ad740a47'),
(1335, 1455, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWestern-Women-Real-Genuine-Leather-Tube-Tote-Large-Shoulder-Bag-Handbag-Shoppers-%2F350751304774%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51aa682c46', 'product', 2, 'http://www.ebay.com/itm/Western-Women-Real-Genuine-Leather-Tube-Tote-Large-Shoulder-Bag-Handbag-Shoppers-/350751304774?pt=US_CSA_WH_Handbags&var=&hash=item51aa682c46'),
(1336, 1456, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Lady-Suede-Leather-Chain-Shoulder-Bag-Messenger-Cross-Body-Handbag-Party-%2F350751313777%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51aa684f71', 'product', 2, 'http://www.ebay.com/itm/Fashion-Lady-Suede-Leather-Chain-Shoulder-Bag-Messenger-Cross-Body-Handbag-Party-/350751313777?pt=US_CSA_WH_Handbags&var=&hash=item51aa684f71'),
(1337, 1457, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLarge-Mothers-Diaper-Shoulder-Totes-Bag-Handbag-Nappy-Baby-Multi-Pockets-Purse-%2F180991586665%3Fpt%3DUS_Diaper_Bags%26hash%3Ditem2a23f07169', 'product', 2, 'http://www.ebay.com/itm/Large-Mothers-Diaper-Shoulder-Totes-Bag-Handbag-Nappy-Baby-Multi-Pockets-Purse-/180991586665?pt=US_Diaper_Bags&hash=item2a23f07169'),
(1338, 1458, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGenuine-Real-Leather-Women-Vintage-Tote-Shoulder-Bag-CrossBody-Handbag-Messenger-%2F350980815019%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem51b81638ab', 'product', 2, 'http://www.ebay.com/itm/Genuine-Real-Leather-Women-Vintage-Tote-Shoulder-Bag-CrossBody-Handbag-Messenger-/350980815019?pt=UK_Women_s_Handbags&var=&hash=item51b81638ab'),
(1339, 1459, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Women-Lady-Girl-Leather-Quilting-Tote-Shoulder-Bag-Party-Handbag-Purse-%2F181110294592%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2b03c840', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Women-Lady-Girl-Leather-Quilting-Tote-Shoulder-Bag-Party-Handbag-Purse-/181110294592?pt=US_CSA_WH_Handbags&var=&hash=item2a2b03c840'),
(1340, 1460, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Women-Lady-Real-Genuine-Leather-Tube-Tote-Messenger-Shoulder-Bag-Handbag-%2F350751355247%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51aa68f16f', 'product', 2, 'http://www.ebay.com/itm/Retro-Women-Lady-Real-Genuine-Leather-Tube-Tote-Messenger-Shoulder-Bag-Handbag-/350751355247?pt=US_CSA_WH_Handbags&var=&hash=item51aa68f16f'),
(1341, 1461, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Womens-Real-Genuine-Leather-Handbag-Tote-Shoulder-Bag-Messenger-Purse-%2F350838053268%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem51af93d994', 'product', 2, 'http://www.ebay.com/itm/Celebrity-Womens-Real-Genuine-Leather-Handbag-Tote-Shoulder-Bag-Messenger-Purse-/350838053268?pt=US_CSA_WH_Handbags&var=&hash=item51af93d994'),
(1342, 1462, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Lady-Suede-Leather-Chain-Shoulder-Bag-Messenger-Cross-Body-Handbag-Party-%2F181110233101%3Fpt%3DUK_Women_s_Handbags%26var%3D%26hash%3Ditem2a2b02d80d', 'product', 2, 'http://www.ebay.com/itm/Fashion-Lady-Suede-Leather-Chain-Shoulder-Bag-Messenger-Cross-Body-Handbag-Party-/181110233101?pt=UK_Women_s_Handbags&var=&hash=item2a2b02d80d'),
(1343, 1463, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBlack-Women-Real-Leather-Quilting-Chain-Messenger-Shoulder-Bag-Handbag-OL-Party-%2F181110308056%3Fpt%3DUS_CSA_WH_Handbags%26var%3D%26hash%3Ditem2a2b03fcd8', 'product', 2, 'http://www.ebay.com/itm/Black-Women-Real-Leather-Quilting-Chain-Messenger-Shoulder-Bag-Handbag-OL-Party-/181110308056?pt=US_CSA_WH_Handbags&var=&hash=item2a2b03fcd8'),
(1344, 1464, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStock-Short-Mini-Bridal-Bridesmaid-Ball-Prom-Gowns-Cocktail-Evening-Party-Dress-%2F351000312453%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem51b93fba85', 'product', 2, 'http://www.ebay.com/itm/Stock-Short-Mini-Bridal-Bridesmaid-Ball-Prom-Gowns-Cocktail-Evening-Party-Dress-/351000312453?pt=Bridesmaid_Dress&var=&hash=item51b93fba85'),
(1345, 1465, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSweetheart-Prom-Gown-Bridesmaid-Evening-Party-Cocktail-Birthday-Mini-Short-Dress-%2F351000299063%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem51b93f8637', 'product', 2, 'http://www.ebay.com/itm/Sweetheart-Prom-Gown-Bridesmaid-Evening-Party-Cocktail-Birthday-Mini-Short-Dress-/351000299063?pt=Bridesmaid_Dress&var=&hash=item51b93f8637'),
(1346, 1466, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHOT-Formal-One-Shoulder-Floral-Gown-Bridesmaid-Cocktail-Party-Evening-Prom-Dress-%2F190862115978%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2c7044c48a', 'product', 2, 'http://www.ebay.com/itm/HOT-Formal-One-Shoulder-Floral-Gown-Bridesmaid-Cocktail-Party-Evening-Prom-Dress-/190862115978?pt=Bridesmaid_Dress&var=&hash=item2c7044c48a'),
(1347, 1467, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBridesmaid-Short-Mini-Tulle-Prom-Evening-Party-Cocktail-Clubwear-Ball-Gown-Dress-%2F350946457631%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem51b609f81f', 'product', 2, 'http://www.ebay.com/itm/Bridesmaid-Short-Mini-Tulle-Prom-Evening-Party-Cocktail-Clubwear-Ball-Gown-Dress-/350946457631?pt=Bridesmaid_Dress&var=&hash=item51b609f81f'),
(1348, 1468, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Formal-Bridesmaid-Gown-Prom-Ball-Cocktail-Evening-Party-Long-Maxi-Dress-%2F350921607442%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem51b48ec912', 'product', 2, 'http://www.ebay.com/itm/Elegant-Formal-Bridesmaid-Gown-Prom-Ball-Cocktail-Evening-Party-Long-Maxi-Dress-/350921607442?pt=US_CSA_WC_Dresses&var=&hash=item51b48ec912'),
(1349, 1469, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Womens-Formal-Wedding-Bridal-Prom-Gowns-Evening-Party-Cocktail-Long-Dresses-%2F181323819738%3Fpt%3DUK_Bridesmaid_Dresses%26var%3D%26hash%3Ditem2a37bdeada', 'product', 2, 'http://www.ebay.com/itm/Sexy-Womens-Formal-Wedding-Bridal-Prom-Gowns-Evening-Party-Cocktail-Long-Dresses-/181323819738?pt=UK_Bridesmaid_Dresses&var=&hash=item2a37bdeada'),
(1350, 1470, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStock-Formal-Bridesmaid-Evening-Party-Cocktail-Prom-Ball-Gowns-Flora-Short-Dress-%2F190890679670%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2c71f89d76', 'product', 2, 'http://www.ebay.com/itm/Stock-Formal-Bridesmaid-Evening-Party-Cocktail-Prom-Ball-Gowns-Flora-Short-Dress-/190890679670?pt=Bridesmaid_Dress&var=&hash=item2c71f89d76'),
(1351, 1471, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FShinning-Girls-Princess-Formal-Wedding-Bridesmaid-Dance-Gown-Dress-2-4-6-8-10-12-%2F181164700179%3Fpt%3DGirls_Wedding_Apparel%26var%3D%26hash%3Ditem2a2e41f213', 'product', 2, 'http://www.ebay.com/itm/Shinning-Girls-Princess-Formal-Wedding-Bridesmaid-Dance-Gown-Dress-2-4-6-8-10-12-/181164700179?pt=Girls_Wedding_Apparel&var=&hash=item2a2e41f213'),
(1352, 1472, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNEW-Prom-Gowns-Ball-Wedding-Bridesmaid-Evening-Party-Cocktail-Asymmetrical-Dress-%2F350821727158%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem51ae9abbb6', 'product', 2, 'http://www.ebay.com/itm/NEW-Prom-Gowns-Ball-Wedding-Bridesmaid-Evening-Party-Cocktail-Asymmetrical-Dress-/350821727158?pt=Bridesmaid_Dress&var=&hash=item51ae9abbb6'),
(1353, 1473, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Formal-Wedding-Bridesmaid-Prom-Ball-Gown-Evening-Party-Strapless-Long-Dress-%2F181153219159%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2a2d92c257', 'product', 2, 'http://www.ebay.com/itm/New-Formal-Wedding-Bridesmaid-Prom-Ball-Gown-Evening-Party-Strapless-Long-Dress-/181153219159?pt=Bridesmaid_Dress&var=&hash=item2a2d92c257'),
(1354, 1474, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGold-Strapless-Flower-Short-Mini-Dress-Evening-Party-Cocktail-Prom-Gown-SZ-4-16-%2F190861644054%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2c703d9116', 'product', 2, 'http://www.ebay.com/itm/Gold-Strapless-Flower-Short-Mini-Dress-Evening-Party-Cocktail-Prom-Gown-SZ-4-16-/190861644054?pt=Bridesmaid_Dress&var=&hash=item2c703d9116'),
(1355, 1475, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Strapless-V-Neck-Asymmetrical-Bridesmaid-Evening-Party-Prom-Ball-Gown-Dress-%2F350809087235%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem51add9dd03', 'product', 2, 'http://www.ebay.com/itm/Sexy-Strapless-V-Neck-Asymmetrical-Bridesmaid-Evening-Party-Prom-Ball-Gown-Dress-/350809087235?pt=Bridesmaid_Dress&var=&hash=item51add9dd03'),
(1356, 1476, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFormal-Wedding-Bridal-Prom-Gowns-Evening-Ball-Party-Cocktail-Long-Dress-6-Size-%2F190851496526%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2c6fa2ba4e', 'product', 2, 'http://www.ebay.com/itm/Formal-Wedding-Bridal-Prom-Gowns-Evening-Ball-Party-Cocktail-Long-Dress-6-Size-/190851496526?pt=Bridesmaid_Dress&var=&hash=item2c6fa2ba4e'),
(1357, 1477, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Front-Short-Long-Back-Formal-Wedding-Bridal-Prom-Gowns-Cocktail-Party-Dress-%2F350822504125%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem51aea696bd', 'product', 2, 'http://www.ebay.com/itm/Sexy-Front-Short-Long-Back-Formal-Wedding-Bridal-Prom-Gowns-Cocktail-Party-Dress-/350822504125?pt=Bridesmaid_Dress&var=&hash=item51aea696bd'),
(1358, 1478, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWhite-Formal-Wedding-Bridal-Bridesmaid-Prom-Ball-Gowns-Evening-Beach-Long-Dress-%2F190861182761%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2c70368729', 'product', 2, 'http://www.ebay.com/itm/White-Formal-Wedding-Bridal-Bridesmaid-Prom-Ball-Gowns-Evening-Beach-Long-Dress-/190861182761?pt=Bridesmaid_Dress&var=&hash=item2c70368729'),
(1359, 1479, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCustom-Made-Formal-Wedding-Bridal-Prom-Gown-Ball-Evening-Cocktail-Party-Dress-%2F190861578974%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2c703c92de', 'product', 2, 'http://www.ebay.com/itm/Custom-Made-Formal-Wedding-Bridal-Prom-Gown-Ball-Evening-Cocktail-Party-Dress-/190861578974?pt=Bridesmaid_Dress&var=&hash=item2c703c92de'),
(1360, 1480, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-One-Shoulder-Mermaid-Applique-Dress-Gown-Ball-Prom-Wedding-Cocktail-Evening-%2F181164731127%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2a2e426af7', 'product', 2, 'http://www.ebay.com/itm/Sexy-One-Shoulder-Mermaid-Applique-Dress-Gown-Ball-Prom-Wedding-Cocktail-Evening-/181164731127?pt=Bridesmaid_Dress&var=&hash=item2a2e426af7'),
(1361, 1481, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSheer-Floral-Formal-Wedding-Bridal-Evening-Ball-Prom-Gowns-Party-Long-Slim-Dress-%2F190862112190%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2c7044b5be', 'product', 2, 'http://www.ebay.com/itm/Sheer-Floral-Formal-Wedding-Bridal-Evening-Ball-Prom-Gowns-Party-Long-Slim-Dress-/190862112190?pt=Bridesmaid_Dress&var=&hash=item2c7044b5be'),
(1362, 1482, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBall-Women-Prom-Formal-Gown-Cocktail-Evening-Party-Long-Strapless-Dress-Ceremony-%2F190719278066%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2c67c13bf2', 'product', 2, 'http://www.ebay.com/itm/Ball-Women-Prom-Formal-Gown-Cocktail-Evening-Party-Long-Strapless-Dress-Ceremony-/190719278066?pt=US_CSA_WC_Dresses&var=&hash=item2c67c13bf2'),
(1363, 1483, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Lady-Prom-Gowns-Cocktail-Evening-Party-Long-Slim-Strapless-Dress-6-Size-%2F170880627411%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem27c94772d3', 'product', 2, 'http://www.ebay.com/itm/Elegant-Lady-Prom-Gowns-Cocktail-Evening-Party-Long-Slim-Strapless-Dress-6-Size-/170880627411?pt=US_CSA_WC_Dresses&var=&hash=item27c94772d3'),
(1364, 1484, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-V-Neck-Backless-Ball-Gowns-Prom-Bridal-Evening-Party-Cocktail-Long-Dress-%2F181160944955%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2a2e08a53b', 'product', 2, 'http://www.ebay.com/itm/Sexy-V-Neck-Backless-Ball-Gowns-Prom-Bridal-Evening-Party-Cocktail-Long-Dress-/181160944955?pt=Bridesmaid_Dress&var=&hash=item2a2e08a53b'),
(1365, 1485, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMother-of-The-Bride-Wedding-Formal-Prom-Evening-Party-Gowns-Ball-V-Neck-Dress-%2F190861203079%3Fpt%3DUS_Mother_of_the_Bride_Dresses%26var%3D%26hash%3Ditem2c7036d687', 'product', 2, 'http://www.ebay.com/itm/Mother-of-The-Bride-Wedding-Formal-Prom-Evening-Party-Gowns-Ball-V-Neck-Dress-/190861203079?pt=US_Mother_of_the_Bride_Dresses&var=&hash=item2c7036d687'),
(1366, 1486, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWhite-Wedding-Bridal-Bridesmaid-Beach-Long-Dress-Prom-Gown-Evening-Party-SZ-4-14-%2F190861625539%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2c703d48c3', 'product', 2, 'http://www.ebay.com/itm/White-Wedding-Bridal-Bridesmaid-Beach-Long-Dress-Prom-Gown-Evening-Party-SZ-4-14-/190861625539?pt=Bridesmaid_Dress&var=&hash=item2c703d48c3'),
(1367, 1487, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-One-Shoulder-Split-long-Dress-Gown-Prom-Bridesmaid-Wedding-Cocktail-Evening-%2F181153173694%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2a2d9210be', 'product', 2, 'http://www.ebay.com/itm/Sexy-One-Shoulder-Split-long-Dress-Gown-Prom-Bridesmaid-Wedding-Cocktail-Evening-/181153173694?pt=Bridesmaid_Dress&var=&hash=item2a2d9210be'),
(1368, 1488, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2PCS-Mother-of-Bride-Gown-Dress-Formal-Wedding-Ball-Evening-Party-Plus-Size-6-18-%2F181153189613%3Fpt%3DUS_Mother_of_the_Bride_Dresses%26var%3D%26hash%3Ditem2a2d924eed', 'product', 2, 'http://www.ebay.com/itm/2PCS-Mother-of-Bride-Gown-Dress-Formal-Wedding-Ball-Evening-Party-Plus-Size-6-18-/181153189613?pt=US_Mother_of_the_Bride_Dresses&var=&hash=item2a2d924eed'),
(1369, 1489, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Leopard-Strapless-Formal-Bridesmaid-Prom-Ball-Gown-Evening-Party-Dress-%2F190890672618%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2c71f881ea', 'product', 2, 'http://www.ebay.com/itm/Sexy-Leopard-Strapless-Formal-Bridesmaid-Prom-Ball-Gown-Evening-Party-Dress-/190890672618?pt=Bridesmaid_Dress&var=&hash=item2c71f881ea'),
(1370, 1490, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Cocktail-Prom-Gown-Chiffon-Beach-Long-Bridesmaid-Party-Evening-Wedding-Dress-%2F190708030307%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2c67159b63', 'product', 2, 'http://www.ebay.com/itm/New-Cocktail-Prom-Gown-Chiffon-Beach-Long-Bridesmaid-Party-Evening-Wedding-Dress-/190708030307?pt=UK_Women_s_Dresses&var=&hash=item2c67159b63'),
(1371, 1491, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMother-of-the-Bride-Formal-Evening-Ball-Lace-Flower-Gown-V-Neck-Dress-Plus-Size-%2F350861238908%3Fpt%3DUS_Mother_of_the_Bride_Dresses%26var%3D%26hash%3Ditem51b0f5a27c', 'product', 2, 'http://www.ebay.com/itm/Mother-of-the-Bride-Formal-Evening-Ball-Lace-Flower-Gown-V-Neck-Dress-Plus-Size-/350861238908?pt=US_Mother_of_the_Bride_Dresses&var=&hash=item51b0f5a27c'),
(1372, 1492, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Mermaid-Prom-Ball-Gown-Evening-Party-Ceremony-Cocktail-Bead-Strapless-Dress-%2F190862124299%3Fpt%3DBridesmaid_Dress%26var%3D%26hash%3Ditem2c7044e50b', 'product', 2, 'http://www.ebay.com/itm/Sexy-Mermaid-Prom-Ball-Gown-Evening-Party-Ceremony-Cocktail-Bead-Strapless-Dress-/190862124299?pt=Bridesmaid_Dress&var=&hash=item2c7044e50b'),
(1373, 1493, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCustom-made-Mermaid-Bridesmaid-Wedding-Prom-Gown-Off-shoulder-Dress-Party-6-Size-%2F180962704740%3Fpt%3DUK_Women_s_Dresses%26var%3D%26hash%3Ditem2a2237bd64', 'product', 2, 'http://www.ebay.com/itm/Custom-made-Mermaid-Bridesmaid-Wedding-Prom-Gown-Off-shoulder-Dress-Party-6-Size-/180962704740?pt=UK_Women_s_Dresses&var=&hash=item2a2237bd64'),
(1374, 1494, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-Sexy-leopard-Robe-de-mariee-bal-partie-soiree-Cocktail-demoiselle-dhonneur-%2F190966547892%3Fpt%3DFR_YO_Vetements_Femmes_Mariage%26var%3D%26hash%3Ditem2c767e45b4', 'product', 2, 'http://www.ebay.com/itm/2013-Sexy-leopard-Robe-de-mariee-bal-partie-soiree-Cocktail-demoiselle-dhonneur-/190966547892?pt=FR_YO_Vetements_Femmes_Mariage&var=&hash=item2c767e45b4'),
(1375, 1495, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-HOt-Wedding-Party-Evening-Formal-Gowns-Prom-Ball-Long-Strapless-Dresses-%2F180953331612%3Fpt%3DUS_CSA_WC_Dresses%26var%3D%26hash%3Ditem2a21a8b79c', 'product', 2, 'http://www.ebay.com/itm/Womens-HOt-Wedding-Party-Evening-Formal-Gowns-Prom-Ball-Long-Strapless-Dresses-/180953331612?pt=US_CSA_WC_Dresses&var=&hash=item2a21a8b79c'),
(1376, 1496, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Men-Soft-Short-Trunks-Boxer-Brief-Underwear-Sleepwear-Nightwear-Underpants-%2F350945584705%3Fpt%3DUS_CSA_MC_Underwear%26var%3D%26hash%3Ditem51b5fca641', 'product', 2, 'http://www.ebay.com/itm/Sexy-Men-Soft-Short-Trunks-Boxer-Brief-Underwear-Sleepwear-Nightwear-Underpants-/350945584705?pt=US_CSA_MC_Underwear&var=&hash=item51b5fca641'),
(1377, 1497, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMan-Cotton-Blend-Striped-Boxer-Briefs-Trunk-Mens-Underwear-Short-Pant-Free-Ship-%2F190737516553%3Fpt%3DUS_CSA_MC_Underwear%26var%3D%26hash%3Ditem2c68d78809', 'product', 2, 'http://www.ebay.com/itm/Man-Cotton-Blend-Striped-Boxer-Briefs-Trunk-Mens-Underwear-Short-Pant-Free-Ship-/190737516553?pt=US_CSA_MC_Underwear&var=&hash=item2c68d78809'),
(1378, 1498, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSexy-Mens-Faux-Leather-Boxer-Briefs-Shorts-Trunks-Pant-Nightwear-Underwear-Swim-%2F190716478274%3Fpt%3DUS_CSA_MC_Underwear%26var%3D%26hash%3Ditem2c67968342', 'product', 2, 'http://www.ebay.com/itm/Sexy-Mens-Faux-Leather-Boxer-Briefs-Shorts-Trunks-Pant-Nightwear-Underwear-Swim-/190716478274?pt=US_CSA_MC_Underwear&var=&hash=item2c67968342'),
(1379, 1499, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Mens-Fashion-Boxer-Briefs-Shorts-Trunks-Underwear-pant-Sleep-Size-M-L-XL-%2F180956018658%3Fpt%3DUS_CSA_MC_Underwear%26var%3D%26hash%3Ditem2a21d1b7e2', 'product', 2, 'http://www.ebay.com/itm/Korean-Mens-Fashion-Boxer-Briefs-Shorts-Trunks-Underwear-pant-Sleep-Size-M-L-XL-/180956018658?pt=US_CSA_MC_Underwear&var=&hash=item2a21d1b7e2'),
(1380, 1500, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Trendy-Men-Crew-Neck-Casual-Colorful-Stripe-T-Shirts-Tops-Blouse-Summer-%2F170854958591%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem27c7bfc5ff', 'product', 2, 'http://www.ebay.com/itm/Korean-Trendy-Men-Crew-Neck-Casual-Colorful-Stripe-T-Shirts-Tops-Blouse-Summer-/170854958591?pt=US_Mens_Tshirts&var=&hash=item27c7bfc5ff'),
(1381, 1501, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Womens-Funny-Hand-Grab-Lovers-Couple-Clothes-Short-Sleeve-T-Shirt-Tee-Tops-%2F181139831442%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem2a2cc67a92', 'product', 2, 'http://www.ebay.com/itm/Mens-Womens-Funny-Hand-Grab-Lovers-Couple-Clothes-Short-Sleeve-T-Shirt-Tee-Tops-/181139831442?pt=US_Mens_Tshirts&var=&hash=item2a2cc67a92'),
(1382, 1502, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStylish-Mens-Casual-V-Neck-Solid-Long-Sleeve-Slim-Fitted-T-Shirt-Tee-Shirts-Tops-%2F350902147597%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem51b365da0d', 'product', 2, 'http://www.ebay.com/itm/Stylish-Mens-Casual-V-Neck-Solid-Long-Sleeve-Slim-Fitted-T-Shirt-Tee-Shirts-Tops-/350902147597?pt=US_Mens_Tshirts&var=&hash=item51b365da0d'),
(1383, 1503, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-Men-Stylish-Slim-Short-Sleeve-Casual-POLO-Shirt-T-shirts-Tee-Tops-6-Colors-%2F190882371489%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem2c7179d7a1', 'product', 2, 'http://www.ebay.com/itm/2013-Men-Stylish-Slim-Short-Sleeve-Casual-POLO-Shirt-T-shirts-Tee-Tops-6-Colors-/190882371489?pt=US_Mens_Tshirts&var=&hash=item2c7179d7a1'),
(1384, 1504, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Ladies-Short-Hot-Pants-Mini-Fitted-Trousers-Summerwear-Pant-Skirt-Casual-%2F170837668605%3Fpt%3DUS_CSA_MC_Pants%26var%3D%26hash%3Ditem27c6b7f2fd', 'product', 2, 'http://www.ebay.com/itm/New-Ladies-Short-Hot-Pants-Mini-Fitted-Trousers-Summerwear-Pant-Skirt-Casual-/170837668605?pt=US_CSA_MC_Pants&var=&hash=item27c6b7f2fd'),
(1385, 1505, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FSummer-Mens-Casual-Plaids-Short-Sleeve-Stand-Collar-Polo-T-shirts-Shirt-Tee-Tops-%2F350846822336%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem51b019a7c0', 'product', 2, 'http://www.ebay.com/itm/Summer-Mens-Casual-Plaids-Short-Sleeve-Stand-Collar-Polo-T-shirts-Shirt-Tee-Tops-/350846822336?pt=US_Mens_Tshirts&var=&hash=item51b019a7c0'),
(1386, 1506, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Boys-Stylish-Casual-Stand-Collar-Short-Sleeve-Polo-Shirt-T-shirts-Tee-Tops-%2F190838950570%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem2c6ee34aaa', 'product', 2, 'http://www.ebay.com/itm/Mens-Boys-Stylish-Casual-Stand-Collar-Short-Sleeve-Polo-Shirt-T-shirts-Tee-Tops-/190838950570?pt=US_Mens_Tshirts&var=&hash=item2c6ee34aaa'),
(1387, 1507, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStylish-Mens-Boys-3-Soldiers-Casual-Short-Sleeve-Tee-T-Shirts-Tops-Blouse-Summer-%2F181139799754%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem2a2cc5feca', 'product', 2, 'http://www.ebay.com/itm/Stylish-Mens-Boys-3-Soldiers-Casual-Short-Sleeve-Tee-T-Shirts-Tops-Blouse-Summer-/181139799754?pt=US_Mens_Tshirts&var=&hash=item2a2cc5feca'),
(1388, 1508, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStylish-Mens-V-Neck-Slim-Fit-Long-Sleeve-Casual-T-Shirts-Tee-Shirt-Tops-6-Colors-%2F181241438945%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem2a32d4e2e1', 'product', 2, 'http://www.ebay.com/itm/Stylish-Mens-V-Neck-Slim-Fit-Long-Sleeve-Casual-T-Shirts-Tee-Shirt-Tops-6-Colors-/181241438945?pt=US_Mens_Tshirts&var=&hash=item2a32d4e2e1'),
(1389, 1509, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Style-Polo-Turn-Down-Neck-Mens-Short-T-Shirt-Man-Tops-Casual-Sports-Blouse-%2F170851459189%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem27c78a6075', 'product', 2, 'http://www.ebay.com/itm/New-Style-Polo-Turn-Down-Neck-Mens-Short-T-Shirt-Man-Tops-Casual-Sports-Blouse-/170851459189?pt=US_Mens_Tshirts&var=&hash=item27c78a6075'),
(1390, 1510, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMen-V-Neck-Long-Sleeve-Knit-Fit-T-Tee-Shirts-Tops-Casual-Blouse-Size-XS-S-M-L-%2F170857056464%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem27c7dfc8d0', 'product', 2, 'http://www.ebay.com/itm/Men-V-Neck-Long-Sleeve-Knit-Fit-T-Tee-Shirts-Tops-Casual-Blouse-Size-XS-S-M-L-/170857056464?pt=US_Mens_Tshirts&var=&hash=item27c7dfc8d0'),
(1391, 1511, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Men-V-Neck-Short-Sleeve-Slim-Fit-Casual-T-Shirt-Tops-Shirts-Tee-3-Colors-%2F181240709793%3Fpt%3DUS_CSA_MC_Shirts%26var%3D%26hash%3Ditem2a32c9c2a1', 'product', 2, 'http://www.ebay.com/itm/Fashion-Men-V-Neck-Short-Sleeve-Slim-Fit-Casual-T-Shirt-Tops-Shirts-Tee-3-Colors-/181240709793?pt=US_CSA_MC_Shirts&var=&hash=item2a32c9c2a1'),
(1392, 1512, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCool-Mens-Boy-Casual-Stand-Collar-Polo-Shirts-Short-Sleeve-T-shirts-Tops-Tee-M-L-%2F181139823586%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem2a2cc65be2', 'product', 2, 'http://www.ebay.com/itm/Cool-Mens-Boy-Casual-Stand-Collar-Polo-Shirts-Short-Sleeve-T-shirts-Tops-Tee-M-L-/181139823586?pt=US_Mens_Tshirts&var=&hash=item2a2cc65be2'),
(1393, 1513, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLuxury-Men-Slim-Fit-Stylish-Dress-Shirts-Tops-Casual-Business-Formal-Career-M-XL-%2F181173398392%3Fpt%3DUS_CSA_MC_Shirts%26var%3D%26hash%3Ditem2a2ec6ab78', 'product', 2, 'http://www.ebay.com/itm/Luxury-Men-Slim-Fit-Stylish-Dress-Shirts-Tops-Casual-Business-Formal-Career-M-XL-/181173398392?pt=US_CSA_MC_Shirts&var=&hash=item2a2ec6ab78'),
(1394, 1514, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Shoulder-Mark-Design-Cago-Pockets-Mens-Casual-Slim-Shirts-Tops-Blouse-%2F180895481822%3Fpt%3DUS_CSA_MC_Shirts%26var%3D%26hash%3Ditem2a1e35ffde', 'product', 2, 'http://www.ebay.com/itm/Fashion-Shoulder-Mark-Design-Cago-Pockets-Mens-Casual-Slim-Shirts-Tops-Blouse-/180895481822?pt=US_CSA_MC_Shirts&var=&hash=item2a1e35ffde'),
(1395, 1515, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMen-Luxury-Stylish-Casual-Career-Business-Formal-Suit-Slim-Fit-Dress-Shirts-Tops-%2F190866004904%3Fpt%3DUS_CSA_MC_Shirts%26var%3D%26hash%3Ditem2c70801ba8', 'product', 2, 'http://www.ebay.com/itm/Men-Luxury-Stylish-Casual-Career-Business-Formal-Suit-Slim-Fit-Dress-Shirts-Tops-/190866004904?pt=US_CSA_MC_Shirts&var=&hash=item2c70801ba8'),
(1396, 1516, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Sell-Cool-Men-Long-Sleeve-Collared-Casual-Shirts-Career-Slim-Tops-Business-%2F190698019808%3Fpt%3DUS_CSA_MC_Shirts%26var%3D%26hash%3Ditem2c667cdbe0', 'product', 2, 'http://www.ebay.com/itm/Hot-Sell-Cool-Men-Long-Sleeve-Collared-Casual-Shirts-Career-Slim-Tops-Business-/190698019808?pt=US_CSA_MC_Shirts&var=&hash=item2c667cdbe0'),
(1397, 1517, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBoys-Black-White-Man-Long-Casual-Slim-Casual-Shirt-Business-Fit-Tops-Size-XS-S-M-%2F180919301878%3Fpt%3DUS_CSA_MC_Shirts%26var%3D%26hash%3Ditem2a1fa176f6', 'product', 2, 'http://www.ebay.com/itm/Boys-Black-White-Man-Long-Casual-Slim-Casual-Shirt-Business-Fit-Tops-Size-XS-S-M-/180919301878?pt=US_CSA_MC_Shirts&var=&hash=item2a1fa176f6'),
(1398, 1518, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FPerfect-Line-Cut-Design-Square-Collar-Slim-Mens-Long-Casual-Career-Shirt-Tops-%2F170851463950%3Fpt%3DUS_CSA_MC_Shirts%26var%3D%26hash%3Ditem27c78a730e', 'product', 2, 'http://www.ebay.com/itm/Perfect-Line-Cut-Design-Square-Collar-Slim-Mens-Long-Casual-Career-Shirt-Tops-/170851463950?pt=US_CSA_MC_Shirts&var=&hash=item27c78a730e'),
(1399, 1519, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Men-Plaid-Check-Casual-Dress-Patched-Long-Sleeve-Fit-Shirt-Tops-Blouse-%2F350803624877%3Fpt%3DUS_CSA_MC_Shirts%26var%3D%26hash%3Ditem51ad8683ad', 'product', 2, 'http://www.ebay.com/itm/Vintage-Men-Plaid-Check-Casual-Dress-Patched-Long-Sleeve-Fit-Shirt-Tops-Blouse-/350803624877?pt=US_CSA_MC_Shirts&var=&hash=item51ad8683ad'),
(1400, 1520, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Style-Button-Down-Collar-Grid-Mens-Cool-Long-Business-Shirt-Fit-Tops-%2F170851475204%3Fpt%3DUS_CSA_MC_Shirts%26var%3D%26hash%3Ditem27c78a9f04', 'product', 2, 'http://www.ebay.com/itm/Korean-Style-Button-Down-Collar-Grid-Mens-Cool-Long-Business-Shirt-Fit-Tops-/170851475204?pt=US_CSA_MC_Shirts&var=&hash=item27c78a9f04'),
(1401, 1521, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Style-Button-Down-Long-Sleeve-Slim-Mens-T-Shirts-Top-Casual-Career-Blouse-%2F170851342369%3Fpt%3DUS_CSA_MC_Shirts%26var%3D%26hash%3Ditem27c7889821', 'product', 2, 'http://www.ebay.com/itm/Korean-Style-Button-Down-Long-Sleeve-Slim-Mens-T-Shirts-Top-Casual-Career-Blouse-/170851342369?pt=US_CSA_MC_Shirts&var=&hash=item27c7889821'),
(1402, 1522, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Mens-Short-Sleeve-Slim-Fitted-T-shirts-Tee-Polo-Casual-Shirt-Tops-4-Size-%2F190698018514%3Fpt%3DUS_CSA_MC_Shirts%26var%3D%26hash%3Ditem2c667cd6d2', 'product', 2, 'http://www.ebay.com/itm/New-Mens-Short-Sleeve-Slim-Fitted-T-shirts-Tee-Polo-Casual-Shirt-Tops-4-Size-/190698018514?pt=US_CSA_MC_Shirts&var=&hash=item2c667cd6d2'),
(1403, 1523, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Mens-Boys-Summer-Lapel-Stripe-Short-Sleeve-Polo-Shirts-T-shirt-Tee-Tops-%2F190838970872%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem2c6ee399f8', 'product', 2, 'http://www.ebay.com/itm/Fashion-Mens-Boys-Summer-Lapel-Stripe-Short-Sleeve-Polo-Shirts-T-shirt-Tee-Tops-/190838970872?pt=US_Mens_Tshirts&var=&hash=item2c6ee399f8'),
(1404, 1524, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Short-Sleeve-Slim-Fit-T-shirts-Tee-Polo-Shirt-Tops-3-Colors-Casual-Career-%2F180933790176%3Fpt%3DUK_Men_s_Tops_Casual_Shirts%26var%3D%26hash%3Ditem2a207e89e0', 'product', 2, 'http://www.ebay.com/itm/Mens-Short-Sleeve-Slim-Fit-T-shirts-Tee-Polo-Shirt-Tops-3-Colors-Casual-Career-/180933790176?pt=UK_Men_s_Tops_Casual_Shirts&var=&hash=item2a207e89e0'),
(1405, 1525, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Mens-Harem-Baggy-Hip-Hop-Dance-Sport-Sweat-Pants-Trousers-Slacks-Jogging-%2F181261514366%3Fpt%3DUS_CSA_MC_Pants%26var%3D%26hash%3Ditem2a3407367e', 'product', 2, 'http://www.ebay.com/itm/Fashion-Mens-Harem-Baggy-Hip-Hop-Dance-Sport-Sweat-Pants-Trousers-Slacks-Jogging-/181261514366?pt=US_CSA_MC_Pants&var=&hash=item2a3407367e'),
(1406, 1526, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Fashion-Slim-Fit-Tops-Warm-Thicked-Hoodies-Hoody-Zip-Jackets-Coat-Outwear-%2F181170515172%3Fpt%3DUS_CSA_MC_Outerwear%26var%3D%26hash%3Ditem2a2e9aace4', 'product', 2, 'http://www.ebay.com/itm/Mens-Fashion-Slim-Fit-Tops-Warm-Thicked-Hoodies-Hoody-Zip-Jackets-Coat-Outwear-/181170515172?pt=US_CSA_MC_Outerwear&var=&hash=item2a2e9aace4'),
(1407, 1527, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Thicked-Winter-Warm-Slim-Fit-Tops-Hoodies-Hoody-Zip-Jackets-Coat-Outwear-%2F200994782526%3Fpt%3DUS_CSA_MC_Outerwear%26var%3D%26hash%3Ditem2ecc38fd3e', 'product', 2, 'http://www.ebay.com/itm/Mens-Thicked-Winter-Warm-Slim-Fit-Tops-Hoodies-Hoody-Zip-Jackets-Coat-Outwear-/200994782526?pt=US_CSA_MC_Outerwear&var=&hash=item2ecc38fd3e'),
(1408, 1528, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCool-Mens-Slim-Fit-Zipper-Stand-up-High-Collar-Hoodie-Jacket-Outwear-Coat-S-M-L-%2F350828141007%3Fpt%3DUS_CSA_MC_Outerwear%26var%3D%26hash%3Ditem51aefc99cf', 'product', 2, 'http://www.ebay.com/itm/Cool-Mens-Slim-Fit-Zipper-Stand-up-High-Collar-Hoodie-Jacket-Outwear-Coat-S-M-L-/350828141007?pt=US_CSA_MC_Outerwear&var=&hash=item51aefc99cf'),
(1409, 1529, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMen-Short-Bermuda-Straight-Cargo-Cropped-Jean-Pants-Summer-Denim-Spandex-Trouser-%2F180898869179%3Fpt%3DUS_CSA_MC_Jeans%26var%3D%26hash%3Ditem2a1e69afbb', 'product', 2, 'http://www.ebay.com/itm/Men-Short-Bermuda-Straight-Cargo-Cropped-Jean-Pants-Summer-Denim-Spandex-Trouser-/180898869179?pt=US_CSA_MC_Jeans&var=&hash=item2a1e69afbb'),
(1410, 1530, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Slim-Mens-Polo-Collar-T-shirt-Casual-Career-Tee-Fit-Tops-Blouse-Size-Xs-S-M-%2F170868869716%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem27c8940a54', 'product', 2, 'http://www.ebay.com/itm/New-Slim-Mens-Polo-Collar-T-shirt-Casual-Career-Tee-Fit-Tops-Blouse-Size-Xs-S-M-/170868869716?pt=US_Mens_Tshirts&var=&hash=item27c8940a54'),
(1411, 1531, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-New-Mens-Stylish-Casual-Long-Sleeve-Slim-POLO-Shirt-T-shirts-Tee-Tops-L-XXL-%2F181191363163%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem2a2fd8ca5b', 'product', 2, 'http://www.ebay.com/itm/2013-New-Mens-Stylish-Casual-Long-Sleeve-Slim-POLO-Shirt-T-shirts-Tee-Tops-L-XXL-/181191363163?pt=US_Mens_Tshirts&var=&hash=item2a2fd8ca5b'),
(1412, 1532, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Warm-Fleece-Basic-CoatS-Long-Man-Motocycle-Jackets-Winter-Outcoat-Large-L-%2F180919290827%3Fpt%3DUS_CSA_MC_Outerwear%26var%3D%26hash%3Ditem2a1fa14bcb', 'product', 2, 'http://www.ebay.com/itm/Mens-Warm-Fleece-Basic-CoatS-Long-Man-Motocycle-Jackets-Winter-Outcoat-Large-L-/180919290827?pt=US_CSA_MC_Outerwear&var=&hash=item2a1fa14bcb'),
(1413, 1533, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMan-Straight-Relaxed-Long-Pant-Business-Men-Jeans-Casual-Trousers-Mutli-Size-%2F180902140218%3Fpt%3DUS_CSA_MC_Pants%26var%3D%26hash%3Ditem2a1e9b993a', 'product', 2, 'http://www.ebay.com/itm/Man-Straight-Relaxed-Long-Pant-Business-Men-Jeans-Casual-Trousers-Mutli-Size-/180902140218?pt=US_CSA_MC_Pants&var=&hash=item2a1e9b993a'),
(1414, 1534, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Men-Straight-Relaxed-Long-Pants-Jeans-Multi-Pockets-Fit-Career-Man-Trousers-%2F190688933175%3Fpt%3DUS_CSA_MC_Pants%26var%3D%26hash%3Ditem2c65f23537', 'product', 2, 'http://www.ebay.com/itm/Hot-Men-Straight-Relaxed-Long-Pants-Jeans-Multi-Pockets-Fit-Career-Man-Trousers-/190688933175?pt=US_CSA_MC_Pants&var=&hash=item2c65f23537'),
(1415, 1535, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Men-Summer-Three-dimensional-Breasted-Casual-Sports-Pants-Rope-Trousers-%2F201012253862%3Fpt%3DUS_CSA_MC_Pants%26var%3D%26hash%3Ditem2ecd4394a6', 'product', 2, 'http://www.ebay.com/itm/Fashion-Men-Summer-Three-dimensional-Breasted-Casual-Sports-Pants-Rope-Trousers-/201012253862?pt=US_CSA_MC_Pants&var=&hash=item2ecd4394a6'),
(1416, 1536, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Slim-Casual-Pant-Long-Fit-Straight-Leg-Trousers-Size-29-30-31-32-33-34-35-%2F180919293300%3Fpt%3DUS_CSA_MC_Pants%26var%3D%26hash%3Ditem2a1fa15574', 'product', 2, 'http://www.ebay.com/itm/Mens-Slim-Casual-Pant-Long-Fit-Straight-Leg-Trousers-Size-29-30-31-32-33-34-35-/180919293300?pt=US_CSA_MC_Pants&var=&hash=item2a1fa15574'),
(1417, 1537, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Turtle-Neck-Winter-Warm-Knit-Slim-Fit-Pullover-Sweater-Knitwear-Tops-Jumper-%2F181211875423%3Fpt%3DUS_CSA_MC_Sweaters%26var%3D%26hash%3Ditem2a3111c85f', 'product', 2, 'http://www.ebay.com/itm/Mens-Turtle-Neck-Winter-Warm-Knit-Slim-Fit-Pullover-Sweater-Knitwear-Tops-Jumper-/181211875423?pt=US_CSA_MC_Sweaters&var=&hash=item2a3111c85f'),
(1418, 1538, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStylish-Mens-V-Neck-Long-Sleeve-Slim-Fit-Cardigan-Sweater-Knitwear-Shirts-Tops-%2F181191332783%3Fpt%3DUS_CSA_MC_Sweaters%26var%3D%26hash%3Ditem2a2fd853af', 'product', 2, 'http://www.ebay.com/itm/Stylish-Mens-V-Neck-Long-Sleeve-Slim-Fit-Cardigan-Sweater-Knitwear-Shirts-Tops-/181191332783?pt=US_CSA_MC_Sweaters&var=&hash=item2a2fd853af'),
(1419, 1539, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Men-Thick-Warm-Polo-Stand-Collar-Work-Wear-Jumper-Sweater-Pullover-Top-Shirt-%2F181261513818%3Fpt%3DUS_CSA_MC_Sweaters%26var%3D%26hash%3Ditem2a3407345a', 'product', 2, 'http://www.ebay.com/itm/New-Men-Thick-Warm-Polo-Stand-Collar-Work-Wear-Jumper-Sweater-Pullover-Top-Shirt-/181261513818?pt=US_CSA_MC_Sweaters&var=&hash=item2a3407345a'),
(1420, 1540, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Zipper-Hoodie-Sweater-Hooded-Long-Sleeve-Thick-Coat-Warm-Motobycle-Jacket-%2F170870844490%3Fpt%3DUS_CSA_MC_Outerwear%26var%3D%26hash%3Ditem27c8b22c4a', 'product', 2, 'http://www.ebay.com/itm/Mens-Zipper-Hoodie-Sweater-Hooded-Long-Sleeve-Thick-Coat-Warm-Motobycle-Jacket-/170870844490?pt=US_CSA_MC_Outerwear&var=&hash=item27c8b22c4a'),
(1421, 1541, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Fashion-Straight-Leg-Mens-Jeans-Pants-Leisure-Long-Plain-Denim-Trousers-%2F180899745040%3Fpt%3DUS_CSA_MC_Pants%26var%3D%26hash%3Ditem2a1e770d10', 'product', 2, 'http://www.ebay.com/itm/New-Fashion-Straight-Leg-Mens-Jeans-Pants-Leisure-Long-Plain-Denim-Trousers-/180899745040?pt=US_CSA_MC_Pants&var=&hash=item2a1e770d10'),
(1422, 1542, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Mens-Baseball-Tops-T-Shirt-Long-Sleeve-Casual-Outwear-Coat-Sport-Jackets-%2F190702549801%3Fpt%3DUS_Mens_Tshirts%26var%3D%26hash%3Ditem2c66c1fb29', 'product', 2, 'http://www.ebay.com/itm/Korean-Mens-Baseball-Tops-T-Shirt-Long-Sleeve-Casual-Outwear-Coat-Sport-Jackets-/190702549801?pt=US_Mens_Tshirts&var=&hash=item2c66c1fb29'),
(1423, 1543, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FThicked-Cotton-Blend-Mens-Keep-Warm-Casual-Coat-OutWear-Long-Sleeve-Top-Jackets-%2F170868867409%3Fpt%3DUS_CSA_MC_Outerwear%26var%3D%26hash%3Ditem27c8940151', 'product', 2, 'http://www.ebay.com/itm/Thicked-Cotton-Blend-Mens-Keep-Warm-Casual-Coat-OutWear-Long-Sleeve-Top-Jackets-/170868867409?pt=US_CSA_MC_Outerwear&var=&hash=item27c8940151'),
(1424, 1544, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Mens-Multi-Pockets-Loose-Sport-Outdoor-Work-Cargo-Combat-Long-Pants-Trousers-%2F181139860564%3Fpt%3DUS_CSA_MC_Pants%26var%3D%26hash%3Ditem2a2cc6ec54', 'product', 2, 'http://www.ebay.com/itm/New-Mens-Multi-Pockets-Loose-Sport-Outdoor-Work-Cargo-Combat-Long-Pants-Trousers-/181139860564?pt=US_CSA_MC_Pants&var=&hash=item2a2cc6ec54'),
(1425, 1545, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Mens-Straight-Slim-Long-Jean-Denim-Pants-Breathable-Trousers-Size-28-36-%2F170854962619%3Fpt%3DUS_CSA_MC_Jeans%26var%3D%26hash%3Ditem27c7bfd5bb', 'product', 2, 'http://www.ebay.com/itm/Hot-Mens-Straight-Slim-Long-Jean-Denim-Pants-Breathable-Trousers-Size-28-36-/170854962619?pt=US_CSA_MC_Jeans&var=&hash=item27c7bfd5bb'),
(1426, 1546, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Men-Classic-Double-Breasted-Slim-Trench-Coat-Jacket-Outwear-Overcoat-Peacoat-%2F190935077857%3Fpt%3DUS_CSA_MC_Outerwear%26var%3D%26hash%3Ditem2c749e13e1', 'product', 2, 'http://www.ebay.com/itm/New-Men-Classic-Double-Breasted-Slim-Trench-Coat-Jacket-Outwear-Overcoat-Peacoat-/190935077857?pt=US_CSA_MC_Outerwear&var=&hash=item2c749e13e1'),
(1427, 1547, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHOT-Sexy-Lingerie-Mens-Mesh-Sheer-Underwear-G-String-Thong-T-Back-Shorts-Pants-%2F190715816039%3Fpt%3DUS_CSA_MC_Underwear%26var%3D%26hash%3Ditem2c678c6867', 'product', 2, 'http://www.ebay.com/itm/HOT-Sexy-Lingerie-Mens-Mesh-Sheer-Underwear-G-String-Thong-T-Back-Shorts-Pants-/190715816039?pt=US_CSA_MC_Underwear&var=&hash=item2c678c6867'),
(1428, 1548, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Men-Short-Trunks-Pant-Boxer-Brief-Modal-Man-Underwear-BeachWear-Hot-Siwmwear-%2F190719306427%3Fpt%3DUK_Men_s_Underwear%26var%3D%26hash%3Ditem2c67c1aabb', 'product', 2, 'http://www.ebay.com/itm/New-Men-Short-Trunks-Pant-Boxer-Brief-Modal-Man-Underwear-BeachWear-Hot-Siwmwear-/190719306427?pt=UK_Men_s_Underwear&var=&hash=item2c67c1aabb'),
(1429, 1549, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Sexy-See-Through-Mens-Shorts-Underwear-Pants-Boxer-Briefs-Trunks-Nightwear-%2F170898504304%3Fpt%3DUS_CSA_MC_Underwear%26var%3D%26hash%3Ditem27ca583a70', 'product', 2, 'http://www.ebay.com/itm/Hot-Sexy-See-Through-Mens-Shorts-Underwear-Pants-Boxer-Briefs-Trunks-Nightwear-/170898504304?pt=US_CSA_MC_Underwear&var=&hash=item27ca583a70'),
(1430, 1550, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Men-Short-Trunks-Pant-Boxer-Brief-Modal-Man-Underwear-BeachWear-Siwmwear-Hot-%2F170898488766%3Fpt%3DUS_CSA_MC_Underwear%26var%3D%26hash%3Ditem27ca57fdbe', 'product', 2, 'http://www.ebay.com/itm/New-Men-Short-Trunks-Pant-Boxer-Brief-Modal-Man-Underwear-BeachWear-Siwmwear-Hot-/170898488766?pt=US_CSA_MC_Underwear&var=&hash=item27ca57fdbe'),
(1431, 1551, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FUnisex-Women-Men-Winter-Warm-Slouch-Knit-Cap-Oversized-Cuffed-Beanie-Crochet-Hat-%2F190928459389%3Fpt%3DUS_Hats%26var%3D%26hash%3Ditem2c7439167d', 'product', 1, 'http://www.ebay.com/itm/Unisex-Women-Men-Winter-Warm-Slouch-Knit-Cap-Oversized-Cuffed-Beanie-Crochet-Hat-/190928459389?pt=US_Hats&var=&hash=item2c7439167d'),
(1432, 1552, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Men-Leather-Bifold-Wallet-Casual-Purse-Passcase-Credit-Card-Photo-Slots-Clip-%2F181127991315%3Fpt%3DUK_Purses_Wallets%26hash%3Ditem2a2c11d013', 'product', 2, 'http://www.ebay.com/itm/New-Men-Leather-Bifold-Wallet-Casual-Purse-Passcase-Credit-Card-Photo-Slots-Clip-/181127991315?pt=UK_Purses_Wallets&hash=item2a2c11d013'),
(1433, 1553, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FUnisex-Women-Men-Fedora-Trilby-Upturn-Brim-Cap-Summer-Travel-Beach-Straw-Sun-Hat-%2F190882321744%3Fpt%3DUS_Hats%26var%3D%26hash%3Ditem2c71791550', 'product', 2, 'http://www.ebay.com/itm/Unisex-Women-Men-Fedora-Trilby-Upturn-Brim-Cap-Summer-Travel-Beach-Straw-Sun-Hat-/190882321744?pt=US_Hats&var=&hash=item2c71791550'),
(1434, 1554, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWestern-Mens-Leather-Bifold-Wallet-Purse-Credit-Card-Photo-Slots-Clip-Passcase-%2F181127983970%3Fpt%3DWallet%26hash%3Ditem2a2c11b362', 'product', 2, 'http://www.ebay.com/itm/Western-Mens-Leather-Bifold-Wallet-Purse-Credit-Card-Photo-Slots-Clip-Passcase-/181127983970?pt=Wallet&hash=item2a2c11b362'),
(1435, 1555, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Men-Leather-Bifold-Credit-ID-Card-Photo-Slots-Clip-Wallet-Purse-Passcase-%2F181128019075%3Fpt%3DUK_Purses_Wallets%26hash%3Ditem2a2c123c83', 'product', 2, 'http://www.ebay.com/itm/Fashion-Men-Leather-Bifold-Credit-ID-Card-Photo-Slots-Clip-Wallet-Purse-Passcase-/181128019075?pt=UK_Purses_Wallets&hash=item2a2c123c83'),
(1436, 1556, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFahion-Mens-Leather-Hollow-Out-Bifold-ID-Card-Bag-Photo-Slots-Clip-Wallet-Purse-%2F350804744724%3Fpt%3DWallet%26hash%3Ditem51ad979a14', 'product', 2, 'http://www.ebay.com/itm/Fahion-Mens-Leather-Hollow-Out-Bifold-ID-Card-Bag-Photo-Slots-Clip-Wallet-Purse-/350804744724?pt=Wallet&hash=item51ad979a14'),
(1437, 1557, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Mens-Real-Leather-Bifold-ID-Card-Bag-Photo-Slots-Clip-Wallet-Purse-Gifts-%2F190847711609%3Fpt%3DWallet%26hash%3Ditem2c6f68f979', 'product', 2, 'http://www.ebay.com/itm/Retro-Mens-Real-Leather-Bifold-ID-Card-Bag-Photo-Slots-Clip-Wallet-Purse-Gifts-/190847711609?pt=Wallet&hash=item2c6f68f979'),
(1438, 1558, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Men-Leather-Bifold-Wallet-Casual-Purse-Passcase-Credit-Card-Photo-Slots-Clip-%2F350777067912%3Fpt%3DWallet%26hash%3Ditem51abf14988', 'product', 2, 'http://www.ebay.com/itm/New-Men-Leather-Bifold-Wallet-Casual-Purse-Passcase-Credit-Card-Photo-Slots-Clip-/350777067912?pt=Wallet&hash=item51abf14988'),
(1439, 1559, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Men-Leather-Bifold-Wallet-Purse-Passcase-Coin-Credit-Card-Photo-Slots-Clip-%2F350777076392%3Fpt%3DWallet%26hash%3Ditem51abf16aa8', 'product', 2, 'http://www.ebay.com/itm/Retro-Men-Leather-Bifold-Wallet-Purse-Passcase-Coin-Credit-Card-Photo-Slots-Clip-/350777076392?pt=Wallet&hash=item51abf16aa8'),
(1440, 1560, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Men-Leather-Bi-fold-Long-Wallet-Clutch-Passcase-Pocket-Purse-Bag-Card-Holder-%2F190864236120%3Fpt%3DWallet%26var%3D%26hash%3Ditem2c70651e58', 'product', 2, 'http://www.ebay.com/itm/New-Men-Leather-Bi-fold-Long-Wallet-Clutch-Passcase-Pocket-Purse-Bag-Card-Holder-/190864236120?pt=Wallet&var=&hash=item2c70651e58'),
(1441, 1561, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Men-Soft-Leather-Plaid-Bifold-Long-Wallet-Purse-Credit-Card-Clip-Photo-Slots-%2F190829225388%3Fpt%3DUK_Purses_Wallets%26hash%3Ditem2c6e4ee5ac', 'product', 2, 'http://www.ebay.com/itm/New-Men-Soft-Leather-Plaid-Bifold-Long-Wallet-Purse-Credit-Card-Clip-Photo-Slots-/190829225388?pt=UK_Purses_Wallets&hash=item2c6e4ee5ac'),
(1442, 1562, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FBusiness-Men-Leather-Bi-fold-Wallet-Passcase-Purse-Credit-Card-Holder-Money-Clip-%2F181168113061%3Fpt%3DWallet%26hash%3Ditem2a2e7605a5', 'product', 2, 'http://www.ebay.com/itm/Business-Men-Leather-Bi-fold-Wallet-Passcase-Purse-Credit-Card-Holder-Money-Clip-/181168113061?pt=Wallet&hash=item2a2e7605a5'),
(1443, 1563, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FReal-Leather-Mens-Bifold-Credit-Card-Photo-Slots-Clip-Long-Wallet-Purse-Passcase-%2F350777082650%3Fpt%3DWallet%26var%3D%26hash%3Ditem51abf1831a', 'product', 2, 'http://www.ebay.com/itm/Real-Leather-Mens-Bifold-Credit-Card-Photo-Slots-Clip-Long-Wallet-Purse-Passcase-/350777082650?pt=Wallet&var=&hash=item51abf1831a'),
(1444, 1564, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Men-Leather-Bifold-Credit-ID-Card-Photo-Slots-Clip-Wallet-Purse-Passcase-%2F190829252761%3Fpt%3DWallet%26hash%3Ditem2c6e4f5099', 'product', 2, 'http://www.ebay.com/itm/Fashion-Men-Leather-Bifold-Credit-ID-Card-Photo-Slots-Clip-Wallet-Purse-Passcase-/190829252761?pt=Wallet&hash=item2c6e4f5099'),
(1445, 1565, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FStylish-Men-Leather-Bifold-Plaids-ID-Card-Photo-Slots-Clip-Wallet-Purse-Passcase-%2F350777114709%3Fpt%3DWallet%26hash%3Ditem51abf20055', 'product', 2, 'http://www.ebay.com/itm/Stylish-Men-Leather-Bifold-Plaids-ID-Card-Photo-Slots-Clip-Wallet-Purse-Passcase-/350777114709?pt=Wallet&hash=item51abf20055'),
(1446, 1566, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Genuine-Real-Leather-Bifold-Wallet-Credit-ID-Card-Photo-Holder-Bag-Purse-%2F350803619906%3Fpt%3DWallet%26hash%3Ditem51ad867042', 'product', 2, 'http://www.ebay.com/itm/Mens-Genuine-Real-Leather-Bifold-Wallet-Credit-ID-Card-Photo-Holder-Bag-Purse-/350803619906?pt=Wallet&hash=item51ad867042'),
(1447, 1567, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWestern-Mens-Leather-Bifold-Wallet-Purse-Credit-Card-Clip-Photo-Slots-Passcase-%2F190829208026%3Fpt%3DWallet%26hash%3Ditem2c6e4ea1da', 'product', 2, 'http://www.ebay.com/itm/Western-Mens-Leather-Bifold-Wallet-Purse-Credit-Card-Clip-Photo-Slots-Passcase-/190829208026?pt=Wallet&hash=item2c6e4ea1da'),
(1448, 1568, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FReal-Leather-Mens-Bifold-Credit-Card-Photo-Slots-Clip-Long-Wallet-Purse-Passcase-%2F181128001131%3Fpt%3DUK_Purses_Wallets%26var%3D%26hash%3Ditem2a2c11f66b', 'product', 2, 'http://www.ebay.com/itm/Real-Leather-Mens-Bifold-Credit-Card-Photo-Slots-Clip-Long-Wallet-Purse-Passcase-/181128001131?pt=UK_Purses_Wallets&var=&hash=item2a2c11f66b'),
(1449, 1569, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMen-Leather-Plaid-Bifold-Soft-Wallet-Purse-Credit-Card-Clip-Photo-Slots-Passcase-%2F350776992622%3Fpt%3DWallet%26hash%3Ditem51abf0236e', 'product', 2, 'http://www.ebay.com/itm/Men-Leather-Plaid-Bifold-Soft-Wallet-Purse-Credit-Card-Clip-Photo-Slots-Passcase-/350776992622?pt=Wallet&hash=item51abf0236e'),
(1450, 1570, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Men-Soft-Leather-Plaid-Bifold-Long-Wallet-Purse-Credit-Card-Clip-Photo-Slots-%2F350777042231%3Fpt%3DWallet%26hash%3Ditem51abf0e537', 'product', 2, 'http://www.ebay.com/itm/New-Men-Soft-Leather-Plaid-Bifold-Long-Wallet-Purse-Credit-Card-Clip-Photo-Slots-/350777042231?pt=Wallet&hash=item51abf0e537');
INSERT INTO `parsemx_entities` (`entity_id`, `platform_id`, `ins_id`, `donor_id`, `url`, `entity`, `status`, `ourl`) VALUES
(1451, 1571, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Cowboyl-Mens-Genuine-Leather-Bifold-Wallet-Multi-Pocket-Purse-Passcase-%2F190656414643%3Fpt%3DWallet%26hash%3Ditem2c640203b3', 'product', 2, 'http://www.ebay.com/itm/New-Cowboyl-Mens-Genuine-Leather-Bifold-Wallet-Multi-Pocket-Purse-Passcase-/190656414643?pt=Wallet&hash=item2c640203b3'),
(1452, 1572, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Genuine-Leather-Triple-Fold-Wallet-Multi-Pocket-ID-Creditcard-Card-Purse-%2F190702548664%3Fpt%3DWallet%26hash%3Ditem2c66c1f6b8', 'product', 2, 'http://www.ebay.com/itm/Mens-Genuine-Leather-Triple-Fold-Wallet-Multi-Pocket-ID-Creditcard-Card-Purse-/190702548664?pt=Wallet&hash=item2c66c1f6b8'),
(1453, 1573, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Mens-Casual-Shoulder-Bags-handbags-Crossbody-sports-Gym-Travel-Purse-%2F190718013165%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem2c67adeeed', 'product', 2, 'http://www.ebay.com/itm/Fashion-Mens-Casual-Shoulder-Bags-handbags-Crossbody-sports-Gym-Travel-Purse-/190718013165?pt=US_CSA_MWA_Backpacks&var=&hash=item2c67adeeed'),
(1454, 1574, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Men-Real-Leather-Pouch-Phone-Pocket-Purse-Wallet-Belt-Fanny-Waist-Pack-Bag-%2F190829180731%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem2c6e4e373b', 'product', 2, 'http://www.ebay.com/itm/Retro-Men-Real-Leather-Pouch-Phone-Pocket-Purse-Wallet-Belt-Fanny-Waist-Pack-Bag-/190829180731?pt=US_CSA_MWA_Backpacks&var=&hash=item2c6e4e373b'),
(1455, 1575, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Mens-Canvas-Casual-Shoulder-Book-Bag-Schoolbag-Messenger-Crossbody-Hangbag-%2F190846726762%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem2c6f59f26a', 'product', 2, 'http://www.ebay.com/itm/Retro-Mens-Canvas-Casual-Shoulder-Book-Bag-Schoolbag-Messenger-Crossbody-Hangbag-/190846726762?pt=US_CSA_MWA_Backpacks&var=&hash=item2c6f59f26a'),
(1456, 1576, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Leather-Clutch-Handbag-Wallet-Casual-Business-Briefcase-Organizer-Purse-%2F181136406065%3Fpt%3DWallet%26var%3D%26hash%3Ditem2a2c923631', 'product', 2, 'http://www.ebay.com/itm/Mens-Leather-Clutch-Handbag-Wallet-Casual-Business-Briefcase-Organizer-Purse-/181136406065?pt=Wallet&var=&hash=item2a2c923631'),
(1457, 1577, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Canvas-Satchel-Schoolbag-Shoulder-Bag-Totes-Purse-Bookbag-%2F170700021261%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem27be839e0d', 'product', 2, 'http://www.ebay.com/itm/Mens-Canvas-Satchel-Schoolbag-Shoulder-Bag-Totes-Purse-Bookbag-/170700021261?pt=US_CSA_MWA_Backpacks&var=&hash=item27be839e0d'),
(1458, 1578, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Men-Canvas-Messenger-Crossbody-Travel-Outdoor-Sports-Book-Shoulder-Bag-Purse-%2F350803610890%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem51ad864d0a', 'product', 2, 'http://www.ebay.com/itm/New-Men-Canvas-Messenger-Crossbody-Travel-Outdoor-Sports-Book-Shoulder-Bag-Purse-/350803610890?pt=US_CSA_MWA_Backpacks&var=&hash=item51ad864d0a'),
(1459, 1579, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCool-Mens-Faux-Leather-Messenager-Briefcase-Shoulder-Bag-Authentic-Casual-purse-%2F180927780916%3Fpt%3DUS_CSA_MWA_Backpacks%26hash%3Ditem2a2022d834', 'product', 2, 'http://www.ebay.com/itm/Cool-Mens-Faux-Leather-Messenager-Briefcase-Shoulder-Bag-Authentic-Casual-purse-/180927780916?pt=US_CSA_MWA_Backpacks&hash=item2a2022d834'),
(1460, 1580, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLarge-Faux-Leather-Mens-Duffle-Sports-Shoulder-GYM-Schoolbag-Casual-Bag-travel-%2F180927770838%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem2a2022b0d6', 'product', 2, 'http://www.ebay.com/itm/Large-Faux-Leather-Mens-Duffle-Sports-Shoulder-GYM-Schoolbag-Casual-Bag-travel-/180927770838?pt=US_CSA_MWA_Backpacks&var=&hash=item2a2022b0d6'),
(1461, 1581, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-PU-Leather-Kangaroo-Print-Messenger-Briefcases-Tablet-Laptop-Shoulder-Bag-%2F190846721956%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem2c6f59dfa4', 'product', 2, 'http://www.ebay.com/itm/Mens-PU-Leather-Kangaroo-Print-Messenger-Briefcases-Tablet-Laptop-Shoulder-Bag-/190846721956?pt=US_CSA_MWA_Backpacks&var=&hash=item2c6f59dfa4'),
(1462, 1582, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Kangaroo-Mens-Leather-Shoulder-Messenger-Bag-Briefcase-Casual-Career-Bags-%2F180936528362%3Fpt%3DUK_Men_s_Bags%26var%3D%26hash%3Ditem2a20a851ea', 'product', 2, 'http://www.ebay.com/itm/New-Kangaroo-Mens-Leather-Shoulder-Messenger-Bag-Briefcase-Casual-Career-Bags-/180936528362?pt=UK_Men_s_Bags&var=&hash=item2a20a851ea'),
(1463, 1583, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FMens-Large-Faux-Leather-Duffle-Sports-Shoulder-GYM-Schoolbag-Casual-travel-Bags-%2F170884953171%3Fpt%3DUK_Men_s_Bags%26var%3D%26hash%3Ditem27c9897453', 'product', 2, 'http://www.ebay.com/itm/Mens-Large-Faux-Leather-Duffle-Sports-Shoulder-GYM-Schoolbag-Casual-travel-Bags-/170884953171?pt=UK_Men_s_Bags&var=&hash=item27c9897453'),
(1464, 1584, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHigh-Quality-Large-Mens-Leather-Shoulder-Messenger-Briefcase-Bag-%2F180729063951%3Fpt%3DUS_CSA_MWA_Backpacks%26var%3D%26hash%3Ditem2a144aaa0f', 'product', 2, 'http://www.ebay.com/itm/High-Quality-Large-Mens-Leather-Shoulder-Messenger-Briefcase-Bag-/180729063951?pt=US_CSA_MWA_Backpacks&var=&hash=item2a144aaa0f'),
(1465, 1585, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Girl-Vintage-Narrow-Waistband-PU-Leather-Skinny-Waist-Belt-9-Color-%2F181270276733%3Fpt%3DUS_Women_s_Belts%26var%3D%26hash%3Ditem2a348cea7d', 'product', 1, 'http://www.ebay.com/itm/Fashion-Women-Girl-Vintage-Narrow-Waistband-PU-Leather-Skinny-Waist-Belt-9-Color-/181270276733?pt=US_Women_s_Belts&var=&hash=item2a348cea7d'),
(1466, 1586, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Women-Elegant-Olive-Leaf-Headband-Hairpin-Headwear-Headdress-Hair-Clips-%2F181178515566%3Fpt%3DUS_Hair_Accessories%26var%3D%26hash%3Ditem2a2f14c06e', 'product', 1, 'http://www.ebay.com/itm/Korean-Women-Elegant-Olive-Leaf-Headband-Hairpin-Headwear-Headdress-Hair-Clips-/181178515566?pt=US_Hair_Accessories&var=&hash=item2a2f14c06e'),
(1467, 1587, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHOT-Women-Metallic-Gold-Elastic-Hollow-Out-Headwear-Headband-Hairband-Headdress-%2F181181802002%3Fpt%3DUS_Hair_Accessories%26hash%3Ditem2a2f46e612', 'product', 1, 'http://www.ebay.com/itm/HOT-Women-Metallic-Gold-Elastic-Hollow-Out-Headwear-Headband-Hairband-Headdress-/181181802002?pt=US_Hair_Accessories&hash=item2a2f46e612'),
(1468, 1588, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Semi-Transparent-Round-Retro-inspired-Women-Butterfly-Arms-Sunglasses-%2F190872274649%3Fpt%3DUS_Sunglasses%26var%3D%26hash%3Ditem2c70dfc6d9', 'product', 1, 'http://www.ebay.com/itm/Fashion-Semi-Transparent-Round-Retro-inspired-Women-Butterfly-Arms-Sunglasses-/190872274649?pt=US_Sunglasses&var=&hash=item2c70dfc6d9'),
(1469, 1589, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Womens-Narrow-Vintage-Waistband-Lady-PU-Leather-Slim-Skinny-Waist-Belt-%2F180931941298%3Fpt%3DUS_Women_s_Belts%26var%3D%26hash%3Ditem2a206253b2', 'product', 1, 'http://www.ebay.com/itm/Fashion-Womens-Narrow-Vintage-Waistband-Lady-PU-Leather-Slim-Skinny-Waist-Belt-/180931941298?pt=US_Women_s_Belts&var=&hash=item2a206253b2'),
(1470, 1590, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FGREEN-TRAVEL-BAG-POUCH-PASSPORT-ID-CARD-HOLDER-CASE-HANDY-%2F180748474207%3Fpt%3DUS_Women_s_Accessories%26hash%3Ditem2a1572d75f', 'product', 1, 'http://www.ebay.com/itm/GREEN-TRAVEL-BAG-POUCH-PASSPORT-ID-CARD-HOLDER-CASE-HANDY-/180748474207?pt=US_Women_s_Accessories&hash=item2a1572d75f'),
(1471, 1591, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Men-Leather-Buckle-Wallet-Purse-Clutch-Coin-Credit-ID-Card-Photo-Holder-%2F181129374355%3Fpt%3DWallet%26var%3D%26hash%3Ditem2a2c26ea93', 'product', 1, 'http://www.ebay.com/itm/Women-Men-Leather-Buckle-Wallet-Purse-Clutch-Coin-Credit-ID-Card-Photo-Holder-/181129374355?pt=Wallet&var=&hash=item2a2c26ea93'),
(1472, 1592, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FLovely-Women-Girls-Faux-Fur-Suede-Elastic-Half-Finger-Gloves-Warm-Plush-Winter-%2F181150531091%3Fpt%3DUS_CSA_MWA_Gloves_Mittens%26var%3D%26hash%3Ditem2a2d69be13', 'product', 1, 'http://www.ebay.com/itm/Lovely-Women-Girls-Faux-Fur-Suede-Elastic-Half-Finger-Gloves-Warm-Plush-Winter-/181150531091?pt=US_CSA_MWA_Gloves_Mittens&var=&hash=item2a2d69be13'),
(1473, 1593, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-Celebrity-Women-Lady-Vintage-Cool-Shades-Round-Sunglasses-Eyewear-Free-Case-%2F190874513058%3Fpt%3DUS_Sunglasses%26var%3D%26hash%3Ditem2c7101eea2', 'product', 1, 'http://www.ebay.com/itm/2013-Celebrity-Women-Lady-Vintage-Cool-Shades-Round-Sunglasses-Eyewear-Free-Case-/190874513058?pt=US_Sunglasses&var=&hash=item2c7101eea2'),
(1474, 1594, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Men-Leather-Buckle-Wallet-Purse-Clutch-Coin-Credit-ID-Card-Photo-Holder-%2F181129375085%3Fpt%3DUK_Purses_Wallets%26var%3D%26hash%3Ditem2a2c26ed6d', 'product', 1, 'http://www.ebay.com/itm/Women-Men-Leather-Buckle-Wallet-Purse-Clutch-Coin-Credit-ID-Card-Photo-Holder-/181129375085?pt=UK_Purses_Wallets&var=&hash=item2a2c26ed6d'),
(1475, 1595, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FElegant-Women-Vintage-Flower-Bow-Headband-Hairband-Headdress-Hair-Clips-Hairpin-%2F190874520447%3Fpt%3DUS_Hair_Accessories%26hash%3Ditem2c71020b7f', 'product', 1, 'http://www.ebay.com/itm/Elegant-Women-Vintage-Flower-Bow-Headband-Hairband-Headdress-Hair-Clips-Hairpin-/190874520447?pt=US_Hair_Accessories&hash=item2c71020b7f'),
(1476, 1596, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Fashion-Men-Women-Classic-Retro-Wayfarer-Aviator-Square-Sunglasses-Free-Case-%2F350840010142%3Fpt%3DUS_Sunglasses%26var%3D%26hash%3Ditem51afb1b59e', 'product', 1, 'http://www.ebay.com/itm/Hot-Fashion-Men-Women-Classic-Retro-Wayfarer-Aviator-Square-Sunglasses-Free-Case-/350840010142?pt=US_Sunglasses&var=&hash=item51afb1b59e'),
(1477, 1597, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Shopping-Eyewear-Wayfarer-Outdoor-Women-Men-Toad-Sunglasses-Free-Case-%2F350839996433%3Fpt%3DUS_Sunglasses%26var%3D%26hash%3Ditem51afb18011', 'product', 1, 'http://www.ebay.com/itm/Fashion-Shopping-Eyewear-Wayfarer-Outdoor-Women-Men-Toad-Sunglasses-Free-Case-/350839996433?pt=US_Sunglasses&var=&hash=item51afb18011'),
(1478, 1598, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-Real-Leather-Clutch-Wallet-ID-Card-Photo-Coins-Holder-Bag-Pocket-Purse-%2F181136431849%3Fpt%3DWallet%26var%3D%26hash%3Ditem2a2c929ae9', 'product', 1, 'http://www.ebay.com/itm/New-Women-Real-Leather-Clutch-Wallet-ID-Card-Photo-Coins-Holder-Bag-Pocket-Purse-/181136431849?pt=Wallet&var=&hash=item2a2c929ae9'),
(1479, 1599, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Accessories-Womens-Wide-waistband-BowKnot-Bond-Slim-Waist-Belt-6-Colors-%2F180930039719%3Fpt%3DUS_Women_s_Belts%26var%3D%26hash%3Ditem2a20454fa7', 'product', 1, 'http://www.ebay.com/itm/Fashion-Accessories-Womens-Wide-waistband-BowKnot-Bond-Slim-Waist-Belt-6-Colors-/180930039719?pt=US_Women_s_Belts&var=&hash=item2a20454fa7'),
(1480, 1600, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCool-Men-Women-Unisex-Double-Stripe-Frame-Top-Flat-Sunglasses-Eyewear-Free-Case-%2F190874500363%3Fpt%3DUS_Sunglasses%26var%3D%26hash%3Ditem2c7101bd0b', 'product', 1, 'http://www.ebay.com/itm/Cool-Men-Women-Unisex-Double-Stripe-Frame-Top-Flat-Sunglasses-Eyewear-Free-Case-/190874500363?pt=US_Sunglasses&var=&hash=item2c7101bd0b'),
(1481, 1601, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FDesigner-Men-Women-Lovers-Retro-Large-Frame-Wayfarer-Square-Sunglasses-Free-Case-%2F350840014999%3Fpt%3DUS_Sunglasses%26var%3D%26hash%3Ditem51afb1c897', 'product', 1, 'http://www.ebay.com/itm/Designer-Men-Women-Lovers-Retro-Large-Frame-Wayfarer-Square-Sunglasses-Free-Case-/350840014999?pt=US_Sunglasses&var=&hash=item51afb1c897'),
(1482, 1602, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Leather-Buckle-Wallet-Purse-Clutch-Photos-Coin-Credit-ID-Card-Case-Holder-%2F181129382672%3Fpt%3DWallet%26var%3D%26hash%3Ditem2a2c270b10', 'product', 1, 'http://www.ebay.com/itm/Womens-Leather-Buckle-Wallet-Purse-Clutch-Photos-Coin-Credit-ID-Card-Case-Holder-/181129382672?pt=Wallet&var=&hash=item2a2c270b10'),
(1483, 1603, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Leather-Wallet-Clutch-ID-Card-Photo-Coins-Holder-Bag-Pocket-Purse-Pouch-%2F190836408355%3Fpt%3DWallet%26var%3D%26hash%3Ditem2c6ebc8023', 'product', 1, 'http://www.ebay.com/itm/Womens-Leather-Wallet-Clutch-ID-Card-Photo-Coins-Holder-Bag-Pocket-Purse-Pouch-/190836408355?pt=Wallet&var=&hash=item2c6ebc8023'),
(1484, 1604, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Punk-Style-Owl-Shape-Metal-Floral-Beads-Bracelet-Ladies-Valentines-Gift-%2F170881318544%3Fpt%3DUS_Women_s_Accessories%26var%3D%26hash%3Ditem27c951fe90', 'product', 1, 'http://www.ebay.com/itm/Hot-Punk-Style-Owl-Shape-Metal-Floral-Beads-Bracelet-Ladies-Valentines-Gift-/170881318544?pt=US_Women_s_Accessories&var=&hash=item27c951fe90'),
(1485, 1605, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Men-Women-Designer-Retro-Reflective-Skull-Sunglasses-Eyewear-Free-Case-%2F181181769946%3Fpt%3DUS_Sunglasses%26var%3D%26hash%3Ditem2a2f4668da', 'product', 1, 'http://www.ebay.com/itm/Fashion-Men-Women-Designer-Retro-Reflective-Skull-Sunglasses-Eyewear-Free-Case-/181181769946?pt=US_Sunglasses&var=&hash=item2a2f4668da'),
(1486, 1606, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Women-Knit-Stitch-Elastic-Stretchy-Hasp-Wide-Dress-Cinch-Waist-Belt-Corset-%2F190850380612%3Fpt%3DUS_Women_s_Belts%26var%3D%26hash%3Ditem2c6f91b344', 'product', 1, 'http://www.ebay.com/itm/Retro-Women-Knit-Stitch-Elastic-Stretchy-Hasp-Wide-Dress-Cinch-Waist-Belt-Corset-/190850380612?pt=US_Women_s_Belts&var=&hash=item2c6f91b344'),
(1487, 1607, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Lady-Causal-Clutch-Cosmetic-Bag-Wallet-Magnet-Buckle-CoinPurse-Evening-Party-%2F190801900398%3Fpt%3DUK_Purses_Wallets%26var%3D%26hash%3Ditem2c6cadf36e', 'product', 1, 'http://www.ebay.com/itm/New-Lady-Causal-Clutch-Cosmetic-Bag-Wallet-Magnet-Buckle-CoinPurse-Evening-Party-/190801900398?pt=UK_Purses_Wallets&var=&hash=item2c6cadf36e'),
(1488, 1608, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Girl-PU-Leather-Stitch-Strech-Elastic-Wide-Waist-Cinch-Belt-Corset-%2F181270275321%3Fpt%3DUS_Women_s_Belts%26var%3D%26hash%3Ditem2a348ce4f9', 'product', 1, 'http://www.ebay.com/itm/Fashion-Women-Girl-PU-Leather-Stitch-Strech-Elastic-Wide-Waist-Cinch-Belt-Corset-/181270275321?pt=US_Women_s_Belts&var=&hash=item2a348ce4f9'),
(1489, 1609, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FEnvelope-Wallet-Purse-Phone-Case-Samsung-Galaxy-S2-S3-S4-iPhone-4-4S-5-5S-%2F190938492050%3Fpt%3DWallet%26var%3D%26hash%3Ditem2c74d22c92', 'product', 1, 'http://www.ebay.com/itm/Envelope-Wallet-Purse-Phone-Case-Samsung-Galaxy-S2-S3-S4-iPhone-4-4S-5-5S-/190938492050?pt=Wallet&var=&hash=item2c74d22c92'),
(1490, 1610, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Lady-Removable-Faux-Pearl-Beads-Sequin-Peter-Pan-Neck-Collar-Necklace-Choker-%2F181152097144%3Fpt%3DUS_Women_s_Accessories%26hash%3Ditem2a2d81a378', 'product', 1, 'http://www.ebay.com/itm/New-Lady-Removable-Faux-Pearl-Beads-Sequin-Peter-Pan-Neck-Collar-Necklace-Choker-/181152097144?pt=US_Women_s_Accessories&hash=item2a2d81a378'),
(1491, 1611, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHOT-Wallet-Clutch-Handbag-Phone-Case-for-Galaxy-S2-S3-S4-iPhone-4S-5-5S-12-Color-%2F181243422724%3Fpt%3DWallet%26var%3D%26hash%3Ditem2a32f32804', 'product', 1, 'http://www.ebay.com/itm/HOT-Wallet-Clutch-Handbag-Phone-Case-for-Galaxy-S2-S3-S4-iPhone-4S-5-5S-12-Color-/181243422724?pt=Wallet&var=&hash=item2a32f32804'),
(1492, 1612, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWestern-Women-PU-Leather-Buckle-Wide-Belt-Slim-Waist-Dress-Waistband-Length-74cm-%2F350807746067%3Fpt%3DUS_Women_s_Belts%26var%3D%26hash%3Ditem51adc56613', 'product', 1, 'http://www.ebay.com/itm/Western-Women-PU-Leather-Buckle-Wide-Belt-Slim-Waist-Dress-Waistband-Length-74cm-/350807746067?pt=US_Women_s_Belts&var=&hash=item51adc56613'),
(1493, 1613, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCharming-Women-Chiffon-Layers-Floral-Wide-Brim-Elastic-Strap-Sun-Hats-Beach-Caps-%2F181172225684%3Fpt%3DUS_Hats%26var%3D%26hash%3Ditem2a2eb4c694', 'product', 1, 'http://www.ebay.com/itm/Charming-Women-Chiffon-Layers-Floral-Wide-Brim-Elastic-Strap-Sun-Hats-Beach-Caps-/181172225684?pt=US_Hats&var=&hash=item2a2eb4c694'),
(1494, 1614, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Lady-PU-Leather-Tri-Fold-Small-Wallet-Clutch-Bag-Credit-Coin-Photo-Purse-%2F350825515889%3Fpt%3DWallet%26var%3D%26hash%3Ditem51aed48b71', 'product', 1, 'http://www.ebay.com/itm/Women-Lady-PU-Leather-Tri-Fold-Small-Wallet-Clutch-Bag-Credit-Coin-Photo-Purse-/350825515889?pt=Wallet&var=&hash=item51aed48b71'),
(1495, 1615, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Unisex-Women-Men-Leather-Brim-Flat-Sailor-Army-Military-Cadet-Cap-Sun-Hat-%2F190882311024%3Fpt%3DUS_Hats%26var%3D%26hash%3Ditem2c7178eb70', 'product', 1, 'http://www.ebay.com/itm/Retro-Unisex-Women-Men-Leather-Brim-Flat-Sailor-Army-Military-Cadet-Cap-Sun-Hat-/190882311024?pt=US_Hats&var=&hash=item2c7178eb70'),
(1496, 1616, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F2013-Womens-Summer-Beach-Big-Brim-Velcro-Top-Removable-Canvas-Sun-hat-Peak-Caps-%2F190867256757%3Fpt%3DUS_Hats%26var%3D%26hash%3Ditem2c709335b5', 'product', 1, 'http://www.ebay.com/itm/2013-Womens-Summer-Beach-Big-Brim-Velcro-Top-Removable-Canvas-Sun-hat-Peak-Caps-/190867256757?pt=US_Hats&var=&hash=item2c709335b5'),
(1497, 1617, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRetro-Womens-Wide-Belt-waistband-Lady-3-Row-Hasp-PU-Leather-Slim-Waist-4-Colors-%2F180931938214%3Fpt%3DUS_Women_s_Belts%26var%3D%26hash%3Ditem2a206247a6', 'product', 1, 'http://www.ebay.com/itm/Retro-Womens-Wide-Belt-waistband-Lady-3-Row-Hasp-PU-Leather-Slim-Waist-4-Colors-/180931938214?pt=US_Women_s_Belts&var=&hash=item2a206247a6'),
(1498, 1618, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FHot-Fashion-design-Womens-Hollow-Floral-Wide-Slim-waistband-Ladies-Skinny-Belts-%2F190699985323%3Fpt%3DUS_Women_s_Belts%26var%3D%26hash%3Ditem2c669ad9ab', 'product', 1, 'http://www.ebay.com/itm/Hot-Fashion-design-Womens-Hollow-Floral-Wide-Slim-waistband-Ladies-Skinny-Belts-/190699985323?pt=US_Women_s_Belts&var=&hash=item2c669ad9ab'),
(1499, 1619, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Wallet-Clutch-Long-Handbag-Phone-Case-for-Galaxy-S2-S3-S4-iPhone-4S-5-HTC-%2F350893159917%3Fpt%3DWallet%26var%3D%26hash%3Ditem51b2dcb5ed', 'product', 1, 'http://www.ebay.com/itm/Women-Wallet-Clutch-Long-Handbag-Phone-Case-for-Galaxy-S2-S3-S4-iPhone-4S-5-HTC-/350893159917?pt=Wallet&var=&hash=item51b2dcb5ed'),
(1500, 1620, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Vintage-Punk-Spike-Studs-Rivets-Removable-Necklace-Choker-Collar-%2F350807733629%3Fpt%3DUS_Women_s_Accessories%26var%3D%26hash%3Ditem51adc5357d', 'product', 1, 'http://www.ebay.com/itm/Fashion-Women-Vintage-Punk-Spike-Studs-Rivets-Removable-Necklace-Choker-Collar-/350807733629?pt=US_Women_s_Accessories&var=&hash=item51adc5357d'),
(1501, 1621, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Lady-Causal-Clutch-Cosmetic-Bag-Wallet-Magnet-Buckle-CoinPurse-Evening-Party-%2F181086564447%3Fpt%3DWallet%26var%3D%26hash%3Ditem2a2999b05f', 'product', 1, 'http://www.ebay.com/itm/New-Lady-Causal-Clutch-Cosmetic-Bag-Wallet-Magnet-Buckle-CoinPurse-Evening-Party-/181086564447?pt=Wallet&var=&hash=item2a2999b05f'),
(1502, 1622, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Women-Men-Classic-Party-Wool-Bowler-Felt-Fedora-Derby-Hats-Roll-Up-Caps-%2F350829754032%3Fpt%3DUS_Hats%26var%3D%26hash%3Ditem51af1536b0', 'product', 1, 'http://www.ebay.com/itm/Vintage-Women-Men-Classic-Party-Wool-Bowler-Felt-Fedora-Derby-Hats-Roll-Up-Caps-/350829754032?pt=US_Hats&var=&hash=item51af1536b0'),
(1503, 1623, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FCelebrity-Womens-Metal-Mirror-Wide-Strap-Belt-Corset-Slim-Waistband-8-Colors-6CM-%2F350801119015%3Fpt%3DUS_Women_s_Belts%26var%3D%26hash%3Ditem51ad604727', 'product', 1, 'http://www.ebay.com/itm/Celebrity-Womens-Metal-Mirror-Wide-Strap-Belt-Corset-Slim-Waistband-8-Colors-6CM-/350801119015?pt=US_Women_s_Belts&var=&hash=item51ad604727'),
(1504, 1624, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FRemovable-Women-Vintage-Dress-Faux-Pearl-Beads-Embellished-Neck-Collar-Necklace-%2F170872570294%3Fpt%3DUS_Women_s_Accessories%26hash%3Ditem27c8cc81b6', 'product', 1, 'http://www.ebay.com/itm/Removable-Women-Vintage-Dress-Faux-Pearl-Beads-Embellished-Neck-Collar-Necklace-/170872570294?pt=US_Women_s_Accessories&hash=item27c8cc81b6'),
(1505, 1625, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Retro-Buckle-Synthetic-Leather-purse-Clutch-Evening-handbag-Wallet-%2F190782251668%3Fpt%3DWallet%26var%3D%26hash%3Ditem2c6b822294', 'product', 1, 'http://www.ebay.com/itm/Fashion-Women-Retro-Buckle-Synthetic-Leather-purse-Clutch-Evening-handbag-Wallet-/190782251668?pt=Wallet&var=&hash=item2c6b822294'),
(1506, 1626, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Accessory-Metal-Mirror-Wide-Strap-Belt-Corsset-Slim-Waist-Band-8-Colors-%2F170872567646%3Fpt%3DUS_Women_s_Belts%26var%3D%26hash%3Ditem27c8cc775e', 'product', 1, 'http://www.ebay.com/itm/Women-Accessory-Metal-Mirror-Wide-Strap-Belt-Corsset-Slim-Waist-Band-8-Colors-/170872567646?pt=US_Women_s_Belts&var=&hash=item27c8cc775e'),
(1507, 1627, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Girl-Floppy-Derby-Hat-Wide-Large-Brim-Summer-Beach-Straw-Sun-Hat-%2F190881417935%3Fpt%3DUS_Hats%26var%3D%26hash%3Ditem2c716b4acf', 'product', 1, 'http://www.ebay.com/itm/Fashion-Women-Girl-Floppy-Derby-Hat-Wide-Large-Brim-Summer-Beach-Straw-Sun-Hat-/190881417935?pt=US_Hats&var=&hash=item2c716b4acf'),
(1508, 1628, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Leather-Key-Bag-Keychain-Coins-Holder-Clutch-Wallet-Purse-With-Wrist-Strap-%2F190836414463%3Fpt%3DWallet%26var%3D%26hash%3Ditem2c6ebc97ff', 'product', 1, 'http://www.ebay.com/itm/Women-Leather-Key-Bag-Keychain-Coins-Holder-Clutch-Wallet-Purse-With-Wrist-Strap-/190836414463?pt=Wallet&var=&hash=item2c6ebc97ff'),
(1509, 1629, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Women-Cute-Faux-Peals-Peter-Pan-Collar-Detachable-Necklace-Sweater-Dress-%2F181152116643%3Fpt%3DUS_Women_s_Accessories%26var%3D%26hash%3Ditem2a2d81efa3', 'product', 1, 'http://www.ebay.com/itm/Vintage-Women-Cute-Faux-Peals-Peter-Pan-Collar-Detachable-Necklace-Sweater-Dress-/181152116643?pt=US_Women_s_Accessories&var=&hash=item2a2d81efa3'),
(1510, 1630, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Womens-Organizer-Long-Wallets-Bifold-Buckle-Credicard-Photo-Holder-Purses-%2F180976513715%3Fpt%3DUK_Purses_Wallets%26var%3D%26hash%3Ditem2a230a72b3', 'product', 1, 'http://www.ebay.com/itm/Korean-Womens-Organizer-Long-Wallets-Bifold-Buckle-Credicard-Photo-Holder-Purses-/180976513715?pt=UK_Purses_Wallets&var=&hash=item2a230a72b3'),
(1511, 1631, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FFashion-Women-Rivet-Bifold-Wallet-Clutch-Coins-Keys-Phone-Credit-Card-Bags-Purse-%2F181146929270%3Fpt%3DWallet%26var%3D%26hash%3Ditem2a2d32c876', 'product', 1, 'http://www.ebay.com/itm/Fashion-Women-Rivet-Bifold-Wallet-Clutch-Coins-Keys-Phone-Credit-Card-Bags-Purse-/181146929270?pt=Wallet&var=&hash=item2a2d32c876'),
(1512, 1632, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Celebrity-Shiny-Girdle-Tassel-Metallic-Snakeskin-Slim-Belts-Wide-Waistband-%2F181152108674%3Fpt%3DUS_Women_s_Belts%26var%3D%26hash%3Ditem2a2d81d082', 'product', 1, 'http://www.ebay.com/itm/Women-Celebrity-Shiny-Girdle-Tassel-Metallic-Snakeskin-Slim-Belts-Wide-Waistband-/181152108674?pt=US_Women_s_Belts&var=&hash=item2a2d81d082'),
(1513, 1633, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Women-PU-Leather-Bifold-Buckle-Long-Wallet-Clutch-Credit-Card-Purse-Handbag-%2F181168178670%3Fpt%3DWallet%26var%3D%26hash%3Ditem2a2e7705ee', 'product', 1, 'http://www.ebay.com/itm/New-Women-PU-Leather-Bifold-Buckle-Long-Wallet-Clutch-Credit-Card-Purse-Handbag-/181168178670?pt=Wallet&var=&hash=item2a2e7705ee'),
(1514, 1634, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FKorean-Womens-Organizer-Long-Wallets-Bifold-Buckle-Credicard-Photo-Holder-Purses-%2F190728019757%3Fpt%3DWallet%26var%3D%26hash%3Ditem2c68469f2d', 'product', 1, 'http://www.ebay.com/itm/Korean-Womens-Organizer-Long-Wallets-Bifold-Buckle-Credicard-Photo-Holder-Purses-/190728019757?pt=Wallet&var=&hash=item2c68469f2d'),
(1515, 1635, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2F6-Colors-Fashion-Women-PU-Leather-Clutch-Purse-handbag-Eveningbag-Wallet-%2F181059701518%3Fpt%3DWallet%26var%3D%26hash%3Ditem2a27ffcb0e', 'product', 1, 'http://www.ebay.com/itm/6-Colors-Fashion-Women-PU-Leather-Clutch-Purse-handbag-Eveningbag-Wallet-/181059701518?pt=Wallet&var=&hash=item2a27ffcb0e'),
(1516, 1636, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-OL-Ladies-Retro-Floral-Credit-Cards-Bag-Purse-Clutch-Wallet-Formal-Party-%2F190843552679%3Fpt%3DWallet%26hash%3Ditem2c6f2983a7', 'product', 1, 'http://www.ebay.com/itm/Womens-OL-Ladies-Retro-Floral-Credit-Cards-Bag-Purse-Clutch-Wallet-Formal-Party-/190843552679?pt=Wallet&hash=item2c6f2983a7'),
(1517, 1637, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Womens-Leather-Zip-Wallet-Purse-Clips-Clutch-Coin-Card-Phone-Pouch-Party-Bag-%2F350778688655%3Fpt%3DUK_Purses_Wallets%26var%3D%26hash%3Ditem51ac0a048f', 'product', 1, 'http://www.ebay.com/itm/New-Womens-Leather-Zip-Wallet-Purse-Clips-Clutch-Coin-Card-Phone-Pouch-Party-Bag-/350778688655?pt=UK_Purses_Wallets&var=&hash=item51ac0a048f'),
(1518, 1638, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FNew-Womens-Leather-Zip-Wallet-Purse-Clips-Clutch-Coin-Card-Phone-Pouch-Party-Bag-%2F350778687026%3Fpt%3DWallet%26var%3D%26hash%3Ditem51ac09fe32', 'product', 1, 'http://www.ebay.com/itm/New-Womens-Leather-Zip-Wallet-Purse-Clips-Clutch-Coin-Card-Phone-Pouch-Party-Bag-/350778687026?pt=Wallet&var=&hash=item51ac09fe32'),
(1519, 1639, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FVintage-Girls-Accessory-Retro-Faux-Pearl-Gold-Beads-Sequin-Pete-Pan-Neck-Collar-%2F170899477356%3Fpt%3DUK_Charms_Wristbands%26hash%3Ditem27ca67136c', 'product', 1, 'http://www.ebay.com/itm/Vintage-Girls-Accessory-Retro-Faux-Pearl-Gold-Beads-Sequin-Pete-Pan-Neck-Collar-/170899477356?pt=UK_Charms_Wristbands&hash=item27ca67136c'),
(1520, 1640, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomen-Leather-Zip-Around-Wallet-Purse-Clutch-Coin-Card-Phone-Pouch-Party-Handbag-%2F190830101630%3Fpt%3DWallet%26var%3D%26hash%3Ditem2c6e5c447e', 'product', 1, 'http://www.ebay.com/itm/Women-Leather-Zip-Around-Wallet-Purse-Clutch-Coin-Card-Phone-Pouch-Party-Handbag-/190830101630?pt=Wallet&var=&hash=item2c6e5c447e'),
(1521, 1641, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Shinning-Leather-Long-Bifold-Wallet-Purse-Clips-Clutch-Party-Evening-Gift-%2F181129331577%3Fpt%3DUK_Purses_Wallets%26var%3D%26hash%3Ditem2a2c264379', 'product', 1, 'http://www.ebay.com/itm/Womens-Shinning-Leather-Long-Bifold-Wallet-Purse-Clips-Clutch-Party-Evening-Gift-/181129331577?pt=UK_Purses_Wallets&var=&hash=item2a2c264379'),
(1522, 1642, 3, 3, 'http%3A%2F%2Fwww.ebay.com%2Fitm%2FWomens-Shinning-Leather-Long-Bifold-Wallet-Purse-Clips-Clutch-Party-Evening-Gift-%2F181129330358%3Fpt%3DWallet%26var%3D%26hash%3Ditem2a2c263eb6', 'product', 1, 'http://www.ebay.com/itm/Womens-Shinning-Leather-Long-Bifold-Wallet-Purse-Clips-Clutch-Party-Evening-Gift-/181129330358?pt=Wallet&var=&hash=item2a2c263eb6'),
(1641, 1779, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31440704-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p31440704-stilnaya-molodezhnaya-kurtka.html'),
(1642, 1780, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp21961046-stilnoe-osennee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p21961046-stilnoe-osennee-plate.html'),
(1643, 1781, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31440460-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p31440460-stilnaya-molodezhnaya-kurtka.html'),
(1644, 1782, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22118536-stilnoe-osennee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p22118536-stilnoe-osennee-plate.html'),
(1645, 1783, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31440419-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p31440419-stilnaya-molodezhnaya-kurtka.html'),
(1646, 1784, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22313952-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p22313952-stilnoe-plate-pol.html'),
(1647, 1785, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22313629-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p22313629-stilnoe-plate-pol.html'),
(1648, 1786, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22316396-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p22316396-stilnaya-zhenskaya-tolstovka.html'),
(1649, 1787, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22361283-molodezhnoe-kashemirovoe-palto.html', 'product', 0, 'http://brand-shop.net.ua/p22361283-molodezhnoe-kashemirovoe-palto.html'),
(1650, 1788, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22834712-uteplennyj-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p22834712-uteplennyj-sportivnyj-kostyum.html'),
(1651, 1789, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22361275-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p22361275-stilnoe-plate-pol.html'),
(1652, 1790, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp21961080-stilnoe-osennee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p21961080-stilnoe-osennee-plate.html'),
(1653, 1791, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22360715-sportivnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p22360715-sportivnyj-molodezhnyj-kostyum.html'),
(1654, 1792, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp21756505-stilnyj-muzhskoj-sportivnyj.html', 'product', 0, 'http://brand-shop.net.ua/p21756505-stilnyj-muzhskoj-sportivnyj.html'),
(1655, 1793, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22655416-stilnoe-osennee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p22655416-stilnoe-osennee-plate.html'),
(1656, 1794, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22834665-uteplennyj-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p22834665-uteplennyj-sportivnyj-kostyum.html'),
(1657, 1795, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22986825-stilnyj-teplyj-sportivnyj.html', 'product', 0, 'http://brand-shop.net.ua/p22986825-stilnyj-teplyj-sportivnyj.html'),
(1658, 1796, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22655338-stilnoe-osennee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p22655338-stilnoe-osennee-plate.html'),
(1659, 1797, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22556759-molodezhnoe-stilnoe-poncho.html', 'product', 0, 'http://brand-shop.net.ua/p22556759-molodezhnoe-stilnoe-poncho.html'),
(1660, 1798, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp23096710-stilnoe-dlinnoe-kashemirovoe.html', 'product', 0, 'http://brand-shop.net.ua/p23096710-stilnoe-dlinnoe-kashemirovoe.html'),
(1661, 1799, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp22983648-stilnoe-osennee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p22983648-stilnoe-osennee-plate.html'),
(1662, 1800, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp23100380-stilnoe-korotkoe-kashemirovoe.html', 'product', 0, 'http://brand-shop.net.ua/p23100380-stilnoe-korotkoe-kashemirovoe.html'),
(1663, 1801, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp18259622-stilnyj-letnij-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p18259622-stilnyj-letnij-sarafan.html'),
(1664, 1802, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34555593-eksklyuzivnaya-yarkaya-molodezhnaya.html', 'product', 0, 'http://brand-shop.net.ua/p34555593-eksklyuzivnaya-yarkaya-molodezhnaya.html'),
(1665, 1803, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp18313021-stilnyj-letnij-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p18313021-stilnyj-letnij-sarafan.html'),
(1666, 1804, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20200602-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p20200602-stilnyj-molodezhnyj-kombinezon.html'),
(1667, 1805, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19459610-stilnoe-molodezhnoe-modnoe.html', 'product', 0, 'http://brand-shop.net.ua/p19459610-stilnoe-molodezhnoe-modnoe.html'),
(1668, 1806, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20507429-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p20507429-stilnoe-molodezhnoe-plate.html'),
(1669, 1807, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp18311703-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p18311703-stilnoe-molodezhnoe-plate.html'),
(1670, 1808, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp17796783-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p17796783-stilnoe-molodezhnoe-plate.html'),
(1671, 1809, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20507785-stilnoe-plate-shifon.html', 'product', 0, 'http://brand-shop.net.ua/p20507785-stilnoe-plate-shifon.html'),
(1672, 1810, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19519964-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p19519964-stilnyj-molodezhnyj-kombinezon.html'),
(1673, 1811, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp23332764-stilnye-molodezhnye-tapulki.html', 'product', 0, 'http://brand-shop.net.ua/p23332764-stilnye-molodezhnye-tapulki.html'),
(1674, 1812, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp23332453-stilnye-molodezhnye-tapulki.html', 'product', 0, 'http://brand-shop.net.ua/p23332453-stilnye-molodezhnye-tapulki.html'),
(1675, 1813, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp25633744-stilnye-zhenskie-unty.html', 'product', 0, 'http://brand-shop.net.ua/p25633744-stilnye-zhenskie-unty.html'),
(1676, 1814, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31697322-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p31697322-stilnyj-molodezhnyj-kostyum.html'),
(1677, 1815, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31742191-stilnye-molodezhnye-losiny.html', 'product', 0, 'http://brand-shop.net.ua/p31742191-stilnye-molodezhnye-losiny.html'),
(1678, 1816, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31745205-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31745205-stilnoe-molodezhnoe-plate.html'),
(1679, 1817, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31746230-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31746230-stilnoe-molodezhnoe-plate.html'),
(1680, 1818, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31746396-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31746396-stilnoe-molodezhnoe-plate.html'),
(1681, 1819, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31747985-stilnyj-zhenskij-bodi.html', 'product', 0, 'http://brand-shop.net.ua/p31747985-stilnyj-zhenskij-bodi.html'),
(1682, 1820, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31746928-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p31746928-stilnoe-plate-pol.html'),
(1683, 1821, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31745090-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31745090-stilnoe-molodezhnoe-plate.html'),
(1684, 1822, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31743718-stilnoe-detskoe-platitse.html', 'product', 0, 'http://brand-shop.net.ua/p31743718-stilnoe-detskoe-platitse.html'),
(1685, 1823, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31747553-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31747553-stilnoe-molodezhnoe-plate.html'),
(1686, 1824, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31744880-stilnoe-detskoe-platitse.html', 'product', 0, 'http://brand-shop.net.ua/p31744880-stilnoe-detskoe-platitse.html'),
(1687, 1825, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19912542-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p19912542-stilnoe-letnee-plate.html'),
(1688, 1826, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31751953-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p31751953-stilnaya-zhenskaya-tolstovka.html'),
(1689, 1827, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31751969-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p31751969-stilnaya-zhenskaya-tolstovka.html'),
(1690, 1828, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31752131-stilnaya-zhenskaya-kofta.html', 'product', 0, 'http://brand-shop.net.ua/p31752131-stilnaya-zhenskaya-kofta.html'),
(1691, 1829, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19912531-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p19912531-stilnoe-letnee-plate.html'),
(1692, 1830, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31750227-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p31750227-stilnaya-molodezhnaya-kurtka.html'),
(1693, 1831, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31750443-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31750443-stilnoe-molodezhnoe-plate.html'),
(1694, 1832, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31752059-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31752059-stilnoe-molodezhnoe-plate.html'),
(1695, 1833, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31752988-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31752988-stilnoe-molodezhnoe-plate.html'),
(1696, 1834, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31753032-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31753032-stilnoe-molodezhnoe-plate.html'),
(1697, 1835, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31750819-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p31750819-stilnaya-zhenskaya-tolstovka.html'),
(1698, 1836, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31750937-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p31750937-stilnaya-zhenskaya-tolstovka.html'),
(1699, 1837, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31750985-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p31750985-stilnaya-zhenskaya-tolstovka.html'),
(1700, 1838, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31820115-stilnaya-molodezhnaya-yubka.html', 'product', 0, 'http://brand-shop.net.ua/p31820115-stilnaya-molodezhnaya-yubka.html'),
(1701, 1839, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31820191-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p31820191-stilnyj-molodezhnyj-kostyum.html'),
(1702, 1840, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31820352-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p31820352-stilnaya-zhenskaya-tolstovka.html'),
(1703, 1841, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31820379-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31820379-stilnoe-molodezhnoe-plate.html'),
(1704, 1842, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31820414-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31820414-stilnoe-molodezhnoe-plate.html'),
(1705, 1843, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31820570-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31820570-stilnoe-molodezhnoe-plate.html'),
(1706, 1844, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31820729-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31820729-stilnoe-molodezhnoe-plate.html'),
(1707, 1845, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31820518-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31820518-stilnoe-molodezhnoe-plate.html'),
(1708, 1846, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31821134-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31821134-stilnoe-molodezhnoe-plate.html'),
(1709, 1847, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31820928-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31820928-stilnoe-molodezhnoe-plate.html'),
(1710, 1848, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp17902877-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p17902877-stilnaya-molodezhnaya-majka.html'),
(1711, 1849, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31824403-stilnye-molodezhnye-shtanishki.html', 'product', 0, 'http://brand-shop.net.ua/p31824403-stilnye-molodezhnye-shtanishki.html'),
(1712, 1850, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31824444-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31824444-stilnaya-molodezhnaya-majka.html'),
(1713, 1851, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31867710-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31867710-stilnaya-molodezhnaya-majka.html'),
(1714, 1852, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31867831-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31867831-stilnaya-molodezhnaya-majka.html'),
(1715, 1853, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31868182-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31868182-stilnaya-molodezhnaya-majka.html'),
(1716, 1854, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31868123-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31868123-stilnaya-molodezhnaya-majka.html'),
(1717, 1855, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31868326-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31868326-stilnaya-molodezhnaya-majka.html'),
(1718, 1856, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31868377-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31868377-stilnaya-molodezhnaya-majka.html'),
(1719, 1857, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31869181-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31869181-stilnaya-molodezhnaya-majka.html'),
(1720, 1858, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31870408-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31870408-stilnaya-molodezhnaya-majka.html'),
(1721, 1859, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31871520-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31871520-stilnaya-molodezhnaya-majka.html'),
(1722, 1860, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31873764-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31873764-stilnaya-molodezhnaya-majka.html'),
(1723, 1861, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31874062-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31874062-stilnaya-molodezhnaya-majka.html'),
(1724, 1862, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31874310-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31874310-stilnaya-molodezhnaya-majka.html'),
(1725, 1863, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31874392-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31874392-stilnoe-molodezhnoe-plate.html'),
(1726, 1864, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31874808-stilnaya-molodezhnaya-tunika.html', 'product', 0, 'http://brand-shop.net.ua/p31874808-stilnaya-molodezhnaya-tunika.html'),
(1727, 1865, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31876900-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31876900-stilnoe-molodezhnoe-plate.html'),
(1728, 1866, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31879330-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31879330-stilnoe-molodezhnoe-plate.html'),
(1729, 1867, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31879391-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31879391-stilnoe-molodezhnoe-plate.html'),
(1730, 1868, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31880320-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31880320-stilnoe-molodezhnoe-plate.html'),
(1731, 1869, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31881175-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31881175-stilnoe-molodezhnoe-plate.html'),
(1732, 1870, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31881337-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31881337-stilnoe-molodezhnoe-plate.html'),
(1733, 1871, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp30695949-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p30695949-stilnoe-molodezhnoe-plate.html'),
(1734, 1872, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31882008-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31882008-stilnoe-molodezhnoe-plate.html'),
(1735, 1873, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31882152-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p31882152-stilnyj-molodezhnyj-kostyum.html'),
(1736, 1874, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31882212-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31882212-stilnoe-molodezhnoe-plate.html'),
(1737, 1875, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31882462-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31882462-stilnoe-molodezhnoe-plate.html'),
(1738, 1876, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31874518-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p31874518-stilnyj-molodezhnyj-kostyum.html'),
(1739, 1877, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31873850-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p31873850-stilnaya-molodezhnaya-majka.html'),
(1740, 1878, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp18618856-stilnyj-letnij-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p18618856-stilnyj-letnij-sarafan.html'),
(1741, 1879, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp18618720-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p18618720-stilnoe-molodezhnoe-plate.html'),
(1742, 1880, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp18917589-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p18917589-stilnoe-molodezhnoe-plate.html'),
(1743, 1881, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp18618765-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p18618765-stilnoe-molodezhnoe-plate.html'),
(1744, 1882, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp17783082-stilnoe-plate-goloj.html', 'product', 0, 'http://brand-shop.net.ua/p17783082-stilnoe-plate-goloj.html'),
(1745, 1883, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp18618664-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p18618664-stilnoe-molodezhnoe-plate.html'),
(1746, 1884, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19930925-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p19930925-stilnoe-letnee-plate.html'),
(1747, 1885, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32070215-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32070215-stilnoe-molodezhnoe-plate.html'),
(1748, 1886, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32069541-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32069541-stilnoe-molodezhnoe-plate.html'),
(1749, 1887, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32068531-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32068531-stilnoe-molodezhnoe-plate.html'),
(1750, 1888, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31905136-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p31905136-stilnaya-zhenskaya-tolstovka.html'),
(1751, 1889, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31977304-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31977304-stilnoe-molodezhnoe-plate.html'),
(1752, 1890, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31976988-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31976988-stilnoe-molodezhnoe-plate.html'),
(1753, 1891, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31976604-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31976604-stilnoe-molodezhnoe-plate.html'),
(1754, 1892, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31976688-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p31976688-stilnyj-molodezhnyj-kostyum.html'),
(1755, 1893, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31905464-molodezhnaya-kofta-chernaya.html', 'product', 0, 'http://brand-shop.net.ua/p31905464-molodezhnaya-kofta-chernaya.html'),
(1756, 1894, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp18410795-molodezhnyj-stilnyj-letnij.html', 'product', 0, 'http://brand-shop.net.ua/p18410795-molodezhnyj-stilnyj-letnij.html'),
(1757, 1895, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32127567-stilnoe-detskoe-platitse.html', 'product', 0, 'http://brand-shop.net.ua/p32127567-stilnoe-detskoe-platitse.html'),
(1758, 1896, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32385171-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p32385171-stilnoe-plate-pol.html'),
(1759, 1897, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32386507-stilnaya-zhenskaya-kofta.html', 'product', 0, 'http://brand-shop.net.ua/p32386507-stilnaya-zhenskaya-kofta.html'),
(1760, 1898, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32386536-stilnaya-zhenskaya-kofta.html', 'product', 0, 'http://brand-shop.net.ua/p32386536-stilnaya-zhenskaya-kofta.html'),
(1761, 1899, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32209349-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32209349-stilnoe-molodezhnoe-plate.html'),
(1762, 1900, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32386399-stilnyj-molodezhnyj-golf.html', 'product', 0, 'http://brand-shop.net.ua/p32386399-stilnyj-molodezhnyj-golf.html'),
(1763, 1901, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32206892-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p32206892-stilnyj-molodezhnyj-kostyum.html'),
(1764, 1902, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32358753-modnaya-zhenskaya-rubashka.html', 'product', 0, 'http://brand-shop.net.ua/p32358753-modnaya-zhenskaya-rubashka.html'),
(1765, 1903, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32489972-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p32489972-stilnyj-molodezhnyj-kostyum.html'),
(1766, 1904, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32490428-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32490428-stilnoe-molodezhnoe-plate.html');
INSERT INTO `parsemx_entities` (`entity_id`, `platform_id`, `ins_id`, `donor_id`, `url`, `entity`, `status`, `ourl`) VALUES
(1767, 1905, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32490991-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32490991-stilnoe-molodezhnoe-plate.html'),
(1768, 1906, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32491879-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p32491879-stilnoe-plate-pol.html'),
(1769, 1907, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32491990-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32491990-stilnoe-molodezhnoe-plate.html'),
(1770, 1908, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32492156-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32492156-stilnoe-molodezhnoe-plate.html'),
(1771, 1909, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32492317-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32492317-stilnoe-molodezhnoe-plate.html'),
(1772, 1910, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32492078-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32492078-stilnoe-molodezhnoe-plate.html'),
(1773, 1911, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32492525-stilnyj-molodezhnyj-korset.html', 'product', 0, 'http://brand-shop.net.ua/p32492525-stilnyj-molodezhnyj-korset.html'),
(1774, 1912, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32362425-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p32362425-stilnyj-molodezhnyj-kostyum.html'),
(1775, 1913, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32133581-detskij-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p32133581-detskij-sportivnyj-kostyum.html'),
(1776, 1914, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32133740-zhenskij-velyurovyj-sportivnyj.html', 'product', 0, 'http://brand-shop.net.ua/p32133740-zhenskij-velyurovyj-sportivnyj.html'),
(1777, 1915, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32362402-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p32362402-stilnaya-zhenskaya-tolstovka.html'),
(1778, 1916, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32362175-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p32362175-stilnaya-zhenskaya-tolstovka.html'),
(1779, 1917, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32362137-zhenskij-molodezhnyj-sportivnyj.html', 'product', 0, 'http://brand-shop.net.ua/p32362137-zhenskij-molodezhnyj-sportivnyj.html'),
(1780, 1918, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32358903-zhenskij-molodezhnyj-sportivnyj.html', 'product', 0, 'http://brand-shop.net.ua/p32358903-zhenskij-molodezhnyj-sportivnyj.html'),
(1781, 1919, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32358346-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32358346-stilnoe-molodezhnoe-plate.html'),
(1782, 1920, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32357942-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32357942-stilnoe-molodezhnoe-plate.html'),
(1783, 1921, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32133914-zhenskij-velyurovyj-sportivnyj.html', 'product', 0, 'http://brand-shop.net.ua/p32133914-zhenskij-velyurovyj-sportivnyj.html'),
(1784, 1922, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32126720-stilnoe-detskoe-platitse.html', 'product', 0, 'http://brand-shop.net.ua/p32126720-stilnoe-detskoe-platitse.html'),
(1785, 1923, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32133143-stilnoe-detskoe-platitse.html', 'product', 0, 'http://brand-shop.net.ua/p32133143-stilnoe-detskoe-platitse.html'),
(1786, 1924, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32133291-stilnoe-detskoe-platitse.html', 'product', 0, 'http://brand-shop.net.ua/p32133291-stilnoe-detskoe-platitse.html'),
(1787, 1925, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32133472-stilnaya-uteplennaya-detskaya.html', 'product', 0, 'http://brand-shop.net.ua/p32133472-stilnaya-uteplennaya-detskaya.html'),
(1788, 1926, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32362870-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p32362870-stilnaya-molodezhnaya-kurtka.html'),
(1789, 1927, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32205172-stilnye-molodezhnye-bryuchki.html', 'product', 0, 'http://brand-shop.net.ua/p32205172-stilnye-molodezhnye-bryuchki.html'),
(1790, 1928, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32206702-stilnye-molodezhnye-losiny.html', 'product', 0, 'http://brand-shop.net.ua/p32206702-stilnye-molodezhnye-losiny.html'),
(1791, 1929, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32207292-stilnye-molodezhnye-losiny.html', 'product', 0, 'http://brand-shop.net.ua/p32207292-stilnye-molodezhnye-losiny.html'),
(1792, 1930, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32208029-stilnye-molodezhnye-losiny.html', 'product', 0, 'http://brand-shop.net.ua/p32208029-stilnye-molodezhnye-losiny.html'),
(1793, 1931, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32208262-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32208262-stilnoe-molodezhnoe-plate.html'),
(1794, 1932, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32208344-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32208344-stilnoe-molodezhnoe-plate.html'),
(1795, 1933, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32208450-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32208450-stilnoe-molodezhnoe-plate.html'),
(1796, 1934, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32209074-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32209074-stilnoe-molodezhnoe-plate.html'),
(1797, 1935, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32209164-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32209164-stilnoe-molodezhnoe-plate.html'),
(1798, 1936, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32209455-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32209455-stilnoe-molodezhnoe-plate.html'),
(1799, 1937, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32209502-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32209502-stilnoe-molodezhnoe-plate.html'),
(1800, 1938, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32209748-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p32209748-stilnyj-molodezhnyj-kostyum.html'),
(1801, 1939, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32209883-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32209883-stilnoe-molodezhnoe-plate.html'),
(1802, 1940, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32210005-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p32210005-stilnyj-molodezhnyj-kostyum.html'),
(1803, 1941, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32210320-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32210320-stilnoe-molodezhnoe-plate.html'),
(1804, 1942, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32357661-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32357661-stilnoe-molodezhnoe-plate.html'),
(1805, 1943, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32215505-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p32215505-stilnaya-molodezhnaya-kurtka.html'),
(1806, 1944, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32348710-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p32348710-stilnaya-molodezhnaya-kurtka.html'),
(1807, 1945, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32355083-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p32355083-stilnaya-molodezhnaya-kurtka.html'),
(1808, 1946, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32355431-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p32355431-stilnaya-molodezhnaya-kurtka.html'),
(1809, 1947, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32215587-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p32215587-stilnaya-molodezhnaya-kurtka.html'),
(1810, 1948, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32215391-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p32215391-stilnaya-molodezhnaya-kurtka.html'),
(1811, 1949, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32215441-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p32215441-stilnaya-molodezhnaya-kurtka.html'),
(1812, 1950, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32348645-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p32348645-stilnaya-molodezhnaya-kurtka.html'),
(1813, 1951, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32215471-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p32215471-stilnaya-molodezhnaya-kurtka.html'),
(1814, 1952, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32357215-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p32357215-stilnaya-molodezhnaya-kurtka.html'),
(1815, 1953, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32382600-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32382600-stilnoe-molodezhnoe-plate.html'),
(1816, 1954, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32382624-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32382624-stilnoe-molodezhnoe-plate.html'),
(1817, 1955, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32382730-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32382730-stilnoe-molodezhnoe-plate.html'),
(1818, 1956, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32384899-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32384899-stilnoe-molodezhnoe-plate.html'),
(1819, 1957, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32384988-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32384988-stilnoe-molodezhnoe-plate.html'),
(1820, 1958, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32385069-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p32385069-stilnyj-molodezhnyj-kostyum.html'),
(1821, 1959, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32385093-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32385093-stilnoe-molodezhnoe-plate.html'),
(1822, 1960, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32358726-modnaya-zhenskaya-rubashka.html', 'product', 0, 'http://brand-shop.net.ua/p32358726-modnaya-zhenskaya-rubashka.html'),
(1823, 1961, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32554966-modnaya-zhenskaya-rubashka.html', 'product', 0, 'http://brand-shop.net.ua/p32554966-modnaya-zhenskaya-rubashka.html'),
(1824, 1962, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32386264-modnaya-zhenskaya-rubashka.html', 'product', 0, 'http://brand-shop.net.ua/p32386264-modnaya-zhenskaya-rubashka.html'),
(1825, 1963, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32384805-modnaya-zhenskaya-rubashka.html', 'product', 0, 'http://brand-shop.net.ua/p32384805-modnaya-zhenskaya-rubashka.html'),
(1826, 1964, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32555563-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32555563-stilnoe-molodezhnoe-plate.html'),
(1827, 1965, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32555839-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32555839-stilnoe-molodezhnoe-plate.html'),
(1828, 1966, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32556813-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32556813-stilnoe-molodezhnoe-plate.html'),
(1829, 1967, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32556865-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32556865-stilnoe-molodezhnoe-plate.html'),
(1830, 1968, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32556946-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32556946-stilnoe-molodezhnoe-plate.html'),
(1831, 1969, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32557391-stilnaya-uteplennaya-muzhskaya.html', 'product', 0, 'http://brand-shop.net.ua/p32557391-stilnaya-uteplennaya-muzhskaya.html'),
(1832, 1970, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32558239-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32558239-stilnoe-molodezhnoe-plate.html'),
(1833, 1971, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32558314-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32558314-stilnoe-molodezhnoe-plate.html'),
(1834, 1972, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32558899-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32558899-stilnoe-molodezhnoe-plate.html'),
(1835, 1973, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32560013-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32560013-stilnoe-molodezhnoe-plate.html'),
(1836, 1974, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32560197-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32560197-stilnoe-molodezhnoe-plate.html'),
(1837, 1975, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32562852-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32562852-stilnoe-molodezhnoe-plate.html'),
(1838, 1976, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32562708-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32562708-stilnoe-molodezhnoe-plate.html'),
(1839, 1977, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32562973-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32562973-stilnoe-molodezhnoe-plate.html'),
(1840, 1978, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32563236-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32563236-stilnoe-molodezhnoe-plate.html'),
(1841, 1979, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32563353-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32563353-stilnoe-molodezhnoe-plate.html'),
(1842, 1980, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32563435-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32563435-stilnoe-molodezhnoe-plate.html'),
(1843, 1981, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32202442-stilnye-molodezhnye-losiny.html', 'product', 0, 'http://brand-shop.net.ua/p32202442-stilnye-molodezhnye-losiny.html'),
(1844, 1982, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp17824627-stilnyj-delovoj-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p17824627-stilnyj-delovoj-sarafan.html'),
(1845, 1983, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp30999885-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p30999885-stilnyj-molodezhnyj-kostyum.html'),
(1846, 1984, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp30994951-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p30994951-stilnoe-molodezhnoe-plate.html'),
(1847, 1985, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32564105-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p32564105-stilnyj-molodezhnyj-kostyum.html'),
(1848, 1986, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32566762-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32566762-stilnoe-molodezhnoe-plate.html'),
(1849, 1987, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32567325-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32567325-stilnoe-molodezhnoe-plate.html'),
(1850, 1988, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32567415-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32567415-stilnoe-molodezhnoe-plate.html'),
(1851, 1989, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32565320-stilnaya-molodezhnaya-yubka.html', 'product', 0, 'http://brand-shop.net.ua/p32565320-stilnaya-molodezhnaya-yubka.html'),
(1852, 1990, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32567548-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32567548-stilnoe-molodezhnoe-plate.html'),
(1853, 1991, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32566566-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p32566566-stilnoe-plate-pol.html'),
(1854, 1992, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32566481-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32566481-stilnoe-molodezhnoe-plate.html'),
(1855, 1993, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp17795180-stilnoe-plate-mini.html', 'product', 0, 'http://brand-shop.net.ua/p17795180-stilnoe-plate-mini.html'),
(1856, 1994, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp17784711-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p17784711-stilnoe-molodezhnoe-plate.html'),
(1857, 1995, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32692857-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p32692857-stilnoe-plate-pol.html'),
(1858, 1996, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32692275-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32692275-stilnoe-molodezhnoe-plate.html'),
(1859, 1997, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32692097-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32692097-stilnoe-molodezhnoe-plate.html'),
(1860, 1998, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32640033-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32640033-stilnoe-molodezhnoe-plate.html'),
(1861, 1999, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32639916-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32639916-stilnoe-molodezhnoe-plate.html'),
(1862, 2000, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32636962-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32636962-stilnoe-molodezhnoe-plate.html'),
(1863, 2001, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32636878-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32636878-stilnoe-molodezhnoe-plate.html'),
(1864, 2002, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32628703-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32628703-stilnoe-molodezhnoe-plate.html'),
(1865, 2003, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32695230-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32695230-stilnoe-molodezhnoe-plate.html'),
(1866, 2004, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32694702-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32694702-stilnoe-molodezhnoe-plate.html'),
(1867, 2005, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32694417-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32694417-stilnoe-molodezhnoe-plate.html'),
(1868, 2006, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32693742-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32693742-stilnoe-molodezhnoe-plate.html'),
(1869, 2007, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32693611-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32693611-stilnoe-molodezhnoe-plate.html'),
(1870, 2008, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32697186-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32697186-stilnoe-molodezhnoe-plate.html'),
(1871, 2009, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32699829-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p32699829-stilnyj-molodezhnyj-kombinezon.html'),
(1872, 2010, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32699812-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p32699812-stilnyj-molodezhnyj-kombinezon.html'),
(1873, 2011, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp17782971-stilnyj-letnij-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p17782971-stilnyj-letnij-sarafan.html'),
(1874, 2012, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32727280-stilnyj-letnij-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p32727280-stilnyj-letnij-sarafan.html'),
(1875, 2013, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32727271-stilnyj-letnij-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p32727271-stilnyj-letnij-sarafan.html'),
(1876, 2014, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32727245-stilnyj-letnij-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p32727245-stilnyj-letnij-sarafan.html'),
(1877, 2015, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32727238-stilnyj-letnij-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p32727238-stilnyj-letnij-sarafan.html'),
(1878, 2016, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32727224-stilnyj-letnij-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p32727224-stilnyj-letnij-sarafan.html'),
(1879, 2017, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32727205-stilnyj-letnij-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p32727205-stilnyj-letnij-sarafan.html'),
(1880, 2018, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32727351-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32727351-stilnoe-molodezhnoe-plate.html'),
(1881, 2019, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32727330-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32727330-stilnoe-molodezhnoe-plate.html'),
(1882, 2020, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32765546-molodezhnyj-stilnyj-pidzhak.html', 'product', 0, 'http://brand-shop.net.ua/p32765546-molodezhnyj-stilnyj-pidzhak.html'),
(1883, 2021, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32777070-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p32777070-stilnyj-molodezhnyj-kostyum.html'),
(1884, 2022, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32777017-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p32777017-stilnoe-plate-pol.html'),
(1885, 2023, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32766304-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p32766304-stilnoe-plate-pol.html'),
(1886, 2024, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32776944-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32776944-stilnoe-molodezhnoe-plate.html'),
(1887, 2025, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32766204-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p32766204-stilnaya-zhenskaya-tolstovka.html'),
(1888, 2026, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32766159-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32766159-stilnoe-molodezhnoe-plate.html'),
(1889, 2027, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp21558345-stilnoe-leto-osen.html', 'product', 0, 'http://brand-shop.net.ua/p21558345-stilnoe-leto-osen.html'),
(1890, 2028, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32779503-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32779503-stilnoe-molodezhnoe-plate.html'),
(1891, 2029, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32779191-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32779191-stilnoe-molodezhnoe-plate.html'),
(1892, 2030, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32778272-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32778272-stilnoe-molodezhnoe-plate.html'),
(1893, 2031, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32778213-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32778213-stilnoe-molodezhnoe-plate.html'),
(1894, 2032, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32778174-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32778174-stilnoe-molodezhnoe-plate.html'),
(1895, 2033, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32777868-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32777868-stilnoe-molodezhnoe-plate.html'),
(1896, 2034, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32777771-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32777771-stilnoe-molodezhnoe-plate.html'),
(1897, 2035, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32777712-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32777712-stilnoe-molodezhnoe-plate.html'),
(1898, 2036, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32777663-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32777663-stilnoe-molodezhnoe-plate.html'),
(1899, 2037, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32777551-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32777551-stilnoe-molodezhnoe-plate.html'),
(1900, 2038, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32779559-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32779559-stilnoe-molodezhnoe-plate.html'),
(1901, 2039, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp18311354-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p18311354-stilnoe-plate-pol.html'),
(1902, 2040, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp18311205-stilnoe-modnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p18311205-stilnoe-modnoe-plate.html'),
(1903, 2041, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33403106-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33403106-stilnoe-molodezhnoe-plate.html'),
(1904, 2042, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33402988-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33402988-stilnoe-molodezhnoe-plate.html'),
(1905, 2043, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33402413-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33402413-stilnoe-molodezhnoe-plate.html'),
(1906, 2044, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33402282-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33402282-stilnoe-molodezhnoe-plate.html'),
(1907, 2045, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33402127-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33402127-stilnoe-molodezhnoe-plate.html'),
(1908, 2046, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33401970-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33401970-stilnoe-molodezhnoe-plate.html'),
(1909, 2047, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33401768-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33401768-stilnoe-molodezhnoe-plate.html'),
(1910, 2048, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33401562-zhenskij-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33401562-zhenskij-sportivnyj-kostyum.html'),
(1911, 2049, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33401258-stilnaya-molodezhnaya-mini.html', 'product', 0, 'http://brand-shop.net.ua/p33401258-stilnaya-molodezhnaya-mini.html'),
(1912, 2050, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33400566-modnaya-zhenskaya-bluza.html', 'product', 0, 'http://brand-shop.net.ua/p33400566-modnaya-zhenskaya-bluza.html'),
(1913, 2051, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33408355-stilnaya-molodezhnaya-mini.html', 'product', 0, 'http://brand-shop.net.ua/p33408355-stilnaya-molodezhnaya-mini.html'),
(1914, 2052, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33408130-stilnaya-futbolka-olen.html', 'product', 0, 'http://brand-shop.net.ua/p33408130-stilnaya-futbolka-olen.html'),
(1915, 2053, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33407918-zhenskij-stilnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33407918-zhenskij-stilnyj-kostyum.html'),
(1916, 2054, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33407529-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33407529-stilnoe-molodezhnoe-plate.html'),
(1917, 2055, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33407382-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33407382-stilnoe-molodezhnoe-plate.html'),
(1918, 2056, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33407167-stilnaya-zhenskaya-kofta.html', 'product', 0, 'http://brand-shop.net.ua/p33407167-stilnaya-zhenskaya-kofta.html'),
(1919, 2057, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33407027-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33407027-stilnoe-molodezhnoe-plate.html'),
(1920, 2058, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33406983-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33406983-stilnoe-molodezhnoe-plate.html'),
(1921, 2059, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33403952-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33403952-stilnoe-molodezhnoe-plate.html'),
(1922, 2060, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33403466-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33403466-stilnoe-molodezhnoe-plate.html'),
(1923, 2061, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33403358-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33403358-stilnoe-molodezhnoe-plate.html'),
(1924, 2062, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33401413-zhenskij-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33401413-zhenskij-sportivnyj-kostyum.html'),
(1925, 2063, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33466072-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33466072-stilnyj-molodezhnyj-kostyum.html'),
(1926, 2064, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp21884852-molodezhnye-stilnye-bryuchki.html', 'product', 0, 'http://brand-shop.net.ua/p21884852-molodezhnye-stilnye-bryuchki.html'),
(1927, 2065, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp21361796-molodezhnyj-stilnyj-pidzhak.html', 'product', 0, 'http://brand-shop.net.ua/p21361796-molodezhnyj-stilnyj-pidzhak.html'),
(1928, 2066, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33459290-stilnye-molodezhnye-shorty.html', 'product', 0, 'http://brand-shop.net.ua/p33459290-stilnye-molodezhnye-shorty.html'),
(1929, 2067, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33459105-stilnaya-zhenskaya-rubashka.html', 'product', 0, 'http://brand-shop.net.ua/p33459105-stilnaya-zhenskaya-rubashka.html'),
(1930, 2068, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33458974-stilnaya-molodezhnaya-mini.html', 'product', 0, 'http://brand-shop.net.ua/p33458974-stilnaya-molodezhnaya-mini.html'),
(1931, 2069, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33458890-stilnaya-zhenskaya-rubashka.html', 'product', 0, 'http://brand-shop.net.ua/p33458890-stilnaya-zhenskaya-rubashka.html'),
(1932, 2070, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33458785-stilnaya-zhenskaya-rubashka.html', 'product', 0, 'http://brand-shop.net.ua/p33458785-stilnaya-zhenskaya-rubashka.html'),
(1933, 2071, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33467807-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33467807-stilnoe-molodezhnoe-plate.html'),
(1934, 2072, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33467604-stilnoe-kashemirovoe-palto.html', 'product', 0, 'http://brand-shop.net.ua/p33467604-stilnoe-kashemirovoe-palto.html'),
(1935, 2073, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33467468-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33467468-stilnoe-molodezhnoe-plate.html'),
(1936, 2074, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33466599-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33466599-stilnoe-molodezhnoe-plate.html'),
(1937, 2075, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33487300-stilnyj-molodezhnyj-kupalnik.html', 'product', 0, 'http://brand-shop.net.ua/p33487300-stilnyj-molodezhnyj-kupalnik.html'),
(1938, 2076, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33472506-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33472506-stilnoe-molodezhnoe-plate.html'),
(1939, 2077, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33472274-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33472274-stilnoe-molodezhnoe-plate.html'),
(1940, 2078, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33537481-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33537481-stilnoe-molodezhnoe-plate.html'),
(1941, 2079, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33537210-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33537210-stilnoe-molodezhnoe-plate.html'),
(1942, 2080, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33535580-zhenskij-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33535580-zhenskij-sportivnyj-kostyum.html'),
(1943, 2081, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33535024-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33535024-stilnyj-molodezhnyj-kostyum.html'),
(1944, 2082, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33534470-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33534470-stilnoe-molodezhnoe-plate.html'),
(1945, 2083, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33534380-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33534380-stilnoe-molodezhnoe-plate.html'),
(1946, 2084, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33533549-stilnyj-molodezhnyj-kupalnik.html', 'product', 0, 'http://brand-shop.net.ua/p33533549-stilnyj-molodezhnyj-kupalnik.html'),
(1947, 2085, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19826729-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p19826729-stilnyj-molodezhnyj-kombinezon.html'),
(1948, 2086, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33597500-stilnye-molodezhnye-shorty.html', 'product', 0, 'http://brand-shop.net.ua/p33597500-stilnye-molodezhnye-shorty.html'),
(1949, 2087, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33596807-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33596807-stilnyj-molodezhnyj-kostyum.html'),
(1950, 2088, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33595182-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p33595182-stilnyj-molodezhnyj-kombinezon.html'),
(1951, 2089, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33594322-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p33594322-stilnyj-molodezhnyj-kombinezon.html'),
(1952, 2090, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33548654-zhenskie-molodezhnye-shtany.html', 'product', 0, 'http://brand-shop.net.ua/p33548654-zhenskie-molodezhnye-shtany.html'),
(1953, 2091, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33547843-stilnye-molodezhnye-losiny.html', 'product', 0, 'http://brand-shop.net.ua/p33547843-stilnye-molodezhnye-losiny.html'),
(1954, 2092, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33547663-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33547663-stilnyj-molodezhnyj-kostyum.html'),
(1955, 2093, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33546650-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33546650-stilnyj-molodezhnyj-kostyum.html'),
(1956, 2094, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33602413-stilnaya-molodezhnaya-bluzka.html', 'product', 0, 'http://brand-shop.net.ua/p33602413-stilnaya-molodezhnaya-bluzka.html'),
(1957, 2095, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33602382-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33602382-stilnoe-molodezhnoe-plate.html'),
(1958, 2096, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33718244-stilnaya-molodezhnaya-futbolka.html', 'product', 0, 'http://brand-shop.net.ua/p33718244-stilnaya-molodezhnaya-futbolka.html'),
(1959, 2097, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33718136-stilnaya-molodezhnaya-futbolka.html', 'product', 0, 'http://brand-shop.net.ua/p33718136-stilnaya-molodezhnaya-futbolka.html'),
(1960, 2098, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33717913-stilnaya-molodezhnaya-futbolka.html', 'product', 0, 'http://brand-shop.net.ua/p33717913-stilnaya-molodezhnaya-futbolka.html'),
(1961, 2099, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33716648-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33716648-stilnoe-molodezhnoe-plate.html'),
(1962, 2100, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33716321-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33716321-stilnoe-molodezhnoe-plate.html'),
(1963, 2101, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp21884626-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p21884626-stilnaya-zhenskaya-tolstovka.html'),
(1964, 2102, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33715916-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33715916-stilnoe-molodezhnoe-plate.html'),
(1965, 2103, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33819493-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33819493-stilnoe-letnee-plate.html'),
(1966, 2104, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33817617-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33817617-stilnoe-letnee-plate.html'),
(1967, 2105, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33815917-stilnaya-molodezhnaya-bluzka.html', 'product', 0, 'http://brand-shop.net.ua/p33815917-stilnaya-molodezhnaya-bluzka.html'),
(1968, 2106, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33813829-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33813829-stilnoe-letnee-plate.html'),
(1969, 2107, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp21223351-stilnyj-letnij-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p21223351-stilnyj-letnij-kostyum.html'),
(1970, 2108, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33782476-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33782476-stilnoe-molodezhnoe-plate.html'),
(1971, 2109, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33782306-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33782306-stilnoe-molodezhnoe-plate.html'),
(1972, 2110, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33890146-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33890146-stilnoe-molodezhnoe-plate.html'),
(1973, 2111, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33889968-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33889968-stilnoe-molodezhnoe-plate.html'),
(1974, 2112, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33887460-stilnaya-molodezhnaya-mini.html', 'product', 0, 'http://brand-shop.net.ua/p33887460-stilnaya-molodezhnaya-mini.html'),
(1975, 2113, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33886185-stilnaya-molodezhnaya-bluza.html', 'product', 0, 'http://brand-shop.net.ua/p33886185-stilnaya-molodezhnaya-bluza.html'),
(1976, 2114, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33885998-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33885998-stilnoe-molodezhnoe-plate.html'),
(1977, 2115, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33883782-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33883782-stilnoe-molodezhnoe-plate.html'),
(1978, 2116, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33881392-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33881392-stilnoe-molodezhnoe-plate.html'),
(1979, 2117, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33889691-stilnyj-molodezhnyj-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p33889691-stilnyj-molodezhnyj-sarafan.html'),
(1980, 2118, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33888161-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33888161-stilnoe-molodezhnoe-plate.html'),
(1981, 2119, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33951241-stilnyj-molodezhnyj-kupalnik.html', 'product', 0, 'http://brand-shop.net.ua/p33951241-stilnyj-molodezhnyj-kupalnik.html'),
(1982, 2120, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33948110-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33948110-stilnoe-molodezhnoe-plate.html'),
(1983, 2121, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33947940-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33947940-stilnoe-molodezhnoe-plate.html'),
(1984, 2122, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33947561-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33947561-stilnoe-molodezhnoe-plate.html'),
(1985, 2123, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33947361-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33947361-stilnoe-molodezhnoe-plate.html'),
(1986, 2124, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33947160-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33947160-stilnoe-molodezhnoe-plate.html'),
(1987, 2125, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33947038-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33947038-stilnoe-molodezhnoe-plate.html'),
(1988, 2126, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33894616-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33894616-stilnoe-molodezhnoe-plate.html'),
(1989, 2127, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp17906380-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p17906380-stilnoe-molodezhnoe-plate.html'),
(1990, 2128, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33893634-stilnaya-zhenskaya-rubashka.html', 'product', 0, 'http://brand-shop.net.ua/p33893634-stilnaya-zhenskaya-rubashka.html'),
(1991, 2129, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33890916-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p33890916-stilnyj-molodezhnyj-kombinezon.html'),
(1992, 2130, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33960120-stilnyj-molodezhnyj-kupalnik.html', 'product', 0, 'http://brand-shop.net.ua/p33960120-stilnyj-molodezhnyj-kupalnik.html'),
(1993, 2131, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33959747-stilnyj-molodezhnyj-kupalnik.html', 'product', 0, 'http://brand-shop.net.ua/p33959747-stilnyj-molodezhnyj-kupalnik.html'),
(1994, 2132, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33991675-stilnoe-plate-mini.html', 'product', 0, 'http://brand-shop.net.ua/p33991675-stilnoe-plate-mini.html'),
(1995, 2133, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33991111-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p33991111-stilnoe-plate-pol.html'),
(1996, 2134, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31815582-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p31815582-stilnyj-molodezhnyj-kostyum.html'),
(1997, 2135, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19473953-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p19473953-stilnoe-letnee-plate.html'),
(1998, 2136, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34149470-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34149470-stilnoe-molodezhnoe-plate.html'),
(1999, 2137, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34149418-stilnye-molodezhnye-shorty.html', 'product', 0, 'http://brand-shop.net.ua/p34149418-stilnye-molodezhnye-shorty.html'),
(2000, 2138, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34149332-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p34149332-stilnaya-molodezhnaya-majka.html'),
(2001, 2139, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34144651-stilnaya-molodezhnaya-futbolka.html', 'product', 0, 'http://brand-shop.net.ua/p34144651-stilnaya-molodezhnaya-futbolka.html'),
(2002, 2140, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34149208-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34149208-stilnoe-molodezhnoe-plate.html'),
(2003, 2141, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34149111-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p34149111-stilnyj-molodezhnyj-kombinezon.html'),
(2004, 2142, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34148996-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34148996-stilnoe-molodezhnoe-plate.html'),
(2005, 2143, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34148904-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34148904-stilnoe-molodezhnoe-plate.html'),
(2006, 2144, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34148732-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34148732-stilnoe-molodezhnoe-plate.html'),
(2007, 2145, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34148683-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34148683-stilnyj-molodezhnyj-kostyum.html'),
(2008, 2146, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34148586-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34148586-stilnoe-molodezhnoe-plate.html'),
(2009, 2147, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34148384-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34148384-stilnoe-molodezhnoe-plate.html'),
(2010, 2148, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34145111-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34145111-stilnoe-molodezhnoe-plate.html'),
(2011, 2149, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34144992-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34144992-stilnoe-molodezhnoe-plate.html'),
(2012, 2150, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34144840-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34144840-stilnoe-letnee-plate.html'),
(2013, 2151, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34144272-stilnaya-molodezhnaya-tunika.html', 'product', 0, 'http://brand-shop.net.ua/p34144272-stilnaya-molodezhnaya-tunika.html'),
(2014, 2152, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34144022-molodezhnyj-stilnyj-pidzhak.html', 'product', 0, 'http://brand-shop.net.ua/p34144022-molodezhnyj-stilnyj-pidzhak.html'),
(2015, 2153, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34143775-molodezhnyj-stilnyj-pidzhak.html', 'product', 0, 'http://brand-shop.net.ua/p34143775-molodezhnyj-stilnyj-pidzhak.html'),
(2016, 2154, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34143534-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34143534-stilnoe-molodezhnoe-plate.html'),
(2017, 2155, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34143304-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34143304-stilnoe-molodezhnoe-plate.html'),
(2018, 2156, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34154494-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p34154494-stilnaya-zhenskaya-tolstovka.html'),
(2019, 2157, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34154302-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p34154302-stilnaya-zhenskaya-tolstovka.html'),
(2020, 2158, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34153965-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p34153965-stilnaya-zhenskaya-tolstovka.html'),
(2021, 2159, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34153926-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p34153926-stilnaya-zhenskaya-tolstovka.html'),
(2022, 2160, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34153888-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p34153888-stilnaya-zhenskaya-tolstovka.html'),
(2023, 2161, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34153730-stilnye-molodezhnye-shorty.html', 'product', 0, 'http://brand-shop.net.ua/p34153730-stilnye-molodezhnye-shorty.html'),
(2024, 2162, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34153664-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34153664-stilnoe-molodezhnoe-plate.html'),
(2025, 2163, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34153612-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34153612-stilnoe-molodezhnoe-plate.html'),
(2026, 2164, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp31073594-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p31073594-stilnoe-molodezhnoe-plate.html'),
(2027, 2165, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34153344-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34153344-stilnoe-molodezhnoe-plate.html'),
(2028, 2166, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34153263-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p34153263-stilnyj-molodezhnyj-kombinezon.html'),
(2029, 2167, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34152482-stilnaya-molodezhnaya-bluza.html', 'product', 0, 'http://brand-shop.net.ua/p34152482-stilnaya-molodezhnaya-bluza.html'),
(2030, 2168, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34151922-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34151922-stilnoe-molodezhnoe-plate.html'),
(2031, 2169, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34151089-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34151089-stilnoe-molodezhnoe-plate.html'),
(2032, 2170, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34150711-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34150711-stilnoe-molodezhnoe-plate.html'),
(2033, 2171, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34150546-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34150546-stilnoe-molodezhnoe-plate.html'),
(2034, 2172, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34150358-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34150358-stilnoe-molodezhnoe-plate.html'),
(2035, 2173, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34150255-stilnaya-molodezhnaya-tunika.html', 'product', 0, 'http://brand-shop.net.ua/p34150255-stilnaya-molodezhnaya-tunika.html'),
(2036, 2174, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34150180-stilnaya-molodezhnaya-tunika.html', 'product', 0, 'http://brand-shop.net.ua/p34150180-stilnaya-molodezhnaya-tunika.html'),
(2037, 2175, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34149526-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34149526-stilnoe-molodezhnoe-plate.html'),
(2038, 2176, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34154993-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34154993-stilnoe-molodezhnoe-plate.html'),
(2039, 2177, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34154915-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34154915-stilnyj-molodezhnyj-kostyum.html'),
(2040, 2178, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34154737-stilnaya-molodezhnaya-mini.html', 'product', 0, 'http://brand-shop.net.ua/p34154737-stilnaya-molodezhnaya-mini.html'),
(2041, 2179, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34139603-stilnyj-molodezhnyj-kupalnik.html', 'product', 0, 'http://brand-shop.net.ua/p34139603-stilnyj-molodezhnyj-kupalnik.html'),
(2042, 2180, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34139485-stilnyj-molodezhnyj-kupalnik.html', 'product', 0, 'http://brand-shop.net.ua/p34139485-stilnyj-molodezhnyj-kupalnik.html'),
(2043, 2181, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34137351-stilnyj-molodezhnyj-kupalnik.html', 'product', 0, 'http://brand-shop.net.ua/p34137351-stilnyj-molodezhnyj-kupalnik.html'),
(2044, 2182, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32210200-zhenskij-velyurovyj-sportivnyj.html', 'product', 0, 'http://brand-shop.net.ua/p32210200-zhenskij-velyurovyj-sportivnyj.html');
INSERT INTO `parsemx_entities` (`entity_id`, `platform_id`, `ins_id`, `donor_id`, `url`, `entity`, `status`, `ourl`) VALUES
(2045, 2183, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34203495-stilnaya-bluzka-dlya.html', 'product', 0, 'http://brand-shop.net.ua/p34203495-stilnaya-bluzka-dlya.html'),
(2046, 2184, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34203338-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34203338-stilnoe-molodezhnoe-plate.html'),
(2047, 2185, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34203277-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34203277-stilnoe-molodezhnoe-plate.html'),
(2048, 2186, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34203135-stilnoe-plate-dlya.html', 'product', 0, 'http://brand-shop.net.ua/p34203135-stilnoe-plate-dlya.html'),
(2049, 2187, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34203093-stilnoe-plate-dlya.html', 'product', 0, 'http://brand-shop.net.ua/p34203093-stilnoe-plate-dlya.html'),
(2050, 2188, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34203016-stilnaya-bluzka-dlya.html', 'product', 0, 'http://brand-shop.net.ua/p34203016-stilnaya-bluzka-dlya.html'),
(2051, 2189, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34202952-stilnaya-yubka-pol.html', 'product', 0, 'http://brand-shop.net.ua/p34202952-stilnaya-yubka-pol.html'),
(2052, 2190, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34201285-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p34201285-stilnoe-plate-pol.html'),
(2053, 2191, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34199073-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34199073-stilnoe-molodezhnoe-plate.html'),
(2054, 2192, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34199036-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p34199036-stilnyj-molodezhnyj-kombinezon.html'),
(2055, 2193, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34198914-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34198914-stilnoe-molodezhnoe-plate.html'),
(2056, 2194, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34198662-zhenskij-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34198662-zhenskij-sportivnyj-kostyum.html'),
(2057, 2195, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34198525-zhenskij-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34198525-zhenskij-sportivnyj-kostyum.html'),
(2058, 2196, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34198481-zhenskij-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34198481-zhenskij-sportivnyj-kostyum.html'),
(2059, 2197, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34198427-zhenskij-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34198427-zhenskij-sportivnyj-kostyum.html'),
(2060, 2198, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34198394-zhenskij-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34198394-zhenskij-sportivnyj-kostyum.html'),
(2061, 2199, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34197941-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34197941-stilnyj-molodezhnyj-kostyum.html'),
(2062, 2200, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34197787-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34197787-stilnoe-molodezhnoe-plate.html'),
(2063, 2201, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34198132-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34198132-stilnoe-molodezhnoe-plate.html'),
(2064, 2202, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34198069-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34198069-stilnoe-molodezhnoe-plate.html'),
(2065, 2203, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34198018-stilnaya-zhenskaya-kofta.html', 'product', 0, 'http://brand-shop.net.ua/p34198018-stilnaya-zhenskaya-kofta.html'),
(2066, 2204, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34197849-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34197849-stilnoe-molodezhnoe-plate.html'),
(2067, 2205, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34197828-stilnaya-zhenskaya-kofta.html', 'product', 0, 'http://brand-shop.net.ua/p34197828-stilnaya-zhenskaya-kofta.html'),
(2068, 2206, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34197584-stilnaya-zhenskaya-kofta.html', 'product', 0, 'http://brand-shop.net.ua/p34197584-stilnaya-zhenskaya-kofta.html'),
(2069, 2207, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34197521-stilnaya-molodezhnaya-mini.html', 'product', 0, 'http://brand-shop.net.ua/p34197521-stilnaya-molodezhnaya-mini.html'),
(2070, 2208, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34197386-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34197386-stilnyj-molodezhnyj-kostyum.html'),
(2071, 2209, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34197243-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34197243-stilnoe-molodezhnoe-plate.html'),
(2072, 2210, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34197168-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34197168-stilnoe-molodezhnoe-plate.html'),
(2073, 2211, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34197027-zhenskij-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34197027-zhenskij-sportivnyj-kostyum.html'),
(2074, 2212, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34196947-stilnaya-molodezhnaya-tunika.html', 'product', 0, 'http://brand-shop.net.ua/p34196947-stilnaya-molodezhnaya-tunika.html'),
(2075, 2213, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34196842-stilnaya-zhenskaya-kofta.html', 'product', 0, 'http://brand-shop.net.ua/p34196842-stilnaya-zhenskaya-kofta.html'),
(2076, 2214, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19186869-stilnoe-izyskannoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p19186869-stilnoe-izyskannoe-plate.html'),
(2077, 2215, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20479954-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p20479954-stilnoe-letnee-plate.html'),
(2078, 2216, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19459088-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p19459088-stilnoe-letnee-plate.html'),
(2079, 2217, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20178702-stilnoe-plate-shifon.html', 'product', 0, 'http://brand-shop.net.ua/p20178702-stilnoe-plate-shifon.html'),
(2080, 2218, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19186676-stilnye-zhenskie-kruzhevnye.html', 'product', 0, 'http://brand-shop.net.ua/p19186676-stilnye-zhenskie-kruzhevnye.html'),
(2081, 2219, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp21262832-velyurovyj-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p21262832-velyurovyj-sportivnyj-kostyum.html'),
(2082, 2220, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20480030-stilnoe-letnee-molodezhnoe.html', 'product', 0, 'http://brand-shop.net.ua/p20480030-stilnoe-letnee-molodezhnoe.html'),
(2083, 2221, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20479799-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p20479799-stilnoe-plate-pol.html'),
(2084, 2222, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19187033-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p19187033-stilnoe-letnee-plate.html'),
(2085, 2223, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19116267-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p19116267-stilnoe-letnee-plate.html'),
(2086, 2224, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20479833-stilnoe-letnee-molodezhnoe.html', 'product', 0, 'http://brand-shop.net.ua/p20479833-stilnoe-letnee-molodezhnoe.html'),
(2087, 2225, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19013941-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p19013941-stilnoe-letnee-plate.html'),
(2088, 2226, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19519813-stilnaya-molodezhnaya-yubka.html', 'product', 0, 'http://brand-shop.net.ua/p19519813-stilnaya-molodezhnaya-yubka.html'),
(2089, 2227, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19174620-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p19174620-stilnoe-letnee-plate.html'),
(2090, 2228, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19174727-stilnoe-letnee-molodezhnoe.html', 'product', 0, 'http://brand-shop.net.ua/p19174727-stilnoe-letnee-molodezhnoe.html'),
(2091, 2229, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19013952-stilnoe-izyaschnoe-shifonovoe.html', 'product', 0, 'http://brand-shop.net.ua/p19013952-stilnoe-izyaschnoe-shifonovoe.html'),
(2092, 2230, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20178969-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p20178969-stilnyj-molodezhnyj-kombinezon.html'),
(2093, 2231, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19473662-stilnaya-letnyaya-molodezhnaya.html', 'product', 0, 'http://brand-shop.net.ua/p19473662-stilnaya-letnyaya-molodezhnaya.html'),
(2094, 2232, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp18311050-stilnyj-letnij-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p18311050-stilnyj-letnij-sarafan.html'),
(2095, 2233, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19186776-stilnoe-izyaschnoe-mini.html', 'product', 0, 'http://brand-shop.net.ua/p19186776-stilnoe-izyaschnoe-mini.html'),
(2096, 2234, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20479758-stilnaya-molodezhnaya-letnyaya.html', 'product', 0, 'http://brand-shop.net.ua/p20479758-stilnaya-molodezhnaya-letnyaya.html'),
(2097, 2235, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19290381-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p19290381-stilnoe-letnee-plate.html'),
(2098, 2236, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34433168-stilnaya-molodezhnaya-futbolka.html', 'product', 0, 'http://brand-shop.net.ua/p34433168-stilnaya-molodezhnaya-futbolka.html'),
(2099, 2237, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20479439-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p20479439-stilnoe-letnee-plate.html'),
(2100, 2238, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34432937-stilnaya-molodezhnaya-bluzka.html', 'product', 0, 'http://brand-shop.net.ua/p34432937-stilnaya-molodezhnaya-bluzka.html'),
(2101, 2239, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34431082-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34431082-stilnoe-molodezhnoe-plate.html'),
(2102, 2240, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34429790-stilnaya-tunika-dlya.html', 'product', 0, 'http://brand-shop.net.ua/p34429790-stilnaya-tunika-dlya.html'),
(2103, 2241, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34429557-stilnaya-tunika-dlya.html', 'product', 0, 'http://brand-shop.net.ua/p34429557-stilnaya-tunika-dlya.html'),
(2104, 2242, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34429396-stilnaya-tunika-dlya.html', 'product', 0, 'http://brand-shop.net.ua/p34429396-stilnaya-tunika-dlya.html'),
(2105, 2243, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34546062-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34546062-stilnoe-molodezhnoe-plate.html'),
(2106, 2244, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34545670-stilnaya-molodezhnaya-rubashka.html', 'product', 0, 'http://brand-shop.net.ua/p34545670-stilnaya-molodezhnaya-rubashka.html'),
(2107, 2245, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34545614-stilnaya-molodezhnaya-mini.html', 'product', 0, 'http://brand-shop.net.ua/p34545614-stilnaya-molodezhnaya-mini.html'),
(2108, 2246, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34545487-stilnaya-molodezhnaya-mini.html', 'product', 0, 'http://brand-shop.net.ua/p34545487-stilnaya-molodezhnaya-mini.html'),
(2109, 2247, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34545280-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p34545280-stilnyj-molodezhnyj-kombinezon.html'),
(2110, 2248, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34542706-stilnaya-molodezhnaya-futbolka.html', 'product', 0, 'http://brand-shop.net.ua/p34542706-stilnaya-molodezhnaya-futbolka.html'),
(2111, 2249, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34542008-stilnaya-molodezhnaya-rubashka.html', 'product', 0, 'http://brand-shop.net.ua/p34542008-stilnaya-molodezhnaya-rubashka.html'),
(2112, 2250, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34622546-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34622546-stilnoe-molodezhnoe-plate.html'),
(2113, 2251, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34622386-stilnaya-molodezhnaya-kofta.html', 'product', 0, 'http://brand-shop.net.ua/p34622386-stilnaya-molodezhnaya-kofta.html'),
(2114, 2252, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34622110-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p34622110-stilnyj-molodezhnyj-kombinezon.html'),
(2115, 2253, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34622027-stilnaya-molodezhnaya-futbolka.html', 'product', 0, 'http://brand-shop.net.ua/p34622027-stilnaya-molodezhnaya-futbolka.html'),
(2116, 2254, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34621970-stilnaya-molodezhnaya-futbolka.html', 'product', 0, 'http://brand-shop.net.ua/p34621970-stilnaya-molodezhnaya-futbolka.html'),
(2117, 2255, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34621758-stilnaya-molodezhnaya-futbolka.html', 'product', 0, 'http://brand-shop.net.ua/p34621758-stilnaya-molodezhnaya-futbolka.html'),
(2118, 2256, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34620309-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p34620309-stilnyj-molodezhnyj-kombinezon.html'),
(2119, 2257, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp32692210-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p32692210-stilnoe-molodezhnoe-plate.html'),
(2120, 2258, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34663856-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34663856-stilnoe-molodezhnoe-plate.html'),
(2121, 2259, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34663543-stilnyj-molodezhnyj-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34663543-stilnyj-molodezhnyj-plate.html'),
(2122, 2260, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34663413-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34663413-stilnoe-molodezhnoe-plate.html'),
(2123, 2261, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp17784445-stilnoe-molodezhnoe-shifonovoe.html', 'product', 0, 'http://brand-shop.net.ua/p17784445-stilnoe-molodezhnoe-shifonovoe.html'),
(2124, 2262, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp17794875-molodezhnoe-stilnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p17794875-molodezhnoe-stilnoe-plate.html'),
(2125, 2263, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34632886-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34632886-stilnoe-molodezhnoe-plate.html'),
(2126, 2264, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34631670-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34631670-stilnoe-molodezhnoe-plate.html'),
(2127, 2265, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34630408-stilnaya-molodezhnaya-tunika.html', 'product', 0, 'http://brand-shop.net.ua/p34630408-stilnaya-molodezhnaya-tunika.html'),
(2128, 2266, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34629982-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34629982-stilnoe-molodezhnoe-plate.html'),
(2129, 2267, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp18409605-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p18409605-stilnyj-molodezhnyj-kombinezon.html'),
(2130, 2268, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34627117-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34627117-stilnoe-molodezhnoe-plate.html'),
(2131, 2269, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34630284-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34630284-stilnoe-molodezhnoe-plate.html'),
(2132, 2270, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34664174-stilnyj-molodezhnyj-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34664174-stilnyj-molodezhnyj-plate.html'),
(2133, 2271, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34664077-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34664077-stilnoe-molodezhnoe-plate.html'),
(2134, 2272, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34665430-stilnaya-molodezhnaya-yubka.html', 'product', 0, 'http://brand-shop.net.ua/p34665430-stilnaya-molodezhnaya-yubka.html'),
(2135, 2273, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp21558820-stilnoe-leto-osen.html', 'product', 0, 'http://brand-shop.net.ua/p21558820-stilnoe-leto-osen.html'),
(2136, 2274, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34664750-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p34664750-stilnaya-zhenskaya-tolstovka.html'),
(2137, 2275, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34664737-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p34664737-stilnaya-zhenskaya-tolstovka.html'),
(2138, 2276, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34664712-stilnaya-molodezhnaya-tunika.html', 'product', 0, 'http://brand-shop.net.ua/p34664712-stilnaya-molodezhnaya-tunika.html'),
(2139, 2277, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34664650-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p34664650-stilnaya-zhenskaya-tolstovka.html'),
(2140, 2278, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34664557-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34664557-stilnoe-molodezhnoe-plate.html'),
(2141, 2279, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34775098-zhenskij-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34775098-zhenskij-molodezhnyj-kostyum.html'),
(2142, 2280, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34775051-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34775051-stilnoe-molodezhnoe-plate.html'),
(2143, 2281, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34774977-stilnoe-kashemirovoe-palto.html', 'product', 0, 'http://brand-shop.net.ua/p34774977-stilnoe-kashemirovoe-palto.html'),
(2144, 2282, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34771564-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34771564-stilnoe-molodezhnoe-plate.html'),
(2145, 2283, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34768827-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34768827-stilnoe-molodezhnoe-plate.html'),
(2146, 2284, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34768609-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34768609-stilnoe-molodezhnoe-plate.html'),
(2147, 2285, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34768475-zhenskij-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34768475-zhenskij-molodezhnyj-kostyum.html'),
(2148, 2286, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34768214-zhenskij-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34768214-zhenskij-molodezhnyj-kostyum.html'),
(2149, 2287, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34767985-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34767985-stilnoe-molodezhnoe-plate.html'),
(2150, 2288, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34767906-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34767906-stilnoe-molodezhnoe-plate.html'),
(2151, 2289, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34760650-stilnoe-kashemirovoe-palto.html', 'product', 0, 'http://brand-shop.net.ua/p34760650-stilnoe-kashemirovoe-palto.html'),
(2152, 2290, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34760017-stilnaya-molodezhnaya-tunika.html', 'product', 0, 'http://brand-shop.net.ua/p34760017-stilnaya-molodezhnaya-tunika.html'),
(2153, 2291, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34759802-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34759802-stilnoe-letnee-plate.html'),
(2154, 2292, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34759721-stilnyj-molodezhnyj-kupalnik.html', 'product', 0, 'http://brand-shop.net.ua/p34759721-stilnyj-molodezhnyj-kupalnik.html'),
(2155, 2293, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34759550-stilnaya-zhenskaya-rubashka.html', 'product', 0, 'http://brand-shop.net.ua/p34759550-stilnaya-zhenskaya-rubashka.html'),
(2156, 2294, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34759358-stilnoe-letnee-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34759358-stilnoe-letnee-plate.html'),
(2157, 2295, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34758605-stilnyj-molodezhnyj-kupalnik.html', 'product', 0, 'http://brand-shop.net.ua/p34758605-stilnyj-molodezhnyj-kupalnik.html'),
(2158, 2296, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34758019-stilnaya-zhenskaya-kofta.html', 'product', 0, 'http://brand-shop.net.ua/p34758019-stilnaya-zhenskaya-kofta.html'),
(2159, 2297, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34757976-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34757976-stilnoe-molodezhnoe-plate.html'),
(2160, 2298, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34757928-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34757928-stilnoe-molodezhnoe-plate.html'),
(2161, 2299, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34757853-stilnyj-molodezhnyj-kupalnik.html', 'product', 0, 'http://brand-shop.net.ua/p34757853-stilnyj-molodezhnyj-kupalnik.html'),
(2162, 2300, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34757648-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34757648-stilnoe-molodezhnoe-plate.html'),
(2163, 2301, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34757558-zhenskij-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34757558-zhenskij-molodezhnyj-kostyum.html'),
(2164, 2302, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34757447-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34757447-stilnoe-molodezhnoe-plate.html'),
(2165, 2303, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34757360-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34757360-stilnoe-molodezhnoe-plate.html'),
(2166, 2304, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34754346-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p34754346-stilnaya-zhenskaya-tolstovka.html'),
(2167, 2305, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34754230-stilnyj-molodezhnyj-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34754230-stilnyj-molodezhnyj-plate.html'),
(2168, 2306, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33602288-stilnyj-zhenskij-bodi.html', 'product', 0, 'http://brand-shop.net.ua/p33602288-stilnyj-zhenskij-bodi.html'),
(2169, 2307, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33602121-stilnyj-zhenskij-bodi.html', 'product', 0, 'http://brand-shop.net.ua/p33602121-stilnyj-zhenskij-bodi.html'),
(2170, 2308, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33602037-stilnaya-zhenskaya-tolstovka.html', 'product', 0, 'http://brand-shop.net.ua/p33602037-stilnaya-zhenskaya-tolstovka.html'),
(2171, 2309, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33601871-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33601871-stilnoe-molodezhnoe-plate.html'),
(2172, 2310, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33601838-stilnyj-zhenskij-bodi.html', 'product', 0, 'http://brand-shop.net.ua/p33601838-stilnyj-zhenskij-bodi.html'),
(2173, 2311, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33601821-stilnyj-zhenskij-bodi.html', 'product', 0, 'http://brand-shop.net.ua/p33601821-stilnyj-zhenskij-bodi.html'),
(2174, 2312, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33601809-stilnyj-zhenskij-bodi.html', 'product', 0, 'http://brand-shop.net.ua/p33601809-stilnyj-zhenskij-bodi.html'),
(2175, 2313, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33601750-stilnyj-zhenskij-bodi.html', 'product', 0, 'http://brand-shop.net.ua/p33601750-stilnyj-zhenskij-bodi.html'),
(2176, 2314, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33601682-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33601682-stilnyj-molodezhnyj-kostyum.html'),
(2177, 2315, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33601643-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33601643-stilnyj-molodezhnyj-kostyum.html'),
(2178, 2316, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33601593-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33601593-stilnyj-molodezhnyj-kostyum.html'),
(2179, 2317, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33601534-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33601534-stilnyj-molodezhnyj-kostyum.html'),
(2180, 2318, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33601412-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p33601412-stilnaya-molodezhnaya-majka.html'),
(2181, 2319, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33601377-stilnaya-molodezhnaya-majka.html', 'product', 0, 'http://brand-shop.net.ua/p33601377-stilnaya-molodezhnaya-majka.html'),
(2182, 2320, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33600854-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33600854-stilnoe-molodezhnoe-plate.html'),
(2183, 2321, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33600755-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33600755-stilnoe-molodezhnoe-plate.html'),
(2184, 2322, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33600689-stilnaya-molodezhnaya-mini.html', 'product', 0, 'http://brand-shop.net.ua/p33600689-stilnaya-molodezhnaya-mini.html'),
(2185, 2323, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33600569-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33600569-stilnoe-molodezhnoe-plate.html'),
(2186, 2324, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33600483-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33600483-stilnoe-molodezhnoe-plate.html'),
(2187, 2325, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33598745-stilnaya-molodezhnaya-rubashka.html', 'product', 0, 'http://brand-shop.net.ua/p33598745-stilnaya-molodezhnaya-rubashka.html'),
(2188, 2326, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33605354-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p33605354-stilnaya-molodezhnaya-kurtka.html'),
(2189, 2327, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33602753-stilnaya-molodezhnaya-kurtka.html', 'product', 0, 'http://brand-shop.net.ua/p33602753-stilnaya-molodezhnaya-kurtka.html'),
(2190, 2328, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33602699-stilnyj-zhenskij-bodi.html', 'product', 0, 'http://brand-shop.net.ua/p33602699-stilnyj-zhenskij-bodi.html'),
(2191, 2329, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33780559-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33780559-stilnoe-molodezhnoe-plate.html'),
(2192, 2330, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33780390-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33780390-stilnoe-molodezhnoe-plate.html'),
(2193, 2331, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33779903-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33779903-stilnoe-molodezhnoe-plate.html'),
(2194, 2332, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33779615-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33779615-stilnoe-molodezhnoe-plate.html'),
(2195, 2333, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp17902209-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p17902209-stilnoe-molodezhnoe-plate.html'),
(2196, 2334, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33718611-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33718611-stilnoe-molodezhnoe-plate.html'),
(2197, 2335, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33718410-zhenskij-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33718410-zhenskij-sportivnyj-kostyum.html'),
(2198, 2336, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33718309-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p33718309-stilnoe-molodezhnoe-plate.html'),
(2199, 2337, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34541877-zhenskij-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34541877-zhenskij-sportivnyj-kostyum.html'),
(2200, 2338, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34541741-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34541741-stilnoe-molodezhnoe-plate.html'),
(2201, 2339, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19473741-stilnaya-letnyaya-molodezhnaya.html', 'product', 0, 'http://brand-shop.net.ua/p19473741-stilnaya-letnyaya-molodezhnaya.html'),
(2202, 2340, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp30179765-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p30179765-stilnoe-molodezhnoe-plate.html'),
(2203, 2341, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19473777-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p19473777-stilnyj-molodezhnyj-kombinezon.html'),
(2204, 2342, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34548035-stilnyj-letnij-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p34548035-stilnyj-letnij-sarafan.html'),
(2205, 2343, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34547981-stilnyj-letnij-sarafan.html', 'product', 0, 'http://brand-shop.net.ua/p34547981-stilnyj-letnij-sarafan.html'),
(2206, 2344, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp19473831-stilnoe-letnee-molodezhnoe.html', 'product', 0, 'http://brand-shop.net.ua/p19473831-stilnoe-letnee-molodezhnoe.html'),
(2207, 2345, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34432786-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34432786-stilnoe-molodezhnoe-plate.html'),
(2208, 2346, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20638633-stilnye-letnie-shortiki.html', 'product', 0, 'http://brand-shop.net.ua/p20638633-stilnye-letnie-shortiki.html'),
(2209, 2347, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20816502-stilnoe-plate-pol.html', 'product', 0, 'http://brand-shop.net.ua/p20816502-stilnoe-plate-pol.html'),
(2210, 2348, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34549135-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34549135-stilnoe-molodezhnoe-plate.html'),
(2211, 2349, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp20178984-stilnyj-molodezhnyj-kombinezon.html', 'product', 0, 'http://brand-shop.net.ua/p20178984-stilnyj-molodezhnyj-kombinezon.html'),
(2212, 2350, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34549049-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34549049-stilnoe-molodezhnoe-plate.html'),
(2213, 2351, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34622916-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34622916-stilnoe-molodezhnoe-plate.html'),
(2214, 2352, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34622670-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p34622670-stilnoe-molodezhnoe-plate.html'),
(2215, 2353, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33593517-zhenskie-molodezhnye-shtany.html', 'product', 0, 'http://brand-shop.net.ua/p33593517-zhenskie-molodezhnye-shtany.html'),
(2216, 2354, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp33716074-stilnyj-molodezhnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p33716074-stilnyj-molodezhnyj-kostyum.html'),
(2217, 2355, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp34198320-zhenskij-sportivnyj-kostyum.html', 'product', 0, 'http://brand-shop.net.ua/p34198320-zhenskij-sportivnyj-kostyum.html'),
(2218, 2356, 6, 6, 'http%3A%2F%2Fbrand-shop.net.ua%2Fp17798637-stilnoe-molodezhnoe-plate.html', 'product', 0, 'http://brand-shop.net.ua/p17798637-stilnoe-molodezhnoe-plate.html');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `parsemx_ins`
--

INSERT INTO `parsemx_ins` (`ins_id`, `donor_id`, `title`, `url`, `categories`, `manufacturer`, `price`, `status`) VALUES
(2, 2, '20140306', 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&amp;rt=nc&amp;_fcid=22&amp;_fsub=909987010&amp;_localstpos=&amp;_sc=1&amp;_sid=818890740&amp;_sop=15&amp;_stpos=&amp;_trksid=p4634.c0.m14.l1513&amp;gbr=1&amp;_pgn=5', '98', 0, 'X', 1),
(3, 3, '20140312-3', 'http://www.ebay.com/sch/Womens-Accessories-/4251/m.html?_dmd=2&amp;_ssn=moonar.store', '99', 0, 'X', 1),
(6, 6, '2014.04.08-1', 'http://brand-shop.net.ua/g2369951-novinki-nashego-magazina?product_items_per_page=48', '103', 0, 'X/6+8', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4082 ;

--
-- Дамп данных таблицы `parsemx_links`
--

INSERT INTO `parsemx_links` (`link_id`, `donor_id`, `ins_id`, `url`) VALUES
(2320, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html#mainContent'),
(2321, 2, 2, 'http://www.ebay.com'),
(2322, 2, 2, 'http://www.ebay.com/sch/allcategories/all-categories?_trksid=m570.l3694'),
(2323, 2, 2, 'http://www.ebay.com/sch/ebayadvsearch/?rt=nc'),
(2324, 2, 2, 'https://signin.ebay.com/ws/eBayISAPI.dll?SignIn&_trksid=m570.l3348'),
(2325, 2, 2, 'http://deals.ebay.com/'),
(2326, 2, 2, 'http://cgi5.ebay.com/ws/eBayISAPI.dll?aidZ153=&MfcISAPICommand=SellHub3'),
(2327, 2, 2, 'http://ocs.ebay.com/ws/eBayISAPI.dll?CustomerSupport'),
(2328, 2, 2, 'http://my.ebay.com/ws/eBayISAPI.dll?MyEbay&gbh=1'),
(2329, 2, 2, 'http://my.ebay.com/'),
(2330, 2, 2, 'http://cart.payments.ebay.com/sc/view'),
(2331, 2, 2, 'http://stores.ebay.com/'),
(2332, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store'),
(2333, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Ladies-Fashion-/_i.html?LH_BIN=1&_fcid=22&_fsub=911871010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&gbr=1'),
(2334, 2, 2, 'http://my.ebay.com/ws/eBayISAPI.dll?AcceptSavedSeller&sellerid=augfirstsepend&ssPageName=STRK:MEFS:ADDSTR&rt=nc'),
(2335, 2, 2, 'http://myworld.ebay.com/augfirstsepend/'),
(2336, 2, 2, 'http://feedback.ebay.com/ws/eBayISAPI.dll?ViewFeedback&userid=augfirstsepend'),
(2337, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/New-Arrivals-/_i.html?LH_BIN=1&_fcid=22&_fsub=918514010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2338, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Ladies-Fashion-/_i.html?LH_BIN=1&_fcid=22&_fsub=911871010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2339, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Tops-Shirts-/_i.html?LH_BIN=1&_fcid=22&_fsub=910349010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2340, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Pants-/_i.html?LH_BIN=1&_fcid=22&_fsub=910350010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2341, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Socks-Leg-Warmers-/_i.html?LH_BIN=1&_fcid=22&_fsub=910351010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2342, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Sweaters-/_i.html?LH_BIN=1&_fcid=22&_fsub=911921010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2343, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Hoodies-/_i.html?LH_BIN=1&_fcid=22&_fsub=911922010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2344, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Outerwear-/_i.html?LH_BIN=1&_fcid=22&_fsub=913062010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2345, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Jackets-/_i.html?LH_BIN=1&_fcid=22&_fsub=1047861010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2346, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Suits-/_i.html?LH_BIN=1&_fcid=22&_fsub=914828010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2347, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Coats-/_i.html?LH_BIN=1&_fcid=22&_fsub=1192287010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2348, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Skirt-/_i.html?LH_BIN=1&_fcid=22&_fsub=5876104010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2349, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Mens-Fashion-/_i.html?LH_BIN=1&_fcid=22&_fsub=910355010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2350, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Accessories-/_i.html?LH_BIN=1&_fcid=22&_fsub=911975010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2351, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Studs-/_i.html?LH_BIN=1&_fcid=22&_fsub=911998010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2352, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Mixed-/_i.html?LH_BIN=1&_fcid=22&_fsub=912811010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2353, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Multiple-Sizes-/_i.html?LH_BIN=1&_fcid=22&_fsub=3784886010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2354, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Other-/_i.html?LH_BIN=1&_fcid=22&_fsub=1&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2355, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&_fcid=22&_fsub=909987010&_lns=2&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m322&gbr=1'),
(2356, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_dmd=1&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&gbr=1'),
(2357, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=1&_stpos=&gbr=1'),
(2358, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html''+host+''/ss.php?type=itm&pos=''+pos+''&id=''+ebayid+''&no=''+no+'''),
(2359, 2, 2, 'http://www.ebay.com/itm/Charming-OL-Square-V-neck-Decorated-Buttons-Womens-Formal-Career-Pencil-Dresses-/350962570240?pt=US_CSA_WC_Dresses&var=&hash=item9067b205ab'),
(2360, 2, 2, 'http://www.ebay.com/itm/Chic-Hollow-Out-Pullover-V-Neck-Rhombus-Womens-Sweater-Knitwear-Knit-Tops-Grey-/350935393206?pt=US_CSA_WC_Sweaters&var=&hash=item9066722b3e'),
(2361, 2, 2, 'http://www.ebay.com/itm/Stylish-Tiger-Print-Womens-Sleeveless-Mini-Dress-Sundress-Cami-Top-Stretch-6738-/351009910949?pt=US_CSA_WC_Dresses&var=&hash=item9069ea7783'),
(2362, 2, 2, 'http://www.ebay.com/itm/Sweet-Girl-Crew-Neck-Long-Sleeve-Stretch-Womens-Mini-Dress-Flouncing-Hem-Pleats-/141202916586?pt=US_CSA_WC_Dresses&var=&hash=item6682341582'),
(2363, 2, 2, 'http://www.ebay.com/itm/Multicolor-Crew-Neck-Long-Sleeve-Womens-Knitted-Sweater-Jumper-Knitwear-Stretch-/141202861139?pt=US_CSA_WC_Sweaters&var=&hash=item6682320005'),
(2364, 2, 2, 'http://www.ebay.com/itm/Green-Backless-Strapless-Womens-Corset-Mini-Dress-Pleated-Flouncing-Hem-Stretch-/141202011123?pt=US_CSA_WC_Dresses&var=&hash=item66821a54fe'),
(2365, 2, 2, 'http://www.ebay.com/itm/Leopard-High-Neck-Floral-Lace-Mesh-Patchwork-Womens-Asymmetric-Shirt-Blouse-Tops-/141200742332?pt=US_CSA_WC_Shirts_Tops&var=&hash=item6681f8f025'),
(2366, 2, 2, 'http://www.ebay.com/itm/White-Black-Color-Blocking-Hip-wrapped-Womens-Mini-Dress-Stretch-Bodycon-Casual-/351007665128?pt=US_CSA_WC_Dresses&var=&hash=item9069d1ea62'),
(2367, 2, 2, 'http://www.ebay.com/itm/Square-V-neck-Beltloop-Peplum-Womens-Formal-Career-Pencil-Dress-Slit-Hem-Zipper-/141197918746?pt=US_CSA_WC_Dresses&var=&hash=item6681b31374'),
(2368, 2, 2, 'http://www.ebay.com/itm/Graceful-OL-Crew-Neck-Cap-Sleeve-Womens-Career-Formal-Pencil-Dresses-Zipper-Slit-/141142489175?pt=US_CSA_WC_Dresses&var=&hash=item667f7ee638'),
(2369, 2, 2, 'http://www.ebay.com/itm/Charming-Color-Blocking-Hip-wrapped-Bodycon-Womens-Career-Formal-Pencil-Dresses-/310824085398?pt=US_CSA_WC_Dresses&var=&hash=item8e1457de8f'),
(2370, 2, 2, 'http://www.ebay.com/itm/Korean-Flouncing-Stand-Collar-Womens-Full-Length-Maxi-Dress-Evening-Cut-out-6661-/271223670868?pt=US_CSA_WC_Dresses&var=&hash=item84c081bde7'),
(2371, 2, 2, 'http://www.ebay.com/itm/Classic-Half-Sleeve-Color-Blocking-Womens-Career-Formal-Pencil-Midi-Dress-6987-/310743675628?pt=US_CSA_WC_Dresses&var=&hash=item8e135f3b1e'),
(2372, 2, 2, 'http://www.ebay.com/itm/Color-Blocking-Wear-Work-Womens-Career-Formal-Pencil-Midi-Dress-Bodycon-6998-/310748830996?pt=US_CSA_WC_Dresses&var=&hash=item8e136bd5d7'),
(2373, 2, 2, 'http://www.ebay.com/itm/Cap-Sleeve-Keyhole-Color-Blocking-Womens-Wiggle-Pencil-Midi-Dress-Bodycon-7018-/271279837787?pt=US_CSA_WC_Dresses&var=&hash=item84c1d9dc40'),
(2374, 2, 2, 'http://www.ebay.com/itm/Celebrity-Floral-Print-Stretchy-Womens-Cocktail-Party-Wiggle-Pencil-Dress-7051-/310758276368?pt=US_CSA_WC_Dresses&var=&hash=item8e137fe2e9'),
(2375, 2, 2, 'http://www.ebay.com/itm/Grey-Slit-Neckline-Short-Sleeve-Womens-Formal-Career-Pencil-Dress-Zipper-Lined-/141144738337?pt=US_CSA_WC_Dresses&var=&hash=item667f99fc05'),
(2376, 2, 2, 'http://www.ebay.com/itm/Cute-Zip-up-Panda-Ears-Womens-Hoodie-Outwear-Kigurumi-Sweat-Sweatshirt-Tops-7055-/141077991450?pt=US_Womens_Sweats_Hoodies&var=&hash=item667cedebb1'),
(2377, 2, 2, 'http://www.ebay.com/itm/Lovely-Panda-Detachable-Tail-Zip-Up-Womens-Hoodie-Outwear-Kigurumi-Sweats-Pocket-/141120621886?pt=US_Womens_Sweats_Hoodies&var=&hash=item667ea630af'),
(2378, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m309&gbr=1'),
(2379, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?rt=nc&LH_Auction=1&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m309&gbr=1'),
(2380, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?rt=nc&LH_SaleItems=1&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m309&gbr=1'),
(2381, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.htmljavascript:;'),
(2382, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&gbr=1'),
(2383, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.htmljavascript:void(0)'),
(2384, 2, 2, 'http://www.ebay.com/itm/Fabulous-Womens-Sleeveless-Turndown-Collar-Shirt-Dress-Mini-Color-Blocking-6713-/271230834723?pt=US_CSA_WC_Dresses&var=&hash=item84c0ab0dac'),
(2385, 2, 2, 'http://www.ebay.com/itm/Deep-V-neck-Halter-Backless-Clubwear-Spliced-Mini-Dress-/310320868747?pt=US_CSA_WC_Dresses&var=&hash=item8e088b5294'),
(2386, 2, 2, 'http://www.ebay.com/itm/Womens-Queen-Beading-Pearl-Low-Cut-Sleeveless-Backless-Cocktail-Party-Mini-Dress-/310367694553?pt=US_CSA_WC_Dresses&var=&hash=item8e09aa95ba'),
(2387, 2, 2, 'http://www.ebay.com/itm/Graceful-Patchwork-Chiffon-Blouse-Mini-Dress-OL-Style-Business-Mini-Dress-Button-/310559662491?pt=US_CSA_WC_Dresses&var=&hash=item8e110c97ae'),
(2388, 2, 2, 'http://www.ebay.com/itm/Korean-Women-Back-Tie-Flouncing-Sleeveless-Stretch-Summer-Mini-Dress-Solid-Party-/310661153083?pt=US_CSA_WC_Dresses&var=&hash=item8e12256742'),
(2389, 2, 2, 'http://www.ebay.com/itm/Womens-Casual-Chiffon-Color-Blocking-Flouncing-Sleeveless-Shift-Mini-Dress-6506-/310667401561?pt=US_CSA_WC_Dresses&var=&hash=item8e12554e23'),
(2390, 2, 2, 'http://www.ebay.com/itm/Sexy-Stylish-Asymmetric-One-Shoulder-Mini-Dress-Solid-Cocktail-Party-Draped-6291-/310669219929?pt=US_CSA_WC_Dresses&var=&hash=item8e12661ffc'),
(2391, 2, 2, 'http://www.ebay.com/itm/Womens-Casual-Twinset-Floral-Sleeveless-Mini-Dress-Lace-Vest-Outerwear-Tops-6528-/310669250943?pt=US_CSA_WC_Dresses&var=&hash=item8e1266ac75'),
(2392, 2, 2, 'http://www.ebay.com/itm/Shiny-Rhinestone-Womens-Sleeveless-Tunic-Mini-Dress-Self-tie-Straps-Cut-out-6675-/310692239494?pt=US_CSA_WC_Dresses&var=&hash=item8e12bdc829'),
(2393, 2, 2, 'http://www.ebay.com/itm/Korean-Long-Sleeve-Lace-Splicing-Womens-Shift-Mini-Dress-Top-Casual-Solid-6873-/310723061472?pt=US_CSA_WC_Dresses&var=&hash=item8e132b76a6'),
(2394, 2, 2, 'http://www.ebay.com/itm/New-Womens-Sweet-Frills-Flouncing-Neckline-Backless-Party-Club-Fitted-Mini-Dress-/310755783207?pt=US_CSA_WC_Dresses&var=&hash=item8e13784f1b'),
(2395, 2, 2, 'http://www.ebay.com/itm/Decorated-Double-Breasted-Pullover-Lapel-Striped-Womens-Formal-Mini-Dress-7118-/310775861143?pt=US_CSA_WC_Dresses&var=&hash=item8e13b252af'),
(2396, 2, 2, 'http://www.ebay.com/itm/Gorgeous-Flower-Scoop-Neck-Hip-wrapped-Womens-Knit-Mini-Dresses-Stretch-Bodycon-/310831392622?pt=US_CSA_WC_Dresses&var=&hash=item8e14769e8c'),
(2397, 2, 2, 'http://www.ebay.com/itm/Trendy-Crew-Neck-Hip-wrapped-Ruched-Womens-Color-Blocking-Mini-Dresses-Stretch-/310873544873?pt=US_CSA_WC_Dresses&var=&hash=item8e1514a2c4'),
(2398, 2, 2, 'http://www.ebay.com/itm/Floral-Lace-Patchwork-Cut-out-Hip-wrapped-Womens-Stretch-Bodycon-Mini-Dress-Club-/310873964289?pt=US_CSA_WC_Dresses&var=&hash=item8e1516aaa5'),
(2399, 2, 2, 'http://www.ebay.com/itm/Charming-Sexy-Women-Mini-Dress-Keyhole-Wrapped-V-shaped-Sleeveless-Cocktail-6183-/310878352131?pt=US_CSA_WC_Dresses&var=&hash=item8e152e99d6'),
(2400, 2, 2, 'http://www.ebay.com/itm/Trendy-Boat-Neck-Off-shoulder-Bowtie-Womens-Stretch-Mini-Dresses-Sundress-6804-/310878906909?pt=US_CSA_WC_Dresses&var=&hash=item8e1531cd94'),
(2401, 2, 2, 'http://www.ebay.com/itm/Unique-Netted-Strap-Mini-Dresses-Sexy-Womens-Cocktail-Party-Solids-Backless-6308-/310879433879?pt=US_CSA_WC_Dresses&var=&hash=item8e15357cd0'),
(2402, 2, 2, 'http://www.ebay.com/itm/Korean-Lace-Embroidery-Womens-Crew-Neck-Long-Sleeve-Shift-Mini-Dresses-Tops-6809-/310879678715?pt=US_CSA_WC_Dresses&var=&hash=item8e1536e466'),
(2403, 2, 2, 'http://www.ebay.com/itm/Sexy-Strapless-Long-Blacks-Dress-Stylish-Womens-Maxi-Allover-Tulle-Bandeau-6399-/310880448558?pt=US_CSA_WC_Dresses&var=&hash=item8e153a77f1'),
(2404, 2, 2, 'http://www.ebay.com/itm/Lovely-Cat-Long-Sleeve-Elastic-Waist-Womens-Chiffon-Mini-Dresses-Removable-Belt-/310881518417?pt=US_CSA_WC_Dresses&var=&hash=item8e153e070a'),
(2405, 2, 2, 'http://www.ebay.com/itm/Sexy-Leopard-Hip-wrapped-See-through-Lace-Patchwork-Womens-Mini-Dress-Tops-7047-/310881685119?pt=US_CSA_WC_Dresses&var=&hash=item8e153ee3af'),
(2406, 2, 2, 'http://www.ebay.com/itm/Stylish-Crew-Neck-Striped-Womens-Stretch-Bodycon-Asymmetric-Long-Dress-Irregular-/310885288666?pt=US_CSA_WC_Dresses&var=&hash=item8e15531237'),
(2407, 2, 2, 'http://www.ebay.com/itm/Sexy-Cut-out-Waist-Crew-Neck-Long-Sleeve-Womens-Formal-Career-Pencil-Dress-Black-/310887033986?pt=US_CSA_WC_Dresses&var=&hash=item8e155b4ed4'),
(2408, 2, 2, 'http://www.ebay.com/itm/White-Black-Striped-High-Waist-Womens-Full-Length-Maxi-Skirt-Long-Dress-Stretch-/350940613094?pt=US_CSA_WC_Skirts&var=&hash=item9066a66a36'),
(2409, 2, 2, 'http://www.ebay.com/itm/Cute-Peter-Pan-Collar-Green-Dot-Long-Sleeve-Womens-Shift-Mini-Dress-Tops-Buttons-/350960483824?pt=US_CSA_WC_Dresses&var=&hash=item906795cd20'),
(2410, 2, 2, 'http://www.ebay.com/itm/Sleeveless-Houndstooth-Polka-Dot-Zebra-Stripe-Womens-Flared-Micro-Mini-Dress-Top-/350964978773?pt=US_CSA_WC_Dresses&var=&hash=item9067d67969'),
(2411, 2, 2, 'http://www.ebay.com/itm/Sweet-Turndown-Collar-Sleeveless-Floral-Pleated-Tunic-Womens-Mini-Dress-Casual-/350979474740?pt=US_CSA_WC_Dresses&var=&hash=item90689e39d4'),
(2412, 2, 2, 'http://www.ebay.com/itm/Cocktail-Party-Womens-Sexy-Backless-Crossed-Strap-Sleeveless-Mini-Dresses-6143-/350992721952?pt=US_CSA_WC_Dresses&var=&hash=item906945b61b'),
(2413, 2, 2, 'http://www.ebay.com/itm/Casual-Cute-Women-Mini-Skirts-Skorts-Solid-Short-Pants-Flouncing-Hot-Summer-4703-/350994684774?pt=US_CSA_WC_Skirts&var=&hash=item906959be46'),
(2414, 2, 2, 'http://www.ebay.com/itm/Casual-Women-Short-Sleeve-Mini-Dress-Faux-Twinset-OL-Style-Two-Tones-Peplum-4989-/350995355352?pt=US_CSA_WC_Dresses&var=&hash=item906960dc51'),
(2415, 2, 2, 'http://www.ebay.com/itm/New-Sleeveless-Womens-Side-Drawstring-Stretch-Bodycon-Midi-Dress-Asymmetirc-6982-/350995618759?pt=US_CSA_WC_Dresses&var=&hash=item9069637e80'),
(2416, 2, 2, 'http://www.ebay.com/itm/Sexy-Womens-Trendy-Patchwork-See-through-Lace-Mini-Dresses-Peplum-Flouncing-6237-/350997494765?pt=US_CSA_WC_Dresses&var=&hash=item90697449e8'),
(2417, 2, 2, 'http://www.ebay.com/itm/Sexy-Boat-Neck-Off-Shoulder-Womens-Hip-wrapped-Exposed-Zipper-Mini-Dress-Stretch-/350999415468?pt=US_CSA_WC_Dresses&var=&hash=item906983b2ea'),
(2418, 2, 2, 'http://www.ebay.com/itm/Korean-Polka-Dot-Womens-Splicing-Short-Sleeve-Tunic-Dress-Princess-Casual-6783-/351001380655?pt=US_CSA_WC_Dresses&var=&hash=item9069942f2d'),
(2419, 2, 2, 'http://www.ebay.com/itm/Elegant-Womens-Sexy-Mini-Dress-Asymmetric-One-Shoulder-Cocktail-Party-Pleat-4793-/351001809823?pt=US_CSA_WC_Dresses&var=&hash=item9069983627'),
(2420, 2, 2, 'http://www.ebay.com/itm/Pullover-Badge-Womens-Sportwear-Hooded-Dress-Mini-Long-Top-T-shirt-Pocket-7027-/351003014906?pt=US_CSA_WC_Dresses&var=&hash=item9069a6f9c0'),
(2421, 2, 2, 'http://www.ebay.com/itm/Sheer-Mesh-Patchwork-Bowtie-Vertical-Pleating-Womens-Peplum-Mini-Dresses-Stretch-/351015657518?pt=US_CSA_WC_Dresses&var=&hash=item906a214d4e'),
(2422, 2, 2, 'http://www.ebay.com/itm/Batwing-Sleeve-Hip-wrapped-Houndstooth-Womens-T-shirt-Tops-Tee-Mini-Dress-6971-/351015991082?pt=US_Womens_Tshirts&var=&hash=item906a255417'),
(2423, 2, 2, 'http://www.ebay.com/itm/Embellished-Straps-Open-Back-Mesh-Patchwork-Womens-Cocktail-Club-Dress-Stretch-/351016571815?pt=US_CSA_WC_Dresses&var=&hash=item906a2b6975'),
(2424, 2, 2, 'http://www.ebay.com/itm/2012-Womens-Color-Unique-Graceful-Fitted-Tight-Off-Shoulder-Clubwear-Mini-Dress-/310869258070?pt=US_CSA_WC_Dresses&hash=item4861406f56'),
(2425, 2, 2, 'http://www.ebay.com/itm/2012-Women-Sleeveless-Chiffon-Stretch-Asymmetric-Design-Mini-Short-Dress-4470-/350992365194?pt=US_CSA_WC_Dresses&hash=item51b8c6768a'),
(2426, 2, 2, 'http://www.ebay.com/itm/Casual-Women-Knit-Sweater-Mini-Dress-Sleeveless-Stripes-Trendy-Color-Block-4781-/141188713422?pt=US_CSA_WC_Dresses&var=&hash=item6681484c80'),
(2427, 2, 2, 'http://www.ebay.com/itm/Empire-Waist-Short-Smock-Dresses-Cross-Strap-Scoop-1116-/140719172461?pt=US_CSA_WC_Dresses&hash=item20c3842b6d'),
(2428, 2, 2, 'http://www.ebay.com/itm/Womens-See-through-Lace-Princess-3-4-Sleeves-Short-Mini-Dress-Lining-Casual-0784-/140973145191?pt=US_CSA_WC_Dresses&hash=item20d2a77c67'),
(2429, 2, 2, 'http://www.ebay.com/itm/Women-Sexy-See-through-Long-Sleeve-Lace-Tunic-Peplum-Mini-Dresses-Casual-4463-/140973656823?pt=US_CSA_WC_Dresses&hash=item20d2af4af7'),
(2430, 2, 2, 'http://www.ebay.com/itm/Womens-Blacks-See-through-Tulle-Sleeveless-Sexy-Cocktail-Party-Mini-Dress-4180-/141190133882?pt=US_CSA_WC_Dresses&hash=item20df96787a'),
(2431, 2, 2, 'http://www.ebay.com/itm/New-Women-Sexy-Wild-Slim-Cool-Leopard-Faux-Twinset-One-Piece-Mini-Dresses-Sexy-/141193221700?pt=US_CSA_WC_Dresses&hash=item20dfc59644'),
(2432, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1581&gbr=1&_pgn=4'),
(2433, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1513&gbr=1&_pgn=2'),
(2434, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1513&gbr=1&_pgn=3'),
(2435, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1513&gbr=1&_pgn=4'),
(2436, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1513&gbr=1&_pgn=6'),
(2437, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1513&gbr=1&_pgn=7'),
(2438, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1513&gbr=1&_pgn=8'),
(2439, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_sc=1&_sid=818890740&_sop=15&_stpos=&_trksid=p4634.c0.m14.l1581&gbr=1&_pgn=6'),
(2440, 2, 2, 'http://cgi6.ebay.com/ws3/eBayISAPI.dll?StorefrontLogin&usage=1&rt=nc'),
(2441, 2, 2, 'http://my.ebay.com/ws/eBayISAPI.dll?MyeBay&rt=nc'),
(2442, 2, 2, 'http://www.ebay.com/sch/Adas-Korea-Fashion-Store/Dresses-/_i.html?LH_BIN=1&rt=nc&_fcid=22&_fsub=909987010&_localstpos=&_rss=1&_rssstore=1&_sc=1&_sop=15&_stpos=&gbr=1'),
(2443, 2, 2, 'http://community.ebay.com/index.jspa'),
(2444, 2, 2, 'http://www.ebayinc.com'),
(2445, 2, 2, 'http://announcements.ebay.com'),
(2446, 2, 2, 'http://pages.ebay.com/coverage/index.html'),
(2447, 2, 2, 'http://pages.ebay.com/securitycenter/index.html'),
(2448, 2, 2, 'http://resolutioncenter.ebay.com/'),
(2449, 2, 2, 'http://pages.ebay.com/sellerinformation/index.html'),
(2450, 2, 2, 'http://pages.ebay.com/help/policies/overview.html'),
(2451, 2, 2, 'http://pages.ebay.com/sitemap.html'),
(2452, 2, 2, 'http://viv.ebay.com/ws/eBayISAPI.dll?EbayTime'),
(2453, 2, 2, 'http://garden.ebay.com'),
(2454, 2, 2, 'http://www.ebay.com/talk'),
(2455, 2, 2, 'http://qu.ebay.com/survey?srvName=globalheader+%28footer-US%29'),
(2456, 2, 2, 'http://pages.ebay.com/help/policies/user-agreement.html?rt=nc'),
(2457, 2, 2, 'http://pages.ebay.com/help/policies/privacy-policy.html?rt=nc'),
(2458, 2, 2, 'http://pages.ebay.com/help/account/cookies-web-beacons.html'),
(2459, 2, 2, 'http://stores.ebay.com/Adas-Korea-Fashion-Store/Dresses-/_i.html#'),
(2876, 3, 3, 'http://www.ebay.com/itm/Fashion-Women-Girl-Vintage-Narrow-Waistband-PU-Leather-Skinny-Waist-Belt-9-Color-/181270276733?pt=US_Women_s_Belts&var=&hash=item2a348cea7d'),
(2877, 3, 3, 'http://www.ebay.com/itm/Korean-Women-Elegant-Olive-Leaf-Headband-Hairpin-Headwear-Headdress-Hair-Clips-/181178515566?pt=US_Hair_Accessories&var=&hash=item2a2f14c06e'),
(2878, 3, 3, 'http://www.ebay.com/itm/HOT-Women-Metallic-Gold-Elastic-Hollow-Out-Headwear-Headband-Hairband-Headdress-/181181802002?pt=US_Hair_Accessories&hash=item2a2f46e612'),
(2879, 3, 3, 'http://www.ebay.com/itm/Fashion-Semi-Transparent-Round-Retro-inspired-Women-Butterfly-Arms-Sunglasses-/190872274649?pt=US_Sunglasses&var=&hash=item2c70dfc6d9'),
(2880, 3, 3, 'http://www.ebay.com/itm/Fashion-Womens-Narrow-Vintage-Waistband-Lady-PU-Leather-Slim-Skinny-Waist-Belt-/180931941298?pt=US_Women_s_Belts&var=&hash=item2a206253b2'),
(2881, 3, 3, 'http://www.ebay.com/itm/GREEN-TRAVEL-BAG-POUCH-PASSPORT-ID-CARD-HOLDER-CASE-HANDY-/180748474207?pt=US_Women_s_Accessories&hash=item2a1572d75f'),
(2882, 3, 3, 'http://www.ebay.com/itm/Women-Men-Leather-Buckle-Wallet-Purse-Clutch-Coin-Credit-ID-Card-Photo-Holder-/181129374355?pt=Wallet&var=&hash=item2a2c26ea93'),
(2883, 3, 3, 'http://www.ebay.com/itm/Lovely-Women-Girls-Faux-Fur-Suede-Elastic-Half-Finger-Gloves-Warm-Plush-Winter-/181150531091?pt=US_CSA_MWA_Gloves_Mittens&var=&hash=item2a2d69be13'),
(2884, 3, 3, 'http://www.ebay.com/itm/2013-Celebrity-Women-Lady-Vintage-Cool-Shades-Round-Sunglasses-Eyewear-Free-Case-/190874513058?pt=US_Sunglasses&var=&hash=item2c7101eea2'),
(2885, 3, 3, 'http://www.ebay.com/itm/Women-Men-Leather-Buckle-Wallet-Purse-Clutch-Coin-Credit-ID-Card-Photo-Holder-/181129375085?pt=UK_Purses_Wallets&var=&hash=item2a2c26ed6d'),
(2886, 3, 3, 'http://www.ebay.com/itm/Elegant-Women-Vintage-Flower-Bow-Headband-Hairband-Headdress-Hair-Clips-Hairpin-/190874520447?pt=US_Hair_Accessories&hash=item2c71020b7f'),
(2887, 3, 3, 'http://www.ebay.com/itm/Hot-Fashion-Men-Women-Classic-Retro-Wayfarer-Aviator-Square-Sunglasses-Free-Case-/350840010142?pt=US_Sunglasses&var=&hash=item51afb1b59e'),
(2888, 3, 3, 'http://www.ebay.com/itm/Fashion-Shopping-Eyewear-Wayfarer-Outdoor-Women-Men-Toad-Sunglasses-Free-Case-/350839996433?pt=US_Sunglasses&var=&hash=item51afb18011'),
(2889, 3, 3, 'http://www.ebay.com/itm/New-Women-Real-Leather-Clutch-Wallet-ID-Card-Photo-Coins-Holder-Bag-Pocket-Purse-/181136431849?pt=Wallet&var=&hash=item2a2c929ae9'),
(2890, 3, 3, 'http://www.ebay.com/itm/Fashion-Accessories-Womens-Wide-waistband-BowKnot-Bond-Slim-Waist-Belt-6-Colors-/180930039719?pt=US_Women_s_Belts&var=&hash=item2a20454fa7'),
(2891, 3, 3, 'http://www.ebay.com/itm/Cool-Men-Women-Unisex-Double-Stripe-Frame-Top-Flat-Sunglasses-Eyewear-Free-Case-/190874500363?pt=US_Sunglasses&var=&hash=item2c7101bd0b'),
(2892, 3, 3, 'http://www.ebay.com/itm/Unisex-Women-Men-Winter-Warm-Slouch-Knit-Cap-Oversized-Cuffed-Beanie-Crochet-Hat-/190928459389?pt=US_Hats&var=&hash=item2c7439167d'),
(2893, 3, 3, 'http://www.ebay.com/itm/Designer-Men-Women-Lovers-Retro-Large-Frame-Wayfarer-Square-Sunglasses-Free-Case-/350840014999?pt=US_Sunglasses&var=&hash=item51afb1c897'),
(2894, 3, 3, 'http://www.ebay.com/itm/Womens-Leather-Buckle-Wallet-Purse-Clutch-Photos-Coin-Credit-ID-Card-Case-Holder-/181129382672?pt=Wallet&var=&hash=item2a2c270b10'),
(2895, 3, 3, 'http://www.ebay.com/itm/Womens-Leather-Wallet-Clutch-ID-Card-Photo-Coins-Holder-Bag-Pocket-Purse-Pouch-/190836408355?pt=Wallet&var=&hash=item2c6ebc8023'),
(2896, 3, 3, 'http://www.ebay.com/itm/Hot-Punk-Style-Owl-Shape-Metal-Floral-Beads-Bracelet-Ladies-Valentines-Gift-/170881318544?pt=US_Women_s_Accessories&var=&hash=item27c951fe90'),
(2897, 3, 3, 'http://www.ebay.com/itm/Fashion-Men-Women-Designer-Retro-Reflective-Skull-Sunglasses-Eyewear-Free-Case-/181181769946?pt=US_Sunglasses&var=&hash=item2a2f4668da'),
(2898, 3, 3, 'http://www.ebay.com/itm/Retro-Women-Knit-Stitch-Elastic-Stretchy-Hasp-Wide-Dress-Cinch-Waist-Belt-Corset-/190850380612?pt=US_Women_s_Belts&var=&hash=item2c6f91b344'),
(2899, 3, 3, 'http://www.ebay.com/itm/New-Lady-Causal-Clutch-Cosmetic-Bag-Wallet-Magnet-Buckle-CoinPurse-Evening-Party-/190801900398?pt=UK_Purses_Wallets&var=&hash=item2c6cadf36e'),
(2900, 3, 3, 'http://www.ebay.com/itm/Fashion-Women-Girl-PU-Leather-Stitch-Strech-Elastic-Wide-Waist-Cinch-Belt-Corset-/181270275321?pt=US_Women_s_Belts&var=&hash=item2a348ce4f9'),
(2901, 3, 3, 'http://www.ebay.com/itm/Envelope-Wallet-Purse-Phone-Case-Samsung-Galaxy-S2-S3-S4-iPhone-4-4S-5-5S-/190938492050?pt=Wallet&var=&hash=item2c74d22c92'),
(2902, 3, 3, 'http://www.ebay.com/itm/New-Lady-Removable-Faux-Pearl-Beads-Sequin-Peter-Pan-Neck-Collar-Necklace-Choker-/181152097144?pt=US_Women_s_Accessories&hash=item2a2d81a378'),
(2903, 3, 3, 'http://www.ebay.com/itm/HOT-Wallet-Clutch-Handbag-Phone-Case-for-Galaxy-S2-S3-S4-iPhone-4S-5-5S-12-Color-/181243422724?pt=Wallet&var=&hash=item2a32f32804'),
(2904, 3, 3, 'http://www.ebay.com/itm/Western-Women-PU-Leather-Buckle-Wide-Belt-Slim-Waist-Dress-Waistband-Length-74cm-/350807746067?pt=US_Women_s_Belts&var=&hash=item51adc56613'),
(2905, 3, 3, 'http://www.ebay.com/itm/Charming-Women-Chiffon-Layers-Floral-Wide-Brim-Elastic-Strap-Sun-Hats-Beach-Caps-/181172225684?pt=US_Hats&var=&hash=item2a2eb4c694'),
(2906, 3, 3, 'http://www.ebay.com/itm/Women-Lady-PU-Leather-Tri-Fold-Small-Wallet-Clutch-Bag-Credit-Coin-Photo-Purse-/350825515889?pt=Wallet&var=&hash=item51aed48b71'),
(2907, 3, 3, 'http://www.ebay.com/itm/Retro-Unisex-Women-Men-Leather-Brim-Flat-Sailor-Army-Military-Cadet-Cap-Sun-Hat-/190882311024?pt=US_Hats&var=&hash=item2c7178eb70'),
(2908, 3, 3, 'http://www.ebay.com/itm/2013-Womens-Summer-Beach-Big-Brim-Velcro-Top-Removable-Canvas-Sun-hat-Peak-Caps-/190867256757?pt=US_Hats&var=&hash=item2c709335b5'),
(2909, 3, 3, 'http://www.ebay.com/itm/Retro-Womens-Wide-Belt-waistband-Lady-3-Row-Hasp-PU-Leather-Slim-Waist-4-Colors-/180931938214?pt=US_Women_s_Belts&var=&hash=item2a206247a6'),
(2910, 3, 3, 'http://www.ebay.com/itm/Hot-Fashion-design-Womens-Hollow-Floral-Wide-Slim-waistband-Ladies-Skinny-Belts-/190699985323?pt=US_Women_s_Belts&var=&hash=item2c669ad9ab'),
(2911, 3, 3, 'http://www.ebay.com/itm/Women-Wallet-Clutch-Long-Handbag-Phone-Case-for-Galaxy-S2-S3-S4-iPhone-4S-5-HTC-/350893159917?pt=Wallet&var=&hash=item51b2dcb5ed'),
(2912, 3, 3, 'http://www.ebay.com/itm/Fashion-Women-Vintage-Punk-Spike-Studs-Rivets-Removable-Necklace-Choker-Collar-/350807733629?pt=US_Women_s_Accessories&var=&hash=item51adc5357d'),
(2913, 3, 3, 'http://www.ebay.com/itm/New-Lady-Causal-Clutch-Cosmetic-Bag-Wallet-Magnet-Buckle-CoinPurse-Evening-Party-/181086564447?pt=Wallet&var=&hash=item2a2999b05f'),
(2914, 3, 3, 'http://www.ebay.com/itm/Vintage-Women-Men-Classic-Party-Wool-Bowler-Felt-Fedora-Derby-Hats-Roll-Up-Caps-/350829754032?pt=US_Hats&var=&hash=item51af1536b0'),
(2915, 3, 3, 'http://www.ebay.com/itm/Celebrity-Womens-Metal-Mirror-Wide-Strap-Belt-Corset-Slim-Waistband-8-Colors-6CM-/350801119015?pt=US_Women_s_Belts&var=&hash=item51ad604727'),
(2916, 3, 3, 'http://www.ebay.com/itm/Removable-Women-Vintage-Dress-Faux-Pearl-Beads-Embellished-Neck-Collar-Necklace-/170872570294?pt=US_Women_s_Accessories&hash=item27c8cc81b6'),
(2917, 3, 3, 'http://www.ebay.com/itm/Fashion-Women-Retro-Buckle-Synthetic-Leather-purse-Clutch-Evening-handbag-Wallet-/190782251668?pt=Wallet&var=&hash=item2c6b822294'),
(2918, 3, 3, 'http://www.ebay.com/itm/Women-Accessory-Metal-Mirror-Wide-Strap-Belt-Corsset-Slim-Waist-Band-8-Colors-/170872567646?pt=US_Women_s_Belts&var=&hash=item27c8cc775e'),
(2919, 3, 3, 'http://www.ebay.com/itm/Fashion-Women-Girl-Floppy-Derby-Hat-Wide-Large-Brim-Summer-Beach-Straw-Sun-Hat-/190881417935?pt=US_Hats&var=&hash=item2c716b4acf'),
(2920, 3, 3, 'http://www.ebay.com/itm/Women-Leather-Key-Bag-Keychain-Coins-Holder-Clutch-Wallet-Purse-With-Wrist-Strap-/190836414463?pt=Wallet&var=&hash=item2c6ebc97ff'),
(2921, 3, 3, 'http://www.ebay.com/itm/Vintage-Women-Cute-Faux-Peals-Peter-Pan-Collar-Detachable-Necklace-Sweater-Dress-/181152116643?pt=US_Women_s_Accessories&var=&hash=item2a2d81efa3'),
(2922, 3, 3, 'http://www.ebay.com/itm/Korean-Womens-Organizer-Long-Wallets-Bifold-Buckle-Credicard-Photo-Holder-Purses-/180976513715?pt=UK_Purses_Wallets&var=&hash=item2a230a72b3'),
(2923, 3, 3, 'http://www.ebay.com/itm/Fashion-Women-Rivet-Bifold-Wallet-Clutch-Coins-Keys-Phone-Credit-Card-Bags-Purse-/181146929270?pt=Wallet&var=&hash=item2a2d32c876'),
(2924, 3, 3, 'http://www.ebay.com/itm/Women-Celebrity-Shiny-Girdle-Tassel-Metallic-Snakeskin-Slim-Belts-Wide-Waistband-/181152108674?pt=US_Women_s_Belts&var=&hash=item2a2d81d082'),
(2925, 3, 3, 'http://www.ebay.com/itm/New-Women-PU-Leather-Bifold-Buckle-Long-Wallet-Clutch-Credit-Card-Purse-Handbag-/181168178670?pt=Wallet&var=&hash=item2a2e7705ee'),
(2926, 3, 3, 'http://www.ebay.com/itm/Korean-Womens-Organizer-Long-Wallets-Bifold-Buckle-Credicard-Photo-Holder-Purses-/190728019757?pt=Wallet&var=&hash=item2c68469f2d'),
(2927, 3, 3, 'http://www.ebay.com/itm/6-Colors-Fashion-Women-PU-Leather-Clutch-Purse-handbag-Eveningbag-Wallet-/181059701518?pt=Wallet&var=&hash=item2a27ffcb0e'),
(2928, 3, 3, 'http://www.ebay.com/itm/Womens-OL-Ladies-Retro-Floral-Credit-Cards-Bag-Purse-Clutch-Wallet-Formal-Party-/190843552679?pt=Wallet&hash=item2c6f2983a7'),
(2929, 3, 3, 'http://www.ebay.com/itm/New-Womens-Leather-Zip-Wallet-Purse-Clips-Clutch-Coin-Card-Phone-Pouch-Party-Bag-/350778688655?pt=UK_Purses_Wallets&var=&hash=item51ac0a048f'),
(2930, 3, 3, 'http://www.ebay.com/itm/New-Womens-Leather-Zip-Wallet-Purse-Clips-Clutch-Coin-Card-Phone-Pouch-Party-Bag-/350778687026?pt=Wallet&var=&hash=item51ac09fe32'),
(2931, 3, 3, 'http://www.ebay.com/itm/Vintage-Girls-Accessory-Retro-Faux-Pearl-Gold-Beads-Sequin-Pete-Pan-Neck-Collar-/170899477356?pt=UK_Charms_Wristbands&hash=item27ca67136c'),
(2932, 3, 3, 'http://www.ebay.com/itm/Women-Leather-Zip-Around-Wallet-Purse-Clutch-Coin-Card-Phone-Pouch-Party-Handbag-/190830101630?pt=Wallet&var=&hash=item2c6e5c447e'),
(2933, 3, 3, 'http://www.ebay.com/itm/Womens-Shinning-Leather-Long-Bifold-Wallet-Purse-Clips-Clutch-Party-Evening-Gift-/181129331577?pt=UK_Purses_Wallets&var=&hash=item2a2c264379'),
(2934, 3, 3, 'http://www.ebay.com/itm/Womens-Shinning-Leather-Long-Bifold-Wallet-Purse-Clips-Clutch-Party-Evening-Gift-/181129330358?pt=Wallet&var=&hash=item2a2c263eb6'),
(2935, 3, 3, 'http://www.ebay.com/itm/Korean-Womens-Real-Leather-Wallet-Purse-Clips-Clutch-Coin-Card-Phone-Bag-Party-/350778725057?pt=Wallet&var=&hash=item51ac0a92c1'),
(2940, 4, 4, 'http://brand-shop.net.ua/p34757976-stilnoe-molodezhnoe-plate.html'),
(3491, 6, 6, 'http://brand-shop.net.ua/g2369951-novinki-nashego-magazina/page_2?product_items_per_page=48'),
(3492, 6, 6, 'http://brand-shop.net.ua/p34754230-stilnyj-molodezhnyj-plate.html'),
(3493, 6, 6, 'http://brand-shop.net.ua/p34754346-stilnaya-zhenskaya-tolstovka.html'),
(3494, 6, 6, 'http://brand-shop.net.ua/p34757360-stilnoe-molodezhnoe-plate.html'),
(3495, 6, 6, 'http://brand-shop.net.ua/p34757447-stilnoe-molodezhnoe-plate.html'),
(3496, 6, 6, 'http://brand-shop.net.ua/p34757558-zhenskij-molodezhnyj-kostyum.html'),
(3497, 6, 6, 'http://brand-shop.net.ua/p34757648-stilnoe-molodezhnoe-plate.html'),
(3498, 6, 6, 'http://brand-shop.net.ua/p34757853-stilnyj-molodezhnyj-kupalnik.html'),
(3499, 6, 6, 'http://brand-shop.net.ua/p34757928-stilnoe-molodezhnoe-plate.html'),
(3500, 6, 6, 'http://brand-shop.net.ua/p34757976-stilnoe-molodezhnoe-plate.html'),
(3501, 6, 6, 'http://brand-shop.net.ua/p34758019-stilnaya-zhenskaya-kofta.html'),
(3502, 6, 6, 'http://brand-shop.net.ua/p34758605-stilnyj-molodezhnyj-kupalnik.html'),
(3503, 6, 6, 'http://brand-shop.net.ua/p34759358-stilnoe-letnee-plate.html'),
(3504, 6, 6, 'http://brand-shop.net.ua/p34759550-stilnaya-zhenskaya-rubashka.html'),
(3505, 6, 6, 'http://brand-shop.net.ua/p34759721-stilnyj-molodezhnyj-kupalnik.html'),
(3506, 6, 6, 'http://brand-shop.net.ua/p34759802-stilnoe-letnee-plate.html'),
(3507, 6, 6, 'http://brand-shop.net.ua/p34760017-stilnaya-molodezhnaya-tunika.html'),
(3508, 6, 6, 'http://brand-shop.net.ua/p34760650-stilnoe-kashemirovoe-palto.html'),
(3509, 6, 6, 'http://brand-shop.net.ua/p34767906-stilnoe-molodezhnoe-plate.html'),
(3510, 6, 6, 'http://brand-shop.net.ua/p34767985-stilnoe-molodezhnoe-plate.html'),
(3511, 6, 6, 'http://brand-shop.net.ua/p34768214-zhenskij-molodezhnyj-kostyum.html'),
(3512, 6, 6, 'http://brand-shop.net.ua/p34768475-zhenskij-molodezhnyj-kostyum.html'),
(3513, 6, 6, 'http://brand-shop.net.ua/p34768609-stilnoe-molodezhnoe-plate.html'),
(3514, 6, 6, 'http://brand-shop.net.ua/p34768827-stilnoe-molodezhnoe-plate.html'),
(3515, 6, 6, 'http://brand-shop.net.ua/p34771564-stilnoe-molodezhnoe-plate.html'),
(3516, 6, 6, 'http://brand-shop.net.ua/p34774977-stilnoe-kashemirovoe-palto.html'),
(3517, 6, 6, 'http://brand-shop.net.ua/p34775051-stilnoe-molodezhnoe-plate.html'),
(3518, 6, 6, 'http://brand-shop.net.ua/p34775098-zhenskij-molodezhnyj-kostyum.html'),
(3519, 6, 6, 'http://brand-shop.net.ua/p34664557-stilnoe-molodezhnoe-plate.html'),
(3520, 6, 6, 'http://brand-shop.net.ua/p34664650-stilnaya-zhenskaya-tolstovka.html'),
(3521, 6, 6, 'http://brand-shop.net.ua/p34664712-stilnaya-molodezhnaya-tunika.html'),
(3522, 6, 6, 'http://brand-shop.net.ua/p34664737-stilnaya-zhenskaya-tolstovka.html'),
(3523, 6, 6, 'http://brand-shop.net.ua/p34664750-stilnaya-zhenskaya-tolstovka.html'),
(3524, 6, 6, 'http://brand-shop.net.ua/p21558820-stilnoe-leto-osen.html'),
(3525, 6, 6, 'http://brand-shop.net.ua/p34665430-stilnaya-molodezhnaya-yubka.html'),
(3526, 6, 6, 'http://brand-shop.net.ua/p34664077-stilnoe-molodezhnoe-plate.html'),
(3527, 6, 6, 'http://brand-shop.net.ua/p34664174-stilnyj-molodezhnyj-plate.html'),
(3528, 6, 6, 'http://brand-shop.net.ua/p34630284-stilnoe-molodezhnoe-plate.html'),
(3529, 6, 6, 'http://brand-shop.net.ua/p34627117-stilnoe-molodezhnoe-plate.html'),
(3530, 6, 6, 'http://brand-shop.net.ua/p18409605-stilnyj-molodezhnyj-kombinezon.html'),
(3531, 6, 6, 'http://brand-shop.net.ua/p34629982-stilnoe-molodezhnoe-plate.html'),
(3532, 6, 6, 'http://brand-shop.net.ua/p34630408-stilnaya-molodezhnaya-tunika.html'),
(3533, 6, 6, 'http://brand-shop.net.ua/p34631670-stilnoe-molodezhnoe-plate.html'),
(3534, 6, 6, 'http://brand-shop.net.ua/p34632886-stilnoe-molodezhnoe-plate.html'),
(3535, 6, 6, 'http://brand-shop.net.ua/p17794875-molodezhnoe-stilnoe-plate.html'),
(3536, 6, 6, 'http://brand-shop.net.ua/p17784445-stilnoe-molodezhnoe-shifonovoe.html'),
(3537, 6, 6, 'http://brand-shop.net.ua/p34663413-stilnoe-molodezhnoe-plate.html'),
(3538, 6, 6, 'http://brand-shop.net.ua/p34663543-stilnyj-molodezhnyj-plate.html'),
(3539, 6, 6, 'http://brand-shop.net.ua/p34663856-stilnoe-molodezhnoe-plate.html'),
(3540, 6, 6, 'http://brand-shop.net.ua/g2369951-novinki-nashego-magazina/page_3?product_items_per_page=48'),
(3541, 6, 6, 'http://brand-shop.net.ua/p32692210-stilnoe-molodezhnoe-plate.html'),
(3542, 6, 6, 'http://brand-shop.net.ua/p34620309-stilnyj-molodezhnyj-kombinezon.html'),
(3543, 6, 6, 'http://brand-shop.net.ua/p34621758-stilnaya-molodezhnaya-futbolka.html'),
(3544, 6, 6, 'http://brand-shop.net.ua/p34621970-stilnaya-molodezhnaya-futbolka.html'),
(3545, 6, 6, 'http://brand-shop.net.ua/p34622027-stilnaya-molodezhnaya-futbolka.html'),
(3546, 6, 6, 'http://brand-shop.net.ua/p34622110-stilnyj-molodezhnyj-kombinezon.html'),
(3547, 6, 6, 'http://brand-shop.net.ua/p34622386-stilnaya-molodezhnaya-kofta.html'),
(3548, 6, 6, 'http://brand-shop.net.ua/p34622546-stilnoe-molodezhnoe-plate.html'),
(3549, 6, 6, 'http://brand-shop.net.ua/p34622670-stilnoe-molodezhnoe-plate.html'),
(3550, 6, 6, 'http://brand-shop.net.ua/p34622916-stilnoe-molodezhnoe-plate.html'),
(3551, 6, 6, 'http://brand-shop.net.ua/p34549049-stilnoe-molodezhnoe-plate.html'),
(3552, 6, 6, 'http://brand-shop.net.ua/p20178984-stilnyj-molodezhnyj-kombinezon.html'),
(3553, 6, 6, 'http://brand-shop.net.ua/p34549135-stilnoe-molodezhnoe-plate.html'),
(3554, 6, 6, 'http://brand-shop.net.ua/p20816502-stilnoe-plate-pol.html'),
(3555, 6, 6, 'http://brand-shop.net.ua/p20638633-stilnye-letnie-shortiki.html'),
(3556, 6, 6, 'http://brand-shop.net.ua/p34432786-stilnoe-molodezhnoe-plate.html'),
(3557, 6, 6, 'http://brand-shop.net.ua/p19473831-stilnoe-letnee-molodezhnoe.html'),
(3558, 6, 6, 'http://brand-shop.net.ua/p34547981-stilnyj-letnij-sarafan.html'),
(3559, 6, 6, 'http://brand-shop.net.ua/p34548035-stilnyj-letnij-sarafan.html'),
(3560, 6, 6, 'http://brand-shop.net.ua/p19473777-stilnyj-molodezhnyj-kombinezon.html'),
(3561, 6, 6, 'http://brand-shop.net.ua/p30179765-stilnoe-molodezhnoe-plate.html'),
(3562, 6, 6, 'http://brand-shop.net.ua/p19473741-stilnaya-letnyaya-molodezhnaya.html'),
(3563, 6, 6, 'http://brand-shop.net.ua/p34541741-stilnoe-molodezhnoe-plate.html'),
(3564, 6, 6, 'http://brand-shop.net.ua/p34541877-zhenskij-sportivnyj-kostyum.html'),
(3565, 6, 6, 'http://brand-shop.net.ua/p34542008-stilnaya-molodezhnaya-rubashka.html'),
(3566, 6, 6, 'http://brand-shop.net.ua/p34542706-stilnaya-molodezhnaya-futbolka.html'),
(3567, 6, 6, 'http://brand-shop.net.ua/p34545280-stilnyj-molodezhnyj-kombinezon.html'),
(3568, 6, 6, 'http://brand-shop.net.ua/p34545487-stilnaya-molodezhnaya-mini.html'),
(3569, 6, 6, 'http://brand-shop.net.ua/p34545614-stilnaya-molodezhnaya-mini.html'),
(3570, 6, 6, 'http://brand-shop.net.ua/p34545670-stilnaya-molodezhnaya-rubashka.html'),
(3571, 6, 6, 'http://brand-shop.net.ua/p34546062-stilnoe-molodezhnoe-plate.html'),
(3572, 6, 6, 'http://brand-shop.net.ua/p34429396-stilnaya-tunika-dlya.html'),
(3573, 6, 6, 'http://brand-shop.net.ua/p34429557-stilnaya-tunika-dlya.html'),
(3574, 6, 6, 'http://brand-shop.net.ua/p34429790-stilnaya-tunika-dlya.html'),
(3575, 6, 6, 'http://brand-shop.net.ua/p34431082-stilnoe-molodezhnoe-plate.html'),
(3576, 6, 6, 'http://brand-shop.net.ua/p34432937-stilnaya-molodezhnaya-bluzka.html'),
(3577, 6, 6, 'http://brand-shop.net.ua/p20479439-stilnoe-letnee-plate.html'),
(3578, 6, 6, 'http://brand-shop.net.ua/p34433168-stilnaya-molodezhnaya-futbolka.html'),
(3579, 6, 6, 'http://brand-shop.net.ua/p19290381-stilnoe-letnee-plate.html'),
(3580, 6, 6, 'http://brand-shop.net.ua/p20479758-stilnaya-molodezhnaya-letnyaya.html'),
(3581, 6, 6, 'http://brand-shop.net.ua/p19186776-stilnoe-izyaschnoe-mini.html'),
(3582, 6, 6, 'http://brand-shop.net.ua/p18311050-stilnyj-letnij-sarafan.html'),
(3583, 6, 6, 'http://brand-shop.net.ua/p19473662-stilnaya-letnyaya-molodezhnaya.html'),
(3584, 6, 6, 'http://brand-shop.net.ua/p20178969-stilnyj-molodezhnyj-kombinezon.html'),
(3585, 6, 6, 'http://brand-shop.net.ua/p19013952-stilnoe-izyaschnoe-shifonovoe.html'),
(3586, 6, 6, 'http://brand-shop.net.ua/p19174727-stilnoe-letnee-molodezhnoe.html'),
(3587, 6, 6, 'http://brand-shop.net.ua/p19174620-stilnoe-letnee-plate.html'),
(3588, 6, 6, 'http://brand-shop.net.ua/p19519813-stilnaya-molodezhnaya-yubka.html'),
(3589, 6, 6, 'http://brand-shop.net.ua/g2369951-novinki-nashego-magazina/page_4?product_items_per_page=48'),
(3590, 6, 6, 'http://brand-shop.net.ua/p19013941-stilnoe-letnee-plate.html'),
(3591, 6, 6, 'http://brand-shop.net.ua/p20479833-stilnoe-letnee-molodezhnoe.html'),
(3592, 6, 6, 'http://brand-shop.net.ua/p19116267-stilnoe-letnee-plate.html'),
(3593, 6, 6, 'http://brand-shop.net.ua/p19187033-stilnoe-letnee-plate.html'),
(3594, 6, 6, 'http://brand-shop.net.ua/p20479799-stilnoe-plate-pol.html'),
(3595, 6, 6, 'http://brand-shop.net.ua/p20480030-stilnoe-letnee-molodezhnoe.html'),
(3596, 6, 6, 'http://brand-shop.net.ua/p21262832-velyurovyj-sportivnyj-kostyum.html'),
(3597, 6, 6, 'http://brand-shop.net.ua/p19186676-stilnye-zhenskie-kruzhevnye.html'),
(3598, 6, 6, 'http://brand-shop.net.ua/p20178702-stilnoe-plate-shifon.html'),
(3599, 6, 6, 'http://brand-shop.net.ua/p19459088-stilnoe-letnee-plate.html'),
(3600, 6, 6, 'http://brand-shop.net.ua/p20479954-stilnoe-letnee-plate.html'),
(3601, 6, 6, 'http://brand-shop.net.ua/p19186869-stilnoe-izyskannoe-plate.html'),
(3602, 6, 6, 'http://brand-shop.net.ua/p34196842-stilnaya-zhenskaya-kofta.html'),
(3603, 6, 6, 'http://brand-shop.net.ua/p34196947-stilnaya-molodezhnaya-tunika.html'),
(3604, 6, 6, 'http://brand-shop.net.ua/p34197027-zhenskij-sportivnyj-kostyum.html'),
(3605, 6, 6, 'http://brand-shop.net.ua/p34197168-stilnoe-molodezhnoe-plate.html'),
(3606, 6, 6, 'http://brand-shop.net.ua/p34197243-stilnoe-molodezhnoe-plate.html'),
(3607, 6, 6, 'http://brand-shop.net.ua/p34197386-stilnyj-molodezhnyj-kostyum.html'),
(3608, 6, 6, 'http://brand-shop.net.ua/p34197521-stilnaya-molodezhnaya-mini.html'),
(3609, 6, 6, 'http://brand-shop.net.ua/p34197584-stilnaya-zhenskaya-kofta.html'),
(3610, 6, 6, 'http://brand-shop.net.ua/p34197828-stilnaya-zhenskaya-kofta.html'),
(3611, 6, 6, 'http://brand-shop.net.ua/p34197849-stilnoe-molodezhnoe-plate.html'),
(3612, 6, 6, 'http://brand-shop.net.ua/p34198018-stilnaya-zhenskaya-kofta.html'),
(3613, 6, 6, 'http://brand-shop.net.ua/p34198069-stilnoe-molodezhnoe-plate.html'),
(3614, 6, 6, 'http://brand-shop.net.ua/p34198132-stilnoe-molodezhnoe-plate.html'),
(3615, 6, 6, 'http://brand-shop.net.ua/p34198320-zhenskij-sportivnyj-kostyum.html'),
(3616, 6, 6, 'http://brand-shop.net.ua/p34197787-stilnoe-molodezhnoe-plate.html'),
(3617, 6, 6, 'http://brand-shop.net.ua/p34197941-stilnyj-molodezhnyj-kostyum.html'),
(3618, 6, 6, 'http://brand-shop.net.ua/p34198394-zhenskij-sportivnyj-kostyum.html'),
(3619, 6, 6, 'http://brand-shop.net.ua/p34198427-zhenskij-sportivnyj-kostyum.html'),
(3620, 6, 6, 'http://brand-shop.net.ua/p34198481-zhenskij-sportivnyj-kostyum.html'),
(3621, 6, 6, 'http://brand-shop.net.ua/p34198525-zhenskij-sportivnyj-kostyum.html'),
(3622, 6, 6, 'http://brand-shop.net.ua/p34198662-zhenskij-sportivnyj-kostyum.html'),
(3623, 6, 6, 'http://brand-shop.net.ua/p34198914-stilnoe-molodezhnoe-plate.html'),
(3624, 6, 6, 'http://brand-shop.net.ua/p34199036-stilnyj-molodezhnyj-kombinezon.html'),
(3625, 6, 6, 'http://brand-shop.net.ua/p34199073-stilnoe-molodezhnoe-plate.html'),
(3626, 6, 6, 'http://brand-shop.net.ua/p34201285-stilnoe-plate-pol.html'),
(3627, 6, 6, 'http://brand-shop.net.ua/p34202952-stilnaya-yubka-pol.html'),
(3628, 6, 6, 'http://brand-shop.net.ua/p34203016-stilnaya-bluzka-dlya.html'),
(3629, 6, 6, 'http://brand-shop.net.ua/p34203093-stilnoe-plate-dlya.html'),
(3630, 6, 6, 'http://brand-shop.net.ua/p34203135-stilnoe-plate-dlya.html'),
(3631, 6, 6, 'http://brand-shop.net.ua/p34203277-stilnoe-molodezhnoe-plate.html'),
(3632, 6, 6, 'http://brand-shop.net.ua/p34203338-stilnoe-molodezhnoe-plate.html'),
(3633, 6, 6, 'http://brand-shop.net.ua/p34203495-stilnaya-bluzka-dlya.html'),
(3634, 6, 6, 'http://brand-shop.net.ua/p32210200-zhenskij-velyurovyj-sportivnyj.html'),
(3635, 6, 6, 'http://brand-shop.net.ua/p34137351-stilnyj-molodezhnyj-kupalnik.html'),
(3636, 6, 6, 'http://brand-shop.net.ua/p34139485-stilnyj-molodezhnyj-kupalnik.html'),
(3637, 6, 6, 'http://brand-shop.net.ua/p34139603-stilnyj-molodezhnyj-kupalnik.html'),
(3638, 6, 6, 'http://brand-shop.net.ua/g2369951-novinki-nashego-magazina/page_5?product_items_per_page=48'),
(3639, 6, 6, 'http://brand-shop.net.ua/p34154737-stilnaya-molodezhnaya-mini.html'),
(3640, 6, 6, 'http://brand-shop.net.ua/p34154915-stilnyj-molodezhnyj-kostyum.html'),
(3641, 6, 6, 'http://brand-shop.net.ua/p34154993-stilnoe-molodezhnoe-plate.html'),
(3642, 6, 6, 'http://brand-shop.net.ua/p34149526-stilnoe-molodezhnoe-plate.html'),
(3643, 6, 6, 'http://brand-shop.net.ua/p34150180-stilnaya-molodezhnaya-tunika.html'),
(3644, 6, 6, 'http://brand-shop.net.ua/p34150255-stilnaya-molodezhnaya-tunika.html'),
(3645, 6, 6, 'http://brand-shop.net.ua/p34150358-stilnoe-molodezhnoe-plate.html'),
(3646, 6, 6, 'http://brand-shop.net.ua/p34150546-stilnoe-molodezhnoe-plate.html'),
(3647, 6, 6, 'http://brand-shop.net.ua/p34150711-stilnoe-molodezhnoe-plate.html'),
(3648, 6, 6, 'http://brand-shop.net.ua/p34151089-stilnoe-molodezhnoe-plate.html'),
(3649, 6, 6, 'http://brand-shop.net.ua/p34151922-stilnoe-molodezhnoe-plate.html'),
(3650, 6, 6, 'http://brand-shop.net.ua/p34152482-stilnaya-molodezhnaya-bluza.html'),
(3651, 6, 6, 'http://brand-shop.net.ua/p34153263-stilnyj-molodezhnyj-kombinezon.html'),
(3652, 6, 6, 'http://brand-shop.net.ua/p34153344-stilnoe-molodezhnoe-plate.html'),
(3653, 6, 6, 'http://brand-shop.net.ua/p31073594-stilnoe-molodezhnoe-plate.html'),
(3654, 6, 6, 'http://brand-shop.net.ua/p34153612-stilnoe-molodezhnoe-plate.html'),
(3655, 6, 6, 'http://brand-shop.net.ua/p34153664-stilnoe-molodezhnoe-plate.html'),
(3656, 6, 6, 'http://brand-shop.net.ua/p34153730-stilnye-molodezhnye-shorty.html'),
(3657, 6, 6, 'http://brand-shop.net.ua/p34153888-stilnaya-zhenskaya-tolstovka.html'),
(3658, 6, 6, 'http://brand-shop.net.ua/p34153926-stilnaya-zhenskaya-tolstovka.html'),
(3659, 6, 6, 'http://brand-shop.net.ua/p34153965-stilnaya-zhenskaya-tolstovka.html'),
(3660, 6, 6, 'http://brand-shop.net.ua/p34154302-stilnaya-zhenskaya-tolstovka.html'),
(3661, 6, 6, 'http://brand-shop.net.ua/p34154494-stilnaya-zhenskaya-tolstovka.html'),
(3662, 6, 6, 'http://brand-shop.net.ua/p34143304-stilnoe-molodezhnoe-plate.html'),
(3663, 6, 6, 'http://brand-shop.net.ua/p34143534-stilnoe-molodezhnoe-plate.html'),
(3664, 6, 6, 'http://brand-shop.net.ua/p34143775-molodezhnyj-stilnyj-pidzhak.html'),
(3665, 6, 6, 'http://brand-shop.net.ua/p34144022-molodezhnyj-stilnyj-pidzhak.html'),
(3666, 6, 6, 'http://brand-shop.net.ua/p34144272-stilnaya-molodezhnaya-tunika.html'),
(3667, 6, 6, 'http://brand-shop.net.ua/p34144840-stilnoe-letnee-plate.html'),
(3668, 6, 6, 'http://brand-shop.net.ua/p34144992-stilnoe-molodezhnoe-plate.html'),
(3669, 6, 6, 'http://brand-shop.net.ua/p34145111-stilnoe-molodezhnoe-plate.html'),
(3670, 6, 6, 'http://brand-shop.net.ua/p34148384-stilnoe-molodezhnoe-plate.html'),
(3671, 6, 6, 'http://brand-shop.net.ua/p34148586-stilnoe-molodezhnoe-plate.html'),
(3672, 6, 6, 'http://brand-shop.net.ua/p34148683-stilnyj-molodezhnyj-kostyum.html'),
(3673, 6, 6, 'http://brand-shop.net.ua/p34148732-stilnoe-molodezhnoe-plate.html'),
(3674, 6, 6, 'http://brand-shop.net.ua/p34148904-stilnoe-molodezhnoe-plate.html'),
(3675, 6, 6, 'http://brand-shop.net.ua/p34148996-stilnoe-molodezhnoe-plate.html'),
(3676, 6, 6, 'http://brand-shop.net.ua/p34149111-stilnyj-molodezhnyj-kombinezon.html'),
(3677, 6, 6, 'http://brand-shop.net.ua/p34149208-stilnoe-molodezhnoe-plate.html'),
(3678, 6, 6, 'http://brand-shop.net.ua/p34144651-stilnaya-molodezhnaya-futbolka.html'),
(3679, 6, 6, 'http://brand-shop.net.ua/p34149332-stilnaya-molodezhnaya-majka.html'),
(3680, 6, 6, 'http://brand-shop.net.ua/p34149418-stilnye-molodezhnye-shorty.html'),
(3681, 6, 6, 'http://brand-shop.net.ua/p34149470-stilnoe-molodezhnoe-plate.html'),
(3682, 6, 6, 'http://brand-shop.net.ua/p19473953-stilnoe-letnee-plate.html'),
(3683, 6, 6, 'http://brand-shop.net.ua/p31815582-stilnyj-molodezhnyj-kostyum.html'),
(3684, 6, 6, 'http://brand-shop.net.ua/p33991111-stilnoe-plate-pol.html'),
(3685, 6, 6, 'http://brand-shop.net.ua/p33991675-stilnoe-plate-mini.html'),
(3686, 6, 6, 'http://brand-shop.net.ua/p33959747-stilnyj-molodezhnyj-kupalnik.html'),
(3687, 6, 6, 'http://brand-shop.net.ua/g2369951-novinki-nashego-magazina/page_6?product_items_per_page=48'),
(3688, 6, 6, 'http://brand-shop.net.ua/p33960120-stilnyj-molodezhnyj-kupalnik.html'),
(3689, 6, 6, 'http://brand-shop.net.ua/p33890916-stilnyj-molodezhnyj-kombinezon.html'),
(3690, 6, 6, 'http://brand-shop.net.ua/p33893634-stilnaya-zhenskaya-rubashka.html'),
(3691, 6, 6, 'http://brand-shop.net.ua/p17906380-stilnoe-molodezhnoe-plate.html'),
(3692, 6, 6, 'http://brand-shop.net.ua/p33894616-stilnoe-molodezhnoe-plate.html'),
(3693, 6, 6, 'http://brand-shop.net.ua/p33947038-stilnoe-molodezhnoe-plate.html'),
(3694, 6, 6, 'http://brand-shop.net.ua/p33947160-stilnoe-molodezhnoe-plate.html'),
(3695, 6, 6, 'http://brand-shop.net.ua/p33947361-stilnoe-molodezhnoe-plate.html'),
(3696, 6, 6, 'http://brand-shop.net.ua/p33947561-stilnoe-molodezhnoe-plate.html'),
(3697, 6, 6, 'http://brand-shop.net.ua/p33947940-stilnoe-molodezhnoe-plate.html'),
(3698, 6, 6, 'http://brand-shop.net.ua/p33948110-stilnoe-molodezhnoe-plate.html'),
(3699, 6, 6, 'http://brand-shop.net.ua/p33951241-stilnyj-molodezhnyj-kupalnik.html'),
(3700, 6, 6, 'http://brand-shop.net.ua/p33888161-stilnoe-molodezhnoe-plate.html'),
(3701, 6, 6, 'http://brand-shop.net.ua/p33889691-stilnyj-molodezhnyj-sarafan.html'),
(3702, 6, 6, 'http://brand-shop.net.ua/p33881392-stilnoe-molodezhnoe-plate.html'),
(3703, 6, 6, 'http://brand-shop.net.ua/p33883782-stilnoe-molodezhnoe-plate.html'),
(3704, 6, 6, 'http://brand-shop.net.ua/p33885998-stilnoe-molodezhnoe-plate.html'),
(3705, 6, 6, 'http://brand-shop.net.ua/p33886185-stilnaya-molodezhnaya-bluza.html'),
(3706, 6, 6, 'http://brand-shop.net.ua/p33887460-stilnaya-molodezhnaya-mini.html'),
(3707, 6, 6, 'http://brand-shop.net.ua/p33889968-stilnoe-molodezhnoe-plate.html'),
(3708, 6, 6, 'http://brand-shop.net.ua/p33890146-stilnoe-molodezhnoe-plate.html'),
(3709, 6, 6, 'http://brand-shop.net.ua/p33782306-stilnoe-molodezhnoe-plate.html'),
(3710, 6, 6, 'http://brand-shop.net.ua/p33782476-stilnoe-molodezhnoe-plate.html');
INSERT INTO `parsemx_links` (`link_id`, `donor_id`, `ins_id`, `url`) VALUES
(3711, 6, 6, 'http://brand-shop.net.ua/p21223351-stilnyj-letnij-kostyum.html'),
(3712, 6, 6, 'http://brand-shop.net.ua/p33813829-stilnoe-letnee-plate.html'),
(3713, 6, 6, 'http://brand-shop.net.ua/p33815917-stilnaya-molodezhnaya-bluzka.html'),
(3714, 6, 6, 'http://brand-shop.net.ua/p33817617-stilnoe-letnee-plate.html'),
(3715, 6, 6, 'http://brand-shop.net.ua/p33819493-stilnoe-letnee-plate.html'),
(3716, 6, 6, 'http://brand-shop.net.ua/p33715916-stilnoe-molodezhnoe-plate.html'),
(3717, 6, 6, 'http://brand-shop.net.ua/p21884626-stilnaya-zhenskaya-tolstovka.html'),
(3718, 6, 6, 'http://brand-shop.net.ua/p33716074-stilnyj-molodezhnyj-kostyum.html'),
(3719, 6, 6, 'http://brand-shop.net.ua/p33716321-stilnoe-molodezhnoe-plate.html'),
(3720, 6, 6, 'http://brand-shop.net.ua/p33716648-stilnoe-molodezhnoe-plate.html'),
(3721, 6, 6, 'http://brand-shop.net.ua/p33717913-stilnaya-molodezhnaya-futbolka.html'),
(3722, 6, 6, 'http://brand-shop.net.ua/p33718136-stilnaya-molodezhnaya-futbolka.html'),
(3723, 6, 6, 'http://brand-shop.net.ua/p33718244-stilnaya-molodezhnaya-futbolka.html'),
(3724, 6, 6, 'http://brand-shop.net.ua/p33718309-stilnoe-molodezhnoe-plate.html'),
(3725, 6, 6, 'http://brand-shop.net.ua/p33718410-zhenskij-sportivnyj-kostyum.html'),
(3726, 6, 6, 'http://brand-shop.net.ua/p33718611-stilnoe-molodezhnoe-plate.html'),
(3727, 6, 6, 'http://brand-shop.net.ua/p17902209-stilnoe-molodezhnoe-plate.html'),
(3728, 6, 6, 'http://brand-shop.net.ua/p33779615-stilnoe-molodezhnoe-plate.html'),
(3729, 6, 6, 'http://brand-shop.net.ua/p33779903-stilnoe-molodezhnoe-plate.html'),
(3730, 6, 6, 'http://brand-shop.net.ua/p33780390-stilnoe-molodezhnoe-plate.html'),
(3731, 6, 6, 'http://brand-shop.net.ua/p33780559-stilnoe-molodezhnoe-plate.html'),
(3732, 6, 6, 'http://brand-shop.net.ua/p33602699-stilnyj-zhenskij-bodi.html'),
(3733, 6, 6, 'http://brand-shop.net.ua/p33602753-stilnaya-molodezhnaya-kurtka.html'),
(3734, 6, 6, 'http://brand-shop.net.ua/p33605354-stilnaya-molodezhnaya-kurtka.html'),
(3735, 6, 6, 'http://brand-shop.net.ua/p33598745-stilnaya-molodezhnaya-rubashka.html'),
(3736, 6, 6, 'http://brand-shop.net.ua/g2369951-novinki-nashego-magazina/page_7?product_items_per_page=48'),
(3737, 6, 6, 'http://brand-shop.net.ua/p33600483-stilnoe-molodezhnoe-plate.html'),
(3738, 6, 6, 'http://brand-shop.net.ua/p33600569-stilnoe-molodezhnoe-plate.html'),
(3739, 6, 6, 'http://brand-shop.net.ua/p33600689-stilnaya-molodezhnaya-mini.html'),
(3740, 6, 6, 'http://brand-shop.net.ua/p33600755-stilnoe-molodezhnoe-plate.html'),
(3741, 6, 6, 'http://brand-shop.net.ua/p33600854-stilnoe-molodezhnoe-plate.html'),
(3742, 6, 6, 'http://brand-shop.net.ua/p33601377-stilnaya-molodezhnaya-majka.html'),
(3743, 6, 6, 'http://brand-shop.net.ua/p33601412-stilnaya-molodezhnaya-majka.html'),
(3744, 6, 6, 'http://brand-shop.net.ua/p33601534-stilnyj-molodezhnyj-kostyum.html'),
(3745, 6, 6, 'http://brand-shop.net.ua/p33601593-stilnyj-molodezhnyj-kostyum.html'),
(3746, 6, 6, 'http://brand-shop.net.ua/p33601643-stilnyj-molodezhnyj-kostyum.html'),
(3747, 6, 6, 'http://brand-shop.net.ua/p33601682-stilnyj-molodezhnyj-kostyum.html'),
(3748, 6, 6, 'http://brand-shop.net.ua/p33601750-stilnyj-zhenskij-bodi.html'),
(3749, 6, 6, 'http://brand-shop.net.ua/p33601809-stilnyj-zhenskij-bodi.html'),
(3750, 6, 6, 'http://brand-shop.net.ua/p33601821-stilnyj-zhenskij-bodi.html'),
(3751, 6, 6, 'http://brand-shop.net.ua/p33601838-stilnyj-zhenskij-bodi.html'),
(3752, 6, 6, 'http://brand-shop.net.ua/p33601871-stilnoe-molodezhnoe-plate.html'),
(3753, 6, 6, 'http://brand-shop.net.ua/p33602037-stilnaya-zhenskaya-tolstovka.html'),
(3754, 6, 6, 'http://brand-shop.net.ua/p33602121-stilnyj-zhenskij-bodi.html'),
(3755, 6, 6, 'http://brand-shop.net.ua/p33602288-stilnyj-zhenskij-bodi.html'),
(3756, 6, 6, 'http://brand-shop.net.ua/p33602382-stilnoe-molodezhnoe-plate.html'),
(3757, 6, 6, 'http://brand-shop.net.ua/p33602413-stilnaya-molodezhnaya-bluzka.html'),
(3758, 6, 6, 'http://brand-shop.net.ua/p33546650-stilnyj-molodezhnyj-kostyum.html'),
(3759, 6, 6, 'http://brand-shop.net.ua/p33547663-stilnyj-molodezhnyj-kostyum.html'),
(3760, 6, 6, 'http://brand-shop.net.ua/p33547843-stilnye-molodezhnye-losiny.html'),
(3761, 6, 6, 'http://brand-shop.net.ua/p33548654-zhenskie-molodezhnye-shtany.html'),
(3762, 6, 6, 'http://brand-shop.net.ua/p33593517-zhenskie-molodezhnye-shtany.html'),
(3763, 6, 6, 'http://brand-shop.net.ua/p33594322-stilnyj-molodezhnyj-kombinezon.html'),
(3764, 6, 6, 'http://brand-shop.net.ua/p33595182-stilnyj-molodezhnyj-kombinezon.html'),
(3765, 6, 6, 'http://brand-shop.net.ua/p33596807-stilnyj-molodezhnyj-kostyum.html'),
(3766, 6, 6, 'http://brand-shop.net.ua/p33597500-stilnye-molodezhnye-shorty.html'),
(3767, 6, 6, 'http://brand-shop.net.ua/p19826729-stilnyj-molodezhnyj-kombinezon.html'),
(3768, 6, 6, 'http://brand-shop.net.ua/p33533549-stilnyj-molodezhnyj-kupalnik.html'),
(3769, 6, 6, 'http://brand-shop.net.ua/p33534380-stilnoe-molodezhnoe-plate.html'),
(3770, 6, 6, 'http://brand-shop.net.ua/p33534470-stilnoe-molodezhnoe-plate.html'),
(3771, 6, 6, 'http://brand-shop.net.ua/p33535024-stilnyj-molodezhnyj-kostyum.html'),
(3772, 6, 6, 'http://brand-shop.net.ua/p33535580-zhenskij-sportivnyj-kostyum.html'),
(3773, 6, 6, 'http://brand-shop.net.ua/p33537210-stilnoe-molodezhnoe-plate.html'),
(3774, 6, 6, 'http://brand-shop.net.ua/p33537481-stilnoe-molodezhnoe-plate.html'),
(3775, 6, 6, 'http://brand-shop.net.ua/p33472274-stilnoe-molodezhnoe-plate.html'),
(3776, 6, 6, 'http://brand-shop.net.ua/p33472506-stilnoe-molodezhnoe-plate.html'),
(3777, 6, 6, 'http://brand-shop.net.ua/p33487300-stilnyj-molodezhnyj-kupalnik.html'),
(3778, 6, 6, 'http://brand-shop.net.ua/p33466599-stilnoe-molodezhnoe-plate.html'),
(3779, 6, 6, 'http://brand-shop.net.ua/p33467468-stilnoe-molodezhnoe-plate.html'),
(3780, 6, 6, 'http://brand-shop.net.ua/p33467604-stilnoe-kashemirovoe-palto.html'),
(3781, 6, 6, 'http://brand-shop.net.ua/p33467807-stilnoe-molodezhnoe-plate.html'),
(3782, 6, 6, 'http://brand-shop.net.ua/p33458785-stilnaya-zhenskaya-rubashka.html'),
(3783, 6, 6, 'http://brand-shop.net.ua/p33458890-stilnaya-zhenskaya-rubashka.html'),
(3784, 6, 6, 'http://brand-shop.net.ua/p33458974-stilnaya-molodezhnaya-mini.html'),
(3785, 6, 6, 'http://brand-shop.net.ua/g2369951-novinki-nashego-magazina/page_8?product_items_per_page=48'),
(3786, 6, 6, 'http://brand-shop.net.ua/p33459105-stilnaya-zhenskaya-rubashka.html'),
(3787, 6, 6, 'http://brand-shop.net.ua/p33459290-stilnye-molodezhnye-shorty.html'),
(3788, 6, 6, 'http://brand-shop.net.ua/p21361796-molodezhnyj-stilnyj-pidzhak.html'),
(3789, 6, 6, 'http://brand-shop.net.ua/p21884852-molodezhnye-stilnye-bryuchki.html'),
(3790, 6, 6, 'http://brand-shop.net.ua/p33466072-stilnyj-molodezhnyj-kostyum.html'),
(3791, 6, 6, 'http://brand-shop.net.ua/p33401413-zhenskij-sportivnyj-kostyum.html'),
(3792, 6, 6, 'http://brand-shop.net.ua/p33403358-stilnoe-molodezhnoe-plate.html'),
(3793, 6, 6, 'http://brand-shop.net.ua/p33403466-stilnoe-molodezhnoe-plate.html'),
(3794, 6, 6, 'http://brand-shop.net.ua/p33403952-stilnoe-molodezhnoe-plate.html'),
(3795, 6, 6, 'http://brand-shop.net.ua/p33406983-stilnoe-molodezhnoe-plate.html'),
(3796, 6, 6, 'http://brand-shop.net.ua/p33407027-stilnoe-molodezhnoe-plate.html'),
(3797, 6, 6, 'http://brand-shop.net.ua/p33407167-stilnaya-zhenskaya-kofta.html'),
(3798, 6, 6, 'http://brand-shop.net.ua/p33407382-stilnoe-molodezhnoe-plate.html'),
(3799, 6, 6, 'http://brand-shop.net.ua/p33407529-stilnoe-molodezhnoe-plate.html'),
(3800, 6, 6, 'http://brand-shop.net.ua/p33407918-zhenskij-stilnyj-kostyum.html'),
(3801, 6, 6, 'http://brand-shop.net.ua/p33408130-stilnaya-futbolka-olen.html'),
(3802, 6, 6, 'http://brand-shop.net.ua/p33408355-stilnaya-molodezhnaya-mini.html'),
(3803, 6, 6, 'http://brand-shop.net.ua/p33400566-modnaya-zhenskaya-bluza.html'),
(3804, 6, 6, 'http://brand-shop.net.ua/p33401258-stilnaya-molodezhnaya-mini.html'),
(3805, 6, 6, 'http://brand-shop.net.ua/p33401562-zhenskij-sportivnyj-kostyum.html'),
(3806, 6, 6, 'http://brand-shop.net.ua/p33401768-stilnoe-molodezhnoe-plate.html'),
(3807, 6, 6, 'http://brand-shop.net.ua/p33401970-stilnoe-molodezhnoe-plate.html'),
(3808, 6, 6, 'http://brand-shop.net.ua/p33402127-stilnoe-molodezhnoe-plate.html'),
(3809, 6, 6, 'http://brand-shop.net.ua/p33402282-stilnoe-molodezhnoe-plate.html'),
(3810, 6, 6, 'http://brand-shop.net.ua/p33402413-stilnoe-molodezhnoe-plate.html'),
(3811, 6, 6, 'http://brand-shop.net.ua/p33402988-stilnoe-molodezhnoe-plate.html'),
(3812, 6, 6, 'http://brand-shop.net.ua/p33403106-stilnoe-molodezhnoe-plate.html'),
(3813, 6, 6, 'http://brand-shop.net.ua/p18311205-stilnoe-modnoe-plate.html'),
(3814, 6, 6, 'http://brand-shop.net.ua/p18311354-stilnoe-plate-pol.html'),
(3815, 6, 6, 'http://brand-shop.net.ua/p32779559-stilnoe-molodezhnoe-plate.html'),
(3816, 6, 6, 'http://brand-shop.net.ua/p32777551-stilnoe-molodezhnoe-plate.html'),
(3817, 6, 6, 'http://brand-shop.net.ua/p32777663-stilnoe-molodezhnoe-plate.html'),
(3818, 6, 6, 'http://brand-shop.net.ua/p32777712-stilnoe-molodezhnoe-plate.html'),
(3819, 6, 6, 'http://brand-shop.net.ua/p32777771-stilnoe-molodezhnoe-plate.html'),
(3820, 6, 6, 'http://brand-shop.net.ua/p32777868-stilnoe-molodezhnoe-plate.html'),
(3821, 6, 6, 'http://brand-shop.net.ua/p32778174-stilnoe-molodezhnoe-plate.html'),
(3822, 6, 6, 'http://brand-shop.net.ua/p32778213-stilnoe-molodezhnoe-plate.html'),
(3823, 6, 6, 'http://brand-shop.net.ua/p32778272-stilnoe-molodezhnoe-plate.html'),
(3824, 6, 6, 'http://brand-shop.net.ua/p32779191-stilnoe-molodezhnoe-plate.html'),
(3825, 6, 6, 'http://brand-shop.net.ua/p32779503-stilnoe-molodezhnoe-plate.html'),
(3826, 6, 6, 'http://brand-shop.net.ua/p21558345-stilnoe-leto-osen.html'),
(3827, 6, 6, 'http://brand-shop.net.ua/p32766159-stilnoe-molodezhnoe-plate.html'),
(3828, 6, 6, 'http://brand-shop.net.ua/p32766204-stilnaya-zhenskaya-tolstovka.html'),
(3829, 6, 6, 'http://brand-shop.net.ua/p32776944-stilnoe-molodezhnoe-plate.html'),
(3830, 6, 6, 'http://brand-shop.net.ua/p32766304-stilnoe-plate-pol.html'),
(3831, 6, 6, 'http://brand-shop.net.ua/p32777017-stilnoe-plate-pol.html'),
(3832, 6, 6, 'http://brand-shop.net.ua/p32777070-stilnyj-molodezhnyj-kostyum.html'),
(3833, 6, 6, 'http://brand-shop.net.ua/p32765546-molodezhnyj-stilnyj-pidzhak.html'),
(3834, 6, 6, 'http://brand-shop.net.ua/g2369951-novinki-nashego-magazina/page_9?product_items_per_page=48'),
(3835, 6, 6, 'http://brand-shop.net.ua/p32727330-stilnoe-molodezhnoe-plate.html'),
(3836, 6, 6, 'http://brand-shop.net.ua/p32727351-stilnoe-molodezhnoe-plate.html'),
(3837, 6, 6, 'http://brand-shop.net.ua/p32727205-stilnyj-letnij-sarafan.html'),
(3838, 6, 6, 'http://brand-shop.net.ua/p32727224-stilnyj-letnij-sarafan.html'),
(3839, 6, 6, 'http://brand-shop.net.ua/p32727238-stilnyj-letnij-sarafan.html'),
(3840, 6, 6, 'http://brand-shop.net.ua/p32727245-stilnyj-letnij-sarafan.html'),
(3841, 6, 6, 'http://brand-shop.net.ua/p32727271-stilnyj-letnij-sarafan.html'),
(3842, 6, 6, 'http://brand-shop.net.ua/p32727280-stilnyj-letnij-sarafan.html'),
(3843, 6, 6, 'http://brand-shop.net.ua/p17782971-stilnyj-letnij-sarafan.html'),
(3844, 6, 6, 'http://brand-shop.net.ua/p32699812-stilnyj-molodezhnyj-kombinezon.html'),
(3845, 6, 6, 'http://brand-shop.net.ua/p32699829-stilnyj-molodezhnyj-kombinezon.html'),
(3846, 6, 6, 'http://brand-shop.net.ua/p32697186-stilnoe-molodezhnoe-plate.html'),
(3847, 6, 6, 'http://brand-shop.net.ua/p32693611-stilnoe-molodezhnoe-plate.html'),
(3848, 6, 6, 'http://brand-shop.net.ua/p32693742-stilnoe-molodezhnoe-plate.html'),
(3849, 6, 6, 'http://brand-shop.net.ua/p32694417-stilnoe-molodezhnoe-plate.html'),
(3850, 6, 6, 'http://brand-shop.net.ua/p17798637-stilnoe-molodezhnoe-plate.html'),
(3851, 6, 6, 'http://brand-shop.net.ua/p32694702-stilnoe-molodezhnoe-plate.html'),
(3852, 6, 6, 'http://brand-shop.net.ua/p32695230-stilnoe-molodezhnoe-plate.html'),
(3853, 6, 6, 'http://brand-shop.net.ua/p32628703-stilnoe-molodezhnoe-plate.html'),
(3854, 6, 6, 'http://brand-shop.net.ua/p32636878-stilnoe-molodezhnoe-plate.html'),
(3855, 6, 6, 'http://brand-shop.net.ua/p32636962-stilnoe-molodezhnoe-plate.html'),
(3856, 6, 6, 'http://brand-shop.net.ua/p32639916-stilnoe-molodezhnoe-plate.html'),
(3857, 6, 6, 'http://brand-shop.net.ua/p32640033-stilnoe-molodezhnoe-plate.html'),
(3858, 6, 6, 'http://brand-shop.net.ua/p32692097-stilnoe-molodezhnoe-plate.html'),
(3859, 6, 6, 'http://brand-shop.net.ua/p32692275-stilnoe-molodezhnoe-plate.html'),
(3860, 6, 6, 'http://brand-shop.net.ua/p32692857-stilnoe-plate-pol.html'),
(3861, 6, 6, 'http://brand-shop.net.ua/p17784711-stilnoe-molodezhnoe-plate.html'),
(3862, 6, 6, 'http://brand-shop.net.ua/p17795180-stilnoe-plate-mini.html'),
(3863, 6, 6, 'http://brand-shop.net.ua/p32566481-stilnoe-molodezhnoe-plate.html'),
(3864, 6, 6, 'http://brand-shop.net.ua/p32566566-stilnoe-plate-pol.html'),
(3865, 6, 6, 'http://brand-shop.net.ua/p32567548-stilnoe-molodezhnoe-plate.html'),
(3866, 6, 6, 'http://brand-shop.net.ua/p32565320-stilnaya-molodezhnaya-yubka.html'),
(3867, 6, 6, 'http://brand-shop.net.ua/p32567415-stilnoe-molodezhnoe-plate.html'),
(3868, 6, 6, 'http://brand-shop.net.ua/p32567325-stilnoe-molodezhnoe-plate.html'),
(3869, 6, 6, 'http://brand-shop.net.ua/p32566762-stilnoe-molodezhnoe-plate.html'),
(3870, 6, 6, 'http://brand-shop.net.ua/p32564105-stilnyj-molodezhnyj-kostyum.html'),
(3871, 6, 6, 'http://brand-shop.net.ua/p30994951-stilnoe-molodezhnoe-plate.html'),
(3872, 6, 6, 'http://brand-shop.net.ua/p30999885-stilnyj-molodezhnyj-kostyum.html'),
(3873, 6, 6, 'http://brand-shop.net.ua/p17824627-stilnyj-delovoj-sarafan.html'),
(3874, 6, 6, 'http://brand-shop.net.ua/p32202442-stilnye-molodezhnye-losiny.html'),
(3875, 6, 6, 'http://brand-shop.net.ua/p32563435-stilnoe-molodezhnoe-plate.html'),
(3876, 6, 6, 'http://brand-shop.net.ua/p32563353-stilnoe-molodezhnoe-plate.html'),
(3877, 6, 6, 'http://brand-shop.net.ua/p32563236-stilnoe-molodezhnoe-plate.html'),
(3878, 6, 6, 'http://brand-shop.net.ua/p32562973-stilnoe-molodezhnoe-plate.html'),
(3879, 6, 6, 'http://brand-shop.net.ua/p32562708-stilnoe-molodezhnoe-plate.html'),
(3880, 6, 6, 'http://brand-shop.net.ua/p32562852-stilnoe-molodezhnoe-plate.html'),
(3881, 6, 6, 'http://brand-shop.net.ua/p32560197-stilnoe-molodezhnoe-plate.html'),
(3882, 6, 6, 'http://brand-shop.net.ua/p32560013-stilnoe-molodezhnoe-plate.html'),
(3883, 6, 6, 'http://brand-shop.net.ua/g2369951-novinki-nashego-magazina/page_10?product_items_per_page=48'),
(3884, 6, 6, 'http://brand-shop.net.ua/p32558899-stilnoe-molodezhnoe-plate.html'),
(3885, 6, 6, 'http://brand-shop.net.ua/p32558314-stilnoe-molodezhnoe-plate.html'),
(3886, 6, 6, 'http://brand-shop.net.ua/p32558239-stilnoe-molodezhnoe-plate.html'),
(3887, 6, 6, 'http://brand-shop.net.ua/p32557391-stilnaya-uteplennaya-muzhskaya.html'),
(3888, 6, 6, 'http://brand-shop.net.ua/p32556946-stilnoe-molodezhnoe-plate.html'),
(3889, 6, 6, 'http://brand-shop.net.ua/p32556865-stilnoe-molodezhnoe-plate.html'),
(3890, 6, 6, 'http://brand-shop.net.ua/p32556813-stilnoe-molodezhnoe-plate.html'),
(3891, 6, 6, 'http://brand-shop.net.ua/p32555839-stilnoe-molodezhnoe-plate.html'),
(3892, 6, 6, 'http://brand-shop.net.ua/p32555563-stilnoe-molodezhnoe-plate.html'),
(3893, 6, 6, 'http://brand-shop.net.ua/p32384805-modnaya-zhenskaya-rubashka.html'),
(3894, 6, 6, 'http://brand-shop.net.ua/p32386264-modnaya-zhenskaya-rubashka.html'),
(3895, 6, 6, 'http://brand-shop.net.ua/p32554966-modnaya-zhenskaya-rubashka.html'),
(3896, 6, 6, 'http://brand-shop.net.ua/p32358726-modnaya-zhenskaya-rubashka.html'),
(3897, 6, 6, 'http://brand-shop.net.ua/p32385093-stilnoe-molodezhnoe-plate.html'),
(3898, 6, 6, 'http://brand-shop.net.ua/p32385069-stilnyj-molodezhnyj-kostyum.html'),
(3899, 6, 6, 'http://brand-shop.net.ua/p32384988-stilnoe-molodezhnoe-plate.html'),
(3900, 6, 6, 'http://brand-shop.net.ua/p32384899-stilnoe-molodezhnoe-plate.html'),
(3901, 6, 6, 'http://brand-shop.net.ua/p32382730-stilnoe-molodezhnoe-plate.html'),
(3902, 6, 6, 'http://brand-shop.net.ua/p32382624-stilnoe-molodezhnoe-plate.html'),
(3903, 6, 6, 'http://brand-shop.net.ua/p32382600-stilnoe-molodezhnoe-plate.html'),
(3904, 6, 6, 'http://brand-shop.net.ua/p32357215-stilnaya-molodezhnaya-kurtka.html'),
(3905, 6, 6, 'http://brand-shop.net.ua/p32215471-stilnaya-molodezhnaya-kurtka.html'),
(3906, 6, 6, 'http://brand-shop.net.ua/p32348645-stilnaya-molodezhnaya-kurtka.html'),
(3907, 6, 6, 'http://brand-shop.net.ua/p32215441-stilnaya-molodezhnaya-kurtka.html'),
(3908, 6, 6, 'http://brand-shop.net.ua/p32215391-stilnaya-molodezhnaya-kurtka.html'),
(3909, 6, 6, 'http://brand-shop.net.ua/p32215587-stilnaya-molodezhnaya-kurtka.html'),
(3910, 6, 6, 'http://brand-shop.net.ua/p32355431-stilnaya-molodezhnaya-kurtka.html'),
(3911, 6, 6, 'http://brand-shop.net.ua/p32355083-stilnaya-molodezhnaya-kurtka.html'),
(3912, 6, 6, 'http://brand-shop.net.ua/p32348710-stilnaya-molodezhnaya-kurtka.html'),
(3913, 6, 6, 'http://brand-shop.net.ua/p32215505-stilnaya-molodezhnaya-kurtka.html'),
(3914, 6, 6, 'http://brand-shop.net.ua/p32357661-stilnoe-molodezhnoe-plate.html'),
(3915, 6, 6, 'http://brand-shop.net.ua/p32210320-stilnoe-molodezhnoe-plate.html'),
(3916, 6, 6, 'http://brand-shop.net.ua/p32210005-stilnyj-molodezhnyj-kostyum.html'),
(3917, 6, 6, 'http://brand-shop.net.ua/p32209883-stilnoe-molodezhnoe-plate.html'),
(3918, 6, 6, 'http://brand-shop.net.ua/p32209748-stilnyj-molodezhnyj-kostyum.html'),
(3919, 6, 6, 'http://brand-shop.net.ua/p32209502-stilnoe-molodezhnoe-plate.html'),
(3920, 6, 6, 'http://brand-shop.net.ua/p32209455-stilnoe-molodezhnoe-plate.html'),
(3921, 6, 6, 'http://brand-shop.net.ua/p32209164-stilnoe-molodezhnoe-plate.html'),
(3922, 6, 6, 'http://brand-shop.net.ua/p32209074-stilnoe-molodezhnoe-plate.html'),
(3923, 6, 6, 'http://brand-shop.net.ua/p32208450-stilnoe-molodezhnoe-plate.html'),
(3924, 6, 6, 'http://brand-shop.net.ua/p32208344-stilnoe-molodezhnoe-plate.html'),
(3925, 6, 6, 'http://brand-shop.net.ua/p32208262-stilnoe-molodezhnoe-plate.html'),
(3926, 6, 6, 'http://brand-shop.net.ua/p32208029-stilnye-molodezhnye-losiny.html'),
(3927, 6, 6, 'http://brand-shop.net.ua/p32207292-stilnye-molodezhnye-losiny.html'),
(3928, 6, 6, 'http://brand-shop.net.ua/p32206702-stilnye-molodezhnye-losiny.html'),
(3929, 6, 6, 'http://brand-shop.net.ua/p32205172-stilnye-molodezhnye-bryuchki.html'),
(3930, 6, 6, 'http://brand-shop.net.ua/p32362870-stilnaya-molodezhnaya-kurtka.html'),
(3931, 6, 6, 'http://brand-shop.net.ua/p32133472-stilnaya-uteplennaya-detskaya.html'),
(3932, 6, 6, 'http://brand-shop.net.ua/g2369951-novinki-nashego-magazina/page_11?product_items_per_page=48'),
(3933, 6, 6, 'http://brand-shop.net.ua/p32133291-stilnoe-detskoe-platitse.html'),
(3934, 6, 6, 'http://brand-shop.net.ua/p32133143-stilnoe-detskoe-platitse.html'),
(3935, 6, 6, 'http://brand-shop.net.ua/p32126720-stilnoe-detskoe-platitse.html'),
(3936, 6, 6, 'http://brand-shop.net.ua/p32133914-zhenskij-velyurovyj-sportivnyj.html'),
(3937, 6, 6, 'http://brand-shop.net.ua/p32357942-stilnoe-molodezhnoe-plate.html'),
(3938, 6, 6, 'http://brand-shop.net.ua/p32358346-stilnoe-molodezhnoe-plate.html'),
(3939, 6, 6, 'http://brand-shop.net.ua/p32358903-zhenskij-molodezhnyj-sportivnyj.html'),
(3940, 6, 6, 'http://brand-shop.net.ua/p32362137-zhenskij-molodezhnyj-sportivnyj.html'),
(3941, 6, 6, 'http://brand-shop.net.ua/p32362175-stilnaya-zhenskaya-tolstovka.html'),
(3942, 6, 6, 'http://brand-shop.net.ua/p32362402-stilnaya-zhenskaya-tolstovka.html'),
(3943, 6, 6, 'http://brand-shop.net.ua/p32133740-zhenskij-velyurovyj-sportivnyj.html'),
(3944, 6, 6, 'http://brand-shop.net.ua/p32133581-detskij-sportivnyj-kostyum.html'),
(3945, 6, 6, 'http://brand-shop.net.ua/p32362425-stilnyj-molodezhnyj-kostyum.html'),
(3946, 6, 6, 'http://brand-shop.net.ua/p32492525-stilnyj-molodezhnyj-korset.html'),
(3947, 6, 6, 'http://brand-shop.net.ua/p32492078-stilnoe-molodezhnoe-plate.html'),
(3948, 6, 6, 'http://brand-shop.net.ua/p32492317-stilnoe-molodezhnoe-plate.html'),
(3949, 6, 6, 'http://brand-shop.net.ua/p32492156-stilnoe-molodezhnoe-plate.html'),
(3950, 6, 6, 'http://brand-shop.net.ua/p32491990-stilnoe-molodezhnoe-plate.html'),
(3951, 6, 6, 'http://brand-shop.net.ua/p32491879-stilnoe-plate-pol.html'),
(3952, 6, 6, 'http://brand-shop.net.ua/p32490991-stilnoe-molodezhnoe-plate.html'),
(3953, 6, 6, 'http://brand-shop.net.ua/p32490428-stilnoe-molodezhnoe-plate.html'),
(3954, 6, 6, 'http://brand-shop.net.ua/p32489972-stilnyj-molodezhnyj-kostyum.html'),
(3955, 6, 6, 'http://brand-shop.net.ua/p32358753-modnaya-zhenskaya-rubashka.html'),
(3956, 6, 6, 'http://brand-shop.net.ua/p32206892-stilnyj-molodezhnyj-kostyum.html'),
(3957, 6, 6, 'http://brand-shop.net.ua/p32386399-stilnyj-molodezhnyj-golf.html'),
(3958, 6, 6, 'http://brand-shop.net.ua/p32209349-stilnoe-molodezhnoe-plate.html'),
(3959, 6, 6, 'http://brand-shop.net.ua/p32386536-stilnaya-zhenskaya-kofta.html'),
(3960, 6, 6, 'http://brand-shop.net.ua/p32386507-stilnaya-zhenskaya-kofta.html'),
(3961, 6, 6, 'http://brand-shop.net.ua/p32385171-stilnoe-plate-pol.html'),
(3962, 6, 6, 'http://brand-shop.net.ua/p32127567-stilnoe-detskoe-platitse.html'),
(3963, 6, 6, 'http://brand-shop.net.ua/p18410795-molodezhnyj-stilnyj-letnij.html'),
(3964, 6, 6, 'http://brand-shop.net.ua/p31905464-molodezhnaya-kofta-chernaya.html'),
(3965, 6, 6, 'http://brand-shop.net.ua/p31976688-stilnyj-molodezhnyj-kostyum.html'),
(3966, 6, 6, 'http://brand-shop.net.ua/p31976604-stilnoe-molodezhnoe-plate.html'),
(3967, 6, 6, 'http://brand-shop.net.ua/p31976988-stilnoe-molodezhnoe-plate.html'),
(3968, 6, 6, 'http://brand-shop.net.ua/p31977304-stilnoe-molodezhnoe-plate.html'),
(3969, 6, 6, 'http://brand-shop.net.ua/p31905136-stilnaya-zhenskaya-tolstovka.html'),
(3970, 6, 6, 'http://brand-shop.net.ua/p32067981-stilnoe-plate-pol.html'),
(3971, 6, 6, 'http://brand-shop.net.ua/p32068531-stilnoe-molodezhnoe-plate.html'),
(3972, 6, 6, 'http://brand-shop.net.ua/p32069541-stilnoe-molodezhnoe-plate.html'),
(3973, 6, 6, 'http://brand-shop.net.ua/p32070215-stilnoe-molodezhnoe-plate.html'),
(3974, 6, 6, 'http://brand-shop.net.ua/p19930925-stilnoe-letnee-plate.html'),
(3975, 6, 6, 'http://brand-shop.net.ua/p18618664-stilnoe-molodezhnoe-plate.html'),
(3976, 6, 6, 'http://brand-shop.net.ua/p17783082-stilnoe-plate-goloj.html'),
(3977, 6, 6, 'http://brand-shop.net.ua/p18618765-stilnoe-molodezhnoe-plate.html'),
(3978, 6, 6, 'http://brand-shop.net.ua/p18917589-stilnoe-molodezhnoe-plate.html'),
(3979, 6, 6, 'http://brand-shop.net.ua/p18618720-stilnoe-molodezhnoe-plate.html'),
(3980, 6, 6, 'http://brand-shop.net.ua/p18618856-stilnyj-letnij-sarafan.html'),
(3981, 6, 6, 'http://brand-shop.net.ua/g2369951-novinki-nashego-magazina/page_12?product_items_per_page=48'),
(3982, 6, 6, 'http://brand-shop.net.ua/p31873850-stilnaya-molodezhnaya-majka.html'),
(3983, 6, 6, 'http://brand-shop.net.ua/p31874518-stilnyj-molodezhnyj-kostyum.html'),
(3984, 6, 6, 'http://brand-shop.net.ua/p31882462-stilnoe-molodezhnoe-plate.html'),
(3985, 6, 6, 'http://brand-shop.net.ua/p31882212-stilnoe-molodezhnoe-plate.html'),
(3986, 6, 6, 'http://brand-shop.net.ua/p31882152-stilnyj-molodezhnyj-kostyum.html'),
(3987, 6, 6, 'http://brand-shop.net.ua/p31882008-stilnoe-molodezhnoe-plate.html'),
(3988, 6, 6, 'http://brand-shop.net.ua/p30695949-stilnoe-molodezhnoe-plate.html'),
(3989, 6, 6, 'http://brand-shop.net.ua/p31881337-stilnoe-molodezhnoe-plate.html'),
(3990, 6, 6, 'http://brand-shop.net.ua/p31881175-stilnoe-molodezhnoe-plate.html'),
(3991, 6, 6, 'http://brand-shop.net.ua/p31880320-stilnoe-molodezhnoe-plate.html'),
(3992, 6, 6, 'http://brand-shop.net.ua/p31879391-stilnoe-molodezhnoe-plate.html'),
(3993, 6, 6, 'http://brand-shop.net.ua/p31879330-stilnoe-molodezhnoe-plate.html'),
(3994, 6, 6, 'http://brand-shop.net.ua/p31876900-stilnoe-molodezhnoe-plate.html'),
(3995, 6, 6, 'http://brand-shop.net.ua/p31874808-stilnaya-molodezhnaya-tunika.html'),
(3996, 6, 6, 'http://brand-shop.net.ua/p31874392-stilnoe-molodezhnoe-plate.html'),
(3997, 6, 6, 'http://brand-shop.net.ua/p31874310-stilnaya-molodezhnaya-majka.html'),
(3998, 6, 6, 'http://brand-shop.net.ua/p31874062-stilnaya-molodezhnaya-majka.html'),
(3999, 6, 6, 'http://brand-shop.net.ua/p31873764-stilnaya-molodezhnaya-majka.html'),
(4000, 6, 6, 'http://brand-shop.net.ua/p31871520-stilnaya-molodezhnaya-majka.html'),
(4001, 6, 6, 'http://brand-shop.net.ua/p31870408-stilnaya-molodezhnaya-majka.html'),
(4002, 6, 6, 'http://brand-shop.net.ua/p31869181-stilnaya-molodezhnaya-majka.html'),
(4003, 6, 6, 'http://brand-shop.net.ua/p31868377-stilnaya-molodezhnaya-majka.html'),
(4004, 6, 6, 'http://brand-shop.net.ua/p31868326-stilnaya-molodezhnaya-majka.html'),
(4005, 6, 6, 'http://brand-shop.net.ua/p31868123-stilnaya-molodezhnaya-majka.html'),
(4006, 6, 6, 'http://brand-shop.net.ua/p31868182-stilnaya-molodezhnaya-majka.html'),
(4007, 6, 6, 'http://brand-shop.net.ua/p31867831-stilnaya-molodezhnaya-majka.html'),
(4008, 6, 6, 'http://brand-shop.net.ua/p31867710-stilnaya-molodezhnaya-majka.html'),
(4009, 6, 6, 'http://brand-shop.net.ua/p31824444-stilnaya-molodezhnaya-majka.html'),
(4010, 6, 6, 'http://brand-shop.net.ua/p31824403-stilnye-molodezhnye-shtanishki.html'),
(4011, 6, 6, 'http://brand-shop.net.ua/p17902877-stilnaya-molodezhnaya-majka.html'),
(4012, 6, 6, 'http://brand-shop.net.ua/p31820928-stilnoe-molodezhnoe-plate.html'),
(4013, 6, 6, 'http://brand-shop.net.ua/p31821134-stilnoe-molodezhnoe-plate.html'),
(4014, 6, 6, 'http://brand-shop.net.ua/p31820518-stilnoe-molodezhnoe-plate.html'),
(4015, 6, 6, 'http://brand-shop.net.ua/p31820729-stilnoe-molodezhnoe-plate.html'),
(4016, 6, 6, 'http://brand-shop.net.ua/p31820570-stilnoe-molodezhnoe-plate.html'),
(4017, 6, 6, 'http://brand-shop.net.ua/p31820414-stilnoe-molodezhnoe-plate.html'),
(4018, 6, 6, 'http://brand-shop.net.ua/p31820379-stilnoe-molodezhnoe-plate.html'),
(4019, 6, 6, 'http://brand-shop.net.ua/p31820352-stilnaya-zhenskaya-tolstovka.html'),
(4020, 6, 6, 'http://brand-shop.net.ua/p31820191-stilnyj-molodezhnyj-kostyum.html'),
(4021, 6, 6, 'http://brand-shop.net.ua/p31820115-stilnaya-molodezhnaya-yubka.html'),
(4022, 6, 6, 'http://brand-shop.net.ua/p31750985-stilnaya-zhenskaya-tolstovka.html'),
(4023, 6, 6, 'http://brand-shop.net.ua/p31750937-stilnaya-zhenskaya-tolstovka.html'),
(4024, 6, 6, 'http://brand-shop.net.ua/p31750819-stilnaya-zhenskaya-tolstovka.html'),
(4025, 6, 6, 'http://brand-shop.net.ua/p31753032-stilnoe-molodezhnoe-plate.html'),
(4026, 6, 6, 'http://brand-shop.net.ua/p31752988-stilnoe-molodezhnoe-plate.html'),
(4027, 6, 6, 'http://brand-shop.net.ua/p31752059-stilnoe-molodezhnoe-plate.html'),
(4028, 6, 6, 'http://brand-shop.net.ua/p31750443-stilnoe-molodezhnoe-plate.html'),
(4029, 6, 6, 'http://brand-shop.net.ua/p31750227-stilnaya-molodezhnaya-kurtka.html'),
(4030, 6, 6, 'http://brand-shop.net.ua'),
(4031, 6, 6, 'http://brand-shop.net.ua/p19912531-stilnoe-letnee-plate.html'),
(4032, 6, 6, 'http://brand-shop.net.ua/p31752131-stilnaya-zhenskaya-kofta.html'),
(4033, 6, 6, 'http://brand-shop.net.ua/p31751969-stilnaya-zhenskaya-tolstovka.html'),
(4034, 6, 6, 'http://brand-shop.net.ua/p31751953-stilnaya-zhenskaya-tolstovka.html'),
(4035, 6, 6, 'http://brand-shop.net.ua/p19912542-stilnoe-letnee-plate.html'),
(4036, 6, 6, 'http://brand-shop.net.ua/p31744880-stilnoe-detskoe-platitse.html'),
(4037, 6, 6, 'http://brand-shop.net.ua/p31747553-stilnoe-molodezhnoe-plate.html'),
(4038, 6, 6, 'http://brand-shop.net.ua/p31743718-stilnoe-detskoe-platitse.html'),
(4039, 6, 6, 'http://brand-shop.net.ua/p31745090-stilnoe-molodezhnoe-plate.html'),
(4040, 6, 6, 'http://brand-shop.net.ua/p31746928-stilnoe-plate-pol.html'),
(4041, 6, 6, 'http://brand-shop.net.ua/p31747985-stilnyj-zhenskij-bodi.html'),
(4042, 6, 6, 'http://brand-shop.net.ua/p31746396-stilnoe-molodezhnoe-plate.html'),
(4043, 6, 6, 'http://brand-shop.net.ua/p31746230-stilnoe-molodezhnoe-plate.html'),
(4044, 6, 6, 'http://brand-shop.net.ua/p31745205-stilnoe-molodezhnoe-plate.html'),
(4045, 6, 6, 'http://brand-shop.net.ua/p31742191-stilnye-molodezhnye-losiny.html'),
(4046, 6, 6, 'http://brand-shop.net.ua/p31697322-stilnyj-molodezhnyj-kostyum.html'),
(4047, 6, 6, 'http://brand-shop.net.ua/p25633744-stilnye-zhenskie-unty.html'),
(4048, 6, 6, 'http://brand-shop.net.ua/p23332453-stilnye-molodezhnye-tapulki.html'),
(4049, 6, 6, 'http://brand-shop.net.ua/p23332764-stilnye-molodezhnye-tapulki.html'),
(4050, 6, 6, 'http://brand-shop.net.ua/p19519964-stilnyj-molodezhnyj-kombinezon.html'),
(4051, 6, 6, 'http://brand-shop.net.ua/p20507785-stilnoe-plate-shifon.html'),
(4052, 6, 6, 'http://brand-shop.net.ua/p17796783-stilnoe-molodezhnoe-plate.html'),
(4053, 6, 6, 'http://brand-shop.net.ua/p18311703-stilnoe-molodezhnoe-plate.html'),
(4054, 6, 6, 'http://brand-shop.net.ua/p20507429-stilnoe-molodezhnoe-plate.html'),
(4055, 6, 6, 'http://brand-shop.net.ua/p19459610-stilnoe-molodezhnoe-modnoe.html'),
(4056, 6, 6, 'http://brand-shop.net.ua/p20200602-stilnyj-molodezhnyj-kombinezon.html'),
(4057, 6, 6, 'http://brand-shop.net.ua/p18313021-stilnyj-letnij-sarafan.html'),
(4058, 6, 6, 'http://brand-shop.net.ua/p34555593-eksklyuzivnaya-yarkaya-molodezhnaya.html'),
(4059, 6, 6, 'http://brand-shop.net.ua/p18259622-stilnyj-letnij-sarafan.html'),
(4060, 6, 6, 'http://brand-shop.net.ua/p23100380-stilnoe-korotkoe-kashemirovoe.html'),
(4061, 6, 6, 'http://brand-shop.net.ua/p22983648-stilnoe-osennee-plate.html'),
(4062, 6, 6, 'http://brand-shop.net.ua/p23096710-stilnoe-dlinnoe-kashemirovoe.html'),
(4063, 6, 6, 'http://brand-shop.net.ua/p22556759-molodezhnoe-stilnoe-poncho.html'),
(4064, 6, 6, 'http://brand-shop.net.ua/p22655338-stilnoe-osennee-plate.html'),
(4065, 6, 6, 'http://brand-shop.net.ua/p22986825-stilnyj-teplyj-sportivnyj.html'),
(4066, 6, 6, 'http://brand-shop.net.ua/p22834665-uteplennyj-sportivnyj-kostyum.html'),
(4067, 6, 6, 'http://brand-shop.net.ua/p22655416-stilnoe-osennee-plate.html'),
(4068, 6, 6, 'http://brand-shop.net.ua/p21756505-stilnyj-muzhskoj-sportivnyj.html'),
(4069, 6, 6, 'http://brand-shop.net.ua/p22360715-sportivnyj-molodezhnyj-kostyum.html'),
(4070, 6, 6, 'http://brand-shop.net.ua/p21961080-stilnoe-osennee-plate.html'),
(4071, 6, 6, 'http://brand-shop.net.ua/p22361275-stilnoe-plate-pol.html'),
(4072, 6, 6, 'http://brand-shop.net.ua/p22834712-uteplennyj-sportivnyj-kostyum.html'),
(4073, 6, 6, 'http://brand-shop.net.ua/p22361283-molodezhnoe-kashemirovoe-palto.html'),
(4074, 6, 6, 'http://brand-shop.net.ua/p22316396-stilnaya-zhenskaya-tolstovka.html'),
(4075, 6, 6, 'http://brand-shop.net.ua/p22313629-stilnoe-plate-pol.html'),
(4076, 6, 6, 'http://brand-shop.net.ua/p22313952-stilnoe-plate-pol.html'),
(4077, 6, 6, 'http://brand-shop.net.ua/p31440419-stilnaya-molodezhnaya-kurtka.html'),
(4078, 6, 6, 'http://brand-shop.net.ua/p22118536-stilnoe-osennee-plate.html'),
(4079, 6, 6, 'http://brand-shop.net.ua/p31440460-stilnaya-molodezhnaya-kurtka.html'),
(4080, 6, 6, 'http://brand-shop.net.ua/p21961046-stilnoe-osennee-plate.html'),
(4081, 6, 6, 'http://brand-shop.net.ua/p31440704-stilnaya-molodezhnaya-kurtka.html');

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
  `upc` varchar(32) NOT NULL,
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2365 ;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `date_added`, `date_modified`, `viewed`) VALUES
(1366, 'Клач', '', '', '', '', '0', '', 'Fashion Women Lady Purse Shoulder Clutch Evening Bag Snakeskin 5 Colors', 0, 8, 'data/mx/20140311-1/$(KGrHqJHJEUFIfi,MQSeBSO(Cn!R6w~~60_35.JPG', 0, 1, '24.0000', 0, 0, '2014-03-11', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 1, 1, '2014-03-11 05:55:33', '2014-04-08 06:15:23', 28);

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
(1366, 1, ' Clutch Evening ', '&lt;p&gt;Высота 13 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Длина 27 см&lt;/p&gt;\r\n\r\n&lt;p&gt;Материал: искусственная кожа&amp;nbsp;&lt;/p&gt;\r\n', '', '', '', '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62029 ;

--
-- Дамп данных таблицы `product_image`
--

INSERT INTO `product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(61125, 1366, 'no_image.jpg', 250),
(61124, 1366, 'no_image.jpg', 290),
(61123, 1366, 'no_image.jpg', 300),
(61122, 1366, 'no_image.jpg', 310),
(61121, 1366, 'no_image.jpg', 320),
(61120, 1366, 'no_image.jpg', 330),
(61119, 1366, 'no_image.jpg', 340);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=496 ;

--
-- Дамп данных таблицы `product_option`
--

INSERT INTO `product_option` (`product_option_id`, `product_id`, `option_id`, `option_value`, `required`) VALUES
(328, 1366, 13, '', 1);

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
  `ob_sku` varchar(64) NOT NULL DEFAULT '',
  `ob_info` varchar(255) NOT NULL DEFAULT '',
  `ob_image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`product_option_value_id`),
  KEY `option_value_id` (`option_value_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=923 ;

--
-- Дамп данных таблицы `product_option_value`
--

INSERT INTO `product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`, `ob_sku`, `ob_info`, `ob_image`) VALUES
(364, 328, 1366, 13, 56, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+', '', '', ''),
(363, 328, 1366, 13, 55, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+', '', '', ''),
(362, 328, 1366, 13, 53, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+', '', '', ''),
(361, 328, 1366, 13, 64, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+', '', '', ''),
(360, 328, 1366, 13, 51, 1, 0, '0.0000', '+', 0, '+', '0.00000000', '+', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `product_related`
--

CREATE TABLE IF NOT EXISTS `product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5650 ;

--
-- Дамп данных таблицы `product_reward`
--

INSERT INTO `product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(5455, 1366, 1, 0);

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
(1366, 32, 1);

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
(1366, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19434 ;

--
-- Дамп данных таблицы `setting`
--

INSERT INTO `setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(14520, 0, 'russian_post_blanks', 'rpb_bik', '', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(18372, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(18375, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(18374, 0, 'cod', 'cod_order_status_id', '1', 0),
(18373, 0, 'cod', 'cod_total', '', 0),
(14517, 0, 'russian_post_blanks', 'rpb_doc_date', '', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(14519, 0, 'russian_post_blanks', 'rpb_inn', '', 0),
(11701, 0, 'carousel', 'carousel_module', 'a:1:{i:0;a:9:{s:9:"banner_id";s:1:"8";s:5:"limit";s:1:"4";s:6:"scroll";s:1:"2";s:5:"width";s:2:"80";s:6:"height";s:2:"80";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"8";}}', 1),
(19172, 0, 'vk_export', 'vk_export_db_version', '4.7.5', 0),
(14518, 0, 'russian_post_blanks', 'rpb_doc_received_by', '', 0),
(11144, 0, 'credit', 'credit_sort_order', '7', 0),
(11143, 0, 'credit', 'credit_status', '0', 0),
(11756, 0, 'amazonmenu', 'amazonmenu_titles1', '', 0),
(11757, 0, 'amazonmenu', 'amazonmenu_header', '0', 0),
(18189, 0, 'featured', 'featured_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"8";s:11:"image_width";s:3:"220";s:12:"image_height";s:3:"220";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(18187, 0, 'featured', 'product', 'Платье', 0),
(11253, 0, 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(11763, 0, 'amazonmenu', 'amazonmenu_directory', '0', 0),
(11764, 0, 'amazonmenu', 'amazonmenu_module', 'a:3:{i:0;a:6:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:8:"toplimit";s:1:"5";s:8:"botlimit";s:1:"5";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:1;a:6:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:8:"toplimit";s:1:"5";s:8:"botlimit";s:1:"5";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:2;a:6:{s:9:"layout_id";s:1:"1";s:8:"position";s:11:"column_left";s:8:"toplimit";s:1:"5";s:8:"botlimit";s:1:"5";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(9732, 0, 'callback', 'callback_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:1:"1";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(10934, 0, 'google_sitemap', 'google_sitemap_status', '1', 0),
(11762, 0, 'amazonmenu', 'amazonmenu_sprite_links', '0', 0),
(11761, 0, 'amazonmenu', 'amazonmenu_thumb_height', '425', 0),
(11760, 0, 'amazonmenu', 'amazonmenu_thumb_width', '425', 0),
(18188, 0, 'featured', 'featured_product', '73,1643,1644,77,1647', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(18371, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(18370, 0, 'free_checkout', 'free_checkout_order_status_id', '2', 0),
(19409, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(19408, 0, 'config', 'config_shared', '0', 0),
(19407, 0, 'config', 'config_secure', '0', 0),
(19406, 0, 'config', 'config_fraud_status_id', '2', 0),
(19405, 0, 'config', 'config_fraud_score', '', 0),
(19404, 0, 'config', 'config_fraud_key', '', 0),
(19403, 0, 'config', 'config_fraud_detection', '0', 0),
(19402, 0, 'config', 'config_alert_emails', 'zhdanovich_artur@mail.ru', 0),
(19401, 0, 'config', 'config_review_mail', '0', 0),
(19400, 0, 'config', 'config_account_mail', '0', 0),
(19399, 0, 'config', 'config_alert_mail', '1', 0),
(19398, 0, 'config', 'config_smtp_timeout', '5', 0),
(19397, 0, 'config', 'config_smtp_port', '25', 0),
(19396, 0, 'config', 'config_smtp_password', '', 0),
(19395, 0, 'config', 'config_smtp_username', '', 0),
(19394, 0, 'config', 'config_smtp_host', '', 0),
(19393, 0, 'config', 'config_mail_parameter', '', 0),
(19392, 0, 'config', 'config_mail_protocol', 'mail', 0),
(19391, 0, 'config', 'config_ftp_status', '0', 0),
(19390, 0, 'config', 'config_ftp_root', '', 0),
(18399, 0, 'slideshow', 'slideshow_module', 'a:1:{i:0;a:7:{s:9:"banner_id";s:1:"7";s:5:"width";s:3:"730";s:6:"height";s:3:"300";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(18376, 0, 'cod', 'cod_status', '1', 0),
(18377, 0, 'cod', 'cod_sort_order', '2', 0),
(19389, 0, 'config', 'config_ftp_password', '', 0),
(19388, 0, 'config', 'config_ftp_username', '', 0),
(19387, 0, 'config', 'config_ftp_port', '21', 0),
(19386, 0, 'config', 'config_ftp_host', 'rumus.by', 0),
(19385, 0, 'config', 'config_image_cart_height', '47', 0),
(19378, 0, 'config', 'config_image_related_width', '200', 0),
(19379, 0, 'config', 'config_image_related_height', '200', 0),
(19380, 0, 'config', 'config_image_compare_width', '47', 0),
(19381, 0, 'config', 'config_image_compare_height', '47', 0),
(19382, 0, 'config', 'config_image_wishlist_width', '47', 0),
(19383, 0, 'config', 'config_image_wishlist_height', '47', 0),
(19384, 0, 'config', 'config_image_cart_width', '47', 0),
(19377, 0, 'config', 'config_image_additional_height', '74', 0),
(19376, 0, 'config', 'config_image_additional_width', '74', 0),
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
(19375, 0, 'config', 'config_image_product_height', '200', 0),
(19252, 0, 'product_stickers', 'config_sticker_special_news_related_product', '1', 0),
(19251, 0, 'product_stickers', 'config_sticker_popular_quick_view_related', '1', 0),
(19250, 0, 'product_stickers', 'config_sticker_new_quick_view_related', '1', 0),
(19249, 0, 'product_stickers', 'config_sticker_special_quick_view_related', '1', 0),
(19248, 0, 'product_stickers', 'config_sticker_popular_quick_view', '1', 0),
(19247, 0, 'product_stickers', 'config_sticker_new_quick_view', '1', 0),
(19246, 0, 'product_stickers', 'config_sticker_special_quick_view', '1', 0),
(19244, 0, 'product_stickers', 'config_sticker_new_special', '1', 0),
(19245, 0, 'product_stickers', 'config_sticker_popular_special', '1', 0),
(19243, 0, 'product_stickers', 'config_sticker_special_special', '1', 0),
(19241, 0, 'product_stickers', 'config_sticker_new_search', '1', 0),
(19242, 0, 'product_stickers', 'config_sticker_popular_search', '1', 0),
(19240, 0, 'product_stickers', 'config_sticker_special_search', '1', 0),
(19239, 0, 'product_stickers', 'config_sticker_popular_product_related', '1', 0),
(19238, 0, 'product_stickers', 'config_sticker_new_product_related', '1', 0),
(19236, 0, 'product_stickers', 'config_sticker_popular_product', '1', 0),
(19237, 0, 'product_stickers', 'config_sticker_special_product_related', '1', 0),
(19234, 0, 'product_stickers', 'config_sticker_special_product', '1', 0),
(19235, 0, 'product_stickers', 'config_sticker_new_product', '1', 0),
(19233, 0, 'product_stickers', 'config_sticker_popular_manufacturer', '1', 0),
(19232, 0, 'product_stickers', 'config_sticker_new_manufacturer', '1', 0),
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
(19374, 0, 'config', 'config_image_product_width', '200', 0),
(11767, 0, 'vk', 'vk_module', 'a:2:{i:0;a:8:{s:11:"image_width";s:3:"210";s:12:"image_height";s:3:"200";s:4:"mode";s:1:"1";s:5:"vk_id";s:8:"44702020";s:9:"layout_id";s:1:"6";s:8:"position";s:12:"column_right";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:1;a:8:{s:11:"image_width";s:3:"210";s:12:"image_height";s:3:"400";s:4:"mode";s:1:"2";s:5:"vk_id";s:8:"44702020";s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"3";}}', 1),
(13803, 0, 'latest', 'latest_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"6";s:11:"image_width";s:3:"220";s:12:"image_height";s:3:"220";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"5";}}', 1),
(11733, 0, 'bestseller', 'bestseller_module', 'a:1:{i:0;a:7:{s:5:"limit";s:1:"5";s:11:"image_width";s:3:"220";s:12:"image_height";s:3:"220";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"5";}}', 1),
(19231, 0, 'product_stickers', 'config_sticker_special_manufacturer', '1', 0),
(19230, 0, 'product_stickers', 'config_sticker_popular_categories', '1', 0),
(19229, 0, 'product_stickers', 'config_sticker_new_categories', '1', 0),
(19228, 0, 'product_stickers', 'config_sticker_special_categories', '1', 0),
(19227, 0, 'product_stickers', 'config_sticker_popular_module_special', '1', 0),
(19226, 0, 'product_stickers', 'config_sticker_new_module_special', '1', 0),
(9731, 0, 'callback', 'callback_message', '1', 0),
(9730, 0, 'callback', 'callback_theme', '1', 0),
(9728, 0, 'callback', 'callback_phone_mask', '+999(99) 999-99-99', 0),
(9729, 0, 'callback', 'callback_other_emails', '', 0),
(19363, 0, 'config', 'config_quick_news_design', '1', 0),
(19364, 0, 'config', 'config_logo', 'data/logo.png', 0),
(19365, 0, 'config', 'config_icon', 'data/favicon.png', 0),
(19366, 0, 'config', 'config_image_category_width', '220', 0),
(19367, 0, 'config', 'config_image_category_height', '220', 0),
(19368, 0, 'config', 'config_image_subcategory_width', '200', 0),
(19369, 0, 'config', 'config_image_subcategory_height', '200', 0),
(19370, 0, 'config', 'config_image_thumb_width', '220', 0),
(19371, 0, 'config', 'config_image_thumb_height', '220', 0),
(19372, 0, 'config', 'config_image_popup_width', '600', 0),
(19373, 0, 'config', 'config_image_popup_height', '600', 0),
(19360, 0, 'config', 'config_quick_news_images', '1', 0),
(19361, 0, 'config', 'config_news_category_design', '1', 0),
(19362, 0, 'config', 'config_quick_news_stores', '1', 0),
(19359, 0, 'config', 'config_news_category_stores', '1', 0),
(19358, 0, 'config', 'config_quick_news_related', '1', 0),
(19357, 0, 'config', 'config_news_category_image', '1', 0),
(19294, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(19295, 0, 'config', 'config_order_status_id', '1', 0),
(19296, 0, 'config', 'config_complete_status_id', '5', 0),
(19297, 0, 'config', 'config_stock_display', '0', 0),
(19298, 0, 'config', 'config_stock_warning', '0', 0),
(19299, 0, 'config', 'config_stock_checkout', '1', 0),
(19300, 0, 'config', 'config_stock_status_id', '8', 0),
(19301, 0, 'config', 'config_affiliate_id', '5', 0),
(19302, 0, 'config', 'config_commission', '5', 0),
(19303, 0, 'config', 'config_return_id', '3', 0),
(19304, 0, 'config', 'config_return_status_id', '2', 0),
(19305, 0, 'config', 'config_product_quick_edit', '1', 0),
(19306, 0, 'config', 'config_review_status', '1', 0),
(19307, 0, 'config', 'config_guest_review', '0', 0),
(19308, 0, 'config', 'config_download', '0', 0),
(19309, 0, 'config', 'config_zoom_images_product', '0', 0),
(19310, 0, 'config', 'config_display_weight', '0', 0),
(19311, 0, 'config', 'config_manufacturer_categories', '1', 0),
(19312, 0, 'config', 'config_quick_subtract', '1', 0),
(19313, 0, 'config', 'config_quick_options', '1', 0),
(19314, 0, 'config', 'config_quick_images', '1', 0),
(19315, 0, 'config', 'config_category_quick_edit', '1', 0),
(19316, 0, 'config', 'config_product_count', '0', 0),
(19317, 0, 'config', 'config_view_subcategory', 'images', 0),
(19318, 0, 'config', 'config_sub_category_description_limit', '150', 0),
(19319, 0, 'config', 'config_category_parent', '1', 0),
(19320, 0, 'config', 'config_category_image', '1', 0),
(19321, 0, 'config', 'config_manufacturer_quick_edit', '0', 0),
(19322, 0, 'config', 'config_manufacturer_top_menu', 'top_menu', 0),
(19323, 0, 'config', 'config_manufacturer_image_top_menu', '0', 0),
(19324, 0, 'config', 'config_news_sort_order', 'DESC', 0),
(19325, 0, 'config', 'config_news_top_menu', 'none', 0),
(19326, 0, 'config', 'config_news_side_menu', 'top', 0),
(19327, 0, 'config', 'config_view_news_subcategory', 'images', 0),
(19328, 0, 'config', 'config_search_news', 'bottom', 0),
(19329, 0, 'config', 'config_news_description_limit', '300', 0),
(19330, 0, 'config', 'config_news_grid_description_limit', '200', 0),
(19331, 0, 'config', 'config_sub_news_category_description_limit', '100', 0),
(19332, 0, 'config', 'config_news_count', '0', 0),
(19333, 0, 'config', 'config_guest_news_comment', '0', 0),
(19334, 0, 'config', 'config_news_comments_mail', '1', 0),
(19335, 0, 'config', 'config_limit_news_comments', '5', 0),
(19336, 0, 'config', 'config_image_news_category_width', '220', 0),
(19337, 0, 'config', 'config_image_news_category_height', '220', 0),
(19338, 0, 'config', 'config_image_news_sub_category_width', '160', 0),
(19339, 0, 'config', 'config_image_news_sub_category_height', '160', 0),
(19340, 0, 'config', 'config_image_news_thumb_width', '228', 0),
(19341, 0, 'config', 'config_image_news_thumb_height', '228', 0),
(19342, 0, 'config', 'config_image_news_popup_width', '500', 0),
(19343, 0, 'config', 'config_image_news_popup_height', '500', 0),
(19344, 0, 'config', 'config_image_news_width', '220', 0),
(19345, 0, 'config', 'config_image_news_height', '220', 0),
(19346, 0, 'config', 'config_image_news_related_width', '198', 0),
(19347, 0, 'config', 'config_image_news_related_height', '198', 0),
(19348, 0, 'config', 'config_image_news_additional_width', '168', 0),
(19349, 0, 'config', 'config_image_news_additional_height', '168', 0),
(19350, 0, 'config', 'config_news_all_buttons', '1', 0),
(19351, 0, 'config', 'config_news_category_all_buttons', '1', 0),
(19352, 0, 'config', 'config_news_general_data', '1', 0),
(19353, 0, 'config', 'config_news_category_general_data', '1', 0),
(19354, 0, 'config', 'config_news_category', '1', 0),
(19355, 0, 'config', 'config_news_category_parent', '1', 0),
(19356, 0, 'config', 'config_quick_news_date_sort', '1', 0),
(9727, 0, 'callback', 'callback_email', 'mail@rumus.by', 0),
(9726, 0, 'callback', 'callback_title_ru', 'Заказать звонок', 0),
(10935, 0, 'google_base', 'google_base_status', '1', 0),
(11255, 0, 'lastview', 'lastview_module', 'a:3:{i:0;a:7:{s:5:"limit";s:1:"1";s:11:"image_width";s:3:"160";s:12:"image_height";s:3:"160";s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"4";}i:1;a:7:{s:5:"limit";s:1:"5";s:11:"image_width";s:3:"160";s:12:"image_height";s:3:"160";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"4";}i:2;a:7:{s:5:"limit";s:1:"5";s:11:"image_width";s:3:"160";s:12:"image_height";s:3:"160";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"4";}}', 1),
(18395, 0, 'pp_standard', 'pp_standard_sort_order', '3', 0),
(18394, 0, 'pp_standard', 'pp_standard_status', '0', 0),
(18393, 0, 'pp_standard', 'pp_standard_geo_zone_id', '0', 0),
(18392, 0, 'pp_standard', 'pp_standard_voided_status_id', '2', 0),
(18391, 0, 'pp_standard', 'pp_standard_reversed_status_id', '2', 0),
(18390, 0, 'pp_standard', 'pp_standard_refunded_status_id', '2', 0),
(18389, 0, 'pp_standard', 'pp_standard_processed_status_id', '2', 0),
(18388, 0, 'pp_standard', 'pp_standard_pending_status_id', '2', 0),
(18387, 0, 'pp_standard', 'pp_standard_failed_status_id', '2', 0),
(18386, 0, 'pp_standard', 'pp_standard_expired_status_id', '2', 0),
(18385, 0, 'pp_standard', 'pp_standard_denied_status_id', '2', 0),
(18384, 0, 'pp_standard', 'pp_standard_completed_status_id', '2', 0),
(18383, 0, 'pp_standard', 'pp_standard_canceled_reversal_status_id', '2', 0),
(18382, 0, 'pp_standard', 'pp_standard_total', '0.01', 0),
(18381, 0, 'pp_standard', 'pp_standard_debug', '0', 0),
(18380, 0, 'pp_standard', 'pp_standard_transaction', '1', 0),
(18379, 0, 'pp_standard', 'pp_standard_test', '0', 0),
(18378, 0, 'pp_standard', 'pp_standard_email', 'dmitriy_r_f@mail.ru', 0),
(19225, 0, 'product_stickers', 'config_sticker_special_module_special', '1', 0),
(19224, 0, 'product_stickers', 'config_sticker_popular_module_latest', '1', 0),
(19223, 0, 'product_stickers', 'config_sticker_new_module_latest', '1', 0),
(19222, 0, 'product_stickers', 'config_sticker_special_module_latest', '1', 0),
(19221, 0, 'product_stickers', 'config_sticker_popular_module_featured', '1', 0),
(19220, 0, 'product_stickers', 'config_sticker_new_module_featured', '1', 0),
(11759, 0, 'amazonmenu', 'amazonmenu_box', '1', 0),
(11758, 0, 'amazonmenu', 'amazonmenu_icon', '0', 0),
(11768, 0, 'news_category', 'news_category_module', 'a:3:{i:0;a:10:{s:5:"limit";s:2:"10";s:8:"image_on";s:1:"1";s:11:"image_width";s:3:"200";s:12:"image_height";s:3:"200";s:10:"name_limit";s:2:"25";s:17:"description_limit";s:3:"150";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:1;a:10:{s:5:"limit";s:2:"10";s:8:"image_on";s:1:"1";s:11:"image_width";s:3:"200";s:12:"image_height";s:3:"200";s:10:"name_limit";s:2:"25";s:17:"description_limit";s:3:"150";s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}i:2;a:10:{s:5:"limit";s:2:"10";s:8:"image_on";s:1:"1";s:11:"image_width";s:3:"200";s:12:"image_height";s:3:"200";s:10:"name_limit";s:2:"25";s:17:"description_limit";s:3:"150";s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(12071, 0, 'supermenu', 'supermenu_image_width', '120', 0),
(12072, 0, 'supermenu', 'supermenu_image_height', '120', 0),
(12073, 0, 'supermenu', 'supermenu_item', 'a:5:{i:0;a:14:{s:4:"type";s:3:"cat";s:4:"view";s:1:"0";s:11:"category_id";s:1:"1";s:14:"information_id";s:1:"9";s:10:"customname";a:1:{i:1;s:0:"";}s:9:"customurl";a:1:{i:1;s:0:"";}s:6:"addurl";a:1:{i:1;s:0:"";}s:5:"image";a:1:{i:1;s:0:"";}s:7:"tlcolor";s:0:"";s:7:"tlstyle";s:0:"";s:5:"chtml";s:1:"0";s:6:"cchtml";s:5:"area1";s:6:"dwidth";s:0:"";s:6:"iwidth";s:0:"";}i:1;a:14:{s:4:"type";s:3:"cat";s:4:"view";s:1:"0";s:11:"category_id";s:2:"18";s:14:"information_id";s:1:"9";s:10:"customname";a:1:{i:1;s:0:"";}s:9:"customurl";a:1:{i:1;s:0:"";}s:6:"addurl";a:1:{i:1;s:0:"";}s:5:"image";a:1:{i:1;s:0:"";}s:7:"tlcolor";s:0:"";s:7:"tlstyle";s:0:"";s:5:"chtml";s:1:"0";s:6:"cchtml";s:5:"area1";s:6:"dwidth";s:0:"";s:6:"iwidth";s:0:"";}i:2;a:14:{s:4:"type";s:3:"cat";s:4:"view";s:1:"0";s:11:"category_id";s:2:"25";s:14:"information_id";s:1:"9";s:10:"customname";a:1:{i:1;s:0:"";}s:9:"customurl";a:1:{i:1;s:0:"";}s:6:"addurl";a:1:{i:1;s:0:"";}s:5:"image";a:1:{i:1;s:0:"";}s:7:"tlcolor";s:0:"";s:7:"tlstyle";s:0:"";s:5:"chtml";s:1:"0";s:6:"cchtml";s:5:"area1";s:6:"dwidth";s:0:"";s:6:"iwidth";s:0:"";}i:3;a:14:{s:4:"type";s:3:"cat";s:4:"view";s:1:"0";s:11:"category_id";s:2:"76";s:14:"information_id";s:1:"9";s:10:"customname";a:1:{i:1;s:0:"";}s:9:"customurl";a:1:{i:1;s:0:"";}s:6:"addurl";a:1:{i:1;s:0:"";}s:5:"image";a:1:{i:1;s:0:"";}s:7:"tlcolor";s:0:"";s:7:"tlstyle";s:0:"";s:5:"chtml";s:1:"0";s:6:"cchtml";s:5:"area1";s:6:"dwidth";s:0:"";s:6:"iwidth";s:0:"";}i:4;a:14:{s:4:"type";s:3:"cat";s:4:"view";s:1:"0";s:11:"category_id";s:2:"57";s:14:"information_id";s:1:"9";s:10:"customname";a:1:{i:1;s:0:"";}s:9:"customurl";a:1:{i:1;s:0:"";}s:6:"addurl";a:1:{i:1;s:0:"";}s:5:"image";a:1:{i:1;s:0:"";}s:7:"tlcolor";s:0:"";s:7:"tlstyle";s:0:"";s:5:"chtml";s:1:"0";s:6:"cchtml";s:5:"area1";s:6:"dwidth";s:0:"";s:6:"iwidth";s:0:"";}}', 1),
(12067, 0, 'supermenu', 'supermenu_settings_status', '0', 0),
(12068, 0, 'supermenu', 'supermenu_settings', 'a:7:{s:2:"bg";s:0:"";s:3:"tlc";s:0:"";s:3:"dbg";s:0:"";s:3:"slc";s:0:"";s:4:"slbg";s:0:"";s:5:"slbgh";s:0:"";s:4:"thlc";s:0:"";}', 1),
(12069, 0, 'supermenu', 'supermenu_more_title', 'a:1:{i:1;s:0:"";}', 1),
(12070, 0, 'supermenu', 'supermenu_more', 'a:41:{i:0;s:2:"57";i:1;s:2:"68";i:2;s:2:"72";i:3;s:2:"84";i:4;s:2:"83";i:5;s:2:"67";i:6;s:2:"76";i:7;s:2:"94";i:8;s:2:"96";i:9;s:2:"92";i:10;s:2:"90";i:11;s:2:"93";i:12;s:2:"95";i:13;s:2:"91";i:14;s:1:"1";i:15;s:2:"82";i:16;s:2:"60";i:17;s:2:"97";i:18;s:2:"26";i:19;s:2:"27";i:20;s:2:"62";i:21;s:2:"66";i:22;s:2:"59";i:23;s:2:"63";i:24;s:2:"18";i:25;s:2:"74";i:26;s:2:"73";i:27;s:2:"77";i:28;s:2:"78";i:29;s:2:"79";i:30;s:2:"46";i:31;s:2:"75";i:32;s:2:"81";i:33;s:2:"25";i:34;s:2:"28";i:35;s:2:"88";i:36;s:2:"32";i:37;s:2:"86";i:38;s:2:"80";i:39;s:2:"89";i:40;s:2:"87";}', 1),
(12074, 0, 'supermenu', 'supermenu_htmlarea', 'a:1:{i:1;a:8:{s:5:"area1";s:41:"&lt;p&gt;Insert custom code 1&lt;/p&gt;\r\n";s:5:"area2";s:41:"&lt;p&gt;Insert custom code 2&lt;/p&gt;\r\n";s:5:"area3";s:41:"&lt;p&gt;Insert custom code 3&lt;/p&gt;\r\n";s:5:"area4";s:41:"&lt;p&gt;Insert custom code 4&lt;/p&gt;\r\n";s:5:"area5";s:41:"&lt;p&gt;Insert custom code 5&lt;/p&gt;\r\n";s:5:"area6";s:41:"&lt;p&gt;Insert custom code 6&lt;/p&gt;\r\n";s:5:"area7";s:41:"&lt;p&gt;Insert custom code 7&lt;/p&gt;\r\n";s:5:"area8";s:41:"&lt;p&gt;Insert custom code 8&lt;/p&gt;\r\n";}}', 1),
(19219, 0, 'product_stickers', 'config_sticker_special_module_featured', '1', 0),
(19171, 0, 'vk_export', 'vk_export_cron_delete_out_of_stock', '0', 0),
(19170, 0, 'vk_export', 'vk_export_column_date_added', '0', 0),
(19168, 0, 'vk_export', 'vk_export_column_quantity', '0', 0),
(19169, 0, 'vk_export', 'vk_export_column_status', '0', 0),
(19167, 0, 'vk_export', 'vk_export_column_price', '0', 0),
(19166, 0, 'vk_export', 'vk_export_column_model', '0', 0),
(19165, 0, 'vk_export', 'vk_export_albums_only_specials', '0', 0),
(19164, 0, 'vk_export', 'vk_export_wall_only_specials', '0', 0),
(19163, 0, 'vk_export', 'vk_export_vkcc', '0', 0),
(19162, 0, 'vk_export', 'vk_export_only_instock', '0', 0),
(19161, 0, 'vk_export', 'vk_export_group_id', '44702020', 0),
(18398, 0, 'needlessimage', 'needlessimage_version', '1.1', 0),
(19293, 0, 'config', 'config_order_edit', '100', 0),
(19292, 0, 'config', 'config_checkout_id', '0', 0),
(19291, 0, 'config', 'config_guest_checkout', '1', 0),
(19158, 0, 'vk_export', 'cmd_type', ' -- -wall', 0),
(19159, 0, 'vk_export', 'vk_export_access_token', '659b3287f89e88de4706f5e16b10b6bb407b082ea8a8ab0580c0ce785979b990051a2d24e9a71319dbae7', 0),
(19160, 0, 'vk_export', 'vk_export_user_id', '193343977', 0),
(19157, 0, 'vk_export', 'vk_export_autoexport_category_wall', 'a:40:{i:0;s:1:"1";i:1;s:2:"66";i:2;s:2:"82";i:3;s:2:"60";i:4;s:2:"97";i:5;s:2:"62";i:6;s:2:"59";i:7;s:2:"63";i:8;s:2:"26";i:9;s:2:"27";i:10;s:2:"18";i:11;s:2:"74";i:12;s:2:"81";i:13;s:2:"73";i:14;s:2:"77";i:15;s:2:"78";i:16;s:2:"79";i:17;s:2:"46";i:18;s:2:"75";i:19;s:2:"25";i:20;s:2:"88";i:21;s:3:"102";i:22;s:3:"101";i:23;s:2:"80";i:24;s:2:"28";i:25;s:2:"32";i:26;s:2:"57";i:27;s:2:"68";i:28;s:2:"72";i:29;s:2:"84";i:30;s:2:"83";i:31;s:2:"67";i:32;s:2:"76";i:33;s:2:"94";i:34;s:2:"96";i:35;s:2:"92";i:36;s:2:"90";i:37;s:2:"93";i:38;s:2:"95";i:39;s:2:"91";}', 1),
(19156, 0, 'vk_export', 'vk_export_autoexport_category', 'a:40:{i:0;s:1:"1";i:1;s:2:"66";i:2;s:2:"82";i:3;s:2:"60";i:4;s:2:"97";i:5;s:2:"62";i:6;s:2:"59";i:7;s:2:"63";i:8;s:2:"26";i:9;s:2:"27";i:10;s:2:"18";i:11;s:2:"74";i:12;s:2:"81";i:13;s:2:"73";i:14;s:2:"77";i:15;s:2:"78";i:16;s:2:"79";i:17;s:2:"46";i:18;s:2:"75";i:19;s:2:"25";i:20;s:2:"88";i:21;s:3:"102";i:22;s:3:"101";i:23;s:2:"80";i:24;s:2:"28";i:25;s:2:"32";i:26;s:2:"57";i:27;s:2:"68";i:28;s:2:"72";i:29;s:2:"84";i:30;s:2:"83";i:31;s:2:"67";i:32;s:2:"76";i:33;s:2:"94";i:34;s:2:"96";i:35;s:2:"92";i:36;s:2:"90";i:37;s:2:"93";i:38;s:2:"95";i:39;s:2:"91";}', 1),
(19155, 0, 'vk_export', 'vk_export_cron_wallpost_max', '20', 0),
(19154, 0, 'vk_export', 'vk_export_num_products_for_cron', '20', 0),
(19153, 0, 'vk_export', 'vk_export_wall_unique', '1', 0),
(19152, 0, 'vk_export', 'vk_export_cron_delete_disabled', '1', 0),
(19151, 0, 'vk_export', 'vk_export_only_enabled', '1', 0),
(19150, 0, 'vk_export', 'vk_export_cron_pass', 'export', 0),
(19149, 0, 'vk_export', 'vk_export_cron_user', 'export', 0),
(19145, 0, 'vk_export', 'vk_export_http_catalog', '', 0),
(19146, 0, 'vk_export', 'vk_export_products_per_page', '20', 0),
(19147, 0, 'vk_export', 'vk_export_debug_mode', '0', 0),
(19148, 0, 'vk_export', 'vk_export_autoexport', '1', 0),
(19144, 0, 'vk_export', 'vk_export_wall_export_services', '', 0),
(19143, 0, 'vk_export', 'vk_export_wallpost_photos_count', '1', 0),
(19142, 0, 'vk_export', 'vk_export_photos_count', '1', 0),
(19137, 0, 'vk_export', 'vk_export_group_wallpost_from', '2', 0),
(19138, 0, 'vk_export', 'vk_export_user_replacements_keys', '', 0),
(19139, 0, 'vk_export', 'vk_export_user_replacements_values', '', 0),
(19140, 0, 'vk_export', 'vk_export_attributes_tpl', '{name}: {value}', 0),
(14516, 0, 'russian_post_blanks', 'rpb_doc_num', '', 0),
(14515, 0, 'russian_post_blanks', 'rpb_doc_serial', '', 0),
(14514, 0, 'russian_post_blanks', 'rpb_doc_type', '', 0),
(14513, 0, 'russian_post_blanks', 'rpb_postindex', '210009', 0),
(14512, 0, 'russian_post_blanks', 'rpb_from_address_2', '', 0),
(14511, 0, 'russian_post_blanks', 'rpb_from_address_1', 'г. Витебск а/я №58', 0),
(14510, 0, 'russian_post_blanks', 'rpb_from_name', 'Романовский Дмитрий Федорович', 0),
(14521, 0, 'russian_post_blanks', 'rpb_correspondent_account', '', 0),
(14522, 0, 'russian_post_blanks', 'rpb_current_account', '', 0),
(14523, 0, 'russian_post_blanks', 'rpb_bank_name', '', 0),
(14524, 0, 'russian_post_blanks', 'rpb_installed', '0', 0),
(14525, 0, 'russian_post_blanks', 'russian_post_blanks_status', '0', 0),
(19290, 0, 'config', 'config_cart_weight', '0', 0),
(19289, 0, 'config', 'config_account_id', '0', 0),
(19288, 0, 'config', 'config_customer_price', '0', 0),
(19287, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(19286, 0, 'config', 'config_customer_group_id', '1', 0),
(19285, 0, 'config', 'config_customer_online', '0', 0),
(19284, 0, 'config', 'config_tax_customer', 'shipping', 0),
(19283, 0, 'config', 'config_tax_default', 'shipping', 0),
(19282, 0, 'config', 'config_vat', '0', 0),
(19281, 0, 'config', 'config_tax', '0', 0),
(19280, 0, 'config', 'config_voucher_max', '300000', 0),
(19279, 0, 'config', 'config_voucher_min', '10000', 0),
(19278, 0, 'config', 'config_admin_limit', '200', 0),
(19277, 0, 'config', 'config_grid_description_limit', '200', 0),
(19276, 0, 'config', 'config_list_description_limit', '400', 0),
(19275, 0, 'config', 'config_catalog_limit', '15', 0),
(19274, 0, 'config', 'config_weight_class_id', '1', 0),
(19273, 0, 'config', 'config_length_class_id', '1', 0),
(19272, 0, 'config', 'config_currency_auto', '0', 0),
(19271, 0, 'config', 'config_currency', 'USD', 0),
(19270, 0, 'config', 'config_admin_language', 'ru', 0),
(19269, 0, 'config', 'config_language', 'ru', 0),
(19268, 0, 'config', 'config_zone_id', '339', 0),
(19267, 0, 'config', 'config_country_id', '20', 0),
(19266, 0, 'config', 'config_layout_id', '4', 0),
(19265, 0, 'config', 'config_template', 'default', 0),
(19263, 0, 'config', 'config_title', 'rumus.by - Магазин одежды и аксессуаров.', 0),
(19264, 0, 'config', 'config_meta_description', 'Интернет магазин одежды rumus.by осуществляет продажу одежды аксессуаров по доступным ценам. У нас бесплатная доставка по  Беларуси!', 0),
(19262, 0, 'config', 'config_contacts_display', 'header_footer', 0),
(19261, 0, 'config', 'config_fax', 'vk.com/odezhda_mira', 0),
(19260, 0, 'config', 'config_mobile_telephone', '+375(29) 138-10-75', 0),
(19259, 0, 'config', 'config_telephone', '+375(29) 218-10-75', 0),
(19258, 0, 'config', 'config_email', 'mail@rumus.by', 0),
(19257, 0, 'config', 'config_address', '', 0),
(19256, 0, 'config', 'config_owner', 'ИП Романовский Д. Ф.', 0),
(19255, 0, 'config', 'config_name', 'Интернет магазин rumus.by', 0),
(19141, 0, 'vk_export', 'vk_export_attributes_delimeter', ',', 0),
(19136, 0, 'vk_export', 'vk_export_wallpost_tpl', '{model}\r\n{price}\r\n{link}', 0),
(19134, 0, 'vk_export', 'vk_export_comment_tpl', '', 0),
(19135, 0, 'vk_export', 'vk_export_group_photo_comment_from', '1', 0),
(19133, 0, 'vk_export', 'vk_export_mode_comment', '1', 0),
(19132, 0, 'vk_export', 'vk_export_desc_tpl', '{model}\r\n{desc}\r\n{price}\r\n{link}', 0),
(19131, 0, 'vk_export', 'vk_export_mode_desc', '1', 0),
(19130, 0, 'vk_export', 'vk_export_album_only', '1', 0),
(19129, 0, 'vk_export', 'vk_export_album_name_mode', '1', 0),
(19128, 0, 'vk_export', 'vk_export_image_mode', '1', 0),
(19127, 0, 'vk_export', 'vk_export_mode', '2', 0),
(19218, 0, 'product_stickers', 'config_sticker_popular_module_bestseller', '1', 0),
(19217, 0, 'product_stickers', 'config_sticker_new_module_bestseller', '1', 0),
(19216, 0, 'product_stickers', 'config_sticker_special_module_bestseller', '1', 0),
(19215, 0, 'product_stickers', 'config_limit_viewed_popular_product', '30', 0),
(19214, 0, 'product_stickers', 'config_limit_days_new_product', '4', 0),
(19253, 0, 'product_stickers', 'config_sticker_new_news_related_product', '1', 0),
(19254, 0, 'product_stickers', 'config_sticker_popular_news_related_product', '1', 0),
(19410, 0, 'config', 'config_seo_url', '1', 0),
(19411, 0, 'config', 'config_seo_url_type', 'seo_pro', 0),
(19412, 0, 'config', 'config_seo_url_include_path', '1', 0),
(19413, 0, 'config', 'config_seo_url_postfix', '', 0),
(19414, 0, 'config', 'config_image_file_size', '300000', 0),
(19415, 0, 'config', 'config_file_extension_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', 0),
(19416, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', 0),
(19417, 0, 'config', 'config_maintenance', '0', 0),
(19418, 0, 'config', 'config_password', '1', 0),
(19419, 0, 'config', 'config_encryption', '5fmrnukvozgyc63pedsqh2tjx749bi ', 0),
(19420, 0, 'config', 'config_compression', '0', 0),
(19421, 0, 'config', 'config_error_display', '0', 0),
(19422, 0, 'config', 'config_error_log', '1', 0),
(19423, 0, 'config', 'config_error_filename', 'error.txt', 0),
(19424, 0, 'config', 'config_google_analytics', '&lt;script&gt;\r\n  (function(i,s,o,g,r,a,m){i[''GoogleAnalyticsObject'']=r;i[r]=i[r]||function(){\r\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\r\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\r\n  })(window,document,''script'',''//www.google-analytics.com/analytics.js'',''ga'');\r\n\r\n  ga(''create'', ''UA-46944758-1'', ''rumus.by'');\r\n  ga(''send'', ''pageview'');\r\n\r\n&lt;/script&gt;', 0),
(19425, 0, 'config', 'config_attributes_quick_edit', '1', 0),
(19426, 0, 'config', 'config_options_quick_edit', '1', 0),
(19427, 0, 'config', 'config_filter_quick_edit', '1', 0),
(19428, 0, 'config', 'config_information_quick_edit', '1', 0),
(19429, 0, 'config', 'config_review_quick_edit', '1', 0),
(19430, 0, 'config', 'config_clicking_image', '1', 0),
(19431, 0, 'config', 'config_buttons_apply', '1', 0),
(19432, 0, 'config', 'config_quick_search', '1', 0),
(19433, 0, 'config', 'config_copyright', '1', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4107 ;

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
(3084, 'category_id=32', 'klatchi'),
(1161, 'manufacturer_id=9', 'eva_style'),
(1158, 'manufacturer_id=7', ' larionoff'),
(1160, 'manufacturer_id=5', 'dress_code'),
(1186, 'category_id=77', 'men-jackets'),
(1191, 'category_id=68', 'strap'),
(1198, 'category_id=82', 'pidzhaki'),
(1187, 'category_id=78', 'men-jackets'),
(3123, 'category_id=60', 'kofty-i-tuniki'),
(1331, 'category_id=28', 'women-women_handbags'),
(1180, 'category_id=27', 'women-jackets'),
(1172, 'category_id=26', 'women-dress'),
(4081, 'category_id=66', 'women-smock'),
(1317, 'category_id=67', 'caps'),
(1176, 'category_id=63', 'women-skirts'),
(1177, 'category_id=62', 'women-tshirts'),
(1193, 'category_id=83', 'muzhskie-chasy'),
(3122, 'category_id=59', 'shorty-i-bryuki'),
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
(3127, 'information_id=8', 'contacts'),
(1381, 'information_id=3', 'oferta'),
(1167, 'category_id=79', 'men-shirts'),
(3095, 'category_id=102', 'koshelki'),
(3092, 'category_id=80', 'ryukzaki'),
(3083, 'category_id=88', 'zhenskaie-sumki'),
(1196, 'category_id=84', 'muzhskie-remni'),
(3093, 'category_id=81', 'bryuki'),
(1150, 'information_id=9', 'buyer-protection'),
(1235, 'news_id=1', 'vidy-muzhskih-sumok'),
(1266, 'news_category_id=1', 'articles'),
(1226, 'news_id=2', 'vybor-sumki-dlya-puteshestviy'),
(1267, 'news_category_id=2', 'pomoshch-v-vybore-veshchi'),
(3051, 'news_id=3', 'tipy-koshelkov'),
(1232, 'news_id=4', 'kak-podobrat-sumochku'),
(1234, 'news_category_id=3', 'perevod-razmerov'),
(1338, 'category_id=90', 'zakolki-i-rezinki'),
(1314, 'category_id=91', 'sergi-i-kaffy'),
(1316, 'category_id=92', 'busy-i-kole'),
(1318, 'category_id=93', 'kolca'),
(1336, 'category_id=94', 'braslety'),
(1339, 'category_id=95', 'podveski'),
(1337, 'category_id=96', 'broshi'),
(1312, 'category_id=97', 'nizhnee-bele-i-kupalniki'),
(3910, 'product_id=1366', 'clutch-evening'),
(3094, 'category_id=101', 'muzhskie-sumki'),
(4080, 'manufacturer_id=11', 'sk-house');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'Dwg.5fUzkV*qx@8', '1c53910624b8ad56bf4083a4339aaba20edc843a', 'c476ad65f', '12345', '12345', 'zhdanovich_artur@mail.ru', '', '127.0.0.1', 1, '2013-12-13 13:21:59'),
(2, 11, 'admin', '8b14cdbc2691e8bed66bc05083e5256928a99408', '012cae569', '12345', '12345', 'mail.rumus.by', '', '178.126.7.65', 1, '2014-01-08 01:39:19'),
(3, 12, 'export', 'c5b5dba563468b8f75ab541abbcf930f651e0410', '7fecbd734', 'export', 'export', 'export', '', '78.140.185.175', 1, '2014-03-13 05:00:58');

-- --------------------------------------------------------

--
-- Структура таблицы `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `user_group`
--

INSERT INTO `user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Главный администратор', 'a:2:{s:6:"access";a:174:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:29:"catalog/attribute_group_quick";i:3;s:23:"catalog/attribute_quick";i:4;s:16:"catalog/category";i:5;s:22:"catalog/category_quick";i:6;s:16:"catalog/download";i:7;s:14:"catalog/filter";i:8;s:20:"catalog/filter_quick";i:9;s:19:"catalog/information";i:10;s:25:"catalog/information_quick";i:11;s:20:"catalog/manufacturer";i:12;s:26:"catalog/manufacturer_quick";i:13;s:12:"catalog/news";i:14;s:21:"catalog/news_category";i:15;s:20:"catalog/news_comment";i:16;s:14:"catalog/option";i:17;s:20:"catalog/option_quick";i:18;s:15:"catalog/product";i:19;s:21:"catalog/product_quick";i:20;s:14:"catalog/review";i:21;s:20:"catalog/review_quick";i:22;s:15:"catalog/sitemap";i:23;s:18:"common/filemanager";i:24;s:13:"design/banner";i:25;s:13:"design/layout";i:26;s:14:"extension/feed";i:27;s:16:"extension/module";i:28;s:17:"extension/payment";i:29;s:18:"extension/shipping";i:30;s:15:"extension/total";i:31;s:19:"extension/vk_export";i:32;s:16:"feed/google_base";i:33;s:19:"feed/google_sitemap";i:34;s:20:"localisation/country";i:35;s:21:"localisation/currency";i:36;s:21:"localisation/geo_zone";i:37;s:21:"localisation/language";i:38;s:25:"localisation/length_class";i:39;s:25:"localisation/order_status";i:40;s:26:"localisation/return_action";i:41;s:26:"localisation/return_reason";i:42;s:26:"localisation/return_status";i:43;s:25:"localisation/stock_status";i:44;s:22:"localisation/tax_class";i:45;s:21:"localisation/tax_rate";i:46;s:25:"localisation/weight_class";i:47;s:17:"localisation/zone";i:48;s:14:"module/account";i:49;s:16:"module/affiliate";i:50;s:17:"module/amazonmenu";i:51;s:13:"module/banner";i:52;s:17:"module/bestseller";i:53;s:15:"module/callback";i:54;s:15:"module/carousel";i:55;s:15:"module/category";i:56;s:15:"module/featured";i:57;s:13:"module/filter";i:58;s:16:"module/filterpro";i:59;s:18:"module/google_talk";i:60;s:18:"module/information";i:61;s:15:"module/lastview";i:62;s:13:"module/latest";i:63;s:20:"module/needlessimage";i:64;s:20:"module/news_category";i:65;s:20:"module/news_featured";i:66;s:18:"module/news_latest";i:67;s:23:"module/product_stickers";i:68;s:25:"module/quick_registration";i:69;s:17:"module/quick_view";i:70;s:16:"module/slideshow";i:71;s:14:"module/special";i:72;s:12:"module/store";i:73;s:16:"module/supermenu";i:74;s:9:"module/vk";i:75;s:16:"module/vk_export";i:76;s:14:"module/welcome";i:77;s:24:"payment/authorizenet_aim";i:78;s:21:"payment/bank_transfer";i:79;s:14:"payment/cheque";i:80;s:11:"payment/cod";i:81;s:21:"payment/free_checkout";i:82;s:18:"payment/interkassa";i:83;s:22:"payment/klarna_account";i:84;s:22:"payment/klarna_invoice";i:85;s:14:"payment/liqpay";i:86;s:20:"payment/moneybookers";i:87;s:14:"payment/nochex";i:88;s:13:"payment/onpay";i:89;s:15:"payment/pay2pay";i:90;s:15:"payment/paymate";i:91;s:16:"payment/paypoint";i:92;s:13:"payment/payza";i:93;s:26:"payment/perpetual_payments";i:94;s:14:"payment/pp_pro";i:95;s:17:"payment/pp_pro_uk";i:96;s:19:"payment/pp_standard";i:97;s:12:"payment/qiwi";i:98;s:17:"payment/robokassa";i:99;s:15:"payment/sagepay";i:100;s:22:"payment/sagepay_direct";i:101;s:18:"payment/sagepay_us";i:102;s:25:"payment/sberbank_transfer";i:103;s:19:"payment/twocheckout";i:104;s:28:"payment/web_payment_software";i:105;s:20:"payment/webmoney_wme";i:106;s:20:"payment/webmoney_wmr";i:107;s:20:"payment/webmoney_wmu";i:108;s:20:"payment/webmoney_wmz";i:109;s:16:"payment/worldpay";i:110;s:27:"report/affiliate_commission";i:111;s:22:"report/customer_credit";i:112;s:22:"report/customer_online";i:113;s:21:"report/customer_order";i:114;s:22:"report/customer_reward";i:115;s:24:"report/product_purchased";i:116;s:21:"report/product_viewed";i:117;s:18:"report/sale_coupon";i:118;s:17:"report/sale_order";i:119;s:18:"report/sale_return";i:120;s:20:"report/sale_shipping";i:121;s:15:"report/sale_tax";i:122;s:14:"sale/affiliate";i:123;s:12:"sale/contact";i:124;s:11:"sale/coupon";i:125;s:13:"sale/customer";i:126;s:20:"sale/customer_ban_ip";i:127;s:19:"sale/customer_group";i:128;s:10:"sale/order";i:129;s:11:"sale/return";i:130;s:12:"sale/voucher";i:131;s:18:"sale/voucher_theme";i:132;s:15:"setting/setting";i:133;s:13:"setting/store";i:134;s:16:"shipping/auspost";i:135;s:17:"shipping/citylink";i:136;s:14:"shipping/fedex";i:137;s:13:"shipping/flat";i:138;s:13:"shipping/free";i:139;s:13:"shipping/item";i:140;s:23:"shipping/parcelforce_48";i:141;s:15:"shipping/pickup";i:142;s:19:"shipping/royal_mail";i:143;s:12:"shipping/ups";i:144;s:13:"shipping/usps";i:145;s:15:"shipping/weight";i:146;s:11:"tool/backup";i:147;s:17:"tool/control_unit";i:148;s:14:"tool/error_log";i:149;s:11:"tool/export";i:150;s:16:"tool/seo_manager";i:151;s:12:"total/coupon";i:152;s:12:"total/credit";i:153;s:14:"total/handling";i:154;s:16:"total/klarna_fee";i:155;s:19:"total/low_order_fee";i:156;s:12:"total/reward";i:157;s:14:"total/shipping";i:158;s:15:"total/sub_total";i:159;s:9:"total/tax";i:160;s:11:"total/total";i:161;s:13:"total/voucher";i:162;s:9:"user/user";i:163;s:20:"user/user_permission";i:164;s:16:"module/vk_export";i:165;s:26:"module/russian_post_blanks";i:166;s:14:"module/account";i:167;s:14:"module/account";i:168;s:18:"module/google_talk";i:169;s:13:"module/banner";i:170;s:13:"module/banner";i:171;s:21:"payment/bank_transfer";i:172;s:20:"module/needlessimage";i:173;s:20:"module/needlessimage";}s:6:"modify";a:174:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:29:"catalog/attribute_group_quick";i:3;s:23:"catalog/attribute_quick";i:4;s:16:"catalog/category";i:5;s:22:"catalog/category_quick";i:6;s:16:"catalog/download";i:7;s:14:"catalog/filter";i:8;s:20:"catalog/filter_quick";i:9;s:19:"catalog/information";i:10;s:25:"catalog/information_quick";i:11;s:20:"catalog/manufacturer";i:12;s:26:"catalog/manufacturer_quick";i:13;s:12:"catalog/news";i:14;s:21:"catalog/news_category";i:15;s:20:"catalog/news_comment";i:16;s:14:"catalog/option";i:17;s:20:"catalog/option_quick";i:18;s:15:"catalog/product";i:19;s:21:"catalog/product_quick";i:20;s:14:"catalog/review";i:21;s:20:"catalog/review_quick";i:22;s:15:"catalog/sitemap";i:23;s:18:"common/filemanager";i:24;s:13:"design/banner";i:25;s:13:"design/layout";i:26;s:14:"extension/feed";i:27;s:16:"extension/module";i:28;s:17:"extension/payment";i:29;s:18:"extension/shipping";i:30;s:15:"extension/total";i:31;s:19:"extension/vk_export";i:32;s:16:"feed/google_base";i:33;s:19:"feed/google_sitemap";i:34;s:20:"localisation/country";i:35;s:21:"localisation/currency";i:36;s:21:"localisation/geo_zone";i:37;s:21:"localisation/language";i:38;s:25:"localisation/length_class";i:39;s:25:"localisation/order_status";i:40;s:26:"localisation/return_action";i:41;s:26:"localisation/return_reason";i:42;s:26:"localisation/return_status";i:43;s:25:"localisation/stock_status";i:44;s:22:"localisation/tax_class";i:45;s:21:"localisation/tax_rate";i:46;s:25:"localisation/weight_class";i:47;s:17:"localisation/zone";i:48;s:14:"module/account";i:49;s:16:"module/affiliate";i:50;s:17:"module/amazonmenu";i:51;s:13:"module/banner";i:52;s:17:"module/bestseller";i:53;s:15:"module/callback";i:54;s:15:"module/carousel";i:55;s:15:"module/category";i:56;s:15:"module/featured";i:57;s:13:"module/filter";i:58;s:16:"module/filterpro";i:59;s:18:"module/google_talk";i:60;s:18:"module/information";i:61;s:15:"module/lastview";i:62;s:13:"module/latest";i:63;s:20:"module/needlessimage";i:64;s:20:"module/news_category";i:65;s:20:"module/news_featured";i:66;s:18:"module/news_latest";i:67;s:23:"module/product_stickers";i:68;s:25:"module/quick_registration";i:69;s:17:"module/quick_view";i:70;s:16:"module/slideshow";i:71;s:14:"module/special";i:72;s:12:"module/store";i:73;s:16:"module/supermenu";i:74;s:9:"module/vk";i:75;s:16:"module/vk_export";i:76;s:14:"module/welcome";i:77;s:24:"payment/authorizenet_aim";i:78;s:21:"payment/bank_transfer";i:79;s:14:"payment/cheque";i:80;s:11:"payment/cod";i:81;s:21:"payment/free_checkout";i:82;s:18:"payment/interkassa";i:83;s:22:"payment/klarna_account";i:84;s:22:"payment/klarna_invoice";i:85;s:14:"payment/liqpay";i:86;s:20:"payment/moneybookers";i:87;s:14:"payment/nochex";i:88;s:13:"payment/onpay";i:89;s:15:"payment/pay2pay";i:90;s:15:"payment/paymate";i:91;s:16:"payment/paypoint";i:92;s:13:"payment/payza";i:93;s:26:"payment/perpetual_payments";i:94;s:14:"payment/pp_pro";i:95;s:17:"payment/pp_pro_uk";i:96;s:19:"payment/pp_standard";i:97;s:12:"payment/qiwi";i:98;s:17:"payment/robokassa";i:99;s:15:"payment/sagepay";i:100;s:22:"payment/sagepay_direct";i:101;s:18:"payment/sagepay_us";i:102;s:25:"payment/sberbank_transfer";i:103;s:19:"payment/twocheckout";i:104;s:28:"payment/web_payment_software";i:105;s:20:"payment/webmoney_wme";i:106;s:20:"payment/webmoney_wmr";i:107;s:20:"payment/webmoney_wmu";i:108;s:20:"payment/webmoney_wmz";i:109;s:16:"payment/worldpay";i:110;s:27:"report/affiliate_commission";i:111;s:22:"report/customer_credit";i:112;s:22:"report/customer_online";i:113;s:21:"report/customer_order";i:114;s:22:"report/customer_reward";i:115;s:24:"report/product_purchased";i:116;s:21:"report/product_viewed";i:117;s:18:"report/sale_coupon";i:118;s:17:"report/sale_order";i:119;s:18:"report/sale_return";i:120;s:20:"report/sale_shipping";i:121;s:15:"report/sale_tax";i:122;s:14:"sale/affiliate";i:123;s:12:"sale/contact";i:124;s:11:"sale/coupon";i:125;s:13:"sale/customer";i:126;s:20:"sale/customer_ban_ip";i:127;s:19:"sale/customer_group";i:128;s:10:"sale/order";i:129;s:11:"sale/return";i:130;s:12:"sale/voucher";i:131;s:18:"sale/voucher_theme";i:132;s:15:"setting/setting";i:133;s:13:"setting/store";i:134;s:16:"shipping/auspost";i:135;s:17:"shipping/citylink";i:136;s:14:"shipping/fedex";i:137;s:13:"shipping/flat";i:138;s:13:"shipping/free";i:139;s:13:"shipping/item";i:140;s:23:"shipping/parcelforce_48";i:141;s:15:"shipping/pickup";i:142;s:19:"shipping/royal_mail";i:143;s:12:"shipping/ups";i:144;s:13:"shipping/usps";i:145;s:15:"shipping/weight";i:146;s:11:"tool/backup";i:147;s:17:"tool/control_unit";i:148;s:14:"tool/error_log";i:149;s:11:"tool/export";i:150;s:16:"tool/seo_manager";i:151;s:12:"total/coupon";i:152;s:12:"total/credit";i:153;s:14:"total/handling";i:154;s:16:"total/klarna_fee";i:155;s:19:"total/low_order_fee";i:156;s:12:"total/reward";i:157;s:14:"total/shipping";i:158;s:15:"total/sub_total";i:159;s:9:"total/tax";i:160;s:11:"total/total";i:161;s:13:"total/voucher";i:162;s:9:"user/user";i:163;s:20:"user/user_permission";i:164;s:16:"module/vk_export";i:165;s:26:"module/russian_post_blanks";i:166;s:14:"module/account";i:167;s:14:"module/account";i:168;s:18:"module/google_talk";i:169;s:13:"module/banner";i:170;s:13:"module/banner";i:171;s:21:"payment/bank_transfer";i:172;s:20:"module/needlessimage";i:173;s:20:"module/needlessimage";}}'),
(10, 'Демонстрация', ''),
(11, 'менеджер', 'a:2:{s:6:"access";a:108:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:29:"catalog/attribute_group_quick";i:3;s:23:"catalog/attribute_quick";i:4;s:16:"catalog/category";i:5;s:22:"catalog/category_quick";i:6;s:16:"catalog/download";i:7;s:14:"catalog/filter";i:8;s:20:"catalog/filter_quick";i:9;s:19:"catalog/information";i:10;s:25:"catalog/information_quick";i:11;s:20:"catalog/manufacturer";i:12;s:26:"catalog/manufacturer_quick";i:13;s:12:"catalog/news";i:14;s:21:"catalog/news_category";i:15;s:20:"catalog/news_comment";i:16;s:14:"catalog/option";i:17;s:20:"catalog/option_quick";i:18;s:15:"catalog/product";i:19;s:21:"catalog/product_quick";i:20;s:14:"catalog/review";i:21;s:20:"catalog/review_quick";i:22;s:18:"common/filemanager";i:23;s:24:"payment/authorizenet_aim";i:24;s:21:"payment/bank_transfer";i:25;s:14:"payment/cheque";i:26;s:11:"payment/cod";i:27;s:21:"payment/free_checkout";i:28;s:18:"payment/interkassa";i:29;s:22:"payment/klarna_account";i:30;s:22:"payment/klarna_invoice";i:31;s:14:"payment/liqpay";i:32;s:20:"payment/moneybookers";i:33;s:14:"payment/nochex";i:34;s:13:"payment/onpay";i:35;s:15:"payment/pay2pay";i:36;s:15:"payment/paymate";i:37;s:16:"payment/paypoint";i:38;s:13:"payment/payza";i:39;s:26:"payment/perpetual_payments";i:40;s:14:"payment/pp_pro";i:41;s:17:"payment/pp_pro_uk";i:42;s:19:"payment/pp_standard";i:43;s:12:"payment/qiwi";i:44;s:17:"payment/robokassa";i:45;s:15:"payment/sagepay";i:46;s:22:"payment/sagepay_direct";i:47;s:18:"payment/sagepay_us";i:48;s:25:"payment/sberbank_transfer";i:49;s:19:"payment/twocheckout";i:50;s:28:"payment/web_payment_software";i:51;s:20:"payment/webmoney_wme";i:52;s:20:"payment/webmoney_wmr";i:53;s:20:"payment/webmoney_wmu";i:54;s:20:"payment/webmoney_wmz";i:55;s:16:"payment/worldpay";i:56;s:27:"report/affiliate_commission";i:57;s:22:"report/customer_credit";i:58;s:22:"report/customer_online";i:59;s:21:"report/customer_order";i:60;s:22:"report/customer_reward";i:61;s:24:"report/product_purchased";i:62;s:21:"report/product_viewed";i:63;s:18:"report/sale_coupon";i:64;s:17:"report/sale_order";i:65;s:18:"report/sale_return";i:66;s:20:"report/sale_shipping";i:67;s:15:"report/sale_tax";i:68;s:14:"sale/affiliate";i:69;s:12:"sale/contact";i:70;s:11:"sale/coupon";i:71;s:13:"sale/customer";i:72;s:20:"sale/customer_ban_ip";i:73;s:19:"sale/customer_group";i:74;s:10:"sale/order";i:75;s:11:"sale/return";i:76;s:12:"sale/voucher";i:77;s:18:"sale/voucher_theme";i:78;s:15:"setting/setting";i:79;s:13:"setting/store";i:80;s:16:"shipping/auspost";i:81;s:17:"shipping/citylink";i:82;s:14:"shipping/fedex";i:83;s:13:"shipping/flat";i:84;s:13:"shipping/free";i:85;s:13:"shipping/item";i:86;s:23:"shipping/parcelforce_48";i:87;s:15:"shipping/pickup";i:88;s:19:"shipping/royal_mail";i:89;s:12:"shipping/ups";i:90;s:13:"shipping/usps";i:91;s:15:"shipping/weight";i:92;s:11:"tool/backup";i:93;s:17:"tool/control_unit";i:94;s:14:"tool/error_log";i:95;s:11:"tool/export";i:96;s:16:"tool/seo_manager";i:97;s:12:"total/coupon";i:98;s:12:"total/credit";i:99;s:14:"total/handling";i:100;s:16:"total/klarna_fee";i:101;s:19:"total/low_order_fee";i:102;s:12:"total/reward";i:103;s:14:"total/shipping";i:104;s:15:"total/sub_total";i:105;s:9:"total/tax";i:106;s:11:"total/total";i:107;s:13:"total/voucher";}s:6:"modify";a:70:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:29:"catalog/attribute_group_quick";i:3;s:23:"catalog/attribute_quick";i:4;s:16:"catalog/category";i:5;s:22:"catalog/category_quick";i:6;s:16:"catalog/download";i:7;s:14:"catalog/filter";i:8;s:20:"catalog/filter_quick";i:9;s:19:"catalog/information";i:10;s:25:"catalog/information_quick";i:11;s:20:"catalog/manufacturer";i:12;s:26:"catalog/manufacturer_quick";i:13;s:12:"catalog/news";i:14;s:21:"catalog/news_category";i:15;s:20:"catalog/news_comment";i:16;s:14:"catalog/option";i:17;s:20:"catalog/option_quick";i:18;s:15:"catalog/product";i:19;s:21:"catalog/product_quick";i:20;s:14:"catalog/review";i:21;s:20:"catalog/review_quick";i:22;s:18:"common/filemanager";i:23;s:27:"report/affiliate_commission";i:24;s:22:"report/customer_credit";i:25;s:22:"report/customer_online";i:26;s:21:"report/customer_order";i:27;s:22:"report/customer_reward";i:28;s:24:"report/product_purchased";i:29;s:21:"report/product_viewed";i:30;s:18:"report/sale_coupon";i:31;s:17:"report/sale_order";i:32;s:18:"report/sale_return";i:33;s:20:"report/sale_shipping";i:34;s:15:"report/sale_tax";i:35;s:14:"sale/affiliate";i:36;s:12:"sale/contact";i:37;s:11:"sale/coupon";i:38;s:13:"sale/customer";i:39;s:20:"sale/customer_ban_ip";i:40;s:19:"sale/customer_group";i:41;s:10:"sale/order";i:42;s:11:"sale/return";i:43;s:12:"sale/voucher";i:44;s:18:"sale/voucher_theme";i:45;s:15:"setting/setting";i:46;s:13:"setting/store";i:47;s:16:"shipping/auspost";i:48;s:17:"shipping/citylink";i:49;s:14:"shipping/fedex";i:50;s:13:"shipping/flat";i:51;s:13:"shipping/free";i:52;s:13:"shipping/item";i:53;s:23:"shipping/parcelforce_48";i:54;s:15:"shipping/pickup";i:55;s:19:"shipping/royal_mail";i:56;s:12:"shipping/ups";i:57;s:13:"shipping/usps";i:58;s:15:"shipping/weight";i:59;s:12:"total/coupon";i:60;s:12:"total/credit";i:61;s:14:"total/handling";i:62;s:16:"total/klarna_fee";i:63;s:19:"total/low_order_fee";i:64;s:12:"total/reward";i:65;s:14:"total/shipping";i:66;s:15:"total/sub_total";i:67;s:9:"total/tax";i:68;s:11:"total/total";i:69;s:13:"total/voucher";}}'),
(12, 'export', 'a:1:{s:6:"access";a:1:{i:0;s:19:"extension/vk_export";}}');

-- --------------------------------------------------------

--
-- Структура таблицы `vk_export_album`
--

CREATE TABLE IF NOT EXISTS `vk_export_album` (
  `category_id` int(11) NOT NULL,
  `vk_album_id` varchar(32) NOT NULL,
  `mode` enum('user','group') NOT NULL,
  PRIMARY KEY (`category_id`,`vk_album_id`,`mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `vk_export_album`
--

INSERT INTO `vk_export_album` (`category_id`, `vk_album_id`, `mode`) VALUES
(26, '-44702020_190595621', 'group'),
(27, '-44702020_190595617', 'group'),
(28, '-44702020_191605528', 'group'),
(32, '-44702020_190595701', 'group'),
(59, '-44702020_192024403', 'group'),
(59, '-44702020_192024404', 'group'),
(60, '-44702020_191605433', 'group'),
(62, '-44702020_191182180', 'group'),
(63, '-44702020_192747120', 'group'),
(66, '-44702020_191605567', 'group'),
(67, '-44702020_191605437', 'group'),
(68, '-44702020_191605418', 'group'),
(74, '-44702020_191605562', 'group'),
(75, '-44702020_191605440', 'group'),
(79, '-44702020_191605446', 'group'),
(80, '-44702020_191181054', 'group'),
(81, '-44702020_191605407', 'group'),
(88, '-44702020_191181041', 'group'),
(91, '-44702020_191605524', 'group'),
(92, '-44702020_191181035', 'group'),
(94, '-44702020_190595696', 'group'),
(97, '-44702020_190595691', 'group');

-- --------------------------------------------------------

--
-- Структура таблицы `vk_export_photo`
--

CREATE TABLE IF NOT EXISTS `vk_export_photo` (
  `product_id` int(11) NOT NULL,
  `vk_photo_id` varchar(32) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `location` enum('albums','wall') NOT NULL,
  PRIMARY KEY (`product_id`,`vk_photo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `vk_export_photo`
--

INSERT INTO `vk_export_photo` (`product_id`, `vk_photo_id`, `category_id`, `date`, `location`) VALUES
(960, '-44702020_326568324', 26, '2014-03-31 14:13:43', 'albums'),
(960, '-44702020_326568323', 26, '2014-03-31 14:13:43', 'albums'),
(1442, '-44702020_326568318', 88, '2014-04-10 06:06:28', 'albums'),
(77, '-44702020_325030006', 97, '2014-04-10 06:06:15', 'albums'),
(1442, '-44702020_326568317', 88, '2014-04-10 06:06:28', 'albums'),
(74, '-44702020_325029915', 27, '2014-04-10 06:06:15', 'albums'),
(724, '-44702020_326568312', 26, '2014-04-10 06:06:23', 'albums'),
(1376, '-44702020_326568311', 88, '2014-04-10 06:06:22', 'albums'),
(1316, '-44702020_326568301', 88, '2014-04-10 06:06:21', 'albums'),
(72, '-44702020_325029927', 26, '2014-04-10 06:06:17', 'albums'),
(1052, '-44702020_327304018', 26, '2014-04-09 14:34:51', 'albums'),
(101, '-44702020_325030018', 94, '2014-04-10 06:06:17', 'albums'),
(73, '-44702020_325030025', 26, '2014-04-10 06:06:17', 'albums'),
(80, '-44702020_325030031', 32, '2014-04-10 06:06:19', 'albums'),
(75, '-44702020_325030033', 27, '2014-04-10 06:06:19', 'albums'),
(1646, '-44702020_326568327', 59, '2014-03-31 14:13:45', 'albums'),
(76, '-44702020_325030044', 27, '2014-04-10 06:06:19', 'albums'),
(100, '-44702020_325030051', 27, '2014-04-10 06:06:21', 'albums'),
(2220, '-44702020_327337160', 26, '2014-04-10 05:57:08', 'albums'),
(74, '-44702020_2298', 27, '2014-03-20 02:18:21', 'wall'),
(1354, '-44702020_2299', 25, '2014-03-20 02:18:24', 'wall'),
(83, '-44702020_327304015', 32, '2014-04-09 14:34:50', 'albums'),
(1297, '-44702020_327304008', 88, '2014-04-09 14:34:48', 'albums'),
(78, '-44702020_327304006', 26, '2014-04-09 14:34:45', 'albums'),
(860, '-44702020_325554585', 26, '2014-04-10 06:06:27', 'albums'),
(1393, '-44702020_2301', 25, '2014-03-21 00:09:09', 'wall'),
(1643, '-44702020_2271', 26, '2014-03-18 05:31:58', 'wall'),
(1643, '-44702020_325388724', 26, '2014-03-18 05:31:48', 'albums'),
(1265, '-44702020_2293', 25, '2014-03-20 02:18:09', 'wall'),
(1249, '-44702020_2294', 25, '2014-03-20 02:18:12', 'wall'),
(1296, '-44702020_2295', 25, '2014-03-20 02:18:14', 'wall'),
(77, '-44702020_2296', 97, '2014-03-20 02:18:17', 'wall'),
(1421, '-44702020_2297', 25, '2014-03-20 02:18:19', 'wall'),
(1366, '-44702020_2292', 25, '2014-03-20 02:18:07', 'wall'),
(72, '-44702020_2280', 26, '2014-03-20 02:16:52', 'wall'),
(1230, '-44702020_2281', 25, '2014-03-20 02:16:54', 'wall'),
(1414, '-44702020_2282', 25, '2014-03-20 02:16:57', 'wall'),
(101, '-44702020_2283', 94, '2014-03-20 02:16:59', 'wall'),
(73, '-44702020_2284', 26, '2014-03-20 02:17:01', 'wall'),
(80, '-44702020_2285', 32, '2014-03-20 02:17:05', 'wall'),
(75, '-44702020_2286', 27, '2014-03-20 02:17:07', 'wall'),
(78, '-44702020_2287', 1, '2014-03-20 02:17:09', 'wall'),
(76, '-44702020_2288', 27, '2014-03-20 02:17:12', 'wall'),
(100, '-44702020_2289', 27, '2014-03-20 02:17:16', 'wall'),
(1297, '-44702020_2290', 25, '2014-03-20 02:17:19', 'wall'),
(1643, '-44702020_2291', 26, '2014-03-20 02:17:22', 'wall'),
(1316, '-44702020_2302', 25, '2014-03-21 00:09:12', 'wall'),
(1376, '-44702020_2303', 25, '2014-03-21 00:09:14', 'wall'),
(860, '-44702020_2304', 26, '2014-03-21 00:09:17', 'wall'),
(1249, '-44702020_326568199', 88, '2014-04-10 06:06:15', 'albums'),
(1639, '-44702020_325638068', 92, '2014-03-21 02:16:44', 'albums'),
(118, '-44702020_325638070', 26, '2014-03-21 02:16:47', 'albums'),
(1009, '-44702020_325638073', 26, '2014-03-21 02:16:49', 'albums'),
(974, '-44702020_325638074', 26, '2014-03-21 02:16:50', 'albums'),
(1463, '-44702020_325638075', 88, '2014-03-21 02:16:52', 'albums'),
(85, '-44702020_325638077', 88, '2014-03-21 02:16:54', 'albums'),
(84, '-44702020_325638079', 32, '2014-03-21 02:16:57', 'albums'),
(1414, '-44702020_327304004', 88, '2014-04-09 14:34:44', 'albums'),
(1641, '-44702020_325638082', 32, '2014-03-21 02:17:00', 'albums'),
(1607, '-44702020_325638084', 32, '2014-03-21 02:17:02', 'albums'),
(1636, '-44702020_325638085', 32, '2014-03-21 02:17:03', 'albums'),
(82, '-44702020_325638087', 32, '2014-03-21 02:17:05', 'albums'),
(110, '-44702020_325638094', 80, '2014-03-21 02:17:08', 'albums'),
(537, '-44702020_325638098', 26, '2014-03-21 02:17:10', 'albums'),
(756, '-44702020_325638099', 26, '2014-03-21 02:17:10', 'albums'),
(1638, '-44702020_325638104', 32, '2014-03-21 02:17:13', 'albums'),
(94, '-44702020_325638110', 32, '2014-03-21 02:17:15', 'albums'),
(96, '-44702020_325638113', 32, '2014-03-21 02:17:16', 'albums'),
(1640, '-44702020_325638118', 32, '2014-03-21 02:17:18', 'albums'),
(1442, '-44702020_2305', 89, '2014-03-21 02:35:06', 'wall'),
(1639, '-44702020_2306', 92, '2014-03-21 02:35:09', 'wall'),
(118, '-44702020_2307', 26, '2014-03-21 02:35:13', 'wall'),
(1009, '-44702020_2308', 26, '2014-03-21 02:35:16', 'wall'),
(974, '-44702020_2309', 26, '2014-03-21 02:35:19', 'wall'),
(1463, '-44702020_2310', 88, '2014-03-21 02:35:21', 'wall'),
(85, '-44702020_2311', 88, '2014-03-21 02:35:24', 'wall'),
(84, '-44702020_2312', 32, '2014-03-21 02:35:26', 'wall'),
(83, '-44702020_2313', 25, '2014-03-21 02:35:29', 'wall'),
(1641, '-44702020_2314', 32, '2014-03-21 02:35:31', 'wall'),
(1607, '-44702020_2315', 32, '2014-03-21 02:35:33', 'wall'),
(1636, '-44702020_2316', 32, '2014-03-21 02:35:36', 'wall'),
(82, '-44702020_2317', 32, '2014-03-21 02:35:38', 'wall'),
(110, '-44702020_2318', 80, '2014-03-21 02:35:40', 'wall'),
(537, '-44702020_2319', 26, '2014-03-21 02:35:43', 'wall'),
(756, '-44702020_2320', 26, '2014-03-21 02:35:45', 'wall'),
(1638, '-44702020_2321', 32, '2014-03-21 02:35:48', 'wall'),
(94, '-44702020_2322', 32, '2014-03-21 02:35:50', 'wall'),
(96, '-44702020_2323', 32, '2014-03-21 02:35:53', 'wall'),
(1640, '-44702020_2324', 32, '2014-03-21 02:35:55', 'wall'),
(1635, '-44702020_325639267', 32, '2014-03-21 02:41:43', 'albums'),
(119, '-44702020_325639269', 26, '2014-03-21 02:41:45', 'albums'),
(902, '-44702020_325639271', 97, '2014-03-21 02:41:46', 'albums'),
(1209, '-44702020_325639273', 97, '2014-03-21 02:41:48', 'albums'),
(944, '-44702020_325639276', 97, '2014-03-21 02:41:50', 'albums'),
(1208, '-44702020_325639280', 26, '2014-03-21 02:41:51', 'albums'),
(1138, '-44702020_325639282', 26, '2014-03-21 02:41:54', 'albums'),
(106, '-44702020_325639287', 80, '2014-03-21 02:41:56', 'albums'),
(98, '-44702020_325639290', 32, '2014-03-21 02:41:57', 'albums'),
(99, '-44702020_325639296', 32, '2014-03-21 02:41:59', 'albums'),
(97, '-44702020_325639298', 32, '2014-03-21 02:42:02', 'albums'),
(908, '-44702020_325639299', 26, '2014-03-21 02:42:02', 'albums'),
(117, '-44702020_325639301', 26, '2014-03-21 02:42:04', 'albums'),
(120, '-44702020_325639306', 26, '2014-03-21 02:42:07', 'albums'),
(107, '-44702020_325639308', 80, '2014-04-10 06:07:18', 'albums'),
(109, '-44702020_325639312', 80, '2014-04-10 06:07:18', 'albums'),
(115, '-44702020_325639319', 80, '2014-04-10 06:07:19', 'albums'),
(108, '-44702020_325639320', 80, '2014-04-10 06:07:20', 'albums'),
(1635, '-44702020_2325', 32, '2014-03-21 02:42:19', 'wall'),
(1230, '-44702020_327303998', 88, '2014-04-09 14:34:42', 'albums'),
(1171, '-44702020_325639328', 62, '2014-04-10 06:07:21', 'albums'),
(119, '-44702020_2326', 26, '2014-03-21 02:42:21', 'wall'),
(902, '-44702020_2327', 97, '2014-03-21 02:42:24', 'wall'),
(1209, '-44702020_2328', 97, '2014-03-21 02:42:26', 'wall'),
(944, '-44702020_2329', 97, '2014-03-21 02:42:29', 'wall'),
(1208, '-44702020_2330', 26, '2014-03-21 02:42:31', 'wall'),
(1138, '-44702020_2331', 26, '2014-03-24 00:27:18', 'wall'),
(106, '-44702020_2332', 80, '2014-03-24 00:27:22', 'wall'),
(99, '-44702020_2333', 32, '2014-03-24 00:27:24', 'wall'),
(98, '-44702020_2334', 32, '2014-03-24 00:27:27', 'wall'),
(97, '-44702020_2335', 32, '2014-03-24 00:27:30', 'wall'),
(908, '-44702020_2336', 26, '2014-03-24 00:27:33', 'wall'),
(117, '-44702020_2337', 26, '2014-03-24 00:27:35', 'wall'),
(1138, '-44702020_2338', 26, '2014-03-24 00:27:36', 'wall'),
(120, '-44702020_2339', 26, '2014-03-24 00:27:38', 'wall'),
(106, '-44702020_2340', 80, '2014-03-24 00:27:39', 'wall'),
(107, '-44702020_2341', 80, '2014-03-24 00:27:41', 'wall'),
(99, '-44702020_2342', 32, '2014-03-24 00:27:42', 'wall'),
(109, '-44702020_2343', 80, '2014-03-24 00:27:43', 'wall'),
(98, '-44702020_2344', 32, '2014-03-24 00:27:44', 'wall'),
(115, '-44702020_2345', 80, '2014-03-24 00:27:46', 'wall'),
(97, '-44702020_2346', 32, '2014-03-24 00:27:47', 'wall'),
(108, '-44702020_2347', 80, '2014-03-24 00:27:48', 'wall'),
(908, '-44702020_2348', 26, '2014-03-24 00:27:49', 'wall'),
(1359, '-44702020_2349', 25, '2014-03-24 00:27:51', 'wall'),
(117, '-44702020_2350', 26, '2014-03-24 00:27:51', 'wall'),
(1171, '-44702020_2351', 62, '2014-03-24 00:27:53', 'wall'),
(120, '-44702020_2352', 26, '2014-03-24 00:27:54', 'wall'),
(107, '-44702020_2353', 80, '2014-03-24 00:27:56', 'wall'),
(109, '-44702020_2354', 80, '2014-03-24 00:27:59', 'wall'),
(115, '-44702020_2355', 80, '2014-03-24 00:28:01', 'wall'),
(108, '-44702020_2356', 80, '2014-03-24 00:28:04', 'wall'),
(1359, '-44702020_2357', 25, '2014-03-24 00:28:06', 'wall'),
(1171, '-44702020_2358', 62, '2014-03-24 00:28:08', 'wall'),
(1535, '-44702020_326103984', 81, '2014-04-10 06:06:25', 'albums'),
(1536, '-44702020_326103988', 81, '2014-04-10 06:06:26', 'albums'),
(1541, '-44702020_326103993', 81, '2014-03-26 08:07:28', 'albums'),
(938, '-44702020_326103994', 26, '2014-03-26 08:07:29', 'albums'),
(1415, '-44702020_326103996', 88, '2014-03-26 08:07:31', 'albums'),
(1617, '-44702020_326104006', 68, '2014-03-26 08:07:35', 'albums'),
(1612, '-44702020_326104010', 68, '2014-03-26 08:07:37', 'albums'),
(755, '-44702020_326104012', 26, '2014-03-26 08:07:38', 'albums'),
(1644, '-44702020_326104015', 26, '2014-03-26 08:07:40', 'albums'),
(1363, '-44702020_326104019', 32, '2014-03-26 08:07:42', 'albums'),
(1352, '-44702020_326104020', 32, '2014-03-26 08:07:43', 'albums'),
(1073, '-44702020_326104023', 60, '2014-03-26 08:07:45', 'albums'),
(1616, '-44702020_326104027', 67, '2014-03-26 08:07:48', 'albums'),
(1523, '-44702020_326104033', 75, '2014-03-26 08:07:51', 'albums'),
(1202, '-44702020_326104038', 26, '2014-03-26 08:07:53', 'albums'),
(1592, '-44702020_326104041', 67, '2014-03-26 08:07:56', 'albums'),
(1517, '-44702020_326104046', 79, '2014-03-26 08:07:58', 'albums'),
(1622, '-44702020_326104049', 67, '2014-03-26 08:08:00', 'albums'),
(91, '-44702020_326104052', 88, '2014-04-10 06:07:22', 'albums'),
(114, '-44702020_326104055', 80, '2014-04-10 06:07:25', 'albums'),
(111, '-44702020_326104113', 80, '2014-04-10 06:07:26', 'albums'),
(116, '-44702020_326104118', 80, '2014-04-10 06:07:26', 'albums'),
(112, '-44702020_326104120', 80, '2014-04-10 06:07:27', 'albums'),
(81, '-44702020_326104123', 91, '2014-03-26 08:09:05', 'albums'),
(741, '-44702020_326104125', 26, '2014-03-26 08:09:07', 'albums'),
(88, '-44702020_326104130', 88, '2014-03-26 08:09:10', 'albums'),
(104, '-44702020_326104135', 28, '2014-03-26 08:09:12', 'albums'),
(103, '-44702020_326104137', 28, '2014-03-26 08:09:15', 'albums'),
(89, '-44702020_326104141', 88, '2014-03-26 08:09:17', 'albums'),
(90, '-44702020_326104144', 88, '2014-03-26 08:09:20', 'albums'),
(86, '-44702020_326104145', 88, '2014-03-26 08:09:22', 'albums'),
(93, '-44702020_326104148', 88, '2014-03-26 08:09:24', 'albums'),
(1354, '-44702020_327303995', 32, '2014-04-09 14:34:40', 'albums'),
(92, '-44702020_326104152', 88, '2014-03-26 08:09:27', 'albums'),
(105, '-44702020_326104157', 28, '2014-03-26 08:09:30', 'albums'),
(87, '-44702020_326104160', 88, '2014-03-26 08:09:33', 'albums'),
(1532, '-44702020_326104164', 74, '2014-03-26 08:09:35', 'albums'),
(1532, '-44702020_326104165', 74, '2014-03-26 08:09:35', 'albums'),
(1421, '-44702020_327303991', 88, '2014-04-09 14:34:39', 'albums'),
(1393, '-44702020_327303987', 88, '2014-04-09 14:34:37', 'albums'),
(937, '-44702020_326104173', 60, '2014-03-26 08:09:38', 'albums'),
(937, '-44702020_326104174', 60, '2014-03-26 08:09:39', 'albums'),
(1511, '-44702020_326104177', 75, '2014-03-26 08:09:41', 'albums'),
(1511, '-44702020_326104178', 75, '2014-03-26 08:09:41', 'albums'),
(1503, '-44702020_326104181', 75, '2014-03-26 08:09:43', 'albums'),
(1512, '-44702020_326104182', 75, '2014-03-26 08:09:45', 'albums'),
(812, '-44702020_326104183', 26, '2014-03-26 08:09:46', 'albums'),
(1535, '-44702020_2359', 81, '2014-03-26 08:10:59', 'wall'),
(1536, '-44702020_2360', 81, '2014-03-26 08:11:01', 'wall'),
(1541, '-44702020_2361', 81, '2014-03-26 08:11:03', 'wall'),
(938, '-44702020_2362', 26, '2014-03-26 08:11:06', 'wall'),
(1415, '-44702020_2363', 88, '2014-03-26 08:11:08', 'wall'),
(1612, '-44702020_2364', 68, '2014-03-26 08:11:10', 'wall'),
(1617, '-44702020_2365', 68, '2014-03-26 08:11:13', 'wall'),
(755, '-44702020_2366', 26, '2014-03-26 08:11:15', 'wall'),
(1644, '-44702020_2367', 26, '2014-03-26 08:11:17', 'wall'),
(1363, '-44702020_2368', 32, '2014-03-26 08:11:20', 'wall'),
(1352, '-44702020_2369', 32, '2014-03-26 08:11:23', 'wall'),
(1073, '-44702020_2370', 60, '2014-03-26 08:11:25', 'wall'),
(1616, '-44702020_2371', 67, '2014-03-26 08:11:28', 'wall'),
(1523, '-44702020_2372', 75, '2014-03-26 08:11:31', 'wall'),
(1202, '-44702020_2373', 26, '2014-03-26 08:11:34', 'wall'),
(1592, '-44702020_2374', 67, '2014-03-26 08:11:37', 'wall'),
(1517, '-44702020_2375', 79, '2014-03-26 08:11:39', 'wall'),
(1622, '-44702020_2376', 67, '2014-03-26 08:11:42', 'wall'),
(91, '-44702020_2377', 88, '2014-03-26 08:11:44', 'wall'),
(114, '-44702020_2378', 80, '2014-03-26 08:11:47', 'wall'),
(116, '-44702020_2379', 80, '2014-03-26 08:12:20', 'wall'),
(112, '-44702020_2380', 80, '2014-03-26 08:12:22', 'wall'),
(81, '-44702020_2381', 91, '2014-03-26 08:12:25', 'wall'),
(741, '-44702020_2382', 26, '2014-03-26 08:12:28', 'wall'),
(88, '-44702020_2383', 88, '2014-03-26 08:12:30', 'wall'),
(104, '-44702020_2384', 28, '2014-03-26 08:12:33', 'wall'),
(103, '-44702020_2385', 28, '2014-03-26 08:12:36', 'wall'),
(89, '-44702020_2386', 88, '2014-03-26 08:12:39', 'wall'),
(90, '-44702020_2387', 88, '2014-03-26 08:12:43', 'wall'),
(86, '-44702020_2388', 88, '2014-03-26 08:12:45', 'wall'),
(93, '-44702020_2389', 88, '2014-03-26 08:12:48', 'wall'),
(1238, '-44702020_2390', 25, '2014-03-26 08:12:51', 'wall'),
(92, '-44702020_2391', 88, '2014-03-26 08:12:53', 'wall'),
(105, '-44702020_2392', 28, '2014-03-26 08:12:55', 'wall'),
(87, '-44702020_2393', 88, '2014-03-26 08:12:58', 'wall'),
(1532, '-44702020_2394', 74, '2014-03-26 08:13:00', 'wall'),
(540, '-44702020_2395', 66, '2014-03-26 08:13:03', 'wall'),
(937, '-44702020_2396', 60, '2014-03-26 08:13:05', 'wall'),
(1512, '-44702020_2397', 75, '2014-03-26 08:13:08', 'wall'),
(111, '-44702020_2398', 80, '2014-03-26 08:13:28', 'wall'),
(1503, '-44702020_2399', 75, '2014-03-26 08:13:31', 'wall'),
(1511, '-44702020_2400', 75, '2014-03-26 08:13:33', 'wall'),
(812, '-44702020_2401', 26, '2014-03-26 08:13:36', 'wall'),
(1646, '-44702020_326568329', 59, '2014-03-31 14:13:46', 'albums'),
(1296, '-44702020_327303984', 68, '2014-04-09 14:34:34', 'albums'),
(1265, '-44702020_327303980', 88, '2014-04-09 14:34:33', 'albums'),
(906, '-44702020_326568339', 26, '2014-03-31 14:13:49', 'albums'),
(906, '-44702020_326568340', 26, '2014-03-31 14:13:49', 'albums'),
(2090, '-44702020_327337159', 59, '2014-04-10 05:57:06', 'albums'),
(1238, '-44702020_327304036', 88, '2014-04-09 14:34:57', 'albums'),
(726, '-44702020_326568349', 26, '2014-03-31 14:13:54', 'albums'),
(538, '-44702020_327304032', 26, '2014-04-09 14:34:56', 'albums'),
(1133, '-44702020_326568355', 26, '2014-03-31 14:13:58', 'albums'),
(1647, '-44702020_327304023', 26, '2014-04-09 14:34:53', 'albums'),
(1359, '-44702020_326568362', 88, '2014-04-10 06:07:20', 'albums'),
(1137, '-44702020_326568368', 27, '2014-04-10 06:07:22', 'albums'),
(1366, '-44702020_327303977', 32, '2014-04-09 14:34:31', 'albums'),
(540, '-44702020_326568375', 66, '2014-03-31 14:14:09', 'albums'),
(724, '-44702020_2402', 26, '2014-03-31 14:15:34', 'wall'),
(1647, '-44702020_2403', 1, '2014-03-31 14:15:37', 'wall'),
(1133, '-44702020_2404', 26, '2014-03-31 14:15:40', 'wall'),
(538, '-44702020_2405', 1, '2014-03-31 14:15:44', 'wall'),
(1137, '-44702020_2406', 27, '2014-03-31 14:15:46', 'wall'),
(1121, '-44702020_327042817', 62, '2014-04-10 06:06:23', 'albums'),
(999, '-44702020_327042824', 26, '2014-04-10 06:06:24', 'albums'),
(1128, '-44702020_327042828', 59, '2014-04-10 06:06:25', 'albums'),
(924, '-44702020_327042831', 60, '2014-04-06 12:08:37', 'albums'),
(1102, '-44702020_327042836', 60, '2014-04-06 12:08:39', 'albums'),
(1650, '-44702020_327042838', 27, '2014-04-06 12:08:40', 'albums'),
(957, '-44702020_327042844', 97, '2014-04-06 12:08:42', 'albums'),
(746, '-44702020_327042848', 26, '2014-04-06 12:08:44', 'albums'),
(751, '-44702020_327042850', 26, '2014-04-06 12:08:46', 'albums'),
(986, '-44702020_327042856', 26, '2014-04-10 06:07:15', 'albums'),
(958, '-44702020_327042865', 27, '2014-04-10 06:07:23', 'albums'),
(1648, '-44702020_327042869', 27, '2014-04-10 06:07:24', 'albums'),
(1649, '-44702020_327042873', 27, '2014-04-10 06:07:24', 'albums'),
(871, '-44702020_327042878', 26, '2014-04-06 12:09:00', 'albums'),
(1148, '-44702020_327042880', 59, '2014-04-06 12:09:01', 'albums'),
(1050, '-44702020_327042884', 66, '2014-04-06 12:09:03', 'albums'),
(2357, '-44702020_327182477', 26, '2014-04-08 07:26:37', 'albums'),
(1656, '-44702020_327182480', 26, '2014-04-08 07:26:39', 'albums'),
(1657, '-44702020_327182483', 26, '2014-04-08 07:26:40', 'albums'),
(1658, '-44702020_327182489', 26, '2014-04-08 07:26:43', 'albums'),
(1653, '-44702020_327182496', 26, '2014-04-08 07:26:45', 'albums'),
(1659, '-44702020_327182497', 26, '2014-04-08 07:26:46', 'albums'),
(1660, '-44702020_327182504', 26, '2014-04-10 06:07:16', 'albums'),
(1654, '-44702020_327182507', 26, '2014-04-10 06:07:16', 'albums'),
(1655, '-44702020_327182509', 26, '2014-04-10 06:07:17', 'albums'),
(1651, '-44702020_327182513', 26, '2014-04-10 06:07:28', 'albums'),
(1652, '-44702020_327182516', 26, '2014-04-08 07:26:56', 'albums'),
(2364, '-44702020_327292688', 26, '2014-04-09 12:52:11', 'albums'),
(2358, '-44702020_327292691', 26, '2014-04-09 12:52:13', 'albums'),
(2362, '-44702020_327292694', 26, '2014-04-09 12:52:15', 'albums'),
(2360, '-44702020_327292697', 26, '2014-04-09 12:52:17', 'albums'),
(2359, '-44702020_327292707', 26, '2014-04-09 12:52:19', 'albums'),
(2363, '-44702020_327292709', 26, '2014-04-09 12:52:20', 'albums'),
(2361, '-44702020_327292710', 26, '2014-04-09 12:52:22', 'albums'),
(1274, '-44702020_327292712', 88, '2014-04-09 12:52:24', 'albums'),
(1121, '-44702020_2407', 62, '2014-04-09 13:09:04', 'wall'),
(999, '-44702020_2408', 26, '2014-04-09 13:09:07', 'wall'),
(1128, '-44702020_2409', 59, '2014-04-09 13:09:09', 'wall'),
(924, '-44702020_2410', 60, '2014-04-09 13:09:12', 'wall'),
(960, '-44702020_2411', 26, '2014-04-09 13:09:14', 'wall'),
(1646, '-44702020_2412', 59, '2014-04-09 13:09:17', 'wall'),
(1102, '-44702020_2413', 60, '2014-04-09 13:09:19', 'wall'),
(1650, '-44702020_2414', 27, '2014-04-09 13:09:22', 'wall'),
(957, '-44702020_2415', 97, '2014-04-09 13:09:25', 'wall'),
(746, '-44702020_2416', 26, '2014-04-09 13:09:28', 'wall'),
(906, '-44702020_2417', 26, '2014-04-09 13:09:30', 'wall'),
(2364, '-44702020_2418', 26, '2014-04-09 13:09:33', 'wall'),
(2357, '-44702020_2419', 26, '2014-04-09 13:09:35', 'wall'),
(2358, '-44702020_2420', 26, '2014-04-09 13:09:38', 'wall'),
(1656, '-44702020_2421', 26, '2014-04-09 13:09:40', 'wall'),
(2362, '-44702020_2422', 26, '2014-04-09 13:09:43', 'wall'),
(2360, '-44702020_2423', 26, '2014-04-09 13:09:45', 'wall'),
(2359, '-44702020_2424', 26, '2014-04-09 13:09:48', 'wall'),
(1657, '-44702020_2425', 26, '2014-04-09 13:09:50', 'wall'),
(2363, '-44702020_2426', 26, '2014-04-09 13:09:53', 'wall'),
(1658, '-44702020_2427', 26, '2014-04-09 13:11:03', 'wall'),
(1653, '-44702020_2428', 26, '2014-04-09 13:11:06', 'wall'),
(1659, '-44702020_2429', 26, '2014-04-09 13:11:08', 'wall'),
(2361, '-44702020_2430', 26, '2014-04-09 13:11:11', 'wall'),
(1052, '-44702020_2431', 1, '2014-04-09 13:11:13', 'wall'),
(726, '-44702020_2432', 26, '2014-04-09 13:11:16', 'wall'),
(751, '-44702020_2433', 26, '2014-04-09 13:11:18', 'wall'),
(986, '-44702020_2434', 26, '2014-04-09 13:11:21', 'wall'),
(1660, '-44702020_2435', 26, '2014-04-09 13:11:23', 'wall'),
(1654, '-44702020_2436', 26, '2014-04-09 13:11:26', 'wall'),
(1655, '-44702020_2437', 26, '2014-04-09 13:11:28', 'wall'),
(1274, '-44702020_2438', 88, '2014-04-09 13:11:31', 'wall'),
(958, '-44702020_2439', 27, '2014-04-09 13:11:33', 'wall'),
(1648, '-44702020_2440', 27, '2014-04-09 13:11:36', 'wall'),
(1649, '-44702020_2441', 27, '2014-04-09 13:11:39', 'wall'),
(1651, '-44702020_2442', 26, '2014-04-09 13:11:42', 'wall'),
(1652, '-44702020_2443', 26, '2014-04-09 13:11:44', 'wall'),
(871, '-44702020_2444', 26, '2014-04-09 13:11:47', 'wall'),
(1148, '-44702020_2445', 59, '2014-04-09 13:11:49', 'wall'),
(1050, '-44702020_2446', 66, '2014-04-09 13:11:52', 'wall'),
(2227, '-44702020_327337164', 26, '2014-04-10 05:57:10', 'albums'),
(1829, '-44702020_327337167', 26, '2014-04-10 05:57:12', 'albums'),
(2090, '-44702020_2447', 59, '2014-04-10 05:58:02', 'wall'),
(2220, '-44702020_2448', 26, '2014-04-10 05:58:05', 'wall'),
(2227, '-44702020_2449', 26, '2014-04-10 05:58:08', 'wall'),
(1829, '-44702020_2450', 26, '2014-04-10 05:58:10', 'wall'),
(2031, '-44702020_327456020', 26, '2014-04-11 13:25:09', 'albums'),
(1860, '-44702020_327456027', 62, '2014-04-11 13:25:12', 'albums'),
(2318, '-44702020_327456028', 62, '2014-04-11 13:25:13', 'albums'),
(1855, '-44702020_327456036', 62, '2014-04-11 13:25:16', 'albums'),
(2246, '-44702020_327456045', 63, '2014-04-11 13:25:19', 'albums'),
(2207, '-44702020_327456049', 63, '2014-04-11 13:25:21', 'albums'),
(2244, '-44702020_327456052', 27, '2014-04-11 13:25:22', 'albums'),
(2249, '-44702020_327456058', 27, '2014-04-11 13:25:25', 'albums'),
(2325, '-44702020_327456064', 27, '2014-04-11 13:25:28', 'albums'),
(1838, '-44702020_327456069', 63, '2014-04-11 13:25:29', 'albums'),
(2272, '-44702020_327456072', 63, '2014-04-11 13:25:31', 'albums'),
(2004, '-44702020_327456078', 26, '2014-04-11 13:25:34', 'albums'),
(2250, '-44702020_327456086', 26, '2014-04-11 13:25:36', 'albums'),
(2260, '-44702020_327456094', 26, '2014-04-11 13:25:38', 'albums'),
(2271, '-44702020_327456100', 26, '2014-04-11 13:25:41', 'albums'),
(2352, '-44702020_327456103', 26, '2014-04-11 13:25:43', 'albums'),
(1980, '-44702020_327456106', 26, '2014-04-11 13:25:46', 'albums'),
(2168, '-44702020_327456110', 26, '2014-04-11 13:25:49', 'albums'),
(1987, '-44702020_327456114', 26, '2014-04-11 13:25:50', 'albums'),
(2095, '-44702020_327456119', 26, '2014-04-11 13:25:52', 'albums'),
(1959, '-44702020_327456159', 26, '2014-04-11 13:26:13', 'albums'),
(2031, '-44702020_2452', 26, '2014-04-11 13:27:33', 'wall'),
(1860, '-44702020_2453', 62, '2014-04-11 13:27:36', 'wall');

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

CREATE ALGORITHM=UNDEFINED DEFINER=`rumusby_ZwptxEvT`@`localhost` SQL SECURITY DEFINER VIEW `needlessimage_view` AS select distinct `banner_image`.`image` AS `image` from `banner_image` where (`banner_image`.`image` like 'data/%') union select distinct `category`.`image` AS `image` from `category` where (`category`.`image` like 'data/%') union select distinct `download`.`filename` AS `image` from `download` where (`download`.`filename` like 'data/%') union select distinct `manufacturer`.`image` AS `image` from `manufacturer` where (`manufacturer`.`image` like 'data/%') union select distinct `option_value`.`image` AS `image` from `option_value` where (`option_value`.`image` like 'data/%') union select distinct `order_download`.`filename` AS `image` from `order_download` where (`order_download`.`filename` like 'data/%') union select distinct `product`.`image` AS `image` from `product` where (`product`.`image` like 'data/%') union select distinct `product_image`.`image` AS `image` from `product_image` where (`product_image`.`image` like 'data/%') union select distinct `setting`.`value` AS `image` from `setting` where (`setting`.`value` like 'data/%') union select distinct `voucher_theme`.`image` AS `image` from `voucher_theme` where (`voucher_theme`.`image` like 'data/%') union select distinct `product_option_value`.`ob_image` AS `image` from `product_option_value` where (`product_option_value`.`ob_image` like 'data/%');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
