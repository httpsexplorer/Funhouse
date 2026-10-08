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
    GersonAntiMiss = false,
    GersonAntiRude = false,
    FreeActs = false,
    ProceedSnowgrave = false,
    FreeSpells = false,
    DateFreezeTime = false,
    DumbAttack = false,
    AntiFailAutoAttack = false,
    AutoAttack = false,
    AutoSkipDialogue = false,
    SkipDateDialogue = false,
    SoulSpeed = 1,
    SoulMode = "Default",
    SoulSpeedApplied = false,
    SpamtonNeoHell = false,
    InstantCallNoelle = false,
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
    local battle = FindLiveBattleController(true)
    if type(battle) ~= "table" then
        return
    end
    pcall(function()
        local targets = {}
        local seen = {}
        local function add(enemy)
            if type(enemy) == "table" and not seen[enemy] then
                seen[enemy] = true
                table.insert(targets, enemy)
            end
        end
        add(rawget(battle, "Enemy"))
        local enemies = rawget(battle, "Enemies")
        if type(enemies) == "table" then
            for _, enemy in pairs(enemies) do
                add(enemy)
            end
        end
        local roster = rawget(battle, "Roster")
        if type(roster) == "table" then
            add(rawget(roster, "Enemy"))
            local rosterEnemies = rawget(roster, "Enemies")
            if type(rosterEnemies) == "table" then
                for _, enemy in pairs(rosterEnemies) do
                    add(enemy)
                end
            end
        end
        for _, enemy in ipairs(targets) do
            local def = rawget(enemy, "Def")
            local max = tonumber(rawget(enemy, "MercyMax"))
            if type(def) == "table" then
                max = tonumber(rawget(def, "MercyMax")) or max
            end
            max = max or 100
            rawset(enemy, "Mercy", max)
            if type(battle.AddMercy) == "function" then
                pcall(function()
                    battle:AddMercy(enemy, max)
                end)
            end
        end
        if type(battle.RefreshUi) == "function" then
            battle:RefreshUi()
        end
    end)
end

local function GiveCustomMercy(amount)
    amount = tonumber(amount) or 0
    local battle = FindLiveBattleController(true)
    if type(battle) ~= "table" then
        return
    end
    pcall(function()
        local targets = {}
        local seen = {}
        local function add(enemy)
            if type(enemy) == "table" and not seen[enemy] then
                seen[enemy] = true
                table.insert(targets, enemy)
            end
        end
        add(rawget(battle, "Enemy"))
        local enemies = rawget(battle, "Enemies")
        if type(enemies) == "table" then
            for _, enemy in pairs(enemies) do
                add(enemy)
            end
        end
        local roster = rawget(battle, "Roster")
        if type(roster) == "table" then
            add(rawget(roster, "Enemy"))
            local rosterEnemies = rawget(roster, "Enemies")
            if type(rosterEnemies) == "table" then
                for _, enemy in pairs(rosterEnemies) do
                    add(enemy)
                end
            end
        end
        for _, enemy in ipairs(targets) do
            local def = rawget(enemy, "Def")
            local maxm = tonumber(rawget(enemy, "MercyMax"))
            if type(def) == "table" then
                maxm = tonumber(rawget(def, "MercyMax")) or maxm
            end
            maxm = maxm or 100
            local target = math.clamp(amount, 0, maxm)
            local current = tonumber(rawget(enemy, "Mercy")) or 0
            if type(battle.AddMercy) == "function" then
                pcall(function()
                    battle:AddMercy(enemy, target - current)
                end)
            end
            rawset(enemy, "Mercy", target)
        end
        if type(battle.RefreshUi) == "function" then
            battle:RefreshUi()
        end
    end)
end

FreeSpellsTensionHold = function()
    if not PinksState.FreeSpells then
        return
    end
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then
        return
    end
    local max = GetTensionMax()
    local tmax = tonumber(rawget(battle, "TensionMax")) or max
    if type(rawget(battle, "Tension")) == "number" then
        local cur = tonumber(rawget(battle, "Tension")) or 0
        if cur < tmax then
            rawset(battle, "Tension", tmax)
        end
    end
end


local SoulSpeedCache = {
    LastBattle = nil,
    Souls = {},
}

local AutoAttackHookCache = setmetatable({}, { __mode = "k" })
local GersonPatchCache = setmetatable({}, { __mode = "k" })
local DialogueHookCache = setmetatable({}, { __mode = "k" })

local function GetBattleId(battle)
    if type(battle) ~= "table" then
        return ""
    end
    local fight = rawget(battle, "Fight")
    if type(fight) ~= "table" then
        return ""
    end
    return tostring(rawget(fight, "Id") or rawget(fight, "Name") or "")
end

local function IsGersonBattle(battle)
    local id = string.lower(GetBattleId(battle))
    return id == "gerson" or string.find(id, "gerson", 1, true) ~= nil
end

local function IsSpamtonNeoBattle(battle)
    local id = string.lower(GetBattleId(battle))
    return id == "spamtonneo" or string.find(id, "spamtonneo", 1, true) ~= nil
end

local function ApplySoulSpeedToSoul(soul, speed)
    if type(soul) ~= "table" then
        return false
    end
    local changed = false
    local keys = { "Speed", "MoveSpeed", "MaxSpeed", "Velocity" }
    for _, key in ipairs(keys) do
        local current = rawget(soul, key)
        if type(current) == "number" then
            if rawget(soul, "_SWSoulSpeedOriginal_" .. key) == nil then
                rawset(soul, "_SWSoulSpeedOriginal_" .. key, current)
            end
            local original = tonumber(rawget(soul, "_SWSoulSpeedOriginal_" .. key)) or current
            rawset(soul, key, original * speed)
            changed = true
        end
    end
    return changed
end

local function ApplySoulSpeedNow()
    local battle = FindLiveBattleController(false)
    if type(battle) ~= "table" then
        return
    end
    SoulSpeedCache.LastBattle = battle
    ForEachLiveSoul(battle, function(soul)
        SoulSpeedCache.Souls[soul] = true
        ApplySoulSpeedToSoul(soul, PinksState.SoulSpeed or 1)
    end)
    PinksState.SoulSpeedApplied = true
end

local function RestoreSoulSpeedNow()
    for soul in pairs(SoulSpeedCache.Souls) do
        if type(soul) == "table" then
            for _, key in ipairs({ "Speed", "MoveSpeed", "MaxSpeed", "Velocity" }) do
                local original = rawget(soul, "_SWSoulSpeedOriginal_" .. key)
                if type(original) == "number" then
                    rawset(soul, key, original)
                    rawset(soul, "_SWSoulSpeedOriginal_" .. key, nil)
                end
            end
        end
    end
    SoulSpeedCache.Souls = {}
    PinksState.SoulSpeedApplied = false
end

local function ChangeSoulModeNow(mode)
    mode = tostring(mode or "Default")
    if mode ~= "Yellow" and mode ~= "Purple" and mode ~= "Default" then
        mode = "Default"
    end
    PinksState.SoulMode = mode
    pcall(function()
        local SoulModes = require(ReplicatedStorage.Core.Combat.SoulModes)
        local battle = FindLiveBattleController(false)
        local souls = {}
        if type(battle) == "table" then
            ForEachLiveSoul(battle, function(soul)
                table.insert(souls, soul)
            end)
        end
        for _, soul in ipairs(souls) do
            local methods = { "SetMode", "ChangeMode", "SetSoulMode", "ChangeSoulMode" }
            for _, method in ipairs(methods) do
                if type(rawget(soul, method)) == "function" then
                    pcall(function()
                        soul[method](soul, mode)
                    end)
                    break
                end
            end
        end
        for _, method in ipairs({ "SetMode", "ChangeMode", "SetSoulMode", "ChangeSoulMode" }) do
            if type(rawget(SoulModes, method)) == "function" then
                pcall(function()
                    SoulModes[method](SoulModes, mode)
                end)
            end
        end
    end)
end

local function InstallAutoAttackHook(battle)
    if type(battle) ~= "table" or AutoAttackHookCache[battle] then
        return
    end
    local original = rawget(battle, "ResolveRow")
    if type(original) ~= "function" then
        return
    end
    AutoAttackHookCache[battle] = original
    rawset(battle, "ResolveRow", function(self, row, failed, offset, ...)
        if PinksState.AutoAttack and type(row) == "table" and rawget(row, "Resolved") ~= true then
            return original(self, row, false, 0, ...)
        end
        return original(self, row, failed, offset, ...)
    end)
end

local function InstallGersonPatches(battle)
    if not IsGersonBattle(battle) then
        return
    end
    local targets = { GersonBodyModule, GersonRudeModule }
    for _, target in ipairs(targets) do
        if type(target) == "table" and not GersonPatchCache[target] then
            GersonPatchCache[target] = true
            for key, fn in pairs(target) do
                if type(key) == "string" and type(fn) == "function" then
                    local low = string.lower(key)
                    if PinksState.GersonAntiMiss and (string.find(low, "miss", 1, true) or string.find(low, "dodge", 1, true) or string.find(low, "evade", 1, true)) then
                        local original = fn
                        target[key] = function(...)
                            return false
                        end
                        rawset(target, "_SWOriginal_" .. key, original)
                    elseif PinksState.GersonAntiRude and (string.find(low, "reflect", 1, true) or string.find(low, "return", 1, true) or string.find(low, "bounce", 1, true)) then
                        local original = fn
                        target[key] = function(...)
                            return nil
                        end
                        rawset(target, "_SWOriginal_" .. key, original)
                    end
                end
            end
        end
    end
end

local function RestoreGersonPatches()
    for target in pairs(GersonPatchCache) do
        if type(target) == "table" then
            for key, original in pairs(target) do
                if type(key) == "string" and string.sub(key, 1, 13) == "_SWOriginal_" and type(original) == "function" then
                    local realKey = string.sub(key, 14)
                    if target[realKey] ~= nil then
                        target[realKey] = original
                    end
                    target[key] = nil
                end
            end
        end
        GersonPatchCache[target] = nil
    end
end

local function InstallDialogueHooks(battle)
    if type(battle) ~= "table" or DialogueHookCache[battle] then
        return
    end
    local dialogue = rawget(battle, "Dialogue") or rawget(battle, "Dialog")
    if type(dialogue) ~= "table" then
        return
    end
    DialogueHookCache[battle] = true
    for key, fn in pairs(dialogue) do
        if type(key) == "string" and type(fn) == "function" then
            local low = string.lower(key)
            if string.find(low, "advance", 1, true) or string.find(low, "next", 1, true) or string.find(low, "continue", 1, true) then
                local original = fn
                rawset(dialogue, "_SWOriginal_" .. key, original)
                rawset(dialogue, key, function(self, ...)
                    if PinksState.AutoSkipDialogue then
                        return original(self, ...)
                    end
                    return original(self, ...)
                end)
            end
        end
    end
end

local function AutoSkipDialogueStep()
    if not PinksState.AutoSkipDialogue then
        return
    end
    local battle = LiveBattleCache.Battle
    if type(battle) ~= "table" then
        battle = FindLiveBattleController(false)
    end
    if type(battle) ~= "table" then
        return
    end
    InstallDialogueHooks(battle)
    local dialogue = rawget(battle, "Dialogue") or rawget(battle, "Dialog")
    if type(dialogue) ~= "table" then
        return
    end
    for _, key in ipairs({ "Advance", "Next", "Continue", "Skip", "Finish" }) do
        local fn = rawget(dialogue, key)
        if type(fn) == "function" then
            pcall(function()
                fn(dialogue)
            end)
            break
        end
    end
end

local function SkipDateDialogueNow()
    local state = GetPinkDateStateSafe(true)
    if type(state) ~= "table" then
        return
    end
    for _, key in ipairs({ "DialogueDone", "DialogueFinished", "Finished", "Done" }) do
        if rawget(state, key) ~= nil then
            rawset(state, key, true)
        end
    end
    for _, key in ipairs({ "DialogueCon", "Con", "DialogueState", "State" }) do
        local value = rawget(state, key)
        if type(value) == "number" then
            rawset(state, key, math.max(value, 2))
        end
    end
end

local function SetSpamtonNeoHellNow()
    local battle = FindLiveBattleController(true)
    if not IsSpamtonNeoBattle(battle) then
        return
    end
    local state = rawget(battle, "FightState")
    local scene = type(state) == "table" and rawget(state, "LiveScene") or nil
    local changed = false
    local function apply(tbl)
        if type(tbl) ~= "table" then
            return
        end
        for key, value in pairs(tbl) do
            if type(key) == "string" and type(value) == "boolean" and string.find(string.lower(key), "hell", 1, true) then
                rawset(tbl, key, true)
                changed = true
            end
        end
    end
    apply(state)
    apply(scene)
    PinksState.SpamtonNeoHell = changed or PinksState.SpamtonNeoHell
end

local function TryInstantCallNoelle()
    local battle = FindLiveBattleController(true)
    if not IsSpamtonNeoBattle(battle) then
        return
    end
    local enemies = rawget(battle, "Enemies")
    local lowHp = false
    local enemyCount = 0
    if type(enemies) == "table" then
        for _, enemy in pairs(enemies) do
            if type(enemy) == "table" then
                enemyCount += 1
                local hp = tonumber(rawget(enemy, "HP"))
                local maxHp = tonumber(rawget(enemy, "MaxHP")) or tonumber(rawget(enemy, "HPMax"))
                if hp and maxHp and maxHp > 0 and hp / maxHp <= 0.02 then
                    lowHp = true
                end
            end
        end
    end
    if enemyCount == 0 then
        return
    end
    if not lowHp then
        return
    end
    local acts = rawget(battle, "Acts") or rawget(battle, "ActEntries") or rawget(battle, "AvailableActs")
    if type(acts) ~= "table" then
        return
    end
    for _, act in pairs(acts) do
        if type(act) == "table" then
            local key = string.lower(tostring(rawget(act, "Key") or rawget(act, "Name") or ""))
            if string.find(key, "noelle", 1, true) or string.find(key, "call", 1, true) then
                for _, method in ipairs({ "UseAct", "SelectAct", "ChooseAct", "PerformAct" }) do
                    local fn = rawget(battle, method)
                    if type(fn) == "function" then
                        pcall(function()
                            fn(battle, rawget(act, "Key") or rawget(act, "Name"))
                        end)
                        return
                    end
                end
            end
        end
    end
end

local function SkipFinalAttackNow()
    local battle = FindLiveBattleController(true)
    if type(battle) ~= "table" then
        return
    end
    pcall(function()
        if type(battle.StopWaves) == "function" then
            battle:StopWaves()
        end
        if type(battle.ClearBullets) == "function" then
            battle:ClearBullets()
        end
    end)
    pcall(function()
        for _, key in ipairs({ "FinalAttack", "Finale", "FinalAttackActive", "DoingFinalAttack" }) do
            if rawget(battle, key) ~= nil then
                rawset(battle, key, false)
            end
            local state = rawget(battle, "FightState")
            if type(state) == "table" and rawget(state, key) ~= nil then
                rawset(state, key, false)
            end
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

    Fight:Toggle({
        Title = "Anti-Fail Attack",
        Desc = "It automatically attacks perfectly for you no matter where it is, it will always Land a perfect attack",
        Value = false,
        Flag = "AntiFailAutoAttack_v1",
        Callback = function(value)
            ApplyAntiFailAutoAttack(value == true)
        end,
    })

    Fight:Space()

    Fight:Toggle({
        Title = "Auto Skip Dialogue",
        Desc = "Skips battle dialogue with a low-frequency event check",
        Value = false,
        Flag = "AutoSkipDialogue_v1",
        Callback = function(value)
            PinksState.AutoSkipDialogue = value == true
        end,
    })

    Fight:Space()

    Fight:Toggle({
        Title = "Auto Attack",
        Desc = "When you attack manually, the attack skillcheck is resolved perfectly",
        Value = false,
        Flag = "AutoAttack_v1",
        Callback = function(value)
            PinksState.AutoAttack = value == true
        end,
    })

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
            PinksState.SoulSpeed = tonumber(value) or 1
        end,
    })

    Soul:Space()

    Soul:Button({
        Title = "Apply Speed",
        Icon = "gauge",
        Callback = function()
            ApplySoulSpeedNow()
        end,
    })

    Soul:Space()

    Soul:Button({
        Title = "Restore Speed",
        Icon = "undo-2",
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
            PinksState.SoulMode = tostring(option or "Default")
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
        Title = "Free Souls",
        Desc = "Lets the soul move freely outside the normal battle box",
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

    GeneralBoss:Space()

    GeneralBoss:Button({
        Title = "Skip Final Attack",
        Icon = "skip-forward",
        Color = Green,
        Callback = function()
            SkipFinalAttackNow()
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

    SpamtonNeo:Space()

    SpamtonNeo:Button({
        Title = "Spamton neo (Hell mode)",
        Icon = "flame",
        Color = Red,
        Callback = function()
            PinksState.SpamtonNeoHell = true
            SetSpamtonNeoHellNow()
        end,
    })

    SpamtonNeo:Space()

    SpamtonNeo:Button({
        Title = "Instant Call Noelle",
        Icon = "phone-call",
        Color = Green,
        Callback = function()
            PinksState.InstantCallNoelle = true
            TryInstantCallNoelle()
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

    Gerson:Space()

    Gerson:Toggle({
        Title = "Anti-Miss Attack",
        Value = false,
        Flag = "GersonAntiMiss_v1",
        Callback = function(value)
            PinksState.GersonAntiMiss = value == true
            if not PinksState.GersonAntiMiss then
                RestoreGersonPatches()
            end
        end,
    })

    Gerson:Space()

    Gerson:Toggle({
        Title = "Anti-Back Rude Buster",
        Value = false,
        Flag = "GersonAntiRude_v1",
        Callback = function(value)
            PinksState.GersonAntiRude = value == true
            if not PinksState.GersonAntiRude then
                RestoreGersonPatches()
            end
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

    Pink:Button({
        Title = "Skip Date Dialogue",
        Icon = "message-square-off",
        Callback = function()
            SkipDateDialogueNow()
        end,
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

