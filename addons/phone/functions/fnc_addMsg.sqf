#include "..\script_component.hpp"

params [["_key", "", [""]], ["_data", [], [[]]]];

["listadd", _key, "", -1, _data, "", false] call dragonfly_db_fnc_addTask;