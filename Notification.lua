local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local function createNotification()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "EnhancedNotification"
    screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.IgnoreGuiInset = true

    local bloom = Instance.new("BloomEffect")
    bloom.Intensity = 0
    bloom.Size = 0
    bloom.Threshold = 0.85
    bloom.Parent = Lighting

    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = Lighting

    local colorCorrection = Instance.new("ColorCorrectionEffect")
    colorCorrection.Brightness = 0
    colorCorrection.Contrast = 0
    colorCorrection.Saturation = 0
    colorCorrection.Parent = Lighting

    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.new(0, 0, 0, 0)
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
    container.BackgroundTransparency = 0.85
    container.BorderSizePixel = 0
    container.Parent = screenGui

    local glassLayer = Instance.new("Frame")
    glassLayer.Size = UDim2.new(1, 0, 1, 0)
    glassLayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    glassLayer.BackgroundTransparency = 0.95
    glassLayer.Parent = container

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 24)
    corner.Parent = container
    
    local glassCorner = corner:Clone()
    glassCorner.Parent = glassLayer

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 4
    stroke.Color = Color3.fromRGB(200, 100, 255)
    stroke.Transparency = 1
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = container

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 200, 255)),
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(220, 160, 255)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 150, 220)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 120, 180))
    })
    gradient.Rotation = 45
    gradient.Parent = stroke

    local function createGlow(size, color, transparency)
        local glow = Instance.new("ImageLabel")
        glow.BackgroundTransparency = 1
        glow.Size = size
        glow.Position = UDim2.new(0.5, 0, 0.5, 0)
        glow.AnchorPoint = Vector2.new(0.5, 0.5)
        glow.Image = "rbxassetid://6026984224"
        glow.ImageColor3 = color
        glow.ImageTransparency = transparency
        glow.Parent = container
        return glow
    end

    local glows = {
        createGlow(UDim2.new(2.5, 0, 2.5, 0), Color3.fromRGB(200, 100, 255), 0.85),
        createGlow(UDim2.new(2, 0, 2, 0), Color3.fromRGB(100, 160, 255), 0.9),
        createGlow(UDim2.new(1.6, 0, 1.6, 0), Color3.fromRGB(240, 120, 255), 0.95)
    }

    local text = Instance.new("TextLabel")
    text.Name = "Message"
    text.Size = UDim2.new(0.9, 0, 0.8, 0)
    text.Position = UDim2.new(0.5, 0, 0.5, 0)
    text.AnchorPoint = Vector2.new(0.5, 0.5)
    text.BackgroundTransparency = 1
    text.Text = "✨ Welcome to wisI'i Universal Project!! ✨"
    text.TextColor3 = Color3.fromRGB(255, 255, 255)
    text.TextStrokeColor3 = Color3.fromRGB(80, 40, 120)
    text.TextStrokeTransparency = 0.7
    text.Font = Enum.Font.FredokaOne
    text.TextSize = 36
    text.TextTransparency = 1
    text.Parent = container

    local textShadow = text:Clone()
    textShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
    textShadow.TextTransparency = 0.8
    textShadow.Position = UDim2.new(0.5, 2, 0.5, 2)
    textShadow.Parent = container

    local particles = Instance.new("ParticleEmitter")
    particles.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 200, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(220, 160, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 120, 180))
    })
    particles.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.4),
        NumberSequenceKeypoint.new(0.7, 0.8),
        NumberSequenceKeypoint.new(1, 1)
    })
    particles.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(0.5, 0.15),
        NumberSequenceKeypoint.new(1, 0)
    })
    particles.Lifetime = NumberRange.new(1.5, 2.5)
    particles.Rate = 80
    particles.Speed = NumberRange.new(8, 12)
    particles.SpreadAngle = Vector2.new(-360, 360)
    particles.Rotation = NumberRange.new(0, 360)
    particles.Parent = container

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://6026984224"
    sound.Volume = 0.7
    sound.Parent = container

    return {
        ScreenGui = screenGui,
        Container = container,
        GlassLayer = glassLayer,
        Text = text,
        TextShadow = textShadow,
        Blur = blur,
        Bloom = bloom,
        ColorCorrection = colorCorrection,
        Glows = glows,
        Stroke = stroke,
        Gradient = gradient,
        Particles = particles,
        Sound = sound
    }
end

local function animateNotification(elements, duration)
    elements.Sound:Play()
    
    elements.Container.Size = UDim2.new(0, 0, 0, 0)
    elements.Container.BackgroundTransparency = 1
    
    local entranceTweens = {
        TweenService:Create(elements.Container, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0.45, 0, 0.18, 0),
            BackgroundTransparency = 0.85
        }),
        TweenService:Create(elements.GlassLayer, TweenInfo.new(0.8, Enum.EasingStyle.Quad), {
            BackgroundTransparency = 0.95
        }),
        TweenService:Create(elements.Text, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0.2), {
            TextTransparency = 0,
            TextSize = 48
        }),
        TweenService:Create(elements.TextShadow, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0.2), {
            TextTransparency = 0.8
        }),
        TweenService:Create(elements.Blur, TweenInfo.new(0.8), {
            Size = 24
        }),
        TweenService:Create(elements.Bloom, TweenInfo.new(0.8), {
            Intensity = 1.5,
            Size = 72
        }),
        TweenService:Create(elements.ColorCorrection, TweenInfo.new(0.8), {
            Brightness = 0.05,
            Saturation = 0.1
        }),
        TweenService:Create(elements.Stroke, TweenInfo.new(0.8), {
            Transparency = 0
        })
    }

    for i, glow in ipairs(elements.Glows) do
        table.insert(entranceTweens, TweenService:Create(glow, TweenInfo.new(1, Enum.EasingStyle.Cubic), {
            ImageTransparency = glow.ImageTransparency - 0.4,
            Rotation = 180 * (i % 2 == 0 and 1 or -1)
        }))
    end

    local gradientTween = TweenService:Create(elements.Gradient, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Rotation = elements.Gradient.Rotation + 360
    })
    gradientTween:Play()

    local function pulseEffect()
        for i = 1, math.floor(duration) do
            local pulseTween = TweenService:Create(elements.Container, TweenInfo.new(0.6, Enum.EasingStyle.Sine), {
                Size = UDim2.new(0.47, 0, 0.19, 0)
            })
            local pulseBack = TweenService:Create(elements.Container, TweenInfo.new(0.6, Enum.EasingStyle.Sine), {
                Size = UDim2.new(0.45, 0, 0.18, 0)
            })
            pulseTween:Play()
            pulseTween.Completed:Wait()
            pulseBack:Play()
            pulseBack.Completed:Wait()
        end
    end

    for _, tween in ipairs(entranceTweens) do
        tween:Play()
    end
    task.spawn(pulseEffect)
    task.wait(duration)

    local exitTweens = {
        TweenService:Create(elements.Container, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        }),
        TweenService:Create(elements.GlassLayer, TweenInfo.new(0.5), {
            BackgroundTransparency = 1
        }),
        TweenService:Create(elements.Text, TweenInfo.new(0.4), {
            TextTransparency = 1,
            TextSize = 36
        }),
        TweenService:Create(elements.TextShadow, TweenInfo.new(0.4), {
            TextTransparency = 1
        }),
        TweenService:Create(elements.Blur, TweenInfo.new(0.5), {
            Size = 0
        }),
        TweenService:Create(elements.Bloom, TweenInfo.new(0.5), {
            Intensity = 0,
            Size = 0
        }),
        TweenService:Create(elements.ColorCorrection, TweenInfo.new(0.5), {
            Brightness = 0,
            Saturation = 0
        }),
        TweenService:Create(elements.Stroke, TweenInfo.new(0.5), {
            Transparency = 1
        })
    }

    for _, glow in ipairs(elements.Glows) do
        table.insert(exitTweens, TweenService:Create(glow, TweenInfo.new(0.5), {
            ImageTransparency = 1,
            Rotation = glow.Rotation + 90
        }))
    end

    for _, tween in ipairs(exitTweens) do
        tween:Play()
    end

    task.wait(0.6)
    elements.ScreenGui:Destroy()
end

-- Execute
local elements = createNotification()
animateNotification(elements, 4)
