repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

local HttpService = game:GetService("HttpService")
local hwid = gethwid and gethwid() or "Unknown"
local key = getgenv().Key or nil

if not key then
    game.Players.LocalPlayer:Kick("⚠️ You must enter a key!")
    return
end

local baseUrl = "http://yourdomain.com"
local keyVerifyUrl = baseUrl .. "/api/check_key.php?key=" .. key
local hwidCheckUrl = baseUrl .. "/api/check_hwid.php?hwid=" .. hwid .. "&key=" .. key

local function getData(url)
    for i = 1, 2 do 
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)

        if success and response and response ~= "" then
            local successDecode, data = pcall(function()
                return HttpService:JSONDecode(response)
            end)
            if successDecode then
                return data
            end
        end

        wait(1)
    end

    return nil 
end

-- Check key
local verifyResponse = getData(keyVerifyUrl)
if not verifyResponse or verifyResponse.status ~= "true" then
    game.Players.LocalPlayer:Kick(verifyResponse and verifyResponse.msg or "⚠️ Invalid Key")
    return
end

-- Check HWID
local hwidResponse = getData(hwidCheckUrl)
if not hwidResponse or hwidResponse.status ~= "true" then
    game.Players.LocalPlayer:Kick(hwidResponse and hwidResponse.msg or "⚠️ Invalid HWID.")
    return
end

game.StarterGui:SetCore("SendNotification", {
    Title = "Zush Hub",
    Text = "Xác minh thành công",
    Duration = 5,
    Icon = "rbxassetid://108644766679780"
})
