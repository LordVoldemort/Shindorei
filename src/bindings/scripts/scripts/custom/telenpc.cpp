/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/* ScriptData
SDName: telenpc
SD%Complete: 100
SDComment: Teleport Master
SDCategory: NPC
EndScriptData */

#include "precompiled.h"
#include "../../../../shared/Config/Config.h"
#ifndef _TRINITY_SCRIPT_CONFIG
# define _TRINITY_SCRIPT_CONFIG  "trinitycore.conf"
#endif _TRINITY_SCRIPT_CONFIG

bool GossipHello_TeleNPC(Player* pPlayer, Creature* pCreature)
{
	Config TScriptConfig;
	if(!TScriptConfig.SetSource(_TRINITY_SCRIPT_CONFIG,true))
		error_log("SD2: Unable to open configuration file");

	if(TScriptConfig.GetBoolDefault("TeleNPC.OnlyGMs", false)) // If TeleNPC.OnlyGMs is enabled in scriptdev2.conf
		if (pPlayer->GetSession()->GetSecurity() == SEC_PLAYER)
		{
			pCreature->MonsterWhisper("Sorry, I can only teleport game masters.", pPlayer->GetGUID());
			return true;
		}

	bool EnableResSickness = TScriptConfig.GetBoolDefault("TeleNPC.EnableRemoveResSickness", true);
	bool EnableAlliancevsHordePvP = TScriptConfig.GetBoolDefault("TeleNPC.EnableAlliancevsHordePvP", true);
	bool EnablePlayerTools = TScriptConfig.GetBoolDefault("TeleNPC.EnablePlayerTools", true);
	bool EnableInnkeeper = TScriptConfig.GetBoolDefault("TeleNPC.EnableInnkeeper", true);
	bool EnableShoppingMall = TScriptConfig.GetBoolDefault("TeleNPC.EnableShoppingMall", false);
	bool EnableHarmonyGuildShip = TScriptConfig.GetBoolDefault("TeleNPC.HarmonyGuildShip", false);
	bool EnableUnityGuildShip = TScriptConfig.GetBoolDefault("TeleNPC.UnityGuildShip", false);

	// Main Menu for Alliance
    if (pPlayer->GetTeam() == ALLIANCE)
	{
		pPlayer->ADD_GOSSIP_ITEM( 7, "Villes de l'Alliance ->"             , GOSSIP_SENDER_MAIN, 1000);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Villes neutres ->"              , GOSSIP_SENDER_MAIN, 3000);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Instances & Raids ->"                  , GOSSIP_SENDER_MAIN, 5000);
	}
	else // Main Menu for Horde
	{
		pPlayer->ADD_GOSSIP_ITEM( 7, "Villes de la Horde ->"                , GOSSIP_SENDER_MAIN, 2000);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Villes neutres ->"              , GOSSIP_SENDER_MAIN, 3000);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Instance & Raids ->"                  , GOSSIP_SENDER_MAIN, 5000);
	}

	// Check config if "Player Tools" is enabled or not
	if(EnablePlayerTools)
		pPlayer->ADD_GOSSIP_ITEM( 7, "Options joueur ->"              , GOSSIP_SENDER_MAIN, 4000);

	// Check config if "Shopping Mall" is enabled or not
	if(EnableShoppingMall)
		pPlayer->ADD_GOSSIP_ITEM( 8, "Zone Shop"                , GOSSIP_SENDER_MAIN, 5200);

	// Check config file if "Alliance vs Horde PvP" option is enabled or not
	if(EnableAlliancevsHordePvP)
		pPlayer->ADD_GOSSIP_ITEM( 9, "Zone PVP"        , GOSSIP_SENDER_MAIN, 3500);

    pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());

return true;
}

void SendDefaultMenu_TeleNPC(Player* pPlayer, Creature* pCreature, uint32 uiAction)
{

// Not allow in combat
if (pPlayer->isInCombat())
{
    pPlayer->CLOSE_GOSSIP_MENU();
	pCreature->MonsterSay("Hep hep hep, on ne fuit pas les combats ! Je te téléporterais, à la fin.", LANG_UNIVERSAL, NULL);
	return;
}

Config TScriptConfig;
if(!TScriptConfig.SetSource(_TRINITY_SCRIPT_CONFIG,true))
		error_log("SD2: Unable to open configuration file");
bool EnableResSickness = TScriptConfig.GetBoolDefault("TeleNPC.EnableRemoveResSickness", true);
bool EnableAlliancevsHordePvP = TScriptConfig.GetBoolDefault("TeleNPC.EnableAlliancevsHordePvP", true);
bool EnablePlayerTools = TScriptConfig.GetBoolDefault("TeleNPC.PlayerTools", true);
bool EnableInnkeeper = TScriptConfig.GetBoolDefault("TeleNPC.EnableInnkeeper", true);
bool EnableShoppingMall = TScriptConfig.GetBoolDefault("TeleNPC.EnableShoppingMall", false);
bool EnableHarmonyGuildShip = TScriptConfig.GetBoolDefault("TeleNPC.HarmonyGuildShip", false);
bool EnableUnityGuildShip = TScriptConfig.GetBoolDefault("TeleNPC.UnityGuildShip", false);

//Mony Check
if (pPlayer->GetMoney() < (TScriptConfig.GetFloatDefault("TeleGoldCost",0)))
{
    pPlayer->CLOSE_GOSSIP_MENU();
	pCreature->MonsterWhisper("Je ne suis pas gratuit, tu n'as pas assez d'argent !", pPlayer->GetGUID());
	return;
}

switch(uiAction)
{

case 1000: //Alliance Town
		pPlayer->ADD_GOSSIP_ITEM( 5, "Darnassus"                    , GOSSIP_SENDER_MAIN, 1001);
		pPlayer->ADD_GOSSIP_ITEM( 5, "Exodar"                       , GOSSIP_SENDER_MAIN, 1005);
		pPlayer->ADD_GOSSIP_ITEM( 5, "Forgefer"                    , GOSSIP_SENDER_MAIN, 1010);
		pPlayer->ADD_GOSSIP_ITEM( 5, "Hurlevent"                    , GOSSIP_SENDER_MAIN, 1015);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Instances & Raids ->"                  , GOSSIP_SENDER_MAIN, 5000);
		pPlayer->ADD_GOSSIP_ITEM( 7, "<- Retour"                 , GOSSIP_SENDER_MAIN, 5005);

	pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

case 2000: //Horde Town
		pPlayer->ADD_GOSSIP_ITEM( 5, "Orgrimmar"                    , GOSSIP_SENDER_MAIN, 2001);
		pPlayer->ADD_GOSSIP_ITEM( 5, "Lune d'argent"                   , GOSSIP_SENDER_MAIN, 2005);
		pPlayer->ADD_GOSSIP_ITEM( 5, "Pittons du tonnerre"                , GOSSIP_SENDER_MAIN, 2010);
		pPlayer->ADD_GOSSIP_ITEM( 5, "Fossoyeuse"                    , GOSSIP_SENDER_MAIN, 2015);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Instances & Raids ->"                  , GOSSIP_SENDER_MAIN, 5000);
		pPlayer->ADD_GOSSIP_ITEM( 7, "<- Retour"                 , GOSSIP_SENDER_MAIN, 5005);

	pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

case 3000: //Neutral Town
     // Check if player is DK for "Ebon Hold"
     if(pPlayer->getClass()==6)
		pPlayer->ADD_GOSSIP_ITEM( 5, "Forêt de Terokkar"                    , GOSSIP_SENDER_MAIN, 3001);
		pPlayer->ADD_GOSSIP_ITEM( 5, "Baie du Butin"                    , GOSSIP_SENDER_MAIN, 3005);
		pPlayer->ADD_GOSSIP_ITEM( 5, "Dalaran"                      , GOSSIP_SENDER_MAIN, 3010);
		pPlayer->ADD_GOSSIP_ITEM( 5, "Long-Guet"                     , GOSSIP_SENDER_MAIN, 3015);
		pPlayer->ADD_GOSSIP_ITEM( 5, "Gadegetzan"                   , GOSSIP_SENDER_MAIN, 3020);
		pPlayer->ADD_GOSSIP_ITEM( 5, "Bourbe-à-brac"                  , GOSSIP_SENDER_MAIN, 3025);
		pPlayer->ADD_GOSSIP_ITEM( 5, "Cabestan"                      , GOSSIP_SENDER_MAIN, 3030);
		pPlayer->ADD_GOSSIP_ITEM( 5, "Shattrath"               , GOSSIP_SENDER_MAIN, 3035);
		pPlayer->ADD_GOSSIP_ITEM( 5, "L'île de Quel'Danas"           , GOSSIP_SENDER_MAIN, 3040);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Instances & Raids ->"                  , GOSSIP_SENDER_MAIN, 5000);
		pPlayer->ADD_GOSSIP_ITEM( 7, "<- Retour"                 , GOSSIP_SENDER_MAIN, 5005);

	pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

case 5000: //Dungeons
		pPlayer->ADD_GOSSIP_ITEM( 7, "Kalimdor ->"                  , GOSSIP_SENDER_MAIN, 5010);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Royaume de l'Est ->"          , GOSSIP_SENDER_MAIN, 5015);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Outreterre ->"                   , GOSSIP_SENDER_MAIN, 5025);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Norfendre ->"                 , GOSSIP_SENDER_MAIN, 5030);
		pPlayer->ADD_GOSSIP_ITEM( 7, "<- Retour"                 , GOSSIP_SENDER_MAIN, 5005);

	pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

case 5005: //Back To Main Menu

    // Main Menu for Alliance
    if (pPlayer->GetTeam() == ALLIANCE)
	{
		pPlayer->ADD_GOSSIP_ITEM( 7, "Villes de l'Alliance ->"             , GOSSIP_SENDER_MAIN, 1000);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Villes neutres ->"              , GOSSIP_SENDER_MAIN, 3000);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Instances & Raids ->"                  , GOSSIP_SENDER_MAIN, 5000);
	}
	else // Main Menu for Horde
	{
		pPlayer->ADD_GOSSIP_ITEM( 7, "Villes de la Horde ->"                , GOSSIP_SENDER_MAIN, 2000);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Villes neutres ->"              , GOSSIP_SENDER_MAIN, 3000);
		pPlayer->ADD_GOSSIP_ITEM( 7, "Insances & Raids ->"                  , GOSSIP_SENDER_MAIN, 5000);
	}

	// Check if Player Tools is enabled in scriptdev2.conf
	if(EnablePlayerTools)
		pPlayer->ADD_GOSSIP_ITEM( 7, "Options joueurs ->"              , GOSSIP_SENDER_MAIN, 4000);

	// Check if Shopping Mall is enabled in scriptdev2.conf
	if(EnableShoppingMall)
		pPlayer->ADD_GOSSIP_ITEM( 8, "Zone Shop"                , GOSSIP_SENDER_MAIN, 5200);

	// Check if Alliance vs Horde PvP option is enabled in scriptdev2.conf
	if(EnableAlliancevsHordePvP)
		pPlayer->ADD_GOSSIP_ITEM( 9, "Zone PVP"        , GOSSIP_SENDER_MAIN, 3500);

	pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

case 5010: //Kalimdor
	pPlayer->ADD_GOSSIP_ITEM( 5, "Profondeurs de Brassenoire"                , GOSSIP_SENDER_MAIN, 6001);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Grottes du temps"                  , GOSSIP_SENDER_MAIN, 6005);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Maraudon"                         , GOSSIP_SENDER_MAIN, 6015);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Onyxia"                    , GOSSIP_SENDER_MAIN, 6020);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Ragefeu"                   , GOSSIP_SENDER_MAIN, 6025);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Kraal de Tranchebauge"                   , GOSSIP_SENDER_MAIN, 6030);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Souilles de Tranchebauge"                   , GOSSIP_SENDER_MAIN, 6035);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Ruines d'Ahn'Qiraj"               , GOSSIP_SENDER_MAIN, 6040);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Temple d'Ahn'Qiraj"              , GOSSIP_SENDER_MAIN, 6045);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Caverne des Lamentations"                  , GOSSIP_SENDER_MAIN, 6050);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Zul'Farrak"                       , GOSSIP_SENDER_MAIN, 6055);
	pPlayer->ADD_GOSSIP_ITEM( 7, "<- Back"                          , GOSSIP_SENDER_MAIN, 5000);
	
	pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

case 5015: //Eastern Kingdoms 1
	pPlayer->ADD_GOSSIP_ITEM( 5, "Blackrock Depths"                 , GOSSIP_SENDER_MAIN, 7001);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Blackrock Spire"                  , GOSSIP_SENDER_MAIN, 7005);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Blackwing Lair"                   , GOSSIP_SENDER_MAIN, 7010);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Les Mortemines"                        , GOSSIP_SENDER_MAIN, 7015);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Gnomeregan"                       , GOSSIP_SENDER_MAIN, 7020);
	pPlayer->ADD_GOSSIP_ITEM( 5, "L'île de Quel'Danas"               , GOSSIP_SENDER_MAIN, 7025);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Karazhan"                         , GOSSIP_SENDER_MAIN, 7030);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Profondeurs de Rochenoire"                      , GOSSIP_SENDER_MAIN, 7035);
	pPlayer->ADD_GOSSIP_ITEM( 7, "Plus d'instances ->"                          , GOSSIP_SENDER_MAIN, 5020);
	pPlayer->ADD_GOSSIP_ITEM( 7, "<- Retour"                          , GOSSIP_SENDER_MAIN, 5000);

	pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

case 5020: //Eastern Kingdoms 2
	pPlayer->ADD_GOSSIP_ITEM( 5, "Le Monastère écarlate"                , GOSSIP_SENDER_MAIN, 7040);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Scholomance"                      , GOSSIP_SENDER_MAIN, 7045);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Donjon d'Ombrecroc"                  , GOSSIP_SENDER_MAIN, 7050);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Stratholme"                       , GOSSIP_SENDER_MAIN, 7055);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Le Temple englouti"                    , GOSSIP_SENDER_MAIN, 7060);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Prison de Hurlevent"                     , GOSSIP_SENDER_MAIN, 7065);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Uldaman"                          , GOSSIP_SENDER_MAIN, 7070);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Zul'Aman"                         , GOSSIP_SENDER_MAIN, 7075);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Zul'Gurub"                        , GOSSIP_SENDER_MAIN, 7080);
	pPlayer->ADD_GOSSIP_ITEM( 7, "<- Retour aux instances"                          , GOSSIP_SENDER_MAIN, 5015);
	pPlayer->ADD_GOSSIP_ITEM( 7, "<<- Retour"                     , GOSSIP_SENDER_MAIN, 5005);
	
	pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

case 5025: //Outland	
	pPlayer->ADD_GOSSIP_ITEM( 5, "Auchindoun"                       , GOSSIP_SENDER_MAIN, 8001);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Le Temple noir"                     , GOSSIP_SENDER_MAIN, 8005);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Réservoir de Glisseroc"               , GOSSIP_SENDER_MAIN, 8010);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Le repair de Gruul"                     , GOSSIP_SENDER_MAIN, 8015);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Citadelles des flammes infernales"                 , GOSSIP_SENDER_MAIN, 8020);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Donjon de la Tempête"                     , GOSSIP_SENDER_MAIN, 8025);
	pPlayer->ADD_GOSSIP_ITEM( 7, "<- Retour"                          , GOSSIP_SENDER_MAIN, 5000);
	
	pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

case 5030: //Northrend	
	pPlayer->ADD_GOSSIP_ITEM( 5, "Ahn'Kahet"                        , GOSSIP_SENDER_MAIN, 9001);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Azjol-Nerub"                      , GOSSIP_SENDER_MAIN, 9005);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Drak'Tharon"                 , GOSSIP_SENDER_MAIN, 9010);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Gun'Drak"                         , GOSSIP_SENDER_MAIN, 9015);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Citadelle de la Couronne de Glace"                 , GOSSIP_SENDER_MAIN, 9020);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Naxxramas"                        , GOSSIP_SENDER_MAIN, 9025);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Le Nexus"                        , GOSSIP_SENDER_MAIN, 9030);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Le sanctuaire de l'Obsidien"             , GOSSIP_SENDER_MAIN, 9035);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Donjon d'Utgarde"                     , GOSSIP_SENDER_MAIN, 9040);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Cime d'Utgarde"                 , GOSSIP_SENDER_MAIN, 9045);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Ulduar"                           , GOSSIP_SENDER_MAIN, 9050);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Le Fort Pourpre"                      , GOSSIP_SENDER_MAIN, 9055);
	pPlayer->ADD_GOSSIP_ITEM( 7, "<- Retour"                          , GOSSIP_SENDER_MAIN, 5000);
	
	pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

case 4000: // Player Tools
      // Check config file if "Innkeeper" option is enabled or not
	if(EnableInnkeeper)
		pPlayer->ADD_GOSSIP_ITEM( 5, "Faire de cette ville mon foyer"  , GOSSIP_SENDER_MAIN, 4005);
	pPlayer->ADD_GOSSIP_ITEM( 5, "Réinitialiser mes points de talent"              , GOSSIP_SENDER_MAIN, 4010);
      // Check if player is Hunter for "Reset Pet Talent Points"
	if(pPlayer->getClass()==3)
		pPlayer->ADD_GOSSIP_ITEM( 5, "Reset Pet Talent Points"    , GOSSIP_SENDER_MAIN, 4015);
	// Check config file if "Remove res sickness" option is enabled or not
	if(EnableResSickness)
		pPlayer->ADD_GOSSIP_ITEM( 5, "Enlever mon Mal de Résurrection"  , GOSSIP_SENDER_MAIN, 4020);
	// Guild Only Teleport Options
	// Check config file if "Harmony Guild Ship" option is enabled or not
	if(EnableHarmonyGuildShip)
	if(pPlayer->GetGuildId() == (TScriptConfig.GetFloatDefault("GuildId1",0))) pPlayer->ADD_GOSSIP_ITEM( 5, "Harmony Guild Ship", GOSSIP_SENDER_MAIN, 4025);
	
	// Check config file if "Unity Guild Ship" option is enabled or not
	if(EnableUnityGuildShip)
	if(pPlayer->GetGuildId() == (TScriptConfig.GetFloatDefault("GuildId2",0))) pPlayer->ADD_GOSSIP_ITEM( 5, "Unity Guild Ship", GOSSIP_SENDER_MAIN, 4030);
	pPlayer->ADD_GOSSIP_ITEM( 7, "<- [Main Menu]"                   , GOSSIP_SENDER_MAIN, 5005);

	pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
break;

//////////////////////////////////////////////////ALLIANCE///////////////////////////////////////////////////////////////

case 1001: // Darnassus
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, 9947.52f, 2482.73f, 1316.21f, 0.0f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 1005: // Exodar
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(530, -3954.20f, -11656.54f, -138.69f, 0.0f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 1010: // Ironforge
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, -4924.07f, -951.95f, 501.55f, 5.40f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 1015: // Stormwind
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, -8960.14f, 516.266f, 96.3568f, 0.0f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

//////////////////////////////////////////////////HORDE///////////////////////////////////////////////////////////////

case 2001: // Orgrimmar
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, 1552.5f, -4420.66f, 8.94802f, 0.0f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 2005: // Silvermoon
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(530, 9338.74f, -7277.27f, 13.7895f, 0.0f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 2010: // Thunder Bluff
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -1290.0f, 147.033997f, 129.682007f, 4.919000f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 2015: // Undercity
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, 1819.71f, 238.79f, 60.5321f, 0.0f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

//////////////////////////////////////////////////NEUTRAL///////////////////////////////////////////////////////////////

case 3001:// Ebon Hold
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, 2353.530029f, -5665.819824f, 426.028015f, 0.596);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 3005:// Booty Bay
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, -14438.2f, 472.22f, 15.32f, 0.65);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 3010: //Dalaran
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(571, 5819.08f, 643.99f, 647.80f, 3.32f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 3015: //Everlook
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, 6724.77f, -4610.68f, 720.78f, 4.78f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 3020: //Gadgetzan
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -7173.26f, -3785.60f, 8.37f, 6.13f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 3025: //Mudsprocket
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -4564.79f, -3172.38f, 33.93f, 3.21f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 3030: //Ratchet
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -956.664f, -3754.71f, 5.33239f, 0.996637f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 3035:// Shattrath City
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(530, -1850.209961f, 5435.821777f, -10.961435f, 3.403913f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 3040:// Isle Of Quel'Danas
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(530, 12947.4f,-6893.31f,5.68398f,3.09154f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

//////////////////////////////////////////////////KALIMDOR///////////////////////////////////////////////////////////////

case 6001:// Blackfathom Deeps
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, 4248.72f, 744.35f, -24.67f, 1.34f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;
  
case 6005:// Caverns of Time
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -8173.66f, -4746.36f, 33.84f, 4.94f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 6010:// Dire Maul
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -3960.95f, 1130.64f, 161.05f, 0.0f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 6015:// Maraudon
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -1431.33f, 2962.34f, 98.23f, 4.74f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 6020:// Onyxia's Lair
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -4707.44f, -3726.82f, 54.6723f, 3.8f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 6025:// Ragefire Chasm
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, 1814.47f, -4419.46f, -18.78f, 5.28f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 6030:// Razorfen Downs
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -4657.88f, -2525.59f, 81.4f, 4.16f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;
    
case 6035:// Razorfen Kraul
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -4463.6f, -1664.53f, 82.26f, 0.85f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 6040:// Ruins of Ahn'Qiraj
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -8413.33f, 1501.27f, 29.64f, 2.61f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 6045:// Temple of Ahn'Qiraj
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -8245.837891f, 1983.736206f, 129.071686f, 0.936195f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 6050:// Wailing Caverns
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -722.53f,-2226.30f,16.94f,2.71f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 6055:// Zul'Farrak
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(1, -6801.9f, -2890.22f, 8.88f, 6.25f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

//////////////////////////////////////////////////EASTERN KINGDOMS///////////////////////////////////////////////////////////////

case 7001:// Blackrock Depths
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, -7180.57, -920.04f, 165.49f, 5.02f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7005:// Blackrock Spire
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, -7526.77f, -1225.64f, 285.73f, 5.31f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7010:// Blackwing Lair
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(469, -7672.61f, -1107.21f, 396.65f, 3.75f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7015:// Deadmines
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, -11208.2f, 1675.92f, 24.57f, 1.48f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7020:// Gnomeregan
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, -5163.32f, 927.18f, 257.158, 1.44f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;
 
case 7025:// Isle Of Quel'Danas
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(530, 13010.00f, -6907.64f, 9.58f, 4.58f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7030:// Karazhan
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, -11119.6f, -2011.42f, 47.09f, 0.65f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7035:// Molten Core
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(230, 1114.85f, -457.76f, -102.81f, 3.83f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7040:// Scarlet Monastery
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, 2843.89f,-693.74f,139.32f,5.11f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7045:// Scholomance
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, 1273.06f, -2574.01f, 92.66f, 2.06f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7050:// Shadowfang Keep
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, -239.54f, 1550.8f, 76.89f, 1.18f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7055:// Stratholme
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, 3370.76f, -3343.63f, 142.26f, 5.23f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7060:// Sunken Temple
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, -10346.92f, -3851.90f, -43.41f, 6.09f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7065:// The Stockade
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, -8766.89f, 844.6f, 88.43f, 0.69f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;
 
case 7070:// Uldaman
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, -6070.72f, -2955.33f, 209.78f, 0.05f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7075:// Zul'Aman
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(530, 6851.09f, -7979.71f, 183.54f, 4.72f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 7080:// Zul'Gurub
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(0, -11916.4f, -1216.23f, 92.28f, 4.75f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

//////////////////////////////////////////////////OUTLAND///////////////////////////////////////////////////////////////

case 8001:// Auchindoun
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(530, -3322.92f, 4931.02f, -100.56f, 1.86f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 8005:// Black Temple
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(530, -3649.1f, 317.33f, 35.19f, 2.97f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 8010:// Coilfang Reservoir
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(530, 721.08f, 6846.77f, -68.75f, 0.34f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 8015:// Gruul's Lair
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(530, 3539.01f, 5082.36f, 1.69f, 0.0f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 8020:// Hellfire Citadel
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(530, -292.71f, 3146.77f, 31.60f, 2.05f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 8025:// Tempest Keep
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(530, 3087.62f, 1376.27f, 184.8f, 4.63f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

//////////////////////////////////////////////////NORTHREND///////////////////////////////////////////////////////////////

case 9001:// Ahn'Kahet
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(571, 3646.76f, 2045.17f, 1.79f, 4.37f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 9005:// Azjol-Nerub
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(571, 3675.43f, 2169.00f, 35.90f, 2.29f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 9010:// Drak'Tharon Keep
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(571, 4450.86f, -2045.25f, 162.83f, 0.00f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 9015:// Gun'Drak
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(571, 6937.54f, -4455.98f, 450.68f, 1.00f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 9020:// Icecrown Citadel
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(571, 6139.24f, 2233.72f, 510.79f, 3.56f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 9025:// Naxxramas
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(571, 3668.72f, -1262.46f, 243.622f, 4.785f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 9030:// The Nexus
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(571, 3789.95f, 6961.48f, 104.23f, 0.28f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 9035:// The Obsidian Sanctum
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(571, 3625.78f, 280.4f, -120.14f, 3.25f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 9040:// Ulduar
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(571, 1219.72f, -4865.28f, 41.25f, 0.31f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 9045:// Utgarde Keep
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(571, 1245.69f, -4856.59f, 216.86f, 3.45f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 9050:// Utgarde Pinnacle
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(571, 8976.24f, -1281.33f, 1059.01f, 0.58f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 9055:// Violet Hold
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->TeleportTo(571, 5679.82f, 486.80f, 652.40f, 4.08f);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

//////////////////////////////////////////Player Tools////////////////////////////////////////////////////////

case 4005:// Innkeeper Bind your new Home
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->SetBindPoint(pCreature->GetGUID());
break;

case 4010:// Reset Talent Points
	pPlayer->CLOSE_GOSSIP_MENU();
	pPlayer->SendTalentWipeConfirm(pCreature->GetGUID());
break;

case 4015:// Reset Pet Talent Points
	pPlayer->CLOSE_GOSSIP_MENU();
	if(pPlayer->GetPet())
	pPlayer->SendPetSkillWipeConfirm();
	else
	pCreature->MonsterWhisper("You don't have a pet.", pPlayer->GetGUID());
break;

case 4020://Remove Res Sickness
	if(!pPlayer->HasAura(SPELL_ID_PASSIVE_RESURRECTION_SICKNESS,0))
	{
		pCreature->MonsterWhisper("You don't have resurrection sickness.", pPlayer->GetGUID());
		GossipHello_TeleNPC(pPlayer, pCreature);
		return;
	}

	pCreature->CastSpell(pPlayer,38588,false); // Healing effect
	pPlayer->RemoveAurasDueToSpell(SPELL_ID_PASSIVE_RESURRECTION_SICKNESS);
	pPlayer->CLOSE_GOSSIP_MENU();
break;

 pPlayer->CLOSE_GOSSIP_MENU();

//////////////////////////////////////////GUILD////////////////////////////////////////////////////////

case 4025: //Harmony Guild Ship (if enabled in scriptdev2.conf)
	pPlayer->CLOSE_GOSSIP_MENU();
	// Read coordinates from config file
	pPlayer->TeleportTo(TScriptConfig.GetFloatDefault("MapID1",13),TScriptConfig.GetFloatDefault("X_pos1",0),TScriptConfig.GetFloatDefault("Y_pos1",0),TScriptConfig.GetFloatDefault("Z_pos1",0),0);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

case 4030: //Unity Guild Ship (if enabled in scriptdev2.conf)
	pPlayer->CLOSE_GOSSIP_MENU();
	// Read coordinates from config file
	pPlayer->TeleportTo(TScriptConfig.GetFloatDefault("MapID2",13),TScriptConfig.GetFloatDefault("X_pos2",0),TScriptConfig.GetFloatDefault("Y_pos2",0),TScriptConfig.GetFloatDefault("Z_pos2",0),0);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

//////////////////////////////////////////TOOLS////////////////////////////////////////////////////////

case 3500:// Alliance vs Horde PvP
	pPlayer->CLOSE_GOSSIP_MENU();
	if (pPlayer->GetTeam() == ALLIANCE) // PvP For Alliance
		pPlayer->TeleportTo(TScriptConfig.GetFloatDefault("MapIDA",13),TScriptConfig.GetFloatDefault("X_posA",0),TScriptConfig.GetFloatDefault("Y_posA",0),TScriptConfig.GetFloatDefault("Z_posA",0),0);
	else // PvP For Horde
		pPlayer->TeleportTo(TScriptConfig.GetFloatDefault("MapIDH",13),TScriptConfig.GetFloatDefault("X_posH",0),TScriptConfig.GetFloatDefault("Y_posH",0),TScriptConfig.GetFloatDefault("Z_posH",0),0);
break;

case 5200: //Shopping mall (if enabled in scriptdev2.conf)
	pPlayer->CLOSE_GOSSIP_MENU();
	// Read coordinates from config file
	pPlayer->TeleportTo(TScriptConfig.GetFloatDefault("MapID",13),TScriptConfig.GetFloatDefault("X_pos",0),TScriptConfig.GetFloatDefault("Y_pos",0),TScriptConfig.GetFloatDefault("Z_pos",0),0);
	pPlayer->ModifyMoney(-(TScriptConfig.GetFloatDefault("TeleGoldCost",0)));
break;

} // end of switch
} //end of function



bool GossipSelect_TeleNPC(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
	// Main menu
	if (uiSender == GOSSIP_SENDER_MAIN)
	SendDefaultMenu_TeleNPC(pPlayer, pCreature, uiAction);

return true;
}

void AddSC_telenpc()
{
    Script *newscript;

	newscript = new Script;
    newscript->Name = "telenpc";
    newscript->pGossipHello = &GossipHello_TeleNPC;
    newscript->pGossipSelect = &GossipSelect_TeleNPC;
    newscript->RegisterSelf();
}