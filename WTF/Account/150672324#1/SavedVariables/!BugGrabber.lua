
BugGrabberDB = {
	["lastSanitation"] = 3,
	["session"] = 73,
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
			["message"] = "MicroMenu\\MicroMenu-1.4-3.lua:458: script ran too long",
			["time"] = "2012/11/07 01:25:03",
			["locals"] = "",
			["stack"] = "MicroMenu\\MicroMenu-1.4-3.lua:458: in function <MicroMenu\\MicroMenu.lua:450>",
			["session"] = 33,
			["counter"] = 1,
		}, -- [3]
		{
			["message"] = "aMini-2.0\\AutoRepair.lua:8: attempt to perform arithmetic on a nil value",
			["time"] = "2012/11/08 21:43:28",
			["locals"] = "",
			["stack"] = "aMini-2.0\\AutoRepair.lua:8: in function <aMini\\AutoRepair.lua:2>",
			["session"] = 39,
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
			["message"] = "aMini-2.0\\idQuestAutomation.lua:107: Invalid reward choice in GetQuestReward([choice])",
			["time"] = "2012/11/05 22:59:27",
			["locals"] = "self = <unnamed> {\n 0 = <userdata>\n canAutomate = <func> @aMini\\idQuestAutomation.lua:5\n completed_quests = <table> {}\n incomplete_quests = <table> {}\n onevent = <func> @aMini\\idQuestAutomation.lua:111\n QUEST_DETAIL = <func> @aMini\\idQuestAutomation.lua:99\n QUEST_PROGRESS = <func> @aMini\\idQuestAutomation.lua:23\n strip_text = <func> @aMini\\idQuestAutomation.lua:13\n QUEST_COMPLETE = <func> @aMini\\idQuestAutomation.lua:104\n GOSSIP_SHOW = <func> @aMini\\idQuestAutomation.lua:59\n QUEST_GREETING = <func> @aMini\\idQuestAutomation.lua:80\n QUEST_LOG_UPDATE = <func> @aMini\\idQuestAutomation.lua:30\n}\nevent = nil\n",
			["stack"] = "<in C code>\naMini-2.0\\idQuestAutomation.lua:107: in function \"?\"\naMini-2.0\\idQuestAutomation.lua:113: in function <aMini\\idQuestAutomation.lua:111>",
			["session"] = 73,
			["counter"] = 25,
		}, -- [10]
	},
}
