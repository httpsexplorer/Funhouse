local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local initialPlaceVersion = game.PlaceVersion

local function scanSecurityAnomalies()
    local success, CheatCheck = pcall(function()
        return require(ReplicatedStorage:WaitForChild("Core", 2):WaitForChild("System", 2):WaitForChild("CheatCheck", 2))
    end)
    
    if not success or type(CheatCheck) ~= "table" then
        LocalPlayer:Kick("Security Module Corrupted Or Missing")
        return false
    end

    local criticalMethods = { "Scan", "Runs", "Run", "Stamp" }
    for _, method in pairs(criticalMethods) do
        if type(CheatCheck[method]) ~= "function" then
            LocalPlayer:Kick("Security System Layout Updated")
            return false
        end
    end

    if game.PlaceVersion ~= initialPlaceVersion then
        LocalPlayer:Kick("Server Updated In Realtime")
        return false
    end

    return true
end

local function cleanCheatCheck()
    local success, CheatCheck = pcall(function()
        return require(ReplicatedStorage:WaitForChild("Core", 2):WaitForChild("System", 2):WaitForChild("CheatCheck", 2))
    end)
    if success and type(CheatCheck) == "table" then
        if CheatCheck.Scan ~= nil then
            CheatCheck.Scan = function() return {} end
        end
        if CheatCheck.Runs ~= nil then
            CheatCheck.Runs = function() return 0 end
        end
        if CheatCheck.Run ~= nil then
            CheatCheck.Run = function() end
        end
        if CheatCheck.Stamp ~= nil then
            CheatCheck.Stamp = function(p102)
                if type(p102) == "table" then
                    p102.Build = 0
                    p102.Ext = ""
                    p102.Extra = {}
                    return p102
                end
                return { Build = 0, Ext = "", Extra = {} }
            end
        end
    end
end

local function cleanInterfaceLoops()
    local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if PlayerGui then
        for _, gui in pairs(PlayerGui:GetChildren()) do
            if gui:IsA("ScreenGui") and #gui.Name == 8 then
                for _, obj in pairs(gui:GetChildren()) do
                    if obj:IsA("LocalScript") and #obj.Name == 8 then
                        obj.Disabled = true
                    end
                end
            end
        end
    end
end

local function cleanNetworkPackets()
    local success, oldNamecall
    success, oldNamecall = pcall(function()
        return hookmetamethod(game, "__namecall", function(self, ...)
            local method = getnamecallmethod()
            local args = {...}
            if method == "FireServer" and #args >= 2 and type(args) == "string" and type(args) == "string" then
                if #args == 8 and #args == 8 then
                    args = "110"
                    return oldNamecall(self, table.unpack(args))
                end
            end
            if self.Name == "DeltaAward" and method == "FireServer" and type(args) == "table" then
                local packet = args
                if packet.Build or packet.Lost then
                    packet.Build = 0
                    packet.Hits = 0
                    packet.DamageTaken = 0
                    packet.Downs = 0
                    packet.Lost = nil
                end
                return oldNamecall(self, packet)
            end
            return oldNamecall(self, ...)
        end)
    end)
end

local function cleanDebugEnvironment()
    if debug and debug.info then
        pcall(function()
            local originalDebugInfo = debug.info
            hookfunction(debug.info, function(func, layer)
                if not checkcaller() then
                    local success, result = pcall(originalDebugInfo, func, layer)
                    if success and type(result) == "string" and not result:find("Shared") and not result:find("Client") then
                        local battleClient = game:GetService("StarterPlayer"):FindFirstChild("StarterPlayerScripts")
                        if battleClient then
                            battleClient = battleClient:FindFirstChild("BattleClient")
                        end
                        if battleClient then
                            return battleClient:GetFullName()
                        end
                    end
                end
                return originalDebugInfo(func, layer)
            end)
        end)
    end
end

if scanSecurityAnomalies() then
    pcall(cleanNetworkPackets)
    pcall(cleanDebugEnvironment)

    task.spawn(function()
        while task.wait(1) do
            if scanSecurityAnomalies() then
                pcall(cleanCheatCheck)
                pcall(cleanInterfaceLoops)
            else
                break
            end
        end
    end)
end
