local _, ns = ...

local R, G, B = ns.R, ns.G, ns.B
local firstTime = true

local function BlackMarketFrame_UpdateHotItem (self)
	local iconTexture = self.HotDeal.Item.IconTexture
	if ( not (iconTexture and iconTexture:IsShown()) ) then return end

	local name, _, _, _, usable, _, _, _, _, _, _, _, _, _, link = C_BlackMarket.GetHotItem()
	if ( name and usable ) then
		if ( firstTime ) then
			firstTime = nil
			ns:UpdatePets()
		end

		if ( ns:IsAlreadyKnown(link) ) then iconTexture:SetVertexColor(R, G, B) end
	end
end

local function BlackMarketScrollFrame_Update ()
	local numItems = C_BlackMarket.GetNumItems()
	local offset = HybridScrollFrame_GetOffset(BlackMarketScrollFrame)
	local buttons = scrollFrame.buttons

	for i = 1, #buttons do
		local index = offset + i
		if ( index > numItems ) then return end

		local iconTexture = buttons[i].Item.IconTexture
		if ( iconTexture and iconTexture:IsShown() ) then
			local name, _, _, _, usable, _, _, _, _, _, _, _, _, _, link = C_BlackMarket.GetItemInfoByIndex(index)
			if ( name and usable ) then
				if ( firstTime ) then
					firstTime = nil
					ns:UpdatePets()
				end

				if ( ns:IsAlreadyKnown(link) ) then iconTexture:SetVertexColor(R, G, B) end
			end
		end
	end
end

function ns:BLACK_MARKET_CLOSE () firstTime = true end

ns.addons.Blizzard_BlackMarketUI = function ()
	ns:RegisterEvent('BLACK_MARKET_CLOSE')

	hooksecurefunc('BlackMarketFrame_UpdateHotItem', BlackMarketFrame_UpdateHotItem)
	hooksecurefunc('BlackMarketScrollFrame_Update', BlackMarketScrollFrame_Update)
	hooksecurefunc(BlackMarketScrollFrame, 'update', BlackMarketScrollFrame_Update)
	if ( BlackMarketFrame:IsShown() ) then
		BlackMarketFrame_UpdateHotItem()
		BlackMarketScrollFrame_Update()
	end
end
if ( IsAddOnLoaded('Blizzard_BlackMarketUI') ) then return ns:ADDON_LOADED('ADDON_LOADED', 'Blizzard_BlackMarketUI') end
