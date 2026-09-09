-- VINCENT HUB (VERSIONE POTENZIATA LEGIT)
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui") -- NON SCOMPARE DOPO LA MORTE

-- QUADRATO "V" MINIMIZZATO
local mini = Instance.new("TextButton", gui)
mini.Size = UDim2.new(0, 55, 0, 55)
mini.Position = UDim2.new(0, 20, 0, 20)
mini.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mini.BorderSizePixel = 2
mini.BorderColor3 = Color3.fromRGB(255, 0, 0)
mini.Text = "V"
mini.TextColor3 = Color3.fromRGB(255, 0, 0)
mini.Font = Enum.Font.GothamBold
mini.TextSize = 30
mini.Active = true
mini.Draggable = true

-- MENU PRINCIPALE
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 300, 0, 420)
main.Position = UDim2.new(0, 20, 0, 90)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
main.Visible = false
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 45)
title.Text = "Vincent Hub"
title.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 22

-- APRI/CHIUDI MENU
mini.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- FUNZIONE INPUT
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

-- SPEED
createInput("Speed", 60, function(val)
    hum.WalkSpeed = val
end)

-- JUMP
createInput("Jump", 130, function(val)
    hum.JumpPower = val
end)

-- SUPER JUMP FLUIDO
local superJumpBtn = Instance.new("TextButton", main)
superJumpBtn.Size = UDim2.new(1, -20, 0, 35)
superJumpBtn.Position = UDim2.new(0, 10, 0, 200)
superJumpBtn.Text = "Super Jump Fluido"
superJumpBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
superJumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
superJumpBtn.Font = Enum.Font.Gotham
superJumpBtn.TextSize = 18

superJumpBtn.MouseButton1Click:Connect(function()
    char.HumanoidRootPart.Velocity = Vector3.new(0, 120, 0)
end)

-- NOCLIP
local noclip = false
local noclipBtn = Instance.new("TextButton", main)
noclipBtn.Size = UDim2.new(1, -20, 0, 35)
noclipBtn.Position = UDim2.new(0, 10, 0, 245)
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

-- FLY FLUIDO LEGIT
local flying = false
local flyBtn = Instance.new("TextButton", main)
flyBtn.Size = UDim2.new(1, -20, 0, 35)
flyBtn.Position = UDim2.new(0, 10, 0, 290)
flyBtn.Text = "Fly Fluido ON/OFF"
flyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
flyBtn.Font = Enum.Font.Gotham
flyBtn.TextSize = 18

flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if flying then
        local cam = workspace.CurrentCamera
        local dir = cam.CFrame.LookVector
        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + dir * 1.5
    end
end)

-- PLAYER ESP
local espBtn = Instance.new("TextButton", main)
espBtn.Size = UDim2.new(1, -20, 0, 35)
espBtn.Position = UDim2.new(0, 10, 0, 335)
espBtn.Text = "Player ESP"
espBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.Font = Enum.Font.Gotham
espBtn.TextSize = 18

espBtn.MouseButton1Click:Connect(function()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local box = Instance.new("Highlight", plr.Character)
            box.FillColor = Color3.fromRGB(255, 0, 0)
            box.OutlineColor = Color3.fromRGB(255, 255, 255)
        end
    end
end)

-- ANTI AFK
local vu = game:GetService("VirtualUser")
player.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)