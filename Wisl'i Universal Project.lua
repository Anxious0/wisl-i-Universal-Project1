function CreateWislBasicUI()
    local old = (game:GetService("CoreGui"):FindFirstChild("WislBasicUI") or (game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("WislBasicUI")))
    if old then
        old:Destroy()
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WislBasicUI"
    if syn and syn.protect_gui then
        syn.protect_gui(screenGui)
        screenGui.Parent = game:GetService("CoreGui")
    else
        pcall(function() screenGui.Parent = game:GetService("CoreGui") end)
        if not screenGui.Parent then
            screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        end
    end

    local buttonHolder = Instance.new("Frame")
    buttonHolder.Size = UDim2.new(0, 220, 0, 150)
    buttonHolder.Position = UDim2.new(0.5, -110, 0.5, -75)
    buttonHolder.BackgroundTransparency = 1
    buttonHolder.BorderSizePixel = 0
    buttonHolder.Parent = screenGui

    local uiList = Instance.new("UIListLayout")
    uiList.Parent = buttonHolder
    uiList.FillDirection = Enum.FillDirection.Vertical
    uiList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    uiList.VerticalAlignment = Enum.VerticalAlignment.Center
    uiList.Padding = UDim.new(0, 14)

    local pcButton = Instance.new("TextButton")
    pcButton.Size = UDim2.new(1, 0, 0, 40)
    pcButton.BackgroundColor3 = Color3.fromRGB(66, 135, 245)
    pcButton.Text = "Wisl Pc"
    pcButton.TextColor3 = Color3.new(1,1,1)
    pcButton.Font = Enum.Font.GothamBold
    pcButton.TextSize = 20
    pcButton.BorderSizePixel = 0
    pcButton.AutoButtonColor = true
    pcButton.Parent = buttonHolder

    local pcCorner = Instance.new("UICorner")
    pcCorner.CornerRadius = UDim.new(0, 10)
    pcCorner.Parent = pcButton

    local mobileButton = Instance.new("TextButton")
    mobileButton.Size = UDim2.new(1, 0, 0, 40)
    mobileButton.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
    mobileButton.Text = "Wisl Moblie"
    mobileButton.TextColor3 = Color3.new(1,1,1)
    mobileButton.Font = Enum.Font.GothamBold
    mobileButton.TextSize = 20
    mobileButton.BorderSizePixel = 0
    mobileButton.AutoButtonColor = true
    mobileButton.Parent = buttonHolder

    local mobileCorner = Instance.new("UICorner")
    mobileCorner.CornerRadius = UDim.new(0, 10)
    mobileCorner.Parent = mobileButton

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(1, 0, 0, 36)
    closeButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
    closeButton.Text = "Close"
    closeButton.TextColor3 = Color3.new(1,1,1)
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 18
    closeButton.BorderSizePixel = 0
    closeButton.AutoButtonColor = true
    closeButton.Parent = buttonHolder

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 10)
    closeCorner.Parent = closeButton

    pcButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl'i%20Universal%20Project%20new%20UI.lua", true))()
    end)

    mobileButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl%20Universal%20Project%20Mobile.lua", true))()
    end)

    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
end

CreateWislBasicUI()
