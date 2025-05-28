-- Fluent UI Style Interface for Roblox
-- By [Your Name]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create main screen GUI
local fluentUI = Instance.new("ScreenGui")
fluentUI.Name = "FluentUI"
fluentUI.ResetOnSpawn = false
fluentUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
mainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
mainFrame.AnchorPoint = Vector2.new(0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true

-- Add smooth corner
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- Add shadow effect
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.new(0, 0, 0)
shadow.ImageTransparency = 0.8
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Size = UDim2.new(1, 20, 1, 20)
shadow.Position = UDim2.new(0, -10, 0, -10)
shadow.BackgroundTransparency = 1
shadow.Parent = mainFrame
shadow.ZIndex = -1

-- Navigation panel
local navPanel = Instance.new("Frame")
navPanel.Name = "NavigationPanel"
navPanel.Size = UDim2.new(0.2, 0, 1, 0)
navPanel.Position = UDim2.new(0, 0, 0, 0)
navPanel.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
navPanel.BorderSizePixel = 0
navPanel.Parent = mainFrame

-- Add corner to nav panel (only right corners)
local navCorner = Instance.new("UICorner")
navCorner.CornerRadius = UDim.new(0, 8)
navCorner.Parent = navPanel

-- App title
local appTitle = Instance.new("TextLabel")
appTitle.Name = "AppTitle"
appTitle.Size = UDim2.new(1, 0, 0.1, 0)
appTitle.Position = UDim2.new(0, 0, 0, 0)
appTitle.BackgroundTransparency = 1
appTitle.Text = "Fluent UI App"
appTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
appTitle.TextSize = 24
appTitle.Font = Enum.Font.SourceSansSemibold
appTitle.Parent = navPanel

-- Tab buttons container
local tabButtons = Instance.new("ScrollingFrame")
tabButtons.Name = "TabButtons"
tabButtons.Size = UDim2.new(1, 0, 0.8, 0)
tabButtons.Position = UDim2.new(0, 0, 0.1, 0)
tabButtons.BackgroundTransparency = 1
tabButtons.ScrollBarThickness = 0
tabButtons.CanvasSize = UDim2.new(0, 0, 0, 0)
tabButtons.AutomaticCanvasSize = Enum.AutomaticSize.Y
tabButtons.Parent = navPanel

local tabListLayout = Instance.new("UIListLayout")
tabListLayout.Padding = UDim.new(0, 5)
tabListLayout.Parent = tabButtons

-- Content frame
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(0.8, 0, 1, 0)
contentFrame.Position = UDim2.new(0.2, 0, 0, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
contentFrame.BackgroundTransparency = 0.1
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

-- Add corner to content frame (only left corners)
local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 8)
contentCorner.Parent = contentFrame

-- Sample tabs data
local tabs = {
    {
        Name = "Home",
        Icon = "rbxassetid://3926305904",
        Content = function()
            local homeContent = Instance.new("Frame")
            homeContent.BackgroundTransparency = 1
            homeContent.Size = UDim2.new(1, 0, 1, 0)
            
            local welcomeLabel = Instance.new("TextLabel")
            welcomeLabel.Text = "Welcome to Fluent UI"
            welcomeLabel.TextSize = 28
            welcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            welcomeLabel.Font = Enum.Font.SourceSansSemibold
            welcomeLabel.Size = UDim2.new(1, 0, 0.2, 0)
            welcomeLabel.Position = UDim2.new(0, 0, 0.1, 0)
            welcomeLabel.BackgroundTransparency = 1
            welcomeLabel.Parent = homeContent
            
            return homeContent
        end
    },
    {
        Name = "Settings",
        Icon = "rbxassetid://3926307971",
        Content = function()
            local settingsContent = Instance.new("Frame")
            settingsContent.BackgroundTransparency = 1
            settingsContent.Size = UDim2.new(1, 0, 1, 0)
            
            local settingsLabel = Instance.new("TextLabel")
            settingsLabel.Text = "Settings"
            settingsLabel.TextSize = 28
            settingsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            settingsLabel.Font = Enum.Font.SourceSansSemibold
            settingsLabel.Size = UDim2.new(1, 0, 0.2, 0)
            settingsLabel.Position = UDim2.new(0, 0, 0.1, 0)
            settingsLabel.BackgroundTransparency = 1
            settingsLabel.Parent = settingsContent
            
            -- Sample toggle switch
            local toggleFrame = Instance.new("Frame")
            toggleFrame.Size = UDim2.new(0.8, 0, 0.1, 0)
            toggleFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
            toggleFrame.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
            toggleFrame.BackgroundTransparency = 0.5
            toggleFrame.Parent = settingsContent
            
            local toggleCorner = Instance.new("UICorner")
            toggleCorner.CornerRadius = UDim.new(0.5, 0)
            toggleCorner.Parent = toggleFrame
            
            local toggleLabel = Instance.new("TextLabel")
            toggleLabel.Text = "Enable Feature"
            toggleLabel.TextSize = 18
            toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggleLabel.Font = Enum.Font.SourceSans
            toggleLabel.Size = UDim2.new(0.6, 0, 1, 0)
            toggleLabel.Position = UDim2.new(0, 10, 0, 0)
            toggleLabel.BackgroundTransparency = 1
            toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            toggleLabel.Parent = toggleFrame
            
            local toggleButton = Instance.new("TextButton")
            toggleButton.Size = UDim2.new(0.2, 0, 0.8, 0)
            toggleButton.Position = UDim2.new(0.8, -10, 0.1, 0)
            toggleButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
            toggleButton.Text = ""
            toggleButton.Parent = toggleFrame
            
            local toggleButtonCorner = Instance.new("UICorner")
            toggleButtonCorner.CornerRadius = UDim.new(0.5, 0)
            toggleButtonCorner.Parent = toggleButton
            
            local isToggled = false
            toggleButton.MouseButton1Click:Connect(function()
                isToggled = not isToggled
                local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                local tween
                
                if isToggled then
                    tween = TweenService:Create(toggleButton, tweenInfo, {
                        Position = UDim2.new(0.8, -10, 0.1, 0),
                        BackgroundColor3 = Color3.fromRGB(0, 120, 215)
                    })
                else
                    tween = TweenService:Create(toggleButton, tweenInfo, {
                        Position = UDim2.new(0.6, -10, 0.1, 0),
                        BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                    })
                end
                
                tween:Play()
            end)
            
            return settingsContent
        end
    },
    {
        Name = "Profile",
        Icon = "rbxassetid://3926307971",
        Content = function()
            local profileContent = Instance.new("Frame")
            profileContent.BackgroundTransparency = 1
            profileContent.Size = UDim2.new(1, 0, 1, 0)
            
            local profileLabel = Instance.new("TextLabel")
            profileLabel.Text = "User Profile"
            profileLabel.TextSize = 28
            profileLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            profileLabel.Font = Enum.Font.SourceSansSemibold
            profileLabel.Size = UDim2.new(1, 0, 0.2, 0)
            profileLabel.Position = UDim2.new(0, 0, 0.1, 0)
            profileLabel.BackgroundTransparency = 1
            profileLabel.Parent = profileContent
            
            -- Sample profile card
            local profileCard = Instance.new("Frame")
            profileCard.Size = UDim2.new(0.8, 0, 0.4, 0)
            profileCard.Position = UDim2.new(0.1, 0, 0.3, 0)
            profileCard.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
            profileCard.BackgroundTransparency = 0.5
            profileCard.Parent = profileContent
            
            local profileCardCorner = Instance.new("UICorner")
            profileCardCorner.CornerRadius = UDim.new(0.1, 0)
            profileCardCorner.Parent = profileCard
            
            local avatar = Instance.new("ImageLabel")
            avatar.Size = UDim2.new(0.3, 0, 0.8, 0)
            avatar.Position = UDim2.new(0.05, 0, 0.1, 0)
            avatar.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            avatar.Image = "rbxassetid://3926305904" -- Default Roblox icon
            avatar.Parent = profileCard
            
            local avatarCorner = Instance.new("UICorner")
            avatarCorner.CornerRadius = UDim.new(0.5, 0)
            avatarCorner.Parent = avatar
            
            local usernameLabel = Instance.new("TextLabel")
            usernameLabel.Text = player.Name
            usernameLabel.TextSize = 20
            usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            usernameLabel.Font = Enum.Font.SourceSansSemibold
            usernameLabel.Size = UDim2.new(0.6, 0, 0.2, 0)
            usernameLabel.Position = UDim2.new(0.4, 0, 0.2, 0)
            usernameLabel.BackgroundTransparency = 1
            usernameLabel.TextXAlignment = Enum.TextXAlignment.Left
            usernameLabel.Parent = profileCard
            
            local joinDateLabel = Instance.new("TextLabel")
            joinDateLabel.Text = "Joined: " .. os.date("%Y-%m-%d")
            joinDateLabel.TextSize = 16
            joinDateLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            joinDateLabel.Font = Enum.Font.SourceSans
            joinDateLabel.Size = UDim2.new(0.6, 0, 0.2, 0)
            joinDateLabel.Position = UDim2.new(0.4, 0, 0.4, 0)
            joinDateLabel.BackgroundTransparency = 1
            joinDateLabel.TextXAlignment = Enum.TextXAlignment.Left
            joinDateLabel.Parent = profileCard
            
            return profileContent
        end
    }
}

-- Create tab buttons
local currentTab = nil
local currentContent = nil

for i, tab in ipairs(tabs) do
    local tabButton = Instance.new("TextButton")
    tabButton.Name = tab.Name .. "Tab"
    tabButton.Size = UDim2.new(1, -20, 0, 50)
    tabButton.Position = UDim2.new(0, 10, 0, (i-1)*55)
    tabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    tabButton.BackgroundTransparency = 0.5
    tabButton.Text = ""
    tabButton.AutoButtonColor = false
    tabButton.Parent = tabButtons
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 4)
    tabCorner.Parent = tabButton
    
    local tabIcon = Instance.new("ImageLabel")
    tabIcon.Name = "Icon"
    tabIcon.Size = UDim2.new(0, 24, 0, 24)
    tabIcon.Position = UDim2.new(0, 15, 0.5, -12)
    tabIcon.BackgroundTransparency = 1
    tabIcon.Image = tab.Icon
    tabIcon.ImageColor3 = Color3.fromRGB(200, 200, 200)
    tabIcon.Parent = tabButton
    
    local tabLabel = Instance.new("TextLabel")
    tabLabel.Name = "Label"
    tabLabel.Size = UDim2.new(0.7, 0, 1, 0)
    tabLabel.Position = UDim2.new(0, 50, 0, 0)
    tabLabel.BackgroundTransparency = 1
    tabLabel.Text = tab.Name
    tabLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabLabel.TextSize = 18
    tabLabel.Font = Enum.Font.SourceSansSemibold
    tabLabel.TextXAlignment = Enum.TextXAlignment.Left
    tabLabel.Parent = tabButton
    
    -- Hover effects
    tabButton.MouseEnter:Connect(function()
        if currentTab ~= tab then
            TweenService:Create(tabButton, TweenInfo.new(0.2), {
                BackgroundTransparency = 0.3
            }):Play()
            TweenService:Create(tabIcon, TweenInfo.new(0.2), {
                ImageColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
            TweenService:Create(tabLabel, TweenInfo.new(0.2), {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
        end
    end)
    
    tabButton.MouseLeave:Connect(function()
        if currentTab ~= tab then
            TweenService:Create(tabButton, TweenInfo.new(0.2), {
                BackgroundTransparency = 0.5
            }):Play()
            TweenService:Create(tabIcon, TweenInfo.new(0.2), {
                ImageColor3 = Color3.fromRGB(200, 200, 200)
            }):Play()
            TweenService:Create(tabLabel, TweenInfo.new(0.2), {
                TextColor3 = Color3.fromRGB(200, 200, 200)
            }):Play()
        end
    end)
    
    -- Click handler
    tabButton.MouseButton1Click:Connect(function()
        if currentTab == tab then return end
        
        -- Update current tab visual
        if currentTab then
            local currentButton = tabButtons:FindFirstChild(currentTab.Name .. "Tab")
            if currentButton then
                TweenService:Create(currentButton, TweenInfo.new(0.2), {
                    BackgroundTransparency = 0.5,
                    BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                }):Play()
                
                local currentIcon = currentButton:FindFirstChild("Icon")
                if currentIcon then
                    TweenService:Create(currentIcon, TweenInfo.new(0.2), {
                        ImageColor3 = Color3.fromRGB(200, 200, 200)
                    }):Play()
                end
                
                local currentLabel = currentButton:FindFirstChild("Label")
                if currentLabel then
                    TweenService:Create(currentLabel, TweenInfo.new(0.2), {
                        TextColor3 = Color3.fromRGB(200, 200, 200)
                    }):Play()
                end
            end
        end
        
        -- Set new tab as active
        currentTab = tab
        TweenService:Create(tabButton, TweenInfo.new(0.2), {
            BackgroundTransparency = 0,
            BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        }):Play()
        
        TweenService:Create(tabIcon, TweenInfo.new(0.2), {
            ImageColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
        
        TweenService:Create(tabLabel, TweenInfo.new(0.2), {
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
        
        -- Update content
        if currentContent then
            currentContent:Destroy()
        end
        
        currentContent = tab.Content()
        currentContent.Parent = contentFrame
    end)
end

-- Set first tab as active by default
if #tabs > 0 then
    local firstTabButton = tabButtons:FindFirstChild(tabs[1].Name .. "Tab")
    if firstTabButton then
        firstTabButton.BackgroundTransparency = 0
        firstTabButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        
        local firstTabIcon = firstTabButton:FindFirstChild("Icon")
        if firstTabIcon then
            firstTabIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        end
        
        local firstTabLabel = firstTabButton:FindFirstChild("Label")
        if firstTabLabel then
            firstTabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        
        currentTab = tabs[1]
        currentContent = tabs[1].Content()
        currentContent.Parent = contentFrame
    end
end

-- Add close button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.BackgroundTransparency = 1
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 20
closeButton.Font = Enum.Font.SourceSansSemibold
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
    fluentUI:Destroy()
end)

-- Add to player GUI
fluentUI.Parent = playerGui
