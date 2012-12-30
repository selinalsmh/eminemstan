local _, ns = ...

local R, G, B = ns.R, ns.G, ns.B
local firstTime = true

local function AuctionFrameBrowse_Update ()
	local numBatchAuctions = GetNumAuctionItems('list')
	local offset = FauxScrollFrame_GetOffset(BrowseScrollFrame)

	for i = 1, NUM_BROWSE_TO_DISPLAY do
		local index = offset + i + (NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameBrowse.page)
		if ( index > numBatchAuctions + NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameBrowse.page ) then return end

		local iconTexture = _G['BrowseButton' .. i .. 'ItemIconTexture']
		if ( iconTexture and iconTexture:IsShown() ) then
			local _, _, _, _, canUse, _, _, _, _, _, _, _, _, _, _, hasAllInfo =  GetAuctionItemInfo('list', offset + i)
			if ( canUse and hasAllInfo ) then
				if ( firstTime ) then
					firstTime = nil
					ns:UpdatePets()
				end

				if ( ns:IsAlreadyKnown(GetAuctionItemLink('list', offset + i)) ) then iconTexture:SetVertexColor(R, G, B) end
			end
		end
	end
end

local function AuctionFrameBid_Update ()
	local numBatchAuctions, totalAuctions = GetNumAuctionItems('bidder')
	local offset = FauxScrollFrame_GetOffset(BidScrollFrame)

	for i = 1, NUM_BIDS_TO_DISPLAY do
		local index = offset + i
		if ( index > numBatchAuctions ) then return end

		local iconTexture = _G['BidButton' .. i .. 'ItemIconTexture']
		if ( iconTexture and iconTexture:IsShown() ) then
			local _, _, _, _, canUse = GetAuctionItemInfo('bidder', index)
			if ( canUse ) then
				if ( firstTime ) then
					firstTime = nil
					ns:UpdatePets()
				end

				if ( ns:IsAlreadyKnown(GetAuctionItemLink('list', index)) ) then iconTexture:SetVertexColor(R, G, B) end
			end
		end
	end
end

local function AuctionFrameAuctions_Update ()
	local numBatchAuctions, totalAuctions = GetNumAuctionItems('owner')
	local offset = FauxScrollFrame_GetOffset(AuctionsScrollFrame)

	for i = 1, NUM_AUCTIONS_TO_DISPLAY do
		local index = offset + i + NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameAuctions.page
		if ( index > numBatchAuctions + NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameAuctions.page ) then return end

		local iconTexture = _G['AuctionsButton' .. i .. 'ItemIconTexture']
		if ( iconTexture and iconTexture:IsShown() ) then
			local _, _, _, _, canUse, _, _, _, _, _, _, _, _, saleStatus = GetAuctionItemInfo('owner', offset + i)
			if ( canUse ) then
				if ( firstTime ) then
					firstTime = nil
					ns:UpdatePets()
				end

				if ( ns:IsAlreadyKnown(GetAuctionItemLink('list', index)) ) then
					local r, g, b = R, G, B
					if ( saleStatus == 1 ) then r, g, b = r * 0.5, g * 0.5, b * 0.5 end

					iconTexture:SetVertexColor(r, g, b)
				end
			end
		end
	end
end

function ns:AUCTION_HOUSE_CLOSED () firstTime = true end

ns.addons.Blizzard_AuctionUI = function ()
	ns:RegisterEvent('AUCTION_HOUSE_CLOSED')

	hooksecurefunc('AuctionFrameBrowse_Update', AuctionFrameBrowse_Update)
	if ( AuctionFrameBrowse:IsShown() ) then AuctionFrameBrowse_Update() end
	hooksecurefunc('AuctionFrameBid_Update', AuctionFrameBid_Update)
	if ( AuctionFrameBid:IsShown() ) then AuctionFrameBid_Update() end
	hooksecurefunc('AuctionFrameAuctions_Update', AuctionFrameAuctions_Update)
	if ( AuctionFrameAuctions:IsShown() ) then AuctionFrameAuctions_Update() end
end
if ( IsAddOnLoaded('Blizzard_AuctionUI') ) then return ns:ADDON_LOADED('ADDON_LOADED', 'Blizzard_AuctionUI') end
