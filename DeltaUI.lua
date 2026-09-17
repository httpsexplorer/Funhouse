local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Theme = {
	Background = Color3.fromRGB(0, 0, 0),
	Container = Color3.fromRGB(10, 10, 10),
	ContainerLight = Color3.fromRGB(25, 25, 25),
	Border = Color3.fromRGB(255, 255, 255),
	Accent = Color3.fromRGB(255, 50, 50),
	AccentDark = Color3.fromRGB(180, 20, 20),
	Soul = Color3.fromRGB(255, 40, 40),
	TextPrimary = Color3.fromRGB(255, 255, 255),
	TextSecondary = Color3.fromRGB(190, 190, 190),
	TextDisabled = Color3.fromRGB(100, 100, 100),
	Success = Color3.fromRGB(80, 220, 120),
	Warning = Color3.fromRGB(255, 210, 60),
	Error = Color3.fromRGB(255, 60, 60),
	FontTitle = Enum.Font.FredokaOne,
	FontBody = Enum.Font.PatrickHand,
	FontMono = Enum.Font.Code,
}

local SnapTween = TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local BoxTween = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local ShakeTween = TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

local Utility = {}

function Utility:Tween(instance, props, info)
	local tween = TweenService:Create(instance, info or BoxTween, props)
	tween:Play()
	return tween
end

function Utility:Create(className, properties, children)
	local inst = Instance.new(className)
	for prop, value in pairs(properties or {}) do
		inst[prop] = value
	end
	for _, child in ipairs(children or {}) do
		child.Parent = inst
	end
	return inst
end

function Utility:Border(instance, thickness)
	return Utility:Create("UIStroke", {
		Color = Theme.Border,
		Thickness = thickness or 3,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		LineJoinMode = Enum.LineJoinMode.Miter,
		Parent = instance,
	})
end

function Utility:Padding(instance, all)
	return Utility:Create("UIPadding", {
		PaddingTop = UDim.new(0, all),
		PaddingBottom = UDim.new(0, all),
		PaddingLeft = UDim.new(0, all),
		PaddingRight = UDim.new(0, all),
		Parent = instance,
	})
end

function Utility:Typewriter(label, fullText, speed)
	label.Text = ""
	task.spawn(function()
		for i = 1, #fullText do
			label.Text = string.sub(fullText, 1, i)
			task.wait(speed or 0.02)
		end
	end)
end

function Utility:Shake(frame, magnitude, duration)
	local originalPos = frame.Position
	local elapsed = 0
	local step = 0.03
	task.spawn(function()
		while elapsed < duration do
			local offsetX = math.random(-magnitude, magnitude)
			local offsetY = math.random(-magnitude, magnitude)
			frame.Position = UDim2.new(originalPos.X.Scale, originalPos.X.Offset + offsetX, originalPos.Y.Scale, originalPos.Y.Offset + offsetY)
			task.wait(step)
			elapsed = elapsed + step
		end
		frame.Position = originalPos
	end)
end

function Utility:MakeDraggable(dragHandle, targetFrame)
	local dragging = false
	local dragStart, startPos

	dragHandle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = targetFrame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	dragHandle.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragging then
				local delta = input.Position - dragStart
				targetFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end
		end
	end)
end

local DeltaUI = {}
DeltaUI.__index = DeltaUI
DeltaUI.Windows = {}

local NotificationHolder

local function EnsureNotificationHolder(screenGui)
	if NotificationHolder and NotificationHolder.Parent then return NotificationHolder end

	NotificationHolder = Utility:Create("Frame", {
		Name = "Notifications",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -20, 1, -20),
		Size = UDim2.new(0, 300, 1, -40),
		Parent = screenGui,
	})

	Utility:Create("UIListLayout", {
		Parent = NotificationHolder,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		Padding = UDim.new(0, 10),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	return NotificationHolder
end

function DeltaUI:Notify(config)
	config = config or {}
	local title = config.Title or "* ..."
	local content = config.Content or ""
	local duration = config.Duration or 4
	local notifType = config.Type or "Info"

	local colorMap = {
		Info = Theme.TextPrimary,
		Success = Theme.Success,
		Warning = Theme.Warning,
		Error = Theme.Error,
	}
	local edgeColor = colorMap[notifType] or Theme.TextPrimary

	local holder = EnsureNotificationHolder(self.ScreenGui)

	local frame = Utility:Create("Frame", {
		BackgroundColor3 = Theme.Background,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ClipsDescendants = true,
		Parent = holder,
	})
	Utility:Border(frame, 3)
	frame.UIStroke.Color = edgeColor

	local textHolder = Utility:Create("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = frame,
	})
	Utility:Padding(textHolder, 14)
	Utility:Create("UIListLayout", { Parent = textHolder, Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder })

	local TitleLabel = Utility:Create("TextLabel", {
		BackgroundTransparency = 1,
		Font = Theme.FontTitle,
		Text = "",
		TextColor3 = Theme.TextPrimary,
		TextSize = 16,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, 0, 0, 20),
		Parent = textHolder,
	})

	local ContentLabel = Utility:Create("TextLabel", {
		BackgroundTransparency = 1,
		Font = Theme.FontBody,
		Text = "",
		TextColor3 = Theme.TextSecondary,
		TextSize = 15,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = textHolder,
	})

	frame.Size = UDim2.new(0, 300, 0, 0)
	Utility:Typewriter(TitleLabel, title, 0.015)
	task.delay(#title * 0.015 + 0.05, function()
		Utility:Typewriter(ContentLabel, content, 0.01)
	end)

	task.delay(duration, function()
		if not frame or not frame.Parent then return end
		Utility:Tween(frame, { Size = UDim2.new(0, 300, 0, 0) }, BoxTween)
		task.wait(0.2)
		if frame then frame:Destroy() end
	end)
end

function DeltaUI:CreateWindow(config)
	config = config or {}
	local windowTitle = config.Title or "* DELTAUI"
	local windowSubtitle = config.SubTitle or "* A dark world awaits..."
	local windowSize = config.Size or UDim2.new(0, 580, 0, 400)

	local ScreenGui = Utility:Create("ScreenGui", {
		Name = "DeltaUI_" .. windowTitle,
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		IgnoreGuiInset = true,
	})

	local ok = pcall(function()
		ScreenGui.Parent = game:GetService("CoreGui")
	end)
	if not ok then
		ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
	end

	local UIScale = Utility:Create("UIScale", { Scale = 1, Parent = ScreenGui })
	if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
		UIScale.Scale = 0.82
	end

	local MainFrame = Utility:Create("Frame", {
		Name = "MainWindow",
		BackgroundColor3 = Theme.Background,
		Position = UDim2.new(0.5, -windowSize.X.Offset / 2, 0.5, -windowSize.Y.Offset / 2),
		Size = windowSize,
		ClipsDescendants = true,
		Parent = ScreenGui,
	})
	Utility:Border(MainFrame, 4)

	MainFrame.Size = UDim2.new(0, windowSize.X.Offset, 0, 0)
	MainFrame.Position = UDim2.new(0.5, -windowSize.X.Offset / 2, 0.5, 0)
	Utility:Tween(MainFrame, { Size = windowSize, Position = UDim2.new(0.5, -windowSize.X.Offset / 2, 0.5, -windowSize.Y.Offset / 2) }, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out))

	local Header = Utility:Create("Frame", {
		Name = "Header",
		BackgroundColor3 = Theme.Background,
		Size = UDim2.new(1, 0, 0, 60),
		Parent = MainFrame,
	})
	Utility:Create("Frame", {
		BackgroundColor3 = Theme.Border,
		Position = UDim2.new(0, 0, 1, -4),
		Size = UDim2.new(1, 0, 0, 4),
		BorderSizePixel = 0,
		Parent = Header,
	})

	local Soul = Utility:Create("TextLabel", {
		BackgroundTransparency = 1,
		Font = Theme.FontBody,
		Text = "❤",
		TextColor3 = Theme.Soul,
		TextSize = 22,
		Position = UDim2.new(0, 16, 0, 12),
		Size = UDim2.new(0, 24, 0, 24),
		Parent = Header,
	})
	task.spawn(function()
		while Soul.Parent do
			Utility:Tween(Soul, { TextSize = 25 }, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
			task.wait(0.5)
			Utility:Tween(Soul, { TextSize = 20 }, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
			task.wait(0.5)
		end
	end)

	local TitleLabel = Utility:Create("TextLabel", {
		BackgroundTransparency = 1,
		Font = Theme.FontTitle,
		Text = "",
		TextColor3 = Theme.TextPrimary,
		TextSize = 20,
		TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.new(0, 48, 0, 8),
		Size = UDim2.new(1, -80, 0, 24),
		Parent = Header,
	})

	local SubtitleLabel = Utility:Create("TextLabel", {
		BackgroundTransparency = 1,
		Font = Theme.FontBody,
		Text = "",
		TextColor3 = Theme.TextSecondary,
		TextSize = 15,
		TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.new(0, 48, 0, 30),
		Size = UDim2.new(1, -80, 0, 18),
		Parent = Header,
	})

	Utility:Typewriter(TitleLabel, windowTitle, 0.02)
	task.delay(#windowTitle * 0.02 + 0.1, function()
		Utility:Typewriter(SubtitleLabel, windowSubtitle, 0.015)
	end)

	local CloseButton = Utility:Create("TextButton", {
		BackgroundColor3 = Theme.Background,
		Text = "",
		Position = UDim2.new(1, -44, 0.5, -14),
		Size = UDim2.new(0, 28, 0, 28),
		AutoButtonColor = false,
		Parent = Header,
	})
	Utility:Border(CloseButton, 2)
	Utility:Create("TextLabel", {
		BackgroundTransparency = 1,
		Font = Theme.FontTitle,
		Text = "X",
		TextColor3 = Theme.TextPrimary,
		TextSize = 16,
		Size = UDim2.new(1, 0, 1, 0),
		Parent = CloseButton,
	})
	CloseButton.MouseEnter:Connect(function()
		Utility:Tween(CloseButton, { BackgroundColor3 = Theme.Accent }, SnapTween)
	end)
	CloseButton.MouseLeave:Connect(function()
		Utility:Tween(CloseButton, { BackgroundColor3 = Theme.Background }, SnapTween)
	end)
	CloseButton.MouseButton1Click:Connect(function()
		Utility:Shake(MainFrame, 4, 0.15)
		task.wait(0.15)
		Utility:Tween(MainFrame, { Size = UDim2.new(0, windowSize.X.Offset, 0, 0) }, BoxTween)
		task.wait(0.2)
		ScreenGui.Enabled = false
	end)

	Utility:MakeDraggable(Header, MainFrame)

	local TabBar = Utility:Create("Frame", {
		Name = "TabBar",
		BackgroundColor3 = Theme.Background,
		Position = UDim2.new(0, 0, 0, 64),
		Size = UDim2.new(0, 150, 1, -64),
		Parent = MainFrame,
	})
	Utility:Create("Frame", {
		BackgroundColor3 = Theme.Border,
		Position = UDim2.new(1, -4, 0, 0),
		Size = UDim2.new(0, 4, 1, 0),
		BorderSizePixel = 0,
		Parent = TabBar,
	})
	Utility:Create("UIListLayout", { Parent = TabBar, Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder })
	Utility:Padding(TabBar, 12)

	local ContentArea = Utility:Create("Frame", {
		Name = "ContentArea",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 150, 0, 64),
		Size = UDim2.new(1, -150, 1, -64),
		Parent = MainFrame,
	})

	local Window = setmetatable({}, { __index = DeltaUI })
	Window.ScreenGui = ScreenGui
	Window.MainFrame = MainFrame
	Window.TabBar = TabBar
	Window.ContentArea = ContentArea
	Window.Tabs = {}
	Window.CurrentTab = nil

	self.ScreenGui = ScreenGui

	function Window:CreateTab(name)
		name = name or "TAB"
		local isFirstTab = (#self.Tabs == 0)

		local TabButton = Utility:Create("TextButton", {
			Name = name,
			BackgroundColor3 = isFirstTab and Theme.ContainerLight or Theme.Background,
			Text = "",
			Size = UDim2.new(1, 0, 0, 36),
			AutoButtonColor = false,
			Parent = self.TabBar,
		})
		Utility:Border(TabButton, isFirstTab and 2 or 1)

		local TabHeart = Utility:Create("TextLabel", {
			BackgroundTransparency = 1,
			Font = Theme.FontBody,
			Text = "❤",
			TextColor3 = Theme.Soul,
			TextSize = 14,
			TextTransparency = isFirstTab and 0 or 1,
			Position = UDim2.new(0, 8, 0, 0),
			Size = UDim2.new(0, 16, 1, 0),
			Parent = TabButton,
		})

		local TabLabel = Utility:Create("TextLabel", {
			BackgroundTransparency = 1,
			Font = Theme.FontTitle,
			Text = "* " .. string.upper(name),
			TextColor3 = isFirstTab and Theme.TextPrimary or Theme.TextSecondary,
			TextSize = 13,
			Position = UDim2.new(0, 26, 0, 0),
			Size = UDim2.new(1, -26, 1, 0),
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = TabButton,
		})

		local Page = Utility:Create("ScrollingFrame", {
			Name = name .. "Page",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollBarThickness = 4,
			ScrollBarImageColor3 = Theme.Border,
			Visible = isFirstTab,
			Parent = self.ContentArea,
		})
		Utility:Padding(Page, 18)
		Utility:Create("UIListLayout", { Parent = Page, Padding = UDim.new(0, 12), SortOrder = Enum.SortOrder.LayoutOrder })

		local Tab = setmetatable({}, { __index = DeltaUI })
		Tab.Button = TabButton
		Tab.Page = Page
		Tab.Window = self

		table.insert(self.Tabs, Tab)
		if isFirstTab then self.CurrentTab = Tab end

		TabButton.MouseButton1Click:Connect(function()
			if self.CurrentTab == Tab then return end

			if self.CurrentTab then
				local prev = self.CurrentTab
				Utility:Tween(prev.Button, { BackgroundColor3 = Theme.Background }, SnapTween)
				prev.Button.UIStroke.Thickness = 1
				local prevHeart = prev.Button:FindFirstChild("TextLabel")
				for _, c in ipairs(prev.Button:GetChildren()) do
					if c:IsA("TextLabel") and c.Text == "❤" then Utility:Tween(c, { TextTransparency = 1 }, SnapTween) end
					if c:IsA("TextLabel") and c.Text ~= "❤" then Utility:Tween(c, { TextColor3 = Theme.TextSecondary }, SnapTween) end
				end
				prev.Page.Visible = false
			end

			Utility:Tween(TabButton, { BackgroundColor3 = Theme.ContainerLight }, SnapTween)
			TabButton.UIStroke.Thickness = 2
			Utility:Tween(TabHeart, { TextTransparency = 0 }, SnapTween)
			Utility:Tween(TabLabel, { TextColor3 = Theme.TextPrimary }, SnapTween)
			Page.Visible = true

			self.CurrentTab = Tab
		end)

		local function BaseCard(height)
			local Card = Utility:Create("Frame", {
				BackgroundColor3 = Theme.Container,
				Size = UDim2.new(1, 0, 0, height),
				Parent = Tab.Page,
			})
			Utility:Border(Card, 2)
			return Card
		end

		function Tab:CreateSection(name)
			local SectionLabel = Utility:Create("TextLabel", {
				BackgroundTransparency = 1,
				Font = Theme.FontTitle,
				Text = "* " .. string.upper(name),
				TextColor3 = Theme.TextSecondary,
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, 22),
				Parent = self.Page,
			})
			return SectionLabel
		end

		function Tab:CreateButton(config)
			config = config or {}
			local text = config.Text or "BUTTON"
			local callback = config.Callback or function() end

			local Card = BaseCard(42)
			local Btn = Utility:Create("TextButton", { BackgroundTransparency = 1, Text = "", Size = UDim2.new(1, 0, 1, 0), AutoButtonColor = false, Parent = Card })

			local Heart = Utility:Create("TextLabel", {
				BackgroundTransparency = 1,
				Font = Theme.FontBody,
				Text = "❤",
				TextColor3 = Theme.Soul,
				TextSize = 14,
				TextTransparency = 1,
				Position = UDim2.new(0, 10, 0, 0),
				Size = UDim2.new(0, 16, 1, 0),
				Parent = Btn,
			})

			Utility:Create("TextLabel", {
				BackgroundTransparency = 1,
				Font = Theme.FontTitle,
				Text = "* " .. string.upper(text),
				TextColor3 = Theme.TextPrimary,
				TextSize = 14,
				Position = UDim2.new(0, 30, 0, 0),
				Size = UDim2.new(1, -40, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Btn,
			})

			Btn.MouseEnter:Connect(function()
				Utility:Tween(Card, { BackgroundColor3 = Theme.ContainerLight }, SnapTween)
				Utility:Tween(Heart, { TextTransparency = 0 }, SnapTween)
			end)
			Btn.MouseLeave:Connect(function()
				Utility:Tween(Card, { BackgroundColor3 = Theme.Container }, SnapTween)
				Utility:Tween(Heart, { TextTransparency = 1 }, SnapTween)
			end)
			Btn.MouseButton1Click:Connect(function()
				Utility:Shake(Card, 3, 0.1)
				task.spawn(callback)
			end)

			return { Instance = Card }
		end

		function Tab:CreateToggle(config)
			config = config or {}
			local text = config.Text or "TOGGLE"
			local default = config.Default or false
			local callback = config.Callback or function() end
			local state = default

			local Card = BaseCard(42)

			Utility:Create("TextLabel", {
				BackgroundTransparency = 1,
				Font = Theme.FontTitle,
				Text = "* " .. string.upper(text),
				TextColor3 = Theme.TextPrimary,
				TextSize = 14,
				Position = UDim2.new(0, 14, 0, 0),
				Size = UDim2.new(1, -70, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Card,
			})

			local Box = Utility:Create("Frame", {
				BackgroundColor3 = Theme.Background,
				Position = UDim2.new(1, -46, 0.5, -12),
				Size = UDim2.new(0, 24, 0, 24),
				Parent = Card,
			})
			Utility:Border(Box, 2)

			local Fill = Utility:Create("TextLabel", {
				BackgroundTransparency = 1,
				Font = Theme.FontBody,
				Text = "❤",
				TextColor3 = Theme.Soul,
				TextSize = state and 18 or 0,
				TextTransparency = state and 0 or 1,
				Size = UDim2.new(1, 0, 1, 0),
				Parent = Box,
			})

			local ClickArea = Utility:Create("TextButton", { BackgroundTransparency = 1, Text = "", Size = UDim2.new(1, 0, 1, 0), Parent = Card })

			local function SetState(newState, fromInit)
				state = newState
				Utility:Tween(Fill, { TextTransparency = state and 0 or 1, TextSize = state and 18 or 0 }, SnapTween)
				if not fromInit then task.spawn(callback, state) end
			end

			ClickArea.MouseButton1Click:Connect(function()
				SetState(not state)
			end)

			return {
				Instance = Card,
				Set = function(_, value) SetState(value) end,
				Get = function() return state end,
			}
		end

		function Tab:CreateSlider(config)
			config = config or {}
			local text = config.Text or "SLIDER"
			local min = config.Min or 0
			local max = config.Max or 100
			local default = math.clamp(config.Default or min, min, max)
			local increment = config.Increment or 1
			local callback = config.Callback or function() end
			local value = default

			local Card = BaseCard(56)

			Utility:Create("TextLabel", {
				BackgroundTransparency = 1,
				Font = Theme.FontTitle,
				Text = "* " .. string.upper(text),
				TextColor3 = Theme.TextPrimary,
				TextSize = 14,
				Position = UDim2.new(0, 14, 0, 8),
				Size = UDim2.new(1, -80, 0, 18),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Card,
			})

			local ValueLabel = Utility:Create("TextLabel", {
				BackgroundTransparency = 1,
				Font = Theme.FontMono,
				Text = tostring(value),
				TextColor3 = Theme.TextSecondary,
				TextSize = 13,
				Position = UDim2.new(1, -60, 0, 8),
				Size = UDim2.new(0, 46, 0, 18),
				TextXAlignment = Enum.TextXAlignment.Right,
				Parent = Card,
			})

			local Track = Utility:Create("Frame", {
				BackgroundColor3 = Theme.Background,
				Position = UDim2.new(0, 14, 0, 34),
				Size = UDim2.new(1, -28, 0, 10),
				Parent = Card,
			})
			Utility:Border(Track, 2)

			local Fill = Utility:Create("Frame", {
				BackgroundColor3 = Theme.Soul,
				Size = UDim2.new((value - min) / (max - min), 0, 1, 0),
				BorderSizePixel = 0,
				Parent = Track,
			})

			local dragging = false

			local function UpdateFromInput(inputPos)
				local relative = math.clamp((inputPos.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
				local rawValue = min + (max - min) * relative
				local steppedValue = math.floor(rawValue / increment + 0.5) * increment
				steppedValue = math.clamp(steppedValue, min, max)
				value = steppedValue

				local pct = (value - min) / (max - min)
				Fill.Size = UDim2.new(pct, 0, 1, 0)
				ValueLabel.Text = tostring(value)
				task.spawn(callback, value)
			end

			Track.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					UpdateFromInput(input.Position)
				end
			end)
			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = false
				end
			end)
			UserInputService.InputChanged:Connect(function(input)
				if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					UpdateFromInput(input.Position)
				end
			end)

			return {
				Instance = Card,
				Set = function(_, newValue)
					UpdateFromInput({ X = Track.AbsolutePosition.X + (newValue - min) / (max - min) * Track.AbsoluteSize.X })
				end,
				Get = function() return value end,
			}
		end

		function Tab:CreateDropdown(config)
			config = config or {}
			local text = config.Text or "DROPDOWN"
			local options = config.Options or {}
			local default = config.Default
			local multi = config.Multi or false
			local callback = config.Callback or function() end

			local selected = multi and {} or default
			if multi and default then
				for _, v in ipairs(default) do selected[v] = true end
			end

			local Card = BaseCard(42)
			Card.ClipsDescendants = true

			local Header = Utility:Create("TextButton", { BackgroundTransparency = 1, Text = "", Size = UDim2.new(1, 0, 0, 42), AutoButtonColor = false, Parent = Card })

			Utility:Create("TextLabel", {
				BackgroundTransparency = 1,
				Font = Theme.FontTitle,
				Text = "* " .. string.upper(text),
				TextColor3 = Theme.TextPrimary,
				TextSize = 14,
				Position = UDim2.new(0, 14, 0, 0),
				Size = UDim2.new(1, -84, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Header,
			})

			local SelectedLabel = Utility:Create("TextLabel", {
				BackgroundTransparency = 1,
				Font = Theme.FontMono,
				Text = (not multi and tostring(selected or "...")) or "...",
				TextColor3 = Theme.TextSecondary,
				TextSize = 12,
				Position = UDim2.new(1, -108, 0, 0),
				Size = UDim2.new(0, 68, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Right,
				TextTruncate = Enum.TextTruncate.AtEnd,
				Parent = Header,
			})

			local Arrow = Utility:Create("TextLabel", {
				BackgroundTransparency = 1,
				Font = Theme.FontTitle,
				Text = "v",
				TextColor3 = Theme.TextSecondary,
				TextSize = 14,
				Position = UDim2.new(1, -30, 0, 0),
				Size = UDim2.new(0, 20, 1, 0),
				Parent = Header,
			})

			local OptionsHolder = Utility:Create("Frame", {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 8, 0, 44),
				Size = UDim2.new(1, -16, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = Card,
			})
			Utility:Create("UIListLayout", { Parent = OptionsHolder, Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder })

			local expanded = false
			local optionButtons = {}

			local function RefreshSelectedLabel()
				if multi then
					local names = {}
					for opt, isSel in pairs(selected) do
						if isSel then table.insert(names, opt) end
					end
					SelectedLabel.Text = #names > 0 and (#names .. " sel.") or "..."
				else
					SelectedLabel.Text = tostring(selected or "...")
				end
			end

			local function BuildOptions()
				for _, btn in ipairs(optionButtons) do btn:Destroy() end
				optionButtons = {}

				for _, option in ipairs(options) do
					local isSelected = multi and selected[option] or (selected == option)

					local OptBtn = Utility:Create("TextButton", {
						BackgroundColor3 = isSelected and Theme.AccentDark or Theme.Background,
						Text = "",
						Size = UDim2.new(1, 0, 0, 30),
						AutoButtonColor = false,
						Parent = OptionsHolder,
					})
					Utility:Border(OptBtn, 1)

					Utility:Create("TextLabel", {
						BackgroundTransparency = 1,
						Font = Theme.FontBody,
						Text = (isSelected and "❤ " or "  ") .. tostring(option),
						TextColor3 = isSelected and Theme.TextPrimary or Theme.TextSecondary,
						TextSize = 13,
						Position = UDim2.new(0, 10, 0, 0),
						Size = UDim2.new(1, -10, 1, 0),
						TextXAlignment = Enum.TextXAlignment.Left,
						Parent = OptBtn,
					})

					OptBtn.MouseButton1Click:Connect(function()
						if multi then
							selected[option] = not selected[option]
							task.spawn(callback, selected)
						else
							selected = option
							expanded = false
							Utility:Tween(Card, { Size = UDim2.new(1, 0, 0, 42) }, SnapTween)
							Arrow.Text = "v"
							task.spawn(callback, selected)
						end
						RefreshSelectedLabel()
						BuildOptions()
					end)
				end
			end

			BuildOptions()
			RefreshSelectedLabel()

			Header.MouseButton1Click:Connect(function()
				expanded = not expanded
				if expanded then
					local targetHeight = 44 + #options * 34 + 8
					Utility:Tween(Card, { Size = UDim2.new(1, 0, 0, targetHeight) }, BoxTween)
					Arrow.Text = "^"
				else
					Utility:Tween(Card, { Size = UDim2.new(1, 0, 0, 42) }, SnapTween)
					Arrow.Text = "v"
				end
			end)

			return {
				Instance = Card,
				Get = function() return selected end,
				Set = function(_, value)
					selected = value
					RefreshSelectedLabel()
					BuildOptions()
				end,
				Refresh = function(_, newOptions)
					options = newOptions
					BuildOptions()
				end,
			}
		end

		function Tab:CreateColorPicker(config)
			config = config or {}
			local text = config.Text or "COLOR"
			local default = config.Default or Color3.fromRGB(255, 50, 50)
			local callback = config.Callback or function() end
			local color = default

			local Card = BaseCard(42)
			Card.ClipsDescendants = true

			local Header = Utility:Create("TextButton", { BackgroundTransparency = 1, Text = "", Size = UDim2.new(1, 0, 0, 42), AutoButtonColor = false, Parent = Card })

			Utility:Create("TextLabel", {
				BackgroundTransparency = 1,
				Font = Theme.FontTitle,
				Text = "* " .. string.upper(text),
				TextColor3 = Theme.TextPrimary,
				TextSize = 14,
				Position = UDim2.new(0, 14, 0, 0),
				Size = UDim2.new(1, -60, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Header,
			})

			local Preview = Utility:Create("Frame", {
				BackgroundColor3 = color,
				Position = UDim2.new(1, -42, 0.5, -11),
				Size = UDim2.new(0, 26, 0, 22),
				Parent = Header,
			})
			Utility:Border(Preview, 2)

			local Panel = Utility:Create("Frame", {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 8, 0, 46),
				Size = UDim2.new(1, -16, 0, 100),
				Parent = Card,
			})
			Utility:Create("UIListLayout", { Parent = Panel, Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder })

			local function MakeChannelSlider(channelName, initial)
				local Row = Utility:Create("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 26), Parent = Panel })
				Utility:Create("TextLabel", {
					BackgroundTransparency = 1,
					Font = Theme.FontMono,
					Text = channelName,
					TextColor3 = Theme.TextSecondary,
					TextSize = 12,
					Size = UDim2.new(0, 16, 1, 0),
					Parent = Row,
				})
				local Track = Utility:Create("Frame", {
					BackgroundColor3 = Theme.Background,
					Position = UDim2.new(0, 20, 0.5, -4),
					Size = UDim2.new(1, -20, 0, 8),
					Parent = Row,
				})
				Utility:Border(Track, 1)
				local Fill = Utility:Create("Frame", {
					BackgroundColor3 = Theme.Soul,
					Size = UDim2.new(initial / 255, 0, 1, 0),
					BorderSizePixel = 0,
					Parent = Track,
				})
				return Row, Track, Fill
			end

			local r, g, b = math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255)
			local _, trackR, fillR = MakeChannelSlider("R", r)
			local _, trackG, fillG = MakeChannelSlider("G", g)
			local _, trackB, fillB = MakeChannelSlider("B", b)

			local function UpdateColor()
				color = Color3.fromRGB(r, g, b)
				Preview.BackgroundColor3 = color
				task.spawn(callback, color)
			end

			local function BindTrack(track, fill, setter)
				local dragging = false
				local function update(pos)
					local pct = math.clamp((pos.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
					fill.Size = UDim2.new(pct, 0, 1, 0)
					setter(math.floor(pct * 255))
					UpdateColor()
				end
				track.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						dragging = true
						update(input.Position)
					end
				end)
				UserInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						dragging = false
					end
				end)
				UserInputService.InputChanged:Connect(function(input)
					if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
						update(input.Position)
					end
				end)
			end

			BindTrack(trackR, fillR, function(v) r = v end)
			BindTrack(trackG, fillG, function(v) g = v end)
			BindTrack(trackB, fillB, function(v) b = v end)

			local expanded = false
			Header.MouseButton1Click:Connect(function()
				expanded = not expanded
				Utility:Tween(Card, { Size = UDim2.new(1, 0, 0, expanded and 156 or 42) }, BoxTween)
			end)

			return {
				Instance = Card,
				Get = function() return color end,
				Set = function(_, newColor)
					r, g, b = math.floor(newColor.R * 255), math.floor(newColor.G * 255), math.floor(newColor.B * 255)
					fillR.Size = UDim2.new(r / 255, 0, 1, 0)
					fillG.Size = UDim2.new(g / 255, 0, 1, 0)
					fillB.Size = UDim2.new(b / 255, 0, 1, 0)
					UpdateColor()
				end,
			}
		end

		function Tab:CreateTextbox(config)
			config = config or {}
			local text = config.Text or "TEXTBOX"
			local placeholder = config.Placeholder or "..."
			local default = config.Default or ""
			local callback = config.Callback or function() end

			local Card = BaseCard(42)

			Utility:Create("TextLabel", {
				BackgroundTransparency = 1,
				Font = Theme.FontTitle,
				Text = "* " .. string.upper(text),
				TextColor3 = Theme.TextPrimary,
				TextSize = 14,
				Position = UDim2.new(0, 14, 0, 0),
				Size = UDim2.new(0, 100, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Card,
			})

			local InputBox = Utility:Create("TextBox", {
				BackgroundColor3 = Theme.Background,
				Text = default,
				PlaceholderText = placeholder,
				PlaceholderColor3 = Theme.TextDisabled,
				Font = Theme.FontMono,
				TextColor3 = Theme.TextPrimary,
				TextSize = 13,
				ClearTextOnFocus = false,
				Position = UDim2.new(1, -160, 0.5, -14),
				Size = UDim2.new(0, 146, 0, 28),
				Parent = Card,
			})
			Utility:Border(InputBox, 2)
			Utility:Padding(InputBox, 8)

			InputBox.FocusLost:Connect(function(enterPressed)
				task.spawn(callback, InputBox.Text, enterPressed)
			end)

			return {
				Instance = Card,
				Get = function() return InputBox.Text end,
				Set = function(_, value) InputBox.Text = value end,
			}
		end

		function Tab:CreateKeybind(config)
			config = config or {}
			local text = config.Text or "KEYBIND"
			local default = config.Default or Enum.KeyCode.RightShift
			local callback = config.Callback or function() end
			local currentKey = default
			local listening = false

			local Card = BaseCard(42)

			Utility:Create("TextLabel", {
				BackgroundTransparency = 1,
				Font = Theme.FontTitle,
				Text = "* " .. string.upper(text),
				TextColor3 = Theme.TextPrimary,
				TextSize = 14,
				Position = UDim2.new(0, 14, 0, 0),
				Size = UDim2.new(1, -110, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = Card,
			})

			local KeyButton = Utility:Create("TextButton", {
				BackgroundColor3 = Theme.Background,
				Text = currentKey.Name,
				Font = Theme.FontMono,
				TextColor3 = Theme.Soul,
				TextSize = 13,
				AutoButtonColor = false,
				Position = UDim2.new(1, -96, 0.5, -14),
				Size = UDim2.new(0, 82, 0, 28),
				Parent = Card,
			})
			Utility:Border(KeyButton, 2)

			KeyButton.MouseButton1Click:Connect(function()
				listening = true
				KeyButton.Text = "..."
				Utility:Tween(KeyButton, { BackgroundColor3 = Theme.AccentDark }, SnapTween)
			end)

			UserInputService.InputBegan:Connect(function(input, gameProcessed)
				if listening and input.UserInputType == Enum.UserInputType.Keyboard then
					currentKey = input.KeyCode
					KeyButton.Text = currentKey.Name
					listening = false
					Utility:Tween(KeyButton, { BackgroundColor3 = Theme.Background }, SnapTween)
				elseif not listening and not gameProcessed and input.KeyCode == currentKey then
					task.spawn(callback)
				end
			end)

			return {
				Instance = Card,
				Get = function() return currentKey end,
				Set = function(_, keyCode)
					currentKey = keyCode
					KeyButton.Text = currentKey.Name
				end,
			}
		end

		return Tab
	end

	table.insert(DeltaUI.Windows, Window)
	return Window
end

return DeltaUI
