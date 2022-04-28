-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 28, 2022 at 02:56 AM
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
('HRFI', '1', 'Admin', 'ihza.119140130@student.itera.ac.id', '/profile_picture/Ihza Fajrur Rachman Hasani_119140130.jpg'),
('IFRH', '1', 'Admin', 'ihza.119140130@student.itera.ac.id', '/profile_picture/Ihza Fajrur Rachman Hasani_119140130.jpg'),
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
('DTAL', 'DTF', 'DTF', 'ALL', 50, 50, 500, 1250000),
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
(78, '(EDIT) Pengeditan harga satuan dengan kode barang DTAL dari Rp.5001 menjadi Rp.500 pada bahan cutting', '2022-04-28 00:27:42', 'IFRH');

-- --------------------------------------------------------

--
-- Table structure for table `update_jumlah_kp`
--

CREATE TABLE `update_jumlah_kp` (
  `id` int(10) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `old_val` int(11) NOT NULL,
  `new_val` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `update_history`
--
ALTER TABLE `update_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account-username` (`user`);

--
-- Indexes for table `update_jumlah_kp`
--
ALTER TABLE `update_jumlah_kp`
  ADD KEY `update-id` (`id`),
  ADD KEY `updated-item` (`kode_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `update_history`
--
ALTER TABLE `update_history`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `update_history`
--
ALTER TABLE `update_history`
  ADD CONSTRAINT `account-username` FOREIGN KEY (`user`) REFERENCES `accounts` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `update_jumlah_kp`
--
ALTER TABLE `update_jumlah_kp`
  ADD CONSTRAINT `update-id` FOREIGN KEY (`id`) REFERENCES `update_history` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `updated-item` FOREIGN KEY (`kode_barang`) REFERENCES `kaos_polos` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
