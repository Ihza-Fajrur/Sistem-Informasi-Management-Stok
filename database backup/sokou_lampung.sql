-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2022 at 09:11 PM
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
  `password` varchar(50) NOT NULL,
  `acc_type` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_photo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`username`, `password`, `acc_type`, `email`, `user_photo`) VALUES
('HRFI', '1', 'Admin', 'admin@gmail.com', './static/profile_picture/Ihza.jpg'),
('IFRH', '1', 'Admin', 'ihza.119140130@student.itera.ac.id', './static/profile_picture/Ihza.jpg'),
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
('DTAL', 'DTF', 'DTF', 'ALL', 30, 28, 500, 420000),
('FBHI', 'FLOCK', 'BLUDRU', 'HITAM', 60, 28, 2300, 3864000),
('FBOR', 'FLOCK', 'BLUDRU', 'ORANGE', 50, 60, 2300, 6900000),
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
('BB1F2H', 'KAOS ORI', 'L', 'PENDEK', 'BBI', 'HITAM', 6, 250000, 1500000),
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
('AE2DHI', 'KAOS ALS', 'M', 'COTTON CARDED 20S', 'PENDEK', 'O NECK', 'HITAM', 5, 80000, 400000),
('AE2GHI', 'KAOS ALS', 'XL', 'COTTON CARDED 20S', 'PENDEK', 'O NECK', 'HITAM', 5, 75000, 375000),
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
(5, 10),
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
('DTAL', 60, '05', '2022', 'DTAL-05-2022'),
('FBHI', 0, '05', '2022', 'FBHI-05-2022'),
('FBOR', 0, '05', '2022', 'FBOR-05-2022'),
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
('BB1F2H', 3, '05', '2022', 'BB1F2H-05-2022'),
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
('AE2DHI', 5, '05', '2022', 'AE2DHI-05-2022'),
('AE2GHI', 1, '05', '2022', 'AE2GHI-05-2022'),
('AF2FHI', 0, '05', '2022', 'AF2FHI-05-2022'),
('AK2CHL', 0, '05', '2022', 'AK2CHL-05-2022'),
('AK2CKK', 0, '05', '2022', 'AK2CKK-05-2022'),
('AK2DBD', 0, '05', '2022', 'AK2DBD-05-2022'),
('AK2DOR', 0, '05', '2022', 'AK2DOR-05-2022'),
('AK2FPU', 0, '05', '2022', 'AK2FPU-05-2022'),
('AK2GHI', 0, '05', '2022', 'AK2GHI-05-2022'),
('AP2DKK', 0, '05', '2022', 'AP2DKK-05-2022'),
('AP2FBD', 0, '05', '2022', 'AP2FBD-05-2022'),
('AP2HBB', 0, '05', '2022', 'AP2HBB-05-2022'),
('AR3FHI', 0, '05', '2022', 'AR3FHI-05-2022'),
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
(1, 10, 6, 4, 60);

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
(21, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 5', '2022-04-27 23:07:28', 'IFRH'),
(22, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 5 ke 6', '2022-04-27 23:07:31', 'IFRH'),
(23, '(DEL) Penghapusan stok kaos polos dengan kode barang Test', '2022-04-27 23:09:49', 'IFRH'),
(24, '(ADD) Penambahan stok kaos original Test dengan kode barang Test', '2022-04-27 23:10:21', 'IFRH'),
(25, '(DEL) Penghapusan stok kaos polos dengan kode barang Test', '2022-04-27 23:10:24', 'IFRH'),
(26, '(ADD) Penambahan stok bahan cutting Test dengan kode barang Test', '2022-04-27 23:12:46', 'IFRH'),
(27, '(DEL) Penghapusan stok kaos polos dengan kode barang Test', '2022-04-27 23:12:49', 'IFRH'),
(28, '(EDIT) Pengeditan kode barang AE2DHIa menjadi AE2DHI pada stok kaos polos', '2022-04-27 23:47:39', 'IFRH'),
(29, '(EDIT) Pengeditan nama barang dengan kode barang AE2DHI dari KAOS ALS menjadi KAOS ALSa pada stok kaos polos', '2022-04-27 23:50:02', 'IFRH'),
(30, '(EDIT) Pengeditan nama barang dengan kode barang AE2DHI dari KAOS ALSa menjadi KAOS ALS pada stok kaos polos', '2022-04-27 23:50:23', 'IFRH'),
(31, '(EDIT) Pengeditan kode barang AE2DHI menjadi AE2DHIa pada stok kaos polos', '2022-04-27 23:55:17', 'IFRH'),
(32, '(EDIT) Pengeditan nama barang dengan kode barang AE2DHIa dari KAOS ALS menjadi KAOS ALSa pada stok kaos polos', '2022-04-27 23:55:17', 'IFRH'),
(33, '(EDIT) Pengeditan size dengan kode barang AE2DHIa dari M menjadi Ma pada stok kaos polos', '2022-04-27 23:55:17', 'IFRH'),
(34, '(EDIT) Pengeditan jenis kain dengan kode barang AE2DHIa dari COTTON CARDED 20S menjadi COTTON CARDED 20Sa pada stok kaos polos', '2022-04-27 23:55:17', 'IFRH'),
(35, '(EDIT) Pengeditan bentuk lengan dengan kode barang AE2DHIa dari PENDEK menjadi PENDEKa pada stok kaos polos', '2022-04-27 23:55:18', 'IFRH'),
(36, '(EDIT) Pengeditan bentuk lingkar leher dengan kode barang AE2DHIa dari O NECK menjadi O NECKa pada stok kaos polos', '2022-04-27 23:55:18', 'IFRH'),
(37, '(EDIT) Pengeditan warna dengan kode barang AE2DHIa dari HITAM menjadi HITAMa pada stok kaos polos', '2022-04-27 23:55:18', 'IFRH'),
(38, '(EDIT) Pengeditan jumlah stok dengan kode barang AE2DHIa dari 5 menjadi 51 pada stok kaos polos', '2022-04-27 23:55:18', 'IFRH'),
(39, '(EDIT) Pengeditan harga satuan dengan kode barang AE2DHIa dari 80000 menjadi 800001 pada stok kaos polos', '2022-04-27 23:55:18', 'IFRH'),
(40, '(EDIT) Pengeditan kode barang AE2DHIa menjadi AE2DHI pada stok kaos polos', '2022-04-27 23:56:33', 'IFRH'),
(41, '(EDIT) Pengeditan nama barang dengan kode barang AE2DHI dari KAOS ALSa menjadi KAOS ALS pada stok kaos polos', '2022-04-27 23:56:34', 'IFRH'),
(42, '(EDIT) Pengeditan size dengan kode barang AE2DHI dari Ma menjadi M pada stok kaos polos', '2022-04-27 23:56:34', 'IFRH'),
(43, '(EDIT) Pengeditan jenis kain dengan kode barang AE2DHI dari COTTON CARDED 20Sa menjadi COTTON CARDED 20S pada stok kaos polos', '2022-04-27 23:56:34', 'IFRH'),
(44, '(EDIT) Pengeditan bentuk lengan dengan kode barang AE2DHI dari PENDEKa menjadi PENDEK pada stok kaos polos', '2022-04-27 23:56:34', 'IFRH'),
(45, '(EDIT) Pengeditan bentuk lingkar leher dengan kode barang AE2DHI dari O NECKa menjadi O NECK pada stok kaos polos', '2022-04-27 23:56:35', 'IFRH'),
(46, '(EDIT) Pengeditan warna dengan kode barang AE2DHI dari HITAMa menjadi HITAM pada stok kaos polos', '2022-04-27 23:56:35', 'IFRH'),
(47, '(EDIT) Pengeditan jumlah stok dengan kode barang AE2DHI dari 51 menjadi 5 pada stok kaos polos', '2022-04-27 23:56:35', 'IFRH'),
(48, '(EDIT) Pengeditan harga satuan dengan kode barang AE2DHI dari Rp.800001 menjadi Rp.80000 pada stok kaos polos', '2022-04-27 23:56:35', 'IFRH'),
(49, '(EDIT) Pengeditan kode barang BB1F2H menjadi BB1F2Ha pada stok kaos original', '2022-04-28 00:14:15', 'IFRH'),
(50, '(EDIT) Pengeditan nama barang dengan kode barang BB1F2Ha dari KAOS ORI menjadi KAOS ORIa pada stok kaos original', '2022-04-28 00:14:16', 'IFRH'),
(51, '(EDIT) Pengeditan size dengan kode barang BB1F2Ha dari L menjadi La pada stok kaos original', '2022-04-28 00:14:16', 'IFRH'),
(52, '(EDIT) Pengeditan bentuk lengan dengan kode barang BB1F2Ha dari PENDEK menjadi PENDEKa pada stok kaos original', '2022-04-28 00:14:16', 'IFRH'),
(53, '(EDIT) Pengeditan desain dengan kode barang BB1F2Ha dari BBI menjadi BBIa pada stok kaos original', '2022-04-28 00:14:16', 'IFRH'),
(54, '(EDIT) Pengeditan warna dengan kode barang BB1F2Ha dari HITAM menjadi HITAMa pada stok kaos original', '2022-04-28 00:14:16', 'IFRH'),
(55, '(EDIT) Pengeditan jumlah stok dengan kode barang BB1F2Ha dari 6 menjadi 61 pada stok kaos original', '2022-04-28 00:14:17', 'IFRH'),
(56, '(EDIT) Pengeditan harga satuan dengan kode barang BB1F2Ha dari Rp.250000 menjadi Rp.2500001 pada stok kaos original', '2022-04-28 00:14:17', 'IFRH'),
(57, '(EDIT) Pengeditan kode barang BB1F2Ha menjadi BB1F2H pada stok kaos original', '2022-04-28 00:15:37', 'IFRH'),
(58, '(EDIT) Pengeditan nama barang dengan kode barang BB1F2H dari KAOS ORIa menjadi KAOS ORI pada stok kaos original', '2022-04-28 00:15:38', 'IFRH'),
(59, '(EDIT) Pengeditan size dengan kode barang BB1F2H dari La menjadi L pada stok kaos original', '2022-04-28 00:15:38', 'IFRH'),
(60, '(EDIT) Pengeditan bentuk lengan dengan kode barang BB1F2H dari PENDEKa menjadi PENDEK pada stok kaos original', '2022-04-28 00:15:38', 'IFRH'),
(61, '(EDIT) Pengeditan desain dengan kode barang BB1F2H dari BBIa menjadi BBI pada stok kaos original', '2022-04-28 00:15:38', 'IFRH'),
(62, '(EDIT) Pengeditan warna dengan kode barang BB1F2H dari HITAMa menjadi HITAM pada stok kaos original', '2022-04-28 00:15:38', 'IFRH'),
(63, '(EDIT) Pengeditan jumlah stok dengan kode barang BB1F2H dari 61 menjadi 6 pada stok kaos original', '2022-04-28 00:15:39', 'IFRH'),
(64, '(EDIT) Pengeditan harga satuan dengan kode barang BB1F2H dari Rp.2500001 menjadi Rp.250000 pada stok kaos original', '2022-04-28 00:15:39', 'IFRH'),
(65, '(EDIT) Pengeditan kode barang DTAL menjadi DTALa pada bahan cutting', '2022-04-28 00:25:36', 'IFRH'),
(66, '(EDIT) Pengeditan nama barang dengan kode barang DTALa dari DTF menjadi DTFa pada bahan cutting', '2022-04-28 00:25:36', 'IFRH'),
(67, '(EDIT) Pengeditan jenis barang dengan kode barang DTALa dari DTF menjadi DTFa pada bahan cutting', '2022-04-28 00:25:36', 'IFRH'),
(68, '(EDIT) Pengeditan warna dengan kode barang DTALa dari ALL menjadi ALLa pada bahan_cutting', '2022-04-28 00:25:37', 'IFRH'),
(69, '(EDIT) Pengeditan ukuran panjang dengan kode barang DTALa dari 50 menjadi 501 pada bahan_cutting', '2022-04-28 00:25:37', 'IFRH'),
(70, '(EDIT) Pengeditan ukuran lebar dengan kode barang DTALa dari 50 menjadi 501 pada bahan_cutting', '2022-04-28 00:25:37', 'IFRH'),
(71, '(EDIT) Pengeditan harga satuan dengan kode barang DTALa dari Rp.500 menjadi Rp.5001 pada bahan cutting', '2022-04-28 00:25:37', 'IFRH'),
(72, '(EDIT) Pengeditan kode barang DTALa menjadi DTAL pada bahan cutting', '2022-04-28 00:27:40', 'IFRH'),
(73, '(EDIT) Pengeditan nama barang dengan kode barang DTAL dari DTFa menjadi DTF pada bahan cutting', '2022-04-28 00:27:41', 'IFRH'),
(74, '(EDIT) Pengeditan jenis barang dengan kode barang DTAL dari DTFa menjadi DTF pada bahan cutting', '2022-04-28 00:27:41', 'IFRH'),
(75, '(EDIT) Pengeditan warna dengan kode barang DTAL dari ALLa menjadi ALL pada bahan_cutting', '2022-04-28 00:27:41', 'IFRH'),
(76, '(EDIT) Pengeditan ukuran panjang dengan kode barang DTAL dari 501 menjadi 50 pada bahan_cutting', '2022-04-28 00:27:41', 'IFRH'),
(77, '(EDIT) Pengeditan ukuran lebar dengan kode barang DTAL dari 501 menjadi 50 pada bahan_cutting', '2022-04-28 00:27:42', 'IFRH'),
(78, '(EDIT) Pengeditan harga satuan dengan kode barang DTAL dari Rp.5001 menjadi Rp.500 pada bahan cutting', '2022-04-28 00:27:42', 'IFRH'),
(79, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-04-28 14:22:51', 'HRFI'),
(80, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-04-28 14:28:48', 'IFRH'),
(81, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-28 14:40:53', 'IFRH'),
(82, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 3', '2022-04-28 14:40:54', 'IFRH'),
(83, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 3 ke 2', '2022-04-28 14:40:56', 'IFRH'),
(84, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 2 ke 1', '2022-04-28 14:41:03', 'IFRH'),
(85, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 1 ke 0', '2022-04-28 14:41:05', 'IFRH'),
(86, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 0 ke 1', '2022-04-28 14:41:32', 'IFRH'),
(87, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 1 ke 0', '2022-04-28 14:41:34', 'IFRH'),
(88, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 0 ke 1', '2022-04-28 14:41:56', 'IFRH'),
(89, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 1 ke 0', '2022-04-28 14:42:00', 'IFRH'),
(90, '(EDIT) Pengeditan jumlah stok dengan kode barang AE2DHI dari 0 menjadi 5 pada stok kaos polos', '2022-04-28 14:42:15', 'IFRH'),
(91, '(EDIT) Pengeditan harga satuan dengan kode barang AE2DHI dari Rp.80000 menjadi Rp.80000 pada stok kaos polos', '2022-04-28 14:42:15', 'IFRH'),
(92, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 14:42:33', 'IFRH'),
(93, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 14:42:40', 'IFRH'),
(94, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 14:43:54', 'IFRH'),
(95, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 14:43:56', 'IFRH'),
(96, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 14:49:42', 'IFRH'),
(97, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 14:49:45', 'IFRH'),
(98, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 14:50:42', 'IFRH'),
(99, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 14:50:45', 'IFRH'),
(100, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 14:51:59', 'IFRH'),
(101, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 14:52:01', 'IFRH'),
(102, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 14:57:46', 'IFRH'),
(103, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 14:57:48', 'IFRH'),
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
(114, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 15:11:38', 'IFRH'),
(115, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 15:11:41', 'IFRH'),
(116, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 15:24:05', 'IFRH'),
(117, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 15:24:07', 'IFRH'),
(118, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 15:24:55', 'IFRH'),
(119, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 15:24:57', 'IFRH'),
(120, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-28 15:26:40', 'IFRH'),
(121, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-28 15:26:42', 'IFRH'),
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
(140, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-29 13:47:55', 'IFRH'),
(141, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-29 13:47:58', 'IFRH'),
(142, '(+) Penambahan stok kaos polos dengan kode barang AR3FHI yang berjumlah 0 ke 1', '2022-04-29 13:54:33', 'IFRH'),
(143, '(-) Pengurangan stok kaos polos dengan kode barang AR3FHI yang berjumlah 1 ke 0', '2022-04-29 13:54:35', 'IFRH'),
(144, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-29 19:30:39', 'IFRH'),
(145, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-04-29 19:31:55', 'IFRH'),
(146, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-29 19:31:57', 'IFRH'),
(147, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 3', '2022-04-29 19:33:55', 'IFRH'),
(148, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 3 ke 2', '2022-04-29 19:34:09', 'IFRH'),
(149, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 2 ke 3', '2022-04-29 19:34:21', 'IFRH'),
(150, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 3 ke 4', '2022-04-29 19:34:22', 'IFRH'),
(151, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-04-29 19:34:23', 'IFRH'),
(152, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 5', '2022-04-29 19:35:56', 'IFRH'),
(153, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 5 ke 6', '2022-04-29 19:36:10', 'IFRH'),
(154, '(EDIT) Pengeditan jumlah stok dengan kode barang BB1F2H dari 6 menjadi 3 pada stok kaos original', '2022-04-29 19:39:20', 'IFRH'),
(155, '(EDIT) Pengeditan harga satuan dengan kode barang BB1F2H dari Rp.250000 menjadi Rp.250000 pada stok kaos original', '2022-04-29 19:39:21', 'IFRH'),
(156, '(EDIT) Pengeditan jumlah stok dengan kode barang BB1F2H dari 3 menjadi 9 pada stok kaos original', '2022-04-29 19:42:23', 'IFRH'),
(157, '(EDIT) Pengeditan harga satuan dengan kode barang BB1F2H dari Rp.250000 menjadi Rp.250000 pada stok kaos original', '2022-04-29 19:42:23', 'IFRH'),
(158, '(EDIT) Pengeditan jumlah stok dengan kode barang BB1F2H dari 9 menjadi 6 pada stok kaos original', '2022-04-29 19:42:36', 'IFRH'),
(159, '(EDIT) Pengeditan harga satuan dengan kode barang BB1F2H dari Rp.250000 menjadi Rp.250000 pada stok kaos original', '2022-04-29 19:42:36', 'IFRH'),
(160, '(EDIT) Pengeditan jumlah stok dengan kode barang BB1F2H dari 6 menjadi 9 pada stok kaos original', '2022-04-29 19:43:04', 'IFRH'),
(161, '(EDIT) Pengeditan harga satuan dengan kode barang BB1F2H dari Rp.250000 menjadi Rp.250000 pada stok kaos original', '2022-04-29 19:43:05', 'IFRH'),
(162, '(EDIT) Pengeditan jumlah stok dengan kode barang BB1F2H dari 9 menjadi 6 pada stok kaos original', '2022-04-29 19:43:10', 'IFRH'),
(163, '(EDIT) Pengeditan harga satuan dengan kode barang BB1F2H dari Rp.250000 menjadi Rp.250000 pada stok kaos original', '2022-04-29 19:43:10', 'IFRH'),
(164, '(EDIT) Pengeditan jumlah stok dengan kode barang AE2DHI dari 5 menjadi 10 pada stok kaos polos', '2022-04-29 19:44:52', 'IFRH'),
(165, '(EDIT) Pengeditan harga satuan dengan kode barang AE2DHI dari Rp.80000 menjadi Rp.80000 pada stok kaos polos', '2022-04-29 19:44:52', 'IFRH'),
(166, '(EDIT) Pengeditan jumlah stok dengan kode barang AE2DHI dari 10 menjadi 6 pada stok kaos polos', '2022-04-29 19:45:04', 'IFRH'),
(167, '(EDIT) Pengeditan harga satuan dengan kode barang AE2DHI dari Rp.80000 menjadi Rp.80000 pada stok kaos polos', '2022-04-29 19:45:04', 'IFRH'),
(168, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-04-29 19:45:11', 'IFRH'),
(169, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 7', '2022-04-29 19:45:23', 'IFRH'),
(170, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 7 ke 6', '2022-04-29 19:45:35', 'IFRH'),
(171, '(-) Pengurangan stok kaos polos dengan kode barang AE2GHI yang berjumlah 5 ke 4', '2022-04-29 20:34:32', 'HRFI'),
(172, '(+) Penambahan stok kaos polos dengan kode barang AE2GHI yang berjumlah 4 ke 5', '2022-04-29 20:34:34', 'HRFI'),
(173, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-29 21:15:22', 'IFRH'),
(174, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-04-29 21:15:24', 'IFRH'),
(175, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-29 21:15:36', 'IFRH'),
(176, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-04-29 21:15:38', 'IFRH'),
(177, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-29 21:16:28', 'IFRH'),
(178, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-04-29 21:16:30', 'IFRH'),
(179, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-29 21:19:02', 'IFRH'),
(180, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-04-29 21:19:05', 'IFRH'),
(181, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-29 21:19:19', 'IFRH'),
(182, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-04-29 21:19:20', 'IFRH'),
(183, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 4', '2022-04-29 21:20:53', 'IFRH'),
(184, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 4 ke 5', '2022-04-29 21:20:55', 'IFRH'),
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
(250, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-05-01 04:33:26', 'IFRH'),
(251, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-05-01 04:33:28', 'IFRH'),
(252, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 7', '2022-05-01 04:42:08', 'IFRH'),
(253, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 7 ke 6', '2022-05-01 04:42:10', 'IFRH'),
(254, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 7', '2022-05-01 04:46:17', 'HRFI'),
(255, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 7 ke 6', '2022-05-01 04:46:18', 'HRFI'),
(256, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-05-01 04:47:31', 'IFRH'),
(257, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-05-01 04:47:35', 'IFRH'),
(258, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-05-01 04:49:45', 'HRFI'),
(259, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-05-01 04:49:46', 'HRFI'),
(260, '(+) Penambahan stok kaos original dengan kode barang BB1F2H yang berjumlah 6 ke 7', '2022-05-01 05:14:41', 'HRFI'),
(261, '(-) Pengurangan stok kaos original dengan kode barang BB1F2H yang berjumlah 7 ke 6', '2022-05-01 05:14:43', 'HRFI'),
(262, '(EDIT) Pengeditan ukuran panjang dengan kode barang DTAL dari 30 menjadi 30 pada bahan cutting', '2022-05-01 05:18:42', 'HRFI'),
(263, '(EDIT) Pengeditan ukuran lebar dengan kode barang DTAL dari 29 menjadi 28 pada bahan cutting', '2022-05-01 05:18:42', 'HRFI'),
(264, '(EDIT) Pengeditan harga satuan dengan kode barang DTAL dari Rp.500 menjadi Rp.500 pada bahan cutting', '2022-05-01 05:18:42', 'HRFI'),
(265, '(+) Penambahan stok kaos polos dengan kode barang AE2DHI yang berjumlah 5 ke 6', '2022-05-01 05:32:48', 'HRFI'),
(266, '(-) Pengurangan stok kaos polos dengan kode barang AE2DHI yang berjumlah 6 ke 5', '2022-05-01 05:32:50', 'HRFI');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales_tracking_bc`
--
ALTER TABLE `sales_tracking_bc`
  ADD CONSTRAINT `kode_barang_bc` FOREIGN KEY (`kode_barang`) REFERENCES `bahan_cutting` (`kode_barang`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sales_tracking_ko`
--
ALTER TABLE `sales_tracking_ko`
  ADD CONSTRAINT `kode_barang_ko` FOREIGN KEY (`kode_barang`) REFERENCES `kaos_original` (`kode_barang`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sales_tracking_kp`
--
ALTER TABLE `sales_tracking_kp`
  ADD CONSTRAINT `kode_barang` FOREIGN KEY (`kode_barang`) REFERENCES `kaos_polos` (`kode_barang`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `update_history`
--
ALTER TABLE `update_history`
  ADD CONSTRAINT `account-username` FOREIGN KEY (`user`) REFERENCES `accounts` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
