local _, ns = ...

local R, G, B = ns.R, ns.G, ns.B
local firstTime = true

local function LootFrame_UpdateButton (index)
	local numLootItems = LootFrame.numLootItems
	local numLootToShow = numLootItems > LOOTFRAME_NUMBUTTONS and LOOTFRAME_NUMBUTTONS - 1 or LOOTFRAME_NUMBUTTONS
	if ( index > numLootToShow ) then return end

	local slot = numLootToShow * (LootFrame.page - 1) + index
	if ( slot > numLootItems or not LootSlotHasItem(slot) ) then return end

	local button = _G['LootButton' .. index]
	if ( not (button and button:IsShown()) ) then return end

	local texture, _, _, _, locked = GetLootSlotInfo(slot)
	if ( texture and not locked ) then
		if ( firstTime ) then
			firstTime = nil
			ns:UpdatePets()
		end

		if ( ns:IsAlreadyKnown(GetLootSlotLink(slot)) ) then
			SetItemButtonNameFrameVertexColor(button, R * 0.5, G * 0.5, B * 0.5)
			SetItemButtonTextureVertexColor(button, R, G, B)
			SetItemButtonNormalTextureVertexColor(button, R, G, B)
		end
	end
end

function ns:LOOT_CLOSED () firstTime = true end
ns:RegisterEvent('LOOT_CLOSED')

hooksecurefunc('LootFrame_UpdateButton', LootFrame_UpdateButton)
if ( LootFrame:IsShown() ) then for index = 1, LOOTFRAME_NUMBUTTONS do LootFrame_UpdateButton(index) end end
