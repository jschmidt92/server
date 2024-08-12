#include "script_component.hpp"

// information on this addon specifically
class CfgPatches {
	class ADDON {
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"sof_server_main"};
		authors[] = {"J. Schmidt", "Creedcoder"}; // sub array of authors, considered for the specific addon, can be removed or left empty {}
		author = "SOF"; // primary author name, either yours or your team's, considered for the whole mod
		VERSION_CONFIG;
	};
};

// configs go here
#include "CfgEventHandlers.hpp"