
BugGrabberDB = {
	["session"] = 44,
	["lastSanitation"] = 3,
	["errors"] = {
		{
			["message"] = "oUF_Freebgrid-6.9.3\\config.lua:665: attempt to index field \"oUF_FreebgridRaidFrame\" (a nil value)",
			["time"] = "2012/11/05 01:22:58",
			["stack"] = "oUF_Freebgrid-6.9.3\\config.lua:665: in function \"updateObjects\"\noUF_Freebgrid-6.9.3\\config.lua:782: in function <oUF_Freebgrid\\config.lua:782>\n(tail call): ?\n<in C code>\n<string>:\"safecall Dispatcher[2]\":9: in function <string>:\"safecall Dispatcher[2]\":5\n(tail call): ?\nAceConfigDialog-3.0\\AceConfigDialog-3.0-57.lua:799: in function <AceConfigDialog-3.0\\AceConfigDialog-3.0.lua:614>\nAceConfigDialog-3.0\\AceConfigDialog-3.0-57.lua:851: in function <AceConfigDialog-3.0\\AceConfigDialog-3.0.lua:839>\n(tail call): ?\n<in C code>\n<string>:\"safecall Dispatcher[3]\":9: in function <string>:\"safecall Dispatcher[3]\":5\n(tail call): ?\nMasque-40300\\Libs\\AceGUI-3.0\\AceGUI-3.0-33.lua:314: in function \"Fire\"\nLibs\\6AceGUI-3.0-33\\widgets\\AceGUIWidget-Slider.lua:66: in function <Libs\\AceGUI-3.0\\widgets\\AceGUIWidget-Slider.lua:60>\n<in C code>\nLibs\\6AceGUI-3.0-33\\widgets\\AceGUIWidget-Slider.lua:108: in function <Libs\\AceGUI-3.0\\widgets\\AceGUIWidget-Slider.lua:96>",
			["session"] = 1,
			["counter"] = 2,
		}, -- [1]
		{
			["message"] = "FreebTip-2.4\\tip.lua:363: attempt to concatenate a nil value",
			["time"] = "2012/11/06 02:53:16",
			["locals"] = "(*temporary) = <func> =[C]:-1\n = <func> *:OnTooltipSetUnit:1\n = <func> @FreebTip\\tip.lua:302\n",
			["stack"] = "FreebTip-2.4\\tip.lua:363: in function <FreebTip\\tip.lua:302>\n<in C code>\n<in C code>\nFrameXML\\UnitFrame.lua:224: in function \"UnitFrame_UpdateTooltip\"\nFrameXML\\UnitFrame.lua:211: in function \"UnitFrame_OnEnter\"\n<string>:\"*:OnEnter\":1: in function <string>:\"*:OnEnter\":1",
			["session"] = 3,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "oUF_Freebgrid-6.9.3\\db.lua:497: attempt to index field \"?\" (a nil value)",
			["time"] = "2012/11/05 01:22:28",
			["locals"] = "tree = \"Talent\"暗影\"\"\nADDON_NAME = \"oUF_Freebgrid\"\nns = <table> {\n movableopt = <unnamed> {}\n defaults = <table> {}\n _Headers = <table> {}\n numberize = <func> @oUF_Freebgrid\\tags.lua:27\n auras = <table> {}\n hex = <func> @oUF_Freebgrid\\freebgrid.lua:53\n FlushDB = <func> @oUF_Freebgrid\\db.lua:541\n UpdateHealth = <func> @oUF_Freebgrid\\freebgrid.lua:266\n Anchors = <func> @oUF_Freebgrid\\movable.lua:171\n InitDB = <func> @oUF_Freebgrid\\db.lua:504\n UpdateName = <func> @oUF_Freebgrid\\freebgrid.lua:195\n ACTIVE_TALENT_GROUP_CHANGED = <func> @oUF_Freebgrid\\freebgrid.lua:858\n scaleRaid = <func> @oUF_Freebgrid\\freebgrid.lua:17\n PLAYER_LOGIN = <func> @oUF_Freebgrid\\freebgrid.lua:829\n UnregisterEvents = <func> @oUF_Freebgrid\\events.lua:7\n nameCache = <table> {}\n db = <table> {}\n TalentTree = \"Talent\"暗影\"\"\n arrow = <func> @oUF_Freebgrid\\elements\\range.lua:96\n classIndicators = <table> {}\n debuffColor = <table> {}\n PLAYER_LOGOUT = <func> @oUF_Freebgrid\\freebgrid.lua:846\n RegisterEvents = <func> @oUF_Freebgrid\\events.lua:6\n Movable = <func> @oUF_Freebgrid\\movable.lua:479\n RegisterEvent = <func> @oUF_Freebgrid\\events.lua:6\n UpdatePower = <func> @oUF_Freebgrid\\freebgrid.lua:372\n ClickSetDefault = <func> @oUF_Freebgrid\\db.lua:477\n Slash = <func> @oUF_Freebgrid\\freebgrid.lua:868\n fonts = <table> {}\n UnregisterEvent = <func> @oUF_Freebgrid\\events.lua:7\n textures = <table> {}\n colorCache = <table> {}\n _Objects = <table> {}\n Colors = <func> @oUF_Freebgrid\\freebgrid.lua:638\n mediapath = \"oUF_Freebgrid\\media\\\"\n RegisterClicks = <func> @oUF_Freebgrid\\freebgrid.lua:446\n}\nGetTalentSpec = <func> @oUF_Freebgrid\\db.lua:471\n",
			["stack"] = "oUF_Freebgrid-6.9.3\\db.lua:497: in function \"ClickSetDefault\"\noUF_Freebgrid-6.9.3\\db.lua:529: in function \"InitDB\"\noUF_Freebgrid-6.9.3\\freebgrid.lua:745: in function \"func\"\noUF-1.6.0\\factory.lua:20: in function <oUF\\factory.lua:16>\n(tail call): ?",
			["session"] = 9,
			["counter"] = 9,
		}, -- [3]
	},
}
