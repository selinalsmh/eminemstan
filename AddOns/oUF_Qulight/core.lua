local addon, ns = ...
local cfg = ns.cfg
local lib = ns.lib
oUF.colors.smooth = {.7, .15, .15, .85, .8, .45, .15, .15, .15}
  
-----------------------------
-- STYLE FUNCTIONS
-----------------------------
local BarFader = function(self)
     if not cfg.fade then return end
	self.BarFade = true
	self.BarFaderMinAlpha = "0"
end
local function CreatePlayerStyle(self, unit, isSingle)
	self.mystyle = "player"
	lib.init(self)
	BarFader(self)
	self.scale = cfg.scale
	self:SetSize(230, 42)
	lib.gen_hpbar(self)
	lib.gen_hpstrings(self)
	lib.gen_highlight(self)
	lib.gen_ppbar(self)
	lib.gen_RaidMark(self)
	lib.createDebuffs(self)
	if cfg.showPlayerAuras then
		BuffFrame:Hide()
		lib.createBuffs(self)
		lib.createDebuffs(self)
		lib.gen_WeaponEnchant(self)
	end
	self.Health.frequentUpdates = true
	self.Health.Smooth = true
	self.Power.colorClass = true
	self.Power.frequentUpdates = true
	self.Power.Smooth = true
	self.Power.bg.multiplier = 0.5
	lib.gen_castbar(self)
	lib.gen_InfoIcons(self)
	lib.gen_InfoIcons2(self)
	lib.TotemBars(self)
	lib.Experience(self)
	lib.Reputation(self)
	--lib.AltPowerBar(self)
	if cfg.showPortrait then lib.gen_portrait(self) end
	if cfg.showRunebar then lib.genRunes(self) end
	if cfg.showHolybar then lib.genHolyPower(self) end
	if cfg.showHarmonyBar then lib.addHarmony(self) end
	if cfg.showShardbar then lib.genShards(self) end
	if cfg.showEclipsebar then lib.addEclipseBar(self) end
	if cfg.showShadowOrbsBar then lib.ShadowOrbsBar(self) end
end
local function CreateTargetStyle(self, unit, isSingle)
	self.mystyle = "target"
	lib.init(self)
	self.scale = cfg.scale
	self:SetSize(230,42)
	lib.gen_hpbar(self)
	lib.gen_hpstrings(self)
	lib.gen_highlight(self)
	lib.gen_ppbar(self)
	lib.gen_RaidMark(self)
	self.Health.frequentUpdates = false
	self.Health.Smooth = true
	self.Power.colorTapping = true
	self.Power.colorDisconnected = true
	self.Power.colorHappiness = false
	self.Power.colorClass = true
	self.Power.colorReaction = true
	self.Power.Smooth = true
	self.Power.colorClass = true
	self.Power.bg.multiplier = 0.5
	lib.gen_castbar(self)
	lib.gen_mirrorcb(self)
	lib.addQuestIcon(self)
	lib.createAuras(self)
 	lib.genCPoints(self)
	--lib.FocusText(self)
	if cfg.showPortrait then lib.gen_portrait(self) end
end
local function CreateFocusStyle(self, unit, isSingle)
	
		self.mystyle = "focus"
		lib.init(self)
		-- Size and Scale
		self.scale = cfg.scale
		self:SetSize(160, 34)
		
		
		-- Generate Bars
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		
		lib.gen_ppbar(self)
		self.Power.colorTapping = true
		self.Power.colorDisconnected = true
		self.Power.colorHappiness = false
		self.Power.colorClass = true
		self.Power.Smooth = true
		self.Power.colorReaction = true
		self.Power.colorHealth = true
		self.Power.bg.multiplier = 0.5
		
		lib.gen_RaidMark(self)
		if cfg.showPortrait then lib.gen_portrait(self) end
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
	
		lib.gen_castbar(self)
		lib.createAuras(self)
		--lib.ClearFocusText(self)
end
local function CreateToTStyle(self, unit, isSingle)

		self.mystyle = "tot"
		lib.init(self)
		-- Size and Scale
		self.scale = cfg.scale
		self:SetSize(100, 32)

		-- Generate Bars
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_RaidMark(self)
		lib.createAuras(self)
		--style specific stuff
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
		--self.Health.bg.multiplier = 0.3
	

end	
local function CreateFocusTargetStyle(self, unit, isSingle)
		
		self.mystyle = "focustarget"
		lib.init(self)
		-- Size and Scale
		self.scale = cfg.scale
		self:SetSize(100, 32)

		-- Generate Bars
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_RaidMark(self)
		
		--style specific stuff
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
		--self.Health.bg.multiplier = 0.3	
end
local function CreatePetStyle(self, unit, isSingle)
		local _, playerClass = UnitClass("player")
		
		self.mystyle = "pet"
		lib.init(self)
		-- Size and Scale
		self.scale = cfg.scale
		self:SetSize(100,32)

		-- Generate Bars
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_RaidMark(self)
		self:SetParent("oUF_Player")  --跟自己头像一起隐藏
		--style specific stuff
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
		--self.Health.bg.multiplier = 0.3

		-- Hunter Pet Hapiness
		if PlayerClass == "HUNTER" then
			self.Power.colorReaction = false
			self.Power.colorClass = false
			self.Power.colorHappiness = true
		end
end
local function CreateBossStyle(self, unit, isSingle)
	self.mystyle = "boss"
	self:SetSize(150,30)
	lib.gen_hpbar(self)
	lib.gen_hpstrings(self)
	lib.gen_highlight(self)
	lib.gen_RaidMark(self)
	lib.gen_ppbar(self)
	self.Power.colorTapping = true
	self.Power.colorDisconnected = true
	self.Power.colorClass = true
	self.Power.Smooth = true
	self.Power.colorReaction = true
	self.Power.colorHealth = true
	self.Power.bg.multiplier = 0.5
	lib.createAuraWatch(self)
	lib.gen_castbar(self)
	lib.AltPowerBar(self)
	lib.createBuffs(self)
	self.Health.frequentUpdates = false
	self.Health.Smooth = true
end
local function CreateMTStyle(self)
		-- unit specifics
		self.mystyle = "oUF_MT"
		
		-- Size and Scale
		self:SetSize(80, 22)

		-- Generate Bars
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_RaidMark(self)
		
		--style specific stuff
		self.Health.frequentUpdates = false
		self.Health.Smooth = true
		--self.Health.bg.multiplier = 0.3
end
local function CreateRaidStyle(self)
				
		self.mystyle = "raid"
		
		-- Size and Scale
		self.scale = cfg.scale
		
		self.Range = {
			insideAlpha = 1,
			outsideAlpha = .3,
		}
		
		if cfg.HealFrames then
		lib.gen_ppbar(self)
		self.Power.colorTapping = true
		self.Power.colorDisconnected = true
		self.Power.colorHappiness = false
		self.Power.colorClass = true
		self.Power.colorReaction = true
		self.Power.Smooth = true
		self.Power.colorClass = true
		self.Power.bg.multiplier = 0.5
		end
		-- Generate Bars
		lib.gen_hpbar(self)
		lib.gen_hpstrings(self)
		lib.gen_highlight(self)
		lib.gen_RaidMark(self)
		lib.ReadyCheck(self)

		--style specific stuff
		self.Health.frequentUpdates = true
		self.Health.Smooth = true
		self.Health.colorSmooth = true
		

		lib.CreateTargetBorder(self)
		lib.CreateThreatBorder(self)
		lib.debuffHighlight(self)
		lib.raidDebuffs(self)
		lib.gen_InfoIcons(self)
		lib.createAuraWatch(self)
		lib.createIndicators(self, unit)	
		lib.healcomm(self, unit)
		
		self.Health.PostUpdate = lib.PostUpdateRaidFrame
		self:RegisterEvent('PLAYER_TARGET_CHANGED', lib.ChangedTarget)
		self:RegisterEvent('RAID_ROSTER_UPDATE', lib.ChangedTarget)
		self:RegisterEvent("UNIT_THREAT_LIST_UPDATE", lib.UpdateThreat)
		self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE", lib.UpdateThreat)
	
end
 
-----------------------------
-- SPAWN UNITS
-----------------------------

oUF:RegisterStyle("Player", CreatePlayerStyle)
oUF:RegisterStyle("Target", CreateTargetStyle)
oUF:RegisterStyle("ToT", CreateToTStyle)
oUF:RegisterStyle("Focus", CreateFocusStyle)
oUF:RegisterStyle("FocusTarget", CreateFocusTargetStyle)
oUF:RegisterStyle("Pet", CreatePetStyle)
oUF:RegisterStyle("Boss", CreateBossStyle)
oUF:RegisterStyle("Raid", CreateRaidStyle)
oUF:RegisterStyle("oUF_MT", CreateMTStyle)

oUF:Factory(function(self)
	if cfg.HealFrames then
	self:SetActiveStyle("Player")
	local player = self:Spawn("player", "oUF_Player")
	player:SetPoint("TOPRIGHT", UIParent, "BOTTOM", cfg.playerx, cfg.playery+50)
	self:SetActiveStyle("Target")
	local target = self:Spawn("Target", "oUF_Target")
	target:SetPoint("TOPLEFT", UIParent, "BOTTOM", cfg.targetx, cfg.targety+50)
	if cfg.showtot then
		self:SetActiveStyle("ToT")
		local targettarget = self:Spawn("targettarget", "oUF_tot")
		targettarget:SetPoint("RIGHT", oUF_Target, "RIGHT", 180, 0) 
	end
	if cfg.showpet then
		self:SetActiveStyle("Pet")
		local pet = self:Spawn("pet", "oUF_pet")
		pet:SetPoint("TOPRIGHT", UIParent, "BOTTOM", cfg.petx, cfg.pety+50) 
	end
	if cfg.showfocus then 
		self:SetActiveStyle("Focus")
		local focus = self:Spawn("focus", "oUF_focus")
		focus:SetPoint("BOTTOMLEFT", cfg.focusx, cfg.focusy+50) 
	end
	if cfg.showfocustarget then 
		self:SetActiveStyle("FocusTarget")
		local focustarget = self:Spawn("focustarget", "oUF_focustarget")
		focustarget:SetPoint("RIGHT", oUF_focus, "RIGHT", 140, 0)
	end
	
	else
	
	self:SetActiveStyle("Player")
	local player = self:Spawn("player", "oUF_Player")
	player:SetPoint("TOPRIGHT", UIParent, "BOTTOM", cfg.playerx, cfg.playery)
	self:SetActiveStyle("Target")
	local target = self:Spawn("Target", "oUF_Target")
	target:SetPoint("TOPLEFT", UIParent, "BOTTOM", cfg.targetx, cfg.targety)
	if cfg.showtot then
		self:SetActiveStyle("ToT")
		local targettarget = self:Spawn("targettarget", "oUF_tot")
		targettarget:SetPoint("RIGHT", oUF_Target, "RIGHT", 150,0) 
	end
	if cfg.showpet then
		self:SetActiveStyle("Pet")
		local pet = self:Spawn("pet", "oUF_pet")
		pet:SetPoint("TOPRIGHT", UIParent, "BOTTOM", cfg.petx, cfg.pety) 
	end
	if cfg.showfocus then 
		self:SetActiveStyle("Focus")
		local focus = self:Spawn("focus", "oUF_focus")
		focus:SetPoint("BOTTOMLEFT", cfg.focusx, cfg.focusy)
	end
	if cfg.showfocustarget then 
		self:SetActiveStyle("FocusTarget")
		local focustarget = self:Spawn("focustarget", "oUF_focustarget")
		focustarget:SetPoint("LEFT", oUF_focus, "RIGHT", 8, -3)
	end
	end
	if cfg.MTFrames then
		oUF:SetActiveStyle("oUF_MT")
		local tank = oUF:SpawnHeader('oUF_MT', nil, 'raid',
			'oUF-initialConfigFunction', ([[
				self:SetWidth(%d)
				self:SetHeight(%d)
			]]):format(100, 25),
			'showRaid', true,
			'groupFilter', 'MAINTANK',
			'yOffset', 3,
			'point' , 'BOTTOM',
			'template', 'oUF_MainTank'
			)
		tank:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 10, -230)
    end
  	if cfg.showBossFrames then
		self:SetActiveStyle("Boss")
		local boss = {}
			for i = 1, MAX_BOSS_FRAMES do
				boss[i] = self:Spawn("boss"..i, "oUF_Boss"..i)
				if i == 1 then
					boss[i]:SetPoint("RIGHT", UIParent, "RIGHT", -100, -90)
				else
					boss[i]:SetPoint("BOTTOMRIGHT", boss[i-1], "BOTTOMRIGHT", 0, 59)
			end
		end
	end
	if cfg.HealFrames then
	if cfg.ShowRaid then
		CompactRaidFrameContainer:UnregisterAllEvents()
		CompactRaidFrameContainer:Hide() 
		CompactRaidFrameManager:UnregisterAllEvents()
		CompactRaidFrameManager:Hide()
		self:SetActiveStyle("Raid")
		local maxGroups = 5
		if cfg.RaidShowAllGroups then maxGroups = 8 end
		local raid = oUF:SpawnHeader("oUF_Raid", nil, "solo,party,raid", 
		"showRaid", true,  
		"showPlayer", true,
		"showSolo", cfg.RaidShowSolo,
		"showParty", cfg.ShowParty,
		"xoffset", 7,
		"yOffset", 10,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"sortMethod", "INDEX",
		"maxColumns", 5,
		"unitsPerColumn", 5,
		"columnSpacing", 15,
		"point", "LEFT",
		"columnAnchorPoint", "BOTTOM",
		"oUF-initialConfigFunction", ([[
		self:SetWidth(%d)
		self:SetHeight(%d)
		]]):format(70, 25))
		raid:SetPoint("BOTTOM", UIParent, 0, 158)
	end
	else
	if cfg.ShowRaid then
		CompactRaidFrameContainer:UnregisterAllEvents()
		CompactRaidFrameContainer:Hide() 
		CompactRaidFrameManager:UnregisterAllEvents()
		CompactRaidFrameManager:Hide()
		self:SetActiveStyle("Raid")
		local maxGroups = 5
		if cfg.RaidShowAllGroups then maxGroups = 8 end
		local raid = oUF:SpawnHeader("oUF_Raid", nil, "solo,party,raid", 
		"showRaid", true,  
		"showPlayer", true,
		"showSolo", cfg.RaidShowSolo,
		"showParty", cfg.ShowParty,
		"xoffset", 7,
		"yOffset", 10,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"sortMethod", "INDEX",
		"maxColumns", maxGroups,
		"unitsPerColumn", 5,
		"columnSpacing", 15,
		"point", "BOTTOM",
		"columnAnchorPoint", "LEFT",
		"oUF-initialConfigFunction", ([[
		self:SetWidth(%d)
		self:SetHeight(%d)
		]]):format(60, 30))
		raid:SetPoint("LEFT", UIParent, -80, -10)
	end
	end
end)
local testui = TestUI or function() end
TestUI = function()
	testui()
	UnitAura = function()
		-- name, rank, texture, count, dtype, duration, timeLeft, caster
		return 'penancelol', 'Rank 2', 'Interface\\Icons\\Spell_Holy_Penance', random(5), 'Magic', 0, 0, "player"
	end
	if(oUF) then
		for i, v in pairs(oUF.units) do
			if(v.UNIT_AURA) then
				v:UNIT_AURA("UNIT_AURA", v.unit)
			end
		end
	end
end
SlashCmdList.TestUI = TestUI
SLASH_TestUI1 = "/testui"
do
	-- UnitPopupMenus["SELF"] = {  "LOOT_METHOD", "LOOT_THRESHOLD", "OPT_OUT_LOOT_TITLE", "LOOT_PROMOTE", "DUNGEON_DIFFICULTY", "RAID_DIFFICULTY", "RESET_INSTANCES", "RAID_TARGET_ICON", "SELECT_ROLE", "LEAVE", "CANCEL" };
	-- UnitPopupMenus["PET"] = { "PET_PAPERDOLL", "PET_RENAME", "PET_ABANDON", "PET_DISMISS", "CANCEL" };
	-- UnitPopupMenus["PARTY"] = { "MUTE", "UNMUTE", "PARTY_SILENCE", "PARTY_UNSILENCE", "RAID_SILENCE", "RAID_UNSILENCE", "BATTLEGROUND_SILENCE", "BATTLEGROUND_UNSILENCE", "WHISPER", "PROMOTE", "PROMOTE_GUIDE", "LOOT_PROMOTE", "VOTE_TO_KICK", "UNINVITE", "INSPECT", "ACHIEVEMENTS", "TRADE", "FOLLOW", "DUEL", "RAID_TARGET_ICON", "SELECT_ROLE", "PVP_REPORT_AFK", "RAF_SUMMON", "RAF_GRANT_LEVEL", "CANCEL" }
	-- UnitPopupMenus["RAID_PLAYER"] = { "MUTE", "UNMUTE", "RAID_SILENCE", "RAID_UNSILENCE", "BATTLEGROUND_SILENCE", "BATTLEGROUND_UNSILENCE", "WHISPER", "INSPECT", "ACHIEVEMENTS", "TRADE", "FOLLOW", "DUEL", "RAID_TARGET_ICON", "SELECT_ROLE", "RAID_LEADER", "RAID_PROMOTE", "RAID_DEMOTE", "LOOT_PROMOTE", "VOTE_TO_KICK", "RAID_REMOVE", "PVP_REPORT_AFK", "RAF_SUMMON", "RAF_GRANT_LEVEL", "REPORT_PLAYER", "CANCEL" };
	-- UnitPopupMenus["PLAYER"] = { "WHISPER", "INSPECT", "INVITE", "ACHIEVEMENTS", "TRADE", "FOLLOW", "DUEL", "RAID_TARGET_ICON", "RAF_SUMMON", "RAF_GRANT_LEVEL", "CANCEL" }
	-- UnitPopupMenus["VEHICLE"] = { "RAID_TARGET_ICON", "VEHICLE_LEAVE", "CANCEL" }
	-- UnitPopupMenus["TARGET"] = { "RAID_TARGET_ICON", "CANCEL" }
	-- UnitPopupMenus["ARENAENEMY"] = { "CANCEL" }
	-- UnitPopupMenus["FOCUS"] = { "RAID_TARGET_ICON", "CANCEL" }
	UnitPopupMenus["BOSS"] = { "RAID_TARGET_ICON", "CANCEL" }
end