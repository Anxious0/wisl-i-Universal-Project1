local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptSelectorUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 380, 0, 450)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -225)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.BackgroundTransparency = 1

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(100, 100, 120)
UIStroke.Thickness = 1.5
UIStroke.Transparency = 0.6
UIStroke.Parent = MainFrame

local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(1, 80, 1, 80)
Shadow.ZIndex = -1
Shadow.Image = "rbxassetid://6014261993"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.7
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
Shadow.Parent = MainFrame

local AnimatedGradient = Instance.new("UIGradient")
AnimatedGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 65)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(25, 25, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 55))
}
AnimatedGradient.Rotation = 45
AnimatedGradient.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 85)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

local HeaderGlow = Instance.new("Frame")
HeaderGlow.Name = "HeaderGlow"
HeaderGlow.Size = UDim2.new(1, 0, 1, 0)
HeaderGlow.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
HeaderGlow.BackgroundTransparency = 0.9
HeaderGlow.Parent = Header

local HeaderGlowCorner = Instance.new("UICorner")
HeaderGlowCorner.CornerRadius = UDim.new(0, 20)
HeaderGlowCorner.Parent = HeaderGlow

local HeaderGlowGradient = Instance.new("UIGradient")
HeaderGlowGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 150, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 100, 200))
}
HeaderGlowGradient.Rotation = 90
HeaderGlowGradient.Parent = HeaderGlow

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -80, 0, 40)
Title.Position = UDim2.new(0, 25, 0, 15)
Title.BackgroundTransparency = 1
Title.Text = "✨Wisl Script Selector✨"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 28
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextStrokeTransparency = 0.8
Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Name = "Subtitle"
Subtitle.Size = UDim2.new(1, -80, 0, 25)
Subtitle.Position = UDim2.new(0, 25, 0, 55)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Choose the version you want to use."
Subtitle.TextColor3 = Color3.fromRGB(180, 180, 220)
Subtitle.TextSize = 16
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 45, 0, 45)
CloseButton.Position = UDim2.new(1, -60, 0, 20)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.TextSize = 22
CloseButton.Font = Enum.Font.GothamBold
CloseButton.AutoButtonColor = false
CloseButton.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

local CloseGradient = Instance.new("UIGradient")
CloseGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 60, 60))
}
CloseGradient.Rotation = 45
CloseGradient.Parent = CloseButton

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -50, 1, -120)
ContentFrame.Position = UDim2.new(0, 25, 0, 100)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "VersionLabel"
VersionLabel.Size = UDim2.new(1, 0, 0, 30)
VersionLabel.Position = UDim2.new(0, 0, 1, -35)
VersionLabel.BackgroundTransparency = 1
VersionLabel.Text = "v2.0.0 •"
VersionLabel.TextColor3 = Color3.fromRGB(140, 140, 160)
VersionLabel.TextSize = 13
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.TextXAlignment = Enum.TextXAlignment.Center
VersionLabel.Parent = MainFrame

local function createEnhancedButton(name, position, primaryColor, secondaryColor, icon, description)
    local ButtonContainer = Instance.new("Frame")
    ButtonContainer.Name = name.."Container"
    ButtonContainer.Size = UDim2.new(1, 0, 0, 90)
    ButtonContainer.Position = position
    ButtonContainer.BackgroundTransparency = 1
    ButtonContainer.Parent = ContentFrame
    
    local Button = Instance.new("TextButton")
    Button.Name = name.."Button"
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.BackgroundColor3 = primaryColor
    Button.BackgroundTransparency = 0.15
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = ButtonContainer
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 16)
    ButtonCorner.Parent = Button
    
    local ButtonGradient = Instance.new("UIGradient")
    ButtonGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, primaryColor),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(
            math.min(255, primaryColor.R * 255 + 20),
            math.min(255, primaryColor.G * 255 + 20),
            math.min(255, primaryColor.B * 255 + 20)
        )),
        ColorSequenceKeypoint.new(1, secondaryColor)
    }
    ButtonGradient.Rotation = 135
    ButtonGradient.Parent = Button
    
    local ButtonStroke = Instance.new("UIStroke")
    ButtonStroke.Color = Color3.fromRGB(
        math.min(255, primaryColor.R * 255 + 50),
        math.min(255, primaryColor.G * 255 + 50),
        math.min(255, primaryColor.B * 255 + 50)
    )
    ButtonStroke.Thickness = 1.5
    ButtonStroke.Transparency = 0.5
    ButtonStroke.Parent = Button
    
    local ButtonShadow = Instance.new("ImageLabel")
    ButtonShadow.Name = "Shadow"
    ButtonShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    ButtonShadow.BackgroundTransparency = 1
    ButtonShadow.Position = UDim2.new(0.5, 0, 0.5, 2)
    ButtonShadow.Size = UDim2.new(1, 30, 1, 30)
    ButtonShadow.ZIndex = -1
    ButtonShadow.Image = "rbxassetid://6014261993"
    ButtonShadow.ImageColor3 = primaryColor
    ButtonShadow.ImageTransparency = 0.8
    ButtonShadow.ScaleType = Enum.ScaleType.Slice
    ButtonShadow.SliceCenter = Rect.new(49, 49, 450, 450)
    ButtonShadow.Parent = Button
    
    local IconBg = Instance.new("Frame")
    IconBg.Name = "IconBg"
    IconBg.Size = UDim2.new(0, 55, 0, 55)
    IconBg.Position = UDim2.new(0, 20, 0.5, -27.5)
    IconBg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    IconBg.BackgroundTransparency = 0.9
    IconBg.Parent = Button
    
    local IconBgCorner = Instance.new("UICorner")
    IconBgCorner.CornerRadius = UDim.new(1, 0)
    IconBgCorner.Parent = IconBg
    
    local Icon = Instance.new("TextLabel")
    Icon.Name = "Icon"
    Icon.Size = UDim2.new(1, 0, 1, 0)
    Icon.BackgroundTransparency = 1
    Icon.Text = icon
    Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
    Icon.TextSize = 32
    Icon.Font = Enum.Font.GothamBold
    Icon.Parent = IconBg
    
    local TitleText = Instance.new("TextLabel")
    TitleText.Name = "TitleText"
    TitleText.Size = UDim2.new(1, -100, 0, 30)
    TitleText.Position = UDim2.new(0, 85, 0, 20)
    TitleText.BackgroundTransparency = 1
    TitleText.Text = name
    TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleText.TextSize = 20
    TitleText.Font = Enum.Font.GothamBold
    TitleText.TextXAlignment = Enum.TextXAlignment.Left
    TitleText.TextStrokeTransparency = 0.9
    TitleText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    TitleText.Parent = Button
    
    local DescText = Instance.new("TextLabel")
    DescText.Name = "DescText"
    DescText.Size = UDim2.new(1, -100, 0, 25)
    DescText.Position = UDim2.new(0, 85, 0, 50)
    DescText.BackgroundTransparency = 1
    DescText.Text = description
    DescText.TextColor3 = Color3.fromRGB(220, 220, 240)
    DescText.TextSize = 14
    DescText.Font = Enum.Font.Gotham
    DescText.TextXAlignment = Enum.TextXAlignment.Left
    DescText.Parent = Button
    
    local Arrow = Instance.new("TextLabel")
    Arrow.Name = "Arrow"
    Arrow.Size = UDim2.new(0, 25, 0, 25)
    Arrow.Position = UDim2.new(1, -40, 0.5, -12.5)
    Arrow.BackgroundTransparency = 1
    Arrow.Text = "▶"
    Arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
    Arrow.TextSize = 18
    Arrow.Font = Enum.Font.GothamBold
    Arrow.Parent = Button
    
    local Shine = Instance.new("Frame")
    Shine.Name = "Shine"
    Shine.Size = UDim2.new(0, 0, 1, 0)
    Shine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Shine.BackgroundTransparency = 0.95
    Shine.BorderSizePixel = 0
    Shine.Parent = Button
    
    local ShineCorner = Instance.new("UICorner")
    ShineCorner.CornerRadius = UDim.new(0, 16)
    ShineCorner.Parent = Shine
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.05}):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.3), {Transparency = 0.2}):Play()
        TweenService:Create(TitleText, TweenInfo.new(0.3), {TextSize = 21}):Play()
        TweenService:Create(Arrow, TweenInfo.new(0.3), {Position = UDim2.new(1, -30, 0.5, -12.5)}):Play()
        TweenService:Create(IconBg, TweenInfo.new(0.3), {BackgroundTransparency = 0.8, Size = UDim2.new(0, 60, 0, 60)}):Play()
        TweenService:Create(Icon, TweenInfo.new(0.3), {TextSize = 35}):Play()
        
        Shine.Size = UDim2.new(0, 0, 1, 0)
        Shine.BackgroundTransparency = 0.85
        TweenService:Create(Shine, TweenInfo.new(0.8), {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 0.95}):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.15}):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.3), {Transparency = 0.5}):Play()
        TweenService:Create(TitleText, TweenInfo.new(0.3), {TextSize = 20}):Play()
        TweenService:Create(Arrow, TweenInfo.new(0.3), {Position = UDim2.new(1, -40, 0.5, -12.5)}):Play()
        TweenService:Create(IconBg, TweenInfo.new(0.3), {BackgroundTransparency = 0.9, Size = UDim2.new(0, 55, 0, 55)}):Play()
        TweenService:Create(Icon, TweenInfo.new(0.3), {TextSize = 32}):Play()
    end)
    
    Button.MouseButton1Down:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.1), {Size = UDim2.new(0.96, 0, 0.94, 0), Position = UDim2.new(0.02, 0, 0.03, 0)}):Play()
    end)
    
    Button.MouseButton1Up:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Back), {Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0)}):Play()
    end)
    
    return Button
end

local PCButton = createEnhancedButton("PC Version", UDim2.new(0, 0, 0, 0), Color3.fromRGB(80, 180, 80), Color3.fromRGB(60, 140, 60), "💻", "Full version for desktop")
local ThaiButton = createEnhancedButton("Thai Version", UDim2.new(0, 0, 0, 100), Color3.fromRGB(80, 180, 180), Color3.fromRGB(60, 140, 140), "🇹🇭", "Thai interface")
local MobileButton = createEnhancedButton("Mobile Version", UDim2.new(0, 0, 0, 200), Color3.fromRGB(100, 130, 190), Color3.fromRGB(80, 100, 150), "📱", "Adjust for mobile.")

local function destroyUICompletely()
    local fadeInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    
    TweenService:Create(MainFrame, fadeInfo, {BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 0)}):Play()
    TweenService:Create(Shadow, fadeInfo, {ImageTransparency = 1}):Play()
    
    for _, child in pairs(ScreenGui:GetDescendants()) do
        if child:IsA("GuiObject") then
            if child:IsA("TextLabel") or child:IsA("TextButton") then
                TweenService:Create(child, fadeInfo, {TextTransparency = 1}):Play()
            end
            if child:IsA("Frame") or child:IsA("ImageLabel") then
                TweenService:Create(child, fadeInfo, {BackgroundTransparency = 1}):Play()
            end
            if child:IsA("UIStroke") then
                TweenService:Create(child, fadeInfo, {Transparency = 1}):Play()
            end
        end
    end
    
    wait(0.5)
    ScreenGui:Destroy()
end

PCButton.MouseButton1Click:Connect(function()
    destroyUICompletely()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl'i%20Universal%20Project%20new%20UI.lua", true))()
end)

ThaiButton.MouseButton1Click:Connect(function()
    destroyUICompletely()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl'i%20Universal%20Project%20Thai%20.lua", true))()
end)

MobileButton.MouseButton1Click:Connect(function()
    destroyUICompletely()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl%20Universal%20Project%20Mobile.lua", true))()
end)

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 50, 0, 50), Position = UDim2.new(1, -62.5, 0, 17.5)}):Play()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 120, 120)}):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 45, 0, 45), Position = UDim2.new(1, -60, 0, 20)}):Play()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 85, 85)}):Play()
end)

CloseButton.MouseButton1Click:Connect(function()
    local fadeInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    TweenService:Create(MainFrame, fadeInfo, {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
    TweenService:Create(Shadow, fadeInfo, {ImageTransparency = 1}):Play()
    
    wait(0.4)
    ScreenGui:Destroy()
end)

local dragging = false
local dragInput
local dragStart
local startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    local newPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    TweenService:Create(MainFrame, TweenInfo.new(0.05), {Position = newPosition}):Play()
end

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)

local rotationConnection
rotationConnection = RunService.Heartbeat:Connect(function()
    AnimatedGradient.Rotation = AnimatedGradient.Rotation + 0.3
    if AnimatedGradient.Rotation >= 360 then
        AnimatedGradient.Rotation = 0
    end
end)

MainFrame.Position = UDim2.new(0.5, -190, 0.5, -275)
TweenService:Create(MainFrame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
TweenService:Create(Shadow, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.4}):Play()

wait(0.3)
TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -190, 0.5, -225)}):Play()
