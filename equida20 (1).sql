-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 01 avr. 2021 à 07:14
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `equida20`
--

-- --------------------------------------------------------

--
-- Structure de la table `affectation`
--

DROP TABLE IF EXISTS `affectation`;
CREATE TABLE IF NOT EXISTS `affectation` (
  `idCourriel` int(5) NOT NULL,
  `idPieceJoint` int(5) NOT NULL,
  PRIMARY KEY (`idCourriel`,`idPieceJoint`),
  KEY `idPieceJoint` (`idPieceJoint`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `affectation`
--

INSERT INTO `affectation` (`idCourriel`, `idPieceJoint`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `categvente`
--

DROP TABLE IF EXISTS `categvente`;
CREATE TABLE IF NOT EXISTS `categvente` (
  `code` varchar(5) NOT NULL,
  `libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categvente`
--

INSERT INTO `categvente` (`code`, `libelle`) VALUES
('AUT', 'Vente d\'automne'),
('ELVG', 'Vente d\'élevage'),
('ETE', 'Vente d\'été');

-- --------------------------------------------------------

--
-- Structure de la table `cheval`
--

DROP TABLE IF EXISTS `cheval`;
CREATE TABLE IF NOT EXISTS `cheval` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `sexe` varchar(1) NOT NULL,
  `numSire` varchar(15) NOT NULL,
  `idTypeCheval` int(5) DEFAULT NULL,
  `idClient` int(11) DEFAULT NULL,
  `pere` int(5) DEFAULT NULL,
  `mere` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idTypeCheval` (`idTypeCheval`),
  KEY `idClient` (`idClient`),
  KEY `pere` (`pere`,`mere`),
  KEY `mere` (`mere`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cheval`
--

INSERT INTO `cheval` (`id`, `nom`, `sexe`, `numSire`, `idTypeCheval`, `idClient`, `pere`, `mere`) VALUES
(1, 'Valdack', 'M', '0808.000.020A', 1, 47, 2, 3),
(2, 'Houri', 'M', '0808.000.020B', 1, 27, 4, 3),
(3, 'Hussa', 'F', '0808.000.050B', 1, 29, 5, 1),
(4, 'Trais d’or', 'M', '0404.000.070A', 2, 30, 5, 3),
(5, 'Desperado', 'M', '0404.000.070H', 2, 37, 1, 2),
(76, 'Star Melody', 'F', '123456A', 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `rue` varchar(60) NOT NULL,
  `copos` varchar(5) NOT NULL,
  `ville` varchar(40) NOT NULL,
  `mail` varchar(60) DEFAULT NULL,
  `codePays` varchar(3) DEFAULT NULL,
  `idVendeur` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cli_pays` (`codePays`),
  KEY `idVendeur` (`idVendeur`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `rue`, `copos`, `ville`, `mail`, `codePays`, `idVendeur`) VALUES
(1, 'Deltour', 'Charles', '4 rue du Pont', '14680', 'Bretteville Sur Laize', 'cdeltour@hotmail.com', 'FRA', 0),
(2, 'Fime', 'Nadia', '5 rue du Montparnasse', '14220', 'Boulon', '', 'ENG', 0),
(3, 'Ertau', 'Frank', '4 Avenue du président Wilson', '14190', 'Urville', 'frank.ertau@laposte.net', 'FRA', 0),
(4, 'Maneur', 'David', '6 rue Charles Péguy', '14220', 'Mutrécy', '', 'FRA', 0),
(5, 'Berezovski', 'Sylvie', '18 rue du Château', '14680', 'Barbery', '', 'FRA', 0),
(6, 'Finley', 'Pascale', '25 rue de Tolbiac', '14680', 'Caillouet', 'pascfinley@yahoo.fr', 'FRA', 0),
(7, 'Vofur', 'Hector', '18 rue Deparcieux', '14190', 'Cauvicourt', 'hvofur@free.fr', 'ENG', 0),
(8, 'Derzou', 'Fred', '230 avenue de la libert', '14220', 'Espins', 'ouzala@aol.com', 'FRA', 0),
(9, 'Serty', 'Julie', '23 rue du Calvaire', '14220', 'Fresney le Vieux', '', 'FRA', 0),
(10, 'Vofur', 'Victor', '18 rue Deparcieux', '14680', 'Bretteville Sur Laize', 'victor.vofur@laposte.net', 'FRA', 0),
(11, 'Calende', 'Hugo', '22 rue des jardins', '14680', 'Bretteville Sur Laize', '', 'FRA', 0),
(12, 'Jemba', 'Hubert', '10 rue du 8 mai 1945', '14680', 'Bretteville Sur Laize', 'jaimeba@yahoo.fr', 'FRA', 0),
(13, 'Morin', 'S?verine', '4 rue du bac', '93000', 'Paris', 'morinsev@hotmail.com', 'FRA', 0),
(14, 'Benrech', 'Tarek', '79 rue de Caen', '14320', 'May Sur Orne', '', 'FRA', 0),
(15, 'Nguyen', 'Marc', '53 impasse Tourneur', '14320', 'Fontenay Le Marmion', 'nguyen774@wanadoo.fr', 'FRA', 0),
(16, 'Louali', 'Karima', '89 avenue Poincar', '14320', 'Saint Martin de Fontenay', 'kloua@caramail.fr', 'FRA', 0),
(17, 'Paolo', 'Marco', '14 rue du Caire', '14320', 'Fontenay Le Marmion', '', 'FRA', 0),
(18, 'Map', 'Joanna', '120 boulevard Voltaire', '75012', 'Paris', '', 'FRA', 0),
(19, 'Kound', 'Fatoumata', '4 Place Carr', '14190', 'Urville', '', 'FRA', 0),
(20, 'Derissam', 'Bachir', '1 rue des Indes', '14190', 'Urville', '', 'FRA', 0),
(21, 'Villechalane', 'Louis', '8 rue des Charmes', '14680', 'Bretteville Sur Laize', '', 'FRA', 0),
(22, 'Andre', 'David', '1 rue Petit', '14220', 'Boulon', '', 'FRA', 0),
(23, 'Bedos', 'Christian', '1 rue Peranud', '14320', 'Fontenay Le Marmion', '', 'FRA', 0),
(24, 'Tusseau', 'Louis', '22 rue des Ternes', '14680', 'Bretteville Sur Laize', '', 'FRA', 0),
(25, 'Bentot', 'Pascal', '11 allée des Cerises', '14220', 'Boulon', '', 'FRA', 0),
(26, 'Bioret', 'Luc', '1 Avenue gambetta', '14320', 'Fontenay Le Marmion', '', 'FRA', 0),
(27, 'Bunisset', 'Francis', '10 rue des Perles', '14220', 'Espins', '', 'FRA', 0),
(28, 'Bunisset', 'Denise', '23 rue Manin', '14320', 'Saint Martin de Fontenay', '', 'FRA', 0),
(29, 'Cacheux', 'Bernard', '114 rue Blanche', '14320', 'Fontenay Le Marmion', '', 'FRA', 0),
(30, 'Cadic', 'Eric', '123 avenue de la République', '14680', 'Bretteville Sur Laize', '', 'FRA', 0),
(31, 'Charoze', 'Catherine', '100 rue Petit', '14220', 'Boulon', '', 'FRA', 0),
(32, 'Clepkens', 'Christophe', '12 allée des Anges', '14680', 'Bretteville Sur Laize', '', 'FRA', 0),
(33, 'Cottin', 'Vincenne', '36 rue Des Roches', '14220', 'Boulon', '', 'FRA', 0),
(34, 'Daburon', 'François', '13 rue de Chanzy', '14220', 'Mutrécy', '', 'FRA', 0),
(35, 'De', 'Philippe', '13 rue Barthes', '14320', 'Fontenay Le Marmion', '', 'FRA', 0),
(36, 'Debelle', 'Michel', '181 avenue Barbusse', '14220', 'Espins', '', 'FRA', 0),
(37, 'Debelle', 'Jeanne', '134 allée des Joncs', '14320', 'Saint Martin de Fontenay', '', 'FRA', 0),
(38, 'Debroise', 'Michel', '2 Bld Jourdain', '14680', 'Bretteville Sur Laize', '', 'FRA', 0),
(39, 'Desmarquest', 'Nathalie', '14 Place d Arc', '14220', 'Boulon', '', 'FRA', 0),
(40, 'Desnost', 'Pierre', '16 avenue des Cèdres', '14220', 'Mutrécy', '', 'FRA', 0),
(41, 'Dudouit', 'Frédéric', '18 rue de l église', '14320', 'Fontenay Le Marmion', '', 'FRA', 0),
(42, 'Duncombe', 'Claude', '19 rue de la tour', '14680', 'Bretteville Sur Laize', '', 'FRA', 0),
(43, 'Enault-Pascreau', 'Céline', '25 place de la gare', '14680', 'Bretteville Sur Laize', '', 'FRA', 0),
(44, 'Eynde', 'Valérie', '3 Grand Place', '14220', 'Mutrécy', '', 'FRA', 0),
(45, 'Finck', 'Jacques', '10 avenue du Prado', '14320', 'Fontenay Le Marmion', '', 'FRA', 0),
(46, 'Frémont', 'Fernande', '4 route de la mer', '14220', 'Espins', '', 'FRA', 0),
(47, 'Gest', 'Alain', '30 avenue des terres', '14320', 'Saint Martin de Fontenay', '', 'FRA', NULL),
(56, 'Duprez', 'Valentine', '35 route de BÃ©neauville', '14860', 'BrÃ©ville-les-monts', NULL, 'FRA', NULL),
(100, 'NoÃ©', 'DUBOSQ', '5410 le val', '14200', 'hÃ©rouville', 'noe.duboisq.allende@gmail.com', 'BDI', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `clientcategvente`
--

DROP TABLE IF EXISTS `clientcategvente`;
CREATE TABLE IF NOT EXISTS `clientcategvente` (
  `codeClient` int(11) NOT NULL,
  `codeCategVente` varchar(5) NOT NULL,
  PRIMARY KEY (`codeClient`,`codeCategVente`),
  KEY `FK_cliCat_Categ` (`codeCategVente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `clientcategvente`
--

INSERT INTO `clientcategvente` (`codeClient`, `codeCategVente`) VALUES
(6, 'AUT'),
(1, 'ELVG'),
(56, 'ELVG'),
(100, 'ELVG'),
(1, 'ETE'),
(3, 'ETE'),
(6, 'ETE'),
(7, 'ETE'),
(16, 'ETE'),
(56, 'ETE');

-- --------------------------------------------------------

--
-- Structure de la table `courriel`
--

DROP TABLE IF EXISTS `courriel`;
CREATE TABLE IF NOT EXISTS `courriel` (
  `id` int(3) NOT NULL,
  `dates` date DEFAULT NULL,
  `objet` varchar(50) DEFAULT NULL,
  `corps` varchar(140) DEFAULT NULL,
  `idVente` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_VENTE_COURRIEL` (`idVente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `courriel`
--

INSERT INTO `courriel` (`id`, `dates`, `objet`, `corps`, `idVente`) VALUES
(1, '2020-09-10', 'Saison 2021', 'La saison 2021 débutera le 15 juin à Deauville', 210817),
(2, '2020-09-24', 'Saison 2021', 'La reprise de la saison 2021 sera reporté au 3 Juillet 2021 à Deauville', 210817);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `ville` varchar(50) DEFAULT NULL,
  `nbBoxes` int(3) DEFAULT NULL,
  `commentaire` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`id`, `ville`, `nbBoxes`, `commentaire`) VALUES
(1, 'Deauville', 15, 'Grand boxe'),
(2, 'St CLoud', 8, 'Boxe de taille moyenne'),
(3, 'Bordeaux', 8, 'Grand Boxe'),
(4, 'Strasbourg', 4, 'Boxe de taille moyenne '),
(5, 'Caen', 12, 'Boxe de taille moyenne'),
(6, 'Brest', 6, 'Grand boxe');

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

DROP TABLE IF EXISTS `lot`;
CREATE TABLE IF NOT EXISTS `lot` (
  `id` int(5) NOT NULL,
  `prixDepart` varchar(10) NOT NULL,
  `idCheval` int(5) NOT NULL,
  `idVente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCheval` (`idCheval`),
  KEY `idVente` (`idVente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lot`
--

INSERT INTO `lot` (`id`, `prixDepart`, `idCheval`, `idVente`) VALUES
(1, '10 000', 1, 210717),
(2, '15000', 3, 1321567),
(3, '9500', 5, 1321567),
(4, '12500', 1, 1321567);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `code` varchar(3) NOT NULL,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`code`, `nom`) VALUES
('AFG', 'Afghanistan'),
('AGO', 'Angola'),
('ALA', 'Îles Åland'),
('ALB', 'Albanie'),
('ALL', 'Allemagne'),
('AND', 'Andorre'),
('ARG', 'Argentine'),
('ARM', 'Arménie'),
('ASM', 'Samoa Américaines'),
('ATA', 'Antarctique'),
('ATG', 'Antigua-et-Barbuda'),
('AUS', 'Australie'),
('AUT', 'Autriche'),
('AZE', 'Azerbaïdjan'),
('BDI', 'Burundi'),
('BEL', 'Belgique'),
('BEN', 'Bénin'),
('BGD', 'Bangladesh'),
('BGR', 'Bulgarie'),
('BHR', 'Bahreïn'),
('BHS', 'Bahamas'),
('BIH', 'Bosnie-Herzégovine'),
('BLR', 'Bélarus'),
('BLZ', 'Belize'),
('BMU', 'Bermudes'),
('BOL', 'Bolivie'),
('BRA', 'Brésil'),
('BRB', 'Barbade'),
('BRN', 'Brunéi Darussalam'),
('BTN', 'Bhoutan'),
('BVT', 'Île Bouvet'),
('BWA', 'Botswana'),
('CAF', 'République Centrafricaine'),
('CAN', 'Canada'),
('CCK', 'Îles Cocos (Keeling)'),
('CHL', 'Chili'),
('CHN', 'Chine'),
('CMR', 'Cameroun'),
('COD', 'République Démocratique du Con'),
('COG', 'République du Congo'),
('COK', 'Îles Cook'),
('COL', 'Colombie'),
('COM', 'Comores'),
('CPV', 'Cap-vert'),
('CRI', 'Costa Rica'),
('CUB', 'Cuba'),
('CXR', 'Île Christmas'),
('CYM', 'Îles Caïmanes'),
('CYP', 'Chypre'),
('CZE', 'République Tchèque'),
('DMA', 'Dominique'),
('DNK', 'Danemark'),
('DOM', 'République Dominicaine'),
('DZA', 'Algérie'),
('ECU', 'Équateur'),
('ENG', 'Angleterre'),
('ERI', 'Érythrée'),
('ESP', 'Espagne'),
('EST', 'Estonie'),
('ETH', 'Éthiopie'),
('FIN', 'Finlande'),
('FJI', 'Fidji'),
('FLK', 'Îles (malvinas) Falkland'),
('FRA', 'France'),
('FRO', 'Îles Féroé'),
('GNQ', 'Guinée Équatoriale'),
('HRV', 'Croatie'),
('IOT', 'Territoire Britannique de l\'Oc'),
('IRL', 'Irlande'),
('ITA', 'Italie'),
('KHM', 'Cambodge'),
('LKA', 'Sri Lanka'),
('MMR', 'Myanmar'),
('MYT', 'Mayotte'),
('POR', 'Portugal'),
('SGS', 'Géorgie du Sud et les Îles San'),
('SLB', 'Îles Salomon'),
('SLV', 'El Salvador'),
('TCD', 'Tchad'),
('TWN', 'Taïwan'),
('USA', 'Etats-Unis'),
('VGB', 'Îles Vierges Britanniques');

-- --------------------------------------------------------

--
-- Structure de la table `piecejoint`
--

DROP TABLE IF EXISTS `piecejoint`;
CREATE TABLE IF NOT EXISTS `piecejoint` (
  `id` int(3) NOT NULL,
  `chemin` varchar(140) DEFAULT NULL,
  `description` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `piecejoint`
--

INSERT INTO `piecejoint` (`id`, `chemin`, `description`) VALUES
(1, 'C:/Utilisateur/Image/vente_2021', 'Brochure pour la saison 2021');

-- --------------------------------------------------------

--
-- Structure de la table `typecheval`
--

DROP TABLE IF EXISTS `typecheval`;
CREATE TABLE IF NOT EXISTS `typecheval` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typecheval`
--

INSERT INTO `typecheval` (`id`, `libelle`, `description`) VALUES
(1, 'pur-sang anglais', 'Il s’agit sans aucun doute de l’une des races de chevaux les plus connues et les plus répandues au monde. En effet, sa renommée s’est faite sur les hippodromes. Actuellement, on le retrouve aussi beaucoup en CSO, concours complet et même en équitation western, surtout dans les courses de barrel.'),
(2, 'yearling', 'Yearling est un anglicisme désignant un cheval pur-sang anglais, descendant du pur sang arabe, ou plus précisément un poulain, qui se trouve dans sa seconde année. '),
(3, 'pur sang arabe', 'Avec une morphologie facilement reconnaissable, il est considéré comme un améliorateur de races de chevaux. Originaire du Moyen-Orient, il s’agit d’une race de légende que l’on surnomme « roi du désert ». De plus, il s’agit d’un cheval résistant et rapide, qu’on peut  retrouver principalement en endurance, show et randonnées, mais il est très polyvalent et apprécié des cavaliers. On ne se lasse pas de l’admirer !'),
(4, 'quarter horse', 'C’est la race de chevaux la plus populaire aux États-Unis. C’est également le plus gros registre de race au monde ! Effectivement, il excelle en vitesse sur de courtes distances, plus précisément sur un quart de mile, soit environ 400 mètres, c’est de là qu’il tient son nom. Souvent associé à la discipline western, la race tend à se populariser dans d’autres disciplines où il sait également être performant.'),
(5, 'pur race espagnol', 'Aussi appelé Andalou, le PRE se démarque principalement par son bon caractère et ses allures. Facilement identifiable avec sa robe grise, son encolure mastoc et sa crinière qui en fait rager plus d’un, on le retrouve très souvent en dressage et en haute école de dressage. Par ailleurs, il est aussi particulièrement présent dans des spectacles ou au cinéma comme son voisin le lusitanien. Pour résumer, son élégance séduit beaucoup de cavaliers !'),
(28, 'Pure sang Mexicain', 'C\'est mericano'),
(31, 'tamere', NULL),
(32, 'chauve', NULL),
(33, 'chauvin', 'jngytlkgkrnb,rffr');

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

DROP TABLE IF EXISTS `vendeur`;
CREATE TABLE IF NOT EXISTS `vendeur` (
  `idClient` int(10) NOT NULL,
  `idCheval` int(5) NOT NULL,
  PRIMARY KEY (`idClient`,`idCheval`),
  KEY `idCheval` (`idCheval`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vendeur`
--

INSERT INTO `vendeur` (`idClient`, `idCheval`) VALUES
(8, 1),
(15, 2),
(26, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  `dateDebut` date NOT NULL,
  `codeCategVente` varchar(5) NOT NULL,
  `idLieu` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codeCategVente` (`codeCategVente`),
  KEY `idLieu` (`idLieu`)
) ENGINE=InnoDB AUTO_INCREMENT=1321570 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`id`, `nom`, `dateDebut`, `codeCategVente`, `idLieu`) VALUES
(30917, 'Garibaldi Princess', '2017-03-09', 'ELVG', 1),
(210717, 'Rapsberry Sailing', '2017-07-17', 'ETE', 1),
(210817, 'Jelly Bay', '2017-08-17', 'ETE', 2),
(495360, 'La Prairie', '2020-12-09', 'ELVG', 4),
(1321567, 'Rombaldi Master', '2021-02-17', 'ELVG', 3),
(1321568, 'Vente de Noël', '2020-12-23', 'ELVG', 4),
(1321569, 'Sweet Spring', '2021-03-16', 'ELVG', 5);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `affectation`
--
ALTER TABLE `affectation`
  ADD CONSTRAINT `affectation_ibfk_1` FOREIGN KEY (`idCourriel`) REFERENCES `courriel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `affectation_ibfk_2` FOREIGN KEY (`idPieceJoint`) REFERENCES `piecejoint` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `cheval`
--
ALTER TABLE `cheval`
  ADD CONSTRAINT `cheval_ibfk_1` FOREIGN KEY (`idTypeCheval`) REFERENCES `typecheval` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cheval_ibfk_2` FOREIGN KEY (`idClient`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cheval_ibfk_3` FOREIGN KEY (`pere`) REFERENCES `cheval` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cheval_ibfk_4` FOREIGN KEY (`mere`) REFERENCES `cheval` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_cli_pays` FOREIGN KEY (`codePays`) REFERENCES `pays` (`code`) ON DELETE CASCADE;

--
-- Contraintes pour la table `clientcategvente`
--
ALTER TABLE `clientcategvente`
  ADD CONSTRAINT `FK_cliCat_Categ` FOREIGN KEY (`codeCategVente`) REFERENCES `categvente` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_cliCat_client` FOREIGN KEY (`codeClient`) REFERENCES `client` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `courriel`
--
ALTER TABLE `courriel`
  ADD CONSTRAINT `FK_VENTE_COURRIEL` FOREIGN KEY (`idVente`) REFERENCES `vente` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `lot_ibfk_2` FOREIGN KEY (`idVente`) REFERENCES `vente` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lot_ibfk_3` FOREIGN KEY (`idCheval`) REFERENCES `cheval` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD CONSTRAINT `vendeur_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendeur_ibfk_2` FOREIGN KEY (`idCheval`) REFERENCES `cheval` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `FK_Ven_Categ` FOREIGN KEY (`codeCategVente`) REFERENCES `categvente` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`idLieu`) REFERENCES `lieu` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
