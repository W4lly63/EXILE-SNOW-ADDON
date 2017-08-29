WY_fnc_SnowMask = {

private["_strVar","_str","_display","_ctrl","_w","_h","_x","_y","_snowBodyTemp","_bodyTemp","_getTempValue","_tTemp","_pos","_gogglesArray","_gogglesNamesArray","_noGlassesText","_textToView","_playerHaveGlasses","_checkRainSnow","_gogglesImagesArray","_imgSelected","_imgSelTxt","_strText","_noCheckBackpack","_selectFog","_startT","_changeTemp"];

disableSerialization;
_bodyTemp = 0;
_snowBodyTemp = 0;
_tTemp = 0;
_changeTemp = 0;
_checkRainSnow = false;

_str = "0_WY_SNOW";
(_str call BIS_fnc_rscLayer) cutRsc ["WY_SNOW_1","PLAIN"];

_display = uiNamespace getVariable "WY_SNOW_1";
_ctrl = _display displayCtrl 161718;
_pos =[safezoneX, safezoneY, safezoneW, safezoneH];
_glassesOnlySnow = _this select 0;
_useCheckGlasses = _this select 1;
_gogglesArray = _this select 2;
_noCheckBackpack = _this select 3;
_blizzOn = _this select 4;
_gogglesNamesArray =[];
_gogglesImagesArray =[];
WYBlizzVision = false;


////////////////////////////////display glasses//////////////////////////////////////////

WY_fnc_Glasses = {
	_snowBodyTemp = _this select 0;
	_tTemp = _this select 1;
	_ctrl = _this select 2;
	_bodyTemp = _this select 3;

        if (_snowBodyTemp != _bodyTemp || _changeTemp != _tTemp) then {
    	    if(_snowBodyTemp >= 37) then {
      		    _ctrl ctrlsetText "WY_FILES\textures\snowM0.paa";
     		    _ctrl ctrlSetPosition _pos;
     		    _ctrl ctrlcommit 0;
		    };
    	    if((_snowBodyTemp <= 36) && (_tTemp < 2)) then {
      		    _ctrl ctrlsetText "WY_FILES\textures\snowM1.paa";
      		    _ctrl ctrlSetPosition _pos;
      		    _ctrl ctrlcommit 0;
		    };
    	    if((_snowBodyTemp <= 35) && (_tTemp < 2)) then {
      		    _ctrl ctrlsetText "WY_FILES\textures\snowM2.paa";
      		    _ctrl ctrlSetPosition _pos;
      		    _ctrl ctrlcommit 0;
		    };
    	    if((_snowBodyTemp <= 36) && (_tTemp >= 2)) then {
      		    _ctrl ctrlsetText "WY_FILES\textures\snowM4.paa";
      		    _ctrl ctrlSetPosition _pos;
      		    _ctrl ctrlcommit 0;
		    };
    	    if((_snowBodyTemp <= 35) && (_tTemp >= 2)) then {
      		    _ctrl ctrlsetText "WY_FILES\textures\snowM3.paa";
      		    _ctrl ctrlSetPosition _pos;
      		    _ctrl ctrlcommit 0;
		    };
	    };

};

//////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////display other images//////////////////////////////////////////////////////

WY_fnc_OtherImg = {
	disableSerialization;
    _ctrl = _this select 0;
	_pos = _this select 1;
    _ctrl ctrlsetText "";
    _ctrl ctrlSetPosition _pos;
    _ctrl ctrlcommit 0;
	_bodyTemp = 0;
	_checkRainSnow = true;
};

/////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////check if player have glasses type required in all inventory//////////////////////////
//(("goggles" in (vestItems player + uniformItems player + backpackItems player + assignedItems player));
//(goggles player in _gogglesArray)

WY_fnc_CheckGlassesType = {
	private ["_ggArray","_unit","_allInventory","_noCheckBackpack"];
	_unit = _this select 0;
	_ggArray = _this select 1;
	_noCheckBackpack = _this select 2;
	_allInventory = false;
	{
	    if(!_noCheckBackpack) then {
		    if(_x in (vestItems _unit + uniformItems _unit  + backpackItems _unit + assignedItems _unit)) exitWith {_allInventory = true;}
		};
	    if(_noCheckBackpack) then {
		    if(_x in (vestItems _unit + uniformItems _unit  +  assignedItems _unit)) exitWith {_allInventory = true;}
		};
	}forEach _ggArray;

	if(goggles _unit in _ggArray || _allInventory ) exitWith {true};
	false;
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////

waitUntil {alive player && ! isNull player };
waitUntil {(!isNull (findDisplay 46))};

_startT = (diag_tickTime + 3);
////////////////////////////////convert glasses classname in displayname  and pictures links ///////////////////////////////////////////
// _text = getText (configFile >> "cfgGlasses" >> "G_Combat" >> "displayName");
{
_gogglesNamesArray pushBack (getText (configFile >> "cfgGlasses" >> _x >> "displayName"));
_gogglesImagesArray pushBack (getText (configFile >> "cfgGlasses" >> _x >> "picture"));
} forEach _gogglesArray;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////check code////////////////////////////////////////////////////////////////

while {true} do {
    _getTempValue = format ["%1", [ExileClientEnvironmentTemperature, 1] call ExileClient_util_math_round];
    _tTemp = parseNumber _getTempValue;
	_snowBodyTemp = round (ExileClientPlayerAttributes select 5);
	_playerHaveGlasses = [player,_gogglesArray,_noCheckBackpack] call WY_fnc_CheckGlassesType;
	_selectFog = selectRandom ["WY_FILES\textures\fogM1.paa"];

	if (!_useCheckGlasses) then {
		if(!_glassesOnlySnow) then {
        	0 = [_snowBodyTemp,_tTemp,_ctrl,_bodyTemp] call WY_fnc_Glasses;
        	WYBlizzVision = true;
			_checkRainSnow = false;
		};
		if(_glassesOnlySnow) then {
	    	if(overcast >= 0.2) then {
            	0 = [_snowBodyTemp,_tTemp,_ctrl,_bodyTemp] call WY_fnc_Glasses;
            	WYBlizzVision = true;
				_checkRainSnow = false;
			};
	    	if(overcast < 0.2) then {
               [_ctrl,_pos] spawn WY_fnc_OtherImg;
			};
		};
	};
	if (_useCheckGlasses) then {
	    if(_playerHaveGlasses) then {
			if(!_glassesOnlySnow) then {
        		0 = [_snowBodyTemp,_tTemp,_ctrl,_bodyTemp] call WY_fnc_Glasses;
        		WYBlizzVision = true;
                _checkRainSnow = false;
			};
			if(_glassesOnlySnow) then {
	    		if(overcast >= 0.2) then {
            		0 = [_snowBodyTemp,_tTemp,_ctrl,_bodyTemp] call WY_fnc_Glasses;
            		WYBlizzVision = true;
                    _checkRainSnow = false;
				};
			};
			if(_glassesOnlySnow) then {
	    		if(overcast < 0.2) then {
                    [_ctrl,_pos] spawn WY_fnc_OtherImg;
				};
			};
		};
	    if(!_playerHaveGlasses) then {
			//////////////////////view type of glasses required  and pictures/////////////////////////////////
			if(diag_tickTime < _startT) then {
				
				_strText = [parseText "SNOW GLASSES REQUIRED...searching : <br />"];
				for "_i" from 0 to ((count _gogglesArray) -1) do {
					_strText pushBack (_gogglesNamesArray select _i);
					_imgSelected = (_gogglesImagesArray select _i);
					
					_imgSelTxt = image _imgSelected;
					_strText pushBack _imgSelTxt;
					_strText pushBack  parseText "<br />";
		    	};
		    	_strText = composeText _strText;
				"" hintC  _strText;
			};
			//////////////////////////////////////////////////////////////////////////////////////
			_ctrl ctrlsetText "";
      	    _ctrl ctrlSetPosition _pos;
      		_ctrl ctrlcommit 0;
			_bodyTemp = 0;
			_checkRainSnow = true;
			WYBlizzVision = false;
		};
	};
	if(visibleMap) then {
			[_ctrl,_pos] spawn WY_fnc_OtherImg;
	};
	if (ExileClientGasMaskVisible) then {
			[_ctrl,_pos] spawn WY_fnc_OtherImg;
	};
	uiSleep 2;

	if(!_checkRainSnow) then {
		_bodyTemp = _snowBodyTemp;
	};
	_changeTemp = _tTemp;
	uiSleep 2;
};
(true);

};

#include "fn_settings.sqf"

if(_maskOn) then {

     0 = [_glassesOnlySnow,_useCheckGlasses,_gogglesArray,_noCheckBackpack,_blizzOn] call WY_fnc_SnowMask;
};
