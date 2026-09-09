-- VINCENT HUB (MENU COMPATTO STILE REDZ HUB, LEGIT)
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

player.CharacterAdded:Connect(function(newChar)
    char = newChar
    hum = newChar:WaitForChild("Humanoid")
end)

local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui")

-- MINI MENU TONDO
local mini = Instance.new("TextButton", gui)
mini.Size = UDim2.new(0, 60, 0, 60)
mini.Position = UDim2.new(0, 20, 0, 20)
mini.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mini.Text = "V"
mini.TextColor3 = Color3.fromRGB(255, 255, 255)
mini.Font = Enum.Font.GothamBlack
mini.TextSize = 30
mini.Active = true
mini.Draggable = true

Instance.new("UICorner", mini).CornerRadius = UDim.new(1, 0)

local glow = Instance.new("UIStroke", mini)
glow.Color = Color3.fromRGB(0, 140, 255)
glow.Thickness = 3

-- MENU COMPATTO STILE REDZ HUB
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 300, 0, 380)
main.Position = UDim2.new(0, 20, 0, 100)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.Visible = false
main.Active = true
main.Draggable = true

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local mainGlow = Instance.new("UIStroke", main)
mainGlow.Color = Color3.fromRGB(0, 140, 255)
mainGlow.Thickness = 2

-- HEADER
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 45)
header.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.Text = "Vincent Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.BackgroundTransparency = 1

local toggle = Instance.new("TextButton", header)
toggle.Size = UDim2.new(0, 40, 0, 40)
toggle.Position = UDim2.new(1, -45, 0, 3)
toggle.Text = "□"
toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 22
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 10)

local big = true
toggle.MouseButton1Click:Connect(function()
    if big then
        main.Size = UDim2.new(0, 220, 0, 300)
        big = false
    else
        main.Size = UDim2.new(0, 300, 0, 380)
        big = true
    end
end)

mini.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- SEZIONI
local function section(name, y)
    local label = Instance.new("TextLabel", main)
    label.Size = UDim2.new(1, -20, 0, 25)
    label.Position = UDim2.new(0, 10, 0, y)
    label.Text = name
    label.TextColor3 = Color3.fromRGB(0, 140, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 18
    label.BackgroundTransparency = 1
end

section("Movimento", 60)

-- INPUT SPEED
local speedBox = Instance.new("TextBox", main)
speedBox.Size = UDim2.new(1, -20, 0, 30)
speedBox.Position = UDim2.new(0, 10, 0, 90)
speedBox.PlaceholderText = "Speed (0-500)"
speedBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
speedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBox.Font = Enum.Font.Gotham
speedBox.TextSize = 16
Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0, 8)

speedBox.FocusLost:Connect(function()
    local val = tonumber(speedBox.Text)
    if val then hum.WalkSpeed = val end
end)

-- INPUT JUMP
local jumpBox = Instance.new("TextBox", main)
jumpBox.Size = UDim2.new(1, -20, 0, 30)
jumpBox.Position = UDim2.new(0, 10, 0, 130)
jumpBox.PlaceholderText = "Jump (0-500)"
jumpBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
jumpBox.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpBox.Font = Enum.Font.Gotham
jumpBox.TextSize = 16
Instance.new("UICorner", jumpBox).CornerRadius = UDim.new(0, 8)

jumpBox.FocusLost:Connect(function()
    local val = tonumber(jumpBox.Text)
    if val then hum.JumpPower = val end
end)

-- SUPER JUMP
local superJump = Instance.new("TextButton", main)
superJump.Size = UDim2.new(1, -20, 0, 35)
superJump.Position = UDim2.new(0, 10, 0, 170)
superJump.Text = "Super Jump Fluido"
superJump.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
superJump.TextColor3 = Color3.fromRGB(255, 255, 255)
superJump.Font = Enum.Font.Gotham
superJump.TextSize = 18
Instance.new("UICorner", superJump).CornerRadius = UDim.new(0, 10)

superJump.MouseButton1Click:Connect(function()
    char.HumanoidRootPart.Velocity = Vector3.new(0, 120, 0)
end)

-- NOCLIP
local noclip = false
local noclipBtn = Instance.new("TextButton", main)
noclipBtn.Size = UDim2.new(1, -20, 0, 35)
noclipBtn.Position = UDim2.new(0, 10, 0, 215)
noclipBtn.Text = "Noclip ON/OFF"
noclipBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
noclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipBtn.Font = Enum.Font.Gotham
noclipBtn.TextSize = 18
Instance.new("UICorner", noclipBtn).CornerRadius = UDim.new(0, 10)

noclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclip and char then
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- FLY MOBILE FRIENDLY
local flying = false
local flySpeed = 2

local flyBtn = Instance.new("TextButton", main)
flyBtn.Size = UDim2.new(1, -20, 0, 35)
flyBtn.Position = UDim2.new(0, 10, 0, 260)
flyBtn.Text = "Fly ON/OFF"
flyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
flyBtn.Font = Enum.Font.Gotham
flyBtn.TextSize = 18
Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0, 10)

flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
end)

local function flyButton(txt, posX)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(0.3, 0, 0, 30)
    b.Position = UDim2.new(posX, 0, 0, 300)
    b.Text = txt
    b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.Gotham
    b.TextSize = 16
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    return b
end

local flyUp = flyButton("Su", 0.05)
local flyDown = flyButton("Giù", 0.35)
local flyForward = flyButton("Avanti", 0.65)

flyUp.MouseButton1Click:Connect(function()
    if flying and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame += Vector3.new(0, flySpeed, 0)
    end
end)

flyDown.MouseButton1Click:Connect(function()
    if flying and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame -= Vector3.new(0, flySpeed, 0)
    end
end)

flyForward.MouseButton1Click:Connect(function()
    if flying and char:FindFirstChild("HumanoidRootPart") then
        local cam = workspace.CurrentCamera
        char.HumanoidRootPart.CFrame += cam.CFrame.LookVector * flySpeed
    end
end)

-- ESP PLAYER
local espBtn = Instance.new("TextButton", main)
espBtn.Size = UDim2.new(1, -20, 0, 35)
espBtn.Position = UDim2.new(0, 10, 0, 340)
espBtn.Text = "Player ESP"
espBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.Font = Enum.Font.Gotham
espBtn.TextSize = 18
Instance.new("UICorner", espBtn).CornerRadius = UDim.new(0, 10)

espBtn.MouseButton1Click:Connect(function()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local h = Instance.new("Highlight", plr.Character)
            h.FillColor = Color3.fromRGB(0, 140, 255)
            h.OutlineColor = Color3.fromRGB(255, 255, 255)
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