#include "..\script_component.hpp"

_mC = "SOF_CfgGarages";
_garages = "true" configClasses (missionConfigFile >> "SOF_CfgGarages" >> "garages");

{
	private _configName = configName(_x);
	private _className = (missionConfigFile >> _mC >> "garages" >> _configName >> "className") call BFUNC(getCfgData);
	private _pos = (missionConfigFile >> _mC >> "garages" >> _configName >> "pos") call BFUNC(getCfgData);
	private _dir = (missionConfigFile >> _mC >> "garages" >> _configName >> "dir") call BFUNC(getCfgData);
	private _garageName = (missionConfigFile >> _mC >> "garages" >> _configName >> "garageName") call BFUNC(getCfgData);

	private _garage = createSimpleObject [_className, [0, 0, 0]];
	_garage setPosATL _pos;
	_garage setDir _dir;
	_garage allowDamage false;

	diag_log text format ["ClassName: '%1' Pos: '%2' Dir: '%3' GarageName: '%4'", _className, _pos, _dir, _garageName];
	
	_garage setVariable ["isGarage", [_garageName], true];
} forEach _garages;