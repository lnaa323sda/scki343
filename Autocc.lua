a-- Giống Banana_UI: tạo ScreenGui + parent CoreGui (chạy được qua executor / loadstring)
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local function parentIntroGui(screenGui)
	screenGui.Parent = CoreGui
	if screenGui.Parent then
		return
	end
	pcall(function()
		if type(gethui) == "function" then
			screenGui.Parent = gethui()
		end
	end)
	if screenGui.Parent then
		return
	end
	local lp = Players.LocalPlayer
	if lp then
		screenGui.Parent = lp:FindFirstChildOfClass("PlayerGui") or lp:WaitForChild("PlayerGui", 8)
	end
end

local function destroyIntroNamed(name)
	local old = CoreGui:FindFirstChild(name)
	if old then old:Destroy() end
	pcall(function()
		if type(gethui) == "function" then
			local h = gethui()
			if h then
				old = h:FindFirstChild(name)
				if old then old:Destroy() end
			end
		end
	end)
	local lp = Players.LocalPlayer
	local pg = lp and lp:FindFirstChildOfClass("PlayerGui")
	if pg then
		old = pg:FindFirstChild(name)
		if old then old:Destroy() end
	end
end

pcall(function()
	for _, name in ipairs({ "DieverHubTheme", "VxezeHubTheme" }) do
		destroyIntroNamed(name)
	end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "DieverHubTheme"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 50
parentIntroGui(gui)

-- Xóa blur cũ nếu có
local oldBlur = Lighting:FindFirstChild("VxezeBlur")
if oldBlur then
	oldBlur:Destroy()
end

-- Blur nền
local blur = Instance.new("BlurEffect")
blur.Name = "VxezeBlur"
blur.Size = 0
blur.Parent = Lighting

-- Lớp nền tối
local overlay = Instance.new("Frame")
overlay.Name = "Overlay"
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.Position = UDim2.new(0, 0, 0, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 1
overlay.BorderSizePixel = 0
overlay.Parent = gui

local gradient = Instance.new("UIGradient")
gradient.Rotation = 90
gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 14, 28)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
})
gradient.Parent = overlay

-- Khung giữa
local main = Instance.new("Frame")
main.Name = "Main"
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.52, 0)
main.Size = UDim2.new(0, 420, 0, 260)
main.BackgroundTransparency = 1
main.Parent = gui

-- Logo
local logo = Instance.new("ImageLabel")
logo.Name = "Logo"
logo.AnchorPoint = Vector2.new(0.5, 0.5)
logo.Position = UDim2.new(0.5, 0, 0.34, 0)
logo.Size = UDim2.new(0, 150, 0, 150)
logo.BackgroundTransparency = 1
logo.ImageTransparency = 1
logo.ScaleType = Enum.ScaleType.Fit
logo.Image = "rbxassetid://70511817915018"
logo.Parent = main

-- Tên hub
local title = Instance.new("TextLabel")
title.Name = "Title"
title.AnchorPoint = Vector2.new(0.5, 0.5)
title.Position = UDim2.new(0.5, 0, 0.76, 0)
title.Size = UDim2.new(0, 340, 0, 55)
title.BackgroundTransparency = 1
-- Techno Hideo (ảnh): Roblox không có font DaFont — dùng SciFi (futuristic/góc cạnh) + viền đậm kiểu Dimitri
local hubTitle = "Diever Hub"
title.Text = hubTitle
title.TextColor3 = Color3.fromRGB(87, 190, 255)
title.TextScaled = true
title.Font = Enum.Font.SciFi
title.TextTransparency = 1
title.Parent = main

local titleStroke = Instance.new("UIStroke")
titleStroke.Color = Color3.fromRGB(20, 45, 70)
titleStroke.Thickness = 2.8
titleStroke.Transparency = 0.15
pcall(function()
	titleStroke.LineJoinMode = Enum.LineJoinMode.Round
end)
titleStroke.Parent = title

-- Glow chữ
local glow = Instance.new("TextLabel")
glow.Name = "Glow"
glow.AnchorPoint = Vector2.new(0.5, 0.5)
glow.Position = title.Position
glow.Size = title.Size
glow.BackgroundTransparency = 1
glow.Text = hubTitle
glow.TextColor3 = Color3.fromRGB(0, 170, 255)
glow.TextScaled = true
glow.Font = Enum.Font.SciFi
glow.TextTransparency = 1
glow.ZIndex = title.ZIndex - 1
glow.Parent = main

-- Discord
local discord = Instance.new("TextLabel")
discord.Name = "Discord"
discord.AnchorPoint = Vector2.new(0, 1)
discord.Position = UDim2.new(0, 18, 1, -14)
discord.Size = UDim2.new(0, 340, 0, 30)
discord.BackgroundTransparency = 1
discord.Text = "discord.gg/ggcmEa925C"
discord.TextXAlignment = Enum.TextXAlignment.Left
discord.Font = Enum.Font.GothamSemibold
discord.TextSize = 22
discord.TextColor3 = Color3.fromRGB(220, 220, 220)
discord.TextTransparency = 1
discord.Parent = gui

-- Animations
task.wait(0.1) -- Đợi GUI load xong

TweenService:Create(blur, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	Size = 18
}):Play()

TweenService:Create(overlay, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	BackgroundTransparency = 0.35
}):Play()

TweenService:Create(logo, TweenInfo.new(0.9, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
	ImageTransparency = 0
}):Play()

TweenService:Create(title, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	TextTransparency = 0
}):Play()

TweenService:Create(glow, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	TextTransparency = 0.7
}):Play()

TweenService:Create(discord, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	TextTransparency = 0
}):Play()

-- Pulse logo
task.spawn(function()
	while gui.Parent do
		local up = TweenService:Create(logo, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			Size = UDim2.new(0, 158, 0, 158)
		})
		local down = TweenService:Create(logo, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			Size = UDim2.new(0, 150, 0, 150)
		})
		up:Play()
		up.Completed:Wait()
		down:Play()
		down.Completed:Wait()
	end
end)
