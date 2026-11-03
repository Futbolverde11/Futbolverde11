
-- GHOST HACK V1 | WHITE LED EDITION

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "GHOST_HACK_V1"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- MENU
local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(280, 340)
main.Position = UDim2.new(0.5, -140, 0.5, -170)
main.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
main.BorderSizePixel = 0
main.Visible = false
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = main

-- LED BORDER
local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(255, 255, 255)
border.Thickness = 2
border.Parent = main

-- GHOST BACKGROUND
local ghost = Instance.new("TextLabel")
ghost.Size = UDim2.new(1, 0, 1, 0)
ghost.BackgroundTransparency = 1
ghost.Text = "👻"
ghost.TextSize = 175
ghost.TextColor3 = Color3.fromRGB(255, 255, 255)
ghost.TextTransparency = 0.72
ghost.ZIndex = 1
ghost.Parent = main

-- TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 48)
title.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
title.Text = "GHOST HACK V1"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 21
title.ZIndex = 3
title.Parent = main

-- LED ANIMATION
task.spawn(function()
    while gui.Parent do
        TweenService:Create(border,
            TweenInfo.new(0.8),
            {Color = Color3.fromRGB(255, 0, 0)}
        ):Play()
        task.wait(0.8)

        TweenService:Create(border,
            TweenInfo.new(0.8),
            {Color = Color3.fromRGB(255, 255, 255)}
        ):Play()
        task.wait(0.8)
    end
end)

-- BUTTONS
local function createButton(name, y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.84, 0, 0, 40)
    button.Position = UDim2.new(0.08, 0, 0, y)
    button.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = name .. " : OFF"
    button.TextSize = 15
    button.ZIndex = 3
    button.Parent = main

    local active = false

    button.MouseButton1Click:Connect(function()
        active = not active
        button.Text = name .. (active and " : ON" or " : OFF")
        button.BackgroundColor3 = active
            and Color3.fromRGB(180, 0, 0)
            or Color3.fromRGB(25, 0, 0)
    end)
end

createButton("AIM TRAINER", 70)
createButton("ESP TRAINING", 120)
createButton("FLY", 170)
createButton("SPEED", 220)

-- CLOSE
local close = Instance.new("TextButton")
close.Size = UDim2.new(0.84, 0, 0, 35)
close.Position = UDim2.new(0.08, 0, 0, 285)
close.Text = "CLOSE MENU"
close.BackgroundColor3 = Color3.fromRGB(130, 0, 0)
close.TextColor3 = Color3.new(1, 1, 1)
close.ZIndex = 3
close.Parent = main

-- OPEN BUTTON
local open = Instance.new("TextButton")
open.Size = UDim2.fromOffset(65, 65)
open.Position = UDim2.new(0, 15, 0.5, -32)
open.Text = "👻"
open.TextSize = 35
open.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
open.TextColor3 = Color3.new(1, 1, 1)
open.Parent = gui

local openBorder = Instance.new("UIStroke")
openBorder.Color = Color3.new(1, 1, 1)
openBorder.Thickness = 2
openBorder.Parent = open

-- OPEN ANIMATION
open.MouseButton1Click:Connect(function()
    main.Visible = true
    main.Size = UDim2.fromOffset(0, 0)

    TweenService:Create(main,
        TweenInfo.new(0.5, Enum.EasingStyle.Back),
        {Size = UDim2.fromOffset(280, 340)}
    ):Play()
    
    open.Visible = false
end)

close.MouseButton1Click:Connect(function()
    main.Visible = false
    open.Visible = true
end)
