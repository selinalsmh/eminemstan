﻿------------------------------------------------------
-- Hello there! I'm using the Internet!             --
------------------------------------------------------
JunkAuto, JunkItems = {}, {}
local JunkValue = 0

local function SellJunk()
	for bag=0,4 do
		if GetContainerNumSlots(bag) then
			for slot=1,GetContainerNumSlots(bag) do
				if IsJunk(bag, slot) then
					PickupContainerItem(bag,slot)
					PickupMerchantItem(MerchantFrame:GetID())
				end
			end
		end
	end
end

local function GetJunkValue()
	JunkValue = 0
		for bag=0,4 do
			if GetContainerNumSlots(bag) then
				for slot=1,GetContainerNumSlots(bag) do
		end
	end
end

SlashCmdList["JUNK"] = function(item)
    if(item == "flush") then
        JunkItems = {}
        DEFAULT_CHAT_FRAME:AddMessage("|cff4fff4fRemoved all junk exceptions")
    elseif(item == "auto") then
        if(JunkAuto.sell) then
            JunkAuto.sell = nil
            DEFAULT_CHAT_FRAME:AddMessage("|cff4fff4fNo longer automatically selling your junk")
        else
            JunkAuto.sell = true
            DEFAULT_CHAT_FRAME:AddMessage("|cff4fff4fNow automatically selling your junk")
        end
    elseif(item == "repair") then
        if(JunkAuto.repair) then
            JunkAuto.repair = nil
            DEFAULT_CHAT_FRAME:AddMessage("|cff4fff4fNo longer automatically repairing")
        else
            JunkAuto.repair = true
            DEFAULT_CHAT_FRAME:AddMessage("|cff4fff4fNow automatically repairing")
        end
	elseif(item:match("|Hitem") and not JunkItems[item:gsub("%d+:%d+|","0:0|")]) then
		JunkItems[item:gsub("%d+:%d+|","0:0|")] = true
		DEFAULT_CHAT_FRAME:AddMessage("|cff4fff4fAdded junk|r: " .. item)
	elseif(JunkItems[item:gsub("%d+:%d+|","0:0|")]) then
        JunkItems[item:gsub("%d+:%d+|","0:0|")] = nil
        DEFAULT_CHAT_FRAME:AddMessage("|cff4fff4fRemoved junk|r: " .. item)
    else
		DEFAULT_CHAT_FRAME:AddMessage("|cff4fff4fJunk |r- |cff4fff4fSell your junk|r!")
        DEFAULT_CHAT_FRAME:AddMessage("/|cff4fff4fjunk |cff1eff00[link] |r- |cff4fff4f增加或移除 [item] 作为例外|r")
        DEFAULT_CHAT_FRAME:AddMessage("/|cff4fff4fjunk |cff1eff00flush |r- |cff4fff4f移除所有例外|r")
        DEFAULT_CHAT_FRAME:AddMessage("/|cff4fff4fjunk |cff1eff00auto |r- |cff4fff4f开启或关闭自动出售|r")
        DEFAULT_CHAT_FRAME:AddMessage("/|cff4fff4fjunk |cff1eff00repair |r- |cff4fff4f开启或关闭自动修理|r")
	end
end
SLASH_JUNK1 = "/junk"

local JunkTooltip = CreateFrame("GameTooltip", "JunkTooltip", nil, "GameTooltipTemplate")
JunkTooltip:SetScript("OnTooltipAddMoney", function(_,price) if price then JunkValue = JunkValue + price end end)

-- local JunkButton = CreateFrame("Button", "JunkButton", MerchantBuyBackItem)
-- JunkButton:SetWidth(32)
-- JunkButton:SetHeight(32)
-- JunkButton:SetPoint("TOPRIGHT", MerchantFrame, "TOPRIGHT", -42, -38)
-- JunkButton:SetScript("OnLeave", function() GameTooltip:Hide() JunkValue = 0 end)
-- JunkButton:SetScript("OnClick", SellJunk)
-- JunkButton:SetNormalTexture("Interface\\Icons\\INV_Misc_Coin_19")
-- JunkButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
-- JunkButton:SetPushedTexture("Interface\\Icons\\INV_Misc_Coin_17")
-- JunkButton:SetDisabledTexture("Interface\\Icons\\Spell_Misc_EmotionSad")
-- auto repair/sell
JunkTooltip:RegisterEvent("MERCHANT_SHOW")
JunkTooltip:SetScript("OnEvent", function()
    if(CanMerchantRepair() and JunkAuto.repair and GetRepairAllCost() > 0) then
        local money = tostring(GetRepairAllCost())
        local gold, silver, copper = money:sub(1, -5), money:sub(-4,-3), money:sub(-2, -1)
        local phrase = (gold:len() > 0 and gold .. "|cff4fff4f金|r") .. (silver:len() > 0 and silver .. "|cff4fff4f银|r ") .. copper .. "|cff4fff4f铜|r"
        DEFAULT_CHAT_FRAME:AddMessage("|cff4fff4f修理所有装备花费|r " .. phrase)
        RepairAllItems()
    end
    if JunkAuto.sell then SellJunk() end
end)