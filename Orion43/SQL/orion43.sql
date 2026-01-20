-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 20 jan. 2026 à 11:29
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `orion43`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `photo` varchar(255) NOT NULL,
  `article_id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `contenu` text NOT NULL,
  `date_publication` datetime NOT NULL,
  `epingle` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`photo`, `article_id`, `titre`, `slug`, `contenu`, `date_publication`, `epingle`) VALUES
('Image/ImageSite/Article/aurores-Jeanne-2-1024x558_232.jpg', 1, 'Aurores polaires', 'aurores-polaires', 'La nuit du 11 au 12 novembre nous a réservé une belle surprise : malgré un ciel partiellement couvert, nous avons réussi à capturer une superbe aurore boréale.', '2025-01-01 00:00:00', 0),
('Image/ImageSite/Article/3X8A0077-629x1024_241.jpg', 2, 'Comète C/2025 A6 (Lemmon)', 'comete-c-2025-a6-lemmon', 'Voici deux magnifiques images de cette comète, capturées par Bernard au cours du mois d\'octobre, lorsqu\'elle était observable avec des jumelles ou un télescope.', '2025-01-01 00:00:00', 0),
('Image/ImageSite/Article/presidents_251.jpg', 3, 'Nouveau président', 'nouveau-president', 'C\'est avec plaisir que nous vous annonçons l\'élection de Daniel Vincent à la présidence de notre Club lors de la dernière assemblée générale. Une nouvelle étape pour notre projet commun !', '2025-01-01 00:00:00', 0),
('Image/ImageSite/Article/fete-de-la-science_260.png', 4, 'Dimanche 5 octobre', 'dimanche-5-octobre', 'Le Club Orion était présent à la Fête de la Science organisée au Musée Crozatier. L\'occasion de rappeler que curiosité, soif de découverte et intelligence sont les clés qui nous ont permis d\'atteindre nos connaissances actuelles sur les astres et l\'Univers.', '2025-01-01 00:00:00', 0),
('Image/ImageSite/Article/Bernard-4-1024x683_270.jpg', 5, 'Eclipse de lune du 7 septembre', 'eclipse-de-lune-du-7-septembre', 'Les membres du club ont capturé de magnifiques images. (image)', '2025-01-01 00:00:00', 0),
('Image/ImageSite/accueil/Bernard-12-1024x683_003.jpg', 6, 'Orion a fêté ses 30 ans', 'orion-a-fete-ses-30-ans', 'Ce samedi ensoleillé a rassemblé la grande famille d\'Orion : membres actuels et anciens, fidèles sympathisants et invités, pour une rencontre placée sous le signe de l\'amitié et de la convivialité. De magnifiques diaporamas ont permis de revivre les belles années passées ensemble, avant de conclure la soirée par une séance d\'observation du ciel, comme il se doit.', '2025-01-01 00:00:00', 0),
('Image/ImageSite/accueil/2024-01-27-M42-somme-des-2-series-Raphael--340x210_297.png', 7, 'Astrophoto à la coupole', 'astrophoto-a-la-coupole', 'Les nuits d\'hiver offrent des conditions idéales pour l\'astrophotographie, comme en témoignent ces images de la nébuleuse d\'Orion et de Jupiter avec sa Grande Tache Rouge et ses satellites.', '2024-01-01 00:00:00', 0),
('Image/ImageSite/accueil/region-Boulliau--340x210_298.png', 8, 'Lune', 'lune', 'Belle séance d\'observation lunaire le 20 janvier à l\'observatoire : au programme, photographies de plusieurs formations remarquables dont les cratères Boulliau (image), Clavius (image)et Platon(image).', '2024-01-01 00:00:00', 0),
('Image/ImageSite/accueil/comete-en-21x297-1-340x210_299.jpg', 9, 'Un dernier adieu à la Comète C2022/E3 (ZTF)', 'un-dernier-adieu-a-la-comete-c2022-e3-ztf', 'Samedi 11 février, les membres d\'Orion Astronomie du Velay ont profité d\'une excellente nuit d\'observation à l\'observatoire du Betz, à Saint-Julien-Chapteuil. Sans Lune jusqu\'à 2 heures du matin, le ciel a révélé ses merveilles : cette photo immortalise la constellation du Taureau au sud-ouest, dominée par l\'éclat de Mars et, juste en dessous, la comète arborant sa queue verticale.\r\nPassée au plus près du Soleil le 12 janvier (166 millions de km) puis de la Terre le 1er février (42 millions de km), elle file désormais à 180 000 km/h en s\'éloignant de nous. Son minuscule noyau de 1,6 km et sa luminosité faiblissante nécessiteront bientôt l\'usage d\'un télescope pour l\'apercevoir.\r\nInitialement prévue pour revenir dans 50 000 ans sur son orbite très elliptique, sa vitesse élevée suggère maintenant qu\'elle franchira l\'orbite de Neptune pour quitter à jamais le système solaire. En attendant les prochaines...', '2023-01-01 00:00:00', 0),
('Image/ImageSite/accueil/A-Marie-Rose-5-340x210_300.jpg', 10, 'Inauguration à l’observatoire', 'inauguration-a-l-observatoire', 'Le samedi 1er octobre, le Club Orion a inauguré ses deux coupoles en présence d\'André Ferret, maire de Saint-Julien-Chapteuil, accompagné de son conseil municipal, ainsi que de Claude Mourlevat et Didier Jay, concepteurs et fabricants de la nouvelle coupole, et de Roger Issartel et Jean-Marc Delon, constructeurs de la première coupole en 1989.', '2022-01-01 00:00:00', 0),
('Image/ImageSite/Article/11-340x210.jpg', 11, 'Deux coupoles à l’observatoire', 'deux-coupoles-a-l-observatoire', 'Lundi 25 avril au soir, l\'observatoire du Betz a accueilli sa nouvelle coupole en aluminium, marquant un tournant pour Orion Astronomie du Velay. Cette installation moderne prendra la place de l\'ancienne coupole, fidèle au poste depuis 1989, qui bénéficiera d\'une seconde vie après rénovation sur une plateforme dédiée.\r\nLa mise en place, effectuée le 26 avril, s\'est déroulée en douceur grâce à la mobilisation des membres de l\'association et à l\'expertise minutieuse des artisans.', '2022-01-01 00:00:00', 0),
('https://www.youtube.com/embed/ZyOKhq-39-g', 12, '4 saisons d’astronomie', '4-saisons-d-astronomie', 'Video', '2021-01-01 00:00:00', 0),
('https://www.youtube.com/embed/-rdgwq-jmHo', 13, 'ORION activités et projets', 'orion-activites-et-projets', 'Video', '2021-01-01 00:00:00', 0),
('Image/ImageSite/Article/PB260021_vignette-1-300x216_204.jpg', 14, 'Albums', 'albums', 'Galerie photographique Cliquez sur les vignettes pour découvrir nos collections : objets du système solaire, ciel profond, phénomènes atmosphériques et célestes.', '2017-01-01 00:00:00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_photo`
--

CREATE TABLE `categorie_photo` (
  `categorie_id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `type_affichage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie_photo`
--

INSERT INTO `categorie_photo` (`categorie_id`, `nom`, `slug`, `description`, `type_affichage`) VALUES
(1, 'Lune', 'lune', 'Photographies de la surface et des phases de la Lune.', ''),
(2, 'Soleil', 'soleil', 'Images du Soleil et de ses phénomènes visibles.', ''),
(3, 'Mars', 'mars', 'Photographies de la planète Mars.', ''),
(4, 'Jupiter', 'jupiter', 'Images de la planète Jupiter et de ses détails.', ''),
(5, 'Saturne', 'saturne', 'Photographies de Saturne et de ses anneaux.', ''),
(6, 'Nébuleuses', 'nebuleuses', 'Images de nuages de gaz et de poussières cosmiques.', ''),
(8, 'Nébuleuse annulaire', 'nebuleuse-annulaire', 'Images de nébuleuses de type annulaire.', ''),
(9, 'Galaxies', 'galaxies', 'Photographies de galaxies situées hors de la Voie lactée.', ''),
(10, 'Amas', 'amas', 'Images d’amas d’étoiles ouverts ou globulaires.', ''),
(11, 'Comètes', 'cometes', 'Photographies de comètes observables depuis la Terre.', ''),
(12, 'Voie lactée', 'voie-lactee', 'Photographies grand champ de la Voie lactée dans le ciel nocturne.', ''),
(13, 'Circumpolaire', 'circumpolaire', 'Images montrant la rotation apparente des étoiles autour du pôle céleste.', ''),
(14, 'Arc-en-ciel', 'arc-en-ciel', 'Photographies de phénomènes atmosphériques lumineux.', ''),
(15, 'Nuages irisés', 'nuages-irises', 'Images de nuages présentant des effets de diffraction colorée.', ''),
(16, 'Étoiles', 'etoiles', 'Photographies du ciel étoilé et des constellations.', ''),
(17, 'Conjonction', 'conjonction', 'Images de rapprochements apparents entre astres dans le ciel.', ''),
(18, 'Coucher de soleil', 'coucher-soleil', 'Photographies de couchers de soleil et d’ambiances célestes.', ''),
(19, 'Grand champ', 'grand-champ', 'Photographies grand angle du ciel et de l’horizon.', ''),
(20, 'Time-lapse', 'time-lapse', 'Séquences d’images montrant l’évolution du ciel dans le temps.', ''),
(21, 'Spectro', 'spectro', 'Images issues de techniques de spectroscopie astronomique.', ''),
(22, 'accueil', 'accueil', NULL, ''),
(23, 'Article', 'article', NULL, ''),
(24, 'logo', 'logo', NULL, ''),
(25, 'nos-prochaines-soirees', 'nos-prochaines-soirees', NULL, ''),
(26, 'wp', 'wp', NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `evenement_id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_event` datetime NOT NULL,
  `max_places` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`evenement_id`, `titre`, `description`, `date_event`, `max_places`) VALUES
(1, 'Observation nocturne - Janvier', 'Soirée d\'observation des étoiles et constellations hivernales', '2026-02-15 20:00:00', 30),
(2, 'Atelier Astrophotographie', 'Apprenez les techniques de photographie astronomique', '2026-02-22 19:00:00', 20),
(3, 'Observation solaire sécurisée', 'Observation du Soleil avec équipement spécialisé', '2026-03-01 14:00:00', 25);

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `infos_techniques` text DEFAULT NULL,
  `date_prise` date DEFAULT NULL,
  `categorie_id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`photo_id`, `url`, `titre`, `description`, `infos_techniques`, `date_prise`, `categorie_id`, `article_id`) VALUES
(1, 'images/ImageSite/accueil/2024-01-27-M42-somme-des-2-series-Raphael--340x210_297.png', '2024-01-27-M42-somme-des-2-series-Raphael--340x210_297', NULL, NULL, NULL, 22, NULL),
(2, 'images/ImageSite/accueil/A-Marie-Rose-5-340x210_300.jpg', 'A-Marie-Rose-5-340x210_300', NULL, NULL, NULL, 22, NULL),
(3, 'images/ImageSite/accueil/Bernard-12-1024x683_003.jpg', 'Bernard-12-1024x683_003', NULL, NULL, NULL, 22, NULL),
(4, 'images/ImageSite/accueil/comete-en-21x297-1-340x210_299.jpg', 'comete-en-21x297-1-340x210_299', NULL, NULL, NULL, 22, NULL),
(5, 'images/ImageSite/accueil/cropped-test2_002.jpg', 'cropped-test2_002', NULL, NULL, NULL, 22, NULL),
(6, 'images/ImageSite/accueil/cropped-test2_019.jpg', 'cropped-test2_019', NULL, NULL, NULL, 22, NULL),
(7, 'images/ImageSite/accueil/DSC_0979-287x300_173.jpg', 'DSC_0979-287x300_173', NULL, NULL, NULL, 22, NULL),
(8, 'images/ImageSite/accueil/DUBHE__réseau_300_T____-300x200_107.jpg', 'DUBHE__réseau_300_T____-300x200_107', NULL, NULL, NULL, 22, NULL),
(9, 'images/ImageSite/accueil/fete-de-la-science-340x210_294.png', 'fete-de-la-science-340x210_294', NULL, NULL, NULL, 22, NULL),
(10, 'images/ImageSite/accueil/FINALE-1-300x195_103.jpg', 'FINALE-1-300x195_103', NULL, NULL, NULL, 22, NULL),
(11, 'images/ImageSite/accueil/FINALE-2-300x196_200.jpg', 'FINALE-2-300x196_200', NULL, NULL, NULL, 22, NULL),
(12, 'images/ImageSite/accueil/FINALE_2-300x199_104.jpg', 'FINALE_2-300x199_104', NULL, NULL, NULL, 22, NULL),
(13, 'images/ImageSite/accueil/FINALE_CROP-300x255_100.jpg', 'FINALE_CROP-300x255_100', NULL, NULL, NULL, 22, NULL),
(14, 'images/ImageSite/accueil/image-sat-300x169_046.png', 'image-sat-300x169_046', NULL, NULL, NULL, 22, NULL),
(15, 'images/ImageSite/accueil/IMG_2307-1024x952_154.jpg', 'IMG_2307-1024x952_154', NULL, NULL, NULL, 22, NULL),
(16, 'images/ImageSite/accueil/IMG_5548_116.jpg', 'IMG_5548_116', NULL, NULL, NULL, 22, NULL),
(17, 'images/ImageSite/accueil/IMG_8644-scaled_145.jpg', 'IMG_8644-scaled_145', NULL, NULL, NULL, 22, NULL),
(18, 'images/ImageSite/accueil/ISS-300x139_143.jpg', 'ISS-300x139_143', NULL, NULL, NULL, 22, NULL),
(19, 'images/ImageSite/accueil/lune_toshop_099.jpg', 'lune_toshop_099', NULL, NULL, NULL, 22, NULL),
(20, 'images/ImageSite/accueil/maquette-fusées-300x225_144.jpg', 'maquette-fusées-300x225_144', NULL, NULL, NULL, 22, NULL),
(21, 'images/ImageSite/accueil/maquette-système-solaire-2-96x300_142.jpg', 'maquette-système-solaire-2-96x300_142', NULL, NULL, NULL, 22, NULL),
(22, 'images/ImageSite/accueil/O-Jeanne-27-300x225_155.jpg', 'O-Jeanne-27-300x225_155', NULL, NULL, NULL, 22, NULL),
(23, 'images/ImageSite/accueil/Orion-Nocturne-300x169_035.jpg', 'Orion-Nocturne-300x169_035', NULL, NULL, NULL, 22, NULL),
(24, 'images/ImageSite/accueil/P1080856-300x217_034.jpg', 'P1080856-300x217_034', NULL, NULL, NULL, 22, NULL),
(25, 'images/ImageSite/accueil/P1100493-300x225_097.jpg', 'P1100493-300x225_097', NULL, NULL, NULL, 22, NULL),
(26, 'images/ImageSite/accueil/P1140674-300x225_175.jpg', 'P1140674-300x225_175', NULL, NULL, NULL, 22, NULL),
(27, 'images/ImageSite/accueil/P1140678-300x225_174.jpg', 'P1140678-300x225_174', NULL, NULL, NULL, 22, NULL),
(28, 'images/ImageSite/accueil/photo-C8-294x300_117.jpg', 'photo-C8-294x300_117', NULL, NULL, NULL, 22, NULL),
(29, 'images/ImageSite/accueil/region-Boulliau--340x210_298.png', 'region-Boulliau--340x210_298', NULL, NULL, NULL, 22, NULL),
(30, 'images/ImageSite/accueil/SATURNE-300x222_098.jpg', 'SATURNE-300x222_098', NULL, NULL, NULL, 22, NULL),
(31, 'images/ImageSite/accueil/soleil0002_pp_REG_COL-150x150_126.png', 'soleil0002_pp_REG_COL-150x150_126', NULL, NULL, NULL, 22, NULL),
(32, 'images/ImageSite/accueil/unspecified-300x195_184.jpg', 'unspecified-300x195_184', NULL, NULL, NULL, 22, NULL),
(33, 'images/ImageSite/Article/3X8A0077-629x1024_241.jpg', '3X8A0077-629x1024_241', NULL, NULL, NULL, 23, NULL),
(34, 'images/ImageSite/Article/ALDEBARAN_réseau_300_T-300x200_196.jpg', 'ALDEBARAN_réseau_300_T-300x200_196', NULL, NULL, NULL, 23, NULL),
(35, 'images/ImageSite/Article/aurores-Jeanne-2-1024x558_232.jpg', 'aurores-Jeanne-2-1024x558_232', NULL, NULL, NULL, 23, NULL),
(36, 'images/ImageSite/Article/Bernard-4-1024x683_270.jpg', 'Bernard-4-1024x683_270', NULL, NULL, NULL, 23, NULL),
(37, 'images/ImageSite/Article/DSC_1772-Copie_185.jpg', 'DSC_1772-Copie_185', NULL, NULL, NULL, 23, NULL),
(38, 'images/ImageSite/Article/eclipse-1024x372_272.jpg', 'eclipse-1024x372_272', NULL, NULL, NULL, 23, NULL),
(39, 'images/ImageSite/Article/fete-de-la-science_260.png', 'fete-de-la-science_260', NULL, NULL, NULL, 23, NULL),
(40, 'images/ImageSite/Article/FINALE-1_199.jpg', 'FINALE-1_199', NULL, NULL, NULL, 23, NULL),
(41, 'images/ImageSite/Article/FINALE-300x192_186.jpg', 'FINALE-300x192_186', NULL, NULL, NULL, 23, NULL),
(42, 'images/ImageSite/Article/FINALE-3_203.jpg', 'FINALE-3_203', NULL, NULL, NULL, 23, NULL),
(43, 'images/ImageSite/Article/IMG_3195-300x200_193.jpg', 'IMG_3195-300x200_193', NULL, NULL, NULL, 23, NULL),
(44, 'images/ImageSite/Article/IMG_4556-1024x768_281.jpg', 'IMG_4556-1024x768_281', NULL, NULL, NULL, 23, NULL),
(45, 'images/ImageSite/Article/JEANNE_12_11_2013-300x225_198.jpg', 'JEANNE_12_11_2013-300x225_198', NULL, NULL, NULL, 23, NULL),
(46, 'images/ImageSite/Article/JEANNE_19_05_2013-300x208_197.jpg', 'JEANNE_19_05_2013-300x208_197', NULL, NULL, NULL, 23, NULL),
(47, 'images/ImageSite/Article/J_242.jpg', 'J_242', NULL, NULL, NULL, 23, NULL),
(48, 'images/ImageSite/Article/LUNE_CENDREE_ASSEMBLEE_187.jpg', 'LUNE_CENDREE_ASSEMBLEE_187', NULL, NULL, NULL, 23, NULL),
(49, 'images/ImageSite/Article/M33-300x246_201.jpg', 'M33-300x246_201', NULL, NULL, NULL, 23, NULL),
(50, 'images/ImageSite/Article/Mars-300x225_189.png', 'Mars-300x225_189', NULL, NULL, NULL, 23, NULL),
(51, 'images/ImageSite/Article/NGC457-300x268_202.jpg', 'NGC457-300x268_202', NULL, NULL, NULL, 23, NULL),
(52, 'images/ImageSite/Article/PB260021_vignette-1-300x216_204.jpg', 'PB260021_vignette-1-300x216_204', NULL, NULL, NULL, 23, NULL),
(53, 'images/ImageSite/Article/presidents_251.jpg', 'presidents_251', NULL, NULL, NULL, 23, NULL),
(54, 'images/ImageSite/Article/proc-200x300_192.jpg', 'proc-200x300_192', NULL, NULL, NULL, 23, NULL),
(55, 'images/ImageSite/Article/R-Bernard-40-1024x683_282.jpg', 'R-Bernard-40-1024x683_282', NULL, NULL, NULL, 23, NULL),
(56, 'images/ImageSite/Article/Saturne-300x225_190.png', 'Saturne-300x225_190', NULL, NULL, NULL, 23, NULL),
(57, 'images/ImageSite/Article/site-ORION-1024x533_271.png', 'site-ORION-1024x533_271', NULL, NULL, NULL, 23, NULL),
(58, 'images/ImageSite/Article/SOLEIL_MOSAIC_194.jpg', 'SOLEIL_MOSAIC_194', NULL, NULL, NULL, 23, NULL),
(59, 'images/ImageSite/Article/sunset_lebetz_195.jpg', 'sunset_lebetz_195', NULL, NULL, NULL, 23, NULL),
(60, 'images/ImageSite/Article/video0008-300x216_191.jpg', 'video0008-300x216_191', NULL, NULL, NULL, 23, NULL),
(61, 'images/ImageSite/logo/03_logo_dark_blue_082.bmp', '03_logo_dark_blue_082', NULL, NULL, NULL, 24, NULL),
(62, 'images/ImageSite/logo/150702_144927_083.jpg', '150702_144927_083', NULL, NULL, NULL, 24, NULL),
(63, 'images/ImageSite/logo/2018-LOGO-DEPT43--300x59_058.jpg', '2018-LOGO-DEPT43--300x59_058', NULL, NULL, NULL, 24, NULL),
(64, 'images/ImageSite/logo/2018-logo-REGION-300x149_057.png', '2018-logo-REGION-300x149_057', NULL, NULL, NULL, 24, NULL),
(65, 'images/ImageSite/logo/20220516_142007_044.jpg', '20220516_142007_044', NULL, NULL, NULL, 24, NULL),
(66, 'images/ImageSite/logo/afa-nom-264x300_063.png', 'afa-nom-264x300_063', NULL, NULL, NULL, 24, NULL),
(67, 'images/ImageSite/logo/boutonslivres_078.jpg', 'boutonslivres_078', NULL, NULL, NULL, 24, NULL),
(68, 'images/ImageSite/logo/btn-accueil_055.png', 'btn-accueil_055', NULL, NULL, NULL, 22, NULL),
(69, 'images/ImageSite/logo/CALHL-V-sign_dessous-couleur-pour-écran-300x230_062.png', 'CALHL-V-sign_dessous-couleur-pour-écran-300x230_062', NULL, NULL, NULL, 24, NULL),
(70, 'images/ImageSite/logo/comcom-2018-300x89_059.png', 'comcom-2018-300x89_059', NULL, NULL, NULL, 24, NULL),
(71, 'images/ImageSite/logo/drapeau-européen-feader-300x233_060.jpg', 'drapeau-européen-feader-300x233_060', NULL, NULL, NULL, 24, NULL),
(72, 'images/ImageSite/logo/ed-logo-300x200_084.jpg', 'ed-logo-300x200_084', NULL, NULL, NULL, 24, NULL),
(73, 'images/ImageSite/logo/header-logo_077.png', 'header-logo_077', NULL, NULL, NULL, 24, NULL),
(74, 'images/ImageSite/logo/LEADER-298x300_061.jpg', 'LEADER-298x300_061', NULL, NULL, NULL, 24, NULL),
(75, 'images/ImageSite/logo/logo-1-300x134_081.png', 'logo-1-300x134_081', NULL, NULL, NULL, 24, NULL),
(76, 'images/ImageSite/logo/logo-astusciences_065.png', 'logo-astusciences_065', NULL, NULL, NULL, 24, NULL),
(77, 'images/ImageSite/logo/logo-cite-230_076.png', 'logo-cite-230_076', NULL, NULL, NULL, 24, NULL),
(78, 'images/ImageSite/logo/logo-e1481710053335_001.png', 'logo-e1481710053335_001', NULL, NULL, NULL, 24, NULL),
(79, 'images/ImageSite/logo/Logo-quadri-nega-300x90_064.png', 'Logo-quadri-nega-300x90_064', NULL, NULL, NULL, 24, NULL),
(80, 'images/ImageSite/logo/logo-static-300x113_088.png', 'logo-static-300x113_088', NULL, NULL, NULL, 24, NULL),
(81, 'images/ImageSite/logo/logo-ville-2011_056.png', 'logo-ville-2011_056', NULL, NULL, NULL, 24, NULL),
(82, 'images/ImageSite/logo/logoCMJN3003cmBordd-287x300_066.jpg', 'logoCMJN3003cmBordd-287x300_066', NULL, NULL, NULL, 24, NULL),
(83, 'images/ImageSite/logo/logo_cnes_carre3_080.png', 'logo_cnes_carre3_080', NULL, NULL, NULL, 24, NULL),
(84, 'images/ImageSite/logo/logo_noir_2-300x33_086.png', 'logo_noir_2-300x33_086', NULL, NULL, NULL, 24, NULL),
(85, 'images/ImageSite/logo/oacc1_600-300x300_085.jpg', 'oacc1_600-300x300_085', NULL, NULL, NULL, 24, NULL),
(86, 'images/ImageSite/logo/plan_045.png', 'plan_045', NULL, NULL, NULL, 24, NULL),
(87, 'images/ImageSite/logo/projet-def-autocollant-2-300x213_067.png', 'projet-def-autocollant-2-300x213_067', NULL, NULL, NULL, 24, NULL),
(88, 'images/ImageSite/logo/siteon0_079.png', 'siteon0_079', NULL, NULL, NULL, 24, NULL),
(89, 'images/ImageSite/logo/wpe5b5d13f_087.png', 'wpe5b5d13f_087', NULL, NULL, NULL, 24, NULL),
(90, 'images/ImageSite/nos-prochaines-soirees/Jeanne-11_221.jpg', 'Jeanne-11_221', NULL, NULL, NULL, 25, NULL),
(91, 'images/ImageSite/nos-prochaines-soirees/nocturne-5757205848a54442a292e2d720d5b153-1024x623_222.jpg', 'nocturne-5757205848a54442a292e2d720d5b153-1024x623_222', NULL, NULL, NULL, 25, NULL),
(92, 'images/ImageSite/wp/A0b2_018.jpg', 'A0b2_018', NULL, NULL, NULL, 26, NULL),
(93, 'images/NosPhotos/amas_globulaire/amas_globulaire_001.jpg', 'amas_globulaire_001', NULL, 'M13 160 ED JEANNE CANON 500D + OCCULAIRE 13 mm POSE 30 * 60s - 1600 ISO - 30 DARK - 30 OFFSET PIXINSITE - 26 image - TRAITEMENT PIXINSITE', '2014-06-23', 10, NULL),
(94, 'images/NosPhotos/amas_globulaire/amas_globulaire_002.jpg', 'amas_globulaire_002', NULL, 'M13 APN K5 OBJECTIF 200 MM', '2014-02-26', 10, NULL),
(95, 'images/NosPhotos/amas_globulaire/amas_globulaire_003.jpg', 'amas_globulaire_003', NULL, 'M13 160 ED JEANNE CANON 500D + BARLOW ZEISS 3x (Michel) AUTOGUIDAGE POSE 29 * 180s - 800 ISO - 7 DARK - 10 OFFSET PIXINSITE - 29 image - TRAITEMENT PIXINSITE', '2015-07-10', 10, NULL),
(96, 'images/NosPhotos/amas_globulaire/amas_globulaire_004.jpg', 'amas_globulaire_004', NULL, 'M13 160 ED JEANNE CANON 500D + BARLOW ZEISS 3x (Michel) AUTOGUIDAGE POSE 29 * 180s - 800 ISO - 7 DARK - 10 OFFSET PIXINSITE - 29 image - TRAITEMENT SIRIL (raphael)', '2015-07-10', 10, NULL),
(97, 'images/NosPhotos/amas_globulaire/amas_globulaire_005.jpg', 'amas_globulaire_005', NULL, 'M13 TELESCOPE skywatcher 150/750 - NATHAN MONTURE NEQ3-2 CANON 1200D PAS D\'AUTOGUIDAGE POSE 42 * 35s - 3200 ISO - 47 DARK - 45 OFFSET DeepSkyStackker', '2018-05-10', 10, NULL),
(98, 'images/NosPhotos/amas_globulaire/amas_globulaire_006.jpg', 'amas_globulaire_006', NULL, 'l\'amas globulaire M3 prise en plein centre du Puy-en-Velay matériel utilisé : C11edge+reducteur 0.7; nikon d7500 101 poses (sur 160) de 20s 800iso; avec darks biases et flats. traitement avec SIril', '2020-03-16', 10, NULL),
(99, 'images/NosPhotos/amas_globulaire/amas_globulaire_007.jpg', 'amas_globulaire_007', NULL, 'M13 un des plus gros amas globulaire. photo prise en centre ville matériel utilisé : C11edge+reducteur 0.7; nikon d7500 30 poses de 90s 400iso; avec darks biases et flats. traitement avec Siril', '2020-04-06', 10, NULL),
(100, 'images/NosPhotos/amas_globulaire/amas_globulaire_008.png', 'amas_globulaire_008', NULL, 'M13 André Brissot', '2024-06-11', 10, NULL),
(101, 'images/NosPhotos/amas_ouvert/amas_ouvert_001.jpg', 'amas_ouvert_001', NULL, 'NGC 457 (E.T.) CFF 160 + Monture CGE PRO CANON 550D + AUTOGUIDAGE + FOYER POSE 11 *120s - 800 ISO - 0 DARK - 20 OFFSET (ceux de M76) PIXINSITE 11 images', '0000-00-00', 10, NULL),
(102, 'images/NosPhotos/amas_ouvert/amas_ouvert_002.jpg', 'amas_ouvert_002', NULL, 'AMAS DE LA CRECHE FOYER 120ED', '2014-02-26', 10, NULL),
(103, 'images/NosPhotos/amas_ouvert/amas_ouvert_003.jpg', 'amas_ouvert_003', NULL, 'NGC 457 (E.T.) CFF 160 + Monture CGE PRO CANON 550D + AUTOGUIDAGE + FOYER POSE 11 *120s - 800 ISO - 0 DARK - 20 OFFSET (ceux de M76) PIXINSITE 11 images', '0000-00-00', 10, NULL),
(104, 'images/NosPhotos/amas_ouvert/amas_ouvert_004.jpg', 'amas_ouvert_004', NULL, 'M37 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + EXTENDER + AUTOGUIDAGE POSE 78 * 70s - 1600 ISO - 5 DARK -20 OFFSET PIXINSITE 78 images', '2014-12-23', 10, NULL),
(105, 'images/NosPhotos/amas_ouvert/amas_ouvert_005.jpg', 'amas_ouvert_005', NULL, 'Double AMAS de PERSEE 80ED Michel + Monture EQ3 CANON 500D POSE 31 * 30s - 800 ISO - 20 DARK -50 OFFSET PIXINSITE 31 images', '2015-11-07', 10, NULL),
(106, 'images/NosPhotos/amas_ouvert/amas_ouvert_006.jpg', 'amas_ouvert_006', NULL, 'Double AMAS de PERSEE Monture EQ3 CANON 550D + objectif Sigma 300 mm F2.8 POSE 37 * 40s - 1600 ISO -0 DARK -0 OFFSET - 0 FLAT Traitement DSS + paint.net (Jeanne)', '2017-08-19', 10, NULL),
(107, 'images/NosPhotos/amas_ouvert/amas_ouvert_007.jpg', 'amas_ouvert_007', NULL, 'Rose de caroline Monture EQ3 CANON 550D + objectif Sigma 300 mm F2.8 29 POSE ??? OFFSET - ??? FLAT Traitement Raphael', '2017-09-23', 10, NULL),
(108, 'images/NosPhotos/amas_ouvert/amas_ouvert_008.jpg', 'amas_ouvert_008', NULL, 'Rose de caroline Monture EQ3 CANON 550D + objectif Sigma 300 mm F2.8 29 POSE ??? OFFSET - ??? FLAT Traitement Damiens', '2017-09-23', 10, NULL),
(109, 'images/NosPhotos/amas_ouvert/amas_ouvert_009.jpg', 'amas_ouvert_009', NULL, 'Rose de caroline Monture EQ3 CANON 550D + objectif Sigma 300 mm F2.8 29 POSE ??? OFFSET - ??? FLAT Traitement jeanne DSS + PAINT.net + OFFICE 2010 PREVIEW', '2017-09-23', 10, NULL),
(110, 'images/NosPhotos/amas_ouvert/amas_ouvert_010.jpg', 'amas_ouvert_010', NULL, 'NGC 7789 Rose de caroline Monture EQ3 CANON 550D + objectif Sigma 300 mm F2.8 1 POSE ??? OFFSET - ??? FLAT Traitement Jeanne - Brut preview', '2017-09-23', 10, NULL),
(111, 'images/NosPhotos/amas_ouvert/amas_ouvert_011.jpg', 'amas_ouvert_011', NULL, 'M37; C11 egde+reducteur0.7 avec canon 500d 18 poses de 60s traitement siril', '2019-12-31', 10, NULL),
(112, 'images/NosPhotos/arc_en_ciel/arc_en_ciel_001.jpg', 'arc_en_ciel_001', NULL, 'JEANNE', '2013-05-19', 14, NULL),
(113, 'images/NosPhotos/circumpolaire/circumpolaire_001.jpg', 'circumpolaire_001', NULL, 'CIRCUMPOLAIRE Observatoire Le Betz Monture EQ3 Le Club Reflex CANON de Christelle Objectif 18 - 55 mm F/3.5 - Focale 18 mm POSE 12 * 480s - 800 ISO - 0 DARK - 0 OFFSET Traitement PHOTOSHOP + STARMAX Traitement Cyril', '2018-05-12', 13, NULL),
(114, 'images/NosPhotos/circumpolaire/circumpolaire_002.jpg', 'circumpolaire_002', NULL, 'CIRCUMPOLAIRE Observatoire Le Betz Monture EQ3 Le Club Reflex CANON de Christelle Objectif 18 - 55 mm F/3.5 - Focale 18 mm POSE 12 * 480s - 800 ISO - 0 DARK - 0 OFFSET Traitement affinity + StarstaX Traitement CHRISTELLE', '2018-05-12', 13, NULL),
(115, 'images/NosPhotos/cometes/cometes_001.jpg', 'cometes_001', NULL, 'C/2020 F3 (NEOWISE), APN Compact de Jeanne F/D 5.5 - Focale 172 mm Temps de pose 1/4 sec - 3200 ISO Par Jeanne', '2020-07-08', 11, NULL),
(116, 'images/NosPhotos/cometes/cometes_002.jpg', 'cometes_002', NULL, 'COMETE PANSTAR APN + MONTURE EQUATORIALE PHOTO PATRICK PELETIER', '2014-02-26', 11, NULL),
(117, 'images/NosPhotos/cometes/cometes_003.jpg', 'cometes_003', NULL, 'Orion et le Taureau et le comète Lovejoy - Alain OLYMPUS DIGITAL CAMERA Stylus1', '2015-01-17', 11, NULL),
(118, 'images/NosPhotos/cometes/cometes_004.gif', 'cometes_004', NULL, 'COMETE C2014 Q2 (LOVEJOY) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR + PAS D\'AUTOGUIDAGE POSE 40 * 90s - 1600 ISO - 30 DARK -80 OFFSET PIXINSITE 40 images traitées individuellements Photocape pour le GIF animé', '2015-01-17', 11, NULL),
(119, 'images/NosPhotos/cometes/cometes_004.jpg', 'cometes_004', NULL, 'COMETE C2014 Q2 (LOVEJOY) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR + PAS D\'AUTOGUIDAGE POSE 40 * 90s - 1600 ISO - 30 DARK -80 OFFSET PIXINSITE 40 images', '2015-01-17', 11, NULL),
(120, 'images/NosPhotos/cometes/cometes_005.gif', 'cometes_005', NULL, 'COMETE C2014 Q2 (LOVEJOY) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR + PAS D\'AUTOGUIDAGE POSE 40 * 90s - 1600 ISO - 30 DARK -80 OFFSET PIXINSITE 40 images traitées individuellements Photocape pour le GIF animé', '2015-01-17', 11, NULL),
(121, 'images/NosPhotos/cometes/cometes_005.jpg', 'cometes_005', NULL, 'COMETE C2014 Q2 (LOVEJOY) - Alain OLYMPUS DIGITAL CAMERA Stylus1 ouverture F/2.8 pose 15s 640 iso traitement avec photo suite du contraste', '2015-01-17', 11, NULL),
(122, 'images/NosPhotos/cometes/cometes_006.jpg', 'cometes_006', NULL, 'COMETE C2014 Q2 (LOVEJOY) - Alain OLYMPUS DIGITAL CAMERA Stylus1 ouverture F/2.8 pose 15s 640 iso traitement avec photo suite du contraste', '2015-01-17', 11, NULL),
(123, 'images/NosPhotos/cometes/cometes_007.jpg', 'cometes_007', NULL, 'COMETE C2014 Q2 (LOVEJOY) - Alain OLYMPUS DIGITAL CAMERA Stylus1 ouverture F/2.8 pose 15s 640 iso traitement avec photo suite du contraste', '2015-01-17', 11, NULL),
(124, 'images/NosPhotos/cometes/cometes_008.jpg', 'cometes_008', NULL, 'COMETE C2014 Q2 (LOVEJOY) - Alain OLYMPUS DIGITAL CAMERA Stylus1 zoom 100mm environ pose 10s à F/2.8 - 800 iso', '2015-01-17', 11, NULL),
(125, 'images/NosPhotos/cometes/cometes_009.jpg', 'cometes_009', NULL, 'COMETE C2014 Q2 (LOVEJOY) - Alain OLYMPUS DIGITAL CAMERA Stylus1 zoom 100mm environ pose 10s à F/2.8 - 800 iso', '2015-01-17', 11, NULL),
(126, 'images/NosPhotos/cometes/cometes_010.jpg', 'cometes_010', NULL, 'De Sirius à Aldébaran - Alain OLYMPUS DIGITAL CAMERA Stylus1 à regarder plein écran dans le noir!!', '2015-01-17', 11, NULL),
(127, 'images/NosPhotos/cometes/cometes_011.jpg', 'cometes_011', NULL, 'De Sirius à Aldébaran - Alain OLYMPUS DIGITAL CAMERA Stylus1 à regarder plein écran dans le noir!!', '2015-01-17', 11, NULL),
(128, 'images/NosPhotos/cometes/cometes_012.jpg', 'cometes_012', NULL, 'Orion et le Taureau et le comète Lovejoy - Alain OLYMPUS DIGITAL CAMERA Stylus1', '2015-01-17', 11, NULL),
(129, 'images/NosPhotos/cometes/cometes_013.jpg', 'cometes_013', NULL, 'COMETE C2013 US10 (CATALINA) CANON 550D du club Newton 400 sur monture a fourche du club FOYER 16 x 20 sec - 800 ISO 20 DARK - 50 OFFSET - 0 FLATS traitement Pixinsight', '2015-12-12', 11, NULL),
(130, 'images/NosPhotos/cometes/cometes_014.jpg', 'cometes_014', NULL, 'COMETE PANSTAR APN + MONTURE EQUATORIALE PHOTO PATRICK PELETIER', '2017-03-06', 11, NULL),
(131, 'images/NosPhotos/cometes/cometes_015.jpg', 'cometes_015', NULL, 'COMETE C2013 US10 (CATALINA) CANON 550D du club Newton 400 sur monture a fourche du club FOYER 16 x 20 sec - 800 ISO 20 DARK - 50 OFFSET - 0 FLATS traitement Pixinsight', '2015-12-12', 11, NULL),
(132, 'images/NosPhotos/cometes/cometes_016.jpg', 'cometes_016', NULL, 'COMETE C2014 Q2 (LOVEJOY) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR + PAS D\'AUTOGUIDAGE POSE 40 * 90s - 1600 ISO - 30 DARK -80 OFFSET PIXINSITE 40 images', '2015-01-17', 11, NULL),
(133, 'images/NosPhotos/cometes/cometes_017.gif', 'cometes_017', NULL, 'comète 21P Giacobini Zinner TOA 130 + Monture EM_200 CYRIL PENTAX K5 + FOYER DIRECT + PAS D\'AUTOGUID?AGE POSE 3* 120s - 1600 ISO -50 DARK - 80 OFFSET - 13 images (pixinsight & photoscape)', '2018-08-11', 11, NULL),
(134, 'images/NosPhotos/cometes/cometes_017.jpg', 'cometes_017', NULL, 'comète 21P Giacobini Zinner TOA 130 + Monture EM_200 CYRIL PENTAX K5 + FOYER DIRECT + PAS D\'AUTOGUID?AGE POSE 3* 120s - 1600 ISO -50 DARK - 80 OFFSET - 3 images PIXINSIGHT', '2018-08-11', 11, NULL),
(135, 'images/NosPhotos/cometes/cometes_018.gif', 'cometes_018', NULL, 'comète 21P Giacobini Zinner TOA 130 + Monture EM_200 CYRIL PENTAX K5 + FOYER DIRECT + PAS D\'AUTOGUID?AGE POSE 3* 120s - 1600 ISO -50 DARK - 80 OFFSET - 13 images (pixinsight & photoscape)', '2018-08-11', 11, NULL),
(136, 'images/NosPhotos/cometes/cometes_018.jpg', 'cometes_018', NULL, 'Comete C/2018 Y1 photo prise rapidement avant que le ciel ce couvre site le betz avec Raphael et Michel 1 images avec monté histograme', '2018-02-28', 11, NULL),
(137, 'images/NosPhotos/cometes/cometes_019.jpg', 'cometes_019', NULL, 'Comète C/2019 Y4 prise le 11/04/2020. Matériel: C11 edge + reducteur 0.7; Nikon d7500 37 pose de 60 secondes 400iso; traitement Siril', '2020-04-12', 11, NULL),
(138, 'images/NosPhotos/cometes/cometes_020.jpg', 'cometes_020', NULL, 'Comète C/2019 Y4 prise le 11/04/2020. Matériel: C11 edge + reducteur 0.7; Nikon d7500 37 pose de 60 secondes 400iso; traitement Siril', '2020-04-12', 11, NULL),
(139, 'images/NosPhotos/cometes/cometes_021.jpg', 'cometes_021', NULL, 'C/2020 F3 (NEOWISE), APN Compact de Jeanne F/D 5.5 - Focale 172 mm Temps de pose 1/4 sec - 3200 ISO Par Jeanne', '2020-07-08', 11, NULL),
(140, 'images/NosPhotos/cometes/cometes_022.jpg', 'cometes_022', NULL, 'C/2020 F3 (NEOWISE), APN PENTAX K5 F/D 5.6 - Focale 55 mm Temps de pose 13 sec - 1600 ISO Par Cyril', '2020-07-12', 11, NULL),
(141, 'images/NosPhotos/cometes/cometes_023.jpg', 'cometes_023', NULL, 'C/2020 F3 (NEOWISE), APN PENTAX K5 F/D 5.6 - Focale 55 mm Temps de pose 13 sec - 1600 ISO Par Cyril', '2020-07-12', 11, NULL),
(142, 'images/NosPhotos/cometes/cometes_024.jpg', 'cometes_024', NULL, 'C/2020 F3 (NEOWISE), APN de Bernard F/D 5.6 - Focale 400 mm Temps de pose 4 sec - 800 ISO Par Bernard', '2020-07-09', 11, NULL),
(143, 'images/NosPhotos/cometes/cometes_025.jpg', 'cometes_025', NULL, 'C/2020 F3 (NEOWISE), APN de Bernard F/D 5.6 - Focale 400 mm Temps de pose 4 sec - 800 ISO Par Bernard', '2020-07-09', 11, NULL),
(144, 'images/NosPhotos/cometes/cometes_026.jpg', 'cometes_026', NULL, 'C/2020 F3 (NEOWISE), APN de Raphael (SONY ) F/D ??? Focale ??? Temps de pose 4 sec -1600 ISO Par Raphael', '2020-07-19', 11, NULL),
(145, 'images/NosPhotos/cometes/cometes_027.jpg', 'cometes_027', NULL, 'C/2020 F3 (NEOWISE), APN de Raphael (SONY ) F/D 2.8 Focale 135 mm 8 pose -Temps de pose 3.2 sec -1600 ISO', '2020-07-19', 11, NULL),
(146, 'images/NosPhotos/cometes/cometes_028.jpg', 'cometes_028', NULL, 'C/2023 A3 (Tsuchinshan-ATLAS), APN de Daniel F/D 4 Focale 191 mm Temps de pose 13 sec 3200 ISO Au Bouchet saint nicolas Par Dan', '2024-10-20', 11, NULL),
(147, 'images/NosPhotos/cometes/cometes_029.jpg', 'cometes_029', NULL, 'C/2023 A3 (Tsuchinshan-ATLAS), APN de Daniel F/D 4 Focale 70 mm Temps de pose 13 sec 3200 ISO Au Bouchet saint nicolas Par Dan', '2024-10-20', 11, NULL),
(148, 'images/NosPhotos/cometes/cometes_030.jpg', 'cometes_030', NULL, 'C/2023 A3 (Tsuchinshan-ATLAS), APN de Daniel F/D 4 Focale 100 mm Temps de pose 13 sec 3200 ISO Au Bouchet saint nicolas Par Dan', '2024-10-20', 11, NULL),
(149, 'images/NosPhotos/cometes/cometes_031.jpg', 'cometes_031', NULL, 'C/2023 A3 (Tsuchinshan-ATLAS), APN de Bernard F/D 2.8 Focale 90 mm Temps de pose 11.2 sec -1250 ISO Au Bouchet saint nicolas Par Bernard', '2024-10-20', 11, NULL),
(150, 'images/NosPhotos/cometes/cometes_032.jpg', 'cometes_032', NULL, 'C/2023 A3 (Tsuchinshan-ATLAS), APN de Bernard F/D 2.8 Focale 200 mm Temps de pose 13 sec -1600 ISO Au Bouchet saint nicolas Par Bernard', '2024-10-20', 11, NULL),
(151, 'images/NosPhotos/cometes/cometes_033.jpg', 'cometes_033', NULL, 'Comete C2023 A3 ( Tsuchinshan-ATLAS) CYRIL Photo prise du Betz TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC REDUCTEUR 1 POSE 60s - GAIN 130 - 30 DARK - 80 OFFSET- 30 FLAT PixInsight j\'ai pas pu faire d’empilement, j\'ai eu des difficulté technique et parmi les 3 photo que j\'ai faite seule la première etait bonne', '2024-10-31', 11, NULL),
(152, 'images/NosPhotos/cometes/cometes_034.jpg', 'cometes_034', NULL, 'Comete C2023 A3 ( Tsuchinshan-ATLAS) RAPHAEL / MICHEL Photo prise du Betz Lunette 102 (sur le C14) + Monture CGE PRO - ASI 294 REDUCTEUR', '2024-10-31', 11, NULL),
(153, 'images/NosPhotos/cometes/cometes_035.jpg', 'cometes_035', NULL, 'C2023_A3_ Tsuchinshan-ATLAS (CYRIL) Photo prise du Betz TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC REDUCTEUR 5 POSE 200s - GAIN 130 - 90 DARK - 80 OFFSET-50 FLAT PixInsight', '2024-11-02', 11, NULL),
(154, 'images/NosPhotos/cometes/cometes_036.jpg', 'cometes_036', NULL, 'C2023_A3_ Tsuchinshan-ATLAS (RAPHAEL, Michel,...) Photo prise du Betz Photo effectué le 31/10/2024 par Michel, Alexandre, Raphaël Comète C/2023 A3 – lunette 102 avec réducteur/correcteur soit 560mm : 5 poses de 30 sec empilées , traitées avec SIRIL', '2024-10-31', 11, NULL),
(155, 'images/NosPhotos/conjonction/conjonction_001.jpg', 'conjonction_001', NULL, 'Photo Alain Lune -Jupiter - Aldébaran 1600 ISO F/4 1/2s 19 mm.', '2025-03-03', 17, NULL),
(156, 'images/NosPhotos/conjonction/conjonction_002.jpg', 'conjonction_002', NULL, 'Conjonction Venus - Mercure par Jean Michel VIALLY NIKON D70 Objectif : 300 mm F/5 Temps de pose 1,6 sec', '2015-01-11', 17, NULL),
(157, 'images/NosPhotos/conjonction/conjonction_003.jpg', 'conjonction_003', NULL, 'Conjonction Venus - Mercure par Jean Michel VIALLY NIKON D70 Objectif : 300 mm F/5 Temps de pose 1,6 sec', '2015-01-11', 17, NULL),
(158, 'images/NosPhotos/conjonction/conjonction_004.jpg', 'conjonction_004', NULL, 'Conjonction Venus - Mercure par Jean Michel VIALLY NIKON D7100 Objectif : 300 mm F/5 Temps de pose 1/3 sec - 1250 ISO', '2015-01-12', 17, NULL),
(159, 'images/NosPhotos/conjonction/conjonction_005.jpg', 'conjonction_005', NULL, 'Conjonction Venus - Mercure par Jean Michel VIALLY NIKON D7100 Objectif : 300 mm F/5 Temps de pose 1/3 sec - 1250 ISO', '2015-01-12', 17, NULL),
(160, 'images/NosPhotos/conjonction/conjonction_006.jpg', 'conjonction_006', NULL, 'Conjonction Venus - Mercure par Jean Michel VIALLY NIKON D7100 Objectif : 300 mm F/5 Temps de pose 1/3 sec - 2000 ISO', '2015-01-12', 17, NULL),
(161, 'images/NosPhotos/conjonction/conjonction_007.jpg', 'conjonction_007', NULL, 'Alain Le Betz Conjonction SAturne Jupitere', '2020-12-20', 17, NULL),
(162, 'images/NosPhotos/conjonction/conjonction_008.jpg', 'conjonction_008', NULL, 'Conjonction Venus - Mercure par Jean Michel VIALLY NIKON D7100 Objectif : 300 mm F/5 Temps de pose 1/3 sec - 2000 ISO', '2015-01-12', 17, NULL),
(163, 'images/NosPhotos/conjonction/conjonction_009.jpg', 'conjonction_009', NULL, 'Raphael depuis le jardin de Michel dimanche 20/12/2020 vers 18h30 1 pose de 1/30ème de seconde avec un objectif 300/2.8 + doubleur soit 600 mm fermé à FD8, à 800 ISO pas de suivi, aucun traitement, juste recadrée', '2020-12-20', 17, NULL),
(164, 'images/NosPhotos/conjonction/conjonction_010.png', 'conjonction_010', NULL, 'Francois Monatte Dans L\'allier Conjonction saturne jupitere', '2020-12-18', 17, NULL),
(165, 'images/NosPhotos/conjonction/conjonction_011.jpg', 'conjonction_011', NULL, 'Francois Monatte Dans L\'allier Conjonction saturne jupitere', '2020-12-18', 17, NULL),
(166, 'images/NosPhotos/conjonction/conjonction_012.jpg', 'conjonction_012', NULL, '2 mars à 19h45 - Bernard Boitier canon R7 ( hybride) Objectif 70-200 / 2.8 (constant) 88mm / 800 Iso à 2.8 1.5 seconde. Léger recadrage', '2025-03-02', 17, NULL),
(167, 'images/NosPhotos/conjonction/conjonction_013.jpg', 'conjonction_013', NULL, 'Photo Alain Lune -Jupiter - Aldébaran 1600 ISO F/4 1/3s 39 mm.', '2025-03-03', 17, NULL),
(168, 'images/NosPhotos/coucher_soleil/coucher_soleil_001.jpg', 'coucher_soleil_001', NULL, 'LE BETZ DANIEL VINCENT CANON 600D + objectif 200mm', '2014-03-07', 18, NULL),
(169, 'images/NosPhotos/coucher_soleil/coucher_soleil_002.jpg', 'coucher_soleil_002', NULL, 'LE BETZ PENTAX PENTAX K-5 ƒ/7,1 1/125 55 mm 400 ISO', '2012-03-21', 18, NULL),
(170, 'images/NosPhotos/coucher_soleil/coucher_soleil_003.jpg', 'coucher_soleil_003', NULL, 'LE BETZ', '2012-03-21', 18, NULL),
(171, 'images/NosPhotos/coucher_soleil/coucher_soleil_004.jpg', 'coucher_soleil_004', NULL, 'LE BETZ PENTAX PENTAX K-5 ƒ/7,1 1/125 55 mm 400 ISO', '2012-03-21', 18, NULL),
(172, 'images/NosPhotos/coucher_soleil/coucher_soleil_005.jpg', 'coucher_soleil_005', NULL, 'LE BETZ PENTAX PENTAX K-5 ƒ/7,1 1/125 55 mm 400 ISO', '2012-03-21', 18, NULL),
(173, 'images/NosPhotos/coucher_soleil/coucher_soleil_006.jpg', 'coucher_soleil_006', NULL, 'LE BETZ PENTAX PENTAX K-5 ƒ/7,1 1/125 55 mm 400 ISO', '2012-03-21', 18, NULL),
(174, 'images/NosPhotos/etoiles/etoiles_001.jpg', 'etoiles_001', NULL, 'ETOILE WZ CASSIOPEE LUNETTE CF160 (Jeanne) CGEPRO (Club) CANON 550D (Club) PROJECTION OCULAIRE', '2016-10-29', 16, NULL),
(175, 'images/NosPhotos/etoiles/etoiles_002.jpg', 'etoiles_002', NULL, 'Le trapeze (nebuleuse ORION) Photo prise de l\'observatoire. C14 Obsevatoire + Monture CGE PRO CAMERA DMK ORION BARLOW x2 TELEVUE + FLIP MIROR Schema explicatif du trapeze', '2022-02-05', 16, NULL),
(176, 'images/NosPhotos/etoiles/etoiles_003.jpg', 'etoiles_003', NULL, 'ETOILE WZ CASSIOPEE LUNETTE CF160 (Jeanne) CGEPRO (Club) CANON 550D (Club) PROJECTION OCULAIRE', '2016-10-29', 16, NULL),
(177, 'images/NosPhotos/etoiles/etoiles_004.jpg', 'etoiles_004', NULL, 'Le trapeze (nebuleuse ORION) Photo prise de l\'observatoire. C14 Obsevatoire + Monture CGE PRO CAMERA DMK ORION BARLOW x2 TELEVUE + FLIP MIROR', '2022-02-05', 16, NULL),
(178, 'images/NosPhotos/etoiles/etoiles_005.jpg', 'etoiles_005', NULL, 'Le trapeze (nebuleuse ORION) Photo prise de l\'observatoire. C14 Obsevatoire + Monture CGE PRO CAMERA DMK ORION BARLOW x2 TELEVUE + FLIP MIROR Video traité par Autostakkert par raphael', '2022-02-05', 16, NULL),
(179, 'images/NosPhotos/galaxie/galaxie_001.jpg', 'galaxie_001', NULL, 'M33 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + CORRECTEUR 67_FL POSE 19 * 600s - 1600 ISO - 34 DARK - 50 OFFSET PIXINSITE 19 images', '2014-11-21', 9, NULL),
(180, 'images/NosPhotos/galaxie/galaxie_002.jpg', 'galaxie_002', NULL, 'M31', NULL, 9, NULL),
(181, 'images/NosPhotos/galaxie/galaxie_003.jpg', 'galaxie_003', NULL, 'M31', '2013-09-04', 9, NULL),
(182, 'images/NosPhotos/galaxie/galaxie_004.jpg', 'galaxie_004', NULL, 'M51 160 ED JEANNE CANON 500D + OCCULAIRE 36 mm POSE 29 * 2 mm - 800 ISO - 30 DARK - 86 OFFSET DSS - 23 image - TRAITEMENT PhotoShop CS2 (couleur auto + saturation des couleurs)', '2014-03-09', 9, NULL),
(183, 'images/NosPhotos/galaxie/galaxie_005.jpg', 'galaxie_005', NULL, 'M51 160 ED JEANNE CANON 500D + OCCULAIRE 36 mm POSE 29 * 2 mm - 800 ISO - 30 DARK - 86 OFFSET PIXINSITE - 24 image - TRAITEMENT PIXINSITE', '2014-03-09', 9, NULL),
(184, 'images/NosPhotos/galaxie/galaxie_006.jpg', 'galaxie_006', NULL, 'M51 160 ED JEANNE CANON 500D + OCCULAIRE 36 mm POSE 29 * 2 mm - 800 ISO - 30 DARK - 86 OFFSET DSS - 23 image - TRAITEMENT PhotoShop CS2 (couleur auto + saturation des couleurs)', '2014-03-09', 9, NULL),
(185, 'images/NosPhotos/galaxie/galaxie_007.jpg', 'galaxie_007', NULL, 'M81 160 ED JEANNE CANON 500D + OCCULAIRE 24 mm POSE 59 * 25 sec - 1600 ISO - 40 DARK - 101 OFFSET PIXINSITE - 59 image - TRAITEMENT PIXINSITE', '2014-03-27', 9, NULL),
(186, 'images/NosPhotos/galaxie/galaxie_008.jpg', 'galaxie_008', NULL, 'M86 / M84 TOA 130 + Monture EM_200 CYRIL PENTAX K5 au foyer POSE 29 * 110s - 800 ISO - 20 DARK - 80 OFFSET PIXINSITE 29 images', '2014-06-08', 9, NULL),
(187, 'images/NosPhotos/galaxie/galaxie_009.jpg', 'galaxie_009', NULL, 'M86 / M84 TOA 130 + Monture EM_200 CYRIL PENTAX K5 au foyer POSE 29 * 110s - 800 ISO - 20 DARK - 80 OFFSET PIXINSITE 29 images', '2014-06-08', 9, NULL),
(188, 'images/NosPhotos/galaxie/galaxie_010.jpg', 'galaxie_010', NULL, 'M31 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + SUPER CORRECTEUR POSE 18 * 200s - 800 ISO - 31 DARK - 80 OFFSET PIXINSITE 18 images', '2014-08-16', 9, NULL),
(189, 'images/NosPhotos/galaxie/galaxie_011.jpg', 'galaxie_011', NULL, 'M31 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + REDUCTEUR TOA-RD POSE 39 * 330s - 1600 ISO - 49 DARK - 80 OFFSET PIXINSITE 39 images', '2014-08-26', 9, NULL),
(190, 'images/NosPhotos/galaxie/galaxie_012.jpg', 'galaxie_012', NULL, 'M33 CFF 160 + Monture CGE PRO CANON 550D + AUTOGUIDAGE + FOYER POSE 10 * 480s - 800 ISO - 3 DARK - 0 OFFSET PIXINSITE 10 images', '2014-10-24', 9, NULL),
(191, 'images/NosPhotos/galaxie/galaxie_013.jpg', 'galaxie_013', NULL, 'M33 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + CORRECTEUR 67_FL POSE 13 * 700s - 1600 ISO - 32 DARK - 80 OFFSET PIXINSITE 12 images', '2014-10-31', 9, NULL),
(192, 'images/NosPhotos/galaxie/galaxie_014.jpg', 'galaxie_014', NULL, 'M33 (traitement raphael) CFF 160 + Monture CGE PRO CANON 550D + AUTOGUIDAGE + FOYER POSE 10 * 480s - 800 ISO - 3 DARK - 0 OFFSET Dcraw(conversion CR2 vers TIFF) DSS - 10 images Fitswork(histo) Registax (ondelettes)', '2014-10-24', 9, NULL),
(193, 'images/NosPhotos/galaxie/galaxie_015.jpg', 'galaxie_015', NULL, 'M33 (traitement raphael deuxième version) CFF 160 + Monture CGE PRO CANON 550D + AUTOGUIDAGE + FOYER POSE 10 * 480s - 800 ISO - 3 DARK - 0 OFFSET PIXINSITE 10 images', '2014-10-24', 9, NULL),
(194, 'images/NosPhotos/galaxie/galaxie_016.jpg', 'galaxie_016', NULL, 'NGC 253 (Galaxie du sculpteur) CFF 160 + Monture CGE PRO CANON 550D + AUTOGUIDAGE + FOYER POSE 19 * 90s - 800 ISO - 10 DARK - 50 OFFSET PIXINSITE 10 images', '2014-11-21', 9, NULL),
(195, 'images/NosPhotos/galaxie/galaxie_017.jpg', 'galaxie_017', NULL, 'M33 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + CORRECTEUR 67_FL POSE 19 * 600s - 1600 ISO - 34 DARK - 50 OFFSET PIXINSITE 19 images', '2014-11-21', 9, NULL),
(196, 'images/NosPhotos/galaxie/galaxie_018.jpg', 'galaxie_018', NULL, 'M33 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + CORRECTEUR 67_FL POSE 19 * 600s - 1600 ISO - 34 DARK - 50 OFFSET PIXINSITE 19 images (variante)', '2014-11-21', 9, NULL),
(197, 'images/NosPhotos/galaxie/galaxie_019.jpg', 'galaxie_019', NULL, 'M51 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + FOYER(AVEC ALLONGE) POSE 33 * 240s - 3200 ISO - 11 DARK - 60 OFFSET PIXINSITE 26 images', '2015-04-11', 9, NULL),
(198, 'images/NosPhotos/galaxie/galaxie_020.jpg', 'galaxie_020', NULL, 'M51 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE +(FOYER AVEC ALLONGE) POSE 33 * 240s - 3200 ISO - 11 DARK - 60 OFFSET PIXINSITE 26 image (variante sans DARK, ni OFFSET) + gommage traces de poussieres', '2015-04-11', 9, NULL),
(199, 'images/NosPhotos/galaxie/galaxie_021.jpg', 'galaxie_021', NULL, 'M51 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + FOYER (AVEC ALLONGE) POSE 33 * 240s - 3200 ISO - 11 DARK - 60 OFFSET PIXINSITE 26 image (variante sans DARK, ni OFFSET) + gommage traces de poussieres + annotation Pixinsight', '2015-04-11', 9, NULL),
(200, 'images/NosPhotos/galaxie/galaxie_022.jpg', 'galaxie_022', NULL, 'Triplet du lion (M65/M66/NGC 3628) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + CORRECTEUR POSE 34 * 240s - 1600 ISO - 9 DARK - 50 OFFSET PIXINSITE 28 image', '2015-05-07', 9, NULL),
(201, 'images/NosPhotos/galaxie/galaxie_023.jpg', 'galaxie_023', NULL, 'Triplet du lion (M65/M66/NGC 3628) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + CORRECTEUR POSE 34 * 240s - 1600 ISO - 9 DARK - 50 OFFSET PIXINSITE 28 image + annotation pixinsite', '2015-05-07', 9, NULL),
(202, 'images/NosPhotos/galaxie/galaxie_024.jpg', 'galaxie_024', NULL, 'M101 (Jeanne et Raphael) C8 du club + Monture CGE PRO du club CANON 550D du club + AUTOGUIDAG?E diviseur optique POSE 15 * 240s - 1600 ISO - 1 DARK - 0 OFFSET PIXINSIGHT 8 images', '2015-05-07', 9, NULL),
(203, 'images/NosPhotos/galaxie/galaxie_025.jpg', 'galaxie_025', NULL, 'Chaine de MARKARIAN (M84/M86+...) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + REDUCTEUR POSE 26 * 540s - 1600 ISO - 39 DARK - 51 OFFSET PIXINSITE 20 image', '2015-05-13', 9, NULL),
(204, 'images/NosPhotos/galaxie/galaxie_026.jpg', 'galaxie_026', NULL, 'Chaine de MARKARIAN (M84/M86+...) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + REDUCTEUR POSE 26 * 540s - 1600 ISO - 39 DARK - 51 OFFSET PIXINSITE 20 image (annotation IC/NGC/M)', '2015-05-13', 9, NULL),
(205, 'images/NosPhotos/galaxie/galaxie_027.jpg', 'galaxie_027', NULL, 'Chaine de MARKARIAN (M84/M86+...) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + REDUCTEUR POSE 26 * 540s - 1600 ISO - 39 DARK - 51 OFFSET PIXINSITE 20 image (annotation PGC).', '2015-05-13', 9, NULL),
(206, 'images/NosPhotos/galaxie/galaxie_028.jpg', 'galaxie_028', NULL, 'NGC 6946 et NGC 6939 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + CORRECTEUR POSE 26 * 500s - 1600 ISO - 45 DARK - 80 OFFSET PIXINSITE 26 image (annotation).', '2015-11-07', 9, NULL),
(207, 'images/NosPhotos/galaxie/galaxie_029.jpg', 'galaxie_029', NULL, 'NGC 6946 et NGC 6939 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + CORRECTEUR POSE 26 * 500s - 1600 ISO - 45 DARK - 80 OFFSET PIXINSITE 26 image (sans annotation).', '2015-11-07', 9, NULL),
(208, 'images/NosPhotos/galaxie/galaxie_030.jpg', 'galaxie_030', NULL, 'M31 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + REDUCTEUR TOA-RD POSE 39 * 330s - 1600 ISO - 49 DARK - 80 OFFSET PIXINSITE 39 images retraitement avec retrait du vert', '2014-08-26', 9, NULL),
(209, 'images/NosPhotos/galaxie/galaxie_031.jpg', 'galaxie_031', NULL, 'M101 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE + DITHERING CORRECTEUR POSE 8 * 600s - 1600 ISO - 35 DARK - 20 FLAT - 80 OFFSET PIXINSITE 5 images', '2016-04-29', 9, NULL),
(210, 'images/NosPhotos/galaxie/galaxie_032.jpg', 'galaxie_032', NULL, 'AMAS DE GALAXIE CHEVELURE BERENICE NGC 4193+ NGC4222+4216+4206+4189+4168+… TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE+ DITHERING CORRECTEUR POSE 14 * 600s - 1600 ISO - 35 DARK - 80 OFFSET PIXINSITE 13 images sans anotations', '2016-05-04', 9, NULL),
(211, 'images/NosPhotos/galaxie/galaxie_033.jpg', 'galaxie_033', NULL, 'AMAS DE GALAXIE CHEVELURE BERENICE NGC 4193+ NGC4222+4216+4206+4189+4168+… TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE+ DITHERING CORRECTEUR POSE 14 * 600s - 1600 ISO - 35 DARK - 80 OFFSET PIXINSITE 13 images anotation M / IC / NGC', '2016-05-04', 9, NULL),
(212, 'images/NosPhotos/galaxie/galaxie_034.jpg', 'galaxie_034', NULL, 'AMAS DE GALAXIE CHEVELURE BERENICE NGC 4193+ NGC4222+4216+4206+4189+4168+… TOA 130 + Monture EM_200 CYRIL PENTAX K5 + AUTOGUIDAGE+ DITHERING CORRECTEUR POSE 14 * 600s - 1600 ISO - 35 DARK - 80 OFFSET PIXINSITE 13 images anotations PGC', '2016-05-04', 9, NULL),
(213, 'images/NosPhotos/galaxie/galaxie_035.jpg', 'galaxie_035', NULL, 'M104 (Galaxie SOMBRERO) C8 (club) + Monture CGE PRO (club) CANON 500D (club) + AUTOGUIDAGE FOYER POSE 12 * 420s - 800 ISO - 12 DARK - 0 OFFSET traitement : * DARK => mediane * alignement images : align_image_stack * empilement : stackGM sans clipping (version Raphael) * courbe asinh + supp du fond et du vert avec Siril', '2016-05-04', 9, NULL),
(214, 'images/NosPhotos/galaxie/galaxie_036.jpg', 'galaxie_036', NULL, 'M61 + autres Galaxie de la VIERGE Lunette TOA 130 + Monture EM200 PENTAX K5 + AUTOGUIDAGE REDUCTEUR DE FOCALE POSE 29 * 400s - 1600 ISO - 31 DARK - 80 OFFSET- 51 FLAT Traitement Pixinsight', '2017-05-24', 9, NULL),
(215, 'images/NosPhotos/galaxie/galaxie_037.jpg', 'galaxie_037', NULL, 'NGC 5033 + autres galaxies dans la constellation des chiens de chasse Lunette TOA 130 + Monture EM200 PENTAX K5 + AUTOGUIDAGE REDUCTEUR DE FOCALE POSE 26 * 500s - 1600 ISO - 45 DARK - 80 OFFSET- 50 FLAT Traitement Pixinsight', '2017-05-26', 9, NULL),
(216, 'images/NosPhotos/galaxie/galaxie_038.jpg', 'galaxie_038', NULL, 'Amas de la vierge (galaxie) SONY A58 + objectif TAMRON 300 mm F/2.8 support double avec C8 en parallele Monture CGEM DX POSE 40 * 60s - 1600 ISO - 0 DARK - 0 OFFSET- 0 FLAT 35 meilleurs images Traitement Raphael', '2017-05-24', 9, NULL),
(217, 'images/NosPhotos/galaxie/galaxie_039.jpg', 'galaxie_039', NULL, 'Chaine de markarian SONY A58 + objectif TAMRON 300 mm F/2.8 support double avec C8 en parallele Monture CGEM DX POSE 41 * 120s - 1600 ISO - 0 DARK - 0 OFFSET- 0 FLAT 25 meilleurs images Traitement Raphael', '2017-05-26', 9, NULL),
(218, 'images/NosPhotos/galaxie/galaxie_040.jpg', 'galaxie_040', NULL, 'M31 Canon 550D + objectif Sigma 300 mm F/2.8 queue d\'aronde vixen + vis pas kodak Monture EQ3 POSE 40 * 120s - 1600 ISO - 12 DARK - 0 OFFSET-0 FLAT Traitement DSS + paint.net (Jeanne)', '2017-08-19', 9, NULL),
(219, 'images/NosPhotos/galaxie/galaxie_041.jpg', 'galaxie_041', NULL, 'M31 Canon 550D + objectif Sigma 300 mm F/2.8 Monture CGEM-DX + support avec pas kodax pour montage das plaque adaptatrice losmandy POSE 23* 120s - 800 ISO Traitement (Raphael)', '2017-08-19', 9, NULL),
(220, 'images/NosPhotos/galaxie/galaxie_042.jpg', 'galaxie_042', NULL, 'NGC 4565 (Galaxie de l\'Aiguille dans la Chevelure de Bérénice) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + CORRECTEUR + AUTOGUID?AGE POSE 22* 400s - 1600 ISO -21 DARK - 80 OFFSET - 30 FLAT PIXINSIGHT 21 images', '2018-04-21', 9, NULL),
(221, 'images/NosPhotos/galaxie/galaxie_043.jpg', 'galaxie_043', NULL, 'M81,C11 edge + réducteur 0,7 canon 500d empilement de 7 photos sur 10 de 90s 800 iso, traitement avec Siril 13/02/2019', '2019-02-18', 9, NULL),
(222, 'images/NosPhotos/galaxie/galaxie_044.jpg', 'galaxie_044', NULL, 'M104 Photo prise a l\'observatoire du Betz. TOA 130 + Monture EM_200 CYRIL PENTAX K5 CORRECTEUR + AUTOGUIDAGE 23*200s - 1600 ISO -50 DARK - 50 OFFSET - 50 FLATS.', '2019-06-01', 9, NULL),
(223, 'images/NosPhotos/galaxie/galaxie_045.jpg', 'galaxie_045', NULL, 'M65 et M66 deux des galaxies du triplet du lion, la troisième est hors du champs. matériel utilisé : C11edge+reducteur 0.7; nikon d7500 prise en plein centre du Puy-en-Velay 60 poses (sur 80) de 50s 800iso; avec darks biases et flats. traitement avec SIril', '2020-03-16', 9, NULL),
(224, 'images/NosPhotos/galaxie/galaxie_046.jpg', 'galaxie_046', NULL, 'M100 prise en plein centre du Puy-en-Velay donnée: C11edge + reducteur 0.7; nikon D7500 52 poses de 120s (darks,flats, bias)traitement siril.', '2020-03-27', 9, NULL),
(225, 'images/NosPhotos/galaxie/galaxie_047.jpg', 'galaxie_047', NULL, 'M94 prise en plein centre du puy matériel utilisé : C11edge+reducteur 0.7; nikon d7500 20 poses (sur 210) de 50s 1600iso; avec darks biases et flats. traitement avec SIRIL', '2020-03-27', 9, NULL),
(226, 'images/NosPhotos/galaxie/galaxie_048.jpg', 'galaxie_048', NULL, 'M101 en pleins centre du Puy matériel utilisé : C11edge+reducteur 0.7; nikon d7500 17 poses de 350s 3200iso; avec darks biases et flats. traitement avec Siril', '2020-03-29', 9, NULL),
(227, 'images/NosPhotos/galaxie/galaxie_049.jpg', 'galaxie_049', NULL, 'Photo de la galaxie du tourbillon M51. Prise en plein centre ville. Matériel utilisé: C11edge + reducteur 0.7; nikon d7500 27 pose de minutes 400 iso; avec darks biases et flats. traitement avec Siril', '2020-04-11', 9, NULL),
(228, 'images/NosPhotos/galaxie/galaxie_050.jpg', 'galaxie_050', NULL, 'La galaxie du tournesol m63. Photo prise en centre ville matériel : C11 edge + reducteur 0.7; nikon d7500 32 poses de 3 minutes 400iso, traitement Siril', '2020-04-12', 9, NULL),
(229, 'images/NosPhotos/galaxie/galaxie_051.jpg', 'galaxie_051', NULL, 'M31 (galaxie d\'andromede) Photo prise de l\'observatoire avec raphael. TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC REDUCTEUR 45 POSE 200s (44 empilée) - GAIN 130 - 100 DARK) - 80 OFFSET- 0 FLAT PIXINSIGHT', '2023-09-08', 9, NULL),
(230, 'images/NosPhotos/galaxie/galaxie_052.jpg', 'galaxie_052', NULL, 'M33 Photo prise du Betz TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC REDUCTEUR 33 POSE 400s - GAIN 130 - 50 DARK - 80 OFFSET-50 FLAT PixInsight', '2024-11-02', 9, NULL),
(231, 'images/NosPhotos/galaxie/galaxie_053.jpg', 'galaxie_053', NULL, 'photos effectuées le 02/11/2024 par Raphaël Images réalisées avec camera ZWO ASI294MC pro M33 – lunette 102 avec réducteur/correcteur 560mm : 126 poses de 90s (autoguidage sur C14) : traitées avec SIRIL', '2024-11-06', 9, NULL),
(232, 'images/NosPhotos/galaxie/galaxie_054.jpg', 'galaxie_054', NULL, 'photos effectuées le 02/11/2024 par Raphaël M33 – lunette 102 avec réducteur/correcteur 560mm : 126 poses de 90s (autoguidage sur C14) : traitées avec SIRIL', '2024-11-06', 9, NULL),
(233, 'images/NosPhotos/galaxie/galaxie_055.png', 'galaxie_055', NULL, 'Galaxie du Sculpteur NGC 253 Camera : ZWO ASI 294 MC du CLUB Au Betz le 28 décembre 2024 C14 + réducteur 0.7 soit focale : 2853 mm + barlow televue X2, soit : 5706 mm Acquisition par Alexandre qui dit : 50 poses de 120 s pas d’autoguidage . Ni FLAT ni DARK ni OFFSET Raph a dit : 60 poses de 30s pas d’autoguidage Binning X 2 ? Traitement Siril', '2024-12-28', 9, NULL),
(234, 'images/NosPhotos/galaxie/galaxie_056.png', 'galaxie_056', NULL, 'M51 ( Galaxie des chiens de chasse) Photo prise du Betz TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC EXTENDER AUTOGUIDAGE sur DIviseur optique 33 POSE 300s - GAIN 200 - 50 DARK - 80 OFFSET-50 FLAT PixInsight.', '2025-04-05', 9, NULL),
(235, 'images/NosPhotos/galaxie/galaxie_057.jpg', 'galaxie_057', NULL, 'M51 ( Galaxie des chiens de chasse) Photo prise du Betz TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC EXTENDER AUTOGUIDAGE sur DIviseur optique 33 POSE 300s - GAIN 200 - 50 DARK - 80 OFFSET-50 FLAT PixInsight.', '2025-04-05', 9, NULL),
(236, 'images/NosPhotos/grands_champ/grands_champ_001.jpg', 'grands_champ_001', NULL, 'Photo constellation orion et mars Alain mourlevat Olympus stylus 1 ISO 1600 2.8 13\" 24mm 1 photo sans traitement', '2022-11-26', 19, NULL),
(237, 'images/NosPhotos/jupiter/jupiter_001.tif', 'jupiter_001', NULL, 'DMK21 + LUNETTE 160 ED JEANNE OCCULAIRE 17 mm AVISTACK + REGISTAX', '2014-04-09', 4, NULL),
(238, 'images/NosPhotos/jupiter/jupiter_002.jpg', 'jupiter_002', NULL, 'JUPITER ORION 2013', '2014-02-26', 4, NULL),
(239, 'images/NosPhotos/jupiter/jupiter_003.jpg', 'jupiter_003', NULL, 'JUPITER STAGE PATRICK PELETIER', '2014-02-26', 4, NULL),
(240, 'images/NosPhotos/jupiter/jupiter_004.tif', 'jupiter_004', NULL, 'DMK21 + LUNETTE 160 ED JEANNE OCCULAIRE 17 mm AVISTACK + REGISTAX', '2014-04-09', 4, NULL),
(241, 'images/NosPhotos/jupiter/jupiter_005.tif', 'jupiter_005', NULL, 'DMK21 + LUNETTE 160 ED JEANNE OCCULAIRE 8 mm AVISTACK + REGISTAX', '2014-04-09', 4, NULL),
(242, 'images/NosPhotos/jupiter/jupiter_006.jpg', 'jupiter_006', NULL, 'DMK21 + LUNETTE 130 TAKA CYRIL OCCULAIRE 5 mm AVISTACK + PIXINSITE', '2015-04-07', 4, NULL),
(243, 'images/NosPhotos/jupiter/jupiter_007.jpg', 'jupiter_007', NULL, 'DMK21 + LUNETTE 130 TAKA CYRIL OCCULAIRE 5 mm AVISTACK + PIXINSITE', '2015-04-07', 4, NULL),
(244, 'images/NosPhotos/jupiter/jupiter_008.jpg', 'jupiter_008', NULL, 'DMK21 + LUNETTE 130 TAKA CYRIL OCCULAIRE 5 mm AVISTACK + PIXINSITE', '2015-04-07', 4, NULL),
(245, 'images/NosPhotos/jupiter/jupiter_009.png', 'jupiter_009', NULL, 'NOVA + 400 du club BARLOW 2x AVISTACK + REGISTAX', '2015-12-12', 4, NULL),
(246, 'images/NosPhotos/jupiter/jupiter_010.png', 'jupiter_010', NULL, 'INOVA + 400 du club BARLOW 2x AVISTACK + REGISTAX', '2015-12-12', 4, NULL),
(247, 'images/NosPhotos/jupiter/jupiter_011.png', 'jupiter_011', NULL, 'INOVA + C8 du club BARLOW 3x (michel) AVISTACK + REGISTAX + PIX (pour etalonage des couleurs) traitement Cyril', '2016-07-04', 4, NULL),
(248, 'images/NosPhotos/jupiter/jupiter_012.png', 'jupiter_012', NULL, 'INOVA + C8 du club BARLOW 3x (michel) Autostakkert + REGISTAX traitement Raphael', '2016-07-04', 4, NULL),
(249, 'images/NosPhotos/jupiter/jupiter_013.jpg', 'jupiter_013', NULL, 'JUPITER(AVEC SATELITE) par CYRIL Photo prise de l\'observatoire. TOA 130 + Monture EM-200 CYRIL PENTAX K5 EXTENDER JUPITER(SATELITE) - 1*6s - 100 ISO - 0 DARK - 0 OFFSET- 0 FLAT AUTOSTAKKERT - PHOTOSHOP CS6', '2021-10-16', 4, NULL),
(250, 'images/NosPhotos/jupiter/jupiter_014.jpg', 'jupiter_014', NULL, 'JUPITER (CROP) par CYRIL Photo prise de l\'observatoire. TOA 130 + Monture EM-200 CYRIL PENTAX K5 EXTENDER LUNE - 57*1/60s - 100 ISO - 0 DARK - 0 OFFSET- 0 FLAT AUTOSTAKKERT - PHOTOSHOP CS6', '2021-10-16', 4, NULL),
(251, 'images/NosPhotos/jupiter/jupiter_015.png', 'jupiter_015', NULL, 'JUPITER par Jeanne Photo prise de l\'observatoire. C14 + Monture CGEPRO Camera NB DMK Barlow Televue x2 plusieurs Video 3000 images AUTOSTAKKERT - Registax (Traitement Version 2)', '2021-10-16', 4, NULL),
(252, 'images/NosPhotos/jupiter/jupiter_016.png', 'jupiter_016', NULL, 'Photo JUPITER réalisées fin septembre par Jeanne, Raphaël et Michel. Prises de vues réalisées grâce à une caméra CCD QHY 174 monochrome montée sur le télescope Célestron 14 de la coupole. Ouverture : 360 mm focale : 4000 mm. monture Célestron CGEPRO sur colonne, pilotée par logiciel \"carte du ciel\" sur PC.', '2021-10-15', 4, NULL),
(253, 'images/NosPhotos/jupiter/jupiter_017.png', 'jupiter_017', NULL, 'Jupiter X2 Raphael C14 observatoire', '2024-01-27', 4, NULL),
(254, 'images/NosPhotos/jupiter/jupiter_018.png', 'jupiter_018', NULL, 'Jupiter avec satellite - Raphael C14 observatoire', '2024-01-27', 4, NULL),
(255, 'images/NosPhotos/jupiter/jupiter_019.png', 'jupiter_019', NULL, 'Jupiter - Michel C14 observatoire', '2024-01-27', 4, NULL),
(256, 'images/NosPhotos/jupiter/jupiter_020.png', 'jupiter_020', NULL, 'photos effectuées le 02/11/2024 par Raphaël Images réalisées avec camera ZWO ASI294MC pro Jupiter : C14 avec réducteur de focale, tirage de 146mm et barlow X2 soit 5600 mm de focale; film de 3000 images traitées avec Autostakert 4', '2024-11-02', 4, NULL);
INSERT INTO `photo` (`photo_id`, `url`, `titre`, `description`, `infos_techniques`, `date_prise`, `categorie_id`, `article_id`) VALUES
(257, 'images/NosPhotos/jupiter/jupiter_021.png', 'jupiter_021', NULL, 'photos effectuées le 02/11/2024 par Raphaël Images réalisées avec camera ZWO ASI294MC pro Jupiter : C14 avec réducteur de focale, tirage de 146mm et barlow X2 soit 5600 mm de focale; film de 3000 images traitées avec Autostakert 4', '2024-11-02', 4, NULL),
(258, 'images/NosPhotos/jupiter/jupiter_022.png', 'jupiter_022', NULL, 'photos effectuées le 28/12/2024 par Raphaël Images réalisées avec camera ZWO ASI294MC pro Jupiter : C14 avec réducteur de focale, tirage de 146mm et barlow X2 soit 5600 mm de focale;', '2024-12-28', 4, NULL),
(259, 'images/NosPhotos/lune/lune_001.jpg', 'lune_001', NULL, 'LUNETTE 160ED JEANNE PHOTO PROJECTION OCCULAIRE 8 mm CANON 500D TRAITEMENT AUTOPANO GIGA', '2014-04-09', 1, NULL),
(260, 'images/NosPhotos/lune/lune_002.jpg', 'lune_002', NULL, 'PENTAX PENTAX K-5 ƒ/5,6 1/500 200 mm 400 ISO', '2012-05-06', 1, NULL),
(261, 'images/NosPhotos/lune/lune_003.jpg', 'lune_003', NULL, 'PENTAX PENTAX K-5 ƒ/5,6 1/500 200 mm 400 ISO', '2012-05-06', 1, NULL),
(262, 'images/NosPhotos/lune/lune_004.jpg', 'lune_004', NULL, 'APN K5 OBJECTIF 200 mm', '2014-02-26', 1, NULL),
(263, 'images/NosPhotos/lune/lune_005.jpg', 'lune_005', NULL, 'APN K5 OBJECTIF 200mm', '2014-02-26', 1, NULL),
(264, 'images/NosPhotos/lune/lune_006.jpg', 'lune_006', NULL, NULL, '2012-03-21', 1, NULL),
(265, 'images/NosPhotos/lune/lune_007.jpg', 'lune_007', NULL, 'ASSEMBLAGE LUNE CENDREE SUREXPOSE ET SOUSEXPOSE', '2014-02-26', 1, NULL),
(266, 'images/NosPhotos/lune/lune_008.jpg', 'lune_008', NULL, NULL, '2014-02-26', 1, NULL),
(267, 'images/NosPhotos/lune/lune_009.jpg', 'lune_009', NULL, 'PHOTO JEANNE LUNE SUR COUPOLE', '2013-04-24', 1, NULL),
(268, 'images/NosPhotos/lune/lune_010.jpg', 'lune_010', NULL, 'PHOTO JEANNE CLARISSE TIEN LA LUNE DANS SA MAIN', '2013-04-24', 1, NULL),
(269, 'images/NosPhotos/lune/lune_011.jpg', 'lune_011', NULL, 'PHOTO JEANNE CLARISSE TIEN LA LUNE DANS SA MAIN', '2013-04-24', 1, NULL),
(270, 'images/NosPhotos/lune/lune_012.jpg', 'lune_012', NULL, 'PHOTO JEANNE LUNE SUR COUPOLE', '2013-04-24', 1, NULL),
(271, 'images/NosPhotos/lune/lune_013.jpg', 'lune_013', NULL, 'LUNETTE 120ED DANIEL + MONTURE EQ6 PHOTO PROJECTION OCCULAIRE 24MM CANON 5D MARK III - REMI (CLUB PHOTO GUITARD) TRAITEMENT PHOTOSHOP CS6', '2014-03-07', 1, NULL),
(272, 'images/NosPhotos/lune/lune_014.jpg', 'lune_014', NULL, 'LUNETTE 120ED DANIEL + MONTURE EQ6 PHOTO FOYER DIRECT CANON 5D MARK III - REMI (CLUB PHOTO GUITARD) TRAITEMENT PHOTOSHOP CS6', '2014-03-07', 1, NULL),
(273, 'images/NosPhotos/lune/lune_015.jpg', 'lune_015', NULL, 'LUNETTE 120ED DANIEL + MONTURE EQ6 PHOTO PROJECTION OCCULAIRE 24MM CANON 5D MARK III - REMI (CLUB PHOTO GUITARD) TRAITEMENT PHOTOSHOP CS6', '2014-03-07', 1, NULL),
(274, 'images/NosPhotos/lune/lune_016.jpg', 'lune_016', NULL, 'LUNETTE 160ED JEANNE PHOTO PROJECTION OCCULAIRE 8 mm CANON 500D TRAITEMENT AUTOPANO GIGA', '2014-04-09', 1, NULL),
(275, 'images/NosPhotos/lune/lune_017.jpg', 'lune_017', NULL, 'LUNETTE 160ED JEANNE PHOTO PROJECTION OCCULAIRE 8 mm CANON 500D TRAITEMENT AUTOPANO GIGA', '2014-04-09', 1, NULL),
(276, 'images/NosPhotos/lune/lune_017.png', 'lune_017', NULL, 'LUNETTE 120ED JEANNE PHOTO FOYER PENTAX K5 TRAITEMENT PHOTOSHOP + PAINT NET (MICHEL MARTEL)', '2012-07-15', 1, NULL),
(277, 'images/NosPhotos/lune/lune_018.jpg', 'lune_018', NULL, 'TOA 130 + EXTENDER 1,5X PENTAX K5 TRAITEMENT PHOTOSHOP 100 ISO - Temps de pose 1/15 s', '2015-08-21', 1, NULL),
(278, 'images/NosPhotos/lune/lune_018.png', 'lune_018', NULL, 'TOA 130 + EXTENDER 1,5X PENTAX K5 TRAITEMENT PHOTOSHOP 100 ISO - Temps de pose 1/15 s', '2015-08-21', 1, NULL),
(279, 'images/NosPhotos/lune/lune_019.jpg', 'lune_019', NULL, 'LUNE MOZAIC CFF160 + BARLOW ZEISS 3x (Michel) DMK 2121 TRAITEMENT AVISTACK + REGISTAX + AUTOPANOGIGA', '2016-07-09', 1, NULL),
(280, 'images/NosPhotos/lune/lune_020.jpg', 'lune_020', NULL, 'LUNE Lunette CFF160 (jeanne) Monture AVALON (Jeanne) TRAITEMENT REGISTAX (Jeanne)', '2016-07-09', 1, NULL),
(281, 'images/NosPhotos/lune/lune_021.png', 'lune_021', NULL, 'LUNE Lunette CFF160 (jeanne) Monture AVALON (Jeanne) TRAITEMENT REGISTAX (Jeanne)', '2016-07-09', 1, NULL),
(282, 'images/NosPhotos/lune/lune_022.jpg', 'lune_022', NULL, 'LUNE Lunette CFF160 (jeanne) Monture AVALON (Jeanne) TRAITEMENT REGISTAX (Jeanne)', '2016-07-09', 1, NULL),
(283, 'images/NosPhotos/lune/lune_022.png', 'lune_022', NULL, 'Canon Canon EOS 1200D ƒ/8 1/640 300 mm 320 ISO', '2017-01-04', 1, NULL),
(284, 'images/NosPhotos/lune/lune_023.jpg', 'lune_023', NULL, 'LUNE prise par Nathan arnaud-gay Canon EOS 1200D+ objectif 300 mm F/D 8 - 1/640 sec - 320 ISO', '2017-01-04', 1, NULL),
(285, 'images/NosPhotos/lune/lune_024.jpg', 'lune_024', NULL, 'LUNE prise par Nathan arnaud-gay Canon EOS 1200D+ objectif 300 mm F/D 5.6 - 1/4000 sec - 800 ISO', '2017-01-04', 1, NULL),
(286, 'images/NosPhotos/lune/lune_025.jpg', 'lune_025', NULL, 'LUNE prise par Nathan arnaud-gay Canon EOS 1200D+ objectif 300 mm F/D 5.6 - 1/4000 sec - 800 ISO', '2017-02-10', 1, NULL),
(287, 'images/NosPhotos/lune/lune_028.jpg', 'lune_028', NULL, 'LUNE prise par Nathan arnaud-gay Canon EOS 1200D+ objectif 300 mm F/D 5.6 - 1/4000 sec - 800 ISO', '2017-02-10', 1, NULL),
(288, 'images/NosPhotos/lune/lune_028.png', 'lune_028', NULL, 'LUNE MOZAIC CFF160 + BARLOW ZEISS 3x (Michel) DMK 2121 TRAITEMENT AVISTACK + REGISTAX + AUTOPANOGIGA', '2016-07-09', 1, NULL),
(289, 'images/NosPhotos/lune/lune_029.jpg', 'lune_029', NULL, 'LUNE Lunette CFF160 (jeanne) Monture AVALON (Jeanne) TRAITEMENT REGISTAX (Jeanne)', '2016-07-09', 1, NULL),
(290, 'images/NosPhotos/lune/lune_030.jpg', 'lune_030', NULL, NULL, '2017-03-06', 1, NULL),
(291, 'images/NosPhotos/lune/lune_031.jpg', 'lune_031', NULL, 'ASSEMBLAGE LUNE CENDREE SUREXPOSE ET SOUSEXPOSE', '2017-03-06', 1, NULL),
(292, 'images/NosPhotos/lune/lune_032.jpg', 'lune_032', NULL, NULL, '2012-03-21', 1, NULL),
(293, 'images/NosPhotos/lune/lune_033.jpg', 'lune_033', NULL, NULL, '2012-03-21', 1, NULL),
(294, 'images/NosPhotos/lune/lune_033.png', 'lune_033', NULL, NULL, '2017-03-06', 1, NULL),
(295, 'images/NosPhotos/lune/lune_034.png', 'lune_034', NULL, 'LUNETTE 120ED JEANNE PHOTO FOYER PENTAX K5 TRAITEMENT PHOTOSHOP + PAINT NET (MICHEL MARTEL)', '2012-07-15', 1, NULL),
(296, 'images/NosPhotos/lune/lune_035.png', 'lune_035', NULL, 'APN K5 OBJECTIF 200 mm', '2017-03-06', 1, NULL),
(297, 'images/NosPhotos/lune/lune_036.jpg', 'lune_036', NULL, 'APN K5 OBJECTIF 200 mm', '2017-03-06', 1, NULL),
(298, 'images/NosPhotos/lune/lune_037.jpg', 'lune_037', NULL, NULL, '2017-03-06', 1, NULL),
(299, 'images/NosPhotos/lune/lune_038.jpg', 'lune_038', NULL, 'Lune, C11 edge + réducteur 0,7 canon 500d , empilment de 19 photos sur 31 avec autostakker, traitement avec Siril', '2019-02-13', 1, NULL),
(300, 'images/NosPhotos/lune/lune_039.jpg', 'lune_039', NULL, 'photo prise au betz, ciel bien dégagé , peu de vents. 23/03/2019 Lune TOA 130 + Monture EM_200 CYRIL PENTAX K5 BARLOW ZEISS 3x (Michel) + PAS AUTOGUID?AGE POSE (3 series de 9 images) *1/60s - 400 ISO -50 DARK - 80 OFFSET. RAW Pentax (PEF) converti en TIF (sans compression) avec Photoshop Empilement AUTOSTAKKERT (Version 2.6.8) Assemblage mozaic avec Autopaneau Giga 3.03 Amélioration de nettetés avec Photoshop (filtre nettetés optimisée)', '2019-03-23', 1, NULL),
(301, 'images/NosPhotos/lune/lune_040.jpg', 'lune_040', NULL, 'photo prise au betz, ciel bien dégagé , peu de vents. 23/03/2019 Lune TOA 130 + Monture EM_200 CYRIL PENTAX K5 Extender 1,(x TAKA +BARLOW ZEISS 3x (Michel) + PAS AUTOGUID?AGE POSE (9 series de 12 images) *1/60s - 400 ISO -50 DARK - 80 OFFSET. RAW Pentax (PEF) converti en TIF (sans compression) avec Photoshop Empilement AUTOSTAKKERT (Version 2.6.8 - activation de l\'option avancée \'rotation de champ\') Assemblage mozaic avec Autopaneau Giga 3.03 Amélioration de nettetés avec Photoshop (filtre nettetés optimisée)', '2019-03-23', 1, NULL),
(302, 'images/NosPhotos/lune/lune_041.png', 'lune_041', NULL, 'Lune APN COmpact + Oculaire 24mm CFF 160 Sur monture Photo jeanne', '2019-03-24', 1, NULL),
(303, 'images/NosPhotos/lune/lune_042.jpg', 'lune_042', NULL, 'Lune du 04 avril. j\'ai repris la mosaïque avec en plus des 6 photos du reflex 50 images de la caméra sur le terminateur. matériel C11 edge: nikon d7500 et asi290', '2020-04-12', 1, NULL),
(304, 'images/NosPhotos/lune/lune_043.jpg', 'lune_043', NULL, 'Lune du 04 avril. matériel C11 edge; asi290', '2020-04-04', 1, NULL),
(305, 'images/NosPhotos/lune/lune_044.jpg', 'lune_044', NULL, 'Lune du 04 avril. matériel C11 edge; asi290', '2020-04-04', 1, NULL),
(306, 'images/NosPhotos/lune/lune_045.jpg', 'lune_045', NULL, 'Lune du 04 avril. matériel C11 edge; asi290', '2020-04-04', 1, NULL),
(307, 'images/NosPhotos/lune/lune_046.jpg', 'lune_046', NULL, 'Lune du 04 avril. matériel C11 edge; asi290', '2020-04-04', 1, NULL),
(308, 'images/NosPhotos/lune/lune_047.jpg', 'lune_047', NULL, 'Lune par Alexandre Newton 150/750 sur eQ3 Caméra ZWO ASI 178MM 1 Film de 90 sec fait avec FireCapture gain à 60 (11%) et 332 frames. Traitement : autostacker et registax 6 pour les ondelettes', '2020-12-22', 1, NULL),
(309, 'images/NosPhotos/lune/lune_048.jpg', 'lune_048', NULL, 'Lune par Alexandre Newton 150/750 sur eQ3 Caméra ZWO ASI 178MM 1 Film de 90 sec fait avec FireCapture gain à 60 (11%) et 332 frames. Traitement : autostacker et registax 6 pour les ondelettes', '2020-12-22', 1, NULL),
(310, 'images/NosPhotos/lune/lune_048.png', 'lune_048', NULL, 'LUNE par CYRIL Photo prise de l\'observatoire. TOA 130 + Monture EM-200 CYRIL PENTAX K5 EXTENDER LUNE - 56*1/60s - 100 ISO - 0 DARK - 0 OFFSET- 0 FLAT AUTOSTAKKERT - PHOTOSHOP CS6', '2021-10-16', 1, NULL),
(311, 'images/NosPhotos/lune/lune_050.png', 'lune_050', NULL, 'Lune Région Archimède Télescope de la coupole de l\'observatoire du Betz. télescope Celestron 14 + camera CCD QHY174M monochrome acquisition SharpCap, traitement Autostackkert et Registax Orionautes: Jeanne, Raphaêl et Michel.', '2021-11-12', 1, NULL),
(312, 'images/NosPhotos/lune/lune_051.png', 'lune_051', NULL, 'Lune Région Stofler Télescope de la coupole de l\'observatoire du Betz. télescope Celestron 14 + camera CCD QHY174M monochrome acquisition SharpCap, traitement Autostackkert et Registax Orionautes: Jeanne, Raphaêl et Michel.', '2021-11-12', 1, NULL),
(313, 'images/NosPhotos/lune/lune_052.png', 'lune_052', NULL, 'Lune région Boulliau Télescope de la coupole de l\'observatoire du Betz. télescope Celestron 14 + ZWO ASI 294 MC Empilement Autostakker et traitement Paint.Net ou Régistax Orionautes: Raphaël, Michel, Nathalie, Laurent et Jeanne.', '2024-01-20', 1, NULL),
(314, 'images/NosPhotos/lune/lune_053.png', 'lune_053', NULL, 'Lune région Clavius Télescope de la coupole de l\'observatoire du Betz. télescope Celestron 14 + ZWO ASI 294 MC Empilement Autostakker et traitement Paint.Net ou Régistax Orionautes: Raphaël, Michel, Nathalie, Laurent et Jeanne.', '2024-01-20', 1, NULL),
(315, 'images/NosPhotos/lune/lune_054.png', 'lune_054', NULL, 'Lune région Copernic Télescope de la coupole de l\'observatoire du Betz. télescope Celestron 14 + ZWO ASI 294 MC Empilement Autostakker et traitement Paint.Net ou Régistax Orionautes: Raphaël, Michel, Nathalie, Laurent et Jeanne.', '2024-01-20', 1, NULL),
(316, 'images/NosPhotos/mars/mars_001.jpg', 'mars_001', NULL, 'photos effectuées le 28/12/2024 par Raphaël Images réalisées avec camera ZWO ASI294MC pro Mars : C14 avec réducteur de focale, tirage de 146mm et barlow X2 soit 5600 mm de focale;', '2024-12-30', 3, NULL),
(317, 'images/NosPhotos/mars/mars_002.tif', 'mars_002', NULL, 'DMK21 + LUNETTE 160 ED JEANNE OCCULAIRE 8 mm AVISTACK + REGISTAX', '2014-04-09', 3, NULL),
(318, 'images/NosPhotos/mars/mars_003.png', 'mars_003', NULL, 'INOVA + C8 + BARLOW 3X (michel) AVISTACK + REGISTAX + PIXINSIGHT (etalonage couleurs)', '2016-07-04', 3, NULL),
(319, 'images/NosPhotos/mars/mars_004.png', 'mars_004', NULL, 'INOVA + C8 + BARLOW 3X (michel) Autostakkert + REGISTAX Traitement raphael', '2016-07-04', 3, NULL),
(320, 'images/NosPhotos/mars/mars_005.png', 'mars_005', NULL, 'MARS Lunette CFF160 (jeanne) Monture AVALON (Jeanne) TRAITEMENT REGISTAX (Jeanne)', '2016-07-09', 3, NULL),
(321, 'images/NosPhotos/mars/mars_006.tif', 'mars_006', NULL, 'MARS Lunette CFF160 (jeanne) + avec barlow baader X3 sur caméra QHY174 de Michel Monture AVALON (Jeanne) traitement Avistack des 5% images les meilleures (soit 250 images) ondelettes sur Registax réglages contraste / luminosité le pole nord (en haut) est couvert d\'une importante calotte glacière on voie les 2 régions de Terra Arabia à droite et Chryse Planitia au centre', '2022-12-17', 3, NULL),
(322, 'images/NosPhotos/mars/mars_007.png', 'mars_007', NULL, 'photos effectuées le 02/11/2024 par Raphaël Images réalisées avec camera ZWO ASI294MC pro Mars : C14 avec réducteur de focale, tirage de 146mm et barlow X2 soit 5600 mm de focale; film de 3000 images traitées avec Autostakert 4', '2024-11-02', 3, NULL),
(323, 'images/NosPhotos/nebuleuse/nebuleuse_001.jpg', 'nebuleuse_001', NULL, 'IC 434 (nebuleuse la tete de cheval) CFF 160 + Monture CGE PRO JEANNE/RAPHAEL CANON 550D + FOYER POSE 11* 360s - 800 ISO - 3 DARK - 30 OFFSET Pixinsite - 11 images', '2014-11-21', 6, NULL),
(324, 'images/NosPhotos/nebuleuse/nebuleuse_002.jpg', 'nebuleuse_002', NULL, 'M42 PROJECTION OCCULAIRE LUNETTE 120ED TRAITEMENT PIXINSITE', '2014-02-26', 6, NULL),
(325, 'images/NosPhotos/nebuleuse/nebuleuse_003.jpg', 'nebuleuse_003', NULL, 'M45 (Pleiades) LUNETTE 120ED PHOTO FOYER CANON 500D - 28x 40s / DARK / OFFSET', '2014-02-26', 6, NULL),
(326, 'images/NosPhotos/nebuleuse/nebuleuse_004.jpg', 'nebuleuse_004', NULL, 'M45(Pleiades) LUNETTE 120ED PHOTO FOYER - 28x 40s / DARK / OFFSET TRAITEMENT PIXINSITE', '2014-02-26', 6, NULL),
(327, 'images/NosPhotos/nebuleuse/nebuleuse_005.jpg', 'nebuleuse_005', NULL, 'APN K5 MONTURE EQ3', '2014-02-26', 6, NULL),
(328, 'images/NosPhotos/nebuleuse/nebuleuse_006.jpg', 'nebuleuse_006', NULL, 'M42 120ED DANIEL + MONTURE EQ6 CANON 5D REMI FLAMENT (CLUB PHOTO GUITARD) PRETRAITEMENT +TRAITEMENT PIXINSITE CYRIL', '2014-03-07', 6, NULL),
(329, 'images/NosPhotos/nebuleuse/nebuleuse_007.jpg', 'nebuleuse_007', NULL, 'M42 120ED DANIEL + MONTURE EQ6 CANON 5D REMI FLAMENT (CLUB PHOTO GUITARD) PRETRAITEMENT PIXINSITE(CYRIL) + TRAITEMENT PHOTOSHOP (REMI)', '2014-03-07', 6, NULL),
(330, 'images/NosPhotos/nebuleuse/nebuleuse_008.jpg', 'nebuleuse_008', NULL, 'M20 / M21 (amas ouvert) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + SUPER CORRECTEUR POSE 54 * 90s - 1600 ISO - 29 DARK - 80 OFFSET PIXINSITE 54 images', '2014-08-16', 6, NULL),
(331, 'images/NosPhotos/nebuleuse/nebuleuse_009.jpg', 'nebuleuse_009', NULL, 'M8 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + SUPER CORRECTEUR + AUTOGUIDAGE POSE 64 * 90s - 1600 ISO - 29 DARK - 80 OFFSET PIXINSITE 44 images', '2014-08-17', 6, NULL),
(332, 'images/NosPhotos/nebuleuse/nebuleuse_010.jpg', 'nebuleuse_010', NULL, 'M16 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR TOA-RD + AUTOGUIDAGE POSE 38 * 90s - 1600 ISO - 29 DARK - 80 OFFSET PIXINSITE 25 images', '2014-08-30', 6, NULL),
(333, 'images/NosPhotos/nebuleuse/nebuleuse_011.jpg', 'nebuleuse_011', NULL, 'NGC 6992 (Dentelles du cygne) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR TOA-RD + AUTOGUIDAGE POSE 22 * 200s - 1600 ISO - 18 DARK - 80 OFFSET PIXINSITE 22 images', '2014-08-26', 6, NULL),
(334, 'images/NosPhotos/nebuleuse/nebuleuse_012.jpg', 'nebuleuse_012', NULL, 'M17 CFF 160 + Monture CGE PRO - JEANNE / RAPHAEL CANON 550D + BARLOW 2x TELEVUE POWERMATE POSE 40 * 80s - 1600 ISO - 20 DARK - 50 OFFSET PIXINSITE 22 images', '2014-08-26', 6, NULL),
(335, 'images/NosPhotos/nebuleuse/nebuleuse_013.jpg', 'nebuleuse_013', NULL, 'M17 CFF 160 + Monture CGE PRO - JEANNE / RAPHAEL CANON 550D + BARLOW 2x TELEVUE POWERMATE POSE 40 * 80s - 1600 ISO - 20 DARK - 50 OFFSET DSS 26 images (sans utiliser dark et offset)', '2014-08-26', 6, NULL),
(336, 'images/NosPhotos/nebuleuse/nebuleuse_014.jpg', 'nebuleuse_014', NULL, 'IC 5070 CFF 160 + Monture CGE PRO JEANNE/RAPHAEL CANON 550D + FOYER POSE 10* 600s - 800 ISO - 0 DARK - 0 OFFSET PIXINSITE 9 images', '2014-10-17', 6, NULL),
(337, 'images/NosPhotos/nebuleuse/nebuleuse_015.jpg', 'nebuleuse_015', NULL, 'NGC 7000 CFF 160 + Monture CGE PRO JEANNE/RAPHAEL CANON 550D + FOYER POSE 10* 600s - 800 ISO - 0 DARK - 0 OFFSET PIXINSITE 10 images', '2014-10-17', 6, NULL),
(338, 'images/NosPhotos/nebuleuse/nebuleuse_016.jpg', 'nebuleuse_016', NULL, 'NGC 7000 CFF 160 + Monture CGE PRO JEANNE/RAPHAEL CANON 550D + FOYER POSE 10* 600s - 800 ISO - 0 DARK - 0 OFFSET DeepSkyStaker - 10 images (traitement jeanne)', '2014-10-17', 6, NULL),
(339, 'images/NosPhotos/nebuleuse/nebuleuse_016.tif', 'nebuleuse_016', NULL, 'IC 5070 CFF 160 + Monture CGE PRO JEANNE/RAPHAEL CANON 550D + FOYER POSE 10* 600s - 800 ISO - 1 DARK - 0 OFFSET DeepSkyStaker - 10 images (traitement rapahel)', '2014-10-17', 6, NULL),
(340, 'images/NosPhotos/nebuleuse/nebuleuse_017.jpg', 'nebuleuse_017', NULL, 'NGC 7000 CFF 160 + Monture CGE PRO JEANNE/RAPHAEL CANON 550D + FOYER POSE 10* 600s - 800 ISO - 1 DARK - 0 OFFSET DeepSkyStaker - 10 images (traitement raphael)', '2014-10-17', 6, NULL),
(341, 'images/NosPhotos/nebuleuse/nebuleuse_018.jpg', 'nebuleuse_018', NULL, 'NGC 6888 (Nebuleuse du croissant) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + EXTENDER + AUTOGUIDAGE POSE 21 * 500s - 1600 ISO - 46 DARK - 80 OFFSET PIXINSITE 21 images', '2014-10-24', 6, NULL),
(342, 'images/NosPhotos/nebuleuse/nebuleuse_019.jpg', 'nebuleuse_019', NULL, 'NGC 6888 (Nebuleuse du croissant) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + EXTENDER + AUTOGUIDAGE POSE 21 * 500s - 1600 ISO - 46 DARK - 80 OFFSET PIXINSITE 21 images', '2014-10-24', 6, NULL),
(343, 'images/NosPhotos/nebuleuse/nebuleuse_020.jpg', 'nebuleuse_020', NULL, 'IC 434 (nebuleuse la tete de cheval) CFF 160 + Monture CGE PRO JEANNE/RAPHAEL CANON 550D + FOYER POSE 11* 360s - 800 ISO - 3 DARK - 30 OFFSET Traitement semi-auto- HE AL - Raphael', '2014-11-21', 6, NULL),
(344, 'images/NosPhotos/nebuleuse/nebuleuse_021.jpg', 'nebuleuse_021', NULL, 'M45 (Les peiades) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + CORRECTEUR + AUTOGUIDAGE POSE 43 * 120s - 800 ISO - 30 DARK - 50 OFFSET PIXINSITE 43 images', '2014-12-22', 6, NULL),
(345, 'images/NosPhotos/nebuleuse/nebuleuse_022.jpg', 'nebuleuse_022', NULL, 'M42 (GRande nebuleuse d\'orion) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + CORRECTEUR + pas d\'AUTOGUIDAGE POSE 30 * 70s - 800 ISO - 30 DARK - 50 OFFSET + POSE 30 * 20s - 800 ISO - 30 DARK - 50 OFFSET PIXINSITE 30 images', '2014-12-22', 6, NULL),
(346, 'images/NosPhotos/nebuleuse/nebuleuse_023.jpg', 'nebuleuse_023', NULL, 'M42 (GRande nebuleuse d\'orion variante HDR) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + CORRECTEUR + Pas d\'AUTOGUIDAGE POSE 30 * 70s - 800 ISO - 30 DARK - 50 OFFSET + POSE 30 * 20s - 800 ISO - 30 DARK - 50 OFFSET PIXINSITE 30 images', '2014-12-22', 6, NULL),
(347, 'images/NosPhotos/nebuleuse/nebuleuse_024.jpg', 'nebuleuse_024', NULL, 'NGC6960 (les dentelles du cygne) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR TOA-RD + AUTOGUID?AGE POSE 26 * 400s - 1600 ISO - 8 DARK - 50 OFFSET - 10 FLAT PIXINSITE 26 images', '2015-06-19', 6, NULL),
(348, 'images/NosPhotos/nebuleuse/nebuleuse_025.jpg', 'nebuleuse_025', NULL, 'NGC6960 (les dentelles du cygne) variante avec réduction des etoiles TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR TOA-RD + AUTOGUID?AGE POSE 26 * 400s - 1600 ISO - 8 DARK - 50 OFFSET - 10 FLAT PIXINSITE 26 images', '2015-06-19', 6, NULL),
(349, 'images/NosPhotos/nebuleuse/nebuleuse_026.jpg', 'nebuleuse_026', NULL, 'M20 (trifide) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + EXTENDER 1,5x + AUTOGUID?AGE POSE 25 * 400s - 1600 ISO - 5 DARK - 50 OFFSET - 10 FLAT PIXINSITE 25 images', '2015-07-10', 6, NULL),
(350, 'images/NosPhotos/nebuleuse/nebuleuse_027.jpg', 'nebuleuse_027', NULL, 'IC1396 (nebulsue de trompe d\'elephant) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR + AUTOGUID?AGE POSE 10 * 500s - 1600 ISO - 6 DARK - 50 OFFSET - 10 FLAT PIXINSITE 10 images', '2015-07-13', 6, NULL),
(351, 'images/NosPhotos/nebuleuse/nebuleuse_028.jpg', 'nebuleuse_028', NULL, 'IC1805 (nebuleuse du coeur) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR + AUTOGUID?AGE POSE 26 * 500s - 1600 ISO - 4 DARK - 50 OFFSET - 0 FLAT PIXINSITE 26 images', '2015-08-11', 6, NULL),
(352, 'images/NosPhotos/nebuleuse/nebuleuse_029.jpg', 'nebuleuse_029', NULL, 'IC1805 (nebuleuse du coeur) version reduction etoiles TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR + AUTOGUID?AGE POSE 26 * 500s - 1600 ISO - 4 DARK - 50 OFFSET - 0 FLAT PIXINSITE 26 images', '2015-08-11', 6, NULL),
(353, 'images/NosPhotos/nebuleuse/nebuleuse_030.jpg', 'nebuleuse_030', NULL, 'IC1805 (nebuleuse du coeur) version D reduction etoiles TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR + AUTOGUID?AGE POSE 26 * 500s - 1600 ISO - 30 DARK - 50 OFFSET - 11 FLAT PIXINSITE 26 images', '2015-08-11', 6, NULL),
(354, 'images/NosPhotos/nebuleuse/nebuleuse_031.jpg', 'nebuleuse_031', NULL, 'M17 reduction etoiles TOA 130 + Monture EM_200 CYRIL PENTAX K5 + EXTENDER + AUTOGUID?AGE POSE 13 * 500s - 1600 ISO - 30 DARK - 50 OFFSET - 10 FLAT PIXINSITE 26 images', '2015-08-22', 6, NULL),
(355, 'images/NosPhotos/nebuleuse/nebuleuse_032.jpg', 'nebuleuse_032', NULL, 'NGC 7380 Traitement logiciel raphael C8 + Monture CGE PRO CANON 500D + AUTOGUID?AGE POSE 25 * 180s - 800 ISO - 12 DARK - 0 OFFSET - 0 FLAT PIXINSITE 26 images', '2015-08-22', 6, NULL),
(356, 'images/NosPhotos/nebuleuse/nebuleuse_033.jpg', 'nebuleuse_033', NULL, 'NGC 7023 Nebuleuse de l\'iris TOA 130 - CORRECTEUR Monture EM 200 TAKA PENTAX K5 + AUTOGUID?AGE POSE 27 * 500s - 1600 ISO - 45 DARK - 80 OFFSET - 0 FLAT PIXINSITE 27 images', '2015-11-10', 6, NULL),
(357, 'images/NosPhotos/nebuleuse/nebuleuse_034.jpg', 'nebuleuse_034', NULL, 'NGC 1499 Nebuleuse california TOA 130 - REDUCTEUR Monture EM 200 TAKA PENTAX K5 + AUTOGUID?AGE POSE 27 * 500s - 1600 ISO 45 DARK - 80 OFFSET - 10 FLAT PIXINSITE 27 images', '2015-12-05', 6, NULL),
(358, 'images/NosPhotos/nebuleuse/nebuleuse_035.jpg', 'nebuleuse_035', NULL, 'IC 410 TOA 130 - CORRECTEUR Monture EM 200 TAKA PENTAX K5 + AUTOGUID?AGE POSE 25 * 500s - 1600 ISO 45 DARK - 80 OFFSET - 10 FLAT PIXINSITE 25 images', '2015-12-12', 6, NULL),
(359, 'images/NosPhotos/nebuleuse/nebuleuse_036.jpg', 'nebuleuse_036', NULL, 'NGC 2237 (la rosette) TOA 130 - REDUCTEUR Monture EM 200 TAKA PENTAX K5 + AUTOGUID?AGE POSE 34 * 300s - 1600 ISO 50 DARK - 50 OFFSET - 20 FLAT PIXINSITE 30 images', '2016-02-05', 6, NULL),
(360, 'images/NosPhotos/nebuleuse/nebuleuse_037.jpg', 'nebuleuse_037', NULL, 'NGC 2237 (la rosette) TOA 130 - REDUCTEUR Monture EM 200 TAKA PENTAX K5 + AUTOGUID?AGE POSE 34 * 300s - 1600 ISO 50 DARK - 50 OFFSET - 20 FLAT PIXINSITE 30 images', '2016-02-05', 6, NULL),
(361, 'images/NosPhotos/nebuleuse/nebuleuse_038.jpg', 'nebuleuse_038', NULL, 'NGC 6334 ( nebuleuse patte de chat) TOA 130 - REDUCTEUR Monture EM 200 TAKA PENTAX K5 + AUTOGUID?AGE POSE 15 * 400s - 1600 ISO 50 DARK - 80 OFFSET - 20 FLAT PIXINSITE 15 images', '2016-07-09', 6, NULL),
(362, 'images/NosPhotos/nebuleuse/nebuleuse_039.jpg', 'nebuleuse_039', NULL, 'Les Dentelles du cygne (partie mediane) TOA 130 - REDUCTEUR Monture EM 200 TAKA PENTAX K5 + AUTOGUID?AGE POSE 26 * 400s - 1600 ISO 50 DARK - 80 OFFSET - 20 FLAT PIXINSITE 26 images', '2016-07-29', 6, NULL),
(363, 'images/NosPhotos/nebuleuse/nebuleuse_040.jpg', 'nebuleuse_040', NULL, 'Les Dentelles du cygne assemblage MOZAIC (dentelle mediane + NGC 6960) TOA 130 - REDUCTEUR Monture EM 200 TAKA PENTAX K5 + AUTOGUID?AGE POSE 26 * 400s - 1600 ISO 50 DARK - 80 OFFSET - 20 FLAT PIXINSITE 26 images', '2016-07-29', 6, NULL),
(364, 'images/NosPhotos/nebuleuse/nebuleuse_041.jpg', 'nebuleuse_041', NULL, 'M16 (les piliers de la creation) TOA 130 - EXTENDER Monture EM 200 TAKA PENTAX K5 + AUTOGUID?AGE POSE 25 * 500s - 1600 ISO 34 DARK - 80 OFFSET - 20 FLAT PIXINSITE 25 images', '2016-08-02', 6, NULL),
(365, 'images/NosPhotos/nebuleuse/nebuleuse_042.jpg', 'nebuleuse_042', NULL, 'M17 TOA 130 - EXTENDER Monture EM 200 TAKA PENTAX K5 + AUTOGUID?AGE POSE 24 * 500s - 1600 ISO 53 DARK - 80 OFFSET - 20 FLAT PIXINSITE 24 images', '2016-08-03', 6, NULL),
(366, 'images/NosPhotos/nebuleuse/nebuleuse_043.jpg', 'nebuleuse_043', NULL, 'M81 - M82 - NGC 3077 TOA 130 - CORRECTEUR - Monture EM 200 TAKA PENTAX K5 + AUTOGUID?AGE + DITHERING - POSE 27 * 450s - 1600 ISO - 40 DARK - 80 OFFSET - 20 FLAT PIXINSITE 27 images', '2016-08-07', 6, NULL),
(367, 'images/NosPhotos/nebuleuse/nebuleuse_044.jpg', 'nebuleuse_044', NULL, 'M81 - DENTELLES DU CYGNE MOZAIC TOA 130 - REDUCTEUR - Monture EM 200 TAKA PENTAX K5 + AUTOGUID?AGE - POSE 25 * 400s - 1600 ISO - 50 DARK - 80 OFFSET - 50 FLAT PIXINSITE 25 images', '2016-08-27', 6, NULL),
(368, 'images/NosPhotos/nebuleuse/nebuleuse_045.jpg', 'nebuleuse_045', NULL, 'IC1848 (nebuleuse de l\'ame) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR + AUTOGUID?AGE POSE 27* 600s - 1600 ISO -41 DARK - 80 OFFSET - 50 FLAT PIXINSITE 27 images', '2016-10-29', 6, NULL),
(369, 'images/NosPhotos/nebuleuse/nebuleuse_046.jpg', 'nebuleuse_046', NULL, 'NGC281 (nebuleuse du pacman) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + CORRECTEUR + AUTOGUID?AGE POSE 13* 600s - 1600 ISO -57 DARK - 80 OFFSET - 50 FLAT PIXINSITE 13 images', '2016-10-31', 6, NULL),
(370, 'images/NosPhotos/nebuleuse/nebuleuse_047.jpg', 'nebuleuse_047', NULL, 'SH2-155 (nebuleuse de la grotte) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + CORRECTEUR + AUTOGUID?AGE POSE 28* 700s - 1600 ISO -31 DARK - 80 OFFSET - 50 FLAT PIXINSITE 28 images', '2016-11-26', 6, NULL),
(371, 'images/NosPhotos/nebuleuse/nebuleuse_048.jpg', 'nebuleuse_048', NULL, 'NGC 1909 (nebuleuse de la tete de sorciere) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR + AUTOGUID?AGE POSE 29* 400s - 1600 ISO -30 DARK - 80 OFFSET - 50 FLAT PIXINSITE 29 images', '2016-12-30', 6, NULL),
(372, 'images/NosPhotos/nebuleuse/nebuleuse_049.jpg', 'nebuleuse_049', NULL, 'M42 + 43 (nebuleuse d\'orion) Monture CGE PRO APN Sony SLT-A58 Objectif Tamron modèle 60B 300mm F/D 2,8 LD IF Pas D\'AUTOGUID?AGE POSE 11*120 sec - 1600 ISO DARK fait en automatique et retiré des photo par l\'APN SONY DSS + Pixisight LE - 7 images', '2016-12-30', 6, NULL),
(373, 'images/NosPhotos/nebuleuse/nebuleuse_050.jpg', 'nebuleuse_050', NULL, 'M42 + 43 (nebuleuse d\'orion) Monture CGE PRO APN Sony SLT-A58 Objectif Tamron modèle 60B 300mm F/D 2,8 LD IF Pas D\'AUTOGUID?AGE POSE 11*120 sec - 1600 ISO DARK fait en automatique et retiré des photo par l\'APN SONY DSS + Pixisight LE - 18 images', '2016-12-30', 6, NULL),
(374, 'images/NosPhotos/nebuleuse/nebuleuse_051.jpg', 'nebuleuse_051', NULL, 'IC443 (nebuleuse de la meduse) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + CORRECTEUR + AUTOGUID?AGE POSE 27* 500s - 1600 ISO -25 DARK - 80 OFFSET - 50 FLAT PIXINSITE 27 images', '2017-01-21', 6, NULL),
(375, 'images/NosPhotos/nebuleuse/nebuleuse_052.jpg', 'nebuleuse_052', NULL, 'constellation ORION REFLEX SONY OBJECTIF 35 mm F/D 2.8 Monture CGE PRO pas d\'autoguidage POSE 1* 30s - 1600 ISO pas de traitement', '2017-02-25', 6, NULL),
(376, 'images/NosPhotos/nebuleuse/nebuleuse_053.jpg', 'nebuleuse_053', NULL, 'M78 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + CORRECTEUR + AUTOGUID?AGE POSE 10* 400s - 1600 ISO -30 DARK - 80 OFFSET - 50 FLAT PIXINSITE 10 images', '2017-02-25', 6, NULL),
(377, 'images/NosPhotos/nebuleuse/nebuleuse_054.jpg', 'nebuleuse_054', NULL, 'les Dentelles du Cygne (NGC6992...) SONY A58 + objectif TAMRON 300 mm F/2.8 support double avec C8 en parallele Monture CGEM DX POSE 40 * 60s - 1600 ISO - 0 DARK - 0 OFFSET- 0 FLAT 26 meilleures images Traitement Raphael', '2017-05-24', 6, NULL),
(378, 'images/NosPhotos/nebuleuse/nebuleuse_055.jpg', 'nebuleuse_055', NULL, 'Les dentelles du Cygne (NGC6992...) SONY A58 + objectif TAMRON 300 mm F/2.8 support double avec C8 en parallele Monture CGEM DX POSE 26 * 120s - 1600 ISO - 0 DARK - 0 OFFSET- 0 FLAT 13 meilleures images Traitement Raphael', '2017-05-26', 6, NULL),
(379, 'images/NosPhotos/nebuleuse/nebuleuse_056.jpg', 'nebuleuse_056', NULL, 'M8 + trifide SONY A58 + objectif TAMRON 300 mm F/2.8 support double avec C8 en parallele Monture CGEM DX POSE 20 * 120s - 1600 ISO - 0 DARK - 0 OFFSET- 0 FLAT 7 meilleurs images Traitement Raphael', '2017-05-26', 6, NULL),
(380, 'images/NosPhotos/nebuleuse/nebuleuse_057.jpg', 'nebuleuse_057', NULL, 'NGC6823 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + CORRECTEUR + AUTOGUID?AGE POSE 26* 600s - 1600 ISO -42 DARK - 80 OFFSET - 30 FLAT', '2017-08-17', 6, NULL),
(381, 'images/NosPhotos/nebuleuse/nebuleuse_058.jpg', 'nebuleuse_058', NULL, 'NGC7380 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + CORRECTEUR + AUTOGUID?AGE POSE 26* 400s - 1600 ISO -44 DARK - 80 OFFSET - 30 FLAT', '2017-08-19', 6, NULL),
(382, 'images/NosPhotos/nebuleuse/nebuleuse_059.jpg', 'nebuleuse_059', NULL, 'NGC7000 Canon 550D+ objectif 300 mm F2.8 Sigma Monture EQ3 POSE 38* 120s - 1600 ISO -0 DARK - 0 OFFSET - 0 FLAT Traitement DSS + paint.net (Jeanne)', '2017-08-19', 6, NULL),
(383, 'images/NosPhotos/nebuleuse/nebuleuse_060.jpg', 'nebuleuse_060', NULL, 'NGC7822 (cephee) Pentax K5+ TOA 130 – Monture EM200 Reducteur TOA RD + autoguidage POSE 14 x 600 sec – 1600 ISO 80 OFFSET – 40 DARK – 31 FLAT Traitement Pixinsight Cyril', '2017-10-14', 6, NULL),
(384, 'images/NosPhotos/nebuleuse/nebuleuse_061.jpg', 'nebuleuse_061', NULL, 'NGC 6914 +... (complexe de nébuleuses dans la constellation du Cygne) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + REDUCTEUR + AUTOGUID?AGE POSE 22* 500s - 1600 ISO -50 DARK - 80 OFFSET - 51 FLAT PIXINSIGHT 21 images', '2018-07-08', 6, NULL),
(385, 'images/NosPhotos/nebuleuse/nebuleuse_062.jpg', 'nebuleuse_062', NULL, 'IC1318 - nébuleuse du papillon TOA 130 + Monture EM_200 CYRIL PENTAX K5 CORRECTEUR + AUTOGUID?AGE POSE 19* 600s - 1600 ISO -50 DARK - 80 OFFSET - 19 images', '2018-08-11', 6, NULL),
(386, 'images/NosPhotos/nebuleuse/nebuleuse_063.jpg', 'nebuleuse_063', NULL, 'M42, C11 edge + reducteur 0,7 canon 500d, empilement de 20 photos sur 32 de 24s 800 iso, traitement avec Siril', '2019-02-13', 6, NULL),
(387, 'images/NosPhotos/nebuleuse/nebuleuse_064.jpg', 'nebuleuse_064', NULL, 'Constellation orion Star Adventurer + au 50mm - F/D 2.8 + SONY A58 PAS AUTOGUID?AGE POSE 40*90s - 1600 ISO -0 DARK - 0 OFFSET Traitement : RawTherapee, FitsWork, RNCColorStretch Photo Raphael', '2019-02-24', 6, NULL),
(388, 'images/NosPhotos/nebuleuse/nebuleuse_065.jpg', 'nebuleuse_065', NULL, 'NGC2174 Lieu : Domicile CYRIL TOA 130 + Monture EM_200 CYRIL PENTAX K5 CORRECTEUR + AUTOGUIDAGE 23*400s - 1600 ISO -50 DARK - 80 OFFSET - 50 FLATS. PIXINSIGHT - 23 images', '2019-03-29', 6, NULL),
(389, 'images/NosPhotos/nebuleuse/nebuleuse_066.jpg', 'nebuleuse_066', NULL, 'Deneb et Gamma Cygni Region APN Sony APS-C sur monture KyWatcher Star Adventurer avec objectif 135 F/D 2.8 soit 48 mm de diamètre. (équivalent donc à une lunette 48/135 mm) l\' image couvre un champ d\'environ 10°x6° dans le ciel 40 poses de 70s - commandées à l\'intervalomètre pas de PC, pas de Dark, Flat, Offset traitement : RawTherapee puis FitWorks et Gimp 2.10 (avec plugin Astronomy et G\'MIC) ces régions émettent essentiellement en H-alpha, auquel les capteurs APN sont peu sensibles sous Deneb (en haut à gauche) on a le Nébuleuse America et le Pelican et sous Gamma du Cygne en haut à droite IC 1318', '2019-06-01', 6, NULL),
(390, 'images/NosPhotos/nebuleuse/nebuleuse_067.jpg', 'nebuleuse_067', NULL, 'Rho Ophiuchi Region APN Sony APS-C sur monture KyWatcher Star Adventurer avec objectif 135 F/D 2.8 soit 48 mm de diamètre. (équivalent donc à une lunette 48/135 mm) l\' image couvre un champ d\'environ 10°x6° dans le ciel 40 poses de 70s - commandées à l\'intervalomètre pas de PC, pas de Dark, Flat, Offset traitement : RawTherapee puis FitWorks et Gimp 2.10 (avec plugin Astronomy et G\'MIC) ces régions émettent essentiellement en H-alpha, auquel les capteurs APN sont peu sensibles autour de Rho Ophiuchi on a l\'étoile Antares du Scorpion qui éclaire en jaune les poussières interstellaires au dessus, l\'amas globulaire M4, et M 80 au milieu du bord droit', '2019-06-01', 6, NULL),
(391, 'images/NosPhotos/nebuleuse/nebuleuse_068.jpg', 'nebuleuse_068', NULL, 'SH2-129 Photo prise a l\'observatoire du Betz. TOA 130 + Monture EM_200 CYRIL PENTAX K5 CORRECTEUR + AUTOGUIDAGE 27*400s - 1600 ISO -31 DARK - 80 OFFSET - 50 FLATS. PIXINSIGHT - 20 images', '2019-08-30', 6, NULL),
(392, 'images/NosPhotos/nebuleuse/nebuleuse_069.jpg', 'nebuleuse_069', NULL, 'IC59 et IC 63 dans la meme photo Photo prise a l\'observatoire du Betz. TOA 130 + Monture EM_200 CYRIL PENTAX K5 CORRECTEUR + AUTOGUIDAGE 25*600s - 1600 ISO -44 DARK - 80 OFFSET - 50 FLATS. PIXINSIGHT - 25 images', '2019-09-28', 6, NULL),
(393, 'images/NosPhotos/nebuleuse/nebuleuse_070.jpg', 'nebuleuse_070', NULL, 'SH2-132 Photo prise de chez moi. TOA 130 + Monture EM_200 CYRIL PENTAX K5 REDUCTEUR + AUTOGUIDAGE 39*400s - 1600 ISO -33 DARK - 80 OFFSET - 50 FLATS. PIXINSIGHT - 39 images', '2020-07-19', 6, NULL),
(394, 'images/NosPhotos/nebuleuse/nebuleuse_071.jpg', 'nebuleuse_071', NULL, 'NGC6888 Photo prise du BETZ SETUP C11 DAMIEN nikon d7500 REDUCTEUR + AUTOGUIDAGE 12 pose de 500s à 400 iso arreté a 12 pose a cause de la buée', '2020-07-19', 6, NULL),
(395, 'images/NosPhotos/nebuleuse/nebuleuse_072.jpg', 'nebuleuse_072', NULL, 'IC 434 (la tete de cheval) Photo prise de l\'observatoire. TOA 130 + Monture EM-200 CYRIL PENTAX K5 CORRECTEUR 1 POSE 200s - 1600 ISO - 0 DARK - 0 OFFSET- 0 FLAT PIXINSIGHT impossible de faire un empilement, le temps de cadrer IC 434 des nuages son venu cacher la cible. j\'ai du donc me rabattre sur un traitement classique sans empilement sur les 2 images de test a 200 seconde et 400 secondes, que j\'ai peu effectuer durant ma phase de cadrage de la cible', '2022-02-05', 6, NULL),
(396, 'images/NosPhotos/nebuleuse/nebuleuse_073.jpg', 'nebuleuse_073', NULL, 'IC 434 (la tete de cheval) Photo prise de l\'observatoire. TOA 130 + Monture EM-200 CYRIL PENTAX K5 CORRECTEUR 1 POSE 400s - 1600 ISO - 0 DARK - 0 OFFSET- 0 FLAT PIXINSIGHT impossible de faire un empilement, le temps de cadrer IC 434 des nuages son venu cacher la cible. j\'ai du donc me rabattre sur un traitement classique sans empilement sur les 2 images de test a 200 seconde et 400 secondes, que j\'ai peu effectuer durant ma phase de cadrage de la cible', '2022-02-05', 6, NULL),
(397, 'images/NosPhotos/nebuleuse/nebuleuse_074.jpg', 'nebuleuse_074', NULL, 'IC 434 (la tete de cheval) Photo prise de l\'observatoire. TOA 130 + Monture EM-200 CYRIL PENTAX K5 CORRECTEUR 30 POSE 400s - 1600 ISO - 50 DARK - 80 OFFSET- 50 FLAT PIXINSIGHT', '2022-02-26', 6, NULL),
(398, 'images/NosPhotos/nebuleuse/nebuleuse_075.jpg', 'nebuleuse_075', NULL, 'IC 417 (la nebuleuse de l’araignée) Photo prise de l\'observatoire. TOA 130 + Monture EM-200 CYRIL PENTAX K5 REDUCTEUR 39 POSE 400s (30 empilée) - 1600 ISO - 50 DARK - 80 OFFSET- 50 FLAT PIXINSIGHT', '2022-11-26', 6, NULL),
(399, 'images/NosPhotos/nebuleuse/nebuleuse_076.jpg', 'nebuleuse_076', NULL, 'IC 417 (la nebuleuse de l’araignée) Photo prise de l\'observatoire. TOA 130 + Monture EM-200 CYRIL PENTAX K5 REDUCTEUR 39 POSE 400s (30 empilée) - 1600 ISO - 50 DARK - 80 OFFSET- 50 FLAT PIXINSIGHT', '2022-11-26', 6, NULL),
(400, 'images/NosPhotos/nebuleuse/nebuleuse_077.jpg', 'nebuleuse_077', NULL, 'IC 417 (la nebuleuse de l’araignée) Photo prise de l\'observatoire. TOA 130 + Monture EM-200 CYRIL PENTAX K5 REDUCTEUR 39 POSE 400s (30 empilée) - 1600 ISO - 50 DARK - 80 OFFSET- 50 FLAT PIXINSIGHT', '2022-11-26', 6, NULL),
(401, 'images/NosPhotos/nebuleuse/nebuleuse_078.jpg', 'nebuleuse_078', NULL, 'IC 417 (la nebuleuse de l’araignée) Photo prise de l\'observatoire. TOA 130 + Monture EM-200 CYRIL PENTAX K5 REDUCTEUR 39 POSE 400s (30 empilée) - 1600 ISO - 50 DARK - 80 OFFSET- 50 FLAT PIXINSIGHT', '2022-11-26', 6, NULL),
(402, 'images/NosPhotos/nebuleuse/nebuleuse_079.jpg', 'nebuleuse_079', NULL, 'IC 405 (Nébuleuse de l’Étoile Flamboyante) Photo prise de l\'observatoire. TOA 130 + Monture EM-200 CYRIL PENTAX K5 CORRECTEUR 17 POSE 400s (17 empilée) - 1600 ISO - 50 DARK(recup de IC417) - 80 OFFSET(recup de IC417)- 0 FLAT PIXINSIGHT je me suis arrété a 17 image car il faisait -8°C et le reflex a deconné a la 18 ieme image me mettant des artefact de couleur chelou sur les photo ET la monture avait un point dur probablement du a du gel qui se serai infiltré dans les parti mecaniques', '2022-12-17', 6, NULL),
(403, 'images/NosPhotos/nebuleuse/nebuleuse_080.jpg', 'nebuleuse_080', NULL, 'M8 (Nebuleuse de la lagune) Photo prise de l\'observatoire avec raphael. TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC REDUCTEUR 80 POSE 30s (33 empilée) - GAIN 130 - 30 DARK) - 80 OFFSET- 0 FLAT PIXINSIGHT prise de vu avec logiciel NINA et MAP Automatique j\'ai choisi de faire des poses courte sans autoguidage car il y avait beaucoup de vent ce jour la, avec des raffales jusqu\'a 40 Km/h environ. les poses longues sont impossible dans ce context, j\'ai donc choisi des poses tres courte (30 s) avec un cible facile. et j\'ai fait plein de brut (80) comme ca meme avec un taux de dechet supperieur a50% j\'ai quand meme reussi a recuperer 33 image de bonne qualitée (quand il y avait des creux de vent)', '2023-05-14', 6, NULL),
(404, 'images/NosPhotos/nebuleuse/nebuleuse_081.jpg', 'nebuleuse_081', NULL, 'M42 - Raphael Lunette 102/714 Observatoire Somme 2 serie', '2024-01-27', 6, NULL),
(405, 'images/NosPhotos/nebuleuse/nebuleuse_081.png', 'nebuleuse_081', NULL, 'M42 - Jeanne Lunette 102/714 Observatoire', '2024-01-27', 6, NULL),
(406, 'images/NosPhotos/nebuleuse/nebuleuse_081.tif', 'nebuleuse_081', NULL, 'M42 (grande nebuleuse d\'orion) Photo prise de l\'observatoire avec les adherent orion TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC REDUCTEUR 36 POSE 120s - GAIN 110 - 50 DARK) - 80 OFFSET- 0 FLAT PIXINSIGHT', '2024-02-03', 6, NULL),
(407, 'images/NosPhotos/nebuleuse/nebuleuse_082.jpg', 'nebuleuse_082', NULL, 'M20 (nébuleuse du trèfle) Photo prise de chez moi TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC CORRECTEUR 33 POSE 200s - GAIN 130 - 80 DARK - 81 OFFSET- 0 FLAT PIXINSIGHT', '2024-08-05', 6, NULL),
(408, 'images/NosPhotos/nebuleuse/nebuleuse_082.tif', 'nebuleuse_082', NULL, 'M45 Photo prise du Betz TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC REDUCTEUR 51 POSE 200s - GAIN 130 - 90 DARK - 80 OFFSET-30 FLAT PixInsight', '2024-10-31', 6, NULL),
(409, 'images/NosPhotos/nebuleuse/nebuleuse_083.jpg', 'nebuleuse_083', NULL, 'ICI 434 (nebuleuse a tete de cheval) Photo prise du Betz TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC CORRECTEUR Autoguidage (un peu capricieux au niveau de la declinaison ce qui a engendré beaucoup de photo rejetée) 39(39 clean + 23 rejeté) POSE 240s - GAIN 130 - 100 DARK - 80 OFFSET-50 FLAT PixInsight', '2024-11-30', 6, NULL),
(410, 'images/NosPhotos/nebuleuse/nebuleuse_083.png', 'nebuleuse_083', NULL, 'ICI 434 (nebuleuse a tete de cheval) Photo prise du Betz TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC CORRECTEUR Autoguidage (un peu capricieux au niveau de la declinaison ce qui a engendré beaucoup de photo rejetée) 39(39 clean + 23 rejeté) POSE 240s - GAIN 130 - 100 DARK - 80 OFFSET-50 FLAT PixInsight', '2024-11-30', 6, NULL),
(411, 'images/NosPhotos/nebuleuse/nebuleuse_084.jpg', 'nebuleuse_084', NULL, 'ICI 405 (nebuleuse de l\'etoile flamboyante) Photo prise du Betz TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC CORRECTEUR AUTOGUIDAGE sur DIviseur optique 18 POSE 300s - GAIN 130 - 50 DARK - 80 OFFSET-0 FLAT PixInsight. fin prematuré de la session a cause de pb de guidage (gros picque de decalage sur l\'axe AD)', '2024-12-28', 6, NULL),
(412, 'images/NosPhotos/nebuleuse/nebuleuse_085.jpg', 'nebuleuse_085', NULL, 'M42 (grande nebuleuse d\'orion) - Photo Andre Photo prise du Betz DOBSON skywatcher 254mm focale -1200 mm APN CANON 600 d non défiltré Pas d\'autoguidage 114 poses de 10 sec (19 Minutes ) -ISO 1600 - Pas de DOF empilement Siril + GIM', '2024-12-28', 6, NULL),
(413, 'images/NosPhotos/nebuleuse/nebuleuse_086.jpg', 'nebuleuse_086', NULL, 'photos effectuées le 28/12/2024 par Raphaël Images réalisées avec camera ZWO ASI294MC pro Mars : C14 avec réducteur de focale, tirage de 146mm et barlow X2 soit 5600 mm de focale;', '2024-12-28', 6, NULL),
(414, 'images/NosPhotos/nebuleuse/nebuleuse_087.jpg', 'nebuleuse_087', NULL, 'NGC 7023( Nebuleuse de l\'IRIS) Photo prise du Betz TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC CORRECTEUR AUTOGUIDAGE sur DIviseur optique 22 POSE 400s - GAIN 200 - 50 DARK - 80 OFFSET-50 FLAT PixInsight.', '2025-05-30', 6, NULL),
(415, 'images/NosPhotos/nebuleuse/nebuleuse_091.jpg', 'nebuleuse_091', NULL, 'M42 (grande nebuleuse d\'orion) - Photo Andre Photo prise du Betz DOBSON skywatcher 254mm focale -1200 mm APN CANON 600 d non défiltré Pas d\'autoguidage 114 poses de 10 sec (19 Minutes ) -ISO 1600 - Pas de DOF empilement Siril + GIM', '2024-12-28', 6, NULL),
(416, 'images/NosPhotos/nebuleuse/nebuleuse_092.jpg', 'nebuleuse_092', NULL, 'photos effectuées le 28/12/2024 par Raphaël Images réalisées avec camera ZWO ASI294MC pro Mars : C14 avec réducteur de focale, tirage de 146mm et barlow X2 soit 5600 mm de focale;', '2024-12-28', 6, NULL),
(417, 'images/NosPhotos/nebuleuse/nebuleuse_093.jpg', 'nebuleuse_093', NULL, 'NGC 7023( Nebuleuse de l\'IRIS) Photo prise du Betz TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC CORRECTEUR AUTOGUIDAGE sur DIviseur optique 22 POSE 400s - GAIN 200 - 50 DARK - 80 OFFSET-50 FLAT PixInsight.', '2025-05-30', 6, NULL),
(418, 'images/NosPhotos/nebuleuse/nebuleuse_094.png', 'nebuleuse_094', NULL, 'region NGC 6144( Rho rho ophiuchus) Photo prise du Betz TOA 130 + Monture EM-200 CYRIL - ASI 2600 MC REDUCTEUR AUTOGUIDAGE sur DIviseur optique 21 POSE 300s - GAIN 130 - 50 DARK - 80 OFFSET-50 FLAT PixInsight.', '2025-06-21', 6, NULL),
(419, 'images/NosPhotos/nebuleuse_anulaire/nebuleuse_anulaire_001.jpg', 'nebuleuse_anulaire_001', NULL, 'M27 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + EXTENDER 1,5x POSE 51* 120s - 1600 ISO - 16 DARK - 80 OFFSET PIXINSITE 36 images', '2014-10-17', 8, NULL),
(420, 'images/NosPhotos/nebuleuse_anulaire/nebuleuse_anulaire_002.jpg', 'nebuleuse_anulaire_002', NULL, 'M57 APN K5 OBJECTIF 200 mm MONTURE EQ3', '2014-02-26', 8, NULL),
(421, 'images/NosPhotos/nebuleuse_anulaire/nebuleuse_anulaire_003.jpg', 'nebuleuse_anulaire_003', NULL, 'M57 TOA 130 + Monture EM_200 CYRIL PENTAX K5 + EXTENDER 1,5x + OCCULAIRE 13 mm POSE 101 * 85s - 3200 ISO - 52 DARK - 100 OFFSET PIXINSITE 58 images', '2014-06-20', 8, NULL),
(422, 'images/NosPhotos/nebuleuse_anulaire/nebuleuse_anulaire_004.jpg', 'nebuleuse_anulaire_004', NULL, 'M76 CFF 160 + Monture CGE PRO CANON 550D + AUTOGUIDAGE + FOYER POSE 10 * 600s - 800 ISO - 10 DARK - 20 OFFSET PIXINSITE 10 images', '0000-00-00', 8, NULL),
(423, 'images/NosPhotos/nebuleuse_anulaire/nebuleuse_anulaire_005.jpg', 'nebuleuse_anulaire_005', NULL, 'M76 CFF 160 + Monture CGE PRO CANON 550D + AUTOGUIDAGE + FOYER POSE 10 * 600s - 800 ISO - 10 DARK - 20 OFFSET PIXINSITE 10 images', '0000-00-00', 8, NULL),
(424, 'images/NosPhotos/nebuleuse_anulaire/nebuleuse_anulaire_006.jpg', 'nebuleuse_anulaire_006', NULL, 'M76 (avec annotation galaxie) CFF 160 + Monture CGE PRO CANON 550D + AUTOGUIDAGE + FOYER POSE 10 * 600s - 800 ISO - 10 DARK - 20 OFFSET PIXINSITE 10 images', '0000-00-00', 8, NULL),
(425, 'images/NosPhotos/nebuleuse_anulaire/nebuleuse_anulaire_007.jpg', 'nebuleuse_anulaire_007', NULL, 'M1 (nebuleuse du crabe) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + EXTENDER + AUTOGUIDAGE POSE 20 * 300s - 1600 ISO - 5 DARK -20 OFFSET PIXINSITE 20 images', '2014-12-23', 8, NULL),
(426, 'images/NosPhotos/nebuleuse_anulaire/nebuleuse_anulaire_008.jpg', 'nebuleuse_anulaire_008', NULL, 'M57 (nebuleuse anulaire de la lyre) CGE PRO(club) + C8 (club) TRAITEMENT DAMIEN', '2016-08-03', 8, NULL),
(427, 'images/NosPhotos/nebuleuse_anulaire/nebuleuse_anulaire_009.jpg', 'nebuleuse_anulaire_009', NULL, 'M57 (nebuleuse anulaire de la lyre) CGE PRO(club) + C8 (club) TRAITEMENT JEANNE', '2016-08-03', 8, NULL),
(428, 'images/NosPhotos/nebuleuse_anulaire/nebuleuse_anulaire_010.jpg', 'nebuleuse_anulaire_010', NULL, 'M57 (nebuleuse anulaire de la lyre) CGE PRO(club) + C8 (club) TRAITEMENT DAMIEN 2', '2016-08-03', 8, NULL),
(429, 'images/NosPhotos/nebuleuse_anulaire/nebuleuse_anulaire_011.jpg', 'nebuleuse_anulaire_011', NULL, 'M27 C11 edge + réducteur 0.7 + canon 500d du club 60x30s à 1600 iso, 8 darks. Empilement et traitement SIRIL.', '2019-06-01', 8, NULL),
(430, 'images/NosPhotos/nebuleuse_anulaire/nebuleuse_anulaire_012.jpg', 'nebuleuse_anulaire_012', NULL, 'M1 (nebuleuse du crabe) TOA 130 + Monture EM_200 CYRIL PENTAX K5 + CORRECTEUR + AUTOGUIDAGE POSE 21 * 400s - 1600 ISO - 50 DARK -80 OFFSET - 50 FLAT PIXINSITE 21 images', '2020-02-22', 8, NULL),
(431, 'images/NosPhotos/nebuleuse_anulaire/nebuleuse_anulaire_013.jpg', 'nebuleuse_anulaire_013', NULL, 'M1 Photo prise de l\'observatoire par par Jeanne, Michel et Raphael . C14 + Monture CGE PRO camera QHY174MM refroidie à -15 autoguidage sur la lunette 102mm avec starshoot et phdguiding (qui s\'est décalé !!!!) 400 POSE 10s - gain à 40dB - 100 DARK 0 OFFSET- 0 FLAT Traitement Raphaël', '2022-03-07', 8, NULL),
(432, 'images/NosPhotos/nuages_irise/nuages_irise_001.jpg', 'nuages_irise_001', NULL, 'JEANNE Panasonic DMC-TZ25 ƒ/6,3 1/4000 11,7mm 160 ISO', '2013-11-12', 15, NULL),
(433, 'images/NosPhotos/saturne/saturne_001.tif', 'saturne_001', NULL, 'SATURNE TOA 130 + Monture EM_200 CYRIL DMK2121 + 8 mm Vidéo de 2 mm AVISTACK + REGISTAX', '2014-06-24', 5, NULL),
(434, 'images/NosPhotos/saturne/saturne_002.jpg', 'saturne_002', NULL, 'MARATHON MESSIER', '2013-03-10', 5, NULL),
(435, 'images/NosPhotos/saturne/saturne_003.jpg', 'saturne_003', NULL, 'SATURNE TOA 130 + Monture EM_200 CYRIL DMK2121 + 8 mm Vidéo de 2 mm AVISTACK + REGISTAX', '2014-06-24', 5, NULL),
(436, 'images/NosPhotos/saturne/saturne_004.png', 'saturne_004', NULL, 'INOVA + C8 du club BARLOW 3x (michel) AVISTACK + REGISTAX + PIX (pour etalonage des couleurs)', '2016-07-04', 5, NULL),
(437, 'images/NosPhotos/saturne/saturne_005.png', 'saturne_005', NULL, 'INOVA + C8 + BARLOW 3X (michel) Autostakkert + REGISTAX Traitement raphael', '2016-07-04', 5, NULL),
(438, 'images/NosPhotos/saturne/saturne_006.jpg', 'saturne_006', NULL, 'SATURNE Lunette CFF160 (jeanne) Monture AVALON (Jeanne) TRAITEMENT REGISTAX (Jeanne)', '2016-07-09', 5, NULL),
(439, 'images/NosPhotos/saturne/saturne_007.jpg', 'saturne_007', NULL, 'SATURNE par CYRIL Photo prise de l\'observatoire. TOA 130 + Monture EM-200 CYRIL PENTAX K5 EXTENDER JUPITER - 56*1/60s - 100 ISO - 0 DARK - 0 OFFSET- 0 FLAT AUTOSTAKKERT - PHOTOSHOP CS6', '2021-10-16', 5, NULL),
(440, 'images/NosPhotos/saturne/saturne_008.png', 'saturne_008', NULL, 'SATURNE par Jeanne Photo prise de l\'observatoire. C14 + Monture CGEPRO Camera NB DMK Barlow Televue x2 plusieurs Video 3000 images AUTOSTAKKERT - REgistax', '2021-10-16', 5, NULL),
(441, 'images/NosPhotos/saturne/saturne_009.png', 'saturne_009', NULL, 'SATURNE par Jeanne Photo prise de l\'observatoire. C14 + Monture CGEPRO Camera NB DMK Barlow Televue x2 plusieurs Video 3000 images AUTOSTAKKERT - REgistax (Traitement V2)', '2021-10-16', 5, NULL),
(442, 'images/NosPhotos/saturne/saturne_010.png', 'saturne_010', NULL, 'Saturne Photo réalisées fin septembre par Jeanne, Raphaël et Michel. Prises de vues réalisées grâce à une caméra CCD QHY 174 monochrome montée sur le télescope Célestron 14 de la coupole. Ouverture : 360 mm focale : 4000 mm. monture Célestron CGEPRO sur colonne, pilotée par logiciel \"carte du ciel\" sur PC.', '2021-10-15', 5, NULL),
(443, 'images/NosPhotos/soleil/soleil_001.png', 'soleil_001', NULL, 'ASSEMBLAGE SURFACE + PROTUBERANCE CAMILLE LA CHENILLE', '2014-02-26', 2, NULL),
(444, 'images/NosPhotos/soleil/soleil_002.jpg', 'soleil_002', NULL, 'MOZAIC COMPOSITION SURFACE / PROTUBERANCE CAMERA DMK', '2013-03-06', 2, NULL),
(445, 'images/NosPhotos/soleil/soleil_003.png', 'soleil_003', NULL, 'PROTUBERANCE', '2012-09-20', 2, NULL),
(446, 'images/NosPhotos/soleil/soleil_004.jpg', 'soleil_004', NULL, 'PROTUBERANCE', '2012-09-23', 2, NULL),
(447, 'images/NosPhotos/soleil/soleil_005.jpg', 'soleil_005', NULL, 'PHOTO K5 RAP SOLAIRES', '2012-06-03', 2, NULL),
(448, 'images/NosPhotos/soleil/soleil_006.jpg', 'soleil_006', NULL, 'SURFACE', '2012-03-21', 2, NULL),
(449, 'images/NosPhotos/soleil/soleil_007.gif', 'soleil_007', NULL, 'VIDEO SURFACE plusieurs videos a 2 min d\'intervale CAMER DMK', '2014-02-26', 2, NULL),
(450, 'images/NosPhotos/soleil/soleil_008.gif', 'soleil_008', NULL, 'VIDEO PROTUBERANCE Plusieurs video espacées de 2 min CAMERA DMK', '2014-02-26', 2, NULL),
(451, 'images/NosPhotos/soleil/soleil_009.png', 'soleil_009', NULL, 'surface soleil DMK2121 au foyer LUNT + EQ3', '2015-12-12', 2, NULL),
(452, 'images/NosPhotos/soleil/soleil_010.png', 'soleil_010', NULL, 'surface soleil DMK2121 au foyer LUNT + EQ3 du club mozaic plusieurs videos photo prise et traité par Damiens (lors de l\'atelier soleil) traitement AVISTACK + REGISTAX + GIMP', '2016-10-29', 2, NULL),
(453, 'images/NosPhotos/soleil/soleil_011.png', 'soleil_011', NULL, 'surface soleil DMK2121 au foyer LUNT + EQ3 du club barlow televue 2x club photo prise et traité par Damiens (lors de l\'atelier soleil) traitement AVISTACK + REGISTAX + GIMP', '2016-10-29', 2, NULL),
(454, 'images/NosPhotos/soleil/soleil_012.png', 'soleil_012', NULL, 'surface soleil DMK2121 au foyer LUNT + EQ3 du club barlow televue 2x club photo prise et traité par Damiens (lors de l\'atelier soleil) traitement AVISTACK + REGISTAX + GIMP', '2016-10-29', 2, NULL),
(455, 'images/NosPhotos/soleil/soleil_013.png', 'soleil_013', NULL, 'protubérance DMK2121 au foyer LUNT+EQ3 du club+ barlow televue 2x traitement AutoStakkert+Registax+GIMP', '2016-12-10', 2, NULL),
(456, 'images/NosPhotos/soleil/soleil_014.png', 'soleil_014', NULL, 'surface soleil DMK2121 au foyer LUNT+EQ3 du club traitement assemblage de 6 images AutoStakkert+Registax+GIMP+Hugin', '2016-12-10', 2, NULL);
INSERT INTO `photo` (`photo_id`, `url`, `titre`, `description`, `infos_techniques`, `date_prise`, `categorie_id`, `article_id`) VALUES
(457, 'images/NosPhotos/soleil/soleil_015.png', 'soleil_015', NULL, 'protubérance DMK2121 au foyer LUNT+EQ3 du club traitement AutoStakkert+Registax+GIMP', '2016-12-10', 2, NULL),
(458, 'images/NosPhotos/soleil/soleil_016.png', 'soleil_016', NULL, 'protubérance DMK2121 au foyer LUNT+EQ3 du club+ barlow televue 2x traitement AutoStakkert+Registax+GIMP', '2016-12-10', 2, NULL),
(459, 'images/NosPhotos/soleil/soleil_017.png', 'soleil_017', NULL, 'mosaique de six photos, DMK2121 au foyer LUNT+EQ3 du club, traitement AutoStakkert+Hugin+registax+GIMP', '2017-04-24', 2, NULL),
(460, 'images/NosPhotos/soleil/soleil_018.png', 'soleil_018', NULL, 'DMK2121 au foyer LUNT+EQ3 du club, traitement AutoStakkert+Hugin+registax+GIMP', '2017-04-24', 2, NULL),
(461, 'images/NosPhotos/soleil/soleil_019.png', 'soleil_019', NULL, 'mosaique de six photos, DMK2121 au foyer LUNT+EQ3 du club, traitement AutoStakkert+Hugin+registax+GIMP+LibreOffice Draw', '2017-04-24', 2, NULL),
(462, 'images/NosPhotos/soleil/soleil_020.png', 'soleil_020', NULL, 'mosaique de deux photos, DMK2121 au foyer LUNT+EQ3 du club, traitement AutoStakkert+Hugin+registax+GIMP', '2017-04-24', 2, NULL),
(463, 'images/NosPhotos/soleil/soleil_021.jpg', 'soleil_021', NULL, 'C11 edge canon 500d astrosolar nd5, empilement AS3! traitement siril.', '2019-04-17', 2, NULL),
(464, 'images/NosPhotos/soleil/soleil_022.jpg', 'soleil_022', NULL, 'taches sur soleil du 4 avril 2020, Matériel: C11edge + astrosolar ND5 +asi290MM; traitement AS!3', '2020-04-04', 2, NULL),
(465, 'images/NosPhotos/soleil/soleil_023.jpg', 'soleil_023', NULL, 'taches sur soleil du 4 avril 2020, Matériel: C11edge + barlow celestron 2.5x +astrosolar ND5 +asi290MM; traitement AS!3', '2020-04-04', 2, NULL),
(466, 'images/NosPhotos/soleil/soleil_024.tif', 'soleil_024', NULL, '12h - Soleil au betz Luntt du club+ double stack + Occulaire 17 mm + Camera ASI 2600 MC Traitement : Autostakkert + AStrosurface', '2023-08-08', 2, NULL),
(467, 'images/NosPhotos/soleil/soleil_025.jpg', 'soleil_025', NULL, '12h - Soleil au betz Luntt du club+ double stack + Occulaire 17 mm + Camera ASI 2600 MC Traitement : Autostakkert + AStrosurface', '2023-08-08', 2, NULL),
(468, 'images/NosPhotos/soleil/soleil_026.jpg', 'soleil_026', NULL, '12h - Soleil au betz Luntt du club+ double stack + Occulaire 17 mm + Camera ASI 2600 MC Traitement : Autostakkert + AStrosurface', '2023-08-08', 2, NULL),
(469, 'images/NosPhotos/soleil/soleil_027.jpg', 'soleil_027', NULL, '12h - Soleil au betz Luntt du club+ double stack + Occulaire 17 mm + Camera ASI 2600 MC Traitement : Autostakkert + AStrosurface', '2023-08-08', 2, NULL),
(470, 'images/NosPhotos/soleil/soleil_028.jpg', 'soleil_028', NULL, 'Soleil au betz Luntt du club+ double stack + ??? mm + Camera ASI 294 MC (du club) Traitement : ???', '2025-06-28', 2, NULL),
(471, 'images/NosPhotos/spectro/spectro_001.jpg', 'spectro_001', NULL, 'SIRIUS Grand Chien RESEAU 300 TRAITS 30 sec de pose - 100 ISO - Telescope 400 betz CANON 500D', '2014-03-06', 21, NULL),
(472, 'images/NosPhotos/spectro/spectro_002.jpg', 'spectro_002', NULL, 'ALDEBARAN Taureau RESEAU 300 TRAITS 30 sec de pose - 100 ISO - Telescope 400 betz CANON 500D', '2014-03-06', 21, NULL),
(473, 'images/NosPhotos/spectro/spectro_003.jpg', 'spectro_003', NULL, 'BETELGEUSE Orion RESEAU 300 TRAITS 30 sec de pose - 100 ISO - Telescope 400 betz CANON 500D', '2014-03-06', 21, NULL),
(474, 'images/NosPhotos/spectro/spectro_004.jpg', 'spectro_004', NULL, 'BETELGEUSE Orion RESEAU 600 TRAITS 30 sec de pose - 100 ISO - Telescope 400 betz CANON 500D', '2014-03-06', 21, NULL),
(475, 'images/NosPhotos/spectro/spectro_005.jpg', 'spectro_005', NULL, 'ALCOR Grande Ourse RESEAU 300 TRAITS 15 sec de pose - 200 ISO - Telescope 400 betz CANON 500D', '2014-03-14', 21, NULL),
(476, 'images/NosPhotos/spectro/spectro_006.jpg', 'spectro_006', NULL, 'MIZAR Grande ourse RESEAU 300 TRAITS 15 sec de pose - 200 ISO - Telescope 400 betz CANON 500D', '2014-03-14', 21, NULL),
(477, 'images/NosPhotos/spectro/spectro_007.jpg', 'spectro_007', NULL, 'ALKAID Grande Ourse RESEAU 300 TRAITS 15 sec de pose - 100 ISO - Telescope 400 betz CANON 500D', '2014-03-14', 21, NULL),
(478, 'images/NosPhotos/spectro/spectro_008.jpg', 'spectro_008', NULL, 'CASTOR Gémeaux RESEAU 300 TRAITS 15 sec de pose - 200 ISO - Telescope 400 betz CANON 500D', '2014-03-14', 21, NULL),
(479, 'images/NosPhotos/spectro/spectro_009.jpg', 'spectro_009', NULL, 'CHARA Chiens de Chasse RESEAU 300 TRAITS 15 sec de pose - 200 ISO - Telescope 400 betz CANON 500D', '2014-03-14', 21, NULL),
(480, 'images/NosPhotos/spectro/spectro_010.jpg', 'spectro_010', NULL, 'DUBHE Grande Ourse RESEAU 300 TRAITS 15 sec de pose - 100 ISO - Telescope 400 betz CANON 500D', '2014-03-14', 21, NULL),
(481, 'images/NosPhotos/spectro/spectro_011.jpg', 'spectro_011', NULL, 'PROCYON Petit Chien RESEAU 300 TRAITS 15 sec de pose - 100 ISO - Telescope 400 betz CANON 500D', '2014-03-14', 21, NULL),
(482, 'images/NosPhotos/spectro/spectro_012.jpg', 'spectro_012', NULL, 'ALCOR et MIZAR Grande Ourse RESEAU 300 TRAITS 15 sec de pose - 200 ISO - Telescope 400 betz CANON 500D', '2014-03-14', 21, NULL),
(483, 'images/NosPhotos/spectro/spectro_013.jpg', 'spectro_013', NULL, 'CHARA Chien de Chasse RESEAU 300 TRAITS 15 sec de pose - 200 ISO - Telescope 400 betz CANON 500D', '2014-03-14', 21, NULL),
(484, 'images/NosPhotos/time_lapse/time_lapse_001.gif', 'time_lapse_001', NULL, '11/11/2019 - Time Lapse A l\'observatoire du Betz TRANSIT DE MERCURE (passage devant le soleil) NEWTON DESALUMINE (du club) + Monture CGEM-DX sur COLONNE CANON (du Club) + PROJECTION OCCULAIRE 17mm avec filtre polarisant variable + PAS AUTOGUIDAGE POSE 31 * 1/4000s - 100 ISO - 0 DARK - 0 OFFSET - 0 FLAT Photoshop (Alignement a la main) Photoscape (gif animé) Ciel bleu en début de séance (France 3 Auvergne etait présent). des nuages sont arrivé un peu plus tard. des nuages très dense on rempli le ciel pendant plusieurs heures puis un petit créneau de quelques minutes qui a permis de photographier la suite. PS: quand le soleil est blanc c\'est le début de séance et le petit créneau de fin de journée le soleil était moins fort (car plus bas sur l\'horizon) c\'est pourquoi il est orange, malgré la modification du temps de pose (1/4000 ==> 1/1000)', '2019-11-11', 20, NULL),
(485, 'images/NosPhotos/voie_lactee/voie_lactee_001.jpg', 'voie_lactee_001', NULL, 'voie lactée en direction du sagitaire Sony APS-C 18mm (raphael) Monture EQ3 POSE 25 * 120s - 1600 ISO empilement 16 meilleurs image', '2018-08-11', 12, NULL),
(486, 'images/NosPhotos/voie_lactee/voie_lactee_002.jpg', 'voie_lactee_002', NULL, 'VOIE LACTEE 19/09/2012 K5 sur trepieds', '2012-09-19', 12, NULL),
(487, 'images/NosPhotos/voie_lactee/voie_lactee_003.jpg', 'voie_lactee_003', NULL, 'K5 sur trepieds OBJECTIF FISH EYE 8 mm', '2014-02-26', 12, NULL),
(488, 'images/NosPhotos/voie_lactee/voie_lactee_004.jpg', 'voie_lactee_004', NULL, 'K5 sur EQ3 CONSTELLATION du SAGITAIRE', '2014-02-26', 12, NULL),
(489, 'images/NosPhotos/voie_lactee/voie_lactee_005.jpg', 'voie_lactee_005', NULL, 'GRands champ (cygne, lyre) objectif 18-55 mm F/3.5 + Monture EM_200 CYRIL PENTAX K5 POSE 25 * 340s - 1600 ISO - 17 DARK - (pas offset) PIXINSITE 25 images', '2015-10-31', 12, NULL),
(490, 'images/NosPhotos/voie_lactee/voie_lactee_006.jpg', 'voie_lactee_006', NULL, 'GRands champ (cygne, lyre) (avec marquages) objectif 18-55 mm F/3.5 + Monture EM_200 CYRIL PENTAX K5 POSE 25 * 340s - 1600 ISO - 17 DARK - (pas offset) PIXINSITE 25 images', '2015-10-31', 12, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `photo_import`
--

CREATE TABLE `photo_import` (
  `page_url` varchar(512) DEFAULT NULL,
  `image_url` varchar(512) DEFAULT NULL,
  `alt` text DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `source` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `nb_places` int(11) NOT NULL,
  `date_reservation` datetime NOT NULL DEFAULT current_timestamp(),
  `evenement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `nom`, `email`, `telephone`, `nb_places`, `date_reservation`, `evenement_id`) VALUES
(1, 'TomTest', 'TomQuiTest@test.test', '06 06 06 06 06', 2, '2026-01-18 21:01:03', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Index pour la table `categorie_photo`
--
ALTER TABLE `categorie_photo`
  ADD PRIMARY KEY (`categorie_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`evenement_id`);

--
-- Index pour la table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `fk_photo_categorie` (`categorie_id`),
  ADD KEY `fk_photo_article` (`article_id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_reservation_evenement` (`evenement_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `categorie_photo`
--
ALTER TABLE `categorie_photo`
  MODIFY `categorie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `evenement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `photo`
--
ALTER TABLE `photo`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=491;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `fk_photo_article` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_photo_categorie` FOREIGN KEY (`categorie_id`) REFERENCES `categorie_photo` (`categorie_id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_reservation_evenement` FOREIGN KEY (`evenement_id`) REFERENCES `evenement` (`evenement_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
