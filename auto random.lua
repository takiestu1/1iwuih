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
                        wait(0.1)
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

-- Teleport to Cafe
MainTab:AddButton({
    Name = "Teleport to Cafe",
    Callback = function()
        local teleportPositions = {
            ["Cafe"] = CFrame.new(-380.479, 77.2204, 255.825)
        }
        local selectedPosition = teleportPositions["Cafe"]
        if selectedPosition then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = selectedPosition
        end
    end    
})

-- Finish the script
OrionLib:Init()

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

OrionLib:MakeNotification({
    Name = "Night Hub",
    Content = "Loading script complete!, You can now enable the function!",
    Image = "rbxassetid://4483345998",
    Time = 5
})

OrionLib:Init()
_G.Random_Auto = _G.Random_Auto or false
_G.DropFruit = _G.DropFruit or false
