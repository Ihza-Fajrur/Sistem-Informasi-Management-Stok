-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 16, 2022 at 05:28 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sokou_lampung`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `acc_type` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_photo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`username`, `password`, `acc_type`, `email`, `user_photo`) VALUES
('admin', 'admin1234', 'Admin', 'admin@gmail.com', NULL),
('HRFI', '1', 'Staff', 'admin@gmail.com', './static/profile_picture/Ihza.jpg'),
('Ihza', '1', 'Staff', 'ihzafrh@gmai.com', NULL),
('user', 'user', 'Staff', 'user@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bahan_cutting`
--

CREATE TABLE `bahan_cutting` (
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jenis_barang` varchar(50) NOT NULL,
  `warna` varchar(15) NOT NULL,
  `ukuran_panjang` int(5) NOT NULL,
  `ukuran_lebar` int(5) NOT NULL,
  `harga_satuan` int(9) NOT NULL,
  `total_harga` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bahan_cutting`
--

INSERT INTO `bahan_cutting` (`kode_barang`, `nama_barang`, `jenis_barang`, `warna`, `ukuran_panjang`, `ukuran_lebar`, `harga_satuan`, `total_harga`) VALUES
('AAAA', 'Dummy', 'Kain', 'Putih', 11, 12, 100, 13200),
('asvwf3', 'Polimer', 'Foil', 'Putih', 19, 29, 40, 24000),
('FBOR', 'FLOCK', 'BLUDRU', 'ORANGE', 50, 59, 2300, 6900000),
('FBPU', 'FLOCK', 'BLUDRU', 'PUTIH', 25, 33, 2300, 1897500),
('FLRW', 'POLYFLEX', 'FOIL', 'RAINBOW', 50, 76, 1200, 4560000),
('KOPA', 'KERTAS', 'OPAQU', 'POLOS', 8, 1, 18000, 144000),
('PUAM', 'POLYFLEX', 'PU', 'ABU MUDA', 40, 25, 1000, 1000000),
('PUBM', 'POLYFLEX', 'PU', 'BIRU MUDA', 35, 35, 1000, 1225000),
('PUGO', 'POLYFLEX', 'PU', 'GOLD', 50, 76, 1000, 3800000),
('PUHI', 'POLYFLEX', 'PU', 'HITAM', 50, 97, 1000, 4850000),
('PUHM', 'POLYFLEX', 'PU', 'HIJAU MUDA', 50, 50, 1000, 2500000),
('PUKU', 'POLYFLEX', 'PU', 'KUNING', 50, 100, 1000, 5000000),
('PUME', 'POLYFLEX', 'PU', 'MERAH', 50, 87, 1000, 4350000),
('PUMO', 'POLYFLEX', 'PU', 'MOCCA', 39, 78, 1000, 3042000),
('PUPU', 'POLYFLEX', 'PU', 'PUTIH', 55, 28, 1000, 1540000),
('PUUN', 'POLYFLEX', 'PU', 'UNGU', 40, 28, 1000, 1120000),
('PUVY', 'POLYFLEX', 'PU', 'VIVID YELLOW', 50, 96, 1000, 4800000),
('PVBM', 'POLYFLEX', 'PVC', 'BIRU MUDA', 37, 33, 800, 976800),
('PVHI', 'POLYFLEX', 'PVC', 'HITAM', 30, 44, 800, 1056000),
('PVHT', 'POLYFLEX', 'PVC', 'HIJAU TUA', 50, 45, 800, 1800000),
('PVME', 'POLYFLEX', 'PVC', 'MERAH', 50, 75, 800, 3000000),
('PVOM', 'POLYFLEX', 'PVC', 'ORANGE MUDA', 30, 39, 800, 936000),
('PVPI', 'POLYFLEX', 'PVC', 'PINK', 50, 89, 800, 3560000),
('RLS', 'POLYFLEX', 'REFLECTIVE', 'SILVER', 45, 39, 2000, 3510000);

-- --------------------------------------------------------

--
-- Table structure for table `kaos_original`
--

CREATE TABLE `kaos_original` (
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `size` varchar(10) NOT NULL,
  `bentuk_lengan` varchar(15) NOT NULL,
  `desain` varchar(20) NOT NULL,
  `warna` varchar(15) NOT NULL,
  `jumlah_stok` int(5) NOT NULL,
  `harga_satuan` int(15) NOT NULL,
  `total_harga` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kaos_original`
--

INSERT INTO `kaos_original` (`kode_barang`, `nama_barang`, `size`, `bentuk_lengan`, `desain`, `warna`, `jumlah_stok`, `harga_satuan`, `total_harga`) VALUES
('BB1G2H', 'KAOS ORI', 'XL', 'PENDEK', 'BBI', 'HITAM', 5, 250000, 1250000),
('OR1C2H', 'KAOS ORI', 'S', 'PENDEK', 'ORIGINAL 1', 'HITAM', 7, 135000, 945000),
('OR1D1P', 'KAOS ORI', 'M', 'PANJANG', 'ORIGINAL 1', 'PUTIH', 10, 145000, 1450000),
('OR1E1P', 'KAOS ORI', 'ML', 'PANJANG', 'ORIGINAL 1', 'PUTIH', 5, 145000, 725000),
('OR1F2P', 'KAOS ORI', 'L', 'PENDEK', 'ORIGINAL 1', 'PUTIH', 10, 135000, 1350000);

-- --------------------------------------------------------

--
-- Table structure for table `kaos_polos`
--

CREATE TABLE `kaos_polos` (
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `size` varchar(10) NOT NULL,
  `jenis_kain` varchar(100) NOT NULL,
  `bentuk_lengan` varchar(15) NOT NULL,
  `bentuk_lingkar_leher` varchar(15) NOT NULL,
  `warna` varchar(15) NOT NULL,
  `jumlah_stok` int(5) NOT NULL,
  `harga_satuan` int(15) NOT NULL,
  `total_harga` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kaos_polos`
--

INSERT INTO `kaos_polos` (`kode_barang`, `nama_barang`, `size`, `jenis_kain`, `bentuk_lengan`, `bentuk_lingkar_leher`, `warna`, `jumlah_stok`, `harga_satuan`, `total_harga`) VALUES
('AF2FHI', 'KAOS ALS', 'L', 'CATTON TC30S', 'PENDEK', 'O NECK', 'HITAM', 5, 70000, 350000),
('AK2CHL', 'KAOS RMS', 'S', 'COTTON KOZE', 'PENDEK', 'O NECK', 'HIJAU LUMUT', 5, 75000, 375000),
('AK2CKK', 'KAOS RMS', 'S', 'COTTON KOZE', 'PENDEK', 'O NECK', 'KUNING KENARI', 5, 75000, 375000),
('AK2DBD', 'KAOS RMS', 'M', 'COTTON KOZE', 'PENDEK', 'O NECK', 'BIRU DONGKER', 5, 75000, 375000),
('AK2DOR', 'KAOS RMS', 'M', 'COTTON KOZE', 'PENDEK', 'O NECK', 'ORANGE', 5, 75000, 375000),
('AK2FPU', 'KAOS RMS', 'L ', 'COTTON KOZE', 'PENDEK', 'O NECK', 'PUTIH', 5, 75000, 375000),
('AK2GHI', 'KAOS RMS', 'XL', 'COTTON KOZE', 'PENDEK', 'O NECK', 'HITAM', 5, 75000, 375000),
('AP2DKK', 'POLO ALS', 'M', 'COTTON VISCOSE PIQUE', 'PENDEK', 'BERKERAH', 'KUNING KENARI', 10, 85000, 850000),
('AP2FBD', 'POLO ALS', 'L', 'COTTON VISCOSE PIQUE', 'PENDEK', 'BERKERAH', 'BIRU DONGKER', 10, 85000, 850000),
('AP2HBB', 'POLO ALS', 'XXL', 'COTTON VISCOSE PIQUE', 'PENDEK', 'BERKERAH', 'BIRU BENHUR', 10, 85000, 850000),
('AR3FHI', 'REGLAN ALS', 'L', 'COTTON COMBED 20S', '3/4', 'O NECK', 'HITAM', 0, 90000, 0),
('AT1DHI', 'TUNIK ALS', 'M', 'COTTON SPANDEX', 'PANJANG', 'O NECK', 'HITAM', 10, 90000, 900000),
('AT1FHI', 'TUNIK ALS', 'L', 'COTTON SPANDEX', 'PANJANG', 'O NECK', 'HITAM', 10, 90000, 900000),
('AT1GHI', 'TUNIK ALS', 'XL', 'COTTON SPANDEX', 'PANJANG', 'O NECK', 'HITAM', 10, 90000, 900000),
('AV1CHI', 'KAOS ALS', 'S', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV1CPU', 'KAOS ALS', 'S', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'PUTIH', 20, 70000, 1400000),
('AV1DHA', 'KAOS ALS', 'M', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'HIJAU ARMY', 5, 70000, 350000),
('AV1DHI', 'KAOS ALS', 'M', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV1DKK', 'KAOS ALS', 'M ', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'KUNING KENARI', 5, 70000, 350000),
('AV1DPU', 'KAOS ALS', 'M', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'PUTIH', 20, 70000, 1400000),
('AV1EHI', 'KAOS ALS', 'ML', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV1EHS', 'KAOS ALS', 'ML ', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'HIJAU STABILO', 5, 70000, 350000),
('AV1EMM', 'KAOS ALS', 'ML ', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'MERAH MAROON', 5, 70000, 350000),
('AV1EPM', 'KAOS ALS', 'ML ', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'PINK MAGENTA', 5, 70000, 350000),
('AV1EPU', 'KAOS ALS', 'ML', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'PUTIH', 20, 70000, 1400000),
('AV1FHI', 'KAOS ALS', 'L', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV1FKK', 'KAOS ALS', 'L', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'KUNING KENARI', 5, 70000, 350000),
('AV1FMM', 'HOODIE ALS', 'L ', 'COTTON FLEECE', 'PANJANG', 'JUMPER', 'MERAH MAROON', 10, 95000, 950000),
('AV1FPM', 'KAOS ALS', 'L', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'PINK MAGENTA', 5, 70000, 350000),
('AV1FPU', 'KAOS ALS', 'L', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'PUTIH', 20, 70000, 1400000),
('AV1GAMt', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'ABU MISTY TUA', 5, 70000, 350000),
('AV1GBD', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'BIRU DONGKER', 5, 70000, 350000),
('AV1GHI', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV1GKK', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'KUNING KENARI', 5, 70000, 350000),
('AV1GMT', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'MERAH TERANG', 5, 70000, 350000),
('AV1GPM', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'PINK MAGENTA', 5, 70000, 350000),
('AV1GPU', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'PUTIH', 20, 70000, 1400000),
('AV1HAMm', 'KAOS ALS', 'XXL', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'ABU MISTY MUDA', 5, 70000, 350000),
('AV1HAMt', 'KAOS ALS', 'XXL ', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'ABU MISTY TUA', 5, 70000, 350000),
('AV1HHI', 'KAOS ALS', 'XXL', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV1HPU', 'KAOS ALS', 'XXL', 'COTTON COMBED 20S', 'PANJANG', 'O NECK', 'PUTIH', 20, 70000, 1400000),
('AV2AHI', 'KAOS ALS', '1', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV2APU', 'KAOS ALS', '1', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'PUTIH', 10, 70000, 700000),
('AV2BBT', 'KAOS ALS', '2', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'BIRU TOSKA', 5, 70000, 350000),
('AV2BHI', 'KAOS ALS', '2', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV2BPU', 'KAOS ALS', '2', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'PUTIH', 10, 70000, 700000),
('AV2CAG', 'KAOS ALS', 'S', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'ABU GELAP', 5, 70000, 350000),
('AV2CBD', 'KAOS ALS', 'S', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'BIRU DONGKER', 5, 70000, 350000),
('AV2CBTt', 'KAOS ALS', 'S', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'BIRU TURKISH TU', 5, 70000, 350000),
('AV2CHI', 'KAOS ALS', 'S', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV2CHN', 'KAOS ALS', 'S', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'HIJAU NAVY', 5, 70000, 350000),
('AV2CKB', 'KAOS ALS', 'S', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'KUNING BABY', 5, 70000, 350000),
('AV2CMM', 'KAOS ALS', 'S', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'MERAH MAROON', 5, 70000, 350000),
('AV2COR', 'KAOS ALS', 'S', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'ORANGE', 5, 70000, 350000),
('AV2CPU', 'KAOS ALS', 'S', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'PUTIH', 10, 70000, 700000),
('AV2DBB', 'KAOS ALS', 'M', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'BIRU BENHUR', 5, 70000, 350000),
('AV2DHI', 'KAOS ALS', 'M', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV2DMC', 'KAOS ALS', 'M', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'MERAH CABE', 5, 70000, 350000),
('AV2DMT', 'KAOS ALS', 'M', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'MERAH TERANG', 5, 70000, 350000),
('AV2DPU', 'KAOS ALS', 'M', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'PUTIH', 10, 70000, 700000),
('AV2EAG', 'KAOS ALS', 'ML', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'ABU GELAP', 5, 70000, 350000),
('AV2EHI', 'KAOS ALS', 'ML', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV2EPU', 'KAOS ALS', 'ML', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'PUTIH', 10, 70000, 700000),
('AV2FBD', 'KAOS ALS', 'L', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'BIRU DONGKER', 5, 70000, 350000),
('AV2FBT', 'KAOS ALS', 'L ', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'BIRU TOSKA', 5, 70000, 350000),
('AV2FCK', 'KAOS ALS', 'L', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'COKLAT KOPI', 5, 70000, 350000),
('AV2FCT', 'KAOS ALS', 'L', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'COKLAT TUA', 5, 70000, 350000),
('AV2FHI', 'KAOS ALS', 'L', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV2FKK', 'KAOS ALS', 'L ', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'KUNING KENARI', 5, 70000, 350000),
('AV2FMM', 'KAOS ALS', 'L', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'MERAH MAROON', 5, 70000, 350000),
('AV2FMT', 'KAOS ALS', 'L ', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'MERAH TERANG', 5, 70000, 350000),
('AV2FPU', 'KAOS ALS', 'L', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'PUTIH', 10, 70000, 700000),
('AV2GBD', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'BIRU DONGKER', 5, 70000, 350000),
('AV2GBT', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'BIRU TOSKA', 5, 70000, 350000),
('AV2GHI', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV2GHN', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'HIJAU NAVY', 5, 70000, 350000),
('AV2GHS', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'HIJAU STABILO', 5, 70000, 350000),
('AV2GMM', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'MERAH MAROON', 5, 70000, 350000),
('AV2GPB', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'PINK BABY', 5, 70000, 350000),
('AV2GPU', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'PUTIH', 10, 70000, 700000),
('AV2HAMm', 'KAOS ALS', 'XXL', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'ABU MISTY MUDA', 5, 70000, 350000),
('AV2HHI', 'KAOS ALS', 'XXL', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV2HPU', 'KAOS ALS', 'XXL', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'PUTIH', 10, 70000, 700000),
('AV2IHI', 'KAOS ALS', 'XXXL', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV2IPU', 'KAOS ALS', 'XXXL', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'PUTIH', 10, 70000, 700000),
('AV2JHI', 'KAOS ALS', '0', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'HITAM', 10, 70000, 700000),
('AV2JKK', 'KAOS ALS', '0', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'KUNING KENARI', 5, 70000, 350000),
('AV2JPU', 'KAOS ALS', '0', 'COTTON COMBED 20S', 'PENDEK', 'O NECK', 'PUTIH', 10, 70000, 700000),
('AV4GBB', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PANJANG MANSET', 'O NECK', 'BIRU BABY', 5, 70000, 350000),
('AVn2GHI', 'KAOS ALS', 'XL', 'COTTON COMBED 20S', 'PENDEK', 'V NECK', 'HITAM', 5, 70000, 350000),
('AX1DHI', 'SWEATER ALS', 'M', 'COTTON FLEECE', 'PANJANG', 'OBLONG', 'HITAM', 10, 95000, 950000),
('AZ1GHI', 'HOODIE ALS', 'XL', 'COTTON FLEECE', 'PANJANG', 'JUMPER', 'HITAM', 10, 95000, 950000),
('AZ1HHI', 'HOODIE ALS', 'XXL', 'COTTON FLEECE', 'PANJANG', 'JUMPER', 'HITAM', 10, 95000, 950000),
('GS1CHI', 'KAOS GM', 'S', 'COTTON COMBED 24S', 'PANJANG', 'O NECK', 'HITAM', 5, 75000, 375000),
('GS1DBD', 'KAOS GM', 'M', 'COTTON COMBED 24S', 'PANJANG', 'O NECK', 'BIRU DONGKER', 5, 75000, 375000),
('GS1FBD', 'KAOS GM', 'L', 'COTTON COMBED 24S', 'PANJANG', 'O NECK', 'BIRU DONGKER', 5, 75000, 375000),
('GS1FHI', 'KAOS GM', 'L', 'COTTON COMBED 24S', 'PANJANG', 'O NECK', 'HITAM', 5, 75000, 375000),
('GS2DBD', 'KAOS GM', 'M', 'COTTON COMBED 24S', 'PENDEK', 'O NECK', 'BIRU DONGKER', 5, 75000, 375000),
('GS2FBD', 'KAOS GM', 'L', 'COTTON COMBED 24S', 'PENDEK', 'O NECK', 'BIRU DONGKER', 5, 75000, 375000),
('GS2FHI', 'KAOS GM', 'L', 'COTTON COMBED 24S', 'PENDEK', 'O NECK', 'HITAM', 5, 75000, 375000),
('GS2GBD', 'KAOS GM', 'XL', 'COTTON COMBED 24S', 'PENDEK', 'O NECK', 'BIRU DONGKER', 5, 75000, 375000),
('GS2GHI', 'KAOS GM', 'XL', 'COTTON COMBED 24S', 'PENDEK', 'O NECK', 'HITAM', 5, 75000, 375000),
('GS2NBD', 'KAOS GM', '6', 'COTTON COMBED 24S', 'PENDEK', 'O NECK', 'BIRU DONGKER', 5, 75000, 375000);

-- --------------------------------------------------------

--
-- Table structure for table `record_penjualan_tahunan`
--

CREATE TABLE `record_penjualan_tahunan` (
  `bulan` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `record_penjualan_tahunan`
--

INSERT INTO `record_penjualan_tahunan` (`bulan`, `value`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 6),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 6),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_tracking_bc`
--

CREATE TABLE `sales_tracking_bc` (
  `kode_barang` varchar(10) NOT NULL,
  `jumlah_pembelian` int(10) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_tracking_bc`
--

INSERT INTO `sales_tracking_bc` (`kode_barang`, `jumlah_pembelian`, `bulan`, `tahun`, `id`) VALUES
('AAAA', 0, '05', '2022', 'AAAA-05-2022'),
('asvwf3', 0, '05', '2022', 'asvwf3-05-2022'),
('FBOR', 50, '05', '2022', 'FBOR-05-2022'),
('FBPU', 0, '05', '2022', 'FBPU-05-2022'),
('FLRW', 0, '05', '2022', 'FLRW-05-2022'),
('KOPA', 0, '05', '2022', 'KOPA-05-2022'),
('PUAM', 0, '05', '2022', 'PUAM-05-2022'),
('PUBM', 0, '05', '2022', 'PUBM-05-2022'),
('PUGO', 0, '05', '2022', 'PUGO-05-2022'),
('PUHI', 0, '05', '2022', 'PUHI-05-2022'),
('PUHM', 0, '05', '2022', 'PUHM-05-2022'),
('PUKU', 0, '05', '2022', 'PUKU-05-2022'),
('PUME', 0, '05', '2022', 'PUME-05-2022'),
('PUMO', 0, '05', '2022', 'PUMO-05-2022'),
('PUPU', 0, '05', '2022', 'PUPU-05-2022'),
('PUUN', 0, '05', '2022', 'PUUN-05-2022'),
('PUVY', 0, '05', '2022', 'PUVY-05-2022'),
('PVBM', 0, '05', '2022', 'PVBM-05-2022'),
('PVHI', 0, '05', '2022', 'PVHI-05-2022'),
('PVHT', 0, '05', '2022', 'PVHT-05-2022'),
('PVME', 0, '05', '2022', 'PVME-05-2022'),
('PVOM', 0, '05', '2022', 'PVOM-05-2022'),
('PVPI', 0, '05', '2022', 'PVPI-05-2022'),
('RLS', 0, '05', '2022', 'RLS-05-2022');

-- --------------------------------------------------------

--
-- Table structure for table `sales_tracking_ko`
--

CREATE TABLE `sales_tracking_ko` (
  `kode_barang` varchar(10) NOT NULL,
  `jumlah_pembelian` int(10) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_tracking_ko`
--

INSERT INTO `sales_tracking_ko` (`kode_barang`, `jumlah_pembelian`, `bulan`, `tahun`, `id`) VALUES
('BB1G2H', 1, '05', '2022', 'BB1G2H-05-2022'),
('OR1C2H', 0, '05', '2022', 'OR1C2H-05-2022'),
('OR1D1P', 0, '05', '2022', 'OR1D1P-05-2022'),
('OR1E1P', 0, '05', '2022', 'OR1E1P-05-2022'),
('OR1F2P', 0, '05', '2022', 'OR1F2P-05-2022');

-- --------------------------------------------------------

--
-- Table structure for table `sales_tracking_kp`
--

CREATE TABLE `sales_tracking_kp` (
  `kode_barang` varchar(10) NOT NULL,
  `jumlah_pembelian` int(10) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_tracking_kp`
--

INSERT INTO `sales_tracking_kp` (`kode_barang`, `jumlah_pembelian`, `bulan`, `tahun`, `id`) VALUES
('AF2FHI', 3, '05', '2022', 'AF2FHI-05-2022'),
('AK2CHL', 0, '05', '2022', 'AK2CHL-05-2022'),
('AK2CKK', 0, '05', '2022', 'AK2CKK-05-2022'),
('AK2DBD', 0, '05', '2022', 'AK2DBD-05-2022'),
('AK2DOR', 0, '05', '2022', 'AK2DOR-05-2022'),
('AK2FPU', 0, '05', '2022', 'AK2FPU-05-2022'),
('AK2GHI', 0, '05', '2022', 'AK2GHI-05-2022'),
('AP2DKK', 0, '05', '2022', 'AP2DKK-05-2022'),
('AP2FBD', 0, '05', '2022', 'AP2FBD-05-2022'),
('AP2HBB', 0, '05', '2022', 'AP2HBB-05-2022'),
('AR3FHI', 2, '05', '2022', 'AR3FHI-05-2022'),
('AT1DHI', 0, '05', '2022', 'AT1DHI-05-2022'),
('AT1FHI', 0, '05', '2022', 'AT1FHI-05-2022'),
('AT1GHI', 0, '05', '2022', 'AT1GHI-05-2022'),
('AV1CHI', 0, '05', '2022', 'AV1CHI-05-2022'),
('AV1CPU', 0, '05', '2022', 'AV1CPU-05-2022'),
('AV1DHA', 0, '05', '2022', 'AV1DHA-05-2022'),
('AV1DHI', 0, '05', '2022', 'AV1DHI-05-2022'),
('AV1DKK', 0, '05', '2022', 'AV1DKK-05-2022'),
('AV1DPU', 0, '05', '2022', 'AV1DPU-05-2022'),
('AV1EHI', 0, '05', '2022', 'AV1EHI-05-2022'),
('AV1EHS', 0, '05', '2022', 'AV1EHS-05-2022'),
('AV1EMM', 0, '05', '2022', 'AV1EMM-05-2022'),
('AV1EPM', 0, '05', '2022', 'AV1EPM-05-2022'),
('AV1EPU', 0, '05', '2022', 'AV1EPU-05-2022'),
('AV1FHI', 0, '05', '2022', 'AV1FHI-05-2022'),
('AV1FKK', 0, '05', '2022', 'AV1FKK-05-2022'),
('AV1FMM', 0, '05', '2022', 'AV1FMM-05-2022'),
('AV1FPM', 0, '05', '2022', 'AV1FPM-05-2022'),
('AV1FPU', 0, '05', '2022', 'AV1FPU-05-2022'),
('AV1GAMt', 0, '05', '2022', 'AV1GAMt-05-2022'),
('AV1GBD', 0, '05', '2022', 'AV1GBD-05-2022'),
('AV1GHI', 0, '05', '2022', 'AV1GHI-05-2022'),
('AV1GKK', 0, '05', '2022', 'AV1GKK-05-2022'),
('AV1GMT', 0, '05', '2022', 'AV1GMT-05-2022'),
('AV1GPM', 0, '05', '2022', 'AV1GPM-05-2022'),
('AV1GPU', 0, '05', '2022', 'AV1GPU-05-2022'),
('AV1HAMm', 0, '05', '2022', 'AV1HAMm-05-2022'),
('AV1HAMt', 0, '05', '2022', 'AV1HAMt-05-2022'),
('AV1HHI', 0, '05', '2022', 'AV1HHI-05-2022'),
('AV1HPU', 0, '05', '2022', 'AV1HPU-05-2022'),
('AV2AHI', 0, '05', '2022', 'AV2AHI-05-2022'),
('AV2APU', 0, '05', '2022', 'AV2APU-05-2022'),
('AV2BBT', 0, '05', '2022', 'AV2BBT-05-2022'),
('AV2BHI', 0, '05', '2022', 'AV2BHI-05-2022'),
('AV2BPU', 0, '05', '2022', 'AV2BPU-05-2022'),
('AV2CAG', 0, '05', '2022', 'AV2CAG-05-2022'),
('AV2CBD', 0, '05', '2022', 'AV2CBD-05-2022'),
('AV2CBTt', 0, '05', '2022', 'AV2CBTt-05-2022'),
('AV2CHI', 0, '05', '2022', 'AV2CHI-05-2022'),
('AV2CHN', 0, '05', '2022', 'AV2CHN-05-2022'),
('AV2CKB', 0, '05', '2022', 'AV2CKB-05-2022'),
('AV2CMM', 0, '05', '2022', 'AV2CMM-05-2022'),
('AV2COR', 0, '05', '2022', 'AV2COR-05-2022'),
('AV2CPU', 0, '05', '2022', 'AV2CPU-05-2022'),
('AV2DBB', 0, '05', '2022', 'AV2DBB-05-2022'),
('AV2DHI', 0, '05', '2022', 'AV2DHI-05-2022'),
('AV2DMC', 0, '05', '2022', 'AV2DMC-05-2022'),
('AV2DMT', 0, '05', '2022', 'AV2DMT-05-2022'),
('AV2DPU', 0, '05', '2022', 'AV2DPU-05-2022'),
('AV2EAG', 0, '05', '2022', 'AV2EAG-05-2022'),
('AV2EHI', 0, '05', '2022', 'AV2EHI-05-2022'),
('AV2EPU', 0, '05', '2022', 'AV2EPU-05-2022'),
('AV2FBD', 0, '05', '2022', 'AV2FBD-05-2022'),
('AV2FBT', 0, '05', '2022', 'AV2FBT-05-2022'),
('AV2FCK', 0, '05', '2022', 'AV2FCK-05-2022'),
('AV2FCT', 0, '05', '2022', 'AV2FCT-05-2022'),
('AV2FHI', 0, '05', '2022', 'AV2FHI-05-2022'),
('AV2FKK', 0, '05', '2022', 'AV2FKK-05-2022'),
('AV2FMM', 0, '05', '2022', 'AV2FMM-05-2022'),
('AV2FMT', 0, '05', '2022', 'AV2FMT-05-2022'),
('AV2FPU', 0, '05', '2022', 'AV2FPU-05-2022'),
('AV2GBD', 0, '05', '2022', 'AV2GBD-05-2022'),
('AV2GBT', 0, '05', '2022', 'AV2GBT-05-2022'),
('AV2GHI', 0, '05', '2022', 'AV2GHI-05-2022'),
('AV2GHN', 0, '05', '2022', 'AV2GHN-05-2022'),
('AV2GHS', 0, '05', '2022', 'AV2GHS-05-2022'),
('AV2GMM', 0, '05', '2022', 'AV2GMM-05-2022'),
('AV2GPB', 0, '05', '2022', 'AV2GPB-05-2022'),
('AV2GPU', 0, '05', '2022', 'AV2GPU-05-2022'),
('AV2HAMm', 0, '05', '2022', 'AV2HAMm-05-2022'),
('AV2HHI', 0, '05', '2022', 'AV2HHI-05-2022'),
('AV2HPU', 0, '05', '2022', 'AV2HPU-05-2022'),
('AV2IHI', 0, '05', '2022', 'AV2IHI-05-2022'),
('AV2IPU', 0, '05', '2022', 'AV2IPU-05-2022'),
('AV2JHI', 0, '05', '2022', 'AV2JHI-05-2022'),
('AV2JKK', 0, '05', '2022', 'AV2JKK-05-2022'),
('AV2JPU', 0, '05', '2022', 'AV2JPU-05-2022'),
('AV4GBB', 0, '05', '2022', 'AV4GBB-05-2022'),
('AVn2GHI', 0, '05', '2022', 'AVn2GHI-05-2022'),
('AX1DHI', 0, '05', '2022', 'AX1DHI-05-2022'),
('AZ1GHI', 0, '05', '2022', 'AZ1GHI-05-2022'),
('AZ1HHI', 0, '05', '2022', 'AZ1HHI-05-2022'),
('GS1CHI', 0, '05', '2022', 'GS1CHI-05-2022'),
('GS1DBD', 0, '05', '2022', 'GS1DBD-05-2022'),
('GS1FBD', 0, '05', '2022', 'GS1FBD-05-2022'),
('GS1FHI', 0, '05', '2022', 'GS1FHI-05-2022'),
('GS2DBD', 0, '05', '2022', 'GS2DBD-05-2022'),
('GS2FBD', 0, '05', '2022', 'GS2FBD-05-2022'),
('GS2FHI', 0, '05', '2022', 'GS2FHI-05-2022'),
('GS2GBD', 0, '05', '2022', 'GS2GBD-05-2022'),
('GS2GHI', 0, '05', '2022', 'GS2GHI-05-2022'),
('GS2NBD', 0, '05', '2022', 'GS2NBD-05-2022');

-- --------------------------------------------------------

--
-- Table structure for table `total_penjualan`
--

CREATE TABLE `total_penjualan` (
  `id` int(1) NOT NULL,
  `penjualan_total` int(100) NOT NULL,
  `penjualan_kp` int(100) NOT NULL,
  `penjualan_ko` int(100) NOT NULL,
  `penjualan_bc` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `total_penjualan`
--

INSERT INTO `total_penjualan` (`id`, `penjualan_total`, `penjualan_kp`, `penjualan_ko`, `penjualan_bc`) VALUES
(1, 6, 5, 1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `update_history`
--

CREATE TABLE `update_history` (
  `id` int(10) NOT NULL,
  `activity` text NOT NULL,
  `time` datetime NOT NULL,
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `update_history`
--

INSERT INTO `update_history` (`id`, `activity`, `time`, `user`) VALUES
(1, '1', '2022-04-25 17:07:37', 'HRFI'),
(2, 'Pengurangan stok kaos polos dengan kode barang AE2DHI', '2022-04-25 17:11:42', 'HRFI'),
(3, 'Pengurangan stok kaos polos dengan kode barang AE2DHI', '2022-04-25 17:23:37', 'HRFI'),
(4, 'Pengurangan stok kaos polos dengan kode barang AE2DHI', '2022-04-25 17:29:41', 'HRFI'),
(5, 'Penambahan stok kaos polos dengan kode barang AE2DHI', '2022-04-25 17:29:43', 'HRFI'),
(6, 'Penghapusan stok kaos polos dengan kode barang Test', '2022-04-25 17:31:45', 'HRFI'),
(7, 'Penambahan stok kaos polos Test dengan kode barang Test', '2022-04-25 17:35:13', 'HRFI'),
(8, 'Penghapusan stok kaos polos dengan kode barang Test', '2022-04-25 17:35:29', 'HRFI'),
(9, 'Penambahan stok kaos polos dengan kode barang AE2DHI', '2022-04-25 17:41:12', 'HRFI'),
(10, 'Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-25 17:41:15', 'HRFI'),
(11, 'Penambahan stok kaos polos dengan kode barang AE2DHI', '2022-04-25 17:41:23', 'HRFI'),
(12, 'Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-25 17:41:24', 'HRFI'),
(13, 'Penambahan stok kaos polos dengan kode barang AE2DHI', '2022-04-25 17:41:49', 'HRFI'),
(14, 'Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-04-25 17:41:50', 'HRFI'),
(15, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI', '2022-04-25 17:43:28', 'HRFI'),
(16, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI', '2022-04-25 17:43:29', 'HRFI'),
(17, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 7 ke 6', '2022-04-25 17:43:30', 'HRFI'),
(18, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-04-25 17:43:31', 'HRFI'),
(19, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-04-25 17:45:51', 'HRFI'),
(20, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-04-25 17:45:52', 'HRFI'),
(79, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-04-28 14:22:51', 'HRFI'),
(104, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 14:59:51', 'HRFI'),
(105, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 14:59:52', 'HRFI'),
(106, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 15:01:14', 'HRFI'),
(107, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 15:01:23', 'HRFI'),
(108, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 15:02:43', 'HRFI'),
(109, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 15:02:45', 'HRFI'),
(110, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 15:03:31', 'HRFI'),
(111, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 15:03:33', 'HRFI'),
(112, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 15:09:33', 'HRFI'),
(113, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 15:09:34', 'HRFI'),
(122, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 15:48:06', 'HRFI'),
(123, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 15:48:07', 'HRFI'),
(124, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 16:15:05', 'HRFI'),
(125, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 16:15:06', 'HRFI'),
(126, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 16:16:29', 'HRFI'),
(127, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 16:16:31', 'HRFI'),
(128, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 16:17:44', 'HRFI'),
(129, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 16:17:46', 'HRFI'),
(130, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 16:18:00', 'HRFI'),
(131, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 16:18:01', 'HRFI'),
(132, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 16:19:16', 'HRFI'),
(133, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 16:19:18', 'HRFI'),
(134, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 16:19:57', 'HRFI'),
(135, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 16:19:58', 'HRFI'),
(136, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 16:20:33', 'HRFI'),
(137, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 16:20:34', 'HRFI'),
(138, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 16:21:00', 'HRFI'),
(139, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 16:21:01', 'HRFI'),
(171, '(-) Pengurangan stok kaos polos dengan kode barang AE2GHI yang berjumlah 5 ke 4', '2022-04-29 20:34:32', 'HRFI'),
(172, '(+) Penambahan stok kaos polos dengan kode barang AE2GHI yang berjumlah 4 ke 5', '2022-04-29 20:34:34', 'HRFI'),
(185, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-30 16:49:49', 'HRFI'),
(186, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-04-30 16:49:50', 'HRFI'),
(187, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-30 16:50:24', 'HRFI'),
(188, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-04-30 16:50:26', 'HRFI'),
(189, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 5', '2022-04-30 16:50:59', 'HRFI'),
(190, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 5 ke 6', '2022-04-30 16:51:23', 'HRFI'),
(191, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 5', '2022-04-30 16:51:47', 'HRFI'),
(192, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 5 ke 6', '2022-04-30 16:52:07', 'HRFI'),
(193, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-30 16:53:33', 'HRFI'),
(194, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-04-30 16:53:54', 'HRFI'),
(195, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 5', '2022-04-30 16:57:47', 'HRFI'),
(196, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 5 ke 6', '2022-04-30 16:58:10', 'HRFI'),
(197, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-30 17:09:39', 'HRFI'),
(198, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 5', '2022-04-30 17:09:58', 'HRFI'),
(199, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-04-30 17:27:57', 'HRFI'),
(200, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-30 17:27:59', 'HRFI'),
(201, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 5 ke 6', '2022-04-30 18:31:05', 'HRFI'),
(202, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 7', '2022-04-30 18:31:06', 'HRFI'),
(203, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 7 ke 6', '2022-04-30 18:31:08', 'HRFI'),
(204, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-04-30 18:32:58', 'HRFI'),
(205, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-04-30 18:32:59', 'HRFI'),
(206, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-04-30 18:33:01', 'HRFI'),
(207, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 7', '2022-04-30 18:33:15', 'HRFI'),
(208, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 7 ke 6', '2022-04-30 18:33:16', 'HRFI'),
(209, '(EDIT) Pengeditan ukuran panjang dengan kode barang DTAL dari 50 menjadi 40 pada bahan cutting', '2022-04-30 18:49:33', 'HRFI'),
(210, '(EDIT) Pengeditan ukuran lebar dengan kode barang DTAL dari 50 menjadi 40 pada bahan cutting', '2022-04-30 18:49:33', 'HRFI'),
(211, '(EDIT) Pengeditan ukuran panjang dengan kode barang DTAL dari 40 menjadi 35 pada bahan cutting', '2022-04-30 18:50:52', 'HRFI'),
(212, '(EDIT) Pengeditan ukuran lebar dengan kode barang DTAL dari 40 menjadi 35 pada bahan cutting', '2022-04-30 18:50:52', 'HRFI'),
(213, '(EDIT) Pengeditan harga satuan dengan kode barang DTAL dari Rp.500 menjadi Rp.500 pada bahan cutting', '2022-04-30 18:50:52', 'HRFI'),
(214, '(EDIT) Pengeditan ukuran panjang dengan kode barang DTAL dari 35 menjadi 50 pada bahan cutting', '2022-04-30 19:03:26', 'HRFI'),
(215, '(EDIT) Pengeditan ukuran lebar dengan kode barang DTAL dari 35 menjadi 50 pada bahan cutting', '2022-04-30 19:03:26', 'HRFI'),
(216, '(EDIT) Pengeditan harga satuan dengan kode barang DTAL dari Rp.500 menjadi Rp.500 pada bahan cutting', '2022-04-30 19:03:26', 'HRFI'),
(217, '(EDIT) Pengeditan ukuran panjang dengan kode barang DTAL dari 50 menjadi 40 pada bahan cutting', '2022-04-30 19:03:55', 'HRFI'),
(218, '(EDIT) Pengeditan ukuran lebar dengan kode barang DTAL dari 50 menjadi 40 pada bahan cutting', '2022-04-30 19:03:55', 'HRFI'),
(219, '(EDIT) Pengeditan harga satuan dengan kode barang DTAL dari Rp.500 menjadi Rp.500 pada bahan cutting', '2022-04-30 19:03:55', 'HRFI'),
(220, '(EDIT) Pengeditan ukuran panjang dengan kode barang DTAL dari 40 menjadi 30 pada bahan cutting', '2022-04-30 19:06:16', 'HRFI'),
(221, '(EDIT) Pengeditan ukuran lebar dengan kode barang DTAL dari 40 menjadi 30 pada bahan cutting', '2022-04-30 19:06:16', 'HRFI'),
(222, '(EDIT) Pengeditan harga satuan dengan kode barang DTAL dari Rp.500 menjadi Rp.500 pada bahan cutting', '2022-04-30 19:06:16', 'HRFI'),
(223, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-30 19:10:29', 'HRFI'),
(224, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-05-01 01:59:48', 'HRFI'),
(225, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-05-01 01:59:49', 'HRFI'),
(226, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-05-01 01:59:50', 'HRFI'),
(227, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-05-01 02:14:58', 'HRFI'),
(228, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-05-01 02:14:59', 'HRFI'),
(229, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-05-01 02:17:55', 'HRFI'),
(230, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-05-01 02:17:58', 'HRFI'),
(231, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 7', '2022-05-01 02:18:52', 'HRFI'),
(232, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 7 ke 6', '2022-05-01 02:18:53', 'HRFI'),
(233, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-05-01 02:20:30', 'HRFI'),
(234, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-05-01 02:20:31', 'HRFI'),
(235, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-05-01 02:22:59', 'HRFI'),
(236, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-05-01 02:23:01', 'HRFI'),
(237, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-05-01 02:23:36', 'HRFI'),
(238, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-05-01 02:23:37', 'HRFI'),
(239, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-05-01 02:25:25', 'HRFI'),
(240, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-05-01 02:25:26', 'HRFI'),
(241, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-05-01 02:31:24', 'HRFI'),
(242, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-05-01 02:31:25', 'HRFI'),
(243, '(+) Penambahan stok kaos polos dengan kode barang AE2GHI yang berjumlah 5 ke 6', '2022-05-01 02:46:28', 'HRFI'),
(244, '(-) Pengurangan stok kaos polos dengan kode barang AE2GHI yang berjumlah 6 ke 5', '2022-05-01 02:46:29', 'HRFI'),
(245, '(+) Penambahan stok kaos original dengan kode barang BB1G2H yang berjumlah 5 ke 6', '2022-05-01 02:47:21', 'HRFI'),
(246, '(-) Pengurangan stok kaos original dengan kode barang BB1G2H yang berjumlah 6 ke 5', '2022-05-01 02:47:23', 'HRFI'),
(247, '(EDIT) Pengeditan ukuran panjang dengan kode barang DTAL dari 30 menjadi 30 pada bahan cutting', '2022-05-01 02:49:25', 'HRFI'),
(248, '(EDIT) Pengeditan ukuran lebar dengan kode barang DTAL dari 30 menjadi 29 pada bahan cutting', '2022-05-01 02:49:25', 'HRFI'),
(249, '(EDIT) Pengeditan harga satuan dengan kode barang DTAL dari Rp.500 menjadi Rp.500 pada bahan cutting', '2022-05-01 02:49:25', 'HRFI'),
(254, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 7', '2022-05-01 04:46:17', 'HRFI'),
(255, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 7 ke 6', '2022-05-01 04:46:18', 'HRFI'),
(258, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-05-01 04:49:45', 'HRFI'),
(259, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-05-01 04:49:46', 'HRFI'),
(260, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 7', '2022-05-01 05:14:41', 'HRFI'),
(261, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 7 ke 6', '2022-05-01 05:14:43', 'HRFI'),
(262, '(EDIT) Pengeditan ukuran panjang dengan kode barang DTAL dari 30 menjadi 30 pada bahan cutting', '2022-05-01 05:18:42', 'HRFI'),
(263, '(EDIT) Pengeditan ukuran lebar dengan kode barang DTAL dari 29 menjadi 28 pada bahan cutting', '2022-05-01 05:18:42', 'HRFI'),
(264, '(EDIT) Pengeditan harga satuan dengan kode barang DTAL dari Rp.500 menjadi Rp.500 pada bahan cutting', '2022-05-01 05:18:42', 'HRFI'),
(265, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-05-01 05:32:48', 'HRFI'),
(266, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-05-01 05:32:50', 'HRFI'),
(267, '(ADD) Penambahan stok bahan cutting dsa dengan kode barang dsa', '2022-05-10 08:11:02', 'HRFI'),
(268, '(DEL) Penghapusan stok kaos polos dengan kode barang dsa', '2022-05-10 08:11:06', 'HRFI'),
(269, '(EDIT) Pengeditan ukuran panjang dengan kode barang DTAL dari 30 menjadi 30 pada bahan cutting', '2022-05-10 08:11:22', 'HRFI'),
(270, '(EDIT) Pengeditan ukuran lebar dengan kode barang DTAL dari 28 menjadi 28 pada bahan cutting', '2022-05-10 08:11:22', 'HRFI'),
(271, '(EDIT) Pengeditan harga satuan dengan kode barang DTAL dari Rp.500 menjadi Rp.500 pada bahan cutting', '2022-05-10 08:11:22', 'HRFI'),
(274, '(ADD) Penambahan stok kaos polos ds dengan kode barang ds', '2022-05-10 08:58:59', 'HRFI'),
(275, '(DEL) Penghapusan stok kaos polos dengan kode barang ds', '2022-05-10 09:01:30', 'HRFI'),
(276, '(ADD) Penambahan stok kaos polos z dengan kode barang z', '2022-05-10 09:02:47', 'HRFI'),
(277, '(DEL) Penghapusan stok kaos polos dengan kode barang z', '2022-05-10 09:02:51', 'HRFI'),
(279, '(ADD) Penambahan stok bahan cutting z dengan kode barang z', '2022-05-10 09:06:11', 'HRFI'),
(280, '(DEL) Penghapusan stok kaos polos dengan kode barang z', '2022-05-10 09:06:14', 'HRFI'),
(299, '(DEL) Penghapusan stok kaos polos dengan kode barang 243df34', '2022-05-12 07:59:15', 'HRFI'),
(300, '(+) Penambahan stok kaos original dengan kode barang 1234d3 yang berjumlah 7 ke 8', '2022-05-12 08:34:09', 'HRFI'),
(301, '(EDIT) Pengeditan size dengan kode barang AF2FHI dari L menjadi M pada stok kaos polos', '2022-05-12 18:03:43', 'HRFI'),
(302, '(EDIT) Pengeditan jumlah stok dengan kode barang AF2FHI dari 4 menjadi 4 pada stok kaos polos', '2022-05-12 18:03:43', 'HRFI'),
(303, '(EDIT) Pengeditan harga satuan dengan kode barang AF2FHI dari Rp.70000 menjadi Rp.70000 pada stok kaos polos', '2022-05-12 18:03:43', 'HRFI'),
(304, '(EDIT) Pengeditan size dengan kode barang AF2FHI dari M menjadi L pada stok kaos polos', '2022-05-12 18:04:54', 'HRFI'),
(305, '(EDIT) Pengeditan jumlah stok dengan kode barang AF2FHI dari 4 menjadi 4 pada stok kaos polos', '2022-05-12 18:04:54', 'HRFI'),
(306, '(EDIT) Pengeditan harga satuan dengan kode barang AF2FHI dari Rp.70000 menjadi Rp.70000 pada stok kaos polos', '2022-05-12 18:04:54', 'HRFI'),
(307, '(EDIT) Pengeditan jumlah stok dengan kode barang AF2FHI dari 4 menjadi 4 pada stok kaos polos', '2022-05-12 18:06:09', 'HRFI'),
(308, '(EDIT) Pengeditan harga satuan dengan kode barang AF2FHI dari Rp.70000 menjadi Rp.70000 pada stok kaos polos', '2022-05-12 18:06:09', 'HRFI'),
(309, '(EDIT) Pengeditan jumlah stok dengan kode barang AF2FHI dari 4 menjadi 4 pada stok kaos polos', '2022-05-12 18:06:42', 'HRFI'),
(310, '(EDIT) Pengeditan harga satuan dengan kode barang AF2FHI dari Rp.70000 menjadi Rp.70000 pada stok kaos polos', '2022-05-12 18:06:43', 'HRFI'),
(311, '(EDIT) Pengeditan jumlah stok dengan kode barang AF2FHI dari 4 menjadi 4 pada stok kaos polos', '2022-05-12 18:07:00', 'HRFI'),
(312, '(EDIT) Pengeditan harga satuan dengan kode barang AF2FHI dari Rp.70000 menjadi Rp.70000 pada stok kaos polos', '2022-05-12 18:07:01', 'HRFI'),
(313, '(EDIT) Pengeditan jumlah stok dengan kode barang AF2FHI dari 4 menjadi 4 pada stok kaos polos', '2022-05-12 18:07:56', 'HRFI'),
(314, '(EDIT) Pengeditan harga satuan dengan kode barang AF2FHI dari Rp.70000 menjadi Rp.70000 pada stok kaos polos', '2022-05-12 18:07:56', 'HRFI'),
(315, '(EDIT) Pengeditan jumlah stok dengan kode barang AF2FHI dari 4 menjadi 4 pada stok kaos polos', '2022-05-12 18:08:05', 'HRFI'),
(316, '(EDIT) Pengeditan harga satuan dengan kode barang AF2FHI dari Rp.70000 menjadi Rp.70000 pada stok kaos polos', '2022-05-12 18:08:05', 'HRFI'),
(317, '(EDIT) Pengeditan jumlah stok dengan kode barang AF2FHI dari 4 menjadi 4 pada stok kaos polos', '2022-05-12 18:09:31', 'HRFI'),
(318, '(EDIT) Pengeditan harga satuan dengan kode barang AF2FHI dari Rp.70000 menjadi Rp.70000 pada stok kaos polos', '2022-05-12 18:09:31', 'HRFI'),
(319, '(EDIT) Pengeditan harga satuan dengan kode barang AF2FHI dari Rp.70000 menjadi Rp.70000 pada stok kaos polos', '2022-05-12 18:09:50', 'HRFI'),
(320, '(EDIT) Pengeditan jumlah stok dengan kode barang 1234d3 dari 8 menjadi 8 pada stok kaos original', '2022-05-12 18:10:46', 'HRFI'),
(321, '(EDIT) Pengeditan harga satuan dengan kode barang 1234d3 dari Rp.20000 menjadi Rp.20000 pada stok kaos original', '2022-05-12 18:10:46', 'HRFI'),
(322, '(EDIT) Pengeditan ukuran panjang dengan kode barang asvwf3 dari 20 menjadi 20 pada bahan cutting', '2022-05-12 18:11:38', 'HRFI'),
(323, '(EDIT) Pengeditan ukuran lebar dengan kode barang asvwf3 dari 30 menjadi 30 pada bahan cutting', '2022-05-12 18:11:38', 'HRFI'),
(324, '(EDIT) Pengeditan harga satuan dengan kode barang asvwf3 dari Rp.40 menjadi Rp.40 pada bahan cutting', '2022-05-12 18:11:38', 'HRFI'),
(325, '(EDIT) Pengeditan ukuran lebar dengan kode barang asvwf3 dari 30 menjadi 29 pada bahan cutting', '2022-05-12 18:20:44', 'HRFI'),
(326, '(EDIT) Pengeditan ukuran panjang dengan kode barang asvwf3 dari 20 menjadi 19 pada bahan cutting', '2022-05-12 18:25:35', 'HRFI'),
(327, '(EDIT) Pengeditan ukuran lebar dengan kode barang FBOR dari 60 menjadi 59 pada bahan cutting', '2022-05-12 18:28:50', 'HRFI'),
(328, '(ADD) Penambahan stok bahan cutting Dummy dengan kode barang AAAA', '2022-05-12 18:29:33', 'HRFI'),
(329, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-05-14 19:46:26', 'HRFI'),
(330, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-05-14 19:46:31', 'HRFI'),
(331, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-05-14 20:38:00', 'HRFI'),
(332, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-05-14 20:38:08', 'HRFI'),
(333, '(+) Penambahan stok kaos polos dengan kode barang AF2FHI yang berjumlah 4 ke 5', '2022-05-16 11:30:40', 'HRFI'),
(334, '(-) Pengurangan stok kaos polos dengan kode barang AF2FHI yang berjumlah 5 ke 4', '2022-05-16 11:30:42', 'HRFI'),
(335, '(+) Penambahan stok kaos polos dengan kode barang AF2FHI yang berjumlah 4 ke 5', '2022-05-16 11:34:11', 'HRFI'),
(336, '(EDIT) Pengeditan nama barang dengan kode barang AF2FHI dari KAOS ALS menjadi KAOS ALSs pada stok kaos polos', '2022-05-16 11:34:26', 'HRFI'),
(337, '(-) Pengurangan stok kaos polos dengan kode barang AF2FHI yang berjumlah 5 ke 4', '2022-05-16 11:34:31', 'HRFI'),
(338, '(+) Penambahan stok kaos polos dengan kode barang AF2FHI yang berjumlah 4 ke 5', '2022-05-16 11:34:33', 'HRFI'),
(339, '(ADD) Penambahan stok kaos polos test dengan kode barang test', '2022-05-16 11:35:02', 'HRFI'),
(340, '(DEL) Penghapusan stok kaos polos dengan kode barang test', '2022-05-16 11:35:06', 'HRFI'),
(341, '(EDIT) Pengeditan nama barang dengan kode barang AF2FHI dari KAOS ALSs menjadi KAOS ALS pada stok kaos polos', '2022-05-16 11:35:16', 'HRFI'),
(342, '(+) Penambahan stok kaos original dengan kode barang 1234d3 yang berjumlah 8 ke 9', '2022-05-16 11:35:20', 'HRFI'),
(343, '(-) Pengurangan stok kaos original dengan kode barang 1234d3 yang berjumlah 9 ke 8', '2022-05-16 11:35:21', 'HRFI'),
(344, '(DEL) Penghapusan stok kaos polos dengan kode barang 1234d3', '2022-05-16 11:35:24', 'HRFI');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `bahan_cutting`
--
ALTER TABLE `bahan_cutting`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `kaos_original`
--
ALTER TABLE `kaos_original`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `kaos_polos`
--
ALTER TABLE `kaos_polos`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `sales_tracking_bc`
--
ALTER TABLE `sales_tracking_bc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_barang_bc` (`kode_barang`);

--
-- Indexes for table `sales_tracking_ko`
--
ALTER TABLE `sales_tracking_ko`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_barang_ko` (`kode_barang`);

--
-- Indexes for table `sales_tracking_kp`
--
ALTER TABLE `sales_tracking_kp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `total_penjualan`
--
ALTER TABLE `total_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `update_history`
--
ALTER TABLE `update_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account-username` (`user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `update_history`
--
ALTER TABLE `update_history`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales_tracking_bc`
--
ALTER TABLE `sales_tracking_bc`
  ADD CONSTRAINT `kode_barang_bc` FOREIGN KEY (`kode_barang`) REFERENCES `bahan_cutting` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_tracking_ko`
--
ALTER TABLE `sales_tracking_ko`
  ADD CONSTRAINT `kode_barang_ko` FOREIGN KEY (`kode_barang`) REFERENCES `kaos_original` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_tracking_kp`
--
ALTER TABLE `sales_tracking_kp`
  ADD CONSTRAINT `kode_barang` FOREIGN KEY (`kode_barang`) REFERENCES `kaos_polos` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `update_history`
--
ALTER TABLE `update_history`
  ADD CONSTRAINT `account-username` FOREIGN KEY (`user`) REFERENCES `accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
