-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 24, 2025 lúc 05:00 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `phatquangquyen_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exercises`
--

CREATE TABLE `exercises` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `belt` varchar(255) NOT NULL,
  `guide_url` text DEFAULT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `exercises`
--

INSERT INTO `exercises` (`id`, `name`, `belt`, `guide_url`, `type`) VALUES
(24, 'Quyền Tấn Pháp', 'Nâu Đai', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(27, 'Căn bản công 45', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'federation'),
(28, 'Căn bản công 27', 'Nâu Đai', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(29, 'Trần Sơn Tất', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(30, 'Lão Hổ Thượng Sơn', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc73', 'federation'),
(31, 'Lãng Khách Du Xuân', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc73', 'uniform'),
(32, 'Tứ Linh Đao', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'federation'),
(33, 'Thế đối luyện số 1: Cơn bão đầu mùa', 'Nâu Đai', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(34, 'Thế đối luyện số 2: Tiếc một cành hoa', 'Nâu Đai', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(35, 'Thế đối luyện số 3: Tìm chút thân quen', 'Nâu Đai', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(36, 'Thế đối luyện số 4: Đón khách đầu đường', 'Nâu Đai', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(37, 'Thế đối luyện số 5: Hái hoa trên cành', 'Nâu Đai', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(38, '(Tự vệ) Phản bóp cổ trước 1', 'Nâu Đai', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(39, '(Tự vệ) Phản nắm cổ áo trước 1', 'Nâu Đai', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(40, '(Tự vệ) Phản nắm tóc trước 1', 'Nâu Đai', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(41, 'Lý thuyết võ đạo', 'Nâu Đai', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(42, 'Đường Lang Quyền', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(43, 'Căn bản công 36', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(44, 'Thế đối luyện số 6: Chia tay mưa rơi', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(45, 'Thế đối luyện số 7: Thuận gió bẻ măng', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(46, 'Thế đối luyện số 8: Theo chàng về dinh', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(47, 'Thế đối luyện số 9: Hái lộc đầu xuân', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(48, 'Thế đối luyện số 10: Quét lá sân chùa', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(49, '(Tự vệ) Phản bóp cổ trước 2', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(50, '(Tự vệ) Phản nắm cổ áo trước 2', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(51, '(Tự vệ) Phản nắm tóc trước 2', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(52, 'Lý thuyết võ đạo', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(53, 'Thế đối luyện số 1: Cơn bão đầu mùa', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(54, 'Thế đối luyện số 2: Tiếc một cành hoa', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(55, 'Thế đối luyện số 3: Tìm chút thân quen', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(56, 'Thế đối luyện số 4: Đón khách đầu đường', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(57, 'Thế đối luyện số 5: Hái hoa trên cành', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(58, 'Thế đối luyện số 6: Chia tay mưa rơi', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(59, 'Thế đối luyện số 7: Thuận gió bẻ măng', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(60, 'Thế đối luyện số 8: Theo chàng về dinh', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(61, 'Thế đối luyện số 9: Hái lộc đầu xuân', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(62, 'Thế đối luyện số 10: Quét lá sân chùa', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(63, 'Lý thuyết võ đạo', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(64, 'Quyền Tấn Pháp', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(65, 'Đường Lang Quyền', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(66, 'Trấn Sơn Tất', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(67, 'Thế đối luyện số 11: Bỏ về xứ xa', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(68, 'Thế đối luyện số 12: Đầy trời mưa hoa', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(69, 'Thế đối luyện số 13: Chèo đò trên sông ', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(70, 'Thế đối luyện số 14: Vác củi về nhà', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(71, 'Thế đối luyện số 15: Giữ khách ở lại', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(72, '(Tự vệ) Phản bóp cổ trước 1', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(73, '(Tự vệ) Phản nắm cổ áo trước 1', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(74, '(Tự vệ) Phản nắm tóc trước 1', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(75, '(Tự vệ) Phản bóp cổ trước 3', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(76, '(Tự vệ) Phản nắm cổ áo trước 3', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(77, '(Tự vệ) Phản nắm tóc trước 3', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(78, '(Tự vệ) Phản nắm tóc sau 1', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(79, '(Tự vệ) Phản bóp cổ trước 2', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(80, '(Tự vệ) Phản nắm cổ áo trước 2', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(81, '(Tự vệ) Phản nắm tóc trước 2', 'Cấp 2 - Lam Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(82, '(Tự vệ) Phản bóp cổ trước 1', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(83, '(Tự vệ) Phản nắm cổ áo trước 1', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(84, '(Tự vệ) Phản nắm tóc trước 1', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(85, 'Thế đối luyện số 1: Cơn bão đầu mùa', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(86, 'Thế đối luyện số 2: Tiếc một cành hoa', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(87, 'Thế đối luyện số 3: Tìm chút thân quen', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(88, 'Thế đối luyện số 4: Đón khách đầu đường', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(89, 'Thế đối luyện số 5: Hái hoa trên cành', 'Cấp 1 - Lam Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(90, 'Thế đối luyện số 1: Cơn bão đầu mùa', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(91, 'Thế đối luyện số 2: Tiếc một cành hoa', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(92, 'Thế đối luyện số 3: Tìm chút thân quen', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(93, 'Thế đối luyện số 4: Đón khách đầu đường', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(94, 'Thế đối luyện số 5: Hái hoa trên cành', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(95, 'Thế đối luyện số 6: Chia tay mưa rơi', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(96, 'Thế đối luyện số 7: Thuận gió bẻ măng', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(97, 'Thế đối luyện số 8: Theo chàng về dinh', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(98, 'Thế đối luyện số 9: Hái lộc đầu xuân', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(99, 'Thế đối luyện số 10: Quét lá sân chùa', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(100, '(Tự vệ) Phản bóp cổ trước 1', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(101, '(Tự vệ) Phản bóp cổ trước 2 ', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(102, '(Tự vệ) Phản nắm cổ áo trước 1', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(103, '(Tự vệ) Phản nắm cổ áo trước 2', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(104, '(Tự vệ) Phản nắm tóc trước 1', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(105, '(Tự vệ) Phản nắm tóc trước 2', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(106, '(Tự vệ) Phản nắm cổ áo trước 3', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(107, '(Tự vệ) Phản nắm tóc trước 3', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(108, '(Tự vệ) Phản bóp cổ trước 3', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(109, '(Tự vệ) Phản nắm tóc sau 1', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(110, 'Lý thuyết võ đạo', 'Cấp 3 - Lam Đai III', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(111, 'Căn bản côn', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(112, '(Tự vệ) Phản bóp cổ trước 1', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(113, '(Tự vệ) Phản bóp cổ trước 2', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(114, '(Tự vệ) Phản nắm cổ áo trước 1', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(115, '(Tự vệ) Phản nắm cổ áo trước 2', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(116, '(Tự vệ) Phản nắm tóc trước 1', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(117, '(Tự vệ) Phản nắm tóc trước 2', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(118, '(Tự vệ) Phản bóp cổ trước 3', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(119, '(Tự vệ) Phản nắm cổ áo trước 3', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(120, '(Tự vệ) Phản nắm tóc trước 3', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(121, '(Tự vệ) Phản nắm tóc sau 1', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(122, 'Lý thuyết võ đạo', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(123, 'Thế đối luyện số 1: Cơn bão đầu mùa', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(124, 'Thế đối luyện số 2: Tiếc một cành hoa', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(125, 'Thế đối luyện số 3: Tìm chút thân quen', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(126, 'Thế đối luyện số 4: Đón khách đầu đường', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(127, 'Thế đối luyện số 5: Hái hoa trên cành', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(128, 'Thế đối luyện số 6: Chia tay mưa rơi', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(129, 'Thế đối luyện số 7: Thuận gió bẻ măng', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(130, 'Thế đối luyện số 8: Theo chàng về dinh', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(131, 'Thế đối luyện số 9: Hái lộc đầu xuân', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(132, 'Thế đối luyện số 10: Quét lá sân chùa', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(133, 'Thế đối luyện số 11: Bỏ về xứ xa', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(134, 'Thế đối luyện số 12: Đầy trời mưa hoa', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(135, 'Thế đối luyện số 13: Chèo đò trên sông', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(136, 'Thế đối luyện số 14: Vác củi về nhà', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(137, 'Thế đối luyện số 15: Giữ khách ở lại', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(138, 'Ngọc Trản Quyền', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'federation'),
(139, '(Song luyện) Mãnh hổ tọa sơn', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(140, 'Đường Lang Quyền', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'federation'),
(141, 'Trấn Sơn Tất', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'federation'),
(142, 'Lãng khách du xuân', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'federation'),
(143, 'Thế đối luyện số 16: Quấn quýt dây leo', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(144, 'Thế đối luyện số 17: Cắm sào chờ gió', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'federation'),
(145, 'Thế đối luyện số 18: Bầy gà tìm mẹ', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'federation'),
(146, 'Thế đối luyện số 19: Ấm áp tình xuân', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(147, 'Thế đối luyện số 20: Hỏi lại cố nhân', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(148, 'Lý thuyết võ đạo', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(149, 'Thế đối luyện số 1: Cơn bão đầu mùa', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(150, 'Thế đối luyện số 2: Tiếc một cành hoa', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(151, 'Thế đối luyện số 3: Tìm chút thân quen', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(152, 'Thế đối luyện số 4: Đón khách đầu đường', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(153, 'Thế đối luyện số 5: Hái hoa trên cành', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(154, 'Thế đối luyện số 6: Chia tay mưa rơi', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(155, 'Thế đối luyện số 7: Thuận gió bẻ măng', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(156, 'Thế đối luyện số 8: Theo chàng về dinh', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(157, 'Thế đối luyện số 9: Hái lộc đầu xuân', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(158, 'Thế đối luyện số 10: Quét lá sân chùa', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(159, 'Thế đối luyện số 11: Bỏ về xứ xa', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(160, 'Thế đối luyện số 12: Đầy trời mưa hoa', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(161, 'Thế đối luyện số 13: Chèo đò trên sông', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(162, 'Thế đối luyện số 14: Vác củi về nhà', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(163, 'Thế đối luyện số 15: Giữ khách ở lại', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(164, '(Tự vệ) Phản bóp cổ trước 1', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(165, '(Tự vệ) Phản bóp cổ trước 2', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(166, '(Tự vệ) Phản nắm cổ áo trước 1', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(167, '(Tự vệ) Phản nắm cổ áo trước 2', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(168, '(Tự vệ) Phản nắm tóc trước 1', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(169, '(Tự vệ) Phản nắm tóc trước 2', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(170, '(Tự vệ) Phản bóp cổ trước 3', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(171, '(Tự vệ) Phản nắm cổ áo trước 3', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(172, '(Tự vệ) Phản nắm tóc trước 3', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(173, '(Tự vệ) Phản nắm tóc sau 1', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(177, '12 Thân pháp', 'Cấp 4 - Lam Đai IV', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(178, '12 Thân pháp', 'Cấp 5 - Lục Đai I', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(179, 'Thế đối luyện số 21: Trông ngóng người đi', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(180, 'Thế đối luyện số 22: Đốn củi ngoài sân', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(181, 'Thế đối luyện số 23: Mục đồng giỡn trâu', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(182, 'Thế đối luyện số 24: Mở cửa đón trăng', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(183, 'Thế đối luyện số 25: Mời khách sang sông', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(184, 'Mãn Thiên Hoa Vũ', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(185, 'Hùng Kê Quyền', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(186, '(Song luyện) Thất bộ côn', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(187, 'Thế đối luyện số 1: Cơn bão đầu mùa', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(188, 'Thế đối luyện số 2: Tiếc một cành hoa', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(189, 'Thế đối luyện số 3: Tìm chút thân quen', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(190, 'Thế đối luyện số 4: Đón khách đầu đường', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(191, 'Thế đối luyện số 5: Hái hoa trên cành', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(192, 'Thế đối luyện số 6: Chia tay mưa rơi', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(193, 'Thế đối luyện số 7: Thuận gió bẻ măng', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(194, 'Thế đối luyện số 8: Theo chàng về dinh', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(195, 'Thế đối luyện số 9: Hái lộc đầu xuân', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(196, 'Thế đối luyện số 10: Quét lá sân chùa', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(197, 'Thế đối luyện số 11: Bỏ về xứ xa', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(198, 'Thế đối luyện số 12: Đầy trời mưa hoa', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(199, 'Thế đối luyện số 13: Chèo đò trên sông', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(200, 'Thế đối luyện số 14: Vác củi về nhà', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(201, 'Thế đối luyện số 15: Giữ khách ở lại', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(202, 'Thế đối luyện số 16: Quấn quýt dây leo', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(203, 'Thế đối luyện số 17: Cắm sào chờ gió', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(204, 'Thế đối luyện số 18: Bầy gà tìm mẹ', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(205, 'Thế đối luyện số 19: Ấm áp tình xuân', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(206, 'Thế đối luyện số 20: Hỏi lại cố nhân', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(207, '(Tự vệ) Phản bóp cổ trước 1', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(208, '(Tự vệ) Phản bóp cổ trước 2', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(209, '(Tự vệ) Phản bóp cổ trước 3', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(210, '(Tự vệ) Phản nắm cổ áo trước 1', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(211, '(Tự vệ) Phản nắm cổ áo trước 2', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(212, '(Tự vệ) Phản nắm cổ áo trước 3', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(213, '(Tự vệ) Phản nắm tóc trước 1', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(214, '(Tự vệ) Phản nắm tóc trước 2', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(215, '(Tự vệ) Phản nắm tóc trước 3', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform'),
(216, '(Tự vệ) Phản nắm tóc sau 1', 'Cấp 6 - Lục Đai II', 'https://www.youtube.com/watch?v=vsd4rRAnc74', 'uniform');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_code` varchar(50) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `dharma_name` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `pob` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `photo_uniform` varchar(255) DEFAULT NULL,
  `photo_federation` varchar(255) DEFAULT NULL,
  `belt` varchar(50) DEFAULT NULL,
  `federation_belt` varchar(50) DEFAULT NULL,
  `diploma_uniform` varchar(255) DEFAULT NULL,
  `diploma_federation` varchar(255) DEFAULT NULL,
  `club` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone_number` varchar(20) DEFAULT NULL,
  `coach` varchar(255) DEFAULT NULL,
  `education_level` varchar(255) DEFAULT NULL,
  `promotion_test_uniform` tinyint(1) DEFAULT 0,
  `promotion_test_federation` tinyint(1) DEFAULT 0,
  `qr_code_url` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `scorecard_uniform` varchar(255) DEFAULT NULL,
  `scorecard_federation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `students`
--

INSERT INTO `students` (`id`, `student_code`, `name`, `dharma_name`, `dob`, `id_card`, `pob`, `address`, `photo_uniform`, `photo_federation`, `belt`, `federation_belt`, `diploma_uniform`, `diploma_federation`, `club`, `status`, `created_at`, `phone_number`, `coach`, `education_level`, `promotion_test_uniform`, `promotion_test_federation`, `qr_code_url`, `gender`, `scorecard_uniform`, `scorecard_federation`) VALUES
(14, 'PQQIOUY3YVI', 'Đặng Ngọc Trà My', '', '2016-08-09', '', 'Tổ 6 , kp Hải Dinh , Phường Kim Dinh , tp Bà Rịa', 'Tổ 6 , kp Hải Dinh , Phường Kim Dinh , tp Bà Rịa', NULL, 'uploads/eea6a4affaf46d9938652a4fcb122a8b.jpg', 'Cấp 1 - Lam Đai I', 'Cấp 1', 'uploads/f37cf9e419a8b76359dfd2031373bd0c.jpg', NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-09 02:27:42', '0976123742', 'Thầy Thích Pháp Tánh', 'Lớp 5', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(15, 'PQQGJO81RQZ', 'Đoàn Phạm Nguyên', '', '2013-02-06', '', 'Kim Hải - Kim Dinh - TP Bà Rịa ', 'Kim Hải - Kim Dinh - TP Bà Rịa ', NULL, 'uploads/3a25d2dd9964fb1dbafce9079dc5891e.jpg', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-09 02:29:55', '0934141421', 'Thầy Thích Pháp Tánh', 'Lớp 7', NULL, NULL, NULL, 'Nam', NULL, NULL),
(16, 'PQQ8KCWAFNK', 'Hồ Nghĩa Gia Phong', '', '2016-09-13', '', 'Kim Hải - Kim Dinh - TP Bà Rịa ', 'Kim Hải - Kim Dinh - TP Bà Rịa ', NULL, 'uploads/f22689460d45bbdd2c71cfd4ed773f1b.jpg', 'Cấp 1 - Lam Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-09 02:31:42', '0938705358', 'Thầy Thích Pháp Tánh', 'Lớp 5', NULL, NULL, NULL, 'Nam', NULL, NULL),
(17, 'PQQRN2ZE8XQ', 'Lê Minh Châu', '', '2014-08-09', '', '457 Đỗ Nhuận - Kim Dinh - Bà Rịa', '457 Đỗ Nhuận - Kim Dinh - Bà Rịa', NULL, 'uploads/cddbf25aca7ca43436abfc110a085add.jpg', 'Cấp 5 - Lục Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-09 02:34:03', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(18, 'PQQ9JWCMHBX', 'Lê Thị Hoàng Kim', '', '2011-08-19', '', 'Tổ 6, kp Hải Dinh, phường Kim Dinh, tp Bà Rịa', 'Tổ 6, kp Hải Dinh, phường Kim Dinh, tp Bà Rịa', NULL, 'uploads/ff9376e68148b9a6655804fc8a0672a3.png', 'Cấp 5 - Lục Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-09 02:36:33', '0338754805', '', 'Lớp 9', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(19, 'PQQRU167E0U', 'Mai Gia Phúc', '', '2018-08-09', '', 'Kim Hải - Kim Dinh - TP Bà Rịa ', 'Kim Hải - Kim Dinh - TP Bà Rịa ', NULL, 'uploads/c5648353f61f4cad48be91b7231639ac.jpg', 'Cấp 1 - Lam Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-09 02:39:03', '0774333913', 'Thầy Thích Pháp Tánh', 'Lớp 2', NULL, NULL, NULL, 'Nam', NULL, NULL),
(20, 'PQQOFV6KHQO', 'Mai Tùng Lâm', '', '2013-07-12', '', 'Tân Hải - Phú Mỹ ', 'Tân Hải - Phú Mỹ ', NULL, 'uploads/dee0bf4dcf9063472033ceca554889e6.png', 'Cấp 4 - Lam Đai IV', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 02:55:06', '0774333913', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(21, 'PQQW609RU9O', 'Nguyễn Ánh Vy', '', '2018-06-23', '', 'Tổ 10 - Kim Sơn - Kim Dinh - Bà Rịa ', 'Tổ 10 - Kim Sơn - Kim Dinh - Bà Rịa ', NULL, 'uploads/1e8f893eb76b6718a1bf2978f9c443a7.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 02:58:25', '0366572706', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(22, 'PQQ0R71W8EX', 'Nguyễn Doãn Hào ', '', '2016-07-15', '', 'Hẻm 325 Phan Văn Trị, phường kim dinh', 'Hẻm 325 Phan Văn Trị, phường kim dinh', NULL, 'uploads/86cc9c6010a32606560a9fe6772e640e.jpg', 'Cấp 1 - Lam Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:01:24', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(23, 'PQQHH5KI02H', 'Nguyễn Hoàng Hải Đăng', '', '2012-06-29', '', 'Phường Phước Hưng, tổ 1, khu phố 4', 'Phường Phước Hưng, tổ 1, khu phố 4', NULL, 'uploads/ad3eafc5300a59b295f3aa9a8f08890d.png', 'Cấp 1 - Lam Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:03:01', '0902007016', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(24, 'PQQJNH0V77K', 'Nguyễn Lê Thanh Nhã', '', '2013-06-12', '', 'Tổ 8 , Kp Kim Hải , Phường Kim Dinh , tp Bà Rịa', 'Tổ 8 , Kp Kim Hải , Phường Kim Dinh , tp Bà Rịa', NULL, 'uploads/ea788dd8246085f5c50b6dcd35f734f8.png', 'Cấp 1 - Lam Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:05:21', '0908161064', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(25, 'PQQNJOJXS8R', 'Nguyễn Mạnh Tuấn', '', '2016-11-10', '', 'Kim Dinh - TP.Bà Rịa', 'Kim Dinh - TP.Bà Rịa', NULL, 'uploads/737a44ac696eed9c03a889998d12397e.png', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:10:46', '', '', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(26, 'PQQDCQOJMRV', 'Nguyễn Ngọc Cát Tường', '', '2016-08-10', '', '', '', NULL, 'uploads/a986c1ead129a82b148a24748b5ae3f8.jpg', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:11:37', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(27, 'PQQFT7UDVSA', 'Nguyễn Ngọc Kiều Anh', '', '2011-04-23', '', '', '', NULL, 'uploads/77419404da2b105d4ac2886a3f8d784c.PNG', 'Cấp 5 - Lục Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:13:04', '0937537916', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(28, 'PQQ9LSZ3F4H', 'Nguyễn Ngọc Như Ý', '', '2011-11-19', '', '', '', NULL, 'uploads/541a12e7052edc95cf8295b05193b208.png', 'Cấp 4 - Lam Đai IV', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:14:43', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(29, 'PQQAFO8Z1BD', 'Nguyễn Phúc Bình An', '', '2011-07-22', '', '', '', NULL, 'uploads/60502e074258f98e89b913a1276e8150.jpg', 'Cấp 2 - Lam Đai II', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:16:46', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(30, 'PQQLW0KRFLU', 'Nguyễn Phúc Thiên Ân', '', '2016-08-20', '', '', '', NULL, 'uploads/25e04faeec37d4a8c7b7c58806f6e8f6.jpg', 'Cấp 1 - Lam Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:18:34', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(31, 'PQQTMWVTD3W', 'Nguyễn Tiến Phát', '', '2014-10-10', '', '', '', NULL, 'uploads/6a46fbd567a195938aae0fc8caa3208c.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:19:32', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(32, 'PQQA6R6ORS6', 'Nguyễn Trần Bảo Châu', '', '2015-04-10', '', '', '', NULL, 'uploads/0d075a6668eee6fc3d12fb41847760cb.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:22:01', '0933107340', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(33, 'PQQSVGW05JL', 'Phạm Nguyên Hoàng Phúc', '', '2016-06-10', '', '', '', NULL, 'uploads/0f4d8f65ce327575661ac18cbc85234a.jpg', 'Cấp 2 - Lam Đai II', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:26:06', '0985510234', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(34, 'PQQWCTLH3YI', 'Phạm Thị Phương Quyên', '', '2011-11-19', '', '', '', NULL, 'uploads/7aac1c7b7916421026612c3d452d7e20.PNG', 'Cấp 5 - Lục Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:27:13', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, '', NULL, NULL),
(35, 'PQQ1ST8S4PU', 'Phan Phi Long', '', '2013-04-10', '', '', '', NULL, 'uploads/fc612d046175f5e21482c7cc71ef1b22.png', 'Cấp 5 - Lục Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:28:16', '0838748874', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(36, 'PQQ1I71AX28', 'Phan Phi Phụng', '', '2017-07-26', '', '', '', NULL, 'uploads/e57416c5c16fa73f0a12762c766750da.PNG', 'Cấp 1 - Lam Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:29:47', '0838748874', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(37, 'PQQ1TWJ74E4', 'Tăng Thành Danh', '', '2012-07-10', '', '', '', NULL, 'uploads/704726e21290aab1bb9f6391e0215c23.jpg', 'Cấp 5 - Lục Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:31:01', '0937687866', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(38, 'PQQXU9PFIOH', 'Trần Hoàng Thảo Vy', '', '2013-11-10', '', '', '', NULL, 'uploads/26b6196bd5238583c14e5448217ff4bc.png', 'Cấp 5 - Lục Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:32:46', '0972758285', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(39, 'PQQLTF5X090', 'Nguyễn Thảo My', '', '2013-12-10', '', '', '', NULL, 'uploads/faa0b02b79c2fbfac5e9f57c09dfcb54.png', 'Cấp 4 - Lam Đai IV', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:35:39', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(40, 'PQQX595ZSZU', 'Phạm Thùy Anh', '', '2013-07-10', '', '', '', NULL, 'uploads/f76fe6bb12f0f90f63ea9fe2af0222f2.png', 'Cấp 2 - Lam Đai II', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:36:38', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(41, 'PQQHT4ILC6E', 'Hồ Nguyệt Nga', '', '2015-08-10', '', '', '', NULL, 'uploads/a2941a9cdd0869c1aeb4e3cf6f018333.png', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:37:46', '0975350836', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(42, 'PQQ3DEI0WAL', 'Phạm Thúy Phương Quỳnh', '', '2012-11-19', '', '', '', NULL, 'uploads/47ee2aacd0b0651deccb0c3e3e0211bf.PNG', 'Cấp 5 - Lục Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:39:03', '0825033391', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(43, 'PQQAL0NBIC0', 'Trương Nguyễn Châu Pha', '', '2011-07-10', '', '', '', NULL, 'uploads/ec13a08d8c11b5dfd02754ae0f4de6fa.jpg', 'Cấp 4 - Lam Đai IV', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:40:38', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(44, 'PQQ2J2TTJRV', 'Ngô Gia Huy', '', '2016-12-10', '', '', '', NULL, 'uploads/63a8e05a6d847c063fb9896217c54a55.png', 'Nâu Đai', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:41:53', '0365195720', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(45, 'PQQBRPV8Z6Y', 'Nguyễn Ngọc Bảo Long', '', '2012-07-10', '', '', '', NULL, 'uploads/faf90ec9a10481eb3401f025a7f05af6.png', 'Cấp 2 - Lam Đai II', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:43:16', '0905564397', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(46, 'PQQKHV6G3GD', 'Nguyễn Tiến Việt', '', '2007-07-10', '', '', '', NULL, 'uploads/25c52dbe3b7fb926fd1ddcb5e061b8b9.jpg', 'Cấp 13 - Hoàng đai I', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:45:01', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(47, 'PQQ2QU0H7TI', 'Trần Tuấn Đạt', '', '2013-03-16', '', '', '', NULL, 'uploads/25f94251951ed97e2763722637adc4d6.jpg', 'Cấp 3 - Lam Đai III', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:46:49', '0936054087', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(48, 'PQQAQR0NJE8', 'Nguyễn Thị Thắm', '', '1972-11-10', '', '', '', NULL, 'uploads/938d6e71e7f2f14bea06bb76a67e0f19.PNG', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:48:18', '0329306352', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(49, 'PQQOG261PW0', 'Trần Phạm Phương Nghi', '', '2015-07-10', '', '', '', NULL, 'uploads/052219de4ea5df018184d9e426cecd6a.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:49:54', '0936054087', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(50, 'PQQC5Q0CNI9', 'Nguyễn Lê Thanh Tú', '', '2011-07-10', '', '', '', NULL, 'uploads/165dc2a6b024ba1127dd077170631ae9.png', 'Cấp 5 - Lục Đai I', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:52:11', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(51, 'PQQEONQPPLD', 'Ngô Phạm Ngọc Ngân', '', '2010-02-10', '', '', '', NULL, 'uploads/f6d73840637b15250a6595622b795125.png', 'Cấp 7 - Lục Đai III', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 03:53:27', '079 862 6602', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(52, 'PQQ58UV81F9', 'Nguyễn Tiến Đạt', '', '2009-07-10', '', '', '', NULL, 'uploads/0c691f85e5e3dc0b3435df08cf5b393b.png', 'Cấp 7 - Lục Đai III', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 07:59:05', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(53, 'PQQFUM3IFCP', 'Mai Công Thành', 'Đăng Khôi Đạt', '2010-07-10', '', '', '', NULL, 'uploads/5aaf0b9b54c00a21ae218dd2035ee1ea.jpg', 'Cấp 4 - Lam Đai IV', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:00:23', '092 2007 045', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(54, 'PQQAT1LU8XM', 'Phạm Ngọc Thiên Thanh', '', '2008-08-10', '', '', '', NULL, 'uploads/008b716590ce6af9bbf03a9477b6acc0.png', 'Cấp 12 - Hồng đai thiếu niên IV', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:02:02', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(55, 'PQQNLY3G0RL', 'Nguyễn Khải Nguyên', '', '2018-07-10', '', '', '', NULL, 'uploads/acc3bd97148b3fc0a899163c2afd1c81.jfif', 'Nâu Đai', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:02:57', '0973715676', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(56, 'PQQXCP94N2J', 'Hồ Cao Phương Thảo', '', '2017-08-10', '', '', '', NULL, 'uploads/efa1b2435958e5f1c2c3e3a3a2684147.jpg', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:03:43', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(57, 'PQQ5Y7BSEX5', 'Hồ Trung Hiếu', '', '2013-07-10', '', '', '', NULL, 'uploads/4ed423c9b34284e8db7bd6b533e3a628.png', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:07:14', '0975350836', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(58, 'PQQSI3ZCHM0', 'Nguyễn Phúc An', '', '2016-11-10', '', '', '', NULL, 'uploads/6480acd9f5ef094a836ecd13138931bd.png', 'Cấp 1 - Lam Đai I', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:10:02', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(59, 'PQQUYDANNDV', 'Ngô Hà Tuấn Anh', '', '2018-06-10', '', '', '', NULL, 'uploads/23464a24a1b1260eb6ee05b8be30734d.jfif', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:12:17', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(60, 'PQQATII89YD', 'Ngô Hà Anh Tuấn', '', '2018-07-10', '', '', '', NULL, 'uploads/5982a3f0f31605180f657c5907aec32a.jfif', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:12:49', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, '', NULL, NULL),
(61, 'PQQF62FN6NI', 'Huỳnh Minh Triết', '', '2025-09-10', '', '', '', NULL, 'uploads/746bcf7755cc1024a813e0c45f965c99.jfif', 'Nâu Đai', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:16:20', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(62, 'PQQN6UC9MIU', 'Trần Thiên Ân', '', '2025-09-10', '', '', '', NULL, NULL, 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:17:45', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(63, 'PQQZGN9SZM3', 'Lý Hoàng Mạnh', '', '2009-07-10', '', '', '', NULL, 'uploads/511224e02c4b566e4f2310bdaa906f01.png', 'Cấp 7 - Lục Đai III', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:19:19', '0909247721', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(64, 'PQQC9R7B9S8', 'Nguyên Lê Duy Nhân', '', '2014-02-10', '', '', '', NULL, 'uploads/d0ce31d1d63895f3d0e6d0f7da4cef9b.jfif', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:20:10', '0972551774', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(65, 'PQQ5F5QSWAM', 'Nguyễn Tuấn Dương', '', '2019-08-10', '', '', '', NULL, 'uploads/c14ba191c56971812d2fb37cf2e1f9f2.jfif', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:20:38', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(66, 'PQQAZ0XW3VZ', 'Huỳnh Khôi', '', '2016-08-10', '', '', '', NULL, 'uploads/ac791746c4bdff608666ced3f709387e.png', 'Nâu Đai', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:21:22', '0898505501', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(67, 'PQQPAA5SS0A', 'Đỗ Đức Thanh', '', '2012-08-10', '', '', '', NULL, 'uploads/7b9cc6ab45df67b9b2986fbbe15bdbd1.jfif', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:24:22', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(68, 'PQQGIU7DRSX', 'Hoàng Anh Khoa', '', '2015-01-10', '', '', '', NULL, 'uploads/0ee52e2a3f9bc99a08e2b4c9037f4cf9.jfif', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:25:21', '0797041467', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(69, 'PQQ8UU4RSRO', 'Phạm Khánh Ngọc', '', '2018-07-10', '', '', '', NULL, 'uploads/d2d5752db8f71eb95fd4666c4b0e92a0.jfif', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:26:14', '0933781764', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(70, 'PQQOEOQ6GON', 'Nguyễn Hoàng Yến', '', '2019-03-10', '', '', '', NULL, 'uploads/8ca18d9365f32607b7b8c00d1adc4b0e.jfif', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:26:47', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(71, 'PQQ7X7KC4SJ', 'Đặng Đức Thịnh', '', '2014-03-10', '', '', '', NULL, 'uploads/cd6284201e276b93f0497cbcc2cda7f9.jfif', 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:27:29', '0902792936', 'Thầy Thích Pháp Tánh', '', 1, 1, NULL, 'Nam', NULL, NULL),
(72, 'PQQMMTLV5H6', ' Lý Hồng Hạnh', '', '2016-03-10', '', '', '', NULL, NULL, 'Nâu Đai', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:28:50', '0974788043', 'Thầy Thích Pháp Tánh', '', 0, 1, NULL, 'Nữ', NULL, NULL),
(73, 'PQQ8A3DQ8EW', 'Nguyễn Tấn Phát', '', '2002-07-10', '', '', '', NULL, 'uploads/119e64b6015b28d773f24f04aba2cf9f.jpg', 'Cấp 14 - Hoàng đai II', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Đã Nhập Môn', '2025-09-10 08:32:41', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nam', NULL, NULL),
(74, 'PQQK05NIB4A', 'Ngô Bảo Kim', '', '2013-08-10', '', '', '', NULL, NULL, 'Cấp 2 - Lam Đai II', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:35:15', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(75, 'PQQU44JKAXY', 'Lê Hoàng Phi Yến', '', '2006-07-10', '', '', '', NULL, 'uploads/b352683750b960c3ce693c5779122fa7.jpg', 'Cấp 2 - Lam Đai II', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:37:04', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, 'Nữ', NULL, NULL),
(76, 'PQQ80Y8N5PV', 'Nguyễn Thị Thoa', '', '1978-07-10', '', '', '', NULL, 'uploads/b6c2ff702496efce0089481bff6affdb.png', 'Cấp 3 - Lam Đai III', 'Cấp 1', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 08:40:37', '', 'Thầy Thích Pháp Tánh', '', NULL, NULL, NULL, '', NULL, NULL),
(80, 'PQQRAAPJG5Q', 'Lê Nguyễn Ngọc Yến', '', '2008-06-10', '', '', '', NULL, 'uploads/f08bf4bdf6347bce300d2f26e1b2f768.jpg', 'Cấp 6 - Lục Đai II', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 15:50:17', '0816733108', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(81, 'PQQJH3ZX34L', 'Huỳnh Trung Hiếu', 'Đạt Nhất Kiên', '2011-07-10', '', '', '', NULL, 'uploads/7a882ea3d7d35b50f363a9bb304f368a.jpg', 'Cấp 6 - Lục Đai II', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 15:51:35', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(82, 'PQQ8ZXO379H', 'Nguyễn Khánh Đăng', '', '2011-06-10', '', '', '', NULL, 'uploads/2754956e0a3173130a9be2776fb69161.jpg', 'Cấp 4 - Lam Đai IV', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 15:54:07', '0908266086', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(83, 'PQQOMIMAX2V', 'Vũ Ngọc Cao', '', '1995-07-10', '', '', '', NULL, 'uploads/35d4bec50889f73332942725432b8d82.jpg', 'Cấp 4 - Lam Đai IV', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 15:55:15', '0376785743', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(84, 'PQQUIHLGXBS', 'Lê Minh Quân', '', '2012-06-10', '', '', '', NULL, 'uploads/4eb6e7869b908f9aa05fa02ff5c07fa4.jpg', 'Cấp 3 - Lam Đai III', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 15:56:05', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(85, 'PQQ8USO6T74', 'Lê Đức Tiến', '', '2012-06-10', '', '', '', NULL, 'uploads/d88ca7b0ab4afa64bae89c74f2c0d2fd.jpg', 'Cấp 4 - Lam Đai IV', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 15:57:06', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(86, 'PQQGCEJHEIU', 'Lê Quang Nhật Hoàng', '', '2015-07-10', '', '', '', NULL, 'uploads/737d5d25aba3df115d7fa3cab06c6987.jpg', 'Cấp 4 - Lam Đai IV', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 15:58:47', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, '', NULL, NULL),
(87, 'PQQ2C7QNTEF', 'Lê Phúc Thanh Nhàn', '', '2012-07-10', '', '', '', NULL, 'uploads/283850919b2f216f4b4234711ea2b91a.jpg', 'Cấp 3 - Lam Đai III', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-10 15:59:33', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(88, 'PQQTMXZOWGH', 'Nguyễn Huỳnh Khải Minh', '', '2009-07-10', '', '', '', NULL, 'uploads/62b4bfe762e0bf4dbd8a5eedcd687049.jpg', 'Cấp 4 - Lam Đai IV', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:00:32', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(89, 'PQQH0CI7XGP', 'Nguyễn Lê Anh Khoa', '', '2010-01-10', '', '', '', NULL, 'uploads/c21df4b479deacd456e58e49073e0bc9.jpg', 'Cấp 3 - Lam Đai III', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:01:32', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(90, 'PQQGJIN56J9', 'Nguyễn Lê Anh Quân', '', '2012-03-10', '', '', '', NULL, 'uploads/841fe4f1a7f8356a219fc80ac153978a.jpg', 'Cấp 4 - Lam Đai IV', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:02:15', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, '', NULL, NULL),
(91, 'PQQ8Y65BR38', 'Lê Thị Phương Thanh', '', '1984-08-10', '', '', '', NULL, 'uploads/bbda168011963906adb302a88c0987cb.jpg', 'Cấp 4 - Lam Đai IV', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:03:10', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(92, 'PQQJSA45B3F', 'Võ Ngọc Tường Lam', '', '2012-06-10', '', '', '', NULL, 'uploads/1b923c3e39bcfc4d6d40edf320eb3dba.jpg', 'Cấp 4 - Lam Đai IV', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:04:36', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(93, 'PQQB5PKDQJA', 'Ngô Thị Thúy Vân', '', '2012-06-10', '', '', '', NULL, 'uploads/0cb4321263f79b713a9d7c4b523f77ea.jpg', 'Cấp 4 - Lam Đai IV', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:05:32', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(94, 'PQQI1X9OQ1P', 'Lê Nguyễn Thiên Kim', '', '2014-03-10', '', '', '', NULL, 'uploads/8b1ea15d7d1db065cef606ba97e8ffc5.jpg', 'Cấp 2 - Lam Đai II', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:07:06', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, '', NULL, NULL),
(95, 'PQQ08V40BTC', 'Nguyễn Trọng Khang', '', '2012-06-10', '', '', '', NULL, 'uploads/30670d62f5160a28e89cb023437b024c.jpg', 'Cấp 2 - Lam Đai II', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:07:58', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(96, 'PQQIWR1R7B7', 'Huỳnh Vũ Tuấn Phương', '', '2006-08-10', '', '', '', NULL, 'uploads/e93c4b142819cbc8c58dab6d7260b0bd.jpg', 'Cấp 3 - Lam Đai III', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:08:40', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(97, 'PQQ3PO9MXS8', 'Đỗ Hoàng Hải', '', '2012-07-10', '', '', '', NULL, 'uploads/710a4859f527c43c096891b76ea5002a.jpg', 'Cấp 2 - Lam Đai II', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:09:58', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, '', NULL, NULL),
(98, 'PQQ0STTSX12', 'Hồ Quỳnh Anh', '', '2012-07-10', '', '', '', NULL, 'uploads/d8c2cd1f925cc31d65c4e68012ed7bfa.png', 'Cấp 5 - Lục Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:11:24', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(99, 'PQQZ510DBXJ', 'Bùi Nguyễn Thanh Tâm', 'Đạt Chiếu Lâm', '2011-01-10', '', '', '', NULL, 'uploads/1d2c994a3a77f84f1f1d0c6cdc64b37a.jpg', 'Cấp 5 - Lục Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:13:24', '', 'Thầy Thích Pháp Tánh', '', 1, 1, NULL, 'Nam', NULL, NULL),
(100, 'PQQCL1PVPPU', 'Bùi Văn Long', 'Tiến Nhân Phúc', '2010-06-10', '', '', '', NULL, 'uploads/1b2b0d1d7fd81609910ba4fcd5a1130e.jpg', 'Cấp 9 - Hồng đai thiếu niên I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:14:47', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(101, 'PQQN1CYHU9R', 'Đoàn Đăng Phúc', '', '2016-01-10', '', '', '', NULL, 'uploads/edb247814052ad68156add116ad29afe.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-10 16:16:25', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(102, 'PQQ5RQRSZ53', 'Nguyễn Ngọc Bảo An ', '', '2015-10-11', '', '', '', NULL, 'uploads/57507416f262caed448df98fdd073456.jfif', 'Nâu Đai', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-11 05:13:24', '', 'Thầy Thích Pháp Tánh', '', 1, 0, NULL, 'Nữ', NULL, NULL),
(103, 'PQQVNTR9MOE', 'Nguyễn Ngọc Thanh Nhàn', '', '2019-06-11', '', '', '', NULL, 'uploads/65ff33d94e894f4df059635bfb4b136c.jfif', 'Nâu Đai', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-11 05:14:38', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(104, 'PQQA2CDO6YP', 'Đỗ Quốc Bình', '', '2013-02-11', '', '', '', NULL, 'uploads/280822c46be120e756f8112c29ee1a66.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-11 05:30:00', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, '', NULL, NULL),
(105, 'PQQ5FE72497', 'Hà Thị Trà', 'Phúc Chiếu Duệ', '1991-07-11', '', '', '', NULL, 'uploads/5b2873b09be85f44886d4fc252bb814a.jpg', 'Cấp 5 - Lục Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-11 05:32:14', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, '', NULL, NULL),
(106, 'PQQX7LQO6CE', 'Huỳnh Nguyễn Đông Quân', '', '2010-02-11', '', '', '', NULL, 'uploads/327b27fbc4feeae22e6521a19fb045e0.jpg', 'Cấp 5 - Lục Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-11 05:34:29', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(107, 'PQQ7UN5ZY3L', 'Lê Đình Thiên Ân', '', '2018-06-11', '', '', '', NULL, 'uploads/0bf58c8564c166399d85ce05a70a246d.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-11 05:35:31', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(108, 'PQQOWWLY9DM', 'Lê Hoàng Minh', '', '2012-11-11', '', '', '', NULL, 'uploads/45426dad54a40a3d895a682cf54441e9.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-11 05:39:39', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(109, 'PQQC13RU60K', 'Lê Nguyễn Ngọc Diệp', '', '2010-02-11', '', '', '', NULL, 'uploads/cf9f7c850da0850d48122a346227e4f4.jpg', 'Cấp 4 - Lam Đai IV', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-11 05:40:35', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, '', NULL, NULL),
(111, 'PQQ5FLGTZY1', 'Lưu Bảo Ngọc', '', '2013-06-11', '', '', '', NULL, 'uploads/06d9b3a3b833c964a6d8b20a4c363c3e.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-11 05:43:12', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(112, 'PQQC3HYG3FQ', 'Lưu Nguyễn Tường An', '', '2009-03-11', '', '', '', NULL, 'uploads/e3af0a175a597dcc86a2ae1bc97b6e7f.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-11 05:44:44', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(113, 'PQQBZ2BAV52', 'Lý Ngọc An', '', '2015-02-11', '', '', '', NULL, 'uploads/dd8dead7c8d0488c5c3aa1d03dd490f8.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-11 05:45:37', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(114, 'PQQABAMV20T', 'Lý Ngọc Hằng', '', '2016-02-11', '', '', '', NULL, 'uploads/1927f5673b02ca8b2c73f77cbdc7cd62.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-11 05:46:28', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(115, 'PQQMP2ROONM', 'Hà Văn Tiến', '', '2006-06-11', '', '', '', NULL, 'uploads/02c45ea293382b4a097419111bd5f77f.jfif', 'Nâu Đai', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-11 12:55:05', '0925276495', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(117, 'PQQQ30M6NNM', 'Lê Quang Chiến', '', '2012-10-13', '', '', '', NULL, 'uploads/edec56e85c604c3cca8a89762a133fff.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 01:35:02', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(119, 'PQQE1ERB7UV', 'Ngô Nhật Minh', '', '2015-06-13', '', '', '', NULL, 'uploads/31a60d57b31954e2d580f729a03748ee.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 02:24:47', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(120, 'PQQGDNXV6WK', 'Nguyễn Điền Minh Tùng', '', '2012-08-13', '', '', '', NULL, 'uploads/1f17819ed526420ca55d5d34f49094b9.jpg', 'Cấp 2 - Lam Đai II', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 02:26:52', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(121, 'PQQXU8IASUS', 'Nguyễn Hồng Ngọc', 'An Hậu Khả', '2010-05-13', '', '', '', NULL, 'uploads/93238817fd0e664acfe6137eedbc0b5e.jpg', 'Cấp 5 - Lục Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 02:27:57', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(122, 'PQQR0OQ8WJ2', 'Nguyễn Hồng Phát', '', '2014-07-13', '', '', '', NULL, 'uploads/15b7bbbf6113585722eaea4bbe5ec55a.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 02:29:12', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(123, 'PQQY3LKNWWH', 'Nguyễn Huỳnh Hải Đăng', '', '2017-10-13', '', '', '', NULL, 'uploads/b4963bc76c61c3365562bc6a9e1cb425.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 02:30:15', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(124, 'PQQCREAS3TJ', 'Nguyễn Huỳnh Khải My', '', '2015-08-13', '', '', '', NULL, 'uploads/a8f47272be67cffbb32d0e41c60ba307.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 02:33:26', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(125, 'PQQ6BK99HOS', 'Nguyễn Hưng', '', '2012-10-13', '', '', '', NULL, 'uploads/8c8d4a7b7035ac0c86eba1eee244450c.png', 'Cấp 2 - Lam Đai II', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 02:35:36', '0965252933', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(126, 'PQQKNZLDGKR', 'Nguyễn Lê Kim Phụng', '', '2012-09-13', '', '', '', NULL, 'uploads/6e8215a6a184cbb3f9f89671fbe1ee6b.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 02:36:29', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(127, 'PQQ3O61RTMV', 'Nguyễn Lê Phương Anh', '', '2015-09-13', '', '', '', NULL, 'uploads/ffd67276e48d66fafd1b6a880eae0b74.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 02:37:44', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(128, 'PQQRBSCMDWB', 'Lê Tuấn Dũng', '', '2014-09-13', '', '', '', NULL, 'uploads/51af7c7ace0e77eb1665253c77198bd6.jfif', 'Nâu Đai', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-13 02:39:11', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, '', NULL, NULL),
(129, 'PQQDUN37N13', 'Nguyễn Minh Khang', '', '2019-09-13', '', '', '', NULL, 'uploads/9d867ec81e541517b5523bf000ed53c2.jfif', 'Nâu Đai', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-13 02:43:50', '0386528325', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(130, 'PQQ38Y4OR6S', 'Nguyễn Gia Hân', '', '2020-09-13', '', '', '', NULL, 'uploads/1f4b9350fda2154d290a5487d470bd1b.jfif', 'Nâu Đai', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-13 02:44:45', '0386428325', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(131, 'PQQCXCPJLW6', 'Nguyễn Thị Hoài May', '', '2019-11-13', '', '', '', NULL, 'uploads/78b52cc2f98e6215fd43a05ca7dd00c2.jfif', 'Nâu Đai', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-13 02:48:13', '0386528325', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(132, 'PQQ7F1T84K4', 'Nguyễn Lê Thanh Hiên', '', '2019-06-13', '', '', '', NULL, 'uploads/3ae7ce0e339e5922d9d119c62ded96ff.jfif', 'Nâu Đai', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-13 02:51:12', '0908161064', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(133, 'PQQK7KKIY46', 'Nguyễn Ngọc Hải Yến', '', '2017-09-13', '', '', '', NULL, 'uploads/91cbcf397cd0f87d0bf575d05c559935.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 02:55:31', '', '', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(134, 'PQQHHXGMX3S', 'Nguyễn Ngọc Như Ý', '', '2012-09-13', '', '', '', NULL, 'uploads/e5bebec956596a32d102c2d474f5662a.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 02:56:52', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(135, 'PQQSY5K3KC1', 'Nguyễn Ngọc Tuyết Nhi', '', '2015-09-13', '', '', '', NULL, 'uploads/a3d95e605f91c3573c904556f06e38dd.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 02:57:54', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(136, 'PQQ1QL1N4FO', 'Nguyễn Thị Đặng', '', '2000-09-13', '', '', '', NULL, 'uploads/9c3841f53277e72c0592c2319fff8852.jpg', 'Cấp 5 - Lục Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 02:59:06', '0392155414', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(137, 'PQQHACE9RVT', 'Nguyễn Trần Minh Trí', '', '2013-09-13', '', '', '', NULL, 'uploads/4340abfe11222d2029f118e1cc7bd9ce.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:00:23', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(138, 'PQQ3BE65WJX', 'Nguyễn Tú Quỳnh', '', '2010-09-13', '', '', '', NULL, 'uploads/71ec9fcfc25b325668748214cf93cd07.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:01:11', '0903838954', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(139, 'PQQV799FXDH', 'Nguyễn Tuấn Anh', '', '2018-09-13', '', '', '', NULL, 'uploads/dd895e60f7b77649397a881702940b8d.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:02:05', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(140, 'PQQYEM90M9M', 'Nguyễn Văn Hùng', 'Trí Duy Ân', '1988-09-13', '', '', '', NULL, 'uploads/a7666ead96099fa961a7612b5c00a6bc.jpg', 'Cấp 8 - Lục Đai IV', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:03:04', '0399986965', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(141, 'PQQBE0E0W96', 'Phạm Lê Kim Quyên', '', '2013-09-13', '', '', '', NULL, 'uploads/7b61c7895c2646f5985d32ba5c0bd5fd.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:06:30', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(142, 'PQQAY7EG0Z3', 'Thái Huỳnh Tâm Thanh', 'Tĩnh Khánh Hậu', '2008-09-13', '', '', '', NULL, 'uploads/1d0916440f98f40ce30c593e93f696a6.jpg', 'Cấp 4 - Lam Đai IV', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:07:32', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(143, 'PQQ9OL8A7KC', 'Trần Bảo Duy', '', '2016-09-13', '', '', '', NULL, 'uploads/775a610d4b1952f52740d54564862ede.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:08:22', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(144, 'PQQ0KNOJUGC', 'Trần Nhật Anh', '', '2013-09-13', '', '', '', NULL, 'uploads/df60edfcd133b3f193702f270ac3a31e.jpg', '', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:09:26', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(145, 'PQQ30N21G6Y', 'Trần Thanh Ngọc Trâm', 'Phúc Khiêm Nhẫn', '2010-09-13', '', '', '', NULL, 'uploads/d1c96903f86a890a4826c4967fbdc302.png', 'Cấp 2 - Lam Đai II', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:10:29', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(146, 'PQQ0P86J2EN', 'Trần Thụy Hà Nhung', 'Hội Khả Nguyện', '2011-09-13', '', '', '', NULL, 'uploads/c6ddf814cc99cd3ff6dfe8f022e2dc61.png', 'Cấp 3 - Lam Đai III', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:12:01', '0916336413', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(147, 'PQQXX5EAUX2', 'Trần Tuấn Tú', '', '2011-09-13', '', '', '', NULL, 'uploads/262848d2f3daea7d5d2ef9f045d998c5.png', 'Cấp 3 - Lam Đai III', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:12:54', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(148, 'PQQPM2QLLKU', 'Võ Văn Tài', '', '2013-09-13', '', '', '', NULL, 'uploads/45d6c784b11b8f5383c665f231dbd5d1.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:14:08', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(149, 'PQQ2PJVOUJL', 'Lê Quang Nhật', '', '2009-09-13', '', '', '', NULL, 'uploads/d523d562c40d649b344a6334255d92f4.jpg', 'Cấp 3 - Lam Đai III', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:14:53', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(150, 'PQQIXBHTRTX', 'Nguyễn Hồ Phú Kim', '', '2006-09-13', '', '', '', NULL, 'uploads/169e020e571b473dd9fbdfd2e10f967b.jpg', 'Cấp 9 - Hồng đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:15:48', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(151, 'PQQLNTHBBCY', 'Huỳnh Thanh An', '', '2001-09-13', '', '', '', NULL, 'uploads/bd8b6914b3f70cc55969bb264378ed7f.jpg', 'Cấp 12 - Hồng đai IV', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:17:25', '0332797045', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(152, 'PQQERSW5G9J', 'Huỳnh Đức Hùng', '', '2000-09-13', '', '', '', NULL, 'uploads/3b26f62ac9ab067ba32496f7be501da7.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:18:36', '0969426063', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(153, 'PQQJ9JA6AXL', 'Tạ Đông Minh Anh', '', '2007-09-13', '', '', '', NULL, 'uploads/00cb71f78459de8aa356cf447bcde291.jpg', 'Cấp 9 - Hồng đai thiếu niên I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:19:34', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(154, 'PQQTKG023FG', 'Ngô Tín', '', '1987-09-13', '', '', '', NULL, 'uploads/d37b92d978133b684e70574c1b6494b2.jpg', 'Cấp 3 - Lam Đai III', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:20:33', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(155, 'PQQCVZX0NNW', 'Lê Thanh Vĩnh', '', '1981-09-13', '', '', '', NULL, 'uploads/b7a8f1c507834db33608e7463bd7a423.jpg', 'Cấp 3 - Lam Đai III', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:21:42', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, '', NULL, NULL),
(156, 'PQQW7FG8T2A', 'Nguyễn Thị Thanh Tuyền', '', '2009-09-13', '', '', '', NULL, 'uploads/1b48e404ee92e47d695f2782e2ce935a.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:22:47', '093375737', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(157, 'PQQG9PRT6LK', 'Nguyễn Huỳnh Quang Khải', '', '2017-09-13', '', '', '', NULL, 'uploads/ffdc5a99d47caf6febac380a9c20aa30.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:23:39', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(158, 'PQQ4IHSCNII', 'Nguyễn Huỳnh Trí Danh', '', '2013-09-13', '', '', '', NULL, 'uploads/499126b7bda2a6e50972af7327c60d36.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:24:27', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(159, 'PQQ7DCF6RJD', 'Hoàng Liêm Khiết', '', '2015-09-13', '', '', '', NULL, 'uploads/553d91fcd33803526b589aea499c4a1c.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:25:15', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(160, 'PQQF1JBT1YK', 'Trần Hoàng Minh', '', '2006-09-13', '', '', '', NULL, 'uploads/fec550206610b106039d5e79713db4ef.jpg', 'Cấp 11 - Hồng đai III', '', NULL, NULL, 'CLB Nguyễn Trãi', 'Chưa Nhập Môn', '2025-09-13 03:26:00', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(161, 'PQQ6Z8TIV2N', 'Đặng Quang An', '', '2015-09-13', '', '', '', NULL, 'uploads/4182f1a1997b3caf9cf33e21f77c67ed.png', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:13:01', '', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(162, 'PQQDG1LIC48', 'Lê Nguyễn Hoàng Bách', '', '2012-09-13', '', '', '', NULL, 'uploads/31e1b67d085b3e26a37bc73e15b0e153.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:15:11', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(163, 'PQQUYUFY8FV', 'Phan Hải Đăng', '', '2012-09-13', '', '', '', NULL, 'uploads/eeee59d5b6283c5fea46a233bac44b06.jpg', 'Cấp 3 - Lam Đai III', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:16:30', '0355595912', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(164, 'PQQCNI2NL5R', 'Phạm Thành Danh', '', '2013-09-13', '', '', '', NULL, 'uploads/d7dd2ec1d10952e556f930d61baa651d.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:17:26', '0978846317', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, '', NULL, NULL),
(165, 'PQQK26NYQPT', 'Lê Đình Hoàng Dũng', '', '2013-09-13', '', '', '', NULL, 'uploads/ac302a23203055607cd953729f4a1e3a.jpg', 'Cấp 2 - Lam Đai II', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:18:42', '', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(166, 'PQQ8F0I0HVK', 'Lê Nguyễn Gia Huy', '', '2010-09-13', '', '', '', NULL, 'uploads/735abd9a8d9772e9c7826e3ddcab23f7.jpg', 'Cấp 2 - Lam Đai II', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:22:17', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(167, 'PQQVURG204U', 'Lưu Gia Huy', '', '2012-09-13', '', '', '', NULL, 'uploads/a7af75cbf189e000e56757dfe01ea80a.jpg', 'Cấp 4 - Lam Đai IV', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:23:13', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(168, 'PQQ3M7DC0NR', 'Phan Hà My', '', '2013-09-13', '', '', '', NULL, 'uploads/4487412fb2c1a7f9e80cda6fc0287d95.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:25:31', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(169, 'PQQY02OVX5K', 'Ngô Minh Khang', '', '2018-09-13', '', '', '', NULL, 'uploads/84fe9963f2577b84f4dc0bf636f72312.jpg', 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:26:18', '', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(170, 'PQQD29H0PUP', 'Đặng Quang Nhân', 'Đồng An Hy', '2013-09-13', '', '', '', NULL, 'uploads/86eb983b7c4c85450fc2542bf866bdd7.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:27:05', '0917111418', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(171, 'PQQR0WSDK5E', 'Vũ Gia Khang', '', '2025-09-13', '', '', '', NULL, NULL, 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:27:34', '', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(172, 'PQQQJM74Y7Y', 'Nguyễn Đức Phát', '', '2012-09-13', '', '', '', NULL, 'uploads/becc6cad3d4bc387bfd97fcf1f9bd6c4.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:28:24', '0367057167', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(173, 'PQQHBMU6K47', 'Ngô Anh Khôi', '', '2016-09-13', '', '', '', NULL, NULL, 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:29:19', '0989616470', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(174, 'PQQ06T13V86', 'Trương Đình Sơn', '', '2008-09-13', '', '', '', NULL, 'uploads/cb8b825426872d7c7d5626e8198c9f9a.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:32:14', '0327205334', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(175, 'PQQX8BUCWQX', 'Tô Ngọc Quỳnh Mai', '', '2011-09-13', '', '', '', NULL, NULL, 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:32:57', '0947444570', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(176, 'PQQQU3IJENZ', 'Trịnh Hoàng Tiến', '', '2012-09-13', '', '', '', NULL, 'uploads/2071a8e9d17d98ed54059bb30767287f.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:35:56', '', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(177, 'PQQSV93MB90', 'Nguyễn Ngọc Thanh Nhã', '', '2015-09-13', '', '', '', NULL, NULL, 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 09:48:36', '0947117647', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(178, 'PQQOZ8KDACC', 'Đinh Thanh Bình', '', '2019-06-13', '', '', '', NULL, 'uploads/51e0bf61390cb0934e4042467a1aedfa.png', 'Nâu Đai', '', NULL, NULL, 'CLB Trần Đại Nghĩa', 'Chưa Nhập Môn', '2025-09-13 12:38:31', '0938029174', 'Thầy Thích Pháp Tánh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(180, 'PQQGOXFDOG6', 'Nguyễn Việt Tùng', 'Định Nghĩa Đức', '2011-09-13', '', '', '', NULL, 'uploads/a42dcd5494f3bbb7a321defc4b45d4d5.jpg', '', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 12:57:04', '0984207089', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(181, 'PQQBVTGC83N', 'Bùi Thảo Uyên', '', '2013-09-13', '', '', '', NULL, 'uploads/a8ed4c6af34d28294ddcaa769e6085b9.jpg', 'Cấp 2 - Lam Đai II', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 13:01:01', '0367553263', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(182, 'PQQYRVS81OV', 'Bùi Bảo Vy', '', '2015-11-13', '', '', '', NULL, 'uploads/0a9c50f733e7b8ed4f819d43c93684ca.jpg', 'Cấp 1 - Lam Đai I', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-13 15:25:15', '', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nữ', NULL, NULL),
(186, 'PQQWQ59RXTI', 'Nguyễn Tấn Phát', '', '2013-09-15', '', '', '', NULL, NULL, 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-15 01:32:05', '', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(187, 'PQQ7JMGEB9M', 'Nguyễn Tấn Phát', '', '2013-09-15', '', '', '', NULL, NULL, 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-15 01:32:05', '', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nam', NULL, NULL),
(188, 'PQQ1PFDL2B2', 'Nguyễn Tấn Phát', '', '2013-09-15', '', '', '', NULL, NULL, 'Nâu Đai', '', NULL, NULL, 'CLB Nguyễn Bỉnh Khiêm', 'Chưa Nhập Môn', '2025-09-15 01:32:05', '', 'Thầy Thích Pháp Tịnh', '', 0, 0, NULL, 'Nam', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_exercises`
--

CREATE TABLE `student_exercises` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `student_exercises`
--

INSERT INTO `student_exercises` (`id`, `student_id`, `exercise_id`, `is_completed`, `completed_at`) VALUES
(3, 85, 31, 1, '2025-09-15 04:28:31'),
(4, 85, 32, 1, '2025-09-15 04:28:31'),
(159, 105, 142, 1, '2025-09-22 15:52:45'),
(160, 105, 138, 1, '2025-09-22 15:52:45'),
(161, 105, 141, 1, '2025-09-22 15:52:45'),
(162, 105, 140, 1, '2025-09-22 15:52:45'),
(193, 99, 138, 1, '2025-09-23 01:41:12'),
(194, 99, 143, 1, '2025-09-23 01:41:12'),
(195, 99, 144, 1, '2025-09-23 01:41:12'),
(196, 99, 145, 1, '2025-09-23 01:41:12'),
(197, 99, 146, 1, '2025-09-23 01:41:12'),
(198, 99, 141, 1, '2025-09-23 01:41:12'),
(254, 71, 39, 1, '2025-09-23 09:39:35'),
(255, 71, 40, 1, '2025-09-23 09:39:35'),
(256, 71, 28, 1, '2025-09-23 09:39:35'),
(257, 71, 41, 1, '2025-09-23 09:39:35'),
(258, 71, 24, 1, '2025-09-23 09:39:35'),
(259, 71, 33, 1, '2025-09-23 09:39:35'),
(292, 181, 78, 1, '2025-09-24 01:54:55'),
(293, 181, 74, 1, '2025-09-24 01:54:55'),
(294, 181, 81, 1, '2025-09-24 01:54:55'),
(295, 181, 77, 1, '2025-09-24 01:54:55'),
(296, 181, 57, 1, '2025-09-24 01:54:55'),
(297, 181, 58, 1, '2025-09-24 01:54:55'),
(298, 181, 59, 1, '2025-09-24 01:54:55'),
(299, 181, 60, 1, '2025-09-24 01:54:55'),
(300, 181, 61, 1, '2025-09-24 01:54:55'),
(301, 181, 29, 1, '2025-09-24 01:54:55'),
(332, 96, 106, 1, '2025-09-24 01:55:20'),
(333, 96, 109, 1, '2025-09-24 01:55:20'),
(334, 96, 105, 1, '2025-09-24 01:55:20'),
(335, 96, 107, 1, '2025-09-24 01:55:20'),
(336, 96, 30, 1, '2025-09-24 01:55:20'),
(337, 96, 99, 1, '2025-09-24 01:55:20'),
(338, 96, 67, 1, '2025-09-24 01:55:20'),
(379, 72, 39, 1, '2025-09-24 02:11:55'),
(380, 72, 40, 1, '2025-09-24 02:11:55'),
(381, 72, 28, 1, '2025-09-24 02:11:55'),
(382, 72, 41, 1, '2025-09-24 02:11:55'),
(383, 72, 24, 1, '2025-09-24 02:11:55'),
(384, 72, 33, 1, '2025-09-24 02:11:55'),
(385, 72, 34, 1, '2025-09-24 02:11:55'),
(386, 72, 35, 1, '2025-09-24 02:11:55'),
(387, 72, 36, 1, '2025-09-24 02:11:55'),
(388, 72, 37, 1, '2025-09-24 02:11:55'),
(391, 182, 84, 1, '2025-09-24 02:20:49'),
(392, 182, 51, 1, '2025-09-24 02:20:49'),
(393, 182, 43, 1, '2025-09-24 02:20:49'),
(394, 182, 52, 1, '2025-09-24 02:20:49'),
(395, 182, 48, 1, '2025-09-24 02:20:49'),
(396, 182, 85, 1, '2025-09-24 02:20:49'),
(397, 182, 86, 1, '2025-09-24 02:20:49'),
(398, 182, 87, 1, '2025-09-24 02:20:49'),
(399, 182, 88, 1, '2025-09-24 02:20:49'),
(400, 182, 89, 1, '2025-09-24 02:20:49'),
(401, 182, 44, 1, '2025-09-24 02:20:49'),
(402, 182, 45, 1, '2025-09-24 02:20:49'),
(403, 182, 46, 1, '2025-09-24 02:20:49'),
(404, 182, 47, 1, '2025-09-24 02:20:49'),
(405, 182, 42, 1, '2025-09-24 02:20:49');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_student_code` (`student_code`);

--
-- Chỉ mục cho bảng `student_exercises`
--
ALTER TABLE `student_exercises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`,`exercise_id`),
  ADD KEY `exercise_id` (`exercise_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT cho bảng `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT cho bảng `student_exercises`
--
ALTER TABLE `student_exercises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=406;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `student_exercises`
--
ALTER TABLE `student_exercises`
  ADD CONSTRAINT `student_exercises_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_exercises_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
