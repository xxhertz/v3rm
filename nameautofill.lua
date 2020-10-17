local sGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local TextBox = Instance.new("TextBox", sGui)
TextBox.Size = UDim2.new(0,200,0,40)
TextBox.Position = UDim2.new(.5,-TextBox.Size.X.Offset/2,.5,-TextBox.Size.Y.Offset/2)

function began(key)
	if key.KeyCode == Enum.KeyCode.Tab then
		local target = TextBox.Text
		game:GetService("RunService").RenderStepped:Wait()
		for _,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name:sub(1,#target):lower() == target:lower() then
				target = v
				break
			end
		end
		if not target then
			return
		end
		TextBox.Text = target.Name
		TextBox.CursorPosition = #TextBox.Text+1
	end
end
TextBox.Focused:Connect(function()
	begancon = game:GetService("UserInputService").InputBegan:Connect(began)
end)
TextBox.FocusLost:Connect(function()
	begancon:Disconnect()
end)