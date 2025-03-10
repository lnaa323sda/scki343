-- By KaoDontSuy - Full yêu cầu của TuanAngg
-- Chức năng: Auto Remove Fruit khi đang dùng + Load Fruit + Reset + Remove Fruit + Reset Stats + Buy Boat
local Notification = require(game:GetService("ReplicatedStorage").Notification)
Notification.new("<Color=Cyan>Cơm nước gì chưa người đẹp<Color=/>"):Display()
wait(0.5)
Notification.new("<Color=Yellow>Kaitun có múp không nhỉ<Color=/>"):Display()
wait(1)
Notification.new("<Color=Cyan>Múp thì mình xin 1 like nhé<Color=/>"):Display()
wait(1)
Notification.new("<Color=Yellow>Chúc bạn có cảm giác mát mẻ<Color=/>"):Display()
wait(1)
repeat
    wait()
until game.Players.LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CommF_ = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")

-- Danh sách trái cần lấy ra
local targetFruits = {
    "Dragon-Dragon", "Kitsune-Kitsune", "Yeti-Yeti", "Leopard-Leopard",
    "Spirit-Spirit", "Gas-Gas", "Control-Control", "Venom-Venom",
    "Shadow-Shadow", "Dough-Dough", "T-rex-T-rex", "Mammoth-Mammoth",
    "Gravity-Gravity", "Blizzard-Blizzard", "Pain-Pain", "Rumble-Rumble",
    "Portal-Portal", "Phoenix-Phoenix", "Sound-Sound", "Spider-Spider",
    "Ghost-Ghost", "Love-Love", "Quake-Quake"
}

-- Hàm tự động xoá trái đang sử dụng (dùng khi vừa vào game hoặc sau khi reset)
function RemoveCurrentFruit()
    CommF_:InvokeServer("RemoveFruit", "Beli")
end

-- Hàm reset điểm F
function RemoveStatsF()
    for i = 1, 4 do
        CommF_:InvokeServer("BlackbeardReward", "Refund", tostring(i))
    end
end

-- Hàm mua thuyền
function BuyBoat()
    CommF_:InvokeServer("BuyBoat", "PirateGrandBrigade")
end

-- Hàm chính: load trái, reset, remove trái, reset stat, mua thuyền
function ProcessFruit(fruitName)
    RemoveCurrentFruit() -- Xóa trái hiện tại trước khi lấy trái mới
    task.wait(0.1)
    
    if CommF_:InvokeServer("LoadFruit", fruitName) then
        task.wait(0.05)
        LocalPlayer.Character:BreakJoints() -- Reset nhân vật ngay
        spawn(function()
            repeat task.wait() until LocalPlayer.Character
            RemoveCurrentFruit() -- Xóa trái sau khi hồi sinh
            RemoveStatsF() -- Xóa điểm F
            BuyBoat() -- Mua thuyền
        end)
    end
end

-- Khi vừa vào game, auto xoá trái đang dùng
RemoveCurrentFruit()

-- Vòng lặp auto lấy trái liên tục
spawn(function()
    while task.wait(0.1) do
        for _, fruit in ipairs(targetFruits) do
            pcall(function()
                ProcessFruit(fruit)
                task.wait(0.2) -- Chờ hồi sinh nhanh rồi lấy tiếp
            end)
        end
    end
end)

-- Tắt thông báo để giảm lag
spawn(function()
    while task.wait() do
        pcall(function()
            LocalPlayer.PlayerGui.Notifications.Enabled = false
        end)
    end
end)

-- Tắt hình ảnh 3D để tối ưu FPS
spawn(function()
    while task.wait() do
        pcall(function()
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        end)
    end
end)
