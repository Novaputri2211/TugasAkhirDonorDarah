-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2021 at 12:44 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_donor_darah`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `username`, `password`, `token`) VALUES
(4, 'novaputri', '123456', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pendonor`
--

CREATE TABLE `tb_pendonor` (
  `id_pendonor` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_pendonor` varchar(255) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `umur` int(11) NOT NULL,
  `jekel` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `gol_darah` varchar(5) NOT NULL,
  `bb` double NOT NULL,
  `tensi` varchar(25) NOT NULL,
  `kadar_hb` varchar(25) NOT NULL,
  `tanggal_donor` date NOT NULL,
  `jlh_kantong` int(11) NOT NULL,
  `konfirmasi` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pendonor`
--

INSERT INTO `tb_pendonor` (`id_pendonor`, `id_user`, `nama_pendonor`, `tempat_lahir`, `tgl_lahir`, `umur`, `jekel`, `alamat`, `lat`, `lng`, `no_hp`, `gol_darah`, `bb`, `tensi`, `kadar_hb`, `tanggal_donor`, `jlh_kantong`, `konfirmasi`) VALUES
(11, 10, 'fadil', 'mo', '2021-09-12', 99, 'Laki-Laki', '3FP8+C9P, Limau Manis, Pauh, Padang City, West Sumatra 25175, Indonesia', '-0.913815', '100.4659471', '08522323164', 'O', 99, 'oo', '999', '2021-09-30', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_stock_darah`
--

CREATE TABLE `tb_stock_darah` (
  `id_stock_darah` int(11) NOT NULL,
  `gol_darah` varchar(5) NOT NULL,
  `jlh_kantong_darah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_stock_darah`
--

INSERT INTO `tb_stock_darah` (`id_stock_darah`, `gol_darah`, `jlh_kantong_darah`) VALUES
(1, 'A', 0),
(2, 'B', 0),
(3, 'AB', 0),
(4, 'O', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama`, `email`, `jenis_kelamin`, `username`, `password`, `token`) VALUES
(10, 'fadil', 'novaputri422@gmail.com', 'Laki-Laki', 'fadil', '$2y$10$wBrHOia4nZdTFKZNnHQFF.tauFZQOMVFMZgQLDZo2ZqmULhPwD2wK', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xNzIuMjUuNDEuMjJcL2RiX2Rvbm9yX2RhcmFoIiwiYXVkIjoiaHR0cDpcL1wvMTcyLjI1LjQxLjIyXC9kYl9kb25vcl9kYXJhaCIsImlhdCI6MTYzMTUyMTk4MCwiZXhwIjoxNjMxNTI1NTgwLCJkYXRhIjp7InVzZXJfaWQiOiIxMCJ9fQ._eMFAv5tB2jX-7v6UL_69MylYrIQZ5yG0aZzZkWogJg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_pendonor`
--
ALTER TABLE `tb_pendonor`
  ADD PRIMARY KEY (`id_pendonor`);

--
-- Indexes for table `tb_stock_darah`
--
ALTER TABLE `tb_stock_darah`
  ADD PRIMARY KEY (`id_stock_darah`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_pendonor`
--
ALTER TABLE `tb_pendonor`
  MODIFY `id_pendonor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_stock_darah`
--
ALTER TABLE `tb_stock_darah`
  MODIFY `id_stock_darah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
