local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.Name = "Windows10Notification"
screenGui.ResetOnSpawn = false
screenGui.Enabled = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local blurEffect = Instance.new("BlurEffect")
blurEffect.Size = 0
blurEffect.Parent = game:GetService("Lighting")

local shadowFrame = Instance.new("Frame")
shadowFrame.Size = UDim2.new(0, 380, 0, 250)
shadowFrame.Position = UDim2.new(0, -400, 0.5, -125)
shadowFrame.BackgroundTransparency = 1
shadowFrame.BorderSizePixel = 0
shadowFrame.Parent = screenGui

for i = 1, 4 do
    local shadow = Instance.new("Frame")
    shadow.Size = UDim2.new(1, 8 - i*2, 1, 8 - i*2)
    shadow.Position = UDim2.new(0, i-4, 0, i-4)
    shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    shadow.BackgroundTransparency = 0.8 + (i * 0.05)
    shadow.BorderSizePixel = 0
    shadow.ZIndex = 1
    
    local shadowCorner = Instance.new("UICorner")
    shadowCorner.CornerRadius = UDim.new(0, 10)
    shadowCorner.Parent = shadow
    
    shadow.Parent = shadowFrame
end

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, -8, 1, -8)
frame.Position = UDim2.new(0, 4, 0, 4)
frame.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
frame.BorderSizePixel = 0
frame.ZIndex = 5
frame.Parent = shadowFrame

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 8)
frameCorner.Parent = frame

local frameGradient = Instance.new("UIGradient")
frameGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(240, 240, 240))
})
frameGradient.Rotation = 45
frameGradient.Parent = frame

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 36)
topBar.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
topBar.BorderSizePixel = 0
topBar.ZIndex = 6
topBar.Parent = frame

local topBarCorner = Instance.new("UICorner")
topBarCorner.CornerRadius = UDim.new(0, 8)
topBarCorner.Parent = topBar

local topBarGradient = Instance.new("UIGradient")
topBarGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 130, 230)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 110, 200))
})
topBarGradient.Rotation = 90
topBarGradient.Parent = topBar

local topBarCover = Instance.new("Frame")
topBarCover.Size = UDim2.new(1, -16, 0, 12)
topBarCover.Position = UDim2.new(0, 8, 1, -12)
topBarCover.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
topBarCover.BorderSizePixel = 0
topBarCover.ZIndex = 6
topBarCover.Parent = topBar

local topBarCoverGradient = Instance.new("UIGradient")
topBarCoverGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 130, 230)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 110, 200))
})
topBarCoverGradient.Rotation = 90
topBarCoverGradient.Parent = topBarCover

local windowsLogo = Instance.new("ImageLabel")
windowsLogo.Size = UDim2.new(0, 18, 0, 18)
windowsLogo.Position = UDim2.new(0, 14, 0, 9)
windowsLogo.BackgroundTransparency = 1
windowsLogo.Image = "rbxassetid://13799771"
windowsLogo.ZIndex = 7
windowsLogo.Parent = topBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0.7, 0, 1, 0)
titleText.Position = UDim2.new(0, 40, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Wisl'i Notification"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 15
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.ZIndex = 7
titleText.Parent = topBar

local titleShadow = Instance.new("TextLabel")
titleShadow.Size = titleText.Size
titleShadow.Position = UDim2.new(0, 41, 0, 1)
titleShadow.BackgroundTransparency = 1
titleShadow.Text = titleText.Text
titleShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
titleShadow.TextTransparency = 0.8
titleShadow.Font = titleText.Font
titleShadow.TextSize = titleText.TextSize
titleShadow.TextXAlignment = titleText.TextXAlignment
titleShadow.ZIndex = 6
titleShadow.Parent = topBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 46, 0, 36)
closeButton.Position = UDim2.new(1, -46, 0, 0)
closeButton.BackgroundTransparency = 1
closeButton.Text = "✖"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.ZIndex = 7
closeButton.Parent = topBar

local messageFrame = Instance.new("Frame")
messageFrame.Size = UDim2.new(1, -30, 0, 170)
messageFrame.Position = UDim2.new(0, 15, 0, 45)
messageFrame.BackgroundTransparency = 1
messageFrame.ZIndex = 6
messageFrame.Parent = frame

local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 54, 0, 54)
icon.Position = UDim2.new(0, 10, 0, 10)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://11245170366"
icon.ZIndex = 7
icon.Parent = messageFrame

local iconBackground = Instance.new("Frame")
iconBackground.Size = UDim2.new(0, 60, 0, 60)
iconBackground.Position = UDim2.new(0, 7, 0, 7)
iconBackground.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
iconBackground.ZIndex = 6
iconBackground.Parent = messageFrame

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = iconBackground

local messageTitle = Instance.new("TextLabel")
messageTitle.Size = UDim2.new(0.8, 0, 0, 28)
messageTitle.Position = UDim2.new(0, 80, 0, 10)
messageTitle.BackgroundTransparency = 1
messageTitle.Text = "Script Loaded Successfully"
messageTitle.TextColor3 = Color3.fromRGB(30, 30, 30)
messageTitle.Font = Enum.Font.GothamBold
messageTitle.TextSize = 16
messageTitle.TextXAlignment = Enum.TextXAlignment.Left
messageTitle.ZIndex = 7
messageTitle.Parent = messageFrame

local messageText = Instance.new("TextLabel")
messageText.Size = UDim2.new(0.8, 0, 0, 80)
messageText.Position = UDim2.new(0, 80, 0, 45)
messageText.BackgroundTransparency = 1
messageText.Text = "WelCome To Wisl'i Universal ProJect!!"
messageText.TextColor3 = Color3.fromRGB(60, 60, 60)
messageText.Font = Enum.Font.Gotham
messageText.TextSize = 14
messageText.TextWrapped = true
messageText.TextXAlignment = Enum.TextXAlignment.Left
messageText.ZIndex = 7
messageText.Parent = messageFrame

local timeStamp = Instance.new("TextLabel")
timeStamp.Size = UDim2.new(0.3, 0, 0, 20)
timeStamp.Position = UDim2.new(0.7, 0, 0, 15)
timeStamp.BackgroundTransparency = 1
timeStamp.Text = os.date("%I:%M %p")
timeStamp.TextColor3 = Color3.fromRGB(100, 100, 100)
timeStamp.Font = Enum.Font.GothamSemibold
timeStamp.TextSize = 12
timeStamp.TextXAlignment = Enum.TextXAlignment.Right
timeStamp.ZIndex = 7
timeStamp.Parent = messageFrame

local separator = Instance.new("Frame")
separator.Size = UDim2.new(1, -30, 0, 1)
separator.Position = UDim2.new(0, 15, 0, 180)
separator.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
separator.BorderSizePixel = 0
separator.ZIndex = 6
separator.Parent = frame

local okButton = Instance.new("TextButton")
okButton.Size = UDim2.new(0, 110, 0, 36)
okButton.Position = UDim2.new(0.5, -55, 0, 195)
okButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
okButton.Text = "OK"
okButton.TextColor3 = Color3.fromRGB(255, 255, 255)
okButton.Font = Enum.Font.GothamBold
okButton.TextSize = 15
okButton.ZIndex = 7
okButton.Parent = frame

local buttonGradient = Instance.new("UIGradient")
buttonGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 130, 230)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 110, 200))
})
buttonGradient.Rotation = 90
buttonGradient.Parent = okButton

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = okButton

local buttonStroke = Instance.new("UIStroke")
buttonStroke.Color = Color3.fromRGB(0, 90, 180)
buttonStroke.Thickness = 1
buttonStroke.Transparency = 0.5
buttonStroke.Parent = okButton

closeButton.MouseButton1Click:Connect(function()
    local slideTween = TweenService:Create(
        shadowFrame, 
        TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        {Position = UDim2.new(0, -400, 0.5, -125)}
    )
    
    local blurTween = TweenService:Create(
        blurEffect,
        TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        {Size = 0}
    )
    
    slideTween:Play()
    blurTween:Play()
    
    slideTween.Completed:Connect(function()
        blurEffect:Destroy()
        screenGui:Destroy()
    end)
end)

closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundTransparency = 0.7
    closeButton.BackgroundColor3 = Color3.fromRGB(232, 17, 35)
    
    local hoverTween = TweenService:Create(
        closeButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0.3}
    )
    hoverTween:Play()
end)

closeButton.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(
        closeButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 1}
    )
    leaveTween:Play()
end)

okButton.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(
        okButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(0, 140, 230)}
    )
    hoverTween:Play()
end)

okButton.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(
        okButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(0, 120, 215)}
    )
    leaveTween:Play()
end)

okButton.MouseButton1Click:Connect(function()
    local slideTween = TweenService:Create(
        shadowFrame, 
        TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        {Position = UDim2.new(0, -400, 0.5, -125)}
    )
    
    local blurTween = TweenService:Create(
        blurEffect,
        TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        {Size = 0}
    )
    
    slideTween:Play()
    blurTween:Play()
    
    slideTween.Completed:Connect(function()
        blurEffect:Destroy()
        screenGui:Destroy()
    end)
end)

okButton.MouseButton1Down:Connect(function()
    local pressTween = TweenService:Create(
        okButton,
        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(0, 100, 190), Size = UDim2.new(0, 108, 0, 34), Position = UDim2.new(0.5, -54, 0, 196)}
    )
    pressTween:Play()
end)

okButton.MouseButton1Up:Connect(function()
    local releaseTween = TweenService:Create(
        okButton,
        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(0, 120, 215), Size = UDim2.new(0, 110, 0, 36), Position = UDim2.new(0.5, -55, 0, 195)}
    )
    releaseTween:Play()
end)

local function showNotification()
    screenGui.Enabled = true
    
    local blurTween = TweenService:Create(
        blurEffect,
        TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        {Size = 10}
    )
    blurTween:Play()
    
    local slideTween = TweenService:Create(
        shadowFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        {Position = UDim2.new(0.5, -800, 0.6, -300)}
    )
    slideTween:Play()
    
    slideTween.Completed:Connect(function()
        local bounceTween = TweenService:Create(
            shadowFrame,
            TweenInfo.new(0.15, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out),
            {Position = UDim2.new(0.5, -800, 0.6, -300)}
        )
        bounceTween:Play()
    end)
end

local isDragging = false
local dragInput
local dragStart
local startPos

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = true
        dragStart = input.Position
        startPos = shadowFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                isDragging = false
            end
        end)
    end
end)

topBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and isDragging then
        local delta = input.Position - dragStart
        shadowFrame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
end)

local function updateTimestamp()
    timeStamp.Text = os.date("%I:%M %p")
end

local timestampConnection
local function startTimestampUpdater()
    updateTimestamp()
    if timestampConnection then timestampConnection:Disconnect() end
    timestampConnection = RunService.Heartbeat:Connect(function()
        if os.time() % 60 == 0 then
            updateTimestamp()
        end
    end)
end

local function setNotificationContent(title, message, iconId)
    messageTitle.Text = title or "Script Loaded Successfully"
    messageText.Text = message or "Welcome To Wisl'i Universal Project!!"
    if iconId then
        icon.Image = iconId
    end
    updateTimestamp()
end

wait(1)
showNotification()
startTimestampUpdater()

return {
    show = showNotification,
    setContent = setNotificationContent,
    close = function()
        closeButton.MouseButton1Click:Fire()
    end
}
