﻿
local _, ns = ...
local oUF = ns.oUF or oUF
assert(oUF, "oUF_Freebgrid was unable to locate oUF install.")

local foo = {""}
local spellcache = setmetatable({}, 
{__index=function(t,id) 
	local a = {GetSpellInfo(id)} 
	if GetSpellInfo(id) then
	    t[id] = a
	    return a
	end
	--print("Invalid spell ID: ", id)
        t[id] = foo
	return foo
end
})

local function GetSpellInfo(a)
    return unpack(spellcache[a])
end

local GetTime = GetTime

local numberize = function(val)
    if (val >= 1e6) then
        return ("%.1fm"):format(val / 1e6)
    elseif (val >= 1e3) then
        return ("%.1fk"):format(val / 1e3)
    else
        return ("%d"):format(val)
    end
end
ns.numberize = numberize

local x = "M"

local getTime = function(expirationTime)
    local expire = (expirationTime-GetTime())
    local timeleft = numberize(expire)
    if expire > 0.5 then
        return ("|cffffff00"..timeleft.."|r")
    end
end

-- Magic
oUF.Tags.Methods['freebgrid:magic'] = function(u)
    local index = 1
    while true do
        local name,_,_,_, dtype = UnitAura(u, index, 'HARMFUL')
        if not name then break end
        
        if dtype == "Magic" then
            return ns.debuffColor[dtype]..x
        end
        index = index+1
    end
end
oUF.Tags.Events['freebgrid:magic'] = "UNIT_AURA"

-- Disease
oUF.Tags.Methods['freebgrid:disease'] = function(u)
    local index = 1
    while true do
        local name,_,_,_, dtype = UnitAura(u, index, 'HARMFUL')
        if not name then break end
        
        if dtype == "Disease" then
            return ns.debuffColor[dtype]..x
        end
        index = index+1
    end
end
oUF.Tags.Events['freebgrid:disease'] = "UNIT_AURA"

-- Curse
oUF.Tags.Methods['freebgrid:curse'] = function(u)
    local index = 1
    while true do
        local name,_,_,_, dtype = UnitAura(u, index, 'HARMFUL')
        if not name then break end
        
        if dtype == "Curse" then
            return ns.debuffColor[dtype]..x
        end
        index = index+1
    end
end
oUF.Tags.Events['freebgrid:curse'] = "UNIT_AURA"

-- Poison
oUF.Tags.Methods['freebgrid:poison'] = function(u)
    local index = 1
    while true do
        local name,_,_,_, dtype = UnitAura(u, index, 'HARMFUL')
        if not name then break end
        
        if dtype == "Poison" then
            return ns.debuffColor[dtype]..x
        end
        index = index+1
    end
end
oUF.Tags.Events['freebgrid:poison'] = "UNIT_AURA"

-- Priest 牧师
--愈合祷言
local pomCount = {"i","h","g","f","Z","Y"}
oUF.Tags.Methods['freebgrid:pom'] = function(u) 
    local name, _,_, c, _,_,_, fromwho = UnitAura(u, GetSpellInfo(41635)) 
    if fromwho == "player" then
        if(c) then return "|cff66FFFF"..pomCount[c].."|r" end 
    else
        if(c) then return "|cffFFCF7F"..pomCount[c].."|r" end 
    end
end
oUF.Tags.Events['freebgrid:pom'] = "UNIT_AURA"

--恢复
oUF.Tags.Methods['freebgrid:rnw'] = function(u)
    local name, _,_,_,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(139))
    if(fromwho == "player") then
        local spellTimer = GetTime()-expirationTime
        if spellTimer > -2 then
            return "|cffFF0000"..x.."|r"
        elseif spellTimer > -5 then
            return "|cffFF9900"..x.."|r"
        else
            return "|cff33FF33"..x.."|r"
        end
    end
end
oUF.Tags.Events['freebgrid:rnw'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:rnwTime'] = function(u)
    local name, _,_,_,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(139))
    if(fromwho == "player") then return getTime(expirationTime) end 
end
oUF.Tags.Events['freebgrid:rnwTime'] = "UNIT_AURA"

--真言术盾
oUF.Tags.Methods['freebgrid:pws'] = function(u) if UnitAura(u, GetSpellInfo(17)) then return "|cfffff673"..x.."|r" end end
oUF.Tags.Events['freebgrid:pws'] = "UNIT_AURA"

--虚弱灵魂
oUF.Tags.Methods['freebgrid:ws'] = function(u) if UnitDebuff(u, GetSpellInfo(6788)) then return "|cffFF9900"..x.."|r" end end
oUF.Tags.Events['freebgrid:ws'] = "UNIT_AURA"

--防护恐惧结界
oUF.Tags.Methods['freebgrid:fw'] = function(u) if UnitAura(u, GetSpellInfo(6346)) then return "|cff8B4513"..x.."|r" end end
oUF.Tags.Events['freebgrid:fw'] = "UNIT_AURA"

--真言术韧(耐力)
oUF.Tags.Methods['freebgrid:fort'] = function(u) if not(UnitAura(u, GetSpellInfo(21562)) or UnitAura(u, GetSpellInfo(6307)) or UnitAura(u, GetSpellInfo(469))) then return "|cffFFFFFF"..x.."|r" end end
oUF.Tags.Events['freebgrid:fort'] = "UNIT_AURA"

--真言术障
oUF.Tags.Methods['freebgrid:pwb'] = function(u) if UnitAura(u, GetSpellInfo(81782)) then return "|cffEEEE00"..x.."|r" end end
oUF.Tags.Events['freebgrid:pwb'] = "UNIT_AURA"

-- Druid 德鲁伊
--生命绽放
local lbCount = { 4, 2, 3}
oUF.Tags.Methods['freebgrid:lb'] = function(u) 
    local name, _,_, c,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(33763))
    if(fromwho == "player") then
        local spellTimer = GetTime()-expirationTime
        if spellTimer > -3 then
            return "|cffFF0000"..lbCount[c].."|r"
        elseif spellTimer > -6 then
            return "|cffFF9900"..lbCount[c].."|r"
        else
            return "|cffA7FD0A"..lbCount[c].."|r"
        end
    end
end
oUF.Tags.Events['freebgrid:lb'] = "UNIT_AURA"

--回春术
oUF.Tags.Methods['freebgrid:rejuv'] = function(u)
    local name, _,_,_,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(774))
    if(fromwho == "player") then
        local spellTimer = GetTime()-expirationTime
        if spellTimer > -2 then
            return "|cffFF0000"..x.."|r"
        elseif spellTimer > -5 then
            return "|cffFF9900"..x.."|r"
        else
            return "|cff33FF33"..x.."|r"
        end
    end
end
oUF.Tags.Events['freebgrid:rejuv'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:rejuvTime'] = function(u)
    local name, _,_,_,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(774))
    if(fromwho == "player") then return getTime(expirationTime) end 
end
oUF.Tags.Events['freebgrid:rejuvTime'] = "UNIT_AURA"

--愈合
oUF.Tags.Methods['freebgrid:regrow'] = function(u) if UnitAura(u, GetSpellInfo(8936)) then return "|cff00FF10"..x.."|r" end end
oUF.Tags.Events['freebgrid:regrow'] = "UNIT_AURA"

--野性成长
oUF.Tags.Methods['freebgrid:wg'] = function(u) if UnitAura(u, GetSpellInfo(48438)) then return "|cff33FF33"..x.."|r" end end
oUF.Tags.Events['freebgrid:wg'] = "UNIT_AURA"

--野性印记/王者祝福
oUF.Tags.Methods['freebgrid:motw'] = function(u) if not(UnitAura(u, GetSpellInfo(1126)) or UnitAura(u,GetSpellInfo(20217)) or UnitAura(u,GetSpellInfo(117666))) then return "|cffffa922"..x.."|r" end end
oUF.Tags.Events['freebgrid:motw'] = "UNIT_AURA"

-- Warrior 战士
--战斗怒吼/寒冬号角/大地之力
oUF.Tags.Methods['freebgrid:stragi'] = function(u) if not(UnitAura(u, GetSpellInfo(6673)) or UnitAura(u, GetSpellInfo(57330)) or UnitAura(u, GetSpellInfo(8076))) then return "|cffe1b917"..x.."|r" end end
oUF.Tags.Events['freebgrid:stragi'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:vigil'] = function(u) if UnitAura(u, GetSpellInfo(50720)) then return "|cff8B4513"..x.."|r" end end
oUF.Tags.Events['freebgrid:vigil'] = "UNIT_AURA"

-- Shaman 萨满
--激流
oUF.Tags.Methods['freebgrid:rip'] = function(u) 
    local name, _,_,_,_,_,_, fromwho = UnitAura(u, GetSpellInfo(61295))
    if(fromwho == 'player') then return "|cff00FEBF"..x.."|r" end
end
oUF.Tags.Events['freebgrid:rip'] = 'UNIT_AURA'

oUF.Tags.Methods['freebgrid:ripTime'] = function(u)
    local name, _,_,_,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(61295))
    if(fromwho == "player") then return getTime(expirationTime) end 
end
oUF.Tags.Events['freebgrid:ripTime'] = 'UNIT_AURA'
--大地盾
local earthCount = {'i','h','g','f','p','q','Z','Z','Y'}
oUF.Tags.Methods['freebgrid:earth'] = function(u) 
    local c = select(4, UnitAura(u, GetSpellInfo(974))) if c then return '|cffFFCF7F'..earthCount[c]..'|r' end 
end
oUF.Tags.Events['freebgrid:earth'] = 'UNIT_AURA'

-- Paladin 圣骑士
--憎恶之力/力量祝福
oUF.Tags.Methods['freebgrid:might'] = function(u) if not(UnitAura(u, GetSpellInfo(109773))) then return "|cffFF0000"..x.."|r" end end
oUF.Tags.Events['freebgrid:might'] = "UNIT_AURA"

--圣光道标
oUF.Tags.Methods['freebgrid:beacon'] = function(u)
    local name, _,_,_,_,_,_, fromwho = UnitAura(u, GetSpellInfo(53563))
    if not name then return end
    if(fromwho == "player") then
        return "|cffFFCC003|r"
    else
        return "|cff996600Y|r" -- other pally's beacon
    end
end
oUF.Tags.Events['freebgrid:beacon'] = "UNIT_AURA"

--释放保护等技能造成的自律debuff
oUF.Tags.Methods['freebgrid:forbearance'] = function(u) if UnitDebuff(u, GetSpellInfo(25771)) then return "|cffFF9900"..x.."|r" end end
oUF.Tags.Events['freebgrid:forbearance'] = "UNIT_AURA"

-- Warlock 术士
--黑暗意图
--[[oUF.Tags.Methods['freebgrid:di'] = function(u) 
    local name, _,_,_,_,_,_, fromwho = UnitAura(u, GetSpellInfo(109773))
    if fromwho == "player" then
        return "|cff6600FF"..x.."|r"
    elseif name then
        return "|cffCC00FF"..x.."|r"
    end
end
oUF.Tags.Events['freebgrid:di'] = "UNIT_AURA"
]]

--灵魂石复活
oUF.Tags.Methods['freebgrid:ss'] = function(u) 
    local name, _,_,_,_,_,_, fromwho = UnitAura(u, GetSpellInfo(20707)) 
    if fromwho == "player" then
        return "|cff6600FFY|r"
    elseif name then
        return "|cffCC00FFY|r"
    end
end
oUF.Tags.Events['freebgrid:ss'] = "UNIT_AURA"


-- Mage 法师
--奥术光辉
oUF.Tags.Methods['freebgrid:int'] = function(u) if not(UnitAura(u, GetSpellInfo(109773)) or UnitAura(u, GetSpellInfo(1459)) or UnitAura(u, GetSpellInfo(61316))) then return "|cff00A1DE"..x.."|r" end end
oUF.Tags.Events['freebgrid:int'] = "UNIT_AURA"

--专注魔法
oUF.Tags.Methods['freebgrid:fmagic'] = function(u) if UnitAura(u, GetSpellInfo(54648)) then return "|cffCC00FF"..x.."|r" end end
oUF.Tags.Events['freebgrid:fmagic'] = "UNIT_AURA"

--武僧
--氤氲之雾
oUF.Tags.Methods["freebgrid:em"] = function(u) if UnitAura(u, GetSpellInfo(132120)) then return "|cff79abff"..x.."|r" end end
oUF.Tags.Events["freebgrid:em"] = "UNIT_AURA"

--复苏之雾
oUF.Tags.Methods['freebgrid:rm'] = function(u)
    local name, _,_,_,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(119611))
    if(fromwho == "player") then
        local spellTimer = GetTime()-expirationTime
        if spellTimer > -2 then
            return "|cffFF0000"..x.."|r"
        elseif spellTimer > -5 then
            return "|cffFF9900"..x.."|r"
        else
            return "|cff33FF33"..x.."|r"
        end
    end
end
oUF.Tags.Events['freebgrid:rm'] = "UNIT_AURA"

oUF.Tags.Methods['freebgrid:rmTime'] = function(u)
    local name, _,_,_,_,_, expirationTime, fromwho = UnitAura(u, GetSpellInfo(119611))
    if(fromwho == "player") then return getTime(expirationTime) end 
end
oUF.Tags.Events['freebgrid:rmTime'] = "UNIT_AURA"

ns.classIndicators={
    ["MONK"] = {
        ["TL"] = "[freebgrid:em][freebgrid:motw]",
        ["TR"] = "",
        ["BL"] = "",
        ["BR"] = "",
        ["Cen"] = "[freebgrid:rmTime]",
    },
    ["DRUID"] = {
        ["TL"] = "",
        ["TR"] = "[freebgrid:motw]",
        ["BL"] = "[freebgrid:regrow][freebgrid:wg]",
        ["BR"] = "[freebgrid:lb]",
        ["Cen"] = "[freebgrid:rejuvTime]",
    },
    ["PRIEST"] = {
        ["TL"] = "[freebgrid:pws][freebgrid:ws]",
        ["TR"] = "[freebgrid:fw][freebgrid:fort]",
        ["BL"] = "[freebgrid:rnw][freebgrid:pwb]",
        ["BR"] = "[freebgrid:pom]",
        ["Cen"] = "[freebgrid:rnwTime]",
    },
    ["PALADIN"] = {
        ["TL"] = "[freebgrid:forbearance]",
        ["TR"] = "[freebgrid:might][freebgrid:motw]",
        ["BL"] = "",
        ["BR"] = "[freebgrid:beacon]",
        ["Cen"] = "",
    },
    ["WARLOCK"] = {
        ["TL"] = "[freebgrid:int]",
        ["TR"] = "",
        ["BL"] = "",
        ["BR"] = "[freebgrid:ss]",
        ["Cen"] = "",
    },
    ["WARRIOR"] = {
        ["TL"] = "[freebgrid:vigil]",
        ["TR"] = "[freebgrid:stragi][freebgrid:fort]",
        ["BL"] = "",
        ["BR"] = "",
        ["Cen"] = "",
    },
    ["DEATHKNIGHT"] = {
        ["TL"] = "",
        ["TR"] = "",
        ["BL"] = "",
        ["BR"] = "",
        ["Cen"] = "",
    },
    ["SHAMAN"] = {
        ["TL"] = "[freebgrid:rip]",
        ["TR"] = "",
        ["BL"] = "",
        ["BR"] = "[freebgrid:earth]",
        ["Cen"] = "[freebgrid:ripTime]",
    },
    ["HUNTER"] = {
        ["TL"] = "",
        ["TR"] = "",
        ["BL"] = "",
        ["BR"] = "",
        ["Cen"] = "",
    },
    ["ROGUE"] = {
        ["TL"] = "",
        ["TR"] = "",
        ["BL"] = "",
        ["BR"] = "",
        ["Cen"] = "",
    },
    ["MAGE"] = {
        ["TL"] = "",
        ["TR"] = "[freebgrid:int]",
        ["BL"] = "[freebgrid:fmagic]",
        ["BR"] = "",
        ["Cen"] = "",
    }
}

