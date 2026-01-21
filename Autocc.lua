local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Biến trạng thái cho từng option
local optionStates = {
	["Speed Boost"] = {
		fly = false,
		speed = false,
		noclip = false,
		speedValue = 100
	},
	["Fly Mode"] = {
		fly = false,
		speed = false,
		noclip = false,
		speedValue = 50
	},
	["Super Jump"] = {
		fly = false,
		speed = false,
		noclip = false,
		speedValue = 80,
		jump = false,
		jumpPower = 100
	},
	["Ghost Mode"] = {
		fly = false,
		speed = false,
		noclip = false,
		speedValue = 60
	},
	["Combat Mode"] = {
		fly = false,
		speed = false,
		noclip = false,
		speedValue = 120
	}
}

local currentOption = nil
local flySpeed = 50
local isFlying = false
local isNoclip = false
local bodyVelocity, bodyGyro
local moveDirection = {
	w = false, a = false, s = false, d = false,
	space = false, shift = false
}

-- Helper functions
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

-- Fly function
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
	else
		if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
		if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
	end
end

-- Speed function
local function setSpeed(value)
	if humanoid then
		humanoid.WalkSpeed = value
	end
end

-- Noclip function
local function toggleNoclip(state)
	isNoclip = state
end

-- Jump function
local function setJumpPower(value)
	if humanoid then
		humanoid.JumpPower = value
	end
end

-- Input handling
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

-- Fly loop
RunService.RenderStepped:Connect(function()
	if isFlying and bodyVelocity and bodyGyro then
		local camera = workspace.CurrentCamera
		local cameraCFrame = camera.CFrame
		local moveVector = Vector3.new(0, 0, 0)
		
		if moveDirection.w then moveVector = moveVector + (cameraCFrame.LookVector * flySpeed) end
		if moveDirection.s then moveVector = moveVector - (cameraCFrame.LookVector * flySpeed) end
		if moveDirection.a then moveVector = moveVector - (cameraCFrame.RightVector * flySpeed) end
		if moveDirection.d then moveVector = moveVector + (cameraCFrame.RightVector * flySpeed) end
		if moveDirection.space then moveVector = moveVector + Vector3.new(0, flySpeed, 0) end
		if moveDirection.shift then moveVector = moveVector - Vector3.new(0, flySpeed, 0) end
		
		bodyVelocity.Velocity = moveVector
		bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, humanoidRootPart.Position + cameraCFrame.LookVector)
	end
	
	-- Noclip loop
	if isNoclip then
		for _, part in pairs(character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)

-- Character respawn
player.CharacterAdded:Connect(function(newCharacter)
	character = newCharacter
	humanoid = character:WaitForChild("Humanoid")
	humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	isFlying = false
	isNoclip = false
	if bodyVelocity then bodyVelocity:Destroy() end
	if bodyGyro then bodyGyro:Destroy() end
end)

-- UI Creation
local screenGui = make("ScreenGui", {
	Name = "MenuUI_Fly",
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
	Text = "DIEVER HUB • Speed & Fly Menu",
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
	Text = "Chọn chế độ",
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

-- Right side content frame
local contentFrame = make("Frame", {
	Name = "ContentFrame",
	Size = UDim2.new(1, -16, 1, -16),
	Position = UDim2.new(0, 8, 0, 8),
	BackgroundTransparency = 1
}, right)

local contentScroll = make("ScrollingFrame", {
	Name = "ContentScroll",
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	CanvasSize = UDim2.new(0, 0, 0, 0),
	ScrollBarThickness = 6
}, contentFrame)

local contentLayout = make("UIListLayout", {
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 10)
}, contentScroll)

-- Store switches for each option
local switchStorage = {}

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

-- Function to create content for each option
local function createOptionContent(optionName)
	contentScroll:ClearAllChildren()
	make("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 10)
	}, contentScroll)
	
	local state = optionStates[optionName]
	if not switchStorage[optionName] then
		switchStorage[optionName] = {}
	end
	
	if optionName == "Speed Boost" then
		local card = pageCard(contentScroll, "⚡ Speed Boost")
		local cf = make("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			Position = UDim2.new(0, 0, 0, 28),
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y
		}, card)
		make("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }, cf)
		
		switchStorage[optionName].speed = createMiniSwitch(cf, "Bật Speed Boost", state.speed, function(on)
			state.speed = on
			if on then setSpeed(state.speedValue) else setSpeed(16) end
		end)
		
		make("TextLabel", {
			Size = UDim2.new(1, 0, 0, 30),
			BackgroundTransparency = 1,
			Text = "Tốc độ chạy: x" .. state.speedValue,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = Enum.Font.Gotham,
			TextSize = 12,
			TextColor3 = Color3.fromRGB(180, 180, 180)
		}, cf)
		
	elseif optionName == "Fly Mode" then
		local card = pageCard(contentScroll, "✈️ Fly Mode")
		local cf = make("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			Position = UDim2.new(0, 0, 0, 28),
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y
		}, card)
		make("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }, cf)
		
		switchStorage[optionName].fly = createMiniSwitch(cf, "Bật Fly (WASD + Space/Shift)", state.fly, function(on)
			state.fly = on
			toggleFly(on)
		end)
		
		switchStorage[optionName].speed = createMiniSwitch(cf, "Speed khi bay", state.speed, function(on)
			state.speed = on
			if on then setSpeed(state.speedValue) else setSpeed(16) end
		end)
		
		make("TextLabel", {
			Size = UDim2.new(1, 0, 0, 40),
			BackgroundTransparency = 1,
			Text = "W/A/S/D: Di chuyển • Space: Bay lên • Shift: Bay xuống",
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = Enum.Font.Gotham,
			TextSize = 12,
			TextColor3 = Color3.fromRGB(180, 180, 180)
		}, cf)
		
	elseif optionName == "Super Jump" then
		local card = pageCard(contentScroll, "🦘 Super Jump")
		local cf = make("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			Position = UDim2.new(0, 0, 0, 28),
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y
		}, card)
		make("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }, cf)
		
		switchStorage[optionName].jump = createMiniSwitch(cf, "Bật Super Jump", state.jump, function(on)
			state.jump = on
			if on then setJumpPower(state.jumpPower) else setJumpPower(50) end
		end)
		
		switchStorage[optionName].speed = createMiniSwitch(cf, "Bật Speed", state.speed, function(on)
			state.speed = on
			if on then setSpeed(state.speedValue) else setSpeed(16) end
		end)
		
		make("TextLabel", {
			Size = UDim2.new(1, 0, 0, 30),
			BackgroundTransparency = 1,
			Text = "Jump Power: " .. state.jumpPower .. " | Speed: x" .. state.speedValue,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = Enum.Font.Gotham,
			TextSize = 12,
			TextColor3 = Color3.fromRGB(180, 180, 180)
		}, cf)
		
	elseif optionName == "Ghost Mode" then
		local card = pageCard(contentScroll, "👻 Ghost Mode")
		local cf = make("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			Position = UDim2.new(0, 0, 0, 28),
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y
		}, card)
		make("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }, cf)
		
		switchStorage[optionName].noclip = createMiniSwitch(cf, "Bật Noclip (đi xuyên tường)", state.noclip, function(on)
			state.noclip = on
			toggleNoclip(on)
		end)
		
		switchStorage[optionName].speed = createMiniSwitch(cf, "Bật Speed", state.speed, function(on)
			state.speed = on
			if on then setSpeed(state.speedValue) else setSpeed(16) end
		end)
		
		make("TextLabel", {
			Size = UDim2.new(1, 0, 0, 30),
			BackgroundTransparency = 1,
			Text = "Đi xuyên tường + tốc độ nhanh",
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = Enum.Font.Gotham,
			TextSize = 12,
			TextColor3 = Color3.fromRGB(180, 180, 180)
		}, cf)
		
	elseif optionName == "Combat Mode" then
		local card = pageCard(contentScroll, "⚔️ Combat Mode")
		local cf = make("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			Position = UDim2.new(0, 0, 0, 28),
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y
		}, card)
		make("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8) }, cf)
		
		switchStorage[optionName].speed = createMiniSwitch(cf, "Bật Super Speed", state.speed, function(on)
			state.speed = on
			if on then setSpeed(state.speedValue) else setSpeed(16) end
		end)
		
		switchStorage[optionName].fly = createMiniSwitch(cf, "Bật Fly", state.fly, function(on)
			state.fly = on
			toggleFly(on)
		end)
		
		switchStorage[optionName].noclip = createMiniSwitch(cf, "Bật Noclip", state.noclip, function(on)
			state.noclip = on
			toggleNoclip(on)
		end)
		
		make("TextLabel", {
			Size = UDim2.new(1, 0, 0, 40),
			BackgroundTransparency = 1,
			Text = "Chế độ chiến đấu với Speed x120 + Fly + Noclip",
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = Enum.Font.Gotham,
			TextSize = 12,
			TextColor3 = Color3.fromRGB(180, 180, 180)
		}, cf)
	end
	
	task.wait()
	contentScroll.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 10)
end

-- Create list items
local listItems = {}
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
		-- Deselect previous
		for _, item in pairs(listItems) do
			item.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
		end
		-- Select current
		btn.BackgroundColor3 = Color3.fromRGB(80, 160, 255)
		currentOption = text
		selectedLabel.Text = "Đang chọn: " .. text
		createOptionContent(text)
	end)
	
	table.insert(listItems, btn)
	return btn
end

-- Create options
for optionName, _ in pairs(optionStates) do
	makeListItem(optionName)
end

local function updateCanvas()
	task.wait()
	scroll.CanvasSize = UDim2.new(0, 0, 0, scrollLayout.AbsoluteContentSize.Y + 6)
end
scrollLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
updateCanvas()

-- Buttons
local function setVisible(on)
	main.Visible = on
end

logoBtn.MouseButton1Click:Connect(function()
	setVisible(not main.Visible)
end)

closeBtn.MouseButton1Click:Connect(function()
	setVisible(false)
end)

print("DIEVER HUB loaded! Click logo to toggle.")
print("Chọn option bên trái để xem các chức năng khác nhau!")
