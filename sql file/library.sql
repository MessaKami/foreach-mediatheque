-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql
-- Généré le : mar. 19 oct. 2021 à 12:32
-- Version du serveur : 5.7.35
-- Version de PHP : 7.4.20
​
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
​
​
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
​
--
-- Base de données : `fil_rouge`
--
​
-- --------------------------------------------------------
​
--
-- Structure de la table `auteurs`
--
​
CREATE TABLE `auteurs` (
  `id_auteurs` int(10) UNSIGNED NOT NULL,
  `Nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Prenom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nationality` char(2) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
​
--
-- Déchargement des données de la table `auteurs`
--
​
INSERT INTO `auteurs` (`id_auteurs`, `Nom`, `Prenom`, `Nationality`) VALUES
(1, 'hugo', 'victor', 'fr'),
(2, 'Guillaume', 'Musso', 'fr'),
(3, 'emile', 'zola', 'fr');
​
-- --------------------------------------------------------
​
--
-- Structure de la table `categorie`
--
​
CREATE TABLE `categorie` (
  `id` int(11) UNSIGNED NOT NULL,
  `nom_categorie` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_ressource` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
​
--
-- Déchargement des données de la table `categorie`
--
​
INSERT INTO `categorie` (`id`, `nom_categorie`, `type_ressource`) VALUES
(1, 'livre', 2),
(2, 'livre', 4),
(3, 'bd', 3),
(4, 'dvd', 5),
(5, 'cd', 4);
​
-- --------------------------------------------------------
​
--
-- Structure de la table `reserve`
--
​
CREATE TABLE `reserve` (
  `id_reserve` int(10) UNSIGNED NOT NULL,
  `users_id` int(11) UNSIGNED NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `documents_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
​
--
-- Déchargement des données de la table `reserve`
--
​
INSERT INTO `reserve` (`id_reserve`, `users_id`, `date_debut`, `date_fin`, `documents_id`) VALUES
(1, 2, '2021-10-07', '2021-10-14', 1),
(2, 1, '2021-10-07', '2021-10-11', 2),
(3, 3, '2021-10-07', '2021-10-21', 3);
​
-- --------------------------------------------------------
​
--
-- Structure de la table `Ressources`
--
​
CREATE TABLE `Ressources` (
  `id` int(11) NOT NULL,
  `id_auteurs` int(10) UNSIGNED NOT NULL,
  `nom_ressource` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_ressource` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
​
--
-- Déchargement des données de la table `Ressources`
--
​
INSERT INTO `Ressources` (`id`, `id_auteurs`, `nom_ressource`, `type_ressource`) VALUES
(1, 1, 'les misérables', 3),
(2, 3, 'germinal', 3),
(3, 2, 'l\'inconnu de la seine', 4);
​
-- --------------------------------------------------------
​
--
-- Structure de la table `type_ressource`
--
​
CREATE TABLE `type_ressource` (
  `id` int(11) UNSIGNED NOT NULL,
  `type_ressource` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
​
--
-- Déchargement des données de la table `type_ressource`
--
​
INSERT INTO `type_ressource` (`id`, `type_ressource`) VALUES
(2, 'policier'),
(3, 'fantastique'),
(4, 'horreur'),
(5, 'science-fiction');
​
-- --------------------------------------------------------
​
--
-- Structure de la table `users`
--
​
CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
​
--
-- Déchargement des données de la table `users`
--
​
INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `birthdate`, `created_at`, `avatar`, `admin`) VALUES
(1, 'valerie poitier', 'valerie.poitier@gmail.com', 'jaimelesbites', '1995-01-18', '2021-10-07 11:55:12', 'www.google.fr', 0),
(2, 'françois dupont', 'fd@gmail.com', 'dupontlefdp', '1971-10-26', '2021-10-07 12:11:06', 'https://hackmd.io/UlQhAEatQ1y-ZwnDyJku8g?view', 0),
(3, 'roger pois', 'rogerpois@gmail.com', 'rogerlepetitpois', '1951-12-31', '2021-10-07 12:12:26', 'https://www.npmjs.com/package/country-flag-emoji-json', 0);
​
--
-- Index pour les tables déchargées
--
​
--
-- Index pour la table `auteurs`
--
ALTER TABLE `auteurs`
  ADD PRIMARY KEY (`id_auteurs`);
​
--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categorie` (`type_ressource`);
​
--
-- Index pour la table `reserve`
--
ALTER TABLE `reserve`
  ADD PRIMARY KEY (`id_reserve`),
  ADD KEY `fk_user` (`users_id`),
  ADD KEY `fk_docs` (`documents_id`);
​
--
-- Index pour la table `Ressources`
--
ALTER TABLE `Ressources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ressource1` (`type_ressource`),
  ADD KEY `fk_auteurs` (`id_auteurs`);
​
--
-- Index pour la table `type_ressource`
--
ALTER TABLE `type_ressource`
  ADD PRIMARY KEY (`id`);
​
--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);
​
--
-- AUTO_INCREMENT pour les tables déchargées
--
​
--
-- AUTO_INCREMENT pour la table `auteurs`
--
ALTER TABLE `auteurs`
  MODIFY `id_auteurs` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
​
--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
​
--
-- AUTO_INCREMENT pour la table `reserve`
--
ALTER TABLE `reserve`
  MODIFY `id_reserve` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
​
--
-- AUTO_INCREMENT pour la table `Ressources`
--
ALTER TABLE `Ressources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
​
--
-- AUTO_INCREMENT pour la table `type_ressource`
--
ALTER TABLE `type_ressource`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
​
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
​
--
-- Contraintes pour les tables déchargées
--
​
--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `fk_categorie` FOREIGN KEY (`type_ressource`) REFERENCES `type_ressource` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
​
--
-- Contraintes pour la table `reserve`
--
ALTER TABLE `reserve`
  ADD CONSTRAINT `fk_docs` FOREIGN KEY (`documents_id`) REFERENCES `Ressources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
​
--
-- Contraintes pour la table `Ressources`
--
ALTER TABLE `Ressources`
  ADD CONSTRAINT `fk_auteurs` FOREIGN KEY (`id_auteurs`) REFERENCES `auteurs` (`id_auteurs`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ressource1` FOREIGN KEY (`type_ressource`) REFERENCES `type_ressource` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
​
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;