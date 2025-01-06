-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el7.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 01, 2024 at 05:00 PM
-- Server version: 8.0.40
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `syed0955`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`syed0955`@`%` PROCEDURE `PokemonLeagueQualifiers` (IN `Trainer` SMALLINT)  READS SQL DATA COMMENT 'Returns Trainers who qualify to take on the Pokemon League; requirement is having 8 badges' BEGIN
  SELECT * FROM Trainer
    WHERE TrainerBadges = 8
    AND TrainerId = Trainer;
END$$

--
-- Functions
--
CREATE DEFINER=`syed0955`@`%` FUNCTION `NewPokemonTrainer` (`NewTrainerId` INT, `NewTrainerQuote` LONGTEXT) RETURNS INT MODIFIES SQL DATA BEGIN
  INSERT INTO Trainer (`TrainerId`, TrainerQuote) VALUES (`NewTrainerId`, NewTrainerQuote);
  RETURN LAST_INSERT_ID();
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Moves`
--

CREATE TABLE `Moves` (
  `MoveId` int NOT NULL,
  `MoveName` varchar(20) NOT NULL,
  `MoveTypeId` int NOT NULL,
  `MoveType` varchar(10) NOT NULL,
  `MovePower` smallint NOT NULL,
  `MoveAccuracy` tinyint NOT NULL,
  `MovePowerPoints` tinyint NOT NULL,
  `MoveDesc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contains information about Pokemon Moves';

--
-- Dumping data for table `Moves`
--

INSERT INTO `Moves` (`MoveId`, `MoveName`, `MoveTypeId`, `MoveType`, `MovePower`, `MoveAccuracy`, `MovePowerPoints`, `MoveDesc`) VALUES
(2, 'Karate Chop', 7, 'Physical', 50, 100, 25, 'The foe is attacked with a sharp chop. It has a high critical-hit ratio.'),
(3, 'Double Slap', 1, 'Physical', 15, 100, 10, 'The foe is slapped repeatedly, back and forth, two to five times.'),
(10, 'Scratch', 1, 'Physical', 35, 100, 40, 'Hard, pointed, and sharp claws rake the foe.'),
(16, 'Gust', 10, 'Special', 35, 100, 40, 'Strikes the foe with a gust of wind whipped up by wings.'),
(17, 'Wing Attack', 10, 'Physical', 60, 100, 35, 'The foe is struck with large, imposing wings spread wide.'),
(18, 'Whirlwind', 1, 'Status', 0, 0, 20, 'The foe is made to switch out with an ally. In the wild, the battle ends.'),
(22, 'Vine Whip', 5, 'Physical', 45, 100, 25, 'The foe is struck with slender, whiplike vines.'),
(28, 'Sand-Attack', 9, 'Status', 0, 100, 15, 'A lot of sand is hurled in the foe\'s face, reducing its accuracy.'),
(31, 'Fury Attack', 1, 'Physical', 15, 85, 20, 'The foe is jabbed repeatedly with a horn or beak two to five times.'),
(33, 'Tackle', 1, 'Physical', 35, 100, 40, 'A physical attack in which the user charges, full body, into the foe.'),
(39, 'Tail Whip', 1, 'Status', 0, 100, 30, 'The user wags its tail cutely, making the foe lower its Defense stat.'),
(40, 'Poison Sting', 8, 'Physical', 15, 100, 35, 'The foe is stabbed with a toxic barb, etc. It may poison the foe.'),
(41, 'Twineedle', 12, 'Physical', 25, 100, 20, 'The foe is stabbed twice with foreleg stingers. It may poison the foe.'),
(42, 'Pin Missile', 12, 'Physical', 25, 95, 20, 'Sharp pins are shot at the foe and hit two to five times at once.'),
(44, 'Bite', 16, 'Physical', 60, 25, 100, 'The user bites with vicious fangs. It may make the foe flinch.'),
(45, 'Growl', 1, 'Status', 0, 100, 40, 'The user growls in a cute way, making the foe lower its Attack stat.'),
(48, 'Supersonic', 1, 'Status', 0, 55, 20, 'The user generates odd sound waves. It may confuse the foe.'),
(52, 'Ember', 2, 'Special', 40, 100, 25, 'The foe is attacked with small flames. The foe may suffer a burn.'),
(53, 'Flamethrower', 2, 'Special', 90, 100, 15, 'The foe is scorched with intense flames. The foe may suffer a burn.'),
(55, 'Water Gun', 3, 'Special', 40, 100, 25, 'The foe is struck with a lot of water expelled forcibly from the mouth.'),
(56, 'Hydro Pump', 3, 'Special', 110, 80, 5, 'A high volume of water is blasted at the foe under great pressure.'),
(58, 'Ice Beam', 6, 'Special', 90, 100, 10, 'The foe is struck with an icy beam. It may freeze the foe solid.'),
(60, 'Psybeam', 11, 'Special', 65, 100, 20, 'A peculiar ray is shot at the foe. It may leave the foe confused.'),
(65, 'Drill Peck', 10, 'Physical', 80, 100, 20, 'A corkscrewing attack with the sharp beak acting as a drill.'),
(73, 'Leech Seed', 5, 'Status', 0, 90, 10, 'A seed is planted on the foe to steal some HP for the user on every turn.'),
(74, 'Growth', 1, 'Status', 0, 100, 20, 'The user\'s body is forced to grow, raising the Sp. Atk stat.'),
(75, 'Razor Leaf', 5, 'Physical', 55, 95, 25, 'The foe is hit with a cutting leaf. It has a high critical-hit ratio.'),
(76, 'Solar Beam', 5, 'Special', 120, 100, 10, 'A 2-turn move that blasts the foe with absorbed energy in the 2nd turn.'),
(77, 'Poison Powder', 8, 'Status', 0, 75, 35, 'A cloud of toxic dust is scattered. It may poison the foe.'),
(78, 'Stun Spore', 5, 'Status', 0, 75, 30, 'Paralyzing dust is scattered wildly. It may paralyze the foe.'),
(79, 'Sleep Powder', 5, 'Status', 0, 75, 15, 'A sleep-inducing dust is scattered in high volume around a foe.'),
(81, 'String Shot', 12, 'Status', 0, 95, 40, 'The foe is bound with strings shot from the mouth to reduce its Speed.'),
(82, 'Dragon Rage', 15, 'Special', 40, 100, 10, 'The foe is hit with a shock wave that always inflicts 40-HP damage.'),
(83, 'Fire Spin', 2, 'Special', 35, 85, 15, 'The foe is trapped in an intense spiral of fire that rages two to five turns.'),
(85, 'Thunderbolt', 4, 'Special', 90, 100, 15, 'A strong electrical attack that may also leave the foe paralyzed.'),
(86, 'Thunder Wave', 4, 'Status', 0, 90, 20, 'A weak electric shock that is sure to cause paralysis if it hits.'),
(87, 'Thunder', 4, 'Special', 110, 70, 10, 'A brutal lightning attack that may also leave the foe paralyzed.'),
(89, 'Earthquake', 9, 'Physical', 100, 100, 10, 'An earthquake that strikes all Pokémon in battle excluding the user.'),
(94, 'Psychic', 11, 'Special', 90, 100, 10, 'A strong telekinetic attack. It may also lower the foe\'s Sp. Def stat.'),
(97, 'Agility', 11, 'Status', 0, 100, 30, 'The user relaxes and lightens its body to sharply boost its Speed.'),
(98, 'Quick Attack', 10, 'Physical', 40, 100, 30, 'An almost invisibly fast attack that is certain to strike first.'),
(99, 'Rage', 1, 'Physical', 20, 100, 20, 'An attack that becomes stronger each time the user is hit in battle.'),
(106, 'Harden', 1, 'Status', 0, 100, 30, 'The user stiffens all the muscles in its body to raise its Defense stat.'),
(108, 'Smokescreen', 1, 'Status', 0, 100, 20, 'An obscuring cloud of smoke or ink reduces the foe\'s accuracy.'),
(110, 'Withdraw', 3, 'Status', 0, 100, 40, 'The user withdraws its body in its hard shell, raising its Defense stat.'),
(114, 'Haze', 6, 'Status', 0, 100, 30, 'Eliminates all stat changes among all Pokémon engaged in battle.'),
(116, 'Focus Energy', 1, 'Status', 0, 100, 30, 'The user takes a deep breath and focuses to raise its critical-hit ratio.'),
(119, 'Mirror Move', 10, 'Status', 0, 100, 20, 'The user counters the move last used by the foe with the same move.'),
(130, 'Skull Bash', 1, 'Physical', 130, 100, 10, 'The user raises its Defense in the 1st turn, then attacks in the 2nd turn.'),
(145, 'Bubble', 3, 'Special', 40, 100, 30, 'A spray of bubbles hits the foe. It may lower the foe\'s Speed stat.'),
(157, 'Rock Slide', 13, 'Physical', 75, 90, 10, 'Large boulders are hurled at the foe. It may make the foe flinch.'),
(158, 'Hyper Fang', 1, 'Physical', 80, 90, 15, 'The foe is attacked with sharp fangs. It may make the foe flinch.'),
(162, 'Super Fang', 1, 'Physical', 0, 90, 10, 'The user attacks with sharp fangs and halves the foe\'s HP.'),
(163, 'Slash', 1, 'Physical', 70, 100, 20, 'The foe is slashed with claws, etc. It has a high critical-hit ratio.'),
(184, 'Scary Face', 1, 'Status', 0, 100, 10, 'Frightens the foe with a scary face to sharply reduce its Speed.'),
(219, 'Safeguard', 1, 'Status', 0, 100, 25, 'It protects the user\'s party from all status problems for five turns.'),
(228, 'Pursuit', 16, 'Physical', 40, 100, 20, 'An attack move that works especially well on a foe that is switching out.'),
(230, 'Sweet Scent', 1, 'Status', 0, 100, 20, 'Allures the foe to reduce evasiveness. It also attracts wild Pokémon.'),
(232, 'Metal Claw', 17, 'Physical', 50, 95, 35, 'The foe is attacked with steel claws. It may also raise the user\'s Attack.'),
(235, 'Synthesis', 5, 'Status', 0, 5, 100, 'Restores the user\'s HP. The amount of HP regained varies with the weather.'),
(240, 'Rain Dance', 3, 'Status', 0, 100, 5, 'A heavy rain falls for five turns, powering up Water- type moves.'),
(247, 'Shadow Ball', 14, 'Special', 80, 15, 100, 'A shadowy blob is hurled at the foe. May also lower the foe\'s Sp. Def.'),
(283, 'Endeavor', 1, 'Physical', 0, 100, 5, 'An attack move that cuts down the target\'s HP to equal the user\'s HP.'),
(297, 'Feather Dance', 10, 'Status', 0, 100, 15, 'The foe is covered with a mass of down that sharply cuts the Attack stat.'),
(318, 'Silver Wind', 12, 'Special', 60, 100, 5, 'The foe is attacked with a silver dust. It may raise all the user\'s stats.'),
(398, 'Poison Jab', 8, 'Physical', 80, 100, 20, 'The target is stabbed with a tentacle or arm steeped in poison. It may also poison the target.'),
(585, 'Moonblast', 18, 'Special', 95, 100, 15, 'Borrowing the power of the moon, the user attacks the target. This may also lower the target\'s Sp. Atk stat.');

-- --------------------------------------------------------

--
-- Table structure for table `Pokemon`
--

CREATE TABLE `Pokemon` (
  `PokemonId` int NOT NULL COMMENT 'Pokemon Id',
  `PokemonName` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Pokemon Name',
  `SpeciesName` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Pokemon Species',
  `Height(m)` decimal(10,1) NOT NULL COMMENT 'Height in Meters',
  `Weight(Kg)` decimal(10,1) NOT NULL COMMENT 'Weight in Kilograms',
  `GenderRatio` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Chance of being Male and Female',
  `Ability1` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'First Ability (Required)',
  `Ability2` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Second Ability (If any)',
  `HiddenAbility` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Hidden Ability (If any)',
  `EggGroup` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Egg Group (If any)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contains information about Pokemon';

--
-- Dumping data for table `Pokemon`
--

INSERT INTO `Pokemon` (`PokemonId`, `PokemonName`, `SpeciesName`, `Height(m)`, `Weight(Kg)`, `GenderRatio`, `Ability1`, `Ability2`, `HiddenAbility`, `EggGroup`) VALUES
(1, 'Bulbasaur', 'Seed Pokemon', 0.7, 6.9, '87.5% Male, 12.5% Female', 'Overgrow', NULL, 'Chlorophyll', 'Grass, Monster'),
(2, 'Ivysaur', 'Seed Pokemon', 1.0, 13.0, '87.5% Male, 12.5% Female', 'Overgrow', NULL, 'Chlorophyll', 'Grass, Monster'),
(3, 'Venusaur', 'Seed Pokemon', 2.0, 13.0, '87.5% Male, 12.5% Female', 'Overgrow', NULL, 'Chlorophyll', 'Grass, Monster'),
(4, 'Charmander', 'Lizard Pokemon', 0.6, 8.5, '87.5% Male, 12.5% Female', 'Blaze', NULL, 'Solar Power', 'Dragon, Monster'),
(5, 'Charmeleon', 'Flame Pokemon', 1.1, 19.0, '87.5% Male, 12.5% Female', 'Blaze', NULL, 'Solar Power', 'Dragon, Monster'),
(6, 'Charizard', 'Flame Pokemon', 1.7, 90.5, '87.5% Male, 12.5% Female', 'Blaze', NULL, 'Solar Power', 'Dragon, Monster'),
(7, 'Squirtle', 'Tiny Turtle Pokemon', 0.5, 9.0, '87.5% Male, 12.5% Female', 'Torrent', NULL, 'Rain Dish', 'Monster, Water 1'),
(8, 'Wartortle', 'Turtle Pokemon', 1.0, 22.5, '87.5% Male, 12.5% Female', 'Torrent', NULL, 'Rain Dish', 'Monster, Water 1'),
(9, 'Blastoise', 'Shellfish Pokemon', 1.6, 85.5, '87.5% Male, 12.5% Female', 'Torrent', NULL, 'Rain Dish', 'Monster, Water 1'),
(10, 'Caterpie', 'Worm Pokemon', 0.3, 2.9, '50% Male, 50% Female', 'Shield Dust', NULL, 'Run Away', 'Bug'),
(11, 'Metapod', 'Cocoon Pokemon', 0.7, 9.9, '50% Male, 50% Female', 'Shed Skin', NULL, 'NULL', 'Bug'),
(12, 'Butterfree', 'Butterfly Pokemon', 1.1, 32.0, '50% Male, 50% Female', 'Compound Eyes', NULL, 'Tinted Lens', 'Bug'),
(13, 'Weedle', 'Hairy Bug Pokemon', 0.3, 3.2, '50% Male, 50% Female', 'Shield Dust', NULL, 'Run Away', 'Bug'),
(14, 'Kakuna', 'Cocoon Pokemon', 0.6, 10.0, '50% Male, 50% Female', 'Shed Skin', NULL, NULL, 'Bug'),
(15, 'Beedrill', 'Poison Bee Pokemon', 1.0, 29.5, '50% Male, 50% Female', 'Swarm', NULL, 'Sniper', 'Bug'),
(16, 'Pidgey', 'Tiny Bird Pokemon', 0.3, 1.8, '50% Male, 50% Female', 'Keen Eye', 'Tangled Feet', 'Big Pecks', 'Flying'),
(17, 'Pidgeotto', 'Bird Pokemon', 1.1, 30.0, '50% Male, 50% Female', 'Keen Eye', 'Tangled Feet', 'Big Pecks', 'Flying'),
(18, 'Pidgeot', 'Bird Pokemon', 1.5, 39.5, '50% Male, 50% Female', 'Keen Eye', 'Tangled Feet', 'Big Pecks', 'Flying'),
(19, 'Rattata', 'Mouse Pokemon', 0.3, 3.5, '50% Male, 50% Female', 'Run Away', 'Guts', 'Hustle', 'Field'),
(20, 'Raticate', 'Mouse Pokemon', 0.7, 18.5, '50% Male, 50% Female', 'Run Away', 'Guts', 'Hustle', 'Field'),
(21, 'Spearow', 'Tiny Bird Pokemon', 0.3, 2.0, '50% Male, 50% Female', 'Keen Eye', NULL, 'Sniper', 'Flying'),
(22, 'Fearow', 'Beak Pokemon', 1.2, 38.0, '50% Male, 50% Female', 'Keen Eye', NULL, 'Sniper', 'Flying'),
(23, 'Ekans', 'Snake Pokemon', 2.0, 6.9, '50% Male, 50% Female', 'Intimidate', 'Shed Skin', 'Unnerve', 'Dragon, Field'),
(24, 'Arbok', 'Cobra Pokemon', 3.5, 65.0, '50% Male, 50% Female', 'Intimidate', 'Shed Skin', 'Unnerve', 'Dragon, Field'),
(25, 'Pikachu', 'Mouse Pokemon', 0.4, 6.0, '50% Male, 50% Female', 'Static', NULL, 'Lightning Rod', 'Fairy, Field'),
(26, 'Raichu', 'Mouse Pokemon', 0.8, 30.0, '50% Male, 50% Female', 'Static', NULL, 'Lightning Rod', 'Fairy, Field'),
(27, 'Sandshrew', 'Mouse Pokemon', 0.6, 12.0, '50% Male, 50% Female', 'Sand Veil', NULL, 'Sand Rush', 'Field'),
(28, 'Sandslash', 'Mouse Pokemon', 1.0, 29.5, '50% Male, 50% Female', 'Sand Veil', NULL, 'Sand Rush', 'Field'),
(29, 'Nidoran-F', 'Poison Pin Pokemon', 0.4, 7.0, '0% Male, 100% Female', 'Poison Point', 'Rivalry', 'Hustle', 'Field, Monster'),
(30, 'Nidorina', 'Poison Pin Pokemon', 0.8, 20.0, '0% Male, 100% Female', 'Poison Point', 'Rivalry', 'Hustle', 'Undiscovered'),
(31, 'Nidoqueen', 'Drill Pokemon', 1.3, 60.0, '0% Male, 100% Female', 'Poison Point', 'Rivalry', 'Sheer Force', 'Undiscovered'),
(32, 'Nidoran-M', 'Poison Pin Pokemon', 0.5, 9.0, '100% Male, 0% Female', 'Poison Point', 'Rivalry', 'Hustle', 'Field, Monster'),
(33, 'Nidorino', 'Poison Pin Pokemon', 0.9, 19.5, '100% Male, 0% Female', 'Poison Point', 'Rivalry', 'Hustle', 'Field, Monster'),
(34, 'Nidoking', 'Drill Pokemon', 1.4, 62.0, '100% Male, 0% Female', 'Poison Point', 'Rivalry', 'Sheer Force', 'Field, Monster'),
(35, 'Clefairy', 'Fairy Pokemon', 0.6, 7.5, '25% Male, 75% Female', 'Cute Charm', 'Magic Guard', 'Friend Guard', 'Fairy'),
(36, 'Clefable', 'Fairy Pokemon', 1.3, 40.0, '25% Male, 75% Female', 'Cute Charm', 'Magic Guard', 'Unaware', 'Fairy'),
(37, 'Vulpix', 'Fox Pokemon', 0.6, 9.9, '25% Male, 75% Female', 'Flash Fire', NULL, 'Drought', 'Field'),
(38, 'Ninetales', 'Fox Pokemon', 1.1, 19.9, '25% Male, 75% Female', 'Flash Fire', NULL, 'Drought', 'Field'),
(39, 'Jigglypuff', 'Balloon Pokemon', 0.5, 5.5, '25% Male, 75% Female', 'Cute Charm', 'Competitive', 'Friend Guard', 'Fairy'),
(40, 'Wigglytuff', 'Balloon Pokemon', 1.0, 12.0, '25% Male, 75% Female', 'Cute Charm', 'Competitive', 'Frisk', 'Fairy'),
(41, 'Zubat', 'Bat Pokemon', 0.8, 7.5, '50% Male, 50% Female', 'Inner Focus', NULL, 'Infiltrator', 'Flying'),
(42, 'Golbat', 'Bat Pokemon', 1.6, 55.0, '50% Male, 50% Female', 'Inner Focus', NULL, 'Infiltrator', 'Flying'),
(43, 'Oddish', 'Weed Pokemon', 0.5, 5.4, '50% Male, 50% Female', 'Chlorophyll', NULL, 'Run Away', 'Grass'),
(44, 'Gloom', 'Weed Pokemon', 0.8, 8.6, '50% Male, 50% Female', 'Chlorophyll', NULL, 'Stench', 'Grass'),
(45, 'Vileplume', 'Flower Pokemon', 1.2, 18.6, '50% Male, 50% Female', 'Chlorophyll', NULL, 'Effect Spore', 'Grass'),
(46, 'Paras', 'Mushroom Pokemon', 0.3, 5.4, '50% Male, 50% Female', 'Effect Spore', 'Dry Skin', 'Damp', 'Bug, Grass'),
(47, 'Parasect', 'Mushroom Pokemon', 1.0, 29.5, '50% Male, 50% Female', 'Effect Spore', 'Dry Skin', 'Damp', 'Bug, Grass'),
(48, 'Venonat', 'Insect Pokemon', 1.0, 30.0, '50% Male, 50% Female', 'Compound Eyes', 'Tinted Lens', 'Run Away', 'Bug'),
(49, 'Venomoth', 'Poison Moth Pokemon', 1.5, 12.5, '50% Male, 50% Female', 'Shield Dust', 'Tinted Lens', 'Wonder Skin', 'Bug'),
(50, 'Diglett', 'Mole Pokemon', 0.2, 0.8, '50% Male, 50% Female', 'Sand Veil', 'Arena Trap', 'Sand Force', 'Field'),
(51, 'Dugtrio', 'Mole Pokemon', 0.7, 33.3, '50% Male, 50% Female', 'Sand Veil', 'Arena Trap', 'Sand Force', 'Field');

-- --------------------------------------------------------

--
-- Table structure for table `PokemonSignatureMoves`
--

CREATE TABLE `PokemonSignatureMoves` (
  `PokemonID` int NOT NULL COMMENT 'Id of Pokemon',
  `SignatureMoveId` int NOT NULL COMMENT 'Move Id of Strongest Move',
  `LevelLearned` int NOT NULL COMMENT 'What level they learn the attack.',
  `MaxLevelDistance` int NOT NULL COMMENT 'Levels away from the max possible level; Maximum Level is Level 100.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lookup Table for Pokemon and their Strongest Move.';

--
-- Dumping data for table `PokemonSignatureMoves`
--

INSERT INTO `PokemonSignatureMoves` (`PokemonID`, `SignatureMoveId`, `LevelLearned`, `MaxLevelDistance`) VALUES
(1, 76, 46, 54),
(2, 76, 56, 44),
(3, 76, 65, 35),
(4, 83, 49, 51),
(5, 83, 55, 45),
(6, 83, 64, 36),
(7, 56, 47, 53),
(8, 56, 53, 47),
(9, 56, 68, 32),
(10, 33, 1, 99),
(11, 106, 1, 99),
(12, 318, 47, 53),
(13, 40, 1, 99),
(14, 106, 7, 93),
(15, 283, 45, 55),
(16, 119, 47, 53),
(17, 119, 52, 48),
(18, 119, 62, 38),
(19, 283, 41, 59),
(20, 283, 50, 50),
(21, 97, 43, 57),
(22, 97, 47, 53),
(23, 114, 44, 56),
(24, 114, 56, 44),
(25, 87, 41, 59),
(26, 87, 1, 99),
(27, 163, 23, 77),
(28, 163, 24, 76),
(29, 44, 20, 80),
(30, 44, 22, 78),
(31, 10, 1, 99),
(32, 31, 30, 70),
(33, 31, 34, 66),
(34, 40, 1, 99),
(35, 585, 46, 54),
(36, 3, 1, 99),
(37, 83, 41, 59),
(38, 83, 45, 55),
(39, 3, 24, 76),
(40, 3, 1, 99),
(41, 114, 46, 54),
(42, 114, 56, 44),
(43, 79, 18, 82),
(44, 79, 18, 82),
(45, 78, 1, 99),
(46, 163, 31, 69),
(47, 163, 35, 65),
(48, 94, 41, 59),
(49, 94, 52, 48),
(50, 163, 33, 67),
(51, 163, 38, 62);

-- --------------------------------------------------------

--
-- Table structure for table `PokemonTyping`
--

CREATE TABLE `PokemonTyping` (
  `Pokemon_Id` int NOT NULL COMMENT 'Pokemom_Id to join with Pokemon Table',
  `TypeId1` int NOT NULL COMMENT 'Id of first type',
  `TypeId2` int NOT NULL COMMENT 'If 19, there is no Second Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lookup Table for Pokemon and their types';

--
-- Dumping data for table `PokemonTyping`
--

INSERT INTO `PokemonTyping` (`Pokemon_Id`, `TypeId1`, `TypeId2`) VALUES
(16, 1, 10),
(17, 1, 10),
(18, 1, 10),
(19, 1, 19),
(20, 1, 19),
(21, 1, 10),
(22, 1, 10),
(39, 1, 18),
(40, 1, 18),
(4, 2, 19),
(5, 2, 19),
(6, 2, 10),
(37, 2, 19),
(38, 2, 19),
(7, 3, 19),
(8, 3, 19),
(9, 3, 19),
(25, 4, 19),
(26, 4, 19),
(1, 5, 8),
(2, 5, 8),
(3, 5, 8),
(43, 5, 8),
(44, 5, 8),
(45, 5, 8),
(23, 8, 19),
(24, 8, 19),
(29, 8, 19),
(30, 8, 19),
(31, 8, 9),
(32, 8, 19),
(33, 8, 19),
(34, 8, 9),
(41, 8, 10),
(42, 8, 10),
(27, 9, 19),
(28, 9, 19),
(50, 9, 19),
(51, 9, 19),
(10, 12, 19),
(11, 12, 19),
(12, 12, 10),
(13, 12, 8),
(14, 12, 8),
(15, 12, 8),
(46, 12, 5),
(47, 12, 5),
(48, 12, 8),
(49, 12, 8),
(35, 18, 19),
(36, 18, 19);

-- --------------------------------------------------------

--
-- Table structure for table `PrimaryTypes`
--

CREATE TABLE `PrimaryTypes` (
  `TypeId` int NOT NULL,
  `TypeName` varchar(8) NOT NULL,
  `NeutralTypes` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Inflicts 1x damage to these types',
  `SuperEffectiveTypes` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Inflicts 2x damage to these types',
  `TypeWeaknesses` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Receives 2x damage from these types',
  `IneffectiveTypes` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Inflicts 0.5 damage to these types',
  `Resistances` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Receives 0.5x damage from these types',
  `ImmuneTypes` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Inflicts 0 damage to these types'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contains information about the first type of a Pokemon';

--
-- Dumping data for table `PrimaryTypes`
--

INSERT INTO `PrimaryTypes` (`TypeId`, `TypeName`, `NeutralTypes`, `SuperEffectiveTypes`, `TypeWeaknesses`, `IneffectiveTypes`, `Resistances`, `ImmuneTypes`) VALUES
(1, 'Normal', 'Normal, Fire, Water, Electric, Grass, Ice, Fighting, Poison, Ground, Flying, Psychic, Bug, Dragon, Dark, Fairy', '', 'Fighting', 'Rock, Steel', '', 'Ghost'),
(2, 'Fire', 'Normal, Electric, Fighting, Poison, Ground, Flying, Psychic, Ghost, Dark, Fairy', 'Grass, Ice, Bug, Steel', 'Water, Ground, Rock', 'Fire, Water, Rock, Dragon', 'Fire, Grass, Ice, Bug, Steel, Fairy', NULL),
(3, 'Water', 'Normal, Electric, Ice, Fighting, Poison, Flying, Psychic, Bug, Ghost, Dark, Steel, Fairy', 'Fire, Ground, Rock', 'Electric, Grass', 'Water, Grass, Dragon', 'Fire, Water, Ice, Steel', NULL),
(4, 'Electric', 'Normal, Fire, Ice, Fighting, Poison, Psychic, Bug, Rock, Ghost, Dark, Steel, Fairy', 'Water, Flying', 'Ground', 'Electric, Grass, Dragon', 'Electric, Flying, Steel', 'Ground'),
(5, 'Grass', 'Normal, Electric, Ice, Fighting, Psychic, Ghost, Dark, Fairy', 'Water, Ground, Rock', 'Fire, Ice, Poison, Flying, Bug', 'Fire, Grass, Poison, Flying, Bug, Dragon, Steel', 'Water, Electric, Grass, Ground, ', NULL),
(6, 'Ice', 'Normal, Electric, Fighting, Poison, Psychic, Bug, Rock, Ghost, Dark, Fairy', 'Grass, Ground, Flying, Dragon, ', 'Fire, Fighting, Rock, Steel', 'Fire, Water, Ice, Steel', 'Ice', NULL),
(7, 'Fighting', 'Fire, Water, Electric, Grass, Fighting, Ground, Dragon', 'Normal, Ice, Rock, Dark, Steel', 'Flying, Psychic, Fairy', 'Poison, Flying, Psychic, Bug, Fairy', 'Bug, Rock, Fairy', 'Ghost'),
(8, 'Poison', 'Normal, Fire, Water, Electric, Ice, Fighting, Flying, Psychic, Bug, Dragon, Dark', 'Grass, Fairy', 'Ground, Psychic', 'Poison, Ground, Rock, Ghost', 'Grass, Fighting, Poison, Bug, Fairy', 'Steel'),
(9, 'Ground', 'Normal, Water, Ice, Fighting, Ground, Psychic, Ghost, Dragon, Dark, Fairy', 'Fire, Electric, Poison, Rock, Steel', 'Water, Grass, Ice', 'Grass, Bug', 'Poison, Rock', 'Flying'),
(10, 'Flying', 'Normal, Fire, Water, Ice, Poison, Ground, Flying, Psychic, Ghost, Dragon, Dark, Fairy', 'Grass, Fighting, Bug', 'Electric, Ice, Rock', 'Electric, Rock, Steel', 'Grass, Bug', NULL),
(11, 'Psychic', 'Normal, Fire, Water, Electric, Grass, Ice, Ground, Flying, Bug, Rock, Ghost, Dragon, Fairy', 'Fighting, Poison', 'Bug, Ghost, Dark', 'Psychic, Steel', 'Fighting, Psychic', 'Dark'),
(12, 'Bug', 'Normal, Water, Electric, Ice, Ground, Rock, Dragon', 'Grass, Psychic', 'Fire, Flying, Rock', 'Fire, Fighting, Poison, Flying, Ghost, Steel, Fairy', 'Grass, Fighting, Ground', NULL),
(13, 'Rock', 'Normal, Water, Electric, Grass, Poison, Psychic, Rock, Ghost, Dragon, Dark, Fairy', 'Fire, Ice, Flying, Bug', 'Water, Grass, Fighting, Ground, Steel', 'Fighting, Ground, Steel', 'Normal, Fire, Poison, Flying', NULL),
(14, 'Ghost', 'Fire, Water, Electric, Grass, Ice, Fighting, Poison, Ground, Flying, Bug, Rock, Dragon, Steel, Fairy', 'Psychic, Ghost', 'Ghost, Dark', 'Dark', 'Poison, Bug', 'Normal'),
(15, 'Dragon', 'Normal, Fire, Water, Electric, Grass, Ice, Fighting, Poison, Ground, Flying, Psychic, Bug, Rock, Ghost, Dark', 'Dragon', 'Ice, Dragon, Fairy', 'Steel', 'Fire, Water, Electric, Grass', NULL),
(16, 'Dark', 'Normal, Fire, Water, Electric, Grass, Ice, Poison, Ground, Flying, Bug, Rock, Dragon, Steel', 'Psychic, Ghost', 'Fighting, Bug, Fairy', 'Fighting, Dark, Fairy', 'Ghost, Dark', NULL),
(17, 'Steel', 'Normal, Grass, Fighting, Poison, Ground, Flying, Psychic, Bug, Ghost, Dragon, Dark', 'Ice, Rock, Fairy', 'Fire, Fighting, Ground', 'Fire, Water, Electric, Steel', 'Normal, Grass, Ice, Flying, Psychic, Bug, Rock, Dragon, Steel, Fairy', NULL),
(18, 'Fairy', 'Normal, Water, Electric, Grass, Ice, Ground, Flying, Psychic, Bug, Rock, Ghost, Fairy', 'Fighting, Dragon, Dark', 'Poison, Steel', 'Fire, Poison, Steel', 'Fighting, Bug, Dark', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SecondaryTypes`
--

CREATE TABLE `SecondaryTypes` (
  `Type2Id` int NOT NULL,
  `Type2Name` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NeutralTypes2` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Inflicts 1x damage to these types',
  `SuperEffectiveTypes2` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Inflicts 2x damage to these types',
  `TypeWeaknesses2` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Receives 2x damage from these types',
  `IneffectiveTypes2` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Inflicts 0.5 damage to these types',
  `Resistances2` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Receives 0.5x damage from these types',
  `ImmuneTypes2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Inflicts 0 damage to these types'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contains information about the second type of a Pokemon (If any)';

--
-- Dumping data for table `SecondaryTypes`
--

INSERT INTO `SecondaryTypes` (`Type2Id`, `Type2Name`, `NeutralTypes2`, `SuperEffectiveTypes2`, `TypeWeaknesses2`, `IneffectiveTypes2`, `Resistances2`, `ImmuneTypes2`) VALUES
(1, 'Normal', 'Normal, Fire, Water, Electric, Grass, Ice, Fighting, Poison, Ground, Flying, Psychic, Bug, Dragon, Dark, Fairy', '', 'Fighting', 'Rock, Steel', '', 'Ghost'),
(2, 'Fire', 'Normal, Electric, Fighting, Poison, Ground, Flying, Psychic, Ghost, Dark, Fairy', 'Grass, Ice, Bug, Steel', 'Water, Ground, Rock', 'Fire, Water, Rock, Dragon', 'Fire, Grass, Ice, Bug, Steel, Fairy', NULL),
(3, 'Water', 'Normal, Electric, Ice, Fighting, Poison, Flying, Psychic, Bug, Ghost, Dark, Steel, Fairy', 'Fire, Ground, Rock', 'Electric, Grass', 'Water, Grass, Dragon', 'Fire, Water, Ice, Steel', NULL),
(4, 'Electric', 'Normal, Fire, Ice, Fighting, Poison, Psychic, Bug, Rock, Ghost, Dark, Steel, Fairy', 'Water, Flying', 'Ground', 'Electric, Grass, Dragon', 'Electric, Flying, Steel', 'Ground'),
(5, 'Grass', 'Normal, Electric, Ice, Fighting, Psychic, Ghost, Dark, Fairy', 'Water, Ground, Rock', 'Fire, Ice, Poison, Flying, Bug', 'Fire, Grass, Poison, Flying, Bug, Dragon, Steel', 'Water, Electric, Grass, Ground, ', NULL),
(6, 'Ice', 'Normal, Electric, Fighting, Poison, Psychic, Bug, Rock, Ghost, Dark, Fairy', 'Grass, Ground, Flying, Dragon, ', 'Fire, Fighting, Rock, Steel', 'Fire, Water, Ice, Steel', 'Ice', NULL),
(7, 'Fighting', 'Fire, Water, Electric, Grass, Fighting, Ground, Dragon', 'Normal, Ice, Rock, Dark, Steel', 'Flying, Psychic, Fairy', 'Poison, Flying, Psychic, Bug, Fairy', 'Bug, Rock, Fairy', 'Ghost'),
(8, 'Poison', 'Normal, Fire, Water, Electric, Ice, Fighting, Flying, Psychic, Bug, Dragon, Dark', 'Grass, Fairy', 'Ground, Psychic', 'Poison, Ground, Rock, Ghost', 'Grass, Fighting, Poison, Bug, Fairy', 'Steel'),
(9, 'Ground', 'Normal, Water, Ice, Fighting, Ground, Psychic, Ghost, Dragon, Dark, Fairy', 'Fire, Electric, Poison, Rock, Steel', 'Water, Grass, Ice', 'Grass, Bug', 'Poison, Rock', 'Flying'),
(10, 'Flying', 'Normal, Fire, Water, Ice, Poison, Ground, Flying, Psychic, Ghost, Dragon, Dark, Fairy', 'Grass, Fighting, Bug', 'Electric, Ice, Rock', 'Electric, Rock, Steel', 'Grass, Bug', NULL),
(11, 'Psychic', 'Normal, Fire, Water, Electric, Grass, Ice, Ground, Flying, Bug, Rock, Ghost, Dragon, Fairy', 'Fighting, Poison', 'Bug, Ghost, Dark', 'Psychic, Steel', 'Fighting, Psychic', 'Dark'),
(12, 'Bug', 'Normal, Water, Electric, Ice, Ground, Rock, Dragon', 'Grass, Psychic', 'Fire, Flying, Rock', 'Fire, Fighting, Poison, Flying, Ghost, Steel, Fairy', 'Grass, Fighting, Ground', NULL),
(13, 'Rock', 'Normal, Water, Electric, Grass, Poison, Psychic, Rock, Ghost, Dragon, Dark, Fairy', 'Fire, Ice, Flying, Bug', 'Water, Grass, Fighting, Ground, Steel', 'Fighting, Ground, Steel', 'Normal, Fire, Poison, Flying', NULL),
(14, 'Ghost', 'Fire, Water, Electric, Grass, Ice, Fighting, Poison, Ground, Flying, Bug, Rock, Dragon, Steel, Fairy', 'Psychic, Ghost', 'Ghost, Dark', 'Dark', 'Poison, Bug', 'Normal'),
(15, 'Dragon', 'Normal, Fire, Water, Electric, Grass, Ice, Fighting, Poison, Ground, Flying, Psychic, Bug, Rock, Ghost, Dark', 'Dragon', 'Ice, Dragon, Fairy', 'Steel', 'Fire, Water, Electric, Grass', NULL),
(16, 'Dark', 'Normal, Fire, Water, Electric, Grass, Ice, Poison, Ground, Flying, Bug, Rock, Dragon, Steel', 'Psychic, Ghost', 'Fighting, Bug, Fairy', 'Fighting, Dark, Fairy', 'Ghost, Dark', NULL),
(17, 'Steel', 'Normal, Grass, Fighting, Poison, Ground, Flying, Psychic, Bug, Ghost, Dragon, Dark', 'Ice, Rock, Fairy', 'Fire, Fighting, Ground', 'Fire, Water, Electric, Steel', 'Normal, Grass, Ice, Flying, Psychic, Bug, Rock, Dragon, Steel, Fairy', NULL),
(18, 'Fairy', 'Normal, Water, Electric, Grass, Ice, Ground, Flying, Psychic, Bug, Rock, Ghost, Fairy', 'Fighting, Dragon, Dark', 'Poison, Steel', 'Fire, Poison, Steel', 'Fighting, Bug, Dark', NULL),
(19, '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Trainer`
--

CREATE TABLE `Trainer` (
  `TrainerId` smallint NOT NULL,
  `TrainerForename` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TrainerSurname` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TrainerClass` varchar(20) NOT NULL DEFAULT 'Pokemon Trainer',
  `FavoritePokemon` int NOT NULL DEFAULT '25' COMMENT 'Pokemon Id of Trainer''s Favorite Type',
  `TrainerMoney` decimal(6,2) NOT NULL DEFAULT '3000.00',
  `TrainerBadges` int NOT NULL DEFAULT '0',
  `AdventureStarted` date NOT NULL DEFAULT '2004-12-25',
  `CurrentTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TrainerQuote` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contains information about Pokemon Trainers.';

--
-- Dumping data for table `Trainer`
--

INSERT INTO `Trainer` (`TrainerId`, `TrainerForename`, `TrainerSurname`, `TrainerClass`, `FavoritePokemon`, `TrainerMoney`, `TrainerBadges`, `AdventureStarted`, `CurrentTime`, `TrainerQuote`) VALUES
(1, 'Red', NULL, 'Pokemon Master', 6, 9999.99, 8, '2014-07-01', '2024-12-01 17:00:47', 'I will be a Pokemon Master! That is my destiny!'),
(3, 'Joey', NULL, 'Youngster', 19, 0.00, 0, '2018-07-01', '2024-12-01 17:00:47', 'My Rattata is top percentage!'),
(4, 'Samuel', 'Oak', 'Pokemon Professor', 25, 9999.99, 0, '1964-03-11', '2024-12-01 17:00:47', 'Welcome to the world of Pokemon! My name is Oak. I am often referred to as the Pokemon Professor.'),
(6, 'Joshua', NULL, 'Assistant', 2, 500.00, 0, '1984-03-11', '2024-12-01 17:00:47', 'I am Professor Oak\'s assistant.'),
(7, 'Green', NULL, 'Pokemon Trainer', 3, 9999.99, 8, '2014-07-04', '2024-12-01 17:00:47', 'Tee-hee! The treasure will be mine!'),
(8, 'Keith', NULL, 'Youngster', 20, 150.00, 0, '2017-02-01', '2024-12-01 17:00:47', 'Raticate, Raticate, go!'),
(10, 'Blue', 'Oak', 'Pokemon Champion', 9, 9999.99, 8, '2014-07-01', '2024-12-01 17:00:47', 'When I was working on my Pokedex, I searched everywhere for the Pokemon! I specifically looked for those teams that could beat any Pokemon type! And now, I stand right here at the top of the Pokemon League! Do you know what that means? I\'ll tell you! It means I am the most powerful Trainer- in the world!'),
(11, 'Zuko', NULL, 'Pokemon Trainer', 4, 3000.00, 0, '2014-07-04', '2024-12-01 17:00:47', 'Don\'t think I\'m weak just because I\'m new!'),
(12, 'Don', NULL, 'Hiker', 27, 52.00, 0, '2000-02-01', '2024-12-01 17:00:47', 'I like hiking!'),
(13, 'Brock', NULL, 'Gym Leader', 41, 3000.00, 1, '2004-02-01', '2024-12-01 17:00:47', 'I may be a Gym Leader, but I hope to become a Pokemon Breeder.'),
(14, 'Mitch', NULL, 'Hiker', 28, 109.00, 1, '1990-12-01', '2024-12-01 17:00:47', 'I like hiking!'),
(15, 'Brock', NULL, 'Pokemon Breeder', 37, 3000.00, 0, '2004-02-01', '2024-12-01 17:00:47', 'It feels good to wear a different changes of clothes now that I\'m out of the gym.'),
(16, 'Dan', NULL, 'Hiker', 27, 312.00, 0, '2008-01-01', '2024-12-01 17:00:47', 'I don\'t like Hiking- I don\'t know why I became a Hiker.'),
(20, 'Toby', NULL, 'Bird Keeper', 18, 1000.00, 0, '2000-04-11', '2024-12-01 17:00:47', 'You just encountered Bird Keeper Toby. Defeat me and you\'ll be a Pokemon Master!'),
(21, 'Misty', NULL, 'Gym Leader', 7, 3000.00, 1, '2004-02-01', '2024-12-01 17:00:47', 'Pokemon is about both battles and beauty! '),
(22, 'Ben', NULL, 'Bird Keeper', 17, 1200.00, 0, '2000-04-30', '2024-12-01 17:00:47', 'Small birds, big birds, the duty of a Bird Keeper is the same.'),
(23, 'Nathan', NULL, 'Bird Keeper', 16, 1500.00, 0, '1999-01-10', '2024-12-01 17:00:47', 'I prefer small birds.'),
(24, 'Matt', NULL, 'Bird Keeper', 21, 200.00, 0, '2006-09-13', '2024-12-01 17:00:47', 'I prefer big birds.'),
(25, 'Sunny', NULL, 'Bird Keeper', 22, 1100.00, 0, '2004-04-11', '2024-12-01 17:00:47', 'I don\'t like birds. Maybe I should become a Hiker instead.'),
(29, 'Lt.', 'Surge', 'Gym Leader', 26, 3000.00, 1, '1994-12-22', '2024-12-01 17:00:47', 'I may not be in the military anymore, but I still pack a punch!'),
(30, 'Nate', NULL, 'Youngster', 1, 40.00, 0, '2016-07-01', '2024-12-01 17:00:47', 'I\'ll put Youngsters back on top!'),
(31, 'Tom', NULL, 'Electrician', 50, 800.00, 0, '2001-03-01', '2024-12-01 17:00:47', 'Electric Type Pokemon rule.'),
(37, 'Erika', NULL, 'Gym Leader', 45, 3900.00, 1, '2009-09-01', '2024-12-01 17:00:47', 'Grass type Pokemon can be delicate like flowers, but also vicious like a rose with thorns.'),
(38, 'Erice', NULL, 'Lady', 43, 150.00, 0, '2002-03-17', '2024-12-01 17:00:47', 'We love Lady Erika and Grass Type Pokemon.'),
(39, 'Opal', NULL, 'Lady', 44, 250.00, 0, '2002-01-10', '2024-12-01 17:00:47', 'I love Lady Erika, but I don\'t like Grass Pokemon.'),
(42, 'Raph', NULL, 'Bug Catcher', 14, 0.00, 0, '2017-04-01', '2024-12-01 17:00:47', 'My Kakuna will evolve soon!'),
(43, 'Ron', NULL, 'Bug Catcher', 13, 0.00, 0, '2018-07-01', '2024-12-01 17:00:47', 'I want a Beedrill soon! Let\'s battle so my Weedle can get stronger!'),
(44, 'Connie', NULL, 'Bug Catcher', 11, 50.00, 0, '2018-04-04', '2024-12-01 17:00:47', 'Metapod...you\'re evolving!'),
(45, 'Koga', NULL, 'Gym Leader', 33, 6050.00, 1, '2005-05-11', '2024-12-01 17:00:47', 'Confusion, sleep, poison! You will fall victim to the cunning status ailments my Pokemon can inflict!'),
(46, 'Johnny', NULL, 'Poke Maniac', 5, 450.00, 0, '2006-02-18', '2024-12-01 17:00:47', 'Did you know that Charizard becomes a Dragon Type in the future?'),
(47, 'Buggy', NULL, 'Bug Catcher', 10, 70.00, 0, '2018-02-04', '2024-12-01 17:00:47', ''),
(48, 'Maddie', NULL, 'Lady', 12, 170.00, 0, '2005-06-04', '2024-12-01 17:00:47', 'Some bug type Pokemon can be cute.'),
(49, 'Molly', NULL, 'Lady', 47, 510.00, 0, '2005-02-01', '2024-12-01 17:00:47', 'Why are Parasect\'s eyes white?'),
(52, 'Lucy', NULL, 'Lass', 15, 1000.00, 0, '2014-11-30', '2024-12-01 17:00:47', 'I would have preferred a Butterfree. Beedrill is strong, but scary.'),
(53, 'Sabrina', NULL, 'Gym Leader', 48, 7000.00, 1, '2005-05-11', '2024-12-01 17:00:47', 'I saw you in a vision. Because I\'m a psychic.'),
(60, 'Nancy', NULL, 'Lass', 46, 1000.00, 0, '2016-04-30', '2024-12-01 17:00:47', 'So cute!'),
(61, 'Blaine', NULL, 'Gym Leader', 38, 100.00, 1, '1995-05-11', '2024-12-01 17:00:47', 'You found the secret key and got this far? How splendid!'),
(62, 'Blake', NULL, 'Rocket Scientist', 39, 2000.00, 1, '1995-05-11', '2024-12-01 17:00:47', 'Team Rocket will rule the world.'),
(63, 'Lucy', NULL, 'Lass', 35, 100.00, 0, '2016-02-11', '2024-12-01 17:00:47', 'I got this Clefairy on Mt. Moon. '),
(64, 'Anastasia', NULL, 'Lady', 8, 3001.00, 0, '2003-02-11', '2024-12-01 17:00:47', 'Wartortle was cuter before it evolved.'),
(77, 'Giovanni', NULL, 'Rocket Boss', 34, 3000.00, 1, '1974-02-01', '2024-12-01 17:00:47', 'As the Viridian City Gym Leader as the Boss of Team Rocket, I Giovanni, Accept your challenge!'),
(90, NULL, NULL, 'Rocket Grunt', 32, 1000.00, 0, '1974-02-01', '2024-12-01 17:00:47', 'I like Poison Type Pokemon!'),
(91, NULL, NULL, 'Rocket Grunt', 31, 1000.00, 0, '1974-02-01', '2024-12-01 17:00:47', 'I like Poison Type Pokemon!'),
(92, NULL, NULL, 'Rocket Grunt', 36, 1000.00, 0, '1974-08-01', '2024-12-01 17:00:47', 'I like Fairy Type Pokemon!'),
(93, 'John', NULL, 'Ace Trainer', 49, 1000.00, 0, '2017-07-01', '2024-12-01 17:00:47', 'I have nothing to say. Battle!'),
(94, 'NULL', NULL, 'Rocket Grunt', 30, 50.00, 0, '2000-08-01', '2024-12-01 17:00:47', 'I like Poison Type Pokemon!'),
(95, NULL, NULL, 'Rocket Grunt', 29, 100.00, 0, '2000-08-04', '2024-12-01 17:00:47', 'I like Poison Type Pokemon!'),
(96, 'NULL', 'NULL', 'Rocket Grunt', 23, 60.00, 0, '2001-03-04', '2024-12-01 17:00:47', 'I like Poison Type Pokemon!'),
(97, NULL, NULL, 'Rocket Grunt', 40, 80.00, 0, '2001-03-09', '2024-12-01 17:00:47', 'I like Fairy and Normal Type Pokemon!'),
(98, NULL, NULL, 'Rocket Admin', 24, 1100.00, 2, '1995-03-24', '2024-12-01 17:00:47', 'Arbok will make you pay for your insolence!'),
(99, NULL, NULL, 'Rocket Admin', 42, 900.00, 0, '2006-05-04', '2024-12-01 17:00:47', 'Let\'s see you keep up with my Golbat!'),
(100, 'Lorelei', NULL, 'Elite Four', 9, 4000.00, 8, '1990-03-01', '2024-12-01 17:00:47', 'Impressive. To collect all Eight Badges is an accomplishment for a child your age. Very well then. I Lorelei of the Elite Four shall be your first opponent!'),
(101, NULL, NULL, 'Rocket Grunt', 23, 180.00, 0, '2001-04-19', '2024-12-01 17:00:47', 'I like Poison Type Pokemon!'),
(102, 'Bruno', NULL, 'Elite Four', 51, 5000.00, 8, '1994-04-30', '2024-12-01 17:00:47', 'My power will send you packing!');

--
-- Triggers `Trainer`
--
DELIMITER $$
CREATE TRIGGER `BadgeCheck` BEFORE INSERT ON `Trainer` FOR EACH ROW BEGIN
IF new.TrainerBadges < 0 OR new.TrainerBadges > 8 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Badge count must be between 0 and 8';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vMoveTypes`
-- (See below for the actual view)
--
CREATE TABLE `vMoveTypes` (
`MoveId` int
,`MoveName` varchar(20)
,`TypeName` varchar(8)
,`MoveType` varchar(10)
,`MovePower` smallint
,`MoveAccuracy` tinyint
,`MovePowerPoints` tinyint
,`MoveDesc` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vPokemonBattleInfo`
-- (See below for the actual view)
--
CREATE TABLE `vPokemonBattleInfo` (
`PokemonId` int
,`PokemonName` varchar(11)
,`SpeciesName` varchar(25)
,`PrimaryType` varchar(8)
,`SecondaryType` varchar(8)
,`Ability1` varchar(15)
,`Ability2` varchar(15)
,`HiddenAbility` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vPokemonSignatureMoves`
-- (See below for the actual view)
--
CREATE TABLE `vPokemonSignatureMoves` (
`PokemonID` int
,`SignatureMoveId` int
,`MoveName` varchar(20)
,`LevelLearned` int
,`MaxLevelDistance` int
);

-- --------------------------------------------------------

--
-- Structure for view `vMoveTypes`
--
DROP TABLE IF EXISTS `vMoveTypes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`syed0955`@`%` SQL SECURITY DEFINER VIEW `vMoveTypes`  AS SELECT `Moves`.`MoveId` AS `MoveId`, `Moves`.`MoveName` AS `MoveName`, `PrimaryTypes`.`TypeName` AS `TypeName`, `Moves`.`MoveType` AS `MoveType`, `Moves`.`MovePower` AS `MovePower`, `Moves`.`MoveAccuracy` AS `MoveAccuracy`, `Moves`.`MovePowerPoints` AS `MovePowerPoints`, `Moves`.`MoveDesc` AS `MoveDesc` FROM (`Moves` join `PrimaryTypes` on((`Moves`.`MoveTypeId` = `PrimaryTypes`.`TypeId`))) ORDER BY `Moves`.`MoveId` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `vPokemonBattleInfo`
--
DROP TABLE IF EXISTS `vPokemonBattleInfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`syed0955`@`%` SQL SECURITY DEFINER VIEW `vPokemonBattleInfo`  AS SELECT `Pokemon`.`PokemonId` AS `PokemonId`, `Pokemon`.`PokemonName` AS `PokemonName`, `Pokemon`.`SpeciesName` AS `SpeciesName`, `PrimaryTypes`.`TypeName` AS `PrimaryType`, `SecondaryTypes`.`Type2Name` AS `SecondaryType`, `Pokemon`.`Ability1` AS `Ability1`, `Pokemon`.`Ability2` AS `Ability2`, `Pokemon`.`HiddenAbility` AS `HiddenAbility` FROM (((`Pokemon` join `PokemonTyping` on((`Pokemon`.`PokemonId` = `PokemonTyping`.`Pokemon_Id`))) join `PrimaryTypes` on((`PokemonTyping`.`TypeId1` = `PrimaryTypes`.`TypeId`))) join `SecondaryTypes` on((`PokemonTyping`.`TypeId2` = `SecondaryTypes`.`Type2Id`))) ORDER BY `Pokemon`.`PokemonId` ASC, `Pokemon`.`PokemonName` ASC, `Pokemon`.`SpeciesName` ASC, `PrimaryTypes`.`TypeName` ASC, `SecondaryTypes`.`Type2Name` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `vPokemonSignatureMoves`
--
DROP TABLE IF EXISTS `vPokemonSignatureMoves`;

CREATE ALGORITHM=UNDEFINED DEFINER=`syed0955`@`%` SQL SECURITY DEFINER VIEW `vPokemonSignatureMoves`  AS SELECT `PokemonSignatureMoves`.`PokemonID` AS `PokemonID`, `PokemonSignatureMoves`.`SignatureMoveId` AS `SignatureMoveId`, `Moves`.`MoveName` AS `MoveName`, `PokemonSignatureMoves`.`LevelLearned` AS `LevelLearned`, `PokemonSignatureMoves`.`MaxLevelDistance` AS `MaxLevelDistance` FROM (`PokemonSignatureMoves` join `Moves` on((`PokemonSignatureMoves`.`SignatureMoveId` = `Moves`.`MoveId`))) ORDER BY `PokemonSignatureMoves`.`PokemonID` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Moves`
--
ALTER TABLE `Moves`
  ADD PRIMARY KEY (`MoveId`),
  ADD UNIQUE KEY `MoveDesc` (`MoveDesc`),
  ADD KEY `MoveTypeId` (`MoveTypeId`);

--
-- Indexes for table `Pokemon`
--
ALTER TABLE `Pokemon`
  ADD PRIMARY KEY (`PokemonId`,`PokemonName`,`SpeciesName`),
  ADD KEY `PokemonExists` (`PokemonId`,`PokemonName`) USING BTREE;

--
-- Indexes for table `PokemonSignatureMoves`
--
ALTER TABLE `PokemonSignatureMoves`
  ADD PRIMARY KEY (`PokemonID`),
  ADD KEY `MoveId` (`SignatureMoveId`);

--
-- Indexes for table `PokemonTyping`
--
ALTER TABLE `PokemonTyping`
  ADD PRIMARY KEY (`Pokemon_Id`,`TypeId1`,`TypeId2`),
  ADD KEY `fkPokemonTypingType1` (`TypeId1`),
  ADD KEY `fkPokemonTypingType2` (`TypeId2`);

--
-- Indexes for table `PrimaryTypes`
--
ALTER TABLE `PrimaryTypes`
  ADD PRIMARY KEY (`TypeId`),
  ADD UNIQUE KEY `TypeName` (`TypeName`);

--
-- Indexes for table `SecondaryTypes`
--
ALTER TABLE `SecondaryTypes`
  ADD PRIMARY KEY (`Type2Id`),
  ADD KEY `Type2Name` (`Type2Name`);

--
-- Indexes for table `Trainer`
--
ALTER TABLE `Trainer`
  ADD PRIMARY KEY (`TrainerId`),
  ADD KEY `TrainerExists` (`TrainerForename`,`TrainerSurname`) USING BTREE,
  ADD KEY `FavoritePokemon` (`FavoritePokemon`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Pokemon`
--
ALTER TABLE `Pokemon`
  MODIFY `PokemonId` int NOT NULL AUTO_INCREMENT COMMENT 'Pokemon Id', AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `PrimaryTypes`
--
ALTER TABLE `PrimaryTypes`
  MODIFY `TypeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `SecondaryTypes`
--
ALTER TABLE `SecondaryTypes`
  MODIFY `Type2Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Moves`
--
ALTER TABLE `Moves`
  ADD CONSTRAINT `fkMoveType` FOREIGN KEY (`MoveTypeId`) REFERENCES `PrimaryTypes` (`TypeId`) ON DELETE RESTRICT;

--
-- Constraints for table `PokemonSignatureMoves`
--
ALTER TABLE `PokemonSignatureMoves`
  ADD CONSTRAINT `fkPokemonSignatureMoveId` FOREIGN KEY (`SignatureMoveId`) REFERENCES `Moves` (`MoveId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `PokemonTyping`
--
ALTER TABLE `PokemonTyping`
  ADD CONSTRAINT `fkPokemonTypingType1` FOREIGN KEY (`TypeId1`) REFERENCES `PrimaryTypes` (`TypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkPokemonTypingType2` FOREIGN KEY (`TypeId2`) REFERENCES `SecondaryTypes` (`Type2Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Trainer`
--
ALTER TABLE `Trainer`
  ADD CONSTRAINT `fkFavoritePokemon` FOREIGN KEY (`FavoritePokemon`) REFERENCES `Pokemon` (`PokemonId`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`syed0955`@`%` EVENT `UpdateCurrentTime` ON SCHEDULE EVERY 1 MINUTE STARTS '2024-11-29 22:51:47' ENDS '2028-01-01 22:51:47' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Updates current timestamp every minute' DO UPDATE Trainer
SET CurrentTime = CURRENT_TIMESTAMP$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
