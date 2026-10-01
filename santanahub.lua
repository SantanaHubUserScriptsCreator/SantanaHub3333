-- Santana Hub 2026
local P=game:GetService("Players")
local LP=P.LocalPlayer
local UIS=game:GetService("UserInputService")
local R=game:GetService("RunService")
local TS=game:GetService("TweenService")
local VIM=game:GetService("VirtualInputManager")
local Cam=workspace.CurrentCamera
local S={}

-- Anti-Kick
pcall(function()
    local mt=getrawmetatable(game)
    local old=mt.__namecall
    setreadonly(mt,false)
    mt.__namecall=newcclosure(function(self,...)
        local m=getnamecallmethod()
        if m=="Kick" or m=="kick" or m=="Teleport" or m=="TeleportToPlaceInstance" then return nil end
        return old(self,...)
    end)
    setreadonly(mt,true)
end)
pcall(function() LP.Kick=function() return nil end end)
pcall(function() LP.Idled:Connect(function() end) end)

-- GUI
local gui=Instance.new("ScreenGui",game:GetService("CoreGui"))
gui.ResetOnSpawn=false

local main=Instance.new("Frame",gui)
main.Size=UDim2.new(0,220,0,300)
main.Position=UDim2.new(0.5,-110,0.5,-150)
main.BackgroundColor3=Color3.fromRGB(12,12,18)
main.BorderSizePixel=0
main.Visible=false
Instance.new("UICorner",main).CornerRadius=UDim.new(0,10)
local stroke=Instance.new("UIStroke",main)
stroke.Color=Color3.fromRGB(130,50,230)
stroke.Thickness=1.5

-- Top bar ( x | San Hub )
local bar=Instance.new("Frame",main)
bar.Size=UDim2.new(1,0,0,32)
bar.BackgroundColor3=Color3.fromRGB(18,18,26)
bar.BorderSizePixel=0
Instance.new("UICorner",bar).CornerRadius=UDim.new(0,10)
local barFix=Instance.new("Frame",bar)
barFix.Size=UDim2.new(1,0,0,8)
barFix.Position=UDim2.new(0,0,1,-8)
barFix.BackgroundColor3=Color3.fromRGB(18,18,26)
barFix.BorderSizePixel=0

-- ( x | San Hub )
local lbl=Instance.new("TextLabel",bar)
lbl.Size=UDim2.new(1,-10,1,0)
lbl.Position=UDim2.new(0,8,0,0)
lbl.BackgroundTransparency=1
lbl.RichText=true
lbl.Text='<font color="#aa6aff">(</font> <font color="#ff5555">x</font> <font color="#aa6aff">|</font> San Hub <font color="#aa6aff">)</font>'
lbl.TextColor3=Color3.fromRGB(220,220,235)
lbl.TextSize=13
lbl.Font=Enum.Font.GothamBold
lbl.TextXAlignment=Enum.TextXAlignment.Left

-- x drag button
local xb=Instance.new("TextButton",bar)
xb.Size=UDim2.new(0,18,0,16)
xb.Position=UDim2.new(0,20,0,8)
xb.BackgroundTransparency=1
xb.Text=""
xb.ZIndex=5

-- Drag
local dragging,dragStart,startPos=false
xb.MouseButton1Down:Connect(function()
    dragging=true
    dragStart=UIS:GetMouseLocation()
    startPos=main.Position
end)
UIS.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dragging=false end
end)
R.RenderStepped:Connect(function()
    if dragging then
        local d=UIS:GetMouseLocation()-dragStart
        main.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
    end
end)

-- Scroll
local sc=Instance.new("ScrollingFrame",main)
sc.Size=UDim2.new(1,-10,1,-38)
sc.Position=UDim2.new(0,5,0,35)
sc.BackgroundTransparency=1
sc.ScrollBarThickness=2
sc.ScrollBarImageColor3=Color3.fromRGB(130,50,230)
sc.AutomaticCanvasSize=Enum.AutomaticSize.Y
sc.CanvasSize=UDim2.new(0,0,0,0)
sc.BorderSizePixel=0
Instance.new("UIListLayout",sc).Padding=UDim.new(0,3)

-- Section
local function Sec(txt)
    local f=Instance.new("TextLabel",sc)
    f.Size=UDim2.new(1,0,0,20)
    f.BackgroundTransparency=1
    f.Text="— "..txt.." —"
    f.TextColor3=Color3.fromRGB(130,50,230)
    f.TextSize=10
    f.Font=Enum.Font.GothamBlack
end

-- Toggle button
local function Btn(name,cb)
    local f=Instance.new("Frame",sc)
    f.Size=UDim2.new(1,0,0,30)
    f.BackgroundColor3=Color3.fromRGB(20,20,30)
    f.BorderSizePixel=0
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)

    local nl=Instance.new("TextLabel",f)
    nl.Size=UDim2.new(1,-50,1,0)
    nl.Position=UDim2.new(0,10,0,0)
    nl.BackgroundTransparency=1
    nl.Text=name
    nl.TextColor3=Color3.fromRGB(200,200,215)
    nl.TextSize=11
    nl.Font=Enum.Font.Gotham
    nl.TextXAlignment=Enum.TextXAlignment.Left

    local tb=Instance.new("Frame",f)
    tb.Size=UDim2.new(0,30,0,14)
    tb.Position=UDim2.new(1,-40,0.5,-7)
    tb.BackgroundColor3=Color3.fromRGB(35,35,50)
    Instance.new("UICorner",tb).CornerRadius=UDim.new(1,0)

    local tc=Instance.new("Frame",tb)
    tc.Size=UDim2.new(0,10,0,10)
    tc.Position=UDim2.new(0,2,0,2)
    tc.BackgroundColor3=Color3.fromRGB(100,100,120)
    Instance.new("UICorner",tc).CornerRadius=UDim.new(1,0)

    local btn=Instance.new("TextButton",f)
    btn.Size=UDim2.new(1,0,1,0)
    btn.BackgroundTransparency=1
    btn.Text=""

    local on=false
    btn.MouseButton1Click:Connect(function()
        on=not on
        if on then
            TS:Create(tb,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(130,50,230)}):Play()
            TS:Create(tc,TweenInfo.new(0.2),{Position=UDim2.new(1,-12,0,2),BackgroundColor3=Color3.fromRGB(255,255,255)}):Play()
            TS:Create(f,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(30,15,55)}):Play()
        else
            TS:Create(tb,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(35,35,50)}):Play()
            TS:Create(tc,TweenInfo.new(0.2),{Position=UDim2.new(0,2,0,2),BackgroundColor3=Color3.fromRGB(100,100,120)}):Play()
            TS:Create(f,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(20,20,30)}):Play()
        end
        cb(on)
    end)
end

-- FEATURES
Sec("Combat")
Btn("Auto Shoot",function(v) S.Shoot=v end)
Btn("Aimbot",function(v) S.Aim=v end)
Btn("Auto Pull Gun",function(v) S.Pull=v end)

Sec("Visual")
Btn("ESP Players",function(v) S.ESP=v if not v then for _,p in pairs(P:GetPlayers()) do if p~=LP and p.Character then local h=p.Character:FindFirstChild("SH_H") if h then h:Destroy() end end end end end)
Btn("ESP Names",function(v) S.Names=v if not v then for _,p in pairs(P:GetPlayers()) do if p~=LP and p.Character then local b=p.Character:FindFirstChild("SH_N") if b then b:Destroy() end end end end end)

Sec("Movement")
Btn("Speed x2",function(v) S.Sp2=v pcall(function() LP.Character.Humanoid.WalkSpeed=v and 32 or 16 end) end)
Btn("Speed x3",function(v) S.Sp3=v pcall(function() LP.Character.Humanoid.WalkSpeed=v and 48 or 16 end) end)
Btn("Infinite Jump",function(v) S.IJ=v end)

Sec("Misc")
Btn("Auto Farm",function(v) S.Farm=v end)

-- Footer
local ft=Instance.new("TextLabel",sc)
ft.Size=UDim2.new(1,0,0,20)
ft.BackgroundTransparency=1
ft.Text="San Hub Premium v2026"
ft.TextColor3=Color3.fromRGB(50,50,70)
ft.TextSize=8
ft.Font=Enum.Font.Gotham

-- Float button (SH)
local fb=Instance.new("ImageButton",gui)
fb.Size=UDim2.new(0,40,0,40)
fb.Position=UDim2.new(0,10,0.5,-20)
fb.BackgroundColor3=Color3.fromRGB(12,12,18)
fb.AutoButtonColor=false
fb.BorderSizePixel=0
fb.Draggable=true
Instance.new("UICorner",fb).CornerRadius=UDim.new(1,0)
Instance.new("UIStroke",fb).Color=Color3.fromRGB(130,50,230)
local ft2=Instance.new("TextLabel",fb)
ft2.Size=UDim2.new(1,0,1,0)
ft2.BackgroundTransparency=1
ft2.Text="SH"
ft2.TextColor3=Color3.fromRGB(255,255,255)
ft2.TextSize=12
ft2.Font=Enum.Font.GothamBlack

local pv=false
fb.MouseButton1Click:Connect(function()
    pv=not pv
    if pv then
        main.Visible=true
        main.Size=UDim2.new(0,0,0,0)
        TS:Create(main,TweenInfo.new(0.3,Enum.EasingStyle.Back),{Size=UDim2.new(0,220,0,300),Position=UDim2.new(0.5,-110,0.5,-150)}):Play()
    else
        TS:Create(main,TweenInfo.new(0.2),{Size=UDim2.new(0,0,0,0),Position=UDim2.new(0.5,0,0.5,0)}):Play()
        wait(0.25)
        if not pv then main.Visible=false end
    end
end)

-- Inf Jump
UIS.JumpRequest:Connect(function()
    if S.IJ then pcall(function() LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end) end
end)

-- Aimbot
local function GC()
    local c,d=nil,math.huge
    for _,p in pairs(P:GetPlayers()) do
        if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local h=p.Character:FindFirstChildOfClass("Humanoid")
            if h and h.Health>0 then
                local pos=Cam:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
                local dist=(Vector2.new(pos.X,pos.Y)-Vector2.new(LP:GetMouse().X,LP:GetMouse().Y)).Magnitude
                if dist<d and dist<280 then d=dist c=p end
            end
        end
    end
    return c
end

-- Main loop
R.RenderStepped:Connect(function()
    pcall(function()
        if S.Aim then local t=GC() if t then Cam.CFrame=CFrame.new(Cam.CFrame.Position,t.Character.HumanoidRootPart.Position) end end
        if S.Shoot then VIM:SendMouseButtonEvent(0,0,0,true,game,1) task.wait(0.05) VIM:SendMouseButtonEvent(0,0,0,false,game,1) end
        if S.Pull and LP.Character and not LP.Character:FindFirstChildWhichIsA("Tool") then for _,i in pairs(LP.Backpack:GetChildren()) do if i:IsA("Tool") then LP.Character.Humanoid:EquipTool(i) break end end end
        if S.ESP then for _,p in pairs(P:GetPlayers()) do if p~=LP and p.Character and not p.Character:FindFirstChild("SH_H") then local hl=Instance.new("Highlight") hl.Name="SH_H" hl.FillColor=Color3.fromRGB(130,50,230) hl.OutlineColor=Color3.new(1,1,1) hl.FillTransparency=0.6 hl.Parent=p.Character end end end
        if S.Names then for _,p in pairs(P:GetPlayers()) do if p~=LP and p.Character and p.Character:FindFirstChild("Head") and not p.Character:FindFirstChild("SH_N") then local b=Instance.new("BillboardGui") b.Name="SH_N" b.Size=UDim2.new(0,100,0,18) b.StudsOffset=Vector3.new(0,2.5,0) b.AlwaysOnTop=true b.Parent=p.Character.Head local l=Instance.new("TextLabel",b) l.Size=UDim2.new(1,0,1,0) l.BackgroundTransparency=1 l.Text=p.Name l.TextColor3=Color3.new(1,1,1) l.TextStrokeColor3=Color3.fromRGB(130,50,230) l.TextStrokeTransparency=0.3 l.TextSize=11 l.Font=Enum.Font.GothamBold end end end
        if S.Sp2 and LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed=32 end
        if S.Sp3 and LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed=48 end
        if S.Farm then for _,o in pairs(workspace:GetDescendants()) do if o:IsA("BasePart") and (o.Name:lower():find("coin") or o.Name:lower():find("gem") or o.Name:lower():find("event")) then if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then LP.Character.HumanoidRootPart.CFrame=o.CFrame task.wait(0.3) end break end end end
    end)
end)

print("San Hub ✓ | Anti-Kick ✓ | SH to open")
