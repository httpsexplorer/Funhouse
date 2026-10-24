-- ShopifyFrame TEST (fixed local limit + ASCII)
-- loadstring(game:HttpGet(URL))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local G = {}

-- Stolen: Players.Milkyy_xoyz.PlayerGui.MainGui.ShopifyFrame
-- Class: Frame
-- Pink's Steal GUI


G.ShopifyFrame = Instance.new("Frame")
G.ShopifyFrame.Name = "ShopifyFrame"
G.ShopifyFrame.Size = UDim2.new(0.599122,0,0.717493,0)
G.ShopifyFrame.Position = UDim2.new(0.499889,0,0.497089,0)
G.ShopifyFrame.AnchorPoint = Vector2.new(0.5,0.5)
G.ShopifyFrame.BackgroundColor3 = Color3.fromRGB(121,0,0)
G.ShopifyFrame.BackgroundTransparency = 1
G.ShopifyFrame.BorderColor3 = Color3.fromRGB(0,0,0)
G.ShopifyFrame.BorderSizePixel = 0
G.ShopifyFrame.Visible = true
G.ShopifyFrame.ZIndex = 2
G.ShopifyFrame:SetAttribute("Allowed", false)

G.Background = Instance.new("ImageLabel")
G.Background.Name = "Background"
G.Background.Size = UDim2.new(0.923953,0,1.00135,0)
G.Background.Position = UDim2.new(0.0407381,0,0.00302815,0)
G.Background.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Background.BackgroundTransparency = 1
G.Background.BorderSizePixel = 0
G.Background.Image = "rbxassetid://71234472219611"
G.Background.ImageColor3 = Color3.fromRGB(144,144,144)
G.Background.ScaleType = Enum.ScaleType.Fit
G.Background.ZIndex = 0
G.Background.Parent = G.ShopifyFrame

G.ExitButton = Instance.new("ImageButton")
G.ExitButton.Name = "ExitButton"
G.ExitButton.Size = UDim2.new(0.2,0,0.079,0)
G.ExitButton.Position = UDim2.new(0.888,0,0.054,0)
G.ExitButton.AnchorPoint = Vector2.new(0.5,0.5)
G.ExitButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.ExitButton.BackgroundTransparency = 1
G.ExitButton.BorderSizePixel = 0
G.ExitButton.Image = "rbxassetid://77109511791509"
G.ExitButton:SetAttribute("OriginalSize", UDim2.new(0.2,0,0.079,0))
G.ExitButton.Parent = G.ShopifyFrame

G.UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint.Parent = G.ExitButton

G.UIScale = Instance.new("UIScale")
G.UIScale.Name = "UIScale"
G.UIScale.Parent = G.ExitButton

G.Filter = Instance.new("ImageLabel")
G.Filter.Name = "Filter"
G.Filter.Size = UDim2.new(0.873047,0,0.98303,0)
G.Filter.Position = UDim2.new(0.0689526,0,0.00302816,0)
G.Filter.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Filter.BackgroundTransparency = 1
G.Filter.BorderSizePixel = 0
G.Filter.ImageColor3 = Color3.fromRGB(150,150,150)
G.Filter.ImageTransparency = 0.61
G.Filter.ScaleType = Enum.ScaleType.Fit
G.Filter.ZIndex = 15
G.Filter.Parent = G.ShopifyFrame

G.Old = Instance.new("ImageLabel")
G.Old.Name = "Old"
G.Old.Size = UDim2.new(1,0,1,0)
G.Old.Position = UDim2.new(0.5,0,-0.120825,0)
G.Old.AnchorPoint = Vector2.new(0.5,0)
G.Old.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Old.BackgroundTransparency = 1
G.Old.BorderSizePixel = 0
G.Old.Image = "rbxassetid://96018322960874"
G.Old.ImageColor3 = Color3.fromRGB(150,150,150)
G.Old.ImageTransparency = 0.88
G.Old.ZIndex = 15
G.Old.Parent = G.Filter

G.UIGradient = Instance.new("UIGradient")
G.UIGradient.Name = "UIGradient"
G.UIGradient.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.42508,0,0),NumberSequenceKeypoint.new(0.509033,1,0),NumberSequenceKeypoint.new(0.616366,0,0),NumberSequenceKeypoint.new(1,0,0)})
G.UIGradient.Rotation = 90
G.UIGradient.Offset = Vector2.new(0,0)
G.UIGradient.Enabled = false
G.UIGradient.Parent = G.Old

G.UIScale2 = Instance.new("UIScale")
G.UIScale2.Name = "UIScale"
G.UIScale2.Scale = 1.00614
G.UIScale2.Parent = G.Old

G.Frame = Instance.new("Frame")
G.Frame.Name = "Frame"
G.Frame.Size = UDim2.new(1,0,1,0)
G.Frame.Position = UDim2.new(0.5,0,0.5,0)
G.Frame.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame.BackgroundColor3 = Color3.fromRGB(255,0,0)
G.Frame.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame.BorderSizePixel = 0
G.Frame.Visible = false
G.Frame.ZIndex = 2
G.Frame.Parent = G.ShopifyFrame

G.ImageLabel = Instance.new("ImageLabel")
G.ImageLabel.Name = "ImageLabel"
G.ImageLabel.Size = UDim2.new(1,0,1,0)
G.ImageLabel.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.ImageLabel.BackgroundTransparency = 1
G.ImageLabel.BorderSizePixel = 0
G.ImageLabel.Image = "rbxassetid://6794283750"
G.ImageLabel.ImageTransparency = 0.98
G.ImageLabel.ScaleType = Enum.ScaleType.Tile
G.ImageLabel.Parent = G.Frame

G.UICorner = Instance.new("UICorner")
G.UICorner.Name = "UICorner"
G.UICorner.Parent = G.Frame

G.UIGradient2 = Instance.new("UIGradient")
G.UIGradient2.Name = "UIGradient"
G.UIGradient2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(140,140,140)),ColorSequenceKeypoint.new(1,Color3.fromRGB(81,81,81))})
G.UIGradient2.Rotation = 90
G.UIGradient2.Offset = Vector2.new(0,0)
G.UIGradient2.Parent = G.Frame

G.FrameBG = Instance.new("Frame")
G.FrameBG.Name = "FrameBG"
G.FrameBG.Size = UDim2.new(1.03071,0,1.05721,0)
G.FrameBG.Position = UDim2.new(0.5,0,0.5,0)
G.FrameBG.AnchorPoint = Vector2.new(0.5,0.5)
G.FrameBG.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.FrameBG.BorderColor3 = Color3.fromRGB(0,0,0)
G.FrameBG.BorderSizePixel = 0
G.FrameBG.Visible = false
G.FrameBG.Parent = G.ShopifyFrame

G.UICorner2 = Instance.new("UICorner")
G.UICorner2.Name = "UICorner"
G.UICorner2.Parent = G.FrameBG

G.HoverWindow = Instance.new("Frame")
G.HoverWindow.Name = "HoverWindow"
G.HoverWindow.Size = UDim2.new(0.333,0,0.7,0)
G.HoverWindow.Position = UDim2.new(0,0,0.5,0)
G.HoverWindow.AnchorPoint = Vector2.new(0.5,0.5)
G.HoverWindow.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.HoverWindow.BackgroundTransparency = 1
G.HoverWindow.BorderColor3 = Color3.fromRGB(0,0,0)
G.HoverWindow.BorderSizePixel = 0
G.HoverWindow.ZIndex = 15
G.HoverWindow.Parent = G.ShopifyFrame

G.BG = Instance.new("Frame")
G.BG.Name = "BG"
G.BG.Size = UDim2.new(1.03302,0,1.05281,0)
G.BG.Position = UDim2.new(0.5,0,0.490778,0)
G.BG.AnchorPoint = Vector2.new(0.5,0.5)
G.BG.BackgroundColor3 = Color3.fromRGB(7,7,7)
G.BG.BackgroundTransparency = 1
G.BG.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG.BorderSizePixel = 0
G.BG.ZIndex = -1
G.BG.Parent = G.HoverWindow

G.Background2 = Instance.new("ImageLabel")
G.Background2.Name = "Background"
G.Background2.Size = UDim2.new(1,0,1,0)
G.Background2.Position = UDim2.new(0.5,0,0.5,0)
G.Background2.AnchorPoint = Vector2.new(0.5,0.5)
G.Background2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Background2.BackgroundTransparency = 1
G.Background2.BorderSizePixel = 0
G.Background2.Image = "rbxassetid://91674148062510"
G.Background2.ScaleType = Enum.ScaleType.Fit
G.Background2.ZIndex = 0
G.Background2.Parent = G.BG

G.Style = Instance.new("ImageLabel")
G.Style.Name = "Style"
G.Style.Size = UDim2.new(1,0,1,0)
G.Style.Position = UDim2.new(0.5,0,0.5,0)
G.Style.AnchorPoint = Vector2.new(0.5,0.5)
G.Style.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Style.BackgroundTransparency = 1
G.Style.BorderSizePixel = 0
G.Style.Image = "rbxassetid://121124169704314"
G.Style.ScaleType = Enum.ScaleType.Fit
G.Style.ZIndex = 0
G.Style.Parent = G.BG

G.Item = Instance.new("ImageButton")
G.Item.Name = "Item"
G.Item.Size = UDim2.new(1,0,1,0)
G.Item.Position = UDim2.new(0.5,0,0.45,0)
G.Item.AnchorPoint = Vector2.new(0.5,0.5)
G.Item.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item.BackgroundTransparency = 1
G.Item.BorderSizePixel = 0
G.Item.Image = "rbxassetid://2735820382"
G.Item.ScaleType = Enum.ScaleType.Fit
G.Item.Parent = G.HoverWindow

G.UIAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint2.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint2.Parent = G.Item

G.Unavailable = Instance.new("TextLabel")
G.Unavailable.Name = "Unavailable"
G.Unavailable.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable.BackgroundTransparency = 1
G.Unavailable.BorderSizePixel = 0
G.Unavailable.Text = "Unavailable"
G.Unavailable.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable.TextSize = 14
G.Unavailable.Font = Enum.Font.FredokaOne
G.Unavailable.TextWrapped = true
G.Unavailable.TextScaled = true
G.Unavailable.Visible = false
G.Unavailable.Parent = G.Item

G.UIStroke = Instance.new("UIStroke")
G.UIStroke.Name = "UIStroke"
G.UIStroke.Thickness = 2
G.UIStroke.Parent = G.Unavailable

G.PageDots = Instance.new("Frame")
G.PageDots.Name = "PageDots"
G.PageDots.Size = UDim2.new(0.7,0,0.075,0)
G.PageDots.Position = UDim2.new(0.5,0,0.8,0)
G.PageDots.AnchorPoint = Vector2.new(0.5,0.5)
G.PageDots.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.PageDots.BackgroundTransparency = 1
G.PageDots.BorderColor3 = Color3.fromRGB(0,0,0)
G.PageDots.BorderSizePixel = 0
G.PageDots.Parent = G.HoverWindow

G.UIListLayout = Instance.new("UIListLayout")
G.UIListLayout.Name = "UIListLayout"
G.UIListLayout.Padding = UDim.new(0.05,0)
G.UIListLayout.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
G.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
G.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout.Wraps = false
G.UIListLayout.Parent = G.PageDots

G.Purchase = Instance.new("ImageButton")
G.Purchase.Name = "Purchase"
G.Purchase.Size = UDim2.new(0.70159,0,0.133162,0)
G.Purchase.Position = UDim2.new(0.5,0,0.9,0)
G.Purchase.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase.BackgroundColor3 = Color3.fromRGB(102,213,117)
G.Purchase.BackgroundTransparency = 1
G.Purchase.BorderSizePixel = 0
G.Purchase.Image = "rbxassetid://83503830393339"
G.Purchase.ScaleType = Enum.ScaleType.Fit
G.Purchase.Parent = G.HoverWindow

G.Price = Instance.new("TextLabel")
G.Price.Name = "Price"
G.Price.Size = UDim2.new(0.78479,0,0.603976,0)
G.Price.Position = UDim2.new(0.100663,0,0.190473,0)
G.Price.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price.BackgroundTransparency = 1
G.Price.BorderSizePixel = 0
G.Price.Text = "$19.99"
G.Price.TextColor3 = Color3.fromRGB(255,255,255)
G.Price.TextSize = 14
G.Price.Font = Enum.Font.FredokaOne
G.Price.TextWrapped = true
G.Price.TextScaled = true
G.Price.RichText = true
G.Price.AutomaticSize = Enum.AutomaticSize.X
G.Price.Parent = G.Purchase

G.UIStroke2 = Instance.new("UIStroke")
G.UIStroke2.Name = "UIStroke"
G.UIStroke2.Thickness = 4
G.UIStroke2.Parent = G.Price

G.UIAspectRatioConstraint3 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint3.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint3.AspectRatio = 3
G.UIAspectRatioConstraint3.Parent = G.Purchase

G.Title = Instance.new("TextLabel")
G.Title.Name = "Title"
G.Title.Size = UDim2.new(0.563233,0,0.0719699,0)
G.Title.Position = UDim2.new(0.5,0,0.05,0)
G.Title.AnchorPoint = Vector2.new(0.5,0)
G.Title.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title.BackgroundTransparency = 1
G.Title.BorderSizePixel = 0
G.Title.Text = "Preview"
G.Title.TextColor3 = Color3.fromRGB(255,255,255)
G.Title.TextSize = 14
G.Title.Font = Enum.Font.FredokaOne
G.Title.TextWrapped = true
G.Title.TextScaled = true
G.Title.TextTransparency = 0.5
G.Title.RichText = true
G.Title.AutomaticSize = Enum.AutomaticSize.X
G.Title.Parent = G.HoverWindow

G.UIStroke3 = Instance.new("UIStroke")
G.UIStroke3.Name = "UIStroke"
G.UIStroke3.Thickness = 4
G.UIStroke3.Parent = G.Title

G.UIAspectRatioConstraint4 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint4.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint4.AspectRatio = 0.64
G.UIAspectRatioConstraint4.Parent = G.HoverWindow

G.UIScale3 = Instance.new("UIScale")
G.UIScale3.Name = "UIScale"
G.UIScale3.Scale = 1
G.UIScale3.Parent = G.HoverWindow

G.Logo = Instance.new("ImageLabel")
G.Logo.Name = "Logo"
G.Logo.Size = UDim2.new(0.0769116,0,0.0833539,0)
G.Logo.Position = UDim2.new(0.106896,0,0.0500381,0)
G.Logo.AnchorPoint = Vector2.new(0.5,0.5)
G.Logo.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Logo.BackgroundTransparency = 1
G.Logo.BorderSizePixel = 0
G.Logo.Image = "rbxassetid://75699125288122"
G.Logo.ScaleType = Enum.ScaleType.Fit
G.Logo.ZIndex = 0
G.Logo.Parent = G.ShopifyFrame

G.Scrolling = Instance.new("Frame")
G.Scrolling.Name = "Scrolling"
G.Scrolling.Size = UDim2.new(0.053055,0,0.811257,0)
G.Scrolling.Position = UDim2.new(0.890555,0,0.541841,0)
G.Scrolling.AnchorPoint = Vector2.new(0.5,0.5)
G.Scrolling.BackgroundColor3 = Color3.fromRGB(255,0,0)
G.Scrolling.BackgroundTransparency = 1
G.Scrolling.BorderColor3 = Color3.fromRGB(0,0,0)
G.Scrolling.BorderSizePixel = 0
G.Scrolling.ZIndex = 2
G.Scrolling.Parent = G.ShopifyFrame

G.Background3 = Instance.new("ImageLabel")
G.Background3.Name = "Background"
G.Background3.Size = UDim2.new(1,0,1,0)
G.Background3.Position = UDim2.new(0.5,0,0.5,0)
G.Background3.AnchorPoint = Vector2.new(0.5,0.5)
G.Background3.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Background3.BackgroundTransparency = 1
G.Background3.BorderSizePixel = 0
G.Background3.Image = "rbxassetid://126991782327713"
G.Background3.ImageColor3 = Color3.fromRGB(165,165,165)
G.Background3.ScaleType = Enum.ScaleType.Fit
G.Background3.Parent = G.Scrolling

G.Size = Instance.new("Frame")
G.Size.Name = "Size"
G.Size.Size = UDim2.new(1,0,0.597562,0)
G.Size.Position = UDim2.new(0.503153,0,0.413733,0)
G.Size.AnchorPoint = Vector2.new(0.5,0.5)
G.Size.BackgroundColor3 = Color3.fromRGB(255,0,0)
G.Size.BackgroundTransparency = 1
G.Size.BorderColor3 = Color3.fromRGB(0,0,0)
G.Size.BorderSizePixel = 0
G.Size.ZIndex = 2
G.Size.Parent = G.Scrolling

G.Thumb = Instance.new("ImageButton")
G.Thumb.Name = "Thumb"
G.Thumb.Size = UDim2.new(1,0,0.29,0)
G.Thumb.Position = UDim2.new(0.5,0,0.0777458,0)
G.Thumb.AnchorPoint = Vector2.new(0.5,0)
G.Thumb.BackgroundColor3 = Color3.fromRGB(248,248,248)
G.Thumb.BackgroundTransparency = 1
G.Thumb.BorderSizePixel = 0
G.Thumb.Image = "rbxassetid://123332636773430"
G.Thumb.ScaleType = Enum.ScaleType.Fit
G.Thumb.Active = false
G.Thumb.Parent = G.Size

G.ScrollingFrame = Instance.new("ScrollingFrame")
G.ScrollingFrame.Name = "ScrollingFrame"
G.ScrollingFrame.Size = UDim2.new(0.812904,0,0.831928,0)
G.ScrollingFrame.Position = UDim2.new(0.510797,0,0.124895,0)
G.ScrollingFrame.AnchorPoint = Vector2.new(0.5,0)
G.ScrollingFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.ScrollingFrame.BackgroundTransparency = 1
G.ScrollingFrame.BorderSizePixel = 0
G.ScrollingFrame.ZIndex = 10
G.ScrollingFrame.CanvasSize = UDim2.new(0,0,4,0)
G.ScrollingFrame.ScrollBarThickness = 34
G.ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
G.ScrollingFrame.ScrollBarImageTransparency = 1
G.ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
G.ScrollingFrame.ScrollingEnabled = true
G.ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
G.ScrollingFrame.Active = true
G.ScrollingFrame.Parent = G.ShopifyFrame

G.Spacer = Instance.new("Frame")
G.Spacer.Name = "Spacer"
G.Spacer.Size = UDim2.new(1.05791,0,0.0430434,0)
G.Spacer.Position = UDim2.new(-5.82348e-08,0,-0.186381,0)
G.Spacer.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Spacer.BackgroundTransparency = 1
G.Spacer.BorderColor3 = Color3.fromRGB(0,0,0)
G.Spacer.BorderSizePixel = 0
G.Spacer.LayoutOrder = -30
G.Spacer.Parent = G.ScrollingFrame

G.Special = Instance.new("Frame")
G.Special.Name = "Special"
G.Special.Size = UDim2.new(1.10498,0,0.439953,0)
G.Special.Position = UDim2.new(0,0,-0.143337,0)
G.Special.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special.BackgroundTransparency = 1
G.Special.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special.BorderSizePixel = 0
G.Special.LayoutOrder = -18
G.Special.Parent = G.ScrollingFrame

G.COM_5988786514287526337 = Instance.new("Frame")
G.COM_5988786514287526337.Name = "COM-5988786514287526337"
G.COM_5988786514287526337.Size = UDim2.new(0.894307,0,0.931111,0)
G.COM_5988786514287526337.Position = UDim2.new(-5.79236e-08,0,0,0)
G.COM_5988786514287526337.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_5988786514287526337.BackgroundTransparency = 1
G.COM_5988786514287526337.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_5988786514287526337.BorderSizePixel = 0
G.COM_5988786514287526337.Parent = G.Special

G.BG2 = Instance.new("Frame")
G.BG2.Name = "BG"
G.BG2.Size = UDim2.new(1,0,1,0)
G.BG2.Position = UDim2.new(0.5,0,0.5,0)
G.BG2.AnchorPoint = Vector2.new(0.5,0.5)
G.BG2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG2.BackgroundTransparency = 1
G.BG2.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG2.BorderSizePixel = 0
G.BG2.ZIndex = -1
G.BG2.Parent = G.COM_5988786514287526337

G.Dropshadow = Instance.new("Frame")
G.Dropshadow.Name = "Dropshadow"
G.Dropshadow.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow.AnchorPoint = Vector2.new(0,1)
G.Dropshadow.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow.BackgroundTransparency = 0.5
G.Dropshadow.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow.BorderSizePixel = 0
G.Dropshadow.ZIndex = -2
G.Dropshadow.Parent = G.BG2

G.UIStroke4 = Instance.new("UIStroke")
G.UIStroke4.Name = "UIStroke"
G.UIStroke4.Thickness = 2.79551
G.UIStroke4.Transparency = 1
G.UIStroke4.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke4.Parent = G.Dropshadow

G.Frame2 = Instance.new("Frame")
G.Frame2.Name = "Frame"
G.Frame2.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame2.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame2.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame2.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame2.BorderSizePixel = 0
G.Frame2.ZIndex = -1
G.Frame2.Parent = G.BG2

G.Pattern = Instance.new("ImageLabel")
G.Pattern.Name = "Pattern"
G.Pattern.Size = UDim2.new(0.635249,0,1,0)
G.Pattern.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern.BackgroundTransparency = 1
G.Pattern.BorderSizePixel = 0
G.Pattern.Image = "rbxassetid://129067201766685"
G.Pattern.ZIndex = -1
G.Pattern.Parent = G.Frame2

G.UIStroke5 = Instance.new("UIStroke")
G.UIStroke5.Name = "UIStroke"
G.UIStroke5.Thickness = 1.86368
G.UIStroke5.Parent = G.Pattern

G.UIStroke6 = Instance.new("UIStroke")
G.UIStroke6.Name = "UIStroke"
G.UIStroke6.Thickness = 1.86368
G.UIStroke6.Parent = G.Frame2

G.Highlight = Instance.new("Frame")
G.Highlight.Name = "Highlight"
G.Highlight.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight.BorderSizePixel = 0
G.Highlight.Visible = false
G.Highlight.ZIndex = -2
G.Highlight.Parent = G.BG2

G.UIStroke7 = Instance.new("UIStroke")
G.UIStroke7.Name = "UIStroke"
G.UIStroke7.Color = Color3.fromRGB(255,242,0)
G.UIStroke7.Thickness = 2.79551
G.UIStroke7.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke7.Parent = G.Highlight

G.CanvasGroup = Instance.new("CanvasGroup")
G.CanvasGroup.Name = "CanvasGroup"
G.CanvasGroup.Size = UDim2.new(1,0,1,0)
G.CanvasGroup.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup.BackgroundTransparency = 1
G.CanvasGroup.Parent = G.COM_5988786514287526337

G.Thumbnail = Instance.new("ImageLabel")
G.Thumbnail.Name = "Thumbnail"
G.Thumbnail.Size = UDim2.new(0.517632,0,1.30457,0)
G.Thumbnail.Position = UDim2.new(0.11632,0,0.497652,0)
G.Thumbnail.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail.BackgroundTransparency = 1
G.Thumbnail.BorderSizePixel = 0
G.Thumbnail.Image = "rbxassetid://134545329179225"
G.Thumbnail.ScaleType = Enum.ScaleType.Fit
G.Thumbnail.ZIndex = 0
G.Thumbnail.Rotation = -11
G.Thumbnail.Parent = G.CanvasGroup

G.Unavailable2 = Instance.new("TextLabel")
G.Unavailable2.Name = "Unavailable"
G.Unavailable2.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable2.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable2.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable2.BackgroundTransparency = 1
G.Unavailable2.BorderSizePixel = 0
G.Unavailable2.Text = "Unavailable"
G.Unavailable2.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable2.TextSize = 14
G.Unavailable2.Font = Enum.Font.FredokaOne
G.Unavailable2.TextWrapped = true
G.Unavailable2.TextScaled = true
G.Unavailable2.Visible = false
G.Unavailable2.Parent = G.Thumbnail

G.UIStroke8 = Instance.new("UIStroke")
G.UIStroke8.Name = "UIStroke"
G.UIStroke8.Thickness = 2
G.UIStroke8.Parent = G.Unavailable2

G.Thumbnail2 = Instance.new("ImageLabel")
G.Thumbnail2.Name = "Thumbnail"
G.Thumbnail2.Size = UDim2.new(0.509542,0,1.15072,0)
G.Thumbnail2.Position = UDim2.new(0.228656,0,0.372888,0)
G.Thumbnail2.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail2.BackgroundTransparency = 1
G.Thumbnail2.BorderSizePixel = 0
G.Thumbnail2.Image = "rbxassetid://81753140268614"
G.Thumbnail2.ScaleType = Enum.ScaleType.Fit
G.Thumbnail2.ZIndex = -1
G.Thumbnail2.Rotation = 16
G.Thumbnail2.Parent = G.CanvasGroup

G.Unavailable3 = Instance.new("TextLabel")
G.Unavailable3.Name = "Unavailable"
G.Unavailable3.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable3.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable3.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable3.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable3.BackgroundTransparency = 1
G.Unavailable3.BorderSizePixel = 0
G.Unavailable3.Text = "Unavailable"
G.Unavailable3.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable3.TextSize = 14
G.Unavailable3.Font = Enum.Font.FredokaOne
G.Unavailable3.TextWrapped = true
G.Unavailable3.TextScaled = true
G.Unavailable3.Visible = false
G.Unavailable3.Parent = G.Thumbnail2

G.UIStroke9 = Instance.new("UIStroke")
G.UIStroke9.Name = "UIStroke"
G.UIStroke9.Thickness = 2
G.UIStroke9.Parent = G.Unavailable3

G.Thumbnail3 = Instance.new("ImageLabel")
G.Thumbnail3.Name = "Thumbnail"
G.Thumbnail3.Size = UDim2.new(0.334554,0,0.967788,0)
G.Thumbnail3.Position = UDim2.new(0.368402,0,0.5,0)
G.Thumbnail3.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail3.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail3.BackgroundTransparency = 1
G.Thumbnail3.BorderSizePixel = 0
G.Thumbnail3.Image = "rbxassetid://126825711243124"
G.Thumbnail3.ScaleType = Enum.ScaleType.Fit
G.Thumbnail3.ZIndex = 0
G.Thumbnail3.Parent = G.CanvasGroup

G.Unavailable4 = Instance.new("TextLabel")
G.Unavailable4.Name = "Unavailable"
G.Unavailable4.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable4.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable4.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable4.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable4.BackgroundTransparency = 1
G.Unavailable4.BorderSizePixel = 0
G.Unavailable4.Text = "Unavailable"
G.Unavailable4.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable4.TextSize = 14
G.Unavailable4.Font = Enum.Font.FredokaOne
G.Unavailable4.TextWrapped = true
G.Unavailable4.TextScaled = true
G.Unavailable4.Visible = false
G.Unavailable4.Parent = G.Thumbnail3

G.UIStroke10 = Instance.new("UIStroke")
G.UIStroke10.Name = "UIStroke"
G.UIStroke10.Thickness = 2
G.UIStroke10.Parent = G.Unavailable4

G.DisplayTitle = Instance.new("TextLabel")
G.DisplayTitle.Name = "DisplayTitle"
G.DisplayTitle.Size = UDim2.new(0.294018,0,0.367128,0)
G.DisplayTitle.Position = UDim2.new(0.811778,0,0.191717,0)
G.DisplayTitle.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle.BackgroundTransparency = 1
G.DisplayTitle.BorderSizePixel = 0
G.DisplayTitle.Text = "Eclipse 14\"\
 Deluxe Plush (Pre-Order)"
G.DisplayTitle.TextColor3 = Color3.fromRGB(0,0,0)
G.DisplayTitle.TextSize = 29
G.DisplayTitle.Font = Enum.Font.Arcade
G.DisplayTitle.TextWrapped = true
G.DisplayTitle.TextScaled = true
G.DisplayTitle.RichText = true
G.DisplayTitle.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle.Parent = G.COM_5988786514287526337

G.UIAspectRatioConstraint5 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint5.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint5.AspectRatio = 2.66
G.UIAspectRatioConstraint5.Parent = G.DisplayTitle

G.UIGradient3 = Instance.new("UIGradient")
G.UIGradient3.Name = "UIGradient"
G.UIGradient3.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient3.Rotation = -90
G.UIGradient3.Offset = Vector2.new(0,0)
G.UIGradient3.Enabled = false
G.UIGradient3.Parent = G.DisplayTitle

G.UIStroke11 = Instance.new("UIStroke")
G.UIStroke11.Name = "UIStroke"
G.UIStroke11.Color = Color3.fromRGB(255,255,255)
G.UIStroke11.Thickness = 0.931838
G.UIStroke11.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke11.Parent = G.DisplayTitle

G.Item2 = Instance.new("ImageLabel")
G.Item2.Name = "Item"
G.Item2.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item2.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item2.AnchorPoint = Vector2.new(0.5,0.5)
G.Item2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item2.BackgroundTransparency = 1
G.Item2.BorderSizePixel = 0
G.Item2.Image = "rbxassetid://94959635148921"
G.Item2.ImageRectOffset = Vector2.new(15,15)
G.Item2.ImageRectSize = Vector2.new(270,270)
G.Item2.ScaleType = Enum.ScaleType.Fit
G.Item2.Visible = false
G.Item2.ZIndex = -1
G.Item2.Parent = G.COM_5988786514287526337

G.Unavailable5 = Instance.new("TextLabel")
G.Unavailable5.Name = "Unavailable"
G.Unavailable5.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable5.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable5.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable5.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable5.BackgroundTransparency = 1
G.Unavailable5.BorderSizePixel = 0
G.Unavailable5.Text = "Unavailable"
G.Unavailable5.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable5.TextSize = 14
G.Unavailable5.Font = Enum.Font.FredokaOne
G.Unavailable5.TextWrapped = true
G.Unavailable5.TextScaled = true
G.Unavailable5.Visible = false
G.Unavailable5.Parent = G.Item2

G.UIStroke12 = Instance.new("UIStroke")
G.UIStroke12.Name = "UIStroke"
G.UIStroke12.Thickness = 2
G.UIStroke12.Parent = G.Unavailable5

G.New = Instance.new("ImageLabel")
G.New.Name = "New"
G.New.Size = UDim2.new(0.322123,0,0.355513,0)
G.New.Position = UDim2.new(0.928356,0,0.0669836,0)
G.New.AnchorPoint = Vector2.new(0.5,0.5)
G.New.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New.BackgroundTransparency = 1
G.New.BorderSizePixel = 0
G.New.Image = "rbxassetid://96728750855907"
G.New.ScaleType = Enum.ScaleType.Fit
G.New.ZIndex = -1
G.New.Parent = G.COM_5988786514287526337

G.UIScale4 = Instance.new("UIScale")
G.UIScale4.Name = "UIScale"
G.UIScale4.Parent = G.New

G.Purchase2 = Instance.new("ImageButton")
G.Purchase2.Name = "Purchase"
G.Purchase2.Size = UDim2.new(0.299855,0,0.201102,0)
G.Purchase2.Position = UDim2.new(0.814697,0,0.786462,0)
G.Purchase2.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase2.BorderSizePixel = 0
G.Purchase2.ScaleType = Enum.ScaleType.Fit
G.Purchase2.AutoButtonColor = false
G.Purchase2.Parent = G.COM_5988786514287526337

G.Price2 = Instance.new("TextLabel")
G.Price2.Name = "Price"
G.Price2.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price2.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price2.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price2.BackgroundTransparency = 1
G.Price2.BorderSizePixel = 0
G.Price2.Text = "$19.99"
G.Price2.TextColor3 = Color3.fromRGB(255,255,255)
G.Price2.TextSize = 14
G.Price2.Font = Enum.Font.Arcade
G.Price2.TextWrapped = true
G.Price2.TextScaled = true
G.Price2.RichText = true
G.Price2.AutomaticSize = Enum.AutomaticSize.X
G.Price2.Parent = G.Purchase2

G.UIGradient4 = Instance.new("UIGradient")
G.UIGradient4.Name = "UIGradient"
G.UIGradient4.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient4.Rotation = -90
G.UIGradient4.Offset = Vector2.new(0,0)
G.UIGradient4.Parent = G.Price2

G.UIStroke13 = Instance.new("UIStroke")
G.UIStroke13.Name = "UIStroke"
G.UIStroke13.Thickness = 0.931838
G.UIStroke13.Parent = G.Price2

G.UICorner3 = Instance.new("UICorner")
G.UICorner3.Name = "UICorner"
G.UICorner3.CornerRadius = UDim.new(1,0)
G.UICorner3.Parent = G.Purchase2

G.UIGradient5 = Instance.new("UIGradient")
G.UIGradient5.Name = "UIGradient"
G.UIGradient5.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient5.Rotation = -90
G.UIGradient5.Offset = Vector2.new(0,0)
G.UIGradient5.Parent = G.Purchase2

G.UIScale5 = Instance.new("UIScale")
G.UIScale5.Name = "UIScale"
G.UIScale5.Parent = G.Purchase2

G.UIStroke14 = Instance.new("UIStroke")
G.UIStroke14.Name = "UIStroke"
G.UIStroke14.Thickness = 1.1648
G.UIStroke14.Parent = G.Purchase2

G.Thumbnail4 = Instance.new("ImageLabel")
G.Thumbnail4.Name = "Thumbnail"
G.Thumbnail4.Size = UDim2.new(0.48234,0,1.34851,0)
G.Thumbnail4.Position = UDim2.new(0.551555,0,0.39973,0)
G.Thumbnail4.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail4.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail4.BackgroundTransparency = 1
G.Thumbnail4.BorderSizePixel = 0
G.Thumbnail4.Image = "rbxassetid://130248253182695"
G.Thumbnail4.ScaleType = Enum.ScaleType.Fit
G.Thumbnail4.ZIndex = 2
G.Thumbnail4.Parent = G.COM_5988786514287526337

G.Unavailable6 = Instance.new("TextLabel")
G.Unavailable6.Name = "Unavailable"
G.Unavailable6.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable6.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable6.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable6.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable6.BackgroundTransparency = 1
G.Unavailable6.BorderSizePixel = 0
G.Unavailable6.Text = "Unavailable"
G.Unavailable6.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable6.TextSize = 14
G.Unavailable6.Font = Enum.Font.FredokaOne
G.Unavailable6.TextWrapped = true
G.Unavailable6.TextScaled = true
G.Unavailable6.Visible = false
G.Unavailable6.Parent = G.Thumbnail4

G.UIStroke15 = Instance.new("UIStroke")
G.UIStroke15.Name = "UIStroke"
G.UIStroke15.Thickness = 2
G.UIStroke15.Parent = G.Unavailable6

G.Title2 = Instance.new("TextLabel")
G.Title2.Name = "Title"
G.Title2.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title2.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title2.AnchorPoint = Vector2.new(0.5,0)
G.Title2.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title2.BackgroundTransparency = 1
G.Title2.BorderSizePixel = 0
G.Title2.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title2.TextColor3 = Color3.fromRGB(0,13,76)
G.Title2.TextSize = 29
G.Title2.Font = Enum.Font.Arcade
G.Title2.TextWrapped = true
G.Title2.TextScaled = true
G.Title2.RichText = true
G.Title2.Visible = false
G.Title2.AutomaticSize = Enum.AutomaticSize.X
G.Title2.Parent = G.COM_5988786514287526337

G.UIGradient6 = Instance.new("UIGradient")
G.UIGradient6.Name = "UIGradient"
G.UIGradient6.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient6.Rotation = -90
G.UIGradient6.Offset = Vector2.new(0,0)
G.UIGradient6.Parent = G.Title2

G.UIStroke16 = Instance.new("UIStroke")
G.UIStroke16.Name = "UIStroke"
G.UIStroke16.Color = Color3.fromRGB(255,255,255)
G.UIStroke16.Thickness = 2
G.UIStroke16.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke16.Parent = G.Title2

G.UIListLayout2 = Instance.new("UIListLayout")
G.UIListLayout2.Name = "UIListLayout"
G.UIListLayout2.Padding = UDim.new(0.019,0)
G.UIListLayout2.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout2.Wraps = false
G.UIListLayout2.Parent = G.Special

G.Special2 = Instance.new("Frame")
G.Special2.Name = "Special"
G.Special2.Size = UDim2.new(1.30205,0,0.602466,0)
G.Special2.Position = UDim2.new(-3.59843e-08,0,0.30441,0)
G.Special2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special2.BackgroundTransparency = 1
G.Special2.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special2.BorderSizePixel = 0
G.Special2.LayoutOrder = -17
G.Special2.Parent = G.ScrollingFrame

G.COM_7185021046892921266 = Instance.new("Frame")
G.COM_7185021046892921266.Name = "COM-7185021046892921266"
G.COM_7185021046892921266.Size = UDim2.new(0.31602,0,0.944677,0)
G.COM_7185021046892921266.Position = UDim2.new(0.336087,0,-0.0531514,0)
G.COM_7185021046892921266.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_7185021046892921266.BackgroundTransparency = 1
G.COM_7185021046892921266.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_7185021046892921266.BorderSizePixel = 0
G.COM_7185021046892921266.Parent = G.Special2

G.BG3 = Instance.new("Frame")
G.BG3.Name = "BG"
G.BG3.Size = UDim2.new(1,0,1,0)
G.BG3.Position = UDim2.new(0.5,0,0.5,0)
G.BG3.AnchorPoint = Vector2.new(0.5,0.5)
G.BG3.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG3.BackgroundTransparency = 1
G.BG3.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG3.BorderSizePixel = 0
G.BG3.ZIndex = -2
G.BG3.Parent = G.COM_7185021046892921266

G.Dropshadow2 = Instance.new("Frame")
G.Dropshadow2.Name = "Dropshadow"
G.Dropshadow2.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow2.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow2.AnchorPoint = Vector2.new(0,1)
G.Dropshadow2.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow2.BackgroundTransparency = 0.5
G.Dropshadow2.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow2.BorderSizePixel = 0
G.Dropshadow2.ZIndex = -2
G.Dropshadow2.Parent = G.BG3

G.UIStroke17 = Instance.new("UIStroke")
G.UIStroke17.Name = "UIStroke"
G.UIStroke17.Thickness = 2.79551
G.UIStroke17.Transparency = 1
G.UIStroke17.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke17.Parent = G.Dropshadow2

G.Frame3 = Instance.new("Frame")
G.Frame3.Name = "Frame"
G.Frame3.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame3.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame3.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame3.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame3.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame3.BorderSizePixel = 0
G.Frame3.ZIndex = -1
G.Frame3.Parent = G.BG3

G.Pattern2 = Instance.new("ImageLabel")
G.Pattern2.Name = "Pattern"
G.Pattern2.Size = UDim2.new(1,0,1,0)
G.Pattern2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern2.BackgroundTransparency = 1
G.Pattern2.BorderSizePixel = 0
G.Pattern2.Image = "rbxassetid://120182301931200"
G.Pattern2.ImageColor3 = Color3.fromRGB(144,50,161)
G.Pattern2.ScaleType = Enum.ScaleType.Crop
G.Pattern2.ZIndex = -1
G.Pattern2.Parent = G.Frame3

G.UIStroke18 = Instance.new("UIStroke")
G.UIStroke18.Name = "UIStroke"
G.UIStroke18.Thickness = 1.86368
G.UIStroke18.Parent = G.Pattern2

G.UIStroke19 = Instance.new("UIStroke")
G.UIStroke19.Name = "UIStroke"
G.UIStroke19.Thickness = 1.86368
G.UIStroke19.Parent = G.Frame3

G.Highlight2 = Instance.new("Frame")
G.Highlight2.Name = "Highlight"
G.Highlight2.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight2.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight2.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight2.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight2.BorderSizePixel = 0
G.Highlight2.Visible = false
G.Highlight2.ZIndex = -2
G.Highlight2.Parent = G.BG3

G.UIStroke20 = Instance.new("UIStroke")
G.UIStroke20.Name = "UIStroke"
G.UIStroke20.Color = Color3.fromRGB(255,242,0)
G.UIStroke20.Thickness = 2.79551
G.UIStroke20.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke20.Parent = G.Highlight2

G.DisplayTitle2 = Instance.new("TextLabel")
G.DisplayTitle2.Name = "DisplayTitle"
G.DisplayTitle2.Size = UDim2.new(0.854506,0,0.108842,0)
G.DisplayTitle2.Position = UDim2.new(0.521125,0,0.0306124,0)
G.DisplayTitle2.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle2.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle2.BackgroundTransparency = 1
G.DisplayTitle2.BorderSizePixel = 0
G.DisplayTitle2.Text = "COM-9165422475759190499"
G.DisplayTitle2.TextColor3 = Color3.fromRGB(0,0,0)
G.DisplayTitle2.TextSize = 29
G.DisplayTitle2.Font = Enum.Font.Arcade
G.DisplayTitle2.TextXAlignment = Enum.TextXAlignment.Left
G.DisplayTitle2.TextYAlignment = Enum.TextYAlignment.Top
G.DisplayTitle2.TextWrapped = true
G.DisplayTitle2.TextScaled = true
G.DisplayTitle2.RichText = true
G.DisplayTitle2.Visible = false
G.DisplayTitle2.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle2.Parent = G.COM_7185021046892921266

G.UITextSizeConstraint = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint.Name = "UITextSizeConstraint"
G.UITextSizeConstraint.MaxTextSize = 29
G.UITextSizeConstraint.Parent = G.DisplayTitle2

G.Item3 = Instance.new("ImageLabel")
G.Item3.Name = "Item"
G.Item3.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item3.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item3.AnchorPoint = Vector2.new(0.5,0.5)
G.Item3.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item3.BackgroundTransparency = 1
G.Item3.BorderSizePixel = 0
G.Item3.Image = "rbxassetid://138096832706650"
G.Item3.ImageRectOffset = Vector2.new(25,25)
G.Item3.ImageRectSize = Vector2.new(700,700)
G.Item3.ScaleType = Enum.ScaleType.Fit
G.Item3.Visible = false
G.Item3.ZIndex = -1
G.Item3.Parent = G.COM_7185021046892921266

G.Unavailable7 = Instance.new("TextLabel")
G.Unavailable7.Name = "Unavailable"
G.Unavailable7.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable7.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable7.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable7.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable7.BackgroundTransparency = 1
G.Unavailable7.BorderSizePixel = 0
G.Unavailable7.Text = "Unavailable"
G.Unavailable7.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable7.TextSize = 14
G.Unavailable7.Font = Enum.Font.FredokaOne
G.Unavailable7.TextWrapped = true
G.Unavailable7.TextScaled = true
G.Unavailable7.Visible = false
G.Unavailable7.Parent = G.Item3

G.UIStroke21 = Instance.new("UIStroke")
G.UIStroke21.Name = "UIStroke"
G.UIStroke21.Thickness = 2
G.UIStroke21.Parent = G.Unavailable7

G.Pixel = Instance.new("ImageLabel")
G.Pixel.Name = "Pixel"
G.Pixel.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel.BorderSizePixel = 0
G.Pixel.Image = "rbxassetid://94959635148921"
G.Pixel.ImageRectOffset = Vector2.new(55,100)
G.Pixel.ImageRectSize = Vector2.new(30,30)
G.Pixel.ScaleType = Enum.ScaleType.Crop
G.Pixel.Visible = false
G.Pixel.ZIndex = 5
G.Pixel.Parent = G.COM_7185021046892921266

G.Unavailable8 = Instance.new("TextLabel")
G.Unavailable8.Name = "Unavailable"
G.Unavailable8.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable8.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable8.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable8.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable8.BackgroundTransparency = 1
G.Unavailable8.BorderSizePixel = 0
G.Unavailable8.Text = "Unavailable"
G.Unavailable8.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable8.TextSize = 14
G.Unavailable8.Font = Enum.Font.FredokaOne
G.Unavailable8.TextWrapped = true
G.Unavailable8.TextScaled = true
G.Unavailable8.Visible = false
G.Unavailable8.Parent = G.Pixel

G.UIStroke22 = Instance.new("UIStroke")
G.UIStroke22.Name = "UIStroke"
G.UIStroke22.Thickness = 2
G.UIStroke22.Parent = G.Unavailable8

G.Purchase3 = Instance.new("ImageButton")
G.Purchase3.Name = "Purchase"
G.Purchase3.Size = UDim2.new(0.902423,0,0.116761,0)
G.Purchase3.Position = UDim2.new(0.521125,0,0.866764,0)
G.Purchase3.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase3.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase3.BorderSizePixel = 0
G.Purchase3.ScaleType = Enum.ScaleType.Fit
G.Purchase3.AutoButtonColor = false
G.Purchase3.ZIndex = 5
G.Purchase3.Parent = G.COM_7185021046892921266

G.Price3 = Instance.new("TextLabel")
G.Price3.Name = "Price"
G.Price3.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price3.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price3.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price3.BackgroundTransparency = 1
G.Price3.BorderSizePixel = 0
G.Price3.Text = "$19.99"
G.Price3.TextColor3 = Color3.fromRGB(255,255,255)
G.Price3.TextSize = 14
G.Price3.Font = Enum.Font.Arcade
G.Price3.TextWrapped = true
G.Price3.TextScaled = true
G.Price3.RichText = true
G.Price3.AutomaticSize = Enum.AutomaticSize.X
G.Price3.Parent = G.Purchase3

G.UIGradient7 = Instance.new("UIGradient")
G.UIGradient7.Name = "UIGradient"
G.UIGradient7.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient7.Rotation = -90
G.UIGradient7.Offset = Vector2.new(0,0)
G.UIGradient7.Parent = G.Price3

G.UIStroke23 = Instance.new("UIStroke")
G.UIStroke23.Name = "UIStroke"
G.UIStroke23.Thickness = 2
G.UIStroke23.Parent = G.Price3

G.UICorner4 = Instance.new("UICorner")
G.UICorner4.Name = "UICorner"
G.UICorner4.CornerRadius = UDim.new(1,0)
G.UICorner4.Parent = G.Purchase3

G.UIGradient8 = Instance.new("UIGradient")
G.UIGradient8.Name = "UIGradient"
G.UIGradient8.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient8.Rotation = -90
G.UIGradient8.Offset = Vector2.new(0,0)
G.UIGradient8.Parent = G.Purchase3

G.UIScale6 = Instance.new("UIScale")
G.UIScale6.Name = "UIScale"
G.UIScale6.Parent = G.Purchase3

G.UIStroke24 = Instance.new("UIStroke")
G.UIStroke24.Name = "UIStroke"
G.UIStroke24.Thickness = 2.5
G.UIStroke24.Parent = G.Purchase3

G.Thumbnail5 = Instance.new("ImageLabel")
G.Thumbnail5.Name = "Thumbnail"
G.Thumbnail5.Size = UDim2.new(1.08228,0,0.970612,0)
G.Thumbnail5.Position = UDim2.new(0.521125,0,0.411514,0)
G.Thumbnail5.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail5.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail5.BackgroundTransparency = 1
G.Thumbnail5.BorderSizePixel = 0
G.Thumbnail5.Image = "rbxassetid://88278826022975"
G.Thumbnail5.ScaleType = Enum.ScaleType.Fit
G.Thumbnail5.ZIndex = -1
G.Thumbnail5.Parent = G.COM_7185021046892921266

G.Unavailable9 = Instance.new("TextLabel")
G.Unavailable9.Name = "Unavailable"
G.Unavailable9.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable9.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable9.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable9.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable9.BackgroundTransparency = 1
G.Unavailable9.BorderSizePixel = 0
G.Unavailable9.Text = "Unavailable"
G.Unavailable9.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable9.TextSize = 14
G.Unavailable9.Font = Enum.Font.FredokaOne
G.Unavailable9.TextWrapped = true
G.Unavailable9.TextScaled = true
G.Unavailable9.Visible = false
G.Unavailable9.Parent = G.Thumbnail5

G.UIStroke25 = Instance.new("UIStroke")
G.UIStroke25.Name = "UIStroke"
G.UIStroke25.Thickness = 2
G.UIStroke25.Parent = G.Unavailable9

G.Title3 = Instance.new("TextLabel")
G.Title3.Name = "Title"
G.Title3.Size = UDim2.new(0.854506,0,0.108842,0)
G.Title3.Position = UDim2.new(0.521125,0,0.0306124,0)
G.Title3.AnchorPoint = Vector2.new(0.5,0)
G.Title3.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title3.BackgroundTransparency = 1
G.Title3.BorderSizePixel = 0
G.Title3.Text = "COM-9165422475759190499"
G.Title3.TextColor3 = Color3.fromRGB(0,0,0)
G.Title3.TextSize = 29
G.Title3.Font = Enum.Font.Arcade
G.Title3.TextXAlignment = Enum.TextXAlignment.Left
G.Title3.TextYAlignment = Enum.TextYAlignment.Top
G.Title3.TextWrapped = true
G.Title3.TextScaled = true
G.Title3.RichText = true
G.Title3.Visible = false
G.Title3.AutomaticSize = Enum.AutomaticSize.X
G.Title3.Parent = G.COM_7185021046892921266

G.UITextSizeConstraint2 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint2.Name = "UITextSizeConstraint"
G.UITextSizeConstraint2.MaxTextSize = 29
G.UITextSizeConstraint2.Parent = G.Title3

G.UIAspectRatioConstraint6 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint6.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint6.AspectRatio = 0.76
G.UIAspectRatioConstraint6.Parent = G.COM_7185021046892921266

G.COM_7817418654663967167 = Instance.new("Frame")
G.COM_7817418654663967167.Name = "COM-7817418654663967167"
G.COM_7817418654663967167.Size = UDim2.new(0.31602,0,0.944677,0)
G.COM_7817418654663967167.Position = UDim2.new(0.336087,0,-0.0531514,0)
G.COM_7817418654663967167.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_7817418654663967167.BackgroundTransparency = 1
G.COM_7817418654663967167.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_7817418654663967167.BorderSizePixel = 0
G.COM_7817418654663967167.Parent = G.Special2

G.BG4 = Instance.new("Frame")
G.BG4.Name = "BG"
G.BG4.Size = UDim2.new(1,0,1,0)
G.BG4.Position = UDim2.new(0.5,0,0.5,0)
G.BG4.AnchorPoint = Vector2.new(0.5,0.5)
G.BG4.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG4.BackgroundTransparency = 1
G.BG4.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG4.BorderSizePixel = 0
G.BG4.ZIndex = -2
G.BG4.Parent = G.COM_7817418654663967167

G.Dropshadow3 = Instance.new("Frame")
G.Dropshadow3.Name = "Dropshadow"
G.Dropshadow3.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow3.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow3.AnchorPoint = Vector2.new(0,1)
G.Dropshadow3.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow3.BackgroundTransparency = 0.5
G.Dropshadow3.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow3.BorderSizePixel = 0
G.Dropshadow3.ZIndex = -2
G.Dropshadow3.Parent = G.BG4

G.UIStroke26 = Instance.new("UIStroke")
G.UIStroke26.Name = "UIStroke"
G.UIStroke26.Thickness = 2.79551
G.UIStroke26.Transparency = 1
G.UIStroke26.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke26.Parent = G.Dropshadow3

G.Frame4 = Instance.new("Frame")
G.Frame4.Name = "Frame"
G.Frame4.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame4.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame4.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame4.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame4.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame4.BorderSizePixel = 0
G.Frame4.ZIndex = -1
G.Frame4.Parent = G.BG4

G.Pattern3 = Instance.new("ImageLabel")
G.Pattern3.Name = "Pattern"
G.Pattern3.Size = UDim2.new(1,0,1,0)
G.Pattern3.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern3.BackgroundTransparency = 1
G.Pattern3.BorderSizePixel = 0
G.Pattern3.Image = "rbxassetid://120182301931200"
G.Pattern3.ImageColor3 = Color3.fromRGB(144,50,161)
G.Pattern3.ScaleType = Enum.ScaleType.Crop
G.Pattern3.ZIndex = -1
G.Pattern3.Parent = G.Frame4

G.UIStroke27 = Instance.new("UIStroke")
G.UIStroke27.Name = "UIStroke"
G.UIStroke27.Thickness = 1.86368
G.UIStroke27.Parent = G.Pattern3

G.UIStroke28 = Instance.new("UIStroke")
G.UIStroke28.Name = "UIStroke"
G.UIStroke28.Thickness = 1.86368
G.UIStroke28.Parent = G.Frame4

G.Highlight3 = Instance.new("Frame")
G.Highlight3.Name = "Highlight"
G.Highlight3.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight3.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight3.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight3.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight3.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight3.BorderSizePixel = 0
G.Highlight3.Visible = false
G.Highlight3.ZIndex = -2
G.Highlight3.Parent = G.BG4

G.UIStroke29 = Instance.new("UIStroke")
G.UIStroke29.Name = "UIStroke"
G.UIStroke29.Color = Color3.fromRGB(255,242,0)
G.UIStroke29.Thickness = 2.79551
G.UIStroke29.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke29.Parent = G.Highlight3

G.DisplayTitle3 = Instance.new("TextLabel")
G.DisplayTitle3.Name = "DisplayTitle"
G.DisplayTitle3.Size = UDim2.new(0.854506,0,0.108842,0)
G.DisplayTitle3.Position = UDim2.new(0.521125,0,0.0306124,0)
G.DisplayTitle3.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle3.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle3.BackgroundTransparency = 1
G.DisplayTitle3.BorderSizePixel = 0
G.DisplayTitle3.Text = "COM-9165422475759190499"
G.DisplayTitle3.TextColor3 = Color3.fromRGB(0,0,0)
G.DisplayTitle3.TextSize = 29
G.DisplayTitle3.Font = Enum.Font.Arcade
G.DisplayTitle3.TextXAlignment = Enum.TextXAlignment.Left
G.DisplayTitle3.TextYAlignment = Enum.TextYAlignment.Top
G.DisplayTitle3.TextWrapped = true
G.DisplayTitle3.TextScaled = true
G.DisplayTitle3.RichText = true
G.DisplayTitle3.Visible = false
G.DisplayTitle3.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle3.Parent = G.COM_7817418654663967167

G.UITextSizeConstraint3 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint3.Name = "UITextSizeConstraint"
G.UITextSizeConstraint3.MaxTextSize = 29
G.UITextSizeConstraint3.Parent = G.DisplayTitle3

G.Item4 = Instance.new("ImageLabel")
G.Item4.Name = "Item"
G.Item4.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item4.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item4.AnchorPoint = Vector2.new(0.5,0.5)
G.Item4.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item4.BackgroundTransparency = 1
G.Item4.BorderSizePixel = 0
G.Item4.Image = "rbxassetid://138096832706650"
G.Item4.ImageRectOffset = Vector2.new(25,25)
G.Item4.ImageRectSize = Vector2.new(700,700)
G.Item4.ScaleType = Enum.ScaleType.Fit
G.Item4.Visible = false
G.Item4.ZIndex = -1
G.Item4.Parent = G.COM_7817418654663967167

G.Unavailable10 = Instance.new("TextLabel")
G.Unavailable10.Name = "Unavailable"
G.Unavailable10.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable10.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable10.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable10.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable10.BackgroundTransparency = 1
G.Unavailable10.BorderSizePixel = 0
G.Unavailable10.Text = "Unavailable"
G.Unavailable10.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable10.TextSize = 14
G.Unavailable10.Font = Enum.Font.FredokaOne
G.Unavailable10.TextWrapped = true
G.Unavailable10.TextScaled = true
G.Unavailable10.Visible = false
G.Unavailable10.Parent = G.Item4

G.UIStroke30 = Instance.new("UIStroke")
G.UIStroke30.Name = "UIStroke"
G.UIStroke30.Thickness = 2
G.UIStroke30.Parent = G.Unavailable10

G.Pixel2 = Instance.new("ImageLabel")
G.Pixel2.Name = "Pixel"
G.Pixel2.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel2.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel2.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel2.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel2.BorderSizePixel = 0
G.Pixel2.Image = "rbxassetid://94959635148921"
G.Pixel2.ImageRectOffset = Vector2.new(55,100)
G.Pixel2.ImageRectSize = Vector2.new(30,30)
G.Pixel2.ScaleType = Enum.ScaleType.Crop
G.Pixel2.Visible = false
G.Pixel2.ZIndex = 5
G.Pixel2.Parent = G.COM_7817418654663967167

G.Unavailable11 = Instance.new("TextLabel")
G.Unavailable11.Name = "Unavailable"
G.Unavailable11.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable11.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable11.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable11.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable11.BackgroundTransparency = 1
G.Unavailable11.BorderSizePixel = 0
G.Unavailable11.Text = "Unavailable"
G.Unavailable11.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable11.TextSize = 14
G.Unavailable11.Font = Enum.Font.FredokaOne
G.Unavailable11.TextWrapped = true
G.Unavailable11.TextScaled = true
G.Unavailable11.Visible = false
G.Unavailable11.Parent = G.Pixel2

G.UIStroke31 = Instance.new("UIStroke")
G.UIStroke31.Name = "UIStroke"
G.UIStroke31.Thickness = 2
G.UIStroke31.Parent = G.Unavailable11

G.Purchase4 = Instance.new("ImageButton")
G.Purchase4.Name = "Purchase"
G.Purchase4.Size = UDim2.new(0.902423,0,0.116761,0)
G.Purchase4.Position = UDim2.new(0.521125,0,0.866764,0)
G.Purchase4.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase4.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase4.BorderSizePixel = 0
G.Purchase4.ScaleType = Enum.ScaleType.Fit
G.Purchase4.AutoButtonColor = false
G.Purchase4.ZIndex = 5
G.Purchase4.Parent = G.COM_7817418654663967167

G.Price4 = Instance.new("TextLabel")
G.Price4.Name = "Price"
G.Price4.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price4.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price4.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price4.BackgroundTransparency = 1
G.Price4.BorderSizePixel = 0
G.Price4.Text = "$19.99"
G.Price4.TextColor3 = Color3.fromRGB(255,255,255)
G.Price4.TextSize = 14
G.Price4.Font = Enum.Font.Arcade
G.Price4.TextWrapped = true
G.Price4.TextScaled = true
G.Price4.RichText = true
G.Price4.AutomaticSize = Enum.AutomaticSize.X
G.Price4.Parent = G.Purchase4

G.UIGradient9 = Instance.new("UIGradient")
G.UIGradient9.Name = "UIGradient"
G.UIGradient9.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient9.Rotation = -90
G.UIGradient9.Offset = Vector2.new(0,0)
G.UIGradient9.Parent = G.Price4

G.UIStroke32 = Instance.new("UIStroke")
G.UIStroke32.Name = "UIStroke"
G.UIStroke32.Thickness = 2
G.UIStroke32.Parent = G.Price4

G.UICorner5 = Instance.new("UICorner")
G.UICorner5.Name = "UICorner"
G.UICorner5.CornerRadius = UDim.new(1,0)
G.UICorner5.Parent = G.Purchase4

G.UIGradient10 = Instance.new("UIGradient")
G.UIGradient10.Name = "UIGradient"
G.UIGradient10.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient10.Rotation = -90
G.UIGradient10.Offset = Vector2.new(0,0)
G.UIGradient10.Parent = G.Purchase4

G.UIScale7 = Instance.new("UIScale")
G.UIScale7.Name = "UIScale"
G.UIScale7.Parent = G.Purchase4

G.UIStroke33 = Instance.new("UIStroke")
G.UIStroke33.Name = "UIStroke"
G.UIStroke33.Thickness = 2.5
G.UIStroke33.Parent = G.Purchase4

G.Thumbnail6 = Instance.new("ImageLabel")
G.Thumbnail6.Name = "Thumbnail"
G.Thumbnail6.Size = UDim2.new(1.11505,0,1,0)
G.Thumbnail6.Position = UDim2.new(0.5,0,0.39682,0)
G.Thumbnail6.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail6.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail6.BackgroundTransparency = 1
G.Thumbnail6.BorderSizePixel = 0
G.Thumbnail6.Image = "rbxassetid://95295186635542"
G.Thumbnail6.ScaleType = Enum.ScaleType.Fit
G.Thumbnail6.ZIndex = -1
G.Thumbnail6.Parent = G.COM_7817418654663967167

G.Unavailable12 = Instance.new("TextLabel")
G.Unavailable12.Name = "Unavailable"
G.Unavailable12.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable12.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable12.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable12.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable12.BackgroundTransparency = 1
G.Unavailable12.BorderSizePixel = 0
G.Unavailable12.Text = "Unavailable"
G.Unavailable12.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable12.TextSize = 14
G.Unavailable12.Font = Enum.Font.FredokaOne
G.Unavailable12.TextWrapped = true
G.Unavailable12.TextScaled = true
G.Unavailable12.Visible = false
G.Unavailable12.Parent = G.Thumbnail6

G.UIStroke34 = Instance.new("UIStroke")
G.UIStroke34.Name = "UIStroke"
G.UIStroke34.Thickness = 2
G.UIStroke34.Parent = G.Unavailable12

G.Title4 = Instance.new("TextLabel")
G.Title4.Name = "Title"
G.Title4.Size = UDim2.new(0.854506,0,0.108842,0)
G.Title4.Position = UDim2.new(0.521125,0,0.0306124,0)
G.Title4.AnchorPoint = Vector2.new(0.5,0)
G.Title4.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title4.BackgroundTransparency = 1
G.Title4.BorderSizePixel = 0
G.Title4.Text = "COM-9165422475759190499"
G.Title4.TextColor3 = Color3.fromRGB(0,0,0)
G.Title4.TextSize = 29
G.Title4.Font = Enum.Font.Arcade
G.Title4.TextXAlignment = Enum.TextXAlignment.Left
G.Title4.TextYAlignment = Enum.TextYAlignment.Top
G.Title4.TextWrapped = true
G.Title4.TextScaled = true
G.Title4.RichText = true
G.Title4.Visible = false
G.Title4.AutomaticSize = Enum.AutomaticSize.X
G.Title4.Parent = G.COM_7817418654663967167

G.UITextSizeConstraint4 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint4.Name = "UITextSizeConstraint"
G.UITextSizeConstraint4.MaxTextSize = 29
G.UITextSizeConstraint4.Parent = G.Title4

G.UIAspectRatioConstraint7 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint7.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint7.AspectRatio = 0.76
G.UIAspectRatioConstraint7.Parent = G.COM_7817418654663967167

G.COM_7986890478983446966 = Instance.new("Frame")
G.COM_7986890478983446966.Name = "COM-7986890478983446966"
G.COM_7986890478983446966.Size = UDim2.new(0.31602,0,0.944677,0)
G.COM_7986890478983446966.Position = UDim2.new(0.336087,0,-0.0531514,0)
G.COM_7986890478983446966.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_7986890478983446966.BackgroundTransparency = 1
G.COM_7986890478983446966.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_7986890478983446966.BorderSizePixel = 0
G.COM_7986890478983446966.Parent = G.Special2

G.BG5 = Instance.new("Frame")
G.BG5.Name = "BG"
G.BG5.Size = UDim2.new(1,0,1,0)
G.BG5.Position = UDim2.new(0.5,0,0.5,0)
G.BG5.AnchorPoint = Vector2.new(0.5,0.5)
G.BG5.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG5.BackgroundTransparency = 1
G.BG5.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG5.BorderSizePixel = 0
G.BG5.ZIndex = -1
G.BG5.Parent = G.COM_7986890478983446966

G.Dropshadow4 = Instance.new("Frame")
G.Dropshadow4.Name = "Dropshadow"
G.Dropshadow4.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow4.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow4.AnchorPoint = Vector2.new(0,1)
G.Dropshadow4.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow4.BackgroundTransparency = 0.5
G.Dropshadow4.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow4.BorderSizePixel = 0
G.Dropshadow4.ZIndex = -2
G.Dropshadow4.Parent = G.BG5

G.UIStroke35 = Instance.new("UIStroke")
G.UIStroke35.Name = "UIStroke"
G.UIStroke35.Thickness = 2.79551
G.UIStroke35.Transparency = 1
G.UIStroke35.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke35.Parent = G.Dropshadow4

G.Frame5 = Instance.new("Frame")
G.Frame5.Name = "Frame"
G.Frame5.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame5.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame5.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame5.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame5.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame5.BorderSizePixel = 0
G.Frame5.ZIndex = -1
G.Frame5.Parent = G.BG5

G.Pattern4 = Instance.new("ImageLabel")
G.Pattern4.Name = "Pattern"
G.Pattern4.Size = UDim2.new(1,0,1,0)
G.Pattern4.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern4.BackgroundTransparency = 1
G.Pattern4.BorderSizePixel = 0
G.Pattern4.Image = "rbxassetid://129067201766685"
G.Pattern4.ScaleType = Enum.ScaleType.Slice
G.Pattern4.ZIndex = -1
G.Pattern4.Parent = G.Frame5

G.UIStroke36 = Instance.new("UIStroke")
G.UIStroke36.Name = "UIStroke"
G.UIStroke36.Thickness = 1.86368
G.UIStroke36.Parent = G.Pattern4

G.UIStroke37 = Instance.new("UIStroke")
G.UIStroke37.Name = "UIStroke"
G.UIStroke37.Thickness = 1.86368
G.UIStroke37.Parent = G.Frame5

G.Highlight4 = Instance.new("Frame")
G.Highlight4.Name = "Highlight"
G.Highlight4.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight4.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight4.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight4.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight4.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight4.BorderSizePixel = 0
G.Highlight4.Visible = false
G.Highlight4.ZIndex = -2
G.Highlight4.Parent = G.BG5

G.UIStroke38 = Instance.new("UIStroke")
G.UIStroke38.Name = "UIStroke"
G.UIStroke38.Color = Color3.fromRGB(255,242,0)
G.UIStroke38.Thickness = 2.79551
G.UIStroke38.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke38.Parent = G.Highlight4

G.DisplayTitle4 = Instance.new("TextLabel")
G.DisplayTitle4.Name = "DisplayTitle"
G.DisplayTitle4.Size = UDim2.new(0.854506,0,0.108842,0)
G.DisplayTitle4.Position = UDim2.new(0.521125,0,0.0306124,0)
G.DisplayTitle4.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle4.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle4.BackgroundTransparency = 1
G.DisplayTitle4.BorderSizePixel = 0
G.DisplayTitle4.Text = "COM-9165422475759190499"
G.DisplayTitle4.TextColor3 = Color3.fromRGB(0,0,0)
G.DisplayTitle4.TextSize = 29
G.DisplayTitle4.Font = Enum.Font.Arcade
G.DisplayTitle4.TextXAlignment = Enum.TextXAlignment.Left
G.DisplayTitle4.TextYAlignment = Enum.TextYAlignment.Top
G.DisplayTitle4.TextWrapped = true
G.DisplayTitle4.TextScaled = true
G.DisplayTitle4.RichText = true
G.DisplayTitle4.Visible = false
G.DisplayTitle4.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle4.Parent = G.COM_7986890478983446966

G.UITextSizeConstraint5 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint5.Name = "UITextSizeConstraint"
G.UITextSizeConstraint5.MaxTextSize = 29
G.UITextSizeConstraint5.Parent = G.DisplayTitle4

G.Item5 = Instance.new("ImageLabel")
G.Item5.Name = "Item"
G.Item5.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item5.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item5.AnchorPoint = Vector2.new(0.5,0.5)
G.Item5.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item5.BackgroundTransparency = 1
G.Item5.BorderSizePixel = 0
G.Item5.Image = "rbxassetid://138096832706650"
G.Item5.ImageRectOffset = Vector2.new(25,25)
G.Item5.ImageRectSize = Vector2.new(700,700)
G.Item5.ScaleType = Enum.ScaleType.Fit
G.Item5.Visible = false
G.Item5.ZIndex = -1
G.Item5.Parent = G.COM_7986890478983446966

G.Unavailable13 = Instance.new("TextLabel")
G.Unavailable13.Name = "Unavailable"
G.Unavailable13.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable13.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable13.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable13.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable13.BackgroundTransparency = 1
G.Unavailable13.BorderSizePixel = 0
G.Unavailable13.Text = "Unavailable"
G.Unavailable13.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable13.TextSize = 14
G.Unavailable13.Font = Enum.Font.FredokaOne
G.Unavailable13.TextWrapped = true
G.Unavailable13.TextScaled = true
G.Unavailable13.Visible = false
G.Unavailable13.Parent = G.Item5

G.UIStroke39 = Instance.new("UIStroke")
G.UIStroke39.Name = "UIStroke"
G.UIStroke39.Thickness = 2
G.UIStroke39.Parent = G.Unavailable13

G.Pixel3 = Instance.new("ImageLabel")
G.Pixel3.Name = "Pixel"
G.Pixel3.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel3.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel3.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel3.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel3.BorderSizePixel = 0
G.Pixel3.Image = "rbxassetid://94959635148921"
G.Pixel3.ImageRectOffset = Vector2.new(55,100)
G.Pixel3.ImageRectSize = Vector2.new(30,30)
G.Pixel3.ScaleType = Enum.ScaleType.Crop
G.Pixel3.Visible = false
G.Pixel3.ZIndex = 5
G.Pixel3.Parent = G.COM_7986890478983446966

G.Unavailable14 = Instance.new("TextLabel")
G.Unavailable14.Name = "Unavailable"
G.Unavailable14.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable14.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable14.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable14.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable14.BackgroundTransparency = 1
G.Unavailable14.BorderSizePixel = 0
G.Unavailable14.Text = "Unavailable"
G.Unavailable14.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable14.TextSize = 14
G.Unavailable14.Font = Enum.Font.FredokaOne
G.Unavailable14.TextWrapped = true
G.Unavailable14.TextScaled = true
G.Unavailable14.Visible = false
G.Unavailable14.Parent = G.Pixel3

G.UIStroke40 = Instance.new("UIStroke")
G.UIStroke40.Name = "UIStroke"
G.UIStroke40.Thickness = 2
G.UIStroke40.Parent = G.Unavailable14

G.Purchase5 = Instance.new("ImageButton")
G.Purchase5.Name = "Purchase"
G.Purchase5.Size = UDim2.new(0.902423,0,0.116761,0)
G.Purchase5.Position = UDim2.new(0.521125,0,0.866764,0)
G.Purchase5.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase5.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase5.BorderSizePixel = 0
G.Purchase5.ScaleType = Enum.ScaleType.Fit
G.Purchase5.AutoButtonColor = false
G.Purchase5.ZIndex = 5
G.Purchase5.Parent = G.COM_7986890478983446966

G.Price5 = Instance.new("TextLabel")
G.Price5.Name = "Price"
G.Price5.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price5.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price5.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price5.BackgroundTransparency = 1
G.Price5.BorderSizePixel = 0
G.Price5.Text = "$19.99"
G.Price5.TextColor3 = Color3.fromRGB(255,255,255)
G.Price5.TextSize = 14
G.Price5.Font = Enum.Font.Arcade
G.Price5.TextWrapped = true
G.Price5.TextScaled = true
G.Price5.RichText = true
G.Price5.AutomaticSize = Enum.AutomaticSize.X
G.Price5.Parent = G.Purchase5

G.UIGradient11 = Instance.new("UIGradient")
G.UIGradient11.Name = "UIGradient"
G.UIGradient11.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient11.Rotation = -90
G.UIGradient11.Offset = Vector2.new(0,0)
G.UIGradient11.Parent = G.Price5

G.UIStroke41 = Instance.new("UIStroke")
G.UIStroke41.Name = "UIStroke"
G.UIStroke41.Thickness = 2
G.UIStroke41.Parent = G.Price5

G.UICorner6 = Instance.new("UICorner")
G.UICorner6.Name = "UICorner"
G.UICorner6.CornerRadius = UDim.new(1,0)
G.UICorner6.Parent = G.Purchase5

G.UIGradient12 = Instance.new("UIGradient")
G.UIGradient12.Name = "UIGradient"
G.UIGradient12.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient12.Rotation = -90
G.UIGradient12.Offset = Vector2.new(0,0)
G.UIGradient12.Parent = G.Purchase5

G.UIScale8 = Instance.new("UIScale")
G.UIScale8.Name = "UIScale"
G.UIScale8.Parent = G.Purchase5

G.UIStroke42 = Instance.new("UIStroke")
G.UIStroke42.Name = "UIStroke"
G.UIStroke42.Thickness = 2.5
G.UIStroke42.Parent = G.Purchase5

G.Thumbnail7 = Instance.new("ImageLabel")
G.Thumbnail7.Name = "Thumbnail"
G.Thumbnail7.Size = UDim2.new(1.11505,0,1,0)
G.Thumbnail7.Position = UDim2.new(0.5,0,0.39682,0)
G.Thumbnail7.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail7.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail7.BackgroundTransparency = 1
G.Thumbnail7.BorderSizePixel = 0
G.Thumbnail7.Image = "rbxassetid://133370088925214"
G.Thumbnail7.ScaleType = Enum.ScaleType.Fit
G.Thumbnail7.ZIndex = -1
G.Thumbnail7.Parent = G.COM_7986890478983446966

G.Unavailable15 = Instance.new("TextLabel")
G.Unavailable15.Name = "Unavailable"
G.Unavailable15.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable15.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable15.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable15.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable15.BackgroundTransparency = 1
G.Unavailable15.BorderSizePixel = 0
G.Unavailable15.Text = "Unavailable"
G.Unavailable15.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable15.TextSize = 14
G.Unavailable15.Font = Enum.Font.FredokaOne
G.Unavailable15.TextWrapped = true
G.Unavailable15.TextScaled = true
G.Unavailable15.Visible = false
G.Unavailable15.Parent = G.Thumbnail7

G.UIStroke43 = Instance.new("UIStroke")
G.UIStroke43.Name = "UIStroke"
G.UIStroke43.Thickness = 2
G.UIStroke43.Parent = G.Unavailable15

G.Title5 = Instance.new("TextLabel")
G.Title5.Name = "Title"
G.Title5.Size = UDim2.new(0.854506,0,0.108842,0)
G.Title5.Position = UDim2.new(0.521125,0,0.0306124,0)
G.Title5.AnchorPoint = Vector2.new(0.5,0)
G.Title5.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title5.BackgroundTransparency = 1
G.Title5.BorderSizePixel = 0
G.Title5.Text = "COM-9165422475759190499"
G.Title5.TextColor3 = Color3.fromRGB(0,0,0)
G.Title5.TextSize = 29
G.Title5.Font = Enum.Font.Arcade
G.Title5.TextXAlignment = Enum.TextXAlignment.Left
G.Title5.TextYAlignment = Enum.TextYAlignment.Top
G.Title5.TextWrapped = true
G.Title5.TextScaled = true
G.Title5.RichText = true
G.Title5.Visible = false
G.Title5.AutomaticSize = Enum.AutomaticSize.X
G.Title5.Parent = G.COM_7986890478983446966

G.UITextSizeConstraint6 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint6.Name = "UITextSizeConstraint"
G.UITextSizeConstraint6.MaxTextSize = 29
G.UITextSizeConstraint6.Parent = G.Title5

G.UIAspectRatioConstraint8 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint8.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint8.AspectRatio = 0.76
G.UIAspectRatioConstraint8.Parent = G.COM_7986890478983446966

G.UIListLayout3 = Instance.new("UIListLayout")
G.UIListLayout3.Name = "UIListLayout"
G.UIListLayout3.Padding = UDim.new(0.019,0)
G.UIListLayout3.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout3.Wraps = false
G.UIListLayout3.Parent = G.Special2

G.Special3 = Instance.new("Frame")
G.Special3.Name = "Special"
G.Special3.Size = UDim2.new(1.10498,0,0.439953,0)
G.Special3.Position = UDim2.new(0,0,-0.143337,0)
G.Special3.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special3.BackgroundTransparency = 1
G.Special3.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special3.BorderSizePixel = 0
G.Special3.Visible = false
G.Special3.LayoutOrder = -16
G.Special3.Parent = G.ScrollingFrame

G.COM_901743514273055154 = Instance.new("Frame")
G.COM_901743514273055154.Name = "COM-901743514273055154"
G.COM_901743514273055154.Size = UDim2.new(0.894307,0,0.931111,0)
G.COM_901743514273055154.Position = UDim2.new(-5.79236e-08,0,0,0)
G.COM_901743514273055154.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_901743514273055154.BackgroundTransparency = 1
G.COM_901743514273055154.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_901743514273055154.BorderSizePixel = 0
G.COM_901743514273055154.Parent = G.Special3

G.BG6 = Instance.new("Frame")
G.BG6.Name = "BG"
G.BG6.Size = UDim2.new(1,0,1,0)
G.BG6.Position = UDim2.new(0.5,0,0.5,0)
G.BG6.AnchorPoint = Vector2.new(0.5,0.5)
G.BG6.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG6.BackgroundTransparency = 1
G.BG6.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG6.BorderSizePixel = 0
G.BG6.ZIndex = -1
G.BG6.Parent = G.COM_901743514273055154

G.Dropshadow5 = Instance.new("Frame")
G.Dropshadow5.Name = "Dropshadow"
G.Dropshadow5.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow5.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow5.AnchorPoint = Vector2.new(0,1)
G.Dropshadow5.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow5.BackgroundTransparency = 0.5
G.Dropshadow5.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow5.BorderSizePixel = 0
G.Dropshadow5.ZIndex = -2
G.Dropshadow5.Parent = G.BG6

G.UIStroke44 = Instance.new("UIStroke")
G.UIStroke44.Name = "UIStroke"
G.UIStroke44.Thickness = 2.79551
G.UIStroke44.Transparency = 1
G.UIStroke44.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke44.Parent = G.Dropshadow5

G.Frame6 = Instance.new("Frame")
G.Frame6.Name = "Frame"
G.Frame6.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame6.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame6.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame6.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame6.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame6.BorderSizePixel = 0
G.Frame6.ZIndex = -1
G.Frame6.Parent = G.BG6

G.Pattern5 = Instance.new("ImageLabel")
G.Pattern5.Name = "Pattern"
G.Pattern5.Size = UDim2.new(0.635249,0,1,0)
G.Pattern5.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern5.BackgroundTransparency = 1
G.Pattern5.BorderSizePixel = 0
G.Pattern5.Image = "rbxassetid://86384941585932"
G.Pattern5.ImageColor3 = Color3.fromRGB(255,201,76)
G.Pattern5.ZIndex = -1
G.Pattern5.Parent = G.Frame6

G.UIStroke45 = Instance.new("UIStroke")
G.UIStroke45.Name = "UIStroke"
G.UIStroke45.Thickness = 1.86368
G.UIStroke45.Parent = G.Pattern5

G.UIStroke46 = Instance.new("UIStroke")
G.UIStroke46.Name = "UIStroke"
G.UIStroke46.Thickness = 1.86368
G.UIStroke46.Parent = G.Frame6

G.Highlight5 = Instance.new("Frame")
G.Highlight5.Name = "Highlight"
G.Highlight5.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight5.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight5.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight5.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight5.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight5.BorderSizePixel = 0
G.Highlight5.Visible = false
G.Highlight5.ZIndex = -2
G.Highlight5.Parent = G.BG6

G.UIStroke47 = Instance.new("UIStroke")
G.UIStroke47.Name = "UIStroke"
G.UIStroke47.Color = Color3.fromRGB(255,242,0)
G.UIStroke47.Thickness = 2.79551
G.UIStroke47.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke47.Parent = G.Highlight5

G.CanvasGroup2 = Instance.new("CanvasGroup")
G.CanvasGroup2.Name = "CanvasGroup"
G.CanvasGroup2.Size = UDim2.new(1,0,1,0)
G.CanvasGroup2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup2.BackgroundTransparency = 1
G.CanvasGroup2.Parent = G.COM_901743514273055154

G.Thumbnail8 = Instance.new("ImageLabel")
G.Thumbnail8.Name = "Thumbnail"
G.Thumbnail8.Size = UDim2.new(0.401091,0,0.993744,0)
G.Thumbnail8.Position = UDim2.new(0.0961707,0,0.538139,0)
G.Thumbnail8.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail8.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail8.BackgroundTransparency = 1
G.Thumbnail8.BorderSizePixel = 0
G.Thumbnail8.Image = "rbxassetid://72581890955496"
G.Thumbnail8.ScaleType = Enum.ScaleType.Fit
G.Thumbnail8.ZIndex = 0
G.Thumbnail8.Rotation = -11
G.Thumbnail8.Parent = G.CanvasGroup2

G.Unavailable16 = Instance.new("TextLabel")
G.Unavailable16.Name = "Unavailable"
G.Unavailable16.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable16.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable16.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable16.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable16.BackgroundTransparency = 1
G.Unavailable16.BorderSizePixel = 0
G.Unavailable16.Text = "Unavailable"
G.Unavailable16.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable16.TextSize = 14
G.Unavailable16.Font = Enum.Font.FredokaOne
G.Unavailable16.TextWrapped = true
G.Unavailable16.TextScaled = true
G.Unavailable16.Visible = false
G.Unavailable16.Parent = G.Thumbnail8

G.UIStroke48 = Instance.new("UIStroke")
G.UIStroke48.Name = "UIStroke"
G.UIStroke48.Thickness = 2
G.UIStroke48.Parent = G.Unavailable16

G.Thumbnail9 = Instance.new("ImageLabel")
G.Thumbnail9.Name = "Thumbnail"
G.Thumbnail9.Size = UDim2.new(0.401091,0,1.04567,0)
G.Thumbnail9.Position = UDim2.new(0.17826,0,0.412124,0)
G.Thumbnail9.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail9.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail9.BackgroundTransparency = 1
G.Thumbnail9.BorderSizePixel = 0
G.Thumbnail9.Image = "rbxassetid://74140937437882"
G.Thumbnail9.ScaleType = Enum.ScaleType.Fit
G.Thumbnail9.ZIndex = -1
G.Thumbnail9.Rotation = 16
G.Thumbnail9.Parent = G.CanvasGroup2

G.Unavailable17 = Instance.new("TextLabel")
G.Unavailable17.Name = "Unavailable"
G.Unavailable17.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable17.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable17.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable17.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable17.BackgroundTransparency = 1
G.Unavailable17.BorderSizePixel = 0
G.Unavailable17.Text = "Unavailable"
G.Unavailable17.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable17.TextSize = 14
G.Unavailable17.Font = Enum.Font.FredokaOne
G.Unavailable17.TextWrapped = true
G.Unavailable17.TextScaled = true
G.Unavailable17.Visible = false
G.Unavailable17.Parent = G.Thumbnail9

G.UIStroke49 = Instance.new("UIStroke")
G.UIStroke49.Name = "UIStroke"
G.UIStroke49.Thickness = 2
G.UIStroke49.Parent = G.Unavailable17

G.Thumbnail10 = Instance.new("ImageLabel")
G.Thumbnail10.Name = "Thumbnail"
G.Thumbnail10.Size = UDim2.new(0.334554,0,0.967788,0)
G.Thumbnail10.Position = UDim2.new(0.35793,0,0.497652,0)
G.Thumbnail10.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail10.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail10.BackgroundTransparency = 1
G.Thumbnail10.BorderSizePixel = 0
G.Thumbnail10.Image = "rbxassetid://72412129694112"
G.Thumbnail10.ScaleType = Enum.ScaleType.Fit
G.Thumbnail10.ZIndex = 0
G.Thumbnail10.Parent = G.CanvasGroup2

G.Unavailable18 = Instance.new("TextLabel")
G.Unavailable18.Name = "Unavailable"
G.Unavailable18.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable18.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable18.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable18.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable18.BackgroundTransparency = 1
G.Unavailable18.BorderSizePixel = 0
G.Unavailable18.Text = "Unavailable"
G.Unavailable18.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable18.TextSize = 14
G.Unavailable18.Font = Enum.Font.FredokaOne
G.Unavailable18.TextWrapped = true
G.Unavailable18.TextScaled = true
G.Unavailable18.Visible = false
G.Unavailable18.Parent = G.Thumbnail10

G.UIStroke50 = Instance.new("UIStroke")
G.UIStroke50.Name = "UIStroke"
G.UIStroke50.Thickness = 2
G.UIStroke50.Parent = G.Unavailable18

G.DisplayTitle5 = Instance.new("TextLabel")
G.DisplayTitle5.Name = "DisplayTitle"
G.DisplayTitle5.Size = UDim2.new(0.28831,0,0.367128,0)
G.DisplayTitle5.Position = UDim2.new(0.814632,0,0.191717,0)
G.DisplayTitle5.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle5.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle5.BackgroundTransparency = 1
G.DisplayTitle5.BorderSizePixel = 0
G.DisplayTitle5.Text = "Lost Prince Gourdy 14\" Deluxe Plush (Pre-Order)"
G.DisplayTitle5.TextColor3 = Color3.fromRGB(0,0,0)
G.DisplayTitle5.TextSize = 29
G.DisplayTitle5.Font = Enum.Font.Arcade
G.DisplayTitle5.TextWrapped = true
G.DisplayTitle5.TextScaled = true
G.DisplayTitle5.RichText = true
G.DisplayTitle5.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle5.Parent = G.COM_901743514273055154

G.UIAspectRatioConstraint9 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint9.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint9.AspectRatio = 2.66
G.UIAspectRatioConstraint9.Parent = G.DisplayTitle5

G.UIGradient13 = Instance.new("UIGradient")
G.UIGradient13.Name = "UIGradient"
G.UIGradient13.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient13.Rotation = -90
G.UIGradient13.Offset = Vector2.new(0,0)
G.UIGradient13.Enabled = false
G.UIGradient13.Parent = G.DisplayTitle5

G.UIStroke51 = Instance.new("UIStroke")
G.UIStroke51.Name = "UIStroke"
G.UIStroke51.Color = Color3.fromRGB(255,255,255)
G.UIStroke51.Thickness = 0.931838
G.UIStroke51.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke51.Parent = G.DisplayTitle5

G.Item6 = Instance.new("ImageLabel")
G.Item6.Name = "Item"
G.Item6.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item6.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item6.AnchorPoint = Vector2.new(0.5,0.5)
G.Item6.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item6.BackgroundTransparency = 1
G.Item6.BorderSizePixel = 0
G.Item6.Image = "rbxassetid://94959635148921"
G.Item6.ImageRectOffset = Vector2.new(15,15)
G.Item6.ImageRectSize = Vector2.new(270,270)
G.Item6.ScaleType = Enum.ScaleType.Fit
G.Item6.Visible = false
G.Item6.ZIndex = -1
G.Item6.Parent = G.COM_901743514273055154

G.Unavailable19 = Instance.new("TextLabel")
G.Unavailable19.Name = "Unavailable"
G.Unavailable19.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable19.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable19.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable19.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable19.BackgroundTransparency = 1
G.Unavailable19.BorderSizePixel = 0
G.Unavailable19.Text = "Unavailable"
G.Unavailable19.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable19.TextSize = 14
G.Unavailable19.Font = Enum.Font.FredokaOne
G.Unavailable19.TextWrapped = true
G.Unavailable19.TextScaled = true
G.Unavailable19.Visible = false
G.Unavailable19.Parent = G.Item6

G.UIStroke52 = Instance.new("UIStroke")
G.UIStroke52.Name = "UIStroke"
G.UIStroke52.Thickness = 2
G.UIStroke52.Parent = G.Unavailable19

G.New2 = Instance.new("ImageLabel")
G.New2.Name = "New"
G.New2.Size = UDim2.new(0.322123,0,0.355513,0)
G.New2.Position = UDim2.new(0.928356,0,0.0669836,0)
G.New2.AnchorPoint = Vector2.new(0.5,0.5)
G.New2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New2.BackgroundTransparency = 1
G.New2.BorderSizePixel = 0
G.New2.Image = "rbxassetid://96728750855907"
G.New2.ScaleType = Enum.ScaleType.Fit
G.New2.ZIndex = -1
G.New2.Parent = G.COM_901743514273055154

G.UIScale9 = Instance.new("UIScale")
G.UIScale9.Name = "UIScale"
G.UIScale9.Parent = G.New2

G.Purchase6 = Instance.new("ImageButton")
G.Purchase6.Name = "Purchase"
G.Purchase6.Size = UDim2.new(0.299855,0,0.201102,0)
G.Purchase6.Position = UDim2.new(0.814697,0,0.786462,0)
G.Purchase6.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase6.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase6.BorderSizePixel = 0
G.Purchase6.ScaleType = Enum.ScaleType.Fit
G.Purchase6.AutoButtonColor = false
G.Purchase6.Parent = G.COM_901743514273055154

G.Price6 = Instance.new("TextLabel")
G.Price6.Name = "Price"
G.Price6.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price6.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price6.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price6.BackgroundTransparency = 1
G.Price6.BorderSizePixel = 0
G.Price6.Text = "$19.99"
G.Price6.TextColor3 = Color3.fromRGB(255,255,255)
G.Price6.TextSize = 14
G.Price6.Font = Enum.Font.Arcade
G.Price6.TextWrapped = true
G.Price6.TextScaled = true
G.Price6.RichText = true
G.Price6.AutomaticSize = Enum.AutomaticSize.X
G.Price6.Parent = G.Purchase6

G.UIGradient14 = Instance.new("UIGradient")
G.UIGradient14.Name = "UIGradient"
G.UIGradient14.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient14.Rotation = -90
G.UIGradient14.Offset = Vector2.new(0,0)
G.UIGradient14.Parent = G.Price6

G.UIStroke53 = Instance.new("UIStroke")
G.UIStroke53.Name = "UIStroke"
G.UIStroke53.Thickness = 0.931838
G.UIStroke53.Parent = G.Price6

G.UICorner7 = Instance.new("UICorner")
G.UICorner7.Name = "UICorner"
G.UICorner7.CornerRadius = UDim.new(1,0)
G.UICorner7.Parent = G.Purchase6

G.UIGradient15 = Instance.new("UIGradient")
G.UIGradient15.Name = "UIGradient"
G.UIGradient15.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient15.Rotation = -90
G.UIGradient15.Offset = Vector2.new(0,0)
G.UIGradient15.Parent = G.Purchase6

G.UIScale10 = Instance.new("UIScale")
G.UIScale10.Name = "UIScale"
G.UIScale10.Parent = G.Purchase6

G.UIStroke54 = Instance.new("UIStroke")
G.UIStroke54.Name = "UIStroke"
G.UIStroke54.Thickness = 1.1648
G.UIStroke54.Parent = G.Purchase6

G.Thumbnail11 = Instance.new("ImageLabel")
G.Thumbnail11.Name = "Thumbnail"
G.Thumbnail11.Size = UDim2.new(0.48234,0,1.34851,0)
G.Thumbnail11.Position = UDim2.new(0.551555,0,0.39973,0)
G.Thumbnail11.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail11.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail11.BackgroundTransparency = 1
G.Thumbnail11.BorderSizePixel = 0
G.Thumbnail11.Image = "rbxassetid://72961504551056"
G.Thumbnail11.ScaleType = Enum.ScaleType.Fit
G.Thumbnail11.ZIndex = 2
G.Thumbnail11.Parent = G.COM_901743514273055154

G.Unavailable20 = Instance.new("TextLabel")
G.Unavailable20.Name = "Unavailable"
G.Unavailable20.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable20.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable20.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable20.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable20.BackgroundTransparency = 1
G.Unavailable20.BorderSizePixel = 0
G.Unavailable20.Text = "Unavailable"
G.Unavailable20.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable20.TextSize = 14
G.Unavailable20.Font = Enum.Font.FredokaOne
G.Unavailable20.TextWrapped = true
G.Unavailable20.TextScaled = true
G.Unavailable20.Visible = false
G.Unavailable20.Parent = G.Thumbnail11

G.UIStroke55 = Instance.new("UIStroke")
G.UIStroke55.Name = "UIStroke"
G.UIStroke55.Thickness = 2
G.UIStroke55.Parent = G.Unavailable20

G.Title6 = Instance.new("TextLabel")
G.Title6.Name = "Title"
G.Title6.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title6.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title6.AnchorPoint = Vector2.new(0.5,0)
G.Title6.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title6.BackgroundTransparency = 1
G.Title6.BorderSizePixel = 0
G.Title6.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title6.TextColor3 = Color3.fromRGB(0,13,76)
G.Title6.TextSize = 29
G.Title6.Font = Enum.Font.Arcade
G.Title6.TextWrapped = true
G.Title6.TextScaled = true
G.Title6.RichText = true
G.Title6.Visible = false
G.Title6.AutomaticSize = Enum.AutomaticSize.X
G.Title6.Parent = G.COM_901743514273055154

G.UIGradient16 = Instance.new("UIGradient")
G.UIGradient16.Name = "UIGradient"
G.UIGradient16.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient16.Rotation = -90
G.UIGradient16.Offset = Vector2.new(0,0)
G.UIGradient16.Parent = G.Title6

G.UIStroke56 = Instance.new("UIStroke")
G.UIStroke56.Name = "UIStroke"
G.UIStroke56.Color = Color3.fromRGB(255,255,255)
G.UIStroke56.Thickness = 2
G.UIStroke56.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke56.Parent = G.Title6

G.UIListLayout4 = Instance.new("UIListLayout")
G.UIListLayout4.Name = "UIListLayout"
G.UIListLayout4.Padding = UDim.new(0.019,0)
G.UIListLayout4.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout4.Wraps = false
G.UIListLayout4.Parent = G.Special3

G.Special4 = Instance.new("Frame")
G.Special4.Name = "Special"
G.Special4.Size = UDim2.new(0.728,0,0.493,0)
G.Special4.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
G.Special4.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special4.BackgroundTransparency = 1
G.Special4.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special4.BorderSizePixel = 0
G.Special4.LayoutOrder = -16
G.Special4.Parent = G.ScrollingFrame

G.COM_9017435142730551542 = Instance.new("Frame")
G.COM_9017435142730551542.Name = "COM-901743514273055154"
G.COM_9017435142730551542.Size = UDim2.new(0.894198,0,0.931112,0)
G.COM_9017435142730551542.Position = UDim2.new(5.4771e-08,0,0,0)
G.COM_9017435142730551542.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_9017435142730551542.BackgroundTransparency = 1
G.COM_9017435142730551542.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_9017435142730551542.BorderSizePixel = 0
G.COM_9017435142730551542.ZIndex = 2
G.COM_9017435142730551542.Parent = G.Special4

G.BG7 = Instance.new("Frame")
G.BG7.Name = "BG"
G.BG7.Size = UDim2.new(1,0,1,0)
G.BG7.Position = UDim2.new(0.5,0,0.5,0)
G.BG7.AnchorPoint = Vector2.new(0.5,0.5)
G.BG7.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG7.BackgroundTransparency = 1
G.BG7.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG7.BorderSizePixel = 0
G.BG7.ZIndex = -1
G.BG7.Parent = G.COM_9017435142730551542

G.Dropshadow6 = Instance.new("Frame")
G.Dropshadow6.Name = "Dropshadow"
G.Dropshadow6.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow6.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow6.AnchorPoint = Vector2.new(0,1)
G.Dropshadow6.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow6.BackgroundTransparency = 0.5
G.Dropshadow6.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow6.BorderSizePixel = 0
G.Dropshadow6.ZIndex = -2
G.Dropshadow6.Parent = G.BG7

G.UIStroke57 = Instance.new("UIStroke")
G.UIStroke57.Name = "UIStroke"
G.UIStroke57.Thickness = 2.79551
G.UIStroke57.Transparency = 1
G.UIStroke57.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke57.Parent = G.Dropshadow6

G.Frame7 = Instance.new("Frame")
G.Frame7.Name = "Frame"
G.Frame7.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame7.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame7.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame7.BackgroundColor3 = Color3.fromRGB(0,148,216)
G.Frame7.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame7.BorderSizePixel = 0
G.Frame7.ZIndex = -1
G.Frame7.Parent = G.BG7

G.Pattern6 = Instance.new("ImageLabel")
G.Pattern6.Name = "Pattern"
G.Pattern6.Size = UDim2.new(1,0,1,0)
G.Pattern6.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern6.BackgroundTransparency = 1
G.Pattern6.BorderSizePixel = 0
G.Pattern6.Image = "rbxassetid://86384941585932"
G.Pattern6.ImageColor3 = Color3.fromRGB(255,201,76)
G.Pattern6.ZIndex = -1
G.Pattern6.Parent = G.Frame7

G.UIStroke58 = Instance.new("UIStroke")
G.UIStroke58.Name = "UIStroke"
G.UIStroke58.Thickness = 1.86368
G.UIStroke58.Parent = G.Pattern6

G.UIGradient17 = Instance.new("UIGradient")
G.UIGradient17.Name = "UIGradient"
G.UIGradient17.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient17.Rotation = 90
G.UIGradient17.Offset = Vector2.new(0,0)
G.UIGradient17.Parent = G.Frame7

G.UIStroke59 = Instance.new("UIStroke")
G.UIStroke59.Name = "UIStroke"
G.UIStroke59.Thickness = 1.86368
G.UIStroke59.Parent = G.Frame7

G.Highlight6 = Instance.new("Frame")
G.Highlight6.Name = "Highlight"
G.Highlight6.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight6.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight6.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight6.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight6.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight6.BorderSizePixel = 0
G.Highlight6.Visible = false
G.Highlight6.ZIndex = -2
G.Highlight6.Parent = G.BG7

G.UIStroke60 = Instance.new("UIStroke")
G.UIStroke60.Name = "UIStroke"
G.UIStroke60.Color = Color3.fromRGB(255,242,0)
G.UIStroke60.Thickness = 2.79551
G.UIStroke60.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke60.Parent = G.Highlight6

G.CanvasGroup3 = Instance.new("CanvasGroup")
G.CanvasGroup3.Name = "CanvasGroup"
G.CanvasGroup3.Size = UDim2.new(0.970515,0,0.95775,0)
G.CanvasGroup3.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup3.BackgroundTransparency = 1
G.CanvasGroup3.Parent = G.COM_9017435142730551542

G.Thumbnail12 = Instance.new("ImageLabel")
G.Thumbnail12.Name = "Thumbnail"
G.Thumbnail12.Size = UDim2.new(0.470619,0,1.14854,0)
G.Thumbnail12.Position = UDim2.new(0.165209,0,0.529027,0)
G.Thumbnail12.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail12.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail12.BackgroundTransparency = 1
G.Thumbnail12.BorderSizePixel = 0
G.Thumbnail12.Image = "rbxassetid://72581890955496"
G.Thumbnail12.ScaleType = Enum.ScaleType.Fit
G.Thumbnail12.Rotation = -11
G.Thumbnail12.Parent = G.CanvasGroup3

G.Unavailable21 = Instance.new("TextLabel")
G.Unavailable21.Name = "Unavailable"
G.Unavailable21.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable21.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable21.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable21.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable21.BackgroundTransparency = 1
G.Unavailable21.BorderSizePixel = 0
G.Unavailable21.Text = "Unavailable"
G.Unavailable21.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable21.TextSize = 14
G.Unavailable21.Font = Enum.Font.FredokaOne
G.Unavailable21.TextWrapped = true
G.Unavailable21.TextScaled = true
G.Unavailable21.Visible = false
G.Unavailable21.Parent = G.Thumbnail12

G.UIStroke61 = Instance.new("UIStroke")
G.UIStroke61.Name = "UIStroke"
G.UIStroke61.Thickness = 2
G.UIStroke61.Parent = G.Unavailable21

G.DisplayTitle6 = Instance.new("TextLabel")
G.DisplayTitle6.Name = "DisplayTitle"
G.DisplayTitle6.Size = UDim2.new(0.447811,0,0.334729,0)
G.DisplayTitle6.Position = UDim2.new(0.752098,0,0.261677,0)
G.DisplayTitle6.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle6.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle6.BackgroundTransparency = 1
G.DisplayTitle6.BorderSizePixel = 0
G.DisplayTitle6.Text = "Lost Prince Gourdy 14\" Deluxe Plush (Pre-Order)"
G.DisplayTitle6.TextColor3 = Color3.fromRGB(2,40,0)
G.DisplayTitle6.TextSize = 29
G.DisplayTitle6.Font = Enum.Font.Arcade
G.DisplayTitle6.TextWrapped = true
G.DisplayTitle6.TextScaled = true
G.DisplayTitle6.RichText = true
G.DisplayTitle6.Parent = G.COM_9017435142730551542

G.UIGradient18 = Instance.new("UIGradient")
G.UIGradient18.Name = "UIGradient"
G.UIGradient18.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient18.Rotation = -90
G.UIGradient18.Offset = Vector2.new(0,0)
G.UIGradient18.Parent = G.DisplayTitle6

G.UIStroke62 = Instance.new("UIStroke")
G.UIStroke62.Name = "UIStroke"
G.UIStroke62.Color = Color3.fromRGB(255,255,255)
G.UIStroke62.Thickness = 0.931838
G.UIStroke62.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke62.Parent = G.DisplayTitle6

G.Item7 = Instance.new("ImageLabel")
G.Item7.Name = "Item"
G.Item7.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item7.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item7.AnchorPoint = Vector2.new(0.5,0.5)
G.Item7.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item7.BackgroundTransparency = 1
G.Item7.BorderSizePixel = 0
G.Item7.Image = "rbxassetid://94959635148921"
G.Item7.ImageRectOffset = Vector2.new(15,15)
G.Item7.ImageRectSize = Vector2.new(270,270)
G.Item7.ScaleType = Enum.ScaleType.Fit
G.Item7.Visible = false
G.Item7.ZIndex = -1
G.Item7.Parent = G.COM_9017435142730551542

G.Unavailable22 = Instance.new("TextLabel")
G.Unavailable22.Name = "Unavailable"
G.Unavailable22.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable22.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable22.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable22.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable22.BackgroundTransparency = 1
G.Unavailable22.BorderSizePixel = 0
G.Unavailable22.Text = "Unavailable"
G.Unavailable22.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable22.TextSize = 14
G.Unavailable22.Font = Enum.Font.FredokaOne
G.Unavailable22.TextWrapped = true
G.Unavailable22.TextScaled = true
G.Unavailable22.Visible = false
G.Unavailable22.Parent = G.Item7

G.UIStroke63 = Instance.new("UIStroke")
G.UIStroke63.Name = "UIStroke"
G.UIStroke63.Thickness = 2
G.UIStroke63.Parent = G.Unavailable22

G.New3 = Instance.new("ImageLabel")
G.New3.Name = "New"
G.New3.Size = UDim2.new(0.322123,0,0.355513,0)
G.New3.Position = UDim2.new(0.874755,0,0.110529,0)
G.New3.AnchorPoint = Vector2.new(0.5,0.5)
G.New3.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New3.BackgroundTransparency = 1
G.New3.BorderSizePixel = 0
G.New3.Image = "rbxassetid://96728750855907"
G.New3.ScaleType = Enum.ScaleType.Fit
G.New3.Visible = false
G.New3.ZIndex = -1
G.New3.Parent = G.COM_9017435142730551542

G.UIScale11 = Instance.new("UIScale")
G.UIScale11.Name = "UIScale"
G.UIScale11.Parent = G.New3

G.Purchase7 = Instance.new("ImageButton")
G.Purchase7.Name = "Purchase"
G.Purchase7.Size = UDim2.new(0.436835,0,0.172928,0)
G.Purchase7.Position = UDim2.new(0.752098,0,0.833662,0)
G.Purchase7.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase7.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase7.BorderSizePixel = 0
G.Purchase7.ScaleType = Enum.ScaleType.Fit
G.Purchase7.AutoButtonColor = false
G.Purchase7.ZIndex = 5
G.Purchase7.Parent = G.COM_9017435142730551542

G.Price7 = Instance.new("TextLabel")
G.Price7.Name = "Price"
G.Price7.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price7.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price7.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price7.BackgroundTransparency = 1
G.Price7.BorderSizePixel = 0
G.Price7.Text = "$19.99"
G.Price7.TextColor3 = Color3.fromRGB(255,255,255)
G.Price7.TextSize = 14
G.Price7.Font = Enum.Font.Arcade
G.Price7.TextWrapped = true
G.Price7.TextScaled = true
G.Price7.RichText = true
G.Price7.AutomaticSize = Enum.AutomaticSize.X
G.Price7.Parent = G.Purchase7

G.UIGradient19 = Instance.new("UIGradient")
G.UIGradient19.Name = "UIGradient"
G.UIGradient19.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient19.Rotation = -90
G.UIGradient19.Offset = Vector2.new(0,0)
G.UIGradient19.Parent = G.Price7

G.UIStroke64 = Instance.new("UIStroke")
G.UIStroke64.Name = "UIStroke"
G.UIStroke64.Thickness = 0.931838
G.UIStroke64.Parent = G.Price7

G.UICorner8 = Instance.new("UICorner")
G.UICorner8.Name = "UICorner"
G.UICorner8.CornerRadius = UDim.new(1,0)
G.UICorner8.Parent = G.Purchase7

G.UIGradient20 = Instance.new("UIGradient")
G.UIGradient20.Name = "UIGradient"
G.UIGradient20.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient20.Rotation = -90
G.UIGradient20.Offset = Vector2.new(0,0)
G.UIGradient20.Parent = G.Purchase7

G.UIScale12 = Instance.new("UIScale")
G.UIScale12.Name = "UIScale"
G.UIScale12.Parent = G.Purchase7

G.UIStroke65 = Instance.new("UIStroke")
G.UIStroke65.Name = "UIStroke"
G.UIStroke65.Thickness = 1.1648
G.UIStroke65.Parent = G.Purchase7

G.Thumbnail13 = Instance.new("ImageLabel")
G.Thumbnail13.Name = "Thumbnail"
G.Thumbnail13.Size = UDim2.new(0.48234,0,1.2575,0)
G.Thumbnail13.Position = UDim2.new(0.42096,0,0.450994,0)
G.Thumbnail13.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail13.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail13.BackgroundTransparency = 1
G.Thumbnail13.BorderSizePixel = 0
G.Thumbnail13.Image = "rbxassetid://72961504551056"
G.Thumbnail13.ScaleType = Enum.ScaleType.Fit
G.Thumbnail13.ZIndex = 4
G.Thumbnail13.Parent = G.COM_9017435142730551542

G.Unavailable23 = Instance.new("TextLabel")
G.Unavailable23.Name = "Unavailable"
G.Unavailable23.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable23.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable23.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable23.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable23.BackgroundTransparency = 1
G.Unavailable23.BorderSizePixel = 0
G.Unavailable23.Text = "Unavailable"
G.Unavailable23.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable23.TextSize = 14
G.Unavailable23.Font = Enum.Font.FredokaOne
G.Unavailable23.TextWrapped = true
G.Unavailable23.TextScaled = true
G.Unavailable23.Visible = false
G.Unavailable23.Parent = G.Thumbnail13

G.UIStroke66 = Instance.new("UIStroke")
G.UIStroke66.Name = "UIStroke"
G.UIStroke66.Thickness = 2
G.UIStroke66.Parent = G.Unavailable23

G.Title7 = Instance.new("TextLabel")
G.Title7.Name = "Title"
G.Title7.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title7.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title7.AnchorPoint = Vector2.new(0.5,0)
G.Title7.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title7.BackgroundTransparency = 1
G.Title7.BorderSizePixel = 0
G.Title7.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title7.TextColor3 = Color3.fromRGB(0,13,76)
G.Title7.TextSize = 29
G.Title7.Font = Enum.Font.Arcade
G.Title7.TextWrapped = true
G.Title7.TextScaled = true
G.Title7.RichText = true
G.Title7.Visible = false
G.Title7.AutomaticSize = Enum.AutomaticSize.X
G.Title7.Parent = G.COM_9017435142730551542

G.UIGradient21 = Instance.new("UIGradient")
G.UIGradient21.Name = "UIGradient"
G.UIGradient21.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient21.Rotation = -90
G.UIGradient21.Offset = Vector2.new(0,0)
G.UIGradient21.Parent = G.Title7

G.UIStroke67 = Instance.new("UIStroke")
G.UIStroke67.Name = "UIStroke"
G.UIStroke67.Color = Color3.fromRGB(255,255,255)
G.UIStroke67.Thickness = 2
G.UIStroke67.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke67.Parent = G.Title7

G.UIListLayout5 = Instance.new("UIListLayout")
G.UIListLayout5.Name = "UIListLayout"
G.UIListLayout5.Padding = UDim.new(0.019,0)
G.UIListLayout5.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout5.Wraps = false
G.UIListLayout5.Parent = G.Special4

G.COM_99712748581159367 = Instance.new("Frame")
G.COM_99712748581159367.Name = "COM-99712748581159367"
G.COM_99712748581159367.Size = UDim2.new(0.442523,0,0.944677,0)
G.COM_99712748581159367.Position = UDim2.new(0.913307,0,0,0)
G.COM_99712748581159367.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_99712748581159367.BackgroundTransparency = 1
G.COM_99712748581159367.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_99712748581159367.BorderSizePixel = 0
G.COM_99712748581159367.LayoutOrder = 1
G.COM_99712748581159367.Parent = G.Special4

G.BG8 = Instance.new("Frame")
G.BG8.Name = "BG"
G.BG8.Size = UDim2.new(1,0,1,0)
G.BG8.Position = UDim2.new(0.5,0,0.5,0)
G.BG8.AnchorPoint = Vector2.new(0.5,0.5)
G.BG8.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG8.BackgroundTransparency = 1
G.BG8.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG8.BorderSizePixel = 0
G.BG8.ZIndex = -2
G.BG8.Parent = G.COM_99712748581159367

G.Dropshadow7 = Instance.new("Frame")
G.Dropshadow7.Name = "Dropshadow"
G.Dropshadow7.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow7.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow7.AnchorPoint = Vector2.new(0,1)
G.Dropshadow7.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow7.BackgroundTransparency = 0.5
G.Dropshadow7.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow7.BorderSizePixel = 0
G.Dropshadow7.ZIndex = -2
G.Dropshadow7.Parent = G.BG8

G.UIStroke68 = Instance.new("UIStroke")
G.UIStroke68.Name = "UIStroke"
G.UIStroke68.Thickness = 2.79551
G.UIStroke68.Transparency = 1
G.UIStroke68.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke68.Parent = G.Dropshadow7

G.Frame8 = Instance.new("Frame")
G.Frame8.Name = "Frame"
G.Frame8.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame8.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame8.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame8.BackgroundColor3 = Color3.fromRGB(0,148,216)
G.Frame8.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame8.BorderSizePixel = 0
G.Frame8.ZIndex = -1
G.Frame8.Parent = G.BG8

G.Pattern7 = Instance.new("ImageLabel")
G.Pattern7.Name = "Pattern"
G.Pattern7.Size = UDim2.new(1,0,1,0)
G.Pattern7.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern7.BackgroundTransparency = 1
G.Pattern7.BorderSizePixel = 0
G.Pattern7.Image = "rbxassetid://86384941585932"
G.Pattern7.ImageColor3 = Color3.fromRGB(130,101,39)
G.Pattern7.ScaleType = Enum.ScaleType.Crop
G.Pattern7.ZIndex = -1
G.Pattern7.Parent = G.Frame8

G.UIStroke69 = Instance.new("UIStroke")
G.UIStroke69.Name = "UIStroke"
G.UIStroke69.Thickness = 1.86368
G.UIStroke69.Parent = G.Pattern7

G.UIGradient22 = Instance.new("UIGradient")
G.UIGradient22.Name = "UIGradient"
G.UIGradient22.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient22.Rotation = 90
G.UIGradient22.Offset = Vector2.new(0,0)
G.UIGradient22.Parent = G.Frame8

G.UIStroke70 = Instance.new("UIStroke")
G.UIStroke70.Name = "UIStroke"
G.UIStroke70.Thickness = 1.86368
G.UIStroke70.Parent = G.Frame8

G.Highlight7 = Instance.new("Frame")
G.Highlight7.Name = "Highlight"
G.Highlight7.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight7.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight7.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight7.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight7.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight7.BorderSizePixel = 0
G.Highlight7.Visible = false
G.Highlight7.ZIndex = -2
G.Highlight7.Parent = G.BG8

G.UIStroke71 = Instance.new("UIStroke")
G.UIStroke71.Name = "UIStroke"
G.UIStroke71.Color = Color3.fromRGB(255,242,0)
G.UIStroke71.Thickness = 2.79551
G.UIStroke71.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke71.Parent = G.Highlight7

G.Item8 = Instance.new("ImageLabel")
G.Item8.Name = "Item"
G.Item8.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item8.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item8.AnchorPoint = Vector2.new(0.5,0.5)
G.Item8.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item8.BackgroundTransparency = 1
G.Item8.BorderSizePixel = 0
G.Item8.Image = "rbxassetid://94959635148921"
G.Item8.ImageRectOffset = Vector2.new(25,25)
G.Item8.ImageRectSize = Vector2.new(250,250)
G.Item8.ScaleType = Enum.ScaleType.Crop
G.Item8.Visible = false
G.Item8.ZIndex = -1
G.Item8.Parent = G.COM_99712748581159367

G.Unavailable24 = Instance.new("TextLabel")
G.Unavailable24.Name = "Unavailable"
G.Unavailable24.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable24.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable24.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable24.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable24.BackgroundTransparency = 1
G.Unavailable24.BorderSizePixel = 0
G.Unavailable24.Text = "Unavailable"
G.Unavailable24.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable24.TextSize = 14
G.Unavailable24.Font = Enum.Font.FredokaOne
G.Unavailable24.TextWrapped = true
G.Unavailable24.TextScaled = true
G.Unavailable24.Visible = false
G.Unavailable24.Parent = G.Item8

G.UIStroke72 = Instance.new("UIStroke")
G.UIStroke72.Name = "UIStroke"
G.UIStroke72.Thickness = 2
G.UIStroke72.Parent = G.Unavailable24

G.New4 = Instance.new("ImageLabel")
G.New4.Name = "New"
G.New4.Size = UDim2.new(0.438881,0,0.589977,0)
G.New4.Position = UDim2.new(0.854234,0,0.0954656,0)
G.New4.AnchorPoint = Vector2.new(0.5,0.5)
G.New4.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New4.BackgroundTransparency = 1
G.New4.BorderSizePixel = 0
G.New4.Image = "rbxassetid://96728750855907"
G.New4.ScaleType = Enum.ScaleType.Fit
G.New4.ZIndex = -1
G.New4.Parent = G.COM_99712748581159367

G.UIScale13 = Instance.new("UIScale")
G.UIScale13.Name = "UIScale"
G.UIScale13.Parent = G.New4

G.Pixel4 = Instance.new("ImageLabel")
G.Pixel4.Name = "Pixel"
G.Pixel4.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel4.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel4.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel4.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel4.BorderSizePixel = 0
G.Pixel4.Image = "rbxassetid://94959635148921"
G.Pixel4.ImageRectOffset = Vector2.new(55,100)
G.Pixel4.ImageRectSize = Vector2.new(30,30)
G.Pixel4.ScaleType = Enum.ScaleType.Crop
G.Pixel4.Visible = false
G.Pixel4.ZIndex = 5
G.Pixel4.Parent = G.COM_99712748581159367

G.Unavailable25 = Instance.new("TextLabel")
G.Unavailable25.Name = "Unavailable"
G.Unavailable25.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable25.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable25.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable25.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable25.BackgroundTransparency = 1
G.Unavailable25.BorderSizePixel = 0
G.Unavailable25.Text = "Unavailable"
G.Unavailable25.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable25.TextSize = 14
G.Unavailable25.Font = Enum.Font.FredokaOne
G.Unavailable25.TextWrapped = true
G.Unavailable25.TextScaled = true
G.Unavailable25.Visible = false
G.Unavailable25.Parent = G.Pixel4

G.UIStroke73 = Instance.new("UIStroke")
G.UIStroke73.Name = "UIStroke"
G.UIStroke73.Thickness = 2
G.UIStroke73.Parent = G.Unavailable25

G.Purchase8 = Instance.new("ImageButton")
G.Purchase8.Name = "Purchase"
G.Purchase8.Size = UDim2.new(0.863319,0,0.170445,0)
G.Purchase8.Position = UDim2.new(0.514166,0,0.821691,0)
G.Purchase8.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase8.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase8.BorderSizePixel = 0
G.Purchase8.ScaleType = Enum.ScaleType.Fit
G.Purchase8.AutoButtonColor = false
G.Purchase8.ZIndex = 6
G.Purchase8.Parent = G.COM_99712748581159367

G.Price8 = Instance.new("TextLabel")
G.Price8.Name = "Price"
G.Price8.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price8.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price8.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price8.BackgroundTransparency = 1
G.Price8.BorderSizePixel = 0
G.Price8.Text = "$19.99"
G.Price8.TextColor3 = Color3.fromRGB(255,255,255)
G.Price8.TextSize = 14
G.Price8.Font = Enum.Font.Arcade
G.Price8.TextWrapped = true
G.Price8.TextScaled = true
G.Price8.RichText = true
G.Price8.AutomaticSize = Enum.AutomaticSize.X
G.Price8.Parent = G.Purchase8

G.UIGradient23 = Instance.new("UIGradient")
G.UIGradient23.Name = "UIGradient"
G.UIGradient23.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient23.Rotation = -90
G.UIGradient23.Offset = Vector2.new(0,0)
G.UIGradient23.Parent = G.Price8

G.UIStroke74 = Instance.new("UIStroke")
G.UIStroke74.Name = "UIStroke"
G.UIStroke74.Thickness = 2
G.UIStroke74.Parent = G.Price8

G.UICorner9 = Instance.new("UICorner")
G.UICorner9.Name = "UICorner"
G.UICorner9.CornerRadius = UDim.new(1,0)
G.UICorner9.Parent = G.Purchase8

G.UIGradient24 = Instance.new("UIGradient")
G.UIGradient24.Name = "UIGradient"
G.UIGradient24.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient24.Rotation = -90
G.UIGradient24.Offset = Vector2.new(0,0)
G.UIGradient24.Parent = G.Purchase8

G.UIScale14 = Instance.new("UIScale")
G.UIScale14.Name = "UIScale"
G.UIScale14.Parent = G.Purchase8

G.UIStroke75 = Instance.new("UIStroke")
G.UIStroke75.Name = "UIStroke"
G.UIStroke75.Thickness = 2.5
G.UIStroke75.Parent = G.Purchase8

G.Thumbnail14 = Instance.new("ImageLabel")
G.Thumbnail14.Name = "Thumbnail"
G.Thumbnail14.Size = UDim2.new(1.15659,0,0.857211,0)
G.Thumbnail14.Position = UDim2.new(0.495381,0,0.470327,0)
G.Thumbnail14.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail14.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail14.BackgroundTransparency = 1
G.Thumbnail14.BorderSizePixel = 0
G.Thumbnail14.Image = "rbxassetid://81743399983990"
G.Thumbnail14.ScaleType = Enum.ScaleType.Crop
G.Thumbnail14.ZIndex = -1
G.Thumbnail14.Parent = G.COM_99712748581159367

G.Unavailable26 = Instance.new("TextLabel")
G.Unavailable26.Name = "Unavailable"
G.Unavailable26.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable26.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable26.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable26.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable26.BackgroundTransparency = 1
G.Unavailable26.BorderSizePixel = 0
G.Unavailable26.Text = "Unavailable"
G.Unavailable26.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable26.TextSize = 14
G.Unavailable26.Font = Enum.Font.FredokaOne
G.Unavailable26.TextWrapped = true
G.Unavailable26.TextScaled = true
G.Unavailable26.Visible = false
G.Unavailable26.Parent = G.Thumbnail14

G.UIStroke76 = Instance.new("UIStroke")
G.UIStroke76.Name = "UIStroke"
G.UIStroke76.Thickness = 2
G.UIStroke76.Parent = G.Unavailable26

G.Title8 = Instance.new("TextLabel")
G.Title8.Name = "Title"
G.Title8.Size = UDim2.new(0.874784,0,0.149,0)
G.Title8.Position = UDim2.new(0.531264,0,0.0306123,0)
G.Title8.AnchorPoint = Vector2.new(0.5,0)
G.Title8.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title8.BackgroundTransparency = 1
G.Title8.BorderSizePixel = 0
G.Title8.Text = "Bobette 11" x 14" Poster"
G.Title8.TextColor3 = Color3.fromRGB(0,0,0)
G.Title8.TextSize = 29
G.Title8.Font = Enum.Font.Arcade
G.Title8.TextXAlignment = Enum.TextXAlignment.Left
G.Title8.TextYAlignment = Enum.TextYAlignment.Top
G.Title8.TextWrapped = true
G.Title8.TextScaled = true
G.Title8.RichText = true
G.Title8.Visible = false
G.Title8.AutomaticSize = Enum.AutomaticSize.X
G.Title8.Parent = G.COM_99712748581159367

G.UITextSizeConstraint7 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint7.Name = "UITextSizeConstraint"
G.UITextSizeConstraint7.MaxTextSize = 29
G.UITextSizeConstraint7.Parent = G.Title8

G.Special5 = Instance.new("Frame")
G.Special5.Name = "Special"
G.Special5.Size = UDim2.new(1.10498,0,0.439953,0)
G.Special5.Position = UDim2.new(0,0,-0.143337,0)
G.Special5.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special5.BackgroundTransparency = 1
G.Special5.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special5.BorderSizePixel = 0
G.Special5.LayoutOrder = -15
G.Special5.Parent = G.ScrollingFrame

G.COM_8523425560376639946 = Instance.new("Frame")
G.COM_8523425560376639946.Name = "COM-8523425560376639946"
G.COM_8523425560376639946.Size = UDim2.new(0.894307,0,0.931111,0)
G.COM_8523425560376639946.Position = UDim2.new(-5.79236e-08,0,0,0)
G.COM_8523425560376639946.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_8523425560376639946.BackgroundTransparency = 1
G.COM_8523425560376639946.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_8523425560376639946.BorderSizePixel = 0
G.COM_8523425560376639946.Parent = G.Special5

G.BG9 = Instance.new("Frame")
G.BG9.Name = "BG"
G.BG9.Size = UDim2.new(1,0,1,0)
G.BG9.Position = UDim2.new(0.5,0,0.5,0)
G.BG9.AnchorPoint = Vector2.new(0.5,0.5)
G.BG9.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG9.BackgroundTransparency = 1
G.BG9.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG9.BorderSizePixel = 0
G.BG9.ZIndex = -1
G.BG9.Parent = G.COM_8523425560376639946

G.Dropshadow8 = Instance.new("Frame")
G.Dropshadow8.Name = "Dropshadow"
G.Dropshadow8.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow8.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow8.AnchorPoint = Vector2.new(0,1)
G.Dropshadow8.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow8.BackgroundTransparency = 0.5
G.Dropshadow8.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow8.BorderSizePixel = 0
G.Dropshadow8.ZIndex = -2
G.Dropshadow8.Parent = G.BG9

G.UIStroke77 = Instance.new("UIStroke")
G.UIStroke77.Name = "UIStroke"
G.UIStroke77.Thickness = 2.79551
G.UIStroke77.Transparency = 1
G.UIStroke77.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke77.Parent = G.Dropshadow8

G.Frame9 = Instance.new("Frame")
G.Frame9.Name = "Frame"
G.Frame9.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame9.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame9.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame9.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame9.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame9.BorderSizePixel = 0
G.Frame9.ZIndex = -1
G.Frame9.Parent = G.BG9

G.Pattern8 = Instance.new("ImageLabel")
G.Pattern8.Name = "Pattern"
G.Pattern8.Size = UDim2.new(0.635249,0,1,0)
G.Pattern8.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern8.BackgroundTransparency = 1
G.Pattern8.BorderSizePixel = 0
G.Pattern8.Image = "rbxassetid://98127658855696"
G.Pattern8.ZIndex = -1
G.Pattern8.Parent = G.Frame9

G.UIStroke78 = Instance.new("UIStroke")
G.UIStroke78.Name = "UIStroke"
G.UIStroke78.Thickness = 1.86368
G.UIStroke78.Parent = G.Pattern8

G.UIStroke79 = Instance.new("UIStroke")
G.UIStroke79.Name = "UIStroke"
G.UIStroke79.Thickness = 1.86368
G.UIStroke79.Parent = G.Frame9

G.Highlight8 = Instance.new("Frame")
G.Highlight8.Name = "Highlight"
G.Highlight8.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight8.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight8.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight8.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight8.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight8.BorderSizePixel = 0
G.Highlight8.Visible = false
G.Highlight8.ZIndex = -2
G.Highlight8.Parent = G.BG9

G.UIStroke80 = Instance.new("UIStroke")
G.UIStroke80.Name = "UIStroke"
G.UIStroke80.Color = Color3.fromRGB(255,242,0)
G.UIStroke80.Thickness = 2.79551
G.UIStroke80.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke80.Parent = G.Highlight8

G.CanvasGroup4 = Instance.new("CanvasGroup")
G.CanvasGroup4.Name = "CanvasGroup"
G.CanvasGroup4.Size = UDim2.new(1,0,1,0)
G.CanvasGroup4.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup4.BackgroundTransparency = 1
G.CanvasGroup4.Parent = G.COM_8523425560376639946

G.Thumbnail15 = Instance.new("ImageLabel")
G.Thumbnail15.Name = "Thumbnail"
G.Thumbnail15.Size = UDim2.new(0.37992,0,0.941288,0)
G.Thumbnail15.Position = UDim2.new(0.11109,0,0.564367,0)
G.Thumbnail15.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail15.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail15.BackgroundTransparency = 1
G.Thumbnail15.BorderSizePixel = 0
G.Thumbnail15.Image = "rbxassetid://79611996052293"
G.Thumbnail15.ScaleType = Enum.ScaleType.Fit
G.Thumbnail15.ZIndex = 0
G.Thumbnail15.Rotation = -11
G.Thumbnail15.Parent = G.CanvasGroup4

G.Unavailable27 = Instance.new("TextLabel")
G.Unavailable27.Name = "Unavailable"
G.Unavailable27.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable27.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable27.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable27.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable27.BackgroundTransparency = 1
G.Unavailable27.BorderSizePixel = 0
G.Unavailable27.Text = "Unavailable"
G.Unavailable27.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable27.TextSize = 14
G.Unavailable27.Font = Enum.Font.FredokaOne
G.Unavailable27.TextWrapped = true
G.Unavailable27.TextScaled = true
G.Unavailable27.Visible = false
G.Unavailable27.Parent = G.Thumbnail15

G.UIStroke81 = Instance.new("UIStroke")
G.UIStroke81.Name = "UIStroke"
G.UIStroke81.Thickness = 2
G.UIStroke81.Parent = G.Unavailable27

G.Thumbnail16 = Instance.new("ImageLabel")
G.Thumbnail16.Name = "Thumbnail"
G.Thumbnail16.Size = UDim2.new(0.37992,0,0.990478,0)
G.Thumbnail16.Position = UDim2.new(0.188846,0,0.445004,0)
G.Thumbnail16.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail16.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail16.BackgroundTransparency = 1
G.Thumbnail16.BorderSizePixel = 0
G.Thumbnail16.Image = "rbxassetid://109266716868051"
G.Thumbnail16.ScaleType = Enum.ScaleType.Fit
G.Thumbnail16.ZIndex = -1
G.Thumbnail16.Rotation = 16
G.Thumbnail16.Parent = G.CanvasGroup4

G.Unavailable28 = Instance.new("TextLabel")
G.Unavailable28.Name = "Unavailable"
G.Unavailable28.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable28.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable28.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable28.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable28.BackgroundTransparency = 1
G.Unavailable28.BorderSizePixel = 0
G.Unavailable28.Text = "Unavailable"
G.Unavailable28.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable28.TextSize = 14
G.Unavailable28.Font = Enum.Font.FredokaOne
G.Unavailable28.TextWrapped = true
G.Unavailable28.TextScaled = true
G.Unavailable28.Visible = false
G.Unavailable28.Parent = G.Thumbnail16

G.UIStroke82 = Instance.new("UIStroke")
G.UIStroke82.Name = "UIStroke"
G.UIStroke82.Thickness = 2
G.UIStroke82.Parent = G.Unavailable28

G.Thumbnail17 = Instance.new("ImageLabel")
G.Thumbnail17.Name = "Thumbnail"
G.Thumbnail17.Size = UDim2.new(0.319652,0,0.913829,0)
G.Thumbnail17.Position = UDim2.new(0.34791,0,0.497652,0)
G.Thumbnail17.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail17.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail17.BackgroundTransparency = 1
G.Thumbnail17.BorderSizePixel = 0
G.Thumbnail17.Image = "rbxassetid://78563575369012"
G.Thumbnail17.ScaleType = Enum.ScaleType.Fit
G.Thumbnail17.ZIndex = 0
G.Thumbnail17.Rotation = 13
G.Thumbnail17.Parent = G.CanvasGroup4

G.Unavailable29 = Instance.new("TextLabel")
G.Unavailable29.Name = "Unavailable"
G.Unavailable29.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable29.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable29.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable29.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable29.BackgroundTransparency = 1
G.Unavailable29.BorderSizePixel = 0
G.Unavailable29.Text = "Unavailable"
G.Unavailable29.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable29.TextSize = 14
G.Unavailable29.Font = Enum.Font.FredokaOne
G.Unavailable29.TextWrapped = true
G.Unavailable29.TextScaled = true
G.Unavailable29.Visible = false
G.Unavailable29.Parent = G.Thumbnail17

G.UIStroke83 = Instance.new("UIStroke")
G.UIStroke83.Name = "UIStroke"
G.UIStroke83.Thickness = 2
G.UIStroke83.Parent = G.Unavailable29

G.DisplayTitle7 = Instance.new("TextLabel")
G.DisplayTitle7.Name = "DisplayTitle"
G.DisplayTitle7.Size = UDim2.new(0.28831,0,0.367128,0)
G.DisplayTitle7.Position = UDim2.new(0.814632,0,0.191717,0)
G.DisplayTitle7.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle7.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle7.BackgroundTransparency = 1
G.DisplayTitle7.BorderSizePixel = 0
G.DisplayTitle7.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.DisplayTitle7.TextColor3 = Color3.fromRGB(0,0,0)
G.DisplayTitle7.TextSize = 29
G.DisplayTitle7.Font = Enum.Font.Arcade
G.DisplayTitle7.TextWrapped = true
G.DisplayTitle7.TextScaled = true
G.DisplayTitle7.RichText = true
G.DisplayTitle7.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle7.Parent = G.COM_8523425560376639946

G.UIAspectRatioConstraint10 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint10.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint10.AspectRatio = 2.66
G.UIAspectRatioConstraint10.Parent = G.DisplayTitle7

G.UIGradient25 = Instance.new("UIGradient")
G.UIGradient25.Name = "UIGradient"
G.UIGradient25.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient25.Rotation = -90
G.UIGradient25.Offset = Vector2.new(0,0)
G.UIGradient25.Enabled = false
G.UIGradient25.Parent = G.DisplayTitle7

G.UIStroke84 = Instance.new("UIStroke")
G.UIStroke84.Name = "UIStroke"
G.UIStroke84.Color = Color3.fromRGB(255,255,255)
G.UIStroke84.Thickness = 0.931838
G.UIStroke84.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke84.Parent = G.DisplayTitle7

G.Item9 = Instance.new("ImageLabel")
G.Item9.Name = "Item"
G.Item9.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item9.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item9.AnchorPoint = Vector2.new(0.5,0.5)
G.Item9.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item9.BackgroundTransparency = 1
G.Item9.BorderSizePixel = 0
G.Item9.Image = "rbxassetid://94959635148921"
G.Item9.ImageRectOffset = Vector2.new(15,15)
G.Item9.ImageRectSize = Vector2.new(270,270)
G.Item9.ScaleType = Enum.ScaleType.Fit
G.Item9.Visible = false
G.Item9.ZIndex = -1
G.Item9.Parent = G.COM_8523425560376639946

G.Unavailable30 = Instance.new("TextLabel")
G.Unavailable30.Name = "Unavailable"
G.Unavailable30.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable30.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable30.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable30.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable30.BackgroundTransparency = 1
G.Unavailable30.BorderSizePixel = 0
G.Unavailable30.Text = "Unavailable"
G.Unavailable30.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable30.TextSize = 14
G.Unavailable30.Font = Enum.Font.FredokaOne
G.Unavailable30.TextWrapped = true
G.Unavailable30.TextScaled = true
G.Unavailable30.Visible = false
G.Unavailable30.Parent = G.Item9

G.UIStroke85 = Instance.new("UIStroke")
G.UIStroke85.Name = "UIStroke"
G.UIStroke85.Thickness = 2
G.UIStroke85.Parent = G.Unavailable30

G.Purchase9 = Instance.new("ImageButton")
G.Purchase9.Name = "Purchase"
G.Purchase9.Size = UDim2.new(0.299855,0,0.201102,0)
G.Purchase9.Position = UDim2.new(0.814697,0,0.786462,0)
G.Purchase9.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase9.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase9.BorderSizePixel = 0
G.Purchase9.ScaleType = Enum.ScaleType.Fit
G.Purchase9.AutoButtonColor = false
G.Purchase9.Parent = G.COM_8523425560376639946

G.Price9 = Instance.new("TextLabel")
G.Price9.Name = "Price"
G.Price9.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price9.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price9.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price9.BackgroundTransparency = 1
G.Price9.BorderSizePixel = 0
G.Price9.Text = "$19.99"
G.Price9.TextColor3 = Color3.fromRGB(255,255,255)
G.Price9.TextSize = 14
G.Price9.Font = Enum.Font.Arcade
G.Price9.TextWrapped = true
G.Price9.TextScaled = true
G.Price9.RichText = true
G.Price9.AutomaticSize = Enum.AutomaticSize.X
G.Price9.Parent = G.Purchase9

G.UIGradient26 = Instance.new("UIGradient")
G.UIGradient26.Name = "UIGradient"
G.UIGradient26.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient26.Rotation = -90
G.UIGradient26.Offset = Vector2.new(0,0)
G.UIGradient26.Parent = G.Price9

G.UIStroke86 = Instance.new("UIStroke")
G.UIStroke86.Name = "UIStroke"
G.UIStroke86.Thickness = 0.931838
G.UIStroke86.Parent = G.Price9

G.UICorner10 = Instance.new("UICorner")
G.UICorner10.Name = "UICorner"
G.UICorner10.CornerRadius = UDim.new(1,0)
G.UICorner10.Parent = G.Purchase9

G.UIGradient27 = Instance.new("UIGradient")
G.UIGradient27.Name = "UIGradient"
G.UIGradient27.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient27.Rotation = -90
G.UIGradient27.Offset = Vector2.new(0,0)
G.UIGradient27.Parent = G.Purchase9

G.UIScale15 = Instance.new("UIScale")
G.UIScale15.Name = "UIScale"
G.UIScale15.Parent = G.Purchase9

G.UIStroke87 = Instance.new("UIStroke")
G.UIStroke87.Name = "UIStroke"
G.UIStroke87.Thickness = 1.1648
G.UIStroke87.Parent = G.Purchase9

G.Thumbnail18 = Instance.new("ImageLabel")
G.Thumbnail18.Name = "Thumbnail"
G.Thumbnail18.Size = UDim2.new(0.48234,0,1.2575,0)
G.Thumbnail18.Position = UDim2.new(0.543731,0,0.435241,0)
G.Thumbnail18.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail18.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail18.BackgroundTransparency = 1
G.Thumbnail18.BorderSizePixel = 0
G.Thumbnail18.Image = "rbxassetid://76700469052474"
G.Thumbnail18.ScaleType = Enum.ScaleType.Fit
G.Thumbnail18.ZIndex = -1
G.Thumbnail18.Parent = G.COM_8523425560376639946

G.Unavailable31 = Instance.new("TextLabel")
G.Unavailable31.Name = "Unavailable"
G.Unavailable31.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable31.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable31.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable31.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable31.BackgroundTransparency = 1
G.Unavailable31.BorderSizePixel = 0
G.Unavailable31.Text = "Unavailable"
G.Unavailable31.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable31.TextSize = 14
G.Unavailable31.Font = Enum.Font.FredokaOne
G.Unavailable31.TextWrapped = true
G.Unavailable31.TextScaled = true
G.Unavailable31.Visible = false
G.Unavailable31.Parent = G.Thumbnail18

G.UIStroke88 = Instance.new("UIStroke")
G.UIStroke88.Name = "UIStroke"
G.UIStroke88.Thickness = 2
G.UIStroke88.Parent = G.Unavailable31

G.Title9 = Instance.new("TextLabel")
G.Title9.Name = "Title"
G.Title9.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title9.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title9.AnchorPoint = Vector2.new(0.5,0)
G.Title9.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title9.BackgroundTransparency = 1
G.Title9.BorderSizePixel = 0
G.Title9.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title9.TextColor3 = Color3.fromRGB(0,13,76)
G.Title9.TextSize = 29
G.Title9.Font = Enum.Font.Arcade
G.Title9.TextWrapped = true
G.Title9.TextScaled = true
G.Title9.RichText = true
G.Title9.Visible = false
G.Title9.AutomaticSize = Enum.AutomaticSize.X
G.Title9.Parent = G.COM_8523425560376639946

G.UIGradient28 = Instance.new("UIGradient")
G.UIGradient28.Name = "UIGradient"
G.UIGradient28.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient28.Rotation = -90
G.UIGradient28.Offset = Vector2.new(0,0)
G.UIGradient28.Parent = G.Title9

G.UIStroke89 = Instance.new("UIStroke")
G.UIStroke89.Name = "UIStroke"
G.UIStroke89.Color = Color3.fromRGB(255,255,255)
G.UIStroke89.Thickness = 2
G.UIStroke89.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke89.Parent = G.Title9

G.UIListLayout6 = Instance.new("UIListLayout")
G.UIListLayout6.Name = "UIListLayout"
G.UIListLayout6.Padding = UDim.new(0.019,0)
G.UIListLayout6.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout6.Wraps = false
G.UIListLayout6.Parent = G.Special5

G.Special6 = Instance.new("Frame")
G.Special6.Name = "Special"
G.Special6.Size = UDim2.new(0.728,0,0.493,0)
G.Special6.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
G.Special6.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special6.BackgroundTransparency = 1
G.Special6.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special6.BorderSizePixel = 0
G.Special6.Visible = false
G.Special6.LayoutOrder = -14
G.Special6.Parent = G.ScrollingFrame

G.COM_6342578082452472240 = Instance.new("Frame")
G.COM_6342578082452472240.Name = "COM-6342578082452472240"
G.COM_6342578082452472240.Size = UDim2.new(0.442523,0,0.944677,0)
G.COM_6342578082452472240.Position = UDim2.new(0.913307,0,0,0)
G.COM_6342578082452472240.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_6342578082452472240.BackgroundTransparency = 1
G.COM_6342578082452472240.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_6342578082452472240.BorderSizePixel = 0
G.COM_6342578082452472240.LayoutOrder = -1
G.COM_6342578082452472240.Parent = G.Special6

G.BG10 = Instance.new("Frame")
G.BG10.Name = "BG"
G.BG10.Size = UDim2.new(1,0,1,0)
G.BG10.Position = UDim2.new(0.5,0,0.5,0)
G.BG10.AnchorPoint = Vector2.new(0.5,0.5)
G.BG10.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG10.BackgroundTransparency = 1
G.BG10.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG10.BorderSizePixel = 0
G.BG10.ZIndex = -1
G.BG10.Parent = G.COM_6342578082452472240

G.Dropshadow9 = Instance.new("Frame")
G.Dropshadow9.Name = "Dropshadow"
G.Dropshadow9.Size = UDim2.new(0.947997,0,0.95376,0)
G.Dropshadow9.Position = UDim2.new(-0.00747363,0,1.01324,0)
G.Dropshadow9.AnchorPoint = Vector2.new(0,1)
G.Dropshadow9.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow9.BackgroundTransparency = 0.5
G.Dropshadow9.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow9.BorderSizePixel = 0
G.Dropshadow9.ZIndex = -2
G.Dropshadow9.Parent = G.BG10

G.UIStroke90 = Instance.new("UIStroke")
G.UIStroke90.Name = "UIStroke"
G.UIStroke90.Thickness = 2.79551
G.UIStroke90.Transparency = 1
G.UIStroke90.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke90.Parent = G.Dropshadow9

G.Frame10 = Instance.new("Frame")
G.Frame10.Name = "Frame"
G.Frame10.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame10.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame10.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame10.BackgroundColor3 = Color3.fromRGB(0,148,216)
G.Frame10.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame10.BorderSizePixel = 0
G.Frame10.ZIndex = -1
G.Frame10.Parent = G.BG10

G.Pattern9 = Instance.new("ImageLabel")
G.Pattern9.Name = "Pattern"
G.Pattern9.Size = UDim2.new(1,0,1,0)
G.Pattern9.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern9.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern9.BackgroundTransparency = 1
G.Pattern9.BorderSizePixel = 0
G.Pattern9.Image = "rbxassetid://125256780775731"
G.Pattern9.ImageColor3 = Color3.fromRGB(133,243,255)
G.Pattern9.ScaleType = Enum.ScaleType.Crop
G.Pattern9.ZIndex = -1
G.Pattern9.Parent = G.Frame10

G.UIGradient29 = Instance.new("UIGradient")
G.UIGradient29.Name = "UIGradient"
G.UIGradient29.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
G.UIGradient29.Rotation = 90
G.UIGradient29.Offset = Vector2.new(0,0)
G.UIGradient29.Parent = G.Pattern9

G.UIStroke91 = Instance.new("UIStroke")
G.UIStroke91.Name = "UIStroke"
G.UIStroke91.Thickness = 1.86368
G.UIStroke91.Parent = G.Pattern9

G.UIGradient30 = Instance.new("UIGradient")
G.UIGradient30.Name = "UIGradient"
G.UIGradient30.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient30.Rotation = 90
G.UIGradient30.Offset = Vector2.new(0,0)
G.UIGradient30.Parent = G.Frame10

G.UIStroke92 = Instance.new("UIStroke")
G.UIStroke92.Name = "UIStroke"
G.UIStroke92.Thickness = 1.86368
G.UIStroke92.Parent = G.Frame10

G.Highlight9 = Instance.new("Frame")
G.Highlight9.Name = "Highlight"
G.Highlight9.Size = UDim2.new(0.954203,0,0.95775,0)
G.Highlight9.Position = UDim2.new(0.519351,0,0.478875,0)
G.Highlight9.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight9.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight9.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight9.BorderSizePixel = 0
G.Highlight9.Visible = false
G.Highlight9.ZIndex = -2
G.Highlight9.Parent = G.BG10

G.UIStroke93 = Instance.new("UIStroke")
G.UIStroke93.Name = "UIStroke"
G.UIStroke93.Color = Color3.fromRGB(255,242,0)
G.UIStroke93.Thickness = 2.79551
G.UIStroke93.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke93.Parent = G.Highlight9

G.Item10 = Instance.new("ImageLabel")
G.Item10.Name = "Item"
G.Item10.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item10.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item10.AnchorPoint = Vector2.new(0.5,0.5)
G.Item10.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item10.BackgroundTransparency = 1
G.Item10.BorderSizePixel = 0
G.Item10.Image = "rbxassetid://94959635148921"
G.Item10.ImageRectOffset = Vector2.new(25,25)
G.Item10.ImageRectSize = Vector2.new(250,250)
G.Item10.ScaleType = Enum.ScaleType.Crop
G.Item10.Visible = false
G.Item10.ZIndex = -1
G.Item10.Parent = G.COM_6342578082452472240

G.Unavailable32 = Instance.new("TextLabel")
G.Unavailable32.Name = "Unavailable"
G.Unavailable32.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable32.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable32.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable32.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable32.BackgroundTransparency = 1
G.Unavailable32.BorderSizePixel = 0
G.Unavailable32.Text = "Unavailable"
G.Unavailable32.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable32.TextSize = 14
G.Unavailable32.Font = Enum.Font.FredokaOne
G.Unavailable32.TextWrapped = true
G.Unavailable32.TextScaled = true
G.Unavailable32.Visible = false
G.Unavailable32.Parent = G.Item10

G.UIStroke94 = Instance.new("UIStroke")
G.UIStroke94.Name = "UIStroke"
G.UIStroke94.Thickness = 2
G.UIStroke94.Parent = G.Unavailable32

G.Pixel5 = Instance.new("ImageLabel")
G.Pixel5.Name = "Pixel"
G.Pixel5.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel5.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel5.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel5.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel5.BorderSizePixel = 0
G.Pixel5.Image = "rbxassetid://94959635148921"
G.Pixel5.ImageRectOffset = Vector2.new(55,100)
G.Pixel5.ImageRectSize = Vector2.new(30,30)
G.Pixel5.ScaleType = Enum.ScaleType.Crop
G.Pixel5.Visible = false
G.Pixel5.ZIndex = 5
G.Pixel5.Parent = G.COM_6342578082452472240

G.Unavailable33 = Instance.new("TextLabel")
G.Unavailable33.Name = "Unavailable"
G.Unavailable33.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable33.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable33.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable33.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable33.BackgroundTransparency = 1
G.Unavailable33.BorderSizePixel = 0
G.Unavailable33.Text = "Unavailable"
G.Unavailable33.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable33.TextSize = 14
G.Unavailable33.Font = Enum.Font.FredokaOne
G.Unavailable33.TextWrapped = true
G.Unavailable33.TextScaled = true
G.Unavailable33.Visible = false
G.Unavailable33.Parent = G.Pixel5

G.UIStroke95 = Instance.new("UIStroke")
G.UIStroke95.Name = "UIStroke"
G.UIStroke95.Thickness = 2
G.UIStroke95.Parent = G.Unavailable33

G.Purchase10 = Instance.new("ImageButton")
G.Purchase10.Name = "Purchase"
G.Purchase10.Size = UDim2.new(0.863319,0,0.170445,0)
G.Purchase10.Position = UDim2.new(0.514166,0,0.821691,0)
G.Purchase10.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase10.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase10.BorderSizePixel = 0
G.Purchase10.ScaleType = Enum.ScaleType.Fit
G.Purchase10.AutoButtonColor = false
G.Purchase10.ZIndex = 6
G.Purchase10.Parent = G.COM_6342578082452472240

G.Price10 = Instance.new("TextLabel")
G.Price10.Name = "Price"
G.Price10.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price10.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price10.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price10.BackgroundTransparency = 1
G.Price10.BorderSizePixel = 0
G.Price10.Text = "$19.99"
G.Price10.TextColor3 = Color3.fromRGB(255,255,255)
G.Price10.TextSize = 14
G.Price10.Font = Enum.Font.Arcade
G.Price10.TextWrapped = true
G.Price10.TextScaled = true
G.Price10.RichText = true
G.Price10.AutomaticSize = Enum.AutomaticSize.X
G.Price10.Parent = G.Purchase10

G.UIGradient31 = Instance.new("UIGradient")
G.UIGradient31.Name = "UIGradient"
G.UIGradient31.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient31.Rotation = -90
G.UIGradient31.Offset = Vector2.new(0,0)
G.UIGradient31.Parent = G.Price10

G.UIStroke96 = Instance.new("UIStroke")
G.UIStroke96.Name = "UIStroke"
G.UIStroke96.Thickness = 2
G.UIStroke96.Parent = G.Price10

G.UICorner11 = Instance.new("UICorner")
G.UICorner11.Name = "UICorner"
G.UICorner11.CornerRadius = UDim.new(1,0)
G.UICorner11.Parent = G.Purchase10

G.UIGradient32 = Instance.new("UIGradient")
G.UIGradient32.Name = "UIGradient"
G.UIGradient32.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient32.Rotation = -90
G.UIGradient32.Offset = Vector2.new(0,0)
G.UIGradient32.Parent = G.Purchase10

G.UIScale16 = Instance.new("UIScale")
G.UIScale16.Name = "UIScale"
G.UIScale16.Parent = G.Purchase10

G.UIStroke97 = Instance.new("UIStroke")
G.UIStroke97.Name = "UIStroke"
G.UIStroke97.Thickness = 2.5
G.UIStroke97.Parent = G.Purchase10

G.Thumbnail19 = Instance.new("ImageLabel")
G.Thumbnail19.Name = "Thumbnail"
G.Thumbnail19.Size = UDim2.new(1.15659,0,0.857211,0)
G.Thumbnail19.Position = UDim2.new(0.495381,0,0.470327,0)
G.Thumbnail19.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail19.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail19.BackgroundTransparency = 1
G.Thumbnail19.BorderSizePixel = 0
G.Thumbnail19.Image = "rbxassetid://102766462181767"
G.Thumbnail19.ScaleType = Enum.ScaleType.Crop
G.Thumbnail19.ZIndex = -1
G.Thumbnail19.Parent = G.COM_6342578082452472240

G.Unavailable34 = Instance.new("TextLabel")
G.Unavailable34.Name = "Unavailable"
G.Unavailable34.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable34.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable34.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable34.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable34.BackgroundTransparency = 1
G.Unavailable34.BorderSizePixel = 0
G.Unavailable34.Text = "Unavailable"
G.Unavailable34.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable34.TextSize = 14
G.Unavailable34.Font = Enum.Font.FredokaOne
G.Unavailable34.TextWrapped = true
G.Unavailable34.TextScaled = true
G.Unavailable34.Visible = false
G.Unavailable34.Parent = G.Thumbnail19

G.UIStroke98 = Instance.new("UIStroke")
G.UIStroke98.Name = "UIStroke"
G.UIStroke98.Thickness = 2
G.UIStroke98.Parent = G.Unavailable34

G.Title10 = Instance.new("TextLabel")
G.Title10.Name = "Title"
G.Title10.Size = UDim2.new(0.874784,0,0.149,0)
G.Title10.Position = UDim2.new(0.531264,0,0.0306123,0)
G.Title10.AnchorPoint = Vector2.new(0.5,0)
G.Title10.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title10.BackgroundTransparency = 1
G.Title10.BorderSizePixel = 0
G.Title10.Text = "Bobette 11" x 14" Poster"
G.Title10.TextColor3 = Color3.fromRGB(0,0,0)
G.Title10.TextSize = 29
G.Title10.Font = Enum.Font.Arcade
G.Title10.TextXAlignment = Enum.TextXAlignment.Left
G.Title10.TextYAlignment = Enum.TextYAlignment.Top
G.Title10.TextWrapped = true
G.Title10.TextScaled = true
G.Title10.RichText = true
G.Title10.Visible = false
G.Title10.AutomaticSize = Enum.AutomaticSize.X
G.Title10.Parent = G.COM_6342578082452472240

G.UITextSizeConstraint8 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint8.Name = "UITextSizeConstraint"
G.UITextSizeConstraint8.MaxTextSize = 29
G.UITextSizeConstraint8.Parent = G.Title10

G.COM_5266164701015966145 = Instance.new("Frame")
G.COM_5266164701015966145.Name = "COM-5266164701015966145"
G.COM_5266164701015966145.Size = UDim2.new(0.894198,0,0.931112,0)
G.COM_5266164701015966145.Position = UDim2.new(5.4771e-08,0,0,0)
G.COM_5266164701015966145.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_5266164701015966145.BackgroundTransparency = 1
G.COM_5266164701015966145.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_5266164701015966145.BorderSizePixel = 0
G.COM_5266164701015966145.ZIndex = 2
G.COM_5266164701015966145.Parent = G.Special6

G.BG11 = Instance.new("Frame")
G.BG11.Name = "BG"
G.BG11.Size = UDim2.new(1,0,1,0)
G.BG11.Position = UDim2.new(0.5,0,0.5,0)
G.BG11.AnchorPoint = Vector2.new(0.5,0.5)
G.BG11.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG11.BackgroundTransparency = 1
G.BG11.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG11.BorderSizePixel = 0
G.BG11.ZIndex = -1
G.BG11.Parent = G.COM_5266164701015966145

G.Dropshadow10 = Instance.new("Frame")
G.Dropshadow10.Name = "Dropshadow"
G.Dropshadow10.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow10.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow10.AnchorPoint = Vector2.new(0,1)
G.Dropshadow10.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow10.BackgroundTransparency = 0.5
G.Dropshadow10.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow10.BorderSizePixel = 0
G.Dropshadow10.ZIndex = -2
G.Dropshadow10.Parent = G.BG11

G.UIStroke99 = Instance.new("UIStroke")
G.UIStroke99.Name = "UIStroke"
G.UIStroke99.Thickness = 2.79551
G.UIStroke99.Transparency = 1
G.UIStroke99.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke99.Parent = G.Dropshadow10

G.Frame11 = Instance.new("Frame")
G.Frame11.Name = "Frame"
G.Frame11.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame11.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame11.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame11.BackgroundColor3 = Color3.fromRGB(0,148,216)
G.Frame11.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame11.BorderSizePixel = 0
G.Frame11.ZIndex = -1
G.Frame11.Parent = G.BG11

G.Pattern10 = Instance.new("ImageLabel")
G.Pattern10.Name = "Pattern"
G.Pattern10.Size = UDim2.new(1,0,1,0)
G.Pattern10.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern10.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern10.BackgroundTransparency = 1
G.Pattern10.BorderSizePixel = 0
G.Pattern10.Image = "rbxassetid://125256780775731"
G.Pattern10.ImageColor3 = Color3.fromRGB(133,243,255)
G.Pattern10.ZIndex = -1
G.Pattern10.Parent = G.Frame11

G.UIGradient33 = Instance.new("UIGradient")
G.UIGradient33.Name = "UIGradient"
G.UIGradient33.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
G.UIGradient33.Rotation = 90
G.UIGradient33.Offset = Vector2.new(0,0)
G.UIGradient33.Parent = G.Pattern10

G.UIStroke100 = Instance.new("UIStroke")
G.UIStroke100.Name = "UIStroke"
G.UIStroke100.Thickness = 1.86368
G.UIStroke100.Parent = G.Pattern10

G.UIGradient34 = Instance.new("UIGradient")
G.UIGradient34.Name = "UIGradient"
G.UIGradient34.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient34.Rotation = 90
G.UIGradient34.Offset = Vector2.new(0,0)
G.UIGradient34.Parent = G.Frame11

G.UIStroke101 = Instance.new("UIStroke")
G.UIStroke101.Name = "UIStroke"
G.UIStroke101.Thickness = 1.86368
G.UIStroke101.Parent = G.Frame11

G.Highlight10 = Instance.new("Frame")
G.Highlight10.Name = "Highlight"
G.Highlight10.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight10.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight10.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight10.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight10.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight10.BorderSizePixel = 0
G.Highlight10.Visible = false
G.Highlight10.ZIndex = -2
G.Highlight10.Parent = G.BG11

G.UIStroke102 = Instance.new("UIStroke")
G.UIStroke102.Name = "UIStroke"
G.UIStroke102.Color = Color3.fromRGB(255,242,0)
G.UIStroke102.Thickness = 2.79551
G.UIStroke102.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke102.Parent = G.Highlight10

G.CanvasGroup5 = Instance.new("CanvasGroup")
G.CanvasGroup5.Name = "CanvasGroup"
G.CanvasGroup5.Size = UDim2.new(0.970515,0,0.95775,0)
G.CanvasGroup5.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup5.BackgroundTransparency = 1
G.CanvasGroup5.Parent = G.COM_5266164701015966145

G.Thumbnail20 = Instance.new("ImageLabel")
G.Thumbnail20.Name = "Thumbnail"
G.Thumbnail20.Size = UDim2.new(0.470619,0,1.14854,0)
G.Thumbnail20.Position = UDim2.new(0.165209,0,0.529027,0)
G.Thumbnail20.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail20.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail20.BackgroundTransparency = 1
G.Thumbnail20.BorderSizePixel = 0
G.Thumbnail20.Image = "rbxassetid://134183282955587"
G.Thumbnail20.ScaleType = Enum.ScaleType.Fit
G.Thumbnail20.Rotation = -11
G.Thumbnail20.Parent = G.CanvasGroup5

G.Unavailable35 = Instance.new("TextLabel")
G.Unavailable35.Name = "Unavailable"
G.Unavailable35.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable35.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable35.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable35.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable35.BackgroundTransparency = 1
G.Unavailable35.BorderSizePixel = 0
G.Unavailable35.Text = "Unavailable"
G.Unavailable35.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable35.TextSize = 14
G.Unavailable35.Font = Enum.Font.FredokaOne
G.Unavailable35.TextWrapped = true
G.Unavailable35.TextScaled = true
G.Unavailable35.Visible = false
G.Unavailable35.Parent = G.Thumbnail20

G.UIStroke103 = Instance.new("UIStroke")
G.UIStroke103.Name = "UIStroke"
G.UIStroke103.Thickness = 2
G.UIStroke103.Parent = G.Unavailable35

G.DisplayTitle8 = Instance.new("TextLabel")
G.DisplayTitle8.Name = "DisplayTitle"
G.DisplayTitle8.Size = UDim2.new(0.447811,0,0.334729,0)
G.DisplayTitle8.Position = UDim2.new(0.752098,0,0.261677,0)
G.DisplayTitle8.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle8.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle8.BackgroundTransparency = 1
G.DisplayTitle8.BorderSizePixel = 0
G.DisplayTitle8.Text = "Gigi\
 Deluxe 14\" Plush"
G.DisplayTitle8.TextColor3 = Color3.fromRGB(2,40,0)
G.DisplayTitle8.TextSize = 29
G.DisplayTitle8.Font = Enum.Font.Arcade
G.DisplayTitle8.TextWrapped = true
G.DisplayTitle8.TextScaled = true
G.DisplayTitle8.RichText = true
G.DisplayTitle8.Parent = G.COM_5266164701015966145

G.UIGradient35 = Instance.new("UIGradient")
G.UIGradient35.Name = "UIGradient"
G.UIGradient35.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient35.Rotation = -90
G.UIGradient35.Offset = Vector2.new(0,0)
G.UIGradient35.Parent = G.DisplayTitle8

G.UIStroke104 = Instance.new("UIStroke")
G.UIStroke104.Name = "UIStroke"
G.UIStroke104.Color = Color3.fromRGB(255,255,255)
G.UIStroke104.Thickness = 0.931838
G.UIStroke104.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke104.Parent = G.DisplayTitle8

G.Item11 = Instance.new("ImageLabel")
G.Item11.Name = "Item"
G.Item11.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item11.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item11.AnchorPoint = Vector2.new(0.5,0.5)
G.Item11.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item11.BackgroundTransparency = 1
G.Item11.BorderSizePixel = 0
G.Item11.Image = "rbxassetid://94959635148921"
G.Item11.ImageRectOffset = Vector2.new(15,15)
G.Item11.ImageRectSize = Vector2.new(270,270)
G.Item11.ScaleType = Enum.ScaleType.Fit
G.Item11.Visible = false
G.Item11.ZIndex = -1
G.Item11.Parent = G.COM_5266164701015966145

G.Unavailable36 = Instance.new("TextLabel")
G.Unavailable36.Name = "Unavailable"
G.Unavailable36.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable36.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable36.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable36.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable36.BackgroundTransparency = 1
G.Unavailable36.BorderSizePixel = 0
G.Unavailable36.Text = "Unavailable"
G.Unavailable36.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable36.TextSize = 14
G.Unavailable36.Font = Enum.Font.FredokaOne
G.Unavailable36.TextWrapped = true
G.Unavailable36.TextScaled = true
G.Unavailable36.Visible = false
G.Unavailable36.Parent = G.Item11

G.UIStroke105 = Instance.new("UIStroke")
G.UIStroke105.Name = "UIStroke"
G.UIStroke105.Thickness = 2
G.UIStroke105.Parent = G.Unavailable36

G.New5 = Instance.new("ImageLabel")
G.New5.Name = "New"
G.New5.Size = UDim2.new(0.322123,0,0.355513,0)
G.New5.Position = UDim2.new(0.874755,0,0.110529,0)
G.New5.AnchorPoint = Vector2.new(0.5,0.5)
G.New5.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New5.BackgroundTransparency = 1
G.New5.BorderSizePixel = 0
G.New5.Image = "rbxassetid://96728750855907"
G.New5.ScaleType = Enum.ScaleType.Fit
G.New5.Visible = false
G.New5.ZIndex = -1
G.New5.Parent = G.COM_5266164701015966145

G.UIScale17 = Instance.new("UIScale")
G.UIScale17.Name = "UIScale"
G.UIScale17.Parent = G.New5

G.Purchase11 = Instance.new("ImageButton")
G.Purchase11.Name = "Purchase"
G.Purchase11.Size = UDim2.new(0.436835,0,0.172928,0)
G.Purchase11.Position = UDim2.new(0.752098,0,0.833662,0)
G.Purchase11.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase11.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase11.BorderSizePixel = 0
G.Purchase11.ScaleType = Enum.ScaleType.Fit
G.Purchase11.AutoButtonColor = false
G.Purchase11.ZIndex = 5
G.Purchase11.Parent = G.COM_5266164701015966145

G.Price11 = Instance.new("TextLabel")
G.Price11.Name = "Price"
G.Price11.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price11.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price11.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price11.BackgroundTransparency = 1
G.Price11.BorderSizePixel = 0
G.Price11.Text = "$19.99"
G.Price11.TextColor3 = Color3.fromRGB(255,255,255)
G.Price11.TextSize = 14
G.Price11.Font = Enum.Font.Arcade
G.Price11.TextWrapped = true
G.Price11.TextScaled = true
G.Price11.RichText = true
G.Price11.AutomaticSize = Enum.AutomaticSize.X
G.Price11.Parent = G.Purchase11

G.UIGradient36 = Instance.new("UIGradient")
G.UIGradient36.Name = "UIGradient"
G.UIGradient36.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient36.Rotation = -90
G.UIGradient36.Offset = Vector2.new(0,0)
G.UIGradient36.Parent = G.Price11

G.UIStroke106 = Instance.new("UIStroke")
G.UIStroke106.Name = "UIStroke"
G.UIStroke106.Thickness = 0.931838
G.UIStroke106.Parent = G.Price11

G.UICorner12 = Instance.new("UICorner")
G.UICorner12.Name = "UICorner"
G.UICorner12.CornerRadius = UDim.new(1,0)
G.UICorner12.Parent = G.Purchase11

G.UIGradient37 = Instance.new("UIGradient")
G.UIGradient37.Name = "UIGradient"
G.UIGradient37.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient37.Rotation = -90
G.UIGradient37.Offset = Vector2.new(0,0)
G.UIGradient37.Parent = G.Purchase11

G.UIScale18 = Instance.new("UIScale")
G.UIScale18.Name = "UIScale"
G.UIScale18.Parent = G.Purchase11

G.UIStroke107 = Instance.new("UIStroke")
G.UIStroke107.Name = "UIStroke"
G.UIStroke107.Thickness = 1.1648
G.UIStroke107.Parent = G.Purchase11

G.Thumbnail21 = Instance.new("ImageLabel")
G.Thumbnail21.Name = "Thumbnail"
G.Thumbnail21.Size = UDim2.new(0.48234,0,1.2575,0)
G.Thumbnail21.Position = UDim2.new(0.42096,0,0.450994,0)
G.Thumbnail21.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail21.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail21.BackgroundTransparency = 1
G.Thumbnail21.BorderSizePixel = 0
G.Thumbnail21.Image = "rbxassetid://136171183438389"
G.Thumbnail21.ScaleType = Enum.ScaleType.Fit
G.Thumbnail21.ZIndex = 4
G.Thumbnail21.Parent = G.COM_5266164701015966145

G.Unavailable37 = Instance.new("TextLabel")
G.Unavailable37.Name = "Unavailable"
G.Unavailable37.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable37.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable37.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable37.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable37.BackgroundTransparency = 1
G.Unavailable37.BorderSizePixel = 0
G.Unavailable37.Text = "Unavailable"
G.Unavailable37.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable37.TextSize = 14
G.Unavailable37.Font = Enum.Font.FredokaOne
G.Unavailable37.TextWrapped = true
G.Unavailable37.TextScaled = true
G.Unavailable37.Visible = false
G.Unavailable37.Parent = G.Thumbnail21

G.UIStroke108 = Instance.new("UIStroke")
G.UIStroke108.Name = "UIStroke"
G.UIStroke108.Thickness = 2
G.UIStroke108.Parent = G.Unavailable37

G.Title11 = Instance.new("TextLabel")
G.Title11.Name = "Title"
G.Title11.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title11.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title11.AnchorPoint = Vector2.new(0.5,0)
G.Title11.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title11.BackgroundTransparency = 1
G.Title11.BorderSizePixel = 0
G.Title11.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title11.TextColor3 = Color3.fromRGB(0,13,76)
G.Title11.TextSize = 29
G.Title11.Font = Enum.Font.Arcade
G.Title11.TextWrapped = true
G.Title11.TextScaled = true
G.Title11.RichText = true
G.Title11.Visible = false
G.Title11.AutomaticSize = Enum.AutomaticSize.X
G.Title11.Parent = G.COM_5266164701015966145

G.UIGradient38 = Instance.new("UIGradient")
G.UIGradient38.Name = "UIGradient"
G.UIGradient38.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient38.Rotation = -90
G.UIGradient38.Offset = Vector2.new(0,0)
G.UIGradient38.Parent = G.Title11

G.UIStroke109 = Instance.new("UIStroke")
G.UIStroke109.Name = "UIStroke"
G.UIStroke109.Color = Color3.fromRGB(255,255,255)
G.UIStroke109.Thickness = 2
G.UIStroke109.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke109.Parent = G.Title11

G.UIListLayout7 = Instance.new("UIListLayout")
G.UIListLayout7.Name = "UIListLayout"
G.UIListLayout7.Padding = UDim.new(0.019,0)
G.UIListLayout7.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout7.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout7.Wraps = false
G.UIListLayout7.Parent = G.Special6

G.Special7 = Instance.new("Frame")
G.Special7.Name = "Special"
G.Special7.Size = UDim2.new(1.10498,0,0.439953,0)
G.Special7.Position = UDim2.new(0,0,-0.143337,0)
G.Special7.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special7.BackgroundTransparency = 1
G.Special7.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special7.BorderSizePixel = 0
G.Special7.Visible = false
G.Special7.LayoutOrder = -13
G.Special7.Parent = G.ScrollingFrame

G.COM_6148819382656172482 = Instance.new("Frame")
G.COM_6148819382656172482.Name = "COM-6148819382656172482"
G.COM_6148819382656172482.Size = UDim2.new(0.894307,0,0.931111,0)
G.COM_6148819382656172482.Position = UDim2.new(-5.79236e-08,0,0,0)
G.COM_6148819382656172482.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_6148819382656172482.BackgroundTransparency = 1
G.COM_6148819382656172482.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_6148819382656172482.BorderSizePixel = 0
G.COM_6148819382656172482.Parent = G.Special7

G.BG12 = Instance.new("Frame")
G.BG12.Name = "BG"
G.BG12.Size = UDim2.new(1,0,1,0)
G.BG12.Position = UDim2.new(0.5,0,0.5,0)
G.BG12.AnchorPoint = Vector2.new(0.5,0.5)
G.BG12.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG12.BackgroundTransparency = 1
G.BG12.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG12.BorderSizePixel = 0
G.BG12.ZIndex = -1
G.BG12.Parent = G.COM_6148819382656172482

G.Dropshadow11 = Instance.new("Frame")
G.Dropshadow11.Name = "Dropshadow"
G.Dropshadow11.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow11.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow11.AnchorPoint = Vector2.new(0,1)
G.Dropshadow11.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow11.BackgroundTransparency = 0.5
G.Dropshadow11.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow11.BorderSizePixel = 0
G.Dropshadow11.ZIndex = -2
G.Dropshadow11.Parent = G.BG12

G.UIStroke110 = Instance.new("UIStroke")
G.UIStroke110.Name = "UIStroke"
G.UIStroke110.Thickness = 2.79551
G.UIStroke110.Transparency = 1
G.UIStroke110.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke110.Parent = G.Dropshadow11

G.Frame12 = Instance.new("Frame")
G.Frame12.Name = "Frame"
G.Frame12.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame12.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame12.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame12.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame12.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame12.BorderSizePixel = 0
G.Frame12.ZIndex = -1
G.Frame12.Parent = G.BG12

G.Pattern11 = Instance.new("ImageLabel")
G.Pattern11.Name = "Pattern"
G.Pattern11.Size = UDim2.new(0.635249,0,1,0)
G.Pattern11.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern11.BackgroundTransparency = 1
G.Pattern11.BorderSizePixel = 0
G.Pattern11.Image = "rbxassetid://90267535887894"
G.Pattern11.ZIndex = -1
G.Pattern11.Parent = G.Frame12

G.UIStroke111 = Instance.new("UIStroke")
G.UIStroke111.Name = "UIStroke"
G.UIStroke111.Thickness = 1.86368
G.UIStroke111.Parent = G.Pattern11

G.UIStroke112 = Instance.new("UIStroke")
G.UIStroke112.Name = "UIStroke"
G.UIStroke112.Thickness = 1.86368
G.UIStroke112.Parent = G.Frame12

G.Highlight11 = Instance.new("Frame")
G.Highlight11.Name = "Highlight"
G.Highlight11.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight11.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight11.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight11.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight11.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight11.BorderSizePixel = 0
G.Highlight11.Visible = false
G.Highlight11.ZIndex = -2
G.Highlight11.Parent = G.BG12

G.UIStroke113 = Instance.new("UIStroke")
G.UIStroke113.Name = "UIStroke"
G.UIStroke113.Color = Color3.fromRGB(255,242,0)
G.UIStroke113.Thickness = 2.79551
G.UIStroke113.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke113.Parent = G.Highlight11

G.CanvasGroup6 = Instance.new("CanvasGroup")
G.CanvasGroup6.Name = "CanvasGroup"
G.CanvasGroup6.Size = UDim2.new(1,0,1,0)
G.CanvasGroup6.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup6.BackgroundTransparency = 1
G.CanvasGroup6.Parent = G.COM_6148819382656172482

G.Thumbnail22 = Instance.new("ImageLabel")
G.Thumbnail22.Name = "Thumbnail"
G.Thumbnail22.Size = UDim2.new(0.401091,0,0.993744,0)
G.Thumbnail22.Position = UDim2.new(0.0961707,0,0.538139,0)
G.Thumbnail22.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail22.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail22.BackgroundTransparency = 1
G.Thumbnail22.BorderSizePixel = 0
G.Thumbnail22.Image = "rbxassetid://109008554120145"
G.Thumbnail22.ScaleType = Enum.ScaleType.Fit
G.Thumbnail22.ZIndex = 0
G.Thumbnail22.Rotation = -11
G.Thumbnail22.Parent = G.CanvasGroup6

G.Unavailable38 = Instance.new("TextLabel")
G.Unavailable38.Name = "Unavailable"
G.Unavailable38.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable38.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable38.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable38.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable38.BackgroundTransparency = 1
G.Unavailable38.BorderSizePixel = 0
G.Unavailable38.Text = "Unavailable"
G.Unavailable38.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable38.TextSize = 14
G.Unavailable38.Font = Enum.Font.FredokaOne
G.Unavailable38.TextWrapped = true
G.Unavailable38.TextScaled = true
G.Unavailable38.Visible = false
G.Unavailable38.Parent = G.Thumbnail22

G.UIStroke114 = Instance.new("UIStroke")
G.UIStroke114.Name = "UIStroke"
G.UIStroke114.Thickness = 2
G.UIStroke114.Parent = G.Unavailable38

G.Thumbnail23 = Instance.new("ImageLabel")
G.Thumbnail23.Name = "Thumbnail"
G.Thumbnail23.Size = UDim2.new(0.401091,0,1.04567,0)
G.Thumbnail23.Position = UDim2.new(0.17826,0,0.412124,0)
G.Thumbnail23.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail23.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail23.BackgroundTransparency = 1
G.Thumbnail23.BorderSizePixel = 0
G.Thumbnail23.Image = "rbxassetid://128504815212707"
G.Thumbnail23.ScaleType = Enum.ScaleType.Fit
G.Thumbnail23.ZIndex = -1
G.Thumbnail23.Rotation = 16
G.Thumbnail23.Parent = G.CanvasGroup6

G.Unavailable39 = Instance.new("TextLabel")
G.Unavailable39.Name = "Unavailable"
G.Unavailable39.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable39.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable39.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable39.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable39.BackgroundTransparency = 1
G.Unavailable39.BorderSizePixel = 0
G.Unavailable39.Text = "Unavailable"
G.Unavailable39.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable39.TextSize = 14
G.Unavailable39.Font = Enum.Font.FredokaOne
G.Unavailable39.TextWrapped = true
G.Unavailable39.TextScaled = true
G.Unavailable39.Visible = false
G.Unavailable39.Parent = G.Thumbnail23

G.UIStroke115 = Instance.new("UIStroke")
G.UIStroke115.Name = "UIStroke"
G.UIStroke115.Thickness = 2
G.UIStroke115.Parent = G.Unavailable39

G.Thumbnail24 = Instance.new("ImageLabel")
G.Thumbnail24.Name = "Thumbnail"
G.Thumbnail24.Size = UDim2.new(0.334554,0,0.967788,0)
G.Thumbnail24.Position = UDim2.new(0.35793,0,0.497652,0)
G.Thumbnail24.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail24.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail24.BackgroundTransparency = 1
G.Thumbnail24.BorderSizePixel = 0
G.Thumbnail24.Image = "rbxassetid://136054611134558"
G.Thumbnail24.ScaleType = Enum.ScaleType.Fit
G.Thumbnail24.ZIndex = 0
G.Thumbnail24.Parent = G.CanvasGroup6

G.Unavailable40 = Instance.new("TextLabel")
G.Unavailable40.Name = "Unavailable"
G.Unavailable40.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable40.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable40.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable40.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable40.BackgroundTransparency = 1
G.Unavailable40.BorderSizePixel = 0
G.Unavailable40.Text = "Unavailable"
G.Unavailable40.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable40.TextSize = 14
G.Unavailable40.Font = Enum.Font.FredokaOne
G.Unavailable40.TextWrapped = true
G.Unavailable40.TextScaled = true
G.Unavailable40.Visible = false
G.Unavailable40.Parent = G.Thumbnail24

G.UIStroke116 = Instance.new("UIStroke")
G.UIStroke116.Name = "UIStroke"
G.UIStroke116.Thickness = 2
G.UIStroke116.Parent = G.Unavailable40

G.DisplayTitle9 = Instance.new("TextLabel")
G.DisplayTitle9.Name = "DisplayTitle"
G.DisplayTitle9.Size = UDim2.new(0.28831,0,0.367128,0)
G.DisplayTitle9.Position = UDim2.new(0.814632,0,0.191717,0)
G.DisplayTitle9.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle9.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle9.BackgroundTransparency = 1
G.DisplayTitle9.BorderSizePixel = 0
G.DisplayTitle9.Text = "Cosmo 12\" Deluxe Plush (Pre-Order)"
G.DisplayTitle9.TextColor3 = Color3.fromRGB(0,0,0)
G.DisplayTitle9.TextSize = 29
G.DisplayTitle9.Font = Enum.Font.Arcade
G.DisplayTitle9.TextWrapped = true
G.DisplayTitle9.TextScaled = true
G.DisplayTitle9.RichText = true
G.DisplayTitle9.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle9.Parent = G.COM_6148819382656172482

G.UIAspectRatioConstraint11 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint11.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint11.AspectRatio = 2.66
G.UIAspectRatioConstraint11.Parent = G.DisplayTitle9

G.UIGradient39 = Instance.new("UIGradient")
G.UIGradient39.Name = "UIGradient"
G.UIGradient39.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient39.Rotation = -90
G.UIGradient39.Offset = Vector2.new(0,0)
G.UIGradient39.Enabled = false
G.UIGradient39.Parent = G.DisplayTitle9

G.UIStroke117 = Instance.new("UIStroke")
G.UIStroke117.Name = "UIStroke"
G.UIStroke117.Color = Color3.fromRGB(255,255,255)
G.UIStroke117.Thickness = 0.931838
G.UIStroke117.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke117.Parent = G.DisplayTitle9

G.Item12 = Instance.new("ImageLabel")
G.Item12.Name = "Item"
G.Item12.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item12.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item12.AnchorPoint = Vector2.new(0.5,0.5)
G.Item12.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item12.BackgroundTransparency = 1
G.Item12.BorderSizePixel = 0
G.Item12.Image = "rbxassetid://94959635148921"
G.Item12.ImageRectOffset = Vector2.new(15,15)
G.Item12.ImageRectSize = Vector2.new(270,270)
G.Item12.ScaleType = Enum.ScaleType.Fit
G.Item12.Visible = false
G.Item12.ZIndex = -1
G.Item12.Parent = G.COM_6148819382656172482

G.Unavailable41 = Instance.new("TextLabel")
G.Unavailable41.Name = "Unavailable"
G.Unavailable41.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable41.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable41.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable41.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable41.BackgroundTransparency = 1
G.Unavailable41.BorderSizePixel = 0
G.Unavailable41.Text = "Unavailable"
G.Unavailable41.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable41.TextSize = 14
G.Unavailable41.Font = Enum.Font.FredokaOne
G.Unavailable41.TextWrapped = true
G.Unavailable41.TextScaled = true
G.Unavailable41.Visible = false
G.Unavailable41.Parent = G.Item12

G.UIStroke118 = Instance.new("UIStroke")
G.UIStroke118.Name = "UIStroke"
G.UIStroke118.Thickness = 2
G.UIStroke118.Parent = G.Unavailable41

G.Purchase12 = Instance.new("ImageButton")
G.Purchase12.Name = "Purchase"
G.Purchase12.Size = UDim2.new(0.299855,0,0.201102,0)
G.Purchase12.Position = UDim2.new(0.814697,0,0.786462,0)
G.Purchase12.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase12.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase12.BorderSizePixel = 0
G.Purchase12.ScaleType = Enum.ScaleType.Fit
G.Purchase12.AutoButtonColor = false
G.Purchase12.Parent = G.COM_6148819382656172482

G.Price12 = Instance.new("TextLabel")
G.Price12.Name = "Price"
G.Price12.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price12.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price12.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price12.BackgroundTransparency = 1
G.Price12.BorderSizePixel = 0
G.Price12.Text = "$19.99"
G.Price12.TextColor3 = Color3.fromRGB(255,255,255)
G.Price12.TextSize = 14
G.Price12.Font = Enum.Font.Arcade
G.Price12.TextWrapped = true
G.Price12.TextScaled = true
G.Price12.RichText = true
G.Price12.AutomaticSize = Enum.AutomaticSize.X
G.Price12.Parent = G.Purchase12

G.UIGradient40 = Instance.new("UIGradient")
G.UIGradient40.Name = "UIGradient"
G.UIGradient40.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient40.Rotation = -90
G.UIGradient40.Offset = Vector2.new(0,0)
G.UIGradient40.Parent = G.Price12

G.UIStroke119 = Instance.new("UIStroke")
G.UIStroke119.Name = "UIStroke"
G.UIStroke119.Thickness = 0.931838
G.UIStroke119.Parent = G.Price12

G.UICorner13 = Instance.new("UICorner")
G.UICorner13.Name = "UICorner"
G.UICorner13.CornerRadius = UDim.new(1,0)
G.UICorner13.Parent = G.Purchase12

G.UIGradient41 = Instance.new("UIGradient")
G.UIGradient41.Name = "UIGradient"
G.UIGradient41.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient41.Rotation = -90
G.UIGradient41.Offset = Vector2.new(0,0)
G.UIGradient41.Parent = G.Purchase12

G.UIScale19 = Instance.new("UIScale")
G.UIScale19.Name = "UIScale"
G.UIScale19.Parent = G.Purchase12

G.UIStroke120 = Instance.new("UIStroke")
G.UIStroke120.Name = "UIStroke"
G.UIStroke120.Thickness = 1.1648
G.UIStroke120.Parent = G.Purchase12

G.Thumbnail25 = Instance.new("ImageLabel")
G.Thumbnail25.Name = "Thumbnail"
G.Thumbnail25.Size = UDim2.new(0.48234,0,1.34851,0)
G.Thumbnail25.Position = UDim2.new(0.551555,0,0.39973,0)
G.Thumbnail25.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail25.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail25.BackgroundTransparency = 1
G.Thumbnail25.BorderSizePixel = 0
G.Thumbnail25.Image = "rbxassetid://78833012003561"
G.Thumbnail25.ScaleType = Enum.ScaleType.Fit
G.Thumbnail25.ZIndex = 2
G.Thumbnail25.Parent = G.COM_6148819382656172482

G.Unavailable42 = Instance.new("TextLabel")
G.Unavailable42.Name = "Unavailable"
G.Unavailable42.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable42.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable42.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable42.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable42.BackgroundTransparency = 1
G.Unavailable42.BorderSizePixel = 0
G.Unavailable42.Text = "Unavailable"
G.Unavailable42.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable42.TextSize = 14
G.Unavailable42.Font = Enum.Font.FredokaOne
G.Unavailable42.TextWrapped = true
G.Unavailable42.TextScaled = true
G.Unavailable42.Visible = false
G.Unavailable42.Parent = G.Thumbnail25

G.UIStroke121 = Instance.new("UIStroke")
G.UIStroke121.Name = "UIStroke"
G.UIStroke121.Thickness = 2
G.UIStroke121.Parent = G.Unavailable42

G.Title12 = Instance.new("TextLabel")
G.Title12.Name = "Title"
G.Title12.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title12.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title12.AnchorPoint = Vector2.new(0.5,0)
G.Title12.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title12.BackgroundTransparency = 1
G.Title12.BorderSizePixel = 0
G.Title12.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title12.TextColor3 = Color3.fromRGB(0,13,76)
G.Title12.TextSize = 29
G.Title12.Font = Enum.Font.Arcade
G.Title12.TextWrapped = true
G.Title12.TextScaled = true
G.Title12.RichText = true
G.Title12.Visible = false
G.Title12.AutomaticSize = Enum.AutomaticSize.X
G.Title12.Parent = G.COM_6148819382656172482

G.UIGradient42 = Instance.new("UIGradient")
G.UIGradient42.Name = "UIGradient"
G.UIGradient42.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient42.Rotation = -90
G.UIGradient42.Offset = Vector2.new(0,0)
G.UIGradient42.Parent = G.Title12

G.UIStroke122 = Instance.new("UIStroke")
G.UIStroke122.Name = "UIStroke"
G.UIStroke122.Color = Color3.fromRGB(255,255,255)
G.UIStroke122.Thickness = 2
G.UIStroke122.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke122.Parent = G.Title12

G.UIListLayout8 = Instance.new("UIListLayout")
G.UIListLayout8.Name = "UIListLayout"
G.UIListLayout8.Padding = UDim.new(0.019,0)
G.UIListLayout8.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout8.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout8.Wraps = false
G.UIListLayout8.Parent = G.Special7

G.Special8 = Instance.new("Frame")
G.Special8.Name = "Special"
G.Special8.Size = UDim2.new(1.10498,0,0.439953,0)
G.Special8.Position = UDim2.new(0,0,-0.143337,0)
G.Special8.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special8.BackgroundTransparency = 1
G.Special8.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special8.BorderSizePixel = 0
G.Special8.Visible = false
G.Special8.LayoutOrder = -12
G.Special8.Parent = G.ScrollingFrame

G.COM_2872958725826675138 = Instance.new("Frame")
G.COM_2872958725826675138.Name = "COM-2872958725826675138"
G.COM_2872958725826675138.Size = UDim2.new(0.437886,0,0.931112,0)
G.COM_2872958725826675138.Position = UDim2.new(-2.68658e-08,0,0,0)
G.COM_2872958725826675138.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_2872958725826675138.BackgroundTransparency = 1
G.COM_2872958725826675138.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_2872958725826675138.BorderSizePixel = 0
G.COM_2872958725826675138.LayoutOrder = -1
G.COM_2872958725826675138.Parent = G.Special8

G.BG13 = Instance.new("Frame")
G.BG13.Name = "BG"
G.BG13.Size = UDim2.new(1,0,1,0)
G.BG13.Position = UDim2.new(0.5,0,0.5,0)
G.BG13.AnchorPoint = Vector2.new(0.5,0.5)
G.BG13.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG13.BackgroundTransparency = 1
G.BG13.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG13.BorderSizePixel = 0
G.BG13.ZIndex = -1
G.BG13.Parent = G.COM_2872958725826675138

G.Dropshadow12 = Instance.new("Frame")
G.Dropshadow12.Name = "Dropshadow"
G.Dropshadow12.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow12.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow12.AnchorPoint = Vector2.new(0,1)
G.Dropshadow12.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow12.BackgroundTransparency = 0.5
G.Dropshadow12.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow12.BorderSizePixel = 0
G.Dropshadow12.ZIndex = -2
G.Dropshadow12.Parent = G.BG13

G.UIStroke123 = Instance.new("UIStroke")
G.UIStroke123.Name = "UIStroke"
G.UIStroke123.Thickness = 2.79551
G.UIStroke123.Transparency = 1
G.UIStroke123.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke123.Parent = G.Dropshadow12

G.Frame13 = Instance.new("Frame")
G.Frame13.Name = "Frame"
G.Frame13.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame13.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame13.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame13.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame13.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame13.BorderSizePixel = 0
G.Frame13.ZIndex = -1
G.Frame13.Parent = G.BG13

G.Pattern12 = Instance.new("ImageLabel")
G.Pattern12.Name = "Pattern"
G.Pattern12.Size = UDim2.new(1,0,1,0)
G.Pattern12.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern12.BackgroundTransparency = 1
G.Pattern12.BorderSizePixel = 0
G.Pattern12.Image = "rbxassetid://97609118599711"
G.Pattern12.ZIndex = -1
G.Pattern12.Parent = G.Frame13

G.UIStroke124 = Instance.new("UIStroke")
G.UIStroke124.Name = "UIStroke"
G.UIStroke124.Thickness = 1.86368
G.UIStroke124.Parent = G.Pattern12

G.UIStroke125 = Instance.new("UIStroke")
G.UIStroke125.Name = "UIStroke"
G.UIStroke125.Thickness = 1.86368
G.UIStroke125.Parent = G.Frame13

G.Highlight12 = Instance.new("Frame")
G.Highlight12.Name = "Highlight"
G.Highlight12.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight12.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight12.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight12.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight12.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight12.BorderSizePixel = 0
G.Highlight12.Visible = false
G.Highlight12.ZIndex = -2
G.Highlight12.Parent = G.BG13

G.UIStroke126 = Instance.new("UIStroke")
G.UIStroke126.Name = "UIStroke"
G.UIStroke126.Color = Color3.fromRGB(255,242,0)
G.UIStroke126.Thickness = 2.79551
G.UIStroke126.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke126.Parent = G.Highlight12

G.DisplayTitle10 = Instance.new("TextLabel")
G.DisplayTitle10.Name = "DisplayTitle"
G.DisplayTitle10.Size = UDim2.new(0.566559,0,0.435422,0)
G.DisplayTitle10.Position = UDim2.new(0.691046,0,0.15042,0)
G.DisplayTitle10.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle10.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle10.BackgroundTransparency = 1
G.DisplayTitle10.BorderSizePixel = 0
G.DisplayTitle10.Text = "Sprout & Cosmo Friendship Bracelets"
G.DisplayTitle10.TextColor3 = Color3.fromRGB(0,13,76)
G.DisplayTitle10.TextSize = 29
G.DisplayTitle10.Font = Enum.Font.Arcade
G.DisplayTitle10.TextWrapped = true
G.DisplayTitle10.TextScaled = true
G.DisplayTitle10.RichText = true
G.DisplayTitle10.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle10.Parent = G.COM_2872958725826675138

G.UIGradient43 = Instance.new("UIGradient")
G.UIGradient43.Name = "UIGradient"
G.UIGradient43.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient43.Rotation = -90
G.UIGradient43.Offset = Vector2.new(0,0)
G.UIGradient43.Parent = G.DisplayTitle10

G.UIStroke127 = Instance.new("UIStroke")
G.UIStroke127.Name = "UIStroke"
G.UIStroke127.Color = Color3.fromRGB(255,255,255)
G.UIStroke127.Thickness = 0.931838
G.UIStroke127.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke127.Parent = G.DisplayTitle10

G.Item13 = Instance.new("ImageLabel")
G.Item13.Name = "Item"
G.Item13.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item13.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item13.AnchorPoint = Vector2.new(0.5,0.5)
G.Item13.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item13.BackgroundTransparency = 1
G.Item13.BorderSizePixel = 0
G.Item13.Image = "rbxassetid://94959635148921"
G.Item13.ImageRectOffset = Vector2.new(15,15)
G.Item13.ImageRectSize = Vector2.new(270,270)
G.Item13.ScaleType = Enum.ScaleType.Fit
G.Item13.Visible = false
G.Item13.ZIndex = -1
G.Item13.Parent = G.COM_2872958725826675138

G.Unavailable43 = Instance.new("TextLabel")
G.Unavailable43.Name = "Unavailable"
G.Unavailable43.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable43.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable43.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable43.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable43.BackgroundTransparency = 1
G.Unavailable43.BorderSizePixel = 0
G.Unavailable43.Text = "Unavailable"
G.Unavailable43.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable43.TextSize = 14
G.Unavailable43.Font = Enum.Font.FredokaOne
G.Unavailable43.TextWrapped = true
G.Unavailable43.TextScaled = true
G.Unavailable43.Visible = false
G.Unavailable43.Parent = G.Item13

G.UIStroke128 = Instance.new("UIStroke")
G.UIStroke128.Name = "UIStroke"
G.UIStroke128.Thickness = 2
G.UIStroke128.Parent = G.Unavailable43

G.New6 = Instance.new("ImageLabel")
G.New6.Name = "New"
G.New6.Size = UDim2.new(0.322123,0,0.355513,0)
G.New6.Position = UDim2.new(0.924293,0,0.0284983,0)
G.New6.AnchorPoint = Vector2.new(0.5,0.5)
G.New6.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New6.BackgroundTransparency = 1
G.New6.BorderSizePixel = 0
G.New6.Image = "rbxassetid://96728750855907"
G.New6.ScaleType = Enum.ScaleType.Fit
G.New6.Visible = false
G.New6.ZIndex = -1
G.New6.Parent = G.COM_2872958725826675138

G.UIScale20 = Instance.new("UIScale")
G.UIScale20.Name = "UIScale"
G.UIScale20.Parent = G.New6

G.Purchase13 = Instance.new("ImageButton")
G.Purchase13.Name = "Purchase"
G.Purchase13.Size = UDim2.new(0.551281,0,0.201102,0)
G.Purchase13.Position = UDim2.new(0.681037,0,0.790057,0)
G.Purchase13.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase13.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase13.BorderSizePixel = 0
G.Purchase13.ScaleType = Enum.ScaleType.Fit
G.Purchase13.AutoButtonColor = false
G.Purchase13.Parent = G.COM_2872958725826675138

G.Price13 = Instance.new("TextLabel")
G.Price13.Name = "Price"
G.Price13.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price13.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price13.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price13.BackgroundTransparency = 1
G.Price13.BorderSizePixel = 0
G.Price13.Text = "$19.99"
G.Price13.TextColor3 = Color3.fromRGB(255,255,255)
G.Price13.TextSize = 14
G.Price13.Font = Enum.Font.Arcade
G.Price13.TextWrapped = true
G.Price13.TextScaled = true
G.Price13.RichText = true
G.Price13.AutomaticSize = Enum.AutomaticSize.X
G.Price13.Parent = G.Purchase13

G.UIGradient44 = Instance.new("UIGradient")
G.UIGradient44.Name = "UIGradient"
G.UIGradient44.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient44.Rotation = -90
G.UIGradient44.Offset = Vector2.new(0,0)
G.UIGradient44.Parent = G.Price13

G.UIStroke129 = Instance.new("UIStroke")
G.UIStroke129.Name = "UIStroke"
G.UIStroke129.Thickness = 0.931838
G.UIStroke129.Parent = G.Price13

G.UICorner14 = Instance.new("UICorner")
G.UICorner14.Name = "UICorner"
G.UICorner14.CornerRadius = UDim.new(1,0)
G.UICorner14.Parent = G.Purchase13

G.UIGradient45 = Instance.new("UIGradient")
G.UIGradient45.Name = "UIGradient"
G.UIGradient45.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient45.Rotation = -90
G.UIGradient45.Offset = Vector2.new(0,0)
G.UIGradient45.Parent = G.Purchase13

G.UIScale21 = Instance.new("UIScale")
G.UIScale21.Name = "UIScale"
G.UIScale21.Parent = G.Purchase13

G.UIStroke130 = Instance.new("UIStroke")
G.UIStroke130.Name = "UIStroke"
G.UIStroke130.Thickness = 1.1648
G.UIStroke130.Parent = G.Purchase13

G.Thumbnail26 = Instance.new("ImageLabel")
G.Thumbnail26.Name = "Thumbnail"
G.Thumbnail26.Size = UDim2.new(0.593809,0,1.5481,0)
G.Thumbnail26.Position = UDim2.new(0.234728,0,0.432111,0)
G.Thumbnail26.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail26.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail26.BackgroundTransparency = 1
G.Thumbnail26.BorderSizePixel = 0
G.Thumbnail26.Image = "rbxassetid://100191545370159"
G.Thumbnail26.ScaleType = Enum.ScaleType.Fit
G.Thumbnail26.ZIndex = -1
G.Thumbnail26.Parent = G.COM_2872958725826675138

G.Unavailable44 = Instance.new("TextLabel")
G.Unavailable44.Name = "Unavailable"
G.Unavailable44.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable44.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable44.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable44.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable44.BackgroundTransparency = 1
G.Unavailable44.BorderSizePixel = 0
G.Unavailable44.Text = "Unavailable"
G.Unavailable44.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable44.TextSize = 14
G.Unavailable44.Font = Enum.Font.FredokaOne
G.Unavailable44.TextWrapped = true
G.Unavailable44.TextScaled = true
G.Unavailable44.Visible = false
G.Unavailable44.Parent = G.Thumbnail26

G.UIStroke131 = Instance.new("UIStroke")
G.UIStroke131.Name = "UIStroke"
G.UIStroke131.Thickness = 2
G.UIStroke131.Parent = G.Unavailable44

G.Title13 = Instance.new("TextLabel")
G.Title13.Name = "Title"
G.Title13.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title13.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title13.AnchorPoint = Vector2.new(0.5,0)
G.Title13.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title13.BackgroundTransparency = 1
G.Title13.BorderSizePixel = 0
G.Title13.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title13.TextColor3 = Color3.fromRGB(0,13,76)
G.Title13.TextSize = 29
G.Title13.Font = Enum.Font.Arcade
G.Title13.TextWrapped = true
G.Title13.TextScaled = true
G.Title13.RichText = true
G.Title13.Visible = false
G.Title13.AutomaticSize = Enum.AutomaticSize.X
G.Title13.Parent = G.COM_2872958725826675138

G.UIGradient46 = Instance.new("UIGradient")
G.UIGradient46.Name = "UIGradient"
G.UIGradient46.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient46.Rotation = -90
G.UIGradient46.Offset = Vector2.new(0,0)
G.UIGradient46.Parent = G.Title13

G.UIStroke132 = Instance.new("UIStroke")
G.UIStroke132.Name = "UIStroke"
G.UIStroke132.Color = Color3.fromRGB(255,255,255)
G.UIStroke132.Thickness = 2
G.UIStroke132.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke132.Parent = G.Title13

G.COM_3505872803146629560 = Instance.new("Frame")
G.COM_3505872803146629560.Name = "COM-3505872803146629560"
G.COM_3505872803146629560.Size = UDim2.new(0.437886,0,0.931112,0)
G.COM_3505872803146629560.Position = UDim2.new(-2.68658e-08,0,0,0)
G.COM_3505872803146629560.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_3505872803146629560.BackgroundTransparency = 1
G.COM_3505872803146629560.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_3505872803146629560.BorderSizePixel = 0
G.COM_3505872803146629560.Parent = G.Special8

G.BG14 = Instance.new("Frame")
G.BG14.Name = "BG"
G.BG14.Size = UDim2.new(1,0,1,0)
G.BG14.Position = UDim2.new(0.5,0,0.5,0)
G.BG14.AnchorPoint = Vector2.new(0.5,0.5)
G.BG14.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG14.BackgroundTransparency = 1
G.BG14.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG14.BorderSizePixel = 0
G.BG14.ZIndex = -1
G.BG14.Parent = G.COM_3505872803146629560

G.Dropshadow13 = Instance.new("Frame")
G.Dropshadow13.Name = "Dropshadow"
G.Dropshadow13.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow13.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow13.AnchorPoint = Vector2.new(0,1)
G.Dropshadow13.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow13.BackgroundTransparency = 0.5
G.Dropshadow13.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow13.BorderSizePixel = 0
G.Dropshadow13.ZIndex = -2
G.Dropshadow13.Parent = G.BG14

G.UIStroke133 = Instance.new("UIStroke")
G.UIStroke133.Name = "UIStroke"
G.UIStroke133.Thickness = 2.79551
G.UIStroke133.Transparency = 1
G.UIStroke133.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke133.Parent = G.Dropshadow13

G.Frame14 = Instance.new("Frame")
G.Frame14.Name = "Frame"
G.Frame14.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame14.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame14.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame14.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame14.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame14.BorderSizePixel = 0
G.Frame14.ZIndex = -1
G.Frame14.Parent = G.BG14

G.Pattern13 = Instance.new("ImageLabel")
G.Pattern13.Name = "Pattern"
G.Pattern13.Size = UDim2.new(1,0,1,0)
G.Pattern13.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern13.BackgroundTransparency = 1
G.Pattern13.BorderSizePixel = 0
G.Pattern13.Image = "rbxassetid://106168511877087"
G.Pattern13.ZIndex = -1
G.Pattern13.Parent = G.Frame14

G.UIStroke134 = Instance.new("UIStroke")
G.UIStroke134.Name = "UIStroke"
G.UIStroke134.Thickness = 1.86368
G.UIStroke134.Parent = G.Pattern13

G.UIStroke135 = Instance.new("UIStroke")
G.UIStroke135.Name = "UIStroke"
G.UIStroke135.Thickness = 1.86368
G.UIStroke135.Parent = G.Frame14

G.Highlight13 = Instance.new("Frame")
G.Highlight13.Name = "Highlight"
G.Highlight13.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight13.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight13.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight13.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight13.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight13.BorderSizePixel = 0
G.Highlight13.Visible = false
G.Highlight13.ZIndex = -2
G.Highlight13.Parent = G.BG14

G.UIStroke136 = Instance.new("UIStroke")
G.UIStroke136.Name = "UIStroke"
G.UIStroke136.Color = Color3.fromRGB(255,242,0)
G.UIStroke136.Thickness = 2.79551
G.UIStroke136.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke136.Parent = G.Highlight13

G.DisplayTitle11 = Instance.new("TextLabel")
G.DisplayTitle11.Name = "DisplayTitle"
G.DisplayTitle11.Size = UDim2.new(0.566559,0,0.435422,0)
G.DisplayTitle11.Position = UDim2.new(0.691046,0,0.15042,0)
G.DisplayTitle11.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle11.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle11.BackgroundTransparency = 1
G.DisplayTitle11.BorderSizePixel = 0
G.DisplayTitle11.Text = "Cosmo Tee"
G.DisplayTitle11.TextColor3 = Color3.fromRGB(0,13,76)
G.DisplayTitle11.TextSize = 29
G.DisplayTitle11.Font = Enum.Font.Arcade
G.DisplayTitle11.TextWrapped = true
G.DisplayTitle11.TextScaled = true
G.DisplayTitle11.RichText = true
G.DisplayTitle11.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle11.Parent = G.COM_3505872803146629560

G.UIGradient47 = Instance.new("UIGradient")
G.UIGradient47.Name = "UIGradient"
G.UIGradient47.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient47.Rotation = -90
G.UIGradient47.Offset = Vector2.new(0,0)
G.UIGradient47.Parent = G.DisplayTitle11

G.UIStroke137 = Instance.new("UIStroke")
G.UIStroke137.Name = "UIStroke"
G.UIStroke137.Color = Color3.fromRGB(255,255,255)
G.UIStroke137.Thickness = 0.931838
G.UIStroke137.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke137.Parent = G.DisplayTitle11

G.Item14 = Instance.new("ImageLabel")
G.Item14.Name = "Item"
G.Item14.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item14.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item14.AnchorPoint = Vector2.new(0.5,0.5)
G.Item14.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item14.BackgroundTransparency = 1
G.Item14.BorderSizePixel = 0
G.Item14.Image = "rbxassetid://94959635148921"
G.Item14.ImageRectOffset = Vector2.new(15,15)
G.Item14.ImageRectSize = Vector2.new(270,270)
G.Item14.ScaleType = Enum.ScaleType.Fit
G.Item14.Visible = false
G.Item14.ZIndex = -1
G.Item14.Parent = G.COM_3505872803146629560

G.Unavailable45 = Instance.new("TextLabel")
G.Unavailable45.Name = "Unavailable"
G.Unavailable45.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable45.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable45.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable45.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable45.BackgroundTransparency = 1
G.Unavailable45.BorderSizePixel = 0
G.Unavailable45.Text = "Unavailable"
G.Unavailable45.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable45.TextSize = 14
G.Unavailable45.Font = Enum.Font.FredokaOne
G.Unavailable45.TextWrapped = true
G.Unavailable45.TextScaled = true
G.Unavailable45.Visible = false
G.Unavailable45.Parent = G.Item14

G.UIStroke138 = Instance.new("UIStroke")
G.UIStroke138.Name = "UIStroke"
G.UIStroke138.Thickness = 2
G.UIStroke138.Parent = G.Unavailable45

G.New7 = Instance.new("ImageLabel")
G.New7.Name = "New"
G.New7.Size = UDim2.new(0.322123,0,0.355513,0)
G.New7.Position = UDim2.new(0.924293,0,0.0284983,0)
G.New7.AnchorPoint = Vector2.new(0.5,0.5)
G.New7.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New7.BackgroundTransparency = 1
G.New7.BorderSizePixel = 0
G.New7.Image = "rbxassetid://96728750855907"
G.New7.ScaleType = Enum.ScaleType.Fit
G.New7.Visible = false
G.New7.ZIndex = -1
G.New7.Parent = G.COM_3505872803146629560

G.UIScale22 = Instance.new("UIScale")
G.UIScale22.Name = "UIScale"
G.UIScale22.Parent = G.New7

G.Purchase14 = Instance.new("ImageButton")
G.Purchase14.Name = "Purchase"
G.Purchase14.Size = UDim2.new(0.551281,0,0.201102,0)
G.Purchase14.Position = UDim2.new(0.681037,0,0.790057,0)
G.Purchase14.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase14.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase14.BorderSizePixel = 0
G.Purchase14.ScaleType = Enum.ScaleType.Fit
G.Purchase14.AutoButtonColor = false
G.Purchase14.Parent = G.COM_3505872803146629560

G.Price14 = Instance.new("TextLabel")
G.Price14.Name = "Price"
G.Price14.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price14.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price14.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price14.BackgroundTransparency = 1
G.Price14.BorderSizePixel = 0
G.Price14.Text = "$19.99"
G.Price14.TextColor3 = Color3.fromRGB(255,255,255)
G.Price14.TextSize = 14
G.Price14.Font = Enum.Font.Arcade
G.Price14.TextWrapped = true
G.Price14.TextScaled = true
G.Price14.RichText = true
G.Price14.AutomaticSize = Enum.AutomaticSize.X
G.Price14.Parent = G.Purchase14

G.UIGradient48 = Instance.new("UIGradient")
G.UIGradient48.Name = "UIGradient"
G.UIGradient48.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient48.Rotation = -90
G.UIGradient48.Offset = Vector2.new(0,0)
G.UIGradient48.Parent = G.Price14

G.UIStroke139 = Instance.new("UIStroke")
G.UIStroke139.Name = "UIStroke"
G.UIStroke139.Thickness = 0.931838
G.UIStroke139.Parent = G.Price14

G.UICorner15 = Instance.new("UICorner")
G.UICorner15.Name = "UICorner"
G.UICorner15.CornerRadius = UDim.new(1,0)
G.UICorner15.Parent = G.Purchase14

G.UIGradient49 = Instance.new("UIGradient")
G.UIGradient49.Name = "UIGradient"
G.UIGradient49.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient49.Rotation = -90
G.UIGradient49.Offset = Vector2.new(0,0)
G.UIGradient49.Parent = G.Purchase14

G.UIScale23 = Instance.new("UIScale")
G.UIScale23.Name = "UIScale"
G.UIScale23.Parent = G.Purchase14

G.UIStroke140 = Instance.new("UIStroke")
G.UIStroke140.Name = "UIStroke"
G.UIStroke140.Thickness = 1.1648
G.UIStroke140.Parent = G.Purchase14

G.Thumbnail27 = Instance.new("ImageLabel")
G.Thumbnail27.Name = "Thumbnail"
G.Thumbnail27.Size = UDim2.new(0.593809,0,1.5481,0)
G.Thumbnail27.Position = UDim2.new(0.251161,0,0.432111,0)
G.Thumbnail27.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail27.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail27.BackgroundTransparency = 1
G.Thumbnail27.BorderSizePixel = 0
G.Thumbnail27.Image = "rbxassetid://116679125443674"
G.Thumbnail27.ScaleType = Enum.ScaleType.Fit
G.Thumbnail27.ZIndex = -1
G.Thumbnail27.Parent = G.COM_3505872803146629560

G.Unavailable46 = Instance.new("TextLabel")
G.Unavailable46.Name = "Unavailable"
G.Unavailable46.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable46.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable46.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable46.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable46.BackgroundTransparency = 1
G.Unavailable46.BorderSizePixel = 0
G.Unavailable46.Text = "Unavailable"
G.Unavailable46.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable46.TextSize = 14
G.Unavailable46.Font = Enum.Font.FredokaOne
G.Unavailable46.TextWrapped = true
G.Unavailable46.TextScaled = true
G.Unavailable46.Visible = false
G.Unavailable46.Parent = G.Thumbnail27

G.UIStroke141 = Instance.new("UIStroke")
G.UIStroke141.Name = "UIStroke"
G.UIStroke141.Thickness = 2
G.UIStroke141.Parent = G.Unavailable46

G.Title14 = Instance.new("TextLabel")
G.Title14.Name = "Title"
G.Title14.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title14.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title14.AnchorPoint = Vector2.new(0.5,0)
G.Title14.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title14.BackgroundTransparency = 1
G.Title14.BorderSizePixel = 0
G.Title14.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title14.TextColor3 = Color3.fromRGB(0,13,76)
G.Title14.TextSize = 29
G.Title14.Font = Enum.Font.Arcade
G.Title14.TextWrapped = true
G.Title14.TextScaled = true
G.Title14.RichText = true
G.Title14.Visible = false
G.Title14.AutomaticSize = Enum.AutomaticSize.X
G.Title14.Parent = G.COM_3505872803146629560

G.UIGradient50 = Instance.new("UIGradient")
G.UIGradient50.Name = "UIGradient"
G.UIGradient50.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient50.Rotation = -90
G.UIGradient50.Offset = Vector2.new(0,0)
G.UIGradient50.Parent = G.Title14

G.UIStroke142 = Instance.new("UIStroke")
G.UIStroke142.Name = "UIStroke"
G.UIStroke142.Color = Color3.fromRGB(255,255,255)
G.UIStroke142.Thickness = 2
G.UIStroke142.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke142.Parent = G.Title14

G.UIListLayout9 = Instance.new("UIListLayout")
G.UIListLayout9.Name = "UIListLayout"
G.UIListLayout9.Padding = UDim.new(0.019,0)
G.UIListLayout9.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout9.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout9.Wraps = false
G.UIListLayout9.Parent = G.Special8

G.Special9 = Instance.new("Frame")
G.Special9.Name = "Special"
G.Special9.Size = UDim2.new(0.728,0,0.493,0)
G.Special9.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
G.Special9.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special9.BackgroundTransparency = 1
G.Special9.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special9.BorderSizePixel = 0
G.Special9.Visible = false
G.Special9.LayoutOrder = -10
G.Special9.Parent = G.ScrollingFrame

G.COM_4763821487473951269 = Instance.new("Frame")
G.COM_4763821487473951269.Name = "COM-4763821487473951269"
G.COM_4763821487473951269.Size = UDim2.new(0.442523,0,0.944677,0)
G.COM_4763821487473951269.Position = UDim2.new(0.913307,0,0,0)
G.COM_4763821487473951269.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_4763821487473951269.BackgroundTransparency = 1
G.COM_4763821487473951269.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_4763821487473951269.BorderSizePixel = 0
G.COM_4763821487473951269.LayoutOrder = -1
G.COM_4763821487473951269.Parent = G.Special9

G.BG15 = Instance.new("Frame")
G.BG15.Name = "BG"
G.BG15.Size = UDim2.new(1,0,1,0)
G.BG15.Position = UDim2.new(0.5,0,0.5,0)
G.BG15.AnchorPoint = Vector2.new(0.5,0.5)
G.BG15.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG15.BackgroundTransparency = 1
G.BG15.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG15.BorderSizePixel = 0
G.BG15.ZIndex = -1
G.BG15.Parent = G.COM_4763821487473951269

G.Dropshadow14 = Instance.new("Frame")
G.Dropshadow14.Name = "Dropshadow"
G.Dropshadow14.Size = UDim2.new(0.947997,0,0.95376,0)
G.Dropshadow14.Position = UDim2.new(-0.00747363,0,1.01324,0)
G.Dropshadow14.AnchorPoint = Vector2.new(0,1)
G.Dropshadow14.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow14.BackgroundTransparency = 0.5
G.Dropshadow14.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow14.BorderSizePixel = 0
G.Dropshadow14.ZIndex = -2
G.Dropshadow14.Parent = G.BG15

G.UIStroke143 = Instance.new("UIStroke")
G.UIStroke143.Name = "UIStroke"
G.UIStroke143.Thickness = 2.79551
G.UIStroke143.Transparency = 1
G.UIStroke143.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke143.Parent = G.Dropshadow14

G.Frame15 = Instance.new("Frame")
G.Frame15.Name = "Frame"
G.Frame15.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame15.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame15.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame15.BackgroundColor3 = Color3.fromRGB(216,75,75)
G.Frame15.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame15.BorderSizePixel = 0
G.Frame15.ZIndex = -1
G.Frame15.Parent = G.BG15

G.Pattern14 = Instance.new("ImageLabel")
G.Pattern14.Name = "Pattern"
G.Pattern14.Size = UDim2.new(1,0,1,0)
G.Pattern14.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern14.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern14.BackgroundTransparency = 1
G.Pattern14.BorderSizePixel = 0
G.Pattern14.Image = "rbxassetid://93965194514144"
G.Pattern14.ImageColor3 = Color3.fromRGB(133,243,255)
G.Pattern14.ScaleType = Enum.ScaleType.Crop
G.Pattern14.ZIndex = -1
G.Pattern14.Parent = G.Frame15

G.UIGradient51 = Instance.new("UIGradient")
G.UIGradient51.Name = "UIGradient"
G.UIGradient51.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
G.UIGradient51.Rotation = 90
G.UIGradient51.Offset = Vector2.new(0,0)
G.UIGradient51.Parent = G.Pattern14

G.UIStroke144 = Instance.new("UIStroke")
G.UIStroke144.Name = "UIStroke"
G.UIStroke144.Thickness = 1.86368
G.UIStroke144.Parent = G.Pattern14

G.UIGradient52 = Instance.new("UIGradient")
G.UIGradient52.Name = "UIGradient"
G.UIGradient52.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient52.Rotation = 90
G.UIGradient52.Offset = Vector2.new(0,0)
G.UIGradient52.Parent = G.Frame15

G.UIStroke145 = Instance.new("UIStroke")
G.UIStroke145.Name = "UIStroke"
G.UIStroke145.Thickness = 1.86368
G.UIStroke145.Parent = G.Frame15

G.Highlight14 = Instance.new("Frame")
G.Highlight14.Name = "Highlight"
G.Highlight14.Size = UDim2.new(0.954203,0,0.95775,0)
G.Highlight14.Position = UDim2.new(0.519351,0,0.478875,0)
G.Highlight14.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight14.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight14.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight14.BorderSizePixel = 0
G.Highlight14.Visible = false
G.Highlight14.ZIndex = -2
G.Highlight14.Parent = G.BG15

G.UIStroke146 = Instance.new("UIStroke")
G.UIStroke146.Name = "UIStroke"
G.UIStroke146.Color = Color3.fromRGB(255,242,0)
G.UIStroke146.Thickness = 2.79551
G.UIStroke146.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke146.Parent = G.Highlight14

G.Item15 = Instance.new("ImageLabel")
G.Item15.Name = "Item"
G.Item15.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item15.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item15.AnchorPoint = Vector2.new(0.5,0.5)
G.Item15.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item15.BackgroundTransparency = 1
G.Item15.BorderSizePixel = 0
G.Item15.Image = "rbxassetid://94959635148921"
G.Item15.ImageRectOffset = Vector2.new(25,25)
G.Item15.ImageRectSize = Vector2.new(250,250)
G.Item15.ScaleType = Enum.ScaleType.Crop
G.Item15.Visible = false
G.Item15.ZIndex = -1
G.Item15.Parent = G.COM_4763821487473951269

G.Unavailable47 = Instance.new("TextLabel")
G.Unavailable47.Name = "Unavailable"
G.Unavailable47.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable47.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable47.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable47.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable47.BackgroundTransparency = 1
G.Unavailable47.BorderSizePixel = 0
G.Unavailable47.Text = "Unavailable"
G.Unavailable47.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable47.TextSize = 14
G.Unavailable47.Font = Enum.Font.FredokaOne
G.Unavailable47.TextWrapped = true
G.Unavailable47.TextScaled = true
G.Unavailable47.Visible = false
G.Unavailable47.Parent = G.Item15

G.UIStroke147 = Instance.new("UIStroke")
G.UIStroke147.Name = "UIStroke"
G.UIStroke147.Thickness = 2
G.UIStroke147.Parent = G.Unavailable47

G.Pixel6 = Instance.new("ImageLabel")
G.Pixel6.Name = "Pixel"
G.Pixel6.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel6.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel6.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel6.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel6.BorderSizePixel = 0
G.Pixel6.Image = "rbxassetid://94959635148921"
G.Pixel6.ImageRectOffset = Vector2.new(55,100)
G.Pixel6.ImageRectSize = Vector2.new(30,30)
G.Pixel6.ScaleType = Enum.ScaleType.Crop
G.Pixel6.Visible = false
G.Pixel6.ZIndex = 5
G.Pixel6.Parent = G.COM_4763821487473951269

G.Unavailable48 = Instance.new("TextLabel")
G.Unavailable48.Name = "Unavailable"
G.Unavailable48.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable48.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable48.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable48.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable48.BackgroundTransparency = 1
G.Unavailable48.BorderSizePixel = 0
G.Unavailable48.Text = "Unavailable"
G.Unavailable48.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable48.TextSize = 14
G.Unavailable48.Font = Enum.Font.FredokaOne
G.Unavailable48.TextWrapped = true
G.Unavailable48.TextScaled = true
G.Unavailable48.Visible = false
G.Unavailable48.Parent = G.Pixel6

G.UIStroke148 = Instance.new("UIStroke")
G.UIStroke148.Name = "UIStroke"
G.UIStroke148.Thickness = 2
G.UIStroke148.Parent = G.Unavailable48

G.Purchase15 = Instance.new("ImageButton")
G.Purchase15.Name = "Purchase"
G.Purchase15.Size = UDim2.new(0.863319,0,0.170445,0)
G.Purchase15.Position = UDim2.new(0.514166,0,0.821691,0)
G.Purchase15.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase15.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase15.BorderSizePixel = 0
G.Purchase15.ScaleType = Enum.ScaleType.Fit
G.Purchase15.AutoButtonColor = false
G.Purchase15.ZIndex = 6
G.Purchase15.Parent = G.COM_4763821487473951269

G.Price15 = Instance.new("TextLabel")
G.Price15.Name = "Price"
G.Price15.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price15.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price15.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price15.BackgroundTransparency = 1
G.Price15.BorderSizePixel = 0
G.Price15.Text = "$19.99"
G.Price15.TextColor3 = Color3.fromRGB(255,255,255)
G.Price15.TextSize = 14
G.Price15.Font = Enum.Font.Arcade
G.Price15.TextWrapped = true
G.Price15.TextScaled = true
G.Price15.RichText = true
G.Price15.AutomaticSize = Enum.AutomaticSize.X
G.Price15.Parent = G.Purchase15

G.UIGradient53 = Instance.new("UIGradient")
G.UIGradient53.Name = "UIGradient"
G.UIGradient53.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient53.Rotation = -90
G.UIGradient53.Offset = Vector2.new(0,0)
G.UIGradient53.Parent = G.Price15

G.UIStroke149 = Instance.new("UIStroke")
G.UIStroke149.Name = "UIStroke"
G.UIStroke149.Thickness = 2
G.UIStroke149.Parent = G.Price15

G.UICorner16 = Instance.new("UICorner")
G.UICorner16.Name = "UICorner"
G.UICorner16.CornerRadius = UDim.new(1,0)
G.UICorner16.Parent = G.Purchase15

G.UIGradient54 = Instance.new("UIGradient")
G.UIGradient54.Name = "UIGradient"
G.UIGradient54.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient54.Rotation = -90
G.UIGradient54.Offset = Vector2.new(0,0)
G.UIGradient54.Parent = G.Purchase15

G.UIScale24 = Instance.new("UIScale")
G.UIScale24.Name = "UIScale"
G.UIScale24.Parent = G.Purchase15

G.UIStroke150 = Instance.new("UIStroke")
G.UIStroke150.Name = "UIStroke"
G.UIStroke150.Thickness = 2.5
G.UIStroke150.Parent = G.Purchase15

G.Thumbnail28 = Instance.new("ImageLabel")
G.Thumbnail28.Name = "Thumbnail"
G.Thumbnail28.Size = UDim2.new(1.15659,0,0.857211,0)
G.Thumbnail28.Position = UDim2.new(0.495381,0,0.470327,0)
G.Thumbnail28.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail28.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail28.BackgroundTransparency = 1
G.Thumbnail28.BorderSizePixel = 0
G.Thumbnail28.Image = "rbxassetid://132311928411797"
G.Thumbnail28.ScaleType = Enum.ScaleType.Crop
G.Thumbnail28.ZIndex = -1
G.Thumbnail28.Parent = G.COM_4763821487473951269

G.Unavailable49 = Instance.new("TextLabel")
G.Unavailable49.Name = "Unavailable"
G.Unavailable49.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable49.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable49.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable49.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable49.BackgroundTransparency = 1
G.Unavailable49.BorderSizePixel = 0
G.Unavailable49.Text = "Unavailable"
G.Unavailable49.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable49.TextSize = 14
G.Unavailable49.Font = Enum.Font.FredokaOne
G.Unavailable49.TextWrapped = true
G.Unavailable49.TextScaled = true
G.Unavailable49.Visible = false
G.Unavailable49.Parent = G.Thumbnail28

G.UIStroke151 = Instance.new("UIStroke")
G.UIStroke151.Name = "UIStroke"
G.UIStroke151.Thickness = 2
G.UIStroke151.Parent = G.Unavailable49

G.Title15 = Instance.new("TextLabel")
G.Title15.Name = "Title"
G.Title15.Size = UDim2.new(0.874784,0,0.149,0)
G.Title15.Position = UDim2.new(0.531264,0,0.0306123,0)
G.Title15.AnchorPoint = Vector2.new(0.5,0)
G.Title15.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title15.BackgroundTransparency = 1
G.Title15.BorderSizePixel = 0
G.Title15.Text = "Bobette 11" x 14" Poster"
G.Title15.TextColor3 = Color3.fromRGB(0,0,0)
G.Title15.TextSize = 29
G.Title15.Font = Enum.Font.Arcade
G.Title15.TextXAlignment = Enum.TextXAlignment.Left
G.Title15.TextYAlignment = Enum.TextYAlignment.Top
G.Title15.TextWrapped = true
G.Title15.TextScaled = true
G.Title15.RichText = true
G.Title15.Visible = false
G.Title15.AutomaticSize = Enum.AutomaticSize.X
G.Title15.Parent = G.COM_4763821487473951269

G.UITextSizeConstraint9 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint9.Name = "UITextSizeConstraint"
G.UITextSizeConstraint9.MaxTextSize = 29
G.UITextSizeConstraint9.Parent = G.Title15

G.COM_196327040390136234 = Instance.new("Frame")
G.COM_196327040390136234.Name = "COM-196327040390136234"
G.COM_196327040390136234.Size = UDim2.new(0.894198,0,0.931112,0)
G.COM_196327040390136234.Position = UDim2.new(5.4771e-08,0,0,0)
G.COM_196327040390136234.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_196327040390136234.BackgroundTransparency = 1
G.COM_196327040390136234.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_196327040390136234.BorderSizePixel = 0
G.COM_196327040390136234.ZIndex = 2
G.COM_196327040390136234.Parent = G.Special9

G.BG16 = Instance.new("Frame")
G.BG16.Name = "BG"
G.BG16.Size = UDim2.new(1,0,1,0)
G.BG16.Position = UDim2.new(0.5,0,0.5,0)
G.BG16.AnchorPoint = Vector2.new(0.5,0.5)
G.BG16.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG16.BackgroundTransparency = 1
G.BG16.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG16.BorderSizePixel = 0
G.BG16.ZIndex = -1
G.BG16.Parent = G.COM_196327040390136234

G.Dropshadow15 = Instance.new("Frame")
G.Dropshadow15.Name = "Dropshadow"
G.Dropshadow15.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow15.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow15.AnchorPoint = Vector2.new(0,1)
G.Dropshadow15.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow15.BackgroundTransparency = 0.5
G.Dropshadow15.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow15.BorderSizePixel = 0
G.Dropshadow15.ZIndex = -2
G.Dropshadow15.Parent = G.BG16

G.UIStroke152 = Instance.new("UIStroke")
G.UIStroke152.Name = "UIStroke"
G.UIStroke152.Thickness = 2.79551
G.UIStroke152.Transparency = 1
G.UIStroke152.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke152.Parent = G.Dropshadow15

G.Frame16 = Instance.new("Frame")
G.Frame16.Name = "Frame"
G.Frame16.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame16.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame16.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame16.BackgroundColor3 = Color3.fromRGB(216,75,75)
G.Frame16.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame16.BorderSizePixel = 0
G.Frame16.ZIndex = -1
G.Frame16.Parent = G.BG16

G.Pattern15 = Instance.new("ImageLabel")
G.Pattern15.Name = "Pattern"
G.Pattern15.Size = UDim2.new(1,0,1,0)
G.Pattern15.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern15.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern15.BackgroundTransparency = 1
G.Pattern15.BorderSizePixel = 0
G.Pattern15.Image = "rbxassetid://93965194514144"
G.Pattern15.ImageColor3 = Color3.fromRGB(133,243,255)
G.Pattern15.ZIndex = -1
G.Pattern15.Parent = G.Frame16

G.UIGradient55 = Instance.new("UIGradient")
G.UIGradient55.Name = "UIGradient"
G.UIGradient55.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
G.UIGradient55.Rotation = 90
G.UIGradient55.Offset = Vector2.new(0,0)
G.UIGradient55.Parent = G.Pattern15

G.UIStroke153 = Instance.new("UIStroke")
G.UIStroke153.Name = "UIStroke"
G.UIStroke153.Thickness = 1.86368
G.UIStroke153.Parent = G.Pattern15

G.UIGradient56 = Instance.new("UIGradient")
G.UIGradient56.Name = "UIGradient"
G.UIGradient56.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient56.Rotation = 90
G.UIGradient56.Offset = Vector2.new(0,0)
G.UIGradient56.Parent = G.Frame16

G.UIStroke154 = Instance.new("UIStroke")
G.UIStroke154.Name = "UIStroke"
G.UIStroke154.Thickness = 1.86368
G.UIStroke154.Parent = G.Frame16

G.Highlight15 = Instance.new("Frame")
G.Highlight15.Name = "Highlight"
G.Highlight15.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight15.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight15.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight15.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight15.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight15.BorderSizePixel = 0
G.Highlight15.Visible = false
G.Highlight15.ZIndex = -2
G.Highlight15.Parent = G.BG16

G.UIStroke155 = Instance.new("UIStroke")
G.UIStroke155.Name = "UIStroke"
G.UIStroke155.Color = Color3.fromRGB(255,242,0)
G.UIStroke155.Thickness = 2.79551
G.UIStroke155.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke155.Parent = G.Highlight15

G.CanvasGroup7 = Instance.new("CanvasGroup")
G.CanvasGroup7.Name = "CanvasGroup"
G.CanvasGroup7.Size = UDim2.new(0.970515,0,0.95775,0)
G.CanvasGroup7.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup7.BackgroundTransparency = 1
G.CanvasGroup7.Parent = G.COM_196327040390136234

G.Thumbnail29 = Instance.new("ImageLabel")
G.Thumbnail29.Name = "Thumbnail"
G.Thumbnail29.Size = UDim2.new(0.470619,0,1.14854,0)
G.Thumbnail29.Position = UDim2.new(0.165209,0,0.529027,0)
G.Thumbnail29.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail29.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail29.BackgroundTransparency = 1
G.Thumbnail29.BorderSizePixel = 0
G.Thumbnail29.Image = "rbxassetid://125797882035757"
G.Thumbnail29.ScaleType = Enum.ScaleType.Fit
G.Thumbnail29.Rotation = -11
G.Thumbnail29.Parent = G.CanvasGroup7

G.Unavailable50 = Instance.new("TextLabel")
G.Unavailable50.Name = "Unavailable"
G.Unavailable50.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable50.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable50.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable50.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable50.BackgroundTransparency = 1
G.Unavailable50.BorderSizePixel = 0
G.Unavailable50.Text = "Unavailable"
G.Unavailable50.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable50.TextSize = 14
G.Unavailable50.Font = Enum.Font.FredokaOne
G.Unavailable50.TextWrapped = true
G.Unavailable50.TextScaled = true
G.Unavailable50.Visible = false
G.Unavailable50.Parent = G.Thumbnail29

G.UIStroke156 = Instance.new("UIStroke")
G.UIStroke156.Name = "UIStroke"
G.UIStroke156.Thickness = 2
G.UIStroke156.Parent = G.Unavailable50

G.DisplayTitle12 = Instance.new("TextLabel")
G.DisplayTitle12.Name = "DisplayTitle"
G.DisplayTitle12.Size = UDim2.new(0.447811,0,0.334729,0)
G.DisplayTitle12.Position = UDim2.new(0.752098,0,0.261677,0)
G.DisplayTitle12.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle12.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle12.BackgroundTransparency = 1
G.DisplayTitle12.BorderSizePixel = 0
G.DisplayTitle12.Text = "Goob\
 Deluxe 14\" Plush"
G.DisplayTitle12.TextColor3 = Color3.fromRGB(2,40,0)
G.DisplayTitle12.TextSize = 29
G.DisplayTitle12.Font = Enum.Font.Arcade
G.DisplayTitle12.TextWrapped = true
G.DisplayTitle12.TextScaled = true
G.DisplayTitle12.RichText = true
G.DisplayTitle12.Parent = G.COM_196327040390136234

G.UIGradient57 = Instance.new("UIGradient")
G.UIGradient57.Name = "UIGradient"
G.UIGradient57.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient57.Rotation = -90
G.UIGradient57.Offset = Vector2.new(0,0)
G.UIGradient57.Parent = G.DisplayTitle12

G.UIStroke157 = Instance.new("UIStroke")
G.UIStroke157.Name = "UIStroke"
G.UIStroke157.Color = Color3.fromRGB(255,255,255)
G.UIStroke157.Thickness = 0.931838
G.UIStroke157.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke157.Parent = G.DisplayTitle12

G.Item16 = Instance.new("ImageLabel")
G.Item16.Name = "Item"
G.Item16.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item16.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item16.AnchorPoint = Vector2.new(0.5,0.5)
G.Item16.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item16.BackgroundTransparency = 1
G.Item16.BorderSizePixel = 0
G.Item16.Image = "rbxassetid://94959635148921"
G.Item16.ImageRectOffset = Vector2.new(15,15)
G.Item16.ImageRectSize = Vector2.new(270,270)
G.Item16.ScaleType = Enum.ScaleType.Fit
G.Item16.Visible = false
G.Item16.ZIndex = -1
G.Item16.Parent = G.COM_196327040390136234

G.Unavailable51 = Instance.new("TextLabel")
G.Unavailable51.Name = "Unavailable"
G.Unavailable51.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable51.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable51.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable51.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable51.BackgroundTransparency = 1
G.Unavailable51.BorderSizePixel = 0
G.Unavailable51.Text = "Unavailable"
G.Unavailable51.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable51.TextSize = 14
G.Unavailable51.Font = Enum.Font.FredokaOne
G.Unavailable51.TextWrapped = true
G.Unavailable51.TextScaled = true
G.Unavailable51.Visible = false
G.Unavailable51.Parent = G.Item16

G.UIStroke158 = Instance.new("UIStroke")
G.UIStroke158.Name = "UIStroke"
G.UIStroke158.Thickness = 2
G.UIStroke158.Parent = G.Unavailable51

G.Purchase16 = Instance.new("ImageButton")
G.Purchase16.Name = "Purchase"
G.Purchase16.Size = UDim2.new(0.436835,0,0.172928,0)
G.Purchase16.Position = UDim2.new(0.752098,0,0.833662,0)
G.Purchase16.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase16.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase16.BorderSizePixel = 0
G.Purchase16.ScaleType = Enum.ScaleType.Fit
G.Purchase16.AutoButtonColor = false
G.Purchase16.ZIndex = 5
G.Purchase16.Parent = G.COM_196327040390136234

G.Price16 = Instance.new("TextLabel")
G.Price16.Name = "Price"
G.Price16.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price16.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price16.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price16.BackgroundTransparency = 1
G.Price16.BorderSizePixel = 0
G.Price16.Text = "$19.99"
G.Price16.TextColor3 = Color3.fromRGB(255,255,255)
G.Price16.TextSize = 14
G.Price16.Font = Enum.Font.Arcade
G.Price16.TextWrapped = true
G.Price16.TextScaled = true
G.Price16.RichText = true
G.Price16.AutomaticSize = Enum.AutomaticSize.X
G.Price16.Parent = G.Purchase16

G.UIGradient58 = Instance.new("UIGradient")
G.UIGradient58.Name = "UIGradient"
G.UIGradient58.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient58.Rotation = -90
G.UIGradient58.Offset = Vector2.new(0,0)
G.UIGradient58.Parent = G.Price16

G.UIStroke159 = Instance.new("UIStroke")
G.UIStroke159.Name = "UIStroke"
G.UIStroke159.Thickness = 0.931838
G.UIStroke159.Parent = G.Price16

G.UICorner17 = Instance.new("UICorner")
G.UICorner17.Name = "UICorner"
G.UICorner17.CornerRadius = UDim.new(1,0)
G.UICorner17.Parent = G.Purchase16

G.UIGradient59 = Instance.new("UIGradient")
G.UIGradient59.Name = "UIGradient"
G.UIGradient59.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient59.Rotation = -90
G.UIGradient59.Offset = Vector2.new(0,0)
G.UIGradient59.Parent = G.Purchase16

G.UIScale25 = Instance.new("UIScale")
G.UIScale25.Name = "UIScale"
G.UIScale25.Parent = G.Purchase16

G.UIStroke160 = Instance.new("UIStroke")
G.UIStroke160.Name = "UIStroke"
G.UIStroke160.Thickness = 1.1648
G.UIStroke160.Parent = G.Purchase16

G.Thumbnail30 = Instance.new("ImageLabel")
G.Thumbnail30.Name = "Thumbnail"
G.Thumbnail30.Size = UDim2.new(0.48234,0,1.2575,0)
G.Thumbnail30.Position = UDim2.new(0.42096,0,0.450994,0)
G.Thumbnail30.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail30.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail30.BackgroundTransparency = 1
G.Thumbnail30.BorderSizePixel = 0
G.Thumbnail30.Image = "rbxassetid://130388109305519"
G.Thumbnail30.ScaleType = Enum.ScaleType.Fit
G.Thumbnail30.ZIndex = 4
G.Thumbnail30.Parent = G.COM_196327040390136234

G.Unavailable52 = Instance.new("TextLabel")
G.Unavailable52.Name = "Unavailable"
G.Unavailable52.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable52.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable52.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable52.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable52.BackgroundTransparency = 1
G.Unavailable52.BorderSizePixel = 0
G.Unavailable52.Text = "Unavailable"
G.Unavailable52.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable52.TextSize = 14
G.Unavailable52.Font = Enum.Font.FredokaOne
G.Unavailable52.TextWrapped = true
G.Unavailable52.TextScaled = true
G.Unavailable52.Visible = false
G.Unavailable52.Parent = G.Thumbnail30

G.UIStroke161 = Instance.new("UIStroke")
G.UIStroke161.Name = "UIStroke"
G.UIStroke161.Thickness = 2
G.UIStroke161.Parent = G.Unavailable52

G.Title16 = Instance.new("TextLabel")
G.Title16.Name = "Title"
G.Title16.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title16.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title16.AnchorPoint = Vector2.new(0.5,0)
G.Title16.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title16.BackgroundTransparency = 1
G.Title16.BorderSizePixel = 0
G.Title16.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title16.TextColor3 = Color3.fromRGB(0,13,76)
G.Title16.TextSize = 29
G.Title16.Font = Enum.Font.Arcade
G.Title16.TextWrapped = true
G.Title16.TextScaled = true
G.Title16.RichText = true
G.Title16.Visible = false
G.Title16.AutomaticSize = Enum.AutomaticSize.X
G.Title16.Parent = G.COM_196327040390136234

G.UIGradient60 = Instance.new("UIGradient")
G.UIGradient60.Name = "UIGradient"
G.UIGradient60.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient60.Rotation = -90
G.UIGradient60.Offset = Vector2.new(0,0)
G.UIGradient60.Parent = G.Title16

G.UIStroke162 = Instance.new("UIStroke")
G.UIStroke162.Name = "UIStroke"
G.UIStroke162.Color = Color3.fromRGB(255,255,255)
G.UIStroke162.Thickness = 2
G.UIStroke162.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke162.Parent = G.Title16

G.UIListLayout10 = Instance.new("UIListLayout")
G.UIListLayout10.Name = "UIListLayout"
G.UIListLayout10.Padding = UDim.new(0.019,0)
G.UIListLayout10.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout10.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout10.Wraps = false
G.UIListLayout10.Parent = G.Special9

G.Special10 = Instance.new("Frame")
G.Special10.Name = "Special"
G.Special10.Size = UDim2.new(0.728177,0,0.493216,0)
G.Special10.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
G.Special10.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special10.BackgroundTransparency = 1
G.Special10.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special10.BorderSizePixel = 0
G.Special10.LayoutOrder = -9
G.Special10.Parent = G.ScrollingFrame

G.COM_3058750999868080584 = Instance.new("Frame")
G.COM_3058750999868080584.Name = "COM-3058750999868080584"
G.COM_3058750999868080584.Size = UDim2.new(0.442523,0,0.944677,0)
G.COM_3058750999868080584.Position = UDim2.new(0.913307,0,0,0)
G.COM_3058750999868080584.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_3058750999868080584.BackgroundTransparency = 1
G.COM_3058750999868080584.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_3058750999868080584.BorderSizePixel = 0
G.COM_3058750999868080584.Parent = G.Special10

G.BG17 = Instance.new("Frame")
G.BG17.Name = "BG"
G.BG17.Size = UDim2.new(1,0,1,0)
G.BG17.Position = UDim2.new(0.5,0,0.5,0)
G.BG17.AnchorPoint = Vector2.new(0.5,0.5)
G.BG17.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG17.BackgroundTransparency = 1
G.BG17.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG17.BorderSizePixel = 0
G.BG17.ZIndex = -1
G.BG17.Parent = G.COM_3058750999868080584

G.Dropshadow16 = Instance.new("Frame")
G.Dropshadow16.Name = "Dropshadow"
G.Dropshadow16.Size = UDim2.new(0.947997,0,0.95376,0)
G.Dropshadow16.Position = UDim2.new(-0.00747363,0,1.01324,0)
G.Dropshadow16.AnchorPoint = Vector2.new(0,1)
G.Dropshadow16.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow16.BackgroundTransparency = 0.5
G.Dropshadow16.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow16.BorderSizePixel = 0
G.Dropshadow16.ZIndex = -2
G.Dropshadow16.Parent = G.BG17

G.UIStroke163 = Instance.new("UIStroke")
G.UIStroke163.Name = "UIStroke"
G.UIStroke163.Thickness = 2.79551
G.UIStroke163.Transparency = 1
G.UIStroke163.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke163.Parent = G.Dropshadow16

G.Frame17 = Instance.new("Frame")
G.Frame17.Name = "Frame"
G.Frame17.Size = UDim2.new(0.95775,0,0.95775,0)
G.Frame17.Position = UDim2.new(0.521125,0,0.478875,0)
G.Frame17.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame17.BackgroundColor3 = Color3.fromRGB(216,175,177)
G.Frame17.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame17.BorderSizePixel = 0
G.Frame17.ZIndex = -1
G.Frame17.Parent = G.BG17

G.Pattern16 = Instance.new("ImageLabel")
G.Pattern16.Name = "Pattern"
G.Pattern16.Size = UDim2.new(1,0,1,0)
G.Pattern16.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern16.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern16.BackgroundTransparency = 1
G.Pattern16.BorderSizePixel = 0
G.Pattern16.Image = "rbxassetid://84524606651700"
G.Pattern16.ScaleType = Enum.ScaleType.Crop
G.Pattern16.ZIndex = -1
G.Pattern16.Parent = G.Frame17

G.UIGradient61 = Instance.new("UIGradient")
G.UIGradient61.Name = "UIGradient"
G.UIGradient61.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
G.UIGradient61.Rotation = 90
G.UIGradient61.Offset = Vector2.new(0,0)
G.UIGradient61.Enabled = false
G.UIGradient61.Parent = G.Pattern16

G.UIStroke164 = Instance.new("UIStroke")
G.UIStroke164.Name = "UIStroke"
G.UIStroke164.Thickness = 1.86368
G.UIStroke164.Parent = G.Pattern16

G.UIGradient62 = Instance.new("UIGradient")
G.UIGradient62.Name = "UIGradient"
G.UIGradient62.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient62.Rotation = 90
G.UIGradient62.Offset = Vector2.new(0,0)
G.UIGradient62.Parent = G.Frame17

G.UIStroke165 = Instance.new("UIStroke")
G.UIStroke165.Name = "UIStroke"
G.UIStroke165.Thickness = 4
G.UIStroke165.Parent = G.Frame17

G.Highlight16 = Instance.new("Frame")
G.Highlight16.Name = "Highlight"
G.Highlight16.Size = UDim2.new(0.954203,0,0.95775,0)
G.Highlight16.Position = UDim2.new(0.519351,0,0.478875,0)
G.Highlight16.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight16.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight16.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight16.BorderSizePixel = 0
G.Highlight16.Visible = false
G.Highlight16.ZIndex = -2
G.Highlight16.Parent = G.BG17

G.UIStroke166 = Instance.new("UIStroke")
G.UIStroke166.Name = "UIStroke"
G.UIStroke166.Color = Color3.fromRGB(255,242,0)
G.UIStroke166.Thickness = 2.79551
G.UIStroke166.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke166.Parent = G.Highlight16

G.Item17 = Instance.new("ImageLabel")
G.Item17.Name = "Item"
G.Item17.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item17.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item17.AnchorPoint = Vector2.new(0.5,0.5)
G.Item17.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item17.BackgroundTransparency = 1
G.Item17.BorderSizePixel = 0
G.Item17.Image = "rbxassetid://94959635148921"
G.Item17.ImageRectOffset = Vector2.new(25,25)
G.Item17.ImageRectSize = Vector2.new(250,250)
G.Item17.ScaleType = Enum.ScaleType.Crop
G.Item17.Visible = false
G.Item17.ZIndex = -1
G.Item17.Parent = G.COM_3058750999868080584

G.Unavailable53 = Instance.new("TextLabel")
G.Unavailable53.Name = "Unavailable"
G.Unavailable53.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable53.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable53.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable53.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable53.BackgroundTransparency = 1
G.Unavailable53.BorderSizePixel = 0
G.Unavailable53.Text = "Unavailable"
G.Unavailable53.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable53.TextSize = 14
G.Unavailable53.Font = Enum.Font.FredokaOne
G.Unavailable53.TextWrapped = true
G.Unavailable53.TextScaled = true
G.Unavailable53.Visible = false
G.Unavailable53.Parent = G.Item17

G.UIStroke167 = Instance.new("UIStroke")
G.UIStroke167.Name = "UIStroke"
G.UIStroke167.Thickness = 2
G.UIStroke167.Parent = G.Unavailable53

G.Pixel7 = Instance.new("ImageLabel")
G.Pixel7.Name = "Pixel"
G.Pixel7.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel7.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel7.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel7.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel7.BorderSizePixel = 0
G.Pixel7.Image = "rbxassetid://94959635148921"
G.Pixel7.ImageRectOffset = Vector2.new(55,100)
G.Pixel7.ImageRectSize = Vector2.new(30,30)
G.Pixel7.ScaleType = Enum.ScaleType.Crop
G.Pixel7.Visible = false
G.Pixel7.ZIndex = 5
G.Pixel7.Parent = G.COM_3058750999868080584

G.Unavailable54 = Instance.new("TextLabel")
G.Unavailable54.Name = "Unavailable"
G.Unavailable54.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable54.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable54.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable54.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable54.BackgroundTransparency = 1
G.Unavailable54.BorderSizePixel = 0
G.Unavailable54.Text = "Unavailable"
G.Unavailable54.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable54.TextSize = 14
G.Unavailable54.Font = Enum.Font.FredokaOne
G.Unavailable54.TextWrapped = true
G.Unavailable54.TextScaled = true
G.Unavailable54.Visible = false
G.Unavailable54.Parent = G.Pixel7

G.UIStroke168 = Instance.new("UIStroke")
G.UIStroke168.Name = "UIStroke"
G.UIStroke168.Thickness = 2
G.UIStroke168.Parent = G.Unavailable54

G.Purchase17 = Instance.new("ImageButton")
G.Purchase17.Name = "Purchase"
G.Purchase17.Size = UDim2.new(0.863319,0,0.170445,0)
G.Purchase17.Position = UDim2.new(0.514166,0,0.821691,0)
G.Purchase17.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase17.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase17.BorderSizePixel = 0
G.Purchase17.ScaleType = Enum.ScaleType.Fit
G.Purchase17.AutoButtonColor = false
G.Purchase17.ZIndex = 6
G.Purchase17.Parent = G.COM_3058750999868080584

G.Price17 = Instance.new("TextLabel")
G.Price17.Name = "Price"
G.Price17.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price17.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price17.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price17.BackgroundTransparency = 1
G.Price17.BorderSizePixel = 0
G.Price17.Text = "$19.99"
G.Price17.TextColor3 = Color3.fromRGB(255,255,255)
G.Price17.TextSize = 14
G.Price17.Font = Enum.Font.Arcade
G.Price17.TextWrapped = true
G.Price17.TextScaled = true
G.Price17.RichText = true
G.Price17.AutomaticSize = Enum.AutomaticSize.X
G.Price17.Parent = G.Purchase17

G.UIGradient63 = Instance.new("UIGradient")
G.UIGradient63.Name = "UIGradient"
G.UIGradient63.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient63.Rotation = -90
G.UIGradient63.Offset = Vector2.new(0,0)
G.UIGradient63.Parent = G.Price17

G.UIStroke169 = Instance.new("UIStroke")
G.UIStroke169.Name = "UIStroke"
G.UIStroke169.Thickness = 2
G.UIStroke169.Parent = G.Price17

G.UICorner18 = Instance.new("UICorner")
G.UICorner18.Name = "UICorner"
G.UICorner18.CornerRadius = UDim.new(1,0)
G.UICorner18.Parent = G.Purchase17

G.UIGradient64 = Instance.new("UIGradient")
G.UIGradient64.Name = "UIGradient"
G.UIGradient64.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient64.Rotation = -90
G.UIGradient64.Offset = Vector2.new(0,0)
G.UIGradient64.Parent = G.Purchase17

G.UIScale26 = Instance.new("UIScale")
G.UIScale26.Name = "UIScale"
G.UIScale26.Parent = G.Purchase17

G.UIStroke170 = Instance.new("UIStroke")
G.UIStroke170.Name = "UIStroke"
G.UIStroke170.Thickness = 2.5
G.UIStroke170.Parent = G.Purchase17

G.Thumbnail31 = Instance.new("ImageLabel")
G.Thumbnail31.Name = "Thumbnail"
G.Thumbnail31.Size = UDim2.new(1.15659,0,0.857211,0)
G.Thumbnail31.Position = UDim2.new(0.495381,0,0.470327,0)
G.Thumbnail31.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail31.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail31.BackgroundTransparency = 1
G.Thumbnail31.BorderSizePixel = 0
G.Thumbnail31.Image = "rbxassetid://83831236539287"
G.Thumbnail31.ScaleType = Enum.ScaleType.Crop
G.Thumbnail31.ZIndex = -1
G.Thumbnail31.Parent = G.COM_3058750999868080584

G.Unavailable55 = Instance.new("TextLabel")
G.Unavailable55.Name = "Unavailable"
G.Unavailable55.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable55.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable55.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable55.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable55.BackgroundTransparency = 1
G.Unavailable55.BorderSizePixel = 0
G.Unavailable55.Text = "Unavailable"
G.Unavailable55.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable55.TextSize = 14
G.Unavailable55.Font = Enum.Font.FredokaOne
G.Unavailable55.TextWrapped = true
G.Unavailable55.TextScaled = true
G.Unavailable55.Visible = false
G.Unavailable55.Parent = G.Thumbnail31

G.UIStroke171 = Instance.new("UIStroke")
G.UIStroke171.Name = "UIStroke"
G.UIStroke171.Thickness = 2
G.UIStroke171.Parent = G.Unavailable55

G.Title17 = Instance.new("TextLabel")
G.Title17.Name = "Title"
G.Title17.Size = UDim2.new(0.874784,0,0.149,0)
G.Title17.Position = UDim2.new(0.531264,0,0.0306123,0)
G.Title17.AnchorPoint = Vector2.new(0.5,0)
G.Title17.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title17.BackgroundTransparency = 1
G.Title17.BorderSizePixel = 0
G.Title17.Text = "Bobette 11" x 14" Poster"
G.Title17.TextColor3 = Color3.fromRGB(0,0,0)
G.Title17.TextSize = 29
G.Title17.Font = Enum.Font.Arcade
G.Title17.TextXAlignment = Enum.TextXAlignment.Left
G.Title17.TextYAlignment = Enum.TextYAlignment.Top
G.Title17.TextWrapped = true
G.Title17.TextScaled = true
G.Title17.RichText = true
G.Title17.Visible = false
G.Title17.AutomaticSize = Enum.AutomaticSize.X
G.Title17.Parent = G.COM_3058750999868080584

G.UITextSizeConstraint10 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint10.Name = "UITextSizeConstraint"
G.UITextSizeConstraint10.MaxTextSize = 29
G.UITextSizeConstraint10.Parent = G.Title17

G.COM_5199649672729330113 = Instance.new("Frame")
G.COM_5199649672729330113.Name = "COM-5199649672729330113"
G.COM_5199649672729330113.Size = UDim2.new(0.894198,0,0.931112,0)
G.COM_5199649672729330113.Position = UDim2.new(5.4771e-08,0,0,0)
G.COM_5199649672729330113.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_5199649672729330113.BackgroundTransparency = 1
G.COM_5199649672729330113.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_5199649672729330113.BorderSizePixel = 0
G.COM_5199649672729330113.ZIndex = 2
G.COM_5199649672729330113.Parent = G.Special10

G.BG18 = Instance.new("Frame")
G.BG18.Name = "BG"
G.BG18.Size = UDim2.new(1,0,1,0)
G.BG18.Position = UDim2.new(0.5,0,0.5,0)
G.BG18.AnchorPoint = Vector2.new(0.5,0.5)
G.BG18.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG18.BackgroundTransparency = 1
G.BG18.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG18.BorderSizePixel = 0
G.BG18.ZIndex = -1
G.BG18.Parent = G.COM_5199649672729330113

G.Dropshadow17 = Instance.new("Frame")
G.Dropshadow17.Name = "Dropshadow"
G.Dropshadow17.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow17.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow17.AnchorPoint = Vector2.new(0,1)
G.Dropshadow17.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow17.BackgroundTransparency = 0.5
G.Dropshadow17.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow17.BorderSizePixel = 0
G.Dropshadow17.ZIndex = -2
G.Dropshadow17.Parent = G.BG18

G.UIStroke172 = Instance.new("UIStroke")
G.UIStroke172.Name = "UIStroke"
G.UIStroke172.Thickness = 2.79551
G.UIStroke172.Transparency = 1
G.UIStroke172.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke172.Parent = G.Dropshadow17

G.Frame18 = Instance.new("Frame")
G.Frame18.Name = "Frame"
G.Frame18.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame18.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame18.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame18.BackgroundColor3 = Color3.fromRGB(216,175,177)
G.Frame18.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame18.BorderSizePixel = 0
G.Frame18.ZIndex = -1
G.Frame18.Parent = G.BG18

G.Pattern17 = Instance.new("ImageLabel")
G.Pattern17.Name = "Pattern"
G.Pattern17.Size = UDim2.new(1,0,1,0)
G.Pattern17.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern17.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern17.BackgroundTransparency = 1
G.Pattern17.BorderSizePixel = 0
G.Pattern17.Image = "rbxassetid://84524606651700"
G.Pattern17.ZIndex = -1
G.Pattern17.Parent = G.Frame18

G.UIGradient65 = Instance.new("UIGradient")
G.UIGradient65.Name = "UIGradient"
G.UIGradient65.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
G.UIGradient65.Rotation = 90
G.UIGradient65.Offset = Vector2.new(0,0)
G.UIGradient65.Enabled = false
G.UIGradient65.Parent = G.Pattern17

G.UIStroke173 = Instance.new("UIStroke")
G.UIStroke173.Name = "UIStroke"
G.UIStroke173.Thickness = 1.86368
G.UIStroke173.Parent = G.Pattern17

G.UIGradient66 = Instance.new("UIGradient")
G.UIGradient66.Name = "UIGradient"
G.UIGradient66.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient66.Rotation = 90
G.UIGradient66.Offset = Vector2.new(0,0)
G.UIGradient66.Parent = G.Frame18

G.UIStroke174 = Instance.new("UIStroke")
G.UIStroke174.Name = "UIStroke"
G.UIStroke174.Thickness = 1.86368
G.UIStroke174.Parent = G.Frame18

G.Highlight17 = Instance.new("Frame")
G.Highlight17.Name = "Highlight"
G.Highlight17.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight17.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight17.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight17.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight17.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight17.BorderSizePixel = 0
G.Highlight17.Visible = false
G.Highlight17.ZIndex = -2
G.Highlight17.Parent = G.BG18

G.UIStroke175 = Instance.new("UIStroke")
G.UIStroke175.Name = "UIStroke"
G.UIStroke175.Color = Color3.fromRGB(255,242,0)
G.UIStroke175.Thickness = 2.79551
G.UIStroke175.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke175.Parent = G.Highlight17

G.CanvasGroup8 = Instance.new("CanvasGroup")
G.CanvasGroup8.Name = "CanvasGroup"
G.CanvasGroup8.Size = UDim2.new(0.970515,0,0.95775,0)
G.CanvasGroup8.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup8.BackgroundTransparency = 1
G.CanvasGroup8.Parent = G.COM_5199649672729330113

G.Thumbnail32 = Instance.new("ImageLabel")
G.Thumbnail32.Name = "Thumbnail"
G.Thumbnail32.Size = UDim2.new(0.373138,0,0.847911,0)
G.Thumbnail32.Position = UDim2.new(0.118683,0,0.561027,0)
G.Thumbnail32.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail32.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail32.BackgroundTransparency = 1
G.Thumbnail32.BorderSizePixel = 0
G.Thumbnail32.Image = "rbxassetid://130203104701467"
G.Thumbnail32.ScaleType = Enum.ScaleType.Fit
G.Thumbnail32.Rotation = -11
G.Thumbnail32.Parent = G.CanvasGroup8

G.Unavailable56 = Instance.new("TextLabel")
G.Unavailable56.Name = "Unavailable"
G.Unavailable56.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable56.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable56.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable56.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable56.BackgroundTransparency = 1
G.Unavailable56.BorderSizePixel = 0
G.Unavailable56.Text = "Unavailable"
G.Unavailable56.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable56.TextSize = 14
G.Unavailable56.Font = Enum.Font.FredokaOne
G.Unavailable56.TextWrapped = true
G.Unavailable56.TextScaled = true
G.Unavailable56.Visible = false
G.Unavailable56.Parent = G.Thumbnail32

G.UIStroke176 = Instance.new("UIStroke")
G.UIStroke176.Name = "UIStroke"
G.UIStroke176.Thickness = 2
G.UIStroke176.Parent = G.Unavailable56

G.Thumbnail33 = Instance.new("ImageLabel")
G.Thumbnail33.Name = "Thumbnail"
G.Thumbnail33.Size = UDim2.new(0.373138,0,0.807747,0)
G.Thumbnail33.Position = UDim2.new(0.208987,0,0.414244,0)
G.Thumbnail33.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail33.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail33.BackgroundTransparency = 1
G.Thumbnail33.BorderSizePixel = 0
G.Thumbnail33.Image = "rbxassetid://94369491348769"
G.Thumbnail33.ScaleType = Enum.ScaleType.Fit
G.Thumbnail33.ZIndex = 0
G.Thumbnail33.Rotation = 11
G.Thumbnail33.Parent = G.CanvasGroup8

G.Unavailable57 = Instance.new("TextLabel")
G.Unavailable57.Name = "Unavailable"
G.Unavailable57.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable57.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable57.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable57.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable57.BackgroundTransparency = 1
G.Unavailable57.BorderSizePixel = 0
G.Unavailable57.Text = "Unavailable"
G.Unavailable57.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable57.TextSize = 14
G.Unavailable57.Font = Enum.Font.FredokaOne
G.Unavailable57.TextWrapped = true
G.Unavailable57.TextScaled = true
G.Unavailable57.Visible = false
G.Unavailable57.Parent = G.Thumbnail33

G.UIStroke177 = Instance.new("UIStroke")
G.UIStroke177.Name = "UIStroke"
G.UIStroke177.Thickness = 2
G.UIStroke177.Parent = G.Unavailable57

G.DisplayTitle13 = Instance.new("TextLabel")
G.DisplayTitle13.Name = "DisplayTitle"
G.DisplayTitle13.Size = UDim2.new(0.428097,0,0.415185,0)
G.DisplayTitle13.Position = UDim2.new(0.767443,0,0.212655,0)
G.DisplayTitle13.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle13.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle13.BackgroundTransparency = 1
G.DisplayTitle13.BorderSizePixel = 0
G.DisplayTitle13.Text = "Shelly Deluxe 12\" Plush (Pre-Order)"
G.DisplayTitle13.TextColor3 = Color3.fromRGB(2,40,0)
G.DisplayTitle13.TextSize = 29
G.DisplayTitle13.Font = Enum.Font.Arcade
G.DisplayTitle13.TextWrapped = true
G.DisplayTitle13.TextScaled = true
G.DisplayTitle13.RichText = true
G.DisplayTitle13.Parent = G.COM_5199649672729330113

G.UIGradient67 = Instance.new("UIGradient")
G.UIGradient67.Name = "UIGradient"
G.UIGradient67.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient67.Rotation = -90
G.UIGradient67.Offset = Vector2.new(0,0)
G.UIGradient67.Parent = G.DisplayTitle13

G.UIStroke178 = Instance.new("UIStroke")
G.UIStroke178.Name = "UIStroke"
G.UIStroke178.Color = Color3.fromRGB(255,255,255)
G.UIStroke178.Thickness = 0.931838
G.UIStroke178.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke178.Parent = G.DisplayTitle13

G.Item18 = Instance.new("ImageLabel")
G.Item18.Name = "Item"
G.Item18.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item18.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item18.AnchorPoint = Vector2.new(0.5,0.5)
G.Item18.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item18.BackgroundTransparency = 1
G.Item18.BorderSizePixel = 0
G.Item18.Image = "rbxassetid://94959635148921"
G.Item18.ImageRectOffset = Vector2.new(15,15)
G.Item18.ImageRectSize = Vector2.new(270,270)
G.Item18.ScaleType = Enum.ScaleType.Fit
G.Item18.Visible = false
G.Item18.ZIndex = -1
G.Item18.Parent = G.COM_5199649672729330113

G.Unavailable58 = Instance.new("TextLabel")
G.Unavailable58.Name = "Unavailable"
G.Unavailable58.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable58.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable58.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable58.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable58.BackgroundTransparency = 1
G.Unavailable58.BorderSizePixel = 0
G.Unavailable58.Text = "Unavailable"
G.Unavailable58.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable58.TextSize = 14
G.Unavailable58.Font = Enum.Font.FredokaOne
G.Unavailable58.TextWrapped = true
G.Unavailable58.TextScaled = true
G.Unavailable58.Visible = false
G.Unavailable58.Parent = G.Item18

G.UIStroke179 = Instance.new("UIStroke")
G.UIStroke179.Name = "UIStroke"
G.UIStroke179.Thickness = 2
G.UIStroke179.Parent = G.Unavailable58

G.New8 = Instance.new("ImageLabel")
G.New8.Name = "New"
G.New8.Size = UDim2.new(0.322123,0,0.355513,0)
G.New8.Position = UDim2.new(0.94212,0,0.0839209,0)
G.New8.AnchorPoint = Vector2.new(0.5,0.5)
G.New8.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New8.BackgroundTransparency = 1
G.New8.BorderSizePixel = 0
G.New8.Image = "rbxassetid://96728750855907"
G.New8.ScaleType = Enum.ScaleType.Fit
G.New8.Visible = false
G.New8.ZIndex = -1
G.New8.Parent = G.COM_5199649672729330113

G.UIScale27 = Instance.new("UIScale")
G.UIScale27.Name = "UIScale"
G.UIScale27.Parent = G.New8

G.Purchase18 = Instance.new("ImageButton")
G.Purchase18.Name = "Purchase"
G.Purchase18.Size = UDim2.new(0.436835,0,0.172928,0)
G.Purchase18.Position = UDim2.new(0.752098,0,0.833662,0)
G.Purchase18.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase18.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase18.BorderSizePixel = 0
G.Purchase18.ScaleType = Enum.ScaleType.Fit
G.Purchase18.AutoButtonColor = false
G.Purchase18.ZIndex = 5
G.Purchase18.Parent = G.COM_5199649672729330113

G.Price18 = Instance.new("TextLabel")
G.Price18.Name = "Price"
G.Price18.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price18.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price18.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price18.BackgroundTransparency = 1
G.Price18.BorderSizePixel = 0
G.Price18.Text = "$19.99"
G.Price18.TextColor3 = Color3.fromRGB(255,255,255)
G.Price18.TextSize = 14
G.Price18.Font = Enum.Font.Arcade
G.Price18.TextWrapped = true
G.Price18.TextScaled = true
G.Price18.RichText = true
G.Price18.AutomaticSize = Enum.AutomaticSize.X
G.Price18.Parent = G.Purchase18

G.UIGradient68 = Instance.new("UIGradient")
G.UIGradient68.Name = "UIGradient"
G.UIGradient68.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient68.Rotation = -90
G.UIGradient68.Offset = Vector2.new(0,0)
G.UIGradient68.Parent = G.Price18

G.UIStroke180 = Instance.new("UIStroke")
G.UIStroke180.Name = "UIStroke"
G.UIStroke180.Thickness = 0.931838
G.UIStroke180.Parent = G.Price18

G.UICorner19 = Instance.new("UICorner")
G.UICorner19.Name = "UICorner"
G.UICorner19.CornerRadius = UDim.new(1,0)
G.UICorner19.Parent = G.Purchase18

G.UIGradient69 = Instance.new("UIGradient")
G.UIGradient69.Name = "UIGradient"
G.UIGradient69.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient69.Rotation = -90
G.UIGradient69.Offset = Vector2.new(0,0)
G.UIGradient69.Parent = G.Purchase18

G.UIScale28 = Instance.new("UIScale")
G.UIScale28.Name = "UIScale"
G.UIScale28.Parent = G.Purchase18

G.UIStroke181 = Instance.new("UIStroke")
G.UIStroke181.Name = "UIStroke"
G.UIStroke181.Thickness = 1.1648
G.UIStroke181.Parent = G.Purchase18

G.Thumbnail34 = Instance.new("ImageLabel")
G.Thumbnail34.Name = "Thumbnail"
G.Thumbnail34.Size = UDim2.new(0.48234,0,1.2575,0)
G.Thumbnail34.Position = UDim2.new(0.42096,0,0.450994,0)
G.Thumbnail34.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail34.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail34.BackgroundTransparency = 1
G.Thumbnail34.BorderSizePixel = 0
G.Thumbnail34.Image = "rbxassetid://112320841584433"
G.Thumbnail34.ScaleType = Enum.ScaleType.Fit
G.Thumbnail34.ZIndex = 4
G.Thumbnail34.Parent = G.COM_5199649672729330113

G.Unavailable59 = Instance.new("TextLabel")
G.Unavailable59.Name = "Unavailable"
G.Unavailable59.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable59.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable59.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable59.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable59.BackgroundTransparency = 1
G.Unavailable59.BorderSizePixel = 0
G.Unavailable59.Text = "Unavailable"
G.Unavailable59.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable59.TextSize = 14
G.Unavailable59.Font = Enum.Font.FredokaOne
G.Unavailable59.TextWrapped = true
G.Unavailable59.TextScaled = true
G.Unavailable59.Visible = false
G.Unavailable59.Parent = G.Thumbnail34

G.UIStroke182 = Instance.new("UIStroke")
G.UIStroke182.Name = "UIStroke"
G.UIStroke182.Thickness = 2
G.UIStroke182.Parent = G.Unavailable59

G.Title18 = Instance.new("TextLabel")
G.Title18.Name = "Title"
G.Title18.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title18.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title18.AnchorPoint = Vector2.new(0.5,0)
G.Title18.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title18.BackgroundTransparency = 1
G.Title18.BorderSizePixel = 0
G.Title18.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title18.TextColor3 = Color3.fromRGB(0,13,76)
G.Title18.TextSize = 29
G.Title18.Font = Enum.Font.Arcade
G.Title18.TextWrapped = true
G.Title18.TextScaled = true
G.Title18.RichText = true
G.Title18.Visible = false
G.Title18.AutomaticSize = Enum.AutomaticSize.X
G.Title18.Parent = G.COM_5199649672729330113

G.UIGradient70 = Instance.new("UIGradient")
G.UIGradient70.Name = "UIGradient"
G.UIGradient70.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient70.Rotation = -90
G.UIGradient70.Offset = Vector2.new(0,0)
G.UIGradient70.Parent = G.Title18

G.UIStroke183 = Instance.new("UIStroke")
G.UIStroke183.Name = "UIStroke"
G.UIStroke183.Color = Color3.fromRGB(255,255,255)
G.UIStroke183.Thickness = 2
G.UIStroke183.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke183.Parent = G.Title18

G.UIListLayout11 = Instance.new("UIListLayout")
G.UIListLayout11.Name = "UIListLayout"
G.UIListLayout11.Padding = UDim.new(0.019,0)
G.UIListLayout11.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout11.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout11.Wraps = false
G.UIListLayout11.Parent = G.Special10

G.Special11 = Instance.new("Frame")
G.Special11.Name = "Special"
G.Special11.Size = UDim2.new(1.10498,0,0.439953,0)
G.Special11.Position = UDim2.new(0,0,-0.143337,0)
G.Special11.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special11.BackgroundTransparency = 1
G.Special11.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special11.BorderSizePixel = 0
G.Special11.LayoutOrder = -8
G.Special11.Parent = G.ScrollingFrame

G.COM_7617315135790645707 = Instance.new("Frame")
G.COM_7617315135790645707.Name = "COM-7617315135790645707"
G.COM_7617315135790645707.Size = UDim2.new(0.894307,0,0.931111,0)
G.COM_7617315135790645707.Position = UDim2.new(-5.79236e-08,0,0,0)
G.COM_7617315135790645707.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_7617315135790645707.BackgroundTransparency = 1
G.COM_7617315135790645707.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_7617315135790645707.BorderSizePixel = 0
G.COM_7617315135790645707.Parent = G.Special11

G.BG19 = Instance.new("Frame")
G.BG19.Name = "BG"
G.BG19.Size = UDim2.new(1,0,1,0)
G.BG19.Position = UDim2.new(0.5,0,0.5,0)
G.BG19.AnchorPoint = Vector2.new(0.5,0.5)
G.BG19.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG19.BackgroundTransparency = 1
G.BG19.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG19.BorderSizePixel = 0
G.BG19.ZIndex = -1
G.BG19.Parent = G.COM_7617315135790645707

G.Dropshadow18 = Instance.new("Frame")
G.Dropshadow18.Name = "Dropshadow"
G.Dropshadow18.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow18.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow18.AnchorPoint = Vector2.new(0,1)
G.Dropshadow18.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow18.BackgroundTransparency = 0.5
G.Dropshadow18.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow18.BorderSizePixel = 0
G.Dropshadow18.ZIndex = -2
G.Dropshadow18.Parent = G.BG19

G.UIStroke184 = Instance.new("UIStroke")
G.UIStroke184.Name = "UIStroke"
G.UIStroke184.Thickness = 2.79551
G.UIStroke184.Transparency = 1
G.UIStroke184.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke184.Parent = G.Dropshadow18

G.Frame19 = Instance.new("Frame")
G.Frame19.Name = "Frame"
G.Frame19.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame19.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame19.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame19.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame19.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame19.BorderSizePixel = 0
G.Frame19.ZIndex = -1
G.Frame19.Parent = G.BG19

G.Pattern18 = Instance.new("ImageLabel")
G.Pattern18.Name = "Pattern"
G.Pattern18.Size = UDim2.new(0.635249,0,1,0)
G.Pattern18.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern18.BackgroundTransparency = 1
G.Pattern18.BorderSizePixel = 0
G.Pattern18.Image = "rbxassetid://103878999702903"
G.Pattern18.ImageColor3 = Color3.fromRGB(0,255,217)
G.Pattern18.ZIndex = -1
G.Pattern18.Parent = G.Frame19

G.UIStroke185 = Instance.new("UIStroke")
G.UIStroke185.Name = "UIStroke"
G.UIStroke185.Thickness = 1.86368
G.UIStroke185.Parent = G.Pattern18

G.UIStroke186 = Instance.new("UIStroke")
G.UIStroke186.Name = "UIStroke"
G.UIStroke186.Thickness = 1.86368
G.UIStroke186.Parent = G.Frame19

G.Highlight18 = Instance.new("Frame")
G.Highlight18.Name = "Highlight"
G.Highlight18.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight18.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight18.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight18.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight18.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight18.BorderSizePixel = 0
G.Highlight18.Visible = false
G.Highlight18.ZIndex = -2
G.Highlight18.Parent = G.BG19

G.UIStroke187 = Instance.new("UIStroke")
G.UIStroke187.Name = "UIStroke"
G.UIStroke187.Color = Color3.fromRGB(255,242,0)
G.UIStroke187.Thickness = 2.79551
G.UIStroke187.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke187.Parent = G.Highlight18

G.CanvasGroup9 = Instance.new("CanvasGroup")
G.CanvasGroup9.Name = "CanvasGroup"
G.CanvasGroup9.Size = UDim2.new(1,0,1,0)
G.CanvasGroup9.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup9.BackgroundTransparency = 1
G.CanvasGroup9.Parent = G.COM_7617315135790645707

G.Thumbnail35 = Instance.new("ImageLabel")
G.Thumbnail35.Name = "Thumbnail"
G.Thumbnail35.Size = UDim2.new(0.401091,0,0.993744,0)
G.Thumbnail35.Position = UDim2.new(0.0961707,0,0.538139,0)
G.Thumbnail35.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail35.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail35.BackgroundTransparency = 1
G.Thumbnail35.BorderSizePixel = 0
G.Thumbnail35.Image = "rbxassetid://114925215807231"
G.Thumbnail35.ScaleType = Enum.ScaleType.Fit
G.Thumbnail35.ZIndex = 0
G.Thumbnail35.Rotation = -11
G.Thumbnail35.Parent = G.CanvasGroup9

G.Unavailable60 = Instance.new("TextLabel")
G.Unavailable60.Name = "Unavailable"
G.Unavailable60.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable60.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable60.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable60.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable60.BackgroundTransparency = 1
G.Unavailable60.BorderSizePixel = 0
G.Unavailable60.Text = "Unavailable"
G.Unavailable60.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable60.TextSize = 14
G.Unavailable60.Font = Enum.Font.FredokaOne
G.Unavailable60.TextWrapped = true
G.Unavailable60.TextScaled = true
G.Unavailable60.Visible = false
G.Unavailable60.Parent = G.Thumbnail35

G.UIStroke188 = Instance.new("UIStroke")
G.UIStroke188.Name = "UIStroke"
G.UIStroke188.Thickness = 2
G.UIStroke188.Parent = G.Unavailable60

G.Thumbnail36 = Instance.new("ImageLabel")
G.Thumbnail36.Name = "Thumbnail"
G.Thumbnail36.Size = UDim2.new(0.401091,0,1.04567,0)
G.Thumbnail36.Position = UDim2.new(0.17826,0,0.412124,0)
G.Thumbnail36.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail36.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail36.BackgroundTransparency = 1
G.Thumbnail36.BorderSizePixel = 0
G.Thumbnail36.Image = "rbxassetid://137470187003340"
G.Thumbnail36.ScaleType = Enum.ScaleType.Fit
G.Thumbnail36.ZIndex = -1
G.Thumbnail36.Rotation = 16
G.Thumbnail36.Parent = G.CanvasGroup9

G.Unavailable61 = Instance.new("TextLabel")
G.Unavailable61.Name = "Unavailable"
G.Unavailable61.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable61.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable61.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable61.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable61.BackgroundTransparency = 1
G.Unavailable61.BorderSizePixel = 0
G.Unavailable61.Text = "Unavailable"
G.Unavailable61.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable61.TextSize = 14
G.Unavailable61.Font = Enum.Font.FredokaOne
G.Unavailable61.TextWrapped = true
G.Unavailable61.TextScaled = true
G.Unavailable61.Visible = false
G.Unavailable61.Parent = G.Thumbnail36

G.UIStroke189 = Instance.new("UIStroke")
G.UIStroke189.Name = "UIStroke"
G.UIStroke189.Thickness = 2
G.UIStroke189.Parent = G.Unavailable61

G.Thumbnail37 = Instance.new("ImageLabel")
G.Thumbnail37.Name = "Thumbnail"
G.Thumbnail37.Size = UDim2.new(0.362417,0,1.03609,0)
G.Thumbnail37.Position = UDim2.new(0.369293,0,0.497652,0)
G.Thumbnail37.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail37.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail37.BackgroundTransparency = 1
G.Thumbnail37.BorderSizePixel = 0
G.Thumbnail37.Image = "rbxassetid://97463830404900"
G.Thumbnail37.ScaleType = Enum.ScaleType.Fit
G.Thumbnail37.ZIndex = 0
G.Thumbnail37.Parent = G.CanvasGroup9

G.Unavailable62 = Instance.new("TextLabel")
G.Unavailable62.Name = "Unavailable"
G.Unavailable62.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable62.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable62.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable62.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable62.BackgroundTransparency = 1
G.Unavailable62.BorderSizePixel = 0
G.Unavailable62.Text = "Unavailable"
G.Unavailable62.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable62.TextSize = 14
G.Unavailable62.Font = Enum.Font.FredokaOne
G.Unavailable62.TextWrapped = true
G.Unavailable62.TextScaled = true
G.Unavailable62.Visible = false
G.Unavailable62.Parent = G.Thumbnail37

G.UIStroke190 = Instance.new("UIStroke")
G.UIStroke190.Name = "UIStroke"
G.UIStroke190.Thickness = 2
G.UIStroke190.Parent = G.Unavailable62

G.DisplayTitle14 = Instance.new("TextLabel")
G.DisplayTitle14.Name = "DisplayTitle"
G.DisplayTitle14.Size = UDim2.new(0.28831,0,0.367128,0)
G.DisplayTitle14.Position = UDim2.new(0.814632,0,0.191717,0)
G.DisplayTitle14.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle14.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle14.BackgroundTransparency = 1
G.DisplayTitle14.BorderSizePixel = 0
G.DisplayTitle14.Text = "Dyle 14\" Deluxe Plush (Pre-Order)"
G.DisplayTitle14.TextColor3 = Color3.fromRGB(0,0,0)
G.DisplayTitle14.TextSize = 29
G.DisplayTitle14.Font = Enum.Font.Arcade
G.DisplayTitle14.TextWrapped = true
G.DisplayTitle14.TextScaled = true
G.DisplayTitle14.RichText = true
G.DisplayTitle14.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle14.Parent = G.COM_7617315135790645707

G.UIAspectRatioConstraint12 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint12.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint12.AspectRatio = 2.66
G.UIAspectRatioConstraint12.Parent = G.DisplayTitle14

G.UIGradient71 = Instance.new("UIGradient")
G.UIGradient71.Name = "UIGradient"
G.UIGradient71.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient71.Rotation = -90
G.UIGradient71.Offset = Vector2.new(0,0)
G.UIGradient71.Enabled = false
G.UIGradient71.Parent = G.DisplayTitle14

G.UIStroke191 = Instance.new("UIStroke")
G.UIStroke191.Name = "UIStroke"
G.UIStroke191.Color = Color3.fromRGB(255,255,255)
G.UIStroke191.Thickness = 0.931838
G.UIStroke191.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke191.Parent = G.DisplayTitle14

G.Item19 = Instance.new("ImageLabel")
G.Item19.Name = "Item"
G.Item19.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item19.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item19.AnchorPoint = Vector2.new(0.5,0.5)
G.Item19.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item19.BackgroundTransparency = 1
G.Item19.BorderSizePixel = 0
G.Item19.Image = "rbxassetid://94959635148921"
G.Item19.ImageRectOffset = Vector2.new(15,15)
G.Item19.ImageRectSize = Vector2.new(270,270)
G.Item19.ScaleType = Enum.ScaleType.Fit
G.Item19.Visible = false
G.Item19.ZIndex = -1
G.Item19.Parent = G.COM_7617315135790645707

G.Unavailable63 = Instance.new("TextLabel")
G.Unavailable63.Name = "Unavailable"
G.Unavailable63.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable63.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable63.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable63.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable63.BackgroundTransparency = 1
G.Unavailable63.BorderSizePixel = 0
G.Unavailable63.Text = "Unavailable"
G.Unavailable63.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable63.TextSize = 14
G.Unavailable63.Font = Enum.Font.FredokaOne
G.Unavailable63.TextWrapped = true
G.Unavailable63.TextScaled = true
G.Unavailable63.Visible = false
G.Unavailable63.Parent = G.Item19

G.UIStroke192 = Instance.new("UIStroke")
G.UIStroke192.Name = "UIStroke"
G.UIStroke192.Thickness = 2
G.UIStroke192.Parent = G.Unavailable63

G.New9 = Instance.new("ImageLabel")
G.New9.Name = "New"
G.New9.Size = UDim2.new(0.322123,0,0.355513,0)
G.New9.Position = UDim2.new(0.944127,0,0.0328983,0)
G.New9.AnchorPoint = Vector2.new(0.5,0.5)
G.New9.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New9.BackgroundTransparency = 1
G.New9.BorderSizePixel = 0
G.New9.Image = "rbxassetid://96728750855907"
G.New9.ScaleType = Enum.ScaleType.Fit
G.New9.Visible = false
G.New9.ZIndex = -1
G.New9.Parent = G.COM_7617315135790645707

G.UIScale29 = Instance.new("UIScale")
G.UIScale29.Name = "UIScale"
G.UIScale29.Parent = G.New9

G.Purchase19 = Instance.new("ImageButton")
G.Purchase19.Name = "Purchase"
G.Purchase19.Size = UDim2.new(0.299855,0,0.201102,0)
G.Purchase19.Position = UDim2.new(0.814697,0,0.786462,0)
G.Purchase19.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase19.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase19.BorderSizePixel = 0
G.Purchase19.ScaleType = Enum.ScaleType.Fit
G.Purchase19.AutoButtonColor = false
G.Purchase19.Parent = G.COM_7617315135790645707

G.Price19 = Instance.new("TextLabel")
G.Price19.Name = "Price"
G.Price19.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price19.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price19.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price19.BackgroundTransparency = 1
G.Price19.BorderSizePixel = 0
G.Price19.Text = "$19.99"
G.Price19.TextColor3 = Color3.fromRGB(255,255,255)
G.Price19.TextSize = 14
G.Price19.Font = Enum.Font.Arcade
G.Price19.TextWrapped = true
G.Price19.TextScaled = true
G.Price19.RichText = true
G.Price19.AutomaticSize = Enum.AutomaticSize.X
G.Price19.Parent = G.Purchase19

G.UIGradient72 = Instance.new("UIGradient")
G.UIGradient72.Name = "UIGradient"
G.UIGradient72.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient72.Rotation = -90
G.UIGradient72.Offset = Vector2.new(0,0)
G.UIGradient72.Parent = G.Price19

G.UIStroke193 = Instance.new("UIStroke")
G.UIStroke193.Name = "UIStroke"
G.UIStroke193.Thickness = 0.931838
G.UIStroke193.Parent = G.Price19

G.UICorner20 = Instance.new("UICorner")
G.UICorner20.Name = "UICorner"
G.UICorner20.CornerRadius = UDim.new(1,0)
G.UICorner20.Parent = G.Purchase19

G.UIGradient73 = Instance.new("UIGradient")
G.UIGradient73.Name = "UIGradient"
G.UIGradient73.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient73.Rotation = -90
G.UIGradient73.Offset = Vector2.new(0,0)
G.UIGradient73.Parent = G.Purchase19

G.UIScale30 = Instance.new("UIScale")
G.UIScale30.Name = "UIScale"
G.UIScale30.Parent = G.Purchase19

G.UIStroke194 = Instance.new("UIStroke")
G.UIStroke194.Name = "UIStroke"
G.UIStroke194.Thickness = 1.1648
G.UIStroke194.Parent = G.Purchase19

G.Thumbnail38 = Instance.new("ImageLabel")
G.Thumbnail38.Name = "Thumbnail"
G.Thumbnail38.Size = UDim2.new(0.48234,0,1.34851,0)
G.Thumbnail38.Position = UDim2.new(0.543731,0,0.39973,0)
G.Thumbnail38.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail38.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail38.BackgroundTransparency = 1
G.Thumbnail38.BorderSizePixel = 0
G.Thumbnail38.Image = "rbxassetid://122560100489294"
G.Thumbnail38.ScaleType = Enum.ScaleType.Fit
G.Thumbnail38.ZIndex = -1
G.Thumbnail38.Parent = G.COM_7617315135790645707

G.Unavailable64 = Instance.new("TextLabel")
G.Unavailable64.Name = "Unavailable"
G.Unavailable64.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable64.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable64.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable64.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable64.BackgroundTransparency = 1
G.Unavailable64.BorderSizePixel = 0
G.Unavailable64.Text = "Unavailable"
G.Unavailable64.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable64.TextSize = 14
G.Unavailable64.Font = Enum.Font.FredokaOne
G.Unavailable64.TextWrapped = true
G.Unavailable64.TextScaled = true
G.Unavailable64.Visible = false
G.Unavailable64.Parent = G.Thumbnail38

G.UIStroke195 = Instance.new("UIStroke")
G.UIStroke195.Name = "UIStroke"
G.UIStroke195.Thickness = 2
G.UIStroke195.Parent = G.Unavailable64

G.Title19 = Instance.new("TextLabel")
G.Title19.Name = "Title"
G.Title19.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title19.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title19.AnchorPoint = Vector2.new(0.5,0)
G.Title19.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title19.BackgroundTransparency = 1
G.Title19.BorderSizePixel = 0
G.Title19.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title19.TextColor3 = Color3.fromRGB(0,13,76)
G.Title19.TextSize = 29
G.Title19.Font = Enum.Font.Arcade
G.Title19.TextWrapped = true
G.Title19.TextScaled = true
G.Title19.RichText = true
G.Title19.Visible = false
G.Title19.AutomaticSize = Enum.AutomaticSize.X
G.Title19.Parent = G.COM_7617315135790645707

G.UIGradient74 = Instance.new("UIGradient")
G.UIGradient74.Name = "UIGradient"
G.UIGradient74.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient74.Rotation = -90
G.UIGradient74.Offset = Vector2.new(0,0)
G.UIGradient74.Parent = G.Title19

G.UIStroke196 = Instance.new("UIStroke")
G.UIStroke196.Name = "UIStroke"
G.UIStroke196.Color = Color3.fromRGB(255,255,255)
G.UIStroke196.Thickness = 2
G.UIStroke196.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke196.Parent = G.Title19

G.UIListLayout12 = Instance.new("UIListLayout")
G.UIListLayout12.Name = "UIListLayout"
G.UIListLayout12.Padding = UDim.new(0.019,0)
G.UIListLayout12.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout12.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout12.Wraps = false
G.UIListLayout12.Parent = G.Special11

G.Special12 = Instance.new("Frame")
G.Special12.Name = "Special"
G.Special12.Size = UDim2.new(1.10498,0,0.439953,0)
G.Special12.Position = UDim2.new(0,0,-0.143337,0)
G.Special12.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special12.BackgroundTransparency = 1
G.Special12.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special12.BorderSizePixel = 0
G.Special12.Visible = false
G.Special12.LayoutOrder = -7
G.Special12.Parent = G.ScrollingFrame

G.COM_428197939995869632 = Instance.new("Frame")
G.COM_428197939995869632.Name = "COM-428197939995869632"
G.COM_428197939995869632.Size = UDim2.new(0.437886,0,0.931112,0)
G.COM_428197939995869632.Position = UDim2.new(-2.68658e-08,0,0,0)
G.COM_428197939995869632.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_428197939995869632.BackgroundTransparency = 1
G.COM_428197939995869632.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_428197939995869632.BorderSizePixel = 0
G.COM_428197939995869632.LayoutOrder = -1
G.COM_428197939995869632.Parent = G.Special12

G.BG20 = Instance.new("Frame")
G.BG20.Name = "BG"
G.BG20.Size = UDim2.new(1,0,1,0)
G.BG20.Position = UDim2.new(0.5,0,0.5,0)
G.BG20.AnchorPoint = Vector2.new(0.5,0.5)
G.BG20.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG20.BackgroundTransparency = 1
G.BG20.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG20.BorderSizePixel = 0
G.BG20.ZIndex = -1
G.BG20.Parent = G.COM_428197939995869632

G.Dropshadow19 = Instance.new("Frame")
G.Dropshadow19.Name = "Dropshadow"
G.Dropshadow19.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow19.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow19.AnchorPoint = Vector2.new(0,1)
G.Dropshadow19.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow19.BackgroundTransparency = 0.5
G.Dropshadow19.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow19.BorderSizePixel = 0
G.Dropshadow19.ZIndex = -2
G.Dropshadow19.Parent = G.BG20

G.UIStroke197 = Instance.new("UIStroke")
G.UIStroke197.Name = "UIStroke"
G.UIStroke197.Thickness = 2.79551
G.UIStroke197.Transparency = 1
G.UIStroke197.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke197.Parent = G.Dropshadow19

G.Frame20 = Instance.new("Frame")
G.Frame20.Name = "Frame"
G.Frame20.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame20.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame20.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame20.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame20.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame20.BorderSizePixel = 0
G.Frame20.ZIndex = -1
G.Frame20.Parent = G.BG20

G.Pattern19 = Instance.new("ImageLabel")
G.Pattern19.Name = "Pattern"
G.Pattern19.Size = UDim2.new(1,0,1,0)
G.Pattern19.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern19.BackgroundTransparency = 1
G.Pattern19.BorderSizePixel = 0
G.Pattern19.Image = "rbxassetid://114373250964250"
G.Pattern19.ZIndex = -1
G.Pattern19.Parent = G.Frame20

G.UIStroke198 = Instance.new("UIStroke")
G.UIStroke198.Name = "UIStroke"
G.UIStroke198.Thickness = 1.86368
G.UIStroke198.Parent = G.Pattern19

G.UIStroke199 = Instance.new("UIStroke")
G.UIStroke199.Name = "UIStroke"
G.UIStroke199.Thickness = 1.86368
G.UIStroke199.Parent = G.Frame20

G.Highlight19 = Instance.new("Frame")
G.Highlight19.Name = "Highlight"
G.Highlight19.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight19.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight19.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight19.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight19.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight19.BorderSizePixel = 0
G.Highlight19.Visible = false
G.Highlight19.ZIndex = -2
G.Highlight19.Parent = G.BG20

G.UIStroke200 = Instance.new("UIStroke")
G.UIStroke200.Name = "UIStroke"
G.UIStroke200.Color = Color3.fromRGB(255,242,0)
G.UIStroke200.Thickness = 2.79551
G.UIStroke200.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke200.Parent = G.Highlight19

G.DisplayTitle15 = Instance.new("TextLabel")
G.DisplayTitle15.Name = "DisplayTitle"
G.DisplayTitle15.Size = UDim2.new(0.566559,0,0.435422,0)
G.DisplayTitle15.Position = UDim2.new(0.691046,0,0.15042,0)
G.DisplayTitle15.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle15.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle15.BackgroundTransparency = 1
G.DisplayTitle15.BorderSizePixel = 0
G.DisplayTitle15.Text = "Bassie 7\" Acrylic Standee (Pre-Order)"
G.DisplayTitle15.TextColor3 = Color3.fromRGB(0,13,76)
G.DisplayTitle15.TextSize = 29
G.DisplayTitle15.Font = Enum.Font.Arcade
G.DisplayTitle15.TextWrapped = true
G.DisplayTitle15.TextScaled = true
G.DisplayTitle15.RichText = true
G.DisplayTitle15.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle15.Parent = G.COM_428197939995869632

G.UIGradient75 = Instance.new("UIGradient")
G.UIGradient75.Name = "UIGradient"
G.UIGradient75.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient75.Rotation = -90
G.UIGradient75.Offset = Vector2.new(0,0)
G.UIGradient75.Parent = G.DisplayTitle15

G.UIStroke201 = Instance.new("UIStroke")
G.UIStroke201.Name = "UIStroke"
G.UIStroke201.Color = Color3.fromRGB(255,255,255)
G.UIStroke201.Thickness = 0.931838
G.UIStroke201.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke201.Parent = G.DisplayTitle15

G.Item20 = Instance.new("ImageLabel")
G.Item20.Name = "Item"
G.Item20.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item20.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item20.AnchorPoint = Vector2.new(0.5,0.5)
G.Item20.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item20.BackgroundTransparency = 1
G.Item20.BorderSizePixel = 0
G.Item20.Image = "rbxassetid://94959635148921"
G.Item20.ImageRectOffset = Vector2.new(15,15)
G.Item20.ImageRectSize = Vector2.new(270,270)
G.Item20.ScaleType = Enum.ScaleType.Fit
G.Item20.Visible = false
G.Item20.ZIndex = -1
G.Item20.Parent = G.COM_428197939995869632

G.Unavailable65 = Instance.new("TextLabel")
G.Unavailable65.Name = "Unavailable"
G.Unavailable65.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable65.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable65.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable65.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable65.BackgroundTransparency = 1
G.Unavailable65.BorderSizePixel = 0
G.Unavailable65.Text = "Unavailable"
G.Unavailable65.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable65.TextSize = 14
G.Unavailable65.Font = Enum.Font.FredokaOne
G.Unavailable65.TextWrapped = true
G.Unavailable65.TextScaled = true
G.Unavailable65.Visible = false
G.Unavailable65.Parent = G.Item20

G.UIStroke202 = Instance.new("UIStroke")
G.UIStroke202.Name = "UIStroke"
G.UIStroke202.Thickness = 2
G.UIStroke202.Parent = G.Unavailable65

G.New10 = Instance.new("ImageLabel")
G.New10.Name = "New"
G.New10.Size = UDim2.new(0.322123,0,0.355513,0)
G.New10.Position = UDim2.new(0.924293,0,0.0284983,0)
G.New10.AnchorPoint = Vector2.new(0.5,0.5)
G.New10.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New10.BackgroundTransparency = 1
G.New10.BorderSizePixel = 0
G.New10.Image = "rbxassetid://96728750855907"
G.New10.ScaleType = Enum.ScaleType.Fit
G.New10.Visible = false
G.New10.ZIndex = -1
G.New10.Parent = G.COM_428197939995869632

G.UIScale31 = Instance.new("UIScale")
G.UIScale31.Name = "UIScale"
G.UIScale31.Parent = G.New10

G.Purchase20 = Instance.new("ImageButton")
G.Purchase20.Name = "Purchase"
G.Purchase20.Size = UDim2.new(0.551281,0,0.201102,0)
G.Purchase20.Position = UDim2.new(0.681037,0,0.790057,0)
G.Purchase20.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase20.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase20.BorderSizePixel = 0
G.Purchase20.ScaleType = Enum.ScaleType.Fit
G.Purchase20.AutoButtonColor = false
G.Purchase20.Parent = G.COM_428197939995869632

G.Price20 = Instance.new("TextLabel")
G.Price20.Name = "Price"
G.Price20.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price20.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price20.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price20.BackgroundTransparency = 1
G.Price20.BorderSizePixel = 0
G.Price20.Text = "$19.99"
G.Price20.TextColor3 = Color3.fromRGB(255,255,255)
G.Price20.TextSize = 14
G.Price20.Font = Enum.Font.Arcade
G.Price20.TextWrapped = true
G.Price20.TextScaled = true
G.Price20.RichText = true
G.Price20.AutomaticSize = Enum.AutomaticSize.X
G.Price20.Parent = G.Purchase20

G.UIGradient76 = Instance.new("UIGradient")
G.UIGradient76.Name = "UIGradient"
G.UIGradient76.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient76.Rotation = -90
G.UIGradient76.Offset = Vector2.new(0,0)
G.UIGradient76.Parent = G.Price20

G.UIStroke203 = Instance.new("UIStroke")
G.UIStroke203.Name = "UIStroke"
G.UIStroke203.Thickness = 0.931838
G.UIStroke203.Parent = G.Price20

G.UICorner21 = Instance.new("UICorner")
G.UICorner21.Name = "UICorner"
G.UICorner21.CornerRadius = UDim.new(1,0)
G.UICorner21.Parent = G.Purchase20

G.UIGradient77 = Instance.new("UIGradient")
G.UIGradient77.Name = "UIGradient"
G.UIGradient77.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient77.Rotation = -90
G.UIGradient77.Offset = Vector2.new(0,0)
G.UIGradient77.Parent = G.Purchase20

G.UIScale32 = Instance.new("UIScale")
G.UIScale32.Name = "UIScale"
G.UIScale32.Parent = G.Purchase20

G.UIStroke204 = Instance.new("UIStroke")
G.UIStroke204.Name = "UIStroke"
G.UIStroke204.Thickness = 1.1648
G.UIStroke204.Parent = G.Purchase20

G.Thumbnail39 = Instance.new("ImageLabel")
G.Thumbnail39.Name = "Thumbnail"
G.Thumbnail39.Size = UDim2.new(0.593809,0,1.5481,0)
G.Thumbnail39.Position = UDim2.new(0.234728,0,0.432111,0)
G.Thumbnail39.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail39.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail39.BackgroundTransparency = 1
G.Thumbnail39.BorderSizePixel = 0
G.Thumbnail39.Image = "rbxassetid://73534469542594"
G.Thumbnail39.ScaleType = Enum.ScaleType.Fit
G.Thumbnail39.ZIndex = -1
G.Thumbnail39.Parent = G.COM_428197939995869632

G.Unavailable66 = Instance.new("TextLabel")
G.Unavailable66.Name = "Unavailable"
G.Unavailable66.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable66.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable66.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable66.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable66.BackgroundTransparency = 1
G.Unavailable66.BorderSizePixel = 0
G.Unavailable66.Text = "Unavailable"
G.Unavailable66.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable66.TextSize = 14
G.Unavailable66.Font = Enum.Font.FredokaOne
G.Unavailable66.TextWrapped = true
G.Unavailable66.TextScaled = true
G.Unavailable66.Visible = false
G.Unavailable66.Parent = G.Thumbnail39

G.UIStroke205 = Instance.new("UIStroke")
G.UIStroke205.Name = "UIStroke"
G.UIStroke205.Thickness = 2
G.UIStroke205.Parent = G.Unavailable66

G.Title20 = Instance.new("TextLabel")
G.Title20.Name = "Title"
G.Title20.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title20.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title20.AnchorPoint = Vector2.new(0.5,0)
G.Title20.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title20.BackgroundTransparency = 1
G.Title20.BorderSizePixel = 0
G.Title20.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title20.TextColor3 = Color3.fromRGB(0,13,76)
G.Title20.TextSize = 29
G.Title20.Font = Enum.Font.Arcade
G.Title20.TextWrapped = true
G.Title20.TextScaled = true
G.Title20.RichText = true
G.Title20.Visible = false
G.Title20.AutomaticSize = Enum.AutomaticSize.X
G.Title20.Parent = G.COM_428197939995869632

G.UIGradient78 = Instance.new("UIGradient")
G.UIGradient78.Name = "UIGradient"
G.UIGradient78.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient78.Rotation = -90
G.UIGradient78.Offset = Vector2.new(0,0)
G.UIGradient78.Parent = G.Title20

G.UIStroke206 = Instance.new("UIStroke")
G.UIStroke206.Name = "UIStroke"
G.UIStroke206.Color = Color3.fromRGB(255,255,255)
G.UIStroke206.Thickness = 2
G.UIStroke206.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke206.Parent = G.Title20

G.COM_7297313271642718640 = Instance.new("Frame")
G.COM_7297313271642718640.Name = "COM-7297313271642718640"
G.COM_7297313271642718640.Size = UDim2.new(0.437886,0,0.931112,0)
G.COM_7297313271642718640.Position = UDim2.new(-2.68658e-08,0,0,0)
G.COM_7297313271642718640.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_7297313271642718640.BackgroundTransparency = 1
G.COM_7297313271642718640.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_7297313271642718640.BorderSizePixel = 0
G.COM_7297313271642718640.Parent = G.Special12

G.BG21 = Instance.new("Frame")
G.BG21.Name = "BG"
G.BG21.Size = UDim2.new(1,0,1,0)
G.BG21.Position = UDim2.new(0.5,0,0.5,0)
G.BG21.AnchorPoint = Vector2.new(0.5,0.5)
G.BG21.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG21.BackgroundTransparency = 1
G.BG21.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG21.BorderSizePixel = 0
G.BG21.ZIndex = -1
G.BG21.Parent = G.COM_7297313271642718640

G.Dropshadow20 = Instance.new("Frame")
G.Dropshadow20.Name = "Dropshadow"
G.Dropshadow20.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow20.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow20.AnchorPoint = Vector2.new(0,1)
G.Dropshadow20.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow20.BackgroundTransparency = 0.5
G.Dropshadow20.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow20.BorderSizePixel = 0
G.Dropshadow20.ZIndex = -2
G.Dropshadow20.Parent = G.BG21

G.UIStroke207 = Instance.new("UIStroke")
G.UIStroke207.Name = "UIStroke"
G.UIStroke207.Thickness = 2.79551
G.UIStroke207.Transparency = 1
G.UIStroke207.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke207.Parent = G.Dropshadow20

G.Frame21 = Instance.new("Frame")
G.Frame21.Name = "Frame"
G.Frame21.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame21.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame21.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame21.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame21.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame21.BorderSizePixel = 0
G.Frame21.ZIndex = -1
G.Frame21.Parent = G.BG21

G.Pattern20 = Instance.new("ImageLabel")
G.Pattern20.Name = "Pattern"
G.Pattern20.Size = UDim2.new(1,0,1,0)
G.Pattern20.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern20.BackgroundTransparency = 1
G.Pattern20.BorderSizePixel = 0
G.Pattern20.Image = "rbxassetid://114373250964250"
G.Pattern20.ZIndex = -1
G.Pattern20.Parent = G.Frame21

G.UIStroke208 = Instance.new("UIStroke")
G.UIStroke208.Name = "UIStroke"
G.UIStroke208.Thickness = 1.86368
G.UIStroke208.Parent = G.Pattern20

G.UIStroke209 = Instance.new("UIStroke")
G.UIStroke209.Name = "UIStroke"
G.UIStroke209.Thickness = 1.86368
G.UIStroke209.Parent = G.Frame21

G.Highlight20 = Instance.new("Frame")
G.Highlight20.Name = "Highlight"
G.Highlight20.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight20.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight20.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight20.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight20.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight20.BorderSizePixel = 0
G.Highlight20.Visible = false
G.Highlight20.ZIndex = -2
G.Highlight20.Parent = G.BG21

G.UIStroke210 = Instance.new("UIStroke")
G.UIStroke210.Name = "UIStroke"
G.UIStroke210.Color = Color3.fromRGB(255,242,0)
G.UIStroke210.Thickness = 2.79551
G.UIStroke210.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke210.Parent = G.Highlight20

G.DisplayTitle16 = Instance.new("TextLabel")
G.DisplayTitle16.Name = "DisplayTitle"
G.DisplayTitle16.Size = UDim2.new(0.566559,0,0.435422,0)
G.DisplayTitle16.Position = UDim2.new(0.691046,0,0.15042,0)
G.DisplayTitle16.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle16.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle16.BackgroundTransparency = 1
G.DisplayTitle16.BorderSizePixel = 0
G.DisplayTitle16.Text = "Cocoa 7\" Acrylic Standee (Pre-Order)"
G.DisplayTitle16.TextColor3 = Color3.fromRGB(0,13,76)
G.DisplayTitle16.TextSize = 29
G.DisplayTitle16.Font = Enum.Font.Arcade
G.DisplayTitle16.TextWrapped = true
G.DisplayTitle16.TextScaled = true
G.DisplayTitle16.RichText = true
G.DisplayTitle16.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle16.Parent = G.COM_7297313271642718640

G.UIGradient79 = Instance.new("UIGradient")
G.UIGradient79.Name = "UIGradient"
G.UIGradient79.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient79.Rotation = -90
G.UIGradient79.Offset = Vector2.new(0,0)
G.UIGradient79.Parent = G.DisplayTitle16

G.UIStroke211 = Instance.new("UIStroke")
G.UIStroke211.Name = "UIStroke"
G.UIStroke211.Color = Color3.fromRGB(255,255,255)
G.UIStroke211.Thickness = 0.931838
G.UIStroke211.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke211.Parent = G.DisplayTitle16

G.Item21 = Instance.new("ImageLabel")
G.Item21.Name = "Item"
G.Item21.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item21.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item21.AnchorPoint = Vector2.new(0.5,0.5)
G.Item21.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item21.BackgroundTransparency = 1
G.Item21.BorderSizePixel = 0
G.Item21.Image = "rbxassetid://94959635148921"
G.Item21.ImageRectOffset = Vector2.new(15,15)
G.Item21.ImageRectSize = Vector2.new(270,270)
G.Item21.ScaleType = Enum.ScaleType.Fit
G.Item21.Visible = false
G.Item21.ZIndex = -1
G.Item21.Parent = G.COM_7297313271642718640

G.Unavailable67 = Instance.new("TextLabel")
G.Unavailable67.Name = "Unavailable"
G.Unavailable67.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable67.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable67.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable67.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable67.BackgroundTransparency = 1
G.Unavailable67.BorderSizePixel = 0
G.Unavailable67.Text = "Unavailable"
G.Unavailable67.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable67.TextSize = 14
G.Unavailable67.Font = Enum.Font.FredokaOne
G.Unavailable67.TextWrapped = true
G.Unavailable67.TextScaled = true
G.Unavailable67.Visible = false
G.Unavailable67.Parent = G.Item21

G.UIStroke212 = Instance.new("UIStroke")
G.UIStroke212.Name = "UIStroke"
G.UIStroke212.Thickness = 2
G.UIStroke212.Parent = G.Unavailable67

G.New11 = Instance.new("ImageLabel")
G.New11.Name = "New"
G.New11.Size = UDim2.new(0.322123,0,0.355513,0)
G.New11.Position = UDim2.new(0.924293,0,0.0284983,0)
G.New11.AnchorPoint = Vector2.new(0.5,0.5)
G.New11.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New11.BackgroundTransparency = 1
G.New11.BorderSizePixel = 0
G.New11.Image = "rbxassetid://96728750855907"
G.New11.ScaleType = Enum.ScaleType.Fit
G.New11.Visible = false
G.New11.ZIndex = -1
G.New11.Parent = G.COM_7297313271642718640

G.UIScale33 = Instance.new("UIScale")
G.UIScale33.Name = "UIScale"
G.UIScale33.Parent = G.New11

G.Purchase21 = Instance.new("ImageButton")
G.Purchase21.Name = "Purchase"
G.Purchase21.Size = UDim2.new(0.551281,0,0.201102,0)
G.Purchase21.Position = UDim2.new(0.681037,0,0.790057,0)
G.Purchase21.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase21.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase21.BorderSizePixel = 0
G.Purchase21.ScaleType = Enum.ScaleType.Fit
G.Purchase21.AutoButtonColor = false
G.Purchase21.Parent = G.COM_7297313271642718640

G.Price21 = Instance.new("TextLabel")
G.Price21.Name = "Price"
G.Price21.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price21.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price21.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price21.BackgroundTransparency = 1
G.Price21.BorderSizePixel = 0
G.Price21.Text = "$19.99"
G.Price21.TextColor3 = Color3.fromRGB(255,255,255)
G.Price21.TextSize = 14
G.Price21.Font = Enum.Font.Arcade
G.Price21.TextWrapped = true
G.Price21.TextScaled = true
G.Price21.RichText = true
G.Price21.AutomaticSize = Enum.AutomaticSize.X
G.Price21.Parent = G.Purchase21

G.UIGradient80 = Instance.new("UIGradient")
G.UIGradient80.Name = "UIGradient"
G.UIGradient80.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient80.Rotation = -90
G.UIGradient80.Offset = Vector2.new(0,0)
G.UIGradient80.Parent = G.Price21

G.UIStroke213 = Instance.new("UIStroke")
G.UIStroke213.Name = "UIStroke"
G.UIStroke213.Thickness = 0.931838
G.UIStroke213.Parent = G.Price21

G.UICorner22 = Instance.new("UICorner")
G.UICorner22.Name = "UICorner"
G.UICorner22.CornerRadius = UDim.new(1,0)
G.UICorner22.Parent = G.Purchase21

G.UIGradient81 = Instance.new("UIGradient")
G.UIGradient81.Name = "UIGradient"
G.UIGradient81.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient81.Rotation = -90
G.UIGradient81.Offset = Vector2.new(0,0)
G.UIGradient81.Parent = G.Purchase21

G.UIScale34 = Instance.new("UIScale")
G.UIScale34.Name = "UIScale"
G.UIScale34.Parent = G.Purchase21

G.UIStroke214 = Instance.new("UIStroke")
G.UIStroke214.Name = "UIStroke"
G.UIStroke214.Thickness = 1.1648
G.UIStroke214.Parent = G.Purchase21

G.Thumbnail40 = Instance.new("ImageLabel")
G.Thumbnail40.Name = "Thumbnail"
G.Thumbnail40.Size = UDim2.new(0.593809,0,1.5481,0)
G.Thumbnail40.Position = UDim2.new(0.251161,0,0.432111,0)
G.Thumbnail40.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail40.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail40.BackgroundTransparency = 1
G.Thumbnail40.BorderSizePixel = 0
G.Thumbnail40.Image = "rbxassetid://75549965624731"
G.Thumbnail40.ScaleType = Enum.ScaleType.Fit
G.Thumbnail40.ZIndex = -1
G.Thumbnail40.Parent = G.COM_7297313271642718640

G.Unavailable68 = Instance.new("TextLabel")
G.Unavailable68.Name = "Unavailable"
G.Unavailable68.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable68.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable68.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable68.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable68.BackgroundTransparency = 1
G.Unavailable68.BorderSizePixel = 0
G.Unavailable68.Text = "Unavailable"
G.Unavailable68.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable68.TextSize = 14
G.Unavailable68.Font = Enum.Font.FredokaOne
G.Unavailable68.TextWrapped = true
G.Unavailable68.TextScaled = true
G.Unavailable68.Visible = false
G.Unavailable68.Parent = G.Thumbnail40

G.UIStroke215 = Instance.new("UIStroke")
G.UIStroke215.Name = "UIStroke"
G.UIStroke215.Thickness = 2
G.UIStroke215.Parent = G.Unavailable68

G.Title21 = Instance.new("TextLabel")
G.Title21.Name = "Title"
G.Title21.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title21.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title21.AnchorPoint = Vector2.new(0.5,0)
G.Title21.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title21.BackgroundTransparency = 1
G.Title21.BorderSizePixel = 0
G.Title21.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title21.TextColor3 = Color3.fromRGB(0,13,76)
G.Title21.TextSize = 29
G.Title21.Font = Enum.Font.Arcade
G.Title21.TextWrapped = true
G.Title21.TextScaled = true
G.Title21.RichText = true
G.Title21.Visible = false
G.Title21.AutomaticSize = Enum.AutomaticSize.X
G.Title21.Parent = G.COM_7297313271642718640

G.UIGradient82 = Instance.new("UIGradient")
G.UIGradient82.Name = "UIGradient"
G.UIGradient82.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient82.Rotation = -90
G.UIGradient82.Offset = Vector2.new(0,0)
G.UIGradient82.Parent = G.Title21

G.UIStroke216 = Instance.new("UIStroke")
G.UIStroke216.Name = "UIStroke"
G.UIStroke216.Color = Color3.fromRGB(255,255,255)
G.UIStroke216.Thickness = 2
G.UIStroke216.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke216.Parent = G.Title21

G.UIListLayout13 = Instance.new("UIListLayout")
G.UIListLayout13.Name = "UIListLayout"
G.UIListLayout13.Padding = UDim.new(0.019,0)
G.UIListLayout13.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout13.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout13.Wraps = false
G.UIListLayout13.Parent = G.Special12

G.Special13 = Instance.new("Frame")
G.Special13.Name = "Special"
G.Special13.Size = UDim2.new(1.10498,0,0.439953,0)
G.Special13.Position = UDim2.new(0,0,-0.143337,0)
G.Special13.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special13.BackgroundTransparency = 1
G.Special13.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special13.BorderSizePixel = 0
G.Special13.LayoutOrder = -7
G.Special13.Parent = G.ScrollingFrame

G.COM_5579260382545052095 = Instance.new("Frame")
G.COM_5579260382545052095.Name = "COM-5579260382545052095"
G.COM_5579260382545052095.Size = UDim2.new(0.437886,0,0.931112,0)
G.COM_5579260382545052095.Position = UDim2.new(-2.68658e-08,0,0,0)
G.COM_5579260382545052095.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_5579260382545052095.BackgroundTransparency = 1
G.COM_5579260382545052095.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_5579260382545052095.BorderSizePixel = 0
G.COM_5579260382545052095.LayoutOrder = -1
G.COM_5579260382545052095.Parent = G.Special13

G.BG22 = Instance.new("Frame")
G.BG22.Name = "BG"
G.BG22.Size = UDim2.new(1,0,1,0)
G.BG22.Position = UDim2.new(0.5,0,0.5,0)
G.BG22.AnchorPoint = Vector2.new(0.5,0.5)
G.BG22.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG22.BackgroundTransparency = 1
G.BG22.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG22.BorderSizePixel = 0
G.BG22.ZIndex = -1
G.BG22.Parent = G.COM_5579260382545052095

G.Dropshadow21 = Instance.new("Frame")
G.Dropshadow21.Name = "Dropshadow"
G.Dropshadow21.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow21.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow21.AnchorPoint = Vector2.new(0,1)
G.Dropshadow21.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow21.BackgroundTransparency = 0.5
G.Dropshadow21.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow21.BorderSizePixel = 0
G.Dropshadow21.ZIndex = -2
G.Dropshadow21.Parent = G.BG22

G.UIStroke217 = Instance.new("UIStroke")
G.UIStroke217.Name = "UIStroke"
G.UIStroke217.Thickness = 2.79551
G.UIStroke217.Transparency = 1
G.UIStroke217.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke217.Parent = G.Dropshadow21

G.Frame22 = Instance.new("Frame")
G.Frame22.Name = "Frame"
G.Frame22.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame22.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame22.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame22.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame22.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame22.BorderSizePixel = 0
G.Frame22.ZIndex = -1
G.Frame22.Parent = G.BG22

G.Pattern21 = Instance.new("ImageLabel")
G.Pattern21.Name = "Pattern"
G.Pattern21.Size = UDim2.new(1,0,1,0)
G.Pattern21.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern21.BackgroundTransparency = 1
G.Pattern21.BorderSizePixel = 0
G.Pattern21.Image = "rbxassetid://114373250964250"
G.Pattern21.ZIndex = -1
G.Pattern21.Parent = G.Frame22

G.UIStroke218 = Instance.new("UIStroke")
G.UIStroke218.Name = "UIStroke"
G.UIStroke218.Thickness = 1.86368
G.UIStroke218.Parent = G.Pattern21

G.UIStroke219 = Instance.new("UIStroke")
G.UIStroke219.Name = "UIStroke"
G.UIStroke219.Thickness = 1.86368
G.UIStroke219.Parent = G.Frame22

G.Highlight21 = Instance.new("Frame")
G.Highlight21.Name = "Highlight"
G.Highlight21.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight21.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight21.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight21.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight21.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight21.BorderSizePixel = 0
G.Highlight21.Visible = false
G.Highlight21.ZIndex = -2
G.Highlight21.Parent = G.BG22

G.UIStroke220 = Instance.new("UIStroke")
G.UIStroke220.Name = "UIStroke"
G.UIStroke220.Color = Color3.fromRGB(255,242,0)
G.UIStroke220.Thickness = 2.79551
G.UIStroke220.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke220.Parent = G.Highlight21

G.DisplayTitle17 = Instance.new("TextLabel")
G.DisplayTitle17.Name = "DisplayTitle"
G.DisplayTitle17.Size = UDim2.new(0.566559,0,0.435422,0)
G.DisplayTitle17.Position = UDim2.new(0.691046,0,0.15042,0)
G.DisplayTitle17.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle17.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle17.BackgroundTransparency = 1
G.DisplayTitle17.BorderSizePixel = 0
G.DisplayTitle17.Text = "Easter Enamel Pin Set (Pre-Order)"
G.DisplayTitle17.TextColor3 = Color3.fromRGB(0,13,76)
G.DisplayTitle17.TextSize = 29
G.DisplayTitle17.Font = Enum.Font.Arcade
G.DisplayTitle17.TextWrapped = true
G.DisplayTitle17.TextScaled = true
G.DisplayTitle17.RichText = true
G.DisplayTitle17.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle17.Parent = G.COM_5579260382545052095

G.UIGradient83 = Instance.new("UIGradient")
G.UIGradient83.Name = "UIGradient"
G.UIGradient83.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient83.Rotation = -90
G.UIGradient83.Offset = Vector2.new(0,0)
G.UIGradient83.Parent = G.DisplayTitle17

G.UIStroke221 = Instance.new("UIStroke")
G.UIStroke221.Name = "UIStroke"
G.UIStroke221.Color = Color3.fromRGB(255,255,255)
G.UIStroke221.Thickness = 0.931838
G.UIStroke221.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke221.Parent = G.DisplayTitle17

G.Item22 = Instance.new("ImageLabel")
G.Item22.Name = "Item"
G.Item22.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item22.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item22.AnchorPoint = Vector2.new(0.5,0.5)
G.Item22.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item22.BackgroundTransparency = 1
G.Item22.BorderSizePixel = 0
G.Item22.Image = "rbxassetid://94959635148921"
G.Item22.ImageRectOffset = Vector2.new(15,15)
G.Item22.ImageRectSize = Vector2.new(270,270)
G.Item22.ScaleType = Enum.ScaleType.Fit
G.Item22.Visible = false
G.Item22.ZIndex = -1
G.Item22.Parent = G.COM_5579260382545052095

G.Unavailable69 = Instance.new("TextLabel")
G.Unavailable69.Name = "Unavailable"
G.Unavailable69.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable69.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable69.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable69.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable69.BackgroundTransparency = 1
G.Unavailable69.BorderSizePixel = 0
G.Unavailable69.Text = "Unavailable"
G.Unavailable69.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable69.TextSize = 14
G.Unavailable69.Font = Enum.Font.FredokaOne
G.Unavailable69.TextWrapped = true
G.Unavailable69.TextScaled = true
G.Unavailable69.Visible = false
G.Unavailable69.Parent = G.Item22

G.UIStroke222 = Instance.new("UIStroke")
G.UIStroke222.Name = "UIStroke"
G.UIStroke222.Thickness = 2
G.UIStroke222.Parent = G.Unavailable69

G.New12 = Instance.new("ImageLabel")
G.New12.Name = "New"
G.New12.Size = UDim2.new(0.322123,0,0.355513,0)
G.New12.Position = UDim2.new(0.924293,0,0.0284983,0)
G.New12.AnchorPoint = Vector2.new(0.5,0.5)
G.New12.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New12.BackgroundTransparency = 1
G.New12.BorderSizePixel = 0
G.New12.Image = "rbxassetid://96728750855907"
G.New12.ScaleType = Enum.ScaleType.Fit
G.New12.Visible = false
G.New12.ZIndex = -1
G.New12.Parent = G.COM_5579260382545052095

G.UIScale35 = Instance.new("UIScale")
G.UIScale35.Name = "UIScale"
G.UIScale35.Parent = G.New12

G.Purchase22 = Instance.new("ImageButton")
G.Purchase22.Name = "Purchase"
G.Purchase22.Size = UDim2.new(0.551281,0,0.201102,0)
G.Purchase22.Position = UDim2.new(0.681037,0,0.790057,0)
G.Purchase22.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase22.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase22.BorderSizePixel = 0
G.Purchase22.ScaleType = Enum.ScaleType.Fit
G.Purchase22.AutoButtonColor = false
G.Purchase22.Parent = G.COM_5579260382545052095

G.Price22 = Instance.new("TextLabel")
G.Price22.Name = "Price"
G.Price22.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price22.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price22.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price22.BackgroundTransparency = 1
G.Price22.BorderSizePixel = 0
G.Price22.Text = "$19.99"
G.Price22.TextColor3 = Color3.fromRGB(255,255,255)
G.Price22.TextSize = 14
G.Price22.Font = Enum.Font.Arcade
G.Price22.TextWrapped = true
G.Price22.TextScaled = true
G.Price22.RichText = true
G.Price22.AutomaticSize = Enum.AutomaticSize.X
G.Price22.Parent = G.Purchase22

G.UIGradient84 = Instance.new("UIGradient")
G.UIGradient84.Name = "UIGradient"
G.UIGradient84.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient84.Rotation = -90
G.UIGradient84.Offset = Vector2.new(0,0)
G.UIGradient84.Parent = G.Price22

G.UIStroke223 = Instance.new("UIStroke")
G.UIStroke223.Name = "UIStroke"
G.UIStroke223.Thickness = 0.931838
G.UIStroke223.Parent = G.Price22

G.UICorner23 = Instance.new("UICorner")
G.UICorner23.Name = "UICorner"
G.UICorner23.CornerRadius = UDim.new(1,0)
G.UICorner23.Parent = G.Purchase22

G.UIGradient85 = Instance.new("UIGradient")
G.UIGradient85.Name = "UIGradient"
G.UIGradient85.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient85.Rotation = -90
G.UIGradient85.Offset = Vector2.new(0,0)
G.UIGradient85.Parent = G.Purchase22

G.UIScale36 = Instance.new("UIScale")
G.UIScale36.Name = "UIScale"
G.UIScale36.Parent = G.Purchase22

G.UIStroke224 = Instance.new("UIStroke")
G.UIStroke224.Name = "UIStroke"
G.UIStroke224.Thickness = 1.1648
G.UIStroke224.Parent = G.Purchase22

G.Thumbnail41 = Instance.new("ImageLabel")
G.Thumbnail41.Name = "Thumbnail"
G.Thumbnail41.Size = UDim2.new(0.593809,0,1.5481,0)
G.Thumbnail41.Position = UDim2.new(0.234728,0,0.432111,0)
G.Thumbnail41.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail41.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail41.BackgroundTransparency = 1
G.Thumbnail41.BorderSizePixel = 0
G.Thumbnail41.Image = "rbxassetid://81530640944625"
G.Thumbnail41.ScaleType = Enum.ScaleType.Fit
G.Thumbnail41.ZIndex = -1
G.Thumbnail41.Parent = G.COM_5579260382545052095

G.Unavailable70 = Instance.new("TextLabel")
G.Unavailable70.Name = "Unavailable"
G.Unavailable70.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable70.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable70.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable70.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable70.BackgroundTransparency = 1
G.Unavailable70.BorderSizePixel = 0
G.Unavailable70.Text = "Unavailable"
G.Unavailable70.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable70.TextSize = 14
G.Unavailable70.Font = Enum.Font.FredokaOne
G.Unavailable70.TextWrapped = true
G.Unavailable70.TextScaled = true
G.Unavailable70.Visible = false
G.Unavailable70.Parent = G.Thumbnail41

G.UIStroke225 = Instance.new("UIStroke")
G.UIStroke225.Name = "UIStroke"
G.UIStroke225.Thickness = 2
G.UIStroke225.Parent = G.Unavailable70

G.Title22 = Instance.new("TextLabel")
G.Title22.Name = "Title"
G.Title22.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title22.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title22.AnchorPoint = Vector2.new(0.5,0)
G.Title22.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title22.BackgroundTransparency = 1
G.Title22.BorderSizePixel = 0
G.Title22.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title22.TextColor3 = Color3.fromRGB(0,13,76)
G.Title22.TextSize = 29
G.Title22.Font = Enum.Font.Arcade
G.Title22.TextWrapped = true
G.Title22.TextScaled = true
G.Title22.RichText = true
G.Title22.Visible = false
G.Title22.AutomaticSize = Enum.AutomaticSize.X
G.Title22.Parent = G.COM_5579260382545052095

G.UIGradient86 = Instance.new("UIGradient")
G.UIGradient86.Name = "UIGradient"
G.UIGradient86.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient86.Rotation = -90
G.UIGradient86.Offset = Vector2.new(0,0)
G.UIGradient86.Parent = G.Title22

G.UIStroke226 = Instance.new("UIStroke")
G.UIStroke226.Name = "UIStroke"
G.UIStroke226.Color = Color3.fromRGB(255,255,255)
G.UIStroke226.Thickness = 2
G.UIStroke226.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke226.Parent = G.Title22

G.COM_4722159905669251524 = Instance.new("Frame")
G.COM_4722159905669251524.Name = "COM-4722159905669251524"
G.COM_4722159905669251524.Size = UDim2.new(0.437886,0,0.931112,0)
G.COM_4722159905669251524.Position = UDim2.new(-2.68658e-08,0,0,0)
G.COM_4722159905669251524.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_4722159905669251524.BackgroundTransparency = 1
G.COM_4722159905669251524.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_4722159905669251524.BorderSizePixel = 0
G.COM_4722159905669251524.Parent = G.Special13

G.BG23 = Instance.new("Frame")
G.BG23.Name = "BG"
G.BG23.Size = UDim2.new(1,0,1,0)
G.BG23.Position = UDim2.new(0.5,0,0.5,0)
G.BG23.AnchorPoint = Vector2.new(0.5,0.5)
G.BG23.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG23.BackgroundTransparency = 1
G.BG23.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG23.BorderSizePixel = 0
G.BG23.ZIndex = -1
G.BG23.Parent = G.COM_4722159905669251524

G.Dropshadow22 = Instance.new("Frame")
G.Dropshadow22.Name = "Dropshadow"
G.Dropshadow22.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow22.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow22.AnchorPoint = Vector2.new(0,1)
G.Dropshadow22.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow22.BackgroundTransparency = 0.5
G.Dropshadow22.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow22.BorderSizePixel = 0
G.Dropshadow22.ZIndex = -2
G.Dropshadow22.Parent = G.BG23

G.UIStroke227 = Instance.new("UIStroke")
G.UIStroke227.Name = "UIStroke"
G.UIStroke227.Thickness = 2.79551
G.UIStroke227.Transparency = 1
G.UIStroke227.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke227.Parent = G.Dropshadow22

G.Frame23 = Instance.new("Frame")
G.Frame23.Name = "Frame"
G.Frame23.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame23.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame23.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame23.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame23.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame23.BorderSizePixel = 0
G.Frame23.ZIndex = -1
G.Frame23.Parent = G.BG23

G.Pattern22 = Instance.new("ImageLabel")
G.Pattern22.Name = "Pattern"
G.Pattern22.Size = UDim2.new(1,0,1,0)
G.Pattern22.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern22.BackgroundTransparency = 1
G.Pattern22.BorderSizePixel = 0
G.Pattern22.Image = "rbxassetid://114373250964250"
G.Pattern22.ZIndex = -1
G.Pattern22.Parent = G.Frame23

G.UIStroke228 = Instance.new("UIStroke")
G.UIStroke228.Name = "UIStroke"
G.UIStroke228.Thickness = 1.86368
G.UIStroke228.Parent = G.Pattern22

G.UIStroke229 = Instance.new("UIStroke")
G.UIStroke229.Name = "UIStroke"
G.UIStroke229.Thickness = 1.86368
G.UIStroke229.Parent = G.Frame23

G.Highlight22 = Instance.new("Frame")
G.Highlight22.Name = "Highlight"
G.Highlight22.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight22.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight22.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight22.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight22.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight22.BorderSizePixel = 0
G.Highlight22.Visible = false
G.Highlight22.ZIndex = -2
G.Highlight22.Parent = G.BG23

G.UIStroke230 = Instance.new("UIStroke")
G.UIStroke230.Name = "UIStroke"
G.UIStroke230.Color = Color3.fromRGB(255,242,0)
G.UIStroke230.Thickness = 2.79551
G.UIStroke230.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke230.Parent = G.Highlight22

G.DisplayTitle18 = Instance.new("TextLabel")
G.DisplayTitle18.Name = "DisplayTitle"
G.DisplayTitle18.Size = UDim2.new(0.566559,0,0.435422,0)
G.DisplayTitle18.Position = UDim2.new(0.691046,0,0.15042,0)
G.DisplayTitle18.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle18.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle18.BackgroundTransparency = 1
G.DisplayTitle18.BorderSizePixel = 0
G.DisplayTitle18.Text = "Bassie 14\" Deluxe Plush (Pre-Order)"
G.DisplayTitle18.TextColor3 = Color3.fromRGB(0,13,76)
G.DisplayTitle18.TextSize = 29
G.DisplayTitle18.Font = Enum.Font.Arcade
G.DisplayTitle18.TextWrapped = true
G.DisplayTitle18.TextScaled = true
G.DisplayTitle18.RichText = true
G.DisplayTitle18.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle18.Parent = G.COM_4722159905669251524

G.UIGradient87 = Instance.new("UIGradient")
G.UIGradient87.Name = "UIGradient"
G.UIGradient87.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient87.Rotation = -90
G.UIGradient87.Offset = Vector2.new(0,0)
G.UIGradient87.Parent = G.DisplayTitle18

G.UIStroke231 = Instance.new("UIStroke")
G.UIStroke231.Name = "UIStroke"
G.UIStroke231.Color = Color3.fromRGB(255,255,255)
G.UIStroke231.Thickness = 0.931838
G.UIStroke231.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke231.Parent = G.DisplayTitle18

G.Item23 = Instance.new("ImageLabel")
G.Item23.Name = "Item"
G.Item23.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item23.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item23.AnchorPoint = Vector2.new(0.5,0.5)
G.Item23.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item23.BackgroundTransparency = 1
G.Item23.BorderSizePixel = 0
G.Item23.Image = "rbxassetid://94959635148921"
G.Item23.ImageRectOffset = Vector2.new(15,15)
G.Item23.ImageRectSize = Vector2.new(270,270)
G.Item23.ScaleType = Enum.ScaleType.Fit
G.Item23.Visible = false
G.Item23.ZIndex = -1
G.Item23.Parent = G.COM_4722159905669251524

G.Unavailable71 = Instance.new("TextLabel")
G.Unavailable71.Name = "Unavailable"
G.Unavailable71.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable71.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable71.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable71.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable71.BackgroundTransparency = 1
G.Unavailable71.BorderSizePixel = 0
G.Unavailable71.Text = "Unavailable"
G.Unavailable71.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable71.TextSize = 14
G.Unavailable71.Font = Enum.Font.FredokaOne
G.Unavailable71.TextWrapped = true
G.Unavailable71.TextScaled = true
G.Unavailable71.Visible = false
G.Unavailable71.Parent = G.Item23

G.UIStroke232 = Instance.new("UIStroke")
G.UIStroke232.Name = "UIStroke"
G.UIStroke232.Thickness = 2
G.UIStroke232.Parent = G.Unavailable71

G.Purchase23 = Instance.new("ImageButton")
G.Purchase23.Name = "Purchase"
G.Purchase23.Size = UDim2.new(0.551281,0,0.201102,0)
G.Purchase23.Position = UDim2.new(0.681037,0,0.790057,0)
G.Purchase23.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase23.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase23.BorderSizePixel = 0
G.Purchase23.ScaleType = Enum.ScaleType.Fit
G.Purchase23.AutoButtonColor = false
G.Purchase23.Parent = G.COM_4722159905669251524

G.Price23 = Instance.new("TextLabel")
G.Price23.Name = "Price"
G.Price23.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price23.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price23.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price23.BackgroundTransparency = 1
G.Price23.BorderSizePixel = 0
G.Price23.Text = "$19.99"
G.Price23.TextColor3 = Color3.fromRGB(255,255,255)
G.Price23.TextSize = 14
G.Price23.Font = Enum.Font.Arcade
G.Price23.TextWrapped = true
G.Price23.TextScaled = true
G.Price23.RichText = true
G.Price23.AutomaticSize = Enum.AutomaticSize.X
G.Price23.Parent = G.Purchase23

G.UIGradient88 = Instance.new("UIGradient")
G.UIGradient88.Name = "UIGradient"
G.UIGradient88.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient88.Rotation = -90
G.UIGradient88.Offset = Vector2.new(0,0)
G.UIGradient88.Parent = G.Price23

G.UIStroke233 = Instance.new("UIStroke")
G.UIStroke233.Name = "UIStroke"
G.UIStroke233.Thickness = 0.931838
G.UIStroke233.Parent = G.Price23

G.UICorner24 = Instance.new("UICorner")
G.UICorner24.Name = "UICorner"
G.UICorner24.CornerRadius = UDim.new(1,0)
G.UICorner24.Parent = G.Purchase23

G.UIGradient89 = Instance.new("UIGradient")
G.UIGradient89.Name = "UIGradient"
G.UIGradient89.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient89.Rotation = -90
G.UIGradient89.Offset = Vector2.new(0,0)
G.UIGradient89.Parent = G.Purchase23

G.UIScale37 = Instance.new("UIScale")
G.UIScale37.Name = "UIScale"
G.UIScale37.Parent = G.Purchase23

G.UIStroke234 = Instance.new("UIStroke")
G.UIStroke234.Name = "UIStroke"
G.UIStroke234.Thickness = 1.1648
G.UIStroke234.Parent = G.Purchase23

G.Thumbnail42 = Instance.new("ImageLabel")
G.Thumbnail42.Name = "Thumbnail"
G.Thumbnail42.Size = UDim2.new(0.593809,0,1.5481,0)
G.Thumbnail42.Position = UDim2.new(0.251161,0,0.432111,0)
G.Thumbnail42.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail42.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail42.BackgroundTransparency = 1
G.Thumbnail42.BorderSizePixel = 0
G.Thumbnail42.Image = "rbxassetid://130296178003198"
G.Thumbnail42.ScaleType = Enum.ScaleType.Fit
G.Thumbnail42.ZIndex = -1
G.Thumbnail42.Parent = G.COM_4722159905669251524

G.Unavailable72 = Instance.new("TextLabel")
G.Unavailable72.Name = "Unavailable"
G.Unavailable72.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable72.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable72.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable72.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable72.BackgroundTransparency = 1
G.Unavailable72.BorderSizePixel = 0
G.Unavailable72.Text = "Unavailable"
G.Unavailable72.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable72.TextSize = 14
G.Unavailable72.Font = Enum.Font.FredokaOne
G.Unavailable72.TextWrapped = true
G.Unavailable72.TextScaled = true
G.Unavailable72.Visible = false
G.Unavailable72.Parent = G.Thumbnail42

G.UIStroke235 = Instance.new("UIStroke")
G.UIStroke235.Name = "UIStroke"
G.UIStroke235.Thickness = 2
G.UIStroke235.Parent = G.Unavailable72

G.Title23 = Instance.new("TextLabel")
G.Title23.Name = "Title"
G.Title23.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title23.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title23.AnchorPoint = Vector2.new(0.5,0)
G.Title23.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title23.BackgroundTransparency = 1
G.Title23.BorderSizePixel = 0
G.Title23.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title23.TextColor3 = Color3.fromRGB(0,13,76)
G.Title23.TextSize = 29
G.Title23.Font = Enum.Font.Arcade
G.Title23.TextWrapped = true
G.Title23.TextScaled = true
G.Title23.RichText = true
G.Title23.Visible = false
G.Title23.AutomaticSize = Enum.AutomaticSize.X
G.Title23.Parent = G.COM_4722159905669251524

G.UIGradient90 = Instance.new("UIGradient")
G.UIGradient90.Name = "UIGradient"
G.UIGradient90.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient90.Rotation = -90
G.UIGradient90.Offset = Vector2.new(0,0)
G.UIGradient90.Parent = G.Title23

G.UIStroke236 = Instance.new("UIStroke")
G.UIStroke236.Name = "UIStroke"
G.UIStroke236.Color = Color3.fromRGB(255,255,255)
G.UIStroke236.Thickness = 2
G.UIStroke236.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke236.Parent = G.Title23

G.UIListLayout14 = Instance.new("UIListLayout")
G.UIListLayout14.Name = "UIListLayout"
G.UIListLayout14.Padding = UDim.new(0.019,0)
G.UIListLayout14.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout14.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout14.Wraps = false
G.UIListLayout14.Parent = G.Special13

G.Special14 = Instance.new("Frame")
G.Special14.Name = "Special"
G.Special14.Size = UDim2.new(0.728177,0,0.493216,0)
G.Special14.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
G.Special14.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special14.BackgroundTransparency = 1
G.Special14.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special14.BorderSizePixel = 0
G.Special14.LayoutOrder = -6
G.Special14.Parent = G.ScrollingFrame

G.COM_1037691785750643120 = Instance.new("Frame")
G.COM_1037691785750643120.Name = "COM-1037691785750643120"
G.COM_1037691785750643120.Size = UDim2.new(0.894198,0,0.931112,0)
G.COM_1037691785750643120.Position = UDim2.new(5.4771e-08,0,0,0)
G.COM_1037691785750643120.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_1037691785750643120.BackgroundTransparency = 1
G.COM_1037691785750643120.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_1037691785750643120.BorderSizePixel = 0
G.COM_1037691785750643120.ZIndex = 2
G.COM_1037691785750643120.Parent = G.Special14

G.BG24 = Instance.new("Frame")
G.BG24.Name = "BG"
G.BG24.Size = UDim2.new(1,0,1,0)
G.BG24.Position = UDim2.new(0.5,0,0.5,0)
G.BG24.AnchorPoint = Vector2.new(0.5,0.5)
G.BG24.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG24.BackgroundTransparency = 1
G.BG24.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG24.BorderSizePixel = 0
G.BG24.ZIndex = -1
G.BG24.Parent = G.COM_1037691785750643120

G.Dropshadow23 = Instance.new("Frame")
G.Dropshadow23.Name = "Dropshadow"
G.Dropshadow23.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow23.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow23.AnchorPoint = Vector2.new(0,1)
G.Dropshadow23.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow23.BackgroundTransparency = 0.5
G.Dropshadow23.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow23.BorderSizePixel = 0
G.Dropshadow23.ZIndex = -2
G.Dropshadow23.Parent = G.BG24

G.UIStroke237 = Instance.new("UIStroke")
G.UIStroke237.Name = "UIStroke"
G.UIStroke237.Thickness = 2.79551
G.UIStroke237.Transparency = 1
G.UIStroke237.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke237.Parent = G.Dropshadow23

G.Frame24 = Instance.new("Frame")
G.Frame24.Name = "Frame"
G.Frame24.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame24.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame24.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame24.BackgroundColor3 = Color3.fromRGB(216,175,177)
G.Frame24.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame24.BorderSizePixel = 0
G.Frame24.ZIndex = -1
G.Frame24.Parent = G.BG24

G.Pattern23 = Instance.new("ImageLabel")
G.Pattern23.Name = "Pattern"
G.Pattern23.Size = UDim2.new(1,0,1,0)
G.Pattern23.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern23.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern23.BackgroundTransparency = 1
G.Pattern23.BorderSizePixel = 0
G.Pattern23.Image = "rbxassetid://122810977034227"
G.Pattern23.ZIndex = -1
G.Pattern23.Parent = G.Frame24

G.UIGradient91 = Instance.new("UIGradient")
G.UIGradient91.Name = "UIGradient"
G.UIGradient91.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
G.UIGradient91.Rotation = 90
G.UIGradient91.Offset = Vector2.new(0,0)
G.UIGradient91.Parent = G.Pattern23

G.UIStroke238 = Instance.new("UIStroke")
G.UIStroke238.Name = "UIStroke"
G.UIStroke238.Thickness = 1.86368
G.UIStroke238.Parent = G.Pattern23

G.UIGradient92 = Instance.new("UIGradient")
G.UIGradient92.Name = "UIGradient"
G.UIGradient92.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient92.Rotation = 90
G.UIGradient92.Offset = Vector2.new(0,0)
G.UIGradient92.Parent = G.Frame24

G.UIStroke239 = Instance.new("UIStroke")
G.UIStroke239.Name = "UIStroke"
G.UIStroke239.Thickness = 1.86368
G.UIStroke239.Parent = G.Frame24

G.Highlight23 = Instance.new("Frame")
G.Highlight23.Name = "Highlight"
G.Highlight23.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight23.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight23.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight23.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight23.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight23.BorderSizePixel = 0
G.Highlight23.Visible = false
G.Highlight23.ZIndex = -2
G.Highlight23.Parent = G.BG24

G.UIStroke240 = Instance.new("UIStroke")
G.UIStroke240.Name = "UIStroke"
G.UIStroke240.Color = Color3.fromRGB(255,242,0)
G.UIStroke240.Thickness = 2.79551
G.UIStroke240.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke240.Parent = G.Highlight23

G.CanvasGroup10 = Instance.new("CanvasGroup")
G.CanvasGroup10.Name = "CanvasGroup"
G.CanvasGroup10.Size = UDim2.new(0.970515,0,0.95775,0)
G.CanvasGroup10.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup10.BackgroundTransparency = 1
G.CanvasGroup10.Parent = G.COM_1037691785750643120

G.Thumbnail43 = Instance.new("ImageLabel")
G.Thumbnail43.Name = "Thumbnail"
G.Thumbnail43.Size = UDim2.new(0.453224,0,1.0299,0)
G.Thumbnail43.Position = UDim2.new(0.158726,0,0.529214,0)
G.Thumbnail43.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail43.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail43.BackgroundTransparency = 1
G.Thumbnail43.BorderSizePixel = 0
G.Thumbnail43.Image = "rbxassetid://108021402940909"
G.Thumbnail43.ScaleType = Enum.ScaleType.Fit
G.Thumbnail43.Rotation = -11
G.Thumbnail43.Parent = G.CanvasGroup10

G.Unavailable73 = Instance.new("TextLabel")
G.Unavailable73.Name = "Unavailable"
G.Unavailable73.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable73.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable73.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable73.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable73.BackgroundTransparency = 1
G.Unavailable73.BorderSizePixel = 0
G.Unavailable73.Text = "Unavailable"
G.Unavailable73.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable73.TextSize = 14
G.Unavailable73.Font = Enum.Font.FredokaOne
G.Unavailable73.TextWrapped = true
G.Unavailable73.TextScaled = true
G.Unavailable73.Visible = false
G.Unavailable73.Parent = G.Thumbnail43

G.UIStroke241 = Instance.new("UIStroke")
G.UIStroke241.Name = "UIStroke"
G.UIStroke241.Thickness = 2
G.UIStroke241.Parent = G.Unavailable73

G.Thumbnail44 = Instance.new("ImageLabel")
G.Thumbnail44.Name = "Thumbnail"
G.Thumbnail44.Size = UDim2.new(0.453224,0,0.952594,0)
G.Thumbnail44.Position = UDim2.new(0.256823,0,0.413572,0)
G.Thumbnail44.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail44.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail44.BackgroundTransparency = 1
G.Thumbnail44.BorderSizePixel = 0
G.Thumbnail44.Image = "rbxassetid://136052355101737"
G.Thumbnail44.ScaleType = Enum.ScaleType.Fit
G.Thumbnail44.ZIndex = 0
G.Thumbnail44.Rotation = 11
G.Thumbnail44.Parent = G.CanvasGroup10

G.Unavailable74 = Instance.new("TextLabel")
G.Unavailable74.Name = "Unavailable"
G.Unavailable74.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable74.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable74.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable74.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable74.BackgroundTransparency = 1
G.Unavailable74.BorderSizePixel = 0
G.Unavailable74.Text = "Unavailable"
G.Unavailable74.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable74.TextSize = 14
G.Unavailable74.Font = Enum.Font.FredokaOne
G.Unavailable74.TextWrapped = true
G.Unavailable74.TextScaled = true
G.Unavailable74.Visible = false
G.Unavailable74.Parent = G.Thumbnail44

G.UIStroke242 = Instance.new("UIStroke")
G.UIStroke242.Name = "UIStroke"
G.UIStroke242.Thickness = 2
G.UIStroke242.Parent = G.Unavailable74

G.DisplayTitle19 = Instance.new("TextLabel")
G.DisplayTitle19.Name = "DisplayTitle"
G.DisplayTitle19.Size = UDim2.new(0.428097,0,0.415185,0)
G.DisplayTitle19.Position = UDim2.new(0.767443,0,0.212655,0)
G.DisplayTitle19.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle19.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle19.BackgroundTransparency = 1
G.DisplayTitle19.BorderSizePixel = 0
G.DisplayTitle19.Text = "Sprout Deluxe 14\" Plush (Pre-Order)"
G.DisplayTitle19.TextColor3 = Color3.fromRGB(2,40,0)
G.DisplayTitle19.TextSize = 29
G.DisplayTitle19.Font = Enum.Font.Arcade
G.DisplayTitle19.TextWrapped = true
G.DisplayTitle19.TextScaled = true
G.DisplayTitle19.RichText = true
G.DisplayTitle19.Parent = G.COM_1037691785750643120

G.UIGradient93 = Instance.new("UIGradient")
G.UIGradient93.Name = "UIGradient"
G.UIGradient93.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient93.Rotation = -90
G.UIGradient93.Offset = Vector2.new(0,0)
G.UIGradient93.Parent = G.DisplayTitle19

G.UIStroke243 = Instance.new("UIStroke")
G.UIStroke243.Name = "UIStroke"
G.UIStroke243.Color = Color3.fromRGB(255,255,255)
G.UIStroke243.Thickness = 0.931838
G.UIStroke243.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke243.Parent = G.DisplayTitle19

G.Item24 = Instance.new("ImageLabel")
G.Item24.Name = "Item"
G.Item24.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item24.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item24.AnchorPoint = Vector2.new(0.5,0.5)
G.Item24.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item24.BackgroundTransparency = 1
G.Item24.BorderSizePixel = 0
G.Item24.Image = "rbxassetid://94959635148921"
G.Item24.ImageRectOffset = Vector2.new(15,15)
G.Item24.ImageRectSize = Vector2.new(270,270)
G.Item24.ScaleType = Enum.ScaleType.Fit
G.Item24.Visible = false
G.Item24.ZIndex = -1
G.Item24.Parent = G.COM_1037691785750643120

G.Unavailable75 = Instance.new("TextLabel")
G.Unavailable75.Name = "Unavailable"
G.Unavailable75.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable75.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable75.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable75.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable75.BackgroundTransparency = 1
G.Unavailable75.BorderSizePixel = 0
G.Unavailable75.Text = "Unavailable"
G.Unavailable75.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable75.TextSize = 14
G.Unavailable75.Font = Enum.Font.FredokaOne
G.Unavailable75.TextWrapped = true
G.Unavailable75.TextScaled = true
G.Unavailable75.Visible = false
G.Unavailable75.Parent = G.Item24

G.UIStroke244 = Instance.new("UIStroke")
G.UIStroke244.Name = "UIStroke"
G.UIStroke244.Thickness = 2
G.UIStroke244.Parent = G.Unavailable75

G.New13 = Instance.new("ImageLabel")
G.New13.Name = "New"
G.New13.Size = UDim2.new(0.322123,0,0.355513,0)
G.New13.Position = UDim2.new(0.94212,0,0.0839209,0)
G.New13.AnchorPoint = Vector2.new(0.5,0.5)
G.New13.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New13.BackgroundTransparency = 1
G.New13.BorderSizePixel = 0
G.New13.Image = "rbxassetid://96728750855907"
G.New13.ScaleType = Enum.ScaleType.Fit
G.New13.Visible = false
G.New13.ZIndex = -1
G.New13.Parent = G.COM_1037691785750643120

G.UIScale38 = Instance.new("UIScale")
G.UIScale38.Name = "UIScale"
G.UIScale38.Parent = G.New13

G.Purchase24 = Instance.new("ImageButton")
G.Purchase24.Name = "Purchase"
G.Purchase24.Size = UDim2.new(0.436835,0,0.172928,0)
G.Purchase24.Position = UDim2.new(0.752098,0,0.833662,0)
G.Purchase24.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase24.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase24.BorderSizePixel = 0
G.Purchase24.ScaleType = Enum.ScaleType.Fit
G.Purchase24.AutoButtonColor = false
G.Purchase24.ZIndex = 5
G.Purchase24.Parent = G.COM_1037691785750643120

G.Price24 = Instance.new("TextLabel")
G.Price24.Name = "Price"
G.Price24.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price24.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price24.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price24.BackgroundTransparency = 1
G.Price24.BorderSizePixel = 0
G.Price24.Text = "$19.99"
G.Price24.TextColor3 = Color3.fromRGB(255,255,255)
G.Price24.TextSize = 14
G.Price24.Font = Enum.Font.Arcade
G.Price24.TextWrapped = true
G.Price24.TextScaled = true
G.Price24.RichText = true
G.Price24.AutomaticSize = Enum.AutomaticSize.X
G.Price24.Parent = G.Purchase24

G.UIGradient94 = Instance.new("UIGradient")
G.UIGradient94.Name = "UIGradient"
G.UIGradient94.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient94.Rotation = -90
G.UIGradient94.Offset = Vector2.new(0,0)
G.UIGradient94.Parent = G.Price24

G.UIStroke245 = Instance.new("UIStroke")
G.UIStroke245.Name = "UIStroke"
G.UIStroke245.Thickness = 0.931838
G.UIStroke245.Parent = G.Price24

G.UICorner25 = Instance.new("UICorner")
G.UICorner25.Name = "UICorner"
G.UICorner25.CornerRadius = UDim.new(1,0)
G.UICorner25.Parent = G.Purchase24

G.UIGradient95 = Instance.new("UIGradient")
G.UIGradient95.Name = "UIGradient"
G.UIGradient95.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient95.Rotation = -90
G.UIGradient95.Offset = Vector2.new(0,0)
G.UIGradient95.Parent = G.Purchase24

G.UIScale39 = Instance.new("UIScale")
G.UIScale39.Name = "UIScale"
G.UIScale39.Parent = G.Purchase24

G.UIStroke246 = Instance.new("UIStroke")
G.UIStroke246.Name = "UIStroke"
G.UIStroke246.Thickness = 1.1648
G.UIStroke246.Parent = G.Purchase24

G.Thumbnail45 = Instance.new("ImageLabel")
G.Thumbnail45.Name = "Thumbnail"
G.Thumbnail45.Size = UDim2.new(0.48234,0,1.2575,0)
G.Thumbnail45.Position = UDim2.new(0.454675,0,0.450994,0)
G.Thumbnail45.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail45.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail45.BackgroundTransparency = 1
G.Thumbnail45.BorderSizePixel = 0
G.Thumbnail45.Image = "rbxassetid://92821036648295"
G.Thumbnail45.ScaleType = Enum.ScaleType.Fit
G.Thumbnail45.ZIndex = 4
G.Thumbnail45.Parent = G.COM_1037691785750643120

G.Unavailable76 = Instance.new("TextLabel")
G.Unavailable76.Name = "Unavailable"
G.Unavailable76.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable76.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable76.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable76.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable76.BackgroundTransparency = 1
G.Unavailable76.BorderSizePixel = 0
G.Unavailable76.Text = "Unavailable"
G.Unavailable76.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable76.TextSize = 14
G.Unavailable76.Font = Enum.Font.FredokaOne
G.Unavailable76.TextWrapped = true
G.Unavailable76.TextScaled = true
G.Unavailable76.Visible = false
G.Unavailable76.Parent = G.Thumbnail45

G.UIStroke247 = Instance.new("UIStroke")
G.UIStroke247.Name = "UIStroke"
G.UIStroke247.Thickness = 2
G.UIStroke247.Parent = G.Unavailable76

G.Title24 = Instance.new("TextLabel")
G.Title24.Name = "Title"
G.Title24.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title24.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title24.AnchorPoint = Vector2.new(0.5,0)
G.Title24.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title24.BackgroundTransparency = 1
G.Title24.BorderSizePixel = 0
G.Title24.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title24.TextColor3 = Color3.fromRGB(0,13,76)
G.Title24.TextSize = 29
G.Title24.Font = Enum.Font.Arcade
G.Title24.TextWrapped = true
G.Title24.TextScaled = true
G.Title24.RichText = true
G.Title24.Visible = false
G.Title24.AutomaticSize = Enum.AutomaticSize.X
G.Title24.Parent = G.COM_1037691785750643120

G.UIGradient96 = Instance.new("UIGradient")
G.UIGradient96.Name = "UIGradient"
G.UIGradient96.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient96.Rotation = -90
G.UIGradient96.Offset = Vector2.new(0,0)
G.UIGradient96.Parent = G.Title24

G.UIStroke248 = Instance.new("UIStroke")
G.UIStroke248.Name = "UIStroke"
G.UIStroke248.Color = Color3.fromRGB(255,255,255)
G.UIStroke248.Thickness = 2
G.UIStroke248.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke248.Parent = G.Title24

G.COM_8902595216255615457 = Instance.new("Frame")
G.COM_8902595216255615457.Name = "COM-8902595216255615457"
G.COM_8902595216255615457.Size = UDim2.new(0.442523,0,0.944677,0)
G.COM_8902595216255615457.Position = UDim2.new(0.913307,0,0,0)
G.COM_8902595216255615457.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_8902595216255615457.BackgroundTransparency = 1
G.COM_8902595216255615457.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_8902595216255615457.BorderSizePixel = 0
G.COM_8902595216255615457.Parent = G.Special14

G.BG25 = Instance.new("Frame")
G.BG25.Name = "BG"
G.BG25.Size = UDim2.new(1,0,1,0)
G.BG25.Position = UDim2.new(0.5,0,0.5,0)
G.BG25.AnchorPoint = Vector2.new(0.5,0.5)
G.BG25.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG25.BackgroundTransparency = 1
G.BG25.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG25.BorderSizePixel = 0
G.BG25.ZIndex = -1
G.BG25.Parent = G.COM_8902595216255615457

G.Dropshadow24 = Instance.new("Frame")
G.Dropshadow24.Name = "Dropshadow"
G.Dropshadow24.Size = UDim2.new(0.947997,0,0.95376,0)
G.Dropshadow24.Position = UDim2.new(-0.00747363,0,1.01324,0)
G.Dropshadow24.AnchorPoint = Vector2.new(0,1)
G.Dropshadow24.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow24.BackgroundTransparency = 0.5
G.Dropshadow24.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow24.BorderSizePixel = 0
G.Dropshadow24.ZIndex = -2
G.Dropshadow24.Parent = G.BG25

G.UIStroke249 = Instance.new("UIStroke")
G.UIStroke249.Name = "UIStroke"
G.UIStroke249.Thickness = 2.79551
G.UIStroke249.Transparency = 1
G.UIStroke249.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke249.Parent = G.Dropshadow24

G.Frame25 = Instance.new("Frame")
G.Frame25.Name = "Frame"
G.Frame25.Size = UDim2.new(0.95775,0,0.95775,0)
G.Frame25.Position = UDim2.new(0.521125,0,0.478875,0)
G.Frame25.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame25.BackgroundColor3 = Color3.fromRGB(216,175,177)
G.Frame25.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame25.BorderSizePixel = 0
G.Frame25.ZIndex = -1
G.Frame25.Parent = G.BG25

G.Pattern24 = Instance.new("ImageLabel")
G.Pattern24.Name = "Pattern"
G.Pattern24.Size = UDim2.new(1,0,1,0)
G.Pattern24.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern24.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern24.BackgroundTransparency = 1
G.Pattern24.BorderSizePixel = 0
G.Pattern24.Image = "rbxassetid://110909808384714"
G.Pattern24.ScaleType = Enum.ScaleType.Crop
G.Pattern24.ZIndex = -1
G.Pattern24.Parent = G.Frame25

G.UIGradient97 = Instance.new("UIGradient")
G.UIGradient97.Name = "UIGradient"
G.UIGradient97.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
G.UIGradient97.Rotation = 90
G.UIGradient97.Offset = Vector2.new(0,0)
G.UIGradient97.Parent = G.Pattern24

G.UIStroke250 = Instance.new("UIStroke")
G.UIStroke250.Name = "UIStroke"
G.UIStroke250.Thickness = 1.86368
G.UIStroke250.Parent = G.Pattern24

G.UIGradient98 = Instance.new("UIGradient")
G.UIGradient98.Name = "UIGradient"
G.UIGradient98.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient98.Rotation = 90
G.UIGradient98.Offset = Vector2.new(0,0)
G.UIGradient98.Parent = G.Frame25

G.UIStroke251 = Instance.new("UIStroke")
G.UIStroke251.Name = "UIStroke"
G.UIStroke251.Thickness = 4
G.UIStroke251.Parent = G.Frame25

G.Highlight24 = Instance.new("Frame")
G.Highlight24.Name = "Highlight"
G.Highlight24.Size = UDim2.new(0.954203,0,0.95775,0)
G.Highlight24.Position = UDim2.new(0.519351,0,0.478875,0)
G.Highlight24.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight24.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight24.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight24.BorderSizePixel = 0
G.Highlight24.Visible = false
G.Highlight24.ZIndex = -2
G.Highlight24.Parent = G.BG25

G.UIStroke252 = Instance.new("UIStroke")
G.UIStroke252.Name = "UIStroke"
G.UIStroke252.Color = Color3.fromRGB(255,242,0)
G.UIStroke252.Thickness = 2.79551
G.UIStroke252.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke252.Parent = G.Highlight24

G.Item25 = Instance.new("ImageLabel")
G.Item25.Name = "Item"
G.Item25.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item25.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item25.AnchorPoint = Vector2.new(0.5,0.5)
G.Item25.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item25.BackgroundTransparency = 1
G.Item25.BorderSizePixel = 0
G.Item25.Image = "rbxassetid://94959635148921"
G.Item25.ImageRectOffset = Vector2.new(25,25)
G.Item25.ImageRectSize = Vector2.new(250,250)
G.Item25.ScaleType = Enum.ScaleType.Crop
G.Item25.Visible = false
G.Item25.ZIndex = -1
G.Item25.Parent = G.COM_8902595216255615457

G.Unavailable77 = Instance.new("TextLabel")
G.Unavailable77.Name = "Unavailable"
G.Unavailable77.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable77.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable77.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable77.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable77.BackgroundTransparency = 1
G.Unavailable77.BorderSizePixel = 0
G.Unavailable77.Text = "Unavailable"
G.Unavailable77.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable77.TextSize = 14
G.Unavailable77.Font = Enum.Font.FredokaOne
G.Unavailable77.TextWrapped = true
G.Unavailable77.TextScaled = true
G.Unavailable77.Visible = false
G.Unavailable77.Parent = G.Item25

G.UIStroke253 = Instance.new("UIStroke")
G.UIStroke253.Name = "UIStroke"
G.UIStroke253.Thickness = 2
G.UIStroke253.Parent = G.Unavailable77

G.Pixel8 = Instance.new("ImageLabel")
G.Pixel8.Name = "Pixel"
G.Pixel8.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel8.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel8.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel8.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel8.BorderSizePixel = 0
G.Pixel8.Image = "rbxassetid://94959635148921"
G.Pixel8.ImageRectOffset = Vector2.new(55,100)
G.Pixel8.ImageRectSize = Vector2.new(30,30)
G.Pixel8.ScaleType = Enum.ScaleType.Crop
G.Pixel8.Visible = false
G.Pixel8.ZIndex = 5
G.Pixel8.Parent = G.COM_8902595216255615457

G.Unavailable78 = Instance.new("TextLabel")
G.Unavailable78.Name = "Unavailable"
G.Unavailable78.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable78.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable78.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable78.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable78.BackgroundTransparency = 1
G.Unavailable78.BorderSizePixel = 0
G.Unavailable78.Text = "Unavailable"
G.Unavailable78.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable78.TextSize = 14
G.Unavailable78.Font = Enum.Font.FredokaOne
G.Unavailable78.TextWrapped = true
G.Unavailable78.TextScaled = true
G.Unavailable78.Visible = false
G.Unavailable78.Parent = G.Pixel8

G.UIStroke254 = Instance.new("UIStroke")
G.UIStroke254.Name = "UIStroke"
G.UIStroke254.Thickness = 2
G.UIStroke254.Parent = G.Unavailable78

G.Purchase25 = Instance.new("ImageButton")
G.Purchase25.Name = "Purchase"
G.Purchase25.Size = UDim2.new(0.863319,0,0.170445,0)
G.Purchase25.Position = UDim2.new(0.514166,0,0.821691,0)
G.Purchase25.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase25.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase25.BorderSizePixel = 0
G.Purchase25.ScaleType = Enum.ScaleType.Fit
G.Purchase25.AutoButtonColor = false
G.Purchase25.ZIndex = 6
G.Purchase25.Parent = G.COM_8902595216255615457

G.Price25 = Instance.new("TextLabel")
G.Price25.Name = "Price"
G.Price25.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price25.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price25.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price25.BackgroundTransparency = 1
G.Price25.BorderSizePixel = 0
G.Price25.Text = "$19.99"
G.Price25.TextColor3 = Color3.fromRGB(255,255,255)
G.Price25.TextSize = 14
G.Price25.Font = Enum.Font.Arcade
G.Price25.TextWrapped = true
G.Price25.TextScaled = true
G.Price25.RichText = true
G.Price25.AutomaticSize = Enum.AutomaticSize.X
G.Price25.Parent = G.Purchase25

G.UIGradient99 = Instance.new("UIGradient")
G.UIGradient99.Name = "UIGradient"
G.UIGradient99.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient99.Rotation = -90
G.UIGradient99.Offset = Vector2.new(0,0)
G.UIGradient99.Parent = G.Price25

G.UIStroke255 = Instance.new("UIStroke")
G.UIStroke255.Name = "UIStroke"
G.UIStroke255.Thickness = 2
G.UIStroke255.Parent = G.Price25

G.UICorner26 = Instance.new("UICorner")
G.UICorner26.Name = "UICorner"
G.UICorner26.CornerRadius = UDim.new(1,0)
G.UICorner26.Parent = G.Purchase25

G.UIGradient100 = Instance.new("UIGradient")
G.UIGradient100.Name = "UIGradient"
G.UIGradient100.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient100.Rotation = -90
G.UIGradient100.Offset = Vector2.new(0,0)
G.UIGradient100.Parent = G.Purchase25

G.UIScale40 = Instance.new("UIScale")
G.UIScale40.Name = "UIScale"
G.UIScale40.Parent = G.Purchase25

G.UIStroke256 = Instance.new("UIStroke")
G.UIStroke256.Name = "UIStroke"
G.UIStroke256.Thickness = 2.5
G.UIStroke256.Parent = G.Purchase25

G.Thumbnail46 = Instance.new("ImageLabel")
G.Thumbnail46.Name = "Thumbnail"
G.Thumbnail46.Size = UDim2.new(1.15659,0,0.857211,0)
G.Thumbnail46.Position = UDim2.new(0.495381,0,0.470327,0)
G.Thumbnail46.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail46.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail46.BackgroundTransparency = 1
G.Thumbnail46.BorderSizePixel = 0
G.Thumbnail46.Image = "rbxassetid://107036941918802"
G.Thumbnail46.ScaleType = Enum.ScaleType.Crop
G.Thumbnail46.ZIndex = -1
G.Thumbnail46.Parent = G.COM_8902595216255615457

G.Unavailable79 = Instance.new("TextLabel")
G.Unavailable79.Name = "Unavailable"
G.Unavailable79.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable79.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable79.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable79.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable79.BackgroundTransparency = 1
G.Unavailable79.BorderSizePixel = 0
G.Unavailable79.Text = "Unavailable"
G.Unavailable79.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable79.TextSize = 14
G.Unavailable79.Font = Enum.Font.FredokaOne
G.Unavailable79.TextWrapped = true
G.Unavailable79.TextScaled = true
G.Unavailable79.Visible = false
G.Unavailable79.Parent = G.Thumbnail46

G.UIStroke257 = Instance.new("UIStroke")
G.UIStroke257.Name = "UIStroke"
G.UIStroke257.Thickness = 2
G.UIStroke257.Parent = G.Unavailable79

G.Title25 = Instance.new("TextLabel")
G.Title25.Name = "Title"
G.Title25.Size = UDim2.new(0.874784,0,0.149,0)
G.Title25.Position = UDim2.new(0.531264,0,0.0306123,0)
G.Title25.AnchorPoint = Vector2.new(0.5,0)
G.Title25.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title25.BackgroundTransparency = 1
G.Title25.BorderSizePixel = 0
G.Title25.Text = "Bobette 11" x 14" Poster"
G.Title25.TextColor3 = Color3.fromRGB(0,0,0)
G.Title25.TextSize = 29
G.Title25.Font = Enum.Font.Arcade
G.Title25.TextXAlignment = Enum.TextXAlignment.Left
G.Title25.TextYAlignment = Enum.TextYAlignment.Top
G.Title25.TextWrapped = true
G.Title25.TextScaled = true
G.Title25.RichText = true
G.Title25.Visible = false
G.Title25.AutomaticSize = Enum.AutomaticSize.X
G.Title25.Parent = G.COM_8902595216255615457

G.UITextSizeConstraint11 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint11.Name = "UITextSizeConstraint"
G.UITextSizeConstraint11.MaxTextSize = 29
G.UITextSizeConstraint11.Parent = G.Title25

G.UIListLayout15 = Instance.new("UIListLayout")
G.UIListLayout15.Name = "UIListLayout"
G.UIListLayout15.Padding = UDim.new(0.019,0)
G.UIListLayout15.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout15.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout15.Wraps = false
G.UIListLayout15.Parent = G.Special14

G.Row = Instance.new("Frame")
G.Row.Name = "Row"
G.Row.Size = UDim2.new(1,0,0.618953,0)
G.Row.Position = UDim2.new(-5.82348e-08,0,-0.528551,0)
G.Row.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Row.BackgroundTransparency = 1
G.Row.BorderColor3 = Color3.fromRGB(0,0,0)
G.Row.BorderSizePixel = 0
G.Row.LayoutOrder = -5
G.Row.Parent = G.ScrollingFrame

G.Template = Instance.new("Frame")
G.Template.Name = "Template"
G.Template.Size = UDim2.new(0.31602,0,0.944677,0)
G.Template.Position = UDim2.new(6.27232e-08,0,-0.0531514,0)
G.Template.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.Template.BackgroundTransparency = 1
G.Template.BorderColor3 = Color3.fromRGB(0,0,0)
G.Template.BorderSizePixel = 0
G.Template.Parent = G.Row

G.BG26 = Instance.new("Frame")
G.BG26.Name = "BG"
G.BG26.Size = UDim2.new(1,0,1,0)
G.BG26.Position = UDim2.new(0.5,0,0.5,0)
G.BG26.AnchorPoint = Vector2.new(0.5,0.5)
G.BG26.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG26.BackgroundTransparency = 1
G.BG26.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG26.BorderSizePixel = 0
G.BG26.ZIndex = -1
G.BG26.Parent = G.Template

G.Dropshadow25 = Instance.new("Frame")
G.Dropshadow25.Name = "Dropshadow"
G.Dropshadow25.Size = UDim2.new(0.940524,0,0.940524,0)
G.Dropshadow25.Position = UDim2.new(0,0,1,0)
G.Dropshadow25.AnchorPoint = Vector2.new(0,1)
G.Dropshadow25.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow25.BackgroundTransparency = 0.5
G.Dropshadow25.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow25.BorderSizePixel = 0
G.Dropshadow25.ZIndex = -2
G.Dropshadow25.Parent = G.BG26

G.Frame26 = Instance.new("Frame")
G.Frame26.Name = "Frame"
G.Frame26.Size = UDim2.new(0.95775,0,0.95775,0)
G.Frame26.Position = UDim2.new(0.521125,0,0.478875,0)
G.Frame26.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame26.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame26.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame26.BorderSizePixel = 0
G.Frame26.ZIndex = -1
G.Frame26.Parent = G.BG26

G.UIStroke258 = Instance.new("UIStroke")
G.UIStroke258.Name = "UIStroke"
G.UIStroke258.Thickness = 4
G.UIStroke258.Parent = G.Frame26

G.Item26 = Instance.new("ImageLabel")
G.Item26.Name = "Item2"
G.Item26.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item26.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item26.AnchorPoint = Vector2.new(0.5,0.5)
G.Item26.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item26.BackgroundTransparency = 1
G.Item26.BorderSizePixel = 0
G.Item26.Image = "rbxassetid://94959635148921"
G.Item26.ImageRectOffset = Vector2.new(25,25)
G.Item26.ImageRectSize = Vector2.new(250,250)
G.Item26.ScaleType = Enum.ScaleType.Crop
G.Item26.Visible = false
G.Item26.ZIndex = -1
G.Item26.Parent = G.Template

G.Unavailable80 = Instance.new("TextLabel")
G.Unavailable80.Name = "Unavailable"
G.Unavailable80.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable80.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable80.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable80.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable80.BackgroundTransparency = 1
G.Unavailable80.BorderSizePixel = 0
G.Unavailable80.Text = "Unavailable"
G.Unavailable80.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable80.TextSize = 14
G.Unavailable80.Font = Enum.Font.FredokaOne
G.Unavailable80.TextWrapped = true
G.Unavailable80.TextScaled = true
G.Unavailable80.Visible = false
G.Unavailable80.Parent = G.Item26

G.UIStroke259 = Instance.new("UIStroke")
G.UIStroke259.Name = "UIStroke"
G.UIStroke259.Thickness = 2
G.UIStroke259.Parent = G.Unavailable80

G.Pixel9 = Instance.new("ImageLabel")
G.Pixel9.Name = "Pixel"
G.Pixel9.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel9.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel9.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel9.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel9.BorderSizePixel = 0
G.Pixel9.Image = "rbxassetid://94959635148921"
G.Pixel9.ImageRectOffset = Vector2.new(55,100)
G.Pixel9.ImageRectSize = Vector2.new(30,30)
G.Pixel9.ScaleType = Enum.ScaleType.Crop
G.Pixel9.Visible = false
G.Pixel9.ZIndex = 5
G.Pixel9.Parent = G.Template

G.Unavailable81 = Instance.new("TextLabel")
G.Unavailable81.Name = "Unavailable"
G.Unavailable81.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable81.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable81.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable81.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable81.BackgroundTransparency = 1
G.Unavailable81.BorderSizePixel = 0
G.Unavailable81.Text = "Unavailable"
G.Unavailable81.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable81.TextSize = 14
G.Unavailable81.Font = Enum.Font.FredokaOne
G.Unavailable81.TextWrapped = true
G.Unavailable81.TextScaled = true
G.Unavailable81.Visible = false
G.Unavailable81.Parent = G.Pixel9

G.UIStroke260 = Instance.new("UIStroke")
G.UIStroke260.Name = "UIStroke"
G.UIStroke260.Thickness = 2
G.UIStroke260.Parent = G.Unavailable81

G.Purchase26 = Instance.new("ImageButton")
G.Purchase26.Name = "Purchase"
G.Purchase26.Size = UDim2.new(0.902423,0,0.116761,0)
G.Purchase26.Position = UDim2.new(0.521125,0,0.866764,0)
G.Purchase26.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase26.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase26.BorderSizePixel = 0
G.Purchase26.ScaleType = Enum.ScaleType.Fit
G.Purchase26.AutoButtonColor = false
G.Purchase26.Active = false
G.Purchase26.Parent = G.Template

G.Price26 = Instance.new("TextLabel")
G.Price26.Name = "Price"
G.Price26.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price26.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price26.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price26.BackgroundTransparency = 1
G.Price26.BorderSizePixel = 0
G.Price26.Text = "$19.99"
G.Price26.TextColor3 = Color3.fromRGB(255,255,255)
G.Price26.TextSize = 14
G.Price26.Font = Enum.Font.Arcade
G.Price26.TextWrapped = true
G.Price26.TextScaled = true
G.Price26.RichText = true
G.Price26.AutomaticSize = Enum.AutomaticSize.X
G.Price26.Parent = G.Purchase26

G.UIGradient101 = Instance.new("UIGradient")
G.UIGradient101.Name = "UIGradient"
G.UIGradient101.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient101.Rotation = -90
G.UIGradient101.Offset = Vector2.new(0,0)
G.UIGradient101.Parent = G.Price26

G.UIStroke261 = Instance.new("UIStroke")
G.UIStroke261.Name = "UIStroke"
G.UIStroke261.Thickness = 2
G.UIStroke261.Parent = G.Price26

G.UICorner27 = Instance.new("UICorner")
G.UICorner27.Name = "UICorner"
G.UICorner27.CornerRadius = UDim.new(1,0)
G.UICorner27.Parent = G.Purchase26

G.UIGradient102 = Instance.new("UIGradient")
G.UIGradient102.Name = "UIGradient"
G.UIGradient102.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient102.Rotation = -90
G.UIGradient102.Offset = Vector2.new(0,0)
G.UIGradient102.Parent = G.Purchase26

G.UIStroke262 = Instance.new("UIStroke")
G.UIStroke262.Name = "UIStroke"
G.UIStroke262.Thickness = 2.5
G.UIStroke262.Parent = G.Purchase26

G.Title26 = Instance.new("TextLabel")
G.Title26.Name = "Title"
G.Title26.Size = UDim2.new(0.854506,0,0.108842,0)
G.Title26.Position = UDim2.new(0.521125,0,0.0306124,0)
G.Title26.AnchorPoint = Vector2.new(0.5,0)
G.Title26.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title26.BackgroundTransparency = 1
G.Title26.BorderSizePixel = 0
G.Title26.Text = "COM-5640493750225600958"
G.Title26.TextColor3 = Color3.fromRGB(0,0,0)
G.Title26.TextSize = 29
G.Title26.Font = Enum.Font.Arcade
G.Title26.TextXAlignment = Enum.TextXAlignment.Left
G.Title26.TextYAlignment = Enum.TextYAlignment.Top
G.Title26.TextWrapped = true
G.Title26.TextScaled = true
G.Title26.RichText = true
G.Title26.AutomaticSize = Enum.AutomaticSize.X
G.Title26.Parent = G.Template

G.UITextSizeConstraint12 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint12.Name = "UITextSizeConstraint"
G.UITextSizeConstraint12.MaxTextSize = 29
G.UITextSizeConstraint12.Parent = G.Title26

G.UIAspectRatioConstraint13 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint13.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint13.AspectRatio = 0.76
G.UIAspectRatioConstraint13.Parent = G.Template

G.Template2 = Instance.new("Frame")
G.Template2.Name = "Template"
G.Template2.Size = UDim2.new(0.31602,0,0.944677,0)
G.Template2.Position = UDim2.new(0.672173,0,-0.0531514,0)
G.Template2.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.Template2.BackgroundTransparency = 1
G.Template2.BorderColor3 = Color3.fromRGB(0,0,0)
G.Template2.BorderSizePixel = 0
G.Template2.Parent = G.Row

G.BG27 = Instance.new("Frame")
G.BG27.Name = "BG"
G.BG27.Size = UDim2.new(1,0,1,0)
G.BG27.Position = UDim2.new(0.5,0,0.5,0)
G.BG27.AnchorPoint = Vector2.new(0.5,0.5)
G.BG27.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG27.BackgroundTransparency = 1
G.BG27.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG27.BorderSizePixel = 0
G.BG27.ZIndex = -1
G.BG27.Parent = G.Template2

G.Dropshadow26 = Instance.new("Frame")
G.Dropshadow26.Name = "Dropshadow"
G.Dropshadow26.Size = UDim2.new(0.940524,0,0.940524,0)
G.Dropshadow26.Position = UDim2.new(0,0,1,0)
G.Dropshadow26.AnchorPoint = Vector2.new(0,1)
G.Dropshadow26.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow26.BackgroundTransparency = 0.5
G.Dropshadow26.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow26.BorderSizePixel = 0
G.Dropshadow26.ZIndex = -2
G.Dropshadow26.Parent = G.BG27

G.Frame27 = Instance.new("Frame")
G.Frame27.Name = "Frame"
G.Frame27.Size = UDim2.new(0.95775,0,0.95775,0)
G.Frame27.Position = UDim2.new(0.521125,0,0.478875,0)
G.Frame27.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame27.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame27.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame27.BorderSizePixel = 0
G.Frame27.ZIndex = -1
G.Frame27.Parent = G.BG27

G.UIStroke263 = Instance.new("UIStroke")
G.UIStroke263.Name = "UIStroke"
G.UIStroke263.Thickness = 4
G.UIStroke263.Parent = G.Frame27

G.Item27 = Instance.new("ImageLabel")
G.Item27.Name = "Item2"
G.Item27.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item27.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item27.AnchorPoint = Vector2.new(0.5,0.5)
G.Item27.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item27.BackgroundTransparency = 1
G.Item27.BorderSizePixel = 0
G.Item27.Image = "rbxassetid://94959635148921"
G.Item27.ImageRectOffset = Vector2.new(25,25)
G.Item27.ImageRectSize = Vector2.new(250,250)
G.Item27.ScaleType = Enum.ScaleType.Crop
G.Item27.Visible = false
G.Item27.ZIndex = -1
G.Item27.Parent = G.Template2

G.Unavailable82 = Instance.new("TextLabel")
G.Unavailable82.Name = "Unavailable"
G.Unavailable82.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable82.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable82.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable82.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable82.BackgroundTransparency = 1
G.Unavailable82.BorderSizePixel = 0
G.Unavailable82.Text = "Unavailable"
G.Unavailable82.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable82.TextSize = 14
G.Unavailable82.Font = Enum.Font.FredokaOne
G.Unavailable82.TextWrapped = true
G.Unavailable82.TextScaled = true
G.Unavailable82.Visible = false
G.Unavailable82.Parent = G.Item27

G.UIStroke264 = Instance.new("UIStroke")
G.UIStroke264.Name = "UIStroke"
G.UIStroke264.Thickness = 2
G.UIStroke264.Parent = G.Unavailable82

G.Pixel10 = Instance.new("ImageLabel")
G.Pixel10.Name = "Pixel"
G.Pixel10.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel10.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel10.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel10.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel10.BorderSizePixel = 0
G.Pixel10.Image = "rbxassetid://94959635148921"
G.Pixel10.ImageRectOffset = Vector2.new(55,100)
G.Pixel10.ImageRectSize = Vector2.new(30,30)
G.Pixel10.ScaleType = Enum.ScaleType.Crop
G.Pixel10.Visible = false
G.Pixel10.ZIndex = 5
G.Pixel10.Parent = G.Template2

G.Unavailable83 = Instance.new("TextLabel")
G.Unavailable83.Name = "Unavailable"
G.Unavailable83.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable83.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable83.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable83.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable83.BackgroundTransparency = 1
G.Unavailable83.BorderSizePixel = 0
G.Unavailable83.Text = "Unavailable"
G.Unavailable83.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable83.TextSize = 14
G.Unavailable83.Font = Enum.Font.FredokaOne
G.Unavailable83.TextWrapped = true
G.Unavailable83.TextScaled = true
G.Unavailable83.Visible = false
G.Unavailable83.Parent = G.Pixel10

G.UIStroke265 = Instance.new("UIStroke")
G.UIStroke265.Name = "UIStroke"
G.UIStroke265.Thickness = 2
G.UIStroke265.Parent = G.Unavailable83

G.Purchase27 = Instance.new("ImageButton")
G.Purchase27.Name = "Purchase"
G.Purchase27.Size = UDim2.new(0.902423,0,0.116761,0)
G.Purchase27.Position = UDim2.new(0.521125,0,0.866764,0)
G.Purchase27.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase27.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase27.BorderSizePixel = 0
G.Purchase27.ScaleType = Enum.ScaleType.Fit
G.Purchase27.AutoButtonColor = false
G.Purchase27.Active = false
G.Purchase27.Parent = G.Template2

G.Price27 = Instance.new("TextLabel")
G.Price27.Name = "Price"
G.Price27.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price27.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price27.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price27.BackgroundTransparency = 1
G.Price27.BorderSizePixel = 0
G.Price27.Text = "$19.99"
G.Price27.TextColor3 = Color3.fromRGB(255,255,255)
G.Price27.TextSize = 14
G.Price27.Font = Enum.Font.Arcade
G.Price27.TextWrapped = true
G.Price27.TextScaled = true
G.Price27.RichText = true
G.Price27.AutomaticSize = Enum.AutomaticSize.X
G.Price27.Parent = G.Purchase27

G.UIGradient103 = Instance.new("UIGradient")
G.UIGradient103.Name = "UIGradient"
G.UIGradient103.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient103.Rotation = -90
G.UIGradient103.Offset = Vector2.new(0,0)
G.UIGradient103.Parent = G.Price27

G.UIStroke266 = Instance.new("UIStroke")
G.UIStroke266.Name = "UIStroke"
G.UIStroke266.Thickness = 2
G.UIStroke266.Parent = G.Price27

G.UICorner28 = Instance.new("UICorner")
G.UICorner28.Name = "UICorner"
G.UICorner28.CornerRadius = UDim.new(1,0)
G.UICorner28.Parent = G.Purchase27

G.UIGradient104 = Instance.new("UIGradient")
G.UIGradient104.Name = "UIGradient"
G.UIGradient104.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient104.Rotation = -90
G.UIGradient104.Offset = Vector2.new(0,0)
G.UIGradient104.Parent = G.Purchase27

G.UIStroke267 = Instance.new("UIStroke")
G.UIStroke267.Name = "UIStroke"
G.UIStroke267.Thickness = 2.5
G.UIStroke267.Parent = G.Purchase27

G.Title27 = Instance.new("TextLabel")
G.Title27.Name = "Title"
G.Title27.Size = UDim2.new(0.854506,0,0.108842,0)
G.Title27.Position = UDim2.new(0.521125,0,0.0306124,0)
G.Title27.AnchorPoint = Vector2.new(0.5,0)
G.Title27.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title27.BackgroundTransparency = 1
G.Title27.BorderSizePixel = 0
G.Title27.Text = "COM-643100702041833957"
G.Title27.TextColor3 = Color3.fromRGB(0,0,0)
G.Title27.TextSize = 29
G.Title27.Font = Enum.Font.Arcade
G.Title27.TextXAlignment = Enum.TextXAlignment.Left
G.Title27.TextYAlignment = Enum.TextYAlignment.Top
G.Title27.TextWrapped = true
G.Title27.TextScaled = true
G.Title27.RichText = true
G.Title27.AutomaticSize = Enum.AutomaticSize.X
G.Title27.Parent = G.Template2

G.UITextSizeConstraint13 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint13.Name = "UITextSizeConstraint"
G.UITextSizeConstraint13.MaxTextSize = 29
G.UITextSizeConstraint13.Parent = G.Title27

G.UIAspectRatioConstraint14 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint14.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint14.AspectRatio = 0.76
G.UIAspectRatioConstraint14.Parent = G.Template2

G.Template3 = Instance.new("Frame")
G.Template3.Name = "Template"
G.Template3.Size = UDim2.new(0.31602,0,0.944677,0)
G.Template3.Position = UDim2.new(0.336087,0,-0.0531514,0)
G.Template3.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.Template3.BackgroundTransparency = 1
G.Template3.BorderColor3 = Color3.fromRGB(0,0,0)
G.Template3.BorderSizePixel = 0
G.Template3.Parent = G.Row

G.BG28 = Instance.new("Frame")
G.BG28.Name = "BG"
G.BG28.Size = UDim2.new(1,0,1,0)
G.BG28.Position = UDim2.new(0.5,0,0.5,0)
G.BG28.AnchorPoint = Vector2.new(0.5,0.5)
G.BG28.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG28.BackgroundTransparency = 1
G.BG28.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG28.BorderSizePixel = 0
G.BG28.ZIndex = -1
G.BG28.Parent = G.Template3

G.Dropshadow27 = Instance.new("Frame")
G.Dropshadow27.Name = "Dropshadow"
G.Dropshadow27.Size = UDim2.new(0.940524,0,0.940524,0)
G.Dropshadow27.Position = UDim2.new(0,0,1,0)
G.Dropshadow27.AnchorPoint = Vector2.new(0,1)
G.Dropshadow27.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow27.BackgroundTransparency = 0.5
G.Dropshadow27.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow27.BorderSizePixel = 0
G.Dropshadow27.ZIndex = -2
G.Dropshadow27.Parent = G.BG28

G.Frame28 = Instance.new("Frame")
G.Frame28.Name = "Frame"
G.Frame28.Size = UDim2.new(0.95775,0,0.95775,0)
G.Frame28.Position = UDim2.new(0.521125,0,0.478875,0)
G.Frame28.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame28.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame28.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame28.BorderSizePixel = 0
G.Frame28.ZIndex = -1
G.Frame28.Parent = G.BG28

G.UIStroke268 = Instance.new("UIStroke")
G.UIStroke268.Name = "UIStroke"
G.UIStroke268.Thickness = 4
G.UIStroke268.Parent = G.Frame28

G.Item28 = Instance.new("ImageLabel")
G.Item28.Name = "Item2"
G.Item28.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item28.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item28.AnchorPoint = Vector2.new(0.5,0.5)
G.Item28.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item28.BackgroundTransparency = 1
G.Item28.BorderSizePixel = 0
G.Item28.Image = "rbxassetid://138096832706650"
G.Item28.ImageRectOffset = Vector2.new(25,25)
G.Item28.ImageRectSize = Vector2.new(700,700)
G.Item28.ScaleType = Enum.ScaleType.Fit
G.Item28.Visible = false
G.Item28.ZIndex = -1
G.Item28.Parent = G.Template3

G.Unavailable84 = Instance.new("TextLabel")
G.Unavailable84.Name = "Unavailable"
G.Unavailable84.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable84.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable84.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable84.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable84.BackgroundTransparency = 1
G.Unavailable84.BorderSizePixel = 0
G.Unavailable84.Text = "Unavailable"
G.Unavailable84.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable84.TextSize = 14
G.Unavailable84.Font = Enum.Font.FredokaOne
G.Unavailable84.TextWrapped = true
G.Unavailable84.TextScaled = true
G.Unavailable84.Visible = false
G.Unavailable84.Parent = G.Item28

G.UIStroke269 = Instance.new("UIStroke")
G.UIStroke269.Name = "UIStroke"
G.UIStroke269.Thickness = 2
G.UIStroke269.Parent = G.Unavailable84

G.Pixel11 = Instance.new("ImageLabel")
G.Pixel11.Name = "Pixel"
G.Pixel11.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel11.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel11.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel11.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel11.BorderSizePixel = 0
G.Pixel11.Image = "rbxassetid://94959635148921"
G.Pixel11.ImageRectOffset = Vector2.new(55,100)
G.Pixel11.ImageRectSize = Vector2.new(30,30)
G.Pixel11.ScaleType = Enum.ScaleType.Crop
G.Pixel11.Visible = false
G.Pixel11.ZIndex = 5
G.Pixel11.Parent = G.Template3

G.Unavailable85 = Instance.new("TextLabel")
G.Unavailable85.Name = "Unavailable"
G.Unavailable85.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable85.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable85.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable85.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable85.BackgroundTransparency = 1
G.Unavailable85.BorderSizePixel = 0
G.Unavailable85.Text = "Unavailable"
G.Unavailable85.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable85.TextSize = 14
G.Unavailable85.Font = Enum.Font.FredokaOne
G.Unavailable85.TextWrapped = true
G.Unavailable85.TextScaled = true
G.Unavailable85.Visible = false
G.Unavailable85.Parent = G.Pixel11

G.UIStroke270 = Instance.new("UIStroke")
G.UIStroke270.Name = "UIStroke"
G.UIStroke270.Thickness = 2
G.UIStroke270.Parent = G.Unavailable85

G.Purchase28 = Instance.new("ImageButton")
G.Purchase28.Name = "Purchase"
G.Purchase28.Size = UDim2.new(0.902423,0,0.116761,0)
G.Purchase28.Position = UDim2.new(0.521125,0,0.866764,0)
G.Purchase28.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase28.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase28.BorderSizePixel = 0
G.Purchase28.ScaleType = Enum.ScaleType.Fit
G.Purchase28.AutoButtonColor = false
G.Purchase28.Active = false
G.Purchase28.Parent = G.Template3

G.Price28 = Instance.new("TextLabel")
G.Price28.Name = "Price"
G.Price28.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price28.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price28.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price28.BackgroundTransparency = 1
G.Price28.BorderSizePixel = 0
G.Price28.Text = "$19.99"
G.Price28.TextColor3 = Color3.fromRGB(255,255,255)
G.Price28.TextSize = 14
G.Price28.Font = Enum.Font.Arcade
G.Price28.TextWrapped = true
G.Price28.TextScaled = true
G.Price28.RichText = true
G.Price28.AutomaticSize = Enum.AutomaticSize.X
G.Price28.Parent = G.Purchase28

G.UIGradient105 = Instance.new("UIGradient")
G.UIGradient105.Name = "UIGradient"
G.UIGradient105.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient105.Rotation = -90
G.UIGradient105.Offset = Vector2.new(0,0)
G.UIGradient105.Parent = G.Price28

G.UIStroke271 = Instance.new("UIStroke")
G.UIStroke271.Name = "UIStroke"
G.UIStroke271.Thickness = 2
G.UIStroke271.Parent = G.Price28

G.UICorner29 = Instance.new("UICorner")
G.UICorner29.Name = "UICorner"
G.UICorner29.CornerRadius = UDim.new(1,0)
G.UICorner29.Parent = G.Purchase28

G.UIGradient106 = Instance.new("UIGradient")
G.UIGradient106.Name = "UIGradient"
G.UIGradient106.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient106.Rotation = -90
G.UIGradient106.Offset = Vector2.new(0,0)
G.UIGradient106.Parent = G.Purchase28

G.UIStroke272 = Instance.new("UIStroke")
G.UIStroke272.Name = "UIStroke"
G.UIStroke272.Thickness = 2.5
G.UIStroke272.Parent = G.Purchase28

G.Title28 = Instance.new("TextLabel")
G.Title28.Name = "Title"
G.Title28.Size = UDim2.new(0.854506,0,0.108842,0)
G.Title28.Position = UDim2.new(0.521125,0,0.0306124,0)
G.Title28.AnchorPoint = Vector2.new(0.5,0)
G.Title28.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title28.BackgroundTransparency = 1
G.Title28.BorderSizePixel = 0
G.Title28.Text = "COM-9165422475759190499"
G.Title28.TextColor3 = Color3.fromRGB(0,0,0)
G.Title28.TextSize = 29
G.Title28.Font = Enum.Font.Arcade
G.Title28.TextXAlignment = Enum.TextXAlignment.Left
G.Title28.TextYAlignment = Enum.TextYAlignment.Top
G.Title28.TextWrapped = true
G.Title28.TextScaled = true
G.Title28.RichText = true
G.Title28.AutomaticSize = Enum.AutomaticSize.X
G.Title28.Parent = G.Template3

G.UITextSizeConstraint14 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint14.Name = "UITextSizeConstraint"
G.UITextSizeConstraint14.MaxTextSize = 29
G.UITextSizeConstraint14.Parent = G.Title28

G.UIAspectRatioConstraint15 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint15.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint15.AspectRatio = 0.76
G.UIAspectRatioConstraint15.Parent = G.Template3

G.UIListLayout16 = Instance.new("UIListLayout")
G.UIListLayout16.Name = "UIListLayout"
G.UIListLayout16.Padding = UDim.new(0.019,0)
G.UIListLayout16.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout16.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout16.Wraps = false
G.UIListLayout16.Parent = G.Row

G.Special15 = Instance.new("Frame")
G.Special15.Name = "Special"
G.Special15.Size = UDim2.new(0.728177,0,0.493216,0)
G.Special15.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
G.Special15.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special15.BackgroundTransparency = 1
G.Special15.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special15.BorderSizePixel = 0
G.Special15.LayoutOrder = -4
G.Special15.Parent = G.ScrollingFrame

G.COM_4613190819073753561 = Instance.new("Frame")
G.COM_4613190819073753561.Name = "COM-4613190819073753561"
G.COM_4613190819073753561.Size = UDim2.new(0.894198,0,0.931112,0)
G.COM_4613190819073753561.Position = UDim2.new(5.4771e-08,0,0,0)
G.COM_4613190819073753561.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_4613190819073753561.BackgroundTransparency = 1
G.COM_4613190819073753561.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_4613190819073753561.BorderSizePixel = 0
G.COM_4613190819073753561.ZIndex = 2
G.COM_4613190819073753561.Parent = G.Special15

G.BG29 = Instance.new("Frame")
G.BG29.Name = "BG"
G.BG29.Size = UDim2.new(1,0,1,0)
G.BG29.Position = UDim2.new(0.5,0,0.5,0)
G.BG29.AnchorPoint = Vector2.new(0.5,0.5)
G.BG29.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG29.BackgroundTransparency = 1
G.BG29.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG29.BorderSizePixel = 0
G.BG29.ZIndex = -1
G.BG29.Parent = G.COM_4613190819073753561

G.Dropshadow28 = Instance.new("Frame")
G.Dropshadow28.Name = "Dropshadow"
G.Dropshadow28.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow28.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow28.AnchorPoint = Vector2.new(0,1)
G.Dropshadow28.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow28.BackgroundTransparency = 0.5
G.Dropshadow28.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow28.BorderSizePixel = 0
G.Dropshadow28.ZIndex = -2
G.Dropshadow28.Parent = G.BG29

G.UIStroke273 = Instance.new("UIStroke")
G.UIStroke273.Name = "UIStroke"
G.UIStroke273.Thickness = 2.79551
G.UIStroke273.Transparency = 1
G.UIStroke273.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke273.Parent = G.Dropshadow28

G.Frame29 = Instance.new("Frame")
G.Frame29.Name = "Frame"
G.Frame29.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame29.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame29.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame29.BackgroundColor3 = Color3.fromRGB(216,175,177)
G.Frame29.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame29.BorderSizePixel = 0
G.Frame29.ZIndex = -1
G.Frame29.Parent = G.BG29

G.Pattern25 = Instance.new("ImageLabel")
G.Pattern25.Name = "Pattern"
G.Pattern25.Size = UDim2.new(1,0,1,0)
G.Pattern25.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern25.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern25.BackgroundTransparency = 1
G.Pattern25.BorderSizePixel = 0
G.Pattern25.Image = "rbxassetid://93965194514144"
G.Pattern25.ZIndex = -1
G.Pattern25.Parent = G.Frame29

G.UIGradient107 = Instance.new("UIGradient")
G.UIGradient107.Name = "UIGradient"
G.UIGradient107.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
G.UIGradient107.Rotation = 90
G.UIGradient107.Offset = Vector2.new(0,0)
G.UIGradient107.Parent = G.Pattern25

G.UIStroke274 = Instance.new("UIStroke")
G.UIStroke274.Name = "UIStroke"
G.UIStroke274.Thickness = 1.86368
G.UIStroke274.Parent = G.Pattern25

G.UIGradient108 = Instance.new("UIGradient")
G.UIGradient108.Name = "UIGradient"
G.UIGradient108.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient108.Rotation = 90
G.UIGradient108.Offset = Vector2.new(0,0)
G.UIGradient108.Parent = G.Frame29

G.UIStroke275 = Instance.new("UIStroke")
G.UIStroke275.Name = "UIStroke"
G.UIStroke275.Thickness = 1.86368
G.UIStroke275.Parent = G.Frame29

G.Highlight25 = Instance.new("Frame")
G.Highlight25.Name = "Highlight"
G.Highlight25.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight25.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight25.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight25.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight25.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight25.BorderSizePixel = 0
G.Highlight25.Visible = false
G.Highlight25.ZIndex = -2
G.Highlight25.Parent = G.BG29

G.UIStroke276 = Instance.new("UIStroke")
G.UIStroke276.Name = "UIStroke"
G.UIStroke276.Color = Color3.fromRGB(255,242,0)
G.UIStroke276.Thickness = 2.79551
G.UIStroke276.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke276.Parent = G.Highlight25

G.DisplayTitle20 = Instance.new("TextLabel")
G.DisplayTitle20.Name = "DisplayTitle"
G.DisplayTitle20.Size = UDim2.new(0.428097,0,0.415185,0)
G.DisplayTitle20.Position = UDim2.new(0.767443,0,0.212655,0)
G.DisplayTitle20.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle20.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle20.BackgroundTransparency = 1
G.DisplayTitle20.BorderSizePixel = 0
G.DisplayTitle20.Text = "Twisted Dandy Deluxe 14\" Plush (Pre-Order)"
G.DisplayTitle20.TextColor3 = Color3.fromRGB(2,40,0)
G.DisplayTitle20.TextSize = 29
G.DisplayTitle20.Font = Enum.Font.Arcade
G.DisplayTitle20.TextWrapped = true
G.DisplayTitle20.TextScaled = true
G.DisplayTitle20.RichText = true
G.DisplayTitle20.Parent = G.COM_4613190819073753561

G.UIGradient109 = Instance.new("UIGradient")
G.UIGradient109.Name = "UIGradient"
G.UIGradient109.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient109.Rotation = -90
G.UIGradient109.Offset = Vector2.new(0,0)
G.UIGradient109.Parent = G.DisplayTitle20

G.UIStroke277 = Instance.new("UIStroke")
G.UIStroke277.Name = "UIStroke"
G.UIStroke277.Color = Color3.fromRGB(255,255,255)
G.UIStroke277.Thickness = 0.931838
G.UIStroke277.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke277.Parent = G.DisplayTitle20

G.Item29 = Instance.new("ImageLabel")
G.Item29.Name = "Item"
G.Item29.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item29.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item29.AnchorPoint = Vector2.new(0.5,0.5)
G.Item29.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item29.BackgroundTransparency = 1
G.Item29.BorderSizePixel = 0
G.Item29.Image = "rbxassetid://94959635148921"
G.Item29.ImageRectOffset = Vector2.new(15,15)
G.Item29.ImageRectSize = Vector2.new(270,270)
G.Item29.ScaleType = Enum.ScaleType.Fit
G.Item29.Visible = false
G.Item29.ZIndex = -1
G.Item29.Parent = G.COM_4613190819073753561

G.Unavailable86 = Instance.new("TextLabel")
G.Unavailable86.Name = "Unavailable"
G.Unavailable86.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable86.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable86.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable86.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable86.BackgroundTransparency = 1
G.Unavailable86.BorderSizePixel = 0
G.Unavailable86.Text = "Unavailable"
G.Unavailable86.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable86.TextSize = 14
G.Unavailable86.Font = Enum.Font.FredokaOne
G.Unavailable86.TextWrapped = true
G.Unavailable86.TextScaled = true
G.Unavailable86.Visible = false
G.Unavailable86.Parent = G.Item29

G.UIStroke278 = Instance.new("UIStroke")
G.UIStroke278.Name = "UIStroke"
G.UIStroke278.Thickness = 2
G.UIStroke278.Parent = G.Unavailable86

G.New14 = Instance.new("ImageLabel")
G.New14.Name = "New"
G.New14.Size = UDim2.new(0.322123,0,0.355513,0)
G.New14.Position = UDim2.new(0.94212,0,0.0839209,0)
G.New14.AnchorPoint = Vector2.new(0.5,0.5)
G.New14.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New14.BackgroundTransparency = 1
G.New14.BorderSizePixel = 0
G.New14.Image = "rbxassetid://96728750855907"
G.New14.ScaleType = Enum.ScaleType.Fit
G.New14.Visible = false
G.New14.ZIndex = -1
G.New14.Parent = G.COM_4613190819073753561

G.UIScale41 = Instance.new("UIScale")
G.UIScale41.Name = "UIScale"
G.UIScale41.Parent = G.New14

G.Purchase29 = Instance.new("ImageButton")
G.Purchase29.Name = "Purchase"
G.Purchase29.Size = UDim2.new(0.436835,0,0.172928,0)
G.Purchase29.Position = UDim2.new(0.752098,0,0.833662,0)
G.Purchase29.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase29.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase29.BorderSizePixel = 0
G.Purchase29.ScaleType = Enum.ScaleType.Fit
G.Purchase29.AutoButtonColor = false
G.Purchase29.ZIndex = 5
G.Purchase29.Parent = G.COM_4613190819073753561

G.Price29 = Instance.new("TextLabel")
G.Price29.Name = "Price"
G.Price29.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price29.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price29.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price29.BackgroundTransparency = 1
G.Price29.BorderSizePixel = 0
G.Price29.Text = "$19.99"
G.Price29.TextColor3 = Color3.fromRGB(255,255,255)
G.Price29.TextSize = 14
G.Price29.Font = Enum.Font.Arcade
G.Price29.TextWrapped = true
G.Price29.TextScaled = true
G.Price29.RichText = true
G.Price29.AutomaticSize = Enum.AutomaticSize.X
G.Price29.Parent = G.Purchase29

G.UIGradient110 = Instance.new("UIGradient")
G.UIGradient110.Name = "UIGradient"
G.UIGradient110.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient110.Rotation = -90
G.UIGradient110.Offset = Vector2.new(0,0)
G.UIGradient110.Parent = G.Price29

G.UIStroke279 = Instance.new("UIStroke")
G.UIStroke279.Name = "UIStroke"
G.UIStroke279.Thickness = 0.931838
G.UIStroke279.Parent = G.Price29

G.UICorner30 = Instance.new("UICorner")
G.UICorner30.Name = "UICorner"
G.UICorner30.CornerRadius = UDim.new(1,0)
G.UICorner30.Parent = G.Purchase29

G.UIGradient111 = Instance.new("UIGradient")
G.UIGradient111.Name = "UIGradient"
G.UIGradient111.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient111.Rotation = -90
G.UIGradient111.Offset = Vector2.new(0,0)
G.UIGradient111.Parent = G.Purchase29

G.UIScale42 = Instance.new("UIScale")
G.UIScale42.Name = "UIScale"
G.UIScale42.Parent = G.Purchase29

G.UIStroke280 = Instance.new("UIStroke")
G.UIStroke280.Name = "UIStroke"
G.UIStroke280.Thickness = 1.1648
G.UIStroke280.Parent = G.Purchase29

G.Thumbnail47 = Instance.new("ImageLabel")
G.Thumbnail47.Name = "Thumbnail"
G.Thumbnail47.Size = UDim2.new(0.298543,0,0.778322,0)
G.Thumbnail47.Position = UDim2.new(0.134921,0,0.239257,0)
G.Thumbnail47.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail47.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail47.BackgroundTransparency = 1
G.Thumbnail47.BorderSizePixel = 0
G.Thumbnail47.Image = "rbxassetid://124118954587015"
G.Thumbnail47.ScaleType = Enum.ScaleType.Fit
G.Thumbnail47.ZIndex = 2
G.Thumbnail47.Parent = G.COM_4613190819073753561

G.Unavailable87 = Instance.new("TextLabel")
G.Unavailable87.Name = "Unavailable"
G.Unavailable87.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable87.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable87.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable87.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable87.BackgroundTransparency = 1
G.Unavailable87.BorderSizePixel = 0
G.Unavailable87.Text = "Unavailable"
G.Unavailable87.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable87.TextSize = 14
G.Unavailable87.Font = Enum.Font.FredokaOne
G.Unavailable87.TextWrapped = true
G.Unavailable87.TextScaled = true
G.Unavailable87.Visible = false
G.Unavailable87.Parent = G.Thumbnail47

G.UIStroke281 = Instance.new("UIStroke")
G.UIStroke281.Name = "UIStroke"
G.UIStroke281.Thickness = 2
G.UIStroke281.Parent = G.Unavailable87

G.Thumbnail48 = Instance.new("ImageLabel")
G.Thumbnail48.Name = "Thumbnail"
G.Thumbnail48.Size = UDim2.new(0.48234,0,1.2575,0)
G.Thumbnail48.Position = UDim2.new(0.381404,0,0.450994,0)
G.Thumbnail48.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail48.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail48.BackgroundTransparency = 1
G.Thumbnail48.BorderSizePixel = 0
G.Thumbnail48.Image = "rbxassetid://106657924883527"
G.Thumbnail48.ScaleType = Enum.ScaleType.Fit
G.Thumbnail48.ZIndex = 4
G.Thumbnail48.Parent = G.COM_4613190819073753561

G.Unavailable88 = Instance.new("TextLabel")
G.Unavailable88.Name = "Unavailable"
G.Unavailable88.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable88.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable88.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable88.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable88.BackgroundTransparency = 1
G.Unavailable88.BorderSizePixel = 0
G.Unavailable88.Text = "Unavailable"
G.Unavailable88.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable88.TextSize = 14
G.Unavailable88.Font = Enum.Font.FredokaOne
G.Unavailable88.TextWrapped = true
G.Unavailable88.TextScaled = true
G.Unavailable88.Visible = false
G.Unavailable88.Parent = G.Thumbnail48

G.UIStroke282 = Instance.new("UIStroke")
G.UIStroke282.Name = "UIStroke"
G.UIStroke282.Thickness = 2
G.UIStroke282.Parent = G.Unavailable88

G.Title29 = Instance.new("TextLabel")
G.Title29.Name = "Title"
G.Title29.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title29.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title29.AnchorPoint = Vector2.new(0.5,0)
G.Title29.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title29.BackgroundTransparency = 1
G.Title29.BorderSizePixel = 0
G.Title29.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title29.TextColor3 = Color3.fromRGB(0,13,76)
G.Title29.TextSize = 29
G.Title29.Font = Enum.Font.Arcade
G.Title29.TextWrapped = true
G.Title29.TextScaled = true
G.Title29.RichText = true
G.Title29.Visible = false
G.Title29.AutomaticSize = Enum.AutomaticSize.X
G.Title29.Parent = G.COM_4613190819073753561

G.UIGradient112 = Instance.new("UIGradient")
G.UIGradient112.Name = "UIGradient"
G.UIGradient112.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient112.Rotation = -90
G.UIGradient112.Offset = Vector2.new(0,0)
G.UIGradient112.Parent = G.Title29

G.UIStroke283 = Instance.new("UIStroke")
G.UIStroke283.Name = "UIStroke"
G.UIStroke283.Color = Color3.fromRGB(255,255,255)
G.UIStroke283.Thickness = 2
G.UIStroke283.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke283.Parent = G.Title29

G.COM_8259980617337012763 = Instance.new("Frame")
G.COM_8259980617337012763.Name = "COM-8259980617337012763"
G.COM_8259980617337012763.Size = UDim2.new(0.442523,0,0.944677,0)
G.COM_8259980617337012763.Position = UDim2.new(0.913307,0,0,0)
G.COM_8259980617337012763.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_8259980617337012763.BackgroundTransparency = 1
G.COM_8259980617337012763.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_8259980617337012763.BorderSizePixel = 0
G.COM_8259980617337012763.Parent = G.Special15

G.BG30 = Instance.new("Frame")
G.BG30.Name = "BG"
G.BG30.Size = UDim2.new(1,0,1,0)
G.BG30.Position = UDim2.new(0.5,0,0.5,0)
G.BG30.AnchorPoint = Vector2.new(0.5,0.5)
G.BG30.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG30.BackgroundTransparency = 1
G.BG30.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG30.BorderSizePixel = 0
G.BG30.ZIndex = -1
G.BG30.Parent = G.COM_8259980617337012763

G.Dropshadow29 = Instance.new("Frame")
G.Dropshadow29.Name = "Dropshadow"
G.Dropshadow29.Size = UDim2.new(0.947997,0,0.95376,0)
G.Dropshadow29.Position = UDim2.new(-0.00747363,0,1.01324,0)
G.Dropshadow29.AnchorPoint = Vector2.new(0,1)
G.Dropshadow29.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow29.BackgroundTransparency = 0.5
G.Dropshadow29.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow29.BorderSizePixel = 0
G.Dropshadow29.ZIndex = -2
G.Dropshadow29.Parent = G.BG30

G.UIStroke284 = Instance.new("UIStroke")
G.UIStroke284.Name = "UIStroke"
G.UIStroke284.Thickness = 2.79551
G.UIStroke284.Transparency = 1
G.UIStroke284.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke284.Parent = G.Dropshadow29

G.Frame30 = Instance.new("Frame")
G.Frame30.Name = "Frame"
G.Frame30.Size = UDim2.new(0.95775,0,0.95775,0)
G.Frame30.Position = UDim2.new(0.521125,0,0.478875,0)
G.Frame30.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame30.BackgroundColor3 = Color3.fromRGB(216,175,177)
G.Frame30.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame30.BorderSizePixel = 0
G.Frame30.ZIndex = -1
G.Frame30.Parent = G.BG30

G.Pattern26 = Instance.new("ImageLabel")
G.Pattern26.Name = "Pattern"
G.Pattern26.Size = UDim2.new(1,0,1,0)
G.Pattern26.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern26.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern26.BackgroundTransparency = 1
G.Pattern26.BorderSizePixel = 0
G.Pattern26.Image = "rbxassetid://135202983221007"
G.Pattern26.ScaleType = Enum.ScaleType.Crop
G.Pattern26.ZIndex = -1
G.Pattern26.Parent = G.Frame30

G.UIGradient113 = Instance.new("UIGradient")
G.UIGradient113.Name = "UIGradient"
G.UIGradient113.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
G.UIGradient113.Rotation = 90
G.UIGradient113.Offset = Vector2.new(0,0)
G.UIGradient113.Parent = G.Pattern26

G.UIStroke285 = Instance.new("UIStroke")
G.UIStroke285.Name = "UIStroke"
G.UIStroke285.Thickness = 1.86368
G.UIStroke285.Parent = G.Pattern26

G.UIGradient114 = Instance.new("UIGradient")
G.UIGradient114.Name = "UIGradient"
G.UIGradient114.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient114.Rotation = 90
G.UIGradient114.Offset = Vector2.new(0,0)
G.UIGradient114.Parent = G.Frame30

G.UIStroke286 = Instance.new("UIStroke")
G.UIStroke286.Name = "UIStroke"
G.UIStroke286.Thickness = 4
G.UIStroke286.Parent = G.Frame30

G.Highlight26 = Instance.new("Frame")
G.Highlight26.Name = "Highlight"
G.Highlight26.Size = UDim2.new(0.954203,0,0.95775,0)
G.Highlight26.Position = UDim2.new(0.519351,0,0.478875,0)
G.Highlight26.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight26.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight26.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight26.BorderSizePixel = 0
G.Highlight26.Visible = false
G.Highlight26.ZIndex = -2
G.Highlight26.Parent = G.BG30

G.UIStroke287 = Instance.new("UIStroke")
G.UIStroke287.Name = "UIStroke"
G.UIStroke287.Color = Color3.fromRGB(255,242,0)
G.UIStroke287.Thickness = 2.79551
G.UIStroke287.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke287.Parent = G.Highlight26

G.Item30 = Instance.new("ImageLabel")
G.Item30.Name = "Item"
G.Item30.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item30.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item30.AnchorPoint = Vector2.new(0.5,0.5)
G.Item30.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item30.BackgroundTransparency = 1
G.Item30.BorderSizePixel = 0
G.Item30.Image = "rbxassetid://94959635148921"
G.Item30.ImageRectOffset = Vector2.new(25,25)
G.Item30.ImageRectSize = Vector2.new(250,250)
G.Item30.ScaleType = Enum.ScaleType.Crop
G.Item30.Visible = false
G.Item30.ZIndex = -1
G.Item30.Parent = G.COM_8259980617337012763

G.Unavailable89 = Instance.new("TextLabel")
G.Unavailable89.Name = "Unavailable"
G.Unavailable89.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable89.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable89.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable89.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable89.BackgroundTransparency = 1
G.Unavailable89.BorderSizePixel = 0
G.Unavailable89.Text = "Unavailable"
G.Unavailable89.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable89.TextSize = 14
G.Unavailable89.Font = Enum.Font.FredokaOne
G.Unavailable89.TextWrapped = true
G.Unavailable89.TextScaled = true
G.Unavailable89.Visible = false
G.Unavailable89.Parent = G.Item30

G.UIStroke288 = Instance.new("UIStroke")
G.UIStroke288.Name = "UIStroke"
G.UIStroke288.Thickness = 2
G.UIStroke288.Parent = G.Unavailable89

G.Pixel12 = Instance.new("ImageLabel")
G.Pixel12.Name = "Pixel"
G.Pixel12.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel12.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel12.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel12.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel12.BorderSizePixel = 0
G.Pixel12.Image = "rbxassetid://94959635148921"
G.Pixel12.ImageRectOffset = Vector2.new(55,100)
G.Pixel12.ImageRectSize = Vector2.new(30,30)
G.Pixel12.ScaleType = Enum.ScaleType.Crop
G.Pixel12.Visible = false
G.Pixel12.ZIndex = 5
G.Pixel12.Parent = G.COM_8259980617337012763

G.Unavailable90 = Instance.new("TextLabel")
G.Unavailable90.Name = "Unavailable"
G.Unavailable90.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable90.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable90.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable90.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable90.BackgroundTransparency = 1
G.Unavailable90.BorderSizePixel = 0
G.Unavailable90.Text = "Unavailable"
G.Unavailable90.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable90.TextSize = 14
G.Unavailable90.Font = Enum.Font.FredokaOne
G.Unavailable90.TextWrapped = true
G.Unavailable90.TextScaled = true
G.Unavailable90.Visible = false
G.Unavailable90.Parent = G.Pixel12

G.UIStroke289 = Instance.new("UIStroke")
G.UIStroke289.Name = "UIStroke"
G.UIStroke289.Thickness = 2
G.UIStroke289.Parent = G.Unavailable90

G.Purchase30 = Instance.new("ImageButton")
G.Purchase30.Name = "Purchase"
G.Purchase30.Size = UDim2.new(0.863319,0,0.170445,0)
G.Purchase30.Position = UDim2.new(0.514166,0,0.821691,0)
G.Purchase30.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase30.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase30.BorderSizePixel = 0
G.Purchase30.ScaleType = Enum.ScaleType.Fit
G.Purchase30.AutoButtonColor = false
G.Purchase30.ZIndex = 6
G.Purchase30.Parent = G.COM_8259980617337012763

G.Price30 = Instance.new("TextLabel")
G.Price30.Name = "Price"
G.Price30.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price30.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price30.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price30.BackgroundTransparency = 1
G.Price30.BorderSizePixel = 0
G.Price30.Text = "$19.99"
G.Price30.TextColor3 = Color3.fromRGB(255,255,255)
G.Price30.TextSize = 14
G.Price30.Font = Enum.Font.Arcade
G.Price30.TextWrapped = true
G.Price30.TextScaled = true
G.Price30.RichText = true
G.Price30.AutomaticSize = Enum.AutomaticSize.X
G.Price30.Parent = G.Purchase30

G.UIGradient115 = Instance.new("UIGradient")
G.UIGradient115.Name = "UIGradient"
G.UIGradient115.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient115.Rotation = -90
G.UIGradient115.Offset = Vector2.new(0,0)
G.UIGradient115.Parent = G.Price30

G.UIStroke290 = Instance.new("UIStroke")
G.UIStroke290.Name = "UIStroke"
G.UIStroke290.Thickness = 2
G.UIStroke290.Parent = G.Price30

G.UICorner31 = Instance.new("UICorner")
G.UICorner31.Name = "UICorner"
G.UICorner31.CornerRadius = UDim.new(1,0)
G.UICorner31.Parent = G.Purchase30

G.UIGradient116 = Instance.new("UIGradient")
G.UIGradient116.Name = "UIGradient"
G.UIGradient116.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient116.Rotation = -90
G.UIGradient116.Offset = Vector2.new(0,0)
G.UIGradient116.Parent = G.Purchase30

G.UIScale43 = Instance.new("UIScale")
G.UIScale43.Name = "UIScale"
G.UIScale43.Parent = G.Purchase30

G.UIStroke291 = Instance.new("UIStroke")
G.UIStroke291.Name = "UIStroke"
G.UIStroke291.Thickness = 2.5
G.UIStroke291.Parent = G.Purchase30

G.Thumbnail49 = Instance.new("ImageLabel")
G.Thumbnail49.Name = "Thumbnail"
G.Thumbnail49.Size = UDim2.new(1.18949,0,0.857211,0)
G.Thumbnail49.Position = UDim2.new(0.511832,0,0.404893,0)
G.Thumbnail49.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail49.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail49.BackgroundTransparency = 1
G.Thumbnail49.BorderSizePixel = 0
G.Thumbnail49.Image = "rbxassetid://133996051314877"
G.Thumbnail49.ScaleType = Enum.ScaleType.Crop
G.Thumbnail49.ZIndex = -1
G.Thumbnail49.Parent = G.COM_8259980617337012763

G.Unavailable91 = Instance.new("TextLabel")
G.Unavailable91.Name = "Unavailable"
G.Unavailable91.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable91.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable91.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable91.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable91.BackgroundTransparency = 1
G.Unavailable91.BorderSizePixel = 0
G.Unavailable91.Text = "Unavailable"
G.Unavailable91.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable91.TextSize = 14
G.Unavailable91.Font = Enum.Font.FredokaOne
G.Unavailable91.TextWrapped = true
G.Unavailable91.TextScaled = true
G.Unavailable91.Visible = false
G.Unavailable91.Parent = G.Thumbnail49

G.UIStroke292 = Instance.new("UIStroke")
G.UIStroke292.Name = "UIStroke"
G.UIStroke292.Thickness = 2
G.UIStroke292.Parent = G.Unavailable91

G.Title30 = Instance.new("TextLabel")
G.Title30.Name = "Title"
G.Title30.Size = UDim2.new(0.874784,0,0.149,0)
G.Title30.Position = UDim2.new(0.531264,0,0.0306123,0)
G.Title30.AnchorPoint = Vector2.new(0.5,0)
G.Title30.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title30.BackgroundTransparency = 1
G.Title30.BorderSizePixel = 0
G.Title30.Text = "Bobette 11" x 14" Poster"
G.Title30.TextColor3 = Color3.fromRGB(0,0,0)
G.Title30.TextSize = 29
G.Title30.Font = Enum.Font.Arcade
G.Title30.TextXAlignment = Enum.TextXAlignment.Left
G.Title30.TextYAlignment = Enum.TextYAlignment.Top
G.Title30.TextWrapped = true
G.Title30.TextScaled = true
G.Title30.RichText = true
G.Title30.Visible = false
G.Title30.AutomaticSize = Enum.AutomaticSize.X
G.Title30.Parent = G.COM_8259980617337012763

G.UITextSizeConstraint15 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint15.Name = "UITextSizeConstraint"
G.UITextSizeConstraint15.MaxTextSize = 29
G.UITextSizeConstraint15.Parent = G.Title30

G.UIListLayout17 = Instance.new("UIListLayout")
G.UIListLayout17.Name = "UIListLayout"
G.UIListLayout17.Padding = UDim.new(0.019,0)
G.UIListLayout17.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout17.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout17.Wraps = false
G.UIListLayout17.Parent = G.Special15

G.Special16 = Instance.new("Frame")
G.Special16.Name = "Special"
G.Special16.Size = UDim2.new(1.10498,0,0.439953,0)
G.Special16.Position = UDim2.new(0,0,-0.143337,0)
G.Special16.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special16.BackgroundTransparency = 1
G.Special16.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special16.BorderSizePixel = 0
G.Special16.LayoutOrder = -3
G.Special16.Parent = G.ScrollingFrame

G.COM_2529898588259746275 = Instance.new("Frame")
G.COM_2529898588259746275.Name = "COM-2529898588259746275"
G.COM_2529898588259746275.Size = UDim2.new(0.894307,0,0.931111,0)
G.COM_2529898588259746275.Position = UDim2.new(-5.79236e-08,0,0,0)
G.COM_2529898588259746275.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_2529898588259746275.BackgroundTransparency = 1
G.COM_2529898588259746275.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_2529898588259746275.BorderSizePixel = 0
G.COM_2529898588259746275.Parent = G.Special16

G.BG31 = Instance.new("Frame")
G.BG31.Name = "BG"
G.BG31.Size = UDim2.new(1,0,1,0)
G.BG31.Position = UDim2.new(0.5,0,0.5,0)
G.BG31.AnchorPoint = Vector2.new(0.5,0.5)
G.BG31.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG31.BackgroundTransparency = 1
G.BG31.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG31.BorderSizePixel = 0
G.BG31.ZIndex = -1
G.BG31.Parent = G.COM_2529898588259746275

G.Dropshadow30 = Instance.new("Frame")
G.Dropshadow30.Name = "Dropshadow"
G.Dropshadow30.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow30.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow30.AnchorPoint = Vector2.new(0,1)
G.Dropshadow30.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow30.BackgroundTransparency = 0.5
G.Dropshadow30.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow30.BorderSizePixel = 0
G.Dropshadow30.ZIndex = -2
G.Dropshadow30.Parent = G.BG31

G.UIStroke293 = Instance.new("UIStroke")
G.UIStroke293.Name = "UIStroke"
G.UIStroke293.Thickness = 2.79551
G.UIStroke293.Transparency = 1
G.UIStroke293.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke293.Parent = G.Dropshadow30

G.Frame31 = Instance.new("Frame")
G.Frame31.Name = "Frame"
G.Frame31.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame31.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame31.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame31.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame31.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame31.BorderSizePixel = 0
G.Frame31.ZIndex = -1
G.Frame31.Parent = G.BG31

G.Pattern27 = Instance.new("ImageLabel")
G.Pattern27.Name = "Pattern"
G.Pattern27.Size = UDim2.new(0.635249,0,1,0)
G.Pattern27.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern27.BackgroundTransparency = 1
G.Pattern27.BorderSizePixel = 0
G.Pattern27.Image = "rbxassetid://92127895583355"
G.Pattern27.ZIndex = -1
G.Pattern27.Parent = G.Frame31

G.UIStroke294 = Instance.new("UIStroke")
G.UIStroke294.Name = "UIStroke"
G.UIStroke294.Thickness = 1.86368
G.UIStroke294.Parent = G.Pattern27

G.UIStroke295 = Instance.new("UIStroke")
G.UIStroke295.Name = "UIStroke"
G.UIStroke295.Thickness = 1.86368
G.UIStroke295.Parent = G.Frame31

G.Highlight27 = Instance.new("Frame")
G.Highlight27.Name = "Highlight"
G.Highlight27.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight27.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight27.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight27.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight27.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight27.BorderSizePixel = 0
G.Highlight27.Visible = false
G.Highlight27.ZIndex = -2
G.Highlight27.Parent = G.BG31

G.UIStroke296 = Instance.new("UIStroke")
G.UIStroke296.Name = "UIStroke"
G.UIStroke296.Color = Color3.fromRGB(255,242,0)
G.UIStroke296.Thickness = 2.79551
G.UIStroke296.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke296.Parent = G.Highlight27

G.CanvasGroup11 = Instance.new("CanvasGroup")
G.CanvasGroup11.Name = "CanvasGroup"
G.CanvasGroup11.Size = UDim2.new(1,0,1,0)
G.CanvasGroup11.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup11.BackgroundTransparency = 1
G.CanvasGroup11.Parent = G.COM_2529898588259746275

G.Thumbnail50 = Instance.new("ImageLabel")
G.Thumbnail50.Name = "Thumbnail"
G.Thumbnail50.Size = UDim2.new(0.37992,0,0.941288,0)
G.Thumbnail50.Position = UDim2.new(0.11109,0,0.564367,0)
G.Thumbnail50.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail50.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail50.BackgroundTransparency = 1
G.Thumbnail50.BorderSizePixel = 0
G.Thumbnail50.Image = "rbxassetid://114298785049809"
G.Thumbnail50.ScaleType = Enum.ScaleType.Fit
G.Thumbnail50.ZIndex = 0
G.Thumbnail50.Rotation = -11
G.Thumbnail50.Parent = G.CanvasGroup11

G.Unavailable92 = Instance.new("TextLabel")
G.Unavailable92.Name = "Unavailable"
G.Unavailable92.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable92.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable92.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable92.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable92.BackgroundTransparency = 1
G.Unavailable92.BorderSizePixel = 0
G.Unavailable92.Text = "Unavailable"
G.Unavailable92.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable92.TextSize = 14
G.Unavailable92.Font = Enum.Font.FredokaOne
G.Unavailable92.TextWrapped = true
G.Unavailable92.TextScaled = true
G.Unavailable92.Visible = false
G.Unavailable92.Parent = G.Thumbnail50

G.UIStroke297 = Instance.new("UIStroke")
G.UIStroke297.Name = "UIStroke"
G.UIStroke297.Thickness = 2
G.UIStroke297.Parent = G.Unavailable92

G.Thumbnail51 = Instance.new("ImageLabel")
G.Thumbnail51.Name = "Thumbnail"
G.Thumbnail51.Size = UDim2.new(0.37992,0,0.990478,0)
G.Thumbnail51.Position = UDim2.new(0.188846,0,0.445004,0)
G.Thumbnail51.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail51.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail51.BackgroundTransparency = 1
G.Thumbnail51.BorderSizePixel = 0
G.Thumbnail51.Image = "rbxassetid://88590750012874"
G.Thumbnail51.ScaleType = Enum.ScaleType.Fit
G.Thumbnail51.ZIndex = -1
G.Thumbnail51.Rotation = 16
G.Thumbnail51.Parent = G.CanvasGroup11

G.Unavailable93 = Instance.new("TextLabel")
G.Unavailable93.Name = "Unavailable"
G.Unavailable93.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable93.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable93.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable93.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable93.BackgroundTransparency = 1
G.Unavailable93.BorderSizePixel = 0
G.Unavailable93.Text = "Unavailable"
G.Unavailable93.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable93.TextSize = 14
G.Unavailable93.Font = Enum.Font.FredokaOne
G.Unavailable93.TextWrapped = true
G.Unavailable93.TextScaled = true
G.Unavailable93.Visible = false
G.Unavailable93.Parent = G.Thumbnail51

G.UIStroke298 = Instance.new("UIStroke")
G.UIStroke298.Name = "UIStroke"
G.UIStroke298.Thickness = 2
G.UIStroke298.Parent = G.Unavailable93

G.Thumbnail52 = Instance.new("ImageLabel")
G.Thumbnail52.Name = "Thumbnail"
G.Thumbnail52.Size = UDim2.new(0.319652,0,0.913829,0)
G.Thumbnail52.Position = UDim2.new(0.34791,0,0.497652,0)
G.Thumbnail52.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail52.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail52.BackgroundTransparency = 1
G.Thumbnail52.BorderSizePixel = 0
G.Thumbnail52.Image = "rbxassetid://114298785049809"
G.Thumbnail52.ScaleType = Enum.ScaleType.Fit
G.Thumbnail52.ZIndex = 0
G.Thumbnail52.Rotation = 13
G.Thumbnail52.Parent = G.CanvasGroup11

G.Unavailable94 = Instance.new("TextLabel")
G.Unavailable94.Name = "Unavailable"
G.Unavailable94.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable94.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable94.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable94.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable94.BackgroundTransparency = 1
G.Unavailable94.BorderSizePixel = 0
G.Unavailable94.Text = "Unavailable"
G.Unavailable94.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable94.TextSize = 14
G.Unavailable94.Font = Enum.Font.FredokaOne
G.Unavailable94.TextWrapped = true
G.Unavailable94.TextScaled = true
G.Unavailable94.Visible = false
G.Unavailable94.Parent = G.Thumbnail52

G.UIStroke299 = Instance.new("UIStroke")
G.UIStroke299.Name = "UIStroke"
G.UIStroke299.Thickness = 2
G.UIStroke299.Parent = G.Unavailable94

G.DisplayTitle21 = Instance.new("TextLabel")
G.DisplayTitle21.Name = "DisplayTitle"
G.DisplayTitle21.Size = UDim2.new(0.28831,0,0.367128,0)
G.DisplayTitle21.Position = UDim2.new(0.814632,0,0.191717,0)
G.DisplayTitle21.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle21.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle21.BackgroundTransparency = 1
G.DisplayTitle21.BorderSizePixel = 0
G.DisplayTitle21.Text = "Vee 14\" Deluxe Plush (Pre-Order)"
G.DisplayTitle21.TextColor3 = Color3.fromRGB(0,0,0)
G.DisplayTitle21.TextSize = 29
G.DisplayTitle21.Font = Enum.Font.Arcade
G.DisplayTitle21.TextWrapped = true
G.DisplayTitle21.TextScaled = true
G.DisplayTitle21.RichText = true
G.DisplayTitle21.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle21.Parent = G.COM_2529898588259746275

G.UIAspectRatioConstraint16 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint16.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint16.AspectRatio = 2.66
G.UIAspectRatioConstraint16.Parent = G.DisplayTitle21

G.UIGradient117 = Instance.new("UIGradient")
G.UIGradient117.Name = "UIGradient"
G.UIGradient117.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient117.Rotation = -90
G.UIGradient117.Offset = Vector2.new(0,0)
G.UIGradient117.Enabled = false
G.UIGradient117.Parent = G.DisplayTitle21

G.UIStroke300 = Instance.new("UIStroke")
G.UIStroke300.Name = "UIStroke"
G.UIStroke300.Color = Color3.fromRGB(255,255,255)
G.UIStroke300.Thickness = 0.931838
G.UIStroke300.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke300.Parent = G.DisplayTitle21

G.Item31 = Instance.new("ImageLabel")
G.Item31.Name = "Item"
G.Item31.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item31.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item31.AnchorPoint = Vector2.new(0.5,0.5)
G.Item31.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item31.BackgroundTransparency = 1
G.Item31.BorderSizePixel = 0
G.Item31.Image = "rbxassetid://94959635148921"
G.Item31.ImageRectOffset = Vector2.new(15,15)
G.Item31.ImageRectSize = Vector2.new(270,270)
G.Item31.ScaleType = Enum.ScaleType.Fit
G.Item31.Visible = false
G.Item31.ZIndex = -1
G.Item31.Parent = G.COM_2529898588259746275

G.Unavailable95 = Instance.new("TextLabel")
G.Unavailable95.Name = "Unavailable"
G.Unavailable95.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable95.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable95.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable95.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable95.BackgroundTransparency = 1
G.Unavailable95.BorderSizePixel = 0
G.Unavailable95.Text = "Unavailable"
G.Unavailable95.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable95.TextSize = 14
G.Unavailable95.Font = Enum.Font.FredokaOne
G.Unavailable95.TextWrapped = true
G.Unavailable95.TextScaled = true
G.Unavailable95.Visible = false
G.Unavailable95.Parent = G.Item31

G.UIStroke301 = Instance.new("UIStroke")
G.UIStroke301.Name = "UIStroke"
G.UIStroke301.Thickness = 2
G.UIStroke301.Parent = G.Unavailable95

G.New15 = Instance.new("ImageLabel")
G.New15.Name = "New"
G.New15.Size = UDim2.new(0.322123,0,0.355513,0)
G.New15.Position = UDim2.new(0.944127,0,0.0328983,0)
G.New15.AnchorPoint = Vector2.new(0.5,0.5)
G.New15.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New15.BackgroundTransparency = 1
G.New15.BorderSizePixel = 0
G.New15.Image = "rbxassetid://96728750855907"
G.New15.ScaleType = Enum.ScaleType.Fit
G.New15.Visible = false
G.New15.ZIndex = -1
G.New15.Parent = G.COM_2529898588259746275

G.UIScale44 = Instance.new("UIScale")
G.UIScale44.Name = "UIScale"
G.UIScale44.Parent = G.New15

G.Purchase31 = Instance.new("ImageButton")
G.Purchase31.Name = "Purchase"
G.Purchase31.Size = UDim2.new(0.299855,0,0.201102,0)
G.Purchase31.Position = UDim2.new(0.814697,0,0.786462,0)
G.Purchase31.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase31.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase31.BorderSizePixel = 0
G.Purchase31.ScaleType = Enum.ScaleType.Fit
G.Purchase31.AutoButtonColor = false
G.Purchase31.Parent = G.COM_2529898588259746275

G.Price31 = Instance.new("TextLabel")
G.Price31.Name = "Price"
G.Price31.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price31.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price31.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price31.BackgroundTransparency = 1
G.Price31.BorderSizePixel = 0
G.Price31.Text = "$19.99"
G.Price31.TextColor3 = Color3.fromRGB(255,255,255)
G.Price31.TextSize = 14
G.Price31.Font = Enum.Font.Arcade
G.Price31.TextWrapped = true
G.Price31.TextScaled = true
G.Price31.RichText = true
G.Price31.AutomaticSize = Enum.AutomaticSize.X
G.Price31.Parent = G.Purchase31

G.UIGradient118 = Instance.new("UIGradient")
G.UIGradient118.Name = "UIGradient"
G.UIGradient118.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient118.Rotation = -90
G.UIGradient118.Offset = Vector2.new(0,0)
G.UIGradient118.Parent = G.Price31

G.UIStroke302 = Instance.new("UIStroke")
G.UIStroke302.Name = "UIStroke"
G.UIStroke302.Thickness = 0.931838
G.UIStroke302.Parent = G.Price31

G.UICorner32 = Instance.new("UICorner")
G.UICorner32.Name = "UICorner"
G.UICorner32.CornerRadius = UDim.new(1,0)
G.UICorner32.Parent = G.Purchase31

G.UIGradient119 = Instance.new("UIGradient")
G.UIGradient119.Name = "UIGradient"
G.UIGradient119.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient119.Rotation = -90
G.UIGradient119.Offset = Vector2.new(0,0)
G.UIGradient119.Parent = G.Purchase31

G.UIScale45 = Instance.new("UIScale")
G.UIScale45.Name = "UIScale"
G.UIScale45.Parent = G.Purchase31

G.UIStroke303 = Instance.new("UIStroke")
G.UIStroke303.Name = "UIStroke"
G.UIStroke303.Thickness = 1.1648
G.UIStroke303.Parent = G.Purchase31

G.Thumbnail53 = Instance.new("ImageLabel")
G.Thumbnail53.Name = "Thumbnail"
G.Thumbnail53.Size = UDim2.new(0.48234,0,1.2575,0)
G.Thumbnail53.Position = UDim2.new(0.543731,0,0.435241,0)
G.Thumbnail53.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail53.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail53.BackgroundTransparency = 1
G.Thumbnail53.BorderSizePixel = 0
G.Thumbnail53.Image = "rbxassetid://113698030534354"
G.Thumbnail53.ScaleType = Enum.ScaleType.Fit
G.Thumbnail53.ZIndex = -1
G.Thumbnail53.Parent = G.COM_2529898588259746275

G.Unavailable96 = Instance.new("TextLabel")
G.Unavailable96.Name = "Unavailable"
G.Unavailable96.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable96.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable96.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable96.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable96.BackgroundTransparency = 1
G.Unavailable96.BorderSizePixel = 0
G.Unavailable96.Text = "Unavailable"
G.Unavailable96.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable96.TextSize = 14
G.Unavailable96.Font = Enum.Font.FredokaOne
G.Unavailable96.TextWrapped = true
G.Unavailable96.TextScaled = true
G.Unavailable96.Visible = false
G.Unavailable96.Parent = G.Thumbnail53

G.UIStroke304 = Instance.new("UIStroke")
G.UIStroke304.Name = "UIStroke"
G.UIStroke304.Thickness = 2
G.UIStroke304.Parent = G.Unavailable96

G.Title31 = Instance.new("TextLabel")
G.Title31.Name = "Title"
G.Title31.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title31.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title31.AnchorPoint = Vector2.new(0.5,0)
G.Title31.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title31.BackgroundTransparency = 1
G.Title31.BorderSizePixel = 0
G.Title31.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title31.TextColor3 = Color3.fromRGB(0,13,76)
G.Title31.TextSize = 29
G.Title31.Font = Enum.Font.Arcade
G.Title31.TextWrapped = true
G.Title31.TextScaled = true
G.Title31.RichText = true
G.Title31.Visible = false
G.Title31.AutomaticSize = Enum.AutomaticSize.X
G.Title31.Parent = G.COM_2529898588259746275

G.UIGradient120 = Instance.new("UIGradient")
G.UIGradient120.Name = "UIGradient"
G.UIGradient120.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient120.Rotation = -90
G.UIGradient120.Offset = Vector2.new(0,0)
G.UIGradient120.Parent = G.Title31

G.UIStroke305 = Instance.new("UIStroke")
G.UIStroke305.Name = "UIStroke"
G.UIStroke305.Color = Color3.fromRGB(255,255,255)
G.UIStroke305.Thickness = 2
G.UIStroke305.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke305.Parent = G.Title31

G.UIListLayout18 = Instance.new("UIListLayout")
G.UIListLayout18.Name = "UIListLayout"
G.UIListLayout18.Padding = UDim.new(0.019,0)
G.UIListLayout18.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout18.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout18.Wraps = false
G.UIListLayout18.Parent = G.Special16

G.Special17 = Instance.new("Frame")
G.Special17.Name = "Special"
G.Special17.Size = UDim2.new(0.728177,0,0.493216,0)
G.Special17.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
G.Special17.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special17.BackgroundTransparency = 1
G.Special17.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special17.BorderSizePixel = 0
G.Special17.LayoutOrder = -3
G.Special17.Parent = G.ScrollingFrame

G.COM_8822819512910251 = Instance.new("Frame")
G.COM_8822819512910251.Name = "COM-8822819512910251"
G.COM_8822819512910251.Size = UDim2.new(0.669469,0,0.931111,0)
G.COM_8822819512910251.Position = UDim2.new(-1.75854e-07,0,0,0)
G.COM_8822819512910251.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_8822819512910251.BackgroundTransparency = 1
G.COM_8822819512910251.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_8822819512910251.BorderSizePixel = 0
G.COM_8822819512910251.LayoutOrder = -1
G.COM_8822819512910251.Parent = G.Special17

G.BG32 = Instance.new("Frame")
G.BG32.Name = "BG"
G.BG32.Size = UDim2.new(1,0,1,0)
G.BG32.Position = UDim2.new(0.5,0,0.5,0)
G.BG32.AnchorPoint = Vector2.new(0.5,0.5)
G.BG32.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG32.BackgroundTransparency = 1
G.BG32.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG32.BorderSizePixel = 0
G.BG32.ZIndex = -1
G.BG32.Parent = G.COM_8822819512910251

G.Dropshadow31 = Instance.new("Frame")
G.Dropshadow31.Name = "Dropshadow"
G.Dropshadow31.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow31.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow31.AnchorPoint = Vector2.new(0,1)
G.Dropshadow31.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow31.BackgroundTransparency = 0.5
G.Dropshadow31.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow31.BorderSizePixel = 0
G.Dropshadow31.ZIndex = -2
G.Dropshadow31.Parent = G.BG32

G.UIStroke306 = Instance.new("UIStroke")
G.UIStroke306.Name = "UIStroke"
G.UIStroke306.Thickness = 2.79551
G.UIStroke306.Transparency = 1
G.UIStroke306.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke306.Parent = G.Dropshadow31

G.Frame32 = Instance.new("Frame")
G.Frame32.Name = "Frame"
G.Frame32.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame32.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame32.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame32.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame32.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame32.BorderSizePixel = 0
G.Frame32.ZIndex = -1
G.Frame32.Parent = G.BG32

G.Pattern28 = Instance.new("ImageLabel")
G.Pattern28.Name = "Pattern"
G.Pattern28.Size = UDim2.new(1,0,1,0)
G.Pattern28.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern28.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern28.BackgroundTransparency = 1
G.Pattern28.BorderSizePixel = 0
G.Pattern28.Image = "rbxassetid://92127895583355"
G.Pattern28.ScaleType = Enum.ScaleType.Crop
G.Pattern28.ZIndex = -1
G.Pattern28.Parent = G.Frame32

G.UIStroke307 = Instance.new("UIStroke")
G.UIStroke307.Name = "UIStroke"
G.UIStroke307.Thickness = 1.86368
G.UIStroke307.Parent = G.Pattern28

G.UIStroke308 = Instance.new("UIStroke")
G.UIStroke308.Name = "UIStroke"
G.UIStroke308.Thickness = 1.86368
G.UIStroke308.Parent = G.Frame32

G.Highlight28 = Instance.new("Frame")
G.Highlight28.Name = "Highlight"
G.Highlight28.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight28.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight28.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight28.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight28.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight28.BorderSizePixel = 0
G.Highlight28.Visible = false
G.Highlight28.ZIndex = -2
G.Highlight28.Parent = G.BG32

G.UIStroke309 = Instance.new("UIStroke")
G.UIStroke309.Name = "UIStroke"
G.UIStroke309.Color = Color3.fromRGB(255,242,0)
G.UIStroke309.Thickness = 2.79551
G.UIStroke309.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke309.Parent = G.Highlight28

G.DisplayTitle22 = Instance.new("TextLabel")
G.DisplayTitle22.Name = "DisplayTitle"
G.DisplayTitle22.Size = UDim2.new(0.566559,0,0.435422,0)
G.DisplayTitle22.Position = UDim2.new(0.709236,0,0.15042,0)
G.DisplayTitle22.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle22.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle22.BackgroundTransparency = 1
G.DisplayTitle22.BorderSizePixel = 0
G.DisplayTitle22.Text = "Vee Black Tee"
G.DisplayTitle22.TextColor3 = Color3.fromRGB(0,53,4)
G.DisplayTitle22.TextSize = 29
G.DisplayTitle22.Font = Enum.Font.Arcade
G.DisplayTitle22.TextWrapped = true
G.DisplayTitle22.TextScaled = true
G.DisplayTitle22.RichText = true
G.DisplayTitle22.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle22.Parent = G.COM_8822819512910251

G.UIGradient121 = Instance.new("UIGradient")
G.UIGradient121.Name = "UIGradient"
G.UIGradient121.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient121.Rotation = -90
G.UIGradient121.Offset = Vector2.new(0,0)
G.UIGradient121.Parent = G.DisplayTitle22

G.UIStroke310 = Instance.new("UIStroke")
G.UIStroke310.Name = "UIStroke"
G.UIStroke310.Color = Color3.fromRGB(255,255,255)
G.UIStroke310.Thickness = 0.931838
G.UIStroke310.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke310.Parent = G.DisplayTitle22

G.Item32 = Instance.new("ImageLabel")
G.Item32.Name = "Item"
G.Item32.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item32.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item32.AnchorPoint = Vector2.new(0.5,0.5)
G.Item32.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item32.BackgroundTransparency = 1
G.Item32.BorderSizePixel = 0
G.Item32.Image = "rbxassetid://94959635148921"
G.Item32.ImageRectOffset = Vector2.new(15,15)
G.Item32.ImageRectSize = Vector2.new(270,270)
G.Item32.ScaleType = Enum.ScaleType.Fit
G.Item32.Visible = false
G.Item32.ZIndex = -1
G.Item32.Parent = G.COM_8822819512910251

G.Unavailable97 = Instance.new("TextLabel")
G.Unavailable97.Name = "Unavailable"
G.Unavailable97.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable97.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable97.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable97.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable97.BackgroundTransparency = 1
G.Unavailable97.BorderSizePixel = 0
G.Unavailable97.Text = "Unavailable"
G.Unavailable97.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable97.TextSize = 14
G.Unavailable97.Font = Enum.Font.FredokaOne
G.Unavailable97.TextWrapped = true
G.Unavailable97.TextScaled = true
G.Unavailable97.Visible = false
G.Unavailable97.Parent = G.Item32

G.UIStroke311 = Instance.new("UIStroke")
G.UIStroke311.Name = "UIStroke"
G.UIStroke311.Thickness = 2
G.UIStroke311.Parent = G.Unavailable97

G.New16 = Instance.new("ImageLabel")
G.New16.Name = "New"
G.New16.Size = UDim2.new(0.322123,0,0.355513,0)
G.New16.Position = UDim2.new(0.924293,0,0.0284983,0)
G.New16.AnchorPoint = Vector2.new(0.5,0.5)
G.New16.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New16.BackgroundTransparency = 1
G.New16.BorderSizePixel = 0
G.New16.Image = "rbxassetid://96728750855907"
G.New16.ScaleType = Enum.ScaleType.Fit
G.New16.Visible = false
G.New16.ZIndex = -1
G.New16.Parent = G.COM_8822819512910251

G.UIScale46 = Instance.new("UIScale")
G.UIScale46.Name = "UIScale"
G.UIScale46.Parent = G.New16

G.Purchase32 = Instance.new("ImageButton")
G.Purchase32.Name = "Purchase"
G.Purchase32.Size = UDim2.new(0.551281,0,0.201102,0)
G.Purchase32.Position = UDim2.new(0.681037,0,0.790057,0)
G.Purchase32.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase32.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase32.BorderSizePixel = 0
G.Purchase32.ScaleType = Enum.ScaleType.Fit
G.Purchase32.AutoButtonColor = false
G.Purchase32.Parent = G.COM_8822819512910251

G.Price32 = Instance.new("TextLabel")
G.Price32.Name = "Price"
G.Price32.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price32.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price32.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price32.BackgroundTransparency = 1
G.Price32.BorderSizePixel = 0
G.Price32.Text = "$19.99"
G.Price32.TextColor3 = Color3.fromRGB(255,255,255)
G.Price32.TextSize = 14
G.Price32.Font = Enum.Font.Arcade
G.Price32.TextWrapped = true
G.Price32.TextScaled = true
G.Price32.RichText = true
G.Price32.AutomaticSize = Enum.AutomaticSize.X
G.Price32.Parent = G.Purchase32

G.UIGradient122 = Instance.new("UIGradient")
G.UIGradient122.Name = "UIGradient"
G.UIGradient122.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient122.Rotation = -90
G.UIGradient122.Offset = Vector2.new(0,0)
G.UIGradient122.Parent = G.Price32

G.UIStroke312 = Instance.new("UIStroke")
G.UIStroke312.Name = "UIStroke"
G.UIStroke312.Thickness = 0.931838
G.UIStroke312.Parent = G.Price32

G.UICorner33 = Instance.new("UICorner")
G.UICorner33.Name = "UICorner"
G.UICorner33.CornerRadius = UDim.new(1,0)
G.UICorner33.Parent = G.Purchase32

G.UIGradient123 = Instance.new("UIGradient")
G.UIGradient123.Name = "UIGradient"
G.UIGradient123.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient123.Rotation = -90
G.UIGradient123.Offset = Vector2.new(0,0)
G.UIGradient123.Parent = G.Purchase32

G.UIScale47 = Instance.new("UIScale")
G.UIScale47.Name = "UIScale"
G.UIScale47.Parent = G.Purchase32

G.UIStroke313 = Instance.new("UIStroke")
G.UIStroke313.Name = "UIStroke"
G.UIStroke313.Thickness = 1.1648
G.UIStroke313.Parent = G.Purchase32

G.Thumbnail54 = Instance.new("ImageLabel")
G.Thumbnail54.Name = "Thumbnail"
G.Thumbnail54.Size = UDim2.new(0.477726,0,1.43936,0)
G.Thumbnail54.Position = UDim2.new(0.268118,0,0.486483,0)
G.Thumbnail54.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail54.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail54.BackgroundTransparency = 1
G.Thumbnail54.BorderSizePixel = 0
G.Thumbnail54.Image = "rbxassetid://72072003278813"
G.Thumbnail54.ScaleType = Enum.ScaleType.Fit
G.Thumbnail54.ZIndex = -1
G.Thumbnail54.Parent = G.COM_8822819512910251

G.Unavailable98 = Instance.new("TextLabel")
G.Unavailable98.Name = "Unavailable"
G.Unavailable98.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable98.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable98.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable98.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable98.BackgroundTransparency = 1
G.Unavailable98.BorderSizePixel = 0
G.Unavailable98.Text = "Unavailable"
G.Unavailable98.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable98.TextSize = 14
G.Unavailable98.Font = Enum.Font.FredokaOne
G.Unavailable98.TextWrapped = true
G.Unavailable98.TextScaled = true
G.Unavailable98.Visible = false
G.Unavailable98.Parent = G.Thumbnail54

G.UIStroke314 = Instance.new("UIStroke")
G.UIStroke314.Name = "UIStroke"
G.UIStroke314.Thickness = 2
G.UIStroke314.Parent = G.Unavailable98

G.Title32 = Instance.new("TextLabel")
G.Title32.Name = "Title"
G.Title32.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title32.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title32.AnchorPoint = Vector2.new(0.5,0)
G.Title32.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title32.BackgroundTransparency = 1
G.Title32.BorderSizePixel = 0
G.Title32.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title32.TextColor3 = Color3.fromRGB(0,13,76)
G.Title32.TextSize = 29
G.Title32.Font = Enum.Font.Arcade
G.Title32.TextWrapped = true
G.Title32.TextScaled = true
G.Title32.RichText = true
G.Title32.Visible = false
G.Title32.AutomaticSize = Enum.AutomaticSize.X
G.Title32.Parent = G.COM_8822819512910251

G.UIGradient124 = Instance.new("UIGradient")
G.UIGradient124.Name = "UIGradient"
G.UIGradient124.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient124.Rotation = -90
G.UIGradient124.Offset = Vector2.new(0,0)
G.UIGradient124.Parent = G.Title32

G.UIStroke315 = Instance.new("UIStroke")
G.UIStroke315.Name = "UIStroke"
G.UIStroke315.Color = Color3.fromRGB(255,255,255)
G.UIStroke315.Thickness = 2
G.UIStroke315.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke315.Parent = G.Title32

G.COM_7599763136748192250 = Instance.new("Frame")
G.COM_7599763136748192250.Name = "COM-7599763136748192250"
G.COM_7599763136748192250.Size = UDim2.new(0.669469,0,0.931111,0)
G.COM_7599763136748192250.Position = UDim2.new(0.698518,0,0,0)
G.COM_7599763136748192250.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_7599763136748192250.BackgroundTransparency = 1
G.COM_7599763136748192250.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_7599763136748192250.BorderSizePixel = 0
G.COM_7599763136748192250.Parent = G.Special17

G.BG33 = Instance.new("Frame")
G.BG33.Name = "BG"
G.BG33.Size = UDim2.new(1,0,1,0)
G.BG33.Position = UDim2.new(0.5,0,0.5,0)
G.BG33.AnchorPoint = Vector2.new(0.5,0.5)
G.BG33.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG33.BackgroundTransparency = 1
G.BG33.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG33.BorderSizePixel = 0
G.BG33.ZIndex = -1
G.BG33.Parent = G.COM_7599763136748192250

G.Dropshadow32 = Instance.new("Frame")
G.Dropshadow32.Name = "Dropshadow"
G.Dropshadow32.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow32.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow32.AnchorPoint = Vector2.new(0,1)
G.Dropshadow32.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow32.BackgroundTransparency = 0.5
G.Dropshadow32.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow32.BorderSizePixel = 0
G.Dropshadow32.ZIndex = -2
G.Dropshadow32.Parent = G.BG33

G.UIStroke316 = Instance.new("UIStroke")
G.UIStroke316.Name = "UIStroke"
G.UIStroke316.Thickness = 2.79551
G.UIStroke316.Transparency = 1
G.UIStroke316.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke316.Parent = G.Dropshadow32

G.Frame33 = Instance.new("Frame")
G.Frame33.Name = "Frame"
G.Frame33.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame33.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame33.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame33.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame33.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame33.BorderSizePixel = 0
G.Frame33.ZIndex = -1
G.Frame33.Parent = G.BG33

G.Pattern29 = Instance.new("ImageLabel")
G.Pattern29.Name = "Pattern"
G.Pattern29.Size = UDim2.new(1,0,1,0)
G.Pattern29.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern29.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern29.BackgroundTransparency = 1
G.Pattern29.BorderSizePixel = 0
G.Pattern29.Image = "rbxassetid://92127895583355"
G.Pattern29.ScaleType = Enum.ScaleType.Crop
G.Pattern29.ZIndex = -1
G.Pattern29.Parent = G.Frame33

G.UIStroke317 = Instance.new("UIStroke")
G.UIStroke317.Name = "UIStroke"
G.UIStroke317.Thickness = 1.86368
G.UIStroke317.Parent = G.Pattern29

G.UIStroke318 = Instance.new("UIStroke")
G.UIStroke318.Name = "UIStroke"
G.UIStroke318.Thickness = 1.86368
G.UIStroke318.Parent = G.Frame33

G.Highlight29 = Instance.new("Frame")
G.Highlight29.Name = "Highlight"
G.Highlight29.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight29.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight29.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight29.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight29.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight29.BorderSizePixel = 0
G.Highlight29.Visible = false
G.Highlight29.ZIndex = -2
G.Highlight29.Parent = G.BG33

G.UIStroke319 = Instance.new("UIStroke")
G.UIStroke319.Name = "UIStroke"
G.UIStroke319.Color = Color3.fromRGB(255,242,0)
G.UIStroke319.Thickness = 2.79551
G.UIStroke319.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke319.Parent = G.Highlight29

G.DisplayTitle23 = Instance.new("TextLabel")
G.DisplayTitle23.Name = "DisplayTitle"
G.DisplayTitle23.Size = UDim2.new(0.566559,0,0.435422,0)
G.DisplayTitle23.Position = UDim2.new(0.709236,0,0.15042,0)
G.DisplayTitle23.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle23.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle23.BackgroundTransparency = 1
G.DisplayTitle23.BorderSizePixel = 0
G.DisplayTitle23.Text = "Vee Enamel Pin"
G.DisplayTitle23.TextColor3 = Color3.fromRGB(0,53,4)
G.DisplayTitle23.TextSize = 29
G.DisplayTitle23.Font = Enum.Font.Arcade
G.DisplayTitle23.TextWrapped = true
G.DisplayTitle23.TextScaled = true
G.DisplayTitle23.RichText = true
G.DisplayTitle23.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle23.Parent = G.COM_7599763136748192250

G.UIGradient125 = Instance.new("UIGradient")
G.UIGradient125.Name = "UIGradient"
G.UIGradient125.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient125.Rotation = -90
G.UIGradient125.Offset = Vector2.new(0,0)
G.UIGradient125.Parent = G.DisplayTitle23

G.UIStroke320 = Instance.new("UIStroke")
G.UIStroke320.Name = "UIStroke"
G.UIStroke320.Color = Color3.fromRGB(255,255,255)
G.UIStroke320.Thickness = 0.931838
G.UIStroke320.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke320.Parent = G.DisplayTitle23

G.Item33 = Instance.new("ImageLabel")
G.Item33.Name = "Item"
G.Item33.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item33.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item33.AnchorPoint = Vector2.new(0.5,0.5)
G.Item33.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item33.BackgroundTransparency = 1
G.Item33.BorderSizePixel = 0
G.Item33.Image = "rbxassetid://94959635148921"
G.Item33.ImageRectOffset = Vector2.new(15,15)
G.Item33.ImageRectSize = Vector2.new(270,270)
G.Item33.ScaleType = Enum.ScaleType.Fit
G.Item33.Visible = false
G.Item33.ZIndex = -1
G.Item33.Parent = G.COM_7599763136748192250

G.Unavailable99 = Instance.new("TextLabel")
G.Unavailable99.Name = "Unavailable"
G.Unavailable99.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable99.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable99.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable99.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable99.BackgroundTransparency = 1
G.Unavailable99.BorderSizePixel = 0
G.Unavailable99.Text = "Unavailable"
G.Unavailable99.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable99.TextSize = 14
G.Unavailable99.Font = Enum.Font.FredokaOne
G.Unavailable99.TextWrapped = true
G.Unavailable99.TextScaled = true
G.Unavailable99.Visible = false
G.Unavailable99.Parent = G.Item33

G.UIStroke321 = Instance.new("UIStroke")
G.UIStroke321.Name = "UIStroke"
G.UIStroke321.Thickness = 2
G.UIStroke321.Parent = G.Unavailable99

G.Purchase33 = Instance.new("ImageButton")
G.Purchase33.Name = "Purchase"
G.Purchase33.Size = UDim2.new(0.551281,0,0.201102,0)
G.Purchase33.Position = UDim2.new(0.681037,0,0.790057,0)
G.Purchase33.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase33.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase33.BorderSizePixel = 0
G.Purchase33.ScaleType = Enum.ScaleType.Fit
G.Purchase33.AutoButtonColor = false
G.Purchase33.Parent = G.COM_7599763136748192250

G.Price33 = Instance.new("TextLabel")
G.Price33.Name = "Price"
G.Price33.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price33.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price33.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price33.BackgroundTransparency = 1
G.Price33.BorderSizePixel = 0
G.Price33.Text = "$19.99"
G.Price33.TextColor3 = Color3.fromRGB(255,255,255)
G.Price33.TextSize = 14
G.Price33.Font = Enum.Font.Arcade
G.Price33.TextWrapped = true
G.Price33.TextScaled = true
G.Price33.RichText = true
G.Price33.AutomaticSize = Enum.AutomaticSize.X
G.Price33.Parent = G.Purchase33

G.UIGradient126 = Instance.new("UIGradient")
G.UIGradient126.Name = "UIGradient"
G.UIGradient126.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient126.Rotation = -90
G.UIGradient126.Offset = Vector2.new(0,0)
G.UIGradient126.Parent = G.Price33

G.UIStroke322 = Instance.new("UIStroke")
G.UIStroke322.Name = "UIStroke"
G.UIStroke322.Thickness = 0.931838
G.UIStroke322.Parent = G.Price33

G.UICorner34 = Instance.new("UICorner")
G.UICorner34.Name = "UICorner"
G.UICorner34.CornerRadius = UDim.new(1,0)
G.UICorner34.Parent = G.Purchase33

G.UIGradient127 = Instance.new("UIGradient")
G.UIGradient127.Name = "UIGradient"
G.UIGradient127.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient127.Rotation = -90
G.UIGradient127.Offset = Vector2.new(0,0)
G.UIGradient127.Parent = G.Purchase33

G.UIScale48 = Instance.new("UIScale")
G.UIScale48.Name = "UIScale"
G.UIScale48.Parent = G.Purchase33

G.UIStroke323 = Instance.new("UIStroke")
G.UIStroke323.Name = "UIStroke"
G.UIStroke323.Thickness = 1.1648
G.UIStroke323.Parent = G.Purchase33

G.Thumbnail55 = Instance.new("ImageLabel")
G.Thumbnail55.Name = "Thumbnail"
G.Thumbnail55.Size = UDim2.new(0.477726,0,1.44542,0)
G.Thumbnail55.Position = UDim2.new(0.265967,0,0.48666,0)
G.Thumbnail55.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail55.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail55.BackgroundTransparency = 1
G.Thumbnail55.BorderSizePixel = 0
G.Thumbnail55.Image = "rbxassetid://101802931116457"
G.Thumbnail55.ScaleType = Enum.ScaleType.Fit
G.Thumbnail55.ZIndex = -1
G.Thumbnail55.Parent = G.COM_7599763136748192250

G.Unavailable100 = Instance.new("TextLabel")
G.Unavailable100.Name = "Unavailable"
G.Unavailable100.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable100.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable100.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable100.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable100.BackgroundTransparency = 1
G.Unavailable100.BorderSizePixel = 0
G.Unavailable100.Text = "Unavailable"
G.Unavailable100.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable100.TextSize = 14
G.Unavailable100.Font = Enum.Font.FredokaOne
G.Unavailable100.TextWrapped = true
G.Unavailable100.TextScaled = true
G.Unavailable100.Visible = false
G.Unavailable100.Parent = G.Thumbnail55

G.UIStroke324 = Instance.new("UIStroke")
G.UIStroke324.Name = "UIStroke"
G.UIStroke324.Thickness = 2
G.UIStroke324.Parent = G.Unavailable100

G.Title33 = Instance.new("TextLabel")
G.Title33.Name = "Title"
G.Title33.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title33.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title33.AnchorPoint = Vector2.new(0.5,0)
G.Title33.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title33.BackgroundTransparency = 1
G.Title33.BorderSizePixel = 0
G.Title33.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title33.TextColor3 = Color3.fromRGB(0,13,76)
G.Title33.TextSize = 29
G.Title33.Font = Enum.Font.Arcade
G.Title33.TextWrapped = true
G.Title33.TextScaled = true
G.Title33.RichText = true
G.Title33.Visible = false
G.Title33.AutomaticSize = Enum.AutomaticSize.X
G.Title33.Parent = G.COM_7599763136748192250

G.UIGradient128 = Instance.new("UIGradient")
G.UIGradient128.Name = "UIGradient"
G.UIGradient128.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient128.Rotation = -90
G.UIGradient128.Offset = Vector2.new(0,0)
G.UIGradient128.Parent = G.Title33

G.UIStroke325 = Instance.new("UIStroke")
G.UIStroke325.Name = "UIStroke"
G.UIStroke325.Color = Color3.fromRGB(255,255,255)
G.UIStroke325.Thickness = 2
G.UIStroke325.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke325.Parent = G.Title33

G.UIListLayout19 = Instance.new("UIListLayout")
G.UIListLayout19.Name = "UIListLayout"
G.UIListLayout19.Padding = UDim.new(0.019,0)
G.UIListLayout19.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout19.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout19.Wraps = false
G.UIListLayout19.Parent = G.Special17

G.Special18 = Instance.new("Frame")
G.Special18.Name = "Special"
G.Special18.Size = UDim2.new(0.728177,0,0.493216,0)
G.Special18.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
G.Special18.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special18.BackgroundTransparency = 1
G.Special18.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special18.BorderSizePixel = 0
G.Special18.Visible = false
G.Special18.LayoutOrder = -3
G.Special18.Parent = G.ScrollingFrame

G.COM_25298985882597462752 = Instance.new("Frame")
G.COM_25298985882597462752.Name = "COM-2529898588259746275"
G.COM_25298985882597462752.Size = UDim2.new(0.894198,0,0.931112,0)
G.COM_25298985882597462752.Position = UDim2.new(5.4771e-08,0,0,0)
G.COM_25298985882597462752.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_25298985882597462752.BackgroundTransparency = 1
G.COM_25298985882597462752.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_25298985882597462752.BorderSizePixel = 0
G.COM_25298985882597462752.ZIndex = 2
G.COM_25298985882597462752.Parent = G.Special18

G.BG34 = Instance.new("Frame")
G.BG34.Name = "BG"
G.BG34.Size = UDim2.new(1,0,1,0)
G.BG34.Position = UDim2.new(0.5,0,0.5,0)
G.BG34.AnchorPoint = Vector2.new(0.5,0.5)
G.BG34.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG34.BackgroundTransparency = 1
G.BG34.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG34.BorderSizePixel = 0
G.BG34.ZIndex = -1
G.BG34.Parent = G.COM_25298985882597462752

G.Dropshadow33 = Instance.new("Frame")
G.Dropshadow33.Name = "Dropshadow"
G.Dropshadow33.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow33.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow33.AnchorPoint = Vector2.new(0,1)
G.Dropshadow33.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow33.BackgroundTransparency = 0.5
G.Dropshadow33.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow33.BorderSizePixel = 0
G.Dropshadow33.ZIndex = -2
G.Dropshadow33.Parent = G.BG34

G.UIStroke326 = Instance.new("UIStroke")
G.UIStroke326.Name = "UIStroke"
G.UIStroke326.Thickness = 2.79551
G.UIStroke326.Transparency = 1
G.UIStroke326.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke326.Parent = G.Dropshadow33

G.Frame34 = Instance.new("Frame")
G.Frame34.Name = "Frame"
G.Frame34.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame34.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame34.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame34.BackgroundColor3 = Color3.fromRGB(3,148,13)
G.Frame34.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame34.BorderSizePixel = 0
G.Frame34.ZIndex = -1
G.Frame34.Parent = G.BG34

G.Pattern30 = Instance.new("ImageLabel")
G.Pattern30.Name = "Pattern"
G.Pattern30.Size = UDim2.new(1,0,1,0)
G.Pattern30.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern30.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern30.BackgroundTransparency = 1
G.Pattern30.BorderSizePixel = 0
G.Pattern30.Image = "rbxassetid://92127895583355"
G.Pattern30.ImageColor3 = Color3.fromRGB(100,255,17)
G.Pattern30.ZIndex = -1
G.Pattern30.Parent = G.Frame34

G.UIStroke327 = Instance.new("UIStroke")
G.UIStroke327.Name = "UIStroke"
G.UIStroke327.Thickness = 1.86368
G.UIStroke327.Parent = G.Pattern30

G.UIGradient129 = Instance.new("UIGradient")
G.UIGradient129.Name = "UIGradient"
G.UIGradient129.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient129.Rotation = 90
G.UIGradient129.Offset = Vector2.new(0,0)
G.UIGradient129.Parent = G.Frame34

G.UIStroke328 = Instance.new("UIStroke")
G.UIStroke328.Name = "UIStroke"
G.UIStroke328.Thickness = 1.86368
G.UIStroke328.Parent = G.Frame34

G.Highlight30 = Instance.new("Frame")
G.Highlight30.Name = "Highlight"
G.Highlight30.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight30.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight30.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight30.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight30.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight30.BorderSizePixel = 0
G.Highlight30.Visible = false
G.Highlight30.ZIndex = -2
G.Highlight30.Parent = G.BG34

G.UIStroke329 = Instance.new("UIStroke")
G.UIStroke329.Name = "UIStroke"
G.UIStroke329.Color = Color3.fromRGB(255,242,0)
G.UIStroke329.Thickness = 2.79551
G.UIStroke329.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke329.Parent = G.Highlight30

G.CanvasGroup12 = Instance.new("CanvasGroup")
G.CanvasGroup12.Name = "CanvasGroup"
G.CanvasGroup12.Size = UDim2.new(1,0,1,0)
G.CanvasGroup12.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup12.BackgroundTransparency = 1
G.CanvasGroup12.Parent = G.COM_25298985882597462752

G.Thumbnail56 = Instance.new("ImageLabel")
G.Thumbnail56.Name = "Thumbnail"
G.Thumbnail56.Size = UDim2.new(0.293901,0,0.766222,0)
G.Thumbnail56.Position = UDim2.new(0.104398,0,0.514738,0)
G.Thumbnail56.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail56.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail56.BackgroundTransparency = 1
G.Thumbnail56.BorderSizePixel = 0
G.Thumbnail56.Image = "rbxassetid://114298785049809"
G.Thumbnail56.ScaleType = Enum.ScaleType.Fit
G.Thumbnail56.ZIndex = 0
G.Thumbnail56.Rotation = -11
G.Thumbnail56.Parent = G.CanvasGroup12

G.Unavailable101 = Instance.new("TextLabel")
G.Unavailable101.Name = "Unavailable"
G.Unavailable101.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable101.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable101.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable101.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable101.BackgroundTransparency = 1
G.Unavailable101.BorderSizePixel = 0
G.Unavailable101.Text = "Unavailable"
G.Unavailable101.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable101.TextSize = 14
G.Unavailable101.Font = Enum.Font.FredokaOne
G.Unavailable101.TextWrapped = true
G.Unavailable101.TextScaled = true
G.Unavailable101.Visible = false
G.Unavailable101.Parent = G.Thumbnail56

G.UIStroke330 = Instance.new("UIStroke")
G.UIStroke330.Name = "UIStroke"
G.UIStroke330.Thickness = 2
G.UIStroke330.Parent = G.Unavailable101

G.Thumbnail57 = Instance.new("ImageLabel")
G.Thumbnail57.Name = "Thumbnail"
G.Thumbnail57.Size = UDim2.new(0.293901,0,0.766222,0)
G.Thumbnail57.Position = UDim2.new(0.176374,0,0.449167,0)
G.Thumbnail57.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail57.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail57.BackgroundTransparency = 1
G.Thumbnail57.BorderSizePixel = 0
G.Thumbnail57.Image = "rbxassetid://88590750012874"
G.Thumbnail57.ScaleType = Enum.ScaleType.Fit
G.Thumbnail57.ZIndex = -1
G.Thumbnail57.Rotation = 5
G.Thumbnail57.Parent = G.CanvasGroup12

G.Unavailable102 = Instance.new("TextLabel")
G.Unavailable102.Name = "Unavailable"
G.Unavailable102.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable102.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable102.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable102.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable102.BackgroundTransparency = 1
G.Unavailable102.BorderSizePixel = 0
G.Unavailable102.Text = "Unavailable"
G.Unavailable102.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable102.TextSize = 14
G.Unavailable102.Font = Enum.Font.FredokaOne
G.Unavailable102.TextWrapped = true
G.Unavailable102.TextScaled = true
G.Unavailable102.Visible = false
G.Unavailable102.Parent = G.Thumbnail57

G.UIStroke331 = Instance.new("UIStroke")
G.UIStroke331.Name = "UIStroke"
G.UIStroke331.Thickness = 2
G.UIStroke331.Parent = G.Unavailable102

G.DisplayTitle24 = Instance.new("TextLabel")
G.DisplayTitle24.Name = "DisplayTitle"
G.DisplayTitle24.Size = UDim2.new(0.453471,0,0.351663,0)
G.DisplayTitle24.Position = UDim2.new(0.74378,0,0.235969,0)
G.DisplayTitle24.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle24.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle24.BackgroundTransparency = 1
G.DisplayTitle24.BorderSizePixel = 0
G.DisplayTitle24.Text = "Vee 14\" Deluxe Plush (Pre-Order)"
G.DisplayTitle24.TextColor3 = Color3.fromRGB(2,40,0)
G.DisplayTitle24.TextSize = 29
G.DisplayTitle24.Font = Enum.Font.Arcade
G.DisplayTitle24.TextWrapped = true
G.DisplayTitle24.TextScaled = true
G.DisplayTitle24.RichText = true
G.DisplayTitle24.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle24.Parent = G.COM_25298985882597462752

G.UIAspectRatioConstraint17 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint17.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint17.AspectRatio = 2.66
G.UIAspectRatioConstraint17.Parent = G.DisplayTitle24

G.UIGradient130 = Instance.new("UIGradient")
G.UIGradient130.Name = "UIGradient"
G.UIGradient130.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient130.Rotation = -90
G.UIGradient130.Offset = Vector2.new(0,0)
G.UIGradient130.Parent = G.DisplayTitle24

G.UIStroke332 = Instance.new("UIStroke")
G.UIStroke332.Name = "UIStroke"
G.UIStroke332.Color = Color3.fromRGB(255,255,255)
G.UIStroke332.Thickness = 0.931838
G.UIStroke332.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke332.Parent = G.DisplayTitle24

G.Item34 = Instance.new("ImageLabel")
G.Item34.Name = "Item"
G.Item34.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item34.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item34.AnchorPoint = Vector2.new(0.5,0.5)
G.Item34.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item34.BackgroundTransparency = 1
G.Item34.BorderSizePixel = 0
G.Item34.Image = "rbxassetid://94959635148921"
G.Item34.ImageRectOffset = Vector2.new(15,15)
G.Item34.ImageRectSize = Vector2.new(270,270)
G.Item34.ScaleType = Enum.ScaleType.Fit
G.Item34.Visible = false
G.Item34.ZIndex = -1
G.Item34.Parent = G.COM_25298985882597462752

G.Unavailable103 = Instance.new("TextLabel")
G.Unavailable103.Name = "Unavailable"
G.Unavailable103.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable103.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable103.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable103.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable103.BackgroundTransparency = 1
G.Unavailable103.BorderSizePixel = 0
G.Unavailable103.Text = "Unavailable"
G.Unavailable103.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable103.TextSize = 14
G.Unavailable103.Font = Enum.Font.FredokaOne
G.Unavailable103.TextWrapped = true
G.Unavailable103.TextScaled = true
G.Unavailable103.Visible = false
G.Unavailable103.Parent = G.Item34

G.UIStroke333 = Instance.new("UIStroke")
G.UIStroke333.Name = "UIStroke"
G.UIStroke333.Thickness = 2
G.UIStroke333.Parent = G.Unavailable103

G.New17 = Instance.new("ImageLabel")
G.New17.Name = "New"
G.New17.Size = UDim2.new(0.322123,0,0.355513,0)
G.New17.Position = UDim2.new(0.94212,0,0.0839209,0)
G.New17.AnchorPoint = Vector2.new(0.5,0.5)
G.New17.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New17.BackgroundTransparency = 1
G.New17.BorderSizePixel = 0
G.New17.Image = "rbxassetid://96728750855907"
G.New17.ScaleType = Enum.ScaleType.Fit
G.New17.ZIndex = -1
G.New17.Parent = G.COM_25298985882597462752

G.UIScale49 = Instance.new("UIScale")
G.UIScale49.Name = "UIScale"
G.UIScale49.Parent = G.New17

G.Purchase34 = Instance.new("ImageButton")
G.Purchase34.Name = "Purchase"
G.Purchase34.Size = UDim2.new(0.436835,0,0.172928,0)
G.Purchase34.Position = UDim2.new(0.752098,0,0.833662,0)
G.Purchase34.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase34.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase34.BorderSizePixel = 0
G.Purchase34.ScaleType = Enum.ScaleType.Fit
G.Purchase34.AutoButtonColor = false
G.Purchase34.Parent = G.COM_25298985882597462752

G.Price34 = Instance.new("TextLabel")
G.Price34.Name = "Price"
G.Price34.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price34.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price34.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price34.BackgroundTransparency = 1
G.Price34.BorderSizePixel = 0
G.Price34.Text = "$19.99"
G.Price34.TextColor3 = Color3.fromRGB(255,255,255)
G.Price34.TextSize = 14
G.Price34.Font = Enum.Font.Arcade
G.Price34.TextWrapped = true
G.Price34.TextScaled = true
G.Price34.RichText = true
G.Price34.AutomaticSize = Enum.AutomaticSize.X
G.Price34.Parent = G.Purchase34

G.UIGradient131 = Instance.new("UIGradient")
G.UIGradient131.Name = "UIGradient"
G.UIGradient131.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient131.Rotation = -90
G.UIGradient131.Offset = Vector2.new(0,0)
G.UIGradient131.Parent = G.Price34

G.UIStroke334 = Instance.new("UIStroke")
G.UIStroke334.Name = "UIStroke"
G.UIStroke334.Thickness = 0.931838
G.UIStroke334.Parent = G.Price34

G.UICorner35 = Instance.new("UICorner")
G.UICorner35.Name = "UICorner"
G.UICorner35.CornerRadius = UDim.new(1,0)
G.UICorner35.Parent = G.Purchase34

G.UIGradient132 = Instance.new("UIGradient")
G.UIGradient132.Name = "UIGradient"
G.UIGradient132.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient132.Rotation = -90
G.UIGradient132.Offset = Vector2.new(0,0)
G.UIGradient132.Parent = G.Purchase34

G.UIScale50 = Instance.new("UIScale")
G.UIScale50.Name = "UIScale"
G.UIScale50.Parent = G.Purchase34

G.UIStroke335 = Instance.new("UIStroke")
G.UIStroke335.Name = "UIStroke"
G.UIStroke335.Thickness = 1.1648
G.UIStroke335.Parent = G.Purchase34

G.Thumbnail58 = Instance.new("ImageLabel")
G.Thumbnail58.Name = "Thumbnail"
G.Thumbnail58.Size = UDim2.new(0.48234,0,1.1696,0)
G.Thumbnail58.Position = UDim2.new(0.365108,0,0.490964,0)
G.Thumbnail58.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail58.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail58.BackgroundTransparency = 1
G.Thumbnail58.BorderSizePixel = 0
G.Thumbnail58.Image = "rbxassetid://113698030534354"
G.Thumbnail58.ScaleType = Enum.ScaleType.Fit
G.Thumbnail58.ZIndex = 2
G.Thumbnail58.Parent = G.COM_25298985882597462752

G.Unavailable104 = Instance.new("TextLabel")
G.Unavailable104.Name = "Unavailable"
G.Unavailable104.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable104.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable104.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable104.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable104.BackgroundTransparency = 1
G.Unavailable104.BorderSizePixel = 0
G.Unavailable104.Text = "Unavailable"
G.Unavailable104.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable104.TextSize = 14
G.Unavailable104.Font = Enum.Font.FredokaOne
G.Unavailable104.TextWrapped = true
G.Unavailable104.TextScaled = true
G.Unavailable104.Visible = false
G.Unavailable104.Parent = G.Thumbnail58

G.UIStroke336 = Instance.new("UIStroke")
G.UIStroke336.Name = "UIStroke"
G.UIStroke336.Thickness = 2
G.UIStroke336.Parent = G.Unavailable104

G.Title34 = Instance.new("TextLabel")
G.Title34.Name = "Title"
G.Title34.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title34.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title34.AnchorPoint = Vector2.new(0.5,0)
G.Title34.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title34.BackgroundTransparency = 1
G.Title34.BorderSizePixel = 0
G.Title34.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title34.TextColor3 = Color3.fromRGB(0,13,76)
G.Title34.TextSize = 29
G.Title34.Font = Enum.Font.Arcade
G.Title34.TextWrapped = true
G.Title34.TextScaled = true
G.Title34.RichText = true
G.Title34.Visible = false
G.Title34.AutomaticSize = Enum.AutomaticSize.X
G.Title34.Parent = G.COM_25298985882597462752

G.UIGradient133 = Instance.new("UIGradient")
G.UIGradient133.Name = "UIGradient"
G.UIGradient133.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient133.Rotation = -90
G.UIGradient133.Offset = Vector2.new(0,0)
G.UIGradient133.Parent = G.Title34

G.UIStroke337 = Instance.new("UIStroke")
G.UIStroke337.Name = "UIStroke"
G.UIStroke337.Color = Color3.fromRGB(255,255,255)
G.UIStroke337.Thickness = 2
G.UIStroke337.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke337.Parent = G.Title34

G.COM_75997631367481922502 = Instance.new("Frame")
G.COM_75997631367481922502.Name = "COM-7599763136748192250"
G.COM_75997631367481922502.Size = UDim2.new(0.442523,0,0.944677,0)
G.COM_75997631367481922502.Position = UDim2.new(0.913307,0,0,0)
G.COM_75997631367481922502.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_75997631367481922502.BackgroundTransparency = 1
G.COM_75997631367481922502.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_75997631367481922502.BorderSizePixel = 0
G.COM_75997631367481922502.Parent = G.Special18

G.BG35 = Instance.new("Frame")
G.BG35.Name = "BG"
G.BG35.Size = UDim2.new(1,0,1,0)
G.BG35.Position = UDim2.new(0.5,0,0.5,0)
G.BG35.AnchorPoint = Vector2.new(0.5,0.5)
G.BG35.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG35.BackgroundTransparency = 1
G.BG35.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG35.BorderSizePixel = 0
G.BG35.ZIndex = -1
G.BG35.Parent = G.COM_75997631367481922502

G.Dropshadow34 = Instance.new("Frame")
G.Dropshadow34.Name = "Dropshadow"
G.Dropshadow34.Size = UDim2.new(0.947997,0,0.95376,0)
G.Dropshadow34.Position = UDim2.new(-0.00747363,0,1.01324,0)
G.Dropshadow34.AnchorPoint = Vector2.new(0,1)
G.Dropshadow34.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow34.BackgroundTransparency = 0.5
G.Dropshadow34.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow34.BorderSizePixel = 0
G.Dropshadow34.ZIndex = -2
G.Dropshadow34.Parent = G.BG35

G.UIStroke338 = Instance.new("UIStroke")
G.UIStroke338.Name = "UIStroke"
G.UIStroke338.Thickness = 2.79551
G.UIStroke338.Transparency = 1
G.UIStroke338.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke338.Parent = G.Dropshadow34

G.Frame35 = Instance.new("Frame")
G.Frame35.Name = "Frame"
G.Frame35.Size = UDim2.new(0.95775,0,0.95775,0)
G.Frame35.Position = UDim2.new(0.521125,0,0.478875,0)
G.Frame35.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame35.BackgroundColor3 = Color3.fromRGB(3,148,13)
G.Frame35.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame35.BorderSizePixel = 0
G.Frame35.ZIndex = -1
G.Frame35.Parent = G.BG35

G.Pattern31 = Instance.new("ImageLabel")
G.Pattern31.Name = "Pattern"
G.Pattern31.Size = UDim2.new(1,0,1,0)
G.Pattern31.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern31.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern31.BackgroundTransparency = 1
G.Pattern31.BorderSizePixel = 0
G.Pattern31.Image = "rbxassetid://92127895583355"
G.Pattern31.ImageColor3 = Color3.fromRGB(100,255,17)
G.Pattern31.ScaleType = Enum.ScaleType.Crop
G.Pattern31.ZIndex = -1
G.Pattern31.Parent = G.Frame35

G.UIStroke339 = Instance.new("UIStroke")
G.UIStroke339.Name = "UIStroke"
G.UIStroke339.Thickness = 1.86368
G.UIStroke339.Parent = G.Pattern31

G.UIGradient134 = Instance.new("UIGradient")
G.UIGradient134.Name = "UIGradient"
G.UIGradient134.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient134.Rotation = 90
G.UIGradient134.Offset = Vector2.new(0,0)
G.UIGradient134.Parent = G.Frame35

G.UIStroke340 = Instance.new("UIStroke")
G.UIStroke340.Name = "UIStroke"
G.UIStroke340.Thickness = 4
G.UIStroke340.Parent = G.Frame35

G.Highlight31 = Instance.new("Frame")
G.Highlight31.Name = "Highlight"
G.Highlight31.Size = UDim2.new(0.954203,0,0.95775,0)
G.Highlight31.Position = UDim2.new(0.519351,0,0.478875,0)
G.Highlight31.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight31.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight31.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight31.BorderSizePixel = 0
G.Highlight31.Visible = false
G.Highlight31.ZIndex = -2
G.Highlight31.Parent = G.BG35

G.UIStroke341 = Instance.new("UIStroke")
G.UIStroke341.Name = "UIStroke"
G.UIStroke341.Color = Color3.fromRGB(255,242,0)
G.UIStroke341.Thickness = 2.79551
G.UIStroke341.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke341.Parent = G.Highlight31

G.Item35 = Instance.new("ImageLabel")
G.Item35.Name = "Item"
G.Item35.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item35.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item35.AnchorPoint = Vector2.new(0.5,0.5)
G.Item35.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item35.BackgroundTransparency = 1
G.Item35.BorderSizePixel = 0
G.Item35.Image = "rbxassetid://94959635148921"
G.Item35.ImageRectOffset = Vector2.new(25,25)
G.Item35.ImageRectSize = Vector2.new(250,250)
G.Item35.ScaleType = Enum.ScaleType.Crop
G.Item35.Visible = false
G.Item35.ZIndex = -1
G.Item35.Parent = G.COM_75997631367481922502

G.Unavailable105 = Instance.new("TextLabel")
G.Unavailable105.Name = "Unavailable"
G.Unavailable105.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable105.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable105.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable105.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable105.BackgroundTransparency = 1
G.Unavailable105.BorderSizePixel = 0
G.Unavailable105.Text = "Unavailable"
G.Unavailable105.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable105.TextSize = 14
G.Unavailable105.Font = Enum.Font.FredokaOne
G.Unavailable105.TextWrapped = true
G.Unavailable105.TextScaled = true
G.Unavailable105.Visible = false
G.Unavailable105.Parent = G.Item35

G.UIStroke342 = Instance.new("UIStroke")
G.UIStroke342.Name = "UIStroke"
G.UIStroke342.Thickness = 2
G.UIStroke342.Parent = G.Unavailable105

G.Pixel13 = Instance.new("ImageLabel")
G.Pixel13.Name = "Pixel"
G.Pixel13.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel13.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel13.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel13.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel13.BorderSizePixel = 0
G.Pixel13.Image = "rbxassetid://94959635148921"
G.Pixel13.ImageRectOffset = Vector2.new(55,100)
G.Pixel13.ImageRectSize = Vector2.new(30,30)
G.Pixel13.ScaleType = Enum.ScaleType.Crop
G.Pixel13.Visible = false
G.Pixel13.ZIndex = 5
G.Pixel13.Parent = G.COM_75997631367481922502

G.Unavailable106 = Instance.new("TextLabel")
G.Unavailable106.Name = "Unavailable"
G.Unavailable106.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable106.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable106.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable106.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable106.BackgroundTransparency = 1
G.Unavailable106.BorderSizePixel = 0
G.Unavailable106.Text = "Unavailable"
G.Unavailable106.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable106.TextSize = 14
G.Unavailable106.Font = Enum.Font.FredokaOne
G.Unavailable106.TextWrapped = true
G.Unavailable106.TextScaled = true
G.Unavailable106.Visible = false
G.Unavailable106.Parent = G.Pixel13

G.UIStroke343 = Instance.new("UIStroke")
G.UIStroke343.Name = "UIStroke"
G.UIStroke343.Thickness = 2
G.UIStroke343.Parent = G.Unavailable106

G.Purchase35 = Instance.new("ImageButton")
G.Purchase35.Name = "Purchase"
G.Purchase35.Size = UDim2.new(0.863319,0,0.170445,0)
G.Purchase35.Position = UDim2.new(0.514166,0,0.821691,0)
G.Purchase35.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase35.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase35.BorderSizePixel = 0
G.Purchase35.ScaleType = Enum.ScaleType.Fit
G.Purchase35.AutoButtonColor = false
G.Purchase35.ZIndex = 6
G.Purchase35.Parent = G.COM_75997631367481922502

G.Price35 = Instance.new("TextLabel")
G.Price35.Name = "Price"
G.Price35.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price35.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price35.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price35.BackgroundTransparency = 1
G.Price35.BorderSizePixel = 0
G.Price35.Text = "$19.99"
G.Price35.TextColor3 = Color3.fromRGB(255,255,255)
G.Price35.TextSize = 14
G.Price35.Font = Enum.Font.Arcade
G.Price35.TextWrapped = true
G.Price35.TextScaled = true
G.Price35.RichText = true
G.Price35.AutomaticSize = Enum.AutomaticSize.X
G.Price35.Parent = G.Purchase35

G.UIGradient135 = Instance.new("UIGradient")
G.UIGradient135.Name = "UIGradient"
G.UIGradient135.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient135.Rotation = -90
G.UIGradient135.Offset = Vector2.new(0,0)
G.UIGradient135.Parent = G.Price35

G.UIStroke344 = Instance.new("UIStroke")
G.UIStroke344.Name = "UIStroke"
G.UIStroke344.Thickness = 2
G.UIStroke344.Parent = G.Price35

G.UICorner36 = Instance.new("UICorner")
G.UICorner36.Name = "UICorner"
G.UICorner36.CornerRadius = UDim.new(1,0)
G.UICorner36.Parent = G.Purchase35

G.UIGradient136 = Instance.new("UIGradient")
G.UIGradient136.Name = "UIGradient"
G.UIGradient136.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient136.Rotation = -90
G.UIGradient136.Offset = Vector2.new(0,0)
G.UIGradient136.Parent = G.Purchase35

G.UIScale51 = Instance.new("UIScale")
G.UIScale51.Name = "UIScale"
G.UIScale51.Parent = G.Purchase35

G.UIStroke345 = Instance.new("UIStroke")
G.UIStroke345.Name = "UIStroke"
G.UIStroke345.Thickness = 2.5
G.UIStroke345.Parent = G.Purchase35

G.Thumbnail59 = Instance.new("ImageLabel")
G.Thumbnail59.Name = "Thumbnail"
G.Thumbnail59.Size = UDim2.new(1.03177,0,0.875373,0)
G.Thumbnail59.Position = UDim2.new(0.511832,0,0.372283,0)
G.Thumbnail59.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail59.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail59.BackgroundTransparency = 1
G.Thumbnail59.BorderSizePixel = 0
G.Thumbnail59.Image = "rbxassetid://101802931116457"
G.Thumbnail59.ScaleType = Enum.ScaleType.Fit
G.Thumbnail59.ZIndex = -1
G.Thumbnail59.Parent = G.COM_75997631367481922502

G.Unavailable107 = Instance.new("TextLabel")
G.Unavailable107.Name = "Unavailable"
G.Unavailable107.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable107.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable107.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable107.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable107.BackgroundTransparency = 1
G.Unavailable107.BorderSizePixel = 0
G.Unavailable107.Text = "Unavailable"
G.Unavailable107.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable107.TextSize = 14
G.Unavailable107.Font = Enum.Font.FredokaOne
G.Unavailable107.TextWrapped = true
G.Unavailable107.TextScaled = true
G.Unavailable107.Visible = false
G.Unavailable107.Parent = G.Thumbnail59

G.UIStroke346 = Instance.new("UIStroke")
G.UIStroke346.Name = "UIStroke"
G.UIStroke346.Thickness = 2
G.UIStroke346.Parent = G.Unavailable107

G.Title35 = Instance.new("TextLabel")
G.Title35.Name = "Title"
G.Title35.Size = UDim2.new(0.874784,0,0.149,0)
G.Title35.Position = UDim2.new(0.531264,0,0.0306123,0)
G.Title35.AnchorPoint = Vector2.new(0.5,0)
G.Title35.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title35.BackgroundTransparency = 1
G.Title35.BorderSizePixel = 0
G.Title35.Text = "Bobette 11" x 14" Poster"
G.Title35.TextColor3 = Color3.fromRGB(0,0,0)
G.Title35.TextSize = 29
G.Title35.Font = Enum.Font.Arcade
G.Title35.TextXAlignment = Enum.TextXAlignment.Left
G.Title35.TextYAlignment = Enum.TextYAlignment.Top
G.Title35.TextWrapped = true
G.Title35.TextScaled = true
G.Title35.RichText = true
G.Title35.Visible = false
G.Title35.AutomaticSize = Enum.AutomaticSize.X
G.Title35.Parent = G.COM_75997631367481922502

G.UITextSizeConstraint16 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint16.Name = "UITextSizeConstraint"
G.UITextSizeConstraint16.MaxTextSize = 29
G.UITextSizeConstraint16.Parent = G.Title35

G.UIListLayout20 = Instance.new("UIListLayout")
G.UIListLayout20.Name = "UIListLayout"
G.UIListLayout20.Padding = UDim.new(0.019,0)
G.UIListLayout20.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout20.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout20.Wraps = false
G.UIListLayout20.Parent = G.Special18

G.Row2 = Instance.new("Frame")
G.Row2.Name = "Row"
G.Row2.Size = UDim2.new(1,0,0.618953,0)
G.Row2.Position = UDim2.new(-5.82348e-08,0,-0.528551,0)
G.Row2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Row2.BackgroundTransparency = 1
G.Row2.BorderColor3 = Color3.fromRGB(0,0,0)
G.Row2.BorderSizePixel = 0
G.Row2.LayoutOrder = -2
G.Row2.Parent = G.ScrollingFrame

G.Template4 = Instance.new("Frame")
G.Template4.Name = "Template"
G.Template4.Size = UDim2.new(0.31602,0,0.944677,0)
G.Template4.Position = UDim2.new(6.27232e-08,0,-0.0531514,0)
G.Template4.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.Template4.BackgroundTransparency = 1
G.Template4.BorderColor3 = Color3.fromRGB(0,0,0)
G.Template4.BorderSizePixel = 0
G.Template4.Parent = G.Row2

G.BG36 = Instance.new("Frame")
G.BG36.Name = "BG"
G.BG36.Size = UDim2.new(1,0,1,0)
G.BG36.Position = UDim2.new(0.5,0,0.5,0)
G.BG36.AnchorPoint = Vector2.new(0.5,0.5)
G.BG36.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG36.BackgroundTransparency = 1
G.BG36.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG36.BorderSizePixel = 0
G.BG36.ZIndex = -1
G.BG36.Parent = G.Template4

G.Dropshadow35 = Instance.new("Frame")
G.Dropshadow35.Name = "Dropshadow"
G.Dropshadow35.Size = UDim2.new(0.940524,0,0.940524,0)
G.Dropshadow35.Position = UDim2.new(0,0,1,0)
G.Dropshadow35.AnchorPoint = Vector2.new(0,1)
G.Dropshadow35.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow35.BackgroundTransparency = 0.5
G.Dropshadow35.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow35.BorderSizePixel = 0
G.Dropshadow35.ZIndex = -2
G.Dropshadow35.Parent = G.BG36

G.Frame36 = Instance.new("Frame")
G.Frame36.Name = "Frame"
G.Frame36.Size = UDim2.new(0.95775,0,0.95775,0)
G.Frame36.Position = UDim2.new(0.521125,0,0.478875,0)
G.Frame36.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame36.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame36.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame36.BorderSizePixel = 0
G.Frame36.ZIndex = -1
G.Frame36.Parent = G.BG36

G.UIStroke347 = Instance.new("UIStroke")
G.UIStroke347.Name = "UIStroke"
G.UIStroke347.Thickness = 4
G.UIStroke347.Parent = G.Frame36

G.Item210 = Instance.new("ImageLabel")
G.Item210.Name = "Item2"
G.Item210.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item210.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item210.AnchorPoint = Vector2.new(0.5,0.5)
G.Item210.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item210.BackgroundTransparency = 1
G.Item210.BorderSizePixel = 0
G.Item210.Image = "rbxassetid://94959635148921"
G.Item210.ImageRectOffset = Vector2.new(25,25)
G.Item210.ImageRectSize = Vector2.new(250,250)
G.Item210.ScaleType = Enum.ScaleType.Crop
G.Item210.Visible = false
G.Item210.ZIndex = -1
G.Item210.Parent = G.Template4

G.Unavailable108 = Instance.new("TextLabel")
G.Unavailable108.Name = "Unavailable"
G.Unavailable108.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable108.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable108.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable108.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable108.BackgroundTransparency = 1
G.Unavailable108.BorderSizePixel = 0
G.Unavailable108.Text = "Unavailable"
G.Unavailable108.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable108.TextSize = 14
G.Unavailable108.Font = Enum.Font.FredokaOne
G.Unavailable108.TextWrapped = true
G.Unavailable108.TextScaled = true
G.Unavailable108.Visible = false
G.Unavailable108.Parent = G.Item210

G.UIStroke348 = Instance.new("UIStroke")
G.UIStroke348.Name = "UIStroke"
G.UIStroke348.Thickness = 2
G.UIStroke348.Parent = G.Unavailable108

G.Pixel14 = Instance.new("ImageLabel")
G.Pixel14.Name = "Pixel"
G.Pixel14.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel14.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel14.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel14.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel14.BorderSizePixel = 0
G.Pixel14.Image = "rbxassetid://94959635148921"
G.Pixel14.ImageRectOffset = Vector2.new(55,100)
G.Pixel14.ImageRectSize = Vector2.new(30,30)
G.Pixel14.ScaleType = Enum.ScaleType.Crop
G.Pixel14.Visible = false
G.Pixel14.ZIndex = 5
G.Pixel14.Parent = G.Template4

G.Unavailable109 = Instance.new("TextLabel")
G.Unavailable109.Name = "Unavailable"
G.Unavailable109.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable109.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable109.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable109.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable109.BackgroundTransparency = 1
G.Unavailable109.BorderSizePixel = 0
G.Unavailable109.Text = "Unavailable"
G.Unavailable109.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable109.TextSize = 14
G.Unavailable109.Font = Enum.Font.FredokaOne
G.Unavailable109.TextWrapped = true
G.Unavailable109.TextScaled = true
G.Unavailable109.Visible = false
G.Unavailable109.Parent = G.Pixel14

G.UIStroke349 = Instance.new("UIStroke")
G.UIStroke349.Name = "UIStroke"
G.UIStroke349.Thickness = 2
G.UIStroke349.Parent = G.Unavailable109

G.Purchase36 = Instance.new("ImageButton")
G.Purchase36.Name = "Purchase"
G.Purchase36.Size = UDim2.new(0.902423,0,0.116761,0)
G.Purchase36.Position = UDim2.new(0.521125,0,0.866764,0)
G.Purchase36.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase36.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase36.BorderSizePixel = 0
G.Purchase36.ScaleType = Enum.ScaleType.Fit
G.Purchase36.AutoButtonColor = false
G.Purchase36.Active = false
G.Purchase36.Parent = G.Template4

G.Price36 = Instance.new("TextLabel")
G.Price36.Name = "Price"
G.Price36.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price36.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price36.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price36.BackgroundTransparency = 1
G.Price36.BorderSizePixel = 0
G.Price36.Text = "$19.99"
G.Price36.TextColor3 = Color3.fromRGB(255,255,255)
G.Price36.TextSize = 14
G.Price36.Font = Enum.Font.Arcade
G.Price36.TextWrapped = true
G.Price36.TextScaled = true
G.Price36.RichText = true
G.Price36.AutomaticSize = Enum.AutomaticSize.X
G.Price36.Parent = G.Purchase36

G.UIGradient137 = Instance.new("UIGradient")
G.UIGradient137.Name = "UIGradient"
G.UIGradient137.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient137.Rotation = -90
G.UIGradient137.Offset = Vector2.new(0,0)
G.UIGradient137.Parent = G.Price36

G.UIStroke350 = Instance.new("UIStroke")
G.UIStroke350.Name = "UIStroke"
G.UIStroke350.Thickness = 2
G.UIStroke350.Parent = G.Price36

G.UICorner37 = Instance.new("UICorner")
G.UICorner37.Name = "UICorner"
G.UICorner37.CornerRadius = UDim.new(1,0)
G.UICorner37.Parent = G.Purchase36

G.UIGradient138 = Instance.new("UIGradient")
G.UIGradient138.Name = "UIGradient"
G.UIGradient138.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient138.Rotation = -90
G.UIGradient138.Offset = Vector2.new(0,0)
G.UIGradient138.Parent = G.Purchase36

G.UIStroke351 = Instance.new("UIStroke")
G.UIStroke351.Name = "UIStroke"
G.UIStroke351.Thickness = 2.5
G.UIStroke351.Parent = G.Purchase36

G.Title36 = Instance.new("TextLabel")
G.Title36.Name = "Title"
G.Title36.Size = UDim2.new(0.854506,0,0.108842,0)
G.Title36.Position = UDim2.new(0.521125,0,0.0306124,0)
G.Title36.AnchorPoint = Vector2.new(0.5,0)
G.Title36.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title36.BackgroundTransparency = 1
G.Title36.BorderSizePixel = 0
G.Title36.Text = "COM-1172018676341932478"
G.Title36.TextColor3 = Color3.fromRGB(0,0,0)
G.Title36.TextSize = 29
G.Title36.Font = Enum.Font.Arcade
G.Title36.TextXAlignment = Enum.TextXAlignment.Left
G.Title36.TextYAlignment = Enum.TextYAlignment.Top
G.Title36.TextWrapped = true
G.Title36.TextScaled = true
G.Title36.RichText = true
G.Title36.AutomaticSize = Enum.AutomaticSize.X
G.Title36.Parent = G.Template4

G.UITextSizeConstraint17 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint17.Name = "UITextSizeConstraint"
G.UITextSizeConstraint17.MaxTextSize = 29
G.UITextSizeConstraint17.Parent = G.Title36

G.UIAspectRatioConstraint18 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint18.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint18.AspectRatio = 0.76
G.UIAspectRatioConstraint18.Parent = G.Template4

G.Template5 = Instance.new("Frame")
G.Template5.Name = "Template"
G.Template5.Size = UDim2.new(0.31602,0,0.944677,0)
G.Template5.Position = UDim2.new(0.672173,0,-0.0531514,0)
G.Template5.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.Template5.BackgroundTransparency = 1
G.Template5.BorderColor3 = Color3.fromRGB(0,0,0)
G.Template5.BorderSizePixel = 0
G.Template5.Parent = G.Row2

G.BG37 = Instance.new("Frame")
G.BG37.Name = "BG"
G.BG37.Size = UDim2.new(1,0,1,0)
G.BG37.Position = UDim2.new(0.5,0,0.5,0)
G.BG37.AnchorPoint = Vector2.new(0.5,0.5)
G.BG37.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG37.BackgroundTransparency = 1
G.BG37.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG37.BorderSizePixel = 0
G.BG37.ZIndex = -1
G.BG37.Parent = G.Template5

G.Dropshadow36 = Instance.new("Frame")
G.Dropshadow36.Name = "Dropshadow"
G.Dropshadow36.Size = UDim2.new(0.940524,0,0.940524,0)
G.Dropshadow36.Position = UDim2.new(0,0,1,0)
G.Dropshadow36.AnchorPoint = Vector2.new(0,1)
G.Dropshadow36.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow36.BackgroundTransparency = 0.5
G.Dropshadow36.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow36.BorderSizePixel = 0
G.Dropshadow36.ZIndex = -2
G.Dropshadow36.Parent = G.BG37

G.Frame37 = Instance.new("Frame")
G.Frame37.Name = "Frame"
G.Frame37.Size = UDim2.new(0.95775,0,0.95775,0)
G.Frame37.Position = UDim2.new(0.521125,0,0.478875,0)
G.Frame37.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame37.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame37.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame37.BorderSizePixel = 0
G.Frame37.ZIndex = -1
G.Frame37.Parent = G.BG37

G.UIStroke352 = Instance.new("UIStroke")
G.UIStroke352.Name = "UIStroke"
G.UIStroke352.Thickness = 4
G.UIStroke352.Parent = G.Frame37

G.Item211 = Instance.new("ImageLabel")
G.Item211.Name = "Item2"
G.Item211.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item211.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item211.AnchorPoint = Vector2.new(0.5,0.5)
G.Item211.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item211.BackgroundTransparency = 1
G.Item211.BorderSizePixel = 0
G.Item211.Image = "rbxassetid://94959635148921"
G.Item211.ImageRectOffset = Vector2.new(25,25)
G.Item211.ImageRectSize = Vector2.new(250,250)
G.Item211.ScaleType = Enum.ScaleType.Crop
G.Item211.Visible = false
G.Item211.ZIndex = -1
G.Item211.Parent = G.Template5

G.Unavailable110 = Instance.new("TextLabel")
G.Unavailable110.Name = "Unavailable"
G.Unavailable110.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable110.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable110.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable110.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable110.BackgroundTransparency = 1
G.Unavailable110.BorderSizePixel = 0
G.Unavailable110.Text = "Unavailable"
G.Unavailable110.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable110.TextSize = 14
G.Unavailable110.Font = Enum.Font.FredokaOne
G.Unavailable110.TextWrapped = true
G.Unavailable110.TextScaled = true
G.Unavailable110.Visible = false
G.Unavailable110.Parent = G.Item211

G.UIStroke353 = Instance.new("UIStroke")
G.UIStroke353.Name = "UIStroke"
G.UIStroke353.Thickness = 2
G.UIStroke353.Parent = G.Unavailable110

G.Pixel15 = Instance.new("ImageLabel")
G.Pixel15.Name = "Pixel"
G.Pixel15.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel15.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel15.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel15.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel15.BorderSizePixel = 0
G.Pixel15.Image = "rbxassetid://94959635148921"
G.Pixel15.ImageRectOffset = Vector2.new(55,100)
G.Pixel15.ImageRectSize = Vector2.new(30,30)
G.Pixel15.ScaleType = Enum.ScaleType.Crop
G.Pixel15.Visible = false
G.Pixel15.ZIndex = 5
G.Pixel15.Parent = G.Template5

G.Unavailable111 = Instance.new("TextLabel")
G.Unavailable111.Name = "Unavailable"
G.Unavailable111.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable111.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable111.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable111.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable111.BackgroundTransparency = 1
G.Unavailable111.BorderSizePixel = 0
G.Unavailable111.Text = "Unavailable"
G.Unavailable111.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable111.TextSize = 14
G.Unavailable111.Font = Enum.Font.FredokaOne
G.Unavailable111.TextWrapped = true
G.Unavailable111.TextScaled = true
G.Unavailable111.Visible = false
G.Unavailable111.Parent = G.Pixel15

G.UIStroke354 = Instance.new("UIStroke")
G.UIStroke354.Name = "UIStroke"
G.UIStroke354.Thickness = 2
G.UIStroke354.Parent = G.Unavailable111

G.Purchase37 = Instance.new("ImageButton")
G.Purchase37.Name = "Purchase"
G.Purchase37.Size = UDim2.new(0.902423,0,0.116761,0)
G.Purchase37.Position = UDim2.new(0.521125,0,0.866764,0)
G.Purchase37.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase37.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase37.BorderSizePixel = 0
G.Purchase37.ScaleType = Enum.ScaleType.Fit
G.Purchase37.AutoButtonColor = false
G.Purchase37.Active = false
G.Purchase37.Parent = G.Template5

G.Price37 = Instance.new("TextLabel")
G.Price37.Name = "Price"
G.Price37.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price37.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price37.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price37.BackgroundTransparency = 1
G.Price37.BorderSizePixel = 0
G.Price37.Text = "$19.99"
G.Price37.TextColor3 = Color3.fromRGB(255,255,255)
G.Price37.TextSize = 14
G.Price37.Font = Enum.Font.Arcade
G.Price37.TextWrapped = true
G.Price37.TextScaled = true
G.Price37.RichText = true
G.Price37.AutomaticSize = Enum.AutomaticSize.X
G.Price37.Parent = G.Purchase37

G.UIGradient139 = Instance.new("UIGradient")
G.UIGradient139.Name = "UIGradient"
G.UIGradient139.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient139.Rotation = -90
G.UIGradient139.Offset = Vector2.new(0,0)
G.UIGradient139.Parent = G.Price37

G.UIStroke355 = Instance.new("UIStroke")
G.UIStroke355.Name = "UIStroke"
G.UIStroke355.Thickness = 2
G.UIStroke355.Parent = G.Price37

G.UICorner38 = Instance.new("UICorner")
G.UICorner38.Name = "UICorner"
G.UICorner38.CornerRadius = UDim.new(1,0)
G.UICorner38.Parent = G.Purchase37

G.UIGradient140 = Instance.new("UIGradient")
G.UIGradient140.Name = "UIGradient"
G.UIGradient140.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient140.Rotation = -90
G.UIGradient140.Offset = Vector2.new(0,0)
G.UIGradient140.Parent = G.Purchase37

G.UIStroke356 = Instance.new("UIStroke")
G.UIStroke356.Name = "UIStroke"
G.UIStroke356.Thickness = 2.5
G.UIStroke356.Parent = G.Purchase37

G.Title37 = Instance.new("TextLabel")
G.Title37.Name = "Title"
G.Title37.Size = UDim2.new(0.854506,0,0.108842,0)
G.Title37.Position = UDim2.new(0.521125,0,0.0306124,0)
G.Title37.AnchorPoint = Vector2.new(0.5,0)
G.Title37.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title37.BackgroundTransparency = 1
G.Title37.BorderSizePixel = 0
G.Title37.Text = "COM-8161690335689048493"
G.Title37.TextColor3 = Color3.fromRGB(0,0,0)
G.Title37.TextSize = 29
G.Title37.Font = Enum.Font.Arcade
G.Title37.TextXAlignment = Enum.TextXAlignment.Left
G.Title37.TextYAlignment = Enum.TextYAlignment.Top
G.Title37.TextWrapped = true
G.Title37.TextScaled = true
G.Title37.RichText = true
G.Title37.AutomaticSize = Enum.AutomaticSize.X
G.Title37.Parent = G.Template5

G.UITextSizeConstraint18 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint18.Name = "UITextSizeConstraint"
G.UITextSizeConstraint18.MaxTextSize = 29
G.UITextSizeConstraint18.Parent = G.Title37

G.UIAspectRatioConstraint19 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint19.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint19.AspectRatio = 0.76
G.UIAspectRatioConstraint19.Parent = G.Template5

G.Template6 = Instance.new("Frame")
G.Template6.Name = "Template"
G.Template6.Size = UDim2.new(0.31602,0,0.944677,0)
G.Template6.Position = UDim2.new(0.336087,0,-0.0531514,0)
G.Template6.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.Template6.BackgroundTransparency = 1
G.Template6.BorderColor3 = Color3.fromRGB(0,0,0)
G.Template6.BorderSizePixel = 0
G.Template6.Parent = G.Row2

G.BG38 = Instance.new("Frame")
G.BG38.Name = "BG"
G.BG38.Size = UDim2.new(1,0,1,0)
G.BG38.Position = UDim2.new(0.5,0,0.5,0)
G.BG38.AnchorPoint = Vector2.new(0.5,0.5)
G.BG38.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG38.BackgroundTransparency = 1
G.BG38.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG38.BorderSizePixel = 0
G.BG38.ZIndex = -1
G.BG38.Parent = G.Template6

G.Dropshadow37 = Instance.new("Frame")
G.Dropshadow37.Name = "Dropshadow"
G.Dropshadow37.Size = UDim2.new(0.940524,0,0.940524,0)
G.Dropshadow37.Position = UDim2.new(0,0,1,0)
G.Dropshadow37.AnchorPoint = Vector2.new(0,1)
G.Dropshadow37.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow37.BackgroundTransparency = 0.5
G.Dropshadow37.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow37.BorderSizePixel = 0
G.Dropshadow37.ZIndex = -2
G.Dropshadow37.Parent = G.BG38

G.Frame38 = Instance.new("Frame")
G.Frame38.Name = "Frame"
G.Frame38.Size = UDim2.new(0.95775,0,0.95775,0)
G.Frame38.Position = UDim2.new(0.521125,0,0.478875,0)
G.Frame38.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame38.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame38.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame38.BorderSizePixel = 0
G.Frame38.ZIndex = -1
G.Frame38.Parent = G.BG38

G.UIStroke357 = Instance.new("UIStroke")
G.UIStroke357.Name = "UIStroke"
G.UIStroke357.Thickness = 4
G.UIStroke357.Parent = G.Frame38

G.Item212 = Instance.new("ImageLabel")
G.Item212.Name = "Item2"
G.Item212.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item212.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item212.AnchorPoint = Vector2.new(0.5,0.5)
G.Item212.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item212.BackgroundTransparency = 1
G.Item212.BorderSizePixel = 0
G.Item212.Image = "rbxassetid://138096832706650"
G.Item212.ImageRectOffset = Vector2.new(25,25)
G.Item212.ImageRectSize = Vector2.new(700,700)
G.Item212.ScaleType = Enum.ScaleType.Fit
G.Item212.Visible = false
G.Item212.ZIndex = -1
G.Item212.Parent = G.Template6

G.Unavailable112 = Instance.new("TextLabel")
G.Unavailable112.Name = "Unavailable"
G.Unavailable112.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable112.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable112.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable112.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable112.BackgroundTransparency = 1
G.Unavailable112.BorderSizePixel = 0
G.Unavailable112.Text = "Unavailable"
G.Unavailable112.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable112.TextSize = 14
G.Unavailable112.Font = Enum.Font.FredokaOne
G.Unavailable112.TextWrapped = true
G.Unavailable112.TextScaled = true
G.Unavailable112.Visible = false
G.Unavailable112.Parent = G.Item212

G.UIStroke358 = Instance.new("UIStroke")
G.UIStroke358.Name = "UIStroke"
G.UIStroke358.Thickness = 2
G.UIStroke358.Parent = G.Unavailable112

G.Pixel16 = Instance.new("ImageLabel")
G.Pixel16.Name = "Pixel"
G.Pixel16.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel16.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel16.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel16.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel16.BorderSizePixel = 0
G.Pixel16.Image = "rbxassetid://94959635148921"
G.Pixel16.ImageRectOffset = Vector2.new(55,100)
G.Pixel16.ImageRectSize = Vector2.new(30,30)
G.Pixel16.ScaleType = Enum.ScaleType.Crop
G.Pixel16.Visible = false
G.Pixel16.ZIndex = 5
G.Pixel16.Parent = G.Template6

G.Unavailable113 = Instance.new("TextLabel")
G.Unavailable113.Name = "Unavailable"
G.Unavailable113.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable113.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable113.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable113.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable113.BackgroundTransparency = 1
G.Unavailable113.BorderSizePixel = 0
G.Unavailable113.Text = "Unavailable"
G.Unavailable113.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable113.TextSize = 14
G.Unavailable113.Font = Enum.Font.FredokaOne
G.Unavailable113.TextWrapped = true
G.Unavailable113.TextScaled = true
G.Unavailable113.Visible = false
G.Unavailable113.Parent = G.Pixel16

G.UIStroke359 = Instance.new("UIStroke")
G.UIStroke359.Name = "UIStroke"
G.UIStroke359.Thickness = 2
G.UIStroke359.Parent = G.Unavailable113

G.Purchase38 = Instance.new("ImageButton")
G.Purchase38.Name = "Purchase"
G.Purchase38.Size = UDim2.new(0.902423,0,0.116761,0)
G.Purchase38.Position = UDim2.new(0.521125,0,0.866764,0)
G.Purchase38.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase38.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase38.BorderSizePixel = 0
G.Purchase38.ScaleType = Enum.ScaleType.Fit
G.Purchase38.AutoButtonColor = false
G.Purchase38.Active = false
G.Purchase38.Parent = G.Template6

G.Price38 = Instance.new("TextLabel")
G.Price38.Name = "Price"
G.Price38.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price38.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price38.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price38.BackgroundTransparency = 1
G.Price38.BorderSizePixel = 0
G.Price38.Text = "$19.99"
G.Price38.TextColor3 = Color3.fromRGB(255,255,255)
G.Price38.TextSize = 14
G.Price38.Font = Enum.Font.Arcade
G.Price38.TextWrapped = true
G.Price38.TextScaled = true
G.Price38.RichText = true
G.Price38.AutomaticSize = Enum.AutomaticSize.X
G.Price38.Parent = G.Purchase38

G.UIGradient141 = Instance.new("UIGradient")
G.UIGradient141.Name = "UIGradient"
G.UIGradient141.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient141.Rotation = -90
G.UIGradient141.Offset = Vector2.new(0,0)
G.UIGradient141.Parent = G.Price38

G.UIStroke360 = Instance.new("UIStroke")
G.UIStroke360.Name = "UIStroke"
G.UIStroke360.Thickness = 2
G.UIStroke360.Parent = G.Price38

G.UICorner39 = Instance.new("UICorner")
G.UICorner39.Name = "UICorner"
G.UICorner39.CornerRadius = UDim.new(1,0)
G.UICorner39.Parent = G.Purchase38

G.UIGradient142 = Instance.new("UIGradient")
G.UIGradient142.Name = "UIGradient"
G.UIGradient142.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient142.Rotation = -90
G.UIGradient142.Offset = Vector2.new(0,0)
G.UIGradient142.Parent = G.Purchase38

G.UIStroke361 = Instance.new("UIStroke")
G.UIStroke361.Name = "UIStroke"
G.UIStroke361.Thickness = 2.5
G.UIStroke361.Parent = G.Purchase38

G.Title38 = Instance.new("TextLabel")
G.Title38.Name = "Title"
G.Title38.Size = UDim2.new(0.854506,0,0.108842,0)
G.Title38.Position = UDim2.new(0.521125,0,0.0306124,0)
G.Title38.AnchorPoint = Vector2.new(0.5,0)
G.Title38.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title38.BackgroundTransparency = 1
G.Title38.BorderSizePixel = 0
G.Title38.Text = "COM-3064917379272933809"
G.Title38.TextColor3 = Color3.fromRGB(0,0,0)
G.Title38.TextSize = 29
G.Title38.Font = Enum.Font.Arcade
G.Title38.TextXAlignment = Enum.TextXAlignment.Left
G.Title38.TextYAlignment = Enum.TextYAlignment.Top
G.Title38.TextWrapped = true
G.Title38.TextScaled = true
G.Title38.RichText = true
G.Title38.AutomaticSize = Enum.AutomaticSize.X
G.Title38.Parent = G.Template6

G.UITextSizeConstraint19 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint19.Name = "UITextSizeConstraint"
G.UITextSizeConstraint19.MaxTextSize = 29
G.UITextSizeConstraint19.Parent = G.Title38

G.UIAspectRatioConstraint20 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint20.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint20.AspectRatio = 0.76
G.UIAspectRatioConstraint20.Parent = G.Template6

G.UIListLayout21 = Instance.new("UIListLayout")
G.UIListLayout21.Name = "UIListLayout"
G.UIListLayout21.Padding = UDim.new(0.019,0)
G.UIListLayout21.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout21.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout21.Wraps = false
G.UIListLayout21.Parent = G.Row2

G.Special19 = Instance.new("Frame")
G.Special19.Name = "Special"
G.Special19.Size = UDim2.new(1.10498,0,0.439953,0)
G.Special19.Position = UDim2.new(0,0,-0.143337,0)
G.Special19.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special19.BackgroundTransparency = 1
G.Special19.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special19.BorderSizePixel = 0
G.Special19.LayoutOrder = -2
G.Special19.Parent = G.ScrollingFrame

G.COM_7777933156794761646 = Instance.new("Frame")
G.COM_7777933156794761646.Name = "COM-7777933156794761646"
G.COM_7777933156794761646.Size = UDim2.new(0.894307,0,0.931111,0)
G.COM_7777933156794761646.Position = UDim2.new(-5.79236e-08,0,0,0)
G.COM_7777933156794761646.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_7777933156794761646.BackgroundTransparency = 1
G.COM_7777933156794761646.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_7777933156794761646.BorderSizePixel = 0
G.COM_7777933156794761646.Parent = G.Special19

G.BG39 = Instance.new("Frame")
G.BG39.Name = "BG"
G.BG39.Size = UDim2.new(1,0,1,0)
G.BG39.Position = UDim2.new(0.5,0,0.5,0)
G.BG39.AnchorPoint = Vector2.new(0.5,0.5)
G.BG39.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG39.BackgroundTransparency = 1
G.BG39.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG39.BorderSizePixel = 0
G.BG39.ZIndex = -1
G.BG39.Parent = G.COM_7777933156794761646

G.Dropshadow38 = Instance.new("Frame")
G.Dropshadow38.Name = "Dropshadow"
G.Dropshadow38.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow38.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow38.AnchorPoint = Vector2.new(0,1)
G.Dropshadow38.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow38.BackgroundTransparency = 0.5
G.Dropshadow38.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow38.BorderSizePixel = 0
G.Dropshadow38.ZIndex = -2
G.Dropshadow38.Parent = G.BG39

G.UIStroke362 = Instance.new("UIStroke")
G.UIStroke362.Name = "UIStroke"
G.UIStroke362.Thickness = 2.79551
G.UIStroke362.Transparency = 1
G.UIStroke362.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke362.Parent = G.Dropshadow38

G.Frame39 = Instance.new("Frame")
G.Frame39.Name = "Frame"
G.Frame39.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame39.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame39.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame39.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame39.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame39.BorderSizePixel = 0
G.Frame39.ZIndex = -1
G.Frame39.Parent = G.BG39

G.Pattern32 = Instance.new("ImageLabel")
G.Pattern32.Name = "Pattern"
G.Pattern32.Size = UDim2.new(0.635249,0,1,0)
G.Pattern32.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern32.BackgroundTransparency = 1
G.Pattern32.BorderSizePixel = 0
G.Pattern32.Image = "rbxassetid://122640361585603"
G.Pattern32.ZIndex = -1
G.Pattern32.Parent = G.Frame39

G.UIStroke363 = Instance.new("UIStroke")
G.UIStroke363.Name = "UIStroke"
G.UIStroke363.Thickness = 1.86368
G.UIStroke363.Parent = G.Pattern32

G.UIStroke364 = Instance.new("UIStroke")
G.UIStroke364.Name = "UIStroke"
G.UIStroke364.Thickness = 1.86368
G.UIStroke364.Parent = G.Frame39

G.Highlight32 = Instance.new("Frame")
G.Highlight32.Name = "Highlight"
G.Highlight32.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight32.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight32.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight32.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight32.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight32.BorderSizePixel = 0
G.Highlight32.Visible = false
G.Highlight32.ZIndex = -2
G.Highlight32.Parent = G.BG39

G.UIStroke365 = Instance.new("UIStroke")
G.UIStroke365.Name = "UIStroke"
G.UIStroke365.Color = Color3.fromRGB(255,242,0)
G.UIStroke365.Thickness = 2.79551
G.UIStroke365.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke365.Parent = G.Highlight32

G.CanvasGroup13 = Instance.new("CanvasGroup")
G.CanvasGroup13.Name = "CanvasGroup"
G.CanvasGroup13.Size = UDim2.new(1,0,1,0)
G.CanvasGroup13.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup13.BackgroundTransparency = 1
G.CanvasGroup13.Parent = G.COM_7777933156794761646

G.Thumbnail60 = Instance.new("ImageLabel")
G.Thumbnail60.Name = "Thumbnail"
G.Thumbnail60.Size = UDim2.new(0.319652,0,0.833356,0)
G.Thumbnail60.Position = UDim2.new(0.102736,0,0.539585,0)
G.Thumbnail60.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail60.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail60.BackgroundTransparency = 1
G.Thumbnail60.BorderSizePixel = 0
G.Thumbnail60.Image = "rbxassetid://87651335157097"
G.Thumbnail60.ScaleType = Enum.ScaleType.Fit
G.Thumbnail60.ZIndex = 0
G.Thumbnail60.Rotation = -11
G.Thumbnail60.Parent = G.CanvasGroup13

G.Unavailable114 = Instance.new("TextLabel")
G.Unavailable114.Name = "Unavailable"
G.Unavailable114.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable114.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable114.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable114.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable114.BackgroundTransparency = 1
G.Unavailable114.BorderSizePixel = 0
G.Unavailable114.Text = "Unavailable"
G.Unavailable114.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable114.TextSize = 14
G.Unavailable114.Font = Enum.Font.FredokaOne
G.Unavailable114.TextWrapped = true
G.Unavailable114.TextScaled = true
G.Unavailable114.Visible = false
G.Unavailable114.Parent = G.Thumbnail60

G.UIStroke366 = Instance.new("UIStroke")
G.UIStroke366.Name = "UIStroke"
G.UIStroke366.Thickness = 2
G.UIStroke366.Parent = G.Unavailable114

G.Thumbnail61 = Instance.new("ImageLabel")
G.Thumbnail61.Name = "Thumbnail"
G.Thumbnail61.Size = UDim2.new(0.319652,0,0.833356,0)
G.Thumbnail61.Position = UDim2.new(0.191823,0,0.468269,0)
G.Thumbnail61.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail61.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail61.BackgroundTransparency = 1
G.Thumbnail61.BorderSizePixel = 0
G.Thumbnail61.Image = "rbxassetid://97508659766543"
G.Thumbnail61.ScaleType = Enum.ScaleType.Fit
G.Thumbnail61.ZIndex = -1
G.Thumbnail61.Rotation = 16
G.Thumbnail61.Parent = G.CanvasGroup13

G.Unavailable115 = Instance.new("TextLabel")
G.Unavailable115.Name = "Unavailable"
G.Unavailable115.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable115.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable115.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable115.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable115.BackgroundTransparency = 1
G.Unavailable115.BorderSizePixel = 0
G.Unavailable115.Text = "Unavailable"
G.Unavailable115.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable115.TextSize = 14
G.Unavailable115.Font = Enum.Font.FredokaOne
G.Unavailable115.TextWrapped = true
G.Unavailable115.TextScaled = true
G.Unavailable115.Visible = false
G.Unavailable115.Parent = G.Thumbnail61

G.UIStroke367 = Instance.new("UIStroke")
G.UIStroke367.Name = "UIStroke"
G.UIStroke367.Thickness = 2
G.UIStroke367.Parent = G.Unavailable115

G.Thumbnail62 = Instance.new("ImageLabel")
G.Thumbnail62.Name = "Thumbnail"
G.Thumbnail62.Size = UDim2.new(0.319652,0,0.833356,0)
G.Thumbnail62.Position = UDim2.new(0.350479,0,0.506057,0)
G.Thumbnail62.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail62.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail62.BackgroundTransparency = 1
G.Thumbnail62.BorderSizePixel = 0
G.Thumbnail62.Image = "rbxassetid://97103112524050"
G.Thumbnail62.ScaleType = Enum.ScaleType.Fit
G.Thumbnail62.ZIndex = 0
G.Thumbnail62.Rotation = 13
G.Thumbnail62.Parent = G.CanvasGroup13

G.Unavailable116 = Instance.new("TextLabel")
G.Unavailable116.Name = "Unavailable"
G.Unavailable116.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable116.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable116.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable116.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable116.BackgroundTransparency = 1
G.Unavailable116.BorderSizePixel = 0
G.Unavailable116.Text = "Unavailable"
G.Unavailable116.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable116.TextSize = 14
G.Unavailable116.Font = Enum.Font.FredokaOne
G.Unavailable116.TextWrapped = true
G.Unavailable116.TextScaled = true
G.Unavailable116.Visible = false
G.Unavailable116.Parent = G.Thumbnail62

G.UIStroke368 = Instance.new("UIStroke")
G.UIStroke368.Name = "UIStroke"
G.UIStroke368.Thickness = 2
G.UIStroke368.Parent = G.Unavailable116

G.DisplayTitle25 = Instance.new("TextLabel")
G.DisplayTitle25.Name = "DisplayTitle"
G.DisplayTitle25.Size = UDim2.new(0.28831,0,0.367128,0)
G.DisplayTitle25.Position = UDim2.new(0.814632,0,0.191717,0)
G.DisplayTitle25.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle25.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle25.BackgroundTransparency = 1
G.DisplayTitle25.BorderSizePixel = 0
G.DisplayTitle25.Text = "Pebble 11\" Deluxe Plush (Pre-Order)"
G.DisplayTitle25.TextColor3 = Color3.fromRGB(0,0,0)
G.DisplayTitle25.TextSize = 29
G.DisplayTitle25.Font = Enum.Font.Arcade
G.DisplayTitle25.TextWrapped = true
G.DisplayTitle25.TextScaled = true
G.DisplayTitle25.RichText = true
G.DisplayTitle25.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle25.Parent = G.COM_7777933156794761646

G.UIAspectRatioConstraint21 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint21.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint21.AspectRatio = 2.66
G.UIAspectRatioConstraint21.Parent = G.DisplayTitle25

G.UIGradient143 = Instance.new("UIGradient")
G.UIGradient143.Name = "UIGradient"
G.UIGradient143.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient143.Rotation = -90
G.UIGradient143.Offset = Vector2.new(0,0)
G.UIGradient143.Enabled = false
G.UIGradient143.Parent = G.DisplayTitle25

G.UIStroke369 = Instance.new("UIStroke")
G.UIStroke369.Name = "UIStroke"
G.UIStroke369.Color = Color3.fromRGB(255,255,255)
G.UIStroke369.Thickness = 0.931838
G.UIStroke369.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke369.Parent = G.DisplayTitle25

G.Item36 = Instance.new("ImageLabel")
G.Item36.Name = "Item"
G.Item36.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item36.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item36.AnchorPoint = Vector2.new(0.5,0.5)
G.Item36.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item36.BackgroundTransparency = 1
G.Item36.BorderSizePixel = 0
G.Item36.Image = "rbxassetid://94959635148921"
G.Item36.ImageRectOffset = Vector2.new(15,15)
G.Item36.ImageRectSize = Vector2.new(270,270)
G.Item36.ScaleType = Enum.ScaleType.Fit
G.Item36.Visible = false
G.Item36.ZIndex = -1
G.Item36.Parent = G.COM_7777933156794761646

G.Unavailable117 = Instance.new("TextLabel")
G.Unavailable117.Name = "Unavailable"
G.Unavailable117.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable117.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable117.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable117.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable117.BackgroundTransparency = 1
G.Unavailable117.BorderSizePixel = 0
G.Unavailable117.Text = "Unavailable"
G.Unavailable117.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable117.TextSize = 14
G.Unavailable117.Font = Enum.Font.FredokaOne
G.Unavailable117.TextWrapped = true
G.Unavailable117.TextScaled = true
G.Unavailable117.Visible = false
G.Unavailable117.Parent = G.Item36

G.UIStroke370 = Instance.new("UIStroke")
G.UIStroke370.Name = "UIStroke"
G.UIStroke370.Thickness = 2
G.UIStroke370.Parent = G.Unavailable117

G.New18 = Instance.new("ImageLabel")
G.New18.Name = "New"
G.New18.Size = UDim2.new(0.322123,0,0.355513,0)
G.New18.Position = UDim2.new(0.944127,0,0.0328983,0)
G.New18.AnchorPoint = Vector2.new(0.5,0.5)
G.New18.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New18.BackgroundTransparency = 1
G.New18.BorderSizePixel = 0
G.New18.Image = "rbxassetid://96728750855907"
G.New18.ScaleType = Enum.ScaleType.Fit
G.New18.Visible = false
G.New18.ZIndex = -1
G.New18.Parent = G.COM_7777933156794761646

G.UIScale52 = Instance.new("UIScale")
G.UIScale52.Name = "UIScale"
G.UIScale52.Parent = G.New18

G.Purchase39 = Instance.new("ImageButton")
G.Purchase39.Name = "Purchase"
G.Purchase39.Size = UDim2.new(0.299855,0,0.201102,0)
G.Purchase39.Position = UDim2.new(0.814697,0,0.786462,0)
G.Purchase39.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase39.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase39.BorderSizePixel = 0
G.Purchase39.ScaleType = Enum.ScaleType.Fit
G.Purchase39.AutoButtonColor = false
G.Purchase39.Parent = G.COM_7777933156794761646

G.Price39 = Instance.new("TextLabel")
G.Price39.Name = "Price"
G.Price39.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price39.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price39.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price39.BackgroundTransparency = 1
G.Price39.BorderSizePixel = 0
G.Price39.Text = "$19.99"
G.Price39.TextColor3 = Color3.fromRGB(255,255,255)
G.Price39.TextSize = 14
G.Price39.Font = Enum.Font.Arcade
G.Price39.TextWrapped = true
G.Price39.TextScaled = true
G.Price39.RichText = true
G.Price39.AutomaticSize = Enum.AutomaticSize.X
G.Price39.Parent = G.Purchase39

G.UIGradient144 = Instance.new("UIGradient")
G.UIGradient144.Name = "UIGradient"
G.UIGradient144.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient144.Rotation = -90
G.UIGradient144.Offset = Vector2.new(0,0)
G.UIGradient144.Parent = G.Price39

G.UIStroke371 = Instance.new("UIStroke")
G.UIStroke371.Name = "UIStroke"
G.UIStroke371.Thickness = 0.931838
G.UIStroke371.Parent = G.Price39

G.UICorner40 = Instance.new("UICorner")
G.UICorner40.Name = "UICorner"
G.UICorner40.CornerRadius = UDim.new(1,0)
G.UICorner40.Parent = G.Purchase39

G.UIGradient145 = Instance.new("UIGradient")
G.UIGradient145.Name = "UIGradient"
G.UIGradient145.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient145.Rotation = -90
G.UIGradient145.Offset = Vector2.new(0,0)
G.UIGradient145.Parent = G.Purchase39

G.UIScale53 = Instance.new("UIScale")
G.UIScale53.Name = "UIScale"
G.UIScale53.Parent = G.Purchase39

G.UIStroke372 = Instance.new("UIStroke")
G.UIStroke372.Name = "UIStroke"
G.UIStroke372.Thickness = 1.1648
G.UIStroke372.Parent = G.Purchase39

G.Thumbnail63 = Instance.new("ImageLabel")
G.Thumbnail63.Name = "Thumbnail"
G.Thumbnail63.Size = UDim2.new(0.48234,0,1.2575,0)
G.Thumbnail63.Position = UDim2.new(0.543731,0,0.435241,0)
G.Thumbnail63.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail63.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail63.BackgroundTransparency = 1
G.Thumbnail63.BorderSizePixel = 0
G.Thumbnail63.Image = "rbxassetid://95518451567242"
G.Thumbnail63.ScaleType = Enum.ScaleType.Fit
G.Thumbnail63.ZIndex = -1
G.Thumbnail63.Parent = G.COM_7777933156794761646

G.Unavailable118 = Instance.new("TextLabel")
G.Unavailable118.Name = "Unavailable"
G.Unavailable118.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable118.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable118.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable118.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable118.BackgroundTransparency = 1
G.Unavailable118.BorderSizePixel = 0
G.Unavailable118.Text = "Unavailable"
G.Unavailable118.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable118.TextSize = 14
G.Unavailable118.Font = Enum.Font.FredokaOne
G.Unavailable118.TextWrapped = true
G.Unavailable118.TextScaled = true
G.Unavailable118.Visible = false
G.Unavailable118.Parent = G.Thumbnail63

G.UIStroke373 = Instance.new("UIStroke")
G.UIStroke373.Name = "UIStroke"
G.UIStroke373.Thickness = 2
G.UIStroke373.Parent = G.Unavailable118

G.Title39 = Instance.new("TextLabel")
G.Title39.Name = "Title"
G.Title39.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title39.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title39.AnchorPoint = Vector2.new(0.5,0)
G.Title39.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title39.BackgroundTransparency = 1
G.Title39.BorderSizePixel = 0
G.Title39.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title39.TextColor3 = Color3.fromRGB(0,13,76)
G.Title39.TextSize = 29
G.Title39.Font = Enum.Font.Arcade
G.Title39.TextWrapped = true
G.Title39.TextScaled = true
G.Title39.RichText = true
G.Title39.Visible = false
G.Title39.AutomaticSize = Enum.AutomaticSize.X
G.Title39.Parent = G.COM_7777933156794761646

G.UIGradient146 = Instance.new("UIGradient")
G.UIGradient146.Name = "UIGradient"
G.UIGradient146.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient146.Rotation = -90
G.UIGradient146.Offset = Vector2.new(0,0)
G.UIGradient146.Parent = G.Title39

G.UIStroke374 = Instance.new("UIStroke")
G.UIStroke374.Name = "UIStroke"
G.UIStroke374.Color = Color3.fromRGB(255,255,255)
G.UIStroke374.Thickness = 2
G.UIStroke374.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke374.Parent = G.Title39

G.UIListLayout22 = Instance.new("UIListLayout")
G.UIListLayout22.Name = "UIListLayout"
G.UIListLayout22.Padding = UDim.new(0.019,0)
G.UIListLayout22.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout22.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout22.Wraps = false
G.UIListLayout22.Parent = G.Special19

G.Special20 = Instance.new("Frame")
G.Special20.Name = "Special"
G.Special20.Size = UDim2.new(1.10498,0,0.439953,0)
G.Special20.Position = UDim2.new(0,0,-0.143337,0)
G.Special20.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special20.BackgroundTransparency = 1
G.Special20.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special20.BorderSizePixel = 0
G.Special20.Visible = false
G.Special20.LayoutOrder = -1
G.Special20.Parent = G.ScrollingFrame

G.COM_5722338222113816999 = Instance.new("Frame")
G.COM_5722338222113816999.Name = "COM-5722338222113816999"
G.COM_5722338222113816999.Size = UDim2.new(0.894307,0,0.931111,0)
G.COM_5722338222113816999.Position = UDim2.new(-5.79236e-08,0,0,0)
G.COM_5722338222113816999.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_5722338222113816999.BackgroundTransparency = 1
G.COM_5722338222113816999.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_5722338222113816999.BorderSizePixel = 0
G.COM_5722338222113816999.Parent = G.Special20

G.BG40 = Instance.new("Frame")
G.BG40.Name = "BG"
G.BG40.Size = UDim2.new(1,0,1,0)
G.BG40.Position = UDim2.new(0.5,0,0.5,0)
G.BG40.AnchorPoint = Vector2.new(0.5,0.5)
G.BG40.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG40.BackgroundTransparency = 1
G.BG40.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG40.BorderSizePixel = 0
G.BG40.ZIndex = -1
G.BG40.Parent = G.COM_5722338222113816999

G.Dropshadow39 = Instance.new("Frame")
G.Dropshadow39.Name = "Dropshadow"
G.Dropshadow39.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow39.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow39.AnchorPoint = Vector2.new(0,1)
G.Dropshadow39.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow39.BackgroundTransparency = 0.5
G.Dropshadow39.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow39.BorderSizePixel = 0
G.Dropshadow39.ZIndex = -2
G.Dropshadow39.Parent = G.BG40

G.UIStroke375 = Instance.new("UIStroke")
G.UIStroke375.Name = "UIStroke"
G.UIStroke375.Thickness = 2.79551
G.UIStroke375.Transparency = 1
G.UIStroke375.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke375.Parent = G.Dropshadow39

G.Frame40 = Instance.new("Frame")
G.Frame40.Name = "Frame"
G.Frame40.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame40.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame40.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame40.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame40.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame40.BorderSizePixel = 0
G.Frame40.ZIndex = -1
G.Frame40.Parent = G.BG40

G.Pattern33 = Instance.new("ImageLabel")
G.Pattern33.Name = "Pattern"
G.Pattern33.Size = UDim2.new(0.584611,0,1,0)
G.Pattern33.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern33.BackgroundTransparency = 1
G.Pattern33.BorderSizePixel = 0
G.Pattern33.Image = "rbxassetid://104066119238656"
G.Pattern33.ZIndex = -1
G.Pattern33.Parent = G.Frame40

G.UIStroke376 = Instance.new("UIStroke")
G.UIStroke376.Name = "UIStroke"
G.UIStroke376.Thickness = 1.86368
G.UIStroke376.Parent = G.Pattern33

G.Pattern34 = Instance.new("ImageLabel")
G.Pattern34.Name = "Pattern"
G.Pattern34.Size = UDim2.new(0.416469,0,1,0)
G.Pattern34.Position = UDim2.new(0.584611,0,0,0)
G.Pattern34.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern34.BackgroundTransparency = 1
G.Pattern34.BorderSizePixel = 0
G.Pattern34.Image = "rbxassetid://104066119238656"
G.Pattern34.ImageColor3 = Color3.fromRGB(38,38,38)
G.Pattern34.ZIndex = -1
G.Pattern34.Parent = G.Frame40

G.UIStroke377 = Instance.new("UIStroke")
G.UIStroke377.Name = "UIStroke"
G.UIStroke377.Thickness = 1.86368
G.UIStroke377.Parent = G.Pattern34

G.UIStroke378 = Instance.new("UIStroke")
G.UIStroke378.Name = "UIStroke"
G.UIStroke378.Thickness = 1.86368
G.UIStroke378.Parent = G.Frame40

G.Highlight33 = Instance.new("Frame")
G.Highlight33.Name = "Highlight"
G.Highlight33.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight33.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight33.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight33.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight33.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight33.BorderSizePixel = 0
G.Highlight33.Visible = false
G.Highlight33.ZIndex = -2
G.Highlight33.Parent = G.BG40

G.UIStroke379 = Instance.new("UIStroke")
G.UIStroke379.Name = "UIStroke"
G.UIStroke379.Color = Color3.fromRGB(255,242,0)
G.UIStroke379.Thickness = 2.79551
G.UIStroke379.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke379.Parent = G.Highlight33

G.CanvasGroup14 = Instance.new("CanvasGroup")
G.CanvasGroup14.Name = "CanvasGroup"
G.CanvasGroup14.Size = UDim2.new(1,0,1,0)
G.CanvasGroup14.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup14.BackgroundTransparency = 1
G.CanvasGroup14.Parent = G.COM_5722338222113816999

G.DisplayTitle26 = Instance.new("TextLabel")
G.DisplayTitle26.Name = "DisplayTitle"
G.DisplayTitle26.Size = UDim2.new(0.28831,0,0.367128,0)
G.DisplayTitle26.Position = UDim2.new(0.830821,0,0.218714,0)
G.DisplayTitle26.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle26.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle26.BackgroundTransparency = 1
G.DisplayTitle26.BorderSizePixel = 0
G.DisplayTitle26.Text = "Dandy 14\" Deluxe Plush (Pre-Order)"
G.DisplayTitle26.TextColor3 = Color3.fromRGB(0,0,0)
G.DisplayTitle26.TextSize = 29
G.DisplayTitle26.Font = Enum.Font.Arcade
G.DisplayTitle26.TextWrapped = true
G.DisplayTitle26.TextScaled = true
G.DisplayTitle26.RichText = true
G.DisplayTitle26.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle26.Parent = G.COM_5722338222113816999

G.UIAspectRatioConstraint22 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint22.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint22.AspectRatio = 2.66
G.UIAspectRatioConstraint22.Parent = G.DisplayTitle26

G.UIGradient147 = Instance.new("UIGradient")
G.UIGradient147.Name = "UIGradient"
G.UIGradient147.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient147.Rotation = -90
G.UIGradient147.Offset = Vector2.new(0,0)
G.UIGradient147.Enabled = false
G.UIGradient147.Parent = G.DisplayTitle26

G.UIStroke380 = Instance.new("UIStroke")
G.UIStroke380.Name = "UIStroke"
G.UIStroke380.Color = Color3.fromRGB(255,255,255)
G.UIStroke380.Thickness = 0.931838
G.UIStroke380.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke380.Parent = G.DisplayTitle26

G.Item37 = Instance.new("ImageLabel")
G.Item37.Name = "Item"
G.Item37.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item37.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item37.AnchorPoint = Vector2.new(0.5,0.5)
G.Item37.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item37.BackgroundTransparency = 1
G.Item37.BorderSizePixel = 0
G.Item37.Image = "rbxassetid://94959635148921"
G.Item37.ImageRectOffset = Vector2.new(15,15)
G.Item37.ImageRectSize = Vector2.new(270,270)
G.Item37.ScaleType = Enum.ScaleType.Fit
G.Item37.Visible = false
G.Item37.ZIndex = -1
G.Item37.Parent = G.COM_5722338222113816999

G.Unavailable119 = Instance.new("TextLabel")
G.Unavailable119.Name = "Unavailable"
G.Unavailable119.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable119.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable119.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable119.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable119.BackgroundTransparency = 1
G.Unavailable119.BorderSizePixel = 0
G.Unavailable119.Text = "Unavailable"
G.Unavailable119.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable119.TextSize = 14
G.Unavailable119.Font = Enum.Font.FredokaOne
G.Unavailable119.TextWrapped = true
G.Unavailable119.TextScaled = true
G.Unavailable119.Visible = false
G.Unavailable119.Parent = G.Item37

G.UIStroke381 = Instance.new("UIStroke")
G.UIStroke381.Name = "UIStroke"
G.UIStroke381.Thickness = 2
G.UIStroke381.Parent = G.Unavailable119

G.Purchase40 = Instance.new("ImageButton")
G.Purchase40.Name = "Purchase"
G.Purchase40.Size = UDim2.new(0.26852,0,0.201102,0)
G.Purchase40.Position = UDim2.new(0.843641,0,0.786462,0)
G.Purchase40.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase40.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase40.BorderSizePixel = 0
G.Purchase40.ScaleType = Enum.ScaleType.Fit
G.Purchase40.AutoButtonColor = false
G.Purchase40.Parent = G.COM_5722338222113816999

G.Price40 = Instance.new("TextLabel")
G.Price40.Name = "Price"
G.Price40.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price40.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price40.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price40.BackgroundTransparency = 1
G.Price40.BorderSizePixel = 0
G.Price40.Text = "$19.99"
G.Price40.TextColor3 = Color3.fromRGB(255,255,255)
G.Price40.TextSize = 14
G.Price40.Font = Enum.Font.Arcade
G.Price40.TextWrapped = true
G.Price40.TextScaled = true
G.Price40.RichText = true
G.Price40.AutomaticSize = Enum.AutomaticSize.X
G.Price40.Parent = G.Purchase40

G.UIGradient148 = Instance.new("UIGradient")
G.UIGradient148.Name = "UIGradient"
G.UIGradient148.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient148.Rotation = -90
G.UIGradient148.Offset = Vector2.new(0,0)
G.UIGradient148.Parent = G.Price40

G.UIStroke382 = Instance.new("UIStroke")
G.UIStroke382.Name = "UIStroke"
G.UIStroke382.Thickness = 0.931838
G.UIStroke382.Parent = G.Price40

G.UICorner41 = Instance.new("UICorner")
G.UICorner41.Name = "UICorner"
G.UICorner41.CornerRadius = UDim.new(1,0)
G.UICorner41.Parent = G.Purchase40

G.UIGradient149 = Instance.new("UIGradient")
G.UIGradient149.Name = "UIGradient"
G.UIGradient149.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient149.Rotation = -90
G.UIGradient149.Offset = Vector2.new(0,0)
G.UIGradient149.Parent = G.Purchase40

G.UIScale54 = Instance.new("UIScale")
G.UIScale54.Name = "UIScale"
G.UIScale54.Parent = G.Purchase40

G.UIStroke383 = Instance.new("UIStroke")
G.UIStroke383.Name = "UIStroke"
G.UIStroke383.Thickness = 1.1648
G.UIStroke383.Parent = G.Purchase40

G.Thumbnail64 = Instance.new("ImageLabel")
G.Thumbnail64.Name = "Thumbnail"
G.Thumbnail64.Size = UDim2.new(0.319652,0,0.833356,0)
G.Thumbnail64.Position = UDim2.new(0.115959,0,0.552785,0)
G.Thumbnail64.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail64.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail64.BackgroundTransparency = 1
G.Thumbnail64.BorderSizePixel = 0
G.Thumbnail64.Image = "rbxassetid://138328174344168"
G.Thumbnail64.ScaleType = Enum.ScaleType.Fit
G.Thumbnail64.ZIndex = 0
G.Thumbnail64.Parent = G.COM_5722338222113816999

G.Unavailable120 = Instance.new("TextLabel")
G.Unavailable120.Name = "Unavailable"
G.Unavailable120.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable120.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable120.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable120.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable120.BackgroundTransparency = 1
G.Unavailable120.BorderSizePixel = 0
G.Unavailable120.Text = "Unavailable"
G.Unavailable120.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable120.TextSize = 14
G.Unavailable120.Font = Enum.Font.FredokaOne
G.Unavailable120.TextWrapped = true
G.Unavailable120.TextScaled = true
G.Unavailable120.Visible = false
G.Unavailable120.Parent = G.Thumbnail64

G.UIStroke384 = Instance.new("UIStroke")
G.UIStroke384.Name = "UIStroke"
G.UIStroke384.Thickness = 2
G.UIStroke384.Parent = G.Unavailable120

G.Thumbnail65 = Instance.new("ImageLabel")
G.Thumbnail65.Name = "Thumbnail"
G.Thumbnail65.Size = UDim2.new(0.48234,0,1.2575,0)
G.Thumbnail65.Position = UDim2.new(0.592928,0,0.429842,0)
G.Thumbnail65.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail65.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail65.BackgroundTransparency = 1
G.Thumbnail65.BorderSizePixel = 0
G.Thumbnail65.Image = "rbxassetid://125974138687199"
G.Thumbnail65.ScaleType = Enum.ScaleType.Fit
G.Thumbnail65.ZIndex = -1
G.Thumbnail65.Parent = G.COM_5722338222113816999

G.Unavailable121 = Instance.new("TextLabel")
G.Unavailable121.Name = "Unavailable"
G.Unavailable121.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable121.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable121.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable121.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable121.BackgroundTransparency = 1
G.Unavailable121.BorderSizePixel = 0
G.Unavailable121.Text = "Unavailable"
G.Unavailable121.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable121.TextSize = 14
G.Unavailable121.Font = Enum.Font.FredokaOne
G.Unavailable121.TextWrapped = true
G.Unavailable121.TextScaled = true
G.Unavailable121.Visible = false
G.Unavailable121.Parent = G.Thumbnail65

G.UIStroke385 = Instance.new("UIStroke")
G.UIStroke385.Name = "UIStroke"
G.UIStroke385.Thickness = 2
G.UIStroke385.Parent = G.Unavailable121

G.Thumbnail66 = Instance.new("ImageLabel")
G.Thumbnail66.Name = "Thumbnail"
G.Thumbnail66.Size = UDim2.new(0.319652,0,0.833356,0)
G.Thumbnail66.Position = UDim2.new(0.370642,0,0.506057,0)
G.Thumbnail66.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail66.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail66.BackgroundTransparency = 1
G.Thumbnail66.BorderSizePixel = 0
G.Thumbnail66.Image = "rbxassetid://97526330807702"
G.Thumbnail66.ScaleType = Enum.ScaleType.Fit
G.Thumbnail66.ZIndex = 0
G.Thumbnail66.Parent = G.COM_5722338222113816999

G.Unavailable122 = Instance.new("TextLabel")
G.Unavailable122.Name = "Unavailable"
G.Unavailable122.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable122.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable122.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable122.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable122.BackgroundTransparency = 1
G.Unavailable122.BorderSizePixel = 0
G.Unavailable122.Text = "Unavailable"
G.Unavailable122.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable122.TextSize = 14
G.Unavailable122.Font = Enum.Font.FredokaOne
G.Unavailable122.TextWrapped = true
G.Unavailable122.TextScaled = true
G.Unavailable122.Visible = false
G.Unavailable122.Parent = G.Thumbnail66

G.UIStroke386 = Instance.new("UIStroke")
G.UIStroke386.Name = "UIStroke"
G.UIStroke386.Thickness = 2
G.UIStroke386.Parent = G.Unavailable122

G.Thumbnail67 = Instance.new("ImageLabel")
G.Thumbnail67.Name = "Thumbnail"
G.Thumbnail67.Size = UDim2.new(0.319652,0,0.833356,0)
G.Thumbnail67.Position = UDim2.new(0.182567,0,0.472669,0)
G.Thumbnail67.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail67.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail67.BackgroundTransparency = 1
G.Thumbnail67.BorderSizePixel = 0
G.Thumbnail67.Image = "rbxassetid://114427414365168"
G.Thumbnail67.ScaleType = Enum.ScaleType.Fit
G.Thumbnail67.ZIndex = -1
G.Thumbnail67.Parent = G.COM_5722338222113816999

G.Unavailable123 = Instance.new("TextLabel")
G.Unavailable123.Name = "Unavailable"
G.Unavailable123.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable123.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable123.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable123.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable123.BackgroundTransparency = 1
G.Unavailable123.BorderSizePixel = 0
G.Unavailable123.Text = "Unavailable"
G.Unavailable123.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable123.TextSize = 14
G.Unavailable123.Font = Enum.Font.FredokaOne
G.Unavailable123.TextWrapped = true
G.Unavailable123.TextScaled = true
G.Unavailable123.Visible = false
G.Unavailable123.Parent = G.Thumbnail67

G.UIStroke387 = Instance.new("UIStroke")
G.UIStroke387.Name = "UIStroke"
G.UIStroke387.Thickness = 2
G.UIStroke387.Parent = G.Unavailable123

G.Title40 = Instance.new("TextLabel")
G.Title40.Name = "Title"
G.Title40.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title40.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title40.AnchorPoint = Vector2.new(0.5,0)
G.Title40.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title40.BackgroundTransparency = 1
G.Title40.BorderSizePixel = 0
G.Title40.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title40.TextColor3 = Color3.fromRGB(0,13,76)
G.Title40.TextSize = 29
G.Title40.Font = Enum.Font.Arcade
G.Title40.TextWrapped = true
G.Title40.TextScaled = true
G.Title40.RichText = true
G.Title40.Visible = false
G.Title40.AutomaticSize = Enum.AutomaticSize.X
G.Title40.Parent = G.COM_5722338222113816999

G.UIGradient150 = Instance.new("UIGradient")
G.UIGradient150.Name = "UIGradient"
G.UIGradient150.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient150.Rotation = -90
G.UIGradient150.Offset = Vector2.new(0,0)
G.UIGradient150.Parent = G.Title40

G.UIStroke388 = Instance.new("UIStroke")
G.UIStroke388.Name = "UIStroke"
G.UIStroke388.Color = Color3.fromRGB(255,255,255)
G.UIStroke388.Thickness = 2
G.UIStroke388.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke388.Parent = G.Title40

G.UIListLayout23 = Instance.new("UIListLayout")
G.UIListLayout23.Name = "UIListLayout"
G.UIListLayout23.Padding = UDim.new(0.019,0)
G.UIListLayout23.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout23.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout23.Wraps = false
G.UIListLayout23.Parent = G.Special20

G.Special21 = Instance.new("Frame")
G.Special21.Name = "Special"
G.Special21.Size = UDim2.new(1.10498,0,0.439953,0)
G.Special21.Position = UDim2.new(0,0,-0.143337,0)
G.Special21.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special21.BackgroundTransparency = 1
G.Special21.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special21.BorderSizePixel = 0
G.Special21.LayoutOrder = -1
G.Special21.Parent = G.ScrollingFrame

G.COM_2774612072627700190 = Instance.new("Frame")
G.COM_2774612072627700190.Name = "COM-2774612072627700190"
G.COM_2774612072627700190.Size = UDim2.new(0.437886,0,0.931112,0)
G.COM_2774612072627700190.Position = UDim2.new(-2.68658e-08,0,0,0)
G.COM_2774612072627700190.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_2774612072627700190.BackgroundTransparency = 1
G.COM_2774612072627700190.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_2774612072627700190.BorderSizePixel = 0
G.COM_2774612072627700190.LayoutOrder = -1
G.COM_2774612072627700190.Parent = G.Special21

G.BG41 = Instance.new("Frame")
G.BG41.Name = "BG"
G.BG41.Size = UDim2.new(1,0,1,0)
G.BG41.Position = UDim2.new(0.5,0,0.5,0)
G.BG41.AnchorPoint = Vector2.new(0.5,0.5)
G.BG41.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG41.BackgroundTransparency = 1
G.BG41.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG41.BorderSizePixel = 0
G.BG41.ZIndex = -1
G.BG41.Parent = G.COM_2774612072627700190

G.Dropshadow40 = Instance.new("Frame")
G.Dropshadow40.Name = "Dropshadow"
G.Dropshadow40.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow40.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow40.AnchorPoint = Vector2.new(0,1)
G.Dropshadow40.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow40.BackgroundTransparency = 0.5
G.Dropshadow40.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow40.BorderSizePixel = 0
G.Dropshadow40.ZIndex = -2
G.Dropshadow40.Parent = G.BG41

G.UIStroke389 = Instance.new("UIStroke")
G.UIStroke389.Name = "UIStroke"
G.UIStroke389.Thickness = 2.79551
G.UIStroke389.Transparency = 1
G.UIStroke389.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke389.Parent = G.Dropshadow40

G.Frame41 = Instance.new("Frame")
G.Frame41.Name = "Frame"
G.Frame41.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame41.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame41.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame41.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame41.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame41.BorderSizePixel = 0
G.Frame41.ZIndex = -1
G.Frame41.Parent = G.BG41

G.Pattern35 = Instance.new("ImageLabel")
G.Pattern35.Name = "Pattern"
G.Pattern35.Size = UDim2.new(1,0,1,0)
G.Pattern35.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern35.BackgroundTransparency = 1
G.Pattern35.BorderSizePixel = 0
G.Pattern35.Image = "rbxassetid://132687197959308"
G.Pattern35.ZIndex = -1
G.Pattern35.Parent = G.Frame41

G.UIStroke390 = Instance.new("UIStroke")
G.UIStroke390.Name = "UIStroke"
G.UIStroke390.Thickness = 1.86368
G.UIStroke390.Parent = G.Pattern35

G.UIStroke391 = Instance.new("UIStroke")
G.UIStroke391.Name = "UIStroke"
G.UIStroke391.Thickness = 1.86368
G.UIStroke391.Parent = G.Frame41

G.Highlight34 = Instance.new("Frame")
G.Highlight34.Name = "Highlight"
G.Highlight34.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight34.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight34.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight34.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight34.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight34.BorderSizePixel = 0
G.Highlight34.Visible = false
G.Highlight34.ZIndex = -2
G.Highlight34.Parent = G.BG41

G.UIStroke392 = Instance.new("UIStroke")
G.UIStroke392.Name = "UIStroke"
G.UIStroke392.Color = Color3.fromRGB(255,242,0)
G.UIStroke392.Thickness = 2.79551
G.UIStroke392.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke392.Parent = G.Highlight34

G.DisplayTitle27 = Instance.new("TextLabel")
G.DisplayTitle27.Name = "DisplayTitle"
G.DisplayTitle27.Size = UDim2.new(0.566559,0,0.435422,0)
G.DisplayTitle27.Position = UDim2.new(0.65544,0,0.15042,0)
G.DisplayTitle27.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle27.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle27.BackgroundTransparency = 1
G.DisplayTitle27.BorderSizePixel = 0
G.DisplayTitle27.Text = "Astro 14\" Deluxe Plush (Pre-Order)"
G.DisplayTitle27.TextColor3 = Color3.fromRGB(0,13,76)
G.DisplayTitle27.TextSize = 29
G.DisplayTitle27.Font = Enum.Font.Arcade
G.DisplayTitle27.TextWrapped = true
G.DisplayTitle27.TextScaled = true
G.DisplayTitle27.RichText = true
G.DisplayTitle27.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle27.Parent = G.COM_2774612072627700190

G.UIGradient151 = Instance.new("UIGradient")
G.UIGradient151.Name = "UIGradient"
G.UIGradient151.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient151.Rotation = -90
G.UIGradient151.Offset = Vector2.new(0,0)
G.UIGradient151.Parent = G.DisplayTitle27

G.UIStroke393 = Instance.new("UIStroke")
G.UIStroke393.Name = "UIStroke"
G.UIStroke393.Color = Color3.fromRGB(255,255,255)
G.UIStroke393.Thickness = 0.931838
G.UIStroke393.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke393.Parent = G.DisplayTitle27

G.Item38 = Instance.new("ImageLabel")
G.Item38.Name = "Item"
G.Item38.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item38.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item38.AnchorPoint = Vector2.new(0.5,0.5)
G.Item38.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item38.BackgroundTransparency = 1
G.Item38.BorderSizePixel = 0
G.Item38.Image = "rbxassetid://94959635148921"
G.Item38.ImageRectOffset = Vector2.new(15,15)
G.Item38.ImageRectSize = Vector2.new(270,270)
G.Item38.ScaleType = Enum.ScaleType.Fit
G.Item38.Visible = false
G.Item38.ZIndex = -1
G.Item38.Parent = G.COM_2774612072627700190

G.Unavailable124 = Instance.new("TextLabel")
G.Unavailable124.Name = "Unavailable"
G.Unavailable124.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable124.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable124.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable124.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable124.BackgroundTransparency = 1
G.Unavailable124.BorderSizePixel = 0
G.Unavailable124.Text = "Unavailable"
G.Unavailable124.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable124.TextSize = 14
G.Unavailable124.Font = Enum.Font.FredokaOne
G.Unavailable124.TextWrapped = true
G.Unavailable124.TextScaled = true
G.Unavailable124.Visible = false
G.Unavailable124.Parent = G.Item38

G.UIStroke394 = Instance.new("UIStroke")
G.UIStroke394.Name = "UIStroke"
G.UIStroke394.Thickness = 2
G.UIStroke394.Parent = G.Unavailable124

G.New19 = Instance.new("ImageLabel")
G.New19.Name = "New"
G.New19.Size = UDim2.new(0.322123,0,0.355513,0)
G.New19.Position = UDim2.new(0.924293,0,0.0284983,0)
G.New19.AnchorPoint = Vector2.new(0.5,0.5)
G.New19.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New19.BackgroundTransparency = 1
G.New19.BorderSizePixel = 0
G.New19.Image = "rbxassetid://96728750855907"
G.New19.ScaleType = Enum.ScaleType.Fit
G.New19.Visible = false
G.New19.ZIndex = -1
G.New19.Parent = G.COM_2774612072627700190

G.UIScale55 = Instance.new("UIScale")
G.UIScale55.Name = "UIScale"
G.UIScale55.Parent = G.New19

G.Purchase41 = Instance.new("ImageButton")
G.Purchase41.Name = "Purchase"
G.Purchase41.Size = UDim2.new(0.551281,0,0.201102,0)
G.Purchase41.Position = UDim2.new(0.681037,0,0.790057,0)
G.Purchase41.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase41.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase41.BorderSizePixel = 0
G.Purchase41.ScaleType = Enum.ScaleType.Fit
G.Purchase41.AutoButtonColor = false
G.Purchase41.Parent = G.COM_2774612072627700190

G.Price41 = Instance.new("TextLabel")
G.Price41.Name = "Price"
G.Price41.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price41.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price41.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price41.BackgroundTransparency = 1
G.Price41.BorderSizePixel = 0
G.Price41.Text = "$19.99"
G.Price41.TextColor3 = Color3.fromRGB(255,255,255)
G.Price41.TextSize = 14
G.Price41.Font = Enum.Font.Arcade
G.Price41.TextWrapped = true
G.Price41.TextScaled = true
G.Price41.RichText = true
G.Price41.AutomaticSize = Enum.AutomaticSize.X
G.Price41.Parent = G.Purchase41

G.UIGradient152 = Instance.new("UIGradient")
G.UIGradient152.Name = "UIGradient"
G.UIGradient152.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient152.Rotation = -90
G.UIGradient152.Offset = Vector2.new(0,0)
G.UIGradient152.Parent = G.Price41

G.UIStroke395 = Instance.new("UIStroke")
G.UIStroke395.Name = "UIStroke"
G.UIStroke395.Thickness = 0.931838
G.UIStroke395.Parent = G.Price41

G.UICorner42 = Instance.new("UICorner")
G.UICorner42.Name = "UICorner"
G.UICorner42.CornerRadius = UDim.new(1,0)
G.UICorner42.Parent = G.Purchase41

G.UIGradient153 = Instance.new("UIGradient")
G.UIGradient153.Name = "UIGradient"
G.UIGradient153.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient153.Rotation = -90
G.UIGradient153.Offset = Vector2.new(0,0)
G.UIGradient153.Parent = G.Purchase41

G.UIScale56 = Instance.new("UIScale")
G.UIScale56.Name = "UIScale"
G.UIScale56.Parent = G.Purchase41

G.UIStroke396 = Instance.new("UIStroke")
G.UIStroke396.Name = "UIStroke"
G.UIStroke396.Thickness = 1.1648
G.UIStroke396.Parent = G.Purchase41

G.Thumbnail68 = Instance.new("ImageLabel")
G.Thumbnail68.Name = "Thumbnail"
G.Thumbnail68.Size = UDim2.new(0.593809,0,1.5481,0)
G.Thumbnail68.Position = UDim2.new(0.210077,0,0.432111,0)
G.Thumbnail68.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail68.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail68.BackgroundTransparency = 1
G.Thumbnail68.BorderSizePixel = 0
G.Thumbnail68.Image = "rbxassetid://134317376107046"
G.Thumbnail68.ScaleType = Enum.ScaleType.Fit
G.Thumbnail68.ZIndex = -1
G.Thumbnail68.Parent = G.COM_2774612072627700190

G.Unavailable125 = Instance.new("TextLabel")
G.Unavailable125.Name = "Unavailable"
G.Unavailable125.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable125.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable125.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable125.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable125.BackgroundTransparency = 1
G.Unavailable125.BorderSizePixel = 0
G.Unavailable125.Text = "Unavailable"
G.Unavailable125.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable125.TextSize = 14
G.Unavailable125.Font = Enum.Font.FredokaOne
G.Unavailable125.TextWrapped = true
G.Unavailable125.TextScaled = true
G.Unavailable125.Visible = false
G.Unavailable125.Parent = G.Thumbnail68

G.UIStroke397 = Instance.new("UIStroke")
G.UIStroke397.Name = "UIStroke"
G.UIStroke397.Thickness = 2
G.UIStroke397.Parent = G.Unavailable125

G.Title41 = Instance.new("TextLabel")
G.Title41.Name = "Title"
G.Title41.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title41.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title41.AnchorPoint = Vector2.new(0.5,0)
G.Title41.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title41.BackgroundTransparency = 1
G.Title41.BorderSizePixel = 0
G.Title41.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title41.TextColor3 = Color3.fromRGB(0,13,76)
G.Title41.TextSize = 29
G.Title41.Font = Enum.Font.Arcade
G.Title41.TextWrapped = true
G.Title41.TextScaled = true
G.Title41.RichText = true
G.Title41.Visible = false
G.Title41.AutomaticSize = Enum.AutomaticSize.X
G.Title41.Parent = G.COM_2774612072627700190

G.UIGradient154 = Instance.new("UIGradient")
G.UIGradient154.Name = "UIGradient"
G.UIGradient154.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient154.Rotation = -90
G.UIGradient154.Offset = Vector2.new(0,0)
G.UIGradient154.Parent = G.Title41

G.UIStroke398 = Instance.new("UIStroke")
G.UIStroke398.Name = "UIStroke"
G.UIStroke398.Color = Color3.fromRGB(255,255,255)
G.UIStroke398.Thickness = 2
G.UIStroke398.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke398.Parent = G.Title41

G.COM_57223382221138169992 = Instance.new("Frame")
G.COM_57223382221138169992.Name = "COM-5722338222113816999"
G.COM_57223382221138169992.Size = UDim2.new(0.437886,0,0.931112,0)
G.COM_57223382221138169992.Position = UDim2.new(-2.68658e-08,0,0,0)
G.COM_57223382221138169992.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_57223382221138169992.BackgroundTransparency = 1
G.COM_57223382221138169992.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_57223382221138169992.BorderSizePixel = 0
G.COM_57223382221138169992.Parent = G.Special21

G.BG42 = Instance.new("Frame")
G.BG42.Name = "BG"
G.BG42.Size = UDim2.new(1,0,1,0)
G.BG42.Position = UDim2.new(0.5,0,0.5,0)
G.BG42.AnchorPoint = Vector2.new(0.5,0.5)
G.BG42.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG42.BackgroundTransparency = 1
G.BG42.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG42.BorderSizePixel = 0
G.BG42.ZIndex = -1
G.BG42.Parent = G.COM_57223382221138169992

G.Dropshadow41 = Instance.new("Frame")
G.Dropshadow41.Name = "Dropshadow"
G.Dropshadow41.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow41.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow41.AnchorPoint = Vector2.new(0,1)
G.Dropshadow41.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow41.BackgroundTransparency = 0.5
G.Dropshadow41.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow41.BorderSizePixel = 0
G.Dropshadow41.ZIndex = -2
G.Dropshadow41.Parent = G.BG42

G.UIStroke399 = Instance.new("UIStroke")
G.UIStroke399.Name = "UIStroke"
G.UIStroke399.Thickness = 2.79551
G.UIStroke399.Transparency = 1
G.UIStroke399.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke399.Parent = G.Dropshadow41

G.Frame42 = Instance.new("Frame")
G.Frame42.Name = "Frame"
G.Frame42.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame42.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame42.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame42.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame42.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame42.BorderSizePixel = 0
G.Frame42.ZIndex = -1
G.Frame42.Parent = G.BG42

G.Pattern36 = Instance.new("ImageLabel")
G.Pattern36.Name = "Pattern"
G.Pattern36.Size = UDim2.new(1,0,1,0)
G.Pattern36.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern36.BackgroundTransparency = 1
G.Pattern36.BorderSizePixel = 0
G.Pattern36.Image = "rbxassetid://104066119238656"
G.Pattern36.ZIndex = -1
G.Pattern36.Parent = G.Frame42

G.UIStroke400 = Instance.new("UIStroke")
G.UIStroke400.Name = "UIStroke"
G.UIStroke400.Thickness = 1.86368
G.UIStroke400.Parent = G.Pattern36

G.UIStroke401 = Instance.new("UIStroke")
G.UIStroke401.Name = "UIStroke"
G.UIStroke401.Thickness = 1.86368
G.UIStroke401.Parent = G.Frame42

G.Highlight35 = Instance.new("Frame")
G.Highlight35.Name = "Highlight"
G.Highlight35.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight35.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight35.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight35.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight35.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight35.BorderSizePixel = 0
G.Highlight35.Visible = false
G.Highlight35.ZIndex = -2
G.Highlight35.Parent = G.BG42

G.UIStroke402 = Instance.new("UIStroke")
G.UIStroke402.Name = "UIStroke"
G.UIStroke402.Color = Color3.fromRGB(255,242,0)
G.UIStroke402.Thickness = 2.79551
G.UIStroke402.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke402.Parent = G.Highlight35

G.DisplayTitle28 = Instance.new("TextLabel")
G.DisplayTitle28.Name = "DisplayTitle"
G.DisplayTitle28.Size = UDim2.new(0.566559,0,0.435422,0)
G.DisplayTitle28.Position = UDim2.new(0.65544,0,0.15042,0)
G.DisplayTitle28.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle28.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle28.BackgroundTransparency = 1
G.DisplayTitle28.BorderSizePixel = 0
G.DisplayTitle28.Text = "Dandy 14\" Deluxe Plush (Pre-Order)"
G.DisplayTitle28.TextColor3 = Color3.fromRGB(0,13,76)
G.DisplayTitle28.TextSize = 29
G.DisplayTitle28.Font = Enum.Font.Arcade
G.DisplayTitle28.TextWrapped = true
G.DisplayTitle28.TextScaled = true
G.DisplayTitle28.RichText = true
G.DisplayTitle28.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle28.Parent = G.COM_57223382221138169992

G.UIGradient155 = Instance.new("UIGradient")
G.UIGradient155.Name = "UIGradient"
G.UIGradient155.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient155.Rotation = -90
G.UIGradient155.Offset = Vector2.new(0,0)
G.UIGradient155.Parent = G.DisplayTitle28

G.UIStroke403 = Instance.new("UIStroke")
G.UIStroke403.Name = "UIStroke"
G.UIStroke403.Color = Color3.fromRGB(255,255,255)
G.UIStroke403.Thickness = 0.931838
G.UIStroke403.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke403.Parent = G.DisplayTitle28

G.Item39 = Instance.new("ImageLabel")
G.Item39.Name = "Item"
G.Item39.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item39.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item39.AnchorPoint = Vector2.new(0.5,0.5)
G.Item39.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item39.BackgroundTransparency = 1
G.Item39.BorderSizePixel = 0
G.Item39.Image = "rbxassetid://94959635148921"
G.Item39.ImageRectOffset = Vector2.new(15,15)
G.Item39.ImageRectSize = Vector2.new(270,270)
G.Item39.ScaleType = Enum.ScaleType.Fit
G.Item39.Visible = false
G.Item39.ZIndex = -1
G.Item39.Parent = G.COM_57223382221138169992

G.Unavailable126 = Instance.new("TextLabel")
G.Unavailable126.Name = "Unavailable"
G.Unavailable126.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable126.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable126.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable126.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable126.BackgroundTransparency = 1
G.Unavailable126.BorderSizePixel = 0
G.Unavailable126.Text = "Unavailable"
G.Unavailable126.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable126.TextSize = 14
G.Unavailable126.Font = Enum.Font.FredokaOne
G.Unavailable126.TextWrapped = true
G.Unavailable126.TextScaled = true
G.Unavailable126.Visible = false
G.Unavailable126.Parent = G.Item39

G.UIStroke404 = Instance.new("UIStroke")
G.UIStroke404.Name = "UIStroke"
G.UIStroke404.Thickness = 2
G.UIStroke404.Parent = G.Unavailable126

G.Purchase42 = Instance.new("ImageButton")
G.Purchase42.Name = "Purchase"
G.Purchase42.Size = UDim2.new(0.551281,0,0.201102,0)
G.Purchase42.Position = UDim2.new(0.681037,0,0.790057,0)
G.Purchase42.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase42.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase42.BorderSizePixel = 0
G.Purchase42.ScaleType = Enum.ScaleType.Fit
G.Purchase42.AutoButtonColor = false
G.Purchase42.Parent = G.COM_57223382221138169992

G.Price42 = Instance.new("TextLabel")
G.Price42.Name = "Price"
G.Price42.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price42.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price42.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price42.BackgroundTransparency = 1
G.Price42.BorderSizePixel = 0
G.Price42.Text = "$19.99"
G.Price42.TextColor3 = Color3.fromRGB(255,255,255)
G.Price42.TextSize = 14
G.Price42.Font = Enum.Font.Arcade
G.Price42.TextWrapped = true
G.Price42.TextScaled = true
G.Price42.RichText = true
G.Price42.AutomaticSize = Enum.AutomaticSize.X
G.Price42.Parent = G.Purchase42

G.UIGradient156 = Instance.new("UIGradient")
G.UIGradient156.Name = "UIGradient"
G.UIGradient156.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient156.Rotation = -90
G.UIGradient156.Offset = Vector2.new(0,0)
G.UIGradient156.Parent = G.Price42

G.UIStroke405 = Instance.new("UIStroke")
G.UIStroke405.Name = "UIStroke"
G.UIStroke405.Thickness = 0.931838
G.UIStroke405.Parent = G.Price42

G.UICorner43 = Instance.new("UICorner")
G.UICorner43.Name = "UICorner"
G.UICorner43.CornerRadius = UDim.new(1,0)
G.UICorner43.Parent = G.Purchase42

G.UIGradient157 = Instance.new("UIGradient")
G.UIGradient157.Name = "UIGradient"
G.UIGradient157.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient157.Rotation = -90
G.UIGradient157.Offset = Vector2.new(0,0)
G.UIGradient157.Parent = G.Purchase42

G.UIScale57 = Instance.new("UIScale")
G.UIScale57.Name = "UIScale"
G.UIScale57.Parent = G.Purchase42

G.UIStroke406 = Instance.new("UIStroke")
G.UIStroke406.Name = "UIStroke"
G.UIStroke406.Thickness = 1.1648
G.UIStroke406.Parent = G.Purchase42

G.Thumbnail69 = Instance.new("ImageLabel")
G.Thumbnail69.Name = "Thumbnail"
G.Thumbnail69.Size = UDim2.new(0.593809,0,1.5481,0)
G.Thumbnail69.Position = UDim2.new(0.210077,0,0.432111,0)
G.Thumbnail69.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail69.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail69.BackgroundTransparency = 1
G.Thumbnail69.BorderSizePixel = 0
G.Thumbnail69.Image = "rbxassetid://125974138687199"
G.Thumbnail69.ScaleType = Enum.ScaleType.Fit
G.Thumbnail69.ZIndex = -1
G.Thumbnail69.Parent = G.COM_57223382221138169992

G.Unavailable127 = Instance.new("TextLabel")
G.Unavailable127.Name = "Unavailable"
G.Unavailable127.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable127.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable127.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable127.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable127.BackgroundTransparency = 1
G.Unavailable127.BorderSizePixel = 0
G.Unavailable127.Text = "Unavailable"
G.Unavailable127.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable127.TextSize = 14
G.Unavailable127.Font = Enum.Font.FredokaOne
G.Unavailable127.TextWrapped = true
G.Unavailable127.TextScaled = true
G.Unavailable127.Visible = false
G.Unavailable127.Parent = G.Thumbnail69

G.UIStroke407 = Instance.new("UIStroke")
G.UIStroke407.Name = "UIStroke"
G.UIStroke407.Thickness = 2
G.UIStroke407.Parent = G.Unavailable127

G.Title42 = Instance.new("TextLabel")
G.Title42.Name = "Title"
G.Title42.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title42.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title42.AnchorPoint = Vector2.new(0.5,0)
G.Title42.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title42.BackgroundTransparency = 1
G.Title42.BorderSizePixel = 0
G.Title42.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title42.TextColor3 = Color3.fromRGB(0,13,76)
G.Title42.TextSize = 29
G.Title42.Font = Enum.Font.Arcade
G.Title42.TextWrapped = true
G.Title42.TextScaled = true
G.Title42.RichText = true
G.Title42.Visible = false
G.Title42.AutomaticSize = Enum.AutomaticSize.X
G.Title42.Parent = G.COM_57223382221138169992

G.UIGradient158 = Instance.new("UIGradient")
G.UIGradient158.Name = "UIGradient"
G.UIGradient158.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient158.Rotation = -90
G.UIGradient158.Offset = Vector2.new(0,0)
G.UIGradient158.Parent = G.Title42

G.UIStroke408 = Instance.new("UIStroke")
G.UIStroke408.Name = "UIStroke"
G.UIStroke408.Color = Color3.fromRGB(255,255,255)
G.UIStroke408.Thickness = 2
G.UIStroke408.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke408.Parent = G.Title42

G.COM_85234255603766399462 = Instance.new("Frame")
G.COM_85234255603766399462.Name = "COM-8523425560376639946"
G.COM_85234255603766399462.Size = UDim2.new(0.437886,0,0.931112,0)
G.COM_85234255603766399462.Position = UDim2.new(-2.68658e-08,0,0,0)
G.COM_85234255603766399462.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_85234255603766399462.BackgroundTransparency = 1
G.COM_85234255603766399462.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_85234255603766399462.BorderSizePixel = 0
G.COM_85234255603766399462.Visible = false
G.COM_85234255603766399462.Parent = G.Special21

G.BG43 = Instance.new("Frame")
G.BG43.Name = "BG"
G.BG43.Size = UDim2.new(1,0,1,0)
G.BG43.Position = UDim2.new(0.5,0,0.5,0)
G.BG43.AnchorPoint = Vector2.new(0.5,0.5)
G.BG43.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG43.BackgroundTransparency = 1
G.BG43.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG43.BorderSizePixel = 0
G.BG43.ZIndex = -1
G.BG43.Parent = G.COM_85234255603766399462

G.Dropshadow42 = Instance.new("Frame")
G.Dropshadow42.Name = "Dropshadow"
G.Dropshadow42.Size = UDim2.new(0.940524,0,0.968522,0)
G.Dropshadow42.Position = UDim2.new(0,0,1.028,0)
G.Dropshadow42.AnchorPoint = Vector2.new(0,1)
G.Dropshadow42.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow42.BackgroundTransparency = 0.5
G.Dropshadow42.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow42.BorderSizePixel = 0
G.Dropshadow42.ZIndex = -2
G.Dropshadow42.Parent = G.BG43

G.UIStroke409 = Instance.new("UIStroke")
G.UIStroke409.Name = "UIStroke"
G.UIStroke409.Thickness = 2.79551
G.UIStroke409.Transparency = 1
G.UIStroke409.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke409.Parent = G.Dropshadow42

G.Frame43 = Instance.new("Frame")
G.Frame43.Name = "Frame"
G.Frame43.Size = UDim2.new(0.969681,0,0.95775,0)
G.Frame43.Position = UDim2.new(0.514096,0,0.478875,0)
G.Frame43.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame43.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Frame43.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame43.BorderSizePixel = 0
G.Frame43.ZIndex = -1
G.Frame43.Parent = G.BG43

G.Pattern37 = Instance.new("ImageLabel")
G.Pattern37.Name = "Pattern"
G.Pattern37.Size = UDim2.new(1,0,1,0)
G.Pattern37.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern37.BackgroundTransparency = 1
G.Pattern37.BorderSizePixel = 0
G.Pattern37.Image = "rbxassetid://98127658855696"
G.Pattern37.ZIndex = -1
G.Pattern37.Parent = G.Frame43

G.UIStroke410 = Instance.new("UIStroke")
G.UIStroke410.Name = "UIStroke"
G.UIStroke410.Thickness = 1.86368
G.UIStroke410.Parent = G.Pattern37

G.UIStroke411 = Instance.new("UIStroke")
G.UIStroke411.Name = "UIStroke"
G.UIStroke411.Thickness = 1.86368
G.UIStroke411.Parent = G.Frame43

G.Highlight36 = Instance.new("Frame")
G.Highlight36.Name = "Highlight"
G.Highlight36.Size = UDim2.new(0.970745,0,0.95775,0)
G.Highlight36.Position = UDim2.new(0.514628,0,0.478875,0)
G.Highlight36.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight36.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight36.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight36.BorderSizePixel = 0
G.Highlight36.Visible = false
G.Highlight36.ZIndex = -2
G.Highlight36.Parent = G.BG43

G.UIStroke412 = Instance.new("UIStroke")
G.UIStroke412.Name = "UIStroke"
G.UIStroke412.Color = Color3.fromRGB(255,242,0)
G.UIStroke412.Thickness = 2.79551
G.UIStroke412.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke412.Parent = G.Highlight36

G.DisplayTitle29 = Instance.new("TextLabel")
G.DisplayTitle29.Name = "DisplayTitle"
G.DisplayTitle29.Size = UDim2.new(0.566559,0,0.435422,0)
G.DisplayTitle29.Position = UDim2.new(0.65544,0,0.15042,0)
G.DisplayTitle29.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle29.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle29.BackgroundTransparency = 1
G.DisplayTitle29.BorderSizePixel = 0
G.DisplayTitle29.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.DisplayTitle29.TextColor3 = Color3.fromRGB(0,13,76)
G.DisplayTitle29.TextSize = 29
G.DisplayTitle29.Font = Enum.Font.Arcade
G.DisplayTitle29.TextWrapped = true
G.DisplayTitle29.TextScaled = true
G.DisplayTitle29.RichText = true
G.DisplayTitle29.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle29.Parent = G.COM_85234255603766399462

G.UIGradient159 = Instance.new("UIGradient")
G.UIGradient159.Name = "UIGradient"
G.UIGradient159.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient159.Rotation = -90
G.UIGradient159.Offset = Vector2.new(0,0)
G.UIGradient159.Parent = G.DisplayTitle29

G.UIStroke413 = Instance.new("UIStroke")
G.UIStroke413.Name = "UIStroke"
G.UIStroke413.Color = Color3.fromRGB(255,255,255)
G.UIStroke413.Thickness = 0.931838
G.UIStroke413.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke413.Parent = G.DisplayTitle29

G.Item40 = Instance.new("ImageLabel")
G.Item40.Name = "Item"
G.Item40.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item40.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item40.AnchorPoint = Vector2.new(0.5,0.5)
G.Item40.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item40.BackgroundTransparency = 1
G.Item40.BorderSizePixel = 0
G.Item40.Image = "rbxassetid://94959635148921"
G.Item40.ImageRectOffset = Vector2.new(15,15)
G.Item40.ImageRectSize = Vector2.new(270,270)
G.Item40.ScaleType = Enum.ScaleType.Fit
G.Item40.Visible = false
G.Item40.ZIndex = -1
G.Item40.Parent = G.COM_85234255603766399462

G.Unavailable128 = Instance.new("TextLabel")
G.Unavailable128.Name = "Unavailable"
G.Unavailable128.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable128.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable128.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable128.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable128.BackgroundTransparency = 1
G.Unavailable128.BorderSizePixel = 0
G.Unavailable128.Text = "Unavailable"
G.Unavailable128.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable128.TextSize = 14
G.Unavailable128.Font = Enum.Font.FredokaOne
G.Unavailable128.TextWrapped = true
G.Unavailable128.TextScaled = true
G.Unavailable128.Visible = false
G.Unavailable128.Parent = G.Item40

G.UIStroke414 = Instance.new("UIStroke")
G.UIStroke414.Name = "UIStroke"
G.UIStroke414.Thickness = 2
G.UIStroke414.Parent = G.Unavailable128

G.New20 = Instance.new("ImageLabel")
G.New20.Name = "New"
G.New20.Size = UDim2.new(0.322123,0,0.355513,0)
G.New20.Position = UDim2.new(0.924293,0,0.0284983,0)
G.New20.AnchorPoint = Vector2.new(0.5,0.5)
G.New20.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New20.BackgroundTransparency = 1
G.New20.BorderSizePixel = 0
G.New20.Image = "rbxassetid://96728750855907"
G.New20.ScaleType = Enum.ScaleType.Fit
G.New20.Visible = false
G.New20.ZIndex = -1
G.New20.Parent = G.COM_85234255603766399462

G.UIScale58 = Instance.new("UIScale")
G.UIScale58.Name = "UIScale"
G.UIScale58.Parent = G.New20

G.Purchase43 = Instance.new("ImageButton")
G.Purchase43.Name = "Purchase"
G.Purchase43.Size = UDim2.new(0.551281,0,0.201102,0)
G.Purchase43.Position = UDim2.new(0.681037,0,0.790057,0)
G.Purchase43.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase43.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase43.BorderSizePixel = 0
G.Purchase43.ScaleType = Enum.ScaleType.Fit
G.Purchase43.AutoButtonColor = false
G.Purchase43.Parent = G.COM_85234255603766399462

G.Price43 = Instance.new("TextLabel")
G.Price43.Name = "Price"
G.Price43.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price43.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price43.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price43.BackgroundTransparency = 1
G.Price43.BorderSizePixel = 0
G.Price43.Text = "$19.99"
G.Price43.TextColor3 = Color3.fromRGB(255,255,255)
G.Price43.TextSize = 14
G.Price43.Font = Enum.Font.Arcade
G.Price43.TextWrapped = true
G.Price43.TextScaled = true
G.Price43.RichText = true
G.Price43.AutomaticSize = Enum.AutomaticSize.X
G.Price43.Parent = G.Purchase43

G.UIGradient160 = Instance.new("UIGradient")
G.UIGradient160.Name = "UIGradient"
G.UIGradient160.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient160.Rotation = -90
G.UIGradient160.Offset = Vector2.new(0,0)
G.UIGradient160.Parent = G.Price43

G.UIStroke415 = Instance.new("UIStroke")
G.UIStroke415.Name = "UIStroke"
G.UIStroke415.Thickness = 0.931838
G.UIStroke415.Parent = G.Price43

G.UICorner44 = Instance.new("UICorner")
G.UICorner44.Name = "UICorner"
G.UICorner44.CornerRadius = UDim.new(1,0)
G.UICorner44.Parent = G.Purchase43

G.UIGradient161 = Instance.new("UIGradient")
G.UIGradient161.Name = "UIGradient"
G.UIGradient161.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient161.Rotation = -90
G.UIGradient161.Offset = Vector2.new(0,0)
G.UIGradient161.Parent = G.Purchase43

G.UIScale59 = Instance.new("UIScale")
G.UIScale59.Name = "UIScale"
G.UIScale59.Parent = G.Purchase43

G.UIStroke416 = Instance.new("UIStroke")
G.UIStroke416.Name = "UIStroke"
G.UIStroke416.Thickness = 1.1648
G.UIStroke416.Parent = G.Purchase43

G.Thumbnail70 = Instance.new("ImageLabel")
G.Thumbnail70.Name = "Thumbnail"
G.Thumbnail70.Size = UDim2.new(0.601206,0,1.5481,0)
G.Thumbnail70.Position = UDim2.new(0.216213,0,0.421328,0)
G.Thumbnail70.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail70.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail70.BackgroundTransparency = 1
G.Thumbnail70.BorderSizePixel = 0
G.Thumbnail70.Image = "rbxassetid://76700469052474"
G.Thumbnail70.ScaleType = Enum.ScaleType.Fit
G.Thumbnail70.ZIndex = -1
G.Thumbnail70.Parent = G.COM_85234255603766399462

G.Unavailable129 = Instance.new("TextLabel")
G.Unavailable129.Name = "Unavailable"
G.Unavailable129.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable129.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable129.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable129.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable129.BackgroundTransparency = 1
G.Unavailable129.BorderSizePixel = 0
G.Unavailable129.Text = "Unavailable"
G.Unavailable129.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable129.TextSize = 14
G.Unavailable129.Font = Enum.Font.FredokaOne
G.Unavailable129.TextWrapped = true
G.Unavailable129.TextScaled = true
G.Unavailable129.Visible = false
G.Unavailable129.Parent = G.Thumbnail70

G.UIStroke417 = Instance.new("UIStroke")
G.UIStroke417.Name = "UIStroke"
G.UIStroke417.Thickness = 2
G.UIStroke417.Parent = G.Unavailable129

G.Title43 = Instance.new("TextLabel")
G.Title43.Name = "Title"
G.Title43.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title43.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title43.AnchorPoint = Vector2.new(0.5,0)
G.Title43.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title43.BackgroundTransparency = 1
G.Title43.BorderSizePixel = 0
G.Title43.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title43.TextColor3 = Color3.fromRGB(0,13,76)
G.Title43.TextSize = 29
G.Title43.Font = Enum.Font.Arcade
G.Title43.TextWrapped = true
G.Title43.TextScaled = true
G.Title43.RichText = true
G.Title43.Visible = false
G.Title43.AutomaticSize = Enum.AutomaticSize.X
G.Title43.Parent = G.COM_85234255603766399462

G.UIGradient162 = Instance.new("UIGradient")
G.UIGradient162.Name = "UIGradient"
G.UIGradient162.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient162.Rotation = -90
G.UIGradient162.Offset = Vector2.new(0,0)
G.UIGradient162.Parent = G.Title43

G.UIStroke418 = Instance.new("UIStroke")
G.UIStroke418.Name = "UIStroke"
G.UIStroke418.Color = Color3.fromRGB(255,255,255)
G.UIStroke418.Thickness = 2
G.UIStroke418.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke418.Parent = G.Title43

G.UIListLayout24 = Instance.new("UIListLayout")
G.UIListLayout24.Name = "UIListLayout"
G.UIListLayout24.Padding = UDim.new(0.019,0)
G.UIListLayout24.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout24.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout24.Wraps = false
G.UIListLayout24.Parent = G.Special21

G.Special22 = Instance.new("Frame")
G.Special22.Name = "Special"
G.Special22.Size = UDim2.new(0.728177,0,0.493216,0)
G.Special22.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
G.Special22.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Special22.BackgroundTransparency = 1
G.Special22.BorderColor3 = Color3.fromRGB(0,0,0)
G.Special22.BorderSizePixel = 0
G.Special22.Parent = G.ScrollingFrame

G.COM_3368758568533361125 = Instance.new("Frame")
G.COM_3368758568533361125.Name = "COM-3368758568533361125"
G.COM_3368758568533361125.Size = UDim2.new(0.894198,0,0.931112,0)
G.COM_3368758568533361125.Position = UDim2.new(5.4771e-08,0,0,0)
G.COM_3368758568533361125.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_3368758568533361125.BackgroundTransparency = 1
G.COM_3368758568533361125.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_3368758568533361125.BorderSizePixel = 0
G.COM_3368758568533361125.ZIndex = 2
G.COM_3368758568533361125.Parent = G.Special22

G.BG44 = Instance.new("Frame")
G.BG44.Name = "BG"
G.BG44.Size = UDim2.new(1,0,1,0)
G.BG44.Position = UDim2.new(0.5,0,0.5,0)
G.BG44.AnchorPoint = Vector2.new(0.5,0.5)
G.BG44.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG44.BackgroundTransparency = 1
G.BG44.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG44.BorderSizePixel = 0
G.BG44.ZIndex = -1
G.BG44.Parent = G.COM_3368758568533361125

G.Dropshadow43 = Instance.new("Frame")
G.Dropshadow43.Name = "Dropshadow"
G.Dropshadow43.Size = UDim2.new(0.970515,0,0.968522,0)
G.Dropshadow43.Position = UDim2.new(1.29539e-07,0,1.028,0)
G.Dropshadow43.AnchorPoint = Vector2.new(0,1)
G.Dropshadow43.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow43.BackgroundTransparency = 0.5
G.Dropshadow43.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow43.BorderSizePixel = 0
G.Dropshadow43.ZIndex = -2
G.Dropshadow43.Parent = G.BG44

G.UIStroke419 = Instance.new("UIStroke")
G.UIStroke419.Name = "UIStroke"
G.UIStroke419.Thickness = 2.79551
G.UIStroke419.Transparency = 1
G.UIStroke419.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke419.Parent = G.Dropshadow43

G.Frame44 = Instance.new("Frame")
G.Frame44.Name = "Frame"
G.Frame44.Size = UDim2.new(0.984612,0,0.95775,0)
G.Frame44.Position = UDim2.new(0.506631,0,0.478875,0)
G.Frame44.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame44.BackgroundColor3 = Color3.fromRGB(3,148,13)
G.Frame44.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame44.BorderSizePixel = 0
G.Frame44.ZIndex = -1
G.Frame44.Parent = G.BG44

G.Pattern38 = Instance.new("ImageLabel")
G.Pattern38.Name = "Pattern"
G.Pattern38.Size = UDim2.new(1,0,1,0)
G.Pattern38.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern38.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern38.BackgroundTransparency = 1
G.Pattern38.BorderSizePixel = 0
G.Pattern38.Image = "rbxassetid://80642004017970"
G.Pattern38.ZIndex = -1
G.Pattern38.Parent = G.Frame44

G.UIStroke420 = Instance.new("UIStroke")
G.UIStroke420.Name = "UIStroke"
G.UIStroke420.Thickness = 1.86368
G.UIStroke420.Parent = G.Pattern38

G.Pattern39 = Instance.new("ImageLabel")
G.Pattern39.Name = "Pattern"
G.Pattern39.Size = UDim2.new(1,0,1,0)
G.Pattern39.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern39.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern39.BackgroundTransparency = 1
G.Pattern39.BorderSizePixel = 0
G.Pattern39.Image = "rbxassetid://80973209358665"
G.Pattern39.ImageColor3 = Color3.fromRGB(49,140,67)
G.Pattern39.ImageTransparency = 0.26
G.Pattern39.Visible = false
G.Pattern39.ZIndex = -1
G.Pattern39.Parent = G.Frame44

G.UIStroke421 = Instance.new("UIStroke")
G.UIStroke421.Name = "UIStroke"
G.UIStroke421.Thickness = 1.86368
G.UIStroke421.Parent = G.Pattern39

G.Pattern40 = Instance.new("ImageLabel")
G.Pattern40.Name = "Pattern"
G.Pattern40.Size = UDim2.new(1,0,1,0)
G.Pattern40.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern40.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern40.BackgroundTransparency = 1
G.Pattern40.BorderSizePixel = 0
G.Pattern40.Image = "rbxassetid://80973209358665"
G.Pattern40.ImageTransparency = 0.18
G.Pattern40.ZIndex = -1
G.Pattern40.Parent = G.Frame44

G.UIGradient163 = Instance.new("UIGradient")
G.UIGradient163.Name = "UIGradient"
G.UIGradient163.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient163.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
G.UIGradient163.Rotation = 90
G.UIGradient163.Offset = Vector2.new(0,0)
G.UIGradient163.Parent = G.Pattern40

G.UIStroke422 = Instance.new("UIStroke")
G.UIStroke422.Name = "UIStroke"
G.UIStroke422.Thickness = 1.86368
G.UIStroke422.Parent = G.Pattern40

G.UIGradient164 = Instance.new("UIGradient")
G.UIGradient164.Name = "UIGradient"
G.UIGradient164.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient164.Rotation = 90
G.UIGradient164.Offset = Vector2.new(0,0)
G.UIGradient164.Parent = G.Frame44

G.UIStroke423 = Instance.new("UIStroke")
G.UIStroke423.Name = "UIStroke"
G.UIStroke423.Thickness = 1.86368
G.UIStroke423.Parent = G.Frame44

G.Highlight37 = Instance.new("Frame")
G.Highlight37.Name = "Highlight"
G.Highlight37.Size = UDim2.new(0.985676,0,0.95775,0)
G.Highlight37.Position = UDim2.new(0.507162,0,0.478875,0)
G.Highlight37.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight37.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight37.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight37.BorderSizePixel = 0
G.Highlight37.Visible = false
G.Highlight37.ZIndex = -2
G.Highlight37.Parent = G.BG44

G.UIStroke424 = Instance.new("UIStroke")
G.UIStroke424.Name = "UIStroke"
G.UIStroke424.Color = Color3.fromRGB(255,242,0)
G.UIStroke424.Thickness = 2.79551
G.UIStroke424.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke424.Parent = G.Highlight37

G.CanvasGroup15 = Instance.new("CanvasGroup")
G.CanvasGroup15.Name = "CanvasGroup"
G.CanvasGroup15.Size = UDim2.new(1,0,1,0)
G.CanvasGroup15.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup15.BackgroundTransparency = 1
G.CanvasGroup15.Parent = G.COM_3368758568533361125

G.Thumbnail71 = Instance.new("ImageLabel")
G.Thumbnail71.Name = "Thumbnail"
G.Thumbnail71.Size = UDim2.new(0.293901,0,0.766222,0)
G.Thumbnail71.Position = UDim2.new(0.104398,0,0.514738,0)
G.Thumbnail71.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail71.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail71.BackgroundTransparency = 1
G.Thumbnail71.BorderSizePixel = 0
G.Thumbnail71.Image = "rbxassetid://79060220045867"
G.Thumbnail71.ScaleType = Enum.ScaleType.Fit
G.Thumbnail71.ZIndex = 0
G.Thumbnail71.Rotation = -11
G.Thumbnail71.Parent = G.CanvasGroup15

G.Unavailable130 = Instance.new("TextLabel")
G.Unavailable130.Name = "Unavailable"
G.Unavailable130.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable130.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable130.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable130.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable130.BackgroundTransparency = 1
G.Unavailable130.BorderSizePixel = 0
G.Unavailable130.Text = "Unavailable"
G.Unavailable130.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable130.TextSize = 14
G.Unavailable130.Font = Enum.Font.FredokaOne
G.Unavailable130.TextWrapped = true
G.Unavailable130.TextScaled = true
G.Unavailable130.Visible = false
G.Unavailable130.Parent = G.Thumbnail71

G.UIStroke425 = Instance.new("UIStroke")
G.UIStroke425.Name = "UIStroke"
G.UIStroke425.Thickness = 2
G.UIStroke425.Parent = G.Unavailable130

G.Thumbnail72 = Instance.new("ImageLabel")
G.Thumbnail72.Name = "Thumbnail"
G.Thumbnail72.Size = UDim2.new(0.293901,0,0.766222,0)
G.Thumbnail72.Position = UDim2.new(0.176374,0,0.449167,0)
G.Thumbnail72.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail72.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail72.BackgroundTransparency = 1
G.Thumbnail72.BorderSizePixel = 0
G.Thumbnail72.Image = "rbxassetid://108206963369578"
G.Thumbnail72.ScaleType = Enum.ScaleType.Fit
G.Thumbnail72.ZIndex = -1
G.Thumbnail72.Rotation = 5
G.Thumbnail72.Parent = G.CanvasGroup15

G.Unavailable131 = Instance.new("TextLabel")
G.Unavailable131.Name = "Unavailable"
G.Unavailable131.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable131.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable131.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable131.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable131.BackgroundTransparency = 1
G.Unavailable131.BorderSizePixel = 0
G.Unavailable131.Text = "Unavailable"
G.Unavailable131.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable131.TextSize = 14
G.Unavailable131.Font = Enum.Font.FredokaOne
G.Unavailable131.TextWrapped = true
G.Unavailable131.TextScaled = true
G.Unavailable131.Visible = false
G.Unavailable131.Parent = G.Thumbnail72

G.UIStroke426 = Instance.new("UIStroke")
G.UIStroke426.Name = "UIStroke"
G.UIStroke426.Thickness = 2
G.UIStroke426.Parent = G.Unavailable131

G.DisplayTitle30 = Instance.new("TextLabel")
G.DisplayTitle30.Name = "DisplayTitle"
G.DisplayTitle30.Size = UDim2.new(0.453471,0,0.351663,0)
G.DisplayTitle30.Position = UDim2.new(0.74378,0,0.235969,0)
G.DisplayTitle30.AnchorPoint = Vector2.new(0.5,0)
G.DisplayTitle30.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.DisplayTitle30.BackgroundTransparency = 1
G.DisplayTitle30.BorderSizePixel = 0
G.DisplayTitle30.Text = "Bobette 14\" Deluxe Plush (Pre-Order)"
G.DisplayTitle30.TextColor3 = Color3.fromRGB(2,40,0)
G.DisplayTitle30.TextSize = 29
G.DisplayTitle30.Font = Enum.Font.Arcade
G.DisplayTitle30.TextWrapped = true
G.DisplayTitle30.TextScaled = true
G.DisplayTitle30.RichText = true
G.DisplayTitle30.AutomaticSize = Enum.AutomaticSize.X
G.DisplayTitle30.Parent = G.COM_3368758568533361125

G.UIAspectRatioConstraint23 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint23.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint23.AspectRatio = 2.66
G.UIAspectRatioConstraint23.Parent = G.DisplayTitle30

G.UIGradient165 = Instance.new("UIGradient")
G.UIGradient165.Name = "UIGradient"
G.UIGradient165.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient165.Rotation = -90
G.UIGradient165.Offset = Vector2.new(0,0)
G.UIGradient165.Parent = G.DisplayTitle30

G.UIStroke427 = Instance.new("UIStroke")
G.UIStroke427.Name = "UIStroke"
G.UIStroke427.Color = Color3.fromRGB(255,255,255)
G.UIStroke427.Thickness = 0.931838
G.UIStroke427.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke427.Parent = G.DisplayTitle30

G.Item41 = Instance.new("ImageLabel")
G.Item41.Name = "Item"
G.Item41.Size = UDim2.new(0.913665,0,0.651761,0)
G.Item41.Position = UDim2.new(0.514096,0,0.463834,0)
G.Item41.AnchorPoint = Vector2.new(0.5,0.5)
G.Item41.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item41.BackgroundTransparency = 1
G.Item41.BorderSizePixel = 0
G.Item41.Image = "rbxassetid://94959635148921"
G.Item41.ImageRectOffset = Vector2.new(15,15)
G.Item41.ImageRectSize = Vector2.new(270,270)
G.Item41.ScaleType = Enum.ScaleType.Fit
G.Item41.Visible = false
G.Item41.ZIndex = -1
G.Item41.Parent = G.COM_3368758568533361125

G.Unavailable132 = Instance.new("TextLabel")
G.Unavailable132.Name = "Unavailable"
G.Unavailable132.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable132.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable132.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable132.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable132.BackgroundTransparency = 1
G.Unavailable132.BorderSizePixel = 0
G.Unavailable132.Text = "Unavailable"
G.Unavailable132.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable132.TextSize = 14
G.Unavailable132.Font = Enum.Font.FredokaOne
G.Unavailable132.TextWrapped = true
G.Unavailable132.TextScaled = true
G.Unavailable132.Visible = false
G.Unavailable132.Parent = G.Item41

G.UIStroke428 = Instance.new("UIStroke")
G.UIStroke428.Name = "UIStroke"
G.UIStroke428.Thickness = 2
G.UIStroke428.Parent = G.Unavailable132

G.New21 = Instance.new("ImageLabel")
G.New21.Name = "New"
G.New21.Size = UDim2.new(0.322123,0,0.355513,0)
G.New21.Position = UDim2.new(0.94212,0,0.0839209,0)
G.New21.AnchorPoint = Vector2.new(0.5,0.5)
G.New21.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.New21.BackgroundTransparency = 1
G.New21.BorderSizePixel = 0
G.New21.Image = "rbxassetid://96728750855907"
G.New21.ScaleType = Enum.ScaleType.Fit
G.New21.Visible = false
G.New21.ZIndex = -1
G.New21.Parent = G.COM_3368758568533361125

G.UIScale60 = Instance.new("UIScale")
G.UIScale60.Name = "UIScale"
G.UIScale60.Parent = G.New21

G.Purchase44 = Instance.new("ImageButton")
G.Purchase44.Name = "Purchase"
G.Purchase44.Size = UDim2.new(0.436835,0,0.172928,0)
G.Purchase44.Position = UDim2.new(0.752098,0,0.833662,0)
G.Purchase44.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase44.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase44.BorderSizePixel = 0
G.Purchase44.ScaleType = Enum.ScaleType.Fit
G.Purchase44.AutoButtonColor = false
G.Purchase44.Parent = G.COM_3368758568533361125

G.Price44 = Instance.new("TextLabel")
G.Price44.Name = "Price"
G.Price44.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price44.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price44.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price44.BackgroundTransparency = 1
G.Price44.BorderSizePixel = 0
G.Price44.Text = "$19.99"
G.Price44.TextColor3 = Color3.fromRGB(255,255,255)
G.Price44.TextSize = 14
G.Price44.Font = Enum.Font.Arcade
G.Price44.TextWrapped = true
G.Price44.TextScaled = true
G.Price44.RichText = true
G.Price44.AutomaticSize = Enum.AutomaticSize.X
G.Price44.Parent = G.Purchase44

G.UIGradient166 = Instance.new("UIGradient")
G.UIGradient166.Name = "UIGradient"
G.UIGradient166.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient166.Rotation = -90
G.UIGradient166.Offset = Vector2.new(0,0)
G.UIGradient166.Parent = G.Price44

G.UIStroke429 = Instance.new("UIStroke")
G.UIStroke429.Name = "UIStroke"
G.UIStroke429.Thickness = 0.931838
G.UIStroke429.Parent = G.Price44

G.UICorner45 = Instance.new("UICorner")
G.UICorner45.Name = "UICorner"
G.UICorner45.CornerRadius = UDim.new(1,0)
G.UICorner45.Parent = G.Purchase44

G.UIGradient167 = Instance.new("UIGradient")
G.UIGradient167.Name = "UIGradient"
G.UIGradient167.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient167.Rotation = -90
G.UIGradient167.Offset = Vector2.new(0,0)
G.UIGradient167.Parent = G.Purchase44

G.UIScale61 = Instance.new("UIScale")
G.UIScale61.Name = "UIScale"
G.UIScale61.Parent = G.Purchase44

G.UIStroke430 = Instance.new("UIStroke")
G.UIStroke430.Name = "UIStroke"
G.UIStroke430.Thickness = 1.1648
G.UIStroke430.Parent = G.Purchase44

G.Thumbnail73 = Instance.new("ImageLabel")
G.Thumbnail73.Name = "Thumbnail"
G.Thumbnail73.Size = UDim2.new(0.48234,0,1.2575,0)
G.Thumbnail73.Position = UDim2.new(0.365108,0,0.447015,0)
G.Thumbnail73.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail73.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail73.BackgroundTransparency = 1
G.Thumbnail73.BorderSizePixel = 0
G.Thumbnail73.Image = "rbxassetid://129329475909328"
G.Thumbnail73.ScaleType = Enum.ScaleType.Fit
G.Thumbnail73.ZIndex = 2
G.Thumbnail73.Parent = G.COM_3368758568533361125

G.Unavailable133 = Instance.new("TextLabel")
G.Unavailable133.Name = "Unavailable"
G.Unavailable133.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable133.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable133.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable133.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable133.BackgroundTransparency = 1
G.Unavailable133.BorderSizePixel = 0
G.Unavailable133.Text = "Unavailable"
G.Unavailable133.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable133.TextSize = 14
G.Unavailable133.Font = Enum.Font.FredokaOne
G.Unavailable133.TextWrapped = true
G.Unavailable133.TextScaled = true
G.Unavailable133.Visible = false
G.Unavailable133.Parent = G.Thumbnail73

G.UIStroke431 = Instance.new("UIStroke")
G.UIStroke431.Name = "UIStroke"
G.UIStroke431.Thickness = 2
G.UIStroke431.Parent = G.Unavailable133

G.Title44 = Instance.new("TextLabel")
G.Title44.Name = "Title"
G.Title44.Size = UDim2.new(0.566559,0,0.435422,0)
G.Title44.Position = UDim2.new(0.65544,0,0.15042,0)
G.Title44.AnchorPoint = Vector2.new(0.5,0)
G.Title44.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title44.BackgroundTransparency = 1
G.Title44.BorderSizePixel = 0
G.Title44.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
G.Title44.TextColor3 = Color3.fromRGB(0,13,76)
G.Title44.TextSize = 29
G.Title44.Font = Enum.Font.Arcade
G.Title44.TextWrapped = true
G.Title44.TextScaled = true
G.Title44.RichText = true
G.Title44.Visible = false
G.Title44.AutomaticSize = Enum.AutomaticSize.X
G.Title44.Parent = G.COM_3368758568533361125

G.UIGradient168 = Instance.new("UIGradient")
G.UIGradient168.Name = "UIGradient"
G.UIGradient168.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient168.Rotation = -90
G.UIGradient168.Offset = Vector2.new(0,0)
G.UIGradient168.Parent = G.Title44

G.UIStroke432 = Instance.new("UIStroke")
G.UIStroke432.Name = "UIStroke"
G.UIStroke432.Color = Color3.fromRGB(255,255,255)
G.UIStroke432.Thickness = 2
G.UIStroke432.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke432.Parent = G.Title44

G.COM_8147980808737259949 = Instance.new("Frame")
G.COM_8147980808737259949.Name = "COM-8147980808737259949"
G.COM_8147980808737259949.Size = UDim2.new(0.442523,0,0.944677,0)
G.COM_8147980808737259949.Position = UDim2.new(0.913307,0,0,0)
G.COM_8147980808737259949.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.COM_8147980808737259949.BackgroundTransparency = 1
G.COM_8147980808737259949.BorderColor3 = Color3.fromRGB(0,0,0)
G.COM_8147980808737259949.BorderSizePixel = 0
G.COM_8147980808737259949.Parent = G.Special22

G.BG45 = Instance.new("Frame")
G.BG45.Name = "BG"
G.BG45.Size = UDim2.new(1,0,1,0)
G.BG45.Position = UDim2.new(0.5,0,0.5,0)
G.BG45.AnchorPoint = Vector2.new(0.5,0.5)
G.BG45.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.BG45.BackgroundTransparency = 1
G.BG45.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG45.BorderSizePixel = 0
G.BG45.ZIndex = -1
G.BG45.Parent = G.COM_8147980808737259949

G.Dropshadow44 = Instance.new("Frame")
G.Dropshadow44.Name = "Dropshadow"
G.Dropshadow44.Size = UDim2.new(0.947997,0,0.95376,0)
G.Dropshadow44.Position = UDim2.new(-0.00747363,0,1.01324,0)
G.Dropshadow44.AnchorPoint = Vector2.new(0,1)
G.Dropshadow44.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow44.BackgroundTransparency = 0.5
G.Dropshadow44.BorderColor3 = Color3.fromRGB(0,0,0)
G.Dropshadow44.BorderSizePixel = 0
G.Dropshadow44.ZIndex = -2
G.Dropshadow44.Parent = G.BG45

G.UIStroke433 = Instance.new("UIStroke")
G.UIStroke433.Name = "UIStroke"
G.UIStroke433.Thickness = 2.79551
G.UIStroke433.Transparency = 1
G.UIStroke433.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke433.Parent = G.Dropshadow44

G.Frame45 = Instance.new("Frame")
G.Frame45.Name = "Frame"
G.Frame45.Size = UDim2.new(0.95775,0,0.95775,0)
G.Frame45.Position = UDim2.new(0.521125,0,0.478875,0)
G.Frame45.AnchorPoint = Vector2.new(0.5,0.5)
G.Frame45.BackgroundColor3 = Color3.fromRGB(3,148,13)
G.Frame45.BorderColor3 = Color3.fromRGB(0,0,0)
G.Frame45.BorderSizePixel = 0
G.Frame45.ZIndex = -1
G.Frame45.Parent = G.BG45

G.Pattern41 = Instance.new("ImageLabel")
G.Pattern41.Name = "Pattern"
G.Pattern41.Size = UDim2.new(1,0,1,0)
G.Pattern41.Position = UDim2.new(0,0,-1.402e-07,0)
G.Pattern41.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Pattern41.BackgroundTransparency = 1
G.Pattern41.BorderSizePixel = 0
G.Pattern41.Image = "rbxassetid://80973209358665"
G.Pattern41.ScaleType = Enum.ScaleType.Crop
G.Pattern41.ZIndex = -1
G.Pattern41.Parent = G.Frame45

G.UIGradient169 = Instance.new("UIGradient")
G.UIGradient169.Name = "UIGradient"
G.UIGradient169.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient169.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
G.UIGradient169.Rotation = 90
G.UIGradient169.Offset = Vector2.new(0,0)
G.UIGradient169.Parent = G.Pattern41

G.UIStroke434 = Instance.new("UIStroke")
G.UIStroke434.Name = "UIStroke"
G.UIStroke434.Thickness = 1.86368
G.UIStroke434.Parent = G.Pattern41

G.UIGradient170 = Instance.new("UIGradient")
G.UIGradient170.Name = "UIGradient"
G.UIGradient170.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
G.UIGradient170.Rotation = 90
G.UIGradient170.Offset = Vector2.new(0,0)
G.UIGradient170.Parent = G.Frame45

G.UIStroke435 = Instance.new("UIStroke")
G.UIStroke435.Name = "UIStroke"
G.UIStroke435.Thickness = 4
G.UIStroke435.Parent = G.Frame45

G.Highlight38 = Instance.new("Frame")
G.Highlight38.Name = "Highlight"
G.Highlight38.Size = UDim2.new(0.954203,0,0.95775,0)
G.Highlight38.Position = UDim2.new(0.519351,0,0.478875,0)
G.Highlight38.AnchorPoint = Vector2.new(0.5,0.5)
G.Highlight38.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Highlight38.BorderColor3 = Color3.fromRGB(0,0,0)
G.Highlight38.BorderSizePixel = 0
G.Highlight38.Visible = false
G.Highlight38.ZIndex = -2
G.Highlight38.Parent = G.BG45

G.UIStroke436 = Instance.new("UIStroke")
G.UIStroke436.Name = "UIStroke"
G.UIStroke436.Color = Color3.fromRGB(255,242,0)
G.UIStroke436.Thickness = 2.79551
G.UIStroke436.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke436.Parent = G.Highlight38

G.Item42 = Instance.new("ImageLabel")
G.Item42.Name = "Item"
G.Item42.Size = UDim2.new(0.902423,0,0.651761,0)
G.Item42.Position = UDim2.new(0.521125,0,0.463834,0)
G.Item42.AnchorPoint = Vector2.new(0.5,0.5)
G.Item42.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item42.BackgroundTransparency = 1
G.Item42.BorderSizePixel = 0
G.Item42.Image = "rbxassetid://94959635148921"
G.Item42.ImageRectOffset = Vector2.new(25,25)
G.Item42.ImageRectSize = Vector2.new(250,250)
G.Item42.ScaleType = Enum.ScaleType.Crop
G.Item42.Visible = false
G.Item42.ZIndex = -1
G.Item42.Parent = G.COM_8147980808737259949

G.Unavailable134 = Instance.new("TextLabel")
G.Unavailable134.Name = "Unavailable"
G.Unavailable134.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable134.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable134.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable134.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable134.BackgroundTransparency = 1
G.Unavailable134.BorderSizePixel = 0
G.Unavailable134.Text = "Unavailable"
G.Unavailable134.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable134.TextSize = 14
G.Unavailable134.Font = Enum.Font.FredokaOne
G.Unavailable134.TextWrapped = true
G.Unavailable134.TextScaled = true
G.Unavailable134.Visible = false
G.Unavailable134.Parent = G.Item42

G.UIStroke437 = Instance.new("UIStroke")
G.UIStroke437.Name = "UIStroke"
G.UIStroke437.Thickness = 2
G.UIStroke437.Parent = G.Unavailable134

G.Pixel17 = Instance.new("ImageLabel")
G.Pixel17.Name = "Pixel"
G.Pixel17.Size = UDim2.new(0.650425,0,0.469759,0)
G.Pixel17.Position = UDim2.new(0.395126,0,0.554835,0)
G.Pixel17.AnchorPoint = Vector2.new(0.5,0.5)
G.Pixel17.BackgroundColor3 = Color3.fromRGB(255,2,2)
G.Pixel17.BorderSizePixel = 0
G.Pixel17.Image = "rbxassetid://94959635148921"
G.Pixel17.ImageRectOffset = Vector2.new(55,100)
G.Pixel17.ImageRectSize = Vector2.new(30,30)
G.Pixel17.ScaleType = Enum.ScaleType.Crop
G.Pixel17.Visible = false
G.Pixel17.ZIndex = 5
G.Pixel17.Parent = G.COM_8147980808737259949

G.Unavailable135 = Instance.new("TextLabel")
G.Unavailable135.Name = "Unavailable"
G.Unavailable135.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable135.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable135.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable135.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable135.BackgroundTransparency = 1
G.Unavailable135.BorderSizePixel = 0
G.Unavailable135.Text = "Unavailable"
G.Unavailable135.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable135.TextSize = 14
G.Unavailable135.Font = Enum.Font.FredokaOne
G.Unavailable135.TextWrapped = true
G.Unavailable135.TextScaled = true
G.Unavailable135.Visible = false
G.Unavailable135.Parent = G.Pixel17

G.UIStroke438 = Instance.new("UIStroke")
G.UIStroke438.Name = "UIStroke"
G.UIStroke438.Thickness = 2
G.UIStroke438.Parent = G.Unavailable135

G.Purchase45 = Instance.new("ImageButton")
G.Purchase45.Name = "Purchase"
G.Purchase45.Size = UDim2.new(0.863319,0,0.170445,0)
G.Purchase45.Position = UDim2.new(0.514166,0,0.821691,0)
G.Purchase45.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase45.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Purchase45.BorderSizePixel = 0
G.Purchase45.ScaleType = Enum.ScaleType.Fit
G.Purchase45.AutoButtonColor = false
G.Purchase45.ZIndex = 6
G.Purchase45.Parent = G.COM_8147980808737259949

G.Price45 = Instance.new("TextLabel")
G.Price45.Name = "Price"
G.Price45.Size = UDim2.new(0.78479,0,0.702682,0)
G.Price45.Position = UDim2.new(0.100663,0,0.0990811,0)
G.Price45.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price45.BackgroundTransparency = 1
G.Price45.BorderSizePixel = 0
G.Price45.Text = "$19.99"
G.Price45.TextColor3 = Color3.fromRGB(255,255,255)
G.Price45.TextSize = 14
G.Price45.Font = Enum.Font.Arcade
G.Price45.TextWrapped = true
G.Price45.TextScaled = true
G.Price45.RichText = true
G.Price45.AutomaticSize = Enum.AutomaticSize.X
G.Price45.Parent = G.Purchase45

G.UIGradient171 = Instance.new("UIGradient")
G.UIGradient171.Name = "UIGradient"
G.UIGradient171.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
G.UIGradient171.Rotation = -90
G.UIGradient171.Offset = Vector2.new(0,0)
G.UIGradient171.Parent = G.Price45

G.UIStroke439 = Instance.new("UIStroke")
G.UIStroke439.Name = "UIStroke"
G.UIStroke439.Thickness = 2
G.UIStroke439.Parent = G.Price45

G.UICorner46 = Instance.new("UICorner")
G.UICorner46.Name = "UICorner"
G.UICorner46.CornerRadius = UDim.new(1,0)
G.UICorner46.Parent = G.Purchase45

G.UIGradient172 = Instance.new("UIGradient")
G.UIGradient172.Name = "UIGradient"
G.UIGradient172.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
G.UIGradient172.Rotation = -90
G.UIGradient172.Offset = Vector2.new(0,0)
G.UIGradient172.Parent = G.Purchase45

G.UIScale62 = Instance.new("UIScale")
G.UIScale62.Name = "UIScale"
G.UIScale62.Parent = G.Purchase45

G.UIStroke440 = Instance.new("UIStroke")
G.UIStroke440.Name = "UIStroke"
G.UIStroke440.Thickness = 2.5
G.UIStroke440.Parent = G.Purchase45

G.Thumbnail74 = Instance.new("ImageLabel")
G.Thumbnail74.Name = "Thumbnail"
G.Thumbnail74.Size = UDim2.new(1.03177,0,0.875373,0)
G.Thumbnail74.Position = UDim2.new(0.511832,0,0.372283,0)
G.Thumbnail74.AnchorPoint = Vector2.new(0.5,0.5)
G.Thumbnail74.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Thumbnail74.BackgroundTransparency = 1
G.Thumbnail74.BorderSizePixel = 0
G.Thumbnail74.Image = "rbxassetid://126209362584779"
G.Thumbnail74.ScaleType = Enum.ScaleType.Fit
G.Thumbnail74.ZIndex = -1
G.Thumbnail74.Parent = G.COM_8147980808737259949

G.Unavailable136 = Instance.new("TextLabel")
G.Unavailable136.Name = "Unavailable"
G.Unavailable136.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable136.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable136.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable136.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable136.BackgroundTransparency = 1
G.Unavailable136.BorderSizePixel = 0
G.Unavailable136.Text = "Unavailable"
G.Unavailable136.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable136.TextSize = 14
G.Unavailable136.Font = Enum.Font.FredokaOne
G.Unavailable136.TextWrapped = true
G.Unavailable136.TextScaled = true
G.Unavailable136.Visible = false
G.Unavailable136.Parent = G.Thumbnail74

G.UIStroke441 = Instance.new("UIStroke")
G.UIStroke441.Name = "UIStroke"
G.UIStroke441.Thickness = 2
G.UIStroke441.Parent = G.Unavailable136

G.Title45 = Instance.new("TextLabel")
G.Title45.Name = "Title"
G.Title45.Size = UDim2.new(0.874784,0,0.149,0)
G.Title45.Position = UDim2.new(0.531264,0,0.0306123,0)
G.Title45.AnchorPoint = Vector2.new(0.5,0)
G.Title45.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title45.BackgroundTransparency = 1
G.Title45.BorderSizePixel = 0
G.Title45.Text = "Bobette 11" x 14" Poster"
G.Title45.TextColor3 = Color3.fromRGB(0,0,0)
G.Title45.TextSize = 29
G.Title45.Font = Enum.Font.Arcade
G.Title45.TextXAlignment = Enum.TextXAlignment.Left
G.Title45.TextYAlignment = Enum.TextYAlignment.Top
G.Title45.TextWrapped = true
G.Title45.TextScaled = true
G.Title45.RichText = true
G.Title45.Visible = false
G.Title45.AutomaticSize = Enum.AutomaticSize.X
G.Title45.Parent = G.COM_8147980808737259949

G.UITextSizeConstraint20 = Instance.new("UITextSizeConstraint")
G.UITextSizeConstraint20.Name = "UITextSizeConstraint"
G.UITextSizeConstraint20.MaxTextSize = 29
G.UITextSizeConstraint20.Parent = G.Title45

G.UIListLayout25 = Instance.new("UIListLayout")
G.UIListLayout25.Name = "UIListLayout"
G.UIListLayout25.Padding = UDim.new(0.019,0)
G.UIListLayout25.FillDirection = Enum.FillDirection.Horizontal
G.UIListLayout25.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout25.Wraps = false
G.UIListLayout25.Parent = G.Special22

G.UIListLayout26 = Instance.new("UIListLayout")
G.UIListLayout26.Name = "UIListLayout"
G.UIListLayout26.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout26.Wraps = false
G.UIListLayout26.Parent = G.ScrollingFrame

G.Template1 = Instance.new("Frame")
G.Template1.Name = "Template1"
G.Template1.Size = UDim2.new(0.326044,0,0.954072,0)
G.Template1.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.Template1.BackgroundTransparency = 1
G.Template1.BorderColor3 = Color3.fromRGB(0,0,0)
G.Template1.BorderSizePixel = 0
G.Template1.Visible = false
G.Template1.Parent = G.UIListLayout26

G.BG46 = Instance.new("Frame")
G.BG46.Name = "BG"
G.BG46.Size = UDim2.new(1.03302,0,1.05281,0)
G.BG46.Position = UDim2.new(0.5,0,0.490778,0)
G.BG46.AnchorPoint = Vector2.new(0.5,0.5)
G.BG46.BackgroundColor3 = Color3.fromRGB(7,7,7)
G.BG46.BackgroundTransparency = 1
G.BG46.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG46.BorderSizePixel = 0
G.BG46.ZIndex = -1
G.BG46.Parent = G.Template1

G.Background4 = Instance.new("ImageLabel")
G.Background4.Name = "Background"
G.Background4.Size = UDim2.new(1,0,1,0)
G.Background4.Position = UDim2.new(0.5,0,0.5,0)
G.Background4.AnchorPoint = Vector2.new(0.5,0.5)
G.Background4.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Background4.BackgroundTransparency = 1
G.Background4.BorderSizePixel = 0
G.Background4.Image = "rbxassetid://91674148062510"
G.Background4.ScaleType = Enum.ScaleType.Fit
G.Background4.ZIndex = 0
G.Background4.Parent = G.BG46

G.Style2 = Instance.new("ImageLabel")
G.Style2.Name = "Style"
G.Style2.Size = UDim2.new(1,0,1,0)
G.Style2.Position = UDim2.new(0.5,0,0.5,0)
G.Style2.AnchorPoint = Vector2.new(0.5,0.5)
G.Style2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Style2.BackgroundTransparency = 1
G.Style2.BorderSizePixel = 0
G.Style2.Image = "rbxassetid://121124169704314"
G.Style2.ScaleType = Enum.ScaleType.Fit
G.Style2.ZIndex = 0
G.Style2.Parent = G.BG46

G.Item43 = Instance.new("ImageLabel")
G.Item43.Name = "Item"
G.Item43.Size = UDim2.new(0.884324,0,0.503534,0)
G.Item43.Position = UDim2.new(0.5,0,0.462408,0)
G.Item43.AnchorPoint = Vector2.new(0.5,0.5)
G.Item43.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item43.BackgroundTransparency = 1
G.Item43.BorderSizePixel = 0
G.Item43.Image = "rbxassetid://2735820382"
G.Item43.ScaleType = Enum.ScaleType.Fit
G.Item43.Parent = G.Template1

G.UIAspectRatioConstraint24 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint24.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint24.Parent = G.Item43

G.Unavailable137 = Instance.new("TextLabel")
G.Unavailable137.Name = "Unavailable"
G.Unavailable137.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable137.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable137.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable137.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable137.BackgroundTransparency = 1
G.Unavailable137.BorderSizePixel = 0
G.Unavailable137.Text = "Unavailable"
G.Unavailable137.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable137.TextSize = 14
G.Unavailable137.Font = Enum.Font.FredokaOne
G.Unavailable137.TextWrapped = true
G.Unavailable137.TextScaled = true
G.Unavailable137.Visible = false
G.Unavailable137.Parent = G.Item43

G.UIStroke442 = Instance.new("UIStroke")
G.UIStroke442.Name = "UIStroke"
G.UIStroke442.Thickness = 2
G.UIStroke442.Parent = G.Unavailable137

G.Purchase46 = Instance.new("ImageButton")
G.Purchase46.Name = "Purchase"
G.Purchase46.Size = UDim2.new(0.70159,0,0.133162,0)
G.Purchase46.Position = UDim2.new(0.5,0,0.818573,0)
G.Purchase46.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase46.BackgroundColor3 = Color3.fromRGB(102,213,117)
G.Purchase46.BackgroundTransparency = 1
G.Purchase46.BorderSizePixel = 0
G.Purchase46.Image = "rbxassetid://83503830393339"
G.Purchase46.ScaleType = Enum.ScaleType.Fit
G.Purchase46.AutoButtonColor = false
G.Purchase46.Active = false
G.Purchase46.Parent = G.Template1

G.Price46 = Instance.new("TextLabel")
G.Price46.Name = "Price"
G.Price46.Size = UDim2.new(0.78479,0,0.603976,0)
G.Price46.Position = UDim2.new(0.100663,0,0.190473,0)
G.Price46.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price46.BackgroundTransparency = 1
G.Price46.BorderSizePixel = 0
G.Price46.Text = "$19.99"
G.Price46.TextColor3 = Color3.fromRGB(255,255,255)
G.Price46.TextSize = 14
G.Price46.Font = Enum.Font.FredokaOne
G.Price46.TextWrapped = true
G.Price46.TextScaled = true
G.Price46.RichText = true
G.Price46.AutomaticSize = Enum.AutomaticSize.X
G.Price46.Parent = G.Purchase46

G.UIStroke443 = Instance.new("UIStroke")
G.UIStroke443.Name = "UIStroke"
G.UIStroke443.Thickness = 4
G.UIStroke443.Parent = G.Price46

G.UIAspectRatioConstraint25 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint25.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint25.AspectRatio = 3
G.UIAspectRatioConstraint25.Parent = G.Purchase46

G.Title46 = Instance.new("TextLabel")
G.Title46.Name = "Title"
G.Title46.Size = UDim2.new(0.691791,0,0.0883971,0)
G.Title46.Position = UDim2.new(0.5,0,0.0572088,0)
G.Title46.AnchorPoint = Vector2.new(0.5,0)
G.Title46.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title46.BackgroundTransparency = 1
G.Title46.BorderSizePixel = 0
G.Title46.Text = "Dandy Plush"
G.Title46.TextColor3 = Color3.fromRGB(255,255,255)
G.Title46.TextSize = 14
G.Title46.Font = Enum.Font.FredokaOne
G.Title46.TextWrapped = true
G.Title46.TextScaled = true
G.Title46.RichText = true
G.Title46.AutomaticSize = Enum.AutomaticSize.X
G.Title46.Parent = G.Template1

G.UIStroke444 = Instance.new("UIStroke")
G.UIStroke444.Name = "UIStroke"
G.UIStroke444.Thickness = 4
G.UIStroke444.Parent = G.Title46

G.Template22 = Instance.new("Frame")
G.Template22.Name = "Template2"
G.Template22.Size = UDim2.new(0.326044,0,0.954072,0)
G.Template22.BackgroundColor3 = Color3.fromRGB(255,225,0)
G.Template22.BackgroundTransparency = 1
G.Template22.BorderColor3 = Color3.fromRGB(0,0,0)
G.Template22.BorderSizePixel = 0
G.Template22.Visible = false
G.Template22.LayoutOrder = 2
G.Template22.Parent = G.UIListLayout26

G.BG47 = Instance.new("Frame")
G.BG47.Name = "BG"
G.BG47.Size = UDim2.new(1.03302,0,1.05281,0)
G.BG47.Position = UDim2.new(0.5,0,0.490778,0)
G.BG47.AnchorPoint = Vector2.new(0.5,0.5)
G.BG47.BackgroundColor3 = Color3.fromRGB(7,7,7)
G.BG47.BackgroundTransparency = 1
G.BG47.BorderColor3 = Color3.fromRGB(0,0,0)
G.BG47.BorderSizePixel = 0
G.BG47.ZIndex = -1
G.BG47.Parent = G.Template22

G.Background5 = Instance.new("ImageLabel")
G.Background5.Name = "Background"
G.Background5.Size = UDim2.new(1,0,1,0)
G.Background5.Position = UDim2.new(0.5,0,0.5,0)
G.Background5.AnchorPoint = Vector2.new(0.5,0.5)
G.Background5.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Background5.BackgroundTransparency = 1
G.Background5.BorderSizePixel = 0
G.Background5.Image = "rbxassetid://91674148062510"
G.Background5.ScaleType = Enum.ScaleType.Fit
G.Background5.ZIndex = 0
G.Background5.Parent = G.BG47

G.Style3 = Instance.new("ImageLabel")
G.Style3.Name = "Style"
G.Style3.Size = UDim2.new(1,0,1,0)
G.Style3.Position = UDim2.new(0.5,0,0.5,0)
G.Style3.AnchorPoint = Vector2.new(0.5,0.5)
G.Style3.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Style3.BackgroundTransparency = 1
G.Style3.BorderSizePixel = 0
G.Style3.Image = "rbxassetid://108226130234733"
G.Style3.ScaleType = Enum.ScaleType.Fit
G.Style3.ZIndex = 0
G.Style3.Parent = G.BG47

G.Item44 = Instance.new("ImageLabel")
G.Item44.Name = "Item"
G.Item44.Size = UDim2.new(0.884324,0,0.503534,0)
G.Item44.Position = UDim2.new(0.5,0,0.462408,0)
G.Item44.AnchorPoint = Vector2.new(0.5,0.5)
G.Item44.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Item44.BackgroundTransparency = 1
G.Item44.BorderSizePixel = 0
G.Item44.Image = "rbxassetid://2735820382"
G.Item44.ScaleType = Enum.ScaleType.Fit
G.Item44.Parent = G.Template22

G.UIAspectRatioConstraint26 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint26.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint26.Parent = G.Item44

G.Unavailable138 = Instance.new("TextLabel")
G.Unavailable138.Name = "Unavailable"
G.Unavailable138.Size = UDim2.new(0.7,0,0.7,0)
G.Unavailable138.Position = UDim2.new(0.5,0,0.5,0)
G.Unavailable138.AnchorPoint = Vector2.new(0.5,0.5)
G.Unavailable138.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Unavailable138.BackgroundTransparency = 1
G.Unavailable138.BorderSizePixel = 0
G.Unavailable138.Text = "Unavailable"
G.Unavailable138.TextColor3 = Color3.fromRGB(255,255,255)
G.Unavailable138.TextSize = 14
G.Unavailable138.Font = Enum.Font.FredokaOne
G.Unavailable138.TextWrapped = true
G.Unavailable138.TextScaled = true
G.Unavailable138.Visible = false
G.Unavailable138.Parent = G.Item44

G.UIStroke445 = Instance.new("UIStroke")
G.UIStroke445.Name = "UIStroke"
G.UIStroke445.Thickness = 2
G.UIStroke445.Parent = G.Unavailable138

G.Purchase47 = Instance.new("ImageButton")
G.Purchase47.Name = "Purchase"
G.Purchase47.Size = UDim2.new(0.70159,0,0.133162,0)
G.Purchase47.Position = UDim2.new(0.5,0,0.818573,0)
G.Purchase47.AnchorPoint = Vector2.new(0.5,0.5)
G.Purchase47.BackgroundColor3 = Color3.fromRGB(102,213,117)
G.Purchase47.BackgroundTransparency = 1
G.Purchase47.BorderSizePixel = 0
G.Purchase47.Image = "rbxassetid://83503830393339"
G.Purchase47.ScaleType = Enum.ScaleType.Fit
G.Purchase47.Parent = G.Template22

G.Price47 = Instance.new("TextLabel")
G.Price47.Name = "Price"
G.Price47.Size = UDim2.new(0.78479,0,0.603976,0)
G.Price47.Position = UDim2.new(0.100663,0,0.190473,0)
G.Price47.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Price47.BackgroundTransparency = 1
G.Price47.BorderSizePixel = 0
G.Price47.Text = "$19.99"
G.Price47.TextColor3 = Color3.fromRGB(255,255,255)
G.Price47.TextSize = 14
G.Price47.Font = Enum.Font.FredokaOne
G.Price47.TextWrapped = true
G.Price47.TextScaled = true
G.Price47.RichText = true
G.Price47.AutomaticSize = Enum.AutomaticSize.X
G.Price47.Parent = G.Purchase47

G.UIStroke446 = Instance.new("UIStroke")
G.UIStroke446.Name = "UIStroke"
G.UIStroke446.Thickness = 4
G.UIStroke446.Parent = G.Price47

G.UIAspectRatioConstraint27 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint27.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint27.AspectRatio = 3
G.UIAspectRatioConstraint27.Parent = G.Purchase47

G.Title47 = Instance.new("TextLabel")
G.Title47.Name = "Title"
G.Title47.Size = UDim2.new(0.691791,0,0.0883971,0)
G.Title47.Position = UDim2.new(0.5,0,0.0572088,0)
G.Title47.AnchorPoint = Vector2.new(0.5,0)
G.Title47.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title47.BackgroundTransparency = 1
G.Title47.BorderSizePixel = 0
G.Title47.Text = "Dandy Plush"
G.Title47.TextColor3 = Color3.fromRGB(255,255,255)
G.Title47.TextSize = 14
G.Title47.Font = Enum.Font.FredokaOne
G.Title47.TextWrapped = true
G.Title47.TextScaled = true
G.Title47.RichText = true
G.Title47.AutomaticSize = Enum.AutomaticSize.X
G.Title47.Parent = G.Template22

G.UIStroke447 = Instance.new("UIStroke")
G.UIStroke447.Name = "UIStroke"
G.UIStroke447.Thickness = 4
G.UIStroke447.Parent = G.Title47

G.Title48 = Instance.new("TextLabel")
G.Title48.Name = "Title"
G.Title48.Size = UDim2.new(0.602898,0,0.0681394,0)
G.Title48.Position = UDim2.new(0.446511,0,0.0153459,0)
G.Title48.AnchorPoint = Vector2.new(0.5,0)
G.Title48.BackgroundColor3 = Color3.fromRGB(255,33,103)
G.Title48.BackgroundTransparency = 1
G.Title48.BorderSizePixel = 0
G.Title48.Text = "Official Merch!!!"
G.Title48.TextColor3 = Color3.fromRGB(255,255,255)
G.Title48.TextSize = 29
G.Title48.Font = Enum.Font.Arcade
G.Title48.TextXAlignment = Enum.TextXAlignment.Left
G.Title48.TextYAlignment = Enum.TextYAlignment.Top
G.Title48.TextWrapped = true
G.Title48.TextScaled = true
G.Title48.RichText = true
G.Title48.AutomaticSize = Enum.AutomaticSize.X
G.Title48.Parent = G.ShopifyFrame

G.UIGradient173 = Instance.new("UIGradient")
G.UIGradient173.Name = "UIGradient"
G.UIGradient173.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.0967185,Color3.fromRGB(235,235,235)),ColorSequenceKeypoint.new(0.416235,Color3.fromRGB(241,241,241)),ColorSequenceKeypoint.new(1,Color3.fromRGB(53,53,53))})
G.UIGradient173.Rotation = 90
G.UIGradient173.Offset = Vector2.new(0,0)
G.UIGradient173.Parent = G.Title48

G.UIStroke448 = Instance.new("UIStroke")
G.UIStroke448.Name = "UIStroke"
G.UIStroke448.Thickness = 0.931838
G.UIStroke448.LineJoinMode = Enum.LineJoinMode.Miter
G.UIStroke448.Parent = G.Title48

G.UIAspectRatioConstraint28 = Instance.new("UIAspectRatioConstraint")
G.UIAspectRatioConstraint28.Name = "UIAspectRatioConstraint"
G.UIAspectRatioConstraint28.AspectRatio = 1.55
G.UIAspectRatioConstraint28.Parent = G.ShopifyFrame

G.UIScale63 = Instance.new("UIScale")
G.UIScale63.Name = "UIScale"
G.UIScale63.Parent = G.ShopifyFrame

G.UISizeConstraint = Instance.new("UISizeConstraint")
G.UISizeConstraint.Name = "UISizeConstraint"
G.UISizeConstraint.MinSize = Vector2.new(500,300)
G.UISizeConstraint.Parent = G.ShopifyFrame

G.Bottom = Instance.new("Frame")
G.Bottom.Name = "Bottom"
G.Bottom.Size = UDim2.new(1,0,1,0)
G.Bottom.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Bottom.BackgroundTransparency = 1
G.Bottom.BorderColor3 = Color3.fromRGB(0,0,0)
G.Bottom.BorderSizePixel = 0
G.Bottom.LayoutOrder = 10
G.Bottom.Parent = G.ShopifyFrame

G.CanvasGroup16 = Instance.new("CanvasGroup")
G.CanvasGroup16.Name = "CanvasGroup"
G.CanvasGroup16.Size = UDim2.new(0.438,0,0.127,0)
G.CanvasGroup16.Position = UDim2.new(0.4,0,0.797,0)
G.CanvasGroup16.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.CanvasGroup16.BackgroundTransparency = 1
G.CanvasGroup16.Visible = false
G.CanvasGroup16.Parent = G.Bottom

G.DialogueBox = Instance.new("TextLabel")
G.DialogueBox.Name = "DialogueBox"
G.DialogueBox.Size = UDim2.new(0.925,0,0.525,0)
G.DialogueBox.Position = UDim2.new(0.5,0,0.5,0)
G.DialogueBox.AnchorPoint = Vector2.new(0.5,0.5)
G.DialogueBox.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.DialogueBox.BackgroundTransparency = 1
G.DialogueBox.BorderSizePixel = 0
G.DialogueBox.Text = "This would be the perfect time for a commercial!"
G.DialogueBox.TextColor3 = Color3.fromRGB(255,255,255)
G.DialogueBox.TextSize = 100
G.DialogueBox.Font = Enum.Font.Arcade
G.DialogueBox.TextWrapped = true
G.DialogueBox.TextScaled = true
G.DialogueBox.TextStrokeTransparency = 0
G.DialogueBox.ZIndex = 10
G.DialogueBox.Parent = G.CanvasGroup16

G.SpeechBubble = Instance.new("Frame")
G.SpeechBubble.Name = "SpeechBubble"
G.SpeechBubble.Size = UDim2.new(0.975,0,0.55,0)
G.SpeechBubble.Position = UDim2.new(0.5,0,0.5,0)
G.SpeechBubble.AnchorPoint = Vector2.new(0.5,0.5)
G.SpeechBubble.BackgroundColor3 = Color3.fromRGB(151,255,160)
G.SpeechBubble.BorderColor3 = Color3.fromRGB(0,0,0)
G.SpeechBubble.BorderSizePixel = 0
G.SpeechBubble.ZIndex = 2
G.SpeechBubble.Parent = G.CanvasGroup16

G.ImageLabel2 = Instance.new("ImageLabel")
G.ImageLabel2.Name = "ImageLabel"
G.ImageLabel2.Size = UDim2.new(1,0,1,0)
G.ImageLabel2.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.ImageLabel2.BackgroundTransparency = 1
G.ImageLabel2.BorderSizePixel = 0
G.ImageLabel2.Image = "rbxassetid://6794283750"
G.ImageLabel2.ImageTransparency = 0.95
G.ImageLabel2.ScaleType = Enum.ScaleType.Tile
G.ImageLabel2.ZIndex = 3
G.ImageLabel2.Parent = G.SpeechBubble

G.UICorner47 = Instance.new("UICorner")
G.UICorner47.Name = "UICorner"
G.UICorner47.CornerRadius = UDim.new(0.1,0)
G.UICorner47.Parent = G.SpeechBubble

G.UIGradient174 = Instance.new("UIGradient")
G.UIGradient174.Name = "UIGradient"
G.UIGradient174.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(109,109,109))})
G.UIGradient174.Rotation = 90
G.UIGradient174.Offset = Vector2.new(0,0)
G.UIGradient174.Parent = G.SpeechBubble

G.SpeechBubbleBG = Instance.new("Frame")
G.SpeechBubbleBG.Name = "SpeechBubbleBG"
G.SpeechBubbleBG.Size = UDim2.new(1,0,0.6,0)
G.SpeechBubbleBG.Position = UDim2.new(0.5,0,0.5,0)
G.SpeechBubbleBG.AnchorPoint = Vector2.new(0.5,0.5)
G.SpeechBubbleBG.BackgroundColor3 = Color3.fromRGB(0,0,0)
G.SpeechBubbleBG.BorderColor3 = Color3.fromRGB(0,0,0)
G.SpeechBubbleBG.BorderSizePixel = 0
G.SpeechBubbleBG.Parent = G.CanvasGroup16

G.UICorner48 = Instance.new("UICorner")
G.UICorner48.Name = "UICorner"
G.UICorner48.CornerRadius = UDim.new(0.1,0)
G.UICorner48.Parent = G.SpeechBubbleBG

G.UIGradient175 = Instance.new("UIGradient")
G.UIGradient175.Name = "UIGradient"
G.UIGradient175.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8,0),NumberSequenceKeypoint.new(1,0.8,0)})
G.UIGradient175.Offset = Vector2.new(0,0)
G.UIGradient175.Parent = G.CanvasGroup16

G.Web = Instance.new("ImageLabel")
G.Web.Name = "Web"
G.Web.Size = UDim2.new(0.463033,0,0.352901,0)
G.Web.Position = UDim2.new(2.88541e-08,0,0.627239,0)
G.Web.BackgroundColor3 = Color3.fromRGB(255,255,255)
G.Web.BackgroundTransparency = 1
G.Web.BorderSizePixel = 0
G.Web.Image = "rbxassetid://70769444307862"
G.Web.ImageColor3 = Color3.fromRGB(125,125,125)
G.Web.ImageTransparency = 1
G.Web.ScaleType = Enum.ScaleType.Fit
G.Web.Parent = G.Bottom

local screen = Instance.new("ScreenGui")
screen.Name = "ShopifyFrame_Test"
screen.ResetOnSpawn = false
screen.IgnoreGuiInset = true
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screen.DisplayOrder = 100
screen.Parent = PlayerGui

G.ShopifyFrame.Visible = true
G.ShopifyFrame.Parent = screen

-- Make the close button work in the standalone test GUI.
G.ExitButton.Activated:Connect(function()
    screen:Destroy()
end)

-- Keep the frame above other PlayerGui elements.
G.ShopifyFrame.ZIndex = 2

print("[ShopifyFrame Test] Loaded - GUI should be visible")
return G.ShopifyFrame
