-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Bulan Mei 2023 pada 18.14
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coba`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(125) NOT NULL,
  `kategori_buku` varchar(125) NOT NULL,
  `penerbit_buku` varchar(125) NOT NULL,
  `pengarang` varchar(125) NOT NULL,
  `tahun_terbit` varchar(125) NOT NULL,
  `isbn` int(50) NOT NULL,
  `j_buku_baik` int(125) NOT NULL,
  `j_buku_rusak` int(125) NOT NULL,
  `image` varchar(100) NOT NULL,
  `pdf` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `kategori_buku`, `penerbit_buku`, `pengarang`, `tahun_terbit`, `isbn`, `j_buku_baik`, `j_buku_rusak`, `image`, `pdf`) VALUES
(31, 'Ilmu Pengetahuan Sosial untuk SMP Kelas VII', 'Pelajaran', 'Pusat Kurikulum dan Perbukuan', 'M. Nursa’ban, Supardi, Mohammad Rizky Satria, Sari Oktafiana', '2022', 2147483647, 45, 5, 'buku_ips_0e11e.png', 'pdf_ips_0e11e.pdf'),
(33, 'Matematika (VII)', 'Pelajaran', 'Pusat Kurikulum dan Perbukuan', 'Tim Gakko Tosho', '2022', 392, 50, 0, 'buku_matematika__vii__e4249.png', 'pdf_matematika__vii__e4249.pdf'),
(34, 'Ilmu Pengetahuan Alam untuk SMP Kelas VII', 'Pelajaran', 'Pusat Kurikulum dan Perbukuan', 'Budiyanti Dwi Hardanie, Victoriani Inabuy, Cece Sutia, Okky Fajar Tri Maryana, Sri Handayani Lestari', '2022', 2147483647, 50, 0, 'buku_ilmu_pengetahuan_alam_untuk_smp_kelas_vii_75849.png', 'pdf_ilmu_pengetahuan_alam_untuk_smp_kelas_vii_75849.pdf'),
(40, 'wizard oz', 'Novel', 'PT Gramedia Pustaka Utama', 'L. Frank Baum', '2010', 55662211, 10, 0, 'buku_wizard_oz_0817d.jpg', 'pdf_wizard_oz_0817d.pdf'),
(43, 'Penjaskes Kelas VII', 'Pelajaran', 'Pusat Kurikulum dan Perbukuan', 'Rudi Ahmad Suryadi, Sumiyati', '2022', 16625373, 10, 5, 'buku_penjaskes_kelas_vii_28f12.png', 'pdf_penjaskes_kelas_vii_28f12.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `identitas`
--

CREATE TABLE `identitas` (
  `id_identitas` int(11) NOT NULL,
  `nama_app` varchar(50) NOT NULL,
  `alamat_app` text NOT NULL,
  `email_app` varchar(125) NOT NULL,
  `nomor_hp` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `identitas`
--

INSERT INTO `identitas` (`id_identitas`, `nama_app`, `alamat_app`, `email_app`, `nomor_hp`) VALUES
(1, 'Perpus 35 GO GO', 'Jl. Dago pojok No. 12, Dago, Kec Coblong, Kota Bandung', 'perpus35@gmail.com', '0812223313');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `kode_kategori` varchar(50) NOT NULL,
  `nama_kategori` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kode_kategori`, `nama_kategori`) VALUES
(2, 'KT-001', 'Pelajaran'),
(3, 'KT-002', 'Komik'),
(4, 'KT-003', 'Novel');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemberitahuan`
--

CREATE TABLE `pemberitahuan` (
  `id_pemberitahuan` int(11) NOT NULL,
  `isi_pemberitahuan` varchar(255) NOT NULL,
  `level_user` varchar(125) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pemberitahuan`
--

INSERT INTO `pemberitahuan` (`id_pemberitahuan`, `isi_pemberitahuan`, `level_user`, `status`) VALUES
(1, '<i class=\'fa fa-exchange\'></i> #Aditya Daffa Rahmadani Telah meminjam Buku', 'Admin', 'Sudah dibaca'),
(2, '<i class=\'fa fa-repeat\'></i> #Aditya Daffa Rahmadani Telah mengembalikan Buku', 'Admin', 'Sudah dibaca'),
(3, '<i class=\'fa fa-exchange\'></i> #Adam Malik Telah meminjam Buku', 'Admin', 'Belum dibaca'),
(4, '<i class=\'fa fa-exchange\'></i> #Adam Malik Telah meminjam Buku', 'Admin', 'Belum dibaca'),
(5, '<i class=\'fa fa-repeat\'></i> #Adam Malik Telah mengembalikan Buku', 'Admin', 'Belum dibaca'),
(6, '<i class=\'fa fa-exchange\'></i> #Aditya Telah meminjam Buku', 'Admin', 'Sudah dibaca'),
(7, '<i class=\'fa fa-repeat\'></i> #Aditya Telah mengembalikan Buku', 'Admin', 'Belum dibaca');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `nama_anggota` varchar(125) NOT NULL,
  `judul_buku` varchar(125) NOT NULL,
  `tanggal_peminjaman` varchar(125) NOT NULL,
  `tanggal_pengembalian` varchar(50) NOT NULL,
  `kondisi_buku_saat_dipinjam` varchar(125) NOT NULL,
  `kondisi_buku_saat_dikembalikan` varchar(125) NOT NULL,
  `denda` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `nama_anggota`, `judul_buku`, `tanggal_peminjaman`, `tanggal_pengembalian`, `kondisi_buku_saat_dipinjam`, `kondisi_buku_saat_dikembalikan`, `denda`) VALUES
(1, 'Aditya Daffa Rahmadani', 'OP 96', '14-11-2022', '15-11-2022', 'Baik', 'Rusak', 'Rp 20.000'),
(2, 'Adam Malik', 'Ilmu Pengetahuan Sosial untuk SMP Kelas VII', '20-12-2022', '26-01-2023', 'Baik', 'Baik', 'Tidak ada'),
(3, 'Adam Malik', 'Pendidikan Kepercayaan Terhadap Tuhan Yang Maha Esa dan Budi Pekerti untuk SMP Kelas VII', '20-12-2022', '', 'Baik', '', ''),
(4, 'Aditya', 'Ilmu Pengetahuan Sosial untuk SMP Kelas VII', '26-01-2023', '', 'Baik', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(11) NOT NULL,
  `kode_penerbit` varchar(125) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL,
  `verif_penerbit` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `kode_penerbit`, `nama_penerbit`, `verif_penerbit`) VALUES
(2, 'P001', 'Weekly Shounen Jump', 'Terverifikasi'),
(3, 'P002', 'Pusat Kurikulum dan Perbukuan', 'Terverifikasi'),
(4, 'P003', 'PT Gramedia Pustaka Utama', 'Terverifikasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(11) NOT NULL,
  `penerima` varchar(50) NOT NULL,
  `pengirim` varchar(50) NOT NULL,
  `judul_pesan` varchar(50) NOT NULL,
  `isi_pesan` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `tanggal_kirim` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `penerima`, `pengirim`, `judul_pesan`, `isi_pesan`, `status`, `tanggal_kirim`) VALUES
(2, 'Administrator', 'Aditya Daffa Rahmadani', 'Greeting', 'halooo', 'Sudah dibaca', '15-11-2022'),
(3, 'Aditya Daffa Rahmadani', 'Administrator 2', 'Pengembalian', 'Balikin buku nya OI OI OI', 'Sudah dibaca', '19-12-2022'),
(4, 'Adam Malik', 'Administrator 2', 'Pengembalian', 'Sudah Memasuki Jadwal Pengembalin Buku ', 'Belum dibaca', '20-12-2022'),
(5, 'Administrator', 'Aditya', 'Greeting', 'hallo\r\n', 'Belum dibaca', '26-01-2023'),
(6, 'Aditya Daffa Rahmadani', 'Administrator 2', 'Greeting', 'Hallo', 'Belum dibaca', '26-01-2023');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `kode_user` varchar(25) NOT NULL,
  `nis` char(20) NOT NULL,
  `fullname` varchar(125) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `verif` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `join_date` varchar(125) NOT NULL,
  `terakhir_login` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `kode_user`, `nis`, `fullname`, `username`, `password`, `kelas`, `alamat`, `verif`, `role`, `join_date`, `terakhir_login`) VALUES
(1, '-', '-', 'Administrator 1', 'admin', 'admin', '-', '-', 'Iya', 'Admin', '04-05-2021', '22-05-2023 ( 22:56:10 )'),
(3, 'AP001', '152019101', 'Aditya Daffa Rahmadani', 'adit', 'mamatvstris', 'IX - 3', 'Jl. Sukamantri', 'Tidak', 'Anggota', '14-11-2022', '12-01-2023 ( 09:49:33 )'),
(4, 'AP002', '0500110', 'Adam Malik', 'adam', 'adammalik', 'VII - 1', 'Jl. Cijerah Blok 20', 'Tidak', 'Anggota', '19-12-2022', '11-01-2023 ( 22:07:55 )'),
(5, 'AP003', '0500111', 'Kurniawan Wahid', 'wahid', 'kurniawan', 'VII - 1', 'Jl. Kebon Kopi No 20', 'Tidak', 'Anggota', '19-12-2022', ''),
(6, 'AP004', '0500112', 'Muhammad Kante', 'mhmmd', 'kankankan', 'VII - 1', 'Jl. Paris No 105', 'Tidak', 'Anggota', '19-12-2022', ''),
(7, 'AP005', '0500113', 'Evelyn', 'eve', 'lynlyn', 'VII - 2', 'Jl. Dago Atas No 22', 'Tidak', 'Anggota', '19-12-2022', '05-01-2023 ( 12:47:47 )'),
(8, 'AP006', '0500114', 'Natalia Shawn', 'nath', 'lialia', 'VII - 2', 'Jl. CIkutra No 50', 'Tidak', 'Anggota', '19-12-2022', ''),
(10, 'AP007', '', 'Deris Masum', 'deris', 'risris', '', '', 'Tidak', 'Anggota', '05-01-2023', ''),
(11, 'AP008', '123456', 'Aditya', 'dits', '123456', 'VII - 2', 'komplek Margaasih, Kab. Bandung', 'Tidak', 'Anggota', '26-01-2023', '26-01-2023 ( 07:11:20 )');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `identitas`
--
ALTER TABLE `identitas`
  ADD PRIMARY KEY (`id_identitas`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  ADD PRIMARY KEY (`id_pemberitahuan`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`);

--
-- Indeks untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indeks untuk tabel `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `identitas`
--
ALTER TABLE `identitas`
  MODIFY `id_identitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  MODIFY `id_pemberitahuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id_penerbit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
