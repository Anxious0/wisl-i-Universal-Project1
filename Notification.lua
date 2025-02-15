local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local function createNotification()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "Notification"
    screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = game.Lighting

    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.new(0.2, 0, 0.075, 0)
    container.Position = UDim2.new(0.3, 0, -0.3, 0)
    container.BackgroundColor3 = Color3.fromRGB(5, 5, 15)
    container.BorderSizePixel = 0
    container.BackgroundTransparency = 1
    container.Rotation = 0

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.1, 0)
    corner.Parent = container

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 5
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Transparency = 1
    stroke.Parent = container

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 120, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(140, 80, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 15))
    })
    gradient.Rotation = 35
    gradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(1, 0.7)
    })
    gradient.Parent = container
    container.Parent = screenGui

    local glow = Instance.new("ImageLabel")
    glow.Name = "Glow"
    glow.BackgroundTransparency = 1
    glow.Size = UDim2.new(1.3, 0, 1.3, 0)
    glow.Position = UDim2.new(-0.15, 0, -0.15, 0)
    glow.Image = "rbxassetid://7331805068"
    glow.ImageColor3 = Color3.fromRGB(45, 120, 255)
    glow.ImageTransparency = 1
    glow.Rotation = 0
    glow.Parent = container

    local text = Instance.new("TextLabel")
    text.Name = "Message"
    text.Size = UDim2.new(1, -40, 1, -40)
    text.Position = UDim2.new(0, 20, 0, 20)
    text.BackgroundTransparency = 1
    text.Text = "Welcome ✨ wisI'i Universal Project ✨"
    text.TextColor3 = Color3.fromRGB(255, 255, 255)
    text.TextStrokeColor3 = Color3.fromRGB(45, 120, 255)
    text.TextStrokeTransparency = 0.7
    text.Font = Enum.Font.GothamBold
    text.TextSize = 32
    text.TextTransparency = 1
    text.Parent = container

    local particles = Instance.new("ParticleEmitter")
    particles.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
    particles.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1)
    })
    particles.Size = NumberSequence.new(0.05)
    particles.Lifetime = NumberRange.new(1)
    particles.Rate = 20
    particles.Speed = NumberRange.new(3)
    particles.EmissionDirection = Enum.NormalId.Top
    particles.Parent = container

    local appearSound = Instance.new("Sound")
    appearSound.SoundId = "rbxassetid://6026984224"
    appearSound.Volume = 0.4
    appearSound.Parent = container

    return {
        ScreenGui = screenGui,
        Container = container,
        Text = text,
        Blur = blur,
        Glow = glow,
        Stroke = stroke,
        Particles = particles,
        AppearSound = appearSound
    }
end

local function animateNotification(elements, duration)
    elements.AppearSound:Play()

    local appearTweens = {
        TweenService:Create(elements.Container, TweenInfo.new(0.8, Enum.EasingStyle.Bounce), {
            Position = UDim2.new(0.3, 0, 0.1, 0),
            Size = UDim2.new(0.4, 0, 0.15, 0),
            BackgroundTransparency = 0
        }),
        TweenService:Create(elements.Text, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {
            TextTransparency = 0,
            TextSize = 36
        }),
        TweenService:Create(elements.Blur, TweenInfo.new(0.6), {
            Size = 8
        }),
        TweenService:Create(elements.Glow, TweenInfo.new(0.6, Enum.EasingStyle.Linear), {
            ImageTransparency = 0.6,
            Rotation = 360
        }),
        TweenService:Create(elements.Stroke, TweenInfo.new(0.6), {
            Transparency = 0
        })
    }

    for _, tween in ipairs(appearTweens) do
        tween:Play()
    end

    local swingTween1 = TweenService:Create(elements.Container, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {
        Rotation = 5
    })
    local swingTween2 = TweenService:Create(elements.Container, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {
        Rotation = 0
    })
    swingTween1:Play()
    swingTween1.Completed:Wait()
    swingTween2:Play()

    task.wait(duration)

    local disappearTweens = {
        TweenService:Create(elements.Container, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Position = UDim2.new(0.3, 0, -0.3, 0),
            Size = UDim2.new(0.2, 0, 0.075, 0),
            BackgroundTransparency = 1
        }),
        TweenService:Create(elements.Text, TweenInfo.new(0.4), {
            TextTransparency = 1,
            TextSize = 32
        }),
        TweenService:Create(elements.Blur, TweenInfo.new(0.4), {
            Size = 0
        }),
        TweenService:Create(elements.Glow, TweenInfo.new(0.4), {
            ImageTransparency = 1,
            Rotation = 0
        }),
        TweenService:Create(elements.Stroke, TweenInfo.new(0.4), {
            Transparency = 1
        })
    }

    for _, tween in ipairs(disappearTweens) do
        tween:Play()
    end

    task.wait(0.6)
    elements.ScreenGui:Destroy()
end

local elements = createNotification()
animateNotification(elements, 3)
