-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : com-linweb920.srv.combell-ops.net:3306
-- Généré le : sam. 31 jan. 2026 à 16:39
-- Version du serveur : 8.0.36-28
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ID477568_projectrentcar`
--

-- --------------------------------------------------------

--
-- Structure de la table `agencies`
--

CREATE TABLE `agencies` (
  `agency_id` int NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `agencies`
--

INSERT INTO `agencies` (`agency_id`, `city_name`, `country`, `latitude`, `longitude`) VALUES
(1, 'Madrid', 'Espagne', 40.41677500, -3.70379000),
(2, 'Brussel', 'België', 50.85030000, 4.35170000),
(3, 'Parijs', 'Frankrijk', 48.85660000, 2.35220000);

-- --------------------------------------------------------

--
-- Structure de la table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int NOT NULL,
  `user_id` int NOT NULL,
  `car_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('confirmed','cancelled') DEFAULT 'confirmed',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `car_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`) VALUES
(2, 1, 1, '2025-12-01', '2025-12-01', 85.00, 'confirmed', '2025-12-01 13:31:13'),
(4, 1, 1, '2025-12-01', '2025-12-01', 85.00, 'confirmed', '2025-12-01 14:08:17'),
(6, 1, 4, '2025-12-01', '2025-12-01', 75.00, 'confirmed', '2025-12-01 14:41:56'),
(7, 1, 4, '2025-12-01', '2025-12-01', 75.00, 'confirmed', '2025-12-01 14:42:52'),
(8, 1, 4, '2025-12-01', '2025-12-01', 75.00, 'confirmed', '2025-12-01 14:43:10'),
(9, 1, 3, '2025-12-25', '2025-12-31', 360.00, 'confirmed', '2025-12-01 15:00:43'),
(10, 1, 5, '2025-12-31', '2026-01-16', 880.00, 'confirmed', '2025-12-01 15:05:11'),
(15, 3, 6, '2026-01-27', '2026-01-28', 50.00, 'confirmed', '2026-01-27 13:26:36');

-- --------------------------------------------------------

--
-- Structure de la table `cars`
--

CREATE TABLE `cars` (
  `car_id` int NOT NULL,
  `agency_id` int NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(255) NOT NULL,
  `type` enum('essence','electrique','hybride') NOT NULL,
  `transmission` enum('manuelle','automatique') NOT NULL,
  `price_per_day` decimal(10,2) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cars`
--

INSERT INTO `cars` (`car_id`, `agency_id`, `brand`, `model`, `type`, `transmission`, `price_per_day`, `image_path`) VALUES
(1, 1, 'BMW', 'X5', 'essence', 'automatique', 85.00, 'bmw_x5.jpg'),
(2, 1, 'Tesla', 'Model 3', 'electrique', 'automatique', 95.00, 'tesla_3.jpg'),
(3, 2, 'Audi', 'A3', 'essence', 'manuelle', 60.00, 'audi_a3.jpg'),
(4, 2, 'Volkswagen', 'ID.3', 'electrique', 'automatique', 75.00, 'vw_id3.jpg'),
(5, 2, 'Toyota', 'Yaris Hybrid', 'hybride', 'automatique', 55.00, 'toyota_yaris.jpg'),
(6, 3, 'Peugeot', '208', 'essence', 'manuelle', 50.00, 'peugeot_208.jpg'),
(7, 3, 'Renault', 'Zoe', 'electrique', 'automatique', 65.00, 'renault_zoe.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `google_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `google_id`, `email`, `full_name`, `created_at`) VALUES
(1, 'dNR43zlxuMUiaFgTDS6DObulCrQ2', 'mhssinoui@gmail.com', 'Hssinoui Mohamed', '2025-12-01 13:30:04'),
(2, 'jr8gZ2b5Q3fvLiXgHfzVBBBF3Ai1', 'mhssinoui14@gmail.com', 'Hssinoui Mohamed', '2025-12-01 13:49:19'),
(3, 'epK86qjowaZciHTBiW7egwS9U6P2', 'spelromain@gmail.com', 'romain spelromain', '2025-12-02 08:04:55');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`agency_id`);

--
-- Index pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Index pour la table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `google_id` (`google_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agencies`
--
ALTER TABLE `agencies`
  MODIFY `agency_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`);

--
-- Contraintes pour la table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`agency_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
