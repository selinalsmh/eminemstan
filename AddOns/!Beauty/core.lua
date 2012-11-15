local addon, func = ...
func[1] = {}
func[2] = {}
Beauty = func
local B, C = unpack(select(2, ...))


enable = true
AutoScale = false
UiScale = 0.8
enable = true
trackauras = true
trackccauras = true
showlevel = true
showhealth = true
enhancethreat = true
combat = false


C.uiscale = 0.75
C.dbmlock = true
C.skadalock =true

C.normal = "Interface\\AddOns\\Media\\Statusbar"
C.glow = "Interface\\Addons\\!Beauty\\media\\glowtex"
C.blank = "Interface\\Addons\\!Beauty\\media\\blank"
C.font = "Fonts\\ARKai_T.ttf"
C.fonttooltip = "Fonts\\ARKai_T.ttf"
C.fontbuff = "Interface\\AddOns\\Media\\ROADWAY.TTF"
C.fontsize = 14
C.fontflag = "OUTLINE"
C.bordercolor = {0,0,0,1}
C.backdropcolor = {.05,.05,.05,.9}

B.dummy= function() return end
_, B.myclass = UnitClass("player")
B.level = UnitLevel("player")

local BDs, SDs, NoBD, NoSD = {}, {}, 1, 1

local mult = 768/string.match(GetCVar("gxResolution"), "%d+x(%d+)")/C.uiscale
local function scale(x)
	return (mult*math.floor(x/mult+.5))
end
B.mult = mult
B.Scale = scale

local function Point(obj, arg1, arg2, arg3, arg4, arg5)
	-- anyone has a more elegant way for this?
	if type(arg1)=="number" then arg1 = scale(arg1) end
	if type(arg2)=="number" then arg2 = scale(arg2) end
	if type(arg3)=="number" then arg3 = scale(arg3) end
	if type(arg4)=="number" then arg4 = scale(arg4) end
	if type(arg5)=="number" then arg5 = scale(arg5) end

	obj:SetPoint(arg1, arg2, arg3, arg4, arg5)
end

local function CreateBorder(f, r, g, b, a)
	BDs[NoBD] = f
	NoBD = NoBD + 1
	f:SetBackdrop({
		edgeFile = C.blank, 
		edgeSize = mult,
		insets = { left = -mult, right = -mult, top = -mult, bottom = -mult }
	})
	f:SetBackdropBorderColor(0,0,0,1)
end

local function CreateShadow(f, t, offset, thickness, texture)
	if f.shadow then return end
	SDs[NoSD] = f
	NoSD = NoSD + 1
	
	local borderr, borderg, borderb, bordera = 0,0,0,1 
	local backdropr, backdropg, backdropb, backdropa = .05,.05,.05, .9
	
	if t == "Background" then
		backdropa = 0.6
	else
		backdropa = 0
	end
	
	local border = CreateFrame("Frame", nil, f)
	border:SetFrameLevel(1)
	Point(border,"TOPLEFT", -1, 1)
	Point(border,"TOPRIGHT", 1, 1)
	Point(border,"BOTTOMRIGHT", 1, -1)
	Point(border,"BOTTOMLEFT", -1, -1)
	CreateBorder(border)
	f.border = border
	
	local shadow = CreateFrame("Frame", nil, border)
	shadow:SetFrameLevel(0)
	Point(shadow,"TOPLEFT", -3, 3)
	Point(shadow,"TOPRIGHT", 3, 3)
	Point(shadow,"BOTTOMRIGHT", 3, -3)
	Point(shadow,"BOTTOMLEFT", -3, -3)
	shadow:SetBackdrop( { 
		edgeFile = C.glow,
		bgFile = C.blank,
		edgeSize = scale(4),
		insets = {left = scale(4), right = scale(4), top = scale(4), bottom = scale(4)},
	})
	shadow:SetBackdropColor( backdropr, backdropg, backdropb, backdropa )
	shadow:SetBackdropBorderColor( borderr, borderg, borderb, bordera )
	f.shadow = shadow
end

local function Kill(object)
	if object.IsProtected then 
		if object:IsProtected() then
			error("Attempted to kill a protected object: <"..object:GetName()..">")
		end
	end
	if object.UnregisterAllEvents then
		object:UnregisterAllEvents()
	end
	object.Show = function() return end
	object:Hide()
end

local function Size(frame, width, height)
	frame:SetSize(scale(width), scale(height or width))
end

local function Width(frame, width)
	frame:SetWidth(scale(width))
end

local function Height(frame, height)
	frame:SetHeight(scale(height))
end

local function CreatePanel(f, t, w, h, a1, p, a2, x, y)
	local sh = scale(h)
	local sw = scale(w)
	f:SetFrameLevel(1)
	f:SetHeight(sh)
	f:SetWidth(sw)
	f:SetFrameStrata("BACKGROUND")
	f:SetPoint(a1, p, a2, scale(x), scale(y))
	if t ~= "Transparent" then
		CreateShadow(f,"Background")
	else
		CreateShadow(f,t)
	end
end

local function StyleButton(button, setallpoints)
	if button.SetHighlightTexture and not button.hover then
		local hover = button:CreateTexture(nil, "OVERLAY")
		hover:SetTexture(1, 1, 1, 0.3)
		if setallpoints then
			hover:SetAllPoints()
		else
			hover:Point('TOPLEFT', 2, -2)
			hover:Point('BOTTOMRIGHT', -2, 2)
		end
		button.hover = hover
		button:SetHighlightTexture(hover)
	end
	
	if button.SetPushedTexture and not button.pushed then
		local pushed = button:CreateTexture(nil, "OVERLAY")
		pushed:SetTexture(0.9, 0.8, 0.1, 0.3)
		if setallpoints then
			pushed:SetAllPoints()
		else
			pushed:Point('TOPLEFT', 2, -2)
			pushed:Point('BOTTOMRIGHT', -2, 2)
		end
		button.pushed = pushed
		button:SetPushedTexture(pushed)
	end
	
	if button.SetCheckedTexture and not button.checked then
		local checked = button:CreateTexture(nil, "OVERLAY")
		checked:SetTexture(23/255,132/255,209/255,0.5)
		if setallpoints then
			checked:SetAllPoints()
		else
			checked:Point('TOPLEFT', 2, -2)
			checked:Point('BOTTOMRIGHT', -2, 2)
		end
		button.checked = checked
		button:SetCheckedTexture(checked)
	end

	if button:GetName() and _G[button:GetName().."Cooldown"] then
		local cooldown = _G[button:GetName().."Cooldown"]
		cooldown:ClearAllPoints()
		if setallpoints then
			cooldown:SetAllPoints()
		else
			cooldown:Point('TOPLEFT', 2, -2)
			cooldown:Point('BOTTOMRIGHT', -2, 2)
		end
	end
end

local function addapi(object)
	local mt = getmetatable(object).__index
	if not object.Size then mt.Size = Size end
	if not object.Point then mt.Point = Point end
	if not object.CreatePanel then mt.CreatePanel = CreatePanel end
	if not object.CreateShadow then mt.CreateShadow = CreateShadow end
	if not object.Kill then mt.Kill = Kill end
	if not object.CreateBorder then mt.CreateBorder = CreateBorder end
	if not object.StyleButton then mt.StyleButton = StyleButton end
	if not object.Width then mt.Width = Width end
	if not object.Height then mt.Height = Height end
end
local handled = {["Frame"] = true}
local object = CreateFrame("Frame")
addapi(object)
addapi(object:CreateTexture())
addapi(object:CreateFontString())
object = EnumerateFrames()
while object do
	if not handled[object:GetObjectType()] then
		addapi(object)
		handled[object:GetObjectType()] = true
	end

	object = EnumerateFrames(object)
end


local function reloadBD()
	mult = 768/string.match(GetCVar("gxResolution"), "%d+x(%d+)")/UIParent:GetEffectiveScale()
	for i = 1, #BDs do
		BDs[i]:SetBackdrop({
			edgeFile = C.blank, 
			edgeSize = mult,
			insets = { left = -mult, right = -mult, top = -mult, bottom = -mult }
		})
		BDs[i]:SetBackdropBorderColor(0,0,0,1)
	end	
end

local function reloadSD()
	mult = 768/string.match(GetCVar("gxResolution"), "%d+x(%d+)")/UIParent:GetEffectiveScale()
	for i = 1, #SDs do
		local border, shadow, bc, bdc = SDs[i].border, SDs[i].shadow, {}, {}
		border:ClearAllPoints()
		Point(border,"TOPLEFT", -1, 1)
		Point(border,"TOPRIGHT", 1, 1)
		Point(border,"BOTTOMRIGHT", 1, -1)
		Point(border,"BOTTOMLEFT", -1, -1)
		bc.r, bc.g, bc.b, bc.a = shadow:GetBackdropColor()
		bdc.r, bdc.g, bdc.b, bdc.a = shadow:GetBackdropBorderColor()
		Point(shadow,"TOPLEFT", -3, 3)
		Point(shadow,"TOPRIGHT", 3, 3)
		Point(shadow,"BOTTOMRIGHT", 3, -3)
		Point(shadow,"BOTTOMLEFT", -3, -3)
		shadow:SetBackdrop( { 
			edgeFile = C.glow,
			bgFile = C.blank,
			edgeSize = scale(4),
			insets = {left = scale(4), right = scale(4), top = scale(4), bottom = scale(4)},
		})
		shadow:SetBackdropColor(bc.r, bc.g, bc.b, bc.a)
		shadow:SetBackdropBorderColor(bdc.r, bdc.g, bdc.b, bdc.a)
	end	
end

local reloadborder = CreateFrame("Frame")
reloadborder:RegisterEvent("PLAYER_ENTERING_WORLD")
reloadborder:RegisterEvent("UI_SCALE_CHANGED")
reloadborder:SetScript("OnEvent", function()
	reloadborder:RegisterEvent("ADDON_LOADED")
--	print (UIParent:GetEffectiveScale())
--	print (GetCVar("uiScale"))
	reloadBD()
	reloadSD()
end)
GameMenuFrame:HookScript("OnHide", function()
	reloadBD()
	reloadSD()
end)
GameMenuFrame:HookScript("OnShow", function()
	reloadBD()
	reloadSD()
end)


local function LoadSkin()
	GameFontBlackMedium:SetTextColor(1, 1, 1)
	InvoiceTextFontNormal:SetTextColor(1, 1, 1)
	InvoiceTextFontSmall:SetTextColor(1, 1, 1)
	AvailableServicesText:SetTextColor(1, 1, 1)
	AvailableServicesText:SetShadowColor(0, 0, 0)

	local BlizzardMenuButtons = {
		"Options", 
		"SoundOptions", 
		"UIOptions", 
		"Keybindings", 
		"Macros",
		"Ratings",
		"AddOns", 
		"Logout", 
		"Quit", 
		"Continue", 
		"MacOptions",
		"Help"
	}

	for i = 1, getn(BlizzardMenuButtons) do
		local MenuButtons = _G["GameMenuButton"..BlizzardMenuButtons[i]]
		if MenuButtons then
			local a1,f,a2,xx,yy = MenuButtons:GetPoint()
			MenuButtons:ClearAllPoints()
			MenuButtons:SetPoint(a1,f,a2,xx,yy-1)
			GameMenuFrame:SetHeight(GameMenuFrame:GetHeight()+1)
		end
	end

	for i = 1, 3 do
		for j = 1, 3 do
			S:Reskin(_G["StaticPopup"..i.."Button"..j])
		end
		local bu = _G["StaticPopup"..i.."ItemFrame"]
		_G["StaticPopup"..i.."ItemFrameNameFrame"]:Hide()
		_G["StaticPopup"..i.."ItemFrameNormalTexture"]:Hide()
		_G["StaticPopup"..i.."ItemFrameIconTexture"]:SetTexCoord(.08, .92, .08, .92)

		bu:StyleButton(true)
		S:CreateBG(bu)

		S:ReskinInput(_G["StaticPopup"..i.."EditBox"], 20)
	end

	local inputs = {
		"StaticPopup1MoneyInputFrameGold",
		"StaticPopup1MoneyInputFrameSilver",
		"StaticPopup1MoneyInputFrameCopper",
		"StaticPopup2MoneyInputFrameGold",
		"StaticPopup2MoneyInputFrameSilver",
		"StaticPopup2MoneyInputFrameCopper",
		"StaticPopup3MoneyInputFrameGold",
		"StaticPopup3MoneyInputFrameSilver",
		"StaticPopup3MoneyInputFrameCopper",
		"BagItemSearchBox",
		"BankItemSearchBox"
	}
	for i = 1, #inputs do
		input = _G[inputs[i]]
		S:ReskinInput(input)
	end

	StaticPopup1MoneyInputFrameSilver:SetPoint("LEFT", StaticPopup1MoneyInputFrameGold, "RIGHT", 1, 0)
	StaticPopup1MoneyInputFrameCopper:SetPoint("LEFT", StaticPopup1MoneyInputFrameSilver, "RIGHT", 1, 0)
	StaticPopup2MoneyInputFrameSilver:SetPoint("LEFT", StaticPopup2MoneyInputFrameGold, "RIGHT", 1, 0)
	StaticPopup2MoneyInputFrameCopper:SetPoint("LEFT", StaticPopup2MoneyInputFrameSilver, "RIGHT", 1, 0)
	StaticPopup3MoneyInputFrameSilver:SetPoint("LEFT", StaticPopup3MoneyInputFrameGold, "RIGHT", 1, 0)
	StaticPopup3MoneyInputFrameCopper:SetPoint("LEFT", StaticPopup3MoneyInputFrameSilver, "RIGHT", 1, 0)
	StackSplitFrame:GetRegions():Hide()

	local buttons = {
		"VideoOptionsFrameOkay",
		"VideoOptionsFrameCancel",
		"VideoOptionsFrameDefaults",
		"VideoOptionsFrameApply",
		"AudioOptionsFrameOkay",
		"AudioOptionsFrameCancel",
		"AudioOptionsFrameDefaults",
		"InterfaceOptionsFrameDefaults",
		"InterfaceOptionsFrameOkay",
		"InterfaceOptionsFrameCancel",
		"ChatConfigFrameOkayButton",
		"ChatConfigFrameDefaultButton",
		"StackSplitOkayButton",
		"StackSplitCancelButton",
		"GameMenuButtonHelp",
		"GameMenuButtonOptions",
		"GameMenuButtonUIOptions",
		"GameMenuButtonKeybindings",
		"GameMenuButtonMacros",
		"GameMenuButtonLogout",
		"GameMenuButtonQuit",
		"GameMenuButtonContinue",
		"GameMenuButtonMacOptions",
		"ColorPickerOkayButton",
		"ColorPickerCancelButton",
		"GuildInviteFrameJoinButton",
		"GuildInviteFrameDeclineButton",
		"RolePollPopupAcceptButton",
		"GhostFrame",
		"InterfaceOptionsHelpPanelResetTutorials"
	}

	for i = 1, #buttons do
		local button = _G[buttons[i]]
		S:Reskin(button)
	end

	S:ReskinClose(RolePollPopupCloseButton)
	S:ReskinClose(ItemRefCloseButton)

	local FrameBDs = {
			"StaticPopup1",
			"StaticPopup2",
			"StaticPopup3",
			"GameMenuFrame",
			"InterfaceOptionsFrame",
			"VideoOptionsFrame",
			"AudioOptionsFrame",
			"ChatConfigFrame",
			"StackSplitFrame",
			"AddFriendFrame",
			"FriendsFriendsFrame",
			"ColorPickerFrame",
			"ReadyCheckFrame",
			"RolePollPopup",
			"GuildInviteFrame",
			"ChannelFrameDaughterFrame",
			"LFDRoleCheckPopup",
			"LFGDungeonReadyStatus",
			"LFGDungeonReadyDialog"
		}
	for i = 1, #FrameBDs do
		FrameBD = _G[FrameBDs[i]]
		S:CreateBD(FrameBD)
		S:CreateSD(FrameBD)
	end

	for i = 1, 10 do
		select(i, GuildInviteFrame:GetRegions()):Hide()
	end

	-- [[ Headers ]]
	local header = {
		"GameMenuFrame",
		"InterfaceOptionsFrame",
		"AudioOptionsFrame",
		"VideoOptionsFrame",
		"ChatConfigFrame",
		"ColorPickerFrame"
	}
	for i = 1, #header do
	local title = _G[header[i].."Header"]
		if title then
			title:SetTexture("")
			title:ClearAllPoints()
			if title == _G["GameMenuFrameHeader"] then
				title:SetPoint("TOP", GameMenuFrame, 0, 7)
			else
				title:SetPoint("TOP", header[i], 0, 0)
			end
		end
	end

	-- [[ Simple backdrops ]]
	local bds = {
		"AutoCompleteBox",
		"BNToastFrame",
		"TicketStatusFrameButton",
		"GearManagerDialogPopup",
		"TokenFramePopup",
		"ReputationDetailFrame",
		"RaidInfoFrame",
		"MissingLootFrame",
		"ScrollOfResurrectionSelectionFrame",
		"ScrollOfResurrectionFrame",
		"VoiceChatTalkers",
		"QueueStatusFrame"
	}

	for i = 1, #bds do
		S:CreateBD(_G[bds[i]])
	end

	-- Skin all DropDownList[i]
	local function SkinDropDownList(level, index)
		for i = 1, UIDROPDOWNMENU_MAXLEVELS do
			local dropdown = _G["DropDownList"..i.."MenuBackdrop"]
			if not dropdown.isSkinned then
				S:CreateBD(dropdown)
				dropdown.isSkinned = true
			end
			dropdown = _G["DropDownList"..i.."Backdrop"]
			if not dropdown.isSkinned then
				S:CreateBD(dropdown)
				dropdown.isSkinned = true
			end
		end
	end
	hooksecurefunc("UIDropDownMenu_CreateFrames", SkinDropDownList)

	-- Ghost frame
	GhostFrameContentsFrameIcon:SetTexCoord(.08, .92, .08, .92)
	GhostFrameLeft:Hide()
	GhostFrameRight:Hide()
	GhostFrameMiddle:Hide()
	for i = 3, 6 do
		select(i, GhostFrame:GetRegions()):Hide()
	end

	local GhostBD = CreateFrame("Frame", nil, GhostFrameContentsFrame)
	GhostBD:SetPoint("TOPLEFT", GhostFrameContentsFrameIcon, -1, 1)
	GhostBD:SetPoint("BOTTOMRIGHT", GhostFrameContentsFrameIcon, 1, -1)
	S:CreateBD(GhostBD, 0)

	-- Option panels
	local line = VideoOptionsFrame:CreateTexture(nil, "ARTWORK")
	line:Size(1, 536)
	line:SetPoint("LEFT", 205, 18)
	line:SetTexture(1, 1, 1, .2)

	S:CreateBD(AudioOptionsSoundPanelPlayback, .25)
	S:CreateBD(AudioOptionsSoundPanelHardware, .25)
	S:CreateBD(AudioOptionsSoundPanelVolume, .25)
	S:CreateBD(AudioOptionsVoicePanelTalking, .25)
	S:CreateBD(AudioOptionsVoicePanelBinding, .25)
	S:CreateBD(AudioOptionsVoicePanelListening, .25)

	AudioOptionsSoundPanelPlaybackTitle:SetPoint("BOTTOMLEFT", AudioOptionsSoundPanelPlayback, "TOPLEFT", 5, 2)
	AudioOptionsSoundPanelHardwareTitle:SetPoint("BOTTOMLEFT", AudioOptionsSoundPanelHardware, "TOPLEFT", 5, 2)
	AudioOptionsSoundPanelVolumeTitle:SetPoint("BOTTOMLEFT", AudioOptionsSoundPanelVolume, "TOPLEFT", 5, 2)
	AudioOptionsVoicePanelTalkingTitle:SetPoint("BOTTOMLEFT", AudioOptionsVoicePanelTalking, "TOPLEFT", 5, 2)
	AudioOptionsVoicePanelListeningTitle:SetPoint("BOTTOMLEFT", AudioOptionsVoicePanelListening, "TOPLEFT", 5, 2)

	local dropdowns = {
		"Graphics_DisplayModeDropDown",
		"Graphics_ResolutionDropDown",
		"Graphics_RefreshDropDown",
		"Graphics_PrimaryMonitorDropDown",
		"Graphics_MultiSampleDropDown",
		"Graphics_VerticalSyncDropDown",
		"Graphics_TextureResolutionDropDown",
		"Graphics_FilteringDropDown",
		"Graphics_ProjectedTexturesDropDown",
		"Graphics_ShadowsDropDown",
		"Graphics_LiquidDetailDropDown",
		"Graphics_SunshaftsDropDown",
		"Graphics_ParticleDensityDropDown",
		"Graphics_ViewDistanceDropDown",
		"Graphics_EnvironmentalDetailDropDown",
		"Graphics_GroundClutterDropDown",
		"Graphics_SSAODropDown",
		"Advanced_BufferingDropDown",
		"Advanced_LagDropDown",
		"Advanced_HardwareCursorDropDown",
		"AudioOptionsSoundPanelHardwareDropDown",
		"AudioOptionsSoundPanelSoundChannelsDropDown",
		"AudioOptionsVoicePanelInputDeviceDropDown",
		"AudioOptionsVoicePanelChatModeDropDown",
		"AudioOptionsVoicePanelOutputDeviceDropDown"
		}
	for i = 1, #dropdowns do
		S:ReskinDropDown(_G[dropdowns[i]])
	end

	Graphics_RightQuality:GetRegions():Hide()
	Graphics_RightQuality:DisableDrawLayer("BORDER")

	local sliders = {
		"Graphics_Quality",
		"Advanced_UIScaleSlider",
		"Advanced_MaxFPSSlider",
		"Advanced_MaxFPSBKSlider",
		"Advanced_GammaSlider",
		"AudioOptionsSoundPanelSoundQuality",
		"AudioOptionsSoundPanelMasterVolume",
		"AudioOptionsSoundPanelSoundVolume",
		"AudioOptionsSoundPanelMusicVolume",
		"AudioOptionsSoundPanelAmbienceVolume",
		"AudioOptionsVoicePanelMicrophoneVolume",
		"AudioOptionsVoicePanelSpeakerVolume",
		"AudioOptionsVoicePanelSoundFade",
		"AudioOptionsVoicePanelMusicFade",
		"AudioOptionsVoicePanelAmbienceFade"
	}
	for i = 1, #sliders do
		S:ReskinSlider(_G[sliders[i]])
	end

	Graphics_Quality.SetBackdrop = B.dummy

	local checkboxes = {
		"Advanced_UseUIScale",
		"Advanced_MaxFPSCheckBox",
		"Advanced_MaxFPSBKCheckBox",
		"Advanced_DesktopGamma",
		"NetworkOptionsPanelOptimizeSpeed",
		"NetworkOptionsPanelUseIPv6",
		"AudioOptionsSoundPanelEnableSound",
		"AudioOptionsSoundPanelSoundEffects",
		"AudioOptionsSoundPanelErrorSpeech",
		"AudioOptionsSoundPanelEmoteSounds",
		"AudioOptionsSoundPanelPetSounds",
		"AudioOptionsSoundPanelMusic",
		"AudioOptionsSoundPanelLoopMusic",
		"AudioOptionsSoundPanelAmbientSounds",
		"AudioOptionsSoundPanelSoundInBG",
		"AudioOptionsSoundPanelReverb",
		"AudioOptionsSoundPanelHRTF",
		"AudioOptionsSoundPanelEnableDSPs",
		"AudioOptionsSoundPanelUseHardware",
		"AudioOptionsVoicePanelEnableVoice",
		"AudioOptionsVoicePanelEnableMicrophone",
		"AudioOptionsVoicePanelPushToTalkSound",
		"AudioOptionsSoundPanelPetBattleMusic"
	}
	for i = 1, #checkboxes do
		S:ReskinCheck(_G[checkboxes[i]])
	end

	S:Reskin(RecordLoopbackSoundButton)
	S:Reskin(PlayLoopbackSoundButton)
	S:Reskin(AudioOptionsVoicePanelChatMode1KeyBindingButton)

	local line = InterfaceOptionsFrame:CreateTexture(nil, "ARTWORK")
	line:Size(1, 536)
	line:SetPoint("LEFT", 205, 18)
	line:SetTexture(1, 1, 1, .2)

	local checkboxes = {
		"InterfaceOptionsControlsPanelStickyTargeting",
		"InterfaceOptionsControlsPanelAutoDismount",
		"InterfaceOptionsControlsPanelAutoClearAFK",
		"InterfaceOptionsControlsPanelBlockTrades",
		"InterfaceOptionsControlsPanelBlockGuildInvites",
		"InterfaceOptionsControlsPanelLootAtMouse",
		"InterfaceOptionsControlsPanelAutoLootCorpse",
		"InterfaceOptionsControlsPanelInteractOnLeftClick",
		"InterfaceOptionsCombatPanelAttackOnAssist",
		"InterfaceOptionsCombatPanelStopAutoAttack",
		"InterfaceOptionsCombatPanelNameplateClassColors",
		"InterfaceOptionsCombatPanelTargetOfTarget",
		"InterfaceOptionsCombatPanelShowSpellAlerts",
		"InterfaceOptionsCombatPanelReducedLagTolerance",
		"InterfaceOptionsCombatPanelActionButtonUseKeyDown",
		"InterfaceOptionsCombatPanelEnemyCastBarsOnPortrait",
		"InterfaceOptionsCombatPanelEnemyCastBarsOnNameplates",
		"InterfaceOptionsCombatPanelAutoSelfCast",
		"InterfaceOptionsDisplayPanelShowCloak",
		"InterfaceOptionsDisplayPanelShowHelm",
		"InterfaceOptionsDisplayPanelShowAggroPercentage",
		"InterfaceOptionsDisplayPanelPlayAggroSounds",
		"InterfaceOptionsDisplayPanelShowSpellPointsAvg",
		"InterfaceOptionsDisplayPanelemphasizeMySpellEffects",
		"InterfaceOptionsDisplayPanelShowFreeBagSpace",
		"InterfaceOptionsDisplayPanelCinematicSubtitles",
		"InterfaceOptionsDisplayPanelShowAccountAchievments",
		"InterfaceOptionsDisplayPanelRotateMinimap",
		"InterfaceOptionsDisplayPanelScreenEdgeFlash",
		"InterfaceOptionsObjectivesPanelAutoQuestTracking",
		"InterfaceOptionsObjectivesPanelAutoQuestProgress",
		"InterfaceOptionsObjectivesPanelMapQuestDifficulty",
		"InterfaceOptionsObjectivesPanelWatchFrameWidth",
		"InterfaceOptionsSocialPanelProfanityFilter",
		"InterfaceOptionsSocialPanelSpamFilter",
		"InterfaceOptionsSocialPanelChatBubbles",
		"InterfaceOptionsSocialPanelPartyChat",
		"InterfaceOptionsSocialPanelChatHoverDelay",
		"InterfaceOptionsSocialPanelGuildMemberAlert",
		"InterfaceOptionsSocialPanelChatMouseScroll",
		"InterfaceOptionsActionBarsPanelBottomLeft",
		"InterfaceOptionsActionBarsPanelBottomRight",
		"InterfaceOptionsActionBarsPanelRight",
		"InterfaceOptionsActionBarsPanelRightTwo",
		"InterfaceOptionsActionBarsPanelLockActionBars",
		"InterfaceOptionsActionBarsPanelAlwaysShowActionBars",
		"InterfaceOptionsActionBarsPanelSecureAbilityToggle",
		"InterfaceOptionsNamesPanelMyName",
		"InterfaceOptionsNamesPanelFriendlyPlayerNames",
		"InterfaceOptionsNamesPanelFriendlyPets",
		"InterfaceOptionsNamesPanelFriendlyGuardians",
		"InterfaceOptionsNamesPanelFriendlyTotems",
		"InterfaceOptionsNamesPanelUnitNameplatesFriends",
		"InterfaceOptionsNamesPanelUnitNameplatesFriendlyPets",
		"InterfaceOptionsNamesPanelUnitNameplatesFriendlyGuardians",
		"InterfaceOptionsNamesPanelUnitNameplatesFriendlyTotems",
		"InterfaceOptionsNamesPanelGuilds",
		"InterfaceOptionsNamesPanelGuildTitles",
		"InterfaceOptionsNamesPanelTitles",
		"InterfaceOptionsNamesPanelNonCombatCreature",
		"InterfaceOptionsNamesPanelEnemyPlayerNames",
		"InterfaceOptionsNamesPanelEnemyPets",
		"InterfaceOptionsNamesPanelEnemyGuardians",
		"InterfaceOptionsNamesPanelEnemyTotems",
		"InterfaceOptionsNamesPanelUnitNameplatesEnemies",
		"InterfaceOptionsNamesPanelUnitNameplatesEnemyPets",
		"InterfaceOptionsNamesPanelUnitNameplatesEnemyGuardians",
		"InterfaceOptionsNamesPanelUnitNameplatesEnemyTotems",
		"InterfaceOptionsCombatTextPanelTargetDamage",
		"InterfaceOptionsCombatTextPanelPeriodicDamage",
		"InterfaceOptionsCombatTextPanelPetDamage",
		"InterfaceOptionsCombatTextPanelHealing",
		"InterfaceOptionsCombatTextPanelTargetEffects",
		"InterfaceOptionsCombatTextPanelOtherTargetEffects",
		"InterfaceOptionsCombatTextPanelEnableFCT",
		"InterfaceOptionsCombatTextPanelDodgeParryMiss",
		"InterfaceOptionsCombatTextPanelDamageReduction",
		"InterfaceOptionsCombatTextPanelRepChanges",
		"InterfaceOptionsCombatTextPanelReactiveAbilities",
		"InterfaceOptionsCombatTextPanelFriendlyHealerNames",
		"InterfaceOptionsCombatTextPanelCombatState",
		"InterfaceOptionsCombatTextPanelComboPoints",
		"InterfaceOptionsCombatTextPanelLowManaHealth",
		"InterfaceOptionsCombatTextPanelEnergyGains",
		"InterfaceOptionsCombatTextPanelPeriodicEnergyGains",
		"InterfaceOptionsCombatTextPanelHonorGains",
		"InterfaceOptionsCombatTextPanelAuras",
		"InterfaceOptionsStatusTextPanelPlayer",
		"InterfaceOptionsStatusTextPanelPet",
		"InterfaceOptionsStatusTextPanelParty",
		"InterfaceOptionsStatusTextPanelTarget",
		"InterfaceOptionsStatusTextPanelAlternateResource",
		"InterfaceOptionsStatusTextPanelPercentages",
		"InterfaceOptionsStatusTextPanelXP",
		"InterfaceOptionsUnitFramePanelPartyBackground",
		"InterfaceOptionsUnitFramePanelPartyPets",
		"InterfaceOptionsUnitFramePanelArenaEnemyFrames",
		"InterfaceOptionsUnitFramePanelArenaEnemyCastBar",
		"InterfaceOptionsUnitFramePanelArenaEnemyPets",
		"InterfaceOptionsUnitFramePanelFullSizeFocusFrame",
		"CompactUnitFrameProfilesRaidStylePartyFrames",
		"CompactUnitFrameProfilesGeneralOptionsFrameKeepGroupsTogether",
		"CompactUnitFrameProfilesGeneralOptionsFrameHorizontalGroups",
		"CompactUnitFrameProfilesGeneralOptionsFrameDisplayIncomingHeals",
		"CompactUnitFrameProfilesGeneralOptionsFrameDisplayPowerBar",
		"CompactUnitFrameProfilesGeneralOptionsFrameDisplayAggroHighlight",
		"CompactUnitFrameProfilesGeneralOptionsFrameUseClassColors",
		"CompactUnitFrameProfilesGeneralOptionsFrameDisplayPets",
		"CompactUnitFrameProfilesGeneralOptionsFrameDisplayMainTankAndAssist",
		"CompactUnitFrameProfilesGeneralOptionsFrameDisplayBorder",
		"CompactUnitFrameProfilesGeneralOptionsFrameShowDebuffs",
		"CompactUnitFrameProfilesGeneralOptionsFrameDisplayOnlyDispellableDebuffs",
		"CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate2Players",
		"CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate3Players",
		"CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate5Players",
		"CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate10Players",
		"CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate15Players",
		"CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate25Players",
		"CompactUnitFrameProfilesGeneralOptionsFrameAutoActivate40Players",
		"CompactUnitFrameProfilesGeneralOptionsFrameAutoActivateSpec1",
		"CompactUnitFrameProfilesGeneralOptionsFrameAutoActivateSpec2",
		"CompactUnitFrameProfilesGeneralOptionsFrameAutoActivatePvP",
		"CompactUnitFrameProfilesGeneralOptionsFrameAutoActivatePvE",
		"InterfaceOptionsBuffsPanelBuffDurations",
		"InterfaceOptionsBuffsPanelDispellableDebuffs",
		"InterfaceOptionsBuffsPanelCastableBuffs",
		"InterfaceOptionsBuffsPanelConsolidateBuffs",
		"InterfaceOptionsBuffsPanelShowAllEnemyDebuffs",
		"InterfaceOptionsBattlenetPanelOnlineFriends",
		"InterfaceOptionsBattlenetPanelOfflineFriends",
		"InterfaceOptionsBattlenetPanelBroadcasts",
		"InterfaceOptionsBattlenetPanelFriendRequests",
		"InterfaceOptionsBattlenetPanelConversations",
		"InterfaceOptionsBattlenetPanelShowToastWindow",
		"InterfaceOptionsCameraPanelFollowTerrain",
		"InterfaceOptionsCameraPanelHeadBob",
		"InterfaceOptionsCameraPanelWaterCollision",
		"InterfaceOptionsCameraPanelSmartPivot",
		"InterfaceOptionsMousePanelInvertMouse",
		"InterfaceOptionsMousePanelClickToMove",
		"InterfaceOptionsMousePanelWoWMouse",
		"InterfaceOptionsHelpPanelShowTutorials",
		"InterfaceOptionsHelpPanelLoadingScreenTips",
		"InterfaceOptionsHelpPanelEnhancedTooltips",
		"InterfaceOptionsHelpPanelShowLuaErrors",
		"InterfaceOptionsHelpPanelColorblindMode",
		"InterfaceOptionsHelpPanelMovePad",
		"InterfaceOptionsControlsPanelAutoOpenLootHistory"
	}
	for i = 1, #checkboxes do
		S:ReskinCheck(_G[checkboxes[i]])
	end

	local dropdowns = {
		"InterfaceOptionsControlsPanelAutoLootKeyDropDown",
		"InterfaceOptionsCombatPanelTOTDropDown",
		"InterfaceOptionsCombatPanelFocusCastKeyDropDown",
		"InterfaceOptionsCombatPanelSelfCastKeyDropDown",
		"InterfaceOptionsDisplayPanelAggroWarningDisplay",
		"InterfaceOptionsDisplayPanelWorldPVPObjectiveDisplay",
		"InterfaceOptionsSocialPanelChatStyle",
		"InterfaceOptionsSocialPanelTimestamps",
		"InterfaceOptionsSocialPanelWhisperMode",
		"InterfaceOptionsSocialPanelBnWhisperMode",
		"InterfaceOptionsSocialPanelConversationMode",
		"InterfaceOptionsActionBarsPanelPickupActionKeyDropDown",
		"InterfaceOptionsNamesPanelNPCNamesDropDown",
		"InterfaceOptionsNamesPanelUnitNameplatesMotionDropDown",
		"InterfaceOptionsCombatTextPanelFCTDropDown",
		"CompactUnitFrameProfilesProfileSelector",
		"CompactUnitFrameProfilesGeneralOptionsFrameSortByDropdown",
		"CompactUnitFrameProfilesGeneralOptionsFrameHealthTextDropdown",
		"InterfaceOptionsCameraPanelStyleDropDown",
		"InterfaceOptionsMousePanelClickMoveStyleDropDown",
		"Advanced_GraphicsAPIDropDown"
	}
	for i = 1, #dropdowns do
		S:ReskinDropDown(_G[dropdowns[i]])
	end

	local sliders = {
		"InterfaceOptionsCombatPanelSpellAlertOpacitySlider",
		"InterfaceOptionsCombatPanelMaxSpellStartRecoveryOffset",
		"CompactUnitFrameProfilesGeneralOptionsFrameHeightSlider",
		"CompactUnitFrameProfilesGeneralOptionsFrameWidthSlider",
		"InterfaceOptionsBattlenetPanelToastDurationSlider",
		"InterfaceOptionsCameraPanelMaxDistanceSlider",
		"InterfaceOptionsCameraPanelFollowSpeedSlider",
		"InterfaceOptionsMousePanelMouseSensitivitySlider",
		"InterfaceOptionsMousePanelMouseLookSpeedSlider"
	}
	for i = 1, #sliders do
		S:ReskinSlider(_G[sliders[i]])
	end

	S:Reskin(CompactUnitFrameProfilesSaveButton)
	S:Reskin(CompactUnitFrameProfilesDeleteButton)
	S:Reskin(CompactUnitFrameProfilesGeneralOptionsFrameResetPositionButton)
	S:Reskin(InterfaceOptionsHelpPanelResetTutorials)

	CompactUnitFrameProfilesGeneralOptionsFrameAutoActivateBG:Hide()

	VideoOptionsFrameCategoryFrame:DisableDrawLayer("BACKGROUND")
	InterfaceOptionsFrameCategories:DisableDrawLayer("BACKGROUND")
	InterfaceOptionsFrameAddOns:DisableDrawLayer("BACKGROUND")
	VideoOptionsFramePanelContainer:DisableDrawLayer("BORDER")
	InterfaceOptionsFramePanelContainer:DisableDrawLayer("BORDER")
	InterfaceOptionsFrameTab1TabSpacer:SetAlpha(0)
	for i = 1, 2 do
		_G["InterfaceOptionsFrameTab"..i.."Left"]:SetAlpha(0)
		_G["InterfaceOptionsFrameTab"..i.."Middle"]:SetAlpha(0)
		_G["InterfaceOptionsFrameTab"..i.."Right"]:SetAlpha(0)
		_G["InterfaceOptionsFrameTab"..i.."LeftDisabled"]:SetAlpha(0)
		_G["InterfaceOptionsFrameTab"..i.."MiddleDisabled"]:SetAlpha(0)
		_G["InterfaceOptionsFrameTab"..i.."RightDisabled"]:SetAlpha(0)
		_G["InterfaceOptionsFrameTab2TabSpacer"..i]:SetAlpha(0)
	end
	VideoOptionsFrameOkay:SetPoint("BOTTOMRIGHT", VideoOptionsFrameCancel, "BOTTOMLEFT", -1, 0)
	InterfaceOptionsFrameOkay:SetPoint("BOTTOMRIGHT", InterfaceOptionsFrameCancel, "BOTTOMLEFT", -1, 0)

	local lightbds = {
		"ChatConfigCategoryFrame",
		"ChatConfigBackgroundFrame",
		"ChatConfigChatSettingsLeft",
		"ChatConfigChatSettingsClassColorLegend",
		"ChatConfigChannelSettingsLeft",
		"ChatConfigChannelSettingsClassColorLegend",
		"ChatConfigOtherSettingsCombat",
		"ChatConfigOtherSettingsSystem",
		"ChatConfigOtherSettingsPVP",
		"ChatConfigOtherSettingsCreature",
		"HelpFrameTicketScrollFrame",
		"HelpFrameGM_ResponseScrollFrame1",
		"HelpFrameGM_ResponseScrollFrame2",
		"GuildRegistrarFrameEditBox",
	}
	for i = 1, #lightbds do
		S:CreateBD(_G[lightbds[i]], .25)
	end
end