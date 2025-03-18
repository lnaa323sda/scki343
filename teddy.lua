if getgenv().Team == "Pirates" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
elseif getgenv().Team == "Marines" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
end
wait(2)
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
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

-- Tạo cửa sổ chính
local Window = redzlib:MakeWindow({
  Title = "Zush Hub [Free]",
  SubTitle = "by stuckez999",
  SaveFolder = "testando | redz lib v5.lua"
})

-- Thêm nút minimize
Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://80084619134628", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

-- Tạo các tab
local Settings = Window:MakeTab({"Info & Setting", "cherry"})
local Tab2 = Window:MakeTab({"Tab Boss", "apple"})
local Tab3 = Window:MakeTab({"Tab Mirage", "batterycharging"})
local Tab4 = Window:MakeTab({"Tab Sword", "bitcoin"})
local Tab5 = Window:MakeTab({"Tab Farm", "cake"})
local Tab6 = Window:MakeTab({"Tab Misc", "cookie"})
local Tab7 = Window:MakeTab({"Tab Draco", ""})
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
spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/diemquy/Autochatmizuhara/refs/heads/main/fasthuy%20.txt"))()
    while task.wait() do
        Click(0.000000000000000000000000000000004)
    end
end)
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
-- Thêm phần Settings vào tab
Settings:AddDiscordInvite({
    Name = "Zush Hub",
    Description = "Join server",
    Logo = "rbxassetid://102829205572656",
    Invite = "Link discord invite",
    Callback = function()
        setclipboard("https://discord.gg/ADZ7H2rwk7")
        print("Discord invite link copied to clipboard!")
    end
})
local Section = Settings:AddSection({"Cập nhật"})
local Paragraph = Settings:AddParagraph({"Thông báo", "Tất cả các script tôi sẽ update liên tục\nNên là ít cũng phải 3 lít nhiều thì 3 củ\nThông tin bank : MBBANK - 0765520260 - NGUYEN MINH DUC"})

game.StarterGui:SetCore(
            "SendNotification",
            {
                Title = "Zush Hub",
                Text = "Cảm ơn pro đã tin tưởng và sử dụng",
                Duration = 4
            }
        )
game.StarterGui:SetCore(
            "SendNotification",
            {
                Title = "Zush Hub",
                Text = "Lỗi gì thì báo tại kênh report bug",
                Duration = 5
            }
        )
local Section = Settings:AddSection({"Tiện ích"})
Settings:AddButton({
    Name = "Fix fps + treo mượt",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/avt-UILITE.lua"))()  -- Link Discord invite của bạn
    end}
)
Settings:AddButton({
    Name = "Dịch chuyển sea 1",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")  -- Link Discord invite của bạn
    end}
)
Settings:AddButton({
    Name = "Dịch chuyển sea 2",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")  -- Link Discord invite của bạn
    end}
)
Settings:AddButton({
    Name = "Dịch chuyển sea 3",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")  -- Link Discord invite của bạn
    end}
)
local Section = Tab2:AddSection({"Hop"})
local Paragraph = Tab2:AddParagraph({"Thông báo", "Nếu hop nào bị lỗi thì vô discord vào kênh report bug để admin biết"})
Tab2:AddButton({
    Name = "Hop Boss Blackbeard",
    Callback = function()
        wait(1) loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/dark"))()  -- Link Discord invite của bạn
        game.StarterGui:SetCore(
            "SendNotification",
            {
                Title = "Zush Hub",
                Text = "đợi xíu nào chàng trai",
                Duration = 3
            }
        )
    end
})
Tab2:AddButton({
    Name = "Hop Boss Rip Indra",
    Callback = function()
        wait(1) loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/dark"))()  -- Link Discord invite của bạn
        game.StarterGui:SetCore(
            "SendNotification",
            {
                Title = "Zush Hub",
                Text = "đợi xíu nào chàng trai",
                Duration = 3
            }
        )
    end
})
Tab2:AddButton({
    Name = "Hop Boss Dough King",
    Callback = function()
        wait(1) loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/dark"))()  -- Link Discord invite của bạn
        game.StarterGui:SetCore(
            "SendNotification",
            {
                Title = "Zush Hub",
                Text = "đợi xíu nào chàng trai",
                Duration = 3
            }
        )
    end
})
Tab2:AddButton({
    Name = "Hop Đảo Núi Lửa (beta)",
    Callback = function()
        wait(1) loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/nuilua"))()  -- Link Discord invite của bạn
        game.StarterGui:SetCore(
            "SendNotification",
            {
                Title = "Zush Hub",
                Text = "đợi xíu nào chàng trai",
                Duration = 3
            }
        )
    end
}) 
SelectWeapon = Tab2:AddDropdown({
    Name = "Select Boss",
    Options = {"rip_indra True Form", "Dough King", "Darkbeard"}, -- Danh sách boss
    Default = "con cặc chọn đi",
    Callback = function(v31)
        _G.SelectBoss = v31
    end
})
Toggle = Tab2:AddToggle({
    Name = "Farm Boss Select",
    Default = false,
    Callback = function(v32)
        _G.FarmBoss = v32
        StopTween(_G.FarmBoss)
    end
})
spawn(
    function()
        while wait() do
            if _G.FarmBoss then
                pcall(
                    function()
                        if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                            for v118, v119 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v119.Name == _G.SelectBoss) then
                                    if
                                        (v119:FindFirstChild("Humanoid") and v119:FindFirstChild("HumanoidRootPart") and
                                            (v119.Humanoid.Health > 0))
                                     then
                                        repeat
                                            task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v119.HumanoidRootPart.CanCollide = false
                                            v119.Humanoid.WalkSpeed = 0
                                            topos(v119.HumanoidRootPart.CFrame * Pos)
                                            sethiddenproperty(
                                                game:GetService("Players").LocalPlayer,
                                                "SimulationRadius",
                                                math.huge
                                            )
                                        until not _G.FarmBoss or not v119.Parent or (v119.Humanoid.Health <= 0)
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
Tab2:AddSection({ "Farm Boss Fully" })
Toggle = Tab2:AddToggle({
    Name = "Auto Darkbeard And Hop",
    Default = false,
    Callback = function(v32)
        _G.DarkFull = v32
        StopTween(_G.DarkFull)
    end
})

task.spawn(function()
    while task.wait() do
        if _G.DarkFull and not BypassTP then
            pcall(function()
                local enemies = game:GetService("Workspace").Enemies
                if enemies:FindFirstChild("Darkbeard") then
                    for _, enemy in pairs(enemies:GetChildren()) do
                        if enemy.Name == "Darkbeard" and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                enemy.HumanoidRootPart.CanCollide = false
                                enemy.Humanoid.WalkSpeed = 0
                                topos(enemy.HumanoidRootPart.CFrame * Pos)
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.DarkFull or not enemy.Parent or enemy.Humanoid.Health <= 0
                        end
                    end
                else
                    local darkbeard = game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard")
                    if darkbeard then
                        topos(darkbeard.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                    else
                        task.wait(3)
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/dark"))()
                    end
                end
            end)
        end
    end
end)
Toggle = Tab2:AddToggle({
    Name = "Auto Rip Indra And Hop",
    Default = false,
    Callback = function(v33)
        _G.RipFull = v33
        StopTween(_G.RipFull)
    end
})

task.spawn(function()
    while task.wait() do
        if _G.RipFull and not BypassTP then
            pcall(function()
                local enemies = game:GetService("Workspace").Enemies
                if enemies:FindFirstChild("rip_indra True Form") then
                    for _, enemy in pairs(enemies:GetChildren()) do
                        if enemy.Name == "rip_indra True Form" and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                enemy.HumanoidRootPart.CanCollide = false
                                enemy.Humanoid.WalkSpeed = 0
                                topos(enemy.HumanoidRootPart.CFrame * Pos)
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.RipFull or not enemy.Parent or enemy.Humanoid.Health <= 0
                        end
                    end
                else
                    local rip_indra = game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form")
                    if rip_indra then
                        topos(rip_indra.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                    else
                        task.wait(3)
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/rip"))()
                    end
                end
            end)
        end
    end
end)
Toggle = Tab2:AddToggle({
    Name = "Auto Dough King And Hop",
    Default = false,
    Callback = function(v34)
        _G.DoughFull = v34
        StopTween(_G.DoughFull)
    end
})

task.spawn(function()
    while task.wait() do
        if _G.DoughFull and not BypassTP then
            pcall(function()
                local enemies = game:GetService("Workspace").Enemies
                if enemies:FindFirstChild("Dough King") then
                    for _, enemy in pairs(enemies:GetChildren()) do
                        if enemy.Name == "Dough King" and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                enemy.HumanoidRootPart.CanCollide = false
                                enemy.Humanoid.WalkSpeed = 0
                                topos(enemy.HumanoidRootPart.CFrame * Pos)
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.DoughFull or not enemy.Parent or enemy.Humanoid.Health <= 0
                        end
                    end
                else
                    local dough_king = game:GetService("ReplicatedStorage"):FindFirstChild("Dough King")
                    if dough_king then
                        topos(dough_king.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                    else
                        task.wait(3)
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/doughking"))()
                    end
                end
            end)
        end
    end
end)
Tab3:AddSection({"Hop Server"})
Tab3:AddButton({Name = "Auto Hop Full Moon", Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/fullmoon"))()
    end
})

Tab3:AddButton({Name = "Auto Hop Mirage", Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/mirage"))()
    end
})

Tab3:AddSection({"Pull Lever"})
Tab3:AddButton({Name = "Remove Fog", Callback = function()
        game:GetService("Lighting").LightingLayers:Destroy()
        game:GetService("Lighting").Sky:Destroy()
    end
})

Tab3:AddToggle({Name = "Esp Mirage", Default = false, Callback = function(v33)
        MirageIslandESP = v33
        if MirageIslandESP then
            task.spawn(function()
                while MirageIslandESP do
                    UpdateIslandMirageESP()
                    task.wait(1)
                end
            end)
        else
            for _, island in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
                if island:FindFirstChild("NameEsp") then
                    island:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end
    end
})

function UpdateIslandMirageESP()
    for _, location in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if (location.Name == "Mirage Island") then
                if MirageIslandESP then
                    if not location:FindFirstChild("NameEsp") then
                        local esp = Instance.new("BillboardGui", location)
                        esp.Name = "NameEsp"
                        esp.ExtentsOffset = Vector3.new(0, 1, 0)
                        esp.Size = UDim2.new(1, 200, 1, 30)
                        esp.Adornee = location
                        esp.AlwaysOnTop = true
                        local text = Instance.new("TextLabel", esp)
                        text.Font = Enum.Font.Code
                        text.TextSize = 14
                        text.TextWrapped = true
                        text.Size = UDim2.new(1, 0, 1, 0)
                        text.TextYAlignment = Enum.TextYAlignment.Top
                        text.BackgroundTransparency = 1
                        text.TextStrokeTransparency = 0.5
                        text.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end
                    local distance = math.floor((game.Players.LocalPlayer.Character.Head.Position - location.Position).Magnitude)
                    location["NameEsp"].TextLabel.Text = location.Name .. "\n" .. distance .. " M"
                elseif location:FindFirstChild("NameEsp") then
                    location:FindFirstChild("NameEsp"):Destroy()
                end
            end
        end)
    end
end

Tab3:AddToggle({Name = "Teleport Mirage Island", Default = false, Callback = function(v34)
        _G.MysticIsland = v34
        StopTween(_G.MysticIsland)
    end
})

spawn(function()
    pcall(function()
        while wait() do
            if _G.MysticIsland then
                local mysticIsland = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                if mysticIsland then
                    local position = mysticIsland.WorldPivot.Position
                    topos(CFrame.new(position.X, 500, position.Z))
                end
            end
        end
    end)
end)

Tab3:AddToggle({Name = "Teleport Advanced Fruit Dealer", Default = false, Callback = function(v35)
        _G.Miragenpc = v35
        StopTween(_G.Miragenpc)
    end
})

spawn(function()
    while wait() do
        if _G.Miragenpc then
            local dealer = game.ReplicatedStorage.NPCs:FindFirstChild("Advanced Fruit Dealer")
            if dealer and dealer:IsA("Model") then
                local dealerPos = dealer.PrimaryPart and dealer.PrimaryPart.Position
                if dealerPos then
                    topos(CFrame.new(dealerPos))
                end
            end
        end
    end
end)

Tab3:AddToggle({Name = "Auto Lock Moon", Default = false, Callback = function(v36)
        _G.LockCamToMoon = v36
    end
})

spawn(function()
    while wait() do
        pcall(function()
            if _G.LockCamToMoon then
                wait(0.1)
                local moonDirection = game.Lighting:GetMoonDirection()
                local target = game.Workspace.CurrentCamera.CFrame.p + (moonDirection * 100)
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, target)
            end
        end)
    end
end)

Tab3:AddToggle({Name = "Tween Gear", Default = false, Callback = function(v37)
        _G.TweenMGear = v37
        StopTween(_G.TweenMGear)
    end
})

spawn(function()
    pcall(function()
        while wait() do
            if _G.TweenMGear then
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    for _, gear in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
                        if gear:IsA("MeshPart") and gear.Material == Enum.Material.Neon then
                            topos(gear.CFrame)
                        end
                    end
                end
            end
        end
    end)
end)
Tab3:AddToggle({Name = "Bay đến đền thờ", Default = false, Callback = function(state) 
        if state then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
            Tween2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
        end
    end}
)
local function moveToLever()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local tweenService = game:GetService("TweenService")

    local targetPosition = CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734)

    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local goal = {CFrame = targetPosition}

    local tween = tweenService:Create(rootPart, tweenInfo, goal)

    tween:Play()

    tween.Completed:Connect(function()
        print("Đã đến vị trí cần gạt!")
    end)
end
Tab3:AddToggle({Name = "Bay đến cần gạt", Default = false, Callback = function(state)
         if state then
             -- Kích hoạt chức năng bay đến vị trí đền thờ
             moveToLever()
         else
      end
  end}
)
local function moveToLever()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local tweenService = game:GetService("TweenService")

    local targetPosition = CFrame.new(-5353.02490234375, 313.7505187988281, -2492.424072265625)

    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local goal = {CFrame = targetPosition}

    local tween = tweenService:Create(rootPart, tweenInfo, goal)

    tween:Play()

    tween.Completed:Connect(function()
        print("Đã đến vị trí bia đá!")
    end)
end
Tab3:AddToggle({Name = "Bay đến bia đá", Default = false, Callback = function(state)
        if state then
        -- Kích hoạt chức năng bay đến vị trí cần gạt
            moveToLever()
        else
     end
 end}
)
local targetPosition = CFrame.new(2947.556884765625, 2281.630615234375, -7213.54931640625)
local character = game.Players.LocalPlayer.Character
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local speed = 350 -- Tốc độ di chuyển

-- Hàm di chuyển mượt mà
local function moveToTarget(targetCFrame)
    local startPosition = humanoidRootPart.Position
    local targetPosition = targetCFrame.Position
    local direction = (targetPosition - startPosition).unit
    local distance = (targetPosition - startPosition).magnitude

    -- Di chuyển đến mục tiêu theo từng bước nhỏ
    for i = 1, distance / speed do
        humanoidRootPart.CFrame = humanoidRootPart.CFrame + direction * speed
        wait(0.03) -- Điều chỉnh độ trễ để tránh bị kick
    end

    -- Đảm bảo nhân vật tới vị trí cuối cùng
    humanoidRootPart.CFrame = targetCFrame
end

Tab3:AddToggle({Name = "Bay lên cây", Default = false, Callback = function(state)
          if state then
          -- Kích hoạt chức năng bay đến vị trí cần gạt
          moveToTarget(targetPosition)
       else
    end
 end}
)
local Section = Tab6:AddSection({"Server"}) -- Đảm bảo rằng phần section được thêm với tên rõ ràng
Tab6:AddButton({
    Name = "Copy Job Id",
    Callback = function()
        setclipboard(tostring(game.JobId))
    end
})
Tab6:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})
Tab6:AddButton({
    Name = "Open Devil Shop",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
    end
})
Tab6:AddButton({
    Name = "Open Inventory",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
        wait(1)
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Inventory.Visible = true
    end
})
Tab6:AddButton({
    Name = "Open Inventory Fruit",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
    end
})
Tab6:AddButton({
    Name = "Title Name",
    Callback = function()
        local args = { [1] = "getTitles" }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Titles.Visible = true
    end
})
Tab6:AddButton({
    Name = "Hải quân",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
    end
})
Tab6:AddButton({
    Name = "Hải tặc",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end
})

local BringModEnabled = false

Tab6:AddToggle({
    Name = "Bring Mod (Bá)",
    Default = false,
    Callback = function(state)
        BringModEnabled = state
    end
})
function BringFewMobs()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local count = 0
    for _, mob in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") and count < 4 then
            mob.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
            count = count + 1
        end
    end
end

spawn(function()
    while wait(1.5) do
        if BringModEnabled then
            pcall(function()
                BringFewMobs()
            end)
        end
    end
end)
Tab6:AddToggle({
    Name = "Anti AFK",
    Default = true,
    Callback = function()
        local vu = game:GetService("VirtualUser")
        repeat wait() until game:IsLoaded()
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            game:GetService("VirtualUser"):ClickButton2(Vector2.new())
            vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
    end
})
Tab6:AddToggle({
    Name = "Auto Rejoin",
    Default = true,
    Callback = function(value)
        _G.AutoRejoin = value
    end
})

task.spawn(function()
    while wait() do
        if _G.AutoRejoin then
            getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                end
            end)
        end
    end
end)
local Section = Settings:AddSection({"Thông tin"})
local Paragraph = Settings:AddParagraph({"Thông báo", "Chan đê!!"})
local Section = Tab4:AddSection({"Hop Sword Legendary"})
Tab4:AddButton({
    Name = "Auto Hop Saishi",
    Callback = function()
          -- Link Discord invite của bạn
    end}
)
Tab4:AddButton({
    Name = "Auto Hop Shizu",
    Callback = function()
          -- Link Discord invite của bạn
    end}
)
Tab4:AddButton({
    Name = "Auto Hop Oroshi",
    Callback = function()
          -- Link Discord invite của bạn
    end}
)
Tab4:AddToggle({Name = "Auto Buy Sword Legendary", Default = false, Callback = function(v38) 
    _G.BuyLegendarySword = v38
end}
)
spawn(
    function()
        while wait() do
            if _G.BuyLegendarySword then
                pcall(
                    function()
                        local v86 = {[1] = "LegendarySwordDealer", [2] = "1"}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v86))
                        local v86 = {[1] = "LegendarySwordDealer", [2] = "2"}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v86))
                        local v86 = {[1] = "LegendarySwordDealer", [2] = "3"}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v86))
                        if (_G.BuyLegendarySword_Hop and _G.BuyLegendarySword and World2) then
                            wait(10)
                            Hop()
                        end
                    end
                )
            end
        end
    end
)
local Section = Tab5:AddSection({"Chest"})
function Tween2(CFgo)
    local tween_s = game:GetService("TweenService")
    local info = TweenInfo.new(
        (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFgo.Position).Magnitude / 325,
        Enum.EasingStyle.Linear
    )
    
    local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = CFgo})
    tween:Play()

    local tweenfunc = {}

    function tweenfunc:Stop()
        tween:Cancel()
    end

    return tweenfunc
end

-- Chức năng Auto Farm Chest với Tween
local function ToggleFarmChest(state)
    _G.AutoCollectChest = state
    if state then
        spawn(function()
            while _G.AutoCollectChest do
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local currentPosition = character:GetPivot().Position
                local collectionService = game:GetService("CollectionService")
                local chests = collectionService:GetTagged("_ChestTagged")

                local nearestDistance, nearestChest = math.huge

                for _, chest in pairs(chests) do
                    local distance = (chest:GetPivot().Position - currentPosition).Magnitude
                    if not chest:GetAttribute("IsDisabled") and distance < nearestDistance then
                        nearestDistance, nearestChest = distance, chest
                    end
                end

                if nearestChest then
                    local chestPosition = nearestChest:GetPivot().Position
                    local destination = CFrame.new(chestPosition)
                    Tween2(destination) -- Gọi hàm di chuyển đến rương
                end
                wait(1) -- Chờ một khoảng thời gian trước khi tiếp tục tìm rương
            end
        end)
    end
end
Tab5:AddToggle({Name = "Farm Chest [bay]", Default = false, Callback = function(state)
     ToggleFarmChest(state) 
 end}
)
local function ToggleFarmChestBP(state)
    _G.ChestBypass = state
    if state then
        spawn(function()
            while _G.ChestBypass do
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local currentPosition = character:GetPivot().Position
                local collectionService = game:GetService("CollectionService")
                local chests = collectionService:GetTagged("_ChestTagged")

                local nearestDistance, nearestChest = math.huge

                for _, chest in pairs(chests) do
                    local distance = (chest:GetPivot().Position - currentPosition).Magnitude
                    if not chest:GetAttribute("IsDisabled") and distance < nearestDistance then
                        nearestDistance, nearestChest = distance, chest
                    end
                end

                if nearestChest then
                    local chestPosition = nearestChest:GetPivot().Position
                    character:PivotTo(CFrame.new(chestPosition)) -- Di chuyển trực tiếp đến rương
                    wait(0.2)
                else
                    break
                end
            end
        end)
    end
end
Tab5:AddToggle({Name = "Farm Chest [bypass]", Default = false, Callback = function(state)
    ToggleFarmChestBP(state) 
end}
)
local Section = Tab5:AddSection({"Farm"})
-- Hàm di chuyển đến vị trí bằng Tween
function Tween2(CFgo)
    local tween_s = game:GetService("TweenService")
    local info = TweenInfo.new(
        (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - CFgo.Position).Magnitude / 325,
        Enum.EasingStyle.Linear
    )
    
    local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = CFgo})
    tween:Play()

    local tweenfunc = {}

    function tweenfunc:Stop()
        tween:Cancel()
    end

    return tweenfunc
end

-- Chức năng Farm Bone với gom quái và tấn công
local function ToggleFarmBone(state)
    _G.Bone = state
    local BoneCFrame = CFrame.new(-9515.75, 174.852, 6079.406) -- Vị trí nhận nhiệm vụ farm bone
    local GATHER_RADIUS = 10 -- Bán kính gom quái xung quanh nhân vật

    if state then
        spawn(function()
            while _G.Bone do
                pcall(function()
                    -- Kiểm tra xem đã nhận nhiệm vụ chưa
                    local QuestTitle = game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, "Demonic Soul") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end

                    -- Lấy nhiệm vụ nếu chưa có
                    if not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
                        Tween2(BoneCFrame) -- Bay đến vị trí nhận nhiệm vụ
                        if (BoneCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
                        end
                    else
                        -- Tìm quái trong phạm vi bán kính GATHER_RADIUS
                        local enemies = {}
                        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                local distance = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                if distance <= GATHER_RADIUS and 
                                   (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") then
                                    table.insert(enemies, v) -- Thêm quái vào danh sách nếu ở trong phạm vi gom
                                end
                            end
                        end

                        -- Gom tất cả quái lại một điểm (vị trí của quái đầu tiên)
                        if #enemies > 0 then
                            local gatherPosition = enemies[1].HumanoidRootPart.CFrame -- Lấy vị trí của quái đầu tiên để gom
                            for _, v in pairs(enemies) do
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v.HumanoidRootPart.CFrame = gatherPosition -- Gom tất cả về cùng một vị trí
                            end

                            -- Tấn công tất cả quái đã gom
                            for _, v in pairs(enemies) do
                                repeat
                                    wait(0.1) -- Tùy chỉnh delay
                                    EquipTool("YourWeapon") -- Trang bị vũ khí của bạn
                                    AutoHaki() -- Kích hoạt Haki tự động
                                    AttackNoCoolDown() -- Tấn công quái
                                until v.Humanoid.Health <= 0 or not v.Parent or not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    end
                end)
                wait(1) -- Chờ 1 giây trước khi tiếp tục
            end
        end)
    end
end
Tab5:AddToggle({Name = "Farm Bones", Default = false, Callback = function(state)
    ToggleFarmBone(state)
end}
)
-- Cấu hình cơ bản
_G.AutoFarm = true  -- Bật tính năng tự động cày
_G.Cake = true  -- Bật cày Tư Lệnh Bánh
_G.AttackAllBoss = true  -- Bật tấn công tất cả boss
_G.Fast_Delay = 0.1  -- Thời gian delay giữa các lần tấn công
_G.SpawnCakePrince = true  -- Bật triệu hồi Tư Lệnh Bánh
SelectWeapon = "Vũ khí của bạn"  -- Thay thế "Vũ khí của bạn" bằng tên vũ khí bạn muốn sử dụng

-- Vị trí và phạm vi của đảo bánh
local CakeIslandCenter = Vector3.new(-2022, 37, -12030)  -- Tọa độ của đảo bánh
local CakeIslandRadius = 3000  -- Phạm vi bán kính của đảo bánh

-- Hàm kiểm tra xem quái/boss có ở đảo bánh không
function IsAtCakeIsland(pos)
    return (pos - CakeIslandCenter).Magnitude <= CakeIslandRadius
end

-- Hàm sử dụng Haki tự động (nếu có)
function AutoHaki()
    local player = game.Players.LocalPlayer
    if not player.Character:FindFirstChild("Haki") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ActivateHaki")
    end
end

-- Hàm trang bị vũ khí
function EquipTool(toolName)
    local player = game.Players.LocalPlayer
    local tool = player.Backpack:FindFirstChild(toolName)
    if tool then
        player.Character.Humanoid:EquipTool(tool)
    end
end

-- Hàm tấn công không delay
function AttackNoCoolDown()
    local args = {
        [1] = "AttackNoCoolDown"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

-- Hàm di chuyển tới vị trí mong muốn
function Tween(toCFrame)
    local player = game.Players.LocalPlayer
    local TweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new((player.Character.HumanoidRootPart.Position - toCFrame.Position).Magnitude / 100, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(player.Character.HumanoidRootPart, tweenInfo, {CFrame = toCFrame})
    tween:Play()
    tween.Completed:Wait()
end

-- Hàm kiểm tra boss tại đảo bánh
function FindBoss()
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.Name == "Cake Prince" or string.match(v.Name, "Boss")) then
            if IsAtCakeIsland(v.HumanoidRootPart.Position) then  -- Chỉ chọn boss ở đảo bánh
                return v
            end
        end
    end
    return nil
end

-- Hàm tìm quái tại đảo bánh
function FindMonster()
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            if IsAtCakeIsland(v.HumanoidRootPart.Position) then  -- Chỉ chọn quái ở đảo bánh
                return v
            end
        end
    end
    return nil
end

-- Tự động đánh quái và chuyển sang boss khi có (chỉ tại đảo bánh)
function StartFarmKatakuri()
    _G.AutoFarm = true  -- Kích hoạt farm
    spawn(function()
        while _G.AutoFarm do
            wait(_G.Fast_Delay)
            pcall(function()
                -- Kiểm tra boss trước
                local boss = FindBoss()
                if boss then
                    -- Tấn công boss nếu có
                    repeat
                        wait(_G.Fast_Delay)
                        AutoHaki()
                        EquipTool(SelectWeapon)
                        boss.HumanoidRootPart.CanCollide = false
                        boss.Humanoid.WalkSpeed = 0
                        boss.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        Tween(boss.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))  -- Di chuyển đến boss
                        AttackNoCoolDown()  -- Tấn công boss
                    until not boss.Parent or boss.Humanoid.Health <= 0 or not _G.AutoFarm
                else
                    -- Nếu không có boss, đánh quái thường
                    local monster = FindMonster()
                    if monster then
                        repeat
                            wait(_G.Fast_Delay)
                            AutoHaki()
                            EquipTool(SelectWeapon)
                            monster.HumanoidRootPart.CanCollide = false
                            monster.Humanoid.WalkSpeed = 0
                            monster.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            Tween(monster.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))  -- Di chuyển đến quái
                            AttackNoCoolDown()  -- Tấn công quái
                        until not monster.Parent or monster.Humanoid.Health <= 0 or not _G.AutoFarm
                    end
                end
            end)
        end
    end)
end
Tab5:AddToggle({Name = "Farm Katakuri (Beta)", Default = false, Callback = function(state)
    _G.AutoFarmKatakuri = state  -- Gán trạng thái của nút vào biến toàn cục
    if state then
        StartFarmKatakuri()  -- Bắt đầu farm nếu bật toggle
    else
        _G.AutoFarm = false  -- Tắt farm khi toggle bị tắt
    end
 end}
)
spawn(function()
    while wait() do
        if _G.SpawnCakePrince then
            local args = {
                [1] = "CakePrinceSpawner",
                [2] = true
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
