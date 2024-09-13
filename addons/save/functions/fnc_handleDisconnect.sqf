#include "..\script_component.hpp"

/*
	@file Title: ArmaDragonflyClient Framework by Creedcoder, J.Schmidt
	@file Version: 0.1
	@file Name: fnc_savePlayer.sqf
	@file Author: Creedcoder, J.Schmidt
	@file edit: 03.25.2024
	Copyright © 2024 Creedcoder, J.Schmidt, All rights reserved

	Do not edit without permission!

	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
	444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

	Save Player to DB:
*/

addMissionEventHandler ["HandleDisconnect", {
	// params ["_unit", "_id", "_uid", "_name"];

	private _unit = _this select 0;
	private _uid = _this select 2;
	private _data = [
	_uid,
	"armory_unlocks", [_unit getVariable ["Armory_Unlocks", []]],
	"garage_unlocks", [_unit getVariable ["Garage_Unlocks", []]],
	"locker", [_unit getVariable ["Locker", []]],
	"garage", [_unit getVariable ["Garage", []]],
	"cash", [_unit getVariable ["Cash", 0]],
	"bank", [_unit getVariable ["Cash_Bank", 0]],
	"number", [_unit getVariable ["SOF_Phone_Number", "unknown"]],
	"email", [_unit getVariable ["SOF_Email", "unknown@spearnet.mil"]],
	"paygrade", [_unit getVariable ["Paygrade", "E1"]],
	"reputation", [rating _unit],
	"loadout", [getUnitLoadout _unit],
	"holster", [_unit getVariable ["SOF_HolsterWeapon", true]],
	"position", [getPosASLVisual _unit],
	"direction", [getDirVisual _unit]
	];

	if (vehicle _unit == _unit) then {
		_data pushBack "currentWeapon";
		_data pushBack [currentMuzzle _unit];
		_data pushBack "stance";
		_data pushBack [stance _unit];
	};

	// ["hsetidbulk", "", "", -1, _data, "", false] call dragonfly_db_fnc_addTask;
	["hsetidbulk", "", "", -1, _data, "", false] remoteExecCall ["dragonfly_db_fnc_addTask", 2, false];

	deleteVehicle _unit;
}];