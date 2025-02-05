-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Agu 2024 pada 03.51
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skinsolve`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `makanan`
--

CREATE TABLE `makanan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `nutrisi` text DEFAULT NULL,
  `manfaat` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `makanan`
--

INSERT INTO `makanan` (`id`, `nama`, `nutrisi`, `manfaat`, `gambar`) VALUES
(1, 'Lemon', 'Vitamin C', 'Mencerahkan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/1.png'),
(2, 'Minyak Zaitun', 'Vitamin E. Vitamin K. Serat Pangan. Asam Lemak', 'Menghidrasi. Antioksidan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/2.png'),
(3, 'Jambu biji', 'Vitamin C', 'Mencerahkan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/3.png'),
(4, 'Delima', 'Antioksidan', 'Menghidrasi. Antioksidan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/4.png'),
(5, 'Sayur Mustard', 'Mineral Esensial', 'Menghidrasi', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/5.png'),
(6, 'Mentimun', 'Mineral. Antioksidan', 'Menghidrasi. Menenangkan. Antioksidan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/6.png'),
(7, 'Jeruk', 'Vitamin C', 'Menghidrasi. Anti-inflamasi. Antibakteri. Mengontrol minyak. Mencerahkan kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/7.png'),
(8, 'Pisang', 'Vitamin B. Vitamin C. Antioksidan', 'Menghidrasi. Melembapkan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/8.png'),
(9, 'Alpukat', 'Vitamin E', 'Menghidrasi. Antioksidan. Melembapkan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/9.png'),
(10, 'Kacang-kacangan', 'Vitamin E', 'Menghidrasi. Antioksidan. Melembapkan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/10.png'),
(11, 'Kopi', 'Antioksidan', 'Anti-inflamasi. Antibakteri. Pengontrol minyak', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/11.png'),
(12, 'Salmon', 'Asam Lemak Omega-3', 'Melembapkan. Anti-inflamasi. Memperbaiki kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/12.png'),
(13, 'Ubi Jalar', 'Beta-karoten. Vitamin A', 'Anti-penuaan. Pembaruan kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/13.png'),
(14, 'Bayam', 'Vitamin A. Vitamin C. Vitamin K. Vitamin E. Vitamin B. Mineral', 'Detoksifikasi. Anti-inflamasi. Perbaikan kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/14.png'),
(15, 'Blueberry', 'Antioksidan', 'Anti-penuaan. Pencerah kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/15.png'),
(16, 'Teh Hijau', 'Polifenol. Antioksidan', 'Anti-inflamasi. Anti-penuaan. Perbaikan kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/16.png'),
(17, 'Kacang Almond', 'Vitamin E. Vitamin B2. Antioksidan', 'Menghidrasi. Anti-inflamasi. Pembaruan kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/17.png'),
(18, 'Kale', 'Vitamin A. Vitamin K. Vitamin C', 'Detoksifikasi. Anti-inflamasi. Mencerahkan kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/18.png'),
(19, 'Pepaya', 'Vitamin C. Vitamin A. Enzim', 'Mengelupas. Anti-inflamasi. Mencerahkan kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/19.png'),
(20, 'Stroberi', 'Vitamin C. Antioksidan', 'Anti-penuaan. Pencerah kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/20.png'),
(21, 'Wortel', 'Beta-karoten. Vitamin A', 'Anti-penuaan. Pembaruan kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/21.png'),
(22, 'Tomat', 'Vitamin C. Likopen. Antioksidan', 'Anti-inflamasi. Mencerahkan kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/22.png'),
(23, 'Brokoli', 'Vitamin C. Vitamin K. Antioksidan', 'Detoksifikasi. Anti-inflamasi. Perbaikan kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/23.png'),
(24, 'Kiwi', 'Vitamin C. Vitamin K. Antioksidan', 'Menghidrasi. Anti-inflamasi. Pembaruan kulit', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/24.png'),
(25, 'Kacang kenari', 'Asam Lemak Omega-3', 'Melembapkan. Anti-inflamasi', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/25.png'),
(26, 'Semangka', 'Mineral', 'Menghidrasi. Melembapkan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/26.png'),
(27, 'Seledri', 'Mineral', 'Menghidrasi. Melembapkan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/27.png'),
(28, 'Minyak Kelapa', 'Asam lemak rantai menengah', 'Melembapkan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/28.png'),
(29, 'Sarden', 'Asam Lemak Omega-3', 'Mengurangi Peradangan. Mengontrol Minyak', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/29.png'),
(30, 'Oatmeal', 'Serat. Karbohidrat', 'Menenangkan. Mengurangi Jerawat', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/30.png'),
(31, 'Susu', 'Vitamin D', 'Dukung Kesehatan Kulit Secara Keseluruhan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/31.png'),
(32, 'Yogurt', 'Kalsium. Vitamin D', 'Dukung Kesehatan Kulit Secara Keseluruhan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/32.png'),
(33, 'Air', 'Mineral', 'Menghidrasi. Melembapkan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/33.png'),
(34, 'Chamomile', 'Vitamin C', 'Menenangkan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/34.png'),
(35, 'Madu', 'Antioksidan', 'Melembapkan', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/35.png'),
(36, 'Kubis', 'Vitamin C. Vitamin K. Antioksidan', 'Menenangkan Anti-Inflamasi', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/36.png'),
(37, 'Kakao/Biji Coklat', 'Antioksidan', 'Antioksidan. Menghidrasi', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/37.png'),
(38, 'Nanas', 'Vitamin C', 'Anti-Inflamasi', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/38.png'),
(39, 'Mangga', 'Vitamin C. Vitamin A', 'Antioksidan. Menghidrasi', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/makanan/39.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `makanan_tipe_skin`
--

CREATE TABLE `makanan_tipe_skin` (
  `id` int(11) NOT NULL,
  `id_makanan` int(11) DEFAULT NULL,
  `id_tipe_skin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `makanan_tipe_skin`
--

INSERT INTO `makanan_tipe_skin` (`id`, `id_makanan`, `id_tipe_skin`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 2),
(7, 6, 1),
(8, 6, 4),
(9, 6, 5),
(10, 6, 3),
(11, 7, 2),
(12, 7, 1),
(13, 7, 4),
(14, 7, 3),
(15, 8, 2),
(16, 8, 1),
(17, 8, 4),
(18, 8, 5),
(19, 8, 3),
(20, 9, 1),
(21, 9, 3),
(22, 10, 1),
(23, 10, 3),
(24, 11, 2),
(25, 11, 4),
(26, 11, 3),
(27, 12, 2),
(28, 12, 1),
(29, 12, 4),
(30, 12, 5),
(31, 12, 3),
(32, 13, 1),
(33, 13, 4),
(34, 13, 5),
(35, 13, 3),
(36, 14, 1),
(37, 14, 4),
(38, 14, 5),
(39, 14, 3),
(40, 15, 2),
(41, 15, 1),
(42, 15, 4),
(43, 15, 5),
(44, 15, 3),
(45, 16, 2),
(46, 16, 4),
(47, 16, 5),
(48, 16, 3),
(49, 17, 1),
(50, 17, 3),
(51, 18, 1),
(52, 18, 4),
(53, 18, 5),
(54, 18, 3),
(55, 19, 2),
(56, 19, 1),
(57, 19, 4),
(58, 19, 3),
(59, 20, 2),
(60, 20, 1),
(61, 20, 4),
(62, 20, 5),
(63, 20, 3),
(64, 21, 1),
(65, 21, 4),
(66, 21, 5),
(67, 21, 3),
(68, 22, 2),
(69, 22, 1),
(70, 22, 4),
(71, 22, 5),
(72, 22, 3),
(73, 23, 1),
(74, 23, 4),
(75, 23, 5),
(76, 23, 3),
(77, 24, 2),
(78, 24, 1),
(79, 24, 4),
(80, 24, 5),
(81, 24, 3),
(82, 25, 2),
(83, 25, 1),
(84, 26, 1),
(85, 27, 1),
(86, 28, 1),
(87, 29, 2),
(88, 30, 4),
(89, 31, 3),
(90, 32, 3),
(91, 33, 2),
(92, 33, 1),
(93, 33, 4),
(94, 33, 5),
(95, 33, 3),
(96, 34, 5),
(97, 34, 2),
(98, 34, 3),
(99, 35, 5),
(100, 35, 3),
(101, 36, 5),
(102, 36, 3),
(103, 36, 1),
(104, 37, 5),
(105, 37, 1),
(106, 38, 5),
(107, 38, 2),
(108, 38, 3),
(109, 39, 1),
(110, 39, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `tipe` varchar(50) DEFAULT NULL,
  `komposisi` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `brand`, `tipe`, `komposisi`, `gambar`) VALUES
(1, 'Neutrogena Oil-Free Acne Wash', 'Neutrogena', 'Facewash', 'Salicylic Acid. Water. Sodium C14-16 Olefin Sulfonate. Cocamidopropyl Betaine. Sodium Chloride. PEG-80 Sorbitan Laurate. C12-15 Alkyl Lactate. Benzalkonium Chloride. Disodium EDTA. Fragrance. Cocamidopropyl Pg-Dimonium Chloride Phosphate. Propylene Glycol. Aloe Barbadensis Leaf Extract. Anthemis Nobilis Flower Extract. Chamomilla Recutita (Matricaria) Flower Extract. Sodium Hydroxide. Citric Acid. Yellow 5. Red 40', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/1.png'),
(2, 'HADA LABO Gokujyun Premium Ultimate Moisturizing Lotion', 'Hada Labo', 'Toner', 'Aqua (Water). Butylene Glycol. PPG-10 Methyl Glucose Ether. Hydroxyethyl Urea. Diglycerin. PEG-32. Triethyl Citrate. Glycosyl Trehalose. Urea. Sorbitol. Carbomer. PEG-75. Diethoxyethyl Succinate. Phenoxyethanol. Disodium Succinate. Sodium Hyaluronate. Potassium Hydroxide. Polyquaternium-51. Hexylglycerin. Disodium EDTA. Succinic Acid. Hydrolyzed Hyaluronic Acid. Sodium Acetylated Hyaluronate. Ammonium Acrylates Crosspolymer. Hydroxypropyltrimonium Hyaluronate. Pentylene Glycol. Sodium Hyaluronate Crosspolymer. Methylparaben', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/2.png'),
(3, 'Cerave Moisturizing Cream', 'Hada Labo', 'Moisturizer', 'Aqua. Glycerin. Cetearyl Alcohol. Caprylic/?Capric Triglyceride. Cetyl Alcohol. Ceteareth-20. Ceramide NP. Ceramide AP. Ceramide EOP. Phytosphingosine. Cholesterol. Hyaluronic Acid. Sodium Lauroyl Lactylate. Dimethicone. Petrolatum. Behentrimonium Methosulfate. Potassium Phosphate. Dipotassium Phosphate. Phenoxyethanol. Methylparaben. Propylparaben. Disodium EDTA. Carbomer. Xanthan Gum', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/3.png'),
(4, 'CeraVe Hydrating Cream-to-Foam Cleanser', 'Cerave', 'Facewash', 'Aqua/?Water/?Eau. Glycerin. Sodium Methyl Cocoyl Taurate. Coco-Betaine. Sodium Cocoyl Isethionate. Sodium Chloride. Pca. PPG-5-Ceteth-20. PEG-100 Stearate. PEG-150 Pentaerythrityl Tetrastearate. PEG-6 Caprylic/?Capric Glycerides. PEG-30 Dipolyhydroxystearate. Ci 77891/?Titanium Dioxide. Aspartic Acid. Ceramide NP. Ceramide AP. Ceramide EOP. Sorbitan Isostearate. Carbomer. Glycol Distearate. Glyceryl Stearate. Glyceryl Oleate. Glycine. Trideceth-6. Cetearyl Alcohol. Behentrimonium Methosulfate. Threonine. Sodium Hydroxide. Salicylic Acid. Sodium PCA. Sodium Lactate. Arginine. Sodium Lauroyl Lactylate. Serine. Sodium Benzoate. Valine. Sodium Hyaluronate. Proline. Isoleucine. Cholesterol. Phenoxyethanol. Alanine. Phenylalanine. Coconut Acid. Coco-Glucoside. Chlorphenesin. Disodium EDTA. Hydroxyethyl Urea. Citric Acid. Hydroxyethyl Acrylate/?Sodium Acryloyldimethyl Taurate Copolymer. Caprylyl Glycol. Phytosphingosine. Xanthan Gum. Histidine. Acrylates/?C10-30 Alkyl Acrylate Crosspolymer. Polyquaternium-53. Polyquaternium-39. Polysorbate 60. Ethylhexylglycerin. Benzoic Acid', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/4.png'),
(5, 'SKINTIFIC Ultra Light Serum Sunscreen', 'Skintific', 'Sunscreen', 'Water. Cyclopentasiloxane. Homosalate. Butylene Glycol. Caprylyl Methicone. Ethylhexyl Salicylate. Dibutyl Adipate. Disiloxane. Methyl Methacrylate Crosspolymer. Ferulic Acid. Ascorbic Acid. Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine. Ceramide AP. Ceramide AS. Ceramide NS. Ceramide NG. Ceramide EOP. Sodium Hyaluronate. Sodium Hyaluronate Crosspolymer. Hydrolyzed Sodium Hyaluronate. Diethylamino Hydroxybenzoyl Hexyl Benzoate. 1.2-Hexanediol. Polymethylsilsesquioxane. Dimethicone. Lauryl PEG-10 Tris(Trimethylsiloxy)silylethyl Dimethicone. Magnesium Sulfate. Stearic Acid. Aluminum Hydroxide. Sorbitan Caprylate. Silica Dimethyl Silylate. Glyceryl Caprylate. Cetearyl Dimethicone Crosspolymer. Ethylhexylglycerin. Tocopheryl Acetate. Glycerin. Hydrogenated Lecithin. Ceramide NP. Tocopherol. Dipropylene Glycol. Pentylene Glycol. Glyceryl Stearate. Sucrose Distearate. Ficus Carica (Fig) Fruit Extract. Centella Asiatica Extract. Sodium Acetylated Hyaluronate. Cholesterol', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/5.png'),
(6, 'Cetaphil Gentle Cleanser', 'Cetaphil', 'Facewash', 'Water. Glycerin. Cetearyl Alcohol. Panthenol. Niacinamide. Pantolactone. Xanthan Gum. Sodium Cocoyl Isethionate. Sodium Benzoate. Citric Acid', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/6.png'),
(7, 'Cerave Foaming Facial Cleanser', 'Cerave', 'Facewash', 'Purified Water. Glycerin. Behentrimonium Methosulfate. Cetearyl Alcohol. Ceramide 3. Ceramide 6 II. Ceramide 1. Hyaluronic Acid. Cholesterol. Polyoxyl 40 Stearate. Glyceryl Monostearate. Stearyl Alcohol. Polysorbate 20. Potassium Phosphate. Dipotassium Phosphate. Sodium Lauroyl Lactylate. Cetyl Alcohol. Disodium EDTA. Phytosphingosine. Methylparaben. Propylparaben. Carbomer. Xanthan Gum', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/7.png'),
(8, 'Senka Perfect Whip Acne Care', 'Senka', 'Facewash', 'Water (Aqua). Stearic Acid. Myristic Acid. PEG-8. Potassium Hydroxide. Lauric Acid. Glycerin. Dipropylene Glycol. Alcohol. Salicylic Acid. Beeswax (Cera Alba). Polyquaternium-7. Fragrance (Parfum). Disodium EDTA. PEG-90M. Chromium Oxide Greens (Ci 77288). Sodium Benzoate. Sodium Metabisulfite. Sodium Metaphosphate. Iron Oxides (Ci 77492)?Iron Oxides (Ci 77491). PEG/?PPG-14/?7 Dimethyl Ether. Sodium Hyaluronate. Butylene Glycol. Sericin. Citric Acid. Potassium Sorbate. Sodium Acetylated Hyaluronate. Silica. BHT. Chamomilla Recutita (Matricaria) Flower Extract', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/8.png'),
(9, 'La Roche Posay Effaclar Purifying Foaming Gel ', 'La Roche Posay ', 'Facewash', 'Water. Sodium Laureth Sulfate. Peg-8. Coco-Betaine. Hexylene Glycol. Sodium Chloride. Peg-120 Methyl Glucose Dioleate. Zinc Pca. Sodium Hydroxide. Citric Acid. Sodium Benzoate. Phenoxyethanol. Caprylyl Glycol. Parfum/?Fragrance', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/9.png'),
(10, 'Emina Face Wash Ms Pimple Acne Solution', 'Emina', 'Facewash', 'Aqua. Propylene Glycol. Sodium Laureth Sulfate. Acrylates Copolymer. Hydroxyethylcellulose. Cocamidopropyl Betaine. Zinc Gluconate. Salicylic Acid. Triethanolamine. Dmdm Hydantoin. Sodium Chloride. Allantoin. Fragrance. Phenoxyethanol. Trideceth-9. PEG-40 Hydrogenated Castor Oil. Ethylhexylglycerin. Polysorbate 20. Ci 19140. Ci 42090', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/10.png'),
(11, 'Emina Bright Stuff Face Wash', 'Emina', 'Facewash', 'Myristic Acid. Glycerin. Aqua. Propylene Glycol. Potassium Hydroxide. Stearic Acid. Glycol Distearate. Lauric Acid. Decyl Glucoside. Glyceryl Stearate. PEG-7 Olive Glycerides. Niacinamide. Polyquaternium-7. Silica. Phenoxyethanol. Fragrance. Kaolin. Panthenol. Disodium EDTA. Ethylhexylglycerin. Butylene Glycol. Glycyrrhiza Glabra (Root) Extract. Actinidia Polygama Fruit Extract', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/11.png'),
(12, 'Safi White Expert Oil Control & Anti Acne Facial Cleanser', 'Safi', 'Facewash', 'Water. Sodium Laureth Sulfate. Glycerin. Acrylates Copolymer. Cocamidopropyl Betaine. Lauryl Glucoside. Potassium Cocoyl Glycinate. Polysorbate 20. Cocamide Methyl Mea. Mannitol. Menthol. PEG-14M. Sodium Hydroxide. Benzotriazolyl Dodecyl P-Cresol. Tetrasodium EDTA. Microcrystalline Cellulose. Zinc Lactate. Hydroxypropyl Methylcellulose. Tocopheryl Acetate. Melaleuca Alternifolia (Tea Tree) Leaf Oil. Nigella Sativa (Habbatus Sauda) Seed Oil. Perfluorodecalin. 4-Butylresorcinol. Fragrance. Methylchloroisothiazolinone. Methylisothiazolinone. Sodium Benzoate. Potassium Sorbate. Ci 12490', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/12.png'),
(13, 'Kind To Skin Refreshing Facial Gel Wash', 'Simple', 'Facewash', 'Aqua. Cocamidopropyl Betaine. Propylene Glycol. Hydroxypropyl Methylcellulose. Panthenol. Tocopheryl Acetate. Pantolactone. Sodium Hydroxide. Disodium EDTA. Sodium Hydroxymethylglycinate', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/13.png'),
(14, 'Hada Labo Gokujyun Ultimate Moisturizing Facewash', 'Hada Labo', 'Facewash', 'Aqua. Glycerin. Sodium Cocoyl Glycinate. Butylene Glycol. Hydroxypropyl Starch Phosphate. Cocamidopropyl Betaine. PEG-400. Decyl Stearate Se. Sodium Stearoyl Glutamate. Citric Acid. Lauric Acid. Stearic Acid. Methylparaben. PEG-32. BHT. Disodium EDTA. Propylparaben. Polyquaternium-7. Polyquaternium-52. Hydroxypropyl Methylcellulose. Hydroxypropyltrimonium Hyaluronate. Sodium Acetylated Hyaluronate', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/14.png'),
(15, 'COSRX Low PH Good Morning', 'COSRX', 'Facewash', 'Betula Platyphylla Japonica Juice. Butylene Glycol. Glycerin. Dimethicone. Betaine. Cetearyl Alcohol. 1.2-Hexanediol. Cetearyl Olivate. Sorbitan Olivate. Hydroxyethyl Acrylate. Sodium Acryloyldimethyl Taurate Copolymer. Sodium Lactate. Sodium Lactate. Ethylhexylglycerin. Sodium Hyaluronate. Allantoin. Panthenol. Xanthan Gum. Ethyl Hexanediol. Citrus Medica Limonum (Lemon) Peel Oil. Melaleuca Alternifolia (Tea Tree) Leaf Oil', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/15.png'),
(16, '5X Ceramide Soothing Toner Skintific', 'Skintific', 'Toner', 'Aqua. Butylene Glycol. Pentylene Glycol. Glycerin. Methyl Gluceth-20. Bifida Ferment Lysate. Hydrolyzed Sodium Hyaluronate. Centella Asiatica Extract. Dipotassium Glycyrrhizate. Ethylhexylglycerin. Ceramide NS. Ceramide NG. Ceramide AP. Ceramide AS. Ceramide NP. Ceramide EOP. Laminaria Digitata Extract. Sodium Acetylated Hyaluronate. Sodium Hyaluronate. Sodium Hyaluronate Crosspolymer. Tremella Fuciformis Sporocarp Extract. Calendula Officinalis Extract. Inulin. Alpha-Glucan Oligosaccharide. Ectoin. Collagen. Cholesterol. 1.2-Hexanediol. Sorbitol. Cetyl-PG Hydroxyethyl Palmitamide. Hydrogenated Lecithin. Hydroxyacetophenone', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/16.png'),
(17, 'Dear Klairs Supple Preparation Unscented Toner', 'Dear. Klairs', 'Toner', 'Water. Butylene Glycol. Dimethyl Sulfone. Betaine. Caprylic/?Capric Triglyceride. Natto Gum. Sodium Hyaluronate. Disodium Edta. Centella Asiatica Extract. Glycyrrhiza Glabra (Licorice) Root Extract. Polyquaternium-51. Chlorphenesin. Tocopheryl Acetate. Carbomer. Panthenol. Arginine. Luffa Cylindrica Fruit/?Leaf/?Stem Extract. Beta-Glucan. Althaea Rosea Flower Extract. Aloe Barbadensis Leaf Extract. Hydroxyethylcellulose. Portulaca Oleracea Extract. Lysine Hcl. Proline. Sodium Ascorbyl Phosphate. Acetyl Methionine. Theanine. Copper Tripeptide-1', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/17.png'),
(18, 'PYUNKANG YUL Facial Essence Toner', 'PYUNKANG YUL', 'Toner', 'Astragalus Membranaceus Root Extract. 1.2-Hexanediol. Butylene Glycol. Bis-Peg-18 Methyl Ether Dimethyl Silane. Hydroxyethylcellulose. Carbomer. Arginine', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/18.png'),
(19, 'COSRX AHA/BHA Clarifying Treatment Toner', 'COSRX', 'Toner', 'Mineral Water. Salix Alba (Willow) Bark Water. Pyrus Malus (Apple) Fruit Water. Butylene Glycol. 1.2-Hexanediol. Sodium Lactate. Glycolic Acid. Water. Betaine Salicylate. Allantoin. Panthenol. Ethyl Hexanediol', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/19.png'),
(20, 'I\'m from Rice Toner', 'I\'m from', 'Toner', 'Rice Extract. Methylpropanediol. Triethylhexanoin. Hydrogenated Poly (C6-14 Olefin). Niacinamide. Pentylene Glycol. Common Purslane Extract. Rice Bran Extract. Japanese Elm Bark Extract. Amaranthus Caudatus Seed Extract. Hydrogenated Lecithin. Distilled Water. Polyglyceryl-10-Myristate. Butylene Glycol. Adenosine. Cellulose Gum. Ethylhexylglycerin. 1.2-Hexanediol', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/20.png'),
(21, 'Anua Heartleaf 77% Soothing Toner', 'Anua', 'Toner', 'Houttuynia Cordata Extract (77%). Water. 1.2-Hexanediol. Glycerin. Betaine. Panthenol. Saccharum Officinarum (Sugar Cane) Extract. Portulaca Oleracea Extract. Butylene Glycol. Vitex Agnus Castus Extract. Chamomilla Recutita (Matricaria) Flower Extract. Arctium Lappa Root Extract. Phellinus Linteus Extract. Vitis Vinifera (Grape) Fruit Extract. Pyrus Malus (Apple) Fruit Extract. Centella Asiatica Extract. Isopentyldiol. Methylpropanediol. Acrylates/?C10-30 Alkyl Acrylate Crosspolymer. Tromethamine. Disodium EDTA', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/21.png'),
(22, 'NPURE Noni Probiotics \"Balance Me\" Fine Toner ', 'NPURE', 'Toner', 'Morinda Citrifolia Fruit Extract. Water. Caprylic/?Capric Triglyceride. Glycerin. 1.2-Hexanediol. Betaine. Pentaerythrityl Tetraethylhexanoate. Pentylene Glycol. Sodium Chloride. Butylene Glycol. Leuconostoc/?Radish Root Ferment Filtrate. Lactobacillus/?Soybean Ferment Extract. Lactobacillus Ferment. Lactobacillus/?Acerola Cherry Ferment. Lactococcus Ferment. Bifida Ferment Filtrate. Lactococcus Ferment Lysate. Lactobacillus/?Punica Granatum Fruit Ferment Extract. Lactobacillus Ferment Lysate. Bisabolol. Allantoin. Hydrogenated Lecithin. Sodium Citrate. Citric Acid. Trisodium Ethylenediamine Disuccinate. Ethylhexylglycerin. Ceramide NP. Chamomilla Recutita (Matricaria) Flower Extract. Caffeine', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/22.png'),
(23, 'Somethinc SUPPLE POWER Hyaluronic9+ Onsen Essence Toner', 'Somethinc', 'Toner', 'Onsen-Sui. Water. Niacinamide. Butylene Glycol. 1.2-Hexanediol. Dipropylene Glycol. Chondrus Crispus(Carrageenan) Extract. Caprylyl Glycol. Saccharum Officinarum (Sugarcane) Extract. Betaine. Sodium Citrate. Propanediol. Polyglyceryl-10 Laurate. Sodium Hyaluronate. Citric Acid. Adenosine. Allantoin. Hyaluronic Acid. Plumeria Alba (Frangipani) Flower Oil. Ethylhexylglycerin. Hydrolyzed Hyaluronic Acid. Hydroxypropyltrimonium Hyaluronate. Hydrolyzed Sodium Hyaluronate. Sodium Acetylated Hyaluronate. Caffeine. PEG-9 Diglycidyl Ether/?Sodium Hyaluronate Crosspolymer. Potassium Hyaluronate. Tocopherol. Dimethylsilanol Hyaluronate. Sodium Benzoate', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/23.png'),
(24, 'Avoskin Miraculous Refining Toner', 'Avoskin', 'Toner', 'Water. Glycerin. Glycolic Acid. Butylene Glycol. Propylene Glycol. Gluconolactone. Melaleuca Alternifolia (Tea Tree) Leaf Extract. Hamamelis Virginiana (Witch Hazel) Leaf Extract. Niacinamide. Chamomilla Recutita (Matricaria) Flower Extract. Rubus Idaeus (Raspberry Fruit) Extract. Citrus Limon (Lemon) Fruit Extract. Salicylic Acid. Acer Saccharum (Sugar Maple) Extract. Portulaca Oleracea Extract. Aloe Barbadensis Leaf Juice. Amylopectin. Dextrin. Xanthan Gum. Tetrasodium EDTA. Sodium Hydroxymethylglycinate. Polyglutamic Acid', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/24.png'),
(25, 'NACIFIC Real Floral Rose Toner', 'Nacific', 'Toner', 'Rosa Centifolia Flower Water. Butylene Glycol. Sodium Hyaluronate. Rose Extract. Propanediol. Butylene Glycol. Hydroxyacetophenone. 1.2-Hexanediol. Centella Asiatica Extract. Dipropylene Glycol. Melaleuca Alternifolia (Tea Tree) Extract. Rosmarinus Officinalis (Rosemary) Extract. Mentha Piperita (Peppermint) Leaf Extract. Cymbopogon Schoenanthus Extract. Lavandula Angustifolia (Lavender) Flower Extract. Chamomilla Recutita (Matricaria) Flower Extract. Chrysanthellum Indicum Extract. Allantoin. Rosa Centifolia Flower. Disodium EDTA. Dipotassium Glycyrrhizate. Phenoxyethanol', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/25.png'),
(26, 'ElsheSkin Deep Hydration Calming Moisturizer', 'ElsheSkin', 'Moisturizer', 'Aqua. Saccharide Isomerate. Schizophyllan. Pentylene Glycol. Butylene Glycol. Propanediol. Isononyl Isononanoate. Niacinamide. Xylitylglucoside. Anhydroxylitol. Xylitol. Laureth-3. Hydroxyethylcellulose. Acetyl Dipeptide-1 Cetyl Ester. Magnesium Aspartate. Zinc Gluconate. Copper Gluconate. Phenoxyethanol. Portulaca Oleracea Extract. Ceramide NP. PEG-7 Glyceryl Cocoate. Asiaticoside', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/26.png'),
(27, 'COSRX Hydrium Moisture Power Enriched Cream', 'COSRX', 'Moisturizer', 'Water. Glycerin. Ethylhexyl Stearate. Vinyl Dimethicone. Pentylene Glycol. Cocos Nucifera (Coconut) Oil. 1.2-Hexanediol. Cetearyl Alcohol. Panthenol. Polymethylsilsesquioxane. Arachidyl Alcohol. Propolis Extract. Hydroxyethyl Acrylate/?Sodium Acryloyldimethyl Taurate Copolymer. Polyglyceryl-6 Stearate. Butylene Glycol. Carbomer. Behenyl Alcohol. Glyceryl Stearate. Tromethamine. Dimethiconol. Caprylyl Glycol. Arachidyl Glucoside. Hydrogenated Lecithin. Ceramide NP. Ethylhexylglycerin. Xanthan Gum. Sucrose Stearate. Polyglyceryl-6 Behenate. Sodium Polyacrylate Starch. Stearic Acid. Palmitic Acid. Sodium Hyaluronate. Cholesterol. Hyaluronic Acid. Glycosphingolipids. Hydrolyzed Hyaluronic Acid', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/27.png'),
(28, 'Laneige Water Bank Blue Hyaluronic Cream Moisturizer', 'Laneige', 'Moisturizer', 'Water. Butylene Glycol. Glycerin. Squalane. Sucrose Polystearate. Pentaerythrityl Tetraethylhexanoate. Methyl Trimethicone. Dibutyl Adipate. 1. 2-Hexanediol. Glyceryl Stearate. Polyglyceryl-3 Methylglucose Distearate. Bis-Hydroxyethoxypropyl Dimethicone. Stearyl Dimethicone. Caprylic/?Capric/?Myristic/?Stearic Triglyceride. Stearic Acid. Palmitic Acid. Hydrogenated Polyisobutene. Hydroxyethyl Acrylate/?Sodium Acryloyldimethyl Taurate Copolymer. Cetyl Alcohol. Propanediol. Octadecene. Acrylates/?C10-30 Alkyl Acrylate Crosspolymer. Fragrance. Xanthan Gum. Glyceryl Caprylate. Dextrin. Tromethamine. Ethylhexylglycerin. Disodium EDTA. Sorbitan Isostearate. Allantoin. Hydrolyzed Hyaluronic Acid. Beta-Glucan. Ceramide NP. Myristic Acid. Arachidic Acid. Lactobacillus Ferment Lysate. Tocopherol. Undaria Pinnatifida Extract', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/28.png'),
(29, 'Cosrx Advanced Snail 92 All In One Cream', 'COSRX', 'Moisturizer', 'Snail Secretion Filtrate. Betaine. Caprylic/?Capric Triglyceride. Cetearyl Olivate. Sorbitan Olivate. Sodium Hyaluronate. Cetearyl Alcohol. Stearic Acid. Arginine. Dimethicone. Carbomer. Panthenol. Allantoin. Sodium Polyacrylate. Xanthan Gum. Ethyl Hexanediol. Adenosine. Phenoxyethano', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/29.png'),
(30, 'Klavuu The Origin Deep Ocean Gel Comforter', 'Klavuu', 'Moisturizer', 'Water. Dipropylene Glycol. Butylene Glycol. Propanediol. Glycereth-26. Betaine. 1.2-Hexanediol. Glycerin. Hexylene Glycol. Hydroxyacetophenone. Sodium Carbomer. Trehalose. Polyglyceryl-10 Myristate. Polyglyceryl-10 Laurate. Sea Water. Panthenol. Methyl Diisopropyl Propionamide. Disodium EDTA. Sodium Hyaluronate. Beta-Glucan. Melia Azadirachta Leaf Extract. Houttuynia Cordata Extract. Chondrus Crispus Extract. Maltodextrin. Melia Azadirachta Flower Extract. Hydrolyzed Vegetable Protein. Chlorella Vulgaris Extract. Hizikia Fusiforme Extract. Undaria Pinnatifida Extract. Laminaria Japonica Extract. Gelidium Cartilagineum Extract. Hydrolyzed Gardenia Florida Extract. Sea Salt. Cynanchum Atratum Extract', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/30.png'),
(31, 'SKINTIFIC 5% Panthenol Acne Calming Water Gel', 'SKINTIFIC', 'Moisturizer', 'Water. Panthenol. Methyl Gluceth-20. Dipropylene Glycol. Centella Asiatica Extract. Calendula Officinalis Extract. Avena Sativa (Oat) Kernel Extract. Phaeodactylum Tricornutum Extract. Chlorella Vulgaris Extract. Pentylene Glycol. Acrylates/?C10-30 Alkyl Acrylate Crosspolymer. Tromethamine. 1.2-Hexanediol. Ceramide NP. Ceramide AS. Ceramide NS. Ceramide NG. Ceramide AP. Ceramide EOP. Butylene Glycol. Glycerophosphoinositol Choline. Glycerin. Ammonium Acryloyldimethyltaurate/?VP Copolymer. Hydrogenated Lecithin. Ectoin. Tocopherol. Pentasodium Pentetate. Erythritol. Propanediol. Phytic Acid. Silver Oxide. Diethoxyethyl Succinate. Hydroxyphenyl Propamidobenzoic Acid. Lecithin. Sodium Ascorbate. Ascorbyl Palmitate', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/31.png'),
(32, 'Feat For Skin Skintuition Hydrating Gel Creme', 'Feat For Skin', 'Moisturizer', 'Aqua. Polyacrylamide. C13-14 Isoparaffin. Laureth-7. Aloe Vera. Glycerin. Ceratonia Siliqua (Carob) Seed Extract. Butylene Glycol. DMDM Hydantoin. Glycyrrhiza Glabra Root Extract. Triethanolamin. Propanediol. Citric Acid. Albatrellus Confluens (Mushroom) Extract. Sodium Hyaluronate. Bisabolol. Disodium EDTA.', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/32.png'),
(33, 'Somethinc Calm Down! Skinpair R-Cover Cream', 'Somethinc', 'Moisturizer', 'Water. Glycerin. Dicaprylyl Ether. Butylene Glycol. Hydrogenated Ethylhexyl Olivate. Pentylene Glycol. 1.2-Hexanediol. Panthenol. Hydrogenated Polydecene. Saccharide Isomerate. Hydroxyethyl Acrylate/?Sodium Acryloyldimethyl Taurate Copolymer. Acrylates/?C10-30 Alkyl Acrylate Crosspolymer. Polymethylsilsesquioxane. Hydrogenated Olive Oil Unsaponifiables. Boron Nitride. Madecassoside. Aloe Barbadensis Leaf Extract. Allantoin. Artemisia Vulgaris Extract. Astrocaryum Murumuru Seed Butter. Glyceryl Acrylate/?Acrylic Acid Copolymer. Tromethamine. Ethylhexylglycerin. Xanthan Gum. Dipotassium Glycyrrhizate. Sodium Phytate. Ceramide NP. Sodium Citrate. Citric Acid. Sea Water. Propanediol. Tocopherol. Emiliania Huxleyi Extract', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/33.png'),
(34, 'Studio Tropik Rich Skin Barrier Cream', 'Studio Tropik', 'Moisturizer', 'Aqua. Dicaprylyl Carbonate. Squalane. Diisostearyl Malate. Caprylic/?Capric Triglyceride. Bis-Diglyceryl Polyacyladipate-2. Propylene Glycol. Butylene Glycol. Glycerin. Cetearyl Alcohol. Glycerides. Cetearyl Olivate. Bifida Ferment Lysate. Polyglutamic Acid. Sodium Acetylated Hyaluronate. Hydroxypropyltrimonium Hyaluronate. Saccharide Isomerate. Panthenol. Allantoin. Hydrolyzed Jojoba Esters. Triethoxycaprylylsilane. Dextrin Palmitate. Sorbitan Olivate. BHT. Ceteth-10 Phosphate. Dicetyl Phosphate. Triethanolamine. Tetrasodium EDTA. Chlorphenesin. Phenoxyethanol. Ethylhexylglycerin. 1.2-Hexanediol. Caprylyl Glycol. Citric Acid. Titanium Dioxide. Sodium Citrate. Caprylic/?Capric/?Myristic/?Stearic Triglyceride. Hydroxyethyl Acrylate/?Sodium Acryloyldimethyl Taurate Copolymer. Lactobacillus/?Collagen/?Mesembryanthemum Crystallinum Leaf Extract Ferment Lysate', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/34.png'),
(35, 'Wardah Nature Daily Witch Hazel Purifying Moisturizer Gel', 'Wardah', 'Moisturizer', 'Aqua. Caprylic/?Capric Triglyceride. Glycerine. Squalane. Octamethylcyclotetrasiloxane. Butylene Glycol. Benzyl Alcohol. Decamethylcyclopentasiloxane. Dimethicone. Panthenol. Triethanolamine. Acrylates/?Acrylamide Copolymer. Mineral Oil. Ethylhexylglycerin. Allantoin. Carbomer. Fragrance. BHT. Tocopheryl Acetate. Chamomilla Recutita (Matricaria) Flower Extract. Polysorbate 85. Phenoxyethanol. PEG-40 Hydrogenated Castor Oil. Trideceth-9. Tocopherol. Polysorbate 20. Hamamelis Virginiana (Witch Hazel) Leaf Extract. Ci 42090. Ci 19140', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/35.png'),
(36, 'Skin Aqua UV Whitening Milk SPF 50 PA++++', 'Skin Aqua', 'Sunscreen', 'Aqua (Water). Ethylhexyl Methoxycinnamate. Butylene Glycol. Methylene Bis-Benzotriazolyl Tetramethylbutylphenol. Polymethylsilsesquioxane. Cyclopentasiloxane. Tranexamic Acid. Diethylamino Hydroxybenzoyl Hexyl Benzoate. Polysorbate 60. Cetearyl Alcohol. Silica. Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine. Decyl Glucoside. Titanium Dioxide. Phenoxyethanol. Triethanolamine. Acrylates/?C10-30 Alkyl Acrylate Crosspolymer. Hexylglycerin. Disodium EDTA. Propylene Glycol. Xanthan Gum. Sodium Acetylated Hyaluronate (Acha)', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/36.png'),
(37, 'Avoskin The Great Shield Sunscreen SPF 50 PA++++', 'Avoskin', 'Sunscreen', 'Water. Ethylhexyl Methoxycinnamate. Methylpropanediol. Cetearyl Alcohol. Zinc Oxide. Butyl Methoxydibenzoylmethane. Cyclopentasiloxane. Hydroxyethyl Acrylate/?Sodium Acryloyldimethyl Taurate Copolymer. C20-22 Alkyl Phosphate. Lauryl Lactate. Isononyl Isononanoate. Polysilicone-15. Diisopropyl Adipate. Titanium Dioxide. C20-22 Alcohols. Sorbitan Isostearate. Squalane. Dimethicone. Phenoxyethanol. Ceteareth-33. Niacinamide. Diisopropyl Sebacate. Isodecyl Neopentanoate. Aluminum Starch Octenylsuccinate. Sodium Ascorbyl Phosphate. Imidazolidinyl Urea. Hydroxypropyl Cyclodextrin. Polyglyceryl-3 Polydimethylsiloxyethyl Dimethicone. Cetearyl Dimethicone Crosspolymer. Polysorbate 60. Stearic Acid. Aluminum Hydroxide. Polydextrose. Disodium EDTA. BHT. Cyclodextrin. Asiaticoside. Triethoxycaprylylsilane', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/37.png'),
(38, 'Anessa Perfect UV Sunscreen Skincare Milk SPF 50+ PA++++', 'Anessa', 'Sunscreen', 'Water (Aqua). Dimethicone. Zinc Oxide 10.443%. Ethylhexyl Methoxycinnamate 7.49475%. Cyclopentasiloxane. Talc. Methyl Methacrylate Crosspolymer. Alcohol. Diisopropyl Sebacate. Isododecane. Octocrylene 3.0%. PEG/?PPG-9/?2 Dimethyl Ether. Zea Mays (Corn) Starch. Ethylhexyl Salicylate 2.5%. Diethylamino Hydroxybenzoyl Hexyl Benzoate 1.8%. Titanium Dioxide. PEG-9 Polydimethylsiloxyethyl Dimethicone. Glycerin. Isopropyl Myristate. Silica. Polysilicone-15 1.0%. Sucrose Tetrastearate Triacetate. PPG-17. Dextrin Palmitate. Trimethylsiloxysilicate. Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine 0.5%. Isostearic Acid. Triethoxycaprylylsilane', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/38.png'),
(39, 'La Roche Posay Anthelios UV Mune 400 Oil Control Gel Cream', 'La Roche Posay ', 'Sunscreen', 'Aqua/?Water/?Eau. Diisopropyl Sebacate. Silica. Alcohol Denat. Ethylhexyl Salicylate. Ethylhexyl Triazone. Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine. Diisopropyl Adipate. PEG-8. Dipropylene Glycol. C12-22 Alkyl Acrylate/?Hydroxyethylacrylate Copolymer. Glycerin. Drometrizole Trisiloxane. Aluminum Starch Octenylsuccinate. Butyl Methoxydibenzoylmethane. Methoxypropylamino Cyclohexenylidene Ethoxyethylcyanoacetate. Tocopherol. Diethylamino Hydroxybenzoyl Hexyl Benzoate. Acrylates Copolymer. Acrylates/?C10-30 Alkyl Acrylate Crosspolymer. Bixa Orellana Seed Extract. Caprylyl Glycol. Citric Acid. Hydroxyacetophenone. Maltodextrin. Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate. Pentylene Glycol. Silica Silylate. Sodium Polyacrylate. Terephthalylidene Dicamphor Sulfonic Acid. Triethanolamine. Trisodium Ethylenediamine Disuccinate. Zinc Pca', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/39.png'),
(40, 'Heliatech Sunscreen Spf 45+', 'Heliatech', 'Sunscreen', 'Water. Octyl Methoxycinnamate. Propylene Glycol. Talc. Caprylic/?Capric Triglyceride. Methylene Bis-Benzotriazolyl Tetramethylbutylphenol. 4-Methylbenzylidene Camphor. PEG-40 Stearate. Glycerin. Butyl Methoxydibenzoylmethane. Sorbitan Stearate. Niacinamide. Polysorbate 60. Stearic Acid. Triethanolamine. Decyl Glucoside. Tocopheryl Acetate. Isopropyl Palmitate. Cetyl Alcohol. Glyceryl Stearate. PEG-100 Stearate. Xanthan Gum. Decylene Glycol. Disodium EDTA. Aloe Barbadensis Leaf Juice. PEG-90. Fragrance. Methylisothiazolinone', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/40.png'),
(41, 'Banana Boat Sport Sunscreen SPF 50 Lotion', 'Banana Boat', 'Sunscreen', 'Active Ingredients: Homosalate (10.00%). Octocrylene (6.00%). Butyl Methoxydibenzoylmethane (3.00%) Inactive Ingredients: Phenoxyethanol. Hydroxybenzoates', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/41.png'),
(42, 'Azarine Hydrasoothe Sunscreen Mist SPF50 PA++++', 'Azarine', 'Sunscreen', 'Aqua. Centella Asiatica Extract. Ethylhexyl Methoxydibenzoylmethane. Butyl Methoxydibenzoylmethane. Glycerin. Ectoin. Propanediol. Polymethyl Methacrylate. Octocrylene. Butylene Glycol. Ceramide 3. Hydroxypropyltrimonium Hyaluronate. Hyaluronic Acid. Sodium Hyaluronate. Acrylates Crosspolymer. Chlorphenesin. Sodium Acetylated Hyaluronate. Hydrolyzed Hyaluronic Acid. Phenoxyethanol. Potassium Hyaluronate. Sodium Hyaluronate Crosspolymer. Hydrolyzed Sodium Hyaluronate', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/42.png'),
(43, 'SKINTIFIC Sunscreen Mist All Day Light SPF50 PA++++', 'SKINTIFIC', 'Sunscreen', 'Aqua. Isododecane. Homosalate. Ethylhexyl Methoxycinnamate. Ethylhexyl Salicylate. Diethylamino Hydroxybenzoyl Hexyl Benzoate. Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine. Ceramide NP. Ceramide EOP. Ceramide AP. Ceramide AS. Ceramide NS. Centella Asiatica Extract. Bisabolol. Bifida Ferment Lysate. C12-15 Alkyl Benzoate. Methyl Methacrylate Crosspolymer. Silica Dimethyl Silylate. Ethylhexyl Triazone. Silica. Methicone. Caprylyl Methicone. Disteardimonium Hectorite. Propylene Carbonate. Aloe Barbadensis Leaf Extract. Portulaca Oleracea Extract. Ethylhexylglycerin Tocopherol Propellants Consist Of: Butane. Propane. Isobutane', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/43.png'),
(44, 'NPURE Sunscreen Cica Beat The Sun SPF 50 PA++++', 'NPURE', 'Sunscreen', 'Water. Glycerin. Dibutyl Adipate. Butyloctyl Salicylate. Diethylamino Hydroxybenzoyl Hexyl Benzoate. Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine. Butylene Glycol. Ethylhexyl Triazone. Pentylene Glycol. Isoamyl p-Methoxycinnamate. Polysilicone-15. Centella Asiatica Leaf Water. Inulin Lauryl Carbamate. Chrysanthemum Parthenium (Feverfew) Extract. Chamomilla Recutita (Matricaria) Extract. Sodium Acrylate/?Sodium Acryloyldimethyl Taurate Copolymer. Acrylates/?C10-30 Alkyl Acrylate Crosspolymer. Tromethamine. Isohexadecane. Glyceryl Caprylate. Caprylyl Glycol. Polysorbate 80. Camellia Japonica Leaf Extract. Sorbitan Oleate', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/44.png'),
(45, 'Carasun Solar Smart UV Protector Sunscreen dengan SPF 45 PA++++', 'Carasun', 'Sunscreen', 'Aqua. Propylene Glycol. Glycerin. Caprylyl Methicone. Butyl Methoxydibenzoylmethane. Ethylhexyl Methoxycinnamate. Isononyl Isononanoate. Caprylic/?Capric Triglyceride. Butylene Glycol. Niacinamide. Octocrylene. Polyglyceryl-2 Stearate. PEG-12 Dimethicone/?PPG-20 Crosspolymer. Glyceryl Stearate. Silica. Diisopropyl Sebacate. Propylene Glycol Dicaprylate/?Dicaprate. Stearyl Alcohol. Oryza Sativa Extract. Phenoxyethanol. C12-15 Alkyl Benzoate. Diisopropyl Adipate. Tocopheryl Acetate. Sodium Polyacrylate Starch. Lecithin. Marrubium Vulgare Extract. Ethylhexylglycerin. Tetrasodium EDTA. Chlorphenesin. 1.2-Hexanediol. Sodium Hydroxide', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-skinsolve/images/produk/45.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_tipe_skin`
--

CREATE TABLE `produk_tipe_skin` (
  `id` int(11) NOT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `id_tipe_skin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk_tipe_skin`
--

INSERT INTO `produk_tipe_skin` (`id`, `id_produk`, `id_tipe_skin`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 2),
(7, 6, 1),
(8, 6, 3),
(9, 6, 4),
(10, 6, 5),
(11, 7, 2),
(12, 7, 3),
(13, 7, 5),
(14, 8, 2),
(15, 9, 2),
(16, 9, 5),
(17, 10, 2),
(18, 11, 2),
(19, 12, 2),
(20, 13, 2),
(21, 13, 1),
(22, 13, 3),
(23, 13, 4),
(24, 13, 5),
(25, 14, 2),
(26, 14, 1),
(27, 14, 3),
(28, 14, 5),
(29, 15, 2),
(30, 15, 1),
(31, 15, 3),
(32, 15, 4),
(33, 15, 5),
(34, 16, 2),
(35, 16, 1),
(36, 16, 3),
(37, 16, 4),
(38, 16, 5),
(39, 17, 2),
(40, 17, 1),
(41, 17, 3),
(42, 17, 4),
(43, 17, 5),
(44, 18, 2),
(45, 18, 1),
(46, 18, 4),
(47, 19, 2),
(48, 19, 1),
(49, 19, 3),
(50, 19, 4),
(51, 20, 1),
(52, 20, 4),
(53, 21, 2),
(54, 21, 5),
(55, 22, 2),
(56, 22, 4),
(57, 22, 5),
(58, 23, 2),
(59, 23, 1),
(60, 23, 3),
(61, 23, 4),
(62, 23, 5),
(63, 24, 2),
(64, 24, 3),
(65, 24, 4),
(66, 24, 5),
(67, 25, 1),
(68, 25, 3),
(69, 25, 4),
(70, 25, 5),
(71, 26, 1),
(72, 26, 3),
(73, 26, 4),
(74, 26, 5),
(75, 27, 2),
(76, 27, 3),
(77, 27, 4),
(78, 27, 5),
(79, 28, 1),
(80, 28, 3),
(81, 29, 2),
(82, 29, 4),
(83, 29, 3),
(84, 30, 2),
(85, 30, 1),
(86, 30, 4),
(87, 31, 2),
(88, 31, 1),
(89, 31, 4),
(90, 32, 2),
(91, 32, 1),
(92, 33, 2),
(93, 33, 1),
(94, 33, 3),
(95, 33, 4),
(96, 33, 5),
(97, 34, 1),
(98, 34, 3),
(99, 34, 4),
(100, 35, 2),
(101, 35, 3),
(102, 35, 4),
(103, 35, 5),
(104, 36, 2),
(105, 36, 1),
(106, 36, 3),
(107, 36, 4),
(108, 36, 5),
(109, 37, 2),
(110, 37, 1),
(111, 37, 3),
(112, 37, 4),
(113, 37, 5),
(114, 38, 2),
(115, 38, 1),
(116, 38, 3),
(117, 38, 4),
(118, 38, 5),
(119, 39, 2),
(120, 40, 2),
(121, 41, 2),
(122, 41, 1),
(123, 41, 3),
(124, 41, 4),
(125, 41, 5),
(126, 42, 2),
(127, 42, 1),
(128, 42, 3),
(129, 42, 4),
(130, 43, 2),
(131, 43, 1),
(132, 43, 3),
(133, 43, 4),
(134, 44, 1),
(135, 44, 3),
(136, 44, 5),
(137, 45, 2),
(138, 45, 1),
(139, 45, 3),
(140, 45, 4),
(141, 45, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `skin_progres_makanan`
--

CREATE TABLE `skin_progres_makanan` (
  `id` int(11) NOT NULL,
  `gambar_makanan` varchar(255) DEFAULT NULL,
  `tanggal_upload` date DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `skin_progres_wajah`
--

CREATE TABLE `skin_progres_wajah` (
  `id` int(11) NOT NULL,
  `gambar_wajah` varchar(255) DEFAULT NULL,
  `tanggal_upload` date DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tipe_skin`
--

CREATE TABLE `tipe_skin` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tipe_skin`
--

INSERT INTO `tipe_skin` (`id`, `nama`) VALUES
(1, 'Kering'),
(2, 'Berminyak'),
(3, 'Normal'),
(4, 'Kombinasi'),
(5, 'Sensitif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `gambar_profil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `jenis_kelamin`, `tanggal_lahir`, `gambar_profil`) VALUES
(1, 'Ali Ihsan Kamil Aja', 'aliihsankamil@gmail.com', '12345678', 'Laki-laki', '2002-09-30', 'https://gqlxw8qw-80.asse.devtunnels.ms/api-login/images/ali.jpeg'),
(3, 'Erna', 'erna@gmail.com', '12345678', NULL, NULL, NULL),
(4, 'ok', 'ok@gmail.com', '$2y$10$44t/G0wRHwM9vDhATKx94eckokQmX1IxTBy/Zf4kJwsLVIqL2bFku', NULL, NULL, NULL),
(5, 'Asem', 'asem@gmail.com', '12345678', NULL, NULL, NULL),
(6, 'oi', 'oi@gmail.com', '12345678', NULL, NULL, NULL),
(7, 'IHSAN', 'ihsan@gmail.com', '12345678', NULL, NULL, NULL),
(8, 'kamil', 'kamil@gmail.com', '12345678', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_tipe_skin`
--

CREATE TABLE `user_tipe_skin` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_tipe_skin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_tipe_skin`
--

INSERT INTO `user_tipe_skin` (`id`, `id_user`, `id_tipe_skin`) VALUES
(21, 1, 1),
(22, 6, 4),
(23, 3, 1),
(24, 8, 5);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `makanan_tipe_skin`
--
ALTER TABLE `makanan_tipe_skin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_makanan` (`id_makanan`),
  ADD KEY `id_tipe_skin` (`id_tipe_skin`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produk_tipe_skin`
--
ALTER TABLE `produk_tipe_skin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_tipe_skin` (`id_tipe_skin`);

--
-- Indeks untuk tabel `skin_progres_makanan`
--
ALTER TABLE `skin_progres_makanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `skin_progres_wajah`
--
ALTER TABLE `skin_progres_wajah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tipe_skin`
--
ALTER TABLE `tipe_skin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_tipe_skin`
--
ALTER TABLE `user_tipe_skin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`id_user`),
  ADD KEY `id_tipe_skin` (`id_tipe_skin`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `makanan`
--
ALTER TABLE `makanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `tipe_skin`
--
ALTER TABLE `tipe_skin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user_tipe_skin`
--
ALTER TABLE `user_tipe_skin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `makanan_tipe_skin`
--
ALTER TABLE `makanan_tipe_skin`
  ADD CONSTRAINT `makanan_tipe_skin_ibfk_1` FOREIGN KEY (`id_makanan`) REFERENCES `makanan` (`id`),
  ADD CONSTRAINT `makanan_tipe_skin_ibfk_2` FOREIGN KEY (`id_tipe_skin`) REFERENCES `tipe_skin` (`id`);

--
-- Ketidakleluasaan untuk tabel `produk_tipe_skin`
--
ALTER TABLE `produk_tipe_skin`
  ADD CONSTRAINT `produk_tipe_skin_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `produk_tipe_skin_ibfk_2` FOREIGN KEY (`id_tipe_skin`) REFERENCES `tipe_skin` (`id`);

--
-- Ketidakleluasaan untuk tabel `skin_progres_makanan`
--
ALTER TABLE `skin_progres_makanan`
  ADD CONSTRAINT `skin_progres_makanan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `skin_progres_wajah`
--
ALTER TABLE `skin_progres_wajah`
  ADD CONSTRAINT `skin_progres_wajah_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `user_tipe_skin`
--
ALTER TABLE `user_tipe_skin`
  ADD CONSTRAINT `user_tipe_skin_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_tipe_skin_ibfk_2` FOREIGN KEY (`id_tipe_skin`) REFERENCES `tipe_skin` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
