/* ScriptData
SDName: Boss_Bealnor_Lightbearer
SD%Complete: 0
SDComment: not complete
SDCategory: Icecrown, Crusaders Coliseum
EndScriptData */

#include "precompiled.h"

// Not Spells defined yet.

struct TRINITY_DLL_DECL boss_bealnor_lightbearerAI : public ScriptedAI
{
    boss_bealnor_lightbearerAI(Creature *c) : ScriptedAI(c) {}

    void Reset(){}
    void EnterCombat(Unit* who){}
    void AttackStart(Unit* who) {}
    void MoveInLineOfSight(Unit* who) {}
    void UpdateAI(const uint32 diff){}
    void JustDied(Unit* killer){}
    void KilledUnit(Unit *victim){}
};

CreatureAI* GetAI_boss_bealnor_lightbearer(Creature* pCreature)
{
    return new boss_bealnor_lightbearerAI (pCreature);
}

void AddSC_boss_bealnor_lightbearer()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_bealnor_lightbearer";
    newscript->GetAI = &GetAI_boss_bealnor_lightbearer;
    newscript->RegisterSelf();
}