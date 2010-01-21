/* ScriptData
SDName: Boss_Jaruxxus
SDCategory: Icecrown, Crusaders Coliseum
EndScriptData */

#include "precompiled.h"
#include "trial_crusader.h"

//Spells to DO!

//No Yells!
#define SPELL_METEOR			= 66532,
#define SPELL_METEOR_H			= 66964,

#define SPELL_BLITZ				= 66528,
#define SPELL_BLITZ_H			= 67030,

#define SPELL_ASCHE				= 66237,
#define SPELL_ASCHE_H			= 67050,

#define SPELL_LEGION			= 68124,
#define SPELL_LEGION_H			= 68127,



struct TRINITY_DLL_DECL boss_jaruxxusAI : public ScriptedAI
{
    boss_jaruxxusAI(Creature* c) : ScriptedAI(c)
    {
        m_pInstance = ((ScriptedInstance*)c->GetInstanceData());
        m_bIsRaidOrHeroicDungeon = c->GetMap()->IsRaidOrHeroicDungeon();
    }


	uint32 METEOR_Timer;
	uint32 BLITZ_Timer;
	uint32 ASCHE_Timer;
	uint32 LEGION_Timer;


    ScriptedInstance* m_pInstance;

	bool m_bIsRaidOrHeroicDungeon;

    void Reset()
    {
		METEOR_Timer = 15000;
		BLITZ_Timer = 500;
		ASCHE_Timer = 8000;
		LEGION_Timer = 18000;
    }

    void KilledUnit(Unit *victim)
    {
    }

    void JustDied(Unit *victim)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_JARUX, DONE);
    }

    void Aggro(Unit* pWho)
    {
        DoZoneInCombat();
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;

        /*if (METEOR_Timer <= diff)
        {
            DoCast(m_creature->getVictim(), m_bIsRaidOrHeroicDungeon ? SPELL_METEOR_H : SPELL_METEOR);
            METEOR_Timer = 25000 + rand()%10000;
        } else METEOR_Timer -= diff;

        if (BLITZ_Timer <= diff)
        {
            Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
            DoCast(pTarget, m_bIsRaidOrHeroicDungeon ? SPELL_BLITZ_H : SPELL_BLITZ);

            BLITZ_Timer = 8000 + rand()%5000;
        } else BLITZ_Timer -= diff;

		if (ASCHE_Timer <= diff)
        {
            DoCast(m_creature->getVictim(), m_bIsRaidOrHeroicDungeon ? SPELL_ASCHE_H : SPELL_ASCHE);
            ASCHE_Timer = 30000 + rand()%10000;
        } else ASCHE_Timer -= diff;

        if (LEGION_Timer <= diff)
        {
            Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
            DoCast(pTarget, m_bIsRaidOrHeroicDungeon ? SPELL_LEGION_H : SPELL_LEGION);

            LEGION_Timer = 16000 + rand()%4000;
        } else LEGION_Timer -= diff;*/
    }
};

CreatureAI* GetAI_boss_jaruxxus(Creature* pCreature)
{
    return new boss_jaruxxusAI(pCreature);
}

void AddSC_boss_jaruxxus()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_jaruxxus";
    newscript->GetAI = &GetAI_boss_jaruxxus;
    newscript->RegisterSelf();
}