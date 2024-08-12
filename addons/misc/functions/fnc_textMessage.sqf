#include "..\script_component.hpp"

params ["_target", "_textMessage"];

[format ["Incoming Message from Field Commander: <br/>%1", _textMessage], "warning", 5] remoteExec ["sof_client_misc_fnc_notify", _target];