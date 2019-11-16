-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2019 at 03:49 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `extraclassroom`
--
CREATE DATABASE IF NOT EXISTS `extraclassroom` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `extraclassroom`;

-- --------------------------------------------------------

--
-- Table structure for table `de`
--

CREATE TABLE `de` (
  `IdDe` int(11) NOT NULL,
  `TenDe` varchar(1000) NOT NULL,
  `LoaiDe` int(11) NOT NULL,
  `SoCauHoi` int(11) NOT NULL,
  `HienDapAn` int(11) NOT NULL,
  `NgayTaoDe` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Lop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `de_cauhoi`
--

CREATE TABLE `de_cauhoi` (
  `IdDe` int(11) NOT NULL,
  `IdCauHoi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `de_nhom`
--

CREATE TABLE `de_nhom` (
  `IdNhom` int(11) NOT NULL,
  `IdDe` int(11) NOT NULL,
  `ThoiGianMo` datetime NOT NULL,
  `ThoiGianDong` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `diem_de`
--

CREATE TABLE `diem_de` (
  `IdNguoiDung` int(11) NOT NULL,
  `IdDe` int(11) NOT NULL,
  `Diem` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nganhangcauhoi`
--

CREATE TABLE `nganhangcauhoi` (
  `IdCauHoi` int(11) NOT NULL,
  `CauHoi` varchar(1000) NOT NULL,
  `DapAn1` varchar(200) NOT NULL,
  `DapAn2` varchar(200) NOT NULL,
  `DapAn3` varchar(200) NOT NULL,
  `DapAn4` varchar(200) NOT NULL,
  `DapAnDung` int(11) NOT NULL,
  `LoiGiai` varchar(1000) NOT NULL,
  `LoaiCauHoi` int(11) NOT NULL,
  `Lop` int(11) NOT NULL,
  `Tuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nganhangcauhoi`
--

INSERT INTO `nganhangcauhoi` (`IdCauHoi`, `CauHoi`, `DapAn1`, `DapAn2`, `DapAn3`, `DapAn4`, `DapAnDung`, `LoiGiai`, `LoaiCauHoi`, `Lop`, `Tuan`) VALUES
(1, '<p>Test+cau+hoi</p>', '<p><strong>Dap+án+1+ádfasdf</strong>+ádf</p>', '<p><strong>Dap+án+1+ádfasdf</strong>+ádf</p>', '<p><strong>Dap+án+1+ádfasdf</strong>+ádf</p>', '<p><strong>Dap+án+1+ádfasdf</strong>+ádf</p>', 1, '<p><strong>Lời+giản+ádfasdf</strong>+ádf</p>', 1, 10, 46),
(2, '<p>Test cau hoi</p>', '<p><strong>Dap án 1 ádfasdf</strong> ádf</p>', '<p><strong>Dap án 2 ádfasdf</strong> ádf</p>', '<p><strong>Dap án 3 ádfasdf</strong> ádf</p>', '<p><strong>Dap án 4 ádfasdf</strong> ádf</p>', 1, '<p><strong>Lời giản ádfasdf</strong> ádf</p>', 1, 10, 46),
(3, '<p>Test+cau+hoi</p>', '<p><strong>Dap+án+1+ádfasdf</strong>+ádf</p>', '<p><strong>Dap+án+1+ádfasdf</strong>+ádf</p>', '<p><strong>Dap+án+1+ádfasdf</strong>+ádf</p>', '<p><strong>Dap+án+1+ádfasdf</strong>+ádf</p>', 1, '<p><strong>Lời+giản+ádfasdf</strong>+ádf</p>', 1, 10, 46);

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `IdNguoiDung` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(1000) NOT NULL,
  `HoTen` varchar(1000) NOT NULL,
  `NamSinh` int(11) NOT NULL,
  `Avatar` varchar(1000) NOT NULL,
  `Lop` int(11) NOT NULL,
  `IdNhom` int(11) NOT NULL,
  `LoaiTaiKhoan` int(11) NOT NULL,
  `RandomCode` varchar(8) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `DiemTong` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`IdNguoiDung`, `Username`, `Password`, `HoTen`, `NamSinh`, `Avatar`, `Lop`, `IdNhom`, `LoaiTaiKhoan`, `RandomCode`, `Email`, `DiemTong`) VALUES
(1, 'admin1', '$2y$10$0hAJ4TS/HNQ/V/cX8F7xQebIG25vGCBUHmfciRka74MzY766begam', 'Võ Văn Dương', 1999, '', 0, 0, 0, '', 'duongvox99@gmail.com', 0),
(2, 'admin2', '$2y$10$HBJgLtJLErByNdjHRpdOeuZR1Gwrp9jgXdqWJbGKqbK5Pe5JWMoz6', 'Phạm Minh Dương', 1999, '', 0, 0, 0, '', 'phamminhduong@gmail.com', 0),
(3, 'huynhducvu', '$2y$10$6w.Hxafrj.zghrDhU4d6SeZ8tVHrrcDepcctomeq/oxZIRe6mve1q', 'Huỳnh Đức Vũ', 1980, '', 0, 0, 0, '', 'huynhducvu@gmail.com', 0),
(4, 'hocsinh', '$2y$10$pzu1AEuXVvvvNu0PTB.hMOoaqjqsKS6rFH/t/HpTb5ozMKiZUaxKG', 'Vox Van Duwowng', 1999, '', 10, 1, 1, '', 'vovanduong3010@gmail.com', 0),
(5, 'hocsinh1', '$2y$10$RDUGgF0chJD2V4n.rfKq0uJElP5FtbwUCDdXGgyKwGuRbcZzrQYgG', 'Học Sinh 1', 2004, '', 10, 1, 1, '', 'hocsinh1@gmail.com', 0),
(6, 'hocsinh2', '$2y$10$AwP9SIhP6e7.sxEzsvPIret/AJCRydSIoWt8p0CWDIkUAVer2Elmy', 'Học Sinh 2', 2004, '', 10, 1, 1, '', 'hocsinh2@gmail.com', 0),
(7, 'hocsinh3', '$2y$10$DzU0edxldesedcEInpyQoeN0mkAdXvGoE5m7lM6.0z7DSD5dm6o7W', 'Học Sinh 3', 2004, '', 10, 1, 1, '', 'hocsinh3@gmail.com', 0),
(8, 'hocsinh4', '$2y$10$civ6EH1fTznPSmlRMIZxnONtLHUBivVUv7XKfDLRDRvrfs5BqMsDS', 'Học Sinh 4', 2004, '', 10, 1, 1, '', 'hocsinh4@gmail.com', 0),
(9, 'hocsinh5', '$2y$10$PnM8mZHrM6urjpNuIbtJcuPVBwwm3LpPS8LhiZrnnMxfRs38/V15G', 'Học Sinh 5', 2004, '', 10, 1, 1, '', 'hocsinh5@gmail.com', 0),
(10, 'hocsinh6', '$2y$10$h17jwLTO3Eb2ZqeRH4gJsuZhL4qWK/olWgBVhme3vHKciXPhW3iCG', 'Học Sinh 6', 2004, '', 10, 1, 1, '', 'hocsinh6@gmail.com', 0),
(11, 'hocsinh7', '$2y$10$y/EgnRmNBSbPWpuy7/ORYe5ZZTX.EgQMlO4TDfrPSbUaX1tkMPmEi', 'Học Sinh 7', 2004, '', 10, 1, 1, '', 'hocsinh7@gmail.com', 0),
(12, 'hocsinh8', '$2y$10$sGgD5qz.dKCsGF1PKGm7FumFFUDXbDY4SA5cJqCIMm3tziSgsYU72', 'Học Sinh 8', 2004, '', 10, 1, 1, '', 'hocsinh8@gmail.com', 0),
(13, 'hocsinh9', '$2y$10$NYu6xknxwp1uJOuCtt2jJeikMuMRvAMMVOv2Ffo5ktL9twApqXm.K', 'Học Sinh 9', 2004, '', 10, 1, 1, '', 'hocsinh9@gmail.com', 0),
(14, 'hocsinh10', '$2y$10$A7Hl5ka0PesZio8Uwl9UI.kqqgzvfGmkaImlS.mc2LQlylAutKdl.', 'Học Sinh 10', 2004, '', 10, 1, 1, '', 'hocsinh10@gmail.com', 0),
(15, 'hocsinh11', '$2y$10$jG0BSOxY/7krYz.pI7qMBuiL1krmjm8NJuuTV14.FJ3rhKqcjVeKK', 'Học Sinh 11', 2004, '', 10, 1, 1, '', 'hocsinh11@gmail.com', 0),
(16, 'hocsinh12', '$2y$10$4KquKs5NQm3oQ.jzyx4O3.Zf46qxFSIDpsuBWb4QxD6PlS/owTLtu', 'Học Sinh 12', 2004, '', 10, 1, 1, '', 'hocsinh12@gmail.com', 0),
(17, 'hocsinh13', '$2y$10$wHjFkzeo2bk4x93OJJ3E4u2d3qNdoI4DciWyXpDObYCDC19Qp2Sse', 'Học Sinh 13', 2004, '', 10, 1, 1, '', 'hocsinh13@gmail.com', 0),
(18, 'hocsinh14', '$2y$10$kbICcmh5G/Yt23eL6y4d/u5udyaP20BImLDSyFsyTNujhMn8IQM3S', 'Học Sinh 14', 2004, '', 10, 1, 1, '', 'hocsinh14@gmail.com', 0),
(19, 'hocsinh15', '$2y$10$85TwjXw6CfQ70l12Y6el/.yEOHhXiDsaYo4b6HIj20yP5PW0wi.FG', 'Học Sinh 15', 2004, '', 10, 1, 1, '', 'hocsinh15@gmail.com', 0),
(20, 'hocsinh16', '$2y$10$oRcMSi/G1QcyGVlWTEdeYe3OaLBtJo5HATrYwTt1whaKwJQPO78Cm', 'Học Sinh 16', 2004, '', 10, 1, 1, '', 'hocsinh16@gmail.com', 0),
(21, 'hocsinh17', '$2y$10$2BjE2.TFUYniIw5WNgSeEuCVejnAMWDVj1zZalP2p1g0nPWJSK39.', 'Học Sinh 17', 2004, '', 10, 1, 1, '', 'hocsinh17@gmail.com', 0),
(22, 'hocsinh18', '$2y$10$mda61k2fTg78WxdoZIAyb.uPgZ/Z0PrjI1bgGNROlMMKx4g1R8E12', 'Học Sinh 18', 2004, '', 10, 1, 1, '', 'hocsinh18@gmail.com', 0),
(23, 'hocsinh19', '$2y$10$2hRzt1XAAAMM2ilHIvECd.38wW2PvnmK9MsAhrl4qrI1o1qn3dXeq', 'Học Sinh 19', 2004, '', 10, 2, 1, '', 'hocsinh19@gmail.com', 0),
(24, 'hocsinh20', '$2y$10$43J5gmFeLoZ1ClxmcIciQuQbmclL4/MrAAnj0Wh66nvf9bHEvA.N6', 'Học Sinh 20', 2004, '', 10, 2, 1, '', 'hocsinh20@gmail.com', 0),
(25, 'hocsinh21', '$2y$10$oMC1I551oPTS0gZIbf9pseMplJGRkarkKuVWGQvAfdyW0CPdrhZ1K', 'Học Sinh 21', 2004, '', 10, 2, 1, '', 'hocsinh21@gmail.com', 0),
(26, 'hocsinh22', '$2y$10$ert2VDFpvNaAWU10WLDQWu8UgJhCeOH/djnsNQvIHPXxbYb54hzXm', 'Học Sinh 22', 2004, '', 10, 2, 1, '', 'hocsinh22@gmail.com', 0),
(27, 'hocsinh23', '$2y$10$pOAQMa9jkSztwojzFmFaGe0wVduged7NCBmr0g2LcQ1H/OqMLMP3G', 'Học Sinh 23', 2004, '', 10, 2, 1, '', 'hocsinh23@gmail.com', 0),
(28, 'hocsinh24', '$2y$10$joMY73bAILdkQXOvO2NMce7EOaucEwMz07.MfOgACESLX3wyHB8Be', 'Học Sinh 24', 2004, '', 10, 2, 1, '', 'hocsinh24@gmail.com', 0),
(29, 'hocsinh25', '$2y$10$Pt5F04f6fGH0mlnaNC52CuKKMbXErWYVFkcU.LTNHn2bG3Eu6reW.', 'Học Sinh 25', 2004, '', 10, 1, 1, '', 'hocsinh25@gmail.com', 0),
(30, 'hocsinh26', '$2y$10$vC2MXy5e3f5CmNcz.453E.mW3k5Srd53CQE89D5yI6Vu/k.xmPE1O', 'Học Sinh 26', 2004, '', 10, 1, 1, '', 'hocsinh26@gmail.com', 0),
(31, 'hocsinh27', '$2y$10$JmEB/R/z8xNdYmm.509cuORkc92rFyBYJ6tVY9t4IWnPXWdqEvTsq', 'Học Sinh 27', 2004, '', 10, 1, 1, '', 'hocsinh27@gmail.com', 0),
(32, 'hocsinh28', '$2y$10$cJXlh2/UiNLw99/3E4hHjuHi77jAlb1ZdGt.IZv.BA1AUETfyGRU6', 'Học Sinh 28', 2004, '', 10, 1, 1, '', 'hocsinh28@gmail.com', 0),
(33, 'hocsinh29', '$2y$10$YVSZYScx3DRTx6/R6/erUubCL34FRfvWoMt/fA4HvrosnDosY9qLG', 'Học Sinh 29', 2004, '', 10, 1, 1, '', 'hocsinh29@gmail.com', 0),
(34, 'hocsinh30', '$2y$10$1WxVDa4Wq6empbwG9vUBK.w7ygoFRP7AmNa9ITuZvHzSZo6/xPRLe', 'Học Sinh 30', 2004, '', 10, 1, 1, '', 'hocsinh30@gmail.com', 0),
(35, 'hocsinh31', '$2y$10$3xrNtteCR7Q9FLEl/qQ0NuBapQm7rIN7FheT11YN4Uwm3w329nRbu', 'Học Sinh 31', 2003, '', 11, 1, 1, '', 'hocsinh31@gmail.com', 0),
(36, 'hocsinh32', '$2y$10$KqVNLabLLCmXaztKDZtCMOffYDcVQEDd3PBG0W40bPrUvV0.7BZE.', 'Học Sinh 32', 2003, '', 11, 1, 1, '', 'hocsinh32@gmail.com', 0),
(37, 'hocsinh33', '$2y$10$znr3yLGTk7cFhDAI6sl.w.Xb4eYWyDZ0XOBCw2z9qPc1CpPNjKMPK', 'Học Sinh 33', 2003, '', 11, 1, 1, '', 'hocsinh33@gmail.com', 0),
(38, 'hocsinh34', '$2y$10$BVmkw6855Gpv5M/3C6KKMOwJTORoWtzl9t8oK..76g/ZH2uuBNQz.', 'Học Sinh 34', 2003, '', 11, 1, 1, '', 'hocsinh34@gmail.com', 0),
(39, 'hocsinh35', '$2y$10$mqBqXglUTRwuaPim/./gF.wpC4VWjX.7Z4wlrUftP9gm7NKl1ydf.', 'Học Sinh 35', 2003, '', 11, 1, 1, '', 'hocsinh35@gmail.com', 0),
(40, 'hocsinh36', '$2y$10$js9Xk/dYBuopRciX6IY3z.cz0o4oOyBCVUtldTQdCEsuqbDhG/jtW', 'Học Sinh 36', 2003, '', 11, 1, 1, '', 'hocsinh36@gmail.com', 0),
(41, 'hocsinh37', '$2y$10$G8dNcbgn0lVr.2dU2bBbS.lNp25rUr0fFdaBsQ1amcaH8YKn6gL8O', 'Học Sinh 37', 2003, '', 11, 1, 1, '', 'hocsinh37@gmail.com', 0),
(42, 'hocsinh38', '$2y$10$lrwP342QJHYz41jYR7aYnuNFCmBbDsQIYf1zv8I6oBS2PDfnkAJFm', 'Học Sinh 38', 2003, '', 11, 1, 1, '', 'hocsinh38@gmail.com', 0),
(43, 'hocsinh39', '$2y$10$SEx2haoOl64u2NMG7CVno.sBHH.f/zBumH0gBzC40irsAGBrm7VaW', 'Học Sinh 39', 2003, '', 11, 1, 1, '', 'hocsinh39@gmail.com', 0),
(44, 'hocsinh40', '$2y$10$.P6dvoVX3j8jLpjr7iQKzeTSu.NDXLamqkPCPHiIdynEYcNYIv7de', 'Học Sinh 40', 2003, '', 11, 1, 1, '', 'hocsinh40@gmail.com', 0),
(45, 'hocsinh41', '$2y$10$Lu/cr.02n0APq6RctSu2/OVIRfgFZNPfOYo4.X64Z4H8RhbmWGZQC', 'Học Sinh 41', 2004, '', 11, 3, 1, '', 'hocsinh41@gmail.com', 0),
(46, 'hocsinh42', '$2y$10$kpUUwnAFTaFkROxxs6yUa.eCkga4d0Vo/DJSWMIZVD/RohN2i6k5W', 'Học Sinh 42', 2004, '', 11, 3, 1, '', 'hocsinh42@gmail.com', 0),
(47, 'hocsinh43', '$2y$10$daDColJDbNI4tEAq59KZpOpYdzAxM8Cdf.y0o1cLnQuz0ZXEobFfi', 'Học Sinh 43', 2004, '', 11, 3, 1, '', 'hocsinh43@gmail.com', 0),
(48, 'hocsinh44', '$2y$10$Yq3AxOG09h1592g384vpsOdaVk4l0Bpx.tHLGx4z1koRu8lMsDYju', 'Học Sinh 44', 2004, '', 11, 3, 1, '', 'hocsinh44@gmail.com', 0),
(49, 'hocsinh45', '$2y$10$9t9nnzR877KU/wBulnJSJeHJBZYucSs/3/t6R9KdlPqJSDBskhlW.', 'Học Sinh 45', 2004, '', 11, 3, 1, '', 'hocsinh45@gmail.com', 0),
(50, 'hocsinh46', '$2y$10$QOKw5FJFXCemNcnEHdank.G/coJ9h.XpLWSS7P1nfoIh7gcYParaO', 'Học Sinh 46', 2004, '', 11, 3, 1, '', 'hocsinh46@gmail.com', 0),
(51, 'hocsinh47', '$2y$10$ahGBJZGoKRaLaCQwHKn5G.c.Ef7.ipr8GyPQZpy95PUcOJLTdup5m', 'Học Sinh 47', 2004, '', 11, 3, 1, '', 'hocsinh47@gmail.com', 0),
(52, 'hocsinh48', '$2y$10$.cOCICwCd4yNPgdT4yEBEuM02AoD8KDWXwPMam1/47/69heiOrYx.', 'Học Sinh 48', 2004, '', 11, 3, 1, '', 'hocsinh48@gmail.com', 0),
(53, 'hocsinh49', '$2y$10$V6F4B25XtLPTRgLvVwhCMuO.knEUGbee.jZrfmudEkQ450616lLYO', 'Học Sinh 49', 2004, '', 11, 3, 1, '', 'hocsinh49@gmail.com', 0),
(54, 'hocsinh50', '$2y$10$uNMlF2upTDkkXQDdlelcsuWQ2KfJqWufHBkeOFky/IrKmNe0uIByi', 'Học Sinh 50', 2004, '', 11, 3, 1, '', 'hocsinh50@gmail.com', 0),
(55, 'hocsinh51', '$2y$10$GWtg2nM7NBXLnWwo/c1Y3utidFFxiAyjxML2yyJ3ivdx16VKHSNnG', 'Học Sinh 51', 2004, '', 11, 4, 1, '', 'hocsinh51@gmail.com', 0),
(56, 'hocsinh52', '$2y$10$LAVkn2T4aUS4of11kqWFWOoMD5Z6NwPCMMPYFND/ZEp00OPjfZ71y', 'Học Sinh 52', 2004, '', 11, 4, 1, '', 'hocsinh52@gmail.com', 0),
(57, 'hocsinh53', '$2y$10$qIMW1.s2YWRqbn1veayPhO1IwJ/sUzvJ/7krUpu73l1lplBrh7p.u', 'Học Sinh 53', 2004, '', 11, 4, 1, '', 'hocsinh53@gmail.com', 0),
(58, 'hocsinh54', '$2y$10$GJ743xu6lMf/FHcXR0inEOPKZQafhbivS7BUPFKuGqlqCuPp68oPK', 'Học Sinh 54', 2004, '', 11, 4, 1, '', 'hocsinh54@gmail.com', 0),
(59, 'hocsinh55', '$2y$10$4kug25p9sM/8XKB1z66mDuT2gyaG/CLsIeT6sPwN8OaSx9hlJWZ/a', 'Học Sinh 55', 2004, '', 11, 4, 1, '', 'hocsinh55@gmail.com', 0),
(60, 'hocsinh56', '$2y$10$LBagtzaw0QcsHXeMgZ2Zp.lAYE8J53KbRU7VthBJjnw6Jtvc2F3hi', 'Học Sinh 56', 2004, '', 12, 5, 1, '', 'hocsinh56@gmail.com', 0),
(61, 'hocsinh57', '$2y$10$FsPYV//ovSQCwhBwo3atu.x6ACaSYHCCNap.srlwsbF/n14eVgPp2', 'Học Sinh 57', 2004, '', 12, 5, 1, '', 'hocsinh57@gmail.com', 0),
(62, 'hocsinh58', '$2y$10$Kpq0AXiY/jSQRyuS1f/qY.trXf5Oa4Aiq8HLcqZznmDHdwb6skhCS', 'Học Sinh 58', 2004, '', 12, 5, 1, '', 'hocsinh58@gmail.com', 0),
(63, 'hocsinh59', '$2y$10$0GtOsxck6XTJ2Gctdpqkh.mB3jBJvvbNAASGL1JMDYP7p6YvoGRYW', 'Học Sinh 59', 2004, '', 12, 5, 1, '', 'hocsinh59@gmail.com', 0),
(64, 'hocsinh60', '$2y$10$/nqzeKAWa406nEv5Y8miCuVf80n.R.Khc1OVLbWM/L/vZwWZJ5Y9u', 'Học Sinh 60', 2004, '', 12, 5, 1, '', 'hocsinh60@gmail.com', 0),
(65, 'hocsinh61', '$2y$10$vQJ68hQQJ0qASDgZ/fd6BuhWev47aj.j0KAH8wSUW449BZrdzomt.', 'Học Sinh 61', 2004, '', 12, 5, 1, '', 'hocsinh61@gmail.com', 0),
(66, 'hocsinh62', '$2y$10$ACjjaUeYcAk6LfELbW2OreVTSmoWm0ZjHV2CEpcZLY56tSczYNu2u', 'Học Sinh 62', 2004, '', 12, 5, 1, '', 'hocsinh62@gmail.com', 0),
(67, 'hocsinh63', '$2y$10$IYkCyV0TJ5XouCjjmiZrWuNSBeMxDxbcJ0DxSB7qIbko4XriVJsWC', 'Học Sinh 63', 2004, '', 12, 5, 1, '', 'hocsinh63@gmail.com', 0),
(68, 'hocsinh64', '$2y$10$jr7pyuoX7WBheyDcxnMlFO/9Tu6GH3huN2Us1jiscQSsb2Ih7/vJm', 'Học Sinh 64', 2004, '', 12, 5, 1, '', 'hocsinh64@gmail.com', 0),
(69, 'hocsinh65', '$2y$10$H8zHTOLZ8oEAmFqoUSbB4uJMuGpOopmwz5QnCGVrOlE96ntySVaDG', 'Học Sinh 65', 2004, '', 12, 5, 1, '', 'hocsinh65@gmail.com', 0),
(70, 'hocsinh66', '$2y$10$8YBp23CpPpDV2nfbBPXm0eKRYeRO.Js3QY6zDwKnNQMNfkq37dtp2', 'Học Sinh 66', 2004, '', 12, 5, 1, '', 'hocsinh66@gmail.com', 0),
(71, 'hocsinh67', '$2y$10$tXPBB.RCOV7SsthUO9a1ceE9twRqcdnqq1wruOZLfXiNkifAJXuDa', 'Học Sinh 67', 2004, '', 12, 5, 1, '', 'hocsinh67@gmail.com', 0),
(72, 'hocsinh68', '$2y$10$ciaLTecZJr40mgVk8wnMO.vqYx6btnyaNedkWfrevc4IUq6zUCxvu', 'Học Sinh 68', 2004, '', 12, 5, 1, '', 'hocsinh68@gmail.com', 0),
(73, 'hocsinh69', '$2y$10$lQdgzkM5c9VQXnn2qsPPTOpIEHuEp3uE/7eSCSHwciNvC1NUp0.Fu', 'Học Sinh 69', 2004, '', 12, 5, 1, '', 'hocsinh69@gmail.com', 0),
(74, 'hocsinh70', '$2y$10$lE7/aLPEJQf0MXiNRFtKPu0eczLgLUCWLHFNQPyIlRm765tRGA1pO', 'Học Sinh 70', 2004, '', 12, 5, 1, '', 'hocsinh70@gmail.com', 0),
(75, 'hocsinh71', '$2y$10$cgndyK29r1GAX/Eq1pDuleXavZkvsGjT4/7WQFK4WFTx5lsIVYM6m', 'Học Sinh 71', 2004, '', 12, 5, 1, '', 'hocsinh71@gmail.com', 0),
(76, 'hocsinh72', '$2y$10$AVII.AI98DWx3Lz0J/3ONOM1R/TBkSx0i9571qoAZ7ZTT5GFGh/aK', 'Học Sinh 72', 2004, '', 12, 5, 1, '', 'hocsinh72@gmail.com', 0),
(77, 'hocsinh73', '$2y$10$7h3TwiKeAAJcOIfG6zgzvuQNsgdeICp8Onbx87WrDtc.yI6vOKRYe', 'Học Sinh 73', 2004, '', 12, 5, 1, '', 'hocsinh73@gmail.com', 0),
(78, 'hocsinh74', '$2y$10$mfWIJszbCHhLAxNKoERVzO9oYjcHdncgNaWLLJnFMbwwGUFBGXF4.', 'Học Sinh 74', 2004, '', 12, 5, 1, '', 'hocsinh74@gmail.com', 0),
(79, 'hocsinh75', '$2y$10$CY4PwfmmPyt7T9v3h1hOfuL.uhcF6fbDnRcj39IsPPC3NIrxsXQgW', 'Học Sinh 75', 2004, '', 12, 5, 1, '', 'hocsinh75@gmail.com', 0),
(80, 'hocsinh76', '$2y$10$gIpNp0dUCQugXES4ews10.F9BFLDaJ6l9GGefuFcT.ZucljgTWYGu', 'Học Sinh 76', 2004, '', 12, 5, 1, '', 'hocsinh76@gmail.com', 0),
(81, 'hocsinh77', '$2y$10$lBrxL5rvt8jY6NAXLYNQ3OUgpWM44lq1g019qvYFNQ1R8I3HDvm3m', 'Học Sinh 77', 2004, '', 12, 5, 1, '', 'hocsinh77@gmail.com', 0),
(82, 'hocsinh78', '$2y$10$adicKjiqd.0UkLtP2GzwDOhehopyX0SoKGypSdHY7mhTxRT7GBEj2', 'Học Sinh 78', 2004, '', 12, 5, 1, '', 'hocsinh78@gmail.com', 0),
(83, 'hocsinh79', '$2y$10$obMKa0e3eIG5oJgVF2pTzu9vj5uw4yoROGPhQcn6Kq2oUzZOndtVK', 'Học Sinh 79', 2004, '', 12, 5, 1, '', 'hocsinh79@gmail.com', 0),
(84, 'hocsinh80', '$2y$10$Ch5VrKJFq5mBPS9UznVLVuq12IvoVf7QUoJNybmfx67fHkN2cRycW', 'Học Sinh 80', 2004, '', 12, 5, 1, '', 'hocsinh80@gmail.com', 0),
(85, 'hocsinh81', '$2y$10$QdX0m9Tk4N2vzsC5YPMAq.CY0C3hAvWkg.pdJF5gLLjcLcY5Vgkfe', 'Học Sinh 81', 2004, '', 12, 6, 1, '', 'hocsinh81@gmail.com', 0),
(86, 'hocsinh82', '$2y$10$aNUSWNvIJikXaf6t1Y8bBuaCDqOXUAE2CRAGEt5Jr9uPzSQ8W8WKi', 'Học Sinh 82', 2004, '', 12, 6, 1, '', 'hocsinh82@gmail.com', 0),
(87, 'hocsinh83', '$2y$10$RKB.XaKkcIJ8ErOmrL3u5.NGKY1/VoKfmEQGBxAfFnamItnpCIryq', 'Học Sinh 83', 2004, '', 12, 6, 1, '', 'hocsinh83@gmail.com', 0),
(88, 'hocsinh84', '$2y$10$.Bnn2hppL1Vs1KOvFERV0eQ7VuZcAG1Baw4ilJBvqiwvUlV4hZ4I.', 'Học Sinh 84', 2004, '', 12, 6, 1, '', 'hocsinh84@gmail.com', 0),
(89, 'hocsinh85', '$2y$10$EWGWlbwAirlUyROkVEgwb.43QGlTwwvZK5hsxIWGMNgvzydmes8OO', 'Học Sinh 85', 2004, '', 12, 6, 1, '', 'hocsinh85@gmail.com', 0),
(90, 'hocsinh86', '$2y$10$mpUIMlFR4JgmyGJWv2q4nOvZy/v5LNnAV/a0oqPXm1LOeWkPjx0wm', 'Học Sinh 86', 2004, '', 12, 6, 1, '', 'hocsinh86@gmail.com', 0),
(91, 'hocsinh87', '$2y$10$vhdp1UZuADgw9bcNQfffEO371fx6CQagbpvFo8tkP4A/N9DusGnce', 'Học Sinh 87', 2004, '', 12, 6, 1, '', 'hocsinh87@gmail.com', 0),
(92, 'hocsinh88', '$2y$10$WdJacyA7laZRu98LnvK9auoNtG8ifufj9ThADrNV.JN3qIUXUQFWa', 'Học Sinh 88', 2004, '', 12, 6, 1, '', 'hocsinh88@gmail.com', 0),
(93, 'hocsinh89', '$2y$10$bjcjPyKxrTTWW.N7zlUQOOg5lb8NmzjoSkNrsfycRZ0cunGS3iRNC', 'Học Sinh 89', 2004, '', 12, 6, 1, '', 'hocsinh89@gmail.com', 0),
(94, 'hocsinh90', '$2y$10$4zofCdj2gaAq4GKQzBFoheJ6wU66oShaLyqlO.wbZ28iUcQGwaz5u', 'Học Sinh 90', 2004, '', 12, 6, 1, '', 'hocsinh90@gmail.com', 0),
(95, 'hocsinh91', '$2y$10$1RplooFdqZEjpI1VEsTSUOZljol.yrFpf0IPI5ayNU8jicBlMiIBa', 'Học Sinh 91', 2004, '', 12, 6, 1, '', 'hocsinh91@gmail.com', 0),
(96, 'hocsinh92', '$2y$10$LxA.tpwpdDofH51dRhm6luhotjAR1g28ZHx9j8wCDtp2UXnuwJzli', 'Học Sinh 92', 2004, '', 12, 6, 1, '', 'hocsinh92@gmail.com', 0),
(97, 'hocsinh93', '$2y$10$DsciF6dd28VH5JNo7SOzTuqLHdwUqT7HUPShH/mOG7oOkCBftUXSi', 'Học Sinh 93', 2004, '', 12, 6, 1, '', 'hocsinh93@gmail.com', 0),
(98, 'hocsinh94', '$2y$10$lMLTz6/P6o7QG.lbNZC4y.zQ6N0BoSMskHHWvCnmqReu4ddFtQt32', 'Học Sinh 94', 2004, '', 12, 6, 1, '', 'hocsinh94@gmail.com', 0),
(99, 'hocsinh95', '$2y$10$gt4wpiFaNdpIxJj6DOTIK.kBoYLrhLDXntDI/awKj4AtSF3h3Is0y', 'Học Sinh 95', 2004, '', 12, 6, 1, '', 'hocsinh95@gmail.com', 0),
(100, 'hocsinh96', '$2y$10$OcHtiEgf11j0Tt5Bnp4u8O21C2nA0Nt/AUaWMvd.JeuA//vjbDxGC', 'Học Sinh 96', 2004, '', 12, 6, 1, '', 'hocsinh96@gmail.com', 0),
(101, 'hocsinh97', '$2y$10$gPOu7Dwj8QSL/nSli.HLp.q8y2u/fo5K85rqsqhjOOYQKmq0MlcDa', 'Học Sinh 97', 2004, '', 12, 7, 1, '', 'hocsinh97@gmail.com', 0),
(102, 'hocsinh98', '$2y$10$DFmZ3YkmHoCQLhUX.vFOpuQeS/qZHje.49jk1uIlW3e9FG3JbvfvG', 'Học Sinh 98', 2004, '', 12, 7, 1, '', 'hocsinh98@gmail.com', 0),
(103, 'hocsinh99', '$2y$10$PecAGnxm4i.nRTxycPJqp.Jm6Tg9EUk28AxGqkkVRpxC8oEA8g9MK', 'Học Sinh 99', 2004, '', 12, 7, 1, '', 'hocsinh99@gmail.com', 0),
(104, 'hocsinh100', '$2y$10$eYAj61JukNIYilsgi4OzIuazK6tMurVNDSpWs9R6RuYpDKTYsMx2W', 'Học Sinh 100', 2004, '', 12, 7, 1, '', 'hocsinh100@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `nhom`
--

CREATE TABLE `nhom` (
  `IdNhom` int(11) NOT NULL,
  `TenNhom` varchar(1000) NOT NULL,
  `Lop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nhom`
--

INSERT INTO `nhom` (`IdNhom`, `TenNhom`, `Lop`) VALUES
(0, 'Admin', 0),
(1, 'Toán lớp 10 2-4-6', 10),
(2, 'Toán lớp 10 3-5-7', 10),
(3, 'Toán lớp 11 2-4-6', 11),
(4, 'Toán lớp 11 3-5-7', 11),
(5, 'Toán lớp 12 2-4-6', 12),
(6, 'Toán lớp 12 3-5-7 (1)', 12),
(7, 'Toán lớp 12 3-5-7 (2)', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `de`
--
ALTER TABLE `de`
  ADD PRIMARY KEY (`IdDe`);

--
-- Indexes for table `de_cauhoi`
--
ALTER TABLE `de_cauhoi`
  ADD PRIMARY KEY (`IdDe`,`IdCauHoi`),
  ADD KEY `cst_nganhangcauhoi_de_cauhoi` (`IdCauHoi`);

--
-- Indexes for table `de_nhom`
--
ALTER TABLE `de_nhom`
  ADD PRIMARY KEY (`IdNhom`,`IdDe`),
  ADD KEY `cst_de_de_nhom` (`IdDe`);

--
-- Indexes for table `diem_de`
--
ALTER TABLE `diem_de`
  ADD PRIMARY KEY (`IdNguoiDung`,`IdDe`),
  ADD KEY `IdNguoiDung` (`IdNguoiDung`),
  ADD KEY `IdDe` (`IdDe`);

--
-- Indexes for table `nganhangcauhoi`
--
ALTER TABLE `nganhangcauhoi`
  ADD PRIMARY KEY (`IdCauHoi`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`IdNguoiDung`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `cst_nhom_nguoidung` (`IdNhom`);

--
-- Indexes for table `nhom`
--
ALTER TABLE `nhom`
  ADD PRIMARY KEY (`IdNhom`),
  ADD UNIQUE KEY `TenNhom` (`TenNhom`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `de`
--
ALTER TABLE `de`
  MODIFY `IdDe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nganhangcauhoi`
--
ALTER TABLE `nganhangcauhoi`
  MODIFY `IdCauHoi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `IdNguoiDung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `nhom`
--
ALTER TABLE `nhom`
  MODIFY `IdNhom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `de_cauhoi`
--
ALTER TABLE `de_cauhoi`
  ADD CONSTRAINT `cst_de_de_cauhoi` FOREIGN KEY (`IdDe`) REFERENCES `de` (`IdDe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cst_nganhangcauhoi_de_cauhoi` FOREIGN KEY (`IdCauHoi`) REFERENCES `nganhangcauhoi` (`IdCauHoi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `de_nhom`
--
ALTER TABLE `de_nhom`
  ADD CONSTRAINT `cst_de_de_nhom` FOREIGN KEY (`IdDe`) REFERENCES `de` (`IdDe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cst_nhom_de_nhom` FOREIGN KEY (`IdNhom`) REFERENCES `nhom` (`IdNhom`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diem_de`
--
ALTER TABLE `diem_de`
  ADD CONSTRAINT `cst_de_diem_de` FOREIGN KEY (`IdDe`) REFERENCES `de` (`IdDe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cst_nguoidung_diem_de` FOREIGN KEY (`IdNguoiDung`) REFERENCES `nguoidung` (`IdNguoiDung`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD CONSTRAINT `cst_nhom_nguoidung` FOREIGN KEY (`IdNhom`) REFERENCES `nhom` (`IdNhom`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
