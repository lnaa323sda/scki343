-- Khởi tạo biến và cài đặt
local Config = {
    Logo = "rbxassetid://99376119443526",
    TabColor = Color3.fromRGB(15,15,15),
    StrokeColor = Color3.fromRGB(23,23,23),
    Other = Color3.fromRGB(2,182,255),
    SizeLib = UDim2.new(0,550,0,330)
}

-- Định nghĩa hàm
local function CheckNearestTeleporter(v236)
    -- Mã xử lý cho hàm CheckNearestTeleporter
end

local function AttackNoCoolDown()
    -- Mã xử lý cho hàm AttackNoCoolDown
end

-- Khởi tạo UI và các chức năng khác
local v51 = v48:Window("Infinity Hấp", "Hop Boss", Enum.KeyCode.F1)
local v52 = v51:Tab("Tab Status", "Status Boss", "rbxassetid://10734984606")
local v53 = v51:Tab("Tab Boss Farm", "Hop And kill", "rbxassetid://10723407389")

-- Thiết lập các sự kiện, ví dụ cho nút bấm
v52:Button("Copy Discord Link", "Sign In To Get New Updates", function()
    setclipboard("https://discord.com/invite/hcJ8PHtkfy")
end)

-- Cấu trúc script logic
spawn(function()
    while wait() do
        -- Kiểm tra trạng thái boss và các sự kiện khác
    end
end)
-- Label trạng thái boss
local v54 = v52:Label("Status Darkbeard :")
spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard") or game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard") then
                v54:Set("Status Darkbeard : Spawn!")
            else
                v54:Set("Status Darkbeard : Boss Not Spawn")
            end
        end)
    end
end)

local v55 = v52:Label("Status Rip Indra :")
spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") then
                v55:Set("Status Rip Indra : Spawn!")
            else
                v55:Set("Status Rip Indra : Boss Not Spawn")
            end
        end)
    end
end)

local v56 = v52:Label("Status Dough King :")
spawn(function()
    while wait() do
        pcall(function()
            if game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                v56:Set("Status Dough King : Spawn!")
            else
                v56:Set("Status Dough King : Boss Not Spawn")
            end
        end)
    end
end)

-- Toggle Auto Darkbeard
v53:Toggle("Auto Darkbeard", "Auto Attack And Hop", "rbxassetid://74729392450629", false, function(v261)
    _G.DarkFull = v261
    StopTween(_G.DarkFull)
end)

-- Auto Attack Darkbeard
spawn(function()
    while wait() do
        if _G.DarkFull and not BypassTP then
            pcall(function()
                local v1004 = game:GetService("Workspace").Enemies
                if v1004:FindFirstChild("Darkbeard") then
                    for v1063, v1064 in pairs(v1004:GetChildren()) do
                        if v1064.Name == "Darkbeard" and v1064:FindFirstChild("Humanoid") and v1064:FindFirstChild("HumanoidRootPart") and v1064.Humanoid.Health > 0 then
                            -- Xử lý auto attack boss
                        end
                    end
                end
            end)
        end
    end
end)
-- Toggle Auto Rip Indra
v53:Toggle("Auto Rip Indra", "Auto Attack And Hop", "rbxassetid://74729392450629", false, function(v262)
    _G.RipFull = v262
    StopTween(_G.RipFull)
end)

-- Auto Attack Rip Indra
spawn(function()
    while wait() do
        if _G.RipFull and not BypassTP then
            pcall(function()
                local v1005 = game:GetService("Workspace").Enemies
                if v1005:FindFirstChild("rip_indra True Form") then
                    for v1065, v1066 in pairs(v1005:GetChildren()) do
                        if v1066.Name == "rip_indra True Form" and v1066:FindFirstChild("Humanoid") and v1066:FindFirstChild("HumanoidRootPart") and v1066.Humanoid.Health > 0 then
                            -- Xử lý auto attack Rip Indra
                        end
                    end
                end
            end)
        end
    end
end)

-- Toggle Auto Dough King
v53:Toggle("Auto Dough King", "Auto Attack And Hop", "rbxassetid://74729392450629", false, function(v263)
    _G.DoughFull = v263
    StopTween(_G.DoughFull)
end)

-- Auto Attack Dough King
spawn(function()
    while wait() do
        if _G.DoughFull and not BypassTP then
            pcall(function()
                local v1006 = game:GetService("Workspace").Enemies
                if v1006:FindFirstChild("Dough King") then
                    for v1067, v1068 in pairs(v1006:GetChildren()) do
                        if v1068.Name == "Dough King" and v1068:FindFirstChild("Humanoid") and v1068:FindFirstChild("HumanoidRootPart") and v1068.Humanoid.Health > 0 then
                            -- Xử lý auto attack Dough King
                        end
                    end
                end
            end)
        end
    end
end)

-- Auto Farm tất cả boss
spawn(function()
    while wait() do
        if _G.DarkFull or _G.RipFull or _G.DoughFull then
            pcall(function()
                -- Kiểm tra tất cả boss và xử lý auto farm
                local enemies = game:GetService("Workspace").Enemies:GetChildren()
                for _, enemy in pairs(enemies) do
                    if (enemy.Name == "Darkbeard" or enemy.Name == "rip_indra True Form" or enemy.Name == "Dough King") and enemy.Humanoid.Health > 0 then
                        -- Tấn công boss dựa trên loại boss đã được chọn auto
                    end
                end
            end)
        end
    end
end)

-- Dừng auto khi hết boss hoặc đã xong
function StopTween(v264)
    if not v264 then
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
end
-- Auto sử dụng Haki nếu chưa kích hoạt
function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

-- Tự động trang bị vũ khí
function EquipWeapon(weaponName)
    local player = game.Players.LocalPlayer
    if player.Backpack:FindFirstChild(weaponName) then
        local tool = player.Backpack:FindFirstChild(weaponName)
        wait(0.1)
        player.Character.Humanoid:EquipTool(tool)
    end
end

-- Chọn vũ khí tự động dựa theo loại vũ khí
_G.SelectWeapon = "Melee"
spawn(function()
    while wait() do
        pcall(function()
            local player = game.Players.LocalPlayer
            local backpack = player.Backpack:GetChildren()
            
            if _G.SelectWeapon == "Melee" then
                for _, item in pairs(backpack) do
                    if item.ToolTip == "Melee" and player.Backpack:FindFirstChild(item.Name) then
                        _G.SelectWeapon = item.Name
                    end
                end
            elseif _G.SelectWeapon == "Sword" then
                for _, item in pairs(backpack) do
                    if item.ToolTip == "Sword" and player.Backpack:FindFirstChild(item.Name) then
                        _G.SelectWeapon = item.Name
                    end
                end
            elseif _G.SelectWeapon == "Gun" then
                for _, item in pairs(backpack) do
                    if item.ToolTip == "Gun" and player.Backpack:FindFirstChild(item.Name) then
                        _G.SelectWeapon = item.Name
                    end
                end
            elseif _G.SelectWeapon == "Fruit" then
                for _, item in pairs(backpack) do
                    if item.ToolTip == "Blox Fruit" and player.Backpack:FindFirstChild(item.Name) then
                        _G.SelectWeapon = item.Name
                    end
                end
            end
        end)
    end
end)

-- Tự động tấn công boss liên tục
function AttackNoCoolDown()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end

    local weapon = nil
    for _, tool in ipairs(character:GetChildren()) do
        if tool:IsA("Tool") then
            weapon = tool
            break
        end
    end

    if not weapon then return end

    local function isEnemyAlive(enemy)
        return enemy and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0
    end

    local function getNearbyEnemies(range)
        local enemies = game:GetService("Workspace").Enemies:GetChildren()
        local nearbyEnemies = {}
        local playerPosition = character:GetPivot().Position

        for _, enemy in ipairs(enemies) do
            local humanoidRootPart = enemy:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart and isEnemyAlive(enemy) and (humanoidRootPart.Position - playerPosition).Magnitude <= range then
                table.insert(nearbyEnemies, enemy)
            end
        end
        return nearbyEnemies
    end

    if weapon:FindFirstChild("LeftClickRemote") then
        local clickCounter = 1
        local enemiesInRange = getNearbyEnemies(60)
        for _, enemy in ipairs(enemiesInRange) do
            local direction = (enemy.HumanoidRootPart.Position - character:GetPivot().Position).Unit
            pcall(function() weapon.LeftClickRemote:FireServer(direction, clickCounter) end)
            clickCounter = clickCounter + 1
            if clickCounter > 1000000000 then clickCounter = 1 end
        end
    else
        -- Đoạn xử lý cho trường hợp không có LeftClickRemote
    end
end

-- Fast attack
_G.FastAttack = true
spawn(function()
    while wait(0.1) do
        if _G.FastAttack then
            pcall(function()
                repeat
                    task.wait(0.1)
                    AttackNoCoolDown()
                until not _G.FastAttack
            end)
        end
    end
end)

-- Tự động nhặt rương tiền
function AutoCollectChests()
    for _, chest in pairs(game.Workspace:GetChildren()) do
        if chest:IsA("Model") and chest:FindFirstChild("TouchInterest") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, chest, 0)
            wait(0.1)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, chest, 1)
        end
    end
end
-- Tự động teleport đến vị trí được chỉ định
function TeleportToPosition(position)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = player.Character.HumanoidRootPart
        humanoidRootPart.CFrame = CFrame.new(position)
    end
end

-- Kiểm tra vị trí gần nhất có thể teleport
function GetNearestTeleporter()
    local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    local teleportLocations = {
        ["Sky Island 1"] = Vector3.new(-4652, 873, -1754),
        ["Sky Island 2"] = Vector3.new(-7895, 5547, -380),
        ["Under Water Island"] = Vector3.new(61164, 5, 1820),
        -- Thêm các tọa độ khác ở đây
    }

    local closestDistance = math.huge
    local closestTeleporter = nil

    for name, position in pairs(teleportLocations) do
        local distance = (playerPosition - position).Magnitude
        if distance < closestDistance then
            closestDistance = distance
            closestTeleporter = position
        end
    end

    return closestTeleporter
end

-- Tự động teleport đến vị trí gần nhất
function AutoTeleportToNearest()
    local nearestTeleporter = GetNearestTeleporter()
    if nearestTeleporter then
        TeleportToPosition(nearestTeleporter)
    end
end

-- Tự động farm quái vật
function AutoFarmEnemies()
    local player = game.Players.LocalPlayer
    local enemies = game:GetService("Workspace").Enemies:GetChildren()

    for _, enemy in pairs(enemies) do
        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
            -- Teleport đến kẻ địch
            TeleportToPosition(enemy.HumanoidRootPart.Position)
            -- Gọi hàm AttackNoCoolDown để tấn công kẻ địch
            AttackNoCoolDown()
            wait(1) -- Chờ một chút trước khi tấn công tiếp
        end
    end
end

-- Kích hoạt Auto Farm với tùy chọn Bật/Tắt
_G.AutoFarmEnabled = false
function ToggleAutoFarm(toggle)
    _G.AutoFarmEnabled = toggle
    if _G.AutoFarmEnabled then
        print("Auto Farm đang chạy")
        spawn(function()
            while _G.AutoFarmEnabled do
                AutoFarmEnemies()
                wait(2) -- Đợi trước khi tìm kiếm kẻ địch tiếp theo
            end
        end)
    else
        print("Auto Farm đã dừng")
    end
end

-- Cấu hình UI cho Auto Farm
v53:Toggle("Auto Farm", "Tự động farm quái vật", "rbxassetid://74729392450629", false, function(enabled)
    ToggleAutoFarm(enabled)
end)

-- Tự động đổi server khi không còn gì để farm
function AutoServerHop()
    if _G.AutoFarmEnabled then
        -- Giả sử game có chức năng đổi server
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "server_id_here", game.Players.LocalPlayer)
    end
end

-- Chức năng nhảy cao
function HighJump()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.JumpPower = 100 -- Tăng sức mạnh nhảy
        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

-- Toggle chức năng nhảy cao
_G.HighJumpEnabled = false
v53:Toggle("High Jump", "Bật/Tắt nhảy cao", "rbxassetid://74729392450629", false, function(enabled)
    _G.HighJumpEnabled = enabled
    if _G.HighJumpEnabled then
        HighJump()
    else
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50 -- Trả về mặc định
    end
end)

-- Tự động teleport đến các vật phẩm hiếm
function AutoCollectRareItems()
    for _, item in pairs(game.Workspace:GetChildren()) do
        if item:IsA("Model") and item:FindFirstChild("TouchInterest") then
            -- Kiểm tra nếu vật phẩm này là hiếm
            if item.Name == "RareItem" then -- Tên vật phẩm có thể thay đổi tùy game
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, item, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, item, 1)
            end
        end
    end
end

-- Cấu hình toggle Auto Collect Rare Items
_G.AutoCollectRareEnabled = false
v53:Toggle("Auto Collect Rare Items", "Tự động nhặt vật phẩm hiếm", "rbxassetid://74729392450629", false, function(enabled)
    _G.AutoCollectRareEnabled = enabled
    if _G.AutoCollectRareEnabled then
        spawn(function()
            while _G.AutoCollectRareEnabled do
                AutoCollectRareItems()
                wait(1)
            end
        end)
    end
end)

-- Toggle chức năng Auto Server Hop
v53:Toggle("Auto Server Hop", "Tự động đổi server khi không còn gì để farm", "rbxassetid://74729392450629", false, function(enabled)
    _G.ServerHopEnabled = enabled
    if _G.ServerHopEnabled then
        spawn(function()
            while _G.ServerHopEnabled do
                AutoServerHop()
                wait(300) -- Đổi server sau mỗi 5 phút
            end
        end)
    end
end)
-- Chức năng teleport đến người chơi gần nhất
function TeleportToNearestPlayer()
    local player = game.Players.LocalPlayer
    local nearestDistance = math.huge
    local nearestPlayer = nil

    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - otherPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance < nearestDistance then
                nearestDistance = distance
                nearestPlayer = otherPlayer
            end
        end
    end

    if nearestPlayer then
        TeleportToPosition(nearestPlayer.Character.HumanoidRootPart.Position)
    end
end

-- Toggle chức năng Teleport đến người chơi gần nhất
v53:Toggle("Teleport To Nearest Player", "Dịch chuyển đến người chơi gần nhất", "rbxassetid://74729392450629", false, function(enabled)
    if enabled then
        TeleportToNearestPlayer()
    end
end)

-- Tự động tắt đồ họa để tăng hiệu suất treo game
function ReduceGraphics()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    game:GetService("Lighting").GlobalShadows = false
    game:GetService("Lighting").FogEnd = 9e9
    game:GetService("Lighting").Brightness = 1
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
            v.CastShadow = false
        end
    end
    print("Đồ họa đã được giảm để tối ưu hiệu suất.")
end

-- Toggle chức năng giảm đồ họa để treo nhiều tab
v53:Toggle("Reduce Graphics", "Giảm đồ họa để tăng hiệu suất treo game", "rbxassetid://74729392450629", false, function(enabled)
    if enabled then
        ReduceGraphics()
    else
        -- Trả về mặc định nếu không muốn giảm đồ họa nữa
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        game:GetService("Lighting").GlobalShadows = true
        game:GetService("Lighting").FogEnd = 100000
        game:GetService("Lighting").Brightness = 2
    end
end)

-- Chức năng ẩn tên nhân vật và tên người chơi khác
function HidePlayerNames()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.DisplayName = "Hidden"
        end
    end
end

-- Toggle chức năng ẩn tên người chơi
v53:Toggle("Hide Player Names", "Ẩn tên người chơi khác trong game", "rbxassetid://74729392450629", false, function(enabled)
    if enabled then
        HidePlayerNames()
    end
end)

-- Tự động trả lời câu hỏi (phụ thuộc vào game)
function AutoAnswerQuestion(answer)
    local questionModule = game:GetService("ReplicatedStorage"):WaitForChild("QuestionModule")
    if questionModule then
        questionModule:FireServer(answer)
        print("Câu trả lời đã được gửi:", answer)
    end
end

-- Toggle chức năng tự động trả lời câu hỏi
v53:Textbox("Auto Answer Question", "Câu trả lời tự động", function(inputText)
    AutoAnswerQuestion(inputText)
end)

-- Tự động gửi yêu cầu kết bạn
function AutoFriendRequest()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            game:GetService("ReplicatedStorage").Remotes.FriendRequest:FireServer(player.UserId)
            print("Đã gửi yêu cầu kết bạn tới:", player.Name)
        end
    end
end

-- Toggle chức năng tự động gửi yêu cầu kết bạn
v53:Toggle("Auto Friend Request", "Tự động gửi yêu cầu kết bạn", "rbxassetid://74729392450629", false, function(enabled)
    if enabled then
        spawn(function()
            while enabled do
                AutoFriendRequest()
                wait(5) -- Gửi yêu cầu kết bạn sau mỗi 5 giây
            end
        end)
    end
end)

-- Tự động mua vật phẩm khi đủ tiền
function AutoBuyItem(itemName)
    local playerMoney = game.Players.LocalPlayer:FindFirstChild("Money") or 0
    local itemCost = 1000 -- Ví dụ: giá vật phẩm là 1000 (cần thay đổi theo game)
    
    if playerMoney >= itemCost then
        game:GetService("ReplicatedStorage").Remotes.BuyItem:InvokeServer(itemName)
        print("Đã mua vật phẩm:", itemName)
    else
        print("Không đủ tiền để mua:", itemName)
    end
end

-- Toggle chức năng tự động mua vật phẩm
v53:Textbox("Auto Buy Item", "Tên vật phẩm", function(itemName)
    AutoBuyItem(itemName)
end)
-- Chức năng tự động farm boss khi boss spawn
function AutoFarmBoss(bossName)
    local bosses = game:GetService("Workspace").Enemies:GetChildren()

    for _, boss in pairs(bosses) do
        if boss.Name == bossName and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
            -- Teleport tới vị trí của boss
            TeleportToPosition(boss.HumanoidRootPart.Position)
            -- Tấn công boss
            AttackNoCoolDown()
        end
    end
end

-- Toggle Auto Farm cho các boss cụ thể
v53:Toggle("Auto Farm Darkbeard", "Tự động farm Darkbeard", "rbxassetid://74729392450629", false, function(enabled)
    _G.AutoFarmDarkbeard = enabled
    if _G.AutoFarmDarkbeard then
        spawn(function()
            while _G.AutoFarmDarkbeard do
                AutoFarmBoss("Darkbeard")
                wait(1)
            end
        end)
    end
end)

v53:Toggle("Auto Farm Rip Indra", "Tự động farm Rip Indra", "rbxassetid://74729392450629", false, function(enabled)
    _G.AutoFarmRipIndra = enabled
    if _G.AutoFarmRipIndra then
        spawn(function()
            while _G.AutoFarmRipIndra do
                AutoFarmBoss("rip_indra True Form")
                wait(1)
            end
        end)
    end
end)

v53:Toggle("Auto Farm Dough King", "Tự động farm Dough King", "rbxassetid://74729392450629", false, function(enabled)
    _G.AutoFarmDoughKing = enabled
    if _G.AutoFarmDoughKing then
        spawn(function()
            while _G.AutoFarmDoughKing do
                AutoFarmBoss("Dough King")
                wait(1)
            end
        end)
    end
end)

-- Chức năng tự động heal khi máu giảm xuống dưới mức nhất định
function AutoHeal(healThreshold)
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoid = character and character:FindFirstChild("Humanoid")

    if humanoid and humanoid.Health <= healThreshold then
        -- Kiểm tra xem người chơi có vật phẩm hồi máu không
        if player.Backpack:FindFirstChild("HealingItem") then
            local healingItem = player.Backpack:FindFirstChild("HealingItem")
            character.Humanoid:EquipTool(healingItem)
            healingItem:Activate() -- Kích hoạt vật phẩm hồi máu
            print("Đã hồi máu.")
        else
            print("Không tìm thấy vật phẩm hồi máu.")
        end
    end
end

-- Toggle Auto Heal khi máu dưới 50%
v53:Toggle("Auto Heal", "Tự động hồi máu khi máu dưới 50%", "rbxassetid://74729392450629", false, function(enabled)
    _G.AutoHealEnabled = enabled
    if _G.AutoHealEnabled then
        spawn(function()
            while _G.AutoHealEnabled do
                AutoHeal(50) -- Tự động hồi máu khi dưới 50%
                wait(1)
            end
        end)
    end
end)

-- Chức năng thông báo khi boss spawn
function NotifyWhenBossSpawns(bossName)
    local bossExists = game:GetService("Workspace").Enemies:FindFirstChild(bossName)
    if bossExists then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Boss Spawned",
            Text = bossName .. " đã xuất hiện!",
            Duration = 5
        })
    end
end

-- Toggle thông báo khi boss spawn
v53:Toggle("Notify Darkbeard Spawn", "Thông báo khi Darkbeard xuất hiện", "rbxassetid://74729392450629", false, function(enabled)
    _G.NotifyDarkbeard = enabled
    if _G.NotifyDarkbeard then
        spawn(function()
            while _G.NotifyDarkbeard do
                NotifyWhenBossSpawns("Darkbeard")
                wait(5) -- Kiểm tra mỗi 5 giây
            end
        end)
    end
end)

v53:Toggle("Notify Rip Indra Spawn", "Thông báo khi Rip Indra xuất hiện", "rbxassetid://74729392450629", false, function(enabled)
    _G.NotifyRipIndra = enabled
    if _G.NotifyRipIndra then
        spawn(function()
            while _G.NotifyRipIndra do
                NotifyWhenBossSpawns("rip_indra True Form")
                wait(5)
            end
        end)
    end
end)

-- Chức năng khóa người chơi ở một trạng thái
function LockPlayerState()
    local player = game.Players.LocalPlayer
    player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
    player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    print("Người chơi đã được khóa ở trạng thái sống.")
end

-- Toggle khóa người chơi ở trạng thái sống
v53:Toggle("Lock Player State", "Khóa trạng thái sống cho người chơi", "rbxassetid://74729392450629", false, function(enabled)
    if enabled then
        LockPlayerState()
    end
end)

-- Tự động bật tất cả Haki cho nhân vật
function AutoActivateAllHaki()
    local commF = game:GetService("ReplicatedStorage").Remotes.CommF_
    commF:InvokeServer("Buso") -- Kích hoạt Buso Haki
    commF:InvokeServer("Ken") -- Kích hoạt Ken Haki
    commF:InvokeServer("Conqueror") -- Kích hoạt Conqueror Haki
    print("Tất cả Haki đã được kích hoạt.")
end

-- Toggle Auto Haki
v53:Toggle("Auto Activate Haki", "Tự động kích hoạt tất cả Haki", "rbxassetid://74729392450629", false, function(enabled)
    if enabled then
        AutoActivateAllHaki()
    end
end)

-- Chức năng vô hiệu hóa camera shake
function DisableCameraShake()
    local cameraShaker = require(game:GetService("ReplicatedStorage").Util.CameraShaker)
    cameraShaker:Stop()
    print("Đã tắt rung camera.")
end

-- Toggle vô hiệu hóa camera shake
v53:Toggle("Disable Camera Shake", "Tắt rung camera", "rbxassetid://74729392450629", false, function(enabled)
    if enabled then
        DisableCameraShake()
    end
end)
-- Tự động kiểm tra và chuyển đổi server khi server hiện tại quá lag
function CheckAndSwitchLaggyServer()
    local playerPing = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()

    if playerPing > 250 then  -- Nếu ping lớn hơn 250ms, coi server là lag
        print("Server lag, chuyển sang server khác...")
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "new_server_id", game.Players.LocalPlayer)
    end
end

-- Toggle Auto Switch Laggy Server
v53:Toggle("Auto Switch Laggy Server", "Tự động chuyển server khi lag", "rbxassetid://74729392450629", false, function(enabled)
    _G.AutoSwitchLaggyServer = enabled
    if _G.AutoSwitchLaggyServer then
        spawn(function()
            while _G.AutoSwitchLaggyServer do
                CheckAndSwitchLaggyServer()
                wait(10)  -- Kiểm tra sau mỗi 10 giây
            end
        end)
    end
end)

-- Tự động tìm và nhặt rương trong game
function AutoCollectChestsInArea(areaName)
    local chests = game:GetService("Workspace"):GetChildren()
    
    for _, chest in pairs(chests) do
        if chest:IsA("Model") and chest:FindFirstChild("TouchInterest") and chest.Name == areaName then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, chest, 0)
            wait(0.1)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, chest, 1)
            print("Đã nhặt rương:", chest.Name)
        end
    end
end

-- Toggle tự động nhặt rương ở khu vực
v53:Textbox("Auto Collect Chests in Area", "Tên khu vực", function(areaName)
    _G.CollectAreaName = areaName
    spawn(function()
        while true do
            AutoCollectChestsInArea(_G.CollectAreaName)
            wait(5)  -- Tự động nhặt rương mỗi 5 giây
        end
    end)
end)

-- Chức năng tự động thu thập item quý hiếm
function AutoCollectRareItemsInGame()
    for _, item in pairs(game.Workspace:GetChildren()) do
        if item:IsA("Model") and item:FindFirstChild("TouchInterest") then
            if item.Name == "RareItem" then  -- Thay đổi "RareItem" thành tên vật phẩm quý
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, item, 0)
                wait(0.1)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, item, 1)
                print("Đã nhặt vật phẩm quý hiếm:", item.Name)
            end
        end
    end
end

-- Toggle Auto Collect Rare Items
v53:Toggle("Auto Collect Rare Items", "Tự động nhặt vật phẩm quý hiếm", "rbxassetid://74729392450629", false, function(enabled)
    _G.AutoCollectRare = enabled
    if _G.AutoCollectRare then
        spawn(function()
            while _G.AutoCollectRare do
                AutoCollectRareItemsInGame()
                wait(10)  -- Kiểm tra mỗi 10 giây
            end
        end)
    end
end)

-- Tự động bảo vệ nhân vật khi gặp nguy hiểm
function AutoDefense()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character.Humanoid

        -- Nếu nhân vật đang trong tình huống nguy hiểm (máu thấp hoặc bị tấn công)
        if humanoid.Health < humanoid.MaxHealth * 0.3 then
            -- Chạy đến nơi an toàn
            TeleportToPosition(Vector3.new(0, 100, 0))  -- Chuyển vị trí an toàn trên không
            print("Đã chạy về vị trí an toàn!")
        end
    end
end

-- Toggle Auto Defense
v53:Toggle("Auto Defense", "Tự động bảo vệ nhân vật", "rbxassetid://74729392450629", false, function(enabled)
    _G.AutoDefense = enabled
    if _G.AutoDefense then
        spawn(function()
            while _G.AutoDefense do
                AutoDefense()
                wait(2)  -- Kiểm tra mỗi 2 giây
            end
        end)
    end
end)

-- Tự động kết thúc nhiệm vụ khi hoàn thành
function AutoCompleteQuests()
    local questModule = game:GetService("ReplicatedStorage"):WaitForChild("QuestModule")
    if questModule then
        questModule:FireServer("Complete")
        print("Nhiệm vụ đã được hoàn thành.")
    end
end

-- Toggle Auto Complete Quests
v53:Toggle("Auto Complete Quests", "Tự động hoàn thành nhiệm vụ", "rbxassetid://74729392450629", false, function(enabled)
    _G.AutoCompleteQuests = enabled
    if _G.AutoCompleteQuests then
        spawn(function()
            while _G.AutoCompleteQuests do
                AutoCompleteQuests()
                wait(5)  -- Kiểm tra và hoàn thành nhiệm vụ sau mỗi 5 giây
            end
        end)
    end
end)

-- Chức năng tự động đổi vũ khí khi hết đạn hoặc năng lượng
function AutoSwitchWeapon()
    local player = game.Players.LocalPlayer
    local character = player.Character

    if character and character:FindFirstChild("Humanoid") then
        for _, tool in pairs(player.Backpack:GetChildren()) do
            if tool:IsA("Tool") and tool:FindFirstChild("Ammo") and tool.Ammo.Value == 0 then
                player.Character.Humanoid:EquipTool(tool)
                print("Đã đổi vũ khí:", tool.Name)
            end
        end
    end
end

-- Toggle Auto Switch Weapon
v53:Toggle("Auto Switch Weapon", "Tự động đổi vũ khí khi hết đạn", "rbxassetid://74729392450629", false, function(enabled)
    _G.AutoSwitchWeapon = enabled
    if _G.AutoSwitchWeapon then
        spawn(function()
            while _G.AutoSwitchWeapon do
                AutoSwitchWeapon()
                wait(2)  -- Kiểm tra mỗi 2 giây
            end
        end)
    end
end)

-- Chức năng bật chế độ tàng hình cho nhân vật (nếu có sẵn trong game)
function ActivateInvisibility()
    local player = game.Players.LocalPlayer
    local invisibilityItem = player.Backpack:FindFirstChild("InvisibilityCloak")

    if invisibilityItem then
        player.Character.Humanoid:EquipTool(invisibilityItem)
        invisibilityItem:Activate()  -- Kích hoạt chế độ tàng hình
        print("Đã kích hoạt chế độ tàng hình.")
    end
end

-- Toggle chế độ tàng hình
v53:Toggle("Invisibility Mode", "Bật chế độ tàng hình", "rbxassetid://74729392450629", false, function(enabled)
    if enabled then
        ActivateInvisibility()
    end
end)
-- Tự động lưu trạng thái game vào file (nếu game hỗ trợ)
function AutoSaveGameState()
    local dataModule = game:GetService("ReplicatedStorage"):FindFirstChild("DataModule")
    if dataModule then
        dataModule:FireServer("SaveData")
        print("Game state đã được lưu.")
    end
end

-- Toggle tự động lưu game
v53:Toggle("Auto Save Game", "Tự động lưu trạng thái game", "rbxassetid://74729392450629", false, function(enabled)
    _G.AutoSaveEnabled = enabled
    if _G.AutoSaveEnabled then
        spawn(function()
            while _G.AutoSaveEnabled do
                AutoSaveGameState()
                wait(300) -- Lưu trạng thái game mỗi 5 phút
            end
        end)
    end
end)

-- Tự động thoát khỏi server khi bị kick hoặc cảnh báo
function AutoLeaveOnKick()
    game.Players.LocalPlayer.OnKick:Connect(function(reason)
        print("Bạn đã bị kick, lý do:", reason)
        game:Shutdown()  -- Thoát game ngay lập tức
    end)

    -- Giả sử game có hệ thống cảnh báo, bạn có thể tự thoát trước khi bị kick
    game:GetService("ReplicatedStorage").Remotes.Warn:Connect(function(warningMessage)
        print("Cảnh báo nhận được:", warningMessage)
        game:Shutdown()
    end)
end

-- Toggle tự động thoát khỏi server khi bị kick/cảnh báo
v53:Toggle("Auto Leave On Kick", "Tự động thoát game khi bị kick hoặc cảnh báo", "rbxassetid://74729392450629", false, function(enabled)
    if enabled then
        AutoLeaveOnKick()
    end
end)

-- Tự động thay đổi skin cho nhân vật (nếu có hỗ trợ skin trong game)
function AutoChangeSkin(skinName)
    local player = game.Players.LocalPlayer
    if player.Backpack:FindFirstChild("SkinChanger") then
        local skinChanger = player.Backpack:FindFirstChild("SkinChanger")
        skinChanger:Activate()  -- Kích hoạt item đổi skin
        skinChanger:SetAttribute("SelectedSkin", skinName)  -- Chọn skin
        print("Đã thay đổi skin thành:", skinName)
    else
        print("Không tìm thấy SkinChanger trong Backpack.")
    end
end

-- Toggle tự động đổi skin
v53:Textbox("Auto Change Skin", "Tên Skin", function(skinName)
    AutoChangeSkin(skinName)
end)

-- Tự động đổi server khi server hiện tại có số người chơi quá ít hoặc quá nhiều
function AutoSwitchBasedOnPlayerCount(minPlayers, maxPlayers)
    local playerCount = #game.Players:GetPlayers()
    if playerCount < minPlayers or playerCount > maxPlayers then
        print("Đang đổi server do số người chơi không nằm trong giới hạn...")
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "new_server_id", game.Players.LocalPlayer)
    end
end

-- Toggle tự động đổi server dựa trên số người chơi
v53:Toggle("Auto Switch Server by Player Count", "Tự động đổi server dựa vào số người chơi", "rbxassetid://74729392450629", false, function(enabled)
    _G.SwitchByPlayerCount = enabled
    if _G.SwitchByPlayerCount then
        spawn(function()
            while _G.SwitchByPlayerCount do
                AutoSwitchBasedOnPlayerCount(10, 30) -- Giới hạn từ 10 đến 30 người chơi
                wait(30)  -- Kiểm tra mỗi 30 giây
            end
        end)
    end
end)

-- Tự động trả lời các câu hỏi chat trong game dựa trên từ khóa
function AutoRespondToChat(keyword, response)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(chatData)
        local message = string.lower(chatData.Message)
        if string.find(message, keyword) then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(response, "All")
            print("Đã tự động trả lời:", response)
        end
    end)
end

-- Toggle Auto Respond to Chat
v53:Textbox("Auto Respond to Chat", "Từ khóa", function(keyword)
    v53:Textbox("Auto Respond with", "Trả lời", function(response)
        AutoRespondToChat(keyword, response)
    end)
end)

-- Chức năng tự động gửi thông tin ping hiện tại trong chat
function AutoPingInChat()
    local pingValue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
    local message = "Ping hiện tại là: " .. tostring(pingValue) .. "ms"
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
    print("Ping đã được gửi trong chat:", message)
end

-- Toggle tự động gửi ping trong chat
v53:Toggle("Auto Ping in Chat", "Tự động gửi ping hiện tại vào chat", "rbxassetid://74729392450629", false, function(enabled)
    _G.AutoPingInChat = enabled
    if _G.AutoPingInChat then
        spawn(function()
            while _G.AutoPingInChat do
                AutoPingInChat()
                wait(60)  -- Gửi ping mỗi 60 giây
            end
        end)
    end
end)

-- Chức năng tự động thay đổi server khi gặp người chơi cụ thể
function AutoSwitchOnSpecificPlayer(playerName)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Name == playerName then
            print("Người chơi " .. playerName .. " đã tham gia, đổi server...")
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "new_server_id", game.Players.LocalPlayer)
        end
    end
end

-- Toggle tự động đổi server khi gặp người chơi cụ thể
v53:Textbox("Auto Switch on Specific Player", "Tên người chơi", function(playerName)
    _G.SwitchOnPlayer = playerName
    spawn(function()
        while _G.SwitchOnPlayer do
            AutoSwitchOnSpecificPlayer(_G.SwitchOnPlayer)
            wait(10)  -- Kiểm tra mỗi 10 giây
        end
    end)
end)
