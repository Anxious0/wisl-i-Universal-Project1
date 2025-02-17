local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

local function createNotification()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "NotificationSystem"
    screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

    local bloom = Instance.new("BloomEffect")
    bloom.Intensity = 0
    bloom.Size = 0
    bloom.Threshold = 0.8
    bloom.Parent = Lighting

    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = Lighting

    local container = Instance.new("Frame")
    container.Name = "Container" 
    container.Size = UDim2.new(0, 0, 0, 0)
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
    container.BorderSizePixel = 0
    container.BackgroundTransparency = 1
    container.Parent = screenGui

    local innerFrame = Instance.new("Frame")
    innerFrame.Size = UDim2.new(1.2, 0, 1.2, 0)
    innerFrame.Position = UDim2.new(-0.1, 0, -0.1, 0)
    innerFrame.BackgroundTransparency = 0.3
    innerFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
    innerFrame.Parent = container

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2, 0)
    corner.Parent = container

    local innerCorner = Instance.new("UICorner")
    innerCorner.CornerRadius = UDim.new(0.15, 0)
    innerCorner.Parent = innerFrame

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 4
    stroke.Color = Color3.fromRGB(140, 80, 255)
    stroke.Transparency = 1
    stroke.Parent = container

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(89, 161, 255)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(182, 124, 255)),
        ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 123, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 85, 185))
    })
    gradient.Rotation = 45
    gradient.Parent = container

    local function createGlow(size, color)
        local glow = Instance.new("ImageLabel")
        glow.BackgroundTransparency = 1
        glow.Size = size
        glow.Position = UDim2.new(0.5 - size.X.Scale/2, 0, 0.5 - size.Y.Scale/2, 0)
        glow.Image = "rbxassetid://7331805068"
        glow.ImageColor3 = color
        glow.ImageTransparency = 1
        glow.Parent = container
        return glow
    end

    local glows = {
        createGlow(UDim2.new(2, 0, 2, 0), Color3.fromRGB(140, 80, 255)),
        createGlow(UDim2.new(1.7, 0, 1.7, 0), Color3.fromRGB(60, 140, 255)),
        createGlow(UDim2.new(1.4, 0, 1.4, 0), Color3.fromRGB(200, 80, 255))
    }

    local text = Instance.new("TextLabel")
    text.Name = "Message"
    text.Size = UDim2.new(1, -40, 1, -40)
    text.Position = UDim2.new(0, 20, 0, 20)
    text.BackgroundTransparency = 1
    text.Text = "✨ Welcome to wisI'i Universal ✨"
    text.TextColor3 = Color3.fromRGB(255, 255, 255)
    text.TextStrokeColor3 = Color3.fromRGB(140, 80, 255)
    text.TextStrokeTransparency = 0.6
    text.Font = Enum.Font.GothamBold
    text.TextSize = 32
    text.TextTransparency = 1
    text.Parent = container

    local particles = Instance.new("ParticleEmitter")
    particles.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(89, 161, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(182, 124, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 123, 255))
    })
    particles.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.5, 0.3),
        NumberSequenceKeypoint.new(1, 1)
    })
    particles.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.15),
        NumberSequenceKeypoint.new(0.5, 0.08),
        NumberSequenceKeypoint.new(1, 0)
    })
    particles.Lifetime = NumberRange.new(1, 2)
    particles.Rate = 50
    particles.Speed = NumberRange.new(5, 8)
    particles.SpreadAngle = Vector2.new(-180, 180)
    particles.Parent = container

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://6026984224"
    sound.Volume = 0.5
    sound.Parent = container

    return {
        ScreenGui = screenGui,
        Container = container,
        InnerFrame = innerFrame,
        Text = text,
        Blur = blur,
        Bloom = bloom,
        Glows = glows,
        Stroke = stroke,
        Gradient = gradient,
        Particles = particles,
        Sound = sound
    }
end

local function animateNotification(elements, duration)
    elements.Sound:Play()
    
    local initialScale = 0.1
    elements.Container.Size = UDim2.new(0.4 * initialScale, 0, 0.15 * initialScale, 0)
    
    local tweens = {
        TweenService:Create(elements.Container, TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false, 0), {
            Size = UDim2.new(0.4, 0, 0.15, 0),
            BackgroundTransparency = 0
        }),
        
        TweenService:Create(elements.InnerFrame, TweenInfo.new(1.2, Enum.EasingStyle.Elastic), {
            Position = UDim2.new(0, 0, 0, 0),
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 0.1
        }),

        TweenService:Create(elements.Text, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0.2), {
            TextTransparency = 0,
            TextSize = 42
        }),

        TweenService:Create(elements.Blur, TweenInfo.new(0.8), {
            Size = 15
        }),
        TweenService:Create(elements.Bloom, TweenInfo.new(0.8), {
            Intensity = 1,
            Size = 50
        }),
        TweenService:Create(elements.Stroke, TweenInfo.new(0.8), {
            Transparency = 0
        })
    }

    for i, glow in ipairs(elements.Glows) do
        table.insert(tweens, TweenService:Create(glow, TweenInfo.new(0.8, Enum.EasingStyle.Cubic), {
            ImageTransparency = 0.6,
            Rotation = 360 * (i % 2 == 0 and 1 or -1)
        }))
    end

    local gradientTween = TweenService:Create(elements.Gradient, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Rotation = elements.Gradient.Rotation + 360
    })
    gradientTween:Play()

    for _, tween in ipairs(tweens) do
        tween:Play()
    end

    local function pulse()
        for i = 1, math.floor(duration) do
            for _, glow in ipairs(elements.Glows) do
                TweenService:Create(glow, TweenInfo.new(0.7, Enum.EasingStyle.Sine), {
                    Size = UDim2.new(glow.Size.X.Scale + 0.15, 0, glow.Size.Y.Scale + 0.15, 0)
                }):Play()
            end
            task.wait(0.7)
            for _, glow in ipairs(elements.Glows) do
                TweenService:Create(glow, TweenInfo.new(0.7, Enum.EasingStyle.Sine), {
                    Size = UDim2.new(glow.Size.X.Scale - 0.15, 0, glow.Size.Y.Scale - 0.15, 0)
                }):Play()
            end
            task.wait(0.7)
        end
    end
    
    task.spawn(pulse)
    task.wait(duration)

    local disappearTweens = {
        TweenService:Create(elements.Container, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }),
        TweenService:Create(elements.Text, TweenInfo.new(0.3), {
            TextTransparency = 1,
            TextSize = 28
        }),
        TweenService:Create(elements.Blur, TweenInfo.new(0.3), {
            Size = 0
        }),
        TweenService:Create(elements.Bloom, TweenInfo.new(0.3), {
            Intensity = 0,
            Size = 0
        }),
        TweenService:Create(elements.Stroke, TweenInfo.new(0.3), {
            Transparency = 1
        })
    }

    for _, glow in ipairs(elements.Glows) do
        table.insert(disappearTweens, TweenService:Create(glow, TweenInfo.new(0.3), {
            ImageTransparency = 1
        }))
    end

    for _, tween in ipairs(disappearTweens) do
        tween:Play()
    end

    task.wait(0.7)
    elements.ScreenGui:Destroy()
end

local elements = createNotification()
animateNotification(elements, 4)
