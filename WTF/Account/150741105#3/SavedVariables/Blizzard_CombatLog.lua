
Blizzard_CombatLog_Filters = {
	["currentFilter"] = 1,
	["filters"] = {
		{
			["quickButtonName"] = "我的动作",
			["onQuickBar"] = true,
			["quickButtonDisplay"] = {
				["party"] = true,
				["solo"] = true,
				["raid"] = true,
			},
			["tooltip"] = "显示你所进行的动作的信息。",
			["name"] = "我的动作",
			["colors"] = {
				["schoolColoring"] = {
					{
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 0,
					}, -- [1]
					{
						["a"] = 1,
						["r"] = 1,
						["g"] = 0.9,
						["b"] = 0.5,
					}, -- [2]
					nil, -- [3]
					{
						["a"] = 1,
						["r"] = 1,
						["g"] = 0.5,
						["b"] = 0,
					}, -- [4]
					[0] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
					[8] = {
						["a"] = 1,
						["r"] = 0.3,
						["g"] = 1,
						["b"] = 0.3,
					},
					[32] = {
						["a"] = 1,
						["r"] = 0.5,
						["g"] = 0.5,
						["b"] = 1,
					},
					[16] = {
						["a"] = 1,
						["r"] = 0.5,
						["g"] = 1,
						["b"] = 1,
					},
					[64] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 0.5,
						["b"] = 1,
					},
				},
				["unitColoring"] = {
					[32334] = {
						["a"] = 1,
						["r"] = 0.75,
						["g"] = 0.05,
						["b"] = 0.05,
					},
					[2147483648] = {
						["a"] = 1,
						["r"] = 0.75,
						["g"] = 0.75,
						["b"] = 0.75,
					},
					[32558] = {
						["a"] = 1,
						["r"] = 0.75,
						["g"] = 0.05,
						["b"] = 0.05,
					},
					[32078] = {
						["a"] = 1,
						["r"] = 0.75,
						["g"] = 0.05,
						["b"] = 0.05,
					},
					[32542] = {
						["a"] = 1,
						["r"] = 0.34,
						["g"] = 0.64,
						["b"] = 1,
					},
					[17681] = {
						["a"] = 1,
						["r"] = 0.7,
						["g"] = 0.7,
						["b"] = 0.7,
					},
					[12561] = {
						["a"] = 1,
						["r"] = 0.7,
						["g"] = 0.7,
						["b"] = 0.7,
					},
				},
				["highlightedEvents"] = {
					["PARTY_KILL"] = true,
				},
				["defaults"] = {
					["spell"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
					["damage"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 0,
					},
				},
				["eventColoring"] = {
				},
			},
			["hasQuickButton"] = true,
			["settings"] = {
				["abilityHighlighting"] = true,
				["lineColoring"] = true,
				["spellBraces"] = false,
				["sourceColoring"] = true,
				["showHistory"] = true,
				["destColoring"] = true,
				["amountHighlighting"] = true,
				["schoolNameColoring"] = false,
				["abilitySchoolColoring"] = false,
				["sourceBraces"] = true,
				["missColoring"] = true,
				["itemBraces"] = true,
				["abilityColoring"] = false,
				["amountActorColoring"] = false,
				["textMode"] = "A",
				["destBraces"] = true,
				["timestamp"] = false,
				["actionColoring"] = false,
				["fullText"] = false,
				["lineColorPriority"] = 1,
				["lineHighlighting"] = true,
				["abilityActorColoring"] = false,
				["actionHighlighting"] = false,
				["unitBraces"] = true,
				["braces"] = false,
				["schoolNameHighlighting"] = true,
				["unitIcons"] = true,
				["hideBuffs"] = false,
				["unitColoring"] = false,
				["amountSchoolColoring"] = false,
				["amountColoring"] = false,
				["hideDebuffs"] = false,
				["noMeleeSwingColoring"] = false,
				["timestampFormat"] = "%H:%M:%S",
				["schoolNameActorColoring"] = false,
				["actionActorColoring"] = false,
			},
			["filters"] = {
				{
					["sourceFlags"] = {
						[17681] = true,
					},
					["eventList"] = {
						["SPELL_PERIODIC_MISSED"] = false,
						["SPELL_INTERRUPT"] = false,
						["UNIT_DESTROYED"] = true,
						["SPELL_LEECH"] = false,
						["SPELL_AURA_BROKEN"] = false,
						["UNIT_DIED"] = false,
						["SPELL_PERIODIC_ENERGIZE"] = false,
						["DAMAGE_SPLIT"] = true,
						["UNIT_DISSIPATES"] = true,
						["SPELL_INSTAKILL"] = false,
						["SPELL_PERIODIC_DAMAGE"] = true,
						["SPELL_PERIODIC_HEAL"] = true,
						["PARTY_KILL"] = true,
						["SPELL_DAMAGE"] = true,
						["RANGE_DAMAGE"] = true,
						["ENVIRONMENTAL_DAMAGE"] = false,
						["SPELL_DISPEL"] = false,
						["SPELL_EXTRA_ATTACKS"] = false,
						["SPELL_MISSED"] = false,
						["SPELL_STOLEN"] = false,
						["SPELL_ENERGIZE"] = false,
						["SWING_MISSED"] = false,
						["SPELL_AURA_REFRESH"] = false,
						["SPELL_AURA_REMOVED_DOSE"] = false,
						["SPELL_DISPEL_FAILED"] = false,
						["SPELL_AURA_APPLIED"] = false,
						["ENCHANT_REMOVED"] = false,
						["ENCHANT_APPLIED"] = false,
						["SWING_DAMAGE"] = true,
						["SPELL_AURA_BROKEN_SPELL"] = false,
						["SPELL_PERIODIC_LEECH"] = false,
						["RANGE_MISSED"] = false,
						["SPELL_HEAL"] = true,
						["SPELL_AURA_REMOVED"] = false,
						["SPELL_AURA_APPLIED_DOSE"] = false,
						["SPELL_PERIODIC_DRAIN"] = false,
						["SPELL_DRAIN"] = false,
					},
				}, -- [1]
				{
					["destFlags"] = {
						[17681] = false,
						[12561] = false,
					},
					["eventList"] = {
						["SPELL_EXTRA_ATTACKS"] = true,
						["SPELL_MISSED"] = true,
						["SPELL_STOLEN"] = true,
						["SPELL_ENERGIZE"] = true,
						["SPELL_INTERRUPT"] = true,
						["SWING_MISSED"] = true,
						["SPELL_LEECH"] = true,
						["UNIT_DIED"] = true,
						["DAMAGE_SPLIT"] = true,
						["ENCHANT_APPLIED"] = true,
						["SPELL_DISPEL_FAILED"] = true,
						["SPELL_INSTAKILL"] = true,
						["UNIT_DISSIPATES"] = true,
						["UNIT_DESTROYED"] = true,
						["SWING_DAMAGE"] = true,
						["PARTY_KILL"] = true,
						["SPELL_DAMAGE"] = true,
						["RANGE_MISSED"] = true,
						["RANGE_DAMAGE"] = true,
						["ENCHANT_REMOVED"] = true,
						["SPELL_HEAL"] = true,
						["SPELL_DISPEL"] = true,
						["SPELL_DRAIN"] = true,
					},
				}, -- [2]
			},
		}, -- [1]
		{
			["quickButtonName"] = "我发生了什么？",
			["onQuickBar"] = true,
			["quickButtonDisplay"] = {
				["party"] = true,
				["solo"] = true,
				["raid"] = true,
			},
			["tooltip"] = "显示我所接收的所有行为信息。",
			["name"] = "我发生了什么？",
			["colors"] = {
				["schoolColoring"] = {
					{
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 0,
					}, -- [1]
					{
						["a"] = 1,
						["r"] = 1,
						["g"] = 0.9,
						["b"] = 0.5,
					}, -- [2]
					nil, -- [3]
					{
						["a"] = 1,
						["r"] = 1,
						["g"] = 0.5,
						["b"] = 0,
					}, -- [4]
					[0] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
					[8] = {
						["a"] = 1,
						["r"] = 0.3,
						["g"] = 1,
						["b"] = 0.3,
					},
					[32] = {
						["a"] = 1,
						["r"] = 0.5,
						["g"] = 0.5,
						["b"] = 1,
					},
					[16] = {
						["a"] = 1,
						["r"] = 0.5,
						["g"] = 1,
						["b"] = 1,
					},
					[64] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 0.5,
						["b"] = 1,
					},
				},
				["unitColoring"] = {
					[32334] = {
						["a"] = 1,
						["r"] = 0.75,
						["g"] = 0.05,
						["b"] = 0.05,
					},
					[2147483648] = {
						["a"] = 1,
						["r"] = 0.75,
						["g"] = 0.75,
						["b"] = 0.75,
					},
					[32558] = {
						["a"] = 1,
						["r"] = 0.75,
						["g"] = 0.05,
						["b"] = 0.05,
					},
					[32078] = {
						["a"] = 1,
						["r"] = 0.75,
						["g"] = 0.05,
						["b"] = 0.05,
					},
					[32542] = {
						["a"] = 1,
						["r"] = 0.34,
						["g"] = 0.64,
						["b"] = 1,
					},
					[17681] = {
						["a"] = 1,
						["r"] = 0.7,
						["g"] = 0.7,
						["b"] = 0.7,
					},
					[12561] = {
						["a"] = 1,
						["r"] = 0.7,
						["g"] = 0.7,
						["b"] = 0.7,
					},
				},
				["highlightedEvents"] = {
					["PARTY_KILL"] = true,
				},
				["defaults"] = {
					["spell"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
					["damage"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 0,
					},
				},
				["eventColoring"] = {
				},
			},
			["hasQuickButton"] = true,
			["settings"] = {
				["abilityHighlighting"] = true,
				["lineColoring"] = true,
				["spellBraces"] = false,
				["sourceColoring"] = true,
				["showHistory"] = true,
				["destColoring"] = true,
				["amountHighlighting"] = true,
				["schoolNameColoring"] = false,
				["abilitySchoolColoring"] = false,
				["sourceBraces"] = true,
				["missColoring"] = true,
				["itemBraces"] = true,
				["abilityColoring"] = false,
				["amountActorColoring"] = false,
				["textMode"] = "A",
				["destBraces"] = true,
				["timestamp"] = false,
				["actionColoring"] = false,
				["fullText"] = false,
				["lineColorPriority"] = 1,
				["lineHighlighting"] = true,
				["abilityActorColoring"] = false,
				["actionHighlighting"] = false,
				["unitBraces"] = true,
				["braces"] = false,
				["schoolNameHighlighting"] = true,
				["unitIcons"] = true,
				["hideBuffs"] = false,
				["unitColoring"] = false,
				["amountSchoolColoring"] = false,
				["amountColoring"] = false,
				["hideDebuffs"] = false,
				["noMeleeSwingColoring"] = false,
				["timestampFormat"] = "%H:%M:%S",
				["schoolNameActorColoring"] = false,
				["actionActorColoring"] = false,
			},
			["filters"] = {
				{
					["sourceFlags"] = {
						[32334] = false,
						[2147483648] = false,
						[32558] = false,
						[32078] = false,
						[32542] = false,
						[17681] = false,
						[12561] = false,
					},
					["eventList"] = {
						["DAMAGE_SPLIT"] = true,
						["UNIT_DISSIPATES"] = true,
						["SPELL_PERIODIC_DAMAGE"] = true,
						["SWING_DAMAGE"] = true,
						["SPELL_DAMAGE"] = true,
						["UNIT_DESTROYED"] = true,
						["RANGE_DAMAGE"] = true,
						["ENVIRONMENTAL_DAMAGE"] = true,
						["SPELL_HEAL"] = true,
						["SPELL_PERIODIC_HEAL"] = true,
						["UNIT_DIED"] = true,
					},
				}, -- [1]
				{
					["destFlags"] = {
						[17681] = true,
						[12561] = false,
					},
					["eventList"] = {
						["SPELL_PERIODIC_MISSED"] = true,
						["SPELL_SUMMON"] = true,
						["SPELL_INTERRUPT"] = true,
						["UNIT_DESTROYED"] = true,
						["SPELL_RESURRECT"] = true,
						["DAMAGE_SHIELD_MISSED"] = true,
						["SPELL_LEECH"] = true,
						["SPELL_AURA_BROKEN"] = true,
						["SPELL_BUILDING_DAMAGE"] = true,
						["SPELL_PERIODIC_ENERGIZE"] = true,
						["DAMAGE_SPLIT"] = true,
						["UNIT_DISSIPATES"] = true,
						["SPELL_INSTAKILL"] = true,
						["SPELL_PERIODIC_DAMAGE"] = true,
						["SPELL_PERIODIC_HEAL"] = true,
						["PARTY_KILL"] = true,
						["SPELL_DAMAGE"] = true,
						["RANGE_DAMAGE"] = true,
						["ENVIRONMENTAL_DAMAGE"] = true,
						["SPELL_DISPEL"] = true,
						["SPELL_EXTRA_ATTACKS"] = true,
						["DAMAGE_SHIELD"] = true,
						["SPELL_STOLEN"] = true,
						["SPELL_ENERGIZE"] = true,
						["UNIT_DIED"] = true,
						["SPELL_AURA_APPLIED"] = true,
						["SWING_MISSED"] = true,
						["ENCHANT_REMOVED"] = true,
						["SPELL_BUILDING_HEAL"] = true,
						["SPELL_DURABILITY_DAMAGE_ALL"] = true,
						["SPELL_AURA_REMOVED_DOSE"] = true,
						["SPELL_CAST_SUCCESS"] = true,
						["SPELL_PERIODIC_LEECH"] = true,
						["SPELL_DURABILITY_DAMAGE"] = true,
						["SPELL_CAST_FAILED"] = true,
						["ENCHANT_APPLIED"] = true,
						["SPELL_DISPEL_FAILED"] = true,
						["SPELL_AURA_REFRESH"] = true,
						["SPELL_AURA_APPLIED_DOSE"] = true,
						["SPELL_AURA_REMOVED"] = true,
						["SWING_DAMAGE"] = true,
						["SPELL_AURA_BROKEN_SPELL"] = true,
						["SPELL_CREATE"] = true,
						["RANGE_MISSED"] = true,
						["SPELL_HEAL"] = true,
						["SPELL_CAST_START"] = true,
						["SPELL_MISSED"] = true,
						["SPELL_PERIODIC_DRAIN"] = true,
						["SPELL_DRAIN"] = true,
					},
				}, -- [2]
			},
		}, -- [2]
	},
}
Blizzard_CombatLog_Filter_Version = 4.3
