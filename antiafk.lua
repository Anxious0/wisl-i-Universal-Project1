RunService.Stepped:Connect(function()
    lp.Character.HumanoidRootPart.CFrame = lp.Character.HumanoidRootPart.CFrame + Vector3.new(0,0.01,0)
end)
