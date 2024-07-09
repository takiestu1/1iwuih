-- Load Orion Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Create a Window
local Window = OrionLib:MakeWindow({Name = "My Script", HidePremium = false, SaveConfig = true, ConfigFolder = "MyScriptConfig"})

-- Create Tabs
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Auto Random Fruits
MainTab:AddButton({
    Name = "Random Fruits",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
    end    
})

MainTab:AddToggle({
    Name = "Auto Random Fruits",
    Default = false,
    Flag = "Auto Random Fruits",
    Save = true,
    Callback = function(Value)
        _G.Random_Auto = Value
    end    
})

spawn(function()
    while wait(0.1) do
        if _G.Random_Auto then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
        end 
    end
end)

-- Auto Drop Fruit
MainTab:AddToggle({
    Name = "Auto Drop Fruit",
    Default = false,
    Flag = "Auto Drop Fruit",
    Save = true,
    Callback = function(Value)
        _G.DropFruit = Value
    end    
})

spawn(function()
    while wait() do
        if _G.DropFruit then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                for _,v in pairs(player.Backpack:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        EquipWeapon(v.Name)
                        wait(10)
                        if player.PlayerGui.Main.Dialogue.Visible == true then
                            player.PlayerGui.Main.Dialogue.Visible = false
                        end
                        EquipWeapon(v.Name)
                        player.Character:FindFirstChild(v.Name).EatRemote:InvokeServer("Drop")
                    end
                end
                for _,v in pairs(player.Character:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        EquipWeapon(v.Name)
                        wait(0.1)
                        if player.PlayerGui.Main.Dialogue.Visible == true then
                            player.PlayerGui.Main.Dialogue.Visible = false
                        end
                        EquipWeapon(v.Name)
                        player.Character:FindFirstChild(v.Name).EatRemote:InvokeServer("Drop")
                    end
                end
            end)
        end
    end
end)

local Section = Tab:AddSection({
    Name = "Auto Functions"
})

Section:AddButton({
    Name = "Auto Teleport Cafe",
    Callback = function()
        _G.AutoTeleportCafe = not _G.AutoTeleportCafe
        while _G.AutoTeleportCafe do
            wait()
            local player = game.Players.LocalPlayer
            local cafePosition = Vector3.new(355.42730712890625, 477.48077392578125, -5501.91748046875)  -- Replace these coordinates if needed
            player.Character.HumanoidRootPart.CFrame = CFrame.new(cafePosition)
        end
    end
})

-- Auto-enable the functions
_G.AutoRandomFruit = true
_G.AutoDropFruit = true
_G.AutoTeleportCafe = true

-- Auto Random Fruit function
spawn(function()
    while _G.AutoRandomFruit do
        wait()
        -- Insert the script to auto random fruit here
    end
end)

-- Auto Drop Fruit function
spawn(function()
    while _G.AutoDropFruit do
        wait()
        -- Insert the script to auto drop fruit here
    end
end)

-- Auto Teleport Cafe function
spawn(function()
    while _G.AutoTeleportCafe do
        wait()
        local player = game.Players.LocalPlayer
        local cafePosition = Vector3.new(355.42730712890625, 477.48077392578125, -5501.91748046875)  -- Replace these coordinates if needed
        player.Character.HumanoidRootPart.CFrame = CFrame.new(cafePosition)
    end
end)

-- Initialize Orion Library
OrionLib:Init()

-- Ensure Auto Random Fruits and Auto Drop Fruit are running
_G.Random_Auto = true
_G.DropFruit = true
_G.AutoTeleportCafe = true

-- Helper function to equip weapon
function EquipWeapon(weaponName)
    local player = game:GetService("Players").LocalPlayer
    if player.Backpack:FindFirstChild(weaponName) then
        player.Character.Humanoid:EquipTool(player.Backpack:FindFirstChild(weaponName))
    end
end


-- Helper function to stop tweening
function StopTween(active)
    if not active then
        game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(1),
            {CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame}
        ):Play()
    end
end


OrionLib:Init()

OrionLib:MakeNotification({
    Name = "Night Hub",
    Content = "Loading Config Complete!!",
    Image = "rbxassetid://4483345998",
    Time = 1
})
