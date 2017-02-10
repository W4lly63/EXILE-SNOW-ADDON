waitUntil {alive player && ! isNull player};
sleep 5;
waitUntil {(!isNull (findDisplay 46))};

waitUntil{ !isNil {missionNamespace getVariable (format ["GGPDB%1", getPlayerUID player])} };
0 = 0 spawn {
     private ['_exit','_activeScripts','_file'];
     _exit = false;
     while {true} do {
          _activeScripts = diag_activeSQFScripts;
          _exit = true;
          {
               _file = _x select 1;
               if (['initPlayerLocal.sqf',_file,false] call BIS_fnc_inString) then {
                    _exit = false;
               };
          } count _activeScripts;
          if (_exit) exitWith {};
     };
};
sleep 1;
player addGoggles  (missionNamespace getVariable (format ["GGPDB%1", getPlayerUID player]));