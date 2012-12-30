
BugGrabberDB = {
	["lastSanitation"] = 3,
	["session"] = 25,
	["errors"] = {
		{
			["message"] = "RayWatcher-2.0 beta\\Config.lua:17: \"}\" expected (to close \"{\" at line 6) near \"buff_direction\"",
			["time"] = "2012/11/25 14:29:37",
			["locals"] = "",
			["stack"] = "",
			["session"] = 25,
			["counter"] = 1,
		}, -- [1]
		{
			["message"] = "RayWatcher-2.0 beta\\Core.lua:483: attempt to index field \"watchers\" (a nil value)",
			["time"] = "2012/11/25 14:29:37",
			["stack"] = "RayWatcher-2.0 beta\\Core.lua:483: in function <RayWatcher\\Core.lua:482>\n(tail call): ?\n<in C code>\n<string>:\"safecall Dispatcher[1]\":9: in function <string>:\"safecall Dispatcher[1]\":5\n(tail call): ?\nDBM-Core\\libs\\AceAddon-3.0\\AceAddon-3.0-11.lua:514: in function \"InitializeAddon\"\nDBM-Core\\libs\\AceAddon-3.0\\AceAddon-3.0-11.lua:629: in function <DBM-Core\\libs\\AceAddon-3.0\\AceAddon-3.0.lua:621>",
			["session"] = 25,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "<string>:\"hax.lua\":1: attempt to index global \"ACTIVE_TALENT_GROUP_CHANGED\" (a nil value)",
			["time"] = "2012/11/25 14:23:18",
			["locals"] = "",
			["stack"] = "<string>:\"hax.lua\":1: in main chunk",
			["session"] = 25,
			["counter"] = 4,
		}, -- [3]
		{
			["message"] = "DBM-Core\\DBM-Core.lua:1090: ItemRefTooltip:SetHyperlink(): Unknown link type",
			["time"] = "2012/11/25 14:30:11",
			["locals"] = "self = ItemRefTooltip {\n 0 = <userdata>\n SetQuestLogRewardSpell = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetTradeTargetItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetQuestLogItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetUnit = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetInboxItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetBuybackItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n shoppingTooltips = <table> {}\n SetTradeSkillItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetMerchantItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetHyperlink = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetGuildBankItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetUnitBuff = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetTalent = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetTradePlayerItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetTrainerService = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetSendMailItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetBagItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n updateTooltip = 0.2\n SetInventoryItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetSpellBookItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetCurrencyToken = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetLootRollItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetQuestRewardSpell = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetShapeshift = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetAuctionSellItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetPetAction = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetUnitDebuff = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n UpdateTooltip = <func> *:OnLoad:5\n SetLootItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetQuestItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n SetAuctionItem = <func> @TradeSkillMaster\\Libs\\..\\LibExtraTip.lua:284\n}\nlink = \"buggrabber:灆安:1C978F70\"\nold = <func> =[C]:-1\n",
			["stack"] = "<in C code>\nDBM-Core\\DBM-Core.lua:1090: in function <DBM-Core\\DBM-Core.lua:1086>\nTradeSkillMaster-v1.5.10\\Libs\\LibExtraTip\\LibExtraTip.lua:290: in function \"SetHyperlink\"\nFrameXML\\ItemRef.lua:238: in function <FrameXML\\ItemRef.lua:2>\n(tail call): ?\n<in C code>\naMini-2.0\\damagemeters.lua:121: in function <aMini\\damagemeters.lua:100>\nBlizzard_CombatLog\\Blizzard_CombatLog.lua:3622: in function \"SetItemRef\"\nFrameXML\\ChatFrame.lua:3372: in function <FrameXML\\ChatFrame.lua:3371>\n<in C code>\n!BugGrabber-r186\\BugGrabber.lua:412: in function \"ChatFrame_OnHyperlinkShow\"\n<string>:\"*:OnHyperlinkClick\":1: in function <string>:\"*:OnHyperlinkClick\":1\n<in C code>",
			["session"] = 25,
			["counter"] = 1,
		}, -- [4]
	},
}
