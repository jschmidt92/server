#include "..\script_component.hpp"

_data = _this;

if (_data isEqualTo [""]) then {
    companyGenerals = (configFile >> "CfgPatches" >> "sof_server_main" >> "companyGenerals") call BFUNC(getCfgData);
    publicVariable "companyGenerals";

    companyFunds = "OP_BUDGET" call BFUNC(getParamValue);
    publicVariable "companyFunds";

    companyRating = "OP_RATING" call BFUNC(getParamValue);
    publicVariable "companyRating";

    companyArsenalUnlocks = [[],[],[],[]];
    publicVariable "companyArsenalUnlocks";

    companyGarageUnlocks = [[],[],[],[],[],[]];
    publicVariable "companyGarageUnlocks";

    diag_log "No Server Entry Found!";
    ["save"] call FUNC(handleServerState);

    value_serverDone = true;
    publicVariable "value_serverDone";
} else {
    for "_i" from 0 to (count _data - 1) step 2 do {
        _key = _data select _i;
        _value = _data select (_i + 1);

        if (_value isEqualType []) then {
            _value = _value select 0;
        };

        switch (_key) do {
            case "funds": { companyFunds = _value; publicVariable "companyFunds" };
            case "rating": { companyRating = _value; publicVariable "companyRating" };
            case "operations": { companyGenerals = _value; publicVariable "companyGenerals" };
            case "armory_unlocks": { companyArsenalUnlocks = _value; publicVariable "companyArsenalUnlocks" };
            case "garage_unlocks": { companyGarageUnlocks = _value; publicVariable "companyGarageUnlocks" };
        };
    };

    value_serverDone = true;
    publicVariable "value_serverDone";
};