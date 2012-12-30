local _, ns = ...

local R, G, B = ns.R, ns.G, ns.B
local firstTime = true

local function OpenMailFrame_UpdateButtonPositions ()
	for i = 1, ATTACHMENTS_MAX_RECEIVE do
		local attachmentButton = _G['OpenMailAttachmentButton' .. i]
		if ( attachmentButton and attachmentButton:IsShown() ) then
			local name, itemTexture, count, quality, canUse = GetInboxItem(InboxFrame.openMailID, i)
			if ( name and canUse ) then
				if ( firstTime ) then
					firstTime = nil
					ns:UpdatePets()
				end

				if ( ns:IsAlreadyKnown(GetInboxItemLink(InboxFrame.openMailID, i)) ) then SetItemButtonTextureVertexColor(attachmentButton, R, G, B) end
			end
		end
	end
end

function ns:MAIL_CLOSED () firstTime = true end
ns:RegisterEvent('MAIL_CLOSED')

hooksecurefunc('OpenMailFrame_UpdateButtonPositions', OpenMailFrame_UpdateButtonPositions)
if ( OpenMailFrame:IsShown() ) then return OpenMailFrame_UpdateButtonPositions end
