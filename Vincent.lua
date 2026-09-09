-- MENU COMPATTO SISTEMATO (STILE REDZ HUB)
local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui")

-- MINI MENU TONDO
local mini = Instance.new("TextButton", gui)
mini.Size = UDim2.new(0, 55, 0, 55)
mini.Position = UDim2.new(0, 20, 0, 20)
mini.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mini.Text = "V"
mini.TextColor3 = Color3.fromRGB(255, 255, 255)
mini.Font = Enum.Font.GothamBlack
mini.TextSize = 28
mini.Active = true
mini.Draggable = true
Instance.new("UICorner", mini).CornerRadius = UDim.new(1, 0)

local miniGlow = Instance.new("UIStroke", mini)
miniGlow.Color = Color3.fromRGB(0, 140, 255)
miniGlow.Thickness = 2

-- MENU COMPATTO
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 280, 0, 360)
main.Position = UDim2.new(0, 20, 0, 100)
main.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
main.Visible = false
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local mainGlow = Instance.new("UIStroke", main)
mainGlow.Color = Color3.fromRGB(0, 140, 255)
mainGlow.Thickness = 2

-- HEADER
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 42)
header.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.Text = "Vincent Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.BackgroundTransparency = 1

local toggle = Instance.new("TextButton", header)
toggle.Size = UDim2.new(0, 35, 0, 35)
toggle.Position = UDim2.new(1, -40, 0, 3)
toggle.Text = "□"
toggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 20
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 10)

local big = true
toggle.MouseButton1Click:Connect(function()
    if big then
        main.Size = UDim2.new(0, 220, 0, 280)
        big = false
    else
        main.Size = UDim2.new(0, 280, 0, 360)
        big = true
    end
end)

mini.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- SEZIONE MOVIMENTO
local mov = Instance.new("TextLabel", main)
mov.Size = UDim2.new(1, -20, 0, 25)
mov.Position = UDim2.new(0, 10, 0, 55)
mov.Text = "Movimento"
mov.TextColor3 = Color3.fromRGB(0, 140, 255)
mov.Font = Enum.Font.GothamBold
mov.TextSize = 18
mov.BackgroundTransparency = 1

-- SPEED
local speedBox = Instance.new("TextBox", main)
speedBox.Size = UDim2.new(1, -20, 0, 30)
speedBox.Position = UDim2.new(0, 10, 0, 85)
speedBox.PlaceholderText = "Speed (0-500)"
speedBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
speedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBox.Font = Enum.Font.Gotham
speedBox.TextSize = 16
Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0, 8)

-- JUMP
local jumpBox = Instance.new("TextBox", main)
jumpBox.Size = UDim2.new(1, -20, 0, 30)
jumpBox.Position = UDim2.new(0, 10, 0, 125)
jumpBox.PlaceholderText = "Jump (0-500)"
jumpBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
jumpBox.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpBox.Font = Enum.Font.Gotham
jumpBox.TextSize = 16
Instance.new("UICorner", jumpBox).CornerRadius = UDim.new(0, 8)

-- SUPER JUMP
local superJump = Instance.new("TextButton", main)
superJump.Size = UDim2.new(1, -20, 0, 35)
superJump.Position = UDim2.new(0, 10, 0, 165)
superJump.Text = "Super Jump"
superJump.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
superJump.TextColor3 = Color3.fromRGB(255, 255, 255)
superJump.Font = Enum.Font.Gotham
superJump.TextSize = 18
Instance.new("UICorner", superJump).CornerRadius = UDim.new(0, 10)

-- NOCLIP
local noclipBtn = Instance.new("TextButton", main)
noclipBtn.Size = UDim2.new(1, -20, 0, 35)
noclipBtn.Position = UDim2.new(0, 10, 0, 205)
noclipBtn.Text = "Noclip"
noclipBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
noclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipBtn.Font = Enum.Font.Gotham
noclipBtn.TextSize = 18
Instance.new("UICorner", noclipBtn).CornerRadius = UDim.new(0, 10)

-- FLY MOBILE
local flyBtn = Instance.new("TextButton", main)
flyBtn.Size = UDim2.new(1, -20, 0, 35)
flyBtn.Position = UDim2.new(0, 10, 0, 245)
flyBtn.Text = "Fly"
flyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
flyBtn.Font = Enum.Font.Gotham
flyBtn.TextSize = 18
Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0, 10)

-- PULSANTI FLY ORDINATI
local function flyButton(txt, pos)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(0.3, 0, 0, 30)
    b.Position = UDim2.new(pos, 0, 0, 285)
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

-- ESP
local espBtn = Instance.new("TextButton", main)
espBtn.Size = UDim2.new(1, -20, 0, 35)
espBtn.Position = UDim2.new(0, 10, 0, 325)
espBtn.Text = "ESP Player"
espBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.Font = Enum.Font.Gotham
espBtn.TextSize = 18
Instance.new("UICorner", espBtn).CornerRadius = UDim.new(0, 10)