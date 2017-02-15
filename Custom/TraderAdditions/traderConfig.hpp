
//in the MPMissions/ExileFolder/config.cpp

//1) Find

CfgExileArsenal
{
//Add
#include "Custom\TraderAdditions\WY_PriceList.hpp"


//2) Find CfgTraderCategories
{
//Add
#include "Custom\TraderAdditions\WY_TraderCategories.hpp"

//3) Find CfgTraders
{

	class Exile_Trader_Armory
	{
		name = "ARMORY";
		showWeaponFilter = 1;
		categories[] =
		{
			"PointerAttachments",
			"BipodAttachments",
			"MuzzleAttachments",
			"OpticAttachments",
			"Ammunition",
			"Pistols",
			"Shotguns",
			"SubMachineGuns",
			"LightMachineGuns",
			"AssaultRifles",
			"SniperRifles",
			"WYWeapons"    //Add this and be sure to put a "," after SniperRifles
		};
	};

//4) Find class Exile_Trader_Equipment and add the WY classnames at the end.
	{
		name = "EQUIPMENT";
		showWeaponFilter = 0;
		categories[] =
		{
			"Headgear",
			"Glasses",
			"Uniforms",
			"Vests",
			"Backpacks",
			"FirstAid",
			"WYUniforms", //Add WY classnames here
			"WYVests",
			"WYBackpacks",
			"WYHeadgear",
			"WYFacewear"
		};
	};

//5) Find class Exile_Trader_Hardware and add the WY classnames at the end.
	{
		name = "HARDWARE";
		showWeaponFilter = 0;
		categories[] =
		{
			"Hardware",
			"Tools",
			"WYTools" //Add WY classnames here
		};
	};

//6) Find class Exile_Trader_Vehicle and add the WY classnames at the end.
	{
		name = "VEHICLE";
		showWeaponFilter = 0;
		categories[] =
		{
			"Cars",
			"Trucks",
			"WYVehicles"  //Add WY classnames here
		};
	};

//7) Findclass Exile_Trader_Aircraft and add the WY classnames at the end.
	{
		name = "AIRCRAFT";
		showWeaponFilter = 0;
		categories[] =
		{
			"Choppers",
			"Planes",
			"WYChoppers" //Add WY classnames here
		};
	};

//8) In the mpmissions folder, add the following directory Custom\TraderAdditions
