--// Roblox UI Menu (NO 3D) • Tabs • List chọn • Mini Switch • Logo bật/tắt
--// Put this LocalScript in StarterPlayerScripts (recommended) or StarterGui

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--========================
-- Helpers
--========================
local function make(instType, props, parent)
	local obj = Instance.new(instType)
	for k, v in pairs(props or {}) do
		obj[k] = v
	end
	if parent then obj.Parent = parent end
	return obj
end

local function roundify(uiObj, radius)
	make("UICorner", { CornerRadius = UDim.new(0, radius or 10) }, uiObj)
end

local function makeStroke(uiObj, t, transparency)
	make("UIStroke", {
		Thickness = t or 1,
		Transparency = transparency or 0.5,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	}, uiObj)
end

local function makePadding(uiObj, l, r, t, b)
	make("UIPadding", {
		PaddingLeft = UDim.new(0, l or 8),
		PaddingRight = UDim.new(0, r or 8),
		PaddingTop = UDim.new(0, t or 8),
		PaddingBottom = UDim.new(0, b or 8),
	}, uiObj)
end

--========================
-- ScreenGui
--========================
local screenGui = make("ScreenGui", {
	Name = "MenuUI_No3D",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
}, playerGui)

--========================
-- Logo button (toggle menu)
--========================
local logoBtn = make("ImageButton", {
	Name = "LogoButton",
	Size = UDim2.new(0, 56, 0, 56),
	Position = UDim2.new(0, 16, 0, 16),
	BackgroundColor3 = Color3.fromRGB(25, 25, 28),
	AutoButtonColor = true,
	Image = "rbxassetid://70511817915018", -- <- thay ID logo của bạn
}, screenGui)
roundify(logoBtn, 14)
makeStroke(logoBtn, 1, 0.35)

make("TextLabel", {
	Name = "Hint",
	Size = UDim2.new(1, 0, 0, 16),
	Position = UDim2.new(0, 0, 1, 2),
	BackgroundTransparency = 1,
	Text = "DIEVER HUB",
	TextSize = 12,
	Font = Enum.Font.GothamSemibold,
	TextColor3 = Color3.fromRGB(235, 235, 235)
}, logoBtn)

--========================
-- Main window
--========================
local main = make("Frame", {
	Name = "Main",
	Size = UDim2.new(0, 720, 0, 420),
	Position = UDim2.new(0, 16, 0, 84),
	BackgroundColor3 = Color3.fromRGB(20, 20, 24),
	Visible = true
}, screenGui)
roundify(main, 14)
makeStroke(main, 1, 0.35)

-- Top bar
local topBar = make("Frame", {
	Name = "TopBar",
	Size = UDim2.new(1, 0, 0, 44),
	BackgroundColor3 = Color3.fromRGB(24, 24, 28)
}, main)
roundify(topBar, 14)
makeStroke(topBar, 1, 0.55)

make("TextLabel", {
	Name = "Title",
	Size = UDim2.new(1, -120, 1, 0),
	Position = UDim2.new(0, 14, 0, 0),
	BackgroundTransparency = 1,
	Text = "Roblox Menu UI • Nova Roblox",
	TextXAlignment = Enum.TextXAlignment.Left,
	Font = Enum.Font.GothamBold,
	TextSize = 16,
	TextColor3 = Color3.fromRGB(240, 240, 240)
}, topBar)

local closeBtn = make("TextButton", {
	Name = "Close",
	Size = UDim2.new(0, 36, 0, 28),
	Position = UDim2.new(1, -46, 0.5, -14),
	BackgroundColor3 = Color3.fromRGB(40, 40, 46),
	Text = "X",
	Font = Enum.Font.GothamBold,
	TextSize = 14,
	TextColor3 = Color3.fromRGB(240, 240, 240),
	AutoButtonColor = true
}, topBar)
roundify(closeBtn, 10)

-- Dragging window (simple)
do
	local dragging = false
	local dragStart, startPos

	topBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
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

	topBar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
			local delta = input.Position - dragStart
			main.Position = UDim2.new(
				startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y
			)
		end
	end)
end

-- Body layout: left panel + right panel
local body = make("Frame", {
	Name = "Body",
	Size = UDim2.new(1, 0, 1, -44),
	Position = UDim2.new(0, 0, 0, 44),
	BackgroundTransparency = 1
}, main)

local left = make("Frame", {
	Name = "Left",
	Size = UDim2.new(0, 230, 1, 0),
	BackgroundTransparency = 1
}, body)

local right = make("Frame", {
	Name = "Right",
	Size = UDim2.new(1, -230, 1, 0),
	Position = UDim2.new(0, 230, 0, 0),
	BackgroundTransparency = 1
}, body)

--========================
-- Left: List chọn (Scrolling list)
--========================
local listBox = make("Frame", {
	Name = "ListBox",
	Size = UDim2.new(1, -16, 1, -16),
	Position = UDim2.new(0, 8, 0, 8),
	BackgroundColor3 = Color3.fromRGB(24, 24, 28)
}, left)
roundify(listBox, 12)
makeStroke(listBox, 1, 0.6)
makePadding(listBox, 10, 10, 10, 10)

make("TextLabel", {
	Name = "ListTitle",
	Size = UDim2.new(1, 0, 0, 22),
	BackgroundTransparency = 1,
	Text = "Danh sách chọn",
	TextXAlignment = Enum.TextXAlignment.Left,
	Font = Enum.Font.GothamBold,
	TextSize = 14,
	TextColor3 = Color3.fromRGB(240, 240, 240)
}, listBox)

local scroll = make("ScrollingFrame", {
	Name = "Scroll",
	Size = UDim2.new(1, 0, 1, -60),
	Position = UDim2.new(0, 0, 0, 30),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	CanvasSize = UDim2.new(0, 0, 0, 0),
	ScrollBarThickness = 6
}, listBox)

local scrollLayout = make("UIListLayout", {
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 8)
}, scroll)

local selectedLabel = make("TextLabel", {
	Name = "SelectedLabel",
	Size = UDim2.new(1, 0, 0, 18),
	Position = UDim2.new(0, 0, 1, -18),
	BackgroundTransparency = 1,
	Text = "Đang chọn: (none)",
	TextXAlignment = Enum.TextXAlignment.Left,
	Font = Enum.Font.Gotham,
	TextSize = 12,
	TextColor3 = Color3.fromRGB(200, 200, 200)
}, listBox)

local items = {"Option A", "Option B", "Option C", "Option D", "Option E", "Option F", "Option G"}
local currentSelected = nil

local function makeListItem(text)
	local btn = make("TextButton", {
		Name = "Item",
		Size = UDim2.new(1, 0, 0, 34),
		BackgroundColor3 = Color3.fromRGB(32, 32, 38),
		Text = text,
		Font = Enum.Font.GothamSemibold,
		TextSize = 13,
		TextColor3 = Color3.fromRGB(235, 235, 235),
		AutoButtonColor = true
	}, scroll)
	roundify(btn, 10)
	makeStroke(btn, 1, 0.7)

	btn.MouseButton1Click:Connect(function()
		currentSelected = text
		selectedLabel.Text = "Đang chọn: " .. text
	end)

	return btn
end

for _, it in ipairs(items) do
	makeListItem(it)
end

local function updateCanvas()
	task.wait()
	scroll.CanvasSize = UDim2.new(0, 0, 0, scrollLayout.AbsoluteContentSize.Y + 6)
end
scrollLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
updateCanvas()

--========================
-- Right: Tabs Row
--========================
local tabsRow = make("Frame", {
	Name = "TabsRow",
	Size = UDim2.new(1, -16, 0, 42),
	Position = UDim2.new(0, 8, 0, 8),
	BackgroundColor3 = Color3.fromRGB(24, 24, 28)
}, right)
roundify(tabsRow, 12)
makeStroke(tabsRow, 1, 0.6)
makePadding(tabsRow, 10, 10, 8, 8)

make("UIListLayout", {
	FillDirection = Enum.FillDirection.Horizontal,
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 8)
}, tabsRow)

-- Pages container
local pages = make("Frame", {
	Name = "Pages",
	Size = UDim2.new(1, -16, 1, -58),
	Position = UDim2.new(0, 8, 0, 50),
	BackgroundTransparency = 1
}, right)

local function createPage(pageName)
	return make("Frame", {
		Name = pageName,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Visible = false
	}, pages)
end

--========================
-- Mini Switch (gọn)
--========================
local function createMiniSwitch(parent, text, defaultOn, onChanged)
	local frame = make("Frame", {
		Size = UDim2.new(1, 0, 0, 34),
		BackgroundTransparency = 1
	}, parent)

	local label = make("TextLabel", {
		Size = UDim2.new(1, -60, 1, 0),
		BackgroundTransparency = 1,
		Text = text,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamMedium,
		TextSize = 14,
		TextColor3 = Color3.fromRGB(235, 235, 235)
	}, frame)

	local toggle = make("TextButton", {
		Size = UDim2.new(0, 44, 0, 22),
		Position = UDim2.new(1, -44, 0.5, -11),
		Text = "",
		AutoButtonColor = false,
		BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	}, frame)
	roundify(toggle, 999)
	makeStroke(toggle, 1, 0.75)

	local knob = make("Frame", {
		Size = UDim2.new(0, 18, 0, 18),
		Position = UDim2.new(0, 2, 0.5, -9),
		BackgroundColor3 = Color3.fromRGB(240, 240, 240)
	}, toggle)
	roundify(knob, 999)

	local state = defaultOn and true or false

	local function render()
		if state then
			toggle.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
			knob.Position = UDim2.new(1, -20, 0.5, -9)
		else
			toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			knob.Position = UDim2.new(0, 2, 0.5, -9)
		end
	end

	local function setState(v)
		state = (v == true)
		render()
		if onChanged then onChanged(state) end
	end

	toggle.MouseButton1Click:Connect(function()
		setState(not state)
	end)

	render()
	return {
		Get = function() return state end,
		Set = setState,
		Root = frame
	}
end

--========================
-- Page cards
--========================
local function pageCard(parent, h)
	local card = make("Frame", {
		Size = UDim2.new(1, 0, 0, h),
		BackgroundColor3 = Color3.fromRGB(24, 24, 28)
	}, parent)
	roundify(card, 12)
	makeStroke(card, 1, 0.65)
	makePadding(card, 12, 12, 10, 10)
	return card
end

-- Layout for each page
local function addPageLayout(pg)
	make("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 10)
	}, pg)
	makePadding(pg, 0, 0, 0, 0)
end

--========================
-- Create pages
--========================
local pageHome = createPage("Home")
local pageSettings = createPage("Settings")
local pageAbout = createPage("About")

addPageLayout(pageHome)
addPageLayout(pageSettings)
addPageLayout(pageAbout)

-- HOME content (NO 3D)
do
	local c1 = pageCard(pageHome, 140)

	make("TextLabel", {
		Size = UDim2.new(1, 0, 0, 22),
		BackgroundTransparency = 1,
		Text = "Chức năng nhanh",
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = Color3.fromRGB(240, 240, 240)
	}, c1)

	local listWrap = make("Frame", {
		Size = UDim2.new(1, 0, 1, -28),
		Position = UDim2.new(0, 0, 0, 28),
		BackgroundTransparency = 1
	}, c1)

	local ll = make("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }, listWrap)

	createMiniSwitch(listWrap, "Auto Run", false, function(on)
		print("Auto Run:", on, "Selected:", currentSelected)
	end)

	createMiniSwitch(listWrap, "Boost", true, function(on)
		print("Boost:", on, "Selected:", currentSelected)
	end)

	createMiniSwitch(listWrap, "Particles", false, function(on)
		print("Particles:", on, "Selected:", currentSelected)
	end)
end

-- SETTINGS content
do
	local c1 = pageCard(pageSettings, 120)
	make("TextLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		Font = Enum.Font.Gotham,
		TextSize = 13,
		TextColor3 = Color3.fromRGB(220, 220, 220),
		Text = "Settings:\n- Bên trái chọn Option.\n- Bên phải bật/tắt tính năng.\n\nGợi ý: bạn có thể dùng currentSelected để áp dụng cấu hình theo lựa chọn."
	}, c1)

	local c2 = pageCard(pageSettings, 90)
	make("TextLabel", {
		Size = UDim2.new(1, 0, 0, 22),
		BackgroundTransparency = 1,
		Text = "Tùy chọn",
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = Color3.fromRGB(240, 240, 240)
	}, c2)

	local listWrap = make("Frame", {
		Size = UDim2.new(1, 0, 1, -28),
		Position = UDim2.new(0, 0, 0, 28),
		BackgroundTransparency = 1
	}, c2)
	make("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }, listWrap)

	createMiniSwitch(listWrap, "Apply theo lựa chọn", false, function(on)
		print("Apply Selected:", on, "Selected:", currentSelected)
	end)

	createMiniSwitch(listWrap, "Notifications", true, function(on)
		print("Notifications:", on)
	end)
end

-- ABOUT content
do
	local c1 = pageCard(pageAbout, 150)
	make("TextLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		Font = Enum.Font.Gotham,
		TextSize = 13,
		TextColor3 = Color3.fromRGB(220, 220, 220),
		Text = "About:\n- Logo click bật/tắt UI\n- Tabs: Home/Settings/About\n- List chọn bên trái (Scrolling)\n- Mini Switch gọn\n\nMuốn thêm: keybind mở UI (RightShift), slider, dropdown, hay save settings?"
	}, c1)
end

--========================
-- Tabs behavior
--========================
local currentPage = nil
local tabButtons = {}

local function setPage(page)
	if currentPage then currentPage.Visible = false end
	currentPage = page
	currentPage.Visible = true

	for _, b in pairs(tabButtons) do
		b.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
	end
	if tabButtons[page] then
		tabButtons[page].BackgroundColor3 = Color3.fromRGB(80, 160, 255)
	end
end

local function createTab(name, page)
	local btn = make("TextButton", {
		Size = UDim2.new(0, 120, 1, 0),
		BackgroundColor3 = Color3.fromRGB(32, 32, 38),
		Text = name,
		Font = Enum.Font.GothamSemibold,
		TextSize = 13,
		TextColor3 = Color3.fromRGB(240, 240, 240),
		AutoButtonColor = true
	}, tabsRow)
	roundify(btn, 12)
	makeStroke(btn, 1, 0.7)

	btn.MouseButton1Click:Connect(function()
		setPage(page)
	end)

	tabButtons[page] = btn
	return btn
end

createTab("Home", pageHome)
createTab("Settings", pageSettings)
createTab("About", pageAbout)

setPage(pageHome)

--========================
-- Open/Close UI
--========================
local function setVisible(on)
	main.Visible = on
end

logoBtn.MouseButton1Click:Connect(function()
	setVisible(not main.Visible)
end)

closeBtn.MouseButton1Click:Connect(function()
	setVisible(false)
end)
