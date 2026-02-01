local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")

_G.lx_Script_Loaded = true
_G.lx_Execution_Count = 1
_G.HitboxEnabled = false
_G.HeadSize = 10
_G.HitboxLoop = nil

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- 创建主窗口
local Window = WindUI:CreateWindow({
    AuthorImage = 90840643379863,
    User = {
        Enabled = true,
        Callback = function()
            print("点击了用户信息")
        end,
        Anonymous = false,
    },
    Title = "lx脚本",
    Transparent = true,
    Folder = "CloudHub",
    Author = "冷兮制作",
    Icon = "leaf",
    Size = UDim2.fromOffset(560, 360),
})

-- 编辑打开按钮
Window:EditOpenButton({
    StrokeThickness = 3,
    Title = "lx",
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(144, 238, 144)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 0)),
    }),
    Draggable = true,
})

-- 创建选项卡
local tabs = {}
local tabNames = {
    "通用", "FE", "娱乐", "ESP", "自瞄", "子追", "范围", "各大脚本",
    "力量传奇", "忍者传奇", "极速传奇", "墨水游戏", "FPS：S", 
    "破坏者谜团", "监狱人生", "最强战场", "99夜", "设置"
}

for i, name in ipairs(tabNames) do
    tabs[name] = Window:Tab({
        Title = name,
        Icon = "eye",
    })
end

-- 系统信息标签
tabs["通用"]:Paragraph({
    Image = "info",
    Title = "系统信息",
    Color = Color3.fromHex("#0099FF"),
    ImageSize = 20,
    Desc = string.format("用户名: %s\n显示名: %s\n用户ID: %d\n账号年龄: %d天", 
        LocalPlayer.Name, LocalPlayer.DisplayName, LocalPlayer.UserId, LocalPlayer.AccountAge),
})

tabs["通用"]:Paragraph({
    Image = "bar-chart",
    Title = "性能信息",
    Color = Color3.fromHex("#00A2FF"),
    ImageSize = 20,
    Desc = "帧率: 计算中...",
})

-- 声明
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#FFFFFF"),
    Desc = " ",
    Image = "eye",
    Title = "本人在此声明：封号与本脚本无关",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 1,
})

-- QQ群复制
tabs["通用"]:Button({
    Title = "复制QQ群[获取最新消息]",
    Callback = function()
        setclipboard("1064245855")
    end,
})

-- 常用功能区域
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是常用的",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 1,
})

-- Adonis反作弊绕过
tabs["通用"]:Button({
    Title = "Adonis反作弊绕过",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua"))()
    end,
})

-- 移动速度调整
local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
if humanoid then
    tabs["通用"]:Slider({
        Title = "移动速度",
        Value = {
            Min = 1,
            Default = humanoid.WalkSpeed,
            Max = 600,
        },
        Step = 1,
        Callback = function(value)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = value
            end
        end,
    })
    
    -- 跳跃高度调整
    tabs["通用"]:Slider({
        Title = "跳跃高度",
        Value = {
            Min = 1,
            Default = humanoid.JumpPower,
            Max = 600,
        },
        Step = 1,
        Callback = function(value)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character.Humanoid.JumpPower = value
            end
        end,
    })
end

-- 重力设置
tabs["通用"]:Slider({
    Title = "重力设置",
    Value = {
        Min = 1,
        Default = workspace.Gravity,
        Max = 500,
    },
    Step = 1,
    Callback = function(value)
        workspace.Gravity = value
    end,
})

-- 锁视角功能
tabs["通用"]:Button({
    Title = "锁视角",
    Callback = function()
        -- 创建锁视角界面
        local shiftlockGui = Instance.new("ScreenGui")
        shiftlockGui.Name = "ShiftlockGUI"
        shiftlockGui.Parent = game.CoreGui
        shiftlockGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        shiftlockGui.ResetOnSpawn = false
        
        local lockButton = Instance.new("ImageButton")
        lockButton.Name = "LockButton"
        lockButton.Parent = shiftlockGui
        lockButton.Active = true
        lockButton.Draggable = true
        lockButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        lockButton.BackgroundTransparency = 1
        lockButton.Position = UDim2.new(0.9219, 0, 0.5524, 0)
        lockButton.Size = UDim2.new(0.0636, 0, 0.0661, 0)
        lockButton.SizeConstraint = Enum.SizeConstraint.RelativeXX
        lockButton.Image = "rbxasset://textures/ui/mouseLock_off@2x.png"
        
        local isLocked = false
        local connection
        
        local function enableShiftLock()
            if LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.AutoRotate = false
                    lockButton.Image = "rbxasset://textures/ui/mouseLock_on@2x.png"
                    isLocked = true
                    
                    if connection then
                        connection:Disconnect()
                    end
                    
                    connection = RunService.RenderStepped:Connect(function()
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local rootPart = LocalPlayer.Character.HumanoidRootPart
                            local camera = workspace.CurrentCamera
                            
                            if camera then
                                local lookAt = CFrame.new(rootPart.Position, rootPart.Position + Vector3.new(0, 0, -1))
                                camera.CFrame = lookAt * CFrame.new(1.7, 0, 0)
                            end
                        end
                    end)
                end
            end
        end
        
        local function disableShiftLock()
            if LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.AutoRotate = true
                    lockButton.Image = "rbxasset://textures/ui/mouseLock_off@2x.png"
                    isLocked = false
                    
                    if connection then
                        connection:Disconnect()
                        connection = nil
                    end
                end
            end
        end
        
        lockButton.MouseButton1Click:Connect(function()
            if isLocked then
                disableShiftLock()
            else
                enableShiftLock()
            end
        end)
        
        -- 绑定快捷键
        ContextActionService:BindAction("ToggleShiftLock", function(actionName, inputState, inputObject)
            if inputState == Enum.UserInputState.Begin then
                if isLocked then
                    disableShiftLock()
                else
                    enableShiftLock()
                end
            end
        end, false, Enum.KeyCode.LeftShift)
        
        print("锁视角功能已加载")
    end,
})

-- 飞行区
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是飞行区",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

tabs["通用"]:Button({
    Title = "飞行",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/uhf/main/lx%E9%A3%9E%E8%A1%8C"))()
    end,
})

tabs["通用"]:Button({
    Title = "飞行v4",
    Callback = function()
        loadstring(game:HttpGet("https://dpaste.org/PE88V/raw"))()
    end,
})

tabs["通用"]:Button({
    Title = "无敌少侠r15",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invinicible-Flight-R15-45414"))()
    end,
})

tabs["通用"]:Button({
    Title = "无敌少侠r6",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E6%97%A0%E6%95%8C%E5%B0%91%E4%BE%A0%E9%A3%9E%E8%A1%8Cr6.txt"))()
    end,
})

-- 无限跳
local infiniteJumpEnabled = false
local jumpConnection
tabs["通用"]:Toggle({
    Title = "无限跳",
    Value = false,
    Callback = function(value)
        infiniteJumpEnabled = value
        
        if value then
            jumpConnection = UserInputService.JumpRequest:Connect(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        elseif jumpConnection then
            jumpConnection:Disconnect()
            jumpConnection = nil
        end
    end,
})

-- 爬墙
tabs["通用"]:Button({
    Title = "爬墙",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
    end,
})

-- 黑洞区
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是黑洞区",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

tabs["通用"]:Button({
    Title = "双环控制黑洞",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%8F%8C%E7%8E%AF%E6%8E%A7%E5%88%B6%E9%BB%91%E6%B4%9E.txt"))()
    end,
})

tabs["通用"]:Button({
    Title = "可爱黑洞[英文]",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-AURA/main/kawaii_aura.lua"))()
    end,
})

tabs["通用"]:Button({
    Title = "哥特风黑洞",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%93%A5%E7%89%B9%E9%A3%8E%E9%BB%91%E6%B4%9E.txt"))()
    end,
})

tabs["通用"]:Button({
    Title = "磁铁黑洞",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E7%A3%81%E9%93%81%E9%BB%91%E6%B4%9EV2.txt"))()
    end,
})

tabs["通用"]:Button({
    Title = "司空汉化部件环绕v6",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/fdydyf/main/%E9%BB%91%E6%B4%9E%E7%8E%AF%E7%BB%95v6"))()
    end,
})

tabs["通用"]:Button({
    Title = "司空汉化整人黑洞",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/eyidfki/main/%E9%BB%91%E6%B4%9ECappo"))()
    end,
})

-- FPS优化区
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是fps区",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

tabs["通用"]:Button({
    Title = "fpsBooster(很猛的提升fps)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JoshzzAlteregooo/JoshzzFpsBoosterVersion3/refs/heads/main/JoshzzNewFpsBooster"))()
    end,
})

tabs["通用"]:Button({
    Title = "fps显示",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/d9j82YJr/raw", true))()
    end,
})

-- 回溯区
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是回溯区",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

tabs["通用"]:Button({
    Title = "回溯",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MSTTOPPER/Scripts/refs/heads/main/FlashBack"))()
    end,
})

-- 甩飞区
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是甩飞区",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

tabs["通用"]:Button({
    Title = "甩飞所有人",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
    end,
})

tabs["通用"]:Button({
    Title = "甩飞",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/3LD4D0/Crazy-Man-R6/36ec60d16bf8d208c40807aa0fd2662af76a5385/Crazy%20Man%20R6"))()
    end,
})

tabs["通用"]:Button({
    Title = "触碰既甩飞",
    Callback = function()
        loadstring(game:HttpGet("http://rawscripts.net/raw/Universal-Script-Touch-fling-script-22447"))()
    end,
})

tabs["通用"]:Button({
    Title = "防甩飞",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/protezzx/Player-joined-left/refs/heads/main/Antifling%20script", true))()
    end,
})

-- 防坠落区
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是防坠落区",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

tabs["通用"]:Button({
    Title = "防坠落 by西班牙",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/5twh2hsf9j-byte/BowenPrime67/refs/heads/main/Python"))()
    end,
})

tabs["通用"]:Button({
    Title = "踏空行走",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float"))()
    end,
})

-- 传送区
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是传送区",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

tabs["通用"]:Button({
    Title = "点击传送工具",
    Callback = function()
        local mouse = LocalPlayer:GetMouse()
        local teleportTool = Instance.new("Tool")
        teleportTool.RequiresHandle = false
        teleportTool.Name = "点击传送"
        
        teleportTool.Activated:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = mouse.Hit.Position + Vector3.new(0, 2.5, 0)
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
            end
        end)
        
        teleportTool.Parent = LocalPlayer.Backpack
    end,
})

-- 跑酷区
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是关于跑酷的",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

tabs["通用"]:Button({
    Title = "贴墙走",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/0J9ERxCm"))()
    end,
})

tabs["通用"]:Button({
    Title = "通用跑酷脚本[老外]",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/eyidfki/main/%E8%B7%91%E9%85%B7%E8%80%81%E5%A4%96"))()
    end,
})

-- 穿墙区
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是穿墙区",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

local noclipEnabled = false
local noclipConnection
tabs["通用"]:Toggle({
    Title = "穿墙",
    Value = false,
    Callback = function(value)
        noclipEnabled = value
        
        if value then
            noclipConnection = RunService.Stepped:Connect(function()
                if LocalPlayer.Character then
                    for _, part in ipairs(LocalPlayer.Character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        elseif noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
    end,
})

-- 旋转区
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是旋转区",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

tabs["通用"]:Button({
    Title = "旋转[1]",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/r97d7dS0", true))()
    end,
})

tabs["通用"]:Button({
    Title = "旋转[2]",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/TUIXUI_qun-809771141/refs/heads/TUIXUI/fling"))()
    end,
})

tabs["通用"]:Button({
    Title = "在别人身上旋转",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ShutUpJamesTheLoserAlt/hatspin/refs/heads/main/hat"))()
    end,
})

-- 客户端区
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是客户端区",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

tabs["通用"]:Button({
    Title = "无头加短腿美化",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Permanent-Headless-And-korblox-Script-4140"))()
    end,
})

-- 视觉区
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是视觉区",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

-- 动态模糊
tabs["通用"]:Button({
    Title = "动态模糊",
    Callback = function()
        local camera = workspace.CurrentCamera
        local blurEffect = Instance.new("BlurEffect")
        blurEffect.Parent = camera
        blurEffect.Size = 24
        
        print("动态模糊已启用")
    end,
})

-- 删除阴影
local removeShadowsEnabled = false
tabs["通用"]:Toggle({
    Title = "删除阴影",
    Value = false,
    Callback = function(value)
        removeShadowsEnabled = value
        
        if value then
            Lighting.GlobalShadows = false
            Lighting.ShadowSoftness = 0
            
            for _, descendant in ipairs(game:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.CastShadow = false
                end
            end
            print("删除阴影已开启")
        else
            Lighting.GlobalShadows = true
            Lighting.ShadowSoftness = 1
        end
    end,
})

-- 夜视
local nightVisionEnabled = false
tabs["通用"]:Toggle({
    Title = "夜视",
    Value = false,
    Callback = function(value)
        nightVisionEnabled = value
        
        if value then
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.Brightness = 2
        else
            Lighting.Ambient = Color3.new(0, 0, 0)
            Lighting.Brightness = 1
        end
    end,
})

-- 视野调整
tabs["通用"]:Button({
    Title = "最大视野缩放",
    Callback = function()
        LocalPlayer.CameraMaxZoomDistance = 200000
    end,
})

tabs["通用"]:Button({
    Title = "视野缩放128",
    Callback = function()
        LocalPlayer.CameraMaxZoomDistance = 128
    end,
})

tabs["通用"]:Slider({
    Title = "视野缩放距离",
    Value = {
        Min = 1,
        Default = LocalPlayer.CameraMaxZoomDistance,
        Max = 1500,
    },
    Step = 1,
    Callback = function(value)
        LocalPlayer.CameraMaxZoomDistance = value
    end,
})

tabs["通用"]:Button({
    Title = "广角",
    Callback = function()
        workspace.CurrentCamera.FieldOfView = 120
    end,
})

tabs["通用"]:Button({
    Title = "恢复视野",
    Callback = function()
        workspace.CurrentCamera.FieldOfView = 70
    end,
})

-- 控制区
tabs["通用"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "以下是控制区",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

tabs["通用"]:Button({
    Title = "控制NPC",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/fe-source/refs/heads/main/NPC/source/main.Luau"))()
    end,
})

-- FE功能
tabs["FE"]:Button({
    Title = "索尼克",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/otFP6Acp/raw"))()
    end,
})

tabs["FE"]:Button({
    Title = "地精",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_rTvXTs8F16D8D2oiLxZ62E1E9jT1we312yUyJr2h72Vwqr32l37rirU1S89hqRV7.lua.txt"))()
    end,
})

tabs["FE"]:Button({
    Title = "尾巴",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/cQ2RNfpR/raw"))()
    end,
})

tabs["FE"]:Button({
    Title = "超光速and超级跳跃",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fake-lag-41217"))()
    end,
})

tabs["FE"]:Button({
    Title = "096",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YsJgITXR/raw"))()
    end,
})

tabs["FE"]:Button({
    Title = "超多动作but英文",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/vv/main/%E8%80%81%E5%A4%96%E5%8A%A8%E4%BD%9C100%E4%B8%87%E4%B8%AA"))()
    end,
})

tabs["FE"]:Button({
    Title = "动作",
    Callback = function()
        loadstring(game:HttpGet("https://yarhm.mhi.im/scr?channel=afemmax"))()
    end,
})

tabs["FE"]:Button({
    Title = "导管子[E快 Q慢]",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/lawnvcTT/raw", true))()
    end,
})

tabs["FE"]:Button({
    Title = "导管子r15",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
    end,
})

tabs["FE"]:Button({
    Title = "导管子r6",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/imalwaysad/universal-gui/refs/heads/main/jerk%20off%20r6"))()
    end,
})

tabs["FE"]:Button({
    Title = "僵尸模式",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/JOWniO6o/raw"))()
    end,
})

tabs["FE"]:Button({
    Title = "英雄",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kanade-script/invincible-script/refs/heads/main/mark%20mode", true))()
    end,
})

tabs["FE"]:Button({
    Title = "隐身",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/vv/main/%E9%9A%90%E8%BA%ABfe"))()
    end,
})

-- ESP系统
local espEnabled = false
local espConnections = {}
local espObjects = {}

local function createESP(player)
    if not player.Character then return end
    
    local character = player.Character
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    -- 名称ESP
    local nameBillboard = Instance.new("BillboardGui")
    nameBillboard.Name = "ESP_Name"
    nameBillboard.Adornee = rootPart
    nameBillboard.Size = UDim2.new(0, 200, 0, 30)
    nameBillboard.StudsOffset = Vector3.new(0, 3.5, 0)
    nameBillboard.AlwaysOnTop = true
    nameBillboard.Parent = rootPart
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.TextSize = 14
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Parent = nameBillboard
    
    -- 方框ESP
    local boxBillboard = Instance.new("BillboardGui")
    boxBillboard.Name = "ESP_Box"
    boxBillboard.Adornee = rootPart
    boxBillboard.Size = UDim2.new(0, 80, 0, 120)
    boxBillboard.StudsOffset = Vector3.new(0, 0, 0)
    boxBillboard.AlwaysOnTop = true
    boxBillboard.Parent = rootPart
    
    local boxFrame = Instance.new("Frame")
    boxFrame.Size = UDim2.new(1, 0, 1, 0)
    boxFrame.BackgroundTransparency = 1
    boxFrame.BorderSizePixel = 2
    boxFrame.BorderColor3 = Color3.new(1, 0, 0)
    boxFrame.Parent = boxBillboard
    
    -- 距离ESP
    local distanceBillboard = Instance.new("BillboardGui")
    distanceBillboard.Name = "ESP_Distance"
    distanceBillboard.Adornee = rootPart
    distanceBillboard.Size = UDim2.new(0, 120, 0, 25)
    distanceBillboard.StudsOffset = Vector3.new(0, -3, 0)
    distanceBillboard.AlwaysOnTop = true
    distanceBillboard.Parent = rootPart
    
    local distanceLabel = Instance.new("TextLabel")
    distanceLabel.Size = UDim2.new(1, 0, 1, 0)
    distanceLabel.BackgroundTransparency = 1
    distanceLabel.TextColor3 = Color3.new(0, 1, 1)
    distanceLabel.TextSize = 12
    distanceLabel.Font = Enum.Font.GothamBold
    distanceLabel.Text = "距离: 0"
    distanceLabel.Parent = distanceBillboard
    
    -- 血量ESP
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local healthBillboard = Instance.new("BillboardGui")
        healthBillboard.Name = "ESP_Health"
        healthBillboard.Adornee = rootPart
        healthBillboard.Size = UDim2.new(0, 70, 0, 25)
        healthBillboard.StudsOffset = Vector3.new(0, 2.5, 0)
        healthBillboard.AlwaysOnTop = true
        healthBillboard.Parent = rootPart
        
        local healthFrame = Instance.new("Frame")
        healthFrame.Name = "HealthFrame"
        healthFrame.Size = UDim2.new(0.9, 0, 0.5, 0)
        healthFrame.Position = UDim2.new(0.05, 0, 0.25, 0)
        healthFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        healthFrame.BorderSizePixel = 1
        healthFrame.BorderColor3 = Color3.new(1, 1, 1)
        healthFrame.Parent = healthBillboard
        
        local healthBar = Instance.new("Frame")
        healthBar.Name = "HealthBar"
        healthBar.Size = UDim2.new(1, 0, 1, 0)
        healthBar.BackgroundColor3 = Color3.new(0, 1, 0)
        healthBar.BorderSizePixel = 0
        healthBar.Parent = healthFrame
        
        local healthText = Instance.new("TextLabel")
        healthText.Name = "HealthText"
        healthText.Size = UDim2.new(1, 0, 0.5, 0)
        healthText.Position = UDim2.new(0, 0, 0.5, 0)
        healthText.BackgroundTransparency = 1
        healthText.TextColor3 = Color3.new(1, 1, 1)
        healthText.TextSize = 10
        healthText.Font = Enum.Font.GothamBold
        healthText.Text = "100/100"
        healthText.Parent = healthBillboard
    end
    
    espObjects[player] = {
        Name = nameBillboard,
        Box = boxBillboard,
        Distance = distanceBillboard
    }
end

local function updateESP()
    if not espEnabled then return end
    
    local localCharacter = LocalPlayer.Character
    if not localCharacter then return end
    
    local localRoot = localCharacter:FindFirstChild("HumanoidRootPart")
    if not localRoot then return end
    
    for player, esp in pairs(espObjects) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            
            if rootPart then
                -- 更新距离
                local distance = (rootPart.Position - localRoot.Position).Magnitude
                if esp.Distance and esp.Distance:FindFirstChild("TextLabel") then
                    esp.Distance.TextLabel.Text = "距离: " .. math.floor(distance)
                end
                
                -- 更新血量
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid and esp.Health then
                    local healthPercent = humanoid.Health / humanoid.MaxHealth
                    if esp.HealthBar then
                        esp.HealthBar.Size = UDim2.new(healthPercent, 0, 1, 0)
                        
                        -- 根据血量改变颜色
                        if healthPercent > 0.7 then
                            esp.HealthBar.BackgroundColor3 = Color3.new(0, 1, 0)
                        elseif healthPercent > 0.3 then
                            esp.HealthBar.BackgroundColor3 = Color3.new(1, 1, 0)
                        else
                            esp.HealthBar.BackgroundColor3 = Color3.new(1, 0, 0)
                        end
                        
                        if esp.HealthText then
                            esp.HealthText.Text = math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
                        end
                    end
                end
            end
        end
    end
end

local function clearESP(player)
    if espObjects[player] then
        for _, esp in pairs(espObjects[player]) do
            if esp and esp.Parent then
                esp:Destroy()
            end
        end
        espObjects[player] = nil
    end
end

local function clearAllESP()
    for player, _ in pairs(espObjects) do
        clearESP(player)
    end
    espObjects = {}
end

-- ESP总开关
tabs["ESP"]:Toggle({
    Title = "启用ESP总开关",
    Value = false,
    Callback = function(value)
        espEnabled = value
        
        if value then
            -- 为现有玩家创建ESP
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    createESP(player)
                end
            end
            
            -- 监听新玩家
            table.insert(espConnections, Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function()
                    wait(1)
                    createESP(player)
                end)
                
                player.CharacterRemoving:Connect(function()
                    clearESP(player)
                end)
            end))
            
            -- 监听玩家离开
            table.insert(espConnections, Players.PlayerRemoving:Connect(function(player)
                clearESP(player)
            end))
            
            -- 更新循环
            table.insert(espConnections, RunService.Heartbeat:Connect(updateESP))
            
            print("ESP已启用")
        else
            -- 清理所有连接和ESP对象
            for _, connection in ipairs(espConnections) do
                connection:Disconnect()
            end
            espConnections = {}
            clearAllESP()
            
            print("ESP已禁用")
        end
    end,
})

-- 自瞄功能
tabs["自瞄"]:Button({
    Title = "陌自瞄（死亡消失）",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/ZYMlyhhz/raw", true))()
    end,
})

tabs["自瞄"]:Button({
    Title = "宙斯自瞄",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()
    end,
})

tabs["自瞄"]:Button({
    Title = "英文自瞄",
    Callback = function()
        loadstring(game:HttpGet("https://rentry.co/n55gmtpi/raw", true))()
    end,
})

-- 自瞄距离选项
local aimbotDistances = {50, 100, 150, 200, 250, 300, 350, 400, 600}
for _, distance in ipairs(aimbotDistances) do
    tabs["自瞄后面的数字是圆圈大小"]:Button({
        Title = "自瞄" .. distance,
        Callback = function()
            loadstring(game:HttpGet(string.format("https://pastefy.app/b3uXjRF6/raw", distance), true))()
        end,
    })
end

tabs["自瞄"]:Button({
    Title = "自瞄全屏",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/n5LhGGgf/raw", true))()
    end,
})

tabs["自瞄"]:Button({
    Title = "神青高级自瞄",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/QQ-9-2-8-9-50173/refs/heads/main/cure.lua"))()
    end,
})

-- 自定义范围(Hitbox)
tabs["范围"]:Input({
    Title = "自定义范围",
    Placeholder = "例如: 20",
    Value = "10",
    Desc = "输入HitBox大小",
    Callback = function(value)
        local size = tonumber(value)
        if size then
            _G.HeadSize = size
            print("HitBox大小已设置为: " .. size)
        end
    end,
})

tabs["范围"]:Toggle({
    Title = "启用自定义范围",
    Value = false,
    Callback = function(value)
        _G.HitboxEnabled = value
        
        if value then
            if _G.HitboxLoop then
                _G.HitboxLoop:Disconnect()
            end
            
            _G.HitboxLoop = RunService.RenderStepped:Connect(function()
                if _G.HitboxEnabled then
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            local character = player.Character
                            local rootPart = character:FindFirstChild("HumanoidRootPart")
                            
                            if rootPart then
                                rootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                                rootPart.Transparency = 0.7
                                rootPart.BrickColor = BrickColor.new("Really red")
                                rootPart.Material = Enum.Material.Neon
                                rootPart.CanCollide = false
                            end
                        end
                    end
                end
            end)
            
            print("自定义范围已开启，大小: " .. _G.HeadSize)
        elseif _G.HitboxLoop then
            _G.HitboxLoop:Disconnect()
            _G.HitboxLoop = nil
        end
    end,
})

-- 子弹追踪
tabs["子追"]:Button({
    Title = "HB 子追",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HB-ksdb/-4/main/%E5%AD%90%E8%BF%BD%E8%84%9A%E6%9C%AC%E7%A9%BF%E5%A2%99.lua"))()
    end,
})

tabs["子追"]:Button({
    Title = "俄州子追",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/ClasiniZukov/e7547e7b48fa90d10eb7f85bd3569147/raw/f95cd3561a3bb3ac6172a14eb74233625b52e757/gistfile1.txt"))()
    end,
})

-- 各大脚本
local scripts = {
    {"殺脚本", "https://raw.githubusercontent.com/FengYu-3/FengYu/refs/heads/Feng/QQ1926190957"},
    {"德与中山[免费版]", "https://raw.githubusercontent.com/dream77239/Deyu-Zhongshan/refs/heads/main/%E5%BE%B7%E4%B8%8E%E4%B8%AD%E5%B1%B1.txt"},
    {"皮脚本", "https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"},
    {"xa", "https://raw.githubusercontent.com/XingFork/Scripts/refs/heads/main/Loader"},
    {"xk", "https://github.com/devslopo/DVES/raw/main/XK%20Hub"},
    {"混脚本", "https://raw.githubusercontent.com/smalldesikon/wocaonima/main/sikon.txt"},
    {"皮空", "https://raw.githubusercontent.com/smalldesikon/eyidfki/840d4b80d4f312c70b7b1067e056a2c4f828ef32/%E6%89%A7%E8%A1%8C%E8%84%9A%E6%9C%AC(%E6%B7%B7%E6%B7%86%E5%90%8E).txt"},
    {"冷脚本", "https://raw.githubusercontent.com/odhdshhe/leng5/refs/heads/main/leng5.lua"},
    {"蛊脚本 卡密：坚持", "https://raw.githubusercontent.com/sdxs221/-/main/爱别离"},
    {"kg脚本", "https://github.com/ZS-NB/KG/raw/main/Zhang-Shuo.lua"},
    {"DOLL", "https://raw.githubusercontent.com/lool8/-/refs/heads/main/DOLL.lua"},
    {"WTB", "https://raw.githubusercontent.com/Potato5466794/GC-WTB/refs/heads/main/Loader/Loader.luau"},
    {"SX hub", "https://api.luarmor.net/files/v3/loaders/87a8a4f4c2d2ef535ccd1bdb949218fe.lua"},
    {"云脚本", "https://github.com/IlIlIlIlIlIlIlIlIlIlIlIlIlIlIlIl/Mian/raw/main/云脚本.luau"},
    {"天脚本", "https://raw.githubusercontent.com/XTScripthub/Ohio/main/tianscript"},
    {"大司马脚本", "https://raw.githubusercontent.com/whenheer/-v4/refs/heads/main/Protected_5320244476072095.lua"},
    {"小凌脚本", "https://raw.githubusercontent.com/flyspeed7/Xiao-Ling-1.3-Script/main/%E5%B0%8F%E5%87%8C%E8%84%9A%E6%9C%AC%E5%B0%8F%E5%87%8C%E8%84%9A%E6%9C%AC%E5%B0%8F%E5%87%8C%E8%84%9A%E6%9C%AC%E5%B0%8F%E5%87%8C%E8%84%9A%E6%9C%AC%E5%B0%8F%E5%87%8C%E8%84%9A%E6%9C%AC%E5%B0%8F%E5%87%8C%E8%84%9A%E6%9C%AC%E5%B0%8F%E5%87%8C%E8%84%9A%E6%9C%AC%E5%B0%8F%E5%87%8C%E8%84%9A%E6%9C%AC%E5%B0%8F%E5%87%8C%E8%84%9A%E6%9C%AC%E5%B0%8F%E5%87%8C%E8%84%9A%E6%9C%AC.Lua"},
    {"WX脚本[免费]", "https://pastefy.app/vA6Y2jrc/raw"},
    {"旧冬脚本", "https://raw.githubusercontent.com/XiaoXuCynic/XiaoXu-s-Script/refs/heads/main/%E6%97%A7%E5%86%ACV1%E6%B7%B7%E6%B7%86.lua.txt"}
}

for i, scriptData in ipairs(scripts) do
    local name, url = scriptData[1], scriptData[2]
    tabs["各大脚本"]:Button({
        Title = name,
        Callback = function()
            loadstring(game:HttpGet(url, true))()
        end,
    })
    
    -- 添加卡密复制按钮
    if name == "WX脚本[免费]" then
        tabs["各大脚本"]:Button({
            Title = "复制WX卡密",
            Callback = function()
                setclipboard("WX_1q64jf")
            end,
        })
    elseif name == "德与中山[免费版]" then
        tabs["各大脚本"]:Button({
            Title = "点我复制免费版q群获取卡密",
            Callback = function()
                setclipboard("1040970564")
            end,
        })
    end
end

-- 游戏特定脚本
-- 力量传奇
tabs["力量传奇"]:Button({
    Title = "汉化老外脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/vv/49b52c1e1f2a68d22ec0abec4b5d7068190056a9/w"))()
    end,
})

tabs["力量传奇"]:Button({
    Title = "也是汉化老外",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/vv/24873082e923de2afc31f715e71192ee80e405bb/%E5%8A%9B%E9%87%8F%E4%BC%A0%E5%A5%87%E6%9C%80%E5%BC%BA%E6%B5%8B%E8%AF%95.txt"))()
    end,
})

-- 忍者传奇
tabs["忍者传奇"]:Button({
    Title = "不知名1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/1"))()
    end,
})

tabs["忍者传奇"]:Button({
    Title = "不知名2",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/2UjrXwTV"))()
    end,
})

tabs["忍者传奇"]:Button({
    Title = "挂机",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatBlueDevil/Bleus/main/Ninja%20Legends/Source.lua"))()
    end,
})

tabs["忍者传奇"]:Button({
    Title = "无限金币",
    Callback = function()
        loadstring(game:HttpGet("https://raw.github.com/VcPa/V/main/v"))()
    end,
})

-- 极速传奇
tabs["极速传奇"]:Button({
    Title = "刷经验",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/9KWQXasx"))()
    end,
})

tabs["极速传奇"]:Button({
    Title = "不知名",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/GoodScript/main/LegendOfSpeed(Chinese)"))()
    end,
})

tabs["极速传奇"]:Button({
    Title = "不知名2",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/cwCdNqds"))()
    end,
})

tabs["极速传奇"]:Button({
    Title = "整合",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/0A4J7V8M"))()
    end,
})

tabs["极速传奇"]:Button({
    Title = "加载时间比较长但好用",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/tUfDyUfz"))()
    end,
})

-- 墨水游戏
tabs["墨水游戏"]:Button({
    Title = "好用但是英文",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/bored"))()
    end,
})

tabs["墨水游戏"]:Button({
    Title = "好用",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TuffGuys/TuffGuys/refs/heads/main/Loader"))()
    end,
})

tabs["墨水游戏"]:Button({
    Title = "国人脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Games/墨水游戏.lua"))()
    end,
})

tabs["墨水游戏"]:Button({
    Title = "Ringta",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/Ringta"))()
    end,
})

-- 娱乐功能
tabs["娱乐"]:Button({
    Title = "coolgui[适用电脑]",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/kxuNSVD3"))("Furry gon complain 🥀")
    end,
})

tabs["娱乐"]:Button({
    Title = "coolgui[适用手机]",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/eyidfki/main/cool%E6%89%8B%E6%9C%BA"))()
    end,
})

-- 其他游戏脚本
tabs["破坏者谜团"]:Button({
    Title = "mm2[英文]",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/de-ishi/syl/refs/heads/main/ForsakenOBF.lua"))()
    end,
})

tabs["监狱人生"]:Paragraph({
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    Desc = " 👇👇👇",
    Image = "eye",
    Title = "此脚本传送的时候不要在短时间内频率太高",
    OutlineThickness = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    Padding = UDim.new(0, 1),
    BackgroundTransparency = 0.2,
    BackgroundColor3 = Color3.fromHex("#000000"),
})

tabs["监狱人生"]:Button({
    Title = "Cappo汉化[无反作弊]",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/smalldesikon/eyidfki/main/cappo%E6%B1%89%E5%8C%96%E7%9B%91%E7%8B%B1%E4%BA%BA%E7%94%9F"))()
    end,
})

tabs["监狱人生"]:Button({
    Title = "复制Cappo汉化卡密",
    Callback = function()
        setclipboard("WSAD")
    end,
})

tabs["最强战场"]:Button({
    Title = "老外1",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/U3scYPvW"))()
    end,
})

tabs["99夜"]:Button({
    Title = "国人1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/shenqin/refs/heads/main/99day.lua"))()
    end,
})

-- 设置
tabs["设置"]:Button({
    Title = "折叠UI",
    Callback = function()
        Window:Close()
    end,
})

tabs["设置"]:Button({
    Title = "重置人物",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.Health = 0
        end
    end,
})

tabs["设置"]:Button({
    Title = "重进服务器",
    Callback = function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end,
})

tabs["设置"]:Button({
    Title = "离开服务器",
    Callback = function()
        game:Shutdown()
    end,
})

-- 反挂机功能
local antiAfkEnabled = true
if antiAfkEnabled then
    local virtualUser = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        virtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        virtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Text = "虽然不知道有没有增强",
        Title = "反挂机2已开启",
        Duration = 5,
    })
    print("Anti Afk On")
end

-- FPS显示更新
spawn(function()
    while wait(1) do
        local fps = math.floor(1 / wait())
        -- 更新FPS显示
        print("当前FPS: " .. fps)
    end
end)

print("lx正式版2.0脚本加载完成")
