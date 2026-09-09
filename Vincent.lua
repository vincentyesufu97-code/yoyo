-- VINCENT HUB DEFINITIVO (LEGIT)
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

-- RICONNESSIONE DOPO LA MORTE
player.CharacterAdded:Connect(function(newChar)
    char = newChar
    hum = newChar:WaitForChild("Humanoid")
end)

-- GUI IN COREGUI (NON SCOMPARE MAI)
local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui")

-- MINI MENU TONDO CON V
local mini = Instance.new("TextButton", gui)
mini.Size = UDim2.new(0, 60, 0, 60)
mini.Position = UDim2.new(0, 20, 0, 20)
mini.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mini.Text = "V"
mini.TextColor3 = Color3.fromRGB(255, 255, 255)
mini.Font = Enum.Font.GothamBold
mini.TextSize = 30
mini.Active = true
mini.Draggable = true

local miniCorner = Instance.new("UICorner", mini)
miniCorner.CornerRadius = UDim.new(1, 0)

local miniStroke = Instance.new("UIStroke", mini)
miniStroke.Color = Color3.fromRGB(255, 255, 255)
miniStroke.Thickness = 2

-- MENU GRANDE MODERNO ARROTONDATO
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 320, 0, 450)
main.Position = UDim2.new(0, 20, 0, 100)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.Visible = false
main.Active = true
main.Draggable = true

local mainCorner = Instance.new("UICorner", main)
mainCorner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 45)
title.Text = "Vincent Hub"
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 22

local titleCorner = Instance.new("UICorner", title)
titleCorner.CornerRadius = UDim.new(0, 12)

-- MINIMIZZA / MASSIMIZZA COME CHROME
local toggleSize = Instance.new("TextButton", main)
toggleSize.Size = UDim2.new(0, 40, 0, 40)
toggleSize.Position = UDim2.new(1, -50, 0, 5)
toggleSize.Text = "□"
toggleSize.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggleSize.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleSize.Font = Enum.Font.GothamBold
toggleSize.TextSize = 22

local toggleCorner = Instance.new("UICorner", toggleSize)
toggleCorner.CornerRadius = UDim.new(0, 10)

local big = true
toggleSize.MouseButton1Click:Connect(function()
    if big then
        main.Size = UDim2.new(0, 200, 0, 300)
        big = false
    else
        main.Size = UDim2.new(0, 320, 0, 450)
        big = true
    end
end)

-- APRI/CHIUDI MENU
mini.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- INPUT BOX FUNZIONE
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

    local boxCorner = Instance.new("UICorner", box)
    boxCorner.CornerRadius = UDim.new(0, 8)

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

local superJumpCorner = Instance.new("UICorner", superJumpBtn)
superJumpCorner.CornerRadius = UDim.new(0, 10)

superJumpBtn.MouseButton1Click:Connect(function()
    char.HumanoidRootPart.Velocity = Vector3.new(0, 120, 0)
end)

-- NOCLIP STABILE
local noclip = false
local noclipBtn = Instance.new("TextButton", main)
noclipBtn.Size = UDim2.new(1, -20, 0, 35)
noclipBtn.Position = UDim2.new(0, 10, 0, 245)
noclipBtn.Text = "Noclip ON/OFF"
noclipBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
noclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipBtn.Font = Enum.Font.Gotham
noclipBtn.TextSize = 18

local noclipCorner = Instance.new("UICorner", noclipBtn)
noclipCorner.CornerRadius = UDim.new(0, 10)

noclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclip and char then
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)

-- FLY FLUIDO CONTROLLABILE (SPACE SU, CTRL GIÙ)
local flying = false
local flySpeed = 2

local flyBtn = Instance.new("TextButton", main)
flyBtn.Size = UDim2.new(1, -20, 0, 35)
flyBtn.Position = UDim2.new(0, 10, 0, 290)
flyBtn.Text = "Fly Fluido ON/OFF"
flyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
flyBtn.Font = Enum.Font.Gotham
flyBtn.TextSize = 18

local flyCorner = Instance.new("UICorner", flyBtn)
flyCorner.CornerRadius = UDim.new(0, 10)

flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if flying and char then
        local cam = workspace.CurrentCamera
        local dir = cam.CFrame.LookVector
        local root = char:FindFirstChild("HumanoidRootPart")

        if root then
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                root.CFrame = root.CFrame + Vector3.new(0, flySpeed, 0)
            elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
                root.CFrame = root.CFrame - Vector3.new(0, flySpeed, 0)
            else
                root.CFrame = root.CFrame + dir * flySpeed
            end
        end
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

local espCorner = Instance.new("UICorner", espBtn)
espCorner.CornerRadius = UDim.new(0, 10)

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