
BugGrabberDB = {
	["lastSanitation"] = 3,
	["session"] = 79,
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
		{
			["message"] = "oUF_Qulight-0.1 beta\\castbar.lua:90: attempt to perform arithmetic on field \"sendTime\" (a nil value)",
			["time"] = "2012/11/16 00:45:42",
			["locals"] = "self = oUF_Player {\n 0 = <userdata>\n UNIT_PORTRAIT_UPDATE = <func> @oUF\\elements\\portraits.lua:75\n Combat = <unnamed> {}\n PARTY_LOOT_METHOD_CHANGED = <func> @oUF\\elements\\masterlooter.lua:73\n PLAYER_ENTERING_WORLD = <func> @oUF\\ouf.lua:149\n Leader = <unnamed> {}\n UNIT_SPELLCAST_CHANNEL_START = <func> @oUF\\elements\\castbar.lua:256\n Resting = <unnamed> {}\n UNIT_HEALTH_FREQUENT = <func> @oUF\\elements\\health.lua:145\n UNIT_MAXHEALTH = <func> @oUF\\elements\\health.lua:145\n __elements = <table> {}\n UNIT_POWER_FREQUENT = <func> @oUF\\elements\\power.lua:189\n Castbar = oUF_Castbarplayer {}\n HolyPower = <unnamed> {}\n UNIT_SPELLCAST_NOT_INTERRUPTIBLE = <func> @oUF\\elements\\castbar.lua:204\n PLAYER_REGEN_DISABLED = <func> @oUF\\elements\\combat.lua:52\n SmoothBar = <func> @oUF_Qulight\\Plugins\\Smooth.lua:15\n Health = <unnamed> {}\n PLAYER_REGEN_ENABLED = <func> @oUF\\elements\\combat.lua:52\n UNIT_SPELLCAST_CHANNEL_STOP = <func> @oUF\\elements\\castbar.lua:332\n UNIT_SPELLCAST_CHANNEL_UPDATE = <func> @oUF\\elements\\castbar.lua:309\n UNIT_EXITED_VEHICLE = <func> @oUF\\ouf.lua:38\n UNIT_SPELLCAST_DELAYED = <func> @oUF\\elements\\castbar.lua:218\n UNIT_CONNECTION = <table> {}\n Debuffs = <unnamed> {}\n Portrait = <unnamed> {}\n UNIT_POWER = <func> @oUF\\elements\\holypower.lua:29\n UNIT_SPELLCAST_INTERRUPTIBLE = <func> @oUF\\elements\\castbar.lua:190\n UNIT_SPELLCAST_INTERRUPTED = <func> @oUF\\elements\\castbar.lua:172\n UNIT_SPELLCAST_START = <func> @oUF\\elements\\castbar.lua:104\n unit = \"player\"\n GROUP_ROSTER_UPDATE = <table> {}\n UNIT_SPELLCAST_STOP = <func> @oUF\\elements\\castbar.lua:238\n UNIT_SPELLCAST_FAILED = <func> @oUF\\elements\\castbar.lua:154\n PARTY_LEADER_CHANGED = <func> @oUF\\elements\\leader.lua:53\n PLAYER_UPDATE_RESTING = <func> @oUF\\elements\\resting.lua:52\n RaidIcon = <unnamed> {}\n UNIT_AURA = <func> @oUF\\elements\\aura.lua:314\n RAID_TARGET_UPDATE = <func> @oUF\\elements\\ricons.lua:58\n MasterLooter = <unnamed> {}\n UNIT_ENTERED_VEHICLE = <func> @oUF\\ouf.lua:38\n UNIT_MAXPOWER = <func> @oUF\\elements\\power.lua:189\n Assistant = <unnamed> {}\n Highlight = <unnamed> {}\n __tags = <table> {}\n UNIT_FACTION = <table> {}\n mystyle = \"player\"\n UNIT_SPELLCAST_SENT = <func> @oUF_Qulight\\castbar.lua:78\n UNIT_DISPLAYPOWER = <func> @oUF\\elements\\power.lua:189\n menu = <func> @oUF_Qulight\\lib.lua:228\n style = \"Player\"\n UNIT_POWER_BAR_SHOW = <func> @oUF\\elements\\power.lua:189\n UNIT_POWER_BAR_HIDE = <func> @oUF\\elements\\power.lua:189\n Power = <unnamed> {}\n UNIT_MODEL_CHANGED = <func> @oUF\\elements\\portraits.lua:75\n}\nevent = \"PLAYER_ENTERING_WORLD\"\nunit = \"player\"\nspell = nil\ncastbar = oUF_Castbarplayer {\n 0 = <userdata>\n PostCastStop = <func> @oUF_Qulight\\castbar.lua:107\n CastingColor = <table> {}\n ChannelingColor = <table> {}\n Time = <unnamed> {}\n interrupt = false\n casting = true\n delay = 0\n OnUpdate = <func> @oUF_Qulight\\castbar.lua:44\n duration = 0.083999999995285\n FailColor = <table> {}\n castid = 214\n CompleteColor = <table> {}\n SafeZone = <unnamed> {}\n max = 1.5\n Text = <unnamed> {}\n Icon = <unnamed> {}\n PostCastStart = <function>",
			["stack"] = "oUF_Qulight-0.1 beta\\castbar.lua:90: in function \"PostCastStart\"\noUF-1.6.0\\elements\\castbar.lua:149: in function <oUF\\elements\\castbar.lua:104>\noUF-1.6.0\\elements\\castbar.lua:426: in function \"func\"\noUF-1.6.0\\ouf-1.6.0.lua:158: in function \"?\"\noUF-1.6.0\\events.lua:76: in function <oUF\\events.lua:62>",
			["session"] = 42,
			["counter"] = 1,
		}, -- [5]
	},
}
