local mt = getrawmetatable(game)
local oldhook = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
	if not checkcaller() and getnamecallmethod() == "Teleport" then
		return nil
	end
	return oldhook(self, ...)
end)
setreadonly(mt, true)