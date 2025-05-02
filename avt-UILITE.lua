task.spawn(function()
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Zush Hub",
            Text = "Kaitun Farm Boss Premium",
            Icon = "rbxassetid://108644766679780",
            Duration = 5
        })
    end)
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

local VxezeUI = Instance.new("ScreenGui")
VxezeUI.Name = "ZushUI"
VxezeUI.ResetOnSpawn = false
VxezeUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
VxezeUI.Parent = player:WaitForChild("PlayerGui")

local BlurEffect = Instance.new("BlurEffect", Lighting)
BlurEffect.Size = 40
BlurEffect.Enabled = true

local ToggleContainer = Instance.new("Frame")
ToggleContainer.Parent = VxezeUI
ToggleContainer.Size = UDim2.new(0, 60, 0, 60)
ToggleContainer.Position = UDim2.new(0, 20, 0, 100)
ToggleContainer.BackgroundTransparency = 1
ToggleContainer.ZIndex = 15

local LogoImage = Instance.new("ImageButton")
LogoImage.Parent = ToggleContainer
LogoImage.Size = UDim2.new(0, 60, 0, 60)
LogoImage.Position = UDim2.new(0, 0, 0, 0)
LogoImage.BackgroundTransparency = 1
LogoImage.Image = "rbxassetid://108644766679780"
LogoImage.ZIndex = 15

local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(1, 0)
logoCorner.Parent = LogoImage

local uiElements = {}

local function createTextLabel(text, pos, size, fontSize)
	local label = Instance.new("TextLabel")
	label.Parent = VxezeUI
	label.Text = text
	label.Font = Enum.Font.Gotham
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextSize = fontSize or 20
	label.BackgroundTransparency = 1
	label.Position = pos
	label.Size = size
	label.TextWrapped = true
	label.Visible = true
	label.ZIndex = 10
	label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	label.TextStrokeTransparency = 0.4
	table.insert(uiElements, label)
	return label
end

local HubTitle = createTextLabel("Zush Hub", UDim2.new(0.5, -150, 0.08, 0), UDim2.new(0, 300, 0, 40), 26)
HubTitle.Font = Enum.Font.GothamBold
local PremiumLabel = createTextLabel("(Premium)", UDim2.new(0.5, 50, 0.085, 0), UDim2.new(0, 100, 0, 25), 18)

local TimeLabel = createTextLabel("0 Hours 0 Minutes 0 Seconds", UDim2.new(0.5, -150, 0.12, 0), UDim2.new(0, 300, 0, 30))
local BossStatus = createTextLabel("Status: Auto Farm Boss ", UDim2.new(0.5, -150, 0.16, 0), UDim2.new(0, 300, 0, 30))
local DiscordLink = createTextLabel("discord.gg/ADZ7H2rwk7", UDim2.new(0.5, -150, 0.20, 0), UDim2.new(0, 300, 0, 25), 18)

local CenterLogo = Instance.new("ImageLabel")
CenterLogo.Parent = VxezeUI
CenterLogo.Size = UDim2.new(0, 300, 0, 300)
CenterLogo.Position = UDim2.new(0.5, -150, 0.42, -150)
CenterLogo.Image = "rbxassetid://121407840908698"
CenterLogo.BackgroundTransparency = 1
CenterLogo.ZIndex = 5
table.insert(uiElements, CenterLogo)

local PlayerInfo = createTextLabel("Player: LOADING | Level: 0 | 0 Beli | 0 Fragments", UDim2.new(0.5, -250, 0.70, 0), UDim2.new(0, 500, 0, 25), 18)
local BossLabel = createTextLabel("Boss: ", UDim2.new(0.5, -100, 0.74, 0), UDim2.new(0, 200, 0, 25), 18)

local iconIds = {
	"109918123130817",
	"120059522052261",
	"95168279252476"
}

for i, assetId in ipairs(iconIds) do
	local icon = Instance.new("ImageLabel")
	icon.Parent = VxezeUI
	icon.Size = UDim2.new(0, 32, 0, 32)
	icon.Position = UDim2.new(0.5, -55 + (i - 1) * 40, 0.64, 0)
	icon.Image = "rbxassetid://" .. assetId
	icon.BackgroundTransparency = 1
	icon.ZIndex = 10

	local iconCorner = Instance.new("UICorner")
	iconCorner.CornerRadius = UDim.new(1, 0)
	iconCorner.Parent = icon

	local iconStroke = Instance.new("UIStroke")
	iconStroke.Thickness = 1.5
	iconStroke.Color = Color3.fromRGB(255, 255, 255)
	iconStroke.Transparency = 0.2
	iconStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	iconStroke.Parent = icon

	table.insert(uiElements, icon)
end

local uiVisible = true
LogoImage.MouseButton1Click:Connect(function()
	uiVisible = not uiVisible
	for _, v in ipairs(uiElements) do
		v.Visible = uiVisible
	end
	CenterLogo.Visible = uiVisible
	BlurEffect.Enabled = uiVisible
end)

local startTime = tick()
RunService.RenderStepped:Connect(function()
	local timePlayed = math.floor(tick() - startTime)
	local hours = math.floor(timePlayed / 3600)
	local minutes = math.floor((timePlayed % 3600) / 60)
	local seconds = timePlayed % 60
	TimeLabel.Text = string.format("%d Hours %d Minutes %d Seconds", hours, minutes, seconds)
end)

task.spawn(function()
	while wait(1) do
		local lvl = player:FindFirstChild("Data") and player.Data:FindFirstChild("Level") and player.Data.Level.Value or 0
		local beli = player:FindFirstChild("Data") and player.Data:FindFirstChild("Beli") and player.Data.Beli.Value or 0
		local frag = player:FindFirstChild("Data") and player.Data:FindFirstChild("Fragments") and player.Data.Fragments.Value or 0
		PlayerInfo.Text = string.format("Player: %s | Level: %s | %s Beli | %s Fragments", player.Name, lvl, beli, frag)
	end
end)

--=== START SCRIPT FARM ===--

if getgenv().Team == "Pirates" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
elseif getgenv().Team == "Marines" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
end
wait(1)
hookfunction(
    require(game:GetService("ReplicatedStorage").Effect.Container.Death),
    function()
    end
)
hookfunction(
    require(game:GetService("ReplicatedStorage").Effect.Container.Respawn),
    function()
    end
)
hookfunction(
    require(game:GetService("ReplicatedStorage"):WaitForChild("GuideModule")).ChangeDisplayedNPC,
    function()
    end
)
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
if (game.PlaceId == 2753915549) then
    World1 = true
elseif (game.PlaceId == 4442272183) then
    World2 = true
elseif (game.PlaceId == 7449423635) then
    World3 = true
end
local function autoSelectMelee()
    task.spawn(
        function()
            while wait() do
                pcall(
                    function()
                        
                        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            
                            if v.ToolTip == "Melee" then
                                
                                if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                                    
                                    SelectWeapon = v.Name
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                    break
                                end
                            end
                        end
                    end
                )
            end
        end
    )
end

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    
    autoSelectMelee()
end)

autoSelectMelee()

function CheckNearestTeleporter(v6)
    local v7 = game.Players.LocalPlayer.Data.Level.Value
    local v8 = v6.Position
    local v9 = math.huge
    local v10 = math.huge
    local v11 = game.PlaceId
    local v12, v13, v14
    if (v11 == 2753915549) then
        v12 = true
    elseif (v11 == 4442272183) then
        v13 = true
    elseif (v11 == 7449423635) then
        v14 = true
    end
    local v15 = {}
    if v14 then
        v15 = {
            Mansion = Vector3.new(-12471, 374, -7551),
            Hydra = Vector3.new(5659, 1013, -341),
            ["Caslte On The Sea"] = Vector3.new(-5092, 315, -3130),
            ["Floating Turtle"] = Vector3.new(-12001, 332, -8861),
            ["Beautiful Pirate"] = Vector3.new(5319, 23, -93),
            ["Temple Of Time"] = Vector3.new(28286, 14897, 103)
        }
    elseif v13 then
        v15 = {
            ["Flamingo Mansion"] = Vector3.new(-317, 331, 597),
            ["Flamingo Room"] = Vector3.new(2283, 15, 867),
            ["Cursed Ship"] = Vector3.new(923, 125, 32853),
            ["Zombie Island"] = Vector3.new(-6509, 83, -133)
        }
    elseif v12 then
        v15 = {
            ["Sky Island 1"] = Vector3.new(-4652, 873, -1754),
            ["Sky Island 2"] = Vector3.new(-7895, 5547, -380),
            ["Under Water Island"] = Vector3.new(61164, 5, 1820),
            ["Under Water Island Entrace"] = Vector3.new(3865, 5, -1926)
        }
    end
    local v16 = {}
    for v39, v40 in pairs(v15) do
        v16[v39] = (v40 - v8).Magnitude
    end
    for v43, v44 in pairs(v16) do
        if (v44 < v9) then
            v9 = v44
            v10 = v44
        end
    end
    local v17
    for v45, v46 in pairs(v16) do
        if (v46 <= v9) then
            v17 = v15[v45]
        end
    end
    local v18 = (v8 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if (v10 <= v18) then
        return v17
    end
end
function requestEntrance(v19)
    local v20 = {"requestEntrance", v19}
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(v20))
    local v21 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local v22 = game.Players.LocalPlayer.Character.HumanoidRootPart
    v22.CFrame = CFrame.new(v21.X, v21.Y + 50, v21.Z)
    task.wait(0.5)
end
function topos(v24)
    pcall(
        function()
            if
                (game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                    (game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0) and
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart)
             then
                if not TweenSpeed then
                    TweenSpeed = 350
                end
                DefualtY = v24.Y
                TargetY = v24.Y
                targetCFrameWithDefualtY = CFrame.new(v24.X, DefualtY, v24.Z)
                targetPos = v24.Position
                oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                Distance =
                    (targetPos -
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
                if (Distance <= 300) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v24
                end
                local v70 = CheckNearestTeleporter(v24)
                if v70 then
                    pcall(
                        function()
                            tween:Cancel()
                        end
                    )
                    requestEntrance(v70)
                end
                b1 =
                    CFrame.new(
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                    DefualtY,
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                )
                IngoreY = true
                if (IngoreY and ((b1.Position - targetCFrameWithDefualtY.Position).Magnitude > 5)) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                        DefualtY,
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                    )
                    local v89 = {}
                    local v90 = game:GetService("TweenService")
                    local v91 =
                        TweenInfo.new(
                        (targetPos -
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
                            TweenSpeed,
                        Enum.EasingStyle.Linear
                    )
                    tween =
                        v90:Create(
                        game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                        v91,
                        {CFrame = targetCFrameWithDefualtY}
                    )
                    tween:Play()
                    v89.Stop = function(v104)
                        tween:Cancel()
                    end
                    tween.Completed:Wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                        TargetY,
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                    )
                else
                    local v93 = {}
                    local v94 = game:GetService("TweenService")
                    local v95 =
                        TweenInfo.new(
                        (targetPos -
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
                            TweenSpeed,
                        Enum.EasingStyle.Linear
                    )
                    tween =
                        v94:Create(
                        game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                        v95,
                        {CFrame = v24}
                    )
                    tween:Play()
                    v93.Stop = function(v105)
                        tween:Cancel()
                    end
                    tween.Completed:Wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                        TargetY,
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z
                    )
                end
                if not tween then
                    return tween
                end
                return tweenfunc
            end
        end
    )
end
function StopTween(v25)
    if not v25 then
        _G.StopTween = true
        wait()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
    end
    if game.Players.LocalPlayer.Character:FindFirstChild("Highlight") then
        game.Players.LocalPlayer.Character:FindFirstChild("Highlight"):Destroy()
    end
end
spawn(
    function()
        pcall(
            function()
                while wait() do
                    if
                        (_G.FarmBoss or _G.DarkFull or _G.DoughFull or _G.RipFull or _G.MysticIsland or _G.Miragenpc or
                            _G.TweenMGear)
                     then
                        if
                            not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild(
                                "BodyClip"
                            )
                         then
                            local v106 = Instance.new("BodyVelocity")
                            v106.Name = "BodyClip"
                            v106.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                            v106.MaxForce = Vector3.new(100000, 100000, 100000)
                            v106.Velocity = Vector3.new(0, 0, 0)
                        end
                    end
                end
            end
        )
    end
)
spawn(
    function()
        pcall(
            function()
                game:GetService("RunService").Stepped:Connect(
                    function()
                        if
                            (_G.FarmBoss or _G.DarkFull or _G.DoughFull or _G.RipFull or _G.MysticIsland or _G.Miragenpc or
                                _G.TweenMGear)
                         then
                            for v98, v99 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                                if v99:IsA("BasePart") then
                                    v99.CanCollide = false
                                end
                            end
                        end
                    end
                )
            end
        )
    end
)
PosY = 25
Type = 1
spawn(
    function()
        while wait() do
            if (Type == 1) then
                Pos = CFrame.new(0, PosY, -19)
            elseif (Type == 2) then
                Pos = CFrame.new(19, PosY, 0)
            elseif (Type == 3) then
                Pos = CFrame.new(0, PosY, 19)
            elseif (Type == 4) then
                Pos = CFrame.new(-19, PosY, 0)
            end
        end
    end
)
spawn(
    function()
        while wait(0.1) do
            Type = 1
            wait(0.2)
            Type = 2
            wait(0.2)
            Type = 3
            wait(0.2)
            Type = 4
            wait(0.2)
        end
    end
)
local v5 = game.Players.LocalPlayer
function AttackNoCoolDown()
    local v26 = v5.Character
    if not v26 then
        return
    end
    local v27 = nil
    for v47, v48 in ipairs(v26:GetChildren()) do
        if v48:IsA("Tool") then
            v27 = v48
            break
        end
    end
    if not v27 then
        return
    end
    local function v28(v49)
        return v49 and v49:FindFirstChild("Humanoid") and (v49.Humanoid.Health > 0)
    end
    local function v29(v50)
        local v51 = game:GetService("Workspace").Enemies:GetChildren()
        local v52 = {}
        local v53 = v26:GetPivot().Position
        for v56, v57 in ipairs(v51) do
            local v58 = v57:FindFirstChild("HumanoidRootPart")
            if (v58 and v28(v57) and ((v58.Position - v53).Magnitude <= v50)) then
                table.insert(v52, v57)
            end
        end
        return v52
    end
    if v27:FindFirstChild("LeftClickRemote") then
        local v59 = 1
        local v60 = v29(60)
        for v71, v72 in ipairs(v60) do
            local v73 = (v72.HumanoidRootPart.Position - v26:GetPivot().Position).Unit
            pcall(
                function()
                    v27.LeftClickRemote:FireServer(v73, v59)
                end
            )
            v59 = v59 + 1
            if (v59 > 1000000000) then
                v59 = 1
            end
        end
    else
        local v61 = {}
        local v62 = game:GetService("Workspace").Enemies:GetChildren()
        local v63 = v26:GetPivot().Position
        local v64 = nil
        for v74, v75 in ipairs(v62) do
            if (not v75:GetAttribute("IsBoat") and v28(v75)) then
                local v100 = v75:FindFirstChild("Head")
                if (v100 and ((v63 - v100.Position).Magnitude <= 60)) then
                    table.insert(v61, {v75, v100})
                    v64 = v100
                end
            end
        end
        if not v64 then
            return
        end
        pcall(
            function()
                local v76 = game:GetService("ReplicatedStorage")
                local v77 = v76:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
                local v78 = v76:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
                if (#v61 > 0) then
                    v77:FireServer(1e-9)
                    v78:FireServer(v64, v61)
                else
                    task.wait(1e-9)
                end
            end
        )
    end
end
_G.FastAttack = true
if _G.FastAttack then
    local _ENV = (getgenv or getrenv or getfenv)()
    local function v5(v36, v37)
        local v38, v39 =
            pcall(
            function()
                return v36:WaitForChild(v37)
            end
        )
        if (not v38 or not v39) then
            warn("")
        end
        return v39
    end
    local function v6(v40, ...)
        local v41 = v40
        for v51, v52 in {...} do
            v41 = v41:FindFirstChild(v52) or v5(v41, v52)
            if not v41 then
                break
            end
        end
        return v41
    end
    local v7 = game:GetService("VirtualInputManager")
    local v8 = game:GetService("CollectionService")
    local v9 = game:GetService("ReplicatedStorage")
    local v10 = game:GetService("TeleportService")
    local v11 = game:GetService("RunService")
    local v12 = game:GetService("Players")
    local v13 = v12.LocalPlayer
    if not v13 then
        warn("")
        return
    end
    local v14 = v5(v9, "Remotes")
    if not v14 then
        return
    end
    local v15 = v5(v14, "Validator")
    local v16 = v5(v14, "CommF_")
    local v17 = v5(v14, "CommE")
    local v18 = v5(workspace, "ChestModels")
    local v19 = v5(workspace, "_WorldOrigin")
    local v20 = v5(workspace, "Characters")
    local v21 = v5(workspace, "Enemies")
    local v22 = v5(workspace, "Map")
    local v23 = v5(v19, "EnemySpawns")
    local v24 = v5(v19, "Locations")
    local v25 = v11.RenderStepped
    local v26 = v11.Heartbeat
    local v27 = v11.Stepped
    local v28 = v5(v9, "Modules")
    local v29 = v5(v28, "Net")
    local v30 = sethiddenproperty or function(...)
            return ...
        end
    local v31 = setupvalue or (debug and debug.setupvalue)
    local v32 = getupvalue or (debug and debug.getupvalue)
    local v33 = {AutoClick = true, ClickDelay = 0}
    local v34 = {}
    v34.FastAttack =
        (function()
        if _ENV.rz_FastAttack then
            return _ENV.rz_FastAttack
        end
        local v42 = {Distance = 100, attackMobs = true, attackPlayers = true, Equipped = nil}
        local v43 = v5(v29, "RE/RegisterAttack")
        local v44 = v5(v29, "RE/RegisterHit")
        local function v45(v53)
            return v53 and v53:FindFirstChild("Humanoid") and (v53.Humanoid.Health > 0)
        end
        local function v46(v54, v55)
            local v56 = nil
            for v68, v69 in v55:GetChildren() do
                local v70 = v69:FindFirstChild("Head")
                if (v70 and v45(v69) and (v13:DistanceFromCharacter(v70.Position) < v42.Distance)) then
                    if (v69 ~= v13.Character) then
                        table.insert(v54, {v69, v70})
                        v56 = v70
                    end
                end
            end
            return v56
        end
        v42.Attack = function(v57, v58, v59)
            if (not v58 or (#v59 == 0)) then
                return
            end
            v43:FireServer(v33.ClickDelay or 0)
            v44:FireServer(v58, v59)
        end
        v42.AttackNearest = function(v60)
            local v61 = {}
            local v62 = v46(v61, v21)
            local v63 = v46(v61, v20)
            local v64 = v13.Character
            if not v64 then
                return
            end
            local v65 = v64:FindFirstChildOfClass("Tool")
            if (v65 and v65:FindFirstChild("LeftClickRemote")) then
                for v73, v74 in ipairs(v61) do
                    local v75 = v74[1]
                    local v76 = (v75.HumanoidRootPart.Position - v64:GetPivot().Position).Unit
                    pcall(
                        function()
                            v65.LeftClickRemote:FireServer(v76, 1)
                        end
                    )
                end
            elseif (#v61 > 0) then
                v60:Attack(v62 or v63, v61)
            else
                task.wait(0)
            end
        end
        v42.BladeHits = function(v66)
            local v67 = v45(v13.Character) and v13.Character:FindFirstChildOfClass("Tool")
            if (v67 and (v67.ToolTip ~= "Gun")) then
                v66:AttackNearest()
            else
                task.wait(0)
            end
        end
        task.spawn(
            function()
                while task.wait(v33.ClickDelay) do
                    if v33.AutoClick then
                        v42:BladeHits()
                    end
                end
            end
        )
        _ENV.rz_FastAttack = v42
        return v42
    end)()
end
function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end
function EquipWeapon(v30)
    if not Nill then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(v30) then
            Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(v30)
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
        end
    end
end
_G.SelectWeapon = "Melee"
task.spawn(
    function()
        while wait() do
            pcall(
                function()
                    if (_G.SelectWeapon == "Melee") then
                        for v101, v102 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if (v102.ToolTip == "Melee") then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v102.Name)) then
                                    _G.SelectWeapon = v102.Name
                                end
                            end
                        end
                    elseif (_G.SelectWeapon == "Sword") then
                        for v116, v117 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if (v117.ToolTip == "Sword") then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v117.Name)) then
                                    _G.SelectWeapon = v117.Name
                                end
                            end
                        end
                    elseif (_G.SelectWeapon == "Gun") then
                        for v140, v141 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if (v141.ToolTip == "Gun") then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v141.Name)) then
                                    _G.SelectWeapon = v141.Name
                                end
                            end
                        end
                    elseif (_G.SelectWeapon == "Fruit") then
                        for v143, v144 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if (v144.ToolTip == "Blox Fruit") then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v144.Name)) then
                                    _G.SelectWeapon = v144.Name
                                end
                            end
                        end
                    end
                end
            )
        end
    end
)
-- Hàm gọi Boss tương ứng
function SummonBoss(name)
    local urls = {
        ["Darkbeard"] = "https://raw.githubusercontent.com/moonnosd2344/folder/refs/heads/main/darkbead",
        ["rip_indra True Form"] = "https://raw.githubusercontent.com/moonnosd2344/folder/refs/heads/main/rip",
        ["Dough King"] = "https://raw.githubusercontent.com/moonnosd2344/folder/refs/heads/main/dough",
        ["Tyrant of the Skies"] = "https://pastefy.app/98pinmw8/raw"
    }
    if urls[name] then
        loadstring(game:HttpGet(urls[name]))()
    end
end

-- Farm Boss chung
task.spawn(function()
    while task.wait() do
        if _G.FarmBoss and getgenv().Boss ~= nil and not BypassTP then
            pcall(function()
                local BossName = getgenv().Boss

                pcall(function()
                    BossStatus.Text = "Status: Auto Farm " .. tostring(BossName) .. "]"
                    BossLabel.Text = "Boss: " .. tostring(BossName)
                end)

                local enemies = game:GetService("Workspace").Enemies
                local replicatedBoss = game:GetService("ReplicatedStorage"):FindFirstChild(BossName)

                -- Boss đang spawn
                if enemies:FindFirstChild(BossName) then
                    for _, enemy in pairs(enemies:GetChildren()) do
                        if enemy.Name == BossName and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                enemy.HumanoidRootPart.CanCollide = false
                                enemy.Humanoid.WalkSpeed = 0
                                topos(enemy.HumanoidRootPart.CFrame * Pos)
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.FarmBoss or not enemy.Parent or enemy.Humanoid.Health <= 0
                        end
                    end
                -- Boss ở ReplicatedStorage
                elseif replicatedBoss and replicatedBoss:FindFirstChild("HumanoidRootPart") then
                    topos(replicatedBoss.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                -- Boss chưa spawn → summon
                game.StarterGui:SetCore("SendNotification", {
                   Title = "Zush Hub",
                   Text = "Wait Hop Server...",
                   Icon = "rbxassetid://108644766679780",
                   Duration = 3
                })
                else
                    task.wait(3)
                    SummonBoss(BossName)
                end
            end)

getgenv().Attack = true

function Click(delayTime)
    while task.wait(delayTime) do
        if getgenv().Attack then
            print("")
        else
            print("")
            break
        end
    end
end

local url = "https://raw.githubusercontent.com/diemquy/Autochatmizuhara/refs/heads/main/fasthuy%20.txt"
local success, scriptContent = pcall(function()
    return game:HttpGet(url)
end)

if success then
    local runScript = loadstring(scriptContent)
    if runScript then
        runScript()
        print("")
    else
        warn("")
    end
else
    warn("")
end

task.spawn(function()
    while task.wait() do
        if getgenv().Attack then
            Click(0.000000000000000000000000000000004)
        else
            print("")
        end
    end
end)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

task.spawn(function()
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "🎉 <b><i>Chào mừng đến với Zush Hub của chúng tôi</i></b>",
        Color = Color3.fromRGB(255, 128, 0),
        Font = Enum.Font.SourceSansBold,
        FontSize = Enum.FontSize.Size24
    })
    wait(1)
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "💎 <b>Script Premium giá rẻ chỉ 50k</b>",
        Color = Color3.fromRGB(255, 128, 0),
        Font = Enum.Font.SourceSansBold,
        FontSize = Enum.FontSize.Size24
    })
    wait(1)
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "🐥 <i>Hỗ trợ mọi vấn đề tại Discord: Zush Hub</i>",
        Color = Color3.fromRGB(255, 128, 0),
        Font = Enum.Font.SourceSansBold,
        FontSize = Enum.FontSize.Size24
    })
end)

task.spawn(function()
    while true do
        if getgenv().Config["Chat"] ~= "" then
            
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                getgenv().Config["Chat"], 
                "All"
            )
        end
        
        wait(getgenv().Config["Chat Delay"])
    end
end)

        end
    end
end)

_G.AutoKen = true;
spawn(function(Value)
    _G.AutoKen=Value
    if Value then
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
    else
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", false) 
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoKen then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
            end
        end)
    end
end)

getgenv().Set = true;
spawn(function(Value)
    getgenv().Set = Value
    if Value ~= lastSetState then
        lastSetState = Value
        if Value then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
            end)
        end
    end
end)
