local function chooseTeam()
    if getgenv().Team == "Marines" then
        local team = game.Teams:FindFirstChild("Marines")
        if team then
            game.Players.LocalPlayer.Team = team
        end
    elseif getgenv().Team == "Pirates" then
        local team = game.Teams:FindFirstChild("Pirates")
        if team then
            game.Players.LocalPlayer.Team = team
        end
    end
end

if getgenv().Language == "Vietnamese" then
    chooseTeam()
    if getgenv().Team == "Marines" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/mainvn"))()
    elseif getgenv().Team == "Pirates" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/mainvn"))()
    end
elseif getgenv().Language == "English" then
    chooseTeam()
    if getgenv().Team == "Marines" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/maineg"))()
    elseif getgenv().Team == "Pirates" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ccditmethkskider/Ducv4/refs/heads/main/maineg"))()
    end
end
