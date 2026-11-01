local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

if not game:IsLoaded() then 
    game.Loaded:Wait() 
end

local function TriggerPanicShutdown(reason)
    pcall(function()
        Players.LocalPlayer:Kick(tostring(reason or "Safe Kick Activated"))
    end)
    task.wait(0.05)
    pcall(function()
        game:Shutdown()
    end)
end

task.spawn(function()
    local rawDebugInfo = debug.info
    local secureDebugInfo = function(f, mask, ...)
        if not checkcaller() and mask == "s" and type(f) == "function" then
            local src = rawDebugInfo(f, "s")
            if src == nil or src == "" or string.find(src, "ThirdParty") or string.find(src, "Exploit") then
                local CC = ReplicatedStorage:FindFirstChild("Core")
                if CC then
                    CC = CC:FindFirstChild("System")
                    if CC then
                        CC = CC:FindFirstChild("CheatCheck")
                    end
                end
                if CC then
                    return CC:GetFullName()
                end
            end
        end
        return rawDebugInfo(f, mask, ...)
    end
    rawset(debug, "info", (newcclosure and newcclosure(secureDebugInfo)) or secureDebugInfo)
end)

task.spawn(function()
    local rawBor = bit32.bor
    local secureBor = function(a, b, ...)
        if not checkcaller() then
            local callingScript = getfenv(2).script
            if callingScript and (callingScript.Name == "CheatCheck" or string.find(callingScript.Name, "nufp")) then
                if tonumber(a) and tonumber(a) > 0 or tonumber(b) and tonumber(b) > 0 then
                    task.spawn(TriggerPanicShutdown, "Anti-Cheat Flag Intercepted")
                end
                return 0
            end
        end
        return rawBor(a, b, ...)
    end
    rawset(bit32, "bor", (newcclosure and newcclosure(secureBor)) or secureBor)
end)

task.spawn(function()
    local gameMeta = getrawmetatable(game)
    if gameMeta then
        local rawIndex = gameMeta.__index
        local rawNamecall = gameMeta.__namecall
        
        setreadonly(gameMeta, false)
        
        gameMeta.__index = newcclosure(function(self, key)
            if not checkcaller() and type(self) == "Instance" and self:IsA("ValueBase") then
                if self:HasTag("StatValue") or string.find(self.Name, "HP") or string.find(self.Name, "MaxHP") then
                    local originalTable = ReplicatedStorage:FindFirstChild("Core")
                    if originalTable then
                        originalTable = originalTable:FindFirstChild("Data")
                        if originalTable then
                            local ok, Party = pcall(require, originalTable.Party)
                            if ok and Party and type(Party.Set) == "function" then
                                local baseData = Party.Set(1)
                                if baseData and baseData.Templates and baseData.Templates[self.Parent.Name] then
                                    return baseData.Templates[self.Parent.Name][self.Name] or rawIndex(self, key)
                                end
                            end
                        end
                    end
                end
            end
            return rawIndex(self, key)
        end)
        
        gameMeta.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if not checkcaller() and (method == "FireServer" or method == "InvokeServer") then
                local remoteName = tostring(self.Name)
                if remoteName == "b5e021a1" or string.find(remoteName, "Win") or string.find(remoteName, "Sync") or string.find(remoteName, "DataRemote") or string.find(remoteName, "PartyRemote") then
                    local args = {...}
                    if type(args) == "table" then
                        local build = rawget(args, "Build") or 0
                        local infrac = rawget(args, "Infrac") or 0
                        local cheat = rawget(args, "Cheat") or false
                        local tamper = rawget(args, "Tamper") or false
                        
                        if (type(build) == "number" and build > 0) or (type(infrac) == "number" and infrac > 0) or cheat == true or tamper == true then
                            task.spawn(TriggerPanicShutdown, "Network Violation Triggered")
                        end
                        
                        if rawget(args, "Build") then rawset(args, "Build", 0) end
                        if rawget(args, "Extra") then rawset(args, "Extra", {}) end
                        if rawget(args, "Infrac") then rawset(args, "Infrac", 0) end
                        if rawget(args, "Cheat") then rawset(args, "Cheat", false) end
                        if rawget(args, "Tamper") then rawset(args, "Tamper", false) end
                        if rawget(args, "Validation") then rawset(args, "Validation", true) end
                    end
                    if remoteName == "b5e021a1" then
                        local fakePass, fakeData = pcall(function()
                            return {
                                ["Build"] = 0,
                                ["Extra"] = {},
                                ["Status"] = "Clean",
                                ["Integrity"] = true
                            }
                        end)
                        if fakePass then
                            return rawNamecall(self, fakeData)
                        end
                    end
                    return rawNamecall(self, table.unpack(args))
                end
            end
            return rawNamecall(self, ...)
        end)
        
        setreadonly(gameMeta, true)
    end
end)

task.spawn(function()
    while task.wait(0.05) do
        pcall(function()
            for _, obj in pairs(getgc(true)) do
                if type(obj) == "table" then
                    local build = rawget(obj, "Build")
                    local extra = rawget(obj, "Extra")
                    local infrac = rawget(obj, "Infrac")
                    
                    if (type(build) == "number" and build > 0) or (type(infrac) == "number" and infrac > 0) or (type(extra) == "table" and #extra > 0) then
                        TriggerPanicShutdown("Memory Flag Inconsistency")
                        break
                    end
                end
            end
        end)
    end
end)
