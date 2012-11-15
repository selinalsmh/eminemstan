local addon, ns = ...
local cfg = CreateFrame("Frame")

-- enable modules

cfg.System = true
cfg.SystemPoint = {"top", UIParent, "top", -100, -10}

cfg.Durability = true
cfg.DurabilityPoint = {"top", UIParent, "top", 0, -10}

cfg.Memory = true
cfg.MemoryPoint = {"top", UIParent, "top", 80, -10}
cfg.MaxAddOns = 20

cfg.Gold = true
cfg.GoldPoint =  {"top", UIParent, "top", 160, -10}

cfg.Friends = false
cfg.FriendsPoint = {"right", UIParent, "topright", -295, -20}

cfg.Guild = false
cfg.GuildPoint = {"right", UIParent, "topright", -220, -20}

cfg.Mail = false
cfg.MailPoint = {"center",UIParent}

cfg.Bags = false
cfg.BagsPoint = {"right", UIParent, "topright", -370, -20}

cfg.Coords = false
cfg.CoordsPoint = {"bottom", Minimap, 0,1}

cfg.Positions = false
cfg.PositionsPoint = {"BOTTOM", "Minimap", "TOP", 0, 14}

cfg.Spec = false
cfg.SpecPoint = {"top", UIParent, "top", 240, -10}   --专精

cfg.Time = false
cfg.TimePoint = {"BOTTOM", "Minimap", "BOTTOM", 0, 5}

--Fonts and Colors
cfg.Fonts = {"Fonts\\ARKai_T.ttf", 14, "thinoutline"}
cfg.ColorClass = false


ns.cfg = cfg