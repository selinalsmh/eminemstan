local _, ns = ...

local R, G, B = ns.R, ns.G, ns.B
local firstTime = true

local function MerchantFrame_UpdateMerchantInfo ()
	local numMerchantItems = GetMerchantNumItems()

	for i = 1, MERCHANT_ITEMS_PER_PAGE do
		local index = (MerchantFrame.page - 1) * MERCHANT_ITEMS_PER_PAGE + i
		if ( index > numMerchantItems ) then return end

		local merchantButton, itemButton = _G['MerchantItem' .. i], _G['MerchantItem' .. i .. 'ItemButton']
		local merchantButtonIsShown, itemButtonIsShown = merchantButton and merchantButton:IsShown(), itemButton and itemButton:IsShown()

		if ( merchantButtonIsShown or itemButtonIsShown ) then
			local _, _, _, _, numAvailable, isUsable = GetMerchantItemInfo(index)
			if ( isUsable ) then
				if ( firstTime ) then
					firstTime = nil
					ns:UpdatePets()
				end

				if ( ns:IsAlreadyKnown(GetMerchantItemLink(index)) ) then
					local r, g, b = R, G, B
					if ( numAvailable == 0 ) then r, g, b = r * 0.5, g * 0.5, b * 0.5 end

					if ( merchantButtonIsShown ) then
						SetItemButtonNameFrameVertexColor(merchantButton, r * 0.5, g * 0.5, b * 0.5)
						SetItemButtonSlotVertexColor(merchantButton, r, g, b)
					end
					if ( itemButtonIsShown ) then
						SetItemButtonTextureVertexColor(itemButton, r, g, b)
						SetItemButtonNormalTextureVertexColor(itemButton, r, g, b)
					end
				end
			end
		end
	end
end

local function MerchantFrame_UpdateBuybackInfo ()
	local numBuybackItems = GetNumBuybackItems()

	for i = 1, BUYBACK_ITEMS_PER_PAGE do
		if ( i > numBuybackItems ) then return end

		local buybackButton, itemButton = _G['MerchantItem' .. i], _G['MerchantItem' .. i .. 'ItemButton']
		local buybackButtonIsShown, itemButtonIsShown = buybackButton and buybackButton:IsShown(), itemButton and itemButton:IsShown()

		if ( merchantButtonIsShown or itemButtonIsShown ) then
			local _, _, _, _, buybackNumAvailable, buybackIsUsable = GetBuybackItemInfo(i)
			if ( buybackIsUsable ) then
				if ( firstTime ) then
					firstTime = nil
					ns:UpdatePets()
				end

				if ( ns:IsAlreadyKnown(GetBuybackItemLink(i)) ) then
					local r, g, b = R, G, B
					if ( buybackNumAvailable == 0 ) then r, g, b = r * 0.5, g * 0.5, b * 0.5 end

					if ( buybackButtonIsShown ) then
						SetItemButtonNameFrameVertexColor(buybackButton, r * 0.5, g * 0.5, b * 0.5)
						SetItemButtonSlotVertexColor(buybackButton, r, g, b)
					end
					if ( itemButtonIsShown ) then
						SetItemButtonTextureVertexColor(itemButton, r, g, b)
						SetItemButtonNormalTextureVertexColor(itemButton, r, g, b)
					end
				end
			end
		end
	end
end

function ns:MERCHANT_CLOSED () firstTime = true end
ns:RegisterEvent('MERCHANT_CLOSED')

hooksecurefunc('MerchantFrame_UpdateMerchantInfo', MerchantFrame_UpdateMerchantInfo)
if ( MerchantFrame:IsShown() ) then return MerchantFrame_UpdateMerchantInfo() end
