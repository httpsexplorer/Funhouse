local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local IsMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
if not WindUI then return end

WindUI:Notify({
    Title = "Deltarune | Pink's",
    Content = "It might take a while or you might experience some lag loading, so please be patient, and if it doesn't load or something else happens, please let us know.",
    Duration = 8,
    Icon = "info",
})

local Green  = Color3.fromHex("#10C550")
local Red    = Color3.fromHex("#EF4F1D")
local Orange = Color3.fromHex("#F97316")

local PinksState = {
    TPInfinite = false,
    HPInfinite = false,
    GodMode = false,
    FreeSoulToggle = false,
    DeleteStinky = false,
    VisualHitbox = false,
    GersonShield = false,
    GersonRudeTiming = false,
    GersonAutoTiming = false,
    FreeActs = false,
    ProceedSnowgrave = false,
    FreeSpells = false,
    AssignActor = "Kris",
    AssignSpell = "RudeBuster",
    AssignAct = "Check",
    _TPAmount = 10,
    _HPAmount = 0,
    UIColor = "Dark",
}

local ConfigFolder = "DeltarunePinks/Configs"
local ConfigNameValue = "Default"
local ConfigFileList = { "Default" }

local function EnsureConfigFolder()
    if not makefolder then
        return
    end
    pcall(function()
        makefolder("DeltarunePinks")
    end)
    pcall(function()
        makefolder(ConfigFolder)
    end)
end

local function ConfigPath(name)
    return ConfigFolder .. "/" .. tostring(name or "Default") .. ".json"
end

local function EncodeConfig(data)
    local parts = {}
    for k, v in pairs(data) do
        local val
        if type(v) == "boolean" then
            val = v and "true" or "false"
        elseif type(v) == "number" then
            val = tostring(v)
        else
            val = '"' .. tostring(v):gsub('"', "") .. '"'
        end
        table.insert(parts, '"' .. tostring(k) .. '":' .. val)
    end
    return "{" .. table.concat(parts, ",") .. "}"
end

local function DecodeConfig(str)
    local result = {}
    if type(str) ~= "string" then
        return result
    end
    for key, val in string.gmatch(str, '"([^"]+)":%s*([^,}]+)') do
        val = val:gsub("%s+", "")
        if val == "true" then
            result[key] = true
        elseif val == "false" then
            result[key] = false
        elseif tonumber(val) then
            result[key] = tonumber(val)
        else
            result[key] = val:gsub('^"', ""):gsub('"$', "")
        end
    end
    return result
end

local function RefreshConfigList()
    EnsureConfigFolder()
    local list = { "Default" }
    pcall(function()
        if listfiles then
            for _, file in pairs(listfiles(ConfigFolder)) do
                local name = tostring(file):match("([^/\\]+)%.json$")
                if name and name ~= "Default" then
                    table.insert(list, name)
                end
            end
        end
    end)
    ConfigFileList = list
    return list
end

local function SnapshotConfig()
    return {
        TPInfinite = PinksState.TPInfinite,
        HPInfinite = PinksState.HPInfinite,
        GodMode = PinksState.GodMode,
        FreeSoulToggle = PinksState.FreeSoulToggle,
        DeleteStinky = PinksState.DeleteStinky,
        VisualHitbox = PinksState.VisualHitbox,
        GersonShield = PinksState.GersonShield,
        GersonRudeTiming = PinksState.GersonRudeTiming,
        GersonAutoTiming = PinksState.GersonAutoTiming,
        FreeActs = PinksState.FreeActs,
        ProceedSnowgrave = PinksState.ProceedSnowgrave,
        FreeSpells = PinksState.FreeSpells,
        AssignActor = PinksState.AssignActor or "Kris",
        AssignSpell = PinksState.AssignSpell or "RudeBuster",
        AssignAct = PinksState.AssignAct or "Check",
        _TPAmount = PinksState._TPAmount or 10,
        _HPAmount = PinksState._HPAmount or 0,
        UIColor = PinksState.UIColor or "Dark",
    }
end

local ApplyConfig
local ApplyProceedSnowgrave
local ApplyFreeSpells
local ApplyFreeActs

local function SaveConfig(name)
    name = tostring(name or ConfigNameValue or "Default")
    if name == "" then
        name = "Default"
    end
    EnsureConfigFolder()
    local data = SnapshotConfig()
    if not writefile then
        RefreshConfigList()
        return false
    end
    local ok = pcall(function()
        writefile(ConfigPath(name), EncodeConfig(data))
    end)
    RefreshConfigList()
    return ok
end

local function LoadConfig(name)
    name = tostring(name or ConfigNameValue or "Default")
    local path = ConfigPath(name)
    local raw
    local ok = pcall(function()
        if isfile and isfile(path) and readfile then
            raw = readfile(path)
        elseif readfile then
            raw = readfile(path)
        end
    end)
    if not ok or not raw then
        return false
    end
    local data = DecodeConfig(raw)
    ApplyConfig(data)
    return true
end

local function DeleteConfig(name)
    name = tostring(name or ConfigNameValue or "Default")
    local path = ConfigPath(name)
    if not delfile then
        RefreshConfigList()
        return false
    end
    local exists = true
    if isfile then
        local okIsFile, result = pcall(isfile, path)
        exists = okIsFile and result == true
    end
    if not exists then
        RefreshConfigList()
        return false
    end
    local ok = pcall(function()
        delfile(path)
    end)
    RefreshConfigList()
    return ok
end

local Cache = {
    TensionBars = {},
    TensionTables = {},
    SoulTables = {},
    HPTables = {},
    BattleTables = {},
    LastScan = 0,
}

local function GetTensionMax()
    local max = 100
    pcall(function()
        local Core = ReplicatedStorage:FindFirstChild("Core")
        if not Core then return end
        local ok, Config = pcall(require, Core.Data.Config)
        if ok and Config and Config.Tension and type(Config.Tension.Max) == "number" then
            max = Config.Tension.Max
        end
    end)
    return max
end

local function GetConfig()
    local ok, cfg = pcall(function()
        return require(ReplicatedStorage.Core.Data.Config)
    end)
    return ok and cfg or nil
end

local function RescanCache(force)
    local now = os.clock()
    if not force and now - Cache.LastScan < 2 then
        return
    end
    Cache.LastScan = now

    local tensionBars = {}
    local tensionTables = {}
    local soulTables = {}
    local hpTables = {}
    local battleTables = {}

    pcall(function()
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "table" then
                if rawget(v, "Apparent") ~= nil and rawget(v, "Current") ~= nil then
                    table.insert(tensionBars, v)
                end
                if type(rawget(v, "Tension")) == "number" and rawget(v, "TensionMax") ~= nil then
                    table.insert(tensionTables, v)
                end
                if rawget(v, "Invuln") ~= nil and rawget(v, "HP") ~= nil and rawget(v, "MaxHP") ~= nil then
                    table.insert(soulTables, v)
                end
                if rawget(v, "HP") ~= nil and rawget(v, "MaxHP") ~= nil then
                    table.insert(hpTables, v)
                end
                if typeof(v.ClearBullets) == "function" or typeof(v.Bullets) == "table" then
                    table.insert(battleTables, v)
                end
            end
        end
    end)

    Cache.TensionBars = tensionBars
    Cache.TensionTables = tensionTables
    Cache.SoulTables = soulTables
    Cache.HPTables = hpTables
    Cache.BattleTables = battleTables
end

local function ForceTP(amount)
    local max = GetTensionMax()
    local value = math.clamp(tonumber(amount) or max, 0, max)
    RescanCache(false)
    pcall(function()
        for _, v in pairs(Cache.TensionBars) do
            rawset(v, "Apparent", value)
            rawset(v, "Current", value)
        end
        for _, v in pairs(Cache.TensionTables) do
            local tmax = rawget(v, "TensionMax") or max
            rawset(v, "Tension", math.clamp(value, 0, tmax))
        end
    end)
end

local function ClearBulletsNow()
    RescanCache(false)
    pcall(function()
        for _, v in pairs(Cache.BattleTables) do
            if typeof(v.ClearBullets) == "function" then
                pcall(function()
                    v:ClearBullets()
                end)
            end
            if typeof(v.Bullets) == "table" then
                for i = #v.Bullets, 1, -1 do
                    local b = v.Bullets[i]
                    if b and typeof(b.Destroy) == "function" then
                        pcall(function()
                            b:Destroy()
                        end)
                    end
                    table.remove(v.Bullets, i)
                end
            end
        end

        for _, v in pairs(getgc(true)) do
            if typeof(v) ~= "table" then
            else
                if typeof(v.Bombs) == "table" then
                    if typeof(v.DestroyBomb) == "function" then
                        for i = #v.Bombs, 1, -1 do
                            local bomb = v.Bombs[i]
                            pcall(function()
                                v:DestroyBomb(bomb)
                            end)
                            table.remove(v.Bombs, i)
                        end
                    else
                        for i = #v.Bombs, 1, -1 do
                            local bomb = v.Bombs[i]
                            if type(bomb) == "table" then
                                if bomb.Bullet and typeof(bomb.Bullet.Destroy) == "function" then
                                    pcall(function()
                                        bomb.Bullet:Destroy()
                                    end)
                                end
                                for _, key in pairs({ "BandH", "BandV", "TeleRing", "TeleDisc", "Body", "Fuse" }) do
                                    local part = bomb[key]
                                    if part and typeof(part.Destroy) == "function" then
                                        pcall(function()
                                            part:Destroy()
                                        end)
                                    end
                                end
                            end
                            table.remove(v.Bombs, i)
                        end
                    end
                end

                if typeof(v.Explosions) == "table" then
                    for i = #v.Explosions, 1, -1 do
                        local exp = v.Explosions[i]
                        if type(exp) == "table" and exp.Bullet and typeof(exp.Bullet.Destroy) == "function" then
                            pcall(function()
                                exp.Bullet:Destroy()
                            end)
                        end
                        table.remove(v.Explosions, i)
                    end
                end
            end
        end
    end)
end

local function InstantWinNow()
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "table" then
                if type(rawget(v, "EnemyHP")) == "number" then
                    rawset(v, "EnemyHP", 0)
                end
                local enemies = rawget(v, "Enemies")
                if type(enemies) == "table" then
                    for _, enemy in pairs(enemies) do
                        if type(enemy) == "table" and rawget(enemy, "HP") ~= nil then
                            rawset(enemy, "HP", 0)
                            if rawget(enemy, "Alive") ~= nil then
                                rawset(enemy, "Alive", false)
                            end
                            if rawget(enemy, "Gone") ~= nil then
                                rawset(enemy, "Gone", true)
                            end
                        end
                    end
                end
                if typeof(v.ClearBullets) == "function" then
                    pcall(function()
                        if typeof(v.StopWaves) == "function" then
                            v:StopWaves()
                        end
                        v:ClearBullets()
                    end)
                end
                if typeof(v.EnterVictory) == "function" then
                    pcall(function()
                        v:EnterVictory()
                    end)
                elseif typeof(v.EndEnemyTurn) == "function" and rawget(v, "Roster") ~= nil then
                    pcall(function()
                        v:EndEnemyTurn()
                    end)
                end
            end
        end
    end)
end

local function SkipEnemyTurnNow()
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "table" then
                if typeof(v.StopWaves) == "function" and typeof(v.ClearBullets) == "function" then
                    pcall(function()
                        v:StopWaves()
                        v:ClearBullets()
                    end)
                end
                if typeof(v.Bullets) == "table" then
                    for i = #v.Bullets, 1, -1 do
                        local b = v.Bullets[i]
                        if b and typeof(b.Destroy) == "function" then
                            pcall(function()
                                b:Destroy()
                            end)
                        end
                        table.remove(v.Bullets, i)
                    end
                end
                if typeof(v.EndEnemyTurn) == "function" and rawget(v, "Roster") ~= nil then
                    pcall(function()
                        v:EndEnemyTurn()
                    end)
                end
            end
        end
    end)
end

local function MaxMercyNow()
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "table" then
                if type(rawget(v, "Mercy")) == "number" then
                    local max = 100
                    local def = rawget(v, "Def")
                    if type(def) == "table" and type(def.MercyMax) == "number" then
                        max = def.MercyMax
                    elseif type(rawget(v, "MercyMax")) == "number" then
                        max = v.MercyMax
                    end
                    rawset(v, "Mercy", max)
                end

                local enemyDef = rawget(v, "Enemy")
                if type(enemyDef) == "table" then
                    if type(rawget(enemyDef, "Mercy")) == "number" then
                        local max = 100
                        if type(rawget(enemyDef, "MercyMax")) == "number" then
                            max = enemyDef.MercyMax
                        end
                        rawset(enemyDef, "Mercy", max)
                    elseif type(rawget(enemyDef, "MercyMax")) == "number" then
                        rawset(enemyDef, "Mercy", enemyDef.MercyMax)
                    end
                end

                local enemies = rawget(v, "Enemies")
                if type(enemies) == "table" then
                    for _, enemy in pairs(enemies) do
                        if type(enemy) == "table" then
                            local max = 100
                            local def = rawget(enemy, "Def")
                            if type(def) == "table" and type(def.MercyMax) == "number" then
                                max = def.MercyMax
                            elseif type(rawget(enemy, "MercyMax")) == "number" then
                                max = enemy.MercyMax
                            end
                            if rawget(enemy, "Mercy") ~= nil or type(def) == "table" then
                                rawset(enemy, "Mercy", max)
                            end
                            pcall(function()
                                enemy.Mercy = max
                            end)
                        end
                    end
                end

                if typeof(v.AddMercy) == "function" then
                    local list = rawget(v, "Enemies")
                    if type(list) == "table" then
                        for _, enemy in pairs(list) do
                            if type(enemy) == "table" then
                                pcall(function()
                                    v:AddMercy(enemy, 999)
                                end)
                            end
                        end
                    end
                    if type(rawget(v, "Enemy")) == "table" then
                        pcall(function()
                            v:AddMercy(v.Enemy, 999)
                        end)
                    end
                end

                if typeof(v.RefreshUi) == "function" and (rawget(v, "Mercy") ~= nil or rawget(v, "Enemies") ~= nil) then
                    pcall(function()
                        v:RefreshUi()
                    end)
                end
            end
        end
    end)
end

local function ApplyGodMode(on)
    RescanCache(true)
    pcall(function()
        for _, v in pairs(Cache.SoulTables) do
            if on then
                rawset(v, "Invuln", 999)
                if rawget(v, "MaxHP") ~= nil then
                    rawset(v, "HP", v.MaxHP)
                end
                if rawget(v, "GrazeCount") ~= nil then
                    rawset(v, "GrazeCount", 9999)
                end
            else
                if type(rawget(v, "Invuln")) == "number" then
                    rawset(v, "Invuln", 0)
                end
            end
        end
        if on then
            for _, v in pairs(Cache.HPTables) do
                if rawget(v, "MaxHP") ~= nil then
                    rawset(v, "HP", v.MaxHP)
                end
            end
        end
    end)
end

local FreeSoulConfigOriginalClamp = nil
local FreeSoulConfigCaptured = false

local function ApplyFreeSoul(on)
    RescanCache(true)

    pcall(function()
        local Config = GetConfig()
        if Config and Config.Soul then
            if not FreeSoulConfigCaptured then
                FreeSoulConfigOriginalClamp = Config.Soul.ClampToBattleArea
                FreeSoulConfigCaptured = true
            end

            Config.Soul.ClampToBattleArea = on and false or FreeSoulConfigOriginalClamp
        end
    end)

    pcall(function()
        for _, v in pairs(Cache.SoulTables) do
            if on then
                if rawget(v, "Frozen") ~= nil then
                    rawset(v, "Frozen", false)
                end
                if rawget(v, "FreeRoam") ~= nil then
                    rawset(v, "FreeRoam", true)
                end
                if rawget(v, "Locked") ~= nil then
                    rawset(v, "Locked", false)
                end
                if type(rawget(v, "Solids")) == "table" then
                    table.clear(v.Solids)
                end

                -- The decompile registers Default as the base Soul mode and
                -- Purple as the only additional mode found. Gerson's green
                -- heart is a skin, not a Soul mode, so clear both safely.
                if type(v.SetMode) == "function" then
                    pcall(function()
                        v:SetMode("Default")
                    end)
                else
                    rawset(v, "ModeName", "Default")
                end
                if type(v.SetSkin) == "function" then
                    pcall(function()
                        v:SetSkin(nil)
                    end)
                else
                    rawset(v, "Skin", nil)
                end
            else
                if rawget(v, "FreeRoam") ~= nil then
                    rawset(v, "FreeRoam", false)
                end
                if rawget(v, "Locked") ~= nil then
                    rawset(v, "Locked", false)
                end
            end
        end
    end)
end

local function SetVisualHitboxes(on)
    pcall(function()
        local Config = GetConfig()
        if Config and Config.Debug then
            Config.Debug.ShowHitboxes = on and true or false
        end
    end)
end

ApplyConfig = function(data)
    if type(data) ~= "table" then
        return
    end

    PinksState.TPInfinite = data.TPInfinite == true
    PinksState.HPInfinite = data.HPInfinite == true
    PinksState.GodMode = data.GodMode == true
    PinksState.FreeSoulToggle = data.FreeSoulToggle == true
    PinksState.DeleteStinky = data.DeleteStinky == true
    PinksState.VisualHitbox = data.VisualHitbox == true
    PinksState.GersonShield = data.GersonShield == true
    PinksState.GersonRudeTiming = data.GersonRudeTiming == true
    PinksState.GersonAutoTiming = data.GersonAutoTiming == true
    PinksState.FreeActs = data.FreeActs == true
    PinksState.ProceedSnowgrave = data.ProceedSnowgrave == true
    PinksState.FreeSpells = data.FreeSpells == true
    PinksState.AssignActor = data.AssignActor or "Kris"
    PinksState.AssignSpell = data.AssignSpell or "RudeBuster"
    PinksState.AssignAct = data.AssignAct or "Check"
    PinksState._TPAmount = tonumber(data._TPAmount) or 10
    PinksState._HPAmount = tonumber(data._HPAmount) or 0
    PinksState.UIColor = data.UIColor or "Dark"

    ApplyGodMode(PinksState.GodMode)
    ApplyFreeSoul(PinksState.FreeSoulToggle)
    SetVisualHitboxes(PinksState.VisualHitbox)
    if ApplyProceedSnowgrave then
        ApplyProceedSnowgrave(PinksState.ProceedSnowgrave)
    end
    if ApplyFreeSpells then
        ApplyFreeSpells(PinksState.FreeSpells)
    end
    if ApplyFreeActs then
        ApplyFreeActs(PinksState.FreeActs)
    end

    if PinksState.TPInfinite then
        ForceTP(GetTensionMax())
    end

    pcall(function()
        WindUI:SetTheme(PinksState.UIColor)
    end)

    WindUI:Notify({
        Title = "Config",
        Content = "Loaded preset toggles.",
        Duration = 3,
        Icon = "info",
    })
end

local function PartyHasNoelle()
    local found = false
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "table" and type(rawget(v, "Roster")) == "table" then
                local members = v.Roster.Members
                if type(members) == "table" then
                    for _, m in pairs(members) do
                        if type(m) == "table" then
                            local key = rawget(m, "Key") or rawget(m, "Name")
                            if key == "Noelle" then
                                found = true
                                return
                            end
                        end
                    end
                end
            end
        end
    end)
    return found
end

ApplyProceedSnowgrave = function(on)
    pcall(function()
        local Core = ReplicatedStorage:FindFirstChild("Core")
        if not Core then
            return
        end
        local ok, Spells = pcall(require, Core.Data.Spells)
        if not ok or type(Spells) ~= "table" then
            return
        end
        local loadouts = Spells.Loadouts
        if type(loadouts) ~= "table" or type(loadouts.Noelle) ~= "table" then
            return
        end
        local list = loadouts.Noelle.Default
        if type(list) ~= "table" then
            loadouts.Noelle.Default = { "HealPrayer", "SleepMist", "IceShock" }
            list = loadouts.Noelle.Default
        end
        local has = false
        for i, id in ipairs(list) do
            if id == "SnowGrave" then
                has = true
                if not on then
                    table.remove(list, i)
                end
                break
            end
        end
        if on and not has and PartyHasNoelle() then
            table.insert(list, "SnowGrave")
        end
        if type(Spells.Definitions) == "table" and type(Spells.Definitions.SnowGrave) == "table" then
            if on then
                Spells.Definitions.SnowGrave.MenuVisible = true
                Spells.Definitions.SnowGrave.Available = true
                Spells.Definitions.SnowGrave.Cost = 250
                if rawget(Spells.Definitions.SnowGrave, "AllAllies") ~= nil then
                    Spells.Definitions.SnowGrave.AllAllies = 250
                end
            end
        end
        if type(Spells.Overrides) == "table" then
            Spells.Overrides.SnowGrave = Spells.Overrides.SnowGrave or {}
            if on then
                Spells.Overrides.SnowGrave.Cost = 250
                Spells.Overrides.SnowGrave.MenuVisible = true
            else
                Spells.Overrides.SnowGrave.Cost = nil
            end
        end
    end)
end

-- The live Gerson shield/spear scene is exposed by GersonBody.Current.Scene.
-- Using that reference is much cheaper and more accurate than scanning all GC tables.
local GersonBodyModule = nil
local GersonRudeModule = nil
local ActsModule = nil

pcall(function()
    GersonBodyModule = require(ReplicatedStorage.Fights.Gerson.GersonBody)
end)
pcall(function()
    GersonRudeModule = require(ReplicatedStorage.Fights.Gerson.GersonRudeBuster)
end)
pcall(function()
    ActsModule = require(ReplicatedStorage.Core.Data.Acts)
end)

local BossCache = {
    Tenna = {},
    Last = 0,
}

local GersonSceneCache = {
    Scene = nil,
    LastFallbackScan = 0,
}

local ActRegistry = {
    Items = {},
    Options = { "Check" },
    Map = {},
    LastScan = 0,
}

local PendingActs = {}
local PendingActAccumulator = 0
local ActControllerCache = { Controller = nil, LastScan = 0 }
local FreeActCostPatched = {}
local FreeActLastScan = 0

local function RescanBossCache(force)
    local now = os.clock()
    if not force and now - BossCache.Last < 1.0 then
        return
    end
    BossCache.Last = now

    local tenna = {}

    pcall(function()
        if not getgc then
            return
        end
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "table" then
                if type(rawget(v, "Score")) == "number"
                    and type(rawget(v, "MaxScore")) == "number" then
                    table.insert(tenna, v)
                end
            end
        end
    end)

    BossCache.Tenna = tenna
end

local function GetGersonSpearScene(forceScan)
    local scene = GersonSceneCache.Scene
    if scene and type(rawget(scene, "Spears")) == "table" and rawget(scene, "Soul") ~= nil then
        return scene
    end

    local current = GersonBodyModule and GersonBodyModule.Current
    local direct = current and rawget(current, "Scene")
    if direct and type(rawget(direct, "Spears")) == "table" and rawget(direct, "Soul") ~= nil then
        GersonSceneCache.Scene = direct
        return direct
    end

    if not getgc then
        return nil
    end

    local now = os.clock()
    if not forceScan and now - GersonSceneCache.LastFallbackScan < 0.75 then
        return nil
    end
    GersonSceneCache.LastFallbackScan = now

    pcall(function()
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "table"
                and type(rawget(v, "Spears")) == "table"
                and rawget(v, "Soul") ~= nil
                and type(rawget(v, "Api")) == "table"
                and type(rawget(v, "SpawnShield")) == "function" then
                GersonSceneCache.Scene = v
                break
            end
        end
    end)

    return GersonSceneCache.Scene
end

local REAL_ACT_MODULE_NAMES = {
    "GersonFight",
    "TennaFight",
    "JevilFight",
    "KnightFight",
    "KingFight",
    "SpamtonFight",
    "TitanSpawnFight",
    "Berdly2Acts",
    "PinkFight",
}

local function IsActEntry(v)
    return type(v) == "table"
        and type(rawget(v, "Key")) == "string"
        and type(rawget(v, "Name")) == "string"
        and type(rawget(v, "Cost")) == "number"
        and rawget(v, "Actor") ~= nil
end

local function CollectActEntries(value, found, seenTables, seenEntries, depth)
    if type(value) ~= "table" or depth > 5 or seenTables[value] then
        return
    end
    seenTables[value] = true

    if IsActEntry(value) then
        if not seenEntries[value] then
            seenEntries[value] = true
            table.insert(found, {
                Key = rawget(value, "Key"),
                Name = rawget(value, "Name") or rawget(value, "Key"),
                Entry = value,
            })
        end
        return
    end

    local visited = 0
    for key, child in pairs(value) do
        -- Act tables are either directly under ActTable/BerdlyTable/etc. or
        -- reachable from the returned Fight config. Do not walk arbitrary
        -- Roblox Instances/userdata; only Lua tables are traversed.
        if type(child) == "table" then
            CollectActEntries(child, found, seenTables, seenEntries, depth + 1)
            visited += 1
            if visited >= 3000 then
                break
            end
        end
    end
end

local function LoadRealActModules()
    local results = {}
    local fights = ReplicatedStorage:FindFirstChild("Fights")
    if not fights then
        return results
    end

    for _, moduleName in ipairs(REAL_ACT_MODULE_NAMES) do
        local module = fights:FindFirstChild(moduleName, true)
        if module and module:IsA("ModuleScript") then
            local ok, result = pcall(require, module)
            if ok and type(result) == "table" then
                table.insert(results, result)
            end
        end
    end
    return results
end

local function ScanActRegistry(force)
    local now = os.clock()
    if not force and now - ActRegistry.LastScan < 2 then
        return ActRegistry.Options
    end
    ActRegistry.LastScan = now

    local found = {}
    local seenTables = {}
    local seenEntries = {}

    -- On refresh/add, read the game's real Act-producing Fight modules.
    -- This avoids guessing Act names and avoids a full getgc scan for the menu.
    local moduleResults = LoadRealActModules()
    for _, result in ipairs(moduleResults) do
        CollectActEntries(result, found, seenTables, seenEntries, 0)
    end

    table.sort(found, function(a, b)
        local an = tostring(a.Name)
        local bn = tostring(b.Name)
        if an == bn then
            return tostring(a.Key) < tostring(b.Key)
        end
        return an < bn
    end)

    local options = {}
    local map = {}
    for _, item in ipairs(found) do
        local display = item.Name
        local base = display
        local index = 2
        while map[display] do
            display = base .. " [" .. index .. "]"
            index += 1
        end
        map[display] = item
        table.insert(options, display)
    end

    if #options == 0 then
        options = { "Check" }
    end

    ActRegistry.Items = found
    ActRegistry.Options = options
    ActRegistry.Map = map
    return options
end

local function RefreshActDropdown(dropdown)
    ActRegistry.LastScan = 0
    ScanActRegistry(true)
    if dropdown then
        if type(dropdown.SetValues) == "function" then
            pcall(function()
                dropdown:SetValues(ActRegistry.Options)
            end)
        elseif type(dropdown.SetOptions) == "function" then
            pcall(function()
                dropdown:SetOptions(ActRegistry.Options)
            end)
        end
    end
    return ActRegistry.Options
end

local function CloneActEntry(entry, owner)
    local clone = table.clone(entry)
    local mt = getmetatable(entry)
    if mt then
        setmetatable(clone, mt)
    end
    clone.Owner = owner or entry.Owner or "Kris"
    clone._PinkInjectedAct = true
    return clone
end

local function FindActController(force)
    local cached = ActControllerCache.Controller
    if cached and type(cached) == "table" and type(rawget(cached, "ActTableFor")) == "function" then
        return cached
    end

    if not getgc then
        return nil
    end

    local now = os.clock()
    if not force and now - ActControllerCache.LastScan < 1.5 then
        return nil
    end
    ActControllerCache.LastScan = now

    local found = nil
    pcall(function()
        for _, controller in pairs(getgc(true)) do
            if type(controller) == "table"
                and type(rawget(controller, "ActTableFor")) == "function"
                and type(rawget(controller, "OpenActList")) == "function"
                and type(rawget(controller, "Roster")) == "table" then
                found = controller
                break
            end
        end
    end)

    ActControllerCache.Controller = found
    return found
end

local function AddEntryToActList(list, entry, owner)
    if type(list) ~= "table" or not IsActEntry(entry) then
        return false
    end

    local wantedKey = entry.Key
    for _, existing in ipairs(list) do
        if type(existing) == "table"
            and rawget(existing, "Key") == wantedKey
            and rawget(existing, "Owner") == owner then
            return false
        end
    end

    local clone = CloneActEntry(entry, owner)
    clone._PinkSourceKey = wantedKey
    table.insert(list, clone)
    return true
end

local function ApplyPendingActs()
    local controller = FindActController(false)
    if not controller then
        return 0
    end

    local actLists = {}
    local seenLists = {}
    local function AddList(list)
        if type(list) == "table" and not seenLists[list] then
            seenLists[list] = true
            table.insert(actLists, list)
        end
    end

    pcall(function()
        local currentList = controller:ActTableFor(rawget(controller, "ActMenuEnemy") or 1)
        AddList(currentList)
    end)

    AddList(rawget(controller, "ActTable"))

    local enemyTables = rawget(controller, "EnemyActTables")
    if type(enemyTables) == "table" then
        for _, list in pairs(enemyTables) do
            AddList(list)
        end
    end

    if #actLists == 0 then
        return 0
    end

    local added = 0
    for owner, actorQueue in pairs(PendingActs) do
        if type(actorQueue) == "table" then
            for _, entry in pairs(actorQueue) do
                if type(entry) == "table" and IsActEntry(entry) then
                    for _, list in ipairs(actLists) do
                        if AddEntryToActList(list, entry, owner) then
                            added += 1
                        end
                    end
                end
            end
        end
    end

    if added > 0 and rawget(controller, "State") == "Act" then
        pcall(function()
            controller:OpenActList()
        end)
    end

    return added
end

local function AddActToActor(actor, display)
    ScanActRegistry(false)
    local source = ActRegistry.Map[display]
    if not source then
        RefreshActDropdown(nil)
        source = ActRegistry.Map[display]
    end
    if not source then
        return false, "That Act is not present in the game's real Act tables."
    end

    PendingActs[actor] = PendingActs[actor] or {}
    PendingActs[actor][source.Key] = CloneActEntry(source.Entry, actor)

    local added = ApplyPendingActs()
    if added > 0 then
        return true, source.Name .. " added to " .. actor .. "."
    end

    return true, source.Name .. " queued for the current TurnSystem Act table."
end

local function PatchActCostEntry(entry, on)
    if not IsActEntry(entry) then
        return
    end

    if on then
        if rawget(entry, "_PinkOldCost") == nil then
            rawset(entry, "_PinkOldCost", entry.Cost)
        end
        rawset(entry, "Cost", 0)
        FreeActCostPatched[entry] = true
    else
        local old = rawget(entry, "_PinkOldCost")
        if old ~= nil then
            rawset(entry, "Cost", old)
            rawset(entry, "_PinkOldCost", nil)
        end
        FreeActCostPatched[entry] = nil
    end

    local upgrade = rawget(entry, "Upgrade")
    if type(upgrade) == "table" then
        PatchActCostEntry(upgrade, on)
    end
end

local function PatchLiveActController(on)
    local controller = FindActController(false)
    if not controller then
        return
    end

    local lists = {}
    local seen = {}
    local function AddList(list)
        if type(list) == "table" and not seen[list] then
            seen[list] = true
            table.insert(lists, list)
        end
    end

    pcall(function()
        AddList(controller:ActTableFor(rawget(controller, "ActMenuEnemy") or 1))
    end)
    AddList(rawget(controller, "ActTable"))

    local enemyTables = rawget(controller, "EnemyActTables")
    if type(enemyTables) == "table" then
        for _, list in pairs(enemyTables) do
            AddList(list)
        end
    end

    for _, list in ipairs(lists) do
        for _, entry in ipairs(list) do
            if IsActEntry(entry) then
                PatchActCostEntry(entry, on)
            end
        end
    end
end

local function ScanAndPatchFreeActs(on)
    -- Real base definitions come from the game's actual Act modules.
    for _, item in ipairs(ActRegistry.Items) do
        if item and IsActEntry(item.Entry) then
            PatchActCostEntry(item.Entry, on)
        end
    end
    PatchLiveActController(on)
end

local function GetOriginalActsCanUse()
    if not ActsModule then
        return nil
    end

    local saved = rawget(ActsModule, "_PinkOriginalCanUse")
    if type(saved) == "function" then
        return saved
    end

    local current = rawget(ActsModule, "CanUse")
    if type(current) == "function" then
        rawset(ActsModule, "_PinkOriginalCanUse", current)
        return current
    end

    return nil
end

ApplyFreeActs = function(on)
    if not ActsModule then
        return
    end

    pcall(function()
        local original = GetOriginalActsCanUse()

        if on then
            -- Ensure the real Act definitions are known before patching.
            if #ActRegistry.Items == 0 then
                ScanActRegistry(true)
            end
            ScanAndPatchFreeActs(true)
            FreeActLastScan = os.clock()

            if original then
                ActsModule.CanUse = function(entry, roster, tension, turns)
                    -- Acts.CanUse itself only adds partner/Enabled checks and
                    -- finally compares Cost <= tension. Infinity removes only
                    -- the TP restriction; we also zero Cost for actual spend.
                    return original(entry, roster, math.huge, turns)
                end
            end
        else
            for entry in pairs(FreeActCostPatched) do
                pcall(function()
                    PatchActCostEntry(entry, false)
                end)
            end
            table.clear(FreeActCostPatched)
            FreeActLastScan = 0
            if original then
                ActsModule.CanUse = original
            end
        end
    end)
end

local KNOWN_SPELLS = {
    "RudeBuster", "DualBuster", "HealPrayer", "Pacify", "IceShock", "SleepMist",
    "SnowGrave", "ReviveSong", "UltimateHeal", "DualHeal", "Scythemare",
    "GreenBuster", "RedBuster", "Act", "Swoon", "ILoveTV",
}

local KNOWN_ACTORS = { "Kris", "Susie", "Ralsei", "Noelle", "Gerson", "Knight", "Tenna" }

local function GetSpellsModule()
    local ok, Spells = pcall(require, ReplicatedStorage.Core.Data.Spells)
    if ok and type(Spells) == "table" then
        return Spells
    end
    return nil
end

ApplyFreeSpells = function(on)
    pcall(function()
        local Spells = GetSpellsModule()
        if not Spells then
            return
        end
        Spells.Overrides = Spells.Overrides or {}
        for _, id in ipairs(KNOWN_SPELLS) do
            if type(Spells.Definitions) == "table" and type(Spells.Definitions[id]) == "table" then
                if on then
                    if rawget(Spells.Definitions[id], "_PinkOldCost") == nil then
                        rawset(Spells.Definitions[id], "_PinkOldCost", Spells.Definitions[id].Cost)
                    end
                    Spells.Definitions[id].Cost = 0
                    if rawget(Spells.Definitions[id], "AllAllies") ~= nil then
                        if rawget(Spells.Definitions[id], "_PinkOldAllies") == nil then
                            rawset(Spells.Definitions[id], "_PinkOldAllies", Spells.Definitions[id].AllAllies)
                        end
                        Spells.Definitions[id].AllAllies = 0
                    end
                else
                    local old = rawget(Spells.Definitions[id], "_PinkOldCost")
                    Spells.Definitions[id].Cost = old
                    local oldA = rawget(Spells.Definitions[id], "_PinkOldAllies")
                    if oldA ~= nil then
                        Spells.Definitions[id].AllAllies = oldA
                    end
                end
            end
            Spells.Overrides[id] = Spells.Overrides[id] or {}
            if on then
                Spells.Overrides[id].Cost = 0
            else
                Spells.Overrides[id].Cost = nil
            end
        end
    end)
end

local function AssignSpellToActor(actor, spell)
    local ok, result = pcall(function()
        local Spells = GetSpellsModule()
        if not Spells or type(Spells.Loadouts) ~= "table" then
            return false, "Spells.Loadouts not found."
        end
        if type(Spells.Loadouts[actor]) ~= "table" then
            Spells.Loadouts[actor] = {}
        end
        local list = Spells.Loadouts[actor].Default
        if type(list) ~= "table" then
            Spells.Loadouts[actor].Default = {}
            list = Spells.Loadouts[actor].Default
        end

        if type(Spells.Definitions) ~= "table" or type(Spells.Definitions[spell]) ~= "table" then
            return false, spell .. " is not present in the game's real Spell definitions."
        end

        for _, id in ipairs(list) do
            if id == spell then
                return false, spell .. " is already assigned to " .. actor .. "."
            end
        end

        table.insert(list, spell)
        return true, spell .. " added to " .. actor .. "."
    end)

    if not ok then
        return false, "Spell assignment failed."
    end
    return result
end


local function AngleDifferenceDegrees(a, b)
    return ((a - b + 180) % 360) - 180
end

local function GersonShieldStep()
    local scene = GetGersonSpearScene(false)
    if not scene then
        return
    end

    pcall(function()
        local shield = rawget(scene, "Shield")
        local spears = rawget(scene, "Spears")
        if type(shield) ~= "table" or rawget(shield, "Alive") == false or type(spears) ~= "table" then
            return
        end

        local target = nil
        local bestTravel = math.huge

        -- Mirror the collision-side angle rules from GersonSpears exactly:
        -- normal spear uses Angle; BounceSpear==2 uses Direction; both are
        -- compared against shield.Angle + 180, so the shield target is +180.
        for _, spear in ipairs(spears) do
            if type(spear) == "table" and rawget(spear, "Alive") ~= false and rawget(spear, "RedHammer") ~= 1 then
                local len = rawget(spear, "Len")
                local bounce = rawget(spear, "BounceSpear") or 0
                local shake = rawget(spear, "ShakeDuration") or 0
                local bounceCon = rawget(spear, "BounceCon") or 0
                local fakeSpeed = rawget(spear, "FakeSpeed")

                if type(len) == "number" and len > 0 then
                    local blocked = bounce > 0 and (shake > 0 or (bounceCon == 2 and type(fakeSpeed) == "number" and fakeSpeed < 0))
                    if not blocked then
                        local rawAngle = bounce == 2 and rawget(spear, "Direction") or rawget(spear, "Angle")
                        if type(rawAngle) == "number" then
                            local travel = len
                            if type(fakeSpeed) == "number" and fakeSpeed > 0 then
                                travel = len / fakeSpeed
                            end
                            if travel < bestTravel then
                                bestTravel = travel
                                target = spear
                            end
                        end
                    end
                end
            end
        end

        if not target then
            return
        end

        local bounce = rawget(target, "BounceSpear") or 0
        local rawAngle = bounce == 2 and rawget(target, "Direction") or rawget(target, "Angle")
        if type(rawAngle) ~= "number" then
            return
        end

        local desired = (rawAngle + 180) % 360
        if type(shield.Press) == "function" then
            -- This is the game's own shield Press path. true,true produces
            -- Just=6 in the decompiled GersonShield module.
            shield:Press(nil, desired, {}, true, true)
        else
            rawset(shield, "IdealDir", desired)
            rawset(shield, "Just", 6)
        end

        -- StepRotation normally moves Angle toward IdealDir by its own rate.
        -- During the actual hit window we mirror the real target angle so the
        -- collision check sees the same direction the helper selected.
        rawset(shield, "Angle", desired)
    end)
end

local function GersonRudeBusterStep(perfect)
    local module = GersonRudeModule
    if not module then
        return
    end

    pcall(function()
        local items = rawget(module, "Items")
        local active = rawget(module, "Current")
        if type(items) ~= "table" or not active then
            return
        end

        for _, item in ipairs(items) do
            if type(item) == "table" and rawget(item, "Alive") ~= false then
                local con = rawget(item, "Con")
                local hurtFlash = rawget(item, "HurtFlash") or 0
                local explode = rawget(item, "Explode") or 0
                local x = rawget(item, "X")
                local timer = rawget(item, "Timer") or 0

                if con == 0 and hurtFlash == 0 and explode == 0 and type(x) == "number" and x < 330 then
                    -- Exact internal queue used by GersonRudeBuster.step.
                    rawset(item, "Buffer", 2)
                elseif perfect and con == 1 and hurtFlash == 0 and explode == 0 and type(x) == "number" and x < 330 then
                    -- The original hit verdict is evaluated on Timer == 4.
                    -- Setting Timer=3 makes the next game step perform that
                    -- exact X < 330 test without creating a fake Confirm input.
                    if timer < 3 then
                        rawset(item, "Timer", 3)
                    end
                end
            end
        end
    end)
end

local function GersonAutoTimingRudeBusterStep()
    GersonRudeBusterStep(false)
end

local function TennaMaxScoreNow()
    local changed = 0

    pcall(function()
        RescanBossCache(true)
        for _, v in ipairs(BossCache.Tenna) do
            local score = rawget(v, "Score")
            local maxScore = rawget(v, "MaxScore")
            if type(score) == "number" and type(maxScore) == "number" and score < maxScore then
                rawset(v, "Score", maxScore)
                changed += 1
            end
        end
    end)

    return changed > 0
end


local GenericAccumulator = 0

RunService.Heartbeat:Connect(function(dt)
    local needTP = PinksState.TPInfinite
    local needHP = PinksState.HPInfinite
    local needGod = PinksState.GodMode
    local needClear = PinksState.DeleteStinky
    local needFreeSoul = PinksState.FreeSoulToggle
    local needVisual = PinksState.VisualHitbox
    local needFreeActs = PinksState.FreeActs

    if needTP or needHP or needGod or needClear or needFreeSoul or needVisual or needFreeActs then
        GenericAccumulator += dt
        if GenericAccumulator >= 0.25 then
            GenericAccumulator = 0
            if needTP or needGod or needHP or needClear or needVisual or needFreeSoul then
                RescanCache(false)
            end

            pcall(function()
                if needTP then
                    local maxTP = GetTensionMax()
                    for _, v in ipairs(Cache.TensionBars) do
                        rawset(v, "Apparent", maxTP)
                        rawset(v, "Current", maxTP)
                    end
                    for _, v in ipairs(Cache.TensionTables) do
                        local tmax = rawget(v, "TensionMax") or maxTP
                        rawset(v, "Tension", tmax)
                    end
                end

                if needGod then
                    for _, v in ipairs(Cache.SoulTables) do
                        rawset(v, "Invuln", 999)
                        if rawget(v, "MaxHP") ~= nil then
                            rawset(v, "HP", v.MaxHP)
                        end
                        if rawget(v, "GrazeCount") ~= nil then
                            rawset(v, "GrazeCount", 9999)
                        end
                    end
                    for _, v in ipairs(Cache.HPTables) do
                        if rawget(v, "MaxHP") ~= nil then
                            rawset(v, "HP", v.MaxHP)
                        end
                    end
                elseif needHP then
                    for _, v in ipairs(Cache.HPTables) do
                        if rawget(v, "MaxHP") ~= nil then
                            rawset(v, "HP", v.MaxHP)
                        end
                    end
                end

                if needClear then
                    ClearBulletsNow()
                end

                if needFreeSoul then
                    for _, v in ipairs(Cache.SoulTables) do
                        if rawget(v, "Frozen") ~= nil then
                            rawset(v, "Frozen", false)
                        end
                        if rawget(v, "FreeRoam") ~= nil then
                            rawset(v, "FreeRoam", true)
                        end
                        if rawget(v, "Locked") ~= nil then
                            rawset(v, "Locked", false)
                        end
                        if type(rawget(v, "Solids")) == "table" then
                            table.clear(v.Solids)
                        end
                        if type(v.SetMode) == "function" then
                            pcall(function() v:SetMode("Default") end)
                        else
                            rawset(v, "ModeName", "Default")
                        end
                        if type(v.SetSkin) == "function" then
                            pcall(function() v:SetSkin(nil) end)
                        else
                            rawset(v, "Skin", nil)
                        end
                    end

                    -- GersonSpears uses HeartColor + Pinned to force the
                    -- green-heart sequence. These are real fields from the
                    -- decompiled scene; HeartColor=0 makes its PinHeart path
                    -- release instead of re-pinning the Soul.
                    local scene = GetGersonSpearScene(false)
                    if scene then
                        rawset(scene, "HeartColor", 0)
                        rawset(scene, "Pinned", false)
                        local api = rawget(scene, "Api")
                        if type(api) == "table" and type(rawget(api, "FreezeSoul")) == "function" then
                            pcall(function() api.FreezeSoul(false) end)
                        end
                        if type(api) == "table" and type(rawget(api, "SoulSpeed")) == "function" then
                            pcall(function() api.SoulSpeed(nil) end)
                        end
                    end
                end

                if needFreeActs then
                    local now = os.clock()
                    if now - FreeActLastScan >= 1.5 then
                        ScanAndPatchFreeActs(true)
                        FreeActLastScan = now
                    end
                end

                if needVisual then
                    SetVisualHitboxes(true)
                end
            end)
        end
    else
        GenericAccumulator = 0
    end

    if next(PendingActs) ~= nil then
        PendingActAccumulator += dt
        if PendingActAccumulator >= 1.25 then
            PendingActAccumulator = 0
            pcall(function()
                ApplyPendingActs()
            end)
        end
    else
        PendingActAccumulator = 0
    end
end)

RunService.Stepped:Connect(function()
    if PinksState.GersonShield then
        GersonShieldStep()
    end

    if PinksState.GersonRudeTiming then
        GersonRudeBusterStep(true)
    elseif PinksState.GersonAutoTiming then
        GersonAutoTimingRudeBusterStep()
    end
end)

local Window = WindUI:CreateWindow({
    Title = "Deltarune | Pink's",
    Icon = "https://raw.githubusercontent.com/HttpsZXY/PinkBomb/main/Assets/Bomb.png",
    Folder = "DeltarunePinks",
    Size = UDim2.fromOffset(IsMobile and 480 or 640, IsMobile and 420 or 500),
    MinSize = Vector2.new(IsMobile and 360 or 520, IsMobile and 300 or 360),
    MaxSize = Vector2.new(950, 700),
    ToggleKey = Enum.KeyCode.LeftShift,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = IsMobile and 180 or 220,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    OpenButton = {
        Title = "Pink's",
        Enabled = true,
        Draggable = true,
        OnlyMobile = false,
        Scale = IsMobile and 1.25 or 1.15,
    },
    User = {
        Enabled = true,
        Anonymous = true,
    },
})

pcall(function()
    Window:Tag({
        Title = "2.3.0",
        Icon = "github",
        Color = Orange,
        Border = true,
    })
end)

local MainSection     = Window:Section({ Title = "Main", Opened = true })
local FightSection    = Window:Section({ Title = "Fight", Opened = true })
local SettingsSection = Window:Section({ Title = "Settings", Opened = true })

do
    local Tab = MainSection:Tab({
        Title = "Home",
        Icon = "solar:info-circle-bold",
        IconColor = Orange,
        IconShape = "Square",
        Border = true,
        BorderColor = Orange,
    })

    Tab:Section({
        Title = "About",
        Opened = true,
    })

    Tab:Paragraph({
        Title = "Support Executors",
        Desc = "Mobile Exploits\n[OK] Delta (deltaexploits.dev) - Main recommendation for mobile. Turn off Verify Teleports if you face rejoining bugs.\n[OK] Codex (codex.lol) - Fully operational and running the UI without issues.\n\nmacOS Exploits\n[OK] Opiumware (opiumware.today) - Top choice selected by the development team.\n[OK] Hydrogen (hydrogen.lat) - 100% stable execution with full features.\n[OK] Macsploit (raptor.fun) - Works perfectly.\n\nWindows Exploits\n[OK] Volt (voltbz.net) - Highly recommended for smooth farm performance.\n[OK] Madium (getmadium.net) - Excellent support for automation functions.\n[OK] Real (realest.gg) - Confirmed working with the entire script framework.\n[OK] Velocity (getvelocity.llc) - Fully compatible with the Script.\n[OK] Potassium (potassium.pro) - Runs the script smoothly.\n[~] Solara (getsolara.dev) - Good keyless alternative; a few premium features might fail due to missing API functions.\n[X] Xeno (xeno.onl) - Extremely unstable and poorly optimized. Skip this one completely.",
    })

    Tab:Space()

    Tab:Paragraph({
        Title = "Supported Games",
        Desc = "[OK] Funhouse\n[OK] Deltarune Fight",
    })

    Tab:Space()

    Tab:Paragraph({
        Title = "Changelog",
        Desc = "2.3.0: exact Gerson timing, real Act tables, working Free Acts, full Soul release, and reduced polling overhead.",
    })

    Tab:Space()

    Tab:Paragraph({
        Title = "Developers",
        Desc = "Hs (Https), Gh (GourdyHalloway), Nc (Nexocat).",
    })
end

do
    local Tab = FightSection:Tab({
        Title = "Automatic",
        Icon = "solar:restart-bold",
        IconColor = Orange,
        IconShape = "Square",
        Border = true,
        BorderColor = Orange,
    })

    Tab:Section({
        Title = "General",
        Opened = true,
    })

    Tab:Toggle({
        Title = "TP Infinite",
        Value = false,
        Flag = "TPInfinite",
        Callback = function(state)
            PinksState.TPInfinite = state
            if state then
                RescanCache(true)
                ForceTP(GetTensionMax())
            end
        end,
    })
    Tab:Space()
    Tab:Button({
        Title = "TP Max",
        Icon = "zap",
        Callback = function()
            RescanCache(true)
            ForceTP(GetTensionMax())
        end,
    })
    Tab:Space()
    Tab:Input({
        Title = "TP Giver",
        Placeholder = "Amount...",
        Value = "",
        Flag = "TPGiver",
        Callback = function(text)
            PinksState._TPAmount = tonumber(text) or 0
        end,
    })
    Tab:Space()
    Tab:Button({
        Title = "Give TP",
        Icon = "plus",
        Callback = function()
            RescanCache(true)
            ForceTP(PinksState._TPAmount or 10)
        end,
    })

    Tab:Space()
    Tab:Divider()

    Tab:Toggle({
        Title = "HP Infinite",
        Value = false,
        Flag = "HPInfinite",
        Callback = function(state)
            PinksState.HPInfinite = state
            if state then
                RescanCache(true)
            end
        end,
    })
    Tab:Space()
    Tab:Input({
        Title = "HP Giver",
        Placeholder = "Amount...",
        Value = "",
        Flag = "HPGiver",
        Callback = function(text)
            PinksState._HPAmount = tonumber(text) or 0
        end,
    })
    Tab:Space()
    Tab:Button({
        Title = "Give HP",
        Icon = "plus",
        Callback = function()
            local amount = PinksState._HPAmount or 0
            if amount <= 0 then
                return
            end
            RescanCache(true)
            pcall(function()
                for _, v in pairs(Cache.HPTables) do
                    if type(rawget(v, "HP")) == "number" and type(rawget(v, "MaxHP")) == "number" then
                        rawset(v, "HP", math.min(v.HP + amount, v.MaxHP))
                    end
                end
            end)
        end,
    })
    Tab:Space()
    Tab:Button({
        Title = "Heal Party",
        Icon = "heart-pulse",
        Color = Green,
        Callback = function()
            RescanCache(true)
            pcall(function()
                for _, v in pairs(Cache.HPTables) do
                    if rawget(v, "MaxHP") ~= nil then
                        rawset(v, "HP", v.MaxHP)
                        if rawget(v, "Down") == true then
                            rawset(v, "Down", false)
                        end
                        if rawget(v, "Swooned") == true then
                            rawset(v, "Swooned", false)
                        end
                    end
                end
            end)
        end,
    })
    Tab:Space()
    Tab:Toggle({
        Title = "God-Mode",
        Value = false,
        Flag = "GodMode",
        Callback = function(state)
            PinksState.GodMode = state
            ApplyGodMode(state)
        end,
    })
    Tab:Space()
    Tab:Button({
        Title = "Max Mercy",
        Icon = "heart",
        Color = Green,
        Callback = function()
            MaxMercyNow()
        end,
    })
    Tab:Space()
    Tab:Toggle({
        Title = "Free Soul",
        Value = false,
        Flag = "FreeSoul_v3",
        Callback = function(state)
            PinksState.FreeSoulToggle = state
            ApplyFreeSoul(state)
        end,
    })


    Tab:Space()
    Tab:Divider()

    Tab:Section({
        Title = "Fight",
        Opened = true,
    })

    Tab:Button({
        Title = "Instant Complete Fight",
        Icon = "check-circle",
        Color = Green,
        Callback = function()
            InstantWinNow()
        end,
    })
    Tab:Space()
    Tab:Toggle({
        Title = "Delete Stinky Attacks Enemy",
        Value = false,
        Flag = "DeleteStinkyAttacks",
        Callback = function(state)
            PinksState.DeleteStinky = state
            if state then
                RescanCache(true)
                ClearBulletsNow()
            end
        end,
    })
    Tab:Space()
    Tab:Button({
        Title = "Skip Enemys Turn",
        Icon = "skip-forward",
        Callback = function()
            SkipEnemyTurnNow()
        end,
    })
    Tab:Space()
    Tab:Toggle({
        Title = "Visual Hitbox",
        Value = false,
        Flag = "VisualHitbox",
        Callback = function(state)
            PinksState.VisualHitbox = state
            SetVisualHitboxes(state)
        end,
    })

    Tab:Space()
    Tab:Divider()

    Tab:Section({
        Title = "Spells",
        Opened = true,
    })

    Tab:Toggle({
        Title = "Snowgrave Available",
        Value = false,
        Flag = "ProceedSnowgrave_v2",
        Callback = function(state)
            PinksState.ProceedSnowgrave = state
            ApplyProceedSnowgrave(state)
        end,
    })
    Tab:Space()
    Tab:Toggle({
        Title = "Free Spells (0 TP)",
        Value = false,
        Flag = "FreeSpells_v3",
        Callback = function(state)
            PinksState.FreeSpells = state
            ApplyFreeSpells(state)
        end,
    })
    Tab:Space()

    Tab:Dropdown({
        Title = "Actor",
        Values = KNOWN_ACTORS,
        Value = "Kris",
        Flag = "AssignActor_v3",
        Callback = function(option)
            PinksState.AssignActor = option
        end,
    })
    Tab:Space()
    Tab:Dropdown({
        Title = "Spell",
        Values = KNOWN_SPELLS,
        Value = "RudeBuster",
        Flag = "AssignSpell_v3",
        Callback = function(option)
            PinksState.AssignSpell = option
        end,
    })
    Tab:Space()
    Tab:Button({
        Title = "Assign Spell to Actor",
        Icon = "plus",
        Color = Green,
        Callback = function()
            local actor = PinksState.AssignActor or "Kris"
            local spell = PinksState.AssignSpell or "RudeBuster"
            local ok, message = AssignSpellToActor(actor, spell)
            WindUI:Notify({
                Title = "Spells",
                Content = message,
                Duration = 3,
                Icon = ok and "check" or "info",
            })
        end,
    })
    Tab:Space()

    Tab:Divider()
    Tab:Dropdown({
        Title = "Act",
        Values = ScanActRegistry(false),
        Value = PinksState.AssignAct or "Check",
        Flag = "AssignAct_v3",
        Callback = function(option)
            PinksState.AssignAct = option
        end,
    })
    Tab:Space()
    Tab:Button({
        Title = "Refresh Acts",
        Icon = "refresh-cw",
        Callback = function()
            local options = RefreshActDropdown(nil)
            WindUI:Notify({
                Title = "Acts",
                Content = tostring(#options) .. " real Act entries loaded from the game's Fight/Acts modules.",
                Duration = 4,
                Icon = "info",
            })
        end,
    })
    Tab:Space()
    Tab:Button({
        Title = "Add Act to Actor",
        Icon = "plus",
        Color = Green,
        Callback = function()
            local actor = PinksState.AssignActor or "Kris"
            local act = PinksState.AssignAct or "Check"
            local ok, message = AddActToActor(actor, act)
            WindUI:Notify({
                Title = "Acts",
                Content = message,
                Duration = 4,
                Icon = ok and "check" or "info",
            })
        end,
    })
    Tab:Space()
    Tab:Toggle({
        Title = "Free Acts (0 TP)",
        Value = false,
        Flag = "FreeActs_v3",
        Callback = function(state)
            PinksState.FreeActs = state
            ApplyFreeActs(state)
        end,
    })
end

do
    local Tab = FightSection:Tab({
        Title = "Boss n Mini",
        Icon = "solar:sword-bold",
        IconColor = Orange,
        IconShape = "Square",
        Border = true,
        BorderColor = Orange,
    })

    Tab:Section({
        Title = "Gerson",
        Opened = true,
    })

    Tab:Toggle({
        Title = "Shield / Parry Helper",
        Value = false,
        Flag = "GersonShield_v4",
        Callback = function(state)
            PinksState.GersonShield = state
            if state then
                GetGersonSpearScene(true)
            end
        end,
    })
    Tab:Space()

    Tab:Toggle({
        Title = "Gerson Perfect Rude Buster",
        Value = false,
        Flag = "GersonRudeTiming_v4",
        Callback = function(state)
            PinksState.GersonRudeTiming = state
        end,
    })
    Tab:Space()

    Tab:Toggle({
        Title = "Auto Timing Rude Buster",
        Value = false,
        Flag = "GersonAutoTiming_v4",
        Callback = function(state)
            PinksState.GersonAutoTiming = state
        end,
    })
    Tab:Space()
    Tab:Divider()

    Tab:Section({
        Title = "Tenna",
        Opened = true,
    })
    Tab:Button({
        Title = "Max Score",
        Icon = "trophy",
        Color = Green,
        Callback = function()
            local changed = TennaMaxScoreNow()
            WindUI:Notify({
                Title = "Tenna",
                Content = changed and "Score set to MaxScore." or "Tenna score state not found or already maxed.",
                Duration = 3,
                Icon = changed and "check" or "info",
            })
        end,
    })
end


do
    local Tab = SettingsSection:Tab({
        Title = "Settings",
        Icon = "solar:settings-bold",
        IconColor = Orange,
        IconShape = "Square",
        Border = true,
        BorderColor = Orange,
    })

    Tab:Section({
        Title = "Saves",
        Opened = true,
    })

    Tab:Input({
        Title = "Name",
        Placeholder = "Config name...",
        Value = "Default",
        Flag = "ConfigName",
        Callback = function(text)
            ConfigNameValue = text
        end,
    })
    Tab:Space()
    Tab:Dropdown({
        Title = "File",
        Values = RefreshConfigList(),
        Value = "Default",
        Flag = "ConfigFile",
        Callback = function(option)
            ConfigNameValue = option
        end,
    })
    Tab:Space()
    Tab:Button({
        Title = "Save",
        Icon = "save",
        Color = Green,
        Callback = function()
            local name = ConfigNameValue
            if not name or name == "" then
                name = "Default"
            end
            if SaveConfig(name) then
                WindUI:Notify({
                    Title = "Config",
                    Content = "Saved preset: " .. name,
                    Duration = 3,
                    Icon = "check",
                })
            else
                WindUI:Notify({
                    Title = "Config",
                    Content = "Save failed (executor may not support writefile).",
                    Duration = 4,
                    Icon = "x",
                })
            end
        end,
    })
    Tab:Space()
    Tab:Button({
        Title = "Load",
        Icon = "download",
        Callback = function()
            local name = ConfigNameValue
            if not name or name == "" then
                name = "Default"
            end
            if LoadConfig(name) then
                WindUI:Notify({
                    Title = "Config",
                    Content = "Loaded preset: " .. name,
                    Duration = 3,
                    Icon = "check",
                })
            else
                WindUI:Notify({
                    Title = "Config",
                    Content = "Load failed or preset not found.",
                    Duration = 4,
                    Icon = "x",
                })
            end
        end,
    })
    Tab:Space()
    Tab:Button({
        Title = "Delete",
        Icon = "trash-2",
        Color = Red,
        Callback = function()
            local name = ConfigNameValue
            if not name or name == "" or name == "Default" then
                WindUI:Notify({
                    Title = "Config",
                    Content = "Cannot delete Default / empty name.",
                    Duration = 3,
                    Icon = "x",
                })
                return
            end
            if DeleteConfig(name) then
                WindUI:Notify({
                    Title = "Config",
                    Content = "Deleted preset: " .. name,
                    Duration = 3,
                    Icon = "check",
                })
            end
        end,
    })

    Tab:Space()
    Tab:Divider()

    Tab:Section({
        Title = "UI",
        Opened = true,
    })

    Tab:Dropdown({
        Title = "Change Color UI",
        Values = { "Dark", "Light", "Rose", "Plant", "Indigo", "Sky", "Violet", "Amber" },
        Value = "Dark",
        Flag = "UIColor",
        Callback = function(theme)
            PinksState.UIColor = theme
            pcall(function()
                WindUI:SetTheme(theme)
            end)
        end,
    })
end
