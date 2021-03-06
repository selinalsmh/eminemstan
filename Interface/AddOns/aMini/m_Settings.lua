﻿local SCREENSHOT_QUALITY = 8
local ainvenabled = false
local autorollgreens = false
local AutoRepair = false
local SellGreyCrap = true 
local autoUIscale = false
local HideErrors = false
local autoacceptDE = false
SpellActivationOverlayFrame:SetFrameStrata("BACKGROUND")


local run SHOW_BUFF_DURATIONS="1"
-----------------------------------------------聊天栏贴出来的装备鼠标放上去会显示详细信息 
local LinkHover = {}; LinkHover.show = {
   ["achievement"] = true,
   ["enchant"]     = true,
   ["glyph"]       = true,
   ["item"]        = true,
   ["quest"]       = true,
   ["spell"]       = true,
   ["talent"]      = true,
   ["unit"]        = true,
   }
---------------- > Show tooltips when hovering a link in chat (credits to Adys for his LinkHover)
function LinkHover.OnHyperlinkEnter(_this, linkData, link)
   local t = linkData:match("^(.-):")
   if LinkHover.show[t] then
      ShowUIPanel(GameTooltip)
      GameTooltip:SetOwner(_this, "ANCHOR_RIGHT")
      GameTooltip:SetHyperlink(link)
      GameTooltip:Show()
   end
end
function LinkHover.OnHyperlinkLeave(_this, linkData, link)
   local t = linkData:match("^(.-):")
   if LinkHover.show[t] then
      HideUIPanel(GameTooltip)
   end
end
local function main()
   for i = 1, NUM_CHAT_WINDOWS do
      local frame = _G["ChatFrame"..i]
      frame:SetScript("OnHyperlinkEnter", LinkHover.OnHyperlinkEnter)
      frame:SetScript("OnHyperlinkLeave", LinkHover.OnHyperlinkLeave)
   end
end
main()

--------------------------------------------闷棍监视 by 王坤
local SaySapped = CreateFrame("Frame")
SaySapped:SetScript("OnEvent",function(_, _, _, eventType, _, _, _, _, _, _, destName, _, _, spellID)
if ((eventType == "SPELL_AURA_APPLIED" or eventType == "SPELL_AURA_REFRESH")
and (spellID == 6770)
and (destName == UnitName("player")))
then
  SendChatMessage("<< 有贼 >>", "SAY")
end
end)
SaySapped:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

--------------------------------------------成就截图
local function TakeScreen(delay, func, ...)
local waitTable = {}
local waitFrame = CreateFrame("Frame", "WaitFrame", UIParent)
   waitFrame:SetScript("onUpdate", function (self, elapse)
      local count = #waitTable
      local i = 1
      while (i <= count) do
         local waitRecord = tremove(waitTable, i)
         local d = tremove(waitRecord, 1)
         local f = tremove(waitRecord, 1)
         local p = tremove(waitRecord, 1)
         if (d > elapse) then
            tinsert(waitTable, i, {d-elapse, f, p})
            i = i + 1
         else
            count = count - 1
            f(unpack(p))
         end
      end
   end)
   tinsert(waitTable, {delay, func, {...} })
end
local function OnEvent(...)
   TakeScreen(1, Screenshot)
end
local AchScreen = CreateFrame("Frame")
AchScreen:RegisterEvent("ACHIEVEMENT_EARNED")
AchScreen:SetScript("OnEvent", OnEvent)


----------------------------------------------------------回收内存
local eventcount = 0
local a = CreateFrame("Frame")
a:RegisterAllEvents()
a:SetScript("OnEvent", function(self, event)
   eventcount = eventcount + 1
   if InCombatLockdown() then return end
   if eventcount > 6000 or event == "PLAYER_ENTERING_WORLD" then
      collectgarbage("collect")
      eventcount = 0
   end
end)

-------------------------------------------------------------------------------------截图
-- local ps = CreateFrame("Frame")
-- ps:RegisterEvent("PLAYER_ENTERING_WORLD")
-- ps:SetScript("OnEvent", function() 
	-- ps:UnregisterEvent("PLAYER_ENTERING_WORLD")
	-- SetBinding("F12","SCREENSHOT")
-- end)
-------------------------------------------------------------------------------------战网上线对话框位置
BNToastFrame:HookScript("OnShow", function(self)
   self:ClearAllPoints()
   self:SetPoint("BOTTOMLEFT", ChatFrame1Tab, "TOPLEFT", 0, 30)
end)
-------------------------------------------------------------------------------------毛茸茸的聊天泡泡
local chatbubblehook = CreateFrame("Frame", nil, UIParent)
local tslu = 0
local numkids = 0
local bubbles = {}

local function skinbubble(frame)
	for i=1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetTexture(nil)
		elseif region:GetObjectType() == "FontString" then
			frame.text = region
		end
	end
	frame:SetBackdrop({
		bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
		edgeFile = "Interface\\Addons\\media\\glow",
		edgeSize = 4,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
	})
	frame:SetBackdropColor(0, 0, 0, .5)
	frame:SetBackdropBorderColor(0, 0, 0)
	
	tinsert(bubbles, frame)
end

local function ischatbubble(frame)
	if frame:GetName() then return end
	if not frame:GetRegions() then return end
	return frame:GetRegions():GetTexture() == [[Interface\Tooltips\ChatBubble-Background]]
end

local freq = .1

chatbubblehook:SetScript("OnUpdate", function(chatbubblehook, elapsed)
	tslu = tslu + elapsed
	if tslu > freq then
		tslu = 0
		local newnumkids = WorldFrame:GetNumChildren()
		if newnumkids ~= numkids then
			for i=numkids + 1, newnumkids do
				local frame = select(i, WorldFrame:GetChildren())

				if ischatbubble(frame) then
					skinbubble(frame)
				end
			end
			numkids = newnumkids
		end
	end
end)
----------------------------------------------------------------------------------------------------------------------
--分解不必再点确定
local aotuClick = CreateFrame("Frame")
aotuClick:RegisterEvent("CONFIRM_DISENCHANT_ROLL")
aotuClick:RegisterEvent("CONFIRM_LOOT_ROLL")
aotuClick:RegisterEvent("LOOT_BIND_CONFIRM")      
aotuClick:SetScript("OnEvent", function(self, event, ...)
   for i = 1, STATICPOPUP_NUMDIALOGS do
      local frame = _G["StaticPopup"..i]
      if (frame.which == "CONFIRM_LOOT_ROLL" or frame.which == "LOOT_BIND" or frame.which == "LOOT_BIND_CONFIRM") and frame:IsVisible() then 
      StaticPopup_OnClick(frame, 1) 
      end
   end
end)

----------------------------------------------------------------------------------------------------------------------
--讓DropDownList1回到屏幕
DropDownList1:SetClampedToScreen(true)

--保持随机图标鼠标提示不出屏幕
-- LFDSearchStatus:SetClampedToScreen(true)
-- LFDDungeonReadyStatus:SetClampedToScreen(true)

----------------------------------------------------------------------------------------------------------------------
-- make alt power moveable and scale it down 移动BOSS能力条(音波值/腐化值等)
PlayerPowerBarAlt:SetScale(0.7)
PlayerPowerBarAlt:SetMovable(true)
PlayerPowerBarAlt:SetUserPlaced(true)
PlayerPowerBarAlt:SetFrameStrata("HIGH")
PlayerPowerBarAlt:SetScript("OnMouseDown", function()
if (IsAltKeyDown()) then
PlayerPowerBarAlt:ClearAllPoints()
PlayerPowerBarAlt:StartMoving()
end
end)

PlayerPowerBarAlt:SetScript('OnMouseUp', function(self, button)
PlayerPowerBarAlt:StopMovingOrSizing()
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


scalefix = CreateFrame("Frame")
scalefix:RegisterEvent("PLAYER_ENTERING_WORLD")
scalefix:SetScript("OnEvent", function(self, event)
   self:UnregisterEvent("PLAYER_ENTERING_WORLD")
   --SetCVar("useUiScale", 1)           --SetMultisampleFormat(1)   -- 多重採樣，1，2，4，8
   --SetCVar("uiScale", 0.75)
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------- > Some slash commands
SlashCmdList['RELOADUI'] = function() ReloadUI() end
SLASH_RELOADUI1 = '/rl'

SlashCmdList["TICKET"] = function() ToggleHelpFrame() end
SLASH_TICKET1 = "/gm"

SlashCmdList["READYCHECKSLASHRC"] = function() DoReadyCheck() end
SLASH_READYCHECKSLASHRC1 = '/rc'

SlashCmdList["DISABLE_ADDON"] = function(s) DisableAddOn(s) print(s, format("|cffd36b6b disabled")) end
SLASH_DISABLE_ADDON1 = "/dis"   -- You need to reload UI after enabling/disabling addon

SlashCmdList["ENABLE_ADDON"] = function(s) EnableAddOn(s) print(s, format("|cfff07100 enabled")) end
SLASH_ENABLE_ADDON1 = "/en"   -- You need to reload UI after enabling/disabling addon

SlashCmdList["CLCE"] = function() CombatLogClearEntries() end
SLASH_CLCE1 = "/clfix"
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- a command to show frame you currently have mouseovered
SlashCmdList["FRAME"] = function(arg)
	if arg ~= "" then
		arg = _G[arg]
	else
		arg = GetMouseFocus()
	end
	if arg ~= nil and arg:GetName() ~= nil then
		local point, relativeTo, relativePoint, xOfs, yOfs = arg:GetPoint()
		ChatFrame1:AddMessage("Name: |cffFFD100"..arg:GetName())
		if arg:GetParent() then
			ChatFrame1:AddMessage("Parent: |cffFFD100"..arg:GetParent():GetName())
		end
 		ChatFrame1:AddMessage("Width: |cffFFD100"..format("%.2f",arg:GetWidth()))
		ChatFrame1:AddMessage("Height: |cffFFD100"..format("%.2f",arg:GetHeight()))
		ChatFrame1:AddMessage("Strata: |cffFFD100"..arg:GetFrameStrata())
		ChatFrame1:AddMessage("Level: |cffFFD100"..arg:GetFrameLevel())
 		if xOfs then
			ChatFrame1:AddMessage("X: |cffFFD100"..format("%.2f",xOfs))
		end
		if yOfs then
			ChatFrame1:AddMessage("Y: |cffFFD100"..format("%.2f",yOfs))
		end
		if relativeTo then
			ChatFrame1:AddMessage("Point: |cffFFD100"..point.."|r anchored to "..relativeTo:GetName().."'s |cffFFD100"..relativePoint)
		end
		ChatFrame1:AddMessage("----------------------")
	elseif arg == nil then
		ChatFrame1:AddMessage("Invalid frame name")
	else
		ChatFrame1:AddMessage("Could not find frame info")
	end
end
SLASH_FRAME1 = "/gf"

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Quest tracker(by Tukz)
-- local wf = WatchFrame
-- local wfmove = false 

-- wf:SetMovable(true);
-- wf:SetClampedToScreen(false); 
-- wf:ClearAllPoints()
-- wf:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -200, -250)
-- wf:SetWidth(250)
-- wf:SetHeight(500)
-- wf:SetUserPlaced(true)
-- wf.SetPoint = function() end

-- local function WATCHFRAMELOCK()
   -- if wfmove == false then
      -- wfmove = true
      -- print("WatchFrame unlocked for drag")
      -- wf:EnableMouse(true);
      -- wf:RegisterForDrag("LeftButton"); 
      -- wf:SetScript("OnDragStart", wf.StartMoving); 
      -- wf:SetScript("OnDragStop", wf.StopMovingOrSizing);
   -- elseif wfmove == true then
      -- wf:EnableMouse(false);
      -- wfmove = false
      -- print("WatchFrame locked")
   -- end
-- end

-- SLASH_WATCHFRAMELOCK1 = "/wf"---解锁或鎖定命令
-- SlashCmdList["WATCHFRAMELOCK"] = WATCHFRAMELOCK 


----------------------------------------------------------------------------------------------------------------------
--进出副本自动收放任务追踪
 local autocollapse = CreateFrame("Frame")
autocollapse:RegisterEvent("ZONE_CHANGED_NEW_AREA")
autocollapse:RegisterEvent("PLAYER_ENTERING_WORLD")
autocollapse:SetScript("OnEvent", function(self)
   if IsInInstance() then
      WatchFrame.userCollapsed = true
      WatchFrame_Collapse(WatchFrame)
   else
      WatchFrame.userCollapsed = nil
      WatchFrame_Expand(WatchFrame)
   end
end)

----------------------------------------------------------------------------------------------------------------------
--语言过滤

local SetCVar, BNGetMatureLanguageFilter, BNSetMatureLanguageFilter = 
	  SetCVar, BNGetMatureLanguageFilter, BNSetMatureLanguageFilter
local eventFr=CreateFrame("Frame")
local function set() SetCVar("profanityFilter","0") if BNGetMatureLanguageFilter() then BNSetMatureLanguageFilter(false) end end
eventFr:SetScript("OnEvent",set)
eventFr:RegisterEvent("CVAR_UPDATE")
eventFr:RegisterEvent("VARIABLES_LOADED")
eventFr:RegisterEvent("BN_MATURE_LANGUAGE_FILTER")
set()

----------------------------------------------------------------------------------------------------------------------
---超出距离变红
hooksecurefunc("ActionButton_OnUpdate", function(self, elapsed)
	if ( self.rangeTimer == TOOLTIP_UPDATE_TIME and self.action) then
		local range = false
		if ( IsActionInRange(self.action) == 0 ) then
			getglobal(self:GetName().."Icon"):SetVertexColor(1, 0, 0)
			getglobal(self:GetName().."NormalTexture"):SetVertexColor(1, 0, 0)
			range = true
		end;
		if ( self.range ~= range and range == false ) then
			ActionButton_UpdateUsable(self)
		end;
		self.range = range
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- simple spec switching
SlashCmdList["SPEC"] = function() 
local spec = GetActiveSpecGroup()
if spec == 1 then GetActiveSpecGroup(2) elseif spec == 2 then GetActiveSpecGroup(1) end
end
SLASH_SPEC1 = "/ss"

---------------- > Proper Ready Check sound
local ShowReadyCheckHook = function(self, initiator, timeLeft)
	if initiator ~= "player" then PlaySound("ReadyCheck") end
end
hooksecurefunc("ShowReadyCheck", ShowReadyCheckHook)

---------------- > automatic UI Scale 
if autoUIscale then
	local scalefix = CreateFrame("Frame")
	scalefix:RegisterEvent("PLAYER_LOGIN")
	scalefix:SetScript("OnEvent", function()
		SetCVar("useUiScale", 1)
		SetCVar("uiScale", 768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)"))
	end)
end

---------------- > SetupUI


---------------- > AutoRepair and sell grey junk
--[[local g = CreateFrame("Frame")
g:RegisterEvent("MERCHANT_SHOW")
g:SetScript("OnEvent", function()    
	if(AutoRepair==true and CanMerchantRepair()) then
			  local cost = GetRepairAllCost()
		if cost > 0 then
			local money = GetMoney()
			if IsInGuild() then
				local guildMoney = GetGuildBankWithdrawMoney()
				if guildMoney > GetGuildBankMoney() then
					guildMoney = GetGuildBankMoney()
				end
				if guildMoney > cost and CanGuildBankRepair() then
					RepairAllItems(1)
					print(format("|cfff07100Repair cost covered by G-Bank: %.1fg|r", cost * 0.0001))
					return
				end
			end
			if money > cost then
					RepairAllItems()
					print(format("|cffead000Repair cost: %.1fg|r", cost * 0.0001))
			else
				print("Go farm newbie.")
			end
		end
	end 
    if(SellGreyCrap==true) then
        local bag, slot 
        for bag = 0, 4 do
            for slot = 0, GetContainerNumSlots(bag) do
                local link = GetContainerItemLink(bag, slot)
                if link and (select(3, GetItemInfo(link))==0) then
                    UseContainerItem(bag, slot)
                end
            end
        end
    end
end)
]]
---------------- > Moving TicketStatusFrame
TicketStatusFrame:ClearAllPoints()
TicketStatusFrame:SetPoint("TOPLEFT",UIParent,"TOPLEFT")
TicketStatusFrame.SetPoint = function() end

---------------- > ALT+RightClick to buy a stack
hooksecurefunc("MerchantItemButton_OnModifiedClick", function(self, button)
    if MerchantFrame.selectedTab == 1 then
        if IsAltKeyDown() and button=="RightButton" then
            local id=self:GetID()
			local quantity = select(4, GetMerchantItemInfo(id))
            local extracost = select(7, GetMerchantItemInfo(id))
            if not extracost then
                local stack 
				if quantity > 1 then
					stack = quantity*GetMerchantItemMaxStack(id)
				else
					stack = GetMerchantItemMaxStack(id)
				end
                local amount = 1
                if self.count < stack then
                    amount = stack / self.count
                end
                if self.numInStock ~= -1 and self.numInStock < amount then
                    amount = self.numInStock
                end
                local money = GetMoney()
                if (self.price * amount) > money then
                    amount = floor(money / self.price)
                end
                if amount > 0 then
                    BuyMerchantItem(id, amount)
                end
            end
        end
    end
end)

---------------- > Hiding default blizzard's Error Frame (thx nightcracker)
if HideErrors then
local f, o, ncErrorDB = CreateFrame("Frame"), "No error yet.", {
	["Inventory is full"] = true,
}
f:SetScript("OnEvent", function(self, event, error)
	if ncErrorDB[error] then
		UIErrorsFrame:AddMessage(error)
	else
	o = error
	end
end)
SLASH_NCERROR1 = "/error"
function SlashCmdList.NCERROR() print(o) end
UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")
f:RegisterEvent("UI_ERROR_MESSAGE")
end

---------------- > Autoinvite by whisper
local autoinvite = CreateFrame("frame")
autoinvite:RegisterEvent("CHAT_MSG_WHISPER")
autoinvite:SetScript("OnEvent", function(self,event,arg1,arg2)
	if ((not UnitExists("party1") or UnitIsGroupLeader("player") or UnitIsGroupAssistant("player") or UnitIsGroupLeader("player")) and arg1 == "1") and ainvenabled == true then
		InviteUnit(arg2)
	end
end)
function SlashCmdList.AUTOINVITE(msg, editbox)
	if (msg == 'off') then
		ainvenabled = false
		print("自动邀请已关闭")
	else
		ainvenabled = true
		SendChatMessage(msg.."开组!退组M我打1进组!","GUILD")
	end
end
SLASH_AUTOINVITE1 = '/ainv'
---------------- > Disband Group
local GroupDisband = function()
	local pName = UnitName("player")
	if UnitInRaid("player") then
	SendChatMessage("Disbanding group.", "RAID")
		for i = 1, GetNumRaidMembers() do
			local name, _, _, _, _, _, _, online = GetRaidRosterInfo(i)
			if online and name ~= pName then
				UninviteUnit(name)
			end
		end
	else
		SendChatMessage("Disbanding group.", "PARTY")
		for i = MAX_PARTY_MEMBERS, 1, -1 do
			if GetPartyMember(i) then
				UninviteUnit(UnitName("party"..i))
			end
		end
	end
	LeaveParty()
end
StaticPopupDialogs["DISBAND_RAID"] = {
	text = "Do you really want to disband this group?",
	button1 = YES,
	button2 = NO,
	OnAccept = GroupDisband,
	timeout = 0,
	whileDead = 1,
}

SlashCmdList["GROUPDISBAND"] = function()
	StaticPopup_Show("DISBAND_RAID")
end
SLASH_GROUPDISBAND1 = '/rd'

---------------- > Autogreed on greens © tekkub
if autorollgreens then
	local f = CreateFrame("Frame", nil, UIParent)
	f:RegisterEvent("START_LOOT_ROLL")
	f:SetScript("OnEvent", function(_, _, id)
	if not id then return end -- What the fuck?
	local _, _, _, quality, bop, _, _, canDE = GetLootRollItemInfo(id)
	if quality == 2 and not bop then RollOnLoot(id, canDE and 3 or 2) end
	end)
end

---------------- > ©tekKrush by tekkub
if autoacceptDE then
--	if GetNumRaidMembers() > 0 then return end
	local f = CreateFrame("Frame")
	f:RegisterEvent("CONFIRM_DISENCHANT_ROLL")
	f:SetScript("OnEvent", function(self, event, id, rollType)
		for i=1,STATICPOPUP_NUMDIALOGS do
			local frame = _G["StaticPopup"..i]
			if frame.which == "CONFIRM_LOOT_ROLL" and frame.data == id and frame.data2 == rollType and frame:IsVisible() then StaticPopup_OnClick(frame, 1) end
		end
	end)
end

----------------------------------------------------------------------------------------
--	Item reforge info(module from bTooltip by Fernir)
----------------------------------------------------------------------------------------
local StatNames = {
	ITEM_MOD_SPIRIT_SHORT, ITEM_MOD_DODGE_RATING_SHORT, ITEM_MOD_PARRY_RATING_SHORT, ITEM_MOD_HIT_RATING_SHORT,
	ITEM_MOD_CRIT_RATING_SHORT, ITEM_MOD_HASTE_RATING_SHORT, ITEM_MOD_EXPERTISE_RATING_SHORT, ITEM_MOD_MASTERY_RATING_SHORT
}
local ReforgeIDs = {
	{1, 2}, {1, 3}, {1, 4}, {1, 5}, {1, 6}, {1, 7}, {1, 8},
	{2, 1}, {2, 3}, {2, 4}, {2, 5}, {2, 6}, {2, 7}, {2, 8},
	{3, 1}, {3, 2}, {3, 4}, {3, 5}, {3, 6}, {3, 7}, {3, 8},
	{4, 1}, {4, 2}, {4, 3}, {4, 5}, {4, 6}, {4, 7}, {4, 8},
	{5, 1}, {5, 2}, {5, 3}, {5, 4}, {5, 6}, {5, 7}, {5, 8},
	{6, 1}, {6, 2}, {6, 3}, {6, 4}, {6, 5}, {6, 7}, {6, 8},
	{7, 1}, {7, 2}, {7, 3}, {7, 4}, {7, 5}, {7, 6}, {7, 8},
	{8, 1}, {8, 2}, {8, 3}, {8, 4}, {8, 5}, {8, 6}, {8, 7},
}
local function ReforgeInfo(self)
	local name, item = self:GetItem()
	if item then
		local regions = {self:GetRegions()}
		local itemLink = select(2, GetItemInfo(item))
		for i = 1, #regions do
			local region = regions[i]
			if region and region:GetObjectType() == "FontString" then
				local text = region:GetText()
				if text and text == REFORGED then
					local rid = tonumber(itemLink:match("item:%d+:%d+:%d+:%d+:%d+:%d+:%-?%d+:%-?%d+:%d+:(%d+)"))
					local info = ReforgeIDs[rid - 113 + 1]
					if info[1] and info[2] then
						region:SetText(text.." ("..StatNames[info[1]].." -> "..StatNames[info[2]]..")")
					end
				end
			end
		end
	end
end

GameTooltip:HookScript("OnTooltipSetItem", ReforgeInfo)
ItemRefTooltip:HookScript("OnTooltipSetItem", ReforgeInfo)
ItemRefShoppingTooltip1:HookScript("OnTooltipSetItem", ReforgeInfo)
ItemRefShoppingTooltip2:HookScript("OnTooltipSetItem", ReforgeInfo)
ItemRefShoppingTooltip3:HookScript("OnTooltipSetItem", ReforgeInfo)
ShoppingTooltip1:HookScript("OnTooltipSetItem", ReforgeInfo)
ShoppingTooltip2:HookScript("OnTooltipSetItem", ReforgeInfo)
ShoppingTooltip3:HookScript("OnTooltipSetItem", ReforgeInfo)


-----------------------------------------------斩杀提示-----------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
local cfg = {}
cfg.enableexecute = true
cfg.onlyshowboss = false
cfg.font = "Fonts\\ARKai_C.ttf"
cfg.fontflag = "OUTLINE" -- for pixelcfg.font stick to this else OUTLINE or THINOUTLINE
cfg.fontsize = 30 -- cfg.font size
cfg.iconsize = 24
band = bit.band

local announce = CreateFrame("Frame")
local COMBATLOG_OBJECT_AFFILIATION_MINE = COMBATLOG_OBJECT_AFFILIATION_MINE

local ClassThreshold = {
	["WARRIOR"] = { 0, 0, 0},--{ 0.2, 0.2, 0},
	["DRUID"] = { 0, 0, 0},--{ 0, 0.25, 0},
	["PALADIN"] = { 0, 0, 0},--{ 0, 0, 0.2},
	["PRIEST"] = { 0, 0, 0.2},
	["DEATHKNIGHT"] = { 0, 0.35, 0},
	["WARLOCK"] = { 0, 0, 0},--{ 0.25, 0.25, 0.25},
	["ROGUE"] = { 0, 0.35, 0},
	["HUNTER"] = { 0.2, 0.2, 0.2},
	["MAGE"] = { 0, 0, 0},--{ 0, 0.35, 0},
	["SHAMAN"] = { 0, 0, 0},	
	["MONK"] = { 0, 0, 0},
}
local ExecuteText = {
	["WARRIOR"] = GetSpellInfo(5308),--"斩杀",
	["PALADIN"] = GetSpellInfo(24275),--"愤怒之锤",
	["PRIEST"] = GetSpellInfo(129176),--"暗言术：灭",
 	--["WARLOCK"] = GetSpellInfo(1120),--"吸取灵魂",
	["ROGUE"] = GetSpellInfo(111240),--"斩击",
	["HUNTER"] = GetSpellInfo(53351),--"杀戮射击",
	["DEATHKNIGHT"] = GetSpellInfo(130735),--"灵魂收割",
}

local ExecuteThreshold, flag = ClassThreshold[select(2, UnitClass("player"))][GetSpecialization()], 1
 
--Frame function
local function CreateMessageFrame(name)
	local f = CreateFrame("ScrollingMessageFrame", name, UIParent)
	f:SetHeight(80)
	f:SetWidth(500)
	f:SetPoint("CENTER", 0, 120)
	f:SetFrameStrata("HIGH")
	f:SetTimeVisible(1.5)
	f:SetFadeDuration(1.5)
	f:SetMaxLines(3)
	f:SetFont(cfg.font, cfg.fontsize, cfg.fontflag)
	f:SetShadowOffset(1.5,-1.5)
	return f
end

local announceMessages = CreateMessageFrame("fDispelFrame")
 
local function OnEvent(self, event, timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, ...)
	if (eventType=="SPELL_DISPEL" or eventType=="SPELL_STOLEN" or eventType=="SPELL_INTERRUPT" or eventType=="SPELL_DISPEL_FAILED" or eventType=="CAST_SUCCESS") and band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) == COMBATLOG_OBJECT_AFFILIATION_MINE then
		local _, _, _, id, effect, _, etype = ...
		local msg = _G["ACTION_" .. eventType]
		local color
		local icon =GetSpellTexture(id)

		if eventType=="SPELL_INTERRUPT" then
			if GetNumGroupMembers() > 0 then
				SendChatMessage(msg..": "..destName.." \124cff71d5ff\124Hspell:"..id.."\124h["..effect.."]\124h\124r!", "RAID")
			elseif GetNumSubgroupMembers() > 0 then
				SendChatMessage(msg..": "..destName.." \124cff71d5ff\124Hspell:"..id.."\124h["..effect.."]\124h\124r!", "PARTY")
			end
		end
		
		if etype=="BUFF"then
			color={0,1,.5}
		else
			color={1,0,.5}
		end
		if icon then
			announceMessages:AddMessage(msg .. ": " .. effect .. " \124T"..icon..":"..cfg.iconsize..":"..cfg.iconsize..":0:0:64:64:5:59:5:59\124t",unpack(color))
		else
			announceMessages:AddMessage(msg .. ": " .. effect ,unpack(color))
		end
	end
end

announce:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
announce:SetScript('OnEvent', OnEvent)


-------------------------------------------------------------------------------------
-- Credit Alleykat 
-- Entering combat and allertrun function (can be used in anther ways)
------------------------------------------------------------------------------------
local speed = .057799924 -- how fast the text appears
cfg.fontflag = "OUTLINE" -- for pixelcfg.font stick to this else OUTLINE or THINOUTLINE
cfg.fontsize = 24 -- cfg.font size
 
local GetNextChar = function(word,num)
	local c = word:byte(num)
	local shift
	if not c then return "",num end
		if (c > 0 and c <= 127) then
			shift = 1
		elseif (c >= 192 and c <= 223) then
			shift = 2
		elseif (c >= 224 and c <= 239) then
			shift = 3
		elseif (c >= 240 and c <= 247) then
			shift = 4
		end
	return word:sub(num,num+shift-1),(num+shift)
end
 
local updaterun = CreateFrame("Frame")
 
local flowingframe = CreateFrame("Frame",nil,UIParent)
flowingframe:SetFrameStrata("HIGH")
flowingframe:SetPoint("CENTER",UIParent,0, 50) -- where we want the textframe
flowingframe:SetHeight(64)
 
local flowingtext = flowingframe:CreateFontString(nil,"OVERLAY")
flowingtext:SetFont(cfg.font,cfg.fontsize, cfg.fontflag)
flowingtext:SetShadowOffset(1.5,-1.5)
 
local rightchar = flowingframe:CreateFontString(nil,"OVERLAY")
rightchar:SetFont(cfg.font,60, cfg.fontflag)
rightchar:SetShadowOffset(1.5,-1.5)
rightchar:SetJustifyH("LEFT") -- left or right
 
local count,len,step,word,stringE,a,backstep
 
local nextstep = function()
	a,step = GetNextChar (word,step)
	flowingtext:SetText(stringE)
	stringE = stringE..a
	a = string.upper(a)
	rightchar:SetText(a)
end
 
local backrun = CreateFrame("Frame")
backrun:Hide()
 
local updatestring = function(self,t)
	count = count - t
		if count < 0 then
			count = speed
			if step > len then
				self:Hide()
				flowingtext:SetText(stringE)
				rightchar:SetText()
				flowingtext:ClearAllPoints()
				flowingtext:SetPoint("RIGHT")
				flowingtext:SetJustifyH("RIGHT")
				rightchar:ClearAllPoints()
				rightchar:SetPoint("RIGHT",flowingtext,"LEFT")
				rightchar:SetJustifyH("RIGHT")
				self:Hide()
				count = 1.456789
				backrun:Show()
			else
				nextstep()
			end
		end
end
 
updaterun:SetScript("OnUpdate",updatestring)
updaterun:Hide()
 
local backstepf = function()
	local a = backstep
	local firstchar
		local texttemp = ""
		local flagon = true
		while a <= len do
			local u
			u,a = GetNextChar(word,a)
			if flagon == true then
				backstep = a
				flagon = false
				firstchar = u
			else
				texttemp = texttemp..u
			end
		end
	flowingtext:SetText(texttemp)
	firstchar = string.upper(firstchar)
	rightchar:SetText(firstchar)
end
 
local rollback = function(self,t)
	count = count - t
		if count < 0 then
			count = speed
			if backstep > len then
				self:Hide()
				flowingtext:SetText()
				rightchar:SetText()
			else
				backstepf()
			end
		end
end
 
backrun:SetScript("OnUpdate",rollback)
 
local allertrun = function(f,r,g,b,s)
	if s then speed = s else speed = .057799924 end
	-- if f == "斩杀！！" then flowingframe:SetScale(1.8);speed = 0 else flowingframe:SetScale(1);speed = .057799924 end
	flowingframe:Hide()
	updaterun:Hide()
	backrun:Hide()
 
	flowingtext:SetText(f)
	local l = flowingtext:GetWidth()
 
	local color1 = r or 1
	local color2 = g or 1
	local color3 = b or 1
 
	flowingtext:SetTextColor(color1*.95,color2*.95,color3*.95) -- color in RGB(red green blue)(alpha)
	rightchar:SetTextColor(color1,color2,color3)
 
	word = f
	len = f:len()
	step,backstep = 1,1
	count = speed
	stringE = ""
	a = ""
 
	flowingtext:SetText("")
	flowingframe:SetWidth(l)
	flowingtext:ClearAllPoints()
	flowingtext:SetPoint("LEFT")
	flowingtext:SetJustifyH("LEFT")
	rightchar:ClearAllPoints()
	rightchar:SetPoint("LEFT",flowingtext,"RIGHT")
	rightchar:SetJustifyH("LEFT")
 
	rightchar:SetText("")
	updaterun:Show()
	flowingframe:Show()
end
 
SlashCmdList.ALLEYRUN = function(lol) allertrun(lol) end
SLASH_ALLEYRUN1 = "/arn" -- /command to test the text

--CombatText:UnregisterEvent("PLAYER_REGEN_ENABLED")
--CombatText:UnregisterEvent("PLAYER_REGEN_DISABLED")

SetCVar("fctCombatState", "0")
local a = CreateFrame ("Frame")
a:RegisterEvent("PLAYER_REGEN_ENABLED")
a:RegisterEvent("PLAYER_REGEN_DISABLED")
a:RegisterEvent("PLAYER_ENTERING_WORLD")
-- a:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
a:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
if cfg.enableexecute then
	a:RegisterEvent("UNIT_HEALTH")
	a:RegisterEvent("PLAYER_TARGET_CHANGED")
	a:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
end
a:SetScript("OnEvent", function (self,event,...)
	local pclass = select(2, UnitClass("player"))
	if (UnitIsDead("player")) then return end
	-- if event == "PLAYER_REGEN_ENABLED" and(COMBAT_TEXT_SHOW_COMBAT_STATE=="1") then
		-- allertrun(LEAVING_COMBAT.." !",0.1,1,0.1)
	-- elseif event == "PLAYER_REGEN_DISABLED" and(COMBAT_TEXT_SHOW_COMBAT_STATE=="1") then
		-- allertrun(ENTERING_COMBAT.." !",1,0.1,0.1)
	if event == "PLAYER_TARGET_CHANGED" then
		flag = 0
	elseif event == "UNIT_HEALTH" then
		if ExecuteThreshold and ((UnitName("target") and UnitCanAttack("player", "target") and not UnitIsDead("target") and ( UnitHealth("target")/UnitHealthMax("target") < ExecuteThreshold ) and flag == 0 )) and not (pclass == "DRUID" and UnitBuff("player", GetSpellInfo(768))) then
			if ((cfg.onlyshowboss and UnitLevel("target")==-1) or ( not cfg.onlyshowboss)) then
				local text = ExecuteText[pclass] or "斩杀阶段"
				allertrun(text.."!",1,0.82,0,0)
			end
			flag = 1
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		ExecuteThreshold = ClassThreshold[pclass][GetSpecialization()]
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	elseif event == "ACTIVE_TALENT_GROUP_CHANGED" then
		ExecuteThreshold = ClassThreshold[pclass][GetSpecialization()]
	elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local timestamp, eventtype, hideCaster, srcGUID, srcName, srcFlags, srcRaidFlags, destGUID, destName, destFlags, destRaidFlags, param9, param10, param11, param12, param13, param14,  param15, param16, param17, param18, param19, param20 = ...
		-- print (bit.band(srcFlags, COMBATLOG_OBJECT_REACTION_FRIENDLY))
		if eventtype == "SPELL_CAST_SUCCESS" and (param9 == 1784 or param9 == 1856 or param9 == 5215 or param9 == 66 or param9 == 51753) and bit.band(srcFlags, COMBATLOG_OBJECT_TYPE_PLAYER) == 1024 and bit.band(srcFlags, COMBATLOG_OBJECT_REACTION_FRIENDLY) ~= 16 then
			local msg = srcName.."施放了"..select(1, GetSpellInfo(param9)).."！"
			-- allertrun(msg, RAID_CLASS_COLORS[select(2,UnitClass(unit))].r, RAID_CLASS_COLORS[select(2,UnitClass(unit))].g, RAID_CLASS_COLORS[select(2,UnitClass(unit))].b, 0)
			if IsAddOnLoaded("xCT") then xCTgen:AddMessage(msg,RAID_CLASS_COLORS[select(2,GetPlayerInfoByGUID(srcGUID))].r, RAID_CLASS_COLORS[select(2,GetPlayerInfoByGUID(srcGUID))].g, RAID_CLASS_COLORS[select(2,GetPlayerInfoByGUID(srcGUID))].b)
			else RaidNotice_AddMessage(RaidWarningFrame,msg,RAID_CLASS_COLORS[select(2,GetPlayerInfoByGUID(srcGUID))].r, RAID_CLASS_COLORS[select(2,GetPlayerInfoByGUID(srcGUID))].g, RAID_CLASS_COLORS[select(2,GetPlayerInfoByGUID(srcGUID))].b)
			end
		end
	end
end)

local tradeSkillAnnouce = CreateFrame("Frame")
tradeSkillAnnouce:RegisterEvent("CHAT_MSG_SKILL")
tradeSkillAnnouce:SetScript("OnEvent", function(self, event, message)
	UIErrorsFrame:AddMessage(message, ChatTypeInfo["SKILL"].r, ChatTypeInfo["SKILL"].g, ChatTypeInfo["SKILL"].b)
end)


--[[
local wm = CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton

wm:SetParent("UIParent")
wm:ClearAllPoints()
wm:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -3, -3)
wm:SetSize(16, 16)
wm:Hide()

CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButtonLeft:SetAlpha(0)
CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButtonMiddle:SetAlpha(0)
CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButtonRight:SetAlpha(0)

wm:RegisterEvent("PARTY_MEMBERS_CHANGED")
wm:HookScript("OnEvent", function(self)
local raid = GetNumGroupMembers() > 0
if (raid and (UnitIsGroupLeader() or UnitIsGroupAssistant())) or (GetNumSubgroupMembers() > 0 and not raid) then
self:Show()
else
self:Hide()
end
end)

local L = GetLocale() == "zhCN" and {
	["就位确认"] = "就位确认",
	["职责检查"] = "职责检查",
	["转化为团队"] = "转化为团队",
	["转化为小队"] = "转化为小队",
} or GetLocale() == "zhTW" and {
	["就位确认"] = "準備確認",
	["职责检查"] = "角色檢查",
	["转化为团队"] = "轉化為團隊",
	["转化为小队"] = "轉化為小隊",
} or {
	["就位确认"] = "Ready Check",
	["职责检查"] = "Roll Check",
	["转化为团队"] = "Convert to Raid",
	["转化为小队"] = "Convert to Party",
}

local wmmenuFrame = CreateFrame("Frame", "wmRightClickMenu", UIParent, "UIDropDownMenuTemplate")
local wmmenuList = {
    {text = L["就位确认"],
    func = function() DoReadyCheck() end},
    {text = L["职责检查"],
    func = function() InitiateRolePoll() end},
    {text = L["转化为团队"],
    func = function() ConvertToRaid() end},
    {text = L["转化为小队"],
    func = function() ConvertToParty() end},
}

wm:SetScript('OnMouseUp', function(self, button)
wm:StopMovingOrSizing()
    if (button=="RightButton") then
        EasyMenu(wmmenuList, wmmenuFrame, "cursor", -150, 0, "MENU", 2)
    end
end)]]
