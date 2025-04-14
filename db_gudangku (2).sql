-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2025 at 06:12 PM
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
-- Database: `db_gudangku`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `BarangID` int(11) NOT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `kategori` enum('Parfurm Perempuan','Parfurm laki laki') DEFAULT NULL,
  `tanggal_masuk` date NOT NULL,
  `harga_barang` decimal(10,2) NOT NULL DEFAULT 0.00,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`BarangID`, `nama_barang`, `jumlah_barang`, `kategori`, `tanggal_masuk`, `harga_barang`, `UserID`) VALUES
(39, 'farfum', 2, 'Parfurm laki laki', '2025-02-28', 100000.00, NULL),
(41, 'biore', 3, 'Parfurm Perempuan', '2025-03-07', 20000.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `distribusi`
--

CREATE TABLE `distribusi` (
  `DistributorID` int(11) NOT NULL,
  `nama_toko` varchar(20) DEFAULT NULL,
  `TokoID` int(11) DEFAULT NULL,
  `BarangID` int(11) DEFAULT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `tgl_keluar` date NOT NULL,
  `jml_barang_keluar` int(100) NOT NULL,
  `harga_barang` decimal(10,0) NOT NULL,
  `sub_total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `distribusi`
--

INSERT INTO `distribusi` (`DistributorID`, `nama_toko`, `TokoID`, `BarangID`, `nama_barang`, `tgl_keluar`, `jml_barang_keluar`, `harga_barang`, `sub_total`) VALUES
(6, 'blibli', NULL, NULL, 'makarizo', '2025-03-14', 1, 50000, 50000),
(7, 'tokopedia', NULL, NULL, 'biore', '2025-03-14', 3, 20000, 60000),
(8, 'scarlet', NULL, NULL, 'scarlet', '2025-03-14', 2, 50000, 100000),
(9, 'makarizo store', NULL, NULL, 'makarizo', '2025-03-14', 1, 50000, 50000),
(10, 'americano beauty', NULL, NULL, 'farfum', '2025-03-14', 5, 100000, 500000);

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `TokoID` int(11) NOT NULL,
  `nama_toko` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`TokoID`, `nama_toko`) VALUES
(1, 'tefa'),
(2, 'alfamidi');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `username`, `email`, `password`) VALUES
(1, 'Pak Asep', 'asep@gmail.com', 'wokwok'),
(2, 'audia', 'audiacantik@gmail.com', '2401');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`BarangID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `distribusi`
--
ALTER TABLE `distribusi`
  ADD PRIMARY KEY (`DistributorID`),
  ADD KEY `BarangID` (`BarangID`),
  ADD KEY `TokoID` (`TokoID`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`TokoID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `BarangID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `distribusi`
--
ALTER TABLE `distribusi`
  MODIFY `DistributorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `distribusi`
--
ALTER TABLE `distribusi`
  ADD CONSTRAINT `distribusi_ibfk_1` FOREIGN KEY (`TokoID`) REFERENCES `toko` (`TokoID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
