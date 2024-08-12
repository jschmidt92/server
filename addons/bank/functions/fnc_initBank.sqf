#include "..\script_component.hpp"

_mC = "SOF_CfgBanks";
_banks = "true" configClasses (missionConfigFile >> "SOF_CfgBanks" >> "banks");

{
	private _configName = configName(_x);
	private _className = (missionConfigFile >> _mC >> "banks" >> _configName >> "className") call BFUNC(getCfgData);
	private _pos = (missionConfigFile >> _mC >> "banks" >> _configName >> "pos") call BFUNC(getCfgData);
	private _dir = (missionConfigFile >> _mC >> "banks" >> _configName >> "dir") call BFUNC(getCfgData);
	private _bankName = (missionConfigFile >> _mC >> "banks" >> _configName >> "bankName") call BFUNC(getCfgData);

	private _bank = createSimpleObject [_className, [0, 0, 0]];
	_bank setPosATL _pos;
	_bank setDir _dir;
	_bank allowDamage false;

	diag_log text format ["ClassName: '%1' Pos: '%2' Dir: '%3' BankName: '%4'", _className, _pos, _dir, _bankName];
	
	_bank setVariable ["isBank", [_bankName], true];
} forEach _banks;