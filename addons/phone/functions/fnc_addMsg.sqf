#include "..\script_component.hpp"

params [["_key", "", [""]], ["_data", [], [[]]]];

["listadd", _key, "", -1, _data, "", "null", false] call dragonfly_db_fnc_addTask;