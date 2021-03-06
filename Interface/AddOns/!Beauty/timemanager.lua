local F, C = unpack(select(2, ...))
local B, _ = unpack(Beauty)

local function TimeManagerSkin(_, _, addon)
	if addon == "Blizzard_TimeManager" then
		local r, g, b = C.classcolours[B.myclass].r, C.classcolours[B.myclass].g, C.classcolours[B.myclass].b
		F.StripTextures(TimeManagerFrame)
		F.SetBD(TimeManagerFrame, 5, -10, -48, 10)
		F.ReskinClose(TimeManagerCloseButton, "TOPRIGHT", TimeManagerFrame, "TOPRIGHT", -51, -13)
		F.ReskinDropDown(TimeManagerAlarmHourDropDown)
		TimeManagerAlarmHourDropDown:SetWidth(80)
		F.ReskinDropDown(TimeManagerAlarmMinuteDropDown)
		TimeManagerAlarmMinuteDropDown:SetWidth(80)
		F.ReskinDropDown(TimeManagerAlarmAMPMDropDown)
		TimeManagerAlarmAMPMDropDown:SetWidth(90)
		F.ReskinCheck(TimeManagerMilitaryTimeCheck)
		F.ReskinCheck(TimeManagerLocalTimeCheck)
		F.ReskinInput(TimeManagerAlarmMessageEditBox)
		TimeManagerAlarmEnabledButton:SetNormalTexture(nil)
		TimeManagerAlarmEnabledButton.SetNormalTexture = F.dummy
		F.Reskin(TimeManagerAlarmEnabledButton)
		
		F.StripTextures(TimeManagerStopwatchFrame)
		TimeManagerStopwatchCheck:CreateBorder()
		TimeManagerStopwatchCheck:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
		TimeManagerStopwatchCheck:GetNormalTexture():ClearAllPoints()
		TimeManagerStopwatchCheck:GetNormalTexture():Point("TOPLEFT", 2, -2)
		TimeManagerStopwatchCheck:GetNormalTexture():Point("BOTTOMRIGHT", -2, 2)
		local hover = TimeManagerStopwatchCheck:CreateTexture("frame", nil, TimeManagerStopwatchCheck) -- hover
		hover:SetTexture(1, 1, 1, 0.3)
		hover:Point("TOPLEFT", TimeManagerStopwatchCheck, 2, -2)
		hover:Point("BOTTOMRIGHT", TimeManagerStopwatchCheck, -2, 2)
		TimeManagerStopwatchCheck:SetHighlightTexture(hover)
		
		F.StripTextures(StopwatchFrame)
		F.SetBD(StopwatchFrame)
		
		F.StripTextures(StopwatchTabFrame)
		F.ReskinClose(StopwatchCloseButton)
		-- S:HandleNextPrevButton(StopwatchPlayPauseButton)
		-- S:HandleNextPrevButton(StopwatchResetButton)
		-- StopwatchPlayPauseButton:Point("RIGHT", StopwatchResetButton, "LEFT", -4, 0)
		-- StopwatchResetButton:Point("BOTTOMRIGHT", StopwatchFrame, "BOTTOMRIGHT", -4, 6)
	end
end

local load = CreateFrame("Frame")
load:SetScript("OnEvent", TimeManagerSkin)
load:RegisterEvent("ADDON_LOADED")