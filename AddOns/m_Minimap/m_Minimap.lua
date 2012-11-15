-- Config
local Scale = 0.97				-- Minimap scale
--local ClassColorBorder = false	-- Should border around minimap be classcolored? Enabling it disables color settings below
--local r, g, b, a = 0, 0, 0, .7	-- Border colors and alhpa. More info: http://www.wowwiki.com/API_Frame_SetBackdropColor
--local BGThickness = 2           -- Border thickness in pixels
local MapPosition = {"TOPRIGHT", "UIParent", "TOPRIGHT", -10, -35}
local zoneTextYOffset = 10		-- Zone text position

-- Shape, location and scale
function GetMinimapShape() return "SQUARE" end
Minimap:ClearAllPoints()
Minimap:SetPoint(MapPosition[1], MapPosition[2], MapPosition[3], MapPosition[4] / Scale, MapPosition[5] / Scale)
MinimapCluster:SetScale(Scale)
--Minimap:SetFrameStrata("BACKGROUND")
Minimap:SetFrameLevel(10)

-- Mask texture hint => addon will work with Carbonite
local hint = CreateFrame("Frame")
local total = 0
local SetTextureTrick = function(self, elapsed)
    total = total + elapsed
    if(total > 2) then
        Minimap:SetMaskTexture("Interface\\Buttons\\WHITE8X8")
        hint:SetScript("OnUpdate", nil)
    end
end

hint:RegisterEvent("PLAYER_LOGIN")
hint:SetScript("OnEvent", function()
    hint:SetScript("OnUpdate", SetTextureTrick)
end)

-- Background
local bdcRGB = {.05, .05, .05, 0.8} --Background color
local bdbcRGB = {0, 0, 0, 1} --Border color
local backdrop = { 
		  bgFile = "Interface\\Buttons\\WHITE8x8", 
		  edgeFile = "Interface\\AddOns\\m_Minimap\\glow", 
		  edgeSize = 4, 
		  insets = { left = 3, right = 3, top = 3, bottom = 3}
}
local MinimapBG = CreateFrame("Frame", nil, Minimap)
MinimapBG:SetFrameLevel(Minimap:GetFrameLevel() - 1)
MinimapBG:SetPoint("TOP", 0, 4)
MinimapBG:SetPoint("BOTTOM", 0, -4)
MinimapBG:SetPoint("LEFT", -4, 0)
MinimapBG:SetPoint("RIGHT", 4, 0)
MinimapBG:SetBackdrop(backdrop)
MinimapBG:SetBackdropColor(unpack(bdcRGB))
MinimapBG:SetBackdropBorderColor(unpack(bdbcRGB))

-- Mousewheel zoom
Minimap:EnableMouseWheel(true)
Minimap:SetScript("OnMouseWheel", function(_, zoom)
    if zoom > 0 then
        Minimap_ZoomIn()
    else
        Minimap_ZoomOut()
    end
end)

-- Hiding ugly things
local dummy = function() end
local _G = getfenv(0)

local frames = {
    "GameTimeFrame",
    "MinimapBorderTop",
    "MinimapNorthTag",
    "MinimapBorder",
    "MinimapZoneTextButton",
    "MinimapZoomOut",
    "MinimapZoomIn",
    "MiniMapVoiceChatFrame",
    "MiniMapWorldMapButton",
	
    "MiniMapMailBorder",
--    "MiniMapBattlefieldBorder",
--    "FeedbackUIButton",
--	"MinimapBackdrop",
}

for i in pairs(frames) do
    _G[frames[i]]:Hide()
    _G[frames[i]].Show = dummy
end
MinimapCluster:EnableMouse(false)

-- Tracking
MiniMapTrackingBackground:SetAlpha(0)
MiniMapTrackingButton:SetAlpha(0)
MiniMapTracking:ClearAllPoints()
MiniMapTracking:SetPoint("BOTTOMLEFT", Minimap, -5, -7)

-- BG icon
--MiniMapBattlefieldFrame:ClearAllPoints()
--MiniMapBattlefieldFrame:SetPoint("TOP", Minimap, "TOP", 2, 8)

-- LFG icon
QueueStatusMinimapButton:ClearAllPoints()
QueueStatusMinimapButton:SetPoint("TOP", Minimap, "TOP", 1, 8)
QueueStatusMinimapButtonBorder:Hide()
-- QueueStatusMinimapButtonBorder:SetFrameStrata("MEDIUM")

-- Instance Difficulty flag
MiniMapInstanceDifficulty:ClearAllPoints()
MiniMapInstanceDifficulty:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 2, 2)
MiniMapInstanceDifficulty:SetScale(0.75)
MiniMapInstanceDifficulty:SetFrameStrata("LOW")

-- Guild Instance Difficulty flag
GuildInstanceDifficulty:ClearAllPoints()
GuildInstanceDifficulty:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 2, 2)
GuildInstanceDifficulty:SetScale(0.75)
GuildInstanceDifficulty:SetFrameStrata("LOW")

-- Mail icon
MiniMapMailFrame:ClearAllPoints()
MiniMapMailFrame:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 2, -6)
MiniMapMailIcon:SetTexture("Interface\\AddOns\\m_Minimap\\mail")

-- Invites Icon
GameTimeCalendarInvitesTexture:ClearAllPoints()
GameTimeCalendarInvitesTexture:SetParent("Minimap")
GameTimeCalendarInvitesTexture:SetPoint("TOPRIGHT")

if FeedbackUIButton then
FeedbackUIButton:ClearAllPoints()
FeedbackUIButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 6, -6)
FeedbackUIButton:SetScale(0.8)
end

if StreamingIcon then
StreamingIcon:ClearAllPoints()
StreamingIcon:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 8, 8)
StreamingIcon:SetScale(0.8)
end

-- Creating right click menu
local menuFrame = CreateFrame("Frame", "m_MinimapRightClickMenu", UIParent, "UIDropDownMenuTemplate")
local menuList = {
    {text = "角色信息",
    func = function() ToggleCharacter("PaperDollFrame") end},
    {text = "法术书",
    func = function() ToggleSpellBook("spell") end},
    {text = "天赋",
    func = function() ToggleTalentFrame() end},
    {text = "成就面板",
    func = function() ToggleAchievementFrame() end},
    {text = "任务",
    func = function() ToggleFrame(QuestLogFrame) end},
    {text = "好友",
    func = function() ToggleFriendsFrame(1) end},
    {text = "公会",
    func = function() ToggleGuildFrame(1) end},
    {text = "PvP",
    func = function() ToggleFrame(PVPFrame) end},
    {text = "地下城查找器",
    func = function() ToggleFrame(PVEFrame) end},
    {text = "帮助",
    func = function() ToggleHelpFrame() end},
    {text = "日历",
    func = function()
    if(not CalendarFrame) then LoadAddOn("Blizzard_Calendar") end
        Calendar_Toggle()
    end},
    {text = "地下城手册",
	func = function() ToggleEncounterJournal() end},
}

-- Click func
Minimap:SetScript("OnMouseUp", function(_, btn)
    if(btn=="MiddleButton") then
        ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, "cursor", 0, 0)
    elseif(btn=="RightButton") then
        EasyMenu(menuList, menuFrame, "cursor", 0, 0, "MENU", 1)
	else
		local x, y = GetCursorPosition()
		x = x / Minimap:GetEffectiveScale()
		y = y / Minimap:GetEffectiveScale()
		local cx, cy = Minimap:GetCenter()
		x = x - cx
		y = y - cy
		if ( sqrt(x * x + y * y) < (Minimap:GetWidth() / 2) ) then
			Minimap:PingLocation(x, y)
		end
		Minimap_SetPing(x, y, 1)
	end
end) 

-- Clock
if not IsAddOnLoaded("Blizzard_TimeManager") then
	LoadAddOn("Blizzard_TimeManager")
end
local clockFrame, clockTime = TimeManagerClockButton:GetRegions()
clockFrame:Hide()
clockTime:SetFont("Fonts\\FRIZQT__.ttf", 12, "THINOUTLINE")
clockTime:SetTextColor(1,1,1)
TimeManagerClockButton:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, -3)
TimeManagerClockButton:SetScript("OnClick", function(_,btn)
 	if btn == "LeftButton" then
		TimeManager_Toggle()
	end 
	if btn == "RightButton" then
		if not CalendarFrame then
			LoadAddOn("Blizzard_Calendar")
		end
		Calendar_Toggle()
	end
end)
	
-- Zone text
local zoneTextFrame = CreateFrame("Frame", nil, UIParent)
zoneTextFrame:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, zoneTextYOffset)
zoneTextFrame:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 0, zoneTextYOffset)
zoneTextFrame:SetHeight(19)
zoneTextFrame:SetAlpha(0)
MinimapZoneText:SetParent(zoneTextFrame)
MinimapZoneText:ClearAllPoints()
MinimapZoneText:SetPoint("LEFT", 2, 1)
MinimapZoneText:SetPoint("RIGHT", -2, 1)
MinimapZoneText:SetFont("Fonts\\FRIZQT__.ttf", 12, "THINOUTLINE")
Minimap:SetScript("OnEnter", function(self)
	UIFrameFadeIn(zoneTextFrame, 0.3, 0, 1)
end)
Minimap:SetScript("OnLeave", function(self)
	UIFrameFadeOut(zoneTextFrame, 0.3, 1, 0)
end)

--世界标记
local wm = CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton

wm:SetParent("UIParent")
wm:ClearAllPoints()
wm:SetPoint("LEFT", Minimap, "LEFT", -10, 20)
wm:SetSize(16, 16)
wm:Hide()

CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButtonLeft:SetAlpha(0)
CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButtonMiddle:SetAlpha(0)
CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButtonRight:SetAlpha(0)

wm:RegisterEvent("GROUP_ROSTER_UPDATE")
wm:HookScript("OnEvent", function(self, event) 
   if UnitIsGroupAssistant("player") or UnitIsGroupLeader("player") or (IsInGroup() and not IsInRaid()) then 
      self:Show() 
   else 
      self:Hide() 
   end 
end)

local wmmenuFrame = CreateFrame("Frame", "wmRightClickMenu", UIParent, "UIDropDownMenuTemplate")
local wmmenuList = {
    {text = "就位确认",
    func = function() DoReadyCheck() end},
    {text = "角色检查",
    func = function() InitiateRolePoll() end},
    {text = "转化为团队",
    func = function() ConvertToRaid() end},
    {text = "转化为小队",
    func = function() ConvertToParty() end},
}

wm:SetScript('OnMouseUp', function(self, button)
wm:StopMovingOrSizing()
    if (button=="RightButton") then
        EasyMenu(wmmenuList, wmmenuFrame, "cursor", -10, 90, "MENU", 2)
    end
end) 
