--------------------------------------------------------------------------
-- GTFO_Fail_MP.lua 
--------------------------------------------------------------------------
--[[
GTFO Fail List - Mists of Pandaria
Author: Zensunim of Malygos
]]--

-- ***************
-- * Scholomance *
-- ***************

GTFO.SpellID["111231"] = {
	--desc = "Ice Wall (Instructor Chillheart)";
	sound = 3;
};

GTFO.SpellID["114886"] = {
	--desc = "Frigid Grasp (Instructor Chillheart)";
	sound = 3;
};

GTFO.SpellID["113859"] = {
	--desc = "Arcane Bomb (Instructor Chillheart)";
	sound = 3;
};

GTFO.SpellID["114038"] = {
	--desc = "Gravity Flux (Jandice Barov, Heroic)";
	sound = 3;
};

GTFO.SpellID["114872"] = {
	--desc = "Fire Breath Potion (Professor Slate)";
	sound = 3;
	tankSound = 0;
};

-- **********************
-- * Stormstout Brewery *
-- **********************

GTFO.SpellID["107205"] = {
	--desc = "Spicy Explosion";
	sound = 3;
};

GTFO.SpellID["106648"] = {
	--desc = "Brew Explosion (Ook-Ook)";
	sound = 3;
};

GTFO.SpellID["106808"] = {
	--desc = "Ground Pound (Ook-Ook)";
	soundFunction = function() 
		-- Only alert the first failed one per volley
		GTFO_AddEvent("GroundPound", 4);
		return 3;
	end;
	ignoreEvent = "GroundPound";	
};

GTFO.SpellID["114291"] = {
	--desc = "Explosive Brew (Hopper)";
	sound = 3;
	test = true; -- Might be spammy, don't know if these are avoidable or not
};

GTFO.SpellID["114466"] = {
	--desc = "Wall of Suds (Yan-Zhu the Uncasked)";
	sound = 3;
};

-- ******************************
-- * Temple of the Jade Serpent *
-- ******************************

GTFO.SpellID["106938"] = {
	--desc = "Serpent Wave (Liu Flameheart)";
	sound = 3;
};

GTFO.SpellID["106334"] = {
	--desc = "Wash Away (Wise Mari)";
	sound = 3;
	trivialPercent = 0;
};

GTFO.SpellID["106104"] = {
	--desc = "Hydrolance Pulse (Wise Mari)";
	sound = 3;
	trivialPercent = 0;
};

GTFO.SpellID["106105"] = {
	--desc = "Hydrolance Pulse (Wise Mari)";
	sound = 3;
	trivialPercent = 0;
};

GTFO.SpellID["106267"] = {
	--desc = "Hydrolance Pulse (Wise Mari)";
	sound = 3;
	trivialPercent = 0;
};

GTFO.SpellID["106319"] = {
	--desc = "Hydrolance Pulse (Wise Mari)";
	sound = 3;
	trivialPercent = 0;
};

-- *****************
-- * Scarlet Halls *
-- *****************

GTFO.SpellID["111217"] = {
	--desc = "Cannon Blast (Scarlet Cannon)";
	sound = 3;
	trivialPercent = 0;
};

GTFO.SpellID["111217"] = {
	--desc = "Dragon's Reach (Armsmaster Harlan)";
	sound = 3;
	tankSound = 0;
	trivialPercent = 0;
};

GTFO.SpellID["112955"] = {
	--desc = "Blades of Light (Armsmaster Harlan)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["113653"] = {
	--desc = "Greater Dragon's Breath (Flameweaver Koegler)";
	sound = 3;
	trivialPercent = 0;
	applicationOnly = true;
};

-- ***************************
-- * Gate of the Setting Sun *
-- ***************************

GTFO.SpellID["107215"] = {
	--desc = "Mantid Munition Explosion (Saboteur Kip'tilak)";
	sound = 3;
	trivialPercent = 0;
};

GTFO.SpellID["113645"] = {
	--desc = "Sabotage (Saboteur Kip'tilak)";
	sound = 4;
};

GTFO.SpellID["111671"] = {
	--desc = "Battering Headbutt (Raigonn)";
	sound = 3;
};

GTFO.SpellID["111728"] = {
	--desc = "Stomp (Raigonn)";
	sound = 3;
	test = true; -- Verify if it's truly avoidable
};

-- ********************
-- * Mogu'shan Palace *
-- ********************

GTFO.SpellID["119922"] = {
	-- Currently broken because Blizzard's combat log doesn't pick this up
	--desc = "Shockwave (Kuai the Brute)";
	sound = 3;
};

GTFO.SpellID["120087"] = {
	--desc = "Whirling Dervish (Ming the Cunning)";
	sound = 3;
};

GTFO.SpellID["119684"] = {
	--desc = "Ground Slam (Xin the Weaponmaster)";
	sound = 3;
};

GTFO.SpellID["119590"] = {
	--desc = "Ring of Fire - Explosion (Xin the Weaponmaster)";
	sound = 3;
	trivialPercent = 0;
};

-- ***********************
-- * Shado-Pan Monastery *
-- ***********************

GTFO.SpellID["106932"] = {
	--desc = "Static Field (Gu Cloudstrike)";
	sound = 3;
};

GTFO.SpellID["106871"] = {
	--desc = "Sha Spike (Sha of Violence)";
	sound = 3;
};

GTFO.SpellID["106433"] = {
	--desc = "Tornado Kick (Master Snowdrift)";
	soundHeroic = 3;
	tankSoundHeroic = 0;
	tankSoundChallenge = 3;
};

GTFO.SpellID["106470"] = {
	--desc = "Ball of Fire - Blue (Master Snowdrift)";
	sound = 3;
};

GTFO.SpellID["106413"] = {
	--desc = "Ball of Fire - Red (Master Snowdrift)";
	sound = 3;
};

-- **************************
-- * Siege of Nivzao Temple *
-- **************************

GTFO.SpellID["120200"] = {
	--desc = "Bombard (Sik'thik Amberwing)";
	sound = 3;
	tankSound = 0;
};

-- TODO: Unstable Blast (Sik'thik Demolisher) (avoidable)

GTFO.SpellID["124317"] = {
	--desc = "Blade Rush (General Pa'valak)";
	sound = 3;
};

GTFO.SpellID["119703"] = {
	--desc = "Detonate (General Pa'valak)";
	sound = 3;
};

-- *****************
-- * Heart of Fear *
-- *****************

GTFO.SpellID["123490"] = {
	--desc = "Jawbone Slam (Enslaved Bonesmasher)";
	sound = 3;
	tankSound = 0;
	trivialPercent = 0;
};

GTFO.SpellID["124673"] = {
	--desc = "Sonic Pulse (Imperial Vizier Zor'lok)";
	sound = 3;
	trivialPercent = 0;
};

GTFO.SpellID["122853"] = {
	--desc = "Tempest Slash (Blade Lord Ta'yak)";
	sound = 3;
	trivialPercent = 0;
};

-- TODO: Wind Step (Blade Lord Ta'yak) (fail if player wasn't the intended target)

GTFO.SpellID["124089"] = {
	--desc = "Zephyr (Set'thik Gustwing)";
	sound = 3;
	tankSound = 0;
};

GTFO.SpellID["122735"] = {
	--desc = "Furious Swipe (Garalon)";
	sound = 3;
	tankSound = 0;
};

GTFO.SpellID["122774"] = {
	--desc = "Crush (Garalon)";
	sound = 3;
	trivialPercent = 0;
	damageMinimum = 300000;
};

GTFO.SpellID["121898"] = {
	--desc = "Whirling Blade (Wind Lord Mel'jarak)";
	sound = 3;
	tankSound = 0;
};

-- TODO: Wind Bomb (Wind Lord Mel'jarak) (impact)
-- TODO: Wind Bomb (Wind Lord Mel'jarak) (detonation, caused by a player getting too close, need to determine who did it, probably raid wiper)
-- TODO: Amber Prison (Wind Lord Mel'jarak) (fail if player wasn't the intended target, doesn't apply in LFR)

GTFO.SpellID["126939"] = {
	--desc = "Amber Volley (Sra'thik Ambercaller)";
	sound = 3;
};

-- TODO: Living Amber (Amber-Shaper Un'sok) (explosion? avoidable?)

GTFO.SpellID["122457"] = {
	--desc = "Rough Landing (Amber Monstrosity)";
	sound = 3;
	test = true; -- Verify the tank being thrown isn't setting off this alert
};

-- TODO: Amber Globule (Amber-Shaper Un'sok) (only warn if the player was the intended target)
-- TODO: Sonic Discharge (Grand Empress Shek'zeer) (only fail if the player was in a dissonance field at the time, maybe)
-- TODO: Dread Screech (Grand Empress Shek'zeer) (fail if the players weren't the intended targets)
-- TODO: Amber Trap (Grand Empress Shek'zeer) (fail when afflicated)

GTFO.SpellID["124807"] = {
	--desc = "Toxic Slime (Kor'thik Reaver)";
	sound = 3;
	tankSound = 0;
};

GTFO.SpellID["124849"] = {
	--desc = "Consuming Terror (Grand Empress Shek'zeer)";
	sound = 3;
};

-- ********************
-- * Mogu'shan Vaults *
-- ********************

GTFO.SpellID["116281"] = {
	--desc = "Cobalt Mine (Stone Guard)";
	sound = 3; 
	test = true; -- TODO: ignore when it's during cobalt petrification
};

GTFO.SpellID["121087"] = {
	--desc = "Ground Slam (Cursed Mogu Sculpture)";
	sound = 3;
	tankSound = 0;
};

GTFO.SpellID["116374"] = {
	--desc = "Lightning Charge (Feng the Accursed)";
	sound = 3;
};

GTFO.SpellID["116510"] = {
	--desc = "Explosion (Troll Explosives)";
	sound = 3;
};

GTFO.SpellID["117455"] = {
	--desc = "Suicide (Gara'jal the Spiritbinder) (+30 seconds in spirit world)";
	sound = 3;
};

-- TODO: Frail Soul (Gara'jal the Spiritbinder) (Death from crossing over with debuff, "Frail Soul" is the debuff but not the actual damage/death event)

GTFO.SpellID["117918"] = {
	--desc = "Overhand Strike (The Spirit Kings)";
	sound = 3;
};

GTFO.SpellID["119521"] = {
	--desc = "Annihilate (Qiang the Merciless - Trash)";
	sound = 3;
};

GTFO.SpellID["117948"] = {
	--desc = "Annihilate (The Spirit Kings)";
	sound = 3;
};

GTFO.SpellID["118106"] = {
	--desc = "Volley - Third Shot (The Spirit Kings)";
	sound = 3;
};

GTFO.SpellID["118048"] = {
	--desc = "Pillaged (The Spirit Kings)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["126955"] = {
	--desc = "Forceful Swing (Mogu'shan Warden)";
	sound = 3;
};

GTFO.SpellID["119722"] = {
	--desc = "Energy Cascade (Elegon)";
	sound = 3;
};

GTFO.SpellID["132275"] = {
	--desc = "Obliteration (Elegon)";
	sound = 3;
};

GTFO.SpellID["116550"] = {
	--desc = "Energizing Smash (Will of the Emperor)";
	sound = 3;
};

GTFO.SpellID["116835"] = {
	--desc = "Devastating Arc (Will of the Emperor)";
	sound = 3;
};

GTFO.SpellID["132425"] = {
	--desc = "Stomp (Qin-xi, Will of the Emperor)";
	sound = 3;
};

GTFO.SpellID["116969"] = {
	--desc = "Stomp (Jan-xi, Will of the Emperor)";
	sound = 3;
};

-- *****************************
-- * Terrace of Endless Spring *
-- *****************************
-- TODO: Lightning Storm (Elder Regail)
-- TODO: Water Bolt (Elder Asani) (See if it's possible to avoid)
-- TODO: Nightmares (Tsulong) (See if it's possible to avoid)
-- TODO: Shadow Breath (Tsulong) (Non-tank fail)
-- TODO: Spray (Lei Shi)
-- TODO: Breath of Fear (Sha of Fear)
-- TODO: Eerie Skull (Sha of Fear)
-- TODO: Penetrating Bolt (Sha of Fear)
-- TODO: Waterspout (Sha of Fear)
-- TODO: Submerge (Sha of Fear) (Avoidable?)

-- ****************
-- * World Bosses *
-- ****************

-- TODO: Cannon Barrage (Salyis's Warband)

-- ************
-- * Pandaria *
-- ************

GTFO.SpellID["131090"] = {
	--desc = "Face Smash (Koukou)";
	sound = 3;
	trivialPercent = 0;
};

GTFO.SpellID["130850"] = {
	--desc = "Rain of Meteors (Ga'trul)";
	sound = 3;
	trivialPercent = 0;
};

GTFO.SpellID["113119"] = {
	--desc = "Arcanic Oubliette";
	sound = 3;
};

GTFO.SpellID["116474"] = {
	--desc = "Riverblade Spike Trap";
	sound = 3;
};

GTFO.SpellID["124289"] = {
	--desc = "Yaungol Stomp (Go-Kan)";
	sound = 3;
	trivialPercent = 0;
};

GTFO.SpellID["124946"] = {
	--desc = "Devastating Arc (Jonn-Dar)";
	sound = 3;
	trivialPercent = 0;
};

GTFO.SpellID["129499"] = {
	--desc = "Far Reaching Fear (Manifestation of Fear)";
	sound = 3;
	trivialPercent = 0;
};

GTFO.SpellID["115186"] = {
	--desc = "Fear (Fear Sphere)";
	sound = 3;
};

GTFO.SpellID["118537"] = {
	--desc = "Sha Eruption (Orachi)";
	sound = 3;
};

GTFO.SpellID["118629"] = {
	--desc = "Sha Eruption (Shai Hu)";
	sound = 3;
};

GTFO.SpellID["120353"] = {
	--desc = "Flame Spout";
	sound = 3;
};

GTFO.SpellID["123798"] = {
	--desc = "Lightning Crash";
	sound = 3;
};

GTFO.SpellID["129024"] = {
	--desc = "Ancient Rune of Striking";
	sound = 3;
};

GTFO.SpellID["126631"] = {
	--desc = "Devastation (Spirit of Anger)";
	sound = 3;
};

GTFO.SpellID["124781"] = {
	--desc = "Mantid Mine (Kz'Kzik)";
	sound = 3;
};

GTFO.SpellID["131043"] = {
	--desc = "Thundering Slam (Shao-Tien Behemoth)";
	sound = 3;
};

GTFO.SpellID["131046"] = {
	--desc = "Crushing Stomp (Shao-Tien Behemoth)";
	sound = 3;
};

GTFO.SpellID["129612"] = {
	--desc = "Bombardment";
	sound = 3;
};

GTFO.SpellID["131801"] = {
	--desc = "Water Spout (Thousand-Year Guardian)";
	sound = 3;
};

GTFO.SpellID["126822"] = {
	--desc = "Jade Smash (Jade Sentinel)";
	sound = 3;
};

GTFO.SpellID["127393"] = {
	--desc = "Twirling Blades";
	sound = 3;
};

GTFO.SpellID["128550"] = {
	--desc = "Forceful Throw (Jokka-Jokka)";
	sound = 3;
};

GTFO.SpellID["112041"] = {
	--desc = "Shadowpan Firework Explosion (Shado-Pan Trainer)";
	sound = 3;
};

-- ********************
-- * Theramore's Fall *
-- ********************

GTFO.SpellID["114568"] = {
	--desc = "Big Bessa's Cannon (Big Bessa)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["125915"] = {
	--desc = "Demolisher Shot (Gatecrusher)";
	sound = 3;
	applicationOnly = true;
};

-- *******************
-- * A Brewing Storm *
-- *******************

GTFO.SpellID["111544"] = {
	--desc = "Lightning Impact (Blanche's Lightning Rod)";
	sound = 3;
};

GTFO.SpellID["131595"] = {
	--desc = "Wind Slash (Viletongue Decimator)";
	sound = 3;
};

GTFO.SpellID["115013"] = {
	--desc = "Swamp Smash (Borokhula the Destroyer)";
	sound = 3;
};

GTFO.SpellID["122144"] = {
	--desc = "Earth Shattering (Borokhula the Destroyer)";
	sound = 3;
};

-- ********************************
-- * Crypt of the Forgotten Kings *
-- ********************************

GTFO.SpellID["120783"] = {
	--desc = "Deathforce (Abomination of Anger)";
	sound = 3;
};
