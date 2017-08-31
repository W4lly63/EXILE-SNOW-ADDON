
private ["_numbOf_spawnItems","_spawnItemsArray","_wrecksTypes","_wreckFound","_wreck","_actionState","_actionMedic","_w_start","_w_end","_w_count","_moveD","_itemsMinMax","_wrecksDoubleItems","_wreckFoundDouble"];

#include "fn_settings.sqf"

_wreckFound = [];
_wreck = "";
_w_count = 0;
_moveD ="";
_w_end = false;
_numbOf_spawnItems = floor random _itemsMinMax;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
WY_fnc_CheckHasObj = {
  private  ["_unit","_objCheck"];

  _unit = _this select 0;
  _objCheck = _this select 1;

   if(_objCheck in (vestItems _unit + uniformItems _unit  + backpackItems _unit + assignedItems _unit)) exitWith {true};
   false;
};

////////////////////////////////////////////////////////////////////////////////////////////////////////
   {
      _wreckFound= getPosATL player  nearObjects [_x,5];
      if  !(_wreckFound isEqualTo []) exitWith {_wreck = _wreckFound select 0;};

   } forEach _wrecksTypes;

   {
      _wreckFoundDouble= getPosATL player  nearObjects [_x,5];
      if  !(_wreckFoundDouble isEqualTo []) exitWith {_numbOf_spawnItems = _numbOf_spawnItems * 2;};
   } forEach _wrecksDoubleItems;

   _itemsTypes =[];
   for "_i" from 0 to (_numbOf_spawnItems -1) do {
      _itemsTypes pushBack (selectRandom _spawnItemsArray);
   };

//////////////////////////////////////////////////////////////////////////////

_checkHasFoolbox = [player,"Exile_Item_Foolbox"] call WY_fnc_CheckHasObj;

if !(_checkHasFoolbox) then {
     cutText ["\n\nFOOLBOX REQUIRED!!", "PLAIN DOWN"];
}else{




   player playActionNow "MedicStart";
   _actionState = animationState player;

   sleep 1;


   _w_start = false;
   _w_end = false;

         while {_w_count < 10} do {
            if(_w_count == 9) then {
                player switchMove "";
                player playActionNow "stop";
                //sleep 1;
            };
            _actionState = animationState player;
            _actionMedic = ["medic",_actionState] call BIS_fnc_inString;
            if (_actionMedic) then {
                _w_start = true;
            };
            if (_w_start and (_w_count == 9) ) then {
                _w_end = true;
            };
            _w_count =_w_count + 1;
            sleep 1;
            if(_w_count < 9 ) then {
              cutText [format["Removing Wreck : %1%2", (12 * _w_count),"%"],"PLAIN"];
              _moveD = (animationState player) select[0,4];
              if(_moveD == "amov") then {
                   _w_count = 10;
              };
            };
        };


};

if(_w_end) then {
   cutText [format["Removing Wreck : %1%2", "100","%"],"PLAIN"];
   _wep = createVehicle ["groundWeaponHolder", player  modelToWorld [0,1.8,0], [], 0.5, "CAN_COLLIDE"];
   {_wep addItemCargoGlobal [_x, 1];} forEach _itemsTypes;
   //uiSleep 1;
   deleteVehicle _wreck;

}else {

  if (_checkHasFoolbox) then {
    player switchMove "";
    player playActionNow "stop";
    cutText ["\n\nCanceled remove Wreck", "PLAIN DOWN"];
  };
};