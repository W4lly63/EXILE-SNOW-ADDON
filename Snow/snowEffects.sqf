/*
W4lly63 2016
[]execVM "Snow\snowEffects.sqf"

*/


WY_fnc_envirWind ={

	private ["_yyy","_xxx","_soundTime","_windSleep","_posSoundsArray","_soundsArray","_soundSelected","_soundTime2","_soundSleep","_soundNumb","_windNumb","_windSelected","_windLowSelected","_wn","_snF","_townsS","_snC","_overShoreS","_overWaterS","_snS","_vehShip","_vlS","_vlPre"];


	_soundTime = 0;
	changeWindSoundLvl = true;
	_xxx=0;_yyy=0;
	_wn = _this select 0;
	_snF = _this select 1;
	_snC = _this select 2;
	_snS = _this select 3;
	_vlS = _this select 4;
	_vlSE = _this select 5;
	_snH = _this select 6;
	_townsS = false;
	_vlPre =0;
	if(_vlS != 1) then {_vlS  = round (_vlS * 10); };
    if(_vlSE != 1) then {_vlSE  = round (_vlSE * 10); };

	while {true} do {

    	waitUntil {alive player};
    	_townsS = !((nearestLocations [getPosATL player, ["NameCity","NameCityCapital"], 600]) isEqualTo []);
    	_overShoreS = !(position player isFlatEmpty  [-1, -1, -1, -1, 0, true] isEqualTo []);
    	_overWaterS = !(position player isFlatEmpty  [-1, -1, -1, -1, 2, false] isEqualTo []);
    	_nearBoatS = !((player nearEntities [["Ship"], 50]) isEqualTo []);
    	_vehShip = (vehicle player isKindOf "Ship");
	    _xxx = round(random 200) -100;
	    _yyy = round(random 200) -100;

        if((! _townsS) && (!_overShoreS) && (!_overWaterS) && (!_nearBoatS )) then {
	       _soundNumb = floor random _snF;
	       if(_vlSE == 1 ) then {
	          _soundSelected = format ["cr%1",_soundNumb];
	       }else{
               _soundSelected = format ["cr%1%2%3",_soundNumb,_vlPre,_vlSE];
	       };
        };
        if(_townsS) then {
           //_houseSound = selectRandom (position player nearObjects ["House", 100]);
	       _soundNumb = floor random _snC;
	       if(_vlSE == 1 ) then {
	          _soundSelected = format ["fr%1",_soundNumb];
	       }else{
               _soundSelected = format ["fr%1%2%3",_soundNumb,_vlPre,_vlSE];
	       };
        };
        if(_overShoreS || _overWaterS || _nearBoatS) then {
	       _soundNumb = floor random _snS;
	       if(_vlSE == 1 ) then {
	          _soundSelected = format ["sr%1",_soundNumb];
	       }else{
               _soundSelected = format ["sr%1%2%3",_soundNumb,_vlPre,_vlSE];
	       };
        };

        _windNumb = floor random _wn;
        if(_vlS == 1) then {
	       _windSelected = format ["wn%1",_windNumb];
	    }else{
           _windSelected = format ["wn%1%2%3",_windNumb,_vlPre,_vlS];
	    };
	    _windLowSelected = format ["wnl%1",_windNumb];
    	objSP = "Land_PenBlack_F" createVehicleLocal position player;
    	objSP attachTo [player,[_xxx,_yyy,0]];
    	objSP hideObject true;
    	objSP allowDamage false;
   	    objSP enableSimulation false;
    	if(changeWindSoundLvl || (gusts < 0.5))	then {
        	player say [_windLowSelected, 5,1];
		};
   	    if(changeWindSoundLvl)	then {
   	        _hhh = round(random 8) -4;
	        _ggg = round(random 8) -4;
   	    	_soundNumb = floor random _snH;
        	_soundSelected = format ["hr%1",_soundNumb];
        	objSP attachTo [player,[_hhh,_ggg,0]];
        	detach objSP;
        	objSP say3D [_soundSelected,10,1];
		};
    	if(!changeWindSoundLvl && (gusts >= 0.5))	then {
        	player say [_windSelected, 5,1];
			if ((vehicle player == player)) then {
				detach objSP;

            	if(_overShoreS || _overWaterS || _nearBoatS) then {
            		objSP attachTo [player,[0,0,0]];
            	};
            	objSP say3D [_soundSelected,100,1];
	    	};
	    	if(( _overWaterS || _vehShip) && (vehicle player != player)) then {
                objSP attachTo [player,[0,0,0]];
	    	};
		};

		_soundTime = (diag_tickTime + 18);
		waitUntil {(diag_tickTime  > _soundTime)};
		deleteVehicle objSP;
		if(overcast < 0.2) then {changeWindSoundLvl = true;};
		_windSleep = floor random 10;
	    if((!_overShoreS) && (!_overWaterS) && (!_nearBoatS )) then {
		   uiSleep _windSleep;
        };
	};
	(true);
};

#include "fn_settings.sqf"

_wn                    = 10;                              // number of last wind sound files
_snF                   = 27;                              // number of last environment Forest-Village sound
_snC                   = 20;                               // number of last environment Cities sound
_snS                   = 4;                               // number of last  environment Sea sound
_snH                   = 16;                              // number of last House sound files

if(_windOn) then {
	0 = [_wn,_snF,_snC,_snS,_vlS,_vlSE,_snH] call WY_fnc_envirWind;
};

