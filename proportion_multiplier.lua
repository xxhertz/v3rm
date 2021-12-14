-- credit to failedmite57926, cleaned up their source
local character = game:GetService("Players").LocalPlayer.Character
local humanoid = character:FindFirstChildOfClass("Humanoid")
local function wipe_parts()
	for _, part in pairs(character:GetDescendants()) do
		if part:IsA("BasePart") and part.Name ~= "Head" then
			for _, attachment in pairs(part:GetDescendants()) do
				if attachment:IsA("Attachment") and attachment:FindFirstChild("OriginalPosition") then
					attachment.OriginalPosition:Destroy()
				end
			end
			part:WaitForChild("OriginalSize"):Destroy()
			if part:FindFirstChild("AvatarPartScaleType") then
				part:FindFirstChild("AvatarPartScaleType"):Destroy()
			end
		end
	end
end
wipe_parts()
humanoid:WaitForChild("BodyTypeScale"):Destroy()
wipe_parts()
humanoid:WaitForChild("BodyWidthScale"):Destroy()
wipe_parts()
humanoid:WaitForChild("BodyDepthScale"):Destroy()
wipe_parts()
humanoid:WaitForChild("HeadScale"):Destroy()
