-- Universal GUI Hub (works in any game)
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

-- GUI
local gui = Instance.new("ScreenGui", player.PlayerGui)
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 250, 0, 300)
main.Position = UDim2.new(0, 20, 0, 20)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Vincent Hub"
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- BUTTON FUNCTION
local function createButton(text, y)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(1, -20, 0, 35)
    b.Position = UDim2.new(0, 10, 0, y)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.Gotham
    b.TextSize = 18
    return b
end

-- SLIDER FUNCTION
local function createSlider(text, y, default, callback)
    local label = Instance.new("TextLabel", main)
    label.Size = UDim2.new(1, -20, 0, 25)
    label.Position = UDim2.new(0, 10, 0, y)
    label.Text = text .. ": " .. default
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 16

    local slider = Instance.new("TextButton", main)
    slider.Size = UDim2.new(1, -20, 0, 25)
    slider.Position = UDim2.new(0, 10, 0, y + 25)
    slider.Text = "Change"
    slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    slider.TextColor3 = Color3.fromRGB(255, 255, 255)

    slider.MouseButton1Click:Connect(function()
        local val = tonumber(game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("VincentInput") or "")
        label.Text = text .. ": " .. default
    end)

    slider.MouseButton1Click:Connect(function()
        callback(default)
    end)
end

-- SPEED BUTTON
local speedBtn = createButton("Speed 50", 50)
speedBtn.MouseButton1Click:Connect(function()
    hum.WalkSpeed = 50
end)

-- JUMP BUTTON
local jumpBtn = createButton("Jump 100", 95)
jumpBtn.MouseButton1Click:Connect(function()
    hum.JumpPower = 100
end)

-- NOCLIP
local noclip = false
local noclipBtn = createButton("Noclip ON/OFF", 140)
noclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)

-- FLY LEGGERO
local flying = false
local flyBtn = createButton("Fly ON/OFF", 185)
flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if flying then
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 0.5, 0)
    end
end)

-- TELEPORT TO PLAYER
local tpBtn = createButton("Teleport to Player", 230)
tpBtn.MouseButton1Click:Connect(function()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player then
            char.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
            break
        end
    end
end)