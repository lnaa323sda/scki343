--// DieverHub.lua (COMPLETE - FIXED & CLEAN)
--// Fixes included:
--//  - Removed bottom-left "Selected: ..." text (not created)
--//  - Removed "white haze": shadow OFF by default + darker scrollbars
--//  - Overlay popups (Dropdown/ListSelect) always on top
--//  - Drag + Free Resize (bottom-right grip)
--//  - Compact Notify with Logo: Win:Notify(title, text, duration, iconImage)
--//    (logo defaults to window logo stored in self.__logo)
--//
--// Roblox Studio (legal) usage:
--//   local Hub = require(ReplicatedStorage:WaitForChild("DieverHub"))
--//   local Win = Hub:CreateWindow({...})
--//   Win:Notify("Hi","Loaded",2)

local Hub = {}
Hub.__index = Hub

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local LP = Players.LocalPlayer or Players.PlayerAdded:Wait()
local PlayerGui = LP:WaitForChild("PlayerGui")

--// ---------- Helpers ----------
local function Create(className, props, parent)
	local inst = Instance.new(className)
	for k, v in pairs(props or {}) do
		inst[k] = v
	end
	if parent then inst.Parent = parent end
	return inst
end

local function Corner(parent, r)
	Create("UICorner", { CornerRadius = UDim.new(0, r or 10) }, parent)
end

local function Stroke(parent, thickness, transparency)
	Create("UIStroke", {
		Thickness = thickness or 1,
		Transparency = transparency or 0.55,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	}, parent)
end

local function Pad(parent, l, r, t, b)
	Create("UIPadding", {
		PaddingLeft = UDim.new(0, l or 10),
		PaddingRight = UDim.new(0, r or 10),
		PaddingTop = UDim.new(0, t or 10),
		PaddingBottom = UDim.new(0, b or 10),
	}, parent)
end

local function ListLayout(parent, padding)
	return Create("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, padding or 8),
	}, parent)
end

local function Tween(obj, info, goal)
	local t = TweenService:Create(obj, info, goal)
	t:Play()
	return t
end

local function AutoCanvas(sf, layout, extra)
	extra = extra or 6
	local function upd()
		task.defer(function()
			sf.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + extra)
		end)
	end
	layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(upd)
	upd()
end

local function clamp(n, a, b)
	return math.max(a, math.min(b, n))
end

local function setScrollDark(sf)
	sf.ScrollBarImageColor3 = Color3.fromRGB(70, 70, 80)
	sf.ScrollBarImageTransparency = 0.2
	sf.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	sf.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	sf.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
end

--// ---------- Theme Defaults ----------
local DefaultTheme = {
	-- colors
	Bg = Color3.fromRGB(18, 18, 22),
	Panel = Color3.fromRGB(24, 24, 30),
	Item = Color3.fromRGB(34, 34, 42),
	ItemHover = Color3.fromRGB(42, 42, 52),
	Text = Color3.fromRGB(245, 245, 245),
	SubText = Color3.fromRGB(190, 190, 190),
	Accent = Color3.fromRGB(80, 160, 255),

	-- transparency (depth)
	BgA = 0.10,
	PanelA = 0.12,
	ItemA = 0.10,
	StrokeA = 0.55,

	-- Shadow OFF to remove “white haze”
	UseShadow = false,
	ShadowA = 0.65,
	ShadowColor = Color3.fromRGB(0, 0, 0),
}

--// ---------- Window ----------
local Window = {}
Window.__index = Window

local function setActivePopup(win, closerFn)
	if win.__activePopupCloser and win.__activePopupCloser ~= closerFn then
		pcall(win.__activePopupCloser)
	end
	win.__activePopupCloser = closerFn
end

local function clearActivePopup(win, closerFn)
	if win.__activePopupCloser == closerFn then
		win.__activePopupCloser = nil
	end
end

-- Popup builder (Dropdown/ListSelect)
local function BuildOverlayPopup(win, anchorBtn, buildItemsFn, maxH)
	local theme = win.__theme
	local overlay = win.__overlay
	local main = win.__main

	local panel = Create("Frame", {
		Size = UDim2.fromOffset(0, 0),
		BackgroundColor3 = theme.Panel,
		BackgroundTransparency = theme.PanelA,
		Visible = false,
		ClipsDescendants = true,
		ZIndex = 5000,
	}, overlay)
	Corner(panel, 10)
	Stroke(panel, 1, theme.StrokeA)
	Pad(panel, 8, 8, 8, 8)

	local sf = Create("ScrollingFrame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 6,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ZIndex = 5001,
	}, panel)
	setScrollDark(sf)

	local lo = ListLayout(sf, 6)
	AutoCanvas(sf, lo, 8)

	local info = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local open = false
	local conns = {}

	local function place()
		local mainPos = main.AbsolutePosition
		local hp = anchorBtn.AbsolutePosition
		local hs = anchorBtn.AbsoluteSize

		local x = hp.X - mainPos.X
		local y = (hp.Y - mainPos.Y) + hs.Y + 6
		local w = anchorBtn.AbsoluteSize.X

		panel.Position = UDim2.fromOffset(x, y)
		panel.Size = UDim2.fromOffset(w, panel.AbsoluteSize.Y)
	end

	local function closeNow()
		open = false
		Tween(panel, info, { Size = UDim2.fromOffset(anchorBtn.AbsoluteSize.X, 0) })
		task.delay(0.16, function()
			if not open then panel.Visible = false end
		end)
		for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
		table.clear(conns)
	end

	local function openNow()
		open = true
		panel.Visible = true
		place()

		local h = clamp(lo.AbsoluteContentSize.Y + 16, 40, maxH or 200)
		panel.Size = UDim2.fromOffset(anchorBtn.AbsoluteSize.X, 0)
		Tween(panel, info, { Size = UDim2.fromOffset(anchorBtn.AbsoluteSize.X, h) })

		table.insert(conns, main:GetPropertyChangedSignal("Position"):Connect(place))
		table.insert(conns, main:GetPropertyChangedSignal("Size"):Connect(place))

		table.insert(conns, UIS.InputBegan:Connect(function(input, gp)
			if gp then return end
			if not open then return end
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end

			local p = input.Position
			local function inside(obj)
				local ap, as = obj.AbsolutePosition, obj.AbsoluteSize
				return p.X >= ap.X and p.X <= ap.X + as.X and p.Y >= ap.Y and p.Y <= ap.Y + as.Y
			end

			if not inside(anchorBtn) and not inside(panel) then
				closeNow()
			end
		end))
	end

	buildItemsFn(sf, lo)

	return {
		IsOpen = function() return open end,
		Open = openNow,
		Close = closeNow,
	}
end

function Hub:CreateWindow(cfg)
	cfg = cfg or {}
	local theme = cfg.Theme or DefaultTheme

	local gui = Create("ScreenGui", {
		Name = cfg.Name or "DIEVERHUB_UI",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, PlayerGui)

	-- Shadow (optional, OFF by default)
	local shadow
	if theme.UseShadow then
		shadow = Create("ImageLabel", {
			Name = "Shadow",
			BackgroundTransparency = 1,
			Image = "rbxassetid://1316045217",
			ImageTransparency = theme.ShadowA,
			ImageColor3 = theme.ShadowColor or Color3.fromRGB(0, 0, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(10, 10, 118, 118),
			ZIndex = 0,
		}, gui)
	end

	-- Notify stack (top-right)
	local notifyStack = Create("Frame", {
		Name = "NotifyStack",
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -16, 0, 16),
		Size = UDim2.new(0, 280, 1, -32),
		BackgroundTransparency = 1,
		ZIndex = 9999,
	}, gui)
	Create("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 8),
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
	}, notifyStack)

	-- Mini logo toggle button
	local logoImage = cfg.Logo or "rbxassetid://0"
	local logoBtn = Create("ImageButton", {
		Name = "LogoButton",
		Size = cfg.LogoButtonSize or UDim2.fromOffset(56, 56),
		Position = cfg.LogoButtonPos or UDim2.new(0, 16, 0, 16),
		BackgroundColor3 = theme.Panel,
		BackgroundTransparency = theme.PanelA,
		AutoButtonColor = true,
		Image = logoImage,
		ZIndex = 2000
	}, gui)
	Corner(logoBtn, 14)
	Stroke(logoBtn, 1, 0.35)

	Create("TextLabel", {
		Name = "MiniText",
		Size = UDim2.new(1, 0, 0, 16),
		Position = UDim2.new(0, 0, 1, 2),
		BackgroundTransparency = 1,
		Text = cfg.MiniText or "DIEVER HUB",
		TextSize = 12,
		Font = Enum.Font.GothamSemibold,
		TextColor3 = theme.Text,
		ZIndex = 2001
	}, logoBtn)

	-- Main window
	local main = Create("Frame", {
		Name = "Main",
		Size = cfg.Size or UDim2.fromOffset(720, 420),
		AnchorPoint = Vector2.new(0, 0),
		Position = cfg.Position or UDim2.new(0, 16, 0, 84),
		BackgroundColor3 = theme.Bg,
		BackgroundTransparency = theme.BgA,
		Visible = (cfg.Visible ~= false),
		ZIndex = 5
	}, gui)
	Corner(main, 14)
	Stroke(main, 1, 0.35)
	main.ClipsDescendants = false

	if cfg.Center == true then
		main.AnchorPoint = Vector2.new(0.5, 0.5)
		main.Position = UDim2.new(0.5, 0, 0.5, 0)
	end

	-- Constraints
	local minS = cfg.MinSize or Vector2.new(360, 260)
	local maxS = cfg.MaxSize or Vector2.new(1400, 900)
	Create("UISizeConstraint", { MinSize = minS, MaxSize = maxS }, main)

	-- Auto scale (small screens)
	local uiScale = Create("UIScale", { Scale = 1 }, main)
	local lastVP = Vector2.new(0, 0)
	local function updateScale()
		local cam = workspace.CurrentCamera
		if not cam then return end
		local vp = cam.ViewportSize
		if vp == lastVP then return end
		lastVP = vp

		local w, h = main.AbsoluteSize.X, main.AbsoluteSize.Y
		local sx = vp.X / math.max(w, 1)
		local sy = vp.Y / math.max(h, 1)
		local s = math.min(1, sx, sy)
		s = clamp(s * 0.95, 0.6, 1)
		uiScale.Scale = s
	end
	updateScale()
	RunService.RenderStepped:Connect(updateScale)

	-- Overlay layer for popups (always on top)
	local overlay = Create("Frame", {
		Name = "Overlay",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		ZIndex = 999
	}, main)

	-- Top bar
	local top = Create("Frame", {
		Name = "TopBar",
		Size = UDim2.new(1, 0, 0, 44),
		BackgroundColor3 = theme.Panel,
		BackgroundTransparency = theme.PanelA,
		ZIndex = 6
	}, main)
	Corner(top, 14)
	Stroke(top, 1, theme.StrokeA)

	Create("TextLabel", {
		Name = "Title",
		Size = UDim2.new(1, -140, 1, 0),
		Position = UDim2.new(0, 14, 0, 0),
		BackgroundTransparency = 1,
		Text = (cfg.Title or "DIEVER HUB") .. (cfg.SubTitle and (" • " .. cfg.SubTitle) or ""),
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamBold,
		TextSize = 16,
		TextColor3 = theme.Text,
		ZIndex = 7
	}, top)

	local close = Create("TextButton", {
		Name = "Close",
		Size = UDim2.fromOffset(36, 28),
		Position = UDim2.new(1, -46, 0.5, -14),
		BackgroundColor3 = Color3.fromRGB(40, 40, 46),
		BackgroundTransparency = 0.05,
		Text = "X",
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = theme.Text,
		AutoButtonColor = true,
		ZIndex = 7
	}, top)
	Corner(close, 10)

	-- Body split
	local body = Create("Frame", {
		Name = "Body",
		Size = UDim2.new(1, 0, 1, -44),
		Position = UDim2.new(0, 0, 0, 44),
		BackgroundTransparency = 1,
		ZIndex = 6
	}, main)

	local leftWidth = cfg.LeftWidth or 230

	local left = Create("Frame", {
		Name = "Left",
		Size = UDim2.new(0, leftWidth, 1, 0),
		BackgroundTransparency = 1,
		ZIndex = 6
	}, body)

	local right = Create("Frame", {
		Name = "Right",
		Size = UDim2.new(1, -leftWidth, 1, 0),
		Position = UDim2.new(0, leftWidth, 0, 0),
		BackgroundTransparency = 1,
		ZIndex = 6
	}, body)

	-- Left: Tabs list
	local listBox = Create("Frame", {
		Name = "ListBox",
		Size = UDim2.new(1, -16, 1, -16),
		Position = UDim2.new(0, 8, 0, 8),
		BackgroundColor3 = theme.Panel,
		BackgroundTransparency = theme.PanelA,
		ZIndex = 6
	}, left)
	Corner(listBox, 12)
	Stroke(listBox, 1, theme.StrokeA)
	Pad(listBox, 10, 10, 10, 10)

	Create("TextLabel", {
		Name = "ListTitle",
		Size = UDim2.new(1, 0, 0, 22),
		BackgroundTransparency = 1,
		Text = cfg.TabTitle or "Tabs",
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = theme.Text,
		ZIndex = 7
	}, listBox)

	local tabScroll = Create("ScrollingFrame", {
		Name = "TabScroll",
		Size = UDim2.new(1, 0, 1, -30),
		Position = UDim2.new(0, 0, 0, 30),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ScrollBarThickness = 6,
		ZIndex = 7
	}, listBox)
	setScrollDark(tabScroll)
	local tabLayout = ListLayout(tabScroll, 8)
	AutoCanvas(tabScroll, tabLayout, 6)

	-- Right: Content scroll
	local contentFrame = Create("Frame", {
		Name = "ContentFrame",
		Size = UDim2.new(1, -16, 1, -16),
		Position = UDim2.new(0, 8, 0, 8),
		BackgroundTransparency = 1,
		ZIndex = 6
	}, right)

	local contentScroll = Create("ScrollingFrame", {
		Name = "ContentScroll",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ScrollBarThickness = 6,
		ZIndex = 6
	}, contentFrame)
	setScrollDark(contentScroll)
	local contentLayout = ListLayout(contentScroll, 10)
	AutoCanvas(contentScroll, contentLayout, 10)

	-- Sync shadow to main (only if enabled)
	local function syncShadow()
		if not shadow then return end
		shadow.Position = UDim2.new(main.Position.X.Scale, main.Position.X.Offset - 18, main.Position.Y.Scale, main.Position.Y.Offset - 18)
		shadow.Size = UDim2.new(0, main.AbsoluteSize.X + 36, 0, main.AbsoluteSize.Y + 36)
	end
	if shadow then
		task.defer(syncShadow)
		main:GetPropertyChangedSignal("Position"):Connect(syncShadow)
		main:GetPropertyChangedSignal("Size"):Connect(syncShadow)
	end

	-- Drag (Mouse + Touch)
	do
		local dragging = false
		local dragInput, dragStart, startPos

		local function update(input)
			local delta = input.Position - dragStart
			main.Position = UDim2.new(
				startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y
			)
		end

		top.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = main.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		top.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)

		UIS.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)
	end

	-- Resize grip
	do
		local grip = Create("Frame", {
			Name = "ResizeGrip",
			Size = UDim2.fromOffset(22, 22),
			Position = UDim2.new(1, -26, 1, -26),
			BackgroundColor3 = Color3.fromRGB(45, 45, 52),
			BackgroundTransparency = 0.15,
			BorderSizePixel = 0,
			ZIndex = 2000,
		}, main)
		Corner(grip, 6)
		Stroke(grip, 1, theme.StrokeA)

		Create("TextLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Text = "↘",
			Font = Enum.Font.GothamBold,
			TextSize = 14,
			TextColor3 = theme.SubText,
			ZIndex = 2001,
		}, grip)

		local resizing = false
		local startMousePos = Vector2.new(0, 0)
		local startSizePx = Vector2.new(0, 0)

		local function beginResize(input)
			resizing = true
			startMousePos = Vector2.new(input.Position.X, input.Position.Y)
			startSizePx = Vector2.new(main.AbsoluteSize.X, main.AbsoluteSize.Y)
			local conn; conn = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					resizing = false
					if conn then conn:Disconnect() end
				end
			end)
		end

		grip.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				beginResize(input)
			end
		end)

		UIS.InputChanged:Connect(function(input)
			if not resizing then return end
			if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then return end

			local now = Vector2.new(input.Position.X, input.Position.Y)
			local delta = now - startMousePos

			local newX = clamp(startSizePx.X + delta.X, minS.X, maxS.X)
			local newY = clamp(startSizePx.Y + delta.Y, minS.Y, maxS.Y)
			main.Size = UDim2.fromOffset(newX, newY)
		end)
	end

	-- show/hide
	local function setVisible(v)
		main.Visible = v
		if shadow then shadow.Visible = v end
	end
	logoBtn.MouseButton1Click:Connect(function() setVisible(not main.Visible) end)
	close.MouseButton1Click:Connect(function() setVisible(false) end)

	local toggleKey = cfg.ToggleKey or Enum.KeyCode.RightControl
	UIS.InputBegan:Connect(function(input, gp)
		if gp then return end
		if input.KeyCode == toggleKey then
			setVisible(not main.Visible)
		end
	end)

	local self = setmetatable({
		__gui = gui,
		__main = main,
		__overlay = overlay,
		__theme = theme,
		__tabScroll = tabScroll,
		__contentScroll = contentScroll,
		__tabs = {},
		__tabButtons = {},
		__activeTab = nil,
		__activePopupCloser = nil,
		__notifyStack = notifyStack,
		__logo = logoImage, -- IMPORTANT: Notify uses this (no cfg dependency)
	}, Window)

	-- ✅ Compact Notify with logo (safe, no cfg scope)
	function self:Notify(title, text, duration, iconImage)
		duration = tonumber(duration) or 2.0
		local t = self.__theme
		local WIDTH = 320

		local card = Create("Frame", {
			Size = UDim2.new(0, WIDTH, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = t.Panel,
			BackgroundTransparency = t.PanelA,
			ZIndex = 9999,
		}, self.__notifyStack)
		Corner(card, 12)
		Stroke(card, 1, t.StrokeA)
		Pad(card, 10, 10, 10, 10)

		local row = Create("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
		}, card)

		Create("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
			VerticalAlignment = Enum.VerticalAlignment.Top,
		}, row)

local icon = Create("ImageLabel", {
	Size = UDim2.fromOffset(34, 34), -- (trước là 28,28)
	BackgroundTransparency = 1,
	Image = iconImage or self.__logo or "rbxassetid://0",
	ZIndex = 10000,
}, row)
Corner(icon, 10)

local textBox = Create("Frame", {
	Size = UDim2.new(1, -40, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1,
}, row)

-- ✅ thêm layout dọc để title + body không đè nhau
Create("UIListLayout", {
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 3),
}, textBox)

local titleLb = Create("TextLabel", {
	Size = UDim2.new(1, 0, 0, 18), -- cao hơn chút
	BackgroundTransparency = 1,
	Text = tostring(title or "Notice"),
	TextXAlignment = Enum.TextXAlignment.Left,
	Font = Enum.Font.GothamBold,
	TextSize = 14, -- to hơn
	TextColor3 = t.Text,
	TextTruncate = Enum.TextTruncate.AtEnd,
	ZIndex = 10000
}, textBox)

local bodyLb = Create("TextLabel", {
	Size = UDim2.new(1, 0, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1,
	Text = tostring(text or ""),
	TextWrapped = true,
	TextXAlignment = Enum.TextXAlignment.Left,
	Font = Enum.Font.Gotham,
	TextSize = 13, -- to hơn
	TextColor3 = t.SubText,
	ZIndex = 10000
}, textBox)

		-- clamp to 2 lines max (avoid long notify)
		task.defer(function()
			local lineH = bodyLb.TextSize + 2
			local maxH = lineH * 3
			if bodyLb.AbsoluteSize.Y > maxH then
				bodyLb.AutomaticSize = Enum.AutomaticSize.None
				bodyLb.Size = UDim2.new(1, 0, 0, maxH)
				bodyLb.TextWrapped = false
				bodyLb.TextTruncate = Enum.TextTruncate.AtEnd
			end
		end)

		-- animate in/out
		card.BackgroundTransparency = 1
		titleLb.TextTransparency = 1
		bodyLb.TextTransparency = 1
		icon.ImageTransparency = 1

		local infoIn = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		Tween(card, infoIn, { BackgroundTransparency = t.PanelA })
		Tween(titleLb, infoIn, { TextTransparency = 0 })
		Tween(bodyLb, infoIn, { TextTransparency = 0 })
		Tween(icon, infoIn, { ImageTransparency = 0 })

		task.delay(duration, function()
			if not card or not card.Parent then return end
			local infoOut = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
			Tween(card, infoOut, { BackgroundTransparency = 1 })
			Tween(titleLb, infoOut, { TextTransparency = 1 })
			Tween(bodyLb, infoOut, { TextTransparency = 1 })
			Tween(icon, infoOut, { ImageTransparency = 1 })
			task.delay(0.2, function()
				if card then card:Destroy() end
			end)
		end)
	end

	return self
end

--// ---------- UI Blocks ----------
local function Card(parent, theme, title)
	local card = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = theme.Panel,
		BackgroundTransparency = theme.PanelA,
		AutomaticSize = Enum.AutomaticSize.Y,
	}, parent)
	Corner(card, 12)
	Stroke(card, 1, theme.StrokeA)
	Pad(card, 12, 12, 10, 10)

	if title then
		Create("TextLabel", {
			Size = UDim2.new(1, 0, 0, 22),
			BackgroundTransparency = 1,
			Text = title,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = Enum.Font.GothamBold,
			TextSize = 14,
			TextColor3 = theme.Text,
		}, card)
	end

	local inner = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(0, 0, 0, title and 28 or 0),
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
	}, card)

	ListLayout(inner, 8)
	return card, inner
end

local function MakeTabButton(win, name)
	local theme = win.__theme
	local btn = Create("TextButton", {
		Name = "TabButton",
		Size = UDim2.new(1, 0, 0, 34),
		BackgroundColor3 = theme.Item,
		BackgroundTransparency = theme.ItemA,
		Text = name,
		Font = Enum.Font.GothamSemibold,
		TextSize = 13,
		TextColor3 = theme.Text,
		AutoButtonColor = false,
	}, win.__tabScroll)
	Corner(btn, 10)
	Stroke(btn, 1, theme.StrokeA)

	btn.MouseEnter:Connect(function()
		if win.__activeTab ~= name then btn.BackgroundColor3 = theme.ItemHover end
	end)
	btn.MouseLeave:Connect(function()
		if win.__activeTab ~= name then btn.BackgroundColor3 = theme.Item end
	end)

	return btn
end

--// ---------- Tab / Section ----------
local Tab = {}
Tab.__index = Tab

local Section = {}
Section.__index = Section

function Window:Tab(name)
	assert(type(name) == "string" and #name > 0, "Tab name must be string")

	local page = Create("Frame", {
		Name = "TabPage_" .. name,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Visible = false
	}, self.__contentScroll)

	ListLayout(page, 10)

	local tabObj = setmetatable({
		__win = self,
		__name = name,
		__page = page,
	}, Tab)

	self.__tabs[name] = tabObj

	local btn = MakeTabButton(self, name)
	self.__tabButtons[name] = btn

	btn.MouseButton1Click:Connect(function()
		self:SelectTab(name)
	end)

	if not self.__activeTab then
		self:SelectTab(name)
	end

	return tabObj
end

function Window:SelectTab(name)
	if self.__activeTab == name then return end

	if self.__activePopupCloser then
		pcall(self.__activePopupCloser)
		self.__activePopupCloser = nil
	end

	for _, tabObj in pairs(self.__tabs) do
		tabObj.__page.Visible = false
	end
	for _, btn in pairs(self.__tabButtons) do
		btn.BackgroundColor3 = self.__theme.Item
	end

	local tabObj = self.__tabs[name]
	if not tabObj then return end

	self.__activeTab = name
	tabObj.__page.Visible = true
	self.__tabButtons[name].BackgroundColor3 = self.__theme.Accent
end

function Tab:Section(title)
	local theme = self.__win.__theme
	local _, inner = Card(self.__page, theme, title or "Section")
	return setmetatable({
		__tab = self,
		__inner = inner,
	}, Section)
end

--// ---------- Controls ----------
function Section:Label(text)
	local theme = self.__tab.__win.__theme
	return Create("TextLabel", {
		Size = UDim2.new(1, 0, 0, 18),
		BackgroundTransparency = 1,
		Text = text or "",
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = theme.SubText,
	}, self.__inner)
end

function Section:Button(text, callback)
	local theme = self.__tab.__win.__theme
	local btn = Create("TextButton", {
		Size = UDim2.new(1, 0, 0, 34),
		BackgroundColor3 = theme.Item,
		BackgroundTransparency = theme.ItemA,
		Text = text or "Button",
		Font = Enum.Font.GothamSemibold,
		TextSize = 13,
		TextColor3 = theme.Text,
		AutoButtonColor = false,
	}, self.__inner)
	Corner(btn, 10)
	Stroke(btn, 1, theme.StrokeA)

	btn.MouseEnter:Connect(function() btn.BackgroundColor3 = theme.ItemHover end)
	btn.MouseLeave:Connect(function() btn.BackgroundColor3 = theme.Item end)
	btn.MouseButton1Click:Connect(function()
		if callback then task.spawn(function() pcall(callback) end) end
	end)

	return btn
end

function Section:Toggle(text, defaultOn, callback)
	local theme = self.__tab.__win.__theme
	local frame = Create("Frame", { Size = UDim2.new(1, 0, 0, 34), BackgroundTransparency = 1 }, self.__inner)

	Create("TextLabel", {
		Size = UDim2.new(1, -60, 1, 0),
		BackgroundTransparency = 1,
		Text = text or "Toggle",
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamMedium,
		TextSize = 14,
		TextColor3 = theme.Text,
	}, frame)

	local toggle = Create("TextButton", {
		Size = UDim2.new(0, 44, 0, 22),
		Position = UDim2.new(1, -44, 0.5, -11),
		Text = "",
		AutoButtonColor = false,
		BackgroundColor3 = Color3.fromRGB(60, 60, 60),
		BackgroundTransparency = 0.05,
	}, frame)
	Corner(toggle, 999)
	Stroke(toggle, 1, theme.StrokeA)

	local knob = Create("Frame", {
		Size = UDim2.new(0, 18, 0, 18),
		Position = UDim2.new(0, 2, 0.5, -9),
		BackgroundColor3 = Color3.fromRGB(240, 240, 240),
	}, toggle)
	Corner(knob, 999)

	local state = defaultOn and true or false
	local info = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	local function render()
		if state then
			Tween(toggle, info, { BackgroundColor3 = theme.Accent })
			Tween(knob, info, { Position = UDim2.new(1, -20, 0.5, -9) })
		else
			Tween(toggle, info, { BackgroundColor3 = Color3.fromRGB(60, 60, 60) })
			Tween(knob, info, { Position = UDim2.new(0, 2, 0.5, -9) })
		end
	end

	local function set(v)
		state = (v == true)
		render()
		if callback then task.spawn(function() pcall(callback, state) end) end
	end

	toggle.MouseButton1Click:Connect(function() set(not state) end)
	render()

	return { Set = set, Get = function() return state end, Root = frame }
end

function Section:Slider(text, minValue, maxValue, defaultValue, callback)
	local theme = self.__tab.__win.__theme
	minValue = tonumber(minValue) or 0
	maxValue = tonumber(maxValue) or 100
	defaultValue = tonumber(defaultValue) or minValue
	defaultValue = clamp(defaultValue, minValue, maxValue)

	local frame = Create("Frame", { Size = UDim2.new(1, 0, 0, 70), BackgroundTransparency = 1 }, self.__inner)

	local label = Create("TextLabel", {
		Size = UDim2.new(1, 0, 0, 20),
		BackgroundTransparency = 1,
		Text = (text or "Slider") .. ": " .. tostring(defaultValue),
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamMedium,
		TextSize = 14,
		TextColor3 = theme.Text,
	}, frame)

	local bg = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 30),
		Position = UDim2.new(0, 0, 0, 28),
		BackgroundColor3 = Color3.fromRGB(40, 40, 46),
		BackgroundTransparency = 0.05,
	}, frame)
	Corner(bg, 8)
	Stroke(bg, 1, theme.StrokeA)

	local fill = Create("Frame", {
		Size = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = theme.Accent,
	}, bg)
	Corner(fill, 8)

	local valLabel = Create("TextLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = tostring(defaultValue),
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = Color3.new(1, 1, 1),
		ZIndex = 2
	}, bg)

	local value = defaultValue
	local dragging = false

	local function setValue(v, fire)
		value = clamp(math.floor(v + 0.5), minValue, maxValue)
		local alpha = (value - minValue) / math.max((maxValue - minValue), 1)
		fill.Size = UDim2.new(alpha, 0, 1, 0)
		valLabel.Text = tostring(value)
		label.Text = (text or "Slider") .. ": " .. tostring(value)
		if fire and callback then task.spawn(function() pcall(callback, value) end) end
	end

	local function updateFromX(x)
		local rel = clamp((x - bg.AbsolutePosition.X) / bg.AbsoluteSize.X, 0, 1)
		local v = minValue + rel * (maxValue - minValue)
		setValue(v, true)
	end

	bg.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			updateFromX(input.Position.X)
		end
	end)
	bg.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
	bg.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
			updateFromX(input.Position.X)
		end
	end)

	setValue(defaultValue, false)
	return { Set = function(v) setValue(v, false) end, Get = function() return value end, Root = frame }
end

function Section:Dropdown(text, options, defaultValue, callback)
	local win = self.__tab.__win
	local theme = win.__theme
	options = options or {}
	local value = defaultValue or options[1] or "(none)"

	local frame = Create("Frame", { Size = UDim2.new(1, 0, 0, 34), BackgroundTransparency = 1 }, self.__inner)

	local btn = Create("TextButton", {
		Size = UDim2.new(1, 0, 0, 34),
		BackgroundColor3 = theme.Item,
		BackgroundTransparency = theme.ItemA,
		Text = "",
		AutoButtonColor = false,
	}, frame)
	Corner(btn, 10)
	Stroke(btn, 1, theme.StrokeA)

	local label = Create("TextLabel", {
		Size = UDim2.new(1, -30, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamSemibold,
		TextSize = 13,
		TextColor3 = theme.Text,
		Text = (text or "Dropdown") .. ": " .. tostring(value),
	}, btn)

	local icon = Create("TextLabel", {
		Size = UDim2.new(0, 20, 1, 0),
		Position = UDim2.new(1, -26, 0, 0),
		BackgroundTransparency = 1,
		Text = "<",
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = theme.SubText
	}, btn)

	btn.MouseEnter:Connect(function() btn.BackgroundColor3 = theme.ItemHover end)
	btn.MouseLeave:Connect(function() btn.BackgroundColor3 = theme.Item end)

	local function set(v)
		value = tostring(v)
		label.Text = (text or "Dropdown") .. ": " .. tostring(value)
		if callback then task.spawn(function() pcall(callback, value) end) end
	end

	local popupCloser
	local popup = BuildOverlayPopup(win, btn, function(sf)
		for _, opt in ipairs(options) do
			local val = tostring(opt)
			local b = Create("TextButton", {
				Size = UDim2.new(1, 0, 0, 30),
				BackgroundColor3 = theme.Item,
				BackgroundTransparency = theme.ItemA,
				Text = val,
				Font = Enum.Font.GothamMedium,
				TextSize = 13,
				TextColor3 = theme.Text,
				AutoButtonColor = false,
				ZIndex = 5002,
			}, sf)
			Corner(b, 8)
			Stroke(b, 1, theme.StrokeA)
			b.MouseEnter:Connect(function() b.BackgroundColor3 = theme.ItemHover end)
			b.MouseLeave:Connect(function() b.BackgroundColor3 = theme.Item end)
			b.MouseButton1Click:Connect(function()
				set(val)
				popup.Close()
				icon.Text = "<"
				if popupCloser then clearActivePopup(win, popupCloser) end
			end)
		end
	end, 170)

	popupCloser = function()
		popup.Close()
		icon.Text = "<"
		clearActivePopup(win, popupCloser)
	end

	btn.MouseButton1Click:Connect(function()
		if popup.IsOpen() then
			popupCloser()
		else
			setActivePopup(win, popupCloser)
			icon.Text = "▾"
			popup.Open()
		end
	end)

	set(value)
	return { Set = set, Get = function() return value end, Root = frame }
end

function Section:List(text, options, defaultValue, callback)
	local win = self.__tab.__win
	local theme = win.__theme
	options = options or {}
	local selected = defaultValue or options[1] or "(none)"

	local frame = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 34),
		BackgroundTransparency = 1,
	}, self.__inner)

	local header = Create("TextButton", {
		Size = UDim2.new(1, 0, 0, 34),
		BackgroundColor3 = theme.Item,
		BackgroundTransparency = theme.ItemA,
		Text = "",
		AutoButtonColor = false,
	}, frame)
	Corner(header, 10)
	Stroke(header, 1, theme.StrokeA)

	local label = Create("TextLabel", {
		Size = UDim2.new(1, -30, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamSemibold,
		TextSize = 13,
		TextColor3 = theme.Text,
		Text = (text or "List") .. ": " .. tostring(selected),
	}, header)

	local icon = Create("TextLabel", {
		Size = UDim2.new(0, 20, 1, 0),
		Position = UDim2.new(1, -26, 0, 0),
		BackgroundTransparency = 1,
		Text = "<",
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = theme.SubText
	}, header)

	header.MouseEnter:Connect(function() header.BackgroundColor3 = theme.ItemHover end)
	header.MouseLeave:Connect(function() header.BackgroundColor3 = theme.Item end)

	local function render()
		label.Text = (text or "List") .. ": " .. tostring(selected)
	end

	local function set(v)
		selected = tostring(v)
		render()
		if callback then task.spawn(function() pcall(callback, selected) end) end
	end

	local popupCloser
	local popup = BuildOverlayPopup(win, header, function(sf)
		for _, opt in ipairs(options) do
			local val = tostring(opt)
			local b = Create("TextButton", {
				Size = UDim2.new(1, 0, 0, 30),
				BackgroundColor3 = theme.Item,
				BackgroundTransparency = theme.ItemA,
				Text = val,
				Font = Enum.Font.GothamMedium,
				TextSize = 13,
				TextColor3 = theme.Text,
				AutoButtonColor = false,
				ZIndex = 5002,
			}, sf)
			Corner(b, 8)
			Stroke(b, 1, theme.StrokeA)
			b.MouseEnter:Connect(function() b.BackgroundColor3 = theme.ItemHover end)
			b.MouseLeave:Connect(function() b.BackgroundColor3 = theme.Item end)
			b.MouseButton1Click:Connect(function()
				set(val)
				popup.Close()
				icon.Text = "<"
				if popupCloser then clearActivePopup(win, popupCloser) end
			end)
		end
	end, 200)

	popupCloser = function()
		popup.Close()
		icon.Text = "<"
		clearActivePopup(win, popupCloser)
	end

	header.MouseButton1Click:Connect(function()
		if popup.IsOpen() then
			popupCloser()
		else
			setActivePopup(win, popupCloser)
			icon.Text = "▾"
			popup.Open()
		end
	end)

	render()
	return { Set = set, Get = function() return selected end, Root = frame }
end

Section.ListSelect = Section.List

function Window:Destroy()
	if self.__activePopupCloser then pcall(self.__activePopupCloser) end
	if self.__gui then self.__gui:Destroy() end
end

Hub.Window = Window
setmetatable(Hub, Hub)

return Hub
