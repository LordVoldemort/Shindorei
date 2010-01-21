/*
 * Copyright (C) by Kischa 6 TYR
 * Boss Scripts
 * Core Updates
 * http://sunshine-wow.de/
 * Privat-Server 
 */

/* ScriptData
SDName: Boss_Anub'Arak
SDCategory: Icecrown, Crusaders Coliseum
*/
#include "precompiled.h"
#include "trial_crusader.h"

// Spells

//yells not Insert

	//Boss_Anub'Arak
#define SPELL_FROST				= 66012,
#define SPELL_KALT				= 67700,
#define SPELL_KALT_H			= 68509,
#define SPELL_EGEL				= 67630,
#define SPELL_EGEL_H			= 68646,
	
#define SPELL_STACHEL			= 67574,

//#define SPELL_INRAGE				= 26662,
// spell 65774 SCHWARM SKARABÄUS

#define SPELL_SPHAERE1			= 67539,
#define	CREATURE_SPHAER			  34606 //cast 66193 "Permafrost"

#define SPELL_NERUB				= 66333,
#define SPELL_NERUB_H			= 67757,
#define	CREATURE_NERUBISCHER      34606 //cast 66134 "Schattenhieb"


//Nerubischer Gräber
#define SPELL_SCHWACH			= 67847,
#define SPELL_SCHATTEN			= 66134,
#define SPELL_UNTER				= 67322,


struct TRINITY_DLL_DECL boss_anub_arakAI : public ScriptedAI
{
    /*boss_anub_arakAI(Creature* c) : ScriptedAI(c)
    {
        m_pInstance = ((ScriptedInstance*)c->GetInstanceData());
        m_bIsRaidOrHeroicDungeon = c->GetMap()->IsRaidOrHeroicDungeon();
    }


	uint32 FROST_Timer;
	uint32 NERUB_Timer;
	uint32 KALT_Timer;
	uint32 EGEL_Timer;


    ScriptedInstance* m_pInstance;
	bool m_bIsRaidOrHeroicDungeon;
	bool InitialSpawn;

    void Reset()
    {
		FROST_Timer = 500;
		NERUB_Timer = 15000;
		KALT_Timer = 21000;
		EGEL_Timer = 40000;
    }

    void KilledUnit(Unit *victim)
    {
    }

    void Aggro(Unit* pWho)
    {
        DoZoneInCombat();
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
//SPELLS TODO:
        if (FROST_Timer <= diff)
        {
            DoCast(m_creature->getVictim(),SPELL_FROST);
            FROST_Timer = 8000 + rand()%4000;
        } else FROST_Timer -= diff;


            if (NERUB_Timer <= diff)//SPAWN CREATURE_NERUBISCHER
            {
                DoCast(m_creature->getVictim(), m_bIsRaidOrHeroicDungeon ? SPELL_NERUB_H : SPELL_NERUB);
                NERUB_Timer = 50000;
            } else NERUB_Timer -= diff;

            if (KALT_Timer <= diff)
            {
                Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
                DoCast(pTarget, m_bIsRaidOrHeroicDungeon ? SPELL_KALT_H : SPELL_KALT);

                KALT_Timer = 13000 + rand()%9000;
            } else KALT_Timer -= diff;

            if (EGEL_Timer <= diff)
            {
                Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
                DoCast(pTarget, m_bIsRaidOrHeroicDungeon ? SPELL_EGEL_H : SPELL_EGEL);

                EGEL_Timer = 35000 + rand()%5000;
            } else EGEL_Timer -= diff;
		}
    }

    void JustDied(Unit *pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_ANUB, DONE);
    }

};

CreatureAI* GetAI_boss_anub_arak(Creature* pCreature)
{
    return new boss_anub_arakAI(pCreature);
}

//id 34607 mob_nerub braucht aura 66129
struct TRINITY_DLL_DECL mob_nerub_AI : public ScriptedAI
{
    mob_nerub_AI(Creature *c) : ScriptedAI(c) {}

    uint32 SCHWACH_Timer;
	uint32 SCHATTEN_Timer;
	uint32 UNTER_Timer;

    void Reset()
    {
        SCHWACH_Timer = 0;
		SCHATTEN_Timer = 5000;
		UNTER_Timer = 30000;
    }

	void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;

        if (SCHWACH_Timer < diff)
        {
            DoCast(m_creature->getVictim(),SPELL_SCHWACH);
            SCHWACH_Timer = 8000 + rand()%6000;
        } else SCHWACH_Timer -= diff;

        if (SCHATTEN_Timer < diff)
        {
            DoCast(m_creature->getVictim(),SPELL_SCHATTEN);
            SCHATTEN_Timer = 3000 + rand()%2000;
        } else SCHATTEN_Timer -= diff;

        if (UNTER_Timer < diff)
        {
            DoCast(m_creature,SPELL_UNTER);
            UNTER_Timer = 60000 + rand()%30000;
        } else UNTER_Timer -= diff;



        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_nerub(Creature* pCreature)
{
    return new mob_nerub_AI (pCreature);*/
};

void AddSC_boss_anub_arak()
{
}
