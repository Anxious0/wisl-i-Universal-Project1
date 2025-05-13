local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptSelectorUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 300)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.BackgroundTransparency = 1

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 20) 
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(60, 60, 80)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.5
UIStroke.Parent = MainFrame

local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(1, 50, 1, 50) 
Shadow.ZIndex = 0
Shadow.Image = "rbxassetid://6014261993"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.7 
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
Shadow.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 20) 
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "✨ WISL Script Selector ✨"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 36, 0, 36)
CloseButton.Position = UDim2.new(1, -43, 0, 7)
CloseButton.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18
CloseButton.Font = Enum.Font.GothamBold
CloseButton.AutoButtonColor = false
CloseButton.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -30, 1, -70)
ContentFrame.Position = UDim2.new(0, 15, 0, 60)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "VersionLabel"
VersionLabel.Size = UDim2.new(1, 0, 0, 20)
VersionLabel.Position = UDim2.new(0, 0, 1, -25)
VersionLabel.BackgroundTransparency = 1
VersionLabel.Text = "v1.1.5"
VersionLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
VersionLabel.TextSize = 14
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.TextXAlignment = Enum.TextXAlignment.Center
VersionLabel.Parent = MainFrame

local function createStylishButton(name, position, color, icon)
    local ButtonContainer = Instance.new("Frame")
    ButtonContainer.Name = name.."Container"
    ButtonContainer.Size = UDim2.new(1, 0, 0, 60)
    ButtonContainer.Position = position
    ButtonContainer.BackgroundTransparency = 1
    ButtonContainer.Parent = ContentFrame
    
    local Button = Instance.new("TextButton")
    Button.Name = name.."Button"
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.BackgroundColor3 = color
    Button.BackgroundTransparency = 0.2
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = ButtonContainer
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    ButtonCorner.Parent = Button
    
    local ButtonShadow = Instance.new("ImageLabel")
    ButtonShadow.Name = "Shadow"
    ButtonShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    ButtonShadow.BackgroundTransparency = 1
    ButtonShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    ButtonShadow.Size = UDim2.new(1, 10, 1, 10)
    ButtonShadow.ZIndex = 0
    ButtonShadow.Image = "rbxassetid://6014261993"
    ButtonShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    ButtonShadow.ImageTransparency = 0.8
    ButtonShadow.ScaleType = Enum.ScaleType.Slice
    ButtonShadow.SliceCenter = Rect.new(49, 49, 450, 450)
    ButtonShadow.Parent = Button
    
    local Icon = Instance.new("TextLabel")
    Icon.Name = "Icon"
    Icon.Size = UDim2.new(0, 30, 0, 30)
    Icon.Position = UDim2.new(0, 15, 0.5, -15)
    Icon.BackgroundTransparency = 1
    Icon.Text = icon
    Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
    Icon.TextSize = 24
    Icon.Font = Enum.Font.GothamBold
    Icon.Parent = Button
    
    local Text = Instance.new("TextLabel")
    Text.Name = "Text"
    Text.Size = UDim2.new(1, -60, 1, 0)
    Text.Position = UDim2.new(0, 55, 0, 0)
    Text.BackgroundTransparency = 1
    Text.Text = name
    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text.TextSize = 18
    Text.Font = Enum.Font.GothamSemibold
    Text.TextXAlignment = Enum.TextXAlignment.Left
    Text.Parent = Button
    
    local Shine = Instance.new("Frame")
    Shine.Name = "Shine"
    Shine.Size = UDim2.new(0, 0, 1, 0)
    Shine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Shine.BackgroundTransparency = 0.9
    Shine.BorderSizePixel = 0
    Shine.Parent = Button
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
        TweenService:Create(Text, TweenInfo.new(0.2), {TextSize = 19}):Play()
        
        Shine.Size = UDim2.new(0, 0, 1, 0)
        Shine.BackgroundTransparency = 0.7
        TweenService:Create(Shine, TweenInfo.new(0.5), {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 0.9}):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundTransparency = 0.2}):Play()
        TweenService:Create(Text, TweenInfo.new(0.2), {TextSize = 18}):Play()
    end)
    
    Button.MouseButton1Down:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.1), {Size = UDim2.new(0.98, 0, 0.95, 0), Position = UDim2.new(0.01, 0, 0.025, 0)}):Play()
    end)
    
    Button.MouseButton1Up:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0)}):Play()
    end)
    
    return Button
end

local NewButton = createStylishButton("Wisl Uni VERSION Release", UDim2.new(0, 0, 0, 0), Color3.fromRGB(80, 180, 80), "✨")
local MobileButton = createStylishButton("Mobile VERSION", UDim2.new(0, 0, 0, 70), Color3.fromRGB(100, 180, 200), "📱")
local ThaiButton = createStylishButton("THAI VERSION", UDim2.new(0, 0, 0, 140), Color3.fromRGB(80, 180, 180), "🇹🇭")

NewButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Shadow, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
    wait(0.3)
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl'i%20Universal%20Project%20new%20UI.lua", true))()
    ScreenGui:Destroy()
end)

MobileButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Shadow, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
    wait(0.3)
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl'i%20Universal%20Project%20Mobile.lua", true))()
    ScreenGui:Destroy()
end)

ThaiButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Shadow, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
    wait(0.3)
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl'i%20Universal%20Project%20Thai%20.lua", true))()
    ScreenGui:Destroy()
end)

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 80, 80)}):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(220, 60, 60)}):Play()
end)

CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Shadow, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
    wait(0.3)
    ScreenGui:Destroy()
end)

local dragging = false
local dragInput
local dragStart
local startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    TweenService:Create(MainFrame, TweenInfo.new(0.1), {
        Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    }):Play()
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

wait(0.1) 
TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
TweenService:Create(Shadow, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.5}):Play()

MainFrame.Position = UDim2.new(0.5, -160, 0.5, -200)
wait(0.1)
TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -160, 0.5, -150)}):Play()
