#include "..\script_component.hpp"

params ["_condition", "_type", "_amount", "_player"];

private _newBank = 0;
private _newCash = 0;

private _bank = _player getVariable ["Cash_Bank", 0];
private _cash = _player getVariable ["Cash", 0];
private _uid =  getPlayerUID _player;

switch (_condition) do {
	case "advance": {
		if (_type == "Cash") then {
			_newCash = _cash + _amount;
			_player setVariable ["Cash", _newCash, true];
			["hsetid", _uid, "Cash", -1, [_newCash], "", "null", false] call dragonfly_db_fnc_addTask;
		};

		if (_type == "Bank") then {
			_newBank = _bank + _amount;
			_player setVariable ["Cash_Bank", _newBank, true];
			["hsetid", _uid, "Cash_Bank", -1, [_newBank], "", "null", false] call dragonfly_db_fnc_addTask;
		};
	};
	case "deduct": {
		if (_type == "Cash") then {
			_newCash = _cash - _amount;
			_player setVariable ["Cash", _newCash, true];
			["hsetid", _uid, "Cash", -1, [_newCash], "", "null", false] call dragonfly_db_fnc_addTask;
		};

		if (_type == "Bank") then {
			_newBank = _bank - _amount;
			_player setVariable ["Cash_Bank", _newBank, true];
			["hsetid", _uid, "Cash_Bank", -1, [_newBank], "", "null", false] call dragonfly_db_fnc_addTask;
		};
	};
};