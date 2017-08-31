blizzNotExile.sqf // blizzard script
changeStepsSound.sqf // snow sounds steps
snowNormal.sqf // snow script
slideVeh.sqf // car slide on snow without WY_ToolKit
snowEffects.sqf // environments winter sounds effects
retextCar.sqf  and retextKitVeh.sqf  // retexture car onfly
retextU.sqf // retexture Uniforms onfly
removeWrecks.sqf  //  remove wrecks added by addon server/addon/a3_WY_Wrecks (pack to pbo add to server addon folder) obtain items

How to use scripts
In your mission folder create a new folder named "Snow" , copy inside all this files https://github.com/W4lly63/EXILE-SNOW-ADDON/tree/master/not_Exile , after open your mission init.sqf and add this 


if (hasInterface) then {
    #include "Snow\fn_init.sqf"
};
waitUntil {time > 0};
enableEnvironment false;


create a file inside Snow folder named fn_init.sqf and add scripts that u want start like this 


   []execVM "Snow\snowEffects.sqf";
   []execVM "Snow\changeStepsSound.sqf";
   []execVM "Snow\snowBlizzard.sqf";
   []execVM "Snow\slideVeh.sqf";
   []execVM "Snow\retextCar.sqf";

open Snow/fn_settings.sqf and activate/deactivate options as u liked .. done 
