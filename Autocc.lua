--// DIEVER HUB UI (Refactor) • Tabs: Info / Home / ESP (placeholder)
--// LocalScript in StarterPlayerScripts

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--========================
-- Helpers UI
--========================
local function make(instType, props, parent)
	local obj = Instance.new(instType)
	for k, v in pairs(props or {}) do obj[k] = v end
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
-- Mini Switch (gọn)
--========================
local function createMiniSwitch(parent, text, defaultOn, onChanged)
	local frame = make("Frame", {
		Size = UDim2.new(1, 0, 0, 34),
		BackgroundTransparency = 1
	}, parent)

	make("TextLabel", {
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

	local state = defaultOn == true

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
	return { Get = function() return state end, Set = setState, Root = frame }
end

--========================
-- Base UI
--========================
local screenGui = make("ScreenGui", {
	Name = "DIEVER_HUB_UI",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
}, playerGui)

local logoBtn = make("ImageButton", {
	Name = "LogoButton",
	Size = UDim2.new(0, 56, 0, 56),
	Position = UDim2.new(0, 16, 0, 16),
	BackgroundColor3 = Color3.fromRGB(25, 25, 28),
	AutoButtonColor = true,
	Image = "rbxassetid://70511817915018",
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

local main = make("Frame", {
	Name = "Main",
	Size = UDim2.new(0, 720, 0, 420),
	Position = UDim2.new(0, 16, 0, 84),
	BackgroundColor3 = Color3.fromRGB(20, 20, 24),
	Visible = true
}, screenGui)
roundify(main, 14)
makeStroke(main, 1, 0.35)

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
	Text = "DIEVER HUB • Tabs UI",
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

-- Drag window
do
	local dragging = false
	local dragStart, startPos
	topBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = main.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
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

local body = make("Frame", {
	Name = "Body",
	Size = UDim2.new(1, 0, 1, -44),
	Position = UDim2.new(0, 0, 0, 44),
	BackgroundTransparency = 1
}, main)

-- Tabs column (left)
local tabsPanel = make("Frame", {
	Name = "TabsPanel",
	Size = UDim2.new(0, 200, 1, 0),
	BackgroundTransparency = 1
}, body)

local tabsBox = make("Frame", {
	Name = "TabsBox",
	Size = UDim2.new(1, -16, 1, -16),
	Position = UDim2.new(0, 8, 0, 8),
	BackgroundColor3 = Color3.fromRGB(24, 24, 28)
}, tabsPanel)
roundify(tabsBox, 12)
makeStroke(tabsBox, 1, 0.6)
makePadding(tabsBox, 10, 10, 10, 10)

make("TextLabel", {
	Size = UDim2.new(1, 0, 0, 22),
	BackgroundTransparency = 1,
	Text = "Tabs",
	TextXAlignment = Enum.TextXAlignment.Left,
	Font = Enum.Font.GothamBold,
	TextSize = 14,
	TextColor3 = Color3.fromRGB(240, 240, 240)
}, tabsBox)

local tabsList = make("Frame", {
	Size = UDim2.new(1, 0, 1, -28),
	Position = UDim2.new(0, 0, 0, 28),
	BackgroundTransparency = 1
}, tabsBox)

make("UIListLayout", {
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 8)
}, tabsList)

-- Pages area (right)
local pagesPanel = make("Frame", {
	Name = "PagesPanel",
	Size = UDim2.new(1, -200, 1, 0),
	Position = UDim2.new(0, 200, 0, 0),
	BackgroundTransparency = 1
}, body)

local pageBox = make("Frame", {
	Name = "PageBox",
	Size = UDim2.new(1, -16, 1, -16),
	Position = UDim2.new(0, 8, 0, 8),
	BackgroundColor3 = Color3.fromRGB(24, 24, 28)
}, pagesPanel)
roundify(pageBox, 12)
makeStroke(pageBox, 1, 0.6)
makePadding(pageBox, 12, 12, 12, 12)

local pages = make("Frame", {
	Name = "Pages",
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1
}, pageBox)

local function createPage(name)
	local pg = make("Frame", {
		Name = name,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Visible = false
	}, pages)
	return pg
end

local function pageHeader(pg, text)
	return make("TextLabel", {
		Size = UDim2.new(1, 0, 0, 24),
		BackgroundTransparency = 1,
		Text = text,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.GothamBold,
		TextSize = 16,
		TextColor3 = Color3.fromRGB(240, 240, 240)
	}, pg)
end

local function pageScroll(pg)
	local sc = make("ScrollingFrame", {
		Size = UDim2.new(1, 0, 1, -30),
		Position = UDim2.new(0, 0, 0, 30),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 6,
		CanvasSize = UDim2.new(0, 0, 0, 0)
	}, pg)
	local layout = make("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 10)
	}, sc)

	layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		sc.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
	end)

	return sc, layout
end

--========================
-- Pages: Info / Home / ESP (placeholder)
--========================
local pageInfo = createPage("Info")
local pageHome = createPage("Home")
local pageESP = createPage("ESP")

-- INFO
pageHeader(pageInfo, "Info")
local infoScroll = pageScroll(pageInfo)

local infoCard = make("Frame", {
	Size = UDim2.new(1, 0, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundColor3 = Color3.fromRGB(20, 20, 24)
}, infoScroll)
roundify(infoCard, 12)
makeStroke(infoCard, 1, 0.65)
makePadding(infoCard, 12, 12, 10, 10)

make("TextLabel", {
	Size = UDim2.new(1, 0, 0, 20),
	BackgroundTransparency = 1,
	Text = "Danh sách người chơi (auto update)",
	TextXAlignment = Enum.TextXAlignment.Left,
	Font = Enum.Font.GothamSemibold,
	TextSize = 14,
	TextColor3 = Color3.fromRGB(235, 235, 235)
}, infoCard)

local playersList = make("Frame", {
	Size = UDim2.new(1, 0, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1
}, infoCard)

make("UIListLayout", {
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 6)
}, playersList)

local playerRows = {}

local function addPlayerRow(plr)
	if playerRows[plr] then return end
	local row = make("Frame", {
		Size = UDim2.new(1, 0, 0, 30),
		BackgroundColor3 = Color3.fromRGB(32, 32, 38)
	}, playersList)
	roundify(row, 10)
	makeStroke(row, 1, 0.75)

	makePadding(row, 10, 10, 6, 6)

	make("TextLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = ("@%s  |  %s"):format(plr.Name, plr.DisplayName),
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = Enum.Font.Gotham,
		TextSize = 13,
		TextColor3 = Color3.fromRGB(235, 235, 235)
	}, row)

	playerRows[plr] = row
end

local function removePlayerRow(plr)
	local row = playerRows[plr]
	if row then row:Destroy() end
	playerRows[plr] = nil
end

for _, plr in ipairs(Players:GetPlayers()) do
	addPlayerRow(plr)
end
Players.PlayerAdded:Connect(addPlayerRow)
Players.PlayerRemoving:Connect(removePlayerRow)

-- HOME
pageHeader(pageHome, "Home")
local homeScroll = pageScroll(pageHome)

local homeCard = make("Frame", {
	Size = UDim2.new(1, 0, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundColor3 = Color3.fromRGB(20, 20, 24)
}, homeScroll)
roundify(homeCard, 12)
makeStroke(homeCard, 1, 0.65)
makePadding(homeCard, 12, 12, 10, 10)

make("TextLabel", {
	Size = UDim2.new(1, 0, 0, 20),
	BackgroundTransparency = 1,
	Text = "Chức năng (mẫu)",
	TextXAlignment = Enum.TextXAlignment.Left,
	Font = Enum.Font.GothamSemibold,
	TextSize = 14,
	TextColor3 = Color3.fromRGB(235, 235, 235)
}, homeCard)

local homeList = make("Frame", {
	Size = UDim2.new(1, 0, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1
}, homeCard)

make("UIListLayout", {
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 8)
}, homeList)

createMiniSwitch(homeList, "UI Sounds", true, function(on)
	-- TODO: implement if you want
end)

createMiniSwitch(homeList, "Show FPS (placeholder)", false, function(on)
	-- TODO: implement if you want
end)

-- ESP (placeholder, không cheat)
pageHeader(pageESP, "ESP (placeholder)")
local espScroll = pageScroll(pageESP)

local espCard = make("Frame", {
	Size = UDim2.new(1, 0, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundColor3 = Color3.fromRGB(20, 20, 24)
}, espScroll)
roundify(espCard, 12)
makeStroke(espCard, 1, 0.65)
makePadding(espCard, 12, 12, 10, 10)

make("TextLabel", {
	Size = UDim2.new(1, 0, 0, 44),
	BackgroundTransparency = 1,
	Text = "Mình không thể code ESP cheat (line/box/name/distance).\nNếu đây là game của bạn: mình có thể làm marker hợp lệ cho teammate/NPC/objective.",
	TextWrapped = true,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextYAlignment = Enum.TextYAlignment.Top,
	Font = Enum.Font.Gotham,
	TextSize = 13,
	TextColor3 = Color3.fromRGB(200, 200, 200)
}, espCard)

local espList = make("Frame", {
	Size = UDim2.new(1, 0, 0, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1
}, espCard)

make("UIListLayout", {
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 8)
}, espList)

createMiniSwitch(espList, "ESP Line (disabled)", false, function(on) end)
createMiniSwitch(espList, "ESP Box (disabled)", false, function(on) end)
createMiniSwitch(espList, "Name + Distance (disabled)", false, function(on) end)

--========================
-- Tabs buttons
--========================
local currentPage
local tabButtons = {}

local function setPage(pg)
	if currentPage then currentPage.Visible = false end
	currentPage = pg
	currentPage.Visible = true

	for _, b in pairs(tabButtons) do
		b.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
	end
	if tabButtons[pg] then
		tabButtons[pg].BackgroundColor3 = Color3.fromRGB(80, 160, 255)
	end
end

local function createTabButton(text, pg)
	local btn = make("TextButton", {
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundColor3 = Color3.fromRGB(32, 32, 38),
		Text = text,
		Font = Enum.Font.GothamSemibold,
		TextSize = 14,
		TextColor3 = Color3.fromRGB(240, 240, 240),
		AutoButtonColor = true
	}, tabsList)
	roundify(btn, 10)
	makeStroke(btn, 1, 0.7)

	btn.MouseButton1Click:Connect(function()
		setPage(pg)
	end)

	tabButtons[pg] = btn
end

createTabButton("Info", pageInfo)
createTabButton("Home", pageHome)
createTabButton("ESP", pageESP)

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

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.RightControl then
		setVisible(not main.Visible)
	end
end)
