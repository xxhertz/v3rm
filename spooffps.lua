local spoofto = 60

local mt = getrawmetatable(game)
local nc = mt.__namecall
local fps = game.Stats.FrameRateManager.AverageFPS
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    math.randomseed(math.random(1,12384234))
    if self == fps and getnamecallmethod() == "GetValue" then
        return spoofto - math.random(1, 2000000000) / 2000000000
    elseif self == fps and getnamecallmethod() == "GetValueString" then
        return math.floor((math.floor((spoofto - math.random(1, 2000000000) / 2000000000)*2) + 1)/2)
    end
    return nc(self, ...)
end)
setreadonly(mt, true)