-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2021 at 08:30 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `v2`
--

-- --------------------------------------------------------

--
-- Table structure for table `aktifitas`
--

CREATE TABLE `aktifitas` (
  `id` int(4) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `aksi` varchar(100) NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE `api` (
  `id` int(11) NOT NULL,
  `api_key` varchar(200) NOT NULL,
  `status` enum('OF','ON') NOT NULL,
  `ip` varchar(50) NOT NULL,
  `user` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api`
--

INSERT INTO `api` (`id`, `api_key`, `status`, `ip`, `user`) VALUES
(1, 'FQgKByRJ7Qxgww36OLMJK7gLTf99wo', '', '', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `bca`
--

CREATE TABLE `bca` (
  `id` varchar(10) NOT NULL,
  `user_id` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` int(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `icon` enum('PESANAN','LAYANAN','DEPOSIT','PENGGUNA','PROMO') COLLATE utf8_swedish_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `tipe` enum('INFO','PERINGATAN','PENTING') COLLATE utf8_swedish_ci NOT NULL,
  `konten` text COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cek_akun`
--

CREATE TABLE `cek_akun` (
  `id` int(10) NOT NULL,
  `saldo` double NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `tipe` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `provider` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `id` int(11) NOT NULL,
  `kode_deposit` varchar(14) NOT NULL,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `tipe` varchar(50) DEFAULT NULL,
  `provider` varchar(200) CHARACTER SET utf8 COLLATE utf8_swedish_ci DEFAULT NULL,
  `pengirim` varchar(15) CHARACTER SET utf8 COLLATE utf8_swedish_ci DEFAULT NULL,
  `penerima` varchar(50) DEFAULT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `jumlah_transfer` varchar(200) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `get_saldo` varchar(200) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `metode_isi_saldo` varchar(50) NOT NULL,
  `status` enum('Success','Pending','Error') NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gopay`
--

CREATE TABLE `gopay` (
  `id` varchar(10) NOT NULL,
  `nomor` varchar(18) NOT NULL,
  `kode` varchar(6) NOT NULL,
  `login_token` text NOT NULL,
  `token` text NOT NULL,
  `pin` varchar(20) NOT NULL,
  `device_id` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_layanan`
--

CREATE TABLE `kategori_layanan` (
  `id` int(10) NOT NULL,
  `kategori` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `brand` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `tipe` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `server` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `kategori_layanan`
--

INSERT INTO `kategori_layanan` (`id`, `kategori`, `brand`, `tipe`, `server`) VALUES
(144, 'Pulsa', 'TELKOMSEL', 'Umum', 'Top Up'),
(145, 'E-Money', 'GO PAY', 'Customer', 'Top Up'),
(146, 'PLN', 'PLN', 'Umum', 'Top Up'),
(147, 'Games', 'Call of Duty MOBILE', 'Umum', 'Top Up'),
(148, 'E-Money', 'OVO', 'Umum', 'Top Up'),
(149, 'Data', 'TELKOMSEL', 'Mini', 'Top Up'),
(150, 'Data', 'TELKOMSEL', 'Umum', 'Top Up'),
(151, 'Data', 'TELKOMSEL', 'Flash', 'Top Up'),
(152, 'Data', 'XL', 'Hotrod', 'Top Up'),
(153, 'Data', 'XL', 'Xtra Combo', 'Top Up'),
(154, 'Games', 'MOBILE LEGEND', 'Membership', 'Top Up'),
(155, 'Voucher', 'PUBG MOBILE', 'Umum', 'Top Up'),
(156, 'Data', 'TRI', 'Mix', 'Top Up'),
(157, 'Data', 'INDOSAT', 'Freedom Harian', 'Top Up'),
(158, 'Data', 'INDOSAT', 'Yellow', 'Top Up'),
(159, 'Voucher', 'GRAB', 'Driver', 'Top Up'),
(160, 'Pulsa Internasional', 'MAXIS', 'Umum', 'Top Up'),
(161, 'Voucher', 'INDOSAT', 'Freedom Internet', 'Top Up'),
(162, 'Voucher', 'AXIS', 'Mini', 'Top Up'),
(163, 'Voucher', 'TRI', 'AlwaysOn', 'Top Up'),
(164, 'Voucher', 'TRI', 'Unlimited', 'Top Up'),
(165, 'Voucher', 'XL', 'Combo Lite', 'Top Up'),
(166, 'Data', 'INDOSAT', 'Freedom Internet', 'Top Up'),
(167, 'Data', 'INDOSAT', 'Haji', 'Top Up'),
(168, 'Data', 'INDOSAT', 'Freedom U', 'Top Up'),
(169, 'Data', 'INDOSAT', 'Unlimited', 'Top Up'),
(170, 'Data', 'INDOSAT', 'Freedom Combo', 'Top Up'),
(171, 'Data', 'XL', 'Xtra On', 'Top Up'),
(172, 'Pulsa', 'TELKOMSEL', 'Pulsa Transfer', 'Top Up'),
(173, 'Data', 'AXIS', 'Bronet', 'Top Up'),
(174, 'Data', 'AXIS', 'Owsem', 'Top Up'),
(175, 'Data', 'TELKOMSEL', 'GamesMAX Unlimited Play', 'Top Up'),
(176, 'E-Money', 'GO PAY', 'Driver', 'Top Up'),
(177, 'Data', 'TELKOMSEL', 'Malam', 'Top Up'),
(178, 'Data', 'TELKOMSEL', 'Youtube', 'Top Up'),
(179, 'Data', 'TELKOMSEL', 'OMG', 'Top Up'),
(180, 'Paket SMS Telpon', 'TELKOMSEL', 'Umum', 'Top Up'),
(181, 'Youtube Likes / Comments /', 'Youtube Likes / Comments /', 'Sosial Media', ''),
(182, 'SoundCloud', 'SoundCloud', 'Sosial Media', ''),
(183, 'Pinterest', 'Pinterest', 'Sosial Media', ''),
(184, 'Telegram', 'Telegram', 'Sosial Media', ''),
(185, 'Instagram Views', 'Instagram Views', 'Sosial Media', ''),
(186, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story / Impressions / Saves /  Reach', 'Sosial Media', ''),
(187, 'Twitter Views / Impressions / Live / Comments', 'Twitter Views / Impressions / Live / Comments', 'Sosial Media', ''),
(188, 'Website Traffic', 'Website Traffic', 'Sosial Media', ''),
(189, 'Instagram Live Video', 'Instagram Live Video', 'Sosial Media', ''),
(190, 'Instagram Likes / Likes + Impressions', 'Instagram Likes / Likes + Impressions', 'Sosial Media', ''),
(191, 'Twitter Poll Votes', 'Twitter Poll Votes', 'Sosial Media', ''),
(192, 'Spotify', 'Spotify', 'Sosial Media', ''),
(193, 'Facebook Page Likes', 'Facebook Page Likes', 'Sosial Media', ''),
(194, 'Website Traffic [Targeted]', 'Website Traffic [Targeted]', 'Sosial Media', ''),
(195, 'Instagram Likes', 'Instagram Likes', 'Sosial Media', ''),
(196, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes / Comments / Shares / Events', 'Sosial Media', ''),
(197, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers No Refill/Not Guaranteed', 'Sosial Media', ''),
(198, 'ZPRIVAT NOTE ORDER', 'ZPRIVAT NOTE ORDER', 'Sosial Media', ''),
(199, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(200, 'Instagram TV', 'Instagram TV', 'Sosial Media', ''),
(201, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(202, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(203, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia', 'Sosial Media', ''),
(204, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia', 'Sosial Media', ''),
(205, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(206, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(207, 'Instagram Highlights / Profile Visits / Reach', 'Instagram Highlights / Profile Visits / Reach', 'Sosial Media', ''),
(208, 'Instagram Auto Likes [Per Minute] ', 'Instagram Auto Likes [Per Minute] ', 'Sosial Media', ''),
(209, 'Tiktok Followers', 'Tiktok Followers', 'Sosial Media', ''),
(210, 'Tiktok Likes', 'Tiktok Likes', 'Sosial Media', ''),
(211, 'Facebook Followers / Friends / Group Members', 'Facebook Followers / Friends / Group Members', 'Sosial Media', ''),
(212, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TikTok  Views, Komentar , Like Komentar &Share ', 'Sosial Media', ''),
(213, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(214, 'Twitter Likes', 'Twitter Likes', 'Sosial Media', ''),
(215, 'Instagram Followers Indonesia PAKET REAL ', 'Instagram Followers Indonesia PAKET REAL ', 'Sosial Media', ''),
(216, 'Youtube Views', 'Youtube Views', 'Sosial Media', ''),
(217, 'Instagram Followers Indonesia [Bergaransi] Refill ', 'Instagram Followers Indonesia [Bergaransi] Refill ', 'Sosial Media', ''),
(218, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(219, 'Youtube Live Stream', 'Youtube Live Stream', 'Sosial Media', ''),
(220, 'Facebook Video Views / Live Stream', 'Facebook Video Views / Live Stream', 'Sosial Media', ''),
(221, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(222, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(223, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(224, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(225, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(226, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(227, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(228, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(229, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(230, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(231, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(232, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(233, 'Youtube Watchtime', 'Youtube Watchtime', 'Sosial Media', ''),
(234, 'Youtube Subscribers ', 'Youtube Subscribers ', 'Sosial Media', ''),
(235, 'Twitter Followers', 'Twitter Followers', 'Sosial Media', ''),
(236, 'Instagram Story Indonesia', 'Instagram Story Indonesia', 'Sosial Media', ''),
(237, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(238, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(239, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(240, 'Instagram Comments', 'Instagram Comments', 'Sosial Media', ''),
(241, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(242, 'Instagram Reels Views/Likes/Comments', 'Instagram Reels Views/Likes/Comments', 'Sosial Media', ''),
(243, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(244, 'ORDER WEBISITE/DOMAIN/JASA FIX/DAN OPER IRVANKEDE', 'ORDER WEBISITE/DOMAIN/JASA FIX/DAN OPER IRVANKEDE', 'Sosial Media', ''),
(245, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(246, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(247, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(248, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(249, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(250, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(251, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(252, 'Followers Indonesia Gender [ SESUAI JENIS KELAMIN]', 'Followers Indonesia Gender [ SESUAI JENIS KELAMIN]', 'Sosial Media', ''),
(253, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(254, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(255, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(256, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(257, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(258, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(259, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(260, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(261, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(262, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(263, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(264, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(265, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(266, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(267, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(268, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(269, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(270, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(271, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(272, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(273, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(274, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(275, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(276, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(277, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(278, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(279, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(280, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(281, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(282, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(283, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', '');

-- --------------------------------------------------------

--
-- Table structure for table `ketentuan_layanan`
--

CREATE TABLE `ketentuan_layanan` (
  `id` int(2) NOT NULL,
  `nomer` varchar(50) NOT NULL,
  `tipe` varchar(25) NOT NULL,
  `konten` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kode_voucher`
--

CREATE TABLE `kode_voucher` (
  `id` int(11) NOT NULL,
  `kode` varchar(75) NOT NULL,
  `jumlah_saldo` int(100) NOT NULL,
  `status` enum('Aktif','Nonaktif','Kadaluwarsa','') NOT NULL,
  `user_redem` varchar(100) NOT NULL,
  `tanggal_buat` date NOT NULL,
  `tanggal_redem` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kontak_admin`
--

CREATE TABLE `kontak_admin` (
  `id` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` text NOT NULL,
  `deskripsi` text NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `jam_kerja` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` varchar(25) NOT NULL,
  `link_fb` varchar(100) NOT NULL,
  `link_ig` varchar(100) NOT NULL,
  `link_foto` varchar(5000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kontak_admin`
--

INSERT INTO `kontak_admin` (`id`, `nama`, `jabatan`, `deskripsi`, `lokasi`, `jam_kerja`, `email`, `no_hp`, `link_fb`, `link_ig`, `link_foto`) VALUES
(1, 'Ilman S', 'Web Developer And Programmer', 'WORK HARD', 'Bogor, Jawa Barat', '08:00 - 23:59 WIB', 'ilmansunannudin2@gmail.com', '082298859671', 'https://www.facebook.com/ilman.sn', 'https://www.instagram.com/ilman.sn', 'https://z-m-scontent.fcgk11-1.fna.fbcdn.net/v/t1.0-1/cp0/e15/q65/c0.0.120.120a/p120x120/127158166_2469969553306886_5298878951345506294_o.jpg?_nc_cat=100&ccb=2&_nc_sid=dbb9e7&_nc_ohc=pqSBCRXvYAwAX8lRpEe&_nc_ad=z-m&_nc_cid=1135&_nc_eh=0d6317ecd32aaa48b11d4c016d0c539f&_nc_ht=z-m-scontent.fcgk11-1.fna&tp=5&oh=f3c49b4682b535df0d963c6b36b90d0b&oe=600A2954'),
(0, 'SFAS SFSAF', 'safdas', 'sdfadf', 'SDFSDF', '22', 'pandubogorr123@gmail.com', '082298859671', 'sfa', 'safd', '');

-- --------------------------------------------------------

--
-- Table structure for table `kontak_website`
--

CREATE TABLE `kontak_website` (
  `id` int(11) NOT NULL,
  `logo` text NOT NULL,
  `link_fb` varchar(100) NOT NULL,
  `link_ig` varchar(100) NOT NULL,
  `no_wa` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `kode_pos` int(11) NOT NULL,
  `jam_kerja` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kontak_website`
--

INSERT INTO `kontak_website` (`id`, `logo`, `link_fb`, `link_ig`, `no_wa`, `email`, `alamat`, `kode_pos`, `jam_kerja`) VALUES
(1, 'AR', 'https://web.facebook.com/menz.pedia.96', 'https://www.instagram.com/mpedia.panel', '6289522811620', 'admin@m-pedia.net', 'Bogor, Leuwiliang ,Indonesia', 16640, '08:00 - 22:00 WIB');

-- --------------------------------------------------------

--
-- Table structure for table `layanan_pascabayar`
--

CREATE TABLE `layanan_pascabayar` (
  `id` int(10) NOT NULL,
  `service_id` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `provider_id` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `kategori` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `status` enum('Normal','Gangguan') COLLATE utf8_swedish_ci NOT NULL,
  `provider` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `tipe` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `server` varchar(25) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `layanan_pascabayar`
--

INSERT INTO `layanan_pascabayar` (`id`, `service_id`, `provider_id`, `kategori`, `layanan`, `status`, `provider`, `tipe`, `server`) VALUES
(1, 'MPPLNPASCA', 'MPPLNPASCA', 'PLN PASCABAYAR', 'Pln Pascabayar', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(2, 'MPHPPASCA', 'MPHPPASCA', 'HP PASCABAYAR', 'Halo Postpaid', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(3, 'MPSPEEDY', 'MPSPEEDY', 'INTERNET PASCABAYAR', 'SPEEDY & INDIHOME', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(4, 'MPTELKOM', 'MPTELKOM', 'INTERNET PASCABAYAR', 'TELKOMPSTN', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(5, 'MPBPJS', 'MPBPJS', 'BPJS KESEHATAN', 'Bpjs Kesehatan', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(6, 'MPGASNEGARA', 'MPGASNEGARA', 'GAS NEGARA', 'Gas Negara', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(7, 'MPBUSSANFINANCE', 'MPBUSSANFINANCE', 'MULTIFINANCE', 'Bussan Auto Finance', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(8, 'MPCOLUMBFINANCE', 'MPCOLUMBFINANCE', 'MULTIFINANCE', 'Columbia Finance', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(9, 'MPMEGAFINANCE', 'MPMEGAFINANCE', 'MULTIFINANCE', 'Mega Auto Finance', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(10, 'MPMEGACENFINANCE', 'MPMEGACENFINANCE', 'MULTIFINANCE', 'Mega Central Finance', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(11, 'MPWOMFINANCE', 'MPWOMFINANCE', 'MULTIFINANCE', 'Wom Finance', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(12, 'MPPASCAMATRIX', 'MPPASCAMATRIX', 'HP PASCABAYAR', 'Matrix', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(13, 'MPPASCAXL', 'MPPASCAXL', 'HP PASCABAYAR', 'XL Postpaid', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(14, 'MPTHREESMART', 'MPTHREESMART', 'HP PASCABAYAR', 'Three Postpaid', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(15, 'MPPASCASMART', 'MPPASCASMART', 'HP PASCABAYAR', 'Smartfren Postpaid', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR');

-- --------------------------------------------------------

--
-- Table structure for table `layanan_pulsa`
--

CREATE TABLE `layanan_pulsa` (
  `id` int(10) NOT NULL,
  `service_id` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `provider_id` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `operator` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` text COLLATE utf8_swedish_ci NOT NULL,
  `deskripsi` text COLLATE utf8_swedish_ci NOT NULL,
  `harga` double NOT NULL,
  `harga_api` double NOT NULL,
  `status` enum('Normal','Gangguan') COLLATE utf8_swedish_ci NOT NULL,
  `provider` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `tipe` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `kategori` varchar(200) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `layanan_pulsa`
--

INSERT INTO `layanan_pulsa` (`id`, `service_id`, `provider_id`, `operator`, `layanan`, `deskripsi`, `harga`, `harga_api`, `status`, `provider`, `tipe`, `kategori`) VALUES
(410, 'TSEL5', 'TSEL5', 'TELKOMSEL', 'Telkomsel 5.000', 'Pulsa Telkomsel Rp 5.000', 6295, 5595, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(411, 'TSEL1', 'TSEL1', 'TELKOMSEL', 'Telkomsel 1.000', 'Pulsa Telkomsel Rp 1.000', 2545, 1845, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(412, 'GOPAY10', 'GOPAY10', 'GO PAY', 'Go Pay 10.000', 'Masukan no HP', 11875, 11175, 'Normal', 'DG-PULSA', 'E-Money', 'Customer'),
(413, 'GOPAY100', 'GOPAY100', 'GO PAY', 'Go Pay 100.000', 'Masukan no HP', 101700, 101000, 'Normal', 'DG-PULSA', 'E-Money', 'Customer'),
(414, 'TSEL3', 'TSEL3', 'TELKOMSEL', 'Telkomsel 3.000', 'Pulsa Telkomsel Rp 3.000', 4790, 4090, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(415, 'TSEL80', 'TSEL80', 'TELKOMSEL', 'Telkomsel 80.000', 'Pulsa Telkomsel Rp 80.000', 80600, 79900, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(416, 'TSEL85', 'TSEL85', 'TELKOMSEL', 'Telkomsel 85.000', 'Pulsa Telkomsel Rp 85.000', 85550, 84850, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(417, 'TSEL90', 'TSEL90', 'TELKOMSEL', 'Telkomsel 90.000', 'Pulsa Telkomsel Rp 90.000', 90525, 89825, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(418, 'MPTSEL100', 'MPTSEL100', 'TELKOMSEL', 'Telkomsel 100.000', 'Pulsa Telkomsel Rp 100.000', 97850, 97150, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(419, 'TSEL10', 'TSEL10', 'TELKOMSEL', 'Telkomsel 10.000', 'Pulsa Telkomsel Rp 10.000', 11455, 10755, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(420, 'TSEL15', 'TSEL15', 'TELKOMSEL', 'Telkomsel 15.000', 'Pulsa Telkomsel Rp 15.000', 15900, 15200, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(421, 'TSEL35', 'TSEL35', 'TELKOMSEL', 'Telkomsel 35.000', 'Pulsa Telkomsel Rp 35.000', 35875, 35175, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(422, 'MPTSEL40', 'MPTSEL40', 'TELKOMSEL', 'Telkomsel 40.000', 'Pulsa Telkomsel Rp 40.000', 40475, 39775, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(423, 'TSEL50', 'TSEL50', 'TELKOMSEL', 'Telkomsel 50.000', 'Pulsa Telkomsel Rp 50.000', 50825, 50125, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(424, 'TSEL20', 'TSEL20', 'TELKOMSEL', 'Telkomsel 20.000', 'Pulsa Telkomsel Rp 20.000', 20975, 20275, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(425, 'TSEL25', 'TSEL25', 'TELKOMSEL', 'Telkomsel 25.000', 'Pulsa Telkomsel Rp 25.000', 25850, 25150, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(426, 'ISAT5', 'ISAT5', 'INDOSAT', 'Indosat 5.000', 'Pulsa Indosat Rp 5.000', 6700, 6000, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(427, 'ISAT10', 'ISAT10', 'INDOSAT', 'Indosat 10.000', 'Pulsa Indosat Rp 10.000', 11805, 11105, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(428, 'ISAT15', 'ISAT15', 'INDOSAT', 'Indosat 15.000', 'Pulsa Indosat Rp 15.000', 16035, 15335, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(429, 'ISAT20', 'ISAT20', 'INDOSAT', 'Indosat 20.000', 'Pulsa Indosat Rp 20.000', 20850, 20150, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(430, 'ISAT25', 'ISAT25', 'INDOSAT', 'Indosat 25.000', 'Pulsa Indosat Rp 25.000', 25895, 25195, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(431, 'ISAT30', 'ISAT30', 'INDOSAT', 'Indosat 30.000', 'Pulsa Indosat Rp 30.000', 30575, 29875, 'Gangguan', 'DG-PULSA', 'Pulsa', 'Umum'),
(432, 'ISAT50', 'ISAT50', 'INDOSAT', 'Indosat 50.000', 'Pulsa Indosat Rp 50.000', 49975, 49275, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(433, 'MPISAT60', 'MPISAT60', 'INDOSAT', 'Indosat 60.000', 'Pulsa Indosat Rp 60.000', 60169, 59469, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(434, 'MPISAT80', 'MPISAT80', 'INDOSAT', 'Indosat 80.000', 'Pulsa Indosat Rp 80.000', 79479, 78779, 'Gangguan', 'DG-PULSA', 'Pulsa', 'Umum'),
(435, 'AXIS5', 'AXIS5', 'AXIS', 'Axis 5.000', 'Pulsa Axis Rp 5.000', 6795, 6095, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(436, 'AXIS10', 'AXIS10', 'AXIS', 'Axis 10.000', 'Pulsa Axis Rp 10.000', 11750, 11050, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(437, 'AXIS15', 'AXIS15', 'AXIS', 'Axis 15.000', 'Pulsa Axis Rp 15.000', 15860, 15160, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(438, 'AXIS25', 'AXIS25', 'AXIS', 'Axis 25.000', 'Pulsa Axis Rp 25.000', 25660, 24960, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(439, 'AXIS30', 'AXIS30', 'AXIS', 'Axis 30.000', 'Pulsa Axis Rp 30.000', 30725, 30025, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(440, 'AXIS50', 'AXIS50', 'AXIS', 'Axis 50.000', 'Pulsa Axis Rp 50.000', 50300, 49600, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(441, 'MPAXIS100', 'MPAXIS100', 'AXIS', 'Axis 100.000', 'Pulsa Axis Rp 100.000', 99500, 98800, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(442, 'THREE1', 'THREE1', 'TRI', 'Three 1.000', 'Pulsa Three Rp 1.000', 2195, 1495, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(443, 'THREE2', 'THREE2', 'TRI', 'Three 2.000', 'Pulsa Three Rp 2.000', 3145, 2445, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(444, 'THREE3', 'THREE3', 'TRI', 'Three 3.000', 'Pulsa Three Rp 3.000', 4125, 3425, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(445, 'THREE5', 'THREE5', 'TRI', 'Three 5.000', 'Pulsa Three Rp 5.000', 6248, 5548, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(446, 'THREE10', 'THREE10', 'TRI', 'Three 10.000', 'Pulsa Three Rp 10.000', 11150, 10450, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(447, 'THREE15', 'THREE15', 'TRI', 'Three 15.000', 'Pulsa Three Rp 15.000', 15505, 14805, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(448, 'THREE20', 'THREE20', 'TRI', 'Three 20.000', 'Pulsa Three Rp 20.000', 20460, 19760, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(449, 'THREE25', 'THREE25', 'TRI', 'Three 25.000', 'Pulsa Three Rp 25.000', 25325, 24625, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(450, 'THREE30', 'THREE30', 'TRI', 'Three 30.000', 'Pulsa Three Rp 30.000', 30200, 29500, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(451, 'THREE50', 'THREE50', 'TRI', 'Three 50.000', 'Pulsa Three Rp 50.000', 50150, 49450, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(452, 'MPTHREE100', 'MPTHREE100', 'TRI', 'Three 100.000', 'Pulsa Three Rp 100.000', 98275, 97575, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(453, 'MPXL1', 'MPXL1', 'XL', 'Xl 5.000', 'Pulsa Xl Rp 5.000', 6790, 6090, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(454, 'MPXL10', 'MPXL10', 'XL', 'Xl 10.000', 'Pulsa Xl Rp 10.000', 11715, 11015, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(455, 'MPXL15', 'MPXL15', 'XL', 'Xl 15.000', 'Pulsa Xl Rp 15.000', 15900, 15200, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(456, 'MPXL25', 'MPXL25', 'XL', 'Xl 25.000', 'Pulsa Xl Rp 25.000', 26475, 25775, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(457, 'MPXL30', 'MPXL30', 'XL', 'XL 30.000', 'Pulsa Xl Rp 30.000', 30650, 29950, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(458, 'MPXL50', 'MPXL50', 'XL', 'Xl 50.000', 'Pulsa Xl Rp 50.000', 50400, 49700, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(459, 'MPXL100', 'MPXL100', 'XL', 'Xl 100.000', 'Pulsa Xl Rp 100.000', 99750, 99050, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(460, 'MPISAT100', 'MPISAT100', 'INDOSAT', 'Indosat 100.000', 'Pulsa Indosat Rp 100.000', 97900, 97200, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(461, 'PLN20', 'PLN20', 'PLN', 'PLN 20.000', 'masukkan nomor meter/id pelanggan', 21080, 20380, 'Normal', 'DG-PULSA', 'PLN', 'Umum'),
(462, 'PLN50', 'PLN50', 'PLN', 'PLN 50.000', 'masukkan nomor meter/id pelanggan', 51075, 50375, 'Normal', 'DG-PULSA', 'PLN', 'Umum'),
(463, 'PLN100', 'PLN100', 'PLN', 'PLN 100.000', 'masukkan nomor meter/id pelanggan', 101035, 100335, 'Normal', 'DG-PULSA', 'PLN', 'Umum'),
(464, 'PLN200', 'PLN200', 'PLN', 'PLN 200.000', 'masukkan nomor meter/id pelanggan', 201095, 200395, 'Normal', 'DG-PULSA', 'PLN', 'Umum'),
(465, 'PLN500', 'PLN500', 'PLN', 'PLN 500.000', 'masukkan nomor meter/id pelanggan', 501120, 500420, 'Normal', 'DG-PULSA', 'PLN', 'Umum'),
(466, 'MPCOD26', 'MPCOD26', 'Call of Duty MOBILE', 'COD 26', 'Call of Duty Mobile 26CP', 5800, 5100, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(467, 'MPCOD53', 'MPCOD53', 'Call of Duty MOBILE', 'COD 53', 'Call of Duty Mobile 53CP', 10550, 9850, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(468, 'MPCOD106', 'MPCOD106', 'Call of Duty MOBILE', 'COD 106', 'Call of Duty Mobile 106CP', 20050, 19350, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(469, 'MPCOD264', 'MPCOD264', 'Call of Duty MOBILE', 'COD 264', 'Call of Duty Mobile 264CP', 49000, 48300, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(470, 'MPCOD528', 'MPCOD528', 'Call of Duty MOBILE', 'COD 528', 'Call of Duty Mobile 528CP', 96900, 96200, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(471, 'FF5', 'FF5', 'FREE FIRE', 'Free Fire 5 Diamond', 'Free Fire 5 Diamond', 1930, 1230, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(472, 'FF12', 'FF12', 'FREE FIRE', 'Free Fire 12 Diamond', 'Free Fire 12 Diamond', 2940, 2240, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(473, 'FF20', 'FF20', 'FREE FIRE', 'Free Fire 20 Diamond', 'Free Fire 20 Diamond', 5000, 4300, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(474, 'FF50', 'FF50', 'FREE FIRE', 'Free Fire 50 Diamond', 'Free Fire 50 Diamond', 8055, 7355, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(475, 'FF70', 'FF70', 'FREE FIRE', 'Free Fire 70 Diamond', 'Free Fire 70 Diamond', 10690, 9990, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(476, 'FF55', 'FF55', 'FREE FIRE', 'Free Fire 55 Diamond', 'Free Fire 55 Diamond', 9950, 9250, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(477, 'FF100', 'FF100', 'FREE FIRE', 'Free Fire 100 Diamond', 'Free Fire 100 Diamond', 16510, 15810, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(478, 'FF140', 'FF140', 'FREE FIRE', 'Free Fire 140 Diamond', 'Free Fire 140 Diamond', 19140, 18440, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(479, 'FF355', 'FF355', 'FREE FIRE', 'Free Fire 355 Diamond', 'Free Fire 355 Diamond', 46220, 45520, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(480, 'FF1080', 'FF1080', 'FREE FIRE', 'Free Fire 1080 Diamond', 'Free Fire 1080 Diamond', 151085, 150385, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(481, 'MPFF1450', 'MPFF1450', 'FREE FIRE', 'Free Fire 1450 Diamond', 'Free Fire 1450 Diamond', 185325, 184625, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(482, 'FF1200', 'FF1200', 'FREE FIRE', 'Free Fire 1200 Diamond', 'Free Fire 1200 Diamond', 171025, 170325, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(483, 'GOPAY25', 'GOPAY25', 'GO PAY', 'Go Pay 25.000', 'Masukan no HP', 26500, 25800, 'Normal', 'DG-PULSA', 'E-Money', 'Customer'),
(484, 'GOPAY50', 'GOPAY50', 'GO PAY', 'Go Pay 50.000', 'Masukan no HP', 51700, 51000, 'Normal', 'DG-PULSA', 'E-Money', 'Customer'),
(485, 'GOPAY75', 'GOPAY75', 'GO PAY', 'Go Pay 75.000', 'Masukan no HP', 76590, 75890, 'Normal', 'DG-PULSA', 'E-Money', 'Customer'),
(486, 'GOPAY150', 'GOPAY150', 'GO PAY', 'Go Pay 150.000', 'Masukan no HP', 151590, 150890, 'Normal', 'DG-PULSA', 'E-Money', 'Customer'),
(487, 'GOPAY200', 'GOPAY200', 'GO PAY', 'Go Pay 200.000', 'Masukan no HP', 201590, 200890, 'Normal', 'DG-PULSA', 'E-Money', 'Customer'),
(488, 'GOPAY250', 'GOPAY250', 'GO PAY', 'Go Pay 250.000', 'Masukan no HP', 252550, 251850, 'Normal', 'DG-PULSA', 'E-Money', 'Customer'),
(489, 'GOPAY500', 'GOPAY500', 'GO PAY', 'Go Pay 500.000', 'Masukan no HP', 501590, 500890, 'Normal', 'DG-PULSA', 'E-Money', 'Customer'),
(490, 'OVO10', 'OVO10', 'OVO', 'OVO 10.000', '-', 11725, 11025, 'Gangguan', 'DG-PULSA', 'E-Money', 'Umum'),
(491, 'MPOVO15', 'MPOVO15', 'OVO', 'OVO 15.000', 'OVO 15.000', 16410, 15710, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(492, 'OVO20', 'OVO20', 'OVO', 'OVO 20.000', 'OVO 20.000', 21010, 20310, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(493, 'OVO25', 'OVO25', 'OVO', 'OVO 25.000', 'OVO 25.000', 26875, 26175, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(494, 'OVO30', 'OVO30', 'OVO', 'OVO 30.000', 'OVO 30.000', 31875, 31175, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(495, 'OVO40', 'OVO40', 'OVO', 'OVO 40.000', 'OVO 40.000', 40275, 39575, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(496, 'OVO50', 'OVO50', 'OVO', 'OVO 50.000', 'OVO 50.000', 51875, 51175, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(497, 'MPOVO60', 'MPOVO60', 'OVO', 'OVO 60.000', 'OVO 60.000', 60275, 59575, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(498, 'MPOVO75', 'MPOVO75', 'OVO', 'OVO 75.000', 'OVO 75.000', 75275, 74575, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(499, 'MPOVO80', 'MPOVO80', 'OVO', 'OVO 80.000', 'OVO 80.000', 80275, 79575, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(500, 'OVO100', 'OVO100', 'OVO', 'OVO 100.000', 'OVO 100.000', 101875, 101175, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(501, 'MPOVO150', 'MPOVO150', 'OVO', 'OVO 150.000', 'OVO 150.000', 150275, 149575, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(502, 'OVO250', 'OVO250', 'OVO', 'OVO 250.000', 'OVO 250.000', 251875, 251175, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(503, 'OVO500', 'OVO500', 'OVO', 'OVO 500.000', 'OVO 500.000', 500275, 499575, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(504, 'SHOPEPAY10', 'SHOPEPAY10', 'SHOPEE PAY', 'SHOPEE PAY 10.000', 'SHOPEE PAY 10.000', 11700, 11000, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(505, 'SHOPEPAY20', 'SHOPEPAY20', 'SHOPEE PAY', 'SHOPEE PAY 20.000', 'SHOPEE PAY 20.000', 21250, 20550, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(506, 'SHOPEEPAY25', 'SHOPEEPAY25', 'SHOPEE PAY', 'SHOPEE PAY 25.000', 'SHOPEE PAY 25.000', 26400, 25700, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(507, 'SHOPEEPAY30', 'SHOPEEPAY30', 'SHOPEE PAY', 'SHOPEE PAY 30.000', 'SHOPEE PAY 30.000', 31250, 30550, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(508, 'SHOPEPAY40', 'SHOPEPAY40', 'SHOPEE PAY', 'SHOPEE PAY 40.000', 'SHOPEE PAY 40.000', 41400, 40700, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(509, 'MPSHOPEPAY50', 'MPSHOPEPAY50', 'SHOPEE PAY', 'SHOPEE PAY 50.000', 'SHOPEE PAY 50.000', 51575, 50875, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(510, 'SHOPEPAY60', 'SHOPEPAY60', 'SHOPEE PAY', 'SHOPEE PAY 60.000', 'SHOPEE PAY 60.000', 61400, 60700, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(511, 'SHOPEPAY100', 'SHOPEPAY100', 'SHOPEE PAY', 'SHOPEE PAY 100.000', 'SHOPEE PAY 100.000', 101250, 100550, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(512, 'SHOPEPAY150', 'SHOPEPAY150', 'SHOPEE PAY', 'SHOPEE PAY 150.000', 'SHOPEE PAY 150.000', 151575, 150875, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(513, 'SHOPEPAY200', 'SHOPEPAY200', 'SHOPEE PAY', 'SHOPEE PAY 200.000', 'SHOPEE PAY 200.000', 201475, 200775, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(514, 'DANA10', 'DANA10', 'DANA', 'DANA 10.000', '-', 11065, 10365, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(515, 'DANA20', 'DANA20', 'DANA', 'DANA 20.000', '-', 21065, 20365, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(516, 'MPDANA25', 'MPDANA25', 'DANA', 'DANA 25.000', '-', 26075, 25375, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(517, 'DANA30', 'DANA30', 'DANA', 'DANA 30.000', '-', 31185, 30485, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(518, 'DANA40', 'DANA40', 'DANA', 'DANA 40.000', '-', 41065, 40365, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(519, 'DANA50', 'DANA50', 'DANA', 'DANA 50.000', '-', 51065, 50365, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(520, 'DANA60', 'DANA60', 'DANA', 'DANA 60.000', '-', 61065, 60365, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(521, 'DANA75', 'DANA75', 'DANA', 'DANA 75.000', '-', 76065, 75365, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(522, 'DANA100', 'DANA100', 'DANA', 'DANA 100.000', '-', 101065, 100365, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(523, 'DANA150', 'DANA150', 'DANA', 'DANA 150.000', '-', 151065, 150365, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(524, 'DANA200', 'DANA200', 'DANA', 'DANA 200.000', '-', 201185, 200485, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(525, 'DANA250', 'DANA250', 'DANA', 'DANA 250.000', '-', 251065, 250365, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(526, 'MINI5G3', 'MINI5G3', 'TELKOMSEL', 'Telkomsel Data Mini 5 GB / 3 Hari', '-', 29500, 28800, 'Normal', 'DG-PULSA', 'Data', 'Mini'),
(527, 'MINI1G7', 'MINI1G7', 'TELKOMSEL', 'Telkomsel Data Mini 1 GB / 7 Hari', '-', 21500, 20800, 'Normal', 'DG-PULSA', 'Data', 'Mini'),
(528, 'MPFLASH1GB', 'MPFLASH1GB', 'TELKOMSEL', 'Telkomsel Data 1 GB + 2 GB Game / 30 Hari', 'Flash 1GB + 2GB Game (30 hari)', 23975, 23275, 'Normal', 'DG-PULSA', 'Data', 'Umum'),
(529, 'MINI1G1', 'MINI1G1', 'TELKOMSEL', 'Telkomsel Data Mini 1 GB / 1 Hari', '-', 11500, 10800, 'Normal', 'DG-PULSA', 'Data', 'Mini'),
(530, 'FLASH5', 'FLASH5', 'TELKOMSEL', 'Telkomsel Data Flash 5.000', '20MB - 40MB sesuai zona / 7 Hari (sesuai zona)', 5500, 4800, 'Normal', 'DG-PULSA', 'Data', 'Flash'),
(531, 'FLASH10', 'FLASH10', 'TELKOMSEL', 'Telkomsel Data Flash 10.000', '50MB - 110MB sesuai zona, 7 Hari (sesuai zona)', 8500, 7800, 'Normal', 'DG-PULSA', 'Data', 'Flash'),
(532, 'FLASH68', 'FLASH68', 'TELKOMSEL', 'Telkomsel Data Flash 68.000', '4.5 GB, 24Jam 30Hari (sesuai zona)', 68725, 68025, 'Normal', 'DG-PULSA', 'Data', 'Flash'),
(533, 'FLASH85', 'FLASH85', 'TELKOMSEL', 'Telkomsel Data Flash 85.000', '8 GB, 24Jam 30Hari (sesuai zona)', 85675, 84975, 'Normal', 'DG-PULSA', 'Data', 'Flash'),
(534, 'FLASH100', 'FLASH100', 'TELKOMSEL', 'Telkomsel Data Flash 100.000', '12 GB / 30 Hari (sesuai zona)', 91000, 90300, 'Normal', 'DG-PULSA', 'Data', 'Flash'),
(535, 'MPHOTROD1', 'MPHOTROD1', 'XL', 'XL HOTROD 1.5 GB / 30 Hari', 'Kuota 24 Jam 1.5GB. Masa aktif 30 hari.', 47875, 47175, 'Normal', 'DG-PULSA', 'Data', 'Hotrod'),
(536, 'MPHOTROD8', 'MPHOTROD8', 'XL', 'XL HOTROD 8 GB / 30 Hari', '-', 122425, 121725, 'Normal', 'DG-PULSA', 'Data', 'Hotrod'),
(537, 'MPXTRA5', 'MPXTRA5', 'XL', 'XL Xtra Combo 5 GB + 10 GB / 30 Hari', '5GB (2G/3G/4G) + Nelp Anynet 20 mins. Youtube 24 Jam 10GB. Youtube 01:00-06:00 Tanpa kuota Unlimited.', 55775, 55075, 'Normal', 'DG-PULSA', 'Data', 'Xtra Combo'),
(538, 'MPXTRA10', 'MPXTRA10', 'XL', 'XL Xtra Combo 10 GB + 20 GB / 30 Hari', '10GB (2G/3G/4G) + Nelp Anynet 30 mins. Youtube 24 Jam 20GB. Youtube 01:00-06:00 Tanpa kuota Unlimited.', 81775, 81075, 'Normal', 'DG-PULSA', 'Data', 'Xtra Combo'),
(539, 'MPXTRA20', 'MPXTRA20', 'XL', 'XL Xtra Combo 20 GB + 40 GB / 30 Hari', '20GB (2G/3G/4G) + Nelp Anynet 60 mins. Youtube 24 Jam 40GB. Youtube 01:00-06:00 Tanpa kuota Unlimited.', 158000, 157300, 'Normal', 'DG-PULSA', 'Data', 'Xtra Combo'),
(540, 'MPXTRA35', 'MPXTRA35', 'XL', 'XL Xtra Combo 35 GB + 70 GB / 30 Hari', '35GB (2G/3G/4G) + Nelp Anynet 90 mins. Youtube 24 Jam 70GB. Youtube 01:00-06:00 Tanpa kuota Unlimited.', 218595, 217895, 'Normal', 'DG-PULSA', 'Data', 'Xtra Combo'),
(541, 'MPCOMBO10', 'MPCOMBO10', 'XL', 'XL Xtra Combo VIP 10 GB + 20 GB / 30 Hari', 'Kuota Utama (2G/3G/4G) 10GB + Kuota YouTube 20GB + YouTube Tanpa Kuota Tanpa Batas 01:00-06:00 WIB + Nelpon ke Semua Operator 30Menit', 91200, 90500, 'Normal', 'DG-PULSA', 'Data', 'Xtra Combo'),
(542, 'MPMLBB36', 'MPMLBB36', 'MOBILE LEGEND', 'MOBILELEGEND - 36 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 10100, 9400, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(543, 'ML74', 'ML74', 'MOBILE LEGEND', 'MOBILELEGEND - 74 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 22460, 21760, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(544, 'MP2010', 'MP2010', 'MOBILE LEGEND', 'MOBILELEGEND - 2010 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 483250, 482550, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(545, 'ML568', 'ML568', 'MOBILE LEGEND', 'MOBILELEGEND - 568 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 159400, 158700, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(546, 'ML28', 'ML28', 'MOBILE LEGEND', 'MOBILELEGEND - 28 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 9536, 8836, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(547, 'ML85', 'ML85', 'MOBILE LEGEND', 'MOBILELEGEND - 85 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 25288, 24588, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(548, 'ML59', 'ML59', 'MOBILE LEGEND', 'MOBILELEGEND - 59 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 18072, 17372, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(549, 'ML170', 'ML170', 'MOBILE LEGEND', 'MOBILELEGEND - 170 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 49576, 48876, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(550, 'MPMLBB222', 'MPMLBB222', 'MOBILE LEGEND', 'MOBILELEGEND - 222 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 58050, 57350, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(551, 'ML370', 'ML370', 'MOBILE LEGEND', 'MOBILELEGEND - 370 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 99775, 99075, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(552, 'MLSL1', 'MLSL1', 'MOBILE LEGEND', 'MOBILELEGEND - 4 Diamond + Starlight Member', 'MOBILELEGEND - 4 Diamond + Starlight Member', 143300, 142600, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(553, 'MLSL2', 'MLSL2', 'MOBILE LEGEND', 'MOBILELEGEND - 193 Diamond + Starlight Member', 'MOBILELEGEND - 193 Diamond + Starlight Member', 193950, 193250, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(554, 'TWLIGHT', 'TWLIGHT', 'MOBILE LEGEND', 'MOBILELEGEND Twilight Pass', '-', 146300, 145600, 'Normal', 'DG-PULSA', 'Games', 'Membership'),
(555, 'STARLIGHT', 'STARLIGHT', 'MOBILE LEGEND', 'MOBILELEGEND Startlight Member Plus', '-', 290000, 289300, 'Normal', 'DG-PULSA', 'Games', 'Membership'),
(556, 'MPMLSL4', 'MPMLSL4', 'MOBILE LEGEND', 'MOBILELEGEND - 5408 Diamond + Starlight Member', 'MOBILELEGEND - 5408 Diamond + Starlight Member', 1426050, 1425350, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(557, 'MPMLSL3', 'MPMLSL3', 'MOBILE LEGEND', 'MOBILELEGEND - 1411 Diamond + Starlight Member', 'MOBILELEGEND - 1411 Diamond + Starlight Member', 476050, 475350, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(558, 'MPVPUBG60', 'MPVPUBG60', 'PUBG MOBILE', 'Voucher PUBG Mobile 60 UC', 'PUBG Mobile 60 UC Voucher', 17005, 16305, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(559, 'MPVPUBG325', 'MPVPUBG325', 'PUBG MOBILE', 'Voucher PUBG Mobile 325 UC', 'PUBG Mobile 325 UC Voucher', 81025, 80325, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(560, 'MPVPUBG1800', 'MPVPUBG1800', 'PUBG MOBILE', 'Voucher PUBG Mobile 1800 UC', 'PUBG Mobile 1800 UC Voucher', 401125, 400425, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(561, 'MPVPUBG8100', 'MPVPUBG8100', 'PUBG MOBILE', 'Voucher PUBG Mobile 8100 UC', 'PUBG Mobile 8100 UC Voucher', 1601500, 1600800, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(562, 'MPVPUNG660', 'MPVPUNG660', 'PUBG MOBILE', 'Voucher PUBG Mobile 660 UC', 'PUBG Mobile 660 UC Voucher', 161050, 160350, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(563, 'MPVPUBG3850', 'MPVPUBG3850', 'PUBG MOBILE', 'Voucher PUBG Mobile 3850 UC', 'PUBG Mobile 3850 UC Voucher', 801250, 800550, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(564, 'MPWALLET12', 'MPWALLET12', 'Steam Wallet (IDR)', 'Steam Wallet Code Rp 12.000', '-', 14510, 13810, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(565, 'MPWALLET60', 'MPWALLET60', 'Steam Wallet (IDR)', 'Steam Wallet Code Rp 60.000', '-', 79500, 78800, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(566, 'MPWALLET130', 'MPWALLET130', 'Steam Wallet (IDR)', 'Steam Wallet Code Rp 120.000', '-', 147000, 146300, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(567, 'MPWALLET400', 'MPWALLET400', 'Steam Wallet (IDR)', 'Steam Wallet Code Rp 400.000', '-', 486500, 485800, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(568, 'MPWALLET6000', 'MPWALLET6000', 'Steam Wallet (IDR)', 'Steam Wallet Code Rp 6.000', '-', 9051, 8351, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(569, 'ETOL10', 'ETOL10', 'MANDIRI E-TOLL', 'Mandiri E-Toll 10.000', 'Wajib update saldo setelah pengisian sukses.', 11875, 11175, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(570, 'ETOL20', 'ETOL20', 'MANDIRI E-TOLL', 'Mandiri E-Toll 20.000', 'Wajib update saldo setelah pengisian sukses.', 21950, 21250, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(571, 'ETOL25', 'ETOL25', 'MANDIRI E-TOLL', 'Mandiri E-Toll 25.000', 'Wajib update saldo setelah pengisian sukses.', 26950, 26250, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(572, 'ETOL30', 'ETOL30', 'MANDIRI E-TOLL', 'Mandiri E-Toll 30.000', 'Wajib update saldo setelah pengisian sukses.', 31900, 31200, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(573, 'ETOL75', 'ETOL75', 'MANDIRI E-TOLL', 'Mandiri E-Toll 75.000', 'Wajib update saldo setelah pengisian sukses.', 76500, 75800, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(574, 'MPETOL100', 'MPETOL100', 'MANDIRI E-TOLL', 'Mandiri E-Toll 100.000', 'Wajib update saldo setelah pengisian sukses.', 101950, 101250, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(575, 'ETOL150', 'ETOL150', 'MANDIRI E-TOLL', 'Mandiri E-Toll 150.000', 'Wajib update saldo setelah pengisian sukses.', 151975, 151275, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(576, 'MPLINKAJA10', 'MPLINKAJA10', 'LinkAja', 'LinkAja Rp 10.000', '-', 11105, 10405, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(577, 'MPLINKAJA20', 'MPLINKAJA20', 'LinkAja', 'LinkAja Rp 20.000', '-', 21110, 20410, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(578, 'MPLINKAJA25', 'MPLINKAJA25', 'LinkAja', 'LinkAja Rp 25.000', '-', 26350, 25650, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(579, 'MPLINKAJA50', 'MPLINKAJA50', 'LinkAja', 'LinkAja Rp 50.000', '-', 51050, 50350, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(580, 'MPLINKAJA70', 'MPLINKAJA70', 'LinkAja', 'LinkAja Rp 70.000', '-', 71499, 70799, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(581, 'MPLINKAJA100', 'MPLINKAJA100', 'LinkAja', 'LinkAja Rp 100.000', '-', 101350, 100650, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(582, 'MPTRICMBO2GB', 'MPTRICMBO2GB', 'TRI', 'Tri Mix Combo 2 GB + 20 Menit', 'Paket Kombo Tri 2GB + 20 Menit telpon ke semua operator. Masa aktif 30 hari.', 35900, 35200, 'Normal', 'DG-PULSA', 'Data', 'Mix'),
(583, 'MPTRICMBO32GB', 'MPTRICMBO32GB', 'TRI', 'Tri Mix Combo 32 GB + 30 menit', '2 GB (semua jaringan) + 30 GB (1 GB per hari di jaringan 4G) + 30 menit ke semua operator, Masa Aktif 30 Hari', 59895, 59195, 'Normal', 'DG-PULSA', 'Data', 'Mix'),
(584, 'MPTRICMBO38GB', 'MPTRICMBO38GB', 'TRI', 'Tri Mix Combo 38 GB + 30 menit', '8 GB (semua jaringan) + 30 GB (1 GB per hari di jaringan 4G) + 30 menit ke semua operator, Masa Aktif 30 Hari', 123975, 123275, 'Normal', 'DG-PULSA', 'Data', 'Mix'),
(585, 'MPTRIMIX2GB', 'MPTRIMIX2GB', 'TRI', 'Tri Mix Kuota++ 2.25GB', '2.25GB mengikuti masa aktif sim', 51950, 51250, 'Normal', 'DG-PULSA', 'Data', 'Mix'),
(586, 'MPTRIMIX3GB', 'MPTRIMIX3GB', 'TRI', 'Tri Mix Small 3 GB 3 Hari', '3 GB semua jaringan 24 jam, Masa Aktif 3 Hari', 20655, 19955, 'Normal', 'DG-PULSA', 'Data', 'Mix'),
(587, 'MPTRIMIX5GB', 'MPTRIMIX5GB', 'TRI', 'Tri Mix Small 5 GB 1 Hari', '1 GB (24 jam) + 4 GB (12 malam - 9 pagi) semua jaringan, Masa Aktif 1 Hari', 5885, 5185, 'Normal', 'DG-PULSA', 'Data', 'Mix'),
(588, 'MPVALFA5', 'MPVALFA5', 'ALFAMART VOUCHER', 'Voucher Alfamart Rp 5.000', '-', 5988, 5288, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(589, 'MPVALFA10', 'MPVALFA10', 'ALFAMART VOUCHER', 'Voucher Alfamart Rp 10.000', '-', 10975, 10275, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(590, 'MPVALFA50', 'MPVALFA50', 'ALFAMART VOUCHER', 'Voucher Alfamart Rp 50.000', '-', 50875, 50175, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(591, 'GS33', 'GS33', 'GARENA', 'Voucher Garena 33 Shell', '-', 10099, 9399, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(592, 'GS165', 'GS165', 'GARENA', 'Voucher Garena 165 Shell', '-', 46449, 45749, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(593, 'GS66', 'GS66', 'GARENA', 'Voucher Garena 66 Shell', '-', 19300, 18600, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(594, 'GS330', 'GS330', 'GARENA', 'Voucher Garena 330 Shell', '-', 91650, 90950, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(595, 'MPINDIMARET25', 'MPINDIMARET25', 'INDOMARET', 'Voucher Indomaret Rp 25.000', '-', 25938, 25238, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(596, 'MPINDOMARET50', 'MPINDOMARET50', 'INDOMARET', 'Voucher Indomaret Rp 50.000', '-', 50875, 50175, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(597, 'MPINDOMARET100', 'MPINDOMARET100', 'INDOMARET', 'Voucher Indomaret Rp 100.000', '-', 100750, 100050, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(598, 'IFREDOMH28', 'IFREDOMH28', 'INDOSAT', 'Indosat Freedom Kuota Harian 28 GB / 28 Hari', 'Total Kuota 28GB dengan batas pemakaian harian 1GB/hari. Setelah batas pemakaian harian, pemakaian internet gratis dgn Pulsa Safe kecepatan s.d 64Kbps. Masa aktif 28 hari', 69725, 69025, 'Normal', 'DG-PULSA', 'Data', 'Freedom Harian'),
(599, 'IFREDOMH14', 'IFREDOMH14', 'INDOSAT', 'Indosat Freedom Kuota Harian 14 GB / 14 Hari', 'Total Kuota 14GB dengan batas pemakaian harian 1GB/hari. Setelah batas pemakaian harian, pemakaian internet gratis dgn Pulsa Safe kecepatan s.d 64Kbps. Masa aktif 14 hari', 37375, 36675, 'Normal', 'DG-PULSA', 'Data', 'Freedom Harian'),
(600, 'IFREDOMH7', 'IFREDOMH7', 'INDOSAT', 'Indosat Freedom Kuota Harian 7 GB / 7 Hari', 'Total Kuota 7GB dengan batas pemakaian harian 1GB/hari. Setelah batas pemakaian harian, pemakaian internet gratis dgn Pulsa Safe kecepatan s.d 64Kbps. Masa aktif 7 hari', 19500, 18800, 'Normal', 'DG-PULSA', 'Data', 'Freedom Harian'),
(601, 'MPISAT2G30', 'MPISAT2G30', 'INDOSAT', 'Indosat 2 GB / 30 Hari', 'KUOTA 2GB 30 hari', 21625, 20925, 'Normal', 'DG-PULSA', 'Data', 'Umum'),
(602, 'YELLOW1', 'YELLOW1', 'INDOSAT', 'Indosat Yellow 1 GB / 1 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psyellowplan', 4625, 3925, 'Normal', 'DG-PULSA', 'Data', 'Yellow'),
(603, 'YELLOW1G3', 'YELLOW1G3', 'INDOSAT', 'Indosat Yellow 1 GB / 3 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psyellowplan', 5900, 5200, 'Normal', 'DG-PULSA', 'Data', 'Yellow'),
(604, 'YELLOW1G7', 'YELLOW1G7', 'INDOSAT', 'Indosat Yellow 1 GB / 7 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psyellowplan', 10800, 10100, 'Normal', 'DG-PULSA', 'Data', 'Yellow'),
(605, 'MPSMART5', 'MPSMART5', 'SMART', 'Smart 5.000', 'Pulsa Smart Rp 5.000', 5940, 5240, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(606, 'MPSMART10', 'MPSMART10', 'SMART', 'Smart 10.000', 'Pulsa Smart Rp 10.000', 10985, 10285, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(607, 'MPSMART20', 'MPSMART20', 'SMART', 'Smart 20.000', 'Pulsa Smart Rp 20.000', 20925, 20225, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(608, 'MPSMART25', 'MPSMART25', 'SMART', 'Smart 25.000', 'Pulsa Smart Rp 25.000', 25560, 24860, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(609, 'MPSMART30', 'MPSMART30', 'SMART', 'Smart 30.000', '-', 30800, 30100, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(610, 'MPSMART100', 'MPSMART100', 'SMART', 'Smart 100.000', 'Pulsa Smart Rp 100.000', 99125, 98425, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(611, 'MPUNIPIN10', 'MPUNIPIN10', 'Unipin Voucher', 'Voucher Unipin 10.000', 'Voucher Unipin 10.000', 10700, 10000, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(612, 'MPUNIPIN20', 'MPUNIPIN20', 'Unipin Voucher', 'Voucher Unipin 20.000', 'Voucher Unipin 20.000', 20400, 19700, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(613, 'MPUNIPIN100', 'MPUNIPIN100', 'Unipin Voucher', 'Voucher Unipin 100.000', 'Voucher Unipin 100.000', 98000, 97300, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(614, 'MPUNIPIN500', 'MPUNIPIN500', 'Unipin Voucher', 'Voucher Unipin 500.000', 'Voucher Unipin 500.000', 486000, 485300, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(615, 'MPUNIPIN300', 'MPUNIPIN300', 'Unipin Voucher', 'Voucher Unipin 300.000', 'Voucher Unipin 300.000', 292000, 291300, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(616, 'MPUNIPIN50', 'MPUNIPIN50', 'Unipin Voucher', 'Voucher Unipin 50.000', 'Voucher Unipin 50.000', 49500, 48800, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(617, 'WIFIID1', 'WIFIID1', 'WIFI ID', 'Akses wifi.id 1 hari', '6 Jam untuk Sumatera, Jawa, Balinusa. 4 jam untuk Kalimantan dan Sulawesi. 2 Jam untuk Maluku dan Papua. NB : Pelanggan akan terima notif sms berupa USER dan PASS dari Telkom', 4590, 3890, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(618, 'WIFIID30', 'WIFIID30', 'WIFI ID', 'Akses wifi.id 30 hari', 'NB : Pelanggan akan terima notif sms berupa USER dan PASS dari Telkom', 37135, 36435, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(619, 'WIFIID7', 'WIFIID7', 'WIFI ID', 'Akses wifi.id 7 hari', 'NB : Pelanggan akan terima notif sms berupa USER dan PASS dari Telkom', 15100, 14400, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(620, 'GRABCS20', 'GRABCS20', 'GRAB', 'Grab penumpang 20.000', '-', 21795, 21095, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(621, 'GRABCS25', 'GRABCS25', 'GRAB', 'Grab penumpang 25.000', '-', 26795, 26095, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(622, 'GRABCS50', 'GRABCS50', 'GRAB', 'Grab penumpang 50.000', '-', 51795, 51095, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(623, 'GRABCS40', 'GRABCS40', 'GRAB', 'Grab penumpang 40.000', '-', 41825, 41125, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(624, 'GRABCS100', 'GRABCS100', 'GRAB', 'Grab penumpang 100.000', '-', 101795, 101095, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(625, 'GRABDRIVER100', 'GRABDRIVER100', 'GRAB', 'Voucher Grab driver 100.000', '-', 101500, 100800, 'Normal', 'DG-PULSA', 'Voucher', 'Driver'),
(626, 'GRABDRIVER150', 'GRABDRIVER150', 'GRAB', 'Voucher Grab driver 150.000', '-', 151300, 150600, 'Normal', 'DG-PULSA', 'Voucher', 'Driver'),
(627, 'GRABDRIVER200', 'GRABDRIVER200', 'GRAB', 'Voucher Grab driver 200.000', '-', 201500, 200800, 'Normal', 'DG-PULSA', 'Voucher', 'Driver'),
(628, 'MPTIXID100', 'MPTIXID100', 'TIX ID', 'TIX ID 100.000', '-', 107000, 106300, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(629, 'MPTIXID200', 'MPTIXID200', 'TIX ID', 'TIX ID 200.000', '-', 207000, 206300, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(630, 'MPTIXID300', 'MPTIXID300', 'TIX ID', 'TIX ID 300.000', '-', 307000, 306300, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(631, 'MPTIXID400', 'MPTIXID400', 'TIX ID', 'TIX ID 400.000', '-', 407000, 406300, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(632, 'MAXIS5', 'MAXIS5', 'MAXIS', 'Maxis 5', 'Maxis 5', 20875, 20175, 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'Umum'),
(633, 'MAXIS10', 'MAXIS10', 'MAXIS', 'Maxis 10', 'Maxis 10', 40750, 40050, 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'Umum'),
(634, 'MAXIS20', 'MAXIS20', 'MAXIS', 'Maxis 20', 'Maxis 20', 80500, 79800, 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'Umum'),
(635, 'MPMAXIS50', 'MPMAXIS50', 'MAXIS', 'Maxis 50', 'Maxis 50', 199750, 199050, 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'Umum'),
(636, 'MPAOV40', 'MPAOV40', 'ARENA OF VALOR', 'AOV 40 Vouchers', 'AOV 40 Vouchers', 10550, 9850, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(637, 'MPAOV90', 'MPAOV90', 'ARENA OF VALOR', 'AOV 90 Vouchers', 'AOV 90 Vouchers', 19999, 19299, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(638, 'MPAOV230', 'MPAOV230', 'ARENA OF VALOR', 'AOV 230 Vouchers', 'AOV 230 Vouchers', 49400, 48700, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(639, 'MPAOV470', 'MPAOV470', 'ARENA OF VALOR', 'AOV 470 Vouchers', 'AOV 470 Vouchers', 97400, 96700, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(640, 'BULK1', 'BULK1', 'TELKOMSEL', 'Voucher Telkomsel Data 1 GB / 5 Hari', '1GB, 5 HARI. perhatikan zona dan regional.', 16999, 16299, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(641, 'BULK', 'BULK', 'TELKOMSEL', 'Voucher Telkomsel Data 1.5 GB / 7 Hari', '1,5GB, 7 HARI. perhatikan zona dan regional.', 19200, 18500, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(642, 'ISATFREEDOM1', 'ISATFREEDOM1', 'INDOSAT', 'Voucher Indosat Freedom 10 GB / 30 Hari', 'INDOSAT DATA FREEDOM 10GB FULL 24 JAM NASIONAL, 30HARI', 48875, 48175, 'Normal', 'DG-PULSA', 'Voucher', 'Freedom Internet'),
(643, 'ISATUNLI3GB', 'ISATUNLI3GB', 'INDOSAT', 'Voucher Indosat Freedom 3 GB / 30 Hari', '*556*kode voucher# untuk aktivasi', 25325, 24625, 'Normal', 'DG-PULSA', 'Voucher', 'Freedom Internet'),
(644, 'ISATFREEDOM18', 'ISATFREEDOM18', 'INDOSAT', 'Voucher Indosat Freedom 18 GB / 30 Hari', 'INDOSAT DATA FREEDOM 18GB FULL 24 JAM NASIONAL, 30HARI', 67000, 66300, 'Normal', 'DG-PULSA', 'Voucher', 'Freedom Internet'),
(645, 'MPAIGO1', 'MPAIGO1', 'AXIS', 'Voucher AIGO 1 GB / 30 Hari', '1 GB All Jaringan Berlaku 24 Jam Masa Aktif 30 Hari', 13810, 13110, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(646, 'MPAIGO2', 'MPAIGO2', 'AXIS', 'Voucher AIGO 2 GB / 30 Hari', '2 GB All Jaringan Berlaku 24 Jam Masa Aktif 30 Hari. Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 24300, 23600, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(647, 'MPAIGO3', 'MPAIGO3', 'AXIS', 'Voucher AIGO 3 GB / 30 Hari', '3 GB All Jaringan Berlaku 24 Jam Masa Aktif 30 Hari. Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 28980, 28280, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(648, 'MPAIGO5', 'MPAIGO5', 'AXIS', 'Voucher AIGO 5 GB / 30 Hari', '5 GB All Jaringan Berlaku 24 Jam Masa Aktif 30 Hari. Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 42825, 42125, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(649, 'MPAIGO25', 'MPAIGO25', 'AXIS', 'Voucher AIGO 25 GB / 60 Hari', '25 GB All Jaringan Berlaku 24 Jam Masa Aktif 60 Hari. Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 87500, 86800, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(650, 'AIGOMINI1', 'AIGOMINI1', 'AXIS', 'Voucher Axis Data Mini 1 GB / 5 Hari', 'Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 8655, 7955, 'Normal', 'DG-PULSA', 'Voucher', 'Mini'),
(651, 'AIGOMINI2', 'AIGOMINI2', 'AXIS', 'Voucher Axis Data Mini 2 GB / 7 Hari', 'Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 15560, 14860, 'Normal', 'DG-PULSA', 'Voucher', 'Mini'),
(652, 'MPAON10', 'MPAON10', 'TRI', 'Voucher AlwaysOn 10 GB + Unlimited', '10 GB Nasional, Mengikuti Masa Aktif Kartu, Unlimited 30 hari lokal', 81000, 80300, 'Normal', 'DG-PULSA', 'Voucher', 'AlwaysOn'),
(653, 'MPAON1', 'MPAON1', 'TRI', 'Voucher Tri AON 1 GB + 1 GB / 30 Hari', 'Jangan lupa input *111*SN# agar customer mendapatkan paket data sesuai', 17000, 16300, 'Normal', 'DG-PULSA', 'Voucher', 'AlwaysOn'),
(654, 'MPAON2', 'MPAON2', 'TRI', 'Voucher Tri AON 2 GB + 3 GB / 30 Hari', 'Jangan lupa input *111*SN# agar customer mendapatkan paket data sesuai', 28000, 27300, 'Normal', 'DG-PULSA', 'Voucher', 'AlwaysOn'),
(655, 'MPAON5', 'MPAON5', 'TRI', 'Voucher Tri AON 5 GB + 8 GB / 30 Hari', 'Jangan lupa input *111*SN# agar customer mendapatkan paket data sesuai', 76800, 76100, 'Normal', 'DG-PULSA', 'Voucher', 'AlwaysOn'),
(656, 'MPAON3', 'MPAON3', 'TRI', 'Voucher Tri AON 3 GB + 6 GB / 30 Hari', 'Jangan lupa input *111*SN# agar customer mendapatkan paket data sesuai', 58050, 57350, 'Normal', 'DG-PULSA', 'Voucher', 'AlwaysOn'),
(657, 'MPAON6', 'MPAON6', 'TRI', 'Voucher Tri AON 6 GB + 12 GB / 30 Hari', 'Jangan lupa input *111*SN# agar customer mendapatkan paket data sesuai', 88100, 87400, 'Normal', 'DG-PULSA', 'Voucher', 'AlwaysOn'),
(658, 'MPVOCTRI1', 'MPVOCTRI1', 'TRI', 'Voucher Tri 1 GB + 500 MB All Net / 30 Hari', 'Claim Voucher dengan cara *111*SN#', 14450, 13750, 'Normal', 'DG-PULSA', 'Voucher', 'Umum'),
(659, 'MPVOCTRI6', 'MPVOCTRI6', 'TRI', 'Voucher Tri 6 GB + Unlimited / 30 Hari', 'Unlimited pada jam 01.00 - 17.00, Claim Voucher dengan cara *111*SN#', 66000, 65300, 'Normal', 'DG-PULSA', 'Voucher', 'Unlimited'),
(660, 'XLCOMBO3', 'XLCOMBO3', 'XL', 'Voucher XL Combo Lite M', 'deskripsi produk cek di link https://www.xl.co.id/id/bantuan/produk/xtra-combo-lite', 28225, 27525, 'Normal', 'DG-PULSA', 'Voucher', 'Combo Lite'),
(661, 'XLCOMBO6', 'XLCOMBO6', 'XL', 'Voucher XL Combo Lite L', 'deskripsi produk cek di link https://www.xl.co.id/id/bantuan/produk/xtra-combo-lite', 39320, 38620, 'Normal', 'DG-PULSA', 'Voucher', 'Combo Lite'),
(662, 'XLCOMBO11', 'XLCOMBO11', 'XL', 'Voucher XL Combo Lite XL', 'deskripsi produk cek di link https://www.xl.co.id/id/bantuan/produk/xtra-combo-lite', 62820, 62120, 'Normal', 'DG-PULSA', 'Voucher', 'Combo Lite'),
(663, 'LCOMBO31', 'LCOMBO31', 'XL', 'Voucher XL Combo Lite XXXL', 'deskripsi produk cek di link https://www.xl.co.id/id/bantuan/produk/xtra-combo-lite', 120000, 119300, 'Normal', 'DG-PULSA', 'Voucher', 'Combo Lite'),
(664, 'COMBO21', 'COMBO21', 'XL', 'Voucher XL Combo Lite XXL', 'deskripsi produk cek di link https://www.xl.co.id/id/bantuan/produk/xtra-combo-lite', 98800, 98100, 'Normal', 'DG-PULSA', 'Voucher', 'Combo Lite'),
(665, 'PB1200', 'PB1200', 'POINT BLANK', '1200 PB Cash', '1200 Point Blank Cash', 10425, 9725, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(666, 'PB2400', 'PB2400', 'POINT BLANK', '2400 PB Cash', '2400 PB Cash', 19650, 18950, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(667, 'PB6000', 'PB6000', 'POINT BLANK', '6000 PB Cash', '6000 PB Cash', 48350, 47650, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(668, 'PB12000', 'PB12000', 'POINT BLANK', '12000 PB Cash', '12000 PB Cash', 94450, 93750, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(669, 'MPBYU25', 'MPBYU25', 'by.U', 'by.U 25.000', 'pulsa by.U Rp 25.000', 26110, 25410, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(670, 'MPBYU5', 'MPBYU5', 'by.U', 'by.U 5.000', 'pulsa by.U Rp 5.000', 6665, 5965, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(671, 'MPBYU10', 'MPBYU10', 'by.U', 'by.U 10.000', 'pulsa by.U Rp 10.000', 11625, 10925, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(672, 'MPBYU20', 'MPBYU20', 'by.U', 'by.U 20.000', 'pulsa by.U Rp 20.000', 21050, 20350, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(673, 'MPBYU50', 'MPBYU50', 'by.U', 'by.U 50.000', 'pulsa by.U Rp 50.000', 51525, 50825, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(674, 'MPBYU100', 'MPBYU100', 'by.U', 'by.U 100.000', 'pulsa by.U Rp 100.000', 99100, 98400, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(675, 'MPPUBG50', 'MPPUBG50', 'PUBG MOBILE', 'PUBG MOBILE 50 UC', 'PUBG MOBILE 50 UC', 11200, 10500, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(676, 'MPPUBG150', 'MPPUBG150', 'PUBG MOBILE', 'PUBG MOBILE 150 UC', 'PUBG MOBILE 150 UC', 31600, 30900, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(677, 'MPPUBG250', 'MPPUBG250', 'PUBG MOBILE', 'PUBG MOBILE 250 UC', 'PUBG MOBILE 250 UC', 51600, 50900, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(678, 'MPPUBG500', 'MPPUBG500', 'PUBG MOBILE', 'PUBG MOBILE 500 UC', 'PUBG MOBILE 500 UC', 101600, 100900, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(679, 'MPPUBG125', 'MPPUBG125', 'PUBG MOBILE', 'PUBG MOBILE 125 UC', 'PUBG MOBILE 125 UC', 25055, 24355, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(680, 'MPPUBG2500', 'MPPUBG2500', 'PUBG MOBILE', 'PUBG MOBILE 2500 UC', 'PUBG MOBILE 2500 UC', 502100, 501400, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(681, 'MPPUBG100', 'MPPUBG100', 'PUBG MOBILE', 'PUBG MOBILE 100 UC', 'PUBG MOBILE 100 UC', 22500, 21800, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(682, 'MPPUBG600', 'MPPUBG600', 'PUBG MOBILE', 'PUBG MOBILE 600 UC', 'PUBG MOBILE 600 UC', 124000, 123300, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(683, 'MPPUBG700', 'MPPUBG700', 'PUBG MOBILE', 'PUBG MOBILE 700 UC', 'PUBG MOBILE 700 UC', 137600, 136900, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(684, 'MPPUBG800', 'MPPUBG800', 'PUBG MOBILE', 'PUBG MOBILE 800 UC', 'PUBG MOBILE 800 UC', 173000, 172300, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(685, 'MPPUBG3500', 'MPPUBG3500', 'PUBG MOBILE', 'PUBG MOBILE 3500 UC', 'PUBG MOBILE 3500 UC', 674600, 673900, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(686, 'MPPUNG1800', 'MPPUNG1800', 'PUBG MOBILE', 'PUBG MOBILE 1800 UC', 'PUBG MOBILE 1800 UC', 352000, 351300, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(687, 'TSEL2', 'TSEL2', 'TELKOMSEL', 'Telkomsel 2.000', 'Pulsa Telkomsel Rp 2.000', 3510, 2810, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(688, 'HAGO375', 'HAGO375', 'HAGO', 'Hago 375 Diamonds', 'Masukkan Player ID Hago Anda', 126025, 125325, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(689, 'HAGO90', 'HAGO90', 'HAGO', 'Hago 90 Diamonds', 'Masukkan Player ID Hago Anda', 31025, 30325, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(690, 'HAGO6', 'HAGO6', 'HAGO', 'Hago 6 Diamonds', 'Masukkan Player ID Hago Anda', 3505, 2805, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(691, 'HAGO45', 'HAGO45', 'HAGO', 'Hago 45 Diamonds', 'Masukkan Player ID Hago Anda', 16010, 15310, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(692, 'HAGO900', 'HAGO900', 'HAGO', 'Hago 900 Diamonds', 'Masukkan Player ID Hago Anda', 301025, 300325, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(693, 'MPFREDOML', 'MPFREDOML', 'INDOSAT', 'Indosat Freedom L', 'Kuota Dasar 4GB (2G/3G/4G) + Bonus 8GB (4G) + Kuota Aplikasi 2GB + 10GB kuota malam, Unlimited nelpon ke sesama Operator Indosat. Masa aktif 30 hari.', 101500, 100800, 'Normal', 'DG-PULSA', 'Data', 'Freedom Internet'),
(694, 'MPFREDOMXL', 'MPFREDOMXL', 'INDOSAT', 'Indosat Freedom XL', 'Kuota Dasar 8GB (2G/3G/4G) + Bonus 12GB (4G) + Kuota Aplikasi 6GB + 15GB kuota malam, Unlimited nelpon ke sesama Operator Indosat. Masa aktif 30 hari.', 113700, 113000, 'Normal', 'DG-PULSA', 'Data', 'Freedom Internet'),
(695, 'MPFREDOMXXL', 'MPFREDOMXXL', 'INDOSAT', 'Indosat Freedom XXL', 'Kuota Dasar 12GB (2G/3G/4G) + Bonus 25GB (4G) + Kuota Aplikasi 8GB + 20GB kuota malam, Unlimited nelpon ke sesama Operator Indosat. Masa aktif 30 hari.', 145200, 144500, 'Normal', 'DG-PULSA', 'Data', 'Freedom Internet'),
(696, 'MPHAJI20', 'MPHAJI20', 'INDOSAT', 'Indosat Haji Data Unlimited 20 hari.', 'Paket Haji Data Unlimited Berlaku untuk 20 hari.', 334100, 333400, 'Normal', 'DG-PULSA', 'Data', 'Haji'),
(697, 'MPUNLI2', 'MPUNLI2', 'INDOSAT', 'Indosat Freedom U 2 GB + 7.5 GB Apps / 30 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 38075, 37375, 'Normal', 'DG-PULSA', 'Data', 'Freedom U'),
(698, 'MPUNLI1', 'MPUNLI1', 'INDOSAT', 'Indosat Freedom U 1 GB + 4.5 GB Apps / 30 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 25100, 24400, 'Normal', 'DG-PULSA', 'Data', 'Freedom U'),
(699, 'MPUNLI7', 'MPUNLI7', 'INDOSAT', 'Indosat Freedom U 7 GB + 20 GB Apps / 30 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 74750, 74050, 'Normal', 'DG-PULSA', 'Data', 'Freedom U'),
(700, 'MPUNLI3', 'MPUNLI3', 'INDOSAT', 'Indosat Freedom U 3 GB + 15 GB Apps / 30 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 58500, 57800, 'Normal', 'DG-PULSA', 'Data', 'Freedom U'),
(701, 'MPUNLI10', 'MPUNLI10', 'INDOSAT', 'Indosat Freedom U 10 GB + 25 GB Apps / 30 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 93725, 93025, 'Normal', 'DG-PULSA', 'Data', 'Freedom U'),
(702, 'MPUNLI15', 'MPUNLI15', 'INDOSAT', 'Indosat Freedom U 15 GB + 25 GB Apps / 30 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 123600, 122900, 'Normal', 'DG-PULSA', 'Data', 'Freedom U'),
(703, 'IUNLI', 'IUNLI', 'INDOSAT', 'Indosat Unlimited JUMBO / 30 Hari', 'Kuota Utama JUMBO + Unlimited Aplikasi sehari-hari + Unlimited Streaming Spotify dan iFlix + 100 SMS ke Semua Operator + Unlimited Nelpon + SMS ke Indosat + Unlimited Youtube', 144000, 143300, 'Normal', 'DG-PULSA', 'Data', 'Unlimited'),
(704, 'IUNLI36', 'IUNLI36', 'INDOSAT', 'Indosat Internet Unlimited + 36GB, 12 bulan', 'Kuota Utama 3GB/bulan(3G/4G) 24 Jam + Unlimited Aplikasi sehari-hari + Unlimited Streaming Youtube, Spotify, dan iFlix + Unlimited SMS ke IM3 Ooredoo Masa Aktif 12 bulan', 442018, 441318, 'Normal', 'DG-PULSA', 'Data', 'Unlimited'),
(705, 'IFREDOM8', 'IFREDOM8', 'INDOSAT', 'Indosat Freedom Combo 8 GB / 30 Hari', '8GB (4GB + 2GB Lokal, 2 GB Malam, Telepon 20 Mnt All 30hr) Paket hanya berlaku di area Jakarta, Botabek, West Java, Central Java, East Java, Kalimantan.', 32725, 32025, 'Normal', 'DG-PULSA', 'Data', 'Freedom Combo'),
(706, 'IFREDOM14', 'IFREDOM14', 'INDOSAT', 'Indosat Freedom Combo 14 GB / 30 Hari', '14GB (7.5GB + 3.5GB Lokal, 3GB Mlm, Telepon 30 Mnt ALL 30hr) Paket hanya berlaku di area Jakarta, Botabek, West Java, Central Java, East Java, Kalimantan.', 47025, 46325, 'Normal', 'DG-PULSA', 'Data', 'Freedom Combo'),
(707, 'IFREDOM20', 'IFREDOM20', 'INDOSAT', 'Indosat Freedom Combo 20 GB / 30 Hari', '20GB (11GB + 5GB Lokal, 4GB Mlm,Telepon 40 Mnt All 30hr) Paket hanya berlaku di area Jakarta, Botabek, West Java, Central Java, East Java, Kalimantan.', 64925, 64225, 'Gangguan', 'DG-PULSA', 'Data', 'Freedom Combo'),
(708, 'MPFREEDOM50', 'MPFREEDOM50', 'INDOSAT', 'Indosat Freedom Combo 50 GB / 30 Hari', '50GB (25GB + 15GB Lokal, 10GB Mlm, Telepon 60 Mnt All 30hr) Paket hanya berlaku di area Jakarta, Botabek, West Java, Central Java, East Java, Kalimantan.', 136000, 135300, 'Normal', 'DG-PULSA', 'Data', 'Freedom Combo'),
(709, 'MPXTON15', 'MPXTON15', 'XL', 'XL XTRA ON 1GB', 'Paket anti hangus, berlaku akumulasi, masa aktif paket unlimited. Bisa menambah masa aktif kartu 14 hari. Semua jaringan.', 15200, 14500, 'Normal', 'DG-PULSA', 'Data', 'Xtra On'),
(710, 'MPXTON2', 'MPXTON2', 'XL', 'XL XTRA ON 2GB', 'Paket anti hangus, berlaku akumulasi, masa aktif paket unlimited. Bisa menambah masa aktif kartu 14 hari. Semua jaringan.', 24600, 23900, 'Normal', 'DG-PULSA', 'Data', 'Xtra On'),
(711, 'MPXLMINI1', 'MPXLMINI1', 'XL', 'XL Data Mini 1 GB / 7 Hari', '1GB NASIONAL SEMUA JARINGAN, 7 HARI', 10575, 9875, 'Normal', 'DG-PULSA', 'Data', 'Mini'),
(712, 'MPHOTROD800', 'MPHOTROD800', 'XL', 'XL HOTROD 800 MB / 30 Hari', '-', 30225, 29525, 'Normal', 'DG-PULSA', 'Data', 'Hotrod'),
(713, 'MPHOTROD16', 'MPHOTROD16', 'XL', 'XL HOTROD 16 GB / 30 Hari', '-', 197275, 196575, 'Normal', 'DG-PULSA', 'Data', 'Hotrod'),
(714, 'MPHOTROD12', 'MPHOTROD12', 'XL', 'XL HOTROD 12 GB / 30 Hari', '-', 145000, 144300, 'Normal', 'DG-PULSA', 'Data', 'Hotrod'),
(715, 'MPCOMBO15', 'MPCOMBO15', 'XL', 'XL Xtra Combo 15 GB + 30 GB / 30 Hari', '15GB (2G/3G/4G) + Nelp Anynet 40 mins. Youtube 24 Jam 30GB. Youtube 01:00-06:00 Tanpa kuota Unlimited.', 115025, 114325, 'Normal', 'DG-PULSA', 'Data', 'Xtra Combo'),
(716, 'DANA80', 'DANA80', 'DANA', 'DANA 80.000', '-', 81225, 80525, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(717, 'MPDOMINO1', 'MPDOMINO1', 'BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 260M Koin', 'DOMINO QIUQIU 260M Koin', 5850, 5150, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(718, 'MPDOMINO2', 'MPDOMINO2', 'BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 286M Koin', 'DOMINO QIUQIU 286M Koin', 6335, 5635, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(719, 'SMART12GB', 'SMART12GB', 'SMART', 'Smart 12 GB Kuota Malam / 30 Hari', 'Hanya kuota malam', 21210, 20510, 'Normal', 'DG-PULSA', 'Data', 'Umum'),
(720, 'SMART8GB', 'SMART8GB', 'SMART', 'Smart 8 GB / 14 Hari', '4GB Regular + 4GB Malam', 26500, 25800, 'Normal', 'DG-PULSA', 'Data', 'Umum'),
(721, 'SMART30GB', 'SMART30GB', 'SMART', 'Smart 30 GB / 30 Hari', '15GB Regular + 15GB Malam', 54600, 53900, 'Normal', 'DG-PULSA', 'Data', 'Umum'),
(722, 'TFTSEL20', 'TFTSEL20', 'TELKOMSEL', 'Telkomsel Pulsa Transfer 20.000', 'Pulsa Telkomsel Rp 20.000 ( Tidak menambah masa aktif)', 21025, 20325, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(723, 'TFTSEL25', 'TFTSEL25', 'TELKOMSEL', 'Telkomsel Pulsa Transfer 25.000', 'Pulsa Telkomsel Rp 25.000 ( Tidak menambah masa aktif)', 24750, 24050, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(724, 'TFTSEL30', 'TFTSEL30', 'TELKOMSEL', 'Telkomsel Pulsa Transfer 30.000', 'Pulsa Telkomsel Rp 30.000 ( Tidak menambah masa aktif)', 27800, 27100, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer');
INSERT INTO `layanan_pulsa` (`id`, `service_id`, `provider_id`, `operator`, `layanan`, `deskripsi`, `harga`, `harga_api`, `status`, `provider`, `tipe`, `kategori`) VALUES
(725, 'TFTSEL35', 'TFTSEL35', 'TELKOMSEL', 'Telkomsel Pulsa Transfer 35.000', 'Pulsa Telkomsel Rp 35.000 ( Tidak menambah masa aktif)', 31763, 31063, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(726, 'MPTFTSEL40', 'MPTFTSEL40', 'TELKOMSEL', 'Telkomsel Pulsa Transfer 40.000', 'Pulsa Telkomsel Rp 40.000 ( Tidak menambah masa aktif)', 40150, 39450, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(727, 'MPTFTSEL50', 'MPTFTSEL50', 'TELKOMSEL', 'Telkomsel Pulsa Transfer 50.000', 'Pulsa Telkomsel Rp 50.000 ( Tidak menambah masa aktif)', 44750, 44050, 'Gangguan', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(728, 'TFTSEL70', 'TFTSEL70', 'TELKOMSEL', 'Telkomsel Pulsa Transfer 70.000', 'Pulsa Telkomsel Rp 70.000 ( Tidak menambah masa aktif)', 60095, 59395, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(729, 'TFTSEL75', 'TFTSEL75', 'TELKOMSEL', 'Telkomsel Pulsa Transfer 75.000', 'Pulsa Telkomsel Rp 75.000 ( Tidak menambah masa aktif)', 72700, 72000, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(730, 'TFTSEL80', 'TFTSEL80', 'TELKOMSEL', 'Telkomsel Pulsa Transfer 80.000', 'Pulsa Telkomsel Rp 80.000 ( Tidak menambah masa aktif)', 77050, 76350, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(731, 'MPTFTSEL100', 'MPTFTSEL100', 'TELKOMSEL', 'Telkomsel Pulsa Transfer 100.000', 'Pulsa Telkomsel Rp 100.000 ( Tidak menambah masa aktif)', 95500, 94800, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(732, 'BRONET500', 'BRONET500', 'AXIS', 'BRONET 500 MB / 1 Hari', 'Kuota 500 MB, Masa aktif 1 Hari, 24 Jam', 11000, 10300, 'Normal', 'DG-PULSA', 'Data', 'Bronet'),
(733, 'BRONET1GB', 'BRONET1GB', 'AXIS', 'BRONET 1 GB / 30 Hari', '24 jam', 15010, 14310, 'Normal', 'DG-PULSA', 'Data', 'Bronet'),
(734, 'BRONET2GB', 'BRONET2GB', 'AXIS', 'BRONET 2 GB / 30 Hari', '24 jam', 24610, 23910, 'Normal', 'DG-PULSA', 'Data', 'Bronet'),
(735, 'BRONET3GB', 'BRONET3GB', 'AXIS', 'BRONET 3 GB / 30 Hari', 'Kuota 3GB. 24 Jam', 24225, 23525, 'Normal', 'DG-PULSA', 'Data', 'Bronet'),
(736, 'BRONET5GB', 'BRONET5GB', 'AXIS', 'BRONET 5 GB / 30 Hari', 'Kuota 5GB. 24 Jam', 44175, 43475, 'Normal', 'DG-PULSA', 'Data', 'Bronet'),
(737, 'BRONET8GB', 'BRONET8GB', 'AXIS', 'BRONET 8 GB / 30 Hari', 'Kuota 8 GB, Masa Aktif 30 Hari, 24 Jam', 58725, 58025, 'Normal', 'DG-PULSA', 'Data', 'Bronet'),
(738, 'OWSEM1G1', 'OWSEM1G1', 'AXIS', 'OWSEM 1 GB + 1 GB 4G / 30 Hari', 'BRONET 4G OWSEM 1GB+1GB(4G)+2GB Aplikasi, 24 jam 30HR', 18110, 17410, 'Normal', 'DG-PULSA', 'Data', 'Owsem'),
(739, 'OWSEM1G3', 'OWSEM1G3', 'AXIS', 'OWSEM 1 GB + 3 GB 4G / 30 Hari', 'BRONET 4G OWSEM 1GB+3GB(4G)+4GB Aplikasi, 24 jam 30HR', 29825, 29125, 'Normal', 'DG-PULSA', 'Data', 'Owsem'),
(740, 'OWSEM2G6', 'OWSEM2G6', 'AXIS', 'OWSEM 2 GB + 6 GB 4G / 30 Hari', 'BRONET 4G OWSEM 2GB+6GB(4G)+8GB Aplikasi, 24 jam 30HR', 46675, 45975, 'Normal', 'DG-PULSA', 'Data', 'Owsem'),
(741, 'OWSEM16GB', 'OWSEM16GB', 'AXIS', 'Axis OWSEM 16 GB + Unlimited Games / 30 Hari', 'Kuota Internet 24jam 2Gb + Kuota Sosmed 4Gb (FB, Twitter, IG, Tiktok) + Kuota Musik 4Gb (Joox, Smule) + 6Gb Kuota Malam 00-06 + Kuota Games Unlimited 1Gb /day (FreeFire, Mobile Legends, AOV, ASPHALT Legends, Vain Glory, Modern Combat 5)', 41700, 41000, 'Normal', 'DG-PULSA', 'Data', 'Owsem'),
(742, 'OWSEM24GB', 'OWSEM24GB', 'AXIS', 'Axis OWSEM 24 GB + Unlimited Games / 30 Hari', 'Kuota Internet 24jam 3Gb + Kuota Sosmed 6Gb (FB, Twitter, IG, Tiktok) + Kuota Musik 6Gb (Joox, Smule) +  9Gb Kuota Malam 00-06 + Kuota Games Unlimited 1Gb /day (FreeFire, Mobile Legends, AOV, ASPHALT Legends, Vain Glory, Modern Combat 5)', 43025, 42325, 'Normal', 'DG-PULSA', 'Data', 'Owsem'),
(743, 'YGTSELVSC', 'YGTSELVSC', 'TELKOMSEL', 'Telkomsel GamesMAX Unlimited Play Silver LINE Letâ€™s Get Rich', 'cek di website https://www.telkomsel.com/en/gamesmaxunlimitedplay', 25510, 24810, 'Normal', 'DG-PULSA', 'Data', 'GamesMAX Unlimited Play'),
(744, 'GTSELAOV', 'GTSELAOV', 'TELKOMSEL', 'Telkomsel GamesMAX Unlimited Play Silver Arena of Valor', 'cek di website https://www.telkomsel.com/en/gamesmaxunlimitedplay', 25510, 24810, 'Normal', 'DG-PULSA', 'Data', 'GamesMAX Unlimited Play'),
(745, 'GTSELVML', 'GTSELVML', 'TELKOMSEL', 'Telkomsel GamesMAX Unlimited Play Silver Mobile Legends', 'cek di website https://www.telkomsel.com/en/gamesmaxunlimitedplay', 25510, 24810, 'Normal', 'DG-PULSA', 'Data', 'GamesMAX Unlimited Play'),
(746, 'GTSELGP', 'GTSELGP', 'TELKOMSEL', 'Telkomsel GamesMAX Unlimited Play Silver Google Play', 'cek di website https://www.telkomsel.com/en/gamesmaxunlimitedplay', 25510, 24810, 'Normal', 'DG-PULSA', 'Data', 'GamesMAX Unlimited Play'),
(747, 'GTSELVF', 'GTSELVF', 'TELKOMSEL', 'Telkomsel GamesMAX Unlimited Play Silver Free Fire', 'cek di website https://www.telkomsel.com/en/gamesmaxunlimitedplay', 25510, 24810, 'Normal', 'DG-PULSA', 'Data', 'GamesMAX Unlimited Play'),
(748, 'ML875', 'ML875', 'MOBILE LEGEND', 'MOBILELEGEND - 875 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 243880, 243180, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(749, 'IFREDOM30', 'IFREDOM30', 'INDOSAT', 'Indosat Freedom Combo 30 GB / 30 Hari', '30GB (16GB + 8GB Lokal, 6 GB Mlm, Telepon 60 Mnt All 30hr) Paket hanya berlaku di area Jakarta, Botabek, West Java, Central Java, East Java, Kalimantan.', 93600, 92900, 'Normal', 'DG-PULSA', 'Data', 'Freedom Combo'),
(750, 'IFREDOM4', 'IFREDOM4', 'INDOSAT', 'Indosat Freedom Combo 4 GB / 30 Hari', '4GB (2GB + 1GB Lokal, 1 GB Malam,Telepon 5 Mnt All 30hr) Paket hanya berlaku di area Jakarta, Botabek, West Java, Central Java, East Java, Kalimantan.', 25000, 24300, 'Normal', 'DG-PULSA', 'Data', 'Freedom Combo'),
(751, 'ML30', 'ML30', 'MOBILE LEGEND', 'MOBILELEGEND - 30 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 9955, 9255, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(752, 'ML33', 'ML33', 'MOBILE LEGEND', 'MOBILELEGEND - 33 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 10705, 10005, 'Normal', 'DG-PULSA', 'Games', 'Umum'),
(753, 'CHINA30', 'CHINA30', 'CHINA TOPUP', 'China 30', 'China 30', 101000, 100300, 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'Umum'),
(754, 'CHINA50', 'CHINA50', 'CHINA TOPUP', 'China 50', 'China 50', 151000, 150300, 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'Umum'),
(755, 'CHINA100', 'CHINA100', 'CHINA TOPUP', 'China 100', 'China 100', 301000, 300300, 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'Umum'),
(756, 'PINOY4', 'PINOY4', 'SMART PINOY', 'SMART PINOY 4', 'SMART PINOY 4', 41950, 41250, 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'Umum'),
(757, 'PINOY8', 'PINOY8', 'SMART PINOY', 'SMART PINOY 8', 'SMART PINOY 8', 82900, 82200, 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'Umum'),
(758, 'PINOY12', 'PINOY12', 'SMART PINOY', 'SMART PINOY 12', 'SMART PINOY 12', 123850, 123150, 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'Umum'),
(759, 'PINOY5', 'PINOY5', 'SMART PINOY', 'SMART PINOY 5', 'SMART PINOY 5', 52188, 51488, 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'Umum'),
(760, 'GOPAY15', 'GOPAY15', 'GO PAY', 'Go Pay 15.000', 'Masukan no HP', 16600, 15900, 'Normal', 'DG-PULSA', 'E-Money', 'Customer'),
(761, 'DANA15', 'DANA15', 'DANA', 'DANA 15.000', '-', 16040, 15340, 'Normal', 'DG-PULSA', 'E-Money', 'Umum'),
(762, 'DRIVER10', 'DRIVER10', 'GO PAY', 'Go Pay Driver 10.000', 'KHUSUS DRIVER - Masukan no HP', 11100, 10400, 'Normal', 'DG-PULSA', 'E-Money', 'Driver'),
(763, 'TFISAT10', 'TFISAT10', 'INDOSAT', 'Indosat Pulsa Transfer 10.000', 'Pulsa Indosat Transfer 10.000 + Masa Aktif 3 Hari', 11470, 10770, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(764, 'TFISAT15', 'TFISAT15', 'INDOSAT', 'Indosat Pulsa Transfer 15.000', 'Pulsa Indosat Transfer 15.000 + Masa Aktif 7 Hari', 16150, 15450, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(765, 'TFISAT25', 'TFISAT25', 'INDOSAT', 'Indosat Pulsa Transfer 25.000', 'Pulsa Indosat Transfer 25.000 + Masa Aktif 15 Hari', 25500, 24800, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(766, 'TFISAT30', 'TFISAT30', 'INDOSAT', 'Indosat Pulsa Transfer 30.000', 'Pulsa Indosat Transfer 30.000 + Masa Aktif 15 Hari', 30650, 29950, 'Gangguan', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(767, 'TFISAT50', 'TFISAT50', 'INDOSAT', 'Indosat Pulsa Transfer 50.000', 'Pulsa Indosat Transfer 50.000 + Masa Aktif 22 Hari', 49100, 48400, 'Gangguan', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(768, 'TFISAT60', 'TFISAT60', 'INDOSAT', 'Indosat Pulsa Transfer 60.000', 'Pulsa Indosat Transfer 60.000 + Masa Aktif 22 Hari', 59350, 58650, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(769, 'TFISAT70', 'TFISAT70', 'INDOSAT', 'Indosat Pulsa Transfer 70.000', 'Pulsa Indosat Transfer 70.000 + Masa Aktif 22 Hari', 69150, 68450, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(770, 'TFISAT90', 'TFISAT90', 'INDOSAT', 'Indosat Pulsa Transfer 90.000', 'Pulsa Indosat Transfer 90.000 + Masa Aktif 22 Hari', 88400, 87700, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(771, 'TFISAT100', 'TFISAT100', 'INDOSAT', 'Indosat Pulsa Transfer 100.000', 'Pulsa Indosat Transfer 100.000 + Masa Aktif 30 Hari', 96900, 96200, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(772, 'TFISAT150', 'TFISAT150', 'INDOSAT', 'Indosat Pulsa Transfer 150.000', 'Pulsa Indosat Transfer 150.000 + Masa Aktif 30 Hari', 145200, 144500, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(773, 'MPTFISAT200', 'MPTFISAT200', 'INDOSAT', 'Indosat Pulsa Transfer 200.000', 'Pulsa Indosat Transfer 200.000 + Masa Aktif 45 Hari', 192900, 192200, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(774, 'MPTFAXIS5', 'MPTFAXIS5', 'AXIS', 'Axis Pulsa Transfer 5.000', '-', 6675, 5975, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(775, 'MPTFAXIS10', 'MPTFAXIS10', 'AXIS', 'Axis Pulsa Transfer 10.000', '-', 11375, 10675, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(776, 'MPTFAXIS15', 'MPTFAXIS15', 'AXIS', 'Axis Pulsa Transfer 15.000', '-', 16010, 15310, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(777, 'MPTFAXIS20', 'MPTFAXIS20', 'AXIS', 'Axis Pulsa Transfer 20.000', '-', 20500, 19800, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(778, 'MPTFAXIS60', 'MPTFAXIS60', 'AXIS', 'Axis Pulsa Transfer 60.000', '-', 59300, 58600, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(779, 'MPTFAXIS75', 'MPTFAXIS75', 'AXIS', 'Axis Pulsa Transfer 75.000', '-', 72500, 71800, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(780, 'MPTFAXIS100', 'MPTFAXIS100', 'AXIS', 'Axis Pulsa Transfer 100.000', '-', 100325, 99625, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(781, 'TFTRI5', 'TFTRI5', 'TRI', 'Three Pulsa Transfer 5.000', '-', 6110, 5410, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(782, 'TFTRI10', 'TFTRI10', 'TRI', 'Three Pulsa Transfer 10.000', '-', 10750, 10050, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(783, 'TFTRI15', 'TFTRI15', 'TRI', 'Three Pulsa Transfer 15.000', '-', 15325, 14625, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(784, 'FTRI25', 'FTRI25', 'TRI', 'Three Pulsa Transfer 25.000', '-', 24475, 23775, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(785, 'TFTRI70', 'TFTRI70', 'TRI', 'Three Pulsa Transfer 70.000', '-', 66000, 65300, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(786, 'TFTRI50', 'TFTRI50', 'TRI', 'Three Pulsa Transfer 50.000', '-', 47550, 46850, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(787, 'MPTFTRI100', 'MPTFTRI100', 'TRI', 'Three Pulsa Transfer 100.000', '-', 86875, 86175, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(788, 'MPTFXL5', 'MPTFXL5', 'XL', 'Xl Pulsa Transfer 5.000', 'Pulsa Xl Rp 5.000 ( Tidak menambah masa aktif)', 6675, 5975, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(789, 'MPTFXL10', 'MPTFXL10', 'XL', 'Xl Pulsa Transfer 10.000', 'Pulsa Xl Rp 10.000 ( Tidak menambah masa aktif)', 11855, 11155, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(790, 'MPTFXL15', 'MPTFXL15', 'XL', 'Xl Pulsa Transfer 15.000', 'Pulsa Xl Rp 15.000 ( Tidak menambah masa aktif)', 16010, 15310, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(791, 'MPTFXL25', 'MPTFXL25', 'XL', 'Xl Pulsa Transfer 25.000', 'Pulsa Xl Rp 25.000 ( Tidak menambah masa aktif)', 25000, 24300, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(792, 'MPTFXL85', 'MPTFXL85', 'XL', 'Xl Pulsa Transfer 85.000', 'Pulsa Xl Rp 85.000 ( Tidak menambah masa aktif)', 81000, 80300, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(793, 'MPTFXL90', 'MPTFXL90', 'XL', 'Xl Pulsa Transfer 90.000', 'Pulsa Xl Rp 90.000 ( Tidak menambah masa aktif)', 85700, 85000, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(794, 'MPTFXL100', 'MPTFXL100', 'XL', 'Xl Pulsa Transfer 100.000', 'Pulsa Xl Rp 100.000 ( Tidak menambah masa aktif)', 90500, 89800, 'Normal', 'DG-PULSA', 'Pulsa', 'Pulsa Transfer'),
(795, 'MPBYU15', 'MPBYU15', 'by.U', 'by.U 15.000', 'pulsa by.U Rp 15.000', 16030, 15330, 'Normal', 'DG-PULSA', 'Pulsa', 'Umum'),
(796, 'MINI1G3', 'MINI1G3', 'TELKOMSEL', 'Telkomsel Data Mini 1 GB / 3 Hari', '24 jam', 13425, 12725, 'Normal', 'DG-PULSA', 'Data', 'Mini'),
(797, 'MINI2G3', 'MINI2G3', 'TELKOMSEL', 'Telkomsel Data Mini 2 GB / 3 Hari', '24 jam', 16425, 15725, 'Normal', 'DG-PULSA', 'Data', 'Mini'),
(798, 'MINI10G3', 'MINI10G3', 'TELKOMSEL', 'Telkomsel Data Mini 10 GB / 3 Hari', '24 jam', 37825, 37125, 'Normal', 'DG-PULSA', 'Data', 'Mini'),
(799, 'TMALAM1', 'TMALAM1', 'TELKOMSEL', 'Telkomsel Data Malam 1 GB / 1 Hari', 'Aktif pukul 00-07', 5100, 4400, 'Gangguan', 'DG-PULSA', 'Data', 'Malam'),
(800, 'TMALAM5', 'TMALAM5', 'TELKOMSEL', 'Telkomsel Data Malam 5 GB / 1 Hari', 'Aktif pukul 00-07', 8100, 7400, 'Gangguan', 'DG-PULSA', 'Data', 'Malam'),
(801, 'TMALAM10', 'TMALAM10', 'TELKOMSEL', 'Telkomsel Data Malam 10 Gb 7 Hari', 'Aktif pukul 00-07', 16000, 15300, 'Gangguan', 'DG-PULSA', 'Data', 'Malam'),
(802, 'TMALAM53', 'TMALAM53', 'TELKOMSEL', 'Telkomsel Data Malam 5 GB / 30 Hari', 'Aktif pukul 00-07', 17350, 16650, 'Gangguan', 'DG-PULSA', 'Data', 'Malam'),
(803, 'TMALAM153', 'TMALAM153', 'TELKOMSEL', 'Telkomsel Data Malam 15 GB / 30 Hari', 'Aktif pukul 00-07', 23900, 23200, 'Gangguan', 'DG-PULSA', 'Data', 'Malam'),
(804, 'TYT1G1', 'TYT1G1', 'TELKOMSEL', 'Telkomsel Paket Internet Youtube 1 GB / 1 Hari', '-', 7800, 7100, 'Gangguan', 'DG-PULSA', 'Data', 'Youtube'),
(805, 'TYT1G3', 'TYT1G3', 'TELKOMSEL', 'Telkomsel Paket Internet Youtube 1 GB / 3 Hari', '-', 11500, 10800, 'Gangguan', 'DG-PULSA', 'Data', 'Youtube'),
(806, 'TYT1G7', 'TYT1G7', 'TELKOMSEL', 'Telkomsel Paket Internet Youtube 1 GB / 7 Hari', '-', 10500, 9800, 'Gangguan', 'DG-PULSA', 'Data', 'Youtube'),
(807, 'TYT3G7', 'TYT3G7', 'TELKOMSEL', 'Telkomsel Paket Internet Youtube 3 GB / 7 Hari', '-', 14850, 14150, 'Gangguan', 'DG-PULSA', 'Data', 'Youtube'),
(808, 'TYT2G7', 'TYT2G7', 'TELKOMSEL', 'Telkomsel Paket Internet Youtube 2 GB / 7 Hari', '-', 12500, 11800, 'Gangguan', 'DG-PULSA', 'Data', 'Youtube'),
(809, 'OMG30', 'OMG30', 'TELKOMSEL', 'Telkomsel Data OMG 30.000', '3 GB + 1 GB OMG, kuota yang didapat sesuai zona, cek di *363*46#', 30900, 30200, 'Gangguan', 'DG-PULSA', 'Data', 'OMG'),
(810, 'OMG50', 'OMG50', 'TELKOMSEL', 'Telkomsel Data OMG 50.000', 'Inet+OMG Zona RP50RB (2.5GB+1GB - 5.5GB+1GB OMG 30HR), kuota yang didapat sesuai zona, cek di *363*46#', 50775, 50075, 'Gangguan', 'DG-PULSA', 'Data', 'OMG'),
(811, 'OMG75', 'OMG75', 'TELKOMSEL', 'Telkomsel Data OMG 75.000', 'Inet+OMG Zona RP75RB (3.5GB+2GB - 8.5GB+2GB OMG 30HR), kuota yang didapat sesuai zona, cek di *363*46#', 74125, 73425, 'Gangguan', 'DG-PULSA', 'Data', 'OMG'),
(812, 'OMG100', 'OMG100', 'TELKOMSEL', 'Telkomsel Data OMG 100.000', 'Inet+OMG Zona RP100RB (9.5GB+2GB - 18GB+2GB OMG 30HR), kuota yang didapat sesuai zona, cek di *363*46#', 99065, 98365, 'Gangguan', 'DG-PULSA', 'Data', 'OMG'),
(813, 'TESAJA', 'TESAJA', 'TELKOMSEL', 'Telkomsel Telepon 5.000', 'Telepon 80 menit sesama, 20 menit semua op 1 Hari (sesuai zona)', 8000, 7300, 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'Umum'),
(814, 'DANA500', 'DANA500', 'DANA', 'DANA 500.000', '-', 501065, 500365, 'Normal', 'DG-PULSA', 'E-Money', 'Umum');

-- --------------------------------------------------------

--
-- Table structure for table `layanan_sosmed`
--

CREATE TABLE `layanan_sosmed` (
  `id` int(10) NOT NULL,
  `service_id` int(10) NOT NULL,
  `kategori` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` text COLLATE utf8_swedish_ci NOT NULL,
  `catatan` text COLLATE utf8_swedish_ci NOT NULL,
  `min` int(10) NOT NULL,
  `max` int(10) NOT NULL,
  `harga` double NOT NULL,
  `harga_api` double NOT NULL,
  `status` enum('Aktif','Tidak Aktif') COLLATE utf8_swedish_ci NOT NULL,
  `provider_id` int(10) NOT NULL,
  `provider` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `tipe` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `layanan_sosmed`
--

INSERT INTO `layanan_sosmed` (`id`, `service_id`, `kategori`, `layanan`, `catatan`, `min`, `max`, `harga`, `harga_api`, `status`, `provider_id`, `provider`, `tipe`) VALUES
(863, 27, 'Youtube Likes / Comments /', ' Youtube Shares', '(INSTANT - 1500 / Day Speed)', 500, 150000, 36500, 36000, 'Aktif', 27, 'IRVANKEDE', 'Sosial Media'),
(864, 38, 'SoundCloud', 'SoundCloud Followers R1', '[FAST]', 100, 1000000, 35500, 35000, 'Aktif', 38, 'IRVANKEDE', 'Sosial Media'),
(865, 40, 'SoundCloud', ' SoundCloud Plays', '(SUPER FAST) (S1) [MULTIPLE OF 100]  Quantity = MULTIPLE OF 100 ONLY !', 20, 10000000, 3000, 2500, 'Aktif', 40, 'IRVANKEDE', 'Sosial Media'),
(866, 42, 'Pinterest', 'Pinterest Followers', '(UNLIMITED) [INSTANT]', 50, 500000, 43500, 43000, 'Aktif', 42, 'IRVANKEDE', 'Sosial Media'),
(867, 108, 'Telegram', 'Telegram Post Views', '[ Last 5 post ]', 100, 5000, 70500, 70000, 'Aktif', 108, 'IRVANKEDE', 'Sosial Media'),
(868, 128, 'Instagram Views', 'Instagram Views  [300k Per Day]', '[300k Per Day] - [INSTANT] - [Super FAST]', 100, 999000, 3400, 2900, 'Aktif', 128, 'IRVANKEDE', 'Sosial Media'),
(869, 176, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views UNLIMITED (USERNAME ONLY) (S1)', 'Instagram Story Views UNLIMITED (USERNAME ONLY) (S1)', 50, 10000000, 7000, 6500, 'Aktif', 176, 'IRVANKEDE', 'Sosial Media'),
(870, 177, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views [20k] (USERNAME ONLY) (S2)', 'Instagram Story Views [20k] (USERNAME ONLY) (S2)', 100, 20000, 11000, 10500, 'Aktif', 177, 'IRVANKEDE', 'Sosial Media'),
(871, 178, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions [20k] [INSTANT] (S1)', 'Instagram Impressions [20k] [INSTANT] (S1)', 500, 20000, 2500, 2000, 'Aktif', 178, 'IRVANKEDE', 'Sosial Media'),
(872, 266, 'Twitter Views / Impressions / Live / Comments', 'Twitter Views (INSTANT)', 'Twitter Views (INSTANT)', 100, 1000000, 25500, 25000, 'Aktif', 266, 'IRVANKEDE', 'Sosial Media'),
(873, 267, 'Twitter Views / Impressions / Live / Comments', 'Twitter Impressions (INSTANT)', 'Twitter Impressions (INSTANT)', 100, 1000000, 25500, 25000, 'Aktif', 267, 'IRVANKEDE', 'Sosial Media'),
(874, 554, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Last Story S1 - Only Username - No Refund', 'Instagram Last Story - Only Username - No Refund', 500, 10000, 4200, 3700, 'Aktif', 554, 'IRVANKEDE', 'Sosial Media'),
(875, 777, 'Website Traffic', 'Website Traffic [10M] [WW]', '  Instant Start !\\\\r\\\\n0 to 1 Hour !\\\\r\\\\nDaily Speed = 5k-10k\\\\r\\\\n100% Real People !!\\\\r\\\\nGoogle Analytics Supported\\\\r\\\\nAdSense Safe\\\\r\\\\nMin = 100', 500, 100000000, 10700, 10200, 'Aktif', 777, 'IRVANKEDE', 'Sosial Media'),
(876, 778, 'Website Traffic', 'Website Traffic From Facebook [10M] [WW]', '  Traffic From Facebook !\\\\r\\\\nInstant Start !\\\\r\\\\n0 to 1 Hour !\\\\r\\\\nDaily Speed = 5k-10k\\\\r\\\\n100% Real People !!\\\\r\\\\nGoogle Analytics Supported\\\\r\\\\nAdSense Safe\\\\r\\\\nMin = 100', 500, 1000000000, 10700, 10200, 'Aktif', 778, 'IRVANKEDE', 'Sosial Media'),
(877, 779, 'Website Traffic', 'Website Traffic From Instagram [10M] [WW] ', '  Traffic From Instagram !\\\\r\\\\nInstant Start !\\\\r\\\\n0 to 1 Hour !\\\\r\\\\nDaily Speed = 5k-10k\\\\r\\\\n100% Real People !!\\\\r\\\\nGoogle Analytics Supported\\\\r\\\\nAdSense Safe\\\\r\\\\nMin = 100', 500, 1000000000, 10700, 10200, 'Aktif', 779, 'IRVANKEDE', 'Sosial Media'),
(878, 860, 'Instagram Live Video', 'Instagram - Live Video Likes ( INSTANT )', '  Instagram - Live Video Likes ( INSTANT )', 200, 100000, 10400, 9900, 'Aktif', 860, 'IRVANKEDE', 'Sosial Media'),
(879, 863, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions [1M] REAL', 'Instagram Impressions [1M] ', 100, 10000000, 2800, 2300, 'Aktif', 863, 'IRVANKEDE', 'Sosial Media'),
(880, 864, 'Instagram Likes / Likes + Impressions', 'Instagram Impressions [100K] ', '  Instagram Impressions [100K] ', 10, 1000000, 5050, 4550, 'Aktif', 864, 'IRVANKEDE', 'Sosial Media'),
(881, 878, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views [15K] [ALL POSTS]', 'Instant Start\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\n30k / Day Speed !\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\nMin 100', 50, 15000, 1670, 1170, 'Aktif', 878, 'IRVANKEDE', 'Sosial Media'),
(882, 881, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views [MALE] [30K] ', '  Username Only\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nViews from MALE users\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n0-1 Hour Start!\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n50K/Day\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nMinimum 20', 20, 30000, 8400, 7900, 'Aktif', 881, 'IRVANKEDE', 'Sosial Media'),
(883, 882, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views [FEMALE] [30K] ', '  Username Only\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nViews from FEMALE users\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n0-1 Hour Start!\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n50K/Day\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nMinimum 20', 20, 30000, 8400, 7900, 'Aktif', 882, 'IRVANKEDE', 'Sosial Media'),
(884, 912, 'Twitter Poll Votes', 'Twitter Poll Votes [10M] !', 'Link Example: www....com?vote=ButtonNumber\\\\r\\\\n0-1 Hour Start!\\\\r\\\\n100K/Day\\\\r\\\\nMinimum 100', 100, 10000000, 16100, 15600, 'Aktif', 912, 'IRVANKEDE', 'Sosial Media'),
(885, 945, 'SoundCloud', 'SoundCloud Likes [1M] ', ' 	Real\r\n0-1 Hour Start!\r\n1K - 10K/Day\r\nMinimum 20', 20, 10000000, 31000, 30500, 'Aktif', 945, 'IRVANKEDE', 'Sosial Media'),
(886, 955, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram - Story Views [LAST STORY ONLY] [ Max - 30k ] INSTANT', '  Views On The Last Story Posted Only!\\\\\\\\r\\\\\\\\nUsername Only\\\\\\\\r\\\\\\\\n0-1 Hour Start!\\\\\\\\r\\\\\\\\nUltra Fast!\\\\\\\\r\\\\\\\\nMinimum 20', 20, 30000, 3700, 3200, 'Aktif', 955, 'IRVANKEDE', 'Sosial Media'),
(887, 956, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram - Highlights Views [ Max - 20k ] INSTANT', '  Get Instagram Highlights Views on ALL your HIGHLIGHTS!\\\\\\\\r\\\\\\\\nAdd Username Only!\\\\\\\\r\\\\\\\\nMin 20, Max 20k ', 20, 20000, 35900, 35400, 'Aktif', 956, 'IRVANKEDE', 'Sosial Media'),
(888, 957, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Auto Views + Impressions [10M] [EXPLORE - HOME - LOCATION - PROFILE] ', 'Its good for ranking!\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nMin 100\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nMaximum 1 million!', 50, 1000000, 3250, 2750, 'Aktif', 957, 'IRVANKEDE', 'Sosial Media'),
(889, 958, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram - Story Views [ Superfast ] INSTANT', 'INSTANT START\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\nRELIABLE SERVICE\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\nFOR ALL STORY\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\n50K/DAY\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\nMIN 100, MAX 100K', 50, 100000, 1750, 1250, 'Aktif', 958, 'IRVANKEDE', 'Sosial Media'),
(890, 1015, 'Youtube Likes / Comments /', ' Youtube - Likes [ NON DROP ] [ 100K/DAY ] [ Start 1-6hrs ]', '  Real NON DROP Likes\\r\\nLife Time Guaranteed\\r\\nStart 1-6hrs.\\r\\n100k per day\\r\\nMin 100\\r\\nMax 100k', 100, 1000000, 356500, 356000, 'Aktif', 1015, 'IRVANKEDE', 'Sosial Media'),
(891, 1087, 'Instagram Views', 'Instagram Views Real Indonesia [10K]', 'REAL INDONESIA', 100, 10000, 2000, 1500, 'Aktif', 1087, 'IRVANKEDE', 'Sosial Media'),
(892, 1733, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Profile Visits / Views [20K] ', '- Insert PROFILE Link\\\\r\\\\n- Instant Start\\\\r\\\\n- Profile Visits HQ\\\\r\\\\n- Min = 1000', 1000, 20000, 7700, 7200, 'Aktif', 1733, 'IRVANKEDE', 'Sosial Media'),
(893, 1864, 'Spotify', 'Spotify Plays [10M] [30Days Refill]', '( Spotify Track Link only ) 60-120 Secs Play Time', 1000, 10000000, 15000, 14500, 'Aktif', 1864, 'IRVANKEDE', 'Sosial Media'),
(894, 2057, 'SoundCloud', 'SoundCloud Plays [1.5M] [S1] ', '\r\nStart Time: Instant - 1 hours\r\nSpeed: 50K-100K/ day\r\nSpecs: Real\r\n', 100, 1000000, 2050, 1550, 'Aktif', 2057, 'IRVANKEDE', 'Sosial Media'),
(895, 2058, 'SoundCloud', 'SoundCloud Plays [10M] [S2]', '\r\nStart Time: Instant - 12 hours\r\nSpeed: 1 to 3mil/ day\r\nSpecs: Full Link !\r\n', 5000, 1000000, 1920, 1420, 'Aktif', 2058, 'IRVANKEDE', 'Sosial Media'),
(896, 2070, 'Facebook Page Likes', 'Facebook Page Likes [20K] - Refill 30Days ', 'input link from web, jangan apk\\\\r\\\\n Instant - 1 hour (Up to 5K/ day) ', 50, 20000, 167000, 166500, 'Aktif', 2070, 'IRVANKEDE', 'Sosial Media'),
(897, 2134, 'Website Traffic [Targeted]', 'Indonesia Traffic from Google [10K/Day] ', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics // Anda dapat menggunakan bit.ly untuk melacak hasil \r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan // Format Tautan: URL Situs Web Lengkap', 500, 50000, 15700, 15200, 'Aktif', 2134, 'IRVANKEDE', 'Sosial Media'),
(898, 2135, 'Website Traffic [Targeted]', 'Indonesia Traffic from Quora [2K/Day] ', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20% // Anda dapat menggunakan bit.ly untuk melacak hasil \r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan // Format Tautan: URL Situs Web Lengkap', 500, 50000, 15700, 15200, 'Aktif', 2135, 'IRVANKEDE', 'Sosial Media'),
(899, 2136, 'Website Traffic [Targeted]', 'Indonesia Traffic from Tumblr [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20% // Anda dapat menggunakan bit.ly untuk melacak hasil \r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan // Format Tautan: URL Situs Web Lengkap', 500, 50000, 15700, 15200, 'Aktif', 2136, 'IRVANKEDE', 'Sosial Media'),
(900, 2137, 'Website Traffic [Targeted]', 'Indonesia Traffic from Pinterest [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20% // Anda dapat menggunakan bit.ly untuk melacak hasil \r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan // Format Tautan: URL Situs Web Lengkap', 500, 50000, 15700, 15200, 'Aktif', 2137, 'IRVANKEDE', 'Sosial Media'),
(901, 2138, 'Website Traffic [Targeted]', 'Indonesia Traffic from Twitter [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20% // Anda dapat menggunakan bit.ly untuk melacak hasil \r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan // Format Tautan: URL Situs Web Lengkap', 500, 50000, 15700, 15200, 'Aktif', 2138, 'IRVANKEDE', 'Sosial Media'),
(902, 2139, 'Website Traffic [Targeted]', 'Indonesia Traffic from Reddit [2K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20% // Anda dapat menggunakan bit.ly untuk melacak hasil \r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan // Format Tautan: URL Situs Web Lengkap', 500, 50000, 15700, 15200, 'Aktif', 2139, 'IRVANKEDE', 'Sosial Media'),
(903, 2140, 'Website Traffic [Targeted]', 'Indonesia Traffic from YouTube [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20% // Anda dapat menggunakan bit.ly untuk melacak hasil \r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan // Format Tautan: URL Situs Web Lengkap', 500, 50000, 15700, 15200, 'Aktif', 2140, 'IRVANKEDE', 'Sosial Media'),
(904, 2141, 'Website Traffic [Targeted]', 'Indonesia Traffic from Facebook [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20% // Anda dapat menggunakan bit.ly untuk melacak hasil \r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan // Format Tautan: URL Situs Web Lengkap', 500, 50000, 15700, 15200, 'Aktif', 2141, 'IRVANKEDE', 'Sosial Media'),
(905, 2142, 'Website Traffic [Targeted]', 'Indonesia Traffic from Instagram [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20% // Anda dapat menggunakan bit.ly untuk melacak hasil \r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan // Format Tautan: URL Situs Web Lengkap', 500, 50000, 15700, 15200, 'Aktif', 2142, 'IRVANKEDE', 'Sosial Media'),
(906, 2143, 'Website Traffic [Targeted]', 'Indonesia Traffic from Blogger.com [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20% // Anda dapat menggunakan bit.ly untuk melacak hasil \r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan // Format Tautan: URL Situs Web Lengkap', 500, 50000, 15700, 15200, 'Aktif', 2143, 'IRVANKEDE', 'Sosial Media'),
(907, 2252, 'Instagram Likes', 'Instagram Likes [Max 10K] [ALWAYS INSTANT ]', 'INSTANT SLOW BUT OVERLOAD', 50, 10000, 22000, 21500, 'Aktif', 2252, 'IRVANKEDE', 'Sosial Media'),
(908, 2276, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [10K] Instant [ No refill ]', 'Instant - 1 hour ( ONLY FOR FACEBOOK PAGES POSTS ) - No refill', 50, 10000, 63200, 62700, 'Aktif', 2276, 'IRVANKEDE', 'Sosial Media'),
(909, 2332, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [15K] - 2K/Day [ Refill 14Days ]', 'Instant - 1 hour ( 1 - 2K/ day  ) \r\nINPUT LINK BROWSER, JANGAN LINK APK', 100, 15000, 88000, 87500, 'Aktif', 2332, 'IRVANKEDE', 'Sosial Media'),
(910, 2369, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - [ Max - 20k ] [ NO REFILL BOT ] INSTANT', 'max 10k Per User - UP 3K/Day 1465', 100, 3000, 13300, 12800, 'Aktif', 2369, 'IRVANKEDE', 'Sosial Media'),
(911, 2395, 'ZPRIVAT NOTE ORDER', 'JANGAN DI ORDER YA [ 4K] [KHUSUS] PRIVAT FOLL [KOPI]', 'JANGAN ORDER OII', 50, 4000, 51500, 51000, 'Aktif', 2395, 'IRVANKEDE', 'Sosial Media'),
(912, 2396, 'ZPRIVAT NOTE ORDER', 'JANGAN DI ORDER YA [ 5K] [KHUSUS] PRIVAT FOLL [KOPI]', 'instant', 50, 3500, 51500, 51000, 'Aktif', 2396, 'IRVANKEDE', 'Sosial Media'),
(913, 2397, 'ZPRIVAT NOTE ORDER', 'JANGAN DI ORDER YA [ 5K] [KHUSUS] PRIVAT LIKE YES [KOPI]', '000000', 50, 5000, 51500, 51000, 'Aktif', 2397, 'IRVANKEDE', 'Sosial Media'),
(914, 2407, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', '  Shopee Likes Indonesia Bot [5K] Shopee Favorite / Like Produk Indonesia [KEDIP]', 'INSNANT KEDIP UP BANYAK', 50, 5000, 9000, 8500, 'Aktif', 2407, 'IRVANKEDE', 'Sosial Media'),
(915, 2408, 'ZPRIVAT NOTE ORDER', 'PRIVAT [BOT] [4K] JANGAN ORDER YA BL FOLL', '000000', 50, 4000, 51500, 51000, 'Aktif', 2408, 'IRVANKEDE', 'Sosial Media'),
(916, 2409, 'ZPRIVAT NOTE ORDER', 'PRIVAT [BOT] [4K] JANGAN ORDER YA BL LIKE', '0000', 50, 4000, 51500, 51000, 'Aktif', 2409, 'IRVANKEDE', 'Sosial Media'),
(917, 2410, 'ZPRIVAT NOTE ORDER', 'PRIVAT [BOT] [4K] JANGAN ORDER YA BL VIEWS', '0000', 50, 4000, 51500, 51000, 'Aktif', 2410, 'IRVANKEDE', 'Sosial Media'),
(918, 2431, 'Instagram TV', 'Instagram TV Views [5M/day] ', 'Instant start', 100, 100000000, 3450, 2950, 'Aktif', 2431, 'IRVANKEDE', 'Sosial Media'),
(919, 2454, 'Instagram Story / Impressions / Saves /  Reach', 'Ä°nstagram All Views Story [5k]', 'Instant', 100, 5000, 5050, 4550, 'Aktif', 2454, 'IRVANKEDE', 'Sosial Media'),
(920, 2456, 'Instagram Story / Impressions / Saves /  Reach', 'Ä°nstagram Last Story Max 5k', 'INSTANT', 100, 5000, 3800, 3300, 'Aktif', 2456, 'IRVANKEDE', 'Sosial Media'),
(921, 2483, 'Instagram Views', 'Instagram Views  Max 60k - INSTANT Superfast', 'instant', 500, 60000, 3750, 3250, 'Aktif', 2483, 'IRVANKEDE', 'Sosial Media'),
(922, 2484, 'Instagram Views', 'Instagram Views SuperFast - 500k/day', ' Start 0-6hrs ', 5000, 50000000, 2580, 2080, 'Aktif', 2484, 'IRVANKEDE', 'Sosial Media'),
(923, 2511, 'Instagram TV', 'IGTV Views [100M] Instant - 500K/Day', 'Full TV Video Link Needed - INSTANT Start', 50, 100000000, 2420, 1920, 'Aktif', 2511, 'IRVANKEDE', 'Sosial Media'),
(924, 2521, 'Instagram TV', 'Instagram TV Views [1M/day] Instant', 'iinstant start', 500, 10000000, 2490, 1990, 'Aktif', 2521, 'IRVANKEDE', 'Sosial Media'),
(925, 2525, 'Instagram TV', 'Instagram TV Views [1M/day] [ Cheapest in market]', 'INSTANT', 500, 10000000, 2250, 1750, 'Aktif', 2525, 'IRVANKEDE', 'Sosial Media'),
(926, 2546, 'Instagram Views', 'Instagram Views [500K] Instant - Fast', 'Instant ', 100, 1000000, 2199, 1699, 'Aktif', 2546, 'IRVANKEDE', 'Sosial Media'),
(927, 2547, 'Instagram TV', 'IGTV Views [5M] Instant - 1Hours', 'Real Views  - Super Fast', 200, 5000000, 2350, 1850, 'Aktif', 2547, 'IRVANKEDE', 'Sosial Media'),
(928, 2592, 'Instagram Views', 'Instagram Views [300k Per Day]  FAST ', 'instant ', 500, 300000, 3600, 3100, 'Aktif', 2592, 'IRVANKEDE', 'Sosial Media'),
(929, 2593, 'Instagram Views', 'Instagram Views [ Max 10 Million ]  Super Fast ', 'Start 0-10 minutes (1Million/DAY)', 500, 1000000, 2201, 1701, 'Aktif', 2593, 'IRVANKEDE', 'Sosial Media'),
(930, 2609, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [7K] [REFILL 7 DAYS] Instant ', '0-3 Hours  start  (2-5K/Day)', 100, 7000, 66400, 65900, 'Aktif', 2609, 'IRVANKEDE', 'Sosial Media'),
(931, 2616, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee Likes Indonesia NONDROP [4K] Shopee Favorite / Like Produk Indonesia [DB 2]', 'INSTANY', 100, 4000, 8500, 8000, 'Aktif', 2616, 'IRVANKEDE', 'Sosial Media'),
(932, 2656, 'Instagram Followers Indonesia', 'Instagram Followers AKTIP Indonesia Max 11K [TERMURAH ] USERNAME ONLY  [AKUN AKTIP-REAL] S3', 'PROSES 1-4  HARI YA !!! REAL ACCOUNT  JIKA PESANAN FOLLOWERS/LIKES INSTAGRAM AKTIF INDONESIA ERROR Harap cek akun tersebut terlebih dahulu, pastikan:Input username untuk followers (tanpa @), bukan URL.HANYA USERNAMETidak melakukan pembatasan usia pada akun (Restricted profile).Maksimal pemesanan total (akumulasi) Sesuai database, drop rate 10%-50%', 50, 5000, 14000, 13500, 'Aktif', 2656, 'IRVANKEDE', 'Sosial Media'),
(933, 2704, 'Instagram TV', 'Instagram TV Views [MAX 5M] Instant 1M/Days', 'instant', 250, 500000, 2650, 2150, 'Aktif', 2704, 'IRVANKEDE', 'Sosial Media'),
(934, 2713, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia NEW [ 10K] [SUPER FAST]AUTO KEDIP', 'PERFOTO UP 10K LIKES INSTANT MAX 1X24 JAM', 50, 1000, 26500, 26000, 'Aktif', 2713, 'IRVANKEDE', 'Sosial Media'),
(935, 2717, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions [Max 100K] Instant', 'instant', 50, 100000, 2490, 1990, 'Aktif', 2717, 'IRVANKEDE', 'Sosial Media'),
(936, 2770, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia HQ [SUPER FAST] [6K] AUTO KEDIP', 'PERFOTO UP 1K AKUN AKTIP DAN BOT CAMPURAN MnAX 2 HARI ', 100, 6000, 32500, 32000, 'Aktif', 2770, 'IRVANKEDE', 'Sosial Media'),
(937, 2780, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Real [ No Refill ] [ 2-5K/Day] - Less Drop', 'Less Drop (REAL + BOT)\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nINSTANT', 100, 5000, 33000, 32500, 'Aktif', 2780, 'IRVANKEDE', 'Sosial Media'),
(938, 2800, 'Instagram TV', 'IGTV Likes [5K] INSTANT', '0-1 Hour\\\\r\\\\n Only 0 Real and Active Accounts', 50, 5000, 54500, 54000, 'Aktif', 2800, 'IRVANKEDE', 'Sosial Media'),
(939, 2820, 'Instagram Views', ' Instagram Views ( Super Fast ) Min 100 Max 10 Million [ 1Million/ Hour]', ' Instagram Views ( Super Fast ) Min 100 Max 10 Million [ 1Million/ Hour]', 500, 10000000, 2050, 1550, 'Aktif', 2820, 'IRVANKEDE', 'Sosial Media'),
(940, 2821, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee Feed Like Bot Indonesia  [4K]', 'URL', 100, 4000, 6500, 6000, 'Aktif', 2821, 'IRVANKEDE', 'Sosial Media'),
(941, 2822, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee Feed Comment Indonesia BOT [4K] ', 'ISI SESUAI INTRUKI\\\\\\\\r\\\\\\\\nMAX PER INPUT KOMEN 5K', 10, 4000, 21500, 21000, 'Aktif', 2822, 'IRVANKEDE', 'Sosial Media'),
(942, 2825, 'Instagram Views', 'Instagram Views + Impressions [10M] [INSTANT - 500K/Day] ', 'Instagram Views + Impressions [10M] [INSTANT - 500K/Day] ', 100, 1000000, 2200, 1700, 'Aktif', 2825, 'IRVANKEDE', 'Sosial Media'),
(943, 2853, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions + Reach [50K] Instant 50K/Day`', 'instant', 25, 50000, 2050, 1550, 'Aktif', 2853, 'IRVANKEDE', 'Sosial Media'),
(944, 2855, 'Instagram Highlights / Profile Visits / Reach', 'Instagram Profile Visits / Views [100K] Instant Start', 'Insert PROFILE username\\\\r\\\\nProfile Visits HQ', 500, 100000, 6300, 5800, 'Aktif', 2855, 'IRVANKEDE', 'Sosial Media'),
(945, 2861, 'Facebook Page Likes', 'Facebook Page Likes [Auto Refill - 16 Days] INSTANT', 'Auto-Refill if Likes Drop\r\n Drop Ratio: 10% but we added Auto-Refill in Backend System', 500, 5000, 96500, 96000, 'Aktif', 2861, 'IRVANKEDE', 'Sosial Media'),
(946, 2871, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 2 Likes per minute - New', 'instant', 20, 5000, 35900, 35400, 'Aktif', 2871, 'IRVANKEDE', 'Sosial Media'),
(947, 2872, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 5 Likes per minute - NEW', 'INSTANT', 20, 5000, 35900, 35400, 'Aktif', 2872, 'IRVANKEDE', 'Sosial Media'),
(948, 2873, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 10 Likes per minute - NEW', 'INSTANT', 20, 5000, 35900, 35400, 'Aktif', 2873, 'IRVANKEDE', 'Sosial Media'),
(949, 2874, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 25 Likes per minute - NEW', 'INSTANT', 20, 5000, 35900, 35400, 'Aktif', 2874, 'IRVANKEDE', 'Sosial Media'),
(950, 2875, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 50 Likes per minute - NEW', 'INSTANT', 20, 5000, 35900, 35400, 'Aktif', 2875, 'IRVANKEDE', 'Sosial Media'),
(951, 2876, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 75 Likes per minute - NEW', 'INSTANT', 20, 5000, 35900, 35400, 'Aktif', 2876, 'IRVANKEDE', 'Sosial Media'),
(952, 2877, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 100 Likes per minute - NEW', 'INSTANT', 20, 5000, 35900, 35400, 'Aktif', 2877, 'IRVANKEDE', 'Sosial Media'),
(953, 2892, 'Telegram', 'Telegram - Post View [SERVER 1] [Last 1 Posts ] [ 150k] .', ' Super fast\\r\\n150K max', 100, 150000, 2350, 1850, 'Aktif', 2892, 'IRVANKEDE', 'Sosial Media'),
(954, 2901, 'Tiktok Followers', 'Tik Tok - Followers - Instant start ( Min 10 and 30k ) .', '- Speed 5000 per day\\\\r\\\\n- Avatars Followers and Likes\\\\r\\\\n- 30 days warranty\\\\r\\\\n- minimum 10\\\\r\\\\n- maximum 10000\\\\r\\\\n- instant start to 5 minute start Time\\\\r\\\\n( Put Full Url For Example https://www.tiktok.com/@username )', 10, 30000, 76000, 75500, 'Aktif', 2901, 'IRVANKEDE', 'Sosial Media'),
(955, 2902, 'Tiktok Likes', 'Tik Tok - Likes - Instant start ( Min 10 and Max 30k )', '- Speed 5000 per day\\\\\\\\r\\\\\\\\n- Avatars Followers and Likes\\\\\\\\r\\\\\\\\n- 30 days warranty\\\\\\\\r\\\\\\\\n- minimum 10\\\\\\\\r\\\\\\\\n- maximum 10000\\\\\\\\r\\\\\\\\n- instant start to 5 minute start Time', 20, 30000, 76000, 75500, 'Aktif', 2902, 'IRVANKEDE', 'Sosial Media'),
(956, 2903, 'Tiktok Followers', 'TIK TOK FOLLOWERS - MIN 10 - MAX 15K - 30 days refill - Full URL ', ' Complete URL\\r\\n30 days refill\\r\\nSpeed 2-5k/Day', 15, 20000, 119500, 119000, 'Aktif', 2903, 'IRVANKEDE', 'Sosial Media'),
(957, 2906, 'Twitter Views / Impressions / Live / Comments', ' Twitter Views [1M]..', 'Instant Start\r\n500-3,000/day speed\r\n\r\nNo Refill / No refund', 100, 1000000, 28000, 27500, 'Aktif', 2906, 'IRVANKEDE', 'Sosial Media'),
(958, 2907, 'Twitter Views / Impressions / Live / Comments', 'Twitter Impressions [1M] ...', 'Twitter Impressions [1M] ', 100, 10000, 28000, 27500, 'Aktif', 2907, 'IRVANKEDE', 'Sosial Media'),
(959, 2908, 'Twitter Views / Impressions / Live / Comments', ' Twitter Polls Fast Speed ( Min 20 / Max 200k Per day l).', ' Twitter Polls Fast Speed ( Min 20 / Max 200k Per day l)', 20, 20000, 39500, 39000, 'Aktif', 2908, 'IRVANKEDE', 'Sosial Media'),
(960, 2909, 'Twitter Views / Impressions / Live / Comments', 'Twitter Video Views [ Max 5m ] ,', 'Twitter Video Views [ Max 5m ] ', 100, 5200000, 12000, 11500, 'Aktif', 2909, 'IRVANKEDE', 'Sosial Media'),
(961, 2910, 'Twitter Views / Impressions / Live / Comments', 'Twitter Impression [ Max 5m ] ..', 'Twitter Impression [ Max 5m ] ', 100, 5000000, 12000, 11500, 'Aktif', 2910, 'IRVANKEDE', 'Sosial Media'),
(962, 2911, 'Twitter Views / Impressions / Live / Comments', 'Twitter Profile Click [ Max 10k ] ,', 'Twitter Profile Click [ Max 10k ] ', 100, 1000000, 12000, 11500, 'Aktif', 2911, 'IRVANKEDE', 'Sosial Media'),
(963, 2912, 'Twitter Views / Impressions / Live / Comments', 'Twitter Hashtag Click [ Max 10k ]/', 'Twitter Hashtag Click [ Max 10k ] ', 100, 1000000, 12000, 11500, 'Aktif', 2912, 'IRVANKEDE', 'Sosial Media'),
(964, 2913, 'Twitter Views / Impressions / Live / Comments', 'Twitter Link Click [ Max 10k ] .', 'Twitter Link Click [ Max 10k ] ', 100, 1000000, 12000, 11500, 'Aktif', 2913, 'IRVANKEDE', 'Sosial Media'),
(965, 2914, 'Twitter Views / Impressions / Live / Comments', 'Twitter Polls Slow Speed ( Min 20 / Max 50k ) .', 'Twitter Polls Slow Speed ( Min 20 / Max 50k ) ', 20, 10000000, 11300, 10800, 'Aktif', 2914, 'IRVANKEDE', 'Sosial Media'),
(966, 2926, 'Instagram Likes', 'Instagram Likes 100% Real Account [ Country - Turkey + Asia+ Indonesia]', ' 1k-2k/houR turkey- asia targeted', 50, 40000, 13000, 12500, 'Aktif', 2926, 'IRVANKEDE', 'Sosial Media'),
(967, 2932, 'Youtube Likes / Comments /', 'Youtube Likes [ Max 50K ] No Refill Instant', 'Real Likes\\r\\nNO REFILL NO Refund\\r\\n', 20, 50000, 34100, 33600, 'Aktif', 2932, 'IRVANKEDE', 'Sosial Media'),
(968, 2950, 'Instagram Likes', 'Instagram Likes [ Real ] [30 Days Guarantee ] - Instant`', '30 days guarantee\\r\\n100% real likes\\r\\n', 50, 5000, 45500, 45000, 'Aktif', 2950, 'IRVANKEDE', 'Sosial Media'),
(969, 2976, 'Instagram Likes', 'Instagram Likes [ Max 50K ] instant Real', 'with profile picture\r\ninstant', 20, 50000, 17300, 16800, 'Aktif', 2976, 'IRVANKEDE', 'Sosial Media'),
(970, 2980, 'Youtube Likes / Comments /', 'Youtube Likes [ Max 5k ] Instant - No Refill ', 'Real Youtube Likes\\r\\nInstant Start\\r\\nNo Refill | No Refund', 10, 100000, 22000, 21500, 'Aktif', 2980, 'IRVANKEDE', 'Sosial Media'),
(971, 2982, 'Instagram Likes', 'Instagram Likes [Max 5k] Real 100% Indian + Arab - Country', 'No refill Indian and Arab User', 20, 5000, 11800, 11300, 'Aktif', 2982, 'IRVANKEDE', 'Sosial Media'),
(972, 2985, 'Instagram Live Video', 'Instagram Live Video Likes [10K] [INSTANT - INSTANT]', 'Username Only\\\\r\\\\nNo Refill / No Refund\\\\r\\\\nLikes On Live Video\\\\r\\\\nFast Delivery\\\\r\\\\nMinimum 200', 200, 10000, 5400, 4900, 'Aktif', 2985, 'IRVANKEDE', 'Sosial Media'),
(973, 2987, 'Facebook Followers / Friends / Group Members', 'Facebook Profile Followers [1K] [INSTANT - INSTANT] ', 'no refill \\\\r\\\\nEXAMPLE LINK\\\\r\\\\nhttps://www.facebook.com/kede/', 20, 1000, 70500, 70000, 'Aktif', 2987, 'IRVANKEDE', 'Sosial Media'),
(974, 3011, 'Twitter Views / Impressions / Live / Comments', 'Twitter Video Views [ MAX 20K ] INSTANT', 'INSTANT', 100, 20000, 5200, 4700, 'Aktif', 3011, 'IRVANKEDE', 'Sosial Media'),
(975, 3013, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TIKTOK Shares - Real ', 'Drop can be 20-40%\\\\r\\\\nAll Real Profile\\\\r\\\\n', 100, 10000, 48000, 47500, 'Aktif', 3013, 'IRVANKEDE', 'Sosial Media'),
(976, 3035, 'Instagram Likes', 'Instagram Likes [ MAX 50K ] No Refill - INSTANT', 'Real Likes and Real Account Instant Start !', 20, 50000, 11400, 10900, 'Aktif', 3035, 'IRVANKEDE', 'Sosial Media'),
(977, 3046, 'Instagram Views', 'Instagram Views + Impressions [RANDOM] - MAX 5 Million ', 'INSTANT', 100, 50000000, 2650, 2150, 'Aktif', 3046, 'IRVANKEDE', 'Sosial Media'),
(978, 3069, 'Instagram Views', 'Instagram Views [ 10M/DAY ] SUPER FAST', 'INSTANT', 200, 10000000, 2090, 1590, 'Aktif', 3069, 'IRVANKEDE', 'Sosial Media'),
(979, 3074, 'Instagram TV', 'Instagram TV Views [ 3M/DAY ] INSTANT', 'INSTANT FAST', 100, 10000000, 2800, 2300, 'Aktif', 3074, 'IRVANKEDE', 'Sosial Media'),
(980, 3080, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions [ MAX 10K ] ', 'INSTANT\r\nNO REFILL - NO REFUND', 100, 10000, 2360, 1860, 'Aktif', 3080, 'IRVANKEDE', 'Sosial Media'),
(981, 3088, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions - Max 100K  [ INSTANT ]', 'INSTANT', 5, 100000, 5200, 4700, 'Aktif', 3088, 'IRVANKEDE', 'Sosial Media'),
(982, 3096, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Followers Shopee NON DROP !!! [6K] INSTANT ] [ DB FRESS ] NEW', 'INPUT USERNAME ONLY', 100, 6000, 16500, 16000, 'Aktif', 3096, 'IRVANKEDE', 'Sosial Media'),
(983, 3101, 'Twitter Views / Impressions / Live / Comments', 'Twitter Video Views [ 50K/Day ] ', 'instant', 100, 100000, 4200, 3700, 'Aktif', 3101, 'IRVANKEDE', 'Sosial Media'),
(984, 3102, 'Twitter Views / Impressions / Live / Comments', 'Twitter Impression [ Max 10K ]  Instant Start', 'INSTANT', 10, 10000, 12800, 12300, 'Aktif', 3102, 'IRVANKEDE', 'Sosial Media'),
(985, 3128, 'Youtube Likes / Comments /', 'Youtube Real Likes  [ MIN 100 ]', 'Lifetime Guarantee\\r\\nSuper Fast and Instant Start', 100, 100000, 66500, 66000, 'Aktif', 3128, 'IRVANKEDE', 'Sosial Media'),
(986, 3170, 'Youtube Likes / Comments /', 'Youtube Likes - MAX 50K [ No Refill ] ', 'INSTANT', 100, 50000, 17400, 16900, 'Aktif', 3170, 'IRVANKEDE', 'Sosial Media'),
(987, 3173, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TikTok Video Views [ 30-50K/DAY ] Exclusive Service', 'KHUSUS LAYANAN INI MEMBANTU VIDEO ANDA TRENDING DAN VIRAL\\\\\\\\r\\\\\\\\nINSTANT', 500, 500000, 3550, 3050, 'Aktif', 3173, 'IRVANKEDE', 'Sosial Media'),
(988, 3183, 'Instagram Likes', 'Instagram Likes [ 300-500/hour ] REAL - NO REFILL', 'INSTANT', 50, 10000, 11000, 10500, 'Aktif', 3183, 'IRVANKEDE', 'Sosial Media'),
(989, 3186, 'Instagram Likes', 'Instagram Likes + Impressions  [ MAX 30K ] INSTANT', 'INSTANT', 10, 30000, 15900, 15400, 'Aktif', 3186, 'IRVANKEDE', 'Sosial Media'),
(990, 3190, 'Instagram Likes', 'Instagram Likes [ MAX 20K ] INSTANT - NOREFILL', 'NO REFILL - NO REFUND 160', 10, 100000, 9900, 9400, 'Aktif', 3190, 'IRVANKEDE', 'Sosial Media'),
(991, 3195, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [15K] INSTANT - MIX BOT', 'NO REFILL - NOREFUND\r\n', 100, 50000, 22000, 21500, 'Aktif', 3195, 'IRVANKEDE', 'Sosial Media'),
(992, 3196, 'Instagram Likes', 'instagram Likes - Max 20k ~ BOT ~ Speed 5k/hrs ~ INSTANT .', ' No Refill Speed 1-2K/ Per Day Likes Can Drop Cheapest Service 160', 100, 20000, 9500, 9000, 'Aktif', 3196, 'IRVANKEDE', 'Sosial Media'),
(993, 3199, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 50K [ NO REFILL - INSTANT ]', 'Speed 10K/Day NO REFILL', 10, 50000, 12000, 11500, 'Aktif', 3199, 'IRVANKEDE', 'Sosial Media'),
(994, 3215, 'Instagram Likes', 'Instagram Likes [ 1K/HOURS ] REAL - INSTANT', 'Drop 0-5% ( ESTIMASI )\\\\\\\\r\\\\\\\\nINSTAN`', 20, 10000, 26600, 26100, 'Aktif', 3215, 'IRVANKEDE', 'Sosial Media'),
(995, 3216, 'Instagram Likes', 'Instagram Likes - 100% [ Country Turkey + Asia ] INSTANT', '100-200/hour turkey- asia targeted', 10, 50000, 10900, 10400, 'Aktif', 3216, 'IRVANKEDE', 'Sosial Media'),
(996, 3217, 'Telegram', 'Telegram Public Channel Members [ MAX 200K ] No Refill', 'Speed-20k/day\\r\\nINSTANT', 1000, 200000, 31400, 30900, 'Aktif', 3217, 'IRVANKEDE', 'Sosial Media'),
(997, 3221, 'Twitter Likes', 'Twitter Likes - MAX 5K [ INSTANT ]', 'No Refill\r\n`', 10, 5000, 20400, 19900, 'Aktif', 3221, 'IRVANKEDE', 'Sosial Media'),
(998, 3255, 'Instagram Likes', 'Instagram Likes [ Max 15K ] INSTANT - NO REFILL ', 'No RefillnnSpeed 1-2K/ Per Day', 20, 15000, 8500, 8000, 'Aktif', 3255, 'IRVANKEDE', 'Sosial Media'),
(999, 3261, 'Telegram', 'Telegram Public Group Members [ 10K/Day ] Real', 'No Refill\\r\\nStart instant\\r\\n', 100, 10000, 28300, 27800, 'Aktif', 3261, 'IRVANKEDE', 'Sosial Media'),
(1000, 3262, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia [7K] [BEST SELLER] [REAL] [BETA] ', '2X24 JAM NO REFILL', 100, 7000, 23500, 23000, 'Aktif', 3262, 'IRVANKEDE', 'Sosial Media'),
(1001, 3274, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia [INSTANT] REAL ACCOUNT FAST 25K', 'NO REFILL NO REFUND MAXIMAL 2 HARI LANCAR KEDIP JIKA ANTRIAN KOSONG', 100, 25000, 31500, 31000, 'Aktif', 3274, 'IRVANKEDE', 'Sosial Media'),
(1002, 3297, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Emoticon Like [ Love React â¤ï¸ ]', 'instant', 50, 50, 31800, 31300, 'Aktif', 3297, 'IRVANKEDE', 'Sosial Media'),
(1003, 3298, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Emoticon Like [ Angry React ]', 'instant', 50, 50, 31800, 31300, 'Aktif', 3298, 'IRVANKEDE', 'Sosial Media'),
(1004, 3299, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Emoticon Like [ Haha React ] ', 'INSTANT', 50, 50, 31800, 31300, 'Aktif', 3299, 'IRVANKEDE', 'Sosial Media'),
(1005, 3300, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Emoticon Like [ WoW React ] ', 'INSTANT', 50, 50, 31800, 31300, 'Aktif', 3300, 'IRVANKEDE', 'Sosial Media'),
(1006, 3301, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Emoticon Like [ Sad React ] ', 'INSTANT', 50, 50, 31800, 31300, 'Aktif', 3301, 'IRVANKEDE', 'Sosial Media'),
(1007, 3302, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Emoticon Like [ Care React ] ', 'instant', 50, 50, 31800, 31300, 'Aktif', 3302, 'IRVANKEDE', 'Sosial Media'),
(1008, 3308, 'Instagram Likes', 'Instagram Likes Real - MAX 10K [ REFILL 365 DAYS ] ', 'INSTANT', 100, 10000, 43700, 43200, 'Aktif', 3308, 'IRVANKEDE', 'Sosial Media'),
(1009, 3356, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TikTok  Views Indonesia [1K] [ACCOUNT INDONESIA] [NONDROP]', 'INPUT LINK BOT AKUN INDONESIA - NONDROP - PROSES INSTANT TAPI KALO RAME PROSES MAX 1-2 HARI ', 100, 1000, 8500, 8000, 'Aktif', 3356, 'IRVANKEDE', 'Sosial Media'),
(1010, 3381, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 1K NEW', 'INSTANT', 1000, 1000, 56500, 56000, 'Aktif', 3381, 'IRVANKEDE', 'Sosial Media'),
(1011, 3382, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 2K NEW', 'INSTANT', 2000, 2000, 56500, 56000, 'Aktif', 3382, 'IRVANKEDE', 'Sosial Media'),
(1012, 3383, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 3K NEW', 'INSTANT', 3000, 3000, 56500, 56000, 'Aktif', 3383, 'IRVANKEDE', 'Sosial Media'),
(1013, 3384, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 4K NEW ', 'INSTANT', 4000, 4000, 56500, 56000, 'Aktif', 3384, 'IRVANKEDE', 'Sosial Media'),
(1014, 3385, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 5K NEW ', 'INSTANT', 5000, 5000, 56500, 56000, 'Aktif', 3385, 'IRVANKEDE', 'Sosial Media'),
(1015, 3386, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 6K NEW ', 'INSTANT', 6000, 6000, 56500, 56000, 'Aktif', 3386, 'IRVANKEDE', 'Sosial Media'),
(1016, 3387, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 7K NEW ', 'INSTANT', 7000, 7000, 56500, 56000, 'Aktif', 3387, 'IRVANKEDE', 'Sosial Media'),
(1017, 3388, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 8K NEW', 'INSTANT', 8000, 8000, 56500, 56000, 'Aktif', 3388, 'IRVANKEDE', 'Sosial Media'),
(1018, 3397, 'Youtube Views', 'Youtube Views [ 20K-50K ] REFILL 30DAYS', 'INSTANT', 100, 100000000, 33300, 32800, 'Aktif', 3397, 'IRVANKEDE', 'Sosial Media'),
(1019, 3418, 'Instagram Likes', 'Instagram Likes - MAX 5K [ HQ ASIAN ] ', 'REAL ASIAN\\r\\nSpeed 1k-3k/day', 20, 5000, 12800, 12300, 'Aktif', 3418, 'IRVANKEDE', 'Sosial Media'),
(1020, 3420, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia [150K] [BEST SELLER] [REAL]', 'REAL AKTIP INDONESIA PROSES SANGAT CEPAT', 100, 50000, 26500, 26000, 'Aktif', 3420, 'IRVANKEDE', 'Sosial Media'),
(1021, 3421, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia [10K] [BEST SELLER] [REAL] [BETA] ', 'REAL AKTIP ACCOUNT PROSES MAX 3 HARI', 100, 10000, 17300, 16800, 'Aktif', 3421, 'IRVANKEDE', 'Sosial Media'),
(1022, 3423, 'Instagram Likes', 'Instagram Likes - MAX 5K [ REAL - HQ ] ', '1k-3k/day\\r\\nASIAL PROFILE', 50, 5000, 13000, 12500, 'Aktif', 3423, 'IRVANKEDE', 'Sosial Media'),
(1023, 3427, 'Youtube Views', 'Youtube Views [ 5K-10K/DAYS ] Lifetime Guarantee', 'Retention - 2-5 minutes ( JIKA DAPAT )\r\nEmergency Server\r\n', 1000, 10000000, 46000, 45500, 'Aktif', 3427, 'IRVANKEDE', 'Sosial Media'),
(1024, 3431, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Photo Likes - MAX 5K  [ REFILL 30DAYS ] ', 'Instant Start\r\nMIX Likes\r\n', 50, 5000, 16400, 15900, 'Aktif', 3431, 'IRVANKEDE', 'Sosial Media'),
(1025, 3438, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia [10K] [BEST SELLER] [REAL] SUPER FAST ', 'NO REFILL NO REFUND FAST', 100, 10000, 10500, 10000, 'Aktif', 3438, 'IRVANKEDE', 'Sosial Media'),
(1026, 3439, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TIKTOK SHARE INDONESIA FYP [20K] INSTANT REAL DB INDONESIA', 'CONTOH LINK YANG DI INPUT WAJIB BIAR GAK EROR  https://www.tiktok.com/@eca.btari/video/6908217883042548994 ', 100, 20000, 36500, 36000, 'Aktif', 3439, 'IRVANKEDE', 'Sosial Media'),
(1027, 3440, 'Youtube Views', 'Youtube Views - 5K/DAY [ 30 Days Guaranted ] INSTANT', 'REFILL 30DAYS', 1000, 500000, 24800, 24300, 'Aktif', 3440, 'IRVANKEDE', 'Sosial Media'),
(1028, 3453, 'Instagram Likes', 'Instagram Likes - MAX 5K [ INSTANT - START ]', 'NO REFILL 300-500/hour 796', 10, 5000, 11700, 11200, 'Aktif', 3453, 'IRVANKEDE', 'Sosial Media'),
(1029, 3460, 'Instagram Likes Indonesia', 'Likes Indonesia FAST PROSES [15K] [REAL]', 'PROSES INSTANT ', 50, 15000, 24500, 24000, 'Aktif', 3460, 'IRVANKEDE', 'Sosial Media'),
(1030, 3463, 'Instagram Followers Indonesia [Bergaransi] Refill ', 'Instagram Followers Indonesia AUTO REFILL 7 HARI [10K]', 'AUTO REFILL - JIKA MASA DURASI HABIS TIDAK ADA REFILL LAGI ', 100, 10000, 56500, 56000, 'Aktif', 3463, 'IRVANKEDE', 'Sosial Media'),
(1031, 3464, 'Instagram Followers Indonesia [Bergaransi] Refill ', 'Instagram FOLLOWERS AUTO REFILL 15 DAYS [10K]', 'AUTO REFILL , JIKA MASA DURASI HABIS TIDAK ADA REFILL LAGI', 100, 10000, 66500, 66000, 'Aktif', 3464, 'IRVANKEDE', 'Sosial Media'),
(1032, 3465, 'Instagram Followers Indonesia [Bergaransi] Refill ', 'Instagram FOLLOWERS AUTO REFILL 30 DAYS [10K]', 'AUTO REFILL', 100, 10000, 79500, 79000, 'Aktif', 3465, 'IRVANKEDE', 'Sosial Media'),
(1033, 3466, 'Twitter Views / Impressions / Live / Comments', 'Twitter Video Views [ 100K-200K/DAY ] ', 'INSTANT', 100, 10000000, 3650, 3150, 'Aktif', 3466, 'IRVANKEDE', 'Sosial Media'),
(1034, 3471, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ 2K-4K/DAY ] INSTANT - NOREFILL ', 'INSTANT nCAN HIGH DROP', 10, 10000, 8000, 7500, 'Aktif', 3471, 'IRVANKEDE', 'Sosial Media'),
(1035, 3479, 'Telegram', 'Telegram Channel/Group Members USA - MAX 15K [ INSTANT ] ', 'Only OPEN Channels/Groups\\r\\nFull link - https://t.me/yourchannel', 500, 15000, 26000, 25500, 'Aktif', 3479, 'IRVANKEDE', 'Sosial Media'),
(1036, 3480, 'Telegram', 'Telegram Channel/Group Members [ MAX 20K - NO REFILL ] ', 'Only OPEN Channels/Groups\\\\r\\\\nFull link - https://t.me/yourchannel', 50, 20000, 19600, 19100, 'Aktif', 3480, 'IRVANKEDE', 'Sosial Media'),
(1037, 3483, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views [ All Story] - MAX 50K', 'USERNAME ONLY', 100, 50000, 2700, 2200, 'Aktif', 3483, 'IRVANKEDE', 'Sosial Media'),
(1038, 3485, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TIKTOK SHARE FYP INDONESIA [100K] FAST INSTANT TERMURAH', 'CONTOH LINK YANG DI INPUT WAJIB BIAR GAK EROR  https://www.tiktok.com/@eca.btari/video/6908217883042548994 ', 100, 100000, 12500, 12000, 'Aktif', 3485, 'IRVANKEDE', 'Sosial Media'),
(1039, 3492, 'Instagram Likes', 'Instagram likes - Turkey TARGETTED [ MAX 20K ] ', 'INSTANT', 20, 20000, 24800, 24300, 'Aktif', 3492, 'IRVANKEDE', 'Sosial Media'),
(1040, 3493, 'Instagram Highlights / Profile Visits / Reach', 'Instagram Profile Visits - INSTANT', 'USERNAME ONLY', 100, 5000000, 2350, 1850, 'Aktif', 3493, 'IRVANKEDE', 'Sosial Media'),
(1041, 3501, 'Twitter Views / Impressions / Live / Comments', 'Twitter Views - INSTANT', 'Targeted Arabia ', 10, 1000000, 3054, 2554, 'Aktif', 3501, 'IRVANKEDE', 'Sosial Media'),
(1042, 3504, 'Instagram Likes', 'Instagram Likes - MAX 10K [ NO REFILL ] ', 'INSTANT CAN HIGH DROP', 10, 10000, 5100, 4600, 'Aktif', 3504, 'IRVANKEDE', 'Sosial Media'),
(1043, 3506, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 10K [ NO REFILL ]', 'INSTANT CAN HIGH DROP 3403', 10, 10000, 5900, 5400, 'Aktif', 3506, 'IRVANKEDE', 'Sosial Media'),
(1044, 3510, 'Instagram Views', 'Instagram Views - MAX 5M [ INSTANT - Recommended ]', 'INSTANT', 100, 50000000, 2020, 1520, 'Aktif', 3510, 'IRVANKEDE', 'Sosial Media'),
(1045, 3512, 'Spotify', 'Spotify User Followers - INSTANT [ NO REFILL ] ', 'Bot Accounts\r\nNo Guarantee - Even If drop next day\r\n', 100, 500000, 6500, 6000, 'Aktif', 3512, 'IRVANKEDE', 'Sosial Media'),
(1046, 3513, 'Spotify', 'Spotify PlayList Followers - INSTANT [ NO REFILL ] ', 'Bot Accounts\\r\\nNo Guarantee - Even If drop next day\\r\\n', 500, 500000, 6500, 6000, 'Aktif', 3513, 'IRVANKEDE', 'Sosial Media'),
(1047, 3514, 'Spotify', 'Spotify - Plays [ CEK NOTE ] ', 'Correct format: https://open.spotify.com/track/40Zb4FZ6nS1Hj8RVfaLkCV\\\\r\\\\nDon\\\\\\\'t Order Album Link\\\\r\\\\n if your track remove, we will not refund or refill', 1000, 100000000, 17400, 16900, 'Aktif', 3514, 'IRVANKEDE', 'Sosial Media'),
(1048, 3515, 'Spotify', 'Spotify - Plays [ CEK NOTE ] S2', 'Correct format: https://open.spotify.com/track/40Zb4FZ6nS1Hj8RVfaLkCV\\r\\nDon\\\'t Order Album Link\\r\\nif your track remove, we will not refund or refill', 1000, 1000000000, 19400, 18900, 'Aktif', 3515, 'IRVANKEDE', 'Sosial Media'),
(1049, 3516, 'Spotify', 'SPOTIFY PLAYS - MAX 100K', 'Spotify Plays\\r\\nTracks + Albums', 1000, 1000000, 18300, 17800, 'Aktif', 3516, 'IRVANKEDE', 'Sosial Media'),
(1050, 3517, 'Spotify', 'Spotify Followers - INSTANT', 'LINK PROFIL ONLY', 20, 100000, 29400, 28900, 'Aktif', 3517, 'IRVANKEDE', 'Sosial Media'),
(1051, 3524, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram - Followers Max 10k  BOT NO REFILL~ 0-2Hrs  [ INSTANT]', 'NO REFILL NO REFUND', 50, 10000, 4200, 3700, 'Aktif', 3524, 'IRVANKEDE', 'Sosial Media'),
(1052, 3526, 'Instagram Likes', 'Instagram Likes - 10K/DAY [ NO REFILL ] ', 'INSTANT CAN HIGH DROP', 10, 10000, 3700, 3200, 'Aktif', 3526, 'IRVANKEDE', 'Sosial Media'),
(1053, 3527, 'Instagram Likes', 'Instagram Likes [ MAX 10K - NOREFILL ] INSTANT', 'INSTANT CAN HIGH DROP 63', 10, 10000, 5800, 5300, 'Aktif', 3527, 'IRVANKEDE', 'Sosial Media'),
(1054, 3532, 'Facebook Page Likes', 'Facebook Page Followers [ REFILL 30DAYS ] ', 'link profil only from website\r\n', 100, 50000, 83500, 83000, 'Aktif', 3532, 'IRVANKEDE', 'Sosial Media'),
(1055, 3533, 'Facebook Followers / Friends / Group Members', 'Facebook Profile Followers [ REFILL 30DAYS ] ', 'LINK PROFIL ONLY FROM WEBSITE', 100, 3000, 83500, 83000, 'Aktif', 3533, 'IRVANKEDE', 'Sosial Media'),
(1056, 3534, 'Facebook Page Likes', 'Facebook Page Likes - HQ INSTANT [ 30DAYS REFILL ] ', 'LINK PROFIL ONLY ', 100, 25000, 176500, 176000, 'Aktif', 3534, 'IRVANKEDE', 'Sosial Media'),
(1057, 3535, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - MAX 25K [ REFILL 30DAYS ] ', 'REAL MIX\r\nINSTANT', 50, 25000, 61300, 60800, 'Aktif', 3535, 'IRVANKEDE', 'Sosial Media'),
(1058, 3539, 'Twitter Views / Impressions / Live / Comments', 'Twitter Video Views - Max 100m [ Recommended ]', 'instant', 100, 100000000, 3100, 2600, 'Aktif', 3539, 'IRVANKEDE', 'Sosial Media'),
(1059, 3540, 'Tiktok Likes', 'TikTok Likes [ MAX 10K ] INSTANT', 'INSTANT', 15, 5000, 113000, 112500, 'Aktif', 3540, 'IRVANKEDE', 'Sosial Media'),
(1060, 3541, 'Tiktok Likes', 'TikTok Likes [ ADD VIDEO LINK ] MAX 20K', 'Complete URL\\\\r\\\\n', 15, 20000, 116500, 116000, 'Aktif', 3541, 'IRVANKEDE', 'Sosial Media'),
(1061, 3544, 'Youtube Likes / Comments /', 'Youtube Likes - Best Service [ MAX 7K ] ', 'INSTANT', 100, 7000, 187500, 187000, 'Aktif', 3544, 'IRVANKEDE', 'Sosial Media'),
(1062, 3545, 'Youtube Likes / Comments /', 'Youtube Video Custom Comments - INSTANT', 'Youtube Video Global Comment `\\r\\n', 5, 6000, 136800, 136300, 'Aktif', 3545, 'IRVANKEDE', 'Sosial Media'),
(1063, 3546, 'Youtube Views', 'Youtube Views [ MAX 30K ] Lifetime Guarantee', 'Retention 30 second to 5 minutes ( JIKA DAPAT  )', 1000, 300000, 23900, 23400, 'Aktif', 3546, 'IRVANKEDE', 'Sosial Media'),
(1064, 3547, 'Youtube Live Stream', 'Youtube Live Stream Views [ MAX 100K ] NO REFILL', '100% Real Human YouTube Users Viewers\\\\\\\\\\\\r\\\\nWorld-Wide Viewers\\\\r\\\\nMust be Unrestricted & Open for ALL countries\\\\r\\\\nOnly embed enabled videos allowed\\\\r\\\\n\r\nit can be included in a video that is already offline\r\n', 1000, 100000, 57400, 56900, 'Aktif', 3547, 'IRVANKEDE', 'Sosial Media'),
(1065, 3561, 'Instagram Live Video', 'Instagram Live Video Views - MAX 20K ', 'HQ Accounts\r\nALWAYS WORKING SERVICE\r\n', 20, 20000, 231500, 231000, 'Aktif', 3561, 'IRVANKEDE', 'Sosial Media'),
(1066, 3562, 'Instagram Live Video', 'Instagram Live Video View - MAX 5K', 'USERNAME ONLY !\r\nJIKA LIVE HARAP SCREEN RECORD DENGAN MENAMPILKAN JAM TGL SAAT LIVE !\r\nTIDAK DAPAT REFUND KETIKA SEDANG PROSES BERLANGSUNG DAN TIDAK DAPAT REFUND JIKA KOMPLAIN TIDAK BESERTA SCREEN RECORD LIVE ', 100, 5000, 192500, 192000, 'Aktif', 3562, 'IRVANKEDE', 'Sosial Media'),
(1067, 3563, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Poll Votes [ MAX 30K ] ', 'Link Example for Option 1: USERNAME?vote=1\r\nLink Example for Option 2: USERNAME?vote=2', 20, 30000, 97500, 97000, 'Aktif', 3563, 'IRVANKEDE', 'Sosial Media'),
(1068, 3564, 'Spotify', 'Spotify FRANCE Followers [ MAX 100K ] ', 'LINK ONLY', 100, 100000, 62600, 62100, 'Aktif', 3564, 'IRVANKEDE', 'Sosial Media'),
(1069, 3565, 'Spotify', 'Spotify FRANCE Followers [PLAYLIST] - MAX 100K', ' LINK ONLY\r\nhttps://anon.ws/?https://open.spotify.com/playlist/', 100, 5000, 62600, 62100, 'Aktif', 3565, 'IRVANKEDE', 'Sosial Media'),
(1070, 3568, 'Youtube Likes / Comments /', 'Youtube Likes [ MAX 100K ]  NO REFILL', ' NO REFILL - NO REFUND', 20, 100000, 28100, 27600, 'Aktif', 3568, 'IRVANKEDE', 'Sosial Media'),
(1071, 3569, 'Youtube Live Stream', 'Youtube Live Stream Views [ INSTANT ] ', '100% Real Human YouTube Users Viewers!\r\n100% Unique Traffic can be monetize\r\nRandom Retention\r\nviews can be send to embed disabled livestream videos', 1000, 100000, 66000, 65500, 'Aktif', 3569, 'IRVANKEDE', 'Sosial Media'),
(1072, 3570, 'Youtube Views', 'Youtube Views - MAX 100M [ REFILL 30DAYS ]', ' Retention 20-40 Second ( JIKA DAPAT )\r\n', 1000, 100000000, 29100, 28600, 'Aktif', 3570, 'IRVANKEDE', 'Sosial Media'),
(1073, 3572, 'Youtube Views', 'Youtube Views [ 20-40K/DAY ] INSTANT', 'Will show up in WATCH TIME analytics\r\nRetention random', 500, 1000000, 44500, 44000, 'Aktif', 3572, 'IRVANKEDE', 'Sosial Media'),
(1074, 3573, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Photo Likes - MAX 2K [ REFILL 30DAYS ]', 'INSTANT', 50, 2000, 32100, 31600, 'Aktif', 3573, 'IRVANKEDE', 'Sosial Media'),
(1075, 3574, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [ MAX 10K ] INSTANT START', 'No refill\r\n\r\n', 25, 10000, 54900, 54400, 'Aktif', 3574, 'IRVANKEDE', 'Sosial Media'),
(1076, 3575, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [ MAX 10K ] REFILL 30DAYS', 'INSTANT', 20, 1000, 15500, 15000, 'Aktif', 3575, 'IRVANKEDE', 'Sosial Media'),
(1077, 3576, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes - MAX 50K [ REFILL 30DAYS ] ', 'INSTANT\r\nRecommended', 50, 50000, 52000, 51500, 'Aktif', 3576, 'IRVANKEDE', 'Sosial Media'),
(1078, 3577, 'Facebook Video Views / Live Stream', 'Facebook Video Views [ 20k-50k/Day ] ', 'INSTANT', 5000, 1000000000, 10200, 9700, 'Aktif', 3577, 'IRVANKEDE', 'Sosial Media'),
(1079, 3578, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [ REAL MIX ] MAX 15K - REFILL 30DAYS', 'INSTANT', 50, 15000, 51600, 51100, 'Aktif', 3578, 'IRVANKEDE', 'Sosial Media'),
(1080, 3579, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - 1K/DAY [ REFILL 30DAYS ] INSTANT', 'Instant\\\\r\\\\nHigh Quality\\\\r\\\\n', 10, 50000, 13700, 13200, 'Aktif', 3579, 'IRVANKEDE', 'Sosial Media'),
(1081, 3580, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [ 3K/DAY ] REFILL 180DAYS', 'INSTANT', 100, 20000, 36800, 36300, 'Aktif', 3580, 'IRVANKEDE', 'Sosial Media'),
(1082, 3581, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [ MAX 15K ] REFILL 30DAYS', 'INSTANT', 50, 10000, 35000, 34500, 'Aktif', 3581, 'IRVANKEDE', 'Sosial Media'),
(1083, 3583, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [ MAX 50K ] REFILL 90DAYS', '1K-2K/day', 10, 500000, 29000, 28500, 'Aktif', 3583, 'IRVANKEDE', 'Sosial Media'),
(1084, 3585, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - 500/DAY [ REFILL 30DAYS ]', 'Real Mixed\r\nINSTANT', 50, 50000, 56200, 55700, 'Aktif', 3585, 'IRVANKEDE', 'Sosial Media'),
(1085, 3586, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - MAX 100K [ REFILL 30DAYS ] ', 'High Quality\\r\\n 2k - 3k/DAY', 25, 100000, 34600, 34100, 'Aktif', 3586, 'IRVANKEDE', 'Sosial Media');
INSERT INTO `layanan_sosmed` (`id`, `service_id`, `kategori`, `layanan`, `catatan`, `min`, `max`, `harga`, `harga_api`, `status`, `provider_id`, `provider`, `tipe`) VALUES
(1086, 3587, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - MAX 100K [ REFILL 30DAYS ] HQ', '1k - 2k Per Day Speed\r\nHigh Quality\r\n', 20, 100000, 33600, 33100, 'Aktif', 3587, 'IRVANKEDE', 'Sosial Media'),
(1087, 3589, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 10K [ REAL MIX ] NOREFILL', '10k/day\\\\r\\\\nNo refill\\\\r\\\\n', 10, 20000, 9400, 8900, 'Aktif', 3589, 'IRVANKEDE', 'Sosial Media'),
(1088, 3590, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 3K [ HQ - NO REFILL ]', 'INSTANT\r\nReal majority\r\n', 50, 2000, 20700, 20200, 'Aktif', 3590, 'IRVANKEDE', 'Sosial Media'),
(1089, 3591, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - 10K/DAY [ REAL MIX ] NO REFILL', 'Start Instant\r\n', 100, 10000, 24500, 24000, 'Aktif', 3591, 'IRVANKEDE', 'Sosial Media'),
(1090, 3592, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ MAX 10K ] INSTANT - NOREFILL', 'INSTANT SERVICE', 50, 10000, 22600, 22100, 'Aktif', 3592, 'IRVANKEDE', 'Sosial Media'),
(1091, 3594, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 1K [ NO REFILL ] ', 'INSTANT', 100, 1000, 18700, 18200, 'Aktif', 3594, 'IRVANKEDE', 'Sosial Media'),
(1092, 3595, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ MAX 5K ] REAL - INSTANT', 'INSTANT', 100, 5000, 31300, 30800, 'Aktif', 3595, 'IRVANKEDE', 'Sosial Media'),
(1093, 3596, 'Instagram Highlights / Profile Visits / Reach', 'Instagram Reach + Impressions [ INSTANT ]', 'INSTANT', 100, 5000000, 2320, 1820, 'Aktif', 3596, 'IRVANKEDE', 'Sosial Media'),
(1094, 3598, 'Instagram Likes', 'Instagram Likes [ INDIAN ] 5K/DAY', 'INSTANT', 100, 10000, 7050, 6550, 'Aktif', 3598, 'IRVANKEDE', 'Sosial Media'),
(1095, 3599, 'Instagram Likes', 'Instagram Likes - MAX 2K [ INSTANT - REAL ]', 'Real Likes', 20, 2000, 7250, 6750, 'Aktif', 3599, 'IRVANKEDE', 'Sosial Media'),
(1096, 3602, 'Instagram Likes', 'Instagram Likes - MAX 5K [ INSTANT - NOREFILL ] ', 'Real accounts\r\nAll accounts have profile pictures\r\n', 20, 5000, 15900, 15400, 'Aktif', 3602, 'IRVANKEDE', 'Sosial Media'),
(1097, 3606, 'Instagram Likes', 'Instagram Likes - MAX 3K [ Recommended ]', 'Real Users\r\n', 50, 3000, 20700, 20200, 'Aktif', 3606, 'IRVANKEDE', 'Sosial Media'),
(1098, 3607, 'Instagram Likes', 'Instagram Likes [ MAX 30K ] REAL - INSTANT', 'INSTANT', 20, 10000, 14200, 13700, 'Aktif', 3607, 'IRVANKEDE', 'Sosial Media'),
(1099, 3610, 'Telegram', 'Telegram Post View - Last 10 Posts ', 'INSTANT', 100, 35000, 7400, 6900, 'Aktif', 3610, 'IRVANKEDE', 'Sosial Media'),
(1100, 3611, 'Telegram', 'Telegram Post View - Last 20 Posts', 'INSTANT', 100, 35000, 13200, 12700, 'Aktif', 3611, 'IRVANKEDE', 'Sosial Media'),
(1101, 3612, 'Telegram', 'Telegram Post View - Last 5 Posts', 'INSTANT', 100, 35000, 4600, 4100, 'Aktif', 3612, 'IRVANKEDE', 'Sosial Media'),
(1102, 3613, 'Telegram', 'Telegram Channel Members - MAX 20K [ NO REFILL ]', 'INSTANT', 1000, 20000, 31300, 30800, 'Aktif', 3613, 'IRVANKEDE', 'Sosial Media'),
(1103, 3614, 'Telegram', 'Telegram Channel Members - MAX 10K [ NO REFILL ] ', 'Real Members\r\nNo Refill\r\n', 1000, 10000, 26500, 26000, 'Aktif', 3614, 'IRVANKEDE', 'Sosial Media'),
(1104, 3617, 'Tiktok Followers', 'Tiktok Followers [ 3k-5k/DAY ] INSTANT', 'LINK PROFIL ONLY', 100, 500000, 46200, 45700, 'Aktif', 3617, 'IRVANKEDE', 'Sosial Media'),
(1105, 3623, 'Twitter Likes', 'Twitter Likes [ MAX 15K ] NO REFILL ', 'INSTANT', 10, 15000, 58800, 58300, 'Aktif', 3623, 'IRVANKEDE', 'Sosial Media'),
(1106, 3624, 'Youtube Likes / Comments /', 'Youtube Likes [ 5K-10K/DAY ] NO REFILL - INSTANT', 'No Refill NO REFUND\r\n', 100, 100000, 18000, 17500, 'Aktif', 3624, 'IRVANKEDE', 'Sosial Media'),
(1107, 3625, 'Youtube Likes / Comments /', 'Youtube Likes - MAX 15K [ NO REFILL - INSTANT ]', 'INSTANT', 50, 15000, 32300, 31800, 'Aktif', 3625, 'IRVANKEDE', 'Sosial Media'),
(1108, 3626, 'Youtube Likes / Comments /', 'Youtube Likes [ MAX 200K ] NOREFILL - INSTANT', 'INSTANT', 20, 2000000, 15600, 15100, 'Aktif', 3626, 'IRVANKEDE', 'Sosial Media'),
(1109, 3627, 'Youtube Likes / Comments /', ' Youtube Likes - MAX 25K [ Life Time Guaranteed ]', 'Instant Likes\r\n', 20, 25000, 49500, 49000, 'Aktif', 3627, 'IRVANKEDE', 'Sosial Media'),
(1110, 3628, 'Youtube Views', 'Youtube Views [ 5K-10K/DAY ] Lifetime Guarantee', 'Retention - 2-5 minutes ( JIKA DAPAT )\\r\\nEmergency Server\\r\\n\\r\\n ', 1000, 10000000, 43500, 43000, 'Aktif', 3628, 'IRVANKEDE', 'Sosial Media'),
(1111, 3630, 'Youtube Views', 'Youtube Views [ 1K-5K/DAY ] Lifetime Guaranted', 'instant\\r\\nRetention  5-20 Minutes ( jika dapat )\\r\\n', 100, 100000, 35100, 34600, 'Aktif', 3630, 'IRVANKEDE', 'Sosial Media'),
(1112, 3631, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [5K] [LOW DROP] [1H - 1K/Day] ', 'Real Max is 5K (you can order up to 5 times each time 1000 quantity).\r\nFast\r\nLow drop\r\nNO REFILL NO REFUND (MQ ACCS)', 50, 12000, 11000, 10500, 'Aktif', 3631, 'IRVANKEDE', 'Sosial Media'),
(1113, 3632, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [10K] [LOW DROP] [1H - 1K/Day] ', 'Real Max is 10K (you can order up to 10 times each time 1000 quantity).\r\nFast\r\nLow drop\r\nNO REFILL NO REFUND (MQ ACCS)', 100, 1000, 10900, 10400, 'Aktif', 3632, 'IRVANKEDE', 'Sosial Media'),
(1114, 3633, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Real Followers -Max 1K - 0-1 Minutes ', 'Min 100\\r\\nMax 1000\\r\\nAverage Delivery Time Per 1000 : 14 minutes', 100, 10000, 12000, 11500, 'Aktif', 3633, 'IRVANKEDE', 'Sosial Media'),
(1115, 3634, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Real Followers - Max 5K - 0-30 Minutes ', 'Min 50\\r\\nMax 7500\\r\\nAverage Delivery Time Per 1000 : 39 minutes', 50, 75000, 13300, 12800, 'Aktif', 3634, 'IRVANKEDE', 'Sosial Media'),
(1116, 3635, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Real Followers -Max 2K - 0-15 Minutes ', 'Min 100\\r\\nMax 1000\\r\\nAverage Delivery Time Per 1000 : Not enough data', 100, 10000, 14100, 13600, 'Aktif', 3635, 'IRVANKEDE', 'Sosial Media'),
(1117, 3636, 'Instagram Likes', 'Instagram Likes [ 300-500/Hour ] instant NON DROP NOW', 'Speed:300-500/hour\\r\\nNo Drop as of now [ No Refill Incase drop}', 50, 5000, 9100, 8600, 'Aktif', 3636, 'IRVANKEDE', 'Sosial Media'),
(1118, 3637, 'Instagram Likes', 'Instagram Likes - MAX 3K [ REAL - NO REFILL ] ', 'No refill\\r\\nINSTANT', 50, 3000, 7000, 6500, 'Aktif', 3637, 'IRVANKEDE', 'Sosial Media'),
(1119, 3639, 'Instagram Likes', 'Instagram Likes - MAX 5K [ NO REFILL ] INSTANT', 'INSTANT\\r\\nCAN HIGH DROOP', 20, 5000, 4200, 3700, 'Aktif', 3639, 'IRVANKEDE', 'Sosial Media'),
(1120, 3640, 'Instagram Views', 'Instagram Views - INSTANT [ MAX 1M ] ', '30-50k/hour\r\nSpeed can be slow sometimes\r\n', 500, 1000000, 1899, 1399, 'Aktif', 3640, 'IRVANKEDE', 'Sosial Media'),
(1121, 3642, 'Instagram Views', 'Instagram Views - MAX 500K [ FAST - INSTANT ] ', 'Instant Start\r\n', 100, 10000000, 2210, 1710, 'Aktif', 3642, 'IRVANKEDE', 'Sosial Media'),
(1122, 3643, 'Instagram Highlights / Profile Visits / Reach', 'Instagram Impressions + Profile Visits [ MAX 50K ] ', 'LINK POST NEW ONLY\\r\\n', 100, 50000, 14500, 14000, 'Aktif', 3643, 'IRVANKEDE', 'Sosial Media'),
(1123, 3644, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - BIG ORDERS [ REFILL 30DAYS ] ', 'INSTANT', 10, 500000, 13300, 12800, 'Aktif', 3644, 'IRVANKEDE', 'Sosial Media'),
(1124, 3645, 'Instagram Likes', 'Instagram Likes - MAX 15K [ REAL - INSTANT ] ', 'Real Likes\\r\\n1k/hour\\r\\n', 50, 15000, 7600, 7100, 'Aktif', 3645, 'IRVANKEDE', 'Sosial Media'),
(1125, 3646, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TikTok Views - MAX 1M [ INSTANT ] ', 'INSTANT', 100, 1000000, 2450, 1950, 'Aktif', 3646, 'IRVANKEDE', 'Sosial Media'),
(1126, 3648, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [ MAX 10K ] REAL MIX - REFILL 30DAYS', '2K-3k/day\\r\\n', 20, 10000, 20200, 19700, 'Aktif', 3648, 'IRVANKEDE', 'Sosial Media'),
(1127, 3654, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - [ BOT, SUPERFAST, NO REFILL, MAX 15k ] INSTANT-10mins', ' INSTANT START BOT PROFILE BIG DROPS NO REFILL', 10, 15000, 4450, 3950, 'Aktif', 3654, 'IRVANKEDE', 'Sosial Media'),
(1128, 3655, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers + 100% Reach + Impressions + Profile Visits - [ Max - 10K ] [ NO Refill - BOT ]', 'Instagram Followers + 100% Reach + Impressions + Profile Visits - [ Max - 10K ] [ NO Refill - BOT ] [ FASTEST ] INSTANT.', 10, 100002, 4950, 4450, 'Aktif', 3655, 'IRVANKEDE', 'Sosial Media'),
(1129, 3656, 'TikTok  Views, Komentar , Like Komentar &Share ', 'Tiktok - Views[ 30k-50k/day ] [ Superfast ] INSTANT-2HRS', 'Tiktok - Views S1 [ 30k-50k/day ] [ Superfast ] INSTANT-2HRS', 100, 1000000, 3350, 2850, 'Aktif', 3656, 'IRVANKEDE', 'Sosial Media'),
(1130, 3657, 'Instagram Views', 'Instagram Views - [ Max - 250M ] [ SUPERFAST ] SUPER INSTANT', ' Superfast! Order Will Be Start Instant, Per Hour Speed 1.5M!\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\r\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nUNLIMITED!', 1000, 2147483647, 1640, 1140, 'Aktif', 3657, 'IRVANKEDE', 'Sosial Media'),
(1131, 3658, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TikTok Views - Min 100 - MAX 100K', ' 1m/hour\r\nmin 100 max 50000', 100, 1000000, 2900, 2400, 'Aktif', 3658, 'IRVANKEDE', 'Sosial Media'),
(1132, 3659, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers Min 10 and Max 100k [Auto Refill 30 days]', '30 days guarantee\\\\r\\\\nauto refill\\\\r\\\\n1-3k/day', 100, 100000, 14700, 14200, 'Aktif', 3659, 'IRVANKEDE', 'Sosial Media'),
(1133, 3660, 'TikTok  Views, Komentar , Like Komentar &Share ', 'Tiktok Views EMERGENCY SUPER FAST', '1 MILOIN PER MINUTE', 100, 10000000, 7000, 6500, 'Aktif', 3660, 'IRVANKEDE', 'Sosial Media'),
(1134, 3662, 'Instagram Followers Indonesia', 'INSTAGRAM FOLLOWERS INDONESIA SUPER FAST 20K REAL', 'INSTAGRAM FOLLOWERS INDONESIA SUPER FAST 1K', 100, 20000, 33500, 33000, 'Aktif', 3662, 'IRVANKEDE', 'Sosial Media'),
(1135, 3666, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [ 99 Days Refill ] [50K]', ' 99 days refill Drop 0-5% [ Sometimes the drop can go upto 30-40%] ,Refill Start time - 24-48 hours [ When overloaded 72 hours],IF you drip feed and orders overlap, we do not guarantee it.', 10, 5000000, 18300, 17800, 'Aktif', 3666, 'IRVANKEDE', 'Sosial Media'),
(1136, 3675, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Like [ MAX 10K ] REFILL 30DAYS', 'INSTANT\\r\\nPLEASE INPUT LINK FROM WEB/BROWSER. DON\\\'T LINK APK MOBILE ', 10, 10000, 20250, 19750, 'Aktif', 3675, 'IRVANKEDE', 'Sosial Media'),
(1137, 3677, 'Facebook Video Views / Live Stream', 'Facebook Live Stream Views [ 30 minutes ] - CEK NOTED', 'TARGET ORDER JANGAN GUNAKAN = link mobile m.facebook.com ATAU facebook.com/watch/live/?v=id\\r\\nHANYA GUNAKAN TARGET = https://www.facebook.com/user(or IDuser)/videos/ID', 50, 2000, 102500, 102000, 'Aktif', 3677, 'IRVANKEDE', 'Sosial Media'),
(1138, 3680, 'Instagram Likes', 'Instagram Likes [ MAX 5K ] REAL - INSTANT', 'No Refill\r\nStart Instant\r\n', 10, 5000, 4100, 3600, 'Aktif', 3680, 'IRVANKEDE', 'Sosial Media'),
(1139, 3682, 'Instagram Likes', 'Instagram Likes 100% Real [ TURKEY + ASIA ] INSTANT', 'turkey - asia targeted\\r\\n', 20, 50000, 5400, 4900, 'Aktif', 3682, 'IRVANKEDE', 'Sosial Media'),
(1140, 3683, 'Instagram Likes', 'Instagram Likes Real [ Indian + Arab Country ] NO REFILL', '100% real\r\nIndian and Arab User\r\n', 20, 5000, 11100, 10600, 'Aktif', 3683, 'IRVANKEDE', 'Sosial Media'),
(1141, 3684, 'Instagram Followers Indonesia', 'Instagram Followers AKTIP Indonesia SPECIAL CHEAP [ 15K ] ', 'PROSES 1-2 HARI YA . DI JAMIN SUKSES NO REFILL NO REFUND AKUN REAL DARI AUTO FOLLOWERS GAK USAH TAKUT ', 100, 15000, 19500, 19000, 'Aktif', 3684, 'IRVANKEDE', 'Sosial Media'),
(1142, 3688, 'Youtube Views', 'Youtube views [ 10K-15K/DAY ] Lifetime Guaranted - Recommended', 'instant \r\nRecommended', 1000, 10000000, 27500, 27000, 'Aktif', 3688, 'IRVANKEDE', 'Sosial Media'),
(1143, 3689, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ 2-4K/DAY ] NO REFILL ', 'CAN HIGH DROP\\r\\nINSTANT', 10, 10000, 8300, 7800, 'Aktif', 3689, 'IRVANKEDE', 'Sosial Media'),
(1144, 3691, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ REAL + MIX ] INSTANT', 'instant', 100, 500, 14500, 14000, 'Aktif', 3691, 'IRVANKEDE', 'Sosial Media'),
(1145, 3692, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 50K [ NO REFILL - 10K/DAY ] ', 'INSTANT FAST', 10, 50000, 13800, 13300, 'Aktif', 3692, 'IRVANKEDE', 'Sosial Media'),
(1146, 3696, 'Tiktok Followers', 'TikTok Followers [ 10K/DAY ] NO REFILL - LQ', 'No Refill\\\\\\\\r\\\\\\\\nINSTANT', 20, 100000, 7700, 7200, 'Aktif', 3696, 'IRVANKEDE', 'Sosial Media'),
(1147, 3697, 'Tiktok Followers', 'TikTok Followers [ 5K/DAY ] REFILL 30DAYS ', 'INSTANT\\\\r\\\\nGUARANTED 30DAYS', 50, 5000, 20200, 19700, 'Aktif', 3697, 'IRVANKEDE', 'Sosial Media'),
(1148, 3698, 'Instagram Likes', 'Instagram Likes - MAX 10K [ LESS DROP - INSTANT ] ', '100-300/hour\r\nINSTANT', 100, 5000, 14000, 13500, 'Aktif', 3698, 'IRVANKEDE', 'Sosial Media'),
(1149, 3700, 'Instagram Likes', 'Instagram Likes [ 200-300/HOUR ] INSTANT FAST', 'Instant Start !\r\nReal + Bot', 20, 50000, 11400, 10900, 'Aktif', 3700, 'IRVANKEDE', 'Sosial Media'),
(1150, 3702, 'Instagram Likes', 'Instagram Likes [ 1K-2K/HOURS ] REAL - INSTANT', 'INSTANT\r\nFAST', 50, 3000, 12700, 12200, 'Aktif', 3702, 'IRVANKEDE', 'Sosial Media'),
(1151, 3703, 'Instagram Likes', 'Instagram Likes [ MAX 5K ] REAL - FAST', 'instant\r\nno refill', 100, 5000, 8500, 8000, 'Aktif', 3703, 'IRVANKEDE', 'Sosial Media'),
(1152, 3706, 'Youtube Watchtime', 'Youtube Watchtime [ 4000 Hours ] [ 30DAYS REFILL ] CEK NOTE', 'PLEASE INPUT 1 hour+ video link\r\nDON\'T FOR LIVE STREAMING VIDEO\r\n7 day to finish 4000 hour\r\n', 100, 4000, 126500, 126000, 'Aktif', 3706, 'IRVANKEDE', 'Sosial Media'),
(1153, 3708, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TIKTOK KOMENTAR [250] ACCOUNT REAL INDONESIA', 'ISI LINK POSTINGAN TARGET YANG INGIN DI KOMEN  TERUS KOLOM KOMEN SESUKA KALIAN , KLIK ENTER UNTUK KOMENAN SELANJUTNYA /  KLIK ENTER UNTUK KOMEN LEBIH DARI 1 KOMENTAR HARGA MURAH Y', 5, 250, 301500, 301000, 'Aktif', 3708, 'IRVANKEDE', 'Sosial Media'),
(1154, 3709, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TIKTOK LIKE KOMENTAR [250] ACCOUNT REAL INDONESIA ', 'ISI TARGET DENGAN USERNAME TIKTOK YANG KOMEN DI POSTINGAN , DAN ISI LINK DENGAN LINK POSTINGAN YANG SUDAH ANDA KOMEN AGAR KOMEN ANDA KAMI LIKE ', 5, 250, 51500, 51000, 'Aktif', 3709, 'IRVANKEDE', 'Sosial Media'),
(1155, 3713, 'Instagram Live Video', 'Instagram Live Viewers For 60 Minutes [ CEK NOTED ]', 'Enter username without @\r\nLakukan pemesanan setelah siaran langsung dari Perangkat yang berbeda\r\nJangan jeda sesi live\r\nAmbil bukti Screenshot RECORD jika tampilan langsung gagal untuk masalah terkait pengembalian dana.', 20, 2000, 221500, 221000, 'Aktif', 3713, 'IRVANKEDE', 'Sosial Media'),
(1156, 3714, 'Instagram Live Video', 'Instagram Live Video Views - Likes and Comments also [ CEK NOTED ] ', '\r\n\r\n \r\nStarts within 1-2 mints after ordering\r\nEnter username without @\r\nLIVE DULU BARU SUBMIT\r\nLIKE DAN COMMENT RANDOM\r\nJIKA ADA MASALAH HARAP SERTAKAN SCREENRECORD UNTUK KOMPLAIN ', 20, 30000, 221500, 221000, 'Aktif', 3714, 'IRVANKEDE', 'Sosial Media'),
(1157, 3715, 'Facebook Page Likes', 'Facebook Real Page Likes + Followers [ 800-1K/DAY ] ', 'LINK PROFIL PAGE ONLY\r\nDON\'T MAKE PRIVATE FOLLOWER & LIKE PAGE ', 20, 50000, 122500, 122000, 'Aktif', 3715, 'IRVANKEDE', 'Sosial Media'),
(1158, 3716, 'Facebook Followers / Friends / Group Members', 'FB Profile Followers (Indonesian) ', 'LINK PROFIL ONLY\\r\\nDON\\\'T MAKE PRIVATE ACCOUNT', 50, 100, 58800, 58300, 'Aktif', 3716, 'IRVANKEDE', 'Sosial Media'),
(1159, 3717, 'Facebook Followers / Friends / Group Members', 'FB Profile Followers (Bangladesh) ', 'LINK PROFIL ONLY\r\nDON\'T MAKE PRIVATE ACCOUNT', 50, 5000, 58800, 58300, 'Aktif', 3717, 'IRVANKEDE', 'Sosial Media'),
(1160, 3718, 'Facebook Followers / Friends / Group Members', 'FB Profile Followers (Philippines)', 'LINK PROFIL ONLY\r\nDON\'T MAKE PRIVATE ACCOUNT', 50, 3000, 58800, 58300, 'Aktif', 3718, 'IRVANKEDE', 'Sosial Media'),
(1161, 3719, 'Facebook Followers / Friends / Group Members', 'FB Profile Followers (Vietnam)', 'NK PROFIL ONLY\r\nDON\'T MAKE PRIVATE ACCOUNT', 50, 3000, 58800, 58300, 'Aktif', 3719, 'IRVANKEDE', 'Sosial Media'),
(1162, 3723, 'Youtube Subscribers ', 'Youtube Subscriber [ UP 20-100/DAY ] REFILL 30DAYS', 'LINK CHANEL ONLY \r\n', 5, 1500, 365000, 364500, 'Aktif', 3723, 'IRVANKEDE', 'Sosial Media'),
(1163, 3724, 'Youtube Subscribers ', 'Youtube Subscriber - MAX 1.5K [ UP 30-50/DAY ] REFILL 30DAYS', 'Instant Start\r\nYou can add new order after your order complete. Actual maximum is 80.000\r\nLINK CHANEL ONLY', 5, 1500, 371500, 371000, 'Aktif', 3724, 'IRVANKEDE', 'Sosial Media'),
(1164, 3728, 'Instagram Likes Indonesia', 'Instagram Likes Photo / Video / TV / REEL Indonesia [5K] [REAL ACCOUNT]', 'LIKES REAL BISA LIKES POSTINGAN VIDEO POSTINGAN IG TV', 100, 5000, 18500, 18000, 'Aktif', 3728, 'IRVANKEDE', 'Sosial Media'),
(1165, 3729, 'Facebook Page Likes', 'Facebook Fan Page Likes + Followers [ MAX 200K ] REFILL 30DAYS', 'PLEASE INPUT LINK FROFIL PAGE DON\'T FROM MOBILE APP\r\nMAYBE DROP because real users\r\nBUT GUARANTED ', 20, 10000, 69000, 68500, 'Aktif', 3729, 'IRVANKEDE', 'Sosial Media'),
(1166, 3731, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ Real Indian + Asian ] NO REFILL - LESS DROP', '3-5k/day\\r\\nno refill\\r\\nReal accounts Asians with majority Indians\\r\\n', 50, 50000, 20000, 19500, 'Aktif', 3731, 'IRVANKEDE', 'Sosial Media'),
(1167, 3732, 'Instagram Views', 'Instagram Views - MAX 5M [ INSTANT - FAST ] ', 'INSTANT', 100, 500000, 1750, 1250, 'Aktif', 3732, 'IRVANKEDE', 'Sosial Media'),
(1168, 3733, 'Twitter Likes', 'Twitter Like [USA account] [ REFILL 30DAYS ] ', 'Up to 500-1k/day\r\nUSA accounts [ Mix Quality]\r\n', 20, 10000, 29500, 29000, 'Aktif', 3733, 'IRVANKEDE', 'Sosial Media'),
(1169, 3734, 'Twitter Followers', 'Twitter Followers - USA accounts [ REFILL 60DAYS ] ', 'USA accounts [ Mix Quality]\r\n', 10, 10000, 243000, 242500, 'Aktif', 3734, 'IRVANKEDE', 'Sosial Media'),
(1170, 3735, 'Twitter Followers', 'Twitter Followers - MAX 10K [ REFILL 30DAYS ] ', ' USA accounts\r\nSpeed Up to 500-1k/day\r\n', 10, 10000, 159500, 159000, 'Aktif', 3735, 'IRVANKEDE', 'Sosial Media'),
(1171, 3736, 'Instagram Likes', 'Instagram likes [ 10K/DAY ] INSTANT - NO REFILL', 'INSTANT', 10, 10000, 4300, 3800, 'Aktif', 3736, 'IRVANKEDE', 'Sosial Media'),
(1172, 3737, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Random Comments [Worldwide ] - REFILL 30DAYS', 'Real + Mix\r\nSpeed - 200+Day\r\n', 10, 1000, 448500, 448000, 'Aktif', 3737, 'IRVANKEDE', 'Sosial Media'),
(1173, 3738, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook CUSTOM Comments [Worldwide ] - REFILL 30DAYS', 'SATU KALIMAT SATU BARIS \r\nReal + Mix\r\nSpeed - 200+Day\r\n', 10, 1000, 537000, 536500, 'Aktif', 3738, 'IRVANKEDE', 'Sosial Media'),
(1174, 3739, 'Facebook Followers / Friends / Group Members', 'Facebook Real Followers [ 1K/DAY ] REFILL 15DAYS', 'LINK PROFIL ONLY, FROM FACEBOOK BROWSER\r\nMAKE PUBLIC ACCOUNT', 100, 10000, 34500, 34000, 'Aktif', 3739, 'IRVANKEDE', 'Sosial Media'),
(1175, 3740, 'Facebook Followers / Friends / Group Members', 'Facebook Followers [ 1K-2K/DAY ] REFILL 30DAYS', 'LINK PROFIL ONLY , FROM FACEBOOK BROWSER\r\n', 100, 20000, 40500, 40000, 'Aktif', 3740, 'IRVANKEDE', 'Sosial Media'),
(1176, 3741, 'Instagram Story Indonesia', 'Instagram ALL STORY INDONESIA [2K] INPUT ONLY INSTAGRAM', 'AKUN BOT+REAL , ALL STORY INPUT USERNAME', 100, 2000, 6500, 6000, 'Aktif', 3741, 'IRVANKEDE', 'Sosial Media'),
(1177, 3742, 'ZPRIVAT NOTE ORDER', 'PRIVAT JANGAN ORDER 12000', 'Username only', 100, 2000, 14500, 14000, 'Aktif', 3742, 'IRVANKEDE', 'Sosial Media'),
(1178, 3744, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'PRODUK 500 TERJUAL 1 ULASAN 1 RATING [ BACA DESKRIPSI JANGAN ASAL ORDER] ', 'username | password | Link Produk \\r\\nsilahkan baca deskripsi dan ketentuan disini https://followersindo.net/tutorial/', 500, 500, 551500, 551000, 'Aktif', 3744, 'IRVANKEDE', 'Sosial Media'),
(1179, 3745, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'PRODUK 1000 TERJUAL 1 ULASAN 1 RATING [ BACA DESKRIPSI JANGAN ASAL ORDER] ', 'username | password | Link Produk \r\nsilahkan baca deskripsi dan ketentuan disini https://followersindo.net/tutorial/', 1000, 1000, 451500, 451000, 'Aktif', 3745, 'IRVANKEDE', 'Sosial Media'),
(1180, 3746, 'Youtube Views', 'Youtube Views [ 5K-10K/DAY ] Lifetime Guaranteed', 'NOT FOR VIDEO STREAMING\\r\\nLifetime Guarantee\\r\\n', 100, 10000000, 17400, 16900, 'Aktif', 3746, 'IRVANKEDE', 'Sosial Media'),
(1181, 3747, 'Youtube Likes / Comments /', 'Youtube Likes - MAX 100K [ REFILL 30DAYS ] ', '30 days guarantee\r\n', 50, 100000, 22100, 21600, 'Aktif', 3747, 'IRVANKEDE', 'Sosial Media'),
(1182, 3748, 'Youtube Likes / Comments /', 'Youtube Likes - MAX 50K [ REFILL 30DAYS ] ', 'INSTANT', 10, 25000, 38900, 38400, 'Aktif', 3748, 'IRVANKEDE', 'Sosial Media'),
(1183, 3749, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - MAX 20K [ GUARANTEED 30DAYS ] ', 'INSTANT\r\nSpeed - 2-5k/day\r\n', 50, 20000, 13400, 12900, 'Aktif', 3749, 'IRVANKEDE', 'Sosial Media'),
(1184, 3750, 'Spotify', 'Spotify Plays [ 5K-10K/DAY ] - 100% REAL', 'INSTANT', 5000, 1000000, 20300, 19800, 'Aktif', 3750, 'IRVANKEDE', 'Sosial Media'),
(1185, 3751, 'Instagram Comments', 'Instagram Comments Likes - MAX 5K', 'Instagram Comments Likes\\\\r\\\\nRANDOM ACCOUNT\\r\\nSILAHKAN INPUT LINK POST DAN USERNAME AKUN YANG BERKOMENTAR ', 10, 5000, 7000, 6500, 'Aktif', 3751, 'IRVANKEDE', 'Sosial Media'),
(1186, 3752, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views - MAX 3K [ All Story ]', 'INPUT USERNAME PROFILE', 100, 5000, 2800, 2300, 'Aktif', 3752, 'IRVANKEDE', 'Sosial Media'),
(1187, 3753, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views - All Story [ MAX 20K ] ', 'INPUT USERNAME PROFILE ONLY', 100, 20000, 2060, 1560, 'Aktif', 3753, 'IRVANKEDE', 'Sosial Media'),
(1188, 3754, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impression - 100K/DAY [ INSTANT ] ', 'INSTANT', 100, 1000000, 3600, 3100, 'Aktif', 3754, 'IRVANKEDE', 'Sosial Media'),
(1189, 3755, 'Instagram Story / Impressions / Saves /  Reach', 'Ä°nstagram All Views Story - MAX 5K', 'INPUT USERNAME PROFILE ONLY', 100, 5000, 10400, 9900, 'Aktif', 3755, 'IRVANKEDE', 'Sosial Media'),
(1190, 3756, 'Facebook Video Views / Live Stream', 'Facebook Video Views - INSTANT [ FAST ] ', 'Only Facebook Desktop link Support !!!\r\nJANGAN GUNAKAN LINK = https://m.facebook.com/story.php?story_fbid=663516740711263&id=100011588298861\r\nGUNAKAN LAH LINK = https://www.facebook.com/tha.mayor/posts/663516740711263', 500, 100000000, 5800, 5300, 'Aktif', 3756, 'IRVANKEDE', 'Sosial Media'),
(1191, 3759, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', '  Shopee Likes Indonesia Bot [5K] Shopee Favorite / Like Produk Indonesia [TERMURAH] CEK NOTE', 'CONTOH LINK  https://shopee.co.id/DIXON-~Kaos-Pria-Kerah-List-Polo-Terbaru-i.66010373.6584131982', 100, 5000, 6500, 6000, 'Aktif', 3759, 'IRVANKEDE', 'Sosial Media'),
(1192, 3760, 'Instagram Reels Views/Likes/Comments', 'Instagram Reels Views [ Max 1M ] Instant', 'link reels only', 250, 10000000, 1950, 1450, 'Aktif', 3760, 'IRVANKEDE', 'Sosial Media'),
(1193, 3761, 'Instagram Reels Views/Likes/Comments', 'Instagram Reels Views - 5M/Day', 'instant', 250, 500000000, 1890, 1390, 'Aktif', 3761, 'IRVANKEDE', 'Sosial Media'),
(1194, 3762, 'Instagram Reels Views/Likes/Comments', 'Instagram Reels Views [ 1M/DAY ] INSTANT - FAST', 'LINK REELS ONLY', 100, 10000000, 1790, 1290, 'Aktif', 3762, 'IRVANKEDE', 'Sosial Media'),
(1195, 3763, 'Instagram Reels Views/Likes/Comments', 'Instagram Reels Likes [ MAX 50K ] Instant', 'HIGH QUALITY\r\nREAL ACCOUNTS\r\n', 50, 50000, 40200, 39700, 'Aktif', 3763, 'IRVANKEDE', 'Sosial Media'),
(1196, 3764, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 10K [ Real Accounts + Mix] NO REFILL', '10k/day\r\nNo refill service \r\n', 10, 70000, 9300, 8800, 'Aktif', 3764, 'IRVANKEDE', 'Sosial Media'),
(1197, 3765, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ MAX 30K ] NO REFILL - INSTANT', 'No refill\r\n5k-10k/day', 50, 30000, 11800, 11300, 'Aktif', 3765, 'IRVANKEDE', 'Sosial Media'),
(1198, 3767, 'Youtube Views', 'Youtube Views - MAX 1M [ 30 Days Refill ] ', '30 DAY GUARANTED\\r\\nDONT FOR STREAMING VIDEO', 100, 10000000, 24800, 24300, 'Aktif', 3767, 'IRVANKEDE', 'Sosial Media'),
(1199, 3768, 'Facebook Page Likes', 'Facebook Page Likes [ MAX 250K ] INSTANT - NO REFILL', 'PLEASE INPUT LINK FROM BROWSER\r\nNOT LINK FROM APK MOBILE', 100, 500000, 14650, 14150, 'Aktif', 3768, 'IRVANKEDE', 'Sosial Media'),
(1200, 3769, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes - MAX 50K [ NO REFILL ] ', 'INSTANT\r\nPLEASE INPUT LINK FROM BROWSER\r\nNOT LINK FROM APK MOBILE', 100, 100000, 8700, 8200, 'Aktif', 3769, 'IRVANKEDE', 'Sosial Media'),
(1201, 3770, 'Facebook Video Views / Live Stream', 'Facebook Story Views [ MAX 50K ] ', 'INPUT LINK STORY', 100, 50000, 40400, 39900, 'Aktif', 3770, 'IRVANKEDE', 'Sosial Media'),
(1202, 3771, 'Facebook Video Views / Live Stream', 'Facebook Live Stream Views ( 30 Min )', 'Link Format accepted:\r\nhttps://www.facebook.com/watch/?v=\r\nhttps://www.facebook.com/qaderkill/videos/4217814588239606/\r\nLayanan tidak memiliki hitungan mulai, Status mungkin menunjukkan tertunda tetapi pesanan akan berjalan, ', 50, 1000, 75800, 75300, 'Aktif', 3771, 'IRVANKEDE', 'Sosial Media'),
(1203, 3772, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TIKTOK VIEW LIVE INDONESIA ', 'INPUT USERNAME', 10, 100, 121500, 121000, 'Aktif', 3772, 'IRVANKEDE', 'Sosial Media'),
(1204, 3773, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TIKTOK LIKE LIVE STREAM INDONESIA ', 'INPUT USERNAME ONLY', 10, 100, 31500, 31000, 'Aktif', 3773, 'IRVANKEDE', 'Sosial Media'),
(1205, 3774, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TIKTOK COMMENT LIVE STREAM ', 'input usernam dan coments', 10, 100, 351500, 351000, 'Aktif', 3774, 'IRVANKEDE', 'Sosial Media'),
(1206, 3775, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [ MAX 30K ] MIX - REFILL 30DAYS', 'INSTANT', 50, 30000, 12800, 12300, 'Aktif', 3775, 'IRVANKEDE', 'Sosial Media'),
(1207, 3776, 'ORDER WEBISITE/DOMAIN/JASA FIX/DAN OPER IRVANKEDE', 'ORDER WEBSITE SMM FULL DOMAIN HOSTING ', 'ISI TARGET NO WA KALIAN CONTOH WEBSITE https://demosmm.com USER LOGIN demosmm PASSWORD demosmm', 1000, 1000, 1001500, 1001000, 'Aktif', 3776, 'IRVANKEDE', 'Sosial Media'),
(1208, 3777, 'ORDER WEBISITE/DOMAIN/JASA FIX/DAN OPER IRVANKEDE', 'JASA FIX WEBSITE EROR', 'ISI NOMOR WA KALIAN', 1000, 1000, 251500, 251000, 'Aktif', 3777, 'IRVANKEDE', 'Sosial Media'),
(1209, 3778, 'ORDER WEBISITE/DOMAIN/JASA FIX/DAN OPER IRVANKEDE', 'JASA OPER WEBSITE KALIAN KE IRVANKEDE GRATISSSSS', 'ISI NOMOR WA KALIAN', 1000, 1000, 1500, 1000, 'Aktif', 3778, 'IRVANKEDE', 'Sosial Media'),
(1210, 3779, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 20K [ NO REFILL - INSTANT ] ', 'CAN HIGH DROP\\r\\nInstant start and Instant Complete\\r\\n', 20, 20000, 5400, 4900, 'Aktif', 3779, 'IRVANKEDE', 'Sosial Media'),
(1211, 3780, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [ MAX 200K ] REFILL 30DAYS ', 'REAL MIX\r\nINSTANT', 10, 200000, 10300, 9800, 'Aktif', 3780, 'IRVANKEDE', 'Sosial Media'),
(1212, 3782, 'Youtube Subscribers ', 'Youtube Subscriber - 2K/Day [ REFILL 30 DAYS ] ', 'Speed - 2K/day\r\n24 HOURS START\r\n', 5000, 10000, 741500, 741000, 'Aktif', 3782, 'IRVANKEDE', 'Sosial Media'),
(1213, 3783, 'Facebook Page Likes', 'Facebook Fan Page Likes [ MAX 100K ] GUARANTED 30DAYS', 'SUBMIT LINK FROM WEB BROWSER, DON\'T WITH LINK APK MOBILE\r\nINSTAT', 100, 100000, 32300, 31800, 'Aktif', 3783, 'IRVANKEDE', 'Sosial Media'),
(1214, 3784, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee Feed Like Bot Indonesia NEW NONDROP [6K]', 'non drop', 100, 5000, 5400, 4900, 'Aktif', 3784, 'IRVANKEDE', 'Sosial Media'),
(1215, 3785, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee Feed Comment Random Indonesia new [100K] ', 'masukan link', 100, 100001, 10500, 10000, 'Aktif', 3785, 'IRVANKEDE', 'Sosial Media'),
(1216, 3791, 'Instagram Reels Views/Likes/Comments', 'Instagram Reels Likes - 5K/DAY [ INSTANT ]', '5k/day', 50, 5000, 7900, 7400, 'Aktif', 3791, 'IRVANKEDE', 'Sosial Media'),
(1217, 3792, 'Instagram Likes', 'Instagram Likes [ 2K - 5K/DAY ] INSTANT - REAL', 'Real Looking accounts with post.\r\nNo Refill\r\n', 20, 75000, 7600, 7100, 'Aktif', 3792, 'IRVANKEDE', 'Sosial Media'),
(1218, 3793, 'Instagram Views', 'Instagram Views [ 1M/HOURS ] ', 'INSTANT', 100, 1000000, 1750, 1250, 'Aktif', 3793, 'IRVANKEDE', 'Sosial Media'),
(1219, 3794, 'Instagram TV', 'Instagram TV Views - MAX 1M [ INSTANT ] ', 'Full TV Video Link Needed', 100, 10000000, 1760, 1260, 'Aktif', 3794, 'IRVANKEDE', 'Sosial Media'),
(1220, 3795, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoT', 'Shopee Followers SERVER 2 [ MAX 2K BEDA DB DENGAN S1 ] ', 'LEBIH CEPAT DI BANDING S1', 100, 2000, 26500, 26000, 'Aktif', 3795, 'IRVANKEDE', 'Sosial Media'),
(1221, 3796, 'Twitter Likes', 'Twitter Likes [ MAX 1K ] NO REFILL', 'INSTANT', 10, 1000, 12100, 11600, 'Aktif', 3796, 'IRVANKEDE', 'Sosial Media'),
(1222, 3797, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ MAX 100K ] INSTANT - NO REFILL', 'No refill\r\nless drop\r\n', 50, 100000, 7800, 7300, 'Aktif', 3797, 'IRVANKEDE', 'Sosial Media'),
(1223, 3799, 'Youtube Live Stream', 'Youtube Live Stream Views [ MAX 500K ] NO REFILL', ' NO REFILL SERVICE \r\nINSTANT IF NOT UPDATE ', 1000, 500000, 38500, 38000, 'Aktif', 3799, 'IRVANKEDE', 'Sosial Media'),
(1224, 3800, 'Instagram TV', 'IGTV Views + Reach & Impressions [ MAX 10M ] ', 'INSTANT', 100, 1000000, 2600, 2100, 'Aktif', 3800, 'IRVANKEDE', 'Sosial Media'),
(1225, 3801, 'Instagram TV', 'Instagram TV Views - MAX 10M [ INSTANT ] ', 'IGTV ONLY', 100, 10000000, 1750, 1250, 'Aktif', 3801, 'IRVANKEDE', 'Sosial Media'),
(1226, 3802, 'Instagram TV', 'IGTV Views + Impressions + Profile Visit - MAX 500K [ INSTANT ] ', 'INSTANT', 100, 10000000, 2220, 1720, 'Aktif', 3802, 'IRVANKEDE', 'Sosial Media'),
(1227, 3803, 'Youtube Likes / Comments /', 'Youtube Shares - MAX 250K [LIFETIME GUARANTEE]', 'Put Link Of Video - Real\r\nLIFETIME GUARANTEE', 1000, 250000, 21800, 21300, 'Aktif', 3803, 'IRVANKEDE', 'Sosial Media'),
(1228, 3804, 'Youtube Likes / Comments /', 'Youtube Likes [ MAX 50K ] NO REFILL', 'NO REFILL\r\nINSTANT', 50, 50000, 12700, 12200, 'Aktif', 3804, 'IRVANKEDE', 'Sosial Media'),
(1229, 3805, 'Youtube Views', 'Youtube Views - MAX 1M [ NO REFILL - INSTANT ] ', 'NO REFILL', 1000, 10000000, 11700, 11200, 'Aktif', 3805, 'IRVANKEDE', 'Sosial Media'),
(1230, 3806, 'Youtube Views', 'Youtube Views [ MAX 10M ] REFILL 30DAYS ', 'INSTANT \r\nREFILL 30DAYS', 100, 100000000, 18950, 18450, 'Aktif', 3806, 'IRVANKEDE', 'Sosial Media'),
(1231, 3808, 'Instagram Reels Views/Likes/Comments', 'Instagram Reel Views - MAX 10M [ INSTANT ] ', 'REELS VIDEO ONLY', 100, 10000000, 1750, 1250, 'Aktif', 3808, 'IRVANKEDE', 'Sosial Media'),
(1232, 3809, 'Instagram Reels Views/Likes/Comments', 'Instagram Reel Views + Reach [ MAX 5M ] ', 'INSTANT\r\nREELS VIDEO ONLY', 100, 10000000, 2020, 1520, 'Aktif', 3809, 'IRVANKEDE', 'Sosial Media'),
(1233, 3810, 'Instagram Reels Views/Likes/Comments', 'Instagram Reel Views - MAX 1M [ INSTANT ] ', 'REELS VIDEO ONLY', 200, 1000000, 2120, 1620, 'Aktif', 3810, 'IRVANKEDE', 'Sosial Media'),
(1234, 3812, 'Instagram Reels Views/Likes/Comments', 'Instagram Reel Views + Reach & Impressions [ MAX 10M ] ', 'INSTANT\r\nREELS VIDEO ONLY', 100, 1000000, 2580, 2080, 'Aktif', 3812, 'IRVANKEDE', 'Sosial Media'),
(1235, 3813, 'Instagram Reels Views/Likes/Comments', 'Instagram Reel Saves [ MAX 100K ] ', 'INSTANT\r\nREELS VIDEO ONLY', 20, 100000, 2090, 1590, 'Aktif', 3813, 'IRVANKEDE', 'Sosial Media'),
(1236, 3814, 'Instagram Reels Views/Likes/Comments', 'Instagram Reel Impressions + Profile Visits + Reach  [ MAX 100M ] ', 'INSTANT\r\nREELS VIDEO ONLY', 100, 100000000, 5400, 4900, 'Aktif', 3814, 'IRVANKEDE', 'Sosial Media'),
(1237, 3815, 'Instagram Reels Views/Likes/Comments', 'Instagram Reel Impressions + Reach + Profile Visits [ MAX 25K ] ', 'INSTANT\r\nREELS VIDEO ONLY', 25, 250000, 3900, 3400, 'Aktif', 3815, 'IRVANKEDE', 'Sosial Media'),
(1238, 3816, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 10K [ NO REFILL SERVICE ] ', 'NO REFILL\r\nCAN HIGH DROP', 50, 10000, 3200, 2700, 'Aktif', 3816, 'IRVANKEDE', 'Sosial Media'),
(1239, 3817, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 50K [ REAL - NOREFILL ] ', 'INSTANT\r\nNO REFILL - NO REFUND', 50, 50000, 7200, 6700, 'Aktif', 3817, 'IRVANKEDE', 'Sosial Media'),
(1240, 3818, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - 8K/DAY [ NOREFILL ] ', 'INSTANT \r\nNO REFILL SERVICE ', 50, 30000, 9600, 9100, 'Aktif', 3818, 'IRVANKEDE', 'Sosial Media'),
(1241, 3819, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 1K [ NO REFILL ] INSTANT', 'NO REFILL - NO REFUND ', 100, 1000, 9800, 9300, 'Aktif', 3819, 'IRVANKEDE', 'Sosial Media'),
(1242, 3820, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 5K [ INSTANT - NOREFILL ] ', 'REAL USER\r\nINSTANT', 100, 100000, 10800, 10300, 'Aktif', 3820, 'IRVANKEDE', 'Sosial Media'),
(1243, 3821, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ 6K/DAY ] REAL USER - NO REFILL', 'INSTANT\r\nREAL USERS', 50, 100000, 9900, 9400, 'Aktif', 3821, 'IRVANKEDE', 'Sosial Media'),
(1244, 3822, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Save [ MAX 150K ] INSTANT', 'INSTANT', 100, 150000, 1970, 1470, 'Aktif', 3822, 'IRVANKEDE', 'Sosial Media'),
(1245, 3823, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions + Reach [ MAX 250K ] ', 'INSTANT', 25, 500000, 1990, 1490, 'Aktif', 3823, 'IRVANKEDE', 'Sosial Media'),
(1246, 3824, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Saves - MAX 20K ', 'INSTANT', 100, 15000, 1820, 1320, 'Aktif', 3824, 'IRVANKEDE', 'Sosial Media'),
(1247, 3825, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Saves - MAX 50K', 'INSTANT', 10, 350000, 2550, 2050, 'Aktif', 3825, 'IRVANKEDE', 'Sosial Media'),
(1248, 3826, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions [Photo + Explore + Home] - MAX 1M', 'INSTANT', 50, 1000000, 2580, 2080, 'Aktif', 3826, 'IRVANKEDE', 'Sosial Media'),
(1249, 3827, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impression [Home+ Explore + Discover Others] - MAX 100K ', 'INSTANT', 10, 100000, 3000, 2500, 'Aktif', 3827, 'IRVANKEDE', 'Sosial Media'),
(1250, 3828, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views + Story Profile Visits + Story Impressions + Story Interactions ', 'Story Profile Visits (20% sent only to last post)\r\nStory Interactions (20% sent only to last post)', 100, 100000, 7200, 6700, 'Aktif', 3828, 'IRVANKEDE', 'Sosial Media'),
(1251, 3829, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views + Impressions [ MAX 10K ] CEK NOTED', 'Please put only the story link \\r\\nnot your username ', 200, 10000, 10820, 10320, 'Aktif', 3829, 'IRVANKEDE', 'Sosial Media'),
(1252, 3830, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story POFILE VISTS - MAX 100K ', 'PLEASE INPUT LINK STORY', 100, 10000000, 19900, 19400, 'Aktif', 3830, 'IRVANKEDE', 'Sosial Media'),
(1253, 3831, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story SWIPE UP - MAX 100K ', 'PLEASE INPUT LINK STORY\r\nNOT USE USERNAME', 100, 100000, 52100, 51600, 'Aktif', 3831, 'IRVANKEDE', 'Sosial Media'),
(1254, 3832, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [600] [REAL LOOKING USERS] [FAST FINISH]', 'Order may be set to partial/\\\\r\\\\nNo refill / no refund', 50, 50000, 7300, 6800, 'Aktif', 3832, 'IRVANKEDE', 'Sosial Media'),
(1255, 3834, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - 10K/DAY [ REFILL 30DAYS ] ', 'Real Mixed\r\n', 20, 20000, 12100, 11600, 'Aktif', 3834, 'IRVANKEDE', 'Sosial Media'),
(1256, 3835, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - MAX 30K [ GUARANTED 30DAYS ] ', 'INSTANT\r\nUSERNAME ONLY', 20, 50000, 10700, 10200, 'Aktif', 3835, 'IRVANKEDE', 'Sosial Media'),
(1257, 3836, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - MAX 250K [ REFILL 30DAY ] ', '5-10k/day\r\nMix Quality\r\n', 100, 250000, 12700, 12200, 'Aktif', 3836, 'IRVANKEDE', 'Sosial Media'),
(1258, 3837, 'Instagram Likes', 'Instagram Likes [ 10-15K/DAY ] NO REFILL ', 'Instant\r\nNo Refill', 10, 15000, 6700, 6200, 'Aktif', 3837, 'IRVANKEDE', 'Sosial Media'),
(1259, 3838, 'Instagram Likes', 'Instagram Likes - 20K/DAY [ ASIA MIX ] ', 'INSTANT', 50, 10000, 7200, 6700, 'Aktif', 3838, 'IRVANKEDE', 'Sosial Media'),
(1260, 3839, 'Instagram Highlights / Profile Visits / Reach', 'Instagram Reach + Impressions + Profile Visit [ S2 ] ', 'INSTANT', 100, 5000000, 2750, 2250, 'Aktif', 3839, 'IRVANKEDE', 'Sosial Media'),
(1261, 3840, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Saves - INSTAN ', 'INSTANT\r\nLINK POST ONLY', 25, 20000, 1810, 1310, 'Aktif', 3840, 'IRVANKEDE', 'Sosial Media'),
(1262, 3841, 'Instagram Views', 'Instagram Views [ MAX 5M ] INSTANT - FAST', 'INSTANT', 250, 5000000, 1825, 1325, 'Aktif', 3841, 'IRVANKEDE', 'Sosial Media'),
(1263, 3842, 'Instagram Views', 'Instagram Views - MAX 100M [ FAST ] ', 'INSTANT', 100, 100000000, 1790, 1290, 'Aktif', 3842, 'IRVANKEDE', 'Sosial Media'),
(1264, 3843, 'Instagram TV', 'Instagram TV Views [ 5M/DAY ] FAST ', 'INSTANT', 100, 10000000, 1820, 1320, 'Aktif', 3843, 'IRVANKEDE', 'Sosial Media'),
(1265, 3844, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ MAX 20K ] INSTANT - NO REFILL', 'INSTANT \r\nNO REFILL - NO REFUND ', 20, 10000, 6700, 6200, 'Aktif', 3844, 'IRVANKEDE', 'Sosial Media'),
(1266, 3845, 'Instagram Live Video', 'Instagram Live Viewers For 30 Minutes [ CEK NOTED ] ', 'INPUT USERNAME DENGAN @ \r\nORDER SAAT LIVE BERLANGSUNG\r\nJANGAN JEDA LIVE\r\nSILAHKAN REKAM LIVE JIKA TERJADI VIEW TIDAK MASUK UNTUK MENGAJUKAN KOMPLAIN', 20, 40000, 112000, 111500, 'Aktif', 3845, 'IRVANKEDE', 'Sosial Media'),
(1267, 3846, 'Instagram Live Video', 'Instagram Live Viewers For 60 Minutes - CEK NOTED', 'INPUT USERNAME DENGAN @ \r\nLIVE DULU BARU ORDER\r\nJANGAN JEDA LIVE\r\nSILAHKAN REKAM LIVE JIKA TERJADI VIEW TIDAK MASUK UNTUK MENGAJUKAN KOMPLAIN, TIDAK ADA BUKTI REKAMAN TIDAK ADA REFUND JIKA ADA MASALAH ', 20, 30000, 221500, 221000, 'Aktif', 3846, 'IRVANKEDE', 'Sosial Media'),
(1268, 3847, 'Facebook Page Likes', 'Facebook Fan Page Likes - MAX 70K [ REFILL 30DAYS ] ', 'PLEASE INPUT LINK BROWSER\r\nDON\'T WITH LINK FROM APK MOBILE', 100, 70000, 47800, 47300, 'Aktif', 3847, 'IRVANKEDE', 'Sosial Media'),
(1269, 3848, 'Facebook Page Likes', 'Facebook Fan Page Likes [ 500-1k/DAY ] REFILL 30DAYS', 'PLEASE INPUT LINK FROM BROWSER\r\nDON\'T WITH LINK FROM APK MOBILE ', 100, 55555, 27000, 26500, 'Aktif', 3848, 'IRVANKEDE', 'Sosial Media'),
(1270, 3849, 'Facebook Page Likes', 'Facebook Fan Page Likes - MAX 50K [ NO REFILL ] ', 'No Refill No Refund\r\nINPUT LINK FROM BROWSER, DON\'T APK MOBILE LINK', 200, 50000, 11000, 10500, 'Aktif', 3849, 'IRVANKEDE', 'Sosial Media'),
(1271, 3850, 'Facebook Video Views / Live Stream', 'Facebook Video Views - MAX 1M [ INSANT ] ', 'BUKAN UNTUK VIDEO LIVE STREAMING\r\n', 500, 10000000, 3280, 2780, 'Aktif', 3850, 'IRVANKEDE', 'Sosial Media'),
(1272, 3851, 'Facebook Video Views / Live Stream', 'Facebook Live Stream Views (30 Min) [ CEK NOTED ] ', 'HANYA UNTUK VIDEO STREAMING\r\nCONTOH LINK; https://www.facebook.com/watch/?v= ATAU https://www.facebook.com/qaderkill/videos/4217814588239606/\r\nJANGAN MASUKAN LINK PENDEK SEPERTI FB,ME\r\nSTARTCOUNT AKAN 0 DAN STATUS PENDING TAPI ORDERAN TETAP BERJALAN\r\nJIKA ADA KESALAHAN INPUT LINK ATAU DARI PIHAK ORDER, TIDAK AKAN ADA REFUND ', 50, 10000, 46000, 45500, 'Aktif', 3851, 'IRVANKEDE', 'Sosial Media'),
(1273, 3852, 'Facebook Video Views / Live Stream', 'Facebook Live Stream Views (60 Min) [ CEK NOTED ] ', 'HANYA UNTUK VIDEO STREAMING\r\nCONTOH LINK; https://www.facebook.com/watch/?v= ATAU https://www.facebook.com/qaderkill/videos/4217814588239606/\r\nJANGAN MASUKAN LINK PENDEK SEPERTI FB,ME\r\nSTARTCOUNT AKAN 0 DAN STATUS PENDING TAPI ORDERAN TETAP BERJALAN\r\nJIKA ADA KESALAHAN INPUT LINK ATAU DARI PIHAK ORDER, TIDAK AKAN ADA REFUND ', 50, 2000, 76700, 76200, 'Aktif', 3852, 'IRVANKEDE', 'Sosial Media'),
(1274, 3853, 'Facebook Video Views / Live Stream', 'Facebook Live Stream Views (90 Min) [ CEK NOTED ] ', 'HANYA UNTUK VIDEO STREAMING\\r\\nCONTOH LINK; https://www.facebook.com/watch/?v= ATAU https://www.facebook.com/qaderkill/videos/4217814588239606/\\r\\nJANGAN MASUKAN LINK PENDEK SEPERTI FB,ME\\r\\nSTARTCOUNT AKAN 0 DAN STATUS PENDING TAPI ORDERAN TETAP BERJALAN\\r\\nJIKA ADA KESALAHAN INPUT LINK ATAU DARI PIHAK ORDER, TIDAK AKAN ADA REFUND ', 50, 2000, 113700, 113200, 'Aktif', 3853, 'IRVANKEDE', 'Sosial Media'),
(1275, 3854, 'Facebook Video Views / Live Stream', 'Facebook Live Stream Views (120 Min) [ CEK NOTED ] ', 'HANYA UNTUK VIDEO STREAMING\r\nCONTOH LINK; https://www.facebook.com/watch/?v= ATAU https://www.facebook.com/qaderkill/videos/4217814588239606/\r\nJANGAN MASUKAN LINK PENDEK SEPERTI FB,ME\r\nSTARTCOUNT AKAN 0 DAN STATUS PENDING TAPI ORDERAN TETAP BERJALAN\r\nJIKA ADA KESALAHAN INPUT LINK ATAU DARI PIHAK ORDER, TIDAK AKAN ADA REFUND ', 50, 2000, 151300, 150800, 'Aktif', 3854, 'IRVANKEDE', 'Sosial Media'),
(1276, 3855, 'Youtube Views', 'Youtube Views [ MAX 500K ] REFILL 30DAYS ', 'Instant Start\r\n', 100, 500000, 23500, 23000, 'Aktif', 3855, 'IRVANKEDE', 'Sosial Media'),
(1277, 3856, 'Youtube Watchtime', 'Youtube Watchtime [ 4000 HOURS ] GUARANTED 30DAYS - CEK NOTED', 'Please put video link of 1 hours +\r\nDON\'T FOR STREAMING VIDEO\r\nOrder is finished in 5-12 days\r\n', 100, 4000, 120500, 120000, 'Aktif', 3856, 'IRVANKEDE', 'Sosial Media'),
(1278, 3857, 'Twitter Followers', 'Twitter Followers [ MAX 5K ] REFILL 30DAY', '30 days guarantee\r\nReal accounts\r\n', 50, 5000, 185000, 184500, 'Aktif', 3857, 'IRVANKEDE', 'Sosial Media'),
(1279, 3858, 'Tiktok Likes', 'Tiktok Likes - MAX 5K [ REFILL 30DAYS ] INSTANT', 'INPUT LINK VIDEO ONLY', 100, 10000, 9600, 9100, 'Aktif', 3858, 'IRVANKEDE', 'Sosial Media'),
(1280, 3859, 'TikTok  Views, Komentar , Like Komentar &Share ', 'Tiktok Views [ 100K/HOUR ] INSTANT', 'LINK VIDEO ONLY ', 100, 10000000, 1690, 1190, 'Aktif', 3859, 'IRVANKEDE', 'Sosial Media'),
(1281, 3860, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TikTok Shares - MAX 1M [ REFILL 30DAYS ] ', 'INSTANT\r\nREFILL 3ODAYS ', 100, 100000000, 7350, 6850, 'Aktif', 3860, 'IRVANKEDE', 'Sosial Media'),
(1282, 3861, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TIKTOK VIEW SUPER FAST - MAX 1M', 'LINK VIDEO ONLY', 100, 10000000, 1650, 1150, 'Aktif', 3861, 'IRVANKEDE', 'Sosial Media'),
(1283, 3862, 'Telegram', 'Telegram Channel/Group Members [ MAX 10K ] ', 'Full link - https://t.me/yourchannel\r\n MIX Accounts', 500, 10000, 25800, 25300, 'Aktif', 3862, 'IRVANKEDE', 'Sosial Media'),
(1284, 3863, 'Followers Indonesia Gender [ SESUAI JENIS KELAMIN]', 'Followers Indonesia [150K] [90%- 100%  Laki-Laki] ', 'KECEPATAN FAST AKUN 80%-100% SESAUI ORDERAN YAITU LAKI LAKI ', 100, 150000, 51000, 50500, 'Aktif', 3863, 'IRVANKEDE', 'Sosial Media'),
(1285, 3864, 'Followers Indonesia Gender [ SESUAI JENIS KELAMIN]', 'Instagram Followers Indonesia [150] [80% - 100% Perempuan] ', 'FAST ', 150, 150000, 53500, 53000, 'Aktif', 3864, 'IRVANKEDE', 'Sosial Media'),
(1286, 3865, 'ORDER WEBISITE/DOMAIN/JASA FIX/DAN OPER IRVANKEDE', 'DOMAIN CO ID TANPA DOKUMEN !!! LEGAL FULL ACCSES', 'FULL AKSES- ISI TARGET NOMOR HP ANDA NANTI TIM IRVANKEDE AKAN MENGHUBUNGI ANDA- PER TAHUN 1JUTA - CO ID LEGAL', 1000, 1000, 1451500, 1451000, 'Aktif', 3865, 'IRVANKEDE', 'Sosial Media');

-- --------------------------------------------------------

--
-- Table structure for table `metode_depo`
--

CREATE TABLE `metode_depo` (
  `id` int(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `catatan` text NOT NULL,
  `rate` varchar(255) NOT NULL,
  `nama_penerima` varchar(100) NOT NULL,
  `tujuan` varchar(250) NOT NULL,
  `tipe` enum('Transfer Pulsa','Transfer Bank') NOT NULL,
  `minimal` int(10) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metode_depo`
--

INSERT INTO `metode_depo` (`id`, `provider`, `catatan`, `rate`, `nama_penerima`, `tujuan`, `tipe`, `minimal`, `status`) VALUES
(17, 'OVO', 'Silahkan Transfer Ke Nomor 082217417267 Dengan Nominal Rp', '1.00', 'Ilman Sunannudin', '082298859671', 'Transfer Bank', 10000, 'Aktif'),
(18, 'GOPAY', 'Silahkan transfer sesuai dengan jumlah transfer', '1', 'Ilman Sunannudin', '082298859671', 'Transfer Bank', 10000, 'Aktif'),
(20, 'Semua Bank ( Virtual Account )', 'Silahkan Transfer ke virtual account OVO 082298859671 atas nama Ilman S, Cara transfer ke virtual account bisa di cek di google sesuai BANK', '1.0', 'Ilman Sunannudin', '082298859671', 'Transfer Bank', 10000, 'Aktif'),
(21, 'BCA', 'Silahkan transfer ke 1671481688 atas nama ILMAN SUNANUDDIN', '1.0', 'Ilman Sunannudin', '1671481688', 'Transfer Bank', 10000, 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `mutasi`
--

CREATE TABLE `mutasi` (
  `id` int(11) NOT NULL,
  `kode_deposit` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `provider` varchar(50) NOT NULL,
  `jumlah` int(255) NOT NULL,
  `saldo` varchar(250) NOT NULL,
  `status` enum('READ','UNREAD','DONE') NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_bank`
--

CREATE TABLE `mutasi_bank` (
  `id` int(11) NOT NULL,
  `tipe` varchar(10) NOT NULL,
  `keterangan` text NOT NULL,
  `jumlah` double NOT NULL,
  `tanggal` varchar(10) NOT NULL,
  `bank` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_gopay`
--

CREATE TABLE `mutasi_gopay` (
  `id` int(11) NOT NULL,
  `invoice` varchar(200) NOT NULL,
  `amount` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `waktu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_ovo`
--

CREATE TABLE `mutasi_ovo` (
  `id` int(11) NOT NULL,
  `user` varchar(80) NOT NULL,
  `code` varchar(50) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `account` varchar(80) NOT NULL,
  `amount` int(11) NOT NULL,
  `descript` text NOT NULL,
  `sender` varchar(80) NOT NULL,
  `date` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ovo`
--

CREATE TABLE `ovo` (
  `id` varchar(10) NOT NULL,
  `nomor` varchar(18) NOT NULL,
  `device` varchar(120) NOT NULL,
  `kode` varchar(4) NOT NULL,
  `pin` varchar(6) NOT NULL,
  `otp_token` text NOT NULL,
  `reff_otp` text NOT NULL,
  `auth_token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_pascabayar`
--

CREATE TABLE `pembelian_pascabayar` (
  `id` int(10) NOT NULL,
  `oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `provider_oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `id_layanan` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `user` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `kategori` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `harga` double NOT NULL,
  `profit` double NOT NULL,
  `koin` double NOT NULL,
  `target` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `nama_penerima` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `deskripsi1` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `deskripsi2` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `deskripsi3` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `deskripsi4` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `status` enum('Pending','Error','Success') COLLATE utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `place_from` varchar(50) COLLATE utf8_swedish_ci NOT NULL DEFAULT 'WEB',
  `provider` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `refund` enum('0','1') COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_pulsa`
--

CREATE TABLE `pembelian_pulsa` (
  `id` int(10) NOT NULL,
  `oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `provider_oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `user` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `harga` double NOT NULL,
  `target` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `keterangan` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `status` enum('Pending','Processing','Error','Success') COLLATE utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `place_from` enum('WEB','API','WA','') COLLATE utf8_swedish_ci NOT NULL DEFAULT '',
  `provider` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `refund` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_sosmed`
--

CREATE TABLE `pembelian_sosmed` (
  `id` int(10) NOT NULL,
  `oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `provider_oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `user` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `target` text COLLATE utf8_swedish_ci NOT NULL,
  `jumlah` int(10) NOT NULL,
  `remains` int(10) NOT NULL,
  `start_count` int(10) NOT NULL,
  `harga` int(10) NOT NULL,
  `status` enum('Checking','Pending','Processing','Error','Partial','Success') COLLATE utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `provider` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `place_from` enum('WEB','API') COLLATE utf8_swedish_ci NOT NULL,
  `refund` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan_umum`
--

CREATE TABLE `pertanyaan_umum` (
  `id` int(4) NOT NULL,
  `number` varchar(25) NOT NULL,
  `tipe` text NOT NULL,
  `title` text NOT NULL,
  `konten` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pertanyaan_umum`
--

INSERT INTO `pertanyaan_umum` (`id`, `number`, `tipe`, `title`, `konten`) VALUES
(35, 'One', 'Pesanan', 'Bagaimana cara melakukan order ?', 'Untuk melakukan order Anda harus memiliki saldo yang cukup. Masuk ke halaman Dashboard, Silahkan pilih layanan sesuai kebutuhan anda'),
(40, 'Two', 'Pesanan', 'Bagaimana cara melakukan Deposit / Isi Saldo ?', 'Untuk melalukan deposit saldo anda pergi ke halaman Dashboard Silahkan pilih menu Deposit Saldo , ada banyak pilihan deposit yaitu :\r\n( Melalui Dompet Digital dan Transfer Bank )\r\nSemua Deposit diatas menggunakan sistem otomatis'),
(37, 'Three', 'Pesanan', 'Bagaimana Jika Orderan saya Error ?', 'Jika orderan kalian status nya Error maka otomatis saldo kalian akan dikembalikan (Reffund) dengan estimasi waktu 1-5 menit dari status Error tersebut'),
(41, 'Four', 'Pesanan', 'Bagaimana jika orderan saya bermasalah / stuck order ?', 'Mohon menunggu selama 1x24 jam, orderan stuck kemungkinan dikarenakan server yang sedang Overload. Harap bersabar dan jika lebih dari 1x24 jam orderan tetap stuck, segera komplain ke menu Tiket Bantuan / Kontak Admin'),
(42, 'Five', 'Akun', 'Bagaimana saya mau mendaftar menjadi Reseller ?', 'Jika kalian ingin mendaftar menjadi Reseller , silahkan kontak Admin'),
(43, 'Six', 'Akun', 'Apa Itu M Pedia?', 'SolusiMedia adalah SMM Reseller Panel, di mana Orang Beli kebutuhan Social Media Marketing Seperti Facebook, Twitter, Instagram, YouTube, Website Traffic dan masih banyak layanan lainnya.');

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `id` int(10) NOT NULL,
  `code` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `link_service` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `api_key` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `api_id` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`id`, `code`, `link`, `link_service`, `api_key`, `api_id`) VALUES
(1, 'IRVANKEDE', 'https://api.irvankede-smm.co.id/order', 'https://api.irvankede-smm.co.id/services', '949108-c7fbd0-9104dd-6a285c-8401ed', '13778');

-- --------------------------------------------------------

--
-- Table structure for table `provider_pulsa`
--

CREATE TABLE `provider_pulsa` (
  `id` int(10) NOT NULL,
  `code` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `link_service` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `api_key` varchar(1100) COLLATE utf8_swedish_ci NOT NULL,
  `api_id` varchar(100) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `provider_pulsa`
--

INSERT INTO `provider_pulsa` (`id`, `code`, `link`, `link_service`, `api_key`, `api_id`) VALUES
(1, 'DG-PULSA', 'https://api.digiflazz.com/v1/transaction', 'https://api.digiflazz.com/v1/price-list', 'dev-6dd7ce60-4729-11ea-bdc7-316784c4c103', 'civicoopkNxg');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_saldo_koin`
--

CREATE TABLE `riwayat_saldo_koin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tipe` enum('Koin','Saldo') NOT NULL,
  `aksi` enum('Penambahan Saldo','Pengurangan Saldo','Penambahan Koin','Pengurangan Koin') NOT NULL,
  `nominal` double NOT NULL,
  `pesan` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_transfer`
--

CREATE TABLE `riwayat_transfer` (
  `id` int(10) NOT NULL,
  `tipe` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `pengirim` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `penerima` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `jumlah` double NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `no_tujuan` varchar(20) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semua_pembelian`
--

CREATE TABLE `semua_pembelian` (
  `id` int(10) NOT NULL,
  `id_order` varchar(50) NOT NULL,
  `id_pesan` varchar(10) NOT NULL,
  `user` varchar(50) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `layanan` varchar(100) NOT NULL,
  `harga` double NOT NULL,
  `target` varchar(50) NOT NULL,
  `status` enum('Pending','Processing','Error','Success') NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `place_from` enum('API','WEB','WA') NOT NULL,
  `refund` enum('0','1') NOT NULL,
  `tipe_pesan` enum('Pulsa','Sosial Media','Pascabayar','') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting_harga_untung`
--

CREATE TABLE `setting_harga_untung` (
  `id` int(11) NOT NULL,
  `kategori` enum('WEBSITE','API') NOT NULL,
  `tipe` enum('Sosial Media','Top Up','Pascabayar') NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting_harga_untung`
--

INSERT INTO `setting_harga_untung` (`id`, `kategori`, `tipe`, `harga`) VALUES
(1, 'WEBSITE', 'Sosial Media', 1500),
(2, 'API', 'Sosial Media', 1000),
(3, 'WEBSITE', 'Top Up', 1000),
(4, 'API', 'Top Up', 300),
(7, 'WEBSITE', 'Pascabayar', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `setting_web`
--

CREATE TABLE `setting_web` (
  `id` int(11) NOT NULL,
  `short_title` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `deskripsi_web` text NOT NULL,
  `kontak_utama` text NOT NULL,
  `lokasi` varchar(200) NOT NULL,
  `kode_pos` varchar(25) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting_web`
--

INSERT INTO `setting_web` (`id`, `short_title`, `title`, `deskripsi_web`, `kontak_utama`, `lokasi`, `kode_pos`, `date`, `time`) VALUES
(1, 'SOLUSI MEDIA', 'SOLUSI MEDIA', 'SOLUSI MEDIA Merupakan penyedia layanan Sosial Media Marketing Dan PPOB Terlengkap Di indonesia, Mari bergabung untuk mendapatkan layanan SOLUSI MEDIA seperti Followers sosial media, Pulsa ,Voucher game Dll.. Daftar sekarang dan tingkatkan kualitas sosial mediamu', '62859106529267', 'Darma, Kuningan - Jawa Barat', '45562', '2019-01-03', '16:06:10');

-- --------------------------------------------------------

--
-- Table structure for table `top_depo`
--

CREATE TABLE `top_depo` (
  `id` int(10) NOT NULL,
  `method` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `jumlah` int(250) NOT NULL,
  `total` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `top_depo`
--

INSERT INTO `top_depo` (`id`, `method`, `username`, `jumlah`, `total`) VALUES
(1, 'Deposit', 'admin ', 310000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `top_layanan`
--

CREATE TABLE `top_layanan` (
  `id` int(10) NOT NULL,
  `method` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `jumlah` int(100) NOT NULL,
  `total` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `top_users`
--

CREATE TABLE `top_users` (
  `id` int(10) NOT NULL,
  `method` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `jumlah` int(250) NOT NULL,
  `total` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `top_users`
--

INSERT INTO `top_users` (`id`, `method`, `username`, `jumlah`, `total`) VALUES
(1, 'Order', 'admin ', 128430, 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `nama_depan` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `nama_belakang` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `nama` text COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `saldo_top_up` int(10) NOT NULL,
  `pemakaian_saldo` double NOT NULL,
  `level` enum('Server','Member','Agen','Reseller','Admin','Special Limit','Admin VIP','Developers') COLLATE utf8_swedish_ci NOT NULL,
  `status` enum('Active','Suspended','Unverif') COLLATE utf8_swedish_ci NOT NULL,
  `status_akun` enum('Sudah Verifikasi','Belum Verifikasi') COLLATE utf8_swedish_ci NOT NULL,
  `pin` int(11) NOT NULL,
  `api_key` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `uplink` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `uplink_refferal` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `koin` double NOT NULL,
  `no_hp` varchar(15) COLLATE utf8_swedish_ci NOT NULL,
  `kode_verifikasi` varchar(10) COLLATE utf8_swedish_ci NOT NULL,
  `random_kode` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `read_news` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_depan`, `nama_belakang`, `nama`, `email`, `username`, `password`, `saldo_top_up`, `pemakaian_saldo`, `level`, `status`, `status_akun`, `pin`, `api_key`, `uplink`, `uplink_refferal`, `date`, `time`, `koin`, `no_hp`, `kode_verifikasi`, `random_kode`, `read_news`) VALUES
(1, 'admin', 'admin', 'admin admin', 'ilmansunannudin2@gmail.com', 'admin', '$2y$10$3m9rwg2MrulpJ.I8eySFIORBeIgkuXWpKLujAzoooWlMSbfFzkOTi', 0, 0, 'Developers', 'Active', 'Sudah Verifikasi', 111111, 'FaOot96Dy9hYOW4Eq8Ou3SK6psCBk19r', 'Kode', 'Free reg', '2021-10-25', '12:12:52', 0, '6282298859671', '', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aktifitas`
--
ALTER TABLE `aktifitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bca`
--
ALTER TABLE `bca`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cek_akun`
--
ALTER TABLE `cek_akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gopay`
--
ALTER TABLE `gopay`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `kategori_layanan`
--
ALTER TABLE `kategori_layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ketentuan_layanan`
--
ALTER TABLE `ketentuan_layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kode_voucher`
--
ALTER TABLE `kode_voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kontak_admin`
--
ALTER TABLE `kontak_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kontak_website`
--
ALTER TABLE `kontak_website`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layanan_pascabayar`
--
ALTER TABLE `layanan_pascabayar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layanan_pulsa`
--
ALTER TABLE `layanan_pulsa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layanan_sosmed`
--
ALTER TABLE `layanan_sosmed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metode_depo`
--
ALTER TABLE `metode_depo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi`
--
ALTER TABLE `mutasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi_bank`
--
ALTER TABLE `mutasi_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi_gopay`
--
ALTER TABLE `mutasi_gopay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi_ovo`
--
ALTER TABLE `mutasi_ovo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ovo`
--
ALTER TABLE `ovo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian_pascabayar`
--
ALTER TABLE `pembelian_pascabayar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian_pulsa`
--
ALTER TABLE `pembelian_pulsa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian_sosmed`
--
ALTER TABLE `pembelian_sosmed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pertanyaan_umum`
--
ALTER TABLE `pertanyaan_umum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_pulsa`
--
ALTER TABLE `provider_pulsa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `riwayat_saldo_koin`
--
ALTER TABLE `riwayat_saldo_koin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `riwayat_transfer`
--
ALTER TABLE `riwayat_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semua_pembelian`
--
ALTER TABLE `semua_pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_harga_untung`
--
ALTER TABLE `setting_harga_untung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_web`
--
ALTER TABLE `setting_web`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `top_depo`
--
ALTER TABLE `top_depo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `top_layanan`
--
ALTER TABLE `top_layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `top_users`
--
ALTER TABLE `top_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aktifitas`
--
ALTER TABLE `aktifitas`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api`
--
ALTER TABLE `api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cek_akun`
--
ALTER TABLE `cek_akun`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_layanan`
--
ALTER TABLE `kategori_layanan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT for table `ketentuan_layanan`
--
ALTER TABLE `ketentuan_layanan`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kode_voucher`
--
ALTER TABLE `kode_voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `layanan_pascabayar`
--
ALTER TABLE `layanan_pascabayar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `layanan_pulsa`
--
ALTER TABLE `layanan_pulsa`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=815;

--
-- AUTO_INCREMENT for table `layanan_sosmed`
--
ALTER TABLE `layanan_sosmed`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1287;

--
-- AUTO_INCREMENT for table `metode_depo`
--
ALTER TABLE `metode_depo`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `mutasi`
--
ALTER TABLE `mutasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mutasi_bank`
--
ALTER TABLE `mutasi_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mutasi_gopay`
--
ALTER TABLE `mutasi_gopay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mutasi_ovo`
--
ALTER TABLE `mutasi_ovo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelian_pascabayar`
--
ALTER TABLE `pembelian_pascabayar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelian_pulsa`
--
ALTER TABLE `pembelian_pulsa`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelian_sosmed`
--
ALTER TABLE `pembelian_sosmed`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pertanyaan_umum`
--
ALTER TABLE `pertanyaan_umum`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `provider_pulsa`
--
ALTER TABLE `provider_pulsa`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `riwayat_saldo_koin`
--
ALTER TABLE `riwayat_saldo_koin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riwayat_transfer`
--
ALTER TABLE `riwayat_transfer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semua_pembelian`
--
ALTER TABLE `semua_pembelian`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting_harga_untung`
--
ALTER TABLE `setting_harga_untung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `setting_web`
--
ALTER TABLE `setting_web`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `top_depo`
--
ALTER TABLE `top_depo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `top_layanan`
--
ALTER TABLE `top_layanan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `top_users`
--
ALTER TABLE `top_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
