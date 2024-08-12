#include "..\script_component.hpp"

value_serverDone = false;
publicVariable "value_serverDone";

diag_log "Executing SOF Server Side Functions...";

[] call EFUNC(save,handleDisconnect);
diag_log "Server Handle Disconnect Initialized.";

["load"] call FUNC(handleServerState);
diag_log "Server Handle Server State Initialized.";

true spawn {
	if (((configFile >> "CfgPatches" >> "sof_server_main" >> "serverSaveLoop") call BFUNC(getCfgData)) == 0) exitWith { diag_log "Server Save Disabled"; };
	while { true } do {
		sleep ((configFile >> "CfgPatches" >> "sof_server_main" >> "serverSaveLoopTime") call BFUNC(getCfgData));
		["save"] call FUNC(handleServerState);
	};
};