-- Santana Hub 2026
local P=game:GetService("Players")
local LP=P.LocalPlayer
local UIS=game:GetService("UserInputService")
local R=game:GetService("RunService")
local TS=game:GetService("TweenService")
local VIM=game:GetService("VirtualInputManager")
local Cam=workspace.CurrentCamera
local S={}

-- Anti-Kick suave (sin metatables agresivos)
pcall(function()
    if LP then
        LP.Kick=function() return nil end
    end
end)
pcall(function()
    local c=LP.Character or LP.CharacterAdded:Wait()
    local h=c:FindFirstChildOfClass("Humanoid")
    if h then h:SetStateEnabled(Enum.HumanoidStateType.Dead,false) end
end)
LP.CharacterAdded:Connect(function(c)
    local h=c:WaitForChild("Humanoid",5)
    if h then h:SetStateEnabled(Enum.HumanoidStateType.Dead,false) end
end)

-- Anti-Idle
pcall(function()
    local vu=game:GetService("VirtualUser")
    LP.Idled:Connect(function() vu:CaptureController() vu:ClickButton2(Vector2.new()) end)
end)

-- GUI
local gui=Instance.new("ScreenGui",game:GetService("CoreGui"))
gui.ResetOnSpawn=false
gui.Name="SanHub"

-- PANEL
local main=Instance.new("Frame",gui)
main.Size=UDim
