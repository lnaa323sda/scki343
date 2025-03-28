local DragonLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/daucobonhi/uilibrary/refs/heads/main/Sitink%20Lib/SitinkUIfix.lua"))()
local Window = DragonLib:Start({
    ["Name"] = "Zush Hub PvP",
    ["Description"] = "",
    ["Info Color"] = Color3.fromRGB(255, 255, 255),
    ["Tab Width"] = 135,
    ["Color"] = Color3.fromRGB(255, 255, 255),
    ["CloseCallBack"] = function() end
})

-- Cấu hình Aim và ESP
_G.AimAssist = false
_G.FOVRange = 200
_G.ESPEnabled = false
_G.NuocLon = false
_G.NoClipEnabled = false
_G.SpeedBoostEnabled = false
_G.WalkSpeed = 50 -- Tốc độ chạy mặc định
_G.InfiniteJumpEnabled = false

local function getClosestPlayer()
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local mouse = localPlayer:GetMouse()
    local closestPlayer = nil
    local shortestDistance = _G.FOVRange

    for _, player in pairs(players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local pos = player.Character.HumanoidRootPart.Position
            local screenPos = workspace.CurrentCamera:WorldToScreenPoint(pos)
            local distance = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
            if distance < shortestDistance then
                closestPlayer = player
                shortestDistance = distance
            end
        end
    end
    return closestPlayer
end

local function aimAt(target)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local camera = workspace.CurrentCamera
        camera.CFrame = CFrame.new(camera.CFrame.Position, target.Character.HumanoidRootPart.Position)
    end
end

-- ESP
local function createESP(player)
    local billboard = Instance.new("BillboardGui", player.Character)
    billboard.Name = "ESP"
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.Adornee = player.Character.Head

    local textLabel = Instance.new("TextLabel", billboard)
    textLabel.Text = player.Name
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.TextColor3 = Color3.new(1, 0, 0)
    textLabel.BackgroundTransparency = 1
end

local function enableESP()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if not player.Character:FindFirstChild("ESP") then
                createESP(player)
            end
        end
    end
end

local function disableESP()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("ESP") then
            player.Character:FindFirstChild("ESP"):Destroy()
        end
    end
end

local function ToggleWaterWalk()
    spawn(function()
        while task.wait() do
            pcall(function()
                -- Kiểm tra và thay đổi kích thước của "WaterBase-Plane"
                if _G.NuocLon then
                    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)  -- Mực nước cao để đi trên
                else
                    game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)  -- Mực nước trở lại bình thường
                end
            end)
        end
    end)
end

local function enableNoClip()
    local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    local runService = game:GetService("RunService")
    
    runService.Stepped:Connect(function()
        if _G.NoClipEnabled then
            for _, v in pairs(character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
    end)
end

local function adjustWalkSpeed(speed)
    local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = speed
end

-- Cách sử dụng:
-- Để thay đổi tốc độ, gọi hàm này và truyền vào tốc độ mong muốn.
adjustWalkSpeed(50) -- Ví dụ: Set tốc độ chạy là 50

local function enableInfiniteJump()
    local userInputService = game:GetService("UserInputService")
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    userInputService.JumpRequest:Connect(function()
        if _G.InfiniteJumpEnabled then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
end

enableInfiniteJump()

-- Tab Aim & ESP
local MainTab = Window:MakeTab("Tab PvP")
local Section = MainTab:Section({["Title"] = "Config PvP", ["Content"] = ""})

-- Toggle Aim Assist
local AimToggle = Section:Toggle({
    ["Title"] = "Aim Bot",
    ["Content"] = "",
    ["Default"] = false,
    ["Callback"] = function(Value)
        _G.AimAssist = Value
        if Value then
            print("Aim Assist Enabled")
        else
            print("Aim Assist Disabled")
        end
    end
})

-- Slider để chỉnh FOV cho Aim
local FOVSlider = Section:Slider({
    ["Title"] = "FOV Aim",
    ["Content"] = "Good Aim",
    ["Min"] = 0,
    ["Max"] = 1000,
    ["Increment"] = 1,
    ["Default"] = 200,
    ["Callback"] = function(Value)
        _G.FOVRange = Value
        print("FOV Range Set To:", Value)
    end
})

-- Toggle ESP
local ESPToggle = Section:Toggle({
    ["Title"] = "Enable ESP",
    ["Content"] = "Show ESP player",
    ["Default"] = false,
    ["Callback"] = function(Value)
        _G.ESPEnabled = Value
        if Value then
            enableESP()
            print("ESP Enabled")
        else
            disableESP()
            print("ESP Disabled")
        end
    end
})

local WaterWalkToggle = Section:Toggle({
    ["Title"] = "Water Walk",
    ["Content"] = "Walk on water",
    ["Default"] = false,
    ["Callback"] = function(Value)
        _G.NuocLon = Value  -- Bật hoặc tắt chức năng theo giá trị của nút
        ToggleWaterWalk()  -- Gọi hàm thay đổi kích thước nước
        
        if Value then
            print("Water Walk Enabled")
        else
            print("Water Walk Disabled")
        end
    end
})

local NoClipToggle = Section:Toggle({
    ["Title"] = "No Clip",
    ["Content"] = "Walk through walls",
    ["Default"] = false,
    ["Callback"] = function(Value)
        _G.NoClipEnabled = Value
        if Value then
            enableNoClip()
            print("No Clip Enabled")
        else
            print("No Clip Disabled")
        end
    end
})

local SpeedBoostToggle = Section:Toggle({
    ["Title"] = "Speed Boost",
    ["Content"] = "Increase movement speed",
    ["Default"] = false,
    ["Callback"] = function(Value)
        _G.SpeedBoostEnabled = Value
        if Value then
            adjustWalkSpeed(_G.WalkSpeed)
            print("Speed Boost Enabled")
        else
            adjustWalkSpeed(50) -- Khôi phục tốc độ mặc định
            print("Speed Boost Disabled")
        end
    end
})

local SpeedSlider = Section:Slider({
    ["Title"] = "Walk Speed",
    ["Content"] = "Fast in pvp",
    ["Min"] = 16,
    ["Max"] = 200,
    ["Increment"] = 1,
    ["Default"] = 16,
    ["Callback"] = function(Value)
        _G.WalkSpeed = Value
        if _G.SpeedBoostEnabled then
            adjustWalkSpeed(Value)
            print("Walk Speed Set To:", Value)
        end
    end
})

local ToggleInfiniteJump = Section:Toggle({
    ["Title"] = "Infinite Jump",
    ["Content"] = "Infinite Jump Mod",
    ["Default"] = false,
    ["Callback"] = function(Value)
        _G.InfiniteJumpEnabled = Value
        print("Infinite Jump is now", Value and "Enabled" or "Disabled")
    end
})

-- Cập nhật chức năng Aim Assist trong vòng lặp
game:GetService("RunService").RenderStepped:Connect(function()
    if _G.AimAssist then
        local closestPlayer = getClosestPlayer()
        if closestPlayer then
            aimAt(closestPlayer)
        end
    end
end)

-- Giao diện nút mở/đóng UI
local ScreenGui1 = Instance.new("ScreenGui")
local ImageButton1 = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

ScreenGui1.Name = "ImageButton"
ScreenGui1.Parent = game.CoreGui
ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
-- Thiết lập thuộc tính cho nút hình ảnh
ImageButton1.Parent = ScreenGui1
ImageButton1.BorderSizePixel = 0
ImageButton1.Position = UDim2.new(0.12, 0, 0.1, 0)  -- Điều chỉnh vị trí cho cân đối hơn
ImageButton1.Size = UDim2.new(0, 50, 0, 50)  -- Kích thước nút
ImageButton1.Draggable = true  -- Cho phép kéo thả nút
ImageButton1.Image = "rbxassetid://135231360049361"  -- Đảm bảo sử dụng đúng rbxassetid
ImageButton1.ScaleType = Enum.ScaleType.Fit  -- Đặt ScaleType để hình ảnh vừa khung

-- Chức năng đóng/mở giao diện
ImageButton1.MouseButton1Click:Connect(function()
    DragonLib:ToggleUI()  -- Đóng/mở giao diện khi nút được nhấn
end)
-- Tạo góc bo tròn cho nút
UICorner.Parent = ImageButton1
-- Tạo viền cho nút
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 2
UIStroke.Parent = ImageButton1
