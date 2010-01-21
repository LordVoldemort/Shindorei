-- MySQL dump 10.11
--
-- Host: localhost    Database: tc2-world
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_requirement`
--

DROP TABLE IF EXISTS `access_requirement`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `access_requirement` (
  `id` bigint(20) unsigned NOT NULL COMMENT 'Identifier',
  `level_min` tinyint(3) unsigned NOT NULL default '0',
  `heroic_level_min` tinyint(3) unsigned NOT NULL default '0',
  `level_max` tinyint(3) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `item2` mediumint(8) unsigned NOT NULL default '0',
  `heroic_key` mediumint(8) unsigned NOT NULL default '0',
  `heroic_key2` mediumint(8) unsigned NOT NULL default '0',
  `quest_done` mediumint(8) unsigned NOT NULL default '0',
  `quest_failed_text` text,
  `heroic_quest_done` mediumint(8) unsigned NOT NULL default '0',
  `heroic_quest_failed_text` text,
  `comment` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Access Requirements';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `achievement_criteria_data`
--

DROP TABLE IF EXISTS `achievement_criteria_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `achievement_criteria_data` (
  `criteria_id` mediumint(8) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL default '0',
  `value1` mediumint(8) unsigned NOT NULL default '0',
  `value2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`criteria_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Achievment system';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `achievement_reward`
--

DROP TABLE IF EXISTS `achievement_reward`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `achievement_reward` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `title_A` mediumint(8) unsigned NOT NULL default '0',
  `title_H` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `sender` mediumint(8) unsigned NOT NULL default '0',
  `subject` varchar(255) default NULL,
  `text` text,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `areatrigger_involvedrelation`
--

DROP TABLE IF EXISTS `areatrigger_involvedrelation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `areatrigger_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `areatrigger_scripts`
--

DROP TABLE IF EXISTS `areatrigger_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `areatrigger_scripts` (
  `entry` mediumint(8) NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `areatrigger_tavern`
--

DROP TABLE IF EXISTS `areatrigger_tavern`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `areatrigger_tavern` (
  `id` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `name` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `areatrigger_teleport`
--

DROP TABLE IF EXISTS `areatrigger_teleport`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `areatrigger_teleport` (
  `id` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `name` text,
  `access_id` bigint(20) unsigned NOT NULL default '0',
  `target_map` smallint(5) unsigned NOT NULL default '0',
  `target_position_x` float NOT NULL default '0',
  `target_position_y` float NOT NULL default '0',
  `target_position_z` float NOT NULL default '0',
  `target_orientation` float NOT NULL default '0',
  PRIMARY KEY  (`id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `autobroadcast`
--

DROP TABLE IF EXISTS `autobroadcast`;
CREATE TABLE `autobroadcast` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`text` longtext NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `battleground_template`
--

DROP TABLE IF EXISTS `battleground_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `battleground_template` (
  `id` mediumint(8) unsigned NOT NULL,
  `MinPlayersPerTeam` smallint(5) unsigned NOT NULL default '0',
  `MaxPlayersPerTeam` smallint(5) unsigned NOT NULL default '0',
  `MinLvl` tinyint(3) unsigned NOT NULL default '0',
  `MaxLvl` tinyint(3) unsigned NOT NULL default '0',
  `AllianceStartLoc` mediumint(8) unsigned NOT NULL,
  `AllianceStartO` float NOT NULL,
  `HordeStartLoc` mediumint(8) unsigned NOT NULL,
  `HordeStartO` float NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `battlemaster_entry`
--

DROP TABLE IF EXISTS `battlemaster_entry`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `battlemaster_entry` (
  `entry` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Entry of a creature',
  `bg_template` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Battleground template id',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `command`
--

DROP TABLE IF EXISTS `command`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `command` (
  `name` varchar(50) NOT NULL default '',
  `security` tinyint(3) unsigned NOT NULL default '0',
  `help` longtext,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Chat System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature`
--

DROP TABLE IF EXISTS `creature`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature` (
  `guid` int(10) unsigned NOT NULL auto_increment COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Creature Identifier',
  `map` smallint(5) unsigned NOT NULL default '0' COMMENT 'Map Identifier',
  `spawnMask` tinyint(3) unsigned NOT NULL default '1',
  `phaseMask` smallint(5) unsigned NOT NULL default '1',
  `modelid` mediumint(8) unsigned NOT NULL default '0',
  `equipment_id` mediumint(9) NOT NULL default '0',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `spawntimesecs` int(10) unsigned NOT NULL default '120',
  `spawndist` float NOT NULL default '5',
  `currentwaypoint` mediumint(8) unsigned NOT NULL default '0',
  `curhealth` int(10) unsigned NOT NULL default '1',
  `curmana` int(10) unsigned NOT NULL default '0',
  `DeathState` tinyint(3) unsigned NOT NULL default '0',
  `MovementType` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=134518 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_addon`
--

DROP TABLE IF EXISTS `creature_addon`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_addon` (
  `guid` int(10) unsigned NOT NULL default '0',
  `mount` mediumint(8) unsigned NOT NULL default '0',
  `bytes1` int(10) unsigned NOT NULL default '0',
  `bytes2` int(10) unsigned NOT NULL default '0',
  `emote` int(10) unsigned NOT NULL default '0',
  `moveflags` int(10) unsigned NOT NULL default '0',
  `auras` text,
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_ai_scripts`
--

DROP TABLE IF EXISTS `creature_ai_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_ai_scripts` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT 'Identifier',
  `creature_id` int(11) unsigned NOT NULL default '0' COMMENT 'Creature Template Identifier',
  `event_type` tinyint(5) unsigned NOT NULL default '0' COMMENT 'Event Type',
  `event_inverse_phase_mask` int(11) NOT NULL default '0' COMMENT 'Mask which phases this event will not trigger in',
  `event_chance` int(3) unsigned NOT NULL default '100',
  `event_flags` int(3) unsigned NOT NULL default '0',
  `event_param1` int(11) NOT NULL default '0',
  `event_param2` int(11) NOT NULL default '0',
  `event_param3` int(11) NOT NULL default '0',
  `event_param4` int(11) NOT NULL default '0',
  `action1_type` tinyint(5) unsigned NOT NULL default '0' COMMENT 'Action Type',
  `action1_param1` int(11) NOT NULL default '0',
  `action1_param2` int(11) NOT NULL default '0',
  `action1_param3` int(11) NOT NULL default '0',
  `action2_type` tinyint(5) unsigned NOT NULL default '0' COMMENT 'Action Type',
  `action2_param1` int(11) NOT NULL default '0',
  `action2_param2` int(11) NOT NULL default '0',
  `action2_param3` int(11) NOT NULL default '0',
  `action3_type` tinyint(5) unsigned NOT NULL default '0' COMMENT 'Action Type',
  `action3_param1` int(11) NOT NULL default '0',
  `action3_param2` int(11) NOT NULL default '0',
  `action3_param3` int(11) NOT NULL default '0',
  `comment` varchar(255) NOT NULL default '' COMMENT 'Event Comment',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3257603 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='EventAI Scripts';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_ai_summons`
--

DROP TABLE IF EXISTS `creature_ai_summons`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_ai_summons` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT 'Location Identifier',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `spawntimesecs` int(11) unsigned NOT NULL default '120',
  `comment` varchar(255) NOT NULL default '' COMMENT 'Summon Comment',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='EventAI Summoning Locations';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_ai_texts`
--

DROP TABLE IF EXISTS `creature_ai_texts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_ai_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint(8) unsigned NOT NULL default '0',
  `type` tinyint(3) unsigned NOT NULL default '0',
  `language` tinyint(3) unsigned NOT NULL default '0',
  `emote` smallint(5) unsigned NOT NULL default '0',
  `comment` text,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Texts';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_equip_template`
--

DROP TABLE IF EXISTS `creature_equip_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_equip_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Unique entry',
  `equipentry1` mediumint(8) unsigned NOT NULL default '0',
  `equipentry2` mediumint(8) unsigned NOT NULL default '0',
  `equipentry3` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Equipment)';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_formations`
--

DROP TABLE IF EXISTS `creature_formations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_formations` (
  `leaderGUID` int(11) unsigned NOT NULL,
  `memberGUID` int(11) unsigned NOT NULL,
  `dist` float unsigned NOT NULL,
  `angle` float unsigned NOT NULL,
  `groupAI` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`memberGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_involvedrelation`
--

DROP TABLE IF EXISTS `creature_involvedrelation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  PRIMARY KEY  (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_linked_respawn`
--

DROP TABLE IF EXISTS `creature_linked_respawn`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_linked_respawn` (
  `guid` int(10) unsigned NOT NULL COMMENT 'dependent creature',
  `linkedGuid` int(10) unsigned NOT NULL COMMENT 'master creature',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature Respawn Link System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_loot_template`
--

DROP TABLE IF EXISTS `creature_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `ChanceOrQuestChance` float NOT NULL default '100',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `mincountOrRef` mediumint(9) NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `lootcondition` tinyint(3) unsigned NOT NULL default '0',
  `condition_value1` mediumint(8) unsigned NOT NULL default '0',
  `condition_value2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_model_info`
--

DROP TABLE IF EXISTS `creature_model_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_model_info` (
  `modelid` mediumint(8) unsigned NOT NULL default '0',
  `bounding_radius` float NOT NULL default '0',
  `combat_reach` float NOT NULL default '0',
  `gender` tinyint(3) unsigned NOT NULL default '2',
  `modelid_other_gender` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`modelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Model related info)';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_onkill_reputation`
--

DROP TABLE IF EXISTS `creature_onkill_reputation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_onkill_reputation` (
  `creature_id` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint(6) NOT NULL default '0',
  `RewOnKillRepFaction2` smallint(6) NOT NULL default '0',
  `MaxStanding1` tinyint(4) NOT NULL default '0',
  `IsTeamAward1` tinyint(4) NOT NULL default '0',
  `RewOnKillRepValue1` mediumint(9) NOT NULL default '0',
  `MaxStanding2` tinyint(4) NOT NULL default '0',
  `IsTeamAward2` tinyint(4) NOT NULL default '0',
  `RewOnKillRepValue2` mediumint(9) NOT NULL default '0',
  `TeamDependent` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature OnKill Reputation gain';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_questrelation`
--

DROP TABLE IF EXISTS `creature_questrelation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_questrelation` (
  `id` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  PRIMARY KEY  (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_respawn`
--

DROP TABLE IF EXISTS `creature_respawn`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_respawn` (
  `guid` int(10) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) NOT NULL default '0',
  `instance` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_template`
--

DROP TABLE IF EXISTS `creature_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `difficulty_entry_1` mediumint(8) unsigned NOT NULL default '0',
  `difficulty_entry_2` mediumint(8) unsigned NOT NULL default '0',
  `difficulty_entry_3` mediumint(8) unsigned NOT NULL default '0',
  `KillCredit1` int(11) unsigned NOT NULL default '0',
  `KillCredit2` int(11) unsigned NOT NULL default '0',
  `modelid1` mediumint(8) unsigned NOT NULL default '0',
  `modelid2` mediumint(8) unsigned NOT NULL default '0',
  `modelid3` mediumint(8) unsigned NOT NULL default '0',
  `modelid4` mediumint(8) unsigned NOT NULL default '0',
  `name` char(100) NOT NULL default '0',
  `subname` char(100) default NULL,
  `IconName` char(100) default NULL,
  `gossip_menu_id` mediumint(8) unsigned NOT NULL default '0',
  `minlevel` tinyint(3) unsigned NOT NULL default '1',
  `maxlevel` tinyint(3) unsigned NOT NULL default '1',
  `minhealth` int(10) unsigned NOT NULL default '0',
  `maxhealth` int(10) unsigned NOT NULL default '0',
  `minmana` int(10) unsigned NOT NULL default '0',
  `maxmana` int(10) unsigned NOT NULL default '0',
  `armor` mediumint(8) unsigned NOT NULL default '0',
  `faction_A` smallint(5) unsigned NOT NULL default '0',
  `faction_H` smallint(5) unsigned NOT NULL default '0',
  `npcflag` int(10) unsigned NOT NULL default '0',
  `speed` float default '1',
  `scale` float NOT NULL default '1',
  `rank` tinyint(3) unsigned NOT NULL default '0',
  `mindmg` float NOT NULL default '0',
  `maxdmg` float NOT NULL default '0',
  `dmgschool` tinyint(4) NOT NULL default '0',
  `attackpower` int(10) unsigned NOT NULL default '0',
  `dmg_multiplier` float NOT NULL default '1',
  `baseattacktime` int(10) unsigned NOT NULL default '0',
  `rangeattacktime` int(10) unsigned NOT NULL default '0',
  `unit_class` tinyint(3) unsigned NOT NULL default '0',
  `unit_flags` int(10) unsigned NOT NULL default '0',
  `dynamicflags` int(10) unsigned NOT NULL default '0',
  `family` tinyint(4) NOT NULL default '0',
  `trainer_type` tinyint(4) NOT NULL default '0',
  `trainer_spell` mediumint(8) unsigned NOT NULL default '0',
  `trainer_class` tinyint(3) unsigned NOT NULL default '0',
  `trainer_race` tinyint(3) unsigned NOT NULL default '0',
  `minrangedmg` float NOT NULL default '0',
  `maxrangedmg` float NOT NULL default '0',
  `rangedattackpower` smallint(5) unsigned NOT NULL default '0',
  `type` tinyint(3) unsigned NOT NULL default '0',
  `type_flags` int(10) unsigned NOT NULL default '0',
  `lootid` mediumint(8) unsigned NOT NULL default '0',
  `pickpocketloot` mediumint(8) unsigned NOT NULL default '0',
  `skinloot` mediumint(8) unsigned NOT NULL default '0',
  `resistance1` smallint(5) NOT NULL default '0',
  `resistance2` smallint(5) NOT NULL default '0',
  `resistance3` smallint(5) NOT NULL default '0',
  `resistance4` smallint(5) NOT NULL default '0',
  `resistance5` smallint(5) NOT NULL default '0',
  `resistance6` smallint(5) NOT NULL default '0',
  `spell1` mediumint(8) unsigned NOT NULL default '0',
  `spell2` mediumint(8) unsigned NOT NULL default '0',
  `spell3` mediumint(8) unsigned NOT NULL default '0',
  `spell4` mediumint(8) unsigned NOT NULL default '0',
  `spell5` mediumint(8) unsigned NOT NULL default '0',
  `spell6` mediumint(8) unsigned NOT NULL default '0',
  `spell7` mediumint(8) unsigned NOT NULL default '0',
  `spell8` mediumint(8) unsigned NOT NULL default '0',
  `PetSpellDataId` mediumint(8) unsigned NOT NULL default '0',
  `VehicleId` mediumint(8) unsigned NOT NULL default '0',
  `mingold` mediumint(8) unsigned NOT NULL default '0',
  `maxgold` mediumint(8) unsigned NOT NULL default '0',
  `AIName` char(64) NOT NULL default '',
  `MovementType` tinyint(3) unsigned NOT NULL default '0',
  `InhabitType` tinyint(3) unsigned NOT NULL default '3',
  `unk16` float NOT NULL default '1',
  `unk17` float NOT NULL default '1',
  `RacialLeader` tinyint(3) unsigned NOT NULL default '0',
  `questItem1` int(11) unsigned NOT NULL default '0',
  `questItem2` int(11) unsigned NOT NULL default '0',
  `questItem3` int(11) unsigned NOT NULL default '0',
  `questItem4` int(11) unsigned NOT NULL default '0',
  `questItem5` int(11) unsigned NOT NULL default '0',
  `questItem6` int(11) unsigned NOT NULL default '0',
  `movementId` int(11) unsigned NOT NULL default '0',
  `RegenHealth` tinyint(3) unsigned NOT NULL default '1',
  `equipment_id` mediumint(8) unsigned NOT NULL default '0',
  `mechanic_immune_mask` int(10) unsigned NOT NULL default '0',
  `flags_extra` int(10) unsigned NOT NULL default '0',
  `ScriptName` char(64) NOT NULL default '',
  PRIMARY KEY  (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `creature_template_addon`
--

DROP TABLE IF EXISTS `creature_template_addon`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_template_addon` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `mount` mediumint(8) unsigned NOT NULL default '0',
  `bytes1` int(10) unsigned NOT NULL default '0',
  `bytes2` int(10) unsigned NOT NULL default '0',
  `emote` mediumint(8) unsigned NOT NULL default '0',
  `moveflags` int(10) unsigned NOT NULL default '0',
  `auras` text,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `custom_texts`
--

DROP TABLE IF EXISTS `custom_texts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `custom_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint(8) unsigned NOT NULL default '0',
  `type` tinyint(3) unsigned NOT NULL default '0',
  `language` tinyint(3) unsigned NOT NULL default '0',
  `emote` smallint(5) unsigned NOT NULL default '0',
  `comment` text,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Custom Texts';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `db_script_string`
--

DROP TABLE IF EXISTS `db_script_string`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `db_script_string` (
  `entry` int(11) unsigned NOT NULL default '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `disenchant_loot_template`
--

DROP TABLE IF EXISTS `disenchant_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `disenchant_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Recommended id selection: item_level*100 + item_quality',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `ChanceOrQuestChance` float NOT NULL default '100',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `mincountOrRef` mediumint(9) NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `lootcondition` tinyint(3) unsigned NOT NULL default '0',
  `condition_value1` mediumint(8) unsigned NOT NULL default '0',
  `condition_value2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `event_scripts`
--

DROP TABLE IF EXISTS `event_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `event_scripts` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `delay` int(10) unsigned NOT NULL default '0',
  `command` mediumint(8) unsigned NOT NULL default '0',
  `datalong` mediumint(8) unsigned NOT NULL default '0',
  `datalong2` int(10) unsigned NOT NULL default '0',
  `dataint` int(11) NOT NULL default '0',
  `x` float NOT NULL default '0',
  `y` float NOT NULL default '0',
  `z` float NOT NULL default '0',
  `o` float NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `exploration_basexp`
--

DROP TABLE IF EXISTS `exploration_basexp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exploration_basexp` (
  `level` tinyint(4) unsigned NOT NULL default '0',
  `basexp` mediumint(9) NOT NULL default '0',
  PRIMARY KEY  (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Exploration System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fishing_loot_template`
--

DROP TABLE IF EXISTS `fishing_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fishing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `ChanceOrQuestChance` float NOT NULL default '100',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `mincountOrRef` mediumint(9) NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `lootcondition` tinyint(3) unsigned NOT NULL default '0',
  `condition_value1` mediumint(8) unsigned NOT NULL default '0',
  `condition_value2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_event`
--

DROP TABLE IF EXISTS `game_event`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event` (
  `entry` mediumint(8) unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint(20) unsigned NOT NULL default '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint(20) unsigned NOT NULL default '2592000' COMMENT 'Length in minutes of the event',
  `holiday` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Client side holiday id',
  `description` varchar(255) default NULL COMMENT 'Description of the event displayed in console',
  `world_event` tinyint(3) unsigned NOT NULL default '0' COMMENT '0 if normal event, 1 if world event',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_event_battleground_holiday`
--

DROP TABLE IF EXISTS `game_event_battleground_holiday`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_battleground_holiday` (
  `event` int(10) unsigned NOT NULL,
  `bgflag` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_event_condition`
--

DROP TABLE IF EXISTS `game_event_condition`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_condition` (
  `event_id` mediumint(8) unsigned NOT NULL default '0',
  `condition_id` mediumint(8) unsigned NOT NULL default '0',
  `req_num` float default '0',
  `max_world_state_field` smallint(5) unsigned NOT NULL default '0',
  `done_world_state_field` smallint(5) unsigned NOT NULL default '0',
  `description` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`event_id`,`condition_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_event_creature`
--

DROP TABLE IF EXISTS `game_event_creature`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_creature` (
  `guid` int(10) unsigned NOT NULL,
  `event` smallint(6) NOT NULL default '0' COMMENT 'Put negatives values to remove during event',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_event_creature_quest`
--

DROP TABLE IF EXISTS `game_event_creature_quest`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_creature_quest` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `quest` mediumint(8) unsigned NOT NULL default '0',
  `event` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_event_gameobject`
--

DROP TABLE IF EXISTS `game_event_gameobject`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_gameobject` (
  `guid` int(10) unsigned NOT NULL,
  `event` smallint(6) NOT NULL default '0' COMMENT 'Put negatives values to remove during event',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_event_gameobject_quest`
--

DROP TABLE IF EXISTS `game_event_gameobject_quest`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_gameobject_quest` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `quest` mediumint(8) unsigned NOT NULL default '0',
  `event` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`quest`,`event`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_event_model_equip`
--

DROP TABLE IF EXISTS `game_event_model_equip`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_model_equip` (
  `guid` int(10) unsigned NOT NULL default '0',
  `modelid` mediumint(8) unsigned NOT NULL default '0',
  `equipment_id` mediumint(8) unsigned NOT NULL default '0',
  `event` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_event_npc_gossip`
--

DROP TABLE IF EXISTS `game_event_npc_gossip`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_npc_gossip` (
  `guid` int(10) unsigned NOT NULL,
  `event_id` mediumint(8) unsigned NOT NULL default '0',
  `textid` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_event_npc_vendor`
--

DROP TABLE IF EXISTS `game_event_npc_vendor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_npc_vendor` (
  `event` mediumint(8) unsigned NOT NULL default '0',
  `guid` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `maxcount` mediumint(8) unsigned NOT NULL default '0',
  `incrtime` mediumint(8) unsigned NOT NULL default '0',
  `ExtendedCost` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

-- Table structure for table `creature_classlevelstats`

DROP TABLE IF EXISTS `creature_classlevelstats`;

CREATE TABLE `creature_classlevelstats` (
  `exp` tinyint(1) NOT NULL,
  `class` tinyint(1) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `basehp` smallint(2) NOT NULL,
  `basemana` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `creature_classlevelstats` (`exp`,`class`,`level`,`basehp`,`basemana`) VALUES
(0,1,1,42,0),
(0,1,2,55,0),
(0,1,3,71,0),
(0,1,4,86,0),
(0,1,5,102,0),
(0,1,6,120,0),
(0,1,7,137,0),
(0,1,8,156,0),
(0,1,9,176,0),
(0,1,10,198,0),
(0,1,11,222,0),
(0,1,12,247,0),
(0,1,13,273,0),
(0,1,14,300,0),
(0,1,15,328,0),
(0,1,16,356,0),
(0,1,17,386,0),
(0,1,18,417,0),
(0,1,19,449,0),
(0,1,20,484,0),
(0,1,21,521,0),
(0,1,22,562,0),
(0,1,23,605,0),
(0,1,24,651,0),
(0,1,25,699,0),
(0,1,26,750,0),
(0,1,27,800,0),
(0,1,28,853,0),
(0,1,29,905,0),
(0,1,30,955,0),
(0,1,31,1006,0),
(0,1,32,1057,0),
(0,1,33,1110,0),
(0,1,34,1163,0),
(0,1,35,1220,0),
(0,1,36,1277,0),
(0,1,37,1336,0),
(0,1,38,1395,0),
(0,1,39,1459,0),
(0,1,40,1524,0),
(0,1,41,1585,0),
(0,1,42,1651,0),
(0,1,43,1716,0),
(0,1,44,1782,0),
(0,1,45,1848,0),
(0,1,46,1919,0),
(0,1,47,1990,0),
(0,1,48,2061,0),
(0,1,49,2138,0),
(0,1,50,2215,0),
(0,1,51,2292,0),
(0,1,52,2371,0),
(0,1,53,2453,0),
(0,1,54,2533,0),
(0,1,55,2614,0),
(0,1,56,2699,0),
(0,1,57,2784,0),
(0,1,58,2871,0),
(0,1,59,2961,0),
(0,1,60,3052,0),
(0,1,61,3144,0),
(0,1,62,3237,0),
(0,1,63,3331,0),
(0,1,64,0,0),
(0,1,65,3524,0),
(0,1,66,0,0),
(0,1,67,3728,0),
(0,1,68,3834,0),
(0,1,69,0,0),
(0,1,70,4050,0),
(0,1,71,4163,0),
(0,1,72,4278,0),
(0,1,73,0,0),
(0,1,74,0,0),
(0,1,75,4652,0),
(0,1,76,0,0),
(0,1,77,4916,0),
(0,1,78,5052,0),
(0,1,79,0,0),
(0,1,80,5342,0),
(0,1,81,5496,0),
(0,1,82,0,0),
(0,1,83,5808,0),
(1,1,58,3989,0),
(1,1,59,4142,0),
(1,1,60,4979,0),
(1,1,61,5158,0),
(1,1,62,5341,0),
(1,1,63,5527,0),
(1,1,64,5715,0),
(1,1,65,5914,0),
(1,1,66,6116,0),
(1,1,67,6326,0),
(1,1,68,6542,0),
(1,1,69,6761,0),
(1,1,70,6986,0),
(1,1,71,7181,0),
(1,1,72,7380,0),
(1,1,73,7580,0),
(2,1,68,6986,0),
(2,1,69,7984,0),
(2,1,70,8982,0),
(2,1,71,9291,0),
(2,1,72,9610,0),
(2,1,73,9940,0),
(2,1,74,10282,0),
(2,1,75,10635,0),
(2,1,76,11001,0),
(2,1,77,11379,0),
(2,1,78,11770,0),
(2,1,79,12175,0),
(2,1,80,12600,0),
(2,1,81,13033,0),
(2,1,82,13481,0),
(2,1,83,13945,0),
(0,2,1,41,60),
(0,2,2,54,69),
(0,2,3,69,79),
(0,2,4,83,104),
(0,2,5,98,115),
(0,2,6,115,126),
(0,2,7,131,138),
(0,2,8,148,165),
(0,2,9,166,178),
(0,2,10,186,191),
(0,2,11,208,205),
(0,2,12,230,249),
(0,2,13,253,264),
(0,2,14,276,295),
(0,2,15,301,326),
(0,2,16,325,357),
(0,2,17,350,390),
(0,2,18,377,408),
(0,2,19,404,456),
(0,2,20,433,490),
(0,2,21,464,510),
(0,2,22,498,544),
(0,2,23,533,581), 
(0,2,24,571,618),
(0,2,25,610,655),
(0,2,26,651,693),
(0,2,27,690,732),
(0,2,28,732,756),
(0,2,29,773,811),
(0,2,30,811,852),
(0,2,31,850,878),
(0,2,32,888,935),
(0,2,33,928,963),
(0,2,34,967,1007),
(0,2,35,1009,1067),
(0,2,36,1050,1097),
(0,2,37,1093,1142),
(0,2,38,1135,1186),
(0,2,39,1180,1236),
(0,2,40,1226,1283),
(0,2,41,1268,1332),
(0,2,42,1321,1381),
(0,2,43,1373,1432),
(0,2,44,1426,1483),
(0,2,45,1478,1534),
(0,2,46,1535,1587),
(0,2,47,1592,1640),
(0,2,48,1650,1695),
(0,2,49,1710,1750),
(0,2,50,1772,1807),
(0,2,51,1834,1864),
(0,2,52,1897,1923),
(0,2,53,1962,1982),
(0,2,54,2026,2041),
(0,2,55,2091,2117),
(0,2,56,2159,2163),
(0,2,57,2227,2241),
(0,2,58,2297,2289),
(0,2,59,2369,2369),
(0,2,60,2442,2434),
(0,2,61,2515,2486),
(0,2,62,2590,2568),
(0,2,63,2665,2620),
(0,2,64,0,2705),
(0,2,65,2819,2790),
(0,2,66,0,2846),
(0,2,67,2982,2933),
(0,2,68,3067,2991),
(0,2,69,0,3080),
(0,2,70,3240,3155),
(0,2,71,3330,3231),
(0,2,72,3422,3309),
(0,2,73,0,3387),
(0,2,74,0,3466),
(0,2,75,3722,3561),
(0,2,76,0,3643),
(0,2,77,3933,3725),
(0,2,78,4042,3809),
(0,2,79,0,3893),
(0,2,80,4274,3994),
(0,2,81,4394,4081),
(0,2,82,0,4169),
(0,2,83,0,4258),
(1,2,58,3191,2289),
(1,2,59,3314,2369),
(1,2,60,3984,2434),
(1,2,61,4126,2486),
(1,2,62,4274,2568),
(1,2,63,4422,2620),
(1,2,64,4572,2705),
(1,2,65,4731,2790),
(1,2,66,4892,2846),
(1,2,67,5060,2933),
(1,2,68,5233,2991),
(1,2,69,5409,3080),
(1,2,70,5589,3155),
(1,2,71,5744,3231),
(1,2,72,5900,3309),
(1,2,73,6070,3387),
(2,2,68,6986,2991),
(2,2,69,7984,3080),
(2,2,70,8982,3155),
(2,2,71,9291,3231),
(2,2,72,9610,3309),
(2,2,73,9940,3387),
(2,2,74,10282,3466),
(2,2,75,10635,3561),
(2,2,76,11001,3643),
(2,2,77,11379,3725),
(2,2,78,11770,3809),
(2,2,79,12175,3893),
(2,2,80,12600,3994),
(2,2,81,13033,4081),
(2,2,82,13481,4169),
(2,2,83,13945,4258),
(0,4,1,42,0),
(0,4,2,55,0),
(0,4,3,71,0),
(0,4,4,86,0),
(0,4,5,102,0),
(0,4,6,120,0),
(0,4,7,137,0),
(0,4,8,156,0),
(0,4,9,176,0),
(0,4,10,198,0),
(0,4,11,222,0),
(0,4,12,247,0),
(0,4,13,273,0),
(0,4,14,300,0),
(0,4,15,328,0),
(0,4,16,356,0),
(0,4,17,386,0),
(0,4,18,417,0),
(0,4,19,484,0),
(0,4,20,531,0),
(0,4,21,573,0),
(0,4,22,617,0),
(0,4,23,664,0),
(0,4,24,713,0),
(0,4,25,734,0),
(0,4,26,787,0),
(0,4,27,840,0),
(0,4,28,869,0),
(0,4,29,905,0),
(0,4,30,955,0),
(0,4,31,1006,0),
(0,4,32,1057,0),
(0,4,33,1110,0),
(0,4,34,1163,0),
(0,4,35,1220,0),
(0,4,36,1277,0),
(0,4,37,1336,0),
(0,4,38,1395,0),
(0,4,39,1459,0),
(0,4,40,1524,0),
(0,4,41,1585,0),
(0,4,42,1651,0),
(0,4,43,1716,0),
(0,4,44,1782,0),
(0,4,45,1848,0),
(0,4,46,1919,0),
(0,4,47,1990,0),
(0,4,48,2062,0),
(0,4,49,2138,0),
(0,4,50,2215,0),
(0,4,51,2292,0),
(0,4,52,2371,0),
(0,4,53,2453,0),
(0,4,54,2533,0),
(0,4,55,2614,0),
(0,4,56,2699,0),
(0,4,57,2784,0),
(0,4,58,2871,0),
(0,4,59,2961,0),
(0,4,60,3052,0),
(0,4,61,3186,0),
(0,4,62,3237,0),
(0,4,63,3331,0),
(0,4,64,0,0),
(0,4,65,3524,0),
(0,4,66,0,0),
(0,4,67,3728,0),
(0,4,68,3834,0),
(0,4,69,0,0),
(0,4,70,4050,0),
(0,4,71,4163,0),
(0,4,72,4278,0),
(0,4,73,0,0),
(0,4,74,0,0),
(0,4,75,4652,0),
(0,4,76,0,0),
(0,4,77,4916,0),
(0,4,78,5052,0),
(0,4,79,0,0),
(0,4,80,5342,0),
(0,4,81,5496,0),
(0,4,82,0,0),
(0,4,83,0,0),
(1,4,58,3989,0),
(1,4,59,4142,0),
(1,4,60,4979,0),
(1,4,61,5158,0),
(1,4,62,5341,0),
(1,4,63,5527,0),
(1,4,64,5715,0),
(1,4,65,5914,0),
(1,4,66,6116,0),
(1,4,67,6326,0),
(1,4,68,6542,0),
(1,4,69,6761,0),
(1,4,70,6986,0),
(1,4,71,7181,0),
(1,4,72,7380,0),
(1,4,73,7580,0),
(2,4,68,6986,0),
(2,4,69,7984,0),
(2,4,70,8982,0),
(2,4,71,9291,0),
(2,4,72,9610,0),
(2,4,73,9940,0),
(2,4,74,10282,0),
(2,4,75,10635,0),
(2,4,76,11001,0),
(2,4,77,11379,0),
(2,4,78,11770,0),
(2,4,79,12175,0),
(2,4,80,12600,0),
(2,4,81,13033,0),
(2,4,82,13481,0),
(2,4,83,13945,0),
(0,8,1,40,120),
(0,8,2,0,0),
(0,8,3,67,174),
(0,8,4,81,202),
(0,8,5,95,230),
(0,8,6,111,259),
(0,8,7,126,289),
(0,8,8,143,319),
(0,8,9,160,350),
(0,8,10,178,382),
(0,8,11,199,459),
(0,8,12,219,537),
(0,8,13,241,601),
(0,8,14,263,710),
(0,8,15,285,790),
(0,8,16,307,856),
(0,8,17,330,938),
(0,8,18,354,1020),
(0,8,19,379,1118),
(0,8,20,405,1202),
(0,8,21,432,1272),
(0,8,22,463,1357),
(0,8,23,494,1443),
(0,8,24,528,1545),
(0,8,25,562,1633),
(0,8,26,598,1707),
(0,8,27,633,1812),
(0,8,28,669,1977),
(0,8,29,704,2068),
(0,8,30,737,2175),
(0,8,31,770,2253),
(0,8,32,802,2362),
(0,8,33,835,2457),
(0,8,34,867,2553),
(0,8,35,902,2680),
(0,8,36,935,2763),
(0,8,37,970,2861),
(0,8,38,1004,2975),
(0,8,39,1040,3075),
(0,8,40,1077,3191),
(0,8,41,1110,3293),
(0,8,42,1156,3471),
(0,8,43,1201,3575),
(0,8,44,1247,3680),
(0,8,45,1294,3801),
(0,8,46,1343,3923),
(0,8,47,1393,4031),
(0,8,48,1443,4140),
(0,8,49,1497,4281),
(0,8,50,1551,4393),
(0,8,51,1604,4506),
(0,8,52,1660,4650),
(0,8,53,1717,4765),
(0,8,54,1773,4896),
(0,8,55,1830,5013),
(0,8,56,1889,5206),
(0,8,57,1949,5340),
(0,8,58,2010,5461),
(0,8,59,2073,5598),
(0,8,60,2136,5751),
(0,8,61,2201,5875),
(0,8,62,2266,6015),
(0,8,63,2332,6156),
(0,8,64,0,6229),
(0,8,65,2467,6443),
(0,8,66,0,6588),
(0,8,67,2610,6749),
(0,8,68,2684,6882),
(0,8,69,0,7031),
(0,8,70,2835,7196),
(0,8,71,2914,7332),
(0,8,72,2995,7500),
(0,8,73,0,7654),
(0,8,74,0,7809),
(0,8,75,3257,7981),
(0,8,76,0,8139),
(0,8,77,0,8313),
(0,8,78,0,8459),
(0,8,79,0,8636),
(0,8,80,0,8814),
(0,8,81,0,8979),
(0,8,82,0,9160),
(0,8,83,0,9325),
(1,8,58,2793,5461),
(1,8,59,2899,5598),
(1,8,60,3484,5751),
(1,8,61,3611,5875),
(1,8,62,3739,6015),
(1,8,63,3870,6156),
(1,8,64,4000,6229),
(1,8,65,4140,6443),
(1,8,66,4281,6588),
(1,8,67,4429,6749),
(1,8,68,4580,6882),
(1,8,69,4733,7031),
(1,8,70,4890,7196),
(1,8,71,5027,7332),
(1,8,72,5166,7500),
(1,8,73,5311,7654),
(2,8,68,5588,6882),
(2,8,69,6387,7031),
(2,8,70,7185,7196),
(2,8,71,7432,7332),
(2,8,72,7688,7500),
(2,8,73,7952,7654),
(2,8,74,8225,7809),
(2,8,75,8508,7981),
(2,8,76,8800,8139),
(2,8,77,9103,8313),
(2,8,78,9416,8459),
(2,8,79,9740,8636),
(2,8,80,10080,8814),
(2,8,81,10486,8979),
(2,8,82,10784,9160),
(2,8,83,11156,9325);


--
-- Table structure for table `game_event_npcflag`
--

DROP TABLE IF EXISTS `game_event_npcflag`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_npcflag` (
  `guid` mediumint(8) unsigned NOT NULL default '0',
  `event_id` mediumint(8) unsigned NOT NULL default '0',
  `npcflag` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`,`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_event_pool`
--

DROP TABLE IF EXISTS `game_event_pool`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_pool` (
  `pool_entry` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Id of the pool',
  `event` smallint(6) NOT NULL default '0' COMMENT 'Put negatives values to remove during event',
  PRIMARY KEY  (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_event_prerequisite`
--

DROP TABLE IF EXISTS `game_event_prerequisite`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_prerequisite` (
  `event_id` mediumint(8) unsigned NOT NULL,
  `prerequisite_event` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY  (`event_id`,`prerequisite_event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_event_quest_condition`
--

DROP TABLE IF EXISTS `game_event_quest_condition`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_quest_condition` (
  `quest` mediumint(8) unsigned NOT NULL default '0',
  `event_id` mediumint(8) unsigned NOT NULL default '0',
  `condition_id` mediumint(8) unsigned NOT NULL default '0',
  `num` float default '0',
  PRIMARY KEY  (`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_graveyard_zone`
--

DROP TABLE IF EXISTS `game_graveyard_zone`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_graveyard_zone` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `ghost_zone` mediumint(8) unsigned NOT NULL default '0',
  `faction` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`,`ghost_zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trigger System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_tele`
--

DROP TABLE IF EXISTS `game_tele`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_tele` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `map` smallint(5) unsigned NOT NULL default '0',
  `name` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1410 DEFAULT CHARSET=utf8 COMMENT='Tele Command';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_weather`
--

DROP TABLE IF EXISTS `game_weather`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_weather` (
  `zone` mediumint(8) unsigned NOT NULL default '0',
  `spring_rain_chance` tinyint(3) unsigned NOT NULL default '25',
  `spring_snow_chance` tinyint(3) unsigned NOT NULL default '25',
  `spring_storm_chance` tinyint(3) unsigned NOT NULL default '25',
  `summer_rain_chance` tinyint(3) unsigned NOT NULL default '25',
  `summer_snow_chance` tinyint(3) unsigned NOT NULL default '25',
  `summer_storm_chance` tinyint(3) unsigned NOT NULL default '25',
  `fall_rain_chance` tinyint(3) unsigned NOT NULL default '25',
  `fall_snow_chance` tinyint(3) unsigned NOT NULL default '25',
  `fall_storm_chance` tinyint(3) unsigned NOT NULL default '25',
  `winter_rain_chance` tinyint(3) unsigned NOT NULL default '25',
  `winter_snow_chance` tinyint(3) unsigned NOT NULL default '25',
  `winter_storm_chance` tinyint(3) unsigned NOT NULL default '25',
  PRIMARY KEY  (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Weather System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gameobject`
--

DROP TABLE IF EXISTS `gameobject`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject` (
  `guid` int(10) unsigned NOT NULL auto_increment COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Gameobject Identifier',
  `map` smallint(5) unsigned NOT NULL default '0' COMMENT 'Map Identifier',
  `spawnMask` tinyint(3) unsigned NOT NULL default '1',
  `phaseMask` smallint(5) unsigned NOT NULL default '1',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `rotation0` float NOT NULL default '0',
  `rotation1` float NOT NULL default '0',
  `rotation2` float NOT NULL default '0',
  `rotation3` float NOT NULL default '0',
  `spawntimesecs` int(11) NOT NULL default '0',
  `animprogress` tinyint(3) unsigned NOT NULL default '0',
  `state` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gameobject_involvedrelation`
--

DROP TABLE IF EXISTS `gameobject_involvedrelation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `quest` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  PRIMARY KEY  (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gameobject_loot_template`
--

DROP TABLE IF EXISTS `gameobject_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `ChanceOrQuestChance` float NOT NULL default '100',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `mincountOrRef` mediumint(9) NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `lootcondition` tinyint(3) unsigned NOT NULL default '0',
  `condition_value1` mediumint(8) unsigned NOT NULL default '0',
  `condition_value2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gameobject_questrelation`
--

DROP TABLE IF EXISTS `gameobject_questrelation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject_questrelation` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `quest` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  PRIMARY KEY  (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gameobject_respawn`
--

DROP TABLE IF EXISTS `gameobject_respawn`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject_respawn` (
  `guid` int(10) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) NOT NULL default '0',
  `instance` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gameobject_scripts`
--

DROP TABLE IF EXISTS `gameobject_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject_scripts` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `delay` int(10) unsigned NOT NULL default '0',
  `command` mediumint(8) unsigned NOT NULL default '0',
  `datalong` mediumint(8) unsigned NOT NULL default '0',
  `datalong2` int(10) unsigned NOT NULL default '0',
  `dataint` int(11) NOT NULL default '0',
  `x` float NOT NULL default '0',
  `y` float NOT NULL default '0',
  `z` float NOT NULL default '0',
  `o` float NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gameobject_template`
--

DROP TABLE IF EXISTS `gameobject_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `type` tinyint(3) unsigned NOT NULL default '0',
  `displayId` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(100) NOT NULL default '',
  `IconName` varchar(100) NOT NULL default '',
  `castBarCaption` varchar(100) NOT NULL default '',
  `unk1` varchar(100) NOT NULL default '',
  `faction` smallint(5) unsigned NOT NULL default '0',
  `flags` int(10) unsigned NOT NULL default '0',
  `size` float NOT NULL default '1',
  `questItem1` int(11) unsigned NOT NULL default '0',
  `questItem2` int(11) unsigned NOT NULL default '0',
  `questItem3` int(11) unsigned NOT NULL default '0',
  `questItem4` int(11) unsigned NOT NULL default '0',
  `questItem5` int(11) unsigned NOT NULL default '0',
  `questItem6` int(11) unsigned NOT NULL default '0',
  `data0` int(10) unsigned NOT NULL default '0',
  `data1` int(10) unsigned NOT NULL default '0',
  `data2` int(10) unsigned NOT NULL default '0',
  `data3` int(10) unsigned NOT NULL default '0',
  `data4` int(10) unsigned NOT NULL default '0',
  `data5` int(10) unsigned NOT NULL default '0',
  `data6` int(10) unsigned NOT NULL default '0',
  `data7` int(10) unsigned NOT NULL default '0',
  `data8` int(10) unsigned NOT NULL default '0',
  `data9` int(10) unsigned NOT NULL default '0',
  `data10` int(10) unsigned NOT NULL default '0',
  `data11` int(10) unsigned NOT NULL default '0',
  `data12` int(10) unsigned NOT NULL default '0',
  `data13` int(10) unsigned NOT NULL default '0',
  `data14` int(10) unsigned NOT NULL default '0',
  `data15` int(10) unsigned NOT NULL default '0',
  `data16` int(10) unsigned NOT NULL default '0',
  `data17` int(10) unsigned NOT NULL default '0',
  `data18` int(10) unsigned NOT NULL default '0',
  `data19` int(10) unsigned NOT NULL default '0',
  `data20` int(10) unsigned NOT NULL default '0',
  `data21` int(10) unsigned NOT NULL default '0',
  `data22` int(10) unsigned NOT NULL default '0',
  `data23` int(10) unsigned NOT NULL default '0',
  `ScriptName` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gossip_menu`
--

DROP TABLE IF EXISTS `gossip_menu`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gossip_menu` (
  `entry` smallint(6) unsigned NOT NULL default '0',
  `text_id` mediumint(8) unsigned NOT NULL default '0',
  `cond_1` tinyint(3) unsigned NOT NULL default '0',
  `cond_1_val_1` mediumint(8) unsigned NOT NULL default '0',
  `cond_1_val_2` mediumint(8) unsigned NOT NULL default '0',
  `cond_2` tinyint(3) unsigned NOT NULL default '0',
  `cond_2_val_1` mediumint(8) unsigned NOT NULL default '0',
  `cond_2_val_2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY (`entry`, `text_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Gossip System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gossip_menu_option`
--

DROP TABLE IF EXISTS `gossip_menu_option`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gossip_menu_option` (
  `menu_id` smallint(6) unsigned NOT NULL default '0',
  `id` smallint(6) unsigned NOT NULL default '0',
  `option_icon` mediumint(8) unsigned NOT NULL default '0',
  `option_text` text,
  `option_id` tinyint(3) unsigned NOT NULL default '0',
  `npc_option_npcflag` int(10) unsigned NOT NULL default '0',
  `action_menu_id` mediumint(8) unsigned NOT NULL default '0',
  `action_poi_id` mediumint(8) unsigned NOT NULL default '0',
  `action_script_id` mediumint(8) unsigned NOT NULL default '0',
  `box_coded` tinyint(3) unsigned NOT NULL default '0',
  `box_money` int(11) unsigned NOT NULL default '0',
  `box_text` text,
  `cond_1` tinyint(3) unsigned NOT NULL default '0',
  `cond_1_val_1` mediumint(8) unsigned NOT NULL default '0',
  `cond_1_val_2` mediumint(8) unsigned NOT NULL default '0',
  `cond_2` tinyint(3) unsigned NOT NULL default '0',
  `cond_2_val_1` mediumint(8) unsigned NOT NULL default '0',
  `cond_2_val_2` mediumint(8) unsigned NOT NULL default '0',
  `cond_3` tinyint(3) unsigned NOT NULL default '0',
  `cond_3_val_1` mediumint(8) unsigned NOT NULL default '0',
  `cond_3_val_2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY (`menu_id`, `id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Gossip System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gossip_scripts`
--

DROP TABLE IF EXISTS `gossip_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gossip_scripts` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `delay` int(10) unsigned NOT NULL default '0',
  `command` mediumint(8) unsigned NOT NULL default '0',
  `datalong` mediumint(8) unsigned NOT NULL default '0',
  `datalong2` int(10) unsigned NOT NULL default '0',
  `dataint` int(11) NOT NULL default '0',
  `x` float NOT NULL default '0',
  `y` float NOT NULL default '0',
  `z` float NOT NULL default '0',
  `o` float NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Gossip System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `instance_template`
--

DROP TABLE IF EXISTS `instance_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `instance_template` (
  `map` smallint(5) unsigned NOT NULL,
  `parent` int(10) unsigned NOT NULL,
  `levelMin` tinyint(3) unsigned NOT NULL default '0',
  `levelMax` tinyint(3) unsigned NOT NULL default '0',
  `startLocX` float default NULL,
  `startLocY` float default NULL,
  `startLocZ` float default NULL,
  `startLocO` float default NULL,
  `script` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `item_enchantment_template`
--

DROP TABLE IF EXISTS `item_enchantment_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `item_enchantment_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `ench` mediumint(8) unsigned NOT NULL default '0',
  `chance` float unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`ench`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item Random Enchantment System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `item_loot_template`
--

DROP TABLE IF EXISTS `item_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `item_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `ChanceOrQuestChance` float NOT NULL default '100',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `mincountOrRef` mediumint(9) NOT NULL default '1',
  `maxcount` smallint(5) unsigned NOT NULL default '1',
  `lootcondition` tinyint(3) unsigned NOT NULL default '0',
  `condition_value1` mediumint(8) unsigned NOT NULL default '0',
  `condition_value2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `item_required_target`
--

DROP TABLE IF EXISTS `item_required_target`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `item_required_target` (
  `entry` mediumint(8) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL default '0',
  `targetEntry` mediumint(8) unsigned NOT NULL default '0',
  UNIQUE KEY `entry_type_target` (`entry`,`type`,`targetEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `item_template`
--

DROP TABLE IF EXISTS `item_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `item_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `subclass` tinyint(3) unsigned NOT NULL default '0',
  `unk0` int(11) NOT NULL default '-1',
  `name` varchar(255) NOT NULL default '',
  `displayid` mediumint(8) unsigned NOT NULL default '0',
  `Quality` tinyint(3) unsigned NOT NULL default '0',
  `Flags` int(10) unsigned NOT NULL default '0',
  `Faction` int(11) UNSIGNED NOT NULL default '0',
  `BuyCount` tinyint(3) unsigned NOT NULL default '1',
  `BuyPrice` int(10) unsigned NOT NULL default '0',
  `SellPrice` int(10) unsigned NOT NULL default '0',
  `InventoryType` tinyint(3) unsigned NOT NULL default '0',
  `AllowableClass` int signed NOT NULL default '-1',
  `AllowableRace` int signed NOT NULL default '-1',
  `ItemLevel` smallint(5) unsigned NOT NULL default '0',
  `RequiredLevel` tinyint(3) unsigned NOT NULL default '0',
  `RequiredSkill` smallint(5) unsigned NOT NULL default '0',
  `RequiredSkillRank` smallint(5) unsigned NOT NULL default '0',
  `requiredspell` mediumint(8) unsigned NOT NULL default '0',
  `requiredhonorrank` mediumint(8) unsigned NOT NULL default '0',
  `RequiredCityRank` mediumint(8) unsigned NOT NULL default '0',
  `RequiredReputationFaction` smallint(5) unsigned NOT NULL default '0',
  `RequiredReputationRank` smallint(5) unsigned NOT NULL default '0',
  `maxcount` smallint(5) NOT NULL default '-1',
  `stackable` int NOT NULL default '1',
  `ContainerSlots` tinyint(3) unsigned NOT NULL default '0',
  `StatsCount` tinyint(3) unsigned NOT NULL default '0',
  `stat_type1` tinyint(3) unsigned NOT NULL default '0',
  `stat_value1` smallint(6) NOT NULL default '0',
  `stat_type2` tinyint(3) unsigned NOT NULL default '0',
  `stat_value2` smallint(6) NOT NULL default '0',
  `stat_type3` tinyint(3) unsigned NOT NULL default '0',
  `stat_value3` smallint(6) NOT NULL default '0',
  `stat_type4` tinyint(3) unsigned NOT NULL default '0',
  `stat_value4` smallint(6) NOT NULL default '0',
  `stat_type5` tinyint(3) unsigned NOT NULL default '0',
  `stat_value5` smallint(6) NOT NULL default '0',
  `stat_type6` tinyint(3) unsigned NOT NULL default '0',
  `stat_value6` smallint(6) NOT NULL default '0',
  `stat_type7` tinyint(3) unsigned NOT NULL default '0',
  `stat_value7` smallint(6) NOT NULL default '0',
  `stat_type8` tinyint(3) unsigned NOT NULL default '0',
  `stat_value8` smallint(6) NOT NULL default '0',
  `stat_type9` tinyint(3) unsigned NOT NULL default '0',
  `stat_value9` smallint(6) NOT NULL default '0',
  `stat_type10` tinyint(3) unsigned NOT NULL default '0',
  `stat_value10` smallint(6) NOT NULL default '0',
  `ScalingStatDistribution` smallint(6) NOT NULL default '0',
  `ScalingStatValue` int(6) unsigned NOT NULL default '0',
  `dmg_min1` float NOT NULL default '0',
  `dmg_max1` float NOT NULL default '0',
  `dmg_type1` tinyint(3) unsigned NOT NULL default '0',
  `dmg_min2` float NOT NULL default '0',
  `dmg_max2` float NOT NULL default '0',
  `dmg_type2` tinyint(3) unsigned NOT NULL default '0',
  `armor` smallint(5) unsigned NOT NULL default '0',
  `holy_res` tinyint(3) unsigned NOT NULL default '0',
  `fire_res` tinyint(3) unsigned NOT NULL default '0',
  `nature_res` tinyint(3) unsigned NOT NULL default '0',
  `frost_res` tinyint(3) unsigned NOT NULL default '0',
  `shadow_res` tinyint(3) unsigned NOT NULL default '0',
  `arcane_res` tinyint(3) unsigned NOT NULL default '0',
  `delay` smallint(5) unsigned NOT NULL default '1000',
  `ammo_type` tinyint(3) unsigned NOT NULL default '0',
  `RangedModRange` float NOT NULL default '0',
  `spellid_1` mediumint(8) unsigned NOT NULL default '0',
  `spelltrigger_1` tinyint(3) unsigned NOT NULL default '0',
  `spellcharges_1` tinyint(4) NOT NULL default '0',
  `spellppmRate_1` float NOT NULL default '0',
  `spellcooldown_1` int(11) NOT NULL default '-1',
  `spellcategory_1` smallint(5) unsigned NOT NULL default '0',
  `spellcategorycooldown_1` int(11) NOT NULL default '-1',
  `spellid_2` mediumint(8) unsigned NOT NULL default '0',
  `spelltrigger_2` tinyint(3) unsigned NOT NULL default '0',
  `spellcharges_2` tinyint(4) NOT NULL default '0',
  `spellppmRate_2` float NOT NULL default '0',
  `spellcooldown_2` int(11) NOT NULL default '-1',
  `spellcategory_2` smallint(5) unsigned NOT NULL default '0',
  `spellcategorycooldown_2` int(11) NOT NULL default '-1',
  `spellid_3` mediumint(8) unsigned NOT NULL default '0',
  `spelltrigger_3` tinyint(3) unsigned NOT NULL default '0',
  `spellcharges_3` tinyint(4) NOT NULL default '0',
  `spellppmRate_3` float NOT NULL default '0',
  `spellcooldown_3` int(11) NOT NULL default '-1',
  `spellcategory_3` smallint(5) unsigned NOT NULL default '0',
  `spellcategorycooldown_3` int(11) NOT NULL default '-1',
  `spellid_4` mediumint(8) unsigned NOT NULL default '0',
  `spelltrigger_4` tinyint(3) unsigned NOT NULL default '0',
  `spellcharges_4` tinyint(4) NOT NULL default '0',
  `spellppmRate_4` float NOT NULL default '0',
  `spellcooldown_4` int(11) NOT NULL default '-1',
  `spellcategory_4` smallint(5) unsigned NOT NULL default '0',
  `spellcategorycooldown_4` int(11) NOT NULL default '-1',
  `spellid_5` mediumint(8) unsigned NOT NULL default '0',
  `spelltrigger_5` tinyint(3) unsigned NOT NULL default '0',
  `spellcharges_5` tinyint(4) NOT NULL default '0',
  `spellppmRate_5` float NOT NULL default '0',
  `spellcooldown_5` int(11) NOT NULL default '-1',
  `spellcategory_5` smallint(5) unsigned NOT NULL default '0',
  `spellcategorycooldown_5` int(11) NOT NULL default '-1',
  `bonding` tinyint(3) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '',
  `PageText` mediumint(8) unsigned NOT NULL default '0',
  `LanguageID` tinyint(3) unsigned NOT NULL default '0',
  `PageMaterial` tinyint(3) unsigned NOT NULL default '0',
  `startquest` mediumint(8) unsigned NOT NULL default '0',
  `lockid` mediumint(8) unsigned NOT NULL default '0',
  `Material` tinyint(4) NOT NULL default '0',
  `sheath` tinyint(3) unsigned NOT NULL default '0',
  `RandomProperty` mediumint(8) unsigned NOT NULL default '0',
  `RandomSuffix` mediumint(8) unsigned NOT NULL default '0',
  `block` mediumint(8) unsigned NOT NULL default '0',
  `itemset` mediumint(8) unsigned NOT NULL default '0',
  `MaxDurability` smallint(5) unsigned NOT NULL default '0',
  `area` mediumint(8) unsigned NOT NULL default '0',
  `Map` smallint(6) NOT NULL default '0',
  `BagFamily` mediumint(9) NOT NULL default '0',
  `TotemCategory` mediumint(9) NOT NULL default '0',
  `socketColor_1` tinyint(4) NOT NULL default '0',
  `socketContent_1` mediumint(9) NOT NULL default '0',
  `socketColor_2` tinyint(4) NOT NULL default '0',
  `socketContent_2` mediumint(9) NOT NULL default '0',
  `socketColor_3` tinyint(4) NOT NULL default '0',
  `socketContent_3` mediumint(9) NOT NULL default '0',
  `socketBonus` mediumint(9) NOT NULL default '0',
  `GemProperties` mediumint(9) NOT NULL default '0',
  `RequiredDisenchantSkill` smallint(6) NOT NULL default '-1',
  `ArmorDamageModifier` float NOT NULL default '0',
  `Duration` int(11) NOT NULL default '0' COMMENT 'Duration in seconds. Negative value means realtime, postive value ingame time',
  `ItemLimitCategory` smallint(6) NOT NULL default '0',
  `HolidayId` int(11) unsigned NOT NULL default '0',
  `ScriptName` varchar(64) NOT NULL default '',
  `DisenchantID` mediumint(8) unsigned NOT NULL default '0',
  `FoodType` tinyint(3) unsigned NOT NULL default '0',
  `minMoneyLoot` int(10) unsigned NOT NULL default '0',
  `maxMoneyLoot` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`),
  KEY `idx_name` (`name`),
  KEY `items_index` (`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locales_achievement_reward`
--

DROP TABLE IF EXISTS `locales_achievement_reward`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_achievement_reward` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `subject_loc1` varchar(100) NOT NULL default '',
  `subject_loc2` varchar(100) NOT NULL default '',
  `subject_loc3` varchar(100) NOT NULL default '',
  `subject_loc4` varchar(100) NOT NULL default '',
  `subject_loc5` varchar(100) NOT NULL default '',
  `subject_loc6` varchar(100) NOT NULL default '',
  `subject_loc7` varchar(100) NOT NULL default '',
  `subject_loc8` varchar(100) NOT NULL default '',
  `text_loc1` text,
  `text_loc2` text,
  `text_loc3` text,
  `text_loc4` text,
  `text_loc5` text,
  `text_loc6` text,
  `text_loc7` text,
  `text_loc8` text,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locales_creature`
--

DROP TABLE IF EXISTS `locales_creature`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_creature` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `name_loc1` varchar(100) NOT NULL default '',
  `name_loc2` varchar(100) NOT NULL default '',
  `name_loc3` varchar(100) NOT NULL default '',
  `name_loc4` varchar(100) NOT NULL default '',
  `name_loc5` varchar(100) NOT NULL default '',
  `name_loc6` varchar(100) NOT NULL default '',
  `name_loc7` varchar(100) NOT NULL default '',
  `name_loc8` varchar(100) NOT NULL default '',
  `subname_loc1` varchar(100) default NULL,
  `subname_loc2` varchar(100) default NULL,
  `subname_loc3` varchar(100) default NULL,
  `subname_loc4` varchar(100) default NULL,
  `subname_loc5` varchar(100) default NULL,
  `subname_loc6` varchar(100) default NULL,
  `subname_loc7` varchar(100) default NULL,
  `subname_loc8` varchar(100) default NULL,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locales_gameobject`
--

DROP TABLE IF EXISTS `locales_gameobject`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_gameobject` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `name_loc1` varchar(100) NOT NULL default '',
  `name_loc2` varchar(100) NOT NULL default '',
  `name_loc3` varchar(100) NOT NULL default '',
  `name_loc4` varchar(100) NOT NULL default '',
  `name_loc5` varchar(100) NOT NULL default '',
  `name_loc6` varchar(100) NOT NULL default '',
  `name_loc7` varchar(100) NOT NULL default '',
  `name_loc8` varchar(100) NOT NULL default '',
  `castbarcaption_loc1` varchar(100) NOT NULL default '',
  `castbarcaption_loc2` varchar(100) NOT NULL default '',
  `castbarcaption_loc3` varchar(100) NOT NULL default '',
  `castbarcaption_loc4` varchar(100) NOT NULL default '',
  `castbarcaption_loc5` varchar(100) NOT NULL default '',
  `castbarcaption_loc6` varchar(100) NOT NULL default '',
  `castbarcaption_loc7` varchar(100) NOT NULL default '',
  `castbarcaption_loc8` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locales_gossip_menu_option`
--

DROP TABLE IF EXISTS `locales_gossip_menu_option`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_gossip_menu_option` (
  `menu_id` smallint(6) unsigned NOT NULL default '0',
  `id` smallint(6) unsigned NOT NULL default '0',
  `option_text_loc1` text,
  `option_text_loc2` text,
  `option_text_loc3` text,
  `option_text_loc4` text,
  `option_text_loc5` text,
  `option_text_loc6` text,
  `option_text_loc7` text,
  `option_text_loc8` text,
  `box_text_loc1` text,
  `box_text_loc2` text,
  `box_text_loc3` text,
  `box_text_loc4` text,
  `box_text_loc5` text,
  `box_text_loc6` text,
  `box_text_loc7` text,
  `box_text_loc8` text,
  PRIMARY KEY  (`menu_id`, `id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locales_item`
--

DROP TABLE IF EXISTS `locales_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_item` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `name_loc1` varchar(100) NOT NULL default '',
  `name_loc2` varchar(100) NOT NULL default '',
  `name_loc3` varchar(100) NOT NULL default '',
  `name_loc4` varchar(100) NOT NULL default '',
  `name_loc5` varchar(100) NOT NULL default '',
  `name_loc6` varchar(100) NOT NULL default '',
  `name_loc7` varchar(100) NOT NULL default '',
  `name_loc8` varchar(100) NOT NULL default '',
  `description_loc1` varchar(255) default NULL,
  `description_loc2` varchar(255) default NULL,
  `description_loc3` varchar(255) default NULL,
  `description_loc4` varchar(255) default NULL,
  `description_loc5` varchar(255) default NULL,
  `description_loc6` varchar(255) default NULL,
  `description_loc7` varchar(255) default NULL,
  `description_loc8` varchar(255) default NULL,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locales_npc_text`
--

DROP TABLE IF EXISTS `locales_npc_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_npc_text` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `Text0_0_loc1` longtext,
  `Text0_0_loc2` longtext,
  `Text0_0_loc3` longtext,
  `Text0_0_loc4` longtext,
  `Text0_0_loc5` longtext,
  `Text0_0_loc6` longtext,
  `Text0_0_loc7` longtext,
  `Text0_0_loc8` longtext,
  `Text0_1_loc1` longtext,
  `Text0_1_loc2` longtext,
  `Text0_1_loc3` longtext,
  `Text0_1_loc4` longtext,
  `Text0_1_loc5` longtext,
  `Text0_1_loc6` longtext,
  `Text0_1_loc7` longtext,
  `Text0_1_loc8` longtext,
  `Text1_0_loc1` longtext,
  `Text1_0_loc2` longtext,
  `Text1_0_loc3` longtext,
  `Text1_0_loc4` longtext,
  `Text1_0_loc5` longtext,
  `Text1_0_loc6` longtext,
  `Text1_0_loc7` longtext,
  `Text1_0_loc8` longtext,
  `Text1_1_loc1` longtext,
  `Text1_1_loc2` longtext,
  `Text1_1_loc3` longtext,
  `Text1_1_loc4` longtext,
  `Text1_1_loc5` longtext,
  `Text1_1_loc6` longtext,
  `Text1_1_loc7` longtext,
  `Text1_1_loc8` longtext,
  `Text2_0_loc1` longtext,
  `Text2_0_loc2` longtext,
  `Text2_0_loc3` longtext,
  `Text2_0_loc4` longtext,
  `Text2_0_loc5` longtext,
  `Text2_0_loc6` longtext,
  `Text2_0_loc7` longtext,
  `Text2_0_loc8` longtext,
  `Text2_1_loc1` longtext,
  `Text2_1_loc2` longtext,
  `Text2_1_loc3` longtext,
  `Text2_1_loc4` longtext,
  `Text2_1_loc5` longtext,
  `Text2_1_loc6` longtext,
  `Text2_1_loc7` longtext,
  `Text2_1_loc8` longtext,
  `Text3_0_loc1` longtext,
  `Text3_0_loc2` longtext,
  `Text3_0_loc3` longtext,
  `Text3_0_loc4` longtext,
  `Text3_0_loc5` longtext,
  `Text3_0_loc6` longtext,
  `Text3_0_loc7` longtext,
  `Text3_0_loc8` longtext,
  `Text3_1_loc1` longtext,
  `Text3_1_loc2` longtext,
  `Text3_1_loc3` longtext,
  `Text3_1_loc4` longtext,
  `Text3_1_loc5` longtext,
  `Text3_1_loc6` longtext,
  `Text3_1_loc7` longtext,
  `Text3_1_loc8` longtext,
  `Text4_0_loc1` longtext,
  `Text4_0_loc2` longtext,
  `Text4_0_loc3` longtext,
  `Text4_0_loc4` longtext,
  `Text4_0_loc5` longtext,
  `Text4_0_loc6` longtext,
  `Text4_0_loc7` longtext,
  `Text4_0_loc8` longtext,
  `Text4_1_loc1` longtext,
  `Text4_1_loc2` longtext,
  `Text4_1_loc3` longtext,
  `Text4_1_loc4` longtext,
  `Text4_1_loc5` longtext,
  `Text4_1_loc6` longtext,
  `Text4_1_loc7` longtext,
  `Text4_1_loc8` longtext,
  `Text5_0_loc1` longtext,
  `Text5_0_loc2` longtext,
  `Text5_0_loc3` longtext,
  `Text5_0_loc4` longtext,
  `Text5_0_loc5` longtext,
  `Text5_0_loc6` longtext,
  `Text5_0_loc7` longtext,
  `Text5_0_loc8` longtext,
  `Text5_1_loc1` longtext,
  `Text5_1_loc2` longtext,
  `Text5_1_loc3` longtext,
  `Text5_1_loc4` longtext,
  `Text5_1_loc5` longtext,
  `Text5_1_loc6` longtext,
  `Text5_1_loc7` longtext,
  `Text5_1_loc8` longtext,
  `Text6_0_loc1` longtext,
  `Text6_0_loc2` longtext,
  `Text6_0_loc3` longtext,
  `Text6_0_loc4` longtext,
  `Text6_0_loc5` longtext,
  `Text6_0_loc6` longtext,
  `Text6_0_loc7` longtext,
  `Text6_0_loc8` longtext,
  `Text6_1_loc1` longtext,
  `Text6_1_loc2` longtext,
  `Text6_1_loc3` longtext,
  `Text6_1_loc4` longtext,
  `Text6_1_loc5` longtext,
  `Text6_1_loc6` longtext,
  `Text6_1_loc7` longtext,
  `Text6_1_loc8` longtext,
  `Text7_0_loc1` longtext,
  `Text7_0_loc2` longtext,
  `Text7_0_loc3` longtext,
  `Text7_0_loc4` longtext,
  `Text7_0_loc5` longtext,
  `Text7_0_loc6` longtext,
  `Text7_0_loc7` longtext,
  `Text7_0_loc8` longtext,
  `Text7_1_loc1` longtext,
  `Text7_1_loc2` longtext,
  `Text7_1_loc3` longtext,
  `Text7_1_loc4` longtext,
  `Text7_1_loc5` longtext,
  `Text7_1_loc6` longtext,
  `Text7_1_loc7` longtext,
  `Text7_1_loc8` longtext,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locales_page_text`
--

DROP TABLE IF EXISTS `locales_page_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_page_text` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `Text_loc1` longtext,
  `Text_loc2` longtext,
  `Text_loc3` longtext,
  `Text_loc4` longtext,
  `Text_loc5` longtext,
  `Text_loc6` longtext,
  `Text_loc7` longtext,
  `Text_loc8` longtext,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locales_points_of_interest`
--

DROP TABLE IF EXISTS `locales_points_of_interest`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_points_of_interest` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `icon_name_loc1` text,
  `icon_name_loc2` text,
  `icon_name_loc3` text,
  `icon_name_loc4` text,
  `icon_name_loc5` text,
  `icon_name_loc6` text,
  `icon_name_loc7` text,
  `icon_name_loc8` text,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locales_quest`
--

DROP TABLE IF EXISTS `locales_quest`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_quest` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `Title_loc1` text,
  `Title_loc2` text,
  `Title_loc3` text,
  `Title_loc4` text,
  `Title_loc5` text,
  `Title_loc6` text,
  `Title_loc7` text,
  `Title_loc8` text,
  `Details_loc1` text,
  `Details_loc2` text,
  `Details_loc3` text,
  `Details_loc4` text,
  `Details_loc5` text,
  `Details_loc6` text,
  `Details_loc7` text,
  `Details_loc8` text,
  `Objectives_loc1` text,
  `Objectives_loc2` text,
  `Objectives_loc3` text,
  `Objectives_loc4` text,
  `Objectives_loc5` text,
  `Objectives_loc6` text,
  `Objectives_loc7` text,
  `Objectives_loc8` text,
  `OfferRewardText_loc1` text,
  `OfferRewardText_loc2` text,
  `OfferRewardText_loc3` text,
  `OfferRewardText_loc4` text,
  `OfferRewardText_loc5` text,
  `OfferRewardText_loc6` text,
  `OfferRewardText_loc7` text,
  `OfferRewardText_loc8` text,
  `RequestItemsText_loc1` text,
  `RequestItemsText_loc2` text,
  `RequestItemsText_loc3` text,
  `RequestItemsText_loc4` text,
  `RequestItemsText_loc5` text,
  `RequestItemsText_loc6` text,
  `RequestItemsText_loc7` text,
  `RequestItemsText_loc8` text,
  `EndText_loc1` text,
  `EndText_loc2` text,
  `EndText_loc3` text,
  `EndText_loc4` text,
  `EndText_loc5` text,
  `EndText_loc6` text,
  `EndText_loc7` text,
  `EndText_loc8` text,
  `ObjectiveText1_loc1` text,
  `ObjectiveText1_loc2` text,
  `ObjectiveText1_loc3` text,
  `ObjectiveText1_loc4` text,
  `ObjectiveText1_loc5` text,
  `ObjectiveText1_loc6` text,
  `ObjectiveText1_loc7` text,
  `ObjectiveText1_loc8` text,
  `ObjectiveText2_loc1` text,
  `ObjectiveText2_loc2` text,
  `ObjectiveText2_loc3` text,
  `ObjectiveText2_loc4` text,
  `ObjectiveText2_loc5` text,
  `ObjectiveText2_loc6` text,
  `ObjectiveText2_loc7` text,
  `ObjectiveText2_loc8` text,
  `ObjectiveText3_loc1` text,
  `ObjectiveText3_loc2` text,
  `ObjectiveText3_loc3` text,
  `ObjectiveText3_loc4` text,
  `ObjectiveText3_loc5` text,
  `ObjectiveText3_loc6` text,
  `ObjectiveText3_loc7` text,
  `ObjectiveText3_loc8` text,
  `ObjectiveText4_loc1` text,
  `ObjectiveText4_loc2` text,
  `ObjectiveText4_loc3` text,
  `ObjectiveText4_loc4` text,
  `ObjectiveText4_loc5` text,
  `ObjectiveText4_loc6` text,
  `ObjectiveText4_loc7` text,
  `ObjectiveText4_loc8` text,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mail_level_reward`
--

DROP TABLE IF EXISTS `mail_level_reward`;
CREATE TABLE `mail_level_reward` (
  `level` tinyint(3) unsigned NOT NULL default '0',
  `raceMask` mediumint(8) unsigned NOT NULL default '0',
  `mailTemplateId` mediumint(8) unsigned NOT NULL default '0',
  `senderEntry`    mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`level`,`raceMask`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Mail System';

--
-- Table structure for table `mail_loot_template`
--

DROP TABLE IF EXISTS `mail_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mail_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `ChanceOrQuestChance` float NOT NULL default '100',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `mincountOrRef` mediumint(9) NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `lootcondition` tinyint(3) unsigned NOT NULL default '0',
  `condition_value1` mediumint(8) unsigned NOT NULL default '0',
  `condition_value2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `milling_loot_template`
--

DROP TABLE IF EXISTS `milling_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `milling_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `ChanceOrQuestChance` float NOT NULL default '100',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `mincountOrRef` mediumint(9) NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `lootcondition` tinyint(3) unsigned NOT NULL default '0',
  `condition_value1` mediumint(8) unsigned NOT NULL default '0',
  `condition_value2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `npc_gossip`
--

DROP TABLE IF EXISTS `npc_gossip`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `npc_gossip` (
  `npc_guid` int(10) unsigned NOT NULL default '0',
  `textid` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`npc_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `npc_spellclick_spells`
--

DROP TABLE IF EXISTS `npc_spellclick_spells`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `npc_spellclick_spells` (
  `npc_entry` int(10) unsigned NOT NULL COMMENT 'reference to creature_template',
  `spell_id` int(10) unsigned NOT NULL COMMENT 'spell which should be casted ',
  `quest_start`        mediumint(8) unsigned NOT NULL COMMENT 'reference to quest_template',
  `quest_start_active` tinyint(1) unsigned NOT NULL default '0',
  `quest_end`          mediumint(8) unsigned NOT NULL default '0',  
  `cast_flags` tinyint(3) unsigned NOT NULL COMMENT 'first bit defines caster: 1=player, 0=creature; second bit defines target, same mapping as caster bit',
  `aura_required` int(11) unsigned NOT NULL default '0' COMMENT 'player without aura cant click',
  `aura_forbidden` int(11) unsigned NOT NULL default '0' COMMENT 'player with aura cant click',
  `user_type` smallint(3) unsigned NOT NULL default '0' COMMENT 'relation with summoner: 0-no 1-friendly 2-raid 3-party player can click'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `npc_text`
--

DROP TABLE IF EXISTS `npc_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `npc_text` (
  `ID` mediumint(8) unsigned NOT NULL default '0',
  `text0_0` longtext,
  `text0_1` longtext,
  `lang0` tinyint(3) unsigned NOT NULL default '0',
  `prob0` float NOT NULL default '0',
  `em0_0` smallint(5) unsigned NOT NULL default '0',
  `em0_1` smallint(5) unsigned NOT NULL default '0',
  `em0_2` smallint(5) unsigned NOT NULL default '0',
  `em0_3` smallint(5) unsigned NOT NULL default '0',
  `em0_4` smallint(5) unsigned NOT NULL default '0',
  `em0_5` smallint(5) unsigned NOT NULL default '0',
  `text1_0` longtext,
  `text1_1` longtext,
  `lang1` tinyint(3) unsigned NOT NULL default '0',
  `prob1` float NOT NULL default '0',
  `em1_0` smallint(5) unsigned NOT NULL default '0',
  `em1_1` smallint(5) unsigned NOT NULL default '0',
  `em1_2` smallint(5) unsigned NOT NULL default '0',
  `em1_3` smallint(5) unsigned NOT NULL default '0',
  `em1_4` smallint(5) unsigned NOT NULL default '0',
  `em1_5` smallint(5) unsigned NOT NULL default '0',
  `text2_0` longtext,
  `text2_1` longtext,
  `lang2` tinyint(3) unsigned NOT NULL default '0',
  `prob2` float NOT NULL default '0',
  `em2_0` smallint(5) unsigned NOT NULL default '0',
  `em2_1` smallint(5) unsigned NOT NULL default '0',
  `em2_2` smallint(5) unsigned NOT NULL default '0',
  `em2_3` smallint(5) unsigned NOT NULL default '0',
  `em2_4` smallint(5) unsigned NOT NULL default '0',
  `em2_5` smallint(5) unsigned NOT NULL default '0',
  `text3_0` longtext,
  `text3_1` longtext,
  `lang3` tinyint(3) unsigned NOT NULL default '0',
  `prob3` float NOT NULL default '0',
  `em3_0` smallint(5) unsigned NOT NULL default '0',
  `em3_1` smallint(5) unsigned NOT NULL default '0',
  `em3_2` smallint(5) unsigned NOT NULL default '0',
  `em3_3` smallint(5) unsigned NOT NULL default '0',
  `em3_4` smallint(5) unsigned NOT NULL default '0',
  `em3_5` smallint(5) unsigned NOT NULL default '0',
  `text4_0` longtext,
  `text4_1` longtext,
  `lang4` tinyint(3) unsigned NOT NULL default '0',
  `prob4` float NOT NULL default '0',
  `em4_0` smallint(5) unsigned NOT NULL default '0',
  `em4_1` smallint(5) unsigned NOT NULL default '0',
  `em4_2` smallint(5) unsigned NOT NULL default '0',
  `em4_3` smallint(5) unsigned NOT NULL default '0',
  `em4_4` smallint(5) unsigned NOT NULL default '0',
  `em4_5` smallint(5) unsigned NOT NULL default '0',
  `text5_0` longtext,
  `text5_1` longtext,
  `lang5` tinyint(3) unsigned NOT NULL default '0',
  `prob5` float NOT NULL default '0',
  `em5_0` smallint(5) unsigned NOT NULL default '0',
  `em5_1` smallint(5) unsigned NOT NULL default '0',
  `em5_2` smallint(5) unsigned NOT NULL default '0',
  `em5_3` smallint(5) unsigned NOT NULL default '0',
  `em5_4` smallint(5) unsigned NOT NULL default '0',
  `em5_5` smallint(5) unsigned NOT NULL default '0',
  `text6_0` longtext,
  `text6_1` longtext,
  `lang6` tinyint(3) unsigned NOT NULL default '0',
  `prob6` float NOT NULL default '0',
  `em6_0` smallint(5) unsigned NOT NULL default '0',
  `em6_1` smallint(5) unsigned NOT NULL default '0',
  `em6_2` smallint(5) unsigned NOT NULL default '0',
  `em6_3` smallint(5) unsigned NOT NULL default '0',
  `em6_4` smallint(5) unsigned NOT NULL default '0',
  `em6_5` smallint(5) unsigned NOT NULL default '0',
  `text7_0` longtext,
  `text7_1` longtext,
  `lang7` tinyint(3) unsigned NOT NULL default '0',
  `prob7` float NOT NULL default '0',
  `em7_0` smallint(5) unsigned NOT NULL default '0',
  `em7_1` smallint(5) unsigned NOT NULL default '0',
  `em7_2` smallint(5) unsigned NOT NULL default '0',
  `em7_3` smallint(5) unsigned NOT NULL default '0',
  `em7_4` smallint(5) unsigned NOT NULL default '0',
  `em7_5` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `npc_trainer`
--

DROP TABLE IF EXISTS `npc_trainer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `npc_trainer` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `spell` mediumint(8) unsigned NOT NULL default '0',
  `spellcost` int(10) unsigned NOT NULL default '0',
  `reqskill` smallint(5) unsigned NOT NULL default '0',
  `reqskillvalue` smallint(5) unsigned NOT NULL default '0',
  `reqlevel` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `npc_vendor`
--

DROP TABLE IF EXISTS `npc_vendor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `npc_vendor` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `maxcount` tinyint(3) unsigned NOT NULL default '0',
  `incrtime` int(10) unsigned NOT NULL default '0',
  `ExtendedCost` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Npc System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `page_text`
--

DROP TABLE IF EXISTS `page_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `page_text` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `text` longtext NOT NULL,
  `next_page` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Item System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pet_levelstats`
--

DROP TABLE IF EXISTS `pet_levelstats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pet_levelstats` (
  `creature_entry` mediumint(8) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `hp` smallint(5) unsigned NOT NULL,
  `mana` smallint(5) unsigned NOT NULL,
  `armor` int(10) unsigned NOT NULL default '0',
  `str` smallint(5) unsigned NOT NULL,
  `agi` smallint(5) unsigned NOT NULL,
  `sta` smallint(5) unsigned NOT NULL,
  `inte` smallint(5) unsigned NOT NULL,
  `spi` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`creature_entry`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores pet levels stats.';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pet_name_generation`
--

DROP TABLE IF EXISTS `pet_name_generation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pet_name_generation` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `word` tinytext NOT NULL,
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `half` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=314 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pickpocketing_loot_template`
--

DROP TABLE IF EXISTS `pickpocketing_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pickpocketing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `ChanceOrQuestChance` float NOT NULL default '100',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `mincountOrRef` mediumint(9) NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `lootcondition` tinyint(3) unsigned NOT NULL default '0',
  `condition_value1` mediumint(8) unsigned NOT NULL default '0',
  `condition_value2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pickpocketing_loot_template`
--

LOCK TABLES `pickpocketing_loot_template` WRITE;
/*!40000 ALTER TABLE `pickpocketing_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `pickpocketing_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_classlevelstats`
--

DROP TABLE IF EXISTS `player_classlevelstats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `player_classlevelstats` (
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `basehp` smallint(5) unsigned NOT NULL,
  `basemana` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores levels stats.';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `player_levelstats`
--

DROP TABLE IF EXISTS `player_levelstats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `player_levelstats` (
  `race` tinyint(3) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `str` tinyint(3) unsigned NOT NULL,
  `agi` tinyint(3) unsigned NOT NULL,
  `sta` tinyint(3) unsigned NOT NULL,
  `inte` tinyint(3) unsigned NOT NULL,
  `spi` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`race`,`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores levels stats.';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `player_xp_for_level`
--

DROP TABLE IF EXISTS `player_xp_for_level`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `player_xp_for_level` (
  `lvl` int(3) unsigned NOT NULL,
  `xp_for_next_level` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`lvl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `playercreateinfo`
--

DROP TABLE IF EXISTS `playercreateinfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `playercreateinfo` (
  `race` tinyint(3) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `map` smallint(5) unsigned NOT NULL default '0',
  `zone` mediumint(8) unsigned NOT NULL default '0',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  PRIMARY KEY  (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `playercreateinfo_action`
--

DROP TABLE IF EXISTS `playercreateinfo_action`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `playercreateinfo_action` (
  `race` tinyint(3) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `button` smallint(5) unsigned NOT NULL default '0',
  `action` smallint(5) unsigned NOT NULL default '0',
  `type` smallint(5) unsigned NOT NULL default '0',
  `misc` smallint(5) unsigned NOT NULL default '0',
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `playercreateinfo_item`
--

DROP TABLE IF EXISTS `playercreateinfo_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `playercreateinfo_item` (
  `race` tinyint(3) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `itemid` mediumint(8) unsigned NOT NULL default '0',
  `amount` tinyint(3) unsigned NOT NULL default '1',
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `playercreateinfo_spell`
--

DROP TABLE IF EXISTS `playercreateinfo_spell`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `playercreateinfo_spell` (
  `race` tinyint(3) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `Spell` mediumint(8) unsigned NOT NULL default '0',
  `Note` varchar(255) default NULL,
  PRIMARY KEY  (`race`,`class`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `playercreateinfo_spell_custom`
--

DROP TABLE IF EXISTS `playercreateinfo_spell_custom`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `playercreateinfo_spell_custom` (
  `race` tinyint(3) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `Spell` mediumint(8) unsigned NOT NULL default '0',
  `Note` varchar(255) default NULL,
  `Active` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`race`,`class`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `points_of_interest`
--

DROP TABLE IF EXISTS `points_of_interest`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `points_of_interest` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `x` float NOT NULL default '0',
  `y` float NOT NULL default '0',
  `icon` mediumint(8) unsigned NOT NULL default '0',
  `flags` mediumint(8) unsigned NOT NULL default '0',
  `data` mediumint(8) unsigned NOT NULL default '0',
  `icon_name` text NOT NULL,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pool_creature`
--

DROP TABLE IF EXISTS `pool_creature`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pool_creature` (
  `guid` int(10) unsigned NOT NULL default '0',
  `pool_entry` mediumint(8) unsigned NOT NULL default '0',
  `chance` float unsigned NOT NULL default '0',
  `comment` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`pool_entry`,`guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pool_gameobject`
--

DROP TABLE IF EXISTS `pool_gameobject`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pool_gameobject` (
  `guid` int(10) unsigned NOT NULL default '0',
  `pool_entry` mediumint(8) unsigned NOT NULL default '0',
  `chance` float unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`guid`,`pool_entry`),
  KEY `idx_guid` (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pool_pool`
--

DROP TABLE IF EXISTS `pool_pool`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pool_pool` (
  `pool_id` mediumint(8) unsigned NOT NULL default '0',
  `mother_pool` mediumint(8) unsigned NOT NULL default '0',
  `chance` float NOT NULL default '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`pool_id`,`mother_pool`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pool_template`
--

DROP TABLE IF EXISTS `pool_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pool_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Pool entry',
  `max_limit` int(10) unsigned NOT NULL default '0' COMMENT 'Max number of objects (0) is no limit',
  `comment` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prospecting_loot_template`
--

DROP TABLE IF EXISTS `prospecting_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `prospecting_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `ChanceOrQuestChance` float NOT NULL default '100',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `mincountOrRef` mediumint(9) NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `lootcondition` tinyint(3) unsigned NOT NULL default '0',
  `condition_value1` mediumint(8) unsigned NOT NULL default '0',
  `condition_value2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `quest_end_scripts`
--

DROP TABLE IF EXISTS `quest_end_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quest_end_scripts` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `delay` int(10) unsigned NOT NULL default '0',
  `command` mediumint(8) unsigned NOT NULL default '0',
  `datalong` mediumint(8) unsigned NOT NULL default '0',
  `datalong2` int(10) unsigned NOT NULL default '0',
  `dataint` int(11) NOT NULL default '0',
  `x` float NOT NULL default '0',
  `y` float NOT NULL default '0',
  `z` float NOT NULL default '0',
  `o` float NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `quest_start_scripts`
--

DROP TABLE IF EXISTS `quest_start_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quest_start_scripts` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `delay` int(10) unsigned NOT NULL default '0',
  `command` mediumint(8) unsigned NOT NULL default '0',
  `datalong` mediumint(8) unsigned NOT NULL default '0',
  `datalong2` int(10) unsigned NOT NULL default '0',
  `dataint` int(11) NOT NULL default '0',
  `x` float NOT NULL default '0',
  `y` float NOT NULL default '0',
  `z` float NOT NULL default '0',
  `o` float NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `quest_template`
--

DROP TABLE IF EXISTS `quest_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quest_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `Method` tinyint(3) unsigned NOT NULL default '2',
  `ZoneOrSort` smallint(6) NOT NULL default '0',
  `SkillOrClass` smallint(6) NOT NULL default '0',
  `MinLevel` tinyint(3) unsigned NOT NULL default '0',
  `QuestLevel` smallint(3) NOT NULL default '0',
  `Type` smallint(5) unsigned NOT NULL default '0',
  `RequiredRaces` smallint(5) unsigned NOT NULL default '0',
  `RequiredSkillValue` smallint(5) unsigned NOT NULL default '0',
  `RepObjectiveFaction` smallint(5) unsigned NOT NULL default '0',
  `RepObjectiveValue` mediumint(9) NOT NULL default '0',
  `RequiredMinRepFaction` smallint(5) unsigned NOT NULL default '0',
  `RequiredMinRepValue` mediumint(9) NOT NULL default '0',
  `RequiredMaxRepFaction` smallint(5) unsigned NOT NULL default '0',
  `RequiredMaxRepValue` mediumint(9) NOT NULL default '0',
  `SuggestedPlayers` tinyint(3) unsigned NOT NULL default '0',
  `LimitTime` int(10) unsigned NOT NULL default '0',
  `QuestFlags` smallint(5) unsigned NOT NULL default '0',
  `SpecialFlags` tinyint(3) unsigned NOT NULL default '0',
  `CharTitleId` tinyint(3) unsigned NOT NULL default '0',
  `PlayersSlain` tinyint(3) unsigned NOT NULL default '0',
  `BonusTalents` tinyint(3) unsigned NOT NULL default '0',
  `PrevQuestId` mediumint(9) NOT NULL default '0',
  `NextQuestId` mediumint(9) NOT NULL default '0',
  `ExclusiveGroup` mediumint(9) NOT NULL default '0',
  `NextQuestInChain` mediumint(8) unsigned NOT NULL default '0',
  `SrcItemId` mediumint(8) unsigned NOT NULL default '0',
  `SrcItemCount` tinyint(3) unsigned NOT NULL default '0',
  `SrcSpell` mediumint(8) unsigned NOT NULL default '0',
  `Title` text,
  `Details` text,
  `Objectives` text,
  `OfferRewardText` text,
  `RequestItemsText` text,
  `EndText` text,
  `ObjectiveText1` text,
  `ObjectiveText2` text,
  `ObjectiveText3` text,
  `ObjectiveText4` text,
  `ReqItemId1` mediumint(8) unsigned NOT NULL default '0',
  `ReqItemId2` mediumint(8) unsigned NOT NULL default '0',
  `ReqItemId3` mediumint(8) unsigned NOT NULL default '0',
  `ReqItemId4` mediumint(8) unsigned NOT NULL default '0',
  `ReqItemId5` mediumint(8) unsigned NOT NULL default '0',
  `ReqItemId6` mediumint(8) unsigned NOT NULL default '0',
  `ReqItemCount1` smallint(5) unsigned NOT NULL default '0',
  `ReqItemCount2` smallint(5) unsigned NOT NULL default '0',
  `ReqItemCount3` smallint(5) unsigned NOT NULL default '0',
  `ReqItemCount4` smallint(5) unsigned NOT NULL default '0',
  `ReqItemCount5` smallint(5) unsigned NOT NULL default '0',
  `ReqItemCount6` smallint(5) unsigned NOT NULL default '0',
  `ReqSourceId1` mediumint(8) unsigned NOT NULL default '0',
  `ReqSourceId2` mediumint(8) unsigned NOT NULL default '0',
  `ReqSourceId3` mediumint(8) unsigned NOT NULL default '0',
  `ReqSourceId4` mediumint(8) unsigned NOT NULL default '0',
  `ReqSourceCount1` smallint(5) unsigned NOT NULL default '0',
  `ReqSourceCount2` smallint(5) unsigned NOT NULL default '0',
  `ReqSourceCount3` smallint(5) unsigned NOT NULL default '0',
  `ReqSourceCount4` smallint(5) unsigned NOT NULL default '0',
  `ReqCreatureOrGOId1` mediumint(9) NOT NULL default '0',
  `ReqCreatureOrGOId2` mediumint(9) NOT NULL default '0',
  `ReqCreatureOrGOId3` mediumint(9) NOT NULL default '0',
  `ReqCreatureOrGOId4` mediumint(9) NOT NULL default '0',
  `ReqCreatureOrGOCount1` smallint(5) unsigned NOT NULL default '0',
  `ReqCreatureOrGOCount2` smallint(5) unsigned NOT NULL default '0',
  `ReqCreatureOrGOCount3` smallint(5) unsigned NOT NULL default '0',
  `ReqCreatureOrGOCount4` smallint(5) unsigned NOT NULL default '0',
  `ReqSpellCast1` mediumint(8) unsigned NOT NULL default '0',
  `ReqSpellCast2` mediumint(8) unsigned NOT NULL default '0',
  `ReqSpellCast3` mediumint(8) unsigned NOT NULL default '0',
  `ReqSpellCast4` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemId1` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemId2` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemId3` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemId4` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemId5` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemId6` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemCount1` smallint(5) unsigned NOT NULL default '0',
  `RewChoiceItemCount2` smallint(5) unsigned NOT NULL default '0',
  `RewChoiceItemCount3` smallint(5) unsigned NOT NULL default '0',
  `RewChoiceItemCount4` smallint(5) unsigned NOT NULL default '0',
  `RewChoiceItemCount5` smallint(5) unsigned NOT NULL default '0',
  `RewChoiceItemCount6` smallint(5) unsigned NOT NULL default '0',
  `RewItemId1` mediumint(8) unsigned NOT NULL default '0',
  `RewItemId2` mediumint(8) unsigned NOT NULL default '0',
  `RewItemId3` mediumint(8) unsigned NOT NULL default '0',
  `RewItemId4` mediumint(8) unsigned NOT NULL default '0',
  `RewItemCount1` smallint(5) unsigned NOT NULL default '0',
  `RewItemCount2` smallint(5) unsigned NOT NULL default '0',
  `RewItemCount3` smallint(5) unsigned NOT NULL default '0',
  `RewItemCount4` smallint(5) unsigned NOT NULL default '0',
  `RewRepFaction1` smallint(5) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction2` smallint(5) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction3` smallint(5) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction4` smallint(5) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction5` smallint(5) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepValue1` mediumint(9) NOT NULL default '0',
  `RewRepValue2` mediumint(9) NOT NULL default '0',
  `RewRepValue3` mediumint(9) NOT NULL default '0',
  `RewRepValue4` mediumint(9) NOT NULL default '0',
  `RewRepValue5` mediumint(9) NOT NULL default '0',
  `RewHonorableKills` int(10) unsigned NOT NULL default '0',
  `RewOrReqMoney` int(11) NOT NULL default '0',
  `RewMoneyMaxLevel` int(10) unsigned NOT NULL default '0',
  `RewSpell` mediumint(8) unsigned NOT NULL default '0',
  `RewSpellCast` mediumint(8) unsigned NOT NULL default '0',
  `RewMailTemplateId` mediumint(8) unsigned NOT NULL default '0',
  `RewMailDelaySecs` int(11) unsigned NOT NULL default '0',
  `PointMapId` smallint(5) unsigned NOT NULL default '0',
  `PointX` float NOT NULL default '0',
  `PointY` float NOT NULL default '0',
  `PointOpt` mediumint(8) unsigned NOT NULL default '0',
  `DetailsEmote1` smallint(5) unsigned NOT NULL default '0',
  `DetailsEmote2` smallint(5) unsigned NOT NULL default '0',
  `DetailsEmote3` smallint(5) unsigned NOT NULL default '0',
  `DetailsEmote4` smallint(5) unsigned NOT NULL default '0',
  `DetailsEmoteDelay1` int(11) unsigned NOT NULL default '0',
  `DetailsEmoteDelay2` int(11) unsigned NOT NULL default '0',
  `DetailsEmoteDelay3` int(11) unsigned NOT NULL default '0',
  `DetailsEmoteDelay4` int(11) unsigned NOT NULL default '0',
  `IncompleteEmote` smallint(5) unsigned NOT NULL default '0',
  `CompleteEmote` smallint(5) unsigned NOT NULL default '0',
  `OfferRewardEmote1` smallint(5) unsigned NOT NULL default '0',
  `OfferRewardEmote2` smallint(5) unsigned NOT NULL default '0',
  `OfferRewardEmote3` smallint(5) unsigned NOT NULL default '0',
  `OfferRewardEmote4` smallint(5) unsigned NOT NULL default '0',
  `OfferRewardEmoteDelay1` int(11) unsigned NOT NULL default '0',
  `OfferRewardEmoteDelay2` int(11) unsigned NOT NULL default '0',
  `OfferRewardEmoteDelay3` int(11) unsigned NOT NULL default '0',
  `OfferRewardEmoteDelay4` int(11) unsigned NOT NULL default '0',
  `StartScript` mediumint(8) unsigned NOT NULL default '0',
  `CompleteScript` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quest System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reference_loot_template`
--

DROP TABLE IF EXISTS `reference_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reference_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `ChanceOrQuestChance` float NOT NULL default '100',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `mincountOrRef` mediumint(9) NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `lootcondition` tinyint(3) unsigned NOT NULL default '0',
  `condition_value1` mediumint(8) unsigned NOT NULL default '0',
  `condition_value2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reserved_name`
--

DROP TABLE IF EXISTS `reserved_name`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reserved_name` (
  `name` varchar(12) NOT NULL default '',
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player Reserved Names';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `script_texts`
--

DROP TABLE IF EXISTS `script_texts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `script_texts` (
  `npc_entry` mediumint(8) NOT NULL default '0' COMMENT 'creature_template entry',
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint(8) unsigned NOT NULL default '0',
  `type` tinyint(3) unsigned NOT NULL default '0',
  `language` tinyint(3) unsigned NOT NULL default '0',
  `emote` smallint(5) unsigned NOT NULL default '0',
  `comment` text,
  PRIMARY KEY  (`npc_entry`,`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Texts';
SET character_set_client = @saved_cs_client;


--
-- Table structure for table `script_waypoint`
--

DROP TABLE IF EXISTS `script_waypoint`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `script_waypoint` (
  `entry` mediumint(8) unsigned NOT NULL default '0' COMMENT 'creature_template entry',
  `pointid` mediumint(8) unsigned NOT NULL default '0',
  `location_x` float NOT NULL default '0',
  `location_y` float NOT NULL default '0',
  `location_z` float NOT NULL default '0',
  `waittime` int(10) unsigned NOT NULL default '0' COMMENT 'waittime in millisecs',
  `point_comment` text,
  PRIMARY KEY  (`entry`,`pointid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Creature waypoints';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `skill_discovery_template`
--

DROP TABLE IF EXISTS `skill_discovery_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `skill_discovery_template` (
  `spellId` mediumint(8) unsigned NOT NULL default '0' COMMENT 'SpellId of the discoverable spell',
  `reqSpell` mediumint(8) unsigned NOT NULL default '0' COMMENT 'spell requirement',
  `reqSkillValue` smallint(5) unsigned NOT NULL default '0' COMMENT 'skill points requirement',
  `chance` float NOT NULL default '0' COMMENT 'chance to discover',
  PRIMARY KEY  (`spellId`,`reqSpell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Discovery System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `skill_extra_item_template`
--

DROP TABLE IF EXISTS `skill_extra_item_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `skill_extra_item_template` (
  `spellId` mediumint(8) unsigned NOT NULL default '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Specialization spell id',
  `additionalCreateChance` float NOT NULL default '0' COMMENT 'chance to create add',
  `additionalMaxNum` tinyint(3) unsigned NOT NULL default '0' COMMENT 'max num of adds',
  PRIMARY KEY  (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Specialization System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `skill_fishing_base_level`
--

DROP TABLE IF EXISTS `skill_fishing_base_level`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `skill_fishing_base_level` (
  `entry` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Area identifier',
  `skill` smallint(6) NOT NULL default '0' COMMENT 'Base skill level requirement',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Fishing system';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `skinning_loot_template`
--

DROP TABLE IF EXISTS `skinning_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `skinning_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `ChanceOrQuestChance` float NOT NULL default '100',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `mincountOrRef` mediumint(9) NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `lootcondition` tinyint(3) unsigned NOT NULL default '0',
  `condition_value1` mediumint(8) unsigned NOT NULL default '0',
  `condition_value2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_area`
--

DROP TABLE IF EXISTS `spell_area`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_area` (
  `spell` mediumint(8) unsigned NOT NULL default '0',
  `area` mediumint(8) unsigned NOT NULL default '0',
  `quest_start` mediumint(8) unsigned NOT NULL default '0',
  `quest_start_active` tinyint(1) unsigned NOT NULL default '0',
  `quest_end` mediumint(8) unsigned NOT NULL default '0',
  `aura_spell` mediumint(8) NOT NULL default '0',
  `racemask` mediumint(8) unsigned NOT NULL default '0',
  `gender` tinyint(1) unsigned NOT NULL default '2',
  `autocast` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`spell`,`area`,`quest_start`,`quest_start_active`,`aura_spell`,`racemask`,`gender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_bonus_data`
--

DROP TABLE IF EXISTS `spell_bonus_data`;
CREATE TABLE `spell_bonus_data` (
  `entry` mediumint(8) unsigned NOT NULL,
  `direct_bonus` float NOT NULL default '0',
  `dot_bonus` float NOT NULL default '0',
  `ap_bonus` float NOT NULL default '0',
  `ap_dot_bonus` float NOT NULL default '0',
  `comments` varchar(255) default NULL,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_dbc`
--
DROP TABLE IF EXISTS `spell_dbc`;
CREATE TABLE `spell_dbc` (
	`Id` INT UNSIGNED NOT NULL,
	`Dispel` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`Mechanic` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`Attributes` INT UNSIGNED NOT NULL DEFAULT 0,
	`AttributesEx` INT UNSIGNED NOT NULL DEFAULT 0,
	`AttributesEx2` INT UNSIGNED NOT NULL DEFAULT 0,
	`AttributesEx3` INT UNSIGNED NOT NULL DEFAULT 0,
	`AttributesEx4` INT UNSIGNED NOT NULL DEFAULT 0,
	`AttributesEx5` INT UNSIGNED NOT NULL DEFAULT 0,
	`Targets` INT UNSIGNED NOT NULL DEFAULT 0,
	`CastingTimeIndex` TINYINT UNSIGNED NOT NULL DEFAULT 1,
	`AuraInterruptFlags` INT UNSIGNED NOT NULL DEFAULT 0,
	`ProcFlags` INT UNSIGNED NOT NULL DEFAULT 0,
	`ProcChance` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`ProcCharges` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`MaxLevel` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`BaseLevel` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`SpellLevel` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`DurationIndex` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
	`RangeIndex` TINYINT UNSIGNED NOT NULL DEFAULT 1,
	`StackAmount` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EquippedItemClass` INT NOT NULL DEFAULT -1,
	`EquippedItemSubClassMask` INT NOT NULL DEFAULT 0 DEFAULT 0,
	`EquippedItemInventoryTypeMask` INT NOT NULL DEFAULT 0 DEFAULT 0,
	`Effect1` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`Effect2` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`Effect3` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectDieSides1` INT NOT NULL DEFAULT 0,
	`EffectDieSides2` INT NOT NULL DEFAULT 0,
	`EffectDieSides3` INT NOT NULL DEFAULT 0,
	`EffectBaseDice1` INT NOT NULL DEFAULT 0,
	`EffectBaseDice2` INT NOT NULL DEFAULT 0,
	`EffectBaseDice3` INT NOT NULL DEFAULT 0,
	`EffectDicePerLevel1` FLOAT NOT NULL DEFAULT 0,
	`EffectDicePerLevel2` FLOAT NOT NULL DEFAULT 0,
	`EffectDicePerLevel3` FLOAT NOT NULL DEFAULT 0,
	`EffectRealPointsPerLevel1` FLOAT NOT NULL DEFAULT 0,
	`EffectRealPointsPerLevel2` FLOAT NOT NULL DEFAULT 0,
	`EffectRealPointsPerLevel3` FLOAT NOT NULL DEFAULT 0,
	`EffectBasePoints1` INT NOT NULL DEFAULT 0,
	`EffectBasePoints2` INT NOT NULL DEFAULT 0,
	`EffectBasePoints3` INT NOT NULL DEFAULT 0,
	`EffectMechanic1` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectMechanic2` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectMechanic3` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectImplicitTargetA1` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectImplicitTargetA2` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectImplicitTargetA3` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectImplicitTargetB1` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectImplicitTargetB2` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectImplicitTargetB3` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectRadiusIndex1` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectRadiusIndex2` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectRadiusIndex3` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectApplyAuraName1` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectApplyAuraName2` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectApplyAuraName3` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
	`EffectAmplitude1` INT NOT NULL DEFAULT 0,
	`EffectAmplitude2` INT NOT NULL DEFAULT 0,
	`EffectAmplitude3` INT NOT NULL DEFAULT 0,
	`EffectMultipleValue1` FLOAT NOT NULL DEFAULT 0,
	`EffectMultipleValue2` FLOAT NOT NULL DEFAULT 0,
	`EffectMultipleValue3` FLOAT NOT NULL DEFAULT 0,
	`EffectMiscValue1` INT NOT NULL DEFAULT 0,
	`EffectMiscValue2` INT NOT NULL DEFAULT 0,
	`EffectMiscValue3` INT NOT NULL DEFAULT 0,
	`EffectMiscValueB1` INT NOT NULL DEFAULT 0,
	`EffectMiscValueB2` INT NOT NULL DEFAULT 0,
	`EffectMiscValueB3` INT NOT NULL DEFAULT 0,
	`EffectTriggerSpell1` INT UNSIGNED NOT NULL DEFAULT 0,
	`EffectTriggerSpell2` INT UNSIGNED NOT NULL DEFAULT 0,
	`EffectTriggerSpell3` INT UNSIGNED NOT NULL DEFAULT 0,
	`EffectSpellClassMaskA1` INT UNSIGNED NOT NULL DEFAULT 0,
	`EffectSpellClassMaskA2` INT UNSIGNED NOT NULL DEFAULT 0,
	`EffectSpellClassMaskA3` INT UNSIGNED NOT NULL DEFAULT 0,
	`EffectSpellClassMaskB1` INT UNSIGNED NOT NULL DEFAULT 0,
	`EffectSpellClassMaskB2` INT UNSIGNED NOT NULL DEFAULT 0,
	`EffectSpellClassMaskB3` INT UNSIGNED NOT NULL DEFAULT 0,
	`EffectSpellClassMaskC1` INT UNSIGNED NOT NULL DEFAULT 0,
	`EffectSpellClassMaskC2` INT UNSIGNED NOT NULL DEFAULT 0,
	`EffectSpellClassMaskC3` INT UNSIGNED NOT NULL DEFAULT 0,
	`MaxTargetLevel` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`SpellFamilyName` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`SpellFamilyFlags1` INT UNSIGNED NOT NULL DEFAULT 0,
	`SpellFamilyFlags2` INT UNSIGNED NOT NULL DEFAULT 0,
	`SpellFamilyFlags3` INT UNSIGNED NOT NULL DEFAULT 0,
	`MaxAffectedTargets` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`DmgClass` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`PreventionType` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`DmgMultiplier1` FLOAT NOT NULL DEFAULT 0,
	`DmgMultiplier2` FLOAT NOT NULL DEFAULT 0,
	`DmgMultiplier3` FLOAT NOT NULL DEFAULT 0,
	`AreaGroupId` INT NOT NULL DEFAULT 0,
	`SchoolMask` INT UNSIGNED NOT NULL DEFAULT 0,
	`Comment` TEXT NOT NULL,
	PRIMARY KEY (`Id`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Custom spell.dbc entries';

--
-- Table structure for table `spell_disabled`
--

DROP TABLE IF EXISTS `spell_disabled`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_disabled` (
  `entry` int(11) unsigned NOT NULL default '0' COMMENT 'Spell entry',
  `disable_mask` int(8) unsigned NOT NULL default '0',
  `comment` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Disabled Spell System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_elixir`
--

DROP TABLE IF EXISTS `spell_elixir`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_elixir` (
  `entry` int(11) unsigned NOT NULL default '0' COMMENT 'SpellId of potion',
  `mask` tinyint(1) unsigned NOT NULL default '0' COMMENT 'Mask 0x1 battle 0x2 guardian 0x3 flask 0x7 unstable flasks 0xB shattrath flasks',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_enchant_proc_data`
--

DROP TABLE IF EXISTS `spell_enchant_proc_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_enchant_proc_data` (
  `entry` int(10) unsigned NOT NULL,
  `customChance` int(10) unsigned NOT NULL default '0',
  `PPMChance` float unsigned NOT NULL default '0',
  `procEx` float unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Spell enchant proc data';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_learn_spell`
--

DROP TABLE IF EXISTS `spell_learn_spell`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_learn_spell` (
  `entry` smallint(5) unsigned NOT NULL default '0',
  `SpellID` smallint(5) unsigned NOT NULL default '0',
  `Active` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entry`,`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_linked_spell`
--

DROP TABLE IF EXISTS `spell_linked_spell`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_linked_spell` (
  `spell_trigger` mediumint(8) NOT NULL,
  `spell_effect` mediumint(8) NOT NULL default '0',
  `type` tinyint(3) unsigned NOT NULL default '0',
  `comment` text NOT NULL,
  UNIQUE KEY `trigger_effect_type` (`spell_trigger`,`spell_effect`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Spell System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_loot_template`
--

DROP TABLE IF EXISTS `spell_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `ChanceOrQuestChance` float NOT NULL default '100',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `mincountOrRef` mediumint(9) NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `lootcondition` tinyint(3) unsigned NOT NULL default '0',
  `condition_value1` mediumint(8) unsigned NOT NULL default '0',
  `condition_value2` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_pet_auras`
--

DROP TABLE IF EXISTS `spell_pet_auras`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_pet_auras` (
  `spell` mediumint(8) unsigned NOT NULL COMMENT 'dummy spell id',
  `effectId` tinyint(3) unsigned NOT NULL default '0',
  `pet` mediumint(8) unsigned NOT NULL default '0' COMMENT 'pet id; 0 = all',
  `aura` mediumint(8) unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY  (`spell`,`effectId`,`pet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_proc_event`
--

DROP TABLE IF EXISTS `spell_proc_event`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_proc_event` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `SchoolMask` tinyint(4) NOT NULL default '0',
  `SpellFamilyName` smallint(5) unsigned NOT NULL default '0',
  `SpellFamilyMask0` int(10) unsigned NOT NULL default '0',
  `SpellFamilyMask1` int(10) unsigned NOT NULL default '0',
  `SpellFamilyMask2` int(10) unsigned NOT NULL default '0',
  `procFlags` int(10) unsigned NOT NULL default '0',
  `procEx` int(10) unsigned NOT NULL default '0',
  `ppmRate` float NOT NULL default '0',
  `CustomChance` float NOT NULL default '0',
  `Cooldown` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_required`
--

DROP TABLE IF EXISTS `spell_required`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_required` (
  `spell_id` mediumint(9) NOT NULL default '0',
  `req_spell` mediumint(9) NOT NULL default '0',
  PRIMARY KEY  (`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell Additinal Data';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_script_target`
--

DROP TABLE IF EXISTS `spell_script_target`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_script_target` (
  `entry` mediumint(8) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL default '0',
  `targetEntry` mediumint(8) unsigned NOT NULL default '0',
  UNIQUE KEY `entry_type_target` (`entry`,`type`,`targetEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spell System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_scripts`
--

DROP TABLE IF EXISTS `spell_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_scripts` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `delay` int(10) unsigned NOT NULL default '0',
  `command` mediumint(8) unsigned NOT NULL default '0',
  `datalong` mediumint(8) unsigned NOT NULL default '0',
  `datalong2` int(10) unsigned NOT NULL default '0',
  `dataint` int(11) NOT NULL default '0',
  `x` float NOT NULL default '0',
  `y` float NOT NULL default '0',
  `z` float NOT NULL default '0',
  `o` float NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_target_position`
--

DROP TABLE IF EXISTS `spell_target_position`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_target_position` (
  `id` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `target_map` smallint(5) unsigned NOT NULL default '0',
  `target_position_x` float NOT NULL default '0',
  `target_position_y` float NOT NULL default '0',
  `target_position_z` float NOT NULL default '0',
  `target_orientation` float NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spell_threat`
--

DROP TABLE IF EXISTS `spell_threat`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_threat` (
  `entry` mediumint(8) unsigned NOT NULL,
  `Threat` smallint(6) NOT NULL,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transport_events`
--

DROP TABLE IF EXISTS `transport_events`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `transport_events` (
  `entry` int(11) unsigned NOT NULL default '0',
  `waypoint_id` int(11) unsigned NOT NULL default '0',
  `event_id` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `transport_events`
--

LOCK TABLES `transport_events` WRITE;
/*!40000 ALTER TABLE `transport_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `transport_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transports`
--

DROP TABLE IF EXISTS `transports`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `transports` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `name` text,
  `period` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Transports';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `transports`
--

LOCK TABLES `transports` WRITE;
/*!40000 ALTER TABLE `transports` DISABLE KEYS */;
/*!40000 ALTER TABLE `transports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trinity_string`
--

DROP TABLE IF EXISTS `trinity_string`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `trinity_string` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `version` (
  `core_version` varchar(120) default NULL COMMENT 'Core revision dumped at startup.',
  `core_revision` varchar(120) default NULL COMMENT 'Revision of Core.',
  `db_version` varchar(120) default NULL COMMENT 'Version of world DB.',
  `script_version` varchar(120) default NULL COMMENT 'Version of scripts DB.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Version Notes';
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `waypoint_data`
--

DROP TABLE IF EXISTS `waypoint_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `waypoint_data` (
  `id` int(10) unsigned NOT NULL default '0' COMMENT 'Creature GUID',
  `point` mediumint(8) unsigned NOT NULL default '0',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `delay` int(10) unsigned NOT NULL default '0',
  `move_flag` tinyint(1) NOT NULL default '0',
  `action` int(11) NOT NULL default '0',
  `action_chance` smallint(3) NOT NULL default '100',
  `wpguid` int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `waypoint_scripts`
--

DROP TABLE IF EXISTS `waypoint_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `waypoint_scripts` (
  `id` int(11) unsigned NOT NULL default '0',
  `delay` int(11) unsigned NOT NULL default '0',
  `command` int(11) unsigned NOT NULL default '0',
  `datalong` int(11) unsigned NOT NULL default '0',
  `datalong2` int(11) unsigned NOT NULL default '0',
  `dataint` int(11) unsigned NOT NULL default '0',
  `x` float NOT NULL default '0',
  `y` float NOT NULL default '0',
  `z` float NOT NULL default '0',
  `o` float NOT NULL default '0',
  `guid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

-- Dump completed on 2009-06-12  2:23:05
