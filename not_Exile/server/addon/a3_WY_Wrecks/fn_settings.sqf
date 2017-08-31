private ["_spawn_place","_numbOf_wrecks","_blackListAreas","_staticSpawnPlaces","_centerMapCoord","_numbOfSpawnPlaces"];

_staticSpawnPlaces = false;                     // true or false - if true set manually  _spawn_place array - false random spawn
_spawn_place                          = [       // wrecks spawn places -  [center coord,minDist,maxDist,objDist]
                                            [[11806.4,12815.1,0.001],50,500,10],
                                            [[12272.1,12653.4,0.001],10,200,20]
                                        ];


_numbOfDynamicSpawnPlaces             = 20;  // number of spawn places - work for static or dynamic spawn


_blackListAreas                       = [    //  blacklist area coord - use example 
                                             //[8130,5640,0],
											 //[9456,10234,0]
                                        ];   

_wrecksMinMax                         = [5,8,10];  //min,med,max  numbers wrecks to spawn


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// if u dont want use WY ADDON change classes with arma3 normal wrecks (in mission fn_settings too) ///////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_wrecksTypes                          = [          //  classes of wrecks will be spawned (must be the same of _wrecksTypes in  mission\snow\fn_settings.sqf)
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
										
///////////////////////////////////////////////////////////////////////////////
