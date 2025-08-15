local function CreateWislUI()
    local oldUI = game:GetService("CoreGui"):FindFirstChild("WislUI") or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("WislUI")
    if oldUI then oldUI:Destroy() end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WislUI"
    screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 260, 0, 120)
    mainFrame.Position = UDim2.new(0.5, -130, 0.5, -60)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 32, 36)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 36)
    title.BackgroundTransparency = 1
    title.Text = "Wisl Universal"
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 22
    title.Parent = mainFrame

    local buttonFrame = Instance.new("Frame")
    buttonFrame.Size = UDim2.new(1, 0, 1, -36)
    buttonFrame.Position = UDim2.new(0, 0, 0, 36)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.Parent = mainFrame

    local listLayout = Instance.new("UIListLayout")
    listLayout.FillDirection = Enum.FillDirection.Vertical
    listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    listLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    listLayout.Padding = UDim.new(0, 12)
    listLayout.Parent = buttonFrame

    local function createButton(text, color)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0.85, 0, 0, 38)
        button.Text = text
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 18
        button.BorderSizePixel = 0
        button.BackgroundColor3 = color
        button.AutoButtonColor = true
        button.Parent = buttonFrame

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 8)
        btnCorner.Parent = button

        return button
    end

    local pcButton = createButton("Wisl Pc / Mobile", Color3.fromRGB(66, 135, 245))
    local closeButton = createButton("Close", Color3.fromRGB(220, 60, 60))

    pcButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl'i%20Universal%20Project%20new%20UI.lua", true))()
    end)

    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
end

CreateWislUI()
