-- 你说的对我的是唐逼刷包
-- 能刷之前怎么不叫呢😂😂
-- 我是半缝合+半自制怎么了
-- 你急眼了对吗😆😆
-- 可以缝合二改

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/refs/heads/main/dist/main.lua"))()
local Confirmed = false

local gradientColors = {
    "rgb(255, 230, 235)",
    "rgb(255, 210, 220)",
    "rgb(255, 190, 205)",
    "rgb(255, 170, 190)",
    "rgb(255, 150, 175)",
    "rgb(245, 140, 180)",
    "rgb(235, 130, 185)",
    "rgb(225, 120, 190)",
    "rgb(215, 110, 195)",
    "rgb(205, 100, 200)"
}

local username = game.Players.LocalPlayer.Name
local coloredUsername = ""
for i = 1, #username do
    local colorIndex = (i - 1) % #gradientColors + 1
    coloredUsername = coloredUsername .. '<font color="' .. gradientColors[colorIndex] .. '">' .. username:sub(i, i) .. '</font>'
end

local version = "v1.2.4"
local coloredVersion = ""
for i = 1, #version do
    local colorIndex = (i - 1) % #gradientColors + 1
    coloredVersion = coloredVersion .. '<font color="' .. gradientColors[colorIndex] .. '">' .. version:sub(i, i) .. '</font>'
end

WindUI:Popup({
    Title = '<font color="' .. gradientColors[1] .. '">永</font><font color="' .. gradientColors[5] .. '">爱</font>',
    IconThemed = true,
    Content = "尊敬的用户 " .. coloredUsername .. " \n您使用的 <font color='" .. gradientColors[1] .. "'>永</font><font color='" .. gradientColors[5] .. "'>爱</font> 当前版本型号是: " .. coloredVersion .. "\n现已支持4个服务器！",
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
        Title = '永爱',
        Icon = "heart",
        IconThemed = true,
        Author = "v1.2.4",
        Folder = "CloudHub",
        Size = UDim2.fromOffset(580, 440),
        Transparent = true,
        Theme = "Dark",
        HideSearchBar = false,
        ScrollBarEnabled = true,
        Resizable = true,
        Background = "https://raw.githubusercontent.com/XxwanhexxX/UN/main/preview_png.png",
        BackgroundImageTransparency = 0.5,
        User = {
            Enabled = true,
            Callback = function()
                WindUI:Notify({
                    Title = "点击了自己",
                    Content = "没什么", 
                    Duration = 1,
                    Icon = "4483362748"
                })
            end,
            Anonymous = false
        },
        SideBarWidth = 250,
        Search = {
            Enabled = true,
            Placeholder = "搜索...",
            Callback = function(searchText)
                print("搜索内容:", searchText)
            end
        },
        SidePanel = {
            Enabled = true,
            Content = {
                {
                    Type = "Button", 
                    Text = "永爱",
                    Style = "Subtle", 
                    Size = UDim2.new(1, -20, 0, 30),
                    Callback = function()
                    end
                }
            }
        }
    })

Window:EditOpenButton({
    Title = "永爱",
    Icon = "rbxassetid://105677776902677",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 4,
    Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
    Draggable = true,
})

Window:Tag({
        Title = "力量传奇",
        Color = Color3.fromHex("#00ffff") 
    })

Window:EditOpenButton({
    Title = "永爱",
    Icon = "heart",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 4,
    Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
    Draggable = true,
})

spawn(function()
    while true do
        for hue = 0, 1, 0.01 do  
            local color = Color3.fromHSV(hue, 0.8, 1)  
            Window:EditOpenButton({
                Color = ColorSequence.new(color)
            })
            wait(0.04)  
        end
    end
end)

local LockSection = Window:Section({
    Title = "公告",
    Opened = true,
})

local infoTab = Window:Tab({Title = "通知", Icon = "layout-grid", Locked = false})

local LockSection = Window:Section({
    Title = "主功能",
    Opened = true,
})

local function AddTab(section, title, icon)
    return section:Tab({Title = title, Icon = icon})
end

local A = AddTab(LockSection, "主要", "rbxassetid://7734068321")  
local B = AddTab(LockSection, "打石头", "rbxassetid://7734068321")  
local C = AddTab(LockSection, "刷业报", "rbxassetid://7734068321")  
local D = AddTab(LockSection, "其他器材", "rbxassetid://7734068321")  
local E = AddTab(LockSection, "重生", "rbxassetid://7734068321")  
local F = AddTab(LockSection, "修改", "rbxassetid://7734068321")  
local G = AddTab(LockSection, "传送", "rbxassetid://7734068321")  
local H = AddTab(LockSection, "收集", "rbxassetid://7734068321")  
local I = AddTab(LockSection, "宠物蛋", "rbxassetid://7734068321")  
local J = AddTab(LockSection, "画质+通用", "rbxassetid://7734068321")  
local K = AddTab(LockSection, "关于包类和训练", "rbxassetid://4483362458")

local infoSection = infoTab:Section({Title = "详情信息",Icon = "info", Opened = true})

infoSection:Divider()

infoSection:Paragraph({
    Title = "关于",
    Desc = "半成品\n国内免费最佳\n成品认准ato",
    ThumbnailSize = 190,
})

local infoSection = infoTab:Section({Title = "更新公告", Icon = "bell", Opened = true})

infoSection:Divider()

infoSection:Paragraph({
    Title = "12.6提示",
    Desc = "更新优化\n修复大部分功能 +刷包v3（这时候能刷）",
    ThumbnailSize = 190,
})

infoSection:Paragraph({
    Title = "11.25提示",
    Desc = "更新添加\n+自动吃物品 +自动宝箱 +刷包v2(这时候能刷)",
    ThumbnailSize = 190,
})

infoSection:Paragraph({
    Title = "11.8提示",
    Desc = "更新添加\n+刷业报 +宠物蛋 +刷包v1(这时候能刷)",
    ThumbnailSize = 190,
})

infoSection:Paragraph({
    Title = "10.15提示",
    Desc = "更新添加\n+自动锻炼 +器材锻炼 +跑步机 +打石头",
    ThumbnailSize = 190,
})

infoTab:Select()

local otherSection = A:Section({Title = "比赛类", Opened = true})

A:Toggle({
    Title = "自动比赛开关",
    Default = false,
    Callback = function(state)
        getgenv().AutoBrawl = state
        while getgenv().AutoBrawl do
            wait(2)
            game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
            wait()
        end
    end
})

local otherSection = A:Section({Title = "防打自动训练", Opened = true})

A:Paragraph({
    Title = "关于防打自动锻炼",
    Desc = "死亡后不会继续\n因为继续会失去道具\n所以我就没弄\n我建议的是不防打和安全点循环传送即可",
    ThumbnailSize = 190,
})

A:Toggle({
    Title = "自动锻炼全部",
    Default = false,
    Callback = function(state)
        getgenv().AutoTrainTriple = state
        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        while getgenv().AutoTrainTriple do
            wait()
            local char = game.Players.LocalPlayer.Character
            if not char then wait(1) continue end
            char.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.ClassName == "Tool" and (v.Name == "Handstands" or v.Name == "Situps" or v.Name == "Pushups" or v.Name == "Weight") then
                    if v:FindFirstChildOfClass("NumberValue") then
                        v:FindFirstChildOfClass("NumberValue").Value = 0
                    end
                    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                    char:WaitForChild("Humanoid"):EquipTool(v)
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                end
            end
        end
        part:Destroy()
        local char = game.Players.LocalPlayer.Character
        if char then
            char.HumanoidRootPart.CFrame = oldPos
            char:WaitForChild("Humanoid"):UnequipTools()
        end
    end
})

A:Toggle({
    Title = "自动举哑铃",
    Default = false,
    Callback = function(state)
        getgenv().AutoWeight = state
        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        while getgenv().AutoWeight do
            wait()
            local char = game.Players.LocalPlayer.Character
            if not char then wait(1) continue end
            char.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.ClassName == "Tool" and v.Name == "Weight" then
                    v.Parent = char
                end
            end
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
        end
        part:Destroy()
        local char = game.Players.LocalPlayer.Character
        if char then
            char.HumanoidRootPart.CFrame = oldPos
            char:WaitForChild("Humanoid"):UnequipTools()
        end
    end
})

A:Toggle({
    Title = "自动俯卧撑",
    Default = false,
    Callback = function(state)
        getgenv().AutoPushup = state
        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        while getgenv().AutoPushup do
            wait()
            local char = game.Players.LocalPlayer.Character
            if not char then wait(1) continue end
            char.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.ClassName == "Tool" and v.Name == "Pushups" then
                    v.Parent = char
                end
            end
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
        end
        part:Destroy()
        local char = game.Players.LocalPlayer.Character
        if char then
            char.HumanoidRootPart.CFrame = oldPos
            char:WaitForChild("Humanoid"):UnequipTools()
        end
    end
})

A:Toggle({
    Title = "自动仰卧起坐",
    Default = false,
    Callback = function(state)
        getgenv().AutoSitup = state
        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        while getgenv().AutoSitup do
            wait()
            local char = game.Players.LocalPlayer.Character
            if not char then wait(1) continue end
            char.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.ClassName == "Tool" and v.Name == "Situps" then
                    v.Parent = char
                end
            end
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
        end
        part:Destroy()
        local char = game.Players.LocalPlayer.Character
        if char then
            char.HumanoidRootPart.CFrame = oldPos
            char:WaitForChild("Humanoid"):UnequipTools()
        end
    end
})

A:Toggle({
    Title = "自动倒立",
    Default = false,
    Callback = function(state)
        getgenv().AutoHandstand = state
        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local part = Instance.new('Part', workspace)
        part.Size = Vector3.new(500, 20, 530.1)
        part.Position = Vector3.new(0, 100000, 133.15)
        part.CanCollide = true
        part.Anchored = true
        while getgenv().AutoHandstand do
            wait()
            local char = game.Players.LocalPlayer.Character
            if not char then wait(1) continue end
            char.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.ClassName == "Tool" and v.Name == "Handstands" then
                    v.Parent = char
                end
            end
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
        end
        part:Destroy()
        local char = game.Players.LocalPlayer.Character
        if char then
            char.HumanoidRootPart.CFrame = oldPos
            char:WaitForChild("Humanoid"):UnequipTools()
        end
    end
})

local otherSection2 = A:Section({Title = "不防打可移动自动训练", Opened = true})

A:Toggle({
    Title = "自动举哑铃",
    Default = false,
    Callback = function(state)
        getgenv().AutoWeight=state
        spawn(function()
            while getgenv().AutoWeight do
                pcall(function()
                    local char=game.Players.LocalPlayer.Character
                    if not char then wait(2)
                    else
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v.ClassName=="Tool" and v.Name=="Weight" then
                                v.Parent=char
                                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                                wait(0.03)
                                v.Parent=game.Players.LocalPlayer.Backpack
                                wait(0.2)
                            end
                        end
                    end
                end)
                wait()
            end
            if not getgenv().AutoWeight then
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Tool") and v.Name=="Weight" then
                        v.Parent=game.Players.LocalPlayer.Backpack
                    end
                end
            end
        end)
    end
})

A:Toggle({
    Title = "自动俯卧撑",
    Default = false,
    Callback = function(state)
        getgenv().AutoPushups=state
        spawn(function()
            while getgenv().AutoPushups do
                pcall(function()
                    local char=game.Players.LocalPlayer.Character
                    if not char then wait(2)
                    else
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v.ClassName=="Tool" and v.Name=="Pushups" then
                                v.Parent=char
                                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                                wait(0.03)
                                v.Parent=game.Players.LocalPlayer.Backpack
                                wait(0.2)
                            end
                        end
                    end
                end)
                wait()
            end
            if not getgenv().AutoPushups then
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Tool") and v.Name=="Pushups" then
                        v.Parent=game.Players.LocalPlayer.Backpack
                    end
                end
            end
        end)
    end
})

A:Toggle({
    Title = "自动仰卧起坐",
    Default = false,
    Callback = function(state)
        getgenv().AutoSitups=state
        spawn(function()
            while getgenv().AutoSitups do
                pcall(function()
                    local char=game.Players.LocalPlayer.Character
                    if not char then wait(2)
                    else
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v.ClassName=="Tool" and v.Name=="Situps" then
                                v.Parent=char
                                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                                wait(0.03)
                                v.Parent=game.Players.LocalPlayer.Backpack
                                wait(0.2)
                            end
                        end
                    end
                end)
                wait()
            end
            if not getgenv().AutoSitups then
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Tool") and v.Name=="Situps" then
                        v.Parent=game.Players.LocalPlayer.Backpack
                    end
                end
            end
        end)
    end
})

A:Toggle({
    Title = "自动倒立",
    Default = false,
    Callback = function(state)
        getgenv().AutoHandstands=state
        spawn(function()
            while getgenv().AutoHandstands do
                pcall(function()
                    local char=game.Players.LocalPlayer.Character
                    if not char then wait(2)
                    else
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v.ClassName=="Tool" and v.Name=="Handstands" then
                                v.Parent=char
                                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                                wait(0.03)
                                v.Parent=game.Players.LocalPlayer.Backpack
                                wait(0.2)
                            end
                        end
                    end
                end)
                wait()
            end
            if not getgenv().AutoHandstands then
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Tool") and v.Name=="Handstands" then
                        v.Parent=game.Players.LocalPlayer.Backpack
                    end
                end
            end
        end)
    end
})

A:Toggle({
    Title = "自全锻炼全部",
    Default = false,
    Callback = function(state)
        getgenv().AutoAllTrain=state
        spawn(function()
            while getgenv().AutoAllTrain do
                pcall(function()
                    local char=game.Players.LocalPlayer.Character
                    if not char then wait(2)
                    else
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v.ClassName=="Tool" and (v.Name=="Weight" or v.Name=="Handstands" or v.Name=="Pushups" or v.Name=="Situps") then
                                v.Parent=char
                                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                                wait(0.02)
                                v.Parent=game.Players.LocalPlayer.Backpack
                                wait(0.2)
                            end
                        end
                    end
                end)
                wait()
            end
            if not getgenv().AutoAllTrain then
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Tool") and (v.Name=="Weight" or v.Name=="Handstands" or v.Name=="Pushups" or v.Name=="Situps") then
                        v.Parent=game.Players.LocalPlayer.Backpack
                    end
                end
            end
        end)
    end
})

local rockSection = B:Section({Title = "石头对照表", Opened = true})

B:Paragraph({
    Title = "因为列表汉化有问题",
    Desc = "Tiny Rock = 10耐力\nInferno Rock = 100耐力\nPunching Rock = 5000耐力\nRock Of Legends = 150000耐力\nMuscle King Mountain = 400000耐力\nAncient Jungle Rock = 750000耐力\nMuscle King Mountain = 100万耐力\nAncient Jungle Rock = 500万耐力\nAncient Jungle Rock = 1000万耐力",
    ThumbnailSize = 200,
})

local rockSection = B:Section({Title = "远程打石头v1", Opened = true})

local rockshow1 = {"Tiny Rock", "Inferno Rock", "Punching Rock", "Rock Of Legends", "Muscle King Mountain", "Ancient Jungle Rock"}
local rockNames = {
    ["Tiny Rock"] = "小石头",
    ["Inferno Rock"] = "地狱石头", 
    ["Punching Rock"] = "拳击石头",
    ["Rock Of Legends"] = "传奇石头",
    ["Muscle King Mountain"] = "肌肉王石头",
    ["Ancient Jungle Rock"] = "丛林石头"
}

local AutoStates = {
    rock = false,
    rocks = false,
    RK0 = false,
    RK10 = false,
    RK100 = false,
    RK5000 = false,
    RK150000 = false,
    RK400000 = false,
    RK750000 = false,
    RK1M = false,
    RK5M = false,
    JungleRock10M = false
}

B:Dropdown({
    Title = "选择石头", 
    Values = rockshow1, 
    Value = "空", 
    Callback = function(Value) 
        Interstellar.Rocks = Value
    end
})

B:Toggle({
    Title = "自动打石头",
    Description = "把石头传送过来打",
    Default = false,
    Callback = function(state)
        AutoStates.rock = state
        spawn(function()
            local OldPOS = game:GetService("Workspace").machinesFolder[Interstellar.Rocks].Rock.CFrame
            while AutoStates.rock do
                wait()
                pcall(function()
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name == "Punch" then
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                        end
                    end
                    for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if h:IsA("Tool") and h.Name == "Punch" then
                            h:Activate()
                        end
                    end
                    game:GetService("Workspace").machinesFolder[Interstellar.Rocks].Rock.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
                    game:GetService("Workspace").machinesFolder[Interstellar.Rocks].Rock.CanCollide = false
                    game:GetService("Workspace").machinesFolder[Interstellar.Rocks].Rock.Transparency = 100
                    game:GetService("Workspace").machinesFolder[Interstellar.Rocks].Rock.rockGui.rockName.Visible = false
                    game:GetService("Workspace").machinesFolder[Interstellar.Rocks].Rock.rockGui.statLabel.Visible = false
                end)
            end
            if not AutoStates.rock then
                pcall(function()
                    game:GetService("Workspace").machinesFolder[Interstellar.Rocks].Rock.CFrame = CFrame.new(OldPOS)
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                    game:GetService("Workspace").machinesFolder[Interstellar.Rocks].Rock.CanCollide = true
                    game:GetService("Workspace").machinesFolder[Interstellar.Rocks].Rock.Transparency = 0
                    game:GetService("Workspace").machinesFolder[Interstellar.Rocks].Rock.rockGui.rockName.Visible = true
                    game:GetService("Workspace").machinesFolder[Interstellar.Rocks].Rock.rockGui.statLabel.Visible = true
                end)
            end
        end)
    end
})

local rockSection2 = B:Section({Title = "远程打石头v2", Opened = true})

local rockshow2 = {"Tiny Rock", "Inferno Rock", "Punching Rock", "Rock Of Legends", "Muscle King Mountain", "Ancient Jungle Rock"}
local rockNames2 = {
    ["Tiny Rock"] = "小石头",
    ["Inferno Rock"] = "地狱石头", 
    ["Punching Rock"] = "拳击石头",
    ["Rock Of Legends"] = "传奇石头",
    ["Muscle King Mountain"] = "肌肉王石头",
    ["Ancient Jungle Rock"] = "丛林石头"
}

B:Dropdown({
    Title = "选择石头", 
    Values = rockshow2, 
    Value = "空", 
    Callback = function(Value) 
        Interstellar.Rock = Value
    end
})

B:Toggle({
    Title = "自动打石头",
    Description = "远程隔空",
    Default = false,
    Callback = function(state)
        AutoStates.rocks = state
        spawn(function()
            while AutoStates.rocks do
                wait()
                pcall(function()
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name == "Punch" then
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                        end
                    end
                    for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if h:IsA("Tool") and h.Name == "Punch" then
                            h:Activate()
                        end
                    end
                    firetouchinterest(game.workspace.machinesFolder[Interstellar.Rock].Rock, game.Players.LocalPlayer.Character.LeftHand, 0)
                    firetouchinterest(game.workspace.machinesFolder[Interstellar.Rock].Rock, game.Players.LocalPlayer.Character.LeftHand, 1)
                end)
            end
            if not AutoStates.rocks then
                pcall(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                end)
            end
        end)
    end
})

local rockSection3 = B:Section({Title = "打石头(传送过去)", Opened = true})

B:Toggle({
    Title = "石头0",
    Default = false,
    Callback = function(state)
        getgenv().RK0 = state
        spawn(function()
            while getgenv().RK0 do
                wait()
                pcall(function()
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name == "Punch" then
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                        end
                    end
                    for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if h:IsA("Tool") and h.Name == "Punch" then
                            h:Activate()
                        end
                    end
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(7.60643005, 4.02632904, 2104.54004, -0.23040159, -8.53662385e-08, -0.973095655, -4.68743764e-08, 1, -7.66279342e-08, 0.973095655, 2.79580536e-08, -0.23040159)
                end)
            end
            if not getgenv().RK0 then
                pcall(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                end)
            end
        end)
    end
})

B:Toggle({
    Title = "石头10",
    Default = false,
    Callback = function(state)
        getgenv().RK10 = state
        spawn(function()
            if game.Players.LocalPlayer.Durability.Value >= 10 then
                while getgenv().RK10 do
                    wait()
                    pcall(function()
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") and v.Name == "Punch" then
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                            end
                        end
                        for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if h:IsA("Tool") and h.Name == "Punch" then
                                h:Activate()
                            end
                        end
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-157.680908, 3.72453046, 434.871185, 0.923298299, -1.81774684e-09, -0.384083599, 3.45247031e-09, 1, 3.56670582e-09, 0.384083599, -4.61917082e-09, 0.923298299)
                    end)
                end
            end
            if not getgenv().RK10 then
                pcall(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                end)
            end
        end)
    end
})

B:Toggle({
    Title = "石头100",
    Default = false,
    Callback = function(state)
        getgenv().RK100 = state
        spawn(function()
            if game.Players.LocalPlayer.Durability.Value >= 100 then
                while getgenv().RK100 do
                    wait()
                    pcall(function()
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") and v.Name == "Punch" then
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                            end
                        end
                        for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if h:IsA("Tool") and h.Name == "Punch" then
                                h:Activate()
                            end
                        end
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(162.233673, 3.66615629, -164.686783, -0.921312928, -1.80826774e-07, -0.38882193, -9.13036544e-08, 1, -2.48719346e-07, 0.38882193, -1.93647494e-07, -0.921312928)
                    end)
                end
            end
            if not getgenv().RK100 then
                pcall(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                end)
            end
        end)
    end
})

B:Toggle({
    Title = "石头5000",
    Default = false,
    Callback = function(state)
        getgenv().RK5000 = state
        spawn(function()
            if game.Players.LocalPlayer.Durability.Value >= 5000 then
                while getgenv().RK5000 do
                    wait()
                    pcall(function()
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") and v.Name == "Punch" then
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                            end
                        end
                        for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if h:IsA("Tool") and h.Name == "Punch" then
                                h:Activate()
                            end
                        end
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(329.831482, 3.66450214, -618.48407, -0.806075394, -8.67358096e-08, 0.591812849, -1.05715522e-07, 1, 2.57029176e-09, -0.591812849, -6.04919563e-08, -0.806075394)
                    end)
                end
            end
            if not getgenv().RK5000 then
                pcall(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                end)
            end
        end)
    end
})

B:Toggle({
    Title = "石头150000",
    Default = false,
    Callback = function(state)
        getgenv().RK150000 = state
        spawn(function()
            if game.Players.LocalPlayer.Durability.Value >= 150000 then
                while getgenv().RK150000 do
                    wait()
                    pcall(function()
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") and v.Name == "Punch" then
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                            end
                        end
                        for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if h:IsA("Tool") and h.Name == "Punch" then
                                h:Activate()
                            end
                        end
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2566.78076, 3.97019577, -277.503235, -0.923934579, -4.11600105e-08, -0.382550538, -3.38838042e-08, 1, -2.57576183e-08, 0.382550538, -1.08360858e-08, -0.923934579)
                    end)
                end
            end
            if not getgenv().RK150000 then
                pcall(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                end)
            end
        end)
    end
})

B:Toggle({
    Title = "石头400000",
    Default = false,
    Callback = function(state)
        getgenv().RK400000 = state
        spawn(function()
            if game.Players.LocalPlayer.Durability.Value >= 400000 then
                while getgenv().RK400000 do
                    wait()
                    pcall(function()
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") and v.Name == "Punch" then
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                            end
                        end
                        for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if h:IsA("Tool") and h.Name == "Punch" then
                                h:Activate()
                            end
                        end
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2155.61743, 3.79830337, 1227.06482, -0.551303148, -9.16796949e-09, -0.834304988, -5.61318245e-08, 1, 2.61027839e-08, 0.834304988, 6.12216127e-08, -0.551303148)
                    end)
                end
            end
            if not getgenv().RK400000 then
                pcall(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                end)
            end
        end)
    end
})

B:Toggle({
    Title = "石头750000",
    Default = false,
    Callback = function(state)
        getgenv().RK750000 = state
        spawn(function()
            if game.Players.LocalPlayer.Durability.Value >= 750000 then
                while getgenv().RK750000 do
                    wait()
                    pcall(function()
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") and v.Name == "Punch" then
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                            end
                        end
                        for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if h:IsA("Tool") and h.Name == "Punch" then
                                h:Activate()
                            end
                        end
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-7285.6499, 3.66624784, -1228.27417, 0.857643783, -1.58175091e-08, -0.514244199, -1.22581563e-08, 1, -5.12025977e-08, 0.514244199, 5.02172774e-08, 0.857643783)
                    end)
                end
            end
            if not getgenv().RK750000 then
                pcall(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                end)
            end
        end)
    end
})

B:Toggle({
    Title = "石头100万",
    Default = false,
    Callback = function(state)
        getgenv().RK1M = state
        spawn(function()
            if game.Players.LocalPlayer.Durability.Value >= 1000000 then
                while getgenv().RK1M do
                    wait()
                    pcall(function()
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") and v.Name == "Punch" then
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                            end
                        end
                        for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if h:IsA("Tool") and h.Name == "Punch" then
                                h:Activate()
                            end
                        end
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4160.87109, 987.829102, -4136.64502, -0.893115997, 1.25481356e-05, 0.44982639, 5.02490684e-06, 1, -1.79187136e-05, -0.44982639, -1.37431543e-05, -0.893115997)
                    end)
                end
            end
            if not getgenv().RK1M then
                pcall(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                end)
            end
        end)
    end
})

B:Toggle({
    Title = "石头500万",
    Default = false,
    Callback = function(state)
        getgenv().RK5M = state
        spawn(function()
            if game.Players.LocalPlayer.Durability.Value >= 5000000 then
                while getgenv().RK5M do
                    wait()
                    pcall(function()
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") and v.Name == "Punch" then
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                            end
                        end
                        for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if h:IsA("Tool") and h.Name == "Punch" then
                                h:Activate()
                            end
                        end
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8957.54395, 5.53625107, -6126.90186, -0.803919137, 6.6065212e-08, 0.594738603, -8.93136143e-09, 1, -1.23155459e-07, -0.594738603, -1.04318865e-07, -0.803919137)
                    end)
                end
            end
            if not getgenv().RK5M then
                pcall(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                end)
            end
        end)
    end
})

B:Toggle({
    Title = "石头1000万",
    Default = false,
    Callback = function(state)
        getgenv().JungleRock10M = state
        spawn(function()
            if game.Players.LocalPlayer.Durability.Value >= 10000000 then
                while getgenv().JungleRock10M do
                    wait()
                    pcall(function()
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") and v.Name == "Punch" then
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
                            end
                        end
                        for i,h in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if h:IsA("Tool") and h.Name == "Punch" then
                                h:Activate()
                            end
                        end
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-7552.9, 3.4, 2847.7, -0.803919137, 6.6065212e-08, 0.594738603, -8.93136143e-09, 1, -1.23155459e-07, -0.594738603, -1.04318865e-07, -0.803919137)
                    end)
                end
            end
            if not getgenv().JungleRock10M then
                pcall(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
                end)
            end
        end)
    end
})

local karmaSection = C:Section({Title = "自动刷业报", Opened = true})
if not _G.WindUI_AutoStates then
    _G.WindUI_AutoStates = {
        AutoKillReport = false,
        AutoKillReport2 = false,
        AutoKillReport3 = false,
        AutoKillReport4 = false,
        AutoKill = false,
        killall = false
    }
end

local AutoStates = _G.WindUI_AutoStates

C:Toggle({
    Title = "自动刷业报v1",
    Default = AutoStates.AutoKillReport,
    Callback = function(state)
        AutoStates.AutoKillReport = state
        if AutoStates.AutoKillReportLoops then 
            for _,c in pairs(AutoStates.AutoKillReportLoops) do 
                c:Disconnect()
            end 
        end 
        AutoStates.AutoKillReportLoops = {}
        if not state then 
            if game.Players.LocalPlayer.Character then 
                local h = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                if h then 
                    h:UnequipTools()
                end 
            end 
            return 
        end 
        
        local pL = game:GetService("RunService").Heartbeat:Connect(function()
            if not AutoStates.AutoKillReport then 
                pL:Disconnect()
                return 
            end 
            local c = game.Players.LocalPlayer.Character 
            if c and c:FindFirstChild("Humanoid") and c.Humanoid.Health > 0 then 
                local p = c:FindFirstChild("Punch") or game.Players.LocalPlayer.Backpack:FindFirstChild("Punch")
                if p then 
                    p.Parent = c 
                    p:Activate()
                end 
            end 
        end)
        table.insert(AutoStates.AutoKillReportLoops, pL)
        
        local tL = game:GetService("RunService").Heartbeat:Connect(function()
            if not AutoStates.AutoKillReport then 
                tL:Disconnect()
                return 
            end 
            local c = game.Players.LocalPlayer.Character 
            if c and c:FindFirstChild("Humanoid") and c.Humanoid.Health > 0 then 
                local p = {}
                for _,pl in ipairs(game.Players:GetPlayers()) do 
                    if pl ~= game.Players.LocalPlayer and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") and pl.Character.Humanoid.Health > 0 then 
                        table.insert(p, pl)
                    end 
                end 
                if #p > 0 then 
                    local t = p[math.random(#p)]
                    local r = c:WaitForChild("HumanoidRootPart")
                    r.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
                end 
            end 
        end)
        table.insert(AutoStates.AutoKillReportLoops, tL)
    end
})

C:Toggle({
    Title = "自动刷业报v2",
    Default = AutoStates.AutoKillReport2,
    Callback = function(state)
        AutoStates.AutoKillReport2 = state
        if AutoStates.AutoKillReportLoops2 then 
            for _,c in pairs(AutoStates.AutoKillReportLoops2) do 
                c:Disconnect()
            end 
        end 
        AutoStates.AutoKillReportLoops2 = {}
        if not state then 
            if game.Players.LocalPlayer.Character then 
                local h = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                if h then 
                    h:UnequipTools()
                end 
            end 
            return 
        end 
        
        local sP = CFrame.new(-8751.0,120.4,-5863.1,0.59992,-2.24e-09,0.80006,4.46e-09,1,-5.44e-10,-0.80006,3.90e-09,0.59992)
        local function tS()
            local c = game.Players.LocalPlayer.Character 
            if c and c:FindFirstChild("HumanoidRootPart") then 
                c.HumanoidRootPart.CFrame = sP 
            end 
        end 
        
        local lKT = 0 
        local kC = 0.15 
        
        local pL = game:GetService("RunService").Heartbeat:Connect(function()
            if not AutoStates.AutoKillReport2 then 
                pL:Disconnect()
                return 
            end 
            local c = game.Players.LocalPlayer.Character 
            if c and c:FindFirstChild("Humanoid") and c.Humanoid.Health > 0 then 
                local p = c:FindFirstChild("Punch") or game.Players.LocalPlayer.Backpack:FindFirstChild("Punch")
                if p then 
                    p.Parent = c 
                    p:Activate()
                end 
            end 
        end)
        table.insert(AutoStates.AutoKillReportLoops2, pL)
        
        local tL = game:GetService("RunService").Heartbeat:Connect(function()
            if not AutoStates.AutoKillReport2 then 
                tL:Disconnect()
                return 
            end 
            local c = game.Players.LocalPlayer.Character 
            if c and c:FindFirstChild("Humanoid") and c.Humanoid.Health > 0 then 
                local p = {}
                for _,pl in ipairs(game.Players:GetPlayers()) do 
                    if pl ~= game.Players.LocalPlayer and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") and pl.Character.Humanoid.Health > 0 then 
                        table.insert(p, pl)
                    end 
                end 
                if #p > 0 then 
                    local cT = tick()
                    if cT - lKT >= kC then 
                        local t = p[math.random(#p)]
                        local r = c:WaitForChild("HumanoidRootPart")
                        r.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
                        lKT = cT 
                    else 
                        tS()
                    end 
                else 
                    tS()
                end 
            end 
        end)
        table.insert(AutoStates.AutoKillReportLoops2, tL)
        
        local dC = game.Players.LocalPlayer.CharacterAdded:Connect(function(c)
            if AutoStates.AutoKillReport2 then 
                wait(1)
                tS()
            end 
        end)
        table.insert(AutoStates.AutoKillReportLoops2, dC)
    end
})

C:Toggle({
    Title = "自动刷业报v3",
    Default = false,
    Callback = function(state)
        getgenv().AutoKarmaV3 = state
        
        if not state then
            if autoPunchLoop then
                autoPunchLoop:Disconnect()
                autoPunchLoop = nil
            end
            if attractLoop then
                attractLoop:Disconnect()
                attractLoop = nil
            end
            if game.Players.LocalPlayer.Character then 
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then 
                    humanoid:UnequipTools()
                end 
            end 
            if platform then
                platform:Destroy()
                platform = nil
            end
            return
        end
        
        platform = Instance.new('Part', workspace)
        platform.Size = Vector3.new(50, 30, 50)
        platform.Position = Vector3.new(0, 3000000, 0)
        platform.CanCollide = true
        platform.Anchored = true
        platform.Name = "AutoKarmaPlatform"
        
        local function teleportToPlatform()
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = platform.CFrame + Vector3.new(0, 25, 0)
            end
        end
        
        teleportToPlatform()
        
        game.Players.LocalPlayer.CharacterAdded:Connect(function(newChar)
            if getgenv().AutoKarmaV3 then
                newChar:WaitForChild("HumanoidRootPart")
                teleportToPlatform()
            end
        end)
        
        autoPunchLoop = game:GetService("RunService").Heartbeat:Connect(function()
            if not getgenv().AutoKarmaV3 then 
                return 
            end 
            local character = game.Players.LocalPlayer.Character 
            if character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then 
                local punch = character:FindFirstChild("Punch") or game.Players.LocalPlayer.Backpack:FindFirstChild("Punch")
                if punch then 
                    punch.Parent = character 
                    punch:Activate()
                end 
            end 
        end)
        
        attractLoop = game:GetService("RunService").Heartbeat:Connect(function()
            if not getgenv().AutoKarmaV3 then 
                return 
            end 
            local character = game.Players.LocalPlayer.Character 
            if character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then 
                teleportToPlatform() 
                for _, player in ipairs(game.Players:GetPlayers()) do 
                    if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.Humanoid.Health > 0 then 
                        local targetHRP = player.Character.HumanoidRootPart
                        local myHRP = character.HumanoidRootPart
                        targetHRP.CFrame = myHRP.CFrame * CFrame.new(0, 0, -2)
                    end 
                end 
            end 
        end)
    end
})

C:Toggle({
    Title = "自动刷业报v4",
    Default = AutoStates.AutoKillReport3,
    Callback = function(state)
        AutoStates.AutoKillReport3 = state
        if AutoStates.AutoKillReportLoops3 then 
            for _,c in pairs(AutoStates.AutoKillReportLoops3) do 
                c:Disconnect()
            end 
        end 
        AutoStates.AutoKillReportLoops3 = {}
        if not state then 
            if game.Players.LocalPlayer.Character then 
                local h = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                if h then 
                    h:UnequipTools()
                end 
            end 
            return 
        end 
        
        local pL = game:GetService("RunService").Heartbeat:Connect(function()
            if not AutoStates.AutoKillReport3 then 
                pL:Disconnect()
                return 
            end 
            for _,target in pairs(game.Players:GetPlayers()) do 
                if target ~= game.Players.LocalPlayer and target.Character and target.Character:FindFirstChild("Humanoid") and target.Character.Humanoid.Health > 0 then 
                    pcall(function()
                        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                            if v:IsA("Tool") and v.Name == "Punch" then 
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                            end 
                        end 
                        local p = game.Players.LocalPlayer.Character:FindFirstChild("Punch") or game.Players.LocalPlayer.Backpack:FindFirstChild("Punch")
                        if p then 
                            p.Parent = game.Players.LocalPlayer.Character
                            p:Activate()
                        end
                        local head = target.Character:FindFirstChild("Head")
                        local lchar = game.Players.LocalPlayer.Character 
                        local hand = lchar and lchar:FindFirstChild("LeftHand")
                        if head and hand then 
                            firetouchinterest(head, hand, 0)
                            wait(0.01)
                            firetouchinterest(head, hand, 1)
                        end 
                    end)
                end 
            end 
            wait(0.1)
        end)
        table.insert(AutoStates.AutoKillReportLoops3, pL)
    end
})

local karmaSection2 = C:Section({Title = "自定义", Opened = true})

Interstellar = Interstellar or {}
Interstellar.killplayers = {}

local Plr = game:GetService("Players")
local LP = Plr.LocalPlayer
local PlayerList = {}

local function initializePlayerList()
    PlayerList = {}
    for _, player in ipairs(Plr:GetPlayers()) do
        if player ~= LP then
            table.insert(PlayerList, player.Name)
        end
    end
end

local function refreshPlayerList()
    initializePlayerList()
    if killplayerDropdown then
        killplayerDropdown:Refresh(PlayerList)
        WindUI:Notify({
            Title = "玩家列表",
            Content = "玩家列表已刷新 (" .. #PlayerList .. " 个玩家)",
            Duration = 3,
        })
    end
end

Plr.PlayerAdded:Connect(function(player)
    if player ~= LP then
        table.insert(PlayerList, player.Name)
        if killplayerDropdown then
            killplayerDropdown:Refresh(PlayerList)
        end
    end
end)

Plr.PlayerRemoving:Connect(function(player)
    local index = table.find(PlayerList, player.Name)
    if index then
        table.remove(PlayerList, index)
        local killIndex = table.find(Interstellar.killplayers, player.Name)
        if killIndex then
            table.remove(Interstellar.killplayers, killIndex)
        end
        if killplayerDropdown then
            killplayerDropdown:Refresh(PlayerList)
        end
    end
end)

initializePlayerList()

local killplayerDropdown = C:Dropdown({
    Title = "要远程的玩家",
    Values = PlayerList,
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(values)
        Interstellar.killplayers = values or {}
        WindUI:Notify({
            Title = "远程",
            Content = "已设置 " .. #Interstellar.killplayers .. " 个玩家为远程目标",
            Duration = 3,
        })
    end
})

C:Toggle({
    Title = "选中名单远程击杀(不选列表默认全部)",
    Default = false,
    Callback = function(state)
        AutoStates = AutoStates or {}
        AutoStates.AutoKill = state
        
        if state then
            spawn(function()
                while AutoStates.AutoKill do 
                    pcall(function()
                        local targets = {}
                        if #Interstellar.killplayers > 0 then
                            targets = Interstellar.killplayers
                        else
                            targets = PlayerList
                        end
                        
                        for _, playerName in pairs(targets) do
                            local target = Plr:FindFirstChild(playerName)
                            if target and target.Character and target.Character:FindFirstChild("Humanoid") and target.Character.Humanoid.Health > 0 then 
                                for i,v in pairs(LP.Backpack:GetChildren()) do 
                                    if v:IsA("Tool") and v.Name == "Punch" then 
                                        LP.Character.Humanoid:EquipTool(v)
                                    end 
                                end 
                                
                                local p = LP.Character:FindFirstChild("Punch") or LP.Backpack:FindFirstChild("Punch")
                                if p then 
                                    p.Parent = LP.Character
                                    p:Activate()
                                end
                                
                                local head = target.Character:FindFirstChild("Head")
                                local lchar = LP.Character 
                                local hand = lchar and lchar:FindFirstChild("LeftHand")
                                if head and hand then 
                                    firetouchinterest(head, hand, 0)
                                    wait(0.01)
                                    firetouchinterest(head, hand, 1)
                                end 
                            end 
                        end
                    end)
                    wait(0.1)
                end 
            end)
        end
    end
})

C:Button({
    Title = "查看选定远程名单",
    Callback = function()
        local targets = {}
        if #Interstellar.killplayers > 0 then
            targets = Interstellar.killplayers
        else
            targets = PlayerList
        end
        
        WindUI:Notify({
            Title = "远程目标 (" .. #targets .. " 个玩家)",
            Content = table.concat(targets, ", "),
            Duration = 5,
        })
    end
})

C:Button({
    Title = "刷新玩家列表",
    Callback = function()
        refreshPlayerList()
        WindUI:Notify({
            Title = "玩家列表",
            Content = "刷新玩家列表成功",
            Duration = 3,
        })
    end
})

local equipmentSection = D:Section({Title = "跑步机", Opened = true})

D:Toggle({
    Title = "沙滩跑步机10",
    Default = false,
    Callback = function(state)
        getgenv().PPJ10 = state
        while getgenv().PPJ10 do
            wait()
            local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
            local rootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
            humanoid.WalkSpeed = 10
            rootPart.CFrame = CFrame.new(238.671112, 5.40315914, 387.713165, -0.0160072874, -2.90710176e-08, -0.99987185, -3.3434191e-09, 1, -2.90212157e-08, 0.99987185, 2.87843993e-09, -0.0160072874)
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local localPlayer = Players.LocalPlayer
            RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function()
                if localPlayer.Character then
                    local hum = localPlayer.Character:FindFirstChild("Humanoid")
                    if hum then
                        hum:Move(Vector3.new(10000, 0, -1), true)
                    end
                end
            end)
        end
        if not getgenv().PPJ10 then
            local RunService = game:GetService("RunService")
            RunService:UnbindFromRenderStep("move")
        end
    end
})

D:Toggle({
    Title = "冰霜健身房跑步机2000",
    Default = false,
    Callback = function(state)
        if game.Players.LocalPlayer.Agility.Value >= 2000 then
            getgenv().PPJ2000 = state
            while getgenv().PPJ2000 do
                wait()
                local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                local rootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                humanoid.WalkSpeed = 10
                rootPart.CFrame = CFrame.new(-3005.37866, 14.3221855, -464.697876, -0.015773816, -1.38508964e-08, 0.999875605, -5.13225586e-08, 1, 1.30429667e-08, -0.999875605, -5.11104332e-08, -0.015773816)
                local RunService = game:GetService("RunService")
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function()
                    if localPlayer.Character then
                        local hum = localPlayer.Character:FindFirstChild("Humanoid")
                        if hum then
                            hum:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end)
            end
        end
        if not getgenv().PPJ2000 then
            local RunService = game:GetService("RunService")
            RunService:UnbindFromRenderStep("move")
        end
    end
})

D:Toggle({
    Title = "神话健身房跑步机2000",
    Default = false,
    Callback = function(state)
        if game.Players.LocalPlayer.Agility.Value >= 2000 then
            getgenv().SHPPJ2000 = state
            while getgenv().SHPPJ2000 do
                wait()
                local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                local rootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                humanoid.WalkSpeed = 10
                rootPart.CFrame = CFrame.new(2571.23706, 15.6896839, 898.650391, 0.999968231, 2.23868635e-09, -0.00797206629, -1.73198844e-09, 1, 6.35660768e-08, 0.00797206629, -6.3550246e-08, 0.999968231)
                local RunService = game:GetService("RunService")
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function()
                    if localPlayer.Character then
                        local hum = localPlayer.Character:FindFirstChild("Humanoid")
                        if hum then
                            hum:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end)
            end
        end
        if not getgenv().SHPPJ2000 then
            local RunService = game:GetService("RunService")
            RunService:UnbindFromRenderStep("move")
        end
    end
})

D:Toggle({
    Title = "永恒健身房跑步机3500",
    Default = false,
    Callback = function(state)
        if game.Players.LocalPlayer.Agility.Value >= 3500 then
            getgenv().YHPPJ3500 = state
            while getgenv().YHPPJ3500 do
                wait()
                local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                local rootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                humanoid.WalkSpeed = 10
                rootPart.CFrame = CFrame.new(-7077.79102, 29.6702118, -1457.59961, -0.0322036594, -3.31122768e-10, 0.99948132, -6.44344267e-09, 1, 1.23684493e-10, -0.99948132, -6.43611742e-09, -0.0322036594)
                local RunService = game:GetService("RunService")
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function()
                    if localPlayer.Character then
                        local hum = localPlayer.Character:FindFirstChild("Humanoid")
                        if hum then
                            hum:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end)
            end
        end
        if not getgenv().YHPPJ3500 then
            local RunService = game:GetService("RunService")
            RunService:UnbindFromRenderStep("move")
        end
    end
})

D:Toggle({
    Title = "传奇健身房跑步机3000",
    Default = false,
    Callback = function(state)
        if game.Players.LocalPlayer.Agility.Value >= 3000 then
            getgenv().CQPPJ3000 = state
            while getgenv().CQPPJ3000 do
                wait()
                local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                local rootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                humanoid.WalkSpeed = 10
                rootPart.CFrame = CFrame.new(4370.82812, 999.358704, -3621.42773, -0.960604727, -8.41949266e-09, -0.27791819, -6.12478646e-09, 1, -9.12496567e-09, 0.27791819, -7.06329528e-09, -0.960604727)
                local RunService = game:GetService("RunService")
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                RunService:BindToRenderStep("move", Enum.RenderPriority.Character.Value + 1, function()
                    if localPlayer.Character then
                        local hum = localPlayer.Character:FindFirstChild("Humanoid")
                        if hum then
                            hum:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end)
            end
        end
        if not getgenv().CQPPJ3000 then
            local RunService = game:GetService("RunService")
            RunService:UnbindFromRenderStep("move")
        end
    end
})

D:Toggle({
    Title = "丛林健身房跑步机20000",
    Default = false,
    Callback = function(state)
        if game.Players.LocalPlayer.Agility.Value >= 20000 then
            getgenv().JungleTreadmill = state
            while getgenv().JungleTreadmill do
                wait()
                local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
                local rootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                humanoid.WalkSpeed = 10
                rootPart.CFrame = CFrame.new(-8138.67919921875, 28.270538330078125, 2833.511474609375, -0.960604727, -8.41949266e-09, -0.27791819, -6.12478646e-09, 1, -9.12496567e-09, 0.27791819, -7.06329528e-09, -0.960604727)
                local RunService = game:GetService("RunService")
                local Players = game:GetService("Players")
                local localPlayer = Players.LocalPlayer
                RunService:BindToRenderStep("JungleRun", Enum.RenderPriority.Character.Value + 1, function()
                    if localPlayer.Character then
                        local hum = localPlayer.Character:FindFirstChild("Humanoid")
                        if hum then
                            hum:Move(Vector3.new(10000, 0, -1), true)
                        end
                    end
                end)
            end
        end
        if not getgenv().JungleTreadmill then
            local RunService = game:GetService("RunService")
            RunService:UnbindFromRenderStep("JungleRun")
        end
    end
})

local squatSection = D:Section({Title = "深蹲器材", Opened = true})

D:Toggle({
    Title = "沙滩深蹲架",
    Default = false,
    Callback = function(state)
        getgenv().SquatBeach = state
        if getgenv().SquatBeach then
            spawn(function()
                while getgenv().SquatBeach do
                    pcall(function()
                        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1000 then
                            if game.Players.LocalPlayer.machineInUse.Value == nil then
                                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(232.627625, 3.67689133, 96.3039856, -0.963445187, -7.78685845e-08, -0.267905563, -7.92865222e-08, 1, -5.52570167e-09, 0.267905563, 1.5917589e-08, -0.963445187)
                                wait(0.00001)
                                local vim = game:GetService("VirtualInputManager")
                                vim:SendKeyEvent(true, "E", false, game)
                                wait(0.00001)
                                vim:SendKeyEvent(false, "E", false, game)
                            else
                                local A_1 = "rep"
                                local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                                Event:FireServer(A_1, A_2)
                            end
                        end
                    end)
                    wait()
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

D:Toggle({
    Title = "霜冻健身房深蹲架",
    Default = false,
    Callback = function(state)
        getgenv().SquatFrostGym = state
        if getgenv().SquatFrostGym then
            spawn(function()
                while getgenv().SquatFrostGym do
                    pcall(function()
                        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 4000 then
                            if game.Players.LocalPlayer.machineInUse.Value == nil then
                                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2629.13818, 3.36860609, -609.827454, -0.995664716, -2.67296816e-08, -0.0930150598, -1.90042453e-08, 1, -8.39415222e-08, 0.0930150598, -8.18099295e-08, -0.995664716)
                                wait(0.00001)
                                local vim = game:GetService("VirtualInputManager")
                                vim:SendKeyEvent(true, "E", false, game)
                                wait(0.00001)
                                vim:SendKeyEvent(false, "E", false, game)
                            else
                                local A_1 = "rep"
                                local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                                Event:FireServer(A_1, A_2)
                            end
                        end
                    end)
                    wait(0.00001)
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

D:Toggle({
    Title = "传奇健身房深蹲架",
    Default = false,
    Callback = function(state)
        getgenv().SquatLegendGym = state
        if getgenv().SquatLegendGym then
            spawn(function()
                while getgenv().SquatLegendGym do
                    pcall(function()
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4443.04443, 987.521484, -4061.12988, 0.83309716, 3.33018835e-09, 0.553126693, -2.87759438e-09, 1, -1.68654424e-09, -0.553126693, -1.86619012e-10, 0.83309716)
                            wait(0.00001)
                            local vim = game:GetService("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                            wait(0.00001)
                            vim:SendKeyEvent(false, "E", false, game)
                        else
                            local A_1 = "rep"
                            local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                            local Event = game:GetService("Players").LocalPlayer.muscleEvent
                            Event:FireServer(A_1, A_2)
                        end
                    end)
                    wait(0.00001)
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

D:Toggle({
    Title = "肌肉之王健身房深蹲架",
    Default = false,
    Callback = function(state)
        getgenv().SquatMuscleGym = state
        if getgenv().SquatMuscleGym then
            spawn(function()
                while getgenv().SquatMuscleGym do
                    pcall(function()
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8757.37012, 13.2186356, -6051.24365, -0.902269304, 1.63610299e-08, -0.431172907, 1.71076486e-08, 1, 2.14606288e-09, 0.431172907, -5.44002754e-09, -0.902269304)
                            wait(0.00001)
                            local vim = game:GetService("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                            wait(0.00001)
                            vim:SendKeyEvent(false, "E", false, game)
                        else
                            local A_1 = "rep"
                            local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                            local Event = game:GetService("Players").LocalPlayer.muscleEvent
                            Event:FireServer(A_1, A_2)
                        end
                    end)
                    wait(0.00001)
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

D:Toggle({
    Title = "丛林健身房深蹲架",
    Default = false,
    Callback = function(state)
        getgenv().SquatJungleGym = state
        if getgenv().SquatJungleGym then
            spawn(function()
                while getgenv().SquatJungleGym do
                    pcall(function()
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8383.45, 3.43 + 80, 2854.54, -0.902269304, 1.63610299e-08, -0.431172907, 1.71076486e-08, 1, 2.14606288e-09, 0.431172907, -5.44002754e-09, -0.902269304)
                            wait(0.00001)
                            local vim = game:GetService("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                            wait(0.00001)
                            vim:SendKeyEvent(false, "E", false, game)
                        else
                            local A_1 = "rep"
                            local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                            local Event = game:GetService("Players").LocalPlayer.muscleEvent
                            Event:FireServer(A_1, A_2)
                        end
                    end)
                    wait(0.00001)
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

local pullupSection = D:Section({Title = "引体向上器材", Opened = true})

D:Toggle({
    Title = "沙滩引体向上",
    Default = false,
    Callback = function(state)
        getgenv().PullupBeach = state
        if getgenv().PullupBeach then
            spawn(function()
                while getgenv().PullupBeach do
                    pcall(function()
                        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1000 then
                            if game.Players.LocalPlayer.machineInUse.Value == nil then
                                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-185.157745, 5.81071186, 104.747154, 0.227061391, -8.2363325e-09, 0.97388047, 5.58502826e-08, 1, -4.56432803e-09, -0.97388047, 5.54278827e-08, 0.227061391)
                                wait(0.00001)
                                local vim = game:GetService("VirtualInputManager")
                                vim:SendKeyEvent(true, "E", false, game)
                                wait(0.00001)
                                vim:SendKeyEvent(false, "E", false, game)
                            else
                                local A_1 = "rep"
                                local A_2 = game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
                                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                                Event:FireServer(A_1, A_2)
                            end
                        end
                    end)
                    wait(0.00001)
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

D:Toggle({
    Title = "神话健身房引体向上",
    Default = false,
    Callback = function(state)
        getgenv().PullupMythGym = state
        if getgenv().PullupMythGym then
            spawn(function()
                while getgenv().PullupMythGym do
                    pcall(function()
                        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 4000 then
                            if game.Players.LocalPlayer.machineInUse.Value == nil then
                                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2315.82104, 5.81071281, 847.153076, 0.993555248, 6.99809632e-08, 0.113349125, -7.05298859e-08, 1, 8.32554692e-10, -0.113349125, -8.82168916e-09, 0.993555248)
                                wait(0.00001)
                                local vim = game:GetService("VirtualInputManager")
                                vim:SendKeyEvent(true, "E", false, game)
                                wait(0.00001)
                                vim:SendKeyEvent(false, "E", false, game)
                            else
                                local A_1 = "rep"
                                local A_2 = game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
                                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                                Event:FireServer(A_1, A_2)
                            end
                        end
                    end)
                    wait(0.00001)
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

D:Toggle({
    Title = "霜冻健身房深蹲架",
    Default = false,
    Callback = function(state)
        getgenv().SquatFrostGym = state
        if getgenv().SquatFrostGym then
            spawn(function()
                while getgenv().SquatFrostGym do
                    pcall(function()
                        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 4000 then
                            if game.Players.LocalPlayer.machineInUse.Value == nil then
                                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2629.13818, 3.36860609, -609.827454, -0.995664716, -2.67296816e-08, -0.0930150598, -1.90042453e-08, 1, -8.39415222e-08, 0.0930150598, -8.18099295e-08, -0.995664716)
                                wait(0.0001)
                                local vim = game:GetService("VirtualInputManager")
                                vim:SendKeyEvent(true, "E", false, game)
                                wait(0.0001)
                                vim:SendKeyEvent(false, "E", false, game)
                            else
                                local A_1 = "rep"
                                local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                                Event:FireServer(A_1, A_2)
                            end
                        end
                    end)
                    wait()
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

D:Toggle({
    Title = "传奇健身房深蹲架",
    Default = false,
    Callback = function(state)
        getgenv().SquatLegendGym = state
        if getgenv().SquatLegendGym then
            spawn(function()
                while getgenv().SquatLegendGym do
                    pcall(function()
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4443.04443, 987.521484, -4061.12988, 0.83309716, 3.33018835e-09, 0.553126693, -2.87759438e-09, 1, -1.68654424e-09, -0.553126693, -1.86619012e-10, 0.83309716)
                            wait(0.0001)
                            local vim = game:GetService("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                            wait(0.0001)
                            vim:SendKeyEvent(false, "E", false, game)
                        else
                            local A_1 = "rep"
                            local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                            local Event = game:GetService("Players").LocalPlayer.muscleEvent
                            Event:FireServer(A_1, A_2)
                        end
                    end)
                    wait()
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

D:Toggle({
    Title = "肌肉之王健身房深蹲架",
    Default = false,
    Callback = function(state)
        getgenv().SquatMuscleGym = state
        if getgenv().SquatMuscleGym then
            spawn(function()
                while getgenv().SquatMuscleGym do
                    pcall(function()
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8757.37012, 13.2186356, -6051.24365, -0.902269304, 1.63610299e-08, -0.431172907, 1.71076486e-08, 1, 2.14606288e-09, 0.431172907, -5.44002754e-09, -0.902269304)
                            wait(0.0001)
                            local vim = game:GetService("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                            wait(0.0001)
                            vim:SendKeyEvent(false, "E", false, game)
                        else
                            local A_1 = "rep"
                            local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                            local Event = game:GetService("Players").LocalPlayer.muscleEvent
                            Event:FireServer(A_1, A_2)
                        end
                    end)
                    wait()
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

D:Toggle({
    Title = "丛林健身房深蹲架",
    Default = false,
    Callback = function(state)
        getgenv().SquatJungleGym = state
        if getgenv().SquatJungleGym then
            spawn(function()
                while getgenv().SquatJungleGym do
                    pcall(function()
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8383.45, 3.43 + 80, 2854.54, -0.902269304, 1.63610299e-08, -0.431172907, 1.71076486e-08, 1, 2.14606288e-09, 0.431172907, -5.44002754e-09, -0.902269304)
                            wait(0.0001)
                            local vim = game:GetService("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                            wait(0.0001)
                            vim:SendKeyEvent(false, "E", false, game)
                        else
                            local A_1 = "rep"
                            local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
                            local Event = game:GetService("Players").LocalPlayer.muscleEvent
                            Event:FireServer(A_1, A_2)
                        end
                    end)
                    wait()
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

local pullupSection = D:Section({Title = "丢石头", Opened = true})

D:Toggle({
    Title = "沙滩投掷石",
    Default = false,
    Callback = function(state)
        getgenv().ThrowBeach = state
        if getgenv().ThrowBeach then
            spawn(function()
                while getgenv().ThrowBeach do
                    pcall(function()
                        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 3000 then
                            if game.Players.LocalPlayer.machineInUse.Value == nil then
                                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-91.6730804, 3.67689133, -292.42868, -0.221022144, -2.21041621e-08, -0.975268781, 1.21414407e-08, 1, -2.54162646e-08, 0.975268781, -1.7458726e-08, -0.221022144)
                                wait(0.0001)
                                local vim = game:GetService("VirtualInputManager")
                                vim:SendKeyEvent(true, "E", false, game)
                                wait(0.0001)
                                vim:SendKeyEvent(false, "E", false, game)
                            else
                                local A_1 = "rep"
                                local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                                Event:FireServer(A_1, A_2)
                            end
                        end
                    end)
                    wait()
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

D:Toggle({
    Title = "神话健身房投掷石",
    Default = false,
    Callback = function(state)
        getgenv().ThrowMythGym = state
        if getgenv().ThrowMythGym then
            spawn(function()
                while getgenv().ThrowMythGym do
                    pcall(function()
                        if game.Players.LocalPlayer.leaderstats.Strength.Value >= 10000 then
                            if game.Players.LocalPlayer.machineInUse.Value == nil then
                                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2486.01733, 3.67689276, 1237.89331, 0.883595645, -2.06135038e-08, -0.468250751, -3.3286871e-09, 1, -5.03036404e-08, 0.468250751, 4.60067362e-08, 0.883595645)
                                wait(0.0001)
                                local vim = game:GetService("VirtualInputManager")
                                vim:SendKeyEvent(true, "E", false, game)
                                wait(0.0001)
                                vim:SendKeyEvent(false, "E", false, game)
                            else
                                local A_1 = "rep"
                                local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                                local Event = game:GetService("Players").LocalPlayer.muscleEvent
                                Event:FireServer(A_1, A_2)
                            end
                        end
                    end)
                    wait()
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

D:Toggle({
    Title = "传奇健身房投掷石",
    Default = false,
    Callback = function(state)
        getgenv().ThrowLegendGym = state
        if getgenv().ThrowLegendGym then
            spawn(function()
                while getgenv().ThrowLegendGym do
                    pcall(function()
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4189.96143, 987.829773, -3903.0166, 0.422592968, 0, 0.906319559, 0, 1, 0, -0.906319559, 0, 0.422592968)
                            wait(0.0001)
                            local vim = game:GetService("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                            wait(0.0001)
                            vim:SendKeyEvent(false, "E", false, game)
                        else
                            local A_1 = "rep"
                            local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                            local Event = game:GetService("Players").LocalPlayer.muscleEvent
                            Event:FireServer(A_1, A_2)
                        end
                    end)
                    wait()
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

D:Toggle({
    Title = "肌肉之王投掷石",
    Default = false,
    Callback = function(state)
        getgenv().ThrowMuscleGym = state
        if getgenv().ThrowMuscleGym then
            spawn(function()
                while getgenv().ThrowMuscleGym do
                    pcall(function()
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8935.4384765625, 13.855730056762695, -5693.66748046875)
                            wait(0.0001)
                            local vim = game:GetService("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                            wait(0.0001)
                            vim:SendKeyEvent(false, "E", false, game)
                        else
                            local A_1 = "rep"
                            local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
                            local Event = game:GetService("Players").LocalPlayer.muscleEvent
                            Event:FireServer(A_1, A_2)
                        end
                    end)
                    wait()
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

D:Toggle({
    Title = "丛林健身房投掷石",
    Default = false,
    Callback = function(state)
        getgenv().ThrowJungleGym = state
        if getgenv().ThrowJungleGym then
            spawn(function()
                while getgenv().ThrowJungleGym do
                    pcall(function()
                        if game.Players.LocalPlayer.machineInUse.Value == nil then
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8620.99, 89.81, 2673.54, -0.902269304, 1.63610299e-08, -0.431172907, 1.71076486e-08, 1, 2.14606288e-09, 0.431172907, -5.44002754e-09, -0.902269304)
                            wait(0.0001)
                            local vim = game:GetService("VirtualInputManager")
                            vim:SendKeyEvent(true, "E", false, game)
                            wait(0.0001)
                            vim:SendKeyEvent(false, "E", false, game)
                        else
                            local A_1 = "rep"
                            local A_2 = game:GetService("Workspace").machinesFolder.Throw.interactSeat
                            local Event = game:GetService("Players").LocalPlayer.muscleEvent
                            Event:FireServer(A_1, A_2)
                        end
                    end)
                    wait()
                end
            end)
        else
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    char:WaitForChild("Humanoid").Jump = true
                end
            end)
        end
    end
})

local modifySection = F:Section({Title = "美化数据", Opened = true})

F:Input({
    Title = "力量",
    Desc = "输入力量数值",
    Callback = function(value)
        if value and value ~= "" and tonumber(value) then
            game:GetService("Players").LocalPlayer.leaderstats.Strength.Value = tonumber(value)
        end
    end
})

F:Input({
    Title = "耐力",
    Desc = "输入耐力数值",
    Callback = function(value)
        if value and value ~= "" and tonumber(value) then
            game:GetService("Players").LocalPlayer.Durability.Value = tonumber(value)
        end
    end
})

F:Input({
    Title = "敏捷",
    Desc = "输入敏捷数值",
    Callback = function(value)
        if value and value ~= "" and tonumber(value) then
            game:GetService("Players").LocalPlayer.Agility.Value = tonumber(value)
        end
    end
})

F:Input({
    Title = "重生",
    Desc = "输入重生次数",
    Callback = function(value)
        if value and value ~= "" and tonumber(value) then
            game:GetService("Players").LocalPlayer.leaderstats.Rebirths.Value = tonumber(value)
        end
    end
})

F:Input({
    Title = "宝石",
    Desc = "输入宝石数量",
    Callback = function(value)
        if value and value ~= "" and tonumber(value) then
            game:GetService("Players").LocalPlayer.Gems.Value = tonumber(value)
        end
    end
})

F:Input({
    Title = "邪恶业报",
    Desc = "输入邪恶业报数值",
    Callback = function(value)
        if value and value ~= "" and tonumber(value) then
            game:GetService("Players").LocalPlayer.evilKarma.Value = tonumber(value)
        end
    end
})

F:Input({
    Title = "好人业报",
    Desc = "输入好人业报数值",
    Callback = function(value)
        if value and value ~= "" and tonumber(value) then
            game:GetService("Players").LocalPlayer.goodKarma.Value = tonumber(value)
        end
    end
})

F:Input({
    Title = "总业报",
    Desc = "输入总业报数值",
    Callback = function(value)
        if value and value ~= "" and tonumber(value) then
            game:GetService("Players").LocalPlayer.leaderstats.Kills.Value = tonumber(value)
        end
    end
})

local rebirthSection = E:Section({Title = "自动重生", Opened = true})

E:Toggle({
    Title = "自动重生",
    Default = false,
    Callback = function(state)
        getgenv().AutoRebirth = state
        if getgenv().AutoRebirth then
            spawn(function()
                while getgenv().AutoRebirth do
                    pcall(function()
                        game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                    end)
                    wait()
                end
            end)
        end
    end
})

local customSection = E:Section({Title = "自定义", Opened = true})

E:Input({
    Title = "自定义重生次数",
    Desc = "只能输入大于现在的重生次数",
    Callback = function(value)
        Interstellar.birth = tonumber(value) or 0
    end
})

E:Toggle({
    Title = "重生到指定的重生次数",
    Default = false,
    Callback = function(state)
        Interstellar.autobirth = state
        if Interstellar.autobirth then
            spawn(function()
                local player = game:GetService("Players").LocalPlayer
                local targetRebirths = Interstellar.birth
                while Interstellar.autobirth do
                    if player.leaderstats.Rebirths.Value >= targetRebirths then
                        Interstellar.autobirth = false
                        Window:Notify({
                            Title = "重生",
                            Content = "已自动重生到目标次数",
                            Duration = 3
                        })
                        break
                    else
                        game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                        wait()
                    end
                end
            end)
        end
    end
})

E:Divider()

E:Paragraph({
    Title = "适合直接打石头卡宠的重生次数",
    Desc = "重生:80\n重生:280\n重生:580\n重生:980\n重生:1480\n重生:2080\n重生:2780\n重生:3580\n重生:4480\n重生:5480\n重生:6580\n重生:7780\n重生:9080\n重生:10480\n重生:11980\n重生:13580\n重生:15280\n重生:17080\n重生:18980\n重生:94980\n重生:189980",
    ThumbnailSize = 190,
})

local teleportSection = G:Section({Title = "传送区", Opened = true})

local function T(c)
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = c
end

G:Button({
    Title = "安全点",
    Callback = function()
        T(CFrame.new(-51.67,32.22,1290.41,0.99455,1.24e-08,-0.10422,-7.59e-09,1,4.62e-08,0.10422,-4.52e-08,0.99455))
    end
})

G:Toggle({
    Title = "安全点循环",
    Default = false,
    Callback = function(state)
        getgenv().SafeSpot2 = state
        spawn(function()
            while getgenv().SafeSpot2 do 
                wait()
                pcall(function()
                    local char = game.Players.LocalPlayer.Character 
                    if not char then 
                        game.Players.LocalPlayer.CharacterAdded:Wait()
                        char = game.Players.LocalPlayer.Character 
                        char:WaitForChild("HumanoidRootPart")
                    end 
                    char.HumanoidRootPart.CFrame = CFrame.new(-51.67,32.22,1290.41,0.99455,1.24e-08,-0.10422,-7.59e-09,1,4.62e-08,0.10422,-4.52e-08,0.99455)
                end)
            end 
        end)
    end
})

G:Toggle({
    Title = "安全点循环2",
    Default = false,
    Callback = function(state)
        getgenv().SafeSpot2 = state
        spawn(function()
            while getgenv().SafeSpot2 do 
                wait()
                pcall(function()
                    local char = game.Players.LocalPlayer.Character 
                    if not char then 
                        game.Players.LocalPlayer.CharacterAdded:Wait()
                        char = game.Players.LocalPlayer.Character 
                        char:WaitForChild("HumanoidRootPart")
                    end 
                    char.HumanoidRootPart.CFrame = CFrame.new(0, 100050, 133.15)
                end)
            end 
        end)
    end
})

G:Button({
    Title = "雕像头顶",
    Callback = function()
        T(CFrame.new(1.19,85.09,244.49,0.59992,-2.24e-09,0.80006,4.46e-09,1,-5.44e-10,-0.80006,3.90e-09,0.59992))
    end
})

G:Button({
    Title = "肌肉王雕像头顶",
    Callback = function()
        T(CFrame.new(-8751.0,120.4,-5863.1,0.59992,-2.24e-09,0.80006,4.46e-09,1,-5.44e-10,-0.80006,3.90e-09,0.59992))
    end
})

G:Button({
    Title = "出生点",
    Callback = function()
        T(CFrame.new(7,3,108))
    end
})

G:Button({
    Title = "新手岛",
    Callback = function()
        T(CFrame.new(-37.61,4.16,1877.14))
    end
})

G:Button({
    Title = "传说健身房",
    Callback = function()
        T(CFrame.new(4603.28,988.18,-3897.87))
    end
})

G:Button({
    Title = "永恒健身房",
    Callback = function()
        T(CFrame.new(-6758.96,4.01,-1284.92))
    end
})

G:Button({
    Title = "神话健身房",
    Callback = function()
        T(CFrame.new(2250.78,4.01,1073.23))
    end
})

G:Button({
    Title = "冰霜健身房",
    Callback = function()
        T(CFrame.new(-2623.02,4.01,-409.07))
    end
})

G:Button({
    Title = "肌肉之王健身房",
    Callback = function()
        T(CFrame.new(-8625.93,13.86,-5730.47))
    end
})

G:Button({
    Title = "丛林健身房",
    Callback = function()
        T(CFrame.new(-8685.62,3.43,2392.33))
    end
})

local collectSection = H:Section({Title = "功能", Opened = true})

H:Button({
    Title = "使用一次奶昔",
    Callback = function()
        local char = game.Players.LocalPlayer.Character 
        if not char then return end 
        local humanoid = char:FindFirstChild("Humanoid")
        if not humanoid then return end 
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
            if v:IsA("Tool") and (v.Name:find("奶昔") or v.Name:find("Shake") or v.Name:find("Milkshake")) then 
                humanoid:EquipTool(v)
                v:Activate()
                wait(0.1)
                break 
            end 
        end 
    end
})

H:Toggle({
    Title = "自动使用奶昔",
    Default = false,
    Callback = function(state)
        getgenv().AutoShake = state 
        while getgenv().AutoShake do 
            wait()
            local char = game.Players.LocalPlayer.Character 
            if not char then wait(1) continue end 
            local humanoid = char:FindFirstChild("Humanoid")
            if not humanoid then continue end 
            local shakeFound = false 
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                if v:IsA("Tool") and (v.Name:find("奶昔") or v.Name:find("Shake") or v.Name:find("Milkshake")) then 
                    humanoid:EquipTool(v)
                    v:Activate()
                    shakeFound = true 
                    wait(1)
                    break 
                end 
            end 
            if not shakeFound then 
                wait(3)
            end 
        end 
    end
})

H:Button({
    Title = "使用一次能量棒",
    Callback = function()
        local c = game.Players.LocalPlayer.Character 
        if not c then return end 
        local h = c:FindFirstChild("Humanoid")
        if not h then return end 
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
            if v:IsA("Tool") and (v.Name:find("Protein Bar") or v.Name:find("能量棒") or v.Name:find("Energy Bar")) then 
                h:EquipTool(v)
                v:Activate()
                wait(0.1)
                break 
            end 
        end 
    end
})

H:Toggle({
    Title = "自动使用能量棒",
    Default = false,
    Callback = function(state)
        getgenv().AutoREB = state 
        while getgenv().AutoREB do 
            wait()
            local c = game.Players.LocalPlayer.Character 
            if not c then wait(1) continue end 
            local h = c:FindFirstChild("Humanoid")
            if not h then continue end 
            local f = false 
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                if v:IsA("Tool") and (v.Name:find("Protein Bar") or v.Name:find("能量棒") or v.Name:find("Energy Bar")) then 
                    h:EquipTool(v)
                    v:Activate()
                    f = true 
                    wait(1)
                    break 
                end 
            end 
            if not f then 
                wait(3)
            end 
        end 
    end
})

H:Divider()

H:Button({
    Title = "使用一次蛋白质蛋",
    Callback = function()
        local c = game.Players.LocalPlayer.Character 
        if not c then return end 
        local h = c:FindFirstChild("Humanoid")
        if not h then return end 
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
            if v:IsA("Tool") and (v.Name:find("Protein Egg") or v.Name:find("蛋白质蛋")) then 
                h:EquipTool(v)
                v:Activate()
                wait(0.1)
                break 
            end 
        end 
    end
})

H:Button({
    Title = "使用一次热带摇晃",
    Callback = function()
        local c = game.Players.LocalPlayer.Character 
        if not c then return end 
        local h = c:FindFirstChild("Humanoid")
        if not h then return end 
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
            if v:IsA("Tool") and (v.Name:find("Tropical Shake") or v.Name:find("热带摇晃")) then 
                h:EquipTool(v)
                v:Activate()
                wait(0.1)
                break 
            end 
        end 
    end
})

H:Divider()

H:Button({
    Title = "收集宝石",
    Callback = function()
        local jk = {}
        for _,v in pairs(game:GetService("ReplicatedStorage").chestRewards:GetDescendants()) do 
            if v.Name ~= "Light Karma Chest" and v.Name ~= "Evil Karma Chest" then 
                table.insert(jk, v.Name)
            end 
        end 
        for i=1,#jk do 
            wait(2)
            game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(jk[i])
        end 
    end
})

local Interstellar = {
    BuyAuto = false, BuyDark = false, BuyMuscle = false, BuyNeon = false,
    EvolveAuto = false, EvolveDark = false, EvolveMuscle = false, EvolveNeon = false, EvolveNeonCN = false,
    BlueCrystal = false, GreenCrystal = false, FrostCrystal = false, MythicalCrystal = false,
    InfernoCrystal = false, LegendsCrystal = false, MuscleElite = false, GalaxyOracle = false, JungleCrystal = false,
    AutoOpen = false
}

local BuyPetShop, EvolvePet, OpenCrystal = "", "", ""

local petshow = {"肌肉王光环", "暗星", "霓虹卫报", "赛博对决龙"}
local petNames = {
    ["肌肉王光环"] = "Muscle King",
    ["暗星"] = "Darkstar Hunter", 
    ["霓虹卫报"] = "Neon Guardian",
    ["赛博对决龙"] = "Cybernetic Showdown Dragon"
}

local crystalshow = {"Blue Crystal", "Green Crystal", "Frost Crystal", "Mythical Crystal", "Inferno Crystal", "Legends Crystal", "Muscle Elite Crystal", "Galaxy Oracle Crystal", "Jungle Crystal"}
local crystalNames = {
    ["蓝色宠物蛋"] = "Blue Crystal",
    ["绿色宠物蛋"] = "Green Crystal",
    ["冰霜宠物蛋"] = "Frost Crystal",
    ["神话宠物蛋"] = "Mythical Crystal",
    ["地狱宠物蛋"] = "Inferno Crystal",
    ["传奇宠物蛋"] = "Legends Crystal",
    ["传奇宠物蛋"] = "Muscle Elite Crystal",
    ["肌肉王宠物蛋"] = "Galaxy Oracle Crystal",
    ["丛林宠物蛋"] = "Jungle Crystal"
}
local crystalshowChinese = {}
for _, engName in ipairs(crystalshow) do
    for chnName, eName in pairs(crystalNames) do
        if eName == engName then
            table.insert(crystalshowChinese, chnName)
            break
        end
    end
end

local function CheckPetInventory(petName)
    local backpack = game:GetService("Players").LocalPlayer.Backpack
    local player = game:GetService("Players").LocalPlayer
    local found = false
    for _, item in pairs(backpack:GetChildren()) do
        if item.Name == petName then
            found = true
            break
        end
    end
    for _, item in pairs(player.Character:GetChildren()) do
        if item.Name == petName then
            found = true
            break
        end
    end
    return found
end

local buySection = I:Section({Title = "购买", Opened = true})

I:Paragraph({
    Title = "关于直接购买宠物",
    Desc = "你得保证你有充足的宝石\n因为购买一个宠物就值0.4亿左右\n否则购买失败",
    ThumbnailSize = 200,
})

local BuyPetShop = nil
local autoBuyPet = false

I:Dropdown({
    Title = "选择购买的宠物",
    Values = petshow,
    Value = "空",
    Callback = function(v)
        BuyPetShop = petNames[v]
    end
})

I:Button({
    Title = "购买选中宠物一次",
    Callback = function()
        if BuyPetShop then
            local p = game.ReplicatedStorage.cPetShopFolder:FindFirstChild(BuyPetShop)
            if p then
                game.ReplicatedStorage.cPetShopRemote:InvokeServer(p)
            end
        end
    end
})

I:Toggle({
    Title = "自动购买选中宠物",
    Default = false,
    Callback = function(state)
        autoBuyPet = state
        if state and BuyPetShop then
            task.spawn(function()
                while autoBuyPet and BuyPetShop do
                    local p = game.ReplicatedStorage.cPetShopFolder:FindFirstChild(BuyPetShop)
                    if p then
                        pcall(function()
                            game.ReplicatedStorage.cPetShopRemote:InvokeServer(p)
                            if CheckPetInventory(BuyPetShop) then
                                autoBuyPet = false
                            end
                        end)
                    end
                    task.wait(0.5)
                end
            end)
        elseif state and not BuyPetShop then
            autoBuyPet = false
        end
    end
})

local evolveSection = I:Section({Title = "进化", Opened = true})

I:Toggle({
    Title = "自动进化赛博对决龙",
    Default = false,
    Callback = function(s)
        Interstellar.EvolveDark = s
        if s then
            spawn(function()
                while Interstellar.EvolveDark do
                    pcall(function()
                        game.ReplicatedStorage.rEvents.petEvolveEvent:FireServer("evolvePet", "Cybernetic Showdown Dragon")
                    end)
                    wait()
                end
            end)
        end
    end
})

I:Toggle({
    Title = "自动进化暗星",
    Default = false,
    Callback = function(s)
        Interstellar.EvolveDark = s
        if s then
            spawn(function()
                while Interstellar.EvolveDark do
                    pcall(function()
                        game.ReplicatedStorage.rEvents.petEvolveEvent:FireServer("evolvePet", "Darkstar Hunter")
                    end)
                    wait()
                end
            end)
        end
    end
})

I:Toggle({
    Title = "自动进化肌肉王光环",
    Default = false,
    Callback = function(state)
        Interstellar.EvolveMuscle = state
        if Interstellar.EvolveMuscle then
            spawn(function()
                while Interstellar.EvolveMuscle do
                    pcall(function()
                        game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer("evolvePet", "Muscle King")
                    end)
                    wait()
                end
            end)
        end
    end
})

I:Toggle({
    Title = "自动进化霓虹卫报",
    Default = false,
    Callback = function(s)
        Interstellar.EvolveNeon = s
        if s then
            spawn(function()
                while Interstellar.EvolveNeon do
                    pcall(function()
                        game.ReplicatedStorage.rEvents.petEvolveEvent:FireServer("evolvePet", "Neon Guardian")
                    end)
                    wait()
                end
            end)
        end
    end
})

local crystalSection = I:Section({Title = "宠物蛋", Opened = true})

I:Paragraph({
    Title = "因为列表汉化有问题",
    Desc = "Blue Crystal = 蓝色宠物蛋\nGreen Crystal = 绿色宠物蛋\nFrost Crystal = 冰霜宠物蛋\nMythical Crystal = 神话宠物蛋\nInferno Crystal = 地狱宠物蛋\nLegends Crystal = 传奇宠物蛋\nGalaxy Oracle Crystal = 肌肉王宠物蛋\nJungle Crystal = 丛林宠物蛋",
    ThumbnailSize = 200,
})

I:Dropdown({
    Title = "选择宠物蛋",
    Values = crystalshow,
    Value = "空",
    Callback = function(v)
        OpenCrystal = v
    end
})

I:Button({
    Title = "购买宠物蛋",
    Callback = function()
        pcall(function()
            game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal", OpenCrystal)
        end)
    end
})

I:Toggle({
    Title = "自动购买选中宠物蛋",
    Default = false,
    Callback = function(s)
        Interstellar.AutoOpen = s
        if s then
            spawn(function()
                while Interstellar.AutoOpen do
                    pcall(function()
                        game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal", OpenCrystal)
                    end)
                    wait()
                end
            end)
        end
    end
})

local otherSection = J:Section({Title = "常用功能", Opened = true})

otherSection:Toggle({
    Title = "去雾", 
    Default = false, 
    Callback = function(state)
        if state then
            game.Lighting.FogStart = 3276634343
            game.Lighting.FogEnd = 3276734343
        else
            game.Lighting.FogStart = 0
        end
    end
})

otherSection:Divider()

otherSection:Slider({
    Title = "视野",
    Step = 1,
    Value = {Min = 10, Max = 180, Default = workspace.CurrentCamera.FieldOfView},
    Callback = function(FOV)
        getgenv().TargetFOV = FOV
        workspace.CurrentCamera.FieldOfView = FOV
        
        if not getgenv().FOVLoop then
            getgenv().FOVLoop = game:GetService("RunService").Heartbeat:Connect(function()
                if workspace.CurrentCamera then
                    workspace.CurrentCamera.FieldOfView = getgenv().TargetFOV
                end
            end)
            
            game.Players.LocalPlayer.CharacterAdded:Connect(function()
                wait(1)
                if workspace.CurrentCamera then
                    workspace.CurrentCamera.FieldOfView = getgenv().TargetFOV
                end
            end)
        end
    end
})

otherSection:Divider()

otherSection:Toggle({
    Title = "穿墙",
    Default = false,
    Callback = function(state)
        if state then
            getgenv().noclipConnection = game:GetService("RunService").Stepped:Connect(function()
                local LocalPlayer = game:GetService("Players").LocalPlayer
                if LocalPlayer.Character then
                    for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if getgenv().noclipConnection then
                getgenv().noclipConnection:Disconnect()
                getgenv().noclipConnection = nil
            end
            
            local LocalPlayer = game:GetService("Players").LocalPlayer
            if LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end
})

otherSection:Divider()

local flySpeed = 150
local flyMultiplier = 5
otherSection:Slider({
    Title = "飞行倍率",
    Step = 0.1,
    Value = {Min = 1, Max = 20, Default = 5},
    Callback = function(multiplier)
        flyMultiplier = multiplier
    end
})

otherSection:Toggle({
    Title = "飞行开关",
    Default = false,
    Callback = function(bak)
        getgenv().fly = bak
        if bak then
            local controlModule = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild('PlayerModule'):WaitForChild("ControlModule"))
            local character = game.Players.LocalPlayer.Character
            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
            
            local function setupFlight(character)
                local hrp = character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                
                if hrp:FindFirstChild("VelocityHandler") then hrp.VelocityHandler:Destroy() end
                if hrp:FindFirstChild("GyroHandler") then hrp.GyroHandler:Destroy() end
                
                local bv = Instance.new("BodyVelocity")
                bv.Name = "VelocityHandler"
                bv.Parent = hrp
                bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                bv.Velocity = Vector3.new(0, 0, 0)
                
                local bg = Instance.new("BodyGyro")
                bg.Name = "GyroHandler"
                bg.Parent = hrp
                bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                bg.P = 1000
                bg.D = 50
                
                return bv, bg
            end
            
            local bv, bg = setupFlight(character)
            
            local camera = game.Workspace.CurrentCamera
            getgenv().FlyLoop = game:GetService("RunService").RenderStepped:Connect(function()
                local currentCharacter = game.Players.LocalPlayer.Character
                local hrp = currentCharacter and currentCharacter:FindFirstChild("HumanoidRootPart")
                if currentCharacter and hrp and hrp:FindFirstChild("VelocityHandler") and hrp:FindFirstChild("GyroHandler") and getgenv().fly then
                    currentCharacter.Humanoid.PlatformStand = true
                    hrp.GyroHandler.CFrame = camera.CFrame
                    
                    local direction = controlModule:GetMoveVector()
                    local actualSpeed = flySpeed * flyMultiplier
                    
                    hrp.VelocityHandler.Velocity = Vector3.new()
                    if direction.X ~= 0 then
                        hrp.VelocityHandler.Velocity = hrp.VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * actualSpeed)
                    end
                    if direction.Z ~= 0 then
                        hrp.VelocityHandler.Velocity = hrp.VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * actualSpeed)
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                        hrp.VelocityHandler.Velocity = hrp.VelocityHandler.Velocity + Vector3.new(0, actualSpeed/2, 0)
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                        hrp.VelocityHandler.Velocity = hrp.VelocityHandler.Velocity - Vector3.new(0, actualSpeed/2, 0)
                    end
                end
            end)
        else
            if getgenv().FlyLoop then
                getgenv().FlyLoop:Disconnect()
            end
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local hrp = character.HumanoidRootPart
                if hrp:FindFirstChild("VelocityHandler") then hrp.VelocityHandler:Destroy() end
                if hrp:FindFirstChild("GyroHandler") then hrp.GyroHandler:Destroy() end
                character.Humanoid.PlatformStand = false
            end
        end
    end
})

K:Button({
    Title = "解锁全部通行证",
    Callback = function()
        pcall(function()
            for i, v in ipairs(game:GetService("ReplicatedStorage").gamepassIds:GetChildren()) do
                v.Parent = game.Players.LocalPlayer.ownedGamepasses
            end
        end)
    end
})

K:Divider()

K:Button({
    Title = "执行zxt脚本（第一个刷重生）",
    Callback = function()
        loadstring(game:HttpGet("https://raw.github.com/114514541883484/X/main/hanhua1.lua"))()
    end
})

K:Button({
    Title = "执行ato脚本（第二个刷重生要群组）",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Anscripterato/QQ2134702438/refs/heads/main/byato/AnScript/atoscript"))()
    end
})

WindUI:Notify({
    Title = "永爱",
    Content = "反挂机已自动开启",
    Duration = 3,
})

WindUI:Notify({
    Title = "永爱",
    Content = "力量传奇",
    Duration = 3,
})

print("Anti Afk On")
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function() 
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame); 
    wait(1); 
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) 
end)
end