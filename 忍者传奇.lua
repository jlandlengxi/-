--by 神青 公开[已退网]
local Main = Window:Tab({Title = "主要", Icon = "settings"})

local AutoSettings = {
    AutoSwing = false,
    AutoSell = false,
    AutoR = false,
    AutoS = false,
    AutoB = false,
    AutoC = false,
    AutoE = false,
    AutoCr = false,
    AutoTa = false,
    AutoBo = false,
    AutoBo1 = false,
    AutoBo2 = false
}

for k, v in pairs(AutoSettings) do
    getgenv()[k] = v
end

local function teleportTo(placeCFrame)
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        plyr.Character.HumanoidRootPart.CFrame = placeCFrame
    end
end

Main:Toggle({
    Title = "自动挥刀",
    Default = false,
    Callback = function(state)
        getgenv().AutoSwing = state
        
        if state then
            spawn(function()
                while AutoSwing == true do
                    if not getgenv() then break end
                    local args = {[1] = "swingKatana"}
                    game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))    
                    wait()
                end
            end)
        end
    end
})

Main:Toggle({
    Title = "自动售卖",
    Default = false,
    Callback = function(state)
        getgenv().AutoSell = state
        
        if state then
            spawn(function()
                while AutoSell == true do
                    if not getgenv() then break end
                    local playerHead = game.Players.LocalPlayer.Character.Head
                    for _, v in pairs(game:GetService("Workspace").sellAreaCircles.sellAreaCircle16.circleInner:GetDescendants()) do
                        if v.Name == "TouchInterest" and v.Parent then
                            firetouchinterest(playerHead, v.Parent, 0)
                            wait(0.1)
                            firetouchinterest(playerHead, v.Parent, 1)
                            break
                        end
                    end
                end
            end)
        end
    end
})

Main:Toggle({
    Title = "自动重生职位",
    Default = false,
    Callback = function(state)
        getgenv().AutoR = state
        
        if state then
            spawn(function()
                while AutoR == true do
                    if not getgenv() then break end
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
                    
                    for i = 1, #ranks, 5 do
                        for j = i, math.min(i+4, #ranks) do
                            local args = {[1] = "buyRank", [2] = ranks[j]}
                            game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                        end
                        wait()
                    end
                end
            end)
        end
    end
})

Main:Toggle({
    Title = "自动购买称号",
    Default = false,
    Callback = function(state)
        getgenv().AutoB = state
        
        if state then
            spawn(function()
                while AutoB == true do
                    if not getgenv() then break end
                    local args = {[1] = "buyAllBelts", [2] = "Blazing Vortex Island"}
                    game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))        
                    wait(0.5)
                end
            end)
        end
    end
})

Main:Toggle({
    Title = "自动购买刀",
    Default = false,
    Callback = function(state)
        getgenv().AutoS = state
        
        if state then
            spawn(function()
                while AutoS == true do
                    if not getgenv() then break end
                    local args = {[1] = "buyAllSwords", [2] = "Blazing Vortex Island"}
                    game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))        
                    wait(0.5)
                end
            end)
        end
    end
})

local isRunning = false
Main:Toggle({
    Title = "自动把圈传送过来",
    Default = false,
    Callback = function(state)
        if state and not isRunning then
            isRunning = true
            spawn(function()
                while isRunning do
                    local playerCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    local children = workspace.Hoops:GetChildren()
                    for i, child in ipairs(children) do
                        if child.Name == "Hoop" then
                            child.CFrame = playerCFrame
                        end
                    end
                    wait()
                end
            end)
        else
            isRunning = false
        end
    end
})

Main:Toggle({
    Title = "自动吸气",
    Default = false,
    Callback = function(state)
        getgenv().AutoC = state
        
        if state then
            spawn(function()
                while AutoC == true do
                    if not getgenv() then break end
                    local coinLocations = {
                        game:GetService("Workspace").spawnedCoins.Valley["Pink Chi Crate"].CFrame,
                        game:GetService("Workspace").spawnedCoins.Valley["Blue Chi Crate"].CFrame,
                        game:GetService("Workspace").spawnedCoins.Valley["Chi Crate"].CFrame
                    }
                    
                    for _, location in ipairs(coinLocations) do
                        teleportTo(location)
                        wait(0.1)
                    end
                    wait()
                end
            end)
        end
    end
})

Main:Button({
    Title = "获取所有元素[永久]",
    Callback = function()
        for i, v in pairs(game:GetService("ReplicatedStorage").Elements:GetChildren()) do
            local allelement = v.Name
            game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer(allelement)
        end
    end
})


Main:Toggle({
    Title = "自动收集元素",
    Default = false,
    Callback = function(state)
        getgenv().AutoE = state
        
        if state then
            spawn(function()
                while AutoE == true do
                    if not getgenv() then break end
                    local elements = {
                        "Inferno", "Frost", "Lightning", "Electral Chaos",
                        "Shadow Charge", "Masterful Wrath", "Shadowfire",
                        "Eternity Storm", "Blazing Entity"
                    }
                    
                    for _, element in ipairs(elements) do
                        local args = {[1] = element}
                        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("elementMasteryEvent"):FireServer(unpack(args))
                        wait()
                    end
                end
            end)
        end
    end
})

local Main = Window:Tab({Title = "复制宠物", Icon = "settings"})
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local petsFolder = player.petsFolder
local rarePets = petsFolder.Rare
local petNameInput = ""
local copyCount = 1
Main:Input({
    Title = "宠物名字",
    Desc = "宠物名",
    Value = "",
    Placeholder = "例如: Red Dragon",
    Color = Color3.fromRGB(0, 170, 255),
    Callback = function(input)
        petNameInput = input
    end
})

Main:Input({
    Title = "复制次数",
    Desc = "写",
    Value = "1",
    Placeholder = "例如: 5",
    Color = Color3.fromRGB(0, 170, 255),
    Callback = function(input)
        copyCount = tonumber(input) or 1
    end
})

Main:Button({
    Title = "复制宠物",
    Desc = "pet6666",
    Color = Color3.fromRGB(0, 170, 255),
    Callback = function()
        if petNameInput and petNameInput ~= "" then
            local targetPet = rarePets[petNameInput]
            if targetPet then
                for i = 1, copyCount do
                    local petClone = targetPet:Clone()
                    petClone.Parent = rarePets
                    petClone.Name = petNameInput .. " (Copy " .. i .. ")"
                    task.wait(0.1)
                end
            else
           
            end
        else
        end
    end
})

local Main = Window:Tab({Title = "破解通行证", Icon = "settings"})
Main:Button({
    Title = "解锁+2宠物栏位通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["+2 Pet Slots"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁+3宠物栏位通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["+3 Pet Slots"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁+4宠物栏位通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["+4 Pet Slots"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁+100容量通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["+100 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁+200容量通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["+200 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁+20容量通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["+20 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁+60容量通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["+60 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁无限弹药通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["Infinite Ammo"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁无限忍术通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["Infinite Ninjitsu"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁永久岛屿通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["Permanent Islands Unlock"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁双倍金币通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["x2 Coins"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁双倍伤害通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["x2 Damage"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁双倍生命值通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["x2 Health"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁双倍忍术通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["x2 Ninjitsu"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁双倍速度通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["x2 Speed"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})
Main:Button({
    Title = "解锁更快剑速通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["Faster Sword"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

Main:Button({
    Title = "解锁3个宠物克隆通行证",
    Callback = function()
        game:GetService("ReplicatedStorage").gamepassIds["x3 Pet Clones"].Parent = game.Players.LocalPlayer.ownedGamepasses
    end
})

local Main = Window:Tab({Title = "信息", Icon = "settings"})

Main:Paragraph({
    Title = "忍术: " .. game:GetService("Players").LocalPlayer.leaderstats.Ninjitsu.Value,
    Callback = function(Value)
        return "忍术: " .. game:GetService("Players").LocalPlayer.leaderstats.Ninjitsu.Value
    end
})

Main:Paragraph({
    Title = "杀戮: " .. game:GetService("Players").LocalPlayer.leaderstats.Kills.Value,
    Callback = function(Value)
        return "杀戮: " .. game:GetService("Players").LocalPlayer.leaderstats.Kills.Value
    end
})

Main:Paragraph({
    Title = "阶级: " .. game:GetService("Players").LocalPlayer.leaderstats.Rank.Value,
    Callback = function(Value)
        return "阶级: " .. game:GetService("Players").LocalPlayer.leaderstats.Rank.Value
    end
})

Main:Paragraph({
    Title = "条纹: " .. game:GetService("Players").LocalPlayer.leaderstats.Streak.Value,
    Callback = function(Value)
        return "条纹: " .. game:GetService("Players").LocalPlayer.leaderstats.Streak.Value
    end
})

Main:Paragraph({
    Title = "气: " .. game:GetService("Players").LocalPlayer.Chi.Value,
    Callback = function(Value)
        return "气: " .. game:GetService("Players").LocalPlayer.Chi.Value
    end
})

Main:Paragraph({
    Title = "硬币: " .. game:GetService("Players").LocalPlayer.Coins.Value,
    Callback = function(Value)
        return "硬币: " .. game:GetService("Players").LocalPlayer.Coins.Value
    end
})

Main:Paragraph({
    Title = "决斗: " .. game:GetService("Players").LocalPlayer.Duels.Value,
    Callback = function(Value)
        return "决斗: " .. game:GetService("Players").LocalPlayer.Duels.Value
    end
})

Main:Paragraph({
    Title = "宝石: " .. game:GetService("Players").LocalPlayer.Gems.Value,
    Callback = function(Value)
        return "宝石: " .. game:GetService("Players").LocalPlayer.Gems.Value
    end
})

Main:Paragraph({
    Title = "灵魂: " .. game:GetService("Players").LocalPlayer.Souls.Value,
    Callback = function(Value)
        return "灵魂: " .. game:GetService("Players").LocalPlayer.Souls.Value
    end
})

Main:Paragraph({
    Title = "业报: " .. game:GetService("Players").LocalPlayer.Karma.Value,
    Callback = function(Value)
        return "业报: " .. game:GetService("Players").LocalPlayer.Karma.Value
    end
})

local Main = Window:Tab({Title = "自动刷boss", Icon = "settings"})

Main:Toggle({
    Title = "普通Boss",
    Default = false,
    Callback = function(state)
        getgenv().AutoBo = state
        
        if state then
            spawn(function()
                while AutoBo == true do
                    if not getgenv() then break end
                    teleportTo(game:GetService("Workspace").bossFolder.RobotBoss.UpperTorso.CFrame)
                    local args = {[1] = "swingKatana"}
                    game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                    wait()
                end
            end)
        end
    end
})

Main:Toggle({
    Title = "永恒Boss",
    Default = false,
    Callback = function(state)
        getgenv().AutoBo1 = state
        
        if state then
            spawn(function()
                while AutoBo1 == true do
                    if not getgenv() then break end
                    teleportTo(game:GetService("Workspace").bossFolder.EternalBoss.UpperTorso.CFrame)
                    local args = {[1] = "swingKatana"}
                    game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                    wait()
                end
            end)
        end
    end
})

Main:Toggle({
    Title = "岩浆Boss",
    Default = false,
    Callback = function(state)
        getgenv().AutoBo2 = state
        
        if state then
            spawn(function()
                while AutoBo2 == true do
                    if not getgenv() then break end
                    teleportTo(game:GetService("Workspace").bossFolder.AncientMagmaBoss.UpperTorso.CFrame)
                    local args = {[1] = "swingKatana"}
                    game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                    wait()
                end
            end)
        end
    end
})

local Main = Window:Tab({Title = "修改金币", Icon = "settings"})

Main:Button({
    Title = "初始化第一步",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertGems", 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
    end
})

Main:Button({
    Title = "初始化第二步",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("elementMasteryEvent"):FireServer("Shadow Charge")
    end
})

local isLooping = false
local lastInputValue = 0

Main:Input({
    Title = "输入数字上传数据",
    Value = "",
    Placeholder = "请输入数字",
    Callback = function(I)
        local num = tonumber(I)
        if num and num > 0 then
            lastInputValue = num
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertGems", num)
        end
    end
})

Main:Toggle({
    Title = "循环上传",
    Default = false,
    Callback = function(state)
        isLooping = state
        if state then
            spawn(function()
                while isLooping and lastInputValue > 0 do
                    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertGems", lastInputValue)
                    wait(0.5)
                end
            end)
        end
    end
})

Main:Button({
    Title = "恢复金币",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("zenMasterEvent"):FireServer("convertGems", 1)
    end
})

local Main = Window:Tab({Title = "人物", Icon = "settings"})
Main:Input({
    Title = "修改连跳上限",
    Placeholder = "输入连跳次数",
    Callback = function(Value)
        game.Players.LocalPlayer.multiJumpCount.Value = tonumber(Value)
    end
})

Main:Button({
    Title = "解锁所有岛屿",
    Callback = function()
        local positions = {
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
        
        for _, pos in ipairs(positions) do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
            wait(0.1)
        end
    end
})

local Main = Window:Tab({Title = "抽奖", Icon = "settings"})

local eggs = {}
for i, v in pairs(game.Workspace.mapCrystalsFolder:GetChildren()) do
    table.insert(eggs, v.Name)
end

local selectegg = ""
Main:Dropdown({
    Title = "选择抽奖机", 
    Values = eggs,
    Value = "",
    Callback = function(selectedEgg)
        selectegg = selectedEgg
    end
})

Main:Toggle({
    Title = "自动购买", 
    Default = false,
    Callback = function(state)
        getgenv().openegg = state
        while getgenv().openegg do
            wait()
            local A_1 = "openCrystal"
            local A_2 = selectegg
            local Event = game:GetService("ReplicatedStorage").rEvents.openCrystalRemote
            Event:InvokeServer(A_1, A_2)
        end
    end
})
end
