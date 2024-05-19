--Main Script

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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

local MainTab = Window:CreateTab("Main", nil)              -- Title, Image
local AutoFarmTab = Window:CreateTab("AutoFarm", nil)      -- Title, Image
local MiscTab = Window:CreateTab("Misc", nil)              -- Title, Image
local MainSection = MainTab:CreateSection("Main")
local AutoFarmSection = AutoFarmTab:CreateSection("AutoFarm")
local MiscSection = MiscTab:CreateSection("Misc")

local Toggle = AutoFarmTab:CreateToggle({
    Name = "Auto Buy",
    CurrentValue = false,
    Flag = "Toggle1",     -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local function executeRemoteServer(args, event)
            event:FireServer(table.unpack(args))
        end

        local scripts = {
            {
                args = {
                    [1] = true,
                    [2] = "PurchaseStation",
                    [3] = 1,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillinw.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "PurchaseStation",
                    [3] = 2,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "PurchaseStation",
                    [3] = 3,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "PurchaseStation",
                    [3] = 4,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "PurchaseStation",
                    [3] = 5,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "PurchaseStation",
                    [3] = 6,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "PurchaseStation",
                    [3] = 7,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "PurchaseStation",
                    [3] = 8,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "PurchaseStation",
                    [3] = 9,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "U100",
                    [3] = 1,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "U100",
                    [3] = 2,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "U100",
                    [3] = 3,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "U100",
                    [3] = 4,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "U100",
                    [3] = 5,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "U100",
                    [3] = 6,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "U100",
                    [3] = 7,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "U100",
                    [3] = 8,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            },
            {
                args = {
                    [1] = true,
                    [2] = "U100",
                    [3] = 9,
                    [4] = "Earth"
                },
                event = workspace.PlayerManagement.ChaseisChillin2.LocalRemote
            }
        }

        -- Define the repeat count and delay between executions
        local repeatCount = 1000000
        local delayBetweenExecutions = 0.005

        -- Function to execute the scripts
        local function executeScripts()
            for i = 1, repeatCount do
                for _, scriptData in ipairs(scripts) do
                    executeRemoteServer(scriptData.args, scriptData.event)
                    wait(delayBetweenExecutions)
                end
            end
        end

        -- Call the function to execute the scripts
        executeScripts()
    end
})

local Toggle = AutoFarmTab:CreateToggle({
    Name = "Auto Work",
    CurrentValue = false,
    Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local function executeRemoteServer(args)
            workspace.PlayerManagement.AnyLilSus2004.LocalRemote:FireServer(unpack(args))
        end

        local scripts = {
            {
                [3] = "1",
            },
            {
                [3] = "2",
            },
            {
                [3] = "3",
            },
            {
                [3] = "4",
            },
            {
                [3] = "5",
            },
            {
                [3] = "6",
            },
            {
                [3] = "7",
            },
            {
                [3] = "8",
            },
            {
                [3] = "9",
            }
        }

        local repeatCount = 1000000
        local delayBetweenExecutions = 0.0005

        for i = 1, repeatCount do
            for _, scriptArgs in ipairs(scripts) do
                local args = {
                    [1] = true,
                    [2] = "workBut",
                    [3] = scriptArgs[3],
                    [4] = "Earth"
                }

                executeRemoteServer(args)
                wait(delayBetweenExecutions)
            end
        end

        -- define a boolean variable
        local is_true = true

        -- use if-else statement to check boolean value
        if is_true then
            print("This is true")
        else
            print("This is false")
        end

        -- use and, or operators to combine boolean values
        local a = true
        local b = false

        if a and b then
            print("a and b is true")
        elseif a or b then
            print("a or b is true")
        else
            print("a and b is false")
        end
    end
})

local AutoRebirthToggle = AutoFarmTab:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local scripts = {
            {
                args = {
                    [1] = true,
                    [2] = "rebirth",
                    [3] = "Earth"
                },
                event = game:GetService("ReplicatedStorage")._RemoteEvents._ControlEvent
            }
        }

        -- Define the repeat count and delay between executions
        local repeatCount = 1000000
        local delayBetweenExecutions = 0.0005

        -- Function to execute the scripts
        local function executeScripts()
            for i = 1, repeatCount do
                for _, scriptData in ipairs(scripts) do
                    scriptData.event:FireServer(unpack(scriptData.args))
                    wait(delayBetweenExecutions)
                end
            end
        end

        -- Call the function to execute the scripts
        executeScripts()
    end
})
