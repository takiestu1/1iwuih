local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "TOÀN ĐẸP ZAI",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "NightHubConfig"
})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Auto Functions"
})

D:AddButton({
    Name = "Random Fruits",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
      end    
})

D:AddToggle({
    Name = "Auto Random Fruits",
    Default = false,
    Flag = "Auto Random Fruits",
    Save = true,
    Callback = function(Value)
        _G.Random_Auto = Value
    end    
})

spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.Random_Auto then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
            end 
        end
    end)
end)

})

Section:AddButton({
    Name = "Auto Drop Fruit",
    Callback = function()
        _G.AutoDropFruit = not _G.AutoDropFruit
        while _G.AutoDropFruit do
            wait()
            -- Insert the script to auto drop fruit here
        end
    end
})

Section:AddButton({
    Name = "Auto Teleport Cafe",
    Callback = function()
        _G.AutoTeleportCafe = not _G.AutoTeleportCafe
        while _G.AutoTeleportCafe do
            wait()
            local player = game.Players.LocalPlayer
            local cafePosition = Vector3.new(-427.2214050292969, 240.67694091796875, -198.3234405517578)  -- Replace these coordinates if needed
            player.Character.HumanoidRootPart.CFrame = CFrame.new(cafePosition)
        end
    end
})

OrionLib:MakeNotification({
    Name = "Night Hub",
    Content = "Loading script complete!, You can now enable the function!",
    Image = "rbxassetid://4483345998",
    Time = 5
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
        local cafePosition = Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)  -- Replace these coordinates if needed
        player.Character.HumanoidRootPart.CFrame = CFrame.new(cafePosition)
    end
end)

OrionLib:Init()

OrionLib:MakeNotification({
    Name = "Night Hub",
    Content = "Loading Config Complete!!",
    Image = "rbxassetid://4483345998",
    Time = 5
})
