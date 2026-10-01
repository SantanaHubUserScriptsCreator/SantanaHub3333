-- Santana Hub 2026 - By SantanaHubUserScriptsCreator
-- Compatible con Delta Executor
-- Esperar 2 segundos antes de cargar
wait(2)

-- Servicios
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Variables globales
local AutoShoot = false
local AutoPullGun = false
local AimbotEnabled = false
local ESPEnabled = false
local SpeedEnabled = false

-- Colores del tema
local BorderColor = Color3.fromRGB(138, 43, 226) -- Violeta-azulado
local PanelColor = Color3.fromRGB(15, 15, 15) -- Negro
local TextColor = Color3.fromRGB(255, 255, 255)
local ButtonOn = Color3.fromRGB(100, 50, 200)
local ButtonOff = Color3.fromRGB(50, 50, 50)
local AccentColor = Color3.fromRGB(170, 80, 255)

----------------------------------------------
-- CREAR GUI
----------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SantanaHub2026"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Frame principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 280,
  
