-- do return end

local _, ns = ...

local R, G, B = ns.R, ns.G, ns.B
local firstTime = true

local function GuildRewards_Update ()
	local offset = HybridScrollFrame_GetOffset(GuildRewardsContainer)
	local buttons = GuildRewardsContainer.buttons
	local _, _, standingID = GetGuildFactionInfo()

	for i = 1, #buttons do
		local button = buttons[i]
		if ( button and button:IsShown() ) then
			local achievementID, itemID, itemName, _, repLevel = GetGuildRewardInfo(offset + i)
			if ( itemName and not (achievementID and achievementID > 0) and repLevel <= standingID ) then
				if ( firstTime ) then
					firstTime = nil
					ns:UpdatePets()
				end

				local _, itemLink = GetItemInfo(itemID)
				if ( ns:IsAlreadyKnown(itemLink) ) then button.icon:SetVertexColor(R, G, B) end
			end
		end
	end
end

local function OnHide () firstTime = true end

ns.addons.Blizzard_GuildUI = function ()
	GuildRewardsFrame:HookScript('OnHide', OnHide)

	hooksecurefunc('GuildRewards_Update', GuildRewards_Update)
	hooksecurefunc(GuildRewardsContainer, 'update', GuildRewards_Update)
	if ( GuildRewardsFrame:IsShown() ) then return GuildRewards_Update() end
end
if ( IsAddOnLoaded('Blizzard_GuildUI') ) then return ns:ADDON_LOADED('ADDON_LOADED', 'Blizzard_GuildUI') end
