-- Servicios necesarios
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-- Evita duplicados si ejecutas el script varias veces
if CoreGui:FindFirstChild("XzLHubMobile") then
    CoreGui.XzLHubMobile:Destroy()
end

-- Contenedor principal protegido (ScreenGui)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "XzLHubMobile"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 1. Barra Flotante Principal
local FloatingBar = Instance.new("Frame")
FloatingBar.Name = "FloatingBar"
FloatingBar.Size = UDim2.new(0, 210, 0, 50)
FloatingBar.Position = UDim2.new(0.5, -105, 0.2, 0)
FloatingBar.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
FloatingBar.BackgroundTransparency = 0.3
FloatingBar.BorderSizePixel = 0
FloatingBar.Parent = ScreenGui

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(1, 0)
BarCorner.Parent = FloatingBar

local BarStroke = Instance.new("UIStroke")
BarStroke.Color = Color3.fromRGB(120, 120, 130)
BarStroke.Thickness = 1.8
BarStroke.Parent = FloatingBar

-- 2. Botón de Movimiento (Barra flotante)
local DragButton = Instance.new("TextButton")
DragButton.Name = "DragButton"
DragButton.Size = UDim2.new(0, 42, 0, 42)
DragButton.Position = UDim2.new(0, 4, 0, 4)
DragButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DragButton.BackgroundTransparency = 0
DragButton.Text = "+"
DragButton.TextSize = 24
DragButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DragButton.Font = Enum.Font.SourceSansBold
DragButton.Parent = FloatingBar

local DragCorner = Instance.new("UICorner")
DragCorner.CornerRadius = UDim.new(1, 0)
DragCorner.Parent = DragButton

local DragStroke = Instance.new("UIStroke")
DragStroke.Color = Color3.fromRGB(100, 100, 110)
DragStroke.Thickness = 1.2
DragStroke.Parent = FloatingBar

-- 3. Línea divisoria vertical
local Divider = Instance.new("Frame")
Divider.Name = "Divider"
Divider.Size = UDim2.new(0, 1, 0, 30)
Divider.Position = UDim2.new(0, 52, 0, 10)
Divider.BackgroundColor3 = Color3.fromRGB(80, 80, 95)
Divider.BorderSizePixel = 0
Divider.Parent = FloatingBar

-- 4. Botón Principal para Abrir/Cerrar el Menú ("XzL-Hub")
local ToggleMenuButton = Instance.new("TextButton")
ToggleMenuButton.Name = "ToggleMenuButton"
ToggleMenuButton.Size = UDim2.new(0, 150, 0, 50)
ToggleMenuButton.Position = UDim2.new(0, 58, 0, 0)
ToggleMenuButton.BackgroundTransparency = 1
ToggleMenuButton.Text = ""
ToggleMenuButton.Parent = FloatingBar

-- 4.1. Contenedor de la Imagen del Logo (El gatito)
local IconHolder = Instance.new("ImageLabel")
IconHolder.Name = "LogoImage"
IconHolder.Size = UDim2.new(0, 32, 0, 32)
IconHolder.Position = UDim2.new(0, 6, 0.5, -16)
IconHolder.BackgroundTransparency = 1
IconHolder.Image = "rbxassetid://140075194572537"
IconHolder.Parent = ToggleMenuButton

local ImageCorner = Instance.new("UICorner")
ImageCorner.CornerRadius = UDim.new(1, 0)
ImageCorner.Parent = IconHolder

local ImageStroke = Instance.new("UIStroke")
ImageStroke.Color = Color3.fromRGB(120, 120, 130)
ImageStroke.Thickness = 1
ImageStroke.Parent = IconHolder

-- 4.2. Texto "XzL-Hub"
local HubText = Instance.new("TextLabel")
HubText.Name = "HubText"
HubText.Size = UDim2.new(1, -44, 1, 0)
HubText.Position = UDim2.new(0, 44, 0, 0)
HubText.BackgroundTransparency = 1
HubText.Text = "XzL-Hub"
HubText.TextColor3 = Color3.fromRGB(255, 255, 255)
HubText.TextSize = 16
HubText.Font = Enum.Font.SourceSansBold
HubText.TextXAlignment = Enum.TextXAlignment.Left
HubText.Parent = ToggleMenuButton

-- 5. La Ventana del Menú Principal (Ampliada)
local MainWindow = Instance.new("Frame")
MainWindow.Name = "MainWindow"
MainWindow.Size = UDim2.new(0, 480, 0, 330)
MainWindow.Position = UDim2.new(0.5, -240, 0.4, -165)
MainWindow.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainWindow.BackgroundTransparency = 0
MainWindow.BorderSizePixel = 0
MainWindow.Visible = false
MainWindow.Parent = ScreenGui

local WindowCorner = Instance.new("UICorner")
WindowCorner.CornerRadius = UDim.new(0, 12)
WindowCorner.Parent = MainWindow

-- 5.1. Imagen de fondo del Menú Principal cubriendo todo
local MenuBackground = Instance.new("ImageLabel")
MenuBackground.Name = "MenuBackground"
MenuBackground.Size = UDim2.new(1, 0, 1, 0)
MenuBackground.Position = UDim2.new(0, 0, 0, 0)
MenuBackground.BackgroundTransparency = 1
MenuBackground.Image = "rbxassetid://92058364407037" --
MenuBackground.ScaleType = Enum.ScaleType.Crop
MenuBackground.Parent = MainWindow

local DarkOverlay = Instance.new("Frame")
DarkOverlay.Size = UDim2.new(1, 0, 1, 0)
DarkOverlay.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
DarkOverlay.BackgroundTransparency = 0.45
DarkOverlay.BorderSizePixel = 0
DarkOverlay.Parent = MainWindow

local OverlayCorner = Instance.new("UICorner")
OverlayCorner.CornerRadius = UDim.new(0, 12)
OverlayCorner.Parent = DarkOverlay

local WindowStroke = Instance.new("UIStroke")
WindowStroke.Color = Color3.fromRGB(120, 120, 130)
WindowStroke.Thickness = 1.8
WindowStroke.Parent = MainWindow

-- Título interno del menú
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -140, 0, 45)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "XzL-Hub - Menú Principal"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 18
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 2
TitleLabel.Parent = MainWindow

-- --- PANEL LATERAL IZQUIERDO ---
local SidePanel = Instance.new("ScrollingFrame")
SidePanel.Name = "SidePanel"
SidePanel.Size = UDim2.new(0, 130, 1, -55)
SidePanel.Position = UDim2.new(0, 10, 0, 45)
SidePanel.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
SidePanel.BackgroundTransparency = 0.6
SidePanel.BorderSizePixel = 0
SidePanel.CanvasSize = UDim2.new(0, 0, 0, 250)
SidePanel.ScrollBarThickness = 3
SidePanel.ZIndex = 2
SidePanel.Parent = MainWindow

local SideCorner = Instance.new("UICorner")
SideCorner.CornerRadius = UDim.new(0, 8)
SideCorner.Parent = SidePanel

local SideStroke = Instance.new("UIStroke")
SideStroke.Color = Color3.fromRGB(120, 120, 130)
SideStroke.Transparency = 0.5
SideStroke.Thickness = 1
SideStroke.Parent = SidePanel

local SideLayout = Instance.new("UIListLayout")
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Padding = UDim.new(0, 6)
SideLayout.Parent = SidePanel

-- --- CONTENEDOR DE LAS PESTAÑAS (DERECHA DEL PANEL LATERAL) ---
local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -155, 1, -55)
ContentContainer.Position = UDim2.new(0, 145, 0, 45)
ContentContainer.BackgroundTransparency = 1
ContentContainer.ZIndex = 2
ContentContainer.Parent = MainWindow

-- Pestaña ESP (Contenedor)
local ESPTab = Instance.new("ScrollingFrame")
ESPTab.Name = "ESPTab"
ESPTab.Size = UDim2.new(1, 0, 1, 0)
ESPTab.BackgroundTransparency = 1
ESPTab.BorderSizePixel = 0
ESPTab.CanvasSize = UDim2.new(0, 0, 0, 320)
ESPTab.ScrollBarThickness = 3
ESPTab.Visible = true
ESPTab.ZIndex = 2
ESPTab.Parent = ContentContainer

local ESPLayout = Instance.new("UIListLayout")
ESPLayout.SortOrder = Enum.SortOrder.LayoutOrder
ESPLayout.Padding = UDim.new(0, 8)
ESPLayout.Parent = ESPTab

-- Pestaña Farm
local FarmTab = Instance.new("ScrollingFrame")
FarmTab.Name = "FarmTab"
FarmTab.Size = UDim2.new(1, 0, 1, 0)
FarmTab.BackgroundTransparency = 1
FarmTab.BorderSizePixel = 0
FarmTab.CanvasSize = UDim2.new(0, 0, 0, 200)
FarmTab.ScrollBarThickness = 3
FarmTab.Visible = false
FarmTab.ZIndex = 2
FarmTab.Parent = ContentContainer

local FarmLayout = Instance.new("UIListLayout")
FarmLayout.SortOrder = Enum.SortOrder.LayoutOrder
FarmLayout.Padding = UDim.new(0, 8)
FarmLayout.Parent = FarmTab

-- Pestaña Combate
local CombateTab = Instance.new("ScrollingFrame")
CombateTab.Name = "CombateTab"
CombateTab.Size = UDim2.new(1, 0, 1, 0)
CombateTab.BackgroundTransparency = 1
CombateTab.BorderSizePixel = 0
CombateTab.CanvasSize = UDim2.new(0, 0, 0, 200)
CombateTab.ScrollBarThickness = 3
CombateTab.Visible = false
CombateTab.ZIndex = 2
CombateTab.Parent = ContentContainer

local CombateLayout = Instance.new("UIListLayout")
CombateLayout.SortOrder = Enum.SortOrder.LayoutOrder
CombateLayout.Padding = UDim.new(0, 8)
CombateLayout.Parent = CombateTab

-- Funciones auxiliares
local function CreateOptionButton(parentTab, text, order, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 38)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
    Btn.BackgroundTransparency = 0.2
    Btn.Text = "  " .. text
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 13
    Btn.Font = Enum.Font.SourceSansSemibold
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.LayoutOrder = order
    Btn.ZIndex = 3
    Btn.Parent = parentTab

    local BtnC = Instance.new("UICorner")
    BtnC.CornerRadius = UDim.new(0, 6)
    BtnC.Parent = Btn

    local BtnS = Instance.new("UIStroke")
    BtnS.Color = Color3.fromRGB(110, 110, 120)
    BtnS.Thickness = 1
    BtnS.Parent = Btn

    Btn.MouseButton1Click:Connect(callback)
    return Btn
end

local function CreateSubLabel(parentTab, text, order)
    local Lbl = Instance.new("TextLabel")
    Lbl.Size = UDim2.new(1, -10, 0, 24)
    Lbl.BackgroundTransparency = 1
    Lbl.Text = "  " .. text
    Lbl.TextColor3 = Color3.fromRGB(170, 170, 185)
    Lbl.TextSize = 11
    Lbl.Font = Enum.Font.SourceSansItalic
    Lbl.TextXAlignment = Enum.TextXAlignment.Left
    Lbl.LayoutOrder = order
    Lbl.ZIndex = 3
    Lbl.Parent = parentTab
end

-- Opciones de ESP
CreateOptionButton(ESPTab, "👁️ Enable ESP", 1, function() print("ESP Activado") end)
CreateOptionButton(ESPTab, "🚫 Desactivar ESP", 2, function() print("ESP Desactivado") end)
CreateOptionButton(ESPTab, "📈 Rayas ESP", 3, function() print("Rayas ESP activadas") end)
CreateSubLabel(ESPTab, "Guía una raya de ti, hacia tus enemigos", 4)
CreateOptionButton(ESPTab, "👤 Nombres de los enemigos", 5, function() print("Nombres ESP activados") end)
CreateSubLabel(ESPTab, "Ve los nombres de tus enemigos", 6)

CreateOptionButton(FarmTab, "🌾 Auto Farm Level", 1, function() print("Farm activado") end)
CreateOptionButton(CombateTab, "⚔️ Aimbot / Silent", 1, function() print("Combate activado") end)

-- Conexión de pestañas laterales
local function CreateTabButton(name, iconText, text, order, targetTab)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Name = name
    TabBtn.Size = UDim2.new(1, -6, 0, 36)
    TabBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    TabBtn.BackgroundTransparency = 0.4
    TabBtn.Text = "  " .. iconText .. "  " .. text
    TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabBtn.TextSize = 13
    TabBtn.Font = Enum.Font.SourceSansSemibold
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left
    TabBtn.LayoutOrder = order
    TabBtn.ZIndex = 3
    TabBtn.Parent = SidePanel

    local TabC = Instance.new("UICorner")
    TabC.CornerRadius = UDim.new(0, 6)
    TabC.Parent = TabBtn

    local TabS = Instance.new("UIStroke")
    TabS.Color = Color3.fromRGB(100, 100, 110)
    TabS.Transparency = 0.4
    TabS.Thickness = 1
    TabS.Parent = TabBtn

    TabBtn.MouseButton1Click:Connect(function()
        ESPTab.Visible = false
        FarmTab.Visible = false
        CombateTab.Visible = false
        targetTab.Visible = true
    end)

    return TabBtn
end

CreateTabButton("TabESP", "👁️", "ESP", 1, ESPTab)
CreateTabButton("TabFarm", "⚙️", "Farm", 2, FarmTab)
CreateTabButton("TabCombate", "⚔️", "Combate", 3, CombateTab)

-- Controles Superiores Derechos ("—", "+", "X")
local TopBarControls = Instance.new("Frame")
TopBarControls.Size = UDim2.new(0, 130, 0, 35)
TopBarControls.Position = UDim2.new(1, -135, 0, 5)
TopBarControls.BackgroundTransparency = 1
TopBarControls.ZIndex = 3
TopBarControls.Parent = MainWindow

local MinButton = Instance.new("TextButton")
MinButton.Size = UDim2.new(0, 35, 0, 35)
MinButton.Position = UDim2.new(0, 0, 0, 0)
MinButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MinButton.Text = "—"
MinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinButton.TextSize = 16
MinButton.Font = Enum.Font.SourceSansBold
MinButton.ZIndex = 3
MinButton.Parent = TopBarControls

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = MinButton

local MenuDragButton = Instance.new("TextButton")
MenuDragButton.Size = UDim2.new(0, 35, 0, 35)
MenuDragButton.Position = UDim2.new(0, 40, 0, 0)
MenuDragButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MenuDragButton.Text = "+"
MenuDragButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MenuDragButton.TextSize = 20
MenuDragButton.Font = Enum.Font.SourceSansBold
MenuDragButton.ZIndex = 3
MenuDragButton.Parent = TopBarControls

local MenuDragCorner = Instance.new("UICorner")
MenuDragCorner.CornerRadius = UDim.new(0, 8)
MenuDragCorner.Parent = MenuDragButton

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Position = UDim2.new(0, 80, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseButton.TextSize = 16
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.ZIndex = 3
CloseButton.Parent = TopBarControls

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

-- Burbuja de Advertencia para Cerrar
local function ShowCloseConfirmation()
    local ConfirmOverlay = Instance.new("Frame")
    ConfirmOverlay.Size = UDim2.new(1, 0, 1, 0)
    ConfirmOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ConfirmOverlay.BackgroundTransparency = 0.5
    ConfirmOverlay.ZIndex = 10
    ConfirmOverlay.Parent = MainWindow

    local OverlayC = Instance.new("UICorner")
    OverlayC.CornerRadius = UDim.new(0, 12)
    OverlayC.Parent = ConfirmOverlay

    local AlertBubble = Instance.new("Frame")
    AlertBubble.Size = UDim2.new(0, 340, 0, 160)
    AlertBubble.Position = UDim2.new(0.5, -170, 0.5, -80)
    AlertBubble.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
    AlertBubble.BorderSizePixel = 0
    AlertBubble.ZIndex = 11
    AlertBubble.Parent = ConfirmOverlay

    local BubbleC = Instance.new("UICorner")
    BubbleC.CornerRadius = UDim.new(0, 12)
    BubbleC.Parent = AlertBubble

    local BubbleS = Instance.new("UIStroke")
    BubbleS.Color = Color3.fromRGB(120, 120, 130)
    BubbleS.Thickness = 1.8
    BubbleS.Parent = AlertBubble

    local WarnText = Instance.new("TextLabel")
    WarnText.Size = UDim2.new(1, -20, 0, 45)
    WarnText.Position = UDim2.new(0, 10, 0, 12)
    WarnText.BackgroundTransparency = 1
    WarnText.Text = "¿Seguro quiero cerrar este script?"
    WarnText.TextColor3 = Color3.fromRGB(255, 255, 255)
    WarnText.TextSize = 16
    WarnText.Font = Enum.Font.SourceSansBold
    WarnText.TextWrapped = true
    WarnText.ZIndex = 11
    WarnText.Parent = AlertBubble

    local YesBtn = Instance.new("TextButton")
    YesBtn.Size = UDim2.new(1, -20, 0, 38)
    YesBtn.Position = UDim2.new(0, 10, 0, 65)
    YesBtn.BackgroundColor3 = Color3.fromRGB(40, 20, 20)
    YesBtn.Text = "Sí, quiero cerrar este script"
    YesBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
    YesBtn.TextSize = 14
    YesBtn.Font = Enum.Font.SourceSansBold
    YesBtn.ZIndex = 11
    YesBtn.Parent = AlertBubble

    local YesC = Instance.new("UICorner")
    YesC.CornerRadius = UDim.new(0, 8)
    YesC.Parent = YesBtn

    local YesS = Instance.new("UIStroke")
    YesS.Color = Color3.fromRGB(200, 80, 80)
    YesS.Thickness = 1
    YesS.Parent = YesBtn

    local NoBtn = Instance.new("TextButton")
    NoBtn.Size = UDim2.new(1, -20, 0, 38)
    NoBtn.Position = UDim2.new(0, 10, 0, 110)
    NoBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    NoBtn.Text = "No, no quiero cerrar este script"
    NoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    NoBtn.TextSize = 14
    NoBtn.Font = Enum.Font.SourceSansBold
    NoBtn.ZIndex = 11
    NoBtn.Parent = AlertBubble

    local NoC = Instance.new("UICorner")
    NoC.CornerRadius = UDim.new(0, 8)
    NoC.Parent = NoBtn

    local NoS = Instance.new("UIStroke")
    NoS.Color = Color3.fromRGB(120, 120, 130)
    NoS.Thickness = 1
    NoS.Parent = NoBtn

    YesBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    NoBtn.MouseButton1Click:Connect(function()
        ConfirmOverlay:Destroy()
    end)
end

MinButton.MouseButton1Click:Connect(function()
    MainWindow.Visible = false
end)

CloseButton.MouseButton1Click:Connect(function()
    ShowCloseConfirmation()
end)

-- Burbujas de bienvenida
local function ShowChatBubble(textoMensaje, delaySegundos)
    task.delay(delaySegundos, function()
        local Bubble = Instance.new("Frame")
        Bubble.Size = UDim2.new(0, 280, 0, 45)
        Bubble.Position = UDim2.new(0.5, -140, 0.35, 0)
        Bubble.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
        Bubble.BackgroundTransparency = 0.1
        Bubble.BorderSizePixel = 0
        Bubble.Parent = ScreenGui

        local BubbleCorner = Instance.new("UICorner")
        BubbleCorner.CornerRadius = UDim.new(0, 10)
        BubbleCorner.Parent = Bubble

        local BubbleStroke = Instance.new("UIStroke")
        BubbleStroke.Color = Color3.fromRGB(120, 120, 130)
        BubbleStroke.Thickness = 1.5
        BubbleStroke.Parent = Bubble

        local MsgLabel = Instance.new("TextLabel")
        MsgLabel.Size = UDim2.new(1, -20, 1, 0)
        MsgLabel.Position = UDim2.new(0, 10, 0, 0)
        MsgLabel.BackgroundTransparency = 1
        MsgLabel.Text = textoMensaje
        MsgLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        MsgLabel.TextSize = 14
        MsgLabel.Font = Enum.Font.SourceSansSemibold
        MsgLabel.TextWrapped = true
        MsgLabel.Parent = Bubble

        Bubble.BackgroundTransparency = 1
        MsgLabel.TextTransparency = 1
        BubbleStroke.Transparency = 1

        TweenService:Create(Bubble, TweenInfo.new(0.3), {BackgroundTransparency = 0.1}):Play()
        TweenService:Create(MsgLabel, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
        TweenService:Create(BubbleStroke, TweenInfo.new(0.3), {Transparency = 0}):Play()

        task.delay(3.5, function()
            local t1 = TweenService:Create(Bubble, TweenInfo.new(0.3), {BackgroundTransparency = 1})
            local t2 = TweenService:Create(MsgLabel, TweenInfo.new(0.3), {TextTransparency = 1})
            local t3 = TweenService:Create(BubbleStroke, TweenInfo.new(0.3), {Transparency = 1})
            t1:Play()
            t2:Play()
            t3:Play()
            t1.Completed:Connect(function()
                Bubble:Destroy()
            end)
        end)
    end)
end

ShowChatBubble("¡Bienvenidos! ¡Gracias por utilizar este script, se les agradece mucho!", 0.5)
ShowChatBubble("💬 Script XzL ejecutado con éxito", 4.5)

-- Lógica de Arrastre
local draggingBar, dragBarStart, startBarPos
DragButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingBar = true
        dragBarStart = input.Position
        startBarPos = FloatingBar.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                draggingBar = false
            end
        end)
    end
end)

local draggingMenu, dragMenuStart, startMenuPos
MenuDragButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingMenu = true
        dragMenuStart = input.Position
        startMenuPos = MainWindow.Position
        input
