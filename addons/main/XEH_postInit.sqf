#include "script_component.hpp"

// addMissionEventHandler ["ExtensionCallback", {
//  params ["_name", "_function", "_data"];
//  diag_log _this;
//  if (_name isEqualTo "ArmaDragonflyClient") then {
//   parseSimpleArray _data call (missionNamespace getVariable [_function, {
//    hint "Function does not exist!"
//   }]);
//  };
// }];