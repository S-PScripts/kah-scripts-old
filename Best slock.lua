local prefix = '.'
local whitelist = {"scriptingprogrammer","me_123eq","me_crashking"}
local blacklist = {}
local slockenabled = false

local Players = game:GetService("Players")
function checkforplayer(plr)
  for i, v in pairs(game.Players:GetPlayers()) do
      if string.sub(v.Name:lower(), 1, #plr) == plr then
          player = v.Name
          print(player)
      end
  end
  print("DEBUG MESSAGE")
end


game.Players:Chat("h \n\n\n [SlockD] Serverslock is possible.  \n\n\n")

function slock()
    local players = game.Players:GetPlayers()
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name and not table.find(whitelist, v.Name) then
            for i, player in ipairs(players) do
                if string.find(player.Name:lower(), v.Name:lower()) then
                    if slockenabled == true or table.find(blacklist, v.Name) then
                        if not game.Lighting:FindFirstChild(v.Name) then
                                game.Players:Chat('punish '..v.Name)
                                game.Players:Chat('pm '..v.Name..' sorry, you are blacklisted!')
                        end
                    end
                    break
                end
            end
        end
    end
end 

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if string.sub(msg:lower(), 1, #prefix + 2)  == prefix..'wl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 4)
         checkforplayer(dasplayer)
         if player ~= nil then
                table.insert(whitelist, player)
                game.Players:Chat('unpunish '..player)
         else
                print('Cannot find player with the name: '..dasplayer)
         end
    end
    
    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'unwl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 6)
         checkforplayer(dasplayer)
         if player ~= nil then
                table.remove(whitelist, player)
         else
                print('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 2) == prefix..'bl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 4)
         checkforplayer(dasplayer)
         if player ~= nil then
                table.insert(blacklist, player)
         else
                print('Cannot find player with the name: '..dasplayer)
         end
    end

    if string.sub(msg:lower(), 1, #prefix + 4) == prefix..'unbl' then
         local dasplayer = string.sub(msg:lower(), #prefix + 6)
         checkforplayer(dasplayer)
         if player ~= nil then
                table.remove(blacklist, player)
                game.Players:Chat('unpunish '..player)
         else
                print('Cannot find player with the name: '..dasplayer)
         end
    end
    
    if string.sub(msg:lower(), 1, #prefix + 5) == prefix..'slock' then
        slockenabled = true
    end
    
    if string.sub(msg:lower(), 1, #prefix + 6) == prefix..'unslock' then
        slockenabled = false
        game.Players:Chat('unpunish all')
    end
end)

while true do
      slock() 
      task.wait()
end
