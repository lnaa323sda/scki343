--// Roblox UI Menu với Fly • Fixed Layout
--// Put this LocalScript in StarterPlayerScripts

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

--========================
-- Fly Variables
--========================
local flySpeed = 50
local isFlying = false
local bodyVelocity
local bodyGyro
local moveDirection = {
	w = false,
	a = false,
	s = false,
	d = false,
	space = false,
	shift = false
}

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
-- Fly Functions
--========================
local function toggleFly(state)
	isFlying = state
	
	if isFlying then
		bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.Velocity = Vector3.new(0, 0, 0)
		bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
		bodyVelocity.Parent = humanoidRootPart
		
		bodyGyro = Instance.new("BodyGyro")
		bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
		bodyGyro.P = 9e4
		bodyGyro.CFrame = humanoidRootPart.CFrame
		bodyGyro.Parent = humanoidRootPart
		
		print("Fly: ON")
	else
		if bodyVelocity then
			bodyVelocity:Destroy()
			bodyVelocity = nil
		end
		if bodyGyro then
			bodyGyro:Destroy()
			bodyGyro = nil
		end
		print("Fly: OFF")
	end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	local key = input.KeyCode.Name:lower()
	if moveDirection[key] ~= nil then
		moveDirection[key] = true
	end
end)

UserInputService.InputEnded:Connect(function(input)
	local key = input.KeyCode.Name:lower()
	if moveDirection[key] ~= nil then
		moveDirection[key] = false
	end
end)

RunService.RenderStepped:Connect(function()
	if not isFlying or not bodyVelocity or not bodyGyro then return end
	
	local camera = workspace.CurrentCamera
	local cameraCFrame = camera.CFrame
	local moveVector = Vector3.new(0, 0, 0)
	
	if moveDirection.w then
		moveVector = moveVector + (cameraCFrame.LookVector * flySpeed)
	end
	if moveDirection.s then
		moveVector = moveVector - (cameraCFrame.LookVector * flySpeed)
	end
	if moveDirection.a then
		moveVector = moveVector - (cameraCFrame.RightVector * flySpeed)
	end
	if moveDirection.d then
		moveVector = moveVector + (cameraCFrame.RightVector * flySpeed)
	end
	if moveDirection.space then
		moveVector = moveVector + Vector3.new(0, flySpeed, 0)
	end
	if moveDirection.shift then
		moveVector = moveVector - Vector3.new(0, flySpeed, 0)
	end
	
	bodyVelocity.Velocity = moveVector
	bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, 
		humanoidRootPart.Position + cameraCFrame.LookVector)
end)

player.CharacterAdded:Connect(function(newCharacter)
	character = newCharacter
	humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	isFlying = false
	if bodyVelocity then bodyVelocity:Destroy() end
	if bodyGyro then bodyGyro:Destroy() end
end)

--========================
-- ScreenGui
--========================
local screenGui = make("ScreenGui", {
	Name = "MenuUI_Fly",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
}, playerGui)

--========================
-- Logo button
--========================
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

-- Dragging
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

-- Body
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
-- Left: List chọn
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
	Size = UDim2.new(1, 0, 1, -50),
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

local items = {"Option A", "Option B", "Option C", "Option D", "Option E"}
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

-- Pages container với ScrollingFrame
local pagesScroll = make("ScrollingFrame", {
	Name = "PagesScroll",
	Size = UDim2.new(1, -16, 1, -58),
	Position = UDim2.new(0, 8, 0, 50),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	CanvasSize = UDim2.new(0, 0, 0, 0),
	ScrollBarThickness = 6
}, right)

local function createPage(pageName)
	local page = make("Frame", {
		Name = pageName,
		Size = UDim2.new(1, -6, 0, 0),
		BackgroundTransparency = 1,
		Visible = false,
		AutomaticSize = Enum.AutomaticSize.Y
	}, pagesScroll)
	
	local layout = make("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 10)
	}, page)
	
	-- Auto update canvas khi content thay đổi
	layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		task.wait()
		page.Size = UDim2.new(1, -6, 0, layout.AbsoluteContentSize.Y)
		pagesScroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
	end)
	
	return page
end

--========================
-- Mini Switch
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
local function pageCard(parent, title)
	local card = make("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(24, 24, 28),
		AutomaticSize = Enum.AutomaticSize.Y
	}, parent)
	roundify(card, 12)
	makeStroke(card, 1, 0.65)
	makePadding(card, 12, 12, 10, 10)
	
	if title then
		make("TextLabel", {
			Size = UDim2.new(1, 0, 0, 22),
			BackgroundTransparency = 1,
			Text = title,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = Enum.Font.GothamBold,
			TextSize = 14,
			TextColor3 = Color3.fromRGB(240, 240, 240)
		}, card)
	end
	
	return card
end

--========================
-- Create pages
--========================
local pageHome = createPage("Home")
local pageSettings = createPage("Settings")
local pageAbout = createPage("About")

-- HOME: Fly + Quick Functions
do
	local flyCard = pageCard(pageHome, "Bay • Fly")
	
	local contentFrame = make("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(0, 0, 0, 28),
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y
	}, flyCard)
	
	local layout = make("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 8)
	}, contentFrame)
	
	createMiniSwitch(contentFrame, "Bật Fly (WASD + Space/Shift)", false, function(on)
		toggleFly(on)
	end)
	
	-- Info text
	make("TextLabel", {
		Size = UDim2.new(1, 0, 0, 40),
		BackgroundTransparency = 1,
		Text = "W/A/S/D: Di chuyển • Space: Bay lên • Shift: Bay xuống",
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = Color3.fromRGB(180, 180, 180)
	}, contentFrame)
	
	-- Quick functions card
	local quickCard = pageCard(pageHome, "Chức năng nhanh")
	
	local quickFrame = make("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(0, 0, 0, 28),
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y
	}, quickCard)
	
	make("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 8)
	}, quickFrame)
	
	createMiniSwitch(quickFrame, "Auto Run", false, function(on)
		print("Auto Run:", on, "Selected:", currentSelected)
	end)
	
	createMiniSwitch(quickFrame, "Boost", false, function(on)
		print("Boost:", on, "Selected:", currentSelected)
	end)
	
	createMiniSwitch(quickFrame, "Particles", false, function(on)
		print("Particles:", on, "Selected:", currentSelected)
	end)
end

-- SETTINGS
do
	local infoCard = pageCard(pageSettings, "Hướng dẫn")
	
	make("TextLabel", {
		Size = UDim2.new(1, 0, 0, 60),
		Position = UDim2.new(0, 0, 0, 28),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextWrapped = true,
		Font = Enum.Font.Gotham,
		TextSize = 13,
		TextColor3 = Color3.fromRGB(220, 220, 220),
		Text = "Chọn Option ở bên trái, sau đó bật/tắt các tính năng bên phải. Các tính năng sẽ áp dụng theo lựa chọn hiện tại."
	}, infoCard)
	
	local optCard = pageCard(pageSettings, "Tùy chọn")
	
	local optFrame = make("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		Position = UDim2.new(0, 0, 0, 28),
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y
	}, optCard)
	
	make("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 8)
	}, optFrame)
	
	createMiniSwitch(optFrame, "Apply theo lựa chọn", false, function(on)
		print("Apply Selected:", on, "Selected:", currentSelected)
	end)
	
	createMiniSwitch(optFrame, "Notifications", true, function(on)
		print("Notifications:", on)
	end)
	
	createMiniSwitch(optFrame, "Auto Save", false, function(on)
		print("Auto Save:", on)
	end)
end

-- ABOUT
do
	local aboutCard = pageCard(pageAbout, "Thông tin")
	
	make("TextLabel", {
		Size = UDim2.new(1, 0, 0, 120),
		Position = UDim2.new(0, 0, 0, 28),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextWrapped = true,
		Font = Enum.Font.Gotham,
		TextSize = 13,
		TextColor3 = Color3.fromRGB(220, 220, 220),
		Text = "Menu UI với Fly\n\n• Click logo để bật/tắt UI\n• Tab Home: Bật fly bằng công tắc\n• List chọn bên trái\n• Tabs tự động hiện nội dung\n• Layout không bị tràn\n\nPhát triển bởi Nova Roblox"
	}, aboutCard)
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
	pagesScroll.CanvasPosition = Vector2.new(0, 0)
	
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

print("Menu UI loaded! Click logo to toggle.")
