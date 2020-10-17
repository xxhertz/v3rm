local mt = getrawmetatable(game)
local oldhook = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
	if not checkcaller() and self == game.Players.LocalPlayer then
		if getnamecallmethod() == "GetRankInGroup" then
			return 255
		elseif getnamecallmethod() == "GetRoleInGroup" then
			return "Manager" --change this obv
		end
		return oldhook(self, ...)
	end
	return oldhook(self, ...)
end)
setreadonly(mt, true)