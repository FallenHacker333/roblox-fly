-- GUI + Fly Script for Arceus X
local UIS = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()
local HRP = Char:WaitForChild("HumanoidRootPart")

-- GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local FlyBtn = Instance.new("TextButton", ScreenGui)

FlyBtn.Text = "Fly"
FlyBtn.Size = UDim2.new(0, 100, 0, 50)
FlyBtn.Position = UDim2.new(0.9, -110, 0.8, 0)
FlyBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyBtn.TextScaled = true

-- Fly Variables
local flying = false
local speed = 50

function Fly()
    local bv = Instance.new("BodyVelocity", HRP)
    bv.Name = "FlyVelocity"
    bv.MaxForce = Vector3.new(1, 1, 1) * math.huge
    bv.Velocity = Vector3.zero

    game:GetService("RunService").Heartbeat:Connect(function()
        if flying then
            local cam = workspace.CurrentCamera
            bv.Velocity = cam.CFrame.LookVector * speed
        else
            bv:Destroy()
        end
    end)
end

FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    if flying then
        FlyBtn.Text = "Flying..."
        Fly()
    else
        FlyBtn.Text = "Fly"
    end
end)
