/* ScriptData
SDName: Boss_Anthar_Forgemender
SD%Complete: 0
SDComment: not complete
SDCategory: Icecrown, Crusaders Coliseum
EndScriptData */

#include "precompiled.h"

// Not Spells defined yet.

struct TRINITY_DLL_DECL boss_anthar_forgemenderAI : public ScriptedAI
{
    boss_anthar_forgemenderAI(Creature *c) : ScriptedAI(c) {}

    void Reset(){}
    void EnterCombat(Unit* who){}
    void AttackStart(Unit* who) {}
    void MoveInLineOfSight(Unit* who) {}
    void UpdateAI(const uint32 diff){}
    void JustDied(Unit* killer){}
    void KilledUnit(Unit *victim){}
};

CreatureAI* GetAI_boss_anthar_forgemender(Creature* pCreature)
{
    return new boss_anthar_forgemenderAI (pCreature);
}

void AddSC_boss_anthar_forgemender()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_anthar_forgemender";
    newscript->GetAI = &GetAI_boss_anthar_forgemender;
    newscript->RegisterSelf();
}
