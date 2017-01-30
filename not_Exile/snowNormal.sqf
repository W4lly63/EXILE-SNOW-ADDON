private["_enableSnow","_house","_obj","_pos"];
//_enableSnow = false;
_house ="";
_enableSnow = true;

#include "fn_settings.sqf"

KK_fnc_inHouse = {
	lineIntersectsSurfaces [
		getPosWorld _this,
		getPosWorld _this vectorAdd [0, 0, 50],
		_this, objNull, true, 1, "GEOM", "NONE"
	] select 0 params ["","","","_house"];
	if (_house isKindOf "House") exitWith {true};
	false;
};

WY_fnc_deleteAll = {
  {
    {
      deleteVehicle _x;
      _x = nil;
    } forEach _x;
  } forEach [_effectsArray];
  (true);
};



While {true} do {


        0 setRain 0;


    if (_enableSnow ) then
    {
	    if(player call KK_fnc_inHouse) exitWith {};
		changeWindSoundLvl = false;
	    0 setRain 0;
	    _obj = (vehicle player);
        _pos = getposATL _obj;


		if (overcast >= 0.2) then {
			0 setRain 0;
            WY_S_S1 = "#particlesource" createVehicleLocal _pos;
            WY_S_S1 attachTo [_obj, [0, 4, 2]];
            WY_S_S1 setParticleClass "WY_SNOW_B_L";
            WY_S_S1 setDropInterval 0.001;

            WY_S_S2 = "#particlesource" createVehicleLocal _pos;
            WY_S_S2 attachTo [_obj, [4, 0, 2]];
            WY_S_S2 setParticleClass "WY_SNOW_B_R";
            WY_S_S2 setDropInterval 0.004;

            WY_B_S1 = "#particlesource" createVehicleLocal _pos;
            WY_B_S1 attachTo [_obj, [0, -4, 2]];
            WY_B_S1 setParticleClass "WY_SNOW_B_LF";
            WY_B_S1 setDropInterval 0.004;

            WY_B_S2 = "#particlesource" createVehicleLocal _pos;
            WY_B_S2 attachTo [_obj, [-4, 0, 2]];
            WY_B_S2 setParticleClass "WY_SNOW_B_RF";
            WY_B_S2 setDropInterval 0.004;

            WY_C_S1 = "#particlesource" createVehicleLocal _pos;
            WY_C_S1 attachTo [_obj, [0, 8, 3]];
            WY_C_S1 setParticleClass "WY_SNOW_B_RL";
            WY_C_S1 setDropInterval 0.004;

            WY_C_S2 = "#particlesource" createVehicleLocal _pos;
            WY_C_S2 attachTo [_obj, [8, 0, 3]];
            WY_C_S2 setParticleClass "WY_SNOW_B_RR";
            WY_C_S2 setDropInterval 0.001;

            WY_D_S2 = "#particlesource" createVehicleLocal _pos;
            WY_D_S2 attachTo [_obj, [0, -8, 3]];
            WY_D_S2 setParticleClass "WY_SNOW_B_LRF";
            WY_D_S2 setDropInterval 0.001;

            WY_D_S1 = "#particlesource" createVehicleLocal _pos;
            WY_D_S1 attachTo [_obj, [-8, 0, 3]];
            WY_D_S1 setParticleClass "WY_SNOW_B_RRF";
            WY_D_S1 setDropInterval 0.001;
		};



    };
    if (_enableSnow &&  (player call KK_fnc_inHouse)) then
    {
		changeWindSoundLvl = true;
	    0 setRain 0;

            WY_S_S1 = "#particlesource" createVehicleLocal _pos;
            WY_S_S1 setParticleClass "WY_SNOW_B_L";
            WY_S_S1 setDropInterval 0;

            WY_S_S2 = "#particlesource" createVehicleLocal _pos;
            WY_S_S2 setParticleClass "WY_SNOW_B_R";
            WY_S_S2 setDropInterval 0;

            WY_B_S1 = "#particlesource" createVehicleLocal _pos;
            WY_B_S1 setParticleClass "WY_SNOW_B_LF";
            WY_B_S1 setDropInterval 0;

            WY_B_S2 = "#particlesource" createVehicleLocal _pos;
            WY_B_S2 setParticleClass "WY_SNOW_B_RF";
            WY_B_S2 setDropInterval 0;

            WY_C_S1 = "#particlesource" createVehicleLocal _pos;
            WY_C_S1 setParticleClass "WY_SNOW_B_RL";
            WY_C_S1 setDropInterval 0.01;

            WY_C_S2 = "#particlesource" createVehicleLocal _pos;
            WY_C_S2 setParticleClass "WY_SNOW_B_RR";
            WY_C_S2 setDropInterval 0.005;

            WY_D_S2 = "#particlesource" createVehicleLocal _pos;
            WY_D_S2 setParticleClass "WY_SNOW_B_LRF";
            WY_D_S2 setDropInterval 0.005;

            WY_D_S1 = "#particlesource" createVehicleLocal _pos;
            WY_D_S1 setParticleClass "WY_SNOW_B_RRF";
            WY_D_S1 setDropInterval 0.005;
    };
    _effectsArray = [WY_S_S1,WY_S_S2,WY_C_S1,WY_C_S2,WY_B_S1,WY_B_S2,WY_D_S1,WY_D_S2];

    sleep 4;
    0 = [] call WY_fnc_deleteAll;
};