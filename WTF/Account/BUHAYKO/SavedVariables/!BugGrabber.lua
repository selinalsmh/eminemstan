
BugGrabberDB = {
	["session"] = 48,
	["lastSanitation"] = 3,
	["errors"] = {
		{
			["message"] = "oUF_Freebgrid-6.9.3\\config.lua:2166: attempt to call field \"ClickSetDefault\" (a nil value)",
			["time"] = "2012/11/12 10:39:09",
			["stack"] = "oUF_Freebgrid-6.9.3\\config.lua:2166: in function <oUF_Freebgrid\\config.lua:2161>\n(tail call): ?\n<in C code>\n<string>:\"safecall Dispatcher[3]\":9: in function <string>:\"safecall Dispatcher[3]\":5\n(tail call): ?\nAceConfigDialog-3.0\\AceConfigDialog-3.0-57.lua:799: in function <AceConfigDialog-3.0\\AceConfigDialog-3.0.lua:614>\n(tail call): ?\n<in C code>\n<string>:\"safecall Dispatcher[4]\":9: in function <string>:\"safecall Dispatcher[4]\":5\n(tail call): ?\nMasque-40300\\Libs\\AceGUI-3.0\\AceGUI-3.0-33.lua:314: in function \"Fire\"\nLibs\\6AceGUI-3.0-33\\widgets\\AceGUIWidget-Button.lua:28: in function <Libs\\AceGUI-3.0\\widgets\\AceGUIWidget-Button.lua:25>",
			["session"] = 3,
			["counter"] = 1,
		}, -- [1]
		{
			["message"] = "aMini-2.0\\idQuestAutomation.lua:107: Invalid reward choice in GetQuestReward([choice])",
			["time"] = "2012/11/12 19:00:26",
			["locals"] = "self = <unnamed> {\n 0 = <userdata>\n canAutomate = <func> @aMini\\idQuestAutomation.lua:5\n completed_quests = <table> {}\n incomplete_quests = <table> {}\n onevent = <func> @aMini\\idQuestAutomation.lua:111\n QUEST_DETAIL = <func> @aMini\\idQuestAutomation.lua:99\n QUEST_PROGRESS = <func> @aMini\\idQuestAutomation.lua:23\n strip_text = <func> @aMini\\idQuestAutomation.lua:13\n QUEST_COMPLETE = <func> @aMini\\idQuestAutomation.lua:104\n GOSSIP_SHOW = <func> @aMini\\idQuestAutomation.lua:59\n QUEST_GREETING = <func> @aMini\\idQuestAutomation.lua:80\n QUEST_LOG_UPDATE = <func> @aMini\\idQuestAutomation.lua:30\n}\nevent = nil\n",
			["stack"] = "<in C code>\naMini-2.0\\idQuestAutomation.lua:107: in function \"?\"\naMini-2.0\\idQuestAutomation.lua:113: in function <aMini\\idQuestAutomation.lua:111>",
			["session"] = 8,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "aMini-2.0\\AutoRepair.lua:8: attempt to perform arithmetic on a nil value",
			["time"] = "2012/11/20 00:28:30",
			["locals"] = "",
			["stack"] = "aMini-2.0\\AutoRepair.lua:8: in function <aMini\\AutoRepair.lua:2>",
			["session"] = 28,
			["counter"] = 1,
		}, -- [3]
		{
			["message"] = "FrameXML\\RaidWarning.lua:46: attempt to index local \"colorInfo\" (a number value)",
			["time"] = "2012/11/29 00:41:37",
			["locals"] = "noticeFrame = RaidWarningFrame {\n 0 = <userdata>\n timings = <table> {}\n slot1 = RaidWarningFrameSlot1 {}\n slot2_text = \" |TIcons\\Spell_Misc_EmotionAngry:18:18:0:0:64:64:5:59:5:59|t |cffff1919攻击行为 -|r|cffff1919 >沫沫儒生|r|cffff1919, |r|cffff1919九级天使|r|cffff1919, |r|cffff1919轩辕炽魔|r|cffff1919, |r|cffff1919小甩鸟|r|cffff1919, |r|cffff1919激丶光|r|cffff1919, |r|cffff1919血魔无锋|r|cffff1919|r |TIcons\\Spell_Misc_EmotionAngry:18:18:0:0:64:64:5:59:5:59|t \"\n slot1_text = \"Klie施放了隐形术！\"\n slot2 = RaidWarningFrameSlot2 {}\n}\ntextString = \"Klie施放了隐形术！\"\ncolorInfo = 0.41\ndisplayTime = 10\n",
			["stack"] = "FrameXML\\RaidWarning.lua:46: in function \"RaidNotice_SetSlot\"\nFrameXML\\RaidWarning.lua:28: in function <FrameXML\\RaidWarning.lua:13>\n(tail call): ?\naMini-2.0\\m_Settings.lua:888: in function <aMini\\m_Settings.lua:859>",
			["session"] = 42,
			["counter"] = 1,
		}, -- [4]
		{
			["message"] = "FrameXML\\WorldMapFrame.lua:1535: attempt to concatenate a nil value",
			["time"] = "2012/11/29 01:04:04",
			["locals"] = "self = WorldMapRaid25 {\n 0 = <userdata>\n icon = WorldMapRaid25Icon {}\n unit = \"raid26\"\n}\nmotion = true\n",
			["stack"] = "FrameXML\\WorldMapFrame.lua:1535: in function \"WorldMapUnit_OnEnter\"\n<string>:\"*:OnEnter\":1: in function <string>:\"*:OnEnter\":1",
			["session"] = 42,
			["counter"] = 1,
		}, -- [5]
	},
}
