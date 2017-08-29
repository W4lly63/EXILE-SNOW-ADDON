waitUntil {count vehicles > 1};
waitUntil {alive player};
private ["_vehArray","_retextKit","_veh","_textArrayUniforms"];
_retextKit = "WY_ToolKit";
if (uniform player == "") exitWith {cutText ["You dont have a Uniform!!","PLAIN"]};

_textArrayUniforms = [

                    "WY_Snow_Uniforms\Data\WY_Snow_combat_a.paa",
                    "WY_Snow_Uniforms\Data\WY_Snow_combat_b.paa",
                    "WY_Snow_Uniforms\Data\WY_Snow_combat_c.paa",
                    "WY_Snow_Uniforms\Data\WY_Snow_ia_soldier_a.paa",
                    "WY_Snow_Uniforms\Data\WY_Snow_ia_soldier_b.paa",
                    "WY_Snow_Uniforms\Data\WY_Snow_ia_soldier_c.paa",
                    "WY_Snow_Vehicles\Data\camo1.paa",
                    "WY_Snow_Vehicles\Data\camo2.paa",
                    "WY_Snow_Vehicles\Data\camo3.paa",
                    "WY_Snow_Vehicles\Data\camo4.paa",
                    "WY_Snow_Vehicles\Data\camo5.paa",
                    "WY_Snow_Vehicles\Data\camo6.paa"
];

if(vehicle player == player) exitWith {cutText ["Get in Vehicle for retexture Uniform!!","PLAIN"]};
 _veh = vehicle player;
  _vehArray = itemCargo _veh;
  if(not (_retextKit in _vehArray)) exitWith {cutText ["Need WY_ToolKit inside vehicle inventory for retexture!!","PLAIN"]};

    {
       cutText [format["Retexturing Uniform : %1%2", (20 * _x),"%"],"PLAIN"];
       sleep 1;
    } forEach [1,2,3,4,5];
    _selectedTexture = selectRandom _textArrayUniforms;
    nul = player setObjectTextureGlobal [0,_selectedTexture];
    nul = player setObjectTextureGlobal [1,_selectedTexture];
    nul = uniformContainer player setVariable ["texture", _selectedTexture, true];

