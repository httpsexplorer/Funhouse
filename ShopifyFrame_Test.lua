-- TEST RUNNER: stolen ShopifyFrame (visible)
-- Run in executor to verify the steal looks correct
-- Close: destroy PlayerGui.ShopifyFrame_Test

-- Stolen: Players.Milkyy_xoyz.PlayerGui.MainGui.ShopifyFrame
-- Class: Frame
-- Pink's Steal GUI

local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local ShopifyFrame = Instance.new("Frame")
ShopifyFrame.Name = "ShopifyFrame"
ShopifyFrame.Size = UDim2.new(0.599122,0,0.717493,0)
ShopifyFrame.Position = UDim2.new(0.499889,0,0.497089,0)
ShopifyFrame.AnchorPoint = Vector2.new(0.5,0.5)
ShopifyFrame.BackgroundColor3 = Color3.fromRGB(121,0,0)
ShopifyFrame.BackgroundTransparency = 1
ShopifyFrame.BorderColor3 = Color3.fromRGB(0,0,0)
ShopifyFrame.BorderSizePixel = 0
ShopifyFrame.Visible = true
ShopifyFrame.ZIndex = 2
ShopifyFrame:SetAttribute("Allowed", false)

local Background = Instance.new("ImageLabel")
Background.Name = "Background"
Background.Size = UDim2.new(0.923953,0,1.00135,0)
Background.Position = UDim2.new(0.0407381,0,0.00302815,0)
Background.BackgroundColor3 = Color3.fromRGB(255,255,255)
Background.BackgroundTransparency = 1
Background.BorderSizePixel = 0
Background.Image = "rbxassetid://71234472219611"
Background.ImageColor3 = Color3.fromRGB(144,144,144)
Background.ScaleType = Enum.ScaleType.Fit
Background.ZIndex = 0
Background.Parent = ShopifyFrame

local ExitButton = Instance.new("ImageButton")
ExitButton.Name = "ExitButton"
ExitButton.Size = UDim2.new(0.2,0,0.079,0)
ExitButton.Position = UDim2.new(0.888,0,0.054,0)
ExitButton.AnchorPoint = Vector2.new(0.5,0.5)
ExitButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
ExitButton.BackgroundTransparency = 1
ExitButton.BorderSizePixel = 0
ExitButton.Image = "rbxassetid://77109511791509"
ExitButton:SetAttribute("OriginalSize", UDim2.new(0.2,0,0.079,0))
ExitButton.Parent = ShopifyFrame

local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint.Parent = ExitButton

local UIScale = Instance.new("UIScale")
UIScale.Name = "UIScale"
UIScale.Parent = ExitButton

local Filter = Instance.new("ImageLabel")
Filter.Name = "Filter"
Filter.Size = UDim2.new(0.873047,0,0.98303,0)
Filter.Position = UDim2.new(0.0689526,0,0.00302816,0)
Filter.BackgroundColor3 = Color3.fromRGB(255,255,255)
Filter.BackgroundTransparency = 1
Filter.BorderSizePixel = 0
Filter.ImageColor3 = Color3.fromRGB(150,150,150)
Filter.ImageTransparency = 0.61
Filter.ScaleType = Enum.ScaleType.Fit
Filter.ZIndex = 15
Filter.Parent = ShopifyFrame

local Old = Instance.new("ImageLabel")
Old.Name = "Old"
Old.Size = UDim2.new(1,0,1,0)
Old.Position = UDim2.new(0.5,0,-0.120825,0)
Old.AnchorPoint = Vector2.new(0.5,0)
Old.BackgroundColor3 = Color3.fromRGB(255,255,255)
Old.BackgroundTransparency = 1
Old.BorderSizePixel = 0
Old.Image = "rbxassetid://96018322960874"
Old.ImageColor3 = Color3.fromRGB(150,150,150)
Old.ImageTransparency = 0.88
Old.ZIndex = 15
Old.Parent = Filter

local UIGradient = Instance.new("UIGradient")
UIGradient.Name = "UIGradient"
UIGradient.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.42508,0,0),NumberSequenceKeypoint.new(0.509033,1,0),NumberSequenceKeypoint.new(0.616366,0,0),NumberSequenceKeypoint.new(1,0,0)})
UIGradient.Rotation = 90
UIGradient.Offset = Vector2.new(0,0)
UIGradient.Enabled = false
UIGradient.Parent = Old

local UIScale2 = Instance.new("UIScale")
UIScale2.Name = "UIScale"
UIScale2.Scale = 1.00614
UIScale2.Parent = Old

local Frame = Instance.new("Frame")
Frame.Name = "Frame"
Frame.Size = UDim2.new(1,0,1,0)
Frame.Position = UDim2.new(0.5,0,0.5,0)
Frame.AnchorPoint = Vector2.new(0.5,0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255,0,0)
Frame.BorderColor3 = Color3.fromRGB(0,0,0)
Frame.BorderSizePixel = 0
Frame.Visible = false
Frame.ZIndex = 2
Frame.Parent = ShopifyFrame

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "ImageLabel"
ImageLabel.Size = UDim2.new(1,0,1,0)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255,255,255)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderSizePixel = 0
ImageLabel.Image = "rbxassetid://6794283750"
ImageLabel.ImageTransparency = 0.98
ImageLabel.ScaleType = Enum.ScaleType.Tile
ImageLabel.Parent = Frame

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = Frame

local UIGradient2 = Instance.new("UIGradient")
UIGradient2.Name = "UIGradient"
UIGradient2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(140,140,140)),ColorSequenceKeypoint.new(1,Color3.fromRGB(81,81,81))})
UIGradient2.Rotation = 90
UIGradient2.Offset = Vector2.new(0,0)
UIGradient2.Parent = Frame

local FrameBG = Instance.new("Frame")
FrameBG.Name = "FrameBG"
FrameBG.Size = UDim2.new(1.03071,0,1.05721,0)
FrameBG.Position = UDim2.new(0.5,0,0.5,0)
FrameBG.AnchorPoint = Vector2.new(0.5,0.5)
FrameBG.BackgroundColor3 = Color3.fromRGB(0,0,0)
FrameBG.BorderColor3 = Color3.fromRGB(0,0,0)
FrameBG.BorderSizePixel = 0
FrameBG.Visible = false
FrameBG.Parent = ShopifyFrame

local UICorner2 = Instance.new("UICorner")
UICorner2.Name = "UICorner"
UICorner2.Parent = FrameBG

local HoverWindow = Instance.new("Frame")
HoverWindow.Name = "HoverWindow"
HoverWindow.Size = UDim2.new(0.333,0,0.7,0)
HoverWindow.Position = UDim2.new(0,0,0.5,0)
HoverWindow.AnchorPoint = Vector2.new(0.5,0.5)
HoverWindow.BackgroundColor3 = Color3.fromRGB(255,225,0)
HoverWindow.BackgroundTransparency = 1
HoverWindow.BorderColor3 = Color3.fromRGB(0,0,0)
HoverWindow.BorderSizePixel = 0
HoverWindow.ZIndex = 15
HoverWindow.Parent = ShopifyFrame

local BG = Instance.new("Frame")
BG.Name = "BG"
BG.Size = UDim2.new(1.03302,0,1.05281,0)
BG.Position = UDim2.new(0.5,0,0.490778,0)
BG.AnchorPoint = Vector2.new(0.5,0.5)
BG.BackgroundColor3 = Color3.fromRGB(7,7,7)
BG.BackgroundTransparency = 1
BG.BorderColor3 = Color3.fromRGB(0,0,0)
BG.BorderSizePixel = 0
BG.ZIndex = -1
BG.Parent = HoverWindow

local Background2 = Instance.new("ImageLabel")
Background2.Name = "Background"
Background2.Size = UDim2.new(1,0,1,0)
Background2.Position = UDim2.new(0.5,0,0.5,0)
Background2.AnchorPoint = Vector2.new(0.5,0.5)
Background2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Background2.BackgroundTransparency = 1
Background2.BorderSizePixel = 0
Background2.Image = "rbxassetid://91674148062510"
Background2.ScaleType = Enum.ScaleType.Fit
Background2.ZIndex = 0
Background2.Parent = BG

local Style = Instance.new("ImageLabel")
Style.Name = "Style"
Style.Size = UDim2.new(1,0,1,0)
Style.Position = UDim2.new(0.5,0,0.5,0)
Style.AnchorPoint = Vector2.new(0.5,0.5)
Style.BackgroundColor3 = Color3.fromRGB(255,255,255)
Style.BackgroundTransparency = 1
Style.BorderSizePixel = 0
Style.Image = "rbxassetid://121124169704314"
Style.ScaleType = Enum.ScaleType.Fit
Style.ZIndex = 0
Style.Parent = BG

local Item = Instance.new("ImageButton")
Item.Name = "Item"
Item.Size = UDim2.new(1,0,1,0)
Item.Position = UDim2.new(0.5,0,0.45,0)
Item.AnchorPoint = Vector2.new(0.5,0.5)
Item.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item.BackgroundTransparency = 1
Item.BorderSizePixel = 0
Item.Image = "rbxassetid://2735820382"
Item.ScaleType = Enum.ScaleType.Fit
Item.Parent = HoverWindow

local UIAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint2.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint2.Parent = Item

local Unavailable = Instance.new("TextLabel")
Unavailable.Name = "Unavailable"
Unavailable.Size = UDim2.new(0.7,0,0.7,0)
Unavailable.Position = UDim2.new(0.5,0,0.5,0)
Unavailable.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable.BackgroundTransparency = 1
Unavailable.BorderSizePixel = 0
Unavailable.Text = "Unavailable"
Unavailable.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable.TextSize = 14
Unavailable.Font = Enum.Font.FredokaOne
Unavailable.TextWrapped = true
Unavailable.TextScaled = true
Unavailable.Visible = false
Unavailable.Parent = Item

local UIStroke = Instance.new("UIStroke")
UIStroke.Name = "UIStroke"
UIStroke.Thickness = 2
UIStroke.Parent = Unavailable

local PageDots = Instance.new("Frame")
PageDots.Name = "PageDots"
PageDots.Size = UDim2.new(0.7,0,0.075,0)
PageDots.Position = UDim2.new(0.5,0,0.8,0)
PageDots.AnchorPoint = Vector2.new(0.5,0.5)
PageDots.BackgroundColor3 = Color3.fromRGB(0,0,0)
PageDots.BackgroundTransparency = 1
PageDots.BorderColor3 = Color3.fromRGB(0,0,0)
PageDots.BorderSizePixel = 0
PageDots.Parent = HoverWindow

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Name = "UIListLayout"
UIListLayout.Padding = UDim.new(0.05,0)
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Wraps = false
UIListLayout.Parent = PageDots

local Purchase = Instance.new("ImageButton")
Purchase.Name = "Purchase"
Purchase.Size = UDim2.new(0.70159,0,0.133162,0)
Purchase.Position = UDim2.new(0.5,0,0.9,0)
Purchase.AnchorPoint = Vector2.new(0.5,0.5)
Purchase.BackgroundColor3 = Color3.fromRGB(102,213,117)
Purchase.BackgroundTransparency = 1
Purchase.BorderSizePixel = 0
Purchase.Image = "rbxassetid://83503830393339"
Purchase.ScaleType = Enum.ScaleType.Fit
Purchase.Parent = HoverWindow

local Price = Instance.new("TextLabel")
Price.Name = "Price"
Price.Size = UDim2.new(0.78479,0,0.603976,0)
Price.Position = UDim2.new(0.100663,0,0.190473,0)
Price.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price.BackgroundTransparency = 1
Price.BorderSizePixel = 0
Price.Text = "$19.99"
Price.TextColor3 = Color3.fromRGB(255,255,255)
Price.TextSize = 14
Price.Font = Enum.Font.FredokaOne
Price.TextWrapped = true
Price.TextScaled = true
Price.RichText = true
Price.AutomaticSize = Enum.AutomaticSize.X
Price.Parent = Purchase

local UIStroke2 = Instance.new("UIStroke")
UIStroke2.Name = "UIStroke"
UIStroke2.Thickness = 4
UIStroke2.Parent = Price

local UIAspectRatioConstraint3 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint3.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint3.AspectRatio = 3
UIAspectRatioConstraint3.Parent = Purchase

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0.563233,0,0.0719699,0)
Title.Position = UDim2.new(0.5,0,0.05,0)
Title.AnchorPoint = Vector2.new(0.5,0)
Title.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title.BackgroundTransparency = 1
Title.BorderSizePixel = 0
Title.Text = "Preview"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextSize = 14
Title.Font = Enum.Font.FredokaOne
Title.TextWrapped = true
Title.TextScaled = true
Title.TextTransparency = 0.5
Title.RichText = true
Title.AutomaticSize = Enum.AutomaticSize.X
Title.Parent = HoverWindow

local UIStroke3 = Instance.new("UIStroke")
UIStroke3.Name = "UIStroke"
UIStroke3.Thickness = 4
UIStroke3.Parent = Title

local UIAspectRatioConstraint4 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint4.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint4.AspectRatio = 0.64
UIAspectRatioConstraint4.Parent = HoverWindow

local UIScale3 = Instance.new("UIScale")
UIScale3.Name = "UIScale"
UIScale3.Scale = 1e-07
UIScale3.Parent = HoverWindow

local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Size = UDim2.new(0.0769116,0,0.0833539,0)
Logo.Position = UDim2.new(0.106896,0,0.0500381,0)
Logo.AnchorPoint = Vector2.new(0.5,0.5)
Logo.BackgroundColor3 = Color3.fromRGB(255,255,255)
Logo.BackgroundTransparency = 1
Logo.BorderSizePixel = 0
Logo.Image = "rbxassetid://75699125288122"
Logo.ScaleType = Enum.ScaleType.Fit
Logo.ZIndex = 0
Logo.Parent = ShopifyFrame

local Scrolling = Instance.new("Frame")
Scrolling.Name = "Scrolling"
Scrolling.Size = UDim2.new(0.053055,0,0.811257,0)
Scrolling.Position = UDim2.new(0.890555,0,0.541841,0)
Scrolling.AnchorPoint = Vector2.new(0.5,0.5)
Scrolling.BackgroundColor3 = Color3.fromRGB(255,0,0)
Scrolling.BackgroundTransparency = 1
Scrolling.BorderColor3 = Color3.fromRGB(0,0,0)
Scrolling.BorderSizePixel = 0
Scrolling.ZIndex = 2
Scrolling.Parent = ShopifyFrame

local Background3 = Instance.new("ImageLabel")
Background3.Name = "Background"
Background3.Size = UDim2.new(1,0,1,0)
Background3.Position = UDim2.new(0.5,0,0.5,0)
Background3.AnchorPoint = Vector2.new(0.5,0.5)
Background3.BackgroundColor3 = Color3.fromRGB(255,255,255)
Background3.BackgroundTransparency = 1
Background3.BorderSizePixel = 0
Background3.Image = "rbxassetid://126991782327713"
Background3.ImageColor3 = Color3.fromRGB(165,165,165)
Background3.ScaleType = Enum.ScaleType.Fit
Background3.Parent = Scrolling

local Size = Instance.new("Frame")
Size.Name = "Size"
Size.Size = UDim2.new(1,0,0.597562,0)
Size.Position = UDim2.new(0.503153,0,0.413733,0)
Size.AnchorPoint = Vector2.new(0.5,0.5)
Size.BackgroundColor3 = Color3.fromRGB(255,0,0)
Size.BackgroundTransparency = 1
Size.BorderColor3 = Color3.fromRGB(0,0,0)
Size.BorderSizePixel = 0
Size.ZIndex = 2
Size.Parent = Scrolling

local Thumb = Instance.new("ImageButton")
Thumb.Name = "Thumb"
Thumb.Size = UDim2.new(1,0,0.29,0)
Thumb.Position = UDim2.new(0.5,0,0.0777458,0)
Thumb.AnchorPoint = Vector2.new(0.5,0)
Thumb.BackgroundColor3 = Color3.fromRGB(248,248,248)
Thumb.BackgroundTransparency = 1
Thumb.BorderSizePixel = 0
Thumb.Image = "rbxassetid://123332636773430"
Thumb.ScaleType = Enum.ScaleType.Fit
Thumb.Active = false
Thumb.Parent = Size

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Size = UDim2.new(0.812904,0,0.831928,0)
ScrollingFrame.Position = UDim2.new(0.510797,0,0.124895,0)
ScrollingFrame.AnchorPoint = Vector2.new(0.5,0)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ZIndex = 10
ScrollingFrame.CanvasSize = UDim2.new(0,0,4,0)
ScrollingFrame.ScrollBarThickness = 34
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
ScrollingFrame.ScrollBarImageTransparency = 1
ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollingFrame.ScrollingEnabled = true
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.Active = true
ScrollingFrame.Parent = ShopifyFrame

local Spacer = Instance.new("Frame")
Spacer.Name = "Spacer"
Spacer.Size = UDim2.new(1.05791,0,0.0430434,0)
Spacer.Position = UDim2.new(-5.82348e-08,0,-0.186381,0)
Spacer.BackgroundColor3 = Color3.fromRGB(255,255,255)
Spacer.BackgroundTransparency = 1
Spacer.BorderColor3 = Color3.fromRGB(0,0,0)
Spacer.BorderSizePixel = 0
Spacer.LayoutOrder = -30
Spacer.Parent = ScrollingFrame

local Special = Instance.new("Frame")
Special.Name = "Special"
Special.Size = UDim2.new(1.10498,0,0.439953,0)
Special.Position = UDim2.new(0,0,-0.143337,0)
Special.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special.BackgroundTransparency = 1
Special.BorderColor3 = Color3.fromRGB(0,0,0)
Special.BorderSizePixel = 0
Special.LayoutOrder = -18
Special.Parent = ScrollingFrame

local COM_5988786514287526337 = Instance.new("Frame")
COM_5988786514287526337.Name = "COM-5988786514287526337"
COM_5988786514287526337.Size = UDim2.new(0.894307,0,0.931111,0)
COM_5988786514287526337.Position = UDim2.new(-5.79236e-08,0,0,0)
COM_5988786514287526337.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_5988786514287526337.BackgroundTransparency = 1
COM_5988786514287526337.BorderColor3 = Color3.fromRGB(0,0,0)
COM_5988786514287526337.BorderSizePixel = 0
COM_5988786514287526337.Parent = Special

local BG2 = Instance.new("Frame")
BG2.Name = "BG"
BG2.Size = UDim2.new(1,0,1,0)
BG2.Position = UDim2.new(0.5,0,0.5,0)
BG2.AnchorPoint = Vector2.new(0.5,0.5)
BG2.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG2.BackgroundTransparency = 1
BG2.BorderColor3 = Color3.fromRGB(0,0,0)
BG2.BorderSizePixel = 0
BG2.ZIndex = -1
BG2.Parent = COM_5988786514287526337

local Dropshadow = Instance.new("Frame")
Dropshadow.Name = "Dropshadow"
Dropshadow.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow.AnchorPoint = Vector2.new(0,1)
Dropshadow.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow.BackgroundTransparency = 0.5
Dropshadow.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow.BorderSizePixel = 0
Dropshadow.ZIndex = -2
Dropshadow.Parent = BG2

local UIStroke4 = Instance.new("UIStroke")
UIStroke4.Name = "UIStroke"
UIStroke4.Thickness = 2.79551
UIStroke4.Transparency = 1
UIStroke4.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke4.Parent = Dropshadow

local Frame2 = Instance.new("Frame")
Frame2.Name = "Frame"
Frame2.Size = UDim2.new(0.984612,0,0.95775,0)
Frame2.Position = UDim2.new(0.506631,0,0.478875,0)
Frame2.AnchorPoint = Vector2.new(0.5,0.5)
Frame2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame2.BorderColor3 = Color3.fromRGB(0,0,0)
Frame2.BorderSizePixel = 0
Frame2.ZIndex = -1
Frame2.Parent = BG2

local Pattern = Instance.new("ImageLabel")
Pattern.Name = "Pattern"
Pattern.Size = UDim2.new(0.635249,0,1,0)
Pattern.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern.BackgroundTransparency = 1
Pattern.BorderSizePixel = 0
Pattern.Image = "rbxassetid://129067201766685"
Pattern.ZIndex = -1
Pattern.Parent = Frame2

local UIStroke5 = Instance.new("UIStroke")
UIStroke5.Name = "UIStroke"
UIStroke5.Thickness = 1.86368
UIStroke5.Parent = Pattern

local UIStroke6 = Instance.new("UIStroke")
UIStroke6.Name = "UIStroke"
UIStroke6.Thickness = 1.86368
UIStroke6.Parent = Frame2

local Highlight = Instance.new("Frame")
Highlight.Name = "Highlight"
Highlight.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight.AnchorPoint = Vector2.new(0.5,0.5)
Highlight.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight.BorderSizePixel = 0
Highlight.Visible = false
Highlight.ZIndex = -2
Highlight.Parent = BG2

local UIStroke7 = Instance.new("UIStroke")
UIStroke7.Name = "UIStroke"
UIStroke7.Color = Color3.fromRGB(255,242,0)
UIStroke7.Thickness = 2.79551
UIStroke7.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke7.Parent = Highlight

local CanvasGroup = Instance.new("CanvasGroup")
CanvasGroup.Name = "CanvasGroup"
CanvasGroup.Size = UDim2.new(1,0,1,0)
CanvasGroup.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup.BackgroundTransparency = 1
CanvasGroup.Parent = COM_5988786514287526337

local Thumbnail = Instance.new("ImageLabel")
Thumbnail.Name = "Thumbnail"
Thumbnail.Size = UDim2.new(0.517632,0,1.30457,0)
Thumbnail.Position = UDim2.new(0.11632,0,0.497652,0)
Thumbnail.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail.BackgroundTransparency = 1
Thumbnail.BorderSizePixel = 0
Thumbnail.Image = "rbxassetid://134545329179225"
Thumbnail.ScaleType = Enum.ScaleType.Fit
Thumbnail.ZIndex = 0
Thumbnail.Rotation = -11
Thumbnail.Parent = CanvasGroup

local Unavailable2 = Instance.new("TextLabel")
Unavailable2.Name = "Unavailable"
Unavailable2.Size = UDim2.new(0.7,0,0.7,0)
Unavailable2.Position = UDim2.new(0.5,0,0.5,0)
Unavailable2.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable2.BackgroundTransparency = 1
Unavailable2.BorderSizePixel = 0
Unavailable2.Text = "Unavailable"
Unavailable2.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable2.TextSize = 14
Unavailable2.Font = Enum.Font.FredokaOne
Unavailable2.TextWrapped = true
Unavailable2.TextScaled = true
Unavailable2.Visible = false
Unavailable2.Parent = Thumbnail

local UIStroke8 = Instance.new("UIStroke")
UIStroke8.Name = "UIStroke"
UIStroke8.Thickness = 2
UIStroke8.Parent = Unavailable2

local Thumbnail2 = Instance.new("ImageLabel")
Thumbnail2.Name = "Thumbnail"
Thumbnail2.Size = UDim2.new(0.509542,0,1.15072,0)
Thumbnail2.Position = UDim2.new(0.228656,0,0.372888,0)
Thumbnail2.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail2.BackgroundTransparency = 1
Thumbnail2.BorderSizePixel = 0
Thumbnail2.Image = "rbxassetid://81753140268614"
Thumbnail2.ScaleType = Enum.ScaleType.Fit
Thumbnail2.ZIndex = -1
Thumbnail2.Rotation = 16
Thumbnail2.Parent = CanvasGroup

local Unavailable3 = Instance.new("TextLabel")
Unavailable3.Name = "Unavailable"
Unavailable3.Size = UDim2.new(0.7,0,0.7,0)
Unavailable3.Position = UDim2.new(0.5,0,0.5,0)
Unavailable3.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable3.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable3.BackgroundTransparency = 1
Unavailable3.BorderSizePixel = 0
Unavailable3.Text = "Unavailable"
Unavailable3.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable3.TextSize = 14
Unavailable3.Font = Enum.Font.FredokaOne
Unavailable3.TextWrapped = true
Unavailable3.TextScaled = true
Unavailable3.Visible = false
Unavailable3.Parent = Thumbnail2

local UIStroke9 = Instance.new("UIStroke")
UIStroke9.Name = "UIStroke"
UIStroke9.Thickness = 2
UIStroke9.Parent = Unavailable3

local Thumbnail3 = Instance.new("ImageLabel")
Thumbnail3.Name = "Thumbnail"
Thumbnail3.Size = UDim2.new(0.334554,0,0.967788,0)
Thumbnail3.Position = UDim2.new(0.368402,0,0.5,0)
Thumbnail3.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail3.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail3.BackgroundTransparency = 1
Thumbnail3.BorderSizePixel = 0
Thumbnail3.Image = "rbxassetid://126825711243124"
Thumbnail3.ScaleType = Enum.ScaleType.Fit
Thumbnail3.ZIndex = 0
Thumbnail3.Parent = CanvasGroup

local Unavailable4 = Instance.new("TextLabel")
Unavailable4.Name = "Unavailable"
Unavailable4.Size = UDim2.new(0.7,0,0.7,0)
Unavailable4.Position = UDim2.new(0.5,0,0.5,0)
Unavailable4.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable4.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable4.BackgroundTransparency = 1
Unavailable4.BorderSizePixel = 0
Unavailable4.Text = "Unavailable"
Unavailable4.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable4.TextSize = 14
Unavailable4.Font = Enum.Font.FredokaOne
Unavailable4.TextWrapped = true
Unavailable4.TextScaled = true
Unavailable4.Visible = false
Unavailable4.Parent = Thumbnail3

local UIStroke10 = Instance.new("UIStroke")
UIStroke10.Name = "UIStroke"
UIStroke10.Thickness = 2
UIStroke10.Parent = Unavailable4

local DisplayTitle = Instance.new("TextLabel")
DisplayTitle.Name = "DisplayTitle"
DisplayTitle.Size = UDim2.new(0.294018,0,0.367128,0)
DisplayTitle.Position = UDim2.new(0.811778,0,0.191717,0)
DisplayTitle.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle.BackgroundTransparency = 1
DisplayTitle.BorderSizePixel = 0
DisplayTitle.Text = "Eclipse 14\"\
 Deluxe Plush (Pre-Order)"
DisplayTitle.TextColor3 = Color3.fromRGB(0,0,0)
DisplayTitle.TextSize = 29
DisplayTitle.Font = Enum.Font.Arcade
DisplayTitle.TextWrapped = true
DisplayTitle.TextScaled = true
DisplayTitle.RichText = true
DisplayTitle.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle.Parent = COM_5988786514287526337

local UIAspectRatioConstraint5 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint5.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint5.AspectRatio = 2.66
UIAspectRatioConstraint5.Parent = DisplayTitle

local UIGradient3 = Instance.new("UIGradient")
UIGradient3.Name = "UIGradient"
UIGradient3.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient3.Rotation = -90
UIGradient3.Offset = Vector2.new(0,0)
UIGradient3.Enabled = false
UIGradient3.Parent = DisplayTitle

local UIStroke11 = Instance.new("UIStroke")
UIStroke11.Name = "UIStroke"
UIStroke11.Color = Color3.fromRGB(255,255,255)
UIStroke11.Thickness = 0.931838
UIStroke11.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke11.Parent = DisplayTitle

local Item2 = Instance.new("ImageLabel")
Item2.Name = "Item"
Item2.Size = UDim2.new(0.913665,0,0.651761,0)
Item2.Position = UDim2.new(0.514096,0,0.463834,0)
Item2.AnchorPoint = Vector2.new(0.5,0.5)
Item2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item2.BackgroundTransparency = 1
Item2.BorderSizePixel = 0
Item2.Image = "rbxassetid://94959635148921"
Item2.ImageRectOffset = Vector2.new(15,15)
Item2.ImageRectSize = Vector2.new(270,270)
Item2.ScaleType = Enum.ScaleType.Fit
Item2.Visible = false
Item2.ZIndex = -1
Item2.Parent = COM_5988786514287526337

local Unavailable5 = Instance.new("TextLabel")
Unavailable5.Name = "Unavailable"
Unavailable5.Size = UDim2.new(0.7,0,0.7,0)
Unavailable5.Position = UDim2.new(0.5,0,0.5,0)
Unavailable5.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable5.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable5.BackgroundTransparency = 1
Unavailable5.BorderSizePixel = 0
Unavailable5.Text = "Unavailable"
Unavailable5.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable5.TextSize = 14
Unavailable5.Font = Enum.Font.FredokaOne
Unavailable5.TextWrapped = true
Unavailable5.TextScaled = true
Unavailable5.Visible = false
Unavailable5.Parent = Item2

local UIStroke12 = Instance.new("UIStroke")
UIStroke12.Name = "UIStroke"
UIStroke12.Thickness = 2
UIStroke12.Parent = Unavailable5

local New = Instance.new("ImageLabel")
New.Name = "New"
New.Size = UDim2.new(0.322123,0,0.355513,0)
New.Position = UDim2.new(0.928356,0,0.0669836,0)
New.AnchorPoint = Vector2.new(0.5,0.5)
New.BackgroundColor3 = Color3.fromRGB(255,255,255)
New.BackgroundTransparency = 1
New.BorderSizePixel = 0
New.Image = "rbxassetid://96728750855907"
New.ScaleType = Enum.ScaleType.Fit
New.ZIndex = -1
New.Parent = COM_5988786514287526337

local UIScale4 = Instance.new("UIScale")
UIScale4.Name = "UIScale"
UIScale4.Parent = New

local Purchase2 = Instance.new("ImageButton")
Purchase2.Name = "Purchase"
Purchase2.Size = UDim2.new(0.299855,0,0.201102,0)
Purchase2.Position = UDim2.new(0.814697,0,0.786462,0)
Purchase2.AnchorPoint = Vector2.new(0.5,0.5)
Purchase2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase2.BorderSizePixel = 0
Purchase2.ScaleType = Enum.ScaleType.Fit
Purchase2.AutoButtonColor = false
Purchase2.Parent = COM_5988786514287526337

local Price2 = Instance.new("TextLabel")
Price2.Name = "Price"
Price2.Size = UDim2.new(0.78479,0,0.702682,0)
Price2.Position = UDim2.new(0.100663,0,0.0990811,0)
Price2.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price2.BackgroundTransparency = 1
Price2.BorderSizePixel = 0
Price2.Text = "$19.99"
Price2.TextColor3 = Color3.fromRGB(255,255,255)
Price2.TextSize = 14
Price2.Font = Enum.Font.Arcade
Price2.TextWrapped = true
Price2.TextScaled = true
Price2.RichText = true
Price2.AutomaticSize = Enum.AutomaticSize.X
Price2.Parent = Purchase2

local UIGradient4 = Instance.new("UIGradient")
UIGradient4.Name = "UIGradient"
UIGradient4.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient4.Rotation = -90
UIGradient4.Offset = Vector2.new(0,0)
UIGradient4.Parent = Price2

local UIStroke13 = Instance.new("UIStroke")
UIStroke13.Name = "UIStroke"
UIStroke13.Thickness = 0.931838
UIStroke13.Parent = Price2

local UICorner3 = Instance.new("UICorner")
UICorner3.Name = "UICorner"
UICorner3.CornerRadius = UDim.new(1,0)
UICorner3.Parent = Purchase2

local UIGradient5 = Instance.new("UIGradient")
UIGradient5.Name = "UIGradient"
UIGradient5.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient5.Rotation = -90
UIGradient5.Offset = Vector2.new(0,0)
UIGradient5.Parent = Purchase2

local UIScale5 = Instance.new("UIScale")
UIScale5.Name = "UIScale"
UIScale5.Parent = Purchase2

local UIStroke14 = Instance.new("UIStroke")
UIStroke14.Name = "UIStroke"
UIStroke14.Thickness = 1.1648
UIStroke14.Parent = Purchase2

local Thumbnail4 = Instance.new("ImageLabel")
Thumbnail4.Name = "Thumbnail"
Thumbnail4.Size = UDim2.new(0.48234,0,1.34851,0)
Thumbnail4.Position = UDim2.new(0.551555,0,0.39973,0)
Thumbnail4.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail4.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail4.BackgroundTransparency = 1
Thumbnail4.BorderSizePixel = 0
Thumbnail4.Image = "rbxassetid://130248253182695"
Thumbnail4.ScaleType = Enum.ScaleType.Fit
Thumbnail4.ZIndex = 2
Thumbnail4.Parent = COM_5988786514287526337

local Unavailable6 = Instance.new("TextLabel")
Unavailable6.Name = "Unavailable"
Unavailable6.Size = UDim2.new(0.7,0,0.7,0)
Unavailable6.Position = UDim2.new(0.5,0,0.5,0)
Unavailable6.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable6.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable6.BackgroundTransparency = 1
Unavailable6.BorderSizePixel = 0
Unavailable6.Text = "Unavailable"
Unavailable6.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable6.TextSize = 14
Unavailable6.Font = Enum.Font.FredokaOne
Unavailable6.TextWrapped = true
Unavailable6.TextScaled = true
Unavailable6.Visible = false
Unavailable6.Parent = Thumbnail4

local UIStroke15 = Instance.new("UIStroke")
UIStroke15.Name = "UIStroke"
UIStroke15.Thickness = 2
UIStroke15.Parent = Unavailable6

local Title2 = Instance.new("TextLabel")
Title2.Name = "Title"
Title2.Size = UDim2.new(0.566559,0,0.435422,0)
Title2.Position = UDim2.new(0.65544,0,0.15042,0)
Title2.AnchorPoint = Vector2.new(0.5,0)
Title2.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title2.BackgroundTransparency = 1
Title2.BorderSizePixel = 0
Title2.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title2.TextColor3 = Color3.fromRGB(0,13,76)
Title2.TextSize = 29
Title2.Font = Enum.Font.Arcade
Title2.TextWrapped = true
Title2.TextScaled = true
Title2.RichText = true
Title2.Visible = false
Title2.AutomaticSize = Enum.AutomaticSize.X
Title2.Parent = COM_5988786514287526337

local UIGradient6 = Instance.new("UIGradient")
UIGradient6.Name = "UIGradient"
UIGradient6.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient6.Rotation = -90
UIGradient6.Offset = Vector2.new(0,0)
UIGradient6.Parent = Title2

local UIStroke16 = Instance.new("UIStroke")
UIStroke16.Name = "UIStroke"
UIStroke16.Color = Color3.fromRGB(255,255,255)
UIStroke16.Thickness = 2
UIStroke16.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke16.Parent = Title2

local UIListLayout2 = Instance.new("UIListLayout")
UIListLayout2.Name = "UIListLayout"
UIListLayout2.Padding = UDim.new(0.019,0)
UIListLayout2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout2.Wraps = false
UIListLayout2.Parent = Special

local Special2 = Instance.new("Frame")
Special2.Name = "Special"
Special2.Size = UDim2.new(1.30205,0,0.602466,0)
Special2.Position = UDim2.new(-3.59843e-08,0,0.30441,0)
Special2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special2.BackgroundTransparency = 1
Special2.BorderColor3 = Color3.fromRGB(0,0,0)
Special2.BorderSizePixel = 0
Special2.LayoutOrder = -17
Special2.Parent = ScrollingFrame

local COM_7185021046892921266 = Instance.new("Frame")
COM_7185021046892921266.Name = "COM-7185021046892921266"
COM_7185021046892921266.Size = UDim2.new(0.31602,0,0.944677,0)
COM_7185021046892921266.Position = UDim2.new(0.336087,0,-0.0531514,0)
COM_7185021046892921266.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_7185021046892921266.BackgroundTransparency = 1
COM_7185021046892921266.BorderColor3 = Color3.fromRGB(0,0,0)
COM_7185021046892921266.BorderSizePixel = 0
COM_7185021046892921266.Parent = Special2

local BG3 = Instance.new("Frame")
BG3.Name = "BG"
BG3.Size = UDim2.new(1,0,1,0)
BG3.Position = UDim2.new(0.5,0,0.5,0)
BG3.AnchorPoint = Vector2.new(0.5,0.5)
BG3.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG3.BackgroundTransparency = 1
BG3.BorderColor3 = Color3.fromRGB(0,0,0)
BG3.BorderSizePixel = 0
BG3.ZIndex = -2
BG3.Parent = COM_7185021046892921266

local Dropshadow2 = Instance.new("Frame")
Dropshadow2.Name = "Dropshadow"
Dropshadow2.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow2.Position = UDim2.new(0,0,1.028,0)
Dropshadow2.AnchorPoint = Vector2.new(0,1)
Dropshadow2.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow2.BackgroundTransparency = 0.5
Dropshadow2.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow2.BorderSizePixel = 0
Dropshadow2.ZIndex = -2
Dropshadow2.Parent = BG3

local UIStroke17 = Instance.new("UIStroke")
UIStroke17.Name = "UIStroke"
UIStroke17.Thickness = 2.79551
UIStroke17.Transparency = 1
UIStroke17.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke17.Parent = Dropshadow2

local Frame3 = Instance.new("Frame")
Frame3.Name = "Frame"
Frame3.Size = UDim2.new(0.969681,0,0.95775,0)
Frame3.Position = UDim2.new(0.514096,0,0.478875,0)
Frame3.AnchorPoint = Vector2.new(0.5,0.5)
Frame3.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame3.BorderColor3 = Color3.fromRGB(0,0,0)
Frame3.BorderSizePixel = 0
Frame3.ZIndex = -1
Frame3.Parent = BG3

local Pattern2 = Instance.new("ImageLabel")
Pattern2.Name = "Pattern"
Pattern2.Size = UDim2.new(1,0,1,0)
Pattern2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern2.BackgroundTransparency = 1
Pattern2.BorderSizePixel = 0
Pattern2.Image = "rbxassetid://120182301931200"
Pattern2.ImageColor3 = Color3.fromRGB(144,50,161)
Pattern2.ScaleType = Enum.ScaleType.Crop
Pattern2.ZIndex = -1
Pattern2.Parent = Frame3

local UIStroke18 = Instance.new("UIStroke")
UIStroke18.Name = "UIStroke"
UIStroke18.Thickness = 1.86368
UIStroke18.Parent = Pattern2

local UIStroke19 = Instance.new("UIStroke")
UIStroke19.Name = "UIStroke"
UIStroke19.Thickness = 1.86368
UIStroke19.Parent = Frame3

local Highlight2 = Instance.new("Frame")
Highlight2.Name = "Highlight"
Highlight2.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight2.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight2.AnchorPoint = Vector2.new(0.5,0.5)
Highlight2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight2.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight2.BorderSizePixel = 0
Highlight2.Visible = false
Highlight2.ZIndex = -2
Highlight2.Parent = BG3

local UIStroke20 = Instance.new("UIStroke")
UIStroke20.Name = "UIStroke"
UIStroke20.Color = Color3.fromRGB(255,242,0)
UIStroke20.Thickness = 2.79551
UIStroke20.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke20.Parent = Highlight2

local DisplayTitle2 = Instance.new("TextLabel")
DisplayTitle2.Name = "DisplayTitle"
DisplayTitle2.Size = UDim2.new(0.854506,0,0.108842,0)
DisplayTitle2.Position = UDim2.new(0.521125,0,0.0306124,0)
DisplayTitle2.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle2.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle2.BackgroundTransparency = 1
DisplayTitle2.BorderSizePixel = 0
DisplayTitle2.Text = "COM-9165422475759190499"
DisplayTitle2.TextColor3 = Color3.fromRGB(0,0,0)
DisplayTitle2.TextSize = 29
DisplayTitle2.Font = Enum.Font.Arcade
DisplayTitle2.TextXAlignment = Enum.TextXAlignment.Left
DisplayTitle2.TextYAlignment = Enum.TextYAlignment.Top
DisplayTitle2.TextWrapped = true
DisplayTitle2.TextScaled = true
DisplayTitle2.RichText = true
DisplayTitle2.Visible = false
DisplayTitle2.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle2.Parent = COM_7185021046892921266

local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
UITextSizeConstraint.Name = "UITextSizeConstraint"
UITextSizeConstraint.MaxTextSize = 29
UITextSizeConstraint.Parent = DisplayTitle2

local Item3 = Instance.new("ImageLabel")
Item3.Name = "Item"
Item3.Size = UDim2.new(0.902423,0,0.651761,0)
Item3.Position = UDim2.new(0.521125,0,0.463834,0)
Item3.AnchorPoint = Vector2.new(0.5,0.5)
Item3.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item3.BackgroundTransparency = 1
Item3.BorderSizePixel = 0
Item3.Image = "rbxassetid://138096832706650"
Item3.ImageRectOffset = Vector2.new(25,25)
Item3.ImageRectSize = Vector2.new(700,700)
Item3.ScaleType = Enum.ScaleType.Fit
Item3.Visible = false
Item3.ZIndex = -1
Item3.Parent = COM_7185021046892921266

local Unavailable7 = Instance.new("TextLabel")
Unavailable7.Name = "Unavailable"
Unavailable7.Size = UDim2.new(0.7,0,0.7,0)
Unavailable7.Position = UDim2.new(0.5,0,0.5,0)
Unavailable7.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable7.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable7.BackgroundTransparency = 1
Unavailable7.BorderSizePixel = 0
Unavailable7.Text = "Unavailable"
Unavailable7.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable7.TextSize = 14
Unavailable7.Font = Enum.Font.FredokaOne
Unavailable7.TextWrapped = true
Unavailable7.TextScaled = true
Unavailable7.Visible = false
Unavailable7.Parent = Item3

local UIStroke21 = Instance.new("UIStroke")
UIStroke21.Name = "UIStroke"
UIStroke21.Thickness = 2
UIStroke21.Parent = Unavailable7

local Pixel = Instance.new("ImageLabel")
Pixel.Name = "Pixel"
Pixel.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel.AnchorPoint = Vector2.new(0.5,0.5)
Pixel.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel.BorderSizePixel = 0
Pixel.Image = "rbxassetid://94959635148921"
Pixel.ImageRectOffset = Vector2.new(55,100)
Pixel.ImageRectSize = Vector2.new(30,30)
Pixel.ScaleType = Enum.ScaleType.Crop
Pixel.Visible = false
Pixel.ZIndex = 5
Pixel.Parent = COM_7185021046892921266

local Unavailable8 = Instance.new("TextLabel")
Unavailable8.Name = "Unavailable"
Unavailable8.Size = UDim2.new(0.7,0,0.7,0)
Unavailable8.Position = UDim2.new(0.5,0,0.5,0)
Unavailable8.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable8.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable8.BackgroundTransparency = 1
Unavailable8.BorderSizePixel = 0
Unavailable8.Text = "Unavailable"
Unavailable8.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable8.TextSize = 14
Unavailable8.Font = Enum.Font.FredokaOne
Unavailable8.TextWrapped = true
Unavailable8.TextScaled = true
Unavailable8.Visible = false
Unavailable8.Parent = Pixel

local UIStroke22 = Instance.new("UIStroke")
UIStroke22.Name = "UIStroke"
UIStroke22.Thickness = 2
UIStroke22.Parent = Unavailable8

local Purchase3 = Instance.new("ImageButton")
Purchase3.Name = "Purchase"
Purchase3.Size = UDim2.new(0.902423,0,0.116761,0)
Purchase3.Position = UDim2.new(0.521125,0,0.866764,0)
Purchase3.AnchorPoint = Vector2.new(0.5,0.5)
Purchase3.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase3.BorderSizePixel = 0
Purchase3.ScaleType = Enum.ScaleType.Fit
Purchase3.AutoButtonColor = false
Purchase3.ZIndex = 5
Purchase3.Parent = COM_7185021046892921266

local Price3 = Instance.new("TextLabel")
Price3.Name = "Price"
Price3.Size = UDim2.new(0.78479,0,0.702682,0)
Price3.Position = UDim2.new(0.100663,0,0.0990811,0)
Price3.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price3.BackgroundTransparency = 1
Price3.BorderSizePixel = 0
Price3.Text = "$19.99"
Price3.TextColor3 = Color3.fromRGB(255,255,255)
Price3.TextSize = 14
Price3.Font = Enum.Font.Arcade
Price3.TextWrapped = true
Price3.TextScaled = true
Price3.RichText = true
Price3.AutomaticSize = Enum.AutomaticSize.X
Price3.Parent = Purchase3

local UIGradient7 = Instance.new("UIGradient")
UIGradient7.Name = "UIGradient"
UIGradient7.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient7.Rotation = -90
UIGradient7.Offset = Vector2.new(0,0)
UIGradient7.Parent = Price3

local UIStroke23 = Instance.new("UIStroke")
UIStroke23.Name = "UIStroke"
UIStroke23.Thickness = 2
UIStroke23.Parent = Price3

local UICorner4 = Instance.new("UICorner")
UICorner4.Name = "UICorner"
UICorner4.CornerRadius = UDim.new(1,0)
UICorner4.Parent = Purchase3

local UIGradient8 = Instance.new("UIGradient")
UIGradient8.Name = "UIGradient"
UIGradient8.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient8.Rotation = -90
UIGradient8.Offset = Vector2.new(0,0)
UIGradient8.Parent = Purchase3

local UIScale6 = Instance.new("UIScale")
UIScale6.Name = "UIScale"
UIScale6.Parent = Purchase3

local UIStroke24 = Instance.new("UIStroke")
UIStroke24.Name = "UIStroke"
UIStroke24.Thickness = 2.5
UIStroke24.Parent = Purchase3

local Thumbnail5 = Instance.new("ImageLabel")
Thumbnail5.Name = "Thumbnail"
Thumbnail5.Size = UDim2.new(1.08228,0,0.970612,0)
Thumbnail5.Position = UDim2.new(0.521125,0,0.411514,0)
Thumbnail5.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail5.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail5.BackgroundTransparency = 1
Thumbnail5.BorderSizePixel = 0
Thumbnail5.Image = "rbxassetid://88278826022975"
Thumbnail5.ScaleType = Enum.ScaleType.Fit
Thumbnail5.ZIndex = -1
Thumbnail5.Parent = COM_7185021046892921266

local Unavailable9 = Instance.new("TextLabel")
Unavailable9.Name = "Unavailable"
Unavailable9.Size = UDim2.new(0.7,0,0.7,0)
Unavailable9.Position = UDim2.new(0.5,0,0.5,0)
Unavailable9.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable9.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable9.BackgroundTransparency = 1
Unavailable9.BorderSizePixel = 0
Unavailable9.Text = "Unavailable"
Unavailable9.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable9.TextSize = 14
Unavailable9.Font = Enum.Font.FredokaOne
Unavailable9.TextWrapped = true
Unavailable9.TextScaled = true
Unavailable9.Visible = false
Unavailable9.Parent = Thumbnail5

local UIStroke25 = Instance.new("UIStroke")
UIStroke25.Name = "UIStroke"
UIStroke25.Thickness = 2
UIStroke25.Parent = Unavailable9

local Title3 = Instance.new("TextLabel")
Title3.Name = "Title"
Title3.Size = UDim2.new(0.854506,0,0.108842,0)
Title3.Position = UDim2.new(0.521125,0,0.0306124,0)
Title3.AnchorPoint = Vector2.new(0.5,0)
Title3.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title3.BackgroundTransparency = 1
Title3.BorderSizePixel = 0
Title3.Text = "COM-9165422475759190499"
Title3.TextColor3 = Color3.fromRGB(0,0,0)
Title3.TextSize = 29
Title3.Font = Enum.Font.Arcade
Title3.TextXAlignment = Enum.TextXAlignment.Left
Title3.TextYAlignment = Enum.TextYAlignment.Top
Title3.TextWrapped = true
Title3.TextScaled = true
Title3.RichText = true
Title3.Visible = false
Title3.AutomaticSize = Enum.AutomaticSize.X
Title3.Parent = COM_7185021046892921266

local UITextSizeConstraint2 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint2.Name = "UITextSizeConstraint"
UITextSizeConstraint2.MaxTextSize = 29
UITextSizeConstraint2.Parent = Title3

local UIAspectRatioConstraint6 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint6.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint6.AspectRatio = 0.76
UIAspectRatioConstraint6.Parent = COM_7185021046892921266

local COM_7817418654663967167 = Instance.new("Frame")
COM_7817418654663967167.Name = "COM-7817418654663967167"
COM_7817418654663967167.Size = UDim2.new(0.31602,0,0.944677,0)
COM_7817418654663967167.Position = UDim2.new(0.336087,0,-0.0531514,0)
COM_7817418654663967167.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_7817418654663967167.BackgroundTransparency = 1
COM_7817418654663967167.BorderColor3 = Color3.fromRGB(0,0,0)
COM_7817418654663967167.BorderSizePixel = 0
COM_7817418654663967167.Parent = Special2

local BG4 = Instance.new("Frame")
BG4.Name = "BG"
BG4.Size = UDim2.new(1,0,1,0)
BG4.Position = UDim2.new(0.5,0,0.5,0)
BG4.AnchorPoint = Vector2.new(0.5,0.5)
BG4.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG4.BackgroundTransparency = 1
BG4.BorderColor3 = Color3.fromRGB(0,0,0)
BG4.BorderSizePixel = 0
BG4.ZIndex = -2
BG4.Parent = COM_7817418654663967167

local Dropshadow3 = Instance.new("Frame")
Dropshadow3.Name = "Dropshadow"
Dropshadow3.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow3.Position = UDim2.new(0,0,1.028,0)
Dropshadow3.AnchorPoint = Vector2.new(0,1)
Dropshadow3.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow3.BackgroundTransparency = 0.5
Dropshadow3.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow3.BorderSizePixel = 0
Dropshadow3.ZIndex = -2
Dropshadow3.Parent = BG4

local UIStroke26 = Instance.new("UIStroke")
UIStroke26.Name = "UIStroke"
UIStroke26.Thickness = 2.79551
UIStroke26.Transparency = 1
UIStroke26.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke26.Parent = Dropshadow3

local Frame4 = Instance.new("Frame")
Frame4.Name = "Frame"
Frame4.Size = UDim2.new(0.969681,0,0.95775,0)
Frame4.Position = UDim2.new(0.514096,0,0.478875,0)
Frame4.AnchorPoint = Vector2.new(0.5,0.5)
Frame4.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame4.BorderColor3 = Color3.fromRGB(0,0,0)
Frame4.BorderSizePixel = 0
Frame4.ZIndex = -1
Frame4.Parent = BG4

local Pattern3 = Instance.new("ImageLabel")
Pattern3.Name = "Pattern"
Pattern3.Size = UDim2.new(1,0,1,0)
Pattern3.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern3.BackgroundTransparency = 1
Pattern3.BorderSizePixel = 0
Pattern3.Image = "rbxassetid://120182301931200"
Pattern3.ImageColor3 = Color3.fromRGB(144,50,161)
Pattern3.ScaleType = Enum.ScaleType.Crop
Pattern3.ZIndex = -1
Pattern3.Parent = Frame4

local UIStroke27 = Instance.new("UIStroke")
UIStroke27.Name = "UIStroke"
UIStroke27.Thickness = 1.86368
UIStroke27.Parent = Pattern3

local UIStroke28 = Instance.new("UIStroke")
UIStroke28.Name = "UIStroke"
UIStroke28.Thickness = 1.86368
UIStroke28.Parent = Frame4

local Highlight3 = Instance.new("Frame")
Highlight3.Name = "Highlight"
Highlight3.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight3.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight3.AnchorPoint = Vector2.new(0.5,0.5)
Highlight3.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight3.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight3.BorderSizePixel = 0
Highlight3.Visible = false
Highlight3.ZIndex = -2
Highlight3.Parent = BG4

local UIStroke29 = Instance.new("UIStroke")
UIStroke29.Name = "UIStroke"
UIStroke29.Color = Color3.fromRGB(255,242,0)
UIStroke29.Thickness = 2.79551
UIStroke29.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke29.Parent = Highlight3

local DisplayTitle3 = Instance.new("TextLabel")
DisplayTitle3.Name = "DisplayTitle"
DisplayTitle3.Size = UDim2.new(0.854506,0,0.108842,0)
DisplayTitle3.Position = UDim2.new(0.521125,0,0.0306124,0)
DisplayTitle3.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle3.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle3.BackgroundTransparency = 1
DisplayTitle3.BorderSizePixel = 0
DisplayTitle3.Text = "COM-9165422475759190499"
DisplayTitle3.TextColor3 = Color3.fromRGB(0,0,0)
DisplayTitle3.TextSize = 29
DisplayTitle3.Font = Enum.Font.Arcade
DisplayTitle3.TextXAlignment = Enum.TextXAlignment.Left
DisplayTitle3.TextYAlignment = Enum.TextYAlignment.Top
DisplayTitle3.TextWrapped = true
DisplayTitle3.TextScaled = true
DisplayTitle3.RichText = true
DisplayTitle3.Visible = false
DisplayTitle3.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle3.Parent = COM_7817418654663967167

local UITextSizeConstraint3 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint3.Name = "UITextSizeConstraint"
UITextSizeConstraint3.MaxTextSize = 29
UITextSizeConstraint3.Parent = DisplayTitle3

local Item4 = Instance.new("ImageLabel")
Item4.Name = "Item"
Item4.Size = UDim2.new(0.902423,0,0.651761,0)
Item4.Position = UDim2.new(0.521125,0,0.463834,0)
Item4.AnchorPoint = Vector2.new(0.5,0.5)
Item4.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item4.BackgroundTransparency = 1
Item4.BorderSizePixel = 0
Item4.Image = "rbxassetid://138096832706650"
Item4.ImageRectOffset = Vector2.new(25,25)
Item4.ImageRectSize = Vector2.new(700,700)
Item4.ScaleType = Enum.ScaleType.Fit
Item4.Visible = false
Item4.ZIndex = -1
Item4.Parent = COM_7817418654663967167

local Unavailable10 = Instance.new("TextLabel")
Unavailable10.Name = "Unavailable"
Unavailable10.Size = UDim2.new(0.7,0,0.7,0)
Unavailable10.Position = UDim2.new(0.5,0,0.5,0)
Unavailable10.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable10.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable10.BackgroundTransparency = 1
Unavailable10.BorderSizePixel = 0
Unavailable10.Text = "Unavailable"
Unavailable10.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable10.TextSize = 14
Unavailable10.Font = Enum.Font.FredokaOne
Unavailable10.TextWrapped = true
Unavailable10.TextScaled = true
Unavailable10.Visible = false
Unavailable10.Parent = Item4

local UIStroke30 = Instance.new("UIStroke")
UIStroke30.Name = "UIStroke"
UIStroke30.Thickness = 2
UIStroke30.Parent = Unavailable10

local Pixel2 = Instance.new("ImageLabel")
Pixel2.Name = "Pixel"
Pixel2.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel2.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel2.AnchorPoint = Vector2.new(0.5,0.5)
Pixel2.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel2.BorderSizePixel = 0
Pixel2.Image = "rbxassetid://94959635148921"
Pixel2.ImageRectOffset = Vector2.new(55,100)
Pixel2.ImageRectSize = Vector2.new(30,30)
Pixel2.ScaleType = Enum.ScaleType.Crop
Pixel2.Visible = false
Pixel2.ZIndex = 5
Pixel2.Parent = COM_7817418654663967167

local Unavailable11 = Instance.new("TextLabel")
Unavailable11.Name = "Unavailable"
Unavailable11.Size = UDim2.new(0.7,0,0.7,0)
Unavailable11.Position = UDim2.new(0.5,0,0.5,0)
Unavailable11.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable11.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable11.BackgroundTransparency = 1
Unavailable11.BorderSizePixel = 0
Unavailable11.Text = "Unavailable"
Unavailable11.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable11.TextSize = 14
Unavailable11.Font = Enum.Font.FredokaOne
Unavailable11.TextWrapped = true
Unavailable11.TextScaled = true
Unavailable11.Visible = false
Unavailable11.Parent = Pixel2

local UIStroke31 = Instance.new("UIStroke")
UIStroke31.Name = "UIStroke"
UIStroke31.Thickness = 2
UIStroke31.Parent = Unavailable11

local Purchase4 = Instance.new("ImageButton")
Purchase4.Name = "Purchase"
Purchase4.Size = UDim2.new(0.902423,0,0.116761,0)
Purchase4.Position = UDim2.new(0.521125,0,0.866764,0)
Purchase4.AnchorPoint = Vector2.new(0.5,0.5)
Purchase4.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase4.BorderSizePixel = 0
Purchase4.ScaleType = Enum.ScaleType.Fit
Purchase4.AutoButtonColor = false
Purchase4.ZIndex = 5
Purchase4.Parent = COM_7817418654663967167

local Price4 = Instance.new("TextLabel")
Price4.Name = "Price"
Price4.Size = UDim2.new(0.78479,0,0.702682,0)
Price4.Position = UDim2.new(0.100663,0,0.0990811,0)
Price4.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price4.BackgroundTransparency = 1
Price4.BorderSizePixel = 0
Price4.Text = "$19.99"
Price4.TextColor3 = Color3.fromRGB(255,255,255)
Price4.TextSize = 14
Price4.Font = Enum.Font.Arcade
Price4.TextWrapped = true
Price4.TextScaled = true
Price4.RichText = true
Price4.AutomaticSize = Enum.AutomaticSize.X
Price4.Parent = Purchase4

local UIGradient9 = Instance.new("UIGradient")
UIGradient9.Name = "UIGradient"
UIGradient9.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient9.Rotation = -90
UIGradient9.Offset = Vector2.new(0,0)
UIGradient9.Parent = Price4

local UIStroke32 = Instance.new("UIStroke")
UIStroke32.Name = "UIStroke"
UIStroke32.Thickness = 2
UIStroke32.Parent = Price4

local UICorner5 = Instance.new("UICorner")
UICorner5.Name = "UICorner"
UICorner5.CornerRadius = UDim.new(1,0)
UICorner5.Parent = Purchase4

local UIGradient10 = Instance.new("UIGradient")
UIGradient10.Name = "UIGradient"
UIGradient10.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient10.Rotation = -90
UIGradient10.Offset = Vector2.new(0,0)
UIGradient10.Parent = Purchase4

local UIScale7 = Instance.new("UIScale")
UIScale7.Name = "UIScale"
UIScale7.Parent = Purchase4

local UIStroke33 = Instance.new("UIStroke")
UIStroke33.Name = "UIStroke"
UIStroke33.Thickness = 2.5
UIStroke33.Parent = Purchase4

local Thumbnail6 = Instance.new("ImageLabel")
Thumbnail6.Name = "Thumbnail"
Thumbnail6.Size = UDim2.new(1.11505,0,1,0)
Thumbnail6.Position = UDim2.new(0.5,0,0.39682,0)
Thumbnail6.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail6.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail6.BackgroundTransparency = 1
Thumbnail6.BorderSizePixel = 0
Thumbnail6.Image = "rbxassetid://95295186635542"
Thumbnail6.ScaleType = Enum.ScaleType.Fit
Thumbnail6.ZIndex = -1
Thumbnail6.Parent = COM_7817418654663967167

local Unavailable12 = Instance.new("TextLabel")
Unavailable12.Name = "Unavailable"
Unavailable12.Size = UDim2.new(0.7,0,0.7,0)
Unavailable12.Position = UDim2.new(0.5,0,0.5,0)
Unavailable12.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable12.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable12.BackgroundTransparency = 1
Unavailable12.BorderSizePixel = 0
Unavailable12.Text = "Unavailable"
Unavailable12.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable12.TextSize = 14
Unavailable12.Font = Enum.Font.FredokaOne
Unavailable12.TextWrapped = true
Unavailable12.TextScaled = true
Unavailable12.Visible = false
Unavailable12.Parent = Thumbnail6

local UIStroke34 = Instance.new("UIStroke")
UIStroke34.Name = "UIStroke"
UIStroke34.Thickness = 2
UIStroke34.Parent = Unavailable12

local Title4 = Instance.new("TextLabel")
Title4.Name = "Title"
Title4.Size = UDim2.new(0.854506,0,0.108842,0)
Title4.Position = UDim2.new(0.521125,0,0.0306124,0)
Title4.AnchorPoint = Vector2.new(0.5,0)
Title4.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title4.BackgroundTransparency = 1
Title4.BorderSizePixel = 0
Title4.Text = "COM-9165422475759190499"
Title4.TextColor3 = Color3.fromRGB(0,0,0)
Title4.TextSize = 29
Title4.Font = Enum.Font.Arcade
Title4.TextXAlignment = Enum.TextXAlignment.Left
Title4.TextYAlignment = Enum.TextYAlignment.Top
Title4.TextWrapped = true
Title4.TextScaled = true
Title4.RichText = true
Title4.Visible = false
Title4.AutomaticSize = Enum.AutomaticSize.X
Title4.Parent = COM_7817418654663967167

local UITextSizeConstraint4 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint4.Name = "UITextSizeConstraint"
UITextSizeConstraint4.MaxTextSize = 29
UITextSizeConstraint4.Parent = Title4

local UIAspectRatioConstraint7 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint7.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint7.AspectRatio = 0.76
UIAspectRatioConstraint7.Parent = COM_7817418654663967167

local COM_7986890478983446966 = Instance.new("Frame")
COM_7986890478983446966.Name = "COM-7986890478983446966"
COM_7986890478983446966.Size = UDim2.new(0.31602,0,0.944677,0)
COM_7986890478983446966.Position = UDim2.new(0.336087,0,-0.0531514,0)
COM_7986890478983446966.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_7986890478983446966.BackgroundTransparency = 1
COM_7986890478983446966.BorderColor3 = Color3.fromRGB(0,0,0)
COM_7986890478983446966.BorderSizePixel = 0
COM_7986890478983446966.Parent = Special2

local BG5 = Instance.new("Frame")
BG5.Name = "BG"
BG5.Size = UDim2.new(1,0,1,0)
BG5.Position = UDim2.new(0.5,0,0.5,0)
BG5.AnchorPoint = Vector2.new(0.5,0.5)
BG5.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG5.BackgroundTransparency = 1
BG5.BorderColor3 = Color3.fromRGB(0,0,0)
BG5.BorderSizePixel = 0
BG5.ZIndex = -1
BG5.Parent = COM_7986890478983446966

local Dropshadow4 = Instance.new("Frame")
Dropshadow4.Name = "Dropshadow"
Dropshadow4.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow4.Position = UDim2.new(0,0,1.028,0)
Dropshadow4.AnchorPoint = Vector2.new(0,1)
Dropshadow4.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow4.BackgroundTransparency = 0.5
Dropshadow4.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow4.BorderSizePixel = 0
Dropshadow4.ZIndex = -2
Dropshadow4.Parent = BG5

local UIStroke35 = Instance.new("UIStroke")
UIStroke35.Name = "UIStroke"
UIStroke35.Thickness = 2.79551
UIStroke35.Transparency = 1
UIStroke35.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke35.Parent = Dropshadow4

local Frame5 = Instance.new("Frame")
Frame5.Name = "Frame"
Frame5.Size = UDim2.new(0.969681,0,0.95775,0)
Frame5.Position = UDim2.new(0.514096,0,0.478875,0)
Frame5.AnchorPoint = Vector2.new(0.5,0.5)
Frame5.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame5.BorderColor3 = Color3.fromRGB(0,0,0)
Frame5.BorderSizePixel = 0
Frame5.ZIndex = -1
Frame5.Parent = BG5

local Pattern4 = Instance.new("ImageLabel")
Pattern4.Name = "Pattern"
Pattern4.Size = UDim2.new(1,0,1,0)
Pattern4.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern4.BackgroundTransparency = 1
Pattern4.BorderSizePixel = 0
Pattern4.Image = "rbxassetid://129067201766685"
Pattern4.ScaleType = Enum.ScaleType.Slice
Pattern4.ZIndex = -1
Pattern4.Parent = Frame5

local UIStroke36 = Instance.new("UIStroke")
UIStroke36.Name = "UIStroke"
UIStroke36.Thickness = 1.86368
UIStroke36.Parent = Pattern4

local UIStroke37 = Instance.new("UIStroke")
UIStroke37.Name = "UIStroke"
UIStroke37.Thickness = 1.86368
UIStroke37.Parent = Frame5

local Highlight4 = Instance.new("Frame")
Highlight4.Name = "Highlight"
Highlight4.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight4.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight4.AnchorPoint = Vector2.new(0.5,0.5)
Highlight4.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight4.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight4.BorderSizePixel = 0
Highlight4.Visible = false
Highlight4.ZIndex = -2
Highlight4.Parent = BG5

local UIStroke38 = Instance.new("UIStroke")
UIStroke38.Name = "UIStroke"
UIStroke38.Color = Color3.fromRGB(255,242,0)
UIStroke38.Thickness = 2.79551
UIStroke38.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke38.Parent = Highlight4

local DisplayTitle4 = Instance.new("TextLabel")
DisplayTitle4.Name = "DisplayTitle"
DisplayTitle4.Size = UDim2.new(0.854506,0,0.108842,0)
DisplayTitle4.Position = UDim2.new(0.521125,0,0.0306124,0)
DisplayTitle4.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle4.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle4.BackgroundTransparency = 1
DisplayTitle4.BorderSizePixel = 0
DisplayTitle4.Text = "COM-9165422475759190499"
DisplayTitle4.TextColor3 = Color3.fromRGB(0,0,0)
DisplayTitle4.TextSize = 29
DisplayTitle4.Font = Enum.Font.Arcade
DisplayTitle4.TextXAlignment = Enum.TextXAlignment.Left
DisplayTitle4.TextYAlignment = Enum.TextYAlignment.Top
DisplayTitle4.TextWrapped = true
DisplayTitle4.TextScaled = true
DisplayTitle4.RichText = true
DisplayTitle4.Visible = false
DisplayTitle4.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle4.Parent = COM_7986890478983446966

local UITextSizeConstraint5 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint5.Name = "UITextSizeConstraint"
UITextSizeConstraint5.MaxTextSize = 29
UITextSizeConstraint5.Parent = DisplayTitle4

local Item5 = Instance.new("ImageLabel")
Item5.Name = "Item"
Item5.Size = UDim2.new(0.902423,0,0.651761,0)
Item5.Position = UDim2.new(0.521125,0,0.463834,0)
Item5.AnchorPoint = Vector2.new(0.5,0.5)
Item5.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item5.BackgroundTransparency = 1
Item5.BorderSizePixel = 0
Item5.Image = "rbxassetid://138096832706650"
Item5.ImageRectOffset = Vector2.new(25,25)
Item5.ImageRectSize = Vector2.new(700,700)
Item5.ScaleType = Enum.ScaleType.Fit
Item5.Visible = false
Item5.ZIndex = -1
Item5.Parent = COM_7986890478983446966

local Unavailable13 = Instance.new("TextLabel")
Unavailable13.Name = "Unavailable"
Unavailable13.Size = UDim2.new(0.7,0,0.7,0)
Unavailable13.Position = UDim2.new(0.5,0,0.5,0)
Unavailable13.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable13.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable13.BackgroundTransparency = 1
Unavailable13.BorderSizePixel = 0
Unavailable13.Text = "Unavailable"
Unavailable13.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable13.TextSize = 14
Unavailable13.Font = Enum.Font.FredokaOne
Unavailable13.TextWrapped = true
Unavailable13.TextScaled = true
Unavailable13.Visible = false
Unavailable13.Parent = Item5

local UIStroke39 = Instance.new("UIStroke")
UIStroke39.Name = "UIStroke"
UIStroke39.Thickness = 2
UIStroke39.Parent = Unavailable13

local Pixel3 = Instance.new("ImageLabel")
Pixel3.Name = "Pixel"
Pixel3.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel3.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel3.AnchorPoint = Vector2.new(0.5,0.5)
Pixel3.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel3.BorderSizePixel = 0
Pixel3.Image = "rbxassetid://94959635148921"
Pixel3.ImageRectOffset = Vector2.new(55,100)
Pixel3.ImageRectSize = Vector2.new(30,30)
Pixel3.ScaleType = Enum.ScaleType.Crop
Pixel3.Visible = false
Pixel3.ZIndex = 5
Pixel3.Parent = COM_7986890478983446966

local Unavailable14 = Instance.new("TextLabel")
Unavailable14.Name = "Unavailable"
Unavailable14.Size = UDim2.new(0.7,0,0.7,0)
Unavailable14.Position = UDim2.new(0.5,0,0.5,0)
Unavailable14.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable14.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable14.BackgroundTransparency = 1
Unavailable14.BorderSizePixel = 0
Unavailable14.Text = "Unavailable"
Unavailable14.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable14.TextSize = 14
Unavailable14.Font = Enum.Font.FredokaOne
Unavailable14.TextWrapped = true
Unavailable14.TextScaled = true
Unavailable14.Visible = false
Unavailable14.Parent = Pixel3

local UIStroke40 = Instance.new("UIStroke")
UIStroke40.Name = "UIStroke"
UIStroke40.Thickness = 2
UIStroke40.Parent = Unavailable14

local Purchase5 = Instance.new("ImageButton")
Purchase5.Name = "Purchase"
Purchase5.Size = UDim2.new(0.902423,0,0.116761,0)
Purchase5.Position = UDim2.new(0.521125,0,0.866764,0)
Purchase5.AnchorPoint = Vector2.new(0.5,0.5)
Purchase5.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase5.BorderSizePixel = 0
Purchase5.ScaleType = Enum.ScaleType.Fit
Purchase5.AutoButtonColor = false
Purchase5.ZIndex = 5
Purchase5.Parent = COM_7986890478983446966

local Price5 = Instance.new("TextLabel")
Price5.Name = "Price"
Price5.Size = UDim2.new(0.78479,0,0.702682,0)
Price5.Position = UDim2.new(0.100663,0,0.0990811,0)
Price5.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price5.BackgroundTransparency = 1
Price5.BorderSizePixel = 0
Price5.Text = "$19.99"
Price5.TextColor3 = Color3.fromRGB(255,255,255)
Price5.TextSize = 14
Price5.Font = Enum.Font.Arcade
Price5.TextWrapped = true
Price5.TextScaled = true
Price5.RichText = true
Price5.AutomaticSize = Enum.AutomaticSize.X
Price5.Parent = Purchase5

local UIGradient11 = Instance.new("UIGradient")
UIGradient11.Name = "UIGradient"
UIGradient11.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient11.Rotation = -90
UIGradient11.Offset = Vector2.new(0,0)
UIGradient11.Parent = Price5

local UIStroke41 = Instance.new("UIStroke")
UIStroke41.Name = "UIStroke"
UIStroke41.Thickness = 2
UIStroke41.Parent = Price5

local UICorner6 = Instance.new("UICorner")
UICorner6.Name = "UICorner"
UICorner6.CornerRadius = UDim.new(1,0)
UICorner6.Parent = Purchase5

local UIGradient12 = Instance.new("UIGradient")
UIGradient12.Name = "UIGradient"
UIGradient12.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient12.Rotation = -90
UIGradient12.Offset = Vector2.new(0,0)
UIGradient12.Parent = Purchase5

local UIScale8 = Instance.new("UIScale")
UIScale8.Name = "UIScale"
UIScale8.Parent = Purchase5

local UIStroke42 = Instance.new("UIStroke")
UIStroke42.Name = "UIStroke"
UIStroke42.Thickness = 2.5
UIStroke42.Parent = Purchase5

local Thumbnail7 = Instance.new("ImageLabel")
Thumbnail7.Name = "Thumbnail"
Thumbnail7.Size = UDim2.new(1.11505,0,1,0)
Thumbnail7.Position = UDim2.new(0.5,0,0.39682,0)
Thumbnail7.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail7.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail7.BackgroundTransparency = 1
Thumbnail7.BorderSizePixel = 0
Thumbnail7.Image = "rbxassetid://133370088925214"
Thumbnail7.ScaleType = Enum.ScaleType.Fit
Thumbnail7.ZIndex = -1
Thumbnail7.Parent = COM_7986890478983446966

local Unavailable15 = Instance.new("TextLabel")
Unavailable15.Name = "Unavailable"
Unavailable15.Size = UDim2.new(0.7,0,0.7,0)
Unavailable15.Position = UDim2.new(0.5,0,0.5,0)
Unavailable15.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable15.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable15.BackgroundTransparency = 1
Unavailable15.BorderSizePixel = 0
Unavailable15.Text = "Unavailable"
Unavailable15.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable15.TextSize = 14
Unavailable15.Font = Enum.Font.FredokaOne
Unavailable15.TextWrapped = true
Unavailable15.TextScaled = true
Unavailable15.Visible = false
Unavailable15.Parent = Thumbnail7

local UIStroke43 = Instance.new("UIStroke")
UIStroke43.Name = "UIStroke"
UIStroke43.Thickness = 2
UIStroke43.Parent = Unavailable15

local Title5 = Instance.new("TextLabel")
Title5.Name = "Title"
Title5.Size = UDim2.new(0.854506,0,0.108842,0)
Title5.Position = UDim2.new(0.521125,0,0.0306124,0)
Title5.AnchorPoint = Vector2.new(0.5,0)
Title5.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title5.BackgroundTransparency = 1
Title5.BorderSizePixel = 0
Title5.Text = "COM-9165422475759190499"
Title5.TextColor3 = Color3.fromRGB(0,0,0)
Title5.TextSize = 29
Title5.Font = Enum.Font.Arcade
Title5.TextXAlignment = Enum.TextXAlignment.Left
Title5.TextYAlignment = Enum.TextYAlignment.Top
Title5.TextWrapped = true
Title5.TextScaled = true
Title5.RichText = true
Title5.Visible = false
Title5.AutomaticSize = Enum.AutomaticSize.X
Title5.Parent = COM_7986890478983446966

local UITextSizeConstraint6 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint6.Name = "UITextSizeConstraint"
UITextSizeConstraint6.MaxTextSize = 29
UITextSizeConstraint6.Parent = Title5

local UIAspectRatioConstraint8 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint8.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint8.AspectRatio = 0.76
UIAspectRatioConstraint8.Parent = COM_7986890478983446966

local UIListLayout3 = Instance.new("UIListLayout")
UIListLayout3.Name = "UIListLayout"
UIListLayout3.Padding = UDim.new(0.019,0)
UIListLayout3.FillDirection = Enum.FillDirection.Horizontal
UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout3.Wraps = false
UIListLayout3.Parent = Special2

local Special3 = Instance.new("Frame")
Special3.Name = "Special"
Special3.Size = UDim2.new(1.10498,0,0.439953,0)
Special3.Position = UDim2.new(0,0,-0.143337,0)
Special3.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special3.BackgroundTransparency = 1
Special3.BorderColor3 = Color3.fromRGB(0,0,0)
Special3.BorderSizePixel = 0
Special3.Visible = false
Special3.LayoutOrder = -16
Special3.Parent = ScrollingFrame

local COM_901743514273055154 = Instance.new("Frame")
COM_901743514273055154.Name = "COM-901743514273055154"
COM_901743514273055154.Size = UDim2.new(0.894307,0,0.931111,0)
COM_901743514273055154.Position = UDim2.new(-5.79236e-08,0,0,0)
COM_901743514273055154.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_901743514273055154.BackgroundTransparency = 1
COM_901743514273055154.BorderColor3 = Color3.fromRGB(0,0,0)
COM_901743514273055154.BorderSizePixel = 0
COM_901743514273055154.Parent = Special3

local BG6 = Instance.new("Frame")
BG6.Name = "BG"
BG6.Size = UDim2.new(1,0,1,0)
BG6.Position = UDim2.new(0.5,0,0.5,0)
BG6.AnchorPoint = Vector2.new(0.5,0.5)
BG6.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG6.BackgroundTransparency = 1
BG6.BorderColor3 = Color3.fromRGB(0,0,0)
BG6.BorderSizePixel = 0
BG6.ZIndex = -1
BG6.Parent = COM_901743514273055154

local Dropshadow5 = Instance.new("Frame")
Dropshadow5.Name = "Dropshadow"
Dropshadow5.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow5.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow5.AnchorPoint = Vector2.new(0,1)
Dropshadow5.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow5.BackgroundTransparency = 0.5
Dropshadow5.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow5.BorderSizePixel = 0
Dropshadow5.ZIndex = -2
Dropshadow5.Parent = BG6

local UIStroke44 = Instance.new("UIStroke")
UIStroke44.Name = "UIStroke"
UIStroke44.Thickness = 2.79551
UIStroke44.Transparency = 1
UIStroke44.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke44.Parent = Dropshadow5

local Frame6 = Instance.new("Frame")
Frame6.Name = "Frame"
Frame6.Size = UDim2.new(0.984612,0,0.95775,0)
Frame6.Position = UDim2.new(0.506631,0,0.478875,0)
Frame6.AnchorPoint = Vector2.new(0.5,0.5)
Frame6.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame6.BorderColor3 = Color3.fromRGB(0,0,0)
Frame6.BorderSizePixel = 0
Frame6.ZIndex = -1
Frame6.Parent = BG6

local Pattern5 = Instance.new("ImageLabel")
Pattern5.Name = "Pattern"
Pattern5.Size = UDim2.new(0.635249,0,1,0)
Pattern5.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern5.BackgroundTransparency = 1
Pattern5.BorderSizePixel = 0
Pattern5.Image = "rbxassetid://86384941585932"
Pattern5.ImageColor3 = Color3.fromRGB(255,201,76)
Pattern5.ZIndex = -1
Pattern5.Parent = Frame6

local UIStroke45 = Instance.new("UIStroke")
UIStroke45.Name = "UIStroke"
UIStroke45.Thickness = 1.86368
UIStroke45.Parent = Pattern5

local UIStroke46 = Instance.new("UIStroke")
UIStroke46.Name = "UIStroke"
UIStroke46.Thickness = 1.86368
UIStroke46.Parent = Frame6

local Highlight5 = Instance.new("Frame")
Highlight5.Name = "Highlight"
Highlight5.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight5.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight5.AnchorPoint = Vector2.new(0.5,0.5)
Highlight5.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight5.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight5.BorderSizePixel = 0
Highlight5.Visible = false
Highlight5.ZIndex = -2
Highlight5.Parent = BG6

local UIStroke47 = Instance.new("UIStroke")
UIStroke47.Name = "UIStroke"
UIStroke47.Color = Color3.fromRGB(255,242,0)
UIStroke47.Thickness = 2.79551
UIStroke47.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke47.Parent = Highlight5

local CanvasGroup2 = Instance.new("CanvasGroup")
CanvasGroup2.Name = "CanvasGroup"
CanvasGroup2.Size = UDim2.new(1,0,1,0)
CanvasGroup2.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup2.BackgroundTransparency = 1
CanvasGroup2.Parent = COM_901743514273055154

local Thumbnail8 = Instance.new("ImageLabel")
Thumbnail8.Name = "Thumbnail"
Thumbnail8.Size = UDim2.new(0.401091,0,0.993744,0)
Thumbnail8.Position = UDim2.new(0.0961707,0,0.538139,0)
Thumbnail8.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail8.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail8.BackgroundTransparency = 1
Thumbnail8.BorderSizePixel = 0
Thumbnail8.Image = "rbxassetid://72581890955496"
Thumbnail8.ScaleType = Enum.ScaleType.Fit
Thumbnail8.ZIndex = 0
Thumbnail8.Rotation = -11
Thumbnail8.Parent = CanvasGroup2

local Unavailable16 = Instance.new("TextLabel")
Unavailable16.Name = "Unavailable"
Unavailable16.Size = UDim2.new(0.7,0,0.7,0)
Unavailable16.Position = UDim2.new(0.5,0,0.5,0)
Unavailable16.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable16.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable16.BackgroundTransparency = 1
Unavailable16.BorderSizePixel = 0
Unavailable16.Text = "Unavailable"
Unavailable16.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable16.TextSize = 14
Unavailable16.Font = Enum.Font.FredokaOne
Unavailable16.TextWrapped = true
Unavailable16.TextScaled = true
Unavailable16.Visible = false
Unavailable16.Parent = Thumbnail8

local UIStroke48 = Instance.new("UIStroke")
UIStroke48.Name = "UIStroke"
UIStroke48.Thickness = 2
UIStroke48.Parent = Unavailable16

local Thumbnail9 = Instance.new("ImageLabel")
Thumbnail9.Name = "Thumbnail"
Thumbnail9.Size = UDim2.new(0.401091,0,1.04567,0)
Thumbnail9.Position = UDim2.new(0.17826,0,0.412124,0)
Thumbnail9.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail9.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail9.BackgroundTransparency = 1
Thumbnail9.BorderSizePixel = 0
Thumbnail9.Image = "rbxassetid://74140937437882"
Thumbnail9.ScaleType = Enum.ScaleType.Fit
Thumbnail9.ZIndex = -1
Thumbnail9.Rotation = 16
Thumbnail9.Parent = CanvasGroup2

local Unavailable17 = Instance.new("TextLabel")
Unavailable17.Name = "Unavailable"
Unavailable17.Size = UDim2.new(0.7,0,0.7,0)
Unavailable17.Position = UDim2.new(0.5,0,0.5,0)
Unavailable17.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable17.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable17.BackgroundTransparency = 1
Unavailable17.BorderSizePixel = 0
Unavailable17.Text = "Unavailable"
Unavailable17.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable17.TextSize = 14
Unavailable17.Font = Enum.Font.FredokaOne
Unavailable17.TextWrapped = true
Unavailable17.TextScaled = true
Unavailable17.Visible = false
Unavailable17.Parent = Thumbnail9

local UIStroke49 = Instance.new("UIStroke")
UIStroke49.Name = "UIStroke"
UIStroke49.Thickness = 2
UIStroke49.Parent = Unavailable17

local Thumbnail10 = Instance.new("ImageLabel")
Thumbnail10.Name = "Thumbnail"
Thumbnail10.Size = UDim2.new(0.334554,0,0.967788,0)
Thumbnail10.Position = UDim2.new(0.35793,0,0.497652,0)
Thumbnail10.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail10.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail10.BackgroundTransparency = 1
Thumbnail10.BorderSizePixel = 0
Thumbnail10.Image = "rbxassetid://72412129694112"
Thumbnail10.ScaleType = Enum.ScaleType.Fit
Thumbnail10.ZIndex = 0
Thumbnail10.Parent = CanvasGroup2

local Unavailable18 = Instance.new("TextLabel")
Unavailable18.Name = "Unavailable"
Unavailable18.Size = UDim2.new(0.7,0,0.7,0)
Unavailable18.Position = UDim2.new(0.5,0,0.5,0)
Unavailable18.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable18.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable18.BackgroundTransparency = 1
Unavailable18.BorderSizePixel = 0
Unavailable18.Text = "Unavailable"
Unavailable18.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable18.TextSize = 14
Unavailable18.Font = Enum.Font.FredokaOne
Unavailable18.TextWrapped = true
Unavailable18.TextScaled = true
Unavailable18.Visible = false
Unavailable18.Parent = Thumbnail10

local UIStroke50 = Instance.new("UIStroke")
UIStroke50.Name = "UIStroke"
UIStroke50.Thickness = 2
UIStroke50.Parent = Unavailable18

local DisplayTitle5 = Instance.new("TextLabel")
DisplayTitle5.Name = "DisplayTitle"
DisplayTitle5.Size = UDim2.new(0.28831,0,0.367128,0)
DisplayTitle5.Position = UDim2.new(0.814632,0,0.191717,0)
DisplayTitle5.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle5.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle5.BackgroundTransparency = 1
DisplayTitle5.BorderSizePixel = 0
DisplayTitle5.Text = "Lost Prince Gourdy 14\" Deluxe Plush (Pre-Order)"
DisplayTitle5.TextColor3 = Color3.fromRGB(0,0,0)
DisplayTitle5.TextSize = 29
DisplayTitle5.Font = Enum.Font.Arcade
DisplayTitle5.TextWrapped = true
DisplayTitle5.TextScaled = true
DisplayTitle5.RichText = true
DisplayTitle5.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle5.Parent = COM_901743514273055154

local UIAspectRatioConstraint9 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint9.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint9.AspectRatio = 2.66
UIAspectRatioConstraint9.Parent = DisplayTitle5

local UIGradient13 = Instance.new("UIGradient")
UIGradient13.Name = "UIGradient"
UIGradient13.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient13.Rotation = -90
UIGradient13.Offset = Vector2.new(0,0)
UIGradient13.Enabled = false
UIGradient13.Parent = DisplayTitle5

local UIStroke51 = Instance.new("UIStroke")
UIStroke51.Name = "UIStroke"
UIStroke51.Color = Color3.fromRGB(255,255,255)
UIStroke51.Thickness = 0.931838
UIStroke51.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke51.Parent = DisplayTitle5

local Item6 = Instance.new("ImageLabel")
Item6.Name = "Item"
Item6.Size = UDim2.new(0.913665,0,0.651761,0)
Item6.Position = UDim2.new(0.514096,0,0.463834,0)
Item6.AnchorPoint = Vector2.new(0.5,0.5)
Item6.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item6.BackgroundTransparency = 1
Item6.BorderSizePixel = 0
Item6.Image = "rbxassetid://94959635148921"
Item6.ImageRectOffset = Vector2.new(15,15)
Item6.ImageRectSize = Vector2.new(270,270)
Item6.ScaleType = Enum.ScaleType.Fit
Item6.Visible = false
Item6.ZIndex = -1
Item6.Parent = COM_901743514273055154

local Unavailable19 = Instance.new("TextLabel")
Unavailable19.Name = "Unavailable"
Unavailable19.Size = UDim2.new(0.7,0,0.7,0)
Unavailable19.Position = UDim2.new(0.5,0,0.5,0)
Unavailable19.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable19.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable19.BackgroundTransparency = 1
Unavailable19.BorderSizePixel = 0
Unavailable19.Text = "Unavailable"
Unavailable19.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable19.TextSize = 14
Unavailable19.Font = Enum.Font.FredokaOne
Unavailable19.TextWrapped = true
Unavailable19.TextScaled = true
Unavailable19.Visible = false
Unavailable19.Parent = Item6

local UIStroke52 = Instance.new("UIStroke")
UIStroke52.Name = "UIStroke"
UIStroke52.Thickness = 2
UIStroke52.Parent = Unavailable19

local New2 = Instance.new("ImageLabel")
New2.Name = "New"
New2.Size = UDim2.new(0.322123,0,0.355513,0)
New2.Position = UDim2.new(0.928356,0,0.0669836,0)
New2.AnchorPoint = Vector2.new(0.5,0.5)
New2.BackgroundColor3 = Color3.fromRGB(255,255,255)
New2.BackgroundTransparency = 1
New2.BorderSizePixel = 0
New2.Image = "rbxassetid://96728750855907"
New2.ScaleType = Enum.ScaleType.Fit
New2.ZIndex = -1
New2.Parent = COM_901743514273055154

local UIScale9 = Instance.new("UIScale")
UIScale9.Name = "UIScale"
UIScale9.Parent = New2

local Purchase6 = Instance.new("ImageButton")
Purchase6.Name = "Purchase"
Purchase6.Size = UDim2.new(0.299855,0,0.201102,0)
Purchase6.Position = UDim2.new(0.814697,0,0.786462,0)
Purchase6.AnchorPoint = Vector2.new(0.5,0.5)
Purchase6.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase6.BorderSizePixel = 0
Purchase6.ScaleType = Enum.ScaleType.Fit
Purchase6.AutoButtonColor = false
Purchase6.Parent = COM_901743514273055154

local Price6 = Instance.new("TextLabel")
Price6.Name = "Price"
Price6.Size = UDim2.new(0.78479,0,0.702682,0)
Price6.Position = UDim2.new(0.100663,0,0.0990811,0)
Price6.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price6.BackgroundTransparency = 1
Price6.BorderSizePixel = 0
Price6.Text = "$19.99"
Price6.TextColor3 = Color3.fromRGB(255,255,255)
Price6.TextSize = 14
Price6.Font = Enum.Font.Arcade
Price6.TextWrapped = true
Price6.TextScaled = true
Price6.RichText = true
Price6.AutomaticSize = Enum.AutomaticSize.X
Price6.Parent = Purchase6

local UIGradient14 = Instance.new("UIGradient")
UIGradient14.Name = "UIGradient"
UIGradient14.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient14.Rotation = -90
UIGradient14.Offset = Vector2.new(0,0)
UIGradient14.Parent = Price6

local UIStroke53 = Instance.new("UIStroke")
UIStroke53.Name = "UIStroke"
UIStroke53.Thickness = 0.931838
UIStroke53.Parent = Price6

local UICorner7 = Instance.new("UICorner")
UICorner7.Name = "UICorner"
UICorner7.CornerRadius = UDim.new(1,0)
UICorner7.Parent = Purchase6

local UIGradient15 = Instance.new("UIGradient")
UIGradient15.Name = "UIGradient"
UIGradient15.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient15.Rotation = -90
UIGradient15.Offset = Vector2.new(0,0)
UIGradient15.Parent = Purchase6

local UIScale10 = Instance.new("UIScale")
UIScale10.Name = "UIScale"
UIScale10.Parent = Purchase6

local UIStroke54 = Instance.new("UIStroke")
UIStroke54.Name = "UIStroke"
UIStroke54.Thickness = 1.1648
UIStroke54.Parent = Purchase6

local Thumbnail11 = Instance.new("ImageLabel")
Thumbnail11.Name = "Thumbnail"
Thumbnail11.Size = UDim2.new(0.48234,0,1.34851,0)
Thumbnail11.Position = UDim2.new(0.551555,0,0.39973,0)
Thumbnail11.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail11.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail11.BackgroundTransparency = 1
Thumbnail11.BorderSizePixel = 0
Thumbnail11.Image = "rbxassetid://72961504551056"
Thumbnail11.ScaleType = Enum.ScaleType.Fit
Thumbnail11.ZIndex = 2
Thumbnail11.Parent = COM_901743514273055154

local Unavailable20 = Instance.new("TextLabel")
Unavailable20.Name = "Unavailable"
Unavailable20.Size = UDim2.new(0.7,0,0.7,0)
Unavailable20.Position = UDim2.new(0.5,0,0.5,0)
Unavailable20.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable20.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable20.BackgroundTransparency = 1
Unavailable20.BorderSizePixel = 0
Unavailable20.Text = "Unavailable"
Unavailable20.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable20.TextSize = 14
Unavailable20.Font = Enum.Font.FredokaOne
Unavailable20.TextWrapped = true
Unavailable20.TextScaled = true
Unavailable20.Visible = false
Unavailable20.Parent = Thumbnail11

local UIStroke55 = Instance.new("UIStroke")
UIStroke55.Name = "UIStroke"
UIStroke55.Thickness = 2
UIStroke55.Parent = Unavailable20

local Title6 = Instance.new("TextLabel")
Title6.Name = "Title"
Title6.Size = UDim2.new(0.566559,0,0.435422,0)
Title6.Position = UDim2.new(0.65544,0,0.15042,0)
Title6.AnchorPoint = Vector2.new(0.5,0)
Title6.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title6.BackgroundTransparency = 1
Title6.BorderSizePixel = 0
Title6.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title6.TextColor3 = Color3.fromRGB(0,13,76)
Title6.TextSize = 29
Title6.Font = Enum.Font.Arcade
Title6.TextWrapped = true
Title6.TextScaled = true
Title6.RichText = true
Title6.Visible = false
Title6.AutomaticSize = Enum.AutomaticSize.X
Title6.Parent = COM_901743514273055154

local UIGradient16 = Instance.new("UIGradient")
UIGradient16.Name = "UIGradient"
UIGradient16.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient16.Rotation = -90
UIGradient16.Offset = Vector2.new(0,0)
UIGradient16.Parent = Title6

local UIStroke56 = Instance.new("UIStroke")
UIStroke56.Name = "UIStroke"
UIStroke56.Color = Color3.fromRGB(255,255,255)
UIStroke56.Thickness = 2
UIStroke56.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke56.Parent = Title6

local UIListLayout4 = Instance.new("UIListLayout")
UIListLayout4.Name = "UIListLayout"
UIListLayout4.Padding = UDim.new(0.019,0)
UIListLayout4.FillDirection = Enum.FillDirection.Horizontal
UIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout4.Wraps = false
UIListLayout4.Parent = Special3

local Special4 = Instance.new("Frame")
Special4.Name = "Special"
Special4.Size = UDim2.new(0.728,0,0.493,0)
Special4.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
Special4.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special4.BackgroundTransparency = 1
Special4.BorderColor3 = Color3.fromRGB(0,0,0)
Special4.BorderSizePixel = 0
Special4.LayoutOrder = -16
Special4.Parent = ScrollingFrame

local COM_9017435142730551542 = Instance.new("Frame")
COM_9017435142730551542.Name = "COM-901743514273055154"
COM_9017435142730551542.Size = UDim2.new(0.894198,0,0.931112,0)
COM_9017435142730551542.Position = UDim2.new(5.4771e-08,0,0,0)
COM_9017435142730551542.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_9017435142730551542.BackgroundTransparency = 1
COM_9017435142730551542.BorderColor3 = Color3.fromRGB(0,0,0)
COM_9017435142730551542.BorderSizePixel = 0
COM_9017435142730551542.ZIndex = 2
COM_9017435142730551542.Parent = Special4

local BG7 = Instance.new("Frame")
BG7.Name = "BG"
BG7.Size = UDim2.new(1,0,1,0)
BG7.Position = UDim2.new(0.5,0,0.5,0)
BG7.AnchorPoint = Vector2.new(0.5,0.5)
BG7.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG7.BackgroundTransparency = 1
BG7.BorderColor3 = Color3.fromRGB(0,0,0)
BG7.BorderSizePixel = 0
BG7.ZIndex = -1
BG7.Parent = COM_9017435142730551542

local Dropshadow6 = Instance.new("Frame")
Dropshadow6.Name = "Dropshadow"
Dropshadow6.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow6.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow6.AnchorPoint = Vector2.new(0,1)
Dropshadow6.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow6.BackgroundTransparency = 0.5
Dropshadow6.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow6.BorderSizePixel = 0
Dropshadow6.ZIndex = -2
Dropshadow6.Parent = BG7

local UIStroke57 = Instance.new("UIStroke")
UIStroke57.Name = "UIStroke"
UIStroke57.Thickness = 2.79551
UIStroke57.Transparency = 1
UIStroke57.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke57.Parent = Dropshadow6

local Frame7 = Instance.new("Frame")
Frame7.Name = "Frame"
Frame7.Size = UDim2.new(0.984612,0,0.95775,0)
Frame7.Position = UDim2.new(0.506631,0,0.478875,0)
Frame7.AnchorPoint = Vector2.new(0.5,0.5)
Frame7.BackgroundColor3 = Color3.fromRGB(0,148,216)
Frame7.BorderColor3 = Color3.fromRGB(0,0,0)
Frame7.BorderSizePixel = 0
Frame7.ZIndex = -1
Frame7.Parent = BG7

local Pattern6 = Instance.new("ImageLabel")
Pattern6.Name = "Pattern"
Pattern6.Size = UDim2.new(1,0,1,0)
Pattern6.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern6.BackgroundTransparency = 1
Pattern6.BorderSizePixel = 0
Pattern6.Image = "rbxassetid://86384941585932"
Pattern6.ImageColor3 = Color3.fromRGB(255,201,76)
Pattern6.ZIndex = -1
Pattern6.Parent = Frame7

local UIStroke58 = Instance.new("UIStroke")
UIStroke58.Name = "UIStroke"
UIStroke58.Thickness = 1.86368
UIStroke58.Parent = Pattern6

local UIGradient17 = Instance.new("UIGradient")
UIGradient17.Name = "UIGradient"
UIGradient17.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient17.Rotation = 90
UIGradient17.Offset = Vector2.new(0,0)
UIGradient17.Parent = Frame7

local UIStroke59 = Instance.new("UIStroke")
UIStroke59.Name = "UIStroke"
UIStroke59.Thickness = 1.86368
UIStroke59.Parent = Frame7

local Highlight6 = Instance.new("Frame")
Highlight6.Name = "Highlight"
Highlight6.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight6.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight6.AnchorPoint = Vector2.new(0.5,0.5)
Highlight6.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight6.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight6.BorderSizePixel = 0
Highlight6.Visible = false
Highlight6.ZIndex = -2
Highlight6.Parent = BG7

local UIStroke60 = Instance.new("UIStroke")
UIStroke60.Name = "UIStroke"
UIStroke60.Color = Color3.fromRGB(255,242,0)
UIStroke60.Thickness = 2.79551
UIStroke60.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke60.Parent = Highlight6

local CanvasGroup3 = Instance.new("CanvasGroup")
CanvasGroup3.Name = "CanvasGroup"
CanvasGroup3.Size = UDim2.new(0.970515,0,0.95775,0)
CanvasGroup3.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup3.BackgroundTransparency = 1
CanvasGroup3.Parent = COM_9017435142730551542

local Thumbnail12 = Instance.new("ImageLabel")
Thumbnail12.Name = "Thumbnail"
Thumbnail12.Size = UDim2.new(0.470619,0,1.14854,0)
Thumbnail12.Position = UDim2.new(0.165209,0,0.529027,0)
Thumbnail12.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail12.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail12.BackgroundTransparency = 1
Thumbnail12.BorderSizePixel = 0
Thumbnail12.Image = "rbxassetid://72581890955496"
Thumbnail12.ScaleType = Enum.ScaleType.Fit
Thumbnail12.Rotation = -11
Thumbnail12.Parent = CanvasGroup3

local Unavailable21 = Instance.new("TextLabel")
Unavailable21.Name = "Unavailable"
Unavailable21.Size = UDim2.new(0.7,0,0.7,0)
Unavailable21.Position = UDim2.new(0.5,0,0.5,0)
Unavailable21.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable21.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable21.BackgroundTransparency = 1
Unavailable21.BorderSizePixel = 0
Unavailable21.Text = "Unavailable"
Unavailable21.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable21.TextSize = 14
Unavailable21.Font = Enum.Font.FredokaOne
Unavailable21.TextWrapped = true
Unavailable21.TextScaled = true
Unavailable21.Visible = false
Unavailable21.Parent = Thumbnail12

local UIStroke61 = Instance.new("UIStroke")
UIStroke61.Name = "UIStroke"
UIStroke61.Thickness = 2
UIStroke61.Parent = Unavailable21

local DisplayTitle6 = Instance.new("TextLabel")
DisplayTitle6.Name = "DisplayTitle"
DisplayTitle6.Size = UDim2.new(0.447811,0,0.334729,0)
DisplayTitle6.Position = UDim2.new(0.752098,0,0.261677,0)
DisplayTitle6.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle6.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle6.BackgroundTransparency = 1
DisplayTitle6.BorderSizePixel = 0
DisplayTitle6.Text = "Lost Prince Gourdy 14\" Deluxe Plush (Pre-Order)"
DisplayTitle6.TextColor3 = Color3.fromRGB(2,40,0)
DisplayTitle6.TextSize = 29
DisplayTitle6.Font = Enum.Font.Arcade
DisplayTitle6.TextWrapped = true
DisplayTitle6.TextScaled = true
DisplayTitle6.RichText = true
DisplayTitle6.Parent = COM_9017435142730551542

local UIGradient18 = Instance.new("UIGradient")
UIGradient18.Name = "UIGradient"
UIGradient18.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient18.Rotation = -90
UIGradient18.Offset = Vector2.new(0,0)
UIGradient18.Parent = DisplayTitle6

local UIStroke62 = Instance.new("UIStroke")
UIStroke62.Name = "UIStroke"
UIStroke62.Color = Color3.fromRGB(255,255,255)
UIStroke62.Thickness = 0.931838
UIStroke62.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke62.Parent = DisplayTitle6

local Item7 = Instance.new("ImageLabel")
Item7.Name = "Item"
Item7.Size = UDim2.new(0.913665,0,0.651761,0)
Item7.Position = UDim2.new(0.514096,0,0.463834,0)
Item7.AnchorPoint = Vector2.new(0.5,0.5)
Item7.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item7.BackgroundTransparency = 1
Item7.BorderSizePixel = 0
Item7.Image = "rbxassetid://94959635148921"
Item7.ImageRectOffset = Vector2.new(15,15)
Item7.ImageRectSize = Vector2.new(270,270)
Item7.ScaleType = Enum.ScaleType.Fit
Item7.Visible = false
Item7.ZIndex = -1
Item7.Parent = COM_9017435142730551542

local Unavailable22 = Instance.new("TextLabel")
Unavailable22.Name = "Unavailable"
Unavailable22.Size = UDim2.new(0.7,0,0.7,0)
Unavailable22.Position = UDim2.new(0.5,0,0.5,0)
Unavailable22.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable22.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable22.BackgroundTransparency = 1
Unavailable22.BorderSizePixel = 0
Unavailable22.Text = "Unavailable"
Unavailable22.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable22.TextSize = 14
Unavailable22.Font = Enum.Font.FredokaOne
Unavailable22.TextWrapped = true
Unavailable22.TextScaled = true
Unavailable22.Visible = false
Unavailable22.Parent = Item7

local UIStroke63 = Instance.new("UIStroke")
UIStroke63.Name = "UIStroke"
UIStroke63.Thickness = 2
UIStroke63.Parent = Unavailable22

local New3 = Instance.new("ImageLabel")
New3.Name = "New"
New3.Size = UDim2.new(0.322123,0,0.355513,0)
New3.Position = UDim2.new(0.874755,0,0.110529,0)
New3.AnchorPoint = Vector2.new(0.5,0.5)
New3.BackgroundColor3 = Color3.fromRGB(255,255,255)
New3.BackgroundTransparency = 1
New3.BorderSizePixel = 0
New3.Image = "rbxassetid://96728750855907"
New3.ScaleType = Enum.ScaleType.Fit
New3.Visible = false
New3.ZIndex = -1
New3.Parent = COM_9017435142730551542

local UIScale11 = Instance.new("UIScale")
UIScale11.Name = "UIScale"
UIScale11.Parent = New3

local Purchase7 = Instance.new("ImageButton")
Purchase7.Name = "Purchase"
Purchase7.Size = UDim2.new(0.436835,0,0.172928,0)
Purchase7.Position = UDim2.new(0.752098,0,0.833662,0)
Purchase7.AnchorPoint = Vector2.new(0.5,0.5)
Purchase7.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase7.BorderSizePixel = 0
Purchase7.ScaleType = Enum.ScaleType.Fit
Purchase7.AutoButtonColor = false
Purchase7.ZIndex = 5
Purchase7.Parent = COM_9017435142730551542

local Price7 = Instance.new("TextLabel")
Price7.Name = "Price"
Price7.Size = UDim2.new(0.78479,0,0.702682,0)
Price7.Position = UDim2.new(0.100663,0,0.0990811,0)
Price7.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price7.BackgroundTransparency = 1
Price7.BorderSizePixel = 0
Price7.Text = "$19.99"
Price7.TextColor3 = Color3.fromRGB(255,255,255)
Price7.TextSize = 14
Price7.Font = Enum.Font.Arcade
Price7.TextWrapped = true
Price7.TextScaled = true
Price7.RichText = true
Price7.AutomaticSize = Enum.AutomaticSize.X
Price7.Parent = Purchase7

local UIGradient19 = Instance.new("UIGradient")
UIGradient19.Name = "UIGradient"
UIGradient19.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient19.Rotation = -90
UIGradient19.Offset = Vector2.new(0,0)
UIGradient19.Parent = Price7

local UIStroke64 = Instance.new("UIStroke")
UIStroke64.Name = "UIStroke"
UIStroke64.Thickness = 0.931838
UIStroke64.Parent = Price7

local UICorner8 = Instance.new("UICorner")
UICorner8.Name = "UICorner"
UICorner8.CornerRadius = UDim.new(1,0)
UICorner8.Parent = Purchase7

local UIGradient20 = Instance.new("UIGradient")
UIGradient20.Name = "UIGradient"
UIGradient20.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient20.Rotation = -90
UIGradient20.Offset = Vector2.new(0,0)
UIGradient20.Parent = Purchase7

local UIScale12 = Instance.new("UIScale")
UIScale12.Name = "UIScale"
UIScale12.Parent = Purchase7

local UIStroke65 = Instance.new("UIStroke")
UIStroke65.Name = "UIStroke"
UIStroke65.Thickness = 1.1648
UIStroke65.Parent = Purchase7

local Thumbnail13 = Instance.new("ImageLabel")
Thumbnail13.Name = "Thumbnail"
Thumbnail13.Size = UDim2.new(0.48234,0,1.2575,0)
Thumbnail13.Position = UDim2.new(0.42096,0,0.450994,0)
Thumbnail13.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail13.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail13.BackgroundTransparency = 1
Thumbnail13.BorderSizePixel = 0
Thumbnail13.Image = "rbxassetid://72961504551056"
Thumbnail13.ScaleType = Enum.ScaleType.Fit
Thumbnail13.ZIndex = 4
Thumbnail13.Parent = COM_9017435142730551542

local Unavailable23 = Instance.new("TextLabel")
Unavailable23.Name = "Unavailable"
Unavailable23.Size = UDim2.new(0.7,0,0.7,0)
Unavailable23.Position = UDim2.new(0.5,0,0.5,0)
Unavailable23.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable23.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable23.BackgroundTransparency = 1
Unavailable23.BorderSizePixel = 0
Unavailable23.Text = "Unavailable"
Unavailable23.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable23.TextSize = 14
Unavailable23.Font = Enum.Font.FredokaOne
Unavailable23.TextWrapped = true
Unavailable23.TextScaled = true
Unavailable23.Visible = false
Unavailable23.Parent = Thumbnail13

local UIStroke66 = Instance.new("UIStroke")
UIStroke66.Name = "UIStroke"
UIStroke66.Thickness = 2
UIStroke66.Parent = Unavailable23

local Title7 = Instance.new("TextLabel")
Title7.Name = "Title"
Title7.Size = UDim2.new(0.566559,0,0.435422,0)
Title7.Position = UDim2.new(0.65544,0,0.15042,0)
Title7.AnchorPoint = Vector2.new(0.5,0)
Title7.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title7.BackgroundTransparency = 1
Title7.BorderSizePixel = 0
Title7.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title7.TextColor3 = Color3.fromRGB(0,13,76)
Title7.TextSize = 29
Title7.Font = Enum.Font.Arcade
Title7.TextWrapped = true
Title7.TextScaled = true
Title7.RichText = true
Title7.Visible = false
Title7.AutomaticSize = Enum.AutomaticSize.X
Title7.Parent = COM_9017435142730551542

local UIGradient21 = Instance.new("UIGradient")
UIGradient21.Name = "UIGradient"
UIGradient21.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient21.Rotation = -90
UIGradient21.Offset = Vector2.new(0,0)
UIGradient21.Parent = Title7

local UIStroke67 = Instance.new("UIStroke")
UIStroke67.Name = "UIStroke"
UIStroke67.Color = Color3.fromRGB(255,255,255)
UIStroke67.Thickness = 2
UIStroke67.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke67.Parent = Title7

local UIListLayout5 = Instance.new("UIListLayout")
UIListLayout5.Name = "UIListLayout"
UIListLayout5.Padding = UDim.new(0.019,0)
UIListLayout5.FillDirection = Enum.FillDirection.Horizontal
UIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout5.Wraps = false
UIListLayout5.Parent = Special4

local COM_99712748581159367 = Instance.new("Frame")
COM_99712748581159367.Name = "COM-99712748581159367"
COM_99712748581159367.Size = UDim2.new(0.442523,0,0.944677,0)
COM_99712748581159367.Position = UDim2.new(0.913307,0,0,0)
COM_99712748581159367.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_99712748581159367.BackgroundTransparency = 1
COM_99712748581159367.BorderColor3 = Color3.fromRGB(0,0,0)
COM_99712748581159367.BorderSizePixel = 0
COM_99712748581159367.LayoutOrder = 1
COM_99712748581159367.Parent = Special4

local BG8 = Instance.new("Frame")
BG8.Name = "BG"
BG8.Size = UDim2.new(1,0,1,0)
BG8.Position = UDim2.new(0.5,0,0.5,0)
BG8.AnchorPoint = Vector2.new(0.5,0.5)
BG8.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG8.BackgroundTransparency = 1
BG8.BorderColor3 = Color3.fromRGB(0,0,0)
BG8.BorderSizePixel = 0
BG8.ZIndex = -2
BG8.Parent = COM_99712748581159367

local Dropshadow7 = Instance.new("Frame")
Dropshadow7.Name = "Dropshadow"
Dropshadow7.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow7.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow7.AnchorPoint = Vector2.new(0,1)
Dropshadow7.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow7.BackgroundTransparency = 0.5
Dropshadow7.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow7.BorderSizePixel = 0
Dropshadow7.ZIndex = -2
Dropshadow7.Parent = BG8

local UIStroke68 = Instance.new("UIStroke")
UIStroke68.Name = "UIStroke"
UIStroke68.Thickness = 2.79551
UIStroke68.Transparency = 1
UIStroke68.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke68.Parent = Dropshadow7

local Frame8 = Instance.new("Frame")
Frame8.Name = "Frame"
Frame8.Size = UDim2.new(0.984612,0,0.95775,0)
Frame8.Position = UDim2.new(0.506631,0,0.478875,0)
Frame8.AnchorPoint = Vector2.new(0.5,0.5)
Frame8.BackgroundColor3 = Color3.fromRGB(0,148,216)
Frame8.BorderColor3 = Color3.fromRGB(0,0,0)
Frame8.BorderSizePixel = 0
Frame8.ZIndex = -1
Frame8.Parent = BG8

local Pattern7 = Instance.new("ImageLabel")
Pattern7.Name = "Pattern"
Pattern7.Size = UDim2.new(1,0,1,0)
Pattern7.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern7.BackgroundTransparency = 1
Pattern7.BorderSizePixel = 0
Pattern7.Image = "rbxassetid://86384941585932"
Pattern7.ImageColor3 = Color3.fromRGB(130,101,39)
Pattern7.ScaleType = Enum.ScaleType.Crop
Pattern7.ZIndex = -1
Pattern7.Parent = Frame8

local UIStroke69 = Instance.new("UIStroke")
UIStroke69.Name = "UIStroke"
UIStroke69.Thickness = 1.86368
UIStroke69.Parent = Pattern7

local UIGradient22 = Instance.new("UIGradient")
UIGradient22.Name = "UIGradient"
UIGradient22.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient22.Rotation = 90
UIGradient22.Offset = Vector2.new(0,0)
UIGradient22.Parent = Frame8

local UIStroke70 = Instance.new("UIStroke")
UIStroke70.Name = "UIStroke"
UIStroke70.Thickness = 1.86368
UIStroke70.Parent = Frame8

local Highlight7 = Instance.new("Frame")
Highlight7.Name = "Highlight"
Highlight7.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight7.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight7.AnchorPoint = Vector2.new(0.5,0.5)
Highlight7.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight7.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight7.BorderSizePixel = 0
Highlight7.Visible = false
Highlight7.ZIndex = -2
Highlight7.Parent = BG8

local UIStroke71 = Instance.new("UIStroke")
UIStroke71.Name = "UIStroke"
UIStroke71.Color = Color3.fromRGB(255,242,0)
UIStroke71.Thickness = 2.79551
UIStroke71.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke71.Parent = Highlight7

local Item8 = Instance.new("ImageLabel")
Item8.Name = "Item"
Item8.Size = UDim2.new(0.902423,0,0.651761,0)
Item8.Position = UDim2.new(0.521125,0,0.463834,0)
Item8.AnchorPoint = Vector2.new(0.5,0.5)
Item8.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item8.BackgroundTransparency = 1
Item8.BorderSizePixel = 0
Item8.Image = "rbxassetid://94959635148921"
Item8.ImageRectOffset = Vector2.new(25,25)
Item8.ImageRectSize = Vector2.new(250,250)
Item8.ScaleType = Enum.ScaleType.Crop
Item8.Visible = false
Item8.ZIndex = -1
Item8.Parent = COM_99712748581159367

local Unavailable24 = Instance.new("TextLabel")
Unavailable24.Name = "Unavailable"
Unavailable24.Size = UDim2.new(0.7,0,0.7,0)
Unavailable24.Position = UDim2.new(0.5,0,0.5,0)
Unavailable24.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable24.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable24.BackgroundTransparency = 1
Unavailable24.BorderSizePixel = 0
Unavailable24.Text = "Unavailable"
Unavailable24.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable24.TextSize = 14
Unavailable24.Font = Enum.Font.FredokaOne
Unavailable24.TextWrapped = true
Unavailable24.TextScaled = true
Unavailable24.Visible = false
Unavailable24.Parent = Item8

local UIStroke72 = Instance.new("UIStroke")
UIStroke72.Name = "UIStroke"
UIStroke72.Thickness = 2
UIStroke72.Parent = Unavailable24

local New4 = Instance.new("ImageLabel")
New4.Name = "New"
New4.Size = UDim2.new(0.438881,0,0.589977,0)
New4.Position = UDim2.new(0.854234,0,0.0954656,0)
New4.AnchorPoint = Vector2.new(0.5,0.5)
New4.BackgroundColor3 = Color3.fromRGB(255,255,255)
New4.BackgroundTransparency = 1
New4.BorderSizePixel = 0
New4.Image = "rbxassetid://96728750855907"
New4.ScaleType = Enum.ScaleType.Fit
New4.ZIndex = -1
New4.Parent = COM_99712748581159367

local UIScale13 = Instance.new("UIScale")
UIScale13.Name = "UIScale"
UIScale13.Parent = New4

local Pixel4 = Instance.new("ImageLabel")
Pixel4.Name = "Pixel"
Pixel4.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel4.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel4.AnchorPoint = Vector2.new(0.5,0.5)
Pixel4.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel4.BorderSizePixel = 0
Pixel4.Image = "rbxassetid://94959635148921"
Pixel4.ImageRectOffset = Vector2.new(55,100)
Pixel4.ImageRectSize = Vector2.new(30,30)
Pixel4.ScaleType = Enum.ScaleType.Crop
Pixel4.Visible = false
Pixel4.ZIndex = 5
Pixel4.Parent = COM_99712748581159367

local Unavailable25 = Instance.new("TextLabel")
Unavailable25.Name = "Unavailable"
Unavailable25.Size = UDim2.new(0.7,0,0.7,0)
Unavailable25.Position = UDim2.new(0.5,0,0.5,0)
Unavailable25.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable25.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable25.BackgroundTransparency = 1
Unavailable25.BorderSizePixel = 0
Unavailable25.Text = "Unavailable"
Unavailable25.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable25.TextSize = 14
Unavailable25.Font = Enum.Font.FredokaOne
Unavailable25.TextWrapped = true
Unavailable25.TextScaled = true
Unavailable25.Visible = false
Unavailable25.Parent = Pixel4

local UIStroke73 = Instance.new("UIStroke")
UIStroke73.Name = "UIStroke"
UIStroke73.Thickness = 2
UIStroke73.Parent = Unavailable25

local Purchase8 = Instance.new("ImageButton")
Purchase8.Name = "Purchase"
Purchase8.Size = UDim2.new(0.863319,0,0.170445,0)
Purchase8.Position = UDim2.new(0.514166,0,0.821691,0)
Purchase8.AnchorPoint = Vector2.new(0.5,0.5)
Purchase8.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase8.BorderSizePixel = 0
Purchase8.ScaleType = Enum.ScaleType.Fit
Purchase8.AutoButtonColor = false
Purchase8.ZIndex = 6
Purchase8.Parent = COM_99712748581159367

local Price8 = Instance.new("TextLabel")
Price8.Name = "Price"
Price8.Size = UDim2.new(0.78479,0,0.702682,0)
Price8.Position = UDim2.new(0.100663,0,0.0990811,0)
Price8.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price8.BackgroundTransparency = 1
Price8.BorderSizePixel = 0
Price8.Text = "$19.99"
Price8.TextColor3 = Color3.fromRGB(255,255,255)
Price8.TextSize = 14
Price8.Font = Enum.Font.Arcade
Price8.TextWrapped = true
Price8.TextScaled = true
Price8.RichText = true
Price8.AutomaticSize = Enum.AutomaticSize.X
Price8.Parent = Purchase8

local UIGradient23 = Instance.new("UIGradient")
UIGradient23.Name = "UIGradient"
UIGradient23.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient23.Rotation = -90
UIGradient23.Offset = Vector2.new(0,0)
UIGradient23.Parent = Price8

local UIStroke74 = Instance.new("UIStroke")
UIStroke74.Name = "UIStroke"
UIStroke74.Thickness = 2
UIStroke74.Parent = Price8

local UICorner9 = Instance.new("UICorner")
UICorner9.Name = "UICorner"
UICorner9.CornerRadius = UDim.new(1,0)
UICorner9.Parent = Purchase8

local UIGradient24 = Instance.new("UIGradient")
UIGradient24.Name = "UIGradient"
UIGradient24.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient24.Rotation = -90
UIGradient24.Offset = Vector2.new(0,0)
UIGradient24.Parent = Purchase8

local UIScale14 = Instance.new("UIScale")
UIScale14.Name = "UIScale"
UIScale14.Parent = Purchase8

local UIStroke75 = Instance.new("UIStroke")
UIStroke75.Name = "UIStroke"
UIStroke75.Thickness = 2.5
UIStroke75.Parent = Purchase8

local Thumbnail14 = Instance.new("ImageLabel")
Thumbnail14.Name = "Thumbnail"
Thumbnail14.Size = UDim2.new(1.15659,0,0.857211,0)
Thumbnail14.Position = UDim2.new(0.495381,0,0.470327,0)
Thumbnail14.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail14.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail14.BackgroundTransparency = 1
Thumbnail14.BorderSizePixel = 0
Thumbnail14.Image = "rbxassetid://81743399983990"
Thumbnail14.ScaleType = Enum.ScaleType.Crop
Thumbnail14.ZIndex = -1
Thumbnail14.Parent = COM_99712748581159367

local Unavailable26 = Instance.new("TextLabel")
Unavailable26.Name = "Unavailable"
Unavailable26.Size = UDim2.new(0.7,0,0.7,0)
Unavailable26.Position = UDim2.new(0.5,0,0.5,0)
Unavailable26.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable26.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable26.BackgroundTransparency = 1
Unavailable26.BorderSizePixel = 0
Unavailable26.Text = "Unavailable"
Unavailable26.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable26.TextSize = 14
Unavailable26.Font = Enum.Font.FredokaOne
Unavailable26.TextWrapped = true
Unavailable26.TextScaled = true
Unavailable26.Visible = false
Unavailable26.Parent = Thumbnail14

local UIStroke76 = Instance.new("UIStroke")
UIStroke76.Name = "UIStroke"
UIStroke76.Thickness = 2
UIStroke76.Parent = Unavailable26

local Title8 = Instance.new("TextLabel")
Title8.Name = "Title"
Title8.Size = UDim2.new(0.874784,0,0.149,0)
Title8.Position = UDim2.new(0.531264,0,0.0306123,0)
Title8.AnchorPoint = Vector2.new(0.5,0)
Title8.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title8.BackgroundTransparency = 1
Title8.BorderSizePixel = 0
Title8.Text = "Bobette 11” x 14” Poster"
Title8.TextColor3 = Color3.fromRGB(0,0,0)
Title8.TextSize = 29
Title8.Font = Enum.Font.Arcade
Title8.TextXAlignment = Enum.TextXAlignment.Left
Title8.TextYAlignment = Enum.TextYAlignment.Top
Title8.TextWrapped = true
Title8.TextScaled = true
Title8.RichText = true
Title8.Visible = false
Title8.AutomaticSize = Enum.AutomaticSize.X
Title8.Parent = COM_99712748581159367

local UITextSizeConstraint7 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint7.Name = "UITextSizeConstraint"
UITextSizeConstraint7.MaxTextSize = 29
UITextSizeConstraint7.Parent = Title8

local Special5 = Instance.new("Frame")
Special5.Name = "Special"
Special5.Size = UDim2.new(1.10498,0,0.439953,0)
Special5.Position = UDim2.new(0,0,-0.143337,0)
Special5.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special5.BackgroundTransparency = 1
Special5.BorderColor3 = Color3.fromRGB(0,0,0)
Special5.BorderSizePixel = 0
Special5.LayoutOrder = -15
Special5.Parent = ScrollingFrame

local COM_8523425560376639946 = Instance.new("Frame")
COM_8523425560376639946.Name = "COM-8523425560376639946"
COM_8523425560376639946.Size = UDim2.new(0.894307,0,0.931111,0)
COM_8523425560376639946.Position = UDim2.new(-5.79236e-08,0,0,0)
COM_8523425560376639946.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_8523425560376639946.BackgroundTransparency = 1
COM_8523425560376639946.BorderColor3 = Color3.fromRGB(0,0,0)
COM_8523425560376639946.BorderSizePixel = 0
COM_8523425560376639946.Parent = Special5

local BG9 = Instance.new("Frame")
BG9.Name = "BG"
BG9.Size = UDim2.new(1,0,1,0)
BG9.Position = UDim2.new(0.5,0,0.5,0)
BG9.AnchorPoint = Vector2.new(0.5,0.5)
BG9.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG9.BackgroundTransparency = 1
BG9.BorderColor3 = Color3.fromRGB(0,0,0)
BG9.BorderSizePixel = 0
BG9.ZIndex = -1
BG9.Parent = COM_8523425560376639946

local Dropshadow8 = Instance.new("Frame")
Dropshadow8.Name = "Dropshadow"
Dropshadow8.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow8.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow8.AnchorPoint = Vector2.new(0,1)
Dropshadow8.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow8.BackgroundTransparency = 0.5
Dropshadow8.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow8.BorderSizePixel = 0
Dropshadow8.ZIndex = -2
Dropshadow8.Parent = BG9

local UIStroke77 = Instance.new("UIStroke")
UIStroke77.Name = "UIStroke"
UIStroke77.Thickness = 2.79551
UIStroke77.Transparency = 1
UIStroke77.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke77.Parent = Dropshadow8

local Frame9 = Instance.new("Frame")
Frame9.Name = "Frame"
Frame9.Size = UDim2.new(0.984612,0,0.95775,0)
Frame9.Position = UDim2.new(0.506631,0,0.478875,0)
Frame9.AnchorPoint = Vector2.new(0.5,0.5)
Frame9.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame9.BorderColor3 = Color3.fromRGB(0,0,0)
Frame9.BorderSizePixel = 0
Frame9.ZIndex = -1
Frame9.Parent = BG9

local Pattern8 = Instance.new("ImageLabel")
Pattern8.Name = "Pattern"
Pattern8.Size = UDim2.new(0.635249,0,1,0)
Pattern8.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern8.BackgroundTransparency = 1
Pattern8.BorderSizePixel = 0
Pattern8.Image = "rbxassetid://98127658855696"
Pattern8.ZIndex = -1
Pattern8.Parent = Frame9

local UIStroke78 = Instance.new("UIStroke")
UIStroke78.Name = "UIStroke"
UIStroke78.Thickness = 1.86368
UIStroke78.Parent = Pattern8

local UIStroke79 = Instance.new("UIStroke")
UIStroke79.Name = "UIStroke"
UIStroke79.Thickness = 1.86368
UIStroke79.Parent = Frame9

local Highlight8 = Instance.new("Frame")
Highlight8.Name = "Highlight"
Highlight8.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight8.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight8.AnchorPoint = Vector2.new(0.5,0.5)
Highlight8.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight8.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight8.BorderSizePixel = 0
Highlight8.Visible = false
Highlight8.ZIndex = -2
Highlight8.Parent = BG9

local UIStroke80 = Instance.new("UIStroke")
UIStroke80.Name = "UIStroke"
UIStroke80.Color = Color3.fromRGB(255,242,0)
UIStroke80.Thickness = 2.79551
UIStroke80.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke80.Parent = Highlight8

local CanvasGroup4 = Instance.new("CanvasGroup")
CanvasGroup4.Name = "CanvasGroup"
CanvasGroup4.Size = UDim2.new(1,0,1,0)
CanvasGroup4.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup4.BackgroundTransparency = 1
CanvasGroup4.Parent = COM_8523425560376639946

local Thumbnail15 = Instance.new("ImageLabel")
Thumbnail15.Name = "Thumbnail"
Thumbnail15.Size = UDim2.new(0.37992,0,0.941288,0)
Thumbnail15.Position = UDim2.new(0.11109,0,0.564367,0)
Thumbnail15.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail15.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail15.BackgroundTransparency = 1
Thumbnail15.BorderSizePixel = 0
Thumbnail15.Image = "rbxassetid://79611996052293"
Thumbnail15.ScaleType = Enum.ScaleType.Fit
Thumbnail15.ZIndex = 0
Thumbnail15.Rotation = -11
Thumbnail15.Parent = CanvasGroup4

local Unavailable27 = Instance.new("TextLabel")
Unavailable27.Name = "Unavailable"
Unavailable27.Size = UDim2.new(0.7,0,0.7,0)
Unavailable27.Position = UDim2.new(0.5,0,0.5,0)
Unavailable27.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable27.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable27.BackgroundTransparency = 1
Unavailable27.BorderSizePixel = 0
Unavailable27.Text = "Unavailable"
Unavailable27.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable27.TextSize = 14
Unavailable27.Font = Enum.Font.FredokaOne
Unavailable27.TextWrapped = true
Unavailable27.TextScaled = true
Unavailable27.Visible = false
Unavailable27.Parent = Thumbnail15

local UIStroke81 = Instance.new("UIStroke")
UIStroke81.Name = "UIStroke"
UIStroke81.Thickness = 2
UIStroke81.Parent = Unavailable27

local Thumbnail16 = Instance.new("ImageLabel")
Thumbnail16.Name = "Thumbnail"
Thumbnail16.Size = UDim2.new(0.37992,0,0.990478,0)
Thumbnail16.Position = UDim2.new(0.188846,0,0.445004,0)
Thumbnail16.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail16.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail16.BackgroundTransparency = 1
Thumbnail16.BorderSizePixel = 0
Thumbnail16.Image = "rbxassetid://109266716868051"
Thumbnail16.ScaleType = Enum.ScaleType.Fit
Thumbnail16.ZIndex = -1
Thumbnail16.Rotation = 16
Thumbnail16.Parent = CanvasGroup4

local Unavailable28 = Instance.new("TextLabel")
Unavailable28.Name = "Unavailable"
Unavailable28.Size = UDim2.new(0.7,0,0.7,0)
Unavailable28.Position = UDim2.new(0.5,0,0.5,0)
Unavailable28.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable28.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable28.BackgroundTransparency = 1
Unavailable28.BorderSizePixel = 0
Unavailable28.Text = "Unavailable"
Unavailable28.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable28.TextSize = 14
Unavailable28.Font = Enum.Font.FredokaOne
Unavailable28.TextWrapped = true
Unavailable28.TextScaled = true
Unavailable28.Visible = false
Unavailable28.Parent = Thumbnail16

local UIStroke82 = Instance.new("UIStroke")
UIStroke82.Name = "UIStroke"
UIStroke82.Thickness = 2
UIStroke82.Parent = Unavailable28

local Thumbnail17 = Instance.new("ImageLabel")
Thumbnail17.Name = "Thumbnail"
Thumbnail17.Size = UDim2.new(0.319652,0,0.913829,0)
Thumbnail17.Position = UDim2.new(0.34791,0,0.497652,0)
Thumbnail17.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail17.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail17.BackgroundTransparency = 1
Thumbnail17.BorderSizePixel = 0
Thumbnail17.Image = "rbxassetid://78563575369012"
Thumbnail17.ScaleType = Enum.ScaleType.Fit
Thumbnail17.ZIndex = 0
Thumbnail17.Rotation = 13
Thumbnail17.Parent = CanvasGroup4

local Unavailable29 = Instance.new("TextLabel")
Unavailable29.Name = "Unavailable"
Unavailable29.Size = UDim2.new(0.7,0,0.7,0)
Unavailable29.Position = UDim2.new(0.5,0,0.5,0)
Unavailable29.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable29.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable29.BackgroundTransparency = 1
Unavailable29.BorderSizePixel = 0
Unavailable29.Text = "Unavailable"
Unavailable29.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable29.TextSize = 14
Unavailable29.Font = Enum.Font.FredokaOne
Unavailable29.TextWrapped = true
Unavailable29.TextScaled = true
Unavailable29.Visible = false
Unavailable29.Parent = Thumbnail17

local UIStroke83 = Instance.new("UIStroke")
UIStroke83.Name = "UIStroke"
UIStroke83.Thickness = 2
UIStroke83.Parent = Unavailable29

local DisplayTitle7 = Instance.new("TextLabel")
DisplayTitle7.Name = "DisplayTitle"
DisplayTitle7.Size = UDim2.new(0.28831,0,0.367128,0)
DisplayTitle7.Position = UDim2.new(0.814632,0,0.191717,0)
DisplayTitle7.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle7.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle7.BackgroundTransparency = 1
DisplayTitle7.BorderSizePixel = 0
DisplayTitle7.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
DisplayTitle7.TextColor3 = Color3.fromRGB(0,0,0)
DisplayTitle7.TextSize = 29
DisplayTitle7.Font = Enum.Font.Arcade
DisplayTitle7.TextWrapped = true
DisplayTitle7.TextScaled = true
DisplayTitle7.RichText = true
DisplayTitle7.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle7.Parent = COM_8523425560376639946

local UIAspectRatioConstraint10 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint10.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint10.AspectRatio = 2.66
UIAspectRatioConstraint10.Parent = DisplayTitle7

local UIGradient25 = Instance.new("UIGradient")
UIGradient25.Name = "UIGradient"
UIGradient25.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient25.Rotation = -90
UIGradient25.Offset = Vector2.new(0,0)
UIGradient25.Enabled = false
UIGradient25.Parent = DisplayTitle7

local UIStroke84 = Instance.new("UIStroke")
UIStroke84.Name = "UIStroke"
UIStroke84.Color = Color3.fromRGB(255,255,255)
UIStroke84.Thickness = 0.931838
UIStroke84.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke84.Parent = DisplayTitle7

local Item9 = Instance.new("ImageLabel")
Item9.Name = "Item"
Item9.Size = UDim2.new(0.913665,0,0.651761,0)
Item9.Position = UDim2.new(0.514096,0,0.463834,0)
Item9.AnchorPoint = Vector2.new(0.5,0.5)
Item9.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item9.BackgroundTransparency = 1
Item9.BorderSizePixel = 0
Item9.Image = "rbxassetid://94959635148921"
Item9.ImageRectOffset = Vector2.new(15,15)
Item9.ImageRectSize = Vector2.new(270,270)
Item9.ScaleType = Enum.ScaleType.Fit
Item9.Visible = false
Item9.ZIndex = -1
Item9.Parent = COM_8523425560376639946

local Unavailable30 = Instance.new("TextLabel")
Unavailable30.Name = "Unavailable"
Unavailable30.Size = UDim2.new(0.7,0,0.7,0)
Unavailable30.Position = UDim2.new(0.5,0,0.5,0)
Unavailable30.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable30.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable30.BackgroundTransparency = 1
Unavailable30.BorderSizePixel = 0
Unavailable30.Text = "Unavailable"
Unavailable30.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable30.TextSize = 14
Unavailable30.Font = Enum.Font.FredokaOne
Unavailable30.TextWrapped = true
Unavailable30.TextScaled = true
Unavailable30.Visible = false
Unavailable30.Parent = Item9

local UIStroke85 = Instance.new("UIStroke")
UIStroke85.Name = "UIStroke"
UIStroke85.Thickness = 2
UIStroke85.Parent = Unavailable30

local Purchase9 = Instance.new("ImageButton")
Purchase9.Name = "Purchase"
Purchase9.Size = UDim2.new(0.299855,0,0.201102,0)
Purchase9.Position = UDim2.new(0.814697,0,0.786462,0)
Purchase9.AnchorPoint = Vector2.new(0.5,0.5)
Purchase9.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase9.BorderSizePixel = 0
Purchase9.ScaleType = Enum.ScaleType.Fit
Purchase9.AutoButtonColor = false
Purchase9.Parent = COM_8523425560376639946

local Price9 = Instance.new("TextLabel")
Price9.Name = "Price"
Price9.Size = UDim2.new(0.78479,0,0.702682,0)
Price9.Position = UDim2.new(0.100663,0,0.0990811,0)
Price9.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price9.BackgroundTransparency = 1
Price9.BorderSizePixel = 0
Price9.Text = "$19.99"
Price9.TextColor3 = Color3.fromRGB(255,255,255)
Price9.TextSize = 14
Price9.Font = Enum.Font.Arcade
Price9.TextWrapped = true
Price9.TextScaled = true
Price9.RichText = true
Price9.AutomaticSize = Enum.AutomaticSize.X
Price9.Parent = Purchase9

local UIGradient26 = Instance.new("UIGradient")
UIGradient26.Name = "UIGradient"
UIGradient26.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient26.Rotation = -90
UIGradient26.Offset = Vector2.new(0,0)
UIGradient26.Parent = Price9

local UIStroke86 = Instance.new("UIStroke")
UIStroke86.Name = "UIStroke"
UIStroke86.Thickness = 0.931838
UIStroke86.Parent = Price9

local UICorner10 = Instance.new("UICorner")
UICorner10.Name = "UICorner"
UICorner10.CornerRadius = UDim.new(1,0)
UICorner10.Parent = Purchase9

local UIGradient27 = Instance.new("UIGradient")
UIGradient27.Name = "UIGradient"
UIGradient27.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient27.Rotation = -90
UIGradient27.Offset = Vector2.new(0,0)
UIGradient27.Parent = Purchase9

local UIScale15 = Instance.new("UIScale")
UIScale15.Name = "UIScale"
UIScale15.Parent = Purchase9

local UIStroke87 = Instance.new("UIStroke")
UIStroke87.Name = "UIStroke"
UIStroke87.Thickness = 1.1648
UIStroke87.Parent = Purchase9

local Thumbnail18 = Instance.new("ImageLabel")
Thumbnail18.Name = "Thumbnail"
Thumbnail18.Size = UDim2.new(0.48234,0,1.2575,0)
Thumbnail18.Position = UDim2.new(0.543731,0,0.435241,0)
Thumbnail18.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail18.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail18.BackgroundTransparency = 1
Thumbnail18.BorderSizePixel = 0
Thumbnail18.Image = "rbxassetid://76700469052474"
Thumbnail18.ScaleType = Enum.ScaleType.Fit
Thumbnail18.ZIndex = -1
Thumbnail18.Parent = COM_8523425560376639946

local Unavailable31 = Instance.new("TextLabel")
Unavailable31.Name = "Unavailable"
Unavailable31.Size = UDim2.new(0.7,0,0.7,0)
Unavailable31.Position = UDim2.new(0.5,0,0.5,0)
Unavailable31.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable31.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable31.BackgroundTransparency = 1
Unavailable31.BorderSizePixel = 0
Unavailable31.Text = "Unavailable"
Unavailable31.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable31.TextSize = 14
Unavailable31.Font = Enum.Font.FredokaOne
Unavailable31.TextWrapped = true
Unavailable31.TextScaled = true
Unavailable31.Visible = false
Unavailable31.Parent = Thumbnail18

local UIStroke88 = Instance.new("UIStroke")
UIStroke88.Name = "UIStroke"
UIStroke88.Thickness = 2
UIStroke88.Parent = Unavailable31

local Title9 = Instance.new("TextLabel")
Title9.Name = "Title"
Title9.Size = UDim2.new(0.566559,0,0.435422,0)
Title9.Position = UDim2.new(0.65544,0,0.15042,0)
Title9.AnchorPoint = Vector2.new(0.5,0)
Title9.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title9.BackgroundTransparency = 1
Title9.BorderSizePixel = 0
Title9.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title9.TextColor3 = Color3.fromRGB(0,13,76)
Title9.TextSize = 29
Title9.Font = Enum.Font.Arcade
Title9.TextWrapped = true
Title9.TextScaled = true
Title9.RichText = true
Title9.Visible = false
Title9.AutomaticSize = Enum.AutomaticSize.X
Title9.Parent = COM_8523425560376639946

local UIGradient28 = Instance.new("UIGradient")
UIGradient28.Name = "UIGradient"
UIGradient28.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient28.Rotation = -90
UIGradient28.Offset = Vector2.new(0,0)
UIGradient28.Parent = Title9

local UIStroke89 = Instance.new("UIStroke")
UIStroke89.Name = "UIStroke"
UIStroke89.Color = Color3.fromRGB(255,255,255)
UIStroke89.Thickness = 2
UIStroke89.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke89.Parent = Title9

local UIListLayout6 = Instance.new("UIListLayout")
UIListLayout6.Name = "UIListLayout"
UIListLayout6.Padding = UDim.new(0.019,0)
UIListLayout6.FillDirection = Enum.FillDirection.Horizontal
UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout6.Wraps = false
UIListLayout6.Parent = Special5

local Special6 = Instance.new("Frame")
Special6.Name = "Special"
Special6.Size = UDim2.new(0.728,0,0.493,0)
Special6.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
Special6.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special6.BackgroundTransparency = 1
Special6.BorderColor3 = Color3.fromRGB(0,0,0)
Special6.BorderSizePixel = 0
Special6.Visible = false
Special6.LayoutOrder = -14
Special6.Parent = ScrollingFrame

local COM_6342578082452472240 = Instance.new("Frame")
COM_6342578082452472240.Name = "COM-6342578082452472240"
COM_6342578082452472240.Size = UDim2.new(0.442523,0,0.944677,0)
COM_6342578082452472240.Position = UDim2.new(0.913307,0,0,0)
COM_6342578082452472240.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_6342578082452472240.BackgroundTransparency = 1
COM_6342578082452472240.BorderColor3 = Color3.fromRGB(0,0,0)
COM_6342578082452472240.BorderSizePixel = 0
COM_6342578082452472240.LayoutOrder = -1
COM_6342578082452472240.Parent = Special6

local BG10 = Instance.new("Frame")
BG10.Name = "BG"
BG10.Size = UDim2.new(1,0,1,0)
BG10.Position = UDim2.new(0.5,0,0.5,0)
BG10.AnchorPoint = Vector2.new(0.5,0.5)
BG10.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG10.BackgroundTransparency = 1
BG10.BorderColor3 = Color3.fromRGB(0,0,0)
BG10.BorderSizePixel = 0
BG10.ZIndex = -1
BG10.Parent = COM_6342578082452472240

local Dropshadow9 = Instance.new("Frame")
Dropshadow9.Name = "Dropshadow"
Dropshadow9.Size = UDim2.new(0.947997,0,0.95376,0)
Dropshadow9.Position = UDim2.new(-0.00747363,0,1.01324,0)
Dropshadow9.AnchorPoint = Vector2.new(0,1)
Dropshadow9.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow9.BackgroundTransparency = 0.5
Dropshadow9.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow9.BorderSizePixel = 0
Dropshadow9.ZIndex = -2
Dropshadow9.Parent = BG10

local UIStroke90 = Instance.new("UIStroke")
UIStroke90.Name = "UIStroke"
UIStroke90.Thickness = 2.79551
UIStroke90.Transparency = 1
UIStroke90.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke90.Parent = Dropshadow9

local Frame10 = Instance.new("Frame")
Frame10.Name = "Frame"
Frame10.Size = UDim2.new(0.984612,0,0.95775,0)
Frame10.Position = UDim2.new(0.506631,0,0.478875,0)
Frame10.AnchorPoint = Vector2.new(0.5,0.5)
Frame10.BackgroundColor3 = Color3.fromRGB(0,148,216)
Frame10.BorderColor3 = Color3.fromRGB(0,0,0)
Frame10.BorderSizePixel = 0
Frame10.ZIndex = -1
Frame10.Parent = BG10

local Pattern9 = Instance.new("ImageLabel")
Pattern9.Name = "Pattern"
Pattern9.Size = UDim2.new(1,0,1,0)
Pattern9.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern9.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern9.BackgroundTransparency = 1
Pattern9.BorderSizePixel = 0
Pattern9.Image = "rbxassetid://125256780775731"
Pattern9.ImageColor3 = Color3.fromRGB(133,243,255)
Pattern9.ScaleType = Enum.ScaleType.Crop
Pattern9.ZIndex = -1
Pattern9.Parent = Frame10

local UIGradient29 = Instance.new("UIGradient")
UIGradient29.Name = "UIGradient"
UIGradient29.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
UIGradient29.Rotation = 90
UIGradient29.Offset = Vector2.new(0,0)
UIGradient29.Parent = Pattern9

local UIStroke91 = Instance.new("UIStroke")
UIStroke91.Name = "UIStroke"
UIStroke91.Thickness = 1.86368
UIStroke91.Parent = Pattern9

local UIGradient30 = Instance.new("UIGradient")
UIGradient30.Name = "UIGradient"
UIGradient30.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient30.Rotation = 90
UIGradient30.Offset = Vector2.new(0,0)
UIGradient30.Parent = Frame10

local UIStroke92 = Instance.new("UIStroke")
UIStroke92.Name = "UIStroke"
UIStroke92.Thickness = 1.86368
UIStroke92.Parent = Frame10

local Highlight9 = Instance.new("Frame")
Highlight9.Name = "Highlight"
Highlight9.Size = UDim2.new(0.954203,0,0.95775,0)
Highlight9.Position = UDim2.new(0.519351,0,0.478875,0)
Highlight9.AnchorPoint = Vector2.new(0.5,0.5)
Highlight9.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight9.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight9.BorderSizePixel = 0
Highlight9.Visible = false
Highlight9.ZIndex = -2
Highlight9.Parent = BG10

local UIStroke93 = Instance.new("UIStroke")
UIStroke93.Name = "UIStroke"
UIStroke93.Color = Color3.fromRGB(255,242,0)
UIStroke93.Thickness = 2.79551
UIStroke93.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke93.Parent = Highlight9

local Item10 = Instance.new("ImageLabel")
Item10.Name = "Item"
Item10.Size = UDim2.new(0.902423,0,0.651761,0)
Item10.Position = UDim2.new(0.521125,0,0.463834,0)
Item10.AnchorPoint = Vector2.new(0.5,0.5)
Item10.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item10.BackgroundTransparency = 1
Item10.BorderSizePixel = 0
Item10.Image = "rbxassetid://94959635148921"
Item10.ImageRectOffset = Vector2.new(25,25)
Item10.ImageRectSize = Vector2.new(250,250)
Item10.ScaleType = Enum.ScaleType.Crop
Item10.Visible = false
Item10.ZIndex = -1
Item10.Parent = COM_6342578082452472240

local Unavailable32 = Instance.new("TextLabel")
Unavailable32.Name = "Unavailable"
Unavailable32.Size = UDim2.new(0.7,0,0.7,0)
Unavailable32.Position = UDim2.new(0.5,0,0.5,0)
Unavailable32.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable32.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable32.BackgroundTransparency = 1
Unavailable32.BorderSizePixel = 0
Unavailable32.Text = "Unavailable"
Unavailable32.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable32.TextSize = 14
Unavailable32.Font = Enum.Font.FredokaOne
Unavailable32.TextWrapped = true
Unavailable32.TextScaled = true
Unavailable32.Visible = false
Unavailable32.Parent = Item10

local UIStroke94 = Instance.new("UIStroke")
UIStroke94.Name = "UIStroke"
UIStroke94.Thickness = 2
UIStroke94.Parent = Unavailable32

local Pixel5 = Instance.new("ImageLabel")
Pixel5.Name = "Pixel"
Pixel5.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel5.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel5.AnchorPoint = Vector2.new(0.5,0.5)
Pixel5.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel5.BorderSizePixel = 0
Pixel5.Image = "rbxassetid://94959635148921"
Pixel5.ImageRectOffset = Vector2.new(55,100)
Pixel5.ImageRectSize = Vector2.new(30,30)
Pixel5.ScaleType = Enum.ScaleType.Crop
Pixel5.Visible = false
Pixel5.ZIndex = 5
Pixel5.Parent = COM_6342578082452472240

local Unavailable33 = Instance.new("TextLabel")
Unavailable33.Name = "Unavailable"
Unavailable33.Size = UDim2.new(0.7,0,0.7,0)
Unavailable33.Position = UDim2.new(0.5,0,0.5,0)
Unavailable33.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable33.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable33.BackgroundTransparency = 1
Unavailable33.BorderSizePixel = 0
Unavailable33.Text = "Unavailable"
Unavailable33.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable33.TextSize = 14
Unavailable33.Font = Enum.Font.FredokaOne
Unavailable33.TextWrapped = true
Unavailable33.TextScaled = true
Unavailable33.Visible = false
Unavailable33.Parent = Pixel5

local UIStroke95 = Instance.new("UIStroke")
UIStroke95.Name = "UIStroke"
UIStroke95.Thickness = 2
UIStroke95.Parent = Unavailable33

local Purchase10 = Instance.new("ImageButton")
Purchase10.Name = "Purchase"
Purchase10.Size = UDim2.new(0.863319,0,0.170445,0)
Purchase10.Position = UDim2.new(0.514166,0,0.821691,0)
Purchase10.AnchorPoint = Vector2.new(0.5,0.5)
Purchase10.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase10.BorderSizePixel = 0
Purchase10.ScaleType = Enum.ScaleType.Fit
Purchase10.AutoButtonColor = false
Purchase10.ZIndex = 6
Purchase10.Parent = COM_6342578082452472240

local Price10 = Instance.new("TextLabel")
Price10.Name = "Price"
Price10.Size = UDim2.new(0.78479,0,0.702682,0)
Price10.Position = UDim2.new(0.100663,0,0.0990811,0)
Price10.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price10.BackgroundTransparency = 1
Price10.BorderSizePixel = 0
Price10.Text = "$19.99"
Price10.TextColor3 = Color3.fromRGB(255,255,255)
Price10.TextSize = 14
Price10.Font = Enum.Font.Arcade
Price10.TextWrapped = true
Price10.TextScaled = true
Price10.RichText = true
Price10.AutomaticSize = Enum.AutomaticSize.X
Price10.Parent = Purchase10

local UIGradient31 = Instance.new("UIGradient")
UIGradient31.Name = "UIGradient"
UIGradient31.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient31.Rotation = -90
UIGradient31.Offset = Vector2.new(0,0)
UIGradient31.Parent = Price10

local UIStroke96 = Instance.new("UIStroke")
UIStroke96.Name = "UIStroke"
UIStroke96.Thickness = 2
UIStroke96.Parent = Price10

local UICorner11 = Instance.new("UICorner")
UICorner11.Name = "UICorner"
UICorner11.CornerRadius = UDim.new(1,0)
UICorner11.Parent = Purchase10

local UIGradient32 = Instance.new("UIGradient")
UIGradient32.Name = "UIGradient"
UIGradient32.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient32.Rotation = -90
UIGradient32.Offset = Vector2.new(0,0)
UIGradient32.Parent = Purchase10

local UIScale16 = Instance.new("UIScale")
UIScale16.Name = "UIScale"
UIScale16.Parent = Purchase10

local UIStroke97 = Instance.new("UIStroke")
UIStroke97.Name = "UIStroke"
UIStroke97.Thickness = 2.5
UIStroke97.Parent = Purchase10

local Thumbnail19 = Instance.new("ImageLabel")
Thumbnail19.Name = "Thumbnail"
Thumbnail19.Size = UDim2.new(1.15659,0,0.857211,0)
Thumbnail19.Position = UDim2.new(0.495381,0,0.470327,0)
Thumbnail19.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail19.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail19.BackgroundTransparency = 1
Thumbnail19.BorderSizePixel = 0
Thumbnail19.Image = "rbxassetid://102766462181767"
Thumbnail19.ScaleType = Enum.ScaleType.Crop
Thumbnail19.ZIndex = -1
Thumbnail19.Parent = COM_6342578082452472240

local Unavailable34 = Instance.new("TextLabel")
Unavailable34.Name = "Unavailable"
Unavailable34.Size = UDim2.new(0.7,0,0.7,0)
Unavailable34.Position = UDim2.new(0.5,0,0.5,0)
Unavailable34.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable34.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable34.BackgroundTransparency = 1
Unavailable34.BorderSizePixel = 0
Unavailable34.Text = "Unavailable"
Unavailable34.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable34.TextSize = 14
Unavailable34.Font = Enum.Font.FredokaOne
Unavailable34.TextWrapped = true
Unavailable34.TextScaled = true
Unavailable34.Visible = false
Unavailable34.Parent = Thumbnail19

local UIStroke98 = Instance.new("UIStroke")
UIStroke98.Name = "UIStroke"
UIStroke98.Thickness = 2
UIStroke98.Parent = Unavailable34

local Title10 = Instance.new("TextLabel")
Title10.Name = "Title"
Title10.Size = UDim2.new(0.874784,0,0.149,0)
Title10.Position = UDim2.new(0.531264,0,0.0306123,0)
Title10.AnchorPoint = Vector2.new(0.5,0)
Title10.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title10.BackgroundTransparency = 1
Title10.BorderSizePixel = 0
Title10.Text = "Bobette 11” x 14” Poster"
Title10.TextColor3 = Color3.fromRGB(0,0,0)
Title10.TextSize = 29
Title10.Font = Enum.Font.Arcade
Title10.TextXAlignment = Enum.TextXAlignment.Left
Title10.TextYAlignment = Enum.TextYAlignment.Top
Title10.TextWrapped = true
Title10.TextScaled = true
Title10.RichText = true
Title10.Visible = false
Title10.AutomaticSize = Enum.AutomaticSize.X
Title10.Parent = COM_6342578082452472240

local UITextSizeConstraint8 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint8.Name = "UITextSizeConstraint"
UITextSizeConstraint8.MaxTextSize = 29
UITextSizeConstraint8.Parent = Title10

local COM_5266164701015966145 = Instance.new("Frame")
COM_5266164701015966145.Name = "COM-5266164701015966145"
COM_5266164701015966145.Size = UDim2.new(0.894198,0,0.931112,0)
COM_5266164701015966145.Position = UDim2.new(5.4771e-08,0,0,0)
COM_5266164701015966145.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_5266164701015966145.BackgroundTransparency = 1
COM_5266164701015966145.BorderColor3 = Color3.fromRGB(0,0,0)
COM_5266164701015966145.BorderSizePixel = 0
COM_5266164701015966145.ZIndex = 2
COM_5266164701015966145.Parent = Special6

local BG11 = Instance.new("Frame")
BG11.Name = "BG"
BG11.Size = UDim2.new(1,0,1,0)
BG11.Position = UDim2.new(0.5,0,0.5,0)
BG11.AnchorPoint = Vector2.new(0.5,0.5)
BG11.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG11.BackgroundTransparency = 1
BG11.BorderColor3 = Color3.fromRGB(0,0,0)
BG11.BorderSizePixel = 0
BG11.ZIndex = -1
BG11.Parent = COM_5266164701015966145

local Dropshadow10 = Instance.new("Frame")
Dropshadow10.Name = "Dropshadow"
Dropshadow10.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow10.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow10.AnchorPoint = Vector2.new(0,1)
Dropshadow10.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow10.BackgroundTransparency = 0.5
Dropshadow10.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow10.BorderSizePixel = 0
Dropshadow10.ZIndex = -2
Dropshadow10.Parent = BG11

local UIStroke99 = Instance.new("UIStroke")
UIStroke99.Name = "UIStroke"
UIStroke99.Thickness = 2.79551
UIStroke99.Transparency = 1
UIStroke99.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke99.Parent = Dropshadow10

local Frame11 = Instance.new("Frame")
Frame11.Name = "Frame"
Frame11.Size = UDim2.new(0.984612,0,0.95775,0)
Frame11.Position = UDim2.new(0.506631,0,0.478875,0)
Frame11.AnchorPoint = Vector2.new(0.5,0.5)
Frame11.BackgroundColor3 = Color3.fromRGB(0,148,216)
Frame11.BorderColor3 = Color3.fromRGB(0,0,0)
Frame11.BorderSizePixel = 0
Frame11.ZIndex = -1
Frame11.Parent = BG11

local Pattern10 = Instance.new("ImageLabel")
Pattern10.Name = "Pattern"
Pattern10.Size = UDim2.new(1,0,1,0)
Pattern10.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern10.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern10.BackgroundTransparency = 1
Pattern10.BorderSizePixel = 0
Pattern10.Image = "rbxassetid://125256780775731"
Pattern10.ImageColor3 = Color3.fromRGB(133,243,255)
Pattern10.ZIndex = -1
Pattern10.Parent = Frame11

local UIGradient33 = Instance.new("UIGradient")
UIGradient33.Name = "UIGradient"
UIGradient33.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
UIGradient33.Rotation = 90
UIGradient33.Offset = Vector2.new(0,0)
UIGradient33.Parent = Pattern10

local UIStroke100 = Instance.new("UIStroke")
UIStroke100.Name = "UIStroke"
UIStroke100.Thickness = 1.86368
UIStroke100.Parent = Pattern10

local UIGradient34 = Instance.new("UIGradient")
UIGradient34.Name = "UIGradient"
UIGradient34.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient34.Rotation = 90
UIGradient34.Offset = Vector2.new(0,0)
UIGradient34.Parent = Frame11

local UIStroke101 = Instance.new("UIStroke")
UIStroke101.Name = "UIStroke"
UIStroke101.Thickness = 1.86368
UIStroke101.Parent = Frame11

local Highlight10 = Instance.new("Frame")
Highlight10.Name = "Highlight"
Highlight10.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight10.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight10.AnchorPoint = Vector2.new(0.5,0.5)
Highlight10.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight10.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight10.BorderSizePixel = 0
Highlight10.Visible = false
Highlight10.ZIndex = -2
Highlight10.Parent = BG11

local UIStroke102 = Instance.new("UIStroke")
UIStroke102.Name = "UIStroke"
UIStroke102.Color = Color3.fromRGB(255,242,0)
UIStroke102.Thickness = 2.79551
UIStroke102.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke102.Parent = Highlight10

local CanvasGroup5 = Instance.new("CanvasGroup")
CanvasGroup5.Name = "CanvasGroup"
CanvasGroup5.Size = UDim2.new(0.970515,0,0.95775,0)
CanvasGroup5.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup5.BackgroundTransparency = 1
CanvasGroup5.Parent = COM_5266164701015966145

local Thumbnail20 = Instance.new("ImageLabel")
Thumbnail20.Name = "Thumbnail"
Thumbnail20.Size = UDim2.new(0.470619,0,1.14854,0)
Thumbnail20.Position = UDim2.new(0.165209,0,0.529027,0)
Thumbnail20.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail20.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail20.BackgroundTransparency = 1
Thumbnail20.BorderSizePixel = 0
Thumbnail20.Image = "rbxassetid://134183282955587"
Thumbnail20.ScaleType = Enum.ScaleType.Fit
Thumbnail20.Rotation = -11
Thumbnail20.Parent = CanvasGroup5

local Unavailable35 = Instance.new("TextLabel")
Unavailable35.Name = "Unavailable"
Unavailable35.Size = UDim2.new(0.7,0,0.7,0)
Unavailable35.Position = UDim2.new(0.5,0,0.5,0)
Unavailable35.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable35.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable35.BackgroundTransparency = 1
Unavailable35.BorderSizePixel = 0
Unavailable35.Text = "Unavailable"
Unavailable35.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable35.TextSize = 14
Unavailable35.Font = Enum.Font.FredokaOne
Unavailable35.TextWrapped = true
Unavailable35.TextScaled = true
Unavailable35.Visible = false
Unavailable35.Parent = Thumbnail20

local UIStroke103 = Instance.new("UIStroke")
UIStroke103.Name = "UIStroke"
UIStroke103.Thickness = 2
UIStroke103.Parent = Unavailable35

local DisplayTitle8 = Instance.new("TextLabel")
DisplayTitle8.Name = "DisplayTitle"
DisplayTitle8.Size = UDim2.new(0.447811,0,0.334729,0)
DisplayTitle8.Position = UDim2.new(0.752098,0,0.261677,0)
DisplayTitle8.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle8.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle8.BackgroundTransparency = 1
DisplayTitle8.BorderSizePixel = 0
DisplayTitle8.Text = "Gigi\
 Deluxe 14\" Plush"
DisplayTitle8.TextColor3 = Color3.fromRGB(2,40,0)
DisplayTitle8.TextSize = 29
DisplayTitle8.Font = Enum.Font.Arcade
DisplayTitle8.TextWrapped = true
DisplayTitle8.TextScaled = true
DisplayTitle8.RichText = true
DisplayTitle8.Parent = COM_5266164701015966145

local UIGradient35 = Instance.new("UIGradient")
UIGradient35.Name = "UIGradient"
UIGradient35.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient35.Rotation = -90
UIGradient35.Offset = Vector2.new(0,0)
UIGradient35.Parent = DisplayTitle8

local UIStroke104 = Instance.new("UIStroke")
UIStroke104.Name = "UIStroke"
UIStroke104.Color = Color3.fromRGB(255,255,255)
UIStroke104.Thickness = 0.931838
UIStroke104.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke104.Parent = DisplayTitle8

local Item11 = Instance.new("ImageLabel")
Item11.Name = "Item"
Item11.Size = UDim2.new(0.913665,0,0.651761,0)
Item11.Position = UDim2.new(0.514096,0,0.463834,0)
Item11.AnchorPoint = Vector2.new(0.5,0.5)
Item11.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item11.BackgroundTransparency = 1
Item11.BorderSizePixel = 0
Item11.Image = "rbxassetid://94959635148921"
Item11.ImageRectOffset = Vector2.new(15,15)
Item11.ImageRectSize = Vector2.new(270,270)
Item11.ScaleType = Enum.ScaleType.Fit
Item11.Visible = false
Item11.ZIndex = -1
Item11.Parent = COM_5266164701015966145

local Unavailable36 = Instance.new("TextLabel")
Unavailable36.Name = "Unavailable"
Unavailable36.Size = UDim2.new(0.7,0,0.7,0)
Unavailable36.Position = UDim2.new(0.5,0,0.5,0)
Unavailable36.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable36.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable36.BackgroundTransparency = 1
Unavailable36.BorderSizePixel = 0
Unavailable36.Text = "Unavailable"
Unavailable36.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable36.TextSize = 14
Unavailable36.Font = Enum.Font.FredokaOne
Unavailable36.TextWrapped = true
Unavailable36.TextScaled = true
Unavailable36.Visible = false
Unavailable36.Parent = Item11

local UIStroke105 = Instance.new("UIStroke")
UIStroke105.Name = "UIStroke"
UIStroke105.Thickness = 2
UIStroke105.Parent = Unavailable36

local New5 = Instance.new("ImageLabel")
New5.Name = "New"
New5.Size = UDim2.new(0.322123,0,0.355513,0)
New5.Position = UDim2.new(0.874755,0,0.110529,0)
New5.AnchorPoint = Vector2.new(0.5,0.5)
New5.BackgroundColor3 = Color3.fromRGB(255,255,255)
New5.BackgroundTransparency = 1
New5.BorderSizePixel = 0
New5.Image = "rbxassetid://96728750855907"
New5.ScaleType = Enum.ScaleType.Fit
New5.Visible = false
New5.ZIndex = -1
New5.Parent = COM_5266164701015966145

local UIScale17 = Instance.new("UIScale")
UIScale17.Name = "UIScale"
UIScale17.Parent = New5

local Purchase11 = Instance.new("ImageButton")
Purchase11.Name = "Purchase"
Purchase11.Size = UDim2.new(0.436835,0,0.172928,0)
Purchase11.Position = UDim2.new(0.752098,0,0.833662,0)
Purchase11.AnchorPoint = Vector2.new(0.5,0.5)
Purchase11.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase11.BorderSizePixel = 0
Purchase11.ScaleType = Enum.ScaleType.Fit
Purchase11.AutoButtonColor = false
Purchase11.ZIndex = 5
Purchase11.Parent = COM_5266164701015966145

local Price11 = Instance.new("TextLabel")
Price11.Name = "Price"
Price11.Size = UDim2.new(0.78479,0,0.702682,0)
Price11.Position = UDim2.new(0.100663,0,0.0990811,0)
Price11.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price11.BackgroundTransparency = 1
Price11.BorderSizePixel = 0
Price11.Text = "$19.99"
Price11.TextColor3 = Color3.fromRGB(255,255,255)
Price11.TextSize = 14
Price11.Font = Enum.Font.Arcade
Price11.TextWrapped = true
Price11.TextScaled = true
Price11.RichText = true
Price11.AutomaticSize = Enum.AutomaticSize.X
Price11.Parent = Purchase11

local UIGradient36 = Instance.new("UIGradient")
UIGradient36.Name = "UIGradient"
UIGradient36.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient36.Rotation = -90
UIGradient36.Offset = Vector2.new(0,0)
UIGradient36.Parent = Price11

local UIStroke106 = Instance.new("UIStroke")
UIStroke106.Name = "UIStroke"
UIStroke106.Thickness = 0.931838
UIStroke106.Parent = Price11

local UICorner12 = Instance.new("UICorner")
UICorner12.Name = "UICorner"
UICorner12.CornerRadius = UDim.new(1,0)
UICorner12.Parent = Purchase11

local UIGradient37 = Instance.new("UIGradient")
UIGradient37.Name = "UIGradient"
UIGradient37.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient37.Rotation = -90
UIGradient37.Offset = Vector2.new(0,0)
UIGradient37.Parent = Purchase11

local UIScale18 = Instance.new("UIScale")
UIScale18.Name = "UIScale"
UIScale18.Parent = Purchase11

local UIStroke107 = Instance.new("UIStroke")
UIStroke107.Name = "UIStroke"
UIStroke107.Thickness = 1.1648
UIStroke107.Parent = Purchase11

local Thumbnail21 = Instance.new("ImageLabel")
Thumbnail21.Name = "Thumbnail"
Thumbnail21.Size = UDim2.new(0.48234,0,1.2575,0)
Thumbnail21.Position = UDim2.new(0.42096,0,0.450994,0)
Thumbnail21.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail21.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail21.BackgroundTransparency = 1
Thumbnail21.BorderSizePixel = 0
Thumbnail21.Image = "rbxassetid://136171183438389"
Thumbnail21.ScaleType = Enum.ScaleType.Fit
Thumbnail21.ZIndex = 4
Thumbnail21.Parent = COM_5266164701015966145

local Unavailable37 = Instance.new("TextLabel")
Unavailable37.Name = "Unavailable"
Unavailable37.Size = UDim2.new(0.7,0,0.7,0)
Unavailable37.Position = UDim2.new(0.5,0,0.5,0)
Unavailable37.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable37.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable37.BackgroundTransparency = 1
Unavailable37.BorderSizePixel = 0
Unavailable37.Text = "Unavailable"
Unavailable37.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable37.TextSize = 14
Unavailable37.Font = Enum.Font.FredokaOne
Unavailable37.TextWrapped = true
Unavailable37.TextScaled = true
Unavailable37.Visible = false
Unavailable37.Parent = Thumbnail21

local UIStroke108 = Instance.new("UIStroke")
UIStroke108.Name = "UIStroke"
UIStroke108.Thickness = 2
UIStroke108.Parent = Unavailable37

local Title11 = Instance.new("TextLabel")
Title11.Name = "Title"
Title11.Size = UDim2.new(0.566559,0,0.435422,0)
Title11.Position = UDim2.new(0.65544,0,0.15042,0)
Title11.AnchorPoint = Vector2.new(0.5,0)
Title11.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title11.BackgroundTransparency = 1
Title11.BorderSizePixel = 0
Title11.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title11.TextColor3 = Color3.fromRGB(0,13,76)
Title11.TextSize = 29
Title11.Font = Enum.Font.Arcade
Title11.TextWrapped = true
Title11.TextScaled = true
Title11.RichText = true
Title11.Visible = false
Title11.AutomaticSize = Enum.AutomaticSize.X
Title11.Parent = COM_5266164701015966145

local UIGradient38 = Instance.new("UIGradient")
UIGradient38.Name = "UIGradient"
UIGradient38.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient38.Rotation = -90
UIGradient38.Offset = Vector2.new(0,0)
UIGradient38.Parent = Title11

local UIStroke109 = Instance.new("UIStroke")
UIStroke109.Name = "UIStroke"
UIStroke109.Color = Color3.fromRGB(255,255,255)
UIStroke109.Thickness = 2
UIStroke109.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke109.Parent = Title11

local UIListLayout7 = Instance.new("UIListLayout")
UIListLayout7.Name = "UIListLayout"
UIListLayout7.Padding = UDim.new(0.019,0)
UIListLayout7.FillDirection = Enum.FillDirection.Horizontal
UIListLayout7.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout7.Wraps = false
UIListLayout7.Parent = Special6

local Special7 = Instance.new("Frame")
Special7.Name = "Special"
Special7.Size = UDim2.new(1.10498,0,0.439953,0)
Special7.Position = UDim2.new(0,0,-0.143337,0)
Special7.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special7.BackgroundTransparency = 1
Special7.BorderColor3 = Color3.fromRGB(0,0,0)
Special7.BorderSizePixel = 0
Special7.Visible = false
Special7.LayoutOrder = -13
Special7.Parent = ScrollingFrame

local COM_6148819382656172482 = Instance.new("Frame")
COM_6148819382656172482.Name = "COM-6148819382656172482"
COM_6148819382656172482.Size = UDim2.new(0.894307,0,0.931111,0)
COM_6148819382656172482.Position = UDim2.new(-5.79236e-08,0,0,0)
COM_6148819382656172482.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_6148819382656172482.BackgroundTransparency = 1
COM_6148819382656172482.BorderColor3 = Color3.fromRGB(0,0,0)
COM_6148819382656172482.BorderSizePixel = 0
COM_6148819382656172482.Parent = Special7

local BG12 = Instance.new("Frame")
BG12.Name = "BG"
BG12.Size = UDim2.new(1,0,1,0)
BG12.Position = UDim2.new(0.5,0,0.5,0)
BG12.AnchorPoint = Vector2.new(0.5,0.5)
BG12.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG12.BackgroundTransparency = 1
BG12.BorderColor3 = Color3.fromRGB(0,0,0)
BG12.BorderSizePixel = 0
BG12.ZIndex = -1
BG12.Parent = COM_6148819382656172482

local Dropshadow11 = Instance.new("Frame")
Dropshadow11.Name = "Dropshadow"
Dropshadow11.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow11.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow11.AnchorPoint = Vector2.new(0,1)
Dropshadow11.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow11.BackgroundTransparency = 0.5
Dropshadow11.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow11.BorderSizePixel = 0
Dropshadow11.ZIndex = -2
Dropshadow11.Parent = BG12

local UIStroke110 = Instance.new("UIStroke")
UIStroke110.Name = "UIStroke"
UIStroke110.Thickness = 2.79551
UIStroke110.Transparency = 1
UIStroke110.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke110.Parent = Dropshadow11

local Frame12 = Instance.new("Frame")
Frame12.Name = "Frame"
Frame12.Size = UDim2.new(0.984612,0,0.95775,0)
Frame12.Position = UDim2.new(0.506631,0,0.478875,0)
Frame12.AnchorPoint = Vector2.new(0.5,0.5)
Frame12.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame12.BorderColor3 = Color3.fromRGB(0,0,0)
Frame12.BorderSizePixel = 0
Frame12.ZIndex = -1
Frame12.Parent = BG12

local Pattern11 = Instance.new("ImageLabel")
Pattern11.Name = "Pattern"
Pattern11.Size = UDim2.new(0.635249,0,1,0)
Pattern11.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern11.BackgroundTransparency = 1
Pattern11.BorderSizePixel = 0
Pattern11.Image = "rbxassetid://90267535887894"
Pattern11.ZIndex = -1
Pattern11.Parent = Frame12

local UIStroke111 = Instance.new("UIStroke")
UIStroke111.Name = "UIStroke"
UIStroke111.Thickness = 1.86368
UIStroke111.Parent = Pattern11

local UIStroke112 = Instance.new("UIStroke")
UIStroke112.Name = "UIStroke"
UIStroke112.Thickness = 1.86368
UIStroke112.Parent = Frame12

local Highlight11 = Instance.new("Frame")
Highlight11.Name = "Highlight"
Highlight11.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight11.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight11.AnchorPoint = Vector2.new(0.5,0.5)
Highlight11.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight11.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight11.BorderSizePixel = 0
Highlight11.Visible = false
Highlight11.ZIndex = -2
Highlight11.Parent = BG12

local UIStroke113 = Instance.new("UIStroke")
UIStroke113.Name = "UIStroke"
UIStroke113.Color = Color3.fromRGB(255,242,0)
UIStroke113.Thickness = 2.79551
UIStroke113.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke113.Parent = Highlight11

local CanvasGroup6 = Instance.new("CanvasGroup")
CanvasGroup6.Name = "CanvasGroup"
CanvasGroup6.Size = UDim2.new(1,0,1,0)
CanvasGroup6.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup6.BackgroundTransparency = 1
CanvasGroup6.Parent = COM_6148819382656172482

local Thumbnail22 = Instance.new("ImageLabel")
Thumbnail22.Name = "Thumbnail"
Thumbnail22.Size = UDim2.new(0.401091,0,0.993744,0)
Thumbnail22.Position = UDim2.new(0.0961707,0,0.538139,0)
Thumbnail22.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail22.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail22.BackgroundTransparency = 1
Thumbnail22.BorderSizePixel = 0
Thumbnail22.Image = "rbxassetid://109008554120145"
Thumbnail22.ScaleType = Enum.ScaleType.Fit
Thumbnail22.ZIndex = 0
Thumbnail22.Rotation = -11
Thumbnail22.Parent = CanvasGroup6

local Unavailable38 = Instance.new("TextLabel")
Unavailable38.Name = "Unavailable"
Unavailable38.Size = UDim2.new(0.7,0,0.7,0)
Unavailable38.Position = UDim2.new(0.5,0,0.5,0)
Unavailable38.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable38.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable38.BackgroundTransparency = 1
Unavailable38.BorderSizePixel = 0
Unavailable38.Text = "Unavailable"
Unavailable38.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable38.TextSize = 14
Unavailable38.Font = Enum.Font.FredokaOne
Unavailable38.TextWrapped = true
Unavailable38.TextScaled = true
Unavailable38.Visible = false
Unavailable38.Parent = Thumbnail22

local UIStroke114 = Instance.new("UIStroke")
UIStroke114.Name = "UIStroke"
UIStroke114.Thickness = 2
UIStroke114.Parent = Unavailable38

local Thumbnail23 = Instance.new("ImageLabel")
Thumbnail23.Name = "Thumbnail"
Thumbnail23.Size = UDim2.new(0.401091,0,1.04567,0)
Thumbnail23.Position = UDim2.new(0.17826,0,0.412124,0)
Thumbnail23.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail23.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail23.BackgroundTransparency = 1
Thumbnail23.BorderSizePixel = 0
Thumbnail23.Image = "rbxassetid://128504815212707"
Thumbnail23.ScaleType = Enum.ScaleType.Fit
Thumbnail23.ZIndex = -1
Thumbnail23.Rotation = 16
Thumbnail23.Parent = CanvasGroup6

local Unavailable39 = Instance.new("TextLabel")
Unavailable39.Name = "Unavailable"
Unavailable39.Size = UDim2.new(0.7,0,0.7,0)
Unavailable39.Position = UDim2.new(0.5,0,0.5,0)
Unavailable39.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable39.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable39.BackgroundTransparency = 1
Unavailable39.BorderSizePixel = 0
Unavailable39.Text = "Unavailable"
Unavailable39.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable39.TextSize = 14
Unavailable39.Font = Enum.Font.FredokaOne
Unavailable39.TextWrapped = true
Unavailable39.TextScaled = true
Unavailable39.Visible = false
Unavailable39.Parent = Thumbnail23

local UIStroke115 = Instance.new("UIStroke")
UIStroke115.Name = "UIStroke"
UIStroke115.Thickness = 2
UIStroke115.Parent = Unavailable39

local Thumbnail24 = Instance.new("ImageLabel")
Thumbnail24.Name = "Thumbnail"
Thumbnail24.Size = UDim2.new(0.334554,0,0.967788,0)
Thumbnail24.Position = UDim2.new(0.35793,0,0.497652,0)
Thumbnail24.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail24.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail24.BackgroundTransparency = 1
Thumbnail24.BorderSizePixel = 0
Thumbnail24.Image = "rbxassetid://136054611134558"
Thumbnail24.ScaleType = Enum.ScaleType.Fit
Thumbnail24.ZIndex = 0
Thumbnail24.Parent = CanvasGroup6

local Unavailable40 = Instance.new("TextLabel")
Unavailable40.Name = "Unavailable"
Unavailable40.Size = UDim2.new(0.7,0,0.7,0)
Unavailable40.Position = UDim2.new(0.5,0,0.5,0)
Unavailable40.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable40.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable40.BackgroundTransparency = 1
Unavailable40.BorderSizePixel = 0
Unavailable40.Text = "Unavailable"
Unavailable40.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable40.TextSize = 14
Unavailable40.Font = Enum.Font.FredokaOne
Unavailable40.TextWrapped = true
Unavailable40.TextScaled = true
Unavailable40.Visible = false
Unavailable40.Parent = Thumbnail24

local UIStroke116 = Instance.new("UIStroke")
UIStroke116.Name = "UIStroke"
UIStroke116.Thickness = 2
UIStroke116.Parent = Unavailable40

local DisplayTitle9 = Instance.new("TextLabel")
DisplayTitle9.Name = "DisplayTitle"
DisplayTitle9.Size = UDim2.new(0.28831,0,0.367128,0)
DisplayTitle9.Position = UDim2.new(0.814632,0,0.191717,0)
DisplayTitle9.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle9.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle9.BackgroundTransparency = 1
DisplayTitle9.BorderSizePixel = 0
DisplayTitle9.Text = "Cosmo 12\" Deluxe Plush (Pre-Order)"
DisplayTitle9.TextColor3 = Color3.fromRGB(0,0,0)
DisplayTitle9.TextSize = 29
DisplayTitle9.Font = Enum.Font.Arcade
DisplayTitle9.TextWrapped = true
DisplayTitle9.TextScaled = true
DisplayTitle9.RichText = true
DisplayTitle9.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle9.Parent = COM_6148819382656172482

local UIAspectRatioConstraint11 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint11.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint11.AspectRatio = 2.66
UIAspectRatioConstraint11.Parent = DisplayTitle9

local UIGradient39 = Instance.new("UIGradient")
UIGradient39.Name = "UIGradient"
UIGradient39.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient39.Rotation = -90
UIGradient39.Offset = Vector2.new(0,0)
UIGradient39.Enabled = false
UIGradient39.Parent = DisplayTitle9

local UIStroke117 = Instance.new("UIStroke")
UIStroke117.Name = "UIStroke"
UIStroke117.Color = Color3.fromRGB(255,255,255)
UIStroke117.Thickness = 0.931838
UIStroke117.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke117.Parent = DisplayTitle9

local Item12 = Instance.new("ImageLabel")
Item12.Name = "Item"
Item12.Size = UDim2.new(0.913665,0,0.651761,0)
Item12.Position = UDim2.new(0.514096,0,0.463834,0)
Item12.AnchorPoint = Vector2.new(0.5,0.5)
Item12.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item12.BackgroundTransparency = 1
Item12.BorderSizePixel = 0
Item12.Image = "rbxassetid://94959635148921"
Item12.ImageRectOffset = Vector2.new(15,15)
Item12.ImageRectSize = Vector2.new(270,270)
Item12.ScaleType = Enum.ScaleType.Fit
Item12.Visible = false
Item12.ZIndex = -1
Item12.Parent = COM_6148819382656172482

local Unavailable41 = Instance.new("TextLabel")
Unavailable41.Name = "Unavailable"
Unavailable41.Size = UDim2.new(0.7,0,0.7,0)
Unavailable41.Position = UDim2.new(0.5,0,0.5,0)
Unavailable41.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable41.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable41.BackgroundTransparency = 1
Unavailable41.BorderSizePixel = 0
Unavailable41.Text = "Unavailable"
Unavailable41.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable41.TextSize = 14
Unavailable41.Font = Enum.Font.FredokaOne
Unavailable41.TextWrapped = true
Unavailable41.TextScaled = true
Unavailable41.Visible = false
Unavailable41.Parent = Item12

local UIStroke118 = Instance.new("UIStroke")
UIStroke118.Name = "UIStroke"
UIStroke118.Thickness = 2
UIStroke118.Parent = Unavailable41

local Purchase12 = Instance.new("ImageButton")
Purchase12.Name = "Purchase"
Purchase12.Size = UDim2.new(0.299855,0,0.201102,0)
Purchase12.Position = UDim2.new(0.814697,0,0.786462,0)
Purchase12.AnchorPoint = Vector2.new(0.5,0.5)
Purchase12.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase12.BorderSizePixel = 0
Purchase12.ScaleType = Enum.ScaleType.Fit
Purchase12.AutoButtonColor = false
Purchase12.Parent = COM_6148819382656172482

local Price12 = Instance.new("TextLabel")
Price12.Name = "Price"
Price12.Size = UDim2.new(0.78479,0,0.702682,0)
Price12.Position = UDim2.new(0.100663,0,0.0990811,0)
Price12.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price12.BackgroundTransparency = 1
Price12.BorderSizePixel = 0
Price12.Text = "$19.99"
Price12.TextColor3 = Color3.fromRGB(255,255,255)
Price12.TextSize = 14
Price12.Font = Enum.Font.Arcade
Price12.TextWrapped = true
Price12.TextScaled = true
Price12.RichText = true
Price12.AutomaticSize = Enum.AutomaticSize.X
Price12.Parent = Purchase12

local UIGradient40 = Instance.new("UIGradient")
UIGradient40.Name = "UIGradient"
UIGradient40.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient40.Rotation = -90
UIGradient40.Offset = Vector2.new(0,0)
UIGradient40.Parent = Price12

local UIStroke119 = Instance.new("UIStroke")
UIStroke119.Name = "UIStroke"
UIStroke119.Thickness = 0.931838
UIStroke119.Parent = Price12

local UICorner13 = Instance.new("UICorner")
UICorner13.Name = "UICorner"
UICorner13.CornerRadius = UDim.new(1,0)
UICorner13.Parent = Purchase12

local UIGradient41 = Instance.new("UIGradient")
UIGradient41.Name = "UIGradient"
UIGradient41.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient41.Rotation = -90
UIGradient41.Offset = Vector2.new(0,0)
UIGradient41.Parent = Purchase12

local UIScale19 = Instance.new("UIScale")
UIScale19.Name = "UIScale"
UIScale19.Parent = Purchase12

local UIStroke120 = Instance.new("UIStroke")
UIStroke120.Name = "UIStroke"
UIStroke120.Thickness = 1.1648
UIStroke120.Parent = Purchase12

local Thumbnail25 = Instance.new("ImageLabel")
Thumbnail25.Name = "Thumbnail"
Thumbnail25.Size = UDim2.new(0.48234,0,1.34851,0)
Thumbnail25.Position = UDim2.new(0.551555,0,0.39973,0)
Thumbnail25.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail25.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail25.BackgroundTransparency = 1
Thumbnail25.BorderSizePixel = 0
Thumbnail25.Image = "rbxassetid://78833012003561"
Thumbnail25.ScaleType = Enum.ScaleType.Fit
Thumbnail25.ZIndex = 2
Thumbnail25.Parent = COM_6148819382656172482

local Unavailable42 = Instance.new("TextLabel")
Unavailable42.Name = "Unavailable"
Unavailable42.Size = UDim2.new(0.7,0,0.7,0)
Unavailable42.Position = UDim2.new(0.5,0,0.5,0)
Unavailable42.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable42.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable42.BackgroundTransparency = 1
Unavailable42.BorderSizePixel = 0
Unavailable42.Text = "Unavailable"
Unavailable42.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable42.TextSize = 14
Unavailable42.Font = Enum.Font.FredokaOne
Unavailable42.TextWrapped = true
Unavailable42.TextScaled = true
Unavailable42.Visible = false
Unavailable42.Parent = Thumbnail25

local UIStroke121 = Instance.new("UIStroke")
UIStroke121.Name = "UIStroke"
UIStroke121.Thickness = 2
UIStroke121.Parent = Unavailable42

local Title12 = Instance.new("TextLabel")
Title12.Name = "Title"
Title12.Size = UDim2.new(0.566559,0,0.435422,0)
Title12.Position = UDim2.new(0.65544,0,0.15042,0)
Title12.AnchorPoint = Vector2.new(0.5,0)
Title12.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title12.BackgroundTransparency = 1
Title12.BorderSizePixel = 0
Title12.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title12.TextColor3 = Color3.fromRGB(0,13,76)
Title12.TextSize = 29
Title12.Font = Enum.Font.Arcade
Title12.TextWrapped = true
Title12.TextScaled = true
Title12.RichText = true
Title12.Visible = false
Title12.AutomaticSize = Enum.AutomaticSize.X
Title12.Parent = COM_6148819382656172482

local UIGradient42 = Instance.new("UIGradient")
UIGradient42.Name = "UIGradient"
UIGradient42.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient42.Rotation = -90
UIGradient42.Offset = Vector2.new(0,0)
UIGradient42.Parent = Title12

local UIStroke122 = Instance.new("UIStroke")
UIStroke122.Name = "UIStroke"
UIStroke122.Color = Color3.fromRGB(255,255,255)
UIStroke122.Thickness = 2
UIStroke122.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke122.Parent = Title12

local UIListLayout8 = Instance.new("UIListLayout")
UIListLayout8.Name = "UIListLayout"
UIListLayout8.Padding = UDim.new(0.019,0)
UIListLayout8.FillDirection = Enum.FillDirection.Horizontal
UIListLayout8.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout8.Wraps = false
UIListLayout8.Parent = Special7

local Special8 = Instance.new("Frame")
Special8.Name = "Special"
Special8.Size = UDim2.new(1.10498,0,0.439953,0)
Special8.Position = UDim2.new(0,0,-0.143337,0)
Special8.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special8.BackgroundTransparency = 1
Special8.BorderColor3 = Color3.fromRGB(0,0,0)
Special8.BorderSizePixel = 0
Special8.Visible = false
Special8.LayoutOrder = -12
Special8.Parent = ScrollingFrame

local COM_2872958725826675138 = Instance.new("Frame")
COM_2872958725826675138.Name = "COM-2872958725826675138"
COM_2872958725826675138.Size = UDim2.new(0.437886,0,0.931112,0)
COM_2872958725826675138.Position = UDim2.new(-2.68658e-08,0,0,0)
COM_2872958725826675138.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_2872958725826675138.BackgroundTransparency = 1
COM_2872958725826675138.BorderColor3 = Color3.fromRGB(0,0,0)
COM_2872958725826675138.BorderSizePixel = 0
COM_2872958725826675138.LayoutOrder = -1
COM_2872958725826675138.Parent = Special8

local BG13 = Instance.new("Frame")
BG13.Name = "BG"
BG13.Size = UDim2.new(1,0,1,0)
BG13.Position = UDim2.new(0.5,0,0.5,0)
BG13.AnchorPoint = Vector2.new(0.5,0.5)
BG13.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG13.BackgroundTransparency = 1
BG13.BorderColor3 = Color3.fromRGB(0,0,0)
BG13.BorderSizePixel = 0
BG13.ZIndex = -1
BG13.Parent = COM_2872958725826675138

local Dropshadow12 = Instance.new("Frame")
Dropshadow12.Name = "Dropshadow"
Dropshadow12.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow12.Position = UDim2.new(0,0,1.028,0)
Dropshadow12.AnchorPoint = Vector2.new(0,1)
Dropshadow12.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow12.BackgroundTransparency = 0.5
Dropshadow12.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow12.BorderSizePixel = 0
Dropshadow12.ZIndex = -2
Dropshadow12.Parent = BG13

local UIStroke123 = Instance.new("UIStroke")
UIStroke123.Name = "UIStroke"
UIStroke123.Thickness = 2.79551
UIStroke123.Transparency = 1
UIStroke123.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke123.Parent = Dropshadow12

local Frame13 = Instance.new("Frame")
Frame13.Name = "Frame"
Frame13.Size = UDim2.new(0.969681,0,0.95775,0)
Frame13.Position = UDim2.new(0.514096,0,0.478875,0)
Frame13.AnchorPoint = Vector2.new(0.5,0.5)
Frame13.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame13.BorderColor3 = Color3.fromRGB(0,0,0)
Frame13.BorderSizePixel = 0
Frame13.ZIndex = -1
Frame13.Parent = BG13

local Pattern12 = Instance.new("ImageLabel")
Pattern12.Name = "Pattern"
Pattern12.Size = UDim2.new(1,0,1,0)
Pattern12.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern12.BackgroundTransparency = 1
Pattern12.BorderSizePixel = 0
Pattern12.Image = "rbxassetid://97609118599711"
Pattern12.ZIndex = -1
Pattern12.Parent = Frame13

local UIStroke124 = Instance.new("UIStroke")
UIStroke124.Name = "UIStroke"
UIStroke124.Thickness = 1.86368
UIStroke124.Parent = Pattern12

local UIStroke125 = Instance.new("UIStroke")
UIStroke125.Name = "UIStroke"
UIStroke125.Thickness = 1.86368
UIStroke125.Parent = Frame13

local Highlight12 = Instance.new("Frame")
Highlight12.Name = "Highlight"
Highlight12.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight12.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight12.AnchorPoint = Vector2.new(0.5,0.5)
Highlight12.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight12.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight12.BorderSizePixel = 0
Highlight12.Visible = false
Highlight12.ZIndex = -2
Highlight12.Parent = BG13

local UIStroke126 = Instance.new("UIStroke")
UIStroke126.Name = "UIStroke"
UIStroke126.Color = Color3.fromRGB(255,242,0)
UIStroke126.Thickness = 2.79551
UIStroke126.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke126.Parent = Highlight12

local DisplayTitle10 = Instance.new("TextLabel")
DisplayTitle10.Name = "DisplayTitle"
DisplayTitle10.Size = UDim2.new(0.566559,0,0.435422,0)
DisplayTitle10.Position = UDim2.new(0.691046,0,0.15042,0)
DisplayTitle10.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle10.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle10.BackgroundTransparency = 1
DisplayTitle10.BorderSizePixel = 0
DisplayTitle10.Text = "Sprout & Cosmo Friendship Bracelets"
DisplayTitle10.TextColor3 = Color3.fromRGB(0,13,76)
DisplayTitle10.TextSize = 29
DisplayTitle10.Font = Enum.Font.Arcade
DisplayTitle10.TextWrapped = true
DisplayTitle10.TextScaled = true
DisplayTitle10.RichText = true
DisplayTitle10.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle10.Parent = COM_2872958725826675138

local UIGradient43 = Instance.new("UIGradient")
UIGradient43.Name = "UIGradient"
UIGradient43.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient43.Rotation = -90
UIGradient43.Offset = Vector2.new(0,0)
UIGradient43.Parent = DisplayTitle10

local UIStroke127 = Instance.new("UIStroke")
UIStroke127.Name = "UIStroke"
UIStroke127.Color = Color3.fromRGB(255,255,255)
UIStroke127.Thickness = 0.931838
UIStroke127.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke127.Parent = DisplayTitle10

local Item13 = Instance.new("ImageLabel")
Item13.Name = "Item"
Item13.Size = UDim2.new(0.913665,0,0.651761,0)
Item13.Position = UDim2.new(0.514096,0,0.463834,0)
Item13.AnchorPoint = Vector2.new(0.5,0.5)
Item13.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item13.BackgroundTransparency = 1
Item13.BorderSizePixel = 0
Item13.Image = "rbxassetid://94959635148921"
Item13.ImageRectOffset = Vector2.new(15,15)
Item13.ImageRectSize = Vector2.new(270,270)
Item13.ScaleType = Enum.ScaleType.Fit
Item13.Visible = false
Item13.ZIndex = -1
Item13.Parent = COM_2872958725826675138

local Unavailable43 = Instance.new("TextLabel")
Unavailable43.Name = "Unavailable"
Unavailable43.Size = UDim2.new(0.7,0,0.7,0)
Unavailable43.Position = UDim2.new(0.5,0,0.5,0)
Unavailable43.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable43.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable43.BackgroundTransparency = 1
Unavailable43.BorderSizePixel = 0
Unavailable43.Text = "Unavailable"
Unavailable43.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable43.TextSize = 14
Unavailable43.Font = Enum.Font.FredokaOne
Unavailable43.TextWrapped = true
Unavailable43.TextScaled = true
Unavailable43.Visible = false
Unavailable43.Parent = Item13

local UIStroke128 = Instance.new("UIStroke")
UIStroke128.Name = "UIStroke"
UIStroke128.Thickness = 2
UIStroke128.Parent = Unavailable43

local New6 = Instance.new("ImageLabel")
New6.Name = "New"
New6.Size = UDim2.new(0.322123,0,0.355513,0)
New6.Position = UDim2.new(0.924293,0,0.0284983,0)
New6.AnchorPoint = Vector2.new(0.5,0.5)
New6.BackgroundColor3 = Color3.fromRGB(255,255,255)
New6.BackgroundTransparency = 1
New6.BorderSizePixel = 0
New6.Image = "rbxassetid://96728750855907"
New6.ScaleType = Enum.ScaleType.Fit
New6.Visible = false
New6.ZIndex = -1
New6.Parent = COM_2872958725826675138

local UIScale20 = Instance.new("UIScale")
UIScale20.Name = "UIScale"
UIScale20.Parent = New6

local Purchase13 = Instance.new("ImageButton")
Purchase13.Name = "Purchase"
Purchase13.Size = UDim2.new(0.551281,0,0.201102,0)
Purchase13.Position = UDim2.new(0.681037,0,0.790057,0)
Purchase13.AnchorPoint = Vector2.new(0.5,0.5)
Purchase13.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase13.BorderSizePixel = 0
Purchase13.ScaleType = Enum.ScaleType.Fit
Purchase13.AutoButtonColor = false
Purchase13.Parent = COM_2872958725826675138

local Price13 = Instance.new("TextLabel")
Price13.Name = "Price"
Price13.Size = UDim2.new(0.78479,0,0.702682,0)
Price13.Position = UDim2.new(0.100663,0,0.0990811,0)
Price13.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price13.BackgroundTransparency = 1
Price13.BorderSizePixel = 0
Price13.Text = "$19.99"
Price13.TextColor3 = Color3.fromRGB(255,255,255)
Price13.TextSize = 14
Price13.Font = Enum.Font.Arcade
Price13.TextWrapped = true
Price13.TextScaled = true
Price13.RichText = true
Price13.AutomaticSize = Enum.AutomaticSize.X
Price13.Parent = Purchase13

local UIGradient44 = Instance.new("UIGradient")
UIGradient44.Name = "UIGradient"
UIGradient44.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient44.Rotation = -90
UIGradient44.Offset = Vector2.new(0,0)
UIGradient44.Parent = Price13

local UIStroke129 = Instance.new("UIStroke")
UIStroke129.Name = "UIStroke"
UIStroke129.Thickness = 0.931838
UIStroke129.Parent = Price13

local UICorner14 = Instance.new("UICorner")
UICorner14.Name = "UICorner"
UICorner14.CornerRadius = UDim.new(1,0)
UICorner14.Parent = Purchase13

local UIGradient45 = Instance.new("UIGradient")
UIGradient45.Name = "UIGradient"
UIGradient45.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient45.Rotation = -90
UIGradient45.Offset = Vector2.new(0,0)
UIGradient45.Parent = Purchase13

local UIScale21 = Instance.new("UIScale")
UIScale21.Name = "UIScale"
UIScale21.Parent = Purchase13

local UIStroke130 = Instance.new("UIStroke")
UIStroke130.Name = "UIStroke"
UIStroke130.Thickness = 1.1648
UIStroke130.Parent = Purchase13

local Thumbnail26 = Instance.new("ImageLabel")
Thumbnail26.Name = "Thumbnail"
Thumbnail26.Size = UDim2.new(0.593809,0,1.5481,0)
Thumbnail26.Position = UDim2.new(0.234728,0,0.432111,0)
Thumbnail26.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail26.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail26.BackgroundTransparency = 1
Thumbnail26.BorderSizePixel = 0
Thumbnail26.Image = "rbxassetid://100191545370159"
Thumbnail26.ScaleType = Enum.ScaleType.Fit
Thumbnail26.ZIndex = -1
Thumbnail26.Parent = COM_2872958725826675138

local Unavailable44 = Instance.new("TextLabel")
Unavailable44.Name = "Unavailable"
Unavailable44.Size = UDim2.new(0.7,0,0.7,0)
Unavailable44.Position = UDim2.new(0.5,0,0.5,0)
Unavailable44.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable44.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable44.BackgroundTransparency = 1
Unavailable44.BorderSizePixel = 0
Unavailable44.Text = "Unavailable"
Unavailable44.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable44.TextSize = 14
Unavailable44.Font = Enum.Font.FredokaOne
Unavailable44.TextWrapped = true
Unavailable44.TextScaled = true
Unavailable44.Visible = false
Unavailable44.Parent = Thumbnail26

local UIStroke131 = Instance.new("UIStroke")
UIStroke131.Name = "UIStroke"
UIStroke131.Thickness = 2
UIStroke131.Parent = Unavailable44

local Title13 = Instance.new("TextLabel")
Title13.Name = "Title"
Title13.Size = UDim2.new(0.566559,0,0.435422,0)
Title13.Position = UDim2.new(0.65544,0,0.15042,0)
Title13.AnchorPoint = Vector2.new(0.5,0)
Title13.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title13.BackgroundTransparency = 1
Title13.BorderSizePixel = 0
Title13.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title13.TextColor3 = Color3.fromRGB(0,13,76)
Title13.TextSize = 29
Title13.Font = Enum.Font.Arcade
Title13.TextWrapped = true
Title13.TextScaled = true
Title13.RichText = true
Title13.Visible = false
Title13.AutomaticSize = Enum.AutomaticSize.X
Title13.Parent = COM_2872958725826675138

local UIGradient46 = Instance.new("UIGradient")
UIGradient46.Name = "UIGradient"
UIGradient46.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient46.Rotation = -90
UIGradient46.Offset = Vector2.new(0,0)
UIGradient46.Parent = Title13

local UIStroke132 = Instance.new("UIStroke")
UIStroke132.Name = "UIStroke"
UIStroke132.Color = Color3.fromRGB(255,255,255)
UIStroke132.Thickness = 2
UIStroke132.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke132.Parent = Title13

local COM_3505872803146629560 = Instance.new("Frame")
COM_3505872803146629560.Name = "COM-3505872803146629560"
COM_3505872803146629560.Size = UDim2.new(0.437886,0,0.931112,0)
COM_3505872803146629560.Position = UDim2.new(-2.68658e-08,0,0,0)
COM_3505872803146629560.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_3505872803146629560.BackgroundTransparency = 1
COM_3505872803146629560.BorderColor3 = Color3.fromRGB(0,0,0)
COM_3505872803146629560.BorderSizePixel = 0
COM_3505872803146629560.Parent = Special8

local BG14 = Instance.new("Frame")
BG14.Name = "BG"
BG14.Size = UDim2.new(1,0,1,0)
BG14.Position = UDim2.new(0.5,0,0.5,0)
BG14.AnchorPoint = Vector2.new(0.5,0.5)
BG14.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG14.BackgroundTransparency = 1
BG14.BorderColor3 = Color3.fromRGB(0,0,0)
BG14.BorderSizePixel = 0
BG14.ZIndex = -1
BG14.Parent = COM_3505872803146629560

local Dropshadow13 = Instance.new("Frame")
Dropshadow13.Name = "Dropshadow"
Dropshadow13.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow13.Position = UDim2.new(0,0,1.028,0)
Dropshadow13.AnchorPoint = Vector2.new(0,1)
Dropshadow13.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow13.BackgroundTransparency = 0.5
Dropshadow13.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow13.BorderSizePixel = 0
Dropshadow13.ZIndex = -2
Dropshadow13.Parent = BG14

local UIStroke133 = Instance.new("UIStroke")
UIStroke133.Name = "UIStroke"
UIStroke133.Thickness = 2.79551
UIStroke133.Transparency = 1
UIStroke133.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke133.Parent = Dropshadow13

local Frame14 = Instance.new("Frame")
Frame14.Name = "Frame"
Frame14.Size = UDim2.new(0.969681,0,0.95775,0)
Frame14.Position = UDim2.new(0.514096,0,0.478875,0)
Frame14.AnchorPoint = Vector2.new(0.5,0.5)
Frame14.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame14.BorderColor3 = Color3.fromRGB(0,0,0)
Frame14.BorderSizePixel = 0
Frame14.ZIndex = -1
Frame14.Parent = BG14

local Pattern13 = Instance.new("ImageLabel")
Pattern13.Name = "Pattern"
Pattern13.Size = UDim2.new(1,0,1,0)
Pattern13.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern13.BackgroundTransparency = 1
Pattern13.BorderSizePixel = 0
Pattern13.Image = "rbxassetid://106168511877087"
Pattern13.ZIndex = -1
Pattern13.Parent = Frame14

local UIStroke134 = Instance.new("UIStroke")
UIStroke134.Name = "UIStroke"
UIStroke134.Thickness = 1.86368
UIStroke134.Parent = Pattern13

local UIStroke135 = Instance.new("UIStroke")
UIStroke135.Name = "UIStroke"
UIStroke135.Thickness = 1.86368
UIStroke135.Parent = Frame14

local Highlight13 = Instance.new("Frame")
Highlight13.Name = "Highlight"
Highlight13.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight13.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight13.AnchorPoint = Vector2.new(0.5,0.5)
Highlight13.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight13.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight13.BorderSizePixel = 0
Highlight13.Visible = false
Highlight13.ZIndex = -2
Highlight13.Parent = BG14

local UIStroke136 = Instance.new("UIStroke")
UIStroke136.Name = "UIStroke"
UIStroke136.Color = Color3.fromRGB(255,242,0)
UIStroke136.Thickness = 2.79551
UIStroke136.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke136.Parent = Highlight13

local DisplayTitle11 = Instance.new("TextLabel")
DisplayTitle11.Name = "DisplayTitle"
DisplayTitle11.Size = UDim2.new(0.566559,0,0.435422,0)
DisplayTitle11.Position = UDim2.new(0.691046,0,0.15042,0)
DisplayTitle11.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle11.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle11.BackgroundTransparency = 1
DisplayTitle11.BorderSizePixel = 0
DisplayTitle11.Text = "Cosmo Tee"
DisplayTitle11.TextColor3 = Color3.fromRGB(0,13,76)
DisplayTitle11.TextSize = 29
DisplayTitle11.Font = Enum.Font.Arcade
DisplayTitle11.TextWrapped = true
DisplayTitle11.TextScaled = true
DisplayTitle11.RichText = true
DisplayTitle11.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle11.Parent = COM_3505872803146629560

local UIGradient47 = Instance.new("UIGradient")
UIGradient47.Name = "UIGradient"
UIGradient47.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient47.Rotation = -90
UIGradient47.Offset = Vector2.new(0,0)
UIGradient47.Parent = DisplayTitle11

local UIStroke137 = Instance.new("UIStroke")
UIStroke137.Name = "UIStroke"
UIStroke137.Color = Color3.fromRGB(255,255,255)
UIStroke137.Thickness = 0.931838
UIStroke137.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke137.Parent = DisplayTitle11

local Item14 = Instance.new("ImageLabel")
Item14.Name = "Item"
Item14.Size = UDim2.new(0.913665,0,0.651761,0)
Item14.Position = UDim2.new(0.514096,0,0.463834,0)
Item14.AnchorPoint = Vector2.new(0.5,0.5)
Item14.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item14.BackgroundTransparency = 1
Item14.BorderSizePixel = 0
Item14.Image = "rbxassetid://94959635148921"
Item14.ImageRectOffset = Vector2.new(15,15)
Item14.ImageRectSize = Vector2.new(270,270)
Item14.ScaleType = Enum.ScaleType.Fit
Item14.Visible = false
Item14.ZIndex = -1
Item14.Parent = COM_3505872803146629560

local Unavailable45 = Instance.new("TextLabel")
Unavailable45.Name = "Unavailable"
Unavailable45.Size = UDim2.new(0.7,0,0.7,0)
Unavailable45.Position = UDim2.new(0.5,0,0.5,0)
Unavailable45.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable45.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable45.BackgroundTransparency = 1
Unavailable45.BorderSizePixel = 0
Unavailable45.Text = "Unavailable"
Unavailable45.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable45.TextSize = 14
Unavailable45.Font = Enum.Font.FredokaOne
Unavailable45.TextWrapped = true
Unavailable45.TextScaled = true
Unavailable45.Visible = false
Unavailable45.Parent = Item14

local UIStroke138 = Instance.new("UIStroke")
UIStroke138.Name = "UIStroke"
UIStroke138.Thickness = 2
UIStroke138.Parent = Unavailable45

local New7 = Instance.new("ImageLabel")
New7.Name = "New"
New7.Size = UDim2.new(0.322123,0,0.355513,0)
New7.Position = UDim2.new(0.924293,0,0.0284983,0)
New7.AnchorPoint = Vector2.new(0.5,0.5)
New7.BackgroundColor3 = Color3.fromRGB(255,255,255)
New7.BackgroundTransparency = 1
New7.BorderSizePixel = 0
New7.Image = "rbxassetid://96728750855907"
New7.ScaleType = Enum.ScaleType.Fit
New7.Visible = false
New7.ZIndex = -1
New7.Parent = COM_3505872803146629560

local UIScale22 = Instance.new("UIScale")
UIScale22.Name = "UIScale"
UIScale22.Parent = New7

local Purchase14 = Instance.new("ImageButton")
Purchase14.Name = "Purchase"
Purchase14.Size = UDim2.new(0.551281,0,0.201102,0)
Purchase14.Position = UDim2.new(0.681037,0,0.790057,0)
Purchase14.AnchorPoint = Vector2.new(0.5,0.5)
Purchase14.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase14.BorderSizePixel = 0
Purchase14.ScaleType = Enum.ScaleType.Fit
Purchase14.AutoButtonColor = false
Purchase14.Parent = COM_3505872803146629560

local Price14 = Instance.new("TextLabel")
Price14.Name = "Price"
Price14.Size = UDim2.new(0.78479,0,0.702682,0)
Price14.Position = UDim2.new(0.100663,0,0.0990811,0)
Price14.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price14.BackgroundTransparency = 1
Price14.BorderSizePixel = 0
Price14.Text = "$19.99"
Price14.TextColor3 = Color3.fromRGB(255,255,255)
Price14.TextSize = 14
Price14.Font = Enum.Font.Arcade
Price14.TextWrapped = true
Price14.TextScaled = true
Price14.RichText = true
Price14.AutomaticSize = Enum.AutomaticSize.X
Price14.Parent = Purchase14

local UIGradient48 = Instance.new("UIGradient")
UIGradient48.Name = "UIGradient"
UIGradient48.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient48.Rotation = -90
UIGradient48.Offset = Vector2.new(0,0)
UIGradient48.Parent = Price14

local UIStroke139 = Instance.new("UIStroke")
UIStroke139.Name = "UIStroke"
UIStroke139.Thickness = 0.931838
UIStroke139.Parent = Price14

local UICorner15 = Instance.new("UICorner")
UICorner15.Name = "UICorner"
UICorner15.CornerRadius = UDim.new(1,0)
UICorner15.Parent = Purchase14

local UIGradient49 = Instance.new("UIGradient")
UIGradient49.Name = "UIGradient"
UIGradient49.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient49.Rotation = -90
UIGradient49.Offset = Vector2.new(0,0)
UIGradient49.Parent = Purchase14

local UIScale23 = Instance.new("UIScale")
UIScale23.Name = "UIScale"
UIScale23.Parent = Purchase14

local UIStroke140 = Instance.new("UIStroke")
UIStroke140.Name = "UIStroke"
UIStroke140.Thickness = 1.1648
UIStroke140.Parent = Purchase14

local Thumbnail27 = Instance.new("ImageLabel")
Thumbnail27.Name = "Thumbnail"
Thumbnail27.Size = UDim2.new(0.593809,0,1.5481,0)
Thumbnail27.Position = UDim2.new(0.251161,0,0.432111,0)
Thumbnail27.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail27.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail27.BackgroundTransparency = 1
Thumbnail27.BorderSizePixel = 0
Thumbnail27.Image = "rbxassetid://116679125443674"
Thumbnail27.ScaleType = Enum.ScaleType.Fit
Thumbnail27.ZIndex = -1
Thumbnail27.Parent = COM_3505872803146629560

local Unavailable46 = Instance.new("TextLabel")
Unavailable46.Name = "Unavailable"
Unavailable46.Size = UDim2.new(0.7,0,0.7,0)
Unavailable46.Position = UDim2.new(0.5,0,0.5,0)
Unavailable46.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable46.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable46.BackgroundTransparency = 1
Unavailable46.BorderSizePixel = 0
Unavailable46.Text = "Unavailable"
Unavailable46.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable46.TextSize = 14
Unavailable46.Font = Enum.Font.FredokaOne
Unavailable46.TextWrapped = true
Unavailable46.TextScaled = true
Unavailable46.Visible = false
Unavailable46.Parent = Thumbnail27

local UIStroke141 = Instance.new("UIStroke")
UIStroke141.Name = "UIStroke"
UIStroke141.Thickness = 2
UIStroke141.Parent = Unavailable46

local Title14 = Instance.new("TextLabel")
Title14.Name = "Title"
Title14.Size = UDim2.new(0.566559,0,0.435422,0)
Title14.Position = UDim2.new(0.65544,0,0.15042,0)
Title14.AnchorPoint = Vector2.new(0.5,0)
Title14.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title14.BackgroundTransparency = 1
Title14.BorderSizePixel = 0
Title14.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title14.TextColor3 = Color3.fromRGB(0,13,76)
Title14.TextSize = 29
Title14.Font = Enum.Font.Arcade
Title14.TextWrapped = true
Title14.TextScaled = true
Title14.RichText = true
Title14.Visible = false
Title14.AutomaticSize = Enum.AutomaticSize.X
Title14.Parent = COM_3505872803146629560

local UIGradient50 = Instance.new("UIGradient")
UIGradient50.Name = "UIGradient"
UIGradient50.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient50.Rotation = -90
UIGradient50.Offset = Vector2.new(0,0)
UIGradient50.Parent = Title14

local UIStroke142 = Instance.new("UIStroke")
UIStroke142.Name = "UIStroke"
UIStroke142.Color = Color3.fromRGB(255,255,255)
UIStroke142.Thickness = 2
UIStroke142.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke142.Parent = Title14

local UIListLayout9 = Instance.new("UIListLayout")
UIListLayout9.Name = "UIListLayout"
UIListLayout9.Padding = UDim.new(0.019,0)
UIListLayout9.FillDirection = Enum.FillDirection.Horizontal
UIListLayout9.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout9.Wraps = false
UIListLayout9.Parent = Special8

local Special9 = Instance.new("Frame")
Special9.Name = "Special"
Special9.Size = UDim2.new(0.728,0,0.493,0)
Special9.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
Special9.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special9.BackgroundTransparency = 1
Special9.BorderColor3 = Color3.fromRGB(0,0,0)
Special9.BorderSizePixel = 0
Special9.Visible = false
Special9.LayoutOrder = -10
Special9.Parent = ScrollingFrame

local COM_4763821487473951269 = Instance.new("Frame")
COM_4763821487473951269.Name = "COM-4763821487473951269"
COM_4763821487473951269.Size = UDim2.new(0.442523,0,0.944677,0)
COM_4763821487473951269.Position = UDim2.new(0.913307,0,0,0)
COM_4763821487473951269.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_4763821487473951269.BackgroundTransparency = 1
COM_4763821487473951269.BorderColor3 = Color3.fromRGB(0,0,0)
COM_4763821487473951269.BorderSizePixel = 0
COM_4763821487473951269.LayoutOrder = -1
COM_4763821487473951269.Parent = Special9

local BG15 = Instance.new("Frame")
BG15.Name = "BG"
BG15.Size = UDim2.new(1,0,1,0)
BG15.Position = UDim2.new(0.5,0,0.5,0)
BG15.AnchorPoint = Vector2.new(0.5,0.5)
BG15.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG15.BackgroundTransparency = 1
BG15.BorderColor3 = Color3.fromRGB(0,0,0)
BG15.BorderSizePixel = 0
BG15.ZIndex = -1
BG15.Parent = COM_4763821487473951269

local Dropshadow14 = Instance.new("Frame")
Dropshadow14.Name = "Dropshadow"
Dropshadow14.Size = UDim2.new(0.947997,0,0.95376,0)
Dropshadow14.Position = UDim2.new(-0.00747363,0,1.01324,0)
Dropshadow14.AnchorPoint = Vector2.new(0,1)
Dropshadow14.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow14.BackgroundTransparency = 0.5
Dropshadow14.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow14.BorderSizePixel = 0
Dropshadow14.ZIndex = -2
Dropshadow14.Parent = BG15

local UIStroke143 = Instance.new("UIStroke")
UIStroke143.Name = "UIStroke"
UIStroke143.Thickness = 2.79551
UIStroke143.Transparency = 1
UIStroke143.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke143.Parent = Dropshadow14

local Frame15 = Instance.new("Frame")
Frame15.Name = "Frame"
Frame15.Size = UDim2.new(0.984612,0,0.95775,0)
Frame15.Position = UDim2.new(0.506631,0,0.478875,0)
Frame15.AnchorPoint = Vector2.new(0.5,0.5)
Frame15.BackgroundColor3 = Color3.fromRGB(216,75,75)
Frame15.BorderColor3 = Color3.fromRGB(0,0,0)
Frame15.BorderSizePixel = 0
Frame15.ZIndex = -1
Frame15.Parent = BG15

local Pattern14 = Instance.new("ImageLabel")
Pattern14.Name = "Pattern"
Pattern14.Size = UDim2.new(1,0,1,0)
Pattern14.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern14.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern14.BackgroundTransparency = 1
Pattern14.BorderSizePixel = 0
Pattern14.Image = "rbxassetid://93965194514144"
Pattern14.ImageColor3 = Color3.fromRGB(133,243,255)
Pattern14.ScaleType = Enum.ScaleType.Crop
Pattern14.ZIndex = -1
Pattern14.Parent = Frame15

local UIGradient51 = Instance.new("UIGradient")
UIGradient51.Name = "UIGradient"
UIGradient51.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
UIGradient51.Rotation = 90
UIGradient51.Offset = Vector2.new(0,0)
UIGradient51.Parent = Pattern14

local UIStroke144 = Instance.new("UIStroke")
UIStroke144.Name = "UIStroke"
UIStroke144.Thickness = 1.86368
UIStroke144.Parent = Pattern14

local UIGradient52 = Instance.new("UIGradient")
UIGradient52.Name = "UIGradient"
UIGradient52.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient52.Rotation = 90
UIGradient52.Offset = Vector2.new(0,0)
UIGradient52.Parent = Frame15

local UIStroke145 = Instance.new("UIStroke")
UIStroke145.Name = "UIStroke"
UIStroke145.Thickness = 1.86368
UIStroke145.Parent = Frame15

local Highlight14 = Instance.new("Frame")
Highlight14.Name = "Highlight"
Highlight14.Size = UDim2.new(0.954203,0,0.95775,0)
Highlight14.Position = UDim2.new(0.519351,0,0.478875,0)
Highlight14.AnchorPoint = Vector2.new(0.5,0.5)
Highlight14.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight14.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight14.BorderSizePixel = 0
Highlight14.Visible = false
Highlight14.ZIndex = -2
Highlight14.Parent = BG15

local UIStroke146 = Instance.new("UIStroke")
UIStroke146.Name = "UIStroke"
UIStroke146.Color = Color3.fromRGB(255,242,0)
UIStroke146.Thickness = 2.79551
UIStroke146.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke146.Parent = Highlight14

local Item15 = Instance.new("ImageLabel")
Item15.Name = "Item"
Item15.Size = UDim2.new(0.902423,0,0.651761,0)
Item15.Position = UDim2.new(0.521125,0,0.463834,0)
Item15.AnchorPoint = Vector2.new(0.5,0.5)
Item15.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item15.BackgroundTransparency = 1
Item15.BorderSizePixel = 0
Item15.Image = "rbxassetid://94959635148921"
Item15.ImageRectOffset = Vector2.new(25,25)
Item15.ImageRectSize = Vector2.new(250,250)
Item15.ScaleType = Enum.ScaleType.Crop
Item15.Visible = false
Item15.ZIndex = -1
Item15.Parent = COM_4763821487473951269

local Unavailable47 = Instance.new("TextLabel")
Unavailable47.Name = "Unavailable"
Unavailable47.Size = UDim2.new(0.7,0,0.7,0)
Unavailable47.Position = UDim2.new(0.5,0,0.5,0)
Unavailable47.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable47.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable47.BackgroundTransparency = 1
Unavailable47.BorderSizePixel = 0
Unavailable47.Text = "Unavailable"
Unavailable47.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable47.TextSize = 14
Unavailable47.Font = Enum.Font.FredokaOne
Unavailable47.TextWrapped = true
Unavailable47.TextScaled = true
Unavailable47.Visible = false
Unavailable47.Parent = Item15

local UIStroke147 = Instance.new("UIStroke")
UIStroke147.Name = "UIStroke"
UIStroke147.Thickness = 2
UIStroke147.Parent = Unavailable47

local Pixel6 = Instance.new("ImageLabel")
Pixel6.Name = "Pixel"
Pixel6.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel6.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel6.AnchorPoint = Vector2.new(0.5,0.5)
Pixel6.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel6.BorderSizePixel = 0
Pixel6.Image = "rbxassetid://94959635148921"
Pixel6.ImageRectOffset = Vector2.new(55,100)
Pixel6.ImageRectSize = Vector2.new(30,30)
Pixel6.ScaleType = Enum.ScaleType.Crop
Pixel6.Visible = false
Pixel6.ZIndex = 5
Pixel6.Parent = COM_4763821487473951269

local Unavailable48 = Instance.new("TextLabel")
Unavailable48.Name = "Unavailable"
Unavailable48.Size = UDim2.new(0.7,0,0.7,0)
Unavailable48.Position = UDim2.new(0.5,0,0.5,0)
Unavailable48.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable48.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable48.BackgroundTransparency = 1
Unavailable48.BorderSizePixel = 0
Unavailable48.Text = "Unavailable"
Unavailable48.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable48.TextSize = 14
Unavailable48.Font = Enum.Font.FredokaOne
Unavailable48.TextWrapped = true
Unavailable48.TextScaled = true
Unavailable48.Visible = false
Unavailable48.Parent = Pixel6

local UIStroke148 = Instance.new("UIStroke")
UIStroke148.Name = "UIStroke"
UIStroke148.Thickness = 2
UIStroke148.Parent = Unavailable48

local Purchase15 = Instance.new("ImageButton")
Purchase15.Name = "Purchase"
Purchase15.Size = UDim2.new(0.863319,0,0.170445,0)
Purchase15.Position = UDim2.new(0.514166,0,0.821691,0)
Purchase15.AnchorPoint = Vector2.new(0.5,0.5)
Purchase15.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase15.BorderSizePixel = 0
Purchase15.ScaleType = Enum.ScaleType.Fit
Purchase15.AutoButtonColor = false
Purchase15.ZIndex = 6
Purchase15.Parent = COM_4763821487473951269

local Price15 = Instance.new("TextLabel")
Price15.Name = "Price"
Price15.Size = UDim2.new(0.78479,0,0.702682,0)
Price15.Position = UDim2.new(0.100663,0,0.0990811,0)
Price15.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price15.BackgroundTransparency = 1
Price15.BorderSizePixel = 0
Price15.Text = "$19.99"
Price15.TextColor3 = Color3.fromRGB(255,255,255)
Price15.TextSize = 14
Price15.Font = Enum.Font.Arcade
Price15.TextWrapped = true
Price15.TextScaled = true
Price15.RichText = true
Price15.AutomaticSize = Enum.AutomaticSize.X
Price15.Parent = Purchase15

local UIGradient53 = Instance.new("UIGradient")
UIGradient53.Name = "UIGradient"
UIGradient53.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient53.Rotation = -90
UIGradient53.Offset = Vector2.new(0,0)
UIGradient53.Parent = Price15

local UIStroke149 = Instance.new("UIStroke")
UIStroke149.Name = "UIStroke"
UIStroke149.Thickness = 2
UIStroke149.Parent = Price15

local UICorner16 = Instance.new("UICorner")
UICorner16.Name = "UICorner"
UICorner16.CornerRadius = UDim.new(1,0)
UICorner16.Parent = Purchase15

local UIGradient54 = Instance.new("UIGradient")
UIGradient54.Name = "UIGradient"
UIGradient54.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient54.Rotation = -90
UIGradient54.Offset = Vector2.new(0,0)
UIGradient54.Parent = Purchase15

local UIScale24 = Instance.new("UIScale")
UIScale24.Name = "UIScale"
UIScale24.Parent = Purchase15

local UIStroke150 = Instance.new("UIStroke")
UIStroke150.Name = "UIStroke"
UIStroke150.Thickness = 2.5
UIStroke150.Parent = Purchase15

local Thumbnail28 = Instance.new("ImageLabel")
Thumbnail28.Name = "Thumbnail"
Thumbnail28.Size = UDim2.new(1.15659,0,0.857211,0)
Thumbnail28.Position = UDim2.new(0.495381,0,0.470327,0)
Thumbnail28.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail28.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail28.BackgroundTransparency = 1
Thumbnail28.BorderSizePixel = 0
Thumbnail28.Image = "rbxassetid://132311928411797"
Thumbnail28.ScaleType = Enum.ScaleType.Crop
Thumbnail28.ZIndex = -1
Thumbnail28.Parent = COM_4763821487473951269

local Unavailable49 = Instance.new("TextLabel")
Unavailable49.Name = "Unavailable"
Unavailable49.Size = UDim2.new(0.7,0,0.7,0)
Unavailable49.Position = UDim2.new(0.5,0,0.5,0)
Unavailable49.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable49.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable49.BackgroundTransparency = 1
Unavailable49.BorderSizePixel = 0
Unavailable49.Text = "Unavailable"
Unavailable49.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable49.TextSize = 14
Unavailable49.Font = Enum.Font.FredokaOne
Unavailable49.TextWrapped = true
Unavailable49.TextScaled = true
Unavailable49.Visible = false
Unavailable49.Parent = Thumbnail28

local UIStroke151 = Instance.new("UIStroke")
UIStroke151.Name = "UIStroke"
UIStroke151.Thickness = 2
UIStroke151.Parent = Unavailable49

local Title15 = Instance.new("TextLabel")
Title15.Name = "Title"
Title15.Size = UDim2.new(0.874784,0,0.149,0)
Title15.Position = UDim2.new(0.531264,0,0.0306123,0)
Title15.AnchorPoint = Vector2.new(0.5,0)
Title15.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title15.BackgroundTransparency = 1
Title15.BorderSizePixel = 0
Title15.Text = "Bobette 11” x 14” Poster"
Title15.TextColor3 = Color3.fromRGB(0,0,0)
Title15.TextSize = 29
Title15.Font = Enum.Font.Arcade
Title15.TextXAlignment = Enum.TextXAlignment.Left
Title15.TextYAlignment = Enum.TextYAlignment.Top
Title15.TextWrapped = true
Title15.TextScaled = true
Title15.RichText = true
Title15.Visible = false
Title15.AutomaticSize = Enum.AutomaticSize.X
Title15.Parent = COM_4763821487473951269

local UITextSizeConstraint9 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint9.Name = "UITextSizeConstraint"
UITextSizeConstraint9.MaxTextSize = 29
UITextSizeConstraint9.Parent = Title15

local COM_196327040390136234 = Instance.new("Frame")
COM_196327040390136234.Name = "COM-196327040390136234"
COM_196327040390136234.Size = UDim2.new(0.894198,0,0.931112,0)
COM_196327040390136234.Position = UDim2.new(5.4771e-08,0,0,0)
COM_196327040390136234.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_196327040390136234.BackgroundTransparency = 1
COM_196327040390136234.BorderColor3 = Color3.fromRGB(0,0,0)
COM_196327040390136234.BorderSizePixel = 0
COM_196327040390136234.ZIndex = 2
COM_196327040390136234.Parent = Special9

local BG16 = Instance.new("Frame")
BG16.Name = "BG"
BG16.Size = UDim2.new(1,0,1,0)
BG16.Position = UDim2.new(0.5,0,0.5,0)
BG16.AnchorPoint = Vector2.new(0.5,0.5)
BG16.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG16.BackgroundTransparency = 1
BG16.BorderColor3 = Color3.fromRGB(0,0,0)
BG16.BorderSizePixel = 0
BG16.ZIndex = -1
BG16.Parent = COM_196327040390136234

local Dropshadow15 = Instance.new("Frame")
Dropshadow15.Name = "Dropshadow"
Dropshadow15.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow15.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow15.AnchorPoint = Vector2.new(0,1)
Dropshadow15.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow15.BackgroundTransparency = 0.5
Dropshadow15.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow15.BorderSizePixel = 0
Dropshadow15.ZIndex = -2
Dropshadow15.Parent = BG16

local UIStroke152 = Instance.new("UIStroke")
UIStroke152.Name = "UIStroke"
UIStroke152.Thickness = 2.79551
UIStroke152.Transparency = 1
UIStroke152.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke152.Parent = Dropshadow15

local Frame16 = Instance.new("Frame")
Frame16.Name = "Frame"
Frame16.Size = UDim2.new(0.984612,0,0.95775,0)
Frame16.Position = UDim2.new(0.506631,0,0.478875,0)
Frame16.AnchorPoint = Vector2.new(0.5,0.5)
Frame16.BackgroundColor3 = Color3.fromRGB(216,75,75)
Frame16.BorderColor3 = Color3.fromRGB(0,0,0)
Frame16.BorderSizePixel = 0
Frame16.ZIndex = -1
Frame16.Parent = BG16

local Pattern15 = Instance.new("ImageLabel")
Pattern15.Name = "Pattern"
Pattern15.Size = UDim2.new(1,0,1,0)
Pattern15.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern15.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern15.BackgroundTransparency = 1
Pattern15.BorderSizePixel = 0
Pattern15.Image = "rbxassetid://93965194514144"
Pattern15.ImageColor3 = Color3.fromRGB(133,243,255)
Pattern15.ZIndex = -1
Pattern15.Parent = Frame16

local UIGradient55 = Instance.new("UIGradient")
UIGradient55.Name = "UIGradient"
UIGradient55.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
UIGradient55.Rotation = 90
UIGradient55.Offset = Vector2.new(0,0)
UIGradient55.Parent = Pattern15

local UIStroke153 = Instance.new("UIStroke")
UIStroke153.Name = "UIStroke"
UIStroke153.Thickness = 1.86368
UIStroke153.Parent = Pattern15

local UIGradient56 = Instance.new("UIGradient")
UIGradient56.Name = "UIGradient"
UIGradient56.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient56.Rotation = 90
UIGradient56.Offset = Vector2.new(0,0)
UIGradient56.Parent = Frame16

local UIStroke154 = Instance.new("UIStroke")
UIStroke154.Name = "UIStroke"
UIStroke154.Thickness = 1.86368
UIStroke154.Parent = Frame16

local Highlight15 = Instance.new("Frame")
Highlight15.Name = "Highlight"
Highlight15.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight15.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight15.AnchorPoint = Vector2.new(0.5,0.5)
Highlight15.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight15.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight15.BorderSizePixel = 0
Highlight15.Visible = false
Highlight15.ZIndex = -2
Highlight15.Parent = BG16

local UIStroke155 = Instance.new("UIStroke")
UIStroke155.Name = "UIStroke"
UIStroke155.Color = Color3.fromRGB(255,242,0)
UIStroke155.Thickness = 2.79551
UIStroke155.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke155.Parent = Highlight15

local CanvasGroup7 = Instance.new("CanvasGroup")
CanvasGroup7.Name = "CanvasGroup"
CanvasGroup7.Size = UDim2.new(0.970515,0,0.95775,0)
CanvasGroup7.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup7.BackgroundTransparency = 1
CanvasGroup7.Parent = COM_196327040390136234

local Thumbnail29 = Instance.new("ImageLabel")
Thumbnail29.Name = "Thumbnail"
Thumbnail29.Size = UDim2.new(0.470619,0,1.14854,0)
Thumbnail29.Position = UDim2.new(0.165209,0,0.529027,0)
Thumbnail29.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail29.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail29.BackgroundTransparency = 1
Thumbnail29.BorderSizePixel = 0
Thumbnail29.Image = "rbxassetid://125797882035757"
Thumbnail29.ScaleType = Enum.ScaleType.Fit
Thumbnail29.Rotation = -11
Thumbnail29.Parent = CanvasGroup7

local Unavailable50 = Instance.new("TextLabel")
Unavailable50.Name = "Unavailable"
Unavailable50.Size = UDim2.new(0.7,0,0.7,0)
Unavailable50.Position = UDim2.new(0.5,0,0.5,0)
Unavailable50.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable50.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable50.BackgroundTransparency = 1
Unavailable50.BorderSizePixel = 0
Unavailable50.Text = "Unavailable"
Unavailable50.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable50.TextSize = 14
Unavailable50.Font = Enum.Font.FredokaOne
Unavailable50.TextWrapped = true
Unavailable50.TextScaled = true
Unavailable50.Visible = false
Unavailable50.Parent = Thumbnail29

local UIStroke156 = Instance.new("UIStroke")
UIStroke156.Name = "UIStroke"
UIStroke156.Thickness = 2
UIStroke156.Parent = Unavailable50

local DisplayTitle12 = Instance.new("TextLabel")
DisplayTitle12.Name = "DisplayTitle"
DisplayTitle12.Size = UDim2.new(0.447811,0,0.334729,0)
DisplayTitle12.Position = UDim2.new(0.752098,0,0.261677,0)
DisplayTitle12.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle12.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle12.BackgroundTransparency = 1
DisplayTitle12.BorderSizePixel = 0
DisplayTitle12.Text = "Goob\
 Deluxe 14\" Plush"
DisplayTitle12.TextColor3 = Color3.fromRGB(2,40,0)
DisplayTitle12.TextSize = 29
DisplayTitle12.Font = Enum.Font.Arcade
DisplayTitle12.TextWrapped = true
DisplayTitle12.TextScaled = true
DisplayTitle12.RichText = true
DisplayTitle12.Parent = COM_196327040390136234

local UIGradient57 = Instance.new("UIGradient")
UIGradient57.Name = "UIGradient"
UIGradient57.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient57.Rotation = -90
UIGradient57.Offset = Vector2.new(0,0)
UIGradient57.Parent = DisplayTitle12

local UIStroke157 = Instance.new("UIStroke")
UIStroke157.Name = "UIStroke"
UIStroke157.Color = Color3.fromRGB(255,255,255)
UIStroke157.Thickness = 0.931838
UIStroke157.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke157.Parent = DisplayTitle12

local Item16 = Instance.new("ImageLabel")
Item16.Name = "Item"
Item16.Size = UDim2.new(0.913665,0,0.651761,0)
Item16.Position = UDim2.new(0.514096,0,0.463834,0)
Item16.AnchorPoint = Vector2.new(0.5,0.5)
Item16.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item16.BackgroundTransparency = 1
Item16.BorderSizePixel = 0
Item16.Image = "rbxassetid://94959635148921"
Item16.ImageRectOffset = Vector2.new(15,15)
Item16.ImageRectSize = Vector2.new(270,270)
Item16.ScaleType = Enum.ScaleType.Fit
Item16.Visible = false
Item16.ZIndex = -1
Item16.Parent = COM_196327040390136234

local Unavailable51 = Instance.new("TextLabel")
Unavailable51.Name = "Unavailable"
Unavailable51.Size = UDim2.new(0.7,0,0.7,0)
Unavailable51.Position = UDim2.new(0.5,0,0.5,0)
Unavailable51.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable51.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable51.BackgroundTransparency = 1
Unavailable51.BorderSizePixel = 0
Unavailable51.Text = "Unavailable"
Unavailable51.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable51.TextSize = 14
Unavailable51.Font = Enum.Font.FredokaOne
Unavailable51.TextWrapped = true
Unavailable51.TextScaled = true
Unavailable51.Visible = false
Unavailable51.Parent = Item16

local UIStroke158 = Instance.new("UIStroke")
UIStroke158.Name = "UIStroke"
UIStroke158.Thickness = 2
UIStroke158.Parent = Unavailable51

local Purchase16 = Instance.new("ImageButton")
Purchase16.Name = "Purchase"
Purchase16.Size = UDim2.new(0.436835,0,0.172928,0)
Purchase16.Position = UDim2.new(0.752098,0,0.833662,0)
Purchase16.AnchorPoint = Vector2.new(0.5,0.5)
Purchase16.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase16.BorderSizePixel = 0
Purchase16.ScaleType = Enum.ScaleType.Fit
Purchase16.AutoButtonColor = false
Purchase16.ZIndex = 5
Purchase16.Parent = COM_196327040390136234

local Price16 = Instance.new("TextLabel")
Price16.Name = "Price"
Price16.Size = UDim2.new(0.78479,0,0.702682,0)
Price16.Position = UDim2.new(0.100663,0,0.0990811,0)
Price16.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price16.BackgroundTransparency = 1
Price16.BorderSizePixel = 0
Price16.Text = "$19.99"
Price16.TextColor3 = Color3.fromRGB(255,255,255)
Price16.TextSize = 14
Price16.Font = Enum.Font.Arcade
Price16.TextWrapped = true
Price16.TextScaled = true
Price16.RichText = true
Price16.AutomaticSize = Enum.AutomaticSize.X
Price16.Parent = Purchase16

local UIGradient58 = Instance.new("UIGradient")
UIGradient58.Name = "UIGradient"
UIGradient58.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient58.Rotation = -90
UIGradient58.Offset = Vector2.new(0,0)
UIGradient58.Parent = Price16

local UIStroke159 = Instance.new("UIStroke")
UIStroke159.Name = "UIStroke"
UIStroke159.Thickness = 0.931838
UIStroke159.Parent = Price16

local UICorner17 = Instance.new("UICorner")
UICorner17.Name = "UICorner"
UICorner17.CornerRadius = UDim.new(1,0)
UICorner17.Parent = Purchase16

local UIGradient59 = Instance.new("UIGradient")
UIGradient59.Name = "UIGradient"
UIGradient59.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient59.Rotation = -90
UIGradient59.Offset = Vector2.new(0,0)
UIGradient59.Parent = Purchase16

local UIScale25 = Instance.new("UIScale")
UIScale25.Name = "UIScale"
UIScale25.Parent = Purchase16

local UIStroke160 = Instance.new("UIStroke")
UIStroke160.Name = "UIStroke"
UIStroke160.Thickness = 1.1648
UIStroke160.Parent = Purchase16

local Thumbnail30 = Instance.new("ImageLabel")
Thumbnail30.Name = "Thumbnail"
Thumbnail30.Size = UDim2.new(0.48234,0,1.2575,0)
Thumbnail30.Position = UDim2.new(0.42096,0,0.450994,0)
Thumbnail30.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail30.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail30.BackgroundTransparency = 1
Thumbnail30.BorderSizePixel = 0
Thumbnail30.Image = "rbxassetid://130388109305519"
Thumbnail30.ScaleType = Enum.ScaleType.Fit
Thumbnail30.ZIndex = 4
Thumbnail30.Parent = COM_196327040390136234

local Unavailable52 = Instance.new("TextLabel")
Unavailable52.Name = "Unavailable"
Unavailable52.Size = UDim2.new(0.7,0,0.7,0)
Unavailable52.Position = UDim2.new(0.5,0,0.5,0)
Unavailable52.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable52.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable52.BackgroundTransparency = 1
Unavailable52.BorderSizePixel = 0
Unavailable52.Text = "Unavailable"
Unavailable52.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable52.TextSize = 14
Unavailable52.Font = Enum.Font.FredokaOne
Unavailable52.TextWrapped = true
Unavailable52.TextScaled = true
Unavailable52.Visible = false
Unavailable52.Parent = Thumbnail30

local UIStroke161 = Instance.new("UIStroke")
UIStroke161.Name = "UIStroke"
UIStroke161.Thickness = 2
UIStroke161.Parent = Unavailable52

local Title16 = Instance.new("TextLabel")
Title16.Name = "Title"
Title16.Size = UDim2.new(0.566559,0,0.435422,0)
Title16.Position = UDim2.new(0.65544,0,0.15042,0)
Title16.AnchorPoint = Vector2.new(0.5,0)
Title16.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title16.BackgroundTransparency = 1
Title16.BorderSizePixel = 0
Title16.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title16.TextColor3 = Color3.fromRGB(0,13,76)
Title16.TextSize = 29
Title16.Font = Enum.Font.Arcade
Title16.TextWrapped = true
Title16.TextScaled = true
Title16.RichText = true
Title16.Visible = false
Title16.AutomaticSize = Enum.AutomaticSize.X
Title16.Parent = COM_196327040390136234

local UIGradient60 = Instance.new("UIGradient")
UIGradient60.Name = "UIGradient"
UIGradient60.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient60.Rotation = -90
UIGradient60.Offset = Vector2.new(0,0)
UIGradient60.Parent = Title16

local UIStroke162 = Instance.new("UIStroke")
UIStroke162.Name = "UIStroke"
UIStroke162.Color = Color3.fromRGB(255,255,255)
UIStroke162.Thickness = 2
UIStroke162.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke162.Parent = Title16

local UIListLayout10 = Instance.new("UIListLayout")
UIListLayout10.Name = "UIListLayout"
UIListLayout10.Padding = UDim.new(0.019,0)
UIListLayout10.FillDirection = Enum.FillDirection.Horizontal
UIListLayout10.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout10.Wraps = false
UIListLayout10.Parent = Special9

local Special10 = Instance.new("Frame")
Special10.Name = "Special"
Special10.Size = UDim2.new(0.728177,0,0.493216,0)
Special10.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
Special10.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special10.BackgroundTransparency = 1
Special10.BorderColor3 = Color3.fromRGB(0,0,0)
Special10.BorderSizePixel = 0
Special10.LayoutOrder = -9
Special10.Parent = ScrollingFrame

local COM_3058750999868080584 = Instance.new("Frame")
COM_3058750999868080584.Name = "COM-3058750999868080584"
COM_3058750999868080584.Size = UDim2.new(0.442523,0,0.944677,0)
COM_3058750999868080584.Position = UDim2.new(0.913307,0,0,0)
COM_3058750999868080584.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_3058750999868080584.BackgroundTransparency = 1
COM_3058750999868080584.BorderColor3 = Color3.fromRGB(0,0,0)
COM_3058750999868080584.BorderSizePixel = 0
COM_3058750999868080584.Parent = Special10

local BG17 = Instance.new("Frame")
BG17.Name = "BG"
BG17.Size = UDim2.new(1,0,1,0)
BG17.Position = UDim2.new(0.5,0,0.5,0)
BG17.AnchorPoint = Vector2.new(0.5,0.5)
BG17.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG17.BackgroundTransparency = 1
BG17.BorderColor3 = Color3.fromRGB(0,0,0)
BG17.BorderSizePixel = 0
BG17.ZIndex = -1
BG17.Parent = COM_3058750999868080584

local Dropshadow16 = Instance.new("Frame")
Dropshadow16.Name = "Dropshadow"
Dropshadow16.Size = UDim2.new(0.947997,0,0.95376,0)
Dropshadow16.Position = UDim2.new(-0.00747363,0,1.01324,0)
Dropshadow16.AnchorPoint = Vector2.new(0,1)
Dropshadow16.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow16.BackgroundTransparency = 0.5
Dropshadow16.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow16.BorderSizePixel = 0
Dropshadow16.ZIndex = -2
Dropshadow16.Parent = BG17

local UIStroke163 = Instance.new("UIStroke")
UIStroke163.Name = "UIStroke"
UIStroke163.Thickness = 2.79551
UIStroke163.Transparency = 1
UIStroke163.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke163.Parent = Dropshadow16

local Frame17 = Instance.new("Frame")
Frame17.Name = "Frame"
Frame17.Size = UDim2.new(0.95775,0,0.95775,0)
Frame17.Position = UDim2.new(0.521125,0,0.478875,0)
Frame17.AnchorPoint = Vector2.new(0.5,0.5)
Frame17.BackgroundColor3 = Color3.fromRGB(216,175,177)
Frame17.BorderColor3 = Color3.fromRGB(0,0,0)
Frame17.BorderSizePixel = 0
Frame17.ZIndex = -1
Frame17.Parent = BG17

local Pattern16 = Instance.new("ImageLabel")
Pattern16.Name = "Pattern"
Pattern16.Size = UDim2.new(1,0,1,0)
Pattern16.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern16.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern16.BackgroundTransparency = 1
Pattern16.BorderSizePixel = 0
Pattern16.Image = "rbxassetid://84524606651700"
Pattern16.ScaleType = Enum.ScaleType.Crop
Pattern16.ZIndex = -1
Pattern16.Parent = Frame17

local UIGradient61 = Instance.new("UIGradient")
UIGradient61.Name = "UIGradient"
UIGradient61.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
UIGradient61.Rotation = 90
UIGradient61.Offset = Vector2.new(0,0)
UIGradient61.Enabled = false
UIGradient61.Parent = Pattern16

local UIStroke164 = Instance.new("UIStroke")
UIStroke164.Name = "UIStroke"
UIStroke164.Thickness = 1.86368
UIStroke164.Parent = Pattern16

local UIGradient62 = Instance.new("UIGradient")
UIGradient62.Name = "UIGradient"
UIGradient62.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient62.Rotation = 90
UIGradient62.Offset = Vector2.new(0,0)
UIGradient62.Parent = Frame17

local UIStroke165 = Instance.new("UIStroke")
UIStroke165.Name = "UIStroke"
UIStroke165.Thickness = 4
UIStroke165.Parent = Frame17

local Highlight16 = Instance.new("Frame")
Highlight16.Name = "Highlight"
Highlight16.Size = UDim2.new(0.954203,0,0.95775,0)
Highlight16.Position = UDim2.new(0.519351,0,0.478875,0)
Highlight16.AnchorPoint = Vector2.new(0.5,0.5)
Highlight16.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight16.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight16.BorderSizePixel = 0
Highlight16.Visible = false
Highlight16.ZIndex = -2
Highlight16.Parent = BG17

local UIStroke166 = Instance.new("UIStroke")
UIStroke166.Name = "UIStroke"
UIStroke166.Color = Color3.fromRGB(255,242,0)
UIStroke166.Thickness = 2.79551
UIStroke166.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke166.Parent = Highlight16

local Item17 = Instance.new("ImageLabel")
Item17.Name = "Item"
Item17.Size = UDim2.new(0.902423,0,0.651761,0)
Item17.Position = UDim2.new(0.521125,0,0.463834,0)
Item17.AnchorPoint = Vector2.new(0.5,0.5)
Item17.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item17.BackgroundTransparency = 1
Item17.BorderSizePixel = 0
Item17.Image = "rbxassetid://94959635148921"
Item17.ImageRectOffset = Vector2.new(25,25)
Item17.ImageRectSize = Vector2.new(250,250)
Item17.ScaleType = Enum.ScaleType.Crop
Item17.Visible = false
Item17.ZIndex = -1
Item17.Parent = COM_3058750999868080584

local Unavailable53 = Instance.new("TextLabel")
Unavailable53.Name = "Unavailable"
Unavailable53.Size = UDim2.new(0.7,0,0.7,0)
Unavailable53.Position = UDim2.new(0.5,0,0.5,0)
Unavailable53.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable53.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable53.BackgroundTransparency = 1
Unavailable53.BorderSizePixel = 0
Unavailable53.Text = "Unavailable"
Unavailable53.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable53.TextSize = 14
Unavailable53.Font = Enum.Font.FredokaOne
Unavailable53.TextWrapped = true
Unavailable53.TextScaled = true
Unavailable53.Visible = false
Unavailable53.Parent = Item17

local UIStroke167 = Instance.new("UIStroke")
UIStroke167.Name = "UIStroke"
UIStroke167.Thickness = 2
UIStroke167.Parent = Unavailable53

local Pixel7 = Instance.new("ImageLabel")
Pixel7.Name = "Pixel"
Pixel7.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel7.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel7.AnchorPoint = Vector2.new(0.5,0.5)
Pixel7.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel7.BorderSizePixel = 0
Pixel7.Image = "rbxassetid://94959635148921"
Pixel7.ImageRectOffset = Vector2.new(55,100)
Pixel7.ImageRectSize = Vector2.new(30,30)
Pixel7.ScaleType = Enum.ScaleType.Crop
Pixel7.Visible = false
Pixel7.ZIndex = 5
Pixel7.Parent = COM_3058750999868080584

local Unavailable54 = Instance.new("TextLabel")
Unavailable54.Name = "Unavailable"
Unavailable54.Size = UDim2.new(0.7,0,0.7,0)
Unavailable54.Position = UDim2.new(0.5,0,0.5,0)
Unavailable54.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable54.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable54.BackgroundTransparency = 1
Unavailable54.BorderSizePixel = 0
Unavailable54.Text = "Unavailable"
Unavailable54.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable54.TextSize = 14
Unavailable54.Font = Enum.Font.FredokaOne
Unavailable54.TextWrapped = true
Unavailable54.TextScaled = true
Unavailable54.Visible = false
Unavailable54.Parent = Pixel7

local UIStroke168 = Instance.new("UIStroke")
UIStroke168.Name = "UIStroke"
UIStroke168.Thickness = 2
UIStroke168.Parent = Unavailable54

local Purchase17 = Instance.new("ImageButton")
Purchase17.Name = "Purchase"
Purchase17.Size = UDim2.new(0.863319,0,0.170445,0)
Purchase17.Position = UDim2.new(0.514166,0,0.821691,0)
Purchase17.AnchorPoint = Vector2.new(0.5,0.5)
Purchase17.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase17.BorderSizePixel = 0
Purchase17.ScaleType = Enum.ScaleType.Fit
Purchase17.AutoButtonColor = false
Purchase17.ZIndex = 6
Purchase17.Parent = COM_3058750999868080584

local Price17 = Instance.new("TextLabel")
Price17.Name = "Price"
Price17.Size = UDim2.new(0.78479,0,0.702682,0)
Price17.Position = UDim2.new(0.100663,0,0.0990811,0)
Price17.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price17.BackgroundTransparency = 1
Price17.BorderSizePixel = 0
Price17.Text = "$19.99"
Price17.TextColor3 = Color3.fromRGB(255,255,255)
Price17.TextSize = 14
Price17.Font = Enum.Font.Arcade
Price17.TextWrapped = true
Price17.TextScaled = true
Price17.RichText = true
Price17.AutomaticSize = Enum.AutomaticSize.X
Price17.Parent = Purchase17

local UIGradient63 = Instance.new("UIGradient")
UIGradient63.Name = "UIGradient"
UIGradient63.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient63.Rotation = -90
UIGradient63.Offset = Vector2.new(0,0)
UIGradient63.Parent = Price17

local UIStroke169 = Instance.new("UIStroke")
UIStroke169.Name = "UIStroke"
UIStroke169.Thickness = 2
UIStroke169.Parent = Price17

local UICorner18 = Instance.new("UICorner")
UICorner18.Name = "UICorner"
UICorner18.CornerRadius = UDim.new(1,0)
UICorner18.Parent = Purchase17

local UIGradient64 = Instance.new("UIGradient")
UIGradient64.Name = "UIGradient"
UIGradient64.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient64.Rotation = -90
UIGradient64.Offset = Vector2.new(0,0)
UIGradient64.Parent = Purchase17

local UIScale26 = Instance.new("UIScale")
UIScale26.Name = "UIScale"
UIScale26.Parent = Purchase17

local UIStroke170 = Instance.new("UIStroke")
UIStroke170.Name = "UIStroke"
UIStroke170.Thickness = 2.5
UIStroke170.Parent = Purchase17

local Thumbnail31 = Instance.new("ImageLabel")
Thumbnail31.Name = "Thumbnail"
Thumbnail31.Size = UDim2.new(1.15659,0,0.857211,0)
Thumbnail31.Position = UDim2.new(0.495381,0,0.470327,0)
Thumbnail31.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail31.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail31.BackgroundTransparency = 1
Thumbnail31.BorderSizePixel = 0
Thumbnail31.Image = "rbxassetid://83831236539287"
Thumbnail31.ScaleType = Enum.ScaleType.Crop
Thumbnail31.ZIndex = -1
Thumbnail31.Parent = COM_3058750999868080584

local Unavailable55 = Instance.new("TextLabel")
Unavailable55.Name = "Unavailable"
Unavailable55.Size = UDim2.new(0.7,0,0.7,0)
Unavailable55.Position = UDim2.new(0.5,0,0.5,0)
Unavailable55.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable55.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable55.BackgroundTransparency = 1
Unavailable55.BorderSizePixel = 0
Unavailable55.Text = "Unavailable"
Unavailable55.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable55.TextSize = 14
Unavailable55.Font = Enum.Font.FredokaOne
Unavailable55.TextWrapped = true
Unavailable55.TextScaled = true
Unavailable55.Visible = false
Unavailable55.Parent = Thumbnail31

local UIStroke171 = Instance.new("UIStroke")
UIStroke171.Name = "UIStroke"
UIStroke171.Thickness = 2
UIStroke171.Parent = Unavailable55

local Title17 = Instance.new("TextLabel")
Title17.Name = "Title"
Title17.Size = UDim2.new(0.874784,0,0.149,0)
Title17.Position = UDim2.new(0.531264,0,0.0306123,0)
Title17.AnchorPoint = Vector2.new(0.5,0)
Title17.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title17.BackgroundTransparency = 1
Title17.BorderSizePixel = 0
Title17.Text = "Bobette 11” x 14” Poster"
Title17.TextColor3 = Color3.fromRGB(0,0,0)
Title17.TextSize = 29
Title17.Font = Enum.Font.Arcade
Title17.TextXAlignment = Enum.TextXAlignment.Left
Title17.TextYAlignment = Enum.TextYAlignment.Top
Title17.TextWrapped = true
Title17.TextScaled = true
Title17.RichText = true
Title17.Visible = false
Title17.AutomaticSize = Enum.AutomaticSize.X
Title17.Parent = COM_3058750999868080584

local UITextSizeConstraint10 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint10.Name = "UITextSizeConstraint"
UITextSizeConstraint10.MaxTextSize = 29
UITextSizeConstraint10.Parent = Title17

local COM_5199649672729330113 = Instance.new("Frame")
COM_5199649672729330113.Name = "COM-5199649672729330113"
COM_5199649672729330113.Size = UDim2.new(0.894198,0,0.931112,0)
COM_5199649672729330113.Position = UDim2.new(5.4771e-08,0,0,0)
COM_5199649672729330113.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_5199649672729330113.BackgroundTransparency = 1
COM_5199649672729330113.BorderColor3 = Color3.fromRGB(0,0,0)
COM_5199649672729330113.BorderSizePixel = 0
COM_5199649672729330113.ZIndex = 2
COM_5199649672729330113.Parent = Special10

local BG18 = Instance.new("Frame")
BG18.Name = "BG"
BG18.Size = UDim2.new(1,0,1,0)
BG18.Position = UDim2.new(0.5,0,0.5,0)
BG18.AnchorPoint = Vector2.new(0.5,0.5)
BG18.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG18.BackgroundTransparency = 1
BG18.BorderColor3 = Color3.fromRGB(0,0,0)
BG18.BorderSizePixel = 0
BG18.ZIndex = -1
BG18.Parent = COM_5199649672729330113

local Dropshadow17 = Instance.new("Frame")
Dropshadow17.Name = "Dropshadow"
Dropshadow17.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow17.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow17.AnchorPoint = Vector2.new(0,1)
Dropshadow17.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow17.BackgroundTransparency = 0.5
Dropshadow17.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow17.BorderSizePixel = 0
Dropshadow17.ZIndex = -2
Dropshadow17.Parent = BG18

local UIStroke172 = Instance.new("UIStroke")
UIStroke172.Name = "UIStroke"
UIStroke172.Thickness = 2.79551
UIStroke172.Transparency = 1
UIStroke172.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke172.Parent = Dropshadow17

local Frame18 = Instance.new("Frame")
Frame18.Name = "Frame"
Frame18.Size = UDim2.new(0.984612,0,0.95775,0)
Frame18.Position = UDim2.new(0.506631,0,0.478875,0)
Frame18.AnchorPoint = Vector2.new(0.5,0.5)
Frame18.BackgroundColor3 = Color3.fromRGB(216,175,177)
Frame18.BorderColor3 = Color3.fromRGB(0,0,0)
Frame18.BorderSizePixel = 0
Frame18.ZIndex = -1
Frame18.Parent = BG18

local Pattern17 = Instance.new("ImageLabel")
Pattern17.Name = "Pattern"
Pattern17.Size = UDim2.new(1,0,1,0)
Pattern17.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern17.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern17.BackgroundTransparency = 1
Pattern17.BorderSizePixel = 0
Pattern17.Image = "rbxassetid://84524606651700"
Pattern17.ZIndex = -1
Pattern17.Parent = Frame18

local UIGradient65 = Instance.new("UIGradient")
UIGradient65.Name = "UIGradient"
UIGradient65.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
UIGradient65.Rotation = 90
UIGradient65.Offset = Vector2.new(0,0)
UIGradient65.Enabled = false
UIGradient65.Parent = Pattern17

local UIStroke173 = Instance.new("UIStroke")
UIStroke173.Name = "UIStroke"
UIStroke173.Thickness = 1.86368
UIStroke173.Parent = Pattern17

local UIGradient66 = Instance.new("UIGradient")
UIGradient66.Name = "UIGradient"
UIGradient66.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient66.Rotation = 90
UIGradient66.Offset = Vector2.new(0,0)
UIGradient66.Parent = Frame18

local UIStroke174 = Instance.new("UIStroke")
UIStroke174.Name = "UIStroke"
UIStroke174.Thickness = 1.86368
UIStroke174.Parent = Frame18

local Highlight17 = Instance.new("Frame")
Highlight17.Name = "Highlight"
Highlight17.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight17.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight17.AnchorPoint = Vector2.new(0.5,0.5)
Highlight17.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight17.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight17.BorderSizePixel = 0
Highlight17.Visible = false
Highlight17.ZIndex = -2
Highlight17.Parent = BG18

local UIStroke175 = Instance.new("UIStroke")
UIStroke175.Name = "UIStroke"
UIStroke175.Color = Color3.fromRGB(255,242,0)
UIStroke175.Thickness = 2.79551
UIStroke175.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke175.Parent = Highlight17

local CanvasGroup8 = Instance.new("CanvasGroup")
CanvasGroup8.Name = "CanvasGroup"
CanvasGroup8.Size = UDim2.new(0.970515,0,0.95775,0)
CanvasGroup8.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup8.BackgroundTransparency = 1
CanvasGroup8.Parent = COM_5199649672729330113

local Thumbnail32 = Instance.new("ImageLabel")
Thumbnail32.Name = "Thumbnail"
Thumbnail32.Size = UDim2.new(0.373138,0,0.847911,0)
Thumbnail32.Position = UDim2.new(0.118683,0,0.561027,0)
Thumbnail32.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail32.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail32.BackgroundTransparency = 1
Thumbnail32.BorderSizePixel = 0
Thumbnail32.Image = "rbxassetid://130203104701467"
Thumbnail32.ScaleType = Enum.ScaleType.Fit
Thumbnail32.Rotation = -11
Thumbnail32.Parent = CanvasGroup8

local Unavailable56 = Instance.new("TextLabel")
Unavailable56.Name = "Unavailable"
Unavailable56.Size = UDim2.new(0.7,0,0.7,0)
Unavailable56.Position = UDim2.new(0.5,0,0.5,0)
Unavailable56.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable56.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable56.BackgroundTransparency = 1
Unavailable56.BorderSizePixel = 0
Unavailable56.Text = "Unavailable"
Unavailable56.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable56.TextSize = 14
Unavailable56.Font = Enum.Font.FredokaOne
Unavailable56.TextWrapped = true
Unavailable56.TextScaled = true
Unavailable56.Visible = false
Unavailable56.Parent = Thumbnail32

local UIStroke176 = Instance.new("UIStroke")
UIStroke176.Name = "UIStroke"
UIStroke176.Thickness = 2
UIStroke176.Parent = Unavailable56

local Thumbnail33 = Instance.new("ImageLabel")
Thumbnail33.Name = "Thumbnail"
Thumbnail33.Size = UDim2.new(0.373138,0,0.807747,0)
Thumbnail33.Position = UDim2.new(0.208987,0,0.414244,0)
Thumbnail33.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail33.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail33.BackgroundTransparency = 1
Thumbnail33.BorderSizePixel = 0
Thumbnail33.Image = "rbxassetid://94369491348769"
Thumbnail33.ScaleType = Enum.ScaleType.Fit
Thumbnail33.ZIndex = 0
Thumbnail33.Rotation = 11
Thumbnail33.Parent = CanvasGroup8

local Unavailable57 = Instance.new("TextLabel")
Unavailable57.Name = "Unavailable"
Unavailable57.Size = UDim2.new(0.7,0,0.7,0)
Unavailable57.Position = UDim2.new(0.5,0,0.5,0)
Unavailable57.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable57.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable57.BackgroundTransparency = 1
Unavailable57.BorderSizePixel = 0
Unavailable57.Text = "Unavailable"
Unavailable57.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable57.TextSize = 14
Unavailable57.Font = Enum.Font.FredokaOne
Unavailable57.TextWrapped = true
Unavailable57.TextScaled = true
Unavailable57.Visible = false
Unavailable57.Parent = Thumbnail33

local UIStroke177 = Instance.new("UIStroke")
UIStroke177.Name = "UIStroke"
UIStroke177.Thickness = 2
UIStroke177.Parent = Unavailable57

local DisplayTitle13 = Instance.new("TextLabel")
DisplayTitle13.Name = "DisplayTitle"
DisplayTitle13.Size = UDim2.new(0.428097,0,0.415185,0)
DisplayTitle13.Position = UDim2.new(0.767443,0,0.212655,0)
DisplayTitle13.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle13.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle13.BackgroundTransparency = 1
DisplayTitle13.BorderSizePixel = 0
DisplayTitle13.Text = "Shelly Deluxe 12\" Plush (Pre-Order)"
DisplayTitle13.TextColor3 = Color3.fromRGB(2,40,0)
DisplayTitle13.TextSize = 29
DisplayTitle13.Font = Enum.Font.Arcade
DisplayTitle13.TextWrapped = true
DisplayTitle13.TextScaled = true
DisplayTitle13.RichText = true
DisplayTitle13.Parent = COM_5199649672729330113

local UIGradient67 = Instance.new("UIGradient")
UIGradient67.Name = "UIGradient"
UIGradient67.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient67.Rotation = -90
UIGradient67.Offset = Vector2.new(0,0)
UIGradient67.Parent = DisplayTitle13

local UIStroke178 = Instance.new("UIStroke")
UIStroke178.Name = "UIStroke"
UIStroke178.Color = Color3.fromRGB(255,255,255)
UIStroke178.Thickness = 0.931838
UIStroke178.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke178.Parent = DisplayTitle13

local Item18 = Instance.new("ImageLabel")
Item18.Name = "Item"
Item18.Size = UDim2.new(0.913665,0,0.651761,0)
Item18.Position = UDim2.new(0.514096,0,0.463834,0)
Item18.AnchorPoint = Vector2.new(0.5,0.5)
Item18.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item18.BackgroundTransparency = 1
Item18.BorderSizePixel = 0
Item18.Image = "rbxassetid://94959635148921"
Item18.ImageRectOffset = Vector2.new(15,15)
Item18.ImageRectSize = Vector2.new(270,270)
Item18.ScaleType = Enum.ScaleType.Fit
Item18.Visible = false
Item18.ZIndex = -1
Item18.Parent = COM_5199649672729330113

local Unavailable58 = Instance.new("TextLabel")
Unavailable58.Name = "Unavailable"
Unavailable58.Size = UDim2.new(0.7,0,0.7,0)
Unavailable58.Position = UDim2.new(0.5,0,0.5,0)
Unavailable58.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable58.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable58.BackgroundTransparency = 1
Unavailable58.BorderSizePixel = 0
Unavailable58.Text = "Unavailable"
Unavailable58.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable58.TextSize = 14
Unavailable58.Font = Enum.Font.FredokaOne
Unavailable58.TextWrapped = true
Unavailable58.TextScaled = true
Unavailable58.Visible = false
Unavailable58.Parent = Item18

local UIStroke179 = Instance.new("UIStroke")
UIStroke179.Name = "UIStroke"
UIStroke179.Thickness = 2
UIStroke179.Parent = Unavailable58

local New8 = Instance.new("ImageLabel")
New8.Name = "New"
New8.Size = UDim2.new(0.322123,0,0.355513,0)
New8.Position = UDim2.new(0.94212,0,0.0839209,0)
New8.AnchorPoint = Vector2.new(0.5,0.5)
New8.BackgroundColor3 = Color3.fromRGB(255,255,255)
New8.BackgroundTransparency = 1
New8.BorderSizePixel = 0
New8.Image = "rbxassetid://96728750855907"
New8.ScaleType = Enum.ScaleType.Fit
New8.Visible = false
New8.ZIndex = -1
New8.Parent = COM_5199649672729330113

local UIScale27 = Instance.new("UIScale")
UIScale27.Name = "UIScale"
UIScale27.Parent = New8

local Purchase18 = Instance.new("ImageButton")
Purchase18.Name = "Purchase"
Purchase18.Size = UDim2.new(0.436835,0,0.172928,0)
Purchase18.Position = UDim2.new(0.752098,0,0.833662,0)
Purchase18.AnchorPoint = Vector2.new(0.5,0.5)
Purchase18.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase18.BorderSizePixel = 0
Purchase18.ScaleType = Enum.ScaleType.Fit
Purchase18.AutoButtonColor = false
Purchase18.ZIndex = 5
Purchase18.Parent = COM_5199649672729330113

local Price18 = Instance.new("TextLabel")
Price18.Name = "Price"
Price18.Size = UDim2.new(0.78479,0,0.702682,0)
Price18.Position = UDim2.new(0.100663,0,0.0990811,0)
Price18.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price18.BackgroundTransparency = 1
Price18.BorderSizePixel = 0
Price18.Text = "$19.99"
Price18.TextColor3 = Color3.fromRGB(255,255,255)
Price18.TextSize = 14
Price18.Font = Enum.Font.Arcade
Price18.TextWrapped = true
Price18.TextScaled = true
Price18.RichText = true
Price18.AutomaticSize = Enum.AutomaticSize.X
Price18.Parent = Purchase18

local UIGradient68 = Instance.new("UIGradient")
UIGradient68.Name = "UIGradient"
UIGradient68.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient68.Rotation = -90
UIGradient68.Offset = Vector2.new(0,0)
UIGradient68.Parent = Price18

local UIStroke180 = Instance.new("UIStroke")
UIStroke180.Name = "UIStroke"
UIStroke180.Thickness = 0.931838
UIStroke180.Parent = Price18

local UICorner19 = Instance.new("UICorner")
UICorner19.Name = "UICorner"
UICorner19.CornerRadius = UDim.new(1,0)
UICorner19.Parent = Purchase18

local UIGradient69 = Instance.new("UIGradient")
UIGradient69.Name = "UIGradient"
UIGradient69.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient69.Rotation = -90
UIGradient69.Offset = Vector2.new(0,0)
UIGradient69.Parent = Purchase18

local UIScale28 = Instance.new("UIScale")
UIScale28.Name = "UIScale"
UIScale28.Parent = Purchase18

local UIStroke181 = Instance.new("UIStroke")
UIStroke181.Name = "UIStroke"
UIStroke181.Thickness = 1.1648
UIStroke181.Parent = Purchase18

local Thumbnail34 = Instance.new("ImageLabel")
Thumbnail34.Name = "Thumbnail"
Thumbnail34.Size = UDim2.new(0.48234,0,1.2575,0)
Thumbnail34.Position = UDim2.new(0.42096,0,0.450994,0)
Thumbnail34.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail34.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail34.BackgroundTransparency = 1
Thumbnail34.BorderSizePixel = 0
Thumbnail34.Image = "rbxassetid://112320841584433"
Thumbnail34.ScaleType = Enum.ScaleType.Fit
Thumbnail34.ZIndex = 4
Thumbnail34.Parent = COM_5199649672729330113

local Unavailable59 = Instance.new("TextLabel")
Unavailable59.Name = "Unavailable"
Unavailable59.Size = UDim2.new(0.7,0,0.7,0)
Unavailable59.Position = UDim2.new(0.5,0,0.5,0)
Unavailable59.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable59.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable59.BackgroundTransparency = 1
Unavailable59.BorderSizePixel = 0
Unavailable59.Text = "Unavailable"
Unavailable59.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable59.TextSize = 14
Unavailable59.Font = Enum.Font.FredokaOne
Unavailable59.TextWrapped = true
Unavailable59.TextScaled = true
Unavailable59.Visible = false
Unavailable59.Parent = Thumbnail34

local UIStroke182 = Instance.new("UIStroke")
UIStroke182.Name = "UIStroke"
UIStroke182.Thickness = 2
UIStroke182.Parent = Unavailable59

local Title18 = Instance.new("TextLabel")
Title18.Name = "Title"
Title18.Size = UDim2.new(0.566559,0,0.435422,0)
Title18.Position = UDim2.new(0.65544,0,0.15042,0)
Title18.AnchorPoint = Vector2.new(0.5,0)
Title18.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title18.BackgroundTransparency = 1
Title18.BorderSizePixel = 0
Title18.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title18.TextColor3 = Color3.fromRGB(0,13,76)
Title18.TextSize = 29
Title18.Font = Enum.Font.Arcade
Title18.TextWrapped = true
Title18.TextScaled = true
Title18.RichText = true
Title18.Visible = false
Title18.AutomaticSize = Enum.AutomaticSize.X
Title18.Parent = COM_5199649672729330113

local UIGradient70 = Instance.new("UIGradient")
UIGradient70.Name = "UIGradient"
UIGradient70.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient70.Rotation = -90
UIGradient70.Offset = Vector2.new(0,0)
UIGradient70.Parent = Title18

local UIStroke183 = Instance.new("UIStroke")
UIStroke183.Name = "UIStroke"
UIStroke183.Color = Color3.fromRGB(255,255,255)
UIStroke183.Thickness = 2
UIStroke183.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke183.Parent = Title18

local UIListLayout11 = Instance.new("UIListLayout")
UIListLayout11.Name = "UIListLayout"
UIListLayout11.Padding = UDim.new(0.019,0)
UIListLayout11.FillDirection = Enum.FillDirection.Horizontal
UIListLayout11.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout11.Wraps = false
UIListLayout11.Parent = Special10

local Special11 = Instance.new("Frame")
Special11.Name = "Special"
Special11.Size = UDim2.new(1.10498,0,0.439953,0)
Special11.Position = UDim2.new(0,0,-0.143337,0)
Special11.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special11.BackgroundTransparency = 1
Special11.BorderColor3 = Color3.fromRGB(0,0,0)
Special11.BorderSizePixel = 0
Special11.LayoutOrder = -8
Special11.Parent = ScrollingFrame

local COM_7617315135790645707 = Instance.new("Frame")
COM_7617315135790645707.Name = "COM-7617315135790645707"
COM_7617315135790645707.Size = UDim2.new(0.894307,0,0.931111,0)
COM_7617315135790645707.Position = UDim2.new(-5.79236e-08,0,0,0)
COM_7617315135790645707.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_7617315135790645707.BackgroundTransparency = 1
COM_7617315135790645707.BorderColor3 = Color3.fromRGB(0,0,0)
COM_7617315135790645707.BorderSizePixel = 0
COM_7617315135790645707.Parent = Special11

local BG19 = Instance.new("Frame")
BG19.Name = "BG"
BG19.Size = UDim2.new(1,0,1,0)
BG19.Position = UDim2.new(0.5,0,0.5,0)
BG19.AnchorPoint = Vector2.new(0.5,0.5)
BG19.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG19.BackgroundTransparency = 1
BG19.BorderColor3 = Color3.fromRGB(0,0,0)
BG19.BorderSizePixel = 0
BG19.ZIndex = -1
BG19.Parent = COM_7617315135790645707

local Dropshadow18 = Instance.new("Frame")
Dropshadow18.Name = "Dropshadow"
Dropshadow18.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow18.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow18.AnchorPoint = Vector2.new(0,1)
Dropshadow18.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow18.BackgroundTransparency = 0.5
Dropshadow18.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow18.BorderSizePixel = 0
Dropshadow18.ZIndex = -2
Dropshadow18.Parent = BG19

local UIStroke184 = Instance.new("UIStroke")
UIStroke184.Name = "UIStroke"
UIStroke184.Thickness = 2.79551
UIStroke184.Transparency = 1
UIStroke184.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke184.Parent = Dropshadow18

local Frame19 = Instance.new("Frame")
Frame19.Name = "Frame"
Frame19.Size = UDim2.new(0.984612,0,0.95775,0)
Frame19.Position = UDim2.new(0.506631,0,0.478875,0)
Frame19.AnchorPoint = Vector2.new(0.5,0.5)
Frame19.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame19.BorderColor3 = Color3.fromRGB(0,0,0)
Frame19.BorderSizePixel = 0
Frame19.ZIndex = -1
Frame19.Parent = BG19

local Pattern18 = Instance.new("ImageLabel")
Pattern18.Name = "Pattern"
Pattern18.Size = UDim2.new(0.635249,0,1,0)
Pattern18.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern18.BackgroundTransparency = 1
Pattern18.BorderSizePixel = 0
Pattern18.Image = "rbxassetid://103878999702903"
Pattern18.ImageColor3 = Color3.fromRGB(0,255,217)
Pattern18.ZIndex = -1
Pattern18.Parent = Frame19

local UIStroke185 = Instance.new("UIStroke")
UIStroke185.Name = "UIStroke"
UIStroke185.Thickness = 1.86368
UIStroke185.Parent = Pattern18

local UIStroke186 = Instance.new("UIStroke")
UIStroke186.Name = "UIStroke"
UIStroke186.Thickness = 1.86368
UIStroke186.Parent = Frame19

local Highlight18 = Instance.new("Frame")
Highlight18.Name = "Highlight"
Highlight18.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight18.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight18.AnchorPoint = Vector2.new(0.5,0.5)
Highlight18.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight18.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight18.BorderSizePixel = 0
Highlight18.Visible = false
Highlight18.ZIndex = -2
Highlight18.Parent = BG19

local UIStroke187 = Instance.new("UIStroke")
UIStroke187.Name = "UIStroke"
UIStroke187.Color = Color3.fromRGB(255,242,0)
UIStroke187.Thickness = 2.79551
UIStroke187.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke187.Parent = Highlight18

local CanvasGroup9 = Instance.new("CanvasGroup")
CanvasGroup9.Name = "CanvasGroup"
CanvasGroup9.Size = UDim2.new(1,0,1,0)
CanvasGroup9.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup9.BackgroundTransparency = 1
CanvasGroup9.Parent = COM_7617315135790645707

local Thumbnail35 = Instance.new("ImageLabel")
Thumbnail35.Name = "Thumbnail"
Thumbnail35.Size = UDim2.new(0.401091,0,0.993744,0)
Thumbnail35.Position = UDim2.new(0.0961707,0,0.538139,0)
Thumbnail35.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail35.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail35.BackgroundTransparency = 1
Thumbnail35.BorderSizePixel = 0
Thumbnail35.Image = "rbxassetid://114925215807231"
Thumbnail35.ScaleType = Enum.ScaleType.Fit
Thumbnail35.ZIndex = 0
Thumbnail35.Rotation = -11
Thumbnail35.Parent = CanvasGroup9

local Unavailable60 = Instance.new("TextLabel")
Unavailable60.Name = "Unavailable"
Unavailable60.Size = UDim2.new(0.7,0,0.7,0)
Unavailable60.Position = UDim2.new(0.5,0,0.5,0)
Unavailable60.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable60.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable60.BackgroundTransparency = 1
Unavailable60.BorderSizePixel = 0
Unavailable60.Text = "Unavailable"
Unavailable60.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable60.TextSize = 14
Unavailable60.Font = Enum.Font.FredokaOne
Unavailable60.TextWrapped = true
Unavailable60.TextScaled = true
Unavailable60.Visible = false
Unavailable60.Parent = Thumbnail35

local UIStroke188 = Instance.new("UIStroke")
UIStroke188.Name = "UIStroke"
UIStroke188.Thickness = 2
UIStroke188.Parent = Unavailable60

local Thumbnail36 = Instance.new("ImageLabel")
Thumbnail36.Name = "Thumbnail"
Thumbnail36.Size = UDim2.new(0.401091,0,1.04567,0)
Thumbnail36.Position = UDim2.new(0.17826,0,0.412124,0)
Thumbnail36.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail36.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail36.BackgroundTransparency = 1
Thumbnail36.BorderSizePixel = 0
Thumbnail36.Image = "rbxassetid://137470187003340"
Thumbnail36.ScaleType = Enum.ScaleType.Fit
Thumbnail36.ZIndex = -1
Thumbnail36.Rotation = 16
Thumbnail36.Parent = CanvasGroup9

local Unavailable61 = Instance.new("TextLabel")
Unavailable61.Name = "Unavailable"
Unavailable61.Size = UDim2.new(0.7,0,0.7,0)
Unavailable61.Position = UDim2.new(0.5,0,0.5,0)
Unavailable61.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable61.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable61.BackgroundTransparency = 1
Unavailable61.BorderSizePixel = 0
Unavailable61.Text = "Unavailable"
Unavailable61.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable61.TextSize = 14
Unavailable61.Font = Enum.Font.FredokaOne
Unavailable61.TextWrapped = true
Unavailable61.TextScaled = true
Unavailable61.Visible = false
Unavailable61.Parent = Thumbnail36

local UIStroke189 = Instance.new("UIStroke")
UIStroke189.Name = "UIStroke"
UIStroke189.Thickness = 2
UIStroke189.Parent = Unavailable61

local Thumbnail37 = Instance.new("ImageLabel")
Thumbnail37.Name = "Thumbnail"
Thumbnail37.Size = UDim2.new(0.362417,0,1.03609,0)
Thumbnail37.Position = UDim2.new(0.369293,0,0.497652,0)
Thumbnail37.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail37.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail37.BackgroundTransparency = 1
Thumbnail37.BorderSizePixel = 0
Thumbnail37.Image = "rbxassetid://97463830404900"
Thumbnail37.ScaleType = Enum.ScaleType.Fit
Thumbnail37.ZIndex = 0
Thumbnail37.Parent = CanvasGroup9

local Unavailable62 = Instance.new("TextLabel")
Unavailable62.Name = "Unavailable"
Unavailable62.Size = UDim2.new(0.7,0,0.7,0)
Unavailable62.Position = UDim2.new(0.5,0,0.5,0)
Unavailable62.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable62.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable62.BackgroundTransparency = 1
Unavailable62.BorderSizePixel = 0
Unavailable62.Text = "Unavailable"
Unavailable62.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable62.TextSize = 14
Unavailable62.Font = Enum.Font.FredokaOne
Unavailable62.TextWrapped = true
Unavailable62.TextScaled = true
Unavailable62.Visible = false
Unavailable62.Parent = Thumbnail37

local UIStroke190 = Instance.new("UIStroke")
UIStroke190.Name = "UIStroke"
UIStroke190.Thickness = 2
UIStroke190.Parent = Unavailable62

local DisplayTitle14 = Instance.new("TextLabel")
DisplayTitle14.Name = "DisplayTitle"
DisplayTitle14.Size = UDim2.new(0.28831,0,0.367128,0)
DisplayTitle14.Position = UDim2.new(0.814632,0,0.191717,0)
DisplayTitle14.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle14.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle14.BackgroundTransparency = 1
DisplayTitle14.BorderSizePixel = 0
DisplayTitle14.Text = "Dyle 14\" Deluxe Plush (Pre-Order)"
DisplayTitle14.TextColor3 = Color3.fromRGB(0,0,0)
DisplayTitle14.TextSize = 29
DisplayTitle14.Font = Enum.Font.Arcade
DisplayTitle14.TextWrapped = true
DisplayTitle14.TextScaled = true
DisplayTitle14.RichText = true
DisplayTitle14.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle14.Parent = COM_7617315135790645707

local UIAspectRatioConstraint12 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint12.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint12.AspectRatio = 2.66
UIAspectRatioConstraint12.Parent = DisplayTitle14

local UIGradient71 = Instance.new("UIGradient")
UIGradient71.Name = "UIGradient"
UIGradient71.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient71.Rotation = -90
UIGradient71.Offset = Vector2.new(0,0)
UIGradient71.Enabled = false
UIGradient71.Parent = DisplayTitle14

local UIStroke191 = Instance.new("UIStroke")
UIStroke191.Name = "UIStroke"
UIStroke191.Color = Color3.fromRGB(255,255,255)
UIStroke191.Thickness = 0.931838
UIStroke191.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke191.Parent = DisplayTitle14

local Item19 = Instance.new("ImageLabel")
Item19.Name = "Item"
Item19.Size = UDim2.new(0.913665,0,0.651761,0)
Item19.Position = UDim2.new(0.514096,0,0.463834,0)
Item19.AnchorPoint = Vector2.new(0.5,0.5)
Item19.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item19.BackgroundTransparency = 1
Item19.BorderSizePixel = 0
Item19.Image = "rbxassetid://94959635148921"
Item19.ImageRectOffset = Vector2.new(15,15)
Item19.ImageRectSize = Vector2.new(270,270)
Item19.ScaleType = Enum.ScaleType.Fit
Item19.Visible = false
Item19.ZIndex = -1
Item19.Parent = COM_7617315135790645707

local Unavailable63 = Instance.new("TextLabel")
Unavailable63.Name = "Unavailable"
Unavailable63.Size = UDim2.new(0.7,0,0.7,0)
Unavailable63.Position = UDim2.new(0.5,0,0.5,0)
Unavailable63.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable63.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable63.BackgroundTransparency = 1
Unavailable63.BorderSizePixel = 0
Unavailable63.Text = "Unavailable"
Unavailable63.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable63.TextSize = 14
Unavailable63.Font = Enum.Font.FredokaOne
Unavailable63.TextWrapped = true
Unavailable63.TextScaled = true
Unavailable63.Visible = false
Unavailable63.Parent = Item19

local UIStroke192 = Instance.new("UIStroke")
UIStroke192.Name = "UIStroke"
UIStroke192.Thickness = 2
UIStroke192.Parent = Unavailable63

local New9 = Instance.new("ImageLabel")
New9.Name = "New"
New9.Size = UDim2.new(0.322123,0,0.355513,0)
New9.Position = UDim2.new(0.944127,0,0.0328983,0)
New9.AnchorPoint = Vector2.new(0.5,0.5)
New9.BackgroundColor3 = Color3.fromRGB(255,255,255)
New9.BackgroundTransparency = 1
New9.BorderSizePixel = 0
New9.Image = "rbxassetid://96728750855907"
New9.ScaleType = Enum.ScaleType.Fit
New9.Visible = false
New9.ZIndex = -1
New9.Parent = COM_7617315135790645707

local UIScale29 = Instance.new("UIScale")
UIScale29.Name = "UIScale"
UIScale29.Parent = New9

local Purchase19 = Instance.new("ImageButton")
Purchase19.Name = "Purchase"
Purchase19.Size = UDim2.new(0.299855,0,0.201102,0)
Purchase19.Position = UDim2.new(0.814697,0,0.786462,0)
Purchase19.AnchorPoint = Vector2.new(0.5,0.5)
Purchase19.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase19.BorderSizePixel = 0
Purchase19.ScaleType = Enum.ScaleType.Fit
Purchase19.AutoButtonColor = false
Purchase19.Parent = COM_7617315135790645707

local Price19 = Instance.new("TextLabel")
Price19.Name = "Price"
Price19.Size = UDim2.new(0.78479,0,0.702682,0)
Price19.Position = UDim2.new(0.100663,0,0.0990811,0)
Price19.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price19.BackgroundTransparency = 1
Price19.BorderSizePixel = 0
Price19.Text = "$19.99"
Price19.TextColor3 = Color3.fromRGB(255,255,255)
Price19.TextSize = 14
Price19.Font = Enum.Font.Arcade
Price19.TextWrapped = true
Price19.TextScaled = true
Price19.RichText = true
Price19.AutomaticSize = Enum.AutomaticSize.X
Price19.Parent = Purchase19

local UIGradient72 = Instance.new("UIGradient")
UIGradient72.Name = "UIGradient"
UIGradient72.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient72.Rotation = -90
UIGradient72.Offset = Vector2.new(0,0)
UIGradient72.Parent = Price19

local UIStroke193 = Instance.new("UIStroke")
UIStroke193.Name = "UIStroke"
UIStroke193.Thickness = 0.931838
UIStroke193.Parent = Price19

local UICorner20 = Instance.new("UICorner")
UICorner20.Name = "UICorner"
UICorner20.CornerRadius = UDim.new(1,0)
UICorner20.Parent = Purchase19

local UIGradient73 = Instance.new("UIGradient")
UIGradient73.Name = "UIGradient"
UIGradient73.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient73.Rotation = -90
UIGradient73.Offset = Vector2.new(0,0)
UIGradient73.Parent = Purchase19

local UIScale30 = Instance.new("UIScale")
UIScale30.Name = "UIScale"
UIScale30.Parent = Purchase19

local UIStroke194 = Instance.new("UIStroke")
UIStroke194.Name = "UIStroke"
UIStroke194.Thickness = 1.1648
UIStroke194.Parent = Purchase19

local Thumbnail38 = Instance.new("ImageLabel")
Thumbnail38.Name = "Thumbnail"
Thumbnail38.Size = UDim2.new(0.48234,0,1.34851,0)
Thumbnail38.Position = UDim2.new(0.543731,0,0.39973,0)
Thumbnail38.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail38.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail38.BackgroundTransparency = 1
Thumbnail38.BorderSizePixel = 0
Thumbnail38.Image = "rbxassetid://122560100489294"
Thumbnail38.ScaleType = Enum.ScaleType.Fit
Thumbnail38.ZIndex = -1
Thumbnail38.Parent = COM_7617315135790645707

local Unavailable64 = Instance.new("TextLabel")
Unavailable64.Name = "Unavailable"
Unavailable64.Size = UDim2.new(0.7,0,0.7,0)
Unavailable64.Position = UDim2.new(0.5,0,0.5,0)
Unavailable64.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable64.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable64.BackgroundTransparency = 1
Unavailable64.BorderSizePixel = 0
Unavailable64.Text = "Unavailable"
Unavailable64.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable64.TextSize = 14
Unavailable64.Font = Enum.Font.FredokaOne
Unavailable64.TextWrapped = true
Unavailable64.TextScaled = true
Unavailable64.Visible = false
Unavailable64.Parent = Thumbnail38

local UIStroke195 = Instance.new("UIStroke")
UIStroke195.Name = "UIStroke"
UIStroke195.Thickness = 2
UIStroke195.Parent = Unavailable64

local Title19 = Instance.new("TextLabel")
Title19.Name = "Title"
Title19.Size = UDim2.new(0.566559,0,0.435422,0)
Title19.Position = UDim2.new(0.65544,0,0.15042,0)
Title19.AnchorPoint = Vector2.new(0.5,0)
Title19.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title19.BackgroundTransparency = 1
Title19.BorderSizePixel = 0
Title19.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title19.TextColor3 = Color3.fromRGB(0,13,76)
Title19.TextSize = 29
Title19.Font = Enum.Font.Arcade
Title19.TextWrapped = true
Title19.TextScaled = true
Title19.RichText = true
Title19.Visible = false
Title19.AutomaticSize = Enum.AutomaticSize.X
Title19.Parent = COM_7617315135790645707

local UIGradient74 = Instance.new("UIGradient")
UIGradient74.Name = "UIGradient"
UIGradient74.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient74.Rotation = -90
UIGradient74.Offset = Vector2.new(0,0)
UIGradient74.Parent = Title19

local UIStroke196 = Instance.new("UIStroke")
UIStroke196.Name = "UIStroke"
UIStroke196.Color = Color3.fromRGB(255,255,255)
UIStroke196.Thickness = 2
UIStroke196.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke196.Parent = Title19

local UIListLayout12 = Instance.new("UIListLayout")
UIListLayout12.Name = "UIListLayout"
UIListLayout12.Padding = UDim.new(0.019,0)
UIListLayout12.FillDirection = Enum.FillDirection.Horizontal
UIListLayout12.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout12.Wraps = false
UIListLayout12.Parent = Special11

local Special12 = Instance.new("Frame")
Special12.Name = "Special"
Special12.Size = UDim2.new(1.10498,0,0.439953,0)
Special12.Position = UDim2.new(0,0,-0.143337,0)
Special12.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special12.BackgroundTransparency = 1
Special12.BorderColor3 = Color3.fromRGB(0,0,0)
Special12.BorderSizePixel = 0
Special12.Visible = false
Special12.LayoutOrder = -7
Special12.Parent = ScrollingFrame

local COM_428197939995869632 = Instance.new("Frame")
COM_428197939995869632.Name = "COM-428197939995869632"
COM_428197939995869632.Size = UDim2.new(0.437886,0,0.931112,0)
COM_428197939995869632.Position = UDim2.new(-2.68658e-08,0,0,0)
COM_428197939995869632.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_428197939995869632.BackgroundTransparency = 1
COM_428197939995869632.BorderColor3 = Color3.fromRGB(0,0,0)
COM_428197939995869632.BorderSizePixel = 0
COM_428197939995869632.LayoutOrder = -1
COM_428197939995869632.Parent = Special12

local BG20 = Instance.new("Frame")
BG20.Name = "BG"
BG20.Size = UDim2.new(1,0,1,0)
BG20.Position = UDim2.new(0.5,0,0.5,0)
BG20.AnchorPoint = Vector2.new(0.5,0.5)
BG20.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG20.BackgroundTransparency = 1
BG20.BorderColor3 = Color3.fromRGB(0,0,0)
BG20.BorderSizePixel = 0
BG20.ZIndex = -1
BG20.Parent = COM_428197939995869632

local Dropshadow19 = Instance.new("Frame")
Dropshadow19.Name = "Dropshadow"
Dropshadow19.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow19.Position = UDim2.new(0,0,1.028,0)
Dropshadow19.AnchorPoint = Vector2.new(0,1)
Dropshadow19.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow19.BackgroundTransparency = 0.5
Dropshadow19.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow19.BorderSizePixel = 0
Dropshadow19.ZIndex = -2
Dropshadow19.Parent = BG20

local UIStroke197 = Instance.new("UIStroke")
UIStroke197.Name = "UIStroke"
UIStroke197.Thickness = 2.79551
UIStroke197.Transparency = 1
UIStroke197.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke197.Parent = Dropshadow19

local Frame20 = Instance.new("Frame")
Frame20.Name = "Frame"
Frame20.Size = UDim2.new(0.969681,0,0.95775,0)
Frame20.Position = UDim2.new(0.514096,0,0.478875,0)
Frame20.AnchorPoint = Vector2.new(0.5,0.5)
Frame20.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame20.BorderColor3 = Color3.fromRGB(0,0,0)
Frame20.BorderSizePixel = 0
Frame20.ZIndex = -1
Frame20.Parent = BG20

local Pattern19 = Instance.new("ImageLabel")
Pattern19.Name = "Pattern"
Pattern19.Size = UDim2.new(1,0,1,0)
Pattern19.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern19.BackgroundTransparency = 1
Pattern19.BorderSizePixel = 0
Pattern19.Image = "rbxassetid://114373250964250"
Pattern19.ZIndex = -1
Pattern19.Parent = Frame20

local UIStroke198 = Instance.new("UIStroke")
UIStroke198.Name = "UIStroke"
UIStroke198.Thickness = 1.86368
UIStroke198.Parent = Pattern19

local UIStroke199 = Instance.new("UIStroke")
UIStroke199.Name = "UIStroke"
UIStroke199.Thickness = 1.86368
UIStroke199.Parent = Frame20

local Highlight19 = Instance.new("Frame")
Highlight19.Name = "Highlight"
Highlight19.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight19.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight19.AnchorPoint = Vector2.new(0.5,0.5)
Highlight19.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight19.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight19.BorderSizePixel = 0
Highlight19.Visible = false
Highlight19.ZIndex = -2
Highlight19.Parent = BG20

local UIStroke200 = Instance.new("UIStroke")
UIStroke200.Name = "UIStroke"
UIStroke200.Color = Color3.fromRGB(255,242,0)
UIStroke200.Thickness = 2.79551
UIStroke200.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke200.Parent = Highlight19

local DisplayTitle15 = Instance.new("TextLabel")
DisplayTitle15.Name = "DisplayTitle"
DisplayTitle15.Size = UDim2.new(0.566559,0,0.435422,0)
DisplayTitle15.Position = UDim2.new(0.691046,0,0.15042,0)
DisplayTitle15.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle15.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle15.BackgroundTransparency = 1
DisplayTitle15.BorderSizePixel = 0
DisplayTitle15.Text = "Bassie 7\" Acrylic Standee (Pre-Order)"
DisplayTitle15.TextColor3 = Color3.fromRGB(0,13,76)
DisplayTitle15.TextSize = 29
DisplayTitle15.Font = Enum.Font.Arcade
DisplayTitle15.TextWrapped = true
DisplayTitle15.TextScaled = true
DisplayTitle15.RichText = true
DisplayTitle15.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle15.Parent = COM_428197939995869632

local UIGradient75 = Instance.new("UIGradient")
UIGradient75.Name = "UIGradient"
UIGradient75.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient75.Rotation = -90
UIGradient75.Offset = Vector2.new(0,0)
UIGradient75.Parent = DisplayTitle15

local UIStroke201 = Instance.new("UIStroke")
UIStroke201.Name = "UIStroke"
UIStroke201.Color = Color3.fromRGB(255,255,255)
UIStroke201.Thickness = 0.931838
UIStroke201.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke201.Parent = DisplayTitle15

local Item20 = Instance.new("ImageLabel")
Item20.Name = "Item"
Item20.Size = UDim2.new(0.913665,0,0.651761,0)
Item20.Position = UDim2.new(0.514096,0,0.463834,0)
Item20.AnchorPoint = Vector2.new(0.5,0.5)
Item20.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item20.BackgroundTransparency = 1
Item20.BorderSizePixel = 0
Item20.Image = "rbxassetid://94959635148921"
Item20.ImageRectOffset = Vector2.new(15,15)
Item20.ImageRectSize = Vector2.new(270,270)
Item20.ScaleType = Enum.ScaleType.Fit
Item20.Visible = false
Item20.ZIndex = -1
Item20.Parent = COM_428197939995869632

local Unavailable65 = Instance.new("TextLabel")
Unavailable65.Name = "Unavailable"
Unavailable65.Size = UDim2.new(0.7,0,0.7,0)
Unavailable65.Position = UDim2.new(0.5,0,0.5,0)
Unavailable65.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable65.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable65.BackgroundTransparency = 1
Unavailable65.BorderSizePixel = 0
Unavailable65.Text = "Unavailable"
Unavailable65.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable65.TextSize = 14
Unavailable65.Font = Enum.Font.FredokaOne
Unavailable65.TextWrapped = true
Unavailable65.TextScaled = true
Unavailable65.Visible = false
Unavailable65.Parent = Item20

local UIStroke202 = Instance.new("UIStroke")
UIStroke202.Name = "UIStroke"
UIStroke202.Thickness = 2
UIStroke202.Parent = Unavailable65

local New10 = Instance.new("ImageLabel")
New10.Name = "New"
New10.Size = UDim2.new(0.322123,0,0.355513,0)
New10.Position = UDim2.new(0.924293,0,0.0284983,0)
New10.AnchorPoint = Vector2.new(0.5,0.5)
New10.BackgroundColor3 = Color3.fromRGB(255,255,255)
New10.BackgroundTransparency = 1
New10.BorderSizePixel = 0
New10.Image = "rbxassetid://96728750855907"
New10.ScaleType = Enum.ScaleType.Fit
New10.Visible = false
New10.ZIndex = -1
New10.Parent = COM_428197939995869632

local UIScale31 = Instance.new("UIScale")
UIScale31.Name = "UIScale"
UIScale31.Parent = New10

local Purchase20 = Instance.new("ImageButton")
Purchase20.Name = "Purchase"
Purchase20.Size = UDim2.new(0.551281,0,0.201102,0)
Purchase20.Position = UDim2.new(0.681037,0,0.790057,0)
Purchase20.AnchorPoint = Vector2.new(0.5,0.5)
Purchase20.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase20.BorderSizePixel = 0
Purchase20.ScaleType = Enum.ScaleType.Fit
Purchase20.AutoButtonColor = false
Purchase20.Parent = COM_428197939995869632

local Price20 = Instance.new("TextLabel")
Price20.Name = "Price"
Price20.Size = UDim2.new(0.78479,0,0.702682,0)
Price20.Position = UDim2.new(0.100663,0,0.0990811,0)
Price20.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price20.BackgroundTransparency = 1
Price20.BorderSizePixel = 0
Price20.Text = "$19.99"
Price20.TextColor3 = Color3.fromRGB(255,255,255)
Price20.TextSize = 14
Price20.Font = Enum.Font.Arcade
Price20.TextWrapped = true
Price20.TextScaled = true
Price20.RichText = true
Price20.AutomaticSize = Enum.AutomaticSize.X
Price20.Parent = Purchase20

local UIGradient76 = Instance.new("UIGradient")
UIGradient76.Name = "UIGradient"
UIGradient76.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient76.Rotation = -90
UIGradient76.Offset = Vector2.new(0,0)
UIGradient76.Parent = Price20

local UIStroke203 = Instance.new("UIStroke")
UIStroke203.Name = "UIStroke"
UIStroke203.Thickness = 0.931838
UIStroke203.Parent = Price20

local UICorner21 = Instance.new("UICorner")
UICorner21.Name = "UICorner"
UICorner21.CornerRadius = UDim.new(1,0)
UICorner21.Parent = Purchase20

local UIGradient77 = Instance.new("UIGradient")
UIGradient77.Name = "UIGradient"
UIGradient77.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient77.Rotation = -90
UIGradient77.Offset = Vector2.new(0,0)
UIGradient77.Parent = Purchase20

local UIScale32 = Instance.new("UIScale")
UIScale32.Name = "UIScale"
UIScale32.Parent = Purchase20

local UIStroke204 = Instance.new("UIStroke")
UIStroke204.Name = "UIStroke"
UIStroke204.Thickness = 1.1648
UIStroke204.Parent = Purchase20

local Thumbnail39 = Instance.new("ImageLabel")
Thumbnail39.Name = "Thumbnail"
Thumbnail39.Size = UDim2.new(0.593809,0,1.5481,0)
Thumbnail39.Position = UDim2.new(0.234728,0,0.432111,0)
Thumbnail39.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail39.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail39.BackgroundTransparency = 1
Thumbnail39.BorderSizePixel = 0
Thumbnail39.Image = "rbxassetid://73534469542594"
Thumbnail39.ScaleType = Enum.ScaleType.Fit
Thumbnail39.ZIndex = -1
Thumbnail39.Parent = COM_428197939995869632

local Unavailable66 = Instance.new("TextLabel")
Unavailable66.Name = "Unavailable"
Unavailable66.Size = UDim2.new(0.7,0,0.7,0)
Unavailable66.Position = UDim2.new(0.5,0,0.5,0)
Unavailable66.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable66.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable66.BackgroundTransparency = 1
Unavailable66.BorderSizePixel = 0
Unavailable66.Text = "Unavailable"
Unavailable66.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable66.TextSize = 14
Unavailable66.Font = Enum.Font.FredokaOne
Unavailable66.TextWrapped = true
Unavailable66.TextScaled = true
Unavailable66.Visible = false
Unavailable66.Parent = Thumbnail39

local UIStroke205 = Instance.new("UIStroke")
UIStroke205.Name = "UIStroke"
UIStroke205.Thickness = 2
UIStroke205.Parent = Unavailable66

local Title20 = Instance.new("TextLabel")
Title20.Name = "Title"
Title20.Size = UDim2.new(0.566559,0,0.435422,0)
Title20.Position = UDim2.new(0.65544,0,0.15042,0)
Title20.AnchorPoint = Vector2.new(0.5,0)
Title20.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title20.BackgroundTransparency = 1
Title20.BorderSizePixel = 0
Title20.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title20.TextColor3 = Color3.fromRGB(0,13,76)
Title20.TextSize = 29
Title20.Font = Enum.Font.Arcade
Title20.TextWrapped = true
Title20.TextScaled = true
Title20.RichText = true
Title20.Visible = false
Title20.AutomaticSize = Enum.AutomaticSize.X
Title20.Parent = COM_428197939995869632

local UIGradient78 = Instance.new("UIGradient")
UIGradient78.Name = "UIGradient"
UIGradient78.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient78.Rotation = -90
UIGradient78.Offset = Vector2.new(0,0)
UIGradient78.Parent = Title20

local UIStroke206 = Instance.new("UIStroke")
UIStroke206.Name = "UIStroke"
UIStroke206.Color = Color3.fromRGB(255,255,255)
UIStroke206.Thickness = 2
UIStroke206.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke206.Parent = Title20

local COM_7297313271642718640 = Instance.new("Frame")
COM_7297313271642718640.Name = "COM-7297313271642718640"
COM_7297313271642718640.Size = UDim2.new(0.437886,0,0.931112,0)
COM_7297313271642718640.Position = UDim2.new(-2.68658e-08,0,0,0)
COM_7297313271642718640.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_7297313271642718640.BackgroundTransparency = 1
COM_7297313271642718640.BorderColor3 = Color3.fromRGB(0,0,0)
COM_7297313271642718640.BorderSizePixel = 0
COM_7297313271642718640.Parent = Special12

local BG21 = Instance.new("Frame")
BG21.Name = "BG"
BG21.Size = UDim2.new(1,0,1,0)
BG21.Position = UDim2.new(0.5,0,0.5,0)
BG21.AnchorPoint = Vector2.new(0.5,0.5)
BG21.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG21.BackgroundTransparency = 1
BG21.BorderColor3 = Color3.fromRGB(0,0,0)
BG21.BorderSizePixel = 0
BG21.ZIndex = -1
BG21.Parent = COM_7297313271642718640

local Dropshadow20 = Instance.new("Frame")
Dropshadow20.Name = "Dropshadow"
Dropshadow20.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow20.Position = UDim2.new(0,0,1.028,0)
Dropshadow20.AnchorPoint = Vector2.new(0,1)
Dropshadow20.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow20.BackgroundTransparency = 0.5
Dropshadow20.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow20.BorderSizePixel = 0
Dropshadow20.ZIndex = -2
Dropshadow20.Parent = BG21

local UIStroke207 = Instance.new("UIStroke")
UIStroke207.Name = "UIStroke"
UIStroke207.Thickness = 2.79551
UIStroke207.Transparency = 1
UIStroke207.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke207.Parent = Dropshadow20

local Frame21 = Instance.new("Frame")
Frame21.Name = "Frame"
Frame21.Size = UDim2.new(0.969681,0,0.95775,0)
Frame21.Position = UDim2.new(0.514096,0,0.478875,0)
Frame21.AnchorPoint = Vector2.new(0.5,0.5)
Frame21.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame21.BorderColor3 = Color3.fromRGB(0,0,0)
Frame21.BorderSizePixel = 0
Frame21.ZIndex = -1
Frame21.Parent = BG21

local Pattern20 = Instance.new("ImageLabel")
Pattern20.Name = "Pattern"
Pattern20.Size = UDim2.new(1,0,1,0)
Pattern20.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern20.BackgroundTransparency = 1
Pattern20.BorderSizePixel = 0
Pattern20.Image = "rbxassetid://114373250964250"
Pattern20.ZIndex = -1
Pattern20.Parent = Frame21

local UIStroke208 = Instance.new("UIStroke")
UIStroke208.Name = "UIStroke"
UIStroke208.Thickness = 1.86368
UIStroke208.Parent = Pattern20

local UIStroke209 = Instance.new("UIStroke")
UIStroke209.Name = "UIStroke"
UIStroke209.Thickness = 1.86368
UIStroke209.Parent = Frame21

local Highlight20 = Instance.new("Frame")
Highlight20.Name = "Highlight"
Highlight20.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight20.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight20.AnchorPoint = Vector2.new(0.5,0.5)
Highlight20.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight20.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight20.BorderSizePixel = 0
Highlight20.Visible = false
Highlight20.ZIndex = -2
Highlight20.Parent = BG21

local UIStroke210 = Instance.new("UIStroke")
UIStroke210.Name = "UIStroke"
UIStroke210.Color = Color3.fromRGB(255,242,0)
UIStroke210.Thickness = 2.79551
UIStroke210.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke210.Parent = Highlight20

local DisplayTitle16 = Instance.new("TextLabel")
DisplayTitle16.Name = "DisplayTitle"
DisplayTitle16.Size = UDim2.new(0.566559,0,0.435422,0)
DisplayTitle16.Position = UDim2.new(0.691046,0,0.15042,0)
DisplayTitle16.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle16.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle16.BackgroundTransparency = 1
DisplayTitle16.BorderSizePixel = 0
DisplayTitle16.Text = "Cocoa 7\" Acrylic Standee (Pre-Order)"
DisplayTitle16.TextColor3 = Color3.fromRGB(0,13,76)
DisplayTitle16.TextSize = 29
DisplayTitle16.Font = Enum.Font.Arcade
DisplayTitle16.TextWrapped = true
DisplayTitle16.TextScaled = true
DisplayTitle16.RichText = true
DisplayTitle16.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle16.Parent = COM_7297313271642718640

local UIGradient79 = Instance.new("UIGradient")
UIGradient79.Name = "UIGradient"
UIGradient79.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient79.Rotation = -90
UIGradient79.Offset = Vector2.new(0,0)
UIGradient79.Parent = DisplayTitle16

local UIStroke211 = Instance.new("UIStroke")
UIStroke211.Name = "UIStroke"
UIStroke211.Color = Color3.fromRGB(255,255,255)
UIStroke211.Thickness = 0.931838
UIStroke211.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke211.Parent = DisplayTitle16

local Item21 = Instance.new("ImageLabel")
Item21.Name = "Item"
Item21.Size = UDim2.new(0.913665,0,0.651761,0)
Item21.Position = UDim2.new(0.514096,0,0.463834,0)
Item21.AnchorPoint = Vector2.new(0.5,0.5)
Item21.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item21.BackgroundTransparency = 1
Item21.BorderSizePixel = 0
Item21.Image = "rbxassetid://94959635148921"
Item21.ImageRectOffset = Vector2.new(15,15)
Item21.ImageRectSize = Vector2.new(270,270)
Item21.ScaleType = Enum.ScaleType.Fit
Item21.Visible = false
Item21.ZIndex = -1
Item21.Parent = COM_7297313271642718640

local Unavailable67 = Instance.new("TextLabel")
Unavailable67.Name = "Unavailable"
Unavailable67.Size = UDim2.new(0.7,0,0.7,0)
Unavailable67.Position = UDim2.new(0.5,0,0.5,0)
Unavailable67.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable67.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable67.BackgroundTransparency = 1
Unavailable67.BorderSizePixel = 0
Unavailable67.Text = "Unavailable"
Unavailable67.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable67.TextSize = 14
Unavailable67.Font = Enum.Font.FredokaOne
Unavailable67.TextWrapped = true
Unavailable67.TextScaled = true
Unavailable67.Visible = false
Unavailable67.Parent = Item21

local UIStroke212 = Instance.new("UIStroke")
UIStroke212.Name = "UIStroke"
UIStroke212.Thickness = 2
UIStroke212.Parent = Unavailable67

local New11 = Instance.new("ImageLabel")
New11.Name = "New"
New11.Size = UDim2.new(0.322123,0,0.355513,0)
New11.Position = UDim2.new(0.924293,0,0.0284983,0)
New11.AnchorPoint = Vector2.new(0.5,0.5)
New11.BackgroundColor3 = Color3.fromRGB(255,255,255)
New11.BackgroundTransparency = 1
New11.BorderSizePixel = 0
New11.Image = "rbxassetid://96728750855907"
New11.ScaleType = Enum.ScaleType.Fit
New11.Visible = false
New11.ZIndex = -1
New11.Parent = COM_7297313271642718640

local UIScale33 = Instance.new("UIScale")
UIScale33.Name = "UIScale"
UIScale33.Parent = New11

local Purchase21 = Instance.new("ImageButton")
Purchase21.Name = "Purchase"
Purchase21.Size = UDim2.new(0.551281,0,0.201102,0)
Purchase21.Position = UDim2.new(0.681037,0,0.790057,0)
Purchase21.AnchorPoint = Vector2.new(0.5,0.5)
Purchase21.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase21.BorderSizePixel = 0
Purchase21.ScaleType = Enum.ScaleType.Fit
Purchase21.AutoButtonColor = false
Purchase21.Parent = COM_7297313271642718640

local Price21 = Instance.new("TextLabel")
Price21.Name = "Price"
Price21.Size = UDim2.new(0.78479,0,0.702682,0)
Price21.Position = UDim2.new(0.100663,0,0.0990811,0)
Price21.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price21.BackgroundTransparency = 1
Price21.BorderSizePixel = 0
Price21.Text = "$19.99"
Price21.TextColor3 = Color3.fromRGB(255,255,255)
Price21.TextSize = 14
Price21.Font = Enum.Font.Arcade
Price21.TextWrapped = true
Price21.TextScaled = true
Price21.RichText = true
Price21.AutomaticSize = Enum.AutomaticSize.X
Price21.Parent = Purchase21

local UIGradient80 = Instance.new("UIGradient")
UIGradient80.Name = "UIGradient"
UIGradient80.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient80.Rotation = -90
UIGradient80.Offset = Vector2.new(0,0)
UIGradient80.Parent = Price21

local UIStroke213 = Instance.new("UIStroke")
UIStroke213.Name = "UIStroke"
UIStroke213.Thickness = 0.931838
UIStroke213.Parent = Price21

local UICorner22 = Instance.new("UICorner")
UICorner22.Name = "UICorner"
UICorner22.CornerRadius = UDim.new(1,0)
UICorner22.Parent = Purchase21

local UIGradient81 = Instance.new("UIGradient")
UIGradient81.Name = "UIGradient"
UIGradient81.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient81.Rotation = -90
UIGradient81.Offset = Vector2.new(0,0)
UIGradient81.Parent = Purchase21

local UIScale34 = Instance.new("UIScale")
UIScale34.Name = "UIScale"
UIScale34.Parent = Purchase21

local UIStroke214 = Instance.new("UIStroke")
UIStroke214.Name = "UIStroke"
UIStroke214.Thickness = 1.1648
UIStroke214.Parent = Purchase21

local Thumbnail40 = Instance.new("ImageLabel")
Thumbnail40.Name = "Thumbnail"
Thumbnail40.Size = UDim2.new(0.593809,0,1.5481,0)
Thumbnail40.Position = UDim2.new(0.251161,0,0.432111,0)
Thumbnail40.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail40.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail40.BackgroundTransparency = 1
Thumbnail40.BorderSizePixel = 0
Thumbnail40.Image = "rbxassetid://75549965624731"
Thumbnail40.ScaleType = Enum.ScaleType.Fit
Thumbnail40.ZIndex = -1
Thumbnail40.Parent = COM_7297313271642718640

local Unavailable68 = Instance.new("TextLabel")
Unavailable68.Name = "Unavailable"
Unavailable68.Size = UDim2.new(0.7,0,0.7,0)
Unavailable68.Position = UDim2.new(0.5,0,0.5,0)
Unavailable68.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable68.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable68.BackgroundTransparency = 1
Unavailable68.BorderSizePixel = 0
Unavailable68.Text = "Unavailable"
Unavailable68.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable68.TextSize = 14
Unavailable68.Font = Enum.Font.FredokaOne
Unavailable68.TextWrapped = true
Unavailable68.TextScaled = true
Unavailable68.Visible = false
Unavailable68.Parent = Thumbnail40

local UIStroke215 = Instance.new("UIStroke")
UIStroke215.Name = "UIStroke"
UIStroke215.Thickness = 2
UIStroke215.Parent = Unavailable68

local Title21 = Instance.new("TextLabel")
Title21.Name = "Title"
Title21.Size = UDim2.new(0.566559,0,0.435422,0)
Title21.Position = UDim2.new(0.65544,0,0.15042,0)
Title21.AnchorPoint = Vector2.new(0.5,0)
Title21.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title21.BackgroundTransparency = 1
Title21.BorderSizePixel = 0
Title21.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title21.TextColor3 = Color3.fromRGB(0,13,76)
Title21.TextSize = 29
Title21.Font = Enum.Font.Arcade
Title21.TextWrapped = true
Title21.TextScaled = true
Title21.RichText = true
Title21.Visible = false
Title21.AutomaticSize = Enum.AutomaticSize.X
Title21.Parent = COM_7297313271642718640

local UIGradient82 = Instance.new("UIGradient")
UIGradient82.Name = "UIGradient"
UIGradient82.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient82.Rotation = -90
UIGradient82.Offset = Vector2.new(0,0)
UIGradient82.Parent = Title21

local UIStroke216 = Instance.new("UIStroke")
UIStroke216.Name = "UIStroke"
UIStroke216.Color = Color3.fromRGB(255,255,255)
UIStroke216.Thickness = 2
UIStroke216.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke216.Parent = Title21

local UIListLayout13 = Instance.new("UIListLayout")
UIListLayout13.Name = "UIListLayout"
UIListLayout13.Padding = UDim.new(0.019,0)
UIListLayout13.FillDirection = Enum.FillDirection.Horizontal
UIListLayout13.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout13.Wraps = false
UIListLayout13.Parent = Special12

local Special13 = Instance.new("Frame")
Special13.Name = "Special"
Special13.Size = UDim2.new(1.10498,0,0.439953,0)
Special13.Position = UDim2.new(0,0,-0.143337,0)
Special13.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special13.BackgroundTransparency = 1
Special13.BorderColor3 = Color3.fromRGB(0,0,0)
Special13.BorderSizePixel = 0
Special13.LayoutOrder = -7
Special13.Parent = ScrollingFrame

local COM_5579260382545052095 = Instance.new("Frame")
COM_5579260382545052095.Name = "COM-5579260382545052095"
COM_5579260382545052095.Size = UDim2.new(0.437886,0,0.931112,0)
COM_5579260382545052095.Position = UDim2.new(-2.68658e-08,0,0,0)
COM_5579260382545052095.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_5579260382545052095.BackgroundTransparency = 1
COM_5579260382545052095.BorderColor3 = Color3.fromRGB(0,0,0)
COM_5579260382545052095.BorderSizePixel = 0
COM_5579260382545052095.LayoutOrder = -1
COM_5579260382545052095.Parent = Special13

local BG22 = Instance.new("Frame")
BG22.Name = "BG"
BG22.Size = UDim2.new(1,0,1,0)
BG22.Position = UDim2.new(0.5,0,0.5,0)
BG22.AnchorPoint = Vector2.new(0.5,0.5)
BG22.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG22.BackgroundTransparency = 1
BG22.BorderColor3 = Color3.fromRGB(0,0,0)
BG22.BorderSizePixel = 0
BG22.ZIndex = -1
BG22.Parent = COM_5579260382545052095

local Dropshadow21 = Instance.new("Frame")
Dropshadow21.Name = "Dropshadow"
Dropshadow21.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow21.Position = UDim2.new(0,0,1.028,0)
Dropshadow21.AnchorPoint = Vector2.new(0,1)
Dropshadow21.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow21.BackgroundTransparency = 0.5
Dropshadow21.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow21.BorderSizePixel = 0
Dropshadow21.ZIndex = -2
Dropshadow21.Parent = BG22

local UIStroke217 = Instance.new("UIStroke")
UIStroke217.Name = "UIStroke"
UIStroke217.Thickness = 2.79551
UIStroke217.Transparency = 1
UIStroke217.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke217.Parent = Dropshadow21

local Frame22 = Instance.new("Frame")
Frame22.Name = "Frame"
Frame22.Size = UDim2.new(0.969681,0,0.95775,0)
Frame22.Position = UDim2.new(0.514096,0,0.478875,0)
Frame22.AnchorPoint = Vector2.new(0.5,0.5)
Frame22.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame22.BorderColor3 = Color3.fromRGB(0,0,0)
Frame22.BorderSizePixel = 0
Frame22.ZIndex = -1
Frame22.Parent = BG22

local Pattern21 = Instance.new("ImageLabel")
Pattern21.Name = "Pattern"
Pattern21.Size = UDim2.new(1,0,1,0)
Pattern21.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern21.BackgroundTransparency = 1
Pattern21.BorderSizePixel = 0
Pattern21.Image = "rbxassetid://114373250964250"
Pattern21.ZIndex = -1
Pattern21.Parent = Frame22

local UIStroke218 = Instance.new("UIStroke")
UIStroke218.Name = "UIStroke"
UIStroke218.Thickness = 1.86368
UIStroke218.Parent = Pattern21

local UIStroke219 = Instance.new("UIStroke")
UIStroke219.Name = "UIStroke"
UIStroke219.Thickness = 1.86368
UIStroke219.Parent = Frame22

local Highlight21 = Instance.new("Frame")
Highlight21.Name = "Highlight"
Highlight21.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight21.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight21.AnchorPoint = Vector2.new(0.5,0.5)
Highlight21.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight21.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight21.BorderSizePixel = 0
Highlight21.Visible = false
Highlight21.ZIndex = -2
Highlight21.Parent = BG22

local UIStroke220 = Instance.new("UIStroke")
UIStroke220.Name = "UIStroke"
UIStroke220.Color = Color3.fromRGB(255,242,0)
UIStroke220.Thickness = 2.79551
UIStroke220.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke220.Parent = Highlight21

local DisplayTitle17 = Instance.new("TextLabel")
DisplayTitle17.Name = "DisplayTitle"
DisplayTitle17.Size = UDim2.new(0.566559,0,0.435422,0)
DisplayTitle17.Position = UDim2.new(0.691046,0,0.15042,0)
DisplayTitle17.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle17.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle17.BackgroundTransparency = 1
DisplayTitle17.BorderSizePixel = 0
DisplayTitle17.Text = "Easter Enamel Pin Set (Pre-Order)"
DisplayTitle17.TextColor3 = Color3.fromRGB(0,13,76)
DisplayTitle17.TextSize = 29
DisplayTitle17.Font = Enum.Font.Arcade
DisplayTitle17.TextWrapped = true
DisplayTitle17.TextScaled = true
DisplayTitle17.RichText = true
DisplayTitle17.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle17.Parent = COM_5579260382545052095

local UIGradient83 = Instance.new("UIGradient")
UIGradient83.Name = "UIGradient"
UIGradient83.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient83.Rotation = -90
UIGradient83.Offset = Vector2.new(0,0)
UIGradient83.Parent = DisplayTitle17

local UIStroke221 = Instance.new("UIStroke")
UIStroke221.Name = "UIStroke"
UIStroke221.Color = Color3.fromRGB(255,255,255)
UIStroke221.Thickness = 0.931838
UIStroke221.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke221.Parent = DisplayTitle17

local Item22 = Instance.new("ImageLabel")
Item22.Name = "Item"
Item22.Size = UDim2.new(0.913665,0,0.651761,0)
Item22.Position = UDim2.new(0.514096,0,0.463834,0)
Item22.AnchorPoint = Vector2.new(0.5,0.5)
Item22.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item22.BackgroundTransparency = 1
Item22.BorderSizePixel = 0
Item22.Image = "rbxassetid://94959635148921"
Item22.ImageRectOffset = Vector2.new(15,15)
Item22.ImageRectSize = Vector2.new(270,270)
Item22.ScaleType = Enum.ScaleType.Fit
Item22.Visible = false
Item22.ZIndex = -1
Item22.Parent = COM_5579260382545052095

local Unavailable69 = Instance.new("TextLabel")
Unavailable69.Name = "Unavailable"
Unavailable69.Size = UDim2.new(0.7,0,0.7,0)
Unavailable69.Position = UDim2.new(0.5,0,0.5,0)
Unavailable69.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable69.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable69.BackgroundTransparency = 1
Unavailable69.BorderSizePixel = 0
Unavailable69.Text = "Unavailable"
Unavailable69.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable69.TextSize = 14
Unavailable69.Font = Enum.Font.FredokaOne
Unavailable69.TextWrapped = true
Unavailable69.TextScaled = true
Unavailable69.Visible = false
Unavailable69.Parent = Item22

local UIStroke222 = Instance.new("UIStroke")
UIStroke222.Name = "UIStroke"
UIStroke222.Thickness = 2
UIStroke222.Parent = Unavailable69

local New12 = Instance.new("ImageLabel")
New12.Name = "New"
New12.Size = UDim2.new(0.322123,0,0.355513,0)
New12.Position = UDim2.new(0.924293,0,0.0284983,0)
New12.AnchorPoint = Vector2.new(0.5,0.5)
New12.BackgroundColor3 = Color3.fromRGB(255,255,255)
New12.BackgroundTransparency = 1
New12.BorderSizePixel = 0
New12.Image = "rbxassetid://96728750855907"
New12.ScaleType = Enum.ScaleType.Fit
New12.Visible = false
New12.ZIndex = -1
New12.Parent = COM_5579260382545052095

local UIScale35 = Instance.new("UIScale")
UIScale35.Name = "UIScale"
UIScale35.Parent = New12

local Purchase22 = Instance.new("ImageButton")
Purchase22.Name = "Purchase"
Purchase22.Size = UDim2.new(0.551281,0,0.201102,0)
Purchase22.Position = UDim2.new(0.681037,0,0.790057,0)
Purchase22.AnchorPoint = Vector2.new(0.5,0.5)
Purchase22.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase22.BorderSizePixel = 0
Purchase22.ScaleType = Enum.ScaleType.Fit
Purchase22.AutoButtonColor = false
Purchase22.Parent = COM_5579260382545052095

local Price22 = Instance.new("TextLabel")
Price22.Name = "Price"
Price22.Size = UDim2.new(0.78479,0,0.702682,0)
Price22.Position = UDim2.new(0.100663,0,0.0990811,0)
Price22.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price22.BackgroundTransparency = 1
Price22.BorderSizePixel = 0
Price22.Text = "$19.99"
Price22.TextColor3 = Color3.fromRGB(255,255,255)
Price22.TextSize = 14
Price22.Font = Enum.Font.Arcade
Price22.TextWrapped = true
Price22.TextScaled = true
Price22.RichText = true
Price22.AutomaticSize = Enum.AutomaticSize.X
Price22.Parent = Purchase22

local UIGradient84 = Instance.new("UIGradient")
UIGradient84.Name = "UIGradient"
UIGradient84.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient84.Rotation = -90
UIGradient84.Offset = Vector2.new(0,0)
UIGradient84.Parent = Price22

local UIStroke223 = Instance.new("UIStroke")
UIStroke223.Name = "UIStroke"
UIStroke223.Thickness = 0.931838
UIStroke223.Parent = Price22

local UICorner23 = Instance.new("UICorner")
UICorner23.Name = "UICorner"
UICorner23.CornerRadius = UDim.new(1,0)
UICorner23.Parent = Purchase22

local UIGradient85 = Instance.new("UIGradient")
UIGradient85.Name = "UIGradient"
UIGradient85.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient85.Rotation = -90
UIGradient85.Offset = Vector2.new(0,0)
UIGradient85.Parent = Purchase22

local UIScale36 = Instance.new("UIScale")
UIScale36.Name = "UIScale"
UIScale36.Parent = Purchase22

local UIStroke224 = Instance.new("UIStroke")
UIStroke224.Name = "UIStroke"
UIStroke224.Thickness = 1.1648
UIStroke224.Parent = Purchase22

local Thumbnail41 = Instance.new("ImageLabel")
Thumbnail41.Name = "Thumbnail"
Thumbnail41.Size = UDim2.new(0.593809,0,1.5481,0)
Thumbnail41.Position = UDim2.new(0.234728,0,0.432111,0)
Thumbnail41.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail41.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail41.BackgroundTransparency = 1
Thumbnail41.BorderSizePixel = 0
Thumbnail41.Image = "rbxassetid://81530640944625"
Thumbnail41.ScaleType = Enum.ScaleType.Fit
Thumbnail41.ZIndex = -1
Thumbnail41.Parent = COM_5579260382545052095

local Unavailable70 = Instance.new("TextLabel")
Unavailable70.Name = "Unavailable"
Unavailable70.Size = UDim2.new(0.7,0,0.7,0)
Unavailable70.Position = UDim2.new(0.5,0,0.5,0)
Unavailable70.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable70.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable70.BackgroundTransparency = 1
Unavailable70.BorderSizePixel = 0
Unavailable70.Text = "Unavailable"
Unavailable70.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable70.TextSize = 14
Unavailable70.Font = Enum.Font.FredokaOne
Unavailable70.TextWrapped = true
Unavailable70.TextScaled = true
Unavailable70.Visible = false
Unavailable70.Parent = Thumbnail41

local UIStroke225 = Instance.new("UIStroke")
UIStroke225.Name = "UIStroke"
UIStroke225.Thickness = 2
UIStroke225.Parent = Unavailable70

local Title22 = Instance.new("TextLabel")
Title22.Name = "Title"
Title22.Size = UDim2.new(0.566559,0,0.435422,0)
Title22.Position = UDim2.new(0.65544,0,0.15042,0)
Title22.AnchorPoint = Vector2.new(0.5,0)
Title22.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title22.BackgroundTransparency = 1
Title22.BorderSizePixel = 0
Title22.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title22.TextColor3 = Color3.fromRGB(0,13,76)
Title22.TextSize = 29
Title22.Font = Enum.Font.Arcade
Title22.TextWrapped = true
Title22.TextScaled = true
Title22.RichText = true
Title22.Visible = false
Title22.AutomaticSize = Enum.AutomaticSize.X
Title22.Parent = COM_5579260382545052095

local UIGradient86 = Instance.new("UIGradient")
UIGradient86.Name = "UIGradient"
UIGradient86.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient86.Rotation = -90
UIGradient86.Offset = Vector2.new(0,0)
UIGradient86.Parent = Title22

local UIStroke226 = Instance.new("UIStroke")
UIStroke226.Name = "UIStroke"
UIStroke226.Color = Color3.fromRGB(255,255,255)
UIStroke226.Thickness = 2
UIStroke226.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke226.Parent = Title22

local COM_4722159905669251524 = Instance.new("Frame")
COM_4722159905669251524.Name = "COM-4722159905669251524"
COM_4722159905669251524.Size = UDim2.new(0.437886,0,0.931112,0)
COM_4722159905669251524.Position = UDim2.new(-2.68658e-08,0,0,0)
COM_4722159905669251524.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_4722159905669251524.BackgroundTransparency = 1
COM_4722159905669251524.BorderColor3 = Color3.fromRGB(0,0,0)
COM_4722159905669251524.BorderSizePixel = 0
COM_4722159905669251524.Parent = Special13

local BG23 = Instance.new("Frame")
BG23.Name = "BG"
BG23.Size = UDim2.new(1,0,1,0)
BG23.Position = UDim2.new(0.5,0,0.5,0)
BG23.AnchorPoint = Vector2.new(0.5,0.5)
BG23.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG23.BackgroundTransparency = 1
BG23.BorderColor3 = Color3.fromRGB(0,0,0)
BG23.BorderSizePixel = 0
BG23.ZIndex = -1
BG23.Parent = COM_4722159905669251524

local Dropshadow22 = Instance.new("Frame")
Dropshadow22.Name = "Dropshadow"
Dropshadow22.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow22.Position = UDim2.new(0,0,1.028,0)
Dropshadow22.AnchorPoint = Vector2.new(0,1)
Dropshadow22.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow22.BackgroundTransparency = 0.5
Dropshadow22.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow22.BorderSizePixel = 0
Dropshadow22.ZIndex = -2
Dropshadow22.Parent = BG23

local UIStroke227 = Instance.new("UIStroke")
UIStroke227.Name = "UIStroke"
UIStroke227.Thickness = 2.79551
UIStroke227.Transparency = 1
UIStroke227.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke227.Parent = Dropshadow22

local Frame23 = Instance.new("Frame")
Frame23.Name = "Frame"
Frame23.Size = UDim2.new(0.969681,0,0.95775,0)
Frame23.Position = UDim2.new(0.514096,0,0.478875,0)
Frame23.AnchorPoint = Vector2.new(0.5,0.5)
Frame23.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame23.BorderColor3 = Color3.fromRGB(0,0,0)
Frame23.BorderSizePixel = 0
Frame23.ZIndex = -1
Frame23.Parent = BG23

local Pattern22 = Instance.new("ImageLabel")
Pattern22.Name = "Pattern"
Pattern22.Size = UDim2.new(1,0,1,0)
Pattern22.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern22.BackgroundTransparency = 1
Pattern22.BorderSizePixel = 0
Pattern22.Image = "rbxassetid://114373250964250"
Pattern22.ZIndex = -1
Pattern22.Parent = Frame23

local UIStroke228 = Instance.new("UIStroke")
UIStroke228.Name = "UIStroke"
UIStroke228.Thickness = 1.86368
UIStroke228.Parent = Pattern22

local UIStroke229 = Instance.new("UIStroke")
UIStroke229.Name = "UIStroke"
UIStroke229.Thickness = 1.86368
UIStroke229.Parent = Frame23

local Highlight22 = Instance.new("Frame")
Highlight22.Name = "Highlight"
Highlight22.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight22.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight22.AnchorPoint = Vector2.new(0.5,0.5)
Highlight22.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight22.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight22.BorderSizePixel = 0
Highlight22.Visible = false
Highlight22.ZIndex = -2
Highlight22.Parent = BG23

local UIStroke230 = Instance.new("UIStroke")
UIStroke230.Name = "UIStroke"
UIStroke230.Color = Color3.fromRGB(255,242,0)
UIStroke230.Thickness = 2.79551
UIStroke230.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke230.Parent = Highlight22

local DisplayTitle18 = Instance.new("TextLabel")
DisplayTitle18.Name = "DisplayTitle"
DisplayTitle18.Size = UDim2.new(0.566559,0,0.435422,0)
DisplayTitle18.Position = UDim2.new(0.691046,0,0.15042,0)
DisplayTitle18.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle18.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle18.BackgroundTransparency = 1
DisplayTitle18.BorderSizePixel = 0
DisplayTitle18.Text = "Bassie 14\" Deluxe Plush (Pre-Order)"
DisplayTitle18.TextColor3 = Color3.fromRGB(0,13,76)
DisplayTitle18.TextSize = 29
DisplayTitle18.Font = Enum.Font.Arcade
DisplayTitle18.TextWrapped = true
DisplayTitle18.TextScaled = true
DisplayTitle18.RichText = true
DisplayTitle18.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle18.Parent = COM_4722159905669251524

local UIGradient87 = Instance.new("UIGradient")
UIGradient87.Name = "UIGradient"
UIGradient87.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient87.Rotation = -90
UIGradient87.Offset = Vector2.new(0,0)
UIGradient87.Parent = DisplayTitle18

local UIStroke231 = Instance.new("UIStroke")
UIStroke231.Name = "UIStroke"
UIStroke231.Color = Color3.fromRGB(255,255,255)
UIStroke231.Thickness = 0.931838
UIStroke231.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke231.Parent = DisplayTitle18

local Item23 = Instance.new("ImageLabel")
Item23.Name = "Item"
Item23.Size = UDim2.new(0.913665,0,0.651761,0)
Item23.Position = UDim2.new(0.514096,0,0.463834,0)
Item23.AnchorPoint = Vector2.new(0.5,0.5)
Item23.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item23.BackgroundTransparency = 1
Item23.BorderSizePixel = 0
Item23.Image = "rbxassetid://94959635148921"
Item23.ImageRectOffset = Vector2.new(15,15)
Item23.ImageRectSize = Vector2.new(270,270)
Item23.ScaleType = Enum.ScaleType.Fit
Item23.Visible = false
Item23.ZIndex = -1
Item23.Parent = COM_4722159905669251524

local Unavailable71 = Instance.new("TextLabel")
Unavailable71.Name = "Unavailable"
Unavailable71.Size = UDim2.new(0.7,0,0.7,0)
Unavailable71.Position = UDim2.new(0.5,0,0.5,0)
Unavailable71.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable71.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable71.BackgroundTransparency = 1
Unavailable71.BorderSizePixel = 0
Unavailable71.Text = "Unavailable"
Unavailable71.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable71.TextSize = 14
Unavailable71.Font = Enum.Font.FredokaOne
Unavailable71.TextWrapped = true
Unavailable71.TextScaled = true
Unavailable71.Visible = false
Unavailable71.Parent = Item23

local UIStroke232 = Instance.new("UIStroke")
UIStroke232.Name = "UIStroke"
UIStroke232.Thickness = 2
UIStroke232.Parent = Unavailable71

local Purchase23 = Instance.new("ImageButton")
Purchase23.Name = "Purchase"
Purchase23.Size = UDim2.new(0.551281,0,0.201102,0)
Purchase23.Position = UDim2.new(0.681037,0,0.790057,0)
Purchase23.AnchorPoint = Vector2.new(0.5,0.5)
Purchase23.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase23.BorderSizePixel = 0
Purchase23.ScaleType = Enum.ScaleType.Fit
Purchase23.AutoButtonColor = false
Purchase23.Parent = COM_4722159905669251524

local Price23 = Instance.new("TextLabel")
Price23.Name = "Price"
Price23.Size = UDim2.new(0.78479,0,0.702682,0)
Price23.Position = UDim2.new(0.100663,0,0.0990811,0)
Price23.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price23.BackgroundTransparency = 1
Price23.BorderSizePixel = 0
Price23.Text = "$19.99"
Price23.TextColor3 = Color3.fromRGB(255,255,255)
Price23.TextSize = 14
Price23.Font = Enum.Font.Arcade
Price23.TextWrapped = true
Price23.TextScaled = true
Price23.RichText = true
Price23.AutomaticSize = Enum.AutomaticSize.X
Price23.Parent = Purchase23

local UIGradient88 = Instance.new("UIGradient")
UIGradient88.Name = "UIGradient"
UIGradient88.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient88.Rotation = -90
UIGradient88.Offset = Vector2.new(0,0)
UIGradient88.Parent = Price23

local UIStroke233 = Instance.new("UIStroke")
UIStroke233.Name = "UIStroke"
UIStroke233.Thickness = 0.931838
UIStroke233.Parent = Price23

local UICorner24 = Instance.new("UICorner")
UICorner24.Name = "UICorner"
UICorner24.CornerRadius = UDim.new(1,0)
UICorner24.Parent = Purchase23

local UIGradient89 = Instance.new("UIGradient")
UIGradient89.Name = "UIGradient"
UIGradient89.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient89.Rotation = -90
UIGradient89.Offset = Vector2.new(0,0)
UIGradient89.Parent = Purchase23

local UIScale37 = Instance.new("UIScale")
UIScale37.Name = "UIScale"
UIScale37.Parent = Purchase23

local UIStroke234 = Instance.new("UIStroke")
UIStroke234.Name = "UIStroke"
UIStroke234.Thickness = 1.1648
UIStroke234.Parent = Purchase23

local Thumbnail42 = Instance.new("ImageLabel")
Thumbnail42.Name = "Thumbnail"
Thumbnail42.Size = UDim2.new(0.593809,0,1.5481,0)
Thumbnail42.Position = UDim2.new(0.251161,0,0.432111,0)
Thumbnail42.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail42.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail42.BackgroundTransparency = 1
Thumbnail42.BorderSizePixel = 0
Thumbnail42.Image = "rbxassetid://130296178003198"
Thumbnail42.ScaleType = Enum.ScaleType.Fit
Thumbnail42.ZIndex = -1
Thumbnail42.Parent = COM_4722159905669251524

local Unavailable72 = Instance.new("TextLabel")
Unavailable72.Name = "Unavailable"
Unavailable72.Size = UDim2.new(0.7,0,0.7,0)
Unavailable72.Position = UDim2.new(0.5,0,0.5,0)
Unavailable72.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable72.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable72.BackgroundTransparency = 1
Unavailable72.BorderSizePixel = 0
Unavailable72.Text = "Unavailable"
Unavailable72.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable72.TextSize = 14
Unavailable72.Font = Enum.Font.FredokaOne
Unavailable72.TextWrapped = true
Unavailable72.TextScaled = true
Unavailable72.Visible = false
Unavailable72.Parent = Thumbnail42

local UIStroke235 = Instance.new("UIStroke")
UIStroke235.Name = "UIStroke"
UIStroke235.Thickness = 2
UIStroke235.Parent = Unavailable72

local Title23 = Instance.new("TextLabel")
Title23.Name = "Title"
Title23.Size = UDim2.new(0.566559,0,0.435422,0)
Title23.Position = UDim2.new(0.65544,0,0.15042,0)
Title23.AnchorPoint = Vector2.new(0.5,0)
Title23.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title23.BackgroundTransparency = 1
Title23.BorderSizePixel = 0
Title23.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title23.TextColor3 = Color3.fromRGB(0,13,76)
Title23.TextSize = 29
Title23.Font = Enum.Font.Arcade
Title23.TextWrapped = true
Title23.TextScaled = true
Title23.RichText = true
Title23.Visible = false
Title23.AutomaticSize = Enum.AutomaticSize.X
Title23.Parent = COM_4722159905669251524

local UIGradient90 = Instance.new("UIGradient")
UIGradient90.Name = "UIGradient"
UIGradient90.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient90.Rotation = -90
UIGradient90.Offset = Vector2.new(0,0)
UIGradient90.Parent = Title23

local UIStroke236 = Instance.new("UIStroke")
UIStroke236.Name = "UIStroke"
UIStroke236.Color = Color3.fromRGB(255,255,255)
UIStroke236.Thickness = 2
UIStroke236.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke236.Parent = Title23

local UIListLayout14 = Instance.new("UIListLayout")
UIListLayout14.Name = "UIListLayout"
UIListLayout14.Padding = UDim.new(0.019,0)
UIListLayout14.FillDirection = Enum.FillDirection.Horizontal
UIListLayout14.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout14.Wraps = false
UIListLayout14.Parent = Special13

local Special14 = Instance.new("Frame")
Special14.Name = "Special"
Special14.Size = UDim2.new(0.728177,0,0.493216,0)
Special14.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
Special14.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special14.BackgroundTransparency = 1
Special14.BorderColor3 = Color3.fromRGB(0,0,0)
Special14.BorderSizePixel = 0
Special14.LayoutOrder = -6
Special14.Parent = ScrollingFrame

local COM_1037691785750643120 = Instance.new("Frame")
COM_1037691785750643120.Name = "COM-1037691785750643120"
COM_1037691785750643120.Size = UDim2.new(0.894198,0,0.931112,0)
COM_1037691785750643120.Position = UDim2.new(5.4771e-08,0,0,0)
COM_1037691785750643120.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_1037691785750643120.BackgroundTransparency = 1
COM_1037691785750643120.BorderColor3 = Color3.fromRGB(0,0,0)
COM_1037691785750643120.BorderSizePixel = 0
COM_1037691785750643120.ZIndex = 2
COM_1037691785750643120.Parent = Special14

local BG24 = Instance.new("Frame")
BG24.Name = "BG"
BG24.Size = UDim2.new(1,0,1,0)
BG24.Position = UDim2.new(0.5,0,0.5,0)
BG24.AnchorPoint = Vector2.new(0.5,0.5)
BG24.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG24.BackgroundTransparency = 1
BG24.BorderColor3 = Color3.fromRGB(0,0,0)
BG24.BorderSizePixel = 0
BG24.ZIndex = -1
BG24.Parent = COM_1037691785750643120

local Dropshadow23 = Instance.new("Frame")
Dropshadow23.Name = "Dropshadow"
Dropshadow23.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow23.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow23.AnchorPoint = Vector2.new(0,1)
Dropshadow23.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow23.BackgroundTransparency = 0.5
Dropshadow23.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow23.BorderSizePixel = 0
Dropshadow23.ZIndex = -2
Dropshadow23.Parent = BG24

local UIStroke237 = Instance.new("UIStroke")
UIStroke237.Name = "UIStroke"
UIStroke237.Thickness = 2.79551
UIStroke237.Transparency = 1
UIStroke237.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke237.Parent = Dropshadow23

local Frame24 = Instance.new("Frame")
Frame24.Name = "Frame"
Frame24.Size = UDim2.new(0.984612,0,0.95775,0)
Frame24.Position = UDim2.new(0.506631,0,0.478875,0)
Frame24.AnchorPoint = Vector2.new(0.5,0.5)
Frame24.BackgroundColor3 = Color3.fromRGB(216,175,177)
Frame24.BorderColor3 = Color3.fromRGB(0,0,0)
Frame24.BorderSizePixel = 0
Frame24.ZIndex = -1
Frame24.Parent = BG24

local Pattern23 = Instance.new("ImageLabel")
Pattern23.Name = "Pattern"
Pattern23.Size = UDim2.new(1,0,1,0)
Pattern23.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern23.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern23.BackgroundTransparency = 1
Pattern23.BorderSizePixel = 0
Pattern23.Image = "rbxassetid://122810977034227"
Pattern23.ZIndex = -1
Pattern23.Parent = Frame24

local UIGradient91 = Instance.new("UIGradient")
UIGradient91.Name = "UIGradient"
UIGradient91.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
UIGradient91.Rotation = 90
UIGradient91.Offset = Vector2.new(0,0)
UIGradient91.Parent = Pattern23

local UIStroke238 = Instance.new("UIStroke")
UIStroke238.Name = "UIStroke"
UIStroke238.Thickness = 1.86368
UIStroke238.Parent = Pattern23

local UIGradient92 = Instance.new("UIGradient")
UIGradient92.Name = "UIGradient"
UIGradient92.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient92.Rotation = 90
UIGradient92.Offset = Vector2.new(0,0)
UIGradient92.Parent = Frame24

local UIStroke239 = Instance.new("UIStroke")
UIStroke239.Name = "UIStroke"
UIStroke239.Thickness = 1.86368
UIStroke239.Parent = Frame24

local Highlight23 = Instance.new("Frame")
Highlight23.Name = "Highlight"
Highlight23.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight23.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight23.AnchorPoint = Vector2.new(0.5,0.5)
Highlight23.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight23.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight23.BorderSizePixel = 0
Highlight23.Visible = false
Highlight23.ZIndex = -2
Highlight23.Parent = BG24

local UIStroke240 = Instance.new("UIStroke")
UIStroke240.Name = "UIStroke"
UIStroke240.Color = Color3.fromRGB(255,242,0)
UIStroke240.Thickness = 2.79551
UIStroke240.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke240.Parent = Highlight23

local CanvasGroup10 = Instance.new("CanvasGroup")
CanvasGroup10.Name = "CanvasGroup"
CanvasGroup10.Size = UDim2.new(0.970515,0,0.95775,0)
CanvasGroup10.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup10.BackgroundTransparency = 1
CanvasGroup10.Parent = COM_1037691785750643120

local Thumbnail43 = Instance.new("ImageLabel")
Thumbnail43.Name = "Thumbnail"
Thumbnail43.Size = UDim2.new(0.453224,0,1.0299,0)
Thumbnail43.Position = UDim2.new(0.158726,0,0.529214,0)
Thumbnail43.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail43.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail43.BackgroundTransparency = 1
Thumbnail43.BorderSizePixel = 0
Thumbnail43.Image = "rbxassetid://108021402940909"
Thumbnail43.ScaleType = Enum.ScaleType.Fit
Thumbnail43.Rotation = -11
Thumbnail43.Parent = CanvasGroup10

local Unavailable73 = Instance.new("TextLabel")
Unavailable73.Name = "Unavailable"
Unavailable73.Size = UDim2.new(0.7,0,0.7,0)
Unavailable73.Position = UDim2.new(0.5,0,0.5,0)
Unavailable73.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable73.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable73.BackgroundTransparency = 1
Unavailable73.BorderSizePixel = 0
Unavailable73.Text = "Unavailable"
Unavailable73.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable73.TextSize = 14
Unavailable73.Font = Enum.Font.FredokaOne
Unavailable73.TextWrapped = true
Unavailable73.TextScaled = true
Unavailable73.Visible = false
Unavailable73.Parent = Thumbnail43

local UIStroke241 = Instance.new("UIStroke")
UIStroke241.Name = "UIStroke"
UIStroke241.Thickness = 2
UIStroke241.Parent = Unavailable73

local Thumbnail44 = Instance.new("ImageLabel")
Thumbnail44.Name = "Thumbnail"
Thumbnail44.Size = UDim2.new(0.453224,0,0.952594,0)
Thumbnail44.Position = UDim2.new(0.256823,0,0.413572,0)
Thumbnail44.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail44.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail44.BackgroundTransparency = 1
Thumbnail44.BorderSizePixel = 0
Thumbnail44.Image = "rbxassetid://136052355101737"
Thumbnail44.ScaleType = Enum.ScaleType.Fit
Thumbnail44.ZIndex = 0
Thumbnail44.Rotation = 11
Thumbnail44.Parent = CanvasGroup10

local Unavailable74 = Instance.new("TextLabel")
Unavailable74.Name = "Unavailable"
Unavailable74.Size = UDim2.new(0.7,0,0.7,0)
Unavailable74.Position = UDim2.new(0.5,0,0.5,0)
Unavailable74.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable74.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable74.BackgroundTransparency = 1
Unavailable74.BorderSizePixel = 0
Unavailable74.Text = "Unavailable"
Unavailable74.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable74.TextSize = 14
Unavailable74.Font = Enum.Font.FredokaOne
Unavailable74.TextWrapped = true
Unavailable74.TextScaled = true
Unavailable74.Visible = false
Unavailable74.Parent = Thumbnail44

local UIStroke242 = Instance.new("UIStroke")
UIStroke242.Name = "UIStroke"
UIStroke242.Thickness = 2
UIStroke242.Parent = Unavailable74

local DisplayTitle19 = Instance.new("TextLabel")
DisplayTitle19.Name = "DisplayTitle"
DisplayTitle19.Size = UDim2.new(0.428097,0,0.415185,0)
DisplayTitle19.Position = UDim2.new(0.767443,0,0.212655,0)
DisplayTitle19.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle19.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle19.BackgroundTransparency = 1
DisplayTitle19.BorderSizePixel = 0
DisplayTitle19.Text = "Sprout Deluxe 14\" Plush (Pre-Order)"
DisplayTitle19.TextColor3 = Color3.fromRGB(2,40,0)
DisplayTitle19.TextSize = 29
DisplayTitle19.Font = Enum.Font.Arcade
DisplayTitle19.TextWrapped = true
DisplayTitle19.TextScaled = true
DisplayTitle19.RichText = true
DisplayTitle19.Parent = COM_1037691785750643120

local UIGradient93 = Instance.new("UIGradient")
UIGradient93.Name = "UIGradient"
UIGradient93.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient93.Rotation = -90
UIGradient93.Offset = Vector2.new(0,0)
UIGradient93.Parent = DisplayTitle19

local UIStroke243 = Instance.new("UIStroke")
UIStroke243.Name = "UIStroke"
UIStroke243.Color = Color3.fromRGB(255,255,255)
UIStroke243.Thickness = 0.931838
UIStroke243.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke243.Parent = DisplayTitle19

local Item24 = Instance.new("ImageLabel")
Item24.Name = "Item"
Item24.Size = UDim2.new(0.913665,0,0.651761,0)
Item24.Position = UDim2.new(0.514096,0,0.463834,0)
Item24.AnchorPoint = Vector2.new(0.5,0.5)
Item24.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item24.BackgroundTransparency = 1
Item24.BorderSizePixel = 0
Item24.Image = "rbxassetid://94959635148921"
Item24.ImageRectOffset = Vector2.new(15,15)
Item24.ImageRectSize = Vector2.new(270,270)
Item24.ScaleType = Enum.ScaleType.Fit
Item24.Visible = false
Item24.ZIndex = -1
Item24.Parent = COM_1037691785750643120

local Unavailable75 = Instance.new("TextLabel")
Unavailable75.Name = "Unavailable"
Unavailable75.Size = UDim2.new(0.7,0,0.7,0)
Unavailable75.Position = UDim2.new(0.5,0,0.5,0)
Unavailable75.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable75.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable75.BackgroundTransparency = 1
Unavailable75.BorderSizePixel = 0
Unavailable75.Text = "Unavailable"
Unavailable75.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable75.TextSize = 14
Unavailable75.Font = Enum.Font.FredokaOne
Unavailable75.TextWrapped = true
Unavailable75.TextScaled = true
Unavailable75.Visible = false
Unavailable75.Parent = Item24

local UIStroke244 = Instance.new("UIStroke")
UIStroke244.Name = "UIStroke"
UIStroke244.Thickness = 2
UIStroke244.Parent = Unavailable75

local New13 = Instance.new("ImageLabel")
New13.Name = "New"
New13.Size = UDim2.new(0.322123,0,0.355513,0)
New13.Position = UDim2.new(0.94212,0,0.0839209,0)
New13.AnchorPoint = Vector2.new(0.5,0.5)
New13.BackgroundColor3 = Color3.fromRGB(255,255,255)
New13.BackgroundTransparency = 1
New13.BorderSizePixel = 0
New13.Image = "rbxassetid://96728750855907"
New13.ScaleType = Enum.ScaleType.Fit
New13.Visible = false
New13.ZIndex = -1
New13.Parent = COM_1037691785750643120

local UIScale38 = Instance.new("UIScale")
UIScale38.Name = "UIScale"
UIScale38.Parent = New13

local Purchase24 = Instance.new("ImageButton")
Purchase24.Name = "Purchase"
Purchase24.Size = UDim2.new(0.436835,0,0.172928,0)
Purchase24.Position = UDim2.new(0.752098,0,0.833662,0)
Purchase24.AnchorPoint = Vector2.new(0.5,0.5)
Purchase24.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase24.BorderSizePixel = 0
Purchase24.ScaleType = Enum.ScaleType.Fit
Purchase24.AutoButtonColor = false
Purchase24.ZIndex = 5
Purchase24.Parent = COM_1037691785750643120

local Price24 = Instance.new("TextLabel")
Price24.Name = "Price"
Price24.Size = UDim2.new(0.78479,0,0.702682,0)
Price24.Position = UDim2.new(0.100663,0,0.0990811,0)
Price24.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price24.BackgroundTransparency = 1
Price24.BorderSizePixel = 0
Price24.Text = "$19.99"
Price24.TextColor3 = Color3.fromRGB(255,255,255)
Price24.TextSize = 14
Price24.Font = Enum.Font.Arcade
Price24.TextWrapped = true
Price24.TextScaled = true
Price24.RichText = true
Price24.AutomaticSize = Enum.AutomaticSize.X
Price24.Parent = Purchase24

local UIGradient94 = Instance.new("UIGradient")
UIGradient94.Name = "UIGradient"
UIGradient94.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient94.Rotation = -90
UIGradient94.Offset = Vector2.new(0,0)
UIGradient94.Parent = Price24

local UIStroke245 = Instance.new("UIStroke")
UIStroke245.Name = "UIStroke"
UIStroke245.Thickness = 0.931838
UIStroke245.Parent = Price24

local UICorner25 = Instance.new("UICorner")
UICorner25.Name = "UICorner"
UICorner25.CornerRadius = UDim.new(1,0)
UICorner25.Parent = Purchase24

local UIGradient95 = Instance.new("UIGradient")
UIGradient95.Name = "UIGradient"
UIGradient95.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient95.Rotation = -90
UIGradient95.Offset = Vector2.new(0,0)
UIGradient95.Parent = Purchase24

local UIScale39 = Instance.new("UIScale")
UIScale39.Name = "UIScale"
UIScale39.Parent = Purchase24

local UIStroke246 = Instance.new("UIStroke")
UIStroke246.Name = "UIStroke"
UIStroke246.Thickness = 1.1648
UIStroke246.Parent = Purchase24

local Thumbnail45 = Instance.new("ImageLabel")
Thumbnail45.Name = "Thumbnail"
Thumbnail45.Size = UDim2.new(0.48234,0,1.2575,0)
Thumbnail45.Position = UDim2.new(0.454675,0,0.450994,0)
Thumbnail45.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail45.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail45.BackgroundTransparency = 1
Thumbnail45.BorderSizePixel = 0
Thumbnail45.Image = "rbxassetid://92821036648295"
Thumbnail45.ScaleType = Enum.ScaleType.Fit
Thumbnail45.ZIndex = 4
Thumbnail45.Parent = COM_1037691785750643120

local Unavailable76 = Instance.new("TextLabel")
Unavailable76.Name = "Unavailable"
Unavailable76.Size = UDim2.new(0.7,0,0.7,0)
Unavailable76.Position = UDim2.new(0.5,0,0.5,0)
Unavailable76.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable76.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable76.BackgroundTransparency = 1
Unavailable76.BorderSizePixel = 0
Unavailable76.Text = "Unavailable"
Unavailable76.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable76.TextSize = 14
Unavailable76.Font = Enum.Font.FredokaOne
Unavailable76.TextWrapped = true
Unavailable76.TextScaled = true
Unavailable76.Visible = false
Unavailable76.Parent = Thumbnail45

local UIStroke247 = Instance.new("UIStroke")
UIStroke247.Name = "UIStroke"
UIStroke247.Thickness = 2
UIStroke247.Parent = Unavailable76

local Title24 = Instance.new("TextLabel")
Title24.Name = "Title"
Title24.Size = UDim2.new(0.566559,0,0.435422,0)
Title24.Position = UDim2.new(0.65544,0,0.15042,0)
Title24.AnchorPoint = Vector2.new(0.5,0)
Title24.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title24.BackgroundTransparency = 1
Title24.BorderSizePixel = 0
Title24.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title24.TextColor3 = Color3.fromRGB(0,13,76)
Title24.TextSize = 29
Title24.Font = Enum.Font.Arcade
Title24.TextWrapped = true
Title24.TextScaled = true
Title24.RichText = true
Title24.Visible = false
Title24.AutomaticSize = Enum.AutomaticSize.X
Title24.Parent = COM_1037691785750643120

local UIGradient96 = Instance.new("UIGradient")
UIGradient96.Name = "UIGradient"
UIGradient96.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient96.Rotation = -90
UIGradient96.Offset = Vector2.new(0,0)
UIGradient96.Parent = Title24

local UIStroke248 = Instance.new("UIStroke")
UIStroke248.Name = "UIStroke"
UIStroke248.Color = Color3.fromRGB(255,255,255)
UIStroke248.Thickness = 2
UIStroke248.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke248.Parent = Title24

local COM_8902595216255615457 = Instance.new("Frame")
COM_8902595216255615457.Name = "COM-8902595216255615457"
COM_8902595216255615457.Size = UDim2.new(0.442523,0,0.944677,0)
COM_8902595216255615457.Position = UDim2.new(0.913307,0,0,0)
COM_8902595216255615457.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_8902595216255615457.BackgroundTransparency = 1
COM_8902595216255615457.BorderColor3 = Color3.fromRGB(0,0,0)
COM_8902595216255615457.BorderSizePixel = 0
COM_8902595216255615457.Parent = Special14

local BG25 = Instance.new("Frame")
BG25.Name = "BG"
BG25.Size = UDim2.new(1,0,1,0)
BG25.Position = UDim2.new(0.5,0,0.5,0)
BG25.AnchorPoint = Vector2.new(0.5,0.5)
BG25.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG25.BackgroundTransparency = 1
BG25.BorderColor3 = Color3.fromRGB(0,0,0)
BG25.BorderSizePixel = 0
BG25.ZIndex = -1
BG25.Parent = COM_8902595216255615457

local Dropshadow24 = Instance.new("Frame")
Dropshadow24.Name = "Dropshadow"
Dropshadow24.Size = UDim2.new(0.947997,0,0.95376,0)
Dropshadow24.Position = UDim2.new(-0.00747363,0,1.01324,0)
Dropshadow24.AnchorPoint = Vector2.new(0,1)
Dropshadow24.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow24.BackgroundTransparency = 0.5
Dropshadow24.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow24.BorderSizePixel = 0
Dropshadow24.ZIndex = -2
Dropshadow24.Parent = BG25

local UIStroke249 = Instance.new("UIStroke")
UIStroke249.Name = "UIStroke"
UIStroke249.Thickness = 2.79551
UIStroke249.Transparency = 1
UIStroke249.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke249.Parent = Dropshadow24

local Frame25 = Instance.new("Frame")
Frame25.Name = "Frame"
Frame25.Size = UDim2.new(0.95775,0,0.95775,0)
Frame25.Position = UDim2.new(0.521125,0,0.478875,0)
Frame25.AnchorPoint = Vector2.new(0.5,0.5)
Frame25.BackgroundColor3 = Color3.fromRGB(216,175,177)
Frame25.BorderColor3 = Color3.fromRGB(0,0,0)
Frame25.BorderSizePixel = 0
Frame25.ZIndex = -1
Frame25.Parent = BG25

local Pattern24 = Instance.new("ImageLabel")
Pattern24.Name = "Pattern"
Pattern24.Size = UDim2.new(1,0,1,0)
Pattern24.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern24.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern24.BackgroundTransparency = 1
Pattern24.BorderSizePixel = 0
Pattern24.Image = "rbxassetid://110909808384714"
Pattern24.ScaleType = Enum.ScaleType.Crop
Pattern24.ZIndex = -1
Pattern24.Parent = Frame25

local UIGradient97 = Instance.new("UIGradient")
UIGradient97.Name = "UIGradient"
UIGradient97.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
UIGradient97.Rotation = 90
UIGradient97.Offset = Vector2.new(0,0)
UIGradient97.Parent = Pattern24

local UIStroke250 = Instance.new("UIStroke")
UIStroke250.Name = "UIStroke"
UIStroke250.Thickness = 1.86368
UIStroke250.Parent = Pattern24

local UIGradient98 = Instance.new("UIGradient")
UIGradient98.Name = "UIGradient"
UIGradient98.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient98.Rotation = 90
UIGradient98.Offset = Vector2.new(0,0)
UIGradient98.Parent = Frame25

local UIStroke251 = Instance.new("UIStroke")
UIStroke251.Name = "UIStroke"
UIStroke251.Thickness = 4
UIStroke251.Parent = Frame25

local Highlight24 = Instance.new("Frame")
Highlight24.Name = "Highlight"
Highlight24.Size = UDim2.new(0.954203,0,0.95775,0)
Highlight24.Position = UDim2.new(0.519351,0,0.478875,0)
Highlight24.AnchorPoint = Vector2.new(0.5,0.5)
Highlight24.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight24.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight24.BorderSizePixel = 0
Highlight24.Visible = false
Highlight24.ZIndex = -2
Highlight24.Parent = BG25

local UIStroke252 = Instance.new("UIStroke")
UIStroke252.Name = "UIStroke"
UIStroke252.Color = Color3.fromRGB(255,242,0)
UIStroke252.Thickness = 2.79551
UIStroke252.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke252.Parent = Highlight24

local Item25 = Instance.new("ImageLabel")
Item25.Name = "Item"
Item25.Size = UDim2.new(0.902423,0,0.651761,0)
Item25.Position = UDim2.new(0.521125,0,0.463834,0)
Item25.AnchorPoint = Vector2.new(0.5,0.5)
Item25.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item25.BackgroundTransparency = 1
Item25.BorderSizePixel = 0
Item25.Image = "rbxassetid://94959635148921"
Item25.ImageRectOffset = Vector2.new(25,25)
Item25.ImageRectSize = Vector2.new(250,250)
Item25.ScaleType = Enum.ScaleType.Crop
Item25.Visible = false
Item25.ZIndex = -1
Item25.Parent = COM_8902595216255615457

local Unavailable77 = Instance.new("TextLabel")
Unavailable77.Name = "Unavailable"
Unavailable77.Size = UDim2.new(0.7,0,0.7,0)
Unavailable77.Position = UDim2.new(0.5,0,0.5,0)
Unavailable77.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable77.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable77.BackgroundTransparency = 1
Unavailable77.BorderSizePixel = 0
Unavailable77.Text = "Unavailable"
Unavailable77.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable77.TextSize = 14
Unavailable77.Font = Enum.Font.FredokaOne
Unavailable77.TextWrapped = true
Unavailable77.TextScaled = true
Unavailable77.Visible = false
Unavailable77.Parent = Item25

local UIStroke253 = Instance.new("UIStroke")
UIStroke253.Name = "UIStroke"
UIStroke253.Thickness = 2
UIStroke253.Parent = Unavailable77

local Pixel8 = Instance.new("ImageLabel")
Pixel8.Name = "Pixel"
Pixel8.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel8.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel8.AnchorPoint = Vector2.new(0.5,0.5)
Pixel8.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel8.BorderSizePixel = 0
Pixel8.Image = "rbxassetid://94959635148921"
Pixel8.ImageRectOffset = Vector2.new(55,100)
Pixel8.ImageRectSize = Vector2.new(30,30)
Pixel8.ScaleType = Enum.ScaleType.Crop
Pixel8.Visible = false
Pixel8.ZIndex = 5
Pixel8.Parent = COM_8902595216255615457

local Unavailable78 = Instance.new("TextLabel")
Unavailable78.Name = "Unavailable"
Unavailable78.Size = UDim2.new(0.7,0,0.7,0)
Unavailable78.Position = UDim2.new(0.5,0,0.5,0)
Unavailable78.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable78.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable78.BackgroundTransparency = 1
Unavailable78.BorderSizePixel = 0
Unavailable78.Text = "Unavailable"
Unavailable78.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable78.TextSize = 14
Unavailable78.Font = Enum.Font.FredokaOne
Unavailable78.TextWrapped = true
Unavailable78.TextScaled = true
Unavailable78.Visible = false
Unavailable78.Parent = Pixel8

local UIStroke254 = Instance.new("UIStroke")
UIStroke254.Name = "UIStroke"
UIStroke254.Thickness = 2
UIStroke254.Parent = Unavailable78

local Purchase25 = Instance.new("ImageButton")
Purchase25.Name = "Purchase"
Purchase25.Size = UDim2.new(0.863319,0,0.170445,0)
Purchase25.Position = UDim2.new(0.514166,0,0.821691,0)
Purchase25.AnchorPoint = Vector2.new(0.5,0.5)
Purchase25.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase25.BorderSizePixel = 0
Purchase25.ScaleType = Enum.ScaleType.Fit
Purchase25.AutoButtonColor = false
Purchase25.ZIndex = 6
Purchase25.Parent = COM_8902595216255615457

local Price25 = Instance.new("TextLabel")
Price25.Name = "Price"
Price25.Size = UDim2.new(0.78479,0,0.702682,0)
Price25.Position = UDim2.new(0.100663,0,0.0990811,0)
Price25.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price25.BackgroundTransparency = 1
Price25.BorderSizePixel = 0
Price25.Text = "$19.99"
Price25.TextColor3 = Color3.fromRGB(255,255,255)
Price25.TextSize = 14
Price25.Font = Enum.Font.Arcade
Price25.TextWrapped = true
Price25.TextScaled = true
Price25.RichText = true
Price25.AutomaticSize = Enum.AutomaticSize.X
Price25.Parent = Purchase25

local UIGradient99 = Instance.new("UIGradient")
UIGradient99.Name = "UIGradient"
UIGradient99.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient99.Rotation = -90
UIGradient99.Offset = Vector2.new(0,0)
UIGradient99.Parent = Price25

local UIStroke255 = Instance.new("UIStroke")
UIStroke255.Name = "UIStroke"
UIStroke255.Thickness = 2
UIStroke255.Parent = Price25

local UICorner26 = Instance.new("UICorner")
UICorner26.Name = "UICorner"
UICorner26.CornerRadius = UDim.new(1,0)
UICorner26.Parent = Purchase25

local UIGradient100 = Instance.new("UIGradient")
UIGradient100.Name = "UIGradient"
UIGradient100.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient100.Rotation = -90
UIGradient100.Offset = Vector2.new(0,0)
UIGradient100.Parent = Purchase25

local UIScale40 = Instance.new("UIScale")
UIScale40.Name = "UIScale"
UIScale40.Parent = Purchase25

local UIStroke256 = Instance.new("UIStroke")
UIStroke256.Name = "UIStroke"
UIStroke256.Thickness = 2.5
UIStroke256.Parent = Purchase25

local Thumbnail46 = Instance.new("ImageLabel")
Thumbnail46.Name = "Thumbnail"
Thumbnail46.Size = UDim2.new(1.15659,0,0.857211,0)
Thumbnail46.Position = UDim2.new(0.495381,0,0.470327,0)
Thumbnail46.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail46.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail46.BackgroundTransparency = 1
Thumbnail46.BorderSizePixel = 0
Thumbnail46.Image = "rbxassetid://107036941918802"
Thumbnail46.ScaleType = Enum.ScaleType.Crop
Thumbnail46.ZIndex = -1
Thumbnail46.Parent = COM_8902595216255615457

local Unavailable79 = Instance.new("TextLabel")
Unavailable79.Name = "Unavailable"
Unavailable79.Size = UDim2.new(0.7,0,0.7,0)
Unavailable79.Position = UDim2.new(0.5,0,0.5,0)
Unavailable79.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable79.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable79.BackgroundTransparency = 1
Unavailable79.BorderSizePixel = 0
Unavailable79.Text = "Unavailable"
Unavailable79.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable79.TextSize = 14
Unavailable79.Font = Enum.Font.FredokaOne
Unavailable79.TextWrapped = true
Unavailable79.TextScaled = true
Unavailable79.Visible = false
Unavailable79.Parent = Thumbnail46

local UIStroke257 = Instance.new("UIStroke")
UIStroke257.Name = "UIStroke"
UIStroke257.Thickness = 2
UIStroke257.Parent = Unavailable79

local Title25 = Instance.new("TextLabel")
Title25.Name = "Title"
Title25.Size = UDim2.new(0.874784,0,0.149,0)
Title25.Position = UDim2.new(0.531264,0,0.0306123,0)
Title25.AnchorPoint = Vector2.new(0.5,0)
Title25.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title25.BackgroundTransparency = 1
Title25.BorderSizePixel = 0
Title25.Text = "Bobette 11” x 14” Poster"
Title25.TextColor3 = Color3.fromRGB(0,0,0)
Title25.TextSize = 29
Title25.Font = Enum.Font.Arcade
Title25.TextXAlignment = Enum.TextXAlignment.Left
Title25.TextYAlignment = Enum.TextYAlignment.Top
Title25.TextWrapped = true
Title25.TextScaled = true
Title25.RichText = true
Title25.Visible = false
Title25.AutomaticSize = Enum.AutomaticSize.X
Title25.Parent = COM_8902595216255615457

local UITextSizeConstraint11 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint11.Name = "UITextSizeConstraint"
UITextSizeConstraint11.MaxTextSize = 29
UITextSizeConstraint11.Parent = Title25

local UIListLayout15 = Instance.new("UIListLayout")
UIListLayout15.Name = "UIListLayout"
UIListLayout15.Padding = UDim.new(0.019,0)
UIListLayout15.FillDirection = Enum.FillDirection.Horizontal
UIListLayout15.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout15.Wraps = false
UIListLayout15.Parent = Special14

local Row = Instance.new("Frame")
Row.Name = "Row"
Row.Size = UDim2.new(1,0,0.618953,0)
Row.Position = UDim2.new(-5.82348e-08,0,-0.528551,0)
Row.BackgroundColor3 = Color3.fromRGB(255,255,255)
Row.BackgroundTransparency = 1
Row.BorderColor3 = Color3.fromRGB(0,0,0)
Row.BorderSizePixel = 0
Row.LayoutOrder = -5
Row.Parent = ScrollingFrame

local Template = Instance.new("Frame")
Template.Name = "Template"
Template.Size = UDim2.new(0.31602,0,0.944677,0)
Template.Position = UDim2.new(6.27232e-08,0,-0.0531514,0)
Template.BackgroundColor3 = Color3.fromRGB(255,225,0)
Template.BackgroundTransparency = 1
Template.BorderColor3 = Color3.fromRGB(0,0,0)
Template.BorderSizePixel = 0
Template.Parent = Row

local BG26 = Instance.new("Frame")
BG26.Name = "BG"
BG26.Size = UDim2.new(1,0,1,0)
BG26.Position = UDim2.new(0.5,0,0.5,0)
BG26.AnchorPoint = Vector2.new(0.5,0.5)
BG26.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG26.BackgroundTransparency = 1
BG26.BorderColor3 = Color3.fromRGB(0,0,0)
BG26.BorderSizePixel = 0
BG26.ZIndex = -1
BG26.Parent = Template

local Dropshadow25 = Instance.new("Frame")
Dropshadow25.Name = "Dropshadow"
Dropshadow25.Size = UDim2.new(0.940524,0,0.940524,0)
Dropshadow25.Position = UDim2.new(0,0,1,0)
Dropshadow25.AnchorPoint = Vector2.new(0,1)
Dropshadow25.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow25.BackgroundTransparency = 0.5
Dropshadow25.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow25.BorderSizePixel = 0
Dropshadow25.ZIndex = -2
Dropshadow25.Parent = BG26

local Frame26 = Instance.new("Frame")
Frame26.Name = "Frame"
Frame26.Size = UDim2.new(0.95775,0,0.95775,0)
Frame26.Position = UDim2.new(0.521125,0,0.478875,0)
Frame26.AnchorPoint = Vector2.new(0.5,0.5)
Frame26.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame26.BorderColor3 = Color3.fromRGB(0,0,0)
Frame26.BorderSizePixel = 0
Frame26.ZIndex = -1
Frame26.Parent = BG26

local UIStroke258 = Instance.new("UIStroke")
UIStroke258.Name = "UIStroke"
UIStroke258.Thickness = 4
UIStroke258.Parent = Frame26

local Item26 = Instance.new("ImageLabel")
Item26.Name = "Item2"
Item26.Size = UDim2.new(0.902423,0,0.651761,0)
Item26.Position = UDim2.new(0.521125,0,0.463834,0)
Item26.AnchorPoint = Vector2.new(0.5,0.5)
Item26.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item26.BackgroundTransparency = 1
Item26.BorderSizePixel = 0
Item26.Image = "rbxassetid://94959635148921"
Item26.ImageRectOffset = Vector2.new(25,25)
Item26.ImageRectSize = Vector2.new(250,250)
Item26.ScaleType = Enum.ScaleType.Crop
Item26.Visible = false
Item26.ZIndex = -1
Item26.Parent = Template

local Unavailable80 = Instance.new("TextLabel")
Unavailable80.Name = "Unavailable"
Unavailable80.Size = UDim2.new(0.7,0,0.7,0)
Unavailable80.Position = UDim2.new(0.5,0,0.5,0)
Unavailable80.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable80.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable80.BackgroundTransparency = 1
Unavailable80.BorderSizePixel = 0
Unavailable80.Text = "Unavailable"
Unavailable80.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable80.TextSize = 14
Unavailable80.Font = Enum.Font.FredokaOne
Unavailable80.TextWrapped = true
Unavailable80.TextScaled = true
Unavailable80.Visible = false
Unavailable80.Parent = Item26

local UIStroke259 = Instance.new("UIStroke")
UIStroke259.Name = "UIStroke"
UIStroke259.Thickness = 2
UIStroke259.Parent = Unavailable80

local Pixel9 = Instance.new("ImageLabel")
Pixel9.Name = "Pixel"
Pixel9.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel9.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel9.AnchorPoint = Vector2.new(0.5,0.5)
Pixel9.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel9.BorderSizePixel = 0
Pixel9.Image = "rbxassetid://94959635148921"
Pixel9.ImageRectOffset = Vector2.new(55,100)
Pixel9.ImageRectSize = Vector2.new(30,30)
Pixel9.ScaleType = Enum.ScaleType.Crop
Pixel9.Visible = false
Pixel9.ZIndex = 5
Pixel9.Parent = Template

local Unavailable81 = Instance.new("TextLabel")
Unavailable81.Name = "Unavailable"
Unavailable81.Size = UDim2.new(0.7,0,0.7,0)
Unavailable81.Position = UDim2.new(0.5,0,0.5,0)
Unavailable81.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable81.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable81.BackgroundTransparency = 1
Unavailable81.BorderSizePixel = 0
Unavailable81.Text = "Unavailable"
Unavailable81.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable81.TextSize = 14
Unavailable81.Font = Enum.Font.FredokaOne
Unavailable81.TextWrapped = true
Unavailable81.TextScaled = true
Unavailable81.Visible = false
Unavailable81.Parent = Pixel9

local UIStroke260 = Instance.new("UIStroke")
UIStroke260.Name = "UIStroke"
UIStroke260.Thickness = 2
UIStroke260.Parent = Unavailable81

local Purchase26 = Instance.new("ImageButton")
Purchase26.Name = "Purchase"
Purchase26.Size = UDim2.new(0.902423,0,0.116761,0)
Purchase26.Position = UDim2.new(0.521125,0,0.866764,0)
Purchase26.AnchorPoint = Vector2.new(0.5,0.5)
Purchase26.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase26.BorderSizePixel = 0
Purchase26.ScaleType = Enum.ScaleType.Fit
Purchase26.AutoButtonColor = false
Purchase26.Active = false
Purchase26.Parent = Template

local Price26 = Instance.new("TextLabel")
Price26.Name = "Price"
Price26.Size = UDim2.new(0.78479,0,0.702682,0)
Price26.Position = UDim2.new(0.100663,0,0.0990811,0)
Price26.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price26.BackgroundTransparency = 1
Price26.BorderSizePixel = 0
Price26.Text = "$19.99"
Price26.TextColor3 = Color3.fromRGB(255,255,255)
Price26.TextSize = 14
Price26.Font = Enum.Font.Arcade
Price26.TextWrapped = true
Price26.TextScaled = true
Price26.RichText = true
Price26.AutomaticSize = Enum.AutomaticSize.X
Price26.Parent = Purchase26

local UIGradient101 = Instance.new("UIGradient")
UIGradient101.Name = "UIGradient"
UIGradient101.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient101.Rotation = -90
UIGradient101.Offset = Vector2.new(0,0)
UIGradient101.Parent = Price26

local UIStroke261 = Instance.new("UIStroke")
UIStroke261.Name = "UIStroke"
UIStroke261.Thickness = 2
UIStroke261.Parent = Price26

local UICorner27 = Instance.new("UICorner")
UICorner27.Name = "UICorner"
UICorner27.CornerRadius = UDim.new(1,0)
UICorner27.Parent = Purchase26

local UIGradient102 = Instance.new("UIGradient")
UIGradient102.Name = "UIGradient"
UIGradient102.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient102.Rotation = -90
UIGradient102.Offset = Vector2.new(0,0)
UIGradient102.Parent = Purchase26

local UIStroke262 = Instance.new("UIStroke")
UIStroke262.Name = "UIStroke"
UIStroke262.Thickness = 2.5
UIStroke262.Parent = Purchase26

local Title26 = Instance.new("TextLabel")
Title26.Name = "Title"
Title26.Size = UDim2.new(0.854506,0,0.108842,0)
Title26.Position = UDim2.new(0.521125,0,0.0306124,0)
Title26.AnchorPoint = Vector2.new(0.5,0)
Title26.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title26.BackgroundTransparency = 1
Title26.BorderSizePixel = 0
Title26.Text = "COM-5640493750225600958"
Title26.TextColor3 = Color3.fromRGB(0,0,0)
Title26.TextSize = 29
Title26.Font = Enum.Font.Arcade
Title26.TextXAlignment = Enum.TextXAlignment.Left
Title26.TextYAlignment = Enum.TextYAlignment.Top
Title26.TextWrapped = true
Title26.TextScaled = true
Title26.RichText = true
Title26.AutomaticSize = Enum.AutomaticSize.X
Title26.Parent = Template

local UITextSizeConstraint12 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint12.Name = "UITextSizeConstraint"
UITextSizeConstraint12.MaxTextSize = 29
UITextSizeConstraint12.Parent = Title26

local UIAspectRatioConstraint13 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint13.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint13.AspectRatio = 0.76
UIAspectRatioConstraint13.Parent = Template

local Template2 = Instance.new("Frame")
Template2.Name = "Template"
Template2.Size = UDim2.new(0.31602,0,0.944677,0)
Template2.Position = UDim2.new(0.672173,0,-0.0531514,0)
Template2.BackgroundColor3 = Color3.fromRGB(255,225,0)
Template2.BackgroundTransparency = 1
Template2.BorderColor3 = Color3.fromRGB(0,0,0)
Template2.BorderSizePixel = 0
Template2.Parent = Row

local BG27 = Instance.new("Frame")
BG27.Name = "BG"
BG27.Size = UDim2.new(1,0,1,0)
BG27.Position = UDim2.new(0.5,0,0.5,0)
BG27.AnchorPoint = Vector2.new(0.5,0.5)
BG27.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG27.BackgroundTransparency = 1
BG27.BorderColor3 = Color3.fromRGB(0,0,0)
BG27.BorderSizePixel = 0
BG27.ZIndex = -1
BG27.Parent = Template2

local Dropshadow26 = Instance.new("Frame")
Dropshadow26.Name = "Dropshadow"
Dropshadow26.Size = UDim2.new(0.940524,0,0.940524,0)
Dropshadow26.Position = UDim2.new(0,0,1,0)
Dropshadow26.AnchorPoint = Vector2.new(0,1)
Dropshadow26.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow26.BackgroundTransparency = 0.5
Dropshadow26.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow26.BorderSizePixel = 0
Dropshadow26.ZIndex = -2
Dropshadow26.Parent = BG27

local Frame27 = Instance.new("Frame")
Frame27.Name = "Frame"
Frame27.Size = UDim2.new(0.95775,0,0.95775,0)
Frame27.Position = UDim2.new(0.521125,0,0.478875,0)
Frame27.AnchorPoint = Vector2.new(0.5,0.5)
Frame27.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame27.BorderColor3 = Color3.fromRGB(0,0,0)
Frame27.BorderSizePixel = 0
Frame27.ZIndex = -1
Frame27.Parent = BG27

local UIStroke263 = Instance.new("UIStroke")
UIStroke263.Name = "UIStroke"
UIStroke263.Thickness = 4
UIStroke263.Parent = Frame27

local Item27 = Instance.new("ImageLabel")
Item27.Name = "Item2"
Item27.Size = UDim2.new(0.902423,0,0.651761,0)
Item27.Position = UDim2.new(0.521125,0,0.463834,0)
Item27.AnchorPoint = Vector2.new(0.5,0.5)
Item27.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item27.BackgroundTransparency = 1
Item27.BorderSizePixel = 0
Item27.Image = "rbxassetid://94959635148921"
Item27.ImageRectOffset = Vector2.new(25,25)
Item27.ImageRectSize = Vector2.new(250,250)
Item27.ScaleType = Enum.ScaleType.Crop
Item27.Visible = false
Item27.ZIndex = -1
Item27.Parent = Template2

local Unavailable82 = Instance.new("TextLabel")
Unavailable82.Name = "Unavailable"
Unavailable82.Size = UDim2.new(0.7,0,0.7,0)
Unavailable82.Position = UDim2.new(0.5,0,0.5,0)
Unavailable82.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable82.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable82.BackgroundTransparency = 1
Unavailable82.BorderSizePixel = 0
Unavailable82.Text = "Unavailable"
Unavailable82.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable82.TextSize = 14
Unavailable82.Font = Enum.Font.FredokaOne
Unavailable82.TextWrapped = true
Unavailable82.TextScaled = true
Unavailable82.Visible = false
Unavailable82.Parent = Item27

local UIStroke264 = Instance.new("UIStroke")
UIStroke264.Name = "UIStroke"
UIStroke264.Thickness = 2
UIStroke264.Parent = Unavailable82

local Pixel10 = Instance.new("ImageLabel")
Pixel10.Name = "Pixel"
Pixel10.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel10.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel10.AnchorPoint = Vector2.new(0.5,0.5)
Pixel10.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel10.BorderSizePixel = 0
Pixel10.Image = "rbxassetid://94959635148921"
Pixel10.ImageRectOffset = Vector2.new(55,100)
Pixel10.ImageRectSize = Vector2.new(30,30)
Pixel10.ScaleType = Enum.ScaleType.Crop
Pixel10.Visible = false
Pixel10.ZIndex = 5
Pixel10.Parent = Template2

local Unavailable83 = Instance.new("TextLabel")
Unavailable83.Name = "Unavailable"
Unavailable83.Size = UDim2.new(0.7,0,0.7,0)
Unavailable83.Position = UDim2.new(0.5,0,0.5,0)
Unavailable83.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable83.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable83.BackgroundTransparency = 1
Unavailable83.BorderSizePixel = 0
Unavailable83.Text = "Unavailable"
Unavailable83.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable83.TextSize = 14
Unavailable83.Font = Enum.Font.FredokaOne
Unavailable83.TextWrapped = true
Unavailable83.TextScaled = true
Unavailable83.Visible = false
Unavailable83.Parent = Pixel10

local UIStroke265 = Instance.new("UIStroke")
UIStroke265.Name = "UIStroke"
UIStroke265.Thickness = 2
UIStroke265.Parent = Unavailable83

local Purchase27 = Instance.new("ImageButton")
Purchase27.Name = "Purchase"
Purchase27.Size = UDim2.new(0.902423,0,0.116761,0)
Purchase27.Position = UDim2.new(0.521125,0,0.866764,0)
Purchase27.AnchorPoint = Vector2.new(0.5,0.5)
Purchase27.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase27.BorderSizePixel = 0
Purchase27.ScaleType = Enum.ScaleType.Fit
Purchase27.AutoButtonColor = false
Purchase27.Active = false
Purchase27.Parent = Template2

local Price27 = Instance.new("TextLabel")
Price27.Name = "Price"
Price27.Size = UDim2.new(0.78479,0,0.702682,0)
Price27.Position = UDim2.new(0.100663,0,0.0990811,0)
Price27.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price27.BackgroundTransparency = 1
Price27.BorderSizePixel = 0
Price27.Text = "$19.99"
Price27.TextColor3 = Color3.fromRGB(255,255,255)
Price27.TextSize = 14
Price27.Font = Enum.Font.Arcade
Price27.TextWrapped = true
Price27.TextScaled = true
Price27.RichText = true
Price27.AutomaticSize = Enum.AutomaticSize.X
Price27.Parent = Purchase27

local UIGradient103 = Instance.new("UIGradient")
UIGradient103.Name = "UIGradient"
UIGradient103.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient103.Rotation = -90
UIGradient103.Offset = Vector2.new(0,0)
UIGradient103.Parent = Price27

local UIStroke266 = Instance.new("UIStroke")
UIStroke266.Name = "UIStroke"
UIStroke266.Thickness = 2
UIStroke266.Parent = Price27

local UICorner28 = Instance.new("UICorner")
UICorner28.Name = "UICorner"
UICorner28.CornerRadius = UDim.new(1,0)
UICorner28.Parent = Purchase27

local UIGradient104 = Instance.new("UIGradient")
UIGradient104.Name = "UIGradient"
UIGradient104.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient104.Rotation = -90
UIGradient104.Offset = Vector2.new(0,0)
UIGradient104.Parent = Purchase27

local UIStroke267 = Instance.new("UIStroke")
UIStroke267.Name = "UIStroke"
UIStroke267.Thickness = 2.5
UIStroke267.Parent = Purchase27

local Title27 = Instance.new("TextLabel")
Title27.Name = "Title"
Title27.Size = UDim2.new(0.854506,0,0.108842,0)
Title27.Position = UDim2.new(0.521125,0,0.0306124,0)
Title27.AnchorPoint = Vector2.new(0.5,0)
Title27.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title27.BackgroundTransparency = 1
Title27.BorderSizePixel = 0
Title27.Text = "COM-643100702041833957"
Title27.TextColor3 = Color3.fromRGB(0,0,0)
Title27.TextSize = 29
Title27.Font = Enum.Font.Arcade
Title27.TextXAlignment = Enum.TextXAlignment.Left
Title27.TextYAlignment = Enum.TextYAlignment.Top
Title27.TextWrapped = true
Title27.TextScaled = true
Title27.RichText = true
Title27.AutomaticSize = Enum.AutomaticSize.X
Title27.Parent = Template2

local UITextSizeConstraint13 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint13.Name = "UITextSizeConstraint"
UITextSizeConstraint13.MaxTextSize = 29
UITextSizeConstraint13.Parent = Title27

local UIAspectRatioConstraint14 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint14.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint14.AspectRatio = 0.76
UIAspectRatioConstraint14.Parent = Template2

local Template3 = Instance.new("Frame")
Template3.Name = "Template"
Template3.Size = UDim2.new(0.31602,0,0.944677,0)
Template3.Position = UDim2.new(0.336087,0,-0.0531514,0)
Template3.BackgroundColor3 = Color3.fromRGB(255,225,0)
Template3.BackgroundTransparency = 1
Template3.BorderColor3 = Color3.fromRGB(0,0,0)
Template3.BorderSizePixel = 0
Template3.Parent = Row

local BG28 = Instance.new("Frame")
BG28.Name = "BG"
BG28.Size = UDim2.new(1,0,1,0)
BG28.Position = UDim2.new(0.5,0,0.5,0)
BG28.AnchorPoint = Vector2.new(0.5,0.5)
BG28.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG28.BackgroundTransparency = 1
BG28.BorderColor3 = Color3.fromRGB(0,0,0)
BG28.BorderSizePixel = 0
BG28.ZIndex = -1
BG28.Parent = Template3

local Dropshadow27 = Instance.new("Frame")
Dropshadow27.Name = "Dropshadow"
Dropshadow27.Size = UDim2.new(0.940524,0,0.940524,0)
Dropshadow27.Position = UDim2.new(0,0,1,0)
Dropshadow27.AnchorPoint = Vector2.new(0,1)
Dropshadow27.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow27.BackgroundTransparency = 0.5
Dropshadow27.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow27.BorderSizePixel = 0
Dropshadow27.ZIndex = -2
Dropshadow27.Parent = BG28

local Frame28 = Instance.new("Frame")
Frame28.Name = "Frame"
Frame28.Size = UDim2.new(0.95775,0,0.95775,0)
Frame28.Position = UDim2.new(0.521125,0,0.478875,0)
Frame28.AnchorPoint = Vector2.new(0.5,0.5)
Frame28.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame28.BorderColor3 = Color3.fromRGB(0,0,0)
Frame28.BorderSizePixel = 0
Frame28.ZIndex = -1
Frame28.Parent = BG28

local UIStroke268 = Instance.new("UIStroke")
UIStroke268.Name = "UIStroke"
UIStroke268.Thickness = 4
UIStroke268.Parent = Frame28

local Item28 = Instance.new("ImageLabel")
Item28.Name = "Item2"
Item28.Size = UDim2.new(0.902423,0,0.651761,0)
Item28.Position = UDim2.new(0.521125,0,0.463834,0)
Item28.AnchorPoint = Vector2.new(0.5,0.5)
Item28.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item28.BackgroundTransparency = 1
Item28.BorderSizePixel = 0
Item28.Image = "rbxassetid://138096832706650"
Item28.ImageRectOffset = Vector2.new(25,25)
Item28.ImageRectSize = Vector2.new(700,700)
Item28.ScaleType = Enum.ScaleType.Fit
Item28.Visible = false
Item28.ZIndex = -1
Item28.Parent = Template3

local Unavailable84 = Instance.new("TextLabel")
Unavailable84.Name = "Unavailable"
Unavailable84.Size = UDim2.new(0.7,0,0.7,0)
Unavailable84.Position = UDim2.new(0.5,0,0.5,0)
Unavailable84.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable84.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable84.BackgroundTransparency = 1
Unavailable84.BorderSizePixel = 0
Unavailable84.Text = "Unavailable"
Unavailable84.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable84.TextSize = 14
Unavailable84.Font = Enum.Font.FredokaOne
Unavailable84.TextWrapped = true
Unavailable84.TextScaled = true
Unavailable84.Visible = false
Unavailable84.Parent = Item28

local UIStroke269 = Instance.new("UIStroke")
UIStroke269.Name = "UIStroke"
UIStroke269.Thickness = 2
UIStroke269.Parent = Unavailable84

local Pixel11 = Instance.new("ImageLabel")
Pixel11.Name = "Pixel"
Pixel11.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel11.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel11.AnchorPoint = Vector2.new(0.5,0.5)
Pixel11.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel11.BorderSizePixel = 0
Pixel11.Image = "rbxassetid://94959635148921"
Pixel11.ImageRectOffset = Vector2.new(55,100)
Pixel11.ImageRectSize = Vector2.new(30,30)
Pixel11.ScaleType = Enum.ScaleType.Crop
Pixel11.Visible = false
Pixel11.ZIndex = 5
Pixel11.Parent = Template3

local Unavailable85 = Instance.new("TextLabel")
Unavailable85.Name = "Unavailable"
Unavailable85.Size = UDim2.new(0.7,0,0.7,0)
Unavailable85.Position = UDim2.new(0.5,0,0.5,0)
Unavailable85.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable85.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable85.BackgroundTransparency = 1
Unavailable85.BorderSizePixel = 0
Unavailable85.Text = "Unavailable"
Unavailable85.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable85.TextSize = 14
Unavailable85.Font = Enum.Font.FredokaOne
Unavailable85.TextWrapped = true
Unavailable85.TextScaled = true
Unavailable85.Visible = false
Unavailable85.Parent = Pixel11

local UIStroke270 = Instance.new("UIStroke")
UIStroke270.Name = "UIStroke"
UIStroke270.Thickness = 2
UIStroke270.Parent = Unavailable85

local Purchase28 = Instance.new("ImageButton")
Purchase28.Name = "Purchase"
Purchase28.Size = UDim2.new(0.902423,0,0.116761,0)
Purchase28.Position = UDim2.new(0.521125,0,0.866764,0)
Purchase28.AnchorPoint = Vector2.new(0.5,0.5)
Purchase28.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase28.BorderSizePixel = 0
Purchase28.ScaleType = Enum.ScaleType.Fit
Purchase28.AutoButtonColor = false
Purchase28.Active = false
Purchase28.Parent = Template3

local Price28 = Instance.new("TextLabel")
Price28.Name = "Price"
Price28.Size = UDim2.new(0.78479,0,0.702682,0)
Price28.Position = UDim2.new(0.100663,0,0.0990811,0)
Price28.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price28.BackgroundTransparency = 1
Price28.BorderSizePixel = 0
Price28.Text = "$19.99"
Price28.TextColor3 = Color3.fromRGB(255,255,255)
Price28.TextSize = 14
Price28.Font = Enum.Font.Arcade
Price28.TextWrapped = true
Price28.TextScaled = true
Price28.RichText = true
Price28.AutomaticSize = Enum.AutomaticSize.X
Price28.Parent = Purchase28

local UIGradient105 = Instance.new("UIGradient")
UIGradient105.Name = "UIGradient"
UIGradient105.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient105.Rotation = -90
UIGradient105.Offset = Vector2.new(0,0)
UIGradient105.Parent = Price28

local UIStroke271 = Instance.new("UIStroke")
UIStroke271.Name = "UIStroke"
UIStroke271.Thickness = 2
UIStroke271.Parent = Price28

local UICorner29 = Instance.new("UICorner")
UICorner29.Name = "UICorner"
UICorner29.CornerRadius = UDim.new(1,0)
UICorner29.Parent = Purchase28

local UIGradient106 = Instance.new("UIGradient")
UIGradient106.Name = "UIGradient"
UIGradient106.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient106.Rotation = -90
UIGradient106.Offset = Vector2.new(0,0)
UIGradient106.Parent = Purchase28

local UIStroke272 = Instance.new("UIStroke")
UIStroke272.Name = "UIStroke"
UIStroke272.Thickness = 2.5
UIStroke272.Parent = Purchase28

local Title28 = Instance.new("TextLabel")
Title28.Name = "Title"
Title28.Size = UDim2.new(0.854506,0,0.108842,0)
Title28.Position = UDim2.new(0.521125,0,0.0306124,0)
Title28.AnchorPoint = Vector2.new(0.5,0)
Title28.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title28.BackgroundTransparency = 1
Title28.BorderSizePixel = 0
Title28.Text = "COM-9165422475759190499"
Title28.TextColor3 = Color3.fromRGB(0,0,0)
Title28.TextSize = 29
Title28.Font = Enum.Font.Arcade
Title28.TextXAlignment = Enum.TextXAlignment.Left
Title28.TextYAlignment = Enum.TextYAlignment.Top
Title28.TextWrapped = true
Title28.TextScaled = true
Title28.RichText = true
Title28.AutomaticSize = Enum.AutomaticSize.X
Title28.Parent = Template3

local UITextSizeConstraint14 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint14.Name = "UITextSizeConstraint"
UITextSizeConstraint14.MaxTextSize = 29
UITextSizeConstraint14.Parent = Title28

local UIAspectRatioConstraint15 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint15.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint15.AspectRatio = 0.76
UIAspectRatioConstraint15.Parent = Template3

local UIListLayout16 = Instance.new("UIListLayout")
UIListLayout16.Name = "UIListLayout"
UIListLayout16.Padding = UDim.new(0.019,0)
UIListLayout16.FillDirection = Enum.FillDirection.Horizontal
UIListLayout16.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout16.Wraps = false
UIListLayout16.Parent = Row

local Special15 = Instance.new("Frame")
Special15.Name = "Special"
Special15.Size = UDim2.new(0.728177,0,0.493216,0)
Special15.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
Special15.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special15.BackgroundTransparency = 1
Special15.BorderColor3 = Color3.fromRGB(0,0,0)
Special15.BorderSizePixel = 0
Special15.LayoutOrder = -4
Special15.Parent = ScrollingFrame

local COM_4613190819073753561 = Instance.new("Frame")
COM_4613190819073753561.Name = "COM-4613190819073753561"
COM_4613190819073753561.Size = UDim2.new(0.894198,0,0.931112,0)
COM_4613190819073753561.Position = UDim2.new(5.4771e-08,0,0,0)
COM_4613190819073753561.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_4613190819073753561.BackgroundTransparency = 1
COM_4613190819073753561.BorderColor3 = Color3.fromRGB(0,0,0)
COM_4613190819073753561.BorderSizePixel = 0
COM_4613190819073753561.ZIndex = 2
COM_4613190819073753561.Parent = Special15

local BG29 = Instance.new("Frame")
BG29.Name = "BG"
BG29.Size = UDim2.new(1,0,1,0)
BG29.Position = UDim2.new(0.5,0,0.5,0)
BG29.AnchorPoint = Vector2.new(0.5,0.5)
BG29.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG29.BackgroundTransparency = 1
BG29.BorderColor3 = Color3.fromRGB(0,0,0)
BG29.BorderSizePixel = 0
BG29.ZIndex = -1
BG29.Parent = COM_4613190819073753561

local Dropshadow28 = Instance.new("Frame")
Dropshadow28.Name = "Dropshadow"
Dropshadow28.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow28.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow28.AnchorPoint = Vector2.new(0,1)
Dropshadow28.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow28.BackgroundTransparency = 0.5
Dropshadow28.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow28.BorderSizePixel = 0
Dropshadow28.ZIndex = -2
Dropshadow28.Parent = BG29

local UIStroke273 = Instance.new("UIStroke")
UIStroke273.Name = "UIStroke"
UIStroke273.Thickness = 2.79551
UIStroke273.Transparency = 1
UIStroke273.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke273.Parent = Dropshadow28

local Frame29 = Instance.new("Frame")
Frame29.Name = "Frame"
Frame29.Size = UDim2.new(0.984612,0,0.95775,0)
Frame29.Position = UDim2.new(0.506631,0,0.478875,0)
Frame29.AnchorPoint = Vector2.new(0.5,0.5)
Frame29.BackgroundColor3 = Color3.fromRGB(216,175,177)
Frame29.BorderColor3 = Color3.fromRGB(0,0,0)
Frame29.BorderSizePixel = 0
Frame29.ZIndex = -1
Frame29.Parent = BG29

local Pattern25 = Instance.new("ImageLabel")
Pattern25.Name = "Pattern"
Pattern25.Size = UDim2.new(1,0,1,0)
Pattern25.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern25.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern25.BackgroundTransparency = 1
Pattern25.BorderSizePixel = 0
Pattern25.Image = "rbxassetid://93965194514144"
Pattern25.ZIndex = -1
Pattern25.Parent = Frame29

local UIGradient107 = Instance.new("UIGradient")
UIGradient107.Name = "UIGradient"
UIGradient107.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
UIGradient107.Rotation = 90
UIGradient107.Offset = Vector2.new(0,0)
UIGradient107.Parent = Pattern25

local UIStroke274 = Instance.new("UIStroke")
UIStroke274.Name = "UIStroke"
UIStroke274.Thickness = 1.86368
UIStroke274.Parent = Pattern25

local UIGradient108 = Instance.new("UIGradient")
UIGradient108.Name = "UIGradient"
UIGradient108.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient108.Rotation = 90
UIGradient108.Offset = Vector2.new(0,0)
UIGradient108.Parent = Frame29

local UIStroke275 = Instance.new("UIStroke")
UIStroke275.Name = "UIStroke"
UIStroke275.Thickness = 1.86368
UIStroke275.Parent = Frame29

local Highlight25 = Instance.new("Frame")
Highlight25.Name = "Highlight"
Highlight25.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight25.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight25.AnchorPoint = Vector2.new(0.5,0.5)
Highlight25.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight25.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight25.BorderSizePixel = 0
Highlight25.Visible = false
Highlight25.ZIndex = -2
Highlight25.Parent = BG29

local UIStroke276 = Instance.new("UIStroke")
UIStroke276.Name = "UIStroke"
UIStroke276.Color = Color3.fromRGB(255,242,0)
UIStroke276.Thickness = 2.79551
UIStroke276.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke276.Parent = Highlight25

local DisplayTitle20 = Instance.new("TextLabel")
DisplayTitle20.Name = "DisplayTitle"
DisplayTitle20.Size = UDim2.new(0.428097,0,0.415185,0)
DisplayTitle20.Position = UDim2.new(0.767443,0,0.212655,0)
DisplayTitle20.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle20.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle20.BackgroundTransparency = 1
DisplayTitle20.BorderSizePixel = 0
DisplayTitle20.Text = "Twisted Dandy Deluxe 14\" Plush (Pre-Order)"
DisplayTitle20.TextColor3 = Color3.fromRGB(2,40,0)
DisplayTitle20.TextSize = 29
DisplayTitle20.Font = Enum.Font.Arcade
DisplayTitle20.TextWrapped = true
DisplayTitle20.TextScaled = true
DisplayTitle20.RichText = true
DisplayTitle20.Parent = COM_4613190819073753561

local UIGradient109 = Instance.new("UIGradient")
UIGradient109.Name = "UIGradient"
UIGradient109.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient109.Rotation = -90
UIGradient109.Offset = Vector2.new(0,0)
UIGradient109.Parent = DisplayTitle20

local UIStroke277 = Instance.new("UIStroke")
UIStroke277.Name = "UIStroke"
UIStroke277.Color = Color3.fromRGB(255,255,255)
UIStroke277.Thickness = 0.931838
UIStroke277.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke277.Parent = DisplayTitle20

local Item29 = Instance.new("ImageLabel")
Item29.Name = "Item"
Item29.Size = UDim2.new(0.913665,0,0.651761,0)
Item29.Position = UDim2.new(0.514096,0,0.463834,0)
Item29.AnchorPoint = Vector2.new(0.5,0.5)
Item29.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item29.BackgroundTransparency = 1
Item29.BorderSizePixel = 0
Item29.Image = "rbxassetid://94959635148921"
Item29.ImageRectOffset = Vector2.new(15,15)
Item29.ImageRectSize = Vector2.new(270,270)
Item29.ScaleType = Enum.ScaleType.Fit
Item29.Visible = false
Item29.ZIndex = -1
Item29.Parent = COM_4613190819073753561

local Unavailable86 = Instance.new("TextLabel")
Unavailable86.Name = "Unavailable"
Unavailable86.Size = UDim2.new(0.7,0,0.7,0)
Unavailable86.Position = UDim2.new(0.5,0,0.5,0)
Unavailable86.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable86.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable86.BackgroundTransparency = 1
Unavailable86.BorderSizePixel = 0
Unavailable86.Text = "Unavailable"
Unavailable86.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable86.TextSize = 14
Unavailable86.Font = Enum.Font.FredokaOne
Unavailable86.TextWrapped = true
Unavailable86.TextScaled = true
Unavailable86.Visible = false
Unavailable86.Parent = Item29

local UIStroke278 = Instance.new("UIStroke")
UIStroke278.Name = "UIStroke"
UIStroke278.Thickness = 2
UIStroke278.Parent = Unavailable86

local New14 = Instance.new("ImageLabel")
New14.Name = "New"
New14.Size = UDim2.new(0.322123,0,0.355513,0)
New14.Position = UDim2.new(0.94212,0,0.0839209,0)
New14.AnchorPoint = Vector2.new(0.5,0.5)
New14.BackgroundColor3 = Color3.fromRGB(255,255,255)
New14.BackgroundTransparency = 1
New14.BorderSizePixel = 0
New14.Image = "rbxassetid://96728750855907"
New14.ScaleType = Enum.ScaleType.Fit
New14.Visible = false
New14.ZIndex = -1
New14.Parent = COM_4613190819073753561

local UIScale41 = Instance.new("UIScale")
UIScale41.Name = "UIScale"
UIScale41.Parent = New14

local Purchase29 = Instance.new("ImageButton")
Purchase29.Name = "Purchase"
Purchase29.Size = UDim2.new(0.436835,0,0.172928,0)
Purchase29.Position = UDim2.new(0.752098,0,0.833662,0)
Purchase29.AnchorPoint = Vector2.new(0.5,0.5)
Purchase29.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase29.BorderSizePixel = 0
Purchase29.ScaleType = Enum.ScaleType.Fit
Purchase29.AutoButtonColor = false
Purchase29.ZIndex = 5
Purchase29.Parent = COM_4613190819073753561

local Price29 = Instance.new("TextLabel")
Price29.Name = "Price"
Price29.Size = UDim2.new(0.78479,0,0.702682,0)
Price29.Position = UDim2.new(0.100663,0,0.0990811,0)
Price29.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price29.BackgroundTransparency = 1
Price29.BorderSizePixel = 0
Price29.Text = "$19.99"
Price29.TextColor3 = Color3.fromRGB(255,255,255)
Price29.TextSize = 14
Price29.Font = Enum.Font.Arcade
Price29.TextWrapped = true
Price29.TextScaled = true
Price29.RichText = true
Price29.AutomaticSize = Enum.AutomaticSize.X
Price29.Parent = Purchase29

local UIGradient110 = Instance.new("UIGradient")
UIGradient110.Name = "UIGradient"
UIGradient110.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient110.Rotation = -90
UIGradient110.Offset = Vector2.new(0,0)
UIGradient110.Parent = Price29

local UIStroke279 = Instance.new("UIStroke")
UIStroke279.Name = "UIStroke"
UIStroke279.Thickness = 0.931838
UIStroke279.Parent = Price29

local UICorner30 = Instance.new("UICorner")
UICorner30.Name = "UICorner"
UICorner30.CornerRadius = UDim.new(1,0)
UICorner30.Parent = Purchase29

local UIGradient111 = Instance.new("UIGradient")
UIGradient111.Name = "UIGradient"
UIGradient111.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient111.Rotation = -90
UIGradient111.Offset = Vector2.new(0,0)
UIGradient111.Parent = Purchase29

local UIScale42 = Instance.new("UIScale")
UIScale42.Name = "UIScale"
UIScale42.Parent = Purchase29

local UIStroke280 = Instance.new("UIStroke")
UIStroke280.Name = "UIStroke"
UIStroke280.Thickness = 1.1648
UIStroke280.Parent = Purchase29

local Thumbnail47 = Instance.new("ImageLabel")
Thumbnail47.Name = "Thumbnail"
Thumbnail47.Size = UDim2.new(0.298543,0,0.778322,0)
Thumbnail47.Position = UDim2.new(0.134921,0,0.239257,0)
Thumbnail47.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail47.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail47.BackgroundTransparency = 1
Thumbnail47.BorderSizePixel = 0
Thumbnail47.Image = "rbxassetid://124118954587015"
Thumbnail47.ScaleType = Enum.ScaleType.Fit
Thumbnail47.ZIndex = 2
Thumbnail47.Parent = COM_4613190819073753561

local Unavailable87 = Instance.new("TextLabel")
Unavailable87.Name = "Unavailable"
Unavailable87.Size = UDim2.new(0.7,0,0.7,0)
Unavailable87.Position = UDim2.new(0.5,0,0.5,0)
Unavailable87.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable87.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable87.BackgroundTransparency = 1
Unavailable87.BorderSizePixel = 0
Unavailable87.Text = "Unavailable"
Unavailable87.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable87.TextSize = 14
Unavailable87.Font = Enum.Font.FredokaOne
Unavailable87.TextWrapped = true
Unavailable87.TextScaled = true
Unavailable87.Visible = false
Unavailable87.Parent = Thumbnail47

local UIStroke281 = Instance.new("UIStroke")
UIStroke281.Name = "UIStroke"
UIStroke281.Thickness = 2
UIStroke281.Parent = Unavailable87

local Thumbnail48 = Instance.new("ImageLabel")
Thumbnail48.Name = "Thumbnail"
Thumbnail48.Size = UDim2.new(0.48234,0,1.2575,0)
Thumbnail48.Position = UDim2.new(0.381404,0,0.450994,0)
Thumbnail48.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail48.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail48.BackgroundTransparency = 1
Thumbnail48.BorderSizePixel = 0
Thumbnail48.Image = "rbxassetid://106657924883527"
Thumbnail48.ScaleType = Enum.ScaleType.Fit
Thumbnail48.ZIndex = 4
Thumbnail48.Parent = COM_4613190819073753561

local Unavailable88 = Instance.new("TextLabel")
Unavailable88.Name = "Unavailable"
Unavailable88.Size = UDim2.new(0.7,0,0.7,0)
Unavailable88.Position = UDim2.new(0.5,0,0.5,0)
Unavailable88.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable88.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable88.BackgroundTransparency = 1
Unavailable88.BorderSizePixel = 0
Unavailable88.Text = "Unavailable"
Unavailable88.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable88.TextSize = 14
Unavailable88.Font = Enum.Font.FredokaOne
Unavailable88.TextWrapped = true
Unavailable88.TextScaled = true
Unavailable88.Visible = false
Unavailable88.Parent = Thumbnail48

local UIStroke282 = Instance.new("UIStroke")
UIStroke282.Name = "UIStroke"
UIStroke282.Thickness = 2
UIStroke282.Parent = Unavailable88

local Title29 = Instance.new("TextLabel")
Title29.Name = "Title"
Title29.Size = UDim2.new(0.566559,0,0.435422,0)
Title29.Position = UDim2.new(0.65544,0,0.15042,0)
Title29.AnchorPoint = Vector2.new(0.5,0)
Title29.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title29.BackgroundTransparency = 1
Title29.BorderSizePixel = 0
Title29.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title29.TextColor3 = Color3.fromRGB(0,13,76)
Title29.TextSize = 29
Title29.Font = Enum.Font.Arcade
Title29.TextWrapped = true
Title29.TextScaled = true
Title29.RichText = true
Title29.Visible = false
Title29.AutomaticSize = Enum.AutomaticSize.X
Title29.Parent = COM_4613190819073753561

local UIGradient112 = Instance.new("UIGradient")
UIGradient112.Name = "UIGradient"
UIGradient112.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient112.Rotation = -90
UIGradient112.Offset = Vector2.new(0,0)
UIGradient112.Parent = Title29

local UIStroke283 = Instance.new("UIStroke")
UIStroke283.Name = "UIStroke"
UIStroke283.Color = Color3.fromRGB(255,255,255)
UIStroke283.Thickness = 2
UIStroke283.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke283.Parent = Title29

local COM_8259980617337012763 = Instance.new("Frame")
COM_8259980617337012763.Name = "COM-8259980617337012763"
COM_8259980617337012763.Size = UDim2.new(0.442523,0,0.944677,0)
COM_8259980617337012763.Position = UDim2.new(0.913307,0,0,0)
COM_8259980617337012763.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_8259980617337012763.BackgroundTransparency = 1
COM_8259980617337012763.BorderColor3 = Color3.fromRGB(0,0,0)
COM_8259980617337012763.BorderSizePixel = 0
COM_8259980617337012763.Parent = Special15

local BG30 = Instance.new("Frame")
BG30.Name = "BG"
BG30.Size = UDim2.new(1,0,1,0)
BG30.Position = UDim2.new(0.5,0,0.5,0)
BG30.AnchorPoint = Vector2.new(0.5,0.5)
BG30.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG30.BackgroundTransparency = 1
BG30.BorderColor3 = Color3.fromRGB(0,0,0)
BG30.BorderSizePixel = 0
BG30.ZIndex = -1
BG30.Parent = COM_8259980617337012763

local Dropshadow29 = Instance.new("Frame")
Dropshadow29.Name = "Dropshadow"
Dropshadow29.Size = UDim2.new(0.947997,0,0.95376,0)
Dropshadow29.Position = UDim2.new(-0.00747363,0,1.01324,0)
Dropshadow29.AnchorPoint = Vector2.new(0,1)
Dropshadow29.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow29.BackgroundTransparency = 0.5
Dropshadow29.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow29.BorderSizePixel = 0
Dropshadow29.ZIndex = -2
Dropshadow29.Parent = BG30

local UIStroke284 = Instance.new("UIStroke")
UIStroke284.Name = "UIStroke"
UIStroke284.Thickness = 2.79551
UIStroke284.Transparency = 1
UIStroke284.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke284.Parent = Dropshadow29

local Frame30 = Instance.new("Frame")
Frame30.Name = "Frame"
Frame30.Size = UDim2.new(0.95775,0,0.95775,0)
Frame30.Position = UDim2.new(0.521125,0,0.478875,0)
Frame30.AnchorPoint = Vector2.new(0.5,0.5)
Frame30.BackgroundColor3 = Color3.fromRGB(216,175,177)
Frame30.BorderColor3 = Color3.fromRGB(0,0,0)
Frame30.BorderSizePixel = 0
Frame30.ZIndex = -1
Frame30.Parent = BG30

local Pattern26 = Instance.new("ImageLabel")
Pattern26.Name = "Pattern"
Pattern26.Size = UDim2.new(1,0,1,0)
Pattern26.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern26.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern26.BackgroundTransparency = 1
Pattern26.BorderSizePixel = 0
Pattern26.Image = "rbxassetid://135202983221007"
Pattern26.ScaleType = Enum.ScaleType.Crop
Pattern26.ZIndex = -1
Pattern26.Parent = Frame30

local UIGradient113 = Instance.new("UIGradient")
UIGradient113.Name = "UIGradient"
UIGradient113.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.521246,0),NumberSequenceKeypoint.new(1,0,0)})
UIGradient113.Rotation = 90
UIGradient113.Offset = Vector2.new(0,0)
UIGradient113.Parent = Pattern26

local UIStroke285 = Instance.new("UIStroke")
UIStroke285.Name = "UIStroke"
UIStroke285.Thickness = 1.86368
UIStroke285.Parent = Pattern26

local UIGradient114 = Instance.new("UIGradient")
UIGradient114.Name = "UIGradient"
UIGradient114.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient114.Rotation = 90
UIGradient114.Offset = Vector2.new(0,0)
UIGradient114.Parent = Frame30

local UIStroke286 = Instance.new("UIStroke")
UIStroke286.Name = "UIStroke"
UIStroke286.Thickness = 4
UIStroke286.Parent = Frame30

local Highlight26 = Instance.new("Frame")
Highlight26.Name = "Highlight"
Highlight26.Size = UDim2.new(0.954203,0,0.95775,0)
Highlight26.Position = UDim2.new(0.519351,0,0.478875,0)
Highlight26.AnchorPoint = Vector2.new(0.5,0.5)
Highlight26.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight26.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight26.BorderSizePixel = 0
Highlight26.Visible = false
Highlight26.ZIndex = -2
Highlight26.Parent = BG30

local UIStroke287 = Instance.new("UIStroke")
UIStroke287.Name = "UIStroke"
UIStroke287.Color = Color3.fromRGB(255,242,0)
UIStroke287.Thickness = 2.79551
UIStroke287.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke287.Parent = Highlight26

local Item30 = Instance.new("ImageLabel")
Item30.Name = "Item"
Item30.Size = UDim2.new(0.902423,0,0.651761,0)
Item30.Position = UDim2.new(0.521125,0,0.463834,0)
Item30.AnchorPoint = Vector2.new(0.5,0.5)
Item30.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item30.BackgroundTransparency = 1
Item30.BorderSizePixel = 0
Item30.Image = "rbxassetid://94959635148921"
Item30.ImageRectOffset = Vector2.new(25,25)
Item30.ImageRectSize = Vector2.new(250,250)
Item30.ScaleType = Enum.ScaleType.Crop
Item30.Visible = false
Item30.ZIndex = -1
Item30.Parent = COM_8259980617337012763

local Unavailable89 = Instance.new("TextLabel")
Unavailable89.Name = "Unavailable"
Unavailable89.Size = UDim2.new(0.7,0,0.7,0)
Unavailable89.Position = UDim2.new(0.5,0,0.5,0)
Unavailable89.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable89.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable89.BackgroundTransparency = 1
Unavailable89.BorderSizePixel = 0
Unavailable89.Text = "Unavailable"
Unavailable89.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable89.TextSize = 14
Unavailable89.Font = Enum.Font.FredokaOne
Unavailable89.TextWrapped = true
Unavailable89.TextScaled = true
Unavailable89.Visible = false
Unavailable89.Parent = Item30

local UIStroke288 = Instance.new("UIStroke")
UIStroke288.Name = "UIStroke"
UIStroke288.Thickness = 2
UIStroke288.Parent = Unavailable89

local Pixel12 = Instance.new("ImageLabel")
Pixel12.Name = "Pixel"
Pixel12.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel12.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel12.AnchorPoint = Vector2.new(0.5,0.5)
Pixel12.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel12.BorderSizePixel = 0
Pixel12.Image = "rbxassetid://94959635148921"
Pixel12.ImageRectOffset = Vector2.new(55,100)
Pixel12.ImageRectSize = Vector2.new(30,30)
Pixel12.ScaleType = Enum.ScaleType.Crop
Pixel12.Visible = false
Pixel12.ZIndex = 5
Pixel12.Parent = COM_8259980617337012763

local Unavailable90 = Instance.new("TextLabel")
Unavailable90.Name = "Unavailable"
Unavailable90.Size = UDim2.new(0.7,0,0.7,0)
Unavailable90.Position = UDim2.new(0.5,0,0.5,0)
Unavailable90.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable90.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable90.BackgroundTransparency = 1
Unavailable90.BorderSizePixel = 0
Unavailable90.Text = "Unavailable"
Unavailable90.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable90.TextSize = 14
Unavailable90.Font = Enum.Font.FredokaOne
Unavailable90.TextWrapped = true
Unavailable90.TextScaled = true
Unavailable90.Visible = false
Unavailable90.Parent = Pixel12

local UIStroke289 = Instance.new("UIStroke")
UIStroke289.Name = "UIStroke"
UIStroke289.Thickness = 2
UIStroke289.Parent = Unavailable90

local Purchase30 = Instance.new("ImageButton")
Purchase30.Name = "Purchase"
Purchase30.Size = UDim2.new(0.863319,0,0.170445,0)
Purchase30.Position = UDim2.new(0.514166,0,0.821691,0)
Purchase30.AnchorPoint = Vector2.new(0.5,0.5)
Purchase30.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase30.BorderSizePixel = 0
Purchase30.ScaleType = Enum.ScaleType.Fit
Purchase30.AutoButtonColor = false
Purchase30.ZIndex = 6
Purchase30.Parent = COM_8259980617337012763

local Price30 = Instance.new("TextLabel")
Price30.Name = "Price"
Price30.Size = UDim2.new(0.78479,0,0.702682,0)
Price30.Position = UDim2.new(0.100663,0,0.0990811,0)
Price30.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price30.BackgroundTransparency = 1
Price30.BorderSizePixel = 0
Price30.Text = "$19.99"
Price30.TextColor3 = Color3.fromRGB(255,255,255)
Price30.TextSize = 14
Price30.Font = Enum.Font.Arcade
Price30.TextWrapped = true
Price30.TextScaled = true
Price30.RichText = true
Price30.AutomaticSize = Enum.AutomaticSize.X
Price30.Parent = Purchase30

local UIGradient115 = Instance.new("UIGradient")
UIGradient115.Name = "UIGradient"
UIGradient115.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient115.Rotation = -90
UIGradient115.Offset = Vector2.new(0,0)
UIGradient115.Parent = Price30

local UIStroke290 = Instance.new("UIStroke")
UIStroke290.Name = "UIStroke"
UIStroke290.Thickness = 2
UIStroke290.Parent = Price30

local UICorner31 = Instance.new("UICorner")
UICorner31.Name = "UICorner"
UICorner31.CornerRadius = UDim.new(1,0)
UICorner31.Parent = Purchase30

local UIGradient116 = Instance.new("UIGradient")
UIGradient116.Name = "UIGradient"
UIGradient116.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient116.Rotation = -90
UIGradient116.Offset = Vector2.new(0,0)
UIGradient116.Parent = Purchase30

local UIScale43 = Instance.new("UIScale")
UIScale43.Name = "UIScale"
UIScale43.Parent = Purchase30

local UIStroke291 = Instance.new("UIStroke")
UIStroke291.Name = "UIStroke"
UIStroke291.Thickness = 2.5
UIStroke291.Parent = Purchase30

local Thumbnail49 = Instance.new("ImageLabel")
Thumbnail49.Name = "Thumbnail"
Thumbnail49.Size = UDim2.new(1.18949,0,0.857211,0)
Thumbnail49.Position = UDim2.new(0.511832,0,0.404893,0)
Thumbnail49.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail49.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail49.BackgroundTransparency = 1
Thumbnail49.BorderSizePixel = 0
Thumbnail49.Image = "rbxassetid://133996051314877"
Thumbnail49.ScaleType = Enum.ScaleType.Crop
Thumbnail49.ZIndex = -1
Thumbnail49.Parent = COM_8259980617337012763

local Unavailable91 = Instance.new("TextLabel")
Unavailable91.Name = "Unavailable"
Unavailable91.Size = UDim2.new(0.7,0,0.7,0)
Unavailable91.Position = UDim2.new(0.5,0,0.5,0)
Unavailable91.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable91.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable91.BackgroundTransparency = 1
Unavailable91.BorderSizePixel = 0
Unavailable91.Text = "Unavailable"
Unavailable91.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable91.TextSize = 14
Unavailable91.Font = Enum.Font.FredokaOne
Unavailable91.TextWrapped = true
Unavailable91.TextScaled = true
Unavailable91.Visible = false
Unavailable91.Parent = Thumbnail49

local UIStroke292 = Instance.new("UIStroke")
UIStroke292.Name = "UIStroke"
UIStroke292.Thickness = 2
UIStroke292.Parent = Unavailable91

local Title30 = Instance.new("TextLabel")
Title30.Name = "Title"
Title30.Size = UDim2.new(0.874784,0,0.149,0)
Title30.Position = UDim2.new(0.531264,0,0.0306123,0)
Title30.AnchorPoint = Vector2.new(0.5,0)
Title30.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title30.BackgroundTransparency = 1
Title30.BorderSizePixel = 0
Title30.Text = "Bobette 11” x 14” Poster"
Title30.TextColor3 = Color3.fromRGB(0,0,0)
Title30.TextSize = 29
Title30.Font = Enum.Font.Arcade
Title30.TextXAlignment = Enum.TextXAlignment.Left
Title30.TextYAlignment = Enum.TextYAlignment.Top
Title30.TextWrapped = true
Title30.TextScaled = true
Title30.RichText = true
Title30.Visible = false
Title30.AutomaticSize = Enum.AutomaticSize.X
Title30.Parent = COM_8259980617337012763

local UITextSizeConstraint15 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint15.Name = "UITextSizeConstraint"
UITextSizeConstraint15.MaxTextSize = 29
UITextSizeConstraint15.Parent = Title30

local UIListLayout17 = Instance.new("UIListLayout")
UIListLayout17.Name = "UIListLayout"
UIListLayout17.Padding = UDim.new(0.019,0)
UIListLayout17.FillDirection = Enum.FillDirection.Horizontal
UIListLayout17.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout17.Wraps = false
UIListLayout17.Parent = Special15

local Special16 = Instance.new("Frame")
Special16.Name = "Special"
Special16.Size = UDim2.new(1.10498,0,0.439953,0)
Special16.Position = UDim2.new(0,0,-0.143337,0)
Special16.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special16.BackgroundTransparency = 1
Special16.BorderColor3 = Color3.fromRGB(0,0,0)
Special16.BorderSizePixel = 0
Special16.LayoutOrder = -3
Special16.Parent = ScrollingFrame

local COM_2529898588259746275 = Instance.new("Frame")
COM_2529898588259746275.Name = "COM-2529898588259746275"
COM_2529898588259746275.Size = UDim2.new(0.894307,0,0.931111,0)
COM_2529898588259746275.Position = UDim2.new(-5.79236e-08,0,0,0)
COM_2529898588259746275.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_2529898588259746275.BackgroundTransparency = 1
COM_2529898588259746275.BorderColor3 = Color3.fromRGB(0,0,0)
COM_2529898588259746275.BorderSizePixel = 0
COM_2529898588259746275.Parent = Special16

local BG31 = Instance.new("Frame")
BG31.Name = "BG"
BG31.Size = UDim2.new(1,0,1,0)
BG31.Position = UDim2.new(0.5,0,0.5,0)
BG31.AnchorPoint = Vector2.new(0.5,0.5)
BG31.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG31.BackgroundTransparency = 1
BG31.BorderColor3 = Color3.fromRGB(0,0,0)
BG31.BorderSizePixel = 0
BG31.ZIndex = -1
BG31.Parent = COM_2529898588259746275

local Dropshadow30 = Instance.new("Frame")
Dropshadow30.Name = "Dropshadow"
Dropshadow30.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow30.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow30.AnchorPoint = Vector2.new(0,1)
Dropshadow30.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow30.BackgroundTransparency = 0.5
Dropshadow30.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow30.BorderSizePixel = 0
Dropshadow30.ZIndex = -2
Dropshadow30.Parent = BG31

local UIStroke293 = Instance.new("UIStroke")
UIStroke293.Name = "UIStroke"
UIStroke293.Thickness = 2.79551
UIStroke293.Transparency = 1
UIStroke293.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke293.Parent = Dropshadow30

local Frame31 = Instance.new("Frame")
Frame31.Name = "Frame"
Frame31.Size = UDim2.new(0.984612,0,0.95775,0)
Frame31.Position = UDim2.new(0.506631,0,0.478875,0)
Frame31.AnchorPoint = Vector2.new(0.5,0.5)
Frame31.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame31.BorderColor3 = Color3.fromRGB(0,0,0)
Frame31.BorderSizePixel = 0
Frame31.ZIndex = -1
Frame31.Parent = BG31

local Pattern27 = Instance.new("ImageLabel")
Pattern27.Name = "Pattern"
Pattern27.Size = UDim2.new(0.635249,0,1,0)
Pattern27.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern27.BackgroundTransparency = 1
Pattern27.BorderSizePixel = 0
Pattern27.Image = "rbxassetid://92127895583355"
Pattern27.ZIndex = -1
Pattern27.Parent = Frame31

local UIStroke294 = Instance.new("UIStroke")
UIStroke294.Name = "UIStroke"
UIStroke294.Thickness = 1.86368
UIStroke294.Parent = Pattern27

local UIStroke295 = Instance.new("UIStroke")
UIStroke295.Name = "UIStroke"
UIStroke295.Thickness = 1.86368
UIStroke295.Parent = Frame31

local Highlight27 = Instance.new("Frame")
Highlight27.Name = "Highlight"
Highlight27.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight27.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight27.AnchorPoint = Vector2.new(0.5,0.5)
Highlight27.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight27.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight27.BorderSizePixel = 0
Highlight27.Visible = false
Highlight27.ZIndex = -2
Highlight27.Parent = BG31

local UIStroke296 = Instance.new("UIStroke")
UIStroke296.Name = "UIStroke"
UIStroke296.Color = Color3.fromRGB(255,242,0)
UIStroke296.Thickness = 2.79551
UIStroke296.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke296.Parent = Highlight27

local CanvasGroup11 = Instance.new("CanvasGroup")
CanvasGroup11.Name = "CanvasGroup"
CanvasGroup11.Size = UDim2.new(1,0,1,0)
CanvasGroup11.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup11.BackgroundTransparency = 1
CanvasGroup11.Parent = COM_2529898588259746275

local Thumbnail50 = Instance.new("ImageLabel")
Thumbnail50.Name = "Thumbnail"
Thumbnail50.Size = UDim2.new(0.37992,0,0.941288,0)
Thumbnail50.Position = UDim2.new(0.11109,0,0.564367,0)
Thumbnail50.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail50.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail50.BackgroundTransparency = 1
Thumbnail50.BorderSizePixel = 0
Thumbnail50.Image = "rbxassetid://114298785049809"
Thumbnail50.ScaleType = Enum.ScaleType.Fit
Thumbnail50.ZIndex = 0
Thumbnail50.Rotation = -11
Thumbnail50.Parent = CanvasGroup11

local Unavailable92 = Instance.new("TextLabel")
Unavailable92.Name = "Unavailable"
Unavailable92.Size = UDim2.new(0.7,0,0.7,0)
Unavailable92.Position = UDim2.new(0.5,0,0.5,0)
Unavailable92.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable92.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable92.BackgroundTransparency = 1
Unavailable92.BorderSizePixel = 0
Unavailable92.Text = "Unavailable"
Unavailable92.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable92.TextSize = 14
Unavailable92.Font = Enum.Font.FredokaOne
Unavailable92.TextWrapped = true
Unavailable92.TextScaled = true
Unavailable92.Visible = false
Unavailable92.Parent = Thumbnail50

local UIStroke297 = Instance.new("UIStroke")
UIStroke297.Name = "UIStroke"
UIStroke297.Thickness = 2
UIStroke297.Parent = Unavailable92

local Thumbnail51 = Instance.new("ImageLabel")
Thumbnail51.Name = "Thumbnail"
Thumbnail51.Size = UDim2.new(0.37992,0,0.990478,0)
Thumbnail51.Position = UDim2.new(0.188846,0,0.445004,0)
Thumbnail51.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail51.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail51.BackgroundTransparency = 1
Thumbnail51.BorderSizePixel = 0
Thumbnail51.Image = "rbxassetid://88590750012874"
Thumbnail51.ScaleType = Enum.ScaleType.Fit
Thumbnail51.ZIndex = -1
Thumbnail51.Rotation = 16
Thumbnail51.Parent = CanvasGroup11

local Unavailable93 = Instance.new("TextLabel")
Unavailable93.Name = "Unavailable"
Unavailable93.Size = UDim2.new(0.7,0,0.7,0)
Unavailable93.Position = UDim2.new(0.5,0,0.5,0)
Unavailable93.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable93.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable93.BackgroundTransparency = 1
Unavailable93.BorderSizePixel = 0
Unavailable93.Text = "Unavailable"
Unavailable93.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable93.TextSize = 14
Unavailable93.Font = Enum.Font.FredokaOne
Unavailable93.TextWrapped = true
Unavailable93.TextScaled = true
Unavailable93.Visible = false
Unavailable93.Parent = Thumbnail51

local UIStroke298 = Instance.new("UIStroke")
UIStroke298.Name = "UIStroke"
UIStroke298.Thickness = 2
UIStroke298.Parent = Unavailable93

local Thumbnail52 = Instance.new("ImageLabel")
Thumbnail52.Name = "Thumbnail"
Thumbnail52.Size = UDim2.new(0.319652,0,0.913829,0)
Thumbnail52.Position = UDim2.new(0.34791,0,0.497652,0)
Thumbnail52.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail52.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail52.BackgroundTransparency = 1
Thumbnail52.BorderSizePixel = 0
Thumbnail52.Image = "rbxassetid://114298785049809"
Thumbnail52.ScaleType = Enum.ScaleType.Fit
Thumbnail52.ZIndex = 0
Thumbnail52.Rotation = 13
Thumbnail52.Parent = CanvasGroup11

local Unavailable94 = Instance.new("TextLabel")
Unavailable94.Name = "Unavailable"
Unavailable94.Size = UDim2.new(0.7,0,0.7,0)
Unavailable94.Position = UDim2.new(0.5,0,0.5,0)
Unavailable94.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable94.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable94.BackgroundTransparency = 1
Unavailable94.BorderSizePixel = 0
Unavailable94.Text = "Unavailable"
Unavailable94.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable94.TextSize = 14
Unavailable94.Font = Enum.Font.FredokaOne
Unavailable94.TextWrapped = true
Unavailable94.TextScaled = true
Unavailable94.Visible = false
Unavailable94.Parent = Thumbnail52

local UIStroke299 = Instance.new("UIStroke")
UIStroke299.Name = "UIStroke"
UIStroke299.Thickness = 2
UIStroke299.Parent = Unavailable94

local DisplayTitle21 = Instance.new("TextLabel")
DisplayTitle21.Name = "DisplayTitle"
DisplayTitle21.Size = UDim2.new(0.28831,0,0.367128,0)
DisplayTitle21.Position = UDim2.new(0.814632,0,0.191717,0)
DisplayTitle21.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle21.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle21.BackgroundTransparency = 1
DisplayTitle21.BorderSizePixel = 0
DisplayTitle21.Text = "Vee 14\" Deluxe Plush (Pre-Order)"
DisplayTitle21.TextColor3 = Color3.fromRGB(0,0,0)
DisplayTitle21.TextSize = 29
DisplayTitle21.Font = Enum.Font.Arcade
DisplayTitle21.TextWrapped = true
DisplayTitle21.TextScaled = true
DisplayTitle21.RichText = true
DisplayTitle21.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle21.Parent = COM_2529898588259746275

local UIAspectRatioConstraint16 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint16.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint16.AspectRatio = 2.66
UIAspectRatioConstraint16.Parent = DisplayTitle21

local UIGradient117 = Instance.new("UIGradient")
UIGradient117.Name = "UIGradient"
UIGradient117.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient117.Rotation = -90
UIGradient117.Offset = Vector2.new(0,0)
UIGradient117.Enabled = false
UIGradient117.Parent = DisplayTitle21

local UIStroke300 = Instance.new("UIStroke")
UIStroke300.Name = "UIStroke"
UIStroke300.Color = Color3.fromRGB(255,255,255)
UIStroke300.Thickness = 0.931838
UIStroke300.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke300.Parent = DisplayTitle21

local Item31 = Instance.new("ImageLabel")
Item31.Name = "Item"
Item31.Size = UDim2.new(0.913665,0,0.651761,0)
Item31.Position = UDim2.new(0.514096,0,0.463834,0)
Item31.AnchorPoint = Vector2.new(0.5,0.5)
Item31.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item31.BackgroundTransparency = 1
Item31.BorderSizePixel = 0
Item31.Image = "rbxassetid://94959635148921"
Item31.ImageRectOffset = Vector2.new(15,15)
Item31.ImageRectSize = Vector2.new(270,270)
Item31.ScaleType = Enum.ScaleType.Fit
Item31.Visible = false
Item31.ZIndex = -1
Item31.Parent = COM_2529898588259746275

local Unavailable95 = Instance.new("TextLabel")
Unavailable95.Name = "Unavailable"
Unavailable95.Size = UDim2.new(0.7,0,0.7,0)
Unavailable95.Position = UDim2.new(0.5,0,0.5,0)
Unavailable95.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable95.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable95.BackgroundTransparency = 1
Unavailable95.BorderSizePixel = 0
Unavailable95.Text = "Unavailable"
Unavailable95.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable95.TextSize = 14
Unavailable95.Font = Enum.Font.FredokaOne
Unavailable95.TextWrapped = true
Unavailable95.TextScaled = true
Unavailable95.Visible = false
Unavailable95.Parent = Item31

local UIStroke301 = Instance.new("UIStroke")
UIStroke301.Name = "UIStroke"
UIStroke301.Thickness = 2
UIStroke301.Parent = Unavailable95

local New15 = Instance.new("ImageLabel")
New15.Name = "New"
New15.Size = UDim2.new(0.322123,0,0.355513,0)
New15.Position = UDim2.new(0.944127,0,0.0328983,0)
New15.AnchorPoint = Vector2.new(0.5,0.5)
New15.BackgroundColor3 = Color3.fromRGB(255,255,255)
New15.BackgroundTransparency = 1
New15.BorderSizePixel = 0
New15.Image = "rbxassetid://96728750855907"
New15.ScaleType = Enum.ScaleType.Fit
New15.Visible = false
New15.ZIndex = -1
New15.Parent = COM_2529898588259746275

local UIScale44 = Instance.new("UIScale")
UIScale44.Name = "UIScale"
UIScale44.Parent = New15

local Purchase31 = Instance.new("ImageButton")
Purchase31.Name = "Purchase"
Purchase31.Size = UDim2.new(0.299855,0,0.201102,0)
Purchase31.Position = UDim2.new(0.814697,0,0.786462,0)
Purchase31.AnchorPoint = Vector2.new(0.5,0.5)
Purchase31.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase31.BorderSizePixel = 0
Purchase31.ScaleType = Enum.ScaleType.Fit
Purchase31.AutoButtonColor = false
Purchase31.Parent = COM_2529898588259746275

local Price31 = Instance.new("TextLabel")
Price31.Name = "Price"
Price31.Size = UDim2.new(0.78479,0,0.702682,0)
Price31.Position = UDim2.new(0.100663,0,0.0990811,0)
Price31.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price31.BackgroundTransparency = 1
Price31.BorderSizePixel = 0
Price31.Text = "$19.99"
Price31.TextColor3 = Color3.fromRGB(255,255,255)
Price31.TextSize = 14
Price31.Font = Enum.Font.Arcade
Price31.TextWrapped = true
Price31.TextScaled = true
Price31.RichText = true
Price31.AutomaticSize = Enum.AutomaticSize.X
Price31.Parent = Purchase31

local UIGradient118 = Instance.new("UIGradient")
UIGradient118.Name = "UIGradient"
UIGradient118.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient118.Rotation = -90
UIGradient118.Offset = Vector2.new(0,0)
UIGradient118.Parent = Price31

local UIStroke302 = Instance.new("UIStroke")
UIStroke302.Name = "UIStroke"
UIStroke302.Thickness = 0.931838
UIStroke302.Parent = Price31

local UICorner32 = Instance.new("UICorner")
UICorner32.Name = "UICorner"
UICorner32.CornerRadius = UDim.new(1,0)
UICorner32.Parent = Purchase31

local UIGradient119 = Instance.new("UIGradient")
UIGradient119.Name = "UIGradient"
UIGradient119.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient119.Rotation = -90
UIGradient119.Offset = Vector2.new(0,0)
UIGradient119.Parent = Purchase31

local UIScale45 = Instance.new("UIScale")
UIScale45.Name = "UIScale"
UIScale45.Parent = Purchase31

local UIStroke303 = Instance.new("UIStroke")
UIStroke303.Name = "UIStroke"
UIStroke303.Thickness = 1.1648
UIStroke303.Parent = Purchase31

local Thumbnail53 = Instance.new("ImageLabel")
Thumbnail53.Name = "Thumbnail"
Thumbnail53.Size = UDim2.new(0.48234,0,1.2575,0)
Thumbnail53.Position = UDim2.new(0.543731,0,0.435241,0)
Thumbnail53.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail53.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail53.BackgroundTransparency = 1
Thumbnail53.BorderSizePixel = 0
Thumbnail53.Image = "rbxassetid://113698030534354"
Thumbnail53.ScaleType = Enum.ScaleType.Fit
Thumbnail53.ZIndex = -1
Thumbnail53.Parent = COM_2529898588259746275

local Unavailable96 = Instance.new("TextLabel")
Unavailable96.Name = "Unavailable"
Unavailable96.Size = UDim2.new(0.7,0,0.7,0)
Unavailable96.Position = UDim2.new(0.5,0,0.5,0)
Unavailable96.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable96.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable96.BackgroundTransparency = 1
Unavailable96.BorderSizePixel = 0
Unavailable96.Text = "Unavailable"
Unavailable96.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable96.TextSize = 14
Unavailable96.Font = Enum.Font.FredokaOne
Unavailable96.TextWrapped = true
Unavailable96.TextScaled = true
Unavailable96.Visible = false
Unavailable96.Parent = Thumbnail53

local UIStroke304 = Instance.new("UIStroke")
UIStroke304.Name = "UIStroke"
UIStroke304.Thickness = 2
UIStroke304.Parent = Unavailable96

local Title31 = Instance.new("TextLabel")
Title31.Name = "Title"
Title31.Size = UDim2.new(0.566559,0,0.435422,0)
Title31.Position = UDim2.new(0.65544,0,0.15042,0)
Title31.AnchorPoint = Vector2.new(0.5,0)
Title31.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title31.BackgroundTransparency = 1
Title31.BorderSizePixel = 0
Title31.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title31.TextColor3 = Color3.fromRGB(0,13,76)
Title31.TextSize = 29
Title31.Font = Enum.Font.Arcade
Title31.TextWrapped = true
Title31.TextScaled = true
Title31.RichText = true
Title31.Visible = false
Title31.AutomaticSize = Enum.AutomaticSize.X
Title31.Parent = COM_2529898588259746275

local UIGradient120 = Instance.new("UIGradient")
UIGradient120.Name = "UIGradient"
UIGradient120.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient120.Rotation = -90
UIGradient120.Offset = Vector2.new(0,0)
UIGradient120.Parent = Title31

local UIStroke305 = Instance.new("UIStroke")
UIStroke305.Name = "UIStroke"
UIStroke305.Color = Color3.fromRGB(255,255,255)
UIStroke305.Thickness = 2
UIStroke305.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke305.Parent = Title31

local UIListLayout18 = Instance.new("UIListLayout")
UIListLayout18.Name = "UIListLayout"
UIListLayout18.Padding = UDim.new(0.019,0)
UIListLayout18.FillDirection = Enum.FillDirection.Horizontal
UIListLayout18.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout18.Wraps = false
UIListLayout18.Parent = Special16

local Special17 = Instance.new("Frame")
Special17.Name = "Special"
Special17.Size = UDim2.new(0.728177,0,0.493216,0)
Special17.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
Special17.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special17.BackgroundTransparency = 1
Special17.BorderColor3 = Color3.fromRGB(0,0,0)
Special17.BorderSizePixel = 0
Special17.LayoutOrder = -3
Special17.Parent = ScrollingFrame

local COM_8822819512910251 = Instance.new("Frame")
COM_8822819512910251.Name = "COM-8822819512910251"
COM_8822819512910251.Size = UDim2.new(0.669469,0,0.931111,0)
COM_8822819512910251.Position = UDim2.new(-1.75854e-07,0,0,0)
COM_8822819512910251.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_8822819512910251.BackgroundTransparency = 1
COM_8822819512910251.BorderColor3 = Color3.fromRGB(0,0,0)
COM_8822819512910251.BorderSizePixel = 0
COM_8822819512910251.LayoutOrder = -1
COM_8822819512910251.Parent = Special17

local BG32 = Instance.new("Frame")
BG32.Name = "BG"
BG32.Size = UDim2.new(1,0,1,0)
BG32.Position = UDim2.new(0.5,0,0.5,0)
BG32.AnchorPoint = Vector2.new(0.5,0.5)
BG32.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG32.BackgroundTransparency = 1
BG32.BorderColor3 = Color3.fromRGB(0,0,0)
BG32.BorderSizePixel = 0
BG32.ZIndex = -1
BG32.Parent = COM_8822819512910251

local Dropshadow31 = Instance.new("Frame")
Dropshadow31.Name = "Dropshadow"
Dropshadow31.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow31.Position = UDim2.new(0,0,1.028,0)
Dropshadow31.AnchorPoint = Vector2.new(0,1)
Dropshadow31.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow31.BackgroundTransparency = 0.5
Dropshadow31.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow31.BorderSizePixel = 0
Dropshadow31.ZIndex = -2
Dropshadow31.Parent = BG32

local UIStroke306 = Instance.new("UIStroke")
UIStroke306.Name = "UIStroke"
UIStroke306.Thickness = 2.79551
UIStroke306.Transparency = 1
UIStroke306.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke306.Parent = Dropshadow31

local Frame32 = Instance.new("Frame")
Frame32.Name = "Frame"
Frame32.Size = UDim2.new(0.969681,0,0.95775,0)
Frame32.Position = UDim2.new(0.514096,0,0.478875,0)
Frame32.AnchorPoint = Vector2.new(0.5,0.5)
Frame32.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame32.BorderColor3 = Color3.fromRGB(0,0,0)
Frame32.BorderSizePixel = 0
Frame32.ZIndex = -1
Frame32.Parent = BG32

local Pattern28 = Instance.new("ImageLabel")
Pattern28.Name = "Pattern"
Pattern28.Size = UDim2.new(1,0,1,0)
Pattern28.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern28.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern28.BackgroundTransparency = 1
Pattern28.BorderSizePixel = 0
Pattern28.Image = "rbxassetid://92127895583355"
Pattern28.ScaleType = Enum.ScaleType.Crop
Pattern28.ZIndex = -1
Pattern28.Parent = Frame32

local UIStroke307 = Instance.new("UIStroke")
UIStroke307.Name = "UIStroke"
UIStroke307.Thickness = 1.86368
UIStroke307.Parent = Pattern28

local UIStroke308 = Instance.new("UIStroke")
UIStroke308.Name = "UIStroke"
UIStroke308.Thickness = 1.86368
UIStroke308.Parent = Frame32

local Highlight28 = Instance.new("Frame")
Highlight28.Name = "Highlight"
Highlight28.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight28.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight28.AnchorPoint = Vector2.new(0.5,0.5)
Highlight28.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight28.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight28.BorderSizePixel = 0
Highlight28.Visible = false
Highlight28.ZIndex = -2
Highlight28.Parent = BG32

local UIStroke309 = Instance.new("UIStroke")
UIStroke309.Name = "UIStroke"
UIStroke309.Color = Color3.fromRGB(255,242,0)
UIStroke309.Thickness = 2.79551
UIStroke309.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke309.Parent = Highlight28

local DisplayTitle22 = Instance.new("TextLabel")
DisplayTitle22.Name = "DisplayTitle"
DisplayTitle22.Size = UDim2.new(0.566559,0,0.435422,0)
DisplayTitle22.Position = UDim2.new(0.709236,0,0.15042,0)
DisplayTitle22.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle22.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle22.BackgroundTransparency = 1
DisplayTitle22.BorderSizePixel = 0
DisplayTitle22.Text = "Vee Black Tee"
DisplayTitle22.TextColor3 = Color3.fromRGB(0,53,4)
DisplayTitle22.TextSize = 29
DisplayTitle22.Font = Enum.Font.Arcade
DisplayTitle22.TextWrapped = true
DisplayTitle22.TextScaled = true
DisplayTitle22.RichText = true
DisplayTitle22.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle22.Parent = COM_8822819512910251

local UIGradient121 = Instance.new("UIGradient")
UIGradient121.Name = "UIGradient"
UIGradient121.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient121.Rotation = -90
UIGradient121.Offset = Vector2.new(0,0)
UIGradient121.Parent = DisplayTitle22

local UIStroke310 = Instance.new("UIStroke")
UIStroke310.Name = "UIStroke"
UIStroke310.Color = Color3.fromRGB(255,255,255)
UIStroke310.Thickness = 0.931838
UIStroke310.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke310.Parent = DisplayTitle22

local Item32 = Instance.new("ImageLabel")
Item32.Name = "Item"
Item32.Size = UDim2.new(0.913665,0,0.651761,0)
Item32.Position = UDim2.new(0.514096,0,0.463834,0)
Item32.AnchorPoint = Vector2.new(0.5,0.5)
Item32.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item32.BackgroundTransparency = 1
Item32.BorderSizePixel = 0
Item32.Image = "rbxassetid://94959635148921"
Item32.ImageRectOffset = Vector2.new(15,15)
Item32.ImageRectSize = Vector2.new(270,270)
Item32.ScaleType = Enum.ScaleType.Fit
Item32.Visible = false
Item32.ZIndex = -1
Item32.Parent = COM_8822819512910251

local Unavailable97 = Instance.new("TextLabel")
Unavailable97.Name = "Unavailable"
Unavailable97.Size = UDim2.new(0.7,0,0.7,0)
Unavailable97.Position = UDim2.new(0.5,0,0.5,0)
Unavailable97.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable97.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable97.BackgroundTransparency = 1
Unavailable97.BorderSizePixel = 0
Unavailable97.Text = "Unavailable"
Unavailable97.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable97.TextSize = 14
Unavailable97.Font = Enum.Font.FredokaOne
Unavailable97.TextWrapped = true
Unavailable97.TextScaled = true
Unavailable97.Visible = false
Unavailable97.Parent = Item32

local UIStroke311 = Instance.new("UIStroke")
UIStroke311.Name = "UIStroke"
UIStroke311.Thickness = 2
UIStroke311.Parent = Unavailable97

local New16 = Instance.new("ImageLabel")
New16.Name = "New"
New16.Size = UDim2.new(0.322123,0,0.355513,0)
New16.Position = UDim2.new(0.924293,0,0.0284983,0)
New16.AnchorPoint = Vector2.new(0.5,0.5)
New16.BackgroundColor3 = Color3.fromRGB(255,255,255)
New16.BackgroundTransparency = 1
New16.BorderSizePixel = 0
New16.Image = "rbxassetid://96728750855907"
New16.ScaleType = Enum.ScaleType.Fit
New16.Visible = false
New16.ZIndex = -1
New16.Parent = COM_8822819512910251

local UIScale46 = Instance.new("UIScale")
UIScale46.Name = "UIScale"
UIScale46.Parent = New16

local Purchase32 = Instance.new("ImageButton")
Purchase32.Name = "Purchase"
Purchase32.Size = UDim2.new(0.551281,0,0.201102,0)
Purchase32.Position = UDim2.new(0.681037,0,0.790057,0)
Purchase32.AnchorPoint = Vector2.new(0.5,0.5)
Purchase32.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase32.BorderSizePixel = 0
Purchase32.ScaleType = Enum.ScaleType.Fit
Purchase32.AutoButtonColor = false
Purchase32.Parent = COM_8822819512910251

local Price32 = Instance.new("TextLabel")
Price32.Name = "Price"
Price32.Size = UDim2.new(0.78479,0,0.702682,0)
Price32.Position = UDim2.new(0.100663,0,0.0990811,0)
Price32.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price32.BackgroundTransparency = 1
Price32.BorderSizePixel = 0
Price32.Text = "$19.99"
Price32.TextColor3 = Color3.fromRGB(255,255,255)
Price32.TextSize = 14
Price32.Font = Enum.Font.Arcade
Price32.TextWrapped = true
Price32.TextScaled = true
Price32.RichText = true
Price32.AutomaticSize = Enum.AutomaticSize.X
Price32.Parent = Purchase32

local UIGradient122 = Instance.new("UIGradient")
UIGradient122.Name = "UIGradient"
UIGradient122.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient122.Rotation = -90
UIGradient122.Offset = Vector2.new(0,0)
UIGradient122.Parent = Price32

local UIStroke312 = Instance.new("UIStroke")
UIStroke312.Name = "UIStroke"
UIStroke312.Thickness = 0.931838
UIStroke312.Parent = Price32

local UICorner33 = Instance.new("UICorner")
UICorner33.Name = "UICorner"
UICorner33.CornerRadius = UDim.new(1,0)
UICorner33.Parent = Purchase32

local UIGradient123 = Instance.new("UIGradient")
UIGradient123.Name = "UIGradient"
UIGradient123.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient123.Rotation = -90
UIGradient123.Offset = Vector2.new(0,0)
UIGradient123.Parent = Purchase32

local UIScale47 = Instance.new("UIScale")
UIScale47.Name = "UIScale"
UIScale47.Parent = Purchase32

local UIStroke313 = Instance.new("UIStroke")
UIStroke313.Name = "UIStroke"
UIStroke313.Thickness = 1.1648
UIStroke313.Parent = Purchase32

local Thumbnail54 = Instance.new("ImageLabel")
Thumbnail54.Name = "Thumbnail"
Thumbnail54.Size = UDim2.new(0.477726,0,1.43936,0)
Thumbnail54.Position = UDim2.new(0.268118,0,0.486483,0)
Thumbnail54.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail54.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail54.BackgroundTransparency = 1
Thumbnail54.BorderSizePixel = 0
Thumbnail54.Image = "rbxassetid://72072003278813"
Thumbnail54.ScaleType = Enum.ScaleType.Fit
Thumbnail54.ZIndex = -1
Thumbnail54.Parent = COM_8822819512910251

local Unavailable98 = Instance.new("TextLabel")
Unavailable98.Name = "Unavailable"
Unavailable98.Size = UDim2.new(0.7,0,0.7,0)
Unavailable98.Position = UDim2.new(0.5,0,0.5,0)
Unavailable98.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable98.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable98.BackgroundTransparency = 1
Unavailable98.BorderSizePixel = 0
Unavailable98.Text = "Unavailable"
Unavailable98.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable98.TextSize = 14
Unavailable98.Font = Enum.Font.FredokaOne
Unavailable98.TextWrapped = true
Unavailable98.TextScaled = true
Unavailable98.Visible = false
Unavailable98.Parent = Thumbnail54

local UIStroke314 = Instance.new("UIStroke")
UIStroke314.Name = "UIStroke"
UIStroke314.Thickness = 2
UIStroke314.Parent = Unavailable98

local Title32 = Instance.new("TextLabel")
Title32.Name = "Title"
Title32.Size = UDim2.new(0.566559,0,0.435422,0)
Title32.Position = UDim2.new(0.65544,0,0.15042,0)
Title32.AnchorPoint = Vector2.new(0.5,0)
Title32.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title32.BackgroundTransparency = 1
Title32.BorderSizePixel = 0
Title32.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title32.TextColor3 = Color3.fromRGB(0,13,76)
Title32.TextSize = 29
Title32.Font = Enum.Font.Arcade
Title32.TextWrapped = true
Title32.TextScaled = true
Title32.RichText = true
Title32.Visible = false
Title32.AutomaticSize = Enum.AutomaticSize.X
Title32.Parent = COM_8822819512910251

local UIGradient124 = Instance.new("UIGradient")
UIGradient124.Name = "UIGradient"
UIGradient124.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient124.Rotation = -90
UIGradient124.Offset = Vector2.new(0,0)
UIGradient124.Parent = Title32

local UIStroke315 = Instance.new("UIStroke")
UIStroke315.Name = "UIStroke"
UIStroke315.Color = Color3.fromRGB(255,255,255)
UIStroke315.Thickness = 2
UIStroke315.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke315.Parent = Title32

local COM_7599763136748192250 = Instance.new("Frame")
COM_7599763136748192250.Name = "COM-7599763136748192250"
COM_7599763136748192250.Size = UDim2.new(0.669469,0,0.931111,0)
COM_7599763136748192250.Position = UDim2.new(0.698518,0,0,0)
COM_7599763136748192250.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_7599763136748192250.BackgroundTransparency = 1
COM_7599763136748192250.BorderColor3 = Color3.fromRGB(0,0,0)
COM_7599763136748192250.BorderSizePixel = 0
COM_7599763136748192250.Parent = Special17

local BG33 = Instance.new("Frame")
BG33.Name = "BG"
BG33.Size = UDim2.new(1,0,1,0)
BG33.Position = UDim2.new(0.5,0,0.5,0)
BG33.AnchorPoint = Vector2.new(0.5,0.5)
BG33.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG33.BackgroundTransparency = 1
BG33.BorderColor3 = Color3.fromRGB(0,0,0)
BG33.BorderSizePixel = 0
BG33.ZIndex = -1
BG33.Parent = COM_7599763136748192250

local Dropshadow32 = Instance.new("Frame")
Dropshadow32.Name = "Dropshadow"
Dropshadow32.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow32.Position = UDim2.new(0,0,1.028,0)
Dropshadow32.AnchorPoint = Vector2.new(0,1)
Dropshadow32.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow32.BackgroundTransparency = 0.5
Dropshadow32.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow32.BorderSizePixel = 0
Dropshadow32.ZIndex = -2
Dropshadow32.Parent = BG33

local UIStroke316 = Instance.new("UIStroke")
UIStroke316.Name = "UIStroke"
UIStroke316.Thickness = 2.79551
UIStroke316.Transparency = 1
UIStroke316.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke316.Parent = Dropshadow32

local Frame33 = Instance.new("Frame")
Frame33.Name = "Frame"
Frame33.Size = UDim2.new(0.969681,0,0.95775,0)
Frame33.Position = UDim2.new(0.514096,0,0.478875,0)
Frame33.AnchorPoint = Vector2.new(0.5,0.5)
Frame33.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame33.BorderColor3 = Color3.fromRGB(0,0,0)
Frame33.BorderSizePixel = 0
Frame33.ZIndex = -1
Frame33.Parent = BG33

local Pattern29 = Instance.new("ImageLabel")
Pattern29.Name = "Pattern"
Pattern29.Size = UDim2.new(1,0,1,0)
Pattern29.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern29.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern29.BackgroundTransparency = 1
Pattern29.BorderSizePixel = 0
Pattern29.Image = "rbxassetid://92127895583355"
Pattern29.ScaleType = Enum.ScaleType.Crop
Pattern29.ZIndex = -1
Pattern29.Parent = Frame33

local UIStroke317 = Instance.new("UIStroke")
UIStroke317.Name = "UIStroke"
UIStroke317.Thickness = 1.86368
UIStroke317.Parent = Pattern29

local UIStroke318 = Instance.new("UIStroke")
UIStroke318.Name = "UIStroke"
UIStroke318.Thickness = 1.86368
UIStroke318.Parent = Frame33

local Highlight29 = Instance.new("Frame")
Highlight29.Name = "Highlight"
Highlight29.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight29.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight29.AnchorPoint = Vector2.new(0.5,0.5)
Highlight29.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight29.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight29.BorderSizePixel = 0
Highlight29.Visible = false
Highlight29.ZIndex = -2
Highlight29.Parent = BG33

local UIStroke319 = Instance.new("UIStroke")
UIStroke319.Name = "UIStroke"
UIStroke319.Color = Color3.fromRGB(255,242,0)
UIStroke319.Thickness = 2.79551
UIStroke319.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke319.Parent = Highlight29

local DisplayTitle23 = Instance.new("TextLabel")
DisplayTitle23.Name = "DisplayTitle"
DisplayTitle23.Size = UDim2.new(0.566559,0,0.435422,0)
DisplayTitle23.Position = UDim2.new(0.709236,0,0.15042,0)
DisplayTitle23.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle23.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle23.BackgroundTransparency = 1
DisplayTitle23.BorderSizePixel = 0
DisplayTitle23.Text = "Vee Enamel Pin"
DisplayTitle23.TextColor3 = Color3.fromRGB(0,53,4)
DisplayTitle23.TextSize = 29
DisplayTitle23.Font = Enum.Font.Arcade
DisplayTitle23.TextWrapped = true
DisplayTitle23.TextScaled = true
DisplayTitle23.RichText = true
DisplayTitle23.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle23.Parent = COM_7599763136748192250

local UIGradient125 = Instance.new("UIGradient")
UIGradient125.Name = "UIGradient"
UIGradient125.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient125.Rotation = -90
UIGradient125.Offset = Vector2.new(0,0)
UIGradient125.Parent = DisplayTitle23

local UIStroke320 = Instance.new("UIStroke")
UIStroke320.Name = "UIStroke"
UIStroke320.Color = Color3.fromRGB(255,255,255)
UIStroke320.Thickness = 0.931838
UIStroke320.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke320.Parent = DisplayTitle23

local Item33 = Instance.new("ImageLabel")
Item33.Name = "Item"
Item33.Size = UDim2.new(0.913665,0,0.651761,0)
Item33.Position = UDim2.new(0.514096,0,0.463834,0)
Item33.AnchorPoint = Vector2.new(0.5,0.5)
Item33.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item33.BackgroundTransparency = 1
Item33.BorderSizePixel = 0
Item33.Image = "rbxassetid://94959635148921"
Item33.ImageRectOffset = Vector2.new(15,15)
Item33.ImageRectSize = Vector2.new(270,270)
Item33.ScaleType = Enum.ScaleType.Fit
Item33.Visible = false
Item33.ZIndex = -1
Item33.Parent = COM_7599763136748192250

local Unavailable99 = Instance.new("TextLabel")
Unavailable99.Name = "Unavailable"
Unavailable99.Size = UDim2.new(0.7,0,0.7,0)
Unavailable99.Position = UDim2.new(0.5,0,0.5,0)
Unavailable99.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable99.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable99.BackgroundTransparency = 1
Unavailable99.BorderSizePixel = 0
Unavailable99.Text = "Unavailable"
Unavailable99.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable99.TextSize = 14
Unavailable99.Font = Enum.Font.FredokaOne
Unavailable99.TextWrapped = true
Unavailable99.TextScaled = true
Unavailable99.Visible = false
Unavailable99.Parent = Item33

local UIStroke321 = Instance.new("UIStroke")
UIStroke321.Name = "UIStroke"
UIStroke321.Thickness = 2
UIStroke321.Parent = Unavailable99

local Purchase33 = Instance.new("ImageButton")
Purchase33.Name = "Purchase"
Purchase33.Size = UDim2.new(0.551281,0,0.201102,0)
Purchase33.Position = UDim2.new(0.681037,0,0.790057,0)
Purchase33.AnchorPoint = Vector2.new(0.5,0.5)
Purchase33.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase33.BorderSizePixel = 0
Purchase33.ScaleType = Enum.ScaleType.Fit
Purchase33.AutoButtonColor = false
Purchase33.Parent = COM_7599763136748192250

local Price33 = Instance.new("TextLabel")
Price33.Name = "Price"
Price33.Size = UDim2.new(0.78479,0,0.702682,0)
Price33.Position = UDim2.new(0.100663,0,0.0990811,0)
Price33.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price33.BackgroundTransparency = 1
Price33.BorderSizePixel = 0
Price33.Text = "$19.99"
Price33.TextColor3 = Color3.fromRGB(255,255,255)
Price33.TextSize = 14
Price33.Font = Enum.Font.Arcade
Price33.TextWrapped = true
Price33.TextScaled = true
Price33.RichText = true
Price33.AutomaticSize = Enum.AutomaticSize.X
Price33.Parent = Purchase33

local UIGradient126 = Instance.new("UIGradient")
UIGradient126.Name = "UIGradient"
UIGradient126.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient126.Rotation = -90
UIGradient126.Offset = Vector2.new(0,0)
UIGradient126.Parent = Price33

local UIStroke322 = Instance.new("UIStroke")
UIStroke322.Name = "UIStroke"
UIStroke322.Thickness = 0.931838
UIStroke322.Parent = Price33

local UICorner34 = Instance.new("UICorner")
UICorner34.Name = "UICorner"
UICorner34.CornerRadius = UDim.new(1,0)
UICorner34.Parent = Purchase33

local UIGradient127 = Instance.new("UIGradient")
UIGradient127.Name = "UIGradient"
UIGradient127.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient127.Rotation = -90
UIGradient127.Offset = Vector2.new(0,0)
UIGradient127.Parent = Purchase33

local UIScale48 = Instance.new("UIScale")
UIScale48.Name = "UIScale"
UIScale48.Parent = Purchase33

local UIStroke323 = Instance.new("UIStroke")
UIStroke323.Name = "UIStroke"
UIStroke323.Thickness = 1.1648
UIStroke323.Parent = Purchase33

local Thumbnail55 = Instance.new("ImageLabel")
Thumbnail55.Name = "Thumbnail"
Thumbnail55.Size = UDim2.new(0.477726,0,1.44542,0)
Thumbnail55.Position = UDim2.new(0.265967,0,0.48666,0)
Thumbnail55.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail55.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail55.BackgroundTransparency = 1
Thumbnail55.BorderSizePixel = 0
Thumbnail55.Image = "rbxassetid://101802931116457"
Thumbnail55.ScaleType = Enum.ScaleType.Fit
Thumbnail55.ZIndex = -1
Thumbnail55.Parent = COM_7599763136748192250

local Unavailable100 = Instance.new("TextLabel")
Unavailable100.Name = "Unavailable"
Unavailable100.Size = UDim2.new(0.7,0,0.7,0)
Unavailable100.Position = UDim2.new(0.5,0,0.5,0)
Unavailable100.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable100.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable100.BackgroundTransparency = 1
Unavailable100.BorderSizePixel = 0
Unavailable100.Text = "Unavailable"
Unavailable100.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable100.TextSize = 14
Unavailable100.Font = Enum.Font.FredokaOne
Unavailable100.TextWrapped = true
Unavailable100.TextScaled = true
Unavailable100.Visible = false
Unavailable100.Parent = Thumbnail55

local UIStroke324 = Instance.new("UIStroke")
UIStroke324.Name = "UIStroke"
UIStroke324.Thickness = 2
UIStroke324.Parent = Unavailable100

local Title33 = Instance.new("TextLabel")
Title33.Name = "Title"
Title33.Size = UDim2.new(0.566559,0,0.435422,0)
Title33.Position = UDim2.new(0.65544,0,0.15042,0)
Title33.AnchorPoint = Vector2.new(0.5,0)
Title33.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title33.BackgroundTransparency = 1
Title33.BorderSizePixel = 0
Title33.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title33.TextColor3 = Color3.fromRGB(0,13,76)
Title33.TextSize = 29
Title33.Font = Enum.Font.Arcade
Title33.TextWrapped = true
Title33.TextScaled = true
Title33.RichText = true
Title33.Visible = false
Title33.AutomaticSize = Enum.AutomaticSize.X
Title33.Parent = COM_7599763136748192250

local UIGradient128 = Instance.new("UIGradient")
UIGradient128.Name = "UIGradient"
UIGradient128.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient128.Rotation = -90
UIGradient128.Offset = Vector2.new(0,0)
UIGradient128.Parent = Title33

local UIStroke325 = Instance.new("UIStroke")
UIStroke325.Name = "UIStroke"
UIStroke325.Color = Color3.fromRGB(255,255,255)
UIStroke325.Thickness = 2
UIStroke325.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke325.Parent = Title33

local UIListLayout19 = Instance.new("UIListLayout")
UIListLayout19.Name = "UIListLayout"
UIListLayout19.Padding = UDim.new(0.019,0)
UIListLayout19.FillDirection = Enum.FillDirection.Horizontal
UIListLayout19.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout19.Wraps = false
UIListLayout19.Parent = Special17

local Special18 = Instance.new("Frame")
Special18.Name = "Special"
Special18.Size = UDim2.new(0.728177,0,0.493216,0)
Special18.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
Special18.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special18.BackgroundTransparency = 1
Special18.BorderColor3 = Color3.fromRGB(0,0,0)
Special18.BorderSizePixel = 0
Special18.Visible = false
Special18.LayoutOrder = -3
Special18.Parent = ScrollingFrame

local COM_25298985882597462752 = Instance.new("Frame")
COM_25298985882597462752.Name = "COM-2529898588259746275"
COM_25298985882597462752.Size = UDim2.new(0.894198,0,0.931112,0)
COM_25298985882597462752.Position = UDim2.new(5.4771e-08,0,0,0)
COM_25298985882597462752.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_25298985882597462752.BackgroundTransparency = 1
COM_25298985882597462752.BorderColor3 = Color3.fromRGB(0,0,0)
COM_25298985882597462752.BorderSizePixel = 0
COM_25298985882597462752.ZIndex = 2
COM_25298985882597462752.Parent = Special18

local BG34 = Instance.new("Frame")
BG34.Name = "BG"
BG34.Size = UDim2.new(1,0,1,0)
BG34.Position = UDim2.new(0.5,0,0.5,0)
BG34.AnchorPoint = Vector2.new(0.5,0.5)
BG34.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG34.BackgroundTransparency = 1
BG34.BorderColor3 = Color3.fromRGB(0,0,0)
BG34.BorderSizePixel = 0
BG34.ZIndex = -1
BG34.Parent = COM_25298985882597462752

local Dropshadow33 = Instance.new("Frame")
Dropshadow33.Name = "Dropshadow"
Dropshadow33.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow33.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow33.AnchorPoint = Vector2.new(0,1)
Dropshadow33.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow33.BackgroundTransparency = 0.5
Dropshadow33.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow33.BorderSizePixel = 0
Dropshadow33.ZIndex = -2
Dropshadow33.Parent = BG34

local UIStroke326 = Instance.new("UIStroke")
UIStroke326.Name = "UIStroke"
UIStroke326.Thickness = 2.79551
UIStroke326.Transparency = 1
UIStroke326.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke326.Parent = Dropshadow33

local Frame34 = Instance.new("Frame")
Frame34.Name = "Frame"
Frame34.Size = UDim2.new(0.984612,0,0.95775,0)
Frame34.Position = UDim2.new(0.506631,0,0.478875,0)
Frame34.AnchorPoint = Vector2.new(0.5,0.5)
Frame34.BackgroundColor3 = Color3.fromRGB(3,148,13)
Frame34.BorderColor3 = Color3.fromRGB(0,0,0)
Frame34.BorderSizePixel = 0
Frame34.ZIndex = -1
Frame34.Parent = BG34

local Pattern30 = Instance.new("ImageLabel")
Pattern30.Name = "Pattern"
Pattern30.Size = UDim2.new(1,0,1,0)
Pattern30.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern30.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern30.BackgroundTransparency = 1
Pattern30.BorderSizePixel = 0
Pattern30.Image = "rbxassetid://92127895583355"
Pattern30.ImageColor3 = Color3.fromRGB(100,255,17)
Pattern30.ZIndex = -1
Pattern30.Parent = Frame34

local UIStroke327 = Instance.new("UIStroke")
UIStroke327.Name = "UIStroke"
UIStroke327.Thickness = 1.86368
UIStroke327.Parent = Pattern30

local UIGradient129 = Instance.new("UIGradient")
UIGradient129.Name = "UIGradient"
UIGradient129.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient129.Rotation = 90
UIGradient129.Offset = Vector2.new(0,0)
UIGradient129.Parent = Frame34

local UIStroke328 = Instance.new("UIStroke")
UIStroke328.Name = "UIStroke"
UIStroke328.Thickness = 1.86368
UIStroke328.Parent = Frame34

local Highlight30 = Instance.new("Frame")
Highlight30.Name = "Highlight"
Highlight30.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight30.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight30.AnchorPoint = Vector2.new(0.5,0.5)
Highlight30.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight30.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight30.BorderSizePixel = 0
Highlight30.Visible = false
Highlight30.ZIndex = -2
Highlight30.Parent = BG34

local UIStroke329 = Instance.new("UIStroke")
UIStroke329.Name = "UIStroke"
UIStroke329.Color = Color3.fromRGB(255,242,0)
UIStroke329.Thickness = 2.79551
UIStroke329.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke329.Parent = Highlight30

local CanvasGroup12 = Instance.new("CanvasGroup")
CanvasGroup12.Name = "CanvasGroup"
CanvasGroup12.Size = UDim2.new(1,0,1,0)
CanvasGroup12.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup12.BackgroundTransparency = 1
CanvasGroup12.Parent = COM_25298985882597462752

local Thumbnail56 = Instance.new("ImageLabel")
Thumbnail56.Name = "Thumbnail"
Thumbnail56.Size = UDim2.new(0.293901,0,0.766222,0)
Thumbnail56.Position = UDim2.new(0.104398,0,0.514738,0)
Thumbnail56.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail56.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail56.BackgroundTransparency = 1
Thumbnail56.BorderSizePixel = 0
Thumbnail56.Image = "rbxassetid://114298785049809"
Thumbnail56.ScaleType = Enum.ScaleType.Fit
Thumbnail56.ZIndex = 0
Thumbnail56.Rotation = -11
Thumbnail56.Parent = CanvasGroup12

local Unavailable101 = Instance.new("TextLabel")
Unavailable101.Name = "Unavailable"
Unavailable101.Size = UDim2.new(0.7,0,0.7,0)
Unavailable101.Position = UDim2.new(0.5,0,0.5,0)
Unavailable101.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable101.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable101.BackgroundTransparency = 1
Unavailable101.BorderSizePixel = 0
Unavailable101.Text = "Unavailable"
Unavailable101.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable101.TextSize = 14
Unavailable101.Font = Enum.Font.FredokaOne
Unavailable101.TextWrapped = true
Unavailable101.TextScaled = true
Unavailable101.Visible = false
Unavailable101.Parent = Thumbnail56

local UIStroke330 = Instance.new("UIStroke")
UIStroke330.Name = "UIStroke"
UIStroke330.Thickness = 2
UIStroke330.Parent = Unavailable101

local Thumbnail57 = Instance.new("ImageLabel")
Thumbnail57.Name = "Thumbnail"
Thumbnail57.Size = UDim2.new(0.293901,0,0.766222,0)
Thumbnail57.Position = UDim2.new(0.176374,0,0.449167,0)
Thumbnail57.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail57.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail57.BackgroundTransparency = 1
Thumbnail57.BorderSizePixel = 0
Thumbnail57.Image = "rbxassetid://88590750012874"
Thumbnail57.ScaleType = Enum.ScaleType.Fit
Thumbnail57.ZIndex = -1
Thumbnail57.Rotation = 5
Thumbnail57.Parent = CanvasGroup12

local Unavailable102 = Instance.new("TextLabel")
Unavailable102.Name = "Unavailable"
Unavailable102.Size = UDim2.new(0.7,0,0.7,0)
Unavailable102.Position = UDim2.new(0.5,0,0.5,0)
Unavailable102.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable102.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable102.BackgroundTransparency = 1
Unavailable102.BorderSizePixel = 0
Unavailable102.Text = "Unavailable"
Unavailable102.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable102.TextSize = 14
Unavailable102.Font = Enum.Font.FredokaOne
Unavailable102.TextWrapped = true
Unavailable102.TextScaled = true
Unavailable102.Visible = false
Unavailable102.Parent = Thumbnail57

local UIStroke331 = Instance.new("UIStroke")
UIStroke331.Name = "UIStroke"
UIStroke331.Thickness = 2
UIStroke331.Parent = Unavailable102

local DisplayTitle24 = Instance.new("TextLabel")
DisplayTitle24.Name = "DisplayTitle"
DisplayTitle24.Size = UDim2.new(0.453471,0,0.351663,0)
DisplayTitle24.Position = UDim2.new(0.74378,0,0.235969,0)
DisplayTitle24.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle24.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle24.BackgroundTransparency = 1
DisplayTitle24.BorderSizePixel = 0
DisplayTitle24.Text = "Vee 14\" Deluxe Plush (Pre-Order)"
DisplayTitle24.TextColor3 = Color3.fromRGB(2,40,0)
DisplayTitle24.TextSize = 29
DisplayTitle24.Font = Enum.Font.Arcade
DisplayTitle24.TextWrapped = true
DisplayTitle24.TextScaled = true
DisplayTitle24.RichText = true
DisplayTitle24.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle24.Parent = COM_25298985882597462752

local UIAspectRatioConstraint17 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint17.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint17.AspectRatio = 2.66
UIAspectRatioConstraint17.Parent = DisplayTitle24

local UIGradient130 = Instance.new("UIGradient")
UIGradient130.Name = "UIGradient"
UIGradient130.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient130.Rotation = -90
UIGradient130.Offset = Vector2.new(0,0)
UIGradient130.Parent = DisplayTitle24

local UIStroke332 = Instance.new("UIStroke")
UIStroke332.Name = "UIStroke"
UIStroke332.Color = Color3.fromRGB(255,255,255)
UIStroke332.Thickness = 0.931838
UIStroke332.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke332.Parent = DisplayTitle24

local Item34 = Instance.new("ImageLabel")
Item34.Name = "Item"
Item34.Size = UDim2.new(0.913665,0,0.651761,0)
Item34.Position = UDim2.new(0.514096,0,0.463834,0)
Item34.AnchorPoint = Vector2.new(0.5,0.5)
Item34.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item34.BackgroundTransparency = 1
Item34.BorderSizePixel = 0
Item34.Image = "rbxassetid://94959635148921"
Item34.ImageRectOffset = Vector2.new(15,15)
Item34.ImageRectSize = Vector2.new(270,270)
Item34.ScaleType = Enum.ScaleType.Fit
Item34.Visible = false
Item34.ZIndex = -1
Item34.Parent = COM_25298985882597462752

local Unavailable103 = Instance.new("TextLabel")
Unavailable103.Name = "Unavailable"
Unavailable103.Size = UDim2.new(0.7,0,0.7,0)
Unavailable103.Position = UDim2.new(0.5,0,0.5,0)
Unavailable103.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable103.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable103.BackgroundTransparency = 1
Unavailable103.BorderSizePixel = 0
Unavailable103.Text = "Unavailable"
Unavailable103.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable103.TextSize = 14
Unavailable103.Font = Enum.Font.FredokaOne
Unavailable103.TextWrapped = true
Unavailable103.TextScaled = true
Unavailable103.Visible = false
Unavailable103.Parent = Item34

local UIStroke333 = Instance.new("UIStroke")
UIStroke333.Name = "UIStroke"
UIStroke333.Thickness = 2
UIStroke333.Parent = Unavailable103

local New17 = Instance.new("ImageLabel")
New17.Name = "New"
New17.Size = UDim2.new(0.322123,0,0.355513,0)
New17.Position = UDim2.new(0.94212,0,0.0839209,0)
New17.AnchorPoint = Vector2.new(0.5,0.5)
New17.BackgroundColor3 = Color3.fromRGB(255,255,255)
New17.BackgroundTransparency = 1
New17.BorderSizePixel = 0
New17.Image = "rbxassetid://96728750855907"
New17.ScaleType = Enum.ScaleType.Fit
New17.ZIndex = -1
New17.Parent = COM_25298985882597462752

local UIScale49 = Instance.new("UIScale")
UIScale49.Name = "UIScale"
UIScale49.Parent = New17

local Purchase34 = Instance.new("ImageButton")
Purchase34.Name = "Purchase"
Purchase34.Size = UDim2.new(0.436835,0,0.172928,0)
Purchase34.Position = UDim2.new(0.752098,0,0.833662,0)
Purchase34.AnchorPoint = Vector2.new(0.5,0.5)
Purchase34.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase34.BorderSizePixel = 0
Purchase34.ScaleType = Enum.ScaleType.Fit
Purchase34.AutoButtonColor = false
Purchase34.Parent = COM_25298985882597462752

local Price34 = Instance.new("TextLabel")
Price34.Name = "Price"
Price34.Size = UDim2.new(0.78479,0,0.702682,0)
Price34.Position = UDim2.new(0.100663,0,0.0990811,0)
Price34.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price34.BackgroundTransparency = 1
Price34.BorderSizePixel = 0
Price34.Text = "$19.99"
Price34.TextColor3 = Color3.fromRGB(255,255,255)
Price34.TextSize = 14
Price34.Font = Enum.Font.Arcade
Price34.TextWrapped = true
Price34.TextScaled = true
Price34.RichText = true
Price34.AutomaticSize = Enum.AutomaticSize.X
Price34.Parent = Purchase34

local UIGradient131 = Instance.new("UIGradient")
UIGradient131.Name = "UIGradient"
UIGradient131.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient131.Rotation = -90
UIGradient131.Offset = Vector2.new(0,0)
UIGradient131.Parent = Price34

local UIStroke334 = Instance.new("UIStroke")
UIStroke334.Name = "UIStroke"
UIStroke334.Thickness = 0.931838
UIStroke334.Parent = Price34

local UICorner35 = Instance.new("UICorner")
UICorner35.Name = "UICorner"
UICorner35.CornerRadius = UDim.new(1,0)
UICorner35.Parent = Purchase34

local UIGradient132 = Instance.new("UIGradient")
UIGradient132.Name = "UIGradient"
UIGradient132.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient132.Rotation = -90
UIGradient132.Offset = Vector2.new(0,0)
UIGradient132.Parent = Purchase34

local UIScale50 = Instance.new("UIScale")
UIScale50.Name = "UIScale"
UIScale50.Parent = Purchase34

local UIStroke335 = Instance.new("UIStroke")
UIStroke335.Name = "UIStroke"
UIStroke335.Thickness = 1.1648
UIStroke335.Parent = Purchase34

local Thumbnail58 = Instance.new("ImageLabel")
Thumbnail58.Name = "Thumbnail"
Thumbnail58.Size = UDim2.new(0.48234,0,1.1696,0)
Thumbnail58.Position = UDim2.new(0.365108,0,0.490964,0)
Thumbnail58.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail58.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail58.BackgroundTransparency = 1
Thumbnail58.BorderSizePixel = 0
Thumbnail58.Image = "rbxassetid://113698030534354"
Thumbnail58.ScaleType = Enum.ScaleType.Fit
Thumbnail58.ZIndex = 2
Thumbnail58.Parent = COM_25298985882597462752

local Unavailable104 = Instance.new("TextLabel")
Unavailable104.Name = "Unavailable"
Unavailable104.Size = UDim2.new(0.7,0,0.7,0)
Unavailable104.Position = UDim2.new(0.5,0,0.5,0)
Unavailable104.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable104.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable104.BackgroundTransparency = 1
Unavailable104.BorderSizePixel = 0
Unavailable104.Text = "Unavailable"
Unavailable104.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable104.TextSize = 14
Unavailable104.Font = Enum.Font.FredokaOne
Unavailable104.TextWrapped = true
Unavailable104.TextScaled = true
Unavailable104.Visible = false
Unavailable104.Parent = Thumbnail58

local UIStroke336 = Instance.new("UIStroke")
UIStroke336.Name = "UIStroke"
UIStroke336.Thickness = 2
UIStroke336.Parent = Unavailable104

local Title34 = Instance.new("TextLabel")
Title34.Name = "Title"
Title34.Size = UDim2.new(0.566559,0,0.435422,0)
Title34.Position = UDim2.new(0.65544,0,0.15042,0)
Title34.AnchorPoint = Vector2.new(0.5,0)
Title34.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title34.BackgroundTransparency = 1
Title34.BorderSizePixel = 0
Title34.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title34.TextColor3 = Color3.fromRGB(0,13,76)
Title34.TextSize = 29
Title34.Font = Enum.Font.Arcade
Title34.TextWrapped = true
Title34.TextScaled = true
Title34.RichText = true
Title34.Visible = false
Title34.AutomaticSize = Enum.AutomaticSize.X
Title34.Parent = COM_25298985882597462752

local UIGradient133 = Instance.new("UIGradient")
UIGradient133.Name = "UIGradient"
UIGradient133.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient133.Rotation = -90
UIGradient133.Offset = Vector2.new(0,0)
UIGradient133.Parent = Title34

local UIStroke337 = Instance.new("UIStroke")
UIStroke337.Name = "UIStroke"
UIStroke337.Color = Color3.fromRGB(255,255,255)
UIStroke337.Thickness = 2
UIStroke337.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke337.Parent = Title34

local COM_75997631367481922502 = Instance.new("Frame")
COM_75997631367481922502.Name = "COM-7599763136748192250"
COM_75997631367481922502.Size = UDim2.new(0.442523,0,0.944677,0)
COM_75997631367481922502.Position = UDim2.new(0.913307,0,0,0)
COM_75997631367481922502.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_75997631367481922502.BackgroundTransparency = 1
COM_75997631367481922502.BorderColor3 = Color3.fromRGB(0,0,0)
COM_75997631367481922502.BorderSizePixel = 0
COM_75997631367481922502.Parent = Special18

local BG35 = Instance.new("Frame")
BG35.Name = "BG"
BG35.Size = UDim2.new(1,0,1,0)
BG35.Position = UDim2.new(0.5,0,0.5,0)
BG35.AnchorPoint = Vector2.new(0.5,0.5)
BG35.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG35.BackgroundTransparency = 1
BG35.BorderColor3 = Color3.fromRGB(0,0,0)
BG35.BorderSizePixel = 0
BG35.ZIndex = -1
BG35.Parent = COM_75997631367481922502

local Dropshadow34 = Instance.new("Frame")
Dropshadow34.Name = "Dropshadow"
Dropshadow34.Size = UDim2.new(0.947997,0,0.95376,0)
Dropshadow34.Position = UDim2.new(-0.00747363,0,1.01324,0)
Dropshadow34.AnchorPoint = Vector2.new(0,1)
Dropshadow34.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow34.BackgroundTransparency = 0.5
Dropshadow34.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow34.BorderSizePixel = 0
Dropshadow34.ZIndex = -2
Dropshadow34.Parent = BG35

local UIStroke338 = Instance.new("UIStroke")
UIStroke338.Name = "UIStroke"
UIStroke338.Thickness = 2.79551
UIStroke338.Transparency = 1
UIStroke338.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke338.Parent = Dropshadow34

local Frame35 = Instance.new("Frame")
Frame35.Name = "Frame"
Frame35.Size = UDim2.new(0.95775,0,0.95775,0)
Frame35.Position = UDim2.new(0.521125,0,0.478875,0)
Frame35.AnchorPoint = Vector2.new(0.5,0.5)
Frame35.BackgroundColor3 = Color3.fromRGB(3,148,13)
Frame35.BorderColor3 = Color3.fromRGB(0,0,0)
Frame35.BorderSizePixel = 0
Frame35.ZIndex = -1
Frame35.Parent = BG35

local Pattern31 = Instance.new("ImageLabel")
Pattern31.Name = "Pattern"
Pattern31.Size = UDim2.new(1,0,1,0)
Pattern31.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern31.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern31.BackgroundTransparency = 1
Pattern31.BorderSizePixel = 0
Pattern31.Image = "rbxassetid://92127895583355"
Pattern31.ImageColor3 = Color3.fromRGB(100,255,17)
Pattern31.ScaleType = Enum.ScaleType.Crop
Pattern31.ZIndex = -1
Pattern31.Parent = Frame35

local UIStroke339 = Instance.new("UIStroke")
UIStroke339.Name = "UIStroke"
UIStroke339.Thickness = 1.86368
UIStroke339.Parent = Pattern31

local UIGradient134 = Instance.new("UIGradient")
UIGradient134.Name = "UIGradient"
UIGradient134.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient134.Rotation = 90
UIGradient134.Offset = Vector2.new(0,0)
UIGradient134.Parent = Frame35

local UIStroke340 = Instance.new("UIStroke")
UIStroke340.Name = "UIStroke"
UIStroke340.Thickness = 4
UIStroke340.Parent = Frame35

local Highlight31 = Instance.new("Frame")
Highlight31.Name = "Highlight"
Highlight31.Size = UDim2.new(0.954203,0,0.95775,0)
Highlight31.Position = UDim2.new(0.519351,0,0.478875,0)
Highlight31.AnchorPoint = Vector2.new(0.5,0.5)
Highlight31.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight31.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight31.BorderSizePixel = 0
Highlight31.Visible = false
Highlight31.ZIndex = -2
Highlight31.Parent = BG35

local UIStroke341 = Instance.new("UIStroke")
UIStroke341.Name = "UIStroke"
UIStroke341.Color = Color3.fromRGB(255,242,0)
UIStroke341.Thickness = 2.79551
UIStroke341.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke341.Parent = Highlight31

local Item35 = Instance.new("ImageLabel")
Item35.Name = "Item"
Item35.Size = UDim2.new(0.902423,0,0.651761,0)
Item35.Position = UDim2.new(0.521125,0,0.463834,0)
Item35.AnchorPoint = Vector2.new(0.5,0.5)
Item35.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item35.BackgroundTransparency = 1
Item35.BorderSizePixel = 0
Item35.Image = "rbxassetid://94959635148921"
Item35.ImageRectOffset = Vector2.new(25,25)
Item35.ImageRectSize = Vector2.new(250,250)
Item35.ScaleType = Enum.ScaleType.Crop
Item35.Visible = false
Item35.ZIndex = -1
Item35.Parent = COM_75997631367481922502

local Unavailable105 = Instance.new("TextLabel")
Unavailable105.Name = "Unavailable"
Unavailable105.Size = UDim2.new(0.7,0,0.7,0)
Unavailable105.Position = UDim2.new(0.5,0,0.5,0)
Unavailable105.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable105.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable105.BackgroundTransparency = 1
Unavailable105.BorderSizePixel = 0
Unavailable105.Text = "Unavailable"
Unavailable105.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable105.TextSize = 14
Unavailable105.Font = Enum.Font.FredokaOne
Unavailable105.TextWrapped = true
Unavailable105.TextScaled = true
Unavailable105.Visible = false
Unavailable105.Parent = Item35

local UIStroke342 = Instance.new("UIStroke")
UIStroke342.Name = "UIStroke"
UIStroke342.Thickness = 2
UIStroke342.Parent = Unavailable105

local Pixel13 = Instance.new("ImageLabel")
Pixel13.Name = "Pixel"
Pixel13.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel13.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel13.AnchorPoint = Vector2.new(0.5,0.5)
Pixel13.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel13.BorderSizePixel = 0
Pixel13.Image = "rbxassetid://94959635148921"
Pixel13.ImageRectOffset = Vector2.new(55,100)
Pixel13.ImageRectSize = Vector2.new(30,30)
Pixel13.ScaleType = Enum.ScaleType.Crop
Pixel13.Visible = false
Pixel13.ZIndex = 5
Pixel13.Parent = COM_75997631367481922502

local Unavailable106 = Instance.new("TextLabel")
Unavailable106.Name = "Unavailable"
Unavailable106.Size = UDim2.new(0.7,0,0.7,0)
Unavailable106.Position = UDim2.new(0.5,0,0.5,0)
Unavailable106.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable106.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable106.BackgroundTransparency = 1
Unavailable106.BorderSizePixel = 0
Unavailable106.Text = "Unavailable"
Unavailable106.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable106.TextSize = 14
Unavailable106.Font = Enum.Font.FredokaOne
Unavailable106.TextWrapped = true
Unavailable106.TextScaled = true
Unavailable106.Visible = false
Unavailable106.Parent = Pixel13

local UIStroke343 = Instance.new("UIStroke")
UIStroke343.Name = "UIStroke"
UIStroke343.Thickness = 2
UIStroke343.Parent = Unavailable106

local Purchase35 = Instance.new("ImageButton")
Purchase35.Name = "Purchase"
Purchase35.Size = UDim2.new(0.863319,0,0.170445,0)
Purchase35.Position = UDim2.new(0.514166,0,0.821691,0)
Purchase35.AnchorPoint = Vector2.new(0.5,0.5)
Purchase35.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase35.BorderSizePixel = 0
Purchase35.ScaleType = Enum.ScaleType.Fit
Purchase35.AutoButtonColor = false
Purchase35.ZIndex = 6
Purchase35.Parent = COM_75997631367481922502

local Price35 = Instance.new("TextLabel")
Price35.Name = "Price"
Price35.Size = UDim2.new(0.78479,0,0.702682,0)
Price35.Position = UDim2.new(0.100663,0,0.0990811,0)
Price35.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price35.BackgroundTransparency = 1
Price35.BorderSizePixel = 0
Price35.Text = "$19.99"
Price35.TextColor3 = Color3.fromRGB(255,255,255)
Price35.TextSize = 14
Price35.Font = Enum.Font.Arcade
Price35.TextWrapped = true
Price35.TextScaled = true
Price35.RichText = true
Price35.AutomaticSize = Enum.AutomaticSize.X
Price35.Parent = Purchase35

local UIGradient135 = Instance.new("UIGradient")
UIGradient135.Name = "UIGradient"
UIGradient135.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient135.Rotation = -90
UIGradient135.Offset = Vector2.new(0,0)
UIGradient135.Parent = Price35

local UIStroke344 = Instance.new("UIStroke")
UIStroke344.Name = "UIStroke"
UIStroke344.Thickness = 2
UIStroke344.Parent = Price35

local UICorner36 = Instance.new("UICorner")
UICorner36.Name = "UICorner"
UICorner36.CornerRadius = UDim.new(1,0)
UICorner36.Parent = Purchase35

local UIGradient136 = Instance.new("UIGradient")
UIGradient136.Name = "UIGradient"
UIGradient136.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient136.Rotation = -90
UIGradient136.Offset = Vector2.new(0,0)
UIGradient136.Parent = Purchase35

local UIScale51 = Instance.new("UIScale")
UIScale51.Name = "UIScale"
UIScale51.Parent = Purchase35

local UIStroke345 = Instance.new("UIStroke")
UIStroke345.Name = "UIStroke"
UIStroke345.Thickness = 2.5
UIStroke345.Parent = Purchase35

local Thumbnail59 = Instance.new("ImageLabel")
Thumbnail59.Name = "Thumbnail"
Thumbnail59.Size = UDim2.new(1.03177,0,0.875373,0)
Thumbnail59.Position = UDim2.new(0.511832,0,0.372283,0)
Thumbnail59.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail59.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail59.BackgroundTransparency = 1
Thumbnail59.BorderSizePixel = 0
Thumbnail59.Image = "rbxassetid://101802931116457"
Thumbnail59.ScaleType = Enum.ScaleType.Fit
Thumbnail59.ZIndex = -1
Thumbnail59.Parent = COM_75997631367481922502

local Unavailable107 = Instance.new("TextLabel")
Unavailable107.Name = "Unavailable"
Unavailable107.Size = UDim2.new(0.7,0,0.7,0)
Unavailable107.Position = UDim2.new(0.5,0,0.5,0)
Unavailable107.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable107.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable107.BackgroundTransparency = 1
Unavailable107.BorderSizePixel = 0
Unavailable107.Text = "Unavailable"
Unavailable107.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable107.TextSize = 14
Unavailable107.Font = Enum.Font.FredokaOne
Unavailable107.TextWrapped = true
Unavailable107.TextScaled = true
Unavailable107.Visible = false
Unavailable107.Parent = Thumbnail59

local UIStroke346 = Instance.new("UIStroke")
UIStroke346.Name = "UIStroke"
UIStroke346.Thickness = 2
UIStroke346.Parent = Unavailable107

local Title35 = Instance.new("TextLabel")
Title35.Name = "Title"
Title35.Size = UDim2.new(0.874784,0,0.149,0)
Title35.Position = UDim2.new(0.531264,0,0.0306123,0)
Title35.AnchorPoint = Vector2.new(0.5,0)
Title35.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title35.BackgroundTransparency = 1
Title35.BorderSizePixel = 0
Title35.Text = "Bobette 11” x 14” Poster"
Title35.TextColor3 = Color3.fromRGB(0,0,0)
Title35.TextSize = 29
Title35.Font = Enum.Font.Arcade
Title35.TextXAlignment = Enum.TextXAlignment.Left
Title35.TextYAlignment = Enum.TextYAlignment.Top
Title35.TextWrapped = true
Title35.TextScaled = true
Title35.RichText = true
Title35.Visible = false
Title35.AutomaticSize = Enum.AutomaticSize.X
Title35.Parent = COM_75997631367481922502

local UITextSizeConstraint16 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint16.Name = "UITextSizeConstraint"
UITextSizeConstraint16.MaxTextSize = 29
UITextSizeConstraint16.Parent = Title35

local UIListLayout20 = Instance.new("UIListLayout")
UIListLayout20.Name = "UIListLayout"
UIListLayout20.Padding = UDim.new(0.019,0)
UIListLayout20.FillDirection = Enum.FillDirection.Horizontal
UIListLayout20.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout20.Wraps = false
UIListLayout20.Parent = Special18

local Row2 = Instance.new("Frame")
Row2.Name = "Row"
Row2.Size = UDim2.new(1,0,0.618953,0)
Row2.Position = UDim2.new(-5.82348e-08,0,-0.528551,0)
Row2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Row2.BackgroundTransparency = 1
Row2.BorderColor3 = Color3.fromRGB(0,0,0)
Row2.BorderSizePixel = 0
Row2.LayoutOrder = -2
Row2.Parent = ScrollingFrame

local Template4 = Instance.new("Frame")
Template4.Name = "Template"
Template4.Size = UDim2.new(0.31602,0,0.944677,0)
Template4.Position = UDim2.new(6.27232e-08,0,-0.0531514,0)
Template4.BackgroundColor3 = Color3.fromRGB(255,225,0)
Template4.BackgroundTransparency = 1
Template4.BorderColor3 = Color3.fromRGB(0,0,0)
Template4.BorderSizePixel = 0
Template4.Parent = Row2

local BG36 = Instance.new("Frame")
BG36.Name = "BG"
BG36.Size = UDim2.new(1,0,1,0)
BG36.Position = UDim2.new(0.5,0,0.5,0)
BG36.AnchorPoint = Vector2.new(0.5,0.5)
BG36.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG36.BackgroundTransparency = 1
BG36.BorderColor3 = Color3.fromRGB(0,0,0)
BG36.BorderSizePixel = 0
BG36.ZIndex = -1
BG36.Parent = Template4

local Dropshadow35 = Instance.new("Frame")
Dropshadow35.Name = "Dropshadow"
Dropshadow35.Size = UDim2.new(0.940524,0,0.940524,0)
Dropshadow35.Position = UDim2.new(0,0,1,0)
Dropshadow35.AnchorPoint = Vector2.new(0,1)
Dropshadow35.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow35.BackgroundTransparency = 0.5
Dropshadow35.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow35.BorderSizePixel = 0
Dropshadow35.ZIndex = -2
Dropshadow35.Parent = BG36

local Frame36 = Instance.new("Frame")
Frame36.Name = "Frame"
Frame36.Size = UDim2.new(0.95775,0,0.95775,0)
Frame36.Position = UDim2.new(0.521125,0,0.478875,0)
Frame36.AnchorPoint = Vector2.new(0.5,0.5)
Frame36.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame36.BorderColor3 = Color3.fromRGB(0,0,0)
Frame36.BorderSizePixel = 0
Frame36.ZIndex = -1
Frame36.Parent = BG36

local UIStroke347 = Instance.new("UIStroke")
UIStroke347.Name = "UIStroke"
UIStroke347.Thickness = 4
UIStroke347.Parent = Frame36

local Item210 = Instance.new("ImageLabel")
Item210.Name = "Item2"
Item210.Size = UDim2.new(0.902423,0,0.651761,0)
Item210.Position = UDim2.new(0.521125,0,0.463834,0)
Item210.AnchorPoint = Vector2.new(0.5,0.5)
Item210.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item210.BackgroundTransparency = 1
Item210.BorderSizePixel = 0
Item210.Image = "rbxassetid://94959635148921"
Item210.ImageRectOffset = Vector2.new(25,25)
Item210.ImageRectSize = Vector2.new(250,250)
Item210.ScaleType = Enum.ScaleType.Crop
Item210.Visible = false
Item210.ZIndex = -1
Item210.Parent = Template4

local Unavailable108 = Instance.new("TextLabel")
Unavailable108.Name = "Unavailable"
Unavailable108.Size = UDim2.new(0.7,0,0.7,0)
Unavailable108.Position = UDim2.new(0.5,0,0.5,0)
Unavailable108.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable108.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable108.BackgroundTransparency = 1
Unavailable108.BorderSizePixel = 0
Unavailable108.Text = "Unavailable"
Unavailable108.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable108.TextSize = 14
Unavailable108.Font = Enum.Font.FredokaOne
Unavailable108.TextWrapped = true
Unavailable108.TextScaled = true
Unavailable108.Visible = false
Unavailable108.Parent = Item210

local UIStroke348 = Instance.new("UIStroke")
UIStroke348.Name = "UIStroke"
UIStroke348.Thickness = 2
UIStroke348.Parent = Unavailable108

local Pixel14 = Instance.new("ImageLabel")
Pixel14.Name = "Pixel"
Pixel14.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel14.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel14.AnchorPoint = Vector2.new(0.5,0.5)
Pixel14.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel14.BorderSizePixel = 0
Pixel14.Image = "rbxassetid://94959635148921"
Pixel14.ImageRectOffset = Vector2.new(55,100)
Pixel14.ImageRectSize = Vector2.new(30,30)
Pixel14.ScaleType = Enum.ScaleType.Crop
Pixel14.Visible = false
Pixel14.ZIndex = 5
Pixel14.Parent = Template4

local Unavailable109 = Instance.new("TextLabel")
Unavailable109.Name = "Unavailable"
Unavailable109.Size = UDim2.new(0.7,0,0.7,0)
Unavailable109.Position = UDim2.new(0.5,0,0.5,0)
Unavailable109.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable109.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable109.BackgroundTransparency = 1
Unavailable109.BorderSizePixel = 0
Unavailable109.Text = "Unavailable"
Unavailable109.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable109.TextSize = 14
Unavailable109.Font = Enum.Font.FredokaOne
Unavailable109.TextWrapped = true
Unavailable109.TextScaled = true
Unavailable109.Visible = false
Unavailable109.Parent = Pixel14

local UIStroke349 = Instance.new("UIStroke")
UIStroke349.Name = "UIStroke"
UIStroke349.Thickness = 2
UIStroke349.Parent = Unavailable109

local Purchase36 = Instance.new("ImageButton")
Purchase36.Name = "Purchase"
Purchase36.Size = UDim2.new(0.902423,0,0.116761,0)
Purchase36.Position = UDim2.new(0.521125,0,0.866764,0)
Purchase36.AnchorPoint = Vector2.new(0.5,0.5)
Purchase36.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase36.BorderSizePixel = 0
Purchase36.ScaleType = Enum.ScaleType.Fit
Purchase36.AutoButtonColor = false
Purchase36.Active = false
Purchase36.Parent = Template4

local Price36 = Instance.new("TextLabel")
Price36.Name = "Price"
Price36.Size = UDim2.new(0.78479,0,0.702682,0)
Price36.Position = UDim2.new(0.100663,0,0.0990811,0)
Price36.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price36.BackgroundTransparency = 1
Price36.BorderSizePixel = 0
Price36.Text = "$19.99"
Price36.TextColor3 = Color3.fromRGB(255,255,255)
Price36.TextSize = 14
Price36.Font = Enum.Font.Arcade
Price36.TextWrapped = true
Price36.TextScaled = true
Price36.RichText = true
Price36.AutomaticSize = Enum.AutomaticSize.X
Price36.Parent = Purchase36

local UIGradient137 = Instance.new("UIGradient")
UIGradient137.Name = "UIGradient"
UIGradient137.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient137.Rotation = -90
UIGradient137.Offset = Vector2.new(0,0)
UIGradient137.Parent = Price36

local UIStroke350 = Instance.new("UIStroke")
UIStroke350.Name = "UIStroke"
UIStroke350.Thickness = 2
UIStroke350.Parent = Price36

local UICorner37 = Instance.new("UICorner")
UICorner37.Name = "UICorner"
UICorner37.CornerRadius = UDim.new(1,0)
UICorner37.Parent = Purchase36

local UIGradient138 = Instance.new("UIGradient")
UIGradient138.Name = "UIGradient"
UIGradient138.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient138.Rotation = -90
UIGradient138.Offset = Vector2.new(0,0)
UIGradient138.Parent = Purchase36

local UIStroke351 = Instance.new("UIStroke")
UIStroke351.Name = "UIStroke"
UIStroke351.Thickness = 2.5
UIStroke351.Parent = Purchase36

local Title36 = Instance.new("TextLabel")
Title36.Name = "Title"
Title36.Size = UDim2.new(0.854506,0,0.108842,0)
Title36.Position = UDim2.new(0.521125,0,0.0306124,0)
Title36.AnchorPoint = Vector2.new(0.5,0)
Title36.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title36.BackgroundTransparency = 1
Title36.BorderSizePixel = 0
Title36.Text = "COM-1172018676341932478"
Title36.TextColor3 = Color3.fromRGB(0,0,0)
Title36.TextSize = 29
Title36.Font = Enum.Font.Arcade
Title36.TextXAlignment = Enum.TextXAlignment.Left
Title36.TextYAlignment = Enum.TextYAlignment.Top
Title36.TextWrapped = true
Title36.TextScaled = true
Title36.RichText = true
Title36.AutomaticSize = Enum.AutomaticSize.X
Title36.Parent = Template4

local UITextSizeConstraint17 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint17.Name = "UITextSizeConstraint"
UITextSizeConstraint17.MaxTextSize = 29
UITextSizeConstraint17.Parent = Title36

local UIAspectRatioConstraint18 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint18.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint18.AspectRatio = 0.76
UIAspectRatioConstraint18.Parent = Template4

local Template5 = Instance.new("Frame")
Template5.Name = "Template"
Template5.Size = UDim2.new(0.31602,0,0.944677,0)
Template5.Position = UDim2.new(0.672173,0,-0.0531514,0)
Template5.BackgroundColor3 = Color3.fromRGB(255,225,0)
Template5.BackgroundTransparency = 1
Template5.BorderColor3 = Color3.fromRGB(0,0,0)
Template5.BorderSizePixel = 0
Template5.Parent = Row2

local BG37 = Instance.new("Frame")
BG37.Name = "BG"
BG37.Size = UDim2.new(1,0,1,0)
BG37.Position = UDim2.new(0.5,0,0.5,0)
BG37.AnchorPoint = Vector2.new(0.5,0.5)
BG37.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG37.BackgroundTransparency = 1
BG37.BorderColor3 = Color3.fromRGB(0,0,0)
BG37.BorderSizePixel = 0
BG37.ZIndex = -1
BG37.Parent = Template5

local Dropshadow36 = Instance.new("Frame")
Dropshadow36.Name = "Dropshadow"
Dropshadow36.Size = UDim2.new(0.940524,0,0.940524,0)
Dropshadow36.Position = UDim2.new(0,0,1,0)
Dropshadow36.AnchorPoint = Vector2.new(0,1)
Dropshadow36.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow36.BackgroundTransparency = 0.5
Dropshadow36.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow36.BorderSizePixel = 0
Dropshadow36.ZIndex = -2
Dropshadow36.Parent = BG37

local Frame37 = Instance.new("Frame")
Frame37.Name = "Frame"
Frame37.Size = UDim2.new(0.95775,0,0.95775,0)
Frame37.Position = UDim2.new(0.521125,0,0.478875,0)
Frame37.AnchorPoint = Vector2.new(0.5,0.5)
Frame37.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame37.BorderColor3 = Color3.fromRGB(0,0,0)
Frame37.BorderSizePixel = 0
Frame37.ZIndex = -1
Frame37.Parent = BG37

local UIStroke352 = Instance.new("UIStroke")
UIStroke352.Name = "UIStroke"
UIStroke352.Thickness = 4
UIStroke352.Parent = Frame37

local Item211 = Instance.new("ImageLabel")
Item211.Name = "Item2"
Item211.Size = UDim2.new(0.902423,0,0.651761,0)
Item211.Position = UDim2.new(0.521125,0,0.463834,0)
Item211.AnchorPoint = Vector2.new(0.5,0.5)
Item211.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item211.BackgroundTransparency = 1
Item211.BorderSizePixel = 0
Item211.Image = "rbxassetid://94959635148921"
Item211.ImageRectOffset = Vector2.new(25,25)
Item211.ImageRectSize = Vector2.new(250,250)
Item211.ScaleType = Enum.ScaleType.Crop
Item211.Visible = false
Item211.ZIndex = -1
Item211.Parent = Template5

local Unavailable110 = Instance.new("TextLabel")
Unavailable110.Name = "Unavailable"
Unavailable110.Size = UDim2.new(0.7,0,0.7,0)
Unavailable110.Position = UDim2.new(0.5,0,0.5,0)
Unavailable110.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable110.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable110.BackgroundTransparency = 1
Unavailable110.BorderSizePixel = 0
Unavailable110.Text = "Unavailable"
Unavailable110.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable110.TextSize = 14
Unavailable110.Font = Enum.Font.FredokaOne
Unavailable110.TextWrapped = true
Unavailable110.TextScaled = true
Unavailable110.Visible = false
Unavailable110.Parent = Item211

local UIStroke353 = Instance.new("UIStroke")
UIStroke353.Name = "UIStroke"
UIStroke353.Thickness = 2
UIStroke353.Parent = Unavailable110

local Pixel15 = Instance.new("ImageLabel")
Pixel15.Name = "Pixel"
Pixel15.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel15.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel15.AnchorPoint = Vector2.new(0.5,0.5)
Pixel15.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel15.BorderSizePixel = 0
Pixel15.Image = "rbxassetid://94959635148921"
Pixel15.ImageRectOffset = Vector2.new(55,100)
Pixel15.ImageRectSize = Vector2.new(30,30)
Pixel15.ScaleType = Enum.ScaleType.Crop
Pixel15.Visible = false
Pixel15.ZIndex = 5
Pixel15.Parent = Template5

local Unavailable111 = Instance.new("TextLabel")
Unavailable111.Name = "Unavailable"
Unavailable111.Size = UDim2.new(0.7,0,0.7,0)
Unavailable111.Position = UDim2.new(0.5,0,0.5,0)
Unavailable111.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable111.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable111.BackgroundTransparency = 1
Unavailable111.BorderSizePixel = 0
Unavailable111.Text = "Unavailable"
Unavailable111.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable111.TextSize = 14
Unavailable111.Font = Enum.Font.FredokaOne
Unavailable111.TextWrapped = true
Unavailable111.TextScaled = true
Unavailable111.Visible = false
Unavailable111.Parent = Pixel15

local UIStroke354 = Instance.new("UIStroke")
UIStroke354.Name = "UIStroke"
UIStroke354.Thickness = 2
UIStroke354.Parent = Unavailable111

local Purchase37 = Instance.new("ImageButton")
Purchase37.Name = "Purchase"
Purchase37.Size = UDim2.new(0.902423,0,0.116761,0)
Purchase37.Position = UDim2.new(0.521125,0,0.866764,0)
Purchase37.AnchorPoint = Vector2.new(0.5,0.5)
Purchase37.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase37.BorderSizePixel = 0
Purchase37.ScaleType = Enum.ScaleType.Fit
Purchase37.AutoButtonColor = false
Purchase37.Active = false
Purchase37.Parent = Template5

local Price37 = Instance.new("TextLabel")
Price37.Name = "Price"
Price37.Size = UDim2.new(0.78479,0,0.702682,0)
Price37.Position = UDim2.new(0.100663,0,0.0990811,0)
Price37.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price37.BackgroundTransparency = 1
Price37.BorderSizePixel = 0
Price37.Text = "$19.99"
Price37.TextColor3 = Color3.fromRGB(255,255,255)
Price37.TextSize = 14
Price37.Font = Enum.Font.Arcade
Price37.TextWrapped = true
Price37.TextScaled = true
Price37.RichText = true
Price37.AutomaticSize = Enum.AutomaticSize.X
Price37.Parent = Purchase37

local UIGradient139 = Instance.new("UIGradient")
UIGradient139.Name = "UIGradient"
UIGradient139.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient139.Rotation = -90
UIGradient139.Offset = Vector2.new(0,0)
UIGradient139.Parent = Price37

local UIStroke355 = Instance.new("UIStroke")
UIStroke355.Name = "UIStroke"
UIStroke355.Thickness = 2
UIStroke355.Parent = Price37

local UICorner38 = Instance.new("UICorner")
UICorner38.Name = "UICorner"
UICorner38.CornerRadius = UDim.new(1,0)
UICorner38.Parent = Purchase37

local UIGradient140 = Instance.new("UIGradient")
UIGradient140.Name = "UIGradient"
UIGradient140.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient140.Rotation = -90
UIGradient140.Offset = Vector2.new(0,0)
UIGradient140.Parent = Purchase37

local UIStroke356 = Instance.new("UIStroke")
UIStroke356.Name = "UIStroke"
UIStroke356.Thickness = 2.5
UIStroke356.Parent = Purchase37

local Title37 = Instance.new("TextLabel")
Title37.Name = "Title"
Title37.Size = UDim2.new(0.854506,0,0.108842,0)
Title37.Position = UDim2.new(0.521125,0,0.0306124,0)
Title37.AnchorPoint = Vector2.new(0.5,0)
Title37.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title37.BackgroundTransparency = 1
Title37.BorderSizePixel = 0
Title37.Text = "COM-8161690335689048493"
Title37.TextColor3 = Color3.fromRGB(0,0,0)
Title37.TextSize = 29
Title37.Font = Enum.Font.Arcade
Title37.TextXAlignment = Enum.TextXAlignment.Left
Title37.TextYAlignment = Enum.TextYAlignment.Top
Title37.TextWrapped = true
Title37.TextScaled = true
Title37.RichText = true
Title37.AutomaticSize = Enum.AutomaticSize.X
Title37.Parent = Template5

local UITextSizeConstraint18 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint18.Name = "UITextSizeConstraint"
UITextSizeConstraint18.MaxTextSize = 29
UITextSizeConstraint18.Parent = Title37

local UIAspectRatioConstraint19 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint19.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint19.AspectRatio = 0.76
UIAspectRatioConstraint19.Parent = Template5

local Template6 = Instance.new("Frame")
Template6.Name = "Template"
Template6.Size = UDim2.new(0.31602,0,0.944677,0)
Template6.Position = UDim2.new(0.336087,0,-0.0531514,0)
Template6.BackgroundColor3 = Color3.fromRGB(255,225,0)
Template6.BackgroundTransparency = 1
Template6.BorderColor3 = Color3.fromRGB(0,0,0)
Template6.BorderSizePixel = 0
Template6.Parent = Row2

local BG38 = Instance.new("Frame")
BG38.Name = "BG"
BG38.Size = UDim2.new(1,0,1,0)
BG38.Position = UDim2.new(0.5,0,0.5,0)
BG38.AnchorPoint = Vector2.new(0.5,0.5)
BG38.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG38.BackgroundTransparency = 1
BG38.BorderColor3 = Color3.fromRGB(0,0,0)
BG38.BorderSizePixel = 0
BG38.ZIndex = -1
BG38.Parent = Template6

local Dropshadow37 = Instance.new("Frame")
Dropshadow37.Name = "Dropshadow"
Dropshadow37.Size = UDim2.new(0.940524,0,0.940524,0)
Dropshadow37.Position = UDim2.new(0,0,1,0)
Dropshadow37.AnchorPoint = Vector2.new(0,1)
Dropshadow37.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow37.BackgroundTransparency = 0.5
Dropshadow37.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow37.BorderSizePixel = 0
Dropshadow37.ZIndex = -2
Dropshadow37.Parent = BG38

local Frame38 = Instance.new("Frame")
Frame38.Name = "Frame"
Frame38.Size = UDim2.new(0.95775,0,0.95775,0)
Frame38.Position = UDim2.new(0.521125,0,0.478875,0)
Frame38.AnchorPoint = Vector2.new(0.5,0.5)
Frame38.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame38.BorderColor3 = Color3.fromRGB(0,0,0)
Frame38.BorderSizePixel = 0
Frame38.ZIndex = -1
Frame38.Parent = BG38

local UIStroke357 = Instance.new("UIStroke")
UIStroke357.Name = "UIStroke"
UIStroke357.Thickness = 4
UIStroke357.Parent = Frame38

local Item212 = Instance.new("ImageLabel")
Item212.Name = "Item2"
Item212.Size = UDim2.new(0.902423,0,0.651761,0)
Item212.Position = UDim2.new(0.521125,0,0.463834,0)
Item212.AnchorPoint = Vector2.new(0.5,0.5)
Item212.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item212.BackgroundTransparency = 1
Item212.BorderSizePixel = 0
Item212.Image = "rbxassetid://138096832706650"
Item212.ImageRectOffset = Vector2.new(25,25)
Item212.ImageRectSize = Vector2.new(700,700)
Item212.ScaleType = Enum.ScaleType.Fit
Item212.Visible = false
Item212.ZIndex = -1
Item212.Parent = Template6

local Unavailable112 = Instance.new("TextLabel")
Unavailable112.Name = "Unavailable"
Unavailable112.Size = UDim2.new(0.7,0,0.7,0)
Unavailable112.Position = UDim2.new(0.5,0,0.5,0)
Unavailable112.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable112.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable112.BackgroundTransparency = 1
Unavailable112.BorderSizePixel = 0
Unavailable112.Text = "Unavailable"
Unavailable112.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable112.TextSize = 14
Unavailable112.Font = Enum.Font.FredokaOne
Unavailable112.TextWrapped = true
Unavailable112.TextScaled = true
Unavailable112.Visible = false
Unavailable112.Parent = Item212

local UIStroke358 = Instance.new("UIStroke")
UIStroke358.Name = "UIStroke"
UIStroke358.Thickness = 2
UIStroke358.Parent = Unavailable112

local Pixel16 = Instance.new("ImageLabel")
Pixel16.Name = "Pixel"
Pixel16.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel16.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel16.AnchorPoint = Vector2.new(0.5,0.5)
Pixel16.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel16.BorderSizePixel = 0
Pixel16.Image = "rbxassetid://94959635148921"
Pixel16.ImageRectOffset = Vector2.new(55,100)
Pixel16.ImageRectSize = Vector2.new(30,30)
Pixel16.ScaleType = Enum.ScaleType.Crop
Pixel16.Visible = false
Pixel16.ZIndex = 5
Pixel16.Parent = Template6

local Unavailable113 = Instance.new("TextLabel")
Unavailable113.Name = "Unavailable"
Unavailable113.Size = UDim2.new(0.7,0,0.7,0)
Unavailable113.Position = UDim2.new(0.5,0,0.5,0)
Unavailable113.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable113.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable113.BackgroundTransparency = 1
Unavailable113.BorderSizePixel = 0
Unavailable113.Text = "Unavailable"
Unavailable113.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable113.TextSize = 14
Unavailable113.Font = Enum.Font.FredokaOne
Unavailable113.TextWrapped = true
Unavailable113.TextScaled = true
Unavailable113.Visible = false
Unavailable113.Parent = Pixel16

local UIStroke359 = Instance.new("UIStroke")
UIStroke359.Name = "UIStroke"
UIStroke359.Thickness = 2
UIStroke359.Parent = Unavailable113

local Purchase38 = Instance.new("ImageButton")
Purchase38.Name = "Purchase"
Purchase38.Size = UDim2.new(0.902423,0,0.116761,0)
Purchase38.Position = UDim2.new(0.521125,0,0.866764,0)
Purchase38.AnchorPoint = Vector2.new(0.5,0.5)
Purchase38.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase38.BorderSizePixel = 0
Purchase38.ScaleType = Enum.ScaleType.Fit
Purchase38.AutoButtonColor = false
Purchase38.Active = false
Purchase38.Parent = Template6

local Price38 = Instance.new("TextLabel")
Price38.Name = "Price"
Price38.Size = UDim2.new(0.78479,0,0.702682,0)
Price38.Position = UDim2.new(0.100663,0,0.0990811,0)
Price38.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price38.BackgroundTransparency = 1
Price38.BorderSizePixel = 0
Price38.Text = "$19.99"
Price38.TextColor3 = Color3.fromRGB(255,255,255)
Price38.TextSize = 14
Price38.Font = Enum.Font.Arcade
Price38.TextWrapped = true
Price38.TextScaled = true
Price38.RichText = true
Price38.AutomaticSize = Enum.AutomaticSize.X
Price38.Parent = Purchase38

local UIGradient141 = Instance.new("UIGradient")
UIGradient141.Name = "UIGradient"
UIGradient141.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient141.Rotation = -90
UIGradient141.Offset = Vector2.new(0,0)
UIGradient141.Parent = Price38

local UIStroke360 = Instance.new("UIStroke")
UIStroke360.Name = "UIStroke"
UIStroke360.Thickness = 2
UIStroke360.Parent = Price38

local UICorner39 = Instance.new("UICorner")
UICorner39.Name = "UICorner"
UICorner39.CornerRadius = UDim.new(1,0)
UICorner39.Parent = Purchase38

local UIGradient142 = Instance.new("UIGradient")
UIGradient142.Name = "UIGradient"
UIGradient142.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient142.Rotation = -90
UIGradient142.Offset = Vector2.new(0,0)
UIGradient142.Parent = Purchase38

local UIStroke361 = Instance.new("UIStroke")
UIStroke361.Name = "UIStroke"
UIStroke361.Thickness = 2.5
UIStroke361.Parent = Purchase38

local Title38 = Instance.new("TextLabel")
Title38.Name = "Title"
Title38.Size = UDim2.new(0.854506,0,0.108842,0)
Title38.Position = UDim2.new(0.521125,0,0.0306124,0)
Title38.AnchorPoint = Vector2.new(0.5,0)
Title38.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title38.BackgroundTransparency = 1
Title38.BorderSizePixel = 0
Title38.Text = "COM-3064917379272933809"
Title38.TextColor3 = Color3.fromRGB(0,0,0)
Title38.TextSize = 29
Title38.Font = Enum.Font.Arcade
Title38.TextXAlignment = Enum.TextXAlignment.Left
Title38.TextYAlignment = Enum.TextYAlignment.Top
Title38.TextWrapped = true
Title38.TextScaled = true
Title38.RichText = true
Title38.AutomaticSize = Enum.AutomaticSize.X
Title38.Parent = Template6

local UITextSizeConstraint19 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint19.Name = "UITextSizeConstraint"
UITextSizeConstraint19.MaxTextSize = 29
UITextSizeConstraint19.Parent = Title38

local UIAspectRatioConstraint20 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint20.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint20.AspectRatio = 0.76
UIAspectRatioConstraint20.Parent = Template6

local UIListLayout21 = Instance.new("UIListLayout")
UIListLayout21.Name = "UIListLayout"
UIListLayout21.Padding = UDim.new(0.019,0)
UIListLayout21.FillDirection = Enum.FillDirection.Horizontal
UIListLayout21.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout21.Wraps = false
UIListLayout21.Parent = Row2

local Special19 = Instance.new("Frame")
Special19.Name = "Special"
Special19.Size = UDim2.new(1.10498,0,0.439953,0)
Special19.Position = UDim2.new(0,0,-0.143337,0)
Special19.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special19.BackgroundTransparency = 1
Special19.BorderColor3 = Color3.fromRGB(0,0,0)
Special19.BorderSizePixel = 0
Special19.LayoutOrder = -2
Special19.Parent = ScrollingFrame

local COM_7777933156794761646 = Instance.new("Frame")
COM_7777933156794761646.Name = "COM-7777933156794761646"
COM_7777933156794761646.Size = UDim2.new(0.894307,0,0.931111,0)
COM_7777933156794761646.Position = UDim2.new(-5.79236e-08,0,0,0)
COM_7777933156794761646.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_7777933156794761646.BackgroundTransparency = 1
COM_7777933156794761646.BorderColor3 = Color3.fromRGB(0,0,0)
COM_7777933156794761646.BorderSizePixel = 0
COM_7777933156794761646.Parent = Special19

local BG39 = Instance.new("Frame")
BG39.Name = "BG"
BG39.Size = UDim2.new(1,0,1,0)
BG39.Position = UDim2.new(0.5,0,0.5,0)
BG39.AnchorPoint = Vector2.new(0.5,0.5)
BG39.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG39.BackgroundTransparency = 1
BG39.BorderColor3 = Color3.fromRGB(0,0,0)
BG39.BorderSizePixel = 0
BG39.ZIndex = -1
BG39.Parent = COM_7777933156794761646

local Dropshadow38 = Instance.new("Frame")
Dropshadow38.Name = "Dropshadow"
Dropshadow38.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow38.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow38.AnchorPoint = Vector2.new(0,1)
Dropshadow38.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow38.BackgroundTransparency = 0.5
Dropshadow38.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow38.BorderSizePixel = 0
Dropshadow38.ZIndex = -2
Dropshadow38.Parent = BG39

local UIStroke362 = Instance.new("UIStroke")
UIStroke362.Name = "UIStroke"
UIStroke362.Thickness = 2.79551
UIStroke362.Transparency = 1
UIStroke362.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke362.Parent = Dropshadow38

local Frame39 = Instance.new("Frame")
Frame39.Name = "Frame"
Frame39.Size = UDim2.new(0.984612,0,0.95775,0)
Frame39.Position = UDim2.new(0.506631,0,0.478875,0)
Frame39.AnchorPoint = Vector2.new(0.5,0.5)
Frame39.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame39.BorderColor3 = Color3.fromRGB(0,0,0)
Frame39.BorderSizePixel = 0
Frame39.ZIndex = -1
Frame39.Parent = BG39

local Pattern32 = Instance.new("ImageLabel")
Pattern32.Name = "Pattern"
Pattern32.Size = UDim2.new(0.635249,0,1,0)
Pattern32.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern32.BackgroundTransparency = 1
Pattern32.BorderSizePixel = 0
Pattern32.Image = "rbxassetid://122640361585603"
Pattern32.ZIndex = -1
Pattern32.Parent = Frame39

local UIStroke363 = Instance.new("UIStroke")
UIStroke363.Name = "UIStroke"
UIStroke363.Thickness = 1.86368
UIStroke363.Parent = Pattern32

local UIStroke364 = Instance.new("UIStroke")
UIStroke364.Name = "UIStroke"
UIStroke364.Thickness = 1.86368
UIStroke364.Parent = Frame39

local Highlight32 = Instance.new("Frame")
Highlight32.Name = "Highlight"
Highlight32.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight32.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight32.AnchorPoint = Vector2.new(0.5,0.5)
Highlight32.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight32.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight32.BorderSizePixel = 0
Highlight32.Visible = false
Highlight32.ZIndex = -2
Highlight32.Parent = BG39

local UIStroke365 = Instance.new("UIStroke")
UIStroke365.Name = "UIStroke"
UIStroke365.Color = Color3.fromRGB(255,242,0)
UIStroke365.Thickness = 2.79551
UIStroke365.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke365.Parent = Highlight32

local CanvasGroup13 = Instance.new("CanvasGroup")
CanvasGroup13.Name = "CanvasGroup"
CanvasGroup13.Size = UDim2.new(1,0,1,0)
CanvasGroup13.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup13.BackgroundTransparency = 1
CanvasGroup13.Parent = COM_7777933156794761646

local Thumbnail60 = Instance.new("ImageLabel")
Thumbnail60.Name = "Thumbnail"
Thumbnail60.Size = UDim2.new(0.319652,0,0.833356,0)
Thumbnail60.Position = UDim2.new(0.102736,0,0.539585,0)
Thumbnail60.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail60.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail60.BackgroundTransparency = 1
Thumbnail60.BorderSizePixel = 0
Thumbnail60.Image = "rbxassetid://87651335157097"
Thumbnail60.ScaleType = Enum.ScaleType.Fit
Thumbnail60.ZIndex = 0
Thumbnail60.Rotation = -11
Thumbnail60.Parent = CanvasGroup13

local Unavailable114 = Instance.new("TextLabel")
Unavailable114.Name = "Unavailable"
Unavailable114.Size = UDim2.new(0.7,0,0.7,0)
Unavailable114.Position = UDim2.new(0.5,0,0.5,0)
Unavailable114.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable114.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable114.BackgroundTransparency = 1
Unavailable114.BorderSizePixel = 0
Unavailable114.Text = "Unavailable"
Unavailable114.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable114.TextSize = 14
Unavailable114.Font = Enum.Font.FredokaOne
Unavailable114.TextWrapped = true
Unavailable114.TextScaled = true
Unavailable114.Visible = false
Unavailable114.Parent = Thumbnail60

local UIStroke366 = Instance.new("UIStroke")
UIStroke366.Name = "UIStroke"
UIStroke366.Thickness = 2
UIStroke366.Parent = Unavailable114

local Thumbnail61 = Instance.new("ImageLabel")
Thumbnail61.Name = "Thumbnail"
Thumbnail61.Size = UDim2.new(0.319652,0,0.833356,0)
Thumbnail61.Position = UDim2.new(0.191823,0,0.468269,0)
Thumbnail61.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail61.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail61.BackgroundTransparency = 1
Thumbnail61.BorderSizePixel = 0
Thumbnail61.Image = "rbxassetid://97508659766543"
Thumbnail61.ScaleType = Enum.ScaleType.Fit
Thumbnail61.ZIndex = -1
Thumbnail61.Rotation = 16
Thumbnail61.Parent = CanvasGroup13

local Unavailable115 = Instance.new("TextLabel")
Unavailable115.Name = "Unavailable"
Unavailable115.Size = UDim2.new(0.7,0,0.7,0)
Unavailable115.Position = UDim2.new(0.5,0,0.5,0)
Unavailable115.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable115.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable115.BackgroundTransparency = 1
Unavailable115.BorderSizePixel = 0
Unavailable115.Text = "Unavailable"
Unavailable115.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable115.TextSize = 14
Unavailable115.Font = Enum.Font.FredokaOne
Unavailable115.TextWrapped = true
Unavailable115.TextScaled = true
Unavailable115.Visible = false
Unavailable115.Parent = Thumbnail61

local UIStroke367 = Instance.new("UIStroke")
UIStroke367.Name = "UIStroke"
UIStroke367.Thickness = 2
UIStroke367.Parent = Unavailable115

local Thumbnail62 = Instance.new("ImageLabel")
Thumbnail62.Name = "Thumbnail"
Thumbnail62.Size = UDim2.new(0.319652,0,0.833356,0)
Thumbnail62.Position = UDim2.new(0.350479,0,0.506057,0)
Thumbnail62.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail62.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail62.BackgroundTransparency = 1
Thumbnail62.BorderSizePixel = 0
Thumbnail62.Image = "rbxassetid://97103112524050"
Thumbnail62.ScaleType = Enum.ScaleType.Fit
Thumbnail62.ZIndex = 0
Thumbnail62.Rotation = 13
Thumbnail62.Parent = CanvasGroup13

local Unavailable116 = Instance.new("TextLabel")
Unavailable116.Name = "Unavailable"
Unavailable116.Size = UDim2.new(0.7,0,0.7,0)
Unavailable116.Position = UDim2.new(0.5,0,0.5,0)
Unavailable116.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable116.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable116.BackgroundTransparency = 1
Unavailable116.BorderSizePixel = 0
Unavailable116.Text = "Unavailable"
Unavailable116.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable116.TextSize = 14
Unavailable116.Font = Enum.Font.FredokaOne
Unavailable116.TextWrapped = true
Unavailable116.TextScaled = true
Unavailable116.Visible = false
Unavailable116.Parent = Thumbnail62

local UIStroke368 = Instance.new("UIStroke")
UIStroke368.Name = "UIStroke"
UIStroke368.Thickness = 2
UIStroke368.Parent = Unavailable116

local DisplayTitle25 = Instance.new("TextLabel")
DisplayTitle25.Name = "DisplayTitle"
DisplayTitle25.Size = UDim2.new(0.28831,0,0.367128,0)
DisplayTitle25.Position = UDim2.new(0.814632,0,0.191717,0)
DisplayTitle25.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle25.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle25.BackgroundTransparency = 1
DisplayTitle25.BorderSizePixel = 0
DisplayTitle25.Text = "Pebble 11\" Deluxe Plush (Pre-Order)"
DisplayTitle25.TextColor3 = Color3.fromRGB(0,0,0)
DisplayTitle25.TextSize = 29
DisplayTitle25.Font = Enum.Font.Arcade
DisplayTitle25.TextWrapped = true
DisplayTitle25.TextScaled = true
DisplayTitle25.RichText = true
DisplayTitle25.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle25.Parent = COM_7777933156794761646

local UIAspectRatioConstraint21 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint21.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint21.AspectRatio = 2.66
UIAspectRatioConstraint21.Parent = DisplayTitle25

local UIGradient143 = Instance.new("UIGradient")
UIGradient143.Name = "UIGradient"
UIGradient143.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient143.Rotation = -90
UIGradient143.Offset = Vector2.new(0,0)
UIGradient143.Enabled = false
UIGradient143.Parent = DisplayTitle25

local UIStroke369 = Instance.new("UIStroke")
UIStroke369.Name = "UIStroke"
UIStroke369.Color = Color3.fromRGB(255,255,255)
UIStroke369.Thickness = 0.931838
UIStroke369.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke369.Parent = DisplayTitle25

local Item36 = Instance.new("ImageLabel")
Item36.Name = "Item"
Item36.Size = UDim2.new(0.913665,0,0.651761,0)
Item36.Position = UDim2.new(0.514096,0,0.463834,0)
Item36.AnchorPoint = Vector2.new(0.5,0.5)
Item36.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item36.BackgroundTransparency = 1
Item36.BorderSizePixel = 0
Item36.Image = "rbxassetid://94959635148921"
Item36.ImageRectOffset = Vector2.new(15,15)
Item36.ImageRectSize = Vector2.new(270,270)
Item36.ScaleType = Enum.ScaleType.Fit
Item36.Visible = false
Item36.ZIndex = -1
Item36.Parent = COM_7777933156794761646

local Unavailable117 = Instance.new("TextLabel")
Unavailable117.Name = "Unavailable"
Unavailable117.Size = UDim2.new(0.7,0,0.7,0)
Unavailable117.Position = UDim2.new(0.5,0,0.5,0)
Unavailable117.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable117.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable117.BackgroundTransparency = 1
Unavailable117.BorderSizePixel = 0
Unavailable117.Text = "Unavailable"
Unavailable117.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable117.TextSize = 14
Unavailable117.Font = Enum.Font.FredokaOne
Unavailable117.TextWrapped = true
Unavailable117.TextScaled = true
Unavailable117.Visible = false
Unavailable117.Parent = Item36

local UIStroke370 = Instance.new("UIStroke")
UIStroke370.Name = "UIStroke"
UIStroke370.Thickness = 2
UIStroke370.Parent = Unavailable117

local New18 = Instance.new("ImageLabel")
New18.Name = "New"
New18.Size = UDim2.new(0.322123,0,0.355513,0)
New18.Position = UDim2.new(0.944127,0,0.0328983,0)
New18.AnchorPoint = Vector2.new(0.5,0.5)
New18.BackgroundColor3 = Color3.fromRGB(255,255,255)
New18.BackgroundTransparency = 1
New18.BorderSizePixel = 0
New18.Image = "rbxassetid://96728750855907"
New18.ScaleType = Enum.ScaleType.Fit
New18.Visible = false
New18.ZIndex = -1
New18.Parent = COM_7777933156794761646

local UIScale52 = Instance.new("UIScale")
UIScale52.Name = "UIScale"
UIScale52.Parent = New18

local Purchase39 = Instance.new("ImageButton")
Purchase39.Name = "Purchase"
Purchase39.Size = UDim2.new(0.299855,0,0.201102,0)
Purchase39.Position = UDim2.new(0.814697,0,0.786462,0)
Purchase39.AnchorPoint = Vector2.new(0.5,0.5)
Purchase39.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase39.BorderSizePixel = 0
Purchase39.ScaleType = Enum.ScaleType.Fit
Purchase39.AutoButtonColor = false
Purchase39.Parent = COM_7777933156794761646

local Price39 = Instance.new("TextLabel")
Price39.Name = "Price"
Price39.Size = UDim2.new(0.78479,0,0.702682,0)
Price39.Position = UDim2.new(0.100663,0,0.0990811,0)
Price39.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price39.BackgroundTransparency = 1
Price39.BorderSizePixel = 0
Price39.Text = "$19.99"
Price39.TextColor3 = Color3.fromRGB(255,255,255)
Price39.TextSize = 14
Price39.Font = Enum.Font.Arcade
Price39.TextWrapped = true
Price39.TextScaled = true
Price39.RichText = true
Price39.AutomaticSize = Enum.AutomaticSize.X
Price39.Parent = Purchase39

local UIGradient144 = Instance.new("UIGradient")
UIGradient144.Name = "UIGradient"
UIGradient144.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient144.Rotation = -90
UIGradient144.Offset = Vector2.new(0,0)
UIGradient144.Parent = Price39

local UIStroke371 = Instance.new("UIStroke")
UIStroke371.Name = "UIStroke"
UIStroke371.Thickness = 0.931838
UIStroke371.Parent = Price39

local UICorner40 = Instance.new("UICorner")
UICorner40.Name = "UICorner"
UICorner40.CornerRadius = UDim.new(1,0)
UICorner40.Parent = Purchase39

local UIGradient145 = Instance.new("UIGradient")
UIGradient145.Name = "UIGradient"
UIGradient145.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient145.Rotation = -90
UIGradient145.Offset = Vector2.new(0,0)
UIGradient145.Parent = Purchase39

local UIScale53 = Instance.new("UIScale")
UIScale53.Name = "UIScale"
UIScale53.Parent = Purchase39

local UIStroke372 = Instance.new("UIStroke")
UIStroke372.Name = "UIStroke"
UIStroke372.Thickness = 1.1648
UIStroke372.Parent = Purchase39

local Thumbnail63 = Instance.new("ImageLabel")
Thumbnail63.Name = "Thumbnail"
Thumbnail63.Size = UDim2.new(0.48234,0,1.2575,0)
Thumbnail63.Position = UDim2.new(0.543731,0,0.435241,0)
Thumbnail63.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail63.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail63.BackgroundTransparency = 1
Thumbnail63.BorderSizePixel = 0
Thumbnail63.Image = "rbxassetid://95518451567242"
Thumbnail63.ScaleType = Enum.ScaleType.Fit
Thumbnail63.ZIndex = -1
Thumbnail63.Parent = COM_7777933156794761646

local Unavailable118 = Instance.new("TextLabel")
Unavailable118.Name = "Unavailable"
Unavailable118.Size = UDim2.new(0.7,0,0.7,0)
Unavailable118.Position = UDim2.new(0.5,0,0.5,0)
Unavailable118.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable118.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable118.BackgroundTransparency = 1
Unavailable118.BorderSizePixel = 0
Unavailable118.Text = "Unavailable"
Unavailable118.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable118.TextSize = 14
Unavailable118.Font = Enum.Font.FredokaOne
Unavailable118.TextWrapped = true
Unavailable118.TextScaled = true
Unavailable118.Visible = false
Unavailable118.Parent = Thumbnail63

local UIStroke373 = Instance.new("UIStroke")
UIStroke373.Name = "UIStroke"
UIStroke373.Thickness = 2
UIStroke373.Parent = Unavailable118

local Title39 = Instance.new("TextLabel")
Title39.Name = "Title"
Title39.Size = UDim2.new(0.566559,0,0.435422,0)
Title39.Position = UDim2.new(0.65544,0,0.15042,0)
Title39.AnchorPoint = Vector2.new(0.5,0)
Title39.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title39.BackgroundTransparency = 1
Title39.BorderSizePixel = 0
Title39.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title39.TextColor3 = Color3.fromRGB(0,13,76)
Title39.TextSize = 29
Title39.Font = Enum.Font.Arcade
Title39.TextWrapped = true
Title39.TextScaled = true
Title39.RichText = true
Title39.Visible = false
Title39.AutomaticSize = Enum.AutomaticSize.X
Title39.Parent = COM_7777933156794761646

local UIGradient146 = Instance.new("UIGradient")
UIGradient146.Name = "UIGradient"
UIGradient146.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient146.Rotation = -90
UIGradient146.Offset = Vector2.new(0,0)
UIGradient146.Parent = Title39

local UIStroke374 = Instance.new("UIStroke")
UIStroke374.Name = "UIStroke"
UIStroke374.Color = Color3.fromRGB(255,255,255)
UIStroke374.Thickness = 2
UIStroke374.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke374.Parent = Title39

local UIListLayout22 = Instance.new("UIListLayout")
UIListLayout22.Name = "UIListLayout"
UIListLayout22.Padding = UDim.new(0.019,0)
UIListLayout22.FillDirection = Enum.FillDirection.Horizontal
UIListLayout22.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout22.Wraps = false
UIListLayout22.Parent = Special19

local Special20 = Instance.new("Frame")
Special20.Name = "Special"
Special20.Size = UDim2.new(1.10498,0,0.439953,0)
Special20.Position = UDim2.new(0,0,-0.143337,0)
Special20.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special20.BackgroundTransparency = 1
Special20.BorderColor3 = Color3.fromRGB(0,0,0)
Special20.BorderSizePixel = 0
Special20.Visible = false
Special20.LayoutOrder = -1
Special20.Parent = ScrollingFrame

local COM_5722338222113816999 = Instance.new("Frame")
COM_5722338222113816999.Name = "COM-5722338222113816999"
COM_5722338222113816999.Size = UDim2.new(0.894307,0,0.931111,0)
COM_5722338222113816999.Position = UDim2.new(-5.79236e-08,0,0,0)
COM_5722338222113816999.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_5722338222113816999.BackgroundTransparency = 1
COM_5722338222113816999.BorderColor3 = Color3.fromRGB(0,0,0)
COM_5722338222113816999.BorderSizePixel = 0
COM_5722338222113816999.Parent = Special20

local BG40 = Instance.new("Frame")
BG40.Name = "BG"
BG40.Size = UDim2.new(1,0,1,0)
BG40.Position = UDim2.new(0.5,0,0.5,0)
BG40.AnchorPoint = Vector2.new(0.5,0.5)
BG40.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG40.BackgroundTransparency = 1
BG40.BorderColor3 = Color3.fromRGB(0,0,0)
BG40.BorderSizePixel = 0
BG40.ZIndex = -1
BG40.Parent = COM_5722338222113816999

local Dropshadow39 = Instance.new("Frame")
Dropshadow39.Name = "Dropshadow"
Dropshadow39.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow39.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow39.AnchorPoint = Vector2.new(0,1)
Dropshadow39.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow39.BackgroundTransparency = 0.5
Dropshadow39.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow39.BorderSizePixel = 0
Dropshadow39.ZIndex = -2
Dropshadow39.Parent = BG40

local UIStroke375 = Instance.new("UIStroke")
UIStroke375.Name = "UIStroke"
UIStroke375.Thickness = 2.79551
UIStroke375.Transparency = 1
UIStroke375.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke375.Parent = Dropshadow39

local Frame40 = Instance.new("Frame")
Frame40.Name = "Frame"
Frame40.Size = UDim2.new(0.984612,0,0.95775,0)
Frame40.Position = UDim2.new(0.506631,0,0.478875,0)
Frame40.AnchorPoint = Vector2.new(0.5,0.5)
Frame40.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame40.BorderColor3 = Color3.fromRGB(0,0,0)
Frame40.BorderSizePixel = 0
Frame40.ZIndex = -1
Frame40.Parent = BG40

local Pattern33 = Instance.new("ImageLabel")
Pattern33.Name = "Pattern"
Pattern33.Size = UDim2.new(0.584611,0,1,0)
Pattern33.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern33.BackgroundTransparency = 1
Pattern33.BorderSizePixel = 0
Pattern33.Image = "rbxassetid://104066119238656"
Pattern33.ZIndex = -1
Pattern33.Parent = Frame40

local UIStroke376 = Instance.new("UIStroke")
UIStroke376.Name = "UIStroke"
UIStroke376.Thickness = 1.86368
UIStroke376.Parent = Pattern33

local Pattern34 = Instance.new("ImageLabel")
Pattern34.Name = "Pattern"
Pattern34.Size = UDim2.new(0.416469,0,1,0)
Pattern34.Position = UDim2.new(0.584611,0,0,0)
Pattern34.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern34.BackgroundTransparency = 1
Pattern34.BorderSizePixel = 0
Pattern34.Image = "rbxassetid://104066119238656"
Pattern34.ImageColor3 = Color3.fromRGB(38,38,38)
Pattern34.ZIndex = -1
Pattern34.Parent = Frame40

local UIStroke377 = Instance.new("UIStroke")
UIStroke377.Name = "UIStroke"
UIStroke377.Thickness = 1.86368
UIStroke377.Parent = Pattern34

local UIStroke378 = Instance.new("UIStroke")
UIStroke378.Name = "UIStroke"
UIStroke378.Thickness = 1.86368
UIStroke378.Parent = Frame40

local Highlight33 = Instance.new("Frame")
Highlight33.Name = "Highlight"
Highlight33.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight33.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight33.AnchorPoint = Vector2.new(0.5,0.5)
Highlight33.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight33.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight33.BorderSizePixel = 0
Highlight33.Visible = false
Highlight33.ZIndex = -2
Highlight33.Parent = BG40

local UIStroke379 = Instance.new("UIStroke")
UIStroke379.Name = "UIStroke"
UIStroke379.Color = Color3.fromRGB(255,242,0)
UIStroke379.Thickness = 2.79551
UIStroke379.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke379.Parent = Highlight33

local CanvasGroup14 = Instance.new("CanvasGroup")
CanvasGroup14.Name = "CanvasGroup"
CanvasGroup14.Size = UDim2.new(1,0,1,0)
CanvasGroup14.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup14.BackgroundTransparency = 1
CanvasGroup14.Parent = COM_5722338222113816999

local DisplayTitle26 = Instance.new("TextLabel")
DisplayTitle26.Name = "DisplayTitle"
DisplayTitle26.Size = UDim2.new(0.28831,0,0.367128,0)
DisplayTitle26.Position = UDim2.new(0.830821,0,0.218714,0)
DisplayTitle26.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle26.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle26.BackgroundTransparency = 1
DisplayTitle26.BorderSizePixel = 0
DisplayTitle26.Text = "Dandy 14\" Deluxe Plush (Pre-Order)"
DisplayTitle26.TextColor3 = Color3.fromRGB(0,0,0)
DisplayTitle26.TextSize = 29
DisplayTitle26.Font = Enum.Font.Arcade
DisplayTitle26.TextWrapped = true
DisplayTitle26.TextScaled = true
DisplayTitle26.RichText = true
DisplayTitle26.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle26.Parent = COM_5722338222113816999

local UIAspectRatioConstraint22 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint22.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint22.AspectRatio = 2.66
UIAspectRatioConstraint22.Parent = DisplayTitle26

local UIGradient147 = Instance.new("UIGradient")
UIGradient147.Name = "UIGradient"
UIGradient147.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient147.Rotation = -90
UIGradient147.Offset = Vector2.new(0,0)
UIGradient147.Enabled = false
UIGradient147.Parent = DisplayTitle26

local UIStroke380 = Instance.new("UIStroke")
UIStroke380.Name = "UIStroke"
UIStroke380.Color = Color3.fromRGB(255,255,255)
UIStroke380.Thickness = 0.931838
UIStroke380.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke380.Parent = DisplayTitle26

local Item37 = Instance.new("ImageLabel")
Item37.Name = "Item"
Item37.Size = UDim2.new(0.913665,0,0.651761,0)
Item37.Position = UDim2.new(0.514096,0,0.463834,0)
Item37.AnchorPoint = Vector2.new(0.5,0.5)
Item37.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item37.BackgroundTransparency = 1
Item37.BorderSizePixel = 0
Item37.Image = "rbxassetid://94959635148921"
Item37.ImageRectOffset = Vector2.new(15,15)
Item37.ImageRectSize = Vector2.new(270,270)
Item37.ScaleType = Enum.ScaleType.Fit
Item37.Visible = false
Item37.ZIndex = -1
Item37.Parent = COM_5722338222113816999

local Unavailable119 = Instance.new("TextLabel")
Unavailable119.Name = "Unavailable"
Unavailable119.Size = UDim2.new(0.7,0,0.7,0)
Unavailable119.Position = UDim2.new(0.5,0,0.5,0)
Unavailable119.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable119.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable119.BackgroundTransparency = 1
Unavailable119.BorderSizePixel = 0
Unavailable119.Text = "Unavailable"
Unavailable119.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable119.TextSize = 14
Unavailable119.Font = Enum.Font.FredokaOne
Unavailable119.TextWrapped = true
Unavailable119.TextScaled = true
Unavailable119.Visible = false
Unavailable119.Parent = Item37

local UIStroke381 = Instance.new("UIStroke")
UIStroke381.Name = "UIStroke"
UIStroke381.Thickness = 2
UIStroke381.Parent = Unavailable119

local Purchase40 = Instance.new("ImageButton")
Purchase40.Name = "Purchase"
Purchase40.Size = UDim2.new(0.26852,0,0.201102,0)
Purchase40.Position = UDim2.new(0.843641,0,0.786462,0)
Purchase40.AnchorPoint = Vector2.new(0.5,0.5)
Purchase40.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase40.BorderSizePixel = 0
Purchase40.ScaleType = Enum.ScaleType.Fit
Purchase40.AutoButtonColor = false
Purchase40.Parent = COM_5722338222113816999

local Price40 = Instance.new("TextLabel")
Price40.Name = "Price"
Price40.Size = UDim2.new(0.78479,0,0.702682,0)
Price40.Position = UDim2.new(0.100663,0,0.0990811,0)
Price40.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price40.BackgroundTransparency = 1
Price40.BorderSizePixel = 0
Price40.Text = "$19.99"
Price40.TextColor3 = Color3.fromRGB(255,255,255)
Price40.TextSize = 14
Price40.Font = Enum.Font.Arcade
Price40.TextWrapped = true
Price40.TextScaled = true
Price40.RichText = true
Price40.AutomaticSize = Enum.AutomaticSize.X
Price40.Parent = Purchase40

local UIGradient148 = Instance.new("UIGradient")
UIGradient148.Name = "UIGradient"
UIGradient148.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient148.Rotation = -90
UIGradient148.Offset = Vector2.new(0,0)
UIGradient148.Parent = Price40

local UIStroke382 = Instance.new("UIStroke")
UIStroke382.Name = "UIStroke"
UIStroke382.Thickness = 0.931838
UIStroke382.Parent = Price40

local UICorner41 = Instance.new("UICorner")
UICorner41.Name = "UICorner"
UICorner41.CornerRadius = UDim.new(1,0)
UICorner41.Parent = Purchase40

local UIGradient149 = Instance.new("UIGradient")
UIGradient149.Name = "UIGradient"
UIGradient149.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient149.Rotation = -90
UIGradient149.Offset = Vector2.new(0,0)
UIGradient149.Parent = Purchase40

local UIScale54 = Instance.new("UIScale")
UIScale54.Name = "UIScale"
UIScale54.Parent = Purchase40

local UIStroke383 = Instance.new("UIStroke")
UIStroke383.Name = "UIStroke"
UIStroke383.Thickness = 1.1648
UIStroke383.Parent = Purchase40

local Thumbnail64 = Instance.new("ImageLabel")
Thumbnail64.Name = "Thumbnail"
Thumbnail64.Size = UDim2.new(0.319652,0,0.833356,0)
Thumbnail64.Position = UDim2.new(0.115959,0,0.552785,0)
Thumbnail64.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail64.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail64.BackgroundTransparency = 1
Thumbnail64.BorderSizePixel = 0
Thumbnail64.Image = "rbxassetid://138328174344168"
Thumbnail64.ScaleType = Enum.ScaleType.Fit
Thumbnail64.ZIndex = 0
Thumbnail64.Parent = COM_5722338222113816999

local Unavailable120 = Instance.new("TextLabel")
Unavailable120.Name = "Unavailable"
Unavailable120.Size = UDim2.new(0.7,0,0.7,0)
Unavailable120.Position = UDim2.new(0.5,0,0.5,0)
Unavailable120.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable120.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable120.BackgroundTransparency = 1
Unavailable120.BorderSizePixel = 0
Unavailable120.Text = "Unavailable"
Unavailable120.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable120.TextSize = 14
Unavailable120.Font = Enum.Font.FredokaOne
Unavailable120.TextWrapped = true
Unavailable120.TextScaled = true
Unavailable120.Visible = false
Unavailable120.Parent = Thumbnail64

local UIStroke384 = Instance.new("UIStroke")
UIStroke384.Name = "UIStroke"
UIStroke384.Thickness = 2
UIStroke384.Parent = Unavailable120

local Thumbnail65 = Instance.new("ImageLabel")
Thumbnail65.Name = "Thumbnail"
Thumbnail65.Size = UDim2.new(0.48234,0,1.2575,0)
Thumbnail65.Position = UDim2.new(0.592928,0,0.429842,0)
Thumbnail65.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail65.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail65.BackgroundTransparency = 1
Thumbnail65.BorderSizePixel = 0
Thumbnail65.Image = "rbxassetid://125974138687199"
Thumbnail65.ScaleType = Enum.ScaleType.Fit
Thumbnail65.ZIndex = -1
Thumbnail65.Parent = COM_5722338222113816999

local Unavailable121 = Instance.new("TextLabel")
Unavailable121.Name = "Unavailable"
Unavailable121.Size = UDim2.new(0.7,0,0.7,0)
Unavailable121.Position = UDim2.new(0.5,0,0.5,0)
Unavailable121.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable121.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable121.BackgroundTransparency = 1
Unavailable121.BorderSizePixel = 0
Unavailable121.Text = "Unavailable"
Unavailable121.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable121.TextSize = 14
Unavailable121.Font = Enum.Font.FredokaOne
Unavailable121.TextWrapped = true
Unavailable121.TextScaled = true
Unavailable121.Visible = false
Unavailable121.Parent = Thumbnail65

local UIStroke385 = Instance.new("UIStroke")
UIStroke385.Name = "UIStroke"
UIStroke385.Thickness = 2
UIStroke385.Parent = Unavailable121

local Thumbnail66 = Instance.new("ImageLabel")
Thumbnail66.Name = "Thumbnail"
Thumbnail66.Size = UDim2.new(0.319652,0,0.833356,0)
Thumbnail66.Position = UDim2.new(0.370642,0,0.506057,0)
Thumbnail66.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail66.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail66.BackgroundTransparency = 1
Thumbnail66.BorderSizePixel = 0
Thumbnail66.Image = "rbxassetid://97526330807702"
Thumbnail66.ScaleType = Enum.ScaleType.Fit
Thumbnail66.ZIndex = 0
Thumbnail66.Parent = COM_5722338222113816999

local Unavailable122 = Instance.new("TextLabel")
Unavailable122.Name = "Unavailable"
Unavailable122.Size = UDim2.new(0.7,0,0.7,0)
Unavailable122.Position = UDim2.new(0.5,0,0.5,0)
Unavailable122.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable122.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable122.BackgroundTransparency = 1
Unavailable122.BorderSizePixel = 0
Unavailable122.Text = "Unavailable"
Unavailable122.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable122.TextSize = 14
Unavailable122.Font = Enum.Font.FredokaOne
Unavailable122.TextWrapped = true
Unavailable122.TextScaled = true
Unavailable122.Visible = false
Unavailable122.Parent = Thumbnail66

local UIStroke386 = Instance.new("UIStroke")
UIStroke386.Name = "UIStroke"
UIStroke386.Thickness = 2
UIStroke386.Parent = Unavailable122

local Thumbnail67 = Instance.new("ImageLabel")
Thumbnail67.Name = "Thumbnail"
Thumbnail67.Size = UDim2.new(0.319652,0,0.833356,0)
Thumbnail67.Position = UDim2.new(0.182567,0,0.472669,0)
Thumbnail67.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail67.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail67.BackgroundTransparency = 1
Thumbnail67.BorderSizePixel = 0
Thumbnail67.Image = "rbxassetid://114427414365168"
Thumbnail67.ScaleType = Enum.ScaleType.Fit
Thumbnail67.ZIndex = -1
Thumbnail67.Parent = COM_5722338222113816999

local Unavailable123 = Instance.new("TextLabel")
Unavailable123.Name = "Unavailable"
Unavailable123.Size = UDim2.new(0.7,0,0.7,0)
Unavailable123.Position = UDim2.new(0.5,0,0.5,0)
Unavailable123.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable123.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable123.BackgroundTransparency = 1
Unavailable123.BorderSizePixel = 0
Unavailable123.Text = "Unavailable"
Unavailable123.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable123.TextSize = 14
Unavailable123.Font = Enum.Font.FredokaOne
Unavailable123.TextWrapped = true
Unavailable123.TextScaled = true
Unavailable123.Visible = false
Unavailable123.Parent = Thumbnail67

local UIStroke387 = Instance.new("UIStroke")
UIStroke387.Name = "UIStroke"
UIStroke387.Thickness = 2
UIStroke387.Parent = Unavailable123

local Title40 = Instance.new("TextLabel")
Title40.Name = "Title"
Title40.Size = UDim2.new(0.566559,0,0.435422,0)
Title40.Position = UDim2.new(0.65544,0,0.15042,0)
Title40.AnchorPoint = Vector2.new(0.5,0)
Title40.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title40.BackgroundTransparency = 1
Title40.BorderSizePixel = 0
Title40.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title40.TextColor3 = Color3.fromRGB(0,13,76)
Title40.TextSize = 29
Title40.Font = Enum.Font.Arcade
Title40.TextWrapped = true
Title40.TextScaled = true
Title40.RichText = true
Title40.Visible = false
Title40.AutomaticSize = Enum.AutomaticSize.X
Title40.Parent = COM_5722338222113816999

local UIGradient150 = Instance.new("UIGradient")
UIGradient150.Name = "UIGradient"
UIGradient150.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient150.Rotation = -90
UIGradient150.Offset = Vector2.new(0,0)
UIGradient150.Parent = Title40

local UIStroke388 = Instance.new("UIStroke")
UIStroke388.Name = "UIStroke"
UIStroke388.Color = Color3.fromRGB(255,255,255)
UIStroke388.Thickness = 2
UIStroke388.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke388.Parent = Title40

local UIListLayout23 = Instance.new("UIListLayout")
UIListLayout23.Name = "UIListLayout"
UIListLayout23.Padding = UDim.new(0.019,0)
UIListLayout23.FillDirection = Enum.FillDirection.Horizontal
UIListLayout23.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout23.Wraps = false
UIListLayout23.Parent = Special20

local Special21 = Instance.new("Frame")
Special21.Name = "Special"
Special21.Size = UDim2.new(1.10498,0,0.439953,0)
Special21.Position = UDim2.new(0,0,-0.143337,0)
Special21.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special21.BackgroundTransparency = 1
Special21.BorderColor3 = Color3.fromRGB(0,0,0)
Special21.BorderSizePixel = 0
Special21.LayoutOrder = -1
Special21.Parent = ScrollingFrame

local COM_2774612072627700190 = Instance.new("Frame")
COM_2774612072627700190.Name = "COM-2774612072627700190"
COM_2774612072627700190.Size = UDim2.new(0.437886,0,0.931112,0)
COM_2774612072627700190.Position = UDim2.new(-2.68658e-08,0,0,0)
COM_2774612072627700190.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_2774612072627700190.BackgroundTransparency = 1
COM_2774612072627700190.BorderColor3 = Color3.fromRGB(0,0,0)
COM_2774612072627700190.BorderSizePixel = 0
COM_2774612072627700190.LayoutOrder = -1
COM_2774612072627700190.Parent = Special21

local BG41 = Instance.new("Frame")
BG41.Name = "BG"
BG41.Size = UDim2.new(1,0,1,0)
BG41.Position = UDim2.new(0.5,0,0.5,0)
BG41.AnchorPoint = Vector2.new(0.5,0.5)
BG41.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG41.BackgroundTransparency = 1
BG41.BorderColor3 = Color3.fromRGB(0,0,0)
BG41.BorderSizePixel = 0
BG41.ZIndex = -1
BG41.Parent = COM_2774612072627700190

local Dropshadow40 = Instance.new("Frame")
Dropshadow40.Name = "Dropshadow"
Dropshadow40.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow40.Position = UDim2.new(0,0,1.028,0)
Dropshadow40.AnchorPoint = Vector2.new(0,1)
Dropshadow40.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow40.BackgroundTransparency = 0.5
Dropshadow40.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow40.BorderSizePixel = 0
Dropshadow40.ZIndex = -2
Dropshadow40.Parent = BG41

local UIStroke389 = Instance.new("UIStroke")
UIStroke389.Name = "UIStroke"
UIStroke389.Thickness = 2.79551
UIStroke389.Transparency = 1
UIStroke389.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke389.Parent = Dropshadow40

local Frame41 = Instance.new("Frame")
Frame41.Name = "Frame"
Frame41.Size = UDim2.new(0.969681,0,0.95775,0)
Frame41.Position = UDim2.new(0.514096,0,0.478875,0)
Frame41.AnchorPoint = Vector2.new(0.5,0.5)
Frame41.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame41.BorderColor3 = Color3.fromRGB(0,0,0)
Frame41.BorderSizePixel = 0
Frame41.ZIndex = -1
Frame41.Parent = BG41

local Pattern35 = Instance.new("ImageLabel")
Pattern35.Name = "Pattern"
Pattern35.Size = UDim2.new(1,0,1,0)
Pattern35.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern35.BackgroundTransparency = 1
Pattern35.BorderSizePixel = 0
Pattern35.Image = "rbxassetid://132687197959308"
Pattern35.ZIndex = -1
Pattern35.Parent = Frame41

local UIStroke390 = Instance.new("UIStroke")
UIStroke390.Name = "UIStroke"
UIStroke390.Thickness = 1.86368
UIStroke390.Parent = Pattern35

local UIStroke391 = Instance.new("UIStroke")
UIStroke391.Name = "UIStroke"
UIStroke391.Thickness = 1.86368
UIStroke391.Parent = Frame41

local Highlight34 = Instance.new("Frame")
Highlight34.Name = "Highlight"
Highlight34.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight34.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight34.AnchorPoint = Vector2.new(0.5,0.5)
Highlight34.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight34.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight34.BorderSizePixel = 0
Highlight34.Visible = false
Highlight34.ZIndex = -2
Highlight34.Parent = BG41

local UIStroke392 = Instance.new("UIStroke")
UIStroke392.Name = "UIStroke"
UIStroke392.Color = Color3.fromRGB(255,242,0)
UIStroke392.Thickness = 2.79551
UIStroke392.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke392.Parent = Highlight34

local DisplayTitle27 = Instance.new("TextLabel")
DisplayTitle27.Name = "DisplayTitle"
DisplayTitle27.Size = UDim2.new(0.566559,0,0.435422,0)
DisplayTitle27.Position = UDim2.new(0.65544,0,0.15042,0)
DisplayTitle27.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle27.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle27.BackgroundTransparency = 1
DisplayTitle27.BorderSizePixel = 0
DisplayTitle27.Text = "Astro 14\" Deluxe Plush (Pre-Order)"
DisplayTitle27.TextColor3 = Color3.fromRGB(0,13,76)
DisplayTitle27.TextSize = 29
DisplayTitle27.Font = Enum.Font.Arcade
DisplayTitle27.TextWrapped = true
DisplayTitle27.TextScaled = true
DisplayTitle27.RichText = true
DisplayTitle27.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle27.Parent = COM_2774612072627700190

local UIGradient151 = Instance.new("UIGradient")
UIGradient151.Name = "UIGradient"
UIGradient151.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient151.Rotation = -90
UIGradient151.Offset = Vector2.new(0,0)
UIGradient151.Parent = DisplayTitle27

local UIStroke393 = Instance.new("UIStroke")
UIStroke393.Name = "UIStroke"
UIStroke393.Color = Color3.fromRGB(255,255,255)
UIStroke393.Thickness = 0.931838
UIStroke393.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke393.Parent = DisplayTitle27

local Item38 = Instance.new("ImageLabel")
Item38.Name = "Item"
Item38.Size = UDim2.new(0.913665,0,0.651761,0)
Item38.Position = UDim2.new(0.514096,0,0.463834,0)
Item38.AnchorPoint = Vector2.new(0.5,0.5)
Item38.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item38.BackgroundTransparency = 1
Item38.BorderSizePixel = 0
Item38.Image = "rbxassetid://94959635148921"
Item38.ImageRectOffset = Vector2.new(15,15)
Item38.ImageRectSize = Vector2.new(270,270)
Item38.ScaleType = Enum.ScaleType.Fit
Item38.Visible = false
Item38.ZIndex = -1
Item38.Parent = COM_2774612072627700190

local Unavailable124 = Instance.new("TextLabel")
Unavailable124.Name = "Unavailable"
Unavailable124.Size = UDim2.new(0.7,0,0.7,0)
Unavailable124.Position = UDim2.new(0.5,0,0.5,0)
Unavailable124.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable124.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable124.BackgroundTransparency = 1
Unavailable124.BorderSizePixel = 0
Unavailable124.Text = "Unavailable"
Unavailable124.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable124.TextSize = 14
Unavailable124.Font = Enum.Font.FredokaOne
Unavailable124.TextWrapped = true
Unavailable124.TextScaled = true
Unavailable124.Visible = false
Unavailable124.Parent = Item38

local UIStroke394 = Instance.new("UIStroke")
UIStroke394.Name = "UIStroke"
UIStroke394.Thickness = 2
UIStroke394.Parent = Unavailable124

local New19 = Instance.new("ImageLabel")
New19.Name = "New"
New19.Size = UDim2.new(0.322123,0,0.355513,0)
New19.Position = UDim2.new(0.924293,0,0.0284983,0)
New19.AnchorPoint = Vector2.new(0.5,0.5)
New19.BackgroundColor3 = Color3.fromRGB(255,255,255)
New19.BackgroundTransparency = 1
New19.BorderSizePixel = 0
New19.Image = "rbxassetid://96728750855907"
New19.ScaleType = Enum.ScaleType.Fit
New19.Visible = false
New19.ZIndex = -1
New19.Parent = COM_2774612072627700190

local UIScale55 = Instance.new("UIScale")
UIScale55.Name = "UIScale"
UIScale55.Parent = New19

local Purchase41 = Instance.new("ImageButton")
Purchase41.Name = "Purchase"
Purchase41.Size = UDim2.new(0.551281,0,0.201102,0)
Purchase41.Position = UDim2.new(0.681037,0,0.790057,0)
Purchase41.AnchorPoint = Vector2.new(0.5,0.5)
Purchase41.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase41.BorderSizePixel = 0
Purchase41.ScaleType = Enum.ScaleType.Fit
Purchase41.AutoButtonColor = false
Purchase41.Parent = COM_2774612072627700190

local Price41 = Instance.new("TextLabel")
Price41.Name = "Price"
Price41.Size = UDim2.new(0.78479,0,0.702682,0)
Price41.Position = UDim2.new(0.100663,0,0.0990811,0)
Price41.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price41.BackgroundTransparency = 1
Price41.BorderSizePixel = 0
Price41.Text = "$19.99"
Price41.TextColor3 = Color3.fromRGB(255,255,255)
Price41.TextSize = 14
Price41.Font = Enum.Font.Arcade
Price41.TextWrapped = true
Price41.TextScaled = true
Price41.RichText = true
Price41.AutomaticSize = Enum.AutomaticSize.X
Price41.Parent = Purchase41

local UIGradient152 = Instance.new("UIGradient")
UIGradient152.Name = "UIGradient"
UIGradient152.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient152.Rotation = -90
UIGradient152.Offset = Vector2.new(0,0)
UIGradient152.Parent = Price41

local UIStroke395 = Instance.new("UIStroke")
UIStroke395.Name = "UIStroke"
UIStroke395.Thickness = 0.931838
UIStroke395.Parent = Price41

local UICorner42 = Instance.new("UICorner")
UICorner42.Name = "UICorner"
UICorner42.CornerRadius = UDim.new(1,0)
UICorner42.Parent = Purchase41

local UIGradient153 = Instance.new("UIGradient")
UIGradient153.Name = "UIGradient"
UIGradient153.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient153.Rotation = -90
UIGradient153.Offset = Vector2.new(0,0)
UIGradient153.Parent = Purchase41

local UIScale56 = Instance.new("UIScale")
UIScale56.Name = "UIScale"
UIScale56.Parent = Purchase41

local UIStroke396 = Instance.new("UIStroke")
UIStroke396.Name = "UIStroke"
UIStroke396.Thickness = 1.1648
UIStroke396.Parent = Purchase41

local Thumbnail68 = Instance.new("ImageLabel")
Thumbnail68.Name = "Thumbnail"
Thumbnail68.Size = UDim2.new(0.593809,0,1.5481,0)
Thumbnail68.Position = UDim2.new(0.210077,0,0.432111,0)
Thumbnail68.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail68.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail68.BackgroundTransparency = 1
Thumbnail68.BorderSizePixel = 0
Thumbnail68.Image = "rbxassetid://134317376107046"
Thumbnail68.ScaleType = Enum.ScaleType.Fit
Thumbnail68.ZIndex = -1
Thumbnail68.Parent = COM_2774612072627700190

local Unavailable125 = Instance.new("TextLabel")
Unavailable125.Name = "Unavailable"
Unavailable125.Size = UDim2.new(0.7,0,0.7,0)
Unavailable125.Position = UDim2.new(0.5,0,0.5,0)
Unavailable125.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable125.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable125.BackgroundTransparency = 1
Unavailable125.BorderSizePixel = 0
Unavailable125.Text = "Unavailable"
Unavailable125.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable125.TextSize = 14
Unavailable125.Font = Enum.Font.FredokaOne
Unavailable125.TextWrapped = true
Unavailable125.TextScaled = true
Unavailable125.Visible = false
Unavailable125.Parent = Thumbnail68

local UIStroke397 = Instance.new("UIStroke")
UIStroke397.Name = "UIStroke"
UIStroke397.Thickness = 2
UIStroke397.Parent = Unavailable125

local Title41 = Instance.new("TextLabel")
Title41.Name = "Title"
Title41.Size = UDim2.new(0.566559,0,0.435422,0)
Title41.Position = UDim2.new(0.65544,0,0.15042,0)
Title41.AnchorPoint = Vector2.new(0.5,0)
Title41.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title41.BackgroundTransparency = 1
Title41.BorderSizePixel = 0
Title41.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title41.TextColor3 = Color3.fromRGB(0,13,76)
Title41.TextSize = 29
Title41.Font = Enum.Font.Arcade
Title41.TextWrapped = true
Title41.TextScaled = true
Title41.RichText = true
Title41.Visible = false
Title41.AutomaticSize = Enum.AutomaticSize.X
Title41.Parent = COM_2774612072627700190

local UIGradient154 = Instance.new("UIGradient")
UIGradient154.Name = "UIGradient"
UIGradient154.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient154.Rotation = -90
UIGradient154.Offset = Vector2.new(0,0)
UIGradient154.Parent = Title41

local UIStroke398 = Instance.new("UIStroke")
UIStroke398.Name = "UIStroke"
UIStroke398.Color = Color3.fromRGB(255,255,255)
UIStroke398.Thickness = 2
UIStroke398.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke398.Parent = Title41

local COM_57223382221138169992 = Instance.new("Frame")
COM_57223382221138169992.Name = "COM-5722338222113816999"
COM_57223382221138169992.Size = UDim2.new(0.437886,0,0.931112,0)
COM_57223382221138169992.Position = UDim2.new(-2.68658e-08,0,0,0)
COM_57223382221138169992.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_57223382221138169992.BackgroundTransparency = 1
COM_57223382221138169992.BorderColor3 = Color3.fromRGB(0,0,0)
COM_57223382221138169992.BorderSizePixel = 0
COM_57223382221138169992.Parent = Special21

local BG42 = Instance.new("Frame")
BG42.Name = "BG"
BG42.Size = UDim2.new(1,0,1,0)
BG42.Position = UDim2.new(0.5,0,0.5,0)
BG42.AnchorPoint = Vector2.new(0.5,0.5)
BG42.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG42.BackgroundTransparency = 1
BG42.BorderColor3 = Color3.fromRGB(0,0,0)
BG42.BorderSizePixel = 0
BG42.ZIndex = -1
BG42.Parent = COM_57223382221138169992

local Dropshadow41 = Instance.new("Frame")
Dropshadow41.Name = "Dropshadow"
Dropshadow41.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow41.Position = UDim2.new(0,0,1.028,0)
Dropshadow41.AnchorPoint = Vector2.new(0,1)
Dropshadow41.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow41.BackgroundTransparency = 0.5
Dropshadow41.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow41.BorderSizePixel = 0
Dropshadow41.ZIndex = -2
Dropshadow41.Parent = BG42

local UIStroke399 = Instance.new("UIStroke")
UIStroke399.Name = "UIStroke"
UIStroke399.Thickness = 2.79551
UIStroke399.Transparency = 1
UIStroke399.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke399.Parent = Dropshadow41

local Frame42 = Instance.new("Frame")
Frame42.Name = "Frame"
Frame42.Size = UDim2.new(0.969681,0,0.95775,0)
Frame42.Position = UDim2.new(0.514096,0,0.478875,0)
Frame42.AnchorPoint = Vector2.new(0.5,0.5)
Frame42.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame42.BorderColor3 = Color3.fromRGB(0,0,0)
Frame42.BorderSizePixel = 0
Frame42.ZIndex = -1
Frame42.Parent = BG42

local Pattern36 = Instance.new("ImageLabel")
Pattern36.Name = "Pattern"
Pattern36.Size = UDim2.new(1,0,1,0)
Pattern36.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern36.BackgroundTransparency = 1
Pattern36.BorderSizePixel = 0
Pattern36.Image = "rbxassetid://104066119238656"
Pattern36.ZIndex = -1
Pattern36.Parent = Frame42

local UIStroke400 = Instance.new("UIStroke")
UIStroke400.Name = "UIStroke"
UIStroke400.Thickness = 1.86368
UIStroke400.Parent = Pattern36

local UIStroke401 = Instance.new("UIStroke")
UIStroke401.Name = "UIStroke"
UIStroke401.Thickness = 1.86368
UIStroke401.Parent = Frame42

local Highlight35 = Instance.new("Frame")
Highlight35.Name = "Highlight"
Highlight35.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight35.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight35.AnchorPoint = Vector2.new(0.5,0.5)
Highlight35.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight35.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight35.BorderSizePixel = 0
Highlight35.Visible = false
Highlight35.ZIndex = -2
Highlight35.Parent = BG42

local UIStroke402 = Instance.new("UIStroke")
UIStroke402.Name = "UIStroke"
UIStroke402.Color = Color3.fromRGB(255,242,0)
UIStroke402.Thickness = 2.79551
UIStroke402.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke402.Parent = Highlight35

local DisplayTitle28 = Instance.new("TextLabel")
DisplayTitle28.Name = "DisplayTitle"
DisplayTitle28.Size = UDim2.new(0.566559,0,0.435422,0)
DisplayTitle28.Position = UDim2.new(0.65544,0,0.15042,0)
DisplayTitle28.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle28.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle28.BackgroundTransparency = 1
DisplayTitle28.BorderSizePixel = 0
DisplayTitle28.Text = "Dandy 14\" Deluxe Plush (Pre-Order)"
DisplayTitle28.TextColor3 = Color3.fromRGB(0,13,76)
DisplayTitle28.TextSize = 29
DisplayTitle28.Font = Enum.Font.Arcade
DisplayTitle28.TextWrapped = true
DisplayTitle28.TextScaled = true
DisplayTitle28.RichText = true
DisplayTitle28.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle28.Parent = COM_57223382221138169992

local UIGradient155 = Instance.new("UIGradient")
UIGradient155.Name = "UIGradient"
UIGradient155.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient155.Rotation = -90
UIGradient155.Offset = Vector2.new(0,0)
UIGradient155.Parent = DisplayTitle28

local UIStroke403 = Instance.new("UIStroke")
UIStroke403.Name = "UIStroke"
UIStroke403.Color = Color3.fromRGB(255,255,255)
UIStroke403.Thickness = 0.931838
UIStroke403.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke403.Parent = DisplayTitle28

local Item39 = Instance.new("ImageLabel")
Item39.Name = "Item"
Item39.Size = UDim2.new(0.913665,0,0.651761,0)
Item39.Position = UDim2.new(0.514096,0,0.463834,0)
Item39.AnchorPoint = Vector2.new(0.5,0.5)
Item39.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item39.BackgroundTransparency = 1
Item39.BorderSizePixel = 0
Item39.Image = "rbxassetid://94959635148921"
Item39.ImageRectOffset = Vector2.new(15,15)
Item39.ImageRectSize = Vector2.new(270,270)
Item39.ScaleType = Enum.ScaleType.Fit
Item39.Visible = false
Item39.ZIndex = -1
Item39.Parent = COM_57223382221138169992

local Unavailable126 = Instance.new("TextLabel")
Unavailable126.Name = "Unavailable"
Unavailable126.Size = UDim2.new(0.7,0,0.7,0)
Unavailable126.Position = UDim2.new(0.5,0,0.5,0)
Unavailable126.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable126.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable126.BackgroundTransparency = 1
Unavailable126.BorderSizePixel = 0
Unavailable126.Text = "Unavailable"
Unavailable126.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable126.TextSize = 14
Unavailable126.Font = Enum.Font.FredokaOne
Unavailable126.TextWrapped = true
Unavailable126.TextScaled = true
Unavailable126.Visible = false
Unavailable126.Parent = Item39

local UIStroke404 = Instance.new("UIStroke")
UIStroke404.Name = "UIStroke"
UIStroke404.Thickness = 2
UIStroke404.Parent = Unavailable126

local Purchase42 = Instance.new("ImageButton")
Purchase42.Name = "Purchase"
Purchase42.Size = UDim2.new(0.551281,0,0.201102,0)
Purchase42.Position = UDim2.new(0.681037,0,0.790057,0)
Purchase42.AnchorPoint = Vector2.new(0.5,0.5)
Purchase42.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase42.BorderSizePixel = 0
Purchase42.ScaleType = Enum.ScaleType.Fit
Purchase42.AutoButtonColor = false
Purchase42.Parent = COM_57223382221138169992

local Price42 = Instance.new("TextLabel")
Price42.Name = "Price"
Price42.Size = UDim2.new(0.78479,0,0.702682,0)
Price42.Position = UDim2.new(0.100663,0,0.0990811,0)
Price42.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price42.BackgroundTransparency = 1
Price42.BorderSizePixel = 0
Price42.Text = "$19.99"
Price42.TextColor3 = Color3.fromRGB(255,255,255)
Price42.TextSize = 14
Price42.Font = Enum.Font.Arcade
Price42.TextWrapped = true
Price42.TextScaled = true
Price42.RichText = true
Price42.AutomaticSize = Enum.AutomaticSize.X
Price42.Parent = Purchase42

local UIGradient156 = Instance.new("UIGradient")
UIGradient156.Name = "UIGradient"
UIGradient156.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient156.Rotation = -90
UIGradient156.Offset = Vector2.new(0,0)
UIGradient156.Parent = Price42

local UIStroke405 = Instance.new("UIStroke")
UIStroke405.Name = "UIStroke"
UIStroke405.Thickness = 0.931838
UIStroke405.Parent = Price42

local UICorner43 = Instance.new("UICorner")
UICorner43.Name = "UICorner"
UICorner43.CornerRadius = UDim.new(1,0)
UICorner43.Parent = Purchase42

local UIGradient157 = Instance.new("UIGradient")
UIGradient157.Name = "UIGradient"
UIGradient157.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient157.Rotation = -90
UIGradient157.Offset = Vector2.new(0,0)
UIGradient157.Parent = Purchase42

local UIScale57 = Instance.new("UIScale")
UIScale57.Name = "UIScale"
UIScale57.Parent = Purchase42

local UIStroke406 = Instance.new("UIStroke")
UIStroke406.Name = "UIStroke"
UIStroke406.Thickness = 1.1648
UIStroke406.Parent = Purchase42

local Thumbnail69 = Instance.new("ImageLabel")
Thumbnail69.Name = "Thumbnail"
Thumbnail69.Size = UDim2.new(0.593809,0,1.5481,0)
Thumbnail69.Position = UDim2.new(0.210077,0,0.432111,0)
Thumbnail69.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail69.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail69.BackgroundTransparency = 1
Thumbnail69.BorderSizePixel = 0
Thumbnail69.Image = "rbxassetid://125974138687199"
Thumbnail69.ScaleType = Enum.ScaleType.Fit
Thumbnail69.ZIndex = -1
Thumbnail69.Parent = COM_57223382221138169992

local Unavailable127 = Instance.new("TextLabel")
Unavailable127.Name = "Unavailable"
Unavailable127.Size = UDim2.new(0.7,0,0.7,0)
Unavailable127.Position = UDim2.new(0.5,0,0.5,0)
Unavailable127.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable127.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable127.BackgroundTransparency = 1
Unavailable127.BorderSizePixel = 0
Unavailable127.Text = "Unavailable"
Unavailable127.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable127.TextSize = 14
Unavailable127.Font = Enum.Font.FredokaOne
Unavailable127.TextWrapped = true
Unavailable127.TextScaled = true
Unavailable127.Visible = false
Unavailable127.Parent = Thumbnail69

local UIStroke407 = Instance.new("UIStroke")
UIStroke407.Name = "UIStroke"
UIStroke407.Thickness = 2
UIStroke407.Parent = Unavailable127

local Title42 = Instance.new("TextLabel")
Title42.Name = "Title"
Title42.Size = UDim2.new(0.566559,0,0.435422,0)
Title42.Position = UDim2.new(0.65544,0,0.15042,0)
Title42.AnchorPoint = Vector2.new(0.5,0)
Title42.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title42.BackgroundTransparency = 1
Title42.BorderSizePixel = 0
Title42.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title42.TextColor3 = Color3.fromRGB(0,13,76)
Title42.TextSize = 29
Title42.Font = Enum.Font.Arcade
Title42.TextWrapped = true
Title42.TextScaled = true
Title42.RichText = true
Title42.Visible = false
Title42.AutomaticSize = Enum.AutomaticSize.X
Title42.Parent = COM_57223382221138169992

local UIGradient158 = Instance.new("UIGradient")
UIGradient158.Name = "UIGradient"
UIGradient158.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient158.Rotation = -90
UIGradient158.Offset = Vector2.new(0,0)
UIGradient158.Parent = Title42

local UIStroke408 = Instance.new("UIStroke")
UIStroke408.Name = "UIStroke"
UIStroke408.Color = Color3.fromRGB(255,255,255)
UIStroke408.Thickness = 2
UIStroke408.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke408.Parent = Title42

local COM_85234255603766399462 = Instance.new("Frame")
COM_85234255603766399462.Name = "COM-8523425560376639946"
COM_85234255603766399462.Size = UDim2.new(0.437886,0,0.931112,0)
COM_85234255603766399462.Position = UDim2.new(-2.68658e-08,0,0,0)
COM_85234255603766399462.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_85234255603766399462.BackgroundTransparency = 1
COM_85234255603766399462.BorderColor3 = Color3.fromRGB(0,0,0)
COM_85234255603766399462.BorderSizePixel = 0
COM_85234255603766399462.Visible = false
COM_85234255603766399462.Parent = Special21

local BG43 = Instance.new("Frame")
BG43.Name = "BG"
BG43.Size = UDim2.new(1,0,1,0)
BG43.Position = UDim2.new(0.5,0,0.5,0)
BG43.AnchorPoint = Vector2.new(0.5,0.5)
BG43.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG43.BackgroundTransparency = 1
BG43.BorderColor3 = Color3.fromRGB(0,0,0)
BG43.BorderSizePixel = 0
BG43.ZIndex = -1
BG43.Parent = COM_85234255603766399462

local Dropshadow42 = Instance.new("Frame")
Dropshadow42.Name = "Dropshadow"
Dropshadow42.Size = UDim2.new(0.940524,0,0.968522,0)
Dropshadow42.Position = UDim2.new(0,0,1.028,0)
Dropshadow42.AnchorPoint = Vector2.new(0,1)
Dropshadow42.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow42.BackgroundTransparency = 0.5
Dropshadow42.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow42.BorderSizePixel = 0
Dropshadow42.ZIndex = -2
Dropshadow42.Parent = BG43

local UIStroke409 = Instance.new("UIStroke")
UIStroke409.Name = "UIStroke"
UIStroke409.Thickness = 2.79551
UIStroke409.Transparency = 1
UIStroke409.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke409.Parent = Dropshadow42

local Frame43 = Instance.new("Frame")
Frame43.Name = "Frame"
Frame43.Size = UDim2.new(0.969681,0,0.95775,0)
Frame43.Position = UDim2.new(0.514096,0,0.478875,0)
Frame43.AnchorPoint = Vector2.new(0.5,0.5)
Frame43.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame43.BorderColor3 = Color3.fromRGB(0,0,0)
Frame43.BorderSizePixel = 0
Frame43.ZIndex = -1
Frame43.Parent = BG43

local Pattern37 = Instance.new("ImageLabel")
Pattern37.Name = "Pattern"
Pattern37.Size = UDim2.new(1,0,1,0)
Pattern37.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern37.BackgroundTransparency = 1
Pattern37.BorderSizePixel = 0
Pattern37.Image = "rbxassetid://98127658855696"
Pattern37.ZIndex = -1
Pattern37.Parent = Frame43

local UIStroke410 = Instance.new("UIStroke")
UIStroke410.Name = "UIStroke"
UIStroke410.Thickness = 1.86368
UIStroke410.Parent = Pattern37

local UIStroke411 = Instance.new("UIStroke")
UIStroke411.Name = "UIStroke"
UIStroke411.Thickness = 1.86368
UIStroke411.Parent = Frame43

local Highlight36 = Instance.new("Frame")
Highlight36.Name = "Highlight"
Highlight36.Size = UDim2.new(0.970745,0,0.95775,0)
Highlight36.Position = UDim2.new(0.514628,0,0.478875,0)
Highlight36.AnchorPoint = Vector2.new(0.5,0.5)
Highlight36.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight36.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight36.BorderSizePixel = 0
Highlight36.Visible = false
Highlight36.ZIndex = -2
Highlight36.Parent = BG43

local UIStroke412 = Instance.new("UIStroke")
UIStroke412.Name = "UIStroke"
UIStroke412.Color = Color3.fromRGB(255,242,0)
UIStroke412.Thickness = 2.79551
UIStroke412.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke412.Parent = Highlight36

local DisplayTitle29 = Instance.new("TextLabel")
DisplayTitle29.Name = "DisplayTitle"
DisplayTitle29.Size = UDim2.new(0.566559,0,0.435422,0)
DisplayTitle29.Position = UDim2.new(0.65544,0,0.15042,0)
DisplayTitle29.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle29.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle29.BackgroundTransparency = 1
DisplayTitle29.BorderSizePixel = 0
DisplayTitle29.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
DisplayTitle29.TextColor3 = Color3.fromRGB(0,13,76)
DisplayTitle29.TextSize = 29
DisplayTitle29.Font = Enum.Font.Arcade
DisplayTitle29.TextWrapped = true
DisplayTitle29.TextScaled = true
DisplayTitle29.RichText = true
DisplayTitle29.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle29.Parent = COM_85234255603766399462

local UIGradient159 = Instance.new("UIGradient")
UIGradient159.Name = "UIGradient"
UIGradient159.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient159.Rotation = -90
UIGradient159.Offset = Vector2.new(0,0)
UIGradient159.Parent = DisplayTitle29

local UIStroke413 = Instance.new("UIStroke")
UIStroke413.Name = "UIStroke"
UIStroke413.Color = Color3.fromRGB(255,255,255)
UIStroke413.Thickness = 0.931838
UIStroke413.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke413.Parent = DisplayTitle29

local Item40 = Instance.new("ImageLabel")
Item40.Name = "Item"
Item40.Size = UDim2.new(0.913665,0,0.651761,0)
Item40.Position = UDim2.new(0.514096,0,0.463834,0)
Item40.AnchorPoint = Vector2.new(0.5,0.5)
Item40.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item40.BackgroundTransparency = 1
Item40.BorderSizePixel = 0
Item40.Image = "rbxassetid://94959635148921"
Item40.ImageRectOffset = Vector2.new(15,15)
Item40.ImageRectSize = Vector2.new(270,270)
Item40.ScaleType = Enum.ScaleType.Fit
Item40.Visible = false
Item40.ZIndex = -1
Item40.Parent = COM_85234255603766399462

local Unavailable128 = Instance.new("TextLabel")
Unavailable128.Name = "Unavailable"
Unavailable128.Size = UDim2.new(0.7,0,0.7,0)
Unavailable128.Position = UDim2.new(0.5,0,0.5,0)
Unavailable128.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable128.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable128.BackgroundTransparency = 1
Unavailable128.BorderSizePixel = 0
Unavailable128.Text = "Unavailable"
Unavailable128.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable128.TextSize = 14
Unavailable128.Font = Enum.Font.FredokaOne
Unavailable128.TextWrapped = true
Unavailable128.TextScaled = true
Unavailable128.Visible = false
Unavailable128.Parent = Item40

local UIStroke414 = Instance.new("UIStroke")
UIStroke414.Name = "UIStroke"
UIStroke414.Thickness = 2
UIStroke414.Parent = Unavailable128

local New20 = Instance.new("ImageLabel")
New20.Name = "New"
New20.Size = UDim2.new(0.322123,0,0.355513,0)
New20.Position = UDim2.new(0.924293,0,0.0284983,0)
New20.AnchorPoint = Vector2.new(0.5,0.5)
New20.BackgroundColor3 = Color3.fromRGB(255,255,255)
New20.BackgroundTransparency = 1
New20.BorderSizePixel = 0
New20.Image = "rbxassetid://96728750855907"
New20.ScaleType = Enum.ScaleType.Fit
New20.Visible = false
New20.ZIndex = -1
New20.Parent = COM_85234255603766399462

local UIScale58 = Instance.new("UIScale")
UIScale58.Name = "UIScale"
UIScale58.Parent = New20

local Purchase43 = Instance.new("ImageButton")
Purchase43.Name = "Purchase"
Purchase43.Size = UDim2.new(0.551281,0,0.201102,0)
Purchase43.Position = UDim2.new(0.681037,0,0.790057,0)
Purchase43.AnchorPoint = Vector2.new(0.5,0.5)
Purchase43.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase43.BorderSizePixel = 0
Purchase43.ScaleType = Enum.ScaleType.Fit
Purchase43.AutoButtonColor = false
Purchase43.Parent = COM_85234255603766399462

local Price43 = Instance.new("TextLabel")
Price43.Name = "Price"
Price43.Size = UDim2.new(0.78479,0,0.702682,0)
Price43.Position = UDim2.new(0.100663,0,0.0990811,0)
Price43.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price43.BackgroundTransparency = 1
Price43.BorderSizePixel = 0
Price43.Text = "$19.99"
Price43.TextColor3 = Color3.fromRGB(255,255,255)
Price43.TextSize = 14
Price43.Font = Enum.Font.Arcade
Price43.TextWrapped = true
Price43.TextScaled = true
Price43.RichText = true
Price43.AutomaticSize = Enum.AutomaticSize.X
Price43.Parent = Purchase43

local UIGradient160 = Instance.new("UIGradient")
UIGradient160.Name = "UIGradient"
UIGradient160.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient160.Rotation = -90
UIGradient160.Offset = Vector2.new(0,0)
UIGradient160.Parent = Price43

local UIStroke415 = Instance.new("UIStroke")
UIStroke415.Name = "UIStroke"
UIStroke415.Thickness = 0.931838
UIStroke415.Parent = Price43

local UICorner44 = Instance.new("UICorner")
UICorner44.Name = "UICorner"
UICorner44.CornerRadius = UDim.new(1,0)
UICorner44.Parent = Purchase43

local UIGradient161 = Instance.new("UIGradient")
UIGradient161.Name = "UIGradient"
UIGradient161.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient161.Rotation = -90
UIGradient161.Offset = Vector2.new(0,0)
UIGradient161.Parent = Purchase43

local UIScale59 = Instance.new("UIScale")
UIScale59.Name = "UIScale"
UIScale59.Parent = Purchase43

local UIStroke416 = Instance.new("UIStroke")
UIStroke416.Name = "UIStroke"
UIStroke416.Thickness = 1.1648
UIStroke416.Parent = Purchase43

local Thumbnail70 = Instance.new("ImageLabel")
Thumbnail70.Name = "Thumbnail"
Thumbnail70.Size = UDim2.new(0.601206,0,1.5481,0)
Thumbnail70.Position = UDim2.new(0.216213,0,0.421328,0)
Thumbnail70.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail70.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail70.BackgroundTransparency = 1
Thumbnail70.BorderSizePixel = 0
Thumbnail70.Image = "rbxassetid://76700469052474"
Thumbnail70.ScaleType = Enum.ScaleType.Fit
Thumbnail70.ZIndex = -1
Thumbnail70.Parent = COM_85234255603766399462

local Unavailable129 = Instance.new("TextLabel")
Unavailable129.Name = "Unavailable"
Unavailable129.Size = UDim2.new(0.7,0,0.7,0)
Unavailable129.Position = UDim2.new(0.5,0,0.5,0)
Unavailable129.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable129.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable129.BackgroundTransparency = 1
Unavailable129.BorderSizePixel = 0
Unavailable129.Text = "Unavailable"
Unavailable129.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable129.TextSize = 14
Unavailable129.Font = Enum.Font.FredokaOne
Unavailable129.TextWrapped = true
Unavailable129.TextScaled = true
Unavailable129.Visible = false
Unavailable129.Parent = Thumbnail70

local UIStroke417 = Instance.new("UIStroke")
UIStroke417.Name = "UIStroke"
UIStroke417.Thickness = 2
UIStroke417.Parent = Unavailable129

local Title43 = Instance.new("TextLabel")
Title43.Name = "Title"
Title43.Size = UDim2.new(0.566559,0,0.435422,0)
Title43.Position = UDim2.new(0.65544,0,0.15042,0)
Title43.AnchorPoint = Vector2.new(0.5,0)
Title43.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title43.BackgroundTransparency = 1
Title43.BorderSizePixel = 0
Title43.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title43.TextColor3 = Color3.fromRGB(0,13,76)
Title43.TextSize = 29
Title43.Font = Enum.Font.Arcade
Title43.TextWrapped = true
Title43.TextScaled = true
Title43.RichText = true
Title43.Visible = false
Title43.AutomaticSize = Enum.AutomaticSize.X
Title43.Parent = COM_85234255603766399462

local UIGradient162 = Instance.new("UIGradient")
UIGradient162.Name = "UIGradient"
UIGradient162.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient162.Rotation = -90
UIGradient162.Offset = Vector2.new(0,0)
UIGradient162.Parent = Title43

local UIStroke418 = Instance.new("UIStroke")
UIStroke418.Name = "UIStroke"
UIStroke418.Color = Color3.fromRGB(255,255,255)
UIStroke418.Thickness = 2
UIStroke418.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke418.Parent = Title43

local UIListLayout24 = Instance.new("UIListLayout")
UIListLayout24.Name = "UIListLayout"
UIListLayout24.Padding = UDim.new(0.019,0)
UIListLayout24.FillDirection = Enum.FillDirection.Horizontal
UIListLayout24.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout24.Wraps = false
UIListLayout24.Parent = Special21

local Special22 = Instance.new("Frame")
Special22.Name = "Special"
Special22.Size = UDim2.new(0.728177,0,0.493216,0)
Special22.Position = UDim2.new(-7.97545e-08,0,0.0517211,0)
Special22.BackgroundColor3 = Color3.fromRGB(255,255,255)
Special22.BackgroundTransparency = 1
Special22.BorderColor3 = Color3.fromRGB(0,0,0)
Special22.BorderSizePixel = 0
Special22.Parent = ScrollingFrame

local COM_3368758568533361125 = Instance.new("Frame")
COM_3368758568533361125.Name = "COM-3368758568533361125"
COM_3368758568533361125.Size = UDim2.new(0.894198,0,0.931112,0)
COM_3368758568533361125.Position = UDim2.new(5.4771e-08,0,0,0)
COM_3368758568533361125.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_3368758568533361125.BackgroundTransparency = 1
COM_3368758568533361125.BorderColor3 = Color3.fromRGB(0,0,0)
COM_3368758568533361125.BorderSizePixel = 0
COM_3368758568533361125.ZIndex = 2
COM_3368758568533361125.Parent = Special22

local BG44 = Instance.new("Frame")
BG44.Name = "BG"
BG44.Size = UDim2.new(1,0,1,0)
BG44.Position = UDim2.new(0.5,0,0.5,0)
BG44.AnchorPoint = Vector2.new(0.5,0.5)
BG44.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG44.BackgroundTransparency = 1
BG44.BorderColor3 = Color3.fromRGB(0,0,0)
BG44.BorderSizePixel = 0
BG44.ZIndex = -1
BG44.Parent = COM_3368758568533361125

local Dropshadow43 = Instance.new("Frame")
Dropshadow43.Name = "Dropshadow"
Dropshadow43.Size = UDim2.new(0.970515,0,0.968522,0)
Dropshadow43.Position = UDim2.new(1.29539e-07,0,1.028,0)
Dropshadow43.AnchorPoint = Vector2.new(0,1)
Dropshadow43.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow43.BackgroundTransparency = 0.5
Dropshadow43.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow43.BorderSizePixel = 0
Dropshadow43.ZIndex = -2
Dropshadow43.Parent = BG44

local UIStroke419 = Instance.new("UIStroke")
UIStroke419.Name = "UIStroke"
UIStroke419.Thickness = 2.79551
UIStroke419.Transparency = 1
UIStroke419.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke419.Parent = Dropshadow43

local Frame44 = Instance.new("Frame")
Frame44.Name = "Frame"
Frame44.Size = UDim2.new(0.984612,0,0.95775,0)
Frame44.Position = UDim2.new(0.506631,0,0.478875,0)
Frame44.AnchorPoint = Vector2.new(0.5,0.5)
Frame44.BackgroundColor3 = Color3.fromRGB(3,148,13)
Frame44.BorderColor3 = Color3.fromRGB(0,0,0)
Frame44.BorderSizePixel = 0
Frame44.ZIndex = -1
Frame44.Parent = BG44

local Pattern38 = Instance.new("ImageLabel")
Pattern38.Name = "Pattern"
Pattern38.Size = UDim2.new(1,0,1,0)
Pattern38.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern38.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern38.BackgroundTransparency = 1
Pattern38.BorderSizePixel = 0
Pattern38.Image = "rbxassetid://80642004017970"
Pattern38.ZIndex = -1
Pattern38.Parent = Frame44

local UIStroke420 = Instance.new("UIStroke")
UIStroke420.Name = "UIStroke"
UIStroke420.Thickness = 1.86368
UIStroke420.Parent = Pattern38

local Pattern39 = Instance.new("ImageLabel")
Pattern39.Name = "Pattern"
Pattern39.Size = UDim2.new(1,0,1,0)
Pattern39.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern39.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern39.BackgroundTransparency = 1
Pattern39.BorderSizePixel = 0
Pattern39.Image = "rbxassetid://80973209358665"
Pattern39.ImageColor3 = Color3.fromRGB(49,140,67)
Pattern39.ImageTransparency = 0.26
Pattern39.Visible = false
Pattern39.ZIndex = -1
Pattern39.Parent = Frame44

local UIStroke421 = Instance.new("UIStroke")
UIStroke421.Name = "UIStroke"
UIStroke421.Thickness = 1.86368
UIStroke421.Parent = Pattern39

local Pattern40 = Instance.new("ImageLabel")
Pattern40.Name = "Pattern"
Pattern40.Size = UDim2.new(1,0,1,0)
Pattern40.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern40.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern40.BackgroundTransparency = 1
Pattern40.BorderSizePixel = 0
Pattern40.Image = "rbxassetid://80973209358665"
Pattern40.ImageTransparency = 0.18
Pattern40.ZIndex = -1
Pattern40.Parent = Frame44

local UIGradient163 = Instance.new("UIGradient")
UIGradient163.Name = "UIGradient"
UIGradient163.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient163.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
UIGradient163.Rotation = 90
UIGradient163.Offset = Vector2.new(0,0)
UIGradient163.Parent = Pattern40

local UIStroke422 = Instance.new("UIStroke")
UIStroke422.Name = "UIStroke"
UIStroke422.Thickness = 1.86368
UIStroke422.Parent = Pattern40

local UIGradient164 = Instance.new("UIGradient")
UIGradient164.Name = "UIGradient"
UIGradient164.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient164.Rotation = 90
UIGradient164.Offset = Vector2.new(0,0)
UIGradient164.Parent = Frame44

local UIStroke423 = Instance.new("UIStroke")
UIStroke423.Name = "UIStroke"
UIStroke423.Thickness = 1.86368
UIStroke423.Parent = Frame44

local Highlight37 = Instance.new("Frame")
Highlight37.Name = "Highlight"
Highlight37.Size = UDim2.new(0.985676,0,0.95775,0)
Highlight37.Position = UDim2.new(0.507162,0,0.478875,0)
Highlight37.AnchorPoint = Vector2.new(0.5,0.5)
Highlight37.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight37.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight37.BorderSizePixel = 0
Highlight37.Visible = false
Highlight37.ZIndex = -2
Highlight37.Parent = BG44

local UIStroke424 = Instance.new("UIStroke")
UIStroke424.Name = "UIStroke"
UIStroke424.Color = Color3.fromRGB(255,242,0)
UIStroke424.Thickness = 2.79551
UIStroke424.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke424.Parent = Highlight37

local CanvasGroup15 = Instance.new("CanvasGroup")
CanvasGroup15.Name = "CanvasGroup"
CanvasGroup15.Size = UDim2.new(1,0,1,0)
CanvasGroup15.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup15.BackgroundTransparency = 1
CanvasGroup15.Parent = COM_3368758568533361125

local Thumbnail71 = Instance.new("ImageLabel")
Thumbnail71.Name = "Thumbnail"
Thumbnail71.Size = UDim2.new(0.293901,0,0.766222,0)
Thumbnail71.Position = UDim2.new(0.104398,0,0.514738,0)
Thumbnail71.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail71.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail71.BackgroundTransparency = 1
Thumbnail71.BorderSizePixel = 0
Thumbnail71.Image = "rbxassetid://79060220045867"
Thumbnail71.ScaleType = Enum.ScaleType.Fit
Thumbnail71.ZIndex = 0
Thumbnail71.Rotation = -11
Thumbnail71.Parent = CanvasGroup15

local Unavailable130 = Instance.new("TextLabel")
Unavailable130.Name = "Unavailable"
Unavailable130.Size = UDim2.new(0.7,0,0.7,0)
Unavailable130.Position = UDim2.new(0.5,0,0.5,0)
Unavailable130.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable130.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable130.BackgroundTransparency = 1
Unavailable130.BorderSizePixel = 0
Unavailable130.Text = "Unavailable"
Unavailable130.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable130.TextSize = 14
Unavailable130.Font = Enum.Font.FredokaOne
Unavailable130.TextWrapped = true
Unavailable130.TextScaled = true
Unavailable130.Visible = false
Unavailable130.Parent = Thumbnail71

local UIStroke425 = Instance.new("UIStroke")
UIStroke425.Name = "UIStroke"
UIStroke425.Thickness = 2
UIStroke425.Parent = Unavailable130

local Thumbnail72 = Instance.new("ImageLabel")
Thumbnail72.Name = "Thumbnail"
Thumbnail72.Size = UDim2.new(0.293901,0,0.766222,0)
Thumbnail72.Position = UDim2.new(0.176374,0,0.449167,0)
Thumbnail72.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail72.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail72.BackgroundTransparency = 1
Thumbnail72.BorderSizePixel = 0
Thumbnail72.Image = "rbxassetid://108206963369578"
Thumbnail72.ScaleType = Enum.ScaleType.Fit
Thumbnail72.ZIndex = -1
Thumbnail72.Rotation = 5
Thumbnail72.Parent = CanvasGroup15

local Unavailable131 = Instance.new("TextLabel")
Unavailable131.Name = "Unavailable"
Unavailable131.Size = UDim2.new(0.7,0,0.7,0)
Unavailable131.Position = UDim2.new(0.5,0,0.5,0)
Unavailable131.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable131.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable131.BackgroundTransparency = 1
Unavailable131.BorderSizePixel = 0
Unavailable131.Text = "Unavailable"
Unavailable131.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable131.TextSize = 14
Unavailable131.Font = Enum.Font.FredokaOne
Unavailable131.TextWrapped = true
Unavailable131.TextScaled = true
Unavailable131.Visible = false
Unavailable131.Parent = Thumbnail72

local UIStroke426 = Instance.new("UIStroke")
UIStroke426.Name = "UIStroke"
UIStroke426.Thickness = 2
UIStroke426.Parent = Unavailable131

local DisplayTitle30 = Instance.new("TextLabel")
DisplayTitle30.Name = "DisplayTitle"
DisplayTitle30.Size = UDim2.new(0.453471,0,0.351663,0)
DisplayTitle30.Position = UDim2.new(0.74378,0,0.235969,0)
DisplayTitle30.AnchorPoint = Vector2.new(0.5,0)
DisplayTitle30.BackgroundColor3 = Color3.fromRGB(255,33,103)
DisplayTitle30.BackgroundTransparency = 1
DisplayTitle30.BorderSizePixel = 0
DisplayTitle30.Text = "Bobette 14\" Deluxe Plush (Pre-Order)"
DisplayTitle30.TextColor3 = Color3.fromRGB(2,40,0)
DisplayTitle30.TextSize = 29
DisplayTitle30.Font = Enum.Font.Arcade
DisplayTitle30.TextWrapped = true
DisplayTitle30.TextScaled = true
DisplayTitle30.RichText = true
DisplayTitle30.AutomaticSize = Enum.AutomaticSize.X
DisplayTitle30.Parent = COM_3368758568533361125

local UIAspectRatioConstraint23 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint23.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint23.AspectRatio = 2.66
UIAspectRatioConstraint23.Parent = DisplayTitle30

local UIGradient165 = Instance.new("UIGradient")
UIGradient165.Name = "UIGradient"
UIGradient165.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient165.Rotation = -90
UIGradient165.Offset = Vector2.new(0,0)
UIGradient165.Parent = DisplayTitle30

local UIStroke427 = Instance.new("UIStroke")
UIStroke427.Name = "UIStroke"
UIStroke427.Color = Color3.fromRGB(255,255,255)
UIStroke427.Thickness = 0.931838
UIStroke427.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke427.Parent = DisplayTitle30

local Item41 = Instance.new("ImageLabel")
Item41.Name = "Item"
Item41.Size = UDim2.new(0.913665,0,0.651761,0)
Item41.Position = UDim2.new(0.514096,0,0.463834,0)
Item41.AnchorPoint = Vector2.new(0.5,0.5)
Item41.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item41.BackgroundTransparency = 1
Item41.BorderSizePixel = 0
Item41.Image = "rbxassetid://94959635148921"
Item41.ImageRectOffset = Vector2.new(15,15)
Item41.ImageRectSize = Vector2.new(270,270)
Item41.ScaleType = Enum.ScaleType.Fit
Item41.Visible = false
Item41.ZIndex = -1
Item41.Parent = COM_3368758568533361125

local Unavailable132 = Instance.new("TextLabel")
Unavailable132.Name = "Unavailable"
Unavailable132.Size = UDim2.new(0.7,0,0.7,0)
Unavailable132.Position = UDim2.new(0.5,0,0.5,0)
Unavailable132.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable132.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable132.BackgroundTransparency = 1
Unavailable132.BorderSizePixel = 0
Unavailable132.Text = "Unavailable"
Unavailable132.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable132.TextSize = 14
Unavailable132.Font = Enum.Font.FredokaOne
Unavailable132.TextWrapped = true
Unavailable132.TextScaled = true
Unavailable132.Visible = false
Unavailable132.Parent = Item41

local UIStroke428 = Instance.new("UIStroke")
UIStroke428.Name = "UIStroke"
UIStroke428.Thickness = 2
UIStroke428.Parent = Unavailable132

local New21 = Instance.new("ImageLabel")
New21.Name = "New"
New21.Size = UDim2.new(0.322123,0,0.355513,0)
New21.Position = UDim2.new(0.94212,0,0.0839209,0)
New21.AnchorPoint = Vector2.new(0.5,0.5)
New21.BackgroundColor3 = Color3.fromRGB(255,255,255)
New21.BackgroundTransparency = 1
New21.BorderSizePixel = 0
New21.Image = "rbxassetid://96728750855907"
New21.ScaleType = Enum.ScaleType.Fit
New21.Visible = false
New21.ZIndex = -1
New21.Parent = COM_3368758568533361125

local UIScale60 = Instance.new("UIScale")
UIScale60.Name = "UIScale"
UIScale60.Parent = New21

local Purchase44 = Instance.new("ImageButton")
Purchase44.Name = "Purchase"
Purchase44.Size = UDim2.new(0.436835,0,0.172928,0)
Purchase44.Position = UDim2.new(0.752098,0,0.833662,0)
Purchase44.AnchorPoint = Vector2.new(0.5,0.5)
Purchase44.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase44.BorderSizePixel = 0
Purchase44.ScaleType = Enum.ScaleType.Fit
Purchase44.AutoButtonColor = false
Purchase44.Parent = COM_3368758568533361125

local Price44 = Instance.new("TextLabel")
Price44.Name = "Price"
Price44.Size = UDim2.new(0.78479,0,0.702682,0)
Price44.Position = UDim2.new(0.100663,0,0.0990811,0)
Price44.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price44.BackgroundTransparency = 1
Price44.BorderSizePixel = 0
Price44.Text = "$19.99"
Price44.TextColor3 = Color3.fromRGB(255,255,255)
Price44.TextSize = 14
Price44.Font = Enum.Font.Arcade
Price44.TextWrapped = true
Price44.TextScaled = true
Price44.RichText = true
Price44.AutomaticSize = Enum.AutomaticSize.X
Price44.Parent = Purchase44

local UIGradient166 = Instance.new("UIGradient")
UIGradient166.Name = "UIGradient"
UIGradient166.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient166.Rotation = -90
UIGradient166.Offset = Vector2.new(0,0)
UIGradient166.Parent = Price44

local UIStroke429 = Instance.new("UIStroke")
UIStroke429.Name = "UIStroke"
UIStroke429.Thickness = 0.931838
UIStroke429.Parent = Price44

local UICorner45 = Instance.new("UICorner")
UICorner45.Name = "UICorner"
UICorner45.CornerRadius = UDim.new(1,0)
UICorner45.Parent = Purchase44

local UIGradient167 = Instance.new("UIGradient")
UIGradient167.Name = "UIGradient"
UIGradient167.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient167.Rotation = -90
UIGradient167.Offset = Vector2.new(0,0)
UIGradient167.Parent = Purchase44

local UIScale61 = Instance.new("UIScale")
UIScale61.Name = "UIScale"
UIScale61.Parent = Purchase44

local UIStroke430 = Instance.new("UIStroke")
UIStroke430.Name = "UIStroke"
UIStroke430.Thickness = 1.1648
UIStroke430.Parent = Purchase44

local Thumbnail73 = Instance.new("ImageLabel")
Thumbnail73.Name = "Thumbnail"
Thumbnail73.Size = UDim2.new(0.48234,0,1.2575,0)
Thumbnail73.Position = UDim2.new(0.365108,0,0.447015,0)
Thumbnail73.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail73.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail73.BackgroundTransparency = 1
Thumbnail73.BorderSizePixel = 0
Thumbnail73.Image = "rbxassetid://129329475909328"
Thumbnail73.ScaleType = Enum.ScaleType.Fit
Thumbnail73.ZIndex = 2
Thumbnail73.Parent = COM_3368758568533361125

local Unavailable133 = Instance.new("TextLabel")
Unavailable133.Name = "Unavailable"
Unavailable133.Size = UDim2.new(0.7,0,0.7,0)
Unavailable133.Position = UDim2.new(0.5,0,0.5,0)
Unavailable133.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable133.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable133.BackgroundTransparency = 1
Unavailable133.BorderSizePixel = 0
Unavailable133.Text = "Unavailable"
Unavailable133.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable133.TextSize = 14
Unavailable133.Font = Enum.Font.FredokaOne
Unavailable133.TextWrapped = true
Unavailable133.TextScaled = true
Unavailable133.Visible = false
Unavailable133.Parent = Thumbnail73

local UIStroke431 = Instance.new("UIStroke")
UIStroke431.Name = "UIStroke"
UIStroke431.Thickness = 2
UIStroke431.Parent = Unavailable133

local Title44 = Instance.new("TextLabel")
Title44.Name = "Title"
Title44.Size = UDim2.new(0.566559,0,0.435422,0)
Title44.Position = UDim2.new(0.65544,0,0.15042,0)
Title44.AnchorPoint = Vector2.new(0.5,0)
Title44.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title44.BackgroundTransparency = 1
Title44.BorderSizePixel = 0
Title44.Text = "Gourdy 14\" Deluxe Plush (Pre-Order)"
Title44.TextColor3 = Color3.fromRGB(0,13,76)
Title44.TextSize = 29
Title44.Font = Enum.Font.Arcade
Title44.TextWrapped = true
Title44.TextScaled = true
Title44.RichText = true
Title44.Visible = false
Title44.AutomaticSize = Enum.AutomaticSize.X
Title44.Parent = COM_3368758568533361125

local UIGradient168 = Instance.new("UIGradient")
UIGradient168.Name = "UIGradient"
UIGradient168.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient168.Rotation = -90
UIGradient168.Offset = Vector2.new(0,0)
UIGradient168.Parent = Title44

local UIStroke432 = Instance.new("UIStroke")
UIStroke432.Name = "UIStroke"
UIStroke432.Color = Color3.fromRGB(255,255,255)
UIStroke432.Thickness = 2
UIStroke432.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke432.Parent = Title44

local COM_8147980808737259949 = Instance.new("Frame")
COM_8147980808737259949.Name = "COM-8147980808737259949"
COM_8147980808737259949.Size = UDim2.new(0.442523,0,0.944677,0)
COM_8147980808737259949.Position = UDim2.new(0.913307,0,0,0)
COM_8147980808737259949.BackgroundColor3 = Color3.fromRGB(255,225,0)
COM_8147980808737259949.BackgroundTransparency = 1
COM_8147980808737259949.BorderColor3 = Color3.fromRGB(0,0,0)
COM_8147980808737259949.BorderSizePixel = 0
COM_8147980808737259949.Parent = Special22

local BG45 = Instance.new("Frame")
BG45.Name = "BG"
BG45.Size = UDim2.new(1,0,1,0)
BG45.Position = UDim2.new(0.5,0,0.5,0)
BG45.AnchorPoint = Vector2.new(0.5,0.5)
BG45.BackgroundColor3 = Color3.fromRGB(255,255,255)
BG45.BackgroundTransparency = 1
BG45.BorderColor3 = Color3.fromRGB(0,0,0)
BG45.BorderSizePixel = 0
BG45.ZIndex = -1
BG45.Parent = COM_8147980808737259949

local Dropshadow44 = Instance.new("Frame")
Dropshadow44.Name = "Dropshadow"
Dropshadow44.Size = UDim2.new(0.947997,0,0.95376,0)
Dropshadow44.Position = UDim2.new(-0.00747363,0,1.01324,0)
Dropshadow44.AnchorPoint = Vector2.new(0,1)
Dropshadow44.BackgroundColor3 = Color3.fromRGB(0,0,0)
Dropshadow44.BackgroundTransparency = 0.5
Dropshadow44.BorderColor3 = Color3.fromRGB(0,0,0)
Dropshadow44.BorderSizePixel = 0
Dropshadow44.ZIndex = -2
Dropshadow44.Parent = BG45

local UIStroke433 = Instance.new("UIStroke")
UIStroke433.Name = "UIStroke"
UIStroke433.Thickness = 2.79551
UIStroke433.Transparency = 1
UIStroke433.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke433.Parent = Dropshadow44

local Frame45 = Instance.new("Frame")
Frame45.Name = "Frame"
Frame45.Size = UDim2.new(0.95775,0,0.95775,0)
Frame45.Position = UDim2.new(0.521125,0,0.478875,0)
Frame45.AnchorPoint = Vector2.new(0.5,0.5)
Frame45.BackgroundColor3 = Color3.fromRGB(3,148,13)
Frame45.BorderColor3 = Color3.fromRGB(0,0,0)
Frame45.BorderSizePixel = 0
Frame45.ZIndex = -1
Frame45.Parent = BG45

local Pattern41 = Instance.new("ImageLabel")
Pattern41.Name = "Pattern"
Pattern41.Size = UDim2.new(1,0,1,0)
Pattern41.Position = UDim2.new(0,0,-1.402e-07,0)
Pattern41.BackgroundColor3 = Color3.fromRGB(255,255,255)
Pattern41.BackgroundTransparency = 1
Pattern41.BorderSizePixel = 0
Pattern41.Image = "rbxassetid://80973209358665"
Pattern41.ScaleType = Enum.ScaleType.Crop
Pattern41.ZIndex = -1
Pattern41.Parent = Frame45

local UIGradient169 = Instance.new("UIGradient")
UIGradient169.Name = "UIGradient"
UIGradient169.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient169.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
UIGradient169.Rotation = 90
UIGradient169.Offset = Vector2.new(0,0)
UIGradient169.Parent = Pattern41

local UIStroke434 = Instance.new("UIStroke")
UIStroke434.Name = "UIStroke"
UIStroke434.Thickness = 1.86368
UIStroke434.Parent = Pattern41

local UIGradient170 = Instance.new("UIGradient")
UIGradient170.Name = "UIGradient"
UIGradient170.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.459413,Color3.fromRGB(231,231,231)),ColorSequenceKeypoint.new(1,Color3.fromRGB(153,153,153))})
UIGradient170.Rotation = 90
UIGradient170.Offset = Vector2.new(0,0)
UIGradient170.Parent = Frame45

local UIStroke435 = Instance.new("UIStroke")
UIStroke435.Name = "UIStroke"
UIStroke435.Thickness = 4
UIStroke435.Parent = Frame45

local Highlight38 = Instance.new("Frame")
Highlight38.Name = "Highlight"
Highlight38.Size = UDim2.new(0.954203,0,0.95775,0)
Highlight38.Position = UDim2.new(0.519351,0,0.478875,0)
Highlight38.AnchorPoint = Vector2.new(0.5,0.5)
Highlight38.BackgroundColor3 = Color3.fromRGB(255,255,255)
Highlight38.BorderColor3 = Color3.fromRGB(0,0,0)
Highlight38.BorderSizePixel = 0
Highlight38.Visible = false
Highlight38.ZIndex = -2
Highlight38.Parent = BG45

local UIStroke436 = Instance.new("UIStroke")
UIStroke436.Name = "UIStroke"
UIStroke436.Color = Color3.fromRGB(255,242,0)
UIStroke436.Thickness = 2.79551
UIStroke436.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke436.Parent = Highlight38

local Item42 = Instance.new("ImageLabel")
Item42.Name = "Item"
Item42.Size = UDim2.new(0.902423,0,0.651761,0)
Item42.Position = UDim2.new(0.521125,0,0.463834,0)
Item42.AnchorPoint = Vector2.new(0.5,0.5)
Item42.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item42.BackgroundTransparency = 1
Item42.BorderSizePixel = 0
Item42.Image = "rbxassetid://94959635148921"
Item42.ImageRectOffset = Vector2.new(25,25)
Item42.ImageRectSize = Vector2.new(250,250)
Item42.ScaleType = Enum.ScaleType.Crop
Item42.Visible = false
Item42.ZIndex = -1
Item42.Parent = COM_8147980808737259949

local Unavailable134 = Instance.new("TextLabel")
Unavailable134.Name = "Unavailable"
Unavailable134.Size = UDim2.new(0.7,0,0.7,0)
Unavailable134.Position = UDim2.new(0.5,0,0.5,0)
Unavailable134.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable134.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable134.BackgroundTransparency = 1
Unavailable134.BorderSizePixel = 0
Unavailable134.Text = "Unavailable"
Unavailable134.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable134.TextSize = 14
Unavailable134.Font = Enum.Font.FredokaOne
Unavailable134.TextWrapped = true
Unavailable134.TextScaled = true
Unavailable134.Visible = false
Unavailable134.Parent = Item42

local UIStroke437 = Instance.new("UIStroke")
UIStroke437.Name = "UIStroke"
UIStroke437.Thickness = 2
UIStroke437.Parent = Unavailable134

local Pixel17 = Instance.new("ImageLabel")
Pixel17.Name = "Pixel"
Pixel17.Size = UDim2.new(0.650425,0,0.469759,0)
Pixel17.Position = UDim2.new(0.395126,0,0.554835,0)
Pixel17.AnchorPoint = Vector2.new(0.5,0.5)
Pixel17.BackgroundColor3 = Color3.fromRGB(255,2,2)
Pixel17.BorderSizePixel = 0
Pixel17.Image = "rbxassetid://94959635148921"
Pixel17.ImageRectOffset = Vector2.new(55,100)
Pixel17.ImageRectSize = Vector2.new(30,30)
Pixel17.ScaleType = Enum.ScaleType.Crop
Pixel17.Visible = false
Pixel17.ZIndex = 5
Pixel17.Parent = COM_8147980808737259949

local Unavailable135 = Instance.new("TextLabel")
Unavailable135.Name = "Unavailable"
Unavailable135.Size = UDim2.new(0.7,0,0.7,0)
Unavailable135.Position = UDim2.new(0.5,0,0.5,0)
Unavailable135.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable135.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable135.BackgroundTransparency = 1
Unavailable135.BorderSizePixel = 0
Unavailable135.Text = "Unavailable"
Unavailable135.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable135.TextSize = 14
Unavailable135.Font = Enum.Font.FredokaOne
Unavailable135.TextWrapped = true
Unavailable135.TextScaled = true
Unavailable135.Visible = false
Unavailable135.Parent = Pixel17

local UIStroke438 = Instance.new("UIStroke")
UIStroke438.Name = "UIStroke"
UIStroke438.Thickness = 2
UIStroke438.Parent = Unavailable135

local Purchase45 = Instance.new("ImageButton")
Purchase45.Name = "Purchase"
Purchase45.Size = UDim2.new(0.863319,0,0.170445,0)
Purchase45.Position = UDim2.new(0.514166,0,0.821691,0)
Purchase45.AnchorPoint = Vector2.new(0.5,0.5)
Purchase45.BackgroundColor3 = Color3.fromRGB(255,255,255)
Purchase45.BorderSizePixel = 0
Purchase45.ScaleType = Enum.ScaleType.Fit
Purchase45.AutoButtonColor = false
Purchase45.ZIndex = 6
Purchase45.Parent = COM_8147980808737259949

local Price45 = Instance.new("TextLabel")
Price45.Name = "Price"
Price45.Size = UDim2.new(0.78479,0,0.702682,0)
Price45.Position = UDim2.new(0.100663,0,0.0990811,0)
Price45.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price45.BackgroundTransparency = 1
Price45.BorderSizePixel = 0
Price45.Text = "$19.99"
Price45.TextColor3 = Color3.fromRGB(255,255,255)
Price45.TextSize = 14
Price45.Font = Enum.Font.Arcade
Price45.TextWrapped = true
Price45.TextScaled = true
Price45.RichText = true
Price45.AutomaticSize = Enum.AutomaticSize.X
Price45.Parent = Purchase45

local UIGradient171 = Instance.new("UIGradient")
UIGradient171.Name = "UIGradient"
UIGradient171.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(0.549223,Color3.fromRGB(239,239,239)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,255,255))})
UIGradient171.Rotation = -90
UIGradient171.Offset = Vector2.new(0,0)
UIGradient171.Parent = Price45

local UIStroke439 = Instance.new("UIStroke")
UIStroke439.Name = "UIStroke"
UIStroke439.Thickness = 2
UIStroke439.Parent = Price45

local UICorner46 = Instance.new("UICorner")
UICorner46.Name = "UICorner"
UICorner46.CornerRadius = UDim.new(1,0)
UICorner46.Parent = Purchase45

local UIGradient172 = Instance.new("UIGradient")
UIGradient172.Name = "UIGradient"
UIGradient172.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(35,31,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(88,89,91))})
UIGradient172.Rotation = -90
UIGradient172.Offset = Vector2.new(0,0)
UIGradient172.Parent = Purchase45

local UIScale62 = Instance.new("UIScale")
UIScale62.Name = "UIScale"
UIScale62.Parent = Purchase45

local UIStroke440 = Instance.new("UIStroke")
UIStroke440.Name = "UIStroke"
UIStroke440.Thickness = 2.5
UIStroke440.Parent = Purchase45

local Thumbnail74 = Instance.new("ImageLabel")
Thumbnail74.Name = "Thumbnail"
Thumbnail74.Size = UDim2.new(1.03177,0,0.875373,0)
Thumbnail74.Position = UDim2.new(0.511832,0,0.372283,0)
Thumbnail74.AnchorPoint = Vector2.new(0.5,0.5)
Thumbnail74.BackgroundColor3 = Color3.fromRGB(255,255,255)
Thumbnail74.BackgroundTransparency = 1
Thumbnail74.BorderSizePixel = 0
Thumbnail74.Image = "rbxassetid://126209362584779"
Thumbnail74.ScaleType = Enum.ScaleType.Fit
Thumbnail74.ZIndex = -1
Thumbnail74.Parent = COM_8147980808737259949

local Unavailable136 = Instance.new("TextLabel")
Unavailable136.Name = "Unavailable"
Unavailable136.Size = UDim2.new(0.7,0,0.7,0)
Unavailable136.Position = UDim2.new(0.5,0,0.5,0)
Unavailable136.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable136.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable136.BackgroundTransparency = 1
Unavailable136.BorderSizePixel = 0
Unavailable136.Text = "Unavailable"
Unavailable136.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable136.TextSize = 14
Unavailable136.Font = Enum.Font.FredokaOne
Unavailable136.TextWrapped = true
Unavailable136.TextScaled = true
Unavailable136.Visible = false
Unavailable136.Parent = Thumbnail74

local UIStroke441 = Instance.new("UIStroke")
UIStroke441.Name = "UIStroke"
UIStroke441.Thickness = 2
UIStroke441.Parent = Unavailable136

local Title45 = Instance.new("TextLabel")
Title45.Name = "Title"
Title45.Size = UDim2.new(0.874784,0,0.149,0)
Title45.Position = UDim2.new(0.531264,0,0.0306123,0)
Title45.AnchorPoint = Vector2.new(0.5,0)
Title45.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title45.BackgroundTransparency = 1
Title45.BorderSizePixel = 0
Title45.Text = "Bobette 11” x 14” Poster"
Title45.TextColor3 = Color3.fromRGB(0,0,0)
Title45.TextSize = 29
Title45.Font = Enum.Font.Arcade
Title45.TextXAlignment = Enum.TextXAlignment.Left
Title45.TextYAlignment = Enum.TextYAlignment.Top
Title45.TextWrapped = true
Title45.TextScaled = true
Title45.RichText = true
Title45.Visible = false
Title45.AutomaticSize = Enum.AutomaticSize.X
Title45.Parent = COM_8147980808737259949

local UITextSizeConstraint20 = Instance.new("UITextSizeConstraint")
UITextSizeConstraint20.Name = "UITextSizeConstraint"
UITextSizeConstraint20.MaxTextSize = 29
UITextSizeConstraint20.Parent = Title45

local UIListLayout25 = Instance.new("UIListLayout")
UIListLayout25.Name = "UIListLayout"
UIListLayout25.Padding = UDim.new(0.019,0)
UIListLayout25.FillDirection = Enum.FillDirection.Horizontal
UIListLayout25.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout25.Wraps = false
UIListLayout25.Parent = Special22

local UIListLayout26 = Instance.new("UIListLayout")
UIListLayout26.Name = "UIListLayout"
UIListLayout26.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout26.Wraps = false
UIListLayout26.Parent = ScrollingFrame

local Template1 = Instance.new("Frame")
Template1.Name = "Template1"
Template1.Size = UDim2.new(0.326044,0,0.954072,0)
Template1.BackgroundColor3 = Color3.fromRGB(255,225,0)
Template1.BackgroundTransparency = 1
Template1.BorderColor3 = Color3.fromRGB(0,0,0)
Template1.BorderSizePixel = 0
Template1.Visible = false
Template1.Parent = UIListLayout26

local BG46 = Instance.new("Frame")
BG46.Name = "BG"
BG46.Size = UDim2.new(1.03302,0,1.05281,0)
BG46.Position = UDim2.new(0.5,0,0.490778,0)
BG46.AnchorPoint = Vector2.new(0.5,0.5)
BG46.BackgroundColor3 = Color3.fromRGB(7,7,7)
BG46.BackgroundTransparency = 1
BG46.BorderColor3 = Color3.fromRGB(0,0,0)
BG46.BorderSizePixel = 0
BG46.ZIndex = -1
BG46.Parent = Template1

local Background4 = Instance.new("ImageLabel")
Background4.Name = "Background"
Background4.Size = UDim2.new(1,0,1,0)
Background4.Position = UDim2.new(0.5,0,0.5,0)
Background4.AnchorPoint = Vector2.new(0.5,0.5)
Background4.BackgroundColor3 = Color3.fromRGB(255,255,255)
Background4.BackgroundTransparency = 1
Background4.BorderSizePixel = 0
Background4.Image = "rbxassetid://91674148062510"
Background4.ScaleType = Enum.ScaleType.Fit
Background4.ZIndex = 0
Background4.Parent = BG46

local Style2 = Instance.new("ImageLabel")
Style2.Name = "Style"
Style2.Size = UDim2.new(1,0,1,0)
Style2.Position = UDim2.new(0.5,0,0.5,0)
Style2.AnchorPoint = Vector2.new(0.5,0.5)
Style2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Style2.BackgroundTransparency = 1
Style2.BorderSizePixel = 0
Style2.Image = "rbxassetid://121124169704314"
Style2.ScaleType = Enum.ScaleType.Fit
Style2.ZIndex = 0
Style2.Parent = BG46

local Item43 = Instance.new("ImageLabel")
Item43.Name = "Item"
Item43.Size = UDim2.new(0.884324,0,0.503534,0)
Item43.Position = UDim2.new(0.5,0,0.462408,0)
Item43.AnchorPoint = Vector2.new(0.5,0.5)
Item43.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item43.BackgroundTransparency = 1
Item43.BorderSizePixel = 0
Item43.Image = "rbxassetid://2735820382"
Item43.ScaleType = Enum.ScaleType.Fit
Item43.Parent = Template1

local UIAspectRatioConstraint24 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint24.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint24.Parent = Item43

local Unavailable137 = Instance.new("TextLabel")
Unavailable137.Name = "Unavailable"
Unavailable137.Size = UDim2.new(0.7,0,0.7,0)
Unavailable137.Position = UDim2.new(0.5,0,0.5,0)
Unavailable137.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable137.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable137.BackgroundTransparency = 1
Unavailable137.BorderSizePixel = 0
Unavailable137.Text = "Unavailable"
Unavailable137.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable137.TextSize = 14
Unavailable137.Font = Enum.Font.FredokaOne
Unavailable137.TextWrapped = true
Unavailable137.TextScaled = true
Unavailable137.Visible = false
Unavailable137.Parent = Item43

local UIStroke442 = Instance.new("UIStroke")
UIStroke442.Name = "UIStroke"
UIStroke442.Thickness = 2
UIStroke442.Parent = Unavailable137

local Purchase46 = Instance.new("ImageButton")
Purchase46.Name = "Purchase"
Purchase46.Size = UDim2.new(0.70159,0,0.133162,0)
Purchase46.Position = UDim2.new(0.5,0,0.818573,0)
Purchase46.AnchorPoint = Vector2.new(0.5,0.5)
Purchase46.BackgroundColor3 = Color3.fromRGB(102,213,117)
Purchase46.BackgroundTransparency = 1
Purchase46.BorderSizePixel = 0
Purchase46.Image = "rbxassetid://83503830393339"
Purchase46.ScaleType = Enum.ScaleType.Fit
Purchase46.AutoButtonColor = false
Purchase46.Active = false
Purchase46.Parent = Template1

local Price46 = Instance.new("TextLabel")
Price46.Name = "Price"
Price46.Size = UDim2.new(0.78479,0,0.603976,0)
Price46.Position = UDim2.new(0.100663,0,0.190473,0)
Price46.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price46.BackgroundTransparency = 1
Price46.BorderSizePixel = 0
Price46.Text = "$19.99"
Price46.TextColor3 = Color3.fromRGB(255,255,255)
Price46.TextSize = 14
Price46.Font = Enum.Font.FredokaOne
Price46.TextWrapped = true
Price46.TextScaled = true
Price46.RichText = true
Price46.AutomaticSize = Enum.AutomaticSize.X
Price46.Parent = Purchase46

local UIStroke443 = Instance.new("UIStroke")
UIStroke443.Name = "UIStroke"
UIStroke443.Thickness = 4
UIStroke443.Parent = Price46

local UIAspectRatioConstraint25 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint25.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint25.AspectRatio = 3
UIAspectRatioConstraint25.Parent = Purchase46

local Title46 = Instance.new("TextLabel")
Title46.Name = "Title"
Title46.Size = UDim2.new(0.691791,0,0.0883971,0)
Title46.Position = UDim2.new(0.5,0,0.0572088,0)
Title46.AnchorPoint = Vector2.new(0.5,0)
Title46.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title46.BackgroundTransparency = 1
Title46.BorderSizePixel = 0
Title46.Text = "Dandy Plush"
Title46.TextColor3 = Color3.fromRGB(255,255,255)
Title46.TextSize = 14
Title46.Font = Enum.Font.FredokaOne
Title46.TextWrapped = true
Title46.TextScaled = true
Title46.RichText = true
Title46.AutomaticSize = Enum.AutomaticSize.X
Title46.Parent = Template1

local UIStroke444 = Instance.new("UIStroke")
UIStroke444.Name = "UIStroke"
UIStroke444.Thickness = 4
UIStroke444.Parent = Title46

local Template22 = Instance.new("Frame")
Template22.Name = "Template2"
Template22.Size = UDim2.new(0.326044,0,0.954072,0)
Template22.BackgroundColor3 = Color3.fromRGB(255,225,0)
Template22.BackgroundTransparency = 1
Template22.BorderColor3 = Color3.fromRGB(0,0,0)
Template22.BorderSizePixel = 0
Template22.Visible = false
Template22.LayoutOrder = 2
Template22.Parent = UIListLayout26

local BG47 = Instance.new("Frame")
BG47.Name = "BG"
BG47.Size = UDim2.new(1.03302,0,1.05281,0)
BG47.Position = UDim2.new(0.5,0,0.490778,0)
BG47.AnchorPoint = Vector2.new(0.5,0.5)
BG47.BackgroundColor3 = Color3.fromRGB(7,7,7)
BG47.BackgroundTransparency = 1
BG47.BorderColor3 = Color3.fromRGB(0,0,0)
BG47.BorderSizePixel = 0
BG47.ZIndex = -1
BG47.Parent = Template22

local Background5 = Instance.new("ImageLabel")
Background5.Name = "Background"
Background5.Size = UDim2.new(1,0,1,0)
Background5.Position = UDim2.new(0.5,0,0.5,0)
Background5.AnchorPoint = Vector2.new(0.5,0.5)
Background5.BackgroundColor3 = Color3.fromRGB(255,255,255)
Background5.BackgroundTransparency = 1
Background5.BorderSizePixel = 0
Background5.Image = "rbxassetid://91674148062510"
Background5.ScaleType = Enum.ScaleType.Fit
Background5.ZIndex = 0
Background5.Parent = BG47

local Style3 = Instance.new("ImageLabel")
Style3.Name = "Style"
Style3.Size = UDim2.new(1,0,1,0)
Style3.Position = UDim2.new(0.5,0,0.5,0)
Style3.AnchorPoint = Vector2.new(0.5,0.5)
Style3.BackgroundColor3 = Color3.fromRGB(255,255,255)
Style3.BackgroundTransparency = 1
Style3.BorderSizePixel = 0
Style3.Image = "rbxassetid://108226130234733"
Style3.ScaleType = Enum.ScaleType.Fit
Style3.ZIndex = 0
Style3.Parent = BG47

local Item44 = Instance.new("ImageLabel")
Item44.Name = "Item"
Item44.Size = UDim2.new(0.884324,0,0.503534,0)
Item44.Position = UDim2.new(0.5,0,0.462408,0)
Item44.AnchorPoint = Vector2.new(0.5,0.5)
Item44.BackgroundColor3 = Color3.fromRGB(255,255,255)
Item44.BackgroundTransparency = 1
Item44.BorderSizePixel = 0
Item44.Image = "rbxassetid://2735820382"
Item44.ScaleType = Enum.ScaleType.Fit
Item44.Parent = Template22

local UIAspectRatioConstraint26 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint26.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint26.Parent = Item44

local Unavailable138 = Instance.new("TextLabel")
Unavailable138.Name = "Unavailable"
Unavailable138.Size = UDim2.new(0.7,0,0.7,0)
Unavailable138.Position = UDim2.new(0.5,0,0.5,0)
Unavailable138.AnchorPoint = Vector2.new(0.5,0.5)
Unavailable138.BackgroundColor3 = Color3.fromRGB(255,255,255)
Unavailable138.BackgroundTransparency = 1
Unavailable138.BorderSizePixel = 0
Unavailable138.Text = "Unavailable"
Unavailable138.TextColor3 = Color3.fromRGB(255,255,255)
Unavailable138.TextSize = 14
Unavailable138.Font = Enum.Font.FredokaOne
Unavailable138.TextWrapped = true
Unavailable138.TextScaled = true
Unavailable138.Visible = false
Unavailable138.Parent = Item44

local UIStroke445 = Instance.new("UIStroke")
UIStroke445.Name = "UIStroke"
UIStroke445.Thickness = 2
UIStroke445.Parent = Unavailable138

local Purchase47 = Instance.new("ImageButton")
Purchase47.Name = "Purchase"
Purchase47.Size = UDim2.new(0.70159,0,0.133162,0)
Purchase47.Position = UDim2.new(0.5,0,0.818573,0)
Purchase47.AnchorPoint = Vector2.new(0.5,0.5)
Purchase47.BackgroundColor3 = Color3.fromRGB(102,213,117)
Purchase47.BackgroundTransparency = 1
Purchase47.BorderSizePixel = 0
Purchase47.Image = "rbxassetid://83503830393339"
Purchase47.ScaleType = Enum.ScaleType.Fit
Purchase47.Parent = Template22

local Price47 = Instance.new("TextLabel")
Price47.Name = "Price"
Price47.Size = UDim2.new(0.78479,0,0.603976,0)
Price47.Position = UDim2.new(0.100663,0,0.190473,0)
Price47.BackgroundColor3 = Color3.fromRGB(255,33,103)
Price47.BackgroundTransparency = 1
Price47.BorderSizePixel = 0
Price47.Text = "$19.99"
Price47.TextColor3 = Color3.fromRGB(255,255,255)
Price47.TextSize = 14
Price47.Font = Enum.Font.FredokaOne
Price47.TextWrapped = true
Price47.TextScaled = true
Price47.RichText = true
Price47.AutomaticSize = Enum.AutomaticSize.X
Price47.Parent = Purchase47

local UIStroke446 = Instance.new("UIStroke")
UIStroke446.Name = "UIStroke"
UIStroke446.Thickness = 4
UIStroke446.Parent = Price47

local UIAspectRatioConstraint27 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint27.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint27.AspectRatio = 3
UIAspectRatioConstraint27.Parent = Purchase47

local Title47 = Instance.new("TextLabel")
Title47.Name = "Title"
Title47.Size = UDim2.new(0.691791,0,0.0883971,0)
Title47.Position = UDim2.new(0.5,0,0.0572088,0)
Title47.AnchorPoint = Vector2.new(0.5,0)
Title47.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title47.BackgroundTransparency = 1
Title47.BorderSizePixel = 0
Title47.Text = "Dandy Plush"
Title47.TextColor3 = Color3.fromRGB(255,255,255)
Title47.TextSize = 14
Title47.Font = Enum.Font.FredokaOne
Title47.TextWrapped = true
Title47.TextScaled = true
Title47.RichText = true
Title47.AutomaticSize = Enum.AutomaticSize.X
Title47.Parent = Template22

local UIStroke447 = Instance.new("UIStroke")
UIStroke447.Name = "UIStroke"
UIStroke447.Thickness = 4
UIStroke447.Parent = Title47

local Title48 = Instance.new("TextLabel")
Title48.Name = "Title"
Title48.Size = UDim2.new(0.602898,0,0.0681394,0)
Title48.Position = UDim2.new(0.446511,0,0.0153459,0)
Title48.AnchorPoint = Vector2.new(0.5,0)
Title48.BackgroundColor3 = Color3.fromRGB(255,33,103)
Title48.BackgroundTransparency = 1
Title48.BorderSizePixel = 0
Title48.Text = "Official Merch!!!"
Title48.TextColor3 = Color3.fromRGB(255,255,255)
Title48.TextSize = 29
Title48.Font = Enum.Font.Arcade
Title48.TextXAlignment = Enum.TextXAlignment.Left
Title48.TextYAlignment = Enum.TextYAlignment.Top
Title48.TextWrapped = true
Title48.TextScaled = true
Title48.RichText = true
Title48.AutomaticSize = Enum.AutomaticSize.X
Title48.Parent = ShopifyFrame

local UIGradient173 = Instance.new("UIGradient")
UIGradient173.Name = "UIGradient"
UIGradient173.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(0.0967185,Color3.fromRGB(235,235,235)),ColorSequenceKeypoint.new(0.416235,Color3.fromRGB(241,241,241)),ColorSequenceKeypoint.new(1,Color3.fromRGB(53,53,53))})
UIGradient173.Rotation = 90
UIGradient173.Offset = Vector2.new(0,0)
UIGradient173.Parent = Title48

local UIStroke448 = Instance.new("UIStroke")
UIStroke448.Name = "UIStroke"
UIStroke448.Thickness = 0.931838
UIStroke448.LineJoinMode = Enum.LineJoinMode.Miter
UIStroke448.Parent = Title48

local UIAspectRatioConstraint28 = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint28.Name = "UIAspectRatioConstraint"
UIAspectRatioConstraint28.AspectRatio = 1.55
UIAspectRatioConstraint28.Parent = ShopifyFrame

local UIScale63 = Instance.new("UIScale")
UIScale63.Name = "UIScale"
UIScale63.Parent = ShopifyFrame

local UISizeConstraint = Instance.new("UISizeConstraint")
UISizeConstraint.Name = "UISizeConstraint"
UISizeConstraint.MinSize = Vector2.new(500,300)
UISizeConstraint.Parent = ShopifyFrame

local Bottom = Instance.new("Frame")
Bottom.Name = "Bottom"
Bottom.Size = UDim2.new(1,0,1,0)
Bottom.BackgroundColor3 = Color3.fromRGB(255,255,255)
Bottom.BackgroundTransparency = 1
Bottom.BorderColor3 = Color3.fromRGB(0,0,0)
Bottom.BorderSizePixel = 0
Bottom.LayoutOrder = 10
Bottom.Parent = ShopifyFrame

local CanvasGroup16 = Instance.new("CanvasGroup")
CanvasGroup16.Name = "CanvasGroup"
CanvasGroup16.Size = UDim2.new(0.438,0,0.127,0)
CanvasGroup16.Position = UDim2.new(0.4,0,0.797,0)
CanvasGroup16.BackgroundColor3 = Color3.fromRGB(255,255,255)
CanvasGroup16.BackgroundTransparency = 1
CanvasGroup16.Visible = false
CanvasGroup16.Parent = Bottom

local DialogueBox = Instance.new("TextLabel")
DialogueBox.Name = "DialogueBox"
DialogueBox.Size = UDim2.new(0.925,0,0.525,0)
DialogueBox.Position = UDim2.new(0.5,0,0.5,0)
DialogueBox.AnchorPoint = Vector2.new(0.5,0.5)
DialogueBox.BackgroundColor3 = Color3.fromRGB(255,255,255)
DialogueBox.BackgroundTransparency = 1
DialogueBox.BorderSizePixel = 0
DialogueBox.Text = "This would be the perfect time for a commercial!"
DialogueBox.TextColor3 = Color3.fromRGB(255,255,255)
DialogueBox.TextSize = 100
DialogueBox.Font = Enum.Font.Arcade
DialogueBox.TextWrapped = true
DialogueBox.TextScaled = true
DialogueBox.TextStrokeTransparency = 0
DialogueBox.ZIndex = 10
DialogueBox.Parent = CanvasGroup16

local SpeechBubble = Instance.new("Frame")
SpeechBubble.Name = "SpeechBubble"
SpeechBubble.Size = UDim2.new(0.975,0,0.55,0)
SpeechBubble.Position = UDim2.new(0.5,0,0.5,0)
SpeechBubble.AnchorPoint = Vector2.new(0.5,0.5)
SpeechBubble.BackgroundColor3 = Color3.fromRGB(151,255,160)
SpeechBubble.BorderColor3 = Color3.fromRGB(0,0,0)
SpeechBubble.BorderSizePixel = 0
SpeechBubble.ZIndex = 2
SpeechBubble.Parent = CanvasGroup16

local ImageLabel2 = Instance.new("ImageLabel")
ImageLabel2.Name = "ImageLabel"
ImageLabel2.Size = UDim2.new(1,0,1,0)
ImageLabel2.BackgroundColor3 = Color3.fromRGB(255,255,255)
ImageLabel2.BackgroundTransparency = 1
ImageLabel2.BorderSizePixel = 0
ImageLabel2.Image = "rbxassetid://6794283750"
ImageLabel2.ImageTransparency = 0.95
ImageLabel2.ScaleType = Enum.ScaleType.Tile
ImageLabel2.ZIndex = 3
ImageLabel2.Parent = SpeechBubble

local UICorner47 = Instance.new("UICorner")
UICorner47.Name = "UICorner"
UICorner47.CornerRadius = UDim.new(0.1,0)
UICorner47.Parent = SpeechBubble

local UIGradient174 = Instance.new("UIGradient")
UIGradient174.Name = "UIGradient"
UIGradient174.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(109,109,109))})
UIGradient174.Rotation = 90
UIGradient174.Offset = Vector2.new(0,0)
UIGradient174.Parent = SpeechBubble

local SpeechBubbleBG = Instance.new("Frame")
SpeechBubbleBG.Name = "SpeechBubbleBG"
SpeechBubbleBG.Size = UDim2.new(1,0,0.6,0)
SpeechBubbleBG.Position = UDim2.new(0.5,0,0.5,0)
SpeechBubbleBG.AnchorPoint = Vector2.new(0.5,0.5)
SpeechBubbleBG.BackgroundColor3 = Color3.fromRGB(0,0,0)
SpeechBubbleBG.BorderColor3 = Color3.fromRGB(0,0,0)
SpeechBubbleBG.BorderSizePixel = 0
SpeechBubbleBG.Parent = CanvasGroup16

local UICorner48 = Instance.new("UICorner")
UICorner48.Name = "UICorner"
UICorner48.CornerRadius = UDim.new(0.1,0)
UICorner48.Parent = SpeechBubbleBG

local UIGradient175 = Instance.new("UIGradient")
UIGradient175.Name = "UIGradient"
UIGradient175.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8,0),NumberSequenceKeypoint.new(1,0.8,0)})
UIGradient175.Offset = Vector2.new(0,0)
UIGradient175.Parent = CanvasGroup16

local Web = Instance.new("ImageLabel")
Web.Name = "Web"
Web.Size = UDim2.new(0.463033,0,0.352901,0)
Web.Position = UDim2.new(2.88541e-08,0,0.627239,0)
Web.BackgroundColor3 = Color3.fromRGB(255,255,255)
Web.BackgroundTransparency = 1
Web.BorderSizePixel = 0
Web.Image = "rbxassetid://70769444307862"
Web.ImageColor3 = Color3.fromRGB(125,125,125)
Web.ImageTransparency = 1
Web.ScaleType = Enum.ScaleType.Fit
Web.Parent = Bottom

local screen = Instance.new("ScreenGui")
screen.Name = "ShopifyFrame_Test"
screen.ResetOnSpawn = false
screen.IgnoreGuiInset = true
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screen.DisplayOrder = 100
screen.Parent = PlayerGui

ShopifyFrame.Visible = true
ShopifyFrame.Parent = screen

print("[ShopifyFrame Test] Loaded — GUI should be visible")
return ShopifyFrame