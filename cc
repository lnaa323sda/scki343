    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    local g = "Script Tổng Hợp V1"
    local Window = Fluent:CreateWindow({
        Title = g,
        SubTitle = "by Duck",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
    })
    
    
    local scr = {
        ["Blox Fruit"] = {
            ["W azure"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()]]
            },
            ["Redz"] = {
                ["desc"] = "",
                ["script"] = [[local Settings = {JoinTeam = "Pirates";Translator = true;};loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))(Settings)]]
            },
            ["Kaitun Royx"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/nguyenduck18/script/refs/heads/main/kaitun%20royx"))()]]
            },
            ["Xeter Hub"] = {
                ["desc"] = "",
                ["script"] = [[getgenv().Version = "V2";loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Loader/main/Xeter.lua"))()]]
            },
            ["Monster Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/giahuy2511-coder/MonsterHub/refs/heads/main/MonsterHub"))()]]
            },
            ["Xero"] = {
                ["desc"] = "",
                ["script"] = [[getgenv().Team = "Marines";getgenv().Hide_Menu = false;getgenv().Auto_Execute = false;loadstring(game:HttpGet("https://raw.githubusercontent.com/Xero2409/XeroHub/refs/heads/main/main.lua"))()]]
            },
            ["Mukuro Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://auth.quartyz.com/scripts/Loader.lua"))()]]
            },
            ["Alchemy"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()]]
            },
            ["Speed X"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()]]
            },
            ["Auto Chest"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/nguyenduck18/script/refs/heads/main/skull%20chest"))()]]
            },
            ["Astral Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/Overgustx2/Main/refs/heads/main/BloxFruits_25.html"))()]]
            },
            ["TheBillDev Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/selciawashere/screepts/refs/heads/main/BFKEYSYS",true))()]]
            },
            ["Relz Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/farghii/relzhub/main/execute.hack", true))()]]
            },
            ["Volcano Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/wpisstestfprg/Volcano/refs/heads/main/VolcanoNewUpdated.luau"))()]]
            },
            ["Cokka Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua")()]]
            },
            ["Quantum Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/Trustmenotcondom/QTONYX/refs/heads/main/QuantumOnyx.lua"))()]]
            }
        },
        ["Blue Lock"] = {
            ["Hyper"] = {
                ["desc"] = "",
                ["script"] =[[loadstring(game:HttpGet("https://raw.githubusercontent.com/DookDekDEE/Hyper/main/script.lua"))()]]
            },
            ["Arc"] = {
                ["desc"] = "",
                ["script"] = [[getgenv().CustomDistance = 10;loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/ArcHub/main/main.lua"))()]]
            },
            ["Zee"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet('https://zuwz.me/Ls-Zee-Hub-KL'))()]]
            },
            ["Zen"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/Zenhubtop/zen_hub_pr/main/zennewwwwui.lua", true))()]]
            },
            ["Tc Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://github.com/KV-TCode/DonateMe/releases/download/TC_Hub/Loader.lua"))()]]
            },
            ["Tsuo"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/king%20legacy"))()]]
            }
        },
        ["Fisch"] = {
            ["Than Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()]]
            },
            ["Speed Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()]]
            },
            ["Alchemy Hub"]= {
                ['desc'] = "",
                ["script"] = [[loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()]]
            },
            ["Nat Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua"))()]]
            }
        },
        ["Dead Rails"] = {
            ["Dark X Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet(('https://raw.githubusercontent.com/Merdooon/skibidi-sigma-spec-ter/refs/heads/main/specter')))()]]
            },
            ["Tbao Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))()]]
            },
            ["Rinns Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Dead-Rails-Alpha-Best-keyless-script-30227"))()]]
            },
            ["Speed Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()]]
            }
        },
        ["King Legacy"] = {
            ["Tsuo Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/king%20legacy"))()]]
            },
            ["TC Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://github.com/KV-TCode/DonateMe/releases/download/TC_Hub/Loader.lua"))()]]
            },
            ["Zen Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/Zenhubtop/zen_hub_pr/main/zennewwwwui.lua", true))()]]
            },
            ["ARC Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/ArcHub/main/main.lua"))()]]
            },
            ["Zee Hub"] = {
                ["desc"] = "",
                ["script"] = [[loadstring(game:HttpGet('https://zuwz.me/Ls-Zee-Hub-KL'))()]]
            }
        }
    }
    
    for _i, _v in pairs(scr) do
        local Tab =  Window:AddTab({ Title = _i, Icon = "" })
        for i_, v_ in pairs(_v) do
            Tab:AddButton({
                Title = i_,
                Description = "",
                Callback = function()
                    loadstring(v_["script"])()
                end
            })
        end
    end
end
