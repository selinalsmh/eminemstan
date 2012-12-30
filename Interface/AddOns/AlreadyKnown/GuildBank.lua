-- do return end

local _, ns = ...

local R, G, B = ns.R, ns.G, ns.B
local firstTime = true

local function GuildBankFrame_Update ()
	if ( GuildBankFrame.mode ~= 'bank' ) then return end

	local tab = GetCurrentGuildBankTab()

	for i = 1, MAX_GUILDBANK_SLOTS_PER_TAB do
		local index = mod(i, NUM_SLOTS_PER_GUILDBANK_GROUP)
		if ( index == 0 ) then index = NUM_SLOTS_PER_GUILDBANK_GROUP end

		local button = _G['GuildBankColumn' .. ceil((i - 0.5) / NUM_SLOTS_PER_GUILDBANK_GROUP) .. 'Button' .. index]
		if ( button and button:IsShown() ) then
			local _, _, locked = GetGuildBankItemInfo(tab, i)
			if ( not locked ) then
				if ( firstTime ) then
					firstTime = nil
					ns:UpdatePets()
				end

				local r, g, b = 1, 1, 1
				if ( ns:IsAlreadyKnown(GetGuildBankItemLink(tab, i)) ) then r, g, b = R, G, B end
				SetItemButtonTextureVertexColor(button, r, g, b)
			end
		end
	end
end

function ns:GUILDBANKFRAME_CLOSED () firstTime = true end

ns.addons.Blizzard_GuildBankUI = function ()
	ns:RegisterEvent('GUILDBANKFRAME_CLOSED')

	hooksecurefunc('GuildBankFrame_Update', GuildBankFrame_Update)
	if ( GuildBankFrame:IsShown() ) then return GuildBankFrame_Update() end
end
if ( IsAddOnLoaded('Blizzard_GuildBankUI') ) then return ns:ADDON_LOADED('ADDON_LOADED', 'Blizzard_GuildBankUI') end
