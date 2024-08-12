#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main", "ace_main"};
        authors[] = {"J. Schmidt", "Creedcoder"};
        author = "SOF";
        VERSION_CONFIG;

        serverSaveLoop = 0;
        serverSaveLoopTime = 30;
        companyGenerals[] = {"76561198027566824"};
        AISkill = 0.8;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMods.hpp"