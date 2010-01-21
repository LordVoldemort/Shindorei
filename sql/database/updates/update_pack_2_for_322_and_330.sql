-- My Fixes

UPDATE `quest_template` SET `Method` = 0 WHERE `entry` = 12687;

DELETE FROM `creature_questrelation` WHERE `quest` = 8371;
DELETE FROM `creature_involvedrelation` WHERE `quest` = 8371;
DELETE FROM `creature_questrelation` WHERE `quest` = 8367;
DELETE FROM `creature_involvedrelation` WHERE `quest` = 8367;
UPDATE creature_questrelation SET `quest` = 8371 WHERE `quest` = 13478;
UPDATE creature_involvedrelation SET `quest` = 8371 WHERE `quest` = 13478;
UPDATE creature_questrelation SET `quest` = 8367 WHERE `quest` = 13476;
UPDATE creature_involvedrelation SET `quest` = 8367 WHERE `quest` = 13476;

DELETE FROM creature WHERE guid=94374;
DELETE FROM gameobject WHERE guid=73315;

UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=15687;
UPDATE `quest_template` SET `RequiredMinRepFaction` = 0 WHERE `entry` = 8303;

UPDATE `spell_proc_event` SET procFlags=procFlags|4 WHERE `entry` IN (53486,53488);
UPDATE spell_proc_event SET ppmRate = 0 WHERE entry = 20375;

UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 0, `ReqCreatureOrGOCount1` = 0, `DetailsEmote1` = 0, `OfferRewardEmote1` = 0, `OfferRewardEmote2` = 0, `OfferRewardEmote3` = 0, `OfferRewardEmote4` = 0 WHERE `entry` = 12801;
UPDATE `quest_template` SET `Method` = 0 WHERE `entry` = 12801;
UPDATE `quest_template` SET `Method` = 0, `ReqItemId1` = 0, `ReqItemCount1` = 0, `ReqCreatureOrGOId1` = 0, `ReqCreatureOrGOCount1` = 0 WHERE `entry` = 12698;

UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 28179;

UPDATE `creature_template` SET `npcflag` = 2 WHERE `entry` = 28666;
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 28666 WHERE `entry` = 12663;

DELETE FROM `creature` WHERE `id`=34956;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(131171, 34956, 571, 1, 1, 0, 0, 8464.25, 1588.59, 672.872, 0.122518, 120, 0, 0, 12600, 0, 0, 0),
(1019701, 34956, 571, 1, 1, 0, 0, 8463.99, 1588.52, 672.872, 0.261983, 25, 0, 0, 8407, 0, 0, 0);

DROP TABLE IF EXISTS `battleground_template`;
CREATE TABLE `battleground_template` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL,
  `MinPlayersPerTeam` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
  `MinLvl` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `MaxLvl` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `AllianceStartLoc` MEDIUMINT(8) UNSIGNED NOT NULL,
  `AllianceStartO` FLOAT NOT NULL,
  `HordeStartLoc` MEDIUMINT(8) UNSIGNED NOT NULL,
  `HordeStartO` FLOAT NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

INSERT  INTO `battleground_template`(`id`,`MinPlayersPerTeam`,`MaxPlayersPerTeam`,`MinLvl`,`MaxLvl`,`AllianceStartLoc`,`AllianceStartO`,`HordeStartLoc`,`HordeStartO`) VALUES (1,2,40,51,80,611,2.72532,610,2.27452),(2,2,10,10,80,769,3.14159,770,3.14159),(3,2,15,20,80,890,3.40156,889,0.263892),(4,0,2,10,80,929,0,936,3.14159),(5,0,2,10,80,939,0,940,3.14159),(6,0,2,10,80,0,0,0,0),(7,2,15,61,80,1103,3.40156,1104,0.263892),(8,0,2,10,80,1258,0,1259,3.14159),(9,2,15,71,80,1367,0,1368,0),(10,5,5,10,80,1362,0,1363,0),(11,5,5,10,80,1364,0,1365,0),(30,2,40,71,80,1485,0,1486,0),(32,2,40,0,80,0,0,0,0);

-- From YTDB

UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '-100',`lootcondition` = '0',`condition_value1` = '0' WHERE `entry` =29695 AND `item` =40971;
UPDATE `quest_template` SET `ReqSourceId1` = '40971',`ReqSourceCount1` = '1',`ReqCreatureOrGOId1` = '29677',`ReqCreatureOrGOId2` = '29695',`ReqCreatureOrGOCount2` = '1' WHERE `entry` =12910;
UPDATE `quest_template` SET `ReqSourceId1` = '40971',`ReqSourceCount1` = '1',`ReqCreatureOrGOId1` = '29677',`ReqCreatureOrGOId3` = '29695',`ReqCreatureOrGOCount3` = '1' WHERE `entry` =12855;

DELETE FROM `spell_script_target` WHERE `entry` = 56227 AND `type` = 2 AND `targetEntry` = 30208;
DELETE FROM `spell_script_target` WHERE `entry` = 56227 AND `type` = 2 AND `targetEntry` = 30163;
REPLACE INTO `creature_ai_scripts` VALUES ('2991451', '29914', '8', '0', '50', '0', '56227', '-1', '0', '0', '11', '56230', '6', '6', '11', '56230', '6', '6', '41', '0', '0', '0', 'ytdb-q12985');
REPLACE INTO `creature_ai_scripts` VALUES ('2991452', '29914', '8', '0', '50', '0', '56227', '-1', '0', '0', '12', '30208', '6', '180000', '12', '30208', '6', '180000', '22', '1', '0', '0', 'ytdb-q12985');
REPLACE INTO `creature_ai_scripts` VALUES ('2991453', '29914', '1', '1', '100', '0', '1', '1', '0', '0', '12', '30208', '6', '180000', '41', '0', '0', '0', '22', '0', '0', '0', 'ytdb-q12985');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '29914';
UPDATE `creature_template_addon` SET `bytes1` = '7',`bytes2` = '4097',`emote` = '65' WHERE `entry` =29914;
UPDATE `creature_template` SET `dynamicflags` = '32',`flags_extra` = '2' WHERE `entry` =29914;
UPDATE `creature` SET `DeathState` = '0' WHERE `id` =29914;
DELETE FROM `creature` WHERE `id` = 30208;
UPDATE `quest_template` SET `PrevQuestId` = '12987' WHERE `entry` =13006;
UPDATE `spell_script_target` SET `type` = '1' WHERE `entry` =56227 AND `type` =2 AND `targetEntry` =29914;

REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(57306, 178670, 0, 1, 1, -13249.4, 164.385, 34.8086, 1.02261, 0, 0, 0.489317, 0.872106, 25, 0, 1);
UPDATE `quest_template` SET `PrevQuestId` = '13001' WHERE `entry` =13003;
UPDATE `quest_template` SET `PrevQuestId` = '12976' WHERE `entry` =12977;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(48568, 192078, 571, 1, 2, 7111.56, -2727.64, 787.25, 0.146714, 0, 0, 0.0732913, 0.997311, 0, 0, 1);
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = '30210',`ReqSpellCast1` = '0' WHERE `entry` =12987;
UPDATE `creature_template` SET `flags_extra` = '128' WHERE `entry` =30210;

DELETE FROM `creature` WHERE `guid` = 86518;
DELETE FROM `creature` WHERE `guid` = 86517;
DELETE FROM `creature` WHERE `guid` = 86369;
REPLACE INTO `creature_ai_scripts` VALUES ('3095451', '30954', '6', '0', '100', '0', '0', '0', '0', '0', '33', '31160', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'ytdb-q13161');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '30954';
REPLACE INTO `creature_ai_scripts` VALUES ('3095351', '30953', '6', '0', '100', '0', '0', '0', '0', '0', '33', '31159', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'ytdb-q13162');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '30953';
REPLACE INTO `creature_ai_scripts` VALUES ('3095651', '30956', '6', '0', '100', '0', '0', '0', '0', '0', '33', '31161', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'ytdb-q13163');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '30956';
UPDATE creature_loot_template SET ChanceOrQuestChance=-ABS(ChanceOrQuestChance) WHERE item = 33308;

UPDATE `quest_template` SET `ReqCreatureOrGOId1` = '24166',`ReqCreatureOrGOId2` = '24165',`ReqCreatureOrGOId3` = '24167',`ReqSpellCast1` = '0',`ReqSpellCast2` = '0',`ReqSpellCast3` = '0' WHERE `entry` =11282;
REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES  
(2416151,24161,8,0,100,0,43178,-1,0,0,33,24166,6,0,0,0,0,0,0,0,0,0, 'ytdb-q11282'), 
(2401651,24016,8,0,100,0,43178,-1,0,0,33,24165,6,0,0,0,0,0,0,0,0,0, 'ytdb-q11282'), 
(2416251,24162,8,0,100,0,43178,-1,0,0,33,24167,6,0,0,0,0,0,0,0,0,0, 'ytdb-q11282'); 
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` IN (24016,24161,24162);
UPDATE `creature_template` SET `faction_A` = '14',`faction_H` = '14' WHERE `entry` IN (24161,24162);

UPDATE creature_template SET minlevel = 80, maxlevel = 80 WHERE entry = 35646;
INSERT INTO spell_area VALUES (55773, 4395, 0, 0, 0, 0, 690, 2, 1),(55774, 4395, 0, 0, 0, 0, 1101, 2, 1);
DELETE FROM `creature_template_addon` WHERE `entry` = 35594;
UPDATE `creature_template` SET `faction_A` = '1801',`faction_H` = '1801',`npcflag` = '2097153',`flags_extra` = '2' WHERE `entry` =35607;
UPDATE `creature_template` SET `faction_A` = '1802',`faction_H` = '1802',`npcflag` = '2097153',`flags_extra` = '2' WHERE `entry` =35594;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
(35607, 571, 1, 64, 0, 0, 5927.63, 731.59, 643.253, 4.76475, 180, 0, 0, 5342, 0, 0, 0);
UPDATE `creature` SET `phaseMask` = '128',`modelid` = '0' WHERE `guid` =136677;
UPDATE `creature_template` SET `gossip_menu_id` = 35607 WHERE `entry` = 35607;
INSERT INTO gossip_menu (`entry`,`text_id`) VALUES (35607,14764);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES 
(35607, 0, 0, 'What''s on the auction house today?', 13, 2097152, 0, 0, 0, 0, 0, NULL, 7, 202, 350, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 35594 WHERE `entry` = 35594;
INSERT INTO gossip_menu (`entry`,`text_id`) VALUES (35594,14764);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES 
(35594, 0, 0, 'What''s on the auction house today?', 13, 2097152, 0, 0, 0, 0, 0, NULL, 7, 202, 350, 0, 0, 0, 0, 0, 0);
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` =14111;
UPDATE `creature_template` SET `npcflag` = '0' WHERE `entry` IN (34061,34082,33923,31865,33917,31864,33922);
DELETE FROM `npc_vendor` WHERE `entry` IN (34061,33917,33930,33929,33928,33932);
UPDATE `creature_template` SET `npcflag` = '4224' WHERE `entry` IN (33929,33930);
INSERT INTO npc_vendor SELECT 33930 AS entry, item, maxcount, incrtime, extendedcost FROM npc_vendor WHERE entry=33925; 
INSERT INTO npc_vendor SELECT 33929 AS entry, item, maxcount, incrtime, extendedcost FROM npc_vendor WHERE entry=33925; 
INSERT INTO npc_vendor SELECT 33928 AS entry, item, maxcount, incrtime, extendedcost FROM npc_vendor WHERE entry=33926;
INSERT INTO npc_vendor SELECT 33932 AS entry, item, maxcount, incrtime, extendedcost FROM npc_vendor WHERE entry=33926;

UPDATE creature_loot_template SET ChanceOrQuestChance=ABS(ChanceOrQuestChance) WHERE item = 42780;

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=12138);
INSERT INTO `creature_ai_scripts` VALUES 
(1213802, 12138, 6, 0, 100, 0, 0, 0, 0, 0, 12, 12144, 0, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunaclaw - Cast Lunaclaw Spirit'),
(1213801, 12138, 0, 0, 100, 1, 2000, 2000, 2500, 4500, 11, 3391, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunaclaw - Cast Thrash');

INSERT INTO `spell_script_target` VALUES ('62709', '1', '33844');
INSERT INTO `spell_script_target` VALUES ('62709', '1', '33845');
INSERT INTO `spell_script_target` VALUES ('67864', '1', '35651');
INSERT INTO `spell_script_target` VALUES ('67888', '1', '35458');

UPDATE gameobject SET phaseMask = 256 WHERE id IN (193053,193052);
UPDATE creature_template SET faction_A = 1733, faction_H = 1733 WHERE entry = 29611;
UPDATE creature_template SET faction_A = 1734, faction_H = 1734 WHERE entry = 4949;
