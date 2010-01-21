#include "precompiled.h"
#include "eye_of_eternity.h"

struct TRINITY_DLL_DECL instance_eye_of_eternity : public ScriptedInstance
{
    instance_eye_of_eternity(Map* pMap) : ScriptedInstance(pMap), AlexstraszasGift(NULL) {Initialize();};

    uint32 m_auiEncounter[MAX_ENCOUNTER];
    std::string str_data;

    uint64 Malygos;
	uint64 uiGift;
	
    GameObject* AlexstraszasGift;

    void Initialize()
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));

        Malygos = 0;
        AlexstraszasGift = 0;
    }

    void OnCreatureCreate(Creature* pCreature, bool add)
    {
        switch(pCreature->GetEntry())
        {
            case 28859: Malygos = pCreature->GetGUID(); break;
        }
    }

    void OnGameObjectCreate(GameObject* pGo, bool add)
    {
        switch(pGo->GetEntry())
        {
            case 193905: AlexstraszasGift = add ? pGo : NULL; break;
            //case ??: AlexstraszasGift = add ? pGo : NULL; break;           Heroic, id?
        }
    }

    void SetData(uint32 type, uint32 data)
    {
        switch(type)
        {
        case DATA_MALYGOS_EVENT:
            if (data == DONE && AlexstraszasGift)
                AlexstraszasGift->SetRespawnTime(AlexstraszasGift->GetRespawnDelay());
            m_auiEncounter[0] = data;
            GameObject *Chest;

				if(data == DONE && (Chest = instance->GetGameObject(uiGift)))
					Chest->SetGoState(GO_STATE_READY); // GO_STATE_ACTIVE, 
            break;
        }

        if (data == DONE)
            SaveToDB();
    }

    uint32 GetData(uint32 type)
    {
        switch(type)
        {
            case DATA_MALYGOS_EVENT:             return m_auiEncounter[0];
        }

        return 0;
    }

    uint64 GetData64(uint32 type)
    {
        switch(type)
        {
            case DATA_MALYGOS:                   return Malygos;
        }

        return 0;
    }
};

InstanceData* GetInstanceData_instance_eye_of_eternity(Map* pMap)
{
    return new instance_eye_of_eternity(pMap);
}

void AddSC_instance_eye_of_eternity()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_eye_of_eternity";
    newscript->GetInstanceData = &GetInstanceData_instance_eye_of_eternity;
    newscript->RegisterSelf();
}
