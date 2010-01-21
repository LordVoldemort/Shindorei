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
SDName: item_levelplayer
SD%Complete: 100
SDComment: Used for Leveling characters Random
SDCategory: Items
EndScriptData */

#include"precompiled.h"
 
bool ItemUse_item_levelplayer(Player* pPlayer, Item* pItem, const SpellCastTargets &pTargets)
{
if ((pPlayer->isInCombat()) || (pPlayer->isInFlight()) || (pPlayer->isDead()))
{
      pPlayer->SendEquipError(EQUIP_ERR_NOT_IN_COMBAT, pItem, NULL);
        return false;
}
if (pPlayer->IsMounted()) // Is player mounted
{
      pPlayer->SendEquipError(EQUIP_ERR_CANT_DO_RIGHT_NOW, pItem, NULL);
        return true;
}

    outstring_log("player level %i",pPlayer->getLevel());
    if(((pPlayer->getLevel()) + 5) > 80)
    {
        outstring_log("playerlevel+5 > 80 (%i+5=%i)",pPlayer->getLevel(),pPlayer->getLevel()+5);
        if((80 - (pPlayer->getLevel())) > 0)
        {
            outstring_log("leveling for %i levels",(80-(pPlayer->getLevel())));
            pPlayer->GiveLevel(pPlayer->getLevel()+(80 - (pPlayer->getLevel())));  
        }
        else
        {
            outstring_log("level would be 81+, exiting function");
            return true;
        }
    }
    else
    {
        outstring_log("Ajoute 5 levels");
        pPlayer->GiveLevel(pPlayer->getLevel()+5);
    }
    pPlayer->DestroyItemCount(pItem->GetEntry(),1,true);
    return true;
}
void AddSC_item_levelplayer()
{
    Script *newscript;

      newscript = new Script;
    newscript->Name="item_levelplayer";
    newscript->pItemUse = &ItemUse_item_levelplayer;
    newscript->RegisterSelf();
    outstring_log("SD2: item_levelplayer loaded");
}