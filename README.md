# EXILE-SNOW-ADDON v.0.7.2 
# Snow - Blizzard - SnowMask - Environment Sounds Effects
<a rel="license" href="http://www.bistudio.com/licenses/arma-public-license-share-alike" target="_blank" >
 <img src="http://www.bistudio.com/license-icons/small/APL-SA.png" >
 <br>
 This work is licensed under a Arma Public License Share Alike
</a>
- ADDON Required : 
  https://steamcommunity.com/sharedfiles/filedetails/?id=819154831&searchtext=snow+winter+effects

- Snow script temperature and overcast based
- Temperature based (down to 1 snow --- up to 1 no snow).
- Overcast based (change intensity based to overcast).
- Reduced snow inside buildings .
- Snow Mask system simulation.
- Environment sounds effects. (forest, cities, sea, houses,footsteps)
- Blizzard Effects.
- configurable options :snow\fn_settings.sqf
- # v.0.7.2
- [added] Option for enable/disable Blizzard White ColorCorrection 
- # v.0.7.1
- [solved] Removed Houses sounds out of houses when raining.

- # v.0.7.0
- [changed] Now all sounds files, classes and textures are inside addon (link above or below).
- [added] configurables sounds volume setup ( 1, 0.8, 0.6) for winds and environment sounds.
- [added] blizzard simulation effects. (can setup event starts and stop).
- [added] Houses sounds.
- [added] sea sounds and some environment sounds.

Installation

- Download ADDON :https://steamcommunity.com/sharedfiles/filedetails/?id=819154831&searchtext=snow+winter+effects
- Put Addon in root arma3server directory. (addon required for clients too)
- copy key of addon inside key folder in arma3server directory.
- Add to startup line addon. 
- open mission.sqm in missiondirectory and add to addon section "WY_PE" .
- Enable Exile Snow inside config.cpp \ class yourMissionName and setup temperature with some value down to 1 grades
- If you use map like chernarus winter create class inside config.cpp with name of map
- Set "Thunderstorm"  in  ExileserverConfig as weather. set wind to 1 (optional)
- Open mission\config.cpp , search "class CfgExileCustomCode" and add this line inside class

ExileClient_system_snow_thread_update = "Snow\ExileClient_system_snow_thread_update.sqf";

- Copy folder Snow  inside mission folder.
- Copy init.sqf (or merge content) inside mission folder.
