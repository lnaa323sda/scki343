-- Задержка в секундах
local delayTime = 3

-- Функция для активации скриптов
local function activateScript(script, delay)
    wait(delay)
    script()  -- Здесь вызывается функция вашего скрипта
end

-- Ваши скрипты
local function firstScript()
    local Config = {
            Team = "Marines", -- Название команды, за которую игрок будет заходить
        }

        -- Ожидаем, пока игра загрузится
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end

        -- Получаем необходимые сервисы
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Remotes = ReplicatedStorage:WaitForChild("Remotes")
        local CommF_ = Remotes:WaitForChild("CommF_") -- Получаем доступ к удалённым функциям

        -- Функция для установки команды
        local function SetTeam(Team)
            CommF_:InvokeServer("SetTeam", Team) -- Вызываем удалённую функцию для установки команды
        end

        -- Основная функция для автоматического переключения команды
        local function AutoJoinTeam()
            -- Проверяем, есть ли команда, которую мы хотим установить
            if Config.Team then
                SetTeam(Config.Team) -- Устанавливаем команду
            end
        end

        -- Запускаем функцию автоматического переключения команды
        AutoJoinTeam()
end

local function secondScript()

local player = game.Players.LocalPlayer

-- Создаем звук
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://2865227271" -- Замените на ID вашего звука, если нужно
sound.Volume = 0.5 -- Уровень громкости (от 0 до 1)
sound.Parent = player.Backpack -- Помещаем звук в рюкзак игрока

-- Функция для обновления списка предметов и вывода в консоль 
local function updateInventory() 
    local inventory = player.Backpack:GetChildren() 
    local itemsText = "Инвентарь:\n" 
    for _, item in ipairs(inventory) do 
        itemsText = itemsText .. item.Name .. "\n" 
    end 
    print(itemsText) 

    -- Воспроизводим звук при изменении инвентаря
    sound:Play()
end

-- Обновляем инвентарь при изменении 
player.Backpack.ChildAdded:Connect(updateInventory) 
player.Backpack.ChildRemoved:Connect(updateInventory)

-- Обновляем инвентарь при первом запуске 
updateInventory()

end

local function thirdScript()
    local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:FindFirstChildOfClass("Humanoid")
local jumpingEnabled = true -- Прыжки включены по умолчанию
local frozenState = true -- "Замороженное" состояние включено по умолчанию

-- Настройки текста
local titleTextSize = 24 -- Увеличенный размер шрифта заголовка
local buttonTextSize = 22 -- Увеличенный размер шрифта кнопки

-- Создаем меню
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local menuFrame = Instance.new("Frame", screenGui)
menuFrame.Size = UDim2.new(0, 220, 0, 80) -- Размеры меню
menuFrame.Position = UDim2.new(0.0090, 20, 0, 50)
menuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Темный фон меню
menuFrame.BackgroundTransparency = 0.3 -- Полупрозрачный фон
menuFrame.BorderSizePixel = 4
menuFrame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- Золотистая рамка
menuFrame.Parent = screenGui
menuFrame.ClipsDescendants = true

-- Закругление углов
local corner = Instance.new("UICorner", menuFrame)
corner.CornerRadius = UDim.new(0, 12) -- Закругление углов

-- Создание названия
local titleLabel = Instance.new("TextLabel", menuFrame)
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "NMD.DEV AUTO JUMP"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextColor3 = Color3.fromRGB(255, 215, 0) -- Золотистый цвет текста
titleLabel.BackgroundTransparency = 1
titleLabel.TextSize = titleTextSize -- Установка размера текста заголовка
titleLabel.TextStrokeTransparency = 1 -- Эффект обводки текста

-- Создание кнопки
local toggleButton = Instance.new("TextButton", menuFrame)
toggleButton.Size = UDim2.new(1, -10, 0, 30) -- Размеры кнопки
toggleButton.Position = UDim2.new(0, 5, 0, 50)
toggleButton.Text = "DISABLE JUMP" -- Начальное состояние кнопки
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Белый текст кнопки
toggleButton.BackgroundColor3 = Color3.fromRGB(73, 0, 138) -- Цвет кнопки
toggleButton.BackgroundTransparency = 0.8
toggleButton.BorderSizePixel = 0
toggleButton.TextSize = buttonTextSize -- Установка размера текста кнопки
toggleButton.TextStrokeTransparency = 1 -- Эффект обводки текста на кнопке

-- Улучшенный дизайн кнопки
local buttonCorner = Instance.new("UICorner", toggleButton)
buttonCorner.CornerRadius = UDim.new(0, 8) -- Закругление углов кнопки

-- Эффекты при наведении
toggleButton.MouseEnter:Connect(function()
    toggleButton.BackgroundColor3 = Color3.fromRGB(106, 31, 173) -- Светлый цвет при наведении
end)

toggleButton.MouseLeave:Connect(function()
    toggleButton.BackgroundColor3 = Color3.fromRGB(73, 0, 138) -- Вернуть обратно цвет
end)

-- Функция для перемещения меню
local dragging = false
local dragInput, mousePos, startPos

menuFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragInput = input
        startPos = menuFrame.Position
        mousePos = input.Position
    end
end)

menuFrame.InputEnded:Connect(function(input)
    if input == dragInput then
        dragging = false
    end
end)

menuFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - mousePos
        menuFrame.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
    end
end)

local function toggleJumpAndFreeze()
    jumpingEnabled = not jumpingEnabled
    frozenState = not frozenState

    toggleButton.Text = (jumpingEnabled and frozenState) and "Disable Jump" or "Enable Jump"

    if humanoid then
        if frozenState then
            -- Ограничиваем скорость и прыжки игрока
            humanoid.WalkSpeed = 0
            humanoid.JumpPower = 20
        else
            -- Возвращаем скорость и прыжки игрока к норме
            humanoid.WalkSpeed = 16 -- стандартная скорость
            humanoid.JumpPower = 50 -- стандартная сила прыжка
        end
    end
end

toggleButton.MouseButton1Click:Connect(toggleJumpAndFreeze)

-- Функция для прыжков
local function jump()
    while true do
        if jumpingEnabled then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            wait(0.3)
        end
        wait(0.3)
    end
end

-- Изначально замораживаем игрока при активации скрипта
if humanoid then
    humanoid.WalkSpeed = 0 -- Ограничиваем скорость
    humanoid.JumpPower = 20 -- Ограничиваем прыжки
end

jump()

end

local function fourScript()
-- Получаем игрока
local player = game.Players.LocalPlayer

-- Функция для получения текущего баланса
local function getPlayerBalance()
   local dataFolder = player:FindFirstChild("Data")
   if dataFolder and dataFolder:FindFirstChild("Beli") then
       return dataFolder.Beli.Value
   end
   return 0
end

-- Функция для форматирования числа с разделением на тысячи
local function formatNumber(number)
   return string.format("%0.0f", number):reverse():gsub("(%d%d%d)", "%1,"):reverse()
end

-- Новые локации с координатами
local locations = {
   PortTown = Vector3.new(-445.46, 108.09, 5932.14),
   HydraIsland = Vector3.new(5730.97, 1012.72, -25.25),
   DragonDojo = Vector3.new(5733.07, 1206.34, 926.11),
   HydraArena = Vector3.new(4000.54, 51.05, -2364.46),
   GreatTree = Vector3.new(1800.34, 37.52, -7013.58),
   Mansion = Vector3.new(-12549.77, 336.69, -7505.54),
   FloatingTurtle1 = Vector3.new(-13276.64, 390.48, -9768.54),
   FloatingTurtle2 = Vector3.new(-12007.57, 331.25, -9156.49),
   HauntedCastle = Vector3.new(-9514.87, 163.50, 5787.47),
   IceCreamIsland = Vector3.new(-929.55, 68.34, -10931.38),
   CakeIsland = Vector3.new(-1876.82, 37.32, -11833.22),
   ChocolateIsland = Vector3.new(89.72, 26.26, -12076.13),
   PeanutIsland = Vector3.new(-2060.31, 37.63, -10172.65),
   TikiOutpost = Vector3.new(-16112.20, 171.29, 934.98),
   CastleOnTheSea = Vector3.new(-5013.67, 314.04, -3008.57)
}

-- Координаты сундуков для определенных локаций
local chestCoordinates = {
   PortTown = {
       Vector3.new(-549.12, 111.51, 5712.13),
       Vector3.new(-741.43, 123.77, 5636.33),
       Vector3.new(-773.49, 84.35, 5914.91),
       Vector3.new(-574.33, 75.93, 6091.53),
       Vector3.new(-323.02, 18.63, 6061.06),
       Vector3.new(-346.62, 233.07, 6198.40),
       Vector3.new(-261.29, 231.84, 5856.62),
       Vector3.new(-215.47, 123.77, 5653.02),
       Vector3.new(-67.18, 21.07, 5567.09),
       Vector3.new(53.49, 40.05, 5896.56),
       Vector3.new(-20.20, 85.15, 5915.56),
       Vector3.new(169.34, 210.94, 6082.81),
       Vector3.new(151.22, 69.21, 6243.17),
       Vector3.new(-6.21, 172.33, 6322.83),
       Vector3.new(-73.39, 207.96, 6564.69)
   },
   HydraIsland = {
       Vector3.new(5830.37, 1012.57, -229.00),
       Vector3.new(5520.53, 1003.58, -4.62),
       Vector3.new(5322.00, 1029.37, -50.09),
       Vector3.new(5449.44, 1003.59, 246.00)
   },
   DragonDojo = {
       Vector3.new(5779.99, 1208.92, 795.06),
       Vector3.new(5885.27, 1208.92, 849.78),
       Vector3.new(5898.11, 1206.42, 857.72)
   },
   HydraArena = {
       Vector3.new(3753.62, 13.71, -2428.94),
       Vector3.new(3735.76, 221.62, -2078.93),
       Vector3.new(4000.42, 123.96, -1955.36),
       Vector3.new(3940.90, 202.60, -1612.98),
       Vector3.new(4086.90, 107.41, -1229.58),
       Vector3.new(4531.59, 50.97, -1425.20),
       Vector3.new(4872.06, 175.38, -1129.76),
       Vector3.new(5156.97, 175.38, -1128.92),
       Vector3.new(5397.95, 270.94, -1207.51),
       Vector3.new(5743.36, 366.81, -1157.18),
       Vector3.new(5975.50, 371.79, -1036.62),
       Vector3.new(6184.97, 371.16, -898.74),
       Vector3.new(6529.48, 363.61, -752.10),
       Vector3.new(6745.02, 221.90, -596.48),
       Vector3.new(6692.55, 383.02, -369.00),
       Vector3.new(6670.98, 470.90, -49.04),
       Vector3.new(6647.73, 545.76, 264.39),
       Vector3.new(6490.37, 626.28, 595.24)
   },
   GreatTree = {
       Vector3.new(1799.68, 26.68, -7100.08),
       Vector3.new(2166.77, 248.91, -7128.24),
       Vector3.new(2382.13, 73.76, -7245.29),
       Vector3.new(2598.14, 189.92, -7288.37),
       Vector3.new(2876.32, 508.80, -7217.45),
       Vector3.new(3242.58, 559.44, -7424.58),
       Vector3.new(3013.92, 363.02, -7721.60),
       Vector3.new(2840.93, 115.01, -7790.48),
       Vector3.new(2933.49, 73.76, -8094.10)
   },
   Mansion = {
       Vector3.new(-12762.10, 432.78, -7822.28),
       Vector3.new(-12986.00, 362.74, -8011.03),
       Vector3.new(-12891.55, 427.08, -7654.42),
       Vector3.new(-12488.61, 336.44, -7527.32),
       Vector3.new(-12635.39, 459.00, -7429.42),
       Vector3.new(-12532.01, 492.15, -7174.92),
       Vector3.new(-12244.16, 512.03, -6988.6),
       Vector3.new(-12151.68, 768.18, -6755.60),
       Vector3.new(-12535.66, 629.76, -6741.99),
       Vector3.new(-12971.63, 527.78, -6596.11),
       Vector3.new(-13158.72, 527.78, -6812.72),
       Vector3.new(-13423.70, 469.11, -6876.26),
       Vector3.new(-13503.32, 613.24, -7180.58),
       Vector3.new(-13568.30, 390.89, -7490.20),
       Vector3.new(-13491.07, 332.45, -7653.01),
       Vector3.new(-13274.03, 331.90, -7770.00),
       Vector3.new(-13745.60, 331.89, -7816.60),
       Vector3.new(-13646.41, 432.78, -8072.92),
       Vector3.new(-13589.61, 361.21, -8414.39),
       Vector3.new(-13568.46, 331.40, -8737.30)
   },
   FloatingTurtle1 = {
       Vector3.new(-13458.61, 391.07, -9858.98),
       Vector3.new(-13537.94, 471.74, -9988.43),
       Vector3.new(-13385.21, 467.17, -10221.02),
       Vector3.new(-13041.76, 390.43, -10333.88),
       Vector3.new(-12762.50, 399.25, -10198.97),
       Vector3.new(-12480.49, 522.15, -10112.13),
       Vector3.new(-12329.92, 481.43, -10508.71),
       Vector3.new(-12115.90, 331.26, -10806.66),
       Vector3.new(-11998.37, 331.26, -10587.66),
       Vector3.new(-11873.88, 331.26, -10366.57),
       Vector3.new(-11672.84, 382.44, -10421.69),
       Vector3.new(-11386.97, 361.49, -10395.26),
       Vector3.new(-11178.43, 331.25, -10520.35),
       Vector3.new(-10857.40, 496.03, -10493.09),
       Vector3.new(-10487.11, 567.64, -10307.62)
   },
   FloatingTurtle2 = {
       Vector3.new(-12048.34, 331.25, -9033.91),
       Vector3.new(-11821.05, 337.86, -9047.45),
       Vector3.new(-11516.91, 509.05, -9075.78),
       Vector3.new(-11154.26, 569.22, -8994.46),
       Vector3.new(-10941.47, 392.36, -9290.84),
       Vector3.new(-10596.09, 331.25, -9589.89),
       Vector3.new(-10120.86, 352.29, -9536.56),
       Vector3.new(-10145.75, 353.29, -9301.53),
       Vector3.new(-10246.12, 353.29, -9302.37),
       Vector3.new(-10525.97, 487.09, -9239.16),
       Vector3.new(-10767.51, 331.28, -8904.95),
       Vector3.new(-10433.28, 331.28, -8604.83),
       Vector3.new(-10053.95, 331.28, -8126.26)
   },
   HauntedCastle = {
       Vector3.new(-9842.93, 198.52, 5808.08),
       Vector3.new(-10053.17, 140.85, 5715.08),
       Vector3.new(-10025.72, 263.72, 5953.9),
       Vector3.new(-10095.51, 207.66, 6235.99),
       Vector3.new(-9770.61, 171.63, 6197.34),
       Vector3.new(-9664.29, 270.63, 6274.13),
       Vector3.new(-9521.98, 140.85, 6426.32),
       Vector3.new(-9473.59, 5.63, 6374.40),
       Vector3.new(-9394.52, 171.63, 6223.74),
       Vector3.new(-9053.26, 176.72, 6096.65),
       Vector3.new(-8777.00, 141.84, 6277.16),
       Vector3.new(-8748.62, 141.84, 6276.06),
       Vector3.new(-8877.27, 140.85, 5932.11),
       Vector3.new(-9091.88, 203.07, 5683.82),
       Vector3.new(-9483.77, 141.63, 5495.19),
       Vector3.new(-9543.84, 141.63, 5218.25),
       Vector3.new(-9465.64, 141.96, 4827.62),
       Vector3.new(-9576.71, 20.63, 4766.84)
   },
   IceCreamIsland = {
       Vector3.new(-661.26, 65.34, -10883.94),
       Vector3.new(-407.01, 65.34, -10861.69),
       Vector3.new(-472.45, 228.25, -11045.02),
       Vector3.new(-488.62, 65.34, -11056.39),
       Vector3.new(-573.10, 65.34, -11247.08),
       Vector3.new(-814.12, 65.34, -11179.90),
       Vector3.new(-1087.81, 38.87, -11241.24),
       Vector3.new(-906.24, 71.70, -11469.84)
   },
   CakeIsland = {
       Vector3.new(-1647.30, 37.32, -12005.66),
       Vector3.new(-1619.12, 199.95, -12308.03),
       Vector3.new(-1820.85, 37.32, -12441.88),
       Vector3.new(-1901.99, 53.40, -12617.42),
       Vector3.new(-2072.65, 52.92, -12673.67),
       Vector3.new(-2206.13, 53.02, -12860.96),
       Vector3.new(-2325.41, 52.92, -13023.68),
       Vector3.new(-2510.98, 90.64, -12901.55),
       Vector3.new(-2634.49, 97.45, -12940.65),
       Vector3.new(-2751.57, 52.92, -13005.71)
   },
   ChocolateIsland = {
       Vector3.new(-60.76, 16.47, -12056.38),
       Vector3.new(135.00, 70.12, -12254.76),
       Vector3.new(140.37, 24.32, -12437.73),
       Vector3.new(216.62, 126.11, -12598.84),
       Vector3.new(299.45, 24.32, -12569.34),
       Vector3.new(288.65, 24.32, -12841.74),
       Vector3.new(327.45, 24.32, -12909.35),
       Vector3.new(500.62, 58.66, -13075.15)
   },
   PeanutIsland = {
       Vector3.new(-2084.68, 37.62, -10068.07),
       Vector3.new(-2235.00, 90.05, -10056.42),
       Vector3.new(-2377.56, 62.86, -10122.26),
       Vector3.new(-2410.89, 37.63, -10344.77),
       Vector3.new(-2292.54, 143.58, -10420.15),
       Vector3.new(-2263.29, 191.66, -10621.16),
       Vector3.new(-2115.91, 37.62, -10721.29),
       Vector3.new(-1953.71, 98.92, -10650.63),
       Vector3.new(-1826.43, 37.62, -10547.17),
       Vector3.new(-2088.09, 37.63, -10406.32)
   },
   TikiOutpost = {
       Vector3.new(-16224.45, 136.71, 1027.61),
       Vector3.new(-16551.04, 170.71, 1024.05),
       Vector3.new(-16944.77, 71.63, 1130.23),
       Vector3.new(-16733.71, 8.58, 825.11),
       Vector3.new(-16427.07, 243.41, 577.19),
       Vector3.new(-16460.20, 366.00, 307.36),
       Vector3.new(-16820.14, 223.89, 290.46),
       Vector3.new(-16450.25, 232.15, 234.23),
       Vector3.new(-16339.10, 136.71, -120.28),
       Vector3.new(-16598.62, 153.76, -165.72)
   },
   CastleOnTheSea = {
       Vector3.new(-5075.59, 370.83, -3174.92),
       Vector3.new(-4953.75, 314.04, -3175.09),
       Vector3.new(-4919.06, 370.83, -2845.18),
       Vector3.new(-5116.31, 315.84, -3176.38),
       Vector3.new(-5234.97, 313.24, -3202.81),
       Vector3.new(-5369.50, 313.47, -3034.77),
       Vector3.new(-5336.33, 313.24, -2839.54),
       Vector3.new(-5718.82, 313.47, -2892.93),
       Vector3.new(-5600.06, 313.24, -2719.46),
       Vector3.new(-5507.29, 313.24, -2475.48),
       Vector3.new(-5590.54, 313.24, -2159.97),
       Vector3.new(-5214.59, 313.24, -2116.16),
       Vector3.new(-4923.97, 313.24, -2431.46)
   }
}

-- Функция для нахождения ближайшей локации
local function findClosestLocation(currentPosition, visited)
   local closestLocation, shortestDistance = nil, math.huge
   for locationName, coordinates in pairs(locations) do
       if not visited[locationName] then -- Проверка, посещалась ли локация
           local distance = (currentPosition - coordinates).Magnitude
           if distance < shortestDistance then
               shortestDistance = distance
               closestLocation = locationName
           end
       end
   end
   return closestLocation
end

-- Функция для телепортации к сундуку
local function teleportToChest(chestPosition)
   local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
   if humanoidRootPart and chestPosition then
       humanoidRootPart.CFrame = CFrame.new(chestPosition)
       wait(0.8) -- Задержка между телепортами
   end
end

-- Функция для создания меню
local function createChestFarmMenu()
   local screenGui = Instance.new("ScreenGui")
   screenGui.Name = "ChestFarmMenu"
   screenGui.Parent = player:WaitForChild("PlayerGui")

   local frame = Instance.new("Frame")
   frame.Size = UDim2.new(0, 250, 0, 220)
   frame.Position = UDim2.new(0, 20, 0, 130)
   frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
   frame.BackgroundTransparency = 0.3
   frame.BorderSizePixel = 4
   frame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- Золотой цвет
   frame.Parent = screenGui
   frame.Active = true
   frame.Draggable = true
   local frameCorner = Instance.new("UICorner", frame)
   frameCorner.CornerRadius = UDim.new(0, 10)  -- Скругление углов

   -- Добавление текстовых элементов
   local title = Instance.new("TextLabel")
   title.Size = UDim2.new(1, 0, 0, 40)
   title.Text = "NMD.DEV CHEST FARM \n V0.1"
   title.TextColor3 = Color3.fromRGB(255, 215, 0) -- Золотой цвет
   title.TextSize = 22
   title.Font = Enum.Font.GothamBold
   title.BackgroundTransparency = 1
   title.TextXAlignment = Enum.TextXAlignment.Center
   title.Parent = frame

   local balanceLabel, chestCountLabel, statusLabel = Instance.new("TextLabel"), Instance.new("TextLabel"), Instance.new("TextLabel")
   balanceLabel.Size = UDim2.new(1, 0, 0, 30)
   balanceLabel.Position = UDim2.new(0, 0, 0.20, 0)
   balanceLabel.Text = formatNumber(getPlayerBalance()) .. "$"
   balanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
   balanceLabel.TextSize = 22
   balanceLabel.Font = Enum.Font.GothamBold
   balanceLabel.BackgroundTransparency = 1
   balanceLabel.Parent = frame

   chestCountLabel.Size = UDim2.new(1, 0, 0, 30)
   chestCountLabel.Position = UDim2.new(0, 0, 0.30, 0)
   chestCountLabel.Text = "CHESTS: 0"
   chestCountLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
   chestCountLabel.TextSize = 22
   chestCountLabel.Font = Enum.Font.GothamBold
   chestCountLabel.BackgroundTransparency = 1
   chestCountLabel.Parent = frame

   statusLabel.Size = UDim2.new(1, 0, 0, 30)
   statusLabel.Position = UDim2.new(0, 0, 0.45, 0)
   statusLabel.Text = "STATUS: NO FARM ❌"
   statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
   statusLabel.TextSize = 20
   statusLabel.Font = Enum.Font.GothamBold
   statusLabel.BackgroundTransparency = 1
   statusLabel.Parent = frame

   local onButton = Instance.new("TextButton")
   onButton.Size = UDim2.new(0.4, 0, 0.25, 0)
   onButton.Position = UDim2.new(0.1, 0, 0.65, 0)
   onButton.Text = "START"
   onButton.TextColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый цвет
   onButton.TextSize = 28
   onButton.Font = Enum.Font.GothamBold
   onButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50) -- Темно-зеленый фон
   onButton.BackgroundTransparency = 0.8
   onButton.Parent = frame
   local onButtonCorner = Instance.new("UICorner", onButton)
   onButtonCorner.CornerRadius = UDim.new(0, 6) -- Скругление углов

   local offButton = Instance.new("TextButton")
   offButton.Size = UDim2.new(0.4, 0, 0.25, 0)
   offButton.Position = UDim2.new(0.5, 0, 0.65, 0)
   offButton.Text = "STOP"
   offButton.TextColor3 = Color3.fromRGB(255, 0, 0) -- Красный цвет
   offButton.TextSize = 28
   offButton.Font = Enum.Font.GothamBold
   offButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50) -- Темно-красный фон
   offButton.BackgroundTransparency = 0.8
   offButton.Parent = frame
   local offButtonCorner = Instance.new("UICorner", offButton)
   offButtonCorner.CornerRadius = UDim.new(0, 6) -- Скругление углов

   -- Добавление текста "GOODBYE NMD.DEV!" внизу
   local goodbyeLabel = Instance.new("TextLabel")
   goodbyeLabel.Size = UDim2.new(1, 0, 0, 30)
   goodbyeLabel.Position = UDim2.new(0, 0, 0.88, 0)
   goodbyeLabel.Text = "GOODBYE NMD.DEV!"
   goodbyeLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Белый цвет
   goodbyeLabel.TextSize = 18
   goodbyeLabel.Font = Enum.Font.GothamBold
   goodbyeLabel.BackgroundTransparency = 1
   goodbyeLabel.TextXAlignment = Enum.TextXAlignment.Center
   goodbyeLabel.Parent = frame

   -- Уведомление
   local notificationFrame = Instance.new("Frame")
   notificationFrame.Size = UDim2.new(0, 250, 0, 50)
   notificationFrame.Position = UDim2.new(0, 300, 0.6, 10) -- Изменено на 0.6 для перемещения ниже середины экрана
   notificationFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
   notificationFrame.BackgroundTransparency = 1
   notificationFrame.BorderSizePixel = 0
   notificationFrame.Parent = screenGui

   local notificationLabel = Instance.new("TextLabel")
   notificationLabel.Size = UDim2.new(0, 250, 0, 50)
   notificationLabel.Text = ""
   notificationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
   notificationLabel.TextSize = 20
   notificationLabel.Font = Enum.Font.GothamBold
   notificationLabel.BackgroundTransparency = 1
   notificationLabel.Parent = notificationFrame

   -- Увеличение текста внутри кнопки при наведении
   local function onHover(button)
       local originalSize = button.TextSize
       button.TextSize = originalSize * 1.1 -- Увеличиваем текст на 10%
       button.MouseLeave:Connect(function()
           button.TextSize = originalSize -- Возвращаем текст к исходному размеру
       end)
   end

   onButton.MouseEnter:Connect(function() onHover(onButton) end)
   offButton.MouseEnter:Connect(function() onHover(offButton) end)

   -- Плавное перемещение фрейма
   local function onDrag(frame)
       local UserInputService = game:GetService("UserInputService")
       local TweenService = game:GetService("TweenService")

       local dragging, dragInput, startPos, startPosFrame

       local function update(input)
           local delta = input.Position - dragInput.Position
           local newPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
           frame.Position = newPosition
       end

       frame.InputBegan:Connect(function(input)
           if input.UserInputType == Enum.UserInputType.MouseButton1 then
               dragging = true
               dragInput = input
               startPos = frame.Position
               startPosFrame = frame.Position

               input.Changed:Connect(function()
                   if input.UserInputState == Enum.UserInputState.End then
                       dragging = false
                   end
               end)
           end
       end)

       UserInputService.InputChanged:Connect(function(input)
           if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
               update(input)
           end
       end)
   end

   onDrag(frame)

   return {OnButton = onButton, OffButton = offButton, BalanceLabel = balanceLabel, ChestCountLabel = chestCountLabel, StatusLabel = statusLabel, NotificationLabel = notificationLabel, ScreenGui = screenGui}
end

-- Функция для перемещения с использованием твина
local function moveToLocation(humanoidRootPart, targetPosition)
   local TweenService = game:GetService("TweenService")
   local distance = (humanoidRootPart.Position - targetPosition).Magnitude
   local speed = 275
   local tweenDuration = distance / speed
   local tweenInfo = TweenInfo.new(tweenDuration, Enum.EasingStyle.Linear)
   local targetCFrame = CFrame.new(targetPosition.X, targetPosition.Y + 2, targetPosition.Z) -- Поднимаем на 2 единицы

   -- Отключаем коллизии для всех частей персонажа
   for _, part in ipairs(player.Character:GetChildren()) do
       if part:IsA("BasePart") then
           part.CanCollide = false
       end
   end

   -- Создаем невидимую платформу
   local platform = Instance.new("Part")
   platform.Size = Vector3.new(10, 1, 10)
   platform.Anchored = true
   platform.Transparency = 1
   platform.CanCollide = true
   platform.Position = humanoidRootPart.Position - Vector3.new(0, 3, 0) -- Платформа под игроком
   platform.Parent = workspace

   -- Твин для перемещения игрока
   local tween = TweenService:Create(humanoidRootPart, tweenInfo, {CFrame = targetCFrame})
   tween:Play()

   -- Твин для перемещения платформы
   local platformTween = TweenService:Create(platform, tweenInfo, {CFrame = targetCFrame - Vector3.new(0, 2, 0)})
   platformTween:Play()

   tween.Completed:Wait() -- Ждем завершения твина

   -- Восстанавливаем коллизии для всех частей персонажа
   for _, part in ipairs(player.Character:GetChildren()) do
       if part:IsA("BasePart") then
           part.CanCollide = true
       end
   end

   -- Удаляем платформу после завершения твина
   platform:Destroy()
end

-- Функция для сбора сундуков в указанных локациях
local function collectChestsInLocation(locationName, collectedChests)
   local chests = chestCoordinates[locationName]
   if not chests or #chests == 0 then return true end -- Если сундуков нет, возвращаем true

   -- Убираем проверку на оставшиеся сундуки
   for _, chestPosition in ipairs(chests) do
       teleportToChest(chestPosition) -- Телепортация к сундуку
       wait(0.7) -- Задержка между сборами сундуков
   end

   return false -- Возвращаем false, так как мы не проверяем, были ли собраны все сундуки
end

-- Настройки для автоматического хопа на серверы
local Config = {
    PlaceId = game.PlaceId, -- ID текущего места
    CheckInterval = 2.5, -- Интервал проверки серверов (в секундах)
    TeleportInterval = 1 -- Интервал между телепортациями (в секундах)
}

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Функция для получения доступных серверов
local function GetAvailableServers()
    local Servers = {}
    local Cursor = ""

    -- Запрос серверов с использованием API Roblox
    while Cursor and #Servers <= 0 and task.wait(Config.CheckInterval) do
        local Request = request or HttpService.RequestAsync
        local RequestSuccess, Response = pcall(Request, {
            Url = `https://games.roblox.com/v1/games/{Config.PlaceId}/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true&cursor={Cursor}`,
            Method = "GET",
        })

        if not RequestSuccess then
            continue
        end

        local DecodeSuccess, Body = pcall(HttpService.JSONDecode, HttpService, Response.Body)

        if not DecodeSuccess or not Body or not Body.data then
            continue
        end

        -- Добавление доступных серверов в таблицу
        for _, Server in pairs(Body.data) do
            if typeof(Server) == "table" 
                and Server.id 
                and tonumber(Server.playing) 
                and tonumber(Server.maxPlayers) 
                and tonumber(Server.ping) then
                if Server.playing < Server.maxPlayers then
                    table.insert(Servers, Server.id)
                end
            end
        end

        -- Проверка наличия следующей страницы серверов
        if Body.nextPageCursor then
            Cursor = Body.nextPageCursor
        else
            Cursor = nil -- Завершить цикл, если нет следующей страницы
        end
    end

    return Servers
end

-- Функция для хопа на случайный сервер
local function ServerHop()
    while true do
        local Servers = GetAvailableServers() -- Получаем доступные серверы

        if #Servers > 0 then
            -- Выбираем случайный сервер из списка
            local Server = Servers[math.random(1, #Servers)]
            print("Teleporting to server: " .. Server) -- Выводим информацию о сервере в консоль
            TeleportService:TeleportToPlaceInstance(Config.PlaceId, Server, Player) -- Телепортируем игрока на выбранный сервер
            task.wait(Config.TeleportInterval) -- Ждем перед следующей попыткой
        else
            print("No available servers found with the desired ping. Retrying...") -- Если серверов нет, выводим сообщение
            task.wait(Config.CheckInterval) -- Ждем перед повторной проверкой
        end
    end
end

-- Функция для отображения уведомления
local function showNotification(message, notificationLabel)
    notificationLabel.Text = message
    wait(4) -- Удерживаем уведомление на экране
    notificationLabel.Text = "" -- Очищаем текст уведомления
end

-- Основная логика
local function startChestFarm()
   local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
   if not humanoidRootPart then return end

   local menu = createChestFarmMenu()
   local isFarming = false
   local lastBalance = getPlayerBalance()
   local chestsCollected = 0 -- Счетчик собранных сундуков
   local collectedChests = {} -- Таблица для отслеживания собранных сундуков
   local visitedLocations = {} -- Таблица посещенных локаций

   -- Обновляем баланс на постоянке
   game:GetService("RunService").Heartbeat:Connect(function()
       if isFarming then
           local currentBalance = getPlayerBalance()
           menu.BalanceLabel.Text = formatNumber(currentBalance) .. "$"
           if currentBalance > lastBalance then
               chestsCollected = chestsCollected + 1
               menu.ChestCountLabel.Text = "CHESTS: " .. chestsCollected
           end
           lastBalance = currentBalance
       end
   end)

   -- Основной цикл фарма
   menu.OnButton.MouseButton1Click:Connect(function()
       if not isFarming then
           isFarming = true
           menu.StatusLabel.Text = "STATUS: FARM CHEST ✅"

           -- Автозапуск фарма
           while isFarming do
               local currentLocationName = findClosestLocation(humanoidRootPart.Position, visitedLocations)
               if currentLocationName then
                   moveToLocation(humanoidRootPart, locations[currentLocationName]) -- Перемещение к локации
                   wait(0.8) -- Задержка перед решением, как собирать сундуки

                   collectChestsInLocation(currentLocationName, collectedChests) -- Убираем проверку на оставшиеся сундуки
                   visitedLocations[currentLocationName] = true -- Помечаем локацию как посещенную
               else
                   menu.StatusLabel.Text = "STATUS: HOP SERVER 🌐"
                   wait(1) -- Ждем 1 секунду перед сменой сервера
                   ServerHop() -- Смена сервера
                   break
               end
           end
       end
   end)

   -- Исправленная логика кнопки OFF
   menu.OffButton.MouseButton1Click:Connect(function()
       if isFarming then
           isFarming = false 
           menu.StatusLabel.Text = "STATUS: NO FARM ❌"
           showNotification("     ⚠️IF YOU PRESSED THE,\n      STOP BUTTON,\n          WAIT UNTIL THE SCRIPT,\n           COLLECTS ALL CHESTS AT THE,\n            CURRENT LOCATION⚠️", 
           menu.NotificationLabel) -- Показ уведомления
       end
   end)

   -- Автоматический запуск фарма
   isFarming = true
   menu.StatusLabel.Text = "STATUS: FARM CHEST ✅"
   -- Запускаем основной цикл фарма
   while isFarming do
       local currentLocationName = findClosestLocation(humanoidRootPart.Position, visitedLocations)
       if currentLocationName then
           moveToLocation(humanoidRootPart, locations[currentLocationName]) -- Перемещение к локации
           wait(0.8) -- Задержка перед решением, как собирать сундуки

           collectChestsInLocation(currentLocationName, collectedChests) -- Убираем проверку на оставшиеся сундуки
           visitedLocations[currentLocationName] = true -- Помечаем локацию как посещенную
       else
           menu.StatusLabel.Text = "STATUS: HOP SERVER 🌐"
           wait(1) -- Ждем 1 секунду перед сменой сервера
           ServerHop() -- Смена сервера
           break
       end
   end
end

startChestFarm()

end
-- Запуск всех скриптов с задержкой
coroutine.wrap(activateScript)(firstScript, 0)  -- Сразу запускаем первый скрипт
coroutine.wrap(activateScript)(secondScript, delayTime)  -- Второй через delayTime
coroutine.wrap(activateScript)(thirdScript, delayTime * 2)  -- Третий через две задержки
coroutine.wrap(activateScript)(fourScript, delayTime * 3)  -- Четвертый через три задержки
