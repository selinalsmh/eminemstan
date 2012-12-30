local _, ns = ...

local R, G, B = ns.R, ns.G, ns.B
local firstTime = true

local function QuestInfo_ShowRewards ()
	local numQuestRewards, numQuestChoices
	if ( QuestInfoFrame.questLog ) then
		numQuestRewards, numQuestChoices = GetNumQuestLogRewards(), GetNumQuestLogChoices()
	else
		numQuestRewards, numQuestChoices = GetNumQuestRewards(), GetNumQuestChoices()
	end

	local totalRewards = numQuestRewards + numQuestChoices
	if ( totalRewards == 0 ) then return end

	local rewardsCount = 0

	if ( numQuestChoices > 0 ) then
		local baseIndex = rewardsCount
		for i = 1, numQuestChoices do
			local questItem = _G['QuestInfoItem' .. i + baseIndex]
			if ( questItem and questItem:IsShown() ) then
				local _, isUsable
				if ( QuestInfoFrame.questLog ) then
					_, _, _, _, isUsable = GetQuestLogChoiceInfo(i)
				else
					_, _, _, _, isUsable = GetQuestItemInfo('choice', i)
				end
				if ( isUsable ) then
					if ( firstTime ) then
						firstTime = nil
						ns:UpdatePets()
					end

					if ( ns:IsAlreadyKnown(QuestInfoFrame.questLog and GetQuestLogItemLink('choice', i) or GetQuestItemLink('choice', i)) ) then
						SetItemButtonTextureVertexColor(questItem, R, G, B)
						SetItemButtonNameFrameVertexColor(questItem, R, G, B)
					end
				end
			end
			rewardsCount = rewardsCount + 1
		end
	end

	if ( numQuestRewards > 0 ) then
		local baseIndex = rewardsCount
		for i = 1, numQuestRewards do
			local questItem = _G['QuestInfoItem' .. i + baseIndex]
			if ( questItem and questItem:IsShown() ) then
				local _, isUsable
				if ( QuestInfoFrame.questLog ) then
					_, _, _, _, isUsable = GetQuestLogRewardInfo(i)
				else
					_, _, _, _, isUsable = GetQuestItemInfo('reward', i)
				end
				if ( isUsable ) then
					if ( firstTime ) then
						firstTime = nil
						ns:UpdatePets()
					end

					if ( ns:IsAlreadyKnown(QuestInfoFrame.questLog and GetQuestLogItemLink('reward', i) or GetQuestItemLink('reward', i)) ) then
						SetItemButtonTextureVertexColor(questItem, R, G, B)
						SetItemButtonNameFrameVertexColor(questItem, R, G, B)
					end
				end
				rewardsCount = rewardsCount + 1
			end
		end
	end
end

local function OnHide () firstTime = true end
QuestFrame:HookScript('OnHide', OnHide)

hooksecurefunc('QuestInfo_ShowRewards', QuestInfo_ShowRewards)
if ( QuestFrame:IsShown() ) then return QuestInfo_ShowRewards() end
