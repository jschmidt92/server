#include "..\script_component.hpp"

_mC = "SOF_CfgStores";
_stores = "true" configClasses (missionConfigFile >> "SOF_CfgStores" >> "stores");

{
	private _configName = configName(_x);
	private _className = (missionConfigFile >> _mC >> "stores" >> _configName >> "className") call BFUNC(getCfgData);
	private _pos = (missionConfigFile >> _mC >> "stores" >> _configName >> "pos") call BFUNC(getCfgData);
	private _dir = (missionConfigFile >> _mC >> "stores" >> _configName >> "dir") call BFUNC(getCfgData);
	private _storeCategories = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeCategories") call BFUNC(getCfgData);
	private _storeRestrictedCategories = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeRestrictedCategories") call BFUNC(getCfgData);
	private _storeModset = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeModset") call BFUNC(getCfgData);
	private _storePaymentMethods = (missionConfigFile >> _mC >> "stores" >> _configName >> "storePaymentMethods") call BFUNC(getCfgData);
	private _storeName = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeName") call BFUNC(getCfgData);
	private _storeBackpacks = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeBackpacks") call BFUNC(getCfgData);
	private _storeGoggles = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeGoggles") call BFUNC(getCfgData);
	private _storeHeadgear = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeHeadgear") call BFUNC(getCfgData);
	private _storeItems = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeItems") call BFUNC(getCfgData);
	private _storeMagazines = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeMagazines") call BFUNC(getCfgData);
	private _storeUniforms = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeUniforms") call BFUNC(getCfgData);
	private _storeVests = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeVests") call BFUNC(getCfgData);
	private _storeWeapons = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeWeapons") call BFUNC(getCfgData);
	private _storeAircraft = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeAircraft") call BFUNC(getCfgData);
	private _storeArmored = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeArmored") call BFUNC(getCfgData);
	private _storeChopper = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeChopper") call BFUNC(getCfgData);
	private _storeMarine = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeMarine") call BFUNC(getCfgData);
	private _storeStatic = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeStatic") call BFUNC(getCfgData);
	private _storeUAV = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeUAV") call BFUNC(getCfgData);
	private _storeUGV = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeUGV") call BFUNC(getCfgData);
	private _storeWheeled = (missionConfigFile >> _mC >> "stores" >> _configName >> "storeWheeled") call BFUNC(getCfgData);

	private _store = createSimpleObject [_className, [0, 0, 0]];
	_store setPosATL _pos;
	_store setDir _dir;
	_store allowDamage false;

	diag_log text format ["ClassName: '%1' Pos: '%2' Dir: '%3' StoreName: '%4'", _className, _pos, _dir, _storeName];
	
	_store setVariable ["isStore", [_storeCategories, _storeModset, _storePaymentMethods, _storeName, _storeBackpacks, _storeGoggles, _storeHeadgear, _storeItems, _storeMagazines, _storeUniforms, _storeVests, _storeWeapons, _storeAircraft, _storeArmored, _storeChopper, _storeMarine, _storeStatic, _storeUAV, _storeUGV, _storeWheeled, _storeRestrictedCategories], true];
} forEach _stores;