repeat
    wait()
until game:IsLoaded() and (game:GetService("Players").LocalPlayer or game:GetService("Players").PlayerAdded:Wait()) and 
    (game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait())

-- Webhook Configuration
getgenv().Webhook = getgenv().Webhook or "" -- Đặt URL webhook của bạn ở đây

-- Anti-AFK
local l = true
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    while wait(3) do
        if l then
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end
    end
end)

-- Notification
local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "Zush Hub",
    Text = "By Stuckz999",
    Icon = "rbxthumb://type=Asset&id=108644766679780&w=150&h=150",
    Duration = math.huge,
})

-- Prevent multiple runs
if getgenv().Ran then return else getgenv().Ran = true end

-- Function to send webhook
local function SendWebhook(fruitName)
    if getgenv().Webhook == "url" or getgenv().Webhook == "" then
        print("Webhook URL not set! Please set getgenv().Webhook to your webhook URL")
        return
    end
    
    local player = game:GetService("Players").LocalPlayer
    local HttpService = game:GetService("HttpService")
    
    -- Create embed for Discord webhook
    local data = {
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "Devil Fruit Found!",
            ["description"] = "A devil fruit has been collected in the game.",
            ["type"] = "rich",
            ["color"] = tonumber("0x00FF00"),
            ["fields"] = {
                {
                    ["name"] = "Fruit Name",
                    ["value"] = fruitName,
                    ["inline"] = true
                },
                {
                    ["name"] = "Player",
                    ["value"] = player.Name,
                    ["inline"] = true
                },
                {
                    ["name"] = "Server JobId",
                    ["value"] = game.JobId,
                    ["inline"] = false
                }
            },
            ["footer"] = {
                ["text"] = "Devil Fruit Notifier • " .. os.date("%x %X")
            }
        }}
    }
    
    -- Send the webhook
    pcall(function()
        HttpService:PostAsync(getgenv().Webhook, HttpService:JSONEncode(data))
        print("Webhook sent for: " .. fruitName)
        
        -- Also send in-game notification
        CoreGui:SetCore("SendNotification", {
            Title = "Webhook Sent",
            Text = "Found: " .. fruitName,
            Duration = 5
        })
    end)
end

local player = game:GetService("Players").LocalPlayer
if player.PlayerGui:WaitForChild("Main", 9e9):FindFirstChild("ChooseTeam") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    wait(3)
end

local character = player.Character or player.CharacterAdded:Wait()
local tweenService = game:GetService("TweenService")
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bodyVelocity.Velocity = Vector3.new()
bodyVelocity.Name = "bV"

local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
bodyAngularVelocity.AngularVelocity = Vector3.new()
bodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
bodyAngularVelocity.Name = "bAV"

-- Function to check fruit name and filter out unwanted items
local function isValidFruit(name)
    -- List of valid devil fruits (add more as needed)
    local validFruitPatterns = {
        "Fruit",
        "Quả"  -- Vietnamese for "fruit"
    }
    
    -- Check if name contains any valid fruit pattern
    for _, pattern in ipairs(validFruitPatterns) do
        if string.find(name, pattern) then
            return true
        end
    end
    
    return false
end

for _, fruit in ipairs(workspace:GetChildren()) do
    if fruit.Name:find("Fruit") and (fruit:IsA("Tool") or fruit:IsA("Model")) then
        if isValidFruit(fruit.Name) then
            repeat
                local velClone = bodyVelocity:Clone()
                velClone.Parent = character.HumanoidRootPart
                local angClone = bodyAngularVelocity:Clone()
                angClone.Parent = character.HumanoidRootPart
                
                local moveTween = tweenService:Create(
                    character.HumanoidRootPart,
                    TweenInfo.new((player:DistanceFromCharacter(fruit.Handle.Position) - 150) / 300, Enum.EasingStyle.Linear),
                    {CFrame = fruit.Handle.CFrame + Vector3.new(0, fruit.Handle.Size.Y, 0)}
                )
                moveTween:Play()
                moveTween.Completed:Wait()
                
                character.HumanoidRootPart.CFrame = fruit.Handle.CFrame
                velClone:Destroy()
                angClone:Destroy()
                wait(1)
            until fruit.Parent ~= workspace
            
            -- Send webhook after picking up the fruit
            SendWebhook(fruit.Name)
            
            wait(1)
            local foundFruit = character:FindFirstChildOfClass("Tool") and character:FindFirstChildOfClass("Tool").Name:find("Fruit") and character:FindFirstChildOfClass("Tool")
            if not foundFruit then
                for _, item in pairs(player.Backpack:GetChildren()) do
                    if item.Name:find("Fruit") then
                        foundFruit = item
                        break
                    end
                end
            end
            
            if foundFruit then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", foundFruit:GetAttribute("OriginalName"), foundFruit)
            end
        end
    end
end

-- Auto Store Fruit Function
spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.AutoStoreFruit then
                for _, fruit in pairs(workspace:GetChildren()) do
                    if fruit:IsA("Tool") and string.find(fruit.Name, "Fruit") then
                        -- Send webhook before storing
                        if isValidFruit(fruit.Name) then
                            SendWebhook(fruit.Name)
                        end
                        
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", fruit.Name)
                    end
                end
            end
        end
    end)
end)

-- Added monitoring for new fruits spawning in workspace
spawn(function()
    local fruitCache = {}
    
    -- Initial cache of existing fruits
    for _, obj in pairs(workspace:GetChildren()) do
        if isValidFruit(obj.Name) then
            fruitCache[obj] = true
        end
    end
    
    -- Monitor for new fruits
    workspace.ChildAdded:Connect(function(child)
        wait(1) -- Wait a bit to ensure properties are loaded
        if isValidFruit(child.Name) and not fruitCache[child] then
            fruitCache[child] = true
            -- Send webhook for newly spawned fruit
            SendWebhook(child.Name)
            
            -- Monitor when this fruit is removed (collected)
            child.AncestryChanged:Connect(function(_, newParent)
                if newParent == nil or newParent ~= workspace then
                    fruitCache[child] = nil
                end
            end)
        end
    end)
end)

-- Server hopping functionality
local jobId = game.JobId
repeat
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local Api = "https://games.roblox.com/v1/games/"
    local placeId = game.PlaceId
    local serversUrl = Api..placeId.."/servers/Public?sortOrder=Asc&limit=100"

    local function ListServers(cursor)
        local raw = game:HttpGet(serversUrl .. ((cursor and "&cursor="..cursor) or ""))
        return HttpService:JSONDecode(raw)
    end

    local server, nextPageCursor
    repeat
        local servers = ListServers(nextPageCursor)
        server = servers.data[1]
        nextPageCursor = servers.nextPageCursor
    until server
    
    -- Send webhook notification before server hop
    SendWebhook("Server Hopping to: " .. server.id)
    
    TeleportService:TeleportToPlaceInstance(placeId, server.id, player)
    wait()
until game.JobId ~= jobId
