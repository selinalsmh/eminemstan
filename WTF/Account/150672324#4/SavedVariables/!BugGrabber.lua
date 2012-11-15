
BugGrabberDB = {
	["lastSanitation"] = 3,
	["session"] = 35,
	["errors"] = {
		{
			["message"] = "SkadaSkin and tooltips\\ilevel.lua:49: attempt to perform arithmetic on local \"ilvlAdd\" (a nil value)",
			["time"] = "2012/11/04 17:05:37",
			["locals"] = "GetPlayerScore = <func> @SkadaSkin and tooltips\\ilevel.lua:40\nunit = \"player\"\nGetQuality = <func> @SkadaSkin and tooltips\\ilevel.lua:59\n",
			["stack"] = "SkadaSkin and tooltips\\ilevel.lua:49: in function <SkadaSkin and tooltips\\ilevel.lua:40>\nSkadaSkin and tooltips\\ilevel.lua:78: in function <SkadaSkin and tooltips\\ilevel.lua:77>\nSkadaSkin and tooltips\\ilevel.lua:101: in function <SkadaSkin and tooltips\\ilevel.lua:94>\n<in C code>\n<in C code>\n<in C code>\n<in C code>\nFrameXML\\UnitFrame.lua:224: in function \"UnitFrame_UpdateTooltip\"\nFrameXML\\UnitFrame.lua:211: in function \"UnitFrame_OnEnter\"\noUF_Qulight-0.1 beta\\lib.lua:531: in function <oUF_Qulight\\lib.lua:530>",
			["session"] = 3,
			["counter"] = 17,
		}, -- [1]
		{
			["message"] = "FreebTip-2.4\\tip.lua:363: attempt to concatenate a nil value",
			["time"] = "2012/11/06 16:29:30",
			["locals"] = "(*temporary) = <func> =[C]:-1\n = <func> *:OnTooltipSetUnit:1\n = <func> @FreebTip\\tip.lua:302\n",
			["stack"] = "FreebTip-2.4\\tip.lua:363: in function <FreebTip\\tip.lua:302>\n<in C code>\n<in C code>\nFrameXML\\UnitFrame.lua:224: in function \"UnitFrame_UpdateTooltip\"\nFrameXML\\UnitFrame.lua:211: in function \"UnitFrame_OnEnter\"\noUF_Freebgrid-6.9.3\\freebgrid.lua:420: in function <oUF_Freebgrid\\freebgrid.lua:418>",
			["session"] = 10,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "DBM-Core\\DBM-Core-4.11.4.lua:1079: ItemRefTooltip:SetHyperlink(): Unknown link type",
			["time"] = "2012/11/04 17:12:57",
			["locals"] = "self = ItemRefTooltip {\n 0 = <userdata>\n shadow = <unnamed> {}\n updateTooltip = 0.2\n SetHyperlink = <func> @..\\DBM-Core.lua:1075\n UpdateTooltip = <func> *:OnLoad:5\n bd = <unnamed> {}\n border = <unnamed> {}\n shoppingTooltips = <table> {}\n}\nlink = \"buggrabber:沃利贝尔:208874D0\"\nold = <func> =[C]:-1\n",
			["stack"] = "<in C code>\nDBM-Core\\DBM-Core-4.11.4.lua:1079: in function \"SetHyperlink\"\nFrameXML\\ItemRef.lua:238: in function <FrameXML\\ItemRef.lua:2>\n<in C code>\nBlizzard_CombatLog\\Blizzard_CombatLog.lua:3622: in function \"SetItemRef\"\nFrameXML\\ChatFrame.lua:3372: in function <FrameXML\\ChatFrame.lua:3371>\n(tail call): ?\n<string>:\"*:OnHyperlinkClick\":1: in function <string>:\"*:OnHyperlinkClick\":1\n<in C code>",
			["session"] = 19,
			["counter"] = 7,
		}, -- [3]
		{
			["message"] = "oUF_Qulight-0.1 beta\\lib.lua:1580: bad argument #1 to \"pairs\" (table expected, got nil)",
			["time"] = "2012/11/04 17:05:28",
			["locals"] = "self = oUF_Boss1 {\n 0 = <userdata>\n Highlight = <unnamed> {}\n __tags = <table> {}\n UNIT_ENTERED_VEHICLE = <func> @oUF\\ouf.lua:38\n mystyle = \"boss\"\n unit = \"boss1\"\n UNIT_PET = <func> @oUF\\ouf.lua:175\n RaidIcon = <unnamed> {}\n __elements = <table> {}\n onUpdateFrequency = 0.5\n Power = <unnamed> {}\n __eventless = true\n style = \"Boss\"\n PLAYER_ENTERING_WORLD = <func> @oUF\\ouf.lua:149\n id = \"1\"\n UNIT_EXITED_VEHICLE = <func> @oUF\\ouf.lua:38\n Health = <unnamed> {}\n}\nunit = nil\nauras = <table> {\n onlyShowPresent = true\n anyUnit = true\n icons = <table> {}\n PostCreateIcon = <func> @oUF_Qulight\\lib.lua:1524\n}\nspellIDs = <table> {\n DEATHKNIGHT = <table> {}\n WARRIOR = <table> {}\n PALADIN = <table> {}\n MAGE = <table> {}\n PRIEST = <table> {}\n WARLOCK = <table> {}\n SHAMAN = <table> {}\n DRUID = <table> {}\n ROGUE = <table> {}\n HUNTER = <table> {}\n}\ncfg = <unnamed> {\n 0 = <userdata>\n backdrop_texture = \"oUF_Qulight\\media\\textures\\backdrop\"\n MTFrames = true\n showRunebar = true\n HealFrames = true\n petx = -390\n showpet = true\n Experiencebar = false\n font = \"FONTS\\ARKai_T.TTF\"\n highlight_texture = \"oUF_Qulight\\media\\textures\\raidbg\"\n RaidShowSolo = false\n showShardbar = true\n pety = 423\n targety = 430\n showAuraWatch = true\n focusy = 550\n RCheckIcon = true\n targetx = 150\n playery = 430\n playerx = -150\n focusx = 300\n ShowParty = true\n showLFDIcons = true\n Reputationbar = false\n showfocustarget = true\n Castbars = true\n ShowRaid = true\n showPortrait = true\n showShadowOrbsBar = true\n showHarmonyBar = true\n showtot = true\n showEclipsebar = true\n showHolybar = true\n showBossFrames = true\n fade = false\n backdrop_edge_texture = \"oUF_Qulight\\media\\textures\\backdrop_edge\"\n fontsize = 12\n showPlayerAuras = false\n TotemBars = true\n enableDebuffHighlight = true\n powerbar_texture = \"oUF_Qulight\\media\\textures\\statusbar\"\n debuffBorder = \"oUF_Qulight\\media\\textures\\iconborder\"\n showfocus = true\n RaidShowAllGroups = false\n showRaidDebuffs = true\n statusbar_texture = \"oUF_Qulight\\media\\textures\\statusbar\"\n}\nAWPostCreateIcon = <func> @oUF_Qulight\\lib.lua:1524\nplayerClass = \"MONK\"\n",
			["stack"] = "<in C code>\noUF_Qulight-0.1 beta\\lib.lua:1580: in function \"createAuraWatch\"\noUF_Qulight-0.1 beta\\core.lua:196: in function \"styleFunc\"\noUF-1.6.0\\ouf-1.6.0.lua:262: in function <oUF\\ouf.lua:192>\n(tail call): ?\noUF-1.6.0\\ouf-1.6.0.lua:552: in function \"Spawn\"\noUF_Qulight-0.1 beta\\core.lua:365: in function \"func\"\noUF-1.6.0\\factory.lua:20: in function <oUF\\factory.lua:16>\n(tail call): ?",
			["session"] = 30,
			["counter"] = 16,
		}, -- [4]
	},
}
