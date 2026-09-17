--[[
	DeltaruneUI - Base (Window + Tabs)
	----------------------------------
	Librería de interfaz estilo Deltarune (cajas blancas, borde negro grueso,
	esquinas rectas, tipografía pixelada, cursor tipo corazón para selección).

	Solo usa fuentes instaladas por Roblox (Silkscreen por ID / Code) y no
	de ningún rbxassetid externo: el corazón de selección se dibuja con Frames.

	Este archivo cubre: Ventana base + Sistema de Pestañas.
	Los siguientes elementos (botones, toggles, sliders) se añadirán después
	reutilizando self.Theme y el Container de cada Tab.
]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local Library = {}
Library.__index = Library

local Window = {}
Window.__index = Window

local Tab = {}
Tab.__index = Tab

--------------------------------------------------------------------
-- TEMA
--------------------------------------------------------------------

local Theme = {
	Background       = Color3.fromRGB(255, 255, 255), -- caja blanca
	Border           = Color3.fromRGB(0, 0, 0),        -- borde negro
	Text             = Color3.fromRGB(0, 0, 0),
	SubText          = Color3.fromRGB(90, 90, 90),
	TabIdle          = Color3.fromRGB(255, 255, 255),
	TabIdleText      = Color3.fromRGB(0, 0, 0),
	TabSelected      = Color3.fromRGB(0, 0, 0),
	TabSelectedText  = Color3.fromRGB(255, 255, 255),
	Header           = Color3.fromRGB(0, 0, 0),
	HeaderText       = Color3.fromRGB(255, 255, 255),
	HeaderSubText    = Color3.fromRGB(190, 190, 190),
	Heart            = Color3.fromRGB(220, 30, 30), -- corazón/soul rojo
	BorderThickness  = 4,
	TabBorderThickness = 2,
}

-- "PressStart2P" no existe en el Enum.Font (legacy) de Roblox, así que
-- usamos el nuevo datatype Font cargando "Silkscreen" directamente por su
-- ID de asset oficial de Roblox (fuente pixelada instalada por defecto,
-- sin depender de ningún asset externo/subido por el usuario).
local SILKSCREEN_ID = 12187371840
local FONT_TITLE = Font.fromId(SILKSCREEN_ID, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
local FONT_BODY  = Enum.Font.Code -- alternativa (legacy) para textos largos

local TWEEN_FAST = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

--------------------------------------------------------------------
-- UTILIDADES
--------------------------------------------------------------------

local function getTargetContainer()
	local localPlayer = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	return localPlayer:WaitForChild("PlayerGui")
end

local function new(class, props, parent)
	local inst = Instance.new(class)
	for prop, value in pairs(props or {}) do
		inst[prop] = value
	end
	if parent then
		inst.Parent = parent
	end
	return inst
end

-- Borde negro grueso, sin redondear esquinas (estética Deltarune)
local function applyBoxBorder(frame, thickness)
	local stroke = new("UIStroke", {
		Color = Theme.Border,
		Thickness = thickness or Theme.BorderThickness,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		LineJoinMode = Enum.LineJoinMode.Miter, -- esquinas rectas, no curvas
	}, frame)
	return stroke
end

local function tween(obj, props, info)
	local t = TweenService:Create(obj, info or TWEEN_FAST, props)
	t:Play()
	return t
end

-- Corazón dibujado con Frames puros (2 círculos + 1 cuadrado rotado)
-- Clásico truco CSS, sin necesidad de ningún asset de imagen.
local function createHeart(parent, size)
	size = size or 14

	local holder = new("Frame", {
		Name = "Heart",
		BackgroundTransparency = 1,
		Size = UDim2.new(0, size, 0, size),
		ZIndex = 10,
	}, parent)

	local square = new("Frame", {
		Name = "Point",
		BackgroundColor3 = Theme.Heart,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.6, 0),
		Size = UDim2.new(0, size * 0.7, 0, size * 0.7),
		Rotation = 45,
		ZIndex = 10,
	}, holder)

	local function bump(xScale)
		local circle = new("Frame", {
			BackgroundColor3 = Theme.Heart,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(xScale, 0, 0.38, 0),
			Size = UDim2.new(0, size * 0.55, 0, size * 0.55),
			ZIndex = 10,
		}, holder)
		new("UICorner", { CornerRadius = UDim.new(1, 0) }, circle)
		return circle
	end

	bump(0.28)
	bump(0.72)

	return holder
end

--------------------------------------------------------------------
-- LIBRARY
--------------------------------------------------------------------

-- Library.CreateWindow({ Title, SubTitle, Size })
function Library.CreateWindow(config)
	config = config or {}
	local title    = config.Title or "Ventana"
	local subtitle = config.SubTitle or ""
	local size     = config.Size or UDim2.new(0, 620, 0, 420)

	local self = setmetatable({}, Window)
	self.Theme = Theme
	self.Tabs = {}
	self.CurrentTab = nil

	----------------------------------------------------------------
	-- ScreenGui raíz
	----------------------------------------------------------------
	self.ScreenGui = new("ScreenGui", {
		Name = "DeltaruneUI_" .. tostring(math.random(100000, 999999)),
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		ResetOnSpawn = false,
	}, getTargetContainer())

	----------------------------------------------------------------
	-- Ventana principal (caja blanca, borde negro, esquinas rectas)
	----------------------------------------------------------------
	self.Main = new("Frame", {
		Name = "Main",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = size,
		BackgroundColor3 = Theme.Background,
		BorderSizePixel = 0,
		ClipsDescendants = true,
	}, self.ScreenGui)
	applyBoxBorder(self.Main, Theme.BorderThickness)
	-- Nota: sin UICorner a propósito. Deltarune usa esquinas 100% rectas.

	----------------------------------------------------------------
	-- Header (barra negra superior, título pixelado)
	----------------------------------------------------------------
	self.Header = new("Frame", {
		Name = "Header",
		BackgroundColor3 = Theme.Header,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 52),
	}, self.Main)

	self.TitleLabel = new("TextLabel", {
		Name = "Title",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 14, 0, 8),
		Size = UDim2.new(1, -60, 0, 18),
		FontFace = FONT_TITLE,
		Text = title,
		TextScaled = false,
		TextSize = 14,
		TextColor3 = Theme.HeaderText,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, self.Header)

	self.SubTitleLabel = new("TextLabel", {
		Name = "SubTitle",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 14, 0, 30),
		Size = UDim2.new(1, -60, 0, 14),
		Font = FONT_BODY,
		Text = subtitle,
		TextSize = 13,
		TextColor3 = Theme.HeaderSubText,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, self.Header)

	-- Botón cerrar (X), estilo caja pixelada
	self.CloseButton = new("TextButton", {
		Name = "Close",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -10, 0.5, 0),
		Size = UDim2.new(0, 26, 0, 26),
		BackgroundColor3 = Theme.Background,
		BorderSizePixel = 0,
		FontFace = FONT_TITLE,
		Text = "X",
		TextSize = 10,
		TextColor3 = Theme.Text,
		AutoButtonColor = false,
	}, self.Header)
	applyBoxBorder(self.CloseButton, 2)

	self.CloseButton.MouseEnter:Connect(function()
		tween(self.CloseButton, { BackgroundColor3 = Theme.Heart }, TWEEN_FAST)
		tween(self.CloseButton, { TextColor3 = Theme.HeaderText }, TWEEN_FAST)
	end)
	self.CloseButton.MouseLeave:Connect(function()
		tween(self.CloseButton, { BackgroundColor3 = Theme.Background }, TWEEN_FAST)
		tween(self.CloseButton, { TextColor3 = Theme.Text }, TWEEN_FAST)
	end)
	self.CloseButton.MouseButton1Click:Connect(function()
		self:Destroy()
	end)

	----------------------------------------------------------------
	-- Arrastre de la ventana (drag desde el Header)
	----------------------------------------------------------------
	do
		local dragging = false
		local dragInput, startPos, startInputPos

		self.Header.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1
				or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				startInputPos = input.Position
				startPos = self.Main.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		self.Header.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement
				or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				local delta = input.Position - startInputPos
				self.Main.Position = UDim2.new(
					startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y
				)
			end
		end)
	end

	----------------------------------------------------------------
	-- Línea divisoria bajo el header
	----------------------------------------------------------------
	new("Frame", {
		Name = "HeaderDivider",
		Position = UDim2.new(0, 0, 0, 52),
		Size = UDim2.new(1, 0, 0, Theme.BorderThickness),
		BackgroundColor3 = Theme.Border,
		BorderSizePixel = 0,
	}, self.Main)

	----------------------------------------------------------------
	-- Barra de pestañas (horizontal, como el menú FIGHT/ACT/ITEM/MERCY)
	----------------------------------------------------------------
	self.TabBar = new("Frame", {
		Name = "TabBar",
		Position = UDim2.new(0, 0, 0, 52 + Theme.BorderThickness),
		Size = UDim2.new(1, 0, 0, 44),
		BackgroundTransparency = 1,
	}, self.Main)

	self.TabBarPadding = new("UIPadding", {
		PaddingLeft = UDim.new(0, 26), -- espacio para el corazón
		PaddingTop = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 6),
	}, self.TabBar)

	self.TabBarLayout = new("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 8),
	}, self.TabBar)

	-- Divisoria bajo la barra de pestañas
	new("Frame", {
		Name = "TabBarDivider",
		Position = UDim2.new(0, 0, 0, 52 + Theme.BorderThickness + 44),
		Size = UDim2.new(1, 0, 0, Theme.BorderThickness),
		BackgroundColor3 = Theme.Border,
		BorderSizePixel = 0,
	}, self.Main)

	-- Corazón de selección: flota a la izquierda de la pestaña activa
	self.Heart = createHeart(self.TabBar, 12)
	self.Heart.AnchorPoint = Vector2.new(0.5, 0.5)
	self.Heart.Position = UDim2.new(0, 12, 0.5, 0)

	----------------------------------------------------------------
	-- Contenedor de contenido (una pestaña visible a la vez)
	----------------------------------------------------------------
	self.ContentHolder = new("Frame", {
		Name = "ContentHolder",
		Position = UDim2.new(0, 0, 0, 52 + Theme.BorderThickness * 2 + 44),
		Size = UDim2.new(1, 0, 1, -(52 + Theme.BorderThickness * 2 + 44)),
		BackgroundTransparency = 1,
	}, self.Main)

	self._config = { size = size }

	return self
end

--------------------------------------------------------------------
-- WINDOW METHODS
--------------------------------------------------------------------

-- Window:CreateTab("Nombre") -> Tab
function Window:CreateTab(name)
	name = name or "Tab"

	local tabObj = setmetatable({}, Tab)
	tabObj.Name = name
	tabObj.Window = self

	----------------------------------------------------------------
	-- Botón de la pestaña
	----------------------------------------------------------------
	tabObj.Button = new("TextButton", {
		Name = name,
		BackgroundColor3 = Theme.TabIdle,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 0, 1, 0), -- ancho automático via AutomaticSize
		AutomaticSize = Enum.AutomaticSize.X,
		AutoButtonColor = false,
		FontFace = FONT_TITLE,
		Text = "",
		TextColor3 = Theme.TabIdleText,
	}, self.TabBar)
	applyBoxBorder(tabObj.Button, Theme.TabBorderThickness)

	new("UIPadding", {
		PaddingLeft = UDim.new(0, 12),
		PaddingRight = UDim.new(0, 12),
	}, tabObj.Button)

	tabObj.Label = new("TextLabel", {
		Name = "Label",
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.X,
		FontFace = FONT_TITLE,
		Text = string.upper(name),
		TextSize = 11,
		TextColor3 = Theme.TabIdleText,
	}, tabObj.Button)

	----------------------------------------------------------------
	-- Contenido de la pestaña (ScrollingFrame)
	----------------------------------------------------------------
	tabObj.Container = new("ScrollingFrame", {
		Name = name .. "_Container",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = false,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = Theme.Border,
	}, self.ContentHolder)

	new("UIPadding", {
		PaddingLeft = UDim.new(0, 16),
		PaddingRight = UDim.new(0, 16),
		PaddingTop = UDim.new(0, 12),
		PaddingBottom = UDim.new(0, 12),
	}, tabObj.Container)

	new("UIListLayout", {
		Padding = UDim.new(0, 10),
		SortOrder = Enum.SortOrder.LayoutOrder,
	}, tabObj.Container)

	tabObj.Button.MouseButton1Click:Connect(function()
		self:SelectTab(tabObj)
	end)

	table.insert(self.Tabs, tabObj)

	-- Si es la primera pestaña creada, seleccionarla automáticamente
	if not self.CurrentTab then
		self:SelectTab(tabObj)
	end

	return tabObj
end

-- Window:SelectTab(tabObj)
function Window:SelectTab(tabObj)
	if self.CurrentTab == tabObj then return end
	self.CurrentTab = tabObj

	for _, t in ipairs(self.Tabs) do
		local isSelected = (t == tabObj)
		t.Container.Visible = isSelected

		local bgColor = isSelected and Theme.TabSelected or Theme.TabIdle
		local textColor = isSelected and Theme.TabSelectedText or Theme.TabIdleText

		tween(t.Button, { BackgroundColor3 = bgColor })
		tween(t.Label, { TextColor3 = textColor })
	end

	-- Mover el corazón junto a la pestaña seleccionada
	local heartX = tabObj.Button.Position.X.Offset - 16
	tween(self.Heart, { Position = UDim2.new(0, math.max(heartX, 6), 0.5, 0) }, TWEEN_FAST)
end

function Window:Destroy()
	if self.ScreenGui then
		self.ScreenGui:Destroy()
	end
end

--------------------------------------------------------------------
return Library
