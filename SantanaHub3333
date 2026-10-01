-- SANTANA HUB 2026 - Duels (Mobile)
wait(1)

-- Pantalla de carga 5 segundos
local g = Instance.new("ScreenGui", game:GetService("CoreGui"))
g.Name = "SHLoading"
local f = Instance.new("Frame", g)
f.Size = UDim2.new(1,0,1,0)
f.BackgroundColor3 = Color3.fromRGB(0,0,0)
local t = Instance.new("TextLabel", f)
t.Size = UDim2.new(1,0,0.5,0)
t.Position = UDim2.new(0,0,0.25,0)
t.BackgroundTransparency = 1
t.Text = "SANTANA HUB 2026\nCargando..."
t.TextColor3 = Color3.fromRGB(138,43,226)
t.TextSize = 30
t.Font = Enum.Font.GothamBold

for i=1,5 do
    t.Text = "SANTANA HUB 2026\nCargando... "..i.."/5"
    wait(1)
end

t.Text = "SANTANA HUB 2026\n¡LISTO!"
wait(1)
g:Destroy()

-- Servicios
local P = game:GetService("Players")
local R = game:GetService("RunService")
local U = game:GetService("UserInputService")
local V = game:GetService("VirtualInputManager")
local LP = P.LocalPlayer
local Cam = workspace.CurrentCamera

-- Variables
local AutoShoot = false
local AutoPull = false
local Aimbot = false
local ESP = false
local Speed = false
local AutoFarm = false
local Visible = true

-- GUI
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
sg.Name = "SantanaHub2026"
sg.ResetOnSpawn = false

local mf = Instance.new("Frame", sg)
mf.Size = UDim2.new(0,220,0,320)
mf.Position = UDim2.new(0.5,-110,0.5,-160)
mf.BackgroundColor3 = Color3.fromRGB(15,15,15)
mf.Active = true
mf.Draggable = true
local s = Instance.new("UIStroke", mf)
s.Color = Color3.fromRGB(138,43,226)
s.Thickness = 3
local c = Instance.new("UICorner", mf)
c.CornerRadius = UDim.new(0,10)

-- Titulo
local tb = Instance.new("Frame", mf)
tb.Size = UDim2.new(1,0,0,30)
tb.BackgroundColor3 = Color3.fromRGB(138,43,226)
local tc = Instance.new("UICorner", tb)
tc.CornerRadius = UDim.new(0,10)
local tf2 = Instance.new("Frame", tb)
tf2.Size = UDim2.new(1,0,0,10)
tf2.Position = UDim2.new(0,0,1,-10)
tf2.BackgroundColor3 = Color3.fromRGB(138,43,226)
tf2.BorderSizePixel = 0

local tl = Instance.new("TextLabel", tb)
tl.Size = UDim2.new(1,-30,1,0)
tl.Position = UDim2.new(0,8,0,0)
tl.BackgroundTransparency = 1
tl.Text = "Santana Hub 2026"
tl.TextColor3 = Color3.fromRGB(255,255,255)
tl.TextSize = 14
tl.Font = Enum.Font.GothamBold
tl.TextXAlignment = Enum.TextXAlignment.Left

local xb = Instance.new("TextButton", tb)
xb.Size = UDim2.new(0,24,0,24)
xb.Position = UDim2.new(1,-28,0,3)
xb.BackgroundColor3 = Color3.fromRGB(200,50,50)
xb.Text = "X"
xb.TextColor3 = Color3.fromRGB(255,255,255)
xb.TextSize = 12
xb.Font = Enum.Font.GothamBold
local xbc = Instance.new("UICorner", xb)
xbc.CornerRadius = UDim.new(0,6)
xb.MouseButton1Click:Connect(function() mf.Visible = false end)

-- Scroll
local sc = Instance.new("ScrollingFrame", mf)
sc.Size = UDim2.new(1,-16,1,-38)
sc.Position = UDim2.new(0,8,0,34)
sc.BackgroundTransparency = 1
sc.ScrollBarThickness = 3
sc.ScrollBarImageColor3 = Color3.fromRGB(138,43,226)
sc.AutomaticCanvasSize = Enum.AutomaticSize.Y
sc.CanvasSize = UDim2.new(0,0,0,0)
local ll = Instance.new("UIListLayout", sc)
ll.Padding = UDim.new(0,5)
ll.SortOrder = Enum.SortOrder.LayoutOrder

-- BOTON FLOTANTE PARA CELULAR
local ToggleBtn = Instance.new("ImageButton", sg)
ToggleBtn.Size = UDim2.new(0,50,0,50)
ToggleBtn.Position = UDim2.new(0,10,0.5,-25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(138,43,226)
ToggleBtn.Image = "rbxassetid://3926305904"
ToggleBtn.ImageRectOffset = Vector2.new(4, 4)
ToggleBtn.ImageRectSize = Vector2.new(36, 36)
ToggleBtn.ImageColor3 = Color3.fromRGB(255,255,255)
ToggleBtn.Active = true
ToggleBtn.Draggable = true
local tbc = Instance.new("UICorner", ToggleBtn)
tbc.CornerRadius = UDim.new(1,0)
local tbs = Instance.new("UIStroke", ToggleBtn)
tbs.Color = Color3.fromRGB(255,255,255)
tbs.Thickness = 2

ToggleBtn.MouseButton1Click:Connect(function()
    Visible = not Visible
    mf.Visible = Visible
end)

-- Función botón
local function Btn(txt, num, cb)
    local bf = Instance.new("Frame", sc)
    bf.Size = UDim2.new(1,0,0,30)
    bf.BackgroundColor3 = Color3.fromRGB(40,40,40)
    bf.LayoutOrder = num
    local bfc = Instance.new("UICorner", bf)
    bfc.CornerRadius = UDim.new(0,8)
    local bfs = Instance.new("UIStroke", bf)
    bfs.Color = Color3.fromRGB(50,50,50)
    bfs.Thickness = 1
    local b = Instance.new("TextButton", bf)
    b.Size = UDim2.new(1,0,1,0)
    b.BackgroundTransparency = 1
    b.Text = txt..": OFF"
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.TextSize = 12
    b.Font = Enum.Font.GothamMedium
    local on = false
    b.MouseButton1Click:Connect(function()
        on = not on
        if on then
            bf.BackgroundColor3 = Color3.fromRGB(100,50,200)
            bfs.Color = Color3.fromRGB(170,80,255)
            b.Text = txt..": ON"
        else
            bf.BackgroundColor3 = Color3.fromRGB(40,40,40)
            bfs.Color = Color3.fromRGB(50,50,50)
            b.Text = txt..": OFF"
        end
        cb(on)
    end)
end

-- Botones
Btn("Auto Shoot",1,function(v) AutoShoot=v end)
Btn("Auto Pull Gun",2,function(v) AutoPull=v end)
Btn("Aimbot",3,function(v) Aimbot=v end)
Btn("ESP Players",4,function(v) ESP=v if not v then for _,p in pairs(P:GetPlayers()) do if p~=LP and p.Character then local h=p.Character:FindFirstChild("SESP") if h then h:Destroy() end end end end end)
Btn("Speed x2",5,function(v) Speed=v pcall(function() if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed = v and 32 or 16 end end) end)
Btn("Auto Farm",6,function(v) AutoFarm=v end)

-- Aimbot
local function GetClose()
    local cl,sn=nil,math.huge
    for _,p in pairs(P:GetPlayers()) do
        if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h and h.Health>0 then
                local pos=Cam:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
                local d=(Vector2.new(pos.X,pos.Y)-Vector2.new(LP:GetMouse().X,LP:GetMouse().Y)).Magnitude
                if d<sn and d<300 then sn=d cl=p end
            end
        end
    end
    return cl
end

-- ESP
local function MakeESP(p)
    if p~=LP and p.Character and not p.Character:FindFirstChild("SESP") then
        local hl=Instance.new("Highlight")
        hl.Name="SESP"
        hl.FillColor=Color3.fromRGB(138,43,226)
        hl.OutlineColor=Color3.fromRGB(255,255,255)
        hl.FillTransparency=0.5
        hl.Parent=p.Character
    end
end

-- Loop
R.RenderStepped:Connect(function()
    pcall(function()
        if Aimbot then
            local t2=GetClose()
            if t2 and t2.Character and t2.Character:FindFirstChild("HumanoidRootPart") then
                Cam.CFrame=CFrame.new(Cam.CFrame.Position,t2.Character.HumanoidRootPart.Position)
            end
        end
        if AutoShoot then
            V:SendMouseButtonEvent(0,0,0,true,game,1)
            task.wait(0.05)
            V:SendMouseButtonEvent(0,0,0,false,game,1)
        end
        if AutoPull and LP.Character then
            local tool=LP.Character:FindFirstChildWhichIsA("Tool")
            if not tool then
                for _,item in pairs(LP.Backpack:GetChildren()) do
                    if item:IsA("Tool") then LP.Character.Humanoid:EquipTool(item) break end
                end
            end
        end
        if ESP then
            for _,p in pairs(P:GetPlayers()) do MakeESP(p) end
        end
        if Speed and LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.WalkSpeed=32
        end
        if AutoFarm then
            for _,o in pairs(workspace:GetDescendants()) do
                if o:IsA("BasePart") and (o.Name:lower():find("coin") or o.Name:lower():find("gem") or o.Name:lower():find("event") or o.Name:lower():find("collect")) then
                    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                        LP.Character.HumanoidRootPart.CFrame=o.CFrame
                        task.wait(0.3)
                    end
                    break
                end
            end
        end
    end)
end)

print("Santana Hub 2026 cargado!")
