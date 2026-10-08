local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local IsMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local function TableClear(t)
    if type(t) ~= "table" then
        return
    end
    for k in pairs(t) do
        t[k] = nil
    end
end

local function SafeHttpGet(url)
    local result = nil
    if type(game.HttpGet) == "function" then
        local ok, res = pcall(function()
            return game:HttpGet(url)
        end)
        if ok and type(res) == "string" and res ~= "" then
            return res
        end
    end
    if type(game.HttpGetAsync) == "function" then
        local ok, res = pcall(function()
            return game:HttpGetAsync(url)
        end)
        if ok and type(res) == "string" and res ~= "" then
            return res
        end
    end
    return result
end

local function SafeLoadstring(code)
    local loader = loadstring or load
    if type(loader) ~= "function" then
        return nil
    end
    local ok, fn = pcall(loader, code)
    if ok and type(fn) == "function" then
        return fn
    end
    return nil
end

local WindUI = nil
do
    local urls = {
        "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua",
        "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua",
    }
    for i = 1, #urls do
        local srcCode = SafeHttpGet(urls[i])
        if type(srcCode) == "string" and srcCode ~= "" then
            local fn = SafeLoadstring(srcCode)
            if type(fn) == "function" then
                local okRun, result = pcall(fn)
                if okRun and type(result) == "table" and type(result.CreateWindow) == "function" then
                    WindUI = result
                    break
                end
            end
        end
    end
end

if type(WindUI) ~= "table" or type(WindUI.CreateWindow) ~= "function" then
    return
end

pcall(function()
    if type(WindUI.Notify) == "function" then
        WindUI:Notify({
            Title = "Deltarune | SW",
            Content = "It might take a while or you might experience some lag loading, so please be patient, and if it doesn't load or something else happens, please let us know.",
            Duration = 8,
            Icon = "info",
        })
    end
end)

local Green  = Color3.fromRGB(16, 197, 80)
local Red    = Color3.fromRGB(239, 79, 29)
local Orange = Color3.fromRGB(249, 115, 22)

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
    DateFreezeTime = false,
    DumbAttack = false,
    SoulSpeed = 1,
    SoulMode = "Default",
    AutoSpamShots = false,
    NoChargeShots = false,
    SuperChargeSusieAct = false,
    AutoDateAnswers = false,
    CustomDokiAmount = 100,
    CustomMercyAmount = 100,
    AssignActor = "Kris",
    AssignSpell = "RudeBuster",
    AssignAct = "Check",
    _TPAmount = 10,
    _HPAmount = 0,
    ArmorActor = "Kris",
    Armor1 = "",
    Armor2 = "",
            AutoDefendParty = false,
        ShowEnemyHP = false,
    AntiStealItems = false,
    WeaponActor = "Kris",
    WeaponName = "",
    MusicTrack = "",
    DefaultMusicTrack = nil,
    UIColor = "Dark",
    PartyActorFrom = "Kris",
    PartyActorTo = "Susie",
    SpawnItemName = "Dark Candy",
    InfiniteInventory = false,
    StatActor = "Kris",
    StatName = "Attack",
    StatAmount = 999,
}

local ActRegistry = {
    Items = {},
    Options = {},
    Map = {},
    LastScan = 0,
}
local PendingActs = {}
local PendingSpells = {}
local ForcedSpellIds = {}
local MagicHooksInstalled = false

local ConfigFolder = "DeltaruneSW/Configs"
local ConfigNameValue = "Default"
local ConfigFileList = { "Default" }

local function EnsureConfigFolder()
    if not makefolder then
        return
    end
    pcall(function()
        makefolder("DeltaruneSW")
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
        SoulSpeed = PinksState.SoulSpeed or 1,
        SoulMode = PinksState.SoulMode or "Default",
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

local ApplyConfig = function() end
local ApplyProceedSnowgrave = function() end
local ApplyFreeSpells = function() end
local ApplyFreeActs = function() end

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
    if type(ApplyConfig) == "function" then
        ApplyConfig(data)
    end
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

local function IsTensionController(v)
    if type(v) ~= "table" then
        return false
    end
    if type(rawget(v, "Tension")) ~= "number" then
        return false
    end
    if type(rawget(v, "TensionMax")) ~= "number" then
        return false
    end
    if rawget(v, "TensionBar") ~= nil then
        return true
    end
    if type(rawget(v, "AddTension")) == "function" or type(rawget(v, "ApplyTension")) == "function" then
        return true
    end
    if type(rawget(v, "StepTensionBar")) == "function" then
        return true
    end
    return false
end

local function IsTensionBar(v)
    return type(v) == "table"
        and type(rawget(v, "Apparent")) == "number"
        and type(rawget(v, "Current")) == "number"
        and (type(rawget(v, "Snap")) == "function" or type(rawget(v, "Chase")) == "function" or rawget(v, "Root") ~= nil)
end

local function IsPartyMemberHP(v)
    if type(v) ~= "table" then
        return false
    end
    if type(rawget(v, "HP")) ~= "number" or type(rawget(v, "MaxHP")) ~= "number" then
        return false
    end
    if rawget(v, "Down") ~= nil or rawget(v, "Swooned") ~= nil then
        return true
    end
    if rawget(v, "Key") ~= nil or rawget(v, "Slot") ~= nil then
        return true
    end
    if type(rawget(v, "Heal")) == "function" then
        return true
    end
    return false
end

local function RescanCache(force)
    local now = os.clock()
    local throttle = 10
    local hasCache = #Cache.TensionTables > 0 or #Cache.HPTables > 0 or #Cache.SoulTables > 0 or #Cache.BattleTables > 0
    if force == "hard" then
        Cache.LastScan = 0
    elseif force and hasCache and (now - Cache.LastScan < 4) then
        return
    elseif not force and now - Cache.LastScan < throttle then
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
            if type(v) == "table" then
                if IsTensionBar(v) then
                    table.insert(tensionBars, v)
                end
                if IsTensionController(v) then
                    table.insert(tensionTables, v)
                elseif type(rawget(v, "Tension")) == "number" and type(rawget(v, "TensionMax")) == "number" then
                    table.insert(tensionTables, v)
                end
                if rawget(v, "Invuln") ~= nil and type(rawget(v, "HP")) == "number" and type(rawget(v, "MaxHP")) == "number" then
                    table.insert(soulTables, v)
                end
                if IsPartyMemberHP(v) then
                    table.insert(hpTables, v)
                end
                if type(rawget(v, "ClearBullets")) == "function" or type(rawget(v, "Bullets")) == "table" then
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

local function ApplyTPValue(value)
    local max = GetTensionMax()
    value = math.clamp(tonumber(value) or max, 0, max)
    for _, v in pairs(Cache.TensionTables) do
        local tmax = tonumber(rawget(v, "TensionMax")) or max
        if tmax < 1 then
            tmax = max
        end
        local setTo = math.clamp(value, 0, tmax)
        rawset(v, "Tension", setTo)
        if type(rawget(v, "TensionMax")) == "number" and v.TensionMax < setTo then
            rawset(v, "TensionMax", math.max(tmax, setTo))
        end
        local bar = rawget(v, "TensionBar")
        if type(bar) == "table" then
            if type(bar.Snap) == "function" then
                pcall(function()
                    bar:Snap(setTo)
                end)
            else
                rawset(bar, "Apparent", setTo)
                rawset(bar, "Current", setTo)
            end
        end
    end
    for _, v in pairs(Cache.TensionBars) do
        if type(rawget(v, "Snap")) == "function" then
            pcall(function()
                v:Snap(value)
            end)
        else
            rawset(v, "Apparent", value)
            rawset(v, "Current", value)
        end
    end
end

local function ForceTP(amount)
    local max = GetTensionMax()
    local value = math.clamp(tonumber(amount) or max, 0, max)
    RescanCache("hard")
    pcall(function()
        local battle = nil
        if type(FindLiveBattleController) == "function" then
            battle = FindLiveBattleController()
        end
        if type(battle) == "table" and type(rawget(battle, "Tension")) == "number" then
            local tmax = tonumber(rawget(battle, "TensionMax")) or max
            if tmax < 1 then
                tmax = max
            end
            local setTo = math.clamp(value, 0, tmax)
            rawset(battle, "Tension", setTo)
            local bar = rawget(battle, "TensionBar")
            if type(bar) == "table" then
                if type(bar.Snap) == "function" then
                    pcall(function()
                        bar:Snap(setTo)
                    end)
                else
                    rawset(bar, "Apparent", setTo)
                    rawset(bar, "Current", setTo)
                end
            end
        end
        ApplyTPValue(value)
    end)
end

local LiveBattleCache = {
    Battle = nil,
    LastScan = 0,
}

local function FindLiveBattleController(force)
    local now = os.clock()
    local cacheTtl = force and 2 or 10
    if LiveBattleCache.Battle ~= nil and (now - LiveBattleCache.LastScan) < cacheTtl then
        local cached = LiveBattleCache.Battle
        if type(cached) == "table" and type(rawget(cached, "Roster")) == "table" then
            return cached
        end
        LiveBattleCache.Battle = nil
    end

    if not force and LiveBattleCache.Battle == nil and (now - LiveBattleCache.LastScan) < 2 then
        return nil
    end

    local found = nil
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" then
                local roster = rawget(v, "Roster")
                local members = type(roster) == "table" and rawget(roster, "Members") or nil
                if type(members) == "table" and #members > 0 then
                    local battle = rawget(v, "Battle")
                    local hasSoul = type(battle) == "table" and (rawget(battle, "Soul") ~= nil or type(rawget(battle, "Souls")) == "table")
                    local hasTurn = type(rawget(v, "StartEnemyTurn")) == "function"
                        or type(rawget(v, "EnterVictory")) == "function"
                        or type(rawget(v, "RefreshUi")) == "function"
                        or rawget(v, "State") ~= nil
                        or hasSoul
                    if hasTurn or hasSoul then
                        found = v
                        break
                    end
                end
            end
        end
    end)

    LiveBattleCache.Battle = found
    LiveBattleCache.LastScan = now
    return found
end

local function GetLiveSoul(battle)
    if type(battle) ~= "table" then
        return nil
    end
    local b = rawget(battle, "Battle")
    if type(b) == "table" then
        local soul = rawget(b, "Soul")
        if type(soul) == "table" then
            return soul
        end
        local souls = rawget(b, "Souls")
        if type(souls) == "table" then
            for _, s in pairs(souls) do
                if type(s) == "table" and rawget(s, "Invuln") ~= nil then
                    return s
                end
            end
        end
    end
    return nil
end

local function ForEachLiveSoul(battle, fn)
    if type(battle) ~= "table" or type(fn) ~= "function" then
        return
    end
    local b = rawget(battle, "Battle")
    if type(b) == "table" then
        local soul = rawget(b, "Soul")
        if type(soul) == "table" then
            fn(soul)
        end
        local souls = rawget(b, "Souls")
        if type(souls) == "table" then
            for _, s in pairs(souls) do
                if type(s) == "table" then
                    fn(s)
                end
            end
        end
    end
end

local function UnlockTPNow()
    local max = GetTensionMax()
    RescanCache("hard")
    pcall(function()
        local battle = nil
        if type(FindLiveBattleController) == "function" then
            battle = FindLiveBattleController()
        end
        if type(battle) == "table" then
            if type(rawget(battle, "SetTensionMax")) == "function" then
                pcall(function()
                    battle:SetTensionMax(max)
                end)
            end
            rawset(battle, "TensionMax", max)
            local bar = rawget(battle, "TensionBar")
            if type(bar) == "table" then
                if type(bar.Snap) == "function" then
                    pcall(function()
                        bar:Snap(tonumber(rawget(battle, "Tension")) or 0)
                    end)
                else
                    rawset(bar, "Apparent", tonumber(rawget(battle, "Tension")) or 0)
                    rawset(bar, "Current", tonumber(rawget(battle, "Tension")) or 0)
                end
            end
        end
        for _, v in pairs(Cache.TensionTables) do
            if type(rawget(v, "SetTensionMax")) == "function" then
                pcall(function()
                    v:SetTensionMax(max)
                end)
            end
            rawset(v, "TensionMax", max)
            local bar = rawget(v, "TensionBar")
            if type(bar) == "table" then
                if type(bar.Snap) == "function" then
                    pcall(function()
                        bar:Snap(tonumber(rawget(v, "Tension")) or 0)
                    end)
                end
            end
        end
    end)
end

local function MaxDokiMeterNow()
    local changed = 0
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" then
                local doki = rawget(v, "Doki")
                local dokiMax = rawget(v, "DokiMax")
                if type(doki) == "number" and type(dokiMax) == "number" and dokiMax > 0 then
                    rawset(v, "Doki", dokiMax)
                    changed += 1
                end
            end
        end
    end)
    return changed > 0
end

local function LightPartyHPFull()
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then
        return
    end
    local roster = rawget(battle, "Roster")
    local members = type(roster) == "table" and rawget(roster, "Members") or nil
    if type(members) ~= "table" then
        return
    end
    for _, member in ipairs(members) do
        if type(member) == "table" and (type(IsLocalPartyMember) ~= "function" or IsLocalPartyMember(member)) then
            local maxhp = tonumber(rawget(member, "MaxHP"))
            if type(maxhp) == "number" and maxhp > 0 then
                rawset(member, "HP", maxhp)
                if rawget(member, "Down") == true then
                    rawset(member, "Down", false)
                end
            end
        end
    end
end

local function ForcePartyHPFull()
    pcall(function()
        local battle = FindLiveBattleController(true)
        if type(battle) == "table" then
            local roster = rawget(battle, "Roster")
            local members = type(roster) == "table" and rawget(roster, "Members") or nil
            if type(members) == "table" then
                for _, member in ipairs(members) do
                    if type(member) == "table" and (type(IsLocalPartyMember) ~= "function" or IsLocalPartyMember(member)) then
                        local maxhp = tonumber(rawget(member, "MaxHP"))
                        if type(maxhp) == "number" and maxhp > 0 then
                            rawset(member, "HP", maxhp)
                            rawset(member, "Down", false)
                            rawset(member, "Swooned", false)
                            if type(member.Heal) == "function" then
                                pcall(function()
                                    member:Heal(maxhp)
                                end)
                            end
                        end
                    end
                end
            end
            ForEachLiveSoul(battle, function(soul)
                local maxhp = tonumber(rawget(soul, "MaxHP"))
                if type(maxhp) == "number" and maxhp > 0 then
                    rawset(soul, "HP", maxhp)
                end
            end)
            if type(rawget(battle, "RefreshUi")) == "function" then
                pcall(function()
                    battle:RefreshUi()
                end)
            end
        end
        for _, v in pairs(Cache.HPTables) do
            local maxhp = rawget(v, "MaxHP")
            if type(maxhp) == "number" and maxhp > 0 then
                rawset(v, "HP", maxhp)
                rawset(v, "Down", false)
                if rawget(v, "Swooned") ~= nil then
                    rawset(v, "Swooned", false)
                end
            end
        end
        for _, v in pairs(Cache.SoulTables) do
            local maxhp = rawget(v, "MaxHP")
            if type(maxhp) == "number" and maxhp > 0 then
                rawset(v, "HP", maxhp)
            end
        end
    end)
end

local function GivePartyHP(amount)
    amount = tonumber(amount) or 0
    if amount == 0 then
        return
    end
    pcall(function()
        local battle = FindLiveBattleController(true)
        if type(battle) == "table" then
            local roster = rawget(battle, "Roster")
            local members = type(roster) == "table" and rawget(roster, "Members") or nil
            if type(members) == "table" then
                for _, member in ipairs(members) do
                    if type(member) == "table" and type(rawget(member, "HP")) == "number" and (type(IsLocalPartyMember) ~= "function" or IsLocalPartyMember(member)) then
                        local maxhp = tonumber(rawget(member, "MaxHP")) or 9999
                        local cur = tonumber(rawget(member, "HP")) or 0
                        local nhp = math.min(cur + amount, maxhp)
                        if amount < 0 then
                            nhp = math.max(0, cur + amount)
                        end
                        rawset(member, "HP", nhp)
                        if nhp > 0 then
                            rawset(member, "Down", false)
                            rawset(member, "Swooned", false)
                        end
                        if type(member.Heal) == "function" and amount > 0 then
                            pcall(function()
                                member:Heal(amount)
                            end)
                        end
                    end
                end
            end
            if type(rawget(battle, "RefreshUi")) == "function" then
                pcall(function()
                    battle:RefreshUi()
                end)
            end
        end
        if #Cache.HPTables == 0 then
            RescanCache("hard")
        end
        for _, v in pairs(Cache.HPTables) do
            if type(rawget(v, "HP")) == "number" and type(rawget(v, "MaxHP")) == "number" then
                local nhp = math.min(v.HP + amount, v.MaxHP)
                rawset(v, "HP", nhp)
                if nhp > 0 then
                    rawset(v, "Down", false)
                    if rawget(v, "Swooned") ~= nil then
                        rawset(v, "Swooned", false)
                    end
                end
            end
        end
    end)
end

local function ClearLiveBattleAttacks(battle)
    if type(battle) ~= "table" then
        return
    end
    local b = rawget(battle, "Battle")
    if type(b) ~= "table" then
        b = battle
    end
    pcall(function()
        if type(b.ClearBullets) == "function" then
            b:ClearBullets()
        elseif type(rawget(b, "Bullets")) == "table" then
            for i = #b.Bullets, 1, -1 do
                local bullet = b.Bullets[i]
                if type(bullet) == "table" then
                    rawset(bullet, "Harmful", false)
                    rawset(bullet, "Damage", 0)
                    if type(bullet.Destroy) == "function" then
                        pcall(function()
                            bullet:Destroy()
                        end)
                    end
                end
                table.remove(b.Bullets, i)
            end
        end
        if type(rawget(b, "Grazes")) == "table" then
            for _, g in pairs(b.Grazes) do
                if type(g) == "table" and type(g.Clear) == "function" then
                    pcall(function()
                        g:Clear()
                    end)
                end
            end
        end
        local waves = rawget(b, "Waves")
        if type(waves) == "table" then
            for _, w in pairs(waves) do
                if type(w) == "table" then
                    local wb = rawget(w, "Bullets")
                    if type(wb) == "table" then
                        for i = #wb, 1, -1 do
                            local bullet = wb[i]
                            if type(bullet) == "table" then
                                rawset(bullet, "Harmful", false)
                                rawset(bullet, "Damage", 0)
                                if type(bullet.Destroy) == "function" then
                                    pcall(function()
                                        bullet:Destroy()
                                    end)
                                end
                            end
                            table.remove(wb, i)
                        end
                    end
                end
            end
        end
    end)
    pcall(function()
        local fightState = rawget(battle, "FightState")
        if type(fightState) == "table" then
            local scene = rawget(fightState, "LiveScene") or rawget(fightState, "Scene")
            if type(scene) == "table" and type(scene.DestroyBullets) == "function" then
                scene:DestroyBullets()
            end
            for _, key in ipairs({ "Attack", "AttackController", "CurrentAttack", "ActiveAttack", "Wave" }) do
                local atk = rawget(fightState, key)
                if type(atk) == "table" then
                    if type(atk.DestroyBullets) == "function" then
                        pcall(function()
                            atk:DestroyBullets()
                        end)
                    end
                    local sc = atk.Scene
                    if type(sc) == "table" and type(sc.DestroyBullets) == "function" then
                        pcall(function()
                            sc:DestroyBullets()
                        end)
                    end
                end
            end
        end
        local fight = rawget(battle, "Fight")
        if type(fight) == "table" then
            local scene = rawget(fight, "LiveScene") or rawget(fight, "Scene")
            if type(scene) == "table" and type(scene.DestroyBullets) == "function" then
                pcall(function()
                    scene:DestroyBullets()
                end)
            end
        end
    end)
end

local function InstallDeleteAttackHooks(battle)
    if type(battle) ~= "table" then
        return
    end
    local b = rawget(battle, "Battle")
    if type(b) ~= "table" then
        b = battle
    end
    if rawget(b, "_SWDeleteAttackHook") == true then
        return
    end
    rawset(b, "_SWDeleteAttackHook", true)

    local originalStep = b.Step
    if type(originalStep) == "function" then
        rawset(b, "Step", function(self, ...)
            local result = originalStep(self, ...)
            if PinksState.DeleteStinky then
                pcall(function()
                    ClearLiveBattleAttacks(LiveBattleCache.Battle or battle)
                end)
            end
            return result
        end)
    end
end

local function LightClearAttacks()
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then
        return
    end
    ClearLiveBattleAttacks(battle)
end

local function ClearBulletsNow()
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then
        battle = FindLiveBattleController(false)
    end
    if type(battle) == "table" then
        InstallDeleteAttackHooks(battle)
        ClearLiveBattleAttacks(battle)
        return
    end
    pcall(function()
        for _, v in pairs(Cache.BattleTables) do
            if type(v) == "table" and type(rawget(v, "ClearBullets")) == "function" then
                pcall(function()
                    v:ClearBullets()
                end)
            end
        end
    end)
end

local function GetNetModule()
    local net = nil
    pcall(function()
        net = require(ReplicatedStorage.Core.System.Net)
    end)
    return net
end

local function BroadcastWinSync()
    local Net = GetNetModule()
    if not Net or type(Net.SendSync) ~= "function" then
        return
    end
    pcall(function()
        Net.SendSync({ Win = 1 })
    end)
end

local function ZeroAllEnemiesOn(ctrl)
    if type(rawget(ctrl, "EnemyHP")) == "number" then
        rawset(ctrl, "EnemyHP", 0)
    end
    local enemies = rawget(ctrl, "Enemies")
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
    if type(ctrl.EnemyList) == "function" then
        pcall(function()
            for _, enemy in pairs(ctrl:EnemyList()) do
                if type(enemy) == "table" then
                    rawset(enemy, "HP", 0)
                    if type(ctrl.SyncEnemyAlive) == "function" then
                        pcall(function()
                            ctrl:SyncEnemyAlive(enemy)
                        end)
                    end
                end
            end
        end)
    end
end

local function InstantWinNow()
    pcall(function()
        local fired = false
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "table" and type(rawget(v, "EnterVictory")) == "function" and rawget(v, "Roster") ~= nil then
                ZeroAllEnemiesOn(v)
                pcall(function()
                    local battle = rawget(v, "Battle")
                    if type(battle) == "table" then
                        if type(battle.StopWaves) == "function" then
                            battle:StopWaves()
                        end
                        if type(battle.ClearBullets) == "function" then
                            battle:ClearBullets()
                        end
                    end
                end)
                BroadcastWinSync()
                pcall(function()
                    v:EnterVictory()
                end)
                fired = true
            end
        end
        if not fired then
            for _, v in pairs(getgc(true)) do
                if typeof(v) == "table" then
                    ZeroAllEnemiesOn(v)
                    if type(v.EnterVictory) == "function" then
                        BroadcastWinSync()
                        pcall(function()
                            v:EnterVictory()
                        end)
                    end
                end
            end
        end
        BroadcastWinSync()
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

local function IsLocalPartyMember(member)
    if type(member) ~= "table" then
        return false
    end
    local owner = rawget(member, "Owner")
    if owner == nil then
        return true
    end
    local localId = nil
    pcall(function()
        local Net = require(ReplicatedStorage.Core.System.Net)
        if type(Net) == "table" then
            if type(Net.LocalId) == "function" then
                localId = Net.LocalId()
            else
                localId = rawget(Net, "LocalId")
            end
            if type(Net.Solo) == "function" and Net.Solo() then
                localId = owner
            end
        end
    end)
    if localId == nil then
        return true
    end
    return owner == localId
end

local GodModeSoulHooksInstalled = false

local function PatchGodModeSoul(soul)
    if type(soul) ~= "table" then
        return
    end
    if rawget(soul, "_SWGodModePatched") ~= true then
        local originalDamage = soul.Damage
        if type(originalDamage) == "function" then
            rawset(soul, "_SWOriginalDamage", originalDamage)
            rawset(soul, "Damage", function(self, ...)
                if PinksState.GodMode then
                    rawset(self, "Invuln", 99999)
                    return false
                end
                return originalDamage(self, ...)
            end)
        end
        rawset(soul, "_SWGodModePatched", true)
    end
    if PinksState.GodMode then
        rawset(soul, "Invuln", 99999)
    else
        if type(rawget(soul, "Invuln")) == "number" and rawget(soul, "Invuln") > 100 then
            rawset(soul, "Invuln", -1)
        end
    end
end

local function PatchPartyMemberGodMode(member)
    if type(member) ~= "table" then
        return
    end
    if not IsLocalPartyMember(member) then
        return
    end
    if rawget(member, "_SWGodMemberPatched") ~= true then
        local originalDamage = member.Damage
        if type(originalDamage) == "function" then
            rawset(member, "_SWOriginalMemberDamage", originalDamage)
            rawset(member, "Damage", function(self, value, opts)
                if PinksState.GodMode then
                    if rawget(self, "Down") == true or rawget(self, "Swooned") == true then
                        return 0
                    end
                    return 0
                end
                return originalDamage(self, value, opts)
            end)
        end
        rawset(member, "_SWGodMemberPatched", true)
    end
end

local function ApplyGodModeLive()
    if not PinksState.GodMode then
        return
    end
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then
        return
    end
    ForEachLiveSoul(battle, function(soul)
        rawset(soul, "Invuln", 99999)
    end)
end

local function InstallGodModeSoulHooks()
    if GodModeSoulHooksInstalled then
        return
    end
    pcall(function()
        local SoulModule = require(ReplicatedStorage.Core.Combat.Soul)
        local originalNew = rawget(SoulModule, "_SWGodOriginalNew")
        if type(originalNew) ~= "function" and type(SoulModule.New) == "function" then
            originalNew = SoulModule.New
            rawset(SoulModule, "_SWGodOriginalNew", originalNew)
        end
        if type(originalNew) ~= "function" then
            return
        end
        SoulModule.New = function(...)
            local soul = originalNew(...)
            PatchGodModeSoul(soul)
            if PinksState.FreeSoulToggle and type(PatchFreeSoulInstance) == "function" then
                PatchFreeSoulInstance(soul)
            end
            return soul
        end
        GodModeSoulHooksInstalled = true
    end)
end

local function ApplyGodMode(on)
    PinksState.GodMode = on == true
    InstallGodModeSoulHooks()
    if on then
        local battle = FindLiveBattleController(true)
        if type(battle) == "table" then
            ForEachLiveSoul(battle, function(soul)
                PatchGodModeSoul(soul)
            end)
            local roster = rawget(battle, "Roster")
            local members = type(roster) == "table" and rawget(roster, "Members") or nil
            if type(members) == "table" then
                for _, member in ipairs(members) do
                    PatchPartyMemberGodMode(member)
                end
            end
        end
    else
        local battle = LiveBattleCache.Battle
        if type(battle) == "table" then
            ForEachLiveSoul(battle, function(soul)
                if type(rawget(soul, "Invuln")) == "number" and rawget(soul, "Invuln") > 100 then
                    rawset(soul, "Invuln", -1)
                end
            end)
        end
    end
end

local FreeSoulHooksInstalled = false

local function PatchFreeSoulInstance(soul)
    if type(soul) ~= "table" then
        return
    end

    if rawget(soul, "_SWFreeSoulPatched") ~= true then
        local originalIsBlocked = soul.IsBlocked
        local originalClampToArea = soul.ClampToArea

        if type(originalIsBlocked) == "function" then
            rawset(soul, "_SWOriginalIsBlocked", originalIsBlocked)
            rawset(soul, "IsBlocked", function(self, x, y)
                if PinksState.FreeSoulToggle then
                    return false
                end
                return originalIsBlocked(self, x, y)
            end)
        end

        if type(originalClampToArea) == "function" then
            rawset(soul, "_SWOriginalClampToArea", originalClampToArea)
            rawset(soul, "ClampToArea", function(self, ...)
                if PinksState.FreeSoulToggle then
                    return
                end
                return originalClampToArea(self, ...)
            end)
        end

        rawset(soul, "_SWFreeSoulPatched", true)
    end

    if PinksState.FreeSoulToggle then
        rawset(soul, "FreeRoam", true)
        rawset(soul, "Locked", false)
        if rawget(soul, "Frozen") ~= nil then
            rawset(soul, "Frozen", false)
        end
        local solids = rawget(soul, "Solids")
        if type(solids) == "table" then
            TableClear(solids)
        end
    else
        rawset(soul, "FreeRoam", false)
        if rawget(soul, "Locked") ~= nil then
            rawset(soul, "Locked", false)
        end
        local originalClamp = rawget(soul, "_SWOriginalClampToArea")
        if type(originalClamp) == "function" then
            pcall(function()
                originalClamp(soul)
            end)
        elseif type(soul.ClampToArea) == "function" then
            pcall(function()
                soul:ClampToArea()
            end)
        end
    end
end

local function InstallFreeSoulHooks()
    if FreeSoulHooksInstalled then
        return
    end

    pcall(function()
        local SoulModule = require(ReplicatedStorage.Core.Combat.Soul)

        local originalNew = rawget(SoulModule, "_SWOriginalNew")

        if type(originalNew) ~= "function" and type(SoulModule.New) == "function" then
            originalNew = SoulModule.New
            rawset(SoulModule, "_SWOriginalNew", originalNew)
        end

        if type(originalNew) ~= "function" then
            return
        end

        SoulModule.New = function(...)
            local soul = originalNew(...)
            PatchFreeSoulInstance(soul)
            if PinksState.GodMode then
                PatchGodModeSoul(soul)
            end
            return soul
        end

        FreeSoulHooksInstalled = true
    end)
end

local function ApplyFreeSoul(on)
    PinksState.FreeSoulToggle = on == true
    InstallFreeSoulHooks()

    if #Cache.SoulTables == 0 then
        RescanCache("hard")
    end

    pcall(function()
        local Config = GetConfig()
        if Config and type(Config.Soul) == "table" then
            if on then
                if rawget(Config.Soul, "_SWOriginalClampFlag") == nil then
                    rawset(Config.Soul, "_SWOriginalClampFlag", Config.Soul.ClampToBattleArea)
                end
                Config.Soul.ClampToBattleArea = false
            else
                local original = rawget(Config.Soul, "_SWOriginalClampFlag")
                if original ~= nil then
                    Config.Soul.ClampToBattleArea = original
                else
                    Config.Soul.ClampToBattleArea = true
                end
            end
        end
    end)

    pcall(function()
        for _, soul in pairs(Cache.SoulTables) do
            PatchFreeSoulInstance(soul)
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
    PinksState.SoulSpeed = tonumber(data.SoulSpeed) or 1
    PinksState.SoulMode = (data.SoulMode == "Yellow" or data.SoulMode == "Purple") and data.SoulMode or "Default"
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
        if #Cache.TensionTables == 0 then RescanCache(true) end
        ForceTP(GetTensionMax())
    end

    pcall(function()
        WindUI:SetTheme(PinksState.UIColor)
    end)

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

local function GetSpellsModule()
    local ok, Spells = pcall(require, ReplicatedStorage.Core.Data.Spells)
    if ok and type(Spells) == "table" then
        return Spells
    end
    return nil
end

local BossCache = {
    Tenna = {},
    Last = 0,
}

local function RescanBossCache(force)
    local now = os.clock()
    if not force and now - BossCache.Last < 1.5 then
        return
    end
    BossCache.Last = now
    local tenna = {}
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "table" then
                local score = rawget(v, "Score")
                local maxScore = rawget(v, "MaxScore")
                if type(score) == "number" and type(maxScore) == "number" then
                    table.insert(tenna, v)
                end
            end
        end
    end)
    BossCache.Tenna = tenna
end

local GersonSceneCache = {
    Scene = nil,
    LastFallbackScan = 0,
}

local function IsLiveGersonSpearScene(scene)
    return type(scene) == "table"
        and rawget(scene, "Done") ~= true
        and type(rawget(scene, "Spears")) == "table"
        and rawget(scene, "Soul") ~= nil
        and rawget(scene, "Api") ~= nil
        and rawget(scene, "Battle") ~= nil
        and type(rawget(scene, "SpawnShield")) == "function"
end

local function GetGersonSpearScene(forceScan)
    local cached = GersonSceneCache.Scene
    if cached and IsLiveGersonSpearScene(cached) then
        return cached
    end

    if cached then
        GersonSceneCache.Scene = nil
        GersonSceneCache.LastFallbackScan = 0
    end

    if not (GersonBodyModule and GersonBodyModule.Current) then
        return nil
    end

    if not getgc then
        return nil
    end

    local now = os.clock()
    if not forceScan and now - GersonSceneCache.LastFallbackScan < 0.5 then
        return nil
    end
    GersonSceneCache.LastFallbackScan = now

    local found = nil
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if IsLiveGersonSpearScene(v) then
                found = v
                break
            end
        end
    end)

    GersonSceneCache.Scene = found
    return found
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
    for _, child in pairs(value) do
        if type(child) == "table" then
            CollectActEntries(child, found, seenTables, seenEntries, depth + 1)
            visited += 1
            if visited >= 4000 then
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

    for _, result in ipairs(LoadRealActModules()) do
        CollectActEntries(result, found, seenTables, seenEntries, 0)
    end

    table.sort(found, function(a, b)
        local an, bn = tostring(a.Name), tostring(b.Name)
        if an == bn then
            return tostring(a.Key) < tostring(b.Key)
        end
        return an < bn
    end)

    local options, map = {}, {}
    for _, item in ipairs(found) do
        local display = item.Name
        local base = display
        local n = 2
        while map[display] do
            display = base .. " [" .. n .. "]"
            n += 1
        end
        map[display] = item
        table.insert(options, display)
    end

    ActRegistry.Items = found
    ActRegistry.Options = options
    ActRegistry.Map = map
    return options
end

local function RefreshActDropdown(dropdown)
    local options = ScanActRegistry(true)
    if dropdown then
        if type(dropdown.Refresh) == "function" then
            pcall(function() dropdown:Refresh(options) end)
        elseif type(dropdown.SetValues) == "function" then
            pcall(function() dropdown:SetValues(options) end)
        elseif type(dropdown.SetOptions) == "function" then
            pcall(function() dropdown:SetOptions(options) end)
        end
    end
    return options
end

local function CloneActEntry(entry, owner, forceFree)
    local clone = table.clone(entry)
    local mt = getmetatable(entry)
    if mt then
        setmetatable(clone, mt)
    end
    clone.Owner = owner or entry.Owner or "Kris"
    clone._PinkInjectedAct = true
    if forceFree then
        clone.Cost = 0
        clone._PinkFreeAct = true
    end
    return clone
end

local function GetRealSpellOptions()
    local Spells = GetSpellsModule()
    local result = {}
    if Spells and type(Spells.Definitions) == "table" then
        for id, definition in pairs(Spells.Definitions) do
            if type(id) == "string" and type(definition) == "table" then
                table.insert(result, id)
            end
        end
    end
    table.sort(result)
    if #result == 0 then
        result = { PinksState.AssignSpell or "RudeBuster" }
    end
    return result
end

local function GetRealActorOptions()
    local result, seen = {}, {}
    local function add(name)
        if type(name) == "string" and not seen[name] then
            seen[name] = true
            table.insert(result, name)
        end
    end

    local Spells = GetSpellsModule()
    if Spells and type(Spells.Loadouts) == "table" then
        for actor in pairs(Spells.Loadouts) do
            add(actor)
        end
    end

    local actItems = ActRegistry.Items
    if type(actItems) ~= "table" then
        ScanActRegistry(false)
        actItems = ActRegistry.Items
    end

    if type(actItems) == "table" then
        for _, item in ipairs(actItems) do
            if item and item.Entry then
                local owner = rawget(item.Entry, "Owner")
                if owner then
                    add(owner)
                end
            end
        end
    end

    table.sort(result)
    if #result == 0 then
        result = { "Kris" }
    end
    return result
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
    PendingActs[actor][source.Key] = CloneActEntry(source.Entry, actor, PinksState.FreeActs)
    return true, source.Name .. " queued for " .. actor .. "."
end

local function AddSpellToActor(actor, spell)
    local Spells = GetSpellsModule()
    if not Spells or type(Spells.Definitions) ~= "table" then
        return false, "Spells definitions are not loaded yet."
    end
    if type(Spells.Definitions[spell]) ~= "table" then
        return false, spell .. " is not present in the game's real Spell definitions."
    end

    PendingSpells[actor] = PendingSpells[actor] or {}
    PendingSpells[actor][spell] = true
    ForcedSpellIds[spell] = true
    return true, spell .. " queued for " .. actor .. "."
end

local function InstallMagicHooks()
    if MagicHooksInstalled then
        return
    end

    local Spells = GetSpellsModule()
    if not Spells then
        return
    end

    if type(rawget(Spells, "_PinkOriginalMenu")) ~= "function" and type(Spells.Menu) == "function" then
        rawset(Spells, "_PinkOriginalMenu", Spells.Menu)
    end
    if type(rawget(Spells, "_PinkOriginalCostFor")) ~= "function" and type(Spells.CostFor) == "function" then
        rawset(Spells, "_PinkOriginalCostFor", Spells.CostFor)
    end
    if type(rawget(Spells, "_PinkOriginalGet")) ~= "function" and type(Spells.Get) == "function" then
        rawset(Spells, "_PinkOriginalGet", Spells.Get)
    end

    local originalMenu = rawget(Spells, "_PinkOriginalMenu")
    local originalCostFor = rawget(Spells, "_PinkOriginalCostFor")
    local originalGet = rawget(Spells, "_PinkOriginalGet")

    if originalMenu then
        Spells.Menu = function(actor, chapter, fight, roster, member)
            local result = originalMenu(actor, chapter, fight, roster, member)
            if type(result) ~= "table" then
                result = {}
            end

            local pending = PendingSpells[actor]
            if pending then
                local present = {}
                for _, id in ipairs(result) do
                    present[id] = true
                end
                for id in pairs(pending) do
                    if not present[id] and type(Spells.Definitions[id]) == "table" then
                        table.insert(result, id)
                    end
                end
            end

            return result
        end
    end

    if originalGet then
        Spells.Get = function(id, chapter, fightId)
            local result = originalGet(id, chapter, fightId)
            if result ~= nil or not ForcedSpellIds[id] then
                return result
            end

            local definition = type(Spells.Definitions) == "table" and Spells.Definitions[id]
            if type(definition) == "table" and rawget(definition, "Available") == false then
                local oldAvailable = definition.Available
                rawset(definition, "Available", nil)
                result = originalGet(id, chapter, fightId)
                rawset(definition, "Available", oldAvailable)
            end
            return result
        end
    end

    if originalCostFor then
        Spells.CostFor = function(entry, weapon)
            if PinksState.FreeSpells then
                return 0
            end
            return originalCostFor(entry, weapon)
        end
    end

    if ActsModule then
    if type(rawget(ActsModule, "_PinkOriginalAvailable")) ~= "function" and type(ActsModule.Available) == "function" then
        rawset(ActsModule, "_PinkOriginalAvailable", ActsModule.Available)
    end
    if type(rawget(ActsModule, "_PinkOriginalCanUse")) ~= "function" and type(ActsModule.CanUse) == "function" then
        rawset(ActsModule, "_PinkOriginalCanUse", ActsModule.CanUse)
    end

    local originalAvailable = rawget(ActsModule, "_PinkOriginalAvailable")
    local originalCanUse = rawget(ActsModule, "_PinkOriginalCanUse")

    if originalAvailable then
        ActsModule.Available = function(actTable, roster, flags, actor)
            local result = originalAvailable(actTable, roster, flags, actor)
            if type(result) ~= "table" then
                result = {}
            end

            local queued = PendingActs[actor]
            local present = {}
            local nextIndex = #actTable + 1

            for _, item in ipairs(result) do
                if item and item.Entry then
                    present[item.Entry.Key] = true
                    if PinksState.FreeActs and item.Entry.Cost ~= 0 then
                        item.Entry = CloneActEntry(item.Entry, item.Entry.Owner, true)
                    end
                end
            end

            if queued then
                for key, entry in pairs(queued) do
                    if not present[key] and IsActEntry(entry) then
                        local injected = CloneActEntry(entry, actor, PinksState.FreeActs)
                        table.insert(result, {
                            Name = injected.Name,
                            Description = injected.Description,
                            Index = nextIndex,
                            Entry = injected,
                        })
                        present[key] = true
                        nextIndex += 1
                    end
                end
            end

            return result
        end
    end

    if originalCanUse then
        ActsModule.CanUse = function(entry, roster, tension, turns)
            if PinksState.FreeActs then
                return originalCanUse(entry, roster, math.huge, turns)
            end
            return originalCanUse(entry, roster, tension, turns)
        end
    end
    end

    MagicHooksInstalled = true
end

InstallMagicHooks()

ApplyFreeSpells = function(on)
    PinksState.FreeSpells = on == true
    InstallMagicHooks()
end

ApplyFreeActs = function(on)
    PinksState.FreeActs = on == true
    InstallMagicHooks()
end

local PinkDateCache = {
    State = nil,
    LastScan = 0,
    LastQuestion = nil,
    AnsweredForQ = nil,
}

local function IsLivePinkDateStateSafe(state)
    return type(state) == "table"
        and rawget(state, "Done") ~= true
        and type(rawget(state, "DateTimeLeft")) == "number"
        and type(rawget(state, "DateTimeLeftMax")) == "number"
        and rawget(state, "Con") ~= nil
end

local function GetPinkDateStateSafe(forceScan)
    local cached = PinkDateCache.State
    if cached and IsLivePinkDateStateSafe(cached) then
        return cached
    end
    if cached then
        PinkDateCache.State = nil
    end
    local now = os.clock()
    if not forceScan then
        if now - (PinkDateCache.LastScan or 0) < 0.5 then
            return nil
        end
    end
    PinkDateCache.LastScan = now
    if not getgc then
        return nil
    end
    local found = nil
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" then
                if type(rawget(v, "DateTimeLeft")) == "number"
                    and type(rawget(v, "DateTimeLeftMax")) == "number"
                    and rawget(v, "Con") ~= nil
                    and rawget(v, "Done") ~= true then
                    if rawget(v, "ChoiceIsCorrect") ~= nil
                        or rawget(v, "DrawBoxSelected") ~= nil
                        or rawget(v, "BoxCount") ~= nil
                        or rawget(v, "ChoiceSelected") ~= nil then
                        found = v
                        break
                    end
                    if found == nil then
                        found = v
                    end
                end
            end
        end
    end)
    if found then
        PinkDateCache.State = found
    end
    return found
end

local function DateFreezeTimeStep()
    if not PinksState.DateFreezeTime then
        return
    end
    local state = GetPinkDateStateSafe(false)
    if not state then
        state = GetPinkDateStateSafe(true)
    end
    if not state then
        return
    end
    local maxT = rawget(state, "DateTimeLeftMax")
    if type(maxT) == "number" then
        rawset(state, "DateTimeLeft", maxT)
    end
end

local function ApplyDateFreezeTime(on)
    PinksState.DateFreezeTime = on == true
    if on then
        PinkDateCache.State = nil
        PinkDateCache.LastScan = 0
        DateFreezeTimeStep()
    end
end

local DumbAttackCache = {
    LastGcScan = 0,
}

local function FlipBulletForce(b)
    if type(b) ~= "table" then
        return
    end
    if rawget(b, "Harmful") == false then
        return
    end
    local vx = rawget(b, "VX")
    local vy = rawget(b, "VY")
    local hasVel = type(vx) == "number" or type(vy) == "number"
    local hasDir = type(rawget(b, "Direction")) == "number"
    local hasHV = type(rawget(b, "Hspeed")) == "number" or type(rawget(b, "Vspeed")) == "number"
    local data = rawget(b, "Data")
    local dataHV = type(data) == "table" and (
        type(rawget(data, "Hspeed")) == "number" or type(rawget(data, "Vspeed")) == "number"
        or type(rawget(data, "VX")) == "number" or type(rawget(data, "VY")) == "number"
    )
    if not (hasVel or hasDir or hasHV or dataHV) then
        return
    end

    if rawget(b, "_SWOrigVX") == nil and type(vx) == "number" then
        rawset(b, "_SWOrigVX", vx)
    end
    if rawget(b, "_SWOrigVY") == nil and type(vy) == "number" then
        rawset(b, "_SWOrigVY", vy)
    end
    if type(rawget(b, "_SWOrigVX")) == "number" then
        rawset(b, "VX", -rawget(b, "_SWOrigVX"))
    elseif type(vx) == "number" then
        rawset(b, "VX", -vx)
    end
    if type(rawget(b, "_SWOrigVY")) == "number" then
        rawset(b, "VY", -rawget(b, "_SWOrigVY"))
    elseif type(vy) == "number" then
        rawset(b, "VY", -vy)
    end

    local dir = rawget(b, "Direction")
    if type(dir) == "number" then
        if rawget(b, "_SWOrigDir") == nil then
            rawset(b, "_SWOrigDir", dir)
        end
        rawset(b, "Direction", rawget(b, "_SWOrigDir") + math.pi)
    end
    local hs = rawget(b, "Hspeed")
    if type(hs) == "number" then
        if rawget(b, "_SWOrigHS") == nil then
            rawset(b, "_SWOrigHS", hs)
        end
        rawset(b, "Hspeed", -rawget(b, "_SWOrigHS"))
    end
    local vs = rawget(b, "Vspeed")
    if type(vs) == "number" then
        if rawget(b, "_SWOrigVS") == nil then
            rawset(b, "_SWOrigVS", vs)
        end
        rawset(b, "Vspeed", -rawget(b, "_SWOrigVS"))
    end
    if type(data) == "table" then
        for _, key in pairs({ "Hspeed", "Vspeed", "VX", "VY" }) do
            local val = rawget(data, key)
            if type(val) == "number" then
                local ok = "_SWD" .. key
                if rawget(data, ok) == nil then
                    rawset(data, ok, val)
                end
                rawset(data, key, -rawget(data, ok))
            end
        end
    end
end

local function DumbAttackStep()
    if not PinksState.DumbAttack then
        return
    end
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then
        return
    end
    local b = rawget(battle, "Battle")
    if type(b) ~= "table" then
        b = battle
    end
    pcall(function()
        local bullets = rawget(b, "Bullets")
        if type(bullets) == "table" then
            for _, bullet in pairs(bullets) do
                FlipBulletForce(bullet)
            end
        end
    end)
end

local function ApplyDumbAttack(on)
    PinksState.DumbAttack = on == true
    if on and #Cache.BattleTables == 0 then
        RescanCache(false)
    end
end

local FightAttackCache = {
    Controller = nil,
    Rows = setmetatable({}, { __mode = "k" }),
}

local PartyModule = nil
local ItemsModule = nil
local CustomPartyModule = nil

pcall(function()
    PartyModule = require(ReplicatedStorage.Core.Data.Party)
end)
pcall(function()
    ItemsModule = require(ReplicatedStorage.Core.Data.Items)
end)
pcall(function()
    CustomPartyModule = require(ReplicatedStorage.Core.System.CustomParty)
end)

local HERO_KEYS = { "Kris", "Susie", "Ralsei", "Noelle", "Knight", "Gerson", "Tenna" }
local STAT_KEYS = { "Attack", "Defense", "Magic", "HP" }

local function GetHeroKeyOptions()
    local result, seen = {}, {}
    local function add(name)
        if type(name) == "string" and name ~= "" and not seen[name] then
            seen[name] = true
            table.insert(result, name)
        end
    end
    for _, k in ipairs(HERO_KEYS) do
        add(k)
    end
    pcall(function()
        local Heroes = require(ReplicatedStorage.Core.Data.Heroes)
        if type(Heroes) == "table" then
            for _, def in pairs(Heroes) do
                if type(def) == "table" then
                    local key = rawget(def, "Key") or rawget(def, "Name")
                    if type(key) == "string" then
                        add(key)
                    elseif type(def[1]) == "string" then
                        add(def[1])
                    end
                end
            end
        end
    end)
    pcall(function()
        if PartyModule and type(PartyModule.Set) == "function" then
            local chapter = PartyModule.Set(1) or PartyModule.Set()
            if type(chapter) == "table" and type(chapter.Templates) == "table" then
                for key in pairs(chapter.Templates) do
                    if type(key) == "string" then
                        add(key)
                    end
                end
            end
        end
    end)
    table.sort(result)
    return result
end

local function GetItemNameOptions()
    local result, seen = {}, {}
    local function add(name)
        if type(name) == "string" and name ~= "" and not seen[name] then
            seen[name] = true
            table.insert(result, name)
        end
    end
    pcall(function()
        if not ItemsModule then
            return
        end
        local function collectFromSet(set)
            if type(set) ~= "table" then
                return
            end
            for _, def in pairs(set) do
                if type(def) == "table" then
                    local n = rawget(def, "Name") or rawget(def, "SetFor")
                    if type(n) == "string" then
                        add(n)
                    end
                end
            end
        end
        if type(ItemsModule.Sets) == "table" then
            for _, set in pairs(ItemsModule.Sets) do
                collectFromSet(set)
            end
        end
        if type(ItemsModule.SetFor) == "function" then
            for ch = 1, 5 do
                collectFromSet(ItemsModule.SetFor(ch))
            end
        end
    end)
    table.sort(result)
    if #result == 0 then
        result = { "Dark Candy", "ReviveMint", "TensionBit", "Top Cake" }
    end
    return result
end

local function FindLiveRosters()
    local rosters = {}
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "table" and type(rawget(v, "Members")) == "table" then
                local members = v.Members
                local ok = false
                for _, m in pairs(members) do
                    if type(m) == "table" and type(rawget(m, "Key")) == "string" and rawget(m, "MaxHP") ~= nil then
                        ok = true
                        break
                    end
                end
                if ok then
                    table.insert(rosters, v)
                end
            end
        end
    end)
    return rosters
end

local function FindLiveInventories()
    local invs = {}
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "table" and type(rawget(v, "Inventory")) == "table" then
                local inv = v.Inventory
                local looksLike = true
                local n = 0
                for i, id in ipairs(inv) do
                    n += 1
                    if type(id) ~= "number" and type(id) ~= "string" then
                        looksLike = false
                        break
                    end
                end
                if looksLike then
                    table.insert(invs, inv)
                end
            end
        end
    end)
    return invs
end

local function GetArmorOptions()
    local options = { "None" }
    local seen = { ["None"] = true }
    pcall(function()
        if not PartyModule then
            return
        end
        local ids = nil
        if type(PartyModule.ArmorIds) == "function" then
            ids = PartyModule.ArmorIds()
        end
        if type(ids) == "table" then
            for _, id in ipairs(ids) do
                local def = nil
                if type(PartyModule.ArmorDef) == "function" then
                    def = PartyModule.ArmorDef(id)
                end
                local name = type(def) == "table" and tostring(rawget(def, "Name") or id) or tostring(id)
                if not seen[name] then
                    seen[name] = true
                    table.insert(options, name)
                end
            end
        end
        if type(PartyModule.Set) == "function" then
            local set = PartyModule.Set()
            local armors = type(set) == "table" and rawget(set, "Armors") or nil
            if type(armors) == "table" then
                for id, def in pairs(armors) do
                    local name = type(def) == "table" and tostring(rawget(def, "Name") or id) or tostring(id)
                    if not seen[name] then
                        seen[name] = true
                        table.insert(options, name)
                    end
                end
            end
        end
    end)
    table.sort(options, function(a, b)
        if a == "None" then return true end
        if b == "None" then return false end
        return a < b
    end)
    return options
end

local function ResolveArmorId(name)
    name = tostring(name or "")
    if name == "" or name == "None" then
        return 0
    end
    local resolved = 0
    pcall(function()
        if PartyModule and type(PartyModule.ArmorIdByName) == "function" then
            resolved = PartyModule.ArmorIdByName(name) or 0
        end
        if (not resolved or resolved == 0) and PartyModule and type(PartyModule.Set) == "function" then
            local set = PartyModule.Set()
            local armors = type(set) == "table" and rawget(set, "Armors") or nil
            if type(armors) == "table" then
                for id, def in pairs(armors) do
                    if type(def) == "table" and tostring(rawget(def, "Name")) == name then
                        resolved = id
                        break
                    end
                end
            end
        end
    end)
    return resolved or 0
end

local function AssignArmorToActor(actorKey, armor1Name, armor2Name)
    actorKey = tostring(actorKey or "")
    if actorKey == "" then
        return false
    end
    local id1 = ResolveArmorId(armor1Name)
    local id2 = ResolveArmorId(armor2Name)
    local changed = 0
    pcall(function()
        for _, actors in pairs(getgc(true)) do
            if type(actors) ~= "table" then
                continue
            end
            local roster = rawget(actors, "Roster")
            if type(roster) ~= "table" then
                continue
            end
            local members = rawget(roster, "Members")
            if type(members) ~= "table" then
                continue
            end
            for _, member in ipairs(members) do
                if type(member) == "table" and rawget(member, "Key") == actorKey then
                    local armor = rawget(member, "Armor")
                    if type(armor) ~= "table" then
                        armor = {}
                        rawset(member, "Armor", armor)
                    end
                    rawset(armor, 1, id1)
                    rawset(armor, 2, id2)
                    changed += 1
                end
            end
        end
    end)
    return changed > 0
end

local function ChangePartyActor(fromKey, toKey)
    fromKey = tostring(fromKey or "")
    toKey = tostring(toKey or "")
    if fromKey == "" or toKey == "" then
        return false, "Pick both Actors."
    end
    if fromKey == toKey then
        return false, "Source and target are the same."
    end
    if not PartyModule or type(PartyModule.NewMember) ~= "function" then
        return false, "Party module is unavailable."
    end
    if not getgc then
        return false, "Live battle data is unavailable."
    end

    local ActorsModule = nil
    pcall(function()
        ActorsModule = require(ReplicatedStorage.Core.Combat.Actors)
    end)

    local changedMembers = {}
    local changed = 0
    local unsupported = false
    local liveRosters = {}
    local seenRosters = {}

    pcall(function()
        for _, actors in pairs(getgc(true)) do
            if type(actors) ~= "table" then
                continue
            end
            local roster = rawget(actors, "Roster")
            local heroes = rawget(actors, "Heroes")
            if type(roster) == "table"
                and type(rawget(roster, "Members")) == "table"
                and type(heroes) == "table"
                and not seenRosters[roster] then
                seenRosters[roster] = true
                table.insert(liveRosters, roster)
            end
        end
    end)

    local function copyMemberTemplate(
        member, template, slot, oldHp, oldDown, oldSwooned,
        oldHurt, oldDefending, oldActing, oldAction,
        oldPending, oldOwner, oldFaceOverride
    )
        local currentMaxHP = tonumber(rawget(member, "MaxHP")) or 1
        for field, value in pairs(template) do
            rawset(member, field, value)
        end
        local newMaxHP = tonumber(rawget(member, "MaxHP")) or currentMaxHP
        rawset(member, "Slot", slot)
        rawset(member, "Owner", oldOwner)
        rawset(member, "HP", math.clamp(tonumber(oldHp) or newMaxHP, 0, newMaxHP))
        rawset(member, "Down", oldDown == true)
        rawset(member, "Swooned", oldSwooned == true)
        rawset(member, "Hurt", oldHurt == true)
        rawset(member, "Defending", oldDefending == true)
        rawset(member, "Acting", oldActing == true)
        rawset(member, "Action", oldAction)
        rawset(member, "Pending", oldPending)
        rawset(member, "FaceOverride", oldFaceOverride)
    end

    for _, roster in ipairs(liveRosters) do
        local members = rawget(roster, "Members")
        if type(members) ~= "table" then
            continue
        end
        local chapter = tonumber(rawget(roster, "Chapter")) or 1
        for slot, member in ipairs(members) do
            if type(member) ~= "table"
                or rawget(member, "Key") ~= fromKey
                or changedMembers[member] then
                continue
            end
            local memberSlot = tonumber(rawget(member, "Slot")) or slot
            local memberChapter = tonumber(rawget(member, "Chapter")) or chapter
            local okTemplate, template = pcall(PartyModule.NewMember, toKey, memberSlot, memberChapter)
            if not okTemplate or type(template) ~= "table" then
                unsupported = true
                continue
            end
            local oldHp = rawget(member, "HP")
            local oldDown = rawget(member, "Down")
            local oldSwooned = rawget(member, "Swooned")
            local oldHurt = rawget(member, "Hurt")
            local oldDefending = rawget(member, "Defending")
            local oldActing = rawget(member, "Acting")
            local oldAction = rawget(member, "Action")
            local oldPending = rawget(member, "Pending")
            local oldOwner = rawget(member, "Owner")
            local oldFaceOverride = rawget(member, "FaceOverride")
            copyMemberTemplate(
                member, template, memberSlot,
                oldHp, oldDown, oldSwooned, oldHurt, oldDefending,
                oldActing, oldAction, oldPending, oldOwner, oldFaceOverride
            )
            changedMembers[member] = true
            changed += 1
            pcall(function()
                for _, actors in pairs(getgc(true)) do
                    if type(actors) ~= "table" then
                        continue
                    end
                    if rawget(actors, "Roster") ~= roster then
                        continue
                    end
                    local heroes = rawget(actors, "Heroes")
                    if type(heroes) ~= "table" then
                        continue
                    end
                    local hero = rawget(heroes, memberSlot)
                    if type(hero) ~= "table" then
                        continue
                    end
                    rawset(hero, "Member", member)
                    rawset(hero, "SpriteSet", nil)
                    rawset(hero, "ArmedSprite", nil)
                    rawset(hero, "ArmedNamespace", nil)
                    rawset(hero, "ShownSprite", nil)
                    rawset(hero, "ShownNamespace", nil)
                    rawset(hero, "CastSprite", nil)
                    rawset(hero, "TraceLast", nil)
                    local fight = rawget(actors, "Fight")
                    local heroOverrides = type(fight) == "table" and rawget(fight, "HeroOverrides") or nil
                    local targetOverride = type(heroOverrides) == "table" and rawget(heroOverrides, toKey) or nil
                    rawset(hero, "NormalSprite", type(targetOverride) == "table" and rawget(targetOverride, "Normal") or nil)
                    rawset(hero, "NormalNamespace", nil)
                    if type(actors.ResetHeroSprite) == "function" then
                        pcall(function()
                            actors:ResetHeroSprite(toKey)
                        end)
                    elseif ActorsModule and type(ActorsModule.ResetHeroSprite) == "function" then
                        pcall(function()
                            ActorsModule.ResetHeroSprite(actors, toKey)
                        end)
                    end
                    if type(actors.SetHeroState) == "function" then
                        pcall(function()
                            actors:SetHeroState(memberSlot, "Idle")
                        end)
                    end
                    if type(actors.WarmSelectFlash) == "function" then
                        pcall(function()
                            actors:WarmSelectFlash()
                        end)
                    end
                end
            end)
        end
    end

    if changed > 0 then
        pcall(function()
            if CustomPartyModule
                and type(CustomPartyModule.Get) == "function"
                and type(CustomPartyModule.Set) == "function" then
                local party = CustomPartyModule.Get()
                if type(party) == "table" then
                    local edited = false
                    for i, key in ipairs(party) do
                        if key == fromKey then
                            party[i] = toKey
                            edited = true
                        end
                    end
                    if edited then
                        CustomPartyModule.Set(party)
                    end
                end
            end
        end)
    end

    if changed == 0 then
        if unsupported then
            return false, toKey .. " is not available in the current battle chapter."
        end
        return false, "No live battle actor with Key " .. fromKey .. " was found. Enter a fight first."
    end
    return true, "Changed " .. fromKey .. " -> " .. toKey .. " (" .. tostring(changed) .. " member(s))."
end

local function ApplyInfiniteInventory(on)
    PinksState.InfiniteInventory = on == true
    pcall(function()
        if not ItemsModule then
            return
        end
        if on then
            if rawget(ItemsModule, "_SWOriginalMaxSlots") == nil then
                rawset(ItemsModule, "_SWOriginalMaxSlots", ItemsModule.MaxSlots)
            end
            ItemsModule.MaxSlots = 9999
        else
            local original = rawget(ItemsModule, "_SWOriginalMaxSlots")
            if type(original) == "number" then
                ItemsModule.MaxSlots = original
            else
                ItemsModule.MaxSlots = 12
            end
        end
    end)
end

local function SpawnItemByName(itemName)
    itemName = tostring(itemName or "")
    if itemName == "" then
        return false, "empty"
    end

    local itemId = nil
    pcall(function()
        if ItemsModule and type(ItemsModule.IdByName) == "function" then
            itemId = ItemsModule.IdByName(itemName)
        end
    end)
    if not itemId then
        pcall(function()
            if not ItemsModule or type(ItemsModule.Sets) ~= "table" then
                return
            end
            for _, set in pairs(ItemsModule.Sets) do
                if type(set) == "table" then
                    for id, def in pairs(set) do
                        if type(def) == "table" then
                            local n = rawget(def, "Name") or rawget(def, "SetFor")
                            if n == itemName then
                                itemId = id
                                return
                            end
                        end
                    end
                end
            end
        end)
    end
    if not itemId then
        return false, "missing"
    end

    local maxSlots = 12
    pcall(function()
        if ItemsModule and type(ItemsModule.MaxSlots) == "number" then
            maxSlots = ItemsModule.MaxSlots
        end
    end)
    if PinksState.InfiniteInventory then
        maxSlots = 9999
        pcall(function()
            if ItemsModule then
                ItemsModule.MaxSlots = 9999
            end
        end)
    end

    local invs = FindLiveInventories()
    if #invs == 0 then
        return false, "noinv"
    end

    local added = 0
    local anyFull = false
    for _, inv in ipairs(invs) do
        if #inv < maxSlots then
            table.insert(inv, itemId)
            added += 1
        else
            anyFull = true
        end
    end

    if added == 0 and anyFull then
        return false, "full"
    end
    if added == 0 then
        return false, "noinv"
    end
    return true, "ok"
end

local function GetEnemyKeyOptions()
    local options = {}
    local seen = {}
    local function add(name)
        if type(name) == "string" and name ~= "" and not seen[name] then
            seen[name] = true
            table.insert(options, name)
        end
    end
    pcall(function()
        local Actors = require(ReplicatedStorage.Core.Combat.Actors)
        local enemies = rawget(Actors, "Enemies")
        if type(enemies) == "table" then
            for key in pairs(enemies) do
                if type(key) == "string" then
                    add(key)
                end
            end
        end
    end)
    pcall(function()
        local fights = {
            "King", "Jevil", "Spamton", "SpamtonNeo", "Tenna",
            "Knight", "Gerson", "Pink", "Berdly2", "TitanSpawn", "Aqua"
        }
        for _, name in ipairs(fights) do
            add(name)
        end
    end)
    table.sort(options)
    if #options == 0 then
        options = { "King", "Jevil", "Spamton", "Knight", "Gerson", "Tenna", "Pink" }
    end
    return options
end

local function GetWeaponOptions()
    local options = { "None" }
    local seen = { ["None"] = true }
    pcall(function()
        if not PartyModule then
            return
        end
        local ids = nil
        if type(PartyModule.WeaponIds) == "function" then
            ids = PartyModule.WeaponIds()
        end
        if type(ids) == "table" then
            for _, id in ipairs(ids) do
                local def = nil
                if type(PartyModule.WeaponDef) == "function" then
                    def = PartyModule.WeaponDef(id)
                end
                local name = type(def) == "table" and tostring(rawget(def, "Name") or id) or tostring(id)
                if not seen[name] then
                    seen[name] = true
                    table.insert(options, name)
                end
            end
        end
        if type(PartyModule.Set) == "function" then
            local set = PartyModule.Set()
            local weapons = type(set) == "table" and rawget(set, "Weapons") or nil
            if type(weapons) == "table" then
                for id, def in pairs(weapons) do
                    local name = type(def) == "table" and tostring(rawget(def, "Name") or id) or tostring(id)
                    if not seen[name] then
                        seen[name] = true
                        table.insert(options, name)
                    end
                end
            end
        end
    end)
    table.sort(options, function(a, b)
        if a == "None" then return true end
        if b == "None" then return false end
        return a < b
    end)
    return options
end

local function ResolveWeaponId(name)
    name = tostring(name or "")
    if name == "" or name == "None" then
        return 0
    end
    local resolved = 0
    pcall(function()
        if PartyModule and type(PartyModule.WeaponIdByName) == "function" then
            resolved = PartyModule.WeaponIdByName(name) or 0
        end
        if (not resolved or resolved == 0) and PartyModule and type(PartyModule.Set) == "function" then
            local set = PartyModule.Set()
            local weapons = type(set) == "table" and rawget(set, "Weapons") or nil
            if type(weapons) == "table" then
                for id, def in pairs(weapons) do
                    if type(def) == "table" and tostring(rawget(def, "Name")) == name then
                        resolved = id
                        break
                    end
                end
            end
        end
    end)
    return resolved or 0
end

local function AssignWeaponToActor(actorKey, weaponName)
    actorKey = tostring(actorKey or "")
    if actorKey == "" then
        return false
    end
    local wid = ResolveWeaponId(weaponName)
    local changed = 0
    pcall(function()
        for _, actors in pairs(getgc(true)) do
            if type(actors) ~= "table" then
            else
                local roster = rawget(actors, "Roster")
                if type(roster) == "table" and type(rawget(roster, "Members")) == "table" then
                    for _, member in ipairs(rawget(roster, "Members")) do
                        if type(member) == "table" and rawget(member, "Key") == actorKey then
                            rawset(member, "Weapon", wid)
                            changed = changed + 1
                        end
                    end
                end
            end
        end
    end)
    return changed > 0
end

local function ForceBattlePartyDefend(battle)
    if type(battle) ~= "table" then
        return false
    end

    local roster = rawget(battle, "Roster")
    local members = type(roster) == "table" and rawget(roster, "Members") or nil

    if type(members) ~= "table" then
        return false
    end

    local changed = false

    for _, member in ipairs(members) do
        if type(member) == "table"
            and rawget(member, "Down") ~= true
            and rawget(member, "Swooned") ~= true then

            rawset(member, "Defending", true)
            changed = true
        end
    end

    return changed
end

local AutoDefendHooksInstalled = false

local function InstallAutoDefendOnBattle(battle)
    if type(battle) ~= "table" then
        return
    end

    if rawget(battle, "_SWAutoDefendHook") == true then
        return
    end

    local original = battle.StartEnemyTurn
    if type(original) ~= "function" then
        return
    end

    rawset(battle, "_SWAutoDefendHook", true)

    rawset(battle, "StartEnemyTurn", function(self, ...)
        local result = original(self, ...)

        if PinksState.AutoDefendParty then
            ForceBattlePartyDefend(self)
        end

        return result
    end)
end

local function InstallAutoDefendHooks()
    if not TurnSystemModule then
        pcall(function()
            TurnSystemModule = require(ReplicatedStorage.Core.Combat.TurnSystem)
        end)
    end

    if not TurnSystemModule then
        return
    end

    local originalNew = rawget(TurnSystemModule, "_SWOriginalNew")

    if type(originalNew) ~= "function"
        and type(TurnSystemModule.New) == "function" then

        originalNew = TurnSystemModule.New
        rawset(TurnSystemModule, "_SWOriginalNew", originalNew)
    end

    if type(originalNew) == "function"
        and not AutoDefendHooksInstalled then

        TurnSystemModule.New = function(...)
            local battle = originalNew(...)
            InstallAutoDefendOnBattle(battle)
            return battle
        end

        AutoDefendHooksInstalled = true
    end

    local battle = FindLiveBattleController(true)
    if battle then
        InstallAutoDefendOnBattle(battle)
    end
end

local function AutoDefendPartyStep()
end

local function ApplyAutoDefendParty(on)
    PinksState.AutoDefendParty = on == true
    if PinksState.AutoDefendParty then
        InstallAutoDefendHooks()
    end
end


local function ApplyShowEnemyHP(on)
    PinksState.ShowEnemyHP = on == true
    pcall(function()
        local Config = GetConfig()
        if Config and type(Config.Debug) == "table" then
            rawset(Config.Debug, "ShowEnemyHP", on == true)
        end
        for _, ctrl in pairs(getgc(true)) do
            if type(ctrl) == "table" and type(rawget(ctrl, "RulesFor")) == "function" then
                local fight = rawget(ctrl, "Fight")
                if type(fight) == "table" then
                    rawset(fight, "HideEnemyHP", on ~= true and rawget(fight, "HideEnemyHP") or false)
                    if on then
                        rawset(fight, "HideEnemyHP", false)
                    end
                end
            end
            if type(ctrl) == "table" and rawget(ctrl, "HideEnemyHP") ~= nil then
                if on then
                    rawset(ctrl, "HideEnemyHP", false)
                end
            end
        end
    end)
end

local GersonStealHooked = false
local OriginalGersonStealBegin = nil

local function ApplyAntiStealItems(on)
    PinksState.AntiStealItems = on == true
    pcall(function()
        local mod = require(ReplicatedStorage.Fights.Gerson.GersonItemSteal)
        if type(mod) ~= "table" then
            return
        end
        if not GersonStealHooked then
            OriginalGersonStealBegin = mod.Begin
            GersonStealHooked = true
        end
        if type(OriginalGersonStealBegin) ~= "function" then
            return
        end
        mod.Begin = function(...)
            if PinksState.AntiStealItems then
                return nil
            end
            return OriginalGersonStealBegin(...)
        end
    end)
end

local function GetMusicTrackOptions()
    local options = {}
    pcall(function()
        local folder = game:GetService("SoundService"):FindFirstChild("Music")
        if folder then
            for _, child in ipairs(folder:GetChildren()) do
                if child:IsA("Sound") then
                    table.insert(options, child.Name)
                end
            end
        end
    end)
    table.sort(options)
    if #options == 0 then
        options = { "MenuTheme" }
    end
    return options
end

local function IsInFightNow()
    local found = false
    pcall(function()
        for _, ctrl in pairs(getgc(true)) do
            if type(ctrl) == "table" then
                local state = rawget(ctrl, "State")
                local roster = rawget(ctrl, "Roster")
                if type(roster) == "table" and type(rawget(roster, "Members")) == "table" then
                    if state ~= nil or rawget(ctrl, "Enemies") ~= nil or rawget(ctrl, "Fight") ~= nil then
                        found = true
                        break
                    end
                end
            end
        end
    end)
    return found
end

local function SwapMusicTrack(trackName)
    if not IsInFightNow() then
        return false
    end
    trackName = tostring(trackName or "")
    if trackName == "" then
        return false
    end
    local ok = false
    pcall(function()
        local Music = require(ReplicatedStorage.Core.Audio.Music)
        if type(Music) == "table" then
            if PinksState.DefaultMusicTrack == nil then
                local cur = rawget(Music, "Current")
                if cur and typeof(cur) == "Instance" then
                    PinksState.DefaultMusicTrack = cur.Name
                end
            end
            if type(Music.Play) == "function" then
                Music.Play(trackName)
                ok = true
            end
        end
    end)
    if not ok then
        pcall(function()
            local folder = game:GetService("SoundService"):FindFirstChild("Music")
            if not folder then
                return
            end
            for _, child in ipairs(folder:GetChildren()) do
                if child:IsA("Sound") then
                    child:Stop()
                end
            end
            local target = folder:FindFirstChild(trackName)
            if target and target:IsA("Sound") then
                if PinksState.DefaultMusicTrack == nil then
                    PinksState.DefaultMusicTrack = trackName
                end
                target.TimePosition = 0
                target:Play()
                ok = true
            end
        end)
    end
    return ok
end

local function GoDefaultMusicTrack()
    if not IsInFightNow() then
        return false
    end
    local name = PinksState.DefaultMusicTrack
    if type(name) ~= "string" or name == "" then
        return false
    end
    return SwapMusicTrack(name)
end

local function ChangeActorStat(actorKey, statName, amount)
    actorKey = tostring(actorKey or "")
    statName = tostring(statName or "")
    amount = tonumber(amount)
    if actorKey == "" or statName == "" or amount == nil then
        return false, "Pick Actor, Stat and Amount."
    end

    local allowed = {
        Attack = true, Defense = true, Magic = true, HP = true,
        BaseAttack = true, BaseDefense = true, BaseMagic = true,
    }
    if not allowed[statName] then
        return false, "Unsupported stat: " .. statName
    end

    local changed = 0
    local rosters = FindLiveRosters()
    for _, roster in ipairs(rosters) do
        for _, member in ipairs(roster.Members) do
            if type(member) == "table" and rawget(member, "Key") == actorKey then
                rawset(member, statName, amount)
                if statName == "HP" then
                    local maxhp = rawget(member, "MaxHP")
                    if type(maxhp) == "number" and amount > maxhp then
                        rawset(member, "MaxHP", amount)
                    end
                end
                if statName == "Attack" and rawget(member, "BaseAttack") ~= nil then
                    rawset(member, "BaseAttack", amount)
                end
                if statName == "Defense" and rawget(member, "BaseDefense") ~= nil then
                    rawset(member, "BaseDefense", amount)
                end
                if statName == "Magic" and rawget(member, "BaseMagic") ~= nil then
                    rawset(member, "BaseMagic", amount)
                end
                changed += 1
            end
        end
    end

    pcall(function()
        if CustomPartyModule and type(CustomPartyModule.SetFightStats) == "function" then
            local patch = {}
            if statName == "Attack" or statName == "Defense" or statName == "Magic" or statName == "MaxHP" then
                patch[statName] = amount
                CustomPartyModule.SetFightStats(actorKey, { [1] = patch })
            end
        end
    end)

    if changed == 0 then
        return false, "No live party member with Key " .. actorKey .. " found. Enter a fight first."
    end
    return true, actorKey .. "." .. statName .. " = " .. tostring(amount) .. " (" .. tostring(changed) .. ")"
end

local TurnSystemModule = nil
local KrisMagicHooksInstalled = false

pcall(function()
    TurnSystemModule = require(ReplicatedStorage.Core.Combat.TurnSystem)
end)

local function ForceKrisMagicButton(turnSystem)
    local roster = turnSystem and rawget(turnSystem, "Roster")
    local members = roster and rawget(roster, "Members")
    if type(members) ~= "table" then
        return
    end

    for _, member in pairs(members) do
        if type(member) == "table" and rawget(member, "Key") == "Kris" then
            rawset(member, "MagicButton", true)
        end
    end
end

local function InstallKrisMagicHooks()
    if KrisMagicHooksInstalled or not TurnSystemModule then
        return
    end

    local originalStepMenu = rawget(TurnSystemModule, "_PinkOriginalStepMenu")
    if type(originalStepMenu) ~= "function" and type(TurnSystemModule.StepMenu) == "function" then
        originalStepMenu = TurnSystemModule.StepMenu
        rawset(TurnSystemModule, "_PinkOriginalStepMenu", originalStepMenu)
    end

    local originalEnterSpell = rawget(TurnSystemModule, "_PinkOriginalEnterSpell")
    if type(originalEnterSpell) ~= "function" and type(TurnSystemModule.EnterSpell) == "function" then
        originalEnterSpell = TurnSystemModule.EnterSpell
        rawset(TurnSystemModule, "_PinkOriginalEnterSpell", originalEnterSpell)
    end

    local originalRefreshUi = rawget(TurnSystemModule, "_PinkOriginalRefreshUi")
    if type(originalRefreshUi) ~= "function" and type(TurnSystemModule.RefreshUi) == "function" then
        originalRefreshUi = TurnSystemModule.RefreshUi
        rawset(TurnSystemModule, "_PinkOriginalRefreshUi", originalRefreshUi)
    end

    if originalStepMenu then
        TurnSystemModule.StepMenu = function(self, ...)
            ForceKrisMagicButton(self)
            return originalStepMenu(self, ...)
        end
    end

    if originalRefreshUi then
        TurnSystemModule.RefreshUi = function(self, ...)
            ForceKrisMagicButton(self)
            return originalRefreshUi(self, ...)
        end
    end

    if originalEnterSpell then
        TurnSystemModule.EnterSpell = function(self, ...)
            ForceKrisMagicButton(self)
            return originalEnterSpell(self, ...)
        end
    end

    KrisMagicHooksInstalled = true
end

InstallKrisMagicHooks()

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
            shield:Press(nil, desired, {}, true, true)
        else
            rawset(shield, "IdealDir", desired)
            rawset(shield, "Just", 6)
        end

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
                    rawset(item, "Buffer", 2)
                elseif perfect and con == 1 and hurtFlash == 0 and explode == 0 and type(x) == "number" and x < 330 then
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
            local maxScore = tonumber(rawget(v, "MaxScore")) or 1000
            rawset(v, "Score", maxScore)
            if rawget(v, "AddScore") ~= nil then
                rawset(v, "AddScore", 0)
            end
            rawset(v, "MaxScore", maxScore)
            if rawget(v, "ScoreHold") ~= nil then
                rawset(v, "ScoreHold", false)
            end
            changed += 1
        end
    end)

    return changed > 0
end

local function ApplySoulSpeedToSoul(soul, speed)
    if type(soul) ~= "table" then
        return false
    end
    local changed = false
    for _, key in ipairs({ "Speed", "MoveSpeed" }) do
        local current = rawget(soul, key)
        if type(current) == "number" then
            local backup = "_SWSoulSpeedOriginal_" .. key
            if rawget(soul, backup) == nil then
                rawset(soul, backup, current)
            end
            local original = tonumber(rawget(soul, backup)) or current
            rawset(soul, key, original * speed)
            changed = true
        end
    end
    return changed
end

local function ApplySoulSpeedNow()
    local battle = FindLiveBattleController(false)
    if type(battle) ~= "table" then
        return false
    end
    local speed = tonumber(PinksState.SoulSpeed) or 1
    if speed < 0.1 then speed = 0.1 end
    if speed > 5 then speed = 5 end
    local changed = false
    ForEachLiveSoul(battle, function(soul)
        SoulSpeedCache[soul] = true
        if ApplySoulSpeedToSoul(soul, speed) then
            changed = true
        end
    end)
    return changed
end

local function RestoreSoulSpeedNow()
    for soul in pairs(SoulSpeedCache) do
        if type(soul) == "table" then
            for _, key in ipairs({ "Speed", "MoveSpeed" }) do
                local backup = "_SWSoulSpeedOriginal_" .. key
                local original = rawget(soul, backup)
                if type(original) == "number" then
                    rawset(soul, key, original)
                    rawset(soul, backup, nil)
                end
            end
        end
    end
    SoulSpeedCache = setmetatable({}, { __mode = "k" })
end

local function ChangeSoulModeNow(mode)
    mode = tostring(mode or "Default")
    if mode ~= "Default" and mode ~= "Yellow" and mode ~= "Purple" then
        mode = "Default"
    end
    PinksState.SoulMode = mode
    local battle = FindLiveBattleController(false)
    if type(battle) ~= "table" then
        return false
    end
    local changed = false
    pcall(function()
        local SoulModes = require(ReplicatedStorage.Core.Combat.SoulModes)
        ForEachLiveSoul(battle, function(soul)
            for _, method in ipairs({ "SetMode", "ChangeMode", "SetSoulMode", "ChangeSoulMode" }) do
                local fn = rawget(soul, method)
                if type(fn) == "function" then
                    pcall(function()
                        fn(soul, mode)
                    end)
                    changed = true
                    return
                end
            end
            for _, field in ipairs({ "Mode", "SoulMode", "CurrentMode" }) do
                if rawget(soul, field) ~= nil then
                    rawset(soul, field, mode)
                    changed = true
                    break
                end
            end
        end)
        if type(SoulModes) == "table" then
            for _, method in ipairs({ "SetMode", "ChangeMode", "SetSoulMode", "ChangeSoulMode" }) do
                local fn = rawget(SoulModes, method)
                if type(fn) == "function" then
                    pcall(function()
                        fn(SoulModes, mode)
                    end)
                    changed = true
                    break
                end
            end
        end
    end)
    return changed
end

local RemoveHitboxAccumulator = 0
local GrazingSoulAccumulator = 0

local GrazingSoulCache = setmetatable({}, { __mode = "k" })

local GenericAccumulator = 0
local DateAccumulator = 0
local AttackAccumulator = 0
local DateAnswerAccumulator = 0
local AutoDateAccumulator = 0

local YellowSoulStep
local SuperChargeSusieStep
local AutoDateAnswersStep
local FreeSpellsTensionHold
local GiveCustomDoki

RunService.Heartbeat:Connect(function(dt)
    local needTP = PinksState.TPInfinite
    local needHP = PinksState.HPInfinite
    local needGod = PinksState.GodMode
    local needClear = PinksState.DeleteStinky
    local needDefend = false
    local needDumb = PinksState.DumbAttack
    local needDate = PinksState.DateFreezeTime
    local needYellow = PinksState.AutoSpamShots or PinksState.NoChargeShots
    local needSusie = PinksState.SuperChargeSusieAct
    local needAutoDate = PinksState.AutoDateAnswers
    local needFreeSpellTP = PinksState.FreeSpells

    if not (needTP or needHP or needGod or needClear or needDefend or needDumb or needDate or needYellow or needSusie or needAutoDate or needFreeSpellTP) then
        GenericAccumulator = 0
        DateAccumulator = 0
        AttackAccumulator = 0
        return
    end

    if needClear or needGod or needTP or needHP or needDefend then
        GenericAccumulator += dt
        local tickRate = 1
        if needClear then
            tickRate = 0.2
        elseif needGod then
            tickRate = 0.5
        elseif needTP or needHP then
            tickRate = 0.75
        else
            tickRate = 0.8
        end
        if GenericAccumulator >= tickRate then
            GenericAccumulator = 0
            if needTP then
                local battle = LiveBattleCache.Battle
                if type(battle) == "table" and type(rawget(battle, "Tension")) == "number" then
                    local max = GetTensionMax()
                    local tmax = tonumber(rawget(battle, "TensionMax")) or max
                    if tmax > 0 then
                        rawset(battle, "Tension", math.min(max, tmax))
                    end
                end
            end
            if needGod then
                ApplyGodModeLive()
            end
            if needHP then
                LightPartyHPFull()
            end
            if needClear then
                LightClearAttacks()
            end
            if needDefend then
                AutoDefendPartyStep()
            end
        end
    else
        GenericAccumulator = 0
    end

    if needDate then
        DateAccumulator += dt
        if DateAccumulator >= 0.35 then
            DateAccumulator = 0
            DateFreezeTimeStep()
        end
    else
        DateAccumulator = 0
    end

    if needDumb then
        AttackAccumulator = (AttackAccumulator or 0) + dt
        if AttackAccumulator >= 0.3 then
            AttackAccumulator = 0
            DumbAttackStep()
        end
    else
        AttackAccumulator = 0
    end

    if needYellow then
        YellowSoulStep()
    end

    if needSusie then
        SuperChargeSusieStep()
    end

    if needAutoDate then
        AutoDateAccumulator = (AutoDateAccumulator or 0) + dt
        if AutoDateAccumulator >= 0.25 then
            AutoDateAccumulator = 0
            AutoDateAnswersStep()
        end
    else
        AutoDateAccumulator = 0
    end

    if needFreeSpellTP then
        FreeSpellsTensionHold()
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

local YellowSpamPhase = -1

local YellowSpamNext = 0
local YellowSpamPulseUntil = 0

local function GetSpamtonNeoYellowControllers(battle)
    if type(battle) ~= "table" then
        return nil, nil, nil
    end

    local fight = rawget(battle, "Fight")
    if type(fight) ~= "table" then
        return nil, nil, nil
    end

    local fid = tostring(rawget(fight, "Id") or rawget(fight, "Name") or "")
    if fid ~= "SpamtonNeo" and not string.find(string.lower(fid), "spamtonneo", 1, true) then
        return nil, nil, nil
    end

    local fightState = rawget(battle, "FightState")
    if type(fightState) ~= "table" then
        return nil, nil, nil
    end

    local scene = rawget(fightState, "LiveScene")
    if type(scene) ~= "table" then
        return fightState, nil, nil
    end

    local neo = rawget(scene, "Neo")
    if type(neo) ~= "table" then
        return fightState, scene, nil
    end

    local yellow = rawget(neo, "Yellow")
    if type(yellow) ~= "table" then
        return fightState, scene, nil
    end

    return fightState, scene, yellow
end

local function GetYellowControllerForOwner(yellow, owner)
    if type(yellow) ~= "table" then
        return nil
    end

    if rawget(yellow, "Soul") ~= nil then
        local soul = rawget(yellow, "Soul")
        if type(soul) == "table" and rawget(soul, "Owner") == owner then
            return yellow
        end
        return nil
    end

    for _, controller in pairs(yellow) do
        if type(controller) == "table" then
            local soul = rawget(controller, "Soul")
            if type(soul) == "table" and rawget(soul, "Owner") == owner then
                return controller
            end
        end
    end

    return nil
end

local function PrimeYellowBigShot(controller)
    if type(controller) ~= "table" then
        return
    end

    rawset(controller, "Hold", math.huge)
    rawset(controller, "Charged", true)
end

local function MakeBigShotInput(input)
    local output = table.clone(input)
    output.Pressed = table.clone(type(input.Pressed) == "table" and input.Pressed or {})
    output.Released = table.clone(type(input.Released) == "table" and input.Released or {})
    output.Confirm = false
    output.Pressed.Confirm = false
    output.Released.Confirm = true
    return output
end

local function ResetYellowChargeControllers(yellow)
    if type(yellow) ~= "table" then
        return
    end

    local entries = yellow
    if rawget(yellow, "Hold") ~= nil or rawget(yellow, "Soul") ~= nil or rawget(yellow, "Charged") ~= nil then
        entries = { yellow }
    end

    for _, controller in pairs(entries) do
        if type(controller) == "table" then
            rawset(controller, "Hold", 0)
            rawset(controller, "HoldFrames", 0)
            rawset(controller, "Charged", false)
            rawset(controller, "Held", false)
        end
    end
end

local function GetFreshSpamtonNeoBattle()
    local battle = FindLiveBattleController(true)
    if type(battle) ~= "table" then
        return nil
    end

    local fight = rawget(battle, "Fight")
    if type(fight) ~= "table" then
        return nil
    end

    local fid = string.lower(tostring(rawget(fight, "Id") or rawget(fight, "Name") or ""))
    if not string.find(fid, "spamtonneo", 1, true) then
        return nil
    end

    return battle
end

local function EnsureYellowInputHook(battle)
    if type(battle) ~= "table" then
        return
    end

    local b = rawget(battle, "Battle")
    if type(b) ~= "table" then
        return
    end

    if rawget(b, "_SWYellowInputHook") == true then
        return
    end

    local originalInput = b.ControllerInput
    if type(originalInput) ~= "function" then
        return
    end

    rawset(b, "_SWYellowInputHook", true)

    b.ControllerInput = function(self, owner)
        local input = originalInput(self, owner)
        if type(input) ~= "table" then
            return input
        end

        if not (PinksState.AutoSpamShots or PinksState.NoChargeShots) then
            return input
        end

        local currentBattle = GetFreshSpamtonNeoBattle()
        local _, _, yellow = GetSpamtonNeoYellowControllers(currentBattle)
        local controller = GetYellowControllerForOwner(yellow, owner)
        if type(controller) ~= "table" then
            return input
        end

        if type(input.Pressed) ~= "table" then
            input.Pressed = {}
        end
        if type(input.Released) ~= "table" then
            input.Released = {}
        end

        if PinksState.AutoSpamShots then
            local now = os.clock()
            if now >= YellowSpamNext then
                YellowSpamNext = now + 0.18
                YellowSpamPulseUntil = now + 0.035
            end

            if now < YellowSpamPulseUntil then
                PrimeYellowBigShot(controller)
                input.Confirm = true
                input.Pressed.Confirm = true
                input.Released.Confirm = false
            end
        elseif PinksState.NoChargeShots then
            local confirm = input.Confirm == true or input.Pressed.Confirm == true
            ResetYellowChargeControllers(yellow)
            if confirm then
                PrimeYellowBigShot(controller)
                input.Confirm = true
                input.Pressed.Confirm = true
                input.Released.Confirm = false
            end
        end

        return input
    end

    YellowInputHookInstalled = true
end

YellowSoulStep = function()
    if not (PinksState.AutoSpamShots or PinksState.NoChargeShots) then
        return
    end

    local battle = GetFreshSpamtonNeoBattle()
    if type(battle) ~= "table" then
        return
    end

    local fightState, scene, yellow = GetSpamtonNeoYellowControllers(battle)
    if type(fightState) ~= "table" or type(scene) ~= "table" or type(yellow) ~= "table" then
        return
    end

    if PinksState.NoChargeShots then
        ResetYellowChargeControllers(yellow)
    end

    EnsureYellowInputHook(battle)
end

SuperChargeSusieStep = function()
    if not PinksState.SuperChargeSusieAct then
        return
    end

    local battle = GetFreshSpamtonNeoBattle()
    if type(battle) ~= "table" then
        return
    end

    local fightState = rawget(battle, "FightState")
    if type(fightState) ~= "table" then
        return
    end

    rawset(fightState, "BigShotCount", 20)
end

local function FindBestDateChoice(state)
    if type(state) ~= "table" then
        return nil
    end
    local correct = rawget(state, "ChoiceIsCorrect")
    if type(correct) == "table" then
        for idx, val in pairs(correct) do
            if val == 1 or val == true then
                return tonumber(idx) or idx
            end
        end
    end
    local bySlot = rawget(state, "CorrectBySlot")
    if type(bySlot) == "table" then
        for idx, val in pairs(bySlot) do
            if val == 1 or val == true then
                return tonumber(idx) or idx
            end
        end
    end
    return rawget(state, "CorrectChoiceIndex") or 0
end

AutoDateAnswersStep = function()
    if not PinksState.AutoDateAnswers then
        return
    end

    local state = GetPinkDateStateSafe(false)

    if not state then
        state = GetPinkDateStateSafe(true)
    end

    if not state then
        return
    end

    local con = rawget(state, "Con")
    local drawCon = rawget(state, "DrawBoxCon")
    local selected = rawget(state, "ChoiceSelected")

    if con ~= 2 then
        return
    end

    if drawCon ~= 0 and drawCon ~= nil then
        if drawCon ~= 0 then
            return
        end
    end

    if type(selected) == "number" and selected >= 0 then
        return
    end

    local best = FindBestDateChoice(state)
    if best == nil then
        return
    end

    pcall(function()
        rawset(state, "DrawBoxSelected", best)
        rawset(state, "DrawBoxCon", 2)
        rawset(state, "OffsetTimer", 0)
    end)
end

GiveCustomDoki = function(amount)
    amount = tonumber(amount) or 0

    local battle = FindLiveBattleController(true)
    if type(battle) ~= "table" then
        return false
    end

    local fight = rawget(battle, "Fight")
    if type(fight) ~= "table" then
        return false
    end

    local fid = tostring(rawget(fight, "Id") or rawget(fight, "Name") or "")
    if fid ~= "Pink" and not string.find(string.lower(fid), "pink") then
        return false
    end

    local state = rawget(battle, "FightState")
    if type(state) ~= "table" then
        return false
    end

    local maxDoki = tonumber(rawget(state, "DokiMax")) or 100
    rawset(state, "Doki", math.clamp(amount, 0, maxDoki))
    return true
end

local function GiveCustomMercy(amount)
    amount = tonumber(amount) or 0
    local battle = FindLiveBattleController(true)
    if type(battle) ~= "table" then
        return
    end
    pcall(function()
        local enemies = rawget(battle, "Enemies")
        if type(enemies) == "table" then
            for _, enemy in pairs(enemies) do
                if type(enemy) == "table" then
                    local maxm = 100
                    local def = rawget(enemy, "Def")
                    if type(def) == "table" and type(rawget(def, "MercyMax")) == "number" then
                        maxm = rawget(def, "MercyMax")
                    end
                    if type(battle.AddMercy) == "function" then
                        local cur = tonumber(rawget(enemy, "Mercy")) or 0
                        battle:AddMercy(enemy, amount - cur)
                    else
                        rawset(enemy, "Mercy", math.clamp(amount, 0, maxm))
                    end
                end
            end
        end
        if type(rawget(battle, "Mercy")) == "number" then
            rawset(battle, "Mercy", amount)
        end
        if type(battle.RefreshUi) == "function" then
            battle:RefreshUi()
        end
    end)
end

local function SafeCreate(callback, title)
    local ok = pcall(callback)
    return ok
end

local Window
do
    local okWin, winOrErr = pcall(function()
        return WindUI:CreateWindow({
    NewElements = true,
    Title = "Deltarune Fight | SW",
    Icon = "https://raw.githubusercontent.com/HttpsZXY/PinkBomb/main/Assets/Icon.png",
    Folder = "DeltaruneSW",
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
        Title = "Deltarune Fight | SW",
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
    end)
    if okWin and type(winOrErr) == "table" then
        Window = winOrErr
    else
        return
    end
end

pcall(function()
    Window:Tag({
        Title = "3.0.0",
        Icon = "wrench",
        Color = Orange,
        Border = true,
    })
end)

local MainSection = Window:Section({
    Title = "Main",
    Opened = true,
})

local FeaturesSection = Window:Section({
    Title = "Features",
    Opened = true,
})

local SettingsSection = Window:Section({
    Title = "Settings",
    Opened = true,
})

SafeCreate(function()
    local Tab = MainSection:Tab({
        Title = "Home",
        Icon = "info",
    })

    local Information = Tab:Section({
        Title = "Information",
        Opened = true,
    })

    Information:Paragraph({
        Title = "Support Executors",
        Desc = "Mobile Exploits\n[OK] Delta (deltaexploits.dev) - Main recommendation for mobile. Turn off Verify Teleports if you face rejoining bugs.\n[OK] Codex (codex.lol) - Fully operational and running the UI without issues.\n\nmacOS Exploits\n[OK] Opiumware (opiumware.today) - Top choice selected by the development team.\n[OK] Hydrogen (hydrogen.lat) - 100% stable execution with full features.\n[OK] Macsploit (raptor.fun) - Works perfectly.\n\nWindows Exploits\n[OK] Volt (voltbz.net) - Highly recommended for smooth farm performance.\n[OK] Madium (getmadium.net) - Excellent support for automation functions.\n[OK] Real (realest.gg) - Confirmed working with the entire script framework.\n[OK] Velocity (getvelocity.llc) - Fully compatible with the Script.\n[OK] Potassium (potassium.pro) - Runs the script smoothly.\n[~] Solara (getsolara.dev) - Good keyless alternative; a few premium features might fail due to missing API functions.\n[X] Xeno (xeno.onl) - Extremely unstable and poorly optimized. Skip this one completely.",
    })

    Information:Space()

    Information:Paragraph({
        Title = "Supported Games",
        Desc = "[OK] Funhouse\n[OK] Deltarune Fight",
    })

    Information:Space()

    Information:Paragraph({
        Title = "Developers",
        Desc = "Hs (Https), Gh (GourdyHalloway), Nc (Nexocat).",
    })

    Information:Divider()

    Information:Paragraph({
        Title = "Official Server",
        Desc = "Join our official Discord server:\nhttps://discord.gg/y3cHAw6Bb4",
        Image = "https://github.com/HttpsZXY/PinkBomb/blob/main/Assets/IconServer.png",
        ImageSize = 80,
    })
end, "Home")

SafeCreate(function()
    local Tab = FeaturesSection:Tab({
        Title = "Automatic",
        Icon = "refresh-cw",
    })

    local General = Tab:Section({
        Title = "General",
        Opened = true,
    })
)

    General:Space()

    General:Toggle({
        Title = "TP Infinite",
        Value = false,
        Flag = "TPInfinite",
        Callback = function(value)
            PinksState.TPInfinite = value == true
            if PinksState.TPInfinite then
                FindLiveBattleController(false)
                local battle = LiveBattleCache.Battle
                if type(battle) == "table" and type(rawget(battle, "Tension")) == "number" then
                    rawset(battle, "Tension", GetTensionMax())
                end
            end
        end,
    })

    General:Space()

    General:Button({
        Title = "TP Max",
        Icon = "zap",
        Callback = function()
            ForceTP(GetTensionMax())
        end,
    })

    General:Space()

    General:Input({
        Title = "TP Giver",
        Placeholder = "Amount...",
        Value = "",
        Flag = "TPGiver",
        Callback = function(value)
            PinksState._TPAmount = tonumber(value) or 0
        end,
    })

    General:Space()

    General:Button({
        Title = "Give TP",
        Icon = "plus",
        Callback = function()
            ForceTP(PinksState._TPAmount or 10)
        end,
    })

    General:Space()

    General:Button({
        Title = "Unlock TP",
        Icon = "unlock",
        Callback = function()
            UnlockTPNow()
        end,
    })

    General:Divider()

    General:Toggle({
        Title = "HP Infinite",
        Value = false,
        Flag = "HPInfinite",
        Callback = function(value)
            PinksState.HPInfinite = value == true
            if PinksState.HPInfinite then
                FindLiveBattleController(false)
            end
        end,
    })

    General:Space()

    General:Input({
        Title = "HP Giver",
        Placeholder = "Amount...",
        Value = "",
        Flag = "HPGiver",
        Callback = function(value)
            PinksState._HPAmount = tonumber(value) or 0
        end,
    })

    General:Space()

    General:Button({
        Title = "Give HP",
        Icon = "plus",
        Callback = function()
            local amount = PinksState._HPAmount or 0
            if amount <= 0 then
                return
            end
            GivePartyHP(amount)
        end,
    })

    General:Space()

    General:Button({
        Title = "Heal Party",
        Icon = "heart-pulse",
        Color = Green,
        Callback = function()
            RescanCache("hard")
            ForcePartyHPFull()
        end,
    })

    General:Divider()

    General:Toggle({
        Title = "God-Mode",
        Desc = "You're invincible but you won't be able to win TP by just grazing attacks",
        Value = false,
        Flag = "GodMode",
        Callback = function(value)
            PinksState.GodMode = value == true
            ApplyGodMode(PinksState.GodMode)
        end,
    })

    General:Space()

    General:Button({
        Title = "Max Mercy",
        Icon = "heart",
        Color = Green,
        Callback = function()
            MaxMercyNow()
        end,
    })

    General:Space()

    General:Input({
        Title = "Custom Mercy",
        Placeholder = "Amount 0-100...",
        Value = "100",
        Flag = "CustomMercy_v1",
        Callback = function(value)
            PinksState.CustomMercyAmount = tonumber(value) or 0
        end,
    })

    General:Space()

    General:Button({
        Title = "Give Mercy",
        Icon = "plus",
        Color = Green,
        Callback = function()
            GiveCustomMercy(PinksState.CustomMercyAmount or 100)
        end,
    })

    local Fight = Tab:Section({
        Title = "Fight",
        Opened = true,
    })
)

    Fight:Space()
)

    Fight:Space()

    Fight:Button({
        Title = "Instant Complete Fight",
        Icon = "check-circle",
        Color = Green,
        Callback = function()
            InstantWinNow()
        end,
    })

    Fight:Space()

    Fight:Toggle({
        Title = "Delete Attacks",
        Desc = "It eliminates the attacks that enemies launch at you, but it may not work on some enemies",
        Value = false,
        Flag = "DeleteStinkyAttacks",
        Callback = function(value)
            PinksState.DeleteStinky = value == true
            if PinksState.DeleteStinky then
                local battle = FindLiveBattleController(true)
                if battle then
                    InstallDeleteAttackHooks(battle)
                end
                ClearBulletsNow()
            end
        end,
    })

    Fight:Space()
)

    Fight:Space()
)

    Fight:Space()

    Fight:Button({
        Title = "Skip Enemy's Turn",
        Icon = "skip-forward",
        Callback = function()
            SkipEnemyTurnNow()
        end,
    })

    Fight:Space()

    Fight:Toggle({
        Title = "Visual Hitbox",
        Value = false,
        Flag = "VisualHitbox",
        Callback = function(value)
            PinksState.VisualHitbox = value == true
            SetVisualHitboxes(PinksState.VisualHitbox)
        end,
    })

    Fight:Space()

    Fight:Toggle({
        Title = "Auto Defend Party",
        Desc = "When it's the enemy's turn, the actors will block, regardless of whether you've already chosen an attack or something else; they will always block after you make your choice",
        Value = false,
        Flag = "AutoDefendParty_v1",
        Callback = function(value)
            ApplyAutoDefendParty(value == true)
        end,
    })

    local Spells = Tab:Section({
        Title = "Spells / Acts",
        Opened = true,
    })

    Spells:Toggle({
        Title = "Free Spells",
        Value = false,
        Flag = "FreeSpells_v3",
        Callback = function(value)
            PinksState.FreeSpells = value == true
            ApplyFreeSpells(PinksState.FreeSpells)
        end,
    })

    Spells:Space()

    Spells:Toggle({
        Title = "Free Acts",
        Value = false,
        Flag = "FreeActs_v3",
        Callback = function(value)
            PinksState.FreeActs = value == true
            ApplyFreeActs(PinksState.FreeActs)
        end,
    })

    Spells:Divider()

    Spells:Dropdown({
        Title = "Actor",
        Values = GetRealActorOptions(),
        Value = PinksState.AssignActor or "Kris",
        Flag = "AssignActor_v3",
        Callback = function(option)
            PinksState.AssignActor = option
        end,
    })

    Spells:Space()

    Spells:Dropdown({
        Title = "Spell",
        Values = GetRealSpellOptions(),
        Value = PinksState.AssignSpell or "RudeBuster",
        Flag = "AssignSpell_v3",
        Callback = function(option)
            PinksState.AssignSpell = option
        end,
    })

    Spells:Space()

    Spells:Button({
        Title = "Assign Spell to Actor",
        Icon = "plus",
        Color = Green,
        Callback = function()
            AddSpellToActor(PinksState.AssignActor or "Kris", PinksState.AssignSpell or "RudeBuster")
        end,
    })

    Spells:Divider()

    Spells:Dropdown({
        Title = "Act",
        Values = ScanActRegistry(false),
        Value = PinksState.AssignAct or "Check",
        Flag = "AssignAct_v3",
        Callback = function(option)
            PinksState.AssignAct = option
        end,
    })

    Spells:Space()

    Spells:Button({
        Title = "Add Act to Actor",
        Icon = "plus",
        Color = Green,
        Callback = function()
            AddActToActor(PinksState.AssignActor or "Kris", PinksState.AssignAct or "Check")
        end,
    })

    local Inventory = Tab:Section({
        Title = "Inventory",
        Opened = true,
    })

    Inventory:Dropdown({
        Title = "Spawn Item",
        Values = GetItemNameOptions(),
        Value = PinksState.SpawnItemName or "Dark Candy",
        SearchBarEnabled = true,
        Flag = "SpawnItemName_v1",
        Callback = function(option)
            PinksState.SpawnItemName = option
        end,
    })

    Inventory:Space()

    Inventory:Toggle({
        Title = "Infinite Inventory",
        Value = false,
        Flag = "InfiniteInventory_v1",
        Callback = function(value)
            ApplyInfiniteInventory(value == true)
        end,
    })

    Inventory:Space()

    Inventory:Button({
        Title = "Spawns Item",
        Icon = "package-plus",
        Color = Green,
        Callback = function()
            local ok, msg = SpawnItemByName(PinksState.SpawnItemName)
            if not ok and msg == "full" then
                pcall(function()
                    WindUI:Notify({
                        Title = "Full inventory!!",
                        Duration = 3,
                        Icon = "info",
                    })
                end)
            end
        end,
    })

    local Actors = Tab:Section({
        Title = "Actors",
        Opened = true,
    })

    Actors:Dropdown({
        Title = "Actors",
        Values = GetHeroKeyOptions(),
        Value = PinksState.PartyActorFrom or "Kris",
        SearchBarEnabled = true,
        Flag = "PartyActorFrom_v1",
        Callback = function(option)
            PinksState.PartyActorFrom = option
        end,
    })

    Actors:Space()

    Actors:Dropdown({
        Title = "Actor to Change",
        Values = GetHeroKeyOptions(),
        Value = PinksState.PartyActorTo or "Susie",
        SearchBarEnabled = true,
        Flag = "PartyActorTo_v1",
        Callback = function(option)
            PinksState.PartyActorTo = option
        end,
    })

    Actors:Space()

    Actors:Button({
        Title = "Change Actor",
        Icon = "user-round-cog",
        Color = Green,
        Callback = function()
            ChangePartyActor(PinksState.PartyActorFrom, PinksState.PartyActorTo)
        end,
    })

    local Stats = Tab:Section({
        Title = "Stats",
        Opened = true,
    })

    Stats:Dropdown({
        Title = "Actors",
        Values = GetHeroKeyOptions(),
        Value = PinksState.StatActor or "Kris",
        SearchBarEnabled = true,
        Flag = "StatActor_v1",
        Callback = function(option)
            PinksState.StatActor = option
        end,
    })

    Stats:Space()

    Stats:Dropdown({
        Title = "Stats",
        Values = STAT_KEYS,
        Value = PinksState.StatName or "Attack",
        Flag = "StatName_v1",
        Callback = function(option)
            PinksState.StatName = option
        end,
    })

    Stats:Space()

    Stats:Input({
        Title = "Amount",
        Placeholder = "Amount...",
        Value = tostring(PinksState.StatAmount or 999),
        Flag = "StatAmount_v1",
        Callback = function(value)
            PinksState.StatAmount = tonumber(value) or 0
        end,
    })

    Stats:Space()

    Stats:Button({
        Title = "Change Stat",
        Icon = "chart-no-axes-combined",
        Color = Green,
        Callback = function()
            ChangeActorStat(PinksState.StatActor, PinksState.StatName, PinksState.StatAmount)
        end,
    })

    local Equipment = Tab:Section({
        Title = "Equipment",
        Opened = true,
    })

    Equipment:Dropdown({
        Title = "Actor",
        Values = GetHeroKeyOptions(),
        Value = PinksState.ArmorActor or "Kris",
        SearchBarEnabled = true,
        Flag = "ArmorActor_v1",
        Callback = function(option)
            PinksState.ArmorActor = option
        end,
    })

    Equipment:Space()

    Equipment:Dropdown({
        Title = "Armor 1",
        Values = GetArmorOptions(),
        Value = "None",
        SearchBarEnabled = true,
        Flag = "Armor1_v1",
        Callback = function(option)
            PinksState.Armor1 = option
        end,
    })

    Equipment:Space()

    Equipment:Dropdown({
        Title = "Armor 2",
        Values = GetArmorOptions(),
        Value = "None",
        SearchBarEnabled = true,
        Flag = "Armor2_v1",
        Callback = function(option)
            PinksState.Armor2 = option
        end,
    })

    Equipment:Space()

    Equipment:Button({
        Title = "Assign To Actor",
        Icon = "shield",
        Color = Green,
        Callback = function()
            AssignArmorToActor(PinksState.ArmorActor, PinksState.Armor1, PinksState.Armor2)
        end,
    })

    Equipment:Divider()

    Equipment:Dropdown({
        Title = "Weapon Actor",
        Values = GetHeroKeyOptions(),
        Value = PinksState.WeaponActor or "Kris",
        SearchBarEnabled = true,
        Flag = "WeaponActor_v1",
        Callback = function(option)
            PinksState.WeaponActor = option
        end,
    })

    Equipment:Space()

    Equipment:Dropdown({
        Title = "Weapon",
        Values = GetWeaponOptions(),
        Value = "None",
        SearchBarEnabled = true,
        Flag = "WeaponName_v1",
        Callback = function(option)
            PinksState.WeaponName = option
        end,
    })

    Equipment:Space()

    Equipment:Button({
        Title = "Assign Weapon",
        Icon = "sword",
        Color = Green,
        Callback = function()
            AssignWeaponToActor(PinksState.WeaponActor, PinksState.WeaponName)
        end,
    })

    local Soul = Tab:Section({
        Title = "Soul",
        Opened = true,
    })

    Soul:Slider({
        Title = "Soul Speed",
        Step = 0.1,
        Value = {
            Min = 0.1,
            Max = 5,
            Default = PinksState.SoulSpeed or 1,
        },
        Flag = "SoulSpeed_v1",
        Callback = function(value)
            local speed = tonumber(value) or 1
            if speed < 0.1 then speed = 0.1 end
            if speed > 5 then speed = 5 end
            PinksState.SoulSpeed = speed
        end,
    })

    Soul:Space()

    Soul:Button({
        Title = "Apply Speed",
        Icon = "plus",
        Callback = function()
            ApplySoulSpeedNow()
        end,
    })

    Soul:Space()

    Soul:Button({
        Title = "Restore Speed",
        Icon = "plus",
        Callback = function()
            RestoreSoulSpeedNow()
        end,
    })

    Soul:Space()

    Soul:Dropdown({
        Title = "Soul Modes",
        Values = { "Default", "Yellow", "Purple" },
        Value = PinksState.SoulMode or "Default",
        Multi = false,
        AllowNone = false,
        Flag = "SoulMode_v1",
        Callback = function(option)
            if type(option) == "table" then
                option = option[1]
            end
            local mode = tostring(option or "Default")
            if mode ~= "Default" and mode ~= "Yellow" and mode ~= "Purple" then
                mode = "Default"
            end
            PinksState.SoulMode = mode
        end,
    })

    Soul:Space()

    Soul:Button({
        Title = "Change Souls",
        Icon = "heart",
        Callback = function()
            ChangeSoulModeNow(PinksState.SoulMode)
        end,
    })

    Soul:Space()

    Soul:Toggle({
        Title = "Free Soul",
        Desc = "Free your soul from the battle box and Soul modes, but it can sometimes glitch a little",
        Value = PinksState.FreeSoulToggle,
        Flag = "FreeSoul_v4",
        Callback = function(value)
            PinksState.FreeSoulToggle = value == true
            ApplyFreeSoul(PinksState.FreeSoulToggle)
        end,
    })

    pcall(function()
        Tab:Select()
    end)
end, "Automatic")

SafeCreate(function()
    local Tab = FeaturesSection:Tab({
        Title = "Boss / Mini-Boss",
        Icon = "swords",
    })

    local GeneralBoss = Tab:Section({
        Title = "General",
        Opened = true,
    })

    GeneralBoss:Toggle({
        Title = "Dumb Attacks",
        Desc = "It causes enemy attacks to go elsewhere; it may not work on some attacks or bosses",
        Value = false,
        Flag = "DumbAttack_v1",
        Callback = function(value)
            ApplyDumbAttack(value == true)
        end,
    })

    GeneralBoss:Space()

    GeneralBoss:Toggle({
        Title = "Show Enemy HP",
        Value = false,
        Flag = "ShowEnemyHP_v1",
        Callback = function(value)
            ApplyShowEnemyHP(value == true)
        end,
    })

    GeneralBoss:Divider()

    GeneralBoss:Dropdown({
        Title = "Tracks",
        Values = GetMusicTrackOptions(),
        Value = GetMusicTrackOptions()[1] or "MenuTheme",
        SearchBarEnabled = true,
        Flag = "MusicTrack_v1",
        Callback = function(option)
            PinksState.MusicTrack = option
        end,
    })

    GeneralBoss:Space()

    GeneralBoss:Button({
        Title = "Swap Track",
        Icon = "music",
        Color = Green,
        Callback = function()
            SwapMusicTrack(PinksState.MusicTrack)
        end,
    })

    GeneralBoss:Space()

    GeneralBoss:Button({
        Title = "Go to Default Track",
        Icon = "undo-2",
        Callback = function()
            GoDefaultMusicTrack()
        end,
    })

    local SpamtonNeo = Tab:Section({
        Title = "Spamton Neo",
        Opened = true,
    })

    SpamtonNeo:Toggle({
        Title = "Auto Spam Big Shots",
        Value = false,
        Flag = "AutoSpamShots_v1",
        Callback = function(value)
            PinksState.AutoSpamShots = value == true
            if PinksState.AutoSpamShots then
                YellowSpamNext = 0
                YellowSpamPulseUntil = 0
                YellowInputHookInstalled = false
            end
        end,
    })

    SpamtonNeo:Space()

    SpamtonNeo:Toggle({
        Title = "No Charge Big Shots",
        Value = false,
        Flag = "NoChargeShots_v1",
        Callback = function(value)
            PinksState.NoChargeShots = value == true
            if PinksState.NoChargeShots then
                YellowSpamNext = 0
                YellowSpamPulseUntil = 0
                YellowInputHookInstalled = false
            end
        end,
    })

    SpamtonNeo:Space()

    SpamtonNeo:Toggle({
        Title = "Super Charge Susie's Act",
        Value = false,
        Flag = "SuperChargeSusieAct_v1",
        Callback = function(value)
            PinksState.SuperChargeSusieAct = value == true
        end,
    })

    local Gerson = Tab:Section({
        Title = "Gerson",
        Opened = true,
    })

    Gerson:Toggle({
        Title = "Anti-Steal Items",
        Value = false,
        Flag = "AntiStealItems_v1",
        Callback = function(value)
            ApplyAntiStealItems(value == true)
        end,
    })

    Gerson:Space()

    Gerson:Toggle({
        Title = "Auto Parry",
        Value = false,
        Flag = "GersonShield_v4",
        Callback = function(value)
            PinksState.GersonShield = value == true
            GersonSceneCache.Scene = nil
            if PinksState.GersonShield then
                GetGersonSpearScene(true)
            end
        end,
    })

    Gerson:Space()

    Gerson:Toggle({
        Title = "Perfect Timing",
        Value = false,
        Flag = "GersonRudeTiming_v4",
        Callback = function(value)
            PinksState.GersonRudeTiming = value == true
        end,
    })

    Gerson:Space()

    Gerson:Toggle({
        Title = "Auto Timing Rude Buster",
        Value = false,
        Flag = "GersonAutoTiming_v4",
        Callback = function(value)
            PinksState.GersonAutoTiming = value == true
        end,
    })

    local Tenna = Tab:Section({
        Title = "Tenna",
        Opened = true,
    })

    Tenna:Button({
        Title = "Max Score",
        Icon = "trophy",
        Color = Green,
        Callback = function()
            TennaMaxScoreNow()
        end,
    })

    local Pink = Tab:Section({
        Title = "Pink",
        Opened = true,
    })

    Pink:Space()

    Pink:Toggle({
        Title = "Auto Date Answers",
        Value = false,
        Flag = "AutoDateAnswers_v1",
        Callback = function(value)
            PinksState.AutoDateAnswers = value == true
            if value then
                PinkDateCache.State = nil
            end
        end,
    })

    Pink:Space()

    Pink:Button({
        Title = "Max Doki Meter",
        Icon = "heart",
        Color = Green,
        Callback = function()
            MaxDokiMeterNow()
        end,
    })

    Pink:Space()

    Pink:Input({
        Title = "Custom Doki",
        Placeholder = "Amount...",
        Value = "100",
        Flag = "CustomDoki_v1",
        Callback = function(value)
            PinksState.CustomDokiAmount = tonumber(value) or 0
        end,
    })

    Pink:Space()

    Pink:Button({
        Title = "Give Doki",
        Icon = "heart",
        Color = Green,
        Callback = function()
            GiveCustomDoki(PinksState.CustomDokiAmount or 100)
        end,
    })

    Pink:Space()

    Pink:Toggle({
        Title = "Date Freeze Time",
        Value = false,
        Flag = "DateFreezeTime_v1",
        Callback = function(value)
            ApplyDateFreezeTime(value == true)
        end,
    })
end, "Boss / Mini-Boss")



SafeCreate(function()
    local Tab = SettingsSection:Tab({
        Title = "Settings",
        Icon = "settings",
    })

    local Saves = Tab:Section({
        Title = "Saves",
        Opened = true,
    })

    Saves:Input({
        Title = "Name",
        Placeholder = "Config name...",
        Value = "Default",
        Flag = "ConfigName",
        Callback = function(value)
            ConfigNameValue = tostring(value or "Default")
        end,
    })

    Saves:Space()

    Saves:Dropdown({
        Title = "File",
        Values = RefreshConfigList(),
        Value = "Default",
        Flag = "ConfigFile",
        Callback = function(option)
            ConfigNameValue = option
        end,
    })

    Saves:Space()

    Saves:Button({
        Title = "Save",
        Icon = "save",
        Color = Green,
        Callback = function()
            local name = ConfigNameValue
            if not name or name == "" then
                name = "Default"
            end
            SaveConfig(name)
        end,
    })

    Saves:Space()

    Saves:Button({
        Title = "Load",
        Icon = "download",
        Callback = function()
            local name = ConfigNameValue
            if not name or name == "" then
                name = "Default"
            end
            LoadConfig(name)
        end,
    })

    Saves:Space()

    Saves:Button({
        Title = "Delete",
        Icon = "trash-2",
        Color = Red,
        Callback = function()
            local name = ConfigNameValue
            if not name or name == "" or name == "Default" then
                return
            end
            DeleteConfig(name)
        end,
    })

    local UI = Tab:Section({
        Title = "UI",
        Opened = true,
    })

    UI:Dropdown({
        Title = "Theme",
        Values = {
            "Dark",
            "Light",
            "Rose",
            "Plant",
            "Indigo",
            "Sky",
            "Violet",
            "Amber",
        },
        Value = "Dark",
        Flag = "UIColor",
        Callback = function(theme)
            PinksState.UIColor = theme
            pcall(function()
                WindUI:SetTheme(theme)
            end)
        end,
    })
end, "Settings")

