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
loadstring(game:HttpGet("https://raw.githubusercontent.com/daucobonhi/Ui-Redz-V2/refs/heads/main/UiREDzV2.lua"))()
local v0 =
    MakeWindow(
    {
        Hub = {Title = "Teddy Hub [Pro]", Animation = "Welcome Teddy Hub"},
        Key = {
            KeySystem = false,
            Title = "Get Key",
            Description = "Update 14/03/2025",
            KeyLink = "https://link4m.com/XUiaBFo",
            Keys = {"teddyskibidi2025"},
            Notifi = {
                Notifications = true,
                CorrectKey = "Đang Chạy Script....",
                Incorrectkey = "Key sai đụ má mày",
                CopyKeyLink = "Sao Chép Link"
            }
        }
    }
)
MinimizeButton(
    {
        Image = "http://www.roblox.com/asset/?id=136687555060367",
        Size = {45, 45},
        Color = Color3.fromRGB(10, 10, 10),
        Corner = true,
        Stroke = false,
        StrokeColor = Color3.fromRGB(255, 0, 0)
    }
)
local v1 = MakeTab({Name = "Tab Info"})
local v2 = MakeTab({Name = "Tab Hop"})
local v3 = MakeTab({Name = "Tab Mirage"})
function CheckNearestTeleporter(v5)
    local v6 = game.Players.LocalPlayer.Data.Level.Value
    local v7 = v5.Position
    local v8 = math.huge
    local v9 = math.huge
    local v10 = game.PlaceId
    local v11, v12, v13
    if (v10 == 2753915549) then
        v11 = true
    elseif (v10 == 4442272183) then
        v12 = true
    elseif (v10 == 7449423635) then
        v13 = true
    end
    local v14 = {}
    if v13 then
        v14 = {
            Mansion = Vector3.new(-12471, 374, -7551),
            Hydra = Vector3.new(5659, 1013, -341),
            ["Caslte On The Sea"] = Vector3.new(-5092, 315, -3130),
            ["Floating Turtle"] = Vector3.new(-12001, 332, -8861),
            ["Beautiful Pirate"] = Vector3.new(5319, 23, -93),
            ["Temple Of Time"] = Vector3.new(28286, 14897, 103)
        }
    elseif v12 then
        v14 = {
            ["Flamingo Mansion"] = Vector3.new(-317, 331, 597),
            ["Flamingo Room"] = Vector3.new(2283, 15, 867),
            ["Cursed Ship"] = Vector3.new(923, 125, 32853),
            ["Zombie Island"] = Vector3.new(-6509, 83, -133)
        }
    elseif v11 then
        v14 = {
            ["Sky Island 1"] = Vector3.new(-4652, 873, -1754),
            ["Sky Island 2"] = Vector3.new(-7895, 5547, -380),
            ["Under Water Island"] = Vector3.new(61164, 5, 1820),
            ["Under Water Island Entrace"] = Vector3.new(3865, 5, -1926)
        }
    end
    local v15 = {}
    for v40, v41 in pairs(v14) do
        v15[v40] = (v41 - v7).Magnitude
    end
    for v44, v45 in pairs(v15) do
        if (v45 < v8) then
            v8 = v45
            v9 = v45
        end
    end
    local v16
    for v46, v47 in pairs(v15) do
        if (v47 <= v8) then
            v16 = v14[v46]
        end
    end
    local v17 = (v7 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if (v9 <= v17) then
        return v16
    end
end
function requestEntrance(v18)
    local v19 = {"requestEntrance", v18}
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(v19))
    local v20 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local v21 = game.Players.LocalPlayer.Character.HumanoidRootPart
    v21.CFrame = CFrame.new(v20.X, v20.Y + 50, v20.Z)
    task.wait(0.5)
end
function topos(v23)
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
                DefualtY = v23.Y
                TargetY = v23.Y
                targetCFrameWithDefualtY = CFrame.new(v23.X, DefualtY, v23.Z)
                targetPos = v23.Position
                oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                Distance =
                    (targetPos -
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
                if (Distance <= 300) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v23
                end
                local v71 = CheckNearestTeleporter(v23)
                if v71 then
                    pcall(
                        function()
                            tween:Cancel()
                        end
                    )
                    requestEntrance(v71)
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
                    local v92 = {}
                    local v93 = game:GetService("TweenService")
                    local v94 =
                        TweenInfo.new(
                        (targetPos -
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
                            TweenSpeed,
                        Enum.EasingStyle.Linear
                    )
                    tween =
                        v93:Create(
                        game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                        v94,
                        {CFrame = targetCFrameWithDefualtY}
                    )
                    tween:Play()
                    v92.Stop = function(v107)
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
                    local v96 = {}
                    local v97 = game:GetService("TweenService")
                    local v98 =
                        TweenInfo.new(
                        (targetPos -
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
                            TweenSpeed,
                        Enum.EasingStyle.Linear
                    )
                    tween =
                        v97:Create(
                        game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                        v98,
                        {CFrame = v23}
                    )
                    tween:Play()
                    v96.Stop = function(v108)
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
function StopTween(v24)
    if not v24 then
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
                            local v109 = Instance.new("BodyVelocity")
                            v109.Name = "BodyClip"
                            v109.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                            v109.MaxForce = Vector3.new(100000, 100000, 100000)
                            v109.Velocity = Vector3.new(0, 0, 0)
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
                            for v101, v102 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                                if v102:IsA("BasePart") then
                                    v102.CanCollide = false
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
local v4 = game.Players.LocalPlayer
function AttackNoCoolDown()
    local v25 = v4.Character
    if not v25 then
        return
    end
    local v26 = nil
    for v48, v49 in ipairs(v25:GetChildren()) do
        if v49:IsA("Tool") then
            v26 = v49
            break
        end
    end
    if not v26 then
        return
    end
    local function v27(v50)
        return v50 and v50:FindFirstChild("Humanoid") and (v50.Humanoid.Health > 0)
    end
    local function v28(v51)
        local v52 = game:GetService("Workspace").Enemies:GetChildren()
        local v53 = {}
        local v54 = v25:GetPivot().Position
        for v57, v58 in ipairs(v52) do
            local v59 = v58:FindFirstChild("HumanoidRootPart")
            if (v59 and v27(v58) and ((v59.Position - v54).Magnitude <= v51)) then
                table.insert(v53, v58)
            end
        end
        return v53
    end
    if v26:FindFirstChild("LeftClickRemote") then
        local v60 = 1
        local v61 = v28(60)
        for v72, v73 in ipairs(v61) do
            local v74 = (v73.HumanoidRootPart.Position - v25:GetPivot().Position).Unit
            pcall(
                function()
                    v26.LeftClickRemote:FireServer(v74, v60)
                end
            )
            v60 = v60 + 1
            if (v60 > 1000000000) then
                v60 = 1
            end
        end
    else
        local v62 = {}
        local v63 = game:GetService("Workspace").Enemies:GetChildren()
        local v64 = v25:GetPivot().Position
        local v65 = nil
        for v75, v76 in ipairs(v63) do
            if (not v76:GetAttribute("IsBoat") and v27(v76)) then
                local v103 = v76:FindFirstChild("Head")
                if (v103 and ((v64 - v103.Position).Magnitude <= 60)) then
                    table.insert(v62, {v76, v103})
                    v65 = v103
                end
            end
        end
        if not v65 then
            return
        end
        pcall(
            function()
                local v77 = game:GetService("ReplicatedStorage")
                local v78 = v77:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
                local v79 = v77:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
                if (#v62 > 0) then
                    v78:FireServer(1e-9)
                    v79:FireServer(v65, v62)
                else
                    task.wait(1e-9)
                end
            end
        )
    end
end
_G.FastAttack = true
spawn(
    function()
        while wait(0.1) do
            if _G.FastAttack then
                pcall(
                    function()
                        repeat
                            task.wait(0.1)
                            AttackNoCoolDown()
                        until not _G.FastAttack
                    end
                )
            end
        end
    end
)
function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end
function EquipWeapon(v29)
    if not Nill then
        if game.Players.LocalPlayer.Backpack:FindFirstChild(v29) then
            Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(v29)
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
                        for v104, v105 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if (v105.ToolTip == "Melee") then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v105.Name)) then
                                    _G.SelectWeapon = v105.Name
                                end
                            end
                        end
                    elseif (_G.SelectWeapon == "Sword") then
                        for v122, v123 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if (v123.ToolTip == "Sword") then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v123.Name)) then
                                    _G.SelectWeapon = v123.Name
                                end
                            end
                        end
                    elseif (_G.SelectWeapon == "Gun") then
                        for v152, v153 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if (v153.ToolTip == "Gun") then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v153.Name)) then
                                    _G.SelectWeapon = v153.Name
                                end
                            end
                        end
                    elseif (_G.SelectWeapon == "Fruit") then
                        for v161, v162 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if (v162.ToolTip == "Blox Fruit") then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v162.Name)) then
                                    _G.SelectWeapon = v162.Name
                                end
                            end
                        end
                    end
                end
            )
        end
    end
)
Di = AddSection(v1, {"Discord"})
Dis = AddParagraph(v1, {"Join Discord Update Script", ""})
AddButton(
    v1,
    {Name = "Discord", Callback = function()
            setclipboard("https://discord.gg/rSWEGGrHZP")
        end}
)
AddButton(
    v1,
    {Name = "Dịch chuyển sea 1", Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
        end}
)
AddButton(
    v1,
    {Name = "Dịch chuyển sea 2", Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        end}
)
AddButton(
    v1,
    {Name = "Dịch chuyển sea 3", Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
        end}
)
SF = AddSection(v2, {"Farm Boss & Hop"})
AddButton(
    v2,
    {Name = "Auto Hop Saishi", Callback = function()
         wait(1)   loadstring(game:HttpGet("https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Saisi.txt"))()
        end}
)
AddButton(
    v2,
    {Name = "Auto Hop Shizu", Callback = function()
        wait(1)  loadstring(game:HttpGet("https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Shizu.txt"))()
        end}
)
AddButton(
    v2,
    {Name = "Auto Hop Oroshi", Callback = function()
         wait(1)   loadstring(game:HttpGet("https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Oroshi.txt"))()
        end}
)
AddButton(
    v2,
    {Name = "Auto Hop Blackbeard", Callback = function()
         wait(1)   loadstring(game:HttpGet("https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Dark.txt"))()
        end}
)
AddButton(
    v2,
    {Name = "Auto Hop Rip Indra", Callback = function()
        wait(1)    loadstring(game:HttpGet("https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Rip.txt"))()
        end}
)
AddButton(
    v2,
    {Name = "Auto Hop Dough King", Callback = function()
      wait(1)    loadstring(game:HttpGet("https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Dough.txt"))()
        end}
)
AddButton(
    v2,
    {Name = "Auto Hop Soul Reaper", Callback = function()
       wait(1)    loadstring(game:HttpGet("https://raw.githubusercontent.com/shinichi-dz/shinhop/refs/heads/main/soulreaper.lua%20(1).txt"))()
        end}
)
SelectWeapon =
    AddDropdown(
    v2,
    {
        Name = "Select Boss",
        Options = {"rip_indra True Form", "Dough King", "Darkbeard", "Soul Reaper [wait fix]"},
        Default = "false",
        Callback = function(v30)
            _G.SelectBoss = v30
        end
    }
)
Toggle =
    AddToggle(
    v2,
    {Name = "Farm Boss Select", Default = false, Callback = function(v31)
            _G.FarmBoss = v31
            StopTween(_G.FarmBoss)
        end}
)
spawn(
    function()
        while wait() do
            if _G.FarmBoss then
                pcall(
                    function()
                        if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                            for v124, v125 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v125.Name == _G.SelectBoss) then
                                    if
                                        (v125:FindFirstChild("Humanoid") and v125:FindFirstChild("HumanoidRootPart") and
                                            (v125.Humanoid.Health > 0))
                                     then
                                        repeat
                                            task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v125.HumanoidRootPart.CanCollide = false
                                            v125.Humanoid.WalkSpeed = 0
                                            topos(v125.HumanoidRootPart.CFrame * Pos)
                                            sethiddenproperty(
                                                game:GetService("Players").LocalPlayer,
                                                "SimulationRadius",
                                                math.huge
                                            )
                                        until not _G.FarmBoss or not v125.Parent or (v125.Humanoid.Health <= 0)
                                    end
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                            topos(
                                game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame *
                                    CFrame.new(5, 10, 7)
                            )
                        end
                    end
                )
            end
        end
    end
)
AF = AddSection(v2, {"Farm Boss Fully"})
Toggle =
    AddToggle(
    v2,
    {Name = "Auto Darkbeard And Hop", Default = false, Callback = function(v32)
            _G.DarkFull = v32
            StopTween(_G.DarkFull)
        end}
)
spawn(
    function()
        while wait() do
            if (_G.DarkFull and not BypassTP) then
                pcall(
                    function()
                        local v83 = game:GetService("Workspace").Enemies
                        if v83:FindFirstChild("Darkbeard") then
                            for v126, v127 in pairs(v83:GetChildren()) do
                                if
                                    ((v127.Name == "Darkbeard") and v127:FindFirstChild("Humanoid") and
                                        v127:FindFirstChild("HumanoidRootPart") and
                                        (v127.Humanoid.Health > 0))
                                 then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v127.HumanoidRootPart.CanCollide = false
                                        v127.Humanoid.WalkSpeed = 0
                                        topos(v127.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(
                                            game:GetService("Players").LocalPlayer,
                                            "SimulationRadius",
                                            math.huge
                                        )
                                    until not _G.DarkFull or not v127.Parent or (v127.Humanoid.Health <= 0)
                                end
                            end
                        else
                            local v115 = game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard")
                            if v115 then
                                topos(v115.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                            else
                                wait(3)
                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Dark.txt"
                                    )
                                )()
                            end
                        end
                    end
                )
            end
        end
    end
)
Toggle =
    AddToggle(
    v2,
    {Name = "Auto Rip Indra And Hop", Default = false, Callback = function(v33)
            _G.RipFull = v33
            StopTween(_G.RipFull)
        end}
)
spawn(
    function()
        while wait() do
            if (_G.RipFull and not BypassTP) then
                pcall(
                    function()
                        local v84 = game:GetService("Workspace").Enemies
                        if v84:FindFirstChild("rip_indra True Form") then
                            for v128, v129 in pairs(v84:GetChildren()) do
                                if
                                    ((v129.Name == "rip_indra True Form") and v129:FindFirstChild("Humanoid") and
                                        v129:FindFirstChild("HumanoidRootPart") and
                                        (v129.Humanoid.Health > 0))
                                 then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v129.HumanoidRootPart.CanCollide = false
                                        v129.Humanoid.WalkSpeed = 0
                                        topos(v129.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(
                                            game:GetService("Players").LocalPlayer,
                                            "SimulationRadius",
                                            math.huge
                                        )
                                    until not _G.RipFull or not v129.Parent or (v129.Humanoid.Health <= 0)
                                end
                            end
                        else
                            local v116 = game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form")
                            if v116 then
                                topos(v116.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                            else
                                wait(3)
                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Rip.txt"
                                    )
                                )()
                            end
                        end
                    end
                )
            end
        end
    end
)
Toggle =
    AddToggle(
    v2,
    {Name = "Auto Dough King And Hop", Default = false, Callback = function(v34)
            _G.DoughFull = v34
            StopTween(_G.DoughFull)
        end}
)
spawn(
    function()
        while wait() do
            if (_G.DoughFull and not BypassTP) then
                pcall(
                    function()
                        local v85 = game:GetService("Workspace").Enemies
                        if v85:FindFirstChild("Dough King") then
                            for v130, v131 in pairs(v85:GetChildren()) do
                                if
                                    ((v131.Name == "Dough King") and v131:FindFirstChild("Humanoid") and
                                        v131:FindFirstChild("HumanoidRootPart") and
                                        (v131.Humanoid.Health > 0))
                                 then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v131.HumanoidRootPart.CanCollide = false
                                        v131.Humanoid.WalkSpeed = 0
                                        topos(v131.HumanoidRootPart.CFrame * Pos)
                                        sethiddenproperty(
                                            game:GetService("Players").LocalPlayer,
                                            "SimulationRadius",
                                            math.huge
                                        )
                                    until not _G.DoughFull or not v131.Parent or (v131.Humanoid.Health <= 0)
                                end
                            end
                        else
                            local v117 = game:GetService("ReplicatedStorage"):FindFirstChild("Dough King")
                            if v117 then
                                topos(v117.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                            else
                                wait(3)
                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Dough.txt"
                                    )
                                )()
                            end
                        end
                    end
                )
            end
        end
    end
)
Toggle = 
    AddToggle(
    v2,
    {Name = "Auto Buy Sword Legendary", Default = false, Callback = function(state)
        _G.BuyLegendarySword = state
        if not state then
            StopTween(_G.BuyLegendarySword)
        end
    end}
)
-- Spawn thread to auto-buy Legendary Sword
spawn(function() 
    while wait() do 
        if _G.BuyLegendarySword then 
            pcall(function()
                local v4={[1]="LegendarySwordDealer",[2]="1"};game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v4))
                local v4={[1]="LegendarySwordDealer",[2]="2"};game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v4))
                local v4={[1]="LegendarySwordDealer",[2]="3"};game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v4))
                
                -- Hop server after buying sword in World2
                if (_G.BuyLegendarySword_Hop and _G.BuyLegendarySword and World2) then
                    wait(10)
                    Hop() -- function to hop server
                end 
            end)
        end 
    end 
end)
SF = AddSection(v3, {"Hop Server"})
AddButton(
    v3,
    {Name = "Auto Hop Full Moon", Callback = function()
         wait(1)   loadstring(game:HttpGet("https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/FullMon.txt"))()
        end}
)
AddButton(
    v3,
    {Name = "Auto Hop Near Full Moon", Callback = function()
         wait(1)   loadstring(game:HttpGet("https://raw.githubusercontent.com/shinichi-dz/shinhop/refs/heads/main/near-fullmoon.lua%20(1).txt"))()
        end}
)
AddButton(
    v3,
    {Name = "Auto Hop Mirage", Callback = function()
         wait(1)   loadstring(game:HttpGet("https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Mirage.txt"))()
        end}
)
SF = AddSection(v3, {"Pull Lever"})
AddButton(
    v3,
    {Name = "Remove Fog", Callback = function()
            game:GetService("Lighting").LightingLayers:Destroy()
            game:GetService("Lighting").Sky:Destroy()
        end}
)
Toggle =
    AddToggle(
    v3,
    {
        Name = "Esp Mirage",
        Default = false,
        Callback = function(v35)
            MirageIslandESP = v35
            if MirageIslandESP then
                task.spawn(
                    function()
                        while MirageIslandESP do
                            UpdateIslandMirageESP()
                            task.wait(1)
                        end
                    end
                )
            else
                for v80, v81 in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                    if v81:FindFirstChild("NameEsp") then
                        v81:FindFirstChild("NameEsp"):Destroy()
                    end
                end
            end
        end
    }
)
function UpdateIslandMirageESP()
    for v55, v56 in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(
            function()
                if (v56.Name == "Mirage Island") then
                    if MirageIslandESP then
                        if not v56:FindFirstChild("NameEsp") then
                            local v134 = Instance.new("BillboardGui", v56)
                            v134.Name = "NameEsp"
                            v134.ExtentsOffset = Vector3.new(0, 1, 0)
                            v134.Size = UDim2.new(1, 200, 1, 30)
                            v134.Adornee = v56
                            v134.AlwaysOnTop = true
                            local v140 = Instance.new("TextLabel", v134)
                            v140.Font = Enum.Font.Code
                            v140.TextSize = 14
                            v140.TextWrapped = true
                            v140.Size = UDim2.new(1, 0, 1, 0)
                            v140.TextYAlignment = Enum.TextYAlignment.Top
                            v140.BackgroundTransparency = 1
                            v140.TextStrokeTransparency = 0.5
                            v140.TextColor3 = Color3.fromRGB(255, 255, 255)
                        end
                        local v118 =
                            math.floor((game.Players.LocalPlayer.Character.Head.Position - v56.Position).Magnitude)
                        v56["NameEsp"].TextLabel.Text = v56.Name .. "\n" .. v118 .. " M"
                    elseif v56:FindFirstChild("NameEsp") then
                        v56:FindFirstChild("NameEsp"):Destroy()
                    end
                end
            end
        )
    end
end
Toggle =
    AddToggle(
    v3,
    {Name = "Teleport Mirage Island", Default = false, Callback = function(v36)
            _G.MysticIsland = v36
            StopTween(_G.MysticIsland)
        end}
)
spawn(
    function()
        pcall(
            function()
                while wait() do
                    if _G.MysticIsland then
                        local v86 = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                        if v86 then
                            local v120 = v86.WorldPivot.Position
                            topos(CFrame.new(v120.X, 500, v120.Z))
                        end
                    end
                end
            end
        )
    end
)
Toggle =
    AddToggle(
    v3,
    {Name = "Teleport Advanced Fruit Dealer", Default = false, Callback = function(v37)
            _G.Miragenpc = v37
            StopTween(_G.Miragenpc)
        end}
)
spawn(
    function()
        while wait() do
            if _G.Miragenpc then
                local v82 = game.ReplicatedStorage.NPCs:FindFirstChild("Advanced Fruit Dealer")
                if (v82 and v82:IsA("Model")) then
                    local v106 = v82.PrimaryPart and v82.PrimaryPart.Position
                    if v106 then
                        topos(CFrame.new(v106))
                    end
                end
            end
        end
    end
)
Toggle =
    AddToggle(
    v3,
    {Name = "Auto Lock Moon", Default = false, Callback = function(v38)
            _G.LockCamToMoon = v38
        end}
)
spawn(
    function()
        while wait() do
            pcall(
                function()
                    if _G.LockCamToMoon then
                        wait(0.1)
                        local v87 = game.Lighting:GetMoonDirection()
                        local v88 = game.Workspace.CurrentCamera.CFrame.p + (v87 * 100)
                        game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, v88)
                    end
                end
            )
        end
    end
)
Toggle =
    AddToggle(
    v3,
    {Name = "Tween Gear", Default = false, Callback = function(v39)
            _G.TweenMGear = v39
            StopTween(_G.TweenMGear)
        end}
)
spawn(
    function()
        pcall(
            function()
                while wait() do
                    if _G.TweenMGear then
                        if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                            for v132, v133 in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
                                if v133:IsA("MeshPart") then
                                    if (v133.Material == Enum.Material.Neon) then
                                        topos(v133.CFrame)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        )
    end
)
Toggle =
    AddToggle(
    v3,
    {Name = "Bay đến đền thờ", Default = false, Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        Tween2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
        end}
)
Toggle =
    AddToggle(
    v3,
    {Name = "Gạt Cần [Beta]", Default = false, Callback = function(value)
            AutoGatCan = value 
        end}
)
function getBlueGear()
    if game.workspace.Map:FindFirstChild("MysticIsland") then
        for r, v in pairs(game.workspace.Map.MysticIsland:GetChildren()) do
            if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then
                return v
            end
        end
    end
end
spawn(function()
    while wait() do
        if AutoGatCan then
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
                Noti('Notication',"Đã Gạt Cần Hoặc Đã Gạt Cần Thành Công",3)
                wait(3)
            elseif not GetItem("Mirror Fractal") then
                Noti('Notication',"Không Tìm Thấy Mảnh Gương",3)
                wait(3)
            elseif not GetItem("Valkyrie Helm") then
                Noti('Notication',"Không Tìm Thấy Mũ",3)
                wait(3)
            else
                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 1 then
                    Noti("Script Status", "Begin", 10)
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
                elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 2 then
                    Noti("Script Status", "Conitnue Time 1", 10)
                    TweenTempleLegit()
                elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 3 then
                    Noti("Script Status", "Continue Time 2", 10)
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
                elseif game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    local HighestPointRealCFrame = Function2().CFrame
                    if HighestPointRealCFrame and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - HighestPointRealCFrame.Position).Magnitude > 10 then
                        Tween2(HighestPointRealCFrame * CFrame.new(0, 211.88, 0))
                    else
                        BlueGear = getBlueGear()
                        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
                            LockFullMoon = false
                        elseif BlueGear and not BlueGear.CanCollide and BlueGear.Transparency ~= 1 then
                            repeat
                                wait()
                                TweentoBlueGear()
                            until not getBlueGear() or getBlueGear().Transparency == 1
                            LockFullMoon = false
                            Noti('Notication',"Đã Gạt Cần",3)
                        else
                            LockFullMoon = true
                            game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                            task.wait()
                            game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                            task.wait(1.5)
                        end
                    end
                else
                    Noti('Notication',"Không Thể Tìm Thấy Đảo Bí Ẩn",3)
                    wait(3)
                end
            end
        end
    end
end)

