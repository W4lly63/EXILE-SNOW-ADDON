/*
W4lly63 -2016
snow footsteps sound
0 = [volume,ear_distance] call WY_fnc_SnowFootSteps;
*/

WY_fnc_SnowFootSteps = {

  private["_house","_speedP","_soundPath","_soundToPlay","_soundStepsNumb","_soundStepsSelected","_sleepL","_sleepR","_ssVolume","_ssDistance","_overShoreS","_overWaterS","_moveD","_playerWlk","_playerRun","_playerEva","_playerStop","_selSstepN"];
  _ssVolume = _this select 0;
  _ssDistance = _this select 1;
  _house="";
  _soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
  _sleepL = 0;
  _sleepR = 0;
  _preL = 0;
  _soundStepsSelected ="";
  _soundStepsNumb = 0;
  _playerWlk = ["amovpercmwlk","amovpknlmwlk","amovppnemwlk"];
  _playerRun = ["amovpercmrun","amovpknlmrun","amovppnemrun"];
  _playerEva = ["amovpercmeva","amovpknlmeva","amovppnemeva"];
  _playerStop= ["amovpercmstp","amovpknlmstp","amovppnemstp"];
  _playerTac = ["amovpercmtac","amovpknlmtac","amovppnemtac","amovppnemspr"];
  _selSstepN ="walk";


  KK_fnc_inHouse = {
    lineIntersectsSurfaces [
      getPosWorld _this,
      getPosWorld _this vectorAdd [0, 0, 50],
      _this, objNull, true, 1, "GEOM", "NONE"
    ] select 0 params ["","","","_house"];
    if (_house isKindOf "House") exitWith {true};
    false;
  };

  waitUntil {alive player};

  while {true} do {

    _overShoreS = !(position player isFlatEmpty  [-1, -1, -1, -1, 0, true] isEqualTo []);
    _overWaterS = !(position player isFlatEmpty  [-1, -1, -1, -1, 2, false] isEqualTo []);
    _moveD = (animationState player) select[0,12];
    //hint format["movement : %1", _moveD];
    if((vehicle player == player) &&  (not  isOnRoad player)  &&   ( not (player call KK_fnc_inHouse)) && (not(_moveD in _playerStop)) &&  not _overWaterS ) then {
      if(stance player != "UNDEFINED") then {


        if(_moveD in _playerWlk) then {
            _soundStepsNumb = 0;
          if(stance player == "CROUCH") then {
            _preL = 0; _sleepL = 0.6;  _sleepR = 0.7;
          };
          if(stance player == "STAND") then {
           _preL = 0; _sleepL = 0.5;  _sleepR = 0.7;
          };
          if(stance player == "PRONE") then {
            _soundStepsNumb = 4;
           _preL = 0; _sleepL = 0.6;  _sleepR = 0.7;
          };
        };


        if(_moveD in _playerRun) then {
            _soundStepsNumb = 1;
          if(stance player == "CROUCH") then {
            _preL = 0.1;_sleepL = 0.3; _sleepR = 0.2;
          };
          if(stance player == "STAND") then {
            _preL = 0; _sleepL = 0.4; _sleepR = 0.3;
          };
          if(stance player == "PRONE") then {
            _soundStepsNumb = 4;
           _preL = 0; _sleepL = 0.4;  _sleepR = 0.3;
          };
        };

        if(_moveD in _playerEva)then {
            _soundStepsNumb = 2;
          if(stance player == "STAND") then {
            _preL = 0; _sleepL = 0.30; _sleepR = 0.30;
          };
         if(stance player == "CROUCH") then {
            _preL = 0;_sleepL = 0.3; _sleepR = 0.3;
          };
          if(stance player == "PRONE") then {
            _soundStepsNumb = 4;
           _preL = 0; _sleepL = 0.28;  _sleepR = 0.3;
          };
        };

        if(_moveD in _playerTac) then {
            _soundStepsNumb = 3;
          if(stance player == "STAND") then {
           _preL = 0.1; _sleepL = 0.28; _sleepR = 0.28;
          };
         if(stance player == "CROUCH") then {
            _preL = 0.1; _sleepL = 0.4; _sleepR = 0.33;
          };
          if(stance player == "PRONE") then {
            _soundStepsNumb = 4;
           _preL = 0; _sleepL = 0.35;  _sleepR = 0.3;
          };
        };

        if(_sleepR != 0) then {

          _soundToPlay = format ["WY_FILES\Movement\Snow\fs%1L.ogg",_soundStepsNumb];
          sleep _preL;
          playSound3D [_soundToPlay, player, false, getPosASL player, _ssVolume, 1, _ssDistance];
          sleep  _sleepL;

          _soundToPlay = format ["WY_FILES\Movement\Snow\fs%1R.ogg",_soundStepsNumb];
          playSound3D [_soundToPlay, player, false, getPosASL player, _ssVolume, 1, _ssDistance];
          sleep  _sleepR;
        };
     };
   };

     _sleepL = 0;
     _sleepR = 0;
     _preL = 0;
  };
  (true);
};

#include "fn_settings.sqf"

if(_snowStepsSound) then {
  0 = [_ssVolume,_ssDistance] call WY_fnc_SnowFootSteps;
};