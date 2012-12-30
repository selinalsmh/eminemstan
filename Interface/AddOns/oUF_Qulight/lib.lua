local addon, ns = ...
local cfg = ns.cfg
local cast = ns.cast
local lib = CreateFrame("Frame")  
local _, playerClass = UnitClass("player")
oUF.colors.runes = {{0.87, 0.12, 0.23};{0.40, 0.95, 0.20};{0.14, 0.50, 1};{.70, .21, 0.94};}
--------------------------------------------------------------------------------------
local shadows = {
	bgFile =  cfg.statusbar_texture,
	edgeFile = "Interface\\AddOns\\oUF_Qulight\\Media\\textures\\glowTex", 
	edgeSize = 4,
	insets = { left = 3, right = 3, top = 3, bottom = 3 }
}
function CreateShadowclassbar(f) --
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(5)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", -2, 2)
	shadow:SetPoint("BOTTOMRIGHT", 2, -2)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor(.05,.05,.05, .9)
	shadow:SetBackdropBorderColor(0, 0, 0, 0.6)
	f.shadow = shadow
	return shadow
end
function CreateShadow0(f)--
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(0)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", 1, -1)
	shadow:SetPoint("BOTTOMRIGHT", -1, 1)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor( .05,.05,.05, .9)
	shadow:SetBackdropBorderColor(0, 0, 0, 1)
	f.shadow = shadow
	return shadow
end
function CreateShadow00(f)--
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(4)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", 1, -1)
	shadow:SetPoint("BOTTOMRIGHT", -1, 1)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor( .05,.05,.05, .9)
	shadow:SetBackdropBorderColor(0, 0, 0, 0.6)
	f.shadow = shadow
	return shadow
end
function CreateShadow1(f)
    if f.frameBD==nil then
      local frameBD = CreateFrame("Frame", nil, f)
      frameBD = CreateFrame("Frame", nil, f)
      frameBD:SetFrameLevel(5)
      frameBD:SetFrameStrata(f:GetFrameStrata())
     frameBD:SetPoint("TOPLEFT", 1, -1)
      frameBD:SetPoint("BOTTOMLEFT", 1, 1)
      frameBD:SetPoint("TOPRIGHT", -1, -1)
      frameBD:SetPoint("BOTTOMRIGHT", -1, 1)
      frameBD:SetBackdrop( { 
         edgeFile = "Interface\\AddOns\\oUF_Qulight\\Media\\glowTex", edgeSize = 4,
         insets = {left = 3, right = 3, top = 3, bottom = 3},
         tile = false, tileSize = 0,
      })
      frameBD:SetBackdropColor( .05,.05,.05, .9)
	  frameBD:SetBackdropBorderColor(0, 0, 0, 0.6)
      f.frameBD = frameBD
    end
end
----------------------
function CreateShadow(f)
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(0)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", 1, -1)
	shadow:SetPoint("BOTTOMRIGHT", -1, 1)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor( .05,.05,.05, .9)
	shadow:SetBackdropBorderColor(0, 0, 0, 1)
	f.shadow = shadow
	return shadow
end
function framefix12px(f) 
	-- f:SetBackdrop({
		-- bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        -- edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1, 
		-- insets = {left = -1, right = -1, top = -1, bottom = -1} 
	-- })
	-- f:SetBackdropColor(.09,.09,.09,1)
	-- f:SetBackdropBorderColor(.2,.2,.2,1)
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(0)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", -2, 2)
	shadow:SetPoint("BOTTOMRIGHT", 2, -2)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor(.05,.05,.05, .9)
	shadow:SetBackdropBorderColor(0, 0, 0, 0.6)
	f.shadow = shadow
	return shadow
end

-- function frame11px(f)
	-- f:SetBackdrop({
		-- bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        -- edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1, 
		-- insets = {left = 1, right = 1, top = 1, bottom = 1} 
	-- })
	-- f:SetPoint("TOPLEFT", -2, 2)
	-- f:SetPoint("BOTTOMRIGHT", 2, -2)
	-- f:SetBackdropColor(.09,.09,.09,1)
	-- f:SetBackdropBorderColor(.2,.2,.2,1)
-- end

function frame1px1(f)
	-- f:SetBackdrop({
		-- bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        -- edgeFile = "Interface\\Buttons\\WHITE8x8", edgeSize = 1, 
		-- insets = {left = 1, right = 1, top = 1, bottom = 1} 
	-- })
	-- f:SetPoint("TOPLEFT", -2, 2)
	-- f:SetPoint("BOTTOMRIGHT", 2, -2)
	-- f:SetBackdropColor(.09,.09,.09,1)
	-- f:SetBackdropBorderColor(.2,.2,.2,1)
	if f.shadow then return end
	local shadow = CreateFrame("Frame", nil, f)
	shadow:SetFrameLevel(0)
	shadow:SetFrameStrata(f:GetFrameStrata())
	shadow:SetPoint("TOPLEFT", 1, -1)
	shadow:SetPoint("BOTTOMRIGHT", -1, 1)
	shadow:SetBackdrop(shadows)
	shadow:SetBackdropColor( .05,.05,.05, .9)
	shadow:SetBackdropBorderColor(0, 0, 0, 0.6)
	f.shadow = shadow
	return shadow
end
--fucking icon for castbar--------------------------------------------------------------------------------------
function frame(f)
    if f.frame==nil then
      local frame = CreateFrame("Frame", nil, f)
      frame = CreateFrame("Frame", nil, f)
      frame:SetFrameLevel(12)
      frame:SetFrameStrata(f:GetFrameStrata())
      frame:SetPoint("TOPLEFT", 4, -4)
      frame:SetPoint("BOTTOMLEFT", 4, 4)
      frame:SetPoint("TOPRIGHT", -4, -4)
      frame:SetPoint("BOTTOMRIGHT", -4, 4)
      frame:SetBackdrop( { 
        edgeFile = "Interface\\Buttons\\WHITE8x8", 
	  tile = false, tileSize = 0, edgeSize = 1, 
	  insets = { left = -1, right = -1, top = -1, bottom = -1}
      })
     
      frame:SetBackdropColor( .05,.05,.05, .9)--(.09,.09,.09,1)
      frame:SetBackdropBorderColor(0, 0, 0, 0.6)--(.2,.2,.2,1)
      f.frame = frame
    end
end 
function CreateShadow1(f)
    if f.frameBD==nil then
      local frameBD = CreateFrame("Frame", nil, f)
      frameBD = CreateFrame("Frame", nil, f)
      frameBD:SetFrameLevel(1)
      frameBD:SetFrameStrata(f:GetFrameStrata())
      frameBD:SetPoint("TOPLEFT", 1, -1)
      frameBD:SetPoint("BOTTOMLEFT", -1, 1)
      frameBD:SetBackdrop(shadows)
      frameBD:SetBackdropColor( .05,.05,.05, .9)
      frameBD:SetBackdropBorderColor(0, 0, 0, 1)
      f.frameBD = frameBD
    end
end
--------------------------------------------------------------------------------------
local fixStatusbar = function(bar)
    bar:GetStatusBarTexture():SetHorizTile(false)
    bar:GetStatusBarTexture():SetVertTile(false)
end
local retVal = function(f, val1, val2, val3, val4)
	if f.mystyle == "player" or f.mystyle == "target" then
		return val1
	elseif f.mystyle == "raid" then
		return val3
	elseif f.mystyle == "oUF_MT" then
		return val4
	else
		return val2
	end
end

do			
	ComboDisplay = function(self, event, unit)
		if(unit == 'pet') then return end
		
		local cpoints = self.CPoints
		local cp
		if (UnitHasVehicleUI("player") or UnitHasVehicleUI("vehicle")) then
			cp = GetComboPoints('vehicle', 'target')
		else
			cp = GetComboPoints('player', 'target')
		end

		for i=1, MAX_COMBO_POINTS do
			if(i <= cp) then
				cpoints[i]:SetAlpha(1)
			else
				cpoints[i]:SetAlpha(0.15)
			end
		end
		
		if cpoints[1]:GetAlpha() == 1 then
			for i=1, MAX_COMBO_POINTS do
				cpoints[i]:Show()
			end
			
		else
			for i=1, MAX_COMBO_POINTS do
				cpoints[i]:Hide()
			end
			
		end
	end
end
lib.menu = function(self)
    local unit = self.unit:sub(1, -2)
    local cunit = self.unit:gsub("(.)", string.upper, 1)
    if(unit == "party" or unit == "partypet") then
		ToggleDropDownMenu(1, nil, _G["PartyMemberFrame"..self.id.."DropDown"], "cursor", 0, 0)
    elseif(_G[cunit.."FrameDropDown"]) then
		ToggleDropDownMenu(1, nil, _G[cunit.."FrameDropDown"], "cursor", 0, 0)
    end
end
lib.init = function(f)
    f.menu = lib.menu
    f:RegisterForClicks("AnyDown")
	f:SetAttribute("*type1", "target")
    f:SetAttribute("*type2", "menu")
    f:SetScript("OnEnter", UnitFrame_OnEnter)
    f:SetScript("OnLeave", UnitFrame_OnLeave)
end
UpdateReputationColor = function(self, event, unit, bar)
	local name, id = GetWatchedFactionInfo()
	bar:SetStatusBarColor(FACTION_BAR_COLORS[id].r, FACTION_BAR_COLORS[id].g, FACTION_BAR_COLORS[id].b)
end
lib.gen_fontstring = function(f, name, size, outline)
    local fs = f:CreateFontString(nil, "OVERLAY")
    fs:SetFont(name, size, "OUTLINE")
    fs:SetShadowColor(0,0,0,1)
    fs:SetShadowOffset(0.5,-0.5)
    return fs
end
SetFontString = function(parent, fontName, fontHeight, fontStyle)
	local fs = parent:CreateFontString(nil, "OVERLAY")
	fs:SetFont(cfg.font, 11, fontStyle)
	fs:SetJustifyH("LEFT")
	fs:SetShadowColor(0, 0, 0)
	fs:SetShadowOffset(1.25, -1.25)
	return fs
end
function AltPowerBarOnToggle(self)
	local unit = self:GetParent().unit or self:GetParent():GetParent().unit
end
function AltPowerBarPostUpdate(self, min, cur, max)
	local perc = math.floor((cur/max)*100)
		
	if perc < 35 then
		self:SetStatusBarColor(0, 1, 0)
	elseif perc < 70 then
		self:SetStatusBarColor(1, 1, 0)
	else
		self:SetStatusBarColor(1, 0, 0)
	end
		
	local unit = self:GetParent().unit or self:GetParent():GetParent().unit
	
	local type = select(10, UnitAlternatePowerInfo(unit))
				
end	
lib.gen_hpbar = function(f)  --CreateShadow0
    local s = CreateFrame("StatusBar", nil, f)
    s:SetStatusBarTexture(cfg.statusbar_texture)
	s:GetStatusBarTexture():SetHorizTile(true)
	fixStatusbar(s)
	
	-- s.gradient = s:CreateTexture(nil, "OVERLAY")
	-- s.gradient:SetPoint("TOPLEFT", s, 0, -0)
	-- s.gradient:SetPoint("BOTTOMRIGHT", s, -0, 0)
	-- s.gradient:SetTexture(cfg.statusbar_texture)
	-- s.gradient:SetGradientAlpha("VERTICAL",.4,.4,.4,.25,.35,.35,.35,.75)
	
	if cfg.HealFrames then
	s:SetHeight(retVal(f,26,22,24,18))
	else
	s:SetHeight(retVal(f,28,21,25))
	end
	s:SetStatusBarColor( .25 , 1, .25, 1)--(.1,.1,.1,1)
    s:SetWidth(f:GetWidth())
    s:SetPoint("TOP",0,0)
	local h = CreateFrame("Frame", nil, s)
    h:SetFrameLevel(0)
    h:SetPoint("TOPLEFT",-5,5)
	if f.mystyle == "target" or f.mystyle == "player" then
		h:SetPoint("BOTTOMRIGHT",5,-5)
	elseif f.mystyle == "raid" then
		h:SetPoint("BOTTOMRIGHT", 5, -5)
	else
		h:SetPoint("BOTTOMRIGHT", 5, -5)
	end
	frame1px1(h)
	CreateShadow(h)
    local b = s:CreateTexture(nil, "BACKGROUND")
    b:SetTexture(cfg.statusbar_texture)
    b:SetAllPoints(s)
	b:SetVertexColor(.3,.3,.3)
	
	f.Health = s
end
lib.gen_hpstrings = function(f)
    local name = lib.gen_fontstring(f.Health, cfg.font, cfg.fontsize, retVal(f,17,12,12,15), "OUTLINE")
    name:SetPoint("LEFT", f.Health, "TOPLEFT", retVal(f,3,3,3,3), retVal(f,-13,-10,-15,-10))
    name:SetJustifyH("LEFT")
	if f.mystyle == "raid" then
	    name:SetPoint("LEFT",f,"LEFT", 0, 0.8)
		name:SetJustifyH("CENTER")
	end
    local hpval = lib.gen_fontstring(f.Health, cfg.font, 12, retVal(f,17,12,10), "OUTLINE")
    hpval:SetPoint("RIGHT", f.Health, "TOPRIGHT", retVal(f,-3,-3,-1,-3), retVal(f,-10,-11,-15,-11))
    hpval.frequentUpdates = 0.1
	
	if f.mystyle == "raid" then
		name:SetPoint("RIGHT", f, "RIGHT", -1, 0)
	else
		name:SetPoint("RIGHT", hpval, "LEFT", -2, 0)
	end
	if f.mystyle == "player" then
		f:Tag(name, "[color][name][afkdnd]")
	elseif f.mystyle == "target" then
		f:Tag(name, "[level] [color][name][afkdnd]")
	elseif f.mystyle == "raid" then
		f:Tag(name, "[color][name][afkdnd]")
	else
		f:Tag(name, "[color][name]")
	end
	f:Tag(hpval, retVal(f,"[hp] | [color][power]","[hp]"))
end
lib.gen_ppbar = function(f)
    local s = CreateFrame("StatusBar", nil, f)
    s:SetStatusBarTexture(cfg.powerbar_texture)
	s:GetStatusBarTexture():SetHorizTile(true)
	fixStatusbar(s)
	s:SetHeight(retVal(f,7,7,7,7))
    s:SetWidth(230)
	s:SetFrameLevel(11)
    s:SetPoint("BOTTOM",UIParent,"BOTTOM",0,1)

	if f.mystyle == "player" then
		local h = CreateFrame("Frame", nil, s)
		s:SetPoint("BOTTOM",f,"BOTTOM",0,4)
		h:SetFrameLevel(10)
		h:SetPoint("TOPLEFT",-5,5)
		h:SetPoint("BOTTOMRIGHT",5,-5)
		frame1px1(h)
		CreateShadow(h)
	end
	if f.mystyle == "target" then
		local h = CreateFrame("Frame", nil, s)
		s:SetPoint("BOTTOM",f,"BOTTOM",0,4)
		h:SetFrameLevel(10)
		h:SetPoint("TOPLEFT",-5,5)
		h:SetPoint("BOTTOMRIGHT",5,-5)
		frame1px1(h)
		CreateShadow(h)
	end
	if f.mystyle == "focus" then
	local h = CreateFrame("Frame", nil, s)
		s:SetPoint("BOTTOM",f,"BOTTOM",0,4)
		h:SetFrameLevel(10)
		s:SetWidth(160)
		h:SetPoint("TOPLEFT",-5,5)
		h:SetPoint("BOTTOMRIGHT",5,-5)
		frame1px1(h)
		CreateShadow(h)
	end
	if f.mystyle == "raid" then
	if cfg.HealFrames then
		local h = CreateFrame("Frame", nil, s)
		s:SetPoint("BOTTOM",f,"BOTTOM",0,-3)
		s:SetWidth(70)
		h:SetFrameLevel(10)
		h:SetPoint("TOPLEFT",-5,5)
		h:SetPoint("BOTTOMRIGHT",5,-5)
		frame1px1(h)
	end	
	end
	if f.mystyle == "tank" then
		local h = CreateFrame("Frame", nil, s)
		s:SetPoint("BOTTOM",f,"BOTTOM",15,3)
		s:SetWidth(25)
		h:SetFrameLevel(10)
		h:SetPoint("TOPLEFT",-5,5)
		h:SetPoint("BOTTOMRIGHT",5,-5)
		frame1px1(h)
		CreateShadow(h)
	end
	if f.mystyle == "boss" then
		local h = CreateFrame("Frame", nil, s)
		s:SetPoint("BOTTOM",f,"BOTTOM",0,4)
		h:SetFrameLevel(10)
		s:SetWidth(150)
		h:SetPoint("TOPLEFT",-5,5)
		h:SetPoint("BOTTOMRIGHT",5,-5)
		frame1px1(h)
		CreateShadow(h)
	end
    local b = s:CreateTexture(nil, "BACKGROUND")
    b:SetTexture(cfg.powerbar_texture)
    b:SetAllPoints(s)
    f.Power = s
    f.Power.bg = b
end
HidePortrait = function(self, unit)
	if self.unit == "target" then
		if not UnitExists(self.unit) or not UnitIsConnected(self.unit) or not UnitIsVisible(self.unit) then
			self.Portrait:SetAlpha(0)
		else
			self.Portrait:SetAlpha(1)
		end
	end
end
-- lib.gen_portrait = function(f)
    -- local portrait = CreateFrame("PlayerModel", nil, f)
		-- portrait.PostUpdate = function(f) 
		-- portrait:SetAlpha(0.15) 
	-- end
	-- portrait:SetAllPoints(f.Health)
	-- table.insert(f.__elements, HidePortrait)
	-- f.Portrait = portrait
-- end
lib.gen_portrait = function(f)
    local p = CreateFrame("PlayerModel", nil, f)
    p:SetFrameStrata("BACKGROUND")
   p:SetFrameLevel(3)
    p:SetWidth(50)--头像的宽度
    p:SetHeight(40)--头像的高度
   if f.mystyle == 'player' then
   p:SetPoint("RIGHT", f, "LEFT", -9, 5)--玩家头像位置
   end
   if f.mystyle == 'target' then
   p:SetPoint("LEFT", f, "RIGHT", 8,5)--目标头像位置
   end
    f.Portrait = p
   local h = CreateFrame("Frame", nil, p)
   h:SetFrameLevel(2)
   h:SetPoint("TOPLEFT",-5,5)
   h:SetPoint("BOTTOMRIGHT",5,-5)
   frame1px1(h)
   CreateShadow(h)
end
lib.gen_InfoIcons = function(f)
    local h = CreateFrame("Frame",nil,f)
    h:SetAllPoints(f)
    h:SetFrameLevel(10)
    if f.mystyle == 'player' then
      f.Combat = h:CreateTexture(nil, 'OVERLAY')
      f.Combat:SetSize(15,15)
      f.Combat:SetPoint("LEFT", f, 5, 2)
      f.Combat:SetTexture("Interface\\AddOns\\oUF_Qulight\\media\\textures\\combat")--('Interface\\CharacterFrame\\UI-StateIcon')
      --f.Combat:SetTexCoord(0.58, 0.90, 0.08, 0.41)
    end
    if f.mystyle =='raid' or f.mystyle =='party' and cfg.showLFDIcons then 
		f.LFDRole = f.Health:CreateTexture(nil, 'OVERLAY')
		f.LFDRole:SetSize(14, 14)
		f.LFDRole:SetPoint('CENTER', f, 'TOPRIGHT', 0, 0)
    end

    li = h:CreateTexture(nil, "OVERLAY")
    li:SetPoint("TOPLEFT", f, 0, 8)
    li:SetSize(12,12)
    f.Leader = li
    ai = h:CreateTexture(nil, "OVERLAY")
    ai:SetPoint("TOPLEFT", f, 0, 8)
    ai:SetSize(12,12)
    f.Assistant = ai
    local ml = h:CreateTexture(nil, 'OVERLAY')
    ml:SetSize(10,10)
    ml:SetPoint('LEFT', f.Leader, 'RIGHT')
    f.MasterLooter = ml
end
lib.gen_InfoIcons2 = function(f)
    local h = CreateFrame("Frame",nil,f)
    h:SetAllPoints(f)
    h:SetFrameLevel(10)
	ri = h:CreateTexture(nil, 'OVERLAY')
	ri:SetSize(14, 14)	
	ri:SetPoint("TOPLEFT", f, -10, 5)
	ri:SetTexture("Interface\\AddOns\\oUF_Qulight\\media\\textures\\rested")
	ri:SetVertexColor(0.8, 0.8, 0.8)
	f.Resting = ri  
end

lib.addPhaseIcon = function(self)
	local picon = self.Health:CreateTexture(nil, 'OVERLAY')
	picon:SetPoint('TOPRIGHT', self, 'TOPRIGHT', 40, 8)
	picon:SetSize(16, 16)
	self.PhaseIcon = picon
end
lib.addQuestIcon = function(self)
	local qicon = self.Health:CreateTexture(nil, 'OVERLAY')
	qicon:SetPoint('TOPLEFT', self, 'TOPLEFT', 0, 8)
	qicon:SetSize(16, 16)
	self.QuestIcon = qicon
end
lib.gen_RaidMark = function(f)
    local h = CreateFrame("Frame", nil, f)
    h:SetAllPoints(f)
    h:SetFrameLevel(10)
    h:SetAlpha(0.8)
    local ri = h:CreateTexture(nil,'OVERLAY',h)
    ri:SetPoint("CENTER", f, "TOP", 0, 2)
	local size = retVal(f, 16, 13, 12,12)
	ri:SetTexture("Interface\\AddOns\\oUF_Qulight\\media\\textures\\raidicons")
    ri:SetSize(size, size)
    f.RaidIcon = ri
end
lib.gen_highlight = function(f)
    local OnEnter = function(f)
		UnitFrame_OnEnter(f)
		f.Highlight:Show()
    end
    local OnLeave = function(f)
      UnitFrame_OnLeave(f)
      f.Highlight:Hide()
    end
    f:SetScript("OnEnter", OnEnter)
    f:SetScript("OnLeave", OnLeave)
    local hl = f.Health:CreateTexture(nil, "OVERLAY")
    hl:SetAllPoints(f.Health)
    hl:SetTexture(cfg.highlight_texture)
    hl:SetVertexColor(.5,.5,.5,.1)
    hl:SetBlendMode("ADD")
    hl:Hide()
    f.Highlight = hl
end
function lib.CreateTargetBorder(self)
	local glowBorder = {edgeFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeSize = 1}
	self.TargetBorder = CreateFrame("Frame", nil, self)
	self.TargetBorder:SetPoint("TOPLEFT", self, "TOPLEFT", -1, 1)
	self.TargetBorder:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 1, -1)
	self.TargetBorder:SetBackdrop(glowBorder)
	self.TargetBorder:SetFrameLevel(2)
	self.TargetBorder:SetBackdropBorderColor(.7,.7,.7,1)
	self.TargetBorder:Hide()
end
function lib.ChangedTarget(self, event, unit)
	if UnitIsUnit('target', self.unit) then
		self.TargetBorder:Show()
	else
		self.TargetBorder:Hide()
	end
end
function lib.CreateThreatBorder(self)
	local glowBorder = {edgeFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeSize = 2}
		self.Thtborder = CreateFrame("Frame", nil, self)
		self.Thtborder:SetPoint("TOPLEFT", self, "TOPLEFT", -2, 2)
		self.Thtborder:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 2, -2)
		self.Thtborder:SetBackdrop(glowBorder)
		self.Thtborder:SetFrameLevel(1)
		self.Thtborder:Hide()	
end
function lib.UpdateThreat(self, event, unit)
	if (self.unit ~= unit) then return end
		local status = UnitThreatSituation(unit)
		unit = unit or self.unit
	if status and status > 1 then
		local r, g, b = GetThreatStatusColor(status)
		self.Thtborder:Show()
		self.Thtborder:SetBackdropBorderColor(r, g, b, 1)
	else
		self.Thtborder:SetBackdropBorderColor(r, g, b, 0)
		self.Thtborder:Hide()
	end
end
lib.gen_castbar = function(f)
	if not cfg.Castbars then return end
	local cbColor = {95/255, 182/255, 255/255}
    local s = CreateFrame("StatusBar", "oUF_Castbar"..f.mystyle, f)
    s:SetHeight(25)
    s:SetWidth(f:GetWidth()-22)
	if f.mystyle == "focus" then
	s:SetWidth(250)
	end
    if f.mystyle == "player" then
	  s:SetHeight(28)
      s:SetWidth(320)
	  if cfg.HealFrames then
	  s:SetPoint("BOTTOM",UIParent,"BOTTOM",12,180)
	  else
	  s:SetPoint("BOTTOM",UIParent,"BOTTOM",16,80)
	  end
    elseif f.mystyle == "target" then
	  s:SetHeight(30)
      s:SetWidth(350)--(f:GetWidth()+10)
	  if cfg.HealFrames then
	    s:SetPoint("BOTTOM",UIParent,"BOTTOM",11,230)
	  else
	  s:SetPoint("BOTTOM",UIParent,"BOTTOM",16,130)
	  end
	elseif f.mystyle == "party" then
	  s:SetPoint("CENTER",UIParent,"CENTER",10,100)
	else
      s:SetPoint("CENTER",UIParent,"CENTER",10,100)	
    end
	if f.mystyle == "boss" then
	    s:SetHeight(15)
        s:SetWidth(131)
	    s:SetPoint("TOPRIGHT",f,"BOTTOMRIGHT",0,-19)
	end
    s:SetStatusBarTexture(cfg.statusbar_texture)
    s:SetStatusBarColor(95/255, 182/255, 255/255,1)
    s:SetFrameLevel(1)
    s.CastingColor = cbColor
    s.CompleteColor = {20/255, 208/255, 0/255}
    s.FailColor = {255/255, 12/255, 0/255}
    s.ChannelingColor = cbColor
    local h = CreateFrame("Frame", nil, s)
    h:SetFrameLevel(0)
    h:SetPoint("TOPLEFT",-5,5)
    h:SetPoint("BOTTOMRIGHT",5,-5)
    frame1px1(h)
	CreateShadow(h)
    sp = s:CreateTexture(nil, "OVERLAY")
    sp:SetBlendMode("ADD")
    sp:SetAlpha(0.5)
    sp:SetHeight(s:GetHeight()*2.5)
    local txt = lib.gen_fontstring(s, cfg.font, 12, "NONE")
    txt:SetPoint("LEFT", 2, 0)
    txt:SetJustifyH("LEFT")
    local t = lib.gen_fontstring(s, cfg.font, 12, "NONE")
    t:SetPoint("RIGHT", -2, 0)
    txt:SetPoint("RIGHT", t, "LEFT", -5, 0)
    local i = s:CreateTexture(nil, "ARTWORK")
    i:SetSize(s:GetHeight()+2,s:GetHeight()+2)
	if f.mystyle == "target" then
	i:SetSize(s:GetHeight()+2,s:GetHeight()+2)
	end
	
    i:SetPoint("RIGHT", s, "LEFT", -8, 0)
    i:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    local h2 = CreateFrame("Frame", nil, s)
    h2:SetFrameLevel(0)
    h2:SetPoint("TOPLEFT",i,"TOPLEFT",-5,5)
    h2:SetPoint("BOTTOMRIGHT",i,"BOTTOMRIGHT",5,-5)
	frame(h2)
	CreateShadow1(h2)
    if f.mystyle == "player" then
      local z = s:CreateTexture(nil,"OVERLAY")
      z:SetTexture(cfg.statusbar_texture)
      z:SetVertexColor(1,0.1,0,.6)
      z:SetPoint("TOPRIGHT")
      z:SetPoint("BOTTOMRIGHT")
	  s:SetFrameLevel(10)
      s.SafeZone = z
      local l = lib.gen_fontstring(s, cfg.font, 10, "THINOUTLINE")
      l:SetPoint("CENTER", -2, 17)
      l:SetJustifyH("RIGHT")
	  l:Hide()
      s.Lag = l
      f:RegisterEvent("UNIT_SPELLCAST_SENT", cast.OnCastSent)
    end
    s.OnUpdate = cast.OnCastbarUpdate
    s.PostCastStart = cast.PostCastStart
    s.PostChannelStart = cast.PostCastStart
    s.PostCastStop = cast.PostCastStop
    s.PostChannelStop = cast.PostChannelStop
    s.PostCastFailed = cast.PostCastFailed
    s.PostCastInterrupted = cast.PostCastFailed
	
    f.Castbar = s
    f.Castbar.Text = txt
    f.Castbar.Time = t
    f.Castbar.Icon = i
    f.Castbar.Spark = sp
end
lib.gen_mirrorcb = function(f)
    for _, bar in pairs({'MirrorTimer1','MirrorTimer2','MirrorTimer3',}) do   
      for i, region in pairs({_G[bar]:GetRegions()}) do
        if (region.GetTexture and region:GetTexture() == cfg.statusbar_texture) then
          region:Hide()
        end
      end
      _G[bar..'Border']:Hide()
      _G[bar]:SetParent(UIParent)
      _G[bar]:SetScale(1)
      _G[bar]:SetHeight(15)
      _G[bar]:SetWidth(280)
      _G[bar]:SetBackdropColor(.1,.1,.1)
      _G[bar..'Background'] = _G[bar]:CreateTexture(bar..'Background', 'BACKGROUND', _G[bar])
      _G[bar..'Background']:SetTexture(cfg.statusbar_texture)
      _G[bar..'Background']:SetAllPoints(bar)
      _G[bar..'Background']:SetVertexColor(.15,.15,.15,.75)
      _G[bar..'Text']:SetFont(cfg.font, 13)
      _G[bar..'Text']:ClearAllPoints()
      _G[bar..'Text']:SetPoint('CENTER', MirrorTimer1StatusBar, 0, 1)
      _G[bar..'StatusBar']:SetAllPoints(_G[bar])
      --glowing borders
      local h = CreateFrame("Frame", nil, _G[bar])
      h:SetFrameLevel(0)
      h:SetPoint("TOPLEFT",-5,5)
      h:SetPoint("BOTTOMRIGHT",5,-5)
      frame1px1(h)
	  CreateShadow(h)
    end
end
local myPostCreateIcon = function(self, button)
	self.showDebuffType = true
	self.disableCooldown = true
	button.cd.noOCC = true
	button.cd.noCooldownCount = true
	button.icon:SetTexCoord(.07, .93, .07, .93)
	button.icon:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
	button.icon:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)
	button.overlay:SetTexture(border)
	button.overlay:SetTexCoord(0,1,0,1)
	button.overlay.Hide = function(self) self:SetVertexColor(0.3, 0.3, 0.3) end
	button.time = lib.gen_fontstring(button, cfg.font, 10, "OUTLINE")
	button.time:SetPoint("CENTER", button, 2, 0)
	button.time:SetJustifyH('CENTER')
	button.time:SetVertexColor(1,1,1)
	button.count = lib.gen_fontstring(button, cfg.font, 10, "OUTLINE")
	button.count:ClearAllPoints()
	button.count:SetPoint("BOTTOMRIGHT", button, 7, -5)
	button.count:SetVertexColor(1,1,1)	
	local h = CreateFrame("Frame", nil, button)
	h:SetFrameLevel(0)
	h:SetPoint("TOPLEFT",-5,5)
	h:SetPoint("BOTTOMRIGHT",5,-5)
	frame1px1(h)
	CreateShadow(h)
end
local updateTooltip = function(self)
	GameTooltip:SetUnitAura(self.parent:GetParent().unit, self:GetID(), self.filter)

	if self.owner and UnitExists(self.owner) then
		GameTooltip:AddLine(format("|cff1369ca* Cast by %s|r", UnitName(self.owner) or UNKNOWN))
	end

	GameTooltip:Show()
end	
local formatTime = function(s)
	local day, hour, minute = 86400, 3600, 60
	if s >= day then
		return format("%dd", floor(s/day + 0.5)), s % day
	elseif s >= hour then
		return format("%dh", floor(s/hour + 0.5)), s % hour
	elseif s >= minute then
		return format("%dm", floor(s/minute + 0.5)), s % minute
	elseif s >= minute / 12 then
		return floor(s + 0.5), (s * 100 - floor(s * 100))/100
	end
	return format("%.1f", s), (s * 100 - floor(s * 100))/100
end
local setTimer = function (self, elapsed)
	if self.timeLeft then
		self.elapsed = (self.elapsed or 0) + elapsed
		if self.elapsed >= 0.1 then
			if not self.first then
				self.timeLeft = self.timeLeft - self.elapsed
			else
				self.timeLeft = self.timeLeft - GetTime()
				self.first = false
			end
			if self.timeLeft > 0 then
				local time = formatTime(self.timeLeft)
					self.time:SetText(time)
				if self.timeLeft < 5 then
					self.time:SetTextColor(1, 0.5, 0.5)
				else
					self.time:SetTextColor(.7, .7, .7)
				end
			else
				self.time:Hide()
				self:SetScript("OnUpdate", nil)
			end
			self.elapsed = 0
		end
	end
end
local postCreateIcon = function(element, button)
	local diffPos = 0
	local self = element:GetParent()
	if self.mystyle == "target" then diffPos = 1 end
	
	element.disableCooldown = true
	button.cd.noOCC = true
	button.cd.noCooldownCount = true
	
	local h = CreateFrame("Frame", nil, button)
	h:SetFrameLevel(0)
	h:SetPoint("TOPLEFT",-5,5)
	h:SetPoint("BOTTOMRIGHT",5,-5)
	frame1px1(h)
	CreateShadow(h)
	
	local time = lib.gen_fontstring(button, cfg.font, 12, "OUTLINE")
	time:SetPoint("CENTER", button, "CENTER", 1, 0)
	time:SetJustifyH("CENTER")
	time:SetVertexColor(1,1,1)
	button.time = time
	
	local count = lib.gen_fontstring(button, cfg.font, 12, "OUTLINE")
	count:SetPoint("CENTER", button, "BOTTOMRIGHT", 0, 3)
	count:SetJustifyH("RIGHT")
	button.count = count

	--button.UpdateTooltip = updateTooltip
	
	button.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	button.icon:SetDrawLayer("ARTWORK")
end
local postUpdateIcon = function(self, unit, icon, index, offset, filter, isDebuff)--(element, unit, button, index)
	local _, _, _, _, _, duration, expirationTime, unitCaster, _ = UnitAura(unit, index, icon.filter)--(unit, index, button.filter)
	
	if duration and duration > 0 then
		icon.time:Show()
		icon.timeLeft = expirationTime	
		icon:SetScript("OnUpdate", setTimer)			
	else
		icon.time:Hide()
		icon.timeLeft = math.huge
		icon:SetScript("OnUpdate", nil)
	end
	
	-- Desaturate non-Player Debuffs
	if(unit == "target") then
		if(icon.filter == "HARMFUL") then
			if (unitCaster == 'player' or unitCaster == 'vehicle') then
				icon.icon:SetDesaturated(nil)                 
			elseif(not UnitPlayerControlled(unit)) then -- If Unit is Player Controlled don't desaturate debuffs
				icon:SetBackdropColor(0, 0, 0)
				icon.overlay:SetVertexColor(0.3, 0.3, 0.3)
				icon.icon:SetDesaturated(1)
			end
		end
	end
	icon:SetScript('OnMouseUp', function(self, mouseButton)
		if mouseButton == 'RightButton' then
			CancelUnitBuff('player', index)
	end end)
	icon.first = true
end

lib.createAuras = function(f)
	Auras = CreateFrame("Frame", nil, f)
	Auras.size = 20		
	Auras:SetHeight(41)
	Auras:SetWidth(f:GetWidth())
	Auras.spacing = 7
	if f.mystyle == "target" then
		--Auras:SetPoint("BOTTOMLEFT", f, 0,-48)
		Auras:SetPoint("TOP", f, "TOP", 0, 60)
		Auras.numBuffs = 10
		Auras.numDebuffs = 10
		Auras.size = 18	
		Auras.spacing = 4.4
	end
	if f.mystyle == "tot" then
		--Auras:SetPoint("LEFT", f, "LEFT", 0, -10)
		Auras:SetPoint("TOP", f, "TOP", 0, 45)
		Auras.numBuffs = 10
		Auras.numDebuffs = 5
		Auras.spacing = 4.4
		Auras.size = 16			
	end
	if f.mystyle == "focus" then
	Auras:SetPoint("TOPLEFT", f, "BOTTOMLEFT", 0, 20)
		Auras.numBuffs = 0
		Auras.numDebuffs = 7
		Auras.spacing = 9
	end
	Auras.gap = true
	Auras.initialAnchor = "BOTTOMLEFT"
	Auras["growth-x"] = "RIGHT"		
	Auras["growth-y"] = "UP"
	Auras.PostCreateIcon = postCreateIcon
	Auras.PostUpdateIcon = postUpdateIcon
	f.Auras = Auras
end
lib.createBuffs = function(f)
    b = CreateFrame("Frame", nil, f)
	b.size = 18
    b.num = 40
    b.spacing = 8
    b.onlyShowPlayer = cfg.buffsOnlyShowPlayer
    b:SetHeight((b.size+b.spacing)*4)
    b:SetWidth(f:GetWidth())
    if f.mystyle == "target" then
	    b.num = 10
		b:SetPoint("TOP", f, "TOP", 0, 50)
		b.initialAnchor = "TOPLEFT"
		b["growth-x"] = "RIGHT"
		b["growth-y"] = "UP"
    elseif f.mystyle == "player" then
	    b.size = 20
		--b:SetPoint("TOPRIGHT", UIParent,  -180, -10)
		b:SetPoint("TOPRIGHT", UIParent,  -20, -20)
		b.initialAnchor = "TOPRIGHT"
		b["growth-x"] = "LEFT"
		b["growth-y"] = "DOWN"
    elseif f.mystyle == "boss" then
	    b.size = 21
		b:SetPoint("TOPRIGHT", f, "TOPLEFT", -8, 0)
		b.initialAnchor = "TOPRIGHT"
		b["growth-x"] = "LEFT"
		b["growth-y"] = "DOWN"
		b.num = 5
	else
		b.num = 0
    end
    b.PostCreateIcon = postCreateIcon
    b.PostUpdateIcon = postUpdateIcon

    f.Buffs = b
end
lib.createDebuffs = function(f)
    b = CreateFrame("Frame", nil, f)
    b.size = 20
	b.num = 12
	b.onlyShowPlayer = cfg.debuffsOnlyShowPlayer
    b.spacing = 5
    b:SetHeight((b.size+b.spacing)*4)
    b:SetWidth(f:GetWidth())
	if f.mystyle == "target" then
		b:SetPoint("TOP", f, "TOP", 0, 25)
		b.initialAnchor = "TOPLEFT"
		b["growth-x"] = "RIGHT"
		b["growth-y"] = "UP"
	elseif f.mystyle == "player" then
	    b.size = 35
		b:SetPoint("BOTTOMLEFT", f, 0,-62)
		b.initialAnchor = "BOTTOMLEFT"
		b["growth-x"] = "RIGHT"
		b["growth-y"] = "DOWN"
		b.spacing = 7
	elseif f.mystyle == "boss" then
	    b.size = 28
		b:SetPoint("TOPLEFT", f, "TOPRIGHT", 8, 0)
		b.initialAnchor = "TOPLEFT"
		b.onlyShowPlayer = true
		b["growth-x"] = "RIGHT"
		b["growth-y"] = "DOWN"
		b.num = 5
		
	else
		b.num = 0
	end
    b.PostCreateIcon = postCreateIcon
    b.PostUpdateIcon = postUpdateIcon

    f.Debuffs = b
end
lib.gen_WeaponEnchant = function(self)
	self.Enchant = CreateFrame("Frame", nil, self)
	self.Enchant:SetSize(52, 24)
	self.Enchant:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -25, -200)
	self.Enchant.size = 26
	self.Enchant.spacing = 6
	self.Enchant.initialAnchor = "LEFT"
	self.Enchant["growth-y"] = "RIGHT"
	self.Enchant:SetFrameLevel(10)

	self.PostCreateEnchantIcon = postCreateIcon
	self.PostUpdateEnchantIcon = postUpdateIcon
end
lib.PortraitPostUpdate = function(element, unit)
	if not UnitExists(unit) or not UnitIsConnected(unit) or not UnitIsVisible(unit) then
		element:Hide()
	else
		element:Show()
		element:SetCamera(0)
	end
end
lib.PostUpdateRaidFrame = function(Health, unit, min, max)
	local disconnnected = not UnitIsConnected(unit)
	local dead = UnitIsDead(unit)
	local ghost = UnitIsGhost(unit)
	if disconnnected or dead or ghost then
		Health:SetValue(max)	
		if(disconnnected) then
			Health:SetStatusBarColor(0,0,0,0.6)
		elseif(ghost) then
			Health:SetStatusBarColor(1,1,1,0.6)
		elseif(dead) then
			Health:SetStatusBarColor(1,0,0,0.7)
		end
	else
		Health:SetValue(min)
		if(unit == 'vehicle') then
			Health:SetStatusBarColor(22/255, 106/255, 44/255)
		end
	end
end
lib.addEclipseBar = function(self)
	if playerClass ~= "DRUID" then return end
	local eclipseBar = CreateFrame('Frame', nil, self)
	eclipseBar:SetPoint('BOTTOMLEFT', self, 'TOPLEFT', 0, 6)
	eclipseBar:SetSize(self:GetWidth(), 6)
	local h = CreateFrame("Frame", nil, eclipseBar)
	h:SetFrameLevel(0)
	h:SetPoint("TOPLEFT",-5,5)
	h:SetPoint("BOTTOMRIGHT",5,-5)
	frame1px1(h)
	CreateShadow(h)
	local lunarBar = CreateFrame('StatusBar', nil, eclipseBar)
	lunarBar:SetPoint('LEFT', eclipseBar, 'LEFT', 0, 0)
	lunarBar:SetSize(self:GetWidth(), 6)
	lunarBar:SetStatusBarTexture(cfg.statusbar_texture)
	lunarBar:SetStatusBarColor(0, 0, 1)
	eclipseBar.LunarBar = lunarBar
	local solarBar = CreateFrame('StatusBar', nil, eclipseBar)
	solarBar:SetPoint('LEFT', lunarBar:GetStatusBarTexture(), 'RIGHT', 0, 0)
	solarBar:SetSize(self:GetWidth(), 6)
	solarBar:SetStatusBarTexture(cfg.statusbar_texture)
	solarBar:SetStatusBarColor(1, 3/5, 0)
	eclipseBar.SolarBar = solarBar
	local eclipseBarText = solarBar:CreateFontString(nil, 'OVERLAY')
	eclipseBarText:SetPoint('CENTER', eclipseBar, 'CENTER', 0, 1)
	eclipseBarText:SetFont(cfg.font, 10, "OUTLINE")
	self:Tag(eclipseBarText, '[pereclipse]%')
	self.EclipseBar = eclipseBar
end
lib.genShards = function(self)
	if playerClass ~= "WARLOCK" then return end
		local wb = CreateFrame("Frame", "WarlockSpecBars", self)
		wb:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0,7)
		wb:SetWidth(self:GetWidth())
		wb:SetHeight(6)
					
		wb:SetBackdropColor(0, 0, 0)
		wb:SetBackdropBorderColor(0, 0, 0)	

		wb:SetFrameLevel(6)
			for i = 1, 4 do
				wb[i] = CreateFrame("StatusBar", "WarlockSpecBars"..i, wb)
				wb[i]:SetHeight(6)
				wb[i]:SetStatusBarTexture(cfg.statusbar_texture)
						
					if i == 1 then
						wb[i]:SetWidth(120 / 4, 6)
						wb[i]:SetPoint("LEFT", wb, "LEFT", 0, 0)
					else
						wb[i]:SetWidth(120 / 4, 6)
						wb[i]:SetPoint("LEFT", wb[i-1], "RIGHT", 1, 0)
					end
						wb[i].bg = wb[i]:CreateTexture(nil, 'ARTWORK')
						
			end
		wb:SetScript("OnShow", function(self) 
		local f = self:GetParent()			
		end)
					
		wb:SetScript("OnHide", function(self)
		local f = self:GetParent()
		end)
		wb.backdrop = CreateFrame("Frame", nil, wb)
	--framefix1px(wb.backdrop)
	CreateShadowclassbar(wb.backdrop)
	wb.backdrop:SetBackdropBorderColor(.2,.2,.2,1)
	wb.backdrop:SetPoint("TOPLEFT", -2, 2)
	wb.backdrop:SetPoint("BOTTOMRIGHT", 2, -2)
	wb.backdrop:SetFrameLevel(wb:GetFrameLevel() - 1)		
		self.WarlockSpecBars = wb				
	
end
lib.genHolyPower = function(self)
	if playerClass ~= "PALADIN" then return end
	local bars = CreateFrame("Frame", nil, self)
	bars:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0,7)
	bars:SetWidth(self:GetWidth())
	bars:SetHeight(6)
	bars:SetFrameLevel(6)

	for i = 1, 5 do					
		bars[i]=CreateFrame("StatusBar", nil, bars)
		bars[i]:SetHeight(bars:GetHeight())					
		bars[i]:SetStatusBarTexture(cfg.statusbar_texture)
		bars[i]:GetStatusBarTexture():SetHorizTile(false)

		bars[i].bg = bars[i]:CreateTexture(nil, 'BORDER')
		bars[i]:SetStatusBarColor(228/255,225/255,16/255)
		bars[i].bg:SetTexture(228/255,225/255,16/255)
		
		local h = CreateFrame("Frame",nil,bars[i])
		h:SetFrameLevel(10)
		h:SetPoint("TOPLEFT",-3,3)
		h:SetPoint("BOTTOMRIGHT",3,-3)
		CreateShadowclassbar(h)
		
		if i == 1 then
			bars[i]:SetPoint("LEFT", bars)
		else
			bars[i]:SetPoint("LEFT", bars[i-1], "RIGHT", 1, 0)
		end
		
		bars[i].bg:SetAllPoints(bars[i])
		bars[i]:SetWidth((bars:GetWidth() - 2)/5)
		bars[i].bg:SetTexture(cfg.statusbar_texture)					
		bars[i].bg:SetAlpha(.15)
	end
				
	bars.backdrop = CreateFrame("Frame", nil, bars)
	--framefix1px(bars.backdrop)---CreateShadowclassbar
	-- CreateShadowclassbar(bars.backdrop)
	bars.backdrop:SetBackdropBorderColor(.2,.2,.2,1)
	bars.backdrop:SetPoint("TOPLEFT", -2, 2)
	bars.backdrop:SetPoint("BOTTOMRIGHT", 2, -2)
	bars.backdrop:SetFrameLevel(10)
	bars.Override = UpdateHoly
	self.HolyPower = bars	
end

local chi
local chibar
local chinum
local chipoints = {}

local UpdateChi = function()
	local chi = UnitPower("player",SPELL_POWER_CHI )
	local chimax = UnitPowerMax("player",SPELL_POWER_CHI )
	if chinum ~= chimax then
		if chimax == 4 then
			chipoints[5]:Hide()
			for i = 1,4 do
				chipoints[i]:SetWidth(chibar:GetWidth()/4-2)
			end
		elseif chimax == 5 then
			chipoints[5]:Show()
			for i = 1,5 do
				chipoints[i]:SetWidth(chibar:GetWidth()/5-2)
			end
		end
	end
	chinum = chimax
	for i = 1,chimax do
		if i <= chi then
			chipoints[i]:Show()
		else
			chipoints[i]:Hide()
		end
	end
end

local CreateChi = function()
	chibar:RegisterEvent("UNIT_POWER")
	chibar:RegisterEvent("UNIT_DISPLAYPOWER")
	chibar:SetScript("OnEvent",UpdateChi)
	
	for i=1,5 do
		chipoints[i] = CreateFrame("StatusBar","chipoints"..i,chibar)
		chipoints[i]:SetHeight(5)
		chipoints[i]:SetWidth(chibar:GetWidth()/5)
		chipoints[i]:SetFrameLevel(11)
		chipoints[i]:SetStatusBarTexture(cfg.statusbar_texture)
		chipoints[i]:SetStatusBarColor(.9,.99,.9)
		
		local h = CreateFrame("Frame",nil,chipoints[i])
		h:SetFrameLevel(10)
		h:SetPoint("TOPLEFT",-3,3)
		h:SetPoint("BOTTOMRIGHT",3,-3)
		CreateShadowclassbar(h)
	
		if i==1 then
			chipoints[i]:SetPoint("LEFT",chibar,"LEFT",1,0)
		else
			chipoints[i]:SetPoint("TOPLEFT",chipoints[i-1], "TOPRIGHT",2,0)
		end
		chipoints[i]:Hide()
	end
end

lib.addHarmony = function(self)
	if playerClass ~= "MONK" then return end
	chi = SPELL_POWER_CHI 
	local coloron = {.9, .9, .9, 1}
	local coloroff = {.2, .2, .2, 1}
	
	chibar = CreateFrame("Frame",nil,self)
	chibar:SetPoint("CENTER",self.Health,"TOP",0,7)
	chibar:SetHeight(5)
	chibar:SetWidth(self.Health:GetWidth())--(self.Health:GetWidth()/2+75)
	chibar:SetFrameLevel(11)
		
	chibar:RegisterEvent("PLAYER_ENTERING_WORLD")
	chibar:SetScript("OnEvent", CreateChi)
end

lib.ShadowOrbsBar = function(self)
    if playerClass ~= "PRIEST" then return end
				
		local bars = CreateFrame("Frame", nil, self)
		bars:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0,7)
		bars:SetWidth(self:GetWidth())
		bars:SetHeight(6)
		bars:SetFrameLevel(6)
			
	for i = 1, 3 do
		bars[i]=CreateFrame("StatusBar", nil, bars)
		bars[i]:SetHeight(bars:GetHeight())					
		bars[i]:SetStatusBarTexture(cfg.statusbar_texture)
		bars[i]:GetStatusBarTexture():SetHorizTile(false)
		
		bars[i].bg = bars[i]:CreateTexture(nil, 'BORDER')
		bars[i]:SetStatusBarColor(0.70, 0.32, 0.75)
		bars[i].bg:SetTexture(228/255,225/255,16/255)
		
		local h = CreateFrame("Frame",nil,bars[i])
		h:SetFrameLevel(10)
		h:SetPoint("TOPLEFT",-3,3)
		h:SetPoint("BOTTOMRIGHT",3,-3)
		CreateShadowclassbar(h)
		
		if i == 1 then
			bars[i]:SetPoint("LEFT", bars)
		else
			bars[i]:SetPoint("LEFT", bars[i-1], "RIGHT", 1, 0)
		end
		bars[i].bg:SetAllPoints(bars[i])
		bars[i]:SetWidth((bars:GetWidth() - 2)/3)
		bars[i].bg:SetTexture(cfg.statusbar_texture)					
		bars[i].bg:SetAlpha(.15)
	end
			
		bars.backdrop = CreateFrame("Frame", nil, bars)
		bars.backdrop:SetBackdropBorderColor(.2,.2,.2,1)
		bars.backdrop:SetPoint("TOPLEFT", -2, 2)
		bars.backdrop:SetPoint("BOTTOMRIGHT", 2, -2)
		bars.backdrop:SetFrameLevel(10)

		self.ShadowOrbsBar = bars	
end
lib.genRunes = function(self)
	if playerClass ~= "DEATHKNIGHT" then return end
	local runes = CreateFrame("Frame", nil, self)
	runes:SetPoint("BOTTOMLEFT", self, "TOPLEFT",0,7)
	runes:SetFrameStrata("LOW")
	runes:SetWidth(self:GetWidth())
	runes:SetHeight(6)
	runes:SetFrameLevel(6)
	
	for i = 1, 6 do
		runes[i] = CreateFrame("StatusBar", nil, runes)
		runes[i]:SetHeight(runes:GetHeight())
		runes[i]:SetWidth((runes:GetWidth() - 5) / 6)
		runes[i]:SetStatusBarTexture(cfg.statusbar_texture)
		runes[i]:GetStatusBarTexture():SetHorizTile(false)
		local h = CreateFrame("Frame",nil,runes[i])
		h:SetFrameLevel(10)
		h:SetPoint("TOPLEFT",-3,3)
		h:SetPoint("BOTTOMRIGHT",3,-3)
		CreateShadowclassbar(h)
		
		if (i == 1) then
			runes[i]:SetPoint("LEFT", runes)
		else
			runes[i]:SetPoint("LEFT", runes[i-1], "RIGHT", 1, 0)
		end
	end
		
	runes.backdrop = CreateFrame("Frame", nil, runes)
	runes.backdrop:SetBackdropBorderColor(.2,.2,.2,1)
	runes.backdrop:SetPoint("TOPLEFT", -2, 2)
	runes.backdrop:SetPoint("BOTTOMRIGHT", 2, -2)
	runes.backdrop:SetFrameLevel(runes:GetFrameLevel() - 1)

	self.Runes = runes
end
lib.genCPoints = function(self)
	local bars = CreateFrame("Frame", nil, self)
	bars:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
	bars:SetWidth(self:GetWidth())
	bars:SetHeight(8)
	bars:SetBackdropBorderColor(0,0,0,0)
	bars:SetBackdropColor(0,0,0,0)
		
	for i = 1, 5 do					
		bars[i] = CreateFrame("StatusBar", self:GetName().."_Combo"..i, bars)
		bars[i]:SetHeight(8)					
		bars[i]:SetStatusBarTexture(cfg.statusbar_texture)
		bars[i]:GetStatusBarTexture():SetHorizTile(false)
							
		if i == 1 then
			bars[i]:SetPoint("LEFT", bars)
		else
			bars[i]:SetPoint("LEFT", bars[i-1], "RIGHT", 1, 0)
		end
		bars[i]:SetAlpha(0.15)
		bars[i]:SetWidth((self:GetWidth() - 4)/5)
	end
		
	bars[1]:SetStatusBarColor(0.69, 0.31, 0.31)		
	bars[2]:SetStatusBarColor(0.69, 0.31, 0.31)
	bars[3]:SetStatusBarColor(0.65, 0.63, 0.35)
	bars[4]:SetStatusBarColor(0.65, 0.63, 0.35)
	bars[5]:SetStatusBarColor(0.33, 0.59, 0.33)
		
	self.CPoints = bars
	self.CPoints.Override = ComboDisplay
		
	bars.FrameBackdrop = CreateFrame("Frame", nil, bars[1])
	--framefix1px(bars.FrameBackdrop)
	CreateShadowclassbar(bars.FrameBackdrop)
	bars.FrameBackdrop:SetBackdropBorderColor(.2,.2,.2,1)
	bars.FrameBackdrop:SetPoint("TOPLEFT", bars, "TOPLEFT", -2, 2)
	bars.FrameBackdrop:SetPoint("BOTTOMRIGHT", bars, "BOTTOMRIGHT", 2, -2)
	bars.FrameBackdrop:SetFrameLevel(bars:GetFrameLevel() - 1)
end
lib.ReadyCheck = function(self)
	if cfg.RCheckIcon then
		rCheck = self.Health:CreateTexture(nil, "OVERLAY")
		rCheck:SetSize(14, 14)
		rCheck:SetPoint("BOTTOMLEFT", self.Health, "TOPRIGHT", -13, -12)
		rCheck.finishedTimer = 10
		rCheck.fadeTimer = 3
		self.ReadyCheck = rCheck
	end
end
lib.raidDebuffs = function(f)
	if cfg.showRaidDebuffs then
		local raid_debuffs = {
			debuffs = {
			},
		}

		local instDebuffs = {}
		local instances = raid_debuffs.instances
		local getzone = function()
			local zone = GetInstanceInfo()
			if instances[zone] then
				instDebuffs = instances[zone]
			else
				instDebuffs = {}
			end
		end

		local debuffs = raid_debuffs.debuffs
		local CustomFilter = function(icons, ...)
			local _, icon, name, _, _, _, dtype = ...
			if instDebuffs[name] then
				icon.priority = instDebuffs[name]
				return true
			elseif debuffs[name] then
				icon.priority = debuffs[name]
				return true
			else
				icon.priority = 0
			end
		end

		local dbsize = 18
		local debuffs = CreateFrame("Frame", nil, f)
		debuffs:SetWidth(dbsize) debuffs:SetHeight(dbsize)
		debuffs:SetPoint("CENTER", 0, 0)
		debuffs.size = dbsize
		
		debuffs.CustomFilter = CustomFilter
		f.raidDebuffs = debuffs
	end
end

lib.AltPowerBar = function(self)
	local AltPowerBar = CreateFrame("StatusBar", nil, self.Health)
	AltPowerBar:SetFrameLevel(self.Health:GetFrameLevel() + 1)

	AltPowerBar:SetStatusBarTexture(cfg.statusbar_texture)
	AltPowerBar:GetStatusBarTexture():SetHorizTile(false)
	AltPowerBar:EnableMouse(true)
	AltPowerBar:SetFrameStrata("HIGH")
	AltPowerBar:SetFrameLevel(5)
	
	if self.unit == "boss" then
		AltPowerBar:SetPoint("BOTTOM", self, "BOTTOM", 0, -5)
		AltPowerBar:SetWidth(self:GetWidth()-30)
		AltPowerBar:SetHeight(5)
	else	
	AltPowerBar:SetPoint("BOTTOM", self, "BOTTOM", 0, -20)
	AltPowerBar:SetWidth(self:GetWidth())
	AltPowerBar:SetHeight(5)
	end
	
	local h = CreateFrame("Frame", nil, AltPowerBar)
	h:SetFrameLevel(4)
	h:SetPoint("TOPLEFT",-5,5)
	h:SetPoint("BOTTOMRIGHT",5,-5)
	--frame1px1(h)
	CreateShadow(h)
				
	AltPowerBar.text = SetFontString(AltPowerBar, cfg.font)
	AltPowerBar.text:SetPoint("CENTER")
	AltPowerBar.text:SetJustifyH("CENTER")
	self:Tag(AltPowerBar.text, '[altpower]')
		
	AltPowerBar:HookScript("OnShow", AltPowerBarOnToggle)
	AltPowerBar:HookScript("OnHide", AltPowerBarOnToggle)

	self.AltPowerBar = AltPowerBar		
	self.AltPowerBar.PostUpdate = AltPowerBarPostUpdate
end

lib.TotemBars = function(self)
	if cfg.TotemBars then
		if playerClass ~= "SHAMAN" then return end
			self.TotemBar = {}
			self.TotemBar.Destroy = true
			self.TotemBar.colors = {{233/255, 46/255, 16/255};{173/255, 217/255, 25/255};{35/255, 127/255, 255/255};{178/255, 53/255, 240/255};}
			local TotemBar = CreateFrame('Frame', nil, self)
			TotemBar:SetPoint('BOTTOMLEFT', self, 'TOPLEFT', 0, 6)
			TotemBar:SetHeight(6)
			TotemBar:SetWidth(self:GetWidth())
			local h = CreateFrame("Frame", nil, TotemBar)
			h:SetFrameLevel(10)
			h:SetPoint("TOPLEFT",-5,5)
			h:SetPoint("BOTTOMRIGHT",5,-5)
			frame1px1(h)
			-- CreateShadow(h)
			for i = 1, 4 do
				self.TotemBar[i] = CreateFrame("StatusBar", nil, TotemBar)
				self.TotemBar[i]:SetHeight(6)
				self.TotemBar[i]:SetWidth(self:GetWidth()/4 - 1)
				self.TotemBar[i]:SetStatusBarTexture(cfg.statusbar_texture)
				self.TotemBar[i]:SetFrameLevel(11)
				if (i == 1) then
					self.TotemBar[i]:SetPoint("LEFT", TotemBar, "LEFT", 0, 0)
				else
					self.TotemBar[i]:SetPoint('TOPLEFT', self.TotemBar[i-1], "TOPRIGHT", 2, 0)
				end
				self.TotemBar[i]:GetStatusBarTexture():SetHorizTile(false)
				self.TotemBar[i]:SetMinMaxValues(0, 1)
				self.TotemBar[i].bg = self.TotemBar[i]:CreateTexture(nil, "BORDER")
				self.TotemBar[i].bg:SetAllPoints()
				self.TotemBar[i].bg:SetTexture(cfg.statusbar_texture)
				self.TotemBar[i].bg:SetVertexColor(0.15, 0.15, 0.15)
			end	
	end
end
lib.Experience = function(self)
	if cfg.Experiencebar then 
		local Experience = CreateFrame('StatusBar', nil, self)
		Experience:SetStatusBarTexture(cfg.statusbar_texture)
		Experience:SetStatusBarColor(0, 0.7, 1)
		Experience:SetPoint('TOPRIGHT', oUF_Player,'TOPRIGHT', 9, 0)---('BOTTOM', self,'BOTTOM', 0, -2)
		-- Experience:SetHeight(5)
		-- Experience:SetWidth(self:GetWidth())
		
		-- Experience:SetFrameLevel(11)
		-- Experience.Tooltip = true
		----------------
	    Experience:SetHeight(32)
	    Experience:SetWidth(5)
	    Experience:SetFrameLevel(2)
	    Experience.Tooltip = true
	    Experience:SetOrientation("VERTICAL")		
		----------------
		local h = CreateFrame("Frame", nil, Experience)
		h:SetFrameLevel(10)
		h:SetPoint("TOPLEFT",-5,5)
		h:SetPoint("BOTTOMRIGHT",5,-5)
		frame1px1(h)
		CreateShadow(h)
				
		local Rested = CreateFrame('StatusBar', nil, Experience)
		Rested:SetStatusBarTexture(cfg.statusbar_texture)
		Rested:SetStatusBarColor(0, 0.4, 1, 0.6)
		------------
	    Rested:SetFrameLevel(2)
	    Rested:SetOrientation("VERTICAL")
	    -----------
		Rested:SetAllPoints(Experience)
				
		self.Experience = Experience
		self.Experience.Rested = Rested
		self.Experience.PostUpdate = ExperiencePostUpdate
	end
end
lib.Reputation = function(self)
if cfg.Reputationbar then 
	local Reputation = CreateFrame('StatusBar', nil, self)
	Reputation:SetStatusBarTexture(cfg.statusbar_texture)
	Reputation:SetWidth(5)
	
	Reputation:SetHeight(32)
	Reputation:SetPoint('TOPLEFT', oUF_Player,'TOPLEFT', -9, 0)--('BOTTOM', self,'BOTTOM', 0, -2)
	Reputation:SetFrameLevel(2)
	-----
	Reputation:SetOrientation("VERTICAL")
	-----
	local h = CreateFrame("Frame", nil, Reputation)
	h:SetFrameLevel(10)
	h:SetPoint("TOPLEFT",-5,5)
	h:SetPoint("BOTTOMRIGHT",5,-5)
	frame1px1(h)
	CreateShadow(h)

	Reputation.PostUpdate = UpdateReputationColor
	Reputation.Tooltip = true
	self.Reputation = Reputation
end
end
lib.debuffHighlight = function(self)
	if cfg.enableDebuffHighlight then
		local dbh = self.Health:CreateTexture(nil, "OVERLAY")
		dbh:SetAllPoints(self.Health)
		dbh:SetTexture(cfg.statusbar_texture)
		dbh:SetBlendMode("ADD")
		dbh:SetVertexColor(0,0,0,0) -- set alpha to 0 to hide the texture
		self.DebuffHighlight = dbh
		self.DebuffHighlightAlpha = 0.5
		self.DebuffHighlightFilter = true
	end
end

local AWPostCreateIcon = function(AWatch, icon, spellID, name, self)
	icon.cd:SetReverse(true)
	local count = lib.gen_fontstring(icon, cfg.font, 10, "OUTLINE")
	count:SetPoint("CENTER", icon, "BOTTOM", 3, 3)
	icon.count = count		
	local h = CreateFrame("Frame", nil, icon)
	h:SetFrameLevel(4)
	h:SetPoint("TOPLEFT",-3,3)
	h:SetPoint("BOTTOMRIGHT",3,-3)
	
end
lib.createAuraWatch = function(self, unit)
	if cfg.showAuraWatch then
		local auras = {}
		local spellIDs = {
			DEATHKNIGHT = {
			},
			DRUID = {
				33763, -- Lifebloom
				8936, -- Regrowth
				774, -- Rejuvenation
				48438, -- Wild Growth
			},
			HUNTER = {
				34477, -- Misdirection
			},
			MAGE = {
				1459, -- Arcane Brilliance
			},
			PALADIN = {
				53563, -- Beacon of Light
				25771, -- Forbearance
			},
			PRIEST = { 
				17, -- Power Word: Shield
				139, -- Renew
				33076, -- Prayer of Mending
			},
			ROGUE = {
				57934, -- Tricks of the Trade
			},
			SHAMAN = {
				974, -- Earth Shield
				61295, -- Riptide
			},
			WARLOCK = {
				20707, -- Soulstone Resurrection
			},
			MONK = {
				117666, -- 帝王传承
			},
			WARRIOR = {
			},
		}
		auras.onlyShowPresent = true
		auras.anyUnit = true
		auras.PostCreateIcon = AWPostCreateIcon
		-- Set any other AuraWatch settings
		auras.icons = {}
		for i, sid in pairs(spellIDs[playerClass]) do
			local icon = CreateFrame("Frame", nil, self)
			icon.spellID = sid
			-- set the dimensions and positions
			icon:SetWidth(8)
			icon:SetHeight(8)
			icon:SetFrameLevel(5)
			icon:SetPoint("TOPRIGHT", self, "TOPLEFT", 9 * i, 1)
			auras.icons[sid] = icon
		end
		self.AuraWatch = auras
	end
end

lib.createIndicators = function(self, unit)
	if cfg.showIndicators then
		local auraStatus
		auraStatus = self:CreateFontString(nil, "ARTWORK")
		auraStatus:SetPoint("TOPLEFT", -5, 5)
		auraStatus:SetFont(cfg.font, 6, "THINOUTLINE")
		self:Tag(auraStatus, oUF.Indicators["TL"])	
		self.AuraStatusTopLeft = auraStatus	
		auraStatus = self:CreateFontString(nil, "OVERLAY")
		auraStatus:SetPoint("TOPRIGHT", 5, 5)
		auraStatus:SetFont(cfg.font, 6, "OUTLINE")
		self:Tag(auraStatus, oUF.Indicators["TR"])		
		self.AuraStatusTopRight = auraStatus	
		auraStatus = self:CreateFontString(nil, "ARTWORK")
		auraStatus:ClearAllPoints()
		auraStatus:SetPoint("BOTTOMLEFT", -5, -5)
		auraStatus:SetFont(cfg.font, 6, "THINOUTLINE")
		self:Tag(auraStatus, oUF.Indicators["BL"])		
		self.AuraStatusBottomLeft = auraStatus		
		auraStatus = self:CreateFontString(nil, "ARTWORK")
		auraStatus:SetPoint("CENTER", self, "BOTTOMRIGHT", 5, -5)
		auraStatus:SetFont(cfg.font, 11, "THINOUTLINE")
		self:Tag(auraStatus, oUF.Indicators["BR"])		
		self.AuraStatusBottomRight = auraStatus
	end
end
lib.healcomm = function(self, unit)
if cfg.HealFrames then
		local mhpb = CreateFrame('StatusBar', nil, self.Health)
		mhpb:SetPoint('TOPLEFT', self.Health:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
		mhpb:SetPoint('BOTTOMLEFT', self.Health:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
		mhpb:SetWidth(65)
		mhpb:SetStatusBarTexture(cfg.statusbar_texture)
		mhpb:SetStatusBarColor(0, 1, 0.5, 0.25)

		local ohpb = CreateFrame('StatusBar', nil, self.Health)
		ohpb:SetPoint('TOPLEFT', mhpb:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
		ohpb:SetPoint('BOTTOMLEFT', mhpb:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
		ohpb:SetWidth(65)
		ohpb:SetStatusBarTexture(cfg.statusbar_texture)
		ohpb:SetStatusBarColor(0, 1, 0, 0.25)

		self.HealPrediction = {
			myBar = mhpb,
			otherBar = ohpb,
			maxOverflow = 1,
		}
	end
end

lib.FocusText = function(self)
	local focusdummy = CreateFrame("BUTTON", "focusdummy", self, "SecureActionButtonTemplate")
	focusdummy:SetFrameStrata("HIGH")
	focusdummy:SetWidth(25)
	focusdummy:SetHeight(25)
	focusdummy:SetPoint("CENTER", self.Health, 0, 0)
	focusdummy:EnableMouse(true)
	focusdummy:RegisterForClicks("AnyUp")
	focusdummy:SetAttribute("type", "macro")
	focusdummy:SetAttribute("macrotext", "/focus")
	focusdummy:SetBackdrop({
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        edgeFile = "Interface\\Buttons\\WHITE8x8",
		edgeSize = 1,
		insets = {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0
		}
	})
	focusdummy:SetBackdropColor(.1,.1,.1,0)
	focusdummy:SetBackdropBorderColor(0,0,0,0)

	focusdummytext = focusdummy:CreateFontString(self,"OVERLAY")
	focusdummytext:SetPoint("CENTER", self.Health, 0, 3)
	focusdummytext:SetFont("FONTS\\ARIALN.TTF", 11, "OUTLINE")
	focusdummytext:SetText("焦点")
	focusdummytext:SetVertexColor(1,0.2,0.1,0)

	focusdummy:SetScript("OnLeave", function(self) focusdummytext:SetVertexColor(1,0.2,0.1,0) end)
	focusdummy:SetScript("OnEnter", function(self) focusdummytext:SetTextColor(.6,.6,.6) end)	
end

lib.ClearFocusText = function(self)
	local clearfocus = CreateFrame("BUTTON", "focusdummy", self, "SecureActionButtonTemplate")
	clearfocus:SetFrameStrata("HIGH")
	clearfocus:SetWidth(25)
	clearfocus:SetHeight(20)
	clearfocus:SetPoint("TOP", self,0, 0)
	clearfocus:EnableMouse(true)
	clearfocus:RegisterForClicks("AnyUp")
	clearfocus:SetAttribute("type", "macro")
	clearfocus:SetAttribute("macrotext", "/clearfocus")

	clearfocus:SetBackdrop({
		bgFile =  [=[Interface\ChatFrame\ChatFrameBackground]=],
        edgeFile = "Interface\\Buttons\\WHITE8x8",
		edgeSize = 1,
		insets = {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0
		}
	})
	clearfocus:SetBackdropColor(.1,.1,.1,0)
	clearfocus:SetBackdropBorderColor(0,0,0,0)

	clearfocustext = clearfocus:CreateFontString(self,"OVERLAY")
	clearfocustext:SetPoint("CENTER", self.Health, 0, 0)
	clearfocustext:SetFont("FONTS\\ARIALN.TTF", 11, "OUTLINE")
	clearfocustext:SetText("取消焦点")
	clearfocustext:SetVertexColor(1,0.2,0.1,0)

	clearfocus:SetScript("OnLeave", function(self) clearfocustext:SetVertexColor(1,0.2,0.1,0) end)
	clearfocus:SetScript("OnEnter", function(self) clearfocustext:SetTextColor(.6,.6,.6) end)
end

ns.lib = lib