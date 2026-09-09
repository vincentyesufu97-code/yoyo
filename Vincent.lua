-- VINCENT HUB (LEGIT GUI)
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local gui = Instance.new("ScreenGui", player.PlayerGui)

-- MINIMIZED BUTTON (quadrato nero con V)
local mini = Instance.new("TextButton", gui)
mini.Size = UDim2.new(0, 50, 0, 50)
mini.Position = UDim2.new(0, 20, 0, 20)
mini.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mini.Text = "V"
mini.TextColor3 = Color3.fromRGB(255, 255, 255)
mini.Font = Enum.Font.GothamBold
mini.TextSize = 28
mini.Active = true
mini.Draggable = true

-- MAIN MENU
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 260, 0, 330)
main.Position = UDim2.new(0, 20, 0, 80)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.Visible = false
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Vincent Hub"
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- OPEN/CLOSE MENU
mini.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- INPUT BOX FUNCTION
local function createInput(labelText, y, callback)
    local label = Instance.new("TextLabel", main)
    label.Size = UDim2.new(1, -20, 0, 25)
    label.Position = UDim2.new(0, 10, 0, y)
    label.Text = labelText
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 16

    local box = Instance.new("TextBox", main)
    box.Size = UDim2.new(1, -20, 0, 30)
    box.Position = UDim2.new(0, 10, 0, y + 25)
    box.PlaceholderText = "0 - 500"
    box.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.Font = Enum.Font.Gotham
    box.TextSize = 16

    box.FocusLost:Connect(function()
        local num = tonumber(box.Text)
        if num and num >= 0 and num <= 500 then
            callback(num)
        end
    end)
end

-- SPEED INPUT
createInput("Speed", 50, function(val)
    hum.WalkSpeed = val
end)

-- JUMP INPUT
createInput("Jump", 120, function(val)
    hum.JumpPower = val
end)

-- NOCLIP
local noclip = false
local noclipBtn = Instance.new("TextButton", main)
noclipBtn.Size = UDim2.new(1, -20, 0, 35)
noclipBtn.Position = UDim2.new(0, 10, 0, 190)
noclipBtn.Text = "Noclip ON/OFF"
noclipBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
noclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipBtn.Font = Enum.Font.Gotham
noclipBtn.TextSize = 18

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

-- FLY LEGGERO MIGLIORATO (LEGIT)
local flying = false
local flyBtn = Instance.new("TextButton", main)
flyBtn.Size = UDim2.new(1, -20, 0, 35)
flyBtn.Position = UDim2.new(0, 10, 0, 235)
flyBtn.Text = "Fly ON/OFF"
flyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
flyBtn.Font = Enum.Font.Gotham
flyBtn.TextSize = 18

flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if flying then
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 1, 0)
    end
end)