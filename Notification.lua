local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

local function createNotification()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "PremiumNotification"
    screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.IgnoreGuiInset = true

    local bloom = Instance.new("BloomEffect")
    bloom.Intensity = 0
    bloom.Size = 0
    bloom.Threshold = 0.9
    bloom.Parent = Lighting

    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = Lighting

    local colorCorrection = Instance.new("ColorCorrectionEffect")
    colorCorrection.Brightness = 0
    colorCorrection.Contrast = 0.05
    colorCorrection.Saturation = 0
    colorCorrection.TintColor = Color3.fromRGB(230, 220, 255)
    colorCorrection.Parent = Lighting

    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.new(0, 0, 0, 0)
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundColor3 = Color3.fromRGB(25, 25, 50)
    container.BackgroundTransparency = 0.8
    container.BorderSizePixel = 0
    container.Parent = screenGui

    local glassLayer = Instance.new("Frame")
    glassLayer.Size = UDim2.new(1, 0, 1, 0)
    glassLayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    glassLayer.BackgroundTransparency = 0.9
    local glassGradient = Instance.new("UIGradient")
    glassGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 255))
    })
    glassGradient.Rotation = 90
    glassGradient.Parent = glassLayer
    glassLayer.Parent = container

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 32)
    corner.Parent = container
    corner:Clone().Parent = glassLayer

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 3
    stroke.Color = Color3.fromRGB(150, 100, 255)
    stroke.Transparency = 1
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = container

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 150, 255)),
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(200, 100, 255)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 100, 200)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 200, 255))
    })
    gradient.Rotation = 45
    gradient.Parent = stroke

    local function createGlow(size, color, transparency)
        local glow = Instance.new("ImageLabel")
        glow.BackgroundTransparency = 1
        glow.Size = size
        glow.Position = UDim2.new(0.5, 0, 0.5, 0)
        glow.AnchorPoint = Vector2.new(0.5, 0.5)
        glow.Image = "rbxassetid://5028857084"
        glow.ImageColor3 = color
        glow.ImageTransparency = transparency
        glow.Parent = container
        return glow
    end

    local glows = {
        createGlow(UDim2.new(2.8, 0, 2.8, 0), Color3.fromRGB(150, 100, 255), 0.8),
        createGlow(UDim2.new(2.2, 0, 2.2, 0), Color3.fromRGB(100, 150, 255), 0.85),
        createGlow(UDim2.new(1.7, 0, 1.7, 0), Color3.fromRGB(200, 100, 200), 0.9)
    }

    local text = Instance.new("TextLabel")
    text.Name = "Message"
    text.Size = UDim2.new(0.9, 0, 0.8, 0)
    text.Position = UDim2.new(0.5, 0, 0.5, 0)
    text.AnchorPoint = Vector2.new(0.5, 0.5)
    text.BackgroundTransparency = 1
    text.Text = "✨ wisI'i Universal Project ✨"
    text.TextColor3 = Color3.fromRGB(240, 240, 255)
    text.TextStrokeColor3 = Color3.fromRGB(60, 40, 100)
    text.TextStrokeTransparency = 0.6
    text.Font = Enum.Font.SourceSansBold
    text.TextSize = 44
    text.TextTransparency = 1
    text.Parent = container

    local textShadow = text:Clone()
    textShadow.TextColor3 = Color3.fromRGB(20, 20, 40)
    textShadow.TextTransparency = 0.7
    textShadow.Position = UDim2.new(0.5, 3, 0.5, 3)
    textShadow.Parent = container

    local particles = Instance.new("ParticleEmitter")
    particles.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 200, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 150, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 150, 200))
    })
    particles.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(0.5, 0.6),
        NumberSequenceKeypoint.new(1, 1)
    })
    particles.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.4),
        NumberSequenceKeypoint.new(0.5, 0.2),
        NumberSequenceKeypoint.new(1, 0)
    })
    particles.Lifetime = NumberRange.new(1, 2)
    particles.Rate = 100
    particles.Speed = NumberRange.new(10, 15)
    particles.SpreadAngle = Vector2.new(-180, 180)
    particles.Rotation = NumberRange.new(-180, 180)
    particles.LightEmission = 0.5
    particles.Parent = container

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9112932269"
    sound.Volume = 0.8
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
        TweenService:Create(elements.Container, TweenInfo.new(0.9, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Size = UDim2.new(0.5, 0, 0.2, 0),
            BackgroundTransparency = 0.8
        }),
        TweenService:Create(elements.GlassLayer, TweenInfo.new(0.9, Enum.EasingStyle.Quad), {
            BackgroundTransparency = 0.9
        }),
        TweenService:Create(elements.Text, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0.2), {
            TextTransparency = 0,
            TextSize = 56
        }),
        TweenService:Create(elements.TextShadow, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0.2), {
            TextTransparency = 0.7
        }),
        TweenService:Create(elements.Blur, TweenInfo.new(0.9), {
            Size = 28
        }),
        TweenService:Create(elements.Bloom, TweenInfo.new(0.9), {
            Intensity = 1.8,
            Size = 80
        }),
        TweenService:Create(elements.ColorCorrection, TweenInfo.new(0.9), {
            Brightness = 0.08,
            Saturation = 0.15
        }),
        TweenService:Create(elements.Stroke, TweenInfo.new(0.9), {
            Transparency = 0
        })
    }

    for i, glow in ipairs(elements.Glows) do
        table.insert(entranceTweens, TweenService:Create(glow, TweenInfo.new(1.2, Enum.EasingStyle.Cubic), {
            ImageTransparency = glow.ImageTransparency - 0.45,
            Rotation = 360 * (i % 2 == 0 and 1 or -1)
        }))
    end

    local gradientTween = TweenService:Create(elements.Gradient, TweenInfo.new(duration + 1, Enum.EasingStyle.Linear), {
        Rotation = elements.Gradient.Rotation + 720
    })
    gradientTween:Play()

    local function pulseEffect()
        for i = 1, math.floor(duration) do
            local pulseIn = TweenService:Create(elements.Container, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
                Size = UDim2.new(0.52, 0, 0.21, 0)
            })
            local pulseOut = TweenService:Create(elements.Container, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
                Size = UDim2.new(0.5, 0, 0.2, 0)
            })
            pulseIn:Play()
            pulseIn.Completed:Wait()
            pulseOut:Play()
            pulseOut.Completed:Wait()
        end
    end

    for _, tween in ipairs(entranceTweens) do
        tween:Play()
    end
    task.spawn(pulseEffect)
    task.wait(duration)

    local exitTweens = {
        TweenService:Create(elements.Container, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        }),
        TweenService:Create(elements.GlassLayer, TweenInfo.new(0.6), {
            BackgroundTransparency = 1
        }),
        TweenService:Create(elements.Text, TweenInfo.new(0.5), {
            TextTransparency = 1,
            TextSize = 44
        }),
        TweenService:Create(elements.TextShadow, TweenInfo.new(0.5), {
            TextTransparency = 1
        }),
        TweenService:Create(elements.Blur, TweenInfo.new(0.6), {
            Size = 0
        }),
        TweenService:Create(elements.Bloom, TweenInfo.new(0.6), {
            Intensity = 0,
            Size = 0
        }),
        TweenService:Create(elements.ColorCorrection, TweenInfo.new(0.6), {
            Brightness = 0,
            Saturation = 0,
            TintColor = Color3.fromRGB(255, 255, 255)
        }),
        TweenService:Create(elements.Stroke, TweenInfo.new(0.6), {
            Transparency = 1
        })
    }

    for _, glow in ipairs(elements.Glows) do
        table.insert(exitTweens, TweenService:Create(glow, TweenInfo.new(0.6), {
            ImageTransparency = 1,
            Rotation = glow.Rotation + 180
        }))
    end

    for _, tween in ipairs(exitTweens) do
        tween:Play()
    end

    task.wait(0.7)
    elements.Blur:Destroy()
    elements.Bloom:Destroy()
    elements.ColorCorrection:Destroy()
    elements.ScreenGui:Destroy()
end

local elements = createNotification()
animateNotification(elements, 4)
