



------------
--  设置  --
------------

local cfg = CreateFrame("Frame")
local Media = "Interface\\Addons\\Sora's Bag\Media\\"
cfg.Font = "Fonts\\ARKai_T.ttf"
cfg.edgeFile = Media.."glowTex"
cfg.Scale = 1.4 												-- 背包缩放
	
----------------
--  命名空间  --
----------------

local _, SR = ...
SR.BagConfig = cfg
