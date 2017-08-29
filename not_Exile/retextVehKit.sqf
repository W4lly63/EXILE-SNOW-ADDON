waitUntil {count vehicles > 1};
private ["_vehArray","_vehType","_retextKit","_veh","_textArrayOffroad","_findArray","_vehStr","_arrStr","_arrStr2","_arrStr3"];
_retextKit = "WY_ToolKit";
_vehStr ="";
_arrStr =[];
_arrStr2 =[];
_arrStr3 =[];

#include "retextArrays.sqf"

  if(vehicle player == player) exitWith {cutText ["Get in Vehicle for retexture!!","PLAIN"]};
  _veh = vehicle player;
  _vehArray = itemCargo _veh;
  if(not (_retextKit in _vehArray)) exitWith {cutText ["Need WY_ToolKit inside vehicle inventory for retexture!!","PLAIN"]};

  {
     _vehType = (typeOf _veh) find _x;
     if (_vehType != -1 ) exitWith {_vehStr = _x};
  } forEach _findArray;
  {
     if(_vehStr == _x select 0) exitWith {_arrStr = _x select 1; _arrStr2 = _x select 2; _arrStr3 = _x select 3 };
  } forEach _classArrays;

////////////////////WY_SNOW_PACK///////////////////////////////////////////
  if((_vehStr != "" ) && (_retextKit in _vehArray)) then {
    {
       cutText [format["Retexturing Vehicle : %1%2", (20 * _x),"%"],"PLAIN"];
       sleep 1;
    } forEach [1,2,3,4,5];
    _selectedTexture = selectRandom _arrStr;
    nul =  _veh setObjectTextureGlobal [0,_selectedTexture];
    if((count _arrStr2) != 0) then {
      _selectedTexture2 = selectRandom _arrStr2;
      nul =  _veh setObjectTextureGlobal [1,_selectedTexture2];
    };
    if((count _arrStr3) != 0) then {
      _selectedTexture3 = selectRandom _arrStr3;
      nul =  _veh setObjectTextureGlobal [2,_selectedTexture3];
    };
  };

//////////////////Others///////////////////////////////////////////////
  if((_vehStr == "" ) && (_retextKit in _vehArray)) then {
    {
       cutText [format["Retexturing Vehicle : %1%2", (20 * _x),"%"]];
       sleep 1;
    } forEach [1,2,3,4,5];
    _selectedTexture = selectRandom _textArrayCamo;
    /*nul =  _veh setObjectTextureGlobal [0,"#(rgb,8,8,3)color(1,1,1,1)"];
    nul =  _veh setObjectTextureGlobal [1,"#(rgb,8,8,3)color(1,1,1,1)"];
    nul =  _veh setObjectTextureGlobal [2,"#(rgb,8,8,3)color(1,1,1,1)"];*/
    nul = _veh setObjectTextureGlobal [0,_selectedTexture];
    nul = _veh setObjectTextureGlobal [1,_selectedTexture];
    nul = _veh setObjectTextureGlobal [2,_selectedTexture];

  };



