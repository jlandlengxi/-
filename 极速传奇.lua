
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
local Confirmed = false

WindUI:Popup({
    Title = "冷兮自用极速传奇",
    IconThemed = true,
    Content = "欢迎尊贵的用户" .. game.Players.LocalPlayer.Name .. "使用冷兮自制  当前版本型号:V1",
    Buttons = {
        {
            Title = "取消",
            Callback = function() end,
            Variant = "Secondary",
        },
        {
            Title = "执行",
            Icon = "arrow-right",
            Callback = function() 
                Confirmed = true
                createUI()
            end,
            Variant = "Primary",
        }
    }
})
function createUI()
    local Window = WindUI:CreateWindow({
        Title = "冷兮自制极速传奇",
        Icon = "palette",
    Author = "尊贵的"..game.Players.localPlayer.Name.."欢迎使用冷兮自制极速传奇", 
        Folder = "Premium",
        Size = UDim2.fromOffset(550, 320),
        Theme = "Light",
        User = {
            Enabled = true,
            Anonymous = true,
            Callback = function()
            end
        },
        SideBarWidth = 200,
        HideSearchBar = false,  
    })

    Window:Tag({
        Title = "极速传奇",
        Color = Color3.fromHex("#00ffff") 
    })

    Window:EditOpenButton({
        Title = "冷兮自制极速传奇 V1",
        Icon = "crown",
        CornerRadius = UDim.new(0, 8),
        StrokeThickness = 3,
        Color = ColorSequence.new(
            Color3.fromRGB(255, 255, 0),  
            Color3.fromRGB(255, 165, 0),  
            Color3.fromRGB(255, 0, 0),    
            Color3.fromRGB(139, 0, 0)     
        ),
        Draggable = true,
    })
    
    local LanguageTab = Window:Tab({Title = "语言设置", Icon = "globe"})

local Translations = {
    -- Window and UI elements
    ["冷兮自制极速传奇"] = "冷兮自制极速传奇",
    ["尊贵的"] = "Respected ",
    ["欢迎使用冷兮自制极速传奇"] = "Welcome to 冷兮自制极速传奇",
    ["极速传奇"] = "Speed Legend",
    ["主要功能"] = "Main Features",
    ["比赛功能"] = "Race Features",
    ["数值修改"] = "Stats Editor",
    ["能量球收集"] = "Orb Collection",
    ["水晶功能"] = "Crystal Features",
    ["宠物功能"] = "Pet Features",
    ["宠物进化"] = "Pet Evolution",
    ["重生设置"] = "Rebirth Settings",
    ["信息"] = "Information",
    
    -- Main Features
    ["自动重生"] = "Auto Rebirth",
    ["获取所有宝箱"] = "Get All Chests",
    ["获取所有通行证"] = "Get All Gamepasses",
    
    -- Race Features
    ["选择比赛地图"] = "Select Race Map",
    ["传送到终点"] = "Teleport to Finish",
    ["自动参加比赛"] = "Auto Join Race",
    ["自动收集光环"] = "Auto Collect Hoops",
    
    -- Stats Editor
    ["修改经验值"] = "Edit EXP",
    ["输入经验值"] = "Enter EXP Value",
    ["修改等级"] = "Edit Level",
    ["输入等级"] = "Enter Level",
    ["修改比赛数"] = "Edit Race Count",
    ["输入比赛次数"] = "Enter Race Count",
    ["修改圈数"] = "Edit Lap Count",
    ["输入圈数"] = "Enter Lap Count",
    ["修改重生次数"] = "Edit Rebirths",
    ["输入重生次数"] = "Enter Rebirth Count",
    ["修改步数"] = "Edit Steps",
    ["输入步数"] = "Enter Step Count",
    ["修改宝石数量"] = "Edit Gems",
    ["输入宝石数量"] = "Enter Gem Count",
    
    -- Orb Collection
    ["选择地区"] = "Select Area",
    ["City"] = "City",
    ["Snow City"] = "Snow City",
    ["Magma City"] = "Magma City",
    ["Desert"] = "Desert",
    ["Space"] = "Space",
    ["Legends Highway"] = "Legends Highway",
    ["自动收集红球"] = "Auto Collect Red Orbs",
    ["自动收集蓝球"] = "Auto Collect Blue Orbs",
    ["自动收集宝石球"] = "Auto Collect Gem Orbs",
    
    -- Crystal Features
    ["选择水晶"] = "Select Crystal",
    ["购买水晶"] = "Buy Crystal",
    ["自动购买水晶"] = "Auto Buy Crystal",
    
    -- Pet Features
    ["选择宠物"] = "Select Pet",
    ["购买宠物"] = "Buy Pet",
    ["自动购买宠物"] = "Auto Buy Pet",
    
    -- Pet Evolution
    ["进化宠物"] = "Evolve Pet",
    ["自动进化宠物"] = "Auto Evolve Pet",
    
    -- Rebirth Settings
    ["设置重生目标"] = "Set Rebirth Goal",
    ["输入重生次数"] = "Enter Rebirth Goal",
    ["自动重生到目标"] = "Auto Rebirth to Goal",
    ["已自动重生到"] = "Auto rebirthed to ",
    ["，已自动为你踢出"] = ", auto kicked",
    
    -- Information
    ["步数: "] = "Steps: ",
    ["经验: "] = "EXP: ",
    ["等级: "] = "Level: ",
    ["比赛次数: "] = "Races: ",
    ["重生: "] = "Rebirths: ",
    ["环: "] = "Hoops: ",
    ["宝石: "] = "Gems: ",
    
    -- Language Settings
    ["当前语言"] = "Current Language",
    ["中文"] = "Chinese",
    ["英文"] = "English",
    ["应用语言"] = "Apply Language",
    ["语言更改"] = "Language Change",
    ["成功"] = "Success",
    ["语言"] = "Language",
    ["当前语言已经是"] = "Current language is already",
    ["请重启脚本以使更改生效"] = "Please restart the script for changes to take effect"
}

local currentLanguage = "Chinese"
local languageChanged = false

LanguageTab:Dropdown({
    Title = "当前语言",
    Values = {"中文", "English"},
    Value = "中文",
    Callback = function(option)
        if option == "English" then
            currentLanguage = "English"
        else
            currentLanguage = "Chinese"
        end
        languageChanged = true
    end
})

LanguageTab:Button({
    Title = "应用语言",
    Callback = function()
        if languageChanged then
            WindUI:Notify({
                Title = "语言更改",
                Content = "请重启脚本以使更改生效",
                Duration = 5,
                Icon = "info"
            })
            languageChanged = false
        else
            WindUI:Notify({
                Title = "语言",
                Content = "当前语言已经是 " .. currentLanguage,
                Duration = 3,
                Icon = "info"
            })
        end
    end
})

local function translateText(text)
    if not text or type(text) ~= "string" then return text end
    
    if currentLanguage == "English" then
        return Translations[text] or text
    else
        for cn, en in pairs(Translations) do
            if text == en then
                return cn
            end
        end
        return text
    end
end

local function translateGUI(gui)
    if (gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox")) then
        pcall(function()
            local text = gui.Text
            if text and text ~= "" then
                local translatedText = translateText(text)
                if translatedText ~= text then
                    gui.Text = translatedText
                end
            end
        end)
    end
end

local function scanAndTranslate()
    for _, gui in ipairs(game:GetService("CoreGui"):GetDescendants()) do
        translateGUI(gui)
    end
    local player = game:GetService("Players").LocalPlayer
    if player and player:FindFirstChild("PlayerGui") then
        for _, gui in ipairs(player.PlayerGui:GetDescendants()) do
            translateGUI(gui)
        end
    end
end

local function setupDescendantListener(parent)
    parent.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
            task.wait(0.1)
            translateGUI(descendant)
        end
    end)
end

local function setupTranslationEngine()
    pcall(setupDescendantListener, game:GetService("CoreGui"))
    local player = game:GetService("Players").LocalPlayer
    if player and player:FindFirstChild("PlayerGui") then
        pcall(setupDescendantListener, player.PlayerGui)
    end
    scanAndTranslate()
    while true do
        scanAndTranslate()
        task.wait(3)
    end
end

task.spawn(function()
    task.wait(2)
    setupTranslationEngine()
end)


local Interstellar = {
    getorb = false,
    area = "City",
    mainexe = false,
    hoop = false,
    opencrystal = false,
    petshop = false,
    evolvepet = false,
    birth = 9e9,
    autobirth = false,
}

local Main = Window:Tab({Title = "主要功能", Icon = "star"})

Main:Toggle({
    Title = "自动重生",
    Default = false,
    Callback = function(state)
        Interstellar.mainexe = state
        if Interstellar.mainexe then
            while Interstellar.mainexe do
                game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
                wait()
            end
        end
    end
})

Main:Button({
    Title = "获取所有宝箱",
    Callback = function()
        for _, v in pairs(game.ReplicatedStorage.chestRewards:GetChildren()) do
            game.ReplicatedStorage.rEvents.checkChestRemote:InvokeServer(v.Name)
        end
    end
})

Main:Button({
    Title = "获取所有通行证",
    Callback = function()
        for i, v in ipairs(game:GetService("ReplicatedStorage").gamepassIds:GetChildren()) do
            v.Parent = game.Players.LocalPlayer.ownedGamepasses
        end 
    end
})

local RaceTab = Window:Tab({Title = "比赛功能", Icon = "flag"})

local Maps = {}
for i, Map in pairs(game:GetService("Workspace").raceMaps:GetChildren()) do
    Maps[i] = Map.Name
end

local selectedMap = ""
RaceTab:Dropdown({
    Title = "选择比赛地图",
    Values = Maps,
    Callback = function(Value)
        selectedMap = Value
    end
})

RaceTab:Button({
    Title = "传送到终点",
    Callback = function()
        if selectedMap ~= "" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.raceMaps[selectedMap].finishPart.CFrame
        end
    end
})

RaceTab:Toggle({
    Title = "自动参加比赛",
    Default = false,
    Callback = function(state)
        Interstellar.mainexe = state
        if Interstellar.mainexe then
            if game.PlaceId == 3101667897 then
                while Interstellar.mainexe do
                    game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.raceMaps.Grassland.finishPart.CFrame
                    task.wait(0.1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.raceMaps.Magma.finishPart.CFrame
                    task.wait(0.1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.raceMaps.Desert.finishPart.CFrame
                    task.wait(0.3)
                end
            elseif game.PlaceId == 3276265788 then
                while Interstellar.mainexe do
                    game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.raceMaps.Speedway.finishPart.CFrame
                    task.wait(0.2)
                end
            elseif game.PlaceId == 3232996272 then
                while Interstellar.mainexe do
                    game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.raceMaps.Starway.finishPart.CFrame
                    task.wait(0.2)
                end
            end
        end
    end
})

RaceTab:Toggle({
    Title = "自动收集光环",
    Default = false,
    Callback = function(state)
        Interstellar.hoop = state
        if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
            while Interstellar.hoop do
                for i, hoops in ipairs(workspace.Hoops:GetChildren()) do
                    if hoops.Name == "Hoop" then
                        hoops.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        wait()
                    end
                end
            end
        end
    end
})

local EditTab = Window:Tab({Title = "数值修改-美化", Icon = "edit"})

EditTab:Input({
    Title = "修改经验值",
    Placeholder = "输入经验值",
    Callback = function(Value)
        game:GetService("Players").LocalPlayer.exp.Value = tonumber(Value) or 0
    end
})

EditTab:Input({
    Title = "修改等级",
    Placeholder = "输入等级",
    Callback = function(Value)
        game:GetService("Players").LocalPlayer.level.Value = tonumber(Value) or 1
    end
})

EditTab:Input({
    Title = "修改比赛数",
    Placeholder = "输入比赛次数",
    Callback = function(Value)
        game:GetService("Players").LocalPlayer.leaderstats.Races.Value = tonumber(Value) or 0
    end
})

EditTab:Input({
    Title = "修改圈数",
    Placeholder = "输入圈数",
    Callback = function(Value)
        game:GetService("Players").LocalPlayer.leaderstats.Hoops.Value = tonumber(Value) or 0
    end
})

EditTab:Input({
    Title = "修改重生次数",
    Placeholder = "输入重生次数",
    Callback = function(Value)
        game:GetService("Players").LocalPlayer.leaderstats.Rebirths.Value = tonumber(Value) or 0
    end
})

EditTab:Input({
    Title = "修改步数",
    Placeholder = "输入步数",
    Callback = function(Value)
        game:GetService("Players").LocalPlayer.leaderstats.Steps.Value = tonumber(Value) or 0
    end
})

EditTab:Input({
    Title = "修改宝石数量",
    Placeholder = "输入宝石数量",
    Callback = function(Value)
        game:GetService("Players").LocalPlayer.Gems.Value = tonumber(Value) or 0
    end
})

local OrbTab = Window:Tab({Title = "能量球收集", Icon = "globe"})

OrbTab:Dropdown({
    Title = "选择地区",
    Values = {"City","Snow City","Magma City","Desert","Space", "Legends Highway"},
    Callback = function(Value)
        Interstellar.area = Value
    end
})

OrbTab:Toggle({
    Title = "自动收集红球",
    Default = false,
    Callback = function(state)
        Interstellar.getorb = state
        spawn(function()
            while Interstellar.getorb do wait()
                pcall(function()
                    game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb", "Red Orb", Interstellar.area)
                end)
            end
        end)
    end
})

OrbTab:Toggle({
    Title = "自动收集蓝球",
    Default = false,
    Callback = function(state)
        Interstellar.getorb = state
        spawn(function()
            while Interstellar.getorb do wait()
                pcall(function()
                    game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb", "Blue Orb", Interstellar.area)
                end)
            end
        end)
    end
})

OrbTab:Toggle({
    Title = "自动收集宝石球",
    Default = false,
    Callback = function(state)
        Interstellar.getorb = state
        spawn(function()
            while Interstellar.getorb do
                pcall(function()
                    game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb", "Gem", Interstellar.area)
                end)
            end
        end)
    end
})

local CrystalTab = Window:Tab({Title = "水晶功能", Icon = "gem"})

local crystalshow = {}
for i, crystal in pairs(game:GetService("Workspace").mapCrystalsFolder:GetChildren()) do
    crystalshow[i] = crystal.Name
end

local OpenCrystal = ""
CrystalTab:Dropdown({
    Title = "选择水晶",
    Values = crystalshow,
    Callback = function(Value)
        OpenCrystal = Value
    end
})

CrystalTab:Button({
    Title = "购买水晶",
    Callback = function()
        game:GetService('ReplicatedStorage').rEvents.openCrystalRemote:InvokeServer("openCrystal", OpenCrystal)
    end
})

CrystalTab:Toggle({
    Title = "自动购买水晶",
    Default = false,
    Callback = function(state)
        Interstellar.opencrystal = state
        if Interstellar.opencrystal then
            while Interstellar.opencrystal do
                game:GetService('ReplicatedStorage').rEvents.openCrystalRemote:InvokeServer("openCrystal", OpenCrystal)
                wait()
            end
        end
    end
})

local PetTab = Window:Tab({Title = "宠物功能", Icon = "paw"})

local petshow = {}
for i, pet in pairs(game:GetService("ReplicatedStorage").cPetShopFolder:GetChildren()) do
    petshow[i] = pet.Name
end

local BuyPetShop = ""
PetTab:Dropdown({
    Title = "选择宠物",
    Values = petshow,
    Callback = function(Value)
        BuyPetShop = Value
    end
})

PetTab:Button({
    Title = "购买宠物",
    Callback = function()
        game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(game:GetService("ReplicatedStorage").cPetShopFolder:FindFirstChild(BuyPetShop))
    end
})

PetTab:Toggle({
    Title = "自动购买宠物",
    Default = false,
    Callback = function(state)
        Interstellar.petshop = state
        if Interstellar.petshop then
            while Interstellar.petshop do
                game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(game:GetService("ReplicatedStorage").cPetShopFolder:FindFirstChild(BuyPetShop))
                wait()
            end
        end
    end
})

local EvolveTab = Window:Tab({Title = "宠物进化", Icon = "shield"})

local EvolvePet = ""
EvolveTab:Dropdown({
    Title = "选择宠物",
    Values = petshow,
    Callback = function(Value)
        EvolvePet = Value
    end
})

EvolveTab:Button({
    Title = "进化宠物",
    Callback = function()
        game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer("evolvePet", EvolvePet)
    end
})

EvolveTab:Toggle({
    Title = "自动进化宠物",
    Default = false,
    Callback = function(state)
        Interstellar.evolvepet = state
        if Interstellar.evolvepet then
            while Interstellar.evolvepet do
                game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer("evolvePet", EvolvePet)
                wait()
            end
        end
    end
})

local BirthTab = Window:Tab({Title = "重生设置", Icon = "refresh-cw"})

BirthTab:Input({
    Title = "设置重生目标",
    Placeholder = "输入重生次数",
    Callback = function(Value)
        Interstellar.birth = tonumber(Value) or 99999999999999999999999999999
    end
})

BirthTab:Toggle({
    Title = "自动重生到目标",
    Default = false,
    Callback = function(state)
        if game:GetService("Players").LocalPlayer.leaderstats.Rebirths.Value >= Interstellar.birth then
            game.Players.LocalPlayer:Kick("已自动重生到"..Interstellar.birth.."，已自动为你踢出")
        else
            Interstellar.autobirth = state
            if Interstellar.autobirth then
                while Interstellar.autobirth do
                    game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
                    wait()
                end
            end
        end
    end
})

local Info = Window:Tab({Title = "信息", Icon = "settings"})

Info:Paragraph({
    Title = "步数: " .. game:GetService("Players").LocalPlayer.leaderstats.Steps.Value,
    Callback = function(Value)
        return "步数: " .. game:GetService("Players").LocalPlayer.leaderstats.Steps.Value
    end
})

Info:Paragraph({
    Title = "经验: " .. game:GetService("Players").LocalPlayer.exp.Value,
    Callback = function(Value)
        return "经验: " .. game:GetService("Players").LocalPlayer.exp.Value
    end
})

Info:Paragraph({
    Title = "等级: " .. game:GetService("Players").LocalPlayer.level.Value,
    Callback = function(Value)
        return "等级: " .. game:GetService("Players").LocalPlayer.level.Value
    end
})

Info:Paragraph({
    Title = "比赛次数: " .. game:GetService("Players").LocalPlayer.leaderstats.Races.Value,
    Callback = function(Value)
        return "比赛次数: " .. game:GetService("Players").LocalPlayer.leaderstats.Races.Value
    end
})

Info:Paragraph({
    Title = "重生: " .. game:GetService("Players").LocalPlayer.leaderstats.Rebirths.Value,
    Callback = function(Value)
        return "重生: " .. game:GetService("Players").LocalPlayer.leaderstats.Rebirths.Value
    end
})

Info:Paragraph({
    Title = "环: " .. game:GetService("Players").LocalPlayer.leaderstats.Hoops.Value,
    Callback = function(Value)
        return "环: " .. game:GetService("Players").LocalPlayer.leaderstats.Hoops.Value
    end
})

Info:Paragraph({
    Title = "宝石: " .. game:GetService("Players").LocalPlayer.Gems.Value,
    Callback = function(Value)
        return "宝石: " .. game:GetService("Players").LocalPlayer.Gems.Value
    end
})
end