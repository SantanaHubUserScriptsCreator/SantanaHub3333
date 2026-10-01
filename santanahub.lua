-- San Hub 2026 - GUI Test
local UIS=game:GetService("UserInputService")
local R=game:GetService("RunService")
local TS=game:GetService("TweenService")

-- GUI
local gui=Instance.new("ScreenGui",game:GetService("CoreGui"))
gui.ResetOnSpawn=false
gui.Name="SanHub"

-- PANEL PRINCIPAL
local main=Instance.new("Frame",gui)
main.Size=UDim2.new(0,220,0,300)
main.Position=UDim2.new(0.5,-110,0.5,-150)
main.BackgroundColor3=Color3.fromRGB(12,12,18)
main.BorderSizePixel=0
main.Visible=true
main.Active=true
Instance.new("UICorner",main).CornerRadius=UDim.new(0,10)
local ms=Instance.new("UIStroke",main)
ms.Color=Color3.fromRGB(130,50,230)
ms.Thickness=1.5

-- TOP BAR
local bar=Instance.new("Frame",main)
bar.Size=UDim2.new(1,0,0,30)
bar.BackgroundColor3=Color3.fromRGB(18,18,26)
bar.BorderSizePixel=0
Instance.new("UICorner",bar).CornerRadius=UDim.new(0,10)
local bf=Instance.new("Frame",bar)
bf.Size=UDim2.new(1,0,0,8)
bf.Position=UDim2.new(0,0,1,-8)
bf.BackgroundColor3=Color3.fromRGB(18,18,26)
bf.BorderSizePixel=0

-- BOTON X (cerrar)
local close=Instance.new("TextButton",bar)
close.Size=UDim2.new(0,20,0,20)
close.Position=UDim2.new(0,6,0,5)
close.BackgroundColor3=Color3.fromRGB(50,15,15)
close.Text="X"
close.TextColor3=Color3.fromRGB(255,80,80)
close.TextSize=10
close.Font=Enum.Font.GothamBold
close.BorderSizePixel=0
Instance.new("UICorner",close).CornerRadius=UDim.new(0,5)

-- TITULO
local tl=Instance.new("TextLabel",bar)
tl.Size=UDim2.new(1,-30,1,0)
tl.Position=UDim2.new(0,28,0,0)
tl.BackgroundTransparency=1
tl.Text="San Hub"
tl.TextColor3=Color3.fromRGB(200,200,220)
tl.TextSize=13
tl.Font=Enum.Font.GothamBold
tl.TextXAlignment=Enum.TextXAlignment.Left

-- SCROLL
local sc=Instance.new("ScrollingFrame",main)
sc.Size=UDim2.new(1,-10,1,-36)
sc.Position=UDim2.new(0,5,0,33)
sc.BackgroundTransparency=1
sc.ScrollBarThickness=2
sc.ScrollBarImageColor3=Color3.fromRGB(130,50,230)
sc.AutomaticCanvasSize=Enum.AutomaticSize.Y
sc.BorderSizePixel=0
Instance.new("UIListLayout",sc).Padding=UDim.new(0,3)

-- FUNCIONES UI
local function Sec(txt)
    local f=Instance.new("TextLabel",sc)
    f.Size=UDim2.new(1,0,0,18)
    f.BackgroundTransparency=1
    f.Text="— "..txt.." —"
    f.TextColor3=Color3.fromRGB(130,50,230)
    f.TextSize=9
    f.Font=Enum.Font.GothamBlack
end

local function Btn(name,cb)
    local f=Instance.new("Frame",sc)
    f.Size=UDim2.new(1,0,0,28)
    f.BackgroundColor3=Color3.fromRGB(20,20,30)
    f.BorderSizePixel=0
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)
    local nl=Instance.new("TextLabel",f)
    nl.Size=UDim2.new(1,-48,1,0)
    nl.Position=UDim2.new(0,8,0,0)
    nl.BackgroundTransparency=1
    nl.Text=name
    nl.TextColor3=Color3.fromRGB(200,200,215)
    nl.TextSize=10
    nl.Font=Enum.Font.Gotham
    nl.TextXAlignment=Enum.TextXAlignment.Left
    local tb=Instance.new("Frame",f)
    tb.Size=UDim2.new(0,28,0,13)
    tb.Position=UDim2.new(1,-36,0.5,-6.5)
    tb.BackgroundColor3=Color3.fromRGB(35,35,50)
    Instance.new("UICorner",tb).CornerRadius=UDim.new(1,0)
    local tc=Instance.new("Frame",tb)
    tc.Size=UDim2.new(0,9,0,9)
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
            TS:Create(tc,TweenInfo.new(0.2),{Position=UDim2.new(1,-11,0,2)}):Play()
            TS:Create(f,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(30,15,55)}):Play()
        else
            TS:Create(tb,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(35,35,50)}):Play()
            TS:Create(tc,TweenInfo.new(0.2),{Position=UDim2.new(0,2,0,2)}):Play()
            TS:Create(f,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(20,20,30)}):Play()
        end
        cb(on)
    end)
end

-- SECCIONES DE PRUEBA
Sec("Combat")
Btn("Auto Shoot",function(v) end)
Btn("Aimbot",function(v) end)
Btn("Auto Pull Gun",function(v) end)

Sec("Visual")
Btn("ESP Players",function(v) end)
Btn("ESP Names",function(v) end)

Sec("Movement")
Btn("Speed x2",function(v) end)
Btn("Speed x3",function(v) end)
Btn("Infinite Jump",function(v) end)

Sec("Misc")
Btn("Auto Farm",function(v) end)

-- FOOTER
local ft=Instance.new("TextLabel",sc)
ft.Size=UDim2.new(1,0,0,16)
ft.BackgroundTransparency=1
ft.Text="San Hub v2026 | TEST"
ft.TextColor3=Color3.fromRGB(50,50,70)
ft.TextSize=8
ft.Font=Enum.Font.Gotham

-- ══════════════════════════════════
-- BOTON FLOTANTE
-- ══════════════════════════════════
local fb=Instance.new("TextButton",gui)
fb.Name="FloatBtn"
fb.Size=UDim2.new(0,130,0,32)
fb.Position=UDim2.new(0,10,0,10)
fb.BackgroundColor3=Color3.fromRGB(0,0,0)
fb.AutoButtonColor=false
fb.BorderSizePixel=0
fb.Text="x | San Hub"
fb.TextColor3=Color3.fromRGB(220,220,230)
fb.TextSize=14
fb.Font=Enum.Font.GothamBold
fb.Visible=false
Instance.new("UICorner",fb).CornerRadius=UDim.new(1,0)

-- BORDE DEGRADADO (simulado con múltiples strokes)
local s1=Instance.new("UIStroke",fb)
s1.Color=Color3.fromRGB(130,50,230)
s1.Thickness=2
s1.Transparency=0

local s2=Instance.new("UIStroke",fb)
s2.Color=Color3.fromRGB(50,100,255)
s2.Thickness=1
s2.Transparency=0.3

local s3=Instance.new("UIStroke",fb)
s3.Color=Color3.fromRGB(255,50,50)
s3.Thickness=1
s3.Transparency=0.6

-- DRAG (solo con el botón X del panel)
local dragging,dragStart,startPos=false
local xBtn=Instance.new("TextButton",fb)
xBtn.Size=UDim2.new(0,20,1,0)
xBtn.Position=UDim2.new(0,0,0,0)
xBtn.BackgroundTransparency=1
xBtn.Text=""
xBtn.ZIndex=10

xBtn.MouseButton1Down:Connect(function()
    dragging=true
    dragStart=UIS:GetMouseLocation()
    startPos=fb.Position
end)
UIS.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        dragging=false
    end
end)
R.RenderStepped:Connect(function()
    if dragging then
        local d=UIS:GetMouseLocation()-dragStart
        fb.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
    end
end)

-- ABRIR/CERRAR PANEL
local function OpenPanel()
    main.Visible=true
    main.Size=UDim2.new(0,0,0,0)
    TS:Create(main,TweenInfo.new(0.3,Enum.EasingStyle.Back),{Size=UDim2.new(0,220,0,300)}):Play()
    fb.Visible=false
end

local function ClosePanel()
    TS:Create(main,TweenInfo.new(0.2),{Size=UDim2.new(0,0,0,0)}):Play()
    task.wait(0.25)
    main.Visible=false
    fb.Visible=true
end

close.MouseButton1Click:Connect(ClosePanel)
fb.MouseButton1Click:Connect(OpenPanel)

-- Panel abierto al cargar
print("San Hub cargado ✓")

