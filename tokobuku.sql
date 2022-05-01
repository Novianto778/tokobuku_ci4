-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2022 at 01:56 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokobuku`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `release_year` smallint(4) NOT NULL,
  `author` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `discount` decimal(4,2) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `cover` varchar(100) DEFAULT NULL,
  `book_category_id` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `title`, `slug`, `release_year`, `author`, `price`, `discount`, `stock`, `cover`, `book_category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(19, 'Atomic Habits', 'atomic-habits', 2017, 'James Clear', 75000, '0.20', 67, '1648812764_f6b93a0447cb3eb868f7.jpg', 1, '2022-04-01 06:32:44', '2022-04-01 06:32:44', NULL),
(20, 'Novianto', 'novianto', 2002, 'Novianto', 221102, '0.20', 2, '1650195509_0d43733211070f5d7c12.jpg', 1, '2022-04-17 06:38:29', '2022-04-17 06:38:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `book_category_id` int(5) NOT NULL,
  `name_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`book_category_id`, `name_category`) VALUES
(1, 'Buku Pelajaran'),
(2, 'Novel'),
(3, 'Komik');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `no_customer` varchar(30) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `no_customer`, `gender`, `address`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(3, 'Ki Anom', '1', 'L', 'Jalan janti 65', 'example@mail.com', '08523654896', '2022-04-02 10:39:11', '2022-04-02 10:39:11'),
(4, 'Ki Anom', '1', 'L', 'Jalan janti 65', 'example@mail.com', '08523654896', '2022-04-02 10:39:11', '2022-04-02 10:39:11'),
(5, 'Dharma', '1', 'L', 'Jalan janti 65', 'example@mail.com', '08523654896', '2022-04-02 10:49:59', '2022-04-02 10:49:59'),
(6, 'Bekti', '3', 'L', 'Jalan janti 65', 'example@mail.com', '08523654896', '2022-04-02 10:49:59', '2022-04-02 10:49:59'),
(7, 'Naradi Dongoran', '1503076312996351', 'L', 'Psr. Setia Budi No. 428, Batam 12191, Sumut', 'wprayoga@yahoo.com', '(+62) 24 8999 337', '1972-09-24 22:14:57', '2013-10-10 02:08:19'),
(8, 'Jane Agustina M.Farm', '1403206102211981', 'L', 'Dk. Baja Raya No. 253, Bontang 76689, Jatim', 'adika65@gmail.co.id', '(+62) 807 7505 6574', '1998-04-04 02:17:21', '2017-12-05 15:24:23'),
(9, 'Kajen Mustofa', '9115570203162193', 'L', 'Ds. Asia Afrika No. 164, Yogyakarta 72827, DIY', 'saadat.utami@yuniar.name', '0826 1800 959', '2001-08-12 22:05:59', '1972-10-02 19:19:46'),
(10, 'Karen Zahra Suartini M.Kom.', '3526086304138763', 'L', 'Psr. Jakarta No. 326, Samarinda 64121, Papua', 'queen18@yahoo.com', '(+62) 681 4006 381', '1992-08-25 03:57:08', '2014-02-24 11:14:04'),
(11, 'Rudi Maryadi', '5320332109001799', 'L', 'Jln. Bappenas No. 424, Sorong 56098, DKI', 'uwinarno@anggraini.biz', '0587 8406 3279', '1987-02-06 01:07:58', '2013-05-29 22:34:00'),
(12, 'Halim Budiyanto', '8203742210078335', 'L', 'Jr. Daan No. 307, Kendari 53275, Sulsel', 'xsuwarno@usamah.com', '(+62) 27 1637 739', '1988-02-03 05:01:26', '1992-03-10 06:22:45'),
(13, 'Keisha Mulyani', '3205242203137483', 'L', 'Ki. Gatot Subroto No. 786, Tebing Tinggi 16576, Kalbar', 'nlatupono@marpaung.my.id', '(+62) 326 5919 636', '1996-08-06 05:55:30', '2007-08-21 10:12:43'),
(14, 'Fathonah Anggraini S.Ked', '1611202204984341', 'L', 'Jr. Ikan No. 241, Padang 30670, Jateng', 'qmahendra@januar.name', '(+62) 28 3657 5326', '1981-08-16 13:29:24', '1977-07-05 01:49:27'),
(15, 'Nova Rahmawati', '9206862910125432', 'L', 'Gg. Bara No. 883, Mataram 96012, Pabar', 'reksa69@gmail.com', '(+62) 214 1701 5246', '1995-08-19 23:58:50', '2007-09-19 20:51:07'),
(16, 'Hasan Nainggolan', '3312910407095504', 'L', 'Ds. Babadak No. 454, Mojokerto 58457, Sulut', 'kadir27@mulyani.desa.id', '0747 3136 741', '2002-01-22 15:54:20', '2004-01-07 11:02:19'),
(17, 'Dimaz Elvin Sitorus', '7111760511968135', 'L', 'Gg. Tubagus Ismail No. 264, Pekanbaru 75080, Sultra', 'uyainah.kemal@usamah.web.id', '(+62) 320 4808 5415', '1992-12-23 20:34:15', '2014-01-21 05:43:57'),
(18, 'Puspa Rahayu', '8207652012136521', 'L', 'Ki. Jambu No. 150, Bontang 67039, Bengkulu', 'ana03@gmail.co.id', '(+62) 373 2340 9967', '1999-01-04 01:53:13', '1997-03-22 08:03:41'),
(19, 'Ismail Liman Jailani S.Gz', '5309331605216118', 'L', 'Jr. Bambu No. 900, Magelang 18095, Kalbar', 'liman19@nashiruddin.desa.id', '0859 6107 282', '1991-02-26 09:53:27', '1975-06-03 14:41:41'),
(20, 'Ami Nurdiyanti', '6208002308025931', 'L', 'Jr. Asia Afrika No. 347, Bogor 48488, Maluku', 'warji10@budiman.name', '0392 3773 653', '2003-05-10 09:35:52', '2003-11-25 13:06:35'),
(21, 'Irma Widiastuti', '1508194907961758', 'L', 'Jln. Raden Saleh No. 721, Pekanbaru 86624, Kalsel', 'zwijayanti@yahoo.com', '(+62) 29 1033 5031', '1983-09-09 01:37:45', '1971-04-04 10:11:40'),
(22, 'Prayogo Utama', '6213845612922760', 'L', 'Dk. Ciwastra No. 179, Mojokerto 30474, Kalteng', 'karma95@yahoo.com', '(+62) 467 0365 771', '1990-05-14 22:07:46', '2004-09-12 22:37:49'),
(23, 'Maria Nurdiyanti', '3510876312937505', 'L', 'Jr. R.E. Martadinata No. 772, Bandung 75317, Bengkulu', 'nardi65@yahoo.com', '(+62) 541 2966 025', '2014-08-06 22:57:50', '1979-12-25 22:33:53'),
(24, 'Cakrawangsa Ardianto', '1111270804169079', 'L', 'Gg. Gegerkalong Hilir No. 442, Banjarbaru 58968, Babel', 'zmardhiyah@pertiwi.desa.id', '0534 3920 607', '1970-08-10 07:42:04', '2004-01-12 05:14:42'),
(25, 'Tina Mandasari', '7502061608959174', 'L', 'Dk. Karel S. Tubun No. 758, Serang 36202, DIY', 'lurhur56@yahoo.co.id', '0631 7753 538', '1976-03-26 03:41:02', '1986-03-08 09:52:48'),
(26, 'Ganjaran Setya Firgantoro', '1117834404194192', 'L', 'Ds. Ciumbuleuit No. 339, Dumai 92703, DIY', 'usyi40@yahoo.com', '0833 3674 7625', '1990-03-13 18:50:24', '1997-10-21 18:14:17'),
(27, 'Zamira Lestari', '1571424111216933', 'L', 'Jr. Banceng Pondok No. 661, Blitar 43896, Kalsel', 'hidayanto.amalia@gmail.com', '(+62) 991 7982 998', '1972-01-26 05:56:28', '1971-11-23 07:36:21'),
(28, 'Eka Laksita', '1502084203139084', 'L', 'Kpg. Otista No. 552, Bogor 44057, Sulbar', 'eli91@gmail.com', '0300 8328 505', '2017-04-07 19:58:02', '1980-07-07 11:50:40'),
(29, 'Ratih Farida', '3471516001022938', 'L', 'Psr. Sugiyopranoto No. 755, Administrasi Jakarta Pusat 51182, Kalsel', 'hani91@suryono.org', '0803 0363 0242', '1972-04-07 13:16:00', '1999-09-11 05:21:22'),
(30, 'Karja Napitupulu', '3672982508148889', 'L', 'Psr. Tangkuban Perahu No. 284, Gunungsitoli 55060, Sultra', 'safina.astuti@riyanti.my.id', '(+62) 876 2382 5565', '1997-11-22 00:46:24', '2020-01-03 22:14:21'),
(31, 'Kanda Yoga Salahudin S.Farm', '1209826005176640', 'L', 'Ds. Bagis Utama No. 768, Sawahlunto 89687, Kalbar', 'icha01@utama.go.id', '(+62) 706 8980 1841', '2021-07-17 12:11:45', '2012-09-27 16:06:59'),
(32, 'Jaeman Saka Kuswoyo', '8104185809090037', 'L', 'Jr. Gedebage Selatan No. 913, Yogyakarta 70549, Sumbar', 'abyasa14@firmansyah.co.id', '(+62) 208 8236 7307', '2008-08-23 18:35:21', '1986-06-14 20:59:35'),
(33, 'Ratna Hastuti S.Pd', '1213465901213000', 'L', 'Jln. Tambak No. 798, Pontianak 49414, Bali', 'farah.hastuti@gmail.co.id', '0811 933 665', '1980-01-24 17:34:03', '2009-12-27 22:47:52'),
(34, 'Dimaz Nugroho S.Pd', '1273282701978327', 'L', 'Jr. Bak Mandi No. 556, Palembang 30699, Babel', 'hassanah.eli@gmail.co.id', '0982 7194 510', '2002-02-07 07:08:01', '2010-01-10 22:48:51'),
(35, 'Nabila Safitri', '1214224707027502', 'L', 'Ki. Baya Kali Bungur No. 44, Yogyakarta 68904, DIY', 'salwa52@gmail.co.id', '(+62) 22 5244 2944', '1985-11-05 19:39:36', '2020-02-11 14:29:15'),
(36, 'Hasta Mustika Iswahyudi', '7471312803200245', 'L', 'Dk. Bara Tambar No. 451, Kupang 95701, Kaltara', 'ksitompul@suartini.in', '(+62) 21 8317 332', '1991-06-29 08:11:53', '1986-11-09 10:07:05'),
(37, 'Almira Agustina S.Ked', '9116691601076870', 'L', 'Psr. Industri No. 454, Depok 43275, Kalbar', 'puspita.daru@sudiati.com', '0933 5486 8460', '2017-11-23 23:18:20', '2022-01-13 16:51:30'),
(38, 'Usyi Hariyah S.IP', '1509884411062783', 'L', 'Ki. Kebonjati No. 296, Kendari 32750, Bali', 'aryani.indah@lailasari.go.id', '0569 2523 921', '2016-10-15 12:35:14', '2010-07-12 08:40:05'),
(39, 'Daryani Marpaung', '6112946207126573', 'L', 'Gg. Krakatau No. 38, Tasikmalaya 41736, Sulsel', 'nyulianti@najmudin.go.id', '0715 0957 8953', '2011-02-12 20:26:33', '2007-06-30 21:11:19'),
(40, 'Uli Nurdiyanti', '9119877103122119', 'L', 'Psr. Krakatau No. 905, Bau-Bau 69831, Sulbar', 'zaenab.suryatmi@uwais.biz.id', '0516 9658 773', '1970-02-18 02:07:30', '1993-06-29 06:20:20'),
(41, 'Cawuk Umaya Halim S.Farm', '9205647101107947', 'L', 'Ki. B.Agam Dlm No. 962, Administrasi Jakarta Selatan 73519, Sulteng', 'tamba.karya@winarsih.id', '(+62) 866 115 243', '1981-12-27 20:11:49', '1989-03-03 04:49:28'),
(42, 'Adhiarja Eka Suryono M.Kom.', '1704413010953617', 'L', 'Ds. Veteran No. 243, Pariaman 80694, NTB', 'pmulyani@yahoo.co.id', '(+62) 988 9862 743', '1972-03-17 05:20:30', '1976-09-16 23:32:19'),
(43, 'Oni Fujiati', '3524421504080886', 'L', 'Ds. Ir. H. Juanda No. 848, Banda Aceh 42125, Kalbar', 'mulya.novitasari@gmail.com', '0367 3622 186', '2011-02-01 15:14:03', '1971-05-17 10:13:31'),
(44, 'Padma Handayani', '6105412002995936', 'L', 'Dk. Thamrin No. 445, Bandung 64982, Sumut', 'ulya.halim@nugroho.org', '(+62) 281 7467 6734', '1978-02-23 19:40:49', '2020-07-29 08:03:00'),
(45, 'Syahrini Farida S.IP', '3601025008103400', 'L', 'Kpg. Krakatau No. 367, Sungai Penuh 57232, Sumut', 'zizi71@yahoo.com', '022 9539 389', '1970-02-26 15:54:28', '2013-08-05 17:50:36'),
(46, 'Diah Riyanti', '1507880505044805', 'L', 'Dk. Baya Kali Bungur No. 896, Palu 77415, Jateng', 'septi.manullang@palastri.name', '0709 4550 699', '2010-12-24 19:19:49', '1985-02-05 12:54:33'),
(47, 'Taswir Ganep Budiyanto', '6101352502139268', 'L', 'Gg. Padang No. 192, Palembang 15749, Lampung', 'xpradana@hasanah.in', '(+62) 577 1567 707', '1989-07-08 05:27:11', '1981-12-15 13:50:14'),
(48, 'Adhiarja Januar', '7414060806095977', 'L', 'Ds. Qrisdoren No. 723, Jayapura 58801, Kalbar', 'jelita91@rahayu.ac.id', '(+62) 22 8151 552', '1980-03-21 21:49:17', '1973-01-16 02:49:58'),
(49, 'Halima Oliva Laksita', '5307962908207642', 'L', 'Jln. Baung No. 528, Manado 22996, Jatim', 'hariyah.puji@gmail.co.id', '0591 4562 606', '2009-08-06 05:18:12', '2018-07-13 22:32:31'),
(50, 'Dinda Aryani', '1219256709132194', 'L', 'Ds. Dr. Junjunan No. 309, Samarinda 30253, Sumsel', 'namaga.manah@gmail.co.id', '0664 4203 8391', '1986-08-26 14:06:59', '1972-05-23 08:26:03'),
(51, 'Ulya Wijayanti S.IP', '1471835704075132', 'L', 'Psr. Moch. Toha No. 827, Blitar 39794, Sumbar', 'natsir.rahmi@kusumo.biz.id', '0584 5832 588', '1991-02-28 01:57:54', '2013-02-06 04:31:27'),
(52, 'Cahyadi Firgantoro', '6403522112165249', 'L', 'Gg. Baranang Siang Indah No. 313, Balikpapan 25249, NTB', 'warsa56@gmail.com', '0986 4407 762', '2002-11-17 06:44:14', '2011-04-01 23:46:34'),
(53, 'Vanya Lestari', '1206835904150755', 'L', 'Psr. Bah Jaya No. 244, Tidore Kepulauan 87955, Lampung', 'xkuswandari@yahoo.com', '(+62) 626 4988 0133', '2009-11-28 08:03:02', '1998-02-09 04:16:20'),
(54, 'Zalindra Farah Yolanda', '1507036911021188', 'L', 'Kpg. Yosodipuro No. 827, Tanjungbalai 40875, Sulteng', 'btampubolon@nasyidah.asia', '0630 2755 7525', '2012-03-03 14:09:18', '2004-01-13 08:39:51'),
(55, 'Mulyono Mangunsong S.T.', '7602751011141582', 'L', 'Jr. Hang No. 903, Tual 53066, Maluku', 'kusmawati.dodo@gmail.com', '0793 5322 755', '1971-06-26 02:49:10', '1986-12-18 12:54:03'),
(56, 'Opan Sihombing', '9118011305965756', 'L', 'Ki. Yos No. 128, Lubuklinggau 97034, Sulteng', 'kiandra.aryani@siregar.my.id', '0235 6953 385', '1982-02-13 08:29:05', '1992-02-29 18:49:01'),
(57, 'Nugraha Damanik M.Farm', '3571505711018624', 'L', 'Gg. Kali No. 388, Sabang 51537, NTB', 'qnamaga@gmail.co.id', '0718 4815 0203', '2020-08-20 12:16:39', '1982-11-17 07:35:29'),
(58, 'Tiara Susanti S.Ked', '7202990510130121', 'L', 'Gg. Panjaitan No. 748, Medan 34386, DKI', 'gnamaga@yahoo.com', '(+62) 20 2990 539', '2011-02-07 10:46:47', '1978-04-22 14:55:32'),
(59, 'Natalia Laksita', '5104026502063392', 'L', 'Gg. Jamika No. 252, Sabang 44502, NTB', 'jasmani.hutapea@nainggolan.name', '(+62) 980 8022 032', '2020-10-11 06:08:18', '1978-03-24 13:34:01'),
(60, 'Opung Liman Marpaung M.M.', '1173475012939359', 'L', 'Jr. Veteran No. 274, Subulussalam 37040, DIY', 'mulyanto.widiastuti@yahoo.com', '(+62) 810 0738 4616', '2009-10-07 05:52:04', '2004-12-28 14:23:15'),
(61, 'Jamalia Hastuti', '3506640612125001', 'L', 'Dk. Kebangkitan Nasional No. 632, Kotamobagu 81452, Papua', 'umaryati@nugroho.desa.id', '(+62) 685 0574 580', '1997-12-02 02:42:29', '2014-07-22 01:06:12'),
(62, 'Okta Prima Tampubolon S.Farm', '3501054204142326', 'L', 'Jr. Cemara No. 909, Palopo 64264, Jateng', 'firgantoro.laswi@gmail.co.id', '0327 5833 3505', '2003-03-08 05:12:29', '2019-10-03 12:53:00'),
(63, 'Indra Wadi Hutapea M.Pd', '5315882611165272', 'L', 'Jln. Yap Tjwan Bing No. 822, Bau-Bau 41180, Bengkulu', 'elvina54@yahoo.co.id', '0945 3389 3016', '2011-10-15 15:02:45', '1988-03-19 06:51:36'),
(64, 'Mila Namaga M.TI.', '6401881705090271', 'L', 'Psr. Suprapto No. 619, Blitar 18298, Papua', 'puji.wijayanti@utami.net', '(+62) 230 9440 3424', '1991-10-23 20:24:04', '2009-09-22 18:27:36'),
(65, 'Putu Hardana Megantara', '5316590109063457', 'L', 'Jr. Sukabumi No. 242, Cilegon 89279, Babel', 'harja.nasyiah@zulkarnain.name', '(+62) 727 3698 963', '2002-07-16 09:31:24', '2017-11-12 05:32:26'),
(66, 'Kani Rahmawati S.Kom', '7402444510172099', 'L', 'Psr. Bah Jaya No. 629, Sungai Penuh 31625, Jambi', 'cinta.tarihoran@yahoo.co.id', '(+62) 467 1826 847', '2008-12-17 16:33:26', '1997-03-13 13:34:58'),
(67, 'Carub Simbolon', '5319825001002103', 'L', 'Ds. Hasanuddin No. 235, Jambi 32916, Sulbar', 'nasab.adriansyah@yahoo.co.id', '0822 509 738', '2017-04-06 04:41:15', '1977-04-24 11:55:49'),
(68, 'Opan Emil Saragih', '7372185202148374', 'L', 'Kpg. Astana Anyar No. 426, Cirebon 58019, Kalteng', 'tantri71@wijaya.or.id', '0453 8471 407', '2012-12-27 16:02:04', '1979-06-01 22:15:38'),
(69, 'Jumari Gunarto', '1609786409037990', 'L', 'Jln. Sunaryo No. 656, Semarang 29704, Sumut', 'hendri.padmasari@tampubolon.sch.id', '(+62) 472 0899 147', '1977-03-12 10:30:26', '1986-03-04 18:41:53'),
(70, 'Rahmi Mandasari S.IP', '3575001311096848', 'L', 'Jr. Labu No. 854, Bekasi 11827, Jambi', 'thamrin.nyoman@gmail.com', '0668 2041 9847', '2010-12-21 18:07:14', '1980-11-25 00:41:56'),
(71, 'Zamira Syahrini Wastuti', '1472200802020455', 'L', 'Psr. Suryo No. 862, Binjai 20613, Kaltara', 'luwar.nababan@tarihoran.asia', '0644 1846 594', '1971-03-08 18:11:41', '2007-10-17 06:17:07'),
(72, 'Novi Jessica Sudiati', '5201231510963409', 'L', 'Ki. Ujung No. 27, Cirebon 43526, Sumsel', 'gunarto.halim@yahoo.com', '023 9687 4204', '1974-10-28 22:42:07', '1982-06-02 00:00:44'),
(73, 'Sari Oktaviani', '6205333011201161', 'L', 'Kpg. Bagis Utama No. 280, Kendari 27988, Sumbar', 'mahesa21@rajasa.co', '(+62) 507 0560 3639', '1977-07-07 08:40:59', '1988-09-09 16:40:03'),
(74, 'Hamima Zelda Agustina', '3174120801964070', 'L', 'Psr. Sutarjo No. 665, Blitar 34871, Kalsel', 'htarihoran@nainggolan.co.id', '0297 5012 808', '1999-08-17 12:34:49', '1988-12-04 06:35:57'),
(75, 'Tiara Laksmiwati', '7322254910138334', 'L', 'Ki. Kali No. 284, Pontianak 20462, Gorontalo', 'vnovitasari@yahoo.co.id', '0307 9369 0766', '1972-10-26 00:48:44', '1977-07-06 19:26:02'),
(76, 'Gawati Yolanda', '1215515605060902', 'L', 'Gg. Dahlia No. 66, Pontianak 15289, Kaltim', 'nugroho.heru@gmail.com', '(+62) 730 5254 788', '2006-09-27 09:52:11', '1977-06-25 18:52:32'),
(77, 'Mulyanto Hidayat M.Farm', '3604546905108982', 'L', 'Psr. Bawal No. 231, Tidore Kepulauan 42165, Kaltara', 'padmasari.kala@tampubolon.name', '0713 8999 6838', '1970-03-30 14:01:10', '2000-09-23 05:56:27'),
(78, 'Lanjar Cakrajiya Saragih', '1108015802139439', 'L', 'Jr. Bakti No. 980, Tangerang Selatan 62459, Sulsel', 'bmandala@yahoo.com', '(+62) 499 5206 491', '2002-05-01 10:38:36', '1972-02-15 01:08:14'),
(79, 'Zulaikha Novitasari S.Pd', '7603201507165763', 'L', 'Kpg. Sudirman No. 866, Banjar 32084, Sulbar', 'cahyanto01@gmail.com', '(+62) 785 7876 488', '2020-03-20 16:09:19', '2009-03-08 06:17:56'),
(80, 'Zizi Suryatmi', '7324510908045247', 'L', 'Ds. Bass No. 783, Balikpapan 95847, DIY', 'qlaksmiwati@narpati.info', '(+62) 573 4493 9512', '1992-10-29 02:41:41', '1973-11-19 11:49:17'),
(81, 'Ophelia Suartini', '3502301403004068', 'L', 'Gg. Babakan No. 819, Pasuruan 46856, Maluku', 'pranowo.hani@zulkarnain.biz', '(+62) 814 088 261', '2001-05-26 01:18:11', '1983-03-05 05:40:33'),
(82, 'Darmana Cemani Mustofa', '7108032711034381', 'L', 'Gg. Qrisdoren No. 524, Bogor 95242, Sumut', 'qbudiman@gmail.com', '0258 0966 505', '1978-10-08 16:13:25', '2001-07-16 14:46:26'),
(83, 'Yuliana Safitri M.Pd', '8106832012921414', 'L', 'Jln. R.E. Martadinata No. 432, Binjai 95115, Jatim', 'hastuti.gilang@tarihoran.org', '0599 4499 540', '1976-08-29 04:04:26', '1990-07-11 09:54:49'),
(84, 'Maryanto Hutagalung S.Pt', '5206101603945851', 'L', 'Gg. Imam No. 245, Probolinggo 35962, Kaltara', 'maryati.warsita@santoso.biz', '(+62) 555 5372 410', '1992-03-27 23:14:13', '2009-04-21 01:12:37'),
(85, 'Cayadi Mustofa', '1301813005969463', 'L', 'Gg. Ikan No. 415, Padang 93510, Bengkulu', 'hendri.kurniawan@kuswoyo.co', '0250 3313 669', '1985-08-28 04:49:48', '2013-01-30 13:27:54'),
(86, 'Vivi Utami', '6501721908205021', 'L', 'Kpg. Villa No. 530, Batu 69222, Lampung', 'mayasari.rahmi@suartini.org', '(+62) 231 4715 4738', '2005-07-04 09:38:23', '2019-02-23 16:45:01'),
(87, 'Mala Winarsih', '9116330801025140', 'L', 'Gg. Dago No. 306, Balikpapan 29766, Sumbar', 'laswi.nurdiyanti@yahoo.co.id', '(+62) 508 1993 6587', '2018-07-16 12:13:22', '1994-01-18 11:45:21'),
(88, 'Kadir Baktiadi Pratama S.Pt', '1104601802028943', 'L', 'Jln. Baladewa No. 607, Sorong 61956, Bali', 'widya41@firgantoro.id', '(+62) 718 4908 1561', '1977-10-02 14:15:23', '1977-03-17 01:27:28'),
(89, 'Eka Situmorang', '3514775907035409', 'L', 'Dk. Nakula No. 163, Kendari 98573, Malut', 'icha.wahyuni@permata.ac.id', '(+62) 560 2830 335', '2012-12-21 19:08:08', '2019-02-13 08:03:36'),
(90, 'Karimah Mandasari S.Gz', '8101070712159912', 'L', 'Kpg. Mahakam No. 17, Administrasi Jakarta Barat 31607, Babel', 'wibowo.harimurti@gmail.com', '0649 9141 976', '1976-12-31 11:10:32', '1981-08-06 16:07:24'),
(91, 'Chelsea Patricia Purwanti S.Pt', '1278456512063862', 'L', 'Ds. Badak No. 897, Bitung 52673, Bengkulu', 'ppuspasari@yahoo.co.id', '0465 3644 6525', '1997-02-15 07:46:41', '1976-06-07 11:59:31'),
(92, 'Yunita Zaenab Utami S.E.I', '8107992306973576', 'L', 'Ki. Cikutra Barat No. 642, Makassar 11568, Kalsel', 'qmustofa@rajata.asia', '(+62) 28 6566 079', '1991-01-29 08:23:02', '1979-08-22 08:58:38'),
(93, 'Maryadi Narpati S.Sos', '3325051701009159', 'L', 'Ds. Bakau Griya Utama No. 381, Palangka Raya 88427, Jatim', 'galih.padmasari@yahoo.co.id', '(+62) 28 4188 442', '2005-05-30 13:26:45', '2020-10-27 18:59:17'),
(94, 'Anggabaya Lamar Irawan S.T.', '1807534905157091', 'L', 'Ds. Adisucipto No. 977, Singkawang 51656, Sumsel', 'puspasari.eluh@adriansyah.sch.id', '(+62) 958 2534 455', '1979-01-01 16:01:08', '1975-10-10 09:51:19'),
(95, 'Jono Adriansyah', '9102386010005546', 'L', 'Dk. Juanda No. 312, Gunungsitoli 79553, Bengkulu', 'hamima42@yahoo.co.id', '0214 4856 040', '1973-10-08 15:50:24', '2002-09-01 08:23:34'),
(96, 'Septi Rini Wijayanti S.E.I', '7313003008145450', 'L', 'Dk. R.M. Said No. 430, Jayapura 26159, Pabar', 'hakim.jayeng@siregar.biz.id', '(+62) 902 2310 206', '1998-05-11 21:53:28', '2012-08-31 00:48:03'),
(97, 'Yunita Lintang Aryani', '7409406903114885', 'L', 'Ki. Samanhudi No. 308, Depok 59577, Malut', 'iswahyudi.raharja@januar.in', '(+62) 390 3813 452', '2014-10-22 06:50:58', '2020-07-04 00:14:12'),
(98, 'Parman Mangunsong', '3324561011113244', 'L', 'Kpg. Bakin No. 297, Denpasar 37864, NTT', 'jhutagalung@purwanti.id', '(+62) 207 3810 2508', '1991-08-08 14:24:52', '1974-07-13 11:54:00'),
(99, 'Mala Uyainah', '7471955004050861', 'L', 'Psr. Achmad No. 203, Makassar 18564, Sulbar', 'atmaja82@nasyidah.com', '(+62) 552 7223 7446', '1981-01-15 04:09:55', '2006-07-25 23:49:22'),
(100, 'Natalia Permata S.Ked', '1703812103187786', 'L', 'Kpg. Peta No. 617, Sabang 47638, Kalbar', 'panji13@gmail.com', '0907 5888 142', '2013-04-17 12:44:33', '1989-07-20 23:17:43'),
(101, 'Umi Paulin Mulyani S.Gz', '7107232602146548', 'L', 'Jln. Dago No. 67, Administrasi Jakarta Pusat 57891, Lampung', 'ppudjiastuti@mustofa.net', '(+62) 355 3025 0806', '2010-11-08 09:41:35', '1982-06-22 04:00:26'),
(102, 'Silvia Wahyuni', '6202446510005928', 'L', 'Ds. BKR No. 57, Mataram 32753, Pabar', 'fbudiman@gmail.com', '0247 0270 901', '1991-12-16 14:33:44', '2016-09-16 22:18:06'),
(103, 'Mala Puspasari', '3505972502086531', 'L', 'Dk. Dago No. 449, Sibolga 73850, Kalsel', 'restu.winarsih@gmail.co.id', '(+62) 549 7822 6254', '1988-01-14 08:16:37', '2003-11-18 09:14:33'),
(104, 'Kania Hariyah', '9118062003980521', 'L', 'Kpg. Flores No. 202, Langsa 29228, Sulbar', 'laila.uyainah@prasasta.net', '0294 4143 1557', '1980-11-01 12:14:30', '1996-01-27 06:36:45'),
(105, 'Kurnia Anggriawan', '3303315608112712', 'L', 'Dk. Baja No. 406, Medan 27672, Babel', 'jfarida@yahoo.co.id', '(+62) 27 3884 7607', '2020-01-17 11:42:56', '1986-11-22 15:24:55'),
(106, 'Salwa Hastuti', '7318330805014981', 'L', 'Ds. Achmad Yani No. 15, Pagar Alam 93883, Sumsel', 'firmansyah.maida@gmail.co.id', '(+62) 659 7857 048', '1972-08-20 06:54:02', '1976-09-01 20:16:03');

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `distributor_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`distributor_id`, `name`, `address`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(2, 'PT. Cipta Karya', 'Jl. Bukitan', 'ciptaabadi@gmail.com', '081234567890', '2022-04-04 19:45:00', '2022-04-04 19:46:10'),
(5, 'Tedi Darman Siregar S.Psi', 'Jln. Baranang Siang No. 788, Bekasi 47602, Bengkulu', 'nuraini.tri@yahoo.co', '(+62) 202 6847 588', '1976-04-21 06:15:28', '1985-05-01 12:08:23'),
(6, 'Ghani Permadi', 'Dk. Babadan No. 681, Tebing Tinggi 10759, Kaltara', 'sihombing.sarah@wibi', '0855 1374 927', '2019-10-04 22:51:33', '1980-11-05 05:31:57'),
(7, 'Karya Jarwa Megantara', 'Ds. Cikapayang No. 828, Pematangsiantar 59632, Kalsel', 'vera89@yahoo.co.id', '(+62) 951 3837 839', '2001-06-24 01:45:54', '2012-03-29 09:52:26'),
(8, 'Saiful Cemplunk Narpati', 'Gg. Cemara No. 608, Tidore Kepulauan 24396, Sulbar', 'kenzie31@farida.asia', '0892 1029 833', '1984-11-30 12:20:27', '2007-10-08 12:57:58'),
(9, 'Ifa Zulaika S.Gz', 'Jln. Abdul Rahmat No. 283, Dumai 48448, Banten', 'gabriella.sihombing@', '0950 4667 038', '1997-09-28 03:39:17', '1992-12-23 10:00:33'),
(10, 'Jaga Sihombing S.E.I', 'Kpg. Sam Ratulangi No. 780, Surabaya 14895, Papua', 'dadriansyah@yahoo.co', '(+62) 331 2494 389', '1975-12-28 07:41:03', '1989-03-10 05:58:30'),
(11, 'Siti Safina Lailasari M.Pd', 'Ki. Basuki No. 261, Jayapura 15229, Sulbar', 'julia.hartati@yahoo.', '0450 4001 0455', '2010-02-05 12:51:53', '1983-12-15 11:31:30'),
(12, 'Azalea Chelsea Utami', 'Ki. Ters. Jakarta No. 951, Pontianak 54577, NTB', 'ida63@yahoo.co.id', '0459 4649 664', '1992-08-26 14:01:45', '2010-01-13 22:12:07'),
(13, 'Gambira Simon Nababan', 'Ki. Jamika No. 388, Gunungsitoli 18782, Jateng', 'bpuspita@suartini.mi', '(+62) 352 2567 699', '2013-11-13 10:20:39', '2001-07-07 10:05:54'),
(14, 'Diah Betania Hastuti S.Ked', 'Jln. Barat No. 733, Bandar Lampung 27462, Sumbar', 'bagas23@salahudin.we', '0521 7463 2085', '2009-06-06 00:47:09', '1993-01-16 08:32:51'),
(15, 'Melinda Puput Lailasari M.Kom.', 'Jln. Ekonomi No. 635, Pangkal Pinang 32691, Jabar', 'fprasasta@yahoo.com', '(+62) 938 2724 4670', '1989-10-28 00:06:20', '1989-11-28 12:17:07'),
(16, 'Irma Icha Wahyuni', 'Gg. Bappenas No. 862, Batu 70928, Sulsel', 'iwasita@purwanti.web', '(+62) 228 0821 5589', '2006-02-07 07:37:40', '1971-12-06 17:01:08'),
(17, 'Rika Puspita', 'Jr. Panjaitan No. 595, Samarinda 48610, Bali', 'handayani.unjani@yah', '(+62) 692 6175 936', '1970-11-23 05:34:50', '2005-01-17 10:04:33'),
(18, 'Prasetyo Saefullah', 'Ki. Jayawijaya No. 179, Administrasi Jakarta Selatan 37382, Sulbar', 'gnajmudin@yahoo.co.i', '(+62) 29 0427 3877', '1975-09-26 19:50:56', '2006-02-05 21:35:22'),
(19, 'Rika Nadia Susanti S.Gz', 'Jln. Nangka No. 198, Bandung 99924, Sumsel', 'okto.riyanti@situmor', '0920 4244 878', '2017-02-25 15:10:05', '1972-02-14 23:54:25'),
(20, 'Darmaji Edison Prasetya', 'Dk. Sutarto No. 664, Tanjung Pinang 65495, Bengkulu', 'prasetyo.ina@mustofa', '0763 7603 3730', '1993-10-06 02:53:42', '2021-10-05 21:24:58'),
(21, 'Umay Irawan', 'Psr. Abdul Muis No. 272, Tegal 82569, Jateng', 'laksita.ciaobella@ma', '0567 0993 7392', '2000-03-13 11:57:27', '1985-10-05 07:45:37'),
(22, 'Kardi Prabowo', 'Jr. Ciwastra No. 210, Pontianak 76533, Sulteng', 'hendri.januar@gmail.', '(+62) 288 2605 398', '1983-10-28 01:43:13', '2012-11-10 18:59:26'),
(23, 'Raihan Maheswara', 'Kpg. Arifin No. 369, Metro 69335, Bali', 'ajimin.nababan@perma', '0311 2534 485', '1998-02-26 14:05:52', '2004-10-05 03:59:39'),
(24, 'Maida Maida Winarsih', 'Ds. Padang No. 94, Tanjungbalai 98798, Bali', 'mharyanti@yahoo.co.i', '(+62) 457 2203 083', '1982-09-11 09:10:11', '1975-09-25 00:33:48'),
(25, 'Cornelia Wahyuni', 'Ki. Bayan No. 687, Salatiga 72588, Kaltim', 'omelani@rahmawati.or', '(+62) 331 2580 3568', '2010-03-22 12:29:43', '1975-05-21 10:57:34'),
(26, 'Rachel Laksmiwati M.Pd', 'Ds. Bakau Griya Utama No. 362, Pangkal Pinang 69140, Jateng', 'thandayani@prasasta.', '(+62) 251 3123 413', '1981-08-30 03:49:03', '1972-03-15 20:45:58'),
(27, 'Wulan Wastuti', 'Jln. Supomo No. 476, Depok 36464, Sumbar', 'permata.karma@prastu', '0574 8184 670', '1974-11-28 07:29:55', '2017-09-13 08:49:48'),
(28, 'Diana Hasanah M.M.', 'Psr. Achmad Yani No. 358, Tebing Tinggi 98315, Jatim', 'fpuspita@halimah.biz', '0852 833 812', '1983-01-25 05:42:57', '1984-07-14 18:25:14'),
(29, 'Putu Tedi Hutagalung S.T.', 'Kpg. Bakit  No. 826, Kendari 77695, Sulsel', 'qpuspasari@yahoo.co.', '0748 6998 502', '1976-01-21 11:35:25', '1972-05-26 11:15:59'),
(30, 'Hardana Hutasoit', 'Psr. Rajawali No. 245, Bitung 20380, Sumut', 'ajimat94@latupono.ne', '(+62) 451 9540 3106', '1978-04-11 04:54:14', '1970-04-11 06:27:45'),
(31, 'Aisyah Riyanti S.Pd', 'Ki. Urip Sumoharjo No. 328, Tidore Kepulauan 30179, Sulut', 'fitriani.irawan@muly', '026 4830 3676', '2015-03-10 23:15:14', '1994-10-07 08:52:50'),
(32, 'Endra Rajasa', 'Gg. Abdul. Muis No. 126, Bau-Bau 97556, Sumsel', 'ulva.laksmiwati@mand', '(+62) 228 8615 6019', '1997-11-22 02:44:19', '1995-07-06 13:16:53'),
(33, 'Cengkir Gandewa Waluyo M.Pd', 'Kpg. Mahakam No. 389, Payakumbuh 52962, Lampung', 'safitri.usyi@latupon', '(+62) 22 1783 9731', '1979-07-19 07:47:38', '2017-08-20 15:03:33'),
(34, 'Pandu Gunarto', 'Ki. Suryo Pranoto No. 957, Jambi 93561, Banten', 'zutama@gmail.com', '028 2566 8255', '2021-02-05 04:20:00', '1984-03-14 18:52:58'),
(35, 'Aisyah Riyanti', 'Kpg. Yos No. 241, Tegal 26559, Sulsel', 'ratih.nuraini@fujiat', '0639 6626 065', '2012-02-27 17:57:54', '2011-04-23 20:18:50'),
(36, 'Dinda Laksita', 'Ki. Sadang Serang No. 570, Cilegon 97082, Sulbar', 'firgantoro.titin@yah', '(+62) 960 2251 3311', '2017-09-23 09:33:31', '2007-08-21 09:44:21'),
(37, 'Mursita Jumadi Putra S.Kom', 'Gg. Mulyadi No. 291, Jambi 32347, Kaltim', 'suwarno.uda@gmail.co', '0494 7023 9435', '1999-08-15 03:19:02', '1991-03-19 17:38:30'),
(38, 'Eluh Megantara', 'Dk. Kyai Gede No. 797, Pangkal Pinang 91987, NTT', 'dimaz02@gmail.co.id', '(+62) 599 4443 177', '2009-07-10 04:58:43', '2015-11-09 02:16:12'),
(39, 'Ulya Yolanda', 'Gg. Baja Raya No. 520, Subulussalam 94273, DIY', 'darmaji.samosir@wibo', '(+62) 475 1127 026', '1992-12-14 11:17:46', '1980-04-08 17:49:30'),
(40, 'Cahyo Adikara Natsir', 'Kpg. Sampangan No. 974, Banda Aceh 31260, Gorontalo', 'wlaksita@yahoo.com', '0525 2960 1872', '1995-10-01 15:57:14', '1996-05-01 13:42:25'),
(41, 'Gading Firgantoro', 'Dk. Baik No. 786, Madiun 87921, Sultra', 'ella.wijaya@gmail.co', '(+62) 988 4384 4043', '1991-02-11 20:38:37', '2017-10-08 01:44:16'),
(42, 'Maya Rahayu S.Psi', 'Ki. Supomo No. 942, Batu 53622, Lampung', 'pyuliarti@yahoo.co.i', '(+62) 327 1311 8362', '2003-09-26 15:24:45', '2007-02-15 16:08:25'),
(43, 'Arta Dadi Siregar', 'Ds. Taman No. 71, Pontianak 17017, Maluku', 'dalima.purwanti@jail', '(+62) 917 5675 320', '1996-05-15 23:14:15', '2020-08-16 20:47:20'),
(44, 'Diah Ilsa Uyainah M.M.', 'Kpg. Kalimantan No. 123, Tanjung Pinang 42184, Sulut', 'ysihombing@yuliarti.', '(+62) 408 7575 1236', '2001-08-16 07:57:27', '1993-04-28 06:02:14'),
(45, 'Gangsar Dariati Saputra', 'Jr. Rajawali Timur No. 408, Malang 70877, Sulbar', 'garang.permata@nasyi', '(+62) 740 8667 448', '1970-09-20 02:49:50', '2007-01-21 16:51:10'),
(46, 'Fathonah Andriani', 'Jr. Lembong No. 856, Jayapura 58737, Papua', 'aanggraini@maryadi.c', '(+62) 845 3419 493', '2019-10-22 09:16:02', '1974-09-29 18:39:58'),
(47, 'Sarah Mardhiyah', 'Dk. Baranang No. 781, Denpasar 44037, Kepri', 'jamil91@hidayat.net', '(+62) 468 8508 682', '2011-04-21 17:29:26', '1980-07-11 21:10:10'),
(48, 'Zulfa Wastuti', 'Psr. Wahidin No. 507, Pasuruan 52850, Kaltim', 'usuryono@yahoo.com', '0360 6665 6349', '1983-11-19 21:52:09', '2015-10-16 15:16:43'),
(49, 'Jais Daruna Hutapea', 'Ds. Sumpah Pemuda No. 493, Tomohon 90875, Riau', 'tnovitasari@gmail.co', '(+62) 850 481 738', '1978-06-27 17:45:18', '1980-08-10 08:25:19'),
(50, 'Devi Wastuti', 'Ds. Halim No. 99, Mojokerto 74750, Jateng', 'aprasetyo@siregar.sc', '(+62) 307 2674 031', '2002-12-12 13:12:04', '2013-08-07 05:08:29'),
(51, 'Ulva Eka Usamah', 'Jr. PHH. Mustofa No. 910, Administrasi Jakarta Selatan 70228, Banten', 'jwidodo@hidayat.com', '0485 6283 432', '1974-09-02 14:35:34', '1996-07-24 04:12:54'),
(52, 'Balijan Firgantoro', 'Gg. Sudirman No. 506, Magelang 89532, DIY', 'vpermata@yahoo.co.id', '0725 3479 660', '1971-03-03 17:23:42', '2009-12-12 07:09:32'),
(53, 'Mala Cici Astuti', 'Jr. Haji No. 432, Subulussalam 28004, Jambi', 'aurora10@yahoo.co.id', '0709 1501 744', '2022-03-06 19:42:48', '1985-06-25 13:56:26'),
(54, 'Putri Salwa Wahyuni M.Pd', 'Ds. Yohanes No. 904, Bau-Bau 23885, Bengkulu', 'zwinarsih@hartati.sc', '(+62) 321 4574 982', '1973-08-07 17:45:07', '1975-05-24 17:21:29'),
(55, 'Koko Rahmat Marpaung', 'Ds. Yos No. 43, Gorontalo 15385, NTT', 'swijaya@usamah.com', '(+62) 916 1214 5049', '1985-09-12 12:26:46', '1991-06-19 11:49:08'),
(56, 'Rangga Rajata', 'Kpg. Basoka No. 849, Semarang 90792, Kalsel', 'harjasa.prastuti@gma', '0521 0364 973', '1997-03-21 06:35:51', '1991-01-17 15:08:20'),
(57, 'Humaira Aryani', 'Kpg. Suniaraja No. 128, Bandar Lampung 71772, Sumbar', 'jais.saragih@puspita', '(+62) 400 9850 888', '2007-03-26 10:59:46', '1975-07-23 05:45:09'),
(58, 'Legawa Ardianto', 'Kpg. Hang No. 640, Payakumbuh 66615, Kaltim', 'vmelani@usada.desa.i', '0879 0602 4421', '1986-07-14 05:37:22', '2021-12-28 22:08:32'),
(59, 'Rusman Putra S.Psi', 'Jr. Yos Sudarso No. 293, Bogor 36571, Kalsel', 'ramadan.tiara@nasyid', '0627 3186 512', '2007-06-06 15:39:42', '2021-05-23 01:30:06'),
(60, 'Asmianto Damanik', 'Kpg. Dipatiukur No. 264, Bekasi 97710, Bengkulu', 'agustina.bagas@gunar', '0309 9454 854', '2004-03-30 08:49:43', '2002-07-15 23:00:38'),
(61, 'Galar Anom Kuswoyo S.T.', 'Dk. Bagas Pati No. 226, Payakumbuh 84993, Sulsel', 'pangestu31@putra.biz', '(+62) 691 3551 947', '2008-10-04 10:15:27', '1985-03-24 17:27:52'),
(62, 'Ade Pertiwi S.H.', 'Kpg. Raden No. 832, Tegal 29567, Riau', 'pratiwi.muni@wijayan', '(+62) 983 1735 967', '2003-01-28 17:14:17', '2006-06-14 17:06:38'),
(63, 'Karna Siregar', 'Ki. Yosodipuro No. 771, Parepare 23988, Sulteng', 'upratiwi@siregar.biz', '0623 1179 861', '1973-05-08 13:03:10', '1973-10-11 06:44:06'),
(64, 'Cengkal Permadi', 'Dk. Acordion No. 758, Balikpapan 52117, DKI', 'rahmawati.karma@gmai', '0486 4224 3157', '1971-03-31 17:20:31', '1973-07-02 14:20:55'),
(65, 'Widya Kani Purwanti', 'Jr. Soekarno Hatta No. 822, Subulussalam 85105, Lampung', 'radika.manullang@nur', '(+62) 661 1345 5526', '2013-08-22 01:41:51', '2000-09-21 12:01:52'),
(66, 'Mulyanto Haryanto', 'Jln. B.Agam 1 No. 646, Yogyakarta 63003, Kaltara', 'zelaya.pertiwi@marya', '(+62) 891 6574 835', '2005-01-21 22:59:47', '1974-08-17 23:14:28'),
(67, 'Yuni Rahayu', 'Kpg. Salam No. 486, Bandar Lampung 85181, Bali', 'cici.kusumo@yahoo.co', '0340 4999 9127', '1973-12-12 12:32:47', '2006-07-21 19:15:15'),
(68, 'Widya Latika Laksita S.Farm', 'Gg. Panjaitan No. 822, Dumai 66475, Sultra', 'cmulyani@budiyanto.b', '0793 2658 207', '2006-11-14 00:48:44', '2005-08-17 10:59:41'),
(69, 'Kenzie Pranowo', 'Dk. K.H. Wahid Hasyim (Kopo) No. 737, Blitar 11702, Jateng', 'febi.yolanda@mayasar', '023 3424 387', '2012-02-13 08:01:26', '1993-02-23 18:45:32'),
(70, 'Padma Ami Lestari S.E.I', 'Dk. Laksamana No. 123, Subulussalam 25584, DIY', 'thamrin.harimurti@ha', '(+62) 440 4252 1348', '1982-10-18 14:24:55', '1970-09-03 15:09:30'),
(71, 'Farah Cornelia Nasyidah S.E.', 'Dk. Padang No. 43, Administrasi Jakarta Utara 34260, Jabar', 'manullang.unjani@pra', '0364 0237 7279', '1995-01-18 13:54:41', '2013-06-19 08:30:24'),
(72, 'Catur Suryono S.Psi', 'Dk. Ketandan No. 503, Pematangsiantar 53743, Banten', 'jail.mandasari@namag', '0290 0651 881', '2005-03-31 02:30:34', '2001-08-21 07:29:39'),
(73, 'Humaira Pudjiastuti', 'Ds. Sunaryo No. 490, Ambon 61092, Kalbar', 'raisa67@sitorus.ac.i', '0822 589 735', '2004-03-15 20:24:45', '1992-08-08 22:43:08'),
(74, 'Cindy Usamah', 'Ds. Sudiarto No. 112, Singkawang 77375, Jambi', 'gina.najmudin@hassan', '0965 1325 356', '1989-04-20 11:53:24', '2014-03-05 17:51:19'),
(75, 'Kardi Sinaga S.I.Kom', 'Jln. Abdul. Muis No. 530, Pasuruan 72639, Banten', 'rini91@gmail.com', '(+62) 758 0489 3837', '1985-01-11 01:54:20', '1973-06-15 06:24:38'),
(76, 'Ophelia Cici Wahyuni S.Pd', 'Jln. Banal No. 150, Gunungsitoli 41097, Kaltim', 'rahayu04@saptono.co', '0590 0412 365', '2002-01-27 20:00:19', '1970-12-09 03:26:20'),
(77, 'Bagas Haryanto', 'Kpg. Jakarta No. 360, Batam 43739, Lampung', 'wastuti.azalea@prayo', '(+62) 728 4638 668', '1979-06-30 05:56:21', '1997-03-07 07:04:42'),
(78, 'Gamblang Atma Dongoran', 'Dk. Basudewo No. 243, Tangerang 75133, Sumbar', 'xhasanah@yahoo.com', '(+62) 26 1096 8051', '1999-06-21 08:50:46', '2015-06-05 19:25:05'),
(79, 'Darijan Waluyo M.TI.', 'Ki. Dipatiukur No. 641, Administrasi Jakarta Pusat 59119, Kaltim', 'ajimin.pradana@agust', '(+62) 22 9695 7709', '1978-11-30 03:26:14', '1975-09-02 18:13:14'),
(80, 'Kemal Sihotang', 'Kpg. Bambon No. 844, Sabang 68211, DIY', 'laksmiwati.ade@gmail', '0884 5491 9400', '1982-02-09 07:51:47', '1989-04-02 02:24:36'),
(81, 'Citra Puspasari M.Farm', 'Psr. Barasak No. 121, Malang 95230, NTT', 'zaenab.widiastuti@na', '0602 3450 708', '1993-03-20 06:45:32', '2009-11-05 05:47:40'),
(82, 'Shakila Indah Mandasari M.M.', 'Psr. Yos No. 489, Cilegon 69812, Kalteng', 'nasyidah.tina@yahoo.', '(+62) 619 9127 2968', '1999-12-30 23:55:30', '1997-01-17 20:24:08'),
(83, 'Ibrani Sihombing', 'Ds. Reksoninten No. 94, Surabaya 85683, NTB', 'mardhiyah.rahayu@pal', '(+62) 973 5531 0439', '1996-09-30 16:27:38', '2002-10-08 05:55:48'),
(84, 'Cahyo Prasetya S.E.I', 'Psr. Ronggowarsito No. 111, Banjarbaru 10490, Sultra', 'luhung.sirait@lailas', '0491 6080 010', '2012-01-11 23:40:57', '1971-11-30 21:27:35'),
(85, 'Luwar Edward Mangunsong', 'Jr. Monginsidi No. 895, Tegal 44448, Sulut', 'zfarida@gmail.co.id', '0413 5537 552', '2004-06-14 07:04:55', '1991-11-20 03:48:04'),
(86, 'Ratna Namaga S.Sos', 'Ds. Bawal No. 418, Jayapura 50646, Pabar', 'novitasari.jessica@g', '(+62) 726 0659 556', '1977-06-08 09:03:45', '1999-06-03 18:25:19'),
(87, 'Farah Alika Agustina M.M.', 'Psr. Baranangsiang No. 744, Banjarmasin 74941, Bengkulu', 'fprasasta@rahimah.or', '(+62) 502 6158 8534', '1986-07-16 22:22:03', '1987-07-13 11:59:01'),
(88, 'Among Lasmono Wacana S.Pt', 'Psr. Jayawijaya No. 975, Langsa 34892, Aceh', 'siregar.balapati@yah', '(+62) 650 9268 199', '1993-06-26 06:40:56', '1986-09-02 05:53:02'),
(89, 'Ana Oktaviani S.Pt', 'Gg. Achmad Yani No. 392, Administrasi Jakarta Timur 19490, Kaltara', 'budi00@dabukke.co', '(+62) 736 0679 863', '2012-07-06 03:47:50', '2005-11-04 10:53:26'),
(90, 'Karimah Aurora Widiastuti M.Kom.', 'Dk. Labu No. 51, Bandung 55830, Kaltara', 'carub.uyainah@gmail.', '020 5426 920', '1978-02-14 15:07:18', '2008-08-02 00:40:45'),
(91, 'Chandra Kurniawan', 'Dk. Acordion No. 324, Surabaya 29164, Jambi', 'agustina.yance@yahoo', '(+62) 979 5136 7691', '1987-05-04 03:05:44', '2020-07-23 11:24:22'),
(92, 'Praba Ibrahim Narpati', 'Ki. Labu No. 155, Singkawang 41245, NTT', 'jono11@pudjiastuti.s', '0723 9734 958', '1993-03-17 11:46:43', '2009-12-21 04:09:29'),
(93, 'Wani Usada', 'Psr. Abdul. Muis No. 521, Prabumulih 83435, Sumsel', 'rafi.hidayat@melani.', '(+62) 398 5658 491', '1993-04-24 02:30:48', '2010-02-08 05:45:48'),
(94, 'Hasna Wulandari S.Ked', 'Gg. Arifin No. 721, Kediri 64743, Jateng', 'gaduh.zulkarnain@tha', '(+62) 205 4790 501', '1976-03-26 01:54:36', '2000-04-28 21:06:47'),
(95, 'Ophelia Wulandari', 'Gg. Setiabudhi No. 845, Pekalongan 70353, Sulsel', 'warji.puspasari@tari', '(+62) 619 0749 827', '1995-10-20 05:21:29', '1971-03-09 02:34:31'),
(96, 'Ana Purwanti', 'Dk. Arifin No. 399, Jambi 13028, Gorontalo', 'zulkarnain.hamima@su', '(+62) 979 8772 426', '2018-05-25 22:31:31', '1977-11-04 23:51:41'),
(97, 'Zelda Yuliana Zulaika', 'Jr. Basoka Raya No. 88, Malang 34795, Sulbar', 'zmaryati@yahoo.co.id', '(+62) 20 1830 4296', '1997-09-01 23:36:04', '1975-02-12 02:36:20'),
(98, 'Septi Yulianti', 'Psr. Gading No. 817, Subulussalam 32239, Kalteng', 'darmaji.astuti@yahoo', '(+62) 21 3429 9978', '2012-05-15 02:56:32', '1979-09-27 22:07:11'),
(99, 'Bella Genta Winarsih S.Sos', 'Gg. Flores No. 798, Singkawang 89567, Sulbar', 'manullang.uda@wuland', '0642 3706 5306', '2005-06-19 01:30:30', '1983-02-17 07:02:57'),
(100, 'Gandewa Nainggolan S.Farm', 'Ds. Lada No. 611, Malang 95760, Bengkulu', 'maida.budiyanto@yaho', '0996 6975 4644', '1971-06-20 12:52:13', '2000-06-19 09:55:02'),
(101, 'Vera Gina Usamah', 'Ds. Ketandan No. 333, Dumai 81741, Sulut', 'kiandra.pradana@gmai', '0771 5336 954', '1988-03-15 14:42:02', '1998-05-21 07:27:28'),
(102, 'Jamalia Mayasari M.Kom.', 'Jln. Jaksa No. 393, Tasikmalaya 88062, Bengkulu', 'emaryati@adriansyah.', '0846 5647 7142', '1999-01-10 17:59:21', '1978-06-27 12:36:00'),
(103, 'Padmi Usyi Hartati S.E.', 'Gg. Sutarto No. 204, Lubuklinggau 76367, Gorontalo', 'asirwada23@waskita.w', '0358 3317 8874', '1984-06-06 21:58:51', '2012-08-26 18:03:28'),
(104, 'Sabrina Laksmiwati', 'Gg. Baranang Siang No. 688, Banda Aceh 26322, Kalsel', 'cindy42@gmail.com', '(+62) 850 8708 2822', '1975-12-21 15:43:07', '2005-11-29 03:16:54');

-- --------------------------------------------------------

--
-- Table structure for table `majalah`
--

CREATE TABLE `majalah` (
  `majalah_id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `tahun` smallint(4) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `harga` float NOT NULL,
  `diskon` decimal(4,2) DEFAULT NULL,
  `stok` int(11) NOT NULL,
  `cover` varchar(100) DEFAULT NULL,
  `majalah_category_id` int(5) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `majalah`
--

INSERT INTO `majalah` (`majalah_id`, `judul`, `slug`, `tahun`, `penerbit`, `harga`, `diskon`, `stok`, `cover`, `majalah_category_id`, `created_at`, `updated_at`) VALUES
(10, 'Majalah Komputer', 'majalah-komputer', 2021, 'Bobo', 50000, '0.15', 28, '1648812858_3dd7a4d7c96d27b0bab4.png', 1, '2022-04-01 06:34:18', '2022-04-01 06:34:18'),
(11, 'Novianto', 'novianto', 2002, 'Novianto', 221102, '0.20', 2, '1650195577_380b70d75e83ac0db75f.jpg', 1, '2022-04-17 06:39:37', '2022-04-17 06:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `majalah_category`
--

CREATE TABLE `majalah_category` (
  `majalah_category_id` int(5) NOT NULL,
  `name_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `majalah_category`
--

INSERT INTO `majalah_category` (`majalah_category_id`, `name_category`) VALUES
(1, 'Komputer'),
(2, 'Anak'),
(3, 'Fashion');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2022-04-01-122533', 'App\\Database\\Migrations\\Customer', 'default', 'App', 1648817407, 1),
(2, '2022-04-05-001200', 'App\\Database\\Migrations\\Distributor', 'default', 'App', 1649118952, 2);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` varchar(15) NOT NULL,
  `users_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_detail`
--

CREATE TABLE `purchase_detail` (
  `purchase_id` varchar(15) NOT NULL,
  `book_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `sale_id` varchar(15) NOT NULL,
  `users_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sale_detail`
--

CREATE TABLE `sale_detail` (
  `sale_id` varchar(15) NOT NULL,
  `book_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `discount` float DEFAULT 0,
  `total_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `address`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Supp Star', 'Jl. Bukit Barisan', 'riko444@mail.com', '081212343411', '2022-04-01 06:31:08', '2022-04-01 06:31:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `active_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `force_pass_reset` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_book_book_category_idx` (`book_category_id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`book_category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`distributor_id`);

--
-- Indexes for table `majalah`
--
ALTER TABLE `majalah`
  ADD PRIMARY KEY (`majalah_id`),
  ADD KEY `fk.majalah_category_id_idx` (`majalah_category_id`);

--
-- Indexes for table `majalah_category`
--
ALTER TABLE `majalah_category`
  ADD PRIMARY KEY (`majalah_category_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `fk_purchase_supplier1_idx` (`supplier_id`),
  ADD KEY `fk_purchase_users1_idx` (`users_id`);

--
-- Indexes for table `purchase_detail`
--
ALTER TABLE `purchase_detail`
  ADD PRIMARY KEY (`purchase_id`,`book_id`),
  ADD KEY `fk_purchase_detail_book1_idx` (`book_id`),
  ADD KEY `fk_purchase_detail_purchase1_idx` (`purchase_id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `fk_sale_users1_idx` (`users_id`);

--
-- Indexes for table `sale_detail`
--
ALTER TABLE `sale_detail`
  ADD UNIQUE KEY `total_price_UNIQUE` (`total_price`),
  ADD KEY `fk_sale_detail_book1_idx` (`book_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `book_category_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `distributor_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `majalah`
--
ALTER TABLE `majalah`
  MODIFY `majalah_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_book_book_category` FOREIGN KEY (`book_category_id`) REFERENCES `book_category` (`book_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `majalah`
--
ALTER TABLE `majalah`
  ADD CONSTRAINT `fk.majalah_category_id` FOREIGN KEY (`majalah_category_id`) REFERENCES `majalah_category` (`majalah_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `fk_purchase_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_purchase_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `purchase_detail`
--
ALTER TABLE `purchase_detail`
  ADD CONSTRAINT `fk_purchase_detail_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_purchase_detail_purchase1` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`purchase_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `fk_sale_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sale_detail`
--
ALTER TABLE `sale_detail`
  ADD CONSTRAINT `fk_sale_detail_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
