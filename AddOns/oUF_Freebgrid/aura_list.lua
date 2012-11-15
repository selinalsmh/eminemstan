local _, ns = ...

local foo = {""}
local spellcache = setmetatable({}, 
{__index=function(t,id) 
	local a = {GetSpellInfo(id)} 

	if GetSpellInfo(id) then
	    t[id] = a
	    return a
	end

	--print("Invalid spell ID: ", id)
        t[id] = foo
	return foo
end
})

local function GetSpellInfo(a)
    return unpack(spellcache[a])
end

ns.auras = {
    -- Ascending aura timer
    -- Add spells to this list to have the aura time count up from 0
    -- NOTE: This does not show the aura, it needs to be in one of the other list too.
    ascending = {
        [GetSpellInfo(92956)] = true, -- Wrack
    },

    -- Any Zone
    debuffs = {
        --[6788] = 16,
        --[GetSpellInfo(6788)] = 16, -- Weakened Soul
        [GetSpellInfo(39171)] = 9, -- Mortal Strike
        [GetSpellInfo(76622)] = 9, -- Sunder Armor
    },

    buffs = {
		[GetSpellInfo(871)] = 1,	-- ��ǽ
		[GetSpellInfo(12975)] = 1,	--�Ƹ�����
		[GetSpellInfo(97463)] = 1,	--�����ź�
		[GetSpellInfo(2565)] = 1,	--���Ƹ�
		--------------------------��ʿ---------------
		[GetSpellInfo(642)] = 1,	--ʥ����
		[GetSpellInfo(86659)] = 1,	--Զ����������
		[GetSpellInfo(70940)] = 1,	--��ʥ����
		[GetSpellInfo(31850)] = 1,	--���ȷ�����
		[GetSpellInfo(498)] = 1,	--ʥ����
		[GetSpellInfo(1022)] = 1,	--����֮��
		[GetSpellInfo(1038)] = 1,	--����֮��
		[GetSpellInfo(6940)] = 1,	--����֮��
		
		--------------------------DK---------------
		[GetSpellInfo(48707)] = 1,	--��ħ������
		[GetSpellInfo(50461)] = 1,	--��ħ������
		--[GetSpellInfo(49222)] = 1,	--�׹�֮��
		[GetSpellInfo(48792)] = 1,	--����֮��
		[GetSpellInfo(55233)] = 1,	--��Ѫ��֮Ѫ
		------------------------��³��---------------
		[GetSpellInfo(22812)] = 1,	--��Ƥ��
		[GetSpellInfo(22842)] = 1,	--�񱩻ظ�
		[GetSpellInfo(61336)] = 1,	--���汾��
		------------------------��ʦ--------------------
		[GetSpellInfo(33206)] = 1, --ʹ��ѹ��
		[GetSpellInfo(47788)] = 1, --�ػ�֮��
		------------------------��ɮ-------------------
		[GetSpellInfo(126456)] = 1, --׳����
		
    },

    -- Raid Debuffs
    instances = {
        --["MapID"] = {
        --	[Name or GetSpellInfo(spellID) or SpellID] = PRIORITY,
        --},
		
				[896] = {                       --ħ��ɽ����
			-- The Stone Guard
			[GetSpellInfo(116281)] = 7, -- Cobalt Mine Blast, Magic root

			--Feng the Accursed
			[GetSpellInfo(116040)] = 7, -- Epicenter, roomwide aoe.
			[GetSpellInfo(116784)] = 7, -- Wildfire Spark, Debuff that explodes leaving fire on the ground after 5 sec.
			[GetSpellInfo(116374)] = 7, -- Lightning Charge, Stun debuff.
			[GetSpellInfo(116417)] = 7, -- Arcane Resonance, aoe-people-around-you-debuff.
			[GetSpellInfo(116942)] = 7, -- Flaming Spear, fire damage dot.

			-- Gara'jal the Spiritbinder
			[GetSpellInfo(122151)] = 7,	-- Voodoo Doll, shared damage with the tank.
			[GetSpellInfo(116161)] = 7,	-- Crossed Over, people in the spirit world.

			-- The Spirit Kings
			[GetSpellInfo(117708)] = 7, -- Meddening Shout, The mind control debuff.
			[GetSpellInfo(118303)] = 7, -- Fixate, the once targeted by the shadows.
			[GetSpellInfo(118048)] = 7, -- Pillaged, the healing/Armor/damage debuff.
			[GetSpellInfo(118135)] = 7, -- Pinned Down, Najentus spine 2.0

			--Elegon
			[GetSpellInfo(117878)] = 8, -- Overcharged, the stacking increased damage taken debuff.	
			[GetSpellInfo(117870)] = 7, -- Touch of the Titans, the debuff everybody gets increasing damage done and healing taken.
			[GetSpellInfo(117949)] = 9, -- Closed Circuit, Magic Healing debuff.

			--Will of the Emperor
			[GetSpellInfo(116969)] = 7, -- Stomp, Stun from the bosses.
			[GetSpellInfo(116835)] = 7, -- Devestating Arc, Armor debuff from the boss.
			[GetSpellInfo(116778)] = 7, -- Focused Defense, Fixate from the Emperors Courage.
			[GetSpellInfo(117485)] = 7, -- Impending Thrust, Stacking slow from the Emperors Courage.
			[GetSpellInfo(116525)] = 7, -- Focused Assault, Fixate from the Emperors Rage
			[GetSpellInfo(116550)] = 7, -- Energizing Smash, Knockdown from the Emperors Strength
		},
		[897] = {
			-- Imperial Vizier Zor'lok
			[GetSpellInfo(122761)] = 7, -- Exhale, The person targeted for Exhale. 
			[GetSpellInfo(123812)] = 7, -- Pheromones of Zeal, the gas in the middle of the room.
			[GetSpellInfo(122706)] = 7, -- Noise Cancelling, The "safe zone" from the roomwide aoe.
			[GetSpellInfo(122740)] = 7, -- Convert, The mindcontrol Debuff.

			-- Blade Lord Ta'yak
			[GetSpellInfo(123180)] = 7, -- Wind Step, Bleeding Debuff from stealth.
			[GetSpellInfo(123474)] = 7, -- Overwhelming Assault, stacking tank swap debuff. 

			-- Garalon
			[GetSpellInfo(122774)] = 7, -- Crush, stun from the crush ability.
			[GetSpellInfo(123426)] = 7, -- Weak Points, Increased damage done to one leg.
			[GetSpellInfo(123428)] = 7, -- Weak Points, Increased damage to another leg.
			[GetSpellInfo(123423)] = 7, -- Weak Points, Increased damage to another leg.
			[GetSpellInfo(123235)] = 7, -- Weak Points, Increased damage to another leg.
			[GetSpellInfo(122835)] = 7, -- Pheromones, The buff indicating who is carrying the pheramone.
			[GetSpellInfo(123081)] = 7, -- Punchency, The stacking debuff causing the raid damage.

			--Wind Lord Mel'jarak
			[GetSpellInfo(122055)] = 7, -- Residue, The debuff after breaking a prsion preventing further breaking.
			[GetSpellInfo(121885)] = 7, -- Amber Prison, The stun that somebody has to click off.
			[GetSpellInfo(121881)] = 7, -- Amber Prison, not sure what the differance is but both were used.
			[GetSpellInfo(122125)] = 7, -- Corrosive Resin pool, the **** on the floor your not supposed to stand in.
			[GetSpellInfo(122064)] = 7, -- Corrosive Resin, the dot you clear by moving/jumping.

			-- Amber-Shaper Un'sok 
			[GetSpellInfo(122370)] = 7, -- Reshape Life, the transformation ala putricide.
			[GetSpellInfo(122784)] = 7, -- Reshape Life, Both were used.
			[GetSpellInfo(124802)] = 7, -- The transformed players increase damage taken cooldown.
			[GetSpellInfo(122395)] = 7, -- Struggle for Control, the self stun used to interupt the channel.
			[GetSpellInfo(122457)] = 7, -- Rough Landing, The stun from being tossed and being hit by the toss from the add in Phase 2.
			[GetSpellInfo(121949)] = 7, -- Parasitic Growth, the dot that scales with healing taken.
		},
		[886] = {
			--Protectors Of the Endless
			[GetSpellInfo(117519)] = 7, -- Touch of Sha, Dot that lasts untill Kaolan is defeated.
			[GetSpellInfo(117235)] = 7, -- Purified, haste buff gained by killing mist and being in range.
			[GetSpellInfo(117353)] = 7, -- Overwhelming Corruption, stacking raidwide softenrage debuff.
			[GetSpellInfo(118091)] = 7, -- Defiled Ground, Increased damage taken from Defiled ground debuff.
			[GetSpellInfo(117436)] = 7, -- Lightning Prison, Magic stun.

			--Tsulong
			[GetSpellInfo(122768)] = 7, -- Dread Shadows, Stacking raid damage debuff (ragnaros superheated style) 
			[GetSpellInfo(122789)] = 7, -- Sunbeam, standing in the sunbeam, used to clear dread shadows.
			[GetSpellInfo(122858)] = 7, -- Bathed in Light, 500% increased healing done debuff.
			[GetSpellInfo(122752)] = 7, -- Shadow Breath, increased shadow breath damage debuff.
			[GetSpellInfo(123011)] = 7, -- Terrorize, Magical dot dealing % health.
			[GetSpellInfo(123036)] = 7, -- Fright, 2 second fear.
			[GetSpellInfo(122777)] = 7, -- Nightmares, 3 second fear.

			--Lei Shi
			[GetSpellInfo(123121)] = 7, -- Spray, Stacking frost damage taken debuff.

			--Sha of Fear
			[GetSpellInfo(129147)] = 7, -- Ominous Cackle, Debuff that sends players to the outer platforms.
			[GetSpellInfo(119086)] = 7, -- Penetrating Bolt, Increased Shadow damage debuff.
			[GetSpellInfo(119775)] = 7, -- Reaching Attack, Increased Shadow damage debuff.
			[GetSpellInfo(119985)] = 7, -- Dread Spray, stacking magic debuff, fears at 2 stacks.
			[GetSpellInfo(119983)] = 7, -- Dread Spray, is also used.
			[GetSpellInfo(119414)] = 7, -- Breath of Fear, Fear+Massiv damage.
		},
		
        [824] = { --[[ Dragon Soul ]]--
           --Deep Corruption IDs
           [109389] = 8,
           [103628] = 8,

            --Ultraxion
            [GetSpellInfo(109075)] = 7, -- Fading Light
        },

        [800] = { --[[ Firelands ]]--

            --Baleroc
            [GetSpellInfo(100232)] = 9, -- Torment
			[GetSpellInfo(76622)] = 4, -- Sunder Armor 
			[GetSpellInfo(99610)] = 5, -- Shockwave 
			--Flamewaker Pathfinder 
			[GetSpellInfo(99695)] = 4, -- Flaming Spear 
			[GetSpellInfo(99800)] = 4, -- Ensnare 
			--Flamewaker Cauterizer 
			[GetSpellInfo(99625)] = 4, -- Conflagration (Magic/dispellable) 
			--Fire Scorpion 
			[GetSpellInfo(99993)] = 4, -- Fiery Blood 
			--Molten Lord 
			[GetSpellInfo(100767)] = 4, -- Melt Armor 
			--Ancient Core Hound 
			[GetSpellInfo(99692)] = 4, -- Terrifying Roar (Magic/dispellable) 
			[GetSpellInfo(99693)] = 4, -- Dinner Time 
			--Magma 
			[GetSpellInfo(97151)] = 4, -- Magma 

			--Beth'tilac 
			[GetSpellInfo(99506)] = 5, -- The Widow's Kiss 
			--Cinderweb Drone 
			[GetSpellInfo(49026)] = 6, -- Fixate 
			--Cinderweb Spinner 
			[GetSpellInfo(97202)] = 5, -- Fiery Web Spin 
			--Cinderweb Spiderling 
			[GetSpellInfo(97079)] = 4, -- Seeping Venom 
			--Cinderweb Broodling 

			[GetSpellInfo(100048)] = 4, --Fiery Web 

			--Lord Rhyolith 
			[GetSpellInfo(98492)] = 5, --Eruption 

			--Alysrazor 
			[GetSpellInfo(101729)] = 5, -- Blazing Claw 
			[GetSpellInfo(100094)] = 4, -- Fieroblast 
			[GetSpellInfo(99389)] = 5, -- Imprinted 
			[GetSpellInfo(99308)] = 4, -- Gushing Wound 
			[GetSpellInfo(100640)] = 6, -- Harsh Winds 
			[GetSpellInfo(100555)] = 6, -- Smouldering Roots 
			--Do we want to show these? 
			[GetSpellInfo(99461)] = 4, -- Blazing Power 
			--[GetSpellInfo(98734)] = 4, -- Molten Feather 
			--[GetSpellInfo(98619)] = 4, -- Wings of Flame 
			--[GetSpellInfo(100029)] = 4, -- Alysra's Razor 

			--Shannox 
			[GetSpellInfo(99936)] = 5, -- Jagged Tear 
			[GetSpellInfo(99837)] = 7, -- Crystal Prison Trap Effect 
			[GetSpellInfo(101208)] = 4, -- Immolation Trap 
			[GetSpellInfo(99840)] = 4, -- Magma Rupture 
			-- Riplimp 
			[GetSpellInfo(99937)] = 5, -- Jagged Tear 
			-- Rageface 
			[GetSpellInfo(99947)] = 6, -- Face Rage 
			[GetSpellInfo(100415)] = 5, -- Rage  

			--�����˱������ 
			[GetSpellInfo(99252)] = 4, -- Blaze of Glory 
			[GetSpellInfo(99256)] = 15, -- ����ĥ�� 
			[GetSpellInfo(99403)] = 6, -- Tormented 
			[GetSpellInfo(99262)] = 4, -- ������
			[GetSpellInfo(99263)] = 4, -- ����֮��
			[GetSpellInfo(99516)] = 7, -- Countdown 
			[GetSpellInfo(99353)] = 7, -- Decimating Strike 
			[GetSpellInfo(100908)] = 6, -- Fiery Torment 

			--Majordomo Staghelm 
			[GetSpellInfo(98535)] = 5, -- Leaping Flames 
			[GetSpellInfo(98443)] = 6, -- Fiery Cyclone 
			[GetSpellInfo(98450)] = 5, -- Searing Seeds 
			--Burning Orbs 
			[GetSpellInfo(100210)] = 6, -- Burning Orb 
			[GetSpellInfo(96993)] = 5, -- Stay Withdrawn? 

			--Ragnaros 
			[GetSpellInfo(99399)] = 5, -- Burning Wound 
			[GetSpellInfo(100293)] = 5, -- Lava Wave 
			[GetSpellInfo(100238)] = 4, -- Magma Trap Vulnerability 
			[GetSpellInfo(98313)] = 4, -- Magma Blast 
			--Lava Scion 
			[GetSpellInfo(100460)] = 7, -- Blazing Heat 
			--Dreadflame? 
			--Son of Flame 
			--Lava 
			[GetSpellInfo(98981)] = 5, -- Lava Bolt 
			--Molten Elemental 
			--Living Meteor 
			[GetSpellInfo(100249)] = 5, -- Combustion 
			--Molten Wyrms 
			[GetSpellInfo(99613)] = 6, -- Molten Blast   
        },

        [752] = { --[[ Baradin Hold ]]--

            [GetSpellInfo(88954)] = 6, -- Consuming Darkness
        },
        
        [754] = { --[[ Blackwing Descent ]]--

            --Magmaw
            [GetSpellInfo(78941)] = 6, -- Parasitic Infection
            [GetSpellInfo(89773)] = 7, -- Mangle

            --Omnitron Defense System
            [GetSpellInfo(79888)] = 6, -- Lightning Conductor
            [GetSpellInfo(79505)] = 8, -- Flamethrower
            [GetSpellInfo(80161)] = 7, -- Chemical Cloud
            [GetSpellInfo(79501)] = 8, -- Acquiring Target
            [GetSpellInfo(80011)] = 7, -- Soaked in Poison
            [GetSpellInfo(80094)] = 7, -- Fixate
            [GetSpellInfo(92023)] = 9, -- Encasing Shadows
            [GetSpellInfo(92048)] = 9, -- Shadow Infusion
            [GetSpellInfo(92053)] = 9, -- Shadow Conductor
            --[GetSpellInfo(91858)] = 6, -- Overcharged Power Generator
            
            --Maloriak
            [GetSpellInfo(92973)] = 8, -- Consuming Flames
            [GetSpellInfo(92978)] = 8, -- Flash Freeze
            [GetSpellInfo(92976)] = 7, -- Biting Chill
            [GetSpellInfo(91829)] = 7, -- Fixate
            [GetSpellInfo(92787)] = 9, -- Engulfing Darkness

            --Atramedes
            [GetSpellInfo(78092)] = 7, -- Tracking
            [GetSpellInfo(78897)] = 8, -- Noisy
            [GetSpellInfo(78023)] = 7, -- Roaring Flame

            --Chimaeron
            [GetSpellInfo(89084)] = 8, -- Low Health
            [GetSpellInfo(82881)] = 7, -- Break
            [GetSpellInfo(82890)] = 9, -- Mortality

            --Nefarian
            [GetSpellInfo(94128)] = 7, -- Tail Lash
            --[GetSpellInfo(94075)] = 8, -- Magma
            [GetSpellInfo(79339)] = 9, -- Explosive Cinders
            [GetSpellInfo(79318)] = 9, -- Dominion
        },

        [758] = { --[[ The Bastion of Twilight ]]--

            --Halfus
            [GetSpellInfo(39171)] = 7, -- Malevolent Strikes
            [GetSpellInfo(86169)] = 8, -- Furious Roar

            --Valiona & Theralion
            [GetSpellInfo(86788)] = 6, -- Blackout
            [GetSpellInfo(86622)] = 7, -- Engulfing Magic
            [GetSpellInfo(86202)] = 7, -- Twilight Shift

            --Council
            [GetSpellInfo(82665)] = 7, -- Heart of Ice
            [GetSpellInfo(82660)] = 7, -- Burning Blood
            [GetSpellInfo(82762)] = 7, -- Waterlogged
            [GetSpellInfo(83099)] = 7, -- Lightning Rod
            [GetSpellInfo(82285)] = 7, -- Elemental Stasis
            [GetSpellInfo(92488)] = 8, -- Gravity Crush

            --Cho'gall
            [GetSpellInfo(86028)] = 6, -- Cho's Blast
            [GetSpellInfo(86029)] = 6, -- Gall's Blast
            [GetSpellInfo(93189)] = 7, -- Corrupted Blood
            [GetSpellInfo(93133)] = 7, -- Debilitating Beam
            [GetSpellInfo(81836)] = 8, -- Corruption: Accelerated
            [GetSpellInfo(81831)] = 8, -- Corruption: Sickness
            [GetSpellInfo(82125)] = 8, -- Corruption: Malformation
            [GetSpellInfo(82170)] = 8, -- Corruption: Absolute

            --Sinestra
            [GetSpellInfo(92956)] = 9, -- Wrack
        },

        [773] = { --[[ Throne of the Four Winds ]]--

            --Conclave
            [GetSpellInfo(85576)] = 9, -- Withering Winds
            [GetSpellInfo(85573)] = 9, -- Deafening Winds
            [GetSpellInfo(93057)] = 7, -- Slicing Gale
            [GetSpellInfo(86481)] = 8, -- Hurricane
            [GetSpellInfo(93123)] = 7, -- Wind Chill
            [GetSpellInfo(93121)] = 8, -- Toxic Spores

            --Al'Akir
            --[GetSpellInfo(93281)] = 7, -- Acid Rain
            [GetSpellInfo(87873)] = 7, -- Static Shock
            [GetSpellInfo(88427)] = 7, -- Electrocute
            [GetSpellInfo(93294)] = 8, -- Lightning Rod
            [GetSpellInfo(93284)] = 9, -- Squall Line
        },
		
		[824] = {
		  --Morchok
		  [GetSpellInfo(103687)] = 11, --Crush Armor
		  [GetSpellInfo(103821)] = 12, --Earthen Vortex
		  [GetSpellInfo(103785)] = 13, --Black Blood of the Earth
		  [GetSpellInfo(103534)] = 14, --Danger (Red)
		  [GetSpellInfo(103536)] = 15, --Warning (Yellow)
		  -- Don't need to show Safe people
		  [GetSpellInfo(103541)] = 16, --Safe (Blue)

		  --����
		  [GetSpellInfo(104378)] = 21, --Black Blood of Go'rath
		  [GetSpellInfo(103434)] = 22, --����֮Ӱ

		  --Yor'sahj the Unsleeping
		  [GetSpellInfo(104849)] = 31, --��ռ�
		  [GetSpellInfo(105171)] = 32, --��ȸ�ʴ

		  --Hagara the Stormbinder
		  [GetSpellInfo(105316)] = 41, --Ice Lance  ��ǹ
		  [GetSpellInfo(105465)] = 42, --Lightning Storm  ����籩
		  [GetSpellInfo(105369)] = 43, --Lightning Conduit  ���絼��
		  [GetSpellInfo(105289)] = 44, --Shattered Ice (dispellable)  
		  [GetSpellInfo(105285)] = 45, --Target (next Ice Lance)
		  [GetSpellInfo(104451)] = 46, --Ice Tomb  ��Ĺ
		  [GetSpellInfo(110317)] = 47, --Watery Entrenchment ˮ��
		  [GetSpellInfo(109325)] = 48, --˪��


		  --Ultraxion
		  [GetSpellInfo(105925)] = 55, --����֮��
		  [GetSpellInfo(106108)] = 52, --Heroic Will
		  [GetSpellInfo(105984)] = 53, --Timeloop
		  [GetSpellInfo(105927)] = 54, --Faded Into Twilight

		  --Warmaster Blackhorn
		  [GetSpellInfo(108043)] = 65, --�Ƽ�
		  [GetSpellInfo(107558)] = 62, --Degeneration
		  [GetSpellInfo(107567)] = 64, --���̴��
		  [GetSpellInfo(108046)] = 63, --Shockwave

		  --Spine of Deathwing
		  [GetSpellInfo(105563)] = 71, --Grasping Tendrils
		  [GetSpellInfo(105479)] = 72, --����Ѫ��
		  [GetSpellInfo(105490)] = 73, --����֮��
		  [GetSpellInfo(106199)] = 74, --Ѫ֮��ʴ:����
		  [GetSpellInfo(106200)] = 74, --Ѫ֮��ʴ:���

		  --Madness of Deathwing
		  [GetSpellInfo(105445)] = 81, --����
		  [GetSpellInfo(105841)] = 82, --ͻ��˺ҧ
		  [GetSpellInfo(106385)] = 83, --����
		  [GetSpellInfo(106730)] = 84, --���˷�
		  [GetSpellInfo(106444)] = 85, --�̴�
		  [GetSpellInfo(106794)] = 86, --��м
		  [GetSpellInfo(108649)] = 87, --��ʴ������ 

	   },
    },
}
