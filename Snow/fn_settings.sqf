////////////////////////////settings//////////////////////////////////////

/////////////////////////////snow/////////////////////////////////////////////////////////////////////

_hardSnowFall          = false;                            // activate hard snow falling when overcast up to 0.9

///////////////////////environment effects///////////////////////////////////////////////////////////
_windOn                = true;                            // activate/deactivate wind true/false

_vlS                   = 1;                               // volume wind level ATTENTION !!!possible value ONLY 1 , 0.8 or 0.6 !!!! - less value less volume
_vlSE                  = 1;                               // volume Environment Sounds level ATTENTION !!!possible value ONLY 1 , 0.8 or 0.6 !!!! - less value less volume
//////////////////////////////////snow mask////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_maskOn                = true;                            // activate/deactivate snowMask simulation true/false
_glassesOnlySnow       = true;                            // Work only with _maskOn = true -------   if you want snowMask only when snow falling or raining  - if false mask when sunny too
_useCheckGlasses       = true;                            // Work only with _maskOn = true--------- check if player have mask defined in _gogglesArray ----- mask can be in all places , backpack , vest, uniform or assigned slot
_gogglesArray          = [                                /* Work only with _maskOn = true--------- array of mask allowed */

                          "G_Combat",
                          "G_Combat_Goggles_tna_F",
                          "G_Goggles_VR"

                         ];
_noCheckBackpack       = true;                            // Work only with _maskOn = true--------- check or not in backpack for glasses (recommended true for have a place for remove at the moment glasses)


///////////////////////Snow FootSteps Sound//////////////////////////////////////////

_snowStepsSound       = true;                            // activate/deactivate sound crunching on snow
_ssVolume             = 3;                               // volume of sound
_ssDistance           = 30;                              // max distance audible sound


///////////////////////Blizzard /////////////////////////////////////////

_blizzOn              = true ;                          // activate/deactivate blizzard
_timeStartblizz       = 300;                            // times starts  blizzard (serverTime)
_blizzDuration        = 100;                           // duration time blizzard --- dnot set up values up to _timeStartBlizz value!!!

_blizzWavesVel        = 10;                             //seconds between waves -- increase for less blizzard , decrease(test first!) for speed blizzard

//////////////////////////end settings////////////////////////////////////
