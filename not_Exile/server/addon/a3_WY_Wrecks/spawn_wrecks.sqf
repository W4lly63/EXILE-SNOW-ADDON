if(isServer) then {
  #include "fn_settings.sqf"
  private ["_pos","_wreckSpawned","_wreckModel","_centerOfMap","_foundPlacesToSpawn"];
  _numbOf_wrecks = floor random _wrecksMinMax;
  _foundPlacesToSpawn =[];

  if(_staticSpawnPlaces) then {
    {

      for "_i" from 0 to (_numbOf_wrecks -1) do {
          _pos = [ _x select 0,  _x  select 1, _x select 2,  _x select 3, 0, 0.7, 0, _blackListAreas] call BIS_fnc_findSafePos;
          _wreckModel = selectRandom _wrecksTypes;
          _wreckSpawned = _wreckModel createvehicle  _pos;
          [_wreckSpawned, ["<t color='#FF0000'>Remove Wreck</t>", { []execVM  "Snow\removeWreck.sqf"}]] remoteExec ["addAction", 0, _wreckSpawned];
      };
    }  forEach _spawn_place;
  }else{
    _centerOfMap = [worldSize / 2, worldsize / 2, 0];
    _maxDistSW = (worldSize / 2) - 1000;
    for "_h" from 0 to (_numbOfDynamicSpawnPlaces -1) do {
         _foundPlacesToSpawn pushBack [ _centerOfMap,  500, _maxDistSW,  10, 0, 0.7, 0, _blackListAreas] call BIS_fnc_findSafePos;
    };
    {
      for "_i" from 0 to (_numbOf_wrecks -1) do {
          _pos = [ _x select 0,  _x  select 1, _x select 2,  _x select 3, 0, 0.7, 0, _blackListAreas] call BIS_fnc_findSafePos;
          _wreckModel = selectRandom _wrecksTypes;
          _wreckSpawned = _wreckModel createvehicle  _pos;
          [_wreckSpawned, ["<t color='#FF0000'>Remove Wreck</t>", { []execVM  "Snow\removeWreck.sqf"}]] remoteExec ["addAction", 0, _wreckSpawned];
      };
    }  forEach _foundPlacesToSpawn;
  };

};