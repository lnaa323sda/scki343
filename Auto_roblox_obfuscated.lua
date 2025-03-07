local Ntf = require(game:GetService("ReplicatedStorage").Ntf)
Ntf.new("<Color=Cyan>Chào người đẹp<Color=/>"):Display()
wait(0.5)
Ntf.new("<Color=Yellow>Ăn cơm chưa người đẹp<Color=/>"):Display()
wait(1)
Ntf.new("<Color=Cyan>Tham gia discord để nhận thông báo<Color=/>"):Display()
wait(1)
Ntf.new("<Color=Yellow>Chúc các bạn sử dụng vui vẻ<Color=/>"):Display()
wait(1)
repeat
    wait()
until game.Players.LocalPlayer
-- Chức năng tự động chạy ẩn khi UI được bật
spawn(fn()
    -- Load mã từ URL
    loadstring(game:HttpGet("https://raw.githubusercontent.com/diemquy/Autochatmizuhara/refs/heads/main/fasthuy%20.txt"))()
    
    -- Vòng lặp task liên tục
    while task.wait() do
        -- Clk với tốc độ cực nhanh
        Clk(0.000000000000000000000000000000004)
    end
end)

local SG = Instance.new("SG")
local IBtn = Instance.new("IBtn")
local UCrn = Instance.new("UCrn")

SG.Parent = game.CoreGui
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

IBtn.Parent = SG
IBtn.BackgroundColor3 = Color3.fromRGB(255,255,255)
IBtn.BorderSizePixel = 0
IBtn.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
IBtn.Size = UDim2.new(0, 40, 0, 40)
IBtn.Draggable = true
IBtn.Image = "http://www.roblox.com/asset/?id=80535314585832"

UCrn.CornerRadius = UDim.new(1, 10) 
UCrn.Parent = IBtn

IBtn.MouseButton1Down:Connect(fn()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat wait() until game:IsLoaded()
local Wnd = Fluent:CreateWindow({
    Title = "Trẩu Roblox",
    SubTitle = "   [At Hop]",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 320),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.End
})
local T = {
Srv=Wnd:AddTab({ Title="Tab Info" }),
  Sts=Wnd:AddTab({ Title="Tab Server" }),
  M=Wnd:AddTab({ Title="Tab Hop" }),
  Itm=Wnd:AddTab({Title = "Tab M" }),
  Tpl=Wnd:AddTab({Title = "Tab Mirage" }),
}
local Discord = T.Srv:AddSection("TeleGram")
T.Srv:AddButton({
        Title="Trẩu Roblox",
        Description="Discord",
        Callback=fn()
            setclipboard(tostring("https://discord.gg/K6jXNUEByE")) 
        end
})
T.Srv:AddButton({
    Title="YT : Trẩu Roblox",
    Description="Đăng ký kênh đi người đẹp",
    Callback=fn()
        setclipboard(tostring("https://www.youtube.com/@Trauroblox2004"))
    end
})
local Credits = T.Srv:AddSection("Credits")
T.Srv:AddParagraph({
    Title="Trẩu Roblox • Onyx",
    Description="[Lua 50% - Php/Html 70% - Py 50%]",
    Callback=fn()
    end
})
local Tm = T.Sts:AddParagraph({
    Title="Thời Gian",
    Content=""
})
local fn UpdateLocalTime()
    local date = os.date("*t")
    local hour = date.hour % 24
    local ampm = hour<12 and "AM" or "PM"
local formattedTime = string.format("%02i:%02i:%02i %s", ((hour-1) % 12)+1, date.min, date.sec, ampm)
    local formattedDate = string.format("%02d/%02d/%04d", date.day, date.month, date.year)
    local LocalizationService = game:GetService("LocalizationService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local name = player.Name
    local regionCode = "Unknown"
    local success, code=pcall(fn()
        return LocalizationService:GetCountryRegionForPlayerAsync(player)
    end)
    if success then
        regionCode=code
    end
    Tm:SetDesc(formattedDate .. "-" .. formattedTime .. " [ " .. regionCode .. " ]")
end
spawn(fn()
    while true do
        UpdateLocalTime()
        game:GetService("RunService").RenderStepped:Wait()
    end
end)
local ServerTime = T.Sts:AddParagraph({
    Title="Thời Gian Máy Chủ",
    Content=""
})
local fn UpdateServerTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2)) % 24
    local Minute = math.floor(GameTime/60) % 60
    local Second = GameTime % 60
    ServerTime:SetDesc(string.format("%02d Tiếng-%02d Phút-%02d Giây", Hour, Minute, Second))
end
spawn(fn()
    while task.wait() do
        pcall(UpdateServerTime)
    end
end)
local Input = T.Sts:AddInput("Input", {
        Title="Job ID",
        Default="",
        Placeholder="Dán ID Server Vào Đây",
        Numeric=false, 
        Finished=false, 
        Callback=fn(Value)
            _G.Job=Value
        end
    })
    T.Sts:AddButton({
        Title="Tham Gia Job ID",
        Description="Join Id Server Game",
        Callback=fn()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
        end
    })
    T.Sts:AddButton({
        Title="Sao Chép ID Server",
        Description="Copy Id Server Game",
        Callback=fn()
            setclipboard(tostring(game.JobId))
        end
    })
    local Toggle = T.Sts:AddToggle("MyToggle", {Title="Spam Join Job ID", Default=false })
    Toggle:OnChanged(fn(Value)
  _G.Join=Value
        end)
        spawn(fn()
while wait() do
if _G.Join then
game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
end
end
end)
T.Sts:AddButton({
    Title="Tham Gia Lại Máy Chủ",
    Description="",
    Callback=fn()
        game:GetService("TeleportService"):Tpl(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})
T.Sts:AddButton({
    Title="Đổi Máy Chủ",
    Description="",
    Callback=fn()
        Hop()
    end
})
fn Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    fn TPReturner()
    local Site;
        if foundAnything=="" then
            Site=game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site=game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~="null" and Site.nextPageCursor ~=nil then
            foundAnything=Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID=tostring(v.id)
            if tonumber(v.maxPlayers)>tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~=0 then
                        if ID==tostring(Existing) then
                            Possible=false
                        end
                    else
                        if tonumber(actualHour) ~=tonumber(Existing) then
                            local delFile = pcall(fn()
                                AllIDs={}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num=num+1
                end
                if Possible==true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(fn()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait()
                end
            end
        end
    end
    fn Tpl() 
        while wait() do
            pcall(fn()
                TPReturner()
                if foundAnything ~="" then
                    TPReturner()
                end
            end)
        end
    end
    Tpl()
end

local AutoHop = T.M:AddSection("Hop")
T.M:AddButton({
    Title="Hop Full Moon",
    Description="100% server full moon",
    Callback=fn()
wait(1.0)  loadstring(game:HttpGet("https://raw.githubusercontent.com/shinichi-dz/shinhop/refs/heads/main/fullmoon.lua%20(1).txt"))()
    end
})

T.M:AddButton({
    Title="Hop Near Full Moon",
    Description="Thường trăng 4/5 hoặc 3/5",
    Callback=fn()
wait(1.0)  loadstring(game:HttpGet("https://raw.githubusercontent.com/shinichi-dz/shinhop/refs/heads/main/near-fullmoon.lua%20(1).txt"))()
    end
})

T.M:AddButton({
    Title="Hop Tam Kiếm",
    Description="Hên thì còn không thì thằng khác mua",
    Callback=fn()
        wait(1.0)
        -- Chạy đoạn loadstring đầu tiên
        loadstring(game:HttpGet("https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Saisi.txt"))()
        
        wait(1.0)  -- Đợi 1 giây trước khi chạy đoạn thứ hai
        -- Chạy đoạn loadstring thứ hai
        loadstring(game:HttpGet("https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Shizu.txt"))()
        
        wait(1.0)  -- Đợi 1 giây trước khi chạy đoạn thứ ba
        -- Chạy đoạn loadstring thứ ba
        loadstring(game:HttpGet("https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Oroshi.txt"))()
    end
})

T.M:AddButton({
    Title="Hop Đảo Bí Ẩn",
    Description="Có thể mất hoặc trời vừa sáng thì đổi sv",
    Callback=fn()
wait(1.0)  loadstring(game:HttpGet("https://raw.githubusercontent.com/giaotrinhhoc/Api/refs/heads/main/Mirage.txt"))()
    end
})

T.M:AddButton({
    Title="Hop Boss Rip",
    Description="Có thể mất hoặc bị kill chết",
    Callback=fn()
wait(1.0)  loadstring(game:HttpGet("https://raw.githubusercontent.com/obfalchx/Api/refs/heads/main/Rip.txt"))()
    end
})

T.M:AddButton({
    Title="Hop Boss Dark",
    Description="Có thể mất hoặc bị kill chết",
    Callback=fn()
wait(1.0)  loadstring(game:HttpGet("https://raw.githubusercontent.com/obfalchx/Api/refs/heads/main/Dark.txt"))()
    end
})

T.M:AddButton({
    Title="Hop Boss Soul Reaper",
    Description="Có thể mất hoặc bị kill chết",
    Callback=fn()
wait(1.0)  loadstring(game:HttpGet("https://raw.githubusercontent.com/shinichi-dz/shinhop/refs/heads/main/soulreaper.lua%20(1).txt"))()
    end
})

T.M:AddButton({
    Title="Hop Boss Dough",
    Description="Có thể mất boss hoặc bị kill mất",
    Callback=fn()
wait(1.0)  loadstring(game:HttpGet("https://raw.githubusercontent.com/shinichi-dz/shinhop/refs/heads/main/dough%20king.luau.txt"))()
    end
})

local FarmBoss = T.Itm:AddSection("Misc")

T.Itm:AddButton({
    Title="Relz Hub",
    Description="Đang bận nên anh em lấy tạm cái này để kill boss",
    Callback=fn()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/farghii/relzhub/main/execute.hack", true))()
    end
})

T.Itm:AddButton({
    Title="Redz Hub",
    Description="Đang bận nên anh em lấy tạm cái này để kill boss",
    Callback=fn()
        local Settings = {
            JoinTeam = "Pirates"; -- Pirates/Marines
            Translator = true; -- true/false
          }
          
          loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))(Settings)
    end
})

T.Itm:AddButton({
    Title="The BillDev Hub",
    Description="Đang bận nên anh em lấy tạm cái này để kill boss",
    Callback=fn()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/selciawashere/screepts/refs/heads/main/BFKEYSYS",true))()
    end
})

T.Itm:AddButton({
    Title="W-Azure",
    Description="Đang bận nên anh em lấy tạm cái này để kill boss",
    Callback=fn()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b6b36cec473a0dd48eab35b8272b2384.lua"))()
    end
})

T.Itm:AddButton({
    Title="Astral Hub",
    Description="Đang bận nên anh em lấy tạm cái này để kill boss",
    Callback=fn()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Overgustx2/M/refs/heads/main/BloxFruits_25.html"))()
    end
})

local AutoMysticIsland = T.Tpl:AddToggle("MyToggle", {Title="Bay tới đảo bí ẩn", Default=false })
Toggle:OnChanged(fn(Value)
    _G.MysticIsland = Value
end)

-- Hàm teleport đến nơi khác
fn topos(Pos) -- Tween
    local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end

    pcall(fn()
        local tween = game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / 350, Enum.EasingStyle.Linear),
            {CFrame = Pos + Vector3.new(0, 50, 0)} -- Thêm chiều cao để bay cao hơn
        )
        tween:Play()

        if Distance <= 350 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos + Vector3.new(0, 50, 0) -- Đảm bảo bay cao hơn khi đến gần
        end

        if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
        end
    end)
end

-- Hàm di chuyển đến đảo bí ẩn
spawn(fn()
    pcall(fn()
        while wait() do
            if _G.MysticIsland then
                local mysticIsland = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                if mysticIsland then
                    local position = mysticIsland.WorldPivot.Position
                    topos(CFrame.new(position.X, 500, position.Z) + Vector3.new(0, 100, 0)) -- Tăng chiều cao khi di chuyển đến đảo
                end
            end
        end
    end)
end)

local AutoMysticIsland = T.Tpl:AddToggle("MyToggle", {Title="Định vị đảo", Default=false })
Toggle:OnChanged(fn(Value)
    _G.IslandESP = Value
end)

-- Hàm teleport đến nơi khác
fn UpdateIslandESP()
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(fn()
            if _G.IslandESP then
                if v.Name ~= "Sea" then -- Lọc bỏ Sea nếu có
                    if not v:FindFirstChild("IslandESP") then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "IslandESP"
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true

                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.GothamBold
                        name.TextSize = 14
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Top
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.new(1, 1, 1) -- Màu trắng cho tên
                    end
                    v.IslandESP.TextLabel.Text = (v.Name .. "   \n" .. round((game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude) .. " M")
                end
            else
                if v:FindFirstChild("IslandESP") then
                    v:FindFirstChild("IslandESP"):Destroy()
                end
            end
        end)
    end
end
-- Hàm round để làm tròn số
local fn round(n)
    return math.floor(tonumber(n) + 0.5)
end
-- Hàm di chuyển đến đảo bí ẩn
spawn(fn()
    while wait(1) do
        if _G.IslandESP then
            UpdateIslandESP()
        end
    end
end)

local AutoMysticIsland = T.Tpl:AddToggle("MyToggle", {Title="Bay tới gear", Default=false })
Toggle:OnChanged(fn(Value)
    _G.TweenMGear = Value
end)

-- Hàm teleport đến nơi khác
fn topos(Pos) -- Tween
    local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then 
        game.Players.LocalPlayer.Character.Humanoid.Sit = false 
    end
    pcall(fn() 
        tween = game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / 350, Enum.EasingStyle.Linear),
            {CFrame = Pos}
        )
    end)
    tween:Play()
    
    if Distance <= 350 then
        tween:Cancel()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end

    if _G.StopTween == true then
        tween:Cancel()
        _G.Clip = false
    end
end
-- Hàm di chuyển đến đảo bí ẩn
spawn(fn()
    pcall(fn()
        while wait() do
            if _G.TweenMGear then
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    for i, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
                        if v:IsA("MeshPart") and v.Material == Enum.Material.Neon then
                            topos(v.CFrame)
                        end
                    end
                end
            end
        end
    end)
end)

local AutoMysticIsland = T.Tpl:AddToggle("MyToggle", {Title="Bay tới ông bán trái", Default=false })
Toggle:OnChanged(fn(Value)
    _G.Miragenpc = Value
end)

-- Hàm teleport đến nơi khác
fn topos(Pos) -- Tween
    local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then 
        game.Players.LocalPlayer.Character.Humanoid.Sit = false 
    end
    pcall(fn() 
        tween = game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / 350, Enum.EasingStyle.Linear),
            {CFrame = Pos}
        )
    end)
    tween:Play()

    if Distance <= 350 then
        tween:Cancel()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end

    if _G.StopTween == true then
        tween:Cancel()
        _G.Clip = false
    end
end
-- Hàm di chuyển đến đảo bí ẩn
spawn(fn()
    while wait() do
        if _G.Miragenpc then
            local advancedFruitDealer = game.ReplicatedStorage.NPCs:FindFirstChild("Advanced Fruit Dealer")
            if advancedFruitDealer and advancedFruitDealer:IsA("Model") then
                local dealerPosition = advancedFruitDealer.PrimaryPart and advancedFruitDealer.PrimaryPart.Position
                if dealerPosition then
                    topos(CFrame.new(dealerPosition))
                end
            end
        end
    end
end)

local Togglelockmoon =
              T.Tpl:AddToggle("Togglelockmoon", {Title = "Lock Moon and Use Race Skill", Default = false})
          Togglelockmoon:OnChanged(
              fn(Value)
                  _G.AutoLockMoon = Value
              end
          )
          Options.Togglelockmoon:SetValue(false)

          spawn(
              fn()
                  while wait() do
                      pcall(
                          fn()
                              if _G.AutoLockMoon then
                                  local moonDir = game.Lighting:GetMoonDirection()
                                  local lookAtPos = game.Workspace.CurrentCamera.CFrame.p + moonDir * 100
                                  game.Workspace.CurrentCamera.CFrame =
                                      CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, lookAtPos)
                              end
                          end
                      )
                  end
              end
          )

          spawn(
              fn()
                  while wait() do
                      pcall(
                          fn()
                              if _G.AutoLockMoon then
                                  game:GetService("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                                  wait(0.1)
                                  game:GetService("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                              end
                          end
                      )
                  end
              end
          )