////////////////////////////settings//////////////////////////////////////

/////////////////////////////snow/////////////////////////////////////////////////////////////////////

_hardSnowFall          = false;                            // activate hard snow falling when overcast up to 0.9

///////////////////////environment effects///////////////////////////////////////////////////////////
_windOn                = true;                            // activate/deactivate wind true/false

_vlS                   = 1;                               // volume wind level ATTENTION !!!possible value ONLY 1 , 0.8 or 0.6 !!!! - less value less volume
_vlSE                  = 1;                               // volume Environment Sounds level ATTENTION !!!possible value ONLY 1 , 0.8 or 0.6 !!!! - less value less volume
//////////////////////////////////snow mask////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_maskOn                = false;                            // activate/deactivate snowMask simulation true/false
_glassesOnlySnow       = true;                            // Work only with _maskOn = true -------   if you want snowMask only when snow falling or raining  - if false mask when sunny too
_useCheckGlasses       = true;                            // Work only with _maskOn = true--------- check if player have mask defined in _gogglesArray ----- mask can be in all places , backpack , vest, uniform or assigned slot
_gogglesArray          = [                                /* Work only with _maskOn = true--------- array of mask allowed */

                          "WY_Snow_G_Combat_a",
                          "WY_Snow_G_Combat_b",
                          "WY_Snow_G_Combat_c",
                          "WY_Snow_G_Balaclava_combat_a",
                          "WY_Snow_G_Balaclava_combat_b",
                          "WY_Snow_G_Balaclava_combat_c"

                         ];
_noCheckBackpack       = true;                            // Work only with _maskOn = true--------- check or not in backpack for glasses (recommended true for have a place for remove at the moment glasses)


///////////////////////Snow FootSteps Sound//////////////////////////////////////////

_snowStepsSound       = true;                            // activate/deactivate sound crunching on snow
_ssVolume             = 3;                               // volume of sound
_ssDistance           = 30;                              // max distance audible sound


///////////////////////Blizzard /////////////////////////////////////////

_blizzOn              = true ;                          // activate/deactivate blizzard
_blizzCcOn            = true ;                         // activate deactivate white colorCorrection
_timeStartblizz       = [300,600,900,1200];                // times starts array static time
_blizzDuration        = 100;                           // duration time blizzard --- dnot set up to difference between times in _timeStartArray [1800,3600] -- 3600-1800= 1800 (_blizzDuration 1795 max)

_blizzWavesVel        = 10;                             //seconds between waves -- increase for less blizzard , decrease(test first!) for speed blizzard

/////////////////////RetexTure Vehicles///////////////////////////////////

_retextureOn = true ;

////////////////////Vehicles Slide on Snow/////////////////////////////////

_vehSlideOnSnow = true ;

////////////////////Spawn frozen Wrecks //////////////////////////////////


_itemsMinMax          = [10,15,20];                     // numb min med max  of items spawned when wreck will be removed

_spawnItemsArray      = [                               // classes of items to spawn when wreck will be removed
                          "Exile_Item_JunkMetal",
                          "Exile_Item_MetalBoard",
                          "Exile_Item_MetalPole",
                          "Exile_Item_MetalWire"
                        ];

_wrecksTypes          = [                              //  classes of wrecks will be spawned (must be the same of _wrecksTypes in  @exileserver\addon\a3_WY_Wrecks\fn_settings.sqf)
                                            "WY_Snow_Bmp2_wreck_F",
                                            "WY_Snow_Brdm2_wreck_F",
                                            "WY_Snow_Datsun_1_wreck_F",
                                            "WY_Snow_Hilux_wreck_F",
                                            "WY_Snow_T72_wreck_F",
                                            "WY_Snow_UAZ_wreck_F",
                                            "WY_Snow_URAL_wreck_F",
                                            "WY_Snow_UH60_wreck_F",
                                            "WY_Snow_BVP1T_wreck_F",
                                            "WY_Snow_Fort_Barricade_F",
                                            "WY_Snow_HMMWV_wreck_F",
                                            "WY_Snow_SKOD_wreck_F"
                        ];

_wrecksDoubleItems    = [                            //  classes of wrecks - when removed spawn double of items
                                            "WY_Snow_UH60_wreck_F",
                                            "WY_Snow_Fort_Barricade_F"
                        ];

//////////////////////////end settings////////////////////////////////////
