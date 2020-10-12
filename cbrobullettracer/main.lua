local lifetime = 5 -- seconds
local material = Enum.Material.ForceField
local thickness = 0.1
local color = Color3.fromRGB(0, 120, 255)

local mt = getrawmetatable(game)
local old = mt.__namecall
local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService").RenderStepped
local lasthittick = tick()
function createBeam(p1, p2)
	local beam = Instance.new("Part", workspace)
	beam.Anchored = true
	beam.CanCollide = false
	beam.Material = material
	beam.Color = color
	beam.Size = Vector3.new(thickness, thickness, (p1 - p2).magnitude)
	beam.CFrame = CFrame.new(p1, p2) * CFrame.new(0, 0, -beam.Size.Z / 2)
	return beam
end

setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
	local args = {...}
	if getnamecallmethod() == "FireServer" and self.Name == "HitPart" and tick() - lasthittick > 0.005 then
		lasthittick = tick()
		spawn(function()
			local beam = createBeam(lp.Character.Head.CFrame.p, args[2])
			for i = 1, 60 * lifetime do
				rs:Wait()
				beam.Transparency = i / (60 * lifetime)
			end
			beam:Destroy()
		end)
	end
	return old(self, ...)
end)
setreadonly(mt, true)
