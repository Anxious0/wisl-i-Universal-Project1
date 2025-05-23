local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptSelectorUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 350, 0, 420)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.BackgroundTransparency = 1

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(70, 70, 90)
UIStroke.Thickness = 1
UIStroke.Transparency = 0.3
UIStroke.Parent = MainFrame

local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(1, 60, 1, 60)
Shadow.ZIndex = -1
Shadow.Image = "rbxassetid://6014261993"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.8
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
Shadow.Parent = MainFrame

local GradientFrame = Instance.new("Frame")
GradientFrame.Name = "GradientFrame"
GradientFrame.Size = UDim2.new(1, 0, 1, 0)
GradientFrame.Position = UDim2.new(0, 0, 0, 0)
GradientFrame.BackgroundTransparency = 1
GradientFrame.Parent = MainFrame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 30))
}
UIGradient.Rotation = 45
UIGradient.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 70)
Header.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 16)
HeaderCorner.Parent = Header

local HeaderGradient = Instance.new("UIGradient")
HeaderGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 50))
}
HeaderGradient.Rotation = 90
HeaderGradient.Parent = Header

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -60, 0, 35)
Title.Position = UDim2.new(0, 20, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "✨ WISL Script Selector"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Name = "Subtitle"
Subtitle.Size = UDim2.new(1, -60, 0, 20)
Subtitle.Position = UDim2.new(0, 20, 0, 45)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Choose your preferred version"
Subtitle.TextColor3 = Color3.fromRGB(180, 180, 200)
Subtitle.TextSize = 14
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -50, 0, 15)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.Font = Enum.Font.GothamBold
CloseButton.AutoButtonColor = false
CloseButton.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

local CloseGradient = Instance.new("UIGradient")
CloseGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 90, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 50, 50))
}
CloseGradient.Rotation = 45
CloseGradient.Parent = CloseButton

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -40, 1, -100)
ContentFrame.Position = UDim2.new(0, 20, 0, 80)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "VersionLabel"
VersionLabel.Size = UDim2.new(1, 0, 0, 25)
VersionLabel.Position = UDim2.new(0, 0, 1, -30)
VersionLabel.BackgroundTransparency = 1
VersionLabel.Text = "v1.2.0 •"
VersionLabel.TextColor3 = Color3.fromRGB(120, 120, 140)
VersionLabel.TextSize = 12
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.TextXAlignment = Enum.TextXAlignment.Center
VersionLabel.Parent = MainFrame

local function createStylishButton(name, position, primaryColor, secondaryColor, icon, description)
    local ButtonContainer = Instance.new("Frame")
    ButtonContainer.Name = name.."Container"
    ButtonContainer.Size = UDim2.new(1, 0, 0, 80)
    ButtonContainer.Position = position
    ButtonContainer.BackgroundTransparency = 1
    ButtonContainer.Parent = ContentFrame
    
    local Button = Instance.new("TextButton")
    Button.Name = name.."Button"
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.BackgroundColor3 = primaryColor
    Button.BackgroundTransparency = 0.1
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = ButtonContainer
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 12)
    ButtonCorner.Parent = Button
    
    local ButtonGradient = Instance.new("UIGradient")
    ButtonGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, primaryColor),
        ColorSequenceKeypoint.new(1, secondaryColor)
    }
    ButtonGradient.Rotation = 135
    ButtonGradient.Parent = Button
    
    local ButtonStroke = Instance.new("UIStroke")
    ButtonStroke.Color = primaryColor
    ButtonStroke.Thickness = 1
    ButtonStroke.Transparency = 0.7
    ButtonStroke.Parent = Button
    
    local ButtonShadow = Instance.new("ImageLabel")
    ButtonShadow.Name = "Shadow"
    ButtonShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    ButtonShadow.BackgroundTransparency = 1
    ButtonShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    ButtonShadow.Size = UDim2.new(1, 20, 1, 20)
    ButtonShadow.ZIndex = -1
    ButtonShadow.Image = "rbxassetid://6014261993"
    ButtonShadow.ImageColor3 = primaryColor
    ButtonShadow.ImageTransparency = 0.85
    ButtonShadow.ScaleType = Enum.ScaleType.Slice
    ButtonShadow.SliceCenter = Rect.new(49, 49, 450, 450)
    ButtonShadow.Parent = Button
    
    local Icon = Instance.new("TextLabel")
    Icon.Name = "Icon"
    Icon.Size = UDim2.new(0, 40, 0, 40)
    Icon.Position = UDim2.new(0, 20, 0.5, -20)
    Icon.BackgroundTransparency = 1
    Icon.Text = icon
    Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
    Icon.TextSize = 28
    Icon.Font = Enum.Font.GothamBold
    Icon.Parent = Button
    
    local TitleText = Instance.new("TextLabel")
    TitleText.Name = "TitleText"
    TitleText.Size = UDim2.new(1, -80, 0, 25)
    TitleText.Position = UDim2.new(0, 70, 0, 15)
    TitleText.BackgroundTransparency = 1
    TitleText.Text = name
    TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleText.TextSize = 18
    TitleText.Font = Enum.Font.GothamSemibold
    TitleText.TextXAlignment = Enum.TextXAlignment.Left
    TitleText.Parent = Button
    
    local DescText = Instance.new("TextLabel")
    DescText.Name = "DescText"
    DescText.Size = UDim2.new(1, -80, 0, 20)
    DescText.Position = UDim2.new(0, 70, 0, 40)
    DescText.BackgroundTransparency = 1
    DescText.Text = description
    DescText.TextColor3 = Color3.fromRGB(200, 200, 220)
    DescText.TextSize = 12
    DescText.Font = Enum.Font.Gotham
    DescText.TextXAlignment = Enum.TextXAlignment.Left
    DescText.Parent = Button
    
    local Arrow = Instance.new("TextLabel")
    Arrow.Name = "Arrow"
    Arrow.Size = UDim2.new(0, 20, 0, 20)
    Arrow.Position = UDim2.new(1, -35, 0.5, -10)
    Arrow.BackgroundTransparency = 1
    Arrow.Text = "→"
    Arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
    Arrow.TextSize = 16
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
    ShineCorner.CornerRadius = UDim.new(0, 12)
    ShineCorner.Parent = Shine
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundTransparency = 0}):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.3), {Transparency = 0.3}):Play()
        TweenService:Create(TitleText, TweenInfo.new(0.3), {TextSize = 19}):Play()
        TweenService:Create(Arrow, TweenInfo.new(0.3), {Position = UDim2.new(1, -25, 0.5, -10)}):Play()
        
        Shine.Size = UDim2.new(0, 0, 1, 0)
        Shine.BackgroundTransparency = 0.85
        TweenService:Create(Shine, TweenInfo.new(0.6), {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 0.95}):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.1}):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.3), {Transparency = 0.7}):Play()
        TweenService:Create(TitleText, TweenInfo.new(0.3), {TextSize = 18}):Play()
        TweenService:Create(Arrow, TweenInfo.new(0.3), {Position = UDim2.new(1, -35, 0.5, -10)}):Play()
    end)
    
    Button.MouseButton1Down:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.1), {Size = UDim2.new(0.98, 0, 0.95, 0), Position = UDim2.new(0.01, 0, 0.025, 0)}):Play()
    end)
    
    Button.MouseButton1Up:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Back), {Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0)}):Play()
    end)
    
    return Button
end

local PCButton = createStylishButton("PC Version", UDim2.new(0, 0, 0, 0), Color3.fromRGB(70, 170, 70), Color3.fromRGB(50, 130, 50), "💻", "Full-featured desktop experience")
local ThaiButton = createStylishButton("Thai Version", UDim2.new(0, 0, 0, 90), Color3.fromRGB(70, 170, 170), Color3.fromRGB(50, 130, 130), "🇹🇭", "Thai language interface")
local MobileButton = createStylishButton("Mobile Version", UDim2.new(0, 0, 0, 180), Color3.fromRGB(90, 120, 180), Color3.fromRGB(70, 90, 140), "📱", "Optimized for mobile devices")

PCButton.MouseButton1Click:Connect(function()
    local fadeInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    TweenService:Create(MainFrame, fadeInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(Shadow, fadeInfo, {ImageTransparency = 1}):Play()
    
    for _, child in pairs(MainFrame:GetDescendants()) do
        if child:IsA("GuiObject") then
            if child:IsA("TextLabel") or child:IsA("TextButton") then
                TweenService:Create(child, fadeInfo, {TextTransparency = 1}):Play()
            end
            if child:IsA("Frame") or child:IsA("ImageLabel") then
                TweenService:Create(child, fadeInfo, {BackgroundTransparency = 1}):Play()
            end
        end
    end
    
    wait(0.4)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl'i%20Universal%20Project%20new%20UI.lua", true))()
    ScreenGui:Destroy()
end)

ThaiButton.MouseButton1Click:Connect(function()
    local fadeInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    TweenService:Create(MainFrame, fadeInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(Shadow, fadeInfo, {ImageTransparency = 1}):Play()
    
    for _, child in pairs(MainFrame:GetDescendants()) do
        if child:IsA("GuiObject") then
            if child:IsA("TextLabel") or child:IsA("TextButton") then
                TweenService:Create(child, fadeInfo, {TextTransparency = 1}):Play()
            end
            if child:IsA("Frame") or child:IsA("ImageLabel") then
                TweenService:Create(child, fadeInfo, {BackgroundTransparency = 1}):Play()
            end
        end
    end
    
    wait(0.4)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl'i%20Universal%20Project%20Thai%20.lua", true))()
    ScreenGui:Destroy()
end)

MobileButton.MouseButton1Click:Connect(function()
    local fadeInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    TweenService:Create(MainFrame, fadeInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(Shadow, fadeInfo, {ImageTransparency = 1}):Play()
    
    for _, child in pairs(MainFrame:GetDescendants()) do
        if child:IsA("GuiObject") then
            if child:IsA("TextLabel") or child:IsA("TextButton") then
                TweenService:Create(child, fadeInfo, {TextTransparency = 1}):Play()
            end
            if child:IsA("Frame") or child:IsA("ImageLabel") then
                TweenService:Create(child, fadeInfo, {BackgroundTransparency = 1}):Play()
            end
        end
    end
    
    wait(0.4)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl%20Universal%20Project%20Mobile.lua", true))()
    ScreenGui:Destroy()
end)

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 44, 0, 44), Position = UDim2.new(1, -52, 0, 13)}):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 40, 0, 40), Position = UDim2.new(1, -50, 0, 15)}):Play()
end)

CloseButton.MouseButton1Click:Connect(function()
    local fadeInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    TweenService:Create(MainFrame, fadeInfo, {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
    TweenService:Create(Shadow, fadeInfo, {ImageTransparency = 1}):Play()
    
    wait(0.3)
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

MainFrame.Position = UDim2.new(0.5, -175, 0.5, -250)
TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
TweenService:Create(Shadow, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.5}):Play()

wait(0.2)
TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -175, 0.5, -210)}):Play()
