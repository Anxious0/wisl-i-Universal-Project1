local function autoLoadScript()
    local success, result = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/wisl.lua"))() 
    end)
 
    game.Players.PlayerRemoving:Connect(function(player)
        if player == game.Players.LocalPlayer then
            if syn then
                syn.queue_on_teleport([[
                    wait(1)
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/wisl.lua"))() 
                ]])
            else
                queue_on_teleport([[
                    wait(1)
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/wisl.lua"))() 
                ]])
            end
        end
    end)
end
 
autoLoadScript()
