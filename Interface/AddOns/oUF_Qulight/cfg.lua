local addon, ns = ...
local cfg = CreateFrame("Frame")

--media
cfg.backdrop_edge_texture = "Interface\\AddOns\\oUF_Qulight\\media\\textures\\backdrop_edge"
cfg.statusbar_texture = "Interface\\AddOns\\oUF_Qulight\\media\\textures\\statusbar"
cfg.powerbar_texture = "Interface\\AddOns\\oUF_Qulight\\media\\textures\\statusbar"
cfg.backdrop_texture = "Interface\\AddOns\\oUF_Qulight\\media\\textures\\backdrop"
cfg.highlight_texture = "Interface\\AddOns\\oUF_Qulight\\media\\textures\\raidbg"
cfg.debuffBorder = "Interface\\AddOns\\oUF_Qulight\\media\\textures\\iconborder"

cfg.font = "FONTS\\ARKai_T.TTF" -- main font oUF_Qulight
cfg.fontsize = 12

cfg.fade = false    ---false   true
cfg.HealFrames = true -- Raid Frames for healers
cfg.showAuraWatch = true -- buffs timer on raid frames(hots, shields etc)
cfg.ShowParty = true -- show party frames (shown as 5man raid)
cfg.ShowRaid = false -- show raid frames
cfg.RaidShowSolo = false -- show raid frames even when solo
cfg.RaidShowAllGroups = false -- show raid groups 6, 7 and 8 (more than 25man raid)
cfg.enableDebuffHighlight = true -- enable *dispelable* debuff highlight for raid frames
cfg.showRaidDebuffs = true -- enable important debuff icons to show on raid units
cfg.showtot = true -- show target of target frame
cfg.showpet = true -- show pet frame
cfg.showfocus = true -- show focus frame
cfg.showfocustarget = true -- show focus target frame
cfg.showBossFrames = true -- show boss frame
cfg.TotemBars = true -- show Totem Bars
cfg.MTFrames = true -- show main tank frames
cfg.Reputationbar = false -- show Reputation bar
cfg.Experiencebar = false -- show Experience bar
cfg.showPlayerAuras = false -- use a custom player buffs/debuffs frame instead of Blizzard's default.
cfg.showRunebar = true -- show DK rune bar
cfg.showHolybar = false -- show Paladin HolyPower bar
cfg.showEclipsebar = false -- show druid Eclipse bar
cfg.showHarmonyBar = true
cfg.showShardbar = false -- show Warlock SoulShard bar
cfg.showShadowOrbsBar = false -- show Priest Shadow Orb bar
cfg.RCheckIcon = true -- show raid check icon
cfg.Castbars = true -- use built-in castbars
cfg.showLFDIcons = true -- Show dungeon role icons in raid/party
cfg.showPortrait = true
--Frame positions

-- cfg.AnchorHoly =  {"TOP", UIParent, "BOTTOM", 0, 398}
-- cfg.HolyWidth = 210
-- cfg.HolyHeight = 6

--player
cfg.playerx = -150
cfg.playery = 320

--target
cfg.targetx = 150
cfg.targety = 320

--focus
cfg.focusx = 300
cfg.focusy = 550

--pet 
cfg.petx = -460
cfg.pety = 310

ns.cfg = cfg