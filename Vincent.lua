-- VINCENT HUB (SIDEBAR + FEATURES PAGE) LEGIT
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

-- MENU PRINCIPALE
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 500, 0, 400)
main.Position = UDim2.new(0, 90, 0, 100)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.Visible = false
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local mainGlow = Instance.new("UIStroke", main)
mainGlow.Color = Color3.fromRGB(0, 140, 255)
mainGlow.Thickness = 2

mini.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- SIDEBAR SINISTRA
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0, 140, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 12)

local sidebarGlow = Instance.new("UIStroke", sidebar)
sidebarGlow.Color = Color3.fromRGB(0, 140, 255)
sidebarGlow.Thickness = 2

-- PULSANTE FEATURES
local featuresBtn = Instance.new("TextButton", sidebar)
featuresBtn.Size = UDim2.new(1, -20, 0, 40)
featuresBtn.Position = UDim2.new(0, 10, 0, 20)
featuresBtn.Text = "Features"
featuresBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
featuresBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
featuresBtn.Font = Enum.Font.GothamBold
featuresBtn.TextSize = 18
Instance.new("UICorner", featuresBtn).CornerRadius = UDim.new(0, 10)

-- PAGINA FEATURES (DESTRA)
local page = Instance.new("Frame", main)
page.Size = UDim2.new(1, -140, 1, 0)
page.Position = UDim2.new(0, 140, 0, 0)
page.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Instance.new("UICorner", page).CornerRadius = UDim.new(0, 12)

local pageGlow = Instance.new("UIStroke", page)
pageGlow.Color = Color3.fromRGB(0, 140, 255)
pageGlow.Thickness = 2

-- TITOLO PAGINA
local title = Instance.new("TextLabel", page)
title.Size = UDim2.new(1, 0, 0, 45)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Features"
title.TextColor3 = Color3.fromRGB(0, 140, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.BackgroundTransparency = 1

-- FUNZIONE PER CREARE PULSANTI ON/OFF
local function makeToggle(name, posY)
    local btn = Instance.new("TextButton", page)
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.Text = name .. " OFF"
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 18
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    return btn
end

---------------------------------------------------------
-- FEATURES LEGIT MIGLIORATI
---------------------------------------------------------

-- SPEED
local speedOn = false
local speedBtn = makeToggle("Speed", 60)
speedBtn.MouseButton1Click:Connect(function()
    speedOn = not speedOn
    speedBtn.Text = speedOn and "Speed ON" or "Speed OFF"
    hum.WalkSpeed = speedOn and 50 or 16
end)

-- JUMP
local jumpOn = false
local jumpBtn = makeToggle("Jump", 110)
jumpBtn.MouseButton1Click:Connect(function()
    jumpOn = not jumpOn
    jumpBtn.Text = jumpOn and "Jump ON" or "Jump OFF"
    hum.JumpPower = jumpOn and 100 or 50
end)

-- SUPER JUMP
local superOn = false
local superBtn = makeToggle("Super Jump", 160)
superBtn.MouseButton1Click:Connect(function()
    superOn = not superOn
    superBtn.Text = superOn and "Super Jump ON" or "Super Jump OFF"
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if superOn then
        char.HumanoidRootPart.Velocity = Vector3.new(0, 120, 0)
    end
end)

-- NOCLIP
local noclipOn = false
local noclipBtn = makeToggle("Noclip", 210)
noclipBtn.MouseButton1Click:Connect(function()
    noclipOn = not noclipOn
    noclipBtn.Text = noclipOn and "Noclip ON" or "Noclip OFF"
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclipOn and char then
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- ESP PLAYER (avatar + nome)
local espOn = false
local espBtn = makeToggle("ESP Player", 260)

espBtn.MouseButton1Click:Connect(function()
    espOn = not espOn
    espBtn.Text = espOn and "ESP Player ON" or "ESP Player OFF"

    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            if espOn then
                local h = Instance.new("Highlight", plr.Character)
                h.FillColor = Color3.fromRGB(0, 140, 255)
                h.OutlineColor = Color3.fromRGB(255, 255, 255)

                local nameTag = Instance.new("BillboardGui", plr.Character)
                nameTag.Size = UDim2.new(0, 100, 0, 30)
                nameTag.Adornee = plr.Character:FindFirstChild("Head")
                nameTag.AlwaysOnTop = true

                local txt = Instance.new("TextLabel", nameTag)
                txt.Size = UDim2.new(1, 0, 1, 0)
                txt.BackgroundTransparency = 1
                txt.Text = plr.Name
                txt.TextColor3 = Color3.fromRGB(0, 140, 255)
                txt.Font = Enum.Font.GothamBold
                txt.TextSize = 18
            else
                for _, v in pairs(plr.Character:GetChildren()) do
                    if v:IsA("Highlight") or v:IsA("BillboardGui") then
                        v:Destroy()
                    end
                end
            end
        end
    end
end)

-- ANTI AFK
local afkOn = false
local afkBtn = makeToggle("Anti-AFK", 310)

local vu = game:GetService("VirtualUser")

afkBtn.MouseButton1Click:Connect(function()
    afkOn = not afkOn
    afkBtn.Text = afkOn and "Anti-AFK ON" or "Anti-AFK OFF"
end)

player.Idled:Connect(function()
    if afkOn then
        vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end
end)