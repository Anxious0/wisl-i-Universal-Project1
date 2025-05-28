-- Fluent UI Library for Roblox
-- Beautiful, stable, and feature-rich UI library with modern design

local FluentUI = {}
FluentUI.__index = FluentUI

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Theme Configuration
local Theme = {
    Background = Color3.fromRGB(32, 32, 32),
    Surface = Color3.fromRGB(45, 45, 45),
    Primary = Color3.fromRGB(96, 165, 250),
    Secondary = Color3.fromRGB(156, 163, 175),
    Text = Color3.fromRGB(243, 244, 246),
    TextSecondary = Color3.fromRGB(156, 163, 175),
    Success = Color3.fromRGB(34, 197, 94),
    Warning = Color3.fromRGB(251, 191, 36),
    Error = Color3.fromRGB(239, 68, 68),
    Border = Color3.fromRGB(75, 85, 99),
    Hover = Color3.fromRGB(55, 65, 81),
    Active = Color3.fromRGB(17, 24, 39)
}

-- Animation Settings
local AnimationInfo = TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
local QuickAnimationInfo = TweenInfo.new(0.15, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)

-- Utility Functions
local function CreateCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 8)
    corner.Parent = parent
    return corner
end

local function CreateStroke(parent, color, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Theme.Border
    stroke.Thickness = thickness or 1
    stroke.Parent = parent
    return stroke
end

local function CreateGradient(parent, color1, color2, rotation)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, color1),
        ColorSequenceKeypoint.new(1, color2)
    })
    gradient.Rotation = rotation or 0
    gradient.Parent = parent
    return gradient
end

local function CreateShadow(parent)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.8
    shadow.Size = UDim2.new(1, 10, 1, 10)
    shadow.Position = UDim2.new(0, -5, 0, -5)
    shadow.ZIndex = parent.ZIndex - 1
    shadow.Parent = parent.Parent
    CreateCorner(shadow, 10)
    return shadow
end

-- Main Window Class
function FluentUI:CreateWindow(config)
    config = config or {}
    
    local Window = {
        Title = config.Title or "Fluent UI",
        Size = config.Size or UDim2.new(0, 600, 0, 400),
        Position = config.Position or UDim2.new(0.5, -300, 0.5, -200),
        Tabs = {},
        CurrentTab = nil,
        Minimized = false,
        Dragging = false
    }
    
    -- Create ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FluentUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = PlayerGui
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = Window.Size
    MainFrame.Position = Window.Position
    MainFrame.BackgroundColor3 = Theme.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    CreateCorner(MainFrame, 12)
    CreateStroke(MainFrame, Theme.Border, 1)
    CreateShadow(MainFrame)
    
    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 50)
    TitleBar.Position = UDim2.new(0, 0, 0, 0)
    TitleBar.BackgroundColor3 = Theme.Surface
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    CreateCorner(TitleBar, 12)
    
    -- Title Bar Bottom Border
    local TitleBorder = Instance.new("Frame")
    TitleBorder.Name = "Border"
    TitleBorder.Size = UDim2.new(1, -20, 0, 1)
    TitleBorder.Position = UDim2.new(0, 10, 1, -1)
    TitleBorder.BackgroundColor3 = Theme.Border
    TitleBorder.BorderSizePixel = 0
    TitleBorder.Parent = TitleBar
    
    -- Title Text
    local TitleText = Instance.new("TextLabel")
    TitleText.Name = "Title"
    TitleText.Size = UDim2.new(1, -100, 1, 0)
    TitleText.Position = UDim2.new(0, 20, 0, 0)
    TitleText.BackgroundTransparency = 1
    TitleText.Text = Window.Title
    TitleText.TextColor3 = Theme.Text
    TitleText.TextScaled = true
    TitleText.TextXAlignment = Enum.TextXAlignment.Left
    TitleText.Font = Enum.Font.GothamBold
    TitleText.Parent = TitleBar
    
    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -40, 0, 10)
    CloseButton.BackgroundColor3 = Theme.Error
    CloseButton.BorderSizePixel = 0
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.white()
    CloseButton.TextScaled = true
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = TitleBar
    CreateCorner(CloseButton, 6)
    
    -- Minimize Button
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Position = UDim2.new(1, -80, 0, 10)
    MinimizeButton.BackgroundColor3 = Theme.Warning
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Color3.white()
    MinimizeButton.TextScaled = true
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Parent = TitleBar
    CreateCorner(MinimizeButton, 6)
    
    -- Tab Container
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(0, 200, 1, -50)
    TabContainer.Position = UDim2.new(0, 0, 0, 50)
    TabContainer.BackgroundColor3 = Theme.Surface
    TabContainer.BorderSizePixel = 0
    TabContainer.Parent = MainFrame
    
    local TabList = Instance.new("ScrollingFrame")
    TabList.Name = "TabList"
    TabList.Size = UDim2.new(1, -10, 1, -10)
    TabList.Position = UDim2.new(0, 5, 0, 5)
    TabList.BackgroundTransparency = 1
    TabList.BorderSizePixel = 0
    TabList.ScrollBarThickness = 4
    TabList.ScrollBarImageColor3 = Theme.Primary
    TabList.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabList.Parent = TabContainer
    
    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)
    TabListLayout.Parent = TabList
    
    -- Content Area
    local ContentArea = Instance.new("Frame")
    ContentArea.Name = "ContentArea"
    ContentArea.Size = UDim2.new(1, -210, 1, -60)
    ContentArea.Position = UDim2.new(0, 205, 0, 55)
    ContentArea.BackgroundTransparency = 1
    ContentArea.BorderSizePixel = 0
    ContentArea.Parent = MainFrame
    
    -- Window Methods
    function Window:CreateTab(config)
        config = config or {}
        
        local Tab = {
            Name = config.Name or "Tab",
            Icon = config.Icon or "🏠",
            Active = false,
            Elements = {}
        }
        
        -- Tab Button
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "TabButton"
        TabButton.Size = UDim2.new(1, 0, 0, 45)
        TabButton.BackgroundColor3 = Theme.Background
        TabButton.BorderSizePixel = 0
        TabButton.Text = ""
        TabButton.Parent = TabList
        CreateCorner(TabButton, 8)
        
        -- Tab Icon
        local TabIcon = Instance.new("TextLabel")
        TabIcon.Name = "Icon"
        TabIcon.Size = UDim2.new(0, 30, 0, 30)
        TabIcon.Position = UDim2.new(0, 10, 0.5, -15)
        TabIcon.BackgroundTransparency = 1
        TabIcon.Text = Tab.Icon
        TabIcon.TextColor3 = Theme.TextSecondary
        TabIcon.TextScaled = true
        TabIcon.Font = Enum.Font.Gotham
        TabIcon.Parent = TabButton
        
        -- Tab Label
        local TabLabel = Instance.new("TextLabel")
        TabLabel.Name = "Label"
        TabLabel.Size = UDim2.new(1, -50, 1, 0)
        TabLabel.Position = UDim2.new(0, 50, 0, 0)
        TabLabel.BackgroundTransparency = 1
        TabLabel.Text = Tab.Name
        TabLabel.TextColor3 = Theme.TextSecondary
        TabLabel.TextScaled = true
        TabLabel.TextXAlignment = Enum.TextXAlignment.Left
        TabLabel.Font = Enum.Font.Gotham
        TabLabel.Parent = TabButton
        
        -- Tab Content
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = "TabContent"
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.Position = UDim2.new(0, 0, 0, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.ScrollBarThickness = 6
        TabContent.ScrollBarImageColor3 = Theme.Primary
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabContent.Visible = false
        TabContent.Parent = ContentArea
        
        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContentLayout.Padding = UDim.new(0, 10)
        ContentLayout.Parent = TabContent
        
        local ContentPadding = Instance.new("UIPadding")
        ContentPadding.PaddingTop = UDim.new(0, 10)
        ContentPadding.PaddingBottom = UDim.new(0, 10)
        ContentPadding.PaddingLeft = UDim.new(0, 10)
        ContentPadding.PaddingRight = UDim.new(0, 10)
        ContentPadding.Parent = TabContent
        
        -- Tab Functions
        function Tab:Activate()
            -- Deactivate other tabs
            for _, tab in pairs(Window.Tabs) do
                tab:Deactivate()
            end
            
            -- Activate this tab
            self.Active = true
            Window.CurrentTab = self
            TabContent.Visible = true
            
            -- Animate button
            TweenService:Create(TabButton, AnimationInfo, {BackgroundColor3 = Theme.Primary}):Play()
            TweenService:Create(TabIcon, AnimationInfo, {TextColor3 = Color3.white()}):Play()
            TweenService:Create(TabLabel, AnimationInfo, {TextColor3 = Color3.white()}):Play()
        end
        
        function Tab:Deactivate()
            self.Active = false
            TabContent.Visible = false
            
            -- Animate button
            TweenService:Create(TabButton, AnimationInfo, {BackgroundColor3 = Theme.Background}):Play()
            TweenService:Create(TabIcon, AnimationInfo, {TextColor3 = Theme.TextSecondary}):Play()
            TweenService:Create(TabLabel, AnimationInfo, {TextColor3 = Theme.TextSecondary}):Play()
        end
        
        -- Tab Elements
        function Tab:CreateButton(config)
            config = config or {}
            
            local Button = Instance.new("TextButton")
            Button.Name = "Button"
            Button.Size = UDim2.new(1, 0, 0, 40)
            Button.BackgroundColor3 = Theme.Surface
            Button.BorderSizePixel = 0
            Button.Text = config.Text or "Button"
            Button.TextColor3 = Theme.Text
            Button.TextScaled = true
            Button.Font = Enum.Font.Gotham
            Button.Parent = TabContent
            CreateCorner(Button, 8)
            
            -- Button animations
            Button.MouseEnter:Connect(function()
                TweenService:Create(Button, QuickAnimationInfo, {BackgroundColor3 = Theme.Hover}):Play()
            end)
            
            Button.MouseLeave:Connect(function()
                TweenService:Create(Button, QuickAnimationInfo, {BackgroundColor3 = Theme.Surface}):Play()
            end)
            
            Button.MouseButton1Down:Connect(function()
                TweenService:Create(Button, QuickAnimationInfo, {BackgroundColor3 = Theme.Active}):Play()
            end)
            
            Button.MouseButton1Up:Connect(function()
                TweenService:Create(Button, QuickAnimationInfo, {BackgroundColor3 = Theme.Hover}):Play()
            end)
            
            if config.Callback then
                Button.MouseButton1Click:Connect(config.Callback)
            end
            
            return Button
        end
        
        function Tab:CreateToggle(config)
            config = config or {}
            
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Name = "ToggleFrame"
            ToggleFrame.Size = UDim2.new(1, 0, 0, 40)
            ToggleFrame.BackgroundColor3 = Theme.Surface
            ToggleFrame.BorderSizePixel = 0
            ToggleFrame.Parent = TabContent
            CreateCorner(ToggleFrame, 8)
            
            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Name = "Label"
            ToggleLabel.Size = UDim2.new(1, -60, 1, 0)
            ToggleLabel.Position = UDim2.new(0, 15, 0, 0)
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Text = config.Text or "Toggle"
            ToggleLabel.TextColor3 = Theme.Text
            ToggleLabel.TextScaled = true
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Parent = ToggleFrame
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Name = "Toggle"
            ToggleButton.Size = UDim2.new(0, 40, 0, 20)
            ToggleButton.Position = UDim2.new(1, -50, 0.5, -10)
            ToggleButton.BackgroundColor3 = Theme.Border
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Text = ""
            ToggleButton.Parent = ToggleFrame
            CreateCorner(ToggleButton, 10)
            
            local ToggleCircle = Instance.new("Frame")
            ToggleCircle.Name = "Circle"
            ToggleCircle.Size = UDim2.new(0, 16, 0, 16)
            ToggleCircle.Position = UDim2.new(0, 2, 0, 2)
            ToggleCircle.BackgroundColor3 = Color3.white()
            ToggleCircle.BorderSizePixel = 0
            ToggleCircle.Parent = ToggleButton
            CreateCorner(ToggleCircle, 8)
            
            local toggled = config.Default or false
            
            local function UpdateToggle()
                if toggled then
                    TweenService:Create(ToggleButton, AnimationInfo, {BackgroundColor3 = Theme.Primary}):Play()
                    TweenService:Create(ToggleCircle, AnimationInfo, {Position = UDim2.new(1, -18, 0, 2)}):Play()
                else
                    TweenService:Create(ToggleButton, AnimationInfo, {BackgroundColor3 = Theme.Border}):Play()
                    TweenService:Create(ToggleCircle, AnimationInfo, {Position = UDim2.new(0, 2, 0, 2)}):Play()
                end
                
                if config.Callback then
                    config.Callback(toggled)
                end
            end
            
            ToggleButton.MouseButton1Click:Connect(function()
                toggled = not toggled
                UpdateToggle()
            end)
            
            UpdateToggle()
            
            return ToggleFrame
        end
        
        function Tab:CreateSlider(config)
            config = config or {}
            
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Name = "SliderFrame"
            SliderFrame.Size = UDim2.new(1, 0, 0, 60)
            SliderFrame.BackgroundColor3 = Theme.Surface
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Parent = TabContent
            CreateCorner(SliderFrame, 8)
            
            local SliderLabel = Instance.new("TextLabel")
            SliderLabel.Name = "Label"
            SliderLabel.Size = UDim2.new(1, -80, 0, 25)
            SliderLabel.Position = UDim2.new(0, 15, 0, 5)
            SliderLabel.BackgroundTransparency = 1
            SliderLabel.Text = config.Text or "Slider"
            SliderLabel.TextColor3 = Theme.Text
            SliderLabel.TextScaled = true
            SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            SliderLabel.Font = Enum.Font.Gotham
            SliderLabel.Parent = SliderFrame
            
            local ValueLabel = Instance.new("TextLabel")
            ValueLabel.Name = "Value"
            ValueLabel.Size = UDim2.new(0, 70, 0, 25)
            ValueLabel.Position = UDim2.new(1, -75, 0, 5)
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.Text = tostring(config.Default or config.Min or 0)
            ValueLabel.TextColor3 = Theme.Primary
            ValueLabel.TextScaled = true
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
            ValueLabel.Font = Enum.Font.GothamBold
            ValueLabel.Parent = SliderFrame
            
            local SliderTrack = Instance.new("Frame")
            SliderTrack.Name = "Track"
            SliderTrack.Size = UDim2.new(1, -30, 0, 6)
            SliderTrack.Position = UDim2.new(0, 15, 1, -25)
            SliderTrack.BackgroundColor3 = Theme.Border
            SliderTrack.BorderSizePixel = 0
            SliderTrack.Parent = SliderFrame
            CreateCorner(SliderTrack, 3)
            
            local SliderFill = Instance.new("Frame")
            SliderFill.Name = "Fill"
            SliderFill.Size = UDim2.new(0, 0, 1, 0)
            SliderFill.Position = UDim2.new(0, 0, 0, 0)
            SliderFill.BackgroundColor3 = Theme.Primary
            SliderFill.BorderSizePixel = 0
            SliderFill.Parent = SliderTrack
            CreateCorner(SliderFill, 3)
            
            local SliderHandle = Instance.new("Frame")
            SliderHandle.Name = "Handle"
            SliderHandle.Size = UDim2.new(0, 16, 0, 16)
            SliderHandle.Position = UDim2.new(0, -8, 0.5, -8)
            SliderHandle.BackgroundColor3 = Color3.white()
            SliderHandle.BorderSizePixel = 0
            SliderHandle.Parent = SliderTrack
            CreateCorner(SliderHandle, 8)
            CreateStroke(SliderHandle, Theme.Primary, 2)
            
            local min = config.Min or 0
            local max = config.Max or 100
            local value = config.Default or min
            local dragging = false
            
            local function UpdateSlider()
                local percentage = (value - min) / (max - min)
                TweenService:Create(SliderFill, QuickAnimationInfo, {Size = UDim2.new(percentage, 0, 1, 0)}):Play()
                TweenService:Create(SliderHandle, QuickAnimationInfo, {Position = UDim2.new(percentage, -8, 0.5, -8)}):Play()
                ValueLabel.Text = tostring(math.floor(value + 0.5))
                
                if config.Callback then
                    config.Callback(value)
                end
            end
            
            SliderTrack.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local mousePos = input.Position
                    local trackPos = SliderTrack.AbsolutePosition
                    local trackSize = SliderTrack.AbsoluteSize
                    
                    local percentage = math.clamp((mousePos.X - trackPos.X) / trackSize.X, 0, 1)
                    value = min + (max - min) * percentage
                    
                    UpdateSlider()
                end
            end)
            
            UpdateSlider()
            
            return SliderFrame
        end
        
        function Tab:CreateTextBox(config)
            config = config or {}
            
            local TextBoxFrame = Instance.new("Frame")
            TextBoxFrame.Name = "TextBoxFrame"
            TextBoxFrame.Size = UDim2.new(1, 0, 0, 40)
            TextBoxFrame.BackgroundColor3 = Theme.Surface
            TextBoxFrame.BorderSizePixel = 0
            TextBoxFrame.Parent = TabContent
            CreateCorner(TextBoxFrame, 8)
            
            local TextBox = Instance.new("TextBox")
            TextBox.Name = "TextBox"
            TextBox.Size = UDim2.new(1, -20, 1, -10)
            TextBox.Position = UDim2.new(0, 10, 0, 5)
            TextBox.BackgroundTransparency = 1
            TextBox.Text = config.PlaceholderText or "Enter text..."
            TextBox.TextColor3 = Theme.Text
            TextBox.TextScaled = true
            TextBox.TextXAlignment = Enum.TextXAlignment.Left
            TextBox.Font = Enum.Font.Gotham
            TextBox.ClearTextOnFocus = true
            TextBox.Parent = TextBoxFrame
            
            if config.Callback then
                TextBox.FocusLost:Connect(function()
                    config.Callback(TextBox.Text)
                end)
            end
            
            return TextBoxFrame
        end
        
        function Tab:CreateLabel(config)
            config = config or {}
            
            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Size = UDim2.new(1, 0, 0, 30)
            Label.BackgroundTransparency = 1
            Label.Text = config.Text or "Label"
            Label.TextColor3 = Theme.Text
            Label.TextScaled = true
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Font = Enum.Font.Gotham
            Label.Parent = TabContent
            
            return Label
        end
        
        -- Update canvas size
        ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 20)
        end)
        
        -- Tab button click
        TabButton.MouseButton1Click:Connect(function()
            Tab:Activate()
        end)
        
        -- Add to window
        table.insert(Window.Tabs, Tab)
        
        -- Activate first tab
        if #Window.Tabs == 1 then
            Tab:Activate()
        end
        
        -- Update tab list canvas size
        TabListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabList.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y + 10)
        end)
        
        return Tab
    end
    
    -- Window dragging
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- Close button
    CloseButton.MouseButton1Click:Connect(function()
        TweenService:Create(MainFrame, AnimationInfo, {Position = UDim2.new(0.5, -300, -1, 0)}):Play()
        wait(0.3)
        ScreenGui:Destroy()
    end)
    
    -- Minimize button
    MinimizeButton.MouseButton1Click:Connect(function()
        Window.Minimized = not Window.Minimized
        if Window.Minimized then
            TweenService:Create(MainFrame, AnimationInfo, {Size = UDim2.new(0, 600, 0, 50)}):Play()
            MinimizeButton.Text = "+"
        else
            TweenService:Create(MainFrame, AnimationInfo, {Size = Window.Size}):Play()
            MinimizeButton.Text = "-"
        end
    end)
    
    -- Button hover effects
    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseButton, QuickAnimationInfo, {BackgroundColor3 = Color3.fromRGB(220, 53, 69)}):Play()
    end)
    
    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseButton, QuickAnimationInfo, {BackgroundColor3 = Theme.Error}):Play()
    end)
    
    MinimizeButton.MouseEnter:Connect(function()
        TweenService:Create(MinimizeButton, QuickAnimationInfo, {BackgroundColor3 = Color3.fromRGB(255, 193, 7)}):Play()
    end)
    
    MinimizeButton.MouseLeave:Connect(function()
        TweenService:Create(MinimizeButton, QuickAnimationInfo, {BackgroundColor3 = Theme.Warning}):Play()
    end)
    
    return Window
end

return FluentUI
