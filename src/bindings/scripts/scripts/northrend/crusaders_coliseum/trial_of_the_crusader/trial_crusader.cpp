/* ContentData
npc_toc5_announcer
EndContentData */

#include "precompiled.h"
#include "trial_crusader.h"

#define GOSSIP_START_EVENT1     "I'm ready to start challenge."
#define GOSSIP_START_EVENT2     "I'm ready for the next challenge."

/*######
## npc_toc5_announcer
######*/

struct TRINITY_DLL_DECL npc_toc_announcerAI : public ScriptedAI
{
    npc_toc_announcerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* pInstance;
 
    uint32 chmp1, chmp2, argent;

    void Reset()
    {
    }

    void StartEvent(Player* pPlayer)
    {
        if(pInstance->GetData(TYPE_GRAND_CHAMPIONS) == NOT_STARTED && pInstance->GetData(TYPE_ARGENT_CHALLENGE) == NOT_STARTED && pInstance->GetData(TYPE_BLACK_KNIGHT) == NOT_STARTED)
        {
            chmp1 = 34497;
            chmp2 = 34496;
            if(chmp1 != chmp2 && chmp2 != chmp1 && chmp1 != chmp2)
			{
                m_creature->SummonCreature(chmp1, 738.665771, 661.031433, 412.394623, 4.698702, TEMPSUMMON_MANUAL_DESPAWN, 0);
                m_creature->SummonCreature(chmp2, 754.360779, 660.816162, 412.395996, 4.698700, TEMPSUMMON_MANUAL_DESPAWN, 0);
                pInstance->SetData(TYPE_GRAND_CHAMPIONS, IN_PROGRESS);
            } else return;
        }

        if(pInstance->GetData(TYPE_GRAND_CHAMPIONS) == DONE && pInstance->GetData(TYPE_ARGENT_CHALLENGE) == NOT_STARTED && pInstance->GetData(TYPE_BLACK_KNIGHT) == NOT_STARTED)
        {
           argent = 34780;
	    m_creature->SummonCreature(argent, 746.864441, 660.918762, 411.695465, 4.698700, TEMPSUMMON_MANUAL_DESPAWN, 0);
           pInstance->SetData(TYPE_ARGENT_CHALLENGE, IN_PROGRESS);
        }

        if(pInstance->GetData(TYPE_GRAND_CHAMPIONS) == DONE && pInstance->GetData(TYPE_ARGENT_CHALLENGE) == DONE && pInstance->GetData(TYPE_BLACK_KNIGHT) == NOT_STARTED)
        {
	    m_creature->SummonCreature(NPC_BLACK_KNIGHT, 746.864441, 660.918762, 411.695465, 4.698700, TEMPSUMMON_MANUAL_DESPAWN, 0);
	    pInstance->SetData(TYPE_BLACK_KNIGHT, IN_PROGRESS);
           m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }
    }

    void UpdateAI(const uint32 diff)
    {

    }
};

CreatureAI* GetAI_npc_toc_announcer(Creature* pCreature)
{
    return new npc_toc_announcerAI(pCreature);
}

bool GossipHello_npc_toc_announcer(Player* pPlayer, Creature* pCreature)
{
    ScriptedInstance* pInstance = pCreature->GetInstanceData();

    if(pInstance->GetData(TYPE_GRAND_CHAMPIONS) == NOT_STARTED && pInstance->GetData(TYPE_ARGENT_CHALLENGE) == NOT_STARTED && pInstance->GetData(TYPE_BLACK_KNIGHT) == NOT_STARTED)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_START_EVENT1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
    else 
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_START_EVENT2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

    pPlayer->SEND_GOSSIP_MENU(pCreature->GetEntry(), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_toc_announcer(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        CAST_AI(npc_toc_announcerAI, pCreature->AI())->StartEvent(pPlayer);
    }

    return true;
}

void AddSC_trial_crusader()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "npc_toc_announcer";
    NewScript->GetAI = &GetAI_npc_toc_announcer;
    NewScript->pGossipHello = &GossipHello_npc_toc_announcer;
    NewScript->pGossipSelect = &GossipSelect_npc_toc_announcer;
    NewScript->RegisterSelf();
}