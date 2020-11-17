rconsolename('Shinobi Life 2 | Inf Spins')
repeat
   wait()
until game:IsLoaded()
local wait_time = 15
wait(wait_time)
local LocalPlayer = game.Players.LocalPlayer
local client = {}
local kgs_wanted = {'shisuisharingan'}
client.spin = function(kg1,kg2,kg3,kg4)
   if LocalPlayer.statz.spins.Value > 0 then
       if kg1 then LocalPlayer.startevent:FireServer('spin','kg1') end
       if kg2 then LocalPlayer.startevent:FireServer('spin','kg2') end
       if kg3 then LocalPlayer.startevent:FireServer('spin','kg3') end
       if kg4 then LocalPlayer.startevent:FireServer('spin','kg4') end
   end
end
client.quick_spin = function()
   for i,v in pairs(LocalPlayer.statz.main:GetDescendants()) do
       if v.Name == 'dontspin' then
           v:Destroy()
       end
   end
end
client.check = function(wanted_kg)
   for i=1, #wanted_kg do
       if LocalPlayer:WaitForChild('statz').main.kg1.Value == wanted_kg[i] or
       LocalPlayer:WaitForChild('statz').main.kg2.Value == wanted_kg[i] or
       LocalPlayer:WaitForChild('statz').main.kg3.Value == wanted_kg[i] or
       LocalPlayer:WaitForChild('statz').main.kg4.Value == wanted_kg[i] then
           return true
       else
           return false
       end
   end
end
rconsoleprint('@@YELLOW@@')
rconsoleprint('[Client] +------------ Current player stats ------------+\n')
rconsoleprint('@@LIGHT_BLUE@@')
rconsoleprint('[Client] | KG1 | '..LocalPlayer:WaitForChild('statz').main.kg1.Value..'\n')
rconsoleprint('[Client] | KG2 | '..LocalPlayer:WaitForChild('statz').main.kg2.Value..'\n')
rconsoleprint('[Client] | KG3 | '..LocalPlayer:WaitForChild('statz').main.kg3.Value..'\n')
rconsoleprint('[Client] | KG4 | '..LocalPlayer:WaitForChild('statz').main.kg4.Value..'\n')
rconsoleprint('@@YELLOW@@')
rconsoleprint('[Client] +----------------------------------------------+\n')
while wait() do
   if LocalPlayer:WaitForChild('statz').spins.Value > 0 and client.check(kgs_wanted) == false then
       client.spin(true,true,false,false)
       client.quick_spin()
   elseif client.check(kgs_wanted) then
       rconsoleprint('@@LIGHT_GREEN@@')
       rconsoleprint('[Client] Found | found the kg you wanted\n')
       rconsoleprint('[Client] Please close roblox or join a village to save\n')
       break
   elseif LocalPlayer:WaitForChild('statz').spins.Value == 0 then
       LocalPlayer.statz:Destroy()
       wait()
       rconsoleprint('@@LIGHT_RED@@')
       rconsoleprint('[Client] Failed | joining a new game attempting to start again\n')
      queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/xxhertz/v3rm/master/random/shinobishit.lua", true))
       game:GetService("TeleportService"):Teleport(4616652839)
   end
end
