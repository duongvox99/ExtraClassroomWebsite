-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2019 at 12:45 PM
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
  `HienDapAn` int(11) NOT NULL,
  `NgayTaoDe` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Lop` int(11) NOT NULL,
  `Tuan` int(11) NOT NULL,
  `SoCauDe` int(11) NOT NULL,
  `SoCauTrungBinh` int(11) NOT NULL,
  `SoCauKho` int(11) NOT NULL,
  `ThoiGian` int(11) NOT NULL
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
(1, '<p>Hàm số y = 2sinxcosx + cos2x có giá trị lớn nhất là</p>', '<p>3</p>', '<p>2√2</p>', '<p>2</p>', '<p>√2</p>', 1, '<p>Ta có y = sin2xcos2x = √2 sin(2x + π/4) nên giá trị lớn nhất của hàm số là √2.</p>', 1, 11, 46),
(2, '<p>Hàm số y = (sinx – cosx)2 + cos2x có giá trị nhỏ nhất là:</p>', '<p>- 1</p>', '<p>1- √2</p>', '<p>0</p>', '<p>1 + √2</p>', 2, '<p style=\"text-align:justify;\">Ta có y = sin2x + cos2x -2sinxcosx + cos2x</p><p style=\"text-align:justify;\">= 1 – sin2x + cos2x = 1 - √2 sin(2x - π/4).</p><p style=\"text-align:justify;\">Từ đó suy ra giá trị nhỏ nhất của hàm số là 1 - √2.</p>', 1, 11, 46),
(3, '<p>Hàm số y = 2cos2x – 1 là hàm tuần hoàn với chu kì:</p>', '<p>T = π.</p>', '<p>T = 2π.</p>', '<p>T = π2.</p>', '<p>T = π/2.</p>', 1, '<p>Ta có y = 2cos2x – 1 = cos2x, do đó hàm số tuần hoàn với chu kì T = 2π/2 = π.</p>', 1, 11, 46),
(4, '<p>Hàm số y = sin(π/2-x) + cotx/3 là hàm tuần hoàn với chu kì:</p>', '<p>T = π.</p>', '<p>T = 2π.</p>', '<p>T = 3π.</p>', '<p>T = 6π.</p>', 1, '<p style=\"text-align:justify;\">Hàm số y1 = sin(π/2-x) có chu kì T1 = 2π/|-1| = 2π;</p><p style=\"text-align:justify;\">Hàm số y2 = cot(x/3) có chu kì T2 = 2π/|1/3| = 3 π. Suy ra hàm số đã cho y = y1 +y2 có chu kì T =BCNN(2,3).π = 6π.</p>', 1, 11, 46),
(5, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/aa33ab8656d4171726cb4727613a8c.png\"></figure><p>Hình vẽ bên là một phần đồ thị của hàm số nào sau đây?</p>', '<p>y = sinx/2</p>', '<p>y = cosx/2</p>', '<p>y = - cosx/4</p>', '<p>y = sin( - x/2)</p>', 1, '<p>Đồ thị hàm số đi qua gốc tọa độ nên loại ngay các phương án B và C. Đồ thị hàm số đi qua (π; -1) nên phương án A cũng không thỏa mãn.</p><p>Nhận xét: Từ đồ thị ta nhận thấy hàm số có chu kì T =4π nên ta có thể loại ngay phương án C.</p>', 1, 11, 46),
(6, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/c4f73a20e4fb87db15e8a74ec18f93.png\"></figure><p>Hình vẽ bên là một phần đồ thị của hàm số nào sau đây?</p>', '<p>y = sinx/2</p>', '<p>y = sinx</p>', '<p>y = cosx/2</p>', '<p>y = cosx</p>', 1, '<p>Từ đồ thị ta nhận thấy hàm số có chu kì T =4π loại 3 đáp án còn lại.</p>', 1, 11, 46),
(7, '<p>Hàm số y = cosx/(2sinx- √3) có tập xác định là:</p>', '<p>R{π/3+k2π, k ∈ Z}.</p>', '<p style=\"text-align:justify;\">R{π/6+kπ, k ∈ Z}.</p>', '<p>R{π/6+k2π, 5π/6+k2π, k ∈ Z}.</p>', '<p>R{π/3+k2π, 2π/3+k2π, k ∈ Z}.</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/44ead1234aaececdca7b4d814236ee.png\"></figure>', 1, 11, 46),
(8, '<p>Hàm số y = tan(x/2 - π/4) có tập xác định là:</p>', '<p>R{π/2+k2π, k ∈ Z}.</p>', '<p>R{π/2+kπ, k ∈ Z}.</p>', '<p>R{3π/2+k2π, k ∈ Z}.</p>', '<p>R.</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/22dd517a03cf9951f161a42ecd3154.png\"></figure>', 1, 11, 46),
(9, '<p>Tập xác định của hàm số y = cot(2x - π/3) + 2 là:</p>', '<p>R{π/6+kπ, k ∈ Z}.</p>', '<p>R{π/6+k2π, k ∈ Z}.</p>', '<p>R{5π/12+kπ/2, k ∈ Z}.</p>', '<p>R{π/6+kπ/2, k ∈ Z}.</p>', 1, '<p>Hàm số y= cot(2x-π/3)+2 xác định khi và chỉ khi sin(2x-π/3)≠0</p>', 1, 11, 46),
(10, '<p>Hàm số :</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/adeaa97dd07c3bc831d29f5b71dcc7.png\"></figure><p>có tập xác định là:</p>', '<p>R{kπ, k ∈ Z}.</p>', '<p>R{π/2+π, k ∈ Z}.</p>', '<p>R{π/2+k2π, k ∈ Z}.</p>', '<p>R{kπ/2, k ∈ Z}</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6d68afab4f6df9700f68ce4a36e344.png\"></figure>', 1, 11, 46),
(11, '<p>Cho hàm số y = sinx/(1+tanx) và k ∈ Z.</p><p>Khoảng nào dưới đây không nằm trong tập xác định của hàm số?</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/5449249cbe06bf6eafe36b12f33163.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6a31e7f8d9147f1dd5fd20ccc83249.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/644e189df3f4eeb3899eb072efa39c.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/064866a691a751e6ee44afce88b087.png\"></figure>', 1, '', 2, 11, 46),
(12, '<p>Hàm số :</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/bc93f9c42d236c2a02e3e63121d9e6.png\"></figure><p>có tập xác định là:</p>', '<p>R</p>', '<p>R{k2π, k ∈ Z}.</p>', '<p>{k2π, k ∈ Z}.</p>', '<p>∅</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/243c82784b26927785a40f179c6655.png\"></figure>', 2, 11, 46),
(13, '<p>Hàm số y = sinxcos2x là:</p>', '<p>Hàm chẵn.</p>', '<p>Hàm không có tính chẵn, lẻ.</p>', '<p>Hàm không có tính tuần hoàn.</p>', '<p>Hàm lẻ.</p>', 1, '<p>Do y= sinx là hàm lẻ, y=cos2x là hàm chẵn nên hàm số y= sinx cos2x là hàm lẻ</p>', 2, 11, 46),
(14, '<p>Hàm số y = tan3x/ sin3x thỏa mãn tính chất nào sau đây?</p>', '<p>Hàm chẵn.</p>', '<p>Hàm không có tính chẵn, lẻ.</p>', '<p>Xác định trên R.</p>', '<p>Hàm lẻ.</p>', 1, '<p>Do y=sinx và y=tan3x là hàm lẻ nên</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/3f545c60fb1fd0e5f11cece5131fa6.png\"></figure>', 2, 11, 46),
(15, '<p>Trong các hàm số sau, hàm số nào là hàm lẻ?</p>', '<p>y = sin2x</p>', '<p>y = sin2x.cosx.</p>', '<p>y = tanx/cosx.</p>', '<p>y = cotx/sinx.</p>', 3, '<p>Do y=tanx là hàm lẻ, y=cosx là hàm chẵn nên đáp án cần chọn là C</p>', 2, 11, 46),
(16, '<p>Trong các hàm số sau, hàm số nào là hàm chẵn?</p>', '<p>y = tan2x/ tan2x +1</p>', '<p>y = sinx.cos2x</p>', '<p>y = cosx.sin2x</p>', '<p>y = cosxsin3x.</p>', 3, '<p>Do y=sin2x và y= cosx là hàm chẵn&nbsp;</p>', 2, 11, 46),
(17, '<p>Trong các hàm số sau, hàm số nào không là hàm chẵn và cũng không là hàm lẻ?</p>', '<p>y = tanx - 1/sinx.</p>', '<p>y = √2 sin(x - π/4).</p>', '<p>y = sinx + tanx.</p>', '<p>y = sin4x – cos4x.</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ea1160cc3776c8f447e7a34484bc06.png\"></figure>', 2, 11, 46),
(18, '<p>Hàm số y = (sinx + cosx)2 + cos2x có giá trị lớn nhất là:</p>', '<p>1+√2 &nbsp;</p>', '<p>3</p>', '<p>5</p>', '<p>√2</p>', 1, '<p>Ta có y=(sinx+cosx)2 + cos2x = 1+ sin2x+ cos2x= 1+√2sin(2x+π/4), suy ra hàm số có giá trị lớn nhất là 1+√2</p>', 2, 11, 46),
(19, '<p>Hàm số y = √3sinx – cosx có giá trị nhỏ nhất là:</p>', '<p>1 – √3&nbsp;</p>', '<p>- √3</p>', '<p>– 2 &nbsp;</p>', '<p>– 1 – √3</p>', 3, '<p>Ta có y= √3 sinx- cosx</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/11b423430eded577fbdbe482691944.png\"></figure>', 2, 11, 46),
(20, '<p>Cho hàm số y = (cosx-1)/(cosx+2). Mệnh đề nào trong số các mệnh đề sau đây là sai?</p>', '<p>Tập xác định của hàm số là ℝ.</p>', '<p>Hàm số có giá trị lớn nhất bằng 0.</p>', '<p>Hàm số có giá trị nhỏ nhất bằng - 2.</p>', '<p>Hàm số tuần hoàn với chu kì T = 2.</p>', 1, '<p>Dễ nhận thấy đáp án A,B,C thỏa mãn nên đáp án cần chọn là D. Có thể nhận thấy ngay hàm số</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6e2df2a069a8e37ead6c356a88fddd.png\"></figure>', 2, 11, 46),
(21, '<p>Hàm số nào sau đây có giá trị lớn nhất bằng 2?</p>', '<p>y = tanx – cotx</p>', '<p>y = 2tanx</p>', '<p>y = √2(cosx – sinx)</p>', '<p>y = sin(2x - π/4)</p>', 3, '<p style=\"text-align:justify;\">Các hàm số y= tanx- cotx và y= 2tanx không có giá trị lớn nhất, hàm số y= sin(2x-π/4) có giá trị lớn nhất là 1</p><p style=\"text-align:justify;\">Cũng có thể nhận ngay ra đáp án C vì :</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/873d26fb109ecd41f7dbe2b1bb9582.png\"></figure>', 3, 11, 46),
(22, '<p>Giá trị nhỏ nhất của hàm số y = 3- 4sin2xcos2x là:</p>', '<p>– 1 &nbsp;</p>', '<p>2</p>', '<p>1 &nbsp;</p>', '<p>3</p>', 2, '<p>Ta có y= 3- 4sin2xcos2x= 3- sin22x≥2, dấu phẩy đẳng thức xảy ra khi sin22x= 1</p>', 3, 11, 46),
(23, '<p>Hàm số y = √(1-cos2x) có chu kì là:</p>', '<p>2π</p>', '<p>√2π</p>', '<p>π</p>', '<p>√π</p>', 3, '<p>Tập xác định của hàm số đã cho là R mà cos2x có chu kì là π nên y= √(1-cos2x) cũng có chu kì là π</p>', 3, 11, 46),
(24, '<p>Hai hàm số nào sau đây có chu kì khác nhau?</p>', '<p>cos(x/2) và sin(x/2).</p>', '<p>Sinx và tanx.</p>', '<p>cosx và cot(x/2).</p>', '<p>tan2x và cot2x.</p>', 2, '<p>Hàm số sinx có chu kì là 2π, hàm số tanx có chu kì là π</p>', 3, 11, 47),
(25, '<p>Chu kì của hàm số y = 2sin(2x + π/3) -3cos(2x - π/4) là:</p>', '<p>2π&nbsp;</p>', '<p>π</p>', '<p>π/2</p>', '<p>4 π</p>', 2, '<p>Chu kì của hàm số</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/7247ddf546ddb3f7d03c1290412430.png\"></figure>', 3, 11, 47),
(26, '<p>Chu kì của hàm số y = sin2x -2cos3x là:</p>', '<p>2π</p>', '<p>π</p>', '<p>(2π)/3 &nbsp;</p>', '<p>π/3</p>', 1, '<p>Chu kì của hàm số y=sin2x là π, chu kì của hàm số y=cos3x là (2π)/3 nên chu kì của hàm số đã cho là 2π</p>', 3, 11, 47),
(27, '<p>Phương trình sinx = cosx có số nghiệm thuộc đoạn [0;2π] là:</p>', '<p>2</p>', '<p>5</p>', '<p>6</p>', '<p>5</p>', 1, '<p>Ta có sinx = cosx ⇔ sinx = sin(π/2 – x)</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/801e4f5eff2189017fc90050882422.png\"></figure><p>Do x ∈ [0;π] nên k = 0. Vậy chỉ cos1 nghiệm của phương trình thuộc [0;π].</p>', 3, 11, 47),
(28, '<p>Phương trình sin2x = 1 có nghiệm là:</p>', '<p>π/2+k4π, k ∈ Z.</p>', '<p>π/2+kπ, k ∈ Z.</p>', '<p>π/4+k2π, k ∈ Z.</p>', '<p>π/4+kπ, k ∈ Z.</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ebbc4b4edda2f8289c8371a483c66e.png\"></figure>', 3, 11, 47),
(29, '<p>Phương trình sinx = cosx có số nghiệm thuộc đoạn [0;π] là:</p>', '<p>1</p>', '<p>4</p>', '<p>5</p>', '<p>2</p>', 1, '<p>Ta có sinx = cosx ⇔ sinx = sin(π/2 – x)</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/01b166ebd13ff6e9d7f0ba246d57b6.png\"></figure><p>Do x ∈ [0;π] nên k = 0. Vậy chỉ cos1 nghiệm của phương trình thuộc [0;π].</p>', 3, 11, 47),
(30, '<p>Phương trình sin2 x/3 = 1 có nghiệm là:</p>', '<p>π/2+k2π, k ∈ Z.</p>', '<p>3π/2+k2π, k ∈ Z.</p>', '<p>3π/2+k3π, k ∈ Z.</p>', '<p>kπ, k ∈ Z.</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/cae9a5b9f5eaa2c440718fcba273f7.png\"></figure>', 3, 11, 47),
(31, '<p>Phương trình 2cosx - √3 = 0 có tập nghiệm trong khoảng (0;2π) là:</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/24d6a3254e97088bd97a5b97b6489d.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/22dec03c837a5fb7ef1ccd55cbb8b1.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/d7fb663332d5969db1e8a28c8654f4.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ab03b6002e5831e3f322a8a3c11611.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/5d723e4c7f22a13a740134adc9837a.png\"></figure><p>Do x ∈ (0;2π) nên tập nghiệm của phương trình là {π/6; 11π/6}&nbsp;</p>', 1, 11, 47),
(32, '<p>Phương trình sin(πcos2x) = 1 có nghiệm là:</p>', '<p>x = kπ, k ∈ Z.</p>', '<p>π+k2π, k ∈ Z.</p>', '<p>π/2+kπ, k ∈ Z.</p>', '<p>±π/6+kπ, k ∈ Z.</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/22616957117ccbd81d326b232588b7.png\"></figure>', 1, 11, 47),
(33, '<p>Phương trình cosx/2 = - 1 có nghiệm là:</p>', '<p>x = 2π + k4π, k ∈ Z.</p>', '<p>x = k2π, k ∈ Z.</p>', '<p>x = π + k2π, k ∈ Z.</p>', '<p>x = 2π + kπ, k ∈ Z.</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/4b935fa9069246b045a0487ae51e03.png\"></figure>', 1, 11, 47),
(34, '<p>Phương trình cos23x = 1 có nghiệm là:</p>', '<p>x = kπ, k ∈ Z.</p>', '<p>x =kπ/2, k ∈ Z.</p>', '<p>x =kπ/3, k ∈ Z.&nbsp;&nbsp;</p>', '<p>x =kπ/4, k ∈ Z.</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/d4e501975e1c615406d34d78528212.png\"></figure>', 1, 11, 47),
(35, '<p>Phương trình tan( x - π/4) = 0 có nghiệm là:</p>', '<p>x = π/4 + kπ, k ∈ Z.</p>', '<p>x = 3π/4 + kπ, k ∈ Z.</p>', '<p>x = kπ, k ∈ Z.&nbsp;</p>', '<p>x = k2π, k ∈ Z.</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/932c828205b63ff7b6878d9c80b1af.png\"></figure>', 1, 11, 47),
(36, '<p>Phương trình cot( x + π/4) = 0 có nghiệm là:</p>', '<p>x = - π/4 + kπ, k ∈ Z.</p>', '<p>x = π/4 + kπ, k ∈ Z.</p>', '<p>x = - π/4 + k2π, k ∈ Z.&nbsp;</p>', '<p>x = π/4 + k2π, k ∈ Z.</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/4f941b5233baf143644bb30bf0a9ad.png\"></figure>', 1, 11, 47),
(37, '<p>Trong [0;π],phương trình sinx = 1 – cos2x có tập nghiệm là:</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/23569c1ea87d6b566f7f1e6d4823ee.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/8bfd1232e183052611829faf31f5fe.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/afc297cf885b681c5a6e0199a6da66.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/bd113e840a599be71fc8f20e0ef8b7.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/3078afc9052dd844ec34ab87b275ba.png\"></figure><p>x ∈ [0;π]</p>', 1, 11, 47),
(38, '<p style=\"text-align:justify;\">Trong [0;2 π), phương trình cos2x + sinx = 0 có tập nghiệm là:</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/149840df9e1b5c1b7e52e32fc37c8c.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/fc849f58217c0252e88af5e709facc.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/0dc788d410ef5ae8a5dbb310fd04e1.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/68879e39d7c5736cde58b5bf52514b.png\"></figure>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/9bf4d2b607e7c96414771376971d49.png\"></figure>', 1, 11, 47),
(39, '<p>Phương trình sinx + √3cosx = 1 có số nghiệm thuộc (0;3π) là:</p>', '<p>2&nbsp;</p>', '<p>3</p>', '<p>4&nbsp;</p>', '<p>6</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/5e0333464e775c806045bab2e149ed.png\"></figure>', 1, 11, 47),
(40, '<p>Số nghiệm của phương trình:</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/8487c90f3d37982926199e912cb04b.png\"></figure>', '<p>0&nbsp;</p>', '<p>2</p>', '<p>1</p>', '<p>3</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/be0021bb886df79229c25ea06f8f39.png\"></figure>', 1, 11, 47),
(41, '<p>Số nghiệm của phương trình:</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/9eafd3c747238dd591d2299492cf0e.png\"></figure>', '<p>0&nbsp;</p>', '<p>2</p>', '<p>1</p>', '<p>3</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/5d2cb7c0230ecb69c1d370711257de.png\"></figure>', 1, 11, 47),
(42, '<p>Số nghiệm của phương trình sin(x + π/4) = 1 thuộc [0;3π] là:</p>', '<p>1</p>', '<p>0</p>', '<p>2</p>', '<p>3</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/09501e1a86fc59153032597ec52496.png\"></figure>', 2, 11, 47),
(43, '<p>Trong các phương trình sau, phương trình nào có nghiệm?</p>', '<p>√3sinx = 2</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ef3cd258931fb5f30746dd66f30925.png\"></figure>', '<p>2sinx + 3cosx =1</p>', '<p>Cot2x – cotx +5 = 0</p>', 3, '<p>do 22 + 32 &gt; 12</p>', 2, 11, 47),
(44, '<p>Trong các phương trình sau, phương trình nào vô nghiệm?</p>', '<p>sin2x – cos2x = 1</p>', '<p>sin2x – cosx = 0</p>', '<p>sinx = 2π/5</p>', '<p>sinx - √3cosx = 0</p>', 3, '<p>do 2π/5 &gt; 1</p>', 2, 11, 47),
(45, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/f6785a28fa0aa3be92289606aaf6f9.png\"></figure>', '<p>{2π/3}</p>', '<p>{3π/2}</p>', '<p>{π/3; 2π/3}&nbsp;</p>', '<p>{π/2; 3π/2}</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/abc00ac94edf935a2745fc1d091477.png\"></figure>', 2, 11, 47),
(46, '<p>Tập nghiệm của phương trình cos2x – cos2x = 0 trong khoảng [0;2π) là:</p>', '<p>{0;π}&nbsp;</p>', '<p>{0;π/2}</p>', '<p>{π/2; 3π/2}&nbsp;</p>', '<p>{0; 3π/2}</p>', 1, '<p>Ta có cos2x – cos2x= 0 ↔ sin2x=0 ↔ x= kπ, k∈Z. Tập nghiệm của phương trình cos2x– cos2x= 0 trong khoảng [0,2π) là {0; π}</p>', 2, 11, 47),
(47, '<p>Phương trình cos(πsinx) = 1 có nghiệm là:</p>', '<p>x = kπ, k ∈ Z.</p>', '<p>x = π + k2π, k ∈ Z.</p>', '<p>π/2+kπ, k ∈ Z.</p>', '<p>π/4+kπ, k ∈ Z.</p>', 1, '<p>Ta có cos( πsinx) = 1 ↔ πsinx = k2π ↔ sinx = 2k, k ∈ Z. Do -1≤ sinx ≤1 nên k = 0 → sinx = 0 → x = kπ, k ∈ Z</p>', 2, 11, 47),
(48, '<p>Phương trình cos(πcos3x) = 1 có nghiệm là:</p>', '<p>x = π/8+k π/4, k ∈ Z.</p>', '<p>x = π/4+k π/2, k ∈ Z.</p>', '<p>x = π/6+k π/3, k ∈ Z.</p>', '<p>x = π/2+kπ, k ∈ Z.</p>', 3, '<p>Ta có cos(πcos3x)=1 ↔ πcos3x= k2π ↔ cos3x= 2k, k∈Z. Do -1≤cos3x≤1 nên k=0 → cos3x= 0 → 3x= π/2+kπ, k∈Z</p>', 2, 11, 47),
(49, '<p>Phương trình</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/d6a19631533b156246d5e37313158d.png\"></figure><p>có tập nghiệm là:</p>', '<p>{π/2+kπ, k ∈ Z}&nbsp;</p>', '<p>{π/2+k2π, k ∈ Z}</p>', '<p>∅</p>', '<p>{-π/2+k2π, k ∈ Z}</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/a36a6967186ba19d20483421f33827.png\"></figure><p>từ đó suy ra phương trình vô nghiệm</p>', 2, 11, 47),
(50, '<p>Phương trình</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/cd5fa7ddc61169b62100130f19a9a7.png\"></figure><p>có tập nghiệm là:</p>', '<p>{π/3+k2π, k ∈ Z}</p>', '<p>{±π/3+k2π, k ∈ Z}</p>', '<p>{±π/3+k2π, - π/2+k2π, k ∈ Z}</p>', '<p>{- π/2+k2π, k ∈ Z}</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/029d599d3200148bbc5b249048b180.png\"></figure><p style=\"text-align:justify;\">⇔ sin2x + 2cosx- sinx- 1= 0 ⇔ (2cosx- 1)(1+sinx)= 0 ⇔ 2cosx – 1= 0 ( 1+ sinx ≠ 0 do cosx ≠0)</p><p style=\"text-align:justify;\">Đối chiếu điều kiện, suy ra tập nghiệm của phương trình là</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/58c95d57e13d572e1a0eba3f866bd0.png\"></figure>', 2, 11, 47),
(51, '<p>{-6; -3; 0; 3; 6; 9}</p>', '<p>{-6; -3; 0; 3; 6; 9}</p>', '<p>{5,3,4,2,9,7}</p>', '<p>{-3; 0; 3; 6; 9}</p>', '<p>{-1; 0; 1; 2; 3}</p>', 1, '<p style=\"text-align:justify;\">A={3k|k ∈ N,-2 &lt; k ≤ 3}</p><p style=\"text-align:justify;\">k ∈ N,-2 &lt; k ≤ 3 ⇒ k ∈ {-1;0;1;2;3}</p><p style=\"text-align:justify;\">⇒ 3k ∈ {-3;0;3;6;9}</p>', 1, 10, 45),
(52, '<p style=\"text-align:justify;\">Tập hợp A có 3 phần tử. Vậy tập hợp A có bao nhiêu tập hợp con?</p>', '<p>2</p>', '<p>4</p>', '<p>8</p>', '<p>18</p>', 3, '<p>Tập hợp A có 3 phần tử ⇒ Số tập hợp con là 23 = 8</p>', 1, 10, 47),
(53, '<p style=\"text-align:justify;\">Cho hai tập hợp A={k2 |k ∈ N và |k| ≤ 1} và</p><p style=\"text-align:justify;\">B={x ∈ R|x3 - 3x2 + 2x = 0}. Tập hợp AB là</p>', '<p>∅</p>', '<p>{0;1}</p>', '<p>{2}</p>', '<p>{0;1;2}</p>', 1, '<p style=\"text-align:justify;\">A={k2 |k ∈ N và |k| ≤ 1} ⇒ A={0;1}</p><p style=\"text-align:justify;\">B={x ∈ R|x3 - 3x2 + 2x = 0} ⇒ B={0;1;2}</p><p style=\"text-align:justify;\">⇒ AB = ∅</p>', 1, 10, 45),
(54, '<p>Cho hai tập hợp:A=(-∞;-3) ∪ [2; +∞) và B=(-5;4). Tính A ∩ B</p>', '<p>(-3;2)</p>', '<p>(-5; -3) ∪ [2;4)</p>', '<p>(-∞;-5) ∪ {2;4}</p>', '<p>(-5;2)</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/1008b23e0e8f26dc153dfa18063842.png\"></figure>', 1, 10, 45),
(55, '<p>Số phần tử của tập hợp A={x ∈ R|(x2 - x)(x4 - 4x2 + 3)= 0} là</p>', '<p>6</p>', '<p>2</p>', '<p>3</p>', '<p>5</p>', 1, '<p>A={x ∈ R|(x2 - x)(x4 - 4x2 + 3)= 0}</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/b0335bd7a83125607ba716cfdb0c11.png\"></figure><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ed07bf7a91d7c03637412d23226866.png\"></figure>', 1, 10, 45),
(56, '<p>Cho 3 tập hợp: A=[-3;5);B=[-4;1];C=(-4;-3]. Tìm câu sai?</p>', '<p>A ∩ B=(-3;1]</p>', '<p>(A ∪ B) ∪ C=[-4;5]</p>', '<p>CB C=(-3;1]</p>', '<p>BA=[-4; -3)</p>', 2, '<p style=\"text-align:justify;\">A=[-3;5);B=[-4;1];C=(-4;-3]</p><p style=\"text-align:justify;\">Ta có: A ∪ B=[-4;5)</p><p style=\"text-align:justify;\">⇒ (A ∪ B) ∪ C=[-4;5)</p>', 1, 10, 47),
(57, '<p>Cho hai tập hợp: E={x ∈ R|f(x)=0},F={x ∈ R| g(x)=0}, và tập hợp G={x ∈ R|f2 (x) + g2 (x)= 0}. Mệnh đề nào sau đây đúng?</p>', '<p>G=E ∩ F</p>', '<p>G=E ∪ F</p>', '<p>G=EF</p>', '<p>G=FE</p>', 1, '<p style=\"text-align:justify;\">E={x ∈ R|f(x)=0},F={x ∈ R| g(x)=0},</p><p style=\"text-align:justify;\">G={x ∈ R|f2 (x) + g2 (x)= 0}</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/b8786d5eaa679dc46a98f69c438cfb.png\"></figure><p>Do đó: G=E∩F.</p>', 1, 10, 47),
(58, '<p>Cho hai tập hợp: E={x ∈ R|f(x)=0},F={x ∈ R| g(x)=0}, và tập hợp</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/24da2a9638d9489edaf8a712cf509b.png\"></figure>', '<p>Q=E ∩ F</p>', '<p>Q=E ∪ F</p>', '<p>Q=EF</p>', '<p>Q=FE</p>', 1, '<p>E={x ∈ R|f(x)=0},F={x ∈ R| g(x)=0},</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/c8a6d231d72ffb9ff36cdfcef21c96.png\"></figure>', 1, 10, 47),
(59, '<p>Cho hai tập hợp: A=[2m - 1; +∞),B=(-∞;m + 3].A ∩ B ≠ ∅ khi và chỉ khi:</p>', '<p>m ≤ 4</p>', '<p>m ≤ 3</p>', '<p>m ≤ -4</p>', '<p>m ≥ -4</p>', 1, '<p style=\"text-align:justify;\">Giả sử A ∩ B= ∅ ⇒ m + 3 &lt; 2m - 1⇔ m &gt; 4</p><p style=\"text-align:justify;\">Vậy A ∩ B≠ ∅ ⇔ m ≤ 4.</p>', 1, 10, 47),
(60, '<p>Cho hai tập hợp:A=[m;m + 2],B=[2m - 1;2m + 3]. .A ∩ B ≠ ∅ khi và chỉ khi:</p>', '<p>-3 &lt; m &lt;3</p>', '<p>-3 &lt; m ≤ 3</p>', '<p>-3 ≤ m &lt;3</p>', '<p>-3 ≤ m ≤ 3</p>', 1, '<p>Giả sử A ∩ B= ∅ ⇒</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/30054bf54f9415c015a5ff13e64ae6.png\"></figure><p>⇒ A ∩ B≠ ∅ ⇔-3 ≤ m ≤ 3.</p>', 1, 10, 47),
(61, '<p>Cho tập . Số các tập con của A gồm hai phần tử, trong đó có phần tử 0 là:</p>', '<p>7</p>', '<p>8</p>', '<p>9</p>', '<p>10</p>', 3, '<p style=\"text-align:justify;\">Gọi tập con của A thỏa mãn đề bài là X={0;x} với x ∈ {1;2;3;4;5;6;7;8;9}</p><p style=\"text-align:justify;\">Suy ra số các tập con của A gồm hai phần tử, trong đó có phần tử 0 là 9.</p>', 2, 10, 47),
(62, '<p>Cho tập A=[m;8 - m], số m bằng bao nhiêu thì tập A sẽ là một đoạn có độ dài bằng 5 đơn vị dài:</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/a620a70d5bbc256411ffc4cf0b258e.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/7461e2579046d001f577b1f9e3b29d.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/d4d9ecdde020aa06ee1c6ca7b25872.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/e6b0ec54394aaf03d07c472410b138.png\"></figure>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6c3ecd4556109479a4746e01cf3d03.png\"></figure>', 2, 10, 47),
(63, '<p>Cho hai tập hợp A=[-1;3],B=[m;m+5]. Để A ∩ B=A thì m thuộc tập nào sau đây:</p>', '<p>[-1;0]</p>', '<p>[-3; -2]</p>', '<p>[-2; -1]</p>', '<p>[1;2]</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/0480563b1307d8130fbbfaba70b129.png\"></figure>', 2, 10, 47),
(64, '<p>Một lớp học có 16 học sinh học giỏi môn Toán; 12 học sinh học giỏi môn Văn; 8 học sinh vừa học giỏi môn Toán và Văn; 19 học sinh không học giỏi cả hai môn Toán và Văn. Hỏi lớp học có bao nhiêu học sinh?</p>', '<p>39.</p>', '<p>54.</p>', '<p>31.</p>', '<p>47</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/18b33ce01dea08490522cf27da80b8.png\"></figure>', 2, 10, 47),
(65, '<p>Trong số 45 học sinh của lớp 10A có 15 bạn xếp học lực giỏi, 20 bạn xếp hạnh kiểm tốt, trong đó 10 bạn vừa học lực giỏi vừa hạnh kiểm tốt. Hỏi lớp 10A có bao nhiêu bạn chưa được xếp học lực giỏi hoặc hạnh kiểm tốt?</p>', '<p>20.</p>', '<p>25.</p>', '<p>15.</p>', '<p>10.</p>', 1, '<p style=\"text-align:justify;\">Giả sử A= \"Hs xếp học lực giỏi\"</p><p style=\"text-align:justify;\">B= \"Hs hạnh kiểm tốt \"</p><p style=\"text-align:justify;\">A ∪ B= \"Hs xếp học lực giỏi hoặc hạnh kiểm tốt\"</p><p style=\"text-align:justify;\">A ∩ B= \"Hs vừa học lực giỏi vừa hạnh kiểm tốt\"</p><p style=\"text-align:justify;\">Số phần tử của A B là: 15 + 20 - 10 = 25</p><p style=\"text-align:justify;\">Số học sinh có học lực giỏi hoặc hạnh kiểm tốt: 25</p><p style=\"text-align:justify;\">Số học sinh chưa có học lực giỏi hoặc hạnh kiểm tốt: 45 – 25 = 20</p>', 2, 10, 47),
(66, '<p>Cho số gần đúng a=23748023 với độ chính xác d=101. Hãy viết số quy tròn của số a</p>', '<p>23749000</p>', '<p>23748000</p>', '<p>23747000</p>', '<p>23746000</p>', 2, '<p style=\"text-align:justify;\">Do d = 101 nên ta quy tròn số đến hàng nghìn.</p><p style=\"text-align:justify;\">Vậy số quy tròn là 23748000.</p>', 2, 10, 47),
(67, '<p>Giả sử biết số gần đúng là 9382,7. Sai số tuyệt đối khi quy tròn số này đến hàng chục là:</p>', '<p>7,2</p>', '<p>2,3</p>', '<p>0,3</p>', '<p>2,7</p>', 1, '<p style=\"text-align:justify;\">Giả sử biết số gần đúng là 9382,7.</p><p style=\"text-align:justify;\">Khi quy tròn số đến hàng chục ta được: 9380</p><p style=\"text-align:justify;\">Vậy sai số tuyệt đối là ∆=|9382,7-9380|=2,7</p>', 2, 10, 47),
(68, '<p>Một thửa ruộng hình chữ nhật có chiều dài là x=23 ± 0,01 m và chiều rộng là y=15 ± 0,01m. Tính diện tích S của thửa ruộng đã cho.</p>', '<p>S=345 ± 0,001m</p>', '<p>S=345 ± 0,83m</p>', '<p>S=345 ± 0,01m</p>', '<p>S=345 ± 0,3801m</p>', 1, '<p style=\"text-align:justify;\">Ta có: S=x.y=(23 ± 0,01)(15 ± 0,01)</p><p style=\"text-align:justify;\">=23.15 ± (23.0,01 + 15.0,01 + 0,012 )=345 ± 0,3801 (m2).</p>', 2, 10, 47),
(69, '<p>Số học sinh giỏi của 30 lớp ở một trường THPT &nbsp;được thống kê lại như sau</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6c23955cceade441cc301ab1ece4ef.png\"></figure><p>Dấu hiệu và đơn vị điều tra ở đây là gì? Kích thước mẫu bao nhiêu?</p>', '<p>Dấu hiệu là 30 lớp, đơn vị điều tra là mỗi lớp của trường THPT A</p>', '<p>Dấu hiệu là học sinh giỏi, đơn vị điều tra 30 lớp</p>', '<p>Dấu hiệu trường THPT A, đơn vị điều tra là 30 lớp</p>', '<p>Dấu hiệu là học sinh giỏi, đơn vị điều tra là mỗi lớp của trường THPT A</p>', 1, '<p>Dấu hiệu là học sinh giỏi, đơn vị điều tra là mỗi lớp của trường THPT &nbsp;</p><p>Kích thước mẫu là 30</p>', 2, 10, 47),
(70, '<p>Số học sinh trung bình của 30 lớp ở 1 trường THCS được ghi lại như sau</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/51b69c181b01224a612276bf497e54.png\"></figure><p>Viết các giá trị khác nhau trong mẫu số liệu trên?</p>', '<p>0; 1;2; 3;4</p>', '<p>0;1;2;3;4;5</p>', '<p>0;1;2;3;4;5;6</p>', '<p>Tất cả sai</p>', 3, '<p>Dựa vào bảng thống kê trên ta thấy: các giá trị khác nhau của mẫu số liệu trên là 0;1;2;3;4;5;6.</p>', 2, 10, 47),
(71, '<p>Chọn mệnh đề đúng?</p>', '<p>Để&nbsp; đo mức độ phân tán của các&nbsp; số liệu thống kê thì ta dùng phương sai và độ lệch chuẩn</p>', '<p>Phương sai càng nhỏ thì&nbsp; mức độ phân tán&nbsp; của các số liệu thống kê càng lớn</p>', '<p>Khi các số liệu chênh lệch nhau nhiều ta nên dùng số trung bình đại diện cho mẫu số liệu</p>', '<p>Tất cả các mệnh đề trên đều sai</p>', 1, '<p>Phương sai và độ lệch chuẩn đều được dùng để đánh giá mức độ phân tán của&nbsp; các số liệu thống kê so với số trung bình cộng.</p>', 3, 10, 47),
(72, '<p>Trong các hoạt động sau đây, hoạt động nào không liên quan đến thống kê?</p>', '<p>Thu thập số liệu</p>', '<p>Phân tích các số liệu&nbsp; thu thập được</p>', '<p>Xử lí các số liệu thu thập được</p>', '<p>Ra quyết định dựa trên số liệu</p>', 1, '<p>Thống kê là khoa học nghiên cứu các phương pháp thu thập; phân tích và xử lí các số liệu</p>', 3, 10, 47),
(73, '<p>Khi các số liệu chênh lệch nhau nhiều thì nên dùng số gì đặc trưng cho mẫu số liệu là tốt nhất?</p>', '<p>Số trung bình</p>', '<p>Số trung vị</p>', '<p>Mốt</p>', '<p>Phương sai</p>', 2, '<p>Khi các số liệu thống kê chênh lệch nhau nhiều thì số trung bình không đại diện được cho các số liệu đó. Khi đó ta chọn số đặc trưng khác đại diện cho mẫu số liệu đó là số trung vị.</p>', 3, 10, 47),
(74, '<p>Cho bảng số liệu thông kê điểm kiểm tra môn toán của lớp 10A. Hỏi tần số của giá trị 6 là bao nhiêu?</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/0434aa54884d41b6e62458ea1becd3.png\"></figure>', '<p>10</p>', '<p>11</p>', '<p>12</p>', '<p>13</p>', 2, '<p>Trong bảng số liệu trên giá trị 6 xuất hiện&nbsp; 11 lần nên tần số của giá trị 6 là 11.</p>', 3, 10, 47),
(75, '<p>Cho bảng phân bố tần số và tần suất:</p><p>Điểm kiểm tra 15 phút môn toán của một lớp học.</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/f4fa48bee7d178b67a47a65f0d7576.png\"></figure><p>Vậy (*) nhận giá trị là bao nhiêu?&nbsp;( làm tròn đến chữ số thập phân thứ 2)&nbsp;</p>', '<p>6,67%&nbsp;&nbsp;</p>', '<p>13,33%</p>', '<p>20%</p>', '<p>4,4%</p>', 1, '<p style=\"text-align:justify;\">Ta có: tần suất fi&nbsp;=niN<math xmlns=\"http://www.w3.org/1998/Math/MathML\" id=\"MathJax-Element-1-Frame\"><msub><mi>f</mi><mi>i</mi></msub><mo>&nbsp;</mo><mo>=</mo><mfrac><msub><mi>n</mi><mi>i</mi></msub><mi>N</mi></mfrac></math>&nbsp;100% &nbsp;trong đó N là kích thước mẫu và ni là&nbsp; tân số.</p><p style=\"text-align:justify;\">Do đó giá trị cần tìm là: f1=345100%<math xmlns=\"http://www.w3.org/1998/Math/MathML\" id=\"MathJax-Element-2-Frame\"><msub><mi>f</mi><mn>1</mn></msub><mo>=</mo><mfrac><mn>3</mn><mn>45</mn></mfrac><mn>100</mn><mo>%</mo></math>= 6,67%</p>', 3, 10, 47),
(76, '<p>Một bảng phân bố tần số có tối đa bao nhiêu giá trị mốt?</p>', '<p>1</p>', '<p>2</p>', '<p>3</p>', '<p>không kết luận được</p>', 1, '<p>Cho một bảng phân bố tần số; mốt của bảng phân bố tần số là giá trị có tần số lớn nhất. Mà trong bảng đó có thể có nhiều giá trị có tần số bằng nhau và lớn hơn tần số của các giá trị khác. Khi đó các giá trị đó đều là mốt.</p><p style=\"text-align:justify;\">Do đó; với 1 bảng phân bố tần số bất kì ta chưa thể kết&nbsp; luận về số giá trị mốt.</p>', 3, 10, 47),
(77, '<p>Để may đồng phục cho khối học sinh lớp năm của trường&nbsp; A. Người ta chọn ra một lớp 4A, thống kê chiều cao của 20 học sinh nữ và 25 học sinh nam lớp đó (tính bằng cm) được ghi lại như sau :</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6321cb27533207f82956738ee43f3c.png\"></figure><p>Dấu hiệu và đơn vị điều tra ở đây là gì? Kích thước mẫu bao nhiêu?</p>', '<p>Dấu hiệu là chiều cao của mỗi học sinh, đơn vị điều tra là một học sinh của lớp 4A. Kích thước mẫu là N= 45</p>', '<p>Dấu hiệu là trường A,&nbsp; đơn vị điều tra là một học sinh của lớp 4A. Kích thước mẫu là N= 25</p>', '<p>Dấu hiệu 45 học sinh, đơn vị điều tra là một học sinh của lớp 4A. Kích thước mẫu là N= 20</p>', '<p>Dấu hiệu là chiều cao của mỗi học sinh, đơn vị điều tra là một học sinh của lớp 4A. Kích thước mẫu là N= 25</p>', 1, '<p>Dấu hiệu là chiều cao của mỗi học sinh</p><p>Đơn vị điều tra là một học sinh của lớp 4A.</p><p>Lớp có 20 nữ và 25 nam nên có tất cả 45 học sinh. Do đó;&nbsp; kích thước mẫu là N= 45.</p>', 3, 10, 47),
(78, '<p>Cho bảng thống kê đo chiều cao học sinh như câu 6. Hỏi có bao nhiêu giá trị khác nhau?</p>', '<p>27</p>', '<p>45</p>', '<p>30</p>', '<p>29</p>', 1, '<p>Các giá trị khác nhau trong mẫu số liệu trên là :</p><p>102; 113; 138; 109; 98; 114; 101; 103; 127;; 118; 111; 130; 124; 115; 122; 126; 107; 134; 108; 99; 106; 104; 133; 147; 141; 138; 112</p><p>Như vậy có tất cả 29 giá trị khác nhau.</p>', 3, 10, 47),
(79, '<p>Thống kê điểm kiểm tra môn Toán của một lớp 10 có 22 học sinh nữ và 20 học sinh nam được cho ở bảng sau:</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/4c9897933675b3f977d8914c5df533.png\"></figure><p>Cho biết đơn vị điều tra và kích thước của mẫu số liệu trên?</p>', '<p>Đơn vị điều tra: môn Toán, kích thước của mẫu số liệu: 42</p>', '<p>Đơn vị điều tra: môn Toán, kích thước của mẫu số liệu: 22</p>', '<p>Đơn vị điều tra: một học sinh lớp 10, kích thước của mẫu số liệu: 20</p>', '<p>Đơn vị điều tra: một học sinh lớp 10, kích thước của mẫu số liệu: 42</p>', 1, '<p>Đơn vị điều tra: một hsinh lớp 10.</p><p>Do lớp học có 22 nữ và 20 nam nên lớp có&nbsp; tất cả 42 học sinh . Do đó; kích thước của mẫu số liệu: 42</p>', 3, 10, 47),
(80, '<p>Huyện X có 3 thôn; biết thôn A có 12 gia đình; thôn B có 15 gia đình và thôn C có 13 gia đình. Số con trong mỗi gia đình được thống kê lại như sau</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/20169ce8aa9af2169d686828eb5d60.png\"></figure><p>Dấu hiệu và đơn vị điều tra ở đây là gì? Kích thước mẫu bao nhiêu?</p>', '<p>Dấu hiệu 40 gia đình, đơn vị điều tra là mỗi gia đình ở huyện X. Kích thước mẫu là N=15</p>', '<p>Dấu hiệu &nbsp;là huyện X, đơn vị điều tra là mỗi gia đình ở huyện X. Kích thước mẫu là N=3</p>', '<p>Dấu hiệu là số con, đơn vị điều tra là mỗi gia đình ở huyện X. Kích thước mẫu là N=13</p>', '<p>Dấu hiệu là số con, đơn vị điều tra là mỗi gia đình ở huyện X. Kích thước mẫu là N=40.</p>', 1, '<p>Dấu hiệu là số con, đơn vị điều tra là mỗi gia đình ở huyện X.</p><p>Huyện X có 3 thôn; mà &nbsp;thôn A có 12 gia đình; thôn B có 15 gia đình và thôn C có 13&nbsp;&nbsp;&nbsp;&nbsp; gia đình nên huyện X có tất cả 12+ 15+13= 40 hộ gia đình.</p><p>&nbsp;Kích thước mẫu là N=40.</p>', 3, 10, 47),
(81, '<p>Huyện X có 3 thôn; biết thôn A có 12 gia đình; thôn B có 15 gia đình và thôn C có 13 gia đình. Số con trong mỗi gia đình được thống kê lại như sau</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/491fd2dd16892aac81bf118750d782.png\"></figure><p>Dấu hiệu và đơn vị điều tra ở đây là gì? Kích thước mẫu bao nhiêu?</p>', '<p>Dấu hiệu 40 gia đình, đơn vị điều tra là mỗi gia đình ở huyện X. Kích thước mẫu là N=15</p>', '<p>Dấu hiệu &nbsp;là huyện X, đơn vị điều tra là mỗi gia đình ở huyện X. Kích thước mẫu là N=3</p>', '<p>Dấu hiệu là số con, đơn vị điều tra là mỗi gia đình ở huyện X. Kích thước mẫu là N=13</p>', '<p>Dấu hiệu là số con, đơn vị điều tra là mỗi gia đình ở huyện X. Kích thước mẫu là N=40.</p>', 1, '<p>Dấu hiệu là số con, đơn vị điều tra là mỗi gia đình ở huyện X.</p><p>Huyện X có 3 thôn; mà &nbsp;thôn A có 12 gia đình; thôn B có 15 gia đình và thôn C có 13&nbsp;&nbsp;&nbsp;&nbsp; gia đình nên huyện X có tất cả 12+ 15+13= 40 hộ gia đình.</p><p>&nbsp;Kích thước mẫu là N=40.</p>', 3, 10, 47),
(82, '<p>Cho bảng điều tra số con của huyện X như câu 12; hỏi giá trị 4 xuất hiện bao nhiêu lần? Và mốt của mẫu số liệu trên là bao nhiêu</p>', '<p>4 và M0= 3&nbsp;</p>', '<p>5 và M0= 5</p>', '<p>6 và M0= 2&nbsp;</p>', '<p>7 và M0= 2</p>', 3, '<p>Giá trị 4 xuất hiện 6 lần và giá trị 2 xuất hiện nhiều nhất .</p><p>Do đó; mốt của mẫu số liệu trên là 2</p>', 1, 10, 47),
(83, '<p>Tiến hành một cuộc thăm dò về cân nặng của mỗi học sinh&nbsp; nữ lớp 10A; biết lớp có 45 học sinh và 15 học sinh nam. . Kết quả thu được ghi lại như sau:</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/dd4f674f5156033375ca3cb49a2969.png\"></figure><p>Dấu hiệu và đơn vị điều tra ở đây là gì? Và kích thước mẫu là bao nhiêu?</p>', '<p>Đơn vị điều tra: số cân nặng học sinh nữ. Kích thước mẫu: 15</p>', '<p>Đơn vị điều tra: Một học sinh nữ. Kích thước mẫu: 30</p>', '<p>Đơn vị điều tra: lớp 10. Kích thước mẫu: 45</p>', '<p><strong>&nbsp;</strong>Đơn vị điều tra: Một học sinh nữ. Kích thước mẫu: 15</p>', 2, '<p>Dấu hiệu điều tra: Số cân nặng của mỗi học sinh nữ lớp 10</p><p>Đơn vị điều tra: Một học sinh nữ.</p><p>Vì lớp có 45 học sinh và 15 học sinh nam nên lớp có 30 học sinh nữ.</p><p>Kích thước mẫu: 30</p>', 1, 10, 47),
(84, '<p>Để điều tra các con trong mỗi gia đình ở một chung cư gồm 100 gia đình, người ta chọn ra 20 gia đình ở tầng 2. Dấu hiệu ở đây là gì ? và kích thước mẫu là bao nhiêu?</p>', '<p>Số gia đình ở tầng 2; và kích thước mẫu là 100</p>', '<p>Số con ở mỗi gia đình và kích thước mẫu là 20</p>', '<p>Số tầng của chung cư và kích thước mẫu là 80</p>', '<p>Số người trong mỗi gia đình và kích thước mẫu là 80</p>', 2, '<p>Đơn vị điều tra là số con trong mỗi gia đình và kích thước mẫu là 20 ( điều tra 20 gia đình ở tầng 2) .</p>', 1, 10, 47),
(85, '<p>Điều tra thời gian chạy nhanh hết một quãng đường của các vận động viên, người ta thu được mẫu số liệu sau &nbsp;(thời gian tính bằng phút)</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/db7a44400b6641de2ddf7fcdbf3b33.png\"></figure>', '<p>23</p>', '<p>20&nbsp;</p>', '<p>10</p>', '<p>Đáp án khác</p>', 2, '<p>Trong dãy số liệu thống kê trên có 20 giá trị ( không phân biệt)&nbsp; nên có tất cả 20 vận động viên tham gia chạy.</p><p>Vậy kích thước mẫu là 20</p>', 1, 10, 47),
(86, '<p>Thống kê về điểm thi môn hóa&nbsp; trong một kì thi của 450 học sinh. Người ta thấy có 99 bài được điểm 8. Hỏi tần suất của giá trị xi= 8 &nbsp;là bao nhiêu?</p>', '<p>7%</p>', '<p>22%</p>', '<p>36%</p>', '<p>64%&nbsp;</p>', 2, '<p>Tần suất bằng&nbsp;99450.100<math class=\"mjx-chtml MathJax_CHTML\" xmlns=\"http://www.w3.org/1998/Math/MathML\" id=\"MathJax-Element-1-Frame\"><mfrac><mn>99</mn><mn>450</mn></mfrac><mo>.</mo><mn>100</mn></math>&nbsp;% = 22 %</p>', 1, 10, 47),
(87, '<p>Nhiệt độ trung bình của tháng 12 tại thành phố Đà Nẵng từ năm 1991 đến hết năm 2000 được cho trong bảng sau:</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/5dda0b8ec298db6fe76bb084f6aedc.png\"></figure><p>Hãy điền số thích hợp vào *:</p>', '<p>2</p>', '<p>3</p>', '<p>4</p>', '<p>5</p>', 2, '<p>Từ năm 1991 đến hết năm 2000&nbsp; là có 10 năm. Do đó kích thước mẫu là 10.</p><p>Dựa vào bảng thống kê ta có: n1= 5; n2= 2</p><p>Do đó n3= N – n1- n2 = &nbsp;10- 5-2=3</p>', 1, 10, 47),
(88, '<p>Khối lượng của 30 củ khoai tây thu hoạch ở một nông trường</p><figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/57e7a244b0a860b2a282668a335c3c.png\"></figure><p>Tần suất ghép lớp của lớp [100;110) là:</p>', '<p>20%</p>', '<p>40%</p>', '<p>60%</p>', '<p>80%</p>', 1, '<p>Tần suất lớp [100;110) là:&nbsp;630.100<math xmlns=\"http://www.w3.org/1998/Math/MathML\" id=\"MathJax-Element-1-Frame\"><mfrac><mn>6</mn><mn>30</mn></mfrac><mo>.</mo><mn>100</mn></math>% = 20%</p>', 1, 10, 47),
(89, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/0020f333eca30ed9401f89511300d9.png\"></figure>', '<p>Tần suất của 3 là 20%</p>', '<p>Tần suất của 4 là 20%</p>', '<p>Tần suất của 4 là 2%</p>', '<p>Tần suất của 4 là 50%</p>', 2, '<p>Tần suất của mẫu &nbsp;4 là:&nbsp;200010000.100<math class=\"mjx-chtml MathJax_CHTML\" xmlns=\"http://www.w3.org/1998/Math/MathML\" id=\"MathJax-Element-1-Frame\"><mfrac><mn>2000</mn><mn>10000</mn></mfrac><mo>.</mo><mn>100</mn></math>% = 20%</p>', 1, 10, 47),
(90, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/90aba49e64ce2a8a615d6a3ad64302.png\"></figure>', '<p>50%</p>', '<p>56%</p>', '<p>56,7%</p>', '<p>57%</p>', 3, '<p>Lá có đường kính từ 30 cm đến 50 cm có tân số là:</p><p>24+ 10= 34.</p><p>Do đó; tần suất của lá có đường kính từ 30 cm đến 50 cm là:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<math xmlns=\"http://www.w3.org/1998/Math/MathML\" id=\"MathJax-Element-1-Frame\"><mfrac><mrow><mn>24</mn><mo>&nbsp;</mo><mo>+</mo><mo>&nbsp;</mo><mn>10</mn></mrow><mrow><mn>60</mn><mo>&nbsp;</mo></mrow></mfrac><mo>.</mo><mn>100</mn><mo>%</mo></math><strong>&nbsp;=</strong> 56.7%</p>', 1, 10, 47),
(91, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/d33e4f9d7e993c074a203b3c71474f.png\"></figure>', '<p>50%</p>', '<p>56%</p>', '<p>56,7%</p>', '<p>57%</p>', 3, '<p>Lá có đường kính từ 30 cm đến 50 cm có tân số là:</p><p>24+ 10= 34.</p><p>Do đó; tần suất của lá có đường kính từ 30 cm đến 50 cm là:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<math xmlns=\"http://www.w3.org/1998/Math/MathML\" id=\"MathJax-Element-1-Frame\"><mfrac><mrow><mn>24</mn><mo>&nbsp;</mo><mo>+</mo><mo>&nbsp;</mo><mn>10</mn></mrow><mrow><mn>60</mn><mo>&nbsp;</mo></mrow></mfrac><mo>.</mo><mn>100</mn><mo>%</mo></math><strong>&nbsp;=</strong> 56.7%</p>', 1, 10, 47),
(92, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/3dbccdd5f0b8c588cf6000aed15552.png\"></figure>', '<p>167</p>', '<p>168</p>', '<p>169</p>', '<p>164</p>', 2, '<p>Độ dài mỗi lớp là: 162-160= 2.</p><p>Do đó số cần tìm là: 166+ 2= 168</p>', 2, 10, 47),
(93, '<p>Cho bảng tần số, tần suất ghép lớp như câu 22. Hãy điền số thích hợp vào**</p>', '<p>10</p>', '<p>12</p>', '<p>8</p>', '<p>13</p>', 1, '<p>Ta có; kích thước mẫu là 36.</p><p>Mà tổng các tần số bằng kích thước mẫu.</p><p>Do đó; số cần tìm là:</p><p>36- ( 6+12+5+3) = 10.</p>', 2, 10, 47),
(94, '<p>Cho bảng tần số, tần suất ghép lớp như câu 22. Hãy điền số thích hợp vào</p>', '<p>3,9%</p>', '<p>5,9%</p>', '<p>13,9%</p>', '<p>23,9%</p>', 3, '<p>Áp dụng công thức tính tần suất ta có tần suất của lớp thứ 4 là:</p><p>&nbsp;&nbsp;&nbsp;<math xmlns=\"http://www.w3.org/1998/Math/MathML\" id=\"MathJax-Element-1-Frame\"><mfrac><mn>5</mn><mn>36</mn></mfrac><mo>.</mo><mn>100</mn><mo>%</mo></math>&nbsp;= &nbsp; 13,9 %</p>', 2, 10, 47),
(95, '<p>Trong các điều khẳng định sau:</p><p style=\"text-align:justify;\">(1) Thống kê là khoa học về các phương pháp thu thập, tổ chức, trình bày, phân tích và xử lí dữ liệu.</p><p style=\"text-align:justify;\">(2) Số lần xuất hiện của một giá trị trong dãy giá trị của dấu hiệu được gọi là tần số của giá trị đó.</p><p style=\"text-align:justify;\">(3) Giá trị có tần số lớn nhất gọi là mốt của dấu hiệu.</p><p>(4) Độ lệch chuẩn là bình phương của phương sai.</p><p>Có bao nhiêu khẳng định đúng:</p>', '<p>1</p>', '<p>2</p>', '<p>3</p>', '<p>4</p>', 3, '<p>Các khẳng định đúng là: (1) ; (2); (3)</p><p>(4) cần sửa thành: Phương sai là bình phương của độ lệch chuẩn.</p>', 2, 10, 47),
(96, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/9ff8bbd9db6618e5ca1808076d087b.png\"></figure><p><br data-cke-filler=\"true\"></p>', '<p>(0;1)</p>', '<p><strong>&nbsp;(−∞;−2)∪[1;+∞)</strong></p>', '<p><strong>&nbsp;(−∞;0)∪[1;+∞)</strong></p>', '<p><strong>&nbsp;</strong>[0;1]</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/0904e6828ec1790909afa2b4e1cf21.png\"></figure>', 2, 10, 47),
(97, '<p>Cho bất phương trình:&nbsp;<math xmlns=\"http://www.w3.org/1998/Math/MathML\" id=\"MathJax-Element-1-Frame\"><mfenced close=\"|\" open=\"|\"><mfrac><mn>2</mn><mrow><mi>x</mi><mo>-</mo><mn>13</mn></mrow></mfrac></mfenced><mo>&gt;</mo><mfrac><mn>8</mn><mn>9</mn></mfrac></math>. Số các nghiệm nguyên của bất phương trình là:</p>', '<p>2&nbsp;</p>', '<p>3</p>', '<p>4</p>', '<p>5</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/03d573d19fc653cf321e471cf06567.png\"></figure>', 2, 10, 47),
(98, '<p>Cho bất phương trình:&nbsp;m(x−m)≥x−1<math xmlns=\"http://www.w3.org/1998/Math/MathML\" id=\"MathJax-Element-1-Frame\"><mi mathvariant=\"normal\">m</mi><mo>(</mo><mi mathvariant=\"normal\">x</mi><mo>-</mo><mi mathvariant=\"normal\">m</mi><mo>)</mo><mo>≥</mo><mi mathvariant=\"normal\">x</mi><mo>-</mo><mn>1</mn></math></p><p>Các giá trị nào sau đây của m thì tập nghiệm của bất phương trình là&nbsp; S=(−∞;m+1]</p>', '<p>m= 1</p>', '<p>m&gt; 1</p>', '<p>&nbsp;m&lt; 1</p>', '<p>&nbsp;m≥1</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/43a75f808828e54893fdc370a05d1e.png\"></figure>', 2, 10, 47),
(99, '<p>Cho bất phương trình: mx+ 6&lt; 2x+3m .</p><p>Tập nào sau đây là phần bù của tập nghiệm của bất phương trình trên với m&lt; 2 :</p>', '<p><strong>S=(3;+∞)</strong></p>', '<p>S=[3;+∞)</p>', '<p><strong>S&nbsp;=&nbsp;(−∞;3)</strong></p>', '<p><br><strong>S=(−∞;3]</strong></p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/9896cff4f26952db2d22a0bfae50f6.png\"></figure>', 2, 10, 47),
(100, '<p>Với giá trị nào của m thì bất phương trình&nbsp;<math xmlns=\"http://www.w3.org/1998/Math/MathML\" id=\"MathJax-Element-1-Frame\"><mo>(</mo><msup><mi mathvariant=\"normal\">m</mi><mn>2</mn></msup><mo>+</mo><mi mathvariant=\"normal\">m</mi><mo>+</mo><mn>1</mn><mo>)</mo><mi mathvariant=\"normal\">x</mi><mo>&nbsp;</mo><mo>-</mo><mn>5</mn><mi mathvariant=\"normal\">m</mi><mo>&nbsp;</mo><mo>≥</mo><mo>(</mo><msup><mi mathvariant=\"normal\">m</mi><mn>2</mn></msup><mo>+</mo><mn>2</mn><mo>)</mo><mi mathvariant=\"normal\">x</mi><mo>-</mo><mn>3</mn><mi mathvariant=\"normal\">m</mi><mo>-</mo><mn>1</mn></math>vô nghiệm ?</p>', '<p>m &gt;&nbsp; 1</p>', '<p>m = 1</p>', '<p>m &lt; 1</p>', '<p>m ≤ 1</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/f935fad48cf0be3a85fcb5f03084c2.png\"></figure>', 2, 10, 47),
(101, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/cb496714850be320057d2e734d3aee.png\"></figure>', '<p>-11/6</p>', '<p>11/6</p>', '<p>8/5</p>', '<p>-8/5</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/8a65242537139f466419fabb863e62.png\"></figure>', 1, 12, 47),
(102, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6ce9788c0a22f6b72edd28273b1320.png\"></figure>', '<p>-11/7</p>', '<p>11/6</p>', '<p>9/4</p>', '<p>-9/5</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/e465830b1f827101b7ed35e55fbe9e.png\"></figure>', 1, 12, 47),
(103, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/a094cc67d01478d3ca0eeeab9ddcac.png\"></figure>', '<p>-11/6</p>', '<p>11/6</p>', '<p>8/5</p>', '<p>-8/5</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/a0287253023bff0f14b1d80baad003.png\"></figure>', 1, 12, 47),
(104, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/cc5d4284436a05b6222925ee310ddf.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/f4ff4fe2879362e9b950a610f1db84.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/31864eaa19a1034f51ac94d018eb80.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/27069401b2a87881be42ae6c6500c2.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/e20cc50e2029be35338fc728acbdfc.png\"></figure>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/1181c5f589dba67e90534f222aefa9.png\"></figure>', 1, 12, 47),
(105, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/85cba0a38158291148992d29148c5c.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/4a7b7dcf11fd27497dcb4cc78d3ecd.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/5106e6d2327bc9b83b4590f24d662a.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/b0c7e9a4d4ba0a6ca1ce25bedd8629.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/311c8affb480a1093814dc68561794.png\"></figure>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/e1a14e237f551f7de316387035d032.png\"></figure>', 1, 12, 47),
(106, '<p>Cho a + b = 1 &nbsp;thì&nbsp;<math class=\"mjx-chtml MathJax_CHTML\" xmlns=\"http://www.w3.org/1998/Math/MathML\" id=\"MathJax-Element-1-Frame\"><mfrac><msup><mn>4</mn><mi mathvariant=\"normal\">a</mi></msup><mrow><msup><mn>4</mn><mi mathvariant=\"normal\">a</mi></msup><mo>+</mo><mn>2</mn></mrow></mfrac><mo>+</mo><mfrac><msup><mn>4</mn><mi mathvariant=\"normal\">b</mi></msup><mrow><msup><mn>4</mn><mi mathvariant=\"normal\">b</mi></msup><mo>+</mo><mn>2</mn></mrow></mfrac></math>&nbsp;bằng</p>', '<p>4</p>', '<p>2</p>', '<p>3</p>', '<p>1</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/8b5edc220b1b1d5517480c8b4bc825.png\"></figure>', 1, 12, 47),
(107, '<p>Đơn giản biểu thức&nbsp;<math class=\"mjx-chtml MathJax_CHTML\" xmlns=\"http://www.w3.org/1998/Math/MathML\" id=\"MathJax-Element-1-Frame\"><mi mathvariant=\"normal\">A</mi><mo>=</mo><mfenced><mrow><mn>1</mn><mo>-</mo><mn>2</mn><msqrt><mfrac><mi mathvariant=\"normal\">b</mi><mi mathvariant=\"normal\">a</mi></mfrac></msqrt><mo>+</mo><mfrac><mi mathvariant=\"normal\">b</mi><mi mathvariant=\"normal\">a</mi></mfrac></mrow></mfenced><mo>:</mo><msup><mfenced><mrow><msqrt><mi mathvariant=\"normal\">b</mi></msqrt><mo>-</mo><msqrt><mi mathvariant=\"normal\">a</mi></msqrt></mrow></mfenced><mn>2</mn></msup></math>&nbsp;ta được:</p>', '<p>A = a - b</p>', '<p>A = a</p>', '<p>A = 1/a</p>', '<p>A = a + b</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/d191ace624e4cf01243763bd73e927.png\"></figure>', 1, 12, 47),
(108, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/2788c9beba65e2c421c385c1d4192d.png\"></figure>', '<p>5</p>', '<p>√27</p>', '<p>√23</p>', '<p>25</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/243b5864beb819c7fd9b7569217434.png\"></figure>', 1, 12, 47);
INSERT INTO `nganhangcauhoi` (`IdCauHoi`, `CauHoi`, `DapAn1`, `DapAn2`, `DapAn3`, `DapAn4`, `DapAnDung`, `LoiGiai`, `LoaiCauHoi`, `Lop`, `Tuan`) VALUES
(109, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/74e62555311fb8ae45e99620d4de32.png\"></figure>', '<p><math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mi>A</mi><mo>=</mo><msqrt><mi>a</mi><mi>b</mi></msqrt></math></p>', '<p>A=&nbsp;<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mroot><mrow><mi>a</mi><mi>b</mi></mrow><mn>3</mn></mroot></math></p>', '<p>A=&nbsp;<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mroot><mrow><mi>a</mi><mi>b</mi></mrow><mn>6</mn></mroot></math></p>', '<p>A=&nbsp;<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mroot><mi>a</mi><mn>6</mn></mroot><mo>&nbsp;</mo><mo>-</mo><mroot><mi>b</mi><mn>6</mn></mroot><mo>&nbsp;</mo></math></p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ebfb0e256eb438924c0dc17fe6cdf7.png\"></figure>', 1, 12, 47),
(110, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/98296c3eae54fb74f122fac628d1b9.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/5e8bf4939d908024937c1f727c9c19.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/54aab74ea0465069af03a3b84a5cfc.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/e5f167c9fe63fefaeacbecec1fb624.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/b925703dac0f0a52c96103b65fe4e6.png\"></figure>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/57933f4c5604967aaa3eafbabb5729.png\"></figure>', 1, 12, 47),
(111, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6a461d9e8ac16e754279798172459c.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/92046cb65030b008f5409418ec782a.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/fad5a67a1c7d2e3edf97b4f19fcab1.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/b7b7f7ea099e076fa1730ce85a40fe.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/be5e03df5256816f8c88e31d516784.png\"></figure>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6afdebe19c8077f1c0a3d064543b79.png\"></figure>', 2, 12, 47),
(112, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/71b807dc243084d12c65ac9eea693f.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ea739c66915de6db6f3e9ab6880ce2.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/2481c8279e92b78a4b0ad190819b24.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/c86c5812536667bbf84f16af73cec4.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/a2d9bb1488bd604913a0fb0ae4e7da.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6727b1b333cfd666d5bdf514de2c41.png\"></figure>', 2, 12, 47),
(113, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/b15b4e1d92a0e5af215742853d4779.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/64c5290d5981bbbce2d1ab00c7dcff.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6122f9ff55241e7945bfd189a58a94.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/23de8dc24d7939ff3d5a0337365928.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/2c29fe9df802489a930eeed8b350e5.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/05a23cb047063a94da5e2e4a42b42a.png\"></figure>', 2, 12, 47),
(114, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/a691662069e8ad3a6f17503b1133bf.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/9ebcd290ea7f3f956cadb8478242e8.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/4e3c25b089021a1d8c82b09ee86986.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ab52105d1199366a238403948c9016.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/558d6e13a3462ad1698a6013397b98.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6f38409d63278a073e2b12e0f88db0.png\"></figure>', 2, 12, 47),
(115, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/8e41a7d76c8e25ae19f68b82bfedd9.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/995faaa769cb222aff178179faf777.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/09e59241b90b912b7fcfcb87d29331.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/fd74677fca7918be32cd17a3527291.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ce71dd3159e567c83ada6779ee2591.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ceb304d96af5ae3958d97572b75f29.png\"></figure>', 2, 12, 47),
(116, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/deec0c89a5f8bf4405a49bb1c2d31e.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/90ef1614230a703b9fbf2ef770e2da.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6d73889170668c9f589cd634af4630.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6868985404ba4d94edc85167e80f2d.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ecb0cdfb2a26d3b2035b00ff59adcf.png\"></figure>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/b99353433b3620a654fd240ce78ee5.png\"></figure>', 2, 12, 47),
(117, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/e82c2906c9139189d35c9f3a7d4db0.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/88f215ac7259156fb0fa8a60aaa8bf.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/cdcc8c9ebedfe29f493a6ff0375ae4.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/f840a9349a42ac6adfbfceb82feb71.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/60dac2d087cc187834a29ae97a35d9.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ebc8382049708b51697c71236aa915.png\"></figure>', 2, 12, 47),
(118, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/80ef1d3dfa3de92085b6123a76a4ce.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/711a8a8d75116cd5233ee2cdb67416.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/c22b6e6c776909c18a8eea06a97101.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/10774cb4b1b844f9bf2e173b52affb.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/8032fb6069bff082a0e642601859fc.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/1b56134d7f9c8c1a214f314ae20f5d.png\"></figure>', 2, 12, 47),
(119, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/fa8c738ccb6d1205d2106be78584fa.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/9c1a2ce1ebee187b28ee8bf830166b.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/2abe69fa9fbf5618a4efcc1f88b4e9.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/867a41b6f26acf07e9862c1e8d4a41.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/9c92104fad354a06c01aa5ba94223f.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/f0357acefc1d933171ba0a485609ac.png\"></figure>', 2, 12, 47),
(120, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/fbf2a0cf1ac43fbcd8bf7d973357b6.png\"></figure>', '<p>m = 1.</p><p><br><br data-cke-filler=\"true\"></p>', '<p>m = 1/2 .</p>', '<p>m = 4.</p>', '<p>m = 2.</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/cc8efaa743586ba68647dc43ce530f.png\"></figure>', 2, 12, 47),
(121, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/c6f7ea2490b3aec7658b99a4a67c17.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/991dd7ca532da3ca773eb9e32d7ac9.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/4a96a21d378d9c8b59855860415c3a.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/85d7d16fa3a0f3331f00e459fe8b2b.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/69d4f07611748135476e4c2692a9c9.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/8c3e594f082c2543328ff95e98eebf.png\"></figure>', 2, 12, 47),
(122, '<p>Cho các số thực a; b &gt; 0. Khẳng định nào sau đây là đúng ?</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/b70b7bcee8c33c1342d988293932dd.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/a137935f35e79d47cfc0f3a3dcf8c6.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/c7db80dabaa5be3aacce4c9cfeef64.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/7d9a3687229de467ea0980b9a01ec0.png\"></figure>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/0e5fff3fb9b7a0df4fb41dcfc77ab9.png\"></figure>', 3, 12, 47),
(123, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/bdf9ab194394f9cf951af6d93cd784.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/2ab15ca0f97b4e049b28b194226bac.png\"></figure>', '<p>log( x + y) = logx + log y + 1</p>', '<p>log(x + y) = logx + logy - 1</p>', '<p>log(x + y) = 10( logx + logy)</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/cc4d40a8c19a8549824d2dbd8ffd87.png\"></figure>', 3, 12, 47),
(124, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/21a7d8929a376cc746bdfdab548a10.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6a01b8ed09c17a1a7812867b1ce329.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/4feb44ef916c24a214f326fdde43d4.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/a7c8b50ae1fe087986f236480c5ab6.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/e532bf317ad5777d5e02853f5caf11.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/c3741d1d08d0d4d19a78474f9f6522.png\"></figure>', 3, 12, 47),
(125, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/45cceaa5f451c906087eb77eb59272.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/1212f019c2bc2e226beb192cb085d6.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/5a221d2888dc09afb5496c821469fe.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/2e1200edb8b4a361d69ff8fcb34216.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/05b60889686e543f7f370016e90d0e.png\"></figure>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/f9fa2dfb107759369364aa236fcdc5.png\"></figure>', 3, 12, 47),
(126, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/56f5c750014c41c851af3cc6271100.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/acf13a32c88a7a771ccc31ad7108b0.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/dddfb7e8ae5705a79ce3b2ee8fcc3e.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/3a216913cd8bf554416a80ce06aed3.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/042b59d9e12346b10388241f559910.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/48677fcb820b0ec1da73eea5d7f091.png\"></figure>', 3, 12, 47),
(127, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/84a7890fbf1b6562497dca62d12b5f.png\"></figure>', '<p>0</p>', '<p>1</p>', '<p>3</p>', '<p>2</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/62329d5591e9aa41e0236fb53d6b08.png\"></figure>', 3, 12, 47),
(128, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/0896ce03868b050ea12cb1f772148a.png\"></figure>', '<p>Tam giác đều.</p>', '<p>Tam giác vuông tại O.</p>', '<p>Tam giác tù.</p>', '<p>Tam giác có một góc bằng 45o.</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/bf3d16d4725c3e889753c8e0c200f4.png\"></figure>', 3, 12, 47),
(129, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/0e9252ed0acc8d8e74b3f5dbb392f5.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/db453e961fb1ce4b6934dab330074a.png\"></figure>', '<p>2</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/2f9ee60f450f14bf42c3609f38d319.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/e34e92219c4f42e1a79c8894f5b157.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/c589f08a67e82eb54a09365140b72d.png\"></figure>', 3, 12, 47),
(130, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/c671f47ac66c8f86fa3070b2f579cc.png\"></figure>', '<p>-3.</p>', '<p>-1</p>', '<p>1</p>', '<p>2</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/4aa1f435f0f3b6faca483efb9c3e76.png\"></figure>', 3, 12, 47),
(131, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/a3062275c64bab8eee1fe627a8513d.png\"></figure>', '<p>3</p>', '<p>2</p>', '<p>4</p>', '<p>1</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/24dc9c7027978fadc7b227ca8b953e.png\"></figure>', 1, 12, 47),
(132, '<p>Cho số phức z; w thỏa mãn |z – 1 + 2i| = |z + 5i| ; w = iz + 20. &nbsp;Giá trị nhỏ nhất m của |w| là?</p><p><br><br data-cke-filler=\"true\"></p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/b9231dab389a9293b6141f41c2d356.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/2ea9a92ff9f71d508b2296ca1aa77a.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/5a6d0735b129c6eb1709020d3a737a.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ec478c4b8f9b8e3b8572ff9fdeca64.png\"></figure>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/2abd44c0d187f7c61d0a5b373b154a.png\"></figure>', 1, 12, 47),
(133, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/90caa1b787aa7554bdbc1901447c9e.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/2e0e0d6d0037f4ab527dd13e9f2b6e.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/3a9aaea8612a97c41d41e523047329.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/2b252dcea2c225aa6725a07695f03a.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/e25c2007cccf844d9f36bdf78e1176.png\"></figure>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/70b5ec172b91c701d26d10306b0f6c.png\"></figure>', 1, 12, 47),
(134, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/62b99172dbae811d299423cdf16761.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/5d7a3e22b7c5fd9426e7d2b0549453.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/d7f29b1de01925e7478f6f6ff6fc8e.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/3642c41cf147b6de6f94845652985d.png\"></figure>', '<p>Đáp án khác.</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/d6d02e9dddc3cc04241110fc116121.png\"></figure>', 1, 12, 47),
(135, '<p>Cho số phức z &nbsp;thoả mãn |z – 1 + 3i| + |z + 2 – i| = 8. Tìm giá trị lớn nhất, giá trị nhỏ nhất của P = |2z + 1 = 2i|.</p>', '<p>8 và 4</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/3deb497b2ef615190ec088a48504de.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/18946f857581ed55a86e81cefcc5a3.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/5baa07f4530c54ac0b0e0d355a4384.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/22935bf4c5a508f21f2569b48cac2e.png\"></figure>', 1, 12, 47),
(136, '<p>Cho số phức&nbsp; z thỏa mãn |z – 2 – 3i| = 1. Tìm giá trị lớn nhất của |z|?</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/d3bc323dcc54eaf3181a0819e7e1eb.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/55c229a212651730c9a561b93df844.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ddaeaec2dcd7544cd3d806addb93b6.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/77576950af2ab7d9de05a6dfbd4349.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/6b7e6083bc0c2d94170dc2f04cbf71.png\"></figure>', 1, 12, 47),
(137, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/c2fd804d201765ed7b5c623618bde7.png\"></figure>', '<p>34</p>', '<p>82</p>', '<p>68</p>', '<p>36</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/17b4c149de0f494588269ecf6d8223.png\"></figure>', 1, 12, 47),
(138, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/a92646b1b3cc0f091f2079378f6514.png\"></figure>', '<p>4</p>', '<p>3</p>', '<p>7</p>', '<p>6</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ddb2a97efd00d953677a27de8e49ff.png\"></figure>', 1, 12, 47),
(139, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/18ffb44006342786997367981fd051.png\"></figure>', '<p>d(I; Oy) = 1.</p>', '<p><strong>&nbsp;</strong>d(I&nbsp;; Oy) = 2</p>', '<p>d(I&nbsp;; Oy) = 0.</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/34c49142f137903c4b0841988ec1e6.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/20b40d9d94bfac053d6d1b3191f058.png\"></figure>', 1, 12, 47),
(140, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/a26f4d6619db4a9b91872579231326.png\"></figure>', '<p>Số phức z = a + bi; |z| ≤ 2; -1&nbsp;≤ a&nbsp;≤ 1.</p>', '<p>Số phức&nbsp;z = a + bi; |z| ≤&nbsp;2; a &lt; -1; a &gt; 1.</p>', '<p>Số phức z = a + bi; |z| &lt; 2; -1 ≤ a ≤ 1.</p>', '<p>Số phức z = a + bi; |z| ≤ 2; -1 ≤ b ≤ 1.</p>', 1, '<p>+ Từ hình biểu diễn ta thấy tập hợp các điểm M(a; b) biểu diễn số phức <i>z</i> trong phần gạch chéo đều thuộc đường tròn tâm O(0;0) và bán kính bằng 2; ngoài ra -1 ≤ &nbsp;a ≤ 1.</p><p>+ Vậy M(a; b) là điểm biểu diễn của các số phức z = a + bi &nbsp;có mô đun nhỏ hơn hoặc bằng 2 và có phần thực thuộc đoạn [-1;1].</p>', 1, 12, 47),
(141, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ab02488fe8ec0c63a80051c3474396.png\"></figure>', '<p>1 ≤ |z| ≤ 2 và phần ảo dương.</p>', '<p>1 ≤ |z| ≤ 2 và phần ảo âm.</p>', '<p>1 &lt; |z| &lt; 2 và phần ảo dương.</p>', '<p>1 &lt; |z| &lt; 2 &nbsp;và phần ảo âm.</p>', 2, '<p>Ta thấy phần tô màu là nửa dưới trục hoành của hình vành khăn được tạo bởi hai đường tròn đồng tâm O(0&nbsp;;0) và bán kính lần lượt là 1 và 2.</p><p>Vậy đây chính là tập hợp các điểm M(x; y) biểu diễn cho số phức z = x + yi&nbsp; trong mặt phẳng phức với 1 ≤ |z| ≤ 2 và có phần ảo âm.</p>', 1, 12, 47),
(142, '<p>Cho số phức z thỏa mãn |z – 4| + |z + 4| = 10. Giá trị lớn nhất và nhỏ nhất của mô – đun của số phức z là</p>', '<p>10 và 4</p>', '<p>5<strong>&nbsp;</strong>và 4</p>', '<p>4<strong>&nbsp;</strong>và 3</p>', '<p>5&nbsp;và 3</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/4d33e0e41503a4961dfe51f432f848.png\"></figure>', 2, 12, 47),
(143, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/fa0f7c24df3e4ba7bc3d2b9eeb6254.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/0684c606fee9cd9fe856f98156a519.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ea89ee5c731776faa8a54537fb6bad.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/959c0deac12ead82bd886ee5b19d40.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/554c7fd1af96460eb2a7a91682a588.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/c61b35573a34e3b6d29a020c47f9c4.png\"></figure>', 2, 12, 47),
(144, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/850d2c32aa271b7fcc23671cd68981.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/0020f7036c0eac07e1cecc0a01d435.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/25dd90c06e30e639c9c3beab7eabb9.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/765c26d41b3ec17e1e9acba0f6762d.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/d0e03fb4e629570cabeee499010bb2.png\"></figure>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/a5b476e2fb6bcda7ab4fe3ba08ba21.png\"></figure>', 2, 12, 47),
(145, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/b86723012fdb7d1c0296868f7fe6ef.png\"></figure>', '<p>1,17</p>', '<p>1,16</p>', '<p>1,15</p>', '<p>1,14</p>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/701ae81c276bc62c4ccec9d9a4754c.png\"></figure>', 2, 12, 47),
(146, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/d27194e77707c7a58bc9ef51f5cf5c.png\"></figure>', '<p>z = 1+ 2i</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/13a1fc2fd79bcc0c45c05e4b350d16.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/193f62166d7a92a7c3613ee86d2a75.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/5608be751e6de7156861f94f1a99ef.png\"></figure>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/60bdd77320dfcad6ff9530bb790e5c.png\"></figure>', 2, 12, 47),
(147, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/01b4ac443e37124813d4375b168f53.png\"></figure>', '<p>z = 2 hoặc – 2</p>', '<p>z= 3 hoặc – 3&nbsp; &nbsp; &nbsp;&nbsp;</p>', '<p>z = 4 hoặc – 4&nbsp;&nbsp;</p>', '<p>tất cả sai</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/ff0ecf27d451aad8b5f71a245144dd.png\"></figure>', 2, 12, 47),
(148, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/450d9f999cec74d00208f632923137.png\"></figure>', '<p>z = 1</p>', '<p>z = 1 - i&nbsp;</p>', '<p>z = -1 - i</p>', '<p>z = 2 - i</p>', 3, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/189a6e83e77ea0d20846eed5222e77.png\"></figure>', 2, 12, 47),
(149, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/fc691e41904da95bfbc8ec67a1a568.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/98bbf8dc52be91de9b0247241c3845.png\"></figure>', '<p>2</p>', '<p>1</p>', '<p>3</p>', 2, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/1ca10ffd3b37629f09e8612bd3abe3.png\"></figure>', 2, 12, 47),
(150, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/fe7fc12f857952196cb055552d93ce.png\"></figure>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/bc61d024d7283f3089ff37dc4ab0e6.png\"></figure>', '<p>4</p>', '<p>6</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/84f0115d3c1aaaa3acb5fecabd6daf.png\"></figure>', 1, '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/531efe15677bd36080c2aa44d35846.png\"></figure>', 2, 12, 47);

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
(1, 'admin1', '$2y$10$LWQ/8ql/wj0FNKI2rEAlqeEK4Bt10ZpWuk0HWNWGUAf4R128x0OPe', 'Võ Văn Dương', 1999, '/ExtraClassroomWebsite/upload/avatar/4d245a0c668b297b0fc697be5e5403.jpg', 0, 0, 0, '', 'duongvox99@gmail.com', 0),
(2, 'admin2', '$2y$10$HBJgLtJLErByNdjHRpdOeuZR1Gwrp9jgXdqWJbGKqbK5Pe5JWMoz6', 'Phạm Minh Dương', 1999, '', 0, 0, 0, '', 'phamminhduong@gmail.com', 0),
(3, 'huynhducvu', '$2y$10$6w.Hxafrj.zghrDhU4d6SeZ8tVHrrcDepcctomeq/oxZIRe6mve1q', 'Huỳnh Đức Vũ', 1980, '', 0, 0, 0, '', 'huynhducvu@gmail.com', 0),
(4, 'hocsinh', '$2y$10$pzu1AEuXVvvvNu0PTB.hMOoaqjqsKS6rFH/t/HpTb5ozMKiZUaxKG', 'Vox Van Duwowng', 1999, '', 10, 1, 1, '', 'vovanduong3010@gmail.com', 3),
(5, 'hocsinh1', '$2y$10$RDUGgF0chJD2V4n.rfKq0uJElP5FtbwUCDdXGgyKwGuRbcZzrQYgG', 'Học Sinh 1', 2004, '', 10, 1, 1, '', 'hocsinh1@gmail.com', 1),
(6, 'hocsinh2', '$2y$10$AwP9SIhP6e7.sxEzsvPIret/AJCRydSIoWt8p0CWDIkUAVer2Elmy', 'Học Sinh 2', 2004, '', 10, 1, 1, '', 'hocsinh2@gmail.com', 2),
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
(35, 'hocsinh31', '$2y$10$3xrNtteCR7Q9FLEl/qQ0NuBapQm7rIN7FheT11YN4Uwm3w329nRbu', 'Học Sinh 31', 2003, '', 11, 4, 1, '', 'hocsinh31@gmail.com', 0),
(36, 'hocsinh32', '$2y$10$KqVNLabLLCmXaztKDZtCMOffYDcVQEDd3PBG0W40bPrUvV0.7BZE.', 'Học Sinh 32', 2003, '', 11, 4, 1, '', 'hocsinh32@gmail.com', 0),
(37, 'hocsinh33', '$2y$10$znr3yLGTk7cFhDAI6sl.w.Xb4eYWyDZ0XOBCw2z9qPc1CpPNjKMPK', 'Học Sinh 33', 2003, '', 11, 4, 1, '', 'hocsinh33@gmail.com', 0),
(38, 'hocsinh34', '$2y$10$BVmkw6855Gpv5M/3C6KKMOwJTORoWtzl9t8oK..76g/ZH2uuBNQz.', 'Học Sinh 34', 2003, '', 11, 4, 1, '', 'hocsinh34@gmail.com', 0),
(39, 'hocsinh35', '$2y$10$mqBqXglUTRwuaPim/./gF.wpC4VWjX.7Z4wlrUftP9gm7NKl1ydf.', 'Học Sinh 35', 2003, '', 11, 4, 1, '', 'hocsinh35@gmail.com', 0),
(40, 'hocsinh36', '$2y$10$js9Xk/dYBuopRciX6IY3z.cz0o4oOyBCVUtldTQdCEsuqbDhG/jtW', 'Học Sinh 36', 2003, '', 11, 4, 1, '', 'hocsinh36@gmail.com', 0),
(41, 'hocsinh37', '$2y$10$G8dNcbgn0lVr.2dU2bBbS.lNp25rUr0fFdaBsQ1amcaH8YKn6gL8O', 'Học Sinh 37', 2003, '', 11, 4, 1, '', 'hocsinh37@gmail.com', 0),
(42, 'hocsinh38', '$2y$10$lrwP342QJHYz41jYR7aYnuNFCmBbDsQIYf1zv8I6oBS2PDfnkAJFm', 'Học Sinh 38', 2003, '', 11, 4, 1, '', 'hocsinh38@gmail.com', 0),
(43, 'hocsinh39', '$2y$10$SEx2haoOl64u2NMG7CVno.sBHH.f/zBumH0gBzC40irsAGBrm7VaW', 'Học Sinh 39', 2003, '', 11, 4, 1, '', 'hocsinh39@gmail.com', 0),
(44, 'hocsinh40', '$2y$10$.P6dvoVX3j8jLpjr7iQKzeTSu.NDXLamqkPCPHiIdynEYcNYIv7de', 'Học Sinh 40', 2003, '', 11, 4, 1, '', 'hocsinh40@gmail.com', 0),
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
(104, 'hocsinh100', '$2y$10$eYAj61JukNIYilsgi4OzIuazK6tMurVNDSpWs9R6RuYpDKTYsMx2W', 'Học Sinh 100', 2004, '', 12, 7, 1, '', 'hocsinh100@gmail.com', 0),
(105, 'phaihaiyen', '$2y$10$okRTvNYKhpn5YghBl6faJulcKc2OcTito59Bvf5wiq.1zOV8e4iGC', 'Phan Hải Yến', 2002, '', 12, 7, 1, '', 'test@gmail.com', 0);

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

-- --------------------------------------------------------

--
-- Table structure for table `thongbaonhom`
--

CREATE TABLE `thongbaonhom` (
  `IdThongBao` int(11) NOT NULL,
  `IdNhom` int(11) NOT NULL,
  `TieuDe` varchar(1000) NOT NULL,
  `NoiDung` varchar(1000) NOT NULL,
  `NgayTao` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thongbaonhom`
--

INSERT INTO `thongbaonhom` (`IdThongBao`, `IdNhom`, `TieuDe`, `NoiDung`, `NgayTao`) VALUES
(3, 1, '<p>Đây là thông báo mẫu</p>', '<p>Chuẩn bị bài tập chương 2</p><p>ád</p><p>fa</p><p>sd</p><p>f</p><p>á</p><p>df</p><p>a</p><p>sd</p><p>fas</p>', '2019-11-22 19:55:14'),
(5, 1, '<p>Demo Hình ảnh</p>', '<figure class=\"image\"><img src=\"/ExtraClassroomWebsite/upload/nganhangcauhoi/b447add6dc81b6bfff00bc83b1ee63.jpeg\"></figure>', '2019-11-22 20:02:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `de`
--
ALTER TABLE `de`
  ADD PRIMARY KEY (`IdDe`),
  ADD UNIQUE KEY `TenDe` (`TenDe`);

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
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `cst_nhom_nguoidung` (`IdNhom`);

--
-- Indexes for table `nhom`
--
ALTER TABLE `nhom`
  ADD PRIMARY KEY (`IdNhom`),
  ADD UNIQUE KEY `TenNhom` (`TenNhom`);

--
-- Indexes for table `thongbaonhom`
--
ALTER TABLE `thongbaonhom`
  ADD PRIMARY KEY (`IdThongBao`,`IdNhom`),
  ADD KEY `cst_nhom_thongbaonhom` (`IdNhom`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `de`
--
ALTER TABLE `de`
  MODIFY `IdDe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `nganhangcauhoi`
--
ALTER TABLE `nganhangcauhoi`
  MODIFY `IdCauHoi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `IdNguoiDung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `nhom`
--
ALTER TABLE `nhom`
  MODIFY `IdNhom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `thongbaonhom`
--
ALTER TABLE `thongbaonhom`
  MODIFY `IdThongBao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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

--
-- Constraints for table `thongbaonhom`
--
ALTER TABLE `thongbaonhom`
  ADD CONSTRAINT `cst_nhom_thongbaonhom` FOREIGN KEY (`IdNhom`) REFERENCES `nhom` (`IdNhom`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
