

waitUntil {count vehicles > 1};
waitUntil {alive player};
private ["_vehArray","_vehType","_retextKit","_vehFound","_playerCount"];

#include "fn_settings.sqf"

_playerCount = {isPlayer _x} count playableUnits;
_retextKit = "WY_ToolKit";
_vehFound = false;

if(_retextureOn) then {


if(_playerCount == 1 ) then {

  {
    _x addAction ["Retexture Now", "Snow\retextVehKit.sqf", nil , 0, false];
    _vehArray = itemCargo _x;
    _vehFound = false;
    //_vehType = (typeOf _x) find "Offroad";
    if((((typeOf _x) find "Offroad") != -1 ) && (_retextKit in _vehArray)) then {
        nul =  _x setObjectTextureGlobal [0,"WY_Snow_Vehicles\Data\WY_Snow_offroad_01_2_ext_co_a.paa"];
        nul =  _x setObjectTextureGlobal [1,"WY_Snow_Vehicles\Data\WY_Snow_offroad_01_2_ext_co_a.paa"];
        _vehFound = true;
    };
     if(((((typeOf _x) find "Quadbike") != -1 ) || (((typeOf _x) find "QuadBike") != -1 ) ) && (_retextKit in _vehArray)) then {
        nul =  _x setObjectTextureGlobal [0,"WY_Snow_Vehicles\Data\WY_Snow_quadbike_01_co_a.paa"];
        nul =  _x setObjectTextureGlobal [1,"WY_Snow_Vehicles\Data\WY_Snow_quadbike_01_wheel_co.paa"];
        _vehFound = true;
    };
    if(((((typeOf _x) find "MRAP_01") != -1 ) || (((typeOf _x) find "Hunter") != -1 ) ) && (_retextKit in _vehArray)) then {
        nul =  _x setObjectTextureGlobal [0,"WY_Snow_Vehicles\Data\WY_Snow_mrap_01_base_co_a.paa"];
        nul =  _x setObjectTextureGlobal [1,"WY_Snow_Vehicles\Data\WY_Snow_mrap_01_adds_co.paa"];
        _vehFound = true;
    };
    if(((((typeOf _x) find "MRAP_03") != -1 ) || (((typeOf _x) find "Strider") != -1 ) ) && (_retextKit in _vehArray)) then {
        nul =  _x setObjectTextureGlobal [0,"WY_Snow_Vehicles\Data\WY_Snow_mrap_03_ext_co_a.paa"];
        nul =  _x setObjectTextureGlobal [1,"WY_Snow_Vehicles\Data\WY_Snow_turret_co_a.paa"];
        _vehFound = true;
    };
    if(((((typeOf _x) find "Heli_light_01") != -1 ) || (((typeOf _x) find "Hummingbird") != -1 ) ) && (_retextKit in _vehArray)) then {
        nul =  _x setObjectTextureGlobal [0,"WY_Snow_Vehicles\Data\WY_Snow_heli_light_01_ext_co_a.paa"];
        _vehFound = true;
    };
    if(((((typeOf _x) find "Heli_Transport_01") != -1 ) || (((typeOf _x) find "Chopper_Orca") != -1 ) ) && (_retextKit in _vehArray)) then {
        nul =  _x setObjectTextureGlobal [0,"WY_Snow_Vehicles\Data\WY_Snow_heli_transport_01_ext01_co_a.paa"];
        nul =  _x setObjectTextureGlobal [1,"WY_Snow_Vehicles\Data\WY_Snow_heli_transport_01_ext02_co_a.paa"];
        _vehFound = true;
    };
    if((((typeOf _x) find "Heli_Transport_03") != -1 ) && (_retextKit in _vehArray)) then {
        nul =  _x setObjectTextureGlobal [0,"WY_Snow_Vehicles\Data\WY_Snow_Heli_Transport_03_ext01_co_a.paa"];
        nul =  _x setObjectTextureGlobal [1,"WY_Snow_Vehicles\Data\WY_Snow_Heli_Transport_03_ext02_co_a.paa"];
        _vehFound = true;
    };
    if((not _vehFound) && (_retextKit in _vehArray)) then {
        nul =  _x setObjectTextureGlobal [0,"WY_Snow_Vehicles\Data\camo6.paa"];
        nul =  _x setObjectTextureGlobal [1,"WY_Snow_Vehicles\Data\camo6.paa"];
        nul =  _x setObjectTextureGlobal [2,"WY_Snow_Vehicles\Data\camo6.paa"];
    };
  } forEach vehicles;

};
}:
