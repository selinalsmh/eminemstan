
BugGrabberDB = {
	["lastSanitation"] = 3,
	["session"] = 37,
	["errors"] = {
		{
			["message"] = "FreebTip-2.4\\tip.lua:6: \"}\" expected (to close \"{\" at line 4) near \"fontsize\"",
			["time"] = "2012/11/05 19:40:25",
			["locals"] = "",
			["stack"] = "",
			["session"] = 14,
			["counter"] = 1,
		}, -- [1]
		{
			["message"] = "FreebTip-2.4\\FreebTip_Multi.lua:3: attempt to index field \"cfg\" (a nil value)",
			["time"] = "2012/11/05 19:40:25",
			["locals"] = "",
			["stack"] = "FreebTip-2.4\\FreebTip_Multi.lua:3: in main chunk",
			["session"] = 14,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "FreebTip-2.4\\anchor.lua:70: attempt to index field \"cfg\" (a nil value)",
			["time"] = "2012/11/05 19:40:27",
			["locals"] = "(*temporary) = <func> =[C]:-1\n = <func> @FrameXML\\GameTooltip.lua:72\n = <func> @FreebTip\\anchor.lua:68\n",
			["stack"] = "FreebTip-2.4\\anchor.lua:70: in function <FreebTip\\anchor.lua:68>\n<in C code>\n<string>:\"*:OnTooltipSetDefaultAnchor\":1: in function <string>:\"*:OnTooltipSetDefaultAnchor\":1",
			["session"] = 14,
			["counter"] = 7,
		}, -- [3]
		{
			["message"] = "CreateFrame: Can\"t create protected \"Button\" now",
			["time"] = "2012/11/05 20:12:57",
			["locals"] = "(*temporary) = \"Button\"\n(*temporary) = \"CompactRaidFrame32\"\n(*temporary) = CompactRaidFrameContainer {\n unitFrameUnusedFunc = <func> @Blizzard_CompactRaidFrames\\Blizzard_CompactRaidFrameContainer.lua:46\n flowSortFunc = <func> @Blizzard_CompactRaidFrames\\Blizzard_CompactRaidFrameManager.lua:762\n groupMode = \"flush\"\n raidUnits = <table> {}\n frameUpdateList = <table> {}\n flowOrientation = \"vertical\"\n showBorder = true\n borderFrame = CompactRaidFrameContainerBorderFrame {}\n flowFilterFunc = <func> @Blizzard_CompactRaidFrames\\Blizzard_CompactRaidFrameManager.lua:830\n groupFilterFunc = <func> @Blizzard_CompactRaidFrames\\Blizzard_CompactRaidFrameManager.lua:860\n partyUnits = <table> {}\n flowMaxPrimaryUsed = 216.00000382969\n flowMaxSecondaryUsed = 576.00005689818\n units = <table> {}\n flowPauseUpdates = true\n enabled = false\n frameReservations = <table> {}\n flowFrames = <table> {}\n 0 = <userdata>\n displayFlaggedMembers = true\n}\n(*temporary) = \"CompactUnitFrameTemplate\"\n = <func> =[C]:-1\n = <func> @aMini\\Focuser.lua:8\n",
			["stack"] = "<in C code>\n<in C code>\nBlizzard_CompactRaidFrameContainer.lua:342: in function \"CompactRaidFrameContainer_GetUnitFrame\"\nBlizzard_CompactRaidFrameContainer.lua:314: in function \"CompactRaidFrameContainer_AddUnitFrame\"\nBlizzard_CompactRaidFrameContainer.lua:296: in function \"CompactRaidFrameContainer_AddFlaggedUnits\"\nBlizzard_CompactRaidFrameContainer.lua:169: in function \"CompactRaidFrameContainer_LayoutFrames\"\nBlizzard_CompactRaidFrameContainer.lua:130: in function \"CompactRaidFrameContainer_TryUpdate\"\nBlizzard_CompactRaidFrameContainer.lua:57: in function \"CompactRaidFrameContainer_OnEvent\"\n<string>:\"*:OnEvent\":1: in function <string>:\"*:OnEvent\":1",
			["session"] = 16,
			["counter"] = 1,
		}, -- [4]
	},
}
