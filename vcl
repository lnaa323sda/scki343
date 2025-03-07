if not game:IsLoaded() then game.Loaded:Wait() end
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.ReplicatedStorage
repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
local plr = game.Players.LocalPlayer
local CommF = game.ReplicatedStorage.Remotes["CommF_"]
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local CommF = Remotes:WaitForChild("CommF_", 9e9)
SupraGtr32Ferarri = require(game.ReplicatedStorage.Util.CameraShaker) 
SupraGtr32Ferarri:Stop()
if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
else
    game:GetService("Players").LocalPlayer:Kick("check discord for see game support")
end

repeat
    local ChooseTeam = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ChooseTeam", true)
    local UIController = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("UIController", true)
    if UIController and ChooseTeam then
        if ChooseTeam.Visible then
            for i, v in pairs(getgc()) do
                if type(v) == "function" and getfenv(v).script == UIController then
                    local constant = getconstants(v)
                    pcall(function()
                        if (constant[1] == "Pirates" or constant[1] == "Marines") and #constant == 1 then
                            local teamToSelect = getgenv().Team or "Pirates"
                            if constant[1] == teamToSelect then
                                v(teamToSelect)
                            end
                        end
                    end)
                end
            end
        end
    end
    wait(1)
until game.Players.LocalPlayer.Team
repeat
    wait()
until game.Players.LocalPlayer.Character
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
local function Hop()
  local Http = game:GetService("HttpService")
  local TPS = game:GetService("TeleportService")
  local Api = "https://games.roblox.com/v1/games/"
  local _place = game.PlaceId
  local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
  
  function ListServers(cursor)
    local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
    return Http:JSONDecode(Raw)
  end
  local Server, Next
  repeat task.wait()
    local Servers = ListServers(Next)
    Server = Servers.data[1] Next = Servers.nextPageCursor
  until Server TPS:TeleportToPlaceInstance(_place, Server.id, Player)
end
function MaterialMon()
			if _G.SeliMarteriel == "Radioactive Material" then
			  MMon = "Factory Staff"
			  MPos = CFrame.new(-507.7895202636719, 72.99479675292969, -126.45632934570312)
			  SP = "Bar"
			elseif _G.SeliMarteriel == "Mystic Droplet" then
			  MMon = "Water Fighter"
			  MPos = CFrame.new(-3214.218017578125, 298.69952392578125, -10543.685546875)
			  SP = "ForgottenIsland"
			elseif _G.SeliMarteriel == "Magma Ore" then
			  if game.PlaceId == 2753915549 then
			    MMon = "Military Spy"
			    MPos = CFrame.new(-5850.2802734375, 77.28675079345703, 8848.6748046875)
			    SP = "Magma"
			  elseif game.PlaceId == 4442272183 then
			    MMon = "Lava Pirate"
			    MPos = CFrame.new(-5234.60595703125, 51.953372955322266, -4732.27880859375)
			    SP = "CircleIslandFire"
			  end
			elseif _G.SeliMarteriel == "Angel Wings" then
			  MMon = "Royal Soldier"
			  MPos = CFrame.new(-7827.15625, 5606.912109375, -1705.5833740234375)
			  SP = "Sky2"
			elseif _G.SeliMarteriel == "Leather" then
			  if game.PlaceId == 2753915549 then
			    MMon = "Pirate"
			    MPos = CFrame.new(-1211.8792724609375, 4.787090301513672, 3916.83056640625)
			    SP = "Pirate"
			  elseif game.PlaceId == 4442272183 then
			    MMon = "Marine Captain"
			    MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
			    SP = "Greenb"
			  elseif game.PlaceId == 7449423635 then
			    MMon = "Jungle Pirate"
			    MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
			    SP = "PineappleTown"
			  end
			elseif _G.SeliMarteriel == "Scrap Metal" then
			  if game.PlaceId == 2753915549 then
			    MMon = "Brute"
			    MPos = CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125)
			    SP = "Pirate"
			  elseif game.PlaceId == 4442272183 then
			    MMon = "Mercenary"
			    MPos = CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125)
			    SP = "DressTown"
			  elseif game.PlaceId == 7449423635 then
			    MMon = "Pirate Millionaire"
			    MPos = CFrame.new(-289.6311950683594, 43.8282470703125, 5583.66357421875)
			    SP = "Default"
			  end
			elseif _G.SeliMarteriel == "Demonic Wisp" then
			  MMon = "Demonic Soul"
			  MPos = CFrame.new(-9503.388671875, 172.139892578125, 6143.0634765625)
			  SP = "HauntedCastle"
			elseif _G.SeliMarteriel == "Vampire Fang" then
			  MMon = "Vampire"
			  MPos = CFrame.new(-5999.20458984375, 6.437741279602051, -1290.059326171875)
			  SP = "Graveyard"
			elseif _G.SeliMarteriel == "Conjured Cocoa" then
			  MMon = "Chocolate Bar Battler"
			  MPos = CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375)
			  SP = "Chocolate"
			elseif _G.SeliMarteriel == "Dragon Scale" then
			  MMon = "Dragon Crew Warrior"
			  MPos = CFrame.new(5824.06982421875, 51.38640213012695, -1106.694580078125)
			  SP = "Hydra1"
			elseif _G.SeliMarteriel == "Gunpowder" then
			  MMon = "Pistol Billionaire"
			  MPos = CFrame.new(-379.6134338378906, 73.84449768066406, 5928.5263671875)
			  SP = "Default"
			elseif _G.SeliMarteriel == "Fish Tail" then
			  MMon = "Fishman Captain"
			  MPos = CFrame.new(-10961.0126953125, 331.7977600097656, -8914.29296875)
			  SP = "PineappleTown"
			elseif _G.SeliMarteriel == "Mini Tusk" then
			  MMon = "Mythological Pirate"
			  MPos = CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125)
			  SP = "BigMansion"
			end
end
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
    function UpdateIslandESP() 
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if IslandESP then 
                    if v.Name ~= "Sea" then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        else
                            v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end)
        end
    end
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
function UpdateIslandESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then 
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(8, 0, 0)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
for i,v in pairs(game:GetService'Players':GetChildren()) do
    pcall(function()
        if not isnil(v.Character) then
            if ESPPlayer then
                if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Character.Head)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Character.Head
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size10"
                    name.TextWrapped = true
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    if v.Team == game.Players.LocalPlayer.Team then
                        name.TextColor3 = Color3.new(0,0,254)
                    else
                        name.TextColor3 = Color3.new(255,0,0)
                    end
                else
                    v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
                end
            else
                if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateChestChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if string.find(v.Name,"Chest") then
            if ChestESP then
                if string.find(v.Name,"Chest") then
                    if not v:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Name == "Chest1" then
                            name.TextColor3 = Color3.fromRGB(109, 109, 109)
                            name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest2" then
                            name.TextColor3 = Color3.fromRGB(173, 158, 21)
                            name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest3" then
                            name.TextColor3 = Color3.fromRGB(85, 255, 255)
                            name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    else
                        v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                    v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateDevilChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if DevilFruitESP then
            if string.find(v.Name, "Fruit") then   
                if not v.Handle:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Handle)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                else
                    v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                end
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end
    end)
end
end
function UpdateFlowerChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if v.Name == "Flower2" or v.Name == "Flower1" then
            if FlowerESP then 
                if not v:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    if v.Name == "Flower1" then 
                        name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(0, 0, 255)
                    end
                    if v.Name == "Flower2" then
                        name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    end
                else
                    v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end   
    end)
end
end
function UpdateRealFruitChams() 
for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 0, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 174, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(251, 255, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
end

function UpdateIslandESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then 
                if v.Name ~= "Sea" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(7, 236, 240)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
for i,v in pairs(game:GetService'Players':GetChildren()) do
    pcall(function()
        if not isnil(v.Character) then
            if ESPPlayer then
                if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Character.Head)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Character.Head
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    if v.Team == game.Players.LocalPlayer.Team then
                        name.TextColor3 = Color3.new(0,255,0)
                    else
                        name.TextColor3 = Color3.new(255,0,0)
                    end
                else
                    v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth : ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
                end
            else
                if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                    v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateChestChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if string.find(v.Name,"Chest") then
            if ChestESP then
                if string.find(v.Name,"Chest") then
                    if not v:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Name == "Chest1" then
                            name.TextColor3 = Color3.fromRGB(109, 109, 109)
                            name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest2" then
                            name.TextColor3 = Color3.fromRGB(173, 158, 21)
                            name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                        if v.Name == "Chest3" then
                            name.TextColor3 = Color3.fromRGB(85, 255, 255)
                            name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    else
                        v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                    end
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                    v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end
    end)
end
end
function UpdateDevilChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if DevilFruitESP then
            if string.find(v.Name, "Fruit") then   
                if not v.Handle:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v.Handle)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v.Handle
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                else
                    v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
                end
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end
    end)
end
end
function UpdateFlowerChams() 
for i,v in pairs(game.Workspace:GetChildren()) do
    pcall(function()
        if v.Name == "Flower2" or v.Name == "Flower1" then
            if FlowerESP then 
                if not v:FindFirstChild('NameEsp'..Number) then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'..Number
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    if v.Name == "Flower1" then 
                        name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(0, 0, 255)
                    end
                    if v.Name == "Flower2" then
                        name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                    end
                else
                    v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                end
            else
                if v:FindFirstChild('NameEsp'..Number) then
                v:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end   
    end)
end
end
function UpdateRealFruitChams() 
for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 0, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(255, 174, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
    if v:IsA("Tool") then
        if RealFruitESP then 
            if not v.Handle:FindFirstChild('NameEsp'..Number) then
                local bill = Instance.new('BillboardGui',v.Handle)
                bill.Name = 'NameEsp'..Number
                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                bill.Size = UDim2.new(1,200,1,30)
                bill.Adornee = v.Handle
                bill.AlwaysOnTop = true
                local name = Instance.new('TextLabel',bill)
                name.Font = Enum.Font.GothamSemibold
                name.FontSize = "Size14"
                name.TextWrapped = true
                name.Size = UDim2.new(1,0,1,0)
                name.TextYAlignment = 'Top'
                name.BackgroundTransparency = 1
                name.TextStrokeTransparency = 0.5
                name.TextColor3 = Color3.fromRGB(251, 255, 0)
                name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            else
                v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
            end
        else
            if v.Handle:FindFirstChild('NameEsp'..Number) then
                v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
            end
        end 
    end
end
end

spawn(function()
while wait() do
    pcall(function()
        if MobESP then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild('HumanoidRootPart') then
                    if not v:FindFirstChild("MobEap") then
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")

                        BillboardGui.Parent = v
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "MobEap"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.GothamBold
                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                        TextLabel.Text.Size = 35
                    end
                    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                    v.MobEap.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                end
            end
        else
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild("MobEap") then
                    v.MobEap:Destroy()
                end
            end
        end
    end)
end
end)

spawn(function()
while wait() do
    pcall(function()
        if SeaESP then
            for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                if v:FindFirstChild('HumanoidRootPart') then
                    if not v:FindFirstChild("Seaesps") then
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")

                        BillboardGui.Parent = v
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "Seaesps"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.GothamBold
                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                        TextLabel.Text.Size = 35
                    end
                    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                    v.Seaesps.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                end
            end
        else
            for i,v in pairs (game:GetService("Workspace").SeaBeasts:GetChildren()) do
                if v:FindFirstChild("Seaesps") then
                    v.Seaesps:Destroy()
                end
            end
        end
    end)
end
end)

spawn(function()
while wait() do
    pcall(function()
        if NpcESP then
            for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                if v:FindFirstChild('HumanoidRootPart') then
                    if not v:FindFirstChild("NpcEspes") then
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")

                        BillboardGui.Parent = v
                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        BillboardGui.Active = true
                        BillboardGui.Name = "NpcEspes"
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.LightInfluence = 1.000
                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                        TextLabel.Font = Enum.Font.GothamBold
                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                        TextLabel.Text.Size = 35
                    end
                    local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                    v.NpcEspes.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                end
            end
        else
            for i,v in pairs (game:GetService("Workspace").NPCs:GetChildren()) do
                if v:FindFirstChild("NpcEspes") then
                    v.NpcEspes:Destroy()
                end
            end
        end
    end)
end
end)

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdateIslandMirageESP() 
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
    pcall(function()
        if MirageIslandESP then 
            if v.Name == "Mirage Island" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end

function isnil(thing)
return (thing == nil)
end
local function round(n)
return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)

function UpdateAfdESP() 
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
        if AfdESP then 
            if v.Name == "Advanced Fruit Dealer" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end

function UpdateAuraESP() 
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
        if AuraESP then 
            if v.Name == "Master of Enhancement" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end

function UpdateLSDESP() 
for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
    pcall(function()
        if LADESP then 
            if v.Name == "Legendary Sword Dealer" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end

function UpdateGeaESP() 
for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
    pcall(function()
        if GearESP then 
            if v.Name == "MeshPart" then
                if not v:FindFirstChild('NameEsp') then
                    local bill = Instance.new('BillboardGui',v)
                    bill.Name = 'NameEsp'
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1,200,1,30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    local name = Instance.new('TextLabel',bill)
                    name.Font = "Code"
                    name.FontSize = "Size14"
                    name.TextWrapped = true
                    name.Size = UDim2.new(1,0,1,0)
                    name.TextYAlignment = 'Top'
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                    v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                end
            end
        else
            if v:FindFirstChild('NameEsp') then
                v:FindFirstChild('NameEsp'):Destroy()
            end
        end
    end)
end
end
local foldername = "Rise Hub Update 1"
local filename = foldername.."/Setting.json"
function V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    local HttpService = game:GetService("HttpService")
    local json = HttpService:JSONEncode(_G)
    if true then
        if isfolder(foldername) then
            if isfile(filename) then
                writefile(filename, json)
            else
                writefile(filename, json)
            end
        else
            makefolder(foldername)
        end
    end
end
function V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxec()
    local HttpService = game:GetService("HttpService")
    if isfolder(foldername) then
        if isfile(filename) then
            _G = HttpService:JSONDecode(readfile(filename))
        end
    end
end
    function AutoHaki()
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end
    function UnEquipWeapon(Weapon)
        if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
            _G.NotAutoEquip = true
            wait(.5)
            game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
            wait(.1)
            _G.NotAutoEquip = false
        end
    end
    function EquipWeapon(ToolSe)
        if not game.Players.LocalPlayer.Character:FindFirstChild(ToolSe) then
            if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
                Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
            end
        end
    end
function EquipAllWeapon()
        pcall(function()
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA('Tool') and not (v.Name == "Summon Sea Beast" or v.Name == "Water Body" or v.Name == "Awakening") then
                    local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
                    wait(1)
                end
            end
        end)
    end    
function MaterialMon()
			if _G.SeliMarteriel == "Radioactive Material" then
			  MMon = "Factory Staff"
			  MPos = CFrame.new(-507.7895202636719, 72.99479675292969, -126.45632934570312)
			  SP = "Bar"
			elseif _G.SeliMarteriel == "Mystic Droplet" then
			  MMon = "Water Fighter"
			  MPos = CFrame.new(-3214.218017578125, 298.69952392578125, -10543.685546875)
			  SP = "ForgottenIsland"
			elseif _G.SeliMarteriel == "Magma Ore" then
			  if game.PlaceId == 2753915549 then
			    MMon = "Military Spy"
			    MPos = CFrame.new(-5850.2802734375, 77.28675079345703, 8848.6748046875)
			    SP = "Magma"
			  elseif game.PlaceId == 4442272183 then
			    MMon = "Lava Pirate"
			    MPos = CFrame.new(-5234.60595703125, 51.953372955322266, -4732.27880859375)
			    SP = "CircleIslandFire"
			  end
			elseif _G.SeliMarteriel == "Angel Wings" then
			  MMon = "Royal Soldier"
			  MPos = CFrame.new(-7827.15625, 5606.912109375, -1705.5833740234375)
			  SP = "Sky2"
			elseif _G.SeliMarteriel == "Leather" then
			  if game.PlaceId == 2753915549 then
			    MMon = "Pirate"
			    MPos = CFrame.new(-1211.8792724609375, 4.787090301513672, 3916.83056640625)
			    SP = "Pirate"
			  elseif game.PlaceId == 4442272183 then
			    MMon = "Marine Captain"
			    MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
			    SP = "Greenb"
			  elseif game.PlaceId == 7449423635 then
			    MMon = "Jungle Pirate"
			    MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
			    SP = "PineappleTown"
			  end
			elseif _G.SeliMarteriel == "Scrap Metal" then
			  if game.PlaceId == 2753915549 then
			    MMon = "Brute"
			    MPos = CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125)
			    SP = "Pirate"
			  elseif game.PlaceId == 4442272183 then
			    MMon = "Mercenary"
			    MPos = CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125)
			    SP = "DressTown"
			  elseif game.PlaceId == 7449423635 then
			    MMon = "Pirate Millionaire"
			    MPos = CFrame.new(-289.6311950683594, 43.8282470703125, 5583.66357421875)
			    SP = "Default"
			  end
			elseif _G.SeliMarteriel == "Demonic Wisp" then
			  MMon = "Demonic Soul"
			  MPos = CFrame.new(-9503.388671875, 172.139892578125, 6143.0634765625)
			  SP = "HauntedCastle"
			elseif _G.SeliMarteriel == "Vampire Fang" then
			  MMon = "Vampire"
			  MPos = CFrame.new(-5999.20458984375, 6.437741279602051, -1290.059326171875)
			  SP = "Graveyard"
			elseif _G.SeliMarteriel == "Conjured Cocoa" then
			  MMon = "Chocolate Bar Battler"
			  MPos = CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375)
			  SP = "Chocolate"
			elseif _G.SeliMarteriel == "Dragon Scale" then
			  MMon = "Dragon Crew Warrior"
			  MPos = CFrame.new(5824.06982421875, 51.38640213012695, -1106.694580078125)
			  SP = "Hydra1"
			elseif _G.SeliMarteriel == "Gunpowder" then
			  MMon = "Pistol Billionaire"
			  MPos = CFrame.new(-379.6134338378906, 73.84449768066406, 5928.5263671875)
			  SP = "Default"
			elseif _G.SeliMarteriel == "Fish Tail" then
			  MMon = "Fishman Captain"
			  MPos = CFrame.new(-10961.0126953125, 331.7977600097656, -8914.29296875)
			  SP = "PineappleTown"
			elseif _G.SeliMarteriel == "Mini Tusk" then
			  MMon = "Mythological Pirate"
			  MPos = CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125)
			  SP = "BigMansion"
			end
end

local Player = game.Players
local Local_Player = Player.LocalPlayer
local Char = Local_Player.Character
local Root = Char.HumanoidRootPart
Players = game.Players

recentlySpawn = 0

SeaIndex = World3 and 3 or World2 and 2 or World1 and 1 or Local_Player:Kick("Didn't update this Sea")
CanTeleport = {
    {
        ["Sky3"] = Vector3.new(-7894, 5547, -380),
        ["Sky3Exit"] = Vector3.new(-4607, 874, -1667),
        ["UnderWater"] = Vector3.new(61163, 11, 1819),
        ["UnderwaterExit"] = Vector3.new(4050, -1, -1814),
    },
    {
        ["Swan Mansion"] = Vector3.new(-390, 332, 673),
        ["Swan Room"] = Vector3.new(2285, 15, 905),
        ["Cursed Ship"] = Vector3.new(923, 126, 32852),
        ["Zombie Island"] = Vector3.new(-6509, 83, -133),
    },
    {
        ["Floating Turtle"] = Vector3.new(-12462, 375, -7552),
        ["Hydra Island"] = Vector3.new(5745, 610, -267),
        ["Mansion"] = Vector3.new(-12462, 375, -7552),
        ["Castle"] = Vector3.new(-5036, 315, -3179),
        ["Beautiful Pirate"] = Vector3.new(5319, 23, -93),
        ["Beautiful Room"] = Vector3.new(5314.58203, 22.5364361, -125.942276, 1, 2.14762768e-08, -1.99111154e-13, -2.14762768e-08, 1, -3.0510602e-08, 1.98455903e-13, 3.0510602e-08, 1),
        ["Temple of Time"] = Vector3.new(28286, 14897, 103),
    }
}

dist = function(a, b, noHeight)
    local vector_a = Vector3.new(a.X, not noHeight and a.Y or 0, a.Z)

    local success, result = pcall(function()
        if not b then
            while true do
                local Root = Local_Player.Character and Local_Player.Character:FindFirstChild("HumanoidRootPart")
                if Root and Root.Position then
                    b = Root.Position
                    break
                end
                wait(.5) 
            end
        end

        local vector_b = Vector3.new(b.X, not noHeight and b.Y or 0, b.Z)
        return (vector_a - vector_b).magnitude
    end)

    if success then
        return result
    else
        warn("Dist", result)
        return nil
    end
end

InArea = function(Pos,Location)
    local nearest,scale = nil,0
    if Location then
        if dist(Pos,Location.Position,true) <= (Location.Mesh.Scale.X/2)+500 then
            return Location
        end
    end
    for i,v in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
        if dist(Pos,v.Position,true) <= (v.Mesh.Scale.X/2)+500 then
            if scale < v.Mesh.Scale.X then
                scale = v.Mesh.Scale.X
                nearest = v
            end
        end
    end
    return nearest
end

function Raiding()
    return Local_Player.PlayerGui.Main.Timer.Visible or StartingRaid
end

function Check_Fruit_Inventory()
    local Backpack = Local_Player.Backpack:GetChildren()
    for i=1,#Backpack do local v = Backpack[i]
        if v.Name:lower():find("fruit") then
            return true
        end
    end
    local Character = Local_Player.Character:GetChildren()
    for i=1,#Character do local v = Character[i]
        if v:IsA("Tool") and v.Name:lower():find("fruit") then
            return true
        end
    end
end

local network = loadstring(game:HttpGet('https://raw.githubusercontent.com/hajibeza/Module/main/network.lua'))()

CollectionService = game:GetService("CollectionService")

Use_Remote = function(...)
    local ARGS = {...}
    local Data = network:Send("CommF_",...)
    if ARGS[1] == "requestEntrance" then
        CollectionService:AddTag(Local_Player,"Teleporting")
        task.delay(3,function()
            CollectionService:RemoveTag(Local_Player,"Teleporting")
        end)
        wait(.25)
    end
    return Data
end

function TP(...)
    local function Convert_To_CFrame(value)
        if typeof(value) == "Vector3" then
            return CFrame.new(value)
        elseif typeof(value) == "CFrame" then
            return value
        else
            return nil
        end
    end
    local target = Convert_To_CFrame(...)
    if not Local_Player.Character:FindFirstChild("HumanoidRootPart") then return end
    if tweenPause then return end
    local thisId
    local s,e = pcall(function()
        local Dista,distm,middle = dist(target,nil,true),1/0
        if Local_Player.Character:FindFirstChild("HumanoidRootPart") and Dista >= 2000 and tick() - recentlySpawn > 5 then
            for i,v in pairs(CanTeleport[SeaIndex]) do
                local distance = dist(v,target,true)
                if distance < dist(target,nil,true) and distance < distm then
                    distm,middle = distance,v
                end
            end
            if middle and InArea(Local_Player.Character.HumanoidRootPart.Position) ~= InArea(middle) and not Raiding() then
                Use_Remote("requestEntrance",middle)
            end
            if Local_Player.Character:FindFirstChild("HumanoidRootPart") and not Raiding() and not Check_Fruit_Inventory() and _G.ResetTP then
                local Area = InArea(target.p)
                local MyArea = InArea(Local_Player.Character.HumanoidRootPart.Position)
                local SpawnPoint = workspace["_WorldOrigin"].PlayerSpawns[Local_Player.Team.Name]:GetChildren()
                local dista,distm,charDist,nearest = 2000,9000
                for i,v in pairs(SpawnPoint) do
                    local Position = v:GetPivot().p
                    local distance = dist(target.p,Position,true)
                    if distance <= dista then
                        charDist = dist(Position,nil,true)
                        dista,nearest = distance,v
                    end
                end
                wait(.5)
                local Dista = dist(target,nil,true)
                if nearest and (charDist <= 9200) and Dista >= 2000 then
                    if not Local_Player.Character:FindFirstChild("Humanoid") then return end
                    if not Local_Player.Character:FindFirstChild("HumanoidRootPart") then return end
                    if Local_Player.Character.HumanoidRootPart:FindFirstChild("Died") then
                        Local_Player.Character.HumanoidRootPart.Died:Destroy()
                    end
                    repeat task.wait(0.01)
                        pcall(task.spawn,Use_Remote,"SetLastSpawnPoint",nearest.Name)
                    until Local_Player.Data.LastSpawnPoint.Value == nearest.Name
                    pcall(function()
                        Local_Player.Character.Humanoid:ChangeState(15)
                    end)
                    repeat wait(.1) until Local_Player.Character.HumanoidRootPart.Parent
                end
            end
        end
        if tweenActive and lastTweenTarget and (dist(target, lastTweenTarget) < 10 or dist(lastTweenTarget) >= 10) then
            return
        end        
        tweenid = (tweenid or 0) + 1 
        lastTweenTarget = target
        thisId = tweenid
        Util = require(game:GetService("ReplicatedStorage").Util)
        if Util.FPSTracker.FPS > 60 then
            setfpscap(200)
        end
        
        task.spawn(pcall,function()
            lastPos = {tick(),target}
            local currentDistance = dist(Local_Player.Character.HumanoidRootPart.Position, target, true)
            local oldDistance = currentDistance
            Local_Player.Character.Humanoid:SetStateEnabled(13,false)
            if getgenv().TweenPosY then
            if currentDistance > 60 then
                Local_Player.Character.HumanoidRootPart.CFrame = CFrame.new(Local_Player.Character.HumanoidRootPart.Position.X, Local_Player.Character.HumanoidRootPart.Position.Y + 200, Local_Player.Character.HumanoidRootPart.Position.Z)
            else
                Local_Player.Character.HumanoidRootPart.CFrame = CFrame.new(target.Position.X, target.Position.Y, target.Position.Z)
            end
         else
            Local_Player.Character.HumanoidRootPart.CFrame = CFrame.new(Local_Player.Character.HumanoidRootPart.CFrame.X,target.Y,Local_Player.Character.HumanoidRootPart.CFrame.Z)
           end
            while Local_Player.Character:FindFirstChild("HumanoidRootPart") and currentDistance > 75 and thisId == tweenid and Local_Player.Character.Humanoid.Health > 0 do
                local Percent = (58/math.clamp(Util.FPSTracker.FPS,0,60))
                local Speed = 6*Percent
                local Current = Local_Player.Character.HumanoidRootPart.Position
                local Dift = Vector3.new(target.X,0,target.Z) - Vector3.new(Current.X,0,Current.Z)
                local Sx =  (Dift.X < 0 and -1 or 1)*Speed
                local Sz =  (Dift.Z < 0 and -1 or 1)*Speed
                local SpeedX = math.abs(Dift.X) < Sx and Dift.X or Sx
                local SpeedZ = math.abs(Dift.Z) < Sz and Dift.Z or Sz
                task.spawn(function()
                    currentDistance = dist(Local_Player.Character.HumanoidRootPart.Position, target, true)
                    if currentDistance > oldDistance + 10 then
                        tweenid = -1
                        tweenPause = true
                        Local_Player.Character.HumanoidRootPart.Anchored = true
                        wait(1)
                        tweenPause = false
                        Local_Player.Character.HumanoidRootPart.Anchored = false
                    end
                    oldDistance = currentDistance
                end)
                Local_Player.Character.HumanoidRootPart.CFrame = Local_Player.Character.HumanoidRootPart.CFrame + Vector3.new(math.abs(SpeedZ) < (5*Percent) and SpeedX or SpeedX/1.5, 0, math.abs(SpeedX) < (5*Percent) and SpeedZ or SpeedZ/1.5)
                tweenActive = true
                task.wait()
            end
            Local_Player.Character.Humanoid:SetStateEnabled(13,true)
            tweenActive = false
            if currentDistance <= 100 and thisId == tweenid then
                Local_Player.Character.HumanoidRootPart.CFrame = target
            end
        end)
    end)
    if not s then warn("TP :",e) end
    return thisId
end
    spawn(function()
			while task.wait() do
				pcall(function()
					if getgenv().AutoRipChan or getgenv().TweenFrozen or getgenv().KillLeviathan or getgenv().AutoLeviathan or _G.FimiMarteriu or RiseTrialPro or _G.AutoAdvanceDungeon or _G.RaceCua or _G.TweenToKitsune or getgenv().NormalFarm or _G.ChichKatane or getgenv().NearMob or _G.Trylux or _G.Pray or  _G.LetV4 or _G.AutuTouchHaki or getgenv().AutoKata or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or getgenv().touchbad or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.KillFishCrew or _G.KillTerrorShark or _G.KillShark or _G.KillPiranha or _G.RipIndraKill or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.AutoSeaBest or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.UnknownBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or getgenv().NormalFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.AutoBoneQuestion or PirateShip or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.QuestSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.d or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or AutoFarmChest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.AutoKai or _G.TeleportNPC or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or getgenv().secretis or _G.AutoFarmDungeon or _G.AutoRaidPirate or _G.AutoQuestRace or getgenv().HeyGearComeHere or getgenv().AutoFarm or _G.RaidPirate or _G.AutoPlayerHunter or _G.AutoFactory or Grab_Chest or Tween_Fruit or KillPlayer or KillPlayerSpam or _G.SeaBeasts1 then
						if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
							local Noclip = Instance.new("BodyVelocity")
							Noclip.Name = "BodyClip"
							Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
							Noclip.MaxForce = Vector3.new(100000,100000,100000)
							Noclip.Velocity = Vector3.new(0,0,0)
						end
					else
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
					end
				end)
			end
		end)
spawn(function()
  pcall(function()
    game:GetService("RunService").Stepped:Connect(function()
      if getgenv().AutoRipChan or getgenv().TweenFrozen or getgenv().KillLeviathan or getgenv().AutoLeviathan or _G.FimiMarteriu or RiseTrialPro or _G.AutoAdvanceDungeon or _G.RaceCua or _G.TweenToKitsune or _G.ChichKatane or getgenv().NormalFarm or getgenv().NearMob or _G.Trylux or _G.Pray or _G.LetV4 or _G.AutuTouchHaki or getgenv().AutoKata or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or getgenv().touchbad or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.KillFishCrew or _G.KillTerrorShark or _G.KillShark or _G.KillPiranha or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.RipIndraKill or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.AutoSeaBest or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.UnknownBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or getgenv().NormalFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.AutoBoneQuestion or _G.Autoheart or PirateShip or _G.Autodoughking or _G.AutoFarmMaterial or _G.QuestSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.d or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or AutoFarmChest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.AutoKai or _G.TeleportNPC or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or getgenv().secretis or _G.AutoFarmDungeon or _G.AutoRaidPirate or _G.AutoQuestRace or getgenv().HeyGearComeHere or getgenv().AutoFarm or _G.RaidPirate or _G.AutoPlayerHunter or _G.AutoFactory or Grab_Chest or Tween_Fruit or KillPlayer or KillPlayerSpam or _G.SeaBeasts1 then
      for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
      if v:IsA("BasePart") then
      v.CanCollide = false
      end
      end
      end
      end)
    end)
  end)
PosY = 50
spawn(function() 
        while wait() do
            if getgenv().UocDuocChichChi2 then
                Pos = CFrame.new(0,PosY,-50)
                task.wait(0.1)
                Pos = CFrame.new(-50,PosY,0)
                task.wait(0.1)
                Pos = CFrame.new(0,PosY,50)
                task.wait(0.1)
                Pos = CFrame.new(50,PosY,0)
            else
                Pos = CFrame.new(0,PosY,0)
            end
        end
    end)
-- dont care
  local plr = game:GetService("Players").LocalPlayer
    spawn(function()
        pcall(function()
            while wait() do
                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                    if v:IsA("Tool") then
                        if v:FindFirstChild("RemoteFunctionShoot") then 
                            SelectWeaponGun = v.Name
                        end
                    end
                end
            end
        end)
    end)
function StoreFruit()
    for i,v in pairs(thelocal.Backpack:GetChildren()) do
        if v:IsA("Tool") and string.find(v.Name, "Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",v:GetAttribute("OriginalName"),v)
        end
    end
end

function LPH_NO_VIRTUALIZE(func)
    return func
end

function LPH_JIT_MAX(func)
    return func
end
if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
end
NoAttackAnimation = true
local DmgAttack = game:GetService("ReplicatedStorage").Assets.GUI:WaitForChild("DamageCounter")
local PC = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle)
local RL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
local oldRL = RL.wrapAttackAnimationAsync

RL.wrapAttackAnimationAsync = function(a, b, c, d, func)
    if not NoAttackAnimation then
        return oldRL(a, b, c, 60, func)
    end
    local Hits = {}
    local Client = game.Players.LocalPlayer
    local Characters = game:GetService("Workspace").Characters:GetChildren()
    for i, v in pairs(Characters) do
        local Human = v:FindFirstChildOfClass("Humanoid")
        if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 then
            local rootPosition = Human.RootPart.Position
            if rootPosition and Client:DistanceFromCharacter(rootPosition) < 65 then
                table.insert(Hits, Human.RootPart)
            end
        end
    end
    local Enemies = game:GetService("Workspace").Enemies:GetChildren()
    for i, v in pairs(Enemies) do
        local Human = v:FindFirstChildOfClass("Humanoid")
        if Human and Human.RootPart and Human.Health > 0 then
            local rootPosition = Human.RootPart.Position
            if rootPosition and Client:DistanceFromCharacter(rootPosition) < 65 then
                table.insert(Hits, Human.RootPart)
            end
        end
    end
    a:Play(0.01, 0.01, 0.01)
    pcall(func, Hits)
end

getAllBladeHits = LPH_NO_VIRTUALIZE(function(Sizes)
    local Hits = {}
    local Client = game.Players.LocalPlayer
    local Enemies = game:GetService("Workspace").Enemies:GetChildren()
    for i, v in pairs(Enemies) do
        local Human = v:FindFirstChildOfClass("Humanoid")
        if Human and Human.RootPart and Human.Health > 0 then
            local rootPosition = Human.RootPart.Position
            if rootPosition and Client:DistanceFromCharacter(rootPosition) < Sizes + 5 then
                table.insert(Hits, Human.RootPart)
            end
        end
    end
    return Hits
end)

getAllBladeHitsPlayers = LPH_NO_VIRTUALIZE(function(Sizes)
    local Hits = {}
    local Client = game.Players.LocalPlayer
    local Characters = game:GetService("Workspace").Characters:GetChildren()
    for i, v in pairs(Characters) do
        local Human = v:FindFirstChildOfClass("Humanoid")
        if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 then
            local rootPosition = Human.RootPart.Position
            if rootPosition and Client:DistanceFromCharacter(rootPosition) < Sizes + 5 then
                table.insert(Hits, Human.RootPart)
            end
        end
    end
    return Hits
end)

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigEven = game:GetService("ReplicatedStorage").RigControllerEvent
local AttackAnim = Instance.new("Animation")
local AttackCoolDown = 0
local cooldowntickFire = 0
local MaxFire = 1000
local FireCooldown = 0
local FireL = 0
local bladehit = {}

CancelCoolDown = LPH_JIT_MAX(function()
    local ac = CombatFrameworkR.activeController
    if ac and ac.equipped then
        AttackCoolDown = tick() + (FireCooldown or 0.288) + ((FireL / MaxFire) * 0.3)
        RigEven.FireServer(RigEven, "weaponChange", ac.currentWeaponModel.Name)
        FireL = FireL + 1
        task.delay((FireCooldown or 0) + ((FireL + 0.3/ MaxFire) * 0.3), function()
            FireL = FireL - 1
        end)
    end
end)

AttackFunction = LPH_JIT_MAX(function(typef)
    local ac = CombatFrameworkR.activeController
    if ac and ac.equipped then
        local bladehit = {}
        if typef == 1 then
            bladehit = getAllBladeHits(60)
        elseif typef == 2 then
            bladehit = getAllBladeHitsPlayers(65)
        else
            for i2, v2 in pairs(getAllBladeHits(55)) do
                table.insert(bladehit, v2)
            end
            for i3, v3 in pairs(getAllBladeHitsPlayers(55)) do
                table.insert(bladehit, v3)
            end
        end
        if #bladehit > 0 then
            pcall(task.spawn, ac.attack, ac)
            if tick() > AttackCoolDown then
                CancelCoolDown()
            end
            if tick() - cooldowntickFire > 0.5 then
                ac.timeToNextAttack = 0
                ac.hitboxMagnitude = 60
                pcall(task.spawn, ac.attack, ac)
                cooldowntickFire = tick()
            end
            local AMI3 = ac.anims.basic[3]
            local AMI2 = ac.anims.basic[2]
            local REALID = AMI3 or AMI2
            AttackAnim.AnimationId = REALID
            local StartP = ac.humanoid:LoadAnimation(AttackAnim)
            StartP:Play(0, 0, 0)
            RigEven.FireServer(RigEven, "hit", bladehit, AMI3 and 3 or 2, "")
            task.delay(0, function()
                StartP:Stop()
            end)
        end
    end
end)

function CheckStun()
    if game:GetService('Players').LocalPlayer.Character:FindFirstChild("Stun") then
        return game:GetService('Players').LocalPlayer.Character.Stun.Value ~= 0
    end
    return false
end

LPH_JIT_MAX(function()
    spawn(function()
        while game:GetService("RunService").Stepped:Wait() do
            local ac = CombatFrameworkR.activeController
            if ac and ac.equipped and not CheckStun() then
                if NeedAttacking and Fast_Attack then
                    task.spawn(function()
                        pcall(task.spawn, AttackFunction, 1)
                    end)
                elseif DamageAura then
                    task.spawn(function()
                        pcall(task.spawn, AttackFunction, 3)
                    end)
                elseif UsefastattackPlayers and Fast_Attack then
                    task.spawn(function()
                        pcall(task.spawn, AttackFunction, 2)
                    end)
                elseif NeedAttacking and Fast_Attack == false then
                    if ac.hitboxMagnitude ~= 60 then
                        ac.hitboxMagnitude = 60
                    end
                    pcall(task.spawn, ac.attack, ac)
                end
            end
        end
    end)
end)()

LPH_NO_VIRTUALIZE(function()
	function Click()
		game:GetService("VirtualUser"):CaptureController()
		game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
	end
end)()

task.delay(15, function() 
    if hookfunction and not islclosure(hookfunction) then 
        workspace._WorldOrigin.ChildAdded:Connect(function(v)
            if v.Name == 'DamageCounter' then 
                v.Enabled = false 
            end
        end)

        hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Death), function() end)
        hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Respawn), function() end)
        hookfunction(require(game:GetService("ReplicatedStorage"):WaitForChild("GuideModule")).ChangeDisplayedNPC, function() end)
        
        task.spawn(function()
            local NGU, NGUVL
            repeat 
                NGU, NGUVL = pcall(function()
                    for i, v in pairs(getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2].activeController.data) do  
                        if typeof(v) == 'function' then 
                            hookfunction(v, function() end)
                        end
                    end
                end)
                task.wait(1.5)
            until NGU 
        end)
    end 
end)
abc = true
task.spawn(function()
    local a = game.Players.LocalPlayer
    local b = require(a.PlayerScripts.CombatFramework.Particle)
    local c = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
    
    if not shared.orl then
        shared.orl = c.wrapAttackAnimationAsync
    end
    if not shared.cpc then
        shared.cpc = b.play
    end
    
    if abc then
        pcall(function()
            c.wrapAttackAnimationAsync = function(d, e, f, g, h)
                local i = c.getBladeHits(
                    a.Character,
                    {a.Character.HumanoidRootPart},
                    60
                )
                if i then
                    b.play = function()
                    end
                    d:Play(0.1, 0.1, 0.1)
                    h(i)
                    b.play = shared.cpc
                    wait(.5)
                    d:Stop()
                end
            end
        end)
    end
end)

print("Idle") 
    spawn(function()
    while wait(.1) do
        if _G.AUTOHAKI then 
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                local args = {
                    [1] = "Buso"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)
task.spawn(function()
    while wait() do
        pcall(function()
            local player = game.Players.LocalPlayer
            local backpack = player.Backpack
            local character = player.Character
            if _G.SelectWeapon == "Melee" or _G.SelectWeapon == "Sword" then
                for i, v in pairs(backpack:GetChildren()) do
                    if v.ToolTip == _G.SelectWeapon then
                        if backpack:FindFirstChild(v.Name) then
                            _G.SelectWeapon = v.Name
                            if not character:FindFirstChild(v.Name) then
                                player.Character.Humanoid:EquipTool(v)
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
        while wait() do
            pcall(function()
                if _G.AUTOKen then
                    repeat task.wait()
                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            game:GetService('VirtualUser'):CaptureController()
                            game:GetService('VirtualUser'):SetKeyDown('0x65')
                            wait(2)
                            game:GetService('VirtualUser'):SetKeyUp('0x65')
                        end
                    until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not _G.AUTOKen
                end
            end)
        end
    end)    

local function ChangeModeFastAttack(SelectFastAttackMode)
	if SelectFastAttackMode == "Normal Attack" then
		FireCooldown = 0.1
	elseif SelectFastAttackMode == "Fast Attack" then
		FireCooldown = 0.07
	elseif SelectFastAttackMode == "Super Fast Attack" then
		FireCooldown = 0
	end
end
spawn(function()
        while wait() do
            if RemoveNotify then
                game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
            else
                game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
            end
        end
    end)
   
task.spawn(
    function()
        while task.wait() do
            if _G.BringMonster then
                pcall(
                    function()
                        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if
                                not string.find(v.Name, "Boss") and v.Name == MonFarm and
                                    (v.HumanoidRootPart.Position -
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300
                             then
                                if InMyNetWork(v.HumanoidRootPart) then
                                    if InMyNetWork(v.HumanoidRootPart) then
                                        v.HumanoidRootPart.CFrame = PosMon
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                        task.wait(0.1)
                                    end
                                end
                            end
                        end
                    end
                )
            end
        end
    end
)

spawn(function()
	while task.wait() do
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
				if _G.BringMonster then
					if StartMagnet and v.Name == MonFarm or v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						if v.Name == "Factory Staff" then
							if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 5000 then
								v.Head.CanCollide = false
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.CFrame = PosMon
								if v.Humanoid:FindFirstChild("Animator") then
									v.Humanoid.Animator:Destroy()
								end
								sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
							end
						elseif v.Name == MonFarm or v.Name == Mon then
							if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 4500 then
                                v.HumanoidRootPart.CFrame = PosMon
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
							end
						end
					end
				end
			end
		end)
	end
end)

spawn(
    function()
        while task.wait() do
            spawn(
                function()
                    if _G.BringMonster then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if
                                getgenv().NormalFarm and StartMagnet and v.Name == Mon and
                                    (Mon == "Factory Staff" or Mon == "Monkey" or Mon == "Dragon Crew Warrior" or
                                        Mon == "Dragon Crew Archer") and
                                    v:FindFirstChild("Humanoid") and
                                    v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0 and
                                    (v.HumanoidRootPart.Position -
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                        220
                             then
                                v.HumanoidRootPart.CFrame = PosMon
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                task.wait(0.1)
                            elseif
                                getgenv().NormalFarm and StartMagnet and v.Name == Mon and v:FindFirstChild("Humanoid") and
                                    v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0 and
                                    (v.HumanoidRootPart.Position -
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                        220
                             then
                                v.HumanoidRootPart.CFrame = PosMon
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                task.wait(0.1)
                            end
                        end
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
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _G.BringMob and bringmob then
                            if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if v.Name == "Factory Staff" then
                                    if (v.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 500 then
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                        v.HumanoidRootPart.CFrame = FarmPos
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                        task.wait(0.1)
                                    end
                                elseif v.Name == MonFarm then
                                    if (v.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 450 then
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                        v.HumanoidRootPart.CFrame = FarmPos
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    end
                                end
                            end
                            if getgenv().AutoKata and MagnetDought then
                                if
                                    (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or
                                        v.Name == "Head Baker") and
                                        (v.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <=
                                            _G.BringMode and
                                        v:FindFirstChild("Humanoid") and
                                        v:FindFirstChild("HumanoidRootPart") and
                                        v.Humanoid.Health > 0
                                 then
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                    v.HumanoidRootPart.CFrame = FarmPos
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                        end
                    end
                end
            )
        end
    end
)

task.spawn(
    function()
        while true do
            wait()
            if setscriptable then
                setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
            end
            if sethiddenproperty then
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            end
        end
    end
)

function InMyNetWork(object)
    if isnetworkowner then
        return isnetworkowner(object)
    else
        if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
            return true
        end
        return false
    end
end

task.spawn(
    function()
        while task.wait() do
            if MakoriGayMag and _G.BringMonster then
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if
                        not string.find(v.Name, "Boss") and
                            (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                450
                     then
                        if InMyNetWork(v.HumanoidRootPart) then
                            v.HumanoidRootPart.CFrame = PosGay
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            v.HumanoidRootPart.Size = Vector3.new(70, 70, 70)
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            v.Humanoid:ChangeState(11)
                            v.Humanoid:ChangeState(14)
                            task.wait(0.1)
                        end
                    end
                end
            end
        end
    end
)

function BringMob()
    if not BringMobChoosen then
        repeat
            task.wait()
        until BringMobChoosen
    end
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
    if LockCFrame then
        for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if
                (LockCFrame.Position - v.HumanoidRootPart.Position).Magnitude < 350 and
                    (LockCFrame.Position - v.HumanoidRootPart.Position).Magnitude > 3 and
                    chodonandngu(v.HumanoidRootPart.Position)
             then
                v.HumanoidRootPart.CFrame = LockCFrame
                SizePart(v)
                for al, ax in pairs(v:GetDescendants()) do
                    if ax:IsA("BasePart") or ax:IsA("Part") then
                        ax.CanCollide = false
                    end
                end
                task.wait(0.1)
            end
        end
    end
    if BringMobChoosen then
        for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if
                (BringMobChoosen.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 350 and
                    (BringMobChoosen.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude > 3 and
                    GetNearestPlayer(v.HumanoidRootPart.Position)
             then
                v.HumanoidRootPart.CFrame = BringMobChoosen.HumanoidRootPart.CFrame
                SizePart(v)
                for al, ax in pairs(v:GetDescendants()) do
                    if ax:IsA("BasePart") or ax:IsA("Part") then
                        ax.CanCollide = false
                    end
                end
                task.wait(0.1)
            end
        end
    end
end

function tvk1308deptraiso1()
    local c = function1()
    local ao = game.workspace.Enemies:GetChildren()
    if #ao > 1 then
        for ap = 1, #ao do
            for k, v in pairs(game.workspace.Enemies:GetChildren()) do
                if function0(v) and (v.HumanoidRootPart.Position - c.Position).Magnitude < 350 then
                    v.HumanoidRootPart.CFrame = c
                    v.Humanoid:ChangeState(11)
                    v.HumanoidRootPart.CanCollide = false
                    v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                    v.HumanoidRootPart.Transparency = 1
                    for al, f in pairs(v:GetChildren()) do
                        if v:IsA("BasePart") then
                            v.Velocity = Vector3.new(0, 0, 0)
                            v.CanCollide = 0
                            v.Anchored = true
                        end
                    end
                    if v:FindFirstChild("Humanoid") then
                        v.Humanoid.WalkSpeed = 0
                        v.Humanoid.JumpPower = 0
                    else
                        return
                    end
                    if v.Humanoid:FindFirstChild("Animator") then
                        v.Humanoid.Animator:Destroy()
                    end
                    v.Humanoid:ChangeState(11)
                    task.wait(0.1)
                end
            end
        end
    end
end

local az = {}
for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
    if not az[v.Name] or az[v.Name] == nil then
        az[v.Name] = {v.CFrame}
    elseif az[v.Name] then
        table.insert(az[v.Name], v.CFrame)
    end
end
function CheckMobInDistance(aA)
    idot = {["Workspace"] = false, ["ReplicatedStorage"] = false, ["NilInstace"] = false}
    for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if table.find(aA, v.Name) then
            idot["Workspace"] = true
        end
    end
    for r, v in pairs(game.ReplicatedStorage:GetChildren()) do
        if table.find(aA, v.Name) then
            idot["ReplicatedStorage"] = true
        end
    end
    allnilinstance = getnilinstances()
    for r, v in pairs(allnilinstance) do
        if table.find(aA, v.Name) then
            idot["NilInstace"] = true
        end
    end
    return idot
end
function deobiettengi(aB, aC)
    for r, v in pairs(aB) do
        for O, P in pairs(aC) do
            if string.find(v, O) then
                return true
            end
        end
    end
    return false
end
function deobiettengi2(aD, aC)
    for r, v in pairs(aC) do
        if string.find(r, aD) then
            return true
        end
    end
end
function getLargestNumber(aE)
    s = 0
    for r, v in pairs(aE) do
        if type(r) == "number" and r > s then
            s = r
        end
    end
    return s
end
function removeNumber(aD)
    if type(aD) ~= "string" then
        return ""
    end
    str2 = aD:split(" ")
    str3 = ""
    str5 = getLargestNumber(str2)
    for r, v in pairs(str2) do
        if r < str5 then
            if r == 0 then
                str3 = v
            else
                str3 = str3 .. " " .. v
            end
        end
    end
    return str3
end
task.spawn(
    function()
        while task.wait() do
            if bringmob then
                pcall(
                    function()
                        BringMob()
                    end
                )
            end
        end
    end
)
function InMyNetWork(object)
    if isnetworkowner then
        return isnetworkowner(object)
    else
        if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
            return true
        end
        return false
    end
end
task.spawn(
    function()
        while task.wait() do
            pcall(
                function()
                    if _G.AutoFarmNearest and AutoFarmNearestMagnet or SelectMag and _G.BringMonster then
                        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if
                                not string.find(v.Name, "Boss") and
                                    (v.HumanoidRootPart.Position -
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                        _G.BringMode
                             then
                                if InMyNetWork(v.HumanoidRootPart) then
                                    v.HumanoidRootPart.CFrame = PosMon
                                    v.Humanoid.JumpPower = 0
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(70, 70, 70)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    v.Humanoid:ChangeState(11)
                                    v.Humanoid:ChangeState(14)
                                end
                            end
                        end
                    end
                end
            )
        end
    end
)
    function inmyselfss(name)
    local player = game:GetService("Players").LocalPlayer
    local backpack = player:FindFirstChild("Backpack")
    if backpack and backpack:FindFirstChild(name) then
        return backpack[name]
    end
    
    local character = player.Character
    if character then
        local tool = character:FindFirstChild(name)
        if tool and tool:IsA("Tool") then
            return tool
        end
    end
    
    return character:FindFirstChild(name)
end

inmyselfss = LPH_JIT_MAX(function(name)
	if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(name) then
		return game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(name)
	end
	local OutValue
	for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
		if v:IsA("Tool") then
			if v.Name == name then
				OutValue = v
				break
			end
		end
	end
	return OutValue or game:GetService("Players").LocalPlayer.Character:FindFirstChild(name)
end)

spawn(function()
        while wait() do
            if _G.AutoFarmMob then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectMob) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == _G.SelectMob then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        StartMagnet = true
                                        TP(v.HumanoidRootPart.CFrame * Pos)
                                        NeedAttacking = true
                                    until not _G.AutoFarmMob or not v.Parent or v.Humanoid.Health <= 0
                                    StartMagnet = false
                                end
                            end
                        end
                    
                    end
                end)
            end
        end
    end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.Miragenpc and World3 then
                if game:GetService("Workspace").NPCs:FindFirstChild("Advanced Fruit Dealer") then
                    TP(CFrame.new(game:GetService("Workspace").NPCs["Advanced Fruit Dealer"].HumanoidRootPart.Position))
                end
            end
        end
    end)
end)

_G.MagnitudeAdd = 0
spawn(function()
	while wait() do 
		if _G.AutoChestMirage and World3 then
			for i,v in pairs(game:GetService("Workspace"):GetChildren()) do 
				if v.Name:find("FragChest") then
					if game:GetService("Workspace"):FindFirstChild(v.Name) then
						if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000+_G.MagnitudeAdd then
							repeat wait()
								if game:GetService("Workspace"):FindFirstChild(v.Name) then
									TP(v.CFrame)
								end
							until _G.AutoChestMirage == false or not v.Parent
							TP(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
							_G.MagnitudeAdd = _G.MagnitudeAdd+1500
							break
						end
					end
				end
			end
		end
	end
end)

local BonePos = CFrame.new(-9556.03515625, 260.887939453125, 5598.35302734375)
local BoneQuestPos = CFrame.new(-9483.501953125, 146.49444580078125, 5566.70703125)
spawn(function()
    while wait() do 
        if _G.AutoBoneQuestion and not _G.AcceptQuest and not getgenv().MasteryFarm and not getgenv().SwapGun and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or 
                   game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or 
                   game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or 
                   game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                    DamageAura = false
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or 
                            v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") and 
                            v:FindFirstChild("Humanoid") and 
                            v:FindFirstChild("HumanoidRootPart") and 
                            v.Humanoid.Health > 0 then
                            repeat 
                                wait()
                                AutoHaki()
                                EquipWeapon(_G.SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false 
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(5, 40, 7))
                                NeedAttacking = true
                                NameBoneMon = v.Name
                                if v.Name == "Demonic Soul" then
                                    BringMobBone(v.Name, CFrame.new(-9497.908203125, 172.1048126220703, 6148.97119140625))
                                elseif v.Name == "Living Zombie" then
                                    BringMobBone(v.Name, CFrame.new(-10143.466796875, 138.6266632080078, 5974.3330078125))
                                elseif v.Name == "Reborn Skeleton" then
                                    BringMobBone(v.Name, CFrame.new(-8760.986328125, 142.1048126220703, 6039.1083984375))
                                elseif v.Name == "Posessed Mummy" then
                                    BringMobBone(v.Name, CFrame.new(-9575.4267578125, 5.792530536651611, 6226.22900390625))
                                end
                            until not _G.AutoBoneQuestion or not v.Parent or v.Humanoid.Health <= 0
                            DamageAura = false
                        end
                    end
                else
                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BonePos.Position).Magnitude > 1500 then
                            BTP(BonePos) 
                        else
                            TP(BonePos)
                        end
                    else
                        TP(BonePos)
                    end
                    UnEquipWeapon(_G.SelectWeapon)
                    TP(CFrame.new(-9501.90234, 580.085938, 6034.01611, 0.998846233, 4.39209522e-08, -0.0480232015, -4.06256255e-08, 1, 6.95954867e-08, 0.0480232015, -6.75642156e-08, 0.998846233))
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoBoneQuestion and _G.AcceptQuest and not getgenv().MasteryFarm and not getgenv().SwapGun and World3 then
            pcall(function()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, "Living Zombie") then
                    DamageAura = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                
                if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                    DamageAura = false
                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BoneQuestPos.Position).Magnitude > 1500 then
                            BTP(BonePos) 
                        else
                            TP(BoneQuestPos)
                        end
                    else
                        TP(BoneQuestPos)
                    end
                    if (BoneQuestPos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then    
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest1", 2)
                    end
                else
                    local foundMob = false
                    for _, mobName in ipairs({"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}) do
                        if game:GetService("Workspace").Enemies:FindFirstChild(mobName) then
                            foundMob = true
                            break
                        end
                    end
                    if not foundMob then
                        task.defer(function() TP(BonePos) end)
                    else
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and 
                               (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or 
                                v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") then
                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Living Zombie") then
                                    repeat 
                                        wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        AutoHaki()                                            
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(5, 40, 7))
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false
                                        NeedAttacking = true
                                        NameBoneMon = v.Name
                                        if v.Name == "Demonic Soul" then
                                            BringMobBone(v.Name, CFrame.new(-9497.908203125, 172.1048126220703, 6148.97119140625))
                                        elseif v.Name == "Living Zombie" then
                                            BringMobBone(v.Name, CFrame.new(-10143.466796875, 138.6266632080078, 5974.3330078125))
                                        elseif v.Name == "Reborn Skeleton" then
                                            BringMobBone(v.Name, CFrame.new(-8760.986328125, 142.1048126220703, 6039.1083984375))
                                        elseif v.Name == "Posessed Mummy" then
                                            BringMobBone(v.Name, CFrame.new(-9575.4267578125, 5.792530536651611, 6226.22900390625))
                                        end
                                    until not _G.AutoBoneQuestion or v.Humanoid.Health <= 0 or not v.Parent or 
                                          not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                    DamageAura = false
                                end
                            end
                        end
                    end
                    
                    UnEquipWeapon(_G.SelectWeapon)
                end
            end)
        end
    end
end)
function BringMobBone(name, CFrameMon)
    task.spawn(function()
        local function MoveNPC(v, targetCFrame)
            v.Humanoid.WalkSpeed = 0
            v.Humanoid.JumpPower = 0
            v.HumanoidRootPart.CanCollide = false
            v.Head.CanCollide = false
            local offsetY = -2
            local newCFrame = targetCFrame * CFrame.new(0, offsetY, 0)
            v.HumanoidRootPart.CFrame = newCFrame
            if v.Humanoid:FindFirstChild('Animator') then
                v.Humanoid.Animator:Destroy()
            end
            v.Humanoid:ChangeState(11)
            v.Humanoid:ChangeState(14)
        end
        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v.Name == name and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2500 then
                MoveNPC(v, CFrameMon)
            end
        end
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
    end)
end

function BringMobCake(name, CFrameMon)
    task.spawn(function()
        local function MoveNPC(v, targetCFrame)
            v.Humanoid.WalkSpeed = 0
            v.Humanoid.JumpPower = 0
            v.HumanoidRootPart.CanCollide = false
            v.Head.CanCollide = false
            local offsetY = -2
            local newCFrame = targetCFrame * CFrame.new(0, offsetY, 0)
            v.HumanoidRootPart.CFrame = newCFrame
            if v.Humanoid:FindFirstChild('Animator') then
                v.Humanoid.Animator:Destroy()
            end
            v.Humanoid:ChangeState(11)
            v.Humanoid:ChangeState(14)
        end
        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v.Name == name and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2500 then
                MoveNPC(v, CFrameMon)
            end
        end
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
    end)
end

function BringMobRengoku(name, CFrameMon)
    task.spawn(function()
        local function MoveNPC(v, targetCFrame)
            v.Humanoid.WalkSpeed = 0
            v.Humanoid.JumpPower = 0
            v.HumanoidRootPart.CanCollide = false
            v.Head.CanCollide = false
            local offsetY = -2
            local newCFrame = targetCFrame * CFrame.new(0, offsetY, 0)
            v.HumanoidRootPart.CFrame = newCFrame
            if v.Humanoid:FindFirstChild('Animator') then
                v.Humanoid.Animator:Destroy()
            end
            v.Humanoid:ChangeState(11)
            v.Humanoid:ChangeState(14)
        end
        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v.Name == name and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                MoveNPC(v, CFrameMon)
            end
        end
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
    end)
end

	function BringMobSwan(name, CFrameMon)
		task.spawn(function()
			for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
				if v.name == name and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
					v.Humanoid.WalkSpeed = 0
					v.Humanoid.JumpPower = 0
					v.HumanoidRootPart.CanCollide = false
					v.Head.CanCollide = false
					v.HumanoidRootPart.CFrame = CFrameMon
					if v.Humanoid:FindFirstChild('Animator') then
						v.Humanoid.Animator:Destroy()
					end
					v.Humanoid:ChangeState(11)
					v.Humanoid:ChangeState(14)
					sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
				end
			end
		end)
	end
		    spawn(function()
            while wait(.1) do
                if _G.Auto_Random_Bone and World3 then    
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
                end
            end
    end)
    
		spawn(function()
            pcall(function()
                while wait(.1) do
                    if _G.Trylux and World3 then    
                        TP(CFrame.new(-8652.99707, 143.450119, 6170.50879, -0.983064115, -2.48005533e-10, 0.18326205, -1.78910387e-09, 1, -8.24392288e-09, -0.18326205, -8.43218029e-09, -0.983064115))
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent",2)
                    end
                end
            end)
        end)
        
spawn(function()
  while wait(.1) do
    if _G.TelepiToFut then
      for i,v in pairs(game.Workspace:GetChildren()) do
        if string.find(v.Name, "Fruit") then
          TP(v.Handle.CFrame)
        end
      end
    end
  end
end)
spawn(function()
  while wait(.1) do
    if _G.TelepiToFut and _G.TelepiToFutHop then
      for i,v in pairs(game.Workspace:GetChildren()) do
        if string.find(v.Name, "Fruit") then
          TP(v.Handle.CFrame)
        elseif not string.find(v.Name, "Fruit") then
          wait(6)
          game.StarterGui:SetCore("SendNotification", {
          Title = "Server Hop..",
          Text = "",
          Duration = 10,
          })
          Hop()
        end
      end
    end
  end
end)
spawn(function()
  while wait() do
    if _G.AtikiDoughKing and World3 then
      pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
          for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == "Dough King" then
              if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                repeat task.wait()
                  AutoHaki()
                  NeedAttacking = true
                  EquipWeapon(_G.SelectWeapon)
                  v.HumanoidRootPart.CanCollide = false
                  v.Humanoid.WalkSpeed = 0
                  TP(v.HumanoidRootPart.CFrame * CFrame.new(PosX,30,PosZ))
                until not _G.AtikiDoughKing or not v.Parent or v.Humanoid.Health <= 0
              end
            end
          end
        else
          if game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
            TP(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame * CFrame.new(5,10,2))
          end
        end
      end)
    end
  end
end)
        spawn(function()
            while wait() do
                spawn(function()
                    if _G.AutoFactory and World2 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Core") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Core" and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        AutoHaki()         
                                        EquipWeapon(_G.SelectWeapon)           
                                        NeedAttacking = true
                                        TP(CFrame.new(448.46756, 199.356781, -441.389252))                                  
                                    until v.Humanoid.Health <= 0 or _G.AutoFactory == false
                                end
                            end
                        else
                        DamageAura = false
                            TP(CFrame.new(448.46756, 199.356781, -441.389252))
                        end
                    end
                end)
            end
        end)
        
        spawn(function()
	while wait() do
		if _G.AutoRaidPirate and World3 then
			pcall(function()
				local CFrameBoss = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
				if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if _G.AutoRaidPirate and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
							if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
								repeat wait()
									AutoHaki()
									EquipWeapon(_G.SelectWeapon)
									NeedAttacking = true
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									TP(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
								until v.Humanoid.Health <= 0 or not v.Parent or _G.AutoRaidPirate == false
								DamageAura = false
								StartMagnet = false
							end
						end
					end
				else
					if ((CFrameBoss).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1500 then
						TP(CFrameBoss)
					else
						game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5085.23681640625, 316.5072021484375, -3156.202880859375)
					end
				end
			end)
		end
	end
    end)
   
    spawn(function()
        while wait() do
            if _G.AutoElitehunter and World3 then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
						if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
							if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
										if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
											repeat wait()
												AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                NeedAttacking = true
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                TP(v.HumanoidRootPart.CFrame * Pos)
                                                sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                            until _G.AutoElitehunter == false or v.Humanoid.Health <= 0 or not v.Parent
										end
									end
								end
							else
							DamageAura = false
								if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                                    TP(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * Pos)
                                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                                    TP(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * Pos)
                                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                                    TP(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * Pos)
								end
							end                    
						end
					else					
						if _G.AutoEliteHunterHop and game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("EliteHunter") == "I don't have anything for you right now. Come back later." then
							Hop()
						else
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
						end
					end
				end)
			end
		end
	end)
		
    spawn(function()
        while wait() do
            if _G.AutuTouchHaki and World3 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Pure Red")
                wait(0.5)
                repeat
                    TP(CFrame.new(-5414.41357, 309.865753, -2212.45776))
                    wait()
                until not _G.AutuTouchHaki or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5414.41357, 309.865753, -2212.45776)).Magnitude <= 10
    
                if not _G.AutuTouchHaki then break end
                
                wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Snow White")
                wait(0.5)
                repeat
                    TP(CFrame.new(-4971.47559, 331.565765, -3720.02954))
                    wait()
                until not _G.AutuTouchHaki or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-4971.47559, 331.565765, -3720.02954)).Magnitude <= 10
    
                if not _G.AutuTouchHaki then break end
    
                wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Winter Sky")
                wait(0.5)
                repeat
                    TP(CFrame.new(-5420.16602, 1084.9657, -2666.8208))
                    wait()
                   AutuTouchHaki:SetValue(false)
                until not _G.AutuTouchHaki or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5420.16602, 1084.9657, -2666.8208)).Magnitude <= 10
    
                if not _G.AutuTouchHaki then break end
            end
        end
    end)
    

spawn(function()
    pcall(function()
        while wait() do
            if getgenv().AutoRipChan and World3 then
                if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v.Name == "rip_indra True Form" or v.Name == "rip_indra") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                            repeat wait()
                                pcall(function()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    TP(v.HumanoidRootPart.CFrame * Pos)
                                    NeedAttacking = true
                                end)
                            until getgenv().AutoRipChan == false or v.Humanoid.Health <= 0
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("God's Chalice") then
                    repeat
                        TP(CFrame.new(-5563.75048828125, 320.4276123046875, -2662.509521484375))
                        EquipWeapon("God's Chalice")
                    until not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("God's Chalice"))
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") then
                    TP(game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form").HumanoidRootPart.CFrame * Pos)
                end
            end
        end
    end)
end)

spawn(function()
    while wait() do
        if _G.UnknownBoss and World2 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard") then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Darkbeard" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    NeedAttacking = true
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0           
                                    TP(v.HumanoidRootPart.CFrame * Pos)
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.UnknownBoss or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
                    repeat
                        TP(CFrame.new(3778.584228515625, 15.790505409240723, -3499.404052734375))
                        EquipWeapon("Fist of Darkness")
                    until not _G.UnknownBoss
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard") then
                    TP(game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard").HumanoidRootPart.CFrame * Pos)
                end
            end)
        end
    end
end)


    spawn(function()
    while wait() do
        if _G.AutoFarmBossHallow and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if string.find(v.Name , "Soul Reaper") then
                            repeat task.wait()
                                NeedAttacking = true
                                EquipWeapon(_G.SelectWeapon)
                                AutoHaki()
                                
                                TP(v.HumanoidRootPart.CFrame*Pos)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                v.HumanoidRootPart.Transparency = 1
                                -- sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                            until v.Humanoid.Health <= 0 or _G.AutoFarmBossHallow == false
                        end
                    end
                elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
                    repeat TP(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) wait() until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8                        
                    EquipWeapon("Hallow Essence")
                else
                    if game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
                        TP(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                   
                    end
                end
            end)
        end
    end
end)
   
spawn(function()
	while wait() do
		pcall(function()
			if StartMagnet then
				for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if (v.HumanoidRootPart.Position-_G.PosMon.Position).Magnitude <= 200 then
						if v.Humanoid:FindFirstChild("Animator") then
							v.Humanoid.Animator:Destroy()
						end
						v.HumanoidRootPart.CanCollide = false
						v.Head.CanCollide = false
						v.HumanoidRootPart.CFrame = _G.PosMon
						v.Humanoid:ChangeState(11)
						v.Humanoid:ChangeState(14)
						sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius",  math.huge)
					end
				end
			end
		end)
	end
end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoEctoplasm and World2 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if string.find(v.Name, "Ship") then
                                repeat task.wait()
                                NeedAttacking = true
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    if string.find(v.Name,"Ship") then
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        TP(v.HumanoidRootPart.CFrame * Pos)
                                        MonFarm = v.Name
                                        _G.PosMon = v.HumanoidRootPart.CFrame
                                        StartMagnet = true
                                    else
                                        TP(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625))
                                    end
                                until _G.AutoEctoplasm == false or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    else
                    DamageAura = false
                        local Distance = (Vector3.new(911.35827636719, 125.95812988281, 33159.5390625) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if Distance > 18000 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        end
                        TP(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625))
                    end
                end
            end
        end)
    end)
    spawn(function()
        while wait() do
            if _G.AutoFarmBoss then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == _G.SelectBoss then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat wait()
                                        NeedAttacking = true
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        TP(v.HumanoidRootPart.CFrame * Pos) 
                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not _G.AutoFarmBoss or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    DamageAura = false
                        if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                            TP(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * Pos) 
                        end
                    end
                end)
            end
        end
    end)
       
    spawn(function()
        while wait(.1) do
            if _G.RandomFruit then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
            end 
        end
end)
spawn(
    function()
        while task.wait() do
            if _G.AutoStoreFruit then
                pcall(
                    function()
                        if _G.AutoStoreFruit then
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Bomb-Bomb",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Spike-Spike",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Chop-Chop",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Spring-Spring",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Rocket-Rocket",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Smoke-Smoke",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Spin-Spin",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Flame-Flame",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Bird-Bird: Falcon",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Ice-Ice",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Sand-Sand",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Dark-Dark",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Ghost-Ghost",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Diamond-Diamond",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Light-Light",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Love-Love",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Rubber-Rubber",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Barrier-Barrier",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Magma-Magma",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Door Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Door-Door",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit")
                                )
                            end

                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Quake-Quake",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                    "Human-Human: Buddha Fruit"
                                ) or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                                        "Human-Human: Buddha Fruit"
                                    )
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Human-Human: Buddha",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                                        "Human-Human: Buddha Fruit"
                                    )
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Spider-Spider",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                                        "Bird: Phoenix Fruit"
                                    )
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Bird-Bird: Phoenix",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                                        "Bird: Phoenix Fruit"
                                    )
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Rumble-Rumble",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Pain-Pain",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Gravity-Gravity",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Dough-Dough",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Shadow-Shadow",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Venom-Venom",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Control-Control",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Soul Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Soul-Soul",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Dragon-Dragon",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit")
                                )
                                if
                                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or
                                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit")
                                 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "StoreFruit",
                                        "Leopard-Leopard",
                                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit")
                                    )
                                end
                            end
                        end
                    end
                )
            end
            wait(0.3)
        end
    end
)

    FruitList = {
  "Bomb-Bomb",
  "Spike-Spike",
  "Chop-Chop",
  "Spring-Spring",
  "Kilo-Kilo",
  "Spin-Spin",
  "Bird: Falcon",
  "Smoke-Smoke",
  "Flame-Flame",
  "Ice-Ice",
  "Sand-Sand",
  "Dark-Dark",
  "Ghost-Ghost",
  "Diamond-Diamond",
  "Light-Light",
  "Love-Love",
  "Rubber-Rubber",
  "Barrier-Barrier",
  "Magma-Magma",
  "Portal-Portal",
  "Quake-Quake",
  "Human-Human: Buddha",
  "Spider-Spider",
  "Bird-Bird: Phoenix",
  "Rumble-Rumble",
  "Pain-Pain",
  "Gravity-Gravity",
  "Dough-Dough",
  "Venom-Venom",
  "Shadow-Shadow",
  "Control-Control",
  "Soul-Soul",
  "Dragon-Dragon",
  "Leopard-Leopard"
 }
    
    spawn(function()
  pcall(function()
   while wait(.1) do
   if _G.AutoBuyFruitSniper then
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",_G.SelectFruit)
   end
   end
   end)
  end)
    spawn(function()
		while wait(.1) do
			if Tween_Fruit then
				for i,v in pairs(game.Workspace:GetChildren()) do
					if string.find(v.Name, "Fruit") then
						TP(v.Handle.CFrame)
					end
				end
			end
        end
    end)

--\\
local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg,false)
gg.__namecall = newcclosure(function(...)
	local method = getnamecallmethod()
	local args = {...}
	if tostring(method) == "FireServer" then
		if tostring(args[1]) == "RemoteEvent" then
			if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
				if Skillaimbot then
					args[2] = AimBotSkillPosition
					return old(unpack(args))
				end
			end
		end
	end
	return old(...)
end)
spawn(function()
    while wait() do
        pcall(function()
            if UseSkill then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Kill_At / 100 then
                if _G.SkillZ then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                    wait(_G.HoldSKillZ)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                end
                if _G.SkillX then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                    wait(_G.HoldSKillX)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                end
                if _G.SkillC then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                    wait(_G.HoldSKillC)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                end
                if _G.SkillV then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                    wait(_G.HoldSKillV)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                end
                if _G.SkillF then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "F", false, game)
                    wait(_G.HoldSKillF)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "F", false, game)
                end
            end
            end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if UseGunSkill then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.Kill_At / 100 then
                if _G.SkillZ then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                    wait(0.5)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                end
                if _G.SkillX then
                    game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                    wait(0.5)
                    game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                end
            end
            end
            end
        end)
    end
end)
--\\
    		spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoBuyChip then
                    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                        end
                    end
                end
            end
        end)
    end)

local islandNames = {"Island 5", "Island 4", "Island 3", "Island 2", "Island 1"}
spawn(function()
    while wait() do
        if _G.Auto_Dungeon then
			if not game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
                for _, islandName in ipairs(islandNames) do
                    local island = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild(islandName)
                    if island then
                        TP(island.CFrame * CFrame.new(0, 70, 100))
                        break
                    end
                end
			end
        end
    end
end)

		spawn(function()
    while wait() do
        if getgenv().GoDieNigger then
            for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat wait(.1)
                            v.Humanoid.Health = 0
                            v.HumanoidRootPart.CanCollide = false
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        until not getgenv().GoDieNigger  or not v.Parent or v.Humanoid.Health <= 0
                end
            end
        end
    end
end)
		spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_Awakener then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Check")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
                end
            end
        end)
    end)
spawn(function()
while wait() do
if _G.Join then
game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
FlurioreLib:MakeNotify({
    ["Title"] = "Rise Hub |",
    ["Description"] = "Free Scripts",
    ["Color"] = Color3.fromRGB(255, 0, 111),
    ["Content"] = "Start Join JobID...",
    ["Time"] = 1,
    ["Delay"] = 5
})
end
end
end)
if _G.Rejoin then
    if not getgenv().rejoinConnection then
        getgenv().rejoinConnection = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
            if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                FlurioreLib:MakeNotify({
                    ["Title"] = "Rise Hub |",
                    ["Description"] = "Free Scripts",
                    ["Color"] = Color3.fromRGB(255, 0, 111),
                    ["Content"] = "Starting Rejoin Server...",
                    ["Time"] = 1,
                    ["Delay"] = 5
                })
                game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
            end
        end)
    end
else
    if getgenv().rejoinConnection then
        getgenv().rejoinConnection:Disconnect()
        getgenv().rejoinConnection = nil
    end
end
		spawn(function()
			while task.wait() do
				pcall(function()
					if _G.WalkWater then
						game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
					else
						game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
					end
				end)
			end
		end)

-------------
spawn(function()
    pcall(function()
        while wait() do
            if getgenv().HeyGearComeHere and World3 then
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    for i, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
                        if v:IsA("MeshPart") then
                            if v.Material == Enum.Material.Neon then
                                TP(v.CFrame)
                            end
                        end
                    end
                end
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while task.wait() do
            if _G.ScanV4 and game.Players.LocalPlayer.Character.RaceTransformed.Value then
                _G.LetV4 = false
                TP(CFrame.new(-9556.03515625, 260.887939453125, 5598.35302734375))
                local lastNotifyTime = 0
                while _G.ScanV4 do
                    if tick() - lastNotifyTime >= 5 then
                        FlurioreLib:MakeNotify({
                            ["Title"] = "Rise Hub |",
                            ["Description"] = "Free Scripts",
                            ["Color"] = Color3.fromRGB(255, 0, 111),
                            ["Content"] = "Wait V4 is End For Start Farm",
                            ["Time"] = 1,
                            ["Delay"] = 4
                        })
                        lastNotifyTime = tick()
                    end
                    task.wait(1)
                end
            end
        end
    end)
end)


spawn(function()
    while wait() do
        if _G.LetV4 and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton")
                or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie")
                or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul")
                or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat
                                    wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.Head.CanCollide = false
                                    NeedAttacking = true
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                    NameBoneMon = v.Name
                                    if v.Name == "Demonic Soul" then
                                            BringMobBone(v.Name, CFrame.new(-9497.908203125, 172.1048126220703, 6148.97119140625))
                                        elseif v.Name == "Living Zombie" then
                                            BringMobBone(v.Name, CFrame.new(-10143.466796875, 138.6266632080078, 5974.3330078125))
                                        elseif v.Name == "Reborn Skeleton" then
                                            BringMobBone(v.Name, CFrame.new(-8760.986328125, 142.1048126220703, 6039.1083984375))
                                        elseif v.Name == "Posessed Mummy" then
                                            BringMobBone(v.Name, CFrame.new(-9575.4267578125, 5.792530536651611, 6226.22900390625))
                                        end
                                until not _G.LetV4 or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    if BypassTP then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - BonePos.Position).Magnitude > 1500 then
                            print("bypass api check")
                        else
                            TP(BonePos)
                        end
                    else
                        TP(BonePos)
                    end
                    TP(CFrame.new(-9507.03125, 713.654968, 6186.39453))
                    for _, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    pcall(function()
        while wait() do
            if _G.ScanV4 and not game.Players.LocalPlayer.Character.RaceTransformed.Value then
                _G.LetV4 = true
                local lastFarmNotifyTime = 0
                while not _G.ScanV4 do
                    if tick() - lastFarmNotifyTime >= 5 then
                        FlurioreLib:MakeNotify({
                            ["Title"] = "Rise Hub |",
                            ["Description"] = "Free Scripts",
                            ["Color"] = Color3.fromRGB(255, 0, 111),
                            ["Content"] = "Start Farm For Turn On V4",
                            ["Time"] = 1,
                            ["Delay"] = 4
                        })
                        lastFarmNotifyTime = tick()
                    end
                    wait(1)
                end
            end
        end
    end)
end)


task.spawn(function()
    while task.wait() do
        if _G.ScanV4 and game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") 
        and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 
        and not game.Players.LocalPlayer.Character.RaceTransformed.Value then
            local be = game:service("VirtualInputManager")
            be:SendKeyEvent(true, "Y", false, game)
            task.wait()
            be:SendKeyEvent(false, "Y", false, game)
        end
    end
end)

spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.ScanV4 then
                local args = { [1] = true }
                local args = { [1] = "UpgradeRace", [2] = "Buy" }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
            end
        end
    end)
end)

spawn(function()
    while task.wait() do 
        pcall(function()
            if RiseTrialPro and World3 then
                for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                    local player = game.Players.LocalPlayer
                    local character = player.Character                    
                    if v.Name ~= player.Name and (v.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude <= 300 then
                        if v.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                AutoHaki()
                                _G.AUTOKen = true
                                EquipWeapon(_G.SelectWeapon)
                                NameTarget = v.Name
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 3, 3))
                                v.HumanoidRootPart.CanCollide = false
                                ProjectXTrial = true
                                AttackFunctgggggion()
                                NeedAttacking = true
                                UsefastattackPlayers = true
                            until not RiseTrialPro or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end
        end)
    end
end)
spawn(
    function()
        while wait() do
            if ProjectXTrial then
                pcall(
                    function()
                        ac = aQ.activeController
                        ac:attack()
                        AttackFunctgggggion()
                        ac.hitboxMagnitude = 55
                        wait(.1)
                    end
                )
            end
        end
    end
)

spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.XaiSkillZ and RiseTrialPro then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            end
            if _G.XaiSkillX and RiseTrialPro then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            end
            if _G.XaiSkillC and RiseTrialPro then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
            end
        end)
    end
end)

      function UpdateIslandKisuneESP() 
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if KitsuneIslandEsp then 
                    if v.Name == "Kitsune Island" then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "Code"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(80, 245, 245)
                        else
                            v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end)
        end
    end

      spawn(function()
        local kitsuneIsland
        while not kitsuneIsland do
            kitsuneIsland = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
            wait(1)
        end
        while wait() do
            if _G.TweenToKitsune and World3 then
                local shrineActive = kitsuneIsland:FindFirstChild("ShrineActive")
                if shrineActive then
                    for _, v in pairs(shrineActive:GetDescendants()) do
                        if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
                            TP(v.CFrame)
                        end
                    end
                end
            end
        end
    end)

function EquipAllWeapon()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA('Tool') and not (v.Name == "Summon Sea Beast" or v.Name == "Water Body" or v.Name == "Awakening") then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
                wait(1)
			end
		end
	end)
end

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_Rainbow_Haki and World3 then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        TP(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Stone" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        NeedAttacking = true
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            TP(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Island Empress" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        NeedAttacking = true
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            TP(CFrame.new(5713.98877, 601.922974, 202.751251, -0.101080291, -0, -0.994878292, -0, 1, -0, 0.994878292, 0, -0.101080291))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Kilo Admiral" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        NeedAttacking = true
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            TP(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0, 1.00000012, -0, 0.143904924, 0, -0.989591479))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Captain Elephant" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        NeedAttacking = true
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            TP(CFrame.new(-13485.0283, 331.709259, -8012.4873, 0.714521289, 7.98849911e-08, 0.69961375, -1.02065748e-07, 1, -9.94383065e-09, -0.69961375, -6.43015241e-08, 0.714521289))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Beautiful Pirate" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * Pos)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        NeedAttacking = true
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            TP(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
                        end
                    else
                        TP(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan","Bet")
                        end
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoRengoku and World2 then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
                        EquipWeapon("Hidden Key")
                        TP(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                    elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    v.HumanoidRootPart.CanCollide = false
                                    TP(v.HumanoidRootPart.CFrame * Pos)
                                   NeedAttacking = true
                                   NameRengokuMon = v.Name
                                   if v.Name == "Snow Lurker" then
					                   BringMobRengoku(v.Name, CFrame.new(5542.33447, 28.1321411, -6786.04199, 0.746223629, 0, 0.665695369, 0, 1, 0, -0.665695369, 0, 0.746223629))
					              elseif v.Name == "Arctic Warrior" then
					                   BringMobRengoku(v.Name, CFrame.new(6092.98975, 28.3671188, -6236.60791, -0.951801181, 0, -0.306715637, 0, 1, 0, 0.306715637, 0, -0.951801181))
								  end
                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.AutoRengoku == false or not v.Parent or v.Humanoid.Health <= 0
                                DamageAura = false
                            end
                        end
                    else
                        DamageAura = false
                        TP(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
                    end
                end
            end
        end)
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoBartilo and World2 then
                    if game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                            if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate") then
                                Ms = "Swan Pirate"
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Ms then
                                        pcall(function()
                                            repeat task.wait()
                                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                v.HumanoidRootPart.Transparency = 1
                                                v.HumanoidRootPart.CanCollide = false
                                                TP(v.HumanoidRootPart.CFrame * Pos)													
                                                NeedAttacking = true
                                                NameSwanMon = v.Name
                                                if v.Name == "Swan Pirate" then
					                                BringMobSwan(v.Name, CFrame.new(946.045898, 72.9597092, 1228.28796, 0.241395146, 2.32742075e-08, -0.970426917, -1.1568777e-08, 1, 2.11057216e-08, 0.970426917, 6.13183415e-09, 0.241395146))
								            	end
                                            until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            DamageAura = false
                                        end)
                                    end
                                end
                            else
                                repeat TP(CFrame.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08, -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08, -0.973085582)).Magnitude <= 10
                            end
                        else
                            repeat TP(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                            wait(1.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                        end 
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy") then
                            Ms = "Jeremy"
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Ms then
                                    OldCFrameBartlio = v.HumanoidRootPart.CFrame
                                    repeat task.wait()
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                        EquipWeapon(_G.SelectWeapon)
                                        AutoHaki()
                                        v.HumanoidRootPart.Transparency = 1
                                        v.HumanoidRootPart.CanCollide = false
                                        
                                        v.HumanoidRootPart.CFrame = OldCFrameBartlio
                                        TP(v.HumanoidRootPart.CFrame * Pos)
                                        NeedAttacking = true
                                        -- sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                    until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                            repeat TP(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                            wait(1.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
                            wait(1)
                            repeat TP(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                            wait(2)
                        else
                            repeat TP(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                        repeat TP(CFrame.new(-1850.49329, 13.1789551, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10
                        wait(1)
                        repeat TP(CFrame.new(-1858.87305, 19.3777466, 1712.01807)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10
                        wait(1)
                        repeat TP(CFrame.new(-1803.94324, 16.5789185, 1750.89685)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10
                        wait(1)
                        repeat TP(CFrame.new(-1858.55835, 16.8604317, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10
                        wait(1)
                        repeat TP(CFrame.new(-1869.54224, 15.987854, 1681.00659)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1869.54224, 15.987854, 1681.00659)).Magnitude <= 10
                        wait(1)
                        repeat TP(CFrame.new(-1800.0979, 16.4978027, 1684.52368)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10
                        wait(1)
                        repeat TP(CFrame.new(-1819.26343, 14.795166, 1717.90625)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1819.26343, 14.795166, 1717.90625)).Magnitude <= 10
                        wait(1)
                        repeat TP(CFrame.new(-1813.51843, 14.8604736, 1724.79541)) wait() until not _G.AutoBartilo or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1813.51843, 14.8604736, 1724.79541)).Magnitude <= 10
                    end
                end 
            end
        end)
    end)

        spawn(function()
        while task.wait() do
            if AutoSaber and World1 and game.Players.LocalPlayer.Data.Level.Value >= 200 then
                pcall(function()
                    if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
                        if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                            if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                                TP(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                                wait(1)
                            else
                                TP(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
                            end
                        else
                            if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
                                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                                    EquipWeapon("Torch")
                                    TP(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
                                  else
                                  TP(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))
                                end
                            else
                                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","GetCup")
                                    wait(0.5)
                                    EquipWeapon("Cup")
                                    wait(0.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","FillCup",game:GetService("Players").LocalPlayer.Character.Cup)
                                    wait(0)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                                else
                                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == nil then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
										TP(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559)) 
                                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                if v.Name == "Mob Leader" then
                                                   if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") then
                                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                        repeat task.wait()
                                                        AutoHaki()
                                                        EquipWeapon(_G.SelectWeapon)
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.Humanoid.WalkSpeed = 0
                                                                                     
                                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
                                                        game:GetService("VirtualUser"):CaptureController()
                                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                                                        until v.Humanoid.Health <= 0 or not AutoSaber
                                                     end
                                                end
                                                if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
                                                    TP(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader [Lv. 120] [Boss]").HumanoidRootPart.CFrame * Farm_Mode)
                                                end
                                            end
                                        end
                                     end
                                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                                        wait(0.5)
                                        EquipWeapon("Relic")
                                        wait(0.5)
                                        TP(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
                                    end
                                end
                            end
                        end
                    else
                        if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    if v.Name == "Saber Expert" then
                                        repeat task.wait()
                                            EquipWeapon(_G.SelectWeapon)
                                            NeedAttacking = true
                                            TP(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.Humanoid.JumpPower = 0
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.CanCollide = false
                                            --v.Humanoid:ChangeState(11)
                                            --v.Humanoid:ChangeState(14)
                                            FarmPos = v.HumanoidRootPart.CFrame
                                            MonFarm = v.Name
                                            game:GetService'VirtualUser':CaptureController()
                                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),workspace.CurrentCamera.CFrame)
                                        until v.Humanoid.Health <= 0 or not AutoSaber
                                        if v.Humanoid.Health <= 0 then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","PlaceRelic")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)

local CavandisPos = CFrame.new(5314.58203, 22.8796749, -125.942276, 1, 1.69639192e-10, 1.5617945e-15, -1.69639192e-10, 1, 5.38001999e-08, -1.55266783e-15, -5.38001999e-08, 1)
spawn(function()
    while wait() do
        if _G.AutoCarvender and World3 then
            pcall(function()
                local enemies = game:GetService("Workspace").Enemies
                local beautifulPirate = enemies:FindFirstChild("Beautiful Pirate")

                if beautifulPirate then
                    for _, v in pairs(enemies:GetChildren()) do
                        if v.Name == "Beautiful Pirate" then
                            local humanoid = v:FindFirstChild("Humanoid")
                            local humanoidRootPart = v:FindFirstChild("HumanoidRootPart")

                            if humanoid and humanoidRootPart and humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    NeedAttacking = true
                                    EquipWeapon(_G.SelectWeapon)
                                    humanoidRootPart.CanCollide = false
                                    humanoid.WalkSpeed = 0
                                    humanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    TP(humanoidRootPart.CFrame * Pos)
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoCarvender or not v.Parent or humanoid.Health <= 0
                            end
                        end
                    end
                else
                    local player = game.Players.LocalPlayer
                    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local distance = (hrp.Position - CavandisPos.Position).Magnitude
                        if BypassTP then
                            if distance > 1500 then
                            BTP(CavandisPos) 
                            else
                                TP(CavandisPos)
                            end
                        else
                            TP(CavandisPos)
                        end
                        TP(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875))
                        local replicatedStorage = game:GetService("ReplicatedStorage")
                        local storedPirate = replicatedStorage:FindFirstChild("Beautiful Pirate")
                        if storedPirate then
                            TP(storedPirate.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif _G.AutoCavanderhop then
                            Hop()
                        end
                    end
                end
            end)
        end
    end
end)

local ElephantPos = CFrame.new(-13348.0654296875, 405.8904113769531, -8570.62890625)
    spawn(function()
        while wait() do
            if  _G.AutoTwinHook and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Captain Elephant" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                    NeedAttacking = true
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        
                                        TP(v.HumanoidRootPart.CFrame * Pos)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,672))
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.AutoTwinHook or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    DamageAura = false
                    if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - ElephantPos.Position).Magnitude > 1500 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - ElephantPos.Position).Magnitude < 1500 then
                    TP(ElephantPos)
                    end
                else
                    TP(ElephantPos)
                end
                    TP(CFrame.new(-13348.0654296875, 405.8904113769531, -8570.62890625))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant") then
                            TP(game:GetService("ReplicatedStorage"):FindFirstChild("Captain Elephant").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.AutoTwinHook_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

spawn(function()
    while wait() do
        if getgenv().ligisword and World2 then
            pcall(function()
                local args1 = { "LegendarySwordDealer", "1" }
                local args2 = { "LegendarySwordDealer", "2" }
                local args3 = { "LegendarySwordDealer", "3" }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args1))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args2))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args3))
                if getgenv().ligisword_Hop and getgenv().ligisword and World2 then
                NotificationLibrary:SendNotification("Warning", "Server HOP...", 6)
                    wait(5)
                    Hop()
                end
            end)
        end
    end
end)

        spawn(function()
        while wait() do
            if _G.AutoYama and World3 then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
                    repeat wait(.1)
                        fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                    until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
                end
            end
        end
    end)

spawn(function()
        while wait() do
            if  _G.Autotushita and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Longma" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                    NeedAttacking = true
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(PosX,PosY,PosZ))
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    until not  _G.Autotushita or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                    TP(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Longma") then
                            TP(game:GetService("ReplicatedStorage"):FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(2,20,2))
                        else
                            if  _G.Autotushitahop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

        spawn(function()
        while wait() do
            if getgenv().touchbad and World3 then
                pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5749.7861328125, 611.9736938476562, -276.2497863769531))
                    wait(1)
                     TP(CFrame.new(5154.54785, 142.129684, 916.826294, 0.00160392188, 7.16881203e-08, 0.999998689, 4.34501235e-09, 1, -7.1695176e-08, -0.999998689, 4.45999992e-09, 0.00160392188))
                    wait(15)
                    EquipWeapon("Holy Torch")
                    repeat TP(CFrame.new(-10752, 417, -9366)) wait() until not getgenv().touchbad or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10752, 417, -9366)).Magnitude <= 10
					wait(1)
					repeat TP(CFrame.new(-11672, 334, -9474)) wait() until not getgenv().touchbad or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-11672, 334, -9474)).Magnitude <= 10
					wait(1)
					repeat TP(CFrame.new(-12132, 521, -10655)) wait() until not getgenv().touchbad or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12132, 521, -10655)).Magnitude <= 10
					wait(1)
					repeat TP(CFrame.new(-13336, 486, -6985)) wait() until not getgenv().touchbad or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13336, 486, -6985)).Magnitude <= 10
					wait(1)
					repeat TP(CFrame.new(-13489, 332, -7925)) wait() until not getgenv().touchbad or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13489, 332, -7925)).Magnitude <= 10
                end)
            end
        end
    end)

spawn(function()
    while wait() do
        if _G.Auto_Stats_Devil_Fruit then
            local args = {
                [1] = "AddPoint",
                [2] = "Demon Fruit",
                [3] = 3
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Gun then
            local args = {
                [1] = "AddPoint",
                [2] = "Gun",
                [3] = 3
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Sword then
            local args = {
                [1] = "AddPoint",
                [2] = "Sword",
                [3] = 3
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Defense then
            local args = {
                [1] = "AddPoint",
                [2] = "Defense",
                [3] = 3
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Melee then
            local args = {
                [1] = "AddPoint",
                [2] = "Melee",
                [3] = 3
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
sex = {"KITTGAMING","ENYU_IS_PRO","FUDD10","BIGNEWS","THEGREATACE","SUB2GAMERROBOT_EXP1","STRAWHATMAIME","SUB2OFFICIALNOOBIE","SUB2NOOBMASTER123","SUB2DAIGROCK","AXIORE","TANTAIGAMIMG","STRAWHATMAINE","JCWK","FUDD10_V2","SUB2FER999","MAGICBIS","TY_FOR_WATCHING","STARCODEHEO","STAFFBATTLE","ADMIN_STRENGTH","DRAGONABUSE"}
        spawn(function()
            pcall(function()
                while wait() do
                    if getgenv().secretis and World3 then
                        if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                            TP(CFrame.new(game:GetService("Workspace").Map.MysticIsland.Center.Position.X,500,game:GetService("Workspace").Map.MysticIsland.Center.Position.Z))
                        end
                    end
                end
            end)
        end)
        
function cleanlag()
    spawn(function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.ClassName == 'Part' 
            or v.ClassName == 'SpawnLocation' 
            or v.ClassName == 'WedgePart' 
            or v.ClassName == 'Terrain' then
                v.Material = 'Plastic'
            end
        end
        for _, v in pairs(game:GetDescendants()) do 
            if v:IsA('Texture') then
                v.Texture = ''
            elseif v:IsA('BasePart') then
                v.Material = 'Plastic'
            end 
        end 
        for _, v in pairs(Players.LocalPlayer.PlayerScripts:GetDescendants()) do
            local unwantedScripts = {
                'RecordMode', 'Fireflies', 'Wind', 'WindShake', 'WindLines', 
                'WaterBlur', 'WaterEffect', 'wave', 'WaterColorCorrection', 
                'WaterCFrame', 'MirageFog', 'MobileButtonTransparency', 
                'WeatherStuff', 'AnimateEntrance', 'Particle', 'AccessoryInvisible'
            }
            if table.find(unwantedScripts, v.Name) then
                v:Destroy()
            end
        end
    end)
end

spawn(function()
    pcall(function()
        while wait() do
            if getgenv().HeyGearComeHere and World3 then
				if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
					for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
						if v:IsA("MeshPart")then 
                            if v.Material ==  Enum.Material.Neon then  
                                TP(v.CFrame)
                            end
                        end
					end
				end
			end
        end
    end)
    end)
local virtualInputManager = game:GetService("VirtualInputManager")
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().NhinMoonThanhSoiCoDoc then
                local moonDir = game.Lighting:GetMoonDirection()
                local lookAtPos = game.Workspace.CurrentCamera.CFrame.p + moonDir * 100
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, lookAtPos)
                virtualInputManager:SendKeyEvent(true, "T", false, game)
                wait(0.1)
                virtualInputManager:SendKeyEvent(false, "T", false, game)
            end
        end)
    end
end)

--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--
--+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+----+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+--

local ScreenGui = Instance.new("ScreenGui")
local Button = Instance.new("ImageButton")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local UICorner = Instance.new("UICorner")
local Sound = Instance.new("Sound")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 50, 0, 50)
Button.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
Button.BackgroundTransparency = 1
Button.Image = "rbxassetid://104822877643590"
UICorner.Parent = Button
UICorner.CornerRadius = UDim.new(1, 0)
Sound.Parent = Button
Sound.SoundId = "rbxassetid://8323804973" -- uwu:3
Sound.Volume = 1
local function createTween(object, targetSize, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(object, tweenInfo, {Size = targetSize})
    return tween
end
Button.MouseButton1Click:Connect(function()
    Sound:Play()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
    local enlargeTween = createTween(Button, UDim2.new(0, 60, 0, 60), 0.1)
    local shrinkTween = createTween(Button, UDim2.new(0, 50, 0, 50), 0.9)
    enlargeTween:Play()
    enlargeTween.Completed:Connect(function()
        shrinkTween:Play()
    end)
end)
Button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local shrinkTween = createTween(Button, UDim2.new(0, 40, 0, 40), 0.1)
        shrinkTween:Play()
    end
end)
Button.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local enlargeTween = createTween(Button, UDim2.new(0, 55, 0, 55), 0.1)
        enlargeTween:Play()
        enlargeTween.Completed:Connect(function()
            createTween(Button, UDim2.new(0, 50, 0, 50), 0.1):Play()
        end)
    end
end)
local dragging = false
local dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    Button.Position = newPos
end
Button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Button.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
Button.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)


--\\ Load Settings
V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxec()
--\\ End
--
--\\ Create Main
    Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/SecretUnknownRise/fuckyou/refs/heads/main/main.lua"))()
    Window = Fluent:CreateWindow({
    Title = "Rise Hub |",
    SubTitle = "Free Scripts",
    TabWidth = 120,
    Size = UDim2.fromOffset(490, 320),
    Acrylic = false, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl 
})
--\\ End
--\\ Create Tab
   Tabs = {
    hi = Window:AddTab({ Title = "Server-Support", Icon = "" }),
    St = Window:AddTab({ Title = "Game-Server", Icon = "" }),    
	Settings = Window:AddTab({ Title = "Config-Tab", Icon = "" }),
    Sh = Window:AddTab({ Title = "Store-Shop", Icon = "" }),
    Main = Window:AddTab({ Title = "Auto-Farm", Icon = "" }),
    stack = Window:AddTab({ Title = "Item-Farm", Icon = "" }), 
    other = Window:AddTab({ Title = "Other-Boss", Icon = "" }), 
    leviathan = Window:AddTab({ Title = "Leviathan Tab", Icon = "" }),    
    cailon = Window:AddTab({ Title = "Kitsune-Mirage", Icon = "" }),   
    RC = Window:AddTab({ Title = "V4-Upgrade", Icon = "" }),
    spl = Window:AddTab({ Title = "Status-Players", Icon = "" }),   
    raid = Window:AddTab({ Title = "Raid-Fruits", Icon = "" }),
    Lc = Window:AddTab({ Title = "Teleport", Icon = "" }),  
    Ms = Window:AddTab({ Title = "Misc", Icon = "" }),   
}
--\\ End
--\\ Tab Select
Window:SelectTab(1)
--\\ End
-- ah i so need discord member can u help me :>? 
--\\ Tab Server Support
Tabs.hi:AddSection("please join my discord :>") 
Tabs.hi:AddButton({
        Title = "Discord Server of Rise Hub",
        Description = "https://discord.gg/P24sKJYapX",
        Callback = function()            
       setclipboard("https://discord.gg/P24sKJYapX") 
       end
    })
Tabs.hi:AddButton({
        Title = "Discord Server of Rise Hub",
        Description = "https://discord.gg/P24sKJYapX",
        Callback = function()            
       setclipboard("https://discord.gg/P24sKJYapX") 
       end
    })
Tabs.hi:AddButton({
        Title = "Discord Server of Rise Hub",
        Description = "https://discord.gg/P24sKJYapX",
        Callback = function()            
       setclipboard("https://discord.gg/P24sKJYapX") 
       end
    })
Tabs.hi:AddButton({
        Title = "Discord Server of Rise Hub",
        Description = "https://discord.gg/P24sKJYapX",
        Callback = function()            
       setclipboard("https://discord.gg/P24sKJYapX") 
       end
    })
Tabs.hi:AddButton({
        Title = "Discord Server of Rise Huby",
        Description = "https://discord.gg/P24sKJYapX",
        Callback = function()            
       setclipboard("https://discord.gg/P24sKJYapX") 
       end
    })
Tabs.hi:AddButton({
        Title = "Discord Server of Rise Huby",
        Description = "https://discord.gg/P24sKJYapX",
        Callback = function()            
       setclipboard("https://discord.gg/P24sKJYapX") 
       end
    })
--\\ End
--\\ Redeem Code
Tabs.Sh:AddButton({
        Title = "Redeem Code",
        Description = "",
        Callback = function()            
function RedeemCode(value)
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
        end
        for i,v in pairs(sex) do
            RedeemCode(v)
        end
        end
    })
--\\ End
--\\ Teleport World 1 - 3
    Tabs.Sh:AddButton({
        Title = "Teleport Old World",
        Description = "",
        Callback = function()            
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
        end
    })
    Tabs.Sh:AddButton({
        Title = "Teleport New World",
        Description = "",
        Callback = function()            
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        end
    })
    Tabs.Sh:AddButton({
        Title = "Teleport Third World",
        Description = "",
        Callback = function()            
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
        end
    })
--\\ End
    Tabs.Sh:AddSection("Mele Section") 
    melees = {
    ["Select"] = function() end,
    ["Black Leg"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end,
    ["Electro"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end,
    ["Fishman Karate"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end,
    ["Dragon Claw"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    end,
    ["Superhuman"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end,
    ["Death Step"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end,
    ["Sharkman Karate"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end,
    ["Electric Claw"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end,
    ["Dragon Talon"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end,
    ["Godhuman"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end,
    ["Sanguine Art"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
    end
}
    Chon_Melee = Tabs.Sh:AddDropdown("Chon_Melee", {
    Title = "Buy Fighting Style",
    Description = "",
    Values = {"Select", "Black Leg", "Electro", "Fishman Karate", "Dragon Claw", "Superhuman", "Death Step", "Sharkman Karate", "Electric Claw", "Dragon Talon", "Godhuman" },
    Multi = false,
    Default = 1,
})
Chon_Melee:SetValue("Select")
Chon_Melee:OnChanged(function(Value)
    getgenv().FightingStyle = Value
    if melees[Value] then
        melees[Value]()
    end
end)
Tabs.Sh:AddSection("Bone Quest Section")
    Toggle = Tabs.Sh:AddToggle("MyToggle", {Title = "Random Bone", Default = _G.Auto_Random_Bone })
    Toggle:OnChanged(function(Value)
		_G.Auto_Random_Bone = Value
		V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
		end)
    Toggle = Tabs.Sh:AddToggle("MyToggle", {Title = "Auto Pray", Default = _G.Pray })
    Toggle:OnChanged(function(Value)
		_G.Pray = Value
		V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
		end)
        Toggle = Tabs.Sh:AddToggle("MyToggle", {Title = "Auto Try Luck", Default = _G.Trylux })
    Toggle:OnChanged(function(Value)
		_G.Trylux = Value
		V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
		end)
    Tabs.Sh:AddSection("Abilitie Section")
    Tabs.Sh:AddButton({Title = "Buy-Buso-Haki [ 25,000 Beli ]", Description = "", Callback = function()            
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
        end
    })
    Tabs.Sh:AddButton({Title = "Buy-Soru [ 100,000 Beli ]", Description = "", Callback = function()            
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
        end
    })
    Tabs.Sh:AddButton({Title = "Buy-Sky-Jump [ 10,000 Beli ]", Description = "", Callback = function()            
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
        end
    })
    Tabs.Sh:AddButton({Title = "Buy Ken Haki [ 750,000 Beli ]", Description = "", Callback = function()            
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
        end
    })
    Tabs.Sh:AddSection("Race & Etc.. Section")
    Tabs.Sh:AddButton({
        Title = "Reroll-Race [ 3,000 Fragments ]",
        Description = "",
        Callback = function()            
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
	    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
        end
    })
        Tabs.Sh:AddButton({Title = "Buy Ghoul Race", Description = "", Callback = function()            
local args = {[1] = "Ectoplasm", [2] = "BuyCheck", [3] = 4}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        local args = {[1] = "Ectoplasm", [2] = "Change", [3] = 4}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    })
        Tabs.Sh:AddButton({
        Title = "Buy-Cyborg-Race",
        Description = "",
        Callback = function()            
local args = {[1] = "CyborgTrainer", [2] = "Buy"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    })
    Tabs.Sh:AddButton({
        Title = "Refund-Stats [ 2,500 Fragments ]",
        Description = "",
        Callback = function()            
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
        end
    })
    local chonmilici = Tabs.Settings:AddDropdown("chonmilici", {
    Title = "Select-Weapon",
    Values = {"Melee", "Sword"},
    Multi = false,
    Default = 1,
})
chonmilici:SetValue("Melee")
chonmilici:OnChanged(function(Value)
    _G.SelectWeapon = Value
end)
Toggle = Tabs.Settings:AddToggle("MyToggle", {Title = "Bring Mob", Default = true})
Toggle:OnChanged(
    function(Mag)
        _G.BringMonster = Mag
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end
)
Tabs.Settings:AddSection("Bypass TP Section")
local resetp = Tabs.Settings:AddToggle("resetp", {
    Title = "Bypass-Teleport",
    Description = "if have cup or key or fruit recommend turn off it",
    Default = false })
    resetp:OnChanged(function(Value)
    _G.ResetTP = Value
end)
Tabs.Settings:AddSection("Tween Settings!!")
local tweenY = Tabs.Settings:AddToggle("tweenY", {
    Title = "Tween Pos Y",
    Description = "teleport to high when tween if turn off = normally tween",
    Default = true })
    tweenY:OnChanged(function(Value)
    getgenv().TweenPosY = Value
end)
local USERACEV3 = Tabs.Settings:AddToggle("UseV3", {Title = "Auto Use Race v3", Default = false })
local USERACEV4 = Tabs.Settings:AddToggle("UseV4", {Title = "Auto Use Race v4", Default = false })
    Toggle = Tabs.Settings:AddToggle("MyToggle", {Title = "Enable-Buso-Haki", Default = true })
    Toggle:OnChanged(function(Value)
        _G.AUTOHAKI = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
Toggle = Tabs.Settings:AddToggle("MyToggle", {Title = "Enable-Ken-Haki", Default = _G.AUTOKen })
    Toggle:OnChanged(function(Value)
        _G.AUTOKen = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
        Toggle = Tabs.Settings:AddToggle("MyToggle", {Title = "Deleted Notification", Default = false })
    Toggle:OnChanged(function(Value)
        RemoveNotify = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
Toggle = Tabs.Settings:AddToggle("MyToggle", {Title = "Fast Attack", Description = "", Default = true })
Toggle:OnChanged(function(Value)
    Fast_Attack = Value
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end) 
local SelectFastAttackMode = (SelectFastAttackMode or "Fast Super Fast Attack")
SelectedFastAttackMode = {"Normal Attack","Fast Attack","Super Fast Attack"}
local SelectedFastAttackModes = Tabs.Settings:AddDropdown("SelectedFastAttackModes", {
	Title = "Delay Fast Attack",
	Values = SelectedFastAttackMode,
	Multi = false,
	Default = SelectFastAttackMode,
})
SelectedFastAttackModes:OnChanged(function(value)
	SelectFastAttackMode = value
	ChangeModeFastAttack(SelectFastAttackMode)
end)
USERACEV3:OnChanged(function(value)
	Enable_RaceV3 = value
	task.spawn(function()
		while Enable_RaceV3 do wait()
			if Enable_RaceV3 then
				game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
			end
		end
	end)
end)
USERACEV4:OnChanged(function(value)
	Enable_RaceV4 = value
	task.spawn(function()
		while Enable_RaceV4 do wait()
			local OpenV4Race = inmyselfss("Awakening")
			if OpenV4Race then
				OpenV4Race.RemoteFunction:InvokeServer(true)
			end
		end
	end)
end)
local Autolivi = Tabs.Main:AddToggle("Autolivi", {
    Title = "Auto Farm Level",
    Description = "turn on and go sleep wating level max",
    Default = false })
    Autolivi:OnChanged(function(Value)
    getgenv().NormalFarm = Value
end)
        function sizepart(v)
    v.HumanoidRootPart.CanCollide = false
    if syn or Fluxus then
        v.Humanoid:ChangeState(11)
    else
        for i,x in next,v:GetDescendants() do 
            if (x:IsA("Part") or x:IsA("MeshPart")) and not string.find(v.Name,"Leg") and  x.CanCollide then 
                x.CanCollide = false 
            end
        end
    end
    if not v.HumanoidRootPart:FindFirstChild("vando") then
        local lock = Instance.new("BodyVelocity")
        lock.Parent = v
        lock.Name = "vando"
        lock.MaxForce = Vector3.new(100000, 100000, 100000)
        lock.Velocity = Vector3.new(0, 0, 0)
    end
end
game:GetService("RunService").RenderStepped:connect(function()
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
end)

function CFrameQuest()
  getgenv().QuestPoses = {}
  for i, v in pairs(getnilinstances()) do 
    if v:IsA("Model") and v:FindFirstChild("Head") and v.Head:FindFirstChild("QuestBBG") and v.Head.QuestBBG.Title.Text == "QUEST" then
      getgenv().QuestPoses[v.Name] = v.Head.CFrame * CFrame.new(0, -2, 2)    
    end
  end
  for i, v in pairs(game.Workspace.NPCs:GetDescendants()) do 
    if v.Name == "QuestBBG" and v.Title.Text == "QUEST" then
      getgenv().QuestPoses[v.Parent.Parent.Name] = v.Parent.Parent.Head.CFrame * CFrame.new(0, -2, 2)    
    end
  end
  getgenv().DialoguesList = {}
  for i, v in pairs(require(game.ReplicatedStorage.DialoguesList)) do
    getgenv().DialoguesList[v] = i
  end
  local kiet = getscriptclosure(game:GetService("Players").LocalPlayer.PlayerScripts.NPC)
    local listremote = {}
    for k,v in pairs(debug.getprotos(kiet)) do 
      if #debug.getconstants(v)==1 then 
        table.insert(listremote, debug.getconstant(v,1))    
      end
    end
  local start=false
  local listtvk = {}
  for k,v in pairs(debug.getconstants(kiet)) do
    if type(v) == "string" then 
      if v == "Players" then 
        start = false
      end
      if not start then 
        if v == "Blox Fruit Dealer" then 
          start = true    
        end  
      else
      end
      if start then 
        table.insert(listtvk,v)    
      end
    end   
  end
  local questpoint1 = {}
  getgenv().questpoint = {}
    for k,v in pairs(listtvk) do 
      if QuestPoses[v] then 
        questpoint1[listremote[k]]=listtvk[k]    
      end
    end
    for i,v in next, questpoint1 do
      getgenv().questpoint[i] = QuestPoses[v]
    end
  getgenv().questpoint["SkyExp1Quest"] = CFrame.new(-7857.28516, 5544.34033, -382.321503, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
end
CFrameQuest()
local UselessQuest = {
  "BartiloQuest",
  "Trainees",
  "MarineQuest",
  "CitizenQuest"
}
local MobsList = {}
getgenv().mob = ''
getgenv().mobv = ""
local Quest = require(game.ReplicatedStorage.Quests)
local function checkquest()
  local lvlPl = plr.Data.Level.Value
  local min = 0
  if lvlPl >= 1450 and game.PlaceId == 4442272183 then 
    getgenv().mobv = "Water Fighter"
    getgenv().mobvv = "ForgottenQuest"
    getgenv().mobvvv = 2
  elseif lvlPl >= 700 and game.PlaceId == 2753915549 then
    getgenv().mobv = "Galley Captain"
    getgenv().mobvv = "FountainQuest"
    getgenv().mobvvv = 2
  else
    for i,v in pairs(Quest) do
      for i1,v1 in pairs(v) do
        local lvlreq = v1.LevelReq
        for i2,v2 in pairs(v1.Task) do
          if lvlPl >= lvlreq and lvlreq >= min and v1.Task[i2] > 1 and not table.find(UselessQuest, tostring(i)) then
            min = lvlreq
            getgenv().mobv = tostring(i2)
            getgenv().mobvv = i
            getgenv().mobvvv = i1
          end
        end
      end
    end
  end
end
function checkdoublquest()
  local a = {}
  for i,v in pairs(Quest) do
    for i1,v1 in pairs(v) do
      local lvlreq = v1.LevelReq
      for i2,v2 in pairs(v1.Task) do
        if i2 == getgenv().mobv then
          for i3,v3 in next,v do
            if v3.LevelReq <= game.Players.LocalPlayer.Data.Level.Value and v3.Name ~= "Town Raid" then
              for i4,v4 in next,v3.Task do
                if v4 > 1 then
                  table.insert(a,i4)
                end
              end
            end
          end
        end
      end
    end
  end
  return a 
end
local v17 = require(game.ReplicatedStorage:WaitForChild("GuideModule"));
function checkquestdata()
  for i,v in next,v17.Data do
    if i == "QuestData" then
      return true
    end
  end
  return false
end
function checknamedoublquest()
  local a 
  if checkquestdata() then
    for i,v in next,v17.Data.QuestData.Task do
      a = i 
    end
  end
  return a 
end
function doublequestdeptrai()
  checkquest()
  local aa = {}
  if getgenv().DoubleQuest and checkquestdata() and  checknamedoublquest() == getgenv().mobv  and #checkdoublquest() >= 2 then
    for i,v in pairs(Quest) do
      for i1,v1 in pairs(v) do
        for i2,v2 in pairs(v1.Task) do
          if tostring(i2) == getgenv().mobv then
            for quest1,quest2 in next,v do
              for quest3,quest4 in next,quest2.Task do
                if  quest3 ~= getgenv().mobv and quest4 > 1 then
                  aa["Name"] = tostring(quest3)
                  aa["NameQuest"] = i
                  aa["ID"] = quest1
                  return aa
                end
              end
            end
          end
        end
      end
    end
  else
    aa["Name"] = getgenv().mobv
    aa["NameQuest"] = getgenv().mobvv
    aa["ID"] = getgenv().mobvvv
    return aa
  end
end
function teleportquestdeptrai(i)
  TP(getgenv().questpoint[tostring(i)]*CFrame.new(0,4,2),true)
end
function getquest()
  if not getgenv().questpoint[tostring(doublequestdeptrai().NameQuest)] then
    CFrameQuest()
    return 
  end
  if (getgenv().questpoint[tostring(doublequestdeptrai().NameQuest)].Position-plr.Character.HumanoidRootPart.Position).magnitude <= 8 then
    task.wait(1)
    if plr.Character.Humanoid.Health > 0 then 
      CommF:InvokeServer("StartQuest", tostring(doublequestdeptrai().NameQuest), doublequestdeptrai().ID)
    end
  else
    teleportquestdeptrai(doublequestdeptrai().NameQuest)
  end
end

local MobBlacklist = {}

function DetectPartSpawnMob(name)
    local name1 
    if string.find(name,"Lv.") then 
        name1 = name:gsub(" %pLv. %d+%p", "")
    end
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
        local stringgsub
        if string.find(v.Name, "Lv.") then 
            stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        end
        if  v:IsA("Part") and ((stringgsub and stringgsub == name) or name == v.Name or (name1 and v.Name == name1)) then
            return v 
        end
    end
    for i, v in pairs(getnilinstances()) do
        local stringgsub
        if string.find(v.Name, "Lv.") then 
            stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        end
        if v:IsA("Part") and ((stringgsub and stringgsub == name) or name == v.Name or (name1 and v.Name == name1)) then
            return v 
        end
    end
end

function TeleportSpawnMob(Path,value)
  if typeof(Path) == "table" then
    if #MobBlacklist >= 4 then 
      MobBlacklist = {}
      return 
    end
    local GetPart
    for i,v in next,Path do
      if not table.find(MobBlacklist,v) then
        GetPart = DetectPartSpawnMob(v)
        repeat task.wait()
          TP(GetPart.CFrame*Pos)
        until  (GetPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 100 or DetectMob(Path) or not value
      end
    end
  else
    GetPart = DetectPartSpawnMob(Path)
    TP(GetPart.CFrame*Pos)
  end
end
function DetectMob(c)
  local dist = math.huge
  local name 
  for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
    local stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
    if  ((typeof(c) == "table" and (table.find(c, v.Name) or table.find(c, stringgsub))) or (v.Name == c or c == stringgsub)) and v:IsA('Model') and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and v:FindFirstChild('HumanoidRootPart') then
      local magnitude = (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
      if magnitude < dist then
        dist = magnitude
        name = v
      end
    end
  end
  return name
end

function Find_Mon_Spawn(Name_Mon)
    local Mon = type(Name_Mon) == "string" and {Name_Mon} or Name_Mon
    local matchingSpawns = {}

    for _, Mob in pairs(Mon) do
        for _, spawn in pairs(workspace["_WorldOrigin"].EnemySpawns:GetChildren()) do
            if spawn.Name:match("^" .. Mob) then
                table.insert(matchingSpawns, spawn)
            end
        end
    end

    return #matchingSpawns > 0 and matchingSpawns or nil
end

function Go_To_Mon_Spawn(Name_Mon,State_Ment)
    local Enemy_Spawn = Find_Mon_Spawn(Name_Mon)
    if not Enemy_Spawn then return end
    for _, spawn in pairs(Enemy_Spawn) do
        if not DetectMob(Name_Mon) and not State_Ment() then
            repeat wait()
                TP(spawn.CFrame * CFrame.new(0, 35, 0))
            until dist(spawn.Position) < 50 or DetectMob(MobLevelFarm) or State_Ment()
        end
    end
    wait(2)
end

spawn(
    function()
        while wait() do
            pcall(
                function()
                    if getgenv().NormalFarm then
                        local MethodFarm
                        local LevelQuest
                        local NameQuest
                        local IDQuest = 2
                        local MobLevelFarm = checknamedoublquest() or ""
                        if not plr.PlayerGui.Main:FindFirstChild("Quest").Visible then
                            getquest()
                        else
                            if not DetectMob(MobLevelFarm) then
                                Go_To_Mon_Spawn(MobLevelFarm,function()
                                    return not getgenv().NormalFarm
                                end)
                            else
                                local v = DetectMob(MobLevelFarm)
                                repeat
                                    wait()
                                    sizepart(v)
                                    TP(v.HumanoidRootPart.CFrame * Pos)
                                    NeedAttacking = true
                                    MonFarm = v.Name
                                    _G.PosMon = v.HumanoidRootPart.CFrame
                                    StartMagnet = true
                                    EquipWeapon(_G.SelectWeapon)
                                until not v or not v.Parent or v.Humanoid.Health == 0 or not getgenv().NormalFarm
                            end
                        end
                    end
                end
            )
        end
    end
)
local farm_near = Tabs.Main:AddToggle("farm_near", {Title = "Farm Near Mob", Description = "Farm Near Level Mob Or Near Position", Default = false })
farm_near:OnChanged(function(Value)
    getgenv().NearMob = Value
end)
spawn(function()
  while wait() do
    if getgenv().NearMob then
      for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name and v:FindFirstChild("Humanoid") then
          if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.CFrame.Position).Magnitude < 1000 then
            if v.Humanoid.Health > 0 then
              repeat wait()
                AutoHaki() 
                v.HumanoidRootPart.CanCollide = false
                v.Humanoid.WalkSpeed = 0
                v.Humanoid.JumpPower = 0
                v.Head.CanCollide = false 
                MonFarm = v.Name
                _G.PosMon = v.HumanoidRootPart.CFrame
                StartMagnet = true
                EquipWeapon(_G.SelectWeapon)
                NeedAttacking = true
                TP(v.HumanoidRootPart.CFrame * Pos) 
              until not getgenv().NearMob or not v.Parent or v.Humanoid.Health <= 0 
            end
          end
        end
      end
    end
  end
end)
local ToggleDoubleQuest = Tabs.Main:AddToggle("ToggleBringMob", {Title = "Double Quest", Description = "", Default = true })
    ToggleDoubleQuest:OnChanged(function(Value)
        getgenv().DoubleQuest = Value
    end)
    Tabs.Main:AddSection("Bone & Cake Prince")
    local katanguuuu = Tabs.Main:AddToggle("katanguuuu", {
    Title = "Auto Katakuri",
    Description = "",
    Default = false })
    katanguuuu:OnChanged(function(value)
    getgenv().AutoKata = value
    end)
local farmbun = Tabs.Main:AddToggle("farmbun", {
    Title = "Auto Bone",
    Description = "",
    Default = _G.AutoBoneQuestion })
    farmbun:OnChanged(function(value)
    _G.AutoBoneQuestion = value
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
    
    local accept = Tabs.Main:AddToggle("accept", {
    Title = "Accept Quest",
    Description = "",
    Default = _G.AcceptQuest })
    accept:OnChanged(function(value)
    _G.AcceptQuest = value
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)

--\\ Aimbot
--\\
--\\ Fast Attack Slow idk ;w;
-- function V02X021X61(shouldAttack)
 --   if not _G.NormalAttack and shouldAttack then
  --      local a3 = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
  --      local a4 = debug.getupvalues(a3)[2]
  --      local a5 = require(game.ReplicatedStorage.Util.CameraShaker)
   --     a5:Stop()
  --      a4.activeController.attacking = false
    --    a4.activeController.timeToNextAttack = 0
  --      a4.activeController.hitboxMagnitude = 180
--        game:GetService "VirtualUser":CaptureController()
  --      local nearestMob = nil
  --      local closestDistance = math.huge 
 --       for _, mob in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
      --      if mob:FindFirstChild("HumanoidRootPart") then
          --      local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - mob.HumanoidRootPart.Position).Magnitude
         --       if distance < closestDistance then
             --       closestDistance = distance
           --         nearestMob = mob
         --       end
     --       end
   --     end
  --      if nearestMob and closestDistance <= 10 then
        --    game:GetService "VirtualUser":Button1Down(Vector2.new(1280, 672))
  --      end
  --  end
--end
--\\ End
local CakePos = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375)
local Cac = game:GetService("Workspace").Enemies
task.spawn(function()
    while task.wait() do
        if getgenv().AutoKata and World3 then
            pcall(function()
                local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local mirrorTransparency = game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency

                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or 
                   (mirrorTransparency == 0 and (playerPos - Vector3.new(-2152.46533, 69.9830399, -12399.1357)).Magnitude > 500) then
                    TP(CFrame.new(-2152.46533, 69.9830399, -12399.1357, 0.998845279, -1.36106415e-08, 0.0480427258, 1.75027015e-08, 1, -8.05917963e-08, -0.0480427258, 8.13396142e-08, 0.998845279))
                    wait(4)
                end

                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Cake Prince" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0))
                                    if game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("Ring") or
                                    game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("Fist") then
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 170, 0))
                                   else
                                   TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0))
                                   end
                                    NeedAttacking = true
                                until not getgenv().AutoKata or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    local foundMob = false
                    for _, mobName in pairs({"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}) do
                        if game:GetService("Workspace").Enemies:FindFirstChild(mobName) then
                            foundMob = true
                            break
                        end
                    end

                    if foundMob then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat
                                        wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(5, 40, 7))
                                        NeedAttacking = true
                                        if v.Name == "Cookie Crafter" then
                                            BringMobCake(v.Name, CFrame.new(-2351.32861328125, 37.7981071472168, -12108.84375))
                                        elseif v.Name == "Cake Guard" then
                                            BringMobCake(v.Name, CFrame.new(-1608.6195068359375, 37.79800796508789, -12381.6044921875))
                                        elseif v.Name == "Baking Staff" then
                                            BringMobCake(v.Name, CFrame.new(-1865.7054443359375, 37.79812240600586, -12856.1416015625))
                                        elseif v.Name == "Head Baker" then
                                            BringMobCake(v.Name, CFrame.new(-2241.444091796875, 53.50244140625, -12868.287109375))
                                        end
                                    until not getgenv().AutoKata or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")
                                    DamageAura = false
                                end
                            end
                        end
                    else
                        if mirrorTransparency == 1 then
                            local RandomTele = math.random(1, 3)
                            if RandomTele == 1 then
                                TP(CFrame.new(-1436.86011, 167.753616, -12296.9512))
                            elseif RandomTele == 2 then
                                TP(CFrame.new(-2383.78979, 150.450592, -12126.4961))
                            elseif RandomTele == 3 then
                                TP(CFrame.new(-2231.2793, 168.256653, -12845.7559))
                            end
                        end

                        if BypassTP then
                            if (playerPos - CakePos.Position).Magnitude > 1500 then
                                BTP(CakePos)
                            else
                                TP(CakePos)
                            end
                        else
                            TP(CakePos)
                        end
                        UnEquipWeapon(_G.SelectWeapon)
                        TP(CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375))
                    end
                end
            end)
        end
    end
end)
    local blablablablabla = Tabs.other:AddParagraph({
        Title = "---------------",
        Content = "material section"
    })
Toggle = Tabs.other:AddToggle("MyToggle", {Title = "Farm Ectoplasm", Default = _G.AutoEctoplasm })
    Toggle:OnChanged(function(Value)
        _G.AutoEctoplasm = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
-------------------------------------
 if World1 then
  MaterialList = {"Magma Ore","Angel Wings","Leather","Scrap Metal","Radioactive Material"}
elseif World2 then
  MaterialList = {
    "Mystic Droplet","Magma Ore","Leather","Scrap Metal","Demonic Wisp","Vampire Fang","Radioactive Material"}
elseif World3 then
  MaterialList = {
    "Leather","Scrap Metal","Vampire Fang","Conjured Cocoa","Dragon Scale","Gunpowder","Fish Tail","Mini Tusk","Radioactive Material"}
end
local SeliMarteriel = Tabs.other:AddDropdown("Dropdown", {
  Title = "Select Material",
  Values = MaterialList,
  Multi = false,
  Default = _G.SeliMarteriel,
})
SeliMarteriel:OnChanged(function(Value)
  _G.SeliMarteriel = Value
  V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end)
local FimiMarteriu = Tabs.other:AddToggle("MyToggle", {Title = "Farm Marterial",Default = _G.FimiMarteriu })
FimiMarteriu:OnChanged(function(Value)
  _G.FimiMarteriu = Value
  V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end)
spawn(function()
  while wait() do
    if _G.FimiMarteriu then
      MaterialMon()
      pcall(function()
        if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
          for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == MMon then
              if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                repeat wait()
                  AutoHaki()
                  EquipWeapon(_G.SelectWeapon)
                  TP(v.HumanoidRootPart.CFrame * CFrame.new(PosX,30,PosZ))
                  MonFarm = v.Name
                  _G.PosMon = v.HumanoidRootPart.CFrame
                  StartMagnet = true
                  NeedAttacking = true
                until _G.FimiMarteriu == false or not v.Parent or v.Humanoid.Health <= 0
              end
            end
          end
        else
          if BypassTP then
            if ((MPos).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1500 then
              TL(MPos)
            else
              BTP(MPos)
            end
          else
            TP(MPos)
          end
        end
      end)
    end
  end
end)
--------------------------------------------------------------------
    local blablablablabla = Tabs.other:AddParagraph({
        Title = "---------------",
        Content = "Mob Section"
    })
if World1 then
	tableMon = {"Bandit","Monkey","Gorilla","Pirate","Brute","Desert Bandit","Desert Officer","Snow Bandit","Snowman","Chief Petty Officer","Sky Bandit","Dark Master","Toga Warrior","Gladiator","Military Soldier","Military Spy","Fishman Warrior","Fishman Commando","God's Guard","Shanda","Royal Squad","Royal Soldier","Galley Pirate","Galley Captain"}
elseif World2 then
	tableMon = {"Raider","Mercenary","Swan Pirate","Factory Staff","Marine Lieutenant","Marine Captain","Zombie","Vampire","Snow Trooper","Winter Warrior","Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate","Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"}
elseif World3 then
	tableMon = {"Pirate Millionaire","Dragon Crew Warrior","Dragon Crew Archer","Female Islander","Giant Islander","Marine Commodore","Marine Rear Admiral","Fishman Raider","Fishman Captain","Forest Pirate","Mythological Pirate","Jungle Pirate","Musketeer Pirate","Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy","Peanut Scout","Peanut President","Ice Cream Chef","Ice Cream Commander","Cookie Crafter","Cake Guard","Baking Staff","Head Baker","Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel","Candy Pirate","Snow Demon","Isle Outlaw","Island Boy","Sun-kissed Warrior","Isle Champion"}
end
if World1 then
deochon = "Bandit"
elseif World2 then
deochon = "Raider"
elseif World3 then
deochon = "Pirate"
end
local chonmobdeeeee = Tabs.other:AddDropdown("chonmobdeeeee", {
    Title = "Select Mob",
    Values = tableMon,
    Multi = false,
    Default = deochon,
})
chonmobdeeeee:SetValue("Select")
chonmobdeeeee:OnChanged(function(Value)
    _G.SelectMob = Value
end)
local batdauchichmob = Tabs.other:AddToggle("batdauchichmob", {
    Title = "Start Farm Mob Select",
    Description = "",
    Default = false })
    batdauchichmob:OnChanged(function(Value)
    _G.AutoFarmMob = Value
end)
--------------------------------------------------------------------
    local blablablablabla = Tabs.other:AddParagraph({
        Title = "---------------",
        Content = "boss section"
    })
    if World1 then
		tableBoss = {"The Gorilla King","Bobby","Yeti","Mob Leader","Vice Admiral","Warden","Chief Warden","Swan","Magma Admiral","Fishman Lord","Wysper","Thunder God","Cyborg","Saber Expert"}
	elseif World2 then
		tableBoss = {"Diamond","Jeremy","Fajita","Don Swan","Smoke Admiral","Cursed Captain","Darkbeard","Order","Awakened Ice Admiral","Tide Keeper"}
	elseif World3 then
		tableBoss = {"Stone","Island Empress","Kilo Admiral","Captain Elephant","Beautiful Pirate","rip_indra True Form","Longma","Soul Reaper","Cake Queen"}
	end
	local Dropdown = Tabs.other:AddDropdown("Dropdown", {
        Title = "Select Boss",
        Values = tableBoss,
        Multi = false,
        Default = _G.SelectBoss,
    })
    Dropdown:SetValue("")
    Dropdown:OnChanged(function(Value)
        _G.SelectBoss = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
    Toggle = Tabs.other:AddToggle("MyToggle", {Title = "Start Farm Boss Select", Default = _G.AutoFarmBoss })
    Toggle:OnChanged(function(Value)
        _G.AutoFarmBoss = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
    local blablablablabla = Tabs.stack:AddParagraph({
        Title = "---------------",
        Content = "fruits section"
    })
 dcmmmmmmmm = Tabs.stack:AddToggle("dcmmmmmmmm", {Title = "Find Fruits", Description = "" ,Default = _G.TelepiToFut })
dcmmmmmmmm:OnChanged(function(Value)
  _G.TelepiToFut = Value
  V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end)
TelepiToFutHop = Tabs.stack:AddToggle("MyToggle", {Title = "Find Fruits Hop", Description = "" ,Default = _G.TelepiToFutHop })
TelepiToFutHop:OnChanged(function(Value)
  _G.TelepiToFutHop = Value
  V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end)
    local blablablablabla = Tabs.stack:AddParagraph({
        Title = "---------------",
        Content = "dough-king section"
    })
local AtikiDoughKing = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Dough King", Description = "Need Spawn First" ,Default = _G.AtikiDoughKing })
AtikiDoughKing:OnChanged(function(Value)
  _G.AtikiDoughKing = Value
  V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end)
    local blablablablabla = Tabs.stack:AddParagraph({
        Title = "---------------",
        Content = "factory sea 2 section"
    })
    Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Factory", Default = _G.AutoFactory })
    Toggle:OnChanged(function(Value)
        _G.AutoFactory = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
        local blablablablabla = Tabs.stack:AddParagraph({
        Title = "---------------",
        Content = "pirate raid section"
    })
        Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Raid Castle", Default = _G.AutoRaidPirate })
    Toggle:OnChanged(function(Value)
        _G.AutoRaidPirate = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
     local blablablablabla = Tabs.stack:AddParagraph({
        Title = "---------------",
        Content = "elite hunter section"
    })
local Elite_Hunter_Status = Tabs.stack:AddParagraph({
        Title = "Status Elite Mob",
        Content = ""
    })
    	spawn(function()
		while wait() do
			spawn(function()
				if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
					Elite_Hunter_Status:SetDesc("Status : 🟢")	
				else
					Elite_Hunter_Status:SetDesc("Status : 🔴")	
				end
			end)
		end
     end) 
 Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Elite", Default = _G.AutoElitehunter })
    Toggle:OnChanged(function(Value)
        _G.AutoElitehunter = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    end)
    Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Elite Hop", Default = _G.AutoEliteHunterHop })
    Toggle:OnChanged(function(Value)
        _G.AutoEliteHunterHop = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
    end)
    local blablablablabla = Tabs.stack:AddParagraph({
        Title = "---------------",
        Content = "rip-indra boss section"
    })
    local AutuTouchHaki = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Touch Pad Haki", Description = "Sea 3 Function" ,Default = false })
AutuTouchHaki:OnChanged(function(Value)
  _G.AutuTouchHaki = Value
end)
 Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Rip Indra", Description = "Need Spawn Boss First" ,Default = getgenv().AutoRipChan })
    Toggle:OnChanged(function(Value)
        getgenv().AutoRipChan = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
     local blablablablabla = Tabs.stack:AddParagraph({
        Title = "---------------",
        Content = "darkbeard boss section"
    })
 Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Darkbeard", Description = "Need Key And Spawn Boss First" ,Default = _G.UnknownBoss })
    Toggle:OnChanged(function(Value)
        _G.UnknownBoss = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
    local blablablablabla = Tabs.stack:AddParagraph({
        Title = "---------------",
        Content = "hallow boss section"
    })
    Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Soul Reaper [ Hallow ]", Description = "Auto Spawn If Have Key" ,Default = _G.AutoFarmBossHallow })
    Toggle:OnChanged(function(Value)
        _G.AutoFarmBossHallow = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
    Tabs.raid:AddSection("Raid Section")
    local Dropdown = Tabs.raid:AddDropdown("Dropdown", {
        Title = "Select Chip",
        Values = {"Dark","Sand","Magma","Rumble","Flame","Ice","Light","Quake","Human: Buddha","Flame","Bird: Phoenix","Dough"},
        Multi = false,
        Default = _G.SelectChip,
    })
    Dropdown:SetValue("Flame")
    Dropdown:OnChanged(function(Value)
        _G.SelectChip = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
    Toggle = Tabs.raid:AddToggle("MyToggle", {Title = "Buy-MicroChip", Default = _G.AutoBuyChip })
    Toggle:OnChanged(function(Value)
   _G.AutoBuyChip = Value
   V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
		end) 
Toggle = Tabs.raid:AddToggle("MyToggle", {Title = "Start-Raid", Default = _G.BatDauRaidNe })
    Toggle:OnChanged(function(Value)
   _G.BatDauRaidNe = Value
   V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
		end) 
spawn(function()
  while wait() do
  if _G.BatDauRaidNe then
    if World2 then
      fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
    elseif World3 then
      fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
    end
    end
  end
end)
killcu = Tabs.raid:AddToggle("killcu", {Title = "Killaura", Default = false })
    killcu:OnChanged(function(Value)
   getgenv().GoDieNigger = Value
		end)
    Toggle = Tabs.raid:AddToggle("MyToggle", {Title = "Next-Island", Default = false })
    Toggle:OnChanged(function(Value)
   _G.Auto_Dungeon = Value
		end)
Toggle = Tabs.raid:AddToggle("MyToggle", {Title = "Auto Awake Fruit", Default = false })
    Toggle:OnChanged(function(Value)
   _G.Auto_Awakener = Value
		end)
		Tabs.raid:AddSection("Fruit Section")
    Toggle = Tabs.raid:AddToggle("MyToggle", {Title = "Random Fruit", Default = _G.RandomFruit })
    Toggle:OnChanged(function(Value)
        _G.RandomFruit = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
    Toggle = Tabs.raid:AddToggle("MyToggle", {Title = "Store Fruit", Default = _G.AutoStoreFruit })
    Toggle:OnChanged(function(Value)
        _G.AutoStoreFruit = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
    local Dropdown = Tabs.raid:AddDropdown("Dropdown", {
        Title = "Snipe Fruits",
        Values = FruitList,
        Multi = false,
        Default = _G.SelectFruit,
    })
    Dropdown:SetValue("")
    Dropdown:OnChanged(function(Value)
        _G.SelectFruit = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
    Toggle = Tabs.raid:AddToggle("MyToggle", {Title = "Buy Fruit Snipe", Default = _G.AutoBuyFruitSniper })
    Toggle:OnChanged(function(Value)
        _G.AutoBuyFruitSniper = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
    Toggle = Tabs.raid:AddToggle("MyToggle", {Title = "Esp Fruit", Default = false })
    Toggle:OnChanged(function(a)
        DevilFruitESP = a
        while DevilFruitESP do wait()
            UpdateDevilChams() 
        end
    end)
    spawn(function()
	    while wait(2) do
		    if DevilFruitESP then
			    UpdateDevilChams() 
		    end
	    end
    end)
    Toggle = Tabs.raid:AddToggle("MyToggle", {Title = "Auto Tween Claim Fruit", Default = Tween_Fruit })
    Toggle:OnChanged(function(Value)
        Tween_Fruit = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
    local Timekl = Tabs.St:AddParagraph({
        Title = "[ Server Age ]",
        Content = ""
    })
    function UpdateTime()
local GameTime = math.floor(workspace.DistributedGameTime+0.5)
local Hour = math.floor(GameTime/(60^2))%24
local Minute = math.floor(GameTime/(60^1))%60
local Second = math.floor(GameTime/(60^0))%60
Timekl:SetDesc("[Time Server] : Hours : "..Hour.. "  Minutes : "..Minute.."  Seconds : "..Second)
end
spawn(function()
 while task.wait() do
 pcall(function()
  UpdateTime()
  end)
 end
 end)
    spawn(function()
        pcall(function()
            while wait() do
    if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
    Kitsune:SetDesc('🟢')
    else
      Kitsune:SetDesc('🔴' )
            end
               end
        end)
end)
    local MobKilled = Tabs.St:AddParagraph({
        Title = "Katakuri Mob",
        Content = ""
    })
            task.spawn(function()
        while wait() do
            pcall(function()
                if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                    MobKilled:SetDesc("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,41))
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                    MobKilled:SetDesc("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,40))
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                    MobKilled:SetDesc("Defeat : "..string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"),39,39))
                else
                    MobKilled:SetDesc("Boss Is Spawning")
                end
            end)
        end
    end)
    local FrozenIsland = Tabs.St:AddParagraph({
        Title = "Dimension Frozen",
        Content = ""
    })
    spawn(function()
    pcall(function()
        while wait() do
            if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                FrozenIsland:SetDesc('🟢')
            else
                FrozenIsland:SetDesc('🔴')
            end
        end
    end)
end)
    local Mirragecheck = Tabs.St:AddParagraph({
        Title = "Mirage",
        Content = ""
    })
    spawn(function()
        pcall(function()
            while wait() do
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Mirage Island') then
    Mirragecheck:SetDesc('🟢')
    else
      Mirragecheck:SetDesc('🔴' )end
            end
        end)
end)
    local FM = Tabs.St:AddParagraph({
        Title = "Moon Check",
        Content = ""
    })
    task.spawn(function()
            while task.wait() do
                pcall(function()
                    if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then
                        FM:SetDesc("Moon: 5/5")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149052" then
                        FM:SetDesc("Moon: 4/5")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709143733" then
                        FM:SetDesc("Moon: 3/5")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709150401" then
                        FM:SetDesc("Moon: 2/5")
                    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149680" then
                        FM:SetDesc("Moon: 1/5")
                    else
                        FM:SetDesc("Moon: 0/5")
                    end
                end)
            end
    end)
    Tabs.St:AddSection("Job ID Section")
    local Input = Tabs.St:AddInput("Input", {
        Title = "Job Id",
        Default = "",
        Placeholder = "Paste Job Id",
        Numeric = false, 
        Finished = false, 
        Callback = function(Value)
            _G.Job = Value
        end
    })
    Tabs.St:AddButton({
        Title = "Copy Job ID Your Server",
        Description = "",
        Callback = function()
            setclipboard(tostring(game.JobId))
        end
    })
    Tabs.St:AddButton({
        Title = "Join Job ID",
        Description = "",
        Callback = function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
        end
    })
    Toggle = Tabs.St:AddToggle("MyToggle", {Title = "Spam Join Job Id", Default = _G.Join })
    Toggle:OnChanged(function(Value)
  _G.Join = Value
  V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
		end)
	Toggle = Tabs.Ms:AddToggle("MyToggle", {Title = "Clean Effect [ Anti Lag ]", Default = true })
    Toggle:OnChanged(function(Value)
		if Value then
		   cleanlag() 
		end
     end) 
		Tabs.Ms:AddButton({
        Title = "Open Devil Fruit Shop",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
      	game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
        end
    })
    Tabs.Ms:AddButton({
        Title = "Open Haki Color",
        Description = "",
        Callback = function()
            game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
        end
    })
    Tabs.Ms:AddButton({
        Title = "Open Title Name",
        Description = "",
        Callback = function()
            local args = {
        [1] = "getTitles"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
      	game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
        end
    })
		Tabs.Ms:AddButton({
        Title = "Rejoin Server",
        Description = "",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
        end
    })
    Tabs.Ms:AddButton({
        Title = "Server Hop",
        Description = "",
        Callback = function()
           Hop() 
        end
    })
  local Rejoin = Tabs.Ms:AddToggle("MyToggle", {Title = "Auto Rejoin If Disconnect or Kicked", Default = false })
Rejoin:OnChanged(function(Value)
  _G.Rejoin = Value
  V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
  end) 
Tabs.Ms:AddButton({
        Title = "Join Pirate Team",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
    end
    })
    Tabs.Ms:AddButton({
        Title = "Join Marine Team",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines") 
    end
    })
		Toggle = Tabs.Settings:AddToggle("MyToggle", {Title = "Walk On Water", Default = true })
    Toggle:OnChanged(function(Value)
      _G.WalkWater = Value
		end)
		Toggle = Tabs.Settings:AddToggle("MyToggle", {Title = "Anti Afk", Default = false })
    Toggle:OnChanged(function(Value)
  local Value = game:GetService("VirtualUser")
		repeat wait() until game:IsLoaded() 
			game:GetService("Players").LocalPlayer.Idled:connect(function()
		    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
				vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
				wait(1)
				vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   end)
		end)
	Tabs.Lc:AddSection("Teleport Tab ")
    if World1 then
    local Dropdown = Tabs.Lc:AddDropdown("Dropdown", {
        Title = "Island",
        Values = {"WindMill",
                      "Marine",
                      "Middle Town",
                      "Jungle",
                      "Pirate Village",
                      "Desert",
                      "Snow Island",
                      "MarineFord",
                      "Colosseum",
                      "Sky Island 1",
                      "Sky Island 2",
                      "Sky Island 3",
                      "Prison",
                      "Magma Village",
                      "Under Water Island",
                      "Fountain City",
                      "Shank Room",
                      "Mob Island"},
        Multi = false,
        Default = _G.SelectIsland,
    })
    Dropdown:SetValue("0.15")
    Dropdown:OnChanged(function(Value)
        _G.SelectIsland = Value
    end)
    end
    if World2 then
    local Dropdown = Tabs.Lc:AddDropdown("Dropdown", {
        Title = "Island",
        Values = {"The Cafe",
                                "Frist Spot",
                                "Dark Area",
                                "Flamingo Mansion",
                                "Flamingo Room",
                                "Green Zone",
                                "Factory",
                                "Colossuim",
                                "Zombie Island",
                                "Two Snow Mountain",
                                "Punk Hazard",
                                "Cursed Ship",
                                "Ice Castle",
                                "Forgotten Island",
                                "Ussop Island",
                                "Mini Sky Island"},
        Multi = false,
        Default = _G.SelectIsland,
    })
    Dropdown:SetValue("0.15")
    Dropdown:OnChanged(function(Value)
        _G.SelectIsland = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
    end
    if World3 then
    local Dropdown = Tabs.Lc:AddDropdown("Dropdown", {
        Title = "Island",
        Values = {"Mansion",
                                          "Port Town",
                                          "Great Tree",
                                          "Castle On The Sea",
                                          "MiniSky", 
                                          "Hydra Island",
                                          "Floating Turtle",
                                          "Haunted Castle",
                                          "Ice Cream Island",
                                          "Peanut Island",
                                          "Cake Island",
                                          "Cocoa Island",
                                          "Candy Island",
"Tiki Outpost"},
        Multi = false,
        Default = _G.SelectIsland,
    })
    Dropdown:SetValue("0.15")
    Dropdown:OnChanged(function(Value)
        _G.SelectIsland = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
    end
    Toggle = Tabs.Lc:AddToggle("MyToggle", {Title = "Start Tween", Default = _G.TeleportIsland })
    Toggle:OnChanged(function(Value)
        _G.TeleportIsland = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
		if _G.TeleportIsland == true then
		    repeat wait()
		        if _G.SelectIsland == "WindMill" then
		            TP(Vector3.new(979.79895019531, 16.516613006592, 1429.0466308594))
		        elseif _G.SelectIsland == "Marine" then
		            TP(Vector3.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
		        elseif _G.SelectIsland == "Middle Town" then
		            TP(Vector3.new(-690.33081054688, 15.09425163269, 1582.2380371094))
		        elseif _G.SelectIsland == "Jungle" then
		            TP(Vector3.new(-1612.7957763672, 36.852081298828, 149.12843322754))
		        elseif _G.SelectIsland == "Pirate Village" then
		            TP(Vector3.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
		        elseif _G.SelectIsland == "Desert" then
		            TP(Vector3.new(944.15789794922, 20.919729232788, 4373.3002929688))
		        elseif _G.SelectIsland == "Snow Island" then
		            TP(Vector3.new(1347.8067626953, 104.66806030273, -1319.7370605469))
		        elseif _G.SelectIsland == "MarineFord" then
		            TP(Vector3.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
		        elseif _G.SelectIsland == "Colosseum" then
		            TP( Vector3.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
		        elseif _G.SelectIsland == "Sky Island 1" then
		            TP(Vector3.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
		        elseif _G.SelectIsland == "Sky Island 2" then  
		            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
		        elseif _G.SelectIsland == "Sky Island 3" then
		            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
		        elseif _G.SelectIsland == "Prison" then
		            TP( Vector3.new(4875.330078125, 5.6519818305969, 734.85021972656))
		        elseif _G.SelectIsland == "Magma Village" then
		            TP(Vector3.new(-5247.7163085938, 12.883934020996, 8504.96875))
		        elseif _G.SelectIsland == "Under Water Island" then
		            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
		        elseif _G.SelectIsland == "Fountain City" then
		            TP(Vector3.new(5127.1284179688, 59.501365661621, 4105.4458007813))
		        elseif _G.SelectIsland == "Shank Room" then
		            TP(Vector3.new(-1442.16553, 29.8788261, -28.3547478))
		        elseif _G.SelectIsland == "Mob Island" then
		            TP(Vector3.new(-2850.20068, 7.39224768, 5354.99268))
		        elseif _G.SelectIsland == "The Cafe" then
		            TP(Vector3.new(-380.47927856445, 77.220390319824, 255.82550048828))
		        elseif _G.SelectIsland == "Frist Spot" then
		            TP(Vector3.new(-11.311455726624, 29.276733398438, 2771.5224609375))
		        elseif _G.SelectIsland == "Dark Area" then
		            TP(Vector3.new(3780.0302734375, 22.652164459229, -3498.5859375))
		        elseif _G.SelectIsland == "Flamingo Mansion" then
		            TP(Vector3.new(-483.73370361328, 332.0383605957, 595.32708740234))
		        elseif _G.SelectIsland == "Flamingo Room" then
		            TP(Vector3.new(2284.4140625, 15.152037620544, 875.72534179688))
		        elseif _G.SelectIsland == "Green Zone" then
		            TP( Vector3.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
		        elseif _G.SelectIsland == "Factory" then
		            TP(Vector3.new(424.12698364258, 211.16171264648, -427.54049682617))
		        elseif _G.SelectIsland == "Colossuim" then
		            TP( Vector3.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
		        elseif _G.SelectIsland == "Zombie Island" then
		            TP(Vector3.new(-5622.033203125, 492.19604492188, -781.78552246094))
		        elseif _G.SelectIsland == "Two Snow Mountain" then
		            TP(Vector3.new(753.14288330078, 408.23559570313, -5274.6147460938))
		        elseif _G.SelectIsland == "Punk Hazard" then
		            TP(Vector3.new(-6127.654296875, 15.951762199402, -5040.2861328125))
		        elseif _G.SelectIsland == "Cursed Ship" then
		            TP(Vector3.new(923.40197753906, 125.05712890625, 32885.875))
		        elseif _G.SelectIsland == "Ice Castle" then
		            TP(Vector3.new(6148.4116210938, 294.38687133789, -6741.1166992188))
		        elseif _G.SelectIsland == "Forgotten Island" then
		            TP(Vector3.new(-3032.7641601563, 317.89672851563, -10075.373046875))
		        elseif _G.SelectIsland == "Ussop Island" then
		            TP(Vector3.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
		        elseif _G.SelectIsland == "Mini Sky Island" then
		            TP(Vector3.new(-288.74060058594, 49326.31640625, -35248.59375))
		        elseif _G.SelectIsland == "Great Tree" then
		            TP(Vector3.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
		        elseif _G.SelectIsland == "Castle On The Sea" then
		            TP(Vector3.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
		        elseif _G.SelectIsland == "MiniSky" then
		            TP(Vector3.new(-260.65557861328, 49325.8046875, -35253.5703125))
		        elseif _G.SelectIsland == "Port Town" then
		            TP(Vector3.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
		        elseif _G.SelectIsland == "Hydra Island" then
		            TP(Vector3.new(5228.8842773438, 604.23400878906, 345.0400390625))
		        elseif _G.SelectIsland == "Floating Turtle" then
		            TP(Vector3.new(-13274.528320313, 531.82073974609, -7579.22265625))
		        elseif _G.SelectIsland == "Mansion" then
		            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
		        elseif _G.SelectIsland == "Haunted Castle" then
		            TP(Vector3.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
		        elseif _G.SelectIsland == "Ice Cream Island" then
		            TP(Vector3.new(-902.56817626953, 79.93204498291, -10988.84765625))
		        elseif _G.SelectIsland == "Peanut Island" then
		            TP(Vector3.new(-2062.7475585938, 50.473892211914, -10232.568359375))
		        elseif _G.SelectIsland == "Cake Island" then
		            TP(Vector3.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
		        elseif _G.SelectIsland == "Cocoa Island" then
		            TP(Vector3.new(87.94276428222656, 73.55451202392578, -12319.46484375))
		        elseif _G.SelectIsland == "Candy Island" then
		            TP(Vector3.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
		elseif _G.SelectIsland == "Tiki Outpost" then
		TP(Vector3.new(-16101.1885, 12.8422165, 380.942291, 0.194113985, 1.39194061e-08, -0.980978966, -9.82904691e-09, 1, 1.22443504e-08, 0.980978966, 7.26528837e-09, 0.194113985))
		        end
		    until not _G.TeleportIsland
		end
    end)
    Toggle = Tabs.RC:AddToggle("MyToggle", {Title = "Tween To Gear", Default = getgenv().HeyGearComeHere })
Toggle:OnChanged(function(Value)
    getgenv().HeyGearComeHere = Value 
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end)
Tabs.RC:AddButton({
        Title = "Tele Timple Of Time",
        Description = "",
        Callback = function()            
             game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        end
    })
Tabs.RC:AddButton({
    Title = "Tele To Great Tree",
    Description = "Great Tree Not Timple Of Time Lol",
    Callback = function()
        local args = {
            [1] = "RaceV4Progress",
            [2] = "Teleport"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        wait(.1)
        TP(CFrame.new(28609.5801, 14896.5098, 105.869637, -0.00754010677, 3.26780936e-09, -0.999971569, 6.88313628e-09, 1, 3.21600124e-09, 0.999971569, -6.85869184e-09, -0.00754010677))
        wait(2)
        local player = game.Players.LocalPlayer
        local npcPosition = CFrame.new(28609.5801, 14896.5098, 105.869637).Position
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - npcPosition).Magnitude
            if distance < 3 then
                local args = {
                    [1] = "RaceV4Progress",
                    [2] = "TeleportBack"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            else
                warn("V_72X")
            end
        else
            warn("V_03X")
        end
    end
})
Tabs.RC:AddButton({
    Title = "Pull Lever",
    Description = "",
    Callback = function()
        wait(1) 
        TP(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    end
})
Tabs.RC:AddButton({
        Title = "TP Acient One",
        Description = "",
        Callback = function()            
        wait(1)
        TP(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
    end
    })
    Tabs.RC:AddSection("Quest Race and Complete Trial")
local Toggle = Tabs.RC:AddToggle("Auto Train + Buy Gear", { Title = "Auto Farm + Buy Gear all in one", Default = false })
Toggle:OnChanged(function(Value)
    _G.ScanV4 = Value
    _G.LetV4 = Value
end)
Tabs.RC:AddButton({
        Title = "Reset Character For Reset Race V3",
        Description = "",
        Callback = function()            
game.Players.LocalPlayer.Character.Head:Destroy()
        end
    })
Toggle = Tabs.RC:AddToggle("MyToggle", {Title = "Tween Your Door Race", Default = false })
Toggle:OnChanged(function(Value)
    _G.RaceCua = Value
    if _G.RaceCua then
        local race = game:GetService("Players").LocalPlayer.Data.Race.Value       
        if race == "Human" then
        wait(1) 
            TP(CFrame.new(29238.884765625, 14893.63671875, -202.99090576171875))
        elseif race == "Skypiea" then
        wait(1) 
            TP(CFrame.new(28222.5625, 14891.0126953125, -215.37625122070312))
        elseif race == "Fishman" then
        wait(1) 
            TP(CFrame.new(28222.5625, 14891.0126953125, -215.37625122070312))
        elseif race == "Cyborg" then
        wait(1) 
            TP(CFrame.new(28490.11328125, 14898.6142578125, -426.1543273925781))
        elseif race == "Ghoul" then
        wait(1) 
            TP(CFrame.new(28677.09375, 14890.720703125, 456.2405700683594))
        elseif race == "Mink" then
        wait(1) 
            TP(CFrame.new(29022.408203125, 14891.078125, -376.2605285644531))
        else
        end
    end
end)
local Toggle = Tabs.RC:AddToggle("Fishman Trial", { Title = "FishMan Trial [ Need Use Skill ]", Default = false })
Toggle:OnChanged(function(Value)
    _G.FishManSex = Value 
end)
spawn(function() 
    while wait() do
        pcall(function() 
            if _G.FishManSex then
                for i, v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
                    if v.Name == "HumanoidRootPart" then
                        TP(v.CFrame * CFrame.new(0, 600, 0))
                    end
                end
            end
        end)
    end
end)

Tabs.RC:AddButton({
        Title = "Auto Ghoul Trial",
        Description = "",
        Callback = function()            
             getgenv().GoDieNigger = true
             wait(7) 
             getgenv().GoDieNigger = false
        end
    })
    Tabs.RC:AddButton({
        Title = "Auto Human Trial",
        Description = "",
        Callback = function()            
             getgenv().GoDieNigger = true
             wait(3) 
             getgenv().GoDieNigger = false
        end
    })
Tabs.RC:AddButton(
    {
        Title = "Auto Angel Trial",
        Description = "",
        Callback = function()
            local char = game.Players.LocalPlayer.Character
            local c1 = game:GetService("Workspace").Map.SkyTrial.Model.FinishPart
            if char and c1 and (c1.Position - char.HumanoidRootPart.Position).Magnitude <= 2000 then
                wait(2)
                TP(c1.CFrame)
                wait(3)
            end
        end
    }
)
Tabs.RC:AddButton(
    {
        Title = "Auto Rabbit Trial",
        Description = "",
        Callback = function()
            local c0 = game:GetService("Workspace").StartPoint
            local char = game.Players.LocalPlayer.Character
            if char and c0 and (c0.Position - char.HumanoidRootPart.Position).Magnitude <= 500 then
                TP(c0.CFrame)
                for _, obj in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if obj:IsA("TouchInterest") or obj.Name == "TouchInterest" then
                        if (obj.Position - char.HumanoidRootPart.Position).Magnitude <= 50 then
                            firetouchinterest(obj, char.HumanoidRootPart)
                        end
                    end
                end
            end
        end
    }
)
Tabs.RC:AddButton(
    {
        Title = "Auto Cyborg Trial",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                "requestEntrance",
                Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875)
            )
            game:GetService("StarterGui"):SetCore(
                "SendNotification",
                {
                    Title = "Wait Done Trial...",
                    Text = "Idle",
                    Duration = 10
                }
            )
        end
    }
)
Tabs.RC:AddButton({
        Title = "Auto Buy Gear [ Need Train First ]",
        Description = "",
        Callback = function()            
             game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer('UpgradeRace','Buy')
        end
    })
    Tabs.RC:AddButton({
        Title = "Tween To Clock",
        Description = "tween to clock for attach gear",
        Callback = function()            
           TP(CFrame.new(29553.7812, 15066.6133, -88.2750015, 1, 0, 0, 0, 1, 0, 0, 0, 1))
        end
    })
local DieAfterTrials = Tabs.RC:AddToggle("Autodieafter", {Title = "Auto Die After Trial", Default = Autodieafter })
DieAfterTrials:OnChanged(function(starts)
	Autodieafter = starts
	spawn(function()
		while task.wait(1) do
			if not Autodieafter then
				break
			end
			if game:GetService("Workspace").Map["Temple of Time"].FFABorder.Forcefield.Transparency < 1 then
				if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
					local Humn = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")
					if Humn then
						Humn.Health = 0
					end
				end
			end
		end
	end)
end)
Toggle = Tabs.RC:AddToggle("MyToggle", {Title = "Kill Player Trial", Default = KillPlayer })
Toggle:OnChanged(function(Value)
    RiseTrialPro = Value
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end)
Toggle = Tabs.RC:AddToggle("MyToggle", {Title = "Skill Z For V4 [ Mele ]", Default = true })
    Toggle:OnChanged(function(Value)
        _G.XaiSkillZ = Value
    end)
Toggle = Tabs.RC:AddToggle("MyToggle", {Title = "Skill X For V4 [ Mele ]", Default = true })
    Toggle:OnChanged(function(Value)
        _G.XaiSkillX = Value
    end)
Toggle = Tabs.RC:AddToggle("MyToggle", {Title = "Skill C For V4 [ Mele ]", Default = true })
    Toggle:OnChanged(function(Value)
        _G.XaiSkillC = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)

--\\ TP
function TPP(CFgo)
	if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then tween:Cancel() repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 wait(7) return end
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/TweenSpeed, Enum.EasingStyle.Linear)
	tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
	tween:Play()
	local tweenfunc = {}
	function tweenfunc:Stop()
		tween:Cancel()
	end
	return tweenfunc
end
--\\ End
--\\ TP2
local function TPB(pos, boat)
    local tween_s = game:GetService("TweenService")
    local info = TweenInfo.new((boat.CFrame.Position - pos.Position).Magnitude / getgenv().SpeedBoat, Enum.EasingStyle.Linear)
    local tween = tween_s:Create(boat, info, {CFrame = pos})
    local stopboat = {}
    function stopboat:Stop()
        tween:Cancel()
    end
    if (boat.CFrame.Position - pos.Position).Magnitude <= 25 then
        stopboat:Stop()
    else
        tween:Play()
    end
    return stopboat
end
--\\ End
local BoatTW = Tabs.leviathan:AddDropdown("BoatTW", {
    Title = "Tween Boat Speed",
    Values = { "300", "325", "340"},
    Multi = false,
    Default = 340,
})
BoatTW:SetValue("340")
BoatTW:OnChanged(function(v)
    getgenv().SpeedBoat = v
end)
Toggle = Tabs.leviathan:AddToggle("MyToggle", {Title = "Auto Find Leviathan", Description = "Need 5 Player For Working Function" ,Default = false })
    Toggle:OnChanged(function(state)
        getgenv().AutoLeviathan = state
    end)
--\\
spawn(function()
    while wait() do
        if getgenv().AutoLeviathan then
            pcall(function()
                local player = game.Players.LocalPlayer
                local humanoid = player.Character:WaitForChild("Humanoid")
                local rootPart = player.Character:WaitForChild("HumanoidRootPart")
                if not game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade") then
                    TP(CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781))
                    if (CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781).Position - rootPart.Position).Magnitude <= 10 then
                        local args = {
                            [1] = "BuyBoat",
                            [2] = "PirateBrigade"
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                else
                    local boat = game:GetService("Workspace").Boats:FindFirstChild("PirateBrigade")
                    if boat then
                        local playersonBoat = 0 
                        for _, seat in pairs(boat:GetDescendants()) do
                            if seat:IsA("VehicleSeat") or seat:IsA("Seat") then
                                if seat.Occupant then
                                    playersonBoat = playersonBoat + 1
                                end
                            end
                        end
                        if playersonBoat >= 4 then
                            if not humanoid.Sit then
                                rootPart.CFrame = boat.VehicleSeat.CFrame
                                wait(1)
                                boat.VehicleSeat.BodyPosition.D = 5000
                                boat.VehicleSeat.BodyPosition.Position = Vector3.new(0, 200, 0)
                            else
                                TPB(boat.VehicleSeat.CFrame * CFrame.new(-30, 0, -30))
                                repeat
                                    wait(0.1)
                                    boat.VehicleSeat.BodyPosition.D = 5000
                                    boat.VehicleSeat.BodyPosition.Position = Vector3.new(0, 200, 0)
                                    TPB(boat.VehicleSeat.CFrame * CFrame.new(-30, 0, -30))
                                    if game:GetService("Workspace").Maps:FindFirstChild("Frozen Island") then
                                        getgenv().AutoLeviathan = false
                                        break
                                    end
                                until humanoid.Health <= 0 or not boat:FindFirstChild("VehicleSeat")
                                boat.VehicleSeat.BodyPosition.D = 300
                                boat.VehicleSeat.BodyPosition.Position = Vector3.new(0, 24, 0)
                                TPB(boat.VehicleSeat.CFrame)
                            end
                        else
                            local Notify = FlurioreLib:MakeNotify({
                             	["Title"] = "Rise Hub |",
                             	["Description"] = "Free Scripts",
                             	["Color"] = Color3.fromRGB(255, 0, 111),
                             	["Content"] = "not enough players",
                             	["Time"] = 1,
                             	["Delay"] = 1
                            })
                        end
                    end
                end
            end)
        end
    end
end)
spawn(
    function()
        while wait() do
            if getgenv().AutoLeviathan then
                pcall(
                    function()
                        for i, boat in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                            for _, v in pairs(game:GetService("Workspace").Boats[boat.Name]:GetDescendants()) do
                                if v:IsA("BasePart") then
                                    if _G.NoClipRock or getgenv().AutoLeviathan then
                                        v.CanCollide = false
                                    else
                                        v.CanCollide = true
                                    end
                                end
                            end
                        end
                    end
                )
            end
        end
    end
)

Toggle = Tabs.leviathan:AddToggle("MyToggle", {Title = "Auto Kill / Attack Leviathan", Default = false })
    Toggle:OnChanged(function(state)
        getgenv().KillLeviathan = state
    end)
local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg,false)
gg.__namecall = newcclosure(function(...)
	local method = getnamecallmethod()
	local args = {...}
	if tostring(method) == "FireServer" then
		if tostring(args[1]) == "RemoteEvent" then
			if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
				if Skillaimbot then
					args[2] = AimBotSkillPosition
					return old(unpack(args))
				end
			end
		end
	end
	return old(...)
end)
spawn(function()
    while wait() do
        if getgenv().KillLeviathan then
            pcall(function()
                for i, v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                    if v.Name == "Leviathan" and v:FindFirstChild("HumanoidRootPart") then
                        repeat
                            wait()
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                            pcall(function() 
                                Click()
                                AutoHaki()
                                _G.SeaSkill = true
                            end)
                            _G.SeaSkill = true
                            AimBotSkillPosition = v.HumanoidRootPart
                            Skillaimbot = true
                        until not v:FindFirstChild("HumanoidRootPart") or not getgenv().KillLeviathan
                        _G.SeaSkill = false
                        Skillaimbot = false
                    end
                end
            end)
        end
    end
end)
            DoneSkillGun = false
            DoneSkillSword = false
            DoneSkillFruit = false
            DoneSkillMelee = false
            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.SeaSkill then
                            if _G.UseSeaFruitSkill and DoneSkillFruit == false then
                                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                    if v:IsA("Tool") then
                                        if v.ToolTip == "Blox Fruit" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                        end
                                    end
                                end
                            if _G.SkillFruitZ then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                wait(_G.SeaHoldSKillZ)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                            end
            
                            if _G.SkillFruitX then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                            wait(_G.SeaHoldSKillX)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                            end
                            
                            if _G.SkillFruitC then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                            wait(_G.SeaHoldSKillC)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                            end
            
                            if _G.SkillFruitV then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                            wait(_G.SeaHoldSKillV)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                            end
            
                            if _G.SkillFruitF then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "F", false, game)
                            wait(_G.SeaHoldSKillF)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "F", false, game)
                            end

                            DoneSkillFruit = true
                            end
            
                            if _G.UseSeaMeleeSkill and DoneSkillMelee == false then 
                                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                    if v:IsA("Tool") then
                                        if v.ToolTip == "Melee" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                        end
                                    end
                                end
                                if _G.SkillMeleeZ then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                wait(0)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                                end
                
                                if _G.SkillMeleeX then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                                wait(0)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                                end
                                
                                if _G.SkillMeleeC then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                                wait(0)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                                end
                
                                if _G.SkillMeleeV then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                                wait(0)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                                end

                                DoneSkillMelee = true
                            end

                            if _G.UseSeaSwordSkill and DoneSkillSword == false then 
                                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                    if v:IsA("Tool") then
                                        if v.ToolTip == "Sword" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                        end
                                    end
                                end
                                if _G.SkillSwordZ then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                wait(0)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                                end
                
                                if _G.SkillSwordX then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                                wait(0)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                                end

                                DoneSkillSword = true
                            end

                            if _G.UseSeaGunSkill and DoneSkillGun == false then 
                                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                    if v:IsA("Tool") then
                                        if v.ToolTip == "Gun" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                        end
                                    end
                                end
                                if _G.SkillGunZ then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                                wait(.1)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                                end
                
                                if _G.SkillGunX then
                                game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                                wait(.1)
                                game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                                end

                                DoneSkillGun = true
                            end
            
                            DoneSkillGun = false
                            DoneSkillSword = false
                            DoneSkillFruit = false
                            DoneSkillMelee = false
                        end
                    end)
                end
            end)
local SelectSkill = Tabs.leviathan:AddDropdown("SelectSkill", {
    Title = "Weapon Kill Leviathan",
    Values = { "Fruit", "Mele", "Sword", "Gun" },
    Multi = true,
    Default = {},
})
SelectSkill:OnChanged(function(selectedValues)
    _G.UseSeaFruitSkill = table.find(selectedValues, "Fruit") ~= nil
    _G.UseSeaMeleeSkill = table.find(selectedValues, "Mele") ~= nil
    _G.UseSeaSwordSkill = table.find(selectedValues, "Sword") ~= nil
    _G.UseSeaGunSkill = table.find(selectedValues, "Gun") ~= nil
end)

local meleSkills = {"Skill Z", "Skill X", "Skill C"}
local meleskill = Tabs.leviathan:AddDropdown("SelectMeleSkills", {
    Title = "Skill Mele",
    Values = meleSkills,
    Multi = true,
    Default = {},
})
meleskill:OnChanged(function(selectedValues)
    _G.SkillMeleeZ = table.find(selectedValues, "Skill Z") ~= nil
    _G.SkillMeleeX = table.find(selectedValues, "Skill X") ~= nil
    _G.SkillMeleeC = table.find(selectedValues, "Skill C") ~= nil
end)
local fruitSkills = {"Skill Z", "Skill X", "Skill C", "Skill V"}
local fruitskill = Tabs.leviathan:AddDropdown("SelectFruitSkills", {
    Title = "Skill Fruit",
    Values = fruitSkills,
    Multi = true,
    Default = {},
})
fruitskill:OnChanged(function(selectedValues)
    _G.SkillFruitZ = table.find(selectedValues, "Skill Z") ~= nil
    _G.SkillFruitX = table.find(selectedValues, "Skill X") ~= nil
    _G.SkillFruitC = table.find(selectedValues, "Skill C") ~= nil
    _G.SkillFruitV = table.find(selectedValues, "Skill V") ~= nil
end)
local swordSkills = {"Skill Z", "Skill X"}
local swordskill = Tabs.leviathan:AddDropdown("SelectSwordSkills", {
    Title = "Skill Sword",
    Values = swordSkills,
    Multi = true,
    Default = {},
})
swordskill:OnChanged(function(selectedValues)
    _G.SkillSwordZ = table.find(selectedValues, "Skill Z") ~= nil
    _G.SkillSwordX = table.find(selectedValues, "Skill X") ~= nil
end)
local gunSkills = {"Skill Z", "Skill X"}
local gunskill = Tabs.leviathan:AddDropdown("SelectGunSkills", {
    Title = "Skill Gun",
    Values = gunSkills,
    Multi = true,
    Default = {},
})
gunskill:OnChanged(function(selectedValues)
    _G.SkillGunZ = table.find(selectedValues, "Skill Z") ~= nil
    _G.SkillGunX = table.find(selectedValues, "Skill X") ~= nil
end)
--\\ End
--\\ Teleport To Dimension Section
DemensionLeviarhan = Tabs.leviathan:AddSection("Frozen Dimension")
Toggle = Tabs.leviathan:AddToggle("MyToggle", {Title = "Tween Frozen Dimension", Default = false })
    Toggle:OnChanged(function(Value)
        getgenv().TweenFrozen = Value
    end)
spawn(function()
    while wait() do
        if getgenv().TweenFrozen then
            pcall(function()
                if game.Workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                    TP(workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension").CFrame*CFrame.new(0,250,0))
                end
            end)
        end
    end
end)
--\\ End
 nahbro014 = Tabs.cailon:AddSection("Kitsune Island")
 StatusKitsune = Tabs.cailon:AddParagraph({
    Title = "Kistune Island",
    Content = ""
})
function UpdateKitsune()
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('Kitsune Island') then
        StatusKitsune:SetDesc("Kitsune Island : 🟢")
    else
        StatusKitsune:SetDesc("Kitsune Island : 🔴")
     end
end
spawn(function()
    pcall(function()
        while wait() do
            UpdateKitsune()
        end
    end)
end)
     ToggleEspKitsune = Tabs.cailon:AddToggle("ToggleEspKitsune", {Title = "Highlight Kitsune Island",Description = "", Default = false })
      ToggleEspKitsune:OnChanged(function(Value)
        KitsuneIslandEsp = Value
        while KitsuneIslandEsp do wait()
            UpdateIslandKisuneESP() 
        end
    end)
     ToggleTPKitsune = Tabs.cailon:AddToggle("ToggleTPKitsune", {Title = "Tween Kitsune Island",Description = "", Default = _G.TweenToKitsune })
      ToggleTPKitsune:OnChanged(function(Value)
        _G.TweenToKitsune = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
      end)
   ToggleCollectAzure = Tabs.cailon:AddToggle("ToggleCollectAzure", {Title = "Collect Azure",Description = "", Default = _G.CollectAzure })
      ToggleCollectAzure:OnChanged(function(Value)
         _G.CollectAzure = Value
         V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
      end)
Tabs.Ms:AddButton({
        Title = "Remove Fog",
        Description = "",
        Callback = function()            
             game:GetService("Lighting").LightingLayers:Destroy()
	game:GetService("Lighting").Sky:Destroy()
end
    })
    Tabs.stack:AddSection("Quest Section")
   local rainbowsex = Tabs.stack:AddToggle("rainbowsex", {Title = "Auto Rainbow Haki", Default = _G.Auto_Rainbow_Haki })
    rainbowsex:OnChanged(function(value)
        _G.Auto_Rainbow_Haki = value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
        end)
    local quanxilotkhe = Tabs.stack:AddToggle("quanxilotkhe", {Title = "Auto Rengoku", Default = _G.AutoRengoku })
    quanxilotkhe:OnChanged(function(value)
        _G.AutoRengoku = value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
        end)
    local badilo = Tabs.stack:AddToggle("badilo", {Title = "Auto Bartilo", Default = _G.AutoBartilo })
    badilo:OnChanged(function(value)
        _G.AutoBartilo = value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
        end)
    Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Saber", Default = AutoSaber })
    Toggle:OnChanged(function(autosaberfunc)
        AutoSaber = autosaberfunc
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
        end)
    Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Cavender", Default = _G.AutoCarvender})
Toggle:OnChanged(function(Value)
    _G.AutoCarvender = Value
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end)
Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Cavender HOP", Default = _G.Hop})
Toggle:OnChanged(function(Value)
_G.Hop = Value
V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end) 
Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Twin Hook", Default = _G.AutoTwinHook})
Toggle:OnChanged(function(Value)
_G.AutoTwinHook = Value
V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end) 
Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Twin Hook HOP", Default = _G.Hop})
Toggle:OnChanged(function(Value)
_G.Hop = Value
V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end) 
Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Legends Sword", Default = false})
Toggle:OnChanged(function(Value)
    getgenv().ligisword = Value
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end)
Tabs.stack:AddSection("Func Get CDK Section")
Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Holy Torch", Default = false })
    Toggle:OnChanged(function(Value)
        getgenv().touchbad = Value
        end)
Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Yama", Default = _G.AutoYama })
    Toggle:OnChanged(function(Value)
        _G.AutoYama = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
        end)
    Toggle = Tabs.stack:AddToggle("MyToggle", {Title = "Auto Tushita", Default = _G.Autotushita })
    Toggle:OnChanged(function(Value)
        _G.Autotushita = value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
        end)
local lvParagraph
lvParagraph = Tabs.spl:AddParagraph({
    Title = "Player Status",
    Content = ""
})
spawn(function()
    while wait() do
        pcall(function()
            local statusText = string.format("Level: %d\nBeli: %d\nFragments: %d\nRace: %s",
                game:GetService("Players").LocalPlayer.Data.Level.Value,
                game:GetService("Players").LocalPlayer.Data.Beli.Value,
                game:GetService("Players").LocalPlayer.Data.Fragments.Value,
                game:GetService("Players").LocalPlayer.Data.Race.Value
            )
            lvParagraph:SetDesc(statusText)
        end)
    end
end)
Tabs.spl:AddSection("Auto Up Stats")
ToggleMelee = Tabs.spl:AddToggle("ToggleMelee", {Title = "Auto Melee Stats",Description = "", Default = _G.Auto_Stats_Melee })
ToggleMelee:OnChanged(function(Value)
    _G.Auto_Stats_Melee = Value
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
ToggleDe = Tabs.spl:AddToggle("ToggleDe", {Title = "Auto Health Stats",Description = "", Default = _G.Auto_Stats_Defense })
ToggleDe:OnChanged(function(Value)
    _G.Auto_Stats_Defense = Value
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
ToggleSword = Tabs.spl:AddToggle("ToggleSword", {Title = "Auto Sword Stats",Description = "", Default = _G.Auto_Stats_Sword })
ToggleSword:OnChanged(function(Value)
    _G.Auto_Stats_Sword = Value
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
ToggleGun = Tabs.spl:AddToggle("ToggleGun", {Title = "Auto Gun Stats", Description = "",Default = _G.Auto_Stats_Gun })
ToggleGun:OnChanged(function(Value)
    _G.Auto_Stats_Gun = Value
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
ToggleFruit = Tabs.spl:AddToggle("ToggleFruit", {Title = "Auto Fruit Stats",Description = "", Default = _G.Auto_Stats_Devil_Fruit })
ToggleFruit:OnChanged(function(Value)
    _G.Auto_Stats_Devil_Fruit = Value
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
    end)
        Toggle = Tabs.cailon:AddToggle("MyToggle", {Title = "Tween Mystic Island", Default = false })
    Toggle:OnChanged(function(Value)
        getgenv().secretis = Value
        end)
    Toggle = Tabs.cailon:AddToggle("MyToggle", {Title = "Look Moon + Turn On V3", Default = false })
    Toggle:OnChanged(function(Value)
        getgenv().NhinMoonThanhSoiCoDoc = Value
        V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
        end)
Toggle = Tabs.cailon:AddToggle("MyToggle", {Title = "Tween Gear", Default = false })
    Toggle:OnChanged(function(Value)
        getgenv().HeyGearComeHere = Value
        end)
    Tabs.cailon:AddSection("Mirage Fruit Dealer")
    local dealermirrafe = Tabs.cailon:AddToggle("dealermirrafe", {
    Title = "Tween Advanced Fruit Dealer",
    Description = "",
    Default = _G.Miragenpc })
    dealermirrafe:OnChanged(function(Value)
    _G.Miragenpc = Value
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end)
local miricheat = Tabs.cailon:AddToggle("miricheat", {
    Title = "Auto Chest Mirage Island",
    Description = "",
    Default = _G.AutoChestMirage })
    miricheat:OnChanged(function(value)
    _G.AutoChestMirage = value
    V02Nx71JqlwiQjebfOqdjcnqknexIenfcpWiencxkemmdi()
end)
-- when successfully loading
print("Loading Scripts Success") 
local Notify = FlurioreLib:MakeNotify({
	["Title"] = "Rise Hub |",
	["Description"] = "Free Scripts",
	["Color"] = Color3.fromRGB(255, 0, 111),
	["Content"] = "SCRIPT LOADING SUCCESS",
	["Time"] = 1,
	["Delay"] = 5
})
local placeId = game.PlaceId
local jobId = game.JobId

local sea1 = 2753915549
local sea2 = 4442272183
local sea3 = 7449423635

local CheckSea
if placeId == sea1 then
    CheckSea = "Sea 1"
elseif placeId == sea2 then
    CheckSea = "Sea 2"
elseif placeId == sea3 then
    CheckSea = "Sea 3"
else
    CheckSea = "unknown sea"
end

local Players = game:GetService("Players")
local playerCount = #game:GetService("Players"):GetPlayers()

local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
local ExecutorUsing = identifyexecutor()
local HttpService = game:GetService("HttpService")
local Data =
{
    ["embeds"] = {
        {
            ["title"] = "Account About",
            ["url"] = "https://www.roblox.com/users/"..game.Players.LocalPlayer.UserId,
            ["description"] = "```"..game.Players.LocalPlayer.DisplayName.." ```",
            ["color"] = tonumber("0xff006f"),
            ["thumbnail"] = {["url"] = ""},
            ["fields"] = {
                {
                    ["name"] = "Execute:",
                    ["value"] = "```"..ExecutorUsing.."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Hwid:",
                    ["value"] = hwid,
                    ["inline"] = true
                },
                {
                    ["name"] = "Sea:",
                    ["value"] = "```" .. CheckSea.."```", 
                    ["inline"] = true
                },
                {                
                    ["name"] = "Job ID:",
                    ["value"] = " " .. jobId,
                    ["inline"] = true
                },
                {
                    ["name"] = "Script Hop",
                    ["value"] = "\n" .. 'game:GetService("TeleportService"):TeleportToPlaceInstance('..placeId..', "'..jobId..'", game.Players.LocalPlayer)' .. "\n", 
                    ["inline"] = true 
                },
                {
                    ["name"] = "Thanks Used Rise!",
                    ["value"] = "**Rise Hub | Free Script Update 1**",
                    ["inline"] = true          
                }
            }              
        }
    }
}

local Headers = {["Content-Type"] = "application/json"}
local Encoded = HttpService:JSONEncode(Data)

local Request = http_request or request or HttpPost or syn.request
local Final = {Url = "https://discord.com/api/webhooks/1287416286757781639/2WnTMmTF5IKoTAdSCC2DkYExQ5FGxxMF0uWjl5HrP_uxuLUBC3PU1pwoOedRT16ZnNUn", Body = Encoded, Method = "POST", Headers = Headers}
Request(Final)
local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:waitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]
local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
local cooldownfastattack = tick()

new = {}
function FastAttackConnectorFunction()
    repeat wait() until game:IsLoaded()
    repeat task.wait() until game.ReplicatedStorage
    repeat task.wait() until game.Players
    repeat task.wait() until game.Players.LocalPlayer
    repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:waitForChild("CombatFramework"))
    local CombatFrameworkR = getupvalues(CombatFramework)[2]
    local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
    local RigControllerR = getupvalues(RigController)[2]
    local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
    local cooldownfastattack = tick()


    
    ReturnFunctions = {}
    function CurrentWeapon()
        local ac = CombatFrameworkR.activeController
        local ret = ac.blades[1]
        if not ret then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        pcall(
            function()
                while ret.Parent ~= game.Players.LocalPlayer.Character do
                    ret = ret.Parent
                end
            end
        )
        if not ret then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        return ret
    end
    function AttackFunctgggggion()
        if game.Players.LocalPlayer.Character.Stun.Value ~= 0 then
            return nil
        end
        local ac = CombatFrameworkR.activeController
        ac.hitboxMagnitude = 55
        if ac and ac.equipped then
            for indexincrement = 1, 1 do
                local bladehit =require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(game.Players.LocalPlayer.Character,{game.Players.LocalPlayer.Character.HumanoidRootPart},60)
                if #bladehit > 0 then
                    local AcAttack8 = debug.getupvalue(ac.attack, 5)
                    local AcAttack9 = debug.getupvalue(ac.attack, 6)
                    local AcAttack7 = debug.getupvalue(ac.attack, 4)
                    local AcAttack10 = debug.getupvalue(ac.attack, 7)
                    local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
                    local NumberAc13 = AcAttack7 * 798405
                    (function()
                        NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
                        AcAttack8 = math.floor(NumberAc12 / AcAttack9)
                        AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
                    end)()
                    AcAttack10 = AcAttack10 + 1
                    debug.setupvalue(ac.attack, 5, AcAttack8)
                    debug.setupvalue(ac.attack, 6, AcAttack9)
                    debug.setupvalue(ac.attack, 4, AcAttack7)
                    debug.setupvalue(ac.attack, 7, AcAttack10)
                    for k, v in pairs(ac.animator.anims.basic) do
                        v:Play(0.01,0.01,0.01)
                    end
                    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
                            "weaponChange",
                            tostring(CurrentWeapon())
                        )
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
                    end
                end
            end
        end
    end
    CountAttack = 0  
    TickCountAttack = tick()
    spawn(function()
        local MT = getrawmetatable(game)
        local OldNameCall = MT.__namecall
        setreadonly(MT, false)
        MT.__namecall = newcclosure(function(self, ...)
            local Method = getnamecallmethod()
            local Args = {...}
            if Method == 'FireServer' and self.Name == "RigControllerEvent" and  Args[1] == "hit"  then
                CountAttack = CountAttack + 1 
                TickCountAttack = tick()
            end
            return OldNameCall(self, unpack(Args))
        end)
    end)
    function ReturnFunctions:GetCount()
        return CountAttack
    end
    function ReturnFunctions:Attack(k)
        UFFF = k 
    end
    FastAttackSettings = {
        ["CDAAT"] = 80,
        ["Timewait"] = 10
    }
    spawn(function()
        local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
        CameraShakerR:Stop()
    end)
    function ReturnFunctions:InputValue(CDAAT,Timewait)
        FastAttackSettings["CDAAT"] = CDAAT
        FastAttackSettings["Timewait"] = Timewait
    end
    function ReturnFunctions:InputSetting(tbbb)
        conchosetting = tbbb
    end
    function atack()
        pcall(function()
            AttackFunctgggggion()
        end)
    end
    ToiCanOxi = 0
    conchosetting = {}
    function ReturnFunctions:GetMethod()
        MethodAttack = "Slow"
        if CountAttack < FastAttackSettings["CDAAT"] then 
            MethodAttack = "Fast"
        end 
        return MethodAttack
    end
    spawn(function()
        while task.wait() do 
            if UFFF then 
                pcall(function()
                    if conchosetting and type(conchosetting) == "table" then 
                        if conchosetting and conchosetting["Mastery Farm"] then 
                            ToiCanOxi = 2 
                            atack()
                            if conchosetting["DelayAttack"] and type(conchosetting["DelayAttack"]) == "number" and conchosetting["DelayAttack"] >= 0.1 then 
                                wait(conchosetting["DelayAttack"])
                            else
                                conchosetting["DelayAttack"] = 0.2 
                                wait(conchosetting["DelayAttack"])
                            end
                        elseif CountAttack < FastAttackSettings["CDAAT"] then 
                            ToiCanOxi = ToiCanOxi +1
                            atack()
                        elseif CountAttack >= FastAttackSettings["CDAAT"] then 
                            ToiCanOxi = ToiCanOxi +1
                            atack()
                            if conchosetting["DelayAttack"] and type(conchosetting["DelayAttack"]) == "number" and conchosetting["DelayAttack"] >= 0.1 then 
                                wait(conchosetting["DelayAttack"]*2)
                            else
                                conchosetting["DelayAttack"] = 0.2 
                                wait(conchosetting["DelayAttack"]*2)
                            end
                        end
                    end
                end)
            end
        end
    end) 
    spawn(function()
        while task.wait() do 
            pcall(function() 
                if tick()-TickCountAttack >= FastAttackSettings["Timewait"] then 
                    CountAttack = 0 
                end
            end)
        end
    end)
    spawn(function()
        while task.wait() do 
            if UFFF then 
                pcall(function()
                    local Fastflux = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2]
                    Fastflux.activeController.hitboxMagnitude = 55
                    Fastflux.activeController.timeToNextAttack = 0
                    Fastflux.activeController.attacking = false
                    Fastflux.activeController.increment = 3
                    Fastflux.activeController.blocking = false
                    Fastflux.activeController.timeToNextBlock = 0
                    Fastflux.activeController:attack()
                    task.wait(0.2)
                end)
            end
        end
    end)
    spawn(function()
        while task.wait() do 
            if UFFF then 
                pcall(function()
                    local Fastflux = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2]
                    Fastflux.activeController.hitboxMagnitude = 55
                    Fastflux.activeController.timeToNextAttack = 0
                    Fastflux.activeController.attacking = false
                    Fastflux.activeController.increment = 3
                    Fastflux.activeController.blocking = false
                    Fastflux.activeController.timeToNextBlock = 0
                    a = math.random(1,5)
                    if a > 1 then 
                        game:GetService "VirtualUser":CaptureController()
                        game:GetService "VirtualUser":Button1Down(Vector2.new(50, 50))
                    end
                    task.wait(0.2)
                end)
            end
        end
    end)
    spawn(function()
        while wait() do 
            if UFFF then
                pcall(function() 
                    if CountAttack >= FastAttackSettings["CDAAT"] then 
                        TickFastAttackF = tick()
                        repeat wait() until tick()-TickFastAttackF >= FastAttackSettings["Timewait"]
                        CountAttack = 0
                    end    
                end)  
            end
        end
    end)
    return ReturnFunctions
end
return FastAttackConnectorFunction()
