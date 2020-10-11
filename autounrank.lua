local prefix = ";"
function unrank(v)
	game.ReplicatedStorage.HDAdminClient.Signals.RequestCommand:InvokeServer(prefix.."unrank "..v.Name)
end
for _,v in pairs(game:GetService("Players"):GetPlayers()) do
	unrank(v)
end
game:GetService("Players").PlayerAdded:Connect(unrank)
