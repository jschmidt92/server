#include "..\script_component.hpp"

_mC = "SOF_CfgLockers";
_lockers = "true" configClasses (missionConfigFile >> "SOF_CfgLockers" >> "lockers");

{
	private _configName = configName(_x);
	private _className = (missionConfigFile >> _mC >> "lockers" >> _configName >> "className") call BFUNC(getCfgData);
	private _pos = (missionConfigFile >> _mC >> "lockers" >> _configName >> "pos") call BFUNC(getCfgData);
	private _dir = (missionConfigFile >> _mC >> "lockers" >> _configName >> "dir") call BFUNC(getCfgData);
	private _lockerName = (missionConfigFile >> _mC >> "lockers" >> _configName >> "lockerName") call BFUNC(getCfgData);

	private _locker = createSimpleObject [_className, [0, 0, 0]];
	_locker setPosATL _pos;
	_locker setDir _dir;
	_locker allowDamage false;

	diag_log text format ["ClassName: '%1' Pos: '%2' Dir: '%3' LockerName: '%4'", _className, _pos, _dir, _lockerName];
	
	_locker setVariable ["isLocker", [_lockerName], true];
} forEach _lockers;