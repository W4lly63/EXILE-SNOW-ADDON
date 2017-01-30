/*
W4lly63-2016
*/

private ["_obj","_pos","_effectsArray","_sleepColor","_house","_getTempValue","_tTemp","_ccS"];
_house = "";
_ccS = 0;
_blizzCcOn = true;

WY_fnc_deleteAll = {
  {
    {
      deleteVehicle _x;
      _x = nil;
    } forEach _x;
  } forEach [_effectsArray];
  (true);
};


WY_fnc_BackColor = {
  if(isNil "ccSnow") exitWith {};
  0 = [] spawn {
     ccSnow ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0 , 0, 0, 0]];
     ccSnow ppEffectCommit 30;
     uiSleep 30;
     ppEffectDestroy ccSnow;
     ccSnow = nil;
    (true);
  };
};


KK_fnc_inHouse = {
    lineIntersectsSurfaces [
      getPosWorld _this,
      getPosWorld _this vectorAdd [0, 0, 50],
      _this, objNull, true, 1, "GEOM", "NONE"
    ] select 0 params ["","","","_house"];
    if (_house isKindOf "House") exitWith {true};
    false;
};


WY_fnc_BlizzardAll = {
    _obj = (vehicle player);
    _pos = getposATL _obj;
    if(_blizzCcOn) then {
       ccSnow = ppEffectCreate ["colorCorrections", 1501];
       ccSnow ppEffectEnable true;
       ccSnow ppEffectAdjust [1, 1, 0, [0.31, 0.31, 1.0, 0.1], [0.85, 0.85, 0.92, 0.48], [1 , 1, 1, 0.03]];
       ccSnow ppEffectCommit 0;
    };

    WY_Blizz_S1 = "#particlesource" createVehicleLocal _pos;
    WY_Blizz_S1 setParticleClass "WY_Blizzard";
    WY_Blizz_S1 setDropInterval 0.001;

    WY_Blizz_S2 = "#particlesource" createVehicleLocal _pos;
    WY_Blizz_S2 setParticleClass "WY_SNOW_B";
    WY_Blizz_S2 setDropInterval 0.004;

    WY_Cloud_S1 = "#particlesource" createVehicleLocal _pos;
    WY_Cloud_S1 setParticleClass "WY_CLOUDS_A";
    WY_Cloud_S1 setDropInterval 0.04;

    WY_Cloud_S2 = "#particlesource" createVehicleLocal _pos;
    WY_Cloud_S2 setParticleClass "WY_CLOUDS_B";
    WY_Cloud_S2 setDropInterval 0.1;

    WY_Flur_SA = "#particlesource" createVehicleLocal _pos;
    WY_Flur_SA setParticleClass "WY_FLUR_A";
    WY_Flur_SA setDropInterval 0.004;

    WY_Flur_SB = "#particlesource" createVehicleLocal _pos;
    WY_Flur_SB setParticleClass "WY_FLUR_B";
    WY_Flur_SB setDropInterval 0.003;

    WY_Flur_SC = "#particlesource" createVehicleLocal _pos;
    WY_Flur_SC setParticleClass "WY_FLUR_C";
    WY_Flur_SC setDropInterval 0.005;

    WY_Flur_SD = "#particlesource" createVehicleLocal _pos;
    WY_Flur_SD setParticleClass "WY_FLUR_D";
    WY_Flur_SD setDropInterval 0.006;

    WY_Flur_SE = "#particlesource" createVehicleLocal _pos;
    WY_Flur_SE setParticleClass "WY_FLUR_E";
    WY_Flur_SE setDropInterval 0.004;

    WY_Blizz_SA = "#particlesource" createVehicleLocal _pos;
    WY_Blizz_SA setParticleClass "WY_BLIZZ_SEC_A";
    WY_Blizz_SA setDropInterval 0.001;

    WY_Blizz_SB = "#particlesource" createVehicleLocal _pos;
    WY_Blizz_SB setParticleClass "WY_BLIZZ_SEC_B";
    WY_Blizz_SB setDropInterval 0.001;

    WY_Blizz_SC = "#particlesource" createVehicleLocal _pos;
    WY_Blizz_SC setParticleClass "WY_BLIZZ_SEC_C";
    WY_Blizz_SC setDropInterval 0.001;

    WY_Blizz_SD = "#particlesource" createVehicleLocal _pos;
    WY_Blizz_SD setParticleClass "WY_BLIZZ_SEC_D";
    WY_Blizz_SD setDropInterval 0.001;

    WY_Blizz_SE = "#particlesource" createVehicleLocal _pos;
    WY_Blizz_SE setParticleClass "WY_BLIZZ_SEC_E";
    WY_Blizz_SE setDropInterval 0.001;

    _effectsArray = [WY_Blizz_S1,WY_Blizz_S2,WY_Cloud_S1,WY_Cloud_S2,WY_Flur_SA,WY_Flur_SB,WY_Flur_SC,WY_Flur_SD,WY_Flur_SE,WY_Blizz_SA,WY_Blizz_SB,WY_Blizz_SC,WY_Blizz_SD,WY_Blizz_SE];
    (true)
};

#include "fn_settings.sqf"

_xCount = _timeStartblizz;
_blizzSstart = false;


if(_blizzOn) then {



  while {true} do {



    if(serverTime > _timeStartblizz) then {

      _blizzSstart = true;
      _ccS =_ccS+1;
      _timeStartblizz = round (_timeStartblizz/_ccS) + serverTime;
      _xCount = serverTime + _blizzDuration;
      //hint format["next restart at : %1   duration : %2", _timeStartblizz,_xCount];
      if(_blizzCcOn) then {
         ccSnow = ppEffectCreate ["colorCorrections", 1501];
         ccSnow ppEffectEnable true;
         ccSnow ppEffectAdjust [1, 1, 0, [0.31, 0.31, 1.0, 0.1], [0.85, 0.85, 0.92, 0.48], [1 , 1, 1, 0.03]];
         ccSnow ppEffectCommit 10;
         ccSnow ppEffectAdjust [1, 1, 0, [0.31, 0.31, 1.0, 0.1], [0.85, 0.85, 0.92, 0.48], [1 , 1, 1, 0.03]];
         ccSnow ppEffectCommit 20;
         sleep 20;
      };
    };


    if (!(player call KK_fnc_inHouse)  && _blizzSstart) then {
      0 = [] call WY_fnc_BlizzardAll;
      if(vehicle player == player) then {
         uiSleep _blizzWavesVel;
      }else {
         uiSleep 4;
      };
      0 = [] call WY_fnc_deleteAll;
      //[] spawn WY_fnc_BackColor;
    };

    if((serverTime > _xCount) && (_tTemp < 2 ) ) then {
      //hint "OFF";
      _blizzSstart = false;
      _xCount =serverTime + _timeStartblizz;
      [] spawn WY_fnc_BackColor;
    };
  };
};