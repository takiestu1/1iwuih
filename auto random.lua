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

MainTab:AddToggle({
    Name = "Auto Random Fruits",
    Default = true,  -- Auto enabled
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
    Default = true,  -- Auto enabled
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
