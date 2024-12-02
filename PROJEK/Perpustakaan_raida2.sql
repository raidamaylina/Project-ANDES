-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2024 at 09:30 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Database: `perpustakaan_raida`

-- --------------------------------------------------------
-- Table structure for table `anggota`
-- --------------------------------------------------------

CREATE TABLE `anggota` (
  `ID_Anggota` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_anggota` varchar(100) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `Nomor_telepon` varchar(20) NOT NULL,
  `Tanggal_Bergabung` date NOT NULL,
  PRIMARY KEY (`ID_Anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `buku`
-- --------------------------------------------------------

CREATE TABLE `buku` (
  `ID_Buku` int(11) NOT NULL AUTO_INCREMENT,
  `Judul` varchar(255) NOT NULL,
  `Pengarang` varchar(100) NOT NULL,
  `Penerbit` varchar(100) NOT NULL,
  `Tahun_Terbit` year NOT NULL,
  `Kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `petugas`
-- --------------------------------------------------------

CREATE TABLE `petugas` (
  `ID_Petugas` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Petugas` varchar(100) NOT NULL,
  `Shift` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Petugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `peminjaman`
-- --------------------------------------------------------

CREATE TABLE `peminjaman` (
  `ID_Peminjaman` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Anggota` int(11) NOT NULL,
  `ID_Buku` int(11) NOT NULL,
  `ID_Petugas` int(11) NOT NULL,
  `Tgl_pinjam` date NOT NULL,
  `Tgl_Kembali` date NOT NULL,
  PRIMARY KEY (`ID_Peminjaman`),
  FOREIGN KEY (`ID_Anggota`) REFERENCES `anggota`(`ID_Anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`ID_Buku`) REFERENCES `buku`(`ID_Buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`ID_Petugas`) REFERENCES `petugas`(`ID_Petugas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;
