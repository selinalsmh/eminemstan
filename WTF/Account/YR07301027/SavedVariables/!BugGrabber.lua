
BugGrabberDB = {
	["lastSanitation"] = 3,
	["session"] = 321,
	["errors"] = {
		{
			["message"] = "DBM-Core\\DBM-Core-4.11.4.lua:1079: ItemRefTooltip:SetHyperlink(): Unknown link type",
			["time"] = "2012/11/04 17:20:55",
			["locals"] = "self = ItemRefTooltip {\n 0 = <userdata>\n shadow = <unnamed> {}\n updateTooltip = 0.2\n SetHyperlink = <func> @..\\DBM-Core.lua:1075\n UpdateTooltip = <func> *:OnLoad:5\n bd = <unnamed> {}\n border = <unnamed> {}\n shoppingTooltips = <table> {}\n}\nlink = \"buggrabber:岚黯:28B84128\"\nold = <func> =[C]:-1\n",
			["stack"] = "<in C code>\nDBM-Core\\DBM-Core-4.11.4.lua:1079: in function \"SetHyperlink\"\nFrameXML\\ItemRef.lua:238: in function <FrameXML\\ItemRef.lua:2>\n<in C code>\nBlizzard_CombatLog\\Blizzard_CombatLog.lua:3622: in function \"SetItemRef\"\nFrameXML\\ChatFrame.lua:3372: in function <FrameXML\\ChatFrame.lua:3371>\n(tail call): ?\n<string>:\"*:OnHyperlinkClick\":1: in function <string>:\"*:OnHyperlinkClick\":1\n<in C code>",
			["session"] = 1,
			["counter"] = 15,
		}, -- [1]
		{
			["message"] = "SkadaSkin and tooltips\\ilevel.lua:49: attempt to perform arithmetic on local \"ilvlAdd\" (a nil value)",
			["time"] = "2012/11/04 17:20:29",
			["locals"] = "GetPlayerScore = <func> @SkadaSkin and tooltips\\ilevel.lua:40\nunit = \"player\"\nGetQuality = <func> @SkadaSkin and tooltips\\ilevel.lua:59\n",
			["stack"] = "SkadaSkin and tooltips\\ilevel.lua:49: in function <SkadaSkin and tooltips\\ilevel.lua:40>\nSkadaSkin and tooltips\\ilevel.lua:78: in function <SkadaSkin and tooltips\\ilevel.lua:77>\nSkadaSkin and tooltips\\ilevel.lua:101: in function <SkadaSkin and tooltips\\ilevel.lua:94>\n<in C code>\n<in C code>\n<in C code>\n<in C code>\nFrameXML\\UnitFrame.lua:224: in function \"UnitFrame_UpdateTooltip\"\nFrameXML\\UnitFrame.lua:211: in function \"UnitFrame_OnEnter\"\noUF_Qulight-0.1 beta\\lib.lua:531: in function <oUF_Qulight\\lib.lua:530>",
			["session"] = 1,
			["counter"] = 13,
		}, -- [2]
		{
			["message"] = "oUF_Freebgrid-6.9.3\\oUF\\elements\\tags.lua:575: <unnamed>:SetFormattedText(): Font not set",
			["time"] = "2012/11/04 19:28:14",
			["locals"] = "self = <unnamed> {\n 0 = <userdata>\n UpdateTag = <func> @oUF_Freebgrid\\oUF\\elements\\tags.lua:567\n frequentUpdates = 1\n parent = Raid_FreebgridUnitButton1 {}\n}\nparent = Raid_FreebgridUnitButton1 {\n 0 = <userdata>\n Highlight = <unnamed> {}\n PARTY_LOOT_METHOD_CHANGED = <func> @oUF_Freebgrid\\oUF\\elements\\masterlooter.lua:73\n UNIT_MAXPOWER = <func> @oUF_Freebgrid\\oUF\\elements\\power.lua:189\n Range = false\n Healtext = <unnamed> {}\n UNIT_MAXHEALTH = <table> {}\n UNIT_POWER_BAR_SHOW = <func> @oUF_Freebgrid\\oUF\\elements\\power.lua:189\n myHealPredictionBar = <unnamed> {}\n style = \"Freebgrid\"\n AuraStatusBR = <unnamed> {}\n UNIT_EXITED_VEHICLE = <func> @oUF_Freebgrid\\oUF\\ouf.lua:38\n UNIT_CONNECTION = <table> {}\n UNIT_POWER = <func> @oUF_Freebgrid\\oUF\\elements\\power.lua:189\n unit = \"player\"\n PLAYER_FOCUS_CHANGED = <func> @oUF_Freebgrid\\freebgrid.lua:124\n FocusHighlight = <unnamed> {}\n UNIT_AURA = <func> @oUF_Freebgrid\\elements\\auras.lua:211\n Threat = <unnamed> {}\n freebAuras = <unnamed> {}\n freebHeals = true\n Name = <unnamed> {}\n freebIndicators = true\n otherHealPredictionBar = <unnamed> {}\n IsFreebgrid = true\n __tags = <table> {}\n PLAYER_ENTERING_WORLD = <func> @oUF_Freebgrid\\oUF\\ouf.lua:149\n Leader = <unnamed> {}\n UnwrapScript = <func> @FrameXML\\SecureHandlers.lua:710\n UNIT_PET = <func> @oUF_Freebgrid\\oUF\\ouf.lua:175\n UNIT_HEALTH_FREQUENT = <func> @oUF_Freebgrid\\oUF\\elements\\health.lua:145\n __elements = <table> {}\n freebarrow = <unnamed> {}\n freebRange = <table> {}\n Power = <unnamed> {}\n UNIT_DISPLAYPOWER = <func> @oUF_Freebgrid\\oUF\\elements\\power.lua:189\n UNIT_THREAT_SITUATION_UPDATE = <func> @oUF_Freebgrid\\oUF\\elements\\threat.lua:59\n READY_CHECK = <func> @oUF_Freebgrid\\oUF\\elements\\readycheck.lua:126\n UNIT_HEALTH = <func> @oUF_Freebgrid\\elements\\heals.lua:97\n READY_CHECK_CONFIRM = <func> @oUF_Freebgrid\\oUF\\elements\\readycheck.lua:126\n Execute = <func> @FrameXML\\SecureHandlers.lua:699\n freebAfk = true\n AuraStatusCen = <unnamed> {}\n GROUP_ROSTER_UPDATE = <table> {}\n Health = <unnamed> {}\n SetFrameRef = <func> @FrameXML\\SecureHandlers.lua:715\n PARTY_LEADER_CHANGED = <func> @oUF_Freebgrid\\oUF\\elements\\leader.lua:53\n MasterLooter = <unnamed> {}\n RaidIcon = <unnamed> {}\n PLAYER_TARGET_CHANGED = <func> @oUF_Freebgrid\\freebgrid.lua:115\n AuraStatusBL = <unnamed> {}\n LFDRole = <unnamed> {}\n WrapScript = <func> @FrameXML\\SecureHandlers.lua:704\n READY_CHECK_FINISHED = <func> @oUF_Freebgrid\\oUF\\elements\\readycheck.lua:126\n Assistant = <unnamed> {}\n UNIT_ENTERED_VEHICLE = <func> @oUF_Freebgrid\\oUF\\ouf.lua:38\n TargetBorder = <unnamed> {}\n AuraStatusTR = <unnamed> {}\n AuraStatusTL = <unnamed> {}\n UNIT_HEAL_PREDICTION = <func> @oUF_Freebgrid\\elements\\heals.lua:97\n menu = <func> @oUF_Freebgrid\\freebgrid.lua:62\n RAID_TARGET_UPDATE = <func> @oUF_Freebgrid\\oUF\\elements\\ricons.lua:58\n AFKtext = <unnamed> {}\n UNIT_POWER_BAR_HIDE = <func> @oUF_Freebgrid\\oUF\\elements\\power.lua:189\n UNIT_FACTION = <table> {}\n ReadyCheck = <unnamed> {}\n}\nrealUnit = nil\n_ENV = <table> {\n Hex = <func> @oUF_Freebgrid\\oUF\\elements\\tags.lua:11\n ColorGradient = <func> @oUF_Freebgrid\\oUF\\colors.lua:45\n _COLORS = <table> {}\n _TAGS = <table> {}\n}\nformat = \"%s\"\nargs = <table> {\n 1 = <function> ",
			["stack"] = "<in C code>\noUF_Freebgrid-6.9.3\\oUF\\elements\\tags.lua:575: in function \"UpdateTag\"\noUF_Freebgrid-6.9.3\\oUF\\elements\\tags.lua:441: in function \"func\"\noUF_Freebgrid-6.9.3\\oUF\\ouf-1.6.0.lua:158: in function \"UpdateAllElements\"\noUF_Freebgrid-6.9.3\\oUF\\ouf-1.6.0.lua:58: in function <oUF_Freebgrid\\oUF\\ouf.lua:38>\noUF_Freebgrid-6.9.3\\oUF\\ouf-1.6.0.lua:81: in function <oUF_Freebgrid\\oUF\\ouf.lua:74>\n<in C code>\nFrameXML\\SecureGroupHeaders.lua:195: in function <FrameXML\\SecureGroupHeaders.lua:115>\nFrameXML\\SecureGroupHeaders.lua:458: in function <FrameXML\\SecureGroupHeaders.lua:382>\n<in C code>\nFrameXML\\SecureStateDriver.lua:100: in function <FrameXML\\SecureStateDriver.lua:95>\nFrameXML\\SecureStateDriver.lua:164: in function <FrameXML\\SecureStateDriver.lua:146>\n<in C code>\nFrameXML\\SecureStateDriver.lua:11: in function \"RegisterAttributeDriver\"\noUF_Freebgrid-6.9.3\\oUF\\ouf-1.6.0.lua:533: in function \"SpawnHeader\"\noUF_Freebgrid-6.9.3\\freebgrid.lua:666: in function <oUF_Freebgrid\\freebgrid.lua:596>\noUF_Freebgrid-6.9.3\\freebgrid.lua:707: in function \"func\"\noUF_Freebgrid-6.9.3\\oUF\\factory.lua:20: in function <oUF_Freebgrid\\oUF\\factory.lua:16>\n(tail call): ?",
			["session"] = 8,
			["counter"] = 90,
		}, -- [3]
		{
			["message"] = "DBM-Core\\DBM-Core-4.11.4.lua:1757: script ran too long",
			["time"] = "2012/11/04 20:55:13",
			["locals"] = "self = <unnamed> {\n 0 = <userdata>\n}\nelapsed = 0.016000000759959\ntime = 82261.628\nnextTask = <table> {\n 1 = <table> {}\n func = <func> @..\\DBM-Core.lua:1729\n 2 = <table> {}\n time = 82261.627\n next = <table> {}\n}\ngetMin = <func> @..\\DBM-Core.lua:638\ndeleteMin = <func> @..\\DBM-Core.lua:680\npushCachedTable = <func> @..\\DBM-Core.lua:617\npairs = <func> =[C]:-1\nupdateFunctions = <table> {}\nLastZoneText = \"魔古山宝库\"\nLastZoneMapID = 896\nnext = <func> =[C]:-1\nmodSyncSpam = <table> {}\n",
			["stack"] = "DBM-Core\\DBM-Core-4.11.4.lua:1757: in function \"func\"\nDBM-Core\\DBM-Core-4.11.4.lua:728: in function <DBM-Core\\DBM-Core.lua:721>",
			["session"] = 15,
			["counter"] = 1,
		}, -- [4]
		{
			["message"] = "oUF_Freebgrid-6.9.3\\db.lua:497: attempt to index field \"?\" (a nil value)",
			["time"] = "2012/11/05 22:28:28",
			["locals"] = "tree = \"Talent\"NONE\"\"\nADDON_NAME = \"oUF_Freebgrid\"\nns = <table> {\n movableopt = <unnamed> {}\n defaults = <table> {}\n _Headers = <table> {}\n numberize = <func> @oUF_Freebgrid\\tags.lua:27\n auras = <table> {}\n hex = <func> @oUF_Freebgrid\\freebgrid.lua:53\n FlushDB = <func> @oUF_Freebgrid\\db.lua:541\n UpdateHealth = <func> @oUF_Freebgrid\\freebgrid.lua:266\n Anchors = <func> @oUF_Freebgrid\\movable.lua:171\n InitDB = <func> @oUF_Freebgrid\\db.lua:504\n UpdateName = <func> @oUF_Freebgrid\\freebgrid.lua:195\n ACTIVE_TALENT_GROUP_CHANGED = <func> @oUF_Freebgrid\\freebgrid.lua:858\n scaleRaid = <func> @oUF_Freebgrid\\freebgrid.lua:17\n PLAYER_LOGIN = <func> @oUF_Freebgrid\\freebgrid.lua:829\n UnregisterEvents = <func> @oUF_Freebgrid\\events.lua:7\n nameCache = <table> {}\n db = <table> {}\n TalentTree = \"Talent\"NONE\"\"\n arrow = <func> @oUF_Freebgrid\\elements\\range.lua:96\n classIndicators = <table> {}\n debuffColor = <table> {}\n PLAYER_LOGOUT = <func> @oUF_Freebgrid\\freebgrid.lua:846\n RegisterEvents = <func> @oUF_Freebgrid\\events.lua:6\n Movable = <func> @oUF_Freebgrid\\movable.lua:479\n RegisterEvent = <func> @oUF_Freebgrid\\events.lua:6\n UpdatePower = <func> @oUF_Freebgrid\\freebgrid.lua:372\n ClickSetDefault = <func> @oUF_Freebgrid\\db.lua:477\n Slash = <func> @oUF_Freebgrid\\freebgrid.lua:868\n fonts = <table> {}\n UnregisterEvent = <func> @oUF_Freebgrid\\events.lua:7\n textures = <table> {}\n colorCache = <table> {}\n _Objects = <table> {}\n Colors = <func> @oUF_Freebgrid\\freebgrid.lua:638\n mediapath = \"oUF_Freebgrid\\media\\\"\n RegisterClicks = <func> @oUF_Freebgrid\\freebgrid.lua:446\n}\nGetTalentSpec = <func> @oUF_Freebgrid\\db.lua:471\n",
			["stack"] = "oUF_Freebgrid-6.9.3\\db.lua:497: in function \"ClickSetDefault\"\noUF_Freebgrid-6.9.3\\db.lua:529: in function \"InitDB\"\noUF_Freebgrid-6.9.3\\freebgrid.lua:745: in function \"func\"\noUF-1.6.0\\factory.lua:20: in function <oUF\\factory.lua:16>\n(tail call): ?",
			["session"] = 90,
			["counter"] = 26,
		}, -- [5]
		{
			["message"] = "aMini-2.0\\AutoRepair.lua:8: attempt to perform arithmetic on a nil value",
			["time"] = "2012/11/18 19:14:08",
			["locals"] = "",
			["stack"] = "aMini-2.0\\AutoRepair.lua:8: in function <aMini\\AutoRepair.lua:2>",
			["session"] = 145,
			["counter"] = 1,
		}, -- [6]
		{
			["message"] = "DBM-Core\\DBM-Core.lua:1090: ItemRefTooltip:SetHyperlink(): Unknown link type",
			["time"] = "2012/11/18 19:14:12",
			["locals"] = "self = ItemRefTooltip {\n 0 = <userdata>\n updateTooltip = 0.2\n SetHyperlink = <func> @..\\DBM-Core.lua:1086\n UpdateTooltip = <func> *:OnLoad:5\n shoppingTooltips = <table> {}\n}\nlink = \"buggrabber:岚黯:00000000305A95F0\"\nold = <func> =[C]:-1\n",
			["stack"] = "<in C code>\nDBM-Core\\DBM-Core.lua:1090: in function \"SetHyperlink\"\nFrameXML\\ItemRef.lua:238: in function <FrameXML\\ItemRef.lua:2>\n(tail call): ?\n<in C code>\naMini-2.0\\damagemeters.lua:121: in function <aMini\\damagemeters.lua:100>\nBlizzard_CombatLog\\Blizzard_CombatLog.lua:3622: in function \"SetItemRef\"\nFrameXML\\ChatFrame.lua:3372: in function <FrameXML\\ChatFrame.lua:3371>\n<in C code>\n!BugGrabber-r186\\BugGrabber.lua:412: in function \"ChatFrame_OnHyperlinkShow\"\n<string>:\"*:OnHyperlinkClick\":1: in function <string>:\"*:OnHyperlinkClick\":1\n<in C code>",
			["session"] = 145,
			["counter"] = 4,
		}, -- [7]
		{
			["message"] = "AlreadyKnown\\BlackMarket.lua:24: attempt to index global \"scrollFrame\" (a nil value)",
			["time"] = "2012/11/20 13:09:36",
			["locals"] = "(*temporary) = <func> =[C]:-1\n = <func> @..\\Blizzard_BlackMarketUI.lua:131\n = <func> @AlreadyKnown\\BlackMarket.lua:21\n",
			["stack"] = "AlreadyKnown\\BlackMarket.lua:24: in function <AlreadyKnown\\BlackMarket.lua:21>\n<in C code>\nBlizzard_BlackMarketUI\\Blizzard_BlackMarketUI.lua:48: in function <Blizzard_BlackMarketUI\\Blizzard_BlackMarketUI.lua:45>",
			["session"] = 174,
			["counter"] = 8,
		}, -- [8]
		{
			["message"] = "FreebTip-2.4\\tip.lua:363: attempt to concatenate a nil value",
			["time"] = "2012/11/21 22:28:22",
			["locals"] = "(*temporary) = <func> =[C]:-1\n = <func> =[C]:-1\n = <func> @FreebTip\\tip.lua:302\n",
			["stack"] = "FreebTip-2.4\\tip.lua:363: in function <FreebTip\\tip.lua:302>\n<in C code>\nTradeSkillMaster-v1.5.10\\Libs\\LibExtraTip\\LibExtraTip.lua:335: in function <TradeSkillMaster\\Libs\\LibExtraTip\\LibExtraTip.lua:329>\n<in C code>\nTradeSkillMaster-v1.5.10\\Libs\\LibExtraTip\\LibExtraTip.lua:290: in function \"SetUnit\"\nFrameXML\\UnitFrame.lua:224: in function \"UnitFrame_UpdateTooltip\"\nFrameXML\\UnitFrame.lua:211: in function \"UnitFrame_OnEnter\"\noUF_Freebgrid-6.9.3\\freebgrid.lua:391: in function <oUF_Freebgrid\\freebgrid.lua:389>",
			["session"] = 193,
			["counter"] = 1,
		}, -- [9]
		{
			["message"] = "DBM-Core\\DBM-Core.lua:1747: script ran too long",
			["time"] = "2012/11/26 17:03:55",
			["locals"] = "self = <unnamed> {\n 0 = <userdata>\n}\nelapsed = 0.014000000432134\ntime = 3593.163\nnextTask = <table> {\n 1 = <table> {}\n func = <func> @..\\DBM-Core.lua:1740\n 2 = <table> {}\n time = 3593.153\n next = <table> {}\n}\ngetMin = <func> @..\\DBM-Core.lua:639\ndeleteMin = <func> @..\\DBM-Core.lua:681\npushCachedTable = <func> @..\\DBM-Core.lua:618\npairs = <func> =[C]:-1\nupdateFunctions = <table> {}\nLastZoneText = \"恐惧之心\"\nLastZoneMapID = 897\nnext = <func> =[C]:-1\nmodSyncSpam = <table> {}\n",
			["stack"] = "DBM-Core\\DBM-Core.lua:1747: in function \"func\"\nDBM-Core\\DBM-Core.lua:729: in function <DBM-Core\\DBM-Core.lua:722>",
			["session"] = 252,
			["counter"] = 1,
		}, -- [10]
		{
			["message"] = "DBM-Core\\DBM-Core.lua:3106: attempt to concatenate upvalue \"difficultyText\" (a nil value)",
			["time"] = "2012/11/26 17:11:29",
			["locals"] = "(*temporary) = \"CHAT_MSG_BN_WHISPER\"\n(*temporary) = \"不知道啊\"\n(*temporary) = \"|Kf30|k000000000|k\"\n(*temporary) = \"\"\n(*temporary) = \"\"\n(*temporary) = \"\"\n(*temporary) = \"\"\n(*temporary) = 0\n(*temporary) = 0\n(*temporary) = \"\"\n(*temporary) = 0\n(*temporary) = 183\n(*temporary) = \"\"\n(*temporary) = 30\n(*temporary) = false\n(*temporary) = false\n(*temporary) = \"CHAT_MSG_BN_WHISPER\"\n(*temporary) = \"不知道啊\"\n(*temporary) = \"|Kf30|k000000000|k\"\n(*temporary) = \"\"\n(*temporary) = \"\"\n(*temporary) = \"\"\n(*temporary) = \"\"\n(*temporary) = 0\n(*temporary) = 0\n(*temporary) = \"\"\n(*temporary) = 0\n(*temporary) = 183\n(*temporary) = \"\"\n(*temporary) = 30\n(*temporary) = false\n(*temporary) = false\n(*temporary) = <func> =[C]:-1\n",
			["stack"] = "DBM-Core\\DBM-Core.lua:3106: in function <DBM-Core\\DBM-Core.lua:3090>\n(tail call): ?\nDBM-Core\\DBM-Core.lua:366: in function <DBM-Core\\DBM-Core.lua:359>",
			["session"] = 252,
			["counter"] = 3,
		}, -- [11]
		{
			["message"] = "DBM-Core\\DBM-Core.lua:2514: attempt to index field \"stats\" (a nil value)",
			["time"] = "2012/11/26 17:07:40",
			["locals"] = "self = <table> {\n MoveSpecialWarning = <func> @..\\DBM-Core.lua:4440\n CreatePizzaTimer = <func> @..\\DBM-Core.lua:1014\n MapSizes = <table> {}\n UnregisterShortTermEvents = <func> @..\\DBM-Core.lua:442\n MovieFilter = <func> @..\\DBM-Core.lua:3308\n GetModByName = <func> @..\\DBM-Core.lua:3390\n CHAT_MSG_RAID_BOSS_EMOTE = <func> @..\\DBM-Core.lua:2442\n CHAT_MSG_WHISPER = <func> @..\\DBM-Core.lua:3113\n RAID_BOSS_EMOTE = <func> @..\\DBM-Core.lua:2447\n AprilFools = <func> @..\\DBM-Core.lua:3017\n UnregisterInCombatEvents = <func> @..\\DBM-Core.lua:429\n ShowUpdateReminder = <func> @..\\DBM-Core.lua:2203\n PLAYER_REGEN_DISABLED = <func> @..\\DBM-Core.lua:2318\n CreateModLocalization = <func> @..\\DBM-Core.lua:5355\n IsEnabled = <func> @..\\DBM-Core.lua:3201\n Bars = <table> {}\n AddMsg = <func> @..\\DBM-Core.lua:3209\n Schedule = <func> @..\\DBM-Core.lua:774\n Capitalize = <func> @..\\DBM-Core.lua:3267\n ADDON_LOADED = <func> @..\\DBM-Core.lua:1465\n ShowPizzaInfo = <func> @..\\DBM-Core.lua:1039\n BossHealth = <table> {}\n ShowRaidIDRequestResults = <func> @..\\DBM-Core.lua:2058\n INSTANCE_ENCOUNTER_ENGAGE_UNIT = <func> @..\\DBM-Core.lua:2373\n Revision = 8085\n RegisterEvents = <func> @..\\DBM-Core.lua:399\n COMBAT_LOG_EVENT_UNFILTERED = <func> @..\\DBM-Core.lua:486\n FilterRaidBossEmote = <func> @..\\DBM-Core.lua:463\n RequestTimers = <func> @..\\DBM-Core.lua:2885\n LFG_PROPOSAL_SUCCEEDED = <func> @..\\DBM-Core.lua:1570\n ForceUpdate = <func> @..\\DBM-Core.lua:782\n UPDATE_BATTLEFIELD_STATUS = <func> @..\\DBM-Core.lua:1574\n CHAT_MSG_MONSTER_YELL = <func> @..\\DBM-Core.lua:2434\n LFG_COMPLETION_REWARD = <func> @..\\DBM-Core.lua:1667\n LFG_PROPOSAL_SHOW = <func> @..\\DBM-Core.lua:1562\n ReleaseRevision = 7956\n Enable = <func> @..\\DBM-Core.lua:3197\n PLAYER_ENTERING_WORLD = <func> @..\\DBM-Core.lua:3041\n AddOns = <table> {}\n Flash = <table> {}\n Options = <table> {}\n UNIT_DESTROYED = <func> @..\\DBM-Core.lua:2870\n GetUnitFullName = <func> @..\\DBM-Core.lua:1335\n GetGroupMembers = <func> @..\\DBM-Core.lua:1311\n InfoFrame = <table> {}\n SendTimerInfo = <func> @..\\DBM-Core.lua:2975\n CHAT_MSG_BN_WHISPER = <func> @..\\DBM-Core.lua:3117\n UNIT_DIED = <func> @..\\DBM-Core.lua:2870\n GetRaidUnitId = <func> @..\\DBM-Core.lua:1330\n ReceiveCombatInfo = <func> @..\\DBM-Core.lua:2898\n CHAT_MSG_ADDON = <func> @..\\DBM-Core.lua:2185\n DefaultOptions = <table> {}\n GetModLocalization = <func> @..\\DBM-Core.lua:5371\n ShowTestSpecialWarning = <func> @..\\DBM-Core.lua:4490\n GetCurrentInstanceDifficulty = <func> @..\\DBM-Core.lua:2843\n RegisterCallback = <functio",
			["stack"] = "DBM-Core\\DBM-Core.lua:2514: in function \"StartCombat\"\nDBM-Core\\DBM-Core.lua:2385: in function \"?\"\nDBM-Core\\DBM-Core.lua:366: in function <DBM-Core\\DBM-Core.lua:359>",
			["session"] = 252,
			["counter"] = 3,
		}, -- [12]
		{
			["message"] = "DBM-Core\\DBM-Core.lua:2713: attempt to perform arithmetic on field \"pull\" (a nil value)",
			["time"] = "2012/11/26 17:16:24",
			["locals"] = "self = <table> {\n MoveSpecialWarning = <func> @..\\DBM-Core.lua:4440\n CreatePizzaTimer = <func> @..\\DBM-Core.lua:1014\n MapSizes = <table> {}\n UnregisterShortTermEvents = <func> @..\\DBM-Core.lua:442\n MovieFilter = <func> @..\\DBM-Core.lua:3308\n GetModByName = <func> @..\\DBM-Core.lua:3390\n CHAT_MSG_RAID_BOSS_EMOTE = <func> @..\\DBM-Core.lua:2442\n CHAT_MSG_WHISPER = <func> @..\\DBM-Core.lua:3113\n RAID_BOSS_EMOTE = <func> @..\\DBM-Core.lua:2447\n AprilFools = <func> @..\\DBM-Core.lua:3017\n UnregisterInCombatEvents = <func> @..\\DBM-Core.lua:429\n ShowUpdateReminder = <func> @..\\DBM-Core.lua:2203\n PLAYER_REGEN_DISABLED = <func> @..\\DBM-Core.lua:2318\n CreateModLocalization = <func> @..\\DBM-Core.lua:5355\n IsEnabled = <func> @..\\DBM-Core.lua:3201\n Bars = <table> {}\n AddMsg = <func> @..\\DBM-Core.lua:3209\n Schedule = <func> @..\\DBM-Core.lua:774\n Capitalize = <func> @..\\DBM-Core.lua:3267\n ADDON_LOADED = <func> @..\\DBM-Core.lua:1465\n ShowPizzaInfo = <func> @..\\DBM-Core.lua:1039\n BossHealth = <table> {}\n ShowRaidIDRequestResults = <func> @..\\DBM-Core.lua:2058\n INSTANCE_ENCOUNTER_ENGAGE_UNIT = <func> @..\\DBM-Core.lua:2373\n Revision = 8085\n RegisterEvents = <func> @..\\DBM-Core.lua:399\n COMBAT_LOG_EVENT_UNFILTERED = <func> @..\\DBM-Core.lua:486\n FilterRaidBossEmote = <func> @..\\DBM-Core.lua:463\n RequestTimers = <func> @..\\DBM-Core.lua:2885\n LFG_PROPOSAL_SUCCEEDED = <func> @..\\DBM-Core.lua:1570\n ForceUpdate = <func> @..\\DBM-Core.lua:782\n UPDATE_BATTLEFIELD_STATUS = <func> @..\\DBM-Core.lua:1574\n CHAT_MSG_MONSTER_YELL = <func> @..\\DBM-Core.lua:2434\n LFG_COMPLETION_REWARD = <func> @..\\DBM-Core.lua:1667\n LFG_PROPOSAL_SHOW = <func> @..\\DBM-Core.lua:1562\n ReleaseRevision = 7956\n Enable = <func> @..\\DBM-Core.lua:3197\n PLAYER_ENTERING_WORLD = <func> @..\\DBM-Core.lua:3041\n AddOns = <table> {}\n Flash = <table> {}\n Options = <table> {}\n UNIT_DESTROYED = <func> @..\\DBM-Core.lua:2870\n GetUnitFullName = <func> @..\\DBM-Core.lua:1335\n GetGroupMembers = <func> @..\\DBM-Core.lua:1311\n InfoFrame = <table> {}\n SendTimerInfo = <func> @..\\DBM-Core.lua:2975\n CHAT_MSG_BN_WHISPER = <func> @..\\DBM-Core.lua:3117\n UNIT_DIED = <func> @..\\DBM-Core.lua:2870\n GetRaidUnitId = <func> @..\\DBM-Core.lua:1330\n ReceiveCombatInfo = <func> @..\\DBM-Core.lua:2898\n CHAT_MSG_ADDON = <func> @..\\DBM-Core.lua:2185\n DefaultOptions = <table> {}\n GetModLocalization = <func> @..\\DBM-Core.lua:5371\n ShowTestSpecialWarning = <func> @..\\DBM-Core.lua:4490\n GetCurrentInstanceDifficulty = <func> @..\\DBM-Core.lua:2843\n RegisterCallback = <functio",
			["stack"] = "DBM-Core\\DBM-Core.lua:2713: in function \"EndCombat\"\nDBM-Core\\DBM-Core.lua:2838: in function \"OnMobKill\"\nDBM-Core\\DBM-Core.lua:2872: in function \"?\"\nDBM-Core\\DBM-Core.lua:366: in function <DBM-Core\\DBM-Core.lua:359>\n(tail call): ?\nDBM-Core\\DBM-Core.lua:366: in function <DBM-Core\\DBM-Core.lua:359>",
			["session"] = 252,
			["counter"] = 3,
		}, -- [13]
		{
			["message"] = "oUF_Freebgrid-6.9.3\\elements\\heals-治疗.lua:158: attempt to index a nil value",
			["time"] = "2012/12/04 12:23:26",
			["stack"] = "<in C code>\n<in C code>\nFrameXML\\RestrictedFrames.lua:604: in function <FrameXML\\RestrictedFrames.lua:603>\nFrameXML\\RestrictedFrames.lua:742: in function \"CallMethod\"\n[string \"		local header = self:GetParent()RestrictedExecution.lua:441: in function <FrameXML\\RestrictedExecution.lua:412>\nFrameXML\\SecureGroupHeaders.lua:108: in function <FrameXML\\SecureGroupHeaders.lua:102>\nFrameXML\\SecureGroupHeaders.lua:158: in function <FrameXML\\SecureGroupHeaders.lua:115>\nFrameXML\\SecureGroupHeaders.lua:458: in function <FrameXML\\SecureGroupHeaders.lua:382>\n<in C code>\nFrameXML\\SecureStateDriver.lua:100: in function <FrameXML\\SecureStateDriver.lua:95>\nFrameXML\\SecureStateDriver.lua:164: in function <FrameXML\\SecureStateDriver.lua:146>\n<in C code>\nFrameXML\\SecureStateDriver.lua:11: in function \"RegisterAttributeDriver\"\noUF_Freebgrid-6.9.3\\oUF\\ouf-1.6.0.lua:533: in function \"SpawnHeader\"\noUF_Freebgrid-6.9.3\\freebgrid.lua:666: in function <oUF_Freebgrid\\freebgrid.lua:596>\noUF_Freebgrid-6.9.3\\freebgrid.lua:707: in function \"func\"\noUF_Freebgrid-6.9.3\\oUF\\factory.lua:20: in function <oUF_Freebgrid\\oUF\\factory.lua:16>\n(tail call): ?",
			["session"] = 321,
			["counter"] = 1,
		}, -- [14]
	},
}
