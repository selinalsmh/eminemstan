local _, ns = ...

local R, G, B = ns.R, ns.G, ns.B
local firstTime = true

local function TradeFrame_UpdateTargetItem (id)
	local tradeItemButton, tradeItem = _G['TradeRecipientItem' .. id .. 'ItemButton'], _G['TradeRecipientItem' .. id]
	local tradeItemButtonIsShown, tradeItemIsShown = tradeItemButton and tradeItemButton:IsShown(), tradeItem and tradeItem:IsShown()

	if ( tradeItemButtonIsShown or tradeItemIsShown ) then
		local name, _, _, _, isUsable = GetTradeTargetItemInfo(id)
		if ( name and isUsable ) then
			if ( firstTime ) then
				firstTime = nil
				ns:UpdatePets()
			end

			if ( ns:IsAlreadyKnown(GetTradeTargetItemLink(id)) ) then
				if ( tradeItemButtonIsShown ) then
					SetItemButtonTextureVertexColor(tradeItemButton, R, G, B)
				end
				if ( tradeItemIsShown ) then
					SetItemButtonNameFrameVertexColor(tradeItem, R, G, B)
					SetItemButtonSlotVertexColor(tradeItem, R, G, B)
				end
			end
		end
	end
end

function ns:TRADE_CLOSED () firstTime = true end
ns:RegisterEvent('TRADE_CLOSED')

hooksecurefunc('TradeFrame_UpdateTargetItem', TradeFrame_UpdateTargetItem)
if ( TradeFrame:IsShown() ) then for i = 1, MAX_TRADE_ITEMS do TradeFrame_UpdateTargetItem(i) end end
