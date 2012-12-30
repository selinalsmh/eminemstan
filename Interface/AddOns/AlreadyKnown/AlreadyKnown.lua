local _, ns = ...

-- here is your custom color. note: it acts as a filter applied to the texture image.
ns.R, ns.G, ns.B = 0.1, 1.0, 0.1


local tooltip = CreateFrame('GameTooltip')
tooltip:SetOwner(WorldFrame, 'ANCHOR_NONE')
tooltip:SetScript('OnEvent', function (self, event, ...) return ns[event](ns, event, ...) end)
function ns:RegisterEvent (event) return tooltip:RegisterEvent(event) end
function ns:UnregisterEvent (event) return tooltip:UnregisterEvent(event) end

local knownItemIDs, knownSpeciesIDs, knownPetNames, knownCreatureIDs = {}, {}, {}, {}

local COMPANION_PETS = ns.COMPANION_PETS

-- local weapon, armor, container, consumable, glyph, trade_goods, recipe, gem, miscellaneous, quest, battle_pets = GetAuctionItemClasses()
local _, _, _, _, glyph, _, recipe = GetAuctionItemClasses()
-- local junk, reagent, companion_pets, holiday, other, mount = GetAuctionItemSubClasses(9)
local _, _, companion_pets, _, _, mount = GetAuctionItemSubClasses(9)
local knowableItems = { [glyph] = true, [recipe] = true, [companion_pets] = true, [mount] = true, }

local tooltipLines = {}
for i = 1, 40 do
	tooltipLines[i] = tooltip:CreateFontString()
	tooltip:AddFontStrings(tooltipLines[i], tooltip:CreateFontString())
end

function ns:IsAlreadyKnown (link)
	if ( not link ) then return end

	local speciesID = link:match('battlepet:(%d+):')
	if ( speciesID ) then return knownSpeciesIDs[tonumber(speciesID)] end

	local itemID = link:match('item:(%d+):')
	if ( not itemID ) then return end

	itemID = tonumber(itemID)
	if ( knownItemIDs[itemID] ) then return true end

	local itemName, _, _, _, _, itemType, itemSubType = GetItemInfo(itemID)
	if ( not (knowableItems[itemType] or knowableItems[itemSubType]) ) then return end

	if ( itemSubType == companion_pets ) then
		local creatureID = COMPANION_PETS[itemID]
		if ( creatureID ) then
			local petName = knownCreatureIDs[creatureID]
			if ( petName ) then
				knownItemIDs[itemID] = petName
				return true
			end
		end

		for petName in next, knownPetNames do
			if ( petName == itemName ) then
				knownItemIDs[itemID] = petName
				return true
			end
		end
	end

	tooltip:ClearLines()
	tooltip:SetHyperlink(link)

	for i = 1, tooltip:NumLines() do
		if ( tooltipLines[i]:GetText() == ITEM_SPELL_KNOWN ) then
			knownItemIDs[itemID] = true
			return true
		end
	end
end


local searchText, flagFilters, typeFilters, sourceFilters = nil, {}, {}, {}, {}
local FLAG_FILTERS = { [LE_PET_JOURNAL_FLAG_COLLECTED] = true, [LE_PET_JOURNAL_FLAG_NOT_COLLECTED] = true, [LE_PET_JOURNAL_FLAG_FAVORITES] = false, }

local lastSearchText
hooksecurefunc(C_PetJournal, 'SetSearchFilter', function (text) lastSearchText = text end)
hooksecurefunc(C_PetJournal, 'ClearSearchFilter', function () lastSearchText = '' end)

local function SaveAndClearFilters ()
	searchText = lastSearchText
	if ( not lastSearchText or searchText ~= '' ) then C_PetJournal.ClearSearchFilter() end

	for flag, value in next, FLAG_FILTERS do
		flagFilters[flag] = not C_PetJournal.IsFlagFiltered(flag)
		if ( flagFilters[flag] ~= value ) then C_PetJournal.SetFlagFilter(flag, value) end
	end

	local notAllType
	for i = 1, C_PetJournal.GetNumPetTypes() do
		typeFilters[i] = not C_PetJournal.IsPetTypeFiltered(i)
		notAllType = notAllType or typeFilters[i]
	end
	if ( notAllType ) then C_PetJournal.AddAllPetTypesFilter() end

	local notAllSource
	for i = 1, C_PetJournal.GetNumPetSources() do
		sourceFilters[i] = not C_PetJournal.IsPetSourceFiltered(i)
		notAllSource = notAllSource or sourceFilters[i]
	end
	if ( notAllSource ) then C_PetJournal.AddAllPetSourcesFilter() end
end

local function LoadAndSetFilters ()
	if ( not searchText or searchText ~= '' ) then C_PetJournal.SetSearchFilter(searchText or '') end

	for flag, value in next, flagFilters do
		if ( value ~= FLAG_FILTERS[flag] ) then C_PetJournal.SetFlagFilter(flag, value) end
	end

	for flag, value in next, typeFilters do
		if ( not value ) then C_PetJournal.SetPetTypeFilter(flag, false) end
	end

	for flag, value in next, sourceFilters do
		if ( not value ) then C_PetJournal.SetPetSourceFilter(flag, false) end
	end
end

function ns:UpdatePets ()
	SaveAndClearFilters()

	local numPets, numOwned = C_PetJournal.GetNumPets(false)
	for i = 1, numPets do
		-- local petID, speciesID, isOwned, customName, level, favorite, isRevoked, petName, petIcon, petType, creatureID, sourceText, description, isWildPet, canBattle = C_PetJournal.GetPetInfoByIndex(i, false)
		local _, speciesID, isOwned, _, _, _, _, petName, _, _, creatureID = C_PetJournal.GetPetInfoByIndex(i, false)
		if ( isOwned ) then
			knownSpeciesIDs[speciesID], knownPetNames[petName], knownCreatureIDs[creatureID] = true, true, petName
		else
			knownSpeciesIDs[speciesID], knownPetNames[petName], knownCreatureIDs[creatureID] = nil, nil, nil

			for itemID, value in next, knownItemIDs do
				if ( value == petName ) then
					knownItemIDs[itemID] = nil
					break
				end
			end
		end
	end

	return LoadAndSetFilters()
end


local addons = {}
ns.addons = addons

function ns:ADDON_LOADED (event, name)
	local func = addons[name]
	if ( not func ) then return end

	func()
	addons[name] = nil

	if ( not next(addons) ) then
		self:UnregisterEvent(event)
		self[event] = nil
	end
end
ns:RegisterEvent('ADDON_LOADED')
