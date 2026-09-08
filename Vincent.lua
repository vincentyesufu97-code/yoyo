-- Simple Fly Script (legit)
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local flying = false
local speed = 3

local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")

UIS.InputBegan:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.F then
        flying = not flying
    end
end)

RS.RenderStepped:Connect(function()
    if flying then
        local cam = workspace.CurrentCamera
        local move = Vector3.new()

        if UIS:IsKeyDown(Enum.KeyCode.W) then
            move = move + cam.CFrame.LookVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.S) then
            move = move - cam.CFrame.LookVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.A) then
            move = move - cam.CFrame.RightVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.D) then
            move = move + cam.CFrame.RightVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then
            move = move + Vector3.new(0,1,0)
        end
        if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
            move = move - Vector3.new(0,1,0)
        end

        hrp.CFrame = hrp.CFrame + (move * speed)
    end
end)
