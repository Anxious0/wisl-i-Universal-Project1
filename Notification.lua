local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NotificationGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local backgroundFrame = Instance.new("Frame")
backgroundFrame.Name = "Background"
backgroundFrame.Size = UDim2.new(0.5, 0, 0.2, 0) 
backgroundFrame.Position = UDim2.new(0.25, 0, 0.4, 0) 
backgroundFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
backgroundFrame.BorderSizePixel = 0
backgroundFrame.BackgroundTransparency = 1 
backgroundFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.1, 0) 
uiCorner.Parent = backgroundFrame

local textLabel = Instance.new("TextLabel")
textLabel.Name = "NotificationText"
textLabel.Size = UDim2.new(1, -20, 1, -20) 
textLabel.Position = UDim2.new(0, 10, 0, 10)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Welcome to Universal Project!"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Font = Enum.Font.GothamBold
textLabel.TextScaled = true 
textLabel.Parent = backgroundFrame

local sound = Instance.new("Sound")
sound.Name = "NotificationSound"
sound.SoundId = "rbxassetid://6026984224"
sound.Volume = 1
sound.Parent = backgroundFrame

local function showNotification(duration)

    sound:Play()
    

    backgroundFrame:TweenSizeAndPosition(
        UDim2.new(0.5, 0, 0.2, 0), 
        UDim2.new(0.25, 0, 0.4, 0), 
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.5, 
        true
    )
    backgroundFrame.BackgroundTransparency = 1
    for i = 1, 10 do
        backgroundFrame.BackgroundTransparency = backgroundFrame.BackgroundTransparency - 0.1
        wait(0.05)
    end
    
    wait(duration) 
    
 
    for i = 1, 10 do
        backgroundFrame.BackgroundTransparency = backgroundFrame.BackgroundTransparency + 0.1
        wait(0.05)
    end
    backgroundFrame:Destroy()
end

showNotification(3)
