/* ScriptData
SDName: Boss_Acidmaw
SD%Complete: 0
SDComment: not complete
SDCategory: Icecrown, Crusaders Coliseum
EndScriptData */

#include "precompiled.h"

// Not Spells defined yet.

struct TRINITY_DLL_DECL boss_acidmawAI : public ScriptedAI
{
    boss_acidmawAI(Creature *c) : ScriptedAI(c) {}

    void Reset(){}
    void EnterCombat(Unit* who){}
    void AttackStart(Unit* who) {}
    void MoveInLineOfSight(Unit* who) {}
    void UpdateAI(const uint32 diff){}
    void JustDied(Unit* killer){}
    void KilledUnit(Unit *victim){}
};

CreatureAI* GetAI_boss_acidmaw(Creature* pCreature)
{
    return new boss_acidmawAI (pCreature);
}

void AddSC_boss_acidmaw()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_acidmaw";
    newscript->GetAI = &GetAI_boss_acidmaw;
    newscript->RegisterSelf();
}
