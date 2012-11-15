LUIMicroMenu = LibStub("AceAddon-3.0"):NewAddon("LUIMicroMenu","AceEvent-3.0")

local Xpos = -10
local Ypos = 10

local version = 1.5
local _, class = UnitClass("player")
local micromenu = {RAID_CLASS_COLORS[class].r, RAID_CLASS_COLORS[class].g, RAID_CLASS_COLORS[class].b}
local micromenu_bg = {RAID_CLASS_COLORS[class].r, RAID_CLASS_COLORS[class].g, RAID_CLASS_COLORS[class].b}


local fdir = "Interface\\AddOns\\MicroMenu\\media\\"

MicroMenu = {Buttons = {}}



function LUIMicroMenu:SetMicroMenuPosition()

	MicroMenu.Button:ClearAllPoints()
	MicroMenu.Button:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", Xpos, Ypos)
end

function LUIMicroMenu:SetColors()
	
	local r, g, b = unpack(micromenu)
	local rc, gc, bc, ac = unpack(micromenu_bg)

	MicroMenu.Button:SetBackdropColor(rc, gc, bc, ac)

	MicroMenu.Buttons.Bags:SetBackdropColor(r, g, b, 1)
	MicroMenu.Buttons.Settings:SetBackdropColor(r, g, b, 1)
	MicroMenu.Buttons.GM:SetBackdropColor(r, g, b, 1)
	MicroMenu.Buttons.Pets:SetBackdropColor(r, g, b, 1)
	MicroMenu.Buttons.LFG:SetBackdropColor(r, g, b, 1)
	MicroMenu.Buttons.Journal:SetBackdropColor(r, g, b, 1)
	MicroMenu.Buttons.PVP:SetBackdropColor(r, g, b, 1)
	MicroMenu.Buttons.Guild:SetBackdropColor(r, g, b, 1)
	MicroMenu.Buttons.Quests:SetBackdropColor(r, g, b, 1)
	MicroMenu.Buttons.AC:SetBackdropColor(r, g, b, 1)
	MicroMenu.Buttons.Talents:SetBackdropColor(r, g, b, 1)
	MicroMenu.Buttons.Spellbook:SetBackdropColor(r, g, b, 1)
	MicroMenu.Buttons.Player:SetBackdropColor(r, g, b, 1)

	-- talent alert frame
	TalentMicroButtonAlertBg:SetGradientAlpha("VERTICAL", r/4, g/4, b/4, 1, 0, 0, 0, 1)
	TalentMicroButtonAlertGlow:SetVertexColor(r, g, b, 0.5)
	TalentMicroButtonAlertGlowTopLeft:SetVertexColor(r, g, b)
	TalentMicroButtonAlertGlowTopRight:SetVertexColor(r, g, b)
	TalentMicroButtonAlertGlowBottomLeft:SetVertexColor(r, g, b)
	TalentMicroButtonAlertGlowBottomRight:SetVertexColor(r, g, b)

	TalentMicroButtonAlertGlowTop:SetVertexColor(r, g, b)
	TalentMicroButtonAlertGlowBottom:SetVertexColor(r, g, b)
	TalentMicroButtonAlertGlowLeft:SetVertexColor(r, g, b)
	TalentMicroButtonAlertGlowRight:SetVertexColor(r, g, b)

end
function LUIMicroMenu:CreateMeAFrame(fart,fname,fparent,fwidth,fheight,fscale,fstrata,flevel,fpoint,frelativeFrame,frelativePoint,fofsx,fofsy,falpha,finherit)
	local f = CreateFrame(fart,fname,fparent,finherit)
	local sw = fwidth*0.8
	local sh = fheight*0.8
	local sx = fofsx*0.8
	local sy = fofsy*0.8
	f:SetWidth(sw)
	f:SetHeight(sh)
	--f:SetScale(fscale)
	f:SetFrameStrata(fstrata)
	f:SetFrameLevel(flevel)
	f:SetPoint(fpoint,frelativeFrame,frelativePoint,sx,sy)
	f:SetAlpha(falpha)
	return f
end

function LUIMicroMenu:SetMicroMenu()
  	local micro_r, micro_g, micro_b = unpack(micromenu) 	
	
	MicroMenu.Button = LUIMicroMenu:CreateMeAFrame("Frame", nil, UIParent, 590, 512, 1, "BACKGROUND", 1, "TOPRIGHT", UIParent, "TOPRIGHT", 0, -1, 1)
	MicroMenu.Button:SetBackdrop({
		bgFile = fdir.."micro_button",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Button:SetBackdropColor(unpack(micromenu_bg))
	MicroMenu.Button:SetBackdropBorderColor(0, 0, 0, 0)


	MicroMenu.AlphaOut = CreateFrame("Frame", nil, UIParent)
	MicroMenu.AlphaOut:Hide()
	MicroMenu.AlphaOut.timer = 0
	MicroMenu.AlphaOut:SetScript("OnUpdate", function(self, elapsed)
		self.timer = self.timer + elapsed
		if self.timer < .5 then
			MicroMenu.Button:SetAlpha(1 - self.timer / .5)
		else
			MicroMenu.Button:SetAlpha(0)
			MicroMenu.Button:Hide()
			self.timer = 0
			self:Hide()
		end
	end)

	MicroMenu.AlphaIn = CreateFrame("Frame", nil, UIParent)
	MicroMenu.AlphaIn:Hide()
	MicroMenu.AlphaIn.timer = 0
	MicroMenu.AlphaIn:SetScript("OnUpdate", function(self, elapsed)
		MicroMenu.Button:Show()
		self.timer = self.timer + elapsed
		if self.timer < .5 then
			MicroMenu.Button:SetAlpha(self.timer / .5)
		else
			MicroMenu.Button:SetAlpha(1)
			self.timer = 0
			self:Hide()
		end
	end)

	--------------------------------------
	-- MICRO MENU
	--------------------------------------

	local bagsFrame
	local getBagsFrame = function()
		if IsAddOnLoaded("Stuffing") then
			bagsFrame = StuffingFrameBags
		elseif IsAddOnLoaded("Bagnon") then
			bagsFrame = BagnonFrameinventory
		elseif IsAddOnLoaded("ArkInventory") then
			bagsFrame = ARKINV_Frame1
		elseif IsAddOnLoaded("OneBag") then
			bagsFrame = OneBagFrame
		else
			bagsFrame = nil
		end
	end
	getBagsFrame()

	MicroMenu.Buttons.Bags = LUIMicroMenu:CreateMeAFrame("Frame", nil, MicroMenu.Button, 64, 64, 1, "BACKGROUND", 3, "TOPRIGHT", MicroMenu.Button, "TOPRIGHT", 0, 0, 1)
	MicroMenu.Buttons.Bags:SetBackdrop({
		bgFile = fdir.."micro_bags",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0,
		edgeSize = 1, insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Bags:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	MicroMenu.Buttons.Bags:SetBackdropBorderColor(0, 0, 0, 0)

	MicroMenu.Buttons.Bags.Clicker = LUIMicroMenu:CreateMeAFrame("Button", nil, MicroMenu.Buttons.Bags, 42, 25, 1, "BACKGROUND", 2, "CENTER", MicroMenu.Buttons.Bags, "CENTER", -8, 0, 1)
	MicroMenu.Buttons.Bags.Clicker:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Bags.Clicker:SetBackdropColor(0, 0, 0, 1)
	MicroMenu.Buttons.Bags.Clicker:SetBackdropBorderColor(0, 0, 0, 0)
	MicroMenu.Buttons.Bags.Clicker:SetAlpha(0)

	MicroMenu.Buttons.Bags.Clicker:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
		self.State = true
		GameTooltip:SetOwner(self, "ANCHOR_NONE ", 40, -60)
		GameTooltip:SetText("背包")
		GameTooltip:Show()
	end)

	MicroMenu.Buttons.Bags.Clicker:SetScript("OnLeave", function(self)
		getBagsFrame()
		if bagsFrame and not bagsFrame:IsShown() then
			self:SetAlpha(0)
		end
		self.State = nil
		GameTooltip:Hide()
	end)

	MicroMenu.Buttons.Bags.Clicker:SetScript("OnClick", function(self)
		ToggleBackpack()
	end)

	MicroMenu.Buttons.Bags.Clicker:SetScript("OnUpdate", function(self)
		if (bagsFrame and bagsFrame:IsShown()) or self.State then
			self:SetAlpha(1)
		else
			self:SetAlpha(0)
		end
	end)

	MicroMenu.Buttons.Settings = LUIMicroMenu:CreateMeAFrame("Frame", nil, MicroMenu.Buttons.Bags, 64, 64, 1, "BACKGROUND", 3, "LEFT", MicroMenu.Buttons.Bags, "LEFT", -48, 0, 1)
	MicroMenu.Buttons.Settings:SetBackdrop({
		bgFile = fdir.."micro_settings",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Settings:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	MicroMenu.Buttons.Settings:SetBackdropBorderColor(0, 0, 0, 0)

	MicroMenu.Buttons.Settings.Clicker = LUIMicroMenu:CreateMeAFrame("Button", nil, MicroMenu.Buttons.Settings, 30, 25, 1, "BACKGROUND", 2, "CENTER", MicroMenu.Buttons.Settings, "CENTER", -2, 0, 1)
	MicroMenu.Buttons.Settings.Clicker:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Settings.Clicker:SetBackdropColor(0, 0, 0, 1)
	MicroMenu.Buttons.Settings.Clicker:SetBackdropBorderColor(0, 0, 0, 0)
	MicroMenu.Buttons.Settings.Clicker:SetAlpha(0)

	MicroMenu.Buttons.Settings.Clicker:RegisterForClicks("AnyUp")

	MicroMenu.Buttons.Settings.Clicker:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
		self.State = true
		GameTooltip:SetOwner(self, "ANCHOR_NONE " ,40, -60)
		GameTooltip:SetText("主菜单")
		GameTooltip:Show()
	end)

	MicroMenu.Buttons.Settings.Clicker:SetScript("OnLeave", function(self)
		self:SetAlpha(0)
		self.State = nil
		GameTooltip:Hide()
	end)

	MicroMenu.Buttons.Settings.Clicker:SetScript("OnClick", function(self, button)
			if GameMenuFrame:IsShown() then
				HideUIPanel(GameMenuFrame)
			else
				ShowUIPanel(GameMenuFrame)
			end
	end)

	MicroMenu.Buttons.Settings.Clicker:SetScript("OnUpdate", function(self)
		if self.State then return end
		if GameMenuFrame:IsShown() or self.State then
			self:SetAlpha(1)
		else
			self:SetAlpha(0)
		end
	end)

	MicroMenu.Buttons.GM = LUIMicroMenu:CreateMeAFrame("Frame", nil, MicroMenu.Buttons.Settings, 64, 64, 1, "BACKGROUND", 3, "LEFT", MicroMenu.Buttons.Settings, "LEFT", -33, 0, 1)
	MicroMenu.Buttons.GM:SetBackdrop({
		bgFile = fdir.."micro_gm",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.GM:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	MicroMenu.Buttons.GM:SetBackdropBorderColor(0, 0, 0, 0)

	MicroMenu.Buttons.GM.Clicker = LUIMicroMenu:CreateMeAFrame("Button", nil, MicroMenu.Buttons.GM, 30, 25, 1, "BACKGROUND", 2, "CENTER", MicroMenu.Buttons.GM, "CENTER", -2, 0, 1)
	MicroMenu.Buttons.GM.Clicker:SetBackdrop({bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.GM.Clicker:SetBackdropColor(0, 0, 0, 1)
	MicroMenu.Buttons.GM.Clicker:SetBackdropBorderColor(0, 0, 0, 0)
	MicroMenu.Buttons.GM.Clicker:SetAlpha(0)

	MicroMenu.Buttons.GM.Clicker:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
		self.State = true
		GameTooltip:SetOwner(self, "ANCHOR_NONE " ,40, -60)
		GameTooltip:SetText("帮助")
		GameTooltip:Show()
	end)

	MicroMenu.Buttons.GM.Clicker:SetScript("OnLeave", function(self)
		if not HelpFrame:IsShown() then
			self:SetAlpha(0)
		end
		self.State = nil
		GameTooltip:Hide()
	end)

	MicroMenu.Buttons.GM.Clicker:SetScript("OnClick", function(self)
		ToggleHelpFrame()
	end)

	HelpFrame:HookScript("OnShow", function(self)
		MicroMenu.Buttons.GM.Clicker:SetAlpha(1)
	end)

	HelpFrame:HookScript("OnHide", function(self)
		if not MicroMenu.Buttons.GM.Clicker.State then
			MicroMenu.Buttons.GM.Clicker:SetAlpha(0)
		end
	end)

	MicroMenu.Buttons.Pets = LUIMicroMenu:CreateMeAFrame("Frame", nil, MicroMenu.Buttons.GM, 64, 64, 1, "BACKGROUND", 3, "LEFT", MicroMenu.Buttons.GM, "LEFT", -33, 0, 1)
	MicroMenu.Buttons.Pets:SetBackdrop({
		bgFile = fdir.."micro_pets",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Pets:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	MicroMenu.Buttons.Pets:SetBackdropBorderColor(0, 0, 0, 0)

	MicroMenu.Buttons.Pets.Clicker = LUIMicroMenu:CreateMeAFrame("Button", nil, MicroMenu.Buttons.Pets, 30, 25, 1, "BACKGROUND", 2, "CENTER", MicroMenu.Buttons.Pets, "CENTER", -2, 0, 1)
	MicroMenu.Buttons.Pets.Clicker:SetBackdrop({bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Pets.Clicker:SetBackdropColor(0, 0, 0, 1)
	MicroMenu.Buttons.Pets.Clicker:SetBackdropBorderColor(0, 0, 0, 0)
	MicroMenu.Buttons.Pets.Clicker:SetAlpha(0)

	MicroMenu.Buttons.Pets.Clicker:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
		self.State = true
		GameTooltip:SetOwner(self, "ANCHOR_NONE " ,40, -60)
		GameTooltip:SetText("坐骑/宠物")
		GameTooltip:Show()
	end)

	MicroMenu.Buttons.Pets.Clicker:SetScript("OnLeave", function(self)
		if not HelpFrame:IsShown() then
			self:SetAlpha(0)
		end
		self.State = nil
		GameTooltip:Hide()
	end)

	MicroMenu.Buttons.Pets.Clicker:SetScript("OnClick", function(self)
		TogglePetJournal()
	end)
	
	LUIMicroMenu:RegisterEvent("ADDON_LOADED", function(event)
		if event and not IsAddOnLoaded("Blizzard_PetJournal") then return end
		if event then LUIMicroMenu:UnregisterEvent(event) end

		PetJournalParent:HookScript("OnShow", function(self)
			MicroMenu.Buttons.Pets.Clicker:SetAlpha(1)
		end)

		PetJournalParent:HookScript("OnHide", function(self)
			if not MicroMenu.Buttons.Pets.Clicker.State then
				MicroMenu.Buttons.Pets.Clicker:SetAlpha(0)
			end
		end)
	end)

	MicroMenu.Buttons.LFG = LUIMicroMenu:CreateMeAFrame("Frame", nil, MicroMenu.Buttons.Pets, 64, 64, 1, "BACKGROUND", 3, "LEFT", MicroMenu.Buttons.Pets, "LEFT", -33, 0, 1)
	MicroMenu.Buttons.LFG:SetBackdrop({
		bgFile = fdir.."micro_lfg",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.LFG:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	MicroMenu.Buttons.LFG:SetBackdropBorderColor(0, 0, 0, 0)

	MicroMenu.Buttons.LFG.Clicker = LUIMicroMenu:CreateMeAFrame("Button", nil, MicroMenu.Buttons.LFG, 30, 25, 1, "BACKGROUND", 2, "CENTER", MicroMenu.Buttons.LFG, "CENTER", -2, 0, 1)
	MicroMenu.Buttons.LFG.Clicker:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.LFG.Clicker:SetBackdropColor(0, 0, 0, 1)
	MicroMenu.Buttons.LFG.Clicker:SetBackdropBorderColor(0, 0, 0, 0)
	MicroMenu.Buttons.LFG.Clicker:SetAlpha(0)

	MicroMenu.Buttons.LFG.Clicker:RegisterForClicks("AnyUp")

	MicroMenu.Buttons.LFG.Clicker:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
		self.State = true
		GameTooltip:SetOwner(self, "ANCHOR_NONE ", 40, -60)
		GameTooltip:SetText("地下城查找器")
		GameTooltip:Show()
	end)

	MicroMenu.Buttons.LFG.Clicker:SetScript("OnLeave", function(self)
		if not LFDParentFrame:IsShown() and not RaidParentFrame:IsShown() then
			self:SetAlpha(0)
		end
		self.State = false
		GameTooltip:Hide()
	end)

	MicroMenu.Buttons.LFG.Clicker:SetScript("OnClick", function(self, button)
		if UnitLevel("player") >= 15 then
				ToggleLFDParentFrame()
		end
	end)

	LFDParentFrame:HookScript("OnShow", function(self)
		MicroMenu.Buttons.LFG.Clicker:SetAlpha(1)
	end)

	LFDParentFrame:HookScript("OnHide", function(self)
		if not MicroMenu.Buttons.LFG.Clicker.State and not RaidParentFrame:IsShown() then
			MicroMenu.Buttons.LFG.Clicker:SetAlpha(0)
		end
	end)

	RaidParentFrame:HookScript("OnShow", function(self)
		MicroMenu.Buttons.LFG.Clicker:SetAlpha(1)
	end)

	RaidParentFrame:HookScript("OnHide", function(self)
		if not MicroMenu.Buttons.LFG.Clicker.State and not LFDParentFrame:IsShown() then
			MicroMenu.Buttons.LFG.Clicker:SetAlpha(0)
		end
	end)

	MicroMenu.Buttons.Journal = LUIMicroMenu:CreateMeAFrame("Frame", nil, MicroMenu.Buttons.LFG, 64, 64, 1, "BACKGROUND", 3, "LEFT", MicroMenu.Buttons.LFG, "LEFT", -33, 0, 1)
	MicroMenu.Buttons.Journal:SetBackdrop({
		bgFile = fdir.."micro_encounter",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Journal:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	MicroMenu.Buttons.Journal:SetBackdropBorderColor(0, 0, 0, 0)

	MicroMenu.Buttons.Journal.Clicker = LUIMicroMenu:CreateMeAFrame("Button", nil, MicroMenu.Buttons.Journal, 30, 25, 1, "BACKGROUND", 2, "CENTER", MicroMenu.Buttons.Journal, "CENTER", -2, 0, 1)
	MicroMenu.Buttons.Journal.Clicker:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Journal.Clicker:SetBackdropColor(0, 0, 0, 1)
	MicroMenu.Buttons.Journal.Clicker:SetBackdropBorderColor(0, 0, 0, 0)
	MicroMenu.Buttons.Journal.Clicker:SetAlpha(0)

	MicroMenu.Buttons.Journal.Clicker:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
		self.State = true
		GameTooltip:SetOwner(self, "ANCHOR_NONE ", 40, -60)
		GameTooltip:SetText("地下城手册")
		GameTooltip:Show()
	end)

	MicroMenu.Buttons.Journal.Clicker:SetScript("OnLeave", function(self)
		if not EncounterJournal or not EncounterJournal:IsShown() then
			self:SetAlpha(0)
		end
		self.State = nil
		GameTooltip:Hide()
	end)

	MicroMenu.Buttons.Journal.Clicker:SetScript("OnClick", function(self)
		if EncounterJournal then
			if EncounterJournal:IsShown() then
				HideUIPanel(EncounterJournal)
			else
				ShowUIPanel(EncounterJournal)
			end
		else
			LoadAddOn("Blizzard_EncounterJournal")
			ShowUIPanel(EncounterJournal)
			self:SetAlpha(1)
		end
	end)

	LUIMicroMenu:RegisterEvent("ADDON_LOADED", function(event)
		if event and not IsAddOnLoaded("Blizzard_EncounterJournal") then return end
		if event then LUIMicroMenu:UnregisterEvent(event) end

		EncounterJournal:HookScript("OnShow", function(self)
			MicroMenu.Buttons.Journal.Clicker:SetAlpha(1)
		end)
		EncounterJournal:HookScript("OnHide", function(self)
			if not MicroMenu.Buttons.Journal.Clicker.State then
				MicroMenu.Buttons.Journal.Clicker:SetAlpha(0)
			end
		end)
	end)

	MicroMenu.Buttons.PVP = LUIMicroMenu:CreateMeAFrame("Frame", nil, MicroMenu.Buttons.Journal, 64, 64, 1, "BACKGROUND", 3, "LEFT", MicroMenu.Buttons.Journal, "LEFT", -33, 0, 1)
	MicroMenu.Buttons.PVP:SetBackdrop({
		bgFile = fdir.."micro_pvp",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.PVP:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	MicroMenu.Buttons.PVP:SetBackdropBorderColor(0, 0, 0, 0)

	MicroMenu.Buttons.PVP.Clicker = LUIMicroMenu:CreateMeAFrame("Button", nil, MicroMenu.Buttons.PVP, 30, 25, 1, "BACKGROUND", 2, "CENTER", MicroMenu.Buttons.PVP, "CENTER", -2, 0, 1)
	MicroMenu.Buttons.PVP.Clicker:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.PVP.Clicker:SetBackdropColor(0, 0, 0, 1)
	MicroMenu.Buttons.PVP.Clicker:SetBackdropBorderColor(0, 0, 0, 0)
	MicroMenu.Buttons.PVP.Clicker:SetAlpha(0)

	MicroMenu.Buttons.PVP.Clicker:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
		self.State = true
		GameTooltip:SetOwner(self, "ANCHOR_NONE ", 40, -60)
		GameTooltip:SetText("PvP")
		GameTooltip:Show()
	end)

	MicroMenu.Buttons.PVP.Clicker:SetScript("OnLeave", function(self)
		if not PVPFrame:IsShown() then
			self:SetAlpha(0)
		end
		self.State = nil
		GameTooltip:Hide()
	end)

	MicroMenu.Buttons.PVP.Clicker:SetScript("OnClick", function(self)
		if UnitLevel("player") >= 10 then
			if PVPFrame:IsShown() then
				HideUIPanel(PVPFrame)
			else
				ShowUIPanel(PVPFrame)
			end
		end
	end)

	PVPFrame:HookScript("OnShow", function(self)
		MicroMenu.Buttons.PVP.Clicker:SetAlpha(1)
	end)

	PVPFrame:HookScript("OnHide", function(self)
		if not MicroMenu.Buttons.PVP.Clicker.State then
			MicroMenu.Buttons.PVP.Clicker:SetAlpha(0)
		end
	end)

	MicroMenu.Buttons.Guild = LUIMicroMenu:CreateMeAFrame("Frame",nil,MicroMenu.Buttons.PVP,64,64,1,"BACKGROUND",3,"LEFT",MicroMenu.Buttons.PVP,"LEFT",-33,0, 1)
	MicroMenu.Buttons.Guild:SetBackdrop({
		bgFile = fdir.."micro_guild",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Guild:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	MicroMenu.Buttons.Guild:SetBackdropBorderColor(0, 0, 0, 0)

	MicroMenu.Buttons.Guild.Clicker = LUIMicroMenu:CreateMeAFrame("Button", nil, MicroMenu.Buttons.Guild, 30, 25, 1, "BACKGROUND", 2, "CENTER", MicroMenu.Buttons.Guild, "CENTER", -2, 0, 1)
	MicroMenu.Buttons.Guild.Clicker:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Guild.Clicker:SetBackdropColor(0, 0, 0, 1)
	MicroMenu.Buttons.Guild.Clicker:SetBackdropBorderColor(0, 0, 0, 0)
	MicroMenu.Buttons.Guild.Clicker:SetAlpha(0)

	MicroMenu.Buttons.Guild.Clicker:RegisterForClicks("LeftButtonUp", "RightButtonUp")

	MicroMenu.Buttons.Guild.Clicker:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
		self.State = true
		GameTooltip:SetOwner(MicroMenu.Buttons.Guild.Clicker, "ANCHOR_NONE ", 40, -60)
		GameTooltip:SetText("社交")
		GameTooltip:Show()
	end)

	MicroMenu.Buttons.Guild.Clicker:SetScript("OnLeave", function(self)
		if not FriendsFrame:IsShown() and not GuildFrame:IsShown() then
			self:SetAlpha(0)
		end
		self.State = nil
		GameTooltip:Hide()
	end)

	MicroMenu.Buttons.Guild.Clicker:SetScript("OnClick", function(self, button)
		if button == "RightButton" then
			if FriendsFrame:IsShown() then
				HideUIPanel(FriendsFrame)
			else
				ShowUIPanel(FriendsFrame)
			end
		else
			if GuildFrame:IsShown() or LookingForGuildFrame:IsShown() then
				if IsInGuild() then HideUIPanel(GuildFrame) else HideUIPanel(LookingForGuildFrame) end
			else
				if IsInGuild() then ShowUIPanel(GuildFrame) else ShowUIPanel(LookingForGuildFrame) end
			end
		end
	end)

	FriendsFrame:HookScript("OnShow", function(self)
		MicroMenu.Buttons.Guild.Clicker:SetAlpha(1)
	end)

	FriendsFrame:HookScript("OnHide", function(self)
		if not GuildFrame:IsShown() and not MicroMenu.Buttons.Guild.Clicker.State then
			MicroMenu.Buttons.Guild.Clicker:SetAlpha(0)
		end
	end)

	if not GuildFrame then LoadAddOn("Blizzard_GuildUI") end
	if not LookingForGuildFrame then LoadAddOn("Blizzard_LookingForGuildUI") end

	GuildFrame:HookScript("OnShow", function(self)
		MicroMenu.Buttons.Guild.Clicker:SetAlpha(1)
	end)

	GuildFrame:HookScript("OnHide", function(self)
		if not FriendsFrame:IsShown() and not LookingForGuildFrame:IsShown() and not MicroMenu.Buttons.Guild.Clicker.State then
			MicroMenu.Buttons.Guild.Clicker:SetAlpha(0)
		end
	end)

	LookingForGuildFrame:HookScript("OnShow", function(self)
		MicroMenu.Buttons.Guild.Clicker:SetAlpha(1)
	end)

	LookingForGuildFrame:HookScript("OnHide", function(self)
		if not FriendsFrame:IsShown() and not GuildFrame:IsShown() and not MicroMenu.Buttons.Guild.Clicker.State then
			MicroMenu.Buttons.Guild.Clicker:SetAlpha(0)
		end
	end)

	MicroMenu.Buttons.Quests = LUIMicroMenu:CreateMeAFrame("Frame", nil, MicroMenu.Buttons.Guild, 64, 64, 1, "BACKGROUND", 3, "LEFT", MicroMenu.Buttons.Guild, "LEFT", -33, 0, 1)
	MicroMenu.Buttons.Quests:SetBackdrop({
		bgFile = fdir.."micro_quests",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Quests:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	MicroMenu.Buttons.Quests:SetBackdropBorderColor(0, 0, 0, 0)

	MicroMenu.Buttons.Quests.Clicker = LUIMicroMenu:CreateMeAFrame("Button", nil, MicroMenu.Buttons.Quests, 30, 25, 1, "BACKGROUND", 2, "CENTER", MicroMenu.Buttons.Quests, "CENTER", -2, 0, 1)
	MicroMenu.Buttons.Quests.Clicker:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Quests.Clicker:SetBackdropColor(0, 0, 0, 1)
	MicroMenu.Buttons.Quests.Clicker:SetBackdropBorderColor(0, 0, 0, 0)
	MicroMenu.Buttons.Quests.Clicker:SetAlpha(0)

	MicroMenu.Buttons.Quests.Clicker:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
		self.State = true
		GameTooltip:SetOwner(self, "ANCHOR_NONE ", 40, -60)
		GameTooltip:SetText("任务")
		GameTooltip:Show()
	end)

	MicroMenu.Buttons.Quests.Clicker:SetScript("OnLeave", function(self)
		if not QuestLogFrame:IsShown() then
			self:SetAlpha(0)
		end
		self.State = nil
		GameTooltip:Hide()
	end)

	MicroMenu.Buttons.Quests.Clicker:SetScript("OnClick", function(self)
		if QuestLogFrame:IsShown() then
			HideUIPanel(QuestLogFrame)
		else
			ShowUIPanel(QuestLogFrame)
		end
	end)

	QuestLogFrame:HookScript("OnShow", function(self)
		MicroMenu.Buttons.Quests.Clicker:SetAlpha(1)
	end)

	QuestLogFrame:HookScript("OnHide", function(self)
		if not MicroMenu.Buttons.Quests.Clicker.State then
			MicroMenu.Buttons.Quests.Clicker:SetAlpha(0)
		end
	end)

	MicroMenu.Buttons.AC = LUIMicroMenu:CreateMeAFrame("Frame", nil, MicroMenu.Buttons.Quests, 64, 64, 1, "BACKGROUND", 3, "LEFT", MicroMenu.Buttons.Quests, "LEFT", -33, 0, 1)
	MicroMenu.Buttons.AC:SetBackdrop({
		bgFile = fdir.."micro_achievements",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.AC:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	MicroMenu.Buttons.AC:SetBackdropBorderColor(0, 0, 0, 0)

	MicroMenu.Buttons.AC.Clicker = LUIMicroMenu:CreateMeAFrame("Button", nil, MicroMenu.Buttons.AC, 30, 25, 1, "BACKGROUND", 2, "CENTER", MicroMenu.Buttons.AC, "CENTER", -2, 0, 1)
	MicroMenu.Buttons.AC.Clicker:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.AC.Clicker:SetBackdropColor(0, 0, 0, 1)
	MicroMenu.Buttons.AC.Clicker:SetBackdropBorderColor(0, 0, 0, 0)
	MicroMenu.Buttons.AC.Clicker:SetAlpha(0)

	MicroMenu.Buttons.AC.Clicker:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
		self.State = true
		GameTooltip:SetOwner(self, "ANCHOR_NONE ", 40, -60)
		GameTooltip:SetText("成就")
		GameTooltip:Show()
	end)

	MicroMenu.Buttons.AC.Clicker:SetScript("OnLeave", function(self)
		self:SetAlpha(0)
		self.State = nil
		GameTooltip:Hide()
	end)

	MicroMenu.Buttons.AC.Clicker:SetScript("OnClick", function(self)
		ToggleAchievementFrame()
	end)

	MicroMenu.Buttons.AC.Clicker:SetScript("OnUpdate", function(self)
		if IsAddOnLoaded("Blizzard_AchievementUI") then
			if not MicroMenu.Buttons.AC.Clicker.State and AchievementFrame:IsShown() then
				MicroMenu.Buttons.AC.Clicker:SetAlpha(1)
			else
				MicroMenu.Buttons.AC.Clicker:SetAlpha(0)
			end
		end
	end)

	MicroMenu.Buttons.Talents = LUIMicroMenu:CreateMeAFrame("Frame", nil, MicroMenu.Buttons.AC, 64, 64, 1, "BACKGROUND", 3, "LEFT", MicroMenu.Buttons.AC, "LEFT", -33, 0, 1)
	MicroMenu.Buttons.Talents:SetBackdrop({
		bgFile = fdir.."micro_talents",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Talents:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	MicroMenu.Buttons.Talents:SetBackdropBorderColor(0, 0, 0, 0)

	MicroMenu.Buttons.Talents.Clicker = LUIMicroMenu:CreateMeAFrame("Button", nil, MicroMenu.Buttons.Talents, 30, 25, 1, "BACKGROUND", 2, "CENTER", MicroMenu.Buttons.Talents, "CENTER", -2, 0, 1)
	MicroMenu.Buttons.Talents.Clicker:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Talents.Clicker:SetBackdropColor(0, 0, 0, 1)
	MicroMenu.Buttons.Talents.Clicker:SetBackdropBorderColor(0, 0, 0, 0)
	MicroMenu.Buttons.Talents.Clicker:SetAlpha(0)

	MicroMenu.Buttons.Talents.Clicker:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
		self.State = true
		GameTooltip:SetOwner(self, "ANCHOR_NONE ", 40, -60)
		GameTooltip:SetText("专精/天赋")
		GameTooltip:Show()
	end)

	MicroMenu.Buttons.Talents.Clicker:SetScript("OnLeave", function(self)
		if not PlayerTalentFrame:IsShown() then
			self:SetAlpha(0)
		end
		self.State = nil
		GameTooltip:Hide()
	end)

	MicroMenu.Buttons.Talents.Clicker:SetScript("OnClick", function(self)
		if UnitLevel("player") >= 10 then
			if PlayerTalentFrame:IsShown() then
				HideUIPanel(PlayerTalentFrame)
			else
				ShowUIPanel(PlayerTalentFrame)
			end
		end
	end)

	if not PlayerTalentFrame then
		LoadAddOn("Blizzard_TalentUI")
		-- Fix for Events firing before TalentFrame is fully loaded (aka: blizz fail with patch 4.0.6)
		ShowUIPanel(PlayerTalentFrame)
		HideUIPanel(PlayerTalentFrame)
	end

	PlayerTalentFrame:HookScript("OnShow", function(self)
		MicroMenu.Buttons.Talents.Clicker:SetAlpha(1)
	end)

	PlayerTalentFrame:HookScript("OnHide", function(self)
		if not MicroMenu.Buttons.Talents.Clicker.State then
			MicroMenu.Buttons.Talents.Clicker:SetAlpha(0)
		end
	end)

	MicroMenu.Buttons.Spellbook = LUIMicroMenu:CreateMeAFrame("Frame", nil, MicroMenu.Buttons.Talents, 64, 64, 1, "BACKGROUND", 3, "LEFT", MicroMenu.Buttons.Talents, "LEFT", -33, 0, 1)
	MicroMenu.Buttons.Spellbook:SetBackdrop({
		bgFile = fdir.."micro_spellbook",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Spellbook:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	MicroMenu.Buttons.Spellbook:SetBackdropBorderColor(0, 0, 0, 0)

	MicroMenu.Buttons.Spellbook.Clicker = LUIMicroMenu:CreateMeAFrame("Button", nil, MicroMenu.Buttons.Spellbook, 30, 25, 1, "BACKGROUND", 2, "CENTER", MicroMenu.Buttons.Spellbook, "CENTER", -2, 0, 1)
	MicroMenu.Buttons.Spellbook.Clicker:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Spellbook.Clicker:SetBackdropColor(0, 0, 0, 1)
	MicroMenu.Buttons.Spellbook.Clicker:SetBackdropBorderColor(0, 0, 0, 0)
	MicroMenu.Buttons.Spellbook.Clicker:SetAlpha(0)

	MicroMenu.Buttons.Spellbook.Clicker:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
		self.State = true
		GameTooltip:SetOwner(self, "ANCHOR_NONE ", 40, -60)
		GameTooltip:SetText("技能")
		GameTooltip:Show()
	end)

	MicroMenu.Buttons.Spellbook.Clicker:SetScript("OnLeave", function(self)
		if not SpellBookFrame:IsShown() then
			self:SetAlpha(0)
		end
		self.State = nil
		GameTooltip:Hide()
	end)

	MicroMenu.Buttons.Spellbook.Clicker:SetScript("OnClick", function(self)
		if InCombatLockdown() then return end
		if SpellBookFrame:IsShown() then
			HideUIPanel(SpellBookFrame)
		else
			ShowUIPanel(SpellBookFrame)
		end
	end)

	SpellBookFrame:HookScript("OnShow", function(self)
		MicroMenu.Buttons.Spellbook.Clicker:SetAlpha(1)
	end)

	SpellBookFrame:HookScript("OnHide", function(self)
		if not MicroMenu.Buttons.Spellbook.Clicker.State then
			MicroMenu.Buttons.Spellbook.Clicker:SetAlpha(0)
		end
	end)

	MicroMenu.Buttons.Player = LUIMicroMenu:CreateMeAFrame("Frame", nil, MicroMenu.Buttons.Spellbook, 64, 64, 1, "BACKGROUND", 3, "LEFT", MicroMenu.Buttons.Spellbook, "LEFT", -32, 0, 1)
	MicroMenu.Buttons.Player:SetBackdrop({
		bgFile = fdir.."micro_player",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Player:SetBackdropColor(micro_r, micro_g, micro_b, 1)
	MicroMenu.Buttons.Player:SetBackdropBorderColor(0, 0, 0, 0)

	MicroMenu.Buttons.Player.Clicker = LUIMicroMenu:CreateMeAFrame("Button", nil, MicroMenu.Buttons.Player, 42, 25, 1, "BACKGROUND", 2, "CENTER", MicroMenu.Buttons.Player, "CENTER", -8, 0, 1)
	MicroMenu.Buttons.Player.Clicker:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	})
	MicroMenu.Buttons.Player.Clicker:SetBackdropColor(0, 0, 0, 1)
	MicroMenu.Buttons.Player.Clicker:SetBackdropBorderColor(0, 0, 0, 0)
	MicroMenu.Buttons.Player.Clicker:SetAlpha(0)

	MicroMenu.Buttons.Player.Clicker:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
		self.State = true
		GameTooltip:SetOwner(self, "ANCHOR_NONE ",40,-60)
		GameTooltip:SetText("角色")
		GameTooltip:Show()
	end)

	MicroMenu.Buttons.Player.Clicker:SetScript("OnLeave", function(self)
		if not CharacterFrame:IsShown() then
			self:SetAlpha(0)
		end
		self.State = nil
		GameTooltip:Hide()
	end)

	MicroMenu.Buttons.Player.Clicker:SetScript("OnClick", function(self)
		if CharacterFrame:IsShown() then
			HideUIPanel(CharacterFrame)
		else
			ShowUIPanel(CharacterFrame)
		end
	end)

	CharacterFrame:HookScript("OnShow", function(self)
		MicroMenu.Buttons.Player.Clicker:SetAlpha(1)
	end)

	CharacterFrame:HookScript("OnHide", function(self)
		if not MicroMenu.Buttons.Player.Clicker.State then
			MicroMenu.Buttons.Player.Clicker:SetAlpha(0)
		end
	end)

	self:SetMicroMenuPosition()

	-- little hack for the questframe
	local point, relframe, relpoint, x, y = QuestLogFrame:GetPoint()
	QuestLogFrame:ClearAllPoints()
	QuestLogFrame:SetPoint(point, relframe, relpoint, x, -105)

	-- talent alert frame
	if UnitLevel("player") < 10 then 
		TalentMicroButtonAlert:Hide() 
		MicroMenu.Buttons.Talents:RegisterEvent("PLAYER_LEVEL_UP")
	end
	MicroMenu.Buttons.Talents:SetScript("OnEvent", function(event) 
			if UnitLevel("player")+1 < 10 then TalentMicroButtonAlert:Hide() 
			else 
				TalentMicroButtonAlert:Show()
				MicroMenu.Buttons.Talents:UnregisterEvent("PLAYER_LEVEL_UP")
			end
	end)

	TalentMicroButtonAlert:ClearAllPoints()
	TalentMicroButtonAlert:SetPoint("TOP", MicroMenu.Buttons.Talents, "BOTTOM")
	TalentMicroButtonAlertBg:SetGradientAlpha("VERTICAL", micro_r/4, micro_g/4, micro_b/4, 1, 0, 0, 0, 1)
	TalentMicroButtonAlertArrow:ClearAllPoints()
	TalentMicroButtonAlertArrow:SetPoint("BOTTOM", TalentMicroButtonAlert, "TOP", 0, -6)
	TalentMicroButtonAlertGlow:SetTexCoord(0.40625000, 0.66015625, 0.82812500, 0.77343750)
	TalentMicroButtonAlertGlow:SetVertexColor(r, g, b, 0.5)
	TalentMicroButtonAlertGlow:ClearAllPoints()
	TalentMicroButtonAlertGlow:SetPoint("BOTTOM", TalentMicroButtonAlertArrow, "BOTTOM", 0, 0)
	TalentMicroButtonAlertGlow:SetTexture("Interface\\AddOns\\LUI\\media\\TalentFrame-Parts")
end

LUIMicroMenu.defaults = {
	profile = {
		X = 0,
		Y = -1,
		NaviX = -150,
		NaviY = 6,
	}
}


function LUIMicroMenu:OnInitialize()
	
end

function LUIMicroMenu:OnEnable()

	self:SetMicroMenu()
end
