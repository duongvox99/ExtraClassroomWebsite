-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2019 at 08:13 AM
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
  `NgayTaoDe` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
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
  `ThoiGianDong` datetime NOT NULL,
  `SoLanLam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `diem_de`
--

CREATE TABLE `diem_de` (
  `IdNguoiDung` int(11) NOT NULL,
  `IdDe` int(11) NOT NULL,
  `Diem` int(11) NOT NULL
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
  `Lop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `RandomCode` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`IdNguoiDung`, `Username`, `Password`, `HoTen`, `NamSinh`, `Avatar`, `Lop`, `IdNhom`, `LoaiTaiKhoan`, `RandomCode`, `Email`) VALUES
(1, 'admin1', '123456', 'Võ Văn Dương', 1999, '', 0, 1, 0, 0, 'vovanduong3010@gmail.com'),
(2, 'admin2', '123456', 'Phạm Minh Dương', 1999, '', 0, 1, 0, 0, 'phamminhduong@gmail.com'),
(3, 'huynhducvu', '123456', 'Huỳnh Đức Vũ', 1980, '', 0, 1, 0, 0, 'huynhducvu@gmail.com'),
(4, 'hocsinh', '123456', 'Học sinh test', 1000, '', 10, 2, 1, 0, 'kjasdfjklasdfkljfads');

-- --------------------------------------------------------

--
-- Table structure for table `nhom`
--

CREATE TABLE `nhom` (
  `IdNhom` int(11) NOT NULL,
  `TenNhom` varchar(1000) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `Lop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nhom`
--

INSERT INTO `nhom` (`IdNhom`, `TenNhom`, `SoLuong`, `Lop`) VALUES
(1, 'Admin', 3, 0),
(2, 'Toán lớp 10 2-4-6', 30, 10),
(3, 'Toán lớp 10 3-5-7', 35, 10),
(4, 'Toán lớp 11 2-4-6', 25, 11),
(5, 'Toán lớp 11 3-5-7', 28, 11),
(6, 'Toán lớp 12 2-4-6', 32, 12),
(7, 'Toán lớp 12 3-5-7 (1)', 20, 12),
(8, 'Toán lớp 12 3-5-7 (2)', 26, 12);

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
  ADD KEY `cst_de_diem_de` (`IdDe`);

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
  ADD PRIMARY KEY (`IdNhom`);

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
  MODIFY `IdCauHoi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `IdNguoiDung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nhom`
--
ALTER TABLE `nhom`
  MODIFY `IdNhom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
