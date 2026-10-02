-- Santana Hub | Pruebas Duelos + Duelos Original  
-- Paste this entire script into your executor

local Players = game:GetService("Players")  
local UserInputService = game:GetService("UserInputService")  
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer  
local playerGui = player:WaitForChild("PlayerGui")

-- Remove existing instance if re-executed  
if playerGui:FindFirstChild("SantanaHub") then  
    playerGui.SantanaHub:Destroy()  
end

------------------------------------------------------------------------  
-- MAIN FRAME (Panel)  
------------------------------------------------------------------------  
local mainFrame = Instance.new("ScreenGui")  
mainFrame.Name = "SantanaHub"  
mainFrame.ResetOnSpawn = false  
mainFrame.ZIndexBehavior = Enum.ZIndexBehavior.Sibling  
mainFrame.Parent = playerGui

local panel = Instance.new("Frame")  
panel.Name = "MainPanel"  
panel.Size = UDim2.new(0, 320, 0, 420)  
panel.Position = UDim2.new(0, 12, 0, 50)  
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 30)  
panel.BorderSizePixel = 0  
panel.Visible = false  
panel.Parent = mainFrame

local panelCorner = Instance.new("UICorner")  
panelCorner.CornerRadius = UDim.new(0, 8)  
panelCorner.Parent = panel

-- Drop shadow  
local shadow = Instance.new("Frame")  
shadow.Name = "Shadow"  
shadow.Size = UDim2.new(1, 10, 1, 10)  
shadow.Position = UDim2.new(0, -5, 0, -5)  
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  
shadow.BackgroundTransparency = 0.7  
shadow.BorderSizePixel = 0  
shadow.ZIndex = -1  
shadow.Parent = panel

local shadowCorner = Instance.new("UICorner")  
shadowCorner.CornerRadius = UDim.new(0, 12)  
shadowCorner.Parent = shadow

------------------------------------------------------------------------  
-- HEADER  
------------------------------------------------------------------------  
local header = Instance.new("Frame")  
header.Name = "Header"  
header.Size = UDim2.new(1, 0, 0, 36)  
header.BackgroundColor3 = Color3.fromRGB(30, 30, 45)  
header.BorderSizePixel = 0  
header.Parent = panel

local headerCorner = Instance.new("UICorner")  
headerCorner.CornerRadius = UDim.new(0, 8)  
headerCorner.Parent = header

local headerFix = Instance.new("Frame")  
headerFix.Size = UDim2.new(1, 0, 0, 12)  
headerFix.Position = UDim2.new(0, 0, 1, -12)  
headerFix.BackgroundColor3 = Color3.fromRGB(30, 30, 45)  
headerFix.BorderSizePixel = 0  
headerFix.Parent = header

local headerLabel = Instance.new("TextLabel")  
headerLabel.Name = "Title"  
headerLabel.Size = UDim2.new(1, -80, 1, 0)  
headerLabel.Position = UDim2.new(0, 12, 0, 0)  
headerLabel.BackgroundTransparency = 1  
headerLabel.Text = "Santana Hub |"  
headerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  
headerLabel.TextScaled = true  
headerLabel.Font = Enum.Font.GothamBold  
headerLabel.TextXAlignment = Enum.TextXAlignment.Left  
headerLabel.Parent = header

-- Close button  
local closeBtn = Instance.new("TextButton")  
closeBtn.Name = "Close"  
closeBtn.Size = UDim2.new(0, 30, 0, 30)  
closeBtn.Position = UDim2.new(1, -36, 0, 3)  
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)  
closeBtn.Text = "✕"  
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)  
closeBtn.TextScaled = true  
closeBtn.Font = Enum.Font.GothamBold  
closeBtn.BorderSizePixel = 0  
closeBtn.Parent = header

local closeCorner = Instance.new("UICorner")  
closeCorner.CornerRadius = UDim.new(0, 6)  
closeCorner.Parent = closeBtn

------------------------------------------------------------------------  
-- FOOTER (username + profile pic)  
------------------------------------------------------------------------  
local footer = Instance.new("Frame")  
footer.Name = "Footer"  
footer.Size = UDim2.new(1, 0, 0, 32)  
footer.Position = UDim2.new(0, 0, 1, -32)  
footer.BackgroundColor3 = Color3.fromRGB(18, 18, 28)  
footer.BorderSizePixel = 0  
footer.Parent = panel

local footerCorner = Instance.new("UICorner")  
footerCorner.CornerRadius = UDim.new(0, 8)  
footerCorner.Parent = footer

local footerFix = Instance.new("Frame")  
footerFix.Size = UDim2.new(1, 0, 0, 12)  
footerFix.BackgroundColor3 = Color3.fromRGB(18, 18, 28)  
footerFix.BorderSizePixel = 0  
footerFix.Parent = footer

local profilePic = Instance.new("ImageLabel")  
profilePic.Name = "Avatar"  
profilePic.Size = UDim2.new(0, 24, 0, 24)  
profilePic.Position = UDim2.new(0, 8, 0.5, -12)  
profilePic.BackgroundTransparency = 1  
profilePic.Image = player.AvatarImageSrc or ""  
profilePic.Parent = footer

local profileCorner = Instance.new("UICorner")  
profileCorner.CornerRadius = UDim.new(1, 0)  
profileCorner.Parent = profilePic

local usernameLabel = Instance.new("TextLabel")  
usernameLabel.Name = "Username"  
usernameLabel.Size = UDim2.new(1, -44, 1, 0)  
usernameLabel.Position = UDim2.new(0, 38, 0, 0)  
usernameLabel.BackgroundTransparency = 1  
usernameLabel.Text = player.DisplayName or player.Name  
usernameLabel.TextColor3 = Color3.fromRGB(140, 140, 155)  
usernameLabel.TextScaled = true  
usernameLabel.Font = Enum.Font.Gotham  
usernameLabel.TextXAlignment = Enum.TextXAlignment.Left  
usernameLabel.Parent = footer

------------------------------------------------------------------------  
-- CONTENT AREA (tabs)  
------------------------------------------------------------------------  
local content = Instance.new("Frame")  
content.Name = "Content"  
content.Size = UDim2.new(1, 0, 1, -68)  
content.Position = UDim2.new(0, 0, 0, 36)  
content.BackgroundTransparency = 1  
content.Parent = panel

local tabBar = Instance.new("ScrollingFrame")  
tabBar.Name = "TabBar"  
tabBar.Size = UDim2.new(0, 60, 1, 0)  
tabBar.Position = UDim2.new(0, 4, 0, 4)  
tabBar.BackgroundTransparency = 1  
tabBar.ScrollBarThickness = 0  
tabBar.BorderSizePixel = 0  
tabBar.CanvasSize = UDim2.new(0, 0, 0, 0)  
tabBar.AutomaticCanvasSize = Enum.AutomaticSize.Y  
tabBar.Parent = content

local tabLayout = Instance.new("UIListLayout")  
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder  
tabLayout.Padding = UDim.new(0, 4)  
tabLayout.Parent = tabBar

------------------------------------------------------------------------  
-- TAB DEFINITIONS  
------------------------------------------------------------------------  
local tabs = {  
    { name = "Main",    icon = "🏠" },  
    { name = "ESP",     icon = "👁️" },  
    { name = "Gun",     icon = "🔫" },  
    { name = "Farm",    icon = "🌾" },  
    { name = "Animations", icon = "🎬" },  
    { name = "Misc",    icon = "📦" },  
    { name = "Config",  icon = "⚙️" },  
}

local tabPages = {}  
local currentTab = nil

for i, tabData in ipairs(tabs) do  
    local tabBtn = Instance.new("TextButton")  
    tabBtn.Name = tabData.name  
    tabBtn.Size = UDim2.new(1, -8, 0, 44)  
    tabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)  
    tabBtn.Text = tabData.icon .. " " .. tabData.name  
    tabBtn.TextColor3 = Color3.fromRGB(180, 180, 200)  
    tabBtn.TextScaled = true  
    tabBtn.Font = Enum.Font.GothamSemibold  
    tabBtn.BorderSizePixel = 0  
    tabBtn.LayoutOrder = i  
    tabBtn.Parent = tabBar

    local tabCorner = Instance.new("UICorner")  
    tabCorner.CornerRadius = UDim.new(0, 6)  
    tabCorner.Parent = tabBtn

    local page = Instance.new("Frame")  
    page.Name = tabData.name .. "Page"  
    page.Size = UDim2.new(1, -68, 1, 0)  
    page.Position = UDim2.new(0, 68, 0, 4)  
    page.BackgroundTransparency = 1  
    page.Visible = false  
    page.Parent = content

    tabPages[tabData.name] = page

    tabBtn.MouseButton1Click:Connect(function()  
        if currentTab then  
            currentTab.BackgroundColor3 = Color3.fromRGB(35, 35, 50)  
            currentTab.TextColor3 = Color3.fromRGB(180, 180, 200)  
            tabPages[currentTab.Name]:Visible(false)  
        end  
        tabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)  
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)  
        page.Visible(true)  
        currentTab = tabBtn  
    end)  
end

-- Default tab  
tabPages["Main"].Visible(true)  
tabBar["Main"].BackgroundColor3 = Color3.fromRGB(50, 50, 70)  
tabBar["Main"].TextColor3 = Color3.fromRGB(255, 255, 255)  
currentTab = tabBar["Main"]

------------------------------------------------------------------------  
-- TOGGLE BUTTON (floating, gradient pink→orange)  
------------------------------------------------------------------------  
local toggleBtn = Instance.new("TextButton")  
toggleBtn.Name = "ToggleButton"  
toggleBtn.Size = UDim2.new(0, 50, 0, 50)  
toggleBtn.Position = UDim2.new(0, 12, 0, 12)  
toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  
toggleBtn.Text = ""  
toggleBtn.BorderSizePixel = 0  
toggleBtn.Parent = mainFrame

local gradient = Instance.new("UIGradient")  
gradient.Color = ColorSequence.new{  
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 120)),  
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 40)),  
}  
gradient.Rotation = 90  
gradient.Parent = toggleBtn

local btnCorner = Instance.new("UICorner")  
btnCorner.CornerRadius = UDim.new(0, 12)  
btnCorner.Parent = toggleBtn

local eyeIcon = Instance.new("TextLabel")  
eyeIcon.Size = UDim2.new(0, 16, 0, 16)  
eyeIcon.Position = UDim2.new(0, 6, 0.5, -16)  
eyeIcon.BackgroundTransparency = 1  
eyeIcon.Text = "👁️"  
eyeIcon.TextScaled = true  
eyeIcon.Parent = toggleBtn

local crosshairIcon = Instance.new("TextLabel")  
crosshairIcon.Size = UDim2.new(0, 16, 0, 16)  
crosshairIcon.Position = UDim2.new(0, 24, 0.5, -16)  
crosshairIcon.BackgroundTransparency = 1  
crosshairIcon.Text = "🎯"  
crosshairIcon.TextScaled = true  
crosshairIcon.Parent = toggleBtn

local gearIcon = Instance.new("TextLabel")  
gearIcon.Size = UDim2.new(0, 16, 0, 16)  
gearIcon.Position = UDim2.new(0, 42, 0.5, -16)  
gearIcon.BackgroundTransparency = 1  
gearIcon.Text = "⚙️"  
gearIcon.TextScaled = true  
gearIcon.Parent = toggleBtn

------------------------------------------------------------------------  
-- DRAG BEHAVIOR (panel)  
------------------------------------------------------------------------  
local dragging = false  
local dragStart, startPos

header.InputBegan:Connect(function(input)  
    if input.UserInputType == Enum.UserInputType.MouseButton1 then  
        dragging = true  
        dragStart = input.Position  
        startPos = panel.Position  
        input.Changed:Connect(function()  
            if input.UserInputState == Enum.UserInputState.End then  
                dragging = false  
            end  
        end)  
    end  
end)

UserInputService.InputChanged:Connect(function(input)  
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then  
        local delta = input.Position - dragStart  
        panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)  
    end  
end)

------------------------------------------------------------------------  
-- TOGGLE PANEL VISIBILITY  
------------------------------------------------------------------------  
toggleBtn.MouseButton1Click:Connect(function()  
    panel.Visible = not panel.Visible  
end)

closeBtn.MouseButton1Click:Connect(function()  
    panel.Visible = false  
end)

-- Keyboard shortcut: RightShift to toggle  
UserInputService.InputBegan:Connect(function(input, processed)  
    if processed then return end  
    if input.KeyCode == Enum.KeyCode.RightShift then  
        panel.Visible = not panel.Visible  
    end  
end)

print("[Santana Hub] Loaded successfully. Press RightShift to toggle panel.")  
