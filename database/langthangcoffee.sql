-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2024 at 11:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `langthangcoffee`
--

-- --------------------------------------------------------

--
-- Table structure for table `danhmucsanpham`
--

CREATE TABLE `danhmucsanpham` (
  `MaDanhMuc` int(11) NOT NULL,
  `TenDanhMuc` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `danhmucsanpham`
--

INSERT INTO `danhmucsanpham` (`MaDanhMuc`, `TenDanhMuc`) VALUES
(1, 'Coffee'),
(2, 'Fruit juice'),
(3, 'Milk tea'),
(4, 'Cake');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `MaDonHang` int(11) NOT NULL,
  `DiaChiGiaoHang` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ThanhTien` int(11) NOT NULL DEFAULT 0,
  `ThanhTienGiam` int(11) NOT NULL DEFAULT 0,
  `SoTienThanhToan` int(11) NOT NULL DEFAULT 0,
  `PhiGiaoHang` int(11) NOT NULL DEFAULT 0,
  `PhiGiaoHangGiam` int(11) NOT NULL DEFAULT 0,
  `SDTTaiKhoan` varchar(20) DEFAULT NULL,
  `MaVoucher` varchar(100) DEFAULT NULL,
  `TinhTrang` int(11) NOT NULL DEFAULT 0,
  `ThoiGianTao` datetime NOT NULL DEFAULT current_timestamp(),
  `ThoiGianCapNhat` datetime NOT NULL DEFAULT current_timestamp(),
  `ThoiGianDatHang` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`MaDonHang`, `DiaChiGiaoHang`, `ThanhTien`, `ThanhTienGiam`, `SoTienThanhToan`, `PhiGiaoHang`, `PhiGiaoHangGiam`, `SDTTaiKhoan`, `MaVoucher`, `TinhTrang`, `ThoiGianTao`, `ThoiGianCapNhat`, `ThoiGianDatHang`) VALUES
(1, 'Thinh Le, 0369084341, Q12, TP HCM', 80000, 80000, 80000, 0, 0, '0369084341', NULL, 3, '2023-05-12 16:02:13', '2024-04-27 12:47:10', '2023-05-12 16:02:13'),
(2, 'Thinh Le, 0369084341, Q12, TP HCM', 350000, 350000, 350000, 0, 0, '0369084341', NULL, 3, '2023-05-13 11:00:23', '2023-05-15 07:16:10', '2023-05-13 11:00:23'),
(3, '', 25000, 25000, 25000, 0, 0, '0973183554', NULL, 4, '2023-05-14 01:19:54', '2023-05-14 01:35:35', '2023-05-14 01:19:54'),
(4, '', 25000, 25000, 25000, 0, 0, '0973183554', NULL, 0, '2023-05-14 01:26:27', '2023-05-14 01:34:26', '2023-05-14 01:26:27'),
(5, 'Thinh Le, 0369084341, Q12, TP HCM', 25000, 12500, 12500, 0, 0, '0369084341', 'lethinh2', 4, '2023-05-14 18:38:44', '2023-05-15 08:11:53', '2023-05-14 18:38:44'),
(6, 'Thinh Le, 0369084341, Q12, TP HCM', 45000, 45000, 45000, 0, 0, '0369084341', NULL, 4, '2023-05-14 22:43:11', '2023-05-15 08:22:57', '2023-05-14 22:43:11'),
(7, 'Thinh Le, 0369084341, Q12, TP HCM', 50000, 50000, 50000, 0, 0, '0369084341', NULL, 3, '2023-05-15 07:16:39', '2023-05-15 08:22:50', '2023-05-15 07:16:39'),
(8, 'Thinh Le, 0369084341, Q12, TP HCM', 90000, 90000, 90000, 0, 0, '0369084341', NULL, 3, '2023-05-15 08:13:13', '2024-04-27 12:47:12', '2023-05-15 08:13:13'),
(9, 'Thinh Le, 0369084341, Q12, TP HCM', 50000, 50000, 50000, 0, 0, '0369084341', NULL, 4, '2023-05-15 08:27:43', '2023-05-15 20:27:51', '2023-05-15 08:27:43'),
(10, 'Thinh Le, 0369084341, Q12, TP HCM', 110000, 55000, 55000, 0, 0, '0369084341', '3H5NTWM', 3, '2023-05-15 08:38:07', '2024-04-27 12:47:13', '2023-05-15 08:38:07'),
(11, 'Thinh Le, 0369084341, Q12, TP HCM', 65000, 32500, 32500, 0, 0, '0369084341', 'HLU02DT', 3, '2023-05-15 08:39:38', '2024-04-27 12:47:15', '2023-05-15 08:39:38'),
(12, '', 0, 0, 0, 0, 0, '0767644854', NULL, 0, '2023-05-15 09:05:08', '2023-05-15 09:05:08', '2023-05-15 09:05:08'),
(13, 'Thinh Le, 0369084341, Q12, TP HCM', 95000, 95000, 95000, 0, 0, '0369084341', NULL, 0, '2023-05-15 20:14:28', '2023-05-16 08:16:55', '2023-05-15 20:14:28'),
(14, 'Hoang Minh Tan, 0866883849, Co Do, Can Tho', 165000, 165000, 165000, 0, 0, '0123456789', NULL, 3, '2024-04-27 11:42:25', '2024-04-29 19:46:57', '2024-04-27 11:42:25'),
(15, 'Co Do, Can Tho.', 25000, 25000, 25000, 0, 0, '0123456789', NULL, 1, '2024-04-29 15:31:13', '2024-04-29 22:16:59', '2024-04-29 15:31:13'),
(16, 'Hoang Minh Tan, 0866883849, Co Do, Can Tho', 90000, 90000, 90000, 0, 0, '0866883849', NULL, 3, '2024-04-29 19:50:49', '2024-04-29 19:54:48', '2024-04-29 19:50:49'),
(17, 'Hoang Minh Tan, 0866883849, Co Do, Can Tho', 90000, 90000, 90000, 0, 0, '0866883849', NULL, 2, '2024-04-29 19:52:33', '2024-04-29 20:42:31', '2024-04-29 19:52:33'),
(18, 'Hoang Minh Tan, 0866883849, Co Do, Can Tho', 170000, 170000, 170000, 0, 0, '0866883849', NULL, 1, '2024-04-29 20:41:10', '2024-04-29 23:01:14', '2024-04-29 20:41:10'),
(19, 'Co Do, Can Tho.', 0, 0, 0, 0, 0, '0123456789', NULL, 0, '2024-04-29 22:17:01', '2024-04-30 00:30:08', '2024-04-29 22:17:01'),
(20, 'Hoang Minh Tan, 0866883849, Co Do, Can Tho', 135000, 135000, 135000, 0, 0, '0866883849', NULL, 1, '2024-04-29 23:01:16', '2024-04-29 23:14:06', '2024-04-29 23:01:16'),
(21, 'Hoang Minh Tan, 0866883849, Co Do, Can Tho', 125000, 87500, 87500, 0, 0, '0866883849', 'tanhmgcc18172', 1, '2024-04-29 23:14:08', '2024-04-29 23:44:01', '2024-04-29 23:14:08'),
(22, 'Hoang Minh Tan, 0866883849, Co Do, Can Tho', 300000, 300000, 300000, 0, 0, '0866883849', NULL, 1, '2024-04-29 23:44:03', '2024-04-29 23:51:35', '2024-04-29 23:44:03'),
(23, 'Hoang Minh Tan, 0866883849, Co Do, Can Tho', 0, 0, 0, 0, 0, '0866883849', NULL, 0, '2024-04-29 23:51:37', '2024-04-30 03:56:52', '2024-04-29 23:51:37');

-- --------------------------------------------------------

--
-- Table structure for table `kichthuocsanpham`
--

CREATE TABLE `kichthuocsanpham` (
  `MaSanPham` int(11) NOT NULL,
  `TenKichThuoc` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `GiaTien` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kichthuocsanpham`
--

INSERT INTO `kichthuocsanpham` (`MaSanPham`, `TenKichThuoc`, `GiaTien`) VALUES
(1, 'Size large', 40000),
(1, 'Size medium', 30000),
(1, 'Size small', 25000),
(2, 'Size large', 40000),
(2, 'Size medium', 30000),
(2, 'Size small', 25000),
(3, 'Size large', 40000),
(3, 'Size medium', 30000),
(3, 'Size small', 25000),
(4, 'Size large', 40000),
(4, 'Size medium', 30000),
(4, 'Size small', 25000),
(5, 'Size large', 40000),
(5, 'Size medium', 30000),
(5, 'Size small', 25000),
(6, 'Size large', 45000),
(6, 'Size medium', 40000),
(6, 'Size small', 30000),
(7, 'Size large', 45000),
(7, 'Size medium', 40000),
(7, 'Size small', 30000),
(8, 'Size large', 45000),
(8, 'Size medium', 40000),
(8, 'Size small', 30000),
(9, 'Size large', 45000),
(9, 'Size nhỏ', 30000),
(9, 'Size thường', 40000),
(10, 'Size lớn', 45000),
(10, 'Size nhỏ', 30000),
(10, 'Size thường', 40000),
(11, 'Size large', 40000),
(11, 'Size medium', 35000),
(11, 'Size small', 25000),
(12, 'Size large', 40000),
(12, 'Size medium', 35000),
(12, 'Size small', 25000),
(13, 'Size large', 40000),
(13, 'Size medium', 35000),
(13, 'Size small', 25000),
(14, 'Size large', 40000),
(14, 'Size medium', 35000),
(14, 'Size small', 25000),
(15, 'Size large', 40000),
(15, 'Size medium', 35000),
(15, 'Size small', 25000),
(16, 'Size large', 35000),
(16, 'Size medium', 25000),
(16, 'Size small', 20000),
(17, 'Size large', 35000),
(17, 'Size medium', 25000),
(17, 'Size small', 20000),
(18, 'Size large', 35000),
(18, 'Size medium', 25000),
(18, 'Size small', 20000),
(19, 'Size large', 35000),
(19, 'Size medium', 25000),
(19, 'Size small', 20000),
(20, 'Size large', 35000),
(20, 'Size medium', 25000),
(20, 'Size small', 20000),
(21, 'Size large', 35000),
(21, 'Size medium', 25000),
(21, 'Size small', 20000),
(22, 'Size large', 35000),
(22, 'Size medium', 25000),
(22, 'Size small', 20000),
(23, 'Size large', 35000),
(23, 'Size medium', 25000),
(23, 'Size small', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `lichsuorder`
--

CREATE TABLE `lichsuorder` (
  `MaLichSuOrder` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `ThanhTien` int(11) NOT NULL,
  `GhiChu` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ThoiGianTao` datetime NOT NULL DEFAULT current_timestamp(),
  `MaSanPham` int(11) NOT NULL,
  `MaDonHang` int(11) NOT NULL,
  `KichThuoc` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `GiaTienKichThuoc` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lichsuorder`
--

INSERT INTO `lichsuorder` (`MaLichSuOrder`, `SoLuong`, `ThanhTien`, `GhiChu`, `ThoiGianTao`, `MaSanPham`, `MaDonHang`, `KichThuoc`, `GiaTienKichThuoc`) VALUES
(1, 1, 80000, '', '2023-05-13 10:59:24', 1, 1, 'Size thường', 30000),
(2, 3, 75000, 'khonmg da', '2023-05-13 15:03:09', 1, 2, 'Size nhỏ', 25000),
(3, 1, 40000, '', '2023-05-13 15:06:43', 2, 2, 'Size lớn', 40000),
(4, 1, 25000, '', '2023-05-13 15:06:49', 4, 2, 'Size nhỏ', 25000),
(5, 1, 30000, '', '2023-05-13 15:06:56', 6, 2, 'Size nhỏ', 30000),
(7, 2, 180000, '', '2023-05-14 00:30:05', 5, 2, 'Size lớn', 40000),
(10, 1, 25000, '', '2023-05-14 01:26:22', 3, 3, 'Size nhỏ', 25000),
(11, 1, 25000, '', '2023-05-14 01:34:23', 3, 4, 'Size nhỏ', 25000),
(12, 1, 25000, '', '2023-05-14 22:41:02', 3, 5, 'Size nhỏ', 25000),
(13, 1, 45000, '', '2023-05-15 07:16:31', 3, 6, 'Size nhỏ', 25000),
(14, 1, 50000, 'khong da', '2023-05-15 08:12:42', 3, 7, 'Size lớn', 40000),
(15, 2, 90000, 'khong da', '2023-05-15 08:27:14', 3, 8, 'Size nhỏ', 25000),
(16, 1, 50000, 'khong da', '2023-05-15 08:37:58', 3, 9, 'Size lớn', 40000),
(17, 2, 80000, '', '2023-05-15 08:38:49', 7, 10, 'Size nhỏ', 30000),
(18, 1, 30000, '', '2023-05-15 08:39:00', 16, 10, 'Size nhỏ', 20000),
(19, 1, 25000, '', '2023-05-15 09:17:14', 3, 11, 'Size nhỏ', 25000),
(20, 1, 20000, '', '2023-05-15 20:08:07', 21, 11, 'Size nhỏ', 20000),
(21, 1, 20000, '', '2023-05-15 20:08:23', 21, 11, 'Size nhỏ', 20000),
(22, 2, 70000, '', '2023-05-16 07:39:37', 3, 13, 'Size nhỏ', 25000),
(24, 1, 25000, '', '2023-05-16 07:52:54', 1, 13, 'Size nhỏ', 25000),
(25, 1, 35000, '', '2024-04-29 15:29:06', 1, 14, 'Size small', 25000),
(26, 1, 45000, '', '2024-04-29 15:29:34', 12, 14, 'Size medium', 35000),
(27, 1, 55000, '', '2024-04-29 15:29:52', 6, 14, 'Size large', 45000),
(28, 1, 30000, '', '2024-04-29 15:30:09', 22, 14, 'Size small', 20000),
(29, 1, 90000, '', '2024-04-29 19:51:42', 13, 16, 'Size large', 40000),
(30, 2, 90000, '', '2024-04-29 20:40:44', 1, 17, 'Size small', 25000),
(31, 2, 110000, '', '2024-04-29 22:04:22', 13, 18, 'Size medium', 35000),
(32, 1, 25000, '', '2024-04-29 22:16:54', 1, 15, 'Size small', 25000),
(33, 1, 60000, '', '2024-04-29 22:44:43', 10, 18, 'Size thường', 40000),
(34, 1, 40000, '', '2024-04-29 23:01:41', 1, 20, 'Size medium', 30000),
(35, 1, 20000, '', '2024-04-29 23:02:03', 18, 20, 'Size small', 20000),
(36, 3, 75000, '', '2024-04-29 23:13:47', 4, 20, 'Size small', 25000),
(37, 5, 125000, '', '2024-04-29 23:14:20', 1, 21, 'Size small', 25000),
(38, 6, 150000, '', '2024-04-29 23:50:25', 1, 22, 'Size small', 25000),
(39, 6, 150000, '', '2024-04-29 23:50:34', 1, 22, 'Size small', 25000);

-- --------------------------------------------------------

--
-- Table structure for table `lichsuorder_topping`
--

CREATE TABLE `lichsuorder_topping` (
  `MaLichSuOrder` int(11) NOT NULL,
  `TenTopping` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `GiaTien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lichsuorder_topping`
--

INSERT INTO `lichsuorder_topping` (`MaLichSuOrder`, `TenTopping`, `GiaTien`) VALUES
(1, 'Kem Phô Mai Macchiato', 10000),
(1, 'Shot Espresso', 10000),
(1, 'Sốt Caramel', 10000),
(1, 'Thạch cà phê', 10000),
(1, 'Trân châu trắng', 10000),
(7, 'Kem Phô Mai Macchiato', 10000),
(7, 'Shot Espresso', 10000),
(7, 'Sốt Caramel', 10000),
(7, 'Thạch cà phê', 10000),
(7, 'Trân châu trắng', 10000),
(13, 'Kem Phô Mai Macchiato', 10000),
(13, 'Shot Espresso', 10000),
(14, 'Kem Phô Mai Macchiato', 10000),
(15, 'Kem Phô Mai Macchiato', 10000),
(15, 'Shot Espresso', 10000),
(16, 'Kem Phô Mai Macchiato', 10000),
(17, 'Shot Espresso', 10000),
(18, 'Kem', 10000),
(22, 'Kem Phô Mai Macchiato', 10000),
(25, 'Caramel sauce', 10000),
(26, 'Black pearl', 10000),
(27, 'Coffee jelly', 10000),
(28, 'Cream', 10000),
(29, 'Black pearl', 10000),
(29, 'Caramel sauce', 10000),
(29, 'Cream cheese macchiato', 10000),
(29, 'Snow ice jelly', 10000),
(29, 'White pearls', 10000),
(30, 'Coffee jelly', 10000),
(30, 'Shot Espresso', 10000),
(31, 'Black pearl', 10000),
(31, 'White pearls', 10000),
(33, 'Thạch cà phê', 10000),
(33, 'Trân châu trắng', 10000),
(34, 'Coffee jelly', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `loaivoucher`
--

CREATE TABLE `loaivoucher` (
  `MaLoaiVoucher` int(11) NOT NULL,
  `TenLoaiVoucher` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MoTaLoaiVoucher` text NOT NULL,
  `HinhAnh` text NOT NULL,
  `TongTien` int(11) NOT NULL DEFAULT 0,
  `PhiShip` int(11) NOT NULL DEFAULT 0,
  `SoLuongToiThieu` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loaivoucher`
--

INSERT INTO `loaivoucher` (`MaLoaiVoucher`, `TenLoaiVoucher`, `MoTaLoaiVoucher`, `HinhAnh`, `TongTien`, `PhiShip`, `SoLuongToiThieu`) VALUES
(1, '30% discount on total bill', '30% discount on total bill when purchasing 5 or more products on the menu', 'https://i.imgur.com/zXiAhl7.png', 30, 0, 5),
(2, '50% reduction in shipping costs', '50% discount on shipping costs when purchasing from 3 products on the menu', 'https://i.imgur.com/zXiAhl7.png', 0, 50, 3);

-- --------------------------------------------------------

--
-- Table structure for table `quyenhan`
--

CREATE TABLE `quyenhan` (
  `MaQuyenHan` int(11) NOT NULL,
  `TenQuyenHan` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quyenhan`
--

INSERT INTO `quyenhan` (`MaQuyenHan`, `TenQuyenHan`) VALUES
(1, 'Customer'),
(2, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSanPham` int(11) NOT NULL,
  `TenSanPham` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `HinhAnh` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MoTa` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ThoiGianTao` datetime NOT NULL DEFAULT current_timestamp(),
  `MaDanhMuc` int(11) NOT NULL,
  `HienThi` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSanPham`, `TenSanPham`, `HinhAnh`, `MoTa`, `ThoiGianTao`, `MaDanhMuc`, `HienThi`) VALUES
(1, 'Black coffee', 'https://i.imgur.com/offu9GM.png', 'Rich taste of Vietnamese coffee', '2023-05-04 22:33:10', 1, 1),
(2, 'Milk coffee', 'https://i.imgur.com/cxDEgAH.png', 'Harmonious sweet taste on the tongue, elegant bitterness in the aftertaste', '2023-05-04 22:33:10', 1, 1),
(3, 'Fresh milk coffee', 'https://i.imgur.com/mpMNzIP.png', 'Rich taste of Vietnamese coffee', '2023-05-04 22:33:10', 1, 1),
(4, 'Cheese coffee', 'https://i.imgur.com/WAcrQmA.png', 'Sublimated flavor, delicious and fatty', '2023-05-04 22:33:10', 1, 1),
(5, 'Milo Coffee', 'https://i.imgur.com/sgJeFOZ.png', 'The new, sweet and fatty flavor from milo and fresh milk awakens the Vietnamese soul', '2023-05-04 22:33:10', 1, 1),
(6, 'Black sugar milk tea', 'https://i.imgur.com/UGoCqqU.png', 'The gentle, cool flavor of fresh milk blends with supple, sweet tapioca pearls', '2023-05-04 22:33:10', 3, 1),
(7, 'Matcha milk tea', 'https://i.imgur.com/jGEwF7s.png', 'Rich taste of pure green tea', '2023-05-04 22:33:10', 3, 1),
(8, 'Taro milk tea', 'https://i.imgur.com/RhsZ0yD.png', 'Sweet and fatty, fresh and fragrant', '2023-05-04 22:33:10', 3, 1),
(9, 'Cheese milk tea', 'https://i.imgur.com/WSN2IgP.png', 'Fragrant tea flavor, salty and creamy cheese', '2023-05-04 22:33:10', 3, 1),
(10, 'Cocoa milk tea', 'https://i.imgur.com/8p1DQoa.png', 'Sweet milky taste, lightly fragrant tea taste, rich and unforgettable', '2023-05-04 22:33:10', 3, 1),
(11, 'Peach juice', 'https://i.imgur.com/nG4AaDt.png', 'The sweet taste of peaches brings freshness, peace and relaxation', '2023-05-04 22:33:10', 2, 1),
(12, 'Grape juice', 'https://i.imgur.com/IcuGjX9.png', 'The flavor of purple grapes is plump, pure, moderately sweet, and delicious to beat the hot weather', '2023-05-04 22:33:10', 2, 1),
(13, 'Strawberry juice', 'https://i.imgur.com/d4W82dh.png', 'Spreading the sweetness of strawberries in the green steppe, helping cool the hot days', '2023-05-04 22:33:10', 2, 1),
(14, 'Lemon juice', 'https://i.imgur.com/wq2ljrC.png', 'Sweet and sour, gentle and relaxing flavor from yellow lemon', '2023-05-04 22:33:10', 2, 1),
(15, 'Orange juice', 'https://i.imgur.com/PRiRIgj.png', 'The sweet and sour taste of natural succulent orange zucchini brings an instant feeling of refreshment', '2023-05-04 22:33:10', 2, 1),
(16, 'Raisin rolls', 'https://i.imgur.com/vkr97J7.png', 'Covered by a fragrant flexible shell, inside is a layer of fresh cream and a characteristic fragrant, sweet raisin filling', '2023-05-04 22:33:10', 4, 1),
(17, 'Sesame toast', 'https://i.imgur.com/mtus23m.png', 'Wearing a spongy, soft and warm crust, the inside holds fragrant black sesame seeds that spread throughout each texture of the cake.', '2023-05-04 22:33:10', 4, 1),
(18, 'Croissants', 'https://i.imgur.com/kQPqZ3J.png', 'Delicious, crispy croissants typical of French culinary culture', '2023-05-04 22:33:10', 4, 1),
(19, 'Sweet honey cake', 'https://i.imgur.com/VqH07HR.png', 'Sweet honey cake has the light sweet flavor of honey and the characteristic aroma of wheat flour, combined with fragrant sesame seeds to create a thin, soft and chewy crust.', '2023-05-04 22:33:10', 4, 1),
(20, 'Strawberry jam cake', 'https://i.imgur.com/ZC04eDb.png', 'Tiny, compact strawberry jam cake with a crispy crust, melts on the tongue, stimulating taste buds', '2023-05-04 22:33:10', 4, 1),
(21, 'Salted egg cake', 'https://i.imgur.com/zULOf5s.png', 'The salted egg cake is fragrant, the outside is crispy and attractive, the salted egg inside is irresistibly delicious', '2023-05-04 22:33:10', 4, 1),
(22, 'Honey waffles', 'https://i.imgur.com/Rgk7awy.png', 'Honey waffles with a traditional Belgian flavor, crispy crust, soft, chewy, moderately sweet taste are a new experience for a good new day.', '2023-05-04 22:33:10', 4, 1),
(23, 'Baked egg cake', 'https://i.imgur.com/Zt2duKg.png', 'The cake has an eye-catching, attractive light yellow color. The crust is thick, shaped like a small cup, and crispy. Inside the cake is a baked egg filling, with an irresistible sweet and greasy taste', '2023-05-04 22:33:10', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sanphamyeuthich`
--

CREATE TABLE `sanphamyeuthich` (
  `MaSanPham` int(11) NOT NULL,
  `SDTTaiKhoan` varchar(20) NOT NULL,
  `ThoiGianTao` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sanphamyeuthich`
--

INSERT INTO `sanphamyeuthich` (`MaSanPham`, `SDTTaiKhoan`, `ThoiGianTao`) VALUES
(1, '0369084341', '2023-05-15 08:12:19'),
(1, '0866883849', '2024-04-29 21:50:10'),
(3, '0369084341', '2023-05-15 08:37:47'),
(3, '0866883849', '2024-04-29 21:50:15'),
(5, '0369084341', '2023-05-15 08:26:57'),
(6, '0866883849', '2024-04-29 21:50:29'),
(13, '0866883849', '2024-04-29 21:50:25'),
(21, '0866883849', '2024-04-29 21:50:38'),
(22, '0866883849', '2024-04-29 21:50:34');

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `SDTTaiKhoan` varchar(20) NOT NULL,
  `MatKhau` text NOT NULL,
  `Ho` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Ten` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DiaChiGiaoHang` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaQuyenHan` int(11) NOT NULL DEFAULT 1,
  `NotificationToken` text DEFAULT NULL,
  `ThoiGianThamGia` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`SDTTaiKhoan`, `MatKhau`, `Ho`, `Ten`, `DiaChiGiaoHang`, `MaQuyenHan`, `NotificationToken`, `ThoiGianThamGia`) VALUES
('0123456789', 'e10adc3949ba59abbe56e057f20f883e', 'Ngoc', 'Anh', 'Co Do, Can Tho.', 2, 'd_0YSCriSZOcHq3GWz4hMQ:APA91bHH1xyUEuTkbYC_csXIDbiVUF9b8496qrYJcqP89b5zKreOBEAW6FqYG9ZkRkMWqiAcOLbaWRSuyeA5Cu6US3ItKeWccyW-uyq3dk9rHpFiEh0lZlWMtJCwmpe5L4xcNMQmphsb', '2024-04-27 11:42:10'),
('0369084341', '87ef067531ad5e77c15a8709c37953ef', 'Lê Van', 'Thịnh', 'Thinh Le, 0369084341, Q12, TP HCM', 2, 'e_6myY5DQ02Nep1c--dHkR:APA91bFmCYYw6Tb2nOgvVrOqZJ6_G1WO7pPF8uje_hjyNZrpvZMekm9PD5h89uwFts5HyMVbCH7a2FqrJ7ttd1ozSJIIQXiN99kBwuYX0N6ZMYE5Mke47k2FF5gCBdPwl-1l2-IbjbuZ', '2023-05-12 22:32:11'),
('0767644854', '87ef067531ad5e77c15a8709c37953ef', 'Lê', 'Thịnh', NULL, 1, 'e_6myY5DQ02Nep1c--dHkR:APA91bFmCYYw6Tb2nOgvVrOqZJ6_G1WO7pPF8uje_hjyNZrpvZMekm9PD5h89uwFts5HyMVbCH7a2FqrJ7ttd1ozSJIIQXiN99kBwuYX0N6ZMYE5Mke47k2FF5gCBdPwl-1l2-IbjbuZ', '2023-05-12 22:32:11'),
('0774571054', '87ef067531ad5e77c15a8709c37953ef', 'Thinh', 'Le', NULL, 1, 'e_6myY5DQ02Nep1c--dHkR:APA91bFmCYYw6Tb2nOgvVrOqZJ6_G1WO7pPF8uje_hjyNZrpvZMekm9PD5h89uwFts5HyMVbCH7a2FqrJ7ttd1ozSJIIQXiN99kBwuYX0N6ZMYE5Mke47k2FF5gCBdPwl-1l2-IbjbuZ', '2023-05-12 22:32:11'),
('0866883849', 'e10adc3949ba59abbe56e057f20f883e', 'Hoang Minh', 'Tan', 'Hoang Minh Tan, 0866883849, Co Do, Can Tho', 1, 'd_0YSCriSZOcHq3GWz4hMQ:APA91bHH1xyUEuTkbYC_csXIDbiVUF9b8496qrYJcqP89b5zKreOBEAW6FqYG9ZkRkMWqiAcOLbaWRSuyeA5Cu6US3ItKeWccyW-uyq3dk9rHpFiEh0lZlWMtJCwmpe5L4xcNMQmphsb', '2024-04-29 19:50:23'),
('0973183554', '87ef067531ad5e77c15a8709c37953ef', 'Mai', 'Huong', NULL, 1, 'e_6myY5DQ02Nep1c--dHkR:APA91bFmCYYw6Tb2nOgvVrOqZJ6_G1WO7pPF8uje_hjyNZrpvZMekm9PD5h89uwFts5HyMVbCH7a2FqrJ7ttd1ozSJIIQXiN99kBwuYX0N6ZMYE5Mke47k2FF5gCBdPwl-1l2-IbjbuZ', '2023-05-14 01:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `toppingsanpham`
--

CREATE TABLE `toppingsanpham` (
  `MaSanPham` int(11) NOT NULL,
  `TenTopping` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `GiaTien` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `toppingsanpham`
--

INSERT INTO `toppingsanpham` (`MaSanPham`, `TenTopping`, `GiaTien`) VALUES
(1, 'Caramel sauce', 10000),
(1, 'Coffee jelly', 10000),
(1, 'Cream Cheese Macchiato', 10000),
(1, 'Shot Espresso', 10000),
(1, 'White pearls', 10000),
(2, 'Caramel sauce', 10000),
(2, 'Coffee jelly', 10000),
(2, 'Cream Cheese Macchiato', 10000),
(2, 'Shot Espresso', 10000),
(2, 'White pearls', 10000),
(3, 'Caramel sauce', 10000),
(3, 'Coffee jelly', 10000),
(3, 'Cream Cheese Macchiato', 10000),
(3, 'Shot Espresso', 10000),
(3, 'White pearls', 10000),
(4, 'Caramel sauce', 10000),
(4, 'Coffee jelly', 10000),
(4, 'Cream Cheese Macchiato', 10000),
(4, 'Shot Espresso', 10000),
(4, 'White pearls', 10000),
(5, 'Caramel sauce', 10000),
(5, 'Coffee jelly', 10000),
(5, 'Cream Cheese Macchiato', 10000),
(5, 'Shot Espresso', 10000),
(5, 'White pearls', 10000),
(6, 'Black pearl', 10000),
(6, 'Caramel sauce', 10000),
(6, 'Coffee jelly', 10000),
(6, 'Shot Espresso', 10000),
(6, 'White pearls', 10000),
(7, 'Caramel sauce', 10000),
(7, 'Coffee jelly', 10000),
(7, 'Shot Espresso', 10000),
(7, 'Trân châu đen', 10000),
(7, 'White pearls', 10000),
(8, 'Shot Espresso', 10000),
(8, 'Sốt Caramel', 10000),
(8, 'Thạch cà phê', 10000),
(8, 'Trân châu đen', 10000),
(8, 'Trân châu trắng', 10000),
(9, 'Shot Espresso', 10000),
(9, 'Sốt Caramel', 10000),
(9, 'Thạch cà phê', 10000),
(9, 'Trân châu đen', 10000),
(9, 'Trân châu trắng', 10000),
(10, 'Shot Espresso', 10000),
(10, 'Sốt Caramel', 10000),
(10, 'Thạch cà phê', 10000),
(10, 'Trân châu đen', 10000),
(10, 'Trân châu trắng', 10000),
(11, 'Black pearl', 10000),
(11, 'Caramel sauce', 10000),
(11, 'Cream Cheese Macchiato', 10000),
(11, 'Snow ice jelly', 10000),
(11, 'White pearls', 10000),
(12, 'Black pearl', 10000),
(12, 'Caramel sauce', 10000),
(12, 'Cream Cheese Macchiato', 10000),
(12, 'Snow ice jelly', 10000),
(12, 'White pearls', 10000),
(13, 'Black pearl', 10000),
(13, 'Caramel sauce', 10000),
(13, 'Cream cheese macchiato', 10000),
(13, 'Snow ice jelly', 10000),
(13, 'White pearls', 10000),
(14, 'Black pearl', 10000),
(14, 'Caramel sauce', 10000),
(14, 'Cream Cheese Macchiato', 10000),
(14, 'Snow ice jelly', 10000),
(14, 'White pearls', 10000),
(15, 'Black pearl', 10000),
(15, 'Caramel sauce', 10000),
(15, 'Cream cheese macchiato', 10000),
(15, 'Snow ice jelly', 10000),
(15, 'White pearls', 10000),
(16, 'Cream', 10000),
(16, 'Raisins', 10000),
(17, 'Black sesame', 10000),
(17, 'Cream', 10000),
(17, 'Grilled egg sauce', 10000),
(17, 'Honey', 10000),
(17, 'Sesame seeds', 10000),
(18, 'Black sesame', 10000),
(18, 'Cream', 10000),
(18, 'Grilled egg sauce', 10000),
(18, 'Honey', 10000),
(18, 'Sesame seeds', 10000),
(19, 'Black sesame', 10000),
(19, 'Cream', 10000),
(19, 'Grilled egg sauce', 10000),
(19, 'Honey', 10000),
(19, 'Sesame seeds', 10000),
(20, 'Cream', 10000),
(20, 'Strawberry jam', 10000),
(21, 'Pork floss', 10000),
(21, 'Salted eggsi', 10000),
(22, 'Cream', 10000),
(22, 'Honey', 10000),
(22, 'Strawberry jam', 10000),
(23, 'Cream', 10000),
(23, 'Grilled egg sauce', 10000),
(23, 'Honey', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `MaVoucher` varchar(100) NOT NULL,
  `SDTTaiKhoan` varchar(20) NOT NULL,
  `MaLoaiVoucher` int(11) NOT NULL,
  `ThoiGianTao` datetime NOT NULL DEFAULT current_timestamp(),
  `ThoiGianHetHan` datetime NOT NULL DEFAULT current_timestamp(),
  `SuDung` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`MaVoucher`, `SDTTaiKhoan`, `MaLoaiVoucher`, `ThoiGianTao`, `ThoiGianHetHan`, `SuDung`) VALUES
('0UTMXEH', '0866883849', 1, '2024-04-30 00:01:54', '2024-05-30 00:00:00', 0),
('3H5NTWM', '0369084341', 1, '2023-05-13 11:09:00', '2023-05-17 00:00:00', 1),
('HLU02DT', '0369084341', 1, '2023-05-14 18:40:38', '2023-05-17 00:00:00', 1),
('JXK5ZCA', '0369084341', 1, '2023-05-15 08:29:23', '2023-05-17 00:00:00', 0),
('K8QL2D7', '0369084341', 1, '2023-05-13 08:09:16', '2023-05-17 00:00:00', 0),
('K8QL2D7', '0767644854', 1, '2023-05-13 08:09:16', '2023-05-17 00:00:00', 0),
('K8QL2D7', '0774571054', 1, '2023-05-13 08:09:16', '2023-05-17 00:00:00', 0),
('lethinh', '0369084341', 1, '2023-05-07 23:58:17', '2023-05-24 00:00:00', 1),
('lethinh1', '0369084341', 1, '2023-05-07 23:58:17', '2023-05-24 23:58:17', 0),
('lethinh2', '0369084341', 1, '2023-05-07 23:58:17', '2023-05-24 23:58:17', 1),
('Q7G6VL1', '0369084341', 1, '2023-05-15 20:38:08', '2023-05-17 00:00:00', 0),
('SEYG7JU', '0369084341', 1, '2023-05-15 08:40:45', '2023-05-18 00:00:00', 0),
('SEYG7JU', '0767644854', 1, '2023-05-15 08:40:45', '2023-05-18 00:00:00', 0),
('SEYG7JU', '0774571054', 1, '2023-05-15 08:40:45', '2023-05-18 00:00:00', 0),
('SEYG7JU', '0973183554', 1, '2023-05-15 08:40:46', '2023-05-18 00:00:00', 0),
('tanhmgcc18172', '0866883849', 1, '2024-04-29 21:47:38', '2024-05-29 00:00:00', 1),
('thinhle', '0369084341', 2, '2023-05-13 08:10:03', '2023-05-19 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `danhmucsanpham`
--
ALTER TABLE `danhmucsanpham`
  ADD PRIMARY KEY (`MaDanhMuc`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`MaDonHang`),
  ADD KEY `fk_mavoucher_donhang` (`MaVoucher`),
  ADD KEY `fk_sdt_donhang` (`SDTTaiKhoan`);

--
-- Indexes for table `kichthuocsanpham`
--
ALTER TABLE `kichthuocsanpham`
  ADD PRIMARY KEY (`MaSanPham`,`TenKichThuoc`);

--
-- Indexes for table `lichsuorder`
--
ALTER TABLE `lichsuorder`
  ADD PRIMARY KEY (`MaLichSuOrder`),
  ADD KEY `fk_masp_lichsuorder` (`MaSanPham`),
  ADD KEY `fk_madh_lichsuorder` (`MaDonHang`);

--
-- Indexes for table `lichsuorder_topping`
--
ALTER TABLE `lichsuorder_topping`
  ADD PRIMARY KEY (`MaLichSuOrder`,`TenTopping`);

--
-- Indexes for table `loaivoucher`
--
ALTER TABLE `loaivoucher`
  ADD PRIMARY KEY (`MaLoaiVoucher`);

--
-- Indexes for table `quyenhan`
--
ALTER TABLE `quyenhan`
  ADD PRIMARY KEY (`MaQuyenHan`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSanPham`),
  ADD KEY `fk_madanhmuc_sanpham` (`MaDanhMuc`);

--
-- Indexes for table `sanphamyeuthich`
--
ALTER TABLE `sanphamyeuthich`
  ADD PRIMARY KEY (`MaSanPham`,`SDTTaiKhoan`),
  ADD KEY `fk_sdt_spyeuthich` (`SDTTaiKhoan`);

--
-- Indexes for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`SDTTaiKhoan`),
  ADD KEY `fk_maquyenhan_taikhoan` (`MaQuyenHan`);

--
-- Indexes for table `toppingsanpham`
--
ALTER TABLE `toppingsanpham`
  ADD PRIMARY KEY (`MaSanPham`,`TenTopping`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`MaVoucher`,`SDTTaiKhoan`),
  ADD KEY `fk_sdt_voucher` (`SDTTaiKhoan`),
  ADD KEY `fk_maloaivoucher_voucher` (`MaLoaiVoucher`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `danhmucsanpham`
--
ALTER TABLE `danhmucsanpham`
  MODIFY `MaDanhMuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `MaDonHang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `lichsuorder`
--
ALTER TABLE `lichsuorder`
  MODIFY `MaLichSuOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `loaivoucher`
--
ALTER TABLE `loaivoucher`
  MODIFY `MaLoaiVoucher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `quyenhan`
--
ALTER TABLE `quyenhan`
  MODIFY `MaQuyenHan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSanPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `fk_mavoucher_donhang` FOREIGN KEY (`MaVoucher`) REFERENCES `voucher` (`MaVoucher`),
  ADD CONSTRAINT `fk_sdt_donhang` FOREIGN KEY (`SDTTaiKhoan`) REFERENCES `taikhoan` (`SDTTaiKhoan`);

--
-- Constraints for table `kichthuocsanpham`
--
ALTER TABLE `kichthuocsanpham`
  ADD CONSTRAINT `fk_masp_kichthuocsp` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`);

--
-- Constraints for table `lichsuorder`
--
ALTER TABLE `lichsuorder`
  ADD CONSTRAINT `fk_madh_lichsuorder` FOREIGN KEY (`MaDonHang`) REFERENCES `donhang` (`MaDonHang`),
  ADD CONSTRAINT `fk_masp_lichsuorder` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`);

--
-- Constraints for table `lichsuorder_topping`
--
ALTER TABLE `lichsuorder_topping`
  ADD CONSTRAINT `fk_malichsuorder_topping` FOREIGN KEY (`MaLichSuOrder`) REFERENCES `lichsuorder` (`MaLichSuOrder`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_madanhmuc_sanpham` FOREIGN KEY (`MaDanhMuc`) REFERENCES `danhmucsanpham` (`MaDanhMuc`);

--
-- Constraints for table `sanphamyeuthich`
--
ALTER TABLE `sanphamyeuthich`
  ADD CONSTRAINT `fk_masp_spyeuthich` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`),
  ADD CONSTRAINT `fk_sdt_spyeuthich` FOREIGN KEY (`SDTTaiKhoan`) REFERENCES `taikhoan` (`SDTTaiKhoan`);

--
-- Constraints for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `fk_maquyenhan_taikhoan` FOREIGN KEY (`MaQuyenHan`) REFERENCES `quyenhan` (`MaQuyenHan`);

--
-- Constraints for table `toppingsanpham`
--
ALTER TABLE `toppingsanpham`
  ADD CONSTRAINT `fk_masp_toppingsp` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`);

--
-- Constraints for table `voucher`
--
ALTER TABLE `voucher`
  ADD CONSTRAINT `fk_maloaivoucher_voucher` FOREIGN KEY (`MaLoaiVoucher`) REFERENCES `loaivoucher` (`MaLoaiVoucher`),
  ADD CONSTRAINT `fk_sdt_voucher` FOREIGN KEY (`SDTTaiKhoan`) REFERENCES `taikhoan` (`SDTTaiKhoan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
