--[[
	Curation settings for tullaCC
--]]

local AddonName, Addon = ...
local C = {}; Addon.Config = C

--font settings
C.fontFace = "Fonts\\ARKai_C.ttf"  --what font to use
C.fontSize = 20  --the base font size to use at a scale of 1

--display settings
C.minScale = 0.4 --the minimum scale we want to show cooldown counts at, anything below this will be hidden
C.minDuration = 3 --the minimum number of seconds a cooldown's duration must be to display text
C.expiringDuration = 5  --the minimum number of seconds a cooldown must be to display in the expiring format

--text format strings
C.expiringFormat = '|cffffffff%d|r' --format for timers that are soon to expire
C.secondsFormat = '|cffffffff%d|r' --format for timers that have seconds remaining
C.minutesFormat = '|cffffffff%dm|r' --format for timers that have minutes remaining
C.hoursFormat = '|cffffffff%dh|r' --format for timers that have hours remaining
C.daysFormat = '|cffffffff%dh|r' --format for timers that have days remaining