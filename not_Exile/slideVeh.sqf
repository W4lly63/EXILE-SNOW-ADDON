/*
W4lly63 -2017
snow slide car simulation
0 = [] call WY_fnc_SlideCar;
*/

WY_fnc_SlideCar ={
   private ["_veh","_speed","_vehXMS","_vehYMS","_dir","_bst","_vehX","_vehY","_vehZ","_grad","_bsd","_vehType","_vehHaveToolkit"];
   _bst = 0.05;
   _bsd = 0.01;
   _grad = 0;
   _vehType ="";
   _retextKit = "WY_ToolKit";
   _vehHaveToolkit =false;

   while {true} do {
	   waitUntil {vehicle player != player && vehicle player isKindOf "LandVehicle" && isTouchingGround vehicle player && driver vehicle player == player };
       _veh = vehicle player;
       _vehHaveToolkit = (_retextKit in (itemCargo _veh));
       _speed = speed _veh;
       _vehXMS = velocityModelSpace _veh select 0; // will be used with setVelocityModelSpace since ARMA3 1.67
       _vehYMS = velocityModelSpace _veh select 1; // will be used with setVelocityModelSpace since ARMA3 1.67
	   _vehX = velocity _veh select 0;
	   _vehY = velocity _veh select 1;
	   _vehZ = velocity _veh select 2;
       _dir = direction _veh;
       _grad = [getPos _veh, getDir _veh] call BIS_fnc_terrainGradAngle;
       _vehType = (typeOf _veh) select[0,2];
       if((not isOnRoad _veh) && (_vehType != "WY") && (not _vehHaveToolkit)) then {
    	   if((_grad < -8) && (_speed > 20) ) then {
              _veh setVelocity [(((sin(_dir)) * _bsd) + _vehX),(((cos(_dir)) * _bsd) + _vehY),_vehZ];
    	   };
    	   if((_grad > 8) && (_speed > 0) ) then {
              _veh setVelocity [( _vehX -((sin(_dir)) * _bst) ),( _vehY - ((cos(_dir)) * _bst)),_vehZ];
    	   };

       };
   };
(true);
};

waitUntil {alive player && ! isNull player };

#include "fn_settings.sqf"

if(_vehSlideOnSnow) then {
   0 = [] call WY_fnc_SlideCar;
};