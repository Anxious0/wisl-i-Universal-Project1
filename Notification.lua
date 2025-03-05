task.spawn(function()
    wait(1) 
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Welcome To Universal",
        Text = "Universal script loaded!",
        Icon = "",
        Duration = 3
    })
end)
