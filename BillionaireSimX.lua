local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

--> Taken from my project Niggardly Client. Credits to Redline for the original code.
do
    local __LUAU_OPTIMIZATION_CHECK, _ = pcall(function()
        for i, v in {} do end
    end)
    
    if (__LUAU_OPTIMIZATION_CHECK) then
        pairs = function(t)
            return t
        end
    
        ipairs = function(t)
            return t
        end
    end
end

--> Also taken from my project Niggardly Client, only took the Heartbeat handler
local Framework = (function ()
    local __Framework = {}

    do
        __Framework.Heartbeat = {
            Callback = nil,
            Delay = 0,
            Connection = nil
        }
        __Framework.Heartbeat.__index = __Framework.Heartbeat

        function __Framework.Heartbeat.new(callback)
            return setmetatable({
                Callback = callback
            }, __Framework.Heartbeat)
        end

        function __Framework.Heartbeat:Initialize()
            if (not self.Connection) then
                self.Connection = RunService.Heartbeat:Connect(function(delta)
                    self.Callback(delta)
                    task.wait(self.Delay)
                end)
            end
        end

        function __Framework.Heartbeat:Terminate()
            if (self.Connection) then
                self.Connection:Disconnect()
            end
        end

        function __Framework.Heartbeat:SetCallback(new_callback)
            self.Callback = new_callback
        end

        function __Framework.Heartbeat:SetDelay(new_delay)
            self.Delay = new_delay
        end
    end

    do
        function __Framework.RegisterRemoteEvent(remote_path)
            local self = {
                path = remote_path,
                old = nil
            }

            function self:Fire(...)
                self.old = ... --> Saves this for "Repeat", always overwrites.
                self.path:FireServer(...)
            end

            function self:Repeat()
                self.path:FireServer(self.old)
            end
        end
    end

    return __Framework
end)()

local Window = Rayfield:CreateWindow({
    Name = "All Scripts",
    LoadingTitle = "Chill Hub",
    LoadingSubtitle = "Made by ChaseisChillin2",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil, -- Create a custom folder for your hub/game
        FileName = "SaveFile"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
        RememberJoins = true    -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false,          -- Set this to true to use our key system
    KeySettings = {
        Title = "All Script Key",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",                      -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
        SaveKey = true,                        -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = false,               -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = { "https://pastebin.com/dPxksJ8h" } -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

local Settings = {
    ["AutoBuy"] = false,
    ["AutoWork"] = false,
    ["AutoRebirth"] = false
}

local MainTab = Window:CreateTab("Main", nil)              -- Title, Image
local AutoFarmTab = Window:CreateTab("AutoFarm", nil)      -- Title, Image
local MiscTab = Window:CreateTab("Misc", nil)              -- Title, Image
local MainSection = MainTab:CreateSection("Main")
local AutoFarmSection = AutoFarmTab:CreateSection("AutoFarm")
local MiscSection = MiscTab:CreateSection("Misc")

local PlayerRemote, ControlEvent do
    PlayerRemote = Framework.RegisterRemoteEvent(workspace.PlayerManagement[Players.LocalPlayer.Name]:WaitForChild("LocalRemote", 15))
    ControlEvent = Framework.RegisterRemoteEvent(ReplicatedStorage._RemoteEvents:WaitForChild("_ControlEven", 15))
end

do
    AutoFarmTab:CreateToggle({
        Name = "Auto Buy",
        CurrentValue = false,
        Flag = "AutoFarm_AutoBuy",
        Callback = function(Value)
            Settings["AutoBuy"] = Value
        end
    })

    local AutoBuyLoopEvents do
        AutoBuyLoopEvents = {}
    
        for i = 1, 9 do
            table.insert(AutoBuyLoopEvents, {
                true,
                "PurchaseStation",
                i,
                "Earth"
            })
        end
    
        for i = 1, 9 do
            table.insert(AutoBuyLoopEvents, {
                true,
                "U100",
                i,
                "Earth"
            })
        end
    end
    
    local AutoBuyLoop = Framework.Heartbeat.new(function()
        if (not Settings["AutoBuy"]) then
            return
        end
    
        if (not PlayerRemote) then
            return
        end
    
        for _, event in pairs(AutoBuyLoopEvents) do
            PlayerRemote:Fire(event)
        end
    end)
end

do
    AutoFarmTab:CreateToggle({
        Name = "Auto Work",
        CurrentValue = false,
        Flag = "AutoFarm_AutoWork",
        Callback = function(Value)
            Settings["AutoWork"] = Value
        end
    })

    local AutoWorkLoopEvents do
        AutoWorkLoopEvents = {}

        for i = 1, 9 do
            table.insert(AutoWorkLoopEvents, {
                true,
                "workBut",
                tostring(i),
                "Earth"
            })
        end
    end

    local AutoWorkLoop = Framework.Heartbeat.new(function()
        if (not Settings["AutoWork"]) then
            return
        end
    
        if (not PlayerRemote) then
            return
        end
    
        for _, event in pairs(AutoWorkLoopEvents) do
            PlayerRemote:Fire(event)
        end
    end)
end

do
    AutoFarmTab:CreateToggle({
        Name = "Auto Rebirth",
        CurrentValue = false,
        Flag = "AutoFarm_AutoRebirth",
        Callback = function(Value)
            Settings["AutoRebirth"] = Value
        end
    })

    local AutoRebirthLoop = Framework.Heartbeat.new(function()
        if (not Settings["AutoRebirth"]) then
            return
        end

        if (not ControlEvent) then
            return
        end

        ControlEvent:Fire({
            true,
            "rebirth",
            "Earth"
        })
    end)
end