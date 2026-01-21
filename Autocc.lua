--// Roblox UI Menu (Tabs + List + Switch + 3D Viewport + Logo Toggle)
--// Put this LocalScript in StarterPlayerScripts

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
	make("UICorner", {CornerRadius = UDim.new(0, radius or 10)}, uiObj)
end

local function makeStroke(uiObj, t, transparency)
	make("UIStroke", {
		Thickness = t or 1,
		Transparency = transparency or 0.4,
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
	Name = "Menu3DUI",
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
	Image = "rbxassetid://0", -- <- đổi asset id logo của bạn
}, screenGui)
roundify(logoBtn, 14)
makeStroke(logoBtn, 1, 0.35)

local logoHint = make("TextLabel", {
	Name = "Hint",
	Size = UDim2.new(1, 0, 0, 16),
	Position = UDim2.new(0, 0, 1, 2),
	BackgroundTransparency = 1,
	Text = "MENU",
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

local title = make("TextLabel", {
	Name = "Title",
	Size = UDim2.new(1, -120, 1, 0),
	Position = UDim2.new(0, 14, 0, 0),
	BackgroundTransparency = 1,
	Text = "Roblox Menu UI • Tabs • List • Switch • 3D",
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
			main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
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
-- Tabs row (right/top)
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

local tabLayout = make("UIListLayout", {
	FillDirection = Enum.FillDirection.Horizontal,
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 8)
}, tabsRow)

--========================
-- Pages container (right/bottom)
--========================
local pages = make("Frame", {
	Name = "Pages",
	Size = UDim2.new(1, -16, 1, -58),
	Position = UDim2.new(0, 8, 0, 50),
	BackgroundTransparency = 1
}, right)

-- page factory
local function createPage(pageName)
	local page = make("Frame", {
		Name = pageName,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Visible = false
	}, pages)
	return page
end

--========================
-- Left panel: List select (Scrolling list)
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

local listTitle = make("TextLabel", {
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
	Size = UDim2.new(1, 0, 1, -32),
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

-- List items
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

-- Auto canvas size for scroll
local function updateCanvas()
	task.wait()
	scroll.CanvasSize = UDim2.new(0, 0, 0, scrollLayout.AbsoluteContentSize.Y + 6)
end
scrollLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
updateCanvas()

--========================
-- Switch (toggle) component
--========================
local function createSwitch(parent, labelText, defaultOn, onChanged)
	local row = make("Frame", {
		Size = UDim2.new(1, 0, 0, 44),
		BackgroundColor3 = Color3.fromRGB(24, 24, 28)
	}, parent)
	roundify(row, 12)
	makeStroke(row, 1, 0.65)
	makePadding(row, 12, 12, 10, 10)

	local label = make("TextLabel", {
		Size = UDim2.new(1, -110, 1, 0),
		BackgroundTransparency = 1,
		Text = labelText,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamSemibold,
		TextSize = 14,
		TextColor3 = Color3.fromRGB(235, 235, 235)
	}, row)

	local toggleBtn = make("TextButton", {
		Size = UDim2.new(0, 92, 0, 26),
		Position = UDim2.new(1, -92, 0.5, -13),
		BackgroundColor3 = Color3.fromRGB(35, 35, 40),
		Text = "",
		AutoButtonColor = false
	}, row)
	roundify(toggleBtn, 13)
	makeStroke(toggleBtn, 1, 0.7)

	local knob = make("Frame", {
		Size = UDim2.new(0, 22, 0, 22),
		Position = UDim2.new(0, 2, 0.5, -11),
		BackgroundColor3 = Color3.fromRGB(240, 240, 240)
	}, toggleBtn)
	roundify(knob, 11)

	local state = defaultOn and true or false
	local function render()
		if state then
			toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 110, 255)
			knob.Position = UDim2.new(1, -24, 0.5, -11)
		else
			toggleBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
			knob.Position = UDim2.new(0, 2, 0.5, -11)
		end
	end

	local function setState(newVal)
		state = newVal
		render()
		if onChanged then
			onChanged(state)
		end
	end

	toggleBtn.MouseButton1Click:Connect(function()
		setState(not state)
	end)

	render()
	return {
		Get = function() return state end,
		Set = setState,
		Row = row
	}
end

--========================
-- 3D Viewport component
--========================
local function createViewport(parent, modelTemplate)
	local box = make("Frame", {
		Size = UDim2.new(1, 0, 0, 240),
		BackgroundColor3 = Color3.fromRGB(24, 24, 28)
	}, parent)
	roundify(box, 12)
	makeStroke(box, 1, 0.65)
	makePadding(box, 10, 10, 10, 10)

	local label = make("TextLabel", {
		Size = UDim2.new(1, 0, 0, 22),
		BackgroundTransparency = 1,
		Text = "Preview 3D (ViewportFrame)",
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = Color3.fromRGB(240, 240, 240)
	}, box)

	local viewport = make("ViewportFrame", {
		Name = "Viewport",
		Size = UDim2.new(1, 0, 1, -28),
		Position = UDim2.new(0, 0, 0, 28),
		BackgroundColor3 = Color3.fromRGB(18, 18, 22),
		BorderSizePixel = 0
	}, box)
	roundify(viewport, 10)
	makeStroke(viewport, 1, 0.75)

	local cam = Instance.new("Camera")
	cam.Parent = viewport
	viewport.CurrentCamera = cam

	-- Clone model into viewport
	local model = modelTemplate:Clone()
	model.Parent = viewport

	-- Ensure PrimaryPart
	if not model.PrimaryPart then
		local pp = model:FindFirstChildWhichIsA("BasePart", true)
		if pp then model.PrimaryPart = pp end
	end

	-- Simple placement + camera
	if model.PrimaryPart then
		model:PivotTo(CFrame.new(0, 0, 0))
		local cf, size = model:GetBoundingBox()
		local maxDim = math.max(size.X, size.Y, size.Z)
		local dist = maxDim * 1.8 + 3
		cam.CFrame = CFrame.new(cf.Position + Vector3.new(0, size.Y * 0.2, dist), cf.Position)
	end

	-- Spin slowly
	task.spawn(function()
		while viewport.Parent do
			task.wait(0.03)
			if model and model.PrimaryPart then
				model:PivotTo(model:GetPivot() * CFrame.Angles(0, math.rad(1), 0))
			end
		end
	end)

	return box
end

--========================
-- Pages content
--========================
local pageHome = createPage("Home")
local pageSettings = createPage("Settings")
local pageAbout = createPage("About")

-- Common page container style
local function pageCard(parent, h)
	local card = make("Frame", {
		Size = UDim2.new(1, 0, 0, h),
		BackgroundColor3 = Color3.fromRGB(24, 24, 28)
	}, parent)
	roundify(card, 12)
	makeStroke(card, 1, 0.65)
	makePadding(card, 12, 12, 12, 12)
	return card
end

-- Layout pages
for _, pg in ipairs({pageHome, pageSettings, pageAbout}) do
	local layout = make("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 10)
	}, pg)
end

-- HOME: switches + viewport
do
	local c1 = pageCard(pageHome, 44)
	createSwitch(c1, "Bật hiệu ứng A", false, function(on)
		-- TODO: xử lý bật/tắt
		-- print("Effect A:", on)
	end)

	local c2 = pageCard(pageHome, 44)
	createSwitch(c2, "Bật tính năng B", true, function(on)
		-- TODO: xử lý bật/tắt
		-- print("Feature B:", on)
	end)

	-- Create a simple model for viewport if you don't have one in ReplicatedStorage
	-- If you already have a model, replace this with: local template = ReplicatedStorage:WaitForChild("YourModel")
	local template = Instance.new("Model")
	template.Name = "PreviewModel"
	local part = Instance.new("Part")
	part.Size = Vector3.new(3, 3, 3)
	part.Anchored = true
	part.Name = "Cube"
	part.Parent = template
	template.PrimaryPart = part

	local vpCard = make("Frame", {Size = UDim2.new(1, 0, 0, 240), BackgroundTransparency = 1}, pageHome)
	createViewport(vpCard, template)
	template:Destroy()
end

-- SETTINGS: list selection info + switch
do
	local c1 = pageCard(pageSettings, 90)
	local txt = make("TextLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		Font = Enum.Font.Gotham,
		TextSize = 13,
		TextColor3 = Color3.fromRGB(220, 220, 220),
		Text = "Trang Settings.\n- Bạn có thể dùng 'Đang chọn' bên trái để áp dụng cấu hình.\n- Ví dụ: chọn Option A rồi bật switch để kích hoạt."
	}, c1)

	local c2 = pageCard(pageSettings, 44)
	createSwitch(c2, "Áp dụng theo lựa chọn", false, function(on)
		-- Ví dụ: dùng currentSelected
		-- print("Apply selected:", currentSelected, "state:", on)
	end)
end

-- ABOUT
do
	local c1 = pageCard(pageAbout, 120)
	make("TextLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		Font = Enum.Font.Gotham,
		TextSize = 13,
		TextColor3 = Color3.fromRGB(220, 220, 220),
		Text = "About:\n- UI có Logo bật/tắt\n- Tabs\n- List chọn bên trái\n- Công tắc (switch)\n- ViewportFrame preview 3D\n\nBạn muốn thêm: dropdown, slider, keybind, hay save settings?"
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
		tabButtons[page].BackgroundColor3 = Color3.fromRGB(60, 110, 255)
	end
end

local function createTab(name, page)
	local btn = make("TextButton", {
		Size = UDim2.new(0, 120, 1, -0),
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
