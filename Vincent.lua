-- Simple Universal GUI (works in any game)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ButtonSpeed = Instance.new("TextButton")
local ButtonJump = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Size = UDim2.new(0, 200, 0, 120)
Frame.Position = UDim2.new(0, 20, 0, 20)

ButtonSpeed.Parent = Frame
ButtonSpeed.Text = "Speed 50"
ButtonSpeed.Size = UDim2.new(0, 180, 0, 40)
ButtonSpeed.Position = UDim2.new(0, 10, 0, 10)
ButtonSpeed.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ButtonSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)

ButtonJump.Parent = Frame
ButtonJump.Text = "Jump 100"
ButtonJump.Size = UDim2.new(0, 180, 0, 40)
ButtonJump.Position = UDim2.new(0, 10, 0, 60)
ButtonJump.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ButtonJump.TextColor3 = Color3.fromRGB(255, 255, 255)

ButtonSpeed.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
end)

ButtonJump.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
end)
