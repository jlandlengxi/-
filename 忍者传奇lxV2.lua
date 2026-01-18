-- 冷兮 忍者传奇V2 | 集成WindUI卡密验证
-- 加载WindUI界面库
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- 创建主窗口(带卡密验证)
local Window = WindUI:CreateWindow({
    Title = "<font color='#FF66CC'>打开/点开冷兮1.0脚本</font>",
    Size = UDim2.fromOffset(100, 50),
    Transparent = true,
    Theme = "Dark",
    User = {
        Enabled = true,
        Callback = function() print("[冷兮脚本] 用户按钮被点击") end,
        Anonymous = false
    },
    -- 卡密验证核心配置
    KeySystem = { 
        Key = { "lxnb" }, -- 有效卡密列表(可添加多个)
        Note = "请输入卡密.",
        Thumbnail = {
            Image = "rbxassetid://75198135626218",
            Title = "冷兮脚本验证系统"
        },
        SaveKey = false, -- 关闭自动保存卡密(提升安全性)
        -- 可添加API验证: API = { Url = "你的验证接口", Method = "POST" }
    },
})

-- 卡密验证通过后 加载Redzhubui功能库
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

-- 创建功能子窗口
local FuncWindow = redzlib:MakeWindow({
    Title = "lx脚本V2",
    SubTitle = "by 冷兮",
    SaveFolder = "忍者传奇lx_V2"
})

-- 添加最小化按钮
FuncWindow:AddMinimizeButton({
    Button = { Image = "rbxassetid://82031063194606", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(20, 20) }
})

-- ====================== 标签页创建 ======================
local FarmingTab = FuncWindow:MakeTab({"自动刷", "zap"})
local AutoBuyTab = FuncWindow:MakeTab({"自动购买", "shopping-cart"})
local PetsTab = FuncWindow:MakeTab({"宠物管理", "paw"})
local PetShopTab = FuncWindow:MakeTab({"元素", "cart"})
local TeleportsTab = FuncWindow:MakeTab({"传送", "map"})
local MiscTab = FuncWindow:MakeTab({"杂项", "tool"})

local player = game.Players.LocalPlayer
FuncWindow:SelectTab(FarmingTab)

-- ====================== 自动刷标签页 ======================
FarmingTab:AddToggle({
    Name = "自动挥刀",
    Description = "自动使用武器攻击",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSwing = Value
    end
})

FarmingTab:AddToggle({
    Name = "自动出售",
    Description = "自动出售物品",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSell = Value
    end
})

FarmingTab:AddToggle({
    Name = "自动全部出售",
    Description = "背包满时自动出售",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFullSell = Value
    end
})

FarmingTab:AddSection({"收集"})

FarmingTab:AddToggle({
    Name = "自动捡气和金币",
    Description = "",
    Default = false,
    Callback = function(Value)
        getgenv().AutoPetLevel = Value
    end
})

FarmingTab:AddSection({"Boss击杀"})

FarmingTab:AddToggle({
    Name = "自动杀机器人Boss",
    Default = false,
    Callback = function(Value)
        getgenv().AutoRobotBoss = Value
    end
})

FarmingTab:AddToggle({
    Name = "自动杀不朽Boss",
    Default = false,
    Callback = function(Value)
        getgenv().AutoEternalBoss = Value
    end
})

FarmingTab:AddToggle({
    Name = "自动杀古代Boss",
    Default = false,
    Callback = function(Value)
        getgenv().AutoAncientBoss = Value
    end
})

FarmingTab:AddToggle({
    Name = "自动杀圣诞老人Boss",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSantaBoss = Value
    end
})

FarmingTab:AddToggle({
    Name = "自动杀全部Boss",
    Description = "按顺序击杀所有Boss",
    Default = false,
    Callback = function(Value)
        getgenv().AutoAllBosses = Value
    end
})

-- ====================== 自动购买标签页 ======================
AutoBuyTab:AddSection({"自动购买选项"})

AutoBuyTab:AddToggle({
    Name = "自动买等级",
    Description = "自动提升等级",
    Default = false,
    Callback = function(Value)
        getgenv().AutoRank = Value
    end
})

AutoBuyTab:AddToggle({
    Name = "自动买剑",
    Description = "自动购买所有剑",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSword = Value
    end
})

AutoBuyTab:AddToggle({
    Name = "自动买腰带",
    Description = "自动购买所有腰带",
    Default = false,
    Callback = function(Value)
        getgenv().AutoBelt = Value
    end
})

AutoBuyTab:AddToggle({
    Name = "自动买技能",
    Description = "自动购买所有技能",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSkill = Value
    end
})

AutoBuyTab:AddToggle({
    Name = "自动买飞镖",
    Description = "自动购买所有飞镖",
    Default = false,
    Callback = function(Value)
        getgenv().AutoShuriken = Value
    end
})

-- ====================== 宠物管理标签页 ======================
PetsTab:AddSection({"打开宠物"})

local Crystals = {}
for _, v in pairs(game.Workspace.mapCrystalsFolder:GetChildren()) do
    table.insert(Crystals, v.Name)
end

PetsTab:AddDropdown({
    Name = "选择水晶",
    Description = "选择要开启的水晶蛋",
    Options = Crystals,
    Default = Crystals[1] or "None",
    Callback = function(Value)
        getgenv().SelectedCrystal = Value
    end
})

PetsTab:AddToggle({
    Name = "自动开蛋",
    Description = "自动开启选中的水晶蛋",
    Default = false,
    Callback = function(Value)
        getgenv().AutoOpenEgg = Value
    end
})

PetsTab:AddToggle({
    Name = "自动购买双元素小鸟",
    Description = "其它的用外不大",
    Default = false,
    Callback = function(Value)
        getgenv().AutoBuyTwinBirdies = Value
    end
})

-- ====================== 元素标签页 ======================
PetShopTab:AddSection({"元素解锁"})

local elements = {"Inferno", "Frost", "Electral Chaos", "Lightning", "Shadow Charge", "Masterful Wrath", "Eternity Storm", "Shadowfire", "Blazing Entity"}

for _, element in pairs(elements) do
    PetShopTab:AddButton({
        Name = "解锁 " .. element,
        Callback = function()
            game:GetService("ReplicatedStorage").rEvents.elementMasteryEvent:FireServer(element)
        end
    })
end

-- ====================== 传送标签页 ======================
TeleportsTab:AddSection({"岛屿传送"})

local Islands = {}
for _, v in pairs(game.Workspace.islandUnlockParts:GetChildren()) do
    table.insert(Islands, v.Name)
end

TeleportsTab:AddDropdown({
    Name = "选择岛屿",
    Description = "传送到选中的岛屿",
    Options = Islands,
    Default = Islands[1] or "None",
    Callback = function(Value)
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = game.Workspace.islandUnlockParts[Value].islandSignPart.CFrame
        end
    end
})

-- ====================== 杂项标签页 ======================
MiscTab:AddSection({"辅助功能"})

MiscTab:AddToggle({
    Name = "快速手里剑",
    Description = "加快手里剑速度",
    Default = false,
    Callback = function(Value)
        getgenv().FastShuriken = Value
    end
})

MiscTab:AddToggle({
    Name = "慢速手里剑",
    Description = "减慢手里剑速度",
    Default = false,
    Callback = function(Value)
        getgenv().SlowShuriken = Value
    end
})

MiscTab:AddToggle({
    Name = "隐身",
    Description = "进入隐身状态",
    Default = false,
    Callback = function(Value)
        getgenv().Invisible = Value
    end
})

MiscTab:AddToggle({
    Name = "防AFK",
    Description = "防止被踢出游戏",
    Default = true,
    Callback = function(Value)
        getgenv().AntiAFK = Value
    end
})

MiscTab:AddButton({
    Name = "收集所有宝箱",
    Callback = function()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local chests = {"mythicalChest", "goldenChest", "enchantedChest", "magmaChest", "legendsChest", "eternalChest", "saharaChest", "thunderChest", "ancientChest", "midnightShadowChest"}
            for _, chest in pairs(chests) do
                if game.Workspace:FindFirstChild(chest) then
                    game.Workspace[chest].circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
                    wait(3.5)
                end
            end
        end
    end
})

-- ====================== 刷金币标签页 ======================
local Tab8 = FuncWindow:MakeTab({"刷金币", "coins"})

Tab8:AddParagraph({"使用说明", "第一步点击初始化\n第二步元素重生\n第三步可以开始刷了"})
Tab8:AddParagraph({"警告:使用后永久无法交易"})

Tab8:AddButton({
    Name = "刷金币初始化",
    Callback = function()
        local args = {
            [1] = "convertGems",
            [2] = -99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
        }
        local rEvents = game:GetService("ReplicatedStorage"):FindFirstChild("rEvents")
        local event = rEvents and rEvents:FindFirstChild("zenMasterEvent")
        if event then
            event:FireServer(unpack(args))
        end
    end
})

local gemValue = 100000
Tab8:AddTextBox({
    Name = "自定义 金币 数值",
    Callback = function(val)
        local num = tonumber(val)
        if num then
            gemValue = num
            local rEvents = game:GetService("ReplicatedStorage"):FindFirstChild("rEvents")
            local event = rEvents and rEvents:FindFirstChild("zenMasterEvent")
            if event then
                event:FireServer("convertGems", gemValue)
            end
        end
    end
})

local isAuto = false
Tab8:AddToggle({
    Name = "自动刷金币",
    Default = false,
    Callback = function(state)
        isAuto = state
        if isAuto then
            task.spawn(function()
                while isAuto do
                    local rEvents = game:GetService("ReplicatedStorage"):FindFirstChild("rEvents")
                    local event = rEvents and rEvents:FindFirstChild("zenMasterEvent")
                    if event then
                        event:FireServer("convertGems", gemValue)
                    end
                    wait(0.1)
                end
            end)
        end
    end
})

-- ====================== 功能逻辑核心 ======================
-- 自动挥刀逻辑
spawn(function()
    while wait(0.1) do
        if getgenv().AutoSwing and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if player.Character:FindFirstChildOfClass("Tool") then
                player.ninjaEvent:FireServer("swingKatana")
            else
                for _, v in pairs(player.Backpack:GetChildren()) do
                    if v.ClassName == "Tool" and v:FindFirstChild("attackKatanaScript") then
                        player.Character.Humanoid:EquipTool(v)
                        break
                    end
                end
            end
        end
    end
end)

-- 自动出售逻辑
spawn(function()
    while wait(0.05) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if getgenv().AutoSell then
                game.Workspace.sellAreaCircles.sellAreaCircle7.circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
                wait(0.1)
                game.Workspace.sellAreaCircles.sellAreaCircle7.circleInner.CFrame = game.Workspace.Part.CFrame
            end
            if getgenv().AutoFullSell and player.PlayerGui.gameGui.maxNinjitsuMenu.Visible then
                game.Workspace.sellAreaCircles.sellAreaCircle7.circleInner.CFrame = player.Character.HumanoidRootPart.CFrame
                wait(0.05)
                game.Workspace.sellAreaCircles.sellAreaCircle7.circleInner.CFrame = game.Workspace.Part.CFrame
            end
        end
    end
end)

-- 自动捡气和金币逻辑
spawn(function()
    while wait(0.1) do
        if getgenv().AutoChi and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            for _, v in pairs(game.Workspace.spawnedCoins.Valley:GetChildren()) do
                if v.Name == "Blue Chi Crate" then
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                    wait(0.16)
                end
            end
        end
    end
end)

-- 自动收集逻辑
spawn(function()
    while wait(0.05) do
        if getgenv().AutoPetLevel and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            for _, v in pairs(game.Workspace.Hoops:GetDescendants()) do
                if v.ClassName == "MeshPart" and v:FindFirstChild("touchPart") then
                    v.touchPart.CFrame = player.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end
end)

-- Boss自动击杀通用函数
local function autoBoss(bossName, toggle)
    spawn(function()
        while wait(0.1) do
            if getgenv()[toggle] and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local boss = game.Workspace.bossFolder:FindFirstChild(bossName)
                if boss and boss:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame
                    if player.Character:FindFirstChildOfClass("Tool") then
                        player.Character:FindFirstChildOfClass("Tool"):Activate()
                    else
                        for _, v in pairs(player.Backpack:GetChildren()) do
                            if v.ClassName == "Tool" and v:FindFirstChild("attackKatanaScript") then
                                v.attackTime.Value = 0.2
                                player.Character.Humanoid:EquipTool(v)
                                break
                            end
                        end
                    end
                end
            end
        end
    end)
end

-- 注册Boss击杀
autoBoss("RobotBoss", "AutoRobotBoss")
autoBoss("EternalBoss", "AutoEternalBoss")
autoBoss("AncientMagmaBoss", "AutoAncientBoss")
autoBoss("Samurai Santa", "AutoSantaBoss")

-- 自动击杀全部Boss
spawn(function()
    while wait(0.1) do
        if getgenv().AutoAllBosses and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local bosses = {"Samurai Santa", "AncientMagmaBoss", "EternalBoss", "RobotBoss"}
            for _, bossName in pairs(bosses) do
                local boss = game.Workspace.bossFolder:FindFirstChild(bossName)
                if boss and boss:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame
                    if player.Character:FindFirstChildOfClass("Tool") then
                        player.Character:FindFirstChildOfClass("Tool"):Activate()
                    else
                        for _, v in pairs(player.Backpack:GetChildren()) do
                            if v.ClassName == "Tool" and v:FindFirstChild("attackKatanaScript") then
                                v.attackTime.Value = 0.2
                                player.Character.Humanoid:EquipTool(v)
                                break
                            end
                        end
                    end
                    break
                end
            end
        end
    end
end)

-- 自动购买通用函数
local function autoBuy(event, arg, toggle)
    spawn(function()
        while wait(0.5) do
            if getgenv()[toggle] and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if type(arg) == "table" then
                    for _, v in pairs(arg) do
                        player.ninjaEvent:FireServer(event, v)
                    end
                else
                    for _, v in pairs(arg:GetChildren()) do
                        player.ninjaEvent:FireServer(event, v.Name)
                    end
                end
            end
        end
    end)
end

-- 注册自动购买
local buyAreas = {"Ground", "Astral Island", "Space Island", "Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island"}
autoBuy("buyAllSwords", buyAreas, "AutoSword")
autoBuy("buyAllBelts", buyAreas, "AutoBelt")
autoBuy("buyAllSkills", buyAreas, "AutoSkill")
autoBuy("buyRank", game:GetService("ReplicatedStorage").Ranks.Ground, "AutoRank")
autoBuy("buyAllShurikens", buyAreas, "AutoShuriken")

-- 自动开蛋逻辑
spawn(function()
    while wait(0.1) do
        if getgenv().AutoOpenEgg and getgenv().SelectedCrystal then
            game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal", getgenv().SelectedCrystal)
        end
    end
end)

-- 自动进化宠物逻辑
spawn(function()
    while wait(0.5) do
        if getgenv().AutoEvolve and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            for _, v in pairs(player.petsFolder:GetChildren()) do
                for _, x in pairs(v:GetChildren()) do
                    game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer("evolvePet", x.Name)
                end
            end
        end
    end
end)

-- 自动购买双元素小鸟逻辑
spawn(function()
    while wait(0.5) do
        if getgenv().AutoBuyTwinBirdies then
            game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(game:GetService("ReplicatedStorage").cPetShopFolder:FindFirstChild("Twin Element Birdies"))
        end
    end
end)

-- 隐身+手里剑速度控制逻辑
spawn(function()
    while wait(0.1) do
        if getgenv().Invisible then
            player.ninjaEvent:FireServer("goInvisible")
        end
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local Mouse = player:GetMouse()
            for _, p in pairs(game.Workspace.shurikensFolder:GetChildren()) do
                if p.Name == "Handle" and p:FindFirstChild("BodyVelocity") then
                    local bv = p:FindFirstChildOfClass("BodyVelocity")
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    if getgenv().FastShuriken then
                        bv.Velocity = Mouse.Hit.lookVector * 1000
                    elseif getgenv().SlowShuriken then
                        bv.Velocity = Mouse.Hit.lookVector * 35
                    end
                end
            end
        end
    end
end)

-- 防AFK逻辑
local vu = game:GetService("VirtualUser")
spawn(function()
    while wait(1) do
        if getgenv().AntiAFK then
            vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end
    end
end)

-- 显示功能窗口
FuncWindow:Show()
