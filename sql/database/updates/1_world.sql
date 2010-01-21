UPDATE `creature_template` SET `spell1` = 52006, `spell2` = 51859, `spell3` = 51904, `spell4` = 52694, `InhabitType` = 7 WHERE `entry` = 28511;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `VehicleId` = 117 WHERE `entry` = 32627;
UPDATE `creature_template` SET `faction_A` = 2110, `faction_H` = 2110, `VehicleId` = 341 WHERE `entry` = 33114;
DELETE FROM spell_script_target WHERE targetEntry = 17256;
REPLACE INTO spell_script_target VALUES (30531, 1, 17256);
