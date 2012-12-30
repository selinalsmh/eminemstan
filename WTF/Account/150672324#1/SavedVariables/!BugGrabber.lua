
BugGrabberDB = {
	["lastSanitation"] = 3,
	["session"] = 137,
	["errors"] = {
		{
			["message"] = "SkadaSkin and tooltips\\ilevel.lua:49: attempt to perform arithmetic on local \"ilvlAdd\" (a nil value)",
			["time"] = "2012/11/04 17:22:43",
			["locals"] = "GetPlayerScore = <func> @SkadaSkin and tooltips\\ilevel.lua:40\nunit = \"player\"\nGetQuality = <func> @SkadaSkin and tooltips\\ilevel.lua:59\n",
			["stack"] = "SkadaSkin and tooltips\\ilevel.lua:49: in function <SkadaSkin and tooltips\\ilevel.lua:40>\nSkadaSkin and tooltips\\ilevel.lua:78: in function <SkadaSkin and tooltips\\ilevel.lua:77>\nSkadaSkin and tooltips\\ilevel.lua:101: in function <SkadaSkin and tooltips\\ilevel.lua:94>\n<in C code>\n<in C code>\n<in C code>\n<in C code>\nFrameXML\\UnitFrame.lua:224: in function \"UnitFrame_UpdateTooltip\"\nFrameXML\\UnitFrame.lua:211: in function \"UnitFrame_OnEnter\"\noUF_Qulight-0.1 beta\\lib.lua:531: in function <oUF_Qulight\\lib.lua:530>",
			["session"] = 1,
			["counter"] = 7,
		}, -- [1]
		{
			["message"] = "SkadaSkin and tooltips\\Tooltips.lua:213: attempt to index a nil value",
			["time"] = "2012/11/04 17:44:34",
			["locals"] = "(*temporary) = <func> =[C]:-1\n = <func> =[C]:-1\n = <func> @SkadaSkin and tooltips\\Tooltips.lua:186\n",
			["stack"] = "SkadaSkin and tooltips\\Tooltips.lua:213: in function <SkadaSkin and tooltips\\Tooltips.lua:186>\n<in C code>",
			["session"] = 5,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "aMini-2.0\\idQuestAutomation.lua:107: Invalid reward choice in GetQuestReward([choice])",
			["time"] = "2012/11/05 22:59:27",
			["locals"] = "self = <unnamed> {\n 0 = <userdata>\n canAutomate = <func> @aMini\\idQuestAutomation.lua:5\n completed_quests = <table> {}\n incomplete_quests = <table> {}\n onevent = <func> @aMini\\idQuestAutomation.lua:111\n QUEST_DETAIL = <func> @aMini\\idQuestAutomation.lua:99\n QUEST_PROGRESS = <func> @aMini\\idQuestAutomation.lua:23\n strip_text = <func> @aMini\\idQuestAutomation.lua:13\n QUEST_COMPLETE = <func> @aMini\\idQuestAutomation.lua:104\n GOSSIP_SHOW = <func> @aMini\\idQuestAutomation.lua:59\n QUEST_GREETING = <func> @aMini\\idQuestAutomation.lua:80\n QUEST_LOG_UPDATE = <func> @aMini\\idQuestAutomation.lua:30\n}\nevent = nil\n",
			["stack"] = "<in C code>\naMini-2.0\\idQuestAutomation.lua:107: in function \"?\"\naMini-2.0\\idQuestAutomation.lua:113: in function <aMini\\idQuestAutomation.lua:111>",
			["session"] = 31,
			["counter"] = 12,
		}, -- [3]
		{
			["message"] = "MicroMenu\\MicroMenu-1.4-3.lua:458: script ran too long",
			["time"] = "2012/11/07 01:25:03",
			["locals"] = "",
			["stack"] = "MicroMenu\\MicroMenu-1.4-3.lua:458: in function <MicroMenu\\MicroMenu.lua:450>",
			["session"] = 33,
			["counter"] = 1,
		}, -- [4]
		{
			["message"] = "Blizzard_AchievementUI\\Blizzard_AchievementUI-1.0.lua:2388: script ran too long",
			["time"] = "2012/11/09 00:22:07",
			["locals"] = "button = AchievementFrameCategoriesContainerButton7 {\n 0 = <userdata>\n label = AchievementFrameCategoriesContainerButton7Label {}\n numCompleted = 102\n numCompletedText = \"102/184\"\n element = <table> {}\n flags = 0\n categoryID = 169\n parentID = true\n showTooltipFunc = <func> @..\\Blizzard_AchievementUI.lua:555\n background = AchievementFrameCategoriesContainerButton7Background {}\n numAchievements = 184\n name = \"专业\"\n}\nelement = <table> {\n parent = true\n collapsed = true\n id = 169\n}\ncategoryName = \"专业\"\nparentID = -1\nflags = 0\nnumAchievements = nil\nnumCompleted = nil\nid = 169\nIN_GUILD_VIEW = nil\nFEAT_OF_STRENGTH_ID = 81\nGUILD_FEAT_OF_STRENGTH_ID = 15093\n",
			["stack"] = "Blizzard_AchievementUI\\Blizzard_AchievementUI-1.0.lua:2388: in function \"AchievementFrame_GetCategoryTotalNumAchievements\"\nBlizzard_AchievementUI\\Blizzard_AchievementUI-1.0.lua:528: in function \"AchievementFrameCategories_DisplayButton\"\nBlizzard_AchievementUI\\Blizzard_AchievementUI-1.0.lua:382: in function \"Hide\"\nFrameXML\\HybridScrollFrame.lua:108: in function \"HybridScrollFrame_Update\"\nBlizzard_AchievementUI\\Blizzard_AchievementUI-1.0.lua:492: in function \"AchievementFrameCategories_Update\"\nBlizzard_AchievementUI\\Blizzard_AchievementUI-1.0.lua:273: in function \"AchievementFrameTab_OnClick\"\nBlizzard_AchievementUI\\Blizzard_AchievementUI-1.0.lua:97: in function \"AchievementFrame_ToggleAchievementFrame\"\nFrameXML\\UIParent.lua:468: in function \"ToggleAchievementFrame\"\nMicroMenu\\MicroMenu-1.4-3.lua:714: in function <MicroMenu\\MicroMenu.lua:713>",
			["session"] = 41,
			["counter"] = 1,
		}, -- [5]
		{
			["message"] = "FrameXML\\UIParent.lua:2179: script ran too long",
			["time"] = "2012/11/09 00:34:39",
			["locals"] = "toggleStatFrame = nil\n",
			["stack"] = "FrameXML\\UIParent.lua:2179: in function \"ShowUIPanel\"\nBlizzard_AchievementUI\\Blizzard_AchievementUI-1.0.lua:96: in function \"AchievementFrame_ToggleAchievementFrame\"\nFrameXML\\UIParent.lua:468: in function \"ToggleAchievementFrame\"\nMicroMenu\\MicroMenu-1.4-3.lua:714: in function <MicroMenu\\MicroMenu.lua:713>",
			["session"] = 49,
			["counter"] = 2,
		}, -- [6]
		{
			["message"] = "dct\\DCT.lua:1239: attempt to concatenate local \"ms\" (a nil value)",
			["time"] = "2012/11/11 19:10:57",
			["locals"] = "showType = \"DCTD_SHOWMISS_PET\"\nshowId = 1\ncrit = false\nsaveP = <table> {\n DCTD_SSC_SpellSchool = 0\n DCTD_SHOWAOEHEAL = <table> {}\n DCTD_SHOWPERIODIC = <table> {}\n DCTD_SHOWHEAL = <table> {}\n DCTD_SHOWINTERRUPT = <table> {}\n DCTD_SHOWHIT = <table> {}\n DCTD_SHOWSPELLCRIT_PET = <table> {}\n DCTD_SHOWMISS_PET = <table> {}\n DCTD_SHOWSPELL_PET = <table> {}\n DCTD_CritScale = 0\n DCTD_AvgMulitHit = 0\n DCTD_SHOWHIT_PET = <table> {}\n DCTD_SSC_Number = 0\n DCTD_SHOWCOMBOHIT = <table> {}\n DCTD_SHOWSPELLCRIT = <table> {}\n DCTD_SHOWHITCRIT = <table> {}\n DCTD_SHOWPERIODIC_PET = <table> {}\n DCTD_SHOWPERIODICHEAL = <table> {}\n DCTD_SSC_Spell = 0\n DCTD_SHOWMISS = <table> {}\n DCTD_SHOWHEALCRIT = <table> {}\n DCTD_SHOWSHIELD = <table> {}\n DCTD_SHOWSPELL = <table> {}\n DCTD_ENABLE = 1\n DCTD_SHOWHITCRIT_PET = <table> {}\n DCTD_SHOWCOMBOHITCRIT = <table> {}\n DCTD_SHOWINTERRUPT_PET = <table> {}\n DCTD_SHOWAOE = <table> {}\n}\nobj = nil\np = <table> {\n show = <table> {}\n frame = 9\n colorEx = <table> {}\n color = <table> {}\n}\n(*temporary) = <func> @dct\\DCT_aniframe.lua:94\n(*temporary) = 9\n",
			["stack"] = "dct\\DCT.lua:1239: in function \"DCT_Format\"\ndct\\DCT.lua:591: in function <dct\\DCT.lua:580>\n(tail call): ?\ndct_damage\\dctd.lua:286: in function \"DCTD_ProcCombatUnfiltered\"\ndct\\DCT.lua:1148: in function \"func\"\n<string>:\"*:OnEvent\":4: in function <string>:\"*:OnEvent\":1",
			["session"] = 54,
			["counter"] = 1,
		}, -- [7]
		{
			["message"] = "Blizzard_AchievementUI\\Blizzard_AchievementUI-1.0.lua:329: script ran too long",
			["time"] = "2012/11/11 20:20:49",
			["locals"] = "id = 1\nisSummary = true\nswappedView = false\nIN_GUILD_VIEW = nil\nachievementFunctions = <table> {\n selectedCategory = \"summary\"\n updateFunc = <func> @..\\Blizzard_AchievementUI.lua:825\n categoryAccessor = <func> =[C]:-1\n clearFunc = <func> @..\\Blizzard_AchievementUI.lua:899\n}\n",
			["stack"] = "Blizzard_AchievementUI\\Blizzard_AchievementUI-1.0.lua:329: in function \"AchievementFrame_ShowSubFrame\"\nBlizzard_AchievementUI\\Blizzard_AchievementUI-1.0.lua:233: in function \"AchievementFrameTab_OnClick\"\nBlizzard_AchievementUI\\Blizzard_AchievementUI-1.0.lua:97: in function \"AchievementFrame_ToggleAchievementFrame\"\nFrameXML\\UIParent.lua:468: in function \"ToggleAchievementFrame\"\nMicroMenu\\MicroMenu-1.4-3.lua:714: in function <MicroMenu\\MicroMenu.lua:713>",
			["session"] = 54,
			["counter"] = 1,
		}, -- [8]
		{
			["message"] = "oUF_Freebgrid-6.9.3\\freebgrid.lua:838: script ran too long",
			["time"] = "2012/11/13 23:52:45",
			["locals"] = "(*temporary) = InterfaceOptionsFrame {\n 0 = <userdata>\n numTabs = 2\n selectedTab = 1\n}\n(*temporary) = <func> =[C]:-1\n",
			["stack"] = "oUF_Freebgrid-6.9.3\\freebgrid.lua:838: in function <oUF_Freebgrid\\freebgrid.lua:835>\n<in C code>\nFrameXML\\UIParent.lua:1738: in function \"SetUIPanel\"\nFrameXML\\UIParent.lua:1543: in function \"ShowUIPanel\"\nFrameXML\\UIParent.lua:1469: in function <FrameXML\\UIParent.lua:1465>\n<in C code>\nFrameXML\\UIParent.lua:2179: in function \"ShowUIPanel\"\n<string>:\"*:OnClick\":2: in function <string>:\"*:OnClick\":1",
			["session"] = 63,
			["counter"] = 1,
		}, -- [9]
		{
			["message"] = "DBM-Core\\DBM-Core.lua:1768: script ran too long",
			["time"] = "2012/11/17 14:15:12",
			["locals"] = "self = <unnamed> {\n 0 = <userdata>\n}\nelapsed = 0.041000001132488\ntime = 98542.797\nnextTask = <table> {\n 1 = <table> {}\n func = <func> @..\\DBM-Core.lua:1740\n 2 = <table> {}\n time = 98542.773\n next = <table> {}\n}\ngetMin = <func> @..\\DBM-Core.lua:639\ndeleteMin = <func> @..\\DBM-Core.lua:681\npushCachedTable = <func> @..\\DBM-Core.lua:618\npairs = <func> =[C]:-1\nupdateFunctions = <table> {}\nLastZoneText = \"恐惧之心\"\nLastZoneMapID = 897\nnext = <func> =[C]:-1\nmodSyncSpam = <table> {}\n",
			["stack"] = "DBM-Core\\DBM-Core.lua:1768: in function \"func\"\nDBM-Core\\DBM-Core.lua:729: in function <DBM-Core\\DBM-Core.lua:722>",
			["session"] = 82,
			["counter"] = 1,
		}, -- [10]
		{
			["message"] = "oUF_Qulight-0.1 beta\\castbar.lua:90: attempt to perform arithmetic on field \"sendTime\" (a nil value)",
			["time"] = "2012/11/19 16:15:29",
			["locals"] = "self = oUF_Player {\n 0 = <userdata>\n UNIT_PORTRAIT_UPDATE = <func> @oUF\\elements\\portraits.lua:75\n Combat = <unnamed> {}\n PARTY_LOOT_METHOD_CHANGED = <func> @oUF\\elements\\masterlooter.lua:73\n PLAYER_ENTERING_WORLD = <func> @oUF\\ouf.lua:149\n Leader = <unnamed> {}\n UNIT_SPELLCAST_CHANNEL_START = <func> @oUF\\elements\\castbar.lua:256\n Resting = <unnamed> {}\n RUNE_TYPE_UPDATE = <func> @oUF\\elements\\runebar.lua:65\n UNIT_HEALTH_FREQUENT = <func> @oUF\\elements\\health.lua:145\n UNIT_MAXHEALTH = <func> @oUF\\elements\\health.lua:145\n __elements = <table> {}\n UNIT_POWER_FREQUENT = <func> @oUF\\elements\\power.lua:189\n Castbar = oUF_Castbarplayer {}\n UNIT_POWER_BAR_SHOW = <func> @oUF\\elements\\power.lua:189\n UNIT_SPELLCAST_NOT_INTERRUPTIBLE = <func> @oUF\\elements\\castbar.lua:204\n PLAYER_REGEN_DISABLED = <func> @oUF\\elements\\combat.lua:52\n UNIT_SPELLCAST_DELAYED = <func> @oUF\\elements\\castbar.lua:218\n Health = <unnamed> {}\n PLAYER_REGEN_ENABLED = <func> @oUF\\elements\\combat.lua:52\n UNIT_SPELLCAST_CHANNEL_STOP = <func> @oUF\\elements\\castbar.lua:332\n RUNE_POWER_UPDATE = <func> @oUF\\elements\\runebar.lua:78\n UNIT_EXITED_VEHICLE = <func> @oUF\\ouf.lua:38\n UNIT_SPELLCAST_CHANNEL_UPDATE = <func> @oUF\\elements\\castbar.lua:309\n UNIT_CONNECTION = <table> {}\n Debuffs = <unnamed> {}\n Portrait = <unnamed> {}\n SmoothBar = <func> @oUF_Qulight\\Plugins\\Smooth.lua:15\n UNIT_SPELLCAST_INTERRUPTIBLE = <func> @oUF\\elements\\castbar.lua:190\n UNIT_SPELLCAST_INTERRUPTED = <func> @oUF\\elements\\castbar.lua:172\n UNIT_SPELLCAST_START = <func> @oUF\\elements\\castbar.lua:104\n unit = \"player\"\n GROUP_ROSTER_UPDATE = <table> {}\n UNIT_SPELLCAST_STOP = <func> @oUF\\elements\\castbar.lua:238\n UNIT_SPELLCAST_FAILED = <func> @oUF\\elements\\castbar.lua:154\n PARTY_LEADER_CHANGED = <func> @oUF\\elements\\leader.lua:53\n PLAYER_UPDATE_RESTING = <func> @oUF\\elements\\resting.lua:52\n RaidIcon = <unnamed> {}\n UNIT_AURA = <func> @oUF\\elements\\aura.lua:314\n RAID_TARGET_UPDATE = <func> @oUF\\elements\\ricons.lua:58\n Runes = <unnamed> {}\n MasterLooter = <unnamed> {}\n __tags = <table> {}\n Assistant = <unnamed> {}\n UNIT_MAXPOWER = <func> @oUF\\elements\\power.lua:189\n Highlight = <unnamed> {}\n UNIT_FACTION = <table> {}\n UNIT_ENTERED_VEHICLE = <func> @oUF\\ouf.lua:38\n mystyle = \"player\"\n UNIT_SPELLCAST_SENT = <func> @oUF_Qulight\\castbar.lua:78\n menu = <func> @oUF_Qulight\\lib.lua:228\n UNIT_DISPLAYPOWER = <func> @oUF\\elements\\power.lua:189\n style = \"Player\"\n UNIT_POWER_BAR_HIDE = <func> @oUF\\elements\\power.lua:189\n Power = <unnamed> {}\n UNIT_MODEL_CHANGED = <func> @oUF\\elements\\portraits.lua:75\n}\nevent = \"UNIT_SPELLCAST_START\"\nunit = \"player\"\nspell = \"收割魔古南瓜\"\ncastbar = oUF_Castbarplayer {\n 0 = <userdata>\n PostCastStop = <func> @oUF_Qulight\\castbar.lua:107\n CastingColor = <table> {}\n ChannelingColor = <table> {}\n Time = <unnamed> {}\n interrupt = false\n casting = true\n delay = 0\n OnUpdate = <func> @oUF_Qulight\\castbar.lua:44\n duration = 4.5474735088646e-013\n FailColor = <table> {}\n castid = 0\n CompleteColor = <table> {}\n SafeZon",
			["stack"] = "oUF_Qulight-0.1 beta\\castbar.lua:90: in function \"PostCastStart\"\noUF-1.6.0\\elements\\castbar.lua:149: in function \"?\"\noUF-1.6.0\\events.lua:69: in function <oUF\\events.lua:62>",
			["session"] = 95,
			["counter"] = 17,
		}, -- [11]
		{
			["message"] = "aMini-2.0\\AutoRepair.lua:8: attempt to perform arithmetic on a nil value",
			["time"] = "2012/11/08 21:43:28",
			["locals"] = "",
			["stack"] = "aMini-2.0\\AutoRepair.lua:8: in function <aMini\\AutoRepair.lua:2>",
			["session"] = 128,
			["counter"] = 4,
		}, -- [12]
		{
			["message"] = "FreebTip-2.4\\tip.lua:363: attempt to concatenate a nil value",
			["time"] = "2012/11/22 22:07:19",
			["locals"] = "(*temporary) = <func> =[C]:-1\n = <func> =[C]:-1\n = <func> @FreebTip\\tip.lua:302\n",
			["stack"] = "FreebTip-2.4\\tip.lua:363: in function <FreebTip\\tip.lua:302>\n<in C code>\nTradeSkillMaster-v1.5.10\\Libs\\LibExtraTip\\LibExtraTip.lua:335: in function <TradeSkillMaster\\Libs\\LibExtraTip\\LibExtraTip.lua:329>\n<in C code>\nTradeSkillMaster-v1.5.10\\Libs\\LibExtraTip\\LibExtraTip.lua:290: in function \"SetUnit\"\nFrameXML\\UnitFrame.lua:224: in function \"UnitFrame_UpdateTooltip\"\nFrameXML\\UnitFrame.lua:211: in function \"UnitFrame_OnEnter\"\noUF_Freebgrid-6.9.3\\freebgrid.lua:391: in function <oUF_Freebgrid\\freebgrid.lua:389>",
			["session"] = 134,
			["counter"] = 5,
		}, -- [13]
		{
			["message"] = "FrameXML\\WorldMapFrame.lua:1535: attempt to concatenate a nil value",
			["time"] = "2012/11/26 20:55:06",
			["locals"] = "self = WorldMapRaid15 {\n 0 = <userdata>\n icon = WorldMapRaid15Icon {}\n unit = \"raid16\"\n}\nmotion = true\n",
			["stack"] = "FrameXML\\WorldMapFrame.lua:1535: in function \"WorldMapUnit_OnEnter\"\n<string>:\"*:OnEnter\":1: in function <string>:\"*:OnEnter\":1",
			["session"] = 137,
			["counter"] = 1,
		}, -- [14]
	},
}
