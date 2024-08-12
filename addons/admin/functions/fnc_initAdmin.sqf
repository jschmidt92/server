#include "..\script_component.hpp"

_mC = "SOF_CfgCpofs";
_cpofs = "true" configClasses (missionConfigFile >> "SOF_CfgCpofs" >> "cpofs");

{
	private _configName = configName(_x);
	private _className = (missionConfigFile >> _mC >> "cpofs" >> _configName >> "className") call BFUNC(getCfgData);
	private _pos = (missionConfigFile >> _mC >> "cpofs" >> _configName >> "pos") call BFUNC(getCfgData);
	private _dir = (missionConfigFile >> _mC >> "cpofs" >> _configName >> "dir") call BFUNC(getCfgData);
	private _cpofName = (missionConfigFile >> _mC >> "cpofs" >> _configName >> "cpofName") call BFUNC(getCfgData);

	private _cpof = createSimpleObject [_className, [0, 0, 0]];
	_cpof setPosATL _pos;
	_cpof setDir _dir;
	_cpof allowDamage false;

	diag_log text format ["ClassName: '%1' Pos: '%2' Dir: '%3' CPOFName: '%4'", _className, _pos, _dir, _cpofName];
	
	_cpof setVariable ["isCPOF", [_cpofName], true];
} forEach _cpofs;