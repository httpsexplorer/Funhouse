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
    PinkHearts = false,
    PinkDateAuto = false,
    TennaMaxScore = false,
    KnightSkipPhase = false,
    ProceedSnowgrave = false,
    SoulModeOn = false,
    SoulModeName = "Default",
    ShieldLead = 8,
    RudeXMin = 200,
    RudeXMax = 330,
    _TPAmount = 10,
    _HPAmount = 0,
    UIColor = "Dark",
}

local ConfigFolder = "DeltarunePinks/Configs"
local ConfigNameValue = "Default"
local ConfigFileList = { "Default" }

local function EnsureConfigFolder()
    pcall(function()
        if makefolder then
            makefolder("DeltarunePinks")
            makefolder(ConfigFolder)
        end
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
        PinkHearts = PinksState.PinkHearts,
        PinkDateAuto = PinksState.PinkDateAuto,
        TennaMaxScore = PinksState.TennaMaxScore,
        KnightSkipPhase = PinksState.KnightSkipPhase,
        ProceedSnowgrave = PinksState.ProceedSnowgrave,
        SoulModeOn = PinksState.SoulModeOn,
        SoulModeName = PinksState.SoulModeName or "Default",
        ShieldLead = PinksState.ShieldLead or 8,
        RudeXMin = PinksState.RudeXMin or 200,
        RudeXMax = PinksState.RudeXMax or 330,
        _TPAmount = PinksState._TPAmount or 10,
        _HPAmount = PinksState._HPAmount or 0,
        UIColor = PinksState.UIColor or "Dark",
    }
end

local ApplyConfig
local ApplyProceedSnowgrave

local function SaveConfig(name)
    name = tostring(name or ConfigNameValue or "Default")
    if name == "" then
        name = "Default"
    end
    EnsureConfigFolder()
    local data = SnapshotConfig()
    local ok = pcall(function()
        if writefile then
            writefile(ConfigPath(name), EncodeConfig(data))
        end
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
    local ok = pcall(function()
        if isfile and isfile(path) and delfile then
            delfile(path)
        end
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

local function ApplyFreeSoul(on)
    RescanCache(true)
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
    PinksState.PinkHearts = data.PinkHearts == true
    PinksState.PinkDateAuto = data.PinkDateAuto == true
    PinksState.TennaMaxScore = data.TennaMaxScore == true
    PinksState.KnightSkipPhase = data.KnightSkipPhase == true
    PinksState.ProceedSnowgrave = data.ProceedSnowgrave == true
    PinksState.SoulModeOn = data.SoulModeOn == true
    PinksState.SoulModeName = data.SoulModeName or "Default"
    PinksState.ShieldLead = tonumber(data.ShieldLead) or 8
    PinksState.RudeXMin = tonumber(data.RudeXMin) or 200
    PinksState.RudeXMax = tonumber(data.RudeXMax) or 330
    PinksState._TPAmount = tonumber(data._TPAmount) or 10
    PinksState._HPAmount = tonumber(data._HPAmount) or 0
    PinksState.UIColor = data.UIColor or "Dark"

    ApplyGodMode(PinksState.GodMode)
    ApplyFreeSoul(PinksState.FreeSoulToggle)
    SetVisualHitboxes(PinksState.VisualHitbox)
    if ApplyProceedSnowgrave then
        ApplyProceedSnowgrave(PinksState.ProceedSnowgrave)
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
                Spells.Definitions.SnowGrave.Cost = 100
                if rawget(Spells.Definitions.SnowGrave, "AllAllies") ~= nil then
                    Spells.Definitions.SnowGrave.AllAllies = 100
                end
            end
        end
        if type(Spells.Overrides) == "table" then
            Spells.Overrides.SnowGrave = Spells.Overrides.SnowGrave or {}
            if on then
                Spells.Overrides.SnowGrave.Cost = 100
                Spells.Overrides.SnowGrave.MenuVisible = true
            else
                Spells.Overrides.SnowGrave.Cost = nil
            end
        end
    end)
end

local BossCache = {
    Shields = {},
    Spears = {},
    Date = {},
    Rude = {},
    Knight = {},
    Tenna = {},
    Soul = {},
    Last = 0,
}

local function RescanBossCache(force)
    local now = os.clock()
    if not force and now - BossCache.Last < 0.75 then
        return
    end
    BossCache.Last = now
    local shields, spears, date, rude, knight, tenna, soul = {}, {}, {}, {}, {}, {}, {}
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if typeof(v) ~= "table" then
            else
                if rawget(v, "IdealDir") ~= nil and rawget(v, "Angle") ~= nil and rawget(v, "Just") ~= nil then
                    table.insert(shields, v)
                end
                if type(rawget(v, "Direction")) == "number" and type(rawget(v, "X")) == "number" and type(rawget(v, "Y")) == "number" and rawget(v, "Hp") ~= nil and rawget(v, "Len") ~= nil then
                    table.insert(spears, v)
                end
                if type(rawget(v, "ChoiceIsCorrect")) == "table" and rawget(v, "ChoiceSelected") ~= nil then
                    table.insert(date, v)
                end
                if type(rawget(v, "X")) == "number" and rawget(v, "Con") ~= nil and rawget(v, "Buffer") ~= nil and rawget(v, "HurtFlash") ~= nil then
                    table.insert(rude, v)
                end
                if rawget(v, "Phase") ~= nil or rawget(v, "RoaringAttackIndex") ~= nil or rawget(v, "UsedRoaring") ~= nil then
                    table.insert(knight, v)
                end
                if type(rawget(v, "Score")) == "number" and type(rawget(v, "MaxScore")) == "number" then
                    table.insert(tenna, v)
                end
                if type(rawget(v, "SetMode")) == "function" and rawget(v, "MaxHP") ~= nil then
                    table.insert(soul, v)
                end
            end
        end
    end)
    BossCache.Shields = shields
    BossCache.Spears = spears
    BossCache.Date = date
    BossCache.Rude = rude
    BossCache.Knight = knight
    BossCache.Tenna = tenna
    BossCache.Soul = soul
end

local function EnsureSoulModes()
    pcall(function()
        local ok, SoulModes = pcall(require, ReplicatedStorage.Core.Combat.SoulModes)
        if not ok or type(SoulModes) ~= "table" then
            return
        end
        if type(SoulModes.Register) == "function" and not SoulModes.Has("Purple") then
            SoulModes.Register("Purple", {
                Skin = {
                    AssetId = "pink",
                    Extract = "spr_purpleheart",
                },
            })
        end
    end)
end

local function ApplySoulMode()
    if not PinksState.SoulModeOn then
        return
    end
    EnsureSoulModes()
    RescanBossCache(false)
    local name = PinksState.SoulModeName or "Default"
    pcall(function()
        for _, v in pairs(BossCache.Soul) do
            if type(v.SetMode) == "function" then
                v:SetMode(name)
            end
        end
    end)
end

local function GersonShieldStep()
    RescanBossCache(false)
    local lead = tonumber(PinksState.ShieldLead) or 8
    pcall(function()
        for _, shield in pairs(BossCache.Shields) do
            if rawget(shield, "Alive") == false then
                continue
            end
            local sx = shield.X or 0
            local sy = shield.Y or 0
            local bestDir = nil
            local bestScore = 1e18
            for _, spear in pairs(BossCache.Spears) do
                local x = spear.X or 0
                local y = spear.Y or 0
                local dir = spear.Direction or 0
                local speed = spear.FakeSpeed or spear.MoveSpeed or 0
                if type(speed) ~= "number" then
                    speed = 0
                end
                local rad = math.rad(dir)
                local px = x + math.cos(rad) * speed * lead
                local py = y - math.sin(rad) * speed * lead
                local dx = px - sx
                local dy = py - sy
                local dist = dx * dx + dy * dy
                local approaching = dist < bestScore
                if approaching then
                    bestScore = dist
                    bestDir = (dir + 180) % 360
                end
            end
            if bestDir ~= nil then
                local snapped = math.floor((bestDir + 22.5) / 45) * 45 % 360
                rawset(shield, "IdealDir", snapped)
                rawset(shield, "Angle", snapped)
                rawset(shield, "Just", 6)
                if rawget(shield, "ParryFlashTimer") ~= nil then
                    rawset(shield, "ParryFlashTimer", 4)
                end
            end
        end
    end)
end

local function GersonRudeTimingStep()
    RescanBossCache(false)
    local xmin = tonumber(PinksState.RudeXMin) or 200
    local xmax = tonumber(PinksState.RudeXMax) or 330
    if xmin > xmax then
        xmin, xmax = xmax, xmin
    end
    pcall(function()
        local Input = nil
        pcall(function()
            Input = require(ReplicatedStorage.Core.System.Input)
        end)
        for _, v in pairs(BossCache.Rude) do
            local con = rawget(v, "Con")
            local hurt = rawget(v, "HurtFlash") or 0
            local explode = rawget(v, "Explode") or 0
            local x = rawget(v, "X")
            if con == 0 and hurt == 0 and explode == 0 and type(x) == "number" and x >= xmin and x <= xmax then
                rawset(v, "Buffer", 2)
                if Input and type(Input.Tap) == "function" then
                    pcall(function()
                        Input.Tap("Confirm")
                    end)
                end
            end
        end
    end)
end

local function PinkHeartsStep()
    RescanCache(false)
    pcall(function()
        local soulX, soulY = nil, nil
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "table" then
                local soul = rawget(v, "Soul")
                if type(soul) == "table" and type(rawget(soul, "X")) == "number" then
                    soulX, soulY = soul.X, soul.Y
                    break
                end
            end
        end
        if not soulX then
            return
        end
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "table" and typeof(rawget(v, "Hearts")) == "table" then
                for _, heart in pairs(v.Hearts) do
                    if type(heart) == "table" then
                        if rawget(heart, "X") ~= nil then
                            rawset(heart, "X", soulX)
                        end
                        if rawget(heart, "Y") ~= nil then
                            rawset(heart, "Y", soulY)
                        end
                        if rawget(heart, "VX") ~= nil then
                            rawset(heart, "VX", 0)
                        end
                        if rawget(heart, "VY") ~= nil then
                            rawset(heart, "VY", 0)
                        end
                    end
                end
            end
        end
    end)
end

local _dateConfirmCD = 0
local function PinkDateAutoStep(dt)
    _dateConfirmCD = _dateConfirmCD - (dt or 0.12)
    RescanBossCache(false)
    pcall(function()
        for _, v in pairs(BossCache.Date) do
            local correct = rawget(v, "ChoiceIsCorrect")
            if type(correct) ~= "table" then
                continue
            end
            local pick = nil
            for slot, val in pairs(correct) do
                if val == 1 or val == true then
                    pick = slot
                    break
                end
            end
            if pick ~= nil and rawget(v, "ChoiceSelected") ~= pick then
                rawset(v, "ChoiceSelected", pick)
                if rawget(v, "DrawBoxSelected") ~= nil then
                    rawset(v, "DrawBoxSelected", pick)
                end
            end
        end
        if _dateConfirmCD <= 0 and #BossCache.Date > 0 then
            _dateConfirmCD = 0.35
            pcall(function()
                local Input = require(ReplicatedStorage.Core.System.Input)
                if Input and type(Input.Tap) == "function" then
                    Input.Tap("Confirm")
                end
            end)
        end
    end)
end

local function TennaMaxScoreStep()
    RescanBossCache(false)
    pcall(function()
        for _, v in pairs(BossCache.Tenna) do
            if type(v.Score) == "number" and type(v.MaxScore) == "number" and v.Score < v.MaxScore then
                rawset(v, "Score", v.MaxScore)
            end
        end
    end)
end

local function KnightPhaseStep()
    RescanBossCache(false)
    pcall(function()
        for _, v in pairs(BossCache.Knight) do
            if type(rawget(v, "Phase")) == "number" and v.Phase < 4 then
                rawset(v, "Phase", 4)
            end
            if type(rawget(v, "Phase4Turn")) == "number" then
                rawset(v, "Phase4Turn", 3)
            end
            if rawget(v, "UsedRoaring") ~= nil then
                rawset(v, "UsedRoaring", true)
            end
            if type(rawget(v, "RoaringAttackIndex")) == "number" then
                rawset(v, "RoaringAttackIndex", 99)
            end
            local enemy = rawget(v, "Enemy")
            if type(enemy) == "table" and type(rawget(enemy, "RoaringAttackIndex")) == "number" then
                rawset(enemy, "RoaringAttackIndex", 99)
            end
        end
    end)
end

local ScanAccumulator = 0

RunService.Heartbeat:Connect(function(dt)
    local needTP = PinksState.TPInfinite
    local needGod = PinksState.GodMode
    local needHP = PinksState.HPInfinite
    local needClear = PinksState.DeleteStinky
    local needFree = PinksState.FreeSoulToggle
    local needVisual = PinksState.VisualHitbox
    local needShield = PinksState.GersonShield
    local needRude = PinksState.GersonRudeTiming
    local needHearts = PinksState.PinkHearts
    local needDate = PinksState.PinkDateAuto
    local needTennaMax = PinksState.TennaMaxScore
    local needKnightPhase = PinksState.KnightSkipPhase
    local needSoulMode = PinksState.SoulModeOn

    if not (needTP or needGod or needHP or needClear or needFree or needVisual or needShield or needRude or needHearts or needDate or needTennaMax or needKnightPhase or needSoulMode) then
        return
    end

    ScanAccumulator = ScanAccumulator + dt
    if ScanAccumulator < 0.12 then
        return
    end
    ScanAccumulator = 0

    RescanCache(false)

    pcall(function()
        if needTP then
            local maxTP = GetTensionMax()
            for _, v in pairs(Cache.TensionBars) do
                rawset(v, "Apparent", maxTP)
                rawset(v, "Current", maxTP)
            end
            for _, v in pairs(Cache.TensionTables) do
                local tmax = rawget(v, "TensionMax") or maxTP
                rawset(v, "Tension", tmax)
            end
        end

        if needGod then
            for _, v in pairs(Cache.SoulTables) do
                rawset(v, "Invuln", 999)
                if rawget(v, "MaxHP") ~= nil then
                    rawset(v, "HP", v.MaxHP)
                end
                if rawget(v, "GrazeCount") ~= nil then
                    rawset(v, "GrazeCount", 9999)
                end
            end
            for _, v in pairs(Cache.HPTables) do
                if rawget(v, "MaxHP") ~= nil then
                    rawset(v, "HP", v.MaxHP)
                end
            end
        elseif needHP then
            for _, v in pairs(Cache.HPTables) do
                if rawget(v, "MaxHP") ~= nil then
                    rawset(v, "HP", v.MaxHP)
                end
            end
        end

        if needClear then
            ClearBulletsNow()
        end

        if needFree then
            for _, v in pairs(Cache.SoulTables) do
                if rawget(v, "Frozen") ~= nil then
                    rawset(v, "Frozen", false)
                end
                if rawget(v, "FreeRoam") ~= nil then
                    rawset(v, "FreeRoam", true)
                end
                if rawget(v, "Locked") ~= nil then
                    rawset(v, "Locked", false)
                end
            end
        end

        if needVisual then
            for _, v in pairs(getgc(true)) do
                if typeof(v) == "table" and rawget(v, "Harmful") == true and type(rawget(v, "Radius")) == "number" then
                    if not rawget(v, "_PinkVisScale") then
                        rawset(v, "_PinkVisScale", true)
                        rawset(v, "Radius", (v.Radius or 4) * 1.75)
                        if type(rawget(v, "Width")) == "number" then
                            rawset(v, "Width", v.Width * 1.75)
                        end
                        if type(rawget(v, "Height")) == "number" then
                            rawset(v, "Height", v.Height * 1.75)
                        end
                    end
                end
            end
        end

        if needShield then
            GersonShieldStep()
        end
        if needRude then
            GersonRudeTimingStep()
        end
        if needHearts then
            PinkHeartsStep()
        end
        if needDate then
            PinkDateAutoStep(0.12)
        end
        if needTennaMax then
            TennaMaxScoreStep()
        end
        if needKnightPhase then
            KnightPhaseStep()
        end
        if needSoulMode then
            ApplySoulMode()
        end
    end)
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
        Title = "2.2.4",
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

    Tab:Section({ Title = "About" })

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
        Desc = "omg first realesed this script pls wait Cries",
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

    Tab:Section({ Title = "General" })

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
        Flag = "FreeSoul",
        Callback = function(state)
            PinksState.FreeSoulToggle = state
            ApplyFreeSoul(state)
        end,
    })


    Tab:Space()
    Tab:Divider()

    Tab:Dropdown({
        Title = "Soul Modes",
        Values = { "Default", "Purple" },
        Value = "Default",
        Flag = "SoulModeName",
        Callback = function(option)
            PinksState.SoulModeName = option
            if PinksState.SoulModeOn then
                ApplySoulMode()
            end
        end,
    })
    Tab:Space()
    Tab:Toggle({
        Title = "Mode",
        Value = false,
        Flag = "SoulModeOn",
        Callback = function(state)
            PinksState.SoulModeOn = state
            if state then
                ApplySoulMode()
            else
                pcall(function()
                    RescanBossCache(true)
                    for _, v in pairs(BossCache.Soul) do
                        if type(v.SetMode) == "function" then
                            v:SetMode("Default")
                        end
                    end
                end)
            end
        end,
    })

    Tab:Space()
    Tab:Divider()

    Tab:Section({ Title = "Fight" })

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
    Tab:Toggle({
        Title = "Proceed.",
        Value = false,
        Flag = "ProceedSnowgrave",
        Callback = function(state)
            PinksState.ProceedSnowgrave = state
            ApplyProceedSnowgrave(state)
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

    Tab:Section({ Title = "Gerson" })
    Tab:Toggle({
        Title = "Auto Orient Shield / Parry",
        Value = false,
        Flag = "GersonShield",
        Callback = function(state)
            PinksState.GersonShield = state
            if state then
                RescanBossCache(true)
            end
        end,
    })
    Tab:Space()
    Tab:Slider({
        Title = "Shield Lead",
        Value = 8,
        Min = 0,
        Max = 30,
        Step = 1,
        Flag = "ShieldLead",
        Callback = function(value)
            PinksState.ShieldLead = tonumber(value) or 8
        end,
    })
    Tab:Space()
    Tab:Toggle({
        Title = "Auto Timing Rude Buster",
        Value = false,
        Flag = "GersonRudeTiming",
        Callback = function(state)
            PinksState.GersonRudeTiming = state
            if state then
                RescanBossCache(true)
            end
        end,
    })
    Tab:Space()
    Tab:Slider({
        Title = "Rude X Min",
        Value = 200,
        Min = 50,
        Max = 400,
        Step = 5,
        Flag = "RudeXMin",
        Callback = function(value)
            PinksState.RudeXMin = tonumber(value) or 200
        end,
    })
    Tab:Space()
    Tab:Slider({
        Title = "Rude X Max",
        Value = 330,
        Min = 100,
        Max = 500,
        Step = 5,
        Flag = "RudeXMax",
        Callback = function(value)
            PinksState.RudeXMax = tonumber(value) or 330
        end,
    })
    Tab:Space()
    Tab:Divider()

    Tab:Section({ Title = "Pink" })
    Tab:Toggle({
        Title = "Aura Collect Hearts",
        Value = false,
        Flag = "PinkHearts",
        Callback = function(state)
            PinksState.PinkHearts = state
        end,
    })
    Tab:Space()
    Tab:Toggle({
        Title = "Auto Date Answers",
        Value = false,
        Flag = "PinkDateAuto",
        Callback = function(state)
            PinksState.PinkDateAuto = state
            if state then
                RescanBossCache(true)
            end
        end,
    })
    Tab:Space()
    Tab:Divider()

    Tab:Section({ Title = "Tenna" })
    Tab:Toggle({
        Title = "Force Max Score",
        Value = false,
        Flag = "TennaMaxScore",
        Callback = function(state)
            PinksState.TennaMaxScore = state
            if state then
                RescanBossCache(true)
            end
        end,
    })
    Tab:Space()
    Tab:Divider()

    Tab:Section({ Title = "Knight" })
    Tab:Toggle({
        Title = "Skip Phase / Roaring",
        Value = false,
        Flag = "KnightSkipPhase",
        Callback = function(state)
            PinksState.KnightSkipPhase = state
            if state then
                RescanBossCache(true)
            end
        end,
    })
    Tab:Space()

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

    Tab:Section({ Title = "Saves" })

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

    Tab:Section({ Title = "UI" })

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
