local function autoLoadScript()
    local success, result = pcall(function()
        loadstring(game:HttpGet("loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/adb8b68c7ce760069192d557859f488f2502ccc5/Wisl'i%20Universal%20Project"))()"))()
    end)
 
    game.Players.PlayerRemoving:Connect(function(player)
        if player == game.Players.LocalPlayer then
            if syn then
                syn.queue_on_teleport([[
                    wait(1)
                    loadstring(game:HttpGet("loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/adb8b68c7ce760069192d557859f488f2502ccc5/Wisl'i%20Universal%20Project"))()"))()
                ]])
            else
                queue_on_teleport([[
                    wait(1)
                    loadstring(game:HttpGet("loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/adb8b68c7ce760069192d557859f488f2502ccc5/Wisl'i%20Universal%20Project"))()"))()
                ]])
            end
        end
    end)
end
 
autoLoadScript()
