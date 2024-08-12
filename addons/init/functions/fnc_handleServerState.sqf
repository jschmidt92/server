#include "..\script_component.hpp"

params ["_condition"];

switch (_condition) do {
	case "save": {
		private _data = [
		"CompanyState",
		"funds", [companyFunds],
		"rating", [companyRating],
		"operations", [companyGenerals],
		"armory_unlocks", [companyArsenalUnlocks],
		"garage_unlocks", [companyGarageUnlocks]
		];

		["hsetidbulk", "", "", -1, _data, "", "null", false] call dragonfly_db_fnc_addTask;
	};
	case "load": {
		["hgetallid", "CompanyState", "", -1, [], "sof_server_init_fnc_handleServerStateLoad", "null", false] call dragonfly_db_fnc_addTask;
	};
};