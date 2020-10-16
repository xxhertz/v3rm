local codes = {"WorldAlive","DIY","SettingTheStage","StrikeAPose","GetMoving","VictoryLap"}
local remote = game:GetService("ReplicatedStorage").Events:FindFirstChild("RedeemCode")
for i = 1, #codes do 
    remote:FireServer(codes[i])
end