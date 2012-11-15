  local addon, ns = ...
  local cfg = CreateFrame("Frame")

  -----------------------------
  -- MEDIA
  -----------------------------
  local MediaPath = "Interface\\AddOns\\m_Nameplates\\media\\"
  cfg.statusbar_texture = MediaPath.."statusbar"
  cfg.backdrop_edge_texture = MediaPath.."glowTex"
  cfg.font = "Fonts\\ARkai_T.TTF"
  
  -----------------------------
  -- CONFIG
  -----------------------------
  cfg.fontsize = 12					-- Font size for Name and HP text
  cfg.fontflag = "THINOUTLINE"		-- Text outline
  cfg.hpHeight = 7					-- Health bar height
  cfg.hpWidth = 125				-- Health bar width
  cfg.raidIconSize = 18				-- Raid icon size
  cfg.cbIconSize = 20				-- Cast bar icon size
  cfg.cbHeight = 5					-- Cast bar height
  cfg.cbWidth = 100					-- Cast bar width
  cfg.combat_toggle = false 			-- 为true时姓名板进战斗自动显示,脱战自动隐藏.
  -- HANDOVER
  ns.cfg = cfg
