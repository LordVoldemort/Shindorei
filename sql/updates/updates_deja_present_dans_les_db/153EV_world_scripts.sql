UPDATE `instance_template` SET `script`='instance_trial_of_the_champion' WHERE `map`=650;
UPDATE `creature_template` SET `Scriptname`='npc_toc5_announcer',`npcflag`=1 WHERE entry IN (35004, 35005);
UPDATE `creature_template` SET `ScriptName`='mob_toc5_warrior' WHERE entry IN (34705, 35572);
UPDATE `creature_template` SET `ScriptName`='mob_toc5_mage' WHERE entry IN (34702, 35569);
UPDATE `creature_template` SET `ScriptName`='mob_toc5_shaman' WHERE entry IN (34701, 35571);
UPDATE `creature_template` SET `ScriptName`='mob_toc5_hunter' WHERE entry IN (34657, 35570);
UPDATE `creature_template` SET `ScriptName`='mob_toc5_rogue' WHERE entry IN (34703, 35617);
UPDATE `creature_template` SET `ScriptName`='mob_toc5_risen_ghoul' WHERE entry IN (35545, 35564);