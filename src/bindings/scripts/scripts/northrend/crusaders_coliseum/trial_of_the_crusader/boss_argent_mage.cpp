/* ScriptData
SDName: Boss_Argent_Mage
SD%Complete: 0
SDComment: not complete
SDCategory: Icecrown, Crusaders Coliseum
EndScriptData */

#include "precompiled.h"

// Not Spells defined yet.

struct TRINITY_DLL_DECL boss_argent_mageAI : public ScriptedAI
{
    boss_argent_mageAI(Creature *c) : ScriptedAI(c) {}

    void Reset(){}
    void EnterCombat(Unit* who){}
    void AttackStart(Unit* who) {}
    void MoveInLineOfSight(Unit* who) {}
    void UpdateAI(const uint32 diff){}
    void JustDied(Unit* killer){}
    void KilledUnit(Unit *victim){}
};

CreatureAI* GetAI_boss_argent_mage(Creature* pCreature)
{
    return new boss_argent_mageAI (pCreature);
}

void AddSC_boss_argent_mage()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_argent_mage";
    newscript->GetAI = &GetAI_boss_argent_mage;
    newscript->RegisterSelf();
}