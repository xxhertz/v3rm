function changeName(ins)
	local tpath = ins:GetFullName():split(".")
	local path = "game:GetService(\""..tpath[1].."\")"
	for i = 2, #tpath do
		local _, a = string.gsub(tpath[i], " ", " ")
		if a > 0 then
			path = path.."[\""..tpath[i].."\"]"
		else
			path = path.."."..tpath[i]
		end
	end
	return path
end


--[[
	vanilla lua:
	function string.split(inputstr, sep)
		if sep == nil then
			sep = "%s"
		end

		local t = {}
		for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			table.insert(t, str)
		end
		return t
	end

	function changeName(ins)
		--local path = ins:GetFullName():split(".")
		local tpath = string.split(ins, ".")
		path = "game:GetService(\""..tpath[1].."\")"
		for i = 2, #tpath do
			local _, a = string.gsub(tpath[i], " ", " ")
			if a > 0 then
				path = path.."[\""..tpath[i].."\"]"
			else
				path = path.."."..tpath[i]
			end
		end
		return path
	end

	print(changeName("ReplicatedStorage.Bruh.Oh  a.w a.bruhok"))
]]