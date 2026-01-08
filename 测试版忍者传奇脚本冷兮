-- ==============================================
-- 忍者游戏多功能辅助脚本 (整合优化版)
-- 功能: 自动挂机/宠物复制/数值修改/自动抽奖
-- 适配: Roblox 第三方注入器
-- ==============================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- 全局环境兼容 (getgenv 或 _G)
local GlobalEnv = getgenv and getgenv() or _G

-- ===================== 配置区 =====================
local Config = {
    -- 自动功能默认开关
    AutoSettings = {
        AutoSwing = false,
        AutoSell = false,
        AutoR = false,
        AutoB = false,
        AutoS = false,
        AutoC = false,
        AutoBo = false,
        AutoBo1 = false,
        AutoBo2 = false,
        AutoCircle = false,
        AutoElement = false,
        AutoEgg = false
    },
    -- 延迟配置 (防检测)
    Delay = {
        AutoSwing = 0.1,
        AutoSell = 0.5,
        AutoRank = 1,
        AutoBuy = 0.5,
        AutoTeleport = 0.1,
        AutoBoss = 0.2,
        AutoEgg = 1
    }
}

-- ===================== 工具函数 =====================
-- 安全传送函数 (防空值)
local function teleportTo(placeCFrame)
    local Char = LocalPlayer.Character
    if Char and Char:FindFirstChild("HumanoidRootPart") then
        Char.HumanoidRootPart.CFrame = placeCFrame
    end
end

-- 安全触发事件函数
local function fireEvent(eventName, ...)
    local Event = LocalPlayer:FindFirstChild(eventName)
    if Event then
        Event:FireServer(...)
    end
end

-- ===================== UI 初始化 =====================
-- 兼容第三方 UI 库 (Window 框架)
if not Window then
    warn("Window UI 库未加载! 请使用支持的注入器")
    return
end

-- ===================== 主要功能标签页 =====================
local MainTab = Window:Tab({Title = "主要功能", Icon = "settings"})

-- 1. 自动挥刀
MainTab:Toggle({
    Title = "自动挥刀",
    Default = false,
    Callback = function(state)
        GlobalEnv.AutoSwing = state
        if state then
            spawn(function()
                while GlobalEnv.AutoSwing do
                    task.wait(Config.Delay.AutoSwing)
                    -- 角色死亡时退出
                    if not LocalPlayer.Character then break end
                    fireEvent("ninjaEvent", "swingKatana")
                end
            end)
        end
    end
})

-- 2. 自动售卖
MainTab:Toggle({
    Title = "自动售卖",
    Default = false,
    Callback = function(state)
        GlobalEnv.AutoSell = state
        if state then
            spawn(function()
                while GlobalEnv.AutoSell do
                    task.wait(Config.Delay.AutoSell)
                    local Char = LocalPlayer.Character
                    if not Char or not Char:FindFirstChild("Head") then break end
                    local Head = Char.Head
                    -- 定位售卖区碰撞体
                    local SellArea = Workspace:FindFirstChild("sellAreaCircles")
                    if not SellArea then continue end
                    local CircleInner = SellArea:FindFirstChild("sellAreaCircle16"):FindFirstChild("circleInner")
                    for _, v in pairs(CircleInner:GetDescendants()) do
                        if v.Name == "TouchInterest" and v.Parent then
                            firetouchinterest(Head, v.Parent, 0)
                            task.wait(0.1)
                            firetouchinterest(Head, v.Parent, 1)
                            break
                        end
                    end
                end
            end)
        end
    end
})

-- 3. 自动重生职位
MainTab:Toggle({
    Title = "自动重生职位",
    Default = false,
    Callback = function(state)
        GlobalEnv.AutoR = state
        if state then
            spawn(function()
                local ranks = {
                    "Grasshopper", "Apprentice", "Samurai", "Assassin", "Shadow",
                    "Ninja", "Master Ninja", "Sensei", "Master Sensei", "Ninja Legend",
                    "Master Of Shadows", "Immortal Assassin", "Eternity Hunter", "Shadow Legend", "Dragon Warrior",
                    "Dragon Master", "Chaos Sensei", "Chaos Legend", "Master Of Elements", "Elemental Legend",
                    "Ancient Battle Master", "Ancient Battle Legend", "Legendary Shadow Duelist", "Master Legend Assassin", "Mythic Shadowmaster",
                    "Legendary Shadowmaster", "Awakened Scythemaster", "Awakened Scythe Legend", "Master Legend Zephyr", "Golden Sun Shuriken Master",
                    "Golden Sun Shuriken Legend", "Dark Sun Samurai Legend", "Dragon Evolution Form I", "Dragon Evolution Form II", "Dragon Evolution Form III",
                    "Dragon Evolution Form IV", "Dragon Evolution Form V", "Cybernetic Electro Master", "Cybernetic Electro Legend", "Shadow Chaos Assassin",
                    "Shadow Chaos Legend", "Infinity Sensei", "Infinity Legend", "Aether Genesis Master Ninja", "Master Legend Sensei Hunter",
                    "Skystorm Series Samurai Legend", "Master Elemental Hero", "Eclipse Series Soul Master", "Starstrike Master Sensei", "Evolved Series Master Ninja",
                    "Dark Elements Guardian", "Elite Series Master Legend", "Infinity Shadows Master", "Lighting Storm Sensei",
                    "Dark Elements Blademaster", "Rising Shadow Eternal Ninja", "Skyblade Ninja Master", "Shadow Storm Sensei", "Comet Strike Lion",
                    "Cybernetic Azure Sensei", "Ultra Genesis Shadow"
                }
                while GlobalEnv.AutoR do
                    task.wait(Config.Delay.AutoRank)
                    if not LocalPlayer.Character then break end
                    -- 分批购买 (每5个一批)
                    for i = 1, #ranks, 5 do
                        for j = i, math.min(i+4, #ranks) do
                            fireEvent("ninjaEvent", "buyRank", ranks[j])
                        end
                        task.wait(1)
                    end
                end
            end)
        end
    end
})

-- 4. 自动购买称号
MainTab:Toggle({
    Title = "自动购买称号",
    Default = false,
    Callback = function(state)
        GlobalEnv.AutoB = state
        if state then
            spawn(function()
                while GlobalEnv.AutoB do
                    task.wait(Config.Delay.AutoBuy)
                    if not LocalPlayer.Character then break end
                    fireEvent("ninjaEvent", "buyAllBelts", "Blazing Vortex Island")
                end
            end)
        end
    end
})

-- 5. 自动购买刀
MainTab:Toggle({
    Title = "自动购买刀",
    Default = false,
    Callback = function(state)
        GlobalEnv.AutoS = state
        if state then
            spawn(function()
                while GlobalEnv.AutoS do
                    task.wait(Config.Delay.AutoBuy)
                    if not LocalPlayer.Character then break end
                    fireEvent("ninjaEvent", "buyAllSwords", "Blazing Vortex Island")
                end
            end)
        end
    end
})

-- 6. 自动传送圈
local isCircleRunning = false
MainTab:Toggle({
    Title = "自动把圈传送过来",
    Default = false,
    Callback = function(state)
        if state and not isCircleRunning then
            isCircleRunning = true
            spawn(function()
                while isCircleRunning do
                    task.wait(Config.Delay.AutoTeleport)
                    local Char = LocalPlayer.Character
                    if not Char or not Char:FindFirstChild("HumanoidRootPart") then continue end
                    local PlayerCFrame = Char.HumanoidRootPart.CFrame
                    local Hoops = Workspace:FindFirstChild("Hoops")
                    if not Hoops then continue end
                    for _, Hoop in ipairs(Hoops:GetChildren()) do
                        if Hoop.Name == "Hoop" then
                            Hoop.CFrame = PlayerCFrame
                        end
                    end
                end
            end)
        else
            isCircleRunning = false
        end
    end
})

-- 7. 自动吸气
MainTab:Toggle({
    Title = "自动吸气",
    Default = false,
    Callback = function(state)
        GlobalEnv.AutoC = state
        if state then
            spawn(function()
                while GlobalEnv.AutoC do
                    task.wait(Config.Delay.AutoTeleport)
                    if not LocalPlayer.Character then break end
                    -- 定位气罐位置
                    local SpawnedCoins = Workspace:FindFirstChild("spawnedCoins")
                    if not SpawnedCoins then continue end
                    local Valley = SpawnedCoins:FindFirstChild("Valley")
                    if not Valley then continue end
                    local CoinLocations = {
                        Valley:FindFirstChild("Pink Chi Crate") and Valley["Pink Chi Crate"].CFrame,
                        Valley:FindFirstChild("Blue Chi Crate") and Valley["Blue Chi Crate"].CFrame,
                        Valley:FindFirstChild("Chi Crate") and Valley["Chi Crate"].CFrame
                    }
                    for _, Location in ipairs(CoinLocations) do
                        if Location then
                            teleportTo(Location)
                            task.wait(0.1)
                        end
                    end
                end
            end)
        end
    end
})

-- 8. 获取所有元素
MainTab:Button({
    Title = "获取所有元素[永久]",
    Callback = function()
        local Elements = ReplicatedStorage:FindFirstChild("Elements")
        if not Elements then
            warn("元素文件夹不存在!")
            return
        end
        local ElementEvent = ReplicatedStorage:FindFirstChild("rEvents"):FindFirstChild("elementMasteryEvent")
        if not ElementEvent then
            warn("元素事件不存在!")
            return
        end
        for _, Element in ipairs(Elements:GetChildren()) do
            ElementEvent:FireServer(Element.Name)
            task.wait(0.05)
        end
        warn("所有元素已获取!")
    end
})

-- 9. 自动收集元素
MainTab:Toggle({
    Title = "自动收集元素",
    Default = false,
    Callback = function(state)
        GlobalEnv.AutoElement = state
        if state then
            spawn(function()
                local elements = {
                    "Inferno", "Frost", "Lightning", "Electral Chaos",
                    "Shadow Charge", "Masterful Wrath", "Shadowfire",
                    "Eternity Storm", "Blazing Entity"
                }
                local ElementEvent = ReplicatedStorage:FindFirstChild("rEvents"):FindFirstChild("elementMasteryEvent")
                if not ElementEvent then
                    warn("元素事件不存在!")
                    return
                end
                while GlobalEnv.AutoElement do
                    task.wait(1)
                    if not LocalPlayer.Character then break end
                    for _, Element in ipairs(elements) do
                        ElementEvent:FireServer(Element)
                        task.wait(0.1)
                    end
                end
            end)
        end
    end
})

-- ===================== 宠物复制标签页 =====================
local PetTab = Window:Tab({Title = "宠物复制", Icon = "settings"})
local PetNameInput = ""
local CopyCount = 1

-- 宠物名称输入
PetTab:Input({
    Title = "宠物名字",
    Desc = "输入要复制的宠物名",
    Value = "",
    Placeholder = "例如: Red Dragon",
    Color = Color3.fromRGB(0, 170, 255),
    Callback = function(input)
        PetNameInput = input
    end
})

-- 复制次数输入
PetTab:Input({
    Title = "复制次数",
    Desc = "输入复制数量",
    Value = "1",
    Placeholder = "例如: 5",
    Color = Color3.fromRGB(0, 170, 255),
    Callback = function(input)
        CopyCount = tonumber(input) or 1
    end
})

-- 复制按钮
PetTab:Button({
    Title = "复制宠物",
    Desc = "pet6666",
    Color = Color3.fromRGB(0, 170, 255),
    Callback = function()
        if PetNameInput == "" then
            warn("请输入宠物名字!")
            return
        end
        local PetsFolder = LocalPlayer:FindFirstChild("petsFolder")
        if not PetsFolder then
            warn("宠物文件夹不存在!")
            return
        end
        local RarePets = PetsFolder:FindFirstChild("Rare")
        if not RarePets then
            warn("稀有宠物文件夹不存在!")
            return
        end
        local TargetPet = RarePets:FindFirstChild(PetNameInput)
        if not TargetPet then
            warn("宠物不存在: " .. PetNameInput)
            return
        end
        -- 执行复制
        for i = 1, CopyCount do
            local PetClone = TargetPet:Clone()
            PetClone.Name = PetNameInput .. " (Copy " .. i .. ")"
            PetClone.Parent = RarePets
            task.wait(0.1)
        end
        warn("成功复制 " .. CopyCount .. " 个宠物: " .. PetNameInput)
    end
})

-- ===================== 通行证解锁标签页 (本地修改) =====================
local GamePassTab = Window:Tab({Title = "破解通行证", Icon = "settings"})
local GamePassList = {
    "+2 Pet Slots", "+3 Pet Slots", "+4 Pet Slots",
    "+100 Capacity", "+200 Capacity", "+20 Capacity", "+60 Capacity",
    "Infinite Ammo", "Infinite Ninjitsu", "Permanent Islands Unlock",
    "x2 Coins", "x2 Damage", "x2 Health", "x2 Ninjitsu", "x2 Speed",
    "Faster Sword", "x3 Pet Clones"
}

-- 批量生成通行证按钮
local function createGamePassButton(name)
    GamePassTab:Button({
        Title = "解锁" .. name,
        Callback = function()
            local GamePassIds = ReplicatedStorage:FindFirstChild("gamepassIds")
            if not GamePassIds then
                warn("通行证ID文件夹不存在!")
                return
            end
            local TargetPass = GamePassIds:FindFirstChild(name)
            if not TargetPass then
                warn("通行证不存在: " .. name)
                return
            end
            local OwnedPasses = LocalPlayer:FindFirstChild("ownedGamepasses")
            if not OwnedPasses then
                warn("已拥有通行证文件夹不存在!")
                return
            end
            TargetPass.Parent = OwnedPasses
            warn("已解锁通行证: " .. name)
        end
    })
end

for _, PassName in ipairs(GamePassList) do
    createGamePassButton(PassName)
end

-- ===================== 信息显示标签页 =====================
local InfoTab = Window:Tab({Title = "信息面板", Icon = "settings"})
local Leaderstats = LocalPlayer:FindFirstChild("leaderstats")

-- 信息刷新函数
local function updateInfo()
    if not Leaderstats then return end
    local StatsList = {
        {"忍术", Leaderstats:FindFirstChild("Ninjitsu")},
        {"杀戮", Leaderstats:FindFirstChild("Kills")},
        {"阶级", Leaderstats:FindFirstChild("Rank")},
        {"条纹", Leaderstats:FindFirstChild("Streak")}
    }
    local PlayerStats = {
        {"气", LocalPlayer:FindFirstChild("Chi")},
        {"硬币", LocalPlayer:FindFirstChild("Coins")},
        {"决斗", LocalPlayer:FindFirstChild("Duels")},
        {"宝石", LocalPlayer:FindFirstChild("Gems")},
        {"灵魂", LocalPlayer:FindFirstChild("Souls")},
        {"业报", LocalPlayer:FindFirstChild("Karma")}
    }
    -- 清空旧信息 (根据 UI 库特性调整)
    -- 显示 Leaderstats
    for _, Stat in ipairs(StatsList) do
        local Name, ValueObj = Stat[1], Stat[2]
        if ValueObj then
            InfoTab:Paragraph({
                Title = Name .. ": " .. ValueObj.Value,
                Callback = function()
                    return Name .. ": " .. ValueObj.Value
                end
            })
        end
    end
    -- 显示玩家属性
    for _, Stat in ipairs(PlayerStats) do
        local Name, ValueObj = Stat[1], Stat[2]
        if ValueObj then
            InfoTab:Paragraph({
                Title = Name .. ": " .. ValueObj.Value,
                Callback = function()
                    return Name .. ": " .. ValueObj.Value
                end
            })
        end
    end
end

-- 初始化信息显示
updateInfo()
-- 定时刷新
spawn(function()
    while true do
        task.wait(1)
        updateInfo()
    end
end)

-- ===================== 自动刷BOSS标签页 =====================
local BossTab = Window:Tab({Title = "自动刷boss", Icon = "settings"})
local BossList = {
    {Name = "普通Boss", EnvKey = "AutoBo", BossName = "RobotBoss"},
    {Name = "永恒Boss", EnvKey = "AutoBo1", BossName = "EternalBoss"},
    {Name = "岩浆Boss", EnvKey = "AutoBo2", BossName = "AncientMagmaBoss"}
}

-- 批量生成BOSS开关
local function createBossToggle(bossData)
    BossTab:Toggle({
        Title = bossData.Name,
        Default = false,
        Callback = function(state)
            GlobalEnv[bossData.EnvKey] = state
            if state then
                spawn(function()
                    while GlobalEnv[bossData.EnvKey] do
                        task.wait(Config.Delay.AutoBoss)
                        local Char = LocalPlayer.Character
                        if not Char then break end
                        -- 定位BOSS
                        local BossFolder = Workspace:FindFirstChild("bossFolder")
                        if not BossFolder then continue end
                        local Boss = BossFolder:FindFirstChild(bossData.BossName)
                        if not Boss or not Boss:FindFirstChild("UpperTorso") then continue end
                        -- 传送到BOSS位置并攻击
                        teleportTo(Boss.UpperTorso.CFrame)
                        fireEvent("ninjaEvent", "swingKatana")
                    end
                end
            end
        end
    })
end

for _, BossData in ipairs(BossList) do
    createBossToggle(BossData)
end

-- ===================== 金币修改标签页 =====================
local CoinTab = Window:Tab({Title = "修改金币", Icon = "settings"})
local LastInputValue = 0
local IsCoinLooping = false

-- 初始化第一步
CoinTab:Button({
    Title = "初始化第一步",
    Callback = function()
        local ZenEvent = ReplicatedStorage:FindFirstChild("rEvents"):FindFirstChild("zenMasterEvent")
        if not ZenEvent then
            warn("金币事件不存在!")
            return
        end
        ZenEvent:FireServer("convertGems", -999999999)
        warn("初始化第一步已执行!")
    end
})

-- 初始化第二步
CoinTab:Button({
    Title = "初始化第二步",
    Callback = function()
        local ElementEvent = ReplicatedStorage:FindFirstChild("rEvents"):FindFirstChild("elementMasteryEvent")
        if not ElementEvent then
            warn("元素事件不存在!")
            return
        end
        ElementEvent:FireServer("Shadow Charge")
        warn("初始化第二步已执行!")
    end
})

-- 输入数字
CoinTab:Input({
    Title = "输入数字上传数据",
    Value = "",
    Placeholder = "请输入数字",
    Callback = function(input)
        local Num = tonumber(input)
        if Num and Num > 0 then
            LastInputValue = Num
            local ZenEvent = ReplicatedStorage:FindFirstChild("rEvents"):FindFirstChild("zenMasterEvent")
            if ZenEvent then
                ZenEvent:FireServer("convertGems", Num)
            end
        end
    end
})

-- 循环上传
CoinTab:Toggle({
    Title = "循环上传",
    Default = false,
    Callback = function(state)
        IsCoinLooping = state
        if state then
            spawn(function()
                while IsCoinLooping and LastInputValue > 0 do
                    task.wait(0.5)
                    local ZenEvent = ReplicatedStorage:FindFirstChild("rEvents"):FindFirstChild("zenMasterEvent")
                    if ZenEvent then
                        ZenEvent:FireServer("convertGems", LastInputValue)
                    end
                end
            end)
        end
    end
})

-- 恢复金币
CoinTab:Button({
    Title = "恢复金币",
    Callback = function()
        local ZenEvent = ReplicatedStorage:FindFirstChild("rEvents"):FindFirstChild("zenMasterEvent")
        if ZenEvent then
            ZenEvent:FireServer("convertGems", 1)
            warn("金币已恢复默认值!")
        end
    end
})

-- ===================== 人物修改标签页 =====================
local PlayerTab = Window:Tab({Title = "人物修改", Icon = "settings"})

-- 修改连跳上限
PlayerTab:Input({
    Title = "修改连跳上限",
    Placeholder = "输入连跳次数",
    Callback = function(input)
        local MultiJump = LocalPlayer:FindFirstChild("multiJumpCount")
        if not MultiJump then
            warn("连跳属性不存在!")
            return
        end
        local Num = tonumber(input)
        if Num then
            MultiJump.Value = Num
            warn("连跳上限已设为: " .. Num)
        end
    end
})

-- 解锁所有岛屿
PlayerTab:Button({
    Title = "解锁所有岛屿",
    Callback = function()
        local Positions = {
            CFrame.new(26, 766, -114),
            CFrame.new(247, 2013, 347),
            CFrame.new(162, 4047, 13),
            CFrame.new(200, 5656, 13),
            CFrame.new(200, 9284, 13),
            CFrame.new(200, 13679, 13),
            CFrame.new(200, 17686, 13),
            CFrame.new(200, 24069, 13),
            CFrame.new(197, 28256, 7),
            CFrame.new(197, 33206, 7),
            CFrame.new(197, 39317, 7),
            CFrame.new(197, 46010, 7),
            CFrame.new(197, 52607, 7),
            CFrame.new(197, 59594, 7),
            CFrame.new(197, 66668, 7),
            CFrame.new(197, 70270, 7),
            CFrame.new(197, 74442, 7),
            CFrame.new(197, 79746, 7),
            CFrame.new(197, 83198, 7),
            CFrame.new(197, 91245, 7)
        }
        for _, Pos in ipairs(Positions) do
            teleportTo(Pos)
            task.wait(0.1)
        end
        warn("所有岛屿已解锁!")
    end
})

-- ===================== 自动抽奖标签页 =====================
local EggTab = Window:Tab({Title = "抽奖功能", Icon = "settings"})
local SelectedEgg = ""

-- 获取所有抽奖机
local function getEggList()
    local EggList = {}
    local MapCrystals = Workspace:FindFirstChild("mapCrystalsFolder")
    if MapCrystals then
        for _, Crystal in ipairs(MapCrystals:GetChildren()) do
            table.insert(EggList, Crystal.Name)
        end
    end
    return EggList
end

-- 抽奖机下拉框
EggTab:Dropdown({
    Title = "选择抽奖机",
    Values = getEggList(),
    Value = "",
    Callback = function(selected)
        SelectedEgg = selected
    end
})

-- 自动抽奖开关
EggTab:Toggle({
    Title = "自动购买抽奖",
    Default = false,
    Callback = function(state)
        GlobalEnv.AutoEgg = state
        if state then
            spawn(function()
                while GlobalEnv.AutoEgg do
                    task.wait(Config.Delay.AutoEgg)
                    if SelectedEgg == "" then continue end
                    local EggEvent = ReplicatedStorage:FindFirstChild("rEvents"):FindFirstChild("openCrystalRemote")
                    if EggEvent then
                        local Success, Err = pcall(function()
                            EggEvent:InvokeServer("openCrystal", SelectedEgg)
                        end)
                        if not Success then
                            warn("抽奖失败: " .. Err)
                        end
                    end
                end
            end)
        end
    end
})

-- ===================== 脚本结束 =====================
warn("多功能辅助脚本加载完成!")
