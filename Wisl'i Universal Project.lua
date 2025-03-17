local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptSelectorUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 400)
Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "Script Selector"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.TextStrokeTransparency = 0.8
Title.Parent = Frame

local function runScript(scriptUrl)
    ScreenGui:Destroy()
    loadstring(game:HttpGet(scriptUrl, true))()
end

local OldButton = Instance.new("TextButton")
OldButton.Size = UDim2.new(0, 260, 0, 60)
OldButton.Position = UDim2.new(0.5, -130, 0, 100)
OldButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
OldButton.Text = "Old Version Wisl"
OldButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OldButton.TextSize = 20
OldButton.Font = Enum.Font.Gotham
OldButton.Parent = Frame

local OldButtonCorner = Instance.new("UICorner")
OldButtonCorner.CornerRadius = UDim.new(0, 8)
OldButtonCorner.Parent = OldButton

OldButton.MouseEnter:Connect(function()
    OldButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end)
OldButton.MouseLeave:Connect(function()
    OldButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)

OldButton.MouseButton1Click:Connect(function()
    runScript("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl%20Universal%20Project%20OLD.lua")
end)

local NewButton = Instance.new("TextButton")
NewButton.Size = UDim2.new(0, 260, 0, 60)
NewButton.Position = UDim2.new(0.5, -130, 0, 180)
NewButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
NewButton.Text = "New Version"
NewButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NewButton.TextSize = 20
NewButton.Font = Enum.Font.Gotham
NewButton.Parent = Frame

local NewButtonCorner = Instance.new("UICorner")
NewButtonCorner.CornerRadius = UDim.new(0, 8)
NewButtonCorner.Parent = NewButton

NewButton.MouseEnter:Connect(function()
    NewButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end)
NewButton.MouseLeave:Connect(function()
    NewButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)

NewButton.MouseButton1Click:Connect(function()
    runScript("https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/refs/heads/main/Wisl'i%20Universal%20Project%20new%20UI.lua")
end)

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -50, 0, 10)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = Frame

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 8)
CloseButtonCorner.Parent = CloseButton

CloseButton.MouseEnter:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
end)
CloseButton.MouseLeave:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local dragging
local dragInput
local dragStart
local startPos

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)
