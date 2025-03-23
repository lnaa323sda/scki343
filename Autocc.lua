local function chooseTeam()
    if getgenv().Team == "Marines" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
    elseif getgenv().Team == "Pirates" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
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
