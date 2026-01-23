--// DieverHub.lua (FULL SOURCE - FIXED)
--// Tabs + Sections + Button/Toggle/Slider/Dropdown/ListSelect (collapsible)
--// Drag (Mouse+Touch), Center, Auto scale, Resize grip bottom-right (smooth/free)
--// Usage:
--//   local Hub = loadstring(game:HttpGet(RAW_URL))()
--//   local Win = Hub:CreateWindow({...})

local Hub = {}
Hub.__index = Hub

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local LP = Players.LocalPlayer
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
		Transparency = transparency or 0.5,
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

--// ---------- Theme Defaults ----------
local DefaultTheme = {
	Bg = Color3.fromRGB(20, 20, 24),
	Panel = Color3.fromRGB(24, 24, 28),
	Item = Color3.fromRGB(32, 32, 38),
	ItemHover = Color3.fromRGB(38, 38, 45),
	Text = Color3.fromRGB(240, 240, 240),
	SubText = Color3.fromRGB(180, 180, 180),
	Stroke = 0.60,
	Accent = Color3.fromRGB(80, 160, 255),
}

--// ---------- Window ----------
local Window = {}
Window.__index = Window

function Hub:CreateWindow(cfg)
	cfg = cfg or {}
	local theme = cfg.Theme or DefaultTheme

	local gui = Create("ScreenGui", {
		Name = cfg.Name or "DIEVERHUB_UI",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, PlayerGui)

	-- Mini logo toggle button
	local logoBtn = Create("ImageButton", {
		Name = "LogoButton",
		Size = cfg.LogoButtonSize or UDim2.fromOffset(56, 56),
		Position = cfg.LogoButtonPos or UDim2.new(0, 16, 0, 16),
		BackgroundColor3 = theme.Panel,
		AutoButtonColor = true,
		Image = cfg.Logo or "rbxassetid://0",
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
		TextColor3 = theme.Text
	}, logoBtn)

	-- Main window
	local main = Create("Frame", {
		Name = "Main",
		Size = cfg.Size or UDim2.fromOffset(720, 420),
		AnchorPoint = Vector2.new(0, 0),
		Position = cfg.Position or UDim2.new(0, 16, 0, 84),
		BackgroundColor3 = theme.Bg,
		Visible = (cfg.Visible ~= false),
	}, gui)
	Corner(main, 14)
	Stroke(main, 1, 0.35)

	-- Center option
	if cfg.Center == true then
		main.AnchorPoint = Vector2.new(0.5, 0.5)
		main.Position = UDim2.new(0.5, 0, 0.5, 0)
	end

	-- Constraints
	local minS = cfg.MinSize or Vector2.new(360, 260)
	local maxS = cfg.MaxSize or Vector2.new(1400, 900)

	Create("UISizeConstraint", {
		MinSize = minS,
		MaxSize = maxS,
	}, main)

	-- Auto scale to fit small screens (only when viewport changes)
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
		s = math.clamp(s * 0.95, 0.6, 1)
		uiScale.Scale = s
	end
	updateScale()
	RunService.RenderStepped:Connect(updateScale)

	-- Top bar
	local top = Create("Frame", {
		Name = "TopBar",
		Size = UDim2.new(1, 0, 0, 44),
		BackgroundColor3 = theme.Panel,
	}, main)
	Corner(top, 14)
	Stroke(top, 1, 0.55)

	Create("TextLabel", {
		Name = "Title",
		Size = UDim2.new(1, -140, 1, 0),
		Position = UDim2.new(0, 14, 0, 0),
		BackgroundTransparency = 1,
		Text = (cfg.Title or "DIEVER HUB") .. (cfg.SubTitle and (" • " .. cfg.SubTitle) or ""),
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamBold,
		TextSize = 16,
		TextColor3 = theme.Text
	}, top)

	local close = Create("TextButton", {
		Name = "Close",
		Size = UDim2.fromOffset(36, 28),
		Position = UDim2.new(1, -46, 0.5, -14),
		BackgroundColor3 = Color3.fromRGB(40, 40, 46),
		Text = "X",
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = theme.Text,
		AutoButtonColor = true
	}, top)
	Corner(close, 10)

	-- Body split
	local body = Create("Frame", {
		Name = "Body",
		Size = UDim2.new(1, 0, 1, -44),
		Position = UDim2.new(0, 0, 0, 44),
		BackgroundTransparency = 1
	}, main)

	local leftWidth = cfg.LeftWidth or 230

	local left = Create("Frame", {
		Name = "Left",
		Size = UDim2.new(0, leftWidth, 1, 0),
		BackgroundTransparency = 1
	}, body)

	local right = Create("Frame", {
		Name = "Right",
		Size = UDim2.new(1, -leftWidth, 1, 0),
		Position = UDim2.new(0, leftWidth, 0, 0),
		BackgroundTransparency = 1
	}, body)

	-- Left: Tabs list
	local listBox = Create("Frame", {
		Name = "ListBox",
		Size = UDim2.new(1, -16, 1, -16),
		Position = UDim2.new(0, 8, 0, 8),
		BackgroundColor3 = theme.Panel
	}, left)
	Corner(listBox, 12)
	Stroke(listBox, 1, theme.Stroke)
	Pad(listBox, 10, 10, 10, 10)

	Create("TextLabel", {
		Name = "ListTitle",
		Size = UDim2.new(1, 0, 0, 22),
		BackgroundTransparency = 1,
		Text = cfg.TabTitle or "Tabs",
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = theme.Text
	}, listBox)

	local tabScroll = Create("ScrollingFrame", {
		Name = "TabScroll",
		Size = UDim2.new(1, 0, 1, -50),
		Position = UDim2.new(0, 0, 0, 30),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ScrollBarThickness = 6
	}, listBox)
	local tabLayout = ListLayout(tabScroll, 8)
	AutoCanvas(tabScroll, tabLayout, 6)

	local selectedLabel = Create("TextLabel", {
		Name = "SelectedLabel",
		Size = UDim2.new(1, 0, 0, 18),
		Position = UDim2.new(0, 0, 1, -18),
		BackgroundTransparency = 1,
		Text = cfg.SelectedText or "Selected: (none)",
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = Color3.fromRGB(200, 200, 200)
	}, listBox)

	-- Right: Content scroll
	local contentFrame = Create("Frame", {
		Name = "ContentFrame",
		Size = UDim2.new(1, -16, 1, -16),
		Position = UDim2.new(0, 8, 0, 8),
		BackgroundTransparency = 1
	}, right)

	local contentScroll = Create("ScrollingFrame", {
		Name = "ContentScroll",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ScrollBarThickness = 6
	}, contentFrame)
	local contentLayout = ListLayout(contentScroll, 10)
	AutoCanvas(contentScroll, contentLayout, 10)

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

	-- Resize grip (smooth/free resize)
	do
		local grip = Create("Frame", {
			Name = "ResizeGrip",
			Size = UDim2.fromOffset(22, 22),
			Position = UDim2.new(1, -26, 1, -26),
			BackgroundColor3 = Color3.fromRGB(45, 45, 52),
			BorderSizePixel = 0,
			ZIndex = 50,
		}, main)
		Corner(grip, 6)
		Stroke(grip, 1, 0.65)

		Create("TextLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Text = "↘",
			Font = Enum.Font.GothamBold,
			TextSize = 14,
			TextColor3 = theme.SubText,
			ZIndex = 51,
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

			-- NEW: true free resize = startSize + delta (no incremental jump)
			local now = Vector2.new(input.Position.X, input.Position.Y)
			local delta = now - startMousePos

			local newX = math.clamp(startSizePx.X + delta.X, minS.X, maxS.X)
			local newY = math.clamp(startSizePx.Y + delta.Y, minS.Y, maxS.Y)

			main.Size = UDim2.fromOffset(newX, newY)
		end)
	end

	-- show/hide
	local function setVisible(v) main.Visible = v end
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
		__theme = theme,
		__tabScroll = tabScroll,
		__contentScroll = contentScroll,
		__selectedLabel = selectedLabel,
		__tabs = {},
		__tabButtons = {},
		__activeTab = nil,
	}, Window)

	return self
end

--// ---------- UI Blocks ----------
local function Card(parent, theme, title)
	local card = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = theme.Panel,
		AutomaticSize = Enum.AutomaticSize.Y,
	}, parent)
	Corner(card, 12)
	Stroke(card, 1, 0.65)
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
		Text = name,
		Font = Enum.Font.GothamSemibold,
		TextSize = 13,
		TextColor3 = theme.Text,
		AutoButtonColor = false,
	}, win.__tabScroll)
	Corner(btn, 10)
	Stroke(btn, 1, 0.7)

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
	self.__selectedLabel.Text = "Selected: " .. name
end

function Tab:Section(title)
	local theme = self.__win.__theme
	local card, inner = Card(self.__page, theme, title or "Section")
	return setmetatable({
		__tab = self,
		__card = card,
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
		Text = text or "Button",
		Font = Enum.Font.GothamSemibold,
		TextSize = 13,
		TextColor3 = theme.Text,
		AutoButtonColor = false,
	}, self.__inner)
	Corner(btn, 10)
	Stroke(btn, 1, 0.7)

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
	}, frame)
	Corner(toggle, 999)
	Stroke(toggle, 1, 0.75)

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
	defaultValue = math.clamp(defaultValue, minValue, maxValue)

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
	}, frame)
	Corner(bg, 8)
	Stroke(bg, 1, 0.7)

	local fill = Create("Frame", { Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = theme.Accent }, bg)
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
		value = math.clamp(math.floor(v + 0.5), minValue, maxValue)
		local alpha = (value - minValue) / math.max((maxValue - minValue), 1)
		fill.Size = UDim2.new(alpha, 0, 1, 0)
		valLabel.Text = tostring(value)
		label.Text = (text or "Slider") .. ": " .. tostring(value)
		if fire and callback then task.spawn(function() pcall(callback, value) end) end
	end

	local function updateFromX(x)
		local rel = math.clamp((x - bg.AbsolutePosition.X) / bg.AbsoluteSize.X, 0, 1)
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
	local theme = self.__tab.__win.__theme
	options = options or {}
	local value = defaultValue or options[1] or "(none)"

	local frame = Create("Frame", { Size = UDim2.new(1, 0, 0, 34), BackgroundTransparency = 1 }, self.__inner)

	local btn = Create("TextButton", {
		Size = UDim2.new(1, 0, 0, 34),
		BackgroundColor3 = theme.Item,
		Text = "",
		Font = Enum.Font.GothamSemibold,
		TextSize = 13,
		TextColor3 = theme.Text,
		AutoButtonColor = false,
	}, frame)
	Corner(btn, 10)
	Stroke(btn, 1, 0.7)

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

	Create("TextLabel", {
		Size = UDim2.new(0, 20, 1, 0),
		Position = UDim2.new(1, -26, 0, 0),
		BackgroundTransparency = 1,
		Text = "▾",
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = theme.SubText
	}, btn)

	local list = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(0, 0, 0, 38),
		BackgroundColor3 = theme.Panel,
		Visible = false,
		ClipsDescendants = true,
	}, frame)
	Corner(list, 10)
	Stroke(list, 1, 0.65)
	Pad(list, 8, 8, 8, 8)

	local sf = Create("ScrollingFrame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 6,
		CanvasSize = UDim2.new(0, 0, 0, 0),
	}, list)
	local lo = ListLayout(sf, 6)
	AutoCanvas(sf, lo, 8)

	local open = false
	local info = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	local function set(v)
		value = v
		label.Text = (text or "Dropdown") .. ": " .. tostring(value)
		if callback then task.spawn(function() pcall(callback, value) end) end
	end

	local function setOpen(v)
		open = v == true
		list.Visible = true
		if open then
			local h = math.clamp(lo.AbsoluteContentSize.Y + 16, 40, 170)
			list.Size = UDim2.new(1, 0, 0, 0)
			Tween(list, info, { Size = UDim2.new(1, 0, 0, h) })
		else
			Tween(list, info, { Size = UDim2.new(1, 0, 0, 0) })
			task.delay(0.16, function()
				if not open then list.Visible = false end
			end)
		end
	end

	btn.MouseEnter:Connect(function() btn.BackgroundColor3 = theme.ItemHover end)
	btn.MouseLeave:Connect(function() btn.BackgroundColor3 = theme.Item end)
	btn.MouseButton1Click:Connect(function() setOpen(not open) end)

	for _, opt in ipairs(options) do
		local o = tostring(opt)
		local oBtn = Create("TextButton", {
			Size = UDim2.new(1, 0, 0, 30),
			BackgroundColor3 = theme.Item,
			Text = o,
			Font = Enum.Font.GothamMedium,
			TextSize = 13,
			TextColor3 = theme.Text,
			AutoButtonColor = false
		}, sf)
		Corner(oBtn, 8)
		Stroke(oBtn, 1, 0.75)

		oBtn.MouseEnter:Connect(function() oBtn.BackgroundColor3 = theme.ItemHover end)
		oBtn.MouseLeave:Connect(function() oBtn.BackgroundColor3 = theme.Item end)
		oBtn.MouseButton1Click:Connect(function()
			set(o)
			setOpen(false)
		end)
	end

	set(value)
	return { Set = set, Get = function() return value end, Root = frame }
end

-- ✅ List chọn THU GỌN (click mở list, chọn xong tự đóng)
function Section:List(text, options, defaultValue, callback)
	local theme = self.__tab.__win.__theme
	options = options or {}
	local selected = defaultValue or options[1] or "(none)"

	local frame = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 34),
		BackgroundTransparency = 1,
	}, self.__inner)

	-- header button
	local header = Create("TextButton", {
		Size = UDim2.new(1, 0, 0, 34),
		BackgroundColor3 = theme.Item,
		Text = "",
		AutoButtonColor = false,
	}, frame)
	Corner(header, 10)
	Stroke(header, 1, 0.7)

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

	local arrow = Create("TextLabel", {
		Size = UDim2.new(0, 20, 1, 0),
		Position = UDim2.new(1, -26, 0, 0),
		BackgroundTransparency = 1,
		Text = "▾",
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = theme.SubText
	}, header)

	header.MouseEnter:Connect(function() header.BackgroundColor3 = theme.ItemHover end)
	header.MouseLeave:Connect(function() header.BackgroundColor3 = theme.Item end)

	-- list panel
	local panel = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(0, 0, 0, 38),
		BackgroundColor3 = theme.Panel,
		Visible = false,
		ClipsDescendants = true,
	}, frame)
	Corner(panel, 10)
	Stroke(panel, 1, 0.65)
	Pad(panel, 8, 8, 8, 8)

	local sf = Create("ScrollingFrame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 6,
		CanvasSize = UDim2.new(0, 0, 0, 0),
	}, panel)
	local lo = ListLayout(sf, 6)
	AutoCanvas(sf, lo, 8)

	local open = false
	local info = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local maxH = 180 -- bạn đổi nếu muốn

	local function renderSelected()
		label.Text = (text or "List") .. ": " .. tostring(selected)
	end

	local function setOpen(v)
		open = v == true
		panel.Visible = true
		if open then
			arrow.Text = "▴"
			local h = math.clamp(lo.AbsoluteContentSize.Y + 16, 40, maxH)
			panel.Size = UDim2.new(1, 0, 0, 0)
			Tween(panel, info, { Size = UDim2.new(1, 0, 0, h) })
		else
			arrow.Text = "▾"
			Tween(panel, info, { Size = UDim2.new(1, 0, 0, 0) })
			task.delay(0.16, function()
				if not open then panel.Visible = false end
			end)
		end
	end

	local function set(v)
		selected = tostring(v)
		renderSelected()
		if callback then task.spawn(function() pcall(callback, selected) end) end
	end

	header.MouseButton1Click:Connect(function()
		setOpen(not open)
	end)

	for _, opt in ipairs(options) do
		local val = tostring(opt)
		local b = Create("TextButton", {
			Size = UDim2.new(1, 0, 0, 30),
			BackgroundColor3 = theme.Item,
			Text = val,
			Font = Enum.Font.GothamMedium,
			TextSize = 13,
			TextColor3 = theme.Text,
			AutoButtonColor = false
		}, sf)
		Corner(b, 8)
		Stroke(b, 1, 0.75)

		b.MouseEnter:Connect(function() b.BackgroundColor3 = theme.ItemHover end)
		b.MouseLeave:Connect(function() b.BackgroundColor3 = theme.Item end)
		b.MouseButton1Click:Connect(function()
			set(val)
			setOpen(false) -- chọn xong tự thu gọn
		end)
	end

	renderSelected()

	-- Important: increase control height when open (so it won't overlap next controls)
	-- This makes it behave like a real collapsible list.
	local function syncFrameHeight()
		if open then
			frame.Size = UDim2.new(1, 0, 0, 34 + panel.AbsoluteSize.Y + 6)
		else
			frame.Size = UDim2.new(1, 0, 0, 34)
		end
	end

	-- watch panel size to adjust frame height
	panel:GetPropertyChangedSignal("AbsoluteSize"):Connect(syncFrameHeight)
	syncFrameHeight()

	return {
		Set = set,
		Get = function() return selected end,
		Open = function() setOpen(true) end,
		Close = function() setOpen(false) end,
		Root = frame
	}
end

-- alias: ListSelect (nếu bạn muốn gọi tên rõ ràng)
Section.ListSelect = Section.List

function Window:Destroy()
	if self.__gui then self.__gui:Destroy() end
end

Hub.Window = Window
setmetatable(Hub, Hub)

-- ✅ Return safe for: loadstring(game:HttpGet(url))()
return function()
	return Hub
end
