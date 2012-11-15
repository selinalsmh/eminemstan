local addon, ns = ...
local cfg = ns.cfg
local UnitExists,UnitGUID,UnitAura,GetTime = UnitExists,UnitGUID,UnitAura,GetTime

local OVERLAY = "Interface\\TargetingFrame\\UI-TargetingFrame-Flash"
local blankTex = "Interface\\Buttons\\WHITE8x8"	

local backdrop = {
	edgeFile = cfg.backdrop_edge_texture, edgeSize = 3,
	insets = {left = 3, right = 3, top = 3, bottom = 3}}

local numChildren = -1
local frames = {}
local mult = 768/string.match(GetCVar("gxResolution"), "%d+x(%d+)")/0.8
local noscalemult = 768/string.match(GetCVar("gxResolution"), "%d+x(%d+)")
local day, hour, minute, second = 86400, 3600, 60, 1

local function scale(x)
	return (mult*math.floor(x/mult+.5))
end


local DebuffWhiteList = {        --DEBUFF白名单（不在下面列表的全部不显示）
	-- Death Knight
		
	-- Mage
		--[GetSpellInfo(44457)] = true, --活动炸弹
		--[GetSpellInfo(11366)] = true, --炎爆术DOT
		--[GetSpellInfo(92315)] = true,  --炎爆术! DOT
		--[GetSpellInfo(12654)] = true, --点燃
		--[GetSpellInfo(22959)] = true, --临界炽燃
	
	-- Priest
		[GetSpellInfo(589)] = true, --暗言术痛
		[GetSpellInfo(34914)] = true, --吸血鬼之触
		--[GetSpellInfo(2944)] = true, --瘟疫
		
	
}

local function UpdateAuraAnchors(frame)
	for i = 1, 5 do
		if frame.icons and frame.icons[i] and frame.icons[i]:IsShown() then
			if frame.icons.lastShown then 
				frame.icons[i]:SetPoint("RIGHT", frame.icons.lastShown, "LEFT", -2, 0)
			else
				frame.icons[i]:SetPoint("RIGHT",frame.icons,"RIGHT")
			end
			frame.icons.lastShown = frame.icons[i]
		end
	end
	
	frame.icons.lastShown = nil;
end

local function CreateAuraIcon(parent)
	local button = CreateFrame("Frame",nil,parent)
	button:SetScript("OnHide", function(self) UpdateAuraAnchors(self:GetParent()) end)
	button:SetWidth(20)
	button:SetHeight(20)

	button.shadow = CreateFrame("Frame", nil, button)
	button.shadow:SetFrameLevel(0)
	button.shadow:SetPoint("TOPLEFT", -2*noscalemult, 2*noscalemult)
	button.shadow:SetPoint("BOTTOMRIGHT", 2*noscalemult, -2*noscalemult)
	button.shadow:SetBackdrop(backdrop)
	button.shadow:SetBackdropColor( 0, 0, 0 )
	button.shadow:SetBackdropBorderColor( 0, 0, 0 )
	
	button.bord = button:CreateTexture(nil, "BORDER")
	button.bord:SetTexture(0, 0, 0, 1)
	button.bord:SetPoint("TOPLEFT",button,"TOPLEFT", noscalemult,-noscalemult)
	button.bord:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",-noscalemult,noscalemult)
	
	button.bg2 = button:CreateTexture(nil, "ARTWORK")
	button.bg2:SetTexture(.05,.05,.05,.9)
	button.bg2:SetPoint("TOPLEFT",button,"TOPLEFT", noscalemult*2,-noscalemult*2)
	button.bg2:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",-noscalemult*2,noscalemult*2)	
	
	button.icon = button:CreateTexture(nil, "OVERLAY")
	button.icon:SetPoint("TOPLEFT",button,"TOPLEFT", noscalemult*3,-noscalemult*3)
	button.icon:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",-noscalemult*3,noscalemult*3)
	button.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

	button.text = button:CreateFontString(nil, 'OVERLAY')
	button.text:SetPoint("BOTTOM", 1, 1)
	button.text:SetJustifyH('CENTER')
	button.text:SetFont(cfg.font, 10, "OUTLINE")
	button.text:SetShadowColor(0, 0, 0, 0)

	button.count = button:CreateFontString(nil,"OVERLAY")
	button.count:SetFont(cfg.font,9,"THINOUTLINE")
	button.count:SetShadowColor(0, 0, 0, 0.4)
	button.count:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 2, 0)
	return button
end


local function formatTime(s)
	if s >= day then
		return format("%dd", ceil(s / hour))
	elseif s >= hour then
		return format("%dh", ceil(s / hour))
	elseif s >= minute then
		return format("%dm", ceil(s / minute))
	--elseif s >= minute / 12 then
		
	end
	return floor(s)
	--return format("%.1f", s)
end

local function UpdateAuraTimer(self, elapsed)
	if not self.timeLeft then return end
	self.elapsed = (self.elapsed or 0) + elapsed
	if self.elapsed >= 0.1 then
		if not self.firstUpdate then
			self.timeLeft = self.timeLeft - self.elapsed
		else
			self.timeLeft = self.timeLeft - GetTime()
			self.firstUpdate = false
		end
		if self.timeLeft > 0 then
			local time = formatTime(self.timeLeft)
			self.text:SetText(time)
			if self.timeLeft <= 5 then
				self.text:SetTextColor(1, 0, 0)
			elseif self.timeLeft <= minute then
				self.text:SetTextColor(1, 1, 0)
			else
				self.text:SetTextColor(1, 1, 1)
			end
		else
			self.text:SetText('')
			self:SetScript("OnUpdate", nil)
			self:Hide()
		end
		self.elapsed = 0
	end
end

local function UpdateAuraIcon(button, unit, index, filter)
	local name,_,icon,count,debuffType,duration,expirationTime,_,_,_,spellID = UnitAura(unit,index,filter)
	
	if debuffType then
		button.bord:SetTexture(DebuffTypeColor[debuffType].r, DebuffTypeColor[debuffType].g, DebuffTypeColor[debuffType].b)
	else
		button.bord:SetTexture(1, 0, 0, 1)
	end

	button.icon:SetTexture(icon)
	button.firstUpdate = true
	button.expirationTime = expirationTime
	button.duration = duration
	button.spellID = spellID	
	button.timeLeft = expirationTime
	if count > 1 then 
		button.count:SetText(count)
	else
		button.count:SetText("")
	end
	if not button:GetScript("OnUpdate") then
		button:SetScript("OnUpdate", UpdateAuraTimer)
	end
	button:Show()
end

local function OnAura(frame, unit)
	if not frame.icons or not frame.unit then return end
	local i = 1
	for index = 1,40 do
		if i > 5 then return end
		local match
		local name,_,_,_,_,duration,_,caster,_,_,spellid = UnitAura(frame.unit,index,"HARMFUL")
		
		--if caster == "player" and duration>0 then match = true end
		if DebuffWhiteList[name] and caster == "player" and duration>0 then match = true end
		--if "DEATHKNIGHT" == select(2, UnitClass("player"))   then match = false end
		if match == true then
			if not frame.icons[i] then frame.icons[i] = CreateAuraIcon(frame) end
			local icon = frame.icons[i]
			if i == 1 then icon:SetPoint("RIGHT",frame.icons,"RIGHT") end
			if i ~= 1 and i <= 5 then icon:SetPoint("RIGHT", frame.icons[i-1], "LEFT", -2, 0) end
			i = i + 1
			UpdateAuraIcon(icon, frame.unit, index, "HARMFUL")
		end
	end
	for index = i, #frame.icons do frame.icons[index]:Hide() end  
end

local function OnHide(frame)
	frame.hp:SetStatusBarColor(frame.hp.rcolor, frame.hp.gcolor, frame.hp.bcolor)
	frame.overlay:Hide()
	frame.cb:Hide()
	frame.unit = nil
	frame.threatStatus = nil
	frame.guid = nil
	frame.hasClass = nil
	frame.isFriendly = nil
	frame.hp.rcolor = nil
	frame.hp.gcolor = nil
	frame.hp.bcolor = nil
	if frame.icons then
		for _,icon in ipairs(frame.icons) do
			icon:Hide()
		end
	end	
	
	frame:SetScript("OnUpdate",nil)
end

local function CheckUnit_Guid(frame, ...)
	
	if UnitExists("target") and frame:GetAlpha() == 1 then  
		frame.guid = UnitGUID("target")
		frame.unit = "target"
		OnAura(frame, "target")
	 elseif frame.overlay:IsShown() and UnitExists("mouseover") then
       
		 frame.guid = UnitGUID("mouseover")
		 frame.unit = "mouseover"
		 OnAura(frame, "mouseover")
	 else
		 frame.unit = nil
	end	
end

local function CheckSettings(frame, ...)
	-- cfg.hpWidth, cfg.hpHeight
	  frame.hp:ClearAllPoints()
	  frame.hp:SetSize(cfg.hpWidth, cfg.hpHeight)	
	  frame.hp:SetPoint('CENTER', frame, 0, 10)
	  frame.hp:GetStatusBarTexture():SetHorizTile(true)
	  -- local r, g, b = frame.hp:GetStatusBarColor()
		-- local newr, newg, newb
		-- if g + b == 0 then --敌对NPC
			-- newr, newg, newb = 0.94, 0.376, 0.376
			-- frame.hp:SetStatusBarColor(0.94, 0.376, 0.376,1)
		-- elseif r + b == 0 then --友善NPC
			-- newr, newg, newb = 0.33, 0.59, 0.33
			-- frame.hp:SetStatusBarColor(0.33, 0.59, 0.33,1)
		-- elseif r + g == 0 then --友方玩家
			-- newr, newg, newb = 0.31, 0.45, 0.63
			-- frame.hp:SetStatusBarColor(0.31, 0.45, 0.63,1)
		-- elseif 2 - (r + g) < 0.05 and b == 0 then --中立NPC
			-- newr, newg, newb = 1, 0.84, 0.33
			-- frame.hp:SetStatusBarColor(0, 0, 1,1)
		-- end
	  
	if frame.hp:GetWidth() ~= cfg.hpWidth or frame.hp:GetHeight() ~= cfg.hpHeight then
	      frame.hp:SetSize(cfg.hpWidth, cfg.hpHeight)
    end
end


local function MatchGUID(frame, destGUID, spellID)
	if not frame.guid then return end
	
	
	if frame.guid == destGUID then
		for _,icon in ipairs(frame.icons) do 
			if icon.spellID == spellID then 
				icon:Hide() 
			end 
		end
	end
end




-- format numbers
function round(val, idp)
  if idp and idp > 0 then
    local mult = 10^idp
    return math.floor(val * mult + 0.5) / mult
  end
  return math.floor(val + 0.5)
end

function SVal(val)
	if(val >= 1e6) then
		return round(val/1e6,1).."m"
	elseif(val >= 1e3) then
		return round(val/1e3,1).."k"
	else
		return val
	end
end

local function QueueObject(parent, object)
	parent.queue = parent.queue or {}
	parent.queue[object] = true
end

local function HideObjects(parent)
	for object in pairs(parent.queue) do
		if(object:GetObjectType() == 'Texture') then
			object:SetTexture(nil)
		else
			object:Hide()
		end
	end
end

local function UpdateThreat(frame,elapsed)
	if(frame.region:IsShown()) then
		local _, val = frame.region:GetVertexColor()
		if(val > 0.7) then
			frame.name:SetTextColor(1, 1, 0)
		else
			frame.name:SetTextColor(1, 0, 0)
		end
	else
		frame.name:SetTextColor(1, 1, 1)
	end
	
	if UnitExists("target") and frame:GetAlpha() == 1 then   
     
	  if not UnitIsPlayer("target") then   
	  
	     frame.hp:SetStatusBarColor(0, 1, 1)
		 
	  end
	  
	else
	frame.hp:SetStatusBarColor(frame.r, frame.g, frame.b)

	end
	
	if not frame.oldglow:IsShown() then
		frame.hp.hpGlow:SetBackdropBorderColor(0, 0, 0)
	else
		frame.hp.hpGlow:SetBackdropBorderColor(frame.oldglow:GetVertexColor())
	end
	
	-- show current health value
    local minHealth, maxHealth = frame.healthOriginal:GetMinMaxValues()
    local valueHealth = frame.healthOriginal:GetValue()
	local d =(valueHealth/maxHealth)*100

		if(d < 100) and valueHealth > 1 then
			frame.hp.value:SetText(SVal(valueHealth).." - ")
			frame.hp.pct:SetText(format("%.1f %s",d,"%"))
		else
			frame.hp.value:SetText("")
			frame.hp.pct:SetText("")
		end

		if(d <= 60 and d >40) then
			frame.hp.value:SetTextColor(253/255, 238/255, 80/255)
			frame.hp.pct:SetTextColor(253/255, 238/255, 80/255)
		elseif(d <= 40 and d > 25) then
			frame.hp.value:SetTextColor(250/255, 130/255, 0/255)
			frame.hp.pct:SetTextColor(250/255, 130/255, 0/255)
		elseif(d <= 25) then
			frame.hp.value:SetTextColor(200/255, 20/255, 40/255)
			frame.hp.pct:SetTextColor(200/255, 20/255, 40/255)
		else
			frame.hp.value:SetTextColor(1,1,1)
			frame.hp.pct:SetTextColor(1,1,1)
		end	
end


local function UpdateObjects(frame)
	frame = frame:GetParent()
	local r, g, b = frame.hp:GetStatusBarColor()
		local newr, newg, newb
		if g + b == 0 then --敌对NPC
			newr, newg, newb = 0.94, 0.376, 0.376
			frame.hp:SetStatusBarColor(0.94, 0.376, 0.376)
		elseif r + b == 0 then --友善NPC
			newr, newg, newb = 0.33, 0.59, 0.33
			frame.hp:SetStatusBarColor(0.33, 0.59, 0.33)
		elseif r + g == 0 then --友方玩家
			newr, newg, newb = 0.31, 0.45, 0.63
			frame.hp:SetStatusBarColor(0.31, 0.45, 0.63)
		elseif 2 - (r + g) < 0.05 and b == 0 then --中立NPC
			newr, newg, newb = 1, 0.84, 0.33
			frame.hp:SetStatusBarColor(1, 0.84, 0.33)
		else
			newr, newg, newb = r, g, b
		end
	frame.r, frame.g, frame.b = newr, newg, newb
	
	frame.hp:ClearAllPoints()
	frame.hp:SetSize(cfg.hpWidth, cfg.hpHeight)	
	frame.hp:SetPoint('CENTER', frame, 0, 10)
	frame.hp:GetStatusBarTexture():SetHorizTile(true)
	
	frame.name:SetText(frame.oldname:GetText())
	
	frame.highlight:ClearAllPoints()
	frame.highlight:SetAllPoints(frame.hp)

	-- color hp bg dependend on hp color
    local BGr, BGg, BGb = frame.hp:GetStatusBarColor()
	frame.hp.hpbg2:SetVertexColor(BGr*0.18, BGg*0.18, BGb*0.18)
	
	local level, elite, mylevel = tonumber(frame.level:GetText()), frame.elite:IsShown(), UnitLevel("player")
	local lvlr, lvlg, lvlb = frame.level:GetTextColor()
	frame.level:ClearAllPoints()
	frame.level:SetPoint("RIGHT", frame.hp, "LEFT", -2, 0)
    frame.level:Hide() --隐藏等级1
	if frame.boss:IsShown() then
		frame.level:SetText("B")
		frame.name:SetText('|cffDC3C2D'..frame.level:GetText()..'|r '..frame.oldname:GetText())
	elseif not elite and level == mylevel then
		frame.name:SetText(frame.oldname:GetText())
		--隐藏等级2
	else
		frame.level:SetText(level..(elite and "+" or ""))
		frame.name:SetText(format('|cff%02x%02x%02x', lvlr*255, lvlg*255, lvlb*255)..frame.level:GetText()..'|r '..frame.oldname:GetText())
		--注释到这里为止
	end
	
	if frame.icons then return end
	frame.icons = CreateFrame("Frame",nil,frame)
	frame.icons:SetPoint("BOTTOMRIGHT",frame,"TOPRIGHT", 0, 9)
	frame.icons:SetWidth(130)
	frame.icons:SetHeight(25)
	frame.icons:SetFrameLevel(frame:GetFrameLevel()+2)
	frame:RegisterEvent("UNIT_AURA")
	frame:HookScript("OnEvent", OnAura)
	
	HideObjects(frame)
end

local function UpdateCastbar(frame)
	--frame:ClearAllPoints()
	--frame:SetSize(cfg.cbWidth, cfg.cbHeight)
	--frame:SetPoint('TOP', frame:GetParent(), 'BOTTOM', 0, -5)
	--frame:GetStatusBarTexture():SetHorizTile(true)

    frame.border:ClearAllPoints()
    frame.border:SetPoint("TOP",frame:GetParent().hp,"BOTTOM", 0,-5)
	frame.border:SetSize(cfg.cbWidth, cfg.cbHeight)
    frame:SetPoint("RIGHT",frame.border,0,0)
    frame:SetPoint("TOP",frame.border,0,0)
    frame:SetPoint("BOTTOM",frame.border,0,0)
    frame:SetPoint("LEFT",frame.border,0,0)

	if not frame.shield:IsShown() then
		frame:SetStatusBarColor(.5,.65,.85)
	else
		frame:SetStatusBarColor(1,.49,0)
	end
end	

local OnValueChanged = function(self)
	if self.needFix then
		UpdateCastbar(self)
		self.needFix = nil
	end
	-- have to define not protected casts colors again due to some weird bug reseting colors when you start channeling a spell 
 	if not self.shield:IsShown() then
		self:SetStatusBarColor(.5,.65,.85)
	else
		self:SetStatusBarColor(1,.49,0)
	end 
end

local OnSizeChanged = function(self)
	self.needFix = true
end

local function SkinObjects(frame)
	local hp, cb = frame:GetChildren()

	local threat, hpborder, overlay, oldname, level, bossicon, raidicon, elite = frame:GetRegions()
	local _, cbborder, cbshield, cbicon = cb:GetRegions()
	
	frame.healthOriginal = hp
	
	overlay:SetTexture(cfg.statusbar_texture)
	overlay:SetVertexColor(0.25, 0.25, 0.25)
	frame.highlight = overlay
	frame.overlay = overlay
	
	local offset = UIParent:GetScale() / hp:GetEffectiveScale()
	local hpbg = hp:CreateTexture(nil, 'BACKGROUND')
	hpbg:SetPoint('BOTTOMRIGHT', offset, -offset)
	hpbg:SetPoint('TOPLEFT', -offset, offset)
	hpbg:SetTexture(0, 0, 0)

	hp.hpbg2 = hp:CreateTexture(nil, 'BORDER')
	hp.hpbg2:SetAllPoints(hp)
	hp.hpbg2:SetTexture(blankTex)	
	
	hp:HookScript('OnShow', UpdateObjects)
	hp:SetStatusBarTexture(cfg.statusbar_texture)
	frame.hp = hp
	
	hp.hpGlow = CreateFrame("Frame", nil, hp)
	hp.hpGlow:SetFrameLevel(1) --修正血条层级错乱
	hp.hpGlow:SetPoint("TOPLEFT", hp, "TOPLEFT", -3.5, 3.5)
	hp.hpGlow:SetPoint("BOTTOMRIGHT", hp, "BOTTOMRIGHT", 3.5, -3.5)
	hp.hpGlow:SetBackdrop(backdrop)
	hp.hpGlow:SetBackdropColor(0, 0, 0)
	hp.hpGlow:SetBackdropBorderColor(0, 0, 0)
  --生命值
	hp.value = hp:CreateFontString(nil, "OVERLAY")	
	hp.value:SetFont(cfg.font, cfg.fontsize, cfg.fontflag)
	hp.value:SetPoint("LEFT", 25 , 0)
  --生命值百分比
	hp.pct = hp:CreateFontString(nil, "OVERLAY")	
	hp.pct:SetFont(cfg.font, cfg.fontsize, cfg.fontflag)
	hp.pct:SetPoint("LEFT", hp.value, "RIGHT" ,-5, 0 )
  
	local offset = UIParent:GetScale() / cb:GetEffectiveScale()
	local cbbg = cb:CreateTexture(nil, 'BACKGROUND')
	cbbg:SetPoint('BOTTOMRIGHT', offset, -offset)
	cbbg:SetPoint('TOPLEFT', -offset, offset)
	cbbg:SetTexture(0, 0, 0)

	local cbbd = cb:CreateTexture(nil, 'BORDER')
	cbbd:SetAllPoints(cb)
	cbbd:SetTexture(.1, .1, .1)
	cb.border = cbbd

	cbicon:ClearAllPoints()
	cbicon:SetPoint("TOPRIGHT", hp, "TOPLEFT", -4, 3)		
	cbicon:SetSize(cfg.cbIconSize, cfg.cbIconSize)
	cbicon:SetTexCoord(.07, .93, .07, .93)
	
	local cbiconbg = cb:CreateTexture(nil, 'BACKGROUND')
	cbiconbg:SetPoint('BOTTOMRIGHT', cbicon, offset, -offset)
	cbiconbg:SetPoint('TOPLEFT', cbicon, -offset, offset)
	cbiconbg:SetTexture(0, 0, 0)
	
	cb.icon = cbicon
	cb.shield = cbshield
	cb:HookScript('OnShow', UpdateCastbar)
	cb:HookScript('OnSizeChanged', OnSizeChanged)
	cb:HookScript('OnValueChanged', OnValueChanged)	
	cb:SetStatusBarTexture(cfg.statusbar_texture)
	frame.cb = cb
 
	local name = hp:CreateFontString(nil, 'OVERLAY')
	name:SetPoint('BOTTOMLEFT', hp, 'TOPLEFT', -10, 1)
	name:SetPoint('BOTTOMRIGHT', hp, 'TOPRIGHT', 10, 1)
	name:SetFont(cfg.font, cfg.fontsize, cfg.fontflag)
	frame.oldname = oldname
	frame.name = name
	
	frame.level = level
	level:SetFont("Fonts\\Hooge.ttf", 8, "OUTLINE MONOCHROME") --(cfg.font, cfg.fontsize, "THINOUTLINE")
	--level:SetShadowOffset(1.25, -1.25)

	frame.elite = elite
	frame.boss = bossicon
	elite:SetTexture(nil)
	bossicon:SetTexture(nil)
	
	raidicon:ClearAllPoints()
	raidicon:SetPoint("BOTTOM", name, "TOP", 0, 0)
	raidicon:SetSize(cfg.raidIconSize, cfg.raidIconSize)	

	frame.oldglow = threat
	threat:SetTexture(nil)
	
  

	QueueObject(frame, hpborder)
	QueueObject(frame, cbshield)
	QueueObject(frame, cbborder)
	QueueObject(frame, oldname)

	UpdateObjects(hp)
	UpdateCastbar(cb)
    
	frame:HookScript('OnHide', OnHide)
	frames[frame] = true
   
end


local function ForEachPlate(functionToRun, ...)
	for frame in pairs(frames) do
		if frame:IsShown() then
			functionToRun(frame, ...)
		end
	end
end

local select = select
local function HookFrames(...)
	for index = 1, select('#', ...) do
		local frame = select(index, ...)
		local region = frame:GetRegions()

		
		if (not frames[frame] and (frame:GetName() and not frame.isSkinned and frame:GetName():find("NamePlate%d")) and region and region:GetObjectType() == "Texture") then
			SkinObjects(frame)
			frame.region = region
			frame.isSkinned = true
		end
	end
end



CreateFrame('Frame'):SetScript('OnUpdate', function(self, elapsed)
	if(WorldFrame:GetNumChildren() ~= numChildren) then
		numChildren = WorldFrame:GetNumChildren()
		HookFrames(WorldFrame:GetChildren())
	end

	if(self.elapsed and self.elapsed > 0.1) then
		for frame in pairs(frames) do
			UpdateThreat(frame)
		end

		self.elapsed = 0
	else
		self.elapsed = (self.elapsed or 0) + elapsed
	end
	
    ForEachPlate(CheckUnit_Guid)
	ForEachPlate(CheckSettings)
  
		

 

     
    
	
           
	
	
end)



local f = CreateFrame("Frame", nil, UIParent)
f:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
function f:COMBAT_LOG_EVENT_UNFILTERED(_, event, ...)
	if event == "SPELL_AURA_REMOVED" then
		local _, sourceGUID, _, _, _, destGUID, _, _, _, spellID = ...
		
		if sourceGUID == UnitGUID("player") then
			ForEachPlate(MatchGUID, destGUID, spellID)
		end
	end
end
 

f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
function f:PLAYER_ENTERING_WORLD()

	SetCVar("bloatthreat", 0)
	SetCVar("bloattest", 0)
	SetCVar("bloatnameplates", 0)
end

if cfg.combat_toggle then
	f:RegisterEvent("PLAYER_REGEN_ENABLED")
	function f:PLAYER_REGEN_ENABLED()
		SetCVar("nameplateShowEnemies", 0)
	end
	f:RegisterEvent("PLAYER_REGEN_DISABLED")
	function f.PLAYER_REGEN_DISABLED()
		SetCVar("nameplateShowEnemies", 1)
	end
end