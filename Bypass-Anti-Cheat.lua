local RS = game:GetService("ReplicatedStorage")

if not game:IsLoaded() then game.Loaded:Wait() end

local function deepClean(t, depth)
    if type(t) ~= "table" or (depth or 0) > 3 then return end
    rawset(t, "Build", 0)
    rawset(t, "Infrac", 0)
    rawset(t, "Tamper", false)
    rawset(t, "Cheat", false)
    rawset(t, "TamperDetected", false)
    rawset(t, "CheatCheckResult", true)
    rawset(t, "Validation", true)
    if rawget(t, "Ext") == nil then rawset(t, "Ext", "") end
    local e = rawget(t, "Extra")
    if type(e) == "table" then
        for k in pairs(e) do e[k] = nil end
    else
        rawset(t, "Extra", {})
    end
    for _, v in pairs(t) do
        if type(v) == "table" then
            deepClean(v, (depth or 0) + 1)
        end
    end
end

pcall(function()
    if type(bit32) ~= "table" then return end
    if setreadonly then pcall(setreadonly, bit32, false) end
    if make_writeable then pcall(make_writeable, bit32) end
    local oldBor = bit32.bor
    local function silentBor(a, b, ...)
        if type(a) == "number" and type(b) == "number" and b > 0 and b <= 65536 and a >= 0 and a < 65536 then
            if b == 1 or b == 2 or b == 4 or b == 8 or b == 16 or b == 32 or b == 64 or b == 128
                or b == 256 or b == 512 or b == 1024 or b == 2048 or b == 4096 or b == 8192
                or b == 16384 or b == 32768 then
                return a
            end
        end
        return oldBor(a, b, ...)
    end
    if type(hookfunction) == "function" then
        pcall(hookfunction, oldBor, newcclosure(silentBor))
    end
    bit32.bor = newcclosure(silentBor)
end)

local Core = RS:FindFirstChild("Core")
local System = Core and Core:FindFirstChild("System")
local CheatCheckMod = System and System:FindFirstChild("CheatCheck")
if CheatCheckMod then
    local ok, proxy = pcall(require, CheatCheckMod)
    if ok and type(proxy) == "table" then
        local mt = getmetatable(proxy)
        local config = type(mt) == "table" and rawget(mt, "__index")
        if type(config) ~= "table" then
            pcall(function()
                for _, obj in getgc(false) do
                    if type(obj) == "table" and (rawget(obj, "Prefix") == "_SW"
                        or (type(rawget(obj, "Scan")) == "function" and type(rawget(obj, "Stamp")) == "function")) then
                        config = obj
                        break
                    end
                end
            end)
        end
        if type(config) == "table" then
            local function sr(t, k, v) pcall(rawset, t, k, v) end
            sr(config, "Scan", function() return {} end)
            sr(config, "Run", function() end)
            sr(config, "ProbeScan", function() end)
            sr(config, "RunExtension", function() end)
            sr(config, "Flag", function() end)
            sr(config, "Stamp", function(s)
                if type(s) ~= "table" then s = {} end
                s.Build = 0
                s.Ext = ""
                s.Extra = {}
                return s
            end)
            sr(config, "Decode", function() return {} end)
            sr(config, "Runs", function() return 0 end)
            if type(rawget(config, "Foreign")) == "function" then
                sr(config, "Foreign", function() return false end)
            end
            if type(rawget(config, "Planted")) == "function" then
                sr(config, "Planted", function() return false end)
            end
        end
    end
end

local gameMt = getrawmetatable(game)
if gameMt then
    local old = gameMt.__namecall
    setreadonly(gameMt, false)
    gameMt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if not checkcaller() and (method == "FireServer" or method == "InvokeServer") then
            local name = tostring(self.Name or "")
            local isHex = #name == 8 and name:match("^%x+$") ~= nil
            if isHex or name == "DeltaAward" or name == "PartyRemote" or name == "DataRemote" or name == "NetRelay" then
                local args = {...}

                if isHex and #args >= 4 and tostring(args[3]) == "111" then
                    local st = tostring(args[4])
                    if st ~= "00" and st ~= "0" then
                        return
                    end
                    args[4] = "00"
                    return old(self, table.unpack(args))
                end

                if name == "DeltaAward" or name == "PartyRemote" or name == "DataRemote" then
                    for i = 1, #args do
                        if type(args[i]) == "table" then
                            deepClean(args[i])
                        end
                    end
                    return old(self, table.unpack(args))
                end
            end
        end
        return old(self, ...)
    end)
    setreadonly(gameMt, true)
end

task.spawn(function()
    while task.wait(7) do
        pcall(function()
            local n = 0
            for _, obj in getgc(false) do
                n = n + 1
                if n > 5000 then break end
                if type(obj) == "table" and rawget(obj, "Build") ~= nil then
                    deepClean(obj)
                end
            end
        end)
    end
end)
